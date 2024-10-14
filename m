Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD17899CA97
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 14:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E9210E0EA;
	Mon, 14 Oct 2024 12:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fXdA3DBh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E7010E258
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 12:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728910114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jz+O7ng0GFJAWN74rY5sF0aBksxpe7VRWGO4WN6Z/Hk=;
 b=fXdA3DBhiYOBT/AmQBIuyTlGSV9atxLbSuNJ76mxfnC0TbxAjiMzSyW1j7p8e5pJLjDLsE
 FPu5r99C4g50hMLKWNfVuakzgzhfvlPj2ujGmlpY6do1d6d+fWNJCMHgfl+PJhCHTao5MO
 /BXQotfTg5QPO2qKET9dajsTBUMmeqs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-gZtd69l_PzyLGZGLxx9YUg-1; Mon, 14 Oct 2024 08:48:33 -0400
X-MC-Unique: gZtd69l_PzyLGZGLxx9YUg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43124676f8aso14453725e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 05:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728910112; x=1729514912;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jz+O7ng0GFJAWN74rY5sF0aBksxpe7VRWGO4WN6Z/Hk=;
 b=H/1u/sj3u/rS+XCdG4vhapDJ7fbL8ej2Z0iF3AbKQYTJtra3SHXhrbozJUL1IyhCFe
 J72mCz2grckcTogjyZri5+mT4MeUjkA0+nJRlRwlidfHJagjYLom41BJP6hGAKbmMigM
 oynn31eR3+TQ1htXzekLR0xij4vaJemz9Wou2sJCixEsVHHtN8iLHsGuEtBkSy1UsM3n
 kW4n80ncT7MNndDSvZJ6FlvmVywm0e2n//IgINOofxNHly3A98tvQqO16ktlPbLf9pVj
 Rl7+0anfArGTWmfdILD3ZKzG730TBF0+bPf2yBECzhnW084aTqc2wpd/ohau+GYrVB/G
 BwZw==
X-Gm-Message-State: AOJu0YxDIHD4Qt3xKPGrg2Xt4pvX0I2ACZMr+AhcseXH6OUaBGuPvIKe
 U4Q0g5K57KiIbLz3g0+c67n4PBJE6dQnoS91WePJzBpWpiNb7Vlkd2NxaGEEdqZBCfzpqpEBgtt
 OtHqECNKzIAwGBF/o2R4BMvNxWLDcnk9fwYYBxUy1eAMURBkNw6MQb9XaPwinK8XDxg==
X-Received: by 2002:a05:600c:3b13:b0:42c:baf9:bee7 with SMTP id
 5b1f17b1804b1-4311decab14mr92387615e9.12.1728910111949; 
 Mon, 14 Oct 2024 05:48:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNKMVr8mP2u3/Zc4ug5AuewCTZ9DL/dFTdj/lE65CnsD7NnambyLw3qSxBo5sKDk5QAfMgnA==
X-Received: by 2002:a05:600c:3b13:b0:42c:baf9:bee7 with SMTP id
 5b1f17b1804b1-4311decab14mr92387475e9.12.1728910111614; 
 Mon, 14 Oct 2024 05:48:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b7ee4aasm11245969f8f.95.2024.10.14.05.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 05:48:31 -0700 (PDT)
Message-ID: <e8b90d70-d5dd-4ae9-8088-ca940d1fd9fa@redhat.com>
Date: Mon, 14 Oct 2024 14:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Select ZLIB_DEFLATE for
 DRM_PANIC_SCREEN_QR_CODE
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Miguel Ojeda <ojeda@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20241003230734.653717-1-ojeda@kernel.org>
 <609cf7e5-0fd6-4636-b5b1-b63fe319db28@redhat.com>
In-Reply-To: <609cf7e5-0fd6-4636-b5b1-b63fe319db28@redhat.com>
X-Mimecast-Spam-Score: 0
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

On 04/10/2024 09:14, Jocelyn Falempe wrote:
> On 04/10/2024 01:07, Miguel Ojeda wrote:
>> Under `CONFIG_DRM_PANIC_SCREEN_QR_CODE=y`, zlib is used:
>>
>>      ld.lld: error: undefined symbol: zlib_deflate_workspacesize
>>      >>> referenced by drm_panic.c
>>      >>>               drivers/gpu/drm/drm_panic.o:(drm_panic_qr_init) 
>> in archive vmlinux.a
>>
>> Thus select `CONFIG_ZLIB_DEFLATE`.
> 
> Hi, good catch, yes it should select the zlib deflate.
> 
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

I've just pushed it to drm-misc-next.

Thanks for your contribution.

-- 

Jocelyn

> 
> Best regards,
> 

