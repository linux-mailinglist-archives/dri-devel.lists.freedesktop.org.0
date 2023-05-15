Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C29E702ECC
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 15:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B9310E1DD;
	Mon, 15 May 2023 13:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA1C10E1DD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v9GAcsKdGg/JndGpVaxs0/qX3c0S430mZQB4bH0O0l4=; b=VTVOoycVm9art6VNVIparGVFki
 9vAbCdKRSoz5GnwiRp0vCPuBqv8odJmxTg0JrGBED8yKPAqg661Ml2KeVUCrmPZfdfmKk3SMg34Nq
 opYY0GaEWB2dX0WzEa1ycTrl/NNybEhX0Pj4FQEoTj6IBb79GO43Enzckiyr54npKJOyriYJ7sP/z
 Z1JL3Zs3LgjYyEY/o749SzG4VMWutCmkq9P9YQpqBDIoAqbj8imuBQnhBrYPHQNfu2YIm/c2UCa2y
 42Fo9BERt0pht6Falsm4oVgmy56c2+JoyMApJTcSd4VQVidt6TIOQd7KOW5uHN7lBPxWNJJzZ9N57
 BSQR6Upw==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=bowie.sc.usp.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pyYcq-009tiB-LV; Mon, 15 May 2023 15:52:33 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH 1/3] drm/vkms: Reduce critical section
Date: Mon, 15 May 2023 10:52:03 -0300
Message-Id: <20230515135204.115393-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515135204.115393-1-mcanal@igalia.com>
References: <20230515135204.115393-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The spinlock composer_lock protects the variables crc_pending,
wb_pending, frame_start and frame_end, which are variables that are used
by the composer worker. There is no need to protect the wb_frame_info
information with a spinlock. Therefore, reduce the critical section of
the lock by removing the assignments to the wb_frame_info from the
critical section.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_writeback.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 84a51cd281b9..9a126f678d73 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -142,11 +142,13 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 
 	spin_lock_irq(&output->composer_lock);
 	crtc_state->active_writeback = active_wb;
+	crtc_state->wb_pending = true;
+	spin_unlock_irq(&output->composer_lock);
+
 	wb_frame_info->offset = fb->offsets[0];
 	wb_frame_info->pitch = fb->pitches[0];
 	wb_frame_info->cpp = fb->format->cpp[0];
-	crtc_state->wb_pending = true;
-	spin_unlock_irq(&output->composer_lock);
+
 	drm_writeback_queue_job(wb_conn, connector_state);
 	active_wb->wb_write = get_line_to_frame_function(wb_format);
 	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
-- 
2.40.1

