Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F1CD1129A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 09:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD9110E18A;
	Mon, 12 Jan 2026 08:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q1SSQl16";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7C510E18A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 08:20:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1198360231;
 Mon, 12 Jan 2026 08:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688E0C4AF0F;
 Mon, 12 Jan 2026 08:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1768206009;
 bh=OJIX75obaMOz/Rw970G0TtUx5AEZXgro07NB88e8eTc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q1SSQl16ggvR8LImiJHhEXcNxEIbgYeaISUse2VIeH9oncmpdDZW/N+TDTi7IsahG
 +pFPG6BVfSiVZVg2PsFDkBYtvXzxjnHMNK4Hyvgpc7uAQx49K/bbA5BXuYJ3J36WOT
 bPbFfX2MovL9rNkitUm7srVuEXKmUEGOLhVupSAg=
Date: Mon, 12 Jan 2026 09:20:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: stable@vger.kernel.org, srini@kernel.org, amahesh@gti.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [BUG] misc: fastrpc: possible double-free of cctx->remote_heap
Message-ID: <2026011208-anger-jurist-a101@gregkh>
References: <CAK+ZN9rJypDknnR0b5UVme6x9ABx_hCVtveTyJQT-x0ROpU1vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK+ZN9rJypDknnR0b5UVme6x9ABx_hCVtveTyJQT-x0ROpU1vw@mail.gmail.com>
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

On Mon, Jan 12, 2026 at 04:15:01PM +0800, Xingjing Deng wrote:
> While reviewing drivers/misc/fastrpc.c, I noticed a potential lifetime
> issue around struct fastrpc_buf *remote_heap;
> In fastrpc_init_create_static_process(), the error path err_map: frees
> fl->cctx->remote_heap but does not clear the pointer(set to NULL).
> Later, in fastrpc_rpmsg_remove(), the code frees cctx->remote_heap
> again if it is non-NULL.
> 
> Call paths (as I understand them)
> 
> 1) First free (ioctl error path):
> 
> fastrpc_fops.unlocked_ioctl → fastrpc_device_ioctl()
> FASTRPC_IOCTL_INIT_CREATE_STATIC → fastrpc_init_create_static_process()
> err_map: → fastrpc_buf_free(fl->cctx->remote_heap) (pointer not cleared)
> 
> 2) Second free (rpmsg remove path):
> 
> rpmsg driver .remove → fastrpc_rpmsg_remove()
> if (cctx->remote_heap) fastrpc_buf_free(cctx->remote_heap);
> 

Hi,

Please note, stable@vger is not the email address to be asking about
this, it is only for stable kernel release stuff.

Andn do you have a potential patch to resolve this issue?  That's the
simplest way to get it fixed up and to show what you are discussing.

thanks,

greg k-h
