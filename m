Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0A3D08894
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C4310E888;
	Fri,  9 Jan 2026 10:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FOo3fgcv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FFB10E888
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767954272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JQvmww697RmYgNbgSJPddAKm66fAzjXixmMH1peMtxg=;
 b=FOo3fgcvwqBoFon952gQzSGr8pagdW6dUczgkuzjgdCwOlvx6ZkVOAH07XKuBEbQJvfo0w
 dOf9YjTFbWVMu+Jj5biGa7bZHjC3VQokeZTGcIWzIe/pFb81ST57B2bkcc1xS9O2VSjNy/
 ZqoL3FAi2BOhF6g7sZD3z6UhRg9aE2k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-c1Gh6xFKMSuldO_hEhwQEg-1; Fri, 09 Jan 2026 05:24:30 -0500
X-MC-Unique: c1Gh6xFKMSuldO_hEhwQEg-1
X-Mimecast-MFC-AGG-ID: c1Gh6xFKMSuldO_hEhwQEg_1767954270
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-477cf25ceccso38652515e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767954270; x=1768559070;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JQvmww697RmYgNbgSJPddAKm66fAzjXixmMH1peMtxg=;
 b=gqcUAoNRHfdVxglPuDTM5X6kMA0KhxxGTcIRSJUUUFxuEFD4N+aU8aQDnVy2AudmN6
 MMcvu9z4xFMh+I/UVgAtsh5qWVN4D12HT+zSYwjGiW4Qhsm5k7sQ252kXgSNkrVPt/1c
 rDMGdCL/o1PGxb6X6jWE85F3BOtPEpSbbJoZcSP3GAE6G82ROuQ9glqh+HeQSNqw4DqA
 b9xayX6VE9gA3oJSLt2WvFd6sRwxuLZhTVwS05WASNXwq+gUat60x/MxCCJVNZRFxfBy
 XttKbFNO8jytQz+QN9HjVsQc02QYA1zCS/WzRQejV/6UKYtQTOW/ynKjl6Lrkd0lAZFJ
 WQww==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8QTVi234BzD/7jVJkwAtAoaXCAVhOtDBJibs42oR+LaC3iu396I0zEW6u8vtUVU5Ys4ahePjqbUQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm2sVR/Yhwtkt6A/swKonKL6cdM755RsbOsCoSGaiNvwveRCpM
 7u5cjEyHaBoAEk4PDY/DC+2mA41MWC3CdWimS1etvGgUOqYPFHRAAu0NW8jUxfNE1liRP2/3Jph
 CPGdbKBzG83NL9LClOR6zjU5B2fKkUd5UE7J6hCchxS6luRJByK6Kg7CVCybfYVpkxTvFaw==
X-Gm-Gg: AY/fxX4vOBHFfOpSjDdZcnMqX3kjqvRRVXdmTWiqDZ9iJtpWBw80AwKm0HEUu4ZpACF
 A5wpop5HStF5Z8TX1hN4YF8lrTuUY4utI5ijn1QYKmPQHZQjIf687VUez4fl3C4VAA78Jx378Xu
 0VFeaQvGxB9DR3pm0PqwffSSIF3CmBdU4bU7rawDtOhTsEnfYdJprYoGMn0XLlF+JSgIJjdmW+p
 gUP2i67dBmPZVoOxtGsC2JxGnyMwsmcBbJRC8loCuAVko7KeyREKBPn0TnXgmKiEtbFAZh/fwtG
 rp5NG1GAn9fs9II6zWFb3/hr7tZpHVAmS70xDSWQVL5ZiGbI8yJqxKIMv5he/R18hvPqc2wLEDg
 Sr4RAbKHivcCrcMzqiEmv3gbCXeUGtbHumKe/pdhT4GQsyrguPmjBNe3QSmm04+Lr8l6Q
X-Received: by 2002:a05:600c:3543:b0:47d:649b:5c48 with SMTP id
 5b1f17b1804b1-47d8e4a3c73mr45535615e9.36.1767954269665; 
 Fri, 09 Jan 2026 02:24:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfja0QkpLtMucWBszQZG7txsdgUHemD6EXdIkxatnoeEzMv9HOuQQ6ZvXn6ogvp4kk/JRB/g==
X-Received: by 2002:a05:600c:3543:b0:47d:649b:5c48 with SMTP id
 5b1f17b1804b1-47d8e4a3c73mr45535385e9.36.1767954269324; 
 Fri, 09 Jan 2026 02:24:29 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f6ef868sm197989235e9.11.2026.01.09.02.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 02:24:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/8] firmware: google: Clean up include statements in
 coreboot_table.h
In-Reply-To: <20260108145058.56943-4-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-4-tzimmermann@suse.de>
Date: Fri, 09 Jan 2026 11:24:27 +0100
Message-ID: <87o6n3f5ic.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BFSUT5YqsipbP93VCX2DDMxS88q7ntgbg6j19qWJxpY_1767954270
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

> Include <linux/mod_devicetable.h> from source files and only forward-
> declare struct coreboot_device_id in coreboot_table.h.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

