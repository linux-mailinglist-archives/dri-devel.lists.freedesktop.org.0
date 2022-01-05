Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6933F485587
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 16:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBF710FC4D;
	Wed,  5 Jan 2022 15:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EF410FC4D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 15:13:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9043161771;
 Wed,  5 Jan 2022 15:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56238C36AE3;
 Wed,  5 Jan 2022 15:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641395591;
 bh=csHd2/XILH40OtDlIaymp0IPflgaFvIcWeXacWTGf88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qIm66gBBLhBxMefhANoTb1PxtN7iaJ8FKqlY0bi88E2irezQd9yT6f26Xth+cC8dp
 Lej17FBhU8KKBDCE+PQdCdVnQQW+1aJS5wOR06l76gXG3b7x7MdxEtgswElM7eZXuB
 pQ8ee1pUlmh3Wf65OXlQyoXfIXAk1noEqLrfxEa0=
Date: Wed, 5 Jan 2022 16:13:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hridya Valsaraju <hridya@google.com>
Subject: Re: [PATCH] dma-buf: Move sysfs work out of DMA-BUF export/release
 path
Message-ID: <YdW1hPRvKYjfORvp@kroah.com>
References: <20220104235148.21320-1-hridya@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104235148.21320-1-hridya@google.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, keescook@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, kaleshsingh@google.com, surenb@google.com,
 tjmercier@google.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 04, 2022 at 03:51:48PM -0800, Hridya Valsaraju wrote:
> Recently, we noticed an issue where a process went into direct reclaim
> while holding the kernfs rw semaphore for sysfs in write(exclusive)
> mode. This caused processes who were doing DMA-BUF exports and releases
> to go into uninterruptible sleep since they needed to acquire the same
> semaphore for the DMA-BUF sysfs entry creation/deletion. In order to avoid
> blocking DMA-BUF export/release for an indeterminate amount of time
> while another process is holding the sysfs rw semaphore in exclusive
> mode, this patch moves the per-buffer sysfs file creation/deleteion to
> a kthread.
> 
> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> ---
>  drivers/dma-buf/dma-buf-sysfs-stats.c | 343 ++++++++++++++++++++++++--
>  include/linux/dma-buf.h               |  46 ++++
>  2 files changed, 366 insertions(+), 23 deletions(-)

Crazy, but if this works in your testing, it looks ok to me.  Nice work.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
