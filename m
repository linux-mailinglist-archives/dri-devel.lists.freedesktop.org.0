Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D349828053
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FF410E37F;
	Tue,  9 Jan 2024 08:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B118A10E37F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704788285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P/n6bIUbxiGj6HkflcqkLH0/hS7ErA/FC9bHCDvM3UU=;
 b=OZSwc2F//Fmm+vQyfQoXU6bWnFdHg+r6L4cCO/YnwoUx4fXpuP9FHt9dyAwdt3TxpnFJIi
 HpyXQlPSrBJT53DvAJ2Fh1YXqBfRIl0J48QofNWMf6wizK7AxldPOqxTdqXcQYEpthxf2n
 eYkEMdYUULTZR4d1BWw6umjbgVghG1o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-z-6DftADP3WsV1N4Vn7qPg-1; Tue, 09 Jan 2024 03:18:01 -0500
X-MC-Unique: z-6DftADP3WsV1N4Vn7qPg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3369724e899so1546056f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 00:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704788280; x=1705393080;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P/n6bIUbxiGj6HkflcqkLH0/hS7ErA/FC9bHCDvM3UU=;
 b=OTv+LETnoPeg5iP7F56eJ3R4I3lmremOnjHVVVzvLJm2MALuAeqFt+DAoItejzG4/e
 GRWchRYuMDuKzngxa3IaJuDKAy7rropZR5BKFozw6m+WmVEhglJTuhTmMHQyaMKK4tsi
 8GiIp12x47sGFaDfS22JiuehIH3U+NLGgwylxTdC65IRrk/p32oi2CR3sDK6JjlyZ/ll
 cAHgqkuB1oweKLBgvQOjb2EIat+tn75SS97158kmcrOsJXpxU2sgLHqESTxt/oDL+Jgx
 eGe/eojRLxzPwBgkyDdJQjtxX6pqsGyyCn4Fl9bUE58rp/SrXAk2m8KO4s4C4LuD5LNF
 0tnw==
X-Gm-Message-State: AOJu0YxOtJPK83cckCwz4oYXmVdA7ZoKcNygqk3O1d+4Al1hnFVyH9Wf
 vHpSj4Eey7Dc8BbTp3Q+VTQXPUJlGO1JZA+DpibvQ/VBLpDgkEjt8Ttb0i8s6izo13NDum0YbPu
 hRNjMyxqA9DWdHRDNHEtXEH+wGx6N2MGlHI8U
X-Received: by 2002:a05:600c:3b8d:b0:40e:5136:9c1b with SMTP id
 n13-20020a05600c3b8d00b0040e51369c1bmr141945wms.171.1704788280593; 
 Tue, 09 Jan 2024 00:18:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC/CVCQxxwutC14ngh1OLfN28XsPAOZa3F7Km+RhSKTaEmlH4ND2gHIL5o1B6PeT/ovdJFSg==
X-Received: by 2002:a05:600c:3b8d:b0:40e:5136:9c1b with SMTP id
 n13-20020a05600c3b8d00b0040e51369c1bmr141937wms.171.1704788280323; 
 Tue, 09 Jan 2024 00:18:00 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c444a00b0040e486bc0dfsm5117272wmn.27.2024.01.09.00.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:18:00 -0800 (PST)
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
Subject: Re: [PATCH RFC v2 06/11] ARM: dts: AM33xx: Add device tree entry
 for SGX GPU
In-Reply-To: <20240108183302.255055-7-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-7-afd@ti.com>
Date: Tue, 09 Jan 2024 09:17:59 +0100
Message-ID: <87le8yrkco.fsf@minerva.mail-host-address-is-not-set>
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

> Add SGX GPU device entry to base AM33xx dtsi file.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

