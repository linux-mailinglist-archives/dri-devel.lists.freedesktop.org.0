Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2EA81E6B6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 10:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E21710E056;
	Tue, 26 Dec 2023 09:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406D910E056
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 09:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1703584310; x=1704189110; i=markus.elfring@web.de;
 bh=qqBCvkgxbSr3g6FTVllb7hWAQXmgVICHt5PVFl7CIWM=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:
 In-Reply-To;
 b=Rv6hN/iyeLdFHniWZUs7+vkaqcq/vai6u22H9xyDKL6f8z39Z4R1SXmMFkW1KrI/
 y341pMbSaACxL4aNj+BBarrQAe8uv4N8bdeauOTI5FrWPtgh8K5EGO9AR+fOgSUXS
 /kyq7/1jC6J1MLP4VZgOwahAl3XyYxPpKgIKYcW3dbBcgrL5VUTKFEb9Mghsf7+Ky
 iTGH/squ4nZrjdv6z9qp82iVsCBOlrplUTW+GqwrcGaTe/wT8aJZPawINhtt1bmx+
 zRQm2HbUBDrdgUwXCxQmYDE36h1GIA/+oUUJeUy/RkBAv7UR9/xtX8jwwru5COuso
 aywzcU2+c599DVuUng==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MC0LH-1rQ3aP0NaP-00CKaS; Tue, 26
 Dec 2023 10:38:24 +0100
Message-ID: <9b1e7330-f4f6-47f8-a568-eaea1624bb6f@web.de>
Date: Tue, 26 Dec 2023 10:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/3] drm: property: One function call less in
 drm_property_create() after error detection
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <ff7ce5d0-59fa-470c-8dd6-68dbe65c18e5@web.de>
In-Reply-To: <ff7ce5d0-59fa-470c-8dd6-68dbe65c18e5@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iDixZmNvylQDuMt0skzUFKjo8Mh89iiU1EhN0o+/2elM/jOlggR
 6muOk7JjgmGLlXj3ITzr5rhHM9PHeCLjkWxFXiVhflFrt6iRboOIWS7Dl5KJDHi1vkOUj71
 pvU/i0C+PKKkNZ+eU5BzCX/eLI33iBrs+IvDwscaU8Vvv/c0iWdWouXu1c0vmuzAwXne416
 rBGEr9tTaR33LkfrfkioA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Wmc5gWNHOhs=;qoeq99pJR2dILbNukPSk2js/p2M
 QeB83kd7QzWSYCzDMxYKVUrO4jhcYwxMvfsv6b0lFYVMNxgzE7P917+swKfZa8WFbyLAK86C3
 M+Ci0Z+8zpEai5EcGEYxfu3+39/aRGnZdXbZBzQmTqDnrC5hiSqwnvKdYVlDheCyLdGR1D4qN
 41eRG0y23/hxpQJpR2fPVHhUl1gW3Y0CvJWwuiXdvb8vDwiyrvZTI/OtENhe1XRpAOKpoFhEI
 qJcqx2xnICNFKIEzptdIiSqh5oT53S1jjeRXLxCcO9DkVZfZeFX4K10rR3hKUdSWy7ae0Zmo7
 Dl9yMGaVHga6f7vZFSGqc8s3lr52flqES9bSiR80MXrBGv4WMcmfMeTpwaDDz6XD3nOmeRPuP
 A2NpK8YmgV40aDZdegdFsEccLOlO57b7UqARWDW2s9KzQkNyQn7KQlZTa8HLR9mrUw0e77rwE
 QUHoy7thqJ8jHVdl5A+vWkG6TUTurqq9bMSykpL3eG+8tlfRAKAnFcF5NrrmbPgOsfqInMJaq
 ufeH/U6zSVzqF6kGYKGC/UDpvmZNnzoAJ4/s49jMxCRfv3Nb6pSkOP9zlU7YP+SAUzYTfaNXK
 u2bVzFy8kgHQcJmlOX0KbQr53yhZos3+grwryZIqHCZV0TU0vXyEzjjQQvNMn7StdT6Hp3TJS
 AeUkPQc/OmBogK/w2OPcn/oQZux24BtvR/bZTyLFRfv7lLQ15Lc37RLyk1jB2V00539L0l7aL
 psV3pXSsxHuVfHscOt5eUD2RIn41BA2to6m6eHthKeZxc5M9h6vslCUvShvnICQJAJBPCx9yC
 qSo/Zx+1G7KsVIzXoYpUkfU7m+wRhgaZeVsBsAhXBHP43lRvY+08hzFZwlxFHHkASa5cpwd/b
 3NbCPQVFyll+mrS9lzPdIocRMwbSGgN9SbKVx1U/WaG1Yjtk2AGKPZl/zGyJQzpHwzTViUMnL
 13fDqA==
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Dec 2023 08:44:37 +0100

The kfree() function was called in one case by the
drm_property_create() function during error handling
even if the passed data structure member contained a null pointer.
This issue was detected by using the Coccinelle software.

Thus use another label.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/drm_property.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property=
.c
index 596272149a35..3440f4560e6e 100644
=2D-- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -117,7 +117,7 @@ struct drm_property *drm_property_create(struct drm_de=
vice *dev,
 		property->values =3D kcalloc(num_values, sizeof(uint64_t),
 					   GFP_KERNEL);
 		if (!property->values)
-			goto fail;
+			goto free_property;
 	}

 	ret =3D drm_mode_object_add(dev, &property->base, DRM_MODE_OBJECT_PROPER=
TY);
@@ -135,6 +135,7 @@ struct drm_property *drm_property_create(struct drm_de=
vice *dev,
 	return property;
 fail:
 	kfree(property->values);
+free_property:
 	kfree(property);
 	return NULL;
 }
=2D-
2.43.0

