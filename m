Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBBFB490E8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 16:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7993610E53B;
	Mon,  8 Sep 2025 14:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PNVAm3e/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A3710E538
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 14:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757340751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fPEM/6vsiAl702X9lBvcgrhIXEUzSqlwkstVlu6sD9Y=;
 b=PNVAm3e//ZO60cPbmEBOGqEXSP3IbLjtE2+XscaUJ5vqXZsxpeeQ4sU5ltXRJJ7HCLma9Q
 6Q921IWendv7dPPCIiZU4HS/tFqIW9NQ/FSfzvbg4fI1+Vg4PyrYRDQqppS4ygFiVlmQv4
 u/0nul3qTpQNMOyA9e0b3RFOtbsvIek=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-14I4-wpKMJ6ZaRdxtswVWw-1; Mon, 08 Sep 2025 10:12:30 -0400
X-MC-Unique: 14I4-wpKMJ6ZaRdxtswVWw-1
X-Mimecast-MFC-AGG-ID: 14I4-wpKMJ6ZaRdxtswVWw_1757340746
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32b58dd475eso4533596a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 07:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757340746; x=1757945546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fPEM/6vsiAl702X9lBvcgrhIXEUzSqlwkstVlu6sD9Y=;
 b=M9mh5EA0s/XV0RwzKdTCy+yZlrWrhbbfMirSnYNrVPoxYwpGl10bCOyzDyZ1lpfON0
 a/6vyDiBlK2nSPt5A0ne2k4A7Jt4G8DtfsG6+Ffvz/vqWwqjdX23C8g8EdhCtFfh+fyn
 gazwKPlonKsqp0QafDnDUSoQuwkmtpCIs3AQhWcty/IdJk/mMWY9cfeSDFSXndboRha5
 xkZl1qR87qmXWXNn7EjkXIO27kO0gNgYVEmaC/ylNYJhST1vNbsDk6dJbb8/7FN38ZRV
 YImfsAUEeeUXrXOk8paCQMJ3LwldutAx5VX16Uj2AjCUDJdG5Im3r2UMmz0UEShdacki
 TRzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW028VN0f1IpmkRsKHPxBPNMby6F10V/ZayVx0qBsS/iLXOB+KwRkPw8xiWqHnYEq48B8M4ioCgaAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn/vsvGx8knfa33CXeomo7bmVdvORKqj5aezYNmN+qn4ahuxPt
 ovKDbsJ33hCvxL/Aqwk+aBk8KpiI1LpOybdXfsq+9eZGr6vFrkDE/UIqpru8Zh8xhUMGgmmcpNX
 oEsbq6R1W9qMuj8iCuYE4bX2RpckNkfwz0wX7U5U3nwRdQOaZf7PdWI1DzMtGmGn97zRydQ==
X-Gm-Gg: ASbGnctT8VYAtqAHZn8Cl8HERgP7mX6mA5zE6CSumwneJ+x/CiPhwdld0Wf8PeAVHVF
 8wN38+AOCuZ8E64HG/KjKVxUEjG1NSD3UldQXXMMjN5J9b0zJQtkkKACFGLgP0NHTjpivANmTF5
 ua3Yv4PRpdBTw486gfoNVQ94waDU7nRcJBSqoVTjyQL/DgAgKGS6dahB/+h3QIM/onP2ylSwG32
 XbEIXGCVv3NPi2SACZK9Zk17s0aElGWirqry+4AjjfK8sdrUv8MNlSp9s1Mre0iF0UDBo1aVCLk
 K/12P/DaTkzSgKF3mkyAQUlGZFabWefI9mo=
X-Received: by 2002:a17:90b:4c12:b0:329:f110:fe9e with SMTP id
 98e67ed59e1d1-32d43f5bc76mr11240823a91.17.1757340746448; 
 Mon, 08 Sep 2025 07:12:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpoq0ydxeRV3bqT1pPZ0asQ1BYD8GDn9+GYnc0QJIZ3/e+Jo6uQtsHmaaVuWuQ1Ptp5qrMOA==
X-Received: by 2002:a17:90b:4c12:b0:329:f110:fe9e with SMTP id
 98e67ed59e1d1-32d43f5bc76mr11240780a91.17.1757340746005; 
 Mon, 08 Sep 2025 07:12:26 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32d89f32ebfsm2937596a91.0.2025.09.08.07.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 07:12:25 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: zack.rusin@broadcom.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, ian.forbes@broadcom.com, jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH drm-misc-next v2 0/1] add drm_panic_support for vmwgfx-stdu
Date: Mon,  8 Sep 2025 23:11:33 +0900
Message-ID: <20250908141152.221291-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BSfP_ioqHeJyBrP5U1vd9XHdgYiHrtfFURvb7LP0QQY_1757340746
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Add drm_panic support for stdu in vmwgfx. This patch was tested in 
a VM with VMSVGA on Virtual Box.

I got 2 type of suggestions from reviewers:
1. Write the panic screen to guest_memory_bo and send dirty/flush
command
2. Write it to VRAM directly and then switch back to legacy mode

Since option 2 is simpler than another one and ldu might be able
to re-use some codes if ldu supports drm_panic, I re-write this
v2 patch with option 2.

Ryosuke Yasuoka (1):
  drm/vmwgfx: add drm_panic support for stdu

 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  | 73 ++++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  | 18 +++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  |  9 ++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  | 43 ++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 34 +++++++++++++
 6 files changed, 178 insertions(+)


base-commit: 306c8959b5fdfdc3900aebe4e56257a349f5765f
-- 
2.51.0

