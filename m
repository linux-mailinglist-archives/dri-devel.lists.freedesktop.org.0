Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HI0CI0SiWmT2AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 23:47:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B8F10A848
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 23:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C262C10E156;
	Sun,  8 Feb 2026 22:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="PPSn2lqu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B28E10E156
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 22:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1770590850; x=1770850050;
 bh=wqvSifJA2g9ZlCjzGK9GoqDXNk7dXi6L6lzV8lv3j5E=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=PPSn2lquBawtgrTTguSQLV6uCJswvmMB0aXtyr9+h/5nwGzB4RbRjunaR6vAfkFJm
 cMPCtWCIINycrHnqjA7/lHdMfVsJVjA8BWi5xwFFsCXc0zUTHddO5+TXOth8RKyuMd
 P/UYcVekhOiIFdCjkKNGQ/C9Kw9p5JXYkOvWvlqcxoG6VCmdR5GBFM4asg9pM4Kt0e
 +g1s51E3J1eWlwIQZ1Lz1Ukzx+nE6XdkUYT9qcsci57jujtPpTqwtwS4fnQ9I2g30b
 Vej3erjQRiH6OT69rCqJVW8Qo/X9OaH7u472SgK6lAmHma7ZC2Idkp2EBwOM3Nlkf+
 pS/+JikrtW9Zw==
Date: Sun, 08 Feb 2026 22:47:26 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Daniel Stone <daniels@collabora.com>,
 Robert Mader <robert.mader@collabora.com>
Subject: [PATCH] drm/fourcc: fix plane order for 10/12/16-bit YCbCr formats
Message-ID: <20260208224718.57199-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 7b4eb14ffe53b6e5afaa00110fe15a5c93604847
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[emersion.fr,none];
	R_DKIM_ALLOW(-0.20)[emersion.fr:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[emersion.fr:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[contact@emersion.fr,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 65B8F10A848
X-Rspamd-Action: no action

The short comments had the correct order, but the long comments
had the planes reversed.

Fixes: 2271e0a20ef7 ("drm: drm_fourcc: add 10/12/16bit software decoder YCb=
Cr formats")
Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Cc: Robert Mader <robert.mader@collabora.com>
---
 include/uapi/drm/drm_fourcc.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index ea91aa8afde9..2be461c764f4 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -401,8 +401,8 @@ extern "C" {
  * implementation can multiply the values by 2^6=3D64. For that reason the=
 padding
  * must only contain zeros.
  * index 0 =3D Y plane, [15:0] z:Y [6:10] little endian
- * index 1 =3D Cr plane, [15:0] z:Cr [6:10] little endian
- * index 2 =3D Cb plane, [15:0] z:Cb [6:10] little endian
+ * index 1 =3D Cb plane, [15:0] z:Cb [6:10] little endian
+ * index 2 =3D Cr plane, [15:0] z:Cr [6:10] little endian
  */
 #define DRM_FORMAT_S010=09fourcc_code('S', '0', '1', '0') /* 2x2 subsample=
d Cb (1) and Cr (2) planes 10 bits per channel */
 #define DRM_FORMAT_S210=09fourcc_code('S', '2', '1', '0') /* 2x1 subsample=
d Cb (1) and Cr (2) planes 10 bits per channel */
@@ -414,8 +414,8 @@ extern "C" {
  * implementation can multiply the values by 2^4=3D16. For that reason the=
 padding
  * must only contain zeros.
  * index 0 =3D Y plane, [15:0] z:Y [4:12] little endian
- * index 1 =3D Cr plane, [15:0] z:Cr [4:12] little endian
- * index 2 =3D Cb plane, [15:0] z:Cb [4:12] little endian
+ * index 1 =3D Cb plane, [15:0] z:Cb [4:12] little endian
+ * index 2 =3D Cr plane, [15:0] z:Cr [4:12] little endian
  */
 #define DRM_FORMAT_S012=09fourcc_code('S', '0', '1', '2') /* 2x2 subsample=
d Cb (1) and Cr (2) planes 12 bits per channel */
 #define DRM_FORMAT_S212=09fourcc_code('S', '2', '1', '2') /* 2x1 subsample=
d Cb (1) and Cr (2) planes 12 bits per channel */
@@ -424,8 +424,8 @@ extern "C" {
 /*
  * 3 plane YCbCr
  * index 0 =3D Y plane, [15:0] Y little endian
- * index 1 =3D Cr plane, [15:0] Cr little endian
- * index 2 =3D Cb plane, [15:0] Cb little endian
+ * index 1 =3D Cb plane, [15:0] Cb little endian
+ * index 2 =3D Cr plane, [15:0] Cr little endian
  */
 #define DRM_FORMAT_S016=09fourcc_code('S', '0', '1', '6') /* 2x2 subsample=
d Cb (1) and Cr (2) planes 16 bits per channel */
 #define DRM_FORMAT_S216=09fourcc_code('S', '2', '1', '6') /* 2x1 subsample=
d Cb (1) and Cr (2) planes 16 bits per channel */
--=20
2.53.0


