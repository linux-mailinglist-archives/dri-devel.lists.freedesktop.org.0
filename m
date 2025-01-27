Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FFCA1D641
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 13:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CE210E238;
	Mon, 27 Jan 2025 12:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ku3Mk2B2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE22A10E238
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737982363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=II3TarzP0vPWid8xA+lfzZLs90rFzqzn/s7scc+Ffkc=;
 b=Ku3Mk2B2A36YTvuxXEqsAsLsotSMjbt/H+j9a061c6ssAySDiDYtMQKL2BqFOeBMvySRyk
 A+0CFNLKmdPZ4VsuygdkIi3GjBuUcOD9ILmQHSe1eblVpvMiPyek66/MS99F+9a5xCwmQn
 iirCdn7xI7NXBKf5/v/kQUp7q3cFBBY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-Yv_4fmXnMP6gvEDMKBMrqA-1; Mon, 27 Jan 2025 07:52:39 -0500
X-MC-Unique: Yv_4fmXnMP6gvEDMKBMrqA-1
X-Mimecast-MFC-AGG-ID: Yv_4fmXnMP6gvEDMKBMrqA
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3862a49fbdaso1538584f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 04:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737982358; x=1738587158;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=II3TarzP0vPWid8xA+lfzZLs90rFzqzn/s7scc+Ffkc=;
 b=AauqX8uSOddI7PE/pWejFsTYGcqAUs0+Up490o140QI0b7/VjaxFBpqNQYUuAlmXpb
 DzHBuVvy4v8slkHZvxpFe3kaBAsAkAoqPIwfKzhC+dEhquqJxtVO3t6h2QWpbwBlDywL
 i3RGmJDOzkdk2xWr43h8LBza1jAS3VDBu7iYPB9/WQuTaGxnQl5aTTNYJuZJVk3wDbQD
 R4orpne6VxFcwH18LFCV9ype5Acj79KTsl4H2Z9V2CFTgkD6yEr0qGi3xl6DMpkBz4vs
 4CZ8PKUDpB7/DRoQBZH3FJtWDCvxG7s14nqS0qMv0Axu8ekpTYcz2uuCNis/1BGrgULv
 MCYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa8zQkqUyJeKESU05zVb4JtUu6K+M8+OMKdHOBRKZ4r5YW8mHMsY4VPiXBKnlb18GdnKRcU+KQayM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaUcd5SRuTm3QFs4cc1m8iHoBke5Kn2P8r3KGuHjXyNeIIGLYh
 jFD0yd2QuwR6ozLAb4uHUFyUVxuI3qoPMKlPaIjrMaymPDRPVwobNF+xcDZtlfvL+Xl81R0i42q
 LbrQlGJjEoQwrF5+yWzKq/rdgc/SRf1VJTRl4/8/mx2od7EakAZ1Tp2e8iGmnuaZs3g==
X-Gm-Gg: ASbGncsiopHwbi2qX9CZcgJ2n6gQl4idfNka8jnMp3eEV0emctntIBDlKDghKo3+T0X
 92D6+9c8rS2eU7SxvdWkBQoG4b7EsSsShWhoXXjwNBtdr5fVC9/KDSyRsheze6sHLtM0IbPtzfW
 4+dlaRwuyv13zmtbUDeu/T60+x3AhyfyJCkMPTLmNFbwS9wzN9hPoWp+QLJSrpB8OOIsjCDtrBe
 ykDzs78zpJKwiK121x0/NOC5iBnVl2feghWL4tOUWomI3r2vB8xj5222pm0ijLD2/XcexHNMdMn
 XUmSEPvEFLEfIQlz3C7/etk/GfFlsK/hKYjUlhqOs0MF
X-Received: by 2002:a5d:540c:0:b0:385:ebea:969d with SMTP id
 ffacd0b85a97d-38bf56633c2mr24794249f8f.22.1737982357913; 
 Mon, 27 Jan 2025 04:52:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBOs3kUg6vEfQKQP86bbISePUJi081XdPSeBGkIciE74yl+jOUXVAzcvfUZBr82cEr/lcCUg==
X-Received: by 2002:a5d:540c:0:b0:385:ebea:969d with SMTP id
 ffacd0b85a97d-38bf56633c2mr24794228f8f.22.1737982357478; 
 Mon, 27 Jan 2025 04:52:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c3c8csm11224247f8f.90.2025.01.27.04.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 04:52:37 -0800 (PST)
Message-ID: <c0446bfe-5a06-47e1-b12a-3fae73365f36@redhat.com>
Date: Mon, 27 Jan 2025 13:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ast: Fix ast_dp connection status
To: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie
 <airlied@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
References: <20250124141142.2434138-1-jfalempe@redhat.com>
 <93bfabd4-20a8-4d56-898b-943dccb41df2@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <93bfabd4-20a8-4d56-898b-943dccb41df2@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m_X7imuA7NK0HadqbSRqUTbPlm4ZFNhU5Hr7WkVz9FQ_1737982358
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 27/01/2025 12:55, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 24.01.25 um 15:11 schrieb Jocelyn Falempe:
>> ast_dp_is_connected() used to also check for link training success
>> to report the DP connector as connected. Without this check, the
>> physical_status is always connected. So if no monitor is present, it
>> will fail to read the EDID and set the default resolution to 640x480
>> instead of 1024x768.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during 
>> atomic_enable")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v6.12+
> 
> I cannot reproduce the problem, but the patch looks correct. My AST2600 
> with ASTDP still works correctly with the patch allied.

Thanks, interesting that it doesn't affect all hardwares.
I got reports from two different vendors about this issue.

If no other comments, I will push it to drm-misc-next tomorrow (only 
adding reported-by: and tested-by: tags).

-- 

Jocelyn

> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Best regards
> Thomas
> 
>> ---
>>   drivers/gpu/drm/ast/ast_dp.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
>> index 0e282b7b167c..30aad5c0112a 100644
>> --- a/drivers/gpu/drm/ast/ast_dp.c
>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>> @@ -17,6 +17,12 @@ static bool ast_astdp_is_connected(struct 
>> ast_device *ast)
>>   {
>>       if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, 
>> AST_IO_VGACRDF_HPD))
>>           return false;
>> +    /*
>> +     * HPD might be set even if no monitor is connected, so also 
>> check that
>> +     * the link training was successful.
>> +     */
>> +    if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, 
>> AST_IO_VGACRDC_LINK_SUCCESS))
>> +        return false;
>>       return true;
>>   }
>>
>> base-commit: 798047e63ac970f105c49c22e6d44df901c486b2
> 

