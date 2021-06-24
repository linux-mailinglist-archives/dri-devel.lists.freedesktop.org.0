Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5AE3B2B7F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 11:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6F06EAA6;
	Thu, 24 Jun 2021 09:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F2D6EAA6;
 Thu, 24 Jun 2021 09:37:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F93F6112D;
 Thu, 24 Jun 2021 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624527442;
 bh=jsDGWCDLGzsT5JajHINSRUN4a5PAlDEfxYxcZcF0zwc=;
 h=Date:From:To:cc:Subject:From;
 b=c+n4Z8J6IQEwAaZ8RLOv9H70UhqOOySZvE/UUJXn7kvhpk2LlmphaTGRSBn+V6baK
 snTcWvrvis4/i1FPQCRkJhp2Q6Z3TbzrBDg9JQu9/3hKdCB7HsJRoWKHQjH15Hqemc
 QWJBtixZgc8LZ79IYbVqc3oZ0U4qKV9SYHrh3LT0K0x2ezzxE0sZkwPiB1J6kqmWoe
 3sP5mwvG5jXMpo/hZgVAzn6nzXik8CVUDUngDFwilbGJ3RWAGebd8546ePeao7/trz
 1Ulwch2aBG1sW5z2QpJuDbVja9En1jpfkwtanDnh7HkQN9pXv+y2qHvwM7vE4dqy5M
 Z28VgiAaUo4BA==
Date: Thu, 24 Jun 2021 11:37:18 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/amdgpu: Avoid printing of stack contents on firmware
 load error
Message-ID: <nycvar.YFH.7.76.2106241135440.18969@cbobk.fhfr.pm>
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
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
index c4828bd3264b..5b21e22ad4b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
@@ -67,7 +67,7 @@ static int psp_v12_0_init_microcode(struct psp_context *psp)
 
 	err = psp_init_asd_microcode(psp, chip_name);
 	if (err)
-		goto out;
+		return err;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
 	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-- 
2.12.3


-- 
Jiri Kosina
SUSE Labs

