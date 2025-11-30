Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493B6C95630
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 00:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC0510E292;
	Sun, 30 Nov 2025 23:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=veygax.dev header.i=@veygax.dev header.b="b3vQdMF/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6BD10E23B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 01:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veygax.dev;
 s=protonmail; t=1764466141; x=1764725341;
 bh=ozUsX/bT64HY1yGl9o4Rpp0gGQHX5PlMeVLIyIxsBkU=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=b3vQdMF/u924WT4HLmCIb7P6XrxvgsnJdHtRNfzfkTHI32Tsb39jENadWnJVPoLu7
 LLTLbQ3TAPXAi+LOcyegMSLC1v8hM+Vw/3L1NvUPe1ZrfF1nIEtZ/i6f4EYpg8vDYR
 1F0p1up2drNRAY0gIBgK7AvhGr4DB68KcL8S+mXXUzeB0ghUndEgb4sKhoFpO5/PBW
 oCUsBjErYBhWun7dXsCvUo8awmOs5vMGbfgbDgGrFgg4gAXdx1HqlP0hkgrFZqnMxx
 ArsJEuximdYjc5f6OatEE8BCi0QD8esPmffmq1BB6jUfcICcKqD5qtlWfdAMoTqDp+
 C8c778nWV/vkw==
Date: Sun, 30 Nov 2025 01:28:54 +0000
To: robin.clark@oss.qualcomm.com, lumag@kernel.org
From: veygax <veyga@veygax.dev>
Cc: abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 veygax <veyga@veygax.dev>
Subject: [PATCH] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <20251130012834.142585-2-veyga@veygax.dev>
Feedback-ID: 160365411:user:proton
X-Pm-Message-ID: e0373c99e967915a910429b8886ef243b72b1be0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 30 Nov 2025 23:28:49 +0000
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

The refill_buf function uses snprintf to append to a fixed-size buffer.
snprintf returns the length that would have been written, which can
exceed the remaining buffer size. If this happens, ptr advances beyond
the buffer and rem becomes negative. In the 2nd iteration, rem is
treated as a large unsigned integer, causing snprintf to write oob.

While this behavior is technically mitigated by num_perfcntrs being
locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
second source was added.

Signed-off-by: veygax <veyga@veygax.dev>
---
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


