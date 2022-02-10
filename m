Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38A54B11DF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 16:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9348710E891;
	Thu, 10 Feb 2022 15:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C586110E891
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 15:40:36 +0000 (UTC)
Date: Thu, 10 Feb 2022 15:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1644507633;
 bh=ECe2L9xWylm7q8RA9P0cKfPheXFnINjfWPDIgLNlj84=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID;
 b=SDKFNkc1XP0FclM8EeWusC1CSXDM9LIZUPeqZnXkJl9wBJKi7WX60MJs/33MV5lN8
 9w5Gr4H90LtAjfEC833PKFK6VJJCrai1VghmsaS8YI9Dhm0Ww3uGn+d8v0D/ugG+sJ
 JFHt+hG08vACo5C/bz1RfGe3KXcwHoolMCs4jzc2boo2WhLds75dSOKPgDPRPIQIQ8
 jIfpgNDZz+j2k1dTtmSp0CR8pUsWkHah9W3/aaSLyuXgxA4TlBeML71eOZfIRVnd9O
 P1F27o2t/7/nioFpc6UJvAy1+51GKQLEtGqmug0MW0WOp+HzY244IgpFllNrzUDec3
 jQmcRPf1oiKnQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/dp_mst: fix drm_dp_dpcd_read return value checks
Message-ID: <20220210154012.118472-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=3.4.4
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_dp_dpcd_read returns the number of bytes read. The previous code
would print garbage on DPCD error, and would exit with on error on
success.

Signed-off-by: Simon Ser <contact@emersion.fr>
Fixes: cb897542c6d2 ("drm/dp_mst: Fix W=3D1 warnings")
Cc: Lyude Paul <lyude@redhat.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/gpu/drm/dp/drm_dp_mst_topology.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/dp/drm_dp_mst_topology.c b/drivers/gpu/drm/dp/=
drm_dp_mst_topology.c
index 11300b53d24f..f5998b7cf602 100644
--- a/drivers/gpu/drm/dp/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
@@ -4912,21 +4912,21 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 =09=09int ret;
=20
 =09=09ret =3D drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, buf, DP_RECEIVER_CAP=
_SIZE);
-=09=09if (ret) {
+=09=09if (ret !=3D DP_RECEIVER_CAP_SIZE) {
 =09=09=09seq_printf(m, "dpcd read failed\n");
 =09=09=09goto out;
 =09=09}
 =09=09seq_printf(m, "dpcd: %*ph\n", DP_RECEIVER_CAP_SIZE, buf);
=20
 =09=09ret =3D drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
-=09=09if (ret) {
+=09=09if (ret !=3D 2) {
 =09=09=09seq_printf(m, "faux/mst read failed\n");
 =09=09=09goto out;
 =09=09}
 =09=09seq_printf(m, "faux/mst: %*ph\n", 2, buf);
=20
 =09=09ret =3D drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
-=09=09if (ret) {
+=09=09if (ret !=3D 1) {
 =09=09=09seq_printf(m, "mst ctrl read failed\n");
 =09=09=09goto out;
 =09=09}
@@ -4934,7 +4934,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
=20
 =09=09/* dump the standard OUI branch header */
 =09=09ret =3D drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI=
_HEADER_SIZE);
-=09=09if (ret) {
+=09=09if (ret !=3D DP_BRANCH_OUI_HEADER_SIZE) {
 =09=09=09seq_printf(m, "branch oui read failed\n");
 =09=09=09goto out;
 =09=09}

base-commit: ded74cafeea9311c1eaf6fccce963de2516145f7
--=20
2.35.1


