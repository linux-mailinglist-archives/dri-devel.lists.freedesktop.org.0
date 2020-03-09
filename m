Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0589B17DAEA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D366E2CF;
	Mon,  9 Mar 2020 08:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 446 seconds by postgrey-1.36 at gabe;
 Mon, 09 Mar 2020 08:32:03 UTC
Received: from mx02-sz.bfs.de (mx01-sz.bfs.de [194.94.69.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA98B6E2CF;
 Mon,  9 Mar 2020 08:32:03 +0000 (UTC)
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
 by mx02-sz.bfs.de (Postfix) with ESMTPS id 67CA12034C;
 Mon,  9 Mar 2020 09:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901; 
 t=1583742273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaIxDNUTjnov42I+Fqezs7SqV36FPgBJnmtmK2sN1WY=;
 b=0JpQY9ir9n/8J66CFLcQZ8BXSKDe93gMgEzEPknfOyXaJbubGwafmD+04QOQF9/jbM/mj/
 cOAvWou0719msxjBPi8mQ89zDzcTEdmGfVucApOhHi/ROByjo9R93APyJ46U4721aB8GjV
 IoV8xLlzkUdYoRl9q1Q6+2gCMwxkJYiFjOxrBHB1Q3QtxdNL3unL8aUrztQG9Eso+8CqnM
 SDKqffRBgIdRy2cJLCYVFBM2taEe1lrJ0Pf1P8wQ9Jp7DAd5gmVGHvOtivamDJkaS2+71A
 vQdwgF5qpg2o/PepMgXAkPy6On6l7lYgeEyiegs9hcVCwLGGqlBylWL+kVevbA==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Mon, 9 Mar 2020
 09:24:04 +0100
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%6]) with mapi id
 15.01.1913.005; Mon, 9 Mar 2020 09:24:04 +0100
From: Walter Harms <wharms@bfs.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, "sunpeng.li@amd.com"
 <sunpeng.li@amd.com>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "Bhawanpreet.Lakha@amd.com" <Bhawanpreet.Lakha@amd.com>,
 "mario.kleiner.de@gmail.com" <mario.kleiner.de@gmail.com>,
 "David.Francis@amd.com" <David.Francis@amd.com>
Subject: AW: [PATCH] drm/amdgpu/display: Fix an error handling path in
 'dm_update_crtc_state()'
Thread-Topic: [PATCH] drm/amdgpu/display: Fix an error handling path in
 'dm_update_crtc_state()'
Thread-Index: AQHV9SuzYuuVSz+HgUqDARTjMCrA+ag/7Vf/
Date: Mon, 9 Mar 2020 08:24:04 +0000
Message-ID: <97d88948e2ab4ec19c5a0c6d064df08b@bfs.de>
References: <20200308092637.8194-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200308092637.8194-1-christophe.jaillet@wanadoo.fr>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.39]
MIME-Version: 1.0
X-Spam-Status: No, score=-1.15
Authentication-Results: mx02-sz.bfs.de;
	none
X-Spamd-Result: default: False [-1.15 / 7.00]; ARC_NA(0.00)[];
 TO_DN_EQ_ADDR_SOME(0.00)[]; HAS_XOIP(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[wanadoo.fr,gmail.com];
 TAGGED_RCPT(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BAYES_HAM(-2.65)[98.46%]; DKIM_SIGNED(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; NEURAL_HAM(-0.00)[-0.574,0];
 FREEMAIL_TO(0.00)[wanadoo.fr]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[]
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kern=
el.org> im Auftrag von Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Gesendet: Sonntag, 8. M=E4rz 2020 10:26
An: harry.wentland@amd.com; sunpeng.li@amd.com; alexander.deucher@amd.com; =
christian.koenig@amd.com; David1.Zhou@amd.com; airlied@linux.ie; daniel@ffw=
ll.ch; nicholas.kazlauskas@amd.com; Bhawanpreet.Lakha@amd.com; mario.kleine=
r.de@gmail.com; David.Francis@amd.com
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org; kernel-janitors@vger.kernel.org; Christophe JAILLET
Betreff: [PATCH] drm/amdgpu/display: Fix an error handling path in 'dm_upda=
te_crtc_state()'

'dc_stream_release()' may be called twice. Once here, and once below in the
error handling path if we branch to the 'fail' label.

Set 'new_stream' to NULL, once released to avoid the duplicated release
function call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Maybe the 'goto fail' at line 7745 should be turned into a 'return ret'
instead. Could be clearer.

No Fixes tag provided because I've not been able to dig deep enough in the
git history.
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 97c1b01c0fc1..9d7773a77c4f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7704,8 +7704,10 @@ static int dm_update_crtc_state(struct amdgpu_displa=
y_manager *dm,

 skip_modeset:
        /* Release extra reference */
-       if (new_stream)
-                dc_stream_release(new_stream);
+       if (new_stream) {
+               dc_stream_release(new_stream);
+               new_stream =3D NULL;
+       }


dc_stream_release() is NULL-checked, so the if can be dropped.

re,
 wh

        /*
         * We want to do dc stream updates that do not require a
--
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
