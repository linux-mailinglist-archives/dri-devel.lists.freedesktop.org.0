Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69005663D86
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 11:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5582610E583;
	Tue, 10 Jan 2023 10:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B7910E583
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673345335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUQwFTHyl5sEmJS56v9Sd6SQsFJb1ixfUiHemWZdP4c=;
 b=D9Q+zRn3YrG4kau28vNsEaRyKid8LzP1fWzU1sDkNEXR1G7c+cCkwX2u20vW7tYW/JuqLp
 mYqOZj/mf1ZJHq6yERfnWVI3LJzm1e8kiJD3B2ba6HTBLgzTqVM0ygaKjWc4t/g4YDV2eF
 epbCVeKYvUeWyWLa55RXvuEQx548Zc8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-224-tv53-D3QOY-qBkCCAWuW-A-1; Tue, 10 Jan 2023 05:08:54 -0500
X-MC-Unique: tv53-D3QOY-qBkCCAWuW-A-1
Received: by mail-wm1-f69.google.com with SMTP id
 k20-20020a05600c1c9400b003d9717c8b11so6096297wms.7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 02:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dUQwFTHyl5sEmJS56v9Sd6SQsFJb1ixfUiHemWZdP4c=;
 b=59PfpwaYvLBvxjvCC88XfWmhdG8yPj81jza0NK0Vw3bl2awxecVcJRU8LAoSLn15qz
 rMuZHuZVvYX7PB1cZGvoPyLw63TdNqF7gcD7Cc0wc7N4kdTUks2hmKjUrJem7eCKtgSx
 455TBI9EA2nkQuToqzTnyhF9HaKCi+Z+MYIB5rWwTdQ6fb3o6fk3KnYYptUjr0KVfhrI
 00PYzUQG7HwfkmV1Z/WNXJveFxD47kSvG7XeyAaSNlUSWIVxsiMcUyBDpQHo5wiweR+i
 5jGIsxcqMT5tfYcWfikqpM05qwI1TNskgZggX0TbA5xwiKD1g7ehKlzFiLGpK66LwPoG
 +IBA==
X-Gm-Message-State: AFqh2kqkjLT67If7/TwhmFdZmVhC+dVpQfmwD6SlkUaddGWm7VZfetyz
 Tc/KNnRIeSj+mqeJ9I2AGofVOe2haHynosKs45CQjMJ6Mio5SPljUOYqi5q+sZEgOWlKRLx9cXm
 S3wR07rFYqmbkM6PD4NQ3QgtvpfOu
X-Received: by 2002:a05:600c:3acd:b0:3d1:c354:77b6 with SMTP id
 d13-20020a05600c3acd00b003d1c35477b6mr52724141wms.29.1673345332658; 
 Tue, 10 Jan 2023 02:08:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/py9Kv0oVi6P3Ptag/7hVBbgW3PiV69fUX3cuCwR1paAwVPlvDxIkVZm9fEGVET3j5dsi4w==
X-Received: by 2002:a05:600c:3acd:b0:3d1:c354:77b6 with SMTP id
 d13-20020a05600c3acd00b003d1c35477b6mr52724121wms.29.1673345332487; 
 Tue, 10 Jan 2023 02:08:52 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003d990372dd5sm20873329wmq.20.2023.01.10.02.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 02:08:52 -0800 (PST)
Message-ID: <87ab7f23-d60d-108f-664f-82e5d6bdad50@redhat.com>
Date: Tue, 10 Jan 2023 11:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 038/606] drm/i2c/ch7006: Convert to i2c's .probe_new()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ajay Gupta <ajayg@nvidia.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-39-uwe@kleine-koenig.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-39-uwe@kleine-koenig.org>
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/22 23:36, Uwe Kleine-König wrote:
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

