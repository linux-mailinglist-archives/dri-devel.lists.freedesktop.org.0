Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCFB846B5C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 09:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9DE10EBF9;
	Fri,  2 Feb 2024 08:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4C010EBF9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 08:56:41 +0000 (UTC)
X-UUID: 638e4e337349431f968ddb1bd3276d02-20240202
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:af666be1-41cc-499d-a5fe-c88955d0c6b4, IP:15,
 URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:1
X-CID-INFO: VERSION:1.1.35, REQID:af666be1-41cc-499d-a5fe-c88955d0c6b4, IP:15,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:1
X-CID-META: VersionHash:5d391d7, CLOUDID:9a210c80-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:240201180336II1JTY5D,BulkQuantity:18,Recheck:0,SF:66|38|24|17|19|43|
 74|64|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:40,QS:nil,BEC:
 nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_FAS, TF_CID_SPAM_FSD,
 TF_CID_SPAM_FSI, TF_CID_SPAM_OBB,TF_CID_SPAM_ULS
X-UUID: 638e4e337349431f968ddb1bd3276d02-20240202
X-User: liucong2@kylinos.cn
Received: from [172.21.15.119] [(116.128.244.171)] by mailgw
 (envelope-from <liucong2@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
 with ESMTP id 497483932; Fri, 02 Feb 2024 16:56:30 +0800
Message-ID: <24a001cb-5170-4a7d-b004-651e5da4d84e@kylinos.cn>
Date: Fri, 2 Feb 2024 16:56:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/modes: Replace deprecated simple_strtol with kstrtol
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240201070226.3292315-1-liucong2@kylinos.cn>
 <87frych57g.fsf@intel.com>
From: Cong Liu <liucong2@kylinos.cn>
In-Reply-To: <87frych57g.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Dear Jani,

I want to apologize for the incorrect patch I submitted. You are right 
that the recommended replacements are not suitable drop-in replacements 
and I clearly did not test the changes thoroughly.
The kstrtol function requires null-terminated strings, so it is not 
appropriate for the conversion needed here. Given the issues, it is best 
to maintain the original implementation for now.

Best Regard.
liucong

On 2024/2/1 18:03, Jani Nikula wrote:
> On Thu, 01 Feb 2024, Cong Liu <liucong2@kylinos.cn> wrote:
>> This patch replaces the use of the deprecated simple_strtol [1] function
>> in the drm_modes.c file with the recommended kstrtol function. This change
>> improves error handling and boundary checks.
>>
>> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull
>>
>> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
> 
> This is completely wrong, and obviously not tested at all.
> 
> The recommended replacements are *not* drop-in replacements. Look into
> the documentation of the functions.
> 
> BR,
> Jani.
> 
>> ---
>>   drivers/gpu/drm/drm_modes.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>> index 893f52ee4926..fce0fb1df9b2 100644
>> --- a/drivers/gpu/drm/drm_modes.c
>> +++ b/drivers/gpu/drm/drm_modes.c
>> @@ -1942,7 +1942,7 @@ static int drm_mode_parse_cmdline_bpp(const char *str, char **end_ptr,
>>   		return -EINVAL;
>>   
>>   	str++;
>> -	bpp = simple_strtol(str, end_ptr, 10);
>> +	bpp = kstrtol(str, end_ptr, 10);
>>   	if (*end_ptr == str)
>>   		return -EINVAL;
>>   
>> @@ -1961,7 +1961,7 @@ static int drm_mode_parse_cmdline_refresh(const char *str, char **end_ptr,
>>   		return -EINVAL;
>>   
>>   	str++;
>> -	refresh = simple_strtol(str, end_ptr, 10);
>> +	refresh = kstrtol(str, end_ptr, 10);
>>   	if (*end_ptr == str)
>>   		return -EINVAL;
>>   
>> @@ -2033,7 +2033,7 @@ static int drm_mode_parse_cmdline_res_mode(const char *str, unsigned int length,
>>   	int remaining, i;
>>   	char *end_ptr;
>>   
>> -	xres = simple_strtol(str, &end_ptr, 10);
>> +	xres = kstrtol(str, &end_ptr, 10);
>>   	if (end_ptr == str)
>>   		return -EINVAL;
>>   
>> @@ -2042,7 +2042,7 @@ static int drm_mode_parse_cmdline_res_mode(const char *str, unsigned int length,
>>   	end_ptr++;
>>   
>>   	str = end_ptr;
>> -	yres = simple_strtol(str, &end_ptr, 10);
>> +	yres = kstrtol(str, &end_ptr, 10);
>>   	if (end_ptr == str)
>>   		return -EINVAL;
>>   
>> @@ -2100,7 +2100,7 @@ static int drm_mode_parse_cmdline_int(const char *delim, unsigned int *int_ret)
>>   		return -EINVAL;
>>   
>>   	value = delim + 1;
>> -	*int_ret = simple_strtol(value, &endp, 10);
>> +	*int_ret = kstrtol(value, &endp, 10);
>>   
>>   	/* Make sure we have parsed something */
>>   	if (endp == value)
> 
