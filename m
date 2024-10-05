Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C658099189A
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 18:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C333310E263;
	Sat,  5 Oct 2024 16:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marek.ca header.i=@marek.ca header.b="cMszOBFG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264D610E263
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2024 16:58:34 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6cb27e974ceso21152776d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Oct 2024 09:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1728147513; x=1728752313; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=534BF0P5lE7Sw6EXBB2MdGwppSsVFm73Tau4PbJd3Pc=;
 b=cMszOBFGGwxZ08ebz/x2hVWcGvwQtyagFKhakDM4Zv8iIS+kwOVAZ8luv9m0s7yblb
 w+0wqDCOP6XxpH6ZeyvEpIWe9kb8Crb+6yuBuMKG6dXVJX70YmUz9ACkTkoPXO3L43Fz
 MAxfVmQfQgXT00F9gwMV1wioHKtyyPi9Bij7S8sZaTVEGcZObdIXPxGRN1AvW5ihtFCj
 Y9C61feSHAs667TVYBlvabwkPK+3H5SSVoTyoLAm4UGIy6BLaPwhUfRAdaCXbUKdzqb0
 QPVcsDgQF1Q9ATbd9ADGoyyTccH0JNz1s6J79YpUqGLPe+t9Gx2MkfaRsQ+/GrroRqP4
 wxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728147513; x=1728752313;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=534BF0P5lE7Sw6EXBB2MdGwppSsVFm73Tau4PbJd3Pc=;
 b=m5XKPk8TW0LbCkA59AFtYfZrQV6LJaKZ2xEfhSh9JR2uW2VRp22CBnW8NK8d2L6gQa
 dmIWd6ErgR2ku9c3wHqAmCqc3N3X0Ryc15cv+JMsofc0Kh2qGhHm5GxohAjnJvOZzBXp
 4i5Lj3aMa3buBboAhQCmQxyrDndimeFOmJq/XPeuxaZDQ5OAqOAoJMJV6j91M5YgtmYN
 NfQOuYABZ+UpdPZt636dHoIcLL4TRfXxavoT1Vmli4LOE0H6FlKka4V66B4wC6vpZfPs
 lRZtY1j3Bhd0PV3KaLqQIwoyJuD/O9neewEJyd4frWQfJqL8u1CsZyfUHX5g9dU45i5t
 hIeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmTJVVT8VxNZjSX0QttNSyt+DUp9nhfvVlDd90fjZkGF0E+KLc+Xg+x6FCFIMh+Znk0SbEmZH00f8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynRLb1Z+6pxc0d1XyJ9V4sLuI7UajfmfodiWUZaNkuMAxd7r4b
 eadLhR1uofa3z3M0b3x9CbaVh3Ud3cVKohpF7qRpp7Ow4r2blSJugRPzEHJbFcY=
X-Google-Smtp-Source: AGHT+IHNX/nlmxQbI/WqWLEEy+/8YLvtUS/jHRIC7aZ58AdVpv3bsRE62Z/GKH7EQ1/OcMHcCRnZww==
X-Received: by 2002:a05:6214:5709:b0:6cb:46ce:744a with SMTP id
 6a1803df08f44-6cb9a4fa3b0mr78469376d6.48.1728147512903; 
 Sat, 05 Oct 2024 09:58:32 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca.
 [135.19.110.125]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cba46efed1sm9795796d6.68.2024.10.05.09.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Oct 2024 09:58:32 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
References: <20241005143818.2036-1-jonathan@marek.ca>
 <ba56c822-cf3d-4d62-86d4-e04551e443c6@oss.qualcomm.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <e60361b2-29bc-aeee-2ab9-bb19e5c0afa6@marek.ca>
Date: Sat, 5 Oct 2024 12:55:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ba56c822-cf3d-4d62-86d4-e04551e443c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 10/5/24 12:31 PM, Konrad Dybcio wrote:
> On 5.10.2024 4:38 PM, Jonathan Marek wrote:
>> drm_mode_vrefresh() can introduce a large rounding error, avoid it.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 185d7de0bf376..1205aa398e445 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -542,7 +542,7 @@ static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mo
>>   
>>   	int new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
>>   
>> -	return new_htotal * mode->vtotal * drm_mode_vrefresh(mode);
>> +	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);
> 
> This seems to ignore mult/div by two on certain mode flags.. is that
> intended?
> 
> Konrad
> 

It is intended - those flags are not relevant to DSI panels, and DSC 
pclk adjustment is only about how DSC affects htotal.
