Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D1C950154
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 11:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFC110E2D4;
	Tue, 13 Aug 2024 09:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0XNLzzvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE7910E2DC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 09:37:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2B4DECE0159;
 Tue, 13 Aug 2024 09:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53F9C4AF0B;
 Tue, 13 Aug 2024 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1723541837;
 bh=DquvrhSfayqIwXRSxJnou4FQDcSDrnMwWl4g4bzX22k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0XNLzzvBO2ms5bEpavpvd5Nxtm9LcnVb/Rb/EJMJqAhbTpRuEnP4hUq/dZWmWd0Eh
 5Uvu2ZeO/93/yOCgigbK6CUnltJbzqxXWZrKZ29szYCvSfDJzbdVncWCUyn9zrg0gX
 PDRB+AwlDRArXonT+G7fue8PPVTI/xpizBS5cetY=
Date: Tue, 13 Aug 2024 11:37:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhishek Singh <quic_abhishes@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_ktadakam@quicinc.com, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] misc: fastrpc: Trigger a panic using BUG_ON in device
 release
Message-ID: <2024081353-blah-reversion-1435@gregkh>
References: <20240730070945.4174823-1-quic_abhishes@quicinc.com>
 <2024073007-nickname-payee-20c8@gregkh>
 <7eab4618-9173-44f5-a185-0071f3893cc7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eab4618-9173-44f5-a185-0071f3893cc7@quicinc.com>
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

On Mon, Aug 05, 2024 at 04:36:28PM +0530, Abhishek Singh wrote:
> 
> On 7/30/2024 12:46 PM, Greg KH wrote:
> > On Tue, Jul 30, 2024 at 12:39:45PM +0530, Abhishek Singh wrote:
> >> The user process on ARM closes the device node while closing the
> >> session, triggers a remote call to terminate the PD running on the
> >> DSP. If the DSP is in an unstable state and cannot process the remote
> >> request from the HLOS, glink fails to deliver the kill request to the
> >> DSP, resulting in a timeout error. Currently, this error is ignored,
> >> and the session is closed, causing all the SMMU mappings associated
> >> with that specific PD to be removed. However, since the PD is still
> >> operational on the DSP, any attempt to access these SMMU mappings
> >> results in an SMMU fault, leading to a panic.  As the SMMU mappings
> >> have already been removed, there is no available information on the
> >> DSP to determine the root cause of its unresponsiveness to remote
> >> calls. As the DSP is unresponsive to all process remote calls, use
> >> BUG_ON to prevent the removal of SMMU mappings and to properly
> >> identify the root cause of the DSP’s unresponsiveness to the remote
> >> calls.
> >>
> >> Signed-off-by: Abhishek Singh <quic_abhishes@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 5204fda51da3..bac9c749564c 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -97,6 +97,7 @@
> >>  #define FASTRPC_RMID_INIT_CREATE_STATIC	8
> >>  #define FASTRPC_RMID_INIT_MEM_MAP      10
> >>  #define FASTRPC_RMID_INIT_MEM_UNMAP    11
> >> +#define PROCESS_KILL_SC 0x01010000
> >>  
> >>  /* Protection Domain(PD) ids */
> >>  #define ROOT_PD		(0)
> >> @@ -1128,6 +1129,9 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
> >>  	fastrpc_context_get(ctx);
> >>  
> >>  	ret = rpmsg_send(cctx->rpdev->ept, (void *)msg, sizeof(*msg));
> >> +	/* trigger panic if glink communication is broken and the message is for PD kill */
> >> +	BUG_ON((ret == -ETIMEDOUT) && (handle == FASTRPC_INIT_HANDLE) &&
> >> +			(ctx->sc == PROCESS_KILL_SC));
> > 
> > You just crashed the machine completely, sorry, but no, properly handle
> > the issue and clean up if you can detect it, do not break systems.
> > 
> But the Glink communication with DSP is already broken; we cannot communicate with the DSP.
> The system will crash if we proceed with cleanup on the ARM side. If we don’t do cleanup,
> a resource leak will occur. Eventually, the system will become dead. That’s why I am
> crashing the device.

Then explicitly call panic() if you think you really want to shut the
system down.

greg k-h
