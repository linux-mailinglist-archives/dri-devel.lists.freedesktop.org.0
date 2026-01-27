Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGe3C+WIeGmqqwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:44:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C994691ED3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391B910E4FE;
	Tue, 27 Jan 2026 09:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="i6hy5OhT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C3F10E4FE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 09:43:58 +0000 (UTC)
Message-ID: <33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1769507026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bdTrt5yTViLMoxGqfPI2tzzVWJf6+qHces4GsCpsQDw=;
 b=i6hy5OhTkrEK1JWbJlqEJ6KvqNDCm4DL9hLJul51zp0E4tHfqYHY4QfWaTutTtwgajhw+A
 k4CFnhPvrInf+TwZPm2/+/6Msf48vLqeJZbTqt1wM7hEJlbQczpQc+krZK+FbG96NuR/55
 q0tOiHQzlscw/JxmGwq6n1ThmwY/X1LHXI1g1s7XVXKJcl5goG9f10/5wE1LsJDc0g3a/z
 Dx016l4YYXoOoVWJGpH0304hs9WEVndY/6PK4Wb1RBc1cfyKd8akP3KhMEeWDFRhUeCJRK
 oiEgfnO9cvUeY2uMJ0xKU/JpPQ8slVJ4NES3f4m25kXNOWM7VcdN2fb22NRgfg==
Date: Tue, 27 Jan 2026 06:43:32 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[val@packett.cool,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:dkim,packett.cool:url,packett.cool:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: C994691ED3
X-Rspamd-Action: no action

Hi,

On 1/15/26 5:05 PM, Dmitry Baryshkov wrote:
> On most of the platforms only some mixers have connected DSPP blocks.
> If DSPP is not required for the CRTC, try looking for the LM with no
> DSSP block, leaving DSPP-enabled LMs to CRTCs which actually require
> those.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 52 +++++++++++++++++++++++++---------
>   1 file changed, 38 insertions(+), 14 deletions(-)


this has massively broken things on my x1e device (latitude-7455):

- upon booting into gdm, the internal display is all dark blue
- suspend-resume makes gdm appear fine, then logging in results in 
another blue screen, again bypassed by suspend-resume (vt switching back 
to gdm makes it appear fine but switching back to the session, it's 
still blue)
- OR blindly logging in on the blue gdm makes the session appear
- plugging in an external display makes the blue screen flash constantly 
over the contents, there is also a flashing vertical gap between 2 
halves of the internal screen (amazing effect) and the external display 
doesn't actually refresh the contents under the blue 
(https://owo.packett.cool/dbg/dspp-lm-boom.webm)

Consistently across 3 reboots.

Reverted only this commit and it's back to normal, so I'm pretty sure 
it's this.

/sys/kernel/debug/dri..: https://owo.packett.cool/dbg/bluewtf.dri


~val

