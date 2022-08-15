Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C27C5935D7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 20:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4208D182D;
	Mon, 15 Aug 2022 18:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B84ED163A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:43:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FEqPCw019609;
 Mon, 15 Aug 2022 18:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=7k2KNNNcv1NlL20+H1Kb55Si1O03wQ/BH/0JPsdMe1M=;
 b=fgpmOyN4iBKm3QxlbLqnAJ530pD2Ri+yvSnxi654VPQZUFrleB+L+hpNY22sJkg1ndRE
 gtgLJxHBIJWRmNEecpCZG6NaRPG9KMJMPcxPh7GSQyiwKilmq957NhYfgnIdgDuEecBR
 JgZxWs30tqUOAT8ZiJhUOiPlgBABVBCDFaRhaa6/TI0Lkb4lMSVXzatC2+LFbfuGoASe
 Tg44Rqgg0WgP0uDrGhkyZY4eduYWDgP+SwZWO3Pm820dASXReU/h7y00hLkR0q0+fjZp
 pIR8MVUiW6y3Ez+pdco6d84aJYE16MWxtWeDS2YsYDPel9BOJq0D/1EG8MvfTNkJ3xWi GQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hx54sx0vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27FIhKge028382
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:20 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 15 Aug 2022 11:43:19 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [RFC PATCH 11/14] drm/qaic: Add telemetry
Date: Mon, 15 Aug 2022 12:42:33 -0600
Message-ID: <1660588956-24027-12-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
References: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0WJtV8Um0yZAVkBFlPcCuXx89O8AamUl
X-Proofpoint-ORIG-GUID: 0WJtV8Um0yZAVkBFlPcCuXx89O8AamUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208150070
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A QAIC device has a number of attributes like thermal limits which can be
read and in some cases, controlled from the host.  Expose these attributes
via hwmon.  Use the pre-defined interface where possible, but define
custom interfaces where it is not possible.

Change-Id: I3b559baed4016e27457658c9286f4c529f95dbbb
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/gpu/drm/qaic/qaic_telemetry.c | 851 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/qaic/qaic_telemetry.h |  14 +
 2 files changed, 865 insertions(+)
 create mode 100644 drivers/gpu/drm/qaic/qaic_telemetry.c
 create mode 100644 drivers/gpu/drm/qaic/qaic_telemetry.h

diff --git a/drivers/gpu/drm/qaic/qaic_telemetry.c b/drivers/gpu/drm/qaic/qaic_telemetry.c
new file mode 100644
index 0000000..44950d1
--- /dev/null
+++ b/drivers/gpu/drm/qaic/qaic_telemetry.c
@@ -0,0 +1,851 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <asm/byteorder.h>
+#include <linux/completion.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/kernel.h>
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/mhi.h>
+#include <linux/mutex.h>
+#include <linux/srcu.h>
+#include <linux/workqueue.h>
+
+#include "qaic.h"
+#include "qaic_telemetry.h"
+
+#if defined(CONFIG_QAIC_HWMON)
+
+#define MAGIC		0x55AA
+#define VERSION		0x1
+#define RESP_TIMEOUT	(1 * HZ)
+
+enum cmds {
+	CMD_THERMAL_SOC_TEMP,
+	CMD_THERMAL_SOC_MAX_TEMP,
+	CMD_THERMAL_BOARD_TEMP,
+	CMD_THERMAL_BOARD_MAX_TEMP,
+	CMD_THERMAL_DDR_TEMP,
+	CMD_THERMAL_WARNING_TEMP,
+	CMD_THERMAL_SHUTDOWN_TEMP,
+	CMD_CURRENT_TDP,
+	CMD_BOARD_POWER,
+	CMD_POWER_STATE,
+	CMD_POWER_MAX,
+	CMD_THROTTLE_PERCENT,
+	CMD_THROTTLE_TIME,
+	CMD_UPTIME,
+	CMD_THERMAL_SOC_FLOOR_TEMP,
+	CMD_THERMAL_SOC_CEILING_TEMP,
+};
+
+enum cmd_type {
+	TYPE_READ,  /* read value from device */
+	TYPE_WRITE, /* write value to device */
+};
+
+enum msg_type {
+	MSG_PUSH, /* async push from device */
+	MSG_REQ,  /* sync request to device */
+	MSG_RESP, /* sync response from device */
+};
+
+struct telemetry_data {
+	u8	cmd;
+	u8	cmd_type;
+	u8	status;
+	__le64	val; /*signed*/
+} __packed;
+
+struct telemetry_header {
+	__le16	magic;
+	__le16	ver;
+	__le32	seq_num;
+	u8	type;
+	u8	id;
+	__le16	len;
+} __packed;
+
+struct telemetry_msg { /* little endian encoded */
+	struct telemetry_header hdr;
+	struct telemetry_data data;
+} __packed;
+
+struct wrapper_msg {
+	struct kref ref_count;
+	struct telemetry_msg msg;
+};
+
+struct xfer_queue_elem {
+	/*
+	 * Node in list of ongoing transfer request on telemetry channel.
+	 * Maintained by root device struct
+	 */
+	struct list_head list;
+	/* Sequence number of this transfer request */
+	u32 seq_num;
+	/* This is used to wait on until completion of transfer request */
+	struct completion xfer_done;
+	/* Received data from device */
+	void *buf;
+};
+
+struct resp_work {
+	/* Work struct to schedule work coming on QAIC_TELEMETRY channel */
+	struct work_struct work;
+	/* Root struct of device, used to access device resources */
+	struct qaic_device *qdev;
+	/* Buffer used by MHI for transfer requests */
+	void *buf;
+};
+
+static void free_wrapper(struct kref *ref)
+{
+	struct wrapper_msg *wrapper = container_of(ref, struct wrapper_msg,
+						   ref_count);
+
+	kfree(wrapper);
+}
+
+static int telemetry_request(struct qaic_device *qdev, u8 cmd, u8 cmd_type,
+			     s64 *val)
+{
+	struct wrapper_msg *wrapper;
+	struct xfer_queue_elem elem;
+	struct telemetry_msg *resp;
+	struct telemetry_msg *req;
+	long ret = 0;
+
+	wrapper = kzalloc(sizeof(*wrapper), GFP_KERNEL);
+	if (!wrapper)
+		return -ENOMEM;
+
+	kref_init(&wrapper->ref_count);
+	req = &wrapper->msg;
+
+	ret = mutex_lock_interruptible(&qdev->tele_mutex);
+	if (ret)
+		goto free_req;
+
+	req->hdr.magic = cpu_to_le16(MAGIC);
+	req->hdr.ver = cpu_to_le16(VERSION);
+	req->hdr.seq_num = cpu_to_le32(qdev->tele_next_seq_num++);
+	req->hdr.type = MSG_REQ;
+	req->hdr.id = 0;
+	req->hdr.len = cpu_to_le16(sizeof(req->data));
+
+	req->data.cmd = cmd;
+	req->data.cmd_type = cmd_type;
+	req->data.status = 0;
+	if (cmd_type == TYPE_READ)
+		req->data.val = cpu_to_le64(0);
+	else
+		req->data.val = cpu_to_le64(*val);
+
+	elem.seq_num = qdev->tele_next_seq_num - 1;
+	elem.buf = NULL;
+	init_completion(&elem.xfer_done);
+	if (likely(!qdev->tele_lost_buf)) {
+		resp = kmalloc(sizeof(*resp), GFP_KERNEL);
+		if (!resp) {
+			mutex_unlock(&qdev->tele_mutex);
+			ret = -ENOMEM;
+			goto free_req;
+		}
+
+		ret = mhi_queue_buf(qdev->tele_ch, DMA_FROM_DEVICE,
+				    resp, sizeof(*resp), MHI_EOT);
+		if (ret) {
+			mutex_unlock(&qdev->tele_mutex);
+			goto free_resp;
+		}
+	} else {
+		/*
+		 * we lost a buffer because we queued a recv buf, but then
+		 * queuing the corresponding tx buf failed.  To try to avoid
+		 * a memory leak, lets reclaim it and use it for this
+		 * transaction.
+		 */
+		qdev->tele_lost_buf = false;
+	}
+
+	kref_get(&wrapper->ref_count);
+	ret = mhi_queue_buf(qdev->tele_ch, DMA_TO_DEVICE, req, sizeof(*req),
+			    MHI_EOT);
+	if (ret) {
+		qdev->tele_lost_buf = true;
+		kref_put(&wrapper->ref_count, free_wrapper);
+		mutex_unlock(&qdev->tele_mutex);
+		goto free_req;
+	}
+
+	list_add_tail(&elem.list, &qdev->tele_xfer_list);
+	mutex_unlock(&qdev->tele_mutex);
+
+	ret = wait_for_completion_interruptible_timeout(&elem.xfer_done,
+							RESP_TIMEOUT);
+	/*
+	 * not using _interruptable because we have to cleanup or we'll
+	 * likely cause memory corruption
+	 */
+	mutex_lock(&qdev->tele_mutex);
+	if (!list_empty(&elem.list))
+		list_del(&elem.list);
+	if (!ret && !elem.buf)
+		ret = -ETIMEDOUT;
+	else if (ret > 0 && !elem.buf)
+		ret = -EIO;
+	mutex_unlock(&qdev->tele_mutex);
+
+	resp = elem.buf;
+
+	if (ret < 0)
+		goto free_resp;
+
+	if (le16_to_cpu(resp->hdr.magic) != MAGIC ||
+	    le16_to_cpu(resp->hdr.ver) != VERSION ||
+	    resp->hdr.type != MSG_RESP ||
+	    resp->hdr.id != 0 ||
+	    le16_to_cpu(resp->hdr.len) != sizeof(resp->data) ||
+	    resp->data.cmd != cmd ||
+	    resp->data.cmd_type != cmd_type ||
+	    resp->data.status) {
+		ret = -EINVAL;
+		goto free_resp;
+	}
+
+	if (cmd_type == TYPE_READ)
+		*val = le64_to_cpu(resp->data.val);
+
+	ret = 0;
+
+free_resp:
+	kfree(resp);
+free_req:
+	kref_put(&wrapper->ref_count, free_wrapper);
+
+	return ret;
+}
+
+static ssize_t throttle_percent_show(struct device *dev,
+				     struct device_attribute *a, char *buf)
+{
+	struct qaic_device *qdev = dev_get_drvdata(dev);
+	s64 val = 0;
+	int rcu_id;
+	int ret;
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return -ENODEV;
+	}
+
+	ret = telemetry_request(qdev, CMD_THROTTLE_PERCENT, TYPE_READ, &val);
+
+	if (ret) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return ret;
+	}
+
+	/*
+	 * The percent the device performance is being throttled to meet
+	 * the limits.  IE performance is throttled 20% to meet power/thermal/
+	 * etc limits.
+	 */
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return sprintf(buf, "%lld\n", val);
+}
+
+static SENSOR_DEVICE_ATTR_RO(throttle_percent, throttle_percent, 0);
+
+static ssize_t throttle_time_show(struct device *dev,
+				  struct device_attribute *a, char *buf)
+{
+	struct qaic_device *qdev = dev_get_drvdata(dev);
+	s64 val = 0;
+	int rcu_id;
+	int ret;
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return -ENODEV;
+	}
+
+	ret = telemetry_request(qdev, CMD_THROTTLE_TIME, TYPE_READ, &val);
+
+	if (ret) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return ret;
+	}
+
+	/* The time, in seconds, the device has been in a throttled state */
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return sprintf(buf, "%lld\n", val);
+}
+
+static SENSOR_DEVICE_ATTR_RO(throttle_time, throttle_time, 0);
+
+static ssize_t power_level_show(struct device *dev, struct device_attribute *a,
+				char *buf)
+{
+	struct qaic_device *qdev = dev_get_drvdata(dev);
+	s64 val = 0;
+	int rcu_id;
+	int ret;
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return -ENODEV;
+	}
+
+	ret = telemetry_request(qdev, CMD_POWER_STATE, TYPE_READ, &val);
+
+	if (ret) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return ret;
+	}
+
+	/*
+	 * Power level the device is operating at.  What is the upper limit
+	 * it is allowed to consume.
+	 * 1 - full power
+	 * 2 - reduced power
+	 * 3 - minimal power
+	 */
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return sprintf(buf, "%lld\n", val);
+}
+
+static ssize_t power_level_store(struct device *dev, struct device_attribute *a,
+				 const char *buf, size_t count)
+{
+	struct qaic_device *qdev = dev_get_drvdata(dev);
+	int rcu_id;
+	s64 val;
+	int ret;
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return -ENODEV;
+	}
+
+	if (kstrtol(buf, 10, (long *)&val)) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return -EINVAL;
+	}
+
+	ret = telemetry_request(qdev, CMD_POWER_STATE, TYPE_WRITE, &val);
+
+	if (ret) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return ret;
+	}
+
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR_RW(power_level, power_level, 0);
+
+static struct attribute *power_attrs[] = {
+	&sensor_dev_attr_power_level.dev_attr.attr,
+	&sensor_dev_attr_throttle_percent.dev_attr.attr,
+	&sensor_dev_attr_throttle_time.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group power_group = {
+	.attrs = power_attrs,
+};
+
+static ssize_t uptime_show(struct device *dev,
+			   struct device_attribute *a, char *buf)
+{
+	struct qaic_device *qdev = dev_get_drvdata(dev);
+	s64 val = 0;
+	int rcu_id;
+	int ret;
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return -ENODEV;
+	}
+
+	ret = telemetry_request(qdev, CMD_UPTIME, TYPE_READ, &val);
+
+	if (ret) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return ret;
+	}
+
+	/* The time, in seconds, the device has been up */
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return sprintf(buf, "%lld\n", val);
+}
+
+static SENSOR_DEVICE_ATTR_RO(uptime, uptime, 0);
+
+static struct attribute *uptime_attrs[] = {
+	&sensor_dev_attr_uptime.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group uptime_group = {
+	.attrs = uptime_attrs,
+};
+
+static ssize_t soc_temp_floor_show(struct device *dev,
+				   struct device_attribute *a, char *buf)
+{
+	struct qaic_device *qdev = dev_get_drvdata(dev);
+	int rcu_id;
+	int ret;
+	s64 val;
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		ret = -ENODEV;
+		goto exit;
+	}
+
+	ret = telemetry_request(qdev, CMD_THERMAL_SOC_FLOOR_TEMP,
+				TYPE_READ, &val);
+	if (ret)
+		goto exit;
+
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return sprintf(buf, "%lld\n", val * 1000);
+
+exit:
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return ret;
+}
+
+static SENSOR_DEVICE_ATTR_RO(temp2_floor, soc_temp_floor, 0);
+
+static ssize_t soc_temp_ceiling_show(struct device *dev,
+				     struct device_attribute *a, char *buf)
+{
+	struct qaic_device *qdev = dev_get_drvdata(dev);
+	int rcu_id;
+	int ret;
+	s64 val;
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		ret = -ENODEV;
+		goto exit;
+	}
+
+	ret = telemetry_request(qdev, CMD_THERMAL_SOC_CEILING_TEMP,
+				TYPE_READ, &val);
+	if (ret)
+		goto exit;
+
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return sprintf(buf, "%lld\n", val * 1000);
+
+exit:
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return ret;
+}
+
+static SENSOR_DEVICE_ATTR_RO(temp2_ceiling, soc_temp_ceiling, 0);
+
+static struct attribute *temp2_attrs[] = {
+	&sensor_dev_attr_temp2_floor.dev_attr.attr,
+	&sensor_dev_attr_temp2_ceiling.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group temp2_group = {
+	.attrs = temp2_attrs,
+};
+
+static umode_t qaic_is_visible(const void *data, enum hwmon_sensor_types type,
+			       u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_max:
+			return 0644;
+		default:
+			return 0444;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			fallthrough;
+		case hwmon_temp_highest:
+			fallthrough;
+		case hwmon_temp_alarm:
+			return 0444;
+		case hwmon_temp_crit:
+			fallthrough;
+		case hwmon_temp_emergency:
+			return 0644;
+		}
+		break;
+	default:
+		return 0;
+	}
+	return 0;
+}
+
+static int qaic_read(struct device *dev, enum hwmon_sensor_types type,
+		     u32 attr, int channel, long *vall)
+{
+	struct qaic_device *qdev = dev_get_drvdata(dev);
+	int ret = -EOPNOTSUPP;
+	s64 val = 0;
+	int rcu_id;
+	u8 cmd;
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return -ENODEV;
+	}
+
+	switch (type) {
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_max:
+			ret = telemetry_request(qdev, CMD_CURRENT_TDP,
+						TYPE_READ, &val);
+			val *= 1000000;
+			goto exit;
+		case hwmon_power_input:
+			ret = telemetry_request(qdev, CMD_BOARD_POWER,
+						TYPE_READ, &val);
+			val *= 1000000;
+			goto exit;
+		default:
+			goto exit;
+		}
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_crit:
+			ret = telemetry_request(qdev, CMD_THERMAL_WARNING_TEMP,
+						TYPE_READ, &val);
+			val *= 1000;
+			goto exit;
+		case hwmon_temp_emergency:
+			ret = telemetry_request(qdev, CMD_THERMAL_SHUTDOWN_TEMP,
+						TYPE_READ, &val);
+			val *= 1000;
+			goto exit;
+		case hwmon_temp_alarm:
+			ret = telemetry_request(qdev, CMD_THERMAL_DDR_TEMP,
+						TYPE_READ, &val);
+			goto exit;
+		case hwmon_temp_input:
+			if (channel == 0)
+				cmd = CMD_THERMAL_BOARD_TEMP;
+			else if (channel == 1)
+				cmd = CMD_THERMAL_SOC_TEMP;
+			else
+				goto exit;
+			ret = telemetry_request(qdev, cmd, TYPE_READ, &val);
+			val *= 1000;
+			goto exit;
+		case hwmon_temp_highest:
+			if (channel == 0)
+				cmd = CMD_THERMAL_BOARD_MAX_TEMP;
+			else if (channel == 1)
+				cmd = CMD_THERMAL_SOC_MAX_TEMP;
+			else
+				goto exit;
+			ret = telemetry_request(qdev, cmd, TYPE_READ, &val);
+			val *= 1000;
+			goto exit;
+		default:
+			goto exit;
+		}
+	default:
+		goto exit;
+	}
+
+exit:
+	*vall = (long)val;
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return ret;
+}
+
+static int qaic_write(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long vall)
+{
+	struct qaic_device *qdev = dev_get_drvdata(dev);
+	int ret = -EOPNOTSUPP;
+	int rcu_id;
+	s64 val;
+
+	val = vall;
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return -ENODEV;
+	}
+
+	switch (type) {
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_max:
+			val /= 1000000;
+			ret = telemetry_request(qdev, CMD_CURRENT_TDP,
+						TYPE_WRITE, &val);
+			goto exit;
+		default:
+			goto exit;
+		}
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_crit:
+			val /= 1000;
+			ret = telemetry_request(qdev, CMD_THERMAL_WARNING_TEMP,
+						TYPE_WRITE, &val);
+			goto exit;
+		case hwmon_temp_emergency:
+			val /= 1000;
+			ret = telemetry_request(qdev, CMD_THERMAL_SHUTDOWN_TEMP,
+						TYPE_WRITE, &val);
+			goto exit;
+		default:
+			goto exit;
+		}
+	default:
+		goto exit;
+	}
+
+exit:
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return ret;
+}
+
+static const struct attribute_group *special_groups[] = {
+	&power_group,
+	&uptime_group,
+	&temp2_group,
+	NULL,
+};
+
+static const struct hwmon_ops qaic_ops = {
+	.is_visible = qaic_is_visible,
+	.read = qaic_read,
+	.write = qaic_write,
+};
+
+static const u32 qaic_config_temp[] = {
+	/* board level */
+	HWMON_T_INPUT | HWMON_T_HIGHEST,
+	/* SoC level */
+	HWMON_T_INPUT | HWMON_T_HIGHEST | HWMON_T_CRIT | HWMON_T_EMERGENCY,
+	/* DDR level */
+	HWMON_T_ALARM,
+	0
+};
+
+static const struct hwmon_channel_info qaic_temp = {
+	.type = hwmon_temp,
+	.config = qaic_config_temp,
+};
+
+static const u32 qaic_config_power[] = {
+	HWMON_P_INPUT | HWMON_P_MAX, /* board level */
+	0
+};
+
+static const struct hwmon_channel_info qaic_power = {
+	.type = hwmon_power,
+	.config = qaic_config_power,
+};
+
+static const struct hwmon_channel_info *qaic_info[] = {
+	&qaic_power,
+	&qaic_temp,
+	NULL
+};
+
+static const struct hwmon_chip_info qaic_chip_info = {
+	.ops = &qaic_ops,
+	.info = qaic_info
+};
+
+static int qaic_telemetry_mhi_probe(struct mhi_device *mhi_dev,
+				    const struct mhi_device_id *id)
+{
+	struct qaic_device *qdev;
+	int ret;
+
+	qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
+
+	dev_set_drvdata(&mhi_dev->dev, qdev);
+	qdev->tele_ch = mhi_dev;
+	qdev->tele_lost_buf = false;
+	ret = mhi_prepare_for_transfer(qdev->tele_ch);
+
+	if (ret)
+		return ret;
+
+	qdev->hwmon = hwmon_device_register_with_info(&qdev->pdev->dev, "qaic",
+						      qdev, &qaic_chip_info,
+						      special_groups);
+	if (!qdev->hwmon) {
+		mhi_unprepare_from_transfer(qdev->tele_ch);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static void qaic_telemetry_mhi_remove(struct mhi_device *mhi_dev)
+{
+	struct qaic_device *qdev;
+
+	qdev = dev_get_drvdata(&mhi_dev->dev);
+	hwmon_device_unregister(qdev->hwmon);
+	mhi_unprepare_from_transfer(qdev->tele_ch);
+	qdev->tele_ch = NULL;
+	qdev->hwmon = NULL;
+}
+
+static void resp_worker(struct work_struct *work)
+{
+	struct resp_work *resp = container_of(work, struct resp_work, work);
+	struct qaic_device *qdev = resp->qdev;
+	struct telemetry_msg *msg = resp->buf;
+	struct xfer_queue_elem *elem;
+	struct xfer_queue_elem *i;
+	bool found = false;
+
+	if (le16_to_cpu(msg->hdr.magic) != MAGIC) {
+		kfree(msg);
+		kfree(resp);
+		return;
+	}
+
+	mutex_lock(&qdev->tele_mutex);
+	list_for_each_entry_safe(elem, i, &qdev->tele_xfer_list, list) {
+		if (elem->seq_num == le32_to_cpu(msg->hdr.seq_num)) {
+			found = true;
+			list_del_init(&elem->list);
+			elem->buf = msg;
+			complete_all(&elem->xfer_done);
+			break;
+		}
+	}
+	mutex_unlock(&qdev->tele_mutex);
+
+	if (!found)
+		/* request must have timed out, drop packet */
+		kfree(msg);
+
+	kfree(resp);
+}
+
+static void qaic_telemetry_mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
+					  struct mhi_result *mhi_result)
+{
+	struct telemetry_msg *msg = mhi_result->buf_addr;
+	struct wrapper_msg *wrapper = container_of(msg, struct wrapper_msg,
+						   msg);
+
+	kref_put(&wrapper->ref_count, free_wrapper);
+}
+
+static void qaic_telemetry_mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
+					  struct mhi_result *mhi_result)
+{
+	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
+	struct telemetry_msg *msg = mhi_result->buf_addr;
+	struct resp_work *resp;
+
+	if (mhi_result->transaction_status) {
+		kfree(msg);
+		return;
+	}
+
+	resp = kmalloc(sizeof(*resp), GFP_ATOMIC);
+	if (!resp) {
+		pci_err(qdev->pdev, "dl_xfer_cb alloc fail, dropping message\n");
+		kfree(msg);
+		return;
+	}
+
+	INIT_WORK(&resp->work, resp_worker);
+	resp->qdev = qdev;
+	resp->buf = msg;
+	queue_work(qdev->tele_wq, &resp->work);
+}
+
+static const struct mhi_device_id qaic_telemetry_mhi_match_table[] = {
+	{ .chan = "QAIC_TELEMETRY", },
+	{},
+};
+
+static struct mhi_driver qaic_telemetry_mhi_driver = {
+	.id_table = qaic_telemetry_mhi_match_table,
+	.remove = qaic_telemetry_mhi_remove,
+	.probe = qaic_telemetry_mhi_probe,
+	.ul_xfer_cb = qaic_telemetry_mhi_ul_xfer_cb,
+	.dl_xfer_cb = qaic_telemetry_mhi_dl_xfer_cb,
+	.driver = {
+		.name = "qaic_telemetry",
+		.owner = THIS_MODULE,
+	},
+};
+
+void qaic_telemetry_register(void)
+{
+	int ret;
+
+	ret = mhi_driver_register(&qaic_telemetry_mhi_driver);
+	if (ret)
+		pr_debug("qaic: telemetry register failed %d\n", ret);
+}
+
+void qaic_telemetry_unregister(void)
+{
+	mhi_driver_unregister(&qaic_telemetry_mhi_driver);
+}
+
+void wake_all_telemetry(struct qaic_device *qdev)
+{
+	struct xfer_queue_elem *elem;
+	struct xfer_queue_elem *i;
+
+	mutex_lock(&qdev->tele_mutex);
+	list_for_each_entry_safe(elem, i, &qdev->tele_xfer_list, list) {
+		list_del_init(&elem->list);
+		complete_all(&elem->xfer_done);
+	}
+	qdev->tele_lost_buf = false;
+	mutex_unlock(&qdev->tele_mutex);
+}
+
+#else
+
+void qaic_telemetry_register(void)
+{
+}
+
+void qaic_telemetry_unregister(void)
+{
+}
+
+void wake_all_telemetry(struct qaic_device *qdev)
+{
+}
+
+#endif /* CONFIG_QAIC_HWMON */
diff --git a/drivers/gpu/drm/qaic/qaic_telemetry.h b/drivers/gpu/drm/qaic/qaic_telemetry.h
new file mode 100644
index 0000000..01e178f4
--- /dev/null
+++ b/drivers/gpu/drm/qaic/qaic_telemetry.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __QAIC_TELEMETRY_H__
+#define __QAIC_TELEMETRY_H__
+
+#include "qaic.h"
+
+void qaic_telemetry_register(void);
+void qaic_telemetry_unregister(void);
+void wake_all_telemetry(struct qaic_device *qdev);
+#endif /* __QAIC_TELEMETRY_H__ */
-- 
2.7.4

