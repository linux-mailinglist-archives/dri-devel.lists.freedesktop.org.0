Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD11ACBF491
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 18:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED79A10E4AF;
	Mon, 15 Dec 2025 17:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="czBTz41o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2208410E49D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 17:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765820784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=idV1mcFSyY3XCyx5/b2AaaGCQivlpjoPBwGibjW8i6U=;
 b=czBTz41oOLRmoug0kZ0OCu35EgTnllyemTcg4Nsg5x1/b2zogL9pyA5v8G4+/aT2iKYAuq
 T6VySQWUm+aJNzHD0e1bboioUmj59RRnho4Q1s5TskzShh9IttWjNkqMQrNxrbui2xKTp4
 xlrEiOe4KJmihLFOojhjqJ3+7hZs4VQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-5w2lGUyGP8qC9klSx3qBcw-1; Mon, 15 Dec 2025 12:46:22 -0500
X-MC-Unique: 5w2lGUyGP8qC9klSx3qBcw-1
X-Mimecast-MFC-AGG-ID: 5w2lGUyGP8qC9klSx3qBcw_1765820781
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4775d110fabso26877365e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765820777; x=1766425577;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=idV1mcFSyY3XCyx5/b2AaaGCQivlpjoPBwGibjW8i6U=;
 b=MWDy5mDmROUFMeovSj7a47Detq/XwZXnDfK1R/o+KNs8+Wj8V7mIirNMLtZI+4Gs+/
 o079AbxRAOIQz5brYWdL+B5TCcGe9DSZsG3TAAT5xu/VwNLV7cdAqw7oAK4RnClLk/h7
 dzs9sdwZlqiUXkTnyBeBc7wTRueC0J4npUsx9THc59WDGREPA2XJ4zzyjQZRFH5QzP71
 wzyKanefOOU6mOn0e6eEHUxllC3QsG4XZUjutHMN+gUVsgW34GTXdYgQBeBXsrixmfKL
 ohrhUQyQ+EkdenWu2VhiA4r9IsH6XorJfphijl0YKszwDhvht813AxgWnFrKU7EBo9CO
 aRFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPON5HhKdys0wU864IJ8nS9jqnLiMUCOdGSOlqfGXT5ibYMaGxn/sdXj0ugcxj+Xt4fTj4LJgohV4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySrWTilNDQBTMvmM9jdJ6dwb7PbKFCfw6/8kZA+1Ot9F5axHQc
 gS2XzNoo6jdCVI0kRLa/MtFdzBEs+vO7r5f1z8Qo8hDKCxhQHfVN+xC6WhiA47PhMzMvZRpm2No
 EbxNS2NOt4kp9qDddY6aB6x2hU0O4UfkZlwI6OyCYP8bgcZ3LMWhlb05rgfS+WLT3U9i6lw==
X-Gm-Gg: AY/fxX61dAp7BG06LIUV0qwq9x8FTP1rzatv+OBPmdNAJpZurHh7pIDhHPdT2fdJzM+
 GmVILvikAOm7F4y8OJDmstCkNIU5+Cm5Qxe3r3HqsujLWOgbaWgEmeVqRvQu2tudQ4deB+B1EuB
 GG2pr44JrUISJoOfymzo7AKIUFmedE7DtlPP0rceRxr8K0c9wCrVpm/xxfzWhWNJONOcpAJm02L
 bgeXDJXbSJ0G+BUTjkwF2/cbOaWVabZcSf5P5cizqXFOrP+UyKA9o0WLaXuFX/9yX5jQSrmF9wI
 M7KvHpV3Ah8s+BJTbvT0DFYUGdhIx2U3AGNt6F9UXSPuTLW+4Scd91UAW1jFvUF4Hzc3OK8TX2m
 Z67pL5HHHxWR/qETfwzNallCxA4P6sRXRMJ5wifUT3Leh9KlLIM7oth7gk3DmiSOly/Tm
X-Received: by 2002:a05:600c:1992:b0:47a:80f8:82ab with SMTP id
 5b1f17b1804b1-47a8f90378fmr119261585e9.24.1765820777365; 
 Mon, 15 Dec 2025 09:46:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2njgFBUHhMBmSPir0G+w8tCNHmxppOaBNofod7i5y0pxEm4TSTTSCNM3TAeNSNk6YHZrFeg==
X-Received: by 2002:a05:600c:1992:b0:47a:80f8:82ab with SMTP id
 5b1f17b1804b1-47a8f90378fmr119261425e9.24.1765820776951; 
 Mon, 15 Dec 2025 09:46:16 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f280cf05sm16248644f8f.7.2025.12.15.09.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 09:46:16 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Iker
 Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 0/3] drm/sitronix/st7920: Add support for the ST7920
 controller
In-Reply-To: <20251215-st7920-v7-0-36771009ec01@gmail.com>
References: <20251215-st7920-v7-0-36771009ec01@gmail.com>
Date: Mon, 15 Dec 2025 18:46:14 +0100
Message-ID: <87ike7ljtl.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tmwiFrHLTbQURLiSXD4uP33tvEVZmoUVAYdGe7JLKQE_1765820781
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

Iker Pedrosa <ikerpedrosam@gmail.com> writes:

Hello Iker,

> This patch-series adds support for the Sitronix ST7920 controller, which
> is a monochrome dot-matrix graphical LCD controller that has SPI and
> parallel interfaces.
>
> The st7920 driver only has support for SPI so displays using other
> transport protocols are currently not supported.
>
> * Patch #1 adds the driver.
> * Patch #2 adds the DT binding schema.
> * Patch #3 adds the MAINTAINERS information.
>
> ---
> Changes in v7:
> - Fix Makefile typo and checkpatch --strict warnings.
> - Update header paths and add missing includes.
> - Remove unused DRIVER_DATE.
> - Link to v6: https://lore.kernel.org/r/20251212-st7920-v6-0-4d3067528072@gmail.com
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

