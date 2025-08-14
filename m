Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C196B263CB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E3010E843;
	Thu, 14 Aug 2025 11:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="p/nKzN3J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A709510E843
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:07:27 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3b9dc5c6521so400170f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1755169646; x=1755774446;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EhzC1LIt1LNTjS6++SEvIb6wixTsS4zRbZp52DT3w4U=;
 b=p/nKzN3JP1JqO08/ExViVLgi7SeprxLgpLff3woyc3t5gi3S0SsKfU06gMvwQAzj/r
 ABVRiTLWMjzQbFvIagrhikB2y5XNdrPy7y801xZlpmyZ7mUGcKkANI4NqU4QysLwcx5U
 O5CVx1l1qt+eMIRYI4k0l/pAFlj9QpD1SSd4hRGGFr+VQ3VpdUmPdj5w55AbZe3pLZiv
 kX7oHvfa10EtAvILzk0Mx0Ja8aSC2an9VtstQQ334onciQlKIkWQrnKBjDDZP9DeN9Oi
 6s1nyIAOoRTKY3AAkl6cirvGUYfgaamKvQ4BHHCd7ge98UMn4AGAitz+HddkbsYE2soA
 5rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755169646; x=1755774446;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EhzC1LIt1LNTjS6++SEvIb6wixTsS4zRbZp52DT3w4U=;
 b=loPraF5PmE73vaWQ8iXnnAOYhSE6BUiSfdh1NI+XBAKef5oJ1YIqFvNSxOusGGkyJI
 S1OnOXIc2Pa2EPjr62kbqrOtrbNAhl959R5BZhE1z1yc/RRr0zzgcZ3m99hFAOzWDu7w
 PjbCVA3RR9FDV2YRR9kAKuMttzeawjSNE4nP0n9odBAGCFdzTyF3IwcYWGaOZNXc/faM
 hofHRbGtdKXtdh7X3V31oIfrgRD1fTIPE3g2c1zn3V0AYzvSHiWT8CRvJ0Jg8VtYEHze
 rWBVRanL0EIc8oSO4jLXm6cF6LKRwN7pU62Rn5hiB1XMB6wYaWOvLN2Xf1RPo44rb8nT
 tMoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7dVFSkwIdoJlGLgzcj+n3s3BS42nmieLM8iYIfucFsiH2GsTC0B6rvzXjRq5Z4MjtzZ2wfqec6kY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPd7Hg7l0JKECbYL6BWtOjdjV7pvW5nrFAwuY6kPQr3hwHZKL7
 REfgWYKsXaDCOVf1dv0JKhSgYLVe2Es8hFWL6KR7xImUPb6fGZc5jd/3snJQvNHZpb8=
X-Gm-Gg: ASbGncvS/s02z6hMC52lWXxEzsz6FrpB/86ctmdY7/d1qKS/nuWttC+WboHnKp3wYA2
 DB7jOnHDuqvsKdO+1/RuNgN3qwWpVXc3ShESCDV11v3yTxMb/e3tayveMFUsEzGGtkB6x/DYAwc
 LeOzzmTzfoZBCE4hErflXUu9uY+OVMXngaeegdXgZLPeSU4Yr1i31PJsZHw8m5mgFAS3cMRe2+8
 UF1GA6QhxVFhslANhXwSEgnTC3A+HbHFYcPuDplmouxLyovtLwtqxAS1BUX46LlVd+0EjuaP1BZ
 v37A3elwFJIv6omETReuvqOYqQ+AyCcoVCejKCRK7w6K2vwvMbFA7rFVgc2waFfi2h18AhfzZq4
 3b0Bodrsjwbt43OKY2nOiJCahDWl9vd9xasqQkrkqigo0cw==
X-Google-Smtp-Source: AGHT+IG+WqGjfQftYWUvsowlRp0/lbM82rvGxjJZqJkNe/p0TTWmDn5ifF6edyehRMIL0CNuZ2dMUQ==
X-Received: by 2002:a05:6000:2887:b0:3b8:d15d:933e with SMTP id
 ffacd0b85a97d-3b9fc362529mr2344546f8f.56.1755169645890; 
 Thu, 14 Aug 2025 04:07:25 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abec8sm52567672f8f.8.2025.08.14.04.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 04:07:25 -0700 (PDT)
Message-ID: <14ed323d-de4c-4f98-a16c-8bdb1b92c34d@ursulin.net>
Date: Thu, 14 Aug 2025 12:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: Move the memset() function call after the
 return statement
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Liao Yuanhong <liaoyuanhong@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250814093957.137397-1-liaoyuanhong@vivo.com>
 <d77e242e-af6c-4693-b207-576b823a0c0f@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <d77e242e-af6c-4693-b207-576b823a0c0f@amd.com>
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


On 14/08/2025 11:11, Christian König wrote:
> On 14.08.25 11:39, Liao Yuanhong wrote:
>> Adjust the position of the memset() call to avoid unnecessary invocations.
> 
> Hui? That doesn't seem to make much sense to me.
> 
> We memset the local variable because we need to make sure that everything (including padding bytes) is zeroed out.
> 
> Even if that isn't sometimes necessary because of error handling we clearly shouldn't try to optimize this.

To interject with a curiousity, it is even worse to move the memset away 
from the declaration block when the often enabled 
CONFIG_INIT_STACK_ALL_ZERO is on. At least when they are close compiler 
can figure out it only needs to memset it once. Move them further apart 
and sometimes memset happens twice, yay.

Main point when CONFIG_INIT_STACK_ALL_ZERO is on, and it often is, there 
is no way to avoid the sometimes pointless init. I have some local 
branches which try to address the worst offenders but it is so much in 
the noise that I don't think I ever sent them out.

Regards,

Tvrtko

>> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
>> ---
>>   drivers/gpu/drm/radeon/atombios_crtc.c     |  8 ++++----
>>   drivers/gpu/drm/radeon/atombios_encoders.c | 20 ++++++++++----------
>>   2 files changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
>> index 9b3a3a9d60e2..0aae84f5e27c 100644
>> --- a/drivers/gpu/drm/radeon/atombios_crtc.c
>> +++ b/drivers/gpu/drm/radeon/atombios_crtc.c
>> @@ -770,13 +770,13 @@ static void atombios_crtc_set_disp_eng_pll(struct radeon_device *rdev,
>>   	int index;
>>   	union set_pixel_clock args;
>>   
>> -	memset(&args, 0, sizeof(args));
>> -
>>   	index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
>>   	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev,
>>   				   &crev))
>>   		return;
>>   
>> +	memset(&args, 0, sizeof(args));
>> +
>>   	switch (frev) {
>>   	case 1:
>>   		switch (crev) {
>> @@ -832,12 +832,12 @@ static void atombios_crtc_program_pll(struct drm_crtc *crtc,
>>   	int index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
>>   	union set_pixel_clock args;
>>   
>> -	memset(&args, 0, sizeof(args));
>> -
>>   	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev,
>>   				   &crev))
>>   		return;
>>   
>> +	memset(&args, 0, sizeof(args));
>> +
>>   	switch (frev) {
>>   	case 1:
>>   		switch (crev) {
>> diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
>> index d1c5e471bdca..f706e21a3509 100644
>> --- a/drivers/gpu/drm/radeon/atombios_encoders.c
>> +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
>> @@ -492,11 +492,11 @@ atombios_dvo_setup(struct drm_encoder *encoder, int action)
>>   	int index = GetIndexIntoMasterTable(COMMAND, DVOEncoderControl);
>>   	uint8_t frev, crev;
>>   
>> -	memset(&args, 0, sizeof(args));
>> -
>>   	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>   		return;
>>   
>> +	memset(&args, 0, sizeof(args));
>> +
>>   	/* some R4xx chips have the wrong frev */
>>   	if (rdev->family <= CHIP_RV410)
>>   		frev = 1;
>> @@ -856,8 +856,6 @@ atombios_dig_encoder_setup2(struct drm_encoder *encoder, int action, int panel_m
>>   	if (dig->dig_encoder == -1)
>>   		return;
>>   
>> -	memset(&args, 0, sizeof(args));
>> -
>>   	if (ASIC_IS_DCE4(rdev))
>>   		index = GetIndexIntoMasterTable(COMMAND, DIGxEncoderControl);
>>   	else {
>> @@ -870,6 +868,8 @@ atombios_dig_encoder_setup2(struct drm_encoder *encoder, int action, int panel_m
>>   	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>   		return;
>>   
>> +	memset(&args, 0, sizeof(args));
>> +
>>   	switch (frev) {
>>   	case 1:
>>   		switch (crev) {
>> @@ -1453,11 +1453,11 @@ atombios_external_encoder_setup(struct drm_encoder *encoder,
>>   			(radeon_connector->connector_object_id & OBJECT_ID_MASK) >> OBJECT_ID_SHIFT;
>>   	}
>>   
>> -	memset(&args, 0, sizeof(args));
>> -
>>   	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>   		return;
>>   
>> +	memset(&args, 0, sizeof(args));
>> +
>>   	switch (frev) {
>>   	case 1:
>>   		/* no params on frev 1 */
>> @@ -1853,11 +1853,11 @@ atombios_set_encoder_crtc_source(struct drm_encoder *encoder)
>>   	uint8_t frev, crev;
>>   	struct radeon_encoder_atom_dig *dig;
>>   
>> -	memset(&args, 0, sizeof(args));
>> -
>>   	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>   		return;
>>   
>> +	memset(&args, 0, sizeof(args));
>> +
>>   	switch (frev) {
>>   	case 1:
>>   		switch (crev) {
>> @@ -2284,11 +2284,11 @@ atombios_dac_load_detect(struct drm_encoder *encoder, struct drm_connector *conn
>>   		int index = GetIndexIntoMasterTable(COMMAND, DAC_LoadDetection);
>>   		uint8_t frev, crev;
>>   
>> -		memset(&args, 0, sizeof(args));
>> -
>>   		if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
>>   			return false;
>>   
>> +		memset(&args, 0, sizeof(args));
>> +
>>   		args.sDacload.ucMisc = 0;
>>   
>>   		if ((radeon_encoder->encoder_id == ENCODER_OBJECT_ID_INTERNAL_DAC1) ||
> 

