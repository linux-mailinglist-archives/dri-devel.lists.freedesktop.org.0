Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E87664DD78
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 16:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1738810E153;
	Thu, 15 Dec 2022 15:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3007310E0E4;
 Thu, 15 Dec 2022 15:11:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFAjkI2018902; Thu, 15 Dec 2022 15:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=NQjuWdRJhlzvQflQiWmSjH+nZpjlOK16M6kbc7ZMIv4=;
 b=MjYlOQcCGoJhiESaeavfM6gxfW7Xn+jK53Jip20RGxsTMbT2NB6HQJ7rZ/YSWWVW3ymW
 0tOj1sRiZIs/gBWRB2H8bow0imZ3sNiCN7s0zMosGe9LO26sIog4JRoDESqNvYc4Mzap
 Z9SfllnVXZxM5IVCLQ6kE/azQFIX2VU+DfmU6CSMRPkdpy4sA4qLpgOTorfQQ6jMotWy
 yDfjtFmaE5afTbGwNgDbJgVK7wemFS4+d7+n6YSvyphYjxazxb9lx+KeRWvYqysd0GO9
 R2pTak/MfSb1ba0qN0Jn99NcGq3VXwfiyZDLjnfFcVcohJatE0kydL6KrrKxl7aOVz18 tw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mfukhstj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 15:11:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BFFBSss012483
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 15:11:28 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 15 Dec 2022 07:11:24 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH 1/5] PM: domains: Allow a genpd consumer to require a synced
 power off
Date: Thu, 15 Dec 2022 20:40:57 +0530
Message-ID: <20221215203751.1.I3e6b1f078ad0f1ca9358c573daa7b70ec132cdbe@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671117062-26276-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1671117062-26276-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3ozT3s2LygexvKrtlfkWG3Is6S-kalNQ
X-Proofpoint-ORIG-GUID: 3ozT3s2LygexvKrtlfkWG3Is6S-kalNQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_08,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=602 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212150123
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
Cc: Len Brown <len.brown@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ulf Hansson <ulf.hansson@linaro.org>

Some genpd providers doesn't ensure that it has turned off at hardware.
This is fine until the consumer really requires during some special
scenarios that the power domain collapse at hardware before it is
turned ON again.

An example is the reset sequence of Adreno GPU which requires that the
'gpucc cx gdsc' power domain should move to OFF state in hardware at
least once before turning in ON again to clear the internal state.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
@Ulf, I took the liberty to cleanup and post your patch.

 drivers/base/power/domain.c | 23 +++++++++++++++++++++++
 include/linux/pm_domain.h   |  5 +++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 967bcf9d415e..4fa624218967 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -519,6 +519,28 @@ ktime_t dev_pm_genpd_get_next_hrtimer(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(dev_pm_genpd_get_next_hrtimer);
 
+/*
+ * dev_pm_genpd_synced_poweroff - Next power off should be synchronous
+ *
+ * @dev: A device that is attached to the genpd.
+ *
+ * Allows a consumer of the genpd to notify the provider that the next power off
+ * should be synchronous.
+ */
+void dev_pm_genpd_synced_poweroff(struct device *dev)
+{
+	struct generic_pm_domain *genpd;
+
+	genpd = dev_to_genpd_safe(dev);
+	if (!genpd)
+		return;
+
+	genpd_lock(genpd);
+		genpd->synced_poweroff = true;
+	genpd_unlock(genpd);
+}
+EXPORT_SYMBOL_GPL(dev_pm_genpd_synced_poweroff);
+
 static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 {
 	unsigned int state_idx = genpd->state_idx;
@@ -562,6 +584,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 
 out:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
+	genpd->synced_poweroff = false;
 	return 0;
 err:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 1cd41bdf73cf..f776fb93eaa0 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -136,6 +136,7 @@ struct generic_pm_domain {
 	unsigned int prepared_count;	/* Suspend counter of prepared devices */
 	unsigned int performance_state;	/* Aggregated max performance state */
 	cpumask_var_t cpus;		/* A cpumask of the attached CPUs */
+	bool synced_poweroff;		/* A consumer needs a synced poweroff */
 	int (*power_off)(struct generic_pm_domain *domain);
 	int (*power_on)(struct generic_pm_domain *domain);
 	struct raw_notifier_head power_notifiers; /* Power on/off notifiers */
@@ -235,6 +236,7 @@ int dev_pm_genpd_add_notifier(struct device *dev, struct notifier_block *nb);
 int dev_pm_genpd_remove_notifier(struct device *dev);
 void dev_pm_genpd_set_next_wakeup(struct device *dev, ktime_t next);
 ktime_t dev_pm_genpd_get_next_hrtimer(struct device *dev);
+void dev_pm_genpd_synced_poweroff(struct device *dev);
 
 extern struct dev_power_governor simple_qos_governor;
 extern struct dev_power_governor pm_domain_always_on_gov;
@@ -300,6 +302,9 @@ static inline ktime_t dev_pm_genpd_get_next_hrtimer(struct device *dev)
 {
 	return KTIME_MAX;
 }
+static inline void dev_pm_genpd_synced_poweroff(struct device *dev)
+{ }
+
 #define simple_qos_governor		(*(struct dev_power_governor *)(NULL))
 #define pm_domain_always_on_gov		(*(struct dev_power_governor *)(NULL))
 #endif
-- 
2.7.4

