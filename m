Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125D7AEB045
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37A210E971;
	Fri, 27 Jun 2025 07:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z1D2b5jX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4876510E971
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 07:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751010043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rBnCGbSfprcirqT5UrYZ51B5MHbuiPAu4AbyyIVx9XA=;
 b=Z1D2b5jXp0BTZbpvEEVaY16eBUQPRnRFABFzBshcA25E3pcI2r67TjRnqaNPujdcGS8kkP
 n2VSz9ai6v0MT5BLXdagDGRMle27qUZbkZBIoRd46f/blrwnH+6JLtcvLxWyE/ubnfha1a
 U0N7H8A1QiNs2f8DsDnIvZHqhdugOm4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-v5v9lWwAPnSs4vIhH5E1zg-1; Fri, 27 Jun 2025 03:40:41 -0400
X-MC-Unique: v5v9lWwAPnSs4vIhH5E1zg-1
X-Mimecast-MFC-AGG-ID: v5v9lWwAPnSs4vIhH5E1zg_1751010040
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a503f28b09so994402f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 00:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751010040; x=1751614840;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rBnCGbSfprcirqT5UrYZ51B5MHbuiPAu4AbyyIVx9XA=;
 b=ZB4SZnMF0oBSXdNzr3b8FxHl1Q/OqlzSkA8HoQEAXfkgD41qwfbVTUjc/QGEl3a78V
 xo1gODNNKeMMtZOJuVUZnyA81Y7Jx1lNsL5fM/3r57k5m/r9DVM8dK5LUXqbi+9XTQFT
 BI4XhztgOqeuTCYczsIgJx8/J4cVlU5L5e6la3MMvGruDxMjEzKxhndnfjcFLm9T56Pn
 JDLFJ6Xh1q5BbInjkfv9T10yzP8Spwj1x0eFCfrvLJEzjJyE1UyXGycy3TwAqK9Sj31E
 pwFq34jtsQNKFTUJKoJFrUtAgprd3AX9BSehQBgfyEfhO+yjSS2VgocPEZXxuhpTMH7I
 25YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZdPQSvbAosYQIBBYKCquqf3rw48vBHIeNUX0/CtSswWFU9ufd7Bov9yv4JQFBv1mtY9bW++uREZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9yYv41xDrNH79e67c5ueHBEmdJRPUG02BCtiClm1Vd+1aDqgV
 Tiz7h7vdOaK+7TD0hS2PSAf+WQzE4QFuvU+zqU7DvI7DnBTmJOUK847MV5xkvKwPKqm3p0dx43+
 cloyg/uBqb/B4xui/GLJxlAap1/EcIsC4kWlye0ozaU9NJFNwglYpt48nfz+N/Xl056NBOw==
X-Gm-Gg: ASbGncvlcp4/q9DNVMQ7vk1PKicyid6N6V0h4G9FBg5e1Cfo3pPf5bMmYjzW0eGwibx
 U/Eg5Zm53tXcv6bdcbUTwzfc/zP3Z8ma4w87mcK1dvZee+ovaUGzsCmmfwVmMPKb9ZZI1HRoAei
 MVrgjIHBdeU1Ko2hAvQnPSgP2R1C8yYY2kIW9SMqhq405xAnNctrwrLB7HQ7DiJmjOixfL3Bm8K
 dflvcH1iLEyrWfPTCjTyVt5aOyFGs2MOaTPE7T4vvPVdjGpcwhgbGAKkI393P9VP0mb7MeZBLVG
 qwy05cwVuVnyl+3M5Q3xvlq54ut3HEGc4kt/6aJlB+czRhXJSMkAOsIiNtdBAHuHYS09s41Uwa1
 vgyxC
X-Received: by 2002:a05:6000:21c5:b0:3a4:e238:6496 with SMTP id
 ffacd0b85a97d-3a6f312ded8mr3496376f8f.18.1751010040106; 
 Fri, 27 Jun 2025 00:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHffkWr+tNQHcP3BKAqhEIUlPXtP0GPPD5lJm+uaf4h6Jumi+zY3AGg3kh3v10ckZG0pyurtQ==
X-Received: by 2002:a05:6000:21c5:b0:3a4:e238:6496 with SMTP id
 ffacd0b85a97d-3a6f312ded8mr3496353f8f.18.1751010039681; 
 Fri, 27 Jun 2025 00:40:39 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e528a9sm1956705f8f.60.2025.06.27.00.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 00:40:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Weiss <luca.weiss@fairphone.com>, Hans de Goede
 <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge
 Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Luca Weiss
 <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
In-Reply-To: <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
Date: Fri, 27 Jun 2025 09:40:37 +0200
Message-ID: <87wm8xd43u.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y_hl0yIhL--Aw559RqHZkQmimn_eYwCFx3aHZ8w-LRQ_1751010040
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

Luca Weiss <luca.weiss@fairphone.com> writes:

Hello Luca,

> Document the interconnects property which is a list of interconnect
> paths that is used by the framebuffer and therefore needs to be kept
> alive when the framebuffer is being used.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

