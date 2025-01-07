Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE07A0437B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18B510E401;
	Tue,  7 Jan 2025 14:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hoMwCWfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE52C10E401
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:57:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 550B35C6205;
 Tue,  7 Jan 2025 14:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF82C4CED6;
 Tue,  7 Jan 2025 14:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736261872;
 bh=DbzU733XgZnUEo05Q+osOhh3dvR7UWfP1ZibysEtpMs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hoMwCWfvwszkPz3mCFv7U2JOLU2f0D63hXzPv0KbxyViXQbvSDeF2okg0lZq7rBUm
 nG42+cJbiJkNp/CXmA2yaMjSHpl7N8tBGT9R3ZDh1NW38I5L87NoWT/6l8nWrJKFZq
 a6IGqkUVigEyI9N80iBYLxf6iXHvYHrtzQtLcF61w2aclB91sFC27nLTv1UkUm486i
 D4MsGQnY431RGh1B3p4GN/ey9dg3quSOsmukgIDYHKbPRkmAMWYeUPJuDuYfqma56t
 zyFLkbXKsQzRU2mODI93UfyTJIlVsradQun5fq3f0hiPOT7qyaRPcNYM7myRNsZPeB
 8KO6IDGFXaPdA==
From: Christian Brauner <brauner@kernel.org>
To: Christian Kujau <lists@nerdbynature.de>
Cc: Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] vbox: Enable VBOXGUEST and VBOXSF_FS on ARM64
Date: Tue,  7 Jan 2025 15:57:35 +0100
Message-ID: <20250107-halbwahrheiten-vordach-b6ba4d1f8aa4@brauner>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <7384d96c-2a77-39b0-2306-90129bae9342@nerdbynature.de>
References: <7384d96c-2a77-39b0-2306-90129bae9342@nerdbynature.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=brauner@kernel.org;
 h=from:subject:message-id; bh=DbzU733XgZnUEo05Q+osOhh3dvR7UWfP1ZibysEtpMs=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaTXOrwy/Mzq9V65J+pa7e0Jfw4xe/0L8uHSSNyuKLRZX
 XKS4JrGjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIk86mRkOHNAOED5ieSNFLee
 w1an/wm7XGC6M+/zNAmr0tmpQk3HnRj+SlV2cew/lfnouVSzzpp2liQ9a+NJRxu5rJXC385cZGD
 NCQA=
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

On Mon, 06 Jan 2025 16:32:05 +0100, Christian Kujau wrote:
> Now that VirtualBox is able to run as a host on arm64 (e.g. the Apple M3
> processors) we can enable VBOXSF_FS (and in turn VBOXGUEST) for this
> architecture. Tested with various runs of bonnie++ and dbench on an Apple
> MacBook Pro with the latest Virtualbox 7.1.4 r165100 installed.
> 
> 

Applied to the vfs-6.14.misc branch of the vfs/vfs.git tree.
Patches in the vfs-6.14.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.14.misc

[1/1] vbox: Enable VBOXGUEST and VBOXSF_FS on ARM64
      https://git.kernel.org/vfs/vfs/c/5cf8f938bf5c
