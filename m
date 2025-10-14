Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18289BD7F6E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF83410E55F;
	Tue, 14 Oct 2025 07:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Mg7USC6Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF92910E55F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760427480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ajVLHYVNTc11NQnF9+qMXQzNmIez+Zi5q8MUvX7v/NA=;
 b=Mg7USC6QWcCFg5zQBgYoFi1qjO7lWsk6ikoNCOKuDNgo0AjsfGN1ya5Ss/xKQFSTSsiUiz
 WEzgCYMMVebZRmFf0Sq3CgZfyXycMZElqypvuh+TGsaUa7fM/j5MYnr4KCgbg/qofr5v0Q
 hEg0zAxmKJ3OiwlDzHfuZqyNwPZMOEA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684--Pa514MyOG2SNa7fPqgJVg-1; Tue, 14 Oct 2025 03:37:57 -0400
X-MC-Unique: -Pa514MyOG2SNa7fPqgJVg-1
X-Mimecast-MFC-AGG-ID: -Pa514MyOG2SNa7fPqgJVg_1760427476
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3efa77de998so4811138f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 00:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760427476; x=1761032276;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ajVLHYVNTc11NQnF9+qMXQzNmIez+Zi5q8MUvX7v/NA=;
 b=vr707QWV/OPx4msmjV2+3ZI+ozQNXQMxTEmuAzBlfO3KEyT4kscBpax0X4L34kGIs2
 t904t+P7oBINOEbzqoBVhJchZWMxHqM7X52k+HPi75DNFb6CnzLsggDt+NkJghGDQz0Y
 1P+e9K7BkIHj+2B5T7T+wx8cG17u1ERFhnmzY20Qn2Ld2nLdsdBN0BQCM7RucD721C/1
 K73IC6qmw/e0uolZ07MLBEss9Mw/zJmUE4BXnPV1l9Gw4afkJfWLaqSuDJfymhg57O25
 LSUo3j5aAFNCuIxaAHZufoi02zIXd0DJlJwHrQx6H4t5RKT/KO8m8bVRCfZKIKXESWF2
 iG7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXikYonCCijg8EVdI4w3oMS6ySZqhgKzBoP035PilG/kwLVV5FW+lmL8Dc2HEwZcfXvi87jFHxTceM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl8GkYMcP8Lio2/mycb/Ff2Z9fnwt2KPM72UUjkS1z1YrXdqAO
 hdqMtzFTB+rYrbq7VA2QovKfuulzyvl91CllSA1YjXU5h7klA9Be2gkLblKXSgyqjjdpih0k6C2
 wWw0ICeXodd6XSHULeGgAlnreVUTPxlmpMXY+hPro6pBrD0YckBbadnvwpfVxZ5qpBgF5zQ==
X-Gm-Gg: ASbGncviIDKTQzxziJOaW6Wfbv0QpS8B/mcBWcz83D0W+yJcBq8kkgfsku8TSRytfkq
 NN8AHQtyXkBJ0mF3HGmK0V0TQGam755tQg1O06kDtHYWpcX60gRjpGIWK3euDDhAaW75EcQaAlG
 YaFH1CHyLfHU6KtCKQWya8gVr8N9qZmRzha0+NzqyxH/kxadGzC5nsBvO0XIo82uSHakt1/TDM5
 9BCz4FOExEtaf09kvQDicr/n7GX7RXvU6Ycem4tuTYfAbbBSS6QCSH39Z5zWDG4ajK0QMZ/C3Ft
 qtqhX2Cr4l48RCRanTdkwiw/UAaX9H5A5AlWkbEMBHmNJBtWms/mPMDlHg7sgJ1Mm2+sWMlgAlO
 0/bxcWpQX0dEb3tugsLnmeAU=
X-Received: by 2002:a05:6000:603:b0:425:8bff:69fe with SMTP id
 ffacd0b85a97d-4266e8e6c55mr14958365f8f.57.1760427476425; 
 Tue, 14 Oct 2025 00:37:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFakWFpLVIjohFo3FxWGxf+m3faCZnqyMx0D0r3L4Uyua5kzQh9UCZhYel6YlToPfvo+XXFPw==
X-Received: by 2002:a05:6000:603:b0:425:8bff:69fe with SMTP id
 ffacd0b85a97d-4266e8e6c55mr14958352f8f.57.1760427476002; 
 Tue, 14 Oct 2025 00:37:56 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce589a21sm22711021f8f.23.2025.10.14.00.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 00:37:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH 6/6] drm/panic: Fix 24bit pixel crossing page boundaries
In-Reply-To: <20251009122955.562888-7-jfalempe@redhat.com>
References: <20251009122955.562888-1-jfalempe@redhat.com>
 <20251009122955.562888-7-jfalempe@redhat.com>
Date: Tue, 14 Oct 2025 09:37:54 +0200
Message-ID: <874is2q6gd.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DLvLa9VNHrZXIMqOnfkigNhFFXMQ-oFIB7DzgP-Y8OM_1760427476
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

> When using page list framebuffer, and using RGB888 format, some
> pixels can cross the page boundaries, and this case was not handled,
> leading to writing 1 or 2 bytes on the next virtual address.
>
> Add a check and a specific function to handle this case.
>
> Fixes: c9ff2808790f0 ("drm/panic: Add support to scanout buffer as array of pages")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

