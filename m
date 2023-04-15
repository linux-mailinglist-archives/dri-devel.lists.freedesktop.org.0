Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172626E33E8
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 23:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F3510E206;
	Sat, 15 Apr 2023 21:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C5310E206
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 21:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681595492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZJmCfWBB3QhjJqyb/DxZRtWXJ7VsAMXByp8O5M+2tY=;
 b=KICxAAZkPCci+wGjq/+jUu5b4XnvIGtqSz/0PLayXO7Os19B/dRftxtB8v0kyw6lCuT/Eh
 zIr2xun/Gzo3SDREZFTMCm0hz4rUrFCrVAiqX6XdE5qU9pL1pkUzAhTmukY7xRF7qnrpmV
 ap5P/tWmTczFUjx/l4f74GHvIjxujEY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-hyCNmDuMO22YgIAJAuU09w-1; Sat, 15 Apr 2023 17:51:31 -0400
X-MC-Unique: hyCNmDuMO22YgIAJAuU09w-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f16ef3bf06so718095e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 14:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681595490; x=1684187490;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aZJmCfWBB3QhjJqyb/DxZRtWXJ7VsAMXByp8O5M+2tY=;
 b=lt+UakIXSlGAeOnxkSXovh5/Qgseake3C5NzubiAgyJysckrCLrx/5Kwr7Hc5npky4
 mrMB3DzHys2P5HqhhuXn3FlEOAp6z7G16934wvJkeGUjJD9bzOpHLKT5d5E4dUB9zFVY
 IqrFDLP9ixWQz0JhzRe75oZAy6kCtU+oU6DWbee4iRQV5AUC524sTqlD29rHv9zoGBVZ
 a7XE3ZOhSkX4crTN4cs5KWVWxMoob5WO6AgNnrVM2bJJd0lt2K2lIBAQWk8FlugkNa+R
 215ClxlyJfRFGaOA2HjKW5Ykmc0IIc37wLWoRrhnXPim8R6HP98hR3wbxtPX78S+Q+kF
 sE/g==
X-Gm-Message-State: AAQBX9czuXke0bCmxet5D7rxAxlktO9cnc3A3+PZeCxM6gvlHFEyLsKv
 5SDIp4p5BjDD9bFyHZe1m0/gHbqJLDeIULFFJFjSCkM9Cc4KJf5vD6OfmBpiYyTfOuF7sD0vfOX
 jliGvQhD1pM80ssYWpZ64J2laRMQT
X-Received: by 2002:a5d:6047:0:b0:2d3:b1fa:3031 with SMTP id
 j7-20020a5d6047000000b002d3b1fa3031mr2272057wrt.16.1681595490310; 
 Sat, 15 Apr 2023 14:51:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350bQPuS1I4SCR9ODjkrwq8mehIXU5VgArr61hpu+s5V4UaFZGgNx4T+7tvHhr2YI7U1uFTsQ0g==
X-Received: by 2002:a5d:6047:0:b0:2d3:b1fa:3031 with SMTP id
 j7-20020a5d6047000000b002d3b1fa3031mr2272049wrt.16.1681595490051; 
 Sat, 15 Apr 2023 14:51:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p3-20020adfcc83000000b002f27a6a49d0sm6556085wrj.10.2023.04.15.14.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 14:51:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Dan
 Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/imx/lcdc: fix a NULL vs IS_ERR() bug in probe
In-Reply-To: <20230322091604.3zgzogskrtn3evur@pengutronix.de>
References: <d0a1fc55-3ef6-444e-b3ef-fdc937d8d57a@kili.mountain>
 <20230322091604.3zgzogskrtn3evur@pengutronix.de>
Date: Sat, 15 Apr 2023 23:51:28 +0200
Message-ID: <875y9wg6fz.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Marian Cichy <m.cichy@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

> On Wed, Mar 22, 2023 at 12:06:55PM +0300, Dan Carpenter wrote:
>> The devm_drm_dev_alloc() function returns error pointers.  It never
>> returns NULL.  Fix the check.
>>=20
>> Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>

Pushed to drm-misc (drm-misc-next). Thanks!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

