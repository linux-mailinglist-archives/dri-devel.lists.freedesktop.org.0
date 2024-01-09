Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6274E828050
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9126810E35B;
	Tue,  9 Jan 2024 08:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB14710E35B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704788268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TYwl3Gm82X1y9bF7T3uXUgWLjuN0mLmE2BxJvtmQvlI=;
 b=PHsTBItx/vsI7EZt3iLxxgdi9jGR1AN6CbPDSgNlxpqyU+taNg0TTs3nSCPqLeIRdmPSlD
 vQR8Fuf+uOwCNn+yBHDoNohSHwDKDSEtF4d9OcLPSkw0CVhWKSkGK2TJzngVR+UioVnjaD
 6kUNOys/VvR48Jg6/ZaKBIxDgA3exTI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-fSsDyFJZMI6YYuTf25OTYw-1; Tue, 09 Jan 2024 03:17:41 -0500
X-MC-Unique: fSsDyFJZMI6YYuTf25OTYw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40e4f70af99so2518145e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 00:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704788260; x=1705393060;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TYwl3Gm82X1y9bF7T3uXUgWLjuN0mLmE2BxJvtmQvlI=;
 b=Kk/YW9qepBCO21HeYYUODYArIq/hQWOqz0J63sQaYyoxLY/q1+vMJCjP/pdlcbtFae
 kP/MzEBrfe4juVVDRzrGMob7vPbQ5jb+MGQyFtXFkfa5whI0aXCduCuDqrDlR5Dd47Pk
 51kj5WNPA/w+24fb+yE0VdlVHGKdwpeIeKdpJlp+EAYzTmyuucjqm2zfVjftls7Dz1IO
 aDWOahiLojKTZ049RViSyTIihb8qwqQZTsAQKwl9Km3W1uqLGF4XWzLKa5d1vO6xodOr
 5cdW+DCJG6UJp6BmCukFFWKqSjjaJrqiVN2XyFBvBBiOOmJhFlF7ebEAHbmOrHmXykpq
 piWw==
X-Gm-Message-State: AOJu0Yzll0WVjyrEX6/cA5+tMm9YsMhe/ZlpRfwNk+JJi39f/RoSSAFv
 s1bVcYwJiYAwhA7DdEfxYp/MbZtqnVQvTCoqIcNzM9uiAv/G22iKOylKthz47CvKjnqiIAiGTHy
 2cFHgaTYxcgTs0ia9j9nBZ52gpm0YOBzuTjTw
X-Received: by 2002:a7b:ce98:0:b0:40e:4865:a05c with SMTP id
 q24-20020a7bce98000000b0040e4865a05cmr1201504wmj.144.1704788260439; 
 Tue, 09 Jan 2024 00:17:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPyXPX8MBPtFN3J4ZHXjeFvlB+/zHNqrDKNgiHYMYHJjKkOj3iwt/RwjRv1ZDD5pH9Bl+h2g==
X-Received: by 2002:a7b:ce98:0:b0:40e:4865:a05c with SMTP id
 q24-20020a7bce98000000b0040e4865a05cmr1201483wmj.144.1704788260131; 
 Tue, 09 Jan 2024 00:17:40 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m1-20020a05600c4f4100b0040d5b849f38sm13979473wmq.0.2024.01.09.00.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:17:39 -0800 (PST)
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
Subject: Re: [PATCH RFC v2 05/11] ARM: dts: omap5: Add device tree entry for
 SGX GPU
In-Reply-To: <20240108183302.255055-6-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-6-afd@ti.com>
Date: Tue, 09 Jan 2024 09:17:39 +0100
Message-ID: <87o7durkd8.fsf@minerva.mail-host-address-is-not-set>
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

> Add SGX GPU device entry to base OMAP5 dtsi file.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

