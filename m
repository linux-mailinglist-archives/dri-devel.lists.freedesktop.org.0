Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D45AB7E775
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C33B10E42F;
	Wed, 17 Sep 2025 08:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Yh3pmDzL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DC010E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 08:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758096009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dE20MOzAau1j//6u2cWZSoS4xe0cVhHDvdMywBaMF2E=;
 b=Yh3pmDzL64L4NUT5TB9L/Fqy2uGC6zlfqV9h9qCIT/K6v5S0D09dsHcjtJONOUBaHMN0qg
 LJ1zGO+G64uqLSMD2i3wmD5qVjZOPmV3AWeVJiAnVFIhxfGZvMAwEPB3UdpD7puuehLVdj
 0/YiTS9S+HyFwm5Zxn8wLifAHDHj85s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-8JN9eriAOTC-vfp1VRxRkA-1; Wed, 17 Sep 2025 04:00:08 -0400
X-MC-Unique: 8JN9eriAOTC-vfp1VRxRkA-1
X-Mimecast-MFC-AGG-ID: 8JN9eriAOTC-vfp1VRxRkA_1758096007
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45dd66e1971so52021365e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 01:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758096007; x=1758700807;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dE20MOzAau1j//6u2cWZSoS4xe0cVhHDvdMywBaMF2E=;
 b=EcsJqdqQyx11xSJ1PSLspd05cpqJ1o2W+3eSSq8Un0VvI2j1Of33U+XuSiXzjZU1Xw
 X3XCqCAEUaSRx7UYj4sgjKoDoScxMD9mM1EA4OO+hzRFCh+pjj0Il72H49/bOjBV1445
 TxoQ/OAXG+ev5KM9BLgxWu0JGAY1fekOE/RyHPBkVEqRNqJVomu+EOXa3FxRb7i8d1Ir
 V0pnb0yXGaQDYLNAM4WgyQYaRNC8Hoqy7vCuvKTaYUn5IZPOVvYfZFB/sKTPCwhhnBZJ
 GLllf9GjYXmQEeU6j6nS7Oc10qXUT/LSIYhHZrnqb+ftygnFm2IKboUxDdMpR4ZKvDxt
 1+yA==
X-Gm-Message-State: AOJu0YyuCB0ohIPNlLoz6vOKa859g89WhN8brMqpJkMBhvWYupkqDjdg
 bQG7Jyv2l10+Ns4xMON6Dosx5LzECQ6mVG8Mo8Wpj5r5zY7xSazcZ+fJukioOnjkaH5uXFShHXX
 oelAC+dQlI0dwdw7PdZ8pqgIUwA4qezEnfzC62oz42JeCf1pWvSScC/oI+tmRQ9MHEopaIU5nJU
 Eyyw==
X-Gm-Gg: ASbGncvMoXzDUhObAedmRa2ABRqQ06f3C0onnIJtF7TXZeiZiGs/BQvhMa0IEPhUw/9
 rO4XRwJZDq0CzWuwxe2iSHZ9nJ5As/6uOCg7XRJUWe8mLW0T9TQbAkpbms9SpVv0SzYzAUbd8uz
 e1zB4zO1jt8NKx7XKlkZFlpyiH7vKJQeq9+ETZKwdSVaunE7TEwFJPcMv0YaEtRrsbBtpb4Rvv2
 Y9msMpAXISmwqDCQSt1rkglnj6nlldnh2DW/RUwLPlWjkHEDvTYEP0IzjBWehXR1jPcVARVy0Tz
 gOVeI9SsOEvkXwfq2GloWKylzBhbqHrVB1D1L/lSmEVkR4q6LjSSKI0y5pSnCSFWB8G1aZ11GXT
 Cn1LOkfnE65G3cX2aIfOiwg==
X-Received: by 2002:a05:600c:154f:b0:45b:76c6:cfb8 with SMTP id
 5b1f17b1804b1-4620291a30dmr10362865e9.9.1758096006717; 
 Wed, 17 Sep 2025 01:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3Eols0vWPupzYnw1EsI6wA/ysP6/UNCP5H0eHeW3zPsMDYoT/ydwwrOf8OMOWEJZu/ZAikg==
X-Received: by 2002:a05:600c:154f:b0:45b:76c6:cfb8 with SMTP id
 5b1f17b1804b1-4620291a30dmr10362575e9.9.1758096006293; 
 Wed, 17 Sep 2025 01:00:06 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f321032a1sm37059695e9.2.2025.09.17.01.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 01:00:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/format-helper: Remove drm_fb_blit()
In-Reply-To: <20250908122240.740033-4-tzimmermann@suse.de>
References: <20250908122240.740033-1-tzimmermann@suse.de>
 <20250908122240.740033-4-tzimmermann@suse.de>
Date: Wed, 17 Sep 2025 10:00:04 +0200
Message-ID: <877bxxpkzf.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5KqWJbDr9yrNiDOr18lUBaDMMcXanf63EBuIgDg-7kk_1758096007
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

> The function is unused; remove it.
>
> Instead of relying on a general blit helper, drivers should pick a blit
> function by themselves from their list of supported color formats.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

