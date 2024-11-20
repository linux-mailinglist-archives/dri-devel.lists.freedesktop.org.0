Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9869D325D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 04:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4154810E121;
	Wed, 20 Nov 2024 03:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=lausen.nl header.i=@lausen.nl header.b="rv6x7jtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is
 [185.26.156.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ABF10E121
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 03:03:09 +0000 (UTC)
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
 by mailgate02.uberspace.is (Postfix) with ESMTPS id DB7F717FAEA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 04:02:37 +0100 (CET)
Received: (qmail 29189 invoked by uid 990); 20 Nov 2024 03:02:37 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Wed, 20 Nov 2024 04:02:37 +0100
Message-ID: <4f145884-2c91-4e32-a7bc-b439746c6adb@lausen.nl>
Date: Tue, 19 Nov 2024 22:02:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
To: Johan Hovold <johan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>
References: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
 <ZzyYI8KkWK36FfXf@hovoldconsulting.com>
 <2138d887-f1bf-424a-b3e5-e827a39cc855@lausen.nl>
 <ZzyqhK-FUwoAcgx1@hovoldconsulting.com>
Content-Language: en-US
From: Leonard Lausen <leonard@lausen.nl>
Autocrypt: addr=leonard@lausen.nl; keydata=
 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 Sw==
In-Reply-To: <ZzyqhK-FUwoAcgx1@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: -
X-Rspamd-Report: BAYES_HAM(-1.061072) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -1.151072
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lausen.nl; s=uberspace;
 h=from:to:cc:subject:date;
 bh=8jNv7+kbCBf2b2GClu55b6gv+Vj/t/2sMO+mquGa+Jo=;
 b=rv6x7jtbsQwegujTx322XHsocu0G20sR2MloiMMToFZdVRigWM4UijidEw3B8hDLBeMlQJvLDv
 evkg1IcrS1efiBp0RrUjTW3uvyt0E3eFwqCe74HbT3ehIL44RE4cQSty1fq48AR/0VEzU7FJInjo
 /0GdtfL5gukerZoiOiSxQwcXGCHHRgsrmxSoBH6+Is+lLY008QKo8X92TrexLSJZdwBwofLisVsR
 TrlgZZ7zFzulwn7C/gb2hzoox+3e0gTgUL+sf9BhAjVZFR5Eqm1rEdAbIS2BeUjeIYhWd6N4HiSv
 +TU9Z41bKBY8E9KThE0B0X0Gu9Tbk3rfr+geJBYiYoFY6arXPeq4aTbhSM7rmbLDAogsE/NtGBZ6
 6Y4WoUFnK90Stwt6o89ZOtOQrzxMQ8YR1bYjcqeojhRUByV+HWkkf4c8miGWwyezYII6KrY6DHTJ
 U+VUb2wgg1pd+mgxzcaYdGKDz4xvk4LxpUof9If3hBqSoc56cRKDUp1ihi2txUunPdH0iU2cO498
 N4z3gp48Ebu/0fZGMk1Yj6UT4DLctLcH0BD2ZTwOAppTNt/BSKGQs39nFgvUE3KbBWaSrjiZo7TM
 etyAHxDpajSECOTRBF/iWWUEh4+cmgK4gAArdQ4g8UmjX9ic9k/CXLn4nk5VjBDoTVHkaEYn6LQN
 s=
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

>> The issue of "internal display fails to resume properly (switching VT brings it back)"
>> also affects sc7180 platform during some resumes. Do you see the issue consistently
>> during every resume?
> 
> Yes, it happens on every suspend cycle here.
> 
> I didn't notice the issue initially as fbdev does not seem to be
> affected, and I've been running with this patch applied to suppress the
> resume errors since it was posted.

Ok. Then situation is worse on x1e80100 than sc7180, where the issue only
occurs sporadically.

>>> The x1e80100 is the only platform I have access to with a writeback
>>> connector, but this regression potentially affects a whole host of older
>>> platforms as well.
>>
>> Have you attempted setting CTM or other DRM state when running with this patch?
> 
> Nope, I just want basic suspend to work.

Ok.

Given my previous testing and finding of this patch causing unexplained CRTC
CTM regression was back in July on 6.9.8 and next-20240709, I went ahead and
tested on 6.10.14, 6.11.9 and 6.12 as well. To recall, the problematic behavior
observed with this patch before was that CRTC CTM state would be lost after
suspend with external display attached and re-setting the state was no longer
possible after resume. (The "failed to get dspp on lm 0" etc. errors mentioned
in my earlier email today were not associated with CRTC state issue, but
actually occur with and without this patch. Apologies for misstating, given the
elapsed time):

The finding is that while 6.10.14 with this patch applied still suffers from
that regression, 6.11.9 and 6.12 do not face the CRTC state regression.
Therefore, whatever issue the patch uncovered in older kernels and which
justified not merging it before due to regressing basic CTM functionality, is
now fixed. The patch should be good to merge and backport to 6.11, but from my
perspective should not be backported to older kernels unless the interaction
with the DRM CRTC state issue is understood and an associated fix backported as
well.

I also confirmed that the patch (still) fixes the
"[drm:drm_mode_config_helper_resume] *ERROR* Failed to resume (-22)"
error upon resume.

Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor

Thank you
Leonard

