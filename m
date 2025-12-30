Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B755CE9CF8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 14:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E4F10E746;
	Tue, 30 Dec 2025 13:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="urZZMvpE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFBF10E746
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 13:47:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AC30D6000A;
 Tue, 30 Dec 2025 13:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82647C4CEFB;
 Tue, 30 Dec 2025 13:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1767102461;
 bh=mxDJL33Kc3e8V4Z31xSzx67G9tUidMS7fxK0LryWXf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=urZZMvpEbsvSCTaFN3l0LsYj9kzUAbfEvnJDH4KpMfc2p7Sxn9H9CHyJZNKTyWnVE
 IPrK1TXbZSD6+NAVyBIsW27rrd+C7dHt9Vs7qREyG149aP+coMpnZpO6MGzDjTfbe9
 yvFVT+LN2CDDHiPQQiE/vUeJu66LXTtlyJ2ed7ps=
Date: Tue, 30 Dec 2025 14:47:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, stable@kernel.org
Subject: Re: [PATCH v3 1/3] misc: fastrpc: Sanitize address logging and
 remove tabs
Message-ID: <2025123003-ecologist-foothill-09b8@gregkh>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-2-ekansh.gupta@oss.qualcomm.com>
 <a8c6b4d9-83b6-45b5-9432-134023e2eadd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8c6b4d9-83b6-45b5-9432-134023e2eadd@oss.qualcomm.com>
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

On Tue, Dec 30, 2025 at 02:23:55PM +0100, Konrad Dybcio wrote:
> On 12/30/25 12:02 PM, Ekansh Gupta wrote:
> > Avoid printing raw addresses in driver logs by using %p for remote
> > buffer addresses. This reduces the risk of information leaks and
> > conforms to kernel logging guidelines. Remove tabs in dev_*
> > messages.
> > 
> > Fixes: 2419e55e532d ("misc: fastrpc: add mmap/unmap support")
> > Cc: stable@kernel.org
> > Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > ---
> >  drivers/misc/fastrpc.c | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index ee652ef01534..408fe47e9db7 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -1830,13 +1830,13 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
> >  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> >  				      &args[0]);
> >  	if (!err) {
> > -		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
> > +		dev_dbg(dev, "unmap OK: raddr=%p\n", (void *)(unsigned long)buf->raddr);
> 
> Would it be easier if we did away with the uintptr_t, since the protocol
> seems to assume all addresses are u64s anyway?

Why is a pointer being printed at all?  That shouldn't be needed and is,
as always, a potential information leak.

thanks,

greg k-h
