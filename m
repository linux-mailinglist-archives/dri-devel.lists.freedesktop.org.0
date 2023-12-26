Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0981E6B4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 10:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7384410E04E;
	Tue, 26 Dec 2023 09:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 329 seconds by postgrey-1.36 at gabe;
 Tue, 26 Dec 2023 09:48:41 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF01210E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1703584120; x=1704188920; i=markus.elfring@web.de;
 bh=qxz2rsOrCokjtYz9AWLg6FevZKjSyqvDp8Ajz81lcQs=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:
 In-Reply-To;
 b=k5u9FA8QAFY/cVVcSZfY87ScHyCHQb0gMXRbIWlfo35YhY1w3mc8zsyCayL80kEU
 pGR8Rmp7VMaSyZiM6T3L0htiA9ANdiyLhooUlgsXOm+lN+9V6t54hTgMkw+n9tNzk
 Kon1nQAMHqgVLPGu06iKICFAy9EaIwxmKK6H4wjZg1EaZUD1YUhpYItEN48thPI6a
 E9PV0J0rUkZssH+qm8Ves/E9ig5Y+RjY56RiarvXPEmh/Ug9WSwlNy1thc614rqer
 8o5KZ5R4mV6rPF36Haq/l189SmGLK1MXydj2uf5uaOQ9czjkwGp99/CPZsHAvoxS+
 zxevmDNb8cniTtbUsQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MV2Ka-1rj3J42GTm-00SCDN; Tue, 26
 Dec 2023 10:42:44 +0100
Message-ID: <29dea8dc-5a57-4c07-a857-e2c6a86c5c06@web.de>
Date: Tue, 26 Dec 2023 10:42:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/3] drm: property: Improve four size determinations
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
X-Provags-ID: V03:K1:GtcwZYw63MR0A1EIcUKicxaHVuhNQ4NE2Q9F/CqwM34DRchuZXK
 wywcZKRJt5lRazac4orphzD6v1YnJl5Gx2no5F6WAVx45dhemxyyqsYntn2KZiH2GapZof/
 rz9FtnZZOwYoRSdqlAdEQnPyvIQkxlIr7n5EUsOyN2JY5bbKkRuliS02Cz2PrFDYJPaIGTj
 HrCoUKRthmVVmEulu76/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:az/XwOoWEUQ=;PHeV3bjcrRjz+UMRbl1zPibUqPH
 r0JTuGNN0TfYVORl346J3RA0insCWbpvcig458NaEIFFSTNb2GBVWEAwIJU0fR+K0eN3ZUazT
 SqMRxiOj2m9wFPEj0HBvi9vCJ+x4Iqqy/jFNJq4z+Xrgip2Huh2Ite0MRNe2/7YImLQ/r96F8
 qsTTrq2C2o3HgZ6HXnRQl7m+P+4yfUr7f5W095iy4+RcP6tXnaMk2w3+rJyK5EhzLIWQwFtZq
 qVaUDRB/BVuWRW1d9u4ymeMeGHxlTAUpOh5/ouLsDXkjkNGL20NAEbN9j2UmChgz3ceuvggM5
 wHdApXP/RBYTBtW87HacO4paA9qDUZIv1sEkdeNbtRJ2e+SL6rEpCNSuev1+xmyfvhvKxYyB4
 oqZaVeP8SdSIWPz8buYgoIMQ2pdRuvIho5de8arybvgGCXXTPuNGGfDXmutK8trQnfWgG7PMj
 dCMbC05b8+y4F/sji5g2ZKFhN+tEP3YAuTjhewqfCyBQ/RfEoL3Ks9QFw0vR56cG9iMPY+VNE
 vYmyrhe2YpXzH6Zp5nYLryETUco4VtTOarjrttt+uZOo+w/DYlKYD7D8iGPMOBx9WCh7pmDSU
 keB0uImHjtg3BrCqs7V3KbT99ynsat0h06I5Kd5rNJuVugHWXUlWShwBlNvlYpXpqnknEyk+2
 NydCATIGqkhkuTomZwHMlnLPyR+J/tlQRu5xCzG30L3jobXez2K4c2WPTOlQKApEKR9hTgaMr
 BoXK2a3R2td7UlUhfmThy6G4H6UdSCUf1VW+2E0tL2luDUUnGMCS3sCpt0jvtgygMHFBUBLFo
 7Y7xC8cz9jN1II3I1oScv2vRVba73VEv9yqlxVRcOVMPyAY1VpYU5I0qqkf/KRBikQBh2DvX4
 69mY3/oWGsz73xGf4wBbS+U7tsk38NhoBHrrDyB5jt/nVWi8jOmOZHFkERC4dFYoqOx62UHli
 33/xlw==
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
Date: Tue, 26 Dec 2023 09:45:36 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator =E2=80=9Csizeof=E2=80=9D to make the cor=
responding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/drm_property.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property=
.c
index ea365f00e890..1fe54cbf1c83 100644
=2D-- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -107,7 +107,7 @@ struct drm_property *drm_property_create(struct drm_de=
vice *dev,
 	if (WARN_ON(strlen(name) >=3D DRM_PROP_NAME_LEN))
 		return NULL;

-	property =3D kzalloc(sizeof(struct drm_property), GFP_KERNEL);
+	property =3D kzalloc(sizeof(*property), GFP_KERNEL);
 	if (!property)
 		return NULL;

@@ -418,7 +418,7 @@ int drm_property_add_enum(struct drm_property *propert=
y,
 	if (WARN_ON(index >=3D property->num_values))
 		return -EINVAL;

-	prop_enum =3D kzalloc(sizeof(struct drm_property_enum), GFP_KERNEL);
+	prop_enum =3D kzalloc(sizeof(*prop_enum), GFP_KERNEL);
 	if (!prop_enum)
 		return -ENOMEM;

@@ -560,10 +560,10 @@ drm_property_create_blob(struct drm_device *dev, siz=
e_t length,
 	struct drm_property_blob *blob;
 	int ret;

-	if (!length || length > INT_MAX - sizeof(struct drm_property_blob))
+	if (!length || length > INT_MAX - sizeof(*blob))
 		return ERR_PTR(-EINVAL);

-	blob =3D kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
+	blob =3D kvzalloc(sizeof(*blob) + length, GFP_KERNEL);
 	if (!blob)
 		return ERR_PTR(-ENOMEM);

=2D-
2.43.0

