Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43154CB8BC7
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 12:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E35C10E741;
	Fri, 12 Dec 2025 11:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FIcQcxsS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FB810E738
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 11:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765539844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rfwc03+ZoB3vuEuTCr1WM80W16BN6EcHvL1Gro5GaN8=;
 b=FIcQcxsSuzWFuGtIuT8XVvt8spDoZrJ+W0vhcrLGky07a4/LAxD3e0xlTk+kEnnIGvpd+e
 ScVz+2smiC8wwSIzxsbmyHR6iPItpVvZYH2Nc3h6TnbRJvkrME11g0dD8qzDbjVUiGvzIy
 3ND7Cqn9c5/PdzmBqQXlfJEyTrSJpKk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-9fTYP4ANMBWxEAS1-SdSbg-1; Fri, 12 Dec 2025 06:44:00 -0500
X-MC-Unique: 9fTYP4ANMBWxEAS1-SdSbg-1
X-Mimecast-MFC-AGG-ID: 9fTYP4ANMBWxEAS1-SdSbg_1765539840
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42b3b5ed793so768370f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 03:44:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765539839; x=1766144639;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rfwc03+ZoB3vuEuTCr1WM80W16BN6EcHvL1Gro5GaN8=;
 b=pbzE3l0owyMMXr1Vk34/gCQCh87M2J6dVPyEUouViAT03/UqypZLP/3PdSdKujB0es
 0yqUmFDoIvwwV4BQQYVeuBf+7kym1CoTrHHlOhiX/ALNGR5TaojkA+K0d9XPy9n7hkFk
 +rq8QjNiXrfz1/hPe1sZTaaaFutF5VSL1zG+lzCqg1H8Zj/WB7erUl+Us678eAvlxbWZ
 91p1Hx/OxNVF1aMgqPmdlzARRK1wEFJ7fKU1Xb1wJExj1C7xY+CRtECEmOzCVm9rXvy3
 tDTiJGuzdGO/Fsc52il3WgQsqklM0JAZR72dzbPu4o1IvL7DVhnP6TWHRrhLg5J+8zpk
 OHxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZlJKDw7q6AxuWCklndEeg+URRDcryKjWnwXA0iNTIQtPwQqgJlFzKr9nue5x1qFiybM4b2KODyGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTcXinGdMw3r3FKtpWI1hanMUgQ0NLMDOFdeUP+f/SBFiKlJnt
 mtdHojZBf12rLY5pbSdZAgfHMrIIcFyiI4wLptMDz0jsBOiOuI9ZGV/+vU/LUzUAxZE8utN9Qc+
 fy24Jc+IRWHZuVkTQS4plHpmoWuQ5MK5MH/acaRRAbWALPgtfhVJVs6MPhp3j07jIyRCLoA==
X-Gm-Gg: AY/fxX6AZWJ2sImeHaEInpP8Zl6qljdV2t/AY8asm2YgRcPImCAmJ1L0sfg0WHhVMWS
 sc7sgvyC+T8Fpepqvku4/ccvQANDBkiUpb1at4+CH3WFt+1slvFkXmJc9URYBt8wGIGN1BDKQWR
 9G+yiG2aEtOFJZCdmLspsaBsBMsdqygWS7g+VCNDhRlykaIwRUgI3ZdifGribMnAJ5eFPv24AUL
 2RMDWaKYTVUebnASy390OvWB1LCPmMbrey5IUd4xBZvcA2jPWWs9ehuX4+fxZ4kXUbqwvsgIQtW
 HBBQYl4VP78EyMfSdcGPkmdhNau06yq+cQIuRaLA4N7B5QZ9bX8lfepEmGi96Y920ejiGsmJJhf
 cq0++114TtKP3l7mAfdBug54fucIT0mB737byNQTW4Di8kSVofFKWLIV0TNwLFrd82anxQZiL2u
 VAJPw=
X-Received: by 2002:a05:6000:2005:b0:42f:9ed4:7d39 with SMTP id
 ffacd0b85a97d-42fb491fe6amr2200259f8f.54.1765539839569; 
 Fri, 12 Dec 2025 03:43:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKpNZLEb5bHsTbeS496UoWt5zk2kAlf+6OGULEJP91P1P7zD2+xjYIIQNz8F3koY06QZc6Pw==
X-Received: by 2002:a05:6000:2005:b0:42f:9ed4:7d39 with SMTP id
 ffacd0b85a97d-42fb491fe6amr2200227f8f.54.1765539839186; 
 Fri, 12 Dec 2025 03:43:59 -0800 (PST)
Received: from localhost (red-hat-inc.vlan560.asr1.mad1.gblx.net.
 [159.63.51.90]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b8a9efsm12297076f8f.33.2025.12.12.03.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 03:43:58 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Iker
 Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/3] drm: Add driver for Sitronix ST7920 LCD displays
In-Reply-To: <20251212-st7920-v6-2-4d3067528072@gmail.com>
References: <20251212-st7920-v6-0-4d3067528072@gmail.com>
 <20251212-st7920-v6-2-4d3067528072@gmail.com>
Date: Fri, 12 Dec 2025 12:43:57 +0100
Message-ID: <875xacdiwy.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2IKVS5TK26_4KZVE3rESfGz_m5UhugD1r0g8cmJvONk_1765539840
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

> Add a new DRM/KMS driver for displays using the Sitronix ST7920
> controller connected via the SPI bus. This provides a standard
> framebuffer interface for these common monochrome LCDs.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---

Thomas mentioned that you could add his Reviewed-by when addressing his
latest comments. But it is OK, I can add it when applying your patches.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

