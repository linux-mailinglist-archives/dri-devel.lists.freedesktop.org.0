Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D68B0016A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF1710E8B1;
	Thu, 10 Jul 2025 12:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eyTO1NpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA73E10E8B1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752149775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C7WSQAd/5bueG40yFS4I1dKflLN1KtjmBQN4YxAf4UI=;
 b=eyTO1NpYScj1/O8HoUK1QxrYkHyihmIVMvTMy8tdwr+4OC1sZTYzkTl/rWhxy0xmsFruAk
 BiiW7l1uMsY3hnq/PiIOPfcRo2p/C3+2YyffPqhCNFAxT4BGDMFiuLtOnzC/tO+ras121r
 w47SV/3IwHTzBaxA8usVAyqws+8cKoo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-e3NwGbszMhyDDU9CRlKD8Q-1; Thu, 10 Jul 2025 08:16:13 -0400
X-MC-Unique: e3NwGbszMhyDDU9CRlKD8Q-1
X-Mimecast-MFC-AGG-ID: e3NwGbszMhyDDU9CRlKD8Q_1752149772
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4537f56ab74so5850475e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 05:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752149772; x=1752754572;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C7WSQAd/5bueG40yFS4I1dKflLN1KtjmBQN4YxAf4UI=;
 b=Nm+h16AR0UxjC3TGqRzisYIxeIzOPZHdpaTNaI65wKKrEn90vrt1m2v8BgG0u7wjwp
 2+7W+Afau9WyHkC/gVugvJz+Krc3v9l3jOjF6KpV5bWn1OlP4sXU4bgYIKf+FHo+19UV
 cRlM3JMewxRYBXOW/3Orudjh/6pqgA4QgDIwuh92mi6degXuW/x0uvrYuWfTYyC4NJSf
 v6JCU3kLlfjL32eU16kZ13dvRa3b5PIWD3tDanSoHLI3xnty+WIS508xVR/8NZ/GJyWM
 pfS/J4QV40Z3TilLDGIvvqUOAakzzVZJc//ojJmccoaNCz+bZUa5LPOC1dVUE3FEdXhw
 E/Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8nkRrhS0GCBuhzhdQ2jomscF21L4K5Xm+tnNIAARdVdPBxHIKK8M2s73E8/kU0pVDIlby0ChOj4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXgOm9S3intlWIVLAtiC49caslNAmGknHFAxsL9McKe2Eli4L8
 0ovlgFtjN09DRFrVWgF/48AHTADkiuSFegom/RAguJuwkj9FC95/DFMv23HS5+Vdv7zk+DyLt/9
 f9SerO1m/9+9cIs3qhYWNu8VxOcppqamtcjuyDtsXftq2moqeQfWpS2DZIkVEp9BGXWQbxg==
X-Gm-Gg: ASbGnctqyc99BMzbKKK8vaZploJVh/TjsDYokM1wN02QaR7MJH0RMDVLdReImpQt/yp
 bVdX4Pm6SsGMKZo6qyDZXWpxq3bC++ypp5fZFTO3g2ccuV/7shV6EjqBUJZCx0y/qu73B645UQP
 oZF9ZHbXBjBxDiQpvrDGiefMG+lGit2jy3C1GiJCUMQLWGLHkdFfsz+GXt+V3BEIjb5hUaaAVjq
 DY+D26gFJ9MRf7MvMOWVkmqCZ53Kc851LYQcAYL3pBWehT7Ej6LBW7tifM/lgpNpyKYP1H1GLh1
 qfaR5eXyR6ACtxt+QUMehmR/CUkxc45JqrvRLIxuKh+QaN8Cg59VRgvyRpqCmnqluIVU76Ju+QF
 nOzE0
X-Received: by 2002:a05:600c:1c1d:b0:43d:4e9:27ff with SMTP id
 5b1f17b1804b1-454dd1f55c9mr24102285e9.7.1752149771962; 
 Thu, 10 Jul 2025 05:16:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFQ4fvBl5DvJwxut96PvmY2A7sXSV02kXUs1VCK8pud8vUbxTE4I9cda5ul5FCiRSxvpSrGw==
X-Received: by 2002:a05:600c:1c1d:b0:43d:4e9:27ff with SMTP id
 5b1f17b1804b1-454dd1f55c9mr24101895e9.7.1752149771479; 
 Thu, 10 Jul 2025 05:16:11 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d511b43csm54657885e9.37.2025.07.10.05.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 05:16:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 3/3] drm/tests: edid: Add edid-decode --check output
In-Reply-To: <20250625-drm-update-edid-v1-3-2d963743ab9e@kernel.org>
References: <20250625-drm-update-edid-v1-0-2d963743ab9e@kernel.org>
 <20250625-drm-update-edid-v1-3-2d963743ab9e@kernel.org>
Date: Thu, 10 Jul 2025 14:16:10 +0200
Message-ID: <878qkwfdh1.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DDU4xf1Qsf4KbQoiiY9hN4Wdfg1qNGXlQjOLTI7nF64_1752149772
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

Maxime Ripard <mripard@kernel.org> writes:

> Some of our EDIDs are (rightfully) invalid, but most of them should be
> valid.
>
> Let's add the edid-decode --check of these EDIDs when they were
> generated, so we know what to expect going forward, and a comment to
> explicitly mention when we expect them to be broken.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

This seems to be much more robust indeed.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

