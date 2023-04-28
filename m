Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C3D6F14E3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 12:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A7910E3BD;
	Fri, 28 Apr 2023 10:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7447F10ECA2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 10:01:47 +0000 (UTC)
Date: Fri, 28 Apr 2023 10:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1682676104; x=1682935304;
 bh=iY8xFGsB6t22O35/ZmU4zCPFQG5WPW8vab3LXL6/5Q0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=EYK5Xupo4gUKTrI6YWnxNXa258upnjKK+dg9Jeh+qr13gUO3TUUZFhaxsXMmNPSPg
 OPlLDMhVXuEplsCtMtAaN7WDcTk/7UhgDynC1bpGDa3Vee98QHeJwEwbSQPUaAT+Du
 PnW74XgHBsd77MgJfgmWNZQY6EJ5Z5vnfzCpYbH0/MozBZukEY7xz5B+/jIyp0R3Q2
 KC8wFVEkkTN5h/HeDgzVvsIh9SUMWbLjrE60TByq52JDuMtoUILsOOS6o9BEv5Swky
 yYn1HUWeE+4cYhAPEkylPLpVZBOr0YjKFBc7qklL5A/TmYGtEKo4GCEtEVfiWJzX5d
 h7RyFbFFV284A==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/3] drm: add define for Static_Metadata_Descriptor_ID
Message-ID: <20230428100115.9802-2-contact@emersion.fr>
In-Reply-To: <20230428100115.9802-1-contact@emersion.fr>
References: <20230428100115.9802-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This avoids hard-coding magic values in user-space, and makes our
documentation clearer.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 include/uapi/drm/drm_mode.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 997d23fb2d68..c0c40dc9e2f1 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -849,6 +849,16 @@ struct drm_color_lut {
 =09__u16 reserved;
 };
=20
+/**
+ * enum drm_hdr_metadata_type - HDR metadata descriptor ID.
+ */
+enum drm_hdr_metadata_type {
+=09/**
+=09 * @DRM_HDR_STATIC_METADATA_TYPE1: Static Metadata Type 1.
+=09 */
+=09DRM_HDR_STATIC_METADATA_TYPE1 =3D 0,
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
@@ -866,6 +876,7 @@ struct hdr_metadata_infoframe {
 =09__u8 eotf;
 =09/**
 =09 * @metadata_type: Static_Metadata_Descriptor_ID.
+=09 * This must be &DRM_HDR_STATIC_METADATA_TYPE1.
 =09 */
 =09__u8 metadata_type;
 =09/**
@@ -925,6 +936,7 @@ struct hdr_metadata_infoframe {
 struct hdr_output_metadata {
 =09/**
 =09 * @metadata_type: Static_Metadata_Descriptor_ID.
+=09 * This must be &DRM_HDR_STATIC_METADATA_TYPE1.
 =09 */
 =09__u32 metadata_type;
 =09/**
--=20
2.40.1


