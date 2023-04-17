Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE6E6E442D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 11:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7006B10E3C4;
	Mon, 17 Apr 2023 09:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A67910E3C4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681724555; i=markus.elfring@web.de;
 bh=papukXpkfH5NrH78344WO3NYJmDxW7O9m1PcTBn1l8U=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
 b=iaQRuzP3oOzL9CaoVxLT9sEXCWJYdMr1+3LXWxTAr/YevUf9IRMbu1vS6owU6x4BD
 C7QPupu/9p963Pv8iDdtlEuEKkMUw6b0M/h7uG+pd34XTPAZttun2dtfZX9e5b9OoT
 gLJEBPtT05mftEcj89tgjJAUvM+Z5+mxYueMU7aiSZtDj1LnQj/X921tIxHcrpV/lU
 IOIMy8xRQwxQZzYSmiAQZvAAXKKn0JGaH3wZxnJu0zUmosO6PRR1zj0BwHnwM+sqkN
 2wxUX4PQ1gfUJ4WKuyrK6i7DSJ06jNOxIAAi6WZo5YtQZ14YzVNTxBOIMpyKOZql+1
 9bYFD5SAYEAzQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mpl4x-1q6vYc3Dht-00pvuP; Mon, 17
 Apr 2023 11:42:35 +0200
Message-ID: <a3329002-827e-d53b-8a4e-860342eb18f7@web.de>
Date: Mon, 17 Apr 2023 11:42:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH] drm/mm: Adjust input parameter validation in
 DECLARE_NEXT_HOLE_ADDR()
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Nirmoy Das <nirmoy.das@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Language: en-GB
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TN7MusRvPHw9VBZ13Xgs4HaSKZHFUWaB6iWcScXNZ5mfLZNCcRK
 ConS+4earWeICQ1PNE68VhgSXcLs7UldfQIEdqgehcAVO2UHByCMx1Y1YM8EmI3HG1rSwuR
 puMdzOL5w+R7H3GnNjlIENWs8qUeIwkuZzDUTtVFby/DDM6VCzHI+k6TJB3Ir1YF3xgMUaZ
 DCtMoXoZudNH7vhnUn7tQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Eq7RtK1ZuRE=;PF9gO8OjV0vcZQawx1RtfCbT3Nn
 cJVL+UWmJubfNMfNGaDm2VADj6DBWTFblbJU1zPlUfUQIyjVw3KMvPdbuvD407GAy59m6JRzs
 qYQ8sy3EUKgSY020JQeJUqG/cGJMVVWmHW8iZ3zYOJlU1RZdZkgwvQIgeCWAy+wWsmxUnBWzo
 RgfnNetJDVW3SjUR0XAHyoSNe4OJyP/ZyOmsqrNcOyGLDzHrTWaG2m7uh1l6v0KpreGkRMYzu
 omia0Skp4nLoP3OWRbOqFvfUct8ZyaIgtXmQuTwxliPmyJJD5dX06d9vHNbI9/790H2zYCKzt
 MtX4Lhg1ZF9DNRYXqeQxy1yq9qF9aTeVSVpH3GUH+2zSkFLcryBLq5kVNXmQeRmHAaHHlameh
 idiwVhvi+n4NDb8KobTZPZoH7hiw1mGOSS9lL97AV1n6z1WMK6NHs7NDrnwXn33GjKUqXiDl/
 rh0xg6aFVREeHNDF9K8S8gIkVC3X8x5PPAO7NfgdfZQuDdzXhHOn6ls1u+nJFIvTYPKb67GmN
 GLmJHgN8Mw/kVxRUUIz1sppmz8R0PjtmfIyQdOiN7P1++/Vk7PZaL+k8ZvbOSYUH0pigkTjcC
 poZTh+ti7/EpgMPzs6Wgft9n3O7K+GjAq2ph6YGUTnovGSTWf+Hw97ZpIIGzbyWbJfePFNGjN
 1sodoI+xO/WNgmei6mtuor2ShZc3h93dFrH4tJvY+GMS7kxmGNHEVQIEEHIcM3y+xzGwk48gK
 e9Ov+gb8se9JG/bfyQWJUR0s+nqXFVD8+kw/82weTOh41vaBoDELHYb6F7Ybh78XZjMfHAAzd
 p6+Jq+eAlKwQTpX9ZwYSQ29YYIGroZbvjbPn8qOmzrofAgdg3mT3bN7WjThWVkXDVYhK54gBd
 D7cNOSGSovRygA/txvux9hvIwMlYywhapPObqaZccM+FXPEC3KPx5UVtg
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Date: Mon, 17 Apr 2023 11:26:34 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the macro =E2=80=9CDECLARE_NEXT_HOLE_ADDR=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Cnode=E2=80=9D behind the null pointer check.

This issue was detected by using the Coccinelle software.

Fixes: 5fad79fd66ff90b8c0a95319dad0b099008f8347 ("drm/mm: cleanup and impr=
ove next_hole_*_addr()")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/drm_mm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 8257f9d4f619..95c316aa36e5 100644
=2D-- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -389,9 +389,13 @@ first_hole(struct drm_mm *mm,
 #define DECLARE_NEXT_HOLE_ADDR(name, first, last)			\
 static struct drm_mm_node *name(struct drm_mm_node *entry, u64 size)	\
 {									\
-	struct rb_node *parent, *node =3D &entry->rb_hole_addr;		\
+	struct rb_node *parent, *node;					\
 									\
-	if (!entry || RB_EMPTY_NODE(node))				\
+	if (!entry)							\
+		return NULL;						\
+									\
+	node =3D &entry->rb_hole_addr;					\
+	if (RB_EMPTY_NODE(node))					\
 		return NULL;						\
 									\
 	if (usable_hole_addr(node->first, size)) {			\
=2D-
2.40.0

