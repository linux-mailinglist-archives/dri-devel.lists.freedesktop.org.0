Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12134A4A082
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 18:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1EC10ED14;
	Fri, 28 Feb 2025 17:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="OI3GlODT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D02610ED14
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1740764030; x=1741368830; i=markus.elfring@web.de;
 bh=qFyTk6UI9vQkUT0Y0SbdN5aOZAMFszIFkYavvczvjdM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
 Subject:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OI3GlODT7nu2SWH5SZy83uUVQU8+5tFb7uB4py2fClEPknvKBpuS2PfOyDKWB0er
 BZKTUlQmtYwhjjAK6OFptGcTO9qO6kc1BAtsKWoL9AapFWvRN+UhcORdpUdULxPXd
 2veGeKFT5rRqljtUPCNBf9iIMLBGda+HmRgfFFEg4qcMy7XlnKOgy02GV3HYskvsf
 aIitWWKNug7hIcurV1ua/qbGqHVSGOPI3lu0dfT07t2rSnSaW44Ru+mCV7ieZO+cP
 SRCM+oLEvRQR0vLAz65GSRLRiA2VxUfLJMwhNGdmIkBmPPNg7MxmIvsaZ0doh5L1Y
 WUr7g7jKMALPJbk0Lg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.27]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKMA1-1tZz4D0ku7-00KqlH; Fri, 28
 Feb 2025 18:33:50 +0100
Message-ID: <8b046033-0f97-49e0-afdd-a3a3a3c23ec4@web.de>
Date: Fri, 28 Feb 2025 18:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Qasim Ijaz <qasdev00@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/sun4i: dsi: Simplify maximum determination in
 sun6i_dsi_setup_timings()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lA+yt6XQXGbHJA8i/dPHH3qngpTXFeGZNQWLvKtVckTh6A0dFKR
 VvIKo0ilo4K7DBjZeXE4QoS4qwWtxJPnmt0+dUesQA0s5PJMlJP6zleg1N54VKHLbJTKQha
 HiudkuSGSYTNxDpWe0Xla/n+IJxm8E7UcxoeMqX3F1547PEFeOQFUfV7ixoOQH0wJn1/NzA
 /JXSU0t61PkVg1S59unew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8JS2gQELrJA=;gJeX7bdK3jHXeCd39Zg45iaR7Gt
 N5Rje24aQ61qqxH+g1IjROCZuJF4VscVGomPjF61aogbFXUU28SeHsRqyv3FWDWeXvDUjNIni
 vt/ccojul41zlduG8GlSXJ2Q1339FKuIcQDAkNlRuzi7jSE5oOHfKCYs7gxxdW96wAGg3w1U+
 Ihx+okmz8+lNa5uvwVb2GB4KBeRWLgvDaCaJe1IzDvc5Dy+swyvwDnGHFpBqEP76xFNqQgSxK
 Dft1doLFmwj12LXzNU1sXa5Yn/5ToilbzQFiwVrJzIc3oh3RmXqCbZtiXf55rT+l0p48xGEDH
 0qTuiwNhMfDrFUQV1S2ohAScQY4Yy8cNBYaDUtvuVklWkzJsaTG09Ld0tsNSFpgUK2OEQMBSH
 dz8g4QMOEnS6jTiXYbF+gQFchy2N8V7OY/fpr1QJpdcQyp5oT1yido+VO2JEhuwTw06iofq6h
 OlO0nylfacgE/Xy/uWiGHXUXUuaEbCQcRerbpieWv1MeW+NFuvl53F7TCma+Qt7J+EDUVoQp5
 Oo+rNropgVEn2fI4Ls1vN3D4iif9JWl2Y093cnc4a/IfTyw8gG3p2KALcYz9ERYdB2vuA/Ex4
 n0EMqsc9kwgKl4X6uDoJOuUsdf3slrEsOgJordmfY2qZQT7/ky4UQ6OqU+EYSst/yCTDco1co
 jWMAr0+XnrF5MOb8jvYpC4Afe9IpdmqOboSISsM2M4Ru1j3nnj6kZa/UNJgKDT0kOfTfL3KfO
 QVopsnd8fGgUWI17zRBv9WxYhtoJ5SC15o392Xuzbk+oV+jyZKK+FJoBa8j+IzujDN1u1VmgL
 DNbBpWckDYzVJkr9TTV1QH/w1OrixRWlrOTEiUNZfnttY5auDCFgxQ/uglCYjagPdcgKZ2vu3
 9CxWBNeoWJCj9SKvVU+iNNoQTF1lbx/eRYffs3qrO7P0Y/B0pSSmaN5sFmO2tFLq/vd0r8EBq
 XC0XJ9JQdZuLSQTVopmNyawcf7Y7whf00c/xOrHUz6mbxyVJGjlVQ5Qo2kqOiKNuOA7OKWXep
 /Av8XdIYOcGfyYJTPY2BZTRbEmMG4Ub6Bcf1jH+07aDIJ9uGRc20rrp+/cORxBhA3/28uqAHn
 QfbvPnNyq4ezBG4Q5QS4MLmldlAp9xURS4jRM2b7DKxQF4KHYpLws9E12N/pw/+fPtFx1dNbz
 BXCXfwunD+qjGzvZdG2lDyDfbS4Ehc6kbB9+5q0TmwUG4NmqA25pgjOPbpnpu8VtD0f9rU+Y/
 utnMYnvnUiOoqXCh3gC8ubk9oss3wG44KDHs9srVBEvX9/+wH2wEg9lBohIK9oIb+t/a6Swgc
 NXEzr0jAQK9OeccjJJdNJDAJXaobhRC2x1EbbEHdyVAYvaHYbAzEQtqvH2hBI46hhkgco0jOo
 pa1YN+7WIVxF6xXR/sqIydC1VQ5UAq0XquTWahAAdM9S97zNUkzRM7LZtvvmk7fwY8/TruN/b
 /DP7220xsKFeKDIhAS3mbkTO0Io4=
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Feb 2025 18:25:31 +0100

Reduce nested max() calls by a single max3() call in this
function implementation.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4=
i/sun6i_mipi_dsi.c
index c35b70d83e53..7765a29e2ef6 100644
=2D-- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -597,7 +597,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *=
dsi,
 	}

 	/* How many bytes do we need to send all payloads? */
-	bytes =3D max_t(size_t, max(max(hfp, hblk), max(hsa, hbp)), vblk);
+	bytes =3D max_t(size_t, max3(hfp, hblk, max(hsa, hbp)), vblk);
 	buffer =3D kmalloc(bytes, GFP_KERNEL);
 	if (WARN_ON(!buffer))
 		return;
=2D-
2.48.1

