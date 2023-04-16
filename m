Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C38D36E36BC
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 11:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE64410E2F8;
	Sun, 16 Apr 2023 09:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9454010E2F6;
 Sun, 16 Apr 2023 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681638251; i=markus.elfring@web.de;
 bh=n41gQARwukkaDyUnJDCzmOZrW02lD6AxTHrmVuVuCEg=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=RJ80FrIqGvs6zBpUClKiNhle9Yu4n+NMVf3DqRPZJyvhldcuSg9t4rykBvsWSWx6I
 /T+GtC2utkKxFSaOJoxKERM1bWq/nybgmppzTbkcs+h8aQjHMuCbokHDFzlbe9qTP4
 keVVwzHud+EYV+Li5I7SXMiYTWYjCaf9d4c2EbhsttJ90BIpvl7x3qw259xTsSyKT3
 uO6iIgHMgDskXfHZ0b7F4ofFivQS0c7alcAT+d6GAyLrOQO0CwcPgUBLmR1JqMl6QF
 E58v59Ytd0xj3ztAVRuIc1zGtNPMaTNxdlr2Wg/yIUsoOD2/RbDGdQ+K289WtbAt2/
 Q4hgNoHpMyYkw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCGSU-1pefFp1ysc-009TBU; Sun, 16
 Apr 2023 11:44:11 +0200
Message-ID: <6435d829-2c9b-a3f7-c8cd-cf923508a092@web.de>
Date: Sun, 16 Apr 2023 11:44:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 6/9] drm/nouveau/clk: Move a variable assignment behind a null
 pointer check in nvkm_pstate_new()
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
X-Provags-ID: V03:K1:ODzhENw+XW+cNy69bxLsZXHfyG05+9RtBh+2vTyrh6Z+8DxqdGR
 8OAVcxt8+Utl3xdxvXvI3nY5PpyoGQTUGr06U+RSDttOnkz6tMsVf29j+mn5mwOImjmcVpo
 zWH6m+duQWzHeABBTzABLHiuwtpJty+AOIuX8o6RsJNSXbVaXyc5HmacSlKbDZH5g8SSEqw
 D8/R+9tdCjVHoMl8cqriA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fBJoNokfgZo=;9w9dNcYmRVyg5DJZRXvBx+samPs
 ztj0sTDy/hrsksoH9Xx+u5tZIeizXgpcXDG0id/w/nPQTXkMuJuh9GQW4+txG7p91qw4L6opG
 K6KTIbM7NSkQSO4eVOVSLT3WWv9P5Pf8wMt5vyeX6Gw4yuOQwrHrXwjkxmvYwR0DoT8op7tb9
 Hrv9WkRb5Wd5NTzuvfN6cUOLm+4xEJkGrjtfJvIV+wEOe/47FmycJCMH/A+gQIV19nu8ZH9Ui
 Cf3PS5Gu89ZxZT5wfD5GTJFGpsWvUtfeNKTULL8bz6jV8E7ZJElcZg4rzF+pZ2G0ToecCf54v
 7lOvEIz6Hl1CNCVmPFMRQe4rHzFGQmpd/oHg0n3QzXOtaa374qpVpFTkiqEmPZjN7S+tKOm/X
 8G5oDGYqzM0KP6QVPSDfqtliMmCRhWeNKNYNlgm49E5Y7wWoEsK7Z9DEIMpS3EbswQExFt98B
 t4Ir89kPLpzskp8AXXWroBF8V3SSuKgQOWulWsxMmC851QlW9J1NeoU11w1r8JW1inTbHNfwT
 SFZIUZjjbWg3xwQJRg22ruxDzy7q/yidUp+gUd/FmpCgZUv6IKvUTa2sFyoDCjah+7DsFe2Vn
 OtFGdFkTeTFV5huDhVXFdaqgZrXHjIq0qfuLOxQ8ZdWET8TQIWOFO+kQnX75Pc/TEtfcG3NCd
 ysVr61bHNUzdbJhTbiu9TRIYrty4sLs3jHp1BngcKUEn44qo4Sxtrq/LlwywJsmUUZfZtcmuL
 SwwNhZQ3Pn/xET1UeTNdQoIUOlWx7NODN4LxANwE/uLcmVTHf0ZBt77fP7j7I7kwLu1hYHVXX
 Mt9CPqNn59z20+mIusoc7SsPwOD9/X5AEFkb0vWED99suFm2Po8tvOF/hamU0rql9ZOOH6HNE
 UF2vfFFM3gXYmqfKDT0vbMm0V9bukwbRhbaBbygLQqR0BjBsnrFROsvV4
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

Date: Sun, 16 Apr 2023 07:45:54 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cnvkm_pstate_new=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Ccstate=E2=80=9D behind the null pointer check.

This issue was detected by using the Coccinelle software.

Fixes: 7c856522069755ab9d163a24ac332cd3cb35fe30 ("drm/nouveau/clk: impleme=
nt power state and engine clock control in core")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/clk/base.c
index da07a2fbef06..178dc56909c2 100644
=2D-- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -417,7 +417,6 @@ nvkm_pstate_new(struct nvkm_clk *clk, int idx)
 		return 0;

 	pstate =3D kzalloc(sizeof(*pstate), GFP_KERNEL);
-	cstate =3D &pstate->base;
 	if (!pstate)
 		return -ENOMEM;

@@ -427,6 +426,7 @@ nvkm_pstate_new(struct nvkm_clk *clk, int idx)
 	pstate->fanspeed =3D perfE.fanspeed;
 	pstate->pcie_speed =3D perfE.pcie_speed;
 	pstate->pcie_width =3D perfE.pcie_width;
+	cstate =3D &pstate->base;
 	cstate->voltage =3D perfE.voltage;
 	cstate->domain[nv_clk_src_core] =3D perfE.core;
 	cstate->domain[nv_clk_src_shader] =3D perfE.shader;
=2D-
2.40.0

