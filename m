Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4717B3F7F7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A7B10E5D3;
	Tue,  2 Sep 2025 08:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="I1OnqSU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3C910E5D3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756800926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HXRyi8QQ+yoEJQrCXQN+YoD6Y9D+uJQKqe1ifwkGZM0=;
 b=I1OnqSU+JLZ11NV3V1TJlvPTnMfNDJ65TY2INSYQdE18bJQXiJR85xq8nuuTrLHuZVBVkh
 EfUuXk1sQTtVFpZUl6Aaa17RDyff0+n2RIzlkd3uj/mftkmb8vcj7bW2UBvQmnzCkTJu8S
 YtDi2jvo10lXrUrXFePzJUf89/E+PsU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-RDAIw1sGPQSjm5cu4dgCEQ-1; Tue, 02 Sep 2025 04:15:25 -0400
X-MC-Unique: RDAIw1sGPQSjm5cu4dgCEQ-1
X-Mimecast-MFC-AGG-ID: RDAIw1sGPQSjm5cu4dgCEQ_1756800924
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45b7f0d1449so19078565e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 01:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756800924; x=1757405724;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HXRyi8QQ+yoEJQrCXQN+YoD6Y9D+uJQKqe1ifwkGZM0=;
 b=bepZ0xGrlfcmlh4X7OjLurL4Z3DR4D/L2CWH8/zOK7ck0yIKqYfYQFAKAxmg/Yy/7w
 IPCvRk9BA69VuY0eg+mI4jQTbDVkvzC4CLYq1GZj34XQEX3uParo8SWgPQmbkYPJYDoN
 n7A0O9rxVbknAW7ecYQ8wgL7vzgzBXS9CgS2X2K1jl6HC39qZtwsf+56CFJG2snUGOoc
 pGbn5BG1BsZhxWAFRMB5EJLS/XlopZJVw/aHh31uuml6q7GgABTE/qwqi9XzvZ0s7WRt
 3I8beu6utUZL6f34EQAUuWoErblN54D2j2TxIGLx8uAsIMz8rglHZwncm0TY3nybegXL
 104A==
X-Gm-Message-State: AOJu0Yzsg52Sg/otzf5VRh1SHBr+STU9TJxm/mElT4iGE1GVJH/MfMxF
 M6Ct5wqjGHAvNHLJ95UeK5YNHdDg93zeT8ZnpuVivd27c69xxKiaSKr8V+UrpO1oMUTj/M6uLmJ
 B90+VJwwbM0ck3pFItitTbC97R2Z+OORfnG6w85GG8Z1thdZOfCRdGiJIUuEeJkwQXYYwww==
X-Gm-Gg: ASbGncv+Wf43e52IJTfK/9q6t/EkxyOPD9/pgDiQDTMbhTmy2DGocQoBEXyFTN88y77
 8uT1Zbzw42XFQnV/qLR75E8ld+Pmro/MOSkiupoq+tZnaG3mYo4lnbqmWawKYOvcLhcH4a/tbLa
 2wyvS8HmrZaAGBSIp/vS96Rdh40Xwov2nqQjG9gFZnkeI8HWiEvCRoy6gIRvwMIPOoNxtffhez8
 8J/aEuW/uiU6qjr/g4BzOil4KaVzkorUh01TMl8VkOYwoFaZjtJ04C9t+uGotfRtqxmTRaEw+FU
 M1ypshcmx2SzcDRPNnJeIGdELTqMqN3bKluvxoA3KnrwRPt/TQWf60eMi1qJ5Spvgw==
X-Received: by 2002:a05:600c:4ecd:b0:45b:876b:bccd with SMTP id
 5b1f17b1804b1-45b876bc00dmr78095885e9.6.1756800924067; 
 Tue, 02 Sep 2025 01:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf3BXjXuhH+zQHiKvFQfBOrdSHe7/u6GM1yafj+Lz0Rrl2E0wkGX+XU06hmLpkjw/X//Nfmg==
X-Received: by 2002:a05:600c:4ecd:b0:45b:876b:bccd with SMTP id
 5b1f17b1804b1-45b876bc00dmr78095555e9.6.1756800923608; 
 Tue, 02 Sep 2025 01:15:23 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7eb05fd9sm186678105e9.24.2025.09.02.01.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 01:15:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, louis.chauvet@bootlin.com,
 drawat.floss@gmail.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 mhklinux@outlook.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/4] drm/vkms: Convert to DRM's vblank timer
In-Reply-To: <20250901111241.233875-4-tzimmermann@suse.de>
References: <20250901111241.233875-1-tzimmermann@suse.de>
 <20250901111241.233875-4-tzimmermann@suse.de>
Date: Tue, 02 Sep 2025 10:15:21 +0200
Message-ID: <87cy89fexy.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zHAOfdMhBlLvHYRKvbBhvw_v1hZdTt2ZmoGEFGQpOqY_1756800924
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

> Replace vkms' vblank timer with the DRM implementation. The DRM
> code is identical in concept, but differs in implementation.
>
> Vblank timers are covered in vblank helpers and initializer macros,
> so remove the corresponding hrtimer in struct vkms_output. The
> vblank timer calls vkms' custom timeout code via handle_vblank_timeout
> in struct drm_crtc_helper_funcs.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

