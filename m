Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D48654926
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 00:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E242210E18A;
	Thu, 22 Dec 2022 23:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA67410E18A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 23:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671750504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
 b=L8GaAvOV8o0m2nW5TMCwxLIzCa3PcTmf0PQuvAfduVOgQOKW8tcwEVN72a1UFvlzb0OM7r
 wsO7byQc8rGOuEe/wBtvbAtMF6iiMjEjazFmm7TDp1ErtpHKYFg5vfroeP/fYfJhcf3gsR
 mwbVQ9k+yj/sxx92MVeB0q+yL2a9kMg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-425-m5WaUUbUOZ6RU3Oyph8nQQ-1; Thu, 22 Dec 2022 18:08:23 -0500
X-MC-Unique: m5WaUUbUOZ6RU3Oyph8nQQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 b47-20020a05600c4aaf00b003d031aeb1b6so2915228wmp.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 15:08:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
 b=61Xi1WiGYCBIlkpOE6lLM5ptqY+L2IUqEDPOzmyXO8wE07jIGAj2CDyZGv/VXpzQkM
 K5iLoT7K7gCPsqePb0//dG/O89OfJpWqiuRCC058V7OBJeUSWtlzUauKHJRLmQqBdjy5
 zDCPGXnfMjZb3n5aYm8LqVp3BSfpNhhbMSmE5SKglDgevOokcZQ1YK88M6rw3vVInEKH
 f/Q1JiylTxzoYJd0ETvmvmKvioJ3I/Z/sWPEH53VqL1uD1ekCSIG902YPLxsAJJjg8nk
 KazYENc1KbO+MKE9+Fn5zDtcYKdSqslELefaFzyzJXodCEJpYwx1J5OikEJlenKAXagC
 orcg==
X-Gm-Message-State: AFqh2kr/DCOIRty05RSv2k4xlvc30DmDZBoVjPDVOeNOg29hzxFe3hCS
 KEGglyvRu14jWFTPNgL4sDXyoDFfNmjz+OjciprS/e+03NzCCyt+S8e3KcqkiYRElYQxbWuulX5
 MQDCFjMPOHWULXHN0L1bjsJLXt5ZT
X-Received: by 2002:a05:6000:606:b0:242:d4f:96c with SMTP id
 bn6-20020a056000060600b002420d4f096cmr4724620wrb.0.1671750502167; 
 Thu, 22 Dec 2022 15:08:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuknSgJRZCSxxH1E5lQjmtZbtMbpRpjoATeV9vbjoxND4THAv6SX6/TCVdUUAJsiNgpR0XUYQ==
X-Received: by 2002:a05:6000:606:b0:242:d4f:96c with SMTP id
 bn6-20020a056000060600b002420d4f096cmr4724609wrb.0.1671750501992; 
 Thu, 22 Dec 2022 15:08:21 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e2-20020adfe7c2000000b0024245e543absm1579433wrn.88.2022.12.22.15.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 15:08:21 -0800 (PST)
Message-ID: <25b2136f-09e2-74e8-4e63-a3ad1fa13ed9@redhat.com>
Date: Fri, 23 Dec 2022 00:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 041/606] drm/i2c/tda998x: Convert to i2c's .probe_new()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-42-uwe@kleine-koenig.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-42-uwe@kleine-koenig.org>
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
Cc: kernel@pengutronix.de,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org
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

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

