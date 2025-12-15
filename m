Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED300CBD1A8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A3310E154;
	Mon, 15 Dec 2025 09:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="T29YDd1v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253A810E154
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765789915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v/7znRiRQKUpHNgkUgSE9cqfHQAsAHKZeX7554LAbmo=;
 b=T29YDd1v/Q1C7Kz7YWl0b+QK6UwdGofnAtEGfVrRsyb532zcywrkx9td00mFdDG5gYojD3
 9yyJllaHaESqkVgR6PVP5awiVrpjy0jG9nOA2ydstjTp9hwZzvqrewqoAl371AHuCF4Uuh
 ArV9QNiKPQcajo0H8paWz9t5gE/6vNs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-BztGK6AGMA--YmDAsCJsiA-1; Mon, 15 Dec 2025 04:11:54 -0500
X-MC-Unique: BztGK6AGMA--YmDAsCJsiA-1
X-Mimecast-MFC-AGG-ID: BztGK6AGMA--YmDAsCJsiA_1765789913
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34c704d5d15so2549837a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 01:11:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765789913; x=1766394713;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v/7znRiRQKUpHNgkUgSE9cqfHQAsAHKZeX7554LAbmo=;
 b=YZ8a9UAorQchvvvnld1kLtyS+WeQBPoncKLHXVoUtBhfHOmAO3v1ChKXGs17curfD3
 liFH4lfVEbvGtiazB9Q6yI3e0y7WwJ4zAZ3gkOkeOo1AAvRjuQ2ZOvIssWQRgq8SYDDw
 kp1K37awPRhU+pmId+nF2TCQ4vBpnXMRCeJaKpKl1hnosSOKtyG0+xuakXESKiyTloh0
 zs5+4PhApESq0PSQV9hVpIIrovqtE5ewkifNHI2XcUIDKXRYQ8sRLvDectNlPDnYx6zj
 axOA+7Y/G12gCWtYbqcZThnNAlZk5FRChRLh3DGfkVL9akgvxmHR8NDinlzzi82KKdy5
 aOkw==
X-Gm-Message-State: AOJu0Yx9Yjtttru79b2LSGMnRnJImbwKcZ+XLPXhJvlKQ1mNhS+wY05J
 KsyRkAI9O/eXNuO+vjvRhwWuFi48AKV8gVJVln1Oz32td/ASQ4YUztY6LB1xdb0151E+tEfnwGw
 hP4USquVLaAX95hXIOH+g/EPp42Dj73k17IijtyJKOYAouAlMGLSC4AuhsWyNfYbjiuc6k9Q/LS
 veqVnX
X-Gm-Gg: AY/fxX49CMpRVl2MY8PTyGV7ORzapkTi+Sy0tjIazw+wT51QZNSFz5k8v1bpIKm7FyX
 J79eXMfQa9kc0J2xMV56GWUPJZzydbJZ99HNOFhsz+e+D73hIe971sxhYwZmxYoIh49kW6YwZPa
 KNgrQWg5vj8iVFm0/PjLw2q4fbydELbUDiG6qmShkABfSK5vtw8zQAYt6MABwnXBeOGTSWbhwSn
 gwkIbcZ2ZxTsAEyCd6EdEDxy3l/99P+S72wWAxZlGsHXzgC5bj7eAMgQbR4TC7jr3+Ff/7AOu1O
 QBCgY9KULHPwLoWu/vEVmCGrwQXAZoiwWhYFo5EDL1jWy3e+sadD4tUae0VfWGYKwql0bp2g6BJ
 mlakuhByuo18gNZdIjW1HftMUT4qMwnh8XUxK7Zcu
X-Received: by 2002:a17:90b:1dc6:b0:32d:db5b:7636 with SMTP id
 98e67ed59e1d1-34abd7853bcmr9023045a91.27.1765789912732; 
 Mon, 15 Dec 2025 01:11:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTECPIXEJSfWfEWpun6/ZYANX1Y2IRo/oSMn2EZXan6O3C+WypQqhHZCXqJs4j1s+ZhDba4g==
X-Received: by 2002:a17:90b:1dc6:b0:32d:db5b:7636 with SMTP id
 98e67ed59e1d1-34abd7853bcmr9023027a91.27.1765789912362; 
 Mon, 15 Dec 2025 01:11:52 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34abe216c54sm8349068a91.7.2025.12.15.01.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 01:11:52 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Marcus
 Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH RESEND v2 5/6] drm/sitronix/st7571: split up the driver
 into a common and an i2c part
In-Reply-To: <20251202-st7571-split-v2-5-1e537a09e92f@gmail.com>
References: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
 <20251202-st7571-split-v2-5-1e537a09e92f@gmail.com>
Date: Mon, 15 Dec 2025 10:11:44 +0100
Message-ID: <87345ckt2n.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V9DA44rqZJbrmMqt-5n0jR6nVO61cILmLfL84LlYQAw_1765789913
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

> Split up the driver to make it possible to add support for hw interfaces
> other than I2C.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

[...]

> +config DRM_ST7571_I2C
> +	tristate "DRM support for Sitronix ST7567/ST7571 display panels (I2C)"
> +	depends on DRM_ST7571 && I2C
> +	select REGMAP_I2C

I think this should only be "select REGMAP", since you are not using the
REGMAP I2C support but instead have your own regmap write callback (due
the need to I2C_M_IGNORE_NAK).

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

