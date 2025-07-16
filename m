Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AB9B07627
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 14:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DBC10E392;
	Wed, 16 Jul 2025 12:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S6y/kIIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFFF10E27E;
 Wed, 16 Jul 2025 12:50:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 92F94614A0;
 Wed, 16 Jul 2025 12:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A5CC4CEF0;
 Wed, 16 Jul 2025 12:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752670219;
 bh=4HH/7+uv1zqsTl9WSybY+wX55rpatVs4WGpQNqy2vsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S6y/kIIcjzK27Af//4JSBguOBglPSEovxHsYtB/8Wa8TcuG+tibQdWs4tKJhf9aOP
 QAhWvPID1sjc5OU2mMQb9ACaCNT5IdeOBz5k0wIeJAO/T9r4uexndr8qUP8MEEbi3c
 dTe/qm0ra4rVRBYhIHD27AIpyq4/UZP6a6a7eIqXxCbDBJY5X6QD8wu6Fyo0w5jff+
 N1TvHvPZt9X0nkpkjjZ/MZvJhZ7/uOfEIXdbsbVfM66dJO9/no+J46LR2mtkQUnF1Z
 5qQHUbsfXPgi0iUgQvHyGRr3hOr2igv2RsgHFDmA6AC+6L/QCLt+6CzcP5oEx0xWVl
 MwkenhVuOckEw==
From: Christian Brauner <brauner@kernel.org>
To: =?UTF-8?q?=E9=99=88=E6=B6=9B=E6=B6=9B=20Taotao=20Chen?=
 <chentaotao@didiglobal.com>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-block@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, chentao325@qq.com, frank.li@vivo.com,
 kernel test robot <lkp@intel.com>, tytso@mit.edu, hch@infradead.org,
 adilger.kernel@dilger.ca, willy@infradead.org, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com
Subject: Re: [PATCH v6 0/5] fs: refactor write_begin/write_end and add ext4
 IOCB_DONTCACHE support
Date: Wed, 16 Jul 2025 14:50:04 +0200
Message-ID: <20250716-reinigen-kleiden-c6bca9969819@brauner>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250716093559.217344-1-chentaotao@didiglobal.com>
References: <20250716093559.217344-1-chentaotao@didiglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628; i=brauner@kernel.org;
 h=from:subject:message-id; bh=4HH/7+uv1zqsTl9WSybY+wX55rpatVs4WGpQNqy2vsQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSUL2DOebyEZcbbPEnRU9cm911muHQr7+ucJ9+yLqz92
 xGumRJk2FHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCRDycY/hmy+tt+KF+b9IEz
 adGmKavzZK0ZP8zxW8RVWh8v7Gz5DKjCrHI2G9c7vWotdr9Yn+LdOyvn+O/Pcz7jwmwRuVzK3ZU
 HAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Jul 2025 09:36:01 +0000, 陈涛涛 Taotao Chen wrote:
> From: Taotao Chen <chentaotao@didiglobal.com>
> 
> This patch series refactors the address_space_operations write_begin()
> and write_end() callbacks to take const struct kiocb * as their first
> argument, allowing IOCB flags such as IOCB_DONTCACHE to propagate to the
> filesystem's buffered I/O path.
> 
> [...]

Applied to the vfs-6.17.misc branch of the vfs/vfs.git tree.
Patches in the vfs-6.17.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.17.misc

[1/5] drm/i915: Use kernel_write() in shmem object create
      https://git.kernel.org/vfs/vfs/c/e7b840fd4956
[2/5] drm/i915: Refactor shmem_pwrite() to use kiocb and write_iter
      https://git.kernel.org/vfs/vfs/c/048832a3f400
[3/5] fs: change write_begin/write_end interface to take struct kiocb *
      https://git.kernel.org/vfs/vfs/c/e9d8e2bf2320
[4/5] mm/pagemap: add write_begin_get_folio() helper function
      https://git.kernel.org/vfs/vfs/c/b799474b9aeb
[5/5] ext4: support uncached buffered I/O
      https://git.kernel.org/vfs/vfs/c/ae21c0c0ac56
