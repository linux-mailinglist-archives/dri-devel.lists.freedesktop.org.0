Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4545A00FD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B99B7153;
	Wed, 24 Aug 2022 18:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A1210E16E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 01:22:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27H1F5GR017673;
 Wed, 17 Aug 2022 01:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=UUBtYzb89CY9igi+3Qctg3x3jbHNNW/HWMnS1vDSMWE=;
 b=KQ2Y95RbLBKakxVjyRL03vnlrmJ31g2X8xDFUndDKSb2hdxZXnWqtvk6NGd8VVlB3Hbf
 WhMLial8xAEQ+avm5ZdaOWtMo69Sicsyx4Zw/5xLFDMCsRZJFeTVqyho0F+remuMHgWJ
 icFAGQqAJR54CtHlUuvJFk9jnTcGSH+luBg2ddVgs96PkgEDvdAB/BLGV3ai3mfxEi/R
 bk1Em7aoZ7QNgrGKuPdxMyRzCPhqr3Dqr5jqJbeJlOgYoMnjUhtBTFQyeS1eN0Ss9y9+
 GsupQAuKYPBvTPlPoi2UoNAF6k0AnrjHYB7D5DiT/9KrvlHqBkVfZ2bj+DhEV5DBGQdf eg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j058t3yws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 01:22:17 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27H1MGjY005867
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 01:22:16 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 16 Aug 2022 18:22:16 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm v3 2/2] tests/modetest: Add support for writeback
 connector
Date: Tue, 16 Aug 2022 18:22:01 -0700
Message-ID: <20220817012201.162-3-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817012201.162-1-quic_jesszhan@quicinc.com>
References: <20220817012201.162-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: sMOkRim99tpxRMqh6iz5rmfFienI_jMh
X-Proofpoint-GUID: sMOkRim99tpxRMqh6iz5rmfFienI_jMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208170004
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
Cc: Rohith Iyer <quic_rohiiyer@quicinc.com>, quic_abhinavk@quicinc.com,
 qdmitry.baryshkov@linaro.org, hoegsberg@google.com,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rohith Iyer <quic_rohiiyer@quicinc.com>

Add writeback support to modetest with the below options:

- Passing in -c will now also show the writeback connector

- Test a built-in mode on writeback connector

- Test a custom mode from user input on writeback connector
  Usage: "./modetest -M msm -x <connector_id>:<mode_parameters>
            -a -P <plane_id>@<crtc_id>:<widthxheight>+0+0@RG24."
  Refer to --help for exact syntax

- Dump the writeback output buffer to bitstream
  Usage: "./modetest -M msm -s <connector_id>:<widthxheight>
          -a -o <filepath>
          -P <plane_id>@<crtc_id>:<widthxheight>+0+0@RG24"

This currently supports a singular writeback connector.

Changes made in V2:
- Added helper method that checks if user pipe has writeback connector
- Added error message for dump flag if no writeback connector is found
- Polls on the writeback fence fd until writeback is complete

Changes made in V3:
- Resolved compiler warnings
- Defined ETIME to ETIMEDOUT in cases where ETIME is undefined

Co-developed-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/modetest/buffers.c  |  19 ++++
 tests/modetest/buffers.h  |   1 +
 tests/modetest/modetest.c | 183 ++++++++++++++++++++++++++++++++++----
 3 files changed, 184 insertions(+), 19 deletions(-)

diff --git a/tests/modetest/buffers.c b/tests/modetest/buffers.c
index 8a8d9e01..279d7b28 100644
--- a/tests/modetest/buffers.c
+++ b/tests/modetest/buffers.c
@@ -353,3 +353,22 @@ void bo_destroy(struct bo *bo)
 
 	free(bo);
 }
+
+void bo_dump(struct bo *bo, const char *filename)
+{
+	FILE *fp;
+
+	if (!bo || !filename)
+		return;
+
+	fp = fopen(filename, "wb");
+	if (fp) {
+		void *addr;
+
+		bo_map(bo, &addr);
+		printf("Dumping buffer %p to file %s.\n", bo->ptr, filename);
+		fwrite(bo->ptr, 1, bo->size, fp);
+		bo_unmap(bo);
+		fclose(fp);
+	}
+}
diff --git a/tests/modetest/buffers.h b/tests/modetest/buffers.h
index 7f95396b..cbd54e9e 100644
--- a/tests/modetest/buffers.h
+++ b/tests/modetest/buffers.h
@@ -36,5 +36,6 @@ struct bo *bo_create(int fd, unsigned int format,
 		   unsigned int handles[4], unsigned int pitches[4],
 		   unsigned int offsets[4], enum util_fill_pattern pattern);
 void bo_destroy(struct bo *bo);
+void bo_dump(struct bo *bo, const char *filename);
 
 #endif
diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index f33f303c..eef8fbe5 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -68,8 +68,13 @@
 #include "buffers.h"
 #include "cursor.h"
 
+#ifndef ETIME
+#define ETIME ETIMEDOUT
+#endif
+
 static enum util_fill_pattern primary_fill = UTIL_PATTERN_SMPTE;
 static enum util_fill_pattern secondary_fill = UTIL_PATTERN_TILES;
+static enum util_fill_pattern plain_fill = UTIL_PATTERN_PLAIN;
 
 struct crtc {
 	drmModeCrtc *crtc;
@@ -128,6 +133,7 @@ struct device {
 
 	int use_atomic;
 	drmModeAtomicReq *req;
+	int32_t writeback_fence_fd;
 };
 
 static inline int64_t U642I64(uint64_t val)
@@ -135,6 +141,11 @@ static inline int64_t U642I64(uint64_t val)
 	return (int64_t)*((int64_t *)&val);
 }
 
+static inline uint64_t to_user_pointer(const void *ptr)
+{
+	return (uintptr_t)ptr;
+}
+
 static float mode_vrefresh(drmModeModeInfo *mode)
 {
 	return  mode->clock * 1000.00
@@ -813,6 +824,10 @@ struct pipe_arg {
 	struct crtc *crtc;
 	unsigned int fb_id[2], current_fb_id;
 	struct timeval start;
+	unsigned int out_fb_id;
+	struct bo *out_bo;
+	bool custom;
+	bool dump;
 
 	int swap_count;
 };
@@ -919,27 +934,43 @@ static struct crtc *pipe_find_crtc(struct device *dev, struct pipe_arg *pipe)
 	return &dev->resources->crtcs[crtc_idx - 1];
 }
 
+static int parse_mode_string(char *mode_string, drmModeModeInfo *user_mode)
+{
+	return sscanf(mode_string, "%u,%hu,%hu,%hu,%hu,%hu,%hu,%hu,%hu,%hu,%hu,%u,%s",
+			&user_mode->clock, &user_mode->hdisplay, &user_mode->hsync_start,
+			&user_mode->hsync_end, &user_mode->htotal, &user_mode->hskew,
+			&user_mode->vdisplay, &user_mode->vsync_start, &user_mode->vsync_end,
+			&user_mode->vtotal, &user_mode->vscan, &user_mode->vrefresh,
+			user_mode->name);
+}
+
 static int pipe_find_crtc_and_mode(struct device *dev, struct pipe_arg *pipe)
 {
 	drmModeModeInfo *mode = NULL;
 	int i;
+	static drmModeModeInfo user_mode;
 
-	pipe->mode = NULL;
-
-	for (i = 0; i < (int)pipe->num_cons; i++) {
-		mode = connector_find_mode(dev, pipe->con_ids[i],
-					   pipe->mode_str, pipe->vrefresh);
-		if (mode == NULL) {
-			if (pipe->vrefresh)
-				fprintf(stderr,
-				"failed to find mode "
-				"\"%s-%.2fHz\" for connector %s\n",
-				pipe->mode_str, pipe->vrefresh, pipe->cons[i]);
-			else
-				fprintf(stderr,
-				"failed to find mode \"%s\" for connector %s\n",
-				pipe->mode_str, pipe->cons[i]);
+	if (pipe->custom) {
+		if (parse_mode_string(pipe->mode_str, &user_mode) == 13)
+			mode = &user_mode;
+		else
 			return -EINVAL;
+	} else {
+		for (i = 0; i < (int)pipe->num_cons; i++) {
+			mode = connector_find_mode(dev, pipe->con_ids[i],
+						   pipe->mode_str, pipe->vrefresh);
+			if (mode == NULL) {
+				if (pipe->vrefresh)
+					fprintf(stderr,
+					"failed to find mode "
+					"\"%s-%.2fHz\" for connector %s\n",
+					pipe->mode_str, pipe->vrefresh, pipe->cons[i]);
+				else
+					fprintf(stderr,
+					"failed to find mode \"%s\" for connector %s\n",
+					pipe->mode_str, pipe->cons[i]);
+				return -EINVAL;
+			}
 		}
 	}
 
@@ -1443,6 +1474,24 @@ static int pipe_resolve_connectors(struct device *dev, struct pipe_arg *pipe)
 	return 0;
 }
 
+static bool pipe_has_writeback_connector(struct device *dev, struct pipe_arg *pipes,
+		unsigned int count)
+{
+	drmModeConnector *connector;
+	unsigned int i, j;
+
+	for (j = 0; j < count; j++) {
+		struct pipe_arg *pipe = &pipes[j];
+
+		for (i = 0; i < pipe->num_cons; i++) {
+			connector = get_connector_by_id(dev, pipe->con_ids[i]);
+			if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
+				return true;
+		}
+	}
+	return false;
+}
+
 static int pipe_attempt_connector(struct device *dev, drmModeConnector *con,
 		struct pipe_arg *pipe)
 {
@@ -1664,6 +1713,70 @@ static void set_mode(struct device *dev, struct pipe_arg *pipes, unsigned int co
 	}
 }
 
+static void writeback_config(struct device *dev, struct pipe_arg *pipes, unsigned int count)
+{
+	drmModeConnector *connector;
+	unsigned int i, j;
+
+	for (j = 0; j < count; j++) {
+		struct pipe_arg *pipe = &pipes[j];
+
+		for (i = 0; i < pipe->num_cons; i++) {
+			connector = get_connector_by_id(dev, pipe->con_ids[i]);
+			if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK) {
+				bo_fb_create(dev->fd, pipes[j].fourcc, pipe->mode->hdisplay,
+					 pipe->mode->vdisplay, plain_fill, &pipe->out_bo,
+					 &pipe->out_fb_id);
+				add_property(dev, pipe->con_ids[i], "WRITEBACK_FB_ID",
+					 pipe->out_fb_id);
+				add_property(dev, pipe->con_ids[i], "WRITEBACK_OUT_FENCE_PTR",
+					 to_user_pointer(&dev->writeback_fence_fd));
+			}
+		}
+	}
+}
+
+static int poll_writeback_fence(int fd, int timeout)
+{
+	struct pollfd fds = { fd, POLLIN };
+	int ret;
+
+	do {
+		ret = poll(&fds, 1, timeout);
+		if (ret > 0) {
+			if (fds.revents & (POLLERR | POLLNVAL))
+				return -EINVAL;
+
+			return 0;
+		} else if (ret == 0) {
+			return -ETIME;
+		} else {
+			ret = -errno;
+			if (ret == -EINTR || ret == -EAGAIN)
+				continue;
+			return ret;
+		}
+	} while (1);
+
+}
+
+static void dump_output_fb(struct device *dev, struct pipe_arg *pipes, char *dump_path,
+			unsigned int count)
+{
+	drmModeConnector *connector;
+	unsigned int i, j;
+
+	for (j = 0; j < count; j++) {
+		struct pipe_arg *pipe = &pipes[j];
+
+		for (i = 0; i < pipe->num_cons; i++) {
+			connector = get_connector_by_id(dev, pipe->con_ids[i]);
+			if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
+				bo_dump(pipe->out_bo, dump_path);
+		}
+	}
+}
+
 static void atomic_clear_mode(struct device *dev, struct pipe_arg *pipes, unsigned int count)
 {
 	unsigned int i;
@@ -1992,7 +2105,7 @@ static void parse_fill_patterns(char *arg)
 
 static void usage(char *name)
 {
-	fprintf(stderr, "usage: %s [-acDdefMPpsCvrw]\n", name);
+	fprintf(stderr, "usage: %s [-acDdefMPpsCvrwx]\n", name);
 
 	fprintf(stderr, "\n Query options:\n\n");
 	fprintf(stderr, "\t-c\tlist connectors\n");
@@ -2002,7 +2115,12 @@ static void usage(char *name)
 
 	fprintf(stderr, "\n Test options:\n\n");
 	fprintf(stderr, "\t-P <plane_id>@<crtc_id>:<w>x<h>[+<x>+<y>][*<scale>][@<format>]\tset a plane\n");
-	fprintf(stderr, "\t-s <connector_id>[,<connector_id>][@<crtc_id>]:[#<mode index>]<mode>[-<vrefresh>][@<format>]\tset a mode\n");
+	fprintf(stderr, "\t-s <connector_id>[,<connector_id>][@<crtc_id>]:[#<mode index>]");
+	fprintf(stderr, "<mode>[-<vrefresh>][@<format>]\tset a built-in mode\n");
+	fprintf(stderr, "\t-x <connector_id>[@<crtc_id>]:<clock,hdisplay,hsyncstart,hsyncend,");
+	fprintf(stderr, "htotal,hskew,vdisplay,vsyncstart,vsyncend,vtotal,vscan,");
+	fprintf(stderr, "vrefresh,name>\tset a custom mode\n");
+	fprintf(stderr, "\t-o <desired file path> \t Dump writeback output buffer to file\n");
 	fprintf(stderr, "\t-C\ttest hw cursor\n");
 	fprintf(stderr, "\t-v\ttest vsynced page flipping\n");
 	fprintf(stderr, "\t-r\tset the preferred mode for all connectors\n");
@@ -2019,7 +2137,7 @@ static void usage(char *name)
 	exit(0);
 }
 
-static char optstr[] = "acdD:efF:M:P:ps:Cvrw:";
+static const char optstr[] = "acdD:efF:M:o:P:ps:Cvrw:x:";
 
 int main(int argc, char **argv)
 {
@@ -2042,6 +2160,7 @@ int main(int argc, char **argv)
 	struct property_arg *prop_args = NULL;
 	unsigned int args = 0;
 	int ret;
+	char *dump_path;
 
 	memset(&dev, 0, sizeof dev);
 
@@ -2080,6 +2199,10 @@ int main(int argc, char **argv)
 			/* Preserve the default behaviour of dumping all information. */
 			args--;
 			break;
+		case 'o':
+			pipe_args->dump = true;
+			dump_path = optarg;
+			break;
 		case 'P':
 			plane_args = realloc(plane_args,
 					     (plane_count + 1) * sizeof *plane_args);
@@ -2098,6 +2221,7 @@ int main(int argc, char **argv)
 			crtcs = 1;
 			planes = 1;
 			break;
+		case 'x':
 		case 's':
 			pipe_args = realloc(pipe_args,
 					    (count + 1) * sizeof *pipe_args);
@@ -2109,7 +2233,7 @@ int main(int argc, char **argv)
 
 			if (parse_connector(&pipe_args[count], optarg) < 0)
 				usage(argv[0]);
-
+			pipe_args->custom = (c == 'x');
 			count++;
 			break;
 		case 'C':
@@ -2165,6 +2289,7 @@ int main(int argc, char **argv)
 
 	if (use_atomic) {
 		ret = drmSetClientCap(dev.fd, DRM_CLIENT_CAP_ATOMIC, 1);
+		drmSetClientCap(dev.fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
 		if (ret) {
 			fprintf(stderr, "no atomic modesetting support: %s\n", strerror(errno));
 			drmClose(dev.fd);
@@ -2208,6 +2333,12 @@ int main(int argc, char **argv)
 			if (set_preferred || count)
 				set_mode(&dev, pipe_args, count);
 
+			if (pipe_has_writeback_connector(&dev, pipe_args, count))
+				writeback_config(&dev, pipe_args, count);
+			else if (pipe_args->dump)
+				fprintf(stderr,
+						"No writeback connector found - dump will be skipped.\n");
+
 			if (plane_count)
 				atomic_set_planes(&dev, plane_args, plane_count, false);
 
@@ -2217,6 +2348,20 @@ int main(int argc, char **argv)
 				return 1;
 			}
 
+			/*
+			 * Since only writeback connectors have an output fb, this should only be
+			 * called for writeback.
+			 */
+			if (pipe_has_writeback_connector(&dev, pipe_args, count)) {
+				ret = poll_writeback_fence(dev.writeback_fence_fd, 1000);
+				if (ret)
+					fprintf(stderr,
+							"Poll for writeback error: %d. Skipping Dump.\n",
+							ret);
+				else if (pipe_args->dump)
+					dump_output_fb(&dev, pipe_args, dump_path, count);
+			}
+
 			if (test_vsync)
 				atomic_test_page_flip(&dev, pipe_args, plane_args, plane_count);
 
-- 
2.35.1

