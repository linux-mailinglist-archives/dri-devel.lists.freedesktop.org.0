Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0CB82805A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11E710E3A7;
	Tue,  9 Jan 2024 08:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D6010E39A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704788299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n65c4qWz4ks9zOal34K20DK0gagOlvJ5Umts6SIzDOo=;
 b=I/O0IurIDb8SFpbxo2+P+O1wXTmqnlWsmbOt+5gZuE6392LhDk03Ejdi8qsSZ4fodh5R0W
 YKW33VKGcaYxqnS1GTjxJKoEG2c/XIKjUoTxA8eiC/6rlwulvwZvPUa14rihwnZ4u+kjo4
 qCoc86PKddBzrKTxpmmQHTf+Q9knWrU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-4N4uRquuMxWlFSSPJARpUw-1; Tue, 09 Jan 2024 03:18:17 -0500
X-MC-Unique: 4N4uRquuMxWlFSSPJARpUw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-50e86a0debcso2191087e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 00:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704788296; x=1705393096;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n65c4qWz4ks9zOal34K20DK0gagOlvJ5Umts6SIzDOo=;
 b=ByrxIRkWB0iMjQIHieN/eBirDPWA1qJcjBdJpAIEFNZoN9Rs3ttI66FRcxVVbt3aus
 aXvFwHzsxV14VG1BYUUymHfeK5+izjQ8GXlnX5OyQV+ZgD1fT4/TrIuseain8IvGZwQw
 /lOTt5bNIri6srRFw8BSIHR5y9flJVIKNtHtUCdNOjDcQDcI9vCSakgh8R7Qld+hjRWV
 jJx9XQRvO1tSd4BwWH0uIDIGj20ZRdId/mtOARLlH4pX/KRyF2I4P+Ds4fLhHS+p+C5A
 lkag1gBotkT+6KLQVim8fiSun72tO9lEJlOegH+HvPn9vjCrVWNj+1NWtK5QUT3DG19U
 XoKA==
X-Gm-Message-State: AOJu0Yx8ejU8g1eqLbSkCQVfiLw+V1oRfJl7mW/VSPSTUEoLLqDYomWA
 z/5UMCHnUOSX19/NcrPC0WOMfSlenap+jPtCqXBcxYEENjXl7zj162s+GYF8P3QO9cmBh0W2mRr
 5i1FuBbi+y72gu7+3vQeu3Ebt83MiVyMoca9s
X-Received: by 2002:ac2:58ce:0:b0:50e:7749:7b99 with SMTP id
 u14-20020ac258ce000000b0050e77497b99mr2113187lfo.37.1704788296542; 
 Tue, 09 Jan 2024 00:18:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdtUeH2vYHQ8BQ+eP1vRTxNMHVd8DQJlUxLueRlKUz8p2AmTLylqVNqr7Fv47rw3ollbOaPA==
X-Received: by 2002:ac2:58ce:0:b0:50e:7749:7b99 with SMTP id
 u14-20020ac258ce000000b0050e77497b99mr2113164lfo.37.1704788296241; 
 Tue, 09 Jan 2024 00:18:16 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z18-20020adfe552000000b003365fcc1846sm1708295wrm.52.2024.01.09.00.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:18:16 -0800 (PST)
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
Subject: Re: [PATCH RFC v2 07/11] ARM: dts: AM437x: Add device tree entry
 for SGX GPU
In-Reply-To: <20240108183302.255055-8-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-8-afd@ti.com>
Date: Tue, 09 Jan 2024 09:18:15 +0100
Message-ID: <87il42rkc8.fsf@minerva.mail-host-address-is-not-set>
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

> Add SGX GPU device entry to base AM437x dtsi file.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

