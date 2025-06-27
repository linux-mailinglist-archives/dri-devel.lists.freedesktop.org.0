Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75824AEB6BD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 13:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A8C10E9FB;
	Fri, 27 Jun 2025 11:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="K1e6F4Mc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE8610E9DD
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 11:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751024613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jUmKLkX17iXsI2jcTtKOQRw0H+vEuZMVGDpj7iIwmzA=;
 b=K1e6F4McSJ3QCQJkkZqsDByzJdFwefpEp1qoyVgvNCD8X9Qyv47RwGSrUceYrEdlgS23w8
 dhnDHwHcnmUAJ6MYuqEjSmDH1BFOd3yRUyTkMCm42n0p6QgQ5xFC49xI+JxgOhelXAwoOo
 aXCa5gtTDV4ztZaTVe9+NQpmlFZZ9cA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-U9lvvOH_OpqU4HLYrbmJjQ-1; Fri, 27 Jun 2025 07:43:32 -0400
X-MC-Unique: U9lvvOH_OpqU4HLYrbmJjQ-1
X-Mimecast-MFC-AGG-ID: U9lvvOH_OpqU4HLYrbmJjQ_1751024611
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a6df0c67a6so1323342f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 04:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751024611; x=1751629411;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jUmKLkX17iXsI2jcTtKOQRw0H+vEuZMVGDpj7iIwmzA=;
 b=Ld6RgS2Us4GfpBrLjU29ZpTr3JKwGg+9T0nFrmjEOgO+i08x/AtW1hw0BEZBVSEr5G
 gqOPhFrcWlZrcWGkWGu5nRq/dZZL2mGqShv8meNhputU3vNyF1NS/BIprOFaMzprvBz3
 pNE2HPFIHKwnpzgkEZ4rH3PdmXWZRqDSio3pY5vOe4x1SD8gjyCB4YLza9y61hcZ84Y4
 Vzf1ihgjVheaCdJiil2VyK0gGjKBvGpWquW09vW1CSTDqJXLPujGQKziDkg7N/hmaq6U
 PO/CGTezSSN2TQVnTH7QuvkNVUqbm5jcJymRhSGAT+DTkFPJ1qKNf+EkPcske/cbE4lJ
 Hm+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSYYnVgVgO5Z+25FDvAjLjKuUv0ZIVG/uW3Tqqe91TeIHkLJ1oT2pYutw7qi5ZZzyErl2GbNDeHP8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvzhUJqj5HIHlA9VANkVMT3nF/97mQslDR4JJ21Ij/aOm0uGgb
 h6XiRH6vHqKsbom0sRLrlq5DxGLJakkpNGTm4qkux8XNL2u76Rr4oJ+LymJIqiQF3X5pBvFeneX
 5bifOLZ0XyGtgXEDqBIvMUHbASBsqLUPN6iNqRFHSBsMj6fcPggGaOwzaHeeiKxrejMLv6Q==
X-Gm-Gg: ASbGnctzfZo3vr3g0emH67VYpX8goToxY6nLx9s4t3ykUVDP0/LP+d0FU3MfSj2ITuk
 WPgQ438lIxauCQWoPCxvhLLCnFZHa5V895XFvxKkKoZEgXHmaiPfWPJ53OQCfiPsbVbYxNCfWZa
 tdcEp0y67Ghkcga7xNxI4MHoYl/RLLTB4JDCT87deKK+V56yMsjNi1ViMqmmGrc/QAgR7Q7E6u8
 4V9LEox6D7sDAIy4BaA2kSp8IJqD+whQzUJIf2As6htmXfHPG4PaNFOBfUb6W1bLzzZ78Sq64RI
 4aiHlwvfF6KYs+BoCXsR7MfN2jRS2mM+Del+6kwEWUe/V4a2l818n4lMQUKy3Y/VCbBVOujERhJ
 clD0A
X-Received: by 2002:a05:6000:2082:b0:3a6:f2d7:e22b with SMTP id
 ffacd0b85a97d-3a8f482ce2dmr3118529f8f.18.1751024610712; 
 Fri, 27 Jun 2025 04:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqa9ksaS7DGTCCj2sUyTBC9ZYvO5eiqt8mHI65N4aQiSc8WyhN8W3ePYCE3h36zJaWTbQjjw==
X-Received: by 2002:a05:6000:2082:b0:3a6:f2d7:e22b with SMTP id
 ffacd0b85a97d-3a8f482ce2dmr3118496f8f.18.1751024610179; 
 Fri, 27 Jun 2025 04:43:30 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52ad2sm2454072f8f.48.2025.06.27.04.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 04:43:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Luca Weiss
 <luca.weiss@fairphone.com>, Hans de Goede <hdegoede@redhat.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller
 <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] fbdev/simplefb: Add support for interconnect paths
In-Reply-To: <f7c816a7-e93e-4146-80dc-8fec6113fcea@suse.de>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-5-f69b86cd3d7d@fairphone.com>
 <87ldpdd3dn.fsf@minerva.mail-host-address-is-not-set>
 <f7c816a7-e93e-4146-80dc-8fec6113fcea@suse.de>
Date: Fri, 27 Jun 2025 13:43:28 +0200
Message-ID: <87cyapbean.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gfM42yoDbk4iBntPU4Nyc6jKg096Z5feuSkBCr6pW2c_1751024611
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi

[...]

>> These two functions contain the same logic that you are using in the
>> simpledrm driver. I wonder if could be made helpers so that the code
>> isn't duplicated in both drivers.
>
> No please not!. Any work should rather be directed towards deleting 
> simplefb entirely.
>

That is a good point. You are correct that having some duplication to
make easier to get rid of the fbdev driver is a much better approach.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

