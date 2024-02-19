Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A34E85AD41
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 21:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FA410E1A8;
	Mon, 19 Feb 2024 20:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="POyGkjmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F60E10E2C3;
 Mon, 19 Feb 2024 20:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708374832;
 bh=eJx4ueyARjnhoEogmvdV9S2dD8rwP35ldmK1e636iTc=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=POyGkjmL71+Qbsr/dhESuohV+BYaEp9A/98Spu5GOhr5r2GAMer6uva2+lsVpHPBy
 I/PMGCfxZrg+yTrzDFZeG1BB/hEn93y31182dFiUQfLEilzEVHNcIoFZQmOF23DsA/
 I0J+JGcXb3SKXYQ+LJ7McfU2iOZMNRWKT8rT5/1R8q5VA7FC3TpJYWqJrIIShH29/i
 8e56Ox1itf4n7fSfsb8yKjk9K/TkaEdzz9XReNcmA9TyVQnFRZ2sdfKIbS2+rpTXDF
 uY8KehuEQs/cr1hOg+WJisjqgiFrFNycbPE+GFoojW4+Y8BgQVwWS5SxLejDoMv7KC
 yWyFWrCgEztRw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B147137820C1;
 Mon, 19 Feb 2024 20:33:48 +0000 (UTC)
Message-ID: <78aae417-b152-446c-b53b-20ea4b39958c@collabora.com>
Date: Mon, 19 Feb 2024 17:33:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/ci: mark universal-plane-sanity as failing on
 SC7180
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
 <20240218041204.2522828-3-dmitry.baryshkov@linaro.org>
 <dc9872dc-c51a-4f8b-8963-9f92e43c7246@collabora.com>
In-Reply-To: <dc9872dc-c51a-4f8b-8963-9f92e43c7246@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 19/02/2024 17:25, Helen Koike wrote:
> 
> 
> On 18/02/2024 01:12, Dmitry Baryshkov wrote:
>> The test kms_universal_plane@universal-plane-sanity fails on both SC7180
>> platforms. The drm/msm returns -ERANGE as it can not handle passet
>> scaling range, however the test is not ready to handle that. Mark the
>> test as failing until it is fixed.
>>
>> ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Test assertion 
>> failure function sanity_test_pipe, file 
>> ../tests/kms_universal_plane.c:438:
>> ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Failed 
>> assertion: drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id, 
>> output->config.crtc->crtc_id, test.oversized_fb.fb_id, 0, 0, 0, 
>> mode->hdisplay + 100, mode->vdisplay + 100, IGT_FIXED(0,0), 
>> IGT_FIXED(0,0), IGT_FIXED(mode->hdisplay,0), 
>> IGT_FIXED(mode->vdisplay,0)) == expect
>> ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Last errno: 
>> 34, Numerical result out of range
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>


Applied to drm-misc/drm-misc-next

Thanks
Helen

> 
>> ---
>>   .../gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt    | 1 +
>>   .../drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt    | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git 
>> a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt 
>> b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> index 7e4d8744fcc6..f0576aa629e8 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> @@ -15,3 +15,4 @@ kms_plane_alpha_blend@alpha-7efc,Fail
>>   kms_plane_alpha_blend@coverage-7efc,Fail
>>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>>   kms_rmfb@close-fd,Fail
>> +kms_universal_plane@universal-plane-sanity,Fail
>> diff --git 
>> a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> index 7e4d8744fcc6..f0576aa629e8 100644
>> --- 
>> a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> +++ 
>> b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> @@ -15,3 +15,4 @@ kms_plane_alpha_blend@alpha-7efc,Fail
>>   kms_plane_alpha_blend@coverage-7efc,Fail
>>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>>   kms_rmfb@close-fd,Fail
>> +kms_universal_plane@universal-plane-sanity,Fail
