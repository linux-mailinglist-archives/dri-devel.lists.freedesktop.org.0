Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA143B2D59
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 13:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A906EA1F;
	Thu, 24 Jun 2021 11:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8BA6EA1F;
 Thu, 24 Jun 2021 11:11:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0FA5613C5;
 Thu, 24 Jun 2021 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624533100;
 bh=wlpnGzEf9wfERug0IBvtFXj4DlJaCEfDg1sXXiXDqKI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=usTgsiBRszfcGmqCm2fFYG2GmJzsTUIwLIg42RYwA8AaUCwpSWeHuWRNbMOE6iluA
 NEtY8lPCsCr3FfXHaRhIYNipYpaHbfzzU9BLNfzW/DkhELC/CQCErBvg+17p2N1SIJ
 PnQZ5EQONww/BUKf8nu47LYZGTN3K0C5m+ipEF0bgzdbTitn+tubwc6pAUS52ptAAv
 CD9yAaiSpa+mW4Qrabr+llj3oKXenkR4G9lRzc3Kt3D7otNMl+x8SPyKFcipV+Epz7
 nuGOHcRcQ+2VImBaEzcurk0sSUz6+82jGwevh1flwQi7GhTWOd33DP03PQqSxjklTT
 Yur0m1CO+XORg==
Date: Thu, 24 Jun 2021 13:11:36 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@linux.ie>
Subject: [PATCH v2] drm/amdgpu: Avoid printing of stack contents on firmware
 load error
In-Reply-To: <YNRnDTD1fdpZOXB8@suse.com>
Message-ID: <nycvar.YFH.7.76.2106241310000.18969@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2106241135440.18969@cbobk.fhfr.pm>
 <YNRnDTD1fdpZOXB8@suse.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Vojtech Pavlik <vojtech@ucw.cz>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jiri Kosina <jkosina@suse.cz>

In case when psp_init_asd_microcode() fails to load ASD microcode file, 
psp_v12_0_init_microcode() tries to print the firmware filename that 
failed to load before bailing out.

This is wrong because:

- the firmware filename it would want it print is an incorrect one as
  psp_init_asd_microcode() and psp_v12_0_init_microcode() are loading
  different filenames
- it tries to print fw_name, but that's not yet been initialized by that
  time, so it prints random stack contents, e.g.

    amdgpu 0000:04:00.0: Direct firmware load for amdgpu/renoir_asd.bin failed with error -2
    amdgpu 0000:04:00.0: amdgpu: fail to initialize asd microcode
    amdgpu 0000:04:00.0: amdgpu: psp v12.0: Failed to load firmware "\xfeTO\x8e\xff\xff"

Fix that by bailing out immediately, instead of priting the bogus error
message.

Reported-by: Vojtech Pavlik <vojtech@ucw.cz>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---

v1 -> v2: remove now-unused label

 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
index c4828bd3264b..b0ee77ee80b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
@@ -67,7 +67,7 @@ static int psp_v12_0_init_microcode(struct psp_context *psp)
 
 	err = psp_init_asd_microcode(psp, chip_name);
 	if (err)
-		goto out;
+		return err;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
 	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
@@ -80,7 +80,7 @@ static int psp_v12_0_init_microcode(struct psp_context *psp)
 	} else {
 		err = amdgpu_ucode_validate(adev->psp.ta_fw);
 		if (err)
-			goto out2;
+			goto out;
 
 		ta_hdr = (const struct ta_firmware_header_v1_0 *)
 				 adev->psp.ta_fw->data;
@@ -105,10 +105,9 @@ static int psp_v12_0_init_microcode(struct psp_context *psp)
 
 	return 0;
 
-out2:
+out:
 	release_firmware(adev->psp.ta_fw);
 	adev->psp.ta_fw = NULL;
-out:
 	if (err) {
 		dev_err(adev->dev,
 			"psp v12.0: Failed to load firmware \"%s\"\n",
-- 
2.12.3

