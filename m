Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC064FC607
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 22:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCCF10F5D4;
	Mon, 11 Apr 2022 20:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5AB10F5C9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 20:48:02 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id 75so9358486qkk.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pQ0d8Wt4kOuJn/jc5LzAwul2TA2NboaT2Uiul9ArRmM=;
 b=YYcbwg2YsZmi/5EoeluP+1IfzTzFT8Z3OOV3dT5+thOkdTzEHsw7SPCvySBvJCe2Pj
 ixSpwpuztqEJcu1pbmwIhiApiU9JSt04nV9GuYaf+AEHOHODIGwIpwegaPu9q0pLYUoK
 YUPZqk72z/NpvSNZGIZNc7f/DSkOQ9lDzeJwcoDVW7Atlsic+HHK0yKzdAOdF3VNFm9n
 dk5J7vTynrZNNgpGaQWiuV08+I7tcmDHR2hKuLhGxOsj3RKkHXhxSrVSa7r5b2JM4BBO
 O40iclhm5lckZJqjbbCuU8WrN1+uDsyfk70OFLsPgIEZvTOAx1C+E0ljYd8wZj8vkbRI
 FPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pQ0d8Wt4kOuJn/jc5LzAwul2TA2NboaT2Uiul9ArRmM=;
 b=WH+FuVb4naLK19U4vF8XX7rLB814wskXfnnn8V766A9/XWUwtN4JwarQfzfQs+MUns
 0T2VWar/yAKDUrUi6CmZDEyWwmBi1RAn2PufFhtnhWLQJZ5auTCpnMLhwF2ztWlsTgxW
 I1y4UcTLTrr6tmCJkfayxwg+U4UVXtQj4INzahzvb3+LsZ3Te7CtwCeWhmU0bJeqh4RH
 1+XXDoSRfUHertmLwg81+xVbJtSIdDTDc+JOFAWz+cbZ0FOeBQBsiDxKMNfuyzQB7aBQ
 QbuXo1V/38k7oXY3AhmUNjL6Uuo/PK68bWPQ5QZT8UhjJqsiXWBb73rq67cEU3D0j470
 4qdA==
X-Gm-Message-State: AOAM530/K9cJyxJl1OIv9VkcrTr+uKqnUecIWvDfkq9SmPvYpexb2d1i
 4l984Kg/OMXEhUNu2WAQ1yUFGFaT0k0e7A==
X-Google-Smtp-Source: ABdhPJyX0b4aJJe4ZCl0wARFPcvCuPh+G+Eo8R8ooH4XGm8TxR//1U8ikKXxs+6YsW5RdsderwFs6g==
X-Received: by 2002:a05:620a:1581:b0:69c:8bd:9a48 with SMTP id
 d1-20020a05620a158100b0069c08bd9a48mr939700qkk.386.1649710080335; 
 Mon, 11 Apr 2022 13:48:00 -0700 (PDT)
Received: from localhost (115.25.199.35.bc.googleusercontent.com.
 [35.199.25.115]) by smtp.gmail.com with ESMTPSA id
 o10-20020ac85a4a000000b002ed143903a9sm5574472qta.45.2022.04.11.13.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 13:48:00 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: [PATCH v5 04/10] drm/hdcp: Expand HDCP helper library for
 enable/disable/check
Date: Mon, 11 Apr 2022 20:47:33 +0000
Message-Id: <20220411204741.1074308-5-sean@poorly.run>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220411204741.1074308-1-sean@poorly.run>
References: <20220411204741.1074308-1-sean@poorly.run>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, markyacoub@chromium.org,
 abhinavk@codeaurora.org, swboyd@chromium.org,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 bjorn.andersson@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch expands upon the HDCP helper library to manage HDCP
enable, disable, and check.

Previous to this patch, the majority of the state management and sink
interaction is tucked inside the Intel driver with the understanding
that once a new platform supported HDCP we could make good decisions
about what should be centralized. With the addition of HDCP support
for Qualcomm, it's time to migrate the protocol-specific bits of HDCP
authentication, key exchange, and link checks to the HDCP helper.

In terms of functionality, this migration is 1:1 with the Intel driver,
however things are laid out a bit differently than with intel_hdcp.c,
which is why this is a separate patch from the i915 transition to the
helper. On i915, the shim vtable is used to account for HDMI vs. DP
vs. DP-MST differences whereas the helper library uses a LUT to
account for the register offsets and a remote read function to route
the messages. On i915, storing the sink information in the source is
done inline whereas now we use the new drm_hdcp_helper_funcs vtable
to store and fetch information to/from source hw. Finally, instead of
calling enable/disable directly from the driver, we'll leave that
decision to the helper and by calling drm_hdcp_helper_atomic_commit()
from the driver. All told, this will centralize the protocol and state
handling in the helper, ensuring we collect all of our bugs^Wlogic
in one place.

Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-5-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-5-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-5-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-5-sean@poorly.run #v4

Changes in v2:
-Fixed set-but-unused variable identified by 0-day
Changes in v3:
-Fixed uninitialized variable warning identified by 0-day
Changes in v4:
-None
Changes in v5:
-None
---
 drivers/gpu/drm/drm_hdcp.c | 1103 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_hdcp.h     |  191 +++++++
 2 files changed, 1294 insertions(+)

diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
index 8c851d40cd45..3e550c892751 100644
--- a/drivers/gpu/drm/drm_hdcp.c
+++ b/drivers/gpu/drm/drm_hdcp.c
@@ -6,15 +6,20 @@
  * Ramalingam C <ramalingam.c@intel.com>
  */
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gfp.h>
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/firmware.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_connector.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_hdcp.h>
 #include <drm/drm_sysfs.h>
 #include <drm/drm_print.h>
@@ -513,3 +518,1101 @@ bool drm_hdcp_atomic_check(struct drm_connector *connector,
 	return old_hdcp != new_hdcp;
 }
 EXPORT_SYMBOL(drm_hdcp_atomic_check);
+
+struct drm_hdcp_helper_data {
+	struct mutex mutex;
+	struct mutex *driver_mutex;
+
+	struct drm_connector *connector;
+	const struct drm_hdcp_helper_funcs *funcs;
+
+	u64 value;
+	unsigned int enabled_type;
+
+	struct delayed_work check_work;
+	struct work_struct prop_work;
+
+	struct drm_dp_aux *aux;
+	const struct drm_hdcp_hdcp1_receiver_reg_lut *hdcp1_lut;
+};
+
+struct drm_hdcp_hdcp1_receiver_reg_lut {
+	unsigned int bksv;
+	unsigned int ri;
+	unsigned int aksv;
+	unsigned int an;
+	unsigned int ainfo;
+	unsigned int v[5];
+	unsigned int bcaps;
+	unsigned int bcaps_mask_repeater_present;
+	unsigned int bstatus;
+};
+
+static const struct drm_hdcp_hdcp1_receiver_reg_lut drm_hdcp_hdcp1_ddc_lut = {
+	.bksv = DRM_HDCP_DDC_BKSV,
+	.ri = DRM_HDCP_DDC_RI_PRIME,
+	.aksv = DRM_HDCP_DDC_AKSV,
+	.an = DRM_HDCP_DDC_AN,
+	.ainfo = DRM_HDCP_DDC_AINFO,
+	.v = { DRM_HDCP_DDC_V_PRIME(0), DRM_HDCP_DDC_V_PRIME(1),
+	       DRM_HDCP_DDC_V_PRIME(2), DRM_HDCP_DDC_V_PRIME(3),
+	       DRM_HDCP_DDC_V_PRIME(4) },
+	.bcaps = DRM_HDCP_DDC_BCAPS,
+	.bcaps_mask_repeater_present = DRM_HDCP_DDC_BCAPS_REPEATER_PRESENT,
+	.bstatus = DRM_HDCP_DDC_BSTATUS,
+};
+
+static const struct drm_hdcp_hdcp1_receiver_reg_lut drm_hdcp_hdcp1_dpcd_lut = {
+	.bksv = DP_AUX_HDCP_BKSV,
+	.ri = DP_AUX_HDCP_RI_PRIME,
+	.aksv = DP_AUX_HDCP_AKSV,
+	.an = DP_AUX_HDCP_AN,
+	.ainfo = DP_AUX_HDCP_AINFO,
+	.v = { DP_AUX_HDCP_V_PRIME(0), DP_AUX_HDCP_V_PRIME(1),
+	       DP_AUX_HDCP_V_PRIME(2), DP_AUX_HDCP_V_PRIME(3),
+	       DP_AUX_HDCP_V_PRIME(4) },
+	.bcaps = DP_AUX_HDCP_BCAPS,
+	.bcaps_mask_repeater_present = DP_BCAPS_REPEATER_PRESENT,
+
+	/*
+	 * For some reason the HDMI and DP HDCP specs call this register
+	 * definition by different names. In the HDMI spec, it's called BSTATUS,
+	 * but in DP it's called BINFO.
+	 */
+	.bstatus = DP_AUX_HDCP_BINFO,
+};
+
+static int drm_hdcp_remote_ddc_read(struct i2c_adapter *i2c,
+				    unsigned int offset, u8 *value, size_t len)
+{
+	int ret;
+	u8 start = offset & 0xff;
+	struct i2c_msg msgs[] = {
+		{
+			.addr = DRM_HDCP_DDC_ADDR,
+			.flags = 0,
+			.len = 1,
+			.buf = &start,
+		},
+		{
+			.addr = DRM_HDCP_DDC_ADDR,
+			.flags = I2C_M_RD,
+			.len = len,
+			.buf = value
+		}
+	};
+	ret = i2c_transfer(i2c, msgs, ARRAY_SIZE(msgs));
+	if (ret == ARRAY_SIZE(msgs))
+		return 0;
+	return ret >= 0 ? -EIO : ret;
+}
+
+static int drm_hdcp_remote_dpcd_read(struct drm_dp_aux *aux,
+				     unsigned int offset, u8 *value,
+				     size_t len)
+{
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(aux, offset, value, len);
+	if (ret != len) {
+		if (ret >= 0)
+			return -EIO;
+		return ret;
+	}
+
+	return 0;
+}
+
+static int drm_hdcp_remote_read(struct drm_hdcp_helper_data *data,
+				unsigned int offset, u8 *value, u8 len)
+{
+	if (data->aux)
+		return drm_hdcp_remote_dpcd_read(data->aux, offset, value, len);
+	else
+		return drm_hdcp_remote_ddc_read(data->connector->ddc, offset, value, len);
+}
+
+static int drm_hdcp_remote_ddc_write(struct i2c_adapter *i2c,
+				     unsigned int offset, u8 *buffer,
+				     size_t size)
+{
+	int ret;
+	u8 *write_buf;
+	struct i2c_msg msg;
+
+	write_buf = kzalloc(size + 1, GFP_KERNEL);
+	if (!write_buf)
+		return -ENOMEM;
+
+	write_buf[0] = offset & 0xff;
+	memcpy(&write_buf[1], buffer, size);
+
+	msg.addr = DRM_HDCP_DDC_ADDR;
+	msg.flags = 0,
+	msg.len = size + 1,
+	msg.buf = write_buf;
+
+	ret = i2c_transfer(i2c, &msg, 1);
+	if (ret == 1)
+		ret = 0;
+	else if (ret >= 0)
+		ret = -EIO;
+
+	kfree(write_buf);
+	return ret;
+}
+
+static int drm_hdcp_remote_dpcd_write(struct drm_dp_aux *aux,
+				     unsigned int offset, u8 *value,
+				     size_t len)
+{
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_write(aux, offset, value, len);
+	if (ret != len) {
+		if (ret >= 0)
+			return -EIO;
+		return ret;
+	}
+
+	return 0;
+}
+
+static int drm_hdcp_remote_write(struct drm_hdcp_helper_data *data,
+				 unsigned int offset, u8 *value, u8 len)
+{
+	if (data->aux)
+		return drm_hdcp_remote_dpcd_write(data->aux, offset, value, len);
+	else
+		return drm_hdcp_remote_ddc_write(data->connector->ddc, offset,
+						 value, len);
+}
+
+static bool drm_hdcp_is_ksv_valid(struct drm_hdcp_ksv *ksv)
+{
+	/* Valid Ksv has 20 0's and 20 1's */
+	return hweight32(ksv->words[0]) + hweight32(ksv->words[1]) == 20;
+}
+
+static int drm_hdcp_read_valid_bksv(struct drm_hdcp_helper_data *data,
+				    struct drm_hdcp_ksv *bksv)
+{
+	int ret, i, tries = 2;
+
+	/* HDCP spec states that we must retry the bksv if it is invalid */
+	for (i = 0; i < tries; i++) {
+		ret = drm_hdcp_remote_read(data, data->hdcp1_lut->bksv,
+					   bksv->bytes, DRM_HDCP_KSV_LEN);
+		if (ret)
+			return ret;
+
+		if (drm_hdcp_is_ksv_valid(bksv))
+			break;
+	}
+	if (i == tries) {
+		drm_dbg_kms(data->connector->dev, "Bksv is invalid %*ph\n",
+			    DRM_HDCP_KSV_LEN, bksv->bytes);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+/**
+ * drm_hdcp_helper_hdcp1_capable - Checks if the sink is capable of HDCP 1.x.
+ *
+ * @data: pointer to the HDCP helper data.
+ * @capable: pointer to a bool which will contain true if the sink is capable.
+ *
+ * Returns:
+ * -errno if the transacation between source and sink fails.
+ */
+int drm_hdcp_helper_hdcp1_capable(struct drm_hdcp_helper_data *data,
+				  bool *capable)
+{
+	/*
+	 * DisplayPort has a dedicated bit for this in DPCD whereas HDMI spec
+	 * states that transmitters should use bksv to determine capability.
+	 */
+	if (data->aux) {
+		int ret;
+		u8 bcaps;
+
+		ret = drm_hdcp_remote_read(data, data->hdcp1_lut->bcaps,
+					   &bcaps, 1);
+		*capable = !ret && (bcaps & DP_BCAPS_HDCP_CAPABLE);
+	} else {
+		struct drm_hdcp_ksv bksv;
+
+		*capable = drm_hdcp_read_valid_bksv(data, &bksv) == 0;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_hdcp_helper_hdcp1_capable);
+
+static void drm_hdcp_update_value(struct drm_hdcp_helper_data *data,
+				  u64 value, bool update_property)
+{
+	WARN_ON(!mutex_is_locked(&data->mutex));
+
+	data->value = value;
+	if (update_property) {
+		drm_connector_get(data->connector);
+		schedule_work(&data->prop_work);
+	}
+}
+
+static int
+drm_hdcp_helper_hdcp1_ksv_fifo_ready(struct drm_hdcp_helper_data *data)
+{
+	int ret;
+	u8 val, mask;
+
+	/* KSV FIFO ready bit is stored in different locations on DP v. HDMI */
+	if (data->aux) {
+		ret = drm_hdcp_remote_dpcd_read(data->aux, DP_AUX_HDCP_BSTATUS,
+						&val, 1);
+		mask = DP_BSTATUS_READY;
+	} else {
+		ret = drm_hdcp_remote_ddc_read(data->connector->ddc,
+					       DRM_HDCP_DDC_BCAPS, &val, 1);
+		mask = DRM_HDCP_DDC_BCAPS_KSV_FIFO_READY;
+	}
+	if (ret)
+		return ret;
+	if (val & mask)
+		return 0;
+
+	return -EAGAIN;
+}
+
+static int
+drm_hdcp_helper_hdcp1_read_ksv_fifo(struct drm_hdcp_helper_data *data, u8 *fifo,
+				    u8 num_downstream)
+{
+	struct drm_device *dev = data->connector->dev;
+	int ret, i;
+
+	/* Over HDMI, read the whole thing at once */
+	if (data->connector->ddc) {
+		ret = drm_hdcp_remote_ddc_read(data->connector->ddc,
+					       DRM_HDCP_DDC_KSV_FIFO, fifo,
+					       num_downstream * DRM_HDCP_KSV_LEN);
+		if (ret)
+			drm_err(dev, "DDC ksv fifo read failed (%d)\n", ret);
+		return ret;
+	}
+
+	/* Over DP, read via 15 byte window (3 entries @ 5 bytes each) */
+	for (i = 0; i < num_downstream; i += 3) {
+		size_t len = min(num_downstream - i, 3) * DRM_HDCP_KSV_LEN;
+		ret = drm_hdcp_remote_dpcd_read(data->aux, DP_AUX_HDCP_KSV_FIFO,
+						fifo + i * DRM_HDCP_KSV_LEN,
+						len);
+		if (ret) {
+			drm_err(dev, "Read ksv[%d] from DP/AUX failed (%d)\n",
+				i, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int drm_hdcp_helper_hdcp1_read_v_prime(struct drm_hdcp_helper_data *data,
+					      u32 *v_prime)
+{
+	struct drm_device *dev = data->connector->dev;
+	int ret, i;
+
+	for (i = 0; i < DRM_HDCP_V_PRIME_NUM_PARTS; i++) {
+		ret = drm_hdcp_remote_read(data, data->hdcp1_lut->v[i],
+					   (u8 *)&v_prime[i],
+					   DRM_HDCP_V_PRIME_PART_LEN);
+		if (ret) {
+			drm_dbg_kms(dev, "Read v'[%d] from failed (%d)\n", i, ret);
+			return ret >= 0 ? -EIO : ret;
+		}
+	}
+	return 0;
+}
+
+static int
+drm_hdcp_helper_hdcp1_authenticate_downstream(struct drm_hdcp_helper_data *data)
+{
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+	u32 v_prime[DRM_HDCP_V_PRIME_NUM_PARTS];
+	u8 bstatus[DRM_HDCP_BSTATUS_LEN];
+	u8 num_downstream, *ksv_fifo;
+	int ret, i, tries = 3;
+
+	ret = read_poll_timeout(drm_hdcp_helper_hdcp1_ksv_fifo_ready, ret, !ret,
+				10 * 1000, 5 * 1000 * 1000, false, data);
+	if (ret) {
+		drm_err(dev, "Failed to poll ksv ready, %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_hdcp_remote_read(data, data->hdcp1_lut->bstatus,
+				   bstatus, DRM_HDCP_BSTATUS_LEN);
+	if (ret)
+		return ret;
+
+	/*
+	 * When repeater reports 0 device count, HDCP1.4 spec allows disabling
+	 * the HDCP encryption. That implies that repeater can't have its own
+	 * display. As there is no consumption of encrypted content in the
+	 * repeater with 0 downstream devices, we are failing the
+	 * authentication.
+	 */
+	num_downstream = DRM_HDCP_NUM_DOWNSTREAM(bstatus[0]);
+	if (num_downstream == 0) {
+		drm_err(dev, "Repeater with zero downstream devices, %*ph\n",
+			DRM_HDCP_BSTATUS_LEN, bstatus);
+		return -EINVAL;
+	}
+
+	ksv_fifo = kcalloc(DRM_HDCP_KSV_LEN, num_downstream, GFP_KERNEL);
+	if (!ksv_fifo)
+		return -ENOMEM;
+
+	ret = drm_hdcp_helper_hdcp1_read_ksv_fifo(data, ksv_fifo,
+						  num_downstream);
+	if (ret) {
+		drm_err(dev, "Failed to read ksv fifo, %d/%d\n", num_downstream,
+			ret);
+		goto out;
+	}
+
+	if (drm_hdcp_check_ksvs_revoked(dev, ksv_fifo, num_downstream)) {
+		drm_err(dev, "Revoked Ksv(s) in ksv_fifo\n");
+		ret = -EPERM;
+		goto out;
+	}
+
+	/*
+	 * When V prime mismatches, DP Spec mandates re-read of
+	 * V prime atleast twice.
+	 */
+	for (i = 0; i < tries; i++) {
+		ret = drm_hdcp_helper_hdcp1_read_v_prime(data, v_prime);
+		if (ret)
+			continue;
+
+		ret = data->funcs->hdcp1_store_ksv_fifo(connector, ksv_fifo,
+							num_downstream,
+							bstatus, v_prime);
+		if (!ret)
+			break;
+	}
+	if (ret)
+		drm_err(dev, "Could not validate KSV FIFO with V' %d\n", ret);
+
+out:
+	if (!ret)
+		drm_dbg_kms(dev, "HDCP is enabled (%d downstream devices)\n",
+			    num_downstream);
+
+	kfree(ksv_fifo);
+	return ret;
+}
+
+static int drm_hdcp_helper_hdcp1_validate_ri(struct drm_hdcp_helper_data *data)
+{
+	union {
+		u32 word;
+		u8 bytes[DRM_HDCP_RI_LEN];
+	} ri_prime = { .word = 0 };
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+	int ret;
+
+	ret = drm_hdcp_remote_read(data, data->hdcp1_lut->ri, ri_prime.bytes,
+				   DRM_HDCP_RI_LEN);
+	if (ret) {
+		drm_err(dev, "Failed to read R0' %d\n", ret);
+		return ret;
+	}
+
+	return data->funcs->hdcp1_match_ri(connector, ri_prime.word);
+}
+
+static int drm_hdcp_helper_hdcp1_authenticate(struct drm_hdcp_helper_data *data)
+{
+	union {
+		u32 word;
+		u8 bytes[DRM_HDCP_BSTATUS_LEN];
+	} bstatus;
+	const struct drm_hdcp_helper_funcs *funcs = data->funcs;
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+	unsigned long r0_prime_timeout, r0_prime_remaining_us = 0, tmp_jiffies;
+	struct drm_hdcp_ksv aksv;
+	struct drm_hdcp_ksv bksv;
+	struct drm_hdcp_an an;
+	bool repeater_present;
+	int ret, i, tries = 3;
+	u8 bcaps;
+
+	if (funcs->hdcp1_read_an_aksv) {
+		ret = funcs->hdcp1_read_an_aksv(connector, an.words, aksv.words);
+		if (ret) {
+			drm_err(dev, "Failed to read An/Aksv values, %d\n", ret);
+			return ret;
+		}
+
+		ret = drm_hdcp_remote_write(data, data->hdcp1_lut->an, an.bytes,
+					DRM_HDCP_AN_LEN);
+		if (ret) {
+			drm_err(dev, "Failed to write An to receiver, %d\n", ret);
+			return ret;
+		}
+
+		ret = drm_hdcp_remote_write(data, data->hdcp1_lut->aksv, aksv.bytes,
+					DRM_HDCP_KSV_LEN);
+		if (ret) {
+			drm_err(dev, "Failed to write Aksv to receiver, %d\n", ret);
+			return ret;
+		}
+	} else {
+		ret = funcs->hdcp1_send_an_aksv(connector);
+		if (ret) {
+			drm_err(dev, "Failed to read An/Aksv values, %d\n", ret);
+			return ret;
+		}
+	}
+
+	/*
+	 * Timeout for R0' to become available. The spec says 100ms from Aksv,
+	 * but some monitors can take longer than this. We'll set the timeout at
+	 * 300ms just to be sure.
+	 */
+	r0_prime_timeout = jiffies + msecs_to_jiffies(300);
+
+	memset(&bksv, 0, sizeof(bksv));
+
+	ret = drm_hdcp_read_valid_bksv(data, &bksv);
+	if (ret < 0)
+		return ret;
+
+	if (drm_hdcp_check_ksvs_revoked(dev, bksv.bytes, 1)) {
+		drm_err(dev, "BKSV is revoked\n");
+		return -EPERM;
+	}
+
+	ret = drm_hdcp_remote_read(data, data->hdcp1_lut->bcaps, &bcaps, 1);
+	if (ret)
+		return ret;
+
+	memset(&bstatus, 0, sizeof(bstatus));
+
+	ret = drm_hdcp_remote_read(data, data->hdcp1_lut->bstatus,
+				   bstatus.bytes, DRM_HDCP_BSTATUS_LEN);
+	if (ret)
+		return ret;
+
+	if (DRM_HDCP_MAX_DEVICE_EXCEEDED(bstatus.bytes[0]) ||
+	    DRM_HDCP_MAX_CASCADE_EXCEEDED(bstatus.bytes[1])) {
+		drm_err(dev, "Max Topology Limit Exceeded, bstatus=%*ph\n",
+			DRM_HDCP_BSTATUS_LEN, bstatus.bytes);
+		return -EPERM;
+	}
+
+	repeater_present = bcaps & data->hdcp1_lut->bcaps_mask_repeater_present;
+
+	ret = funcs->hdcp1_store_receiver_info(connector, bksv.words,
+					       bstatus.word, bcaps,
+					       repeater_present);
+	if (ret) {
+		drm_err(dev, "Failed to store bksv, %d\n", ret);
+		return ret;
+	}
+
+	ret = funcs->hdcp1_enable_encryption(connector);
+	if (ret)
+		return ret;
+
+	ret = funcs->hdcp1_wait_for_r0(connector);
+	if (ret)
+		return ret;
+
+	tmp_jiffies = jiffies;
+	if (time_before(tmp_jiffies, r0_prime_timeout))
+		r0_prime_remaining_us = jiffies_to_usecs(r0_prime_timeout - tmp_jiffies);
+
+	/*
+	 * Wait for R0' to become available.
+	 *
+	 * On DP, there's an R0_READY bit available but no such bit
+	 * exists on HDMI. So poll the ready bit for DP and just wait the
+	 * remainder of the 300 ms timeout for HDMI.
+	 */
+	if (data->aux) {
+		u8 val;
+		ret = read_poll_timeout(drm_hdcp_remote_dpcd_read, ret,
+					!ret && (val & DP_BSTATUS_R0_PRIME_READY),
+					1000, r0_prime_remaining_us, false,
+					data->aux, DP_AUX_HDCP_BSTATUS, &val, 1);
+		if (ret) {
+			drm_err(dev, "R0' did not become ready %d\n", ret);
+			return ret;
+		}
+	} else {
+		usleep_range(r0_prime_remaining_us,
+			     r0_prime_remaining_us + 1000);
+	}
+
+	/*
+	 * DP HDCP Spec mandates the two more reattempt to read R0, incase
+	 * of R0 mismatch.
+	 */
+	for (i = 0; i < tries; i++) {
+		ret = drm_hdcp_helper_hdcp1_validate_ri(data);
+		if (!ret)
+			break;
+	}
+	if (ret) {
+		drm_err(dev, "Failed to match R0/R0', aborting HDCP %d\n", ret);
+		return ret;
+	}
+
+	if (repeater_present)
+		return drm_hdcp_helper_hdcp1_authenticate_downstream(data);
+
+	drm_dbg_kms(dev, "HDCP is enabled (no repeater present)\n");
+	return 0;
+}
+
+static int drm_hdcp_helper_hdcp1_enable(struct drm_hdcp_helper_data *data)
+{
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+	int i, ret, tries = 3;
+
+	drm_dbg_kms(dev, "[%s:%d] HDCP is being enabled...\n", connector->name,
+		    connector->base.id);
+
+	/* Incase of authentication failures, HDCP spec expects reauth. */
+	for (i = 0; i < tries; i++) {
+		ret = drm_hdcp_helper_hdcp1_authenticate(data);
+		if (!ret)
+			return 0;
+
+		drm_dbg_kms(dev, "HDCP Auth failure (%d)\n", ret);
+
+		/* Ensuring HDCP encryption and signalling are stopped. */
+		data->funcs->hdcp1_disable(data->connector);
+	}
+
+	drm_err(dev, "HDCP authentication failed (%d tries/%d)\n", tries, ret);
+	return ret;
+}
+
+static inline
+void drm_hdcp_helper_driver_lock(struct drm_hdcp_helper_data *data)
+{
+	if (data->driver_mutex)
+		mutex_lock(data->driver_mutex);
+}
+
+static inline
+void drm_hdcp_helper_driver_unlock(struct drm_hdcp_helper_data *data)
+{
+	if (data->driver_mutex)
+		mutex_unlock(data->driver_mutex);
+}
+
+static int drm_hdcp_helper_enable_hdcp(struct drm_hdcp_helper_data *data,
+				       struct drm_atomic_state *state,
+				       struct mutex *driver_mutex)
+{
+	struct drm_connector *connector = data->connector;
+	struct drm_connector_state *conn_state;
+	struct drm_device *dev = connector->dev;
+	unsigned long check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
+	bool capable;
+	int ret = 0;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+
+	mutex_lock(&data->mutex);
+
+	if (data->value == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_ENABLED,
+				      true);
+		goto out_data_mutex;
+	}
+
+	drm_WARN_ON(dev, data->driver_mutex != NULL);
+	data->driver_mutex = driver_mutex;
+
+	drm_hdcp_helper_driver_lock(data);
+
+	if (data->funcs->setup) {
+		ret = data->funcs->setup(connector, state);
+		if (ret) {
+			drm_err(dev, "Failed to setup HDCP %d\n", ret);
+			goto out;
+		}
+	}
+
+	if (!data->funcs->are_keys_valid ||
+	    !data->funcs->are_keys_valid(connector)) {
+		if (data->funcs->load_keys) {
+			ret = data->funcs->load_keys(connector);
+			if (ret) {
+				drm_err(dev, "Failed to load HDCP keys %d\n", ret);
+				goto out;
+			}
+		}
+	}
+
+	/*
+	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
+	 * is capable of HDCP2.2, it is preferred to use HDCP2.2.
+	 */
+	ret = data->funcs->hdcp2_capable(connector, &capable);
+	if (ret) {
+		drm_err(dev, "HDCP 2.x capability check failed %d\n", ret);
+		goto out;
+	}
+	if (capable) {
+		data->enabled_type = DRM_MODE_HDCP_CONTENT_TYPE1;
+		ret = data->funcs->hdcp2_enable(connector);
+		if (!ret) {
+			check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
+			goto out;
+		}
+	}
+
+	/*
+	 * When HDCP2.2 fails and Content Type is not Type1, HDCP1.4 will
+	 * be attempted.
+	 */
+	ret = drm_hdcp_helper_hdcp1_capable(data, &capable);
+	if (ret) {
+		drm_err(dev, "HDCP 1.x capability check failed %d\n", ret);
+		goto out;
+	}
+	if (capable && conn_state->content_type != DRM_MODE_HDCP_CONTENT_TYPE1) {
+		data->enabled_type = DRM_MODE_HDCP_CONTENT_TYPE0;
+		ret = drm_hdcp_helper_hdcp1_enable(data);
+		if (!ret)
+			check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
+	}
+
+out:
+	if (!ret) {
+		schedule_delayed_work(&data->check_work, check_link_interval);
+		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_ENABLED,
+				      true);
+	}
+
+	drm_hdcp_helper_driver_unlock(data);
+	if (ret)
+		data->driver_mutex = NULL;
+
+out_data_mutex:
+	mutex_unlock(&data->mutex);
+	return ret;
+}
+
+static int drm_hdcp_helper_disable_hdcp(struct drm_hdcp_helper_data *data)
+{
+	int ret = 0;
+
+	mutex_lock(&data->mutex);
+	drm_hdcp_helper_driver_lock(data);
+
+	if (data->value == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
+		goto out;
+
+	drm_dbg_kms(data->connector->dev, "[%s:%d] HDCP is being disabled...\n",
+		    data->connector->name, data->connector->base.id);
+
+	drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_UNDESIRED, true);
+
+	if (data->enabled_type == DRM_MODE_HDCP_CONTENT_TYPE1)
+		ret = data->funcs->hdcp2_disable(data->connector);
+	else
+		ret = data->funcs->hdcp1_disable(data->connector);
+
+	drm_dbg_kms(data->connector->dev, "HDCP is disabled\n");
+
+out:
+	drm_hdcp_helper_driver_unlock(data);
+	data->driver_mutex = NULL;
+	mutex_unlock(&data->mutex);
+	cancel_delayed_work_sync(&data->check_work);
+	return ret;
+}
+
+/**
+ * drm_hdcp_helper_atomic_commit - Helper for drivers to call during commit to
+ * enable/disable HDCP
+ *
+ * @data: pointer to the @drm_hdcp_helper_data for the connector
+ * @state: pointer to the atomic state being committed
+ * @driver_mutex: driver-provided lock to be used while interacting with the driver
+ *
+ * This function can be used by display drivers to determine when HDCP should be
+ * enabled or disabled based on the connector state. It should be called during
+ * steady-state commits as well as connector enable/disable. The function will
+ * handle the HDCP authentication/encryption logic, calling back into the driver
+ * when source operations are necessary.
+ *
+ * @driver_mutex will be retained and used for the duration of the HDCP session
+ * since it will be needed for link checks and retries. This mutex is useful if
+ * the driver has shared resources across connectors which must be serialized.
+ * For example, driver_mutex can be used for MST connectors sharing a common
+ * encoder which should not be accessed/changed concurrently. When the
+ * connector's session is torn down, the mutex will be forgotten by the helper
+ * for this connector until the next session.
+ */
+void drm_hdcp_helper_atomic_commit(struct drm_hdcp_helper_data *data,
+				   struct drm_atomic_state *state,
+				   struct mutex *driver_mutex)
+{
+	struct drm_connector *connector = data->connector;
+	struct drm_connector_state *conn_state;
+	bool type_changed;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+
+	type_changed = conn_state->hdcp_content_type != data->enabled_type;
+
+	if (conn_state->content_protection == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		drm_hdcp_helper_disable_hdcp(data);
+		return;
+	}
+
+	if (!conn_state->crtc) {
+		drm_hdcp_helper_disable_hdcp(data);
+
+		/* Restore property to DESIRED so it's retried later */
+		if (conn_state->content_protection == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+			mutex_lock(&data->mutex);
+			drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_DESIRED,
+					true);
+			mutex_unlock(&data->mutex);
+		}
+		return;
+	}
+
+	/* Already enabled */
+	if (conn_state->content_protection == DRM_MODE_CONTENT_PROTECTION_ENABLED)
+		return;
+
+	/* Disable and re-enable HDCP on content type change */
+	if (type_changed)
+		drm_hdcp_helper_disable_hdcp(data);
+
+	drm_hdcp_helper_enable_hdcp(data, state, driver_mutex);
+}
+EXPORT_SYMBOL(drm_hdcp_helper_atomic_commit);
+
+static void drm_hdcp_helper_prop_work(struct work_struct *work)
+{
+	struct drm_hdcp_helper_data *data = container_of(work,
+							 struct drm_hdcp_helper_data,
+							 prop_work);
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+
+	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
+	mutex_lock(&data->mutex);
+
+	/*
+	 * This worker is only used to flip between ENABLED/DESIRED. Either of
+	 * those to UNDESIRED is handled by core. If value == UNDESIRED,
+	 * we're running just after hdcp has been disabled, so just exit
+	 */
+	if (data->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
+		drm_hdcp_update_content_protection(connector, data->value);
+
+	mutex_unlock(&data->mutex);
+	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+}
+
+static int drm_hdcp_hdcp1_check_link(struct drm_hdcp_helper_data *data)
+{
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+	int ret;
+
+	if (data->funcs->hdcp1_check_link) {
+		ret = data->funcs->hdcp1_check_link(connector);
+		if (ret)
+			goto retry;
+	}
+
+	/* The link is checked differently for DP and HDMI */
+	if (data->aux) {
+		u8 bstatus;
+		ret = drm_hdcp_remote_dpcd_read(data->aux, DP_AUX_HDCP_BSTATUS,
+						&bstatus, 1);
+		if (ret) {
+			drm_err(dev, "Failed to read dpcd bstatus, %d\n", ret);
+			return ret;
+		}
+		if (bstatus & (DP_BSTATUS_LINK_FAILURE | DP_BSTATUS_REAUTH_REQ))
+			ret = -EINVAL;
+	} else {
+		ret = drm_hdcp_helper_hdcp1_validate_ri(data);
+		if (ret)
+			drm_err(dev,"Ri' mismatch, check failed (%d)\n", ret);
+	}
+	if (!ret)
+		return 0;
+
+retry:
+	drm_err(dev, "[%s:%d] HDCP link failed, retrying authentication\n",
+		connector->name, connector->base.id);
+
+	ret = data->funcs->hdcp1_disable(connector);
+	if (ret) {
+		drm_err(dev, "Failed to disable hdcp (%d)\n", ret);
+		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_DESIRED,
+				      true);
+		return ret;
+	}
+
+	ret = drm_hdcp_helper_hdcp1_enable(data);
+	if (ret) {
+		drm_err(dev, "Failed to enable hdcp (%d)\n", ret);
+		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_DESIRED,
+				      true);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int drm_hdcp_hdcp2_check_link(struct drm_hdcp_helper_data *data)
+{
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+	int ret;
+
+	ret = data->funcs->hdcp2_check_link(connector);
+	if (!ret)
+		return 0;
+
+	drm_err(dev, "[%s:%d] HDCP2 link failed, retrying authentication\n",
+		connector->name, connector->base.id);
+
+	ret = data->funcs->hdcp2_disable(connector);
+	if (ret) {
+		drm_err(dev, "Failed to disable hdcp2 (%d)\n", ret);
+		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_DESIRED,
+				      true);
+		return ret;
+	}
+
+	ret = data->funcs->hdcp2_enable(connector);
+	if (ret) {
+		drm_err(dev, "Failed to enable hdcp2 (%d)\n", ret);
+		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_DESIRED,
+				      true);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void drm_hdcp_helper_check_work(struct work_struct *work)
+{
+	struct drm_hdcp_helper_data *data = container_of(to_delayed_work(work),
+							 struct drm_hdcp_helper_data,
+							 check_work);
+	unsigned long check_link_interval;
+
+	mutex_lock(&data->mutex);
+	if (data->value != DRM_MODE_CONTENT_PROTECTION_ENABLED)
+		goto out_data_mutex;
+
+	drm_hdcp_helper_driver_lock(data);
+
+	if (data->enabled_type == DRM_MODE_HDCP_CONTENT_TYPE1) {
+		if (drm_hdcp_hdcp2_check_link(data))
+			goto out;
+		check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
+	} else {
+		if (drm_hdcp_hdcp1_check_link(data))
+			goto out;
+		check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
+	}
+	schedule_delayed_work(&data->check_work, check_link_interval);
+
+out:
+	drm_hdcp_helper_driver_unlock(data);
+out_data_mutex:
+	mutex_unlock(&data->mutex);
+}
+
+/**
+ * drm_hdcp_helper_schedule_hdcp_check - Schedule a check link cycle.
+ *
+ * @data: Pointer to the HDCP helper data.
+ *
+ * This function will kick off a check link cycle on behalf of the caller. This
+ * can be used by DP short hpd interrupt handlers, where the driver must poke
+ * the helper to check the link is still valid.
+ */
+void drm_hdcp_helper_schedule_hdcp_check(struct drm_hdcp_helper_data *data)
+{
+	schedule_delayed_work(&data->check_work, 0);
+}
+EXPORT_SYMBOL(drm_hdcp_helper_schedule_hdcp_check);
+
+static struct drm_hdcp_helper_data *
+drm_hdcp_helper_initialize(struct drm_connector *connector,
+			   const struct drm_hdcp_helper_funcs *funcs,
+			   bool attach_content_type_property)
+{
+	struct drm_hdcp_helper_data *out;
+	int ret;
+
+	out = kzalloc(sizeof(*out), GFP_KERNEL);
+	if (!out)
+		return ERR_PTR(-ENOMEM);
+
+	out->connector = connector;
+	out->funcs = funcs;
+
+	mutex_init(&out->mutex);
+	out->value = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
+
+	INIT_DELAYED_WORK(&out->check_work, drm_hdcp_helper_check_work);
+	INIT_WORK(&out->prop_work, drm_hdcp_helper_prop_work);
+
+	ret = drm_connector_attach_content_protection_property(connector,
+			attach_content_type_property);
+	if (ret) {
+		drm_hdcp_helper_destroy(out);
+		return ERR_PTR(ret);
+	}
+
+	return out;
+}
+
+/**
+ * drm_hdcp_helper_initialize_dp - Initializes the HDCP helpers for a
+ * DisplayPort connector
+ *
+ * @connector: pointer to the DisplayPort connector.
+ * @funcs: pointer to the vtable of HDCP helper funcs for this connector.
+ * @attach_content_type_property: True if the content_type property should be
+ * attached.
+ *
+ * This function intializes the HDCP helper for the given DisplayPort connector.
+ * This involves creating the Content Protection property as well as the Content
+ * Type property (if desired). Upon success, it will return a pointer to the
+ * HDCP helper data. Ownership of the underlaying memory is transfered to the
+ * caller and should be freed using drm_hdcp_helper_destroy().
+ *
+ * Returns:
+ * Pointer to newly created HDCP helper data. PTR_ERR on failure.
+ */
+struct drm_hdcp_helper_data *
+drm_hdcp_helper_initialize_dp(struct drm_connector *connector,
+			      struct drm_dp_aux *aux,
+			      const struct drm_hdcp_helper_funcs *funcs,
+			      bool attach_content_type_property)
+{
+	struct drm_hdcp_helper_data *out;
+
+	out = drm_hdcp_helper_initialize(connector, funcs,
+					 attach_content_type_property);
+	if (IS_ERR(out))
+		return out;
+
+	out->aux = aux;
+	out->hdcp1_lut = &drm_hdcp_hdcp1_dpcd_lut;
+
+	return out;
+}
+EXPORT_SYMBOL(drm_hdcp_helper_initialize_dp);
+
+/**
+ * drm_hdcp_helper_initialize_hdmi - Initializes the HDCP helpers for an HDMI
+ * connector
+ *
+ * @connector: pointer to the HDMI connector.
+ * @funcs: pointer to the vtable of HDCP helper funcs for this connector.
+ * @attach_content_type_property: True if the content_type property should be
+ * attached.
+ *
+ * This function intializes the HDCP helper for the given HDMI connector. This
+ * involves creating the Content Protection property as well as the Content Type
+ * property (if desired). Upon success, it will return a pointer to the HDCP
+ * helper data. Ownership of the underlaying memory is transfered to the caller
+ * and should be freed using drm_hdcp_helper_destroy().
+ *
+ * Returns:
+ * Pointer to newly created HDCP helper data. PTR_ERR on failure.
+ */
+struct drm_hdcp_helper_data *
+drm_hdcp_helper_initialize_hdmi(struct drm_connector *connector,
+				const struct drm_hdcp_helper_funcs *funcs,
+				bool attach_content_type_property)
+{
+	struct drm_hdcp_helper_data *out;
+
+	out = drm_hdcp_helper_initialize(connector, funcs,
+					 attach_content_type_property);
+	if (IS_ERR(out))
+		return out;
+
+	out->hdcp1_lut = &drm_hdcp_hdcp1_ddc_lut;
+
+	return out;
+}
+EXPORT_SYMBOL(drm_hdcp_helper_initialize_hdmi);
+
+/**
+ * drm_hdcp_helper_destroy - Destroys the given HDCP helper data.
+ *
+ * @data: Pointer to the HDCP helper data.
+ *
+ * This function cleans up and destroys the HDCP helper data created by
+ * drm_hdcp_helper_initialize_dp() or drm_hdcp_helper_initialize_hdmi().
+ */
+void drm_hdcp_helper_destroy(struct drm_hdcp_helper_data *data)
+{
+	struct drm_connector *connector;
+
+	if (!data)
+		return;
+
+	connector = data->connector;
+
+	/*
+	 * If the connector is registered, it's possible userspace could kick
+	 * off another HDCP enable, which would re-spawn the workers.
+	 */
+	drm_WARN_ON(connector->dev,
+		    connector->registration_state == DRM_CONNECTOR_REGISTERED);
+
+	/*
+	 * Now that the connector is not registered, check_work won't be run,
+	 * but cancel any outstanding instances of it
+	 */
+	cancel_delayed_work_sync(&data->check_work);
+
+	/*
+	 * We don't cancel prop_work in the same way as check_work since it
+	 * requires connection_mutex which could be held while calling this
+	 * function. Instead, we rely on the connector references grabbed before
+	 * scheduling prop_work to ensure the connector is alive when prop_work
+	 * is run. So if we're in the destroy path (which is where this
+	 * function should be called), we're "guaranteed" that prop_work is not
+	 * active (tl;dr This Should Never Happen).
+	 */
+	drm_WARN_ON(connector->dev, work_pending(&data->prop_work));
+
+	kfree(data);
+}
+EXPORT_SYMBOL(drm_hdcp_helper_destroy);
diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
index e6e3d16bc7d3..69c6405db5d1 100644
--- a/include/drm/drm_hdcp.h
+++ b/include/drm/drm_hdcp.h
@@ -36,6 +36,7 @@
 #define DRM_HDCP_DDC_BKSV			0x00
 #define DRM_HDCP_DDC_RI_PRIME			0x08
 #define DRM_HDCP_DDC_AKSV			0x10
+#define DRM_HDCP_DDC_AINFO			0x15
 #define DRM_HDCP_DDC_AN				0x18
 #define DRM_HDCP_DDC_V_PRIME(h)			(0x20 + h * 4)
 #define DRM_HDCP_DDC_BCAPS			0x40
@@ -295,6 +296,19 @@ struct drm_atomic_state;
 struct drm_device;
 struct drm_connector;
 
+struct drm_hdcp_ksv {
+	union {
+		u32 words[2];
+		u8 bytes[DRM_HDCP_KSV_LEN];
+	};
+};
+struct drm_hdcp_an {
+	union {
+		u32 words[2];
+		u8 bytes[DRM_HDCP_AN_LEN];
+	};
+};
+
 int drm_hdcp_check_ksvs_revoked(struct drm_device *dev,
 				u8 *ksvs, u32 ksv_count);
 int drm_connector_attach_content_protection_property(
@@ -303,9 +317,186 @@ void drm_hdcp_update_content_protection(struct drm_connector *connector,
 					u64 val);
 bool drm_hdcp_atomic_check(struct drm_connector *connector,
 			   struct drm_atomic_state *state);
+void drm_hdcp_atomic_commit(struct drm_atomic_state *state,
+			    struct drm_connector *connector);
 
 /* Content Type classification for HDCP2.2 vs others */
 #define DRM_MODE_HDCP_CONTENT_TYPE0		0
 #define DRM_MODE_HDCP_CONTENT_TYPE1		1
 
+/**
+ * struct drm_hdcp_helper_funcs - A vtable of function hooks for the hdcp helper
+ *
+ * These hooks are used by the hdcp helper to call into the driver/connector
+ * code to read/write to hw.
+ */
+struct drm_hdcp_helper_funcs {
+	/**
+	 * @setup - Performs driver-specific setup before hdcp is enabled
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*setup)(struct drm_connector *connector,
+		     struct drm_atomic_state *state);
+
+	/**
+	 * @are_keys_valid - Checks if the HDCP transmitter keys are valid
+	 *
+	 * Returns: true if the display controller has valid keys loaded
+	 */
+	bool (*are_keys_valid)(struct drm_connector *connector);
+
+	/**
+	 * @load_keys - Instructs the driver to load its HDCP transmitter keys
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*load_keys)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp2_capable - Checks if both source and sink support HDCP 2.x
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp2_capable)(struct drm_connector *connector, bool *capable);
+
+	/**
+	 * @hdcp2_enable - Enables HDCP 2.x on the specified connector
+	 *
+	 * Since we don't have multiple examples of HDCP 2.x enablement, we
+	 * provide the bare minimum support for HDCP 2.x help. Once we have
+	 * more examples, perhaps we can be more helpful.
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp2_enable)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp2_check_link - Checks the HDCP 2.x link on a specified connector
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp2_check_link)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp2_disable - Disables HDCP 2.x on the specified connector
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp2_disable)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp1_read_an_aksv - Reads transmitter's An & Aksv from hardware
+	 *
+	 * Use this function if hardware allows reading the transmitter's An and
+	 * Aksv values from the kernel. If your hardware will not allow this,
+	 * use hdcp1_send_an_aksv() and implement the transmission in the
+	 * driver.
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_read_an_aksv)(struct drm_connector *connector, u32 *an,
+				  u32 *aksv);
+
+	/**
+	 * @hdcp1_send_an_aksv - Sends transmitter's An & Aksv to the receiver
+	 *
+	 * Only implement this on hardware where An or Aksv are not accessible
+	 * from the kernel. If these values can be read, use
+	 * hdcp1_read_an_aksv() instead.
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_send_an_aksv)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp1_store_receiver_info - Stores the receiver's info in the transmitter
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_store_receiver_info)(struct drm_connector *connector,
+					 u32 *ksv, u32 status, u8 caps,
+					 bool repeater_present);
+
+	/**
+	 * @hdcp1_enable_encryption - Enables encryption of the outgoing signal
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_enable_encryption)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp1_wait_for_r0 - Wait for transmitter to calculate R0
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_wait_for_r0)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp1_match_ri - Matches the given Ri from the receiver with Ri in
+	 * the transmitter
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_match_ri)(struct drm_connector *connector, u32 ri_prime);
+
+	/**
+	 * @hdcp1_post_encryption - Allows the driver to confirm encryption and
+	 * perform any post-processing
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_post_encryption)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp1_store_ksv_fifo - Write the receiver's KSV list to transmitter
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_store_ksv_fifo)(struct drm_connector *connector,
+				    u8 *ksv_fifo, u8 num_downstream,
+				    u8 *bstatus, u32 *vprime);
+
+	/**
+	 * @hdcp1_check_link - Allows the driver to check the HDCP 1.x status
+	 * on a specified connector
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_check_link)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp1_disable - Disables HDCP 1.x on the specified connector
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_disable)(struct drm_connector *connector);
+};
+
+struct drm_hdcp_helper_data;
+struct drm_dp_aux;
+struct i2c_adapter;
+struct mutex;
+
+struct drm_hdcp_helper_data *
+drm_hdcp_helper_initialize_dp(struct drm_connector *connector,
+			      struct drm_dp_aux *aux,
+			      const struct drm_hdcp_helper_funcs *funcs,
+			      bool attach_content_type_property);
+
+struct drm_hdcp_helper_data *
+drm_hdcp_helper_initialize_hdmi(struct drm_connector *connector,
+				const struct drm_hdcp_helper_funcs *funcs,
+				bool attach_content_type_property);
+
+void drm_hdcp_helper_destroy(struct drm_hdcp_helper_data *data);
+
+int drm_hdcp_helper_hdcp1_capable(struct drm_hdcp_helper_data *data,
+				  bool *capable);
+void drm_hdcp_helper_atomic_commit(struct drm_hdcp_helper_data *data,
+				   struct drm_atomic_state *state,
+				   struct mutex *driver_mutex);
+
+void drm_hdcp_helper_schedule_hdcp_check(struct drm_hdcp_helper_data *data);
+
 #endif
-- 
Sean Paul, Software Engineer, Google / Chromium OS

