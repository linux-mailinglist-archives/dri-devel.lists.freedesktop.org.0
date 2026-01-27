Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLh1KruaeGk9rQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:00:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7973293474
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49C210E530;
	Tue, 27 Jan 2026 11:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="fBgcHO1V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C5610E539
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:00:09 +0000 (UTC)
Message-ID: <ff0c70f3-62aa-43f5-a437-62aae5b84e9c@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1769511597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lhlzQCmgNkMJSHlIA4zS8Ozat5WOiAUqTpQUdu6tdPg=;
 b=fBgcHO1V1BXCKJAg1hwxThPkBmXKxdbZOYWnPjpE0ilDfaAEz2l5Q6Cs/heMeMadL0apc+
 iPDIWcbIDaKX4tO7aGa88vFTYAd2uaJwxLAQAz3yiGw1NulmJt+sjanoLiHoi7cpC+s1nh
 wS0oZs0wUp8+7+NYfdebj+SC88RpzQc9rxDTJDQi9s/kV7TcxjsYPi5gjkHxlxzVWIuuaf
 q4tCRy6YWLmxljpeDeJiXlQJB96QGuxo9EfC8NFcZ72PkWY/4Q3oi6hPl/f2lQKUumV1i/
 BA9iC3gfLQF1M5cMrknXqcWQV8i40AtQpOtyiTj6nUoH6iVA5Je2Plj3FFbeHA==
Date: Tue, 27 Jan 2026 07:59:34 -0300
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
Subject: Re: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
 <33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool>
 <whko2yur7tgutr4qhlbqfrvpcdg7hkyw66koicqvpvfhk55c7z@saj2uxrduv4z>
Content-Language: en-US
In-Reply-To: <whko2yur7tgutr4qhlbqfrvpcdg7hkyw66koicqvpvfhk55c7z@saj2uxrduv4z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[val@packett.cool,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[packett.cool:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:mid,packett.cool:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7973293474
X-Rspamd-Action: no action


On 1/27/26 7:34 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 06:43:32AM -0300, Val Packett wrote:
>> this has massively broken things on my x1e device (latitude-7455):
>> [..]
>> Reverted only this commit and it's back to normal, so I'm pretty sure it's
>> this.
> Interesting. Could you please capture the dri-state (only the last part,
> resource mapping) with the external monitor attached and with this
> commit reverted?

Just reverted:

crtc[106]: crtc-0 [..]
         mode: "2560x1600": 60 280710 2560 2608 2640 2720 1600 1603 1609 
1720 0x48 0x9
         lm[0]=0
         ctl[0]=0
         dspp[0]=0
         lm[1]=1
         ctl[1]=0
         dspp[1]=1
crtc[107]: crtc-1 [..]
         mode: "3840x2560": 60 631750 3840 3888 3920 4000 2560 2563 2573 
2633 0x48 0x9
         lm[0]=2
         ctl[0]=1
         lm[1]=3
         ctl[1]=1
resource mapping: pingpong=106 106 107 107 # # - - # # - - - mixer=106 
106 107 107 # # - - ctl=106 107 # # # # - - dspp=# # # # - - - - dsc=# # 
# # - - - - cdm=# sspp=# # # # - - - - # # # # # # - - cwb=- - - -

> Also, could you please run another check:
>   - revert this commit
>   - comment out LM_2, LM_3 in the catalog
>   - try the resulting kernel with the external monitor

Commented out:

crtc[106]: crtc-0 [..]
         mode: "2560x1600": 60 280710 2560 2608 2640 2720 1600 1603 1609 
1720 0x48 0x9
         lm[0]=0
         ctl[0]=0
         dspp[0]=0
         lm[1]=1
         ctl[1]=0
         dspp[1]=1
crtc[107]: crtc-1 [..]
         mode: "3840x2560": 60 631750 3840 3888 3920 4000 2560 2563 2573 
2633 0x48 0x9
         lm[0]=4
         ctl[0]=1
         lm[1]=5
         ctl[1]=1
resource mapping:
         pingpong=106 106 # # 107 107 - - # # - - -
         mixer=106 106 - - 107 107 - -
         ctl=106 107 # # # # - -
         dspp=# # # # - - - -
         dsc=# # # # - - - -
         cdm=#
         sspp=# # # # - - - - # # # # # # - -
         cwb=- - - -

Not sure why the dspp= line in resource mapping doesn't show any numbers 
when a crtc has dspp[0]= and dspp[1]= o.0

But with LM 4+5, gamma control doesn't affect the external monitor.


~val

