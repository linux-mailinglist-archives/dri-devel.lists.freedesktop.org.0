Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4EA979BD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 23:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E0E10E3D0;
	Tue, 22 Apr 2025 21:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="K+W40PZu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226D810E63B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 21:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745358725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=joxllWRMo1gVbEqeWtbqHWjwqROo+sski2Q8YGooCfY=;
 b=K+W40PZuILXux7cxYSbDBAV0XkWUo47lJQmOYzVYlebmi4ffFL6N9p9/KySuw2BVUcfiQI
 BxAsy42yy42BOnba+hKjCUeEL+tMLVmD9/hRx+4eh2k1qaWltqWajxrXdaUZ1oHZUtRy5t
 Pup7G08Lu/Ufg7ntPRcgk3KZqU4ZJZY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-4R7knz00OKOhSJLbVUhqMQ-1; Tue, 22 Apr 2025 17:52:03 -0400
X-MC-Unique: 4R7knz00OKOhSJLbVUhqMQ-1
X-Mimecast-MFC-AGG-ID: 4R7knz00OKOhSJLbVUhqMQ_1745358721
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43d5ca7c86aso31377895e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 14:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745358721; x=1745963521;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=joxllWRMo1gVbEqeWtbqHWjwqROo+sski2Q8YGooCfY=;
 b=HGycU8T+3jyvow0a6lEjxc48E32PjqiqOc3GUexGGDIUG8/GGfGJjycVY3nufhgw88
 DcJX5LaYoWu4NGoqJq+t9LuwwgnYkqxUSO2EOG/biXcKiFGcEqyJK403Fd7qHja60iN/
 AxLyh1fyKTEGLuBs6iRbhadBjXmoxcxOQdT28MUbejhTMLCR4Dv5vhhXgB32EvUDl6u1
 FgDAuiiVFHNpYu3gZjhNIasFhpmEL6HIkQewqX4m5FP0b+yX9tpnesUSzaqu3VZo4Ray
 qePnp946JygRkai5/qWi3ez4ISeS2eauH0q2Mv7S2eMWniIRIDFy8c8/E2dO+gzgkYEV
 5c5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa8F3TgibKz6WZmlKA6car/gJiHkgWfDERbeQ/v8IHvtAfmF9/Y+1nnEz0liz7UoyCfon7uhg5YDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgdF8XOwa2O1mpyA+mlrXOH9OqhO0/ubZUqnRAJ1fzfU4tbfuC
 twAmXc593CBEgGlBrRtDMmOpRH2GBIhgu6ZV62pFYasI4fDkU2xJi2NfSIb1/Cz/jXH0hz5hHlZ
 a/LX86XLmr9vHpn7QZ+ThzFlLr8eafsGWvPX3zI6VgguiXyEcqaN3YhuVypygpGWMIA==
X-Gm-Gg: ASbGncus9t0TlfHxksKnQrDnLnacPvoFyIWS22KrY2UxjP7XDEctBZFa4CCxgJ+jluZ
 4uduTXzvpNsHIPvBUujaPsoD5PMvtSNrXfFi3PWz4t9ErKRqMEbRAqZ0l92FwMTKHIWYUvV3Za0
 JIKkYYqOlMmOmIiAHHTHIiytmXjVNnmbsg0MtKRBhSDgVZpb2w35meEqSRRHDeYbu78UZTPn+64
 lYPYl8ZnifCWk1KperhULpOXLWPaak+I5lHCcpBhw8S4hDLwEGRhvbe8SJb0xrhtBNEKJUWsfzM
 YA6/Gr3IsRaqXtokmeEApy6+0OkksptwZ1svMoPTe45ufYMQMTiwbnu4XPR5TcLDZi1Amw==
X-Received: by 2002:a05:600c:154d:b0:43c:f4b3:b094 with SMTP id
 5b1f17b1804b1-4406ab7a726mr134798675e9.6.1745358720932; 
 Tue, 22 Apr 2025 14:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTLxTsyxpVT4t0zbtQAWUyHdf9Zx7V24YbCZxhwIqhnPj4RWkalHudFTrHtJPVsV+GXVwc/g==
X-Received: by 2002:a05:600c:154d:b0:43c:f4b3:b094 with SMTP id
 5b1f17b1804b1-4406ab7a726mr134798515e9.6.1745358720531; 
 Tue, 22 Apr 2025 14:52:00 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d37332sm2604005e9.30.2025.04.22.14.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 14:52:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Philipp Stanner <phasta@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Arnd Bergmann <arnd@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Philipp Stanner <phasta@kernel.org>
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/cirrus: Use non-hybrid PCI devres API
In-Reply-To: <20250417094009.29297-2-phasta@kernel.org>
References: <20250417094009.29297-2-phasta@kernel.org>
Date: Tue, 22 Apr 2025 23:51:58 +0200
Message-ID: <87frhzc1a9.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FGfzj4RCSVqt-gWpkySma7KNMwq-A29_19Fpy6MWiYA_1745358721
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

Philipp Stanner <phasta@kernel.org> writes:

Hello Philipp,

> cirrus enables its PCI device with pcim_enable_device(). This,
> implicitly, switches the function pci_request_regions() into managed
> mode, where it becomes a devres function.
>
> The PCI subsystem wants to remove this hybrid nature from its
> interfaces. To do so, users of the aforementioned combination of
> functions must be ported to non-hybrid functions.
>
> Replace the call to sometimes-managed pci_request_regions() with one to
> the always-managed pcim_request_all_regions().
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

