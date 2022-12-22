Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4365491E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 00:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6C410E5CC;
	Thu, 22 Dec 2022 23:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1B810E5D0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 23:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671750309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
 b=O5lVI3FlRN0B9nmxttGl3Q9uFz4hcqNlBmUip/2n5yP3poNJf3Y0UVrlsMbENLmAAD7hrB
 rIFsZ9hErgL4oOwGfmxy6iuOxpJSWA8v1Xth6hCiekpia6WN0U3c2Y8oh2w8d+T+BFHey8
 hTerLensdCujm5OPMUBDax/WwyR/LVM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-3eB3KWb_NP2yzhz6-0TCtg-1; Thu, 22 Dec 2022 18:05:08 -0500
X-MC-Unique: 3eB3KWb_NP2yzhz6-0TCtg-1
Received: by mail-wr1-f72.google.com with SMTP id
 k1-20020adfb341000000b0024215e0f486so760943wrd.21
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 15:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
 b=DQWT7dKvpP7wNUninw5+NKvZseCzAmWS+Zc/p1W5BzdWH83kpOQ76l/o0+URbzK1X7
 Vs8p6nzuC7GePP27epmCpj8ctJPtinr2gsicLDsAmYv9AnhKDP57OQBzyXWbHL4Xeka1
 qCX0A28VFTYzX4ClpOmvd2JAjXxvWcdnCFdM1tenhjgxpu6uqmePaBTCFNFJKXkeOlxd
 uGlMPkBXoSEyG/9pU45OcOYvXxYmG2UG4G5mYZEi8fEJr9FkutCrWK6sPpW2J+Y9hx2s
 wS0JY+nlLYeGc1LPwQHUTlP8G+/KgryLxFpwaWeOYHEaOLlMBmSRatAvbqkptmpPeEW8
 NCXg==
X-Gm-Message-State: AFqh2kr7sxoyY6jQ7fIT4e2uURmHBrsx3NNYfqYsZfdsNulvTuZIey1/
 1TJ0qZeNjzf2e2cs3kFbFVpYVbQPXExiAz6k9Mx/fhQcGxbNz+c3GoymR4rO4i425KXCN2kwXJ0
 CP8k4Ayb7qEyfKReiSJkuBo/NUqi2
X-Received: by 2002:a05:600c:1509:b0:3d2:17a5:17fe with SMTP id
 b9-20020a05600c150900b003d217a517femr5668681wmg.18.1671750307397; 
 Thu, 22 Dec 2022 15:05:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvD25Z/YHiooSzgqh71tRpQOAEo73yfqsXEDBtcnZt/C2er07zo/l+UVRh9D9JHC5Wgs75O2g==
X-Received: by 2002:a05:600c:1509:b0:3d2:17a5:17fe with SMTP id
 b9-20020a05600c150900b003d217a517femr5668668wmg.18.1671750307172; 
 Thu, 22 Dec 2022 15:05:07 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y24-20020a05600c365800b003cf894dbc4fsm2349947wmq.25.2022.12.22.15.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 15:05:06 -0800 (PST)
Message-ID: <6fb84448-0b05-eb9c-40b2-3e9dc9bb51bc@redhat.com>
Date: Fri, 23 Dec 2022 00:05:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 039/606] drm/i2c/sil164: Convert to i2c's .probe_new()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-40-uwe@kleine-koenig.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-40-uwe@kleine-koenig.org>
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

