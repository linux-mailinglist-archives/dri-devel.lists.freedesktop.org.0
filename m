Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA15663DA3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 11:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F284710E58B;
	Tue, 10 Jan 2023 10:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7464C10E58B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 10:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673345543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
 b=UQwXfZ/mX88wm2yl6n5GS8c0bBB+rLg30V7JW2SoH8d/+SMZhBuepdxJtOI5GI8Zyx9uwC
 jIFFeTBc3X3/Hzhg4D5/wjhx+rLOQ/ayWrpN8mZjXrHDDA8IJWRTOoBym+u4S/psSXN25b
 s3ckGUYEF+7w8e8J+l7Fl60yFMWeLZQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-fKplK_vFNyWA1hJvIq7_Gw-1; Tue, 10 Jan 2023 05:12:22 -0500
X-MC-Unique: fKplK_vFNyWA1hJvIq7_Gw-1
Received: by mail-wm1-f69.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso8781192wmb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 02:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
 b=t1GshgVjaK97qXNX4KFvlYOgusNGo5AzWZv5KxDUqIqmtV22CtRqi7NsPfUCRw/eJK
 lzjHCBSEwXKJzJzJHoTDsDb0wuNZKwdBjda+woA23UM0hsgO/hci09lXysqAzk9uaJkh
 CJ+2t3wVFycU4oqrCR2mCBSnHRdpur1W6NAXwTLLlcIV9a3sBtNVcAYKsvMm3LazMHJi
 x9oJUZX4UiIKnYRznnFscGVabRCRGd1XJejIBUhbZ83T7h2FUFxqfy7eS6hTJIybpbQB
 8cWNTODtLfF7WZ11tSbpAPzSn2JH4oiAAAF2bx6Tq9d3oBytbpxyYzZ1kk3TOVobLuLp
 QdAA==
X-Gm-Message-State: AFqh2komSeHzY7lVKnKHazY2NtoWfWRhCRMoraygBMIlvKIfLfdCEDeX
 SU7Axi9EWwP1PQXOJYmoMed1Do80K/nmpNIhFgztMio8rZfkBvrjAMzNE8HPqLe/pJfI6/X2CMB
 GH0vHbZ0F+17AnOdpYTxak95aCTut
X-Received: by 2002:a5d:5c07:0:b0:242:3353:26f5 with SMTP id
 cc7-20020a5d5c07000000b00242335326f5mr44058184wrb.9.1673345541773; 
 Tue, 10 Jan 2023 02:12:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvCNfc6Oe2/roXEpUqXOAP/C2Xt3ROEXZRzWcQHof0gVutmncRgr0y83BsdzLD84z2dckLiZA==
X-Received: by 2002:a5d:5c07:0:b0:242:3353:26f5 with SMTP id
 cc7-20020a5d5c07000000b00242335326f5mr44058173wrb.9.1673345541594; 
 Tue, 10 Jan 2023 02:12:21 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m5-20020adfdc45000000b002428c4fb16asm10996013wrj.10.2023.01.10.02.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 02:12:20 -0800 (PST)
Message-ID: <793334fc-50c5-033e-c3b5-966c550fc94e@redhat.com>
Date: Tue, 10 Jan 2023 11:12:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 042/606] drm/panel: olimex-lcd-olinuxino: Convert to i2c's
 .probe_new()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-43-uwe@kleine-koenig.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-43-uwe@kleine-koenig.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/22 23:36, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

I've pushed this to drm-misc (dri-misc-next) now. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

