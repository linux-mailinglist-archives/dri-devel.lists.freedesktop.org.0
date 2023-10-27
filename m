Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 966507D9E29
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB1410EA11;
	Fri, 27 Oct 2023 16:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC2C10EA11
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 16:43:51 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39REtS4B032638; Fri, 27 Oct 2023 16:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=8YPYWewxQbEoKY4+wrG3HyIVS4WWvA14E4opq2OfV8U=;
 b=Ata+gppadUCE74WlPD4kSXTvXFDD424HtqgKSa1pLrlXToz3q5zZbOmj2ethX5LdzRI6
 +1xQ3Q0AsUtJ3n1m/5lTjyNDoztV9JvokldYahssvSzvf1K/4Y6Whiojpe/fjJZZn3PO
 SR7Lv9K/u/btsAoG/hfFLwV2WZuDhYfClKdSblJ3OgH7npgQY+Rqto7kKpBt2wYtDP+6
 tccWBlS+MDN34Lr/oItTie38818VYzDAEb229wO3G/MY+IKnYA77JtJzkbDTJHXWwOor
 dZPs8/ec/BnXY/wX7rFyWxxXBiuecNm+r0dk4OBPp04uvC3ZkugkF/cx88DgbHJrvdTx 8Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tyxbx2mth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 16:43:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RGhj9v023785
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 16:43:45 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 27 Oct 2023 09:43:44 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
Subject: [PATCH] accel/qaic: Support for 0 resize slice execution in BO
Date: Fri, 27 Oct 2023 10:43:30 -0600
Message-ID: <20231027164330.11978-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HHTu_5XXjE3NwRf93oNCPh71DndQmujS
X-Proofpoint-GUID: HHTu_5XXjE3NwRf93oNCPh71DndQmujS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_15,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310270144
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
Cc: linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Add support to partially execute a slice which is resized to zero.
Executing a zero size slice in a BO should mean that there is no DMA
transfers involved but you should still configure doorbell and semaphores.

For example consider a BO of size 18K and it is sliced into 3 6K slices
and user calls partial execute ioctl with resize as 10K.
slice 0 - size is 6k and offset is 0, so resize of 10K will not cut short
          this slice hence we send the entire slice for execution.
slice 1 - size is 6k and offset is 6k, so resize of 10K will cut short this
          slice and only the first 4k should be DMA along with configuring
          doorbell and semaphores.
slice 2 - size is 6k and offset is 12k, so resize of 10k will cut short
          this slice and no DMA transfer would be involved but we should
          would configure doorbell and semaphores.

This change begs to change the behavior of 0 resize. Currently, 0 resize
partial execute ioctl behaves exactly like execute ioctl i.e. no resize.
After this patch all the slice in BO should behave exactly like slice 2 in
above example.

Refactor copy_partial_exec_reqs() to make it more readable and less
complex.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---

Userspace specifically requested this change in uAPI.

 drivers/accel/qaic/qaic_data.c | 104 ++++++++++++++-------------------
 include/uapi/drm/qaic_accel.h  |   5 +-
 2 files changed, 46 insertions(+), 63 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index ebc3cca1b094..8da81768f2ab 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -51,6 +51,7 @@
 		})
 #define NUM_EVENTS	128
 #define NUM_DELAYS	10
+#define fifo_at(base, offset) ((base) + (offset) * get_dbc_req_elem_size())
 
 static unsigned int wait_exec_default_timeout_ms = 5000; /* 5 sec default */
 module_param(wait_exec_default_timeout_ms, uint, 0600);
@@ -1058,6 +1059,16 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	return ret;
 }
 
+static inline u32 fifo_space_avail(u32 head, u32 tail, u32 q_size)
+{
+	u32 avail = head - tail - 1;
+
+	if (head <= tail)
+		avail += q_size;
+
+	return avail;
+}
+
 static inline int copy_exec_reqs(struct qaic_device *qdev, struct bo_slice *slice, u32 dbc_id,
 				 u32 head, u32 *ptail)
 {
@@ -1066,27 +1077,20 @@ static inline int copy_exec_reqs(struct qaic_device *qdev, struct bo_slice *slic
 	u32 tail = *ptail;
 	u32 avail;
 
-	avail = head - tail;
-	if (head <= tail)
-		avail += dbc->nelem;
-
-	--avail;
-
+	avail = fifo_space_avail(head, tail, dbc->nelem);
 	if (avail < slice->nents)
 		return -EAGAIN;
 
 	if (tail + slice->nents > dbc->nelem) {
 		avail = dbc->nelem - tail;
 		avail = min_t(u32, avail, slice->nents);
-		memcpy(dbc->req_q_base + tail * get_dbc_req_elem_size(), reqs,
-		       sizeof(*reqs) * avail);
+		memcpy(fifo_at(dbc->req_q_base, tail), reqs, sizeof(*reqs) * avail);
 		reqs += avail;
 		avail = slice->nents - avail;
 		if (avail)
 			memcpy(dbc->req_q_base, reqs, sizeof(*reqs) * avail);
 	} else {
-		memcpy(dbc->req_q_base + tail * get_dbc_req_elem_size(), reqs,
-		       sizeof(*reqs) * slice->nents);
+		memcpy(fifo_at(dbc->req_q_base, tail), reqs, sizeof(*reqs) * slice->nents);
 	}
 
 	*ptail = (tail + slice->nents) % dbc->nelem;
@@ -1094,46 +1098,31 @@ static inline int copy_exec_reqs(struct qaic_device *qdev, struct bo_slice *slic
 	return 0;
 }
 
-/*
- * Based on the value of resize we may only need to transmit first_n
- * entries and the last entry, with last_bytes to send from the last entry.
- * Note that first_n could be 0.
- */
 static inline int copy_partial_exec_reqs(struct qaic_device *qdev, struct bo_slice *slice,
-					 u64 resize, u32 dbc_id, u32 head, u32 *ptail)
+					 u64 resize, struct dma_bridge_chan *dbc, u32 head,
+					 u32 *ptail)
 {
-	struct dma_bridge_chan *dbc = &qdev->dbc[dbc_id];
 	struct dbc_req *reqs = slice->reqs;
 	struct dbc_req *last_req;
 	u32 tail = *ptail;
-	u64 total_bytes;
 	u64 last_bytes;
 	u32 first_n;
 	u32 avail;
-	int ret;
-	int i;
-
-	avail = head - tail;
-	if (head <= tail)
-		avail += dbc->nelem;
 
-	--avail;
+	avail = fifo_space_avail(head, tail, dbc->nelem);
 
-	total_bytes = 0;
-	for (i = 0; i < slice->nents; i++) {
-		total_bytes += le32_to_cpu(reqs[i].len);
-		if (total_bytes >= resize)
+	/*
+	 * After this for loop is complete, first_n represents the index
+	 * of the last DMA request of this slice that needs to be
+	 * transferred after resizing and last_bytes represents DMA size
+	 * of that request.
+	 */
+	last_bytes = resize;
+	for (first_n = 0; first_n < slice->nents; first_n++)
+		if (last_bytes > le32_to_cpu(reqs[first_n].len))
+			last_bytes -= le32_to_cpu(reqs[first_n].len);
+		else
 			break;
-	}
-
-	if (total_bytes < resize) {
-		/* User space should have used the full buffer path. */
-		ret = -EINVAL;
-		return ret;
-	}
-
-	first_n = i;
-	last_bytes = i ? resize + le32_to_cpu(reqs[i].len) - total_bytes : resize;
 
 	if (avail < (first_n + 1))
 		return -EAGAIN;
@@ -1142,22 +1131,21 @@ static inline int copy_partial_exec_reqs(struct qaic_device *qdev, struct bo_sli
 		if (tail + first_n > dbc->nelem) {
 			avail = dbc->nelem - tail;
 			avail = min_t(u32, avail, first_n);
-			memcpy(dbc->req_q_base + tail * get_dbc_req_elem_size(), reqs,
-			       sizeof(*reqs) * avail);
+			memcpy(fifo_at(dbc->req_q_base, tail), reqs, sizeof(*reqs) * avail);
 			last_req = reqs + avail;
 			avail = first_n - avail;
 			if (avail)
 				memcpy(dbc->req_q_base, last_req, sizeof(*reqs) * avail);
 		} else {
-			memcpy(dbc->req_q_base + tail * get_dbc_req_elem_size(), reqs,
-			       sizeof(*reqs) * first_n);
+			memcpy(fifo_at(dbc->req_q_base, tail), reqs, sizeof(*reqs) * first_n);
 		}
 	}
 
-	/* Copy over the last entry. Here we need to adjust len to the left over
+	/*
+	 * Copy over the last entry. Here we need to adjust len to the left over
 	 * size, and set src and dst to the entry it is copied to.
 	 */
-	last_req = dbc->req_q_base + (tail + first_n) % dbc->nelem * get_dbc_req_elem_size();
+	last_req = fifo_at(dbc->req_q_base, (tail + first_n) % dbc->nelem);
 	memcpy(last_req, reqs + slice->nents - 1, sizeof(*reqs));
 
 	/*
@@ -1168,6 +1156,9 @@ static inline int copy_partial_exec_reqs(struct qaic_device *qdev, struct bo_sli
 	last_req->len = cpu_to_le32((u32)last_bytes);
 	last_req->src_addr = reqs[first_n].src_addr;
 	last_req->dest_addr = reqs[first_n].dest_addr;
+	if (!last_bytes)
+		/* Disable DMA transfer */
+		last_req->cmd = GENMASK(7, 2) & reqs[first_n].cmd;
 
 	*ptail = (tail + first_n + 1) % dbc->nelem;
 
@@ -1227,26 +1218,17 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
 		bo->req_id = dbc->next_req_id++;
 
 		list_for_each_entry(slice, &bo->slices, slice) {
-			/*
-			 * If this slice does not fall under the given
-			 * resize then skip this slice and continue the loop
-			 */
-			if (is_partial && pexec[i].resize && pexec[i].resize <= slice->offset)
-				continue;
-
 			for (j = 0; j < slice->nents; j++)
 				slice->reqs[j].req_id = cpu_to_le16(bo->req_id);
 
-			/*
-			 * If it is a partial execute ioctl call then check if
-			 * resize has cut this slice short then do a partial copy
-			 * else do complete copy
-			 */
-			if (is_partial && pexec[i].resize &&
-			    pexec[i].resize < slice->offset + slice->size)
+			if (is_partial && (!pexec[i].resize || pexec[i].resize <= slice->offset))
+				/* Configure the slice for no DMA transfer */
+				ret = copy_partial_exec_reqs(qdev, slice, 0, dbc, head, tail);
+			else if (is_partial && pexec[i].resize < slice->offset + slice->size)
+				/* Configure the slice to be partially DMA transferred */
 				ret = copy_partial_exec_reqs(qdev, slice,
-							     pexec[i].resize - slice->offset,
-							     dbc->id, head, tail);
+							     pexec[i].resize - slice->offset, dbc,
+							     head, tail);
 			else
 				ret = copy_exec_reqs(qdev, slice, dbc->id, head, tail);
 			if (ret) {
diff --git a/include/uapi/drm/qaic_accel.h b/include/uapi/drm/qaic_accel.h
index 43ac5d864512..9dab32316aee 100644
--- a/include/uapi/drm/qaic_accel.h
+++ b/include/uapi/drm/qaic_accel.h
@@ -287,8 +287,9 @@ struct qaic_execute_entry {
  * struct qaic_partial_execute_entry - Defines a BO to resize and submit.
  * @handle: In. GEM handle of the BO to commit to the device.
  * @dir: In. Direction of data. 1 = to device, 2 = from device.
- * @resize: In. New size of the BO.  Must be <= the original BO size.  0 is
- *	    short for no resize.
+ * @resize: In. New size of the BO.  Must be <= the original BO size.
+ *	    @resize as 0 would be interpreted as no DMA transfer is
+ *	    involved.
  */
 struct qaic_partial_execute_entry {
 	__u32 handle;
-- 
2.40.1

