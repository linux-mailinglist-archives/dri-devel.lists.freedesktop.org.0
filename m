Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22507670C6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 17:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74A510E721;
	Fri, 28 Jul 2023 15:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5527F10E721
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690558799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjlipSjyFtv6MY6tTLN+fZktLwXxmEn1O2ckmiX3BdY=;
 b=ar5EFbEseKs+eCKbZs7wrm/s1ZLBj2IK6I1wlWDAI5veEt6fIFZDgtSpCEGnu/TEA0uuh+
 F3mWU8YZdyvEVUwmScD5Feg1TSqxCNtj+hwP5G8z1oHJ80F7OTs9++W976FBUQ9Rwh9P4B
 yEia4tp2K4MFMCNa5bMkiDE6Tu/Se9g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-yRYQP3OtPqShLjDma5z8rw-1; Fri, 28 Jul 2023 11:39:58 -0400
X-MC-Unique: yRYQP3OtPqShLjDma5z8rw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-315af0252c2so1320941f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 08:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690558797; x=1691163597;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AjlipSjyFtv6MY6tTLN+fZktLwXxmEn1O2ckmiX3BdY=;
 b=C+yVuNvfGy/CzI2sVLUrZ4BkF3GqaC/RuqCQmQkl3Blk1d9NPBO5GX2Cipiukal8vu
 va9oa7GjGowmIDD5oWzHvoEAGBWuPZaNPGBWiz5pnYtqjrYYY9GiyjtWDYm3cS/JJilA
 //TGW3JL3mqUlHKiVKk1NYqvPMljzI2jBpybaRXbc+S61Yun5b94sgik73SLj1+9IxXc
 vVLKc6DIPdb6afCrC+P6A/MqJkclZW5gGg4HF0TIN4isMqO23FlNd06TTVzglDJ9ouff
 8AWrcOgJyQZtqNAzrZpFQH/+dGG+rcaaC5y7RcTxHkqSuJu/Y6yTqTBpVnFakDKlqsE9
 wCOQ==
X-Gm-Message-State: ABy/qLYFZ8QzCHwnATU5/kMsFW09vcfY85gGkP7x3hLHFKz+31g0Ed0b
 TrcpLBB6KSFjz0c8AMchPDxVAd3krBS0w9OyVJ5TQep6lI7yG2zV1VLRalYtUWr6147cZgTAGFo
 KVuBzwjE211wgY+9TTXZNNduQBUjp
X-Received: by 2002:a5d:591c:0:b0:314:38e4:25a2 with SMTP id
 v28-20020a5d591c000000b0031438e425a2mr77594wrd.37.1690558796943; 
 Fri, 28 Jul 2023 08:39:56 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEbw4bhR27KLvsvYTCKXdYeaAZ51Pj6l0sVQO42zUWJobTMq/GklyvSvtRYwb0HxQxtrYyRFQ==
X-Received: by 2002:a5d:591c:0:b0:314:38e4:25a2 with SMTP id
 v28-20020a5d591c000000b0031438e425a2mr77585wrd.37.1690558796697; 
 Fri, 28 Jul 2023 08:39:56 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l6-20020adfe586000000b0031416362e23sm5185966wrm.3.2023.07.28.08.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 08:39:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/ssd130x: Print the PWM's label instead of its
 number
In-Reply-To: <20230728145824.616687-2-u.kleine-koenig@pengutronix.de>
References: <20230728145824.616687-1-u.kleine-koenig@pengutronix.de>
 <20230728145824.616687-2-u.kleine-koenig@pengutronix.de>
Date: Fri, 28 Jul 2023 17:39:55 +0200
Message-ID: <87o7jwxcxg.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

Hello Uwe,

> struct pwm_device::pwm is a write-only variable in the pwm core and used
> nowhere apart from this and another dev_dbg. So it isn't useful to
> identify the used PWM. Emit the PWM's label instead in the debug
> message.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

