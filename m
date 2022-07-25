Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DBD5804A3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 21:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105928B51D;
	Mon, 25 Jul 2022 19:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 961 seconds by postgrey-1.36 at gabe;
 Mon, 25 Jul 2022 19:43:35 UTC
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEA08B51D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 19:43:35 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26PDE4r7012186;
 Mon, 25 Jul 2022 19:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=GpQIlpQMlhBpyAuNik4oHnibJkZKCXfc4/w64dnPvko=;
 b=ia7JfibEXvLj3Xpq1ldUTmOE+0YnzM2Fnc2/px+yJyC7brx902jbVUHDTYwPBxWUtcFP
 0lsyUDkq5k2p+JTO++eMwkI3NrtIBFQhiXwp3fdMcJKnB7jBEVdPMcPUA4+t2fNfDv1a
 /X6N2oowFy9xDZ5tng0yXUmitzX6LwbTWx0HRCoWYBVKEO5+eNSk4l+CABBTQDmGNJJB
 IzaEZjp7NC4bbXnjHFudvCfisv2Y4Kd0I+Kz74Fei8EtHtUMJo5Aj0ycScDFfxeLzYM8
 uK74bC8weS4lHrHYh/VJZ8b3BKseW53It+dgUS0xzhEriNuSIJ4+x5eoAOB0vU6RvnDe PQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hhuvk91uv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 19:27:31 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 26PJRUkF011809
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 19:27:30 GMT
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Jul 2022 12:26:58 -0700
Received: from hu-rohiiyer-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Jul 2022 12:26:57 -0700
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm v1 2/2] tests/modetest: Add support for writeback
 connector
Date: Mon, 25 Jul 2022 12:26:39 -0700
Message-ID: <20220725192639.5437-3-quic_rohiiyer@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220725192639.5437-1-quic_rohiiyer@quicinc.com>
References: <20220725192639.5437-1-quic_rohiiyer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KTDCnI_JyHqp6zKNYiUTpXQL_gStsvjW
X-Proofpoint-ORIG-GUID: KTDCnI_JyHqp6zKNYiUTpXQL_gStsvjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_12,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207250079
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
 hoegsberg@google.com, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
---
 tests/modetest/buffers.c  |  19 ++++++
 tests/modetest/buffers.h  |   1 +
 tests/modetest/modetest.c | 124 ++++++++++++++++++++++++++++++++------
 3 files changed, 125 insertions(+), 19 deletions(-)

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
index f33f303c..beda78c7 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -70,6 +70,7 @@
 
 static enum util_fill_pattern primary_fill = UTIL_PATTERN_SMPTE;
 static enum util_fill_pattern secondary_fill = UTIL_PATTERN_TILES;
+static enum util_fill_pattern plain_fill = UTIL_PATTERN_PLAIN;
 
 struct crtc {
 	drmModeCrtc *crtc;
@@ -135,6 +136,11 @@ static inline int64_t U642I64(uint64_t val)
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
@@ -813,6 +819,10 @@ struct pipe_arg {
 	struct crtc *crtc;
 	unsigned int fb_id[2], current_fb_id;
 	struct timeval start;
+	unsigned int out_fb_id;
+	struct bo *out_bo;
+	bool custom;
+	bool dump;
 
 	int swap_count;
 };
@@ -919,27 +929,43 @@ static struct crtc *pipe_find_crtc(struct device *dev, struct pipe_arg *pipe)
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
 
@@ -1664,6 +1690,45 @@ static void set_mode(struct device *dev, struct pipe_arg *pipes, unsigned int co
 	}
 }
 
+static void writeback_config(struct device *dev, struct pipe_arg *pipes, unsigned int count)
+{
+	int32_t *out_fence_ptr;
+	drmModeConnector *connector;
+
+	for (int j = 0; j < count; j++) {
+		struct pipe_arg *pipe = &pipes[j];
+
+		for (int i = 0; i < pipe->num_cons; i++) {
+			connector = get_connector_by_id(dev, pipe->con_ids[i]);
+			if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK) {
+				bo_fb_create(dev->fd, pipes[j].fourcc, pipe->mode->hdisplay,
+					 pipe->mode->vdisplay, plain_fill, &pipe->out_bo,
+					 &pipe->out_fb_id);
+				add_property(dev, pipe->con_ids[i], "WRITEBACK_FB_ID",
+					 pipe->out_fb_id);
+				add_property(dev, pipe->con_ids[i], "WRITEBACK_OUT_FENCE_PTR",
+					 to_user_pointer(out_fence_ptr));
+			}
+		}
+	}
+}
+
+static void dump_output_fb(struct device *dev, struct pipe_arg *pipes, char *dump_path,
+			unsigned int count)
+{
+	drmModeConnector *connector;
+
+	for (int j = 0; j < count; j++) {
+		struct pipe_arg *pipe = &pipes[j];
+
+		for (int i = 0; i < pipe->num_cons; i++) {
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
@@ -1992,7 +2057,7 @@ static void parse_fill_patterns(char *arg)
 
 static void usage(char *name)
 {
-	fprintf(stderr, "usage: %s [-acDdefMPpsCvrw]\n", name);
+	fprintf(stderr, "usage: %s [-acDdefMPpsCvrwx]\n", name);
 
 	fprintf(stderr, "\n Query options:\n\n");
 	fprintf(stderr, "\t-c\tlist connectors\n");
@@ -2002,7 +2067,12 @@ static void usage(char *name)
 
 	fprintf(stderr, "\n Test options:\n\n");
 	fprintf(stderr, "\t-P <plane_id>@<crtc_id>:<w>x<h>[+<x>+<y>][*<scale>][@<format>]\tset a plane\n");
-	fprintf(stderr, "\t-s <connector_id>[,<connector_id>][@<crtc_id>]:[#<mode index>]<mode>[-<vrefresh>][@<format>]\tset a mode\n");
+	fprintf(stderr, "\t-s <connector_id>[,<connector_id>][@<crtc_id>]:[#<mode index>]");
+	fprintf(stderr, "<mode>[-<vrefresh>][@<format>]\tset a built-in mode\n");
+	fprintf(stderr, "\t-x <connector_id>[@<crtc_id>]:<clock,hdisplay,hsyncstart,hsyncend,");
+	fprintf(stderr, "htotal,hskew,vdisplay,vsyncstart,vsyncend,vtotal,vscan,");
+	fprintf(stderr, "vrefresh,name>\tset a custom mode\n");
+	fprintf(stderr, "\t-o <desired file path> \t Dump output buffer to file\n");
 	fprintf(stderr, "\t-C\ttest hw cursor\n");
 	fprintf(stderr, "\t-v\ttest vsynced page flipping\n");
 	fprintf(stderr, "\t-r\tset the preferred mode for all connectors\n");
@@ -2019,7 +2089,7 @@ static void usage(char *name)
 	exit(0);
 }
 
-static char optstr[] = "acdD:efF:M:P:ps:Cvrw:";
+static const char optstr[] = "acdD:efF:M:o:P:ps:Cvrw:x:";
 
 int main(int argc, char **argv)
 {
@@ -2042,6 +2112,7 @@ int main(int argc, char **argv)
 	struct property_arg *prop_args = NULL;
 	unsigned int args = 0;
 	int ret;
+	char *dump_path;
 
 	memset(&dev, 0, sizeof dev);
 
@@ -2080,6 +2151,10 @@ int main(int argc, char **argv)
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
@@ -2098,6 +2173,7 @@ int main(int argc, char **argv)
 			crtcs = 1;
 			planes = 1;
 			break;
+		case 'x':
 		case 's':
 			pipe_args = realloc(pipe_args,
 					    (count + 1) * sizeof *pipe_args);
@@ -2109,7 +2185,7 @@ int main(int argc, char **argv)
 
 			if (parse_connector(&pipe_args[count], optarg) < 0)
 				usage(argv[0]);
-
+			pipe_args->custom = (c == 'x');
 			count++;
 			break;
 		case 'C':
@@ -2165,6 +2241,7 @@ int main(int argc, char **argv)
 
 	if (use_atomic) {
 		ret = drmSetClientCap(dev.fd, DRM_CLIENT_CAP_ATOMIC, 1);
+		drmSetClientCap(dev.fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
 		if (ret) {
 			fprintf(stderr, "no atomic modesetting support: %s\n", strerror(errno));
 			drmClose(dev.fd);
@@ -2208,6 +2285,8 @@ int main(int argc, char **argv)
 			if (set_preferred || count)
 				set_mode(&dev, pipe_args, count);
 
+			writeback_config(&dev, pipe_args, count);
+
 			if (plane_count)
 				atomic_set_planes(&dev, plane_args, plane_count, false);
 
@@ -2217,6 +2296,13 @@ int main(int argc, char **argv)
 				return 1;
 			}
 
+			/*
+			 * Since only writeback connectors have an output fb, this should only be
+			 * called for writeback.
+			 */
+			if (pipe_args->dump)
+				dump_output_fb(&dev, pipe_args, dump_path, count);
+
 			if (test_vsync)
 				atomic_test_page_flip(&dev, pipe_args, plane_args, plane_count);
 
-- 
2.31.0

