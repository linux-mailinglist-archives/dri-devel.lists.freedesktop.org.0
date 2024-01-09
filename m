Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB33828045
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D405D10E05A;
	Tue,  9 Jan 2024 08:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8A810E05A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704788228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/6SvGjQzgj0djYosTjxGA3G76aXlsR8fit+b2iceA4U=;
 b=cfHrRupNTfb9gFHrW9GlJTbqH0y3IhqVtFfHcOMW8Ih/pFPnjtFWIQx0tdkw1dJXji+Oo3
 56KZSgSLgI2Yg8lik4WVTUvI0MOs1foz9ISBC7FFH9OOFYU4ICbg8Xo27w1u1j2tfXH92+
 xR9I6tounS25SNvfaQRlZ+zItd1VTKk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-60AqtHH7Pxq3w_NotGA_dg-1; Tue, 09 Jan 2024 03:17:04 -0500
X-MC-Unique: 60AqtHH7Pxq3w_NotGA_dg-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2cce73a3b5bso22097871fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 00:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704788223; x=1705393023;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/6SvGjQzgj0djYosTjxGA3G76aXlsR8fit+b2iceA4U=;
 b=pjNsVC3uAJ6KT9rKJ+iVSV0vP7G3yJ5+I6G3xaeSqDhhQGeBSMW8/8R7L8z30Z8BWL
 OIPYRGGXSRMgajSFrvuv1ApcClJiLHa9k9BEJHkqTR1Eh4Y5KnjOtRqa/AjPhV4bck2l
 jLrdoqYIeQsMI1ivyUU7GbFgU3eVu5mm3OpvLf019LynHlh9QfosBI9WRFRrdDbyDTma
 bYHX+/UN/dZwfMLPI4apI2+wu251jCFVZY5T08OD88l/+uBU1ewCrYgREwWiCHx5PyZO
 ugFXnE6edcrX0P+KMUPIpVQJXSKjmeMzqqi2aiUUn9nEGWvknrgp+hlKiDqvdec+wvPJ
 gywQ==
X-Gm-Message-State: AOJu0Yx5RXHmyDTQmc2DM9D7XDq6io5+Y4+QIYT8j9L8xSWs68kf78QV
 xwKuUPcPBYJU4C92msJEcPcvJTpEtn30u8WOaEEaWK985vI3ocjSCw+irey029E010ZlNfsoLPu
 2a0aoMh19Mgp9AGxEANs0hJhddv+9AP9KbemS
X-Received: by 2002:a05:651c:200c:b0:2cc:eefc:20af with SMTP id
 s12-20020a05651c200c00b002cceefc20afmr1754455ljo.52.1704788223501; 
 Tue, 09 Jan 2024 00:17:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXdSt0D2TIsDyVPefhROVCDL4qYlTpdv/7GUBf8E3u81rzcgdNCvKFp8M1MVzEIK9FSzaftw==
X-Received: by 2002:a05:651c:200c:b0:2cc:eefc:20af with SMTP id
 s12-20020a05651c200c00b002cceefc20afmr1754447ljo.52.1704788223210; 
 Tue, 09 Jan 2024 00:17:03 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l8-20020adfe9c8000000b003365951cef9sm1701196wrn.55.2024.01.09.00.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:17:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andrew Davis <afd@ti.com>, Frank Binns <frank.binns@imgtec.com>, Donald
 Robson <donald.robson@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 "H .
 Nikolaus Schaller" <hns@goldelico.com>, Adam Ford <aford173@gmail.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 =?utf-8?Q?Beno=C3=AEt?=
 Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH RFC v2 03/11] ARM: dts: omap3: Add device tree entry for
 SGX GPU
In-Reply-To: <20240108183302.255055-4-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-4-afd@ti.com>
Date: Tue, 09 Jan 2024 09:17:02 +0100
Message-ID: <87ttnmrke9.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrew Davis <afd@ti.com>, linux-omap@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andrew Davis <afd@ti.com> writes:

> Add SGX GPU device entries to base OMAP3 dtsi files.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

