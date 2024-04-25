Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9DA8B2365
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 16:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4172112058;
	Thu, 25 Apr 2024 14:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="4frgaUKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B406F11204C;
 Thu, 25 Apr 2024 14:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714053705;
 bh=bTEo1oCkBfk7Xcu5w34Wr/A5wA3MyotrDp/CRfdJjXQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=4frgaUKcwMyzUIVVe207PbMSjp/UPnr4wAkZsotbfk2MivpbAJbQDtrQKUXInTVcQ
 mlQkFxLZ22dJkwyes3xfd8Js3HK2j6w6Y0fztZAWdJU212a/ccSTsjxJ74Xf/106sL
 6V7LfOsn1m0/dfj7fU8nQj346/L7QiHPSiy3YzTj6Biw/WpNJiDoSIeDTX2w1b4676
 DYyMhoKKKC2x0Is6P1JOme8u6VRSDPzsckvhQTSwQeun4EovRLY+NnOy5ZA0uFvw5h
 7630VaJ8LMu/stpSmRftyufsuUiiZAk/V3LAgosS/EkcOf/0u4tbuDJN0l4TfYN1tI
 tRYMdcFaNUxIQ==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D490A3782153;
 Thu, 25 Apr 2024 14:01:40 +0000 (UTC)
Message-ID: <96624d87-2198-4176-9b98-208595380132@collabora.com>
Date: Thu, 25 Apr 2024 11:01:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: ci: fix the xfails for apq8016
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240401204859.24223-1-quic_abhinavk@quicinc.com>
 <357b6395-5fae-38c9-8b53-5edc9fcbae32@quicinc.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <357b6395-5fae-38c9-8b53-5edc9fcbae32@quicinc.com>
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



On 08/04/2024 14:04, Abhinav Kumar wrote:
> Hi Helen
> 
> Gentle reminder on this.
> 
> If you are okay, we can land it via msm-next tree...
> 
> Thanks
> 
> Abhinav
> 
> On 4/1/2024 1:48 PM, Abhinav Kumar wrote:
>> After IGT migrating to dynamic sub-tests, the pipe prefixes
>> in the expected fails list are incorrect. Lets drop those
>> to accurately match the expected fails.
>>
>> In addition, update the xfails list to match the current passing
>> list. This should have ideally failed in the CI run because some
>> tests were marked as fail even though they passed but due to the
>> mismatch in test names, the matching didn't correctly work and was
>> resulting in those failures not being seen.
>>
>> Here is the passing pipeline for apq8016 with this change:
>>
>> https://gitlab.freedesktop.org/drm/msm/-/jobs/57050562
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

I'm sorry about my delay.

Acked-by: Helen Koike <helen.koike@collabora.com>

I'm also merging it to msm-misc-next.

Regards,
Helen

>> ---
>>   drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 13 +------------
>>   1 file changed, 1 insertion(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt 
>> b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>> index 44a5c62dedad..b14d4e884971 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>> @@ -1,17 +1,6 @@
>>   kms_3d,Fail
>>   kms_addfb_basic@addfb25-bad-modifier,Fail
>> -kms_cursor_legacy@all-pipes-forked-bo,Fail
>> -kms_cursor_legacy@all-pipes-forked-move,Fail
>> -kms_cursor_legacy@all-pipes-single-bo,Fail
>> -kms_cursor_legacy@all-pipes-single-move,Fail
>> -kms_cursor_legacy@all-pipes-torture-bo,Fail
>> -kms_cursor_legacy@all-pipes-torture-move,Fail
>> -kms_cursor_legacy@pipe-A-forked-bo,Fail
>> -kms_cursor_legacy@pipe-A-forked-move,Fail
>> -kms_cursor_legacy@pipe-A-single-bo,Fail
>> -kms_cursor_legacy@pipe-A-single-move,Fail
>> -kms_cursor_legacy@pipe-A-torture-bo,Fail
>> -kms_cursor_legacy@pipe-A-torture-move,Fail
>> +kms_cursor_legacy@torture-bo,Fail
>>   kms_force_connector_basic@force-edid,Fail
>>   kms_hdmi_inject@inject-4k,Fail
>>   kms_selftest@drm_format,Timeout
