Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAA23A1EF2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EC96EA9B;
	Wed,  9 Jun 2021 21:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADA66EA9B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:24:22 +0000 (UTC)
Date: Wed, 09 Jun 2021 21:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623273861;
 bh=HOJnTStK1H9lEzyOT9wp33tz33iSfinHkHc1uA7cHQA=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=eIHkNV2RswfouuTGnfK6xEBmk7KaBbLlKGHYmpg9cfPGWvDGItXEchqsKM1d6DXM1
 4cnjx8ymKKRfCRkuOEoXs0fWnW3YaJeQ42XyqaWLLEJlgC5ZPIhcGv3RwsOEI1uAr0
 h687RKsGU1rDwGsCRUeXGfgzMPtlKfEoErHOV2R3xFVTQKeaBZF16mIrtvnI1Xs5Vu
 TK5zQjAkWZ3w3Vs9DbO6XNp1flytul1c0WUm2G+IrLYGNQ8+YQVJgU5moUJnnFcvm+
 LKxsZ0zzeWdxWwq/xlJ7bcgTEbyS1Qi4lzIUZj63HMhDmbC9ctpVY+FmGULv2Q470K
 oDj9UlfpAz7Ww==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 7/7] drm/connector: add ref to drm_connector_get in iter
 docs
Message-ID: <KRoUI7OC9lRIvk3YzdGm6tcMVAVlG1fR78Ll7kTZZT4@cp3-web-051.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: pekka.paalanen@collabora.com, michel@daenzer.net, alexander.deucher@amd.com,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mention that connectors need to be referenced manually if they are
to be accessed after the iteration has progressed or ended.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 include/drm/drm_connector.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 714d1a01c065..c1af1e4ca560 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1735,6 +1735,11 @@ void drm_mode_put_tile_group(struct drm_device *dev,
  * drm_connector_list_iter_begin(), drm_connector_list_iter_end() and
  * drm_connector_list_iter_next() respectively the convenience macro
  * drm_for_each_connector_iter().
+ *
+ * Note that the return value of drm_connector_list_iter_next() is only va=
lid
+ * up to the next drm_connector_list_iter_next() or
+ * drm_connector_list_iter_end() call. If you want to use the connector la=
ter,
+ * then you need to grab your own reference first using drm_connector_get(=
).
  */
 struct drm_connector_list_iter {
 /* private: */
--=20
2.31.1


