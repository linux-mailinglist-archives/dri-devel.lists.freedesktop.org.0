Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5099EB03C80
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7D410E45C;
	Mon, 14 Jul 2025 10:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KZdRXfGb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4227B10E45C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752490318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S0FqwW/V0t1PIB0be3QVSXkCzzn3WFingY02zmyj4Qk=;
 b=KZdRXfGbZCGXrO4Qu7netANATZsMwxP7xWgN/sbD/jeWBYKml4EJ+efjB+3xNsi+WPLmrf
 3aEFqXAIas/lGF+kUj9sIy0N+mOXOya4yJMvNIuBJm89049zGwkvjKY+RaFyfDbaQslTK7
 0TJHQ7GTl6ZKq2wnnzVsGs0Vv4MVAXk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-dwAp-dyqO5Sl_khF3Pj99g-1; Mon, 14 Jul 2025 06:51:57 -0400
X-MC-Unique: dwAp-dyqO5Sl_khF3Pj99g-1
X-Mimecast-MFC-AGG-ID: dwAp-dyqO5Sl_khF3Pj99g_1752490316
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a503f28b09so2693877f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752490316; x=1753095116;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S0FqwW/V0t1PIB0be3QVSXkCzzn3WFingY02zmyj4Qk=;
 b=SuIjKRx+jx0DlW+48fbfJ6PHv46mVOHdrNvIbTVvVqZE7AupSjolTUl1cAwl11RvBF
 GSZVN4pvnNVptnaHnlRQKfgqQ1B+mn7YwkNzML3FFxKDHp65p2wrWsXO1oEXPzjjnmn3
 3BtTiELIQBMnxnWYXFEYJvzPmFuBHrPAmM0XHuGmTvR3QicNnMAUwI8Foy/18WxXyq0L
 Rmml5h8M47ujoZfi4oQa7tuvFTP6aSCyYPCHWhM3bsNAkFHa+BUmRKqdWG++kpYKGFJj
 W1T4e4bMd0KY61l26SDdHYksHNuVOGPsMvnyqwHoR/NLti+q31YMNO8aQSgl7y69sbCA
 mc7Q==
X-Gm-Message-State: AOJu0YwNE9yHWdr/qDaNJ92VzbWzh41NkaRXGwmKiE8GjcCPbRps09bF
 6GQzj1cRiNK7JUhqmO1YYkg9aWOIQY3h4nMtbHkURyZ5hYLGgJiSA+GxW4rDa9giFUfKwqZy1ZV
 Buyd3jkIQoY6qqMda/FS8ASvN5w3Fco2tKPD0FmVsZleJ76c2LNfKgRkeugaw+0KNre82Iw==
X-Gm-Gg: ASbGnctpFeI/ReW0Y0+QQz4WJAhF8yY1PoK3hV1AOciLBZ8wHn7yNNv+FqsEcoPrhLT
 1ndK/BYD4K8bwBHDWxYBwJRSW+CUwgwSqjpdHAZWvEkd0yiRhqgewRe1eRhwln+usqPaK10AxKg
 505rm7QAnqUjyhu0wk+eG0kwm5p+wtqcrApuyxa1xG89U9rMMwl704zQjvPC3gxpRUnPHQqJO9i
 wasur0uFv61TpaZCZt1jQQRfAKtohpvOsuwr6MSBgaWglj1EOYbWYxHsD0o6sJztmvzIfeUxJj+
 xCRwQIl77vmSK3AwCkKkwd/WbLE0H9YUk+68tgQEQuzJAPKgH5w5Zja5/539fan0BA==
X-Received: by 2002:a5d:5c12:0:b0:3a3:7117:1bba with SMTP id
 ffacd0b85a97d-3b5f1e9384bmr10844646f8f.24.1752490315710; 
 Mon, 14 Jul 2025 03:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/u7/5Utoz6pumORdMpPlrDsf0nGvHyJlvTOvktdoCGdjx8k8xCix9akpVNBj3dStS5miLIg==
X-Received: by 2002:a5d:5c12:0:b0:3a3:7117:1bba with SMTP id
 ffacd0b85a97d-3b5f1e9384bmr10844621f8f.24.1752490315317; 
 Mon, 14 Jul 2025 03:51:55 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1932sm12300479f8f.17.2025.07.14.03.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 03:51:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH 3/5] drm/st7571-i2c: add support inverted pixel format
In-Reply-To: <20250714-st7571-format-v1-3-a27e5112baff@gmail.com>
References: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
 <20250714-st7571-format-v1-3-a27e5112baff@gmail.com>
Date: Mon, 14 Jul 2025 12:51:53 +0200
Message-ID: <87ldorkpti.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NEowNyUW50NoyWQ0kLQ_YE7jT03aJ22xTbcQ3doIo58_1752490316
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

> Depending on which display that is connected to the controller, an
> "1" means either a black or a white pixel.
>
> The supported formats (R1/R2/XRGB8888) expects the pixels
> to map against (4bit):
>     00 => Black
>     01 => Dark Gray
>     10 => Light Gray
>     11 => White
>
> If this is not what the display map against, make it possible to invert
> the pixels.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

