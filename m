Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7904AF6D01
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 10:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEDD10E174;
	Thu,  3 Jul 2025 08:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ATKq6Vsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A3510E174
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751531670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=221h2gTHX6oXGMnPCILS/QRTKOojZm+JGCoLjP5IEkI=;
 b=ATKq6Vsx3amO8nHNCqiwbzlURrO/TUE54fxLhZRohusPCAiJQr5m2vnFGdf1wf1CCgDqKF
 rif7iOtYYYkPFWAwZoGXX6VHlTa+AIAGFI5rJPNhEvU6i3XllpUYtdV/JHPABhrRCDnv1w
 MCiTHUPKveRk8gHNGgmtw2u+cdt0qUc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-VLKUGWpfOPujFVtmoXJIWQ-1; Thu, 03 Jul 2025 04:34:29 -0400
X-MC-Unique: VLKUGWpfOPujFVtmoXJIWQ-1
X-Mimecast-MFC-AGG-ID: VLKUGWpfOPujFVtmoXJIWQ_1751531667
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ae0dffaa8aeso81696566b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 01:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751531667; x=1752136467;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=221h2gTHX6oXGMnPCILS/QRTKOojZm+JGCoLjP5IEkI=;
 b=hNjfm8UMSuBvfjEMa8/xHIq0y1BPVp1M3KerCJ/l7Ahka28iQZRY5/1RbDyL0JB6jO
 GH9inCBamJbrtbzHQDIsu3W5FFqnJw/Kt5MFasbQv8s3RhzsC5ZhT/KOVgaP4IBAwVYZ
 F0QXXWPYlgjvTmQ8wiUjPq9qb7k2olDi3GxynzPp7XOKMNvDjH7ap+h31S0HqsLLsOcW
 T0Aqmb6WpubKTZeqhoQGeLeYA3zamOgUVo43i5UX2gdlENHzkvukP/qRf02wanISlh7S
 XDpvgIfB2Qwkn0nBfcsrz/tpDWVigkYPXOE7eZtFWzadZcSSwlPnFQ9wB1SHUHaUWDXt
 BxUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgkd4eu67vKYpBDgzGftqSefll384A3LSoN601y6rkjtW3C8eCjo7ubs/8UWkptVl/ogFyRkAsBU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqDE5t0d9k6gi2qcr1fIEkpVkyXZPGT3r35SAsgTKweysAduX9
 wBBM5x/jkH4I1rKa2O/Ow8Hqgvw8AFsmdeTRDxJwCUXHqrhpUFx7yyJ3a0yW66cyqyLOmjCRQNu
 qq1kTMAgbrB13Skj8O3Qp/cxC4JALszQTH8m30HDeOZQaxZdz4EYqf0Jqwy16urqCUDnwwA==
X-Gm-Gg: ASbGncsOwegK9eDqprVlSS/5djSkqWq3J1JVGBelKdGt9LnO12SDJjlWryBb3tbOJn7
 SQSk/2MzQ/HVB/FtGXLY3bliWEDv84AZmmv7IDMsJLSFNEGaWv0lvXUGGui0l5XxLKxch1B3R+2
 n2h644VphApRs9E8gLHarUONBHrq16ubjY+QTRwd5rlBUtsKcEDj40yKkNtv/FyLwcjK5ok30tP
 3oKYl5KznavB+03+shAOLqIkm6ySgCER+akQ2uJlwy86IJdZo7GUhOqO3vwGRBGnJjB+0V9U/KW
 2x4dvYkkSnqKraFeBHxELtBzKxYR1IXE7VtaIaWYAA2lvVbcwyfANFIIPBURnz6nDtv3yuJMZu4
 jzfH4xHTiXqGx+Vb/pfKYSNr0Sh3izhOK4TI1nRj/ucS2z0UgroM9o+QyGcqGQr3K+exGAt/y
X-Received: by 2002:a17:907:3d8d:b0:ae0:a465:1c20 with SMTP id
 a640c23a62f3a-ae3dcc33e3dmr202633366b.14.1751531667452; 
 Thu, 03 Jul 2025 01:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0jetECjsFXFGgQLjZYc5QGYfQzjQBHnfhAK7F+xPPGCcJzJbtB9How+LBWAWH7EYvtz0QzQ==
X-Received: by 2002:a17:907:3d8d:b0:ae0:a465:1c20 with SMTP id
 a640c23a62f3a-ae3dcc33e3dmr202620766b.14.1751531665205; 
 Thu, 03 Jul 2025 01:34:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353ca2ab0sm1202272966b.164.2025.07.03.01.34.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 01:34:24 -0700 (PDT)
Message-ID: <f5fe3fe1-903a-48ca-9249-b77bc07dbc77@redhat.com>
Date: Thu, 3 Jul 2025 10:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
 <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
 <8a3ad930-bfb1-4531-9d34-fdf7d437f352@redhat.com>
 <85521ded-734d-48e8-8f76-c57739102ded@kernel.org>
 <e534d496-6ce0-46c8-835d-94b3346446a7@redhat.com>
 <6e4253dd-cd73-4302-b9df-44c8c311eb22@kernel.org>
 <e2159868-f31d-4d35-b6b1-2cbd1a9d249b@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e2159868-f31d-4d35-b6b1-2cbd1a9d249b@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aH-sIc9iZwGzz-GDd8u40YC-vaD7HP6oMLm4cCl48d8_1751531667
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Thomas,

On 3-Jul-25 8:47 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.07.25 um 22:43 schrieb Krzysztof Kozlowski:
>> On 30/06/2025 10:40, Hans de Goede wrote:
>>>> No one asks to drop them from the driver. I only want specific front
>>>> compatible which will list and constrain the properties. It is not
>>>> contradictory to your statements, U-boot support, driver support. I
>>>> really do not see ANY argument why this cannot follow standard DT rules.
>>> So what you are saying is that you want something like:
>>>
>>> framebuffer0: framebuffer@1d385000 {
>>>     compatible = "qcom.simple-framebuffer-sm8650-mdss", "simple-framebuffer";
>>> }
>>>
>>> and that the binding for qcom.simple-framebuffer-sm8650-mdss
>>> can then list interconnects ?
>> IMO yes (after adjusting above to coding style), but as mentioned in
>> other response you can just get an ack or opinion from Rob or Conor.
> 
> But does that work with *any* device that requires interconnects? The next such simple-framebuffer device should work out of the box *without* the kernel knowing anything about it. That's one of the key features of the simple-framebuffer.  If we have to maintainer per-device feature sets, it breaks that assumption.

The driver code for this can still be generic and since the driver
will bind to the fallback plain "simple-framebuffer" compatible
this should also work for new platforms.

The e.g. "qcom.simple-framebuffer-sm8650-mdss" compatible would
purely be something in the dt-bindings to document which simplefb
implementations will have interconnects and which ones will not.

The driver does not necessarily need to check these more
precise compatibles, it can still just check for the generic
presence of interconnects.

Regards,

Hans

