Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C1FCDC3F9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 13:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6BF10F0D8;
	Wed, 24 Dec 2025 12:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=veygax.dev header.i=@veygax.dev header.b="LUBjCdzy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2215 seconds by postgrey-1.36 at gabe;
 Wed, 24 Dec 2025 12:44:32 UTC
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD40010F0D8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veygax.dev;
 s=protonmail; t=1766580268; x=1766839468;
 bh=2sZ7EePl0Km8ZZ6VCZeQZ8B20phYvLCN3Eb1KFitrug=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=LUBjCdzy/7AB7CGwAJEeqzQTUY0jrR572BWG16BkbiQCm6CMJEnizBx4h3AaGE0U8
 UnDn5wl6J8/dj1hbaeF6iTK7AYUbu+1Z7lODurTfaEGGSAO5lJhYnTqqyl8M9GN45N
 EO2CRFjJWHJHBnP63lltOv8pOiZUSwBloCmVmAzjjGG2aafVXDj4eV4DsZVnC3jIjE
 4ljYkA/+Y31HwU6fFc6r+18XbdttHh1VsEX0SdpV9FUFKBGFnmdux1jcBuerEI74c0
 ncpBb6IK7Gf2Zz8+BsBlA05/bczTvvaz5XClGCN1WjSW0AYn8ZSEENXbdv7GeSmKtK
 5NXUMeVWlcDUg==
Date: Wed, 24 Dec 2025 12:44:22 +0000
To: Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
From: veygax <veyga@veygax.dev>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Evan Lambert <veyga@veygax.dev>
Subject: [PATCH v2] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <20251224124254.17920-3-veyga@veygax.dev>
Feedback-ID: 160365411:user:proton
X-Pm-Message-ID: fb9dac0185e4df4e70d9833718ea91cf66b2ae6a
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

From: Evan Lambert <veyga@veygax.dev>

The refill_buf function uses snprintf to append to a fixed-size buffer.
snprintf returns the length that would have been written, which can
exceed the remaining buffer size. If this happens, ptr advances beyond
the buffer and rem becomes negative. In the 2nd iteration, rem is
treated as a large unsigned integer, causing snprintf to write oob.

While this behavior is technically mitigated by num_perfcntrs being
locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
second source was added.

Signed-off-by: Evan Lambert <veyga@veygax.dev>
---
v2: Use real name in Signed-off-by as requested by Dmitry Baryshkov.

 drivers/gpu/drm/msm/msm_perf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_perf.c b/drivers/gpu/drm/msm/msm_perf.=
c
index d3c7889aaf26..c369d4acc378 100644
--- a/drivers/gpu/drm/msm/msm_perf.c
+++ b/drivers/gpu/drm/msm/msm_perf.c
@@ -65,13 +65,13 @@ static int refill_buf(struct msm_perf_state *perf)
=20
 =09if ((perf->cnt++ % 32) =3D=3D 0) {
 =09=09/* Header line: */
-=09=09n =3D snprintf(ptr, rem, "%%BUSY");
+=09=09n =3D scnprintf(ptr, rem, "%%BUSY");
 =09=09ptr +=3D n;
 =09=09rem -=3D n;
=20
 =09=09for (i =3D 0; i < gpu->num_perfcntrs; i++) {
 =09=09=09const struct msm_gpu_perfcntr *perfcntr =3D &gpu->perfcntrs[i];
-=09=09=09n =3D snprintf(ptr, rem, "\t%s", perfcntr->name);
+=09=09=09n =3D scnprintf(ptr, rem, "\t%s", perfcntr->name);
 =09=09=09ptr +=3D n;
 =09=09=09rem -=3D n;
 =09=09}
@@ -93,21 +93,21 @@ static int refill_buf(struct msm_perf_state *perf)
 =09=09=09return ret;
=20
 =09=09val =3D totaltime ? 1000 * activetime / totaltime : 0;
-=09=09n =3D snprintf(ptr, rem, "%3d.%d%%", val / 10, val % 10);
+=09=09n =3D scnprintf(ptr, rem, "%3d.%d%%", val / 10, val % 10);
 =09=09ptr +=3D n;
 =09=09rem -=3D n;
=20
 =09=09for (i =3D 0; i < ret; i++) {
 =09=09=09/* cycle counters (I think).. convert to MHz.. */
 =09=09=09val =3D cntrs[i] / 10000;
-=09=09=09n =3D snprintf(ptr, rem, "\t%5d.%02d",
+=09=09=09n =3D scnprintf(ptr, rem, "\t%5d.%02d",
 =09=09=09=09=09val / 100, val % 100);
 =09=09=09ptr +=3D n;
 =09=09=09rem -=3D n;
 =09=09}
 =09}
=20
-=09n =3D snprintf(ptr, rem, "\n");
+=09n =3D scnprintf(ptr, rem, "\n");
 =09ptr +=3D n;
 =09rem -=3D n;
=20
--=20
2.52.0


