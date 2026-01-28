Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DQ8FMX3eWkE1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:49:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0219EA0CDB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB6210E6AA;
	Wed, 28 Jan 2026 11:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="enIz24sj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DA410E2A2;
 Wed, 28 Jan 2026 11:49:18 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60S927XG3920922; Wed, 28 Jan 2026 11:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ggu29vCh8FG
 9BLQ+55eQDuvMFV8G4ZMF0zOOXZqB8eA=; b=enIz24sje0UCqEf/yFT4i+8ZZSp
 +JebnJ2/cgZbo18neaXwZ9xDVw5Ds7fWPvlFWrngJJlLt+Ljcp7OFs7PMn/VEnfR
 SGArdjBxb7MO+saTX5riYywmK2Ir2HzDKZZW8eUEgB/MXUpTG9wfCenfRu0y5sZs
 geD0Qj+p9JOXEFS2hgZRn6CcOFT3oqloxnIfG1gfBHod2CE/S508T6E2sWEiCyRO
 9yrKZlt9dSsMb2R5nkunyTaCWbxdwC4hTz1C9+ilsQ5hVlZq9wanl597t/rQsyZR
 f6Huoqa3Z2aEi095n6t9GchdYXY/5jZEfgUq4R8z0k++E5jR835THQJvyGA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by211b6aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jan 2026 11:49:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60SBn5Xv004217; 
 Wed, 28 Jan 2026 11:49:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bvq5mgshy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jan 2026 11:49:05 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60SBn5dK004096;
 Wed, 28 Jan 2026 11:49:05 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-riteshk-hyd.qualcomm.com
 [10.213.102.118])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60SBn47D004087
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jan 2026 11:49:05 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2314801)
 id 3D28F5E6; Wed, 28 Jan 2026 17:19:04 +0530 (+0530)
From: Ritesh Kumar <quic_riteshk@quicinc.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_mahap@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 mani@kernel.org, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com, vkoul@kernel.org, kishon@kernel.org,
 cros-qcom-dts-watchers@chromium.org
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: [PATCH v4 2/2] arm64: dts: qcom: lemans: Add eDP ref clock for eDP
 PHYs
Date: Wed, 28 Jan 2026 17:18:50 +0530
Message-ID: <20260128114853.2543416-3-quic_riteshk@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
References: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NyBTYWx0ZWRfXxpI0GbnxZH4g
 Ev26p7QuIa7NHS40L8AhWzcLMpfySFik1imRaDWK5ZaUhJrAocm+4IrKxwnRsC5jsemzFawsvxS
 vxOy0mY04PsGZfLwE8vAk8XAvj5pwJtDo2pm/CYNAgn4DKXeBbd0pIEc/rIPagoNo31V88hH7RB
 H9I3jXnchC6ivORa9b37sQ16B0mjyWcM71Ht3xi+nyT/WfSXnpvMNCKlpUR2/J3qiNgaZFf+RyC
 EqYyUBya2g4cDQ1rubYWXA/l7s8f44pbfuzE1z/aRglnCT2hf13QYAzA2irxKRTtitjQfVBloDl
 rorxz1M9A8Y0zoABf1DEO+KDjvebZPgAFJNel8q/b4DXGnn22hZbTrxXHvbaUUTVCb9kkDklGp5
 qqpvwSeHdvMZrMx8l3j5w8cmaPerSLnDPRZrxfHNyGD8P84uH5dr44L0QwpYQbzIsJhDLVpKuGE
 5lmtJGg+WpWR7xiL9bg==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=6979f7b5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=E4RoOgRz3FB8a9Rhpw4A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Wl9CNz26fesAUw8OndlCOmQoK3naGOVa
X-Proofpoint-ORIG-GUID: Wl9CNz26fesAUw8OndlCOmQoK3naGOVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280097
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,quicinc.com,HansenPartnership.com,oracle.com,chromium.org];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_riteshk@quicinc.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,aec2a00:email,quicinc.com:email,quicinc.com:dkim,quicinc.com:mid];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0219EA0CDB
X-Rspamd-Action: no action

The eDP PHY nodes on lemans were missing the reference clock voting.
This initially went unnoticed because the clock was implicitly enabled
by the UFS PHY driver, and the eDP PHY happened to rely on that.

After commit 77d2fa54a945 ("scsi: ufs: qcom : Refactor phy_power_on/off
calls"), the UFS driver no longer keeps the reference clock enabled.
As a result, the eDP PHY fails to power on.

To fix this, add eDP reference clock for eDP PHYs on lemans chipset
ensuring reference clock is enabled.

Fixes: e1e3e5673f8d7 ("arm64: dts: qcom: sa8775p: add DisplayPort device nodes")
Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..1da8e7fb6775 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5301,9 +5301,11 @@ mdss0_dp0_phy: phy@aec2a00 {
 				      <0x0 0x0aec2000 0x0 0x1c8>;
 
 				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
+					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_EDP_REF_CLKREF_EN>;
 				clock-names = "aux",
-					      "cfg_ahb";
+					      "cfg_ahb",
+					      "ref";
 
 				#clock-cells = <1>;
 				#phy-cells = <0>;
@@ -5320,9 +5322,11 @@ mdss0_dp1_phy: phy@aec5a00 {
 				      <0x0 0x0aec5000 0x0 0x1c8>;
 
 				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
+					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_EDP_REF_CLKREF_EN>;
 				clock-names = "aux",
-					      "cfg_ahb";
+					      "cfg_ahb",
+					      "ref";
 
 				#clock-cells = <1>;
 				#phy-cells = <0>;
-- 
2.34.1

