Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD32AB5C54
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 20:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135B289C68;
	Tue, 13 May 2025 18:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ppRqP9Es";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E690810E5D6;
 Tue, 13 May 2025 18:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p+BB1luhuQHDOx6lpxsYRVAq29eYgZUe8EmzaYANxx0=; b=ppRqP9EsSXVNDjDTVsjwpw7wEX
 KIq0OIPduVFpaylAv77smqYsy1Uz/8iFteTl09eIeOkMzuag889w+5y0r3pDOQTAFDp5zOvTI3q4T
 WiQYlq26TkpHeBIOW8n1arWJsiUTKc1IxruigoFRvR0CRKnwbQcl3WU/9mguG+UCgZAgVKVgcjmVa
 sCboI5WwEPrSRvN792ErnPdv52KZ8VGLhRCeGnbKZHfOBKS2NlJkGA86OIOun5VqeQZi0N8A4MXXL
 5ZrBU84wcpTs40MpcMOBVA2ooI+I0E9tBhqVI1eouzEDcBnnPfsj14bhziMGaq9eIhylcVzp94Ae+
 qAVoNkHg==;
Received: from [189.6.16.79] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uEuPK-007kq4-F0; Tue, 13 May 2025 20:36:50 +0200
Message-ID: <eb6a22bd-ca83-4836-8a6d-28577f1ba042@igalia.com>
Date: Tue, 13 May 2025 15:36:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: only collect data if debug gamut_remap
 is available
To: Alex Hung <alex.hung@amd.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250425205133.317843-1-mwen@igalia.com>
 <37014944-2ed8-4b54-8136-b2e9b174b4f0@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <37014944-2ed8-4b54-8136-b2e9b174b4f0@amd.com>
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



On 13/05/2025 15:27, Alex Hung wrote:
>
>
> On 4/25/25 14:49, Melissa Wen wrote:
>> Color gamut_remap state log may be not avaiable for some hw versions, so
>> prevent null pointer dereference by checking it there is a function to
>> collect data for this hw version.
>>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 26 +++++++++++++------
>>   .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   | 24 ++++++++++++-----
>>   2 files changed, 35 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c 
>> b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
>> index 5e78b553adbd..b0f9e46e202a 100644
>> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
>> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
>> @@ -76,6 +76,7 @@ void dcn20_log_color_state(struct dc *dc,
>>   {
>>       struct dc_context *dc_ctx = dc->ctx;
>>       struct resource_pool *pool = dc->res_pool;
>> +    bool is_gamut_remap_available;
>>       int i;
>>         DTN_INFO("DPP:  DGAM mode  SHAPER mode  3DLUT mode 3DLUT bit 
>> depth"
>> @@ -89,15 +90,15 @@ void dcn20_log_color_state(struct dc *dc,
>>           struct dcn_dpp_state s = {0};
>>             dpp->funcs->dpp_read_state(dpp, &s);
>> -        dpp->funcs->dpp_get_gamut_remap(dpp, &s.gamut_remap);
>> +        if (dpp->funcs->dpp_get_gamut_remap) {
>> +            dpp->funcs->dpp_get_gamut_remap(dpp, &s.gamut_remap);
>> +            is_gamut_remap_available = true;
>> +        }
>>             if (!s.is_enabled)
>>               continue;
>>   -        DTN_INFO("[%2d]:  %8s  %11s  %10s  %15s  %10s  %9s %12s  "
>> -             "%010lld %010lld %010lld %010lld "
>> -             "%010lld %010lld %010lld %010lld "
>> -             "%010lld %010lld %010lld %010lld",
>> +        DTN_INFO("[%2d]:  %8s  %11s  %10s  %15s  %10s  %9s",
>>               dpp->inst,
>>               (s.dgam_lut_mode == 0) ? "Bypass" :
>>                ((s.dgam_lut_mode == 1) ? "sRGB" :
>> @@ -114,10 +115,17 @@ void dcn20_log_color_state(struct dc *dc,
>>               (s.lut3d_bit_depth <= 0) ? "12-bit" : "10-bit",
>>               (s.lut3d_size == 0) ? "17x17x17" : "9x9x9",
>>               (s.rgam_lut_mode == 1) ? "RAM A" :
>> -             ((s.rgam_lut_mode == 1) ? "RAM B" : "Bypass"),
>> +             ((s.rgam_lut_mode == 1) ? "RAM B" : "Bypass"));
>> +
>> +        if (is_gamut_remap_available) {
>
> is_gamut_remap_available can be uninitialized before used.

Ops. Let me send a new version.
>
>> +            DTN_INFO("  %12s  "
>> +                 "%010lld %010lld %010lld %010lld "
>> +                 "%010lld %010lld %010lld %010lld "
>> +                 "%010lld %010lld %010lld %010lld",
>> +
>>               (s.gamut_remap.gamut_adjust_type == 0) ? "Bypass" :
>> -             ((s.gamut_remap.gamut_adjust_type == 1) ? "HW" :
>> -                                   "SW"),
>> +                ((s.gamut_remap.gamut_adjust_type == 1) ? "HW" :
>> +                                      "SW"),
>>               s.gamut_remap.temperature_matrix[0].value,
>>               s.gamut_remap.temperature_matrix[1].value,
>>               s.gamut_remap.temperature_matrix[2].value,
>> @@ -130,6 +138,8 @@ void dcn20_log_color_state(struct dc *dc,
>>               s.gamut_remap.temperature_matrix[9].value,
>>               s.gamut_remap.temperature_matrix[10].value,
>>               s.gamut_remap.temperature_matrix[11].value);
>> +        }
>> +
>>           DTN_INFO("\n");
>>       }
>>       DTN_INFO("\n");
>> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c 
>> b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
>> index e89ebfda4873..931cd2e886b8 100644
>> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
>> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
>> @@ -74,6 +74,7 @@ void dcn30_log_color_state(struct dc *dc,
>>   {
>>       struct dc_context *dc_ctx = dc->ctx;
>>       struct resource_pool *pool = dc->res_pool;
>> +    bool is_gamut_remap_available;
>>       int i;
>>         DTN_INFO("DPP:  DGAM ROM  DGAM ROM type  DGAM LUT SHAPER mode"
>> @@ -88,16 +89,16 @@ void dcn30_log_color_state(struct dc *dc,
>>           struct dcn_dpp_state s = {0};
>>             dpp->funcs->dpp_read_state(dpp, &s);
>> -        dpp->funcs->dpp_get_gamut_remap(dpp, &s.gamut_remap);
>> +
>> +        if (dpp->funcs->dpp_get_gamut_remap) {
>> +            dpp->funcs->dpp_get_gamut_remap(dpp, &s.gamut_remap);
>> +            is_gamut_remap_available = true;
>> +        }
>>             if (!s.is_enabled)
>>               continue;
>>   -        DTN_INFO("[%2d]:  %7x  %13s  %8s  %11s  %10s  %15s %10s  %9s"
>> -             "  %12s  "
>> -             "%010lld %010lld %010lld %010lld "
>> -             "%010lld %010lld %010lld %010lld "
>> -             "%010lld %010lld %010lld %010lld",
>> +        DTN_INFO("[%2d]:  %7x  %13s  %8s  %11s  %10s  %15s %10s  %9s",
>>               dpp->inst,
>>               s.pre_dgam_mode,
>>               (s.pre_dgam_select == 0) ? "sRGB" :
>> @@ -121,7 +122,14 @@ void dcn30_log_color_state(struct dc *dc,
>>               (s.lut3d_size == 0) ? "17x17x17" : "9x9x9",
>>               (s.rgam_lut_mode == 0) ? "Bypass" :
>>                ((s.rgam_lut_mode == 1) ? "RAM A" :
>> -                           "RAM B"),
>> +                           "RAM B"));
>> +
>> +        if (is_gamut_remap_available) {
>
> is_gamut_remap_available can be uninitialized before used.
>
>> +            DTN_INFO("  %12s  "
>> +                 "%010lld %010lld %010lld %010lld "
>> +                 "%010lld %010lld %010lld %010lld "
>> +                 "%010lld %010lld %010lld %010lld",
>> +
>>               (s.gamut_remap.gamut_adjust_type == 0) ? "Bypass" :
>>                   ((s.gamut_remap.gamut_adjust_type == 1) ? "HW" :
>>                                         "SW"),
>> @@ -137,6 +145,8 @@ void dcn30_log_color_state(struct dc *dc,
>>               s.gamut_remap.temperature_matrix[9].value,
>>               s.gamut_remap.temperature_matrix[10].value,
>>               s.gamut_remap.temperature_matrix[11].value);
>> +        }
>> +
>>           DTN_INFO("\n");
>>       }
>>       DTN_INFO("\n");
>

