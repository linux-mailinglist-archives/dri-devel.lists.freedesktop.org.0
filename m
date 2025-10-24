Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEC7C054A3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 11:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFE710EA00;
	Fri, 24 Oct 2025 09:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JSsE+GCc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBADF10EA00
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761297469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MU97/68jphUz5YIXofcPtO7qat4c/oSr3H+jmWVEQI4=;
 b=JSsE+GCcCnG34942cV/JcIFEjRZs5ILFoZyv5SJMdC4P2rfUSR0M8x2jS8X9w/zTvqeT7W
 0iMJ+UR9Jqa3nuUTqxLikJMAqTdx5PT0eVeR9DugCBgVx+uN28ZtgrpqS1Mr0ceiKK04cv
 jqAH3GX8hueYySr4NNcAaGP+7M2FLKo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-QVQTKKuEPQ-u7j4ozzS3uQ-1; Fri, 24 Oct 2025 05:17:47 -0400
X-MC-Unique: QVQTKKuEPQ-u7j4ozzS3uQ-1
X-Mimecast-MFC-AGG-ID: QVQTKKuEPQ-u7j4ozzS3uQ_1761297466
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-428566218c6so1096110f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761297466; x=1761902266;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MU97/68jphUz5YIXofcPtO7qat4c/oSr3H+jmWVEQI4=;
 b=aphH+MLuF/lFOtBetz0wUTC8qPzQLZg4pE6JqFRFVbmMWpkhZHXsN2U9lMSDl2wCk3
 7BYAwp3CU7MtVdgH3uWLpKyxInGZPT8rThjp13bsk8bntpYwK6V4gkFpr8aUHiLGyEOA
 9oX8gp+xRDTzHAfGH2hOqkDtCNju/F0jzo27KK+yQtt2crtphzXP4exP2QsEPxYGtw5I
 ExSTUIRpa3PkRclYyK86TcY7x6s2lUFeIUKoaB4K1RpPrKwch1ooyuU5pJ3MiYDaHI/C
 0pxqJgqR1jlzi2+jvaVeP/PD3EDuogVtkG6Z+icEGp2o64mWxQhj/52CCapt+v4RLb3H
 bmbA==
X-Gm-Message-State: AOJu0Yx9zWvSLH3EM7if6QNn2IH1uebmy01d//ai1PGngiZloVv0hHIz
 VodWLPq95Jl1oVCmqvSnnLs4RdK4dl2U2os4qe0+idZ0KizL5wjAPQ3VdBs4u2UVW03Q+lPeM4i
 +ix2Tl6vOVcyiiuZ6//SvGybAUCD506zc9qVXbCxWSaz/nsJfxk04uLUclWRRIBLHIBnHog==
X-Gm-Gg: ASbGnctkIrdMKKDcyP6ew4nl6cIh2jCVmLHM4xGb/T0ak19QUnaw/9auHIjTku+ty6t
 aFgsG2ARC0KwE80c8/Zxf9K8p8X08V+gOq5Hwy5LILM7yarbXJU13Oa39er4wu8q+b1+2t4vk5X
 L/qQwE+y7P0pnrhy6hRd5sYACOpztnj+6U1ZfutOADhpQmPUOvjGl6SdiCJmIKl8GwZNiULSK4G
 q0D8QdemxG8ZptSkaIjCLFjHrEKBCu+yuGlqyR3zgpvQOzL20iBpJpU8B2aAZJQIumfAphtxGHO
 ckNGKPbo72Qh6ITfGqsSs7af0R06JMLbAH/rIQbRSLJjwsuOMY5/Vob8i618gNMGmluExKjomi/
 pGwAj8SdE3etg6hg+60q0C7ktx2uYuh0rXYstN6tSn0Z+kZiMXq5+7CsCHQ==
X-Received: by 2002:a5d:5d13:0:b0:3e8:f67:894a with SMTP id
 ffacd0b85a97d-4298a0406e4mr4719768f8f.5.1761297466352; 
 Fri, 24 Oct 2025 02:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErxNwAp3YJ46I0QMeE8v7bXn8RSjukbthJvAuSeXuGuGHCehJoQ3Vd8QggHmuf05ruIbYVYg==
X-Received: by 2002:a5d:5d13:0:b0:3e8:f67:894a with SMTP id
 ffacd0b85a97d-4298a0406e4mr4719746f8f.5.1761297465958; 
 Fri, 24 Oct 2025 02:17:45 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42992e47f6asm42098f8f.33.2025.10.24.02.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 02:17:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/gem-atomic: Reset plane state to NULL if allocation
 failed
In-Reply-To: <20251017091919.58770-1-tzimmermann@suse.de>
References: <20251017091919.58770-1-tzimmermann@suse.de>
Date: Fri, 24 Oct 2025 11:17:44 +0200
Message-ID: <873478acav.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BvcXR5PpKHBfgEvoH5L0CTjT5A6DQT-tEFEJ1r8G1Zg_1761297466
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

> Unconditionally reset plane->state to NULL if the allocation of the
> shadow plane state fails. Avoids an invalid address in the field.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

