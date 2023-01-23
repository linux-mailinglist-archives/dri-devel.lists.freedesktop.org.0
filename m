Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5A76784AB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACCA10E534;
	Mon, 23 Jan 2023 18:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0435710E52B;
 Mon, 23 Jan 2023 18:25:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NGxWCT017998; Mon, 23 Jan 2023 18:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=rxwS+37OS6a7JcbXphJwsmVtZaDIJxDvTqcFmkgcupg=;
 b=cGcb8r1jju2ZffSPszugmSg8rzk8hE366nnVf/9dPwIfMLQ8Gx26E57mu0JFElTgiU7s
 BMkax1f8ErLPRIoigi0ZQqsfLobgSS5jGnzRnNqsz0qhh6PQGPVTSjZHA1ilVFBcvzzU
 +f/4jdCSQgGZ7OH3gLBhwpp4cC/tqINf7niVRdLgRK+j5JdAzEzPYcWZ9IWpuIUz37oc
 DSRTlkhCAy/IIwkMl3oGLIllV93zDKsp1pN3nsIKoPW90AO1IJw6Gm3Kqc3e6SIYxbdH
 jugnFQKeT/bjDHVx/FteeMLPblVEo3oAjarUsmtAgWZ5LdzMurEy6G8rBJOcTl08FK+g Rg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89dnbgx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NIOteH012310
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:55 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 10:24:54 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 05/14] drm/msm/dp: upgrade tu calculation base on newest
 algorithm
Date: Mon, 23 Jan 2023 10:24:25 -0800
Message-ID: <1674498274-6010-6-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 53qVb4YTjLOG9GmfeK6e9Pd-oJF716B5
X-Proofpoint-ORIG-GUID: 53qVb4YTjLOG9GmfeK6e9Pd-oJF716B5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230177
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At display port, the pixel data is packed into TU (transfer units)
which is used to carry main video stream data during its horizontal active
period. TUs are mapping into the main-Link to facilitate the support of
various lane counts regardless of the pixel bit depth and colorimetry
format. Stuffing symbols are required if packed data rate less than link
symbol rate. TU size is calculated base on factors such as, pixel rate,
BPP, main link rate, main link lane and etc, and shall be 32 to 64
link symbols per lane. Each vendor has its own algorithm to calculate
TU size. This patch upgrade TU size calculation base on newest algorithm.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 702 +++++++++++++++++++++++----------------
 1 file changed, 416 insertions(+), 286 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d0d1848..ae9c2b8 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -182,18 +182,24 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
  */
 struct tu_algo_data {
 	s64 lclk_fp;
+	s64 orig_lclk_fp;
 	s64 pclk_fp;
+	s64 orig_pclk_fp;
 	s64 lwidth;
 	s64 lwidth_fp;
+	int orig_lwidth;
 	s64 hbp_relative_to_pclk;
 	s64 hbp_relative_to_pclk_fp;
 	int nlanes;
+	int orig_hbp;
 	int bpp;
 	int pixelEnc;
 	int dsc_en;
 	int async_en;
+	int fec_en;
 	int bpc;
 
+	int rb2;
 	uint delay_start_link_extra_pixclk;
 	int extra_buffer_margin;
 	s64 ratio_fp;
@@ -250,19 +256,30 @@ struct tu_algo_data {
 	int even_distribution_BF;
 	int even_distribution_legacy;
 	int even_distribution;
+
+	int hbp_delayStartCheck;
+	int pre_tu_hw_pipe_delay;
+	int post_tu_hw_pipe_delay;
+	int link_config_hactive_time;
+	int delay_start_link_lclk;
+	int tu_active_cycles;
+	s64 parity_symbols;
+	int resolution_line_time;
+	int last_partial_lclk;
+
 	int min_hblank_violated;
 	s64 delay_start_time_fp;
 	s64 hbp_time_fp;
 	s64 hactive_time_fp;
 	s64 diff_abs_fp;
-
+	int second_loop_set;
 	s64 ratio;
 };
 
 static int _tu_param_compare(s64 a, s64 b)
 {
-	u32 a_sign;
-	u32 b_sign;
+	u32 a_int, a_frac, a_sign;
+	u32 b_int, b_frac, b_sign;
 	s64 a_temp, b_temp, minus_1;
 
 	if (a == b)
@@ -270,8 +287,12 @@ static int _tu_param_compare(s64 a, s64 b)
 
 	minus_1 = drm_fixp_from_fraction(-1, 1);
 
+	a_int = (a >> 32) & 0x7FFFFFFF;
+	a_frac = a & 0xFFFFFFFF;
 	a_sign = (a >> 32) & 0x80000000 ? 1 : 0;
 
+	b_int = (b >> 32) & 0x7FFFFFFF;
+	b_frac = b & 0xFFFFFFFF;
 	b_sign = (b >> 32) & 0x80000000 ? 1 : 0;
 
 	if (a_sign > b_sign)
@@ -295,6 +316,21 @@ static int _tu_param_compare(s64 a, s64 b)
 	}
 }
 
+static s64 fixp_subtract(s64 a, s64 b)
+{
+	s64 minus_1 = drm_fixp_from_fraction(-1, 1);
+
+	if (a >= b)
+		return a - b;
+
+	return drm_fixp_mul(b - a, minus_1);
+}
+
+static inline int fixp2int_ceil(s64 a)
+{
+	return a ? drm_fixp2int_ceil(a) : 0;
+}
+
 static void dp_panel_update_tu_timings(struct dp_tu_calc_input *in,
 					struct tu_algo_data *tu)
 {
@@ -305,6 +341,7 @@ static void dp_panel_update_tu_timings(struct dp_tu_calc_input *in,
 	s64 pclk_dsc_fp;
 	s64 dwidth_dsc_fp;
 	s64 hbp_dsc_fp;
+	s64 overhead_dsc;
 
 	int tot_num_eoc_symbols = 0;
 	int tot_num_hor_bytes   = 0;
@@ -315,16 +352,22 @@ static void dp_panel_update_tu_timings(struct dp_tu_calc_input *in,
 	s64 temp1_fp, temp2_fp, temp3_fp;
 
 	tu->lclk_fp              = drm_fixp_from_fraction(in->lclk, 1);
+	tu->orig_lclk_fp         = tu->lclk_fp;
 	tu->pclk_fp              = drm_fixp_from_fraction(in->pclk_khz, 1000);
+	tu->orig_pclk_fp         = tu->pclk_fp;
 	tu->lwidth               = in->hactive;
 	tu->hbp_relative_to_pclk = in->hporch;
 	tu->nlanes               = in->nlanes;
 	tu->bpp                  = in->bpp;
 	tu->pixelEnc             = in->pixel_enc;
 	tu->dsc_en               = in->dsc_en;
+	tu->fec_en               = in->fec_en;
 	tu->async_en             = in->async_en;
 	tu->lwidth_fp            = drm_fixp_from_fraction(in->hactive, 1);
+	tu->orig_lwidth          = in->hactive;
 	tu->hbp_relative_to_pclk_fp = drm_fixp_from_fraction(in->hporch, 1);
+	tu->orig_hbp             = in->hporch;
+	tu->rb2                  = (in->hporch <= 80) ? 1 : 0;
 
 	if (tu->pixelEnc == 420) {
 		temp1_fp = drm_fixp_from_fraction(2, 1);
@@ -378,6 +421,7 @@ static void dp_panel_update_tu_timings(struct dp_tu_calc_input *in,
 	dwidth_dsc_bytes = (tot_num_hor_bytes +
 				tot_num_eoc_symbols +
 				(eoc_bytes == 0 ? 0 : tot_num_dummy_bytes));
+	overhead_dsc     = dwidth_dsc_bytes / tot_num_hor_bytes;
 
 	dwidth_dsc_fp = drm_fixp_from_fraction(dwidth_dsc_bytes, 3);
 
@@ -409,12 +453,12 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
 	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
 	temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
 
-	tu->new_valid_boundary_link = drm_fixp2int_ceil(temp2_fp);
+	tu->new_valid_boundary_link = fixp2int_ceil(temp2_fp);
 
 	temp = (tu->i_upper_boundary_count *
 				tu->new_valid_boundary_link +
 				tu->i_lower_boundary_count *
-				(tu->new_valid_boundary_link-1));
+				(tu->new_valid_boundary_link - 1));
 	tu->average_valid2_fp = drm_fixp_from_fraction(temp,
 					(tu->i_upper_boundary_count +
 					tu->i_lower_boundary_count));
@@ -489,11 +533,11 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
 
 	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
 	temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
-	tu->n_n_err_fp = tu->effective_valid_fp - temp2_fp;
+	tu->n_n_err_fp = fixp_subtract(tu->effective_valid_fp, temp2_fp);
 
 	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
 	temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
-	tu->n_err_fp = tu->average_valid2_fp - temp2_fp;
+	tu->n_err_fp = fixp_subtract(tu->average_valid2_fp, temp2_fp);
 
 	tu->even_distribution = tu->n_tus % tu->nlanes == 0 ? 1 : 0;
 
@@ -501,11 +545,7 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
 	temp2_fp = tu->lwidth_fp;
 	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
 	temp2_fp = drm_fixp_div(temp1_fp, tu->average_valid2_fp);
-
-	if (temp2_fp)
-		tu->n_tus_incl_last_incomplete_tu = drm_fixp2int_ceil(temp2_fp);
-	else
-		tu->n_tus_incl_last_incomplete_tu = 0;
+	tu->n_tus_incl_last_incomplete_tu = fixp2int_ceil(temp2_fp);
 
 	temp1 = 0;
 	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
@@ -513,9 +553,7 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
 	temp1_fp = tu->average_valid2_fp - temp2_fp;
 	temp2_fp = drm_fixp_from_fraction(tu->n_tus_incl_last_incomplete_tu, 1);
 	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
-
-	if (temp1_fp)
-		temp1 = drm_fixp2int_ceil(temp1_fp);
+	temp1 = fixp2int_ceil(temp1_fp);
 
 	temp = tu->i_upper_boundary_count * tu->nlanes;
 	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
@@ -524,32 +562,20 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
 	temp2_fp = temp1_fp - temp2_fp;
 	temp1_fp = drm_fixp_from_fraction(temp, 1);
 	temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
+	temp2 = fixp2int_ceil(temp2_fp);
 
-	if (temp2_fp)
-		temp2 = drm_fixp2int_ceil(temp2_fp);
-	else
-		temp2 = 0;
 	tu->extra_required_bytes_new_tmp = (int)(temp1 + temp2);
 
 	temp1_fp = drm_fixp_from_fraction(8, tu->bpp);
 	temp2_fp = drm_fixp_from_fraction(
 	tu->extra_required_bytes_new_tmp, 1);
 	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
-
-	if (temp1_fp)
-		tu->extra_pclk_cycles_tmp = drm_fixp2int_ceil(temp1_fp);
-	else
-		tu->extra_pclk_cycles_tmp = 0;
+	tu->extra_pclk_cycles_tmp = fixp2int_ceil(temp1_fp);
 
 	temp1_fp = drm_fixp_from_fraction(tu->extra_pclk_cycles_tmp, 1);
 	temp2_fp = drm_fixp_div(tu->lclk_fp, tu->pclk_fp);
 	temp1_fp = drm_fixp_mul(temp1_fp, temp2_fp);
-
-	if (temp1_fp)
-		tu->extra_pclk_cycles_in_link_clk_tmp =
-						drm_fixp2int_ceil(temp1_fp);
-	else
-		tu->extra_pclk_cycles_in_link_clk_tmp = 0;
+	tu->extra_pclk_cycles_in_link_clk_tmp = fixp2int_ceil(temp1_fp);
 
 	tu->filler_size_tmp = tu->tu_size - tu->new_valid_boundary_link;
 
@@ -562,6 +588,57 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
 	temp1_fp = drm_fixp_from_fraction(tu->delay_start_link_tmp, 1);
 	tu->delay_start_time_fp = drm_fixp_div(temp1_fp, tu->lclk_fp);
 
+	if (tu->rb2) {
+		temp1_fp = drm_fixp_mul(tu->delay_start_time_fp, tu->lclk_fp);
+		tu->delay_start_link_lclk = fixp2int_ceil(temp1_fp);
+
+		if (tu->remainder_tus > tu->i_upper_boundary_count) {
+			temp = (tu->remainder_tus - tu->i_upper_boundary_count) *
+							(tu->new_valid_boundary_link - 1);
+			temp += (tu->i_upper_boundary_count * tu->new_valid_boundary_link);
+			temp *= tu->nlanes;
+		} else {
+			temp = tu->nlanes * tu->remainder_tus * tu->new_valid_boundary_link;
+		}
+
+		temp1 = tu->i_lower_boundary_count * (tu->new_valid_boundary_link - 1);
+		temp1 += tu->i_upper_boundary_count * tu->new_valid_boundary_link;
+		temp1 *= tu->paired_tus * tu->nlanes;
+		temp1_fp = drm_fixp_from_fraction(tu->n_symbols - temp1 - temp, tu->nlanes);
+		tu->last_partial_lclk = fixp2int_ceil(temp1_fp);
+
+		tu->tu_active_cycles = (int)((tu->n_tus_per_lane * tu->tu_size) +
+								tu->last_partial_lclk);
+		tu->post_tu_hw_pipe_delay = 4 /*BS_on_the_link*/ + 1 /*BE_next_ren*/;
+		temp = tu->pre_tu_hw_pipe_delay + tu->delay_start_link_lclk +
+					tu->tu_active_cycles + tu->post_tu_hw_pipe_delay;
+
+		if (tu->fec_en == 1) {
+			if (tu->nlanes == 1) {
+				temp1_fp = drm_fixp_from_fraction(temp, 500);
+				tu->parity_symbols = fixp2int_ceil(temp1_fp) * 12 + 1;
+			} else {
+				temp1_fp = drm_fixp_from_fraction(temp, 250);
+				tu->parity_symbols = fixp2int_ceil(temp1_fp) * 6 + 1;
+			}
+		} else { //no fec BW impact
+			tu->parity_symbols = 0;
+		}
+
+		tu->link_config_hactive_time = temp + tu->parity_symbols;
+
+		if (tu->resolution_line_time >= tu->link_config_hactive_time + 1 /*margin*/)
+			tu->hbp_delayStartCheck = 1;
+		else
+			tu->hbp_delayStartCheck = 0;
+	} else {
+		compare_result_3 = _tu_param_compare(tu->hbp_time_fp, tu->delay_start_time_fp);
+		if (compare_result_3 < 2)
+			tu->hbp_delayStartCheck = 1;
+		else
+			tu->hbp_delayStartCheck = 0;
+	}
+
 	compare_result_1 = _tu_param_compare(tu->n_n_err_fp, tu->diff_abs_fp);
 	if (compare_result_1 == 2)
 		compare_result_1 = 1;
@@ -574,13 +651,6 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
 	else
 		compare_result_2 = 0;
 
-	compare_result_3 = _tu_param_compare(tu->hbp_time_fp,
-					tu->delay_start_time_fp);
-	if (compare_result_3 == 2)
-		compare_result_3 = 0;
-	else
-		compare_result_3 = 1;
-
 	if (((tu->even_distribution == 1) ||
 			((tu->even_distribution_BF == 0) &&
 			(tu->even_distribution_legacy == 0))) &&
@@ -588,7 +658,7 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
 			compare_result_2 &&
 			(compare_result_1 || (tu->min_hblank_violated == 1)) &&
 			(tu->new_valid_boundary_link - 1) > 0 &&
-			compare_result_3 &&
+			(tu->hbp_delayStartCheck == 1) &&
 			(tu->delay_start_link_tmp <= 1023)) {
 		tu->upper_boundary_count = tu->i_upper_boundary_count;
 		tu->lower_boundary_count = tu->i_lower_boundary_count;
@@ -607,342 +677,402 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
 	}
 }
 
+static void _dp_calc_boundary(struct tu_algo_data *tu)
+{
+	s64 temp1_fp = 0, temp2_fp = 0;
+
+	do {
+		tu->err_fp = drm_fixp_from_fraction(1000, 1);
+
+		temp1_fp = drm_fixp_div(tu->lclk_fp, tu->pclk_fp);
+		temp2_fp = drm_fixp_from_fraction(
+				tu->delay_start_link_extra_pixclk, 1);
+		temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
+		tu->extra_buffer_margin = fixp2int_ceil(temp1_fp);
+
+		temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
+		temp1_fp = drm_fixp_mul(tu->lwidth_fp, temp1_fp);
+		tu->n_symbols = fixp2int_ceil(temp1_fp);
+
+		for (tu->tu_size = 32; tu->tu_size <= 64; tu->tu_size++) {
+			for (tu->i_upper_boundary_count = 1;
+				tu->i_upper_boundary_count <= 15;
+				tu->i_upper_boundary_count++) {
+				for (tu->i_lower_boundary_count = 1;
+					tu->i_lower_boundary_count <= 15;
+					tu->i_lower_boundary_count++) {
+					_tu_valid_boundary_calc(tu);
+				}
+			}
+		}
+		tu->delay_start_link_extra_pixclk--;
+	} while (!tu->boundary_moderation_en &&
+		tu->boundary_mod_lower_err == 1 &&
+		tu->delay_start_link_extra_pixclk != 0 &&
+		((tu->second_loop_set == 0 && tu->rb2 == 1) || tu->rb2 == 0));
+}
+
+static void _dp_calc_extra_bytes(struct tu_algo_data *tu)
+{
+	u64 temp = 0;
+	s64 temp1_fp = 0, temp2_fp = 0;
+
+	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
+	temp2_fp = drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
+	temp1_fp = drm_fixp_from_fraction(tu->valid_boundary_link, 1);
+	temp2_fp = temp1_fp - temp2_fp;
+	temp1_fp = drm_fixp_from_fraction(tu->n_tus + 1, 1);
+	temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
+
+	temp = drm_fixp2int(temp2_fp);
+	if (temp)
+		tu->extra_bytes = fixp2int_ceil(temp2_fp);
+	else
+		tu->extra_bytes = 0;
+
+	temp1_fp = drm_fixp_from_fraction(tu->extra_bytes, 1);
+	temp2_fp = drm_fixp_from_fraction(8, tu->bpp);
+	temp1_fp = drm_fixp_mul(temp1_fp, temp2_fp);
+	tu->extra_pclk_cycles = fixp2int_ceil(temp1_fp);
+
+	temp1_fp = drm_fixp_div(tu->lclk_fp, tu->pclk_fp);
+	temp2_fp = drm_fixp_from_fraction(tu->extra_pclk_cycles, 1);
+	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
+	tu->extra_pclk_cycles_in_link_clk = fixp2int_ceil(temp1_fp);
+}
+
+
 static void _dp_ctrl_calc_tu(struct dp_ctrl_private *ctrl,
 				struct dp_tu_calc_input *in,
 				struct dp_vc_tu_mapping_table *tu_table)
 {
-	struct tu_algo_data *tu;
+	struct tu_algo_data tu;
 	int compare_result_1, compare_result_2;
-	u64 temp = 0;
+	u64 temp = 0, temp1;
 	s64 temp_fp = 0, temp1_fp = 0, temp2_fp = 0;
 
 	s64 LCLK_FAST_SKEW_fp = drm_fixp_from_fraction(6, 10000); /* 0.0006 */
-	s64 const_p49_fp = drm_fixp_from_fraction(49, 100); /* 0.49 */
-	s64 const_p56_fp = drm_fixp_from_fraction(56, 100); /* 0.56 */
 	s64 RATIO_SCALE_fp = drm_fixp_from_fraction(1001, 1000);
 
 	u8 DP_BRUTE_FORCE = 1;
 	s64 BRUTE_FORCE_THRESHOLD_fp = drm_fixp_from_fraction(1, 10); /* 0.1 */
 	uint EXTRA_PIXCLK_CYCLE_DELAY = 4;
-	uint HBLANK_MARGIN = 4;
+	s64 HBLANK_MARGIN = drm_fixp_from_fraction(4, 1);
+	s64 HBLANK_MARGIN_EXTRA = 0;
 
-	tu = kzalloc(sizeof(*tu), GFP_KERNEL);
-	if (!tu)
-		return;
 
-	dp_panel_update_tu_timings(in, tu);
+	memset(&tu, 0, sizeof(tu));
 
-	tu->err_fp = drm_fixp_from_fraction(1000, 1); /* 1000 */
+	dp_panel_update_tu_timings(in, &tu);
+
+	tu.err_fp = drm_fixp_from_fraction(1000, 1); /* 1000 */
 
 	temp1_fp = drm_fixp_from_fraction(4, 1);
-	temp2_fp = drm_fixp_mul(temp1_fp, tu->lclk_fp);
-	temp_fp = drm_fixp_div(temp2_fp, tu->pclk_fp);
-	tu->extra_buffer_margin = drm_fixp2int_ceil(temp_fp);
+	temp2_fp = drm_fixp_mul(temp1_fp, tu.lclk_fp);
+	temp_fp = drm_fixp_div(temp2_fp, tu.pclk_fp);
+	tu.extra_buffer_margin = fixp2int_ceil(temp_fp);
 
-	temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
-	temp2_fp = drm_fixp_mul(tu->pclk_fp, temp1_fp);
-	temp1_fp = drm_fixp_from_fraction(tu->nlanes, 1);
+	if (in->compress_ratio == 375 && tu.bpp == 30)
+		temp1_fp = drm_fixp_from_fraction(24, 8);
+	else
+		temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
+
+	temp2_fp = drm_fixp_mul(tu.pclk_fp, temp1_fp);
+	temp1_fp = drm_fixp_from_fraction(tu.nlanes, 1);
 	temp2_fp = drm_fixp_div(temp2_fp, temp1_fp);
-	tu->ratio_fp = drm_fixp_div(temp2_fp, tu->lclk_fp);
-
-	tu->original_ratio_fp = tu->ratio_fp;
-	tu->boundary_moderation_en = false;
-	tu->upper_boundary_count = 0;
-	tu->lower_boundary_count = 0;
-	tu->i_upper_boundary_count = 0;
-	tu->i_lower_boundary_count = 0;
-	tu->valid_lower_boundary_link = 0;
-	tu->even_distribution_BF = 0;
-	tu->even_distribution_legacy = 0;
-	tu->even_distribution = 0;
-	tu->delay_start_time_fp = 0;
-
-	tu->err_fp = drm_fixp_from_fraction(1000, 1);
-	tu->n_err_fp = 0;
-	tu->n_n_err_fp = 0;
-
-	tu->ratio = drm_fixp2int(tu->ratio_fp);
-	temp1_fp = drm_fixp_from_fraction(tu->nlanes, 1);
-	div64_u64_rem(tu->lwidth_fp, temp1_fp, &temp2_fp);
-	if (temp2_fp != 0 &&
-			!tu->ratio && tu->dsc_en == 0) {
-		tu->ratio_fp = drm_fixp_mul(tu->ratio_fp, RATIO_SCALE_fp);
-		tu->ratio = drm_fixp2int(tu->ratio_fp);
-		if (tu->ratio)
-			tu->ratio_fp = drm_fixp_from_fraction(1, 1);
+	tu.ratio_fp = drm_fixp_div(temp2_fp, tu.lclk_fp);
+
+	tu.original_ratio_fp = tu.ratio_fp;
+	tu.boundary_moderation_en = false;
+	tu.upper_boundary_count = 0;
+	tu.lower_boundary_count = 0;
+	tu.i_upper_boundary_count = 0;
+	tu.i_lower_boundary_count = 0;
+	tu.valid_lower_boundary_link = 0;
+	tu.even_distribution_BF = 0;
+	tu.even_distribution_legacy = 0;
+	tu.even_distribution = 0;
+	tu.hbp_delayStartCheck = 0;
+	tu.pre_tu_hw_pipe_delay = 0;
+	tu.post_tu_hw_pipe_delay = 0;
+	tu.link_config_hactive_time = 0;
+	tu.delay_start_link_lclk = 0;
+	tu.tu_active_cycles = 0;
+	tu.resolution_line_time = 0;
+	tu.last_partial_lclk = 0;
+	tu.delay_start_time_fp = 0;
+	tu.second_loop_set = 0;
+
+	tu.err_fp = drm_fixp_from_fraction(1000, 1);
+	tu.n_err_fp = 0;
+	tu.n_n_err_fp = 0;
+
+	temp = drm_fixp2int(tu.lwidth_fp);
+	if ((((u32)temp % tu.nlanes) != 0) && (_tu_param_compare(tu.ratio_fp, DRM_FIXED_ONE) == 2)
+			&& (tu.dsc_en == 0)) {
+		tu.ratio_fp = drm_fixp_mul(tu.ratio_fp, RATIO_SCALE_fp);
+		if (_tu_param_compare(tu.ratio_fp, DRM_FIXED_ONE) == 1)
+			tu.ratio_fp = DRM_FIXED_ONE;
 	}
 
-	if (tu->ratio > 1)
-		tu->ratio = 1;
+	if (_tu_param_compare(tu.ratio_fp, DRM_FIXED_ONE) == 1)
+		tu.ratio_fp = DRM_FIXED_ONE;
 
-	if (tu->ratio == 1)
-		goto tu_size_calc;
-
-	compare_result_1 = _tu_param_compare(tu->ratio_fp, const_p49_fp);
-	if (!compare_result_1 || compare_result_1 == 1)
-		compare_result_1 = 1;
-	else
-		compare_result_1 = 0;
-
-	compare_result_2 = _tu_param_compare(tu->ratio_fp, const_p56_fp);
-	if (!compare_result_2 || compare_result_2 == 2)
-		compare_result_2 = 1;
-	else
-		compare_result_2 = 0;
-
-	if (tu->dsc_en && compare_result_1 && compare_result_2) {
-		HBLANK_MARGIN += 4;
-		drm_dbg_dp(ctrl->drm_dev,
-			"increase HBLANK_MARGIN to %d\n", HBLANK_MARGIN);
+	if (HBLANK_MARGIN_EXTRA != 0) {
+		HBLANK_MARGIN += HBLANK_MARGIN_EXTRA;
+		DRM_DEBUG("Info: increase HBLANK_MARGIN to %d. (PLUS%d)\n", HBLANK_MARGIN,
+			HBLANK_MARGIN_EXTRA);
 	}
 
-tu_size_calc:
-	for (tu->tu_size = 32; tu->tu_size <= 64; tu->tu_size++) {
-		temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
-		temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
-		temp = drm_fixp2int_ceil(temp2_fp);
+	for (tu.tu_size = 32; tu.tu_size <= 64; tu.tu_size++) {
+		temp1_fp = drm_fixp_from_fraction(tu.tu_size, 1);
+		temp2_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
+		temp = fixp2int_ceil(temp2_fp);
 		temp1_fp = drm_fixp_from_fraction(temp, 1);
-		tu->n_err_fp = temp1_fp - temp2_fp;
+		tu.n_err_fp = temp1_fp - temp2_fp;
 
-		if (tu->n_err_fp < tu->err_fp) {
-			tu->err_fp = tu->n_err_fp;
-			tu->tu_size_desired = tu->tu_size;
+		if (tu.n_err_fp < tu.err_fp) {
+			tu.err_fp = tu.n_err_fp;
+			tu.tu_size_desired = tu.tu_size;
 		}
 	}
 
-	tu->tu_size_minus1 = tu->tu_size_desired - 1;
+	tu.tu_size_minus1 = tu.tu_size_desired - 1;
 
-	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
-	temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
-	tu->valid_boundary_link = drm_fixp2int_ceil(temp2_fp);
+	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
+	temp2_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
+	tu.valid_boundary_link = fixp2int_ceil(temp2_fp);
 
-	temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
-	temp2_fp = tu->lwidth_fp;
+	temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
+	temp2_fp = tu.lwidth_fp;
 	temp2_fp = drm_fixp_mul(temp2_fp, temp1_fp);
 
-	temp1_fp = drm_fixp_from_fraction(tu->valid_boundary_link, 1);
+	temp1_fp = drm_fixp_from_fraction(tu.valid_boundary_link, 1);
 	temp2_fp = drm_fixp_div(temp2_fp, temp1_fp);
-	tu->n_tus = drm_fixp2int(temp2_fp);
+	tu.n_tus = drm_fixp2int(temp2_fp);
 	if ((temp2_fp & 0xFFFFFFFF) > 0xFFFFF000)
-		tu->n_tus += 1;
-
-	tu->even_distribution_legacy = tu->n_tus % tu->nlanes == 0 ? 1 : 0;
-
-	drm_dbg_dp(ctrl->drm_dev,
-			"n_sym = %d, num_of_tus = %d\n",
-			tu->valid_boundary_link, tu->n_tus);
-
-	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
-	temp2_fp = drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
-	temp1_fp = drm_fixp_from_fraction(tu->valid_boundary_link, 1);
-	temp2_fp = temp1_fp - temp2_fp;
-	temp1_fp = drm_fixp_from_fraction(tu->n_tus + 1, 1);
-	temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
-
-	temp = drm_fixp2int(temp2_fp);
-	if (temp && temp2_fp)
-		tu->extra_bytes = drm_fixp2int_ceil(temp2_fp);
-	else
-		tu->extra_bytes = 0;
-
-	temp1_fp = drm_fixp_from_fraction(tu->extra_bytes, 1);
-	temp2_fp = drm_fixp_from_fraction(8, tu->bpp);
-	temp1_fp = drm_fixp_mul(temp1_fp, temp2_fp);
+		tu.n_tus += 1;
 
-	if (temp && temp1_fp)
-		tu->extra_pclk_cycles = drm_fixp2int_ceil(temp1_fp);
-	else
-		tu->extra_pclk_cycles = drm_fixp2int(temp1_fp);
+	tu.even_distribution_legacy = tu.n_tus % tu.nlanes == 0 ? 1 : 0;
+	DRM_DEBUG("Info: n_sym = %d, num_of_tus = %d\n",
+		tu.valid_boundary_link, tu.n_tus);
 
-	temp1_fp = drm_fixp_div(tu->lclk_fp, tu->pclk_fp);
-	temp2_fp = drm_fixp_from_fraction(tu->extra_pclk_cycles, 1);
-	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
+	_dp_calc_extra_bytes(&tu);
 
-	if (temp1_fp)
-		tu->extra_pclk_cycles_in_link_clk = drm_fixp2int_ceil(temp1_fp);
-	else
-		tu->extra_pclk_cycles_in_link_clk = drm_fixp2int(temp1_fp);
+	tu.filler_size = tu.tu_size_desired - tu.valid_boundary_link;
 
-	tu->filler_size = tu->tu_size_desired - tu->valid_boundary_link;
+	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
+	tu.ratio_by_tu_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
 
-	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
-	tu->ratio_by_tu_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
-
-	tu->delay_start_link = tu->extra_pclk_cycles_in_link_clk +
-				tu->filler_size + tu->extra_buffer_margin;
+	tu.delay_start_link = tu.extra_pclk_cycles_in_link_clk +
+				tu.filler_size + tu.extra_buffer_margin;
 
-	tu->resulting_valid_fp =
-			drm_fixp_from_fraction(tu->valid_boundary_link, 1);
+	tu.resulting_valid_fp =
+			drm_fixp_from_fraction(tu.valid_boundary_link, 1);
 
-	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
-	temp2_fp = drm_fixp_div(tu->resulting_valid_fp, temp1_fp);
-	tu->TU_ratio_err_fp = temp2_fp - tu->original_ratio_fp;
+	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
+	temp2_fp = drm_fixp_div(tu.resulting_valid_fp, temp1_fp);
+	tu.TU_ratio_err_fp = temp2_fp - tu.original_ratio_fp;
 
-	temp1_fp = drm_fixp_from_fraction(HBLANK_MARGIN, 1);
-	temp1_fp = tu->hbp_relative_to_pclk_fp - temp1_fp;
-	tu->hbp_time_fp = drm_fixp_div(temp1_fp, tu->pclk_fp);
+	temp1_fp = drm_fixp_from_fraction((tu.hbp_relative_to_pclk - HBLANK_MARGIN), 1);
+	tu.hbp_time_fp = drm_fixp_div(temp1_fp, tu.pclk_fp);
 
-	temp1_fp = drm_fixp_from_fraction(tu->delay_start_link, 1);
-	tu->delay_start_time_fp = drm_fixp_div(temp1_fp, tu->lclk_fp);
+	temp1_fp = drm_fixp_from_fraction(tu.delay_start_link, 1);
+	tu.delay_start_time_fp = drm_fixp_div(temp1_fp, tu.lclk_fp);
 
-	compare_result_1 = _tu_param_compare(tu->hbp_time_fp,
-					tu->delay_start_time_fp);
-	if (compare_result_1 == 2) /* if (hbp_time_fp < delay_start_time_fp) */
-		tu->min_hblank_violated = 1;
+	compare_result_1 = _tu_param_compare(tu.hbp_time_fp,
+					tu.delay_start_time_fp);
+	if (compare_result_1 == 2) /* hbp_time_fp < delay_start_time_fp */
+		tu.min_hblank_violated = 1;
 
-	tu->hactive_time_fp = drm_fixp_div(tu->lwidth_fp, tu->pclk_fp);
+	tu.hactive_time_fp = drm_fixp_div(tu.lwidth_fp, tu.pclk_fp);
 
-	compare_result_2 = _tu_param_compare(tu->hactive_time_fp,
-						tu->delay_start_time_fp);
+	compare_result_2 = _tu_param_compare(tu.hactive_time_fp,
+						tu.delay_start_time_fp);
 	if (compare_result_2 == 2)
-		tu->min_hblank_violated = 1;
-
-	tu->delay_start_time_fp = 0;
+		tu.min_hblank_violated = 1;
 
 	/* brute force */
 
-	tu->delay_start_link_extra_pixclk = EXTRA_PIXCLK_CYCLE_DELAY;
-	tu->diff_abs_fp = tu->resulting_valid_fp - tu->ratio_by_tu_fp;
+	tu.delay_start_link_extra_pixclk = EXTRA_PIXCLK_CYCLE_DELAY;
+	tu.diff_abs_fp = tu.resulting_valid_fp - tu.ratio_by_tu_fp;
 
-	temp = drm_fixp2int(tu->diff_abs_fp);
-	if (!temp && tu->diff_abs_fp <= 0xffff)
-		tu->diff_abs_fp = 0;
+	temp = drm_fixp2int(tu.diff_abs_fp);
+	if (!temp && tu.diff_abs_fp <= 0xffff)
+		tu.diff_abs_fp = 0;
 
 	/* if(diff_abs < 0) diff_abs *= -1 */
-	if (tu->diff_abs_fp < 0)
-		tu->diff_abs_fp = drm_fixp_mul(tu->diff_abs_fp, -1);
+	if (tu.diff_abs_fp < 0)
+		tu.diff_abs_fp = drm_fixp_mul(tu.diff_abs_fp, -1);
+
+	tu.boundary_mod_lower_err = 0;
+
+	temp1_fp = drm_fixp_div(tu.orig_lclk_fp, tu.orig_pclk_fp);
+
+	temp2_fp = drm_fixp_from_fraction(tu.orig_lwidth + tu.orig_hbp, 2);
+	temp_fp = drm_fixp_mul(temp1_fp, temp2_fp);
+	tu.resolution_line_time = drm_fixp2int(temp_fp);
+	tu.pre_tu_hw_pipe_delay = fixp2int_ceil(temp1_fp) + 2 /*cdc fifo write jitter+2*/
+				+ 3 /*pre-delay start cycles*/
+				+ 3 /*post-delay start cycles*/ + 1 /*BE on the link*/;
+	tu.post_tu_hw_pipe_delay = 4 /*BS_on_the_link*/ + 1 /*BE_next_ren*/;
+
+	temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
+	temp1_fp = drm_fixp_mul(tu.lwidth_fp, temp1_fp);
+	tu.n_symbols = fixp2int_ceil(temp1_fp);
+
+	if (tu.rb2) {
+		temp1_fp = drm_fixp_mul(tu.delay_start_time_fp, tu.lclk_fp);
+		tu.delay_start_link_lclk = fixp2int_ceil(temp1_fp);
+
+		tu.new_valid_boundary_link = tu.valid_boundary_link;
+		tu.i_upper_boundary_count = 1;
+		tu.i_lower_boundary_count = 0;
+
+		temp1 = tu.i_upper_boundary_count * tu.new_valid_boundary_link;
+		temp1 += tu.i_lower_boundary_count * (tu.new_valid_boundary_link - 1);
+		tu.average_valid2_fp = drm_fixp_from_fraction(temp1,
+				(tu.i_upper_boundary_count + tu.i_lower_boundary_count));
+
+		temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
+		temp1_fp = drm_fixp_mul(tu.lwidth_fp, temp1_fp);
+		temp2_fp = drm_fixp_div(temp1_fp, tu.average_valid2_fp);
+		tu.n_tus = drm_fixp2int(temp2_fp);
+
+		tu.n_tus_per_lane = tu.n_tus / tu.nlanes;
+		tu.paired_tus = (int)((tu.n_tus_per_lane) /
+				(tu.i_upper_boundary_count + tu.i_lower_boundary_count));
+
+		tu.remainder_tus = tu.n_tus_per_lane - tu.paired_tus *
+				(tu.i_upper_boundary_count + tu.i_lower_boundary_count);
+
+		if (tu.remainder_tus > tu.i_upper_boundary_count) {
+			temp = (tu.remainder_tus - tu.i_upper_boundary_count) *
+							(tu.new_valid_boundary_link - 1);
+			temp += (tu.i_upper_boundary_count * tu.new_valid_boundary_link);
+			temp *= tu.nlanes;
+		} else {
+			temp = tu.nlanes * tu.remainder_tus * tu.new_valid_boundary_link;
+		}
 
-	tu->boundary_mod_lower_err = 0;
-	if ((tu->diff_abs_fp != 0 &&
-			((tu->diff_abs_fp > BRUTE_FORCE_THRESHOLD_fp) ||
-			 (tu->even_distribution_legacy == 0) ||
-			 (DP_BRUTE_FORCE == 1))) ||
-			(tu->min_hblank_violated == 1)) {
-		do {
-			tu->err_fp = drm_fixp_from_fraction(1000, 1);
+		temp1 = tu.i_lower_boundary_count * (tu.new_valid_boundary_link - 1);
+		temp1 += tu.i_upper_boundary_count * tu.new_valid_boundary_link;
+		temp1 *= tu.paired_tus * tu.nlanes;
+		temp1_fp = drm_fixp_from_fraction(tu.n_symbols - temp1 - temp, tu.nlanes);
+		tu.last_partial_lclk = fixp2int_ceil(temp1_fp);
+
+		tu.tu_active_cycles = (int)((tu.n_tus_per_lane * tu.tu_size) +
+								tu.last_partial_lclk);
+
+		temp = tu.pre_tu_hw_pipe_delay + tu.delay_start_link_lclk +
+						tu.tu_active_cycles + tu.post_tu_hw_pipe_delay;
+
+		if (tu.fec_en == 1) {
+			if (tu.nlanes == 1) {
+				temp1_fp = drm_fixp_from_fraction(temp, 500);
+				tu.parity_symbols = fixp2int_ceil(temp1_fp) * 12 + 1;
+			} else {
+				temp1_fp = drm_fixp_from_fraction(temp, 250);
+				tu.parity_symbols = fixp2int_ceil(temp1_fp) * 6 + 1;
+			}
+		} else { //no fec BW impact
+			tu.parity_symbols = 0;
+		}
 
-			temp1_fp = drm_fixp_div(tu->lclk_fp, tu->pclk_fp);
-			temp2_fp = drm_fixp_from_fraction(
-					tu->delay_start_link_extra_pixclk, 1);
-			temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
+		tu.link_config_hactive_time = temp + tu.parity_symbols;
 
-			if (temp1_fp)
-				tu->extra_buffer_margin =
-					drm_fixp2int_ceil(temp1_fp);
-			else
-				tu->extra_buffer_margin = 0;
+		if (tu.link_config_hactive_time + 1 /*margin*/ >= tu.resolution_line_time)
+			tu.min_hblank_violated = 1;
+	}
 
-			temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
-			temp1_fp = drm_fixp_mul(tu->lwidth_fp, temp1_fp);
+	tu.delay_start_time_fp = 0;
 
-			if (temp1_fp)
-				tu->n_symbols = drm_fixp2int_ceil(temp1_fp);
-			else
-				tu->n_symbols = 0;
-
-			for (tu->tu_size = 32; tu->tu_size <= 64; tu->tu_size++) {
-				for (tu->i_upper_boundary_count = 1;
-					tu->i_upper_boundary_count <= 15;
-					tu->i_upper_boundary_count++) {
-					for (tu->i_lower_boundary_count = 1;
-						tu->i_lower_boundary_count <= 15;
-						tu->i_lower_boundary_count++) {
-						_tu_valid_boundary_calc(tu);
-					}
-				}
-			}
-			tu->delay_start_link_extra_pixclk--;
-		} while (tu->boundary_moderation_en != true &&
-			tu->boundary_mod_lower_err == 1 &&
-			tu->delay_start_link_extra_pixclk != 0);
+	if ((tu.diff_abs_fp != 0 &&
+			((tu.diff_abs_fp > BRUTE_FORCE_THRESHOLD_fp) ||
+			 (tu.even_distribution_legacy == 0) ||
+			 (DP_BRUTE_FORCE == 1))) ||
+			(tu.min_hblank_violated == 1)) {
+		_dp_calc_boundary(&tu);
 
-		if (tu->boundary_moderation_en == true) {
+		if (tu.boundary_moderation_en) {
 			temp1_fp = drm_fixp_from_fraction(
-					(tu->upper_boundary_count *
-					tu->valid_boundary_link +
-					tu->lower_boundary_count *
-					(tu->valid_boundary_link - 1)), 1);
+					(tu.upper_boundary_count *
+					tu.valid_boundary_link +
+					tu.lower_boundary_count *
+					(tu.valid_boundary_link - 1)), 1);
 			temp2_fp = drm_fixp_from_fraction(
-					(tu->upper_boundary_count +
-					tu->lower_boundary_count), 1);
-			tu->resulting_valid_fp =
+					(tu.upper_boundary_count +
+					tu.lower_boundary_count), 1);
+			tu.resulting_valid_fp =
 					drm_fixp_div(temp1_fp, temp2_fp);
 
 			temp1_fp = drm_fixp_from_fraction(
-					tu->tu_size_desired, 1);
-			tu->ratio_by_tu_fp =
-				drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
+					tu.tu_size_desired, 1);
+			tu.ratio_by_tu_fp =
+				drm_fixp_mul(tu.original_ratio_fp, temp1_fp);
 
-			tu->valid_lower_boundary_link =
-				tu->valid_boundary_link - 1;
+			tu.valid_lower_boundary_link =
+				tu.valid_boundary_link - 1;
 
-			temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
-			temp1_fp = drm_fixp_mul(tu->lwidth_fp, temp1_fp);
+			temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
+			temp1_fp = drm_fixp_mul(tu.lwidth_fp, temp1_fp);
 			temp2_fp = drm_fixp_div(temp1_fp,
-						tu->resulting_valid_fp);
-			tu->n_tus = drm_fixp2int(temp2_fp);
+						tu.resulting_valid_fp);
+			tu.n_tus = drm_fixp2int(temp2_fp);
 
-			tu->tu_size_minus1 = tu->tu_size_desired - 1;
-			tu->even_distribution_BF = 1;
+			tu.tu_size_minus1 = tu.tu_size_desired - 1;
+			tu.even_distribution_BF = 1;
 
 			temp1_fp =
-				drm_fixp_from_fraction(tu->tu_size_desired, 1);
+				drm_fixp_from_fraction(tu.tu_size_desired, 1);
 			temp2_fp =
-				drm_fixp_div(tu->resulting_valid_fp, temp1_fp);
-			tu->TU_ratio_err_fp = temp2_fp - tu->original_ratio_fp;
+				drm_fixp_div(tu.resulting_valid_fp, temp1_fp);
+			tu.TU_ratio_err_fp = temp2_fp - tu.original_ratio_fp;
 		}
 	}
 
-	temp2_fp = drm_fixp_mul(LCLK_FAST_SKEW_fp, tu->lwidth_fp);
+	if (tu.async_en) {
+		temp2_fp = drm_fixp_mul(LCLK_FAST_SKEW_fp, tu.lwidth_fp);
+		temp = fixp2int_ceil(temp2_fp);
 
-	if (temp2_fp)
-		temp = drm_fixp2int_ceil(temp2_fp);
-	else
-		temp = 0;
-
-	temp1_fp = drm_fixp_from_fraction(tu->nlanes, 1);
-	temp2_fp = drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
-	temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
-	temp2_fp = drm_fixp_div(temp1_fp, temp2_fp);
-	temp1_fp = drm_fixp_from_fraction(temp, 1);
-	temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
-	temp = drm_fixp2int(temp2_fp);
+		temp1_fp = drm_fixp_from_fraction(tu.nlanes, 1);
+		temp2_fp = drm_fixp_mul(tu.original_ratio_fp, temp1_fp);
+		temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
+		temp2_fp = drm_fixp_div(temp1_fp, temp2_fp);
+		temp1_fp = drm_fixp_from_fraction(temp, 1);
+		temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
+		temp = drm_fixp2int(temp2_fp);
 
-	if (tu->async_en)
-		tu->delay_start_link += (int)temp;
+		tu.delay_start_link += (int)temp;
+	}
 
-	temp1_fp = drm_fixp_from_fraction(tu->delay_start_link, 1);
-	tu->delay_start_time_fp = drm_fixp_div(temp1_fp, tu->lclk_fp);
+	temp1_fp = drm_fixp_from_fraction(tu.delay_start_link, 1);
+	tu.delay_start_time_fp = drm_fixp_div(temp1_fp, tu.lclk_fp);
 
 	/* OUTPUTS */
-	tu_table->valid_boundary_link       = tu->valid_boundary_link;
-	tu_table->delay_start_link          = tu->delay_start_link;
-	tu_table->boundary_moderation_en    = tu->boundary_moderation_en;
-	tu_table->valid_lower_boundary_link = tu->valid_lower_boundary_link;
-	tu_table->upper_boundary_count      = tu->upper_boundary_count;
-	tu_table->lower_boundary_count      = tu->lower_boundary_count;
-	tu_table->tu_size_minus1            = tu->tu_size_minus1;
-
-	drm_dbg_dp(ctrl->drm_dev, "TU: valid_boundary_link: %d\n",
-				tu_table->valid_boundary_link);
-	drm_dbg_dp(ctrl->drm_dev, "TU: delay_start_link: %d\n",
-				tu_table->delay_start_link);
-	drm_dbg_dp(ctrl->drm_dev, "TU: boundary_moderation_en: %d\n",
+	tu_table->valid_boundary_link       = tu.valid_boundary_link;
+	tu_table->delay_start_link          = tu.delay_start_link;
+	tu_table->boundary_moderation_en    = tu.boundary_moderation_en;
+	tu_table->valid_lower_boundary_link = tu.valid_lower_boundary_link;
+	tu_table->upper_boundary_count      = tu.upper_boundary_count;
+	tu_table->lower_boundary_count      = tu.lower_boundary_count;
+	tu_table->tu_size_minus1            = tu.tu_size_minus1;
+
+	DRM_DEBUG("TU: valid_boundary_link: %d\n", tu_table->valid_boundary_link);
+	DRM_DEBUG("TU: delay_start_link: %d\n", tu_table->delay_start_link);
+	DRM_DEBUG("TU: boundary_moderation_en: %d\n",
 			tu_table->boundary_moderation_en);
-	drm_dbg_dp(ctrl->drm_dev, "TU: valid_lower_boundary_link: %d\n",
+	DRM_DEBUG("TU: valid_lower_boundary_link: %d\n",
 			tu_table->valid_lower_boundary_link);
-	drm_dbg_dp(ctrl->drm_dev, "TU: upper_boundary_count: %d\n",
+	DRM_DEBUG("TU: upper_boundary_count: %d\n",
 			tu_table->upper_boundary_count);
-	drm_dbg_dp(ctrl->drm_dev, "TU: lower_boundary_count: %d\n",
+	DRM_DEBUG("TU: lower_boundary_count: %d\n",
 			tu_table->lower_boundary_count);
-	drm_dbg_dp(ctrl->drm_dev, "TU: tu_size_minus1: %d\n",
-			tu_table->tu_size_minus1);
-
-	kfree(tu);
+	DRM_DEBUG("TU: tu_size_minus1: %d\n", tu_table->tu_size_minus1);
 }
 
 static void dp_ctrl_calc_tu_parameters(struct dp_ctrl_private *ctrl,
-		struct dp_vc_tu_mapping_table *tu_table)
+				struct dp_vc_tu_mapping_table *tu_table)
 {
 	struct dp_tu_calc_input in;
 	struct drm_display_mode *drm_mode;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

