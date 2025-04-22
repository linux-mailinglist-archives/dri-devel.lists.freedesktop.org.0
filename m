Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07403A97A76
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 00:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE24A10E63F;
	Tue, 22 Apr 2025 22:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FEt4no6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E4A10E63F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 22:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745360743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4vRslFe4cN0lEvwN7grLmrzlhqlPU6F80LH1oewlaaw=;
 b=FEt4no6JUnZa6Fz1Alux0u3c9Dm6oQzwCVglUPDqDSIq0VSGUfuZ/OUfRBZStmF7DEi9j+
 uuHOMAeENVKi3p3dgCRGD1grpqdE2G+Kuvir/ENrDJ6+b0gxquAz+fKf7nsbqA9AZiexjl
 1OhxcPLzNvwaI2gOBoO5c1awi8L6tZo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-HAT5qNMyMlic1gVoCxgsiw-1; Tue, 22 Apr 2025 18:25:41 -0400
X-MC-Unique: HAT5qNMyMlic1gVoCxgsiw-1
X-Mimecast-MFC-AGG-ID: HAT5qNMyMlic1gVoCxgsiw_1745360741
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cec217977so29720505e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 15:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745360740; x=1745965540;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4vRslFe4cN0lEvwN7grLmrzlhqlPU6F80LH1oewlaaw=;
 b=K6WK3sKGHa62n23XGt7Y1QaUOJ1cvnX/niTr+AxWEdM7dNGLLxJ384vLH8XRiLv8Sq
 ywkfe+IpESaLehiTNRsJ/HXTYG/HRB2MTknNwgA2rvJCaJe6EjYfcBcHYLwv5clZqg2/
 OlHgRPRSJ4e794sIRw0hcIkUhHjvRMEcTgbdmIPLFzITwb4TqtIKBWx9dbVHGM6RfHRY
 neAlRBZHMCf0OZMj+GxPM0lq/hikL1/XWCfP5AAUr7+B9m5fLYuc38mhVv+OZsmlnfSD
 q1meXOYgV9TBNkZh6tc5gw3pGtggQWz2/k7wFi1jUTumkH0GTVLQt41Ac3rYIWgS942J
 QG7A==
X-Gm-Message-State: AOJu0YwSdR+RkMHepPmuBUC6M/a1oDaIWFCLucD3se5C+kBTraic/Cpl
 UfxhOHfdeGVATNgRhiM0ibaDIcfXpnb//+jU61NTbKEH21DdS+f1V1E84oFDnPCuIfizhFJz+yh
 54/PwLMCObWT8srTAu2DeZcBFibcu87VXlJtbKaGVNoahwAa+TqZ4MdzntwUlYZMX0g==
X-Gm-Gg: ASbGncsQjEDGHxIi2UMx7y0cmKa6MR9RyibLKIM/1ikycn0Eaq5M+c+OFHQRtUU0AEC
 K46NzZqd9OIn8NgCe6nbJTEkkUlSxAjMZFtTc6rj5TXc/y5IOXUY94fTjdmLTI4mxD0Bm1CHANx
 +DCVZaROnMS4JFsYF9DuIR7Cz73MWISzDAI3KTLpcAYPGxGfiGgyKFg4acY6elgv0soWGJ8ihoN
 7nq6JsypWaubw0KmiSDCdEV35kLp/fP/6mfYQDxR/e1ENo4norWS1qhfvF/B2k8s8Z+jAomqrvG
 I5RBuZRr0X19tQehZ2isSHZ/soawWVOUdkWjOqTZKX/srybecpVlZxHIuLT5NnQC+9fMZw==
X-Received: by 2002:a05:600c:a363:b0:43d:2230:303b with SMTP id
 5b1f17b1804b1-4406ac0a8b4mr138387115e9.20.1745360740675; 
 Tue, 22 Apr 2025 15:25:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOs7XI0oTVw+DKb/7MP/FHJt4LRqW8okLBk6z7fJGL0tMZ+Jiu0PXC4iek8XZZs+XJeZ3sSQ==
X-Received: by 2002:a05:600c:a363:b0:43d:2230:303b with SMTP id
 5b1f17b1804b1-4406ac0a8b4mr138386945e9.20.1745360740331; 
 Tue, 22 Apr 2025 15:25:40 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d17086sm3525365e9.4.2025.04.22.15.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 15:25:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
In-Reply-To: <20250415-st7571-v4-1-8b5c9be8bae7@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
 <20250415-st7571-v4-1-8b5c9be8bae7@gmail.com>
Date: Wed, 23 Apr 2025 00:25:38 +0200
Message-ID: <874iyfbzq5.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ixpHdRWi5gmiNOZHkhg5p6l9d4o_CquNVE7WVFESFQ0_1745360741
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

> Sitronix ST7571 is a dot matrix LCD controller supporting
> both 4bit grayscale and monochrome LCDs.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

