Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB214654922
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 00:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AC310E5BA;
	Thu, 22 Dec 2022 23:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACFF10E5BA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 23:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671750425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
 b=hBWLN/ArPaE71CGOIxV8U/h29dDfwVOUJlp0q3wO27mHcBl7pBypSGHT49prkVxIqW6JVg
 jD2VyB+zkpop5BK5zAuw6RpHiZIw6iGjEBaW3m6pXYWHRMWYPJ4tYVJiJqYF3U9tGMGeMG
 rUOAJxhOpwTzDR/wzWPJzXfTkq3mnIY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-3-c4-4iXVQNa6-VignS9gSUg-1; Thu, 22 Dec 2022 18:07:04 -0500
X-MC-Unique: c4-4iXVQNa6-VignS9gSUg-1
Received: by mail-wm1-f69.google.com with SMTP id
 9-20020a1c0209000000b003d1c0a147f6so2923922wmc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 15:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
 b=RVWhIlvGMK+0h9Na/YkRYP4Wps/OYDPzlhiJU5dg2WnpxyT13bnGSWd+ir7Y2yU9uR
 C63e491YGY4WdsYDNnde9TL9at08RYWt7N44A1l8SzZHR+upozHF49zZ6rwFmKy0lF5H
 BhKjqPZMTqJ7WIqgSXKoxpmh8I8/aWUqTmaMc6np7lbefZr+ti2+hvCQCclt9a4wUU11
 99tn4A1LgceN8OtVPL9zxuhq6r1BmkKQaR6XEE0UmBtQipApcFmBuFz3idYjFny2Vi9O
 0JyF5NdkYceKsTKJ0lrrRSNn58TtRzDOfLJbN1jHwJSavIL4Y21aLuBIRqUMNWHrPE/d
 hBAg==
X-Gm-Message-State: AFqh2krt8eW1pfY3VTCD8fbaCcX86xXWew2aHlV6Ido5Gvz/qw9hw2Gn
 qSA2GJW/5rOaOVRRJT36ZS6GThcbd9NrBDqq2zfC+ioaJAl/TVQoylZsHDFXYlZYmqBNbhXBm60
 mKKqDNZ2iA4x1zw+1x9q0vUzA76aj
X-Received: by 2002:adf:f052:0:b0:246:e6df:86ea with SMTP id
 t18-20020adff052000000b00246e6df86eamr4347844wro.25.1671750423460; 
 Thu, 22 Dec 2022 15:07:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvrH4klu+A74NrToZfregAlXdCxKG5tW/xHZwohrIMNsMXyCpQxwUiG2Ea2TWPs1C6BwLEC8w==
X-Received: by 2002:adf:f052:0:b0:246:e6df:86ea with SMTP id
 t18-20020adff052000000b00246e6df86eamr4347835wro.25.1671750423242; 
 Thu, 22 Dec 2022 15:07:03 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c17-20020a5d4cd1000000b002425c6d30c6sm1821042wrt.117.2022.12.22.15.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 15:07:02 -0800 (PST)
Message-ID: <4042f56c-22c8-0ffb-46e9-dfedc1d259ac@redhat.com>
Date: Fri, 23 Dec 2022 00:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 040/606] drm/i2c/tda9950: Convert to i2c's .probe_new()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Peter Rosin <peda@axentia.se>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-41-uwe@kleine-koenig.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-41-uwe@kleine-koenig.org>
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

