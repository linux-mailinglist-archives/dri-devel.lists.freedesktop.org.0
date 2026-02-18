Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIyME2DOlWnjUwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 15:36:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF6A15715E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 15:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F4210E0F2;
	Wed, 18 Feb 2026 14:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JS5n4waj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C250610E0F2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 14:36:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D5A3D600AE;
 Wed, 18 Feb 2026 14:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944D0C116D0;
 Wed, 18 Feb 2026 14:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771425370;
 bh=RqL1IGjsL9BoaSmpHs7vN7tjQn6EKBXZBWT6FOI58a4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JS5n4wajandQjg5er6+u8kA1qB/pypUaZs18huBBLLgporYCjd9qaMRhj3ikb3Xf0
 cX5WajsWnuIJUNDoSggop3fllEovbREeDQ7JUsyTPlkD+IYcPiPNaccxkmObSm+TEp
 ikwqm7VPecvzqrGN70JeoFr1gMIMUZt2PDDMN5qkhE1jkOSWrY7P76aTWXwYd4PmiU
 20BYJEaBK6l5x+kV2tViZjpzqoMLoFyGXfZfpgpIkaZ8GH1j47GzDoX1XHFfpYDwzN
 AwES6yUtm87DgAcrbiIyM9UltbN6xxf4rGTPJCuJTwbWyK8nIZR3nePkG+OrvS9xXN
 okHM06NNSkHGw==
Date: Wed, 18 Feb 2026 08:36:07 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v6 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <lkwod3c3mubtcthy63aneumxq77lfik4nywi5oxjhnc3lmdk4s@eaygdb5vwlr3>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-5-ekansh.gupta@oss.qualcomm.com>
 <wipphezpxtuuxtwhpwamsmvhwgwuesexmy5ev5pcqb65vov5kz@vuzzyyqnu7ci>
 <1707a83d-d717-43b7-b450-90f8400a65fb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1707a83d-d717-43b7-b450-90f8400a65fb@oss.qualcomm.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CFF6A15715E
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 02:36:40PM +0530, Ekansh Gupta wrote:
> On 2/16/2026 8:51 AM, Bjorn Andersson wrote:
> > On Sun, Feb 15, 2026 at 11:51:35PM +0530, Ekansh Gupta wrote:
> >> @@ -1812,6 +1912,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
> >>  	return 0;
> >>  }
> >>  
> >> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
> >> +{
> >> +	struct fastrpc_ioctl_set_option opt = {0};
> >> +	int i;
> >> +
> >> +	if (copy_from_user(&opt, argp, sizeof(opt)))
> >> +		return -EFAULT;
> >> +
> >> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
> >> +		if (opt.reserved[i] != 0)
> >> +			return -EINVAL;
> >> +	}
> >> +
> >> +	if (opt.req != FASTRPC_POLL_MODE)
> >> +		return -EINVAL;
> >> +
> >> +	if (opt.value)
> > Would it make sense to allow the caller to affect the poll timeout using
> > the other 31 bits of this value?
> I was planning to bring that control[1], but it's might be difficult for the caller
> 

Skimming through the thread, it seems you're discussing how to determine
if the DSP supports polling or not; that sounds like a separate problem
in my view. Not sure if you settled that discussion, but couldn't that
be handled through FASTRPC_IOCTL_GET_DSP_INFO?

I assume though, this would be subject to firmware changes. How do you
determine downstream if polling should be used or not today?


For my specific question here, I'm merely wondering if the timeout value
should be a boolean or have a unit. We could punt on that question, to
not block this feature from making progress upstream, by defining that
only 0 and 1 are valid values today (all other result in -EINVAL).

This would leave the door open for having 0 == off, 1 == default, > 1
represent the actual timeout in microseconds in the future.

Treating any non-zero value as "the default timeout" means that you
would have to assume that there's userspace who might pass other values
and you can't add additional meaning to the field in the future.

Regards,
Bjorn

> [1] https://lore.kernel.org/all/20250127044239.578540-5-quic_ekangupt@quicinc.com/
> 
> //Ekansh
