Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39855828049
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552DF10E2F9;
	Tue,  9 Jan 2024 08:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6444110E2F9
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704788246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q6w3leRHCC6CcQan4ottdZ6Fh+PPK3Yj5tZd7cVIuis=;
 b=h47Boc43vY2/lcbIHFR5BC3nhAMZu33gNLq5T0DhE/iG8Vgo3Z8iAB5HXZNG7R6JdxqbQe
 0w78rB2odYptw5b+k7bLU7sHMjj8ygjpfwv/rfuha6M+zxdAQWjL2Jd7L00GNVFMW7rUV7
 LVM14rnDa9670j+0lM1qcZiHXlVTPb0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-OCGloHSWMr6trs5CfpLCxw-1; Tue, 09 Jan 2024 03:17:25 -0500
X-MC-Unique: OCGloHSWMr6trs5CfpLCxw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-336937b3cf5so1741239f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 00:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704788244; x=1705393044;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q6w3leRHCC6CcQan4ottdZ6Fh+PPK3Yj5tZd7cVIuis=;
 b=cj6AQRn/yD2ssaXrfLduP+Mp/PHQURSsVYXltyOl23wuuqoN49UzZh06O0kjsIIhEh
 gbDHn68AY3YljYqpdkG8kunJa0WEkdWPDDvyZBVRLACabbAwuiPiu+fghMbEL0GX0fwM
 SFFVA3UGoHEzPVV7HwICUWhLxazmmWb+tB+fkr2yTwahZVYFIzV3erNCo8h9aaUxwwW7
 +8T/cSjYaeH6SEYQiC8KENbkev6hncXpy2udOszDCqWaVkXWqN+VY3Pc6KFdfypiCy/c
 7JatGaKz8m0dLOHA4AvXIS8XujsewqP7eJblR9kvF6+xNSmY+F93Sq9/7fqv+UZenBQp
 HRvA==
X-Gm-Message-State: AOJu0Yxdk0UdRG130H5IbXJoMXzht7kqWBKmvoYIBscOULEVZ/PtUR+n
 IoYizwzmazg5mJxzFq4nLqMtgakaTSd48RN3XLo3gr3bfODOkUwjYcKJEspSvZV/9lAziqfGe8s
 3BA8czNBCNFdALJYS9T8XwzueQjnWxEaIAdPY
X-Received: by 2002:a5d:4745:0:b0:337:5c95:61ce with SMTP id
 o5-20020a5d4745000000b003375c9561cemr198823wrs.97.1704788244097; 
 Tue, 09 Jan 2024 00:17:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHStCnTO215moFCK9p8lkCQa0U7PamVTx0JKv0Duum5S0J8VtFtCBGfw0DR51jsrXawbtvNiw==
X-Received: by 2002:a5d:4745:0:b0:337:5c95:61ce with SMTP id
 o5-20020a5d4745000000b003375c9561cemr198808wrs.97.1704788243872; 
 Tue, 09 Jan 2024 00:17:23 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m2-20020adfa3c2000000b00336c9ad1173sm1726260wrb.26.2024.01.09.00.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:17:23 -0800 (PST)
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
Subject: Re: [PATCH RFC v2 04/11] ARM: dts: omap4: Add device tree entry for
 SGX GPU
In-Reply-To: <20240108183302.255055-5-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-5-afd@ti.com>
Date: Tue, 09 Jan 2024 09:17:23 +0100
Message-ID: <87r0iqrkdo.fsf@minerva.mail-host-address-is-not-set>
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

> Add SGX GPU device entry to base OMAP4 dtsi file.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

