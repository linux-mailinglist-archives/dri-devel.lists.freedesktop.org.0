Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76667AEB4F0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 12:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A793410E9C7;
	Fri, 27 Jun 2025 10:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aZYnrqB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD7710E9C7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 10:34:08 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DgCD008739;
 Fri, 27 Jun 2025 10:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3qG4vDhN+pXvVkjr4GfQm6rnWkov+SX8y6P46nqvpMw=; b=aZYnrqB9nXrZRxCp
 EL7bATJ8bMFRY2w7fWle3V/BqZVqXILGN9CFC7Ab2fFJHo8KjYnXSmP5eFMTzMjz
 DffdJfX5SURIYXomVp6sjaxOTbi/C4VRyvmlNkb0bC2fLvA8uG9snm9liCJdToGe
 N7vhign3lOMmQwO8l+RRhJ1UiYjwfD7jgs0R7o80VLlix39wBkYeYjMy/PKLr7uX
 RsEhx3ZVvr0VOHs/U3DIu//WKt0pM3hPpEBRV0jnMle262xfvcb++i48iEQjpz+j
 UcJP+kgXcqBLDZ5ku74ykWG7mIgVmrTrjDC6sasAAfl7U7wPL4zbULxdHuU2kbTn
 vi7G6Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqvw74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 10:34:04 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RAY38r000354
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 10:34:03 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Jun 2025 03:34:00 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Ling Xu
 <quic_lxu5@quicinc.com>
Subject: [PATCH v4 4/4] misc: fastrpc: add support for gdsp remoteproc
Date: Fri, 27 Jun 2025 16:03:19 +0530
Message-ID: <20250627103319.2883613-5-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4qZbUDNaC49OtDFPDmTmBSXN2qgt2e27
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685e739c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=d01il73eTdEK0Eih25sA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4qZbUDNaC49OtDFPDmTmBSXN2qgt2e27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA4NSBTYWx0ZWRfX5NMSaEyfuXhg
 CpXOdmIeaBZ+oJkK9Ly5Z7Ik6CKEGQtabDl084/RlTehUA1p10MzycX9MaruCBplDTpsJl2wHCc
 //Cj/z1FNR9IJT76wIdd2keP1y1OZi/BOxLfTVSeuqdCXFKvOFPnY8n/uPXBqt/bEcHc8vtbwVm
 SsofQgfQg4C45TIfpf/8FDhzuc9p/X1WFAh/iLChFgpQAyfp7aGKdTvqyomtKfjTVZlagRU/uHs
 ZB0ruD70m6q1Rk9TUWBuLNTNuAoJ1g++6PuwSQLV+ZZQY9MNwCnE9ceVNwFwvzNV4EGllhLEd1k
 TrvuPmapTd7gDB+uUhnZRsbwoZTnptSBbEUVcfx0mjWQMZnMYDgEEpUJkntv93SlXFjjPUzcHpu
 3DB/i4Oc0TmlnO2BakT847bSZFl/mpdPpIDCKtlM6c+pgrPMTjGmtqvVtTtlCaBwgmJE6H+1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270085
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

The fastrpc driver has support for 5 types of remoteprocs. There are
some products which support GDSP remoteprocs. GDSP is General Purpose
DSP where tasks can be offloaded. This patch extends the driver to
support GDSP remoteprocs.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c      | 5 ++++-
 include/uapi/misc/fastrpc.h | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index cb9f4be286af..d3d9b9fdbf4c 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2245,6 +2245,8 @@ static int fastrpc_get_domain_id(const char *domain)
 		return MDSP_DOMAIN_ID;
 	else if (!strncmp(domain, "sdsp", 4))
 		return SDSP_DOMAIN_ID;
+	else if (!strncmp(domain, "gdsp", 4))
+		return GDSP_DOMAIN_ID;
 
 	return -EINVAL;
 }
@@ -2319,13 +2321,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
 	case SDSP_DOMAIN_ID:
-		/* Unsigned PD offloading is only supported on CDSP*/
+		/* Unsigned PD offloading is only supported on CDSP and GDSP*/
 		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
 		if (err)
 			goto err_free_data;
 		break;
 	case CDSP_DOMAIN_ID:
+	case GDSP_DOMAIN_ID:
 		data->unsigned_support = true;
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, data, true, domain);
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index b890f8042e86..5ea891615c49 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -22,8 +22,9 @@
 #define MDSP_DOMAIN_ID (1)
 #define SDSP_DOMAIN_ID (2)
 #define CDSP_DOMAIN_ID (3)
+#define GDSP_DOMAIN_ID (4)
 
-#define FASTRPC_DOMAIN_MAX    3
+#define FASTRPC_DOMAIN_MAX    4
 
 /**
  * enum fastrpc_map_flags - control flags for mapping memory on DSP user process
-- 
2.34.1

