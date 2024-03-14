Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B294687B925
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 09:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2288C10E1B1;
	Thu, 14 Mar 2024 08:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DiPirn7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1DE10E1B1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710404069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5BKMxqgK8DcYP7YR28rxy8fp44suCGcVHuCxmOCymU=;
 b=DiPirn7Xzvvxm5EP68hCrrUGBq7ZHHJ0rCDnqR60svKd9i2QAj9Ihs744qWcKAI7+aikwt
 +00K3/NTr372qKvorBM9HKdD/NX7CrOO+2xDm0EVWROcjzaoE4S8GUwhzBkklJGSL++Y8I
 IJuXoO+AjpLTaQzN3Lad6CKAggQG67g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-OWtUk_bYOuub5F_CE9wZ-Q-1; Thu, 14 Mar 2024 04:14:27 -0400
X-MC-Unique: OWtUk_bYOuub5F_CE9wZ-Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-412db0e24aeso3533225e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 01:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710404066; x=1711008866;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S5BKMxqgK8DcYP7YR28rxy8fp44suCGcVHuCxmOCymU=;
 b=KevNuGEFyLvuKEUj5Rs9PLvEL1KKrMhHQxO82O11I7Av5GyvpZFmQI8PRFzZTa+Oh7
 PSDwt970LuLTcC/N3cZGDGBvz6XNJ4bVODIapTgMch9ZduXTTLXk5pt8WJRIoi1H3aOa
 xGnqGYdsZ6V8rBxgsBTzs43b+qKvnLCiHNDwgE1ZodMgtkxOtkGPSlNINeRp5WNrkWWd
 CJEAcbi608V+IauUJlpsBXw0W/CLAEyzh5A4BNN7iemHdE7dCU+YbzGORP/VuoCJu581
 WLyv46wXmTbHAWKSPcSK5lQHRCvsvVnkdFw/qmkVg5y/w4z3fi+r/yTQTRx3Uq1x+Wgj
 XLxg==
X-Gm-Message-State: AOJu0Ywl1Foh7kiR0+BwrVRfNo6nRV6haNXM992Nk8xElENgUNuTGs+q
 Ql7XAklxMpdXy+FY0M57MOwZaRFEo/oAQcIfTq6VmbGlo0qUYOaeHLI65HwcckWYwN75F8J4xaK
 FJ9aZI6yfX2X7IJWcMDQAmE6mrptdGlk13QTxJKvAQr/7hJWxAMvY8omKgXJEq47puQ==
X-Received: by 2002:a05:600c:82c9:b0:413:e956:6893 with SMTP id
 eo9-20020a05600c82c900b00413e9566893mr1004023wmb.41.1710404066766; 
 Thu, 14 Mar 2024 01:14:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+8Dpw7ORtoJWMmvhFrCQjByB/znNGYlVHAzzlBWehAOxiErr8eo03IZPpfW9sVU5/VPvdjw==
X-Received: by 2002:a05:600c:82c9:b0:413:e956:6893 with SMTP id
 eo9-20020a05600c82c900b00413e9566893mr1003998wmb.41.1710404066469; 
 Thu, 14 Mar 2024 01:14:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c458800b00413e8df267bsm1596777wmo.48.2024.03.14.01.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 01:14:26 -0700 (PDT)
Message-ID: <0e1ed380-a25a-4a57-9395-56a13bf298c8@redhat.com>
Date: Thu, 14 Mar 2024 09:14:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vmwgfx: Create debugfs ttm_resource_manager entry only if
 needed
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, stable@vger.kernel.org
References: <20240312093551.196609-1-jfalempe@redhat.com>
 <CABQX2QN729DjtdOzAS9jeEP_xHXT4zNaOcP59pa-KyXnME=xaw@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CABQX2QN729DjtdOzAS9jeEP_xHXT4zNaOcP59pa-KyXnME=xaw@mail.gmail.com>
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



On 13/03/2024 18:57, Zack Rusin wrote:
> On Tue, Mar 12, 2024 at 5:36 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
[...]
> 
> Thanks! That looks great. I can push it through drm-misc-fixes.

Thanks,

I think I only forget the "drm/" in the commit title, but yes you can 
push it with this small correction.

> 
> Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
> 
> z
> 

Best regards,

-- 

Jocelyn

