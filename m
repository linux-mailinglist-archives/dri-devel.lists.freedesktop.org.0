Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B0A6A5650
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2947510E66D;
	Tue, 28 Feb 2023 10:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047B510E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677578832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dif3d8cs8O2KtQEjFZ6DOWXyAJDuQSZSskHw5CvEUAA=;
 b=K7CsrqIjU+u5Jgcji9YIRyTrCx4MuHkilCZpO1Wzy8NU4m+eJA+zjJOAM68ze+CgVAK05r
 7Yaz6OJFyVN99tW6Q9dvAvT+VIBL2ZlSqd7h+NMVX0o8xIu5xI73w1F+43e2sSmhHF0P6k
 9s6AnkG6l8+9xj+mNS/5xmHmrRFzZTw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-NWBqDlNIMfmAD5SoQpodxQ-1; Tue, 28 Feb 2023 05:07:11 -0500
X-MC-Unique: NWBqDlNIMfmAD5SoQpodxQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 x3-20020a5d6503000000b002c8c421fdfaso1417722wru.15
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 02:07:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677578829;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dif3d8cs8O2KtQEjFZ6DOWXyAJDuQSZSskHw5CvEUAA=;
 b=id6ZfV1bRq8brLimbrU1OL6gHEGnnzR9QiJCsU/FUz9GCF8eRELldherQ332eIKlQc
 xpjFYV1kbDC1DgTvsKep15Xy869ZXm/6RSn+7MQK7R795w0rnCfqiDu5mokWH1xU1D0u
 9zWV/oFxrNVNWDFC9CROjlG6xZoNTgOQxIvRDDH7c+ziapIoqaSH6b/ttAGaX5mqrUxU
 4jP0Du+P0FY/ObKt7ql22c+bYRirbwXAgvJ/++ebnla7fCYucCvkVRUmOpnfucia/zNP
 gp7QybeA1MaDm6rSOPJFjLZ0oiw5PZKcyXQnrhdcLdRHWNElZyVRUCujlaVYDPjG58i5
 v3SA==
X-Gm-Message-State: AO0yUKX1vWFgW+mLoYMhObI1i3kJlGLCO5pV/b1NovOXQKNGvkhXXBUX
 CxQDcQ9evBBaAU0GBv1V2XIQXB5P756Q23mojpKDJjao5ySNxzjTGybqm5p6v7f9HvPrR/foK6y
 PK9ArRhQsnypL1Bb7tfyesMOE+UU89pqgVA==
X-Received: by 2002:a05:600c:3422:b0:3e2:20c7:6544 with SMTP id
 y34-20020a05600c342200b003e220c76544mr1655134wmp.19.1677578829750; 
 Tue, 28 Feb 2023 02:07:09 -0800 (PST)
X-Google-Smtp-Source: AK7set+n4JAR7uCOb6On7ObuviN6ianqtOEcLOaLo1g7KF3VoWZK3xAtUcLSR+VLvRDIEMtvqu7tnQ==
X-Received: by 2002:a05:600c:3422:b0:3e2:20c7:6544 with SMTP id
 y34-20020a05600c342200b003e220c76544mr1655118wmp.19.1677578829471; 
 Tue, 28 Feb 2023 02:07:09 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n4-20020a7bcbc4000000b003dc3f3d77e3sm11247307wmi.7.2023.02.28.02.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:07:09 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Daniel Vetter
 <daniel@ffwll.ch>, David
 Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Melissa
 Wen <mwen@igalia.com>
Subject: Re: [PATCH v2 1/2] drm/vc4: replace drm_gem_dma_object for
 drm_gem_object in vc4_exec_info
In-Reply-To: <20230202111943.111757-2-mcanal@igalia.com>
References: <20230202111943.111757-1-mcanal@igalia.com>
 <20230202111943.111757-2-mcanal@igalia.com>
Date: Tue, 28 Feb 2023 11:07:07 +0100
Message-ID: <877cw2yugk.fsf@minerva.mail-host-address-is-not-set>
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
Cc: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ma=C3=ADra Canal <mcanal@igalia.com> writes:

Hello Ma=C3=ADra,

> The array of BOs that are lookup at the start of exec doesn't need
> to be instantiated as drm_gem_dma_object, as it doesn't benefit
> from its attributes. So, simplify the code by replacing the array of
> drm_gem_dma_object for an array of drm_gem_object in the struct
> vc4_exec_info.
>
> Suggested-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---

The change looks good to me and it certainly makes the code simpler.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

