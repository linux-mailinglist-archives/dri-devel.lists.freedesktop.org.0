Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E19FA663D94
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 11:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B25010E586;
	Tue, 10 Jan 2023 10:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE3210E582
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 10:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673345449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
 b=IovgLdytgIredn/kizpL8IBt724jp6kJo8Lrh9uUJp4s/4qAn7lfViUq7QsHx0WpgeEfE5
 gfh1JqtBD59qcDbd0tlYevv+Tm6Q+aGt2g0sZbdFZsYBsEtQGsp8NAMV2idxVPLVsIYN/S
 ZcX/FDwKuQxlUHd+j/o7KMatHtHdQCU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-mZfvQjHqODKMkN8CUn1VWw-1; Tue, 10 Jan 2023 05:10:47 -0500
X-MC-Unique: mZfvQjHqODKMkN8CUn1VWw-1
Received: by mail-wr1-f71.google.com with SMTP id
 l18-20020adfa392000000b002bbd5c680a3so1361387wrb.14
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 02:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
 b=MnSwX9f4bN9k5II7zIcg1UjGfh2vNNe217UzNdbVNJwPS7HJI51xv3jpHQDkukNoEv
 nrqaPLVScb0xjhtKi7ADOzi0cyon1Q82aDvMxEMkmwSxRU5119rbN/0/06uy+tN/TuoW
 G2Hesk449k2znfCIm9TqGkETX26sZhLJ5xLcKDQ8fTHyqG9zjA+gAmUhMomfekwqYKkK
 Eyt6F4Af7PDmAvPkM4DjZVEPjz6dUhUrYwG+7OinDzE7Ou+bTK5EZBNWucnHed4nO1LR
 kcnR+O7FWqVSTcqWOj8Z+Z/WWc700JrKX+z7NeDpW+5NEFt4ZDLChRH1tNbvhqvNFOqB
 w5lA==
X-Gm-Message-State: AFqh2koC2dOYKO2sRkgrhlCxAk9rhiTmkPPgwUr5PYsDAkukrWqhvFoe
 Q7xTP5K6IsDvFaCyDQGZ558CU1f1/YLdnobYJMiqbIORP8NYVwyP5i7RWbhYHeQysCz1Wj6AGBN
 PlKhbiJkHh6Pqn+kAtKNicnls9Dnq
X-Received: by 2002:a05:600c:44d4:b0:3cf:7925:7a3 with SMTP id
 f20-20020a05600c44d400b003cf792507a3mr48001538wmo.24.1673345446640; 
 Tue, 10 Jan 2023 02:10:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtCaGy649oJyyMLaGDn2H4O3O+B/V9Ndk46ypRQlhZdduR+FByER9txa5+XPtVk9k1GBxK2xw==
X-Received: by 2002:a05:600c:44d4:b0:3cf:7925:7a3 with SMTP id
 f20-20020a05600c44d400b003cf792507a3mr48001519wmo.24.1673345446478; 
 Tue, 10 Jan 2023 02:10:46 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003d04e4ed873sm21349198wmq.22.2023.01.10.02.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 02:10:46 -0800 (PST)
Message-ID: <b5ad4a5a-50ed-4bdb-024c-e2ac76c79edd@redhat.com>
Date: Tue, 10 Jan 2023 11:10:45 +0100
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

I've pushed this to drm-misc (dri-misc-next) now. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

