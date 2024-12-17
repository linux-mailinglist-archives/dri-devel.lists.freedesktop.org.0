Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F73C9F581F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 21:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031FA10EA7E;
	Tue, 17 Dec 2024 20:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aSTXJMXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A81010EA78;
 Tue, 17 Dec 2024 20:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Drn6/IqBqAYOy6SlD2LsdxTegI8/JYTUoYO/+BzIFjg=; b=aSTXJMXaXt+bg4AtTpzOCUyjPt
 G9su4/4BrUghp7sh/uRp2Q5JLCGzbPFXe3eQAgGSCsrRzN27/UkkXwUUObXIVPEbdNrYsvRPDBmgA
 ebqtnawFTURVS5VZDN0iY/PDHkHQ9A0FLUK4UpcEbd+uEe/CP4s8cNEtSUYaIKyT6Qa9jZ/Gpgrpf
 +FBKDBdUa6CXHOUi2H1uEiN0DkwPZyiX6gXr0mHVgaoyoxrb5skLPpY9TzNA346XVDyQPQaoSPk4t
 069uJVkx8mOriDZ6WQbZon0GfcdsNMOsgDTUrgHJQsyt3ksO9eHm/JzKYT/6dfVoXKkJUKUygNPu1
 ZqYdG6oQ==;
Received: from [179.214.71.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tNeWq-004X2k-4n; Tue, 17 Dec 2024 21:50:52 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Timur Kristof <timur.kristof@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Fabio Scaccabarozzi <fsvm88@gmail.com>,
 Matthew Schwartz <mattschwartz@gwmail.gwu.edu>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH 2/3] drm/amd/display: increase MAX_SURFACES to the value
 supported by hw
Date: Tue, 17 Dec 2024 17:45:04 -0300
Message-ID: <20241217205029.39850-3-mwen@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217205029.39850-1-mwen@igalia.com>
References: <20241217205029.39850-1-mwen@igalia.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the hw supports up to 4 surfaces, increase the maximum number of
surfaces to prevent the DC error when trying to use more than three
planes.

[drm:dc_state_add_plane [amdgpu]] *ERROR* Surface: can not attach plane_state 000000003e2cb82c! Maximum is: 3

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3693
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index d487f317ea34..8542607f919e 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -57,7 +57,7 @@ struct dmub_notification;
 
 #define DC_VER "3.2.312"
 
-#define MAX_SURFACES 3
+#define MAX_SURFACES 4
 #define MAX_PLANES 6
 #define MAX_STREAMS 6
 #define MIN_VIEWPORT_SIZE 12
-- 
2.45.2

