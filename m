Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42ADB1D56E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 12:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2DF10E3DA;
	Thu,  7 Aug 2025 10:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GrqbdDJw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E6410E3DA
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 10:04:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779Cvaa018698;
 Thu, 7 Aug 2025 10:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7OHFuNXohkfV4ozRkN1gH5VFSe3G8oUlRlgFMpl9sQY=; b=GrqbdDJwDTK1N3kE
 RwT5KTcXGlBCy1IMQUbhy7THv5LYkNEWDDTaEZsQhsYZziHGsqGR1vCa+oOicpaR
 DfzyPIasKLXG9VdonCQogEfQdINsHDtaWTxfUxOwN222ZhdHKaWvSYkpqvLO40we
 VVx1GMjLp/65+xof9Zqqb6uP5UNre0uK3dTDNio4eVbT5kT+UKu2UPGBHcBCHJoc
 uQEsUpo3NS+dPmyg0Kv7GchvZoPdJA1Ma1sFLesweveB74KeM8kvZ5oJhD72/qZA
 uI+H0+CnNQghrKFEHnkN6MlGjb5G4FbBHYtg2ft21oRBiy8FZBpvGnrA9DcFkoKk
 TrrC/Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8dvr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Aug 2025 10:04:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577A4i6K018037
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 7 Aug 2025 10:04:44 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 7 Aug 2025 03:04:41 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <thierry.escande@linaro.org>,
 <quic_vgattupa@quicinc.com>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>,
 <stable@kernel.org>
Subject: [PATCH v3 2/4] misc: fastrpc: Fix fastrpc_map_lookup operation
Date: Thu, 7 Aug 2025 15:34:18 +0530
Message-ID: <20250807100420.1163967-3-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
References: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6ex-ptwocF3JcTL_cMtIiMXIn5P6mLAb
X-Proofpoint-ORIG-GUID: 6ex-ptwocF3JcTL_cMtIiMXIn5P6mLAb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXyid30ATBYr5Q
 Ip0pb6tC5mlpo543kE2MpfzbYS7tuxeJD/pjKOWOV7mNCyyiA1xNghUba9muMCgKBDdyiv8SnTr
 sxUs7a0ACGYhi43f1b6DOaCUR7kE6Y3O4FStJXzxTQS2d6xMWjEBJnp56Wrr9LEZBk8g/DmgKaq
 4/YoFloA11OgRcLAO2ncaf8QFsokvjYvhWk7e1DBdZQGe0Gmt7wcIG1374UETiOzB/aXB3ozH3k
 I+uzy2FcCQpgUG5jri17/4o9uL7ZicUYWZ58imja48sf0MXiuSJrL7DX7o+9tBf7pDNK6Wv7WOE
 msbFygncPh+Qgmp3IAbapqUC512OhcxNKQuyB40H7ajlp/1hdrCJPOXqxsXTFqSQeaf/pM78G1z
 zGlez41U
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=68947a3d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=Gfd6DxS6oenDwON9uhEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

Fastrpc driver creates maps for user allocated fd buffers. Before
creating a new map, the map list is checked for any already existing
maps using map fd. Checking with just map fd is not sufficient as the
user can pass offsetted buffer with less size when the map is created
and then a larger size the next time which could result in memory
issues. Check for dma_buf object also when looking up for the map.

Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 52571916acd4..1815b1e0c607 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -367,11 +367,16 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 {
 	struct fastrpc_session_ctx *sess = fl->sctx;
 	struct fastrpc_map *map = NULL;
+	struct dma_buf *buf;
 	int ret = -ENOENT;
 
+	buf = dma_buf_get(fd);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
 	spin_lock(&fl->lock);
 	list_for_each_entry(map, &fl->maps, node) {
-		if (map->fd != fd)
+		if (map->fd != fd || map->buf != buf)
 			continue;
 
 		if (take_ref) {
-- 
2.34.1

