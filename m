Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B88A97A6A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 00:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B80E10E63E;
	Tue, 22 Apr 2025 22:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OYAMW18Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525EC10E63E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 22:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745360635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tvsjP0TDhe7vvPFthlsElokr0igrf5zhdC2C47ukJlM=;
 b=OYAMW18ZaJn3ZTfboz4erFqlLiOZBuv7ZqljO6b6izL7zEk4agnObnJ/JPPN8/OdUxweZi
 X4pn/tOYsX7s5dtJdfeBTNwNVdbcE2X1u5sG46tQy/xxP43Y0kzfaFR3M+jMntTOP+QiZe
 1I38TOLZH6AZBpCRhHvoK1IcCClSeXw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-AQS_ZxB8Pj-M1e79PCqUXg-1; Tue, 22 Apr 2025 18:23:54 -0400
X-MC-Unique: AQS_ZxB8Pj-M1e79PCqUXg-1
X-Mimecast-MFC-AGG-ID: AQS_ZxB8Pj-M1e79PCqUXg_1745360633
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43efa869b0aso36372745e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 15:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745360633; x=1745965433;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tvsjP0TDhe7vvPFthlsElokr0igrf5zhdC2C47ukJlM=;
 b=ZorxiIY5uX3wcf0X0v4VtcFusBwn6EwQP+YiCITmx0Mo6WR70iXzpgiicO1cwm2ovQ
 LZGQDDqJhGMwdI6awTSoi4IfSY/QYLseTcxGa3YYwj9Y/chgleniYliEI91SXXFLRucU
 9+2D7Hf3mmzUI4TcRbe4iAJoSsqmaCHGIkOz6GHRcOQCHnCX3k/hnUkFOggrcHmfz0Xa
 TAxPZLbab/nKhanVp7CcuJm4BTWj+p6eeymhkS5BMYa8X9198oSN6VxH7IGmGllyuPFA
 BS5ylih+yeetun45KArrOuVM/tJz1S0e1fdsNi2hdewfnHGCNZP+eUcm95BQYfOD+K7S
 NjmQ==
X-Gm-Message-State: AOJu0Yy+i5jHzPuuLTyqDUyH8yFuNidkYG9qvk1yq38b31ickeA51lAd
 UX+YzVBpHpT/mjJm2PK8L62mKYNj8UcgCTVeP8zaQ05+qLH1m+LL7qjKH3I2T/ISHjLssbQ4nB3
 WXAcbpf6BkfTEz26bqqoB+y0sXqf5qoxlcumcHlBz7ncf3KjFMYx2r2qur2FOsTvcbA==
X-Gm-Gg: ASbGncu3Kjm7aXvkjeD68Eftkp5D6XXEem7oXiIZdDXBaYIoBeb55Syod2hDb4Ulg+u
 fkVrD0wVGX92tZ4vD8WovM7WG8DioL0HrNXJ0swty5ibPG80mqk39xe2ewrswmoOKW98DEni7OS
 KYoqYsfiFo9W35uKc9xh9VTsZqCk0pqtJxzU0Lej8pZ62Va0UiO+cY7qzeF3Xj3rCJPZa4nYI61
 hkL6no5gwS24ziJz7vA8J16H46Y5aLsH/UIoBMV5eE/JQGO6VtNDDdWxhxmhqQNl6oM6jn1PCed
 nKlpqRJF62XMslMM+CepZ1ari/xH3w4nJCRFZ1BhxKxx8tdUEB0GWYIn0VUAJvLc0FY3fg==
X-Received: by 2002:a05:600c:a143:b0:43d:878c:7c40 with SMTP id
 5b1f17b1804b1-44076c9c6fbmr105894355e9.10.1745360633014; 
 Tue, 22 Apr 2025 15:23:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZJAKqGmWcajS9TRVEoMGa1jAq7LeEdmZMU4PLf92uZSOCG1OGXX/B3J1SM4bQv8Xmuf3afQ==
X-Received: by 2002:a05:600c:a143:b0:43d:878c:7c40 with SMTP id
 5b1f17b1804b1-44076c9c6fbmr105894215e9.10.1745360632629; 
 Tue, 22 Apr 2025 15:23:52 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d179ebsm3558725e9.2.2025.04.22.15.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 15:23:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH v4 3/3] MAINTAINERS: add entry for Sitronix ST7571 LCD
 Controller
In-Reply-To: <20250415-st7571-v4-3-8b5c9be8bae7@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
 <20250415-st7571-v4-3-8b5c9be8bae7@gmail.com>
Date: Wed, 23 Apr 2025 00:23:48 +0200
Message-ID: <877c3bbzt7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2qAGU7i0u7E0xU89BXCCnmqYiDjib0av-72E0YvzQ2E_1745360633
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

Hello Marcus,

> Add MAINTAINERS entry for the Sitronix ST7571 dot matrix LCD
> controller.
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 889bd4a59551c9bc125f94944a6e1c7e3ef2de83..eeae24fda846b9f63400ebb08c3fa7f02f3f4b19 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7572,6 +7572,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
>  F:	drivers/gpu/drm/tiny/st7586.c
>  
> +DRM DRIVER FOR SITRONIX ST7571 PANELS
> +M:	Marcus Folkesson <marcus.folkesson@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
> +F:	drivers/gpu/drm/tiny/st7571-i2c.c
> +

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

