Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IELuLIESl2n7uAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 14:39:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2A915F279
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 14:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1A510E6E4;
	Thu, 19 Feb 2026 13:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FvhwyncA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1BF10E6E4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 13:39:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2C577436C4;
 Thu, 19 Feb 2026 13:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDBFC4CEF7;
 Thu, 19 Feb 2026 13:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771508348;
 bh=bqPX4wEzXN9btBQ8WvzRVG4tLscNYgiM+NZEQqZS9u4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FvhwyncACtCk2yJ18bDCoQk9teZF8moA8IR6j0giuuejooDZw7nQqRk11uBlQWPDa
 NuC+d/TCu2s3v5tuYklAYhuvzXhLyVaZPos0t+dN4MkMtDlaedFbfPCsDBRg3Z58/N
 KBRZ4+caB6Tb/myGoSyiA8mRRrO/zXZHlO5EoLzoNjQN9U7p6mh2N0KRiC9nXI9HPk
 q83eboVWV8uJzT6RKBaJYsjahWxyTxVh5EaoQ3BdYbVOc9BH00/pMjcC8XALMHz9q1
 Tz96XE0AaZTUsaPGXldLHdc9AMztvZYP/At0smQzygBTs30sRiLvT7NOuo4Ukl0Ijx
 3BLf/rGB/Am3w==
Date: Thu, 19 Feb 2026 07:39:05 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org, 
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, 
 arnd@arndb.de, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v6 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <7v5jj3z2ltyw2lf62itihlkdvr2zkf6fkbw7zi36k46szpsktp@jjb2rqz6xxjw>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-5-ekansh.gupta@oss.qualcomm.com>
 <wipphezpxtuuxtwhpwamsmvhwgwuesexmy5ev5pcqb65vov5kz@vuzzyyqnu7ci>
 <1707a83d-d717-43b7-b450-90f8400a65fb@oss.qualcomm.com>
 <lkwod3c3mubtcthy63aneumxq77lfik4nywi5oxjhnc3lmdk4s@eaygdb5vwlr3>
 <81faa130-b497-4248-a6c6-7c421646451a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81faa130-b497-4248-a6c6-7c421646451a@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0A2A915F279
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 03:38:28PM +0100, Konrad Dybcio wrote:
> 
> 
> On 18-Feb-26 15:36, Bjorn Andersson wrote:
> > On Mon, Feb 16, 2026 at 02:36:40PM +0530, Ekansh Gupta wrote:
> >> On 2/16/2026 8:51 AM, Bjorn Andersson wrote:
> >>> On Sun, Feb 15, 2026 at 11:51:35PM +0530, Ekansh Gupta wrote:
> >>>> @@ -1812,6 +1912,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
> >>>> +{
> >>>> +	struct fastrpc_ioctl_set_option opt = {0};
> >>>> +	int i;
> >>>> +
> >>>> +	if (copy_from_user(&opt, argp, sizeof(opt)))
> >>>> +		return -EFAULT;
> >>>> +
> >>>> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
> >>>> +		if (opt.reserved[i] != 0)
> >>>> +			return -EINVAL;
> >>>> +	}
> >>>> +
> >>>> +	if (opt.req != FASTRPC_POLL_MODE)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	if (opt.value)
> >>> Would it make sense to allow the caller to affect the poll timeout using
> >>> the other 31 bits of this value?
> >> I was planning to bring that control[1], but it's might be difficult for the caller
> >>
> > 
> > Skimming through the thread, it seems you're discussing how to determine
> > if the DSP supports polling or not; that sounds like a separate problem
> > in my view. Not sure if you settled that discussion, but couldn't that
> > be handled through FASTRPC_IOCTL_GET_DSP_INFO?
> > 
> > I assume though, this would be subject to firmware changes. How do you
> > determine downstream if polling should be used or not today?
> > 
> > 
> > For my specific question here, I'm merely wondering if the timeout value
> > should be a boolean or have a unit. We could punt on that question, to
> > not block this feature from making progress upstream, by defining that
> > only 0 and 1 are valid values today (all other result in -EINVAL).
> > 
> > This would leave the door open for having 0 == off, 1 == default, > 1
> 
> Giving '1' a special non-numerical meaning sounds odd.. maybe 0:default,
> -1:off (or the opposite)?
> 

I guess it comes down to the question of how big the likelihood that you
would want a different value than the default. We should provide sane
defaults and avoid sprinkling unergonomic knobs throughout the system,
but [0,1] and the rest of the bits reserved would leave the door open
for future use of the upper 31 bits.

I find 0 == "enabled" to be unintuitive...

And using -1 means that the bits aren't reserved for future use.

Regards,
Bjorn

> Konrad
