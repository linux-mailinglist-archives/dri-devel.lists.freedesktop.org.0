Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47520ACA1A8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F7610E3BC;
	Sun,  1 Jun 2025 23:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OfIn1WgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BFA10E3BC
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 23:29:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2DDAF49C9D;
 Sun,  1 Jun 2025 23:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89929C4CEE7;
 Sun,  1 Jun 2025 23:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820594;
 bh=NDRM7zxhORgzj0NRBr/ImY3u630rvVOVdmj4QzBubFk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OfIn1WgVyMQgTMDoBkWZMhk/2a7qoBpALtWxv2sThV5BFmBxW2OznKYpVBYRikQk0
 2jGim+2+xQRL7fb07h0ugrj+fP96ttmEXb4gNpjGqw4Kh/GPMna65jkh1v8QKEbXcs
 oKRH3nc0CxlIIymE6x1Gn+7lsfuPMZc5ivDXtOfB/6uZtcmunTX+1eH8x+r+PzHRbq
 TwAH5dav7xz+NeDmjtcS6oE5ebHTo1voRjpqzCL7XFOiW1leVNITQRcAUVvf4i4WGA
 dvdgp31kd066O2of/lYvNSSqnOQcRS9fqBoSCUhzPsm39LibYLQvH6KReMGKN246a7
 /y+t6bM/vTB8w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Sasha Levin <sashal@kernel.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 jani.nikula@intel.com, imre.deak@intel.com, lyude@redhat.com,
 arun.r.murthy@intel.com, andy.yan@rock-chips.com, abel.vesa@linaro.org,
 mitulkumar.ajitkumar.golani@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 006/102] drm/dp: add option to disable zero sized
 address only transactions.
Date: Sun,  1 Jun 2025 19:27:58 -0400
Message-Id: <20250601232937.3510379-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Transfer-Encoding: 8bit
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

From: Dave Airlie <airlied@redhat.com>

[ Upstream commit f0ddbb1eed1898286d2bd99fd6ab64ca9700d267 ]

Some older NVIDIA and some newer NVIDIA hardware/firmware seems to
have issues with address only transactions (firmware rejects them).

Add an option to the core drm dp to avoid address only transactions,
This just puts the MOT flag removal on the last message of the transfer
and avoids the start of transfer transaction.

This with the flag set in nouveau, allows eDP probing on GB203 device.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees for the
following reasons: 1. **Fixes Critical Hardware Functionality**: The
commit addresses a significant bug where eDP displays cannot be probed
on certain NVIDIA hardware (GB203 and others). The commit message
explicitly states: "This with the flag set in nouveau, allows eDP
probing on GB203 device." Without this fix, users with affected hardware
cannot use their displays - a core functionality issue. 2. **Low
Regression Risk - Opt-in Design**: The code changes show this is
implemented as an opt-in feature through the `no_zero_sized` boolean
flag: ```c /bin /bin.usr-is-merged /boot /dev /etc /home /init /lib
/lib.usr-is-merged /lib64 /lost+found /media /mnt /opt /proc /root /run
/sbin /sbin.usr-is-merged /snap /srv /sys /tmp /usr /var 0001-Fix-
Clippy-warnings.patch 0002-Enhance-inference-prompt-to-utilize-
CVEKERNELDIR-whe.patch 0003-Update-to-latest-version-of-clap.patch
Cargo.lock Cargo.toml LICENSE README.md analyze_merge_commit.sh
dpp_rcg_backport_analysis.md io_uring_analysis.txt ksmbd_analysis.txt
merge_commit_analysis.txt model prompt src target test_gpio_cleanup.txt
test_patch.txt @no_zero_sized: If the hw can't use zero sized transfers
(NVIDIA) model/ prompt/ src/ target/ bool no_zero_sized; ``` The
modified behavior only activates when this flag is explicitly set,
meaning existing functionality remains unchanged for all other hardware.
3. **Minimal and Contained Changes**: The code modifications are limited
to: - Adding a single boolean field to the `drm_dp_aux` structure -
Wrapping existing zero-sized transaction code in conditional checks: `if
(!aux->no_zero_sized)` - Adding a special case to remove the MOT flag on
the last message when the flag is set 4. **Historical Precedent**:
Similar commits addressing DP AUX transaction issues have been
backported: - Commit #2 (drm/nouveau/i2c/gf119-: add support for
address-only transactions) was backported to fix display regressions -
Commit #5 (drm/bridge: analogix_dp: properly handle zero sized AUX
transactions) was explicitly marked with "CC: stable@vger.kernel.org" 5.
**Affects Multiple Hardware Generations**: The commit message indicates
this affects "Some older NVIDIA and some newer NVIDIA
hardware/firmware", suggesting a widespread issue across different
hardware generations that stable kernel users would encounter. 6.
**Well-Tested Solution**: The commit has been: - Reviewed by Ben Skeggs
(nouveau maintainer) - Reviewed and tested by Timur Tabi (NVIDIA
engineer) - Signed off by Dave Airlie (DRM maintainer) The commit
clearly meets stable kernel criteria: it fixes an important bug (display
functionality), has minimal risk due to its opt-in nature, doesn't
introduce new features or architectural changes, and addresses a real
hardware compatibility issue that affects users.

 drivers/gpu/drm/display/drm_dp_helper.c | 39 +++++++++++++++----------
 include/drm/display/drm_dp_helper.h     |  5 ++++
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 61c7c2c588c6e..8f19cd7665da0 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2023,14 +2023,17 @@ static int drm_dp_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
 
 	for (i = 0; i < num; i++) {
 		msg.address = msgs[i].addr;
-		drm_dp_i2c_msg_set_request(&msg, &msgs[i]);
-		/* Send a bare address packet to start the transaction.
-		 * Zero sized messages specify an address only (bare
-		 * address) transaction.
-		 */
-		msg.buffer = NULL;
-		msg.size = 0;
-		err = drm_dp_i2c_do_msg(aux, &msg);
+
+		if (!aux->no_zero_sized) {
+			drm_dp_i2c_msg_set_request(&msg, &msgs[i]);
+			/* Send a bare address packet to start the transaction.
+			 * Zero sized messages specify an address only (bare
+			 * address) transaction.
+			 */
+			msg.buffer = NULL;
+			msg.size = 0;
+			err = drm_dp_i2c_do_msg(aux, &msg);
+		}
 
 		/*
 		 * Reset msg.request in case in case it got
@@ -2049,6 +2052,8 @@ static int drm_dp_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
 			msg.buffer = msgs[i].buf + j;
 			msg.size = min(transfer_size, msgs[i].len - j);
 
+			if (j + msg.size == msgs[i].len && aux->no_zero_sized)
+				msg.request &= ~DP_AUX_I2C_MOT;
 			err = drm_dp_i2c_drain_msg(aux, &msg);
 
 			/*
@@ -2066,15 +2071,17 @@ static int drm_dp_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
 	}
 	if (err >= 0)
 		err = num;
-	/* Send a bare address packet to close out the transaction.
-	 * Zero sized messages specify an address only (bare
-	 * address) transaction.
-	 */
-	msg.request &= ~DP_AUX_I2C_MOT;
-	msg.buffer = NULL;
-	msg.size = 0;
-	(void)drm_dp_i2c_do_msg(aux, &msg);
 
+	if (!aux->no_zero_sized) {
+		/* Send a bare address packet to close out the transaction.
+		 * Zero sized messages specify an address only (bare
+		 * address) transaction.
+		 */
+		msg.request &= ~DP_AUX_I2C_MOT;
+		msg.buffer = NULL;
+		msg.size = 0;
+		(void)drm_dp_i2c_do_msg(aux, &msg);
+	}
 	return err;
 }
 
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8f4054a560396..7e5451fed8219 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -518,6 +518,11 @@ struct drm_dp_aux {
 	 * @powered_down: If true then the remote endpoint is powered down.
 	 */
 	bool powered_down;
+
+	/**
+	 * @no_zero_sized: If the hw can't use zero sized transfers (NVIDIA)
+	 */
+	bool no_zero_sized;
 };
 
 int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
-- 
2.39.5

