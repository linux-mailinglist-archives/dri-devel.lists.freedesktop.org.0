Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580EB93F149
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 11:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD87F10E37B;
	Mon, 29 Jul 2024 09:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A5dAYspP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B668510E379
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 09:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722245826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8yzHolj0LBWvvfbf6+tRyOWfIn+0w0Jej2YhRYKH2Gc=;
 b=A5dAYspP8kAge1ISINy9DdYALEzp+LHu4FwbrrHmJnSvAZs9tyA1BKP10j4+6QYxMk9msb
 hqsVNoFn0b4/7NyKI/hlhwSdq85Lt0FzqwFSiFuoStvTOyNiAexMw9nwCyENHsc1y6AEs7
 WomxC1OkZa8ZCIfn58scXjIvQiCHqU4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-ehgZBSHwP7eOvd_0z4yzDw-1; Mon, 29 Jul 2024 05:37:04 -0400
X-MC-Unique: ehgZBSHwP7eOvd_0z4yzDw-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6b7678caf7dso8362276d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722245824; x=1722850624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8yzHolj0LBWvvfbf6+tRyOWfIn+0w0Jej2YhRYKH2Gc=;
 b=Yu8MzizCbT7j/RqURUKvD2X7x4yjM/h70OVZxi0rCTr46sXJQUutB1CO3eTDreSirn
 Zf1rF+QkmtgiFysEWRrIL633jFSz3pLq+Zu9D6wQUR0aBiLazZLnzLPkauQ9N37ngXNx
 HrGie42bwSKW8YWCu5GlB5KnJXnwRzJKCZgRaWk53q2SqV3c4uxIpCk0ipUQGJYTYXhH
 v4782oVEyphcg+0l9l9dhIuAzyu09B6ADJESQmlgZb/wrRjhEEsWkflkOepPxz4SuPt9
 zgza7UdGg4fPTkxwCAkeDzmuypd1aRxrmRQf6U/ZTYKbRYHeOH9rTl6ZLFmDyNcugnHE
 kOwQ==
X-Gm-Message-State: AOJu0Yzx9EnSp9TYuCPXra+nT4j1+cRpjlEOf9UVB5J+8nEBCrihemhd
 SS4MDlAXm8EDja39LJf3MSpLfdpgvYX0HtcNKFNIiTwP1Y+HoXi0/YR6NiAkW/BjCSjF2TfeVzV
 mGWygN5ubzpyNDo42VIVDz/1aE57FBhuIlxusaioHb2JTrc11zJ957NAvNCF3HY4NCw==
X-Received: by 2002:a05:6214:2b0a:b0:6b7:7832:2211 with SMTP id
 6a1803df08f44-6bb3e2043dbmr102004116d6.3.1722245824088; 
 Mon, 29 Jul 2024 02:37:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFajgcbMizSfez+xFTta1vgiY+ZYkosQdlpq9GU2h/rROwHquJE6I29rQYeZi0foyo1YN47NA==
X-Received: by 2002:a05:6214:2b0a:b0:6b7:7832:2211 with SMTP id
 6a1803df08f44-6bb3e2043dbmr102003986d6.3.1722245823659; 
 Mon, 29 Jul 2024 02:37:03 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fa94a16sm50047086d6.86.2024.07.29.02.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 02:37:03 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 2/2] drm/vboxvideo: Add PCI region request
Date: Mon, 29 Jul 2024 11:36:27 +0200
Message-ID: <20240729093625.17561-5-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729093625.17561-2-pstanner@redhat.com>
References: <20240729093625.17561-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

vboxvideo currently does not reserve its PCI BAR through a region
request.

Implement the request through the managed function
pcim_request_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index d4ade9325401..7f686a0190e6 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -114,6 +114,10 @@ int vbox_hw_init(struct vbox_private *vbox)
 
 	DRM_INFO("VRAM %08x\n", vbox->full_vram_size);
 
+	ret = pcim_request_region(pdev, 0, "vboxvideo");
+	if (ret)
+		return ret;
+
 	/* Map guest-heap at end of vram */
 	vbox->guest_heap = pcim_iomap_range(pdev, 0,
 			GUEST_HEAP_OFFSET(vbox), GUEST_HEAP_SIZE);
-- 
2.45.2

