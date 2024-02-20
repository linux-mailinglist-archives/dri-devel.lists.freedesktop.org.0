Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C168E85B74E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D0110E263;
	Tue, 20 Feb 2024 09:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TT6ekZ0/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E007610E263
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708421231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cr049JDQLVE6h9YwU+hPc42YZw3O5KaA0156euo/6HU=;
 b=TT6ekZ0/0PYtmQq3P+eHBYnvjlMoiB8yUxJ4rOdOF1+Pp4YkJqqublB095txQSQKgt93wp
 DNSIjJuqXXam/PWofgvJunyfGRLrslJ1hUtEML5bUPA7qXBtX0F0C8fbuLYfKOtK0rbuC3
 X6kF6skwhSsJsSKQHuDXxsZbrF62WuI=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-VFEEbHFIM8mpXWi1F858XQ-1; Tue, 20 Feb 2024 04:27:09 -0500
X-MC-Unique: VFEEbHFIM8mpXWi1F858XQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2d2399a08c0so13897201fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708421228; x=1709026028;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cr049JDQLVE6h9YwU+hPc42YZw3O5KaA0156euo/6HU=;
 b=EtPhlJrJ6p7MVHSL6MNrFaNdxoJovNIUmuerNat9XnrMxhToSJpuF5F6T7RJOF7P4o
 eyhus93n9+p8fiF0SkFePn3vRJJ8E7LvFm8XhsCUwbLhL/3TFCWCghQX+hkyrj0ns1Oi
 UDNGAe7YjDsIBRYgvfEMmtcwXzFE91DY+TYV6vJZQZqQ18cdl7KCUn+99v+QEgjE9UVK
 ywQfiaB03Drzb/ivbqVDBiwW+cgZ/lERPe6YCgYrdXLEIzypcC93cDQmVjKY9x2OjNkM
 mjitPR61qK+M+Ymb1h0FaAkc7l01lEro+6ID/X3vqaX+XDt112bpVhqQeQy0YF/PJS21
 tN/w==
X-Gm-Message-State: AOJu0Yz4M+vo58zNvjUPd21YOELgelQ4cYKEi7m2CcyyyaC9LPmvuPUo
 Db1LBqWX0Gh3ZRi1hpYlEWeLr+UwYI/w14GgXtBlouDDtJ+/RPSb2TZDRgdJu+K13Qq7WgL9kTz
 oEc/dHQcJgnRqymC4pVTwKqLDPpVjZjj57I/6lB2lyWRkss5zMuhfsyEUK8AQplNz8g==
X-Received: by 2002:a2e:8895:0:b0:2d2:3707:485c with SMTP id
 k21-20020a2e8895000000b002d23707485cmr4468709lji.20.1708421227883; 
 Tue, 20 Feb 2024 01:27:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIOUqTz15wX4tpCLDU3x6oh41ZPQVlb/WZWHFmGcfp/tIINmvltfgmSrW/DyUZvNLfveew0g==
X-Received: by 2002:a2e:8895:0:b0:2d2:3707:485c with SMTP id
 k21-20020a2e8895000000b002d23707485cmr4468689lji.20.1708421227590; 
 Tue, 20 Feb 2024 01:27:07 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i13-20020a5d55cd000000b0033b198efbedsm12732585wrw.15.2024.02.20.01.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 01:27:07 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 06/10] backlight/pwm-backlight: Remove struct
 backlight_ops.check_fb
In-Reply-To: <20240212162645.5661-7-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-7-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:27:06 +0100
Message-ID: <87wmqziiz9.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The internal check_fb callback from struct pwm_bl_data is never
> implemented. thus the driver's implementation of check_fb always
> returns true, which is the backlight core's default if no
> implementation has been set. So remove the code from the driver.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

