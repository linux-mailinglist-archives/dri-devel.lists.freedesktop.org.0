Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA415AD176
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013E210E30D;
	Mon,  5 Sep 2022 11:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1284010E30D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662377018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=As4yCcd3hHBHBXcao7m1xcH+s7kQozOVt+DY1fyS6j0=;
 b=BpCU7qYLiuEq5aVSd5jHMQXfSnbOQyR/FwcZtpkDrBWKYEZdJaXadTjAuCO2R/KSECGzD7
 6KM7Hqv5YTYcM8WJ9DFv/FADtLgxr4kdJVtkCU2B1DUQZCNHDSa510hBZOUzPnbIsHD6hZ
 mU5Djn4hghSLM9hQHiK7wgwj2D+4/pU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-168-_QZbkwsOOQyb8qbBY-yktg-1; Mon, 05 Sep 2022 07:23:37 -0400
X-MC-Unique: _QZbkwsOOQyb8qbBY-yktg-1
Received: by mail-wm1-f70.google.com with SMTP id
 c66-20020a1c3545000000b003a5f6dd6a25so7338231wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 04:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=As4yCcd3hHBHBXcao7m1xcH+s7kQozOVt+DY1fyS6j0=;
 b=vAMSjiCI3yy1Yb76a9HJnkVj68Vc8l1H2cyrgZz7RUdVDp5q5M0KPsvbNtM0MADNAW
 J/6u41oBC7ZW/89ITF6UVscnPwUj6uxwqyas9qBVG3AeUoYvuSNXl7E9Or31n5alm+py
 6QQutNSC3vOWaZccvp7bnrN3YZFHsZjGVL2SrLA/1LgCZDcv764RVmDXb5k98pVjoBGG
 HVFhklJjH/D2DAofO4zpFc0igd3EmIf3xnsmbnbuqzqa/P1jkI5K8nSkn/ZHBXzT5l38
 kv0VQJi5PhCYzHpCqll+rzKTIopeVb+FlFoiR6ETgI7RnfmqeLnafuVAt2y2BD4urHX+
 kvbA==
X-Gm-Message-State: ACgBeo1o/apOAjC6n4ieIwmuFiB4PQnhxnYN486hDM9FQt8sToy4UoLC
 6qhCc6ktil1qlJbePTnMzzRZI7PoSwRq+OsKrfAt4gPkw2ebwbY4OTxf2PAl0HUGZrDFNDDvvX0
 6EMwF0HxitIucPtfkYg+CIHozSMec
X-Received: by 2002:a5d:6a8b:0:b0:228:5cc0:84c8 with SMTP id
 s11-20020a5d6a8b000000b002285cc084c8mr5921687wru.414.1662377016611; 
 Mon, 05 Sep 2022 04:23:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4JWqEiy6jK3SMnpP+DDYCCY8CODT55Wg8Erqm6CBrPglJqm17Vf3wOseTGHpTXNQTeFoDdmQ==
X-Received: by 2002:a5d:6a8b:0:b0:228:5cc0:84c8 with SMTP id
 s11-20020a5d6a8b000000b002285cc084c8mr5921678wru.414.1662377016432; 
 Mon, 05 Sep 2022 04:23:36 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 3-20020a05600c024300b003a690f704absm16854154wmj.4.2022.09.05.04.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:23:36 -0700 (PDT)
Message-ID: <54a22137-61f6-4af8-dd80-301d180e553a@redhat.com>
Date: Mon, 5 Sep 2022 13:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/ssd130x: Replace simple display helpers with the
 atomic helpers
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220828151114.1141510-1-javierm@redhat.com>
 <6f499b1e-daa4-7de1-6ffc-151663807910@suse.de>
 <03b207a8-e09c-2858-fd54-b95f2e8e8d11@redhat.com>
In-Reply-To: <03b207a8-e09c-2858-fd54-b95f2e8e8d11@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/5/22 13:00, Javier Martinez Canillas wrote:
>>> +static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
>>> +						 struct drm_atomic_state *state)
>>> +{
>>> +	struct drm_device *drm = encoder->dev;
>>> +	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
>>> +	int ret;
>>> +
>>> +	ret = ssd130x_power_on(ssd130x);
>>> +	if (ret)
>>>   		return;
>>>   
>>> -	ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &dst_clip);
>>> +	ret = ssd130x_init(ssd130x);
>>> +	if (ret)
>>> +		return ssd130x_power_off(ssd130x);
>>
>> It returns a value from a function returning 'void'?
>>
> 
> Right. I'll fix it in v2 as well.
>  

Actually, this return statement is correct since ssd130x_power_off()
return value is 'void' as well.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

