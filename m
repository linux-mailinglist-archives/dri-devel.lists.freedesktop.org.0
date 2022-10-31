Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD9C6134B0
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 12:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3148510E1A0;
	Mon, 31 Oct 2022 11:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4832A10E1A0;
 Mon, 31 Oct 2022 11:42:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73B37611C0;
 Mon, 31 Oct 2022 11:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1916C433D6;
 Mon, 31 Oct 2022 11:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667216553;
 bh=82Mek9NsJD1mKAuPA30xuCcYkcZNBfTDDhKVt3EFQzM=;
 h=From:To:Cc:Subject:Date:From;
 b=SDGu+350LSd6UUGVfMSjNZXL4nSuHT5WWMERpzyM7O7ULR5S7YNidkx2S3hopmSjr
 //XOykptdauZPLeOwq7PnbNSltLDTCbkq7vJhyIPbMGg190xXTxllB3/qsB8lM85S8
 9Udzz3scQAW4xn64ls7Q+dSqXKm2US2OQNmWrW4nWo/z0ciNU/30VIFA4l5jwB9rkl
 PwxLxH2DFOFXD/vNJR0gctqycPHO1BnJVkFewJiVXVWpYeWNQYSCNs5USIwfNpgd3S
 P8Ms7ohDrW/ZnPPn9dorWYJRpWx9ZBNI4PUSyNcMvf5GwDUP++f9iZp8ouiiam89Bx
 v24R4dZTt3AXA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: bskeggs@redhat.com
Subject: [PATCH] drm/nouveau/kms/nv50- (gcc13): fix nv50_wndw_new_ prototype
Date: Mon, 31 Oct 2022 12:42:29 +0100
Message-Id: <20221031114229.10289-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.38.1
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
Cc: Karol Herbst <kherbst@redhat.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Martin Liska <mliska@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc-13 warns about mismatching types for enums. That revealed switched
arguments of nv50_wndw_new_():
  drivers/gpu/drm/nouveau/dispnv50/wndw.c:696:1: error: conflicting types for 'nv50_wndw_new_' due to enum/integer mismatch; have 'int(const struct nv50_wndw_func *, struct drm_device *, enum drm_plane_type,  const char *, int,  const u32 *, u32,  enum nv50_disp_interlock_type,  u32,  struct nv50_wndw **)'
  drivers/gpu/drm/nouveau/dispnv50/wndw.h:36:5: note: previous declaration of 'nv50_wndw_new_' with type 'int(const struct nv50_wndw_func *, struct drm_device *, enum drm_plane_type,  const char *, int,  const u32 *, enum nv50_disp_interlock_type,  u32,  u32,  struct nv50_wndw **)'

It can be barely visible, but the declaration says about the parameters
in the middle:
  enum nv50_disp_interlock_type,
  u32 interlock_data,
  u32 heads,

While the definition states differently:
  u32 heads,
  enum nv50_disp_interlock_type interlock_type,
  u32 interlock_data,

Unify/fix the declaration to match the definition.

Cc: Martin Liska <mliska@suse.cz>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
index 591c852f326b..76a6ae5d5652 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
@@ -35,8 +35,9 @@ struct nv50_wndw {
 
 int nv50_wndw_new_(const struct nv50_wndw_func *, struct drm_device *,
 		   enum drm_plane_type, const char *name, int index,
-		   const u32 *format, enum nv50_disp_interlock_type,
-		   u32 interlock_data, u32 heads, struct nv50_wndw **);
+		   const u32 *format, u32 heads,
+		   enum nv50_disp_interlock_type, u32 interlock_data,
+		   struct nv50_wndw **);
 void nv50_wndw_flush_set(struct nv50_wndw *, u32 *interlock,
 			 struct nv50_wndw_atom *);
 void nv50_wndw_flush_clr(struct nv50_wndw *, u32 *interlock, bool flush,
-- 
2.38.1

