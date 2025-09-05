Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0AEB458BA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 15:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A0510E362;
	Fri,  5 Sep 2025 13:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F66F10EBA1;
 Fri,  5 Sep 2025 13:24:39 +0000 (UTC)
X-UUID: ab7f0e948a5b11f0b29709d653e92f7d-20250905
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:4b2060ab-e5d6-4d05-9c5f-b1ce0c1d23cf, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6493067, CLOUDID:1052e2a43a89a6a3ff62207c016cfdeb,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ab7f0e948a5b11f0b29709d653e92f7d-20250905
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
 (envelope-from <zhangzihuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 659114040; Fri, 05 Sep 2025 21:24:37 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id D9FE4E008FA3;
 Fri,  5 Sep 2025 21:24:36 +0800 (CST)
X-ns-mid: postfix-68BAE494-7144943
Received: from localhost.localdomain (unknown [172.25.120.24])
 by mail.kylinos.cn (NSMail) with ESMTPA id 0A8E7E008FA7;
 Fri,  5 Sep 2025 21:24:32 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>
Cc: Ben Horgan <ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zihuan Zhang <zhangzihuan@kylinos.cn>
Subject: [PATCH v5 2/6] ACPI: processor: thermal: Use scope-based cleanup
 helper
Date: Fri,  5 Sep 2025 21:24:09 +0800
Message-Id: <20250905132413.1376220-3-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
annotation for policy references. This reduces the risk of reference
counting mistakes and aligns the code with the latest kernel style.

No functional change intended.

Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
---
 drivers/acpi/processor_thermal.c | 52 +++++++++++++++++---------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
index 1219adb11ab9..460713d1414a 100644
--- a/drivers/acpi/processor_thermal.c
+++ b/drivers/acpi/processor_thermal.c
@@ -62,19 +62,14 @@ static int phys_package_first_cpu(int cpu)
 	return 0;
 }
=20
-static int cpu_has_cpufreq(unsigned int cpu)
+static bool cpu_has_cpufreq(unsigned int cpu)
 {
-	struct cpufreq_policy *policy;
-
 	if (!acpi_processor_cpufreq_init)
 		return 0;
=20
-	policy =3D cpufreq_cpu_get(cpu);
-	if (policy) {
-		cpufreq_cpu_put(policy);
-		return 1;
-	}
-	return 0;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(cpu);
+
+	return policy !=3D NULL;
 }
=20
 static int cpufreq_get_max_state(unsigned int cpu)
@@ -93,12 +88,31 @@ static int cpufreq_get_cur_state(unsigned int cpu)
 	return reduction_step(cpu);
 }
=20
+static bool cpufreq_update_thermal_limit(unsigned int cpu, struct acpi_p=
rocessor *pr)
+{
+	unsigned long max_freq;
+	int ret;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(cpu);
+
+	if (!policy)
+		return false;
+
+	max_freq =3D (policy->cpuinfo.max_freq *
+		(100 - reduction_step(cpu) * cpufreq_thermal_reduction_pctg)) / 100;
+
+	ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
+	if (ret < 0) {
+		pr_warn("Failed to update thermal freq constraint: CPU%d (%d)\n",
+	  pr->id, ret);
+	}
+
+	return true;
+}
+
 static int cpufreq_set_cur_state(unsigned int cpu, int state)
 {
-	struct cpufreq_policy *policy;
 	struct acpi_processor *pr;
-	unsigned long max_freq;
-	int i, ret;
+	int i;
=20
 	if (!cpu_has_cpufreq(cpu))
 		return 0;
@@ -120,20 +134,8 @@ static int cpufreq_set_cur_state(unsigned int cpu, i=
nt state)
 		if (unlikely(!freq_qos_request_active(&pr->thermal_req)))
 			continue;
=20
-		policy =3D cpufreq_cpu_get(i);
-		if (!policy)
+		if (!cpufreq_update_thermal_limit(i, pr))
 			return -EINVAL;
-
-		max_freq =3D (policy->cpuinfo.max_freq *
-			    (100 - reduction_step(i) * cpufreq_thermal_reduction_pctg)) / 100=
;
-
-		cpufreq_cpu_put(policy);
-
-		ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
-		if (ret < 0) {
-			pr_warn("Failed to update thermal freq constraint: CPU%d (%d)\n",
-				pr->id, ret);
-		}
 	}
 	return 0;
 }
--=20
2.25.1

