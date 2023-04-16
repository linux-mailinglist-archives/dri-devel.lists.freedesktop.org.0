Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7256E36A4
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 11:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5224E10E0F8;
	Sun, 16 Apr 2023 09:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5210210E0F8
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681637778; i=markus.elfring@web.de;
 bh=VbiCcvFD+Qi96Uu3AYsuuKIDaQ41gEUacwhrpgjbDtQ=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=bvRVPl4Ia3xvqrEI3P3GXwhY8OMAq1uk4d3kGw3Z/UgPtnsxa3zXyzBzyAmg9Xyh7
 bb7AVKFDsABp9fevq51mXfAvo/WFHxs3LHvcLyBt8rKj21TeE8G1/eMhKkDiiMO7Kw
 z5f1u08cCNZ/NvrJDrj36fRTHUu2kpRv5CFAbWNd+msb/nlpD2jTyg7rX6Cnsd9CBL
 pd5MKh//ksGqNZdNry9t9gJobWkjNs874uEwMy5raDdwiHhMQyDMz9UX2nHMr/htcV
 woQvJAbmFexADhQOV+EM0uf2411KwDBi3mcCNRKW4oEQYA17YZkDT+C4FZhlmTZcpo
 OtqUsluEc8eVA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MA4fW-1pcTYe2hli-00C1jS; Sun, 16
 Apr 2023 11:36:18 +0200
Message-ID: <5b7b99f7-1692-74e5-4b1e-cfa14dad7c57@web.de>
Date: Sun, 16 Apr 2023 11:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 2/9] drm/nouveau/debugfs: Move a variable assignment behind a
 null pointer check in nouveau_debugfs_pstate_get()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
In-Reply-To: <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AJ9D9+EKDgZDPgbcMafxaHj4mOgWlvC+BvY25gB1NZGB6gNVx+O
 xhlki1nbLNhebMQqVZC12o1VYHnC/hTtQPF1DAizUyk2o7v3fn2fPTUi/m+RNs0cM8+MNFf
 ohoDmlpNTR62CxT6BFNOCtonYB30A9B+2zGYwJaAbi6U2WStWeJhow8NUeolN5fEtVgp6P3
 RRdDPeBeF+6FzYAzg1i2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QjjVPRb86F8=;fu40QwhhZ7krKM5qzzhEljFcUJK
 XerCFtOp0fprmtouuw68y0HUJO9Jegsz2JrA4BHlR5GU756/y/E6zWAC9H29uMm7FtP5fKoZI
 7pKW0IHcJCXhiBPdhiEH2ajrSpKrl9WBotycGDRW3S8zXOQ1uINwnJeagFf+mXX0OfujxBfzv
 qb6whXfUiLq4l7Nbr1IwQAd0mdeXZvScB1xim1dbi/eLaa6GSvqksHXxZ5KQYB8wF3Kl+rUQW
 J8l++5TQpRpwkkyW6Bfx5AvV53P9H364AmzfRvY/6OgkPfyeSiv8R5TEE3u2LPeCOO7aabTHf
 zUk9adxyNn1RZKg3qOv7MwiRnullLjK3wlPoQfGKjpzYbXp1AnX7EsyLrt7I9YJUHoNOG02XG
 w8q40jBhVw0iiYDJDNDvxLbBiTtYj6buaHy+ueOVV6CO7qQ5UxCmNq4kS1epywh6q0rDeHMf2
 uzGY1Ru8eIwdcNc+0fvyv2n63+KPgSy/1fO5kXFndfZWWdkH0IKZ3fQnYRxf4PvZH8VKtozfw
 L71nAqtuTWY8vd75ZrEgo7Iz6O1IDOz15aBqRvGe6nSkdhFeOkzg4+a6P4Aa2Qp6jEjDW5f+L
 //xfF1lQnP1otd9jFZE3dA5jCGRu6gVS9bXnftKSrYJ+sO/HXcvRugBVTqJM5Xp3XRR+pw81N
 ateYnAQHL9R2JpRVlq+tRqA2HdqiYOi8FaEUedqFagm6Y5gEdyfYIE3cf+ZZiv/6ASfegVRnh
 ZP21M/lIkKA1lp75LnXDgb//doYV6cbI8B5OME5YezLQnM2gVK5lS+ekurWURA4yfeoot1Bqg
 UFoxXK1RNMljJ6aBuqD14SXtO84OKNsst3VrARHG0dif0qc3yE5R0qO4imYi1vZLyi7V22665
 +wCVUfGaBt7nL9y7yLmurSZTrjOReeG7OgPz2BPe5+hrXKppTHOZdQape
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

Date: Sat, 15 Apr 2023 21:24:43 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cnouveau_debugfs_pstate_get=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Cctrl=E2=80=9D behind the null pointer check.

This issue was detected by using the Coccinelle software.

Fixes: 6e9fc177399f08446293fec7607913fdbc95e191 ("drm/nouveau/debugfs: add=
 copy of sysfs pstate interface ported to debugfs")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/n=
ouveau/nouveau_debugfs.c
index 44e26b6e74c7..a859a086f308 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -73,13 +73,14 @@ nouveau_debugfs_pstate_get(struct seq_file *m, void *d=
ata)
 {
 	struct drm_device *drm =3D m->private;
 	struct nouveau_debugfs *debugfs =3D nouveau_debugfs(drm);
-	struct nvif_object *ctrl =3D &debugfs->ctrl;
+	struct nvif_object *ctrl;
 	struct nvif_control_pstate_info_v0 info =3D {};
 	int ret, i;

 	if (!debugfs)
 		return -ENODEV;

+	ctrl =3D &debugfs->ctrl;
 	ret =3D nvif_mthd(ctrl, NVIF_CONTROL_PSTATE_INFO, &info, sizeof(info));
 	if (ret)
 		return ret;
=2D-
2.40.0

