Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54AD6E39F7
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 17:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FB310E262;
	Sun, 16 Apr 2023 15:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC40410E262
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681660034; i=markus.elfring@web.de;
 bh=5Z9cALek5Gs82hSIltPE1ilZYcDKTbzXs/wu0sOROGE=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
 b=e9Dfr1fdNFGehRZtBg7quw2w6GhAYMvFzOneypDJVPwSM4LMz9d8hhQx946/V0F39
 CIXvpghm/IzBK5/4pZ7A3wn0p6oNQV7e5Ry45ONh3QaQT9VLRsb6lio2c0mxQ/o7Bi
 Cyed94n+Ncpa2OOPB9a+UsdFl6+5wCkqWG3tkz6DGjBjczuhPqn9/VBZ+NY4ncsVUB
 /KepabJy7HGl5nSBPHgF2HxYB564qLmU2PXZbpZL5Eb/gCcTj0+N/meUee0FZ9ysQ9
 Q1uTOIPATf3zofcgenlPWu4fbRUPuH8SgnXTS1qKReN4DQOsQjhR1hZXmoVwlI2AiA
 QfdTD3kuztUtw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MaHWx-1prjvD2hBl-00VwXW; Sun, 16
 Apr 2023 17:47:14 +0200
Message-ID: <14636275-4d26-d639-5f6e-293fc6d1c4c6@web.de>
Date: Sun, 16 Apr 2023 17:47:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH] drm/bridge: it6505: Move a variable assignment behind a null
 pointer check in receive_timing_debugfs_show()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Allen Chen <allen.chen@ite.com.tw>, Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Hermes Wu <hermes.wu@ite.com.tw>, Hsin-yi Wang <hsinyi@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FjZbKKdiIEkoylWiH6qqBLFMBXZpoFS+8+LEERFSWqYFyaQY270
 G6zj166vxXibPIXDcjdrUo50KBBs6Gyzhrmliyl2MQuXv17jTz7ErGoCrGl0GuyeRq+nrSb
 ArzXFLpYq2MxYxeMzOkm8bCIx4M16CBRJZPS0K49jRY+xrkImhBrLBj05Xbvo3wZLxrjg7b
 VCAz54ELXkW9Yp5uoqjvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5Ncvf+t3ZD0=;BF3aGfad5gSuVft8UJbpRBFPpjY
 xBm2kpeWas/PlUmZpOutGcn9ATpkhV39iKUORhMegvAckbEhNZqKlPBIFYMO8hJB1NijPqBUM
 oDnChf8rF+J0zmW8kwOtciC4R2WjcNk+JRCHF/ZZ+IPEYDA3mobwmh6EnnTKK8+WM6ulUw62+
 DYmj+elo1XxcAHrCeUjFf0EpfC2ohJVsIhHEtdldXyihl4+srfjoLdGSJEi5VtX7X0eKQVVTy
 cf8/IGWe1uwV1WU2syvINI5gjYWbhrIIL9hJ4vlzeMl94I+SA6k9Hh5BqO5CGSxrqrey8WF6d
 PpS5vhJy02lNbvbRAro/p2LeBLe39RTRaATtbabRM9u9O5QGFxbwXdt5JY9yPdgf3J5T3NC1t
 2Rqc42IodIIyEvtJ1SRYMRQmR6czeNhzIbi4v+4w/IgEsRHURkl2p8qCHOIY7b+s8jsCQ2gbX
 78hCtekG6NAiGAdrAJ1XLSjj5XjJdYlG8cPokNe8/ulpHJ6t26OBQ8OzRghOe8QUolvtusyYK
 92EKes1/ddmm/DO9R3rRfjthbVNO6AXoH38cKqMideGgzHXfwCbHo0NQyi6BScN0ZUdaXHYFw
 1r5TfIFtgLliSbUowWcVBbO5QWhTUAVLIyo7D4PEWHPKEjQNi/4lhiDbwL1XU6IoYQKEOgye3
 MhXa4WtSzuZqagxw9k62pUJyKW8CC3t9XYDEXWjQLOHUiqlp3fgIW2/ABAngvnPqzZGs3SWKv
 rveYhT6fhnh3YCIh6ei47paX4NEZ8XSnL6nYpM1MMP/WX5CsLxK7K8Lwktyq9OHJi5rTkPcbf
 0kmtQFd3s1N0UcPimD6a8pZUh30BcqqiUr2k42sbvkO31RrfZyAa13N3RtIR4I/r74sClMCv+
 y2P8uD27Phid2vhrs17V4nrZpz9PX9NT7KaI0HVNwQ9yu+1c3sxV5cw1b
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

Date: Sun, 16 Apr 2023 17:30:46 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Creceive_timing_debugfs_show=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Cvid=E2=80=9D behind the null pointer check.

This issue was detected by using the Coccinelle software.

Fixes: b5c84a9edcd418cd055becad6a22439e7c5e3bf8 ("drm/bridge: add it6505 d=
river")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/=
ite-it6505.c
index abaf6e23775e..45f579c365e7 100644
=2D-- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3207,7 +3207,7 @@ static ssize_t receive_timing_debugfs_show(struct fi=
le *file, char __user *buf,
 					   size_t len, loff_t *ppos)
 {
 	struct it6505 *it6505 =3D file->private_data;
-	struct drm_display_mode *vid =3D &it6505->video_info;
+	struct drm_display_mode *vid;
 	u8 read_buf[READ_BUFFER_SIZE];
 	u8 *str =3D read_buf, *end =3D read_buf + READ_BUFFER_SIZE;
 	ssize_t ret, count;
@@ -3216,6 +3216,7 @@ static ssize_t receive_timing_debugfs_show(struct fi=
le *file, char __user *buf,
 		return -ENODEV;

 	it6505_calc_video_info(it6505);
+	vid =3D &it6505->video_info;
 	str +=3D scnprintf(str, end - str, "---video timing---\n");
 	str +=3D scnprintf(str, end - str, "PCLK:%d.%03dMHz\n",
 			 vid->clock / 1000, vid->clock % 1000);
=2D-
2.40.0

