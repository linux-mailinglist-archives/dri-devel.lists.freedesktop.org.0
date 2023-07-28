Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED97670C8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 17:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9993C10E722;
	Fri, 28 Jul 2023 15:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46D010E722
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 15:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690558846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iOF0PHPrH3dJgyFOQfSRoJXhdPgnnuEOgE1WVBQPBqw=;
 b=J1hKJ8YYHd/MLUc+sgOXEJ2pVakKCWmglr9N7Z7IpjhInIMiuYVOKvvpGdyh9bFUVVJP6x
 8FETE9gf4yKoPQ9QG5o9kPg+mtl1EKUV1g7CQwXJBBji2QHoj+LPdqMQBIzYo3tb52pBie
 l55sWuISE+w2+V5JNzNQFv74fVd2KBA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-Dc8V0-c8P82FevVC74CA4w-1; Fri, 28 Jul 2023 11:40:45 -0400
X-MC-Unique: Dc8V0-c8P82FevVC74CA4w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fd22a4cf2dso13625395e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 08:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690558844; x=1691163644;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iOF0PHPrH3dJgyFOQfSRoJXhdPgnnuEOgE1WVBQPBqw=;
 b=IJCxs4kDZp4aCWAsduN5FigVWAnP+pL3y+h3e21AG1GcSxPedb/u73/FfdscHlfSz/
 JfoM906v5lBqWZTdyUvkR1D6mF/eP8Kh5aZDlp5dithm15txq1dO6lYZ3dUDZ+zPVX4X
 eW+VR6lX+sJ+DStVdFavpJ0zOvltUeg/Ju67Z3GVFJ1pCgnirTcVUdPrbOp8PGDa28vG
 FuGQMKdnZt5IG3AwUhgnfLAm44GoECegIJKnkHmqqJjH3aboark83EBcEOMZWt6tqcJ3
 IzAvYpgvPFK6u/LWy8SX3jvSqWY7xUrLmFNvtGfpYXMERva95H6+JphRAslVo9cxdOLV
 gKTQ==
X-Gm-Message-State: ABy/qLasVfDKrUDouOTtfTiZb7x088u1eKRyBg19nDDMg+bEtvsIblGA
 NFc2ttYSqju8a1OcFCJzoSrOfKzYRGZyQDH9tKBb1PJ3NCzijBP83owg53mfekIyPNuAXNLDX3H
 46XbdbrGlpHO5Fkjs2IMBSlWpp9oc
X-Received: by 2002:a1c:4c12:0:b0:3fd:ad65:ea8b with SMTP id
 z18-20020a1c4c12000000b003fdad65ea8bmr2051213wmf.12.1690558844483; 
 Fri, 28 Jul 2023 08:40:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFZkd39vTN4wXd7ZoLniUUkcL0ILftF1YPIm9kU2cl+nZOmsPjF4oBpTaV9XyaQD/ZF8TL9rA==
X-Received: by 2002:a1c:4c12:0:b0:3fd:ad65:ea8b with SMTP id
 z18-20020a1c4c12000000b003fdad65ea8bmr2051199wmf.12.1690558844162; 
 Fri, 28 Jul 2023 08:40:44 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l10-20020a05600c1d0a00b003fd2d3462fcsm9244050wms.1.2023.07.28.08.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 08:40:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Helge Deller
 <deller@gmx.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: Re: [PATCH 2/3] video: fbdev: ssd1307fb: Print the PWM's label
 instead of its number
In-Reply-To: <20230728145824.616687-3-u.kleine-koenig@pengutronix.de>
References: <20230728145824.616687-1-u.kleine-koenig@pengutronix.de>
 <20230728145824.616687-3-u.kleine-koenig@pengutronix.de>
Date: Fri, 28 Jul 2023 17:40:43 +0200
Message-ID: <87lef0xcw4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

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

