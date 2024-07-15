Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9464E93130D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 13:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9A110E291;
	Mon, 15 Jul 2024 11:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="DMhp4Ldi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5293010E267
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 11:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1721042785; x=1721647585; i=markus.elfring@web.de;
 bh=e6D3UXu8XYGKga578156aed+uo3RT052v5jgKYnVAaY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
 Subject:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DMhp4LdiR7EKVsuEDI1bcGpjuOCZezcTSyJ2BSLwYiqVchCZbGzCyJNLaWzVVHfp
 erFxT0TontOSgtLGChyW4pIp04uW8Vqhp10IizfFVjfvk6zDJd4PlyIY1KrJl5YWc
 7VvKj+S27jT9Rs/xcSZh7eWLrrdLjMYT1q0S5GfRgqC7q+47Pc/+QiwkYuxs7ry8d
 Vlq2L5ZFxwdwEh54S7WcJ8l+Qxn11WdBWqxxbtKq5/uF3FH3j51glKVydFOW6bVdu
 5ighsJLHIxKbU5WUJmohlVdWiWiUlo977Qq+JVo/NjYSXIoep997EBlEFIbqixZtQ
 cHVEvdEvLqAV23jOIw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mw9x2-1sAp3l38qa-00r8Mb; Mon, 15
 Jul 2024 13:26:25 +0200
Message-ID: <af602b2e-4d92-4c54-9884-7db84700aa93@web.de>
Date: Mon, 15 Jul 2024 13:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/dp_mst: Simplify character output in
 drm_dp_mst_dump_topology()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QO2YEPyAv86lnrZfJDpzoSDqKV4xAgrbv8IoSX86Vh+u43DTEm8
 nX2dbrpFUgBrAqQQOdG8C58BJx5wUeshf2x/tXjlwiQCB3jXN5P/W040U5TLeRhi0BFtyoq
 GrOFbR3NF80kea7cNRU0OPfJJFPos/W59xQNJi6+PiX6CXq7NrHTgLLCLxHKpSVH2h9dFaJ
 wFRdBCBIUK+Cnwuu6yNyw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IrsSFhFRPpY=;kNdl2UoqtzFHi/6nBC+LGjxoqkD
 WyrAJmRRi6LX2fcoHCwyFkhBhfEsN78KzY/YNHSpaM7v1A/+VFvCUaLd81Dy1w8R/yT8vIJS8
 9QdK2X+wk4qH3wet6QdumG4+RcSLxWE3ZsjO0ut5R2Flwoyp13bzu/GRBS96ehsT7bFst5cJz
 R2uGzHV5N3o+Jx2dfcWq1yDtUCD8S1baRIJ4cvBu+xARDEinteg2QJfzD7e+2BIClVADKKaDw
 fGLvgSnUWBovVb8LxDSYsfbVmcIJsb5oGBc+MqkgK1wqfaC9q4NOaY93n31zoqR6dxcCDwg03
 ulX7O4LvqoRfD3MmuMjt3NVM73rJHvSNTiVQxYDeRQByiQRQdWOAknrhPn4O5j9SuuyR8xcfn
 HoGrXmVJRxrYMrI3lsbmKMLXo8FTfRMy51pvmcIlaE6eSJ0kc4kNd4wlPl4h/o19/AcAsh1Gl
 zy6R+LZzUP+6nqrvVDIJQ3ytZz+0koxHR3qQjXjp1FUBLF6jkrYetjKMTtNQNl5Suk++E8Knh
 VvFsOm1FHyaKgBwjO7EpxAs6poPGzZsdgQonJn2C89N8Mp0v6N8d3f/YwmpVZcIb4r3Lniyoy
 c5gYaRR6Qqc3CAZCQ9DvmtCYubDU4MbnIBhNaa/nVByAN3wGGRHXyDl353n/AqEMO3qhse7pz
 VaxptlaPAdnpAFHXD0esZhx3uCJKsdc3to9TUBU74k+3wom5pNfOuRsvBqfcqT01UJtBZUQJy
 dXnIBNtQIPuqItTp3dhMScYGhs0Z43snLOZJtOHfbsRnWYKvQ1Gg67bA7M5Rt/jaCHNXgftKf
 gKSZU+PnKhnRQQVsXjbPdBQw==
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
Date: Mon, 15 Jul 2024 13:12:10 +0200

Single characters should be put into a sequence.
Thus use the corresponding function =E2=80=9Cseq_putc=E2=80=9D for one sel=
ected call.

This issue was transformed by using the Coccinelle software.

Suggested-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/d=
rm/display/drm_dp_mst_topology.c
index fc2ceae61db2..65c1700f3e40 100644
=2D-- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4963,7 +4963,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 		seq_printf(m, "branch oui: %*phN devid: ", 3, buf);

 		for (i =3D 0x3; i < 0x8 && buf[i]; i++)
-			seq_printf(m, "%c", buf[i]);
+			seq_putc(m, buf[i]);
 		seq_printf(m, " revision: hw: %x.%x sw: %x.%x\n",
 			   buf[0x9] >> 4, buf[0x9] & 0xf, buf[0xa], buf[0xb]);
 		if (dump_dp_payload_table(mgr, buf))
=2D-
2.45.2

