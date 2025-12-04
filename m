Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C18CA294A
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E6010E130;
	Thu,  4 Dec 2025 06:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="W4CD8DwD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48E710E130
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764831539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b1dUiMKw0m9OgEVcpxGNs60yf3zzRP2Q8ePCg7lCbBM=;
 b=W4CD8DwDwa3P1RbzQugIZWMWcNsvEqiDaY29IUnn1HJeV3Us8EgPDbuspYJ9VWUkk1V5m/
 auxYZ/WBZ3wikS8h8M0A05tp8t/UAK0YvpRIi8VmjTXAjpBZuvD7sRn2Qfz5mqsFKxobig
 gofg3yhME9OSPK4A3F8/n7RYtqECiiQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-yAJQ29nPMpiAbqL7-FVu0Q-1; Thu, 04 Dec 2025 01:58:58 -0500
X-MC-Unique: yAJQ29nPMpiAbqL7-FVu0Q-1
X-Mimecast-MFC-AGG-ID: yAJQ29nPMpiAbqL7-FVu0Q_1764831537
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47788165c97so2895255e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764831537; x=1765436337;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b1dUiMKw0m9OgEVcpxGNs60yf3zzRP2Q8ePCg7lCbBM=;
 b=UdrF3l+KOo5s9SnZUc8RT6d7Mf+Q7Q75e9RqMps15QDwtba0C3J1m2E1+5GQUEBgBr
 f8CHB5rNWXGSuw1prUiUUyuyMmoX9ejVsmjmxsfzCikGhmcwg1QheAW7Km6WzTho/OQb
 Mkd3kDwjX/QfEZ8tdso75ntOoK4WLuRqGz/s0idBvrVGi4xnojFyFZy/Dups00r4RNMn
 Dbs3ktc4QxySTs2a15Ks5JVYlSBYRw9lofeLOTAY09khbyuliul3GN7pIJSm/IaaFRk8
 FOI1+1iuilUK0+4DNn8oFRoqJN5rjXKrffeYObeO/OcBdwBDxtXqWO0EJMTRsG6n/E4L
 A3AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXawWXn2dQnRmoYX1yMbvmzEW4d0df3eYU8ewAdcKQOZb+qp2oexJ7dD6Q2F2n75feBbUzHIC9jQyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZHGbMZM7pZWgsCXYqhqNj5U2thebozZ/3JRxjaiYm8aYOicer
 pmzQGQ2G6iSWgLmaGyYCP/jSWUy1vFUUlyHcJSpHf7NvLERN7CvGbS1s/mKLdccJnHOBM8nKUHS
 eE01X3k3dPUSqGISw2GTQ7J3NLuwADsjWIBqy6X14t4aBU0a8bIn+AWhbuIYL/3oKqwYoBQ==
X-Gm-Gg: ASbGncsoDTrYqn33cV6RTP7198FqsThLdoTAcyr9f28Z0J0wf82FcUrkRu1WzuJGY5k
 HzSFiaSUYvqvmEXM3yCct1gf86sQJ5CpTNxIuJ6lNnzlU9nPpQU2TvUqG58o9UvOy/+ApS+eoGc
 MJWlwu4vktffc3+ootNuLk9v7OCuakEIp2uhAGhOMZHEPWZeb0su064ZrDg7P1MKdWRSm+Gz3f+
 dfjZSS++cTnrDyJ22mpVAGFM9P0zfSXMSoHRO0Wr+QszFO44+J1sB0NpuUkxGOLOPZ1/P0aG56x
 fpWqyUrdMDZedYktH/GX2DQCTU0YpxhYL8h4dpQIdc8aXEzFYfXGadzDEmCNXzDfDVtQrjtbdHC
 9EyOknp0cWilQdrtTBZpGBWc/w4Xe/YKZ62Fa1zV0iJIMSYKyF21hNkbH56CSCiu28IHL
X-Received: by 2002:a05:600c:470a:b0:46e:396b:f5ae with SMTP id
 5b1f17b1804b1-4792af34f62mr57868305e9.16.1764831536892; 
 Wed, 03 Dec 2025 22:58:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJx2MgmvBWhxcwH/t9cq4qgpf/8RWK2dAXWuJnkHcfFWb6Y2/9+dXROv4VUqnLVPbmKN7bDg==
X-Received: by 2002:a05:600c:470a:b0:46e:396b:f5ae with SMTP id
 5b1f17b1804b1-4792af34f62mr57868115e9.16.1764831536503; 
 Wed, 03 Dec 2025 22:58:56 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4793092ba4fsm17681925e9.4.2025.12.03.22.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:58:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Zack Rusin
 <zack.rusin@broadcom.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/plane: Fix IS_ERR() vs NULL check in
 drm_plane_create_hotspot_properties()
In-Reply-To: <aTB023cfcIPkCsFS@stanley.mountain>
References: <aTB023cfcIPkCsFS@stanley.mountain>
Date: Thu, 04 Dec 2025 07:58:54 +0100
Message-ID: <87ms3ypwb5.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LBGpWlbYd4FJgpKlpnLRgPuxT40bbyOuNjQczjLk_f0_1764831537
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

Dan Carpenter <dan.carpenter@linaro.org> writes:

Hello Dan,

> The drm_property_create_signed_range() function doesn't return error
> pointers it returns NULL on error.  Fix the error checking to match.
>
> Fixes: 8f7179a1027d ("drm/atomic: Add support for mouse hotspots")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

