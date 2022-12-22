Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9CB65490F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 00:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDE010E5D2;
	Thu, 22 Dec 2022 22:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2495910E5C8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671749968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
 b=R3o1fe8BnXBGqd2T/6S8pwAk1731L096IG+z+r6BFbmUDK6YpTVFRGcu8YVzuz/IzGq/Yb
 qYnNR63adzA5YqoKbJO3zcvOzwAGdw4BrtmpZevnhR+EM3I4Dv53LXEo6k3Q+nGVDy5CC3
 x9dLfFO5htE2OxbAhicrKwnEzWHu+eU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-1m20bu-FMl2QXkuzaZ6c7w-1; Thu, 22 Dec 2022 17:59:25 -0500
X-MC-Unique: 1m20bu-FMl2QXkuzaZ6c7w-1
Received: by mail-wm1-f72.google.com with SMTP id
 v192-20020a1cacc9000000b003d21fa95c38so1386983wme.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:59:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
 b=w0iKM9YJ2w0ApW7d3bUmo2dByVskdVXTcDL6xmEaj6NvWN02NwvSdMu7gvhXXkxUmb
 8QeiJTHbXKFgIFelBsMUlm+gt5HCvHdgmgD384n9F8T3CqY/NUv8Pr7m3kY/hZCNyQX/
 s+Behl6ROHwf+PR43kYPhdqMfYsEUhvKQfjo+7KrmVMnQ5mQxxx0QVvjXHizxyB8lhe7
 gf57R7XAVZ5vFT+0pNFQ/Iijbk5lb7fFiUwjmcEZfYG+pCM0V82P+Wq/sbuLP2s3rkVu
 CxFx+4+zmta8v+Zj/nSlEiPbYPmu1hwvZFNpImY3IYj3/z04ksErqjND1jVndYSKIWgw
 GcyA==
X-Gm-Message-State: AFqh2kpl400Yx+Tb8sjPbHFBpUZVeoqOpGcl1Vp5GZ0lOvPDtAyrC9+D
 9SiLf0779ALuxIUnVxbho2OLyDXLqDikVpjEn/1w2ogewHhaev188IFQPH42Go1uEwldGk5oM1k
 JNQeR33A8L+FRLHeGzul7P2j1Y64w
X-Received: by 2002:a05:600c:3482:b0:3d3:4f56:62e1 with SMTP id
 a2-20020a05600c348200b003d34f5662e1mr5299592wmq.27.1671749964091; 
 Thu, 22 Dec 2022 14:59:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsF9bhqDxJgYpNS3h0h7UKxGFrWcXBtywt7wPqI0gGeUoCpT/c1pS/cwz/9gvjfUEjOVWDuOQ==
X-Received: by 2002:a05:600c:3482:b0:3d3:4f56:62e1 with SMTP id
 a2-20020a05600c348200b003d34f5662e1mr5299580wmq.27.1671749963929; 
 Thu, 22 Dec 2022 14:59:23 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bh12-20020a05600c3d0c00b003cfa81e2eb4sm2396380wmb.38.2022.12.22.14.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 14:59:23 -0800 (PST)
Message-ID: <82c1db2f-293e-96e3-405e-b0a7ae5ffade@redhat.com>
Date: Thu, 22 Dec 2022 23:59:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 043/606] drm/panel: raspberrypi-touchscreen: Convert to
 i2c's .probe_new()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Florian Fainelli <f.fainelli@gmail.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-44-uwe@kleine-koenig.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-44-uwe@kleine-koenig.org>
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
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-i2c@vger.kernel.org,
 kernel@pengutronix.de,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
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

