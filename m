Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E72B03A74
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 11:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EED810E433;
	Mon, 14 Jul 2025 09:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o7bKE20C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D5110E433;
 Mon, 14 Jul 2025 09:11:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 457A2A56F16;
 Mon, 14 Jul 2025 09:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6403C4CEED;
 Mon, 14 Jul 2025 09:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752484317;
 bh=nBAAdS/h14HP9PCoH6AZ+SV1+KPCQ3mc43HpXEsPKvA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o7bKE20CDPlKcHI0e/TC6KGBJLrWFb6B/a2488r6tyIou5DTxTnLIABvmNvKLFpXa
 7ihWDKxdO+vv/6dxAFhP+KNmK7biaOatcxOCFGnogbNAFbLIAlMfDckEtLV2ItloNd
 q+sgzKQhx9CjxrP8q9qMnwsebgfC2xO65g6gAWZtgvzGGgarDWPO+UCj1ATob1DSYy
 hB0b5IXoIRePk5yKXTPmpQl2MnaS+xpxe/mC4fHAMsZmTxp6rVoD6nDOCT+DHyi51T
 4PGbMRz/p7FqCOWASMEOE/MMeQNI6ZYPxHwhKlsQeEecnBP7GF1NJ8nqpzOWCDgaYb
 VWjmAtYCQd4xw==
From: Christian Brauner <brauner@kernel.org>
To: =?UTF-8?q?=E9=99=88=E6=B6=9B=E6=B6=9B=20Taotao=20Chen?=
 <chentaotao@didiglobal.com>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-block@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, chentao325@qq.com, frank.li@vivo.com,
 tytso@mit.edu, hch@infradead.org, adilger.kernel@dilger.ca,
 willy@infradead.org, jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com
Subject: Re: [PATCH v5 0/5] fs: refactor write_begin/write_end and add ext4
 IOCB_DONTCACHE support
Date: Mon, 14 Jul 2025 11:11:43 +0200
Message-ID: <20250714-tolerant-begreifbar-970f01d32a30@brauner>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250710101404.362146-1-chentaotao@didiglobal.com>
References: <20250710101404.362146-1-chentaotao@didiglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628; i=brauner@kernel.org;
 h=from:subject:message-id; bh=nBAAdS/h14HP9PCoH6AZ+SV1+KPCQ3mc43HpXEsPKvA=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSUnLzKYeyw62Dl9TVnpl9493JFlYSRQmE0u5D7zYaTH
 VYLqhZndZSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExkpQYjw6KZcwvUGF5FPO6s
 6GaL7nsjfX+TyxvnthUTtT43P/Z4kMLwP1l6jpx52reoUxda313fE28u3GfckRy1UKN5s9+nyff
 /MQIA
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

On Thu, 10 Jul 2025 10:14:06 +0000, 陈涛涛 Taotao Chen wrote:
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
      https://git.kernel.org/vfs/vfs/c/110ae5fb48ed
[2/5] drm/i915: Refactor shmem_pwrite() to use kiocb and write_iter
      https://git.kernel.org/vfs/vfs/c/dd09194ff58c
[3/5] fs: change write_begin/write_end interface to take struct kiocb *
      https://git.kernel.org/vfs/vfs/c/254a06118b31
[4/5] mm/pagemap: add write_begin_get_folio() helper function
      https://git.kernel.org/vfs/vfs/c/ff2219c021c5
[5/5] ext4: support uncached buffered I/O
      https://git.kernel.org/vfs/vfs/c/2677497bc6f4
