Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3359CB03CAA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B71310E45D;
	Mon, 14 Jul 2025 10:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fXHzv3po";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8BF10E205
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752490595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w93JWie8E8zd/q18qvrOAzbqexxKKPXgPTHOy7odRa8=;
 b=fXHzv3poVllcOikftf1vnzMrMAKFnhu3Xg/rpGJgSN+a+5aOMGo79qlWctmMn1vxzZucJH
 qV3dA02UtklyH55FJY8Mdd8tLlyIKgvpNfEbNY4gJvBx0/FFOAJjic62/kg+bNnzRYsEja
 0yrGbJn7OeXu+nWwWD9DSJMXIQR2ZtM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-dboPvvBTMDG3k9gmhRj6PQ-1; Mon, 14 Jul 2025 06:56:34 -0400
X-MC-Unique: dboPvvBTMDG3k9gmhRj6PQ-1
X-Mimecast-MFC-AGG-ID: dboPvvBTMDG3k9gmhRj6PQ_1752490593
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-454dee17a91so31451135e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752490593; x=1753095393;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w93JWie8E8zd/q18qvrOAzbqexxKKPXgPTHOy7odRa8=;
 b=Xjg4dssZYz0nEkL0sVOVhLVuck/DTorhS0Gk+EAmH57PN/MixLNwI2DRo1F2aKZS9J
 HZlbew9En7zr6pPIfh5SIHcN2f/vmdAizWOBKCuQg+K5gE0XNOTbTwTx/NjLpFVe+E+i
 KnL1bPmbMhzOQ+kGP7NaISUAM9JzQvHEor0FNUW9etvDBkRiXsmyVfb0O+t8nqOC9/Z1
 O80x3xXbjKguqEl4zx30+LN7lwm7zTByaCWjtRWq+me2ETdW2NbYrUpnhNdL2CUCVOo4
 NdMHkIon/ZVQMWzt0unUa7lUDiequmpl1wRFuxAhupLaclNlmxEL6ZasvugbPyG2YlCJ
 UptA==
X-Gm-Message-State: AOJu0YzNaY9gsKSSQTmct5gRl9IhJjQWcmFHkF1+jSGatpVFeYhfDKfY
 OBA1nf+C6OyaYhbOfC6bRRkYsobsvlPZFqjyi8klWTfZRPiBK79EJEYM+ZgzI1/TLNaEL9wrnte
 R3Y9p9nTuB9Bf7pB7syKLddjF7tRT+2UU7DGEAMEcjE3jIGsf2nTzuQ4AGNjF14/H/6XAnA==
X-Gm-Gg: ASbGncsbCQ3Nt2I14E6FW0G1Zw4rb6LCBZ74QsffEVV3Oi/tDNgLS1QjZW4T4TLznrX
 scFW+ruhOE2AKJn7AvXrKItw7rKh44qTe8lZ5CRKXriLT+ze+CQxACfHtcJ+ByEUGbOl5h47K70
 T5W/4jZZma9s6v2etZs/k4hqAI5shdS1nZ/2d8wcgGAtMtNcgfjUzQI0QlF4cninh2wsBcxKGok
 Bb19gypQ10+NzbfhbwjOYMKf2wiofDhLppZ+YjB0N2+GFAvVNlXnwLdmBx1rLFFJu+sLnT33+Io
 XDRSOTKturr40hgwEWc7gBRTMoYK4dmvRRSYafLuWNMEuoShXRkPC+mDLHldqHg9zw==
X-Received: by 2002:a05:600c:5304:b0:456:1bae:5478 with SMTP id
 5b1f17b1804b1-4561bae5841mr27165395e9.2.1752490593142; 
 Mon, 14 Jul 2025 03:56:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgLMus7ZlRljQsgOm8qpcp0STSbB4fi2uK0BYeNsg/g/S+kVymwynI6QO65qw6qJtfq5k01w==
X-Received: by 2002:a05:600c:5304:b0:456:1bae:5478 with SMTP id
 5b1f17b1804b1-4561bae5841mr27165155e9.2.1752490592705; 
 Mon, 14 Jul 2025 03:56:32 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45617dc1fccsm38119995e9.5.2025.07.14.03.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 03:56:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH 5/5] drm/st7571-i2c: add support for 2bit grayscale for
 XRGB8888
In-Reply-To: <20250714-st7571-format-v1-5-a27e5112baff@gmail.com>
References: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
 <20250714-st7571-format-v1-5-a27e5112baff@gmail.com>
Date: Mon, 14 Jul 2025 12:56:30 +0200
Message-ID: <87h5zfkplt.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nnPv0TtZsf8DH70Qm2ybAYL21QR_fwk7qK_bloIp8hs_1752490593
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> Add support for 2bit grayscale and use it for XRGB8888 when grayscale is
> supported.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

