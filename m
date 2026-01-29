Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNUNFFimemnF8wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:14:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C2AA242
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4874010E783;
	Thu, 29 Jan 2026 00:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbP7kU0z";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8SZPktv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F88B10E783
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:12 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SI31c71750531
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=OfaylnNGhIk
 IHTKate/d8zrf3cT86hekrNWW7NaHpDc=; b=YbP7kU0zuSe6B+DhpFRyASXT2sZ
 ujd0+OGIhF6hKV2c83JpFgRtRLrUoMbJYl+W68lG3nrAiA0NrA/h6EEy/TaKaWvU
 963TkcOdyfOWhYL+aeetAvpr8WVvzGBCaVmnaHhDA9hyV4NT7Z4rkK26mPjT482j
 MbARou1+lN9n3SF6lWiExp4+qPnvwqwqZW3z5JnBRGVRlIEJhy3ktr2KgftPeiDX
 HnFyCh51SvA5qYPTCgY9/3J95lYT5eDC+x7iEgtM3oNzAzw04YqDPAL0PM/EISmR
 x8F5mhPGKCwkgi4VgMnpWjNeqETAuoGwFz3kROUDAoHZcTd61+qSlcD7lGw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byhsjadf1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a07fa318fdso3257425ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 16:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769645651; x=1770250451;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OfaylnNGhIkIHTKate/d8zrf3cT86hekrNWW7NaHpDc=;
 b=h8SZPktvHjMRwApAv4ZIfNFHHGW97gzB7UU9fEOJkdHxzP07FG0CZM2oxHsnfUxrS3
 8Q3nnsq1+7UagsnBMSsIhTohhsnjZ2oIk/bwWAalzHkOqHumB0Fp8Iz97a17aLN4mZDK
 ZdJz8AkdcqLYpoCndiW2Z6COpeRdwfQ0znRnmiv+v8wOq40ijm6FSyaVvkhJfvPNjnnx
 W9f3e2hdEP8a+DhGhpaUiFwN/aOQNs08pBzUmdeXRtFgztpWAydHviq0frp/Rv7ICqDL
 +6HLSF4BNqP+U0YuK6wfWfHv+1t4dj70HNo4TTY8U3fjlLx0gS8ju0zqCgRhfB+9VtLK
 fh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769645651; x=1770250451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OfaylnNGhIkIHTKate/d8zrf3cT86hekrNWW7NaHpDc=;
 b=GTSEbzsIyzABQPLXP8h1f7+g2JZm3Y0YYThpKN3I/QrA899igT/lI9nh0pgZQuqnES
 19fEsrmEL54VX3zgm8DAkAR10ydbXSEg6cytizT4ebZ+eVjaeUHWkXHI0n8KHlXMcFlz
 6xuLNbZi4q++PsNpDNiXV5VVLXaZ58Ux9LKUDcXzOmGaksEqSEWxLo0Ug7jIUq7idXU/
 YFRL3SNYBIOODNLX+63CDwyTcBtnnElmGQaeYFba5iImL/AvrCN5sHFlhvRsV509hQpf
 wj+ayCNXyN/GVyTdku0BGDVJznSX58vfNPjde0rpptPiTq0m+08n9mhjBNnvOCQrUb0a
 HJLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj73Yh+0Kagk2mDp8PSgzbbzIzJY0ToLo5qWEuC4QMYYF7xtO1azxIkdTkbdx7o42uCURd5ojc8VY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbrK2yExFmemUx5MIyZsbkNL1+vuO/X1s1GR9f9RvfUQQbtbeA
 x3CXDoQ+4tRUIrjsgc6FVDHX6Oxkki+1w1TDPQPk7Pe8nZ2C32U7wWf7F4ZGy9HjqvVjr/SLMfo
 Mq1N6rkszlK5BFgPdYrOS+stxpQzdhtQqTU07+o+hmnBmLNkOeQx1yjlNF0tEcR9aG6ph3m8=
X-Gm-Gg: AZuq6aIumc+xxtG3GyrsrUN5nX4975/e1wMmYkY8Z84+0HFGN/0n71xI4SU/uhQ/bz+
 Wr7tit1MuQ2YNinALNNVDjgs01ZNUVHBwCUJPAndJUk9naoKusxEiLb/EtiLBGr5EO7Thj4y0CF
 qE/AUllbnzQYoK+9gnB71WgI5QaDHjiqyUDV2EQa+TMrDcElxGPC8RjLll+f18mED/viPBd3V0Z
 74birk2cF9G6Ur8YUVK57qRIudORKSRGIp0MaaoIGxw59XGY6C+V6Ekqx+HNUmHuyusIBkun1GX
 8KGxj5zh7G+GcWzF0oka1Am1lmd4TzxvxkkkYd1QV1Qo3Fz4giauo5+g9AJNlmSHEGm1fciaKMz
 GNsfvH7W7F+T4vCGw+BWA+95EsZxd/IlAP2k8VJNglYYHKdSLd74cGe6JokSQCsU6KEBTbLsl2m
 mbLWUxEax788+sX/drEqP+IpZy
X-Received: by 2002:a17:903:2291:b0:28e:a70f:e879 with SMTP id
 d9443c01a7336-2a870d49b23mr58323285ad.1.1769645651369; 
 Wed, 28 Jan 2026 16:14:11 -0800 (PST)
X-Received: by 2002:a17:903:2291:b0:28e:a70f:e879 with SMTP id
 d9443c01a7336-2a870d49b23mr58323005ad.1.1769645650899; 
 Wed, 28 Jan 2026 16:14:10 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c3b29sm32055845ad.54.2026.01.28.16.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 16:14:10 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH V3 1/5] dt-bindings: remoteproc: qcom,
 sm8550-pas: Add Glymur ADSP
Date: Thu, 29 Jan 2026 05:43:54 +0530
Message-Id: <20260129001358.770053-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m2tTfkMnRY_o4RbQmZmnN7jDNgDl72EV
X-Authority-Analysis: v=2.4 cv=GbMaXAXL c=1 sm=1 tr=0 ts=697aa654 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=I8BSNejkaQ8d0caDSfYA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: m2tTfkMnRY_o4RbQmZmnN7jDNgDl72EV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDIwMCBTYWx0ZWRfX7b6L9qglt4yA
 hdA84/Uol4twvgT/LjQnf9uQIL1y65C8uRXNq2Sw8MR3vuKMzsSaEYQ731gNzPSLDqpFttu6twZ
 xB+nd5uyzrSrayxjcbsCsen/RFLHI3gxVAiB9kWwh/4iOCB6brNSSrm71960uyALgqEYtpoaz+R
 cFOVLFREiaUT50e4vGsV11+e4ooQtfkIZPANMEsH0oryciGJZUrE7oB5ZZa+BxzX3NrB6gXNuAA
 K3EgoEfdVdDuhOjGhv/OhcBaO7AZgsxJQ+7jzDPCccLFr4PACRJSv47WIpG5T/HMF7UwpUG1Yf2
 Ol1zEVSGA2R6qrfqDW/gZ6BivDGuhMmIUuPGC8pwvcTMoBh4z8KBpaBCW4G2SkW8pmA2SMri15H
 zQAcW9EKt+pZX8TXP+yni7/9FhDYf4EpQI3s7gjRRPjxO+wRrd1t/Z5OC1HN7Q21Gts3f3e4THh
 Dbiuw/lEqIkz/5b2w0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280200
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US]
X-Rspamd-Queue-Id: DA8C2AA242
X-Rspamd-Action: no action

Document compatible for Qualcomm Glymur ADSP PAS which is fully
compatible with Qualcomm Kaanapali ADSP PAS.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
  iommus properties are left optional.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index b117c82b057b..fb6e0b4f54e8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,x1e80100-cdsp-pas
       - items:
           - enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
@@ -101,6 +102,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.34.1

