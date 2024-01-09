Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9A1828035
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CE310E396;
	Tue,  9 Jan 2024 08:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5145610E396
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704788096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XjjwhVNGSNqCSg1vyGrdOD6jXBKYkFrF+Jag2J5d6o4=;
 b=IiyRRneEU2nXBJYlSYnS8aKDHNAdAXFxkwOBRo1/iOT4qWjOupW0UWizE0ybEZ9NSiS5oc
 rvM2Fy/rkFFGkvKXtRY/kvjGAD9SrSQ8qCk0T+VTJS3XwX3s108eb6CjVABFGejT1jltFN
 CGQr3N9sgYF4yvEOX31cfLXFVBY8u6Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-pBUuX-FePEK1P2b3nuOhQQ-1; Tue, 09 Jan 2024 03:14:55 -0500
X-MC-Unique: pBUuX-FePEK1P2b3nuOhQQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40e433874e4so16458465e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 00:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704788094; x=1705392894;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XjjwhVNGSNqCSg1vyGrdOD6jXBKYkFrF+Jag2J5d6o4=;
 b=Ta5AJeVMduxAlFDHtOWVvkQqnQHF8WHqNFcw78s2j4R4Zlmxgi+lehA/n5AVvE68cD
 2ylRLGoa83iKpcuEdGASHnoI+SnCbbxeZXTjfAZHp30TDasnCfq3+r1Iyts4QEMV0yOW
 Tu/+wp98GchtaTdyZWh6NN+UCOeaIH5BB/UEhsIG5Sj7flV2VGx2jwQZ5ZojIlEtZA4H
 XMlHd4OWR5rrreFfNYf2wfaA9LXxfCmRR0Xm5LBzooCMfIZgEaVAVqcygR17ytpDucw4
 rDcvu+/cuT94vVlRoDMNmdwu1AmPkXvbb/Fw9ssaVAExCIdlBM8Qfa3wAzFlP5eD0YVF
 qAiw==
X-Gm-Message-State: AOJu0YyuSSSegySRFvWWiK17BVnBRsrrPucsf/zDhu+kek3nG6Ig6cN3
 /s1kNcgSLsSNyjY2ujADkECkpvz5QwAPn4kWbNPMJXboz6TOnTLonnbz44DrHeWfFk+jHEbol1c
 ujc5A2IPVTUmDlJ4beDOFYJslaLhgsHApBMaQ
X-Received: by 2002:a05:600c:138d:b0:40d:5aaa:a2d5 with SMTP id
 u13-20020a05600c138d00b0040d5aaaa2d5mr1256141wmf.201.1704788094054; 
 Tue, 09 Jan 2024 00:14:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM/zyCyvEk68nBtBHpa8i1HjkLCmgaZkHeoZuSH4LDKPVKXrc1TZ23aOpoe2Y4Ruh2MVABOg==
X-Received: by 2002:a05:600c:138d:b0:40d:5aaa:a2d5 with SMTP id
 u13-20020a05600c138d00b0040d5aaaa2d5mr1256135wmf.201.1704788093729; 
 Tue, 09 Jan 2024 00:14:53 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i5-20020a5d55c5000000b00336e15fbc85sm1696619wrw.82.2024.01.09.00.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:14:53 -0800 (PST)
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
Subject: Re: [PATCH RFC v2 01/11] dt-bindings: gpu: Rename img, powervr to
 img, powervr-rogue
In-Reply-To: <20240108183302.255055-2-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-2-afd@ti.com>
Date: Tue, 09 Jan 2024 09:14:52 +0100
Message-ID: <87zfxerkhv.fsf@minerva.mail-host-address-is-not-set>
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

Hello Andrew,

> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

I think this deserves a commit message with the rationale for the rename.

Because kept an eye to the previous version, I know the reason and agree
with the change. Also, if remember correctly this was suggested by Maxime?

After a adding a commit message and Suggested-by tag:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

