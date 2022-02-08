Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A84D4AD328
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:23:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D52210E40D;
	Tue,  8 Feb 2022 08:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1287 seconds by postgrey-1.36 at gabe;
 Tue, 08 Feb 2022 03:36:42 UTC
Received: from smtpproxy21.qq.com (smtpbg704.qq.com [203.205.195.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8CB10E348
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 03:36:42 +0000 (UTC)
X-QQ-mid: bizesmtp2t1644291398t3xbqyerh
Received: from [10.4.23.96] (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 08 Feb 2022 11:36:36 +0800 (CST)
X-QQ-SSF: 01400000002000B0H000B00A0000000
X-QQ-FEAT: lga9F5KbxYawbaOc+Y78OToQZSS1FMhHEE60ySNGprGK0jFFVzBXBmsMxTlbe
 38150VsNOnbqdC+qVPXGDC5+h0xSQ/eoGALgQw5CmveL282T3X8JjM4CHy4CDhiEJGEpMd8
 WtuEgRY/xfJFUAkcbAekAx0R5k0EDf6V0DxobR+M/KHTfSMPbPbSYTTP2l4NpTEk/9PoQ/Y
 tiowZM/SBa0eRm4vp7HPFvpGGHi2XkN7fsT5IvWaJxkGto3WJQUyMxvVVTCd4jeYtlJG3qY
 /0cmOUclzlNkKN1aVXdImTnX4x2m2DG5w/QLXGnGcoJ1bbRP2WjJLN4mVNWS0J3qc5NA99o
 wZSRJ2B93zbqiDzG/XjEA4Jfli9Ew==
X-QQ-GoodBg: 2
Message-ID: <3fae80af-36e9-0219-4ebb-4830dca7f7e9@uniontech.com>+3B933B9D52E5EDAF
Date: Tue, 8 Feb 2022 11:36:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 2/2] drm/radeon/uvd: Fix forgotten unmap buffer objects
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20220129073524.31534-1-zhanglianjie@uniontech.com>
 <20220129073524.31534-2-zhanglianjie@uniontech.com>
 <bebb72d9-f9cc-c247-2d1c-96495aaf5f54@amd.com>
From: zhanglianjie <zhanglianjie@uniontech.com>
In-Reply-To: <bebb72d9-f9cc-c247-2d1c-96495aaf5f54@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Tue, 08 Feb 2022 08:23:40 +0000
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
Thanks for your review. I have resubmitted, see 
https://lkml.org/lkml/2022/2/7/2014

> 
> 
> Am 29.01.22 um 08:35 schrieb zhanglianjie:
>> after the buffer object is successfully mapped, call radeon_bo_kunmap 
>> before the function returns.
>>
>> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c 
>> b/drivers/gpu/drm/radeon/radeon_uvd.c
>> index 377f9cdb5b53..c5482f7793db 100644
>> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
>> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
>> @@ -497,6 +497,7 @@ static int radeon_uvd_cs_msg(struct 
>> radeon_cs_parser *p, struct radeon_bo *bo,
>>       handle = msg[2];
>>
>>       if (handle == 0) {
>> +        radeon_bo_kunmap(bo);
>>           DRM_ERROR("Invalid UVD handle!\n");
>>           return -EINVAL;
>>       }
>> @@ -559,11 +560,10 @@ static int radeon_uvd_cs_msg(struct 
>> radeon_cs_parser *p, struct radeon_bo *bo,
>>           return 0;
>>
>>       default:
>> -
>>           DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
>> -        return -EINVAL;
>>       }
>>
>> +    radeon_bo_kunmap(bo);
>>       BUG();
> 
> That looks like it will trigger this BUG() now. Please also remove that 
> line.
> 
> Apart from that the patches look good to me.
> 
> Regards,
> Christian.
> 
>>       return -EINVAL;
>>   }
>> -- 
>> 2.20.1
>>
>>
>>
> 
> 


