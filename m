Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50919BAB7D7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F7C10E4E4;
	Tue, 30 Sep 2025 05:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="UOOalDgj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2656F10E276
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:07 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250930035650epoutp01696b03fe9420b3d2d7f58b4bd343e40d~p80XTmhIA3202032020epoutp01e
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:56:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250930035650epoutp01696b03fe9420b3d2d7f58b4bd343e40d~p80XTmhIA3202032020epoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204610;
 bh=PWHRpdL9AtPN9y3tXCaVxM38u1RndAKBuoWEkNFK/oc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UOOalDgjA4NzX8ypkhdzLUx1d7m1zfTZzn8DWf269A+uubY4b1ql5Hubym0BrgnTP
 /aktyXW+26/wyOdBRLIiDiq4+kbB5u81NK9aYxutsg9raXxuYY9UuSf0Yyqa//URz3
 wbTyHNfBuM+KOjU+jhtUNImUnyXXMLw0XeO+srMk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20250930035650epcas5p125de74b023d444c22072134632caf967~p80W1xB3p2306123061epcas5p1v;
 Tue, 30 Sep 2025 03:56:50 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cbPPn6TGSz2SSKb; Tue, 30 Sep
 2025 03:56:45 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035644epcas5p178155478c949c231c14a131b00f23bc1~p80RF_Nf51532615326epcas5p1a;
 Tue, 30 Sep 2025 03:56:44 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035641epsmtip1d3f95c15de1c35791c17d5fb7cab0928~p80OinTSo2880128801epsmtip1l;
 Tue, 30 Sep 2025 03:56:41 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 20/29] media: mfc: Add H264 decoder support
Date: Tue, 30 Sep 2025 09:33:39 +0530
Message-Id: <20250930040348.3702923-21-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035644epcas5p178155478c949c231c14a131b00f23bc1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035644epcas5p178155478c949c231c14a131b00f23bc1
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035644epcas5p178155478c949c231c14a131b00f23bc1@epcas5p1.samsung.com>
X-Mailman-Approved-At: Tue, 30 Sep 2025 05:28:53 +0000
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

From: Nagaraju Siddineni <nagaraju.s@samsung.com>

- Extend device‑tree with properties for secure firmware, DRM, codec
  capabilities, format/stride, resolution checks, and security controls.
- Introduce per‑codec and device‑wide bitrate limits.
- Implement runtime management: scheduler workers, dedicated workqueues,
  and required mutex/spinlock synchronization.
- Refine decoder‑context handling (full init/cleanup, CRC dump,
  DPB handling, vb2 queue setup, QoS parsing).
- Add polling with error‑state handling.
- Expand DebugFS to expose core‑balance, feature flags, format support,
  QoS data, and queue metrics.
- Update macros, include missing headers, improve logging, adjust
  scheduler/PBS configuration, and revise buffer‑size structures.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../dts/exynos/exynosautov920-evt2-mfc.dtsi   | 443 ++++++++++++++++++
 .../media/platform/samsung/exynos-mfc/mfc.c   | 420 ++++++++++++++++-
 .../platform/samsung/exynos-mfc/mfc_debugfs.c |  60 ++-
 3 files changed, 915 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-evt2-mfc.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920-evt2-mfc.dtsi
index 49c61958467e..40cac2b20804 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-evt2-mfc.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-evt2-mfc.dtsi
@@ -67,25 +67,142 @@ mfc: mfc@19cd0000 {
 		/* MFC version */
 		ip_ver = <0x1600010C>;
 
+		/* Secure Firmware Loading */
+		secure_fw_loading = <1>;
+
 		/* MFC firmware name */
 		fw_name = "mfc_fw_v16.0.bin";
 
 		/* Debug mode */
 		debug_mode = <1>;
 
+		max_num_drm_inst = <3>;
+
+		/* NAL-Q size */
+		nal_q_entry_size = <768>;
+		nal_q_dump_size = <376>;
+
 		/* Features <on/off version> */
+		skype = <1 0x0>;
+		black_bar = <1 0x0>;
+		color_aspect_dec = <1 0x0>;
+		static_info_dec = <1 0x0>;
+		color_aspect_enc = <1 0x0>;
+		static_info_enc = <1 0x180314>;
+		vp9_stride_align = <1 0x0>;
 		mem_clear = <1 0x0>;
 		/* Support from v11.0 (except 11.2) */
 		wait_fw_status = <1 0x190122>;
+		/* DRM switch predict for cache flush */
+		drm_switch_predict = <1 0x0>;
+		/* Use metadata interface */
+		metadata_interface = <1 0x200910>;
+		/* Average QP of encoder per frame */
+		average_qp = <1 0x201030>;
+		/* MV search mode */
+		mv_search_mode = <1 0x201118>;
+		/* Encoder IDR flag */
+		enc_idr_flag = <1 0x210611>;
+		/* Encoder min quality mode */
+		min_quality_mode = <1 0x210705>;
+		/* Encoder time stamp delta */
+		enc_ts_delta = <1 0x211027>;
+		/* Encoder I limit RC mode for WFD */
+		wfd_rc_mode = <1 0x211229>;
 
 		/* Scheduler 0: round-robin, 1: PBS */
 		scheduler = <1>;
 		/* The number of priority in PBS */
 		pbs_num_prio = <1>;
 
+		/* Support AV1 Film Grain Feature */
+		av1_film_grain = <1 0x200717>;
+
+		/* Decoder stride align (default: 16, AMD GPU: 256) */
+		stride_align = <256>;
+		/* Decoder stride calculation type (new: 1, old: 0) */
+		stride_type = <1>;
+
+		/* Formats */
+		support_10bit = <1>;
+		support_422 = <0>;
+		support_rgb = <1>;
+
+		/* Resolution check (0: do not check, 1: FHD, 2: 4K, 3: 8K) */
+		support_check_res = <3>;
+
+		/* error type for sync_point display */
+		/* (1: concealment display, 2: error display, 3: error no display) */
+		display_err_type = <2>;
+
+		/* FW base security ctrl */
+		security_ctrl = <1>;
+		/* output buffer Q framerate */
+		display_framerate = <0>;
+
+		/* Encoder default parameter: max number is 100 */
+		enc_param_num = <25>;
+		enc_param_addr = <0xF7B4 0xF7B8 0xF7B0 0xF798 0xFA2C
+				0xF790 0xFA34 0xFA38 0xFA3C 0xF7C0
+				0xF7C8 0xF7CC 0xFA60 0xFDD4 0xFDDC
+				0xFB54 0xFB58 0xFBA8 0xFD90 0xFD94
+				0xFD40 0xFD48 0xFD4C 0xFD50 0xFD80>;
+		enc_param_val = <0x80 0x80 0x0 0x4000 0x3FD00
+				0x0 0x0 0x2710 0x3E8 0x0
+				0x0 0x0 0x0 0x8050D211 0x0
+				0x3011 0x0 0x0 0x2D 0xA00
+				0x1D 0xF4240 0x33003300 0x2 0x1>;
+
+		/* BW <peak, read, write> : KB/UHD frame */
+		bw_enc_h264		= <45456 56112 11170>;
+		bw_enc_hevc		= <46756 52766 9763>;
+		bw_enc_hevc_10bit	= <53865 64753 12556>;
+		bw_enc_vp8		= <64000 67318 22518>;
+		bw_enc_vp9		= <72326 59726 16530>;
+		bw_enc_vp9_10bit	= <149085 114928 31419>;
+		bw_enc_mpeg4		= <44647 55324 9531>;
+		bw_dec_h264		= <32605 34381 21263>;
+		bw_dec_hevc		= <29973 28851 17538>;
+		bw_dec_hevc_10bit	= <52859 46245 31351>;
+		bw_dec_vp8		= <28672 30468 22324>;
+		bw_dec_vp9		= <18351 18947 16877>;
+		bw_dec_vp9_10bit	= <42384 34452 31766>;
+		bw_dec_av1		= <23787 19570 15856>;
+		bw_dec_av1_10bit	= <41407 35490 29699>;
+		bw_dec_mpeg4		= <31540 25368 15770>;
+
+		/* QoS bitrate */
+		num_mfc_freq = <7>;
+		mfc_freqs = <160000 267000 332000 400000 533000 664000 800000>;
+
+		/* QoS weight (%) */
+		dynamic_weight = <1>;
+		qos_weight_h264_hevc = <100>;
+		qos_weight_vp8_vp9 = <100>;
+		qos_weight_av1 = <70>;
+		qos_weight_other_codec = <25>;
+		qos_weight_3plane = <80>;
+		qos_weight_10bit = <75>;
+		qos_weight_422 = <70>;
+		qos_weight_bframe = <50>;
+		qos_weight_num_of_ref = <60>;
+		qos_weight_gpb = <50>;
+		qos_weight_num_of_tile = <75>;
+		qos_weight_super64_bframe = <60>;
+		qos_weight_mbaff = <60>;
+
+		/* core balance(%) for resource managing */
+		core_balance = <54>;
+
 		/* MFC IOVA threshold (MB) */
 		iova_threshold = <1700>;
 
+		/* need control for mfc idle clock */
+		idle_clk_ctrl = <1>;
+
+		/* QoS level for pm_qos dynamic control */
+		qos_ctrl_level = <1>;
+
 		/* Sub nodes for MFC core */
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -135,6 +252,15 @@ mfc_core0: MFC-0@19cd0000 {
 			axid_mask = <0xFFFF>;
 			tsmux_axid = <0x1>;
 
+			/* QoS */
+			num_default_qos_steps = <10>;
+			num_encoder_qos_steps = <7>;
+			max_mb = <5093269>;
+			max_hw_mb = <3888000>;
+			mfc_freq_control = <1>;
+			mo_control = <1>;
+			bw_control = <1>;
+
 			/* mem-log buffer size */
 			memlog_size = <0x80000>;
 			memlog_sfr_size = <0x1000>;
@@ -148,6 +274,160 @@ mfc_core0: MFC-0@19cd0000 {
 			iommu@19c70000 {
 				reg = <0x0 0x19C70000 0x0 0x9000>;
 			};
+
+			/* Default QoS table */
+			mfc_default_qos_table {
+				mfc_d_qos_variant_0 {
+					thrd_mb = <0>;
+					freq_mfc = <133000>;
+					freq_int = <133000>;
+					freq_mif = <421000>;
+					bts_scen = "default";
+					time_fw = <1238>;
+				};
+				mfc_d_qos_variant_1 {
+					thrd_mb = <546599>;
+					freq_mfc = <267000>;
+					freq_int = <133000>;
+					freq_mif = <546000>;
+					bts_scen = "default";
+					time_fw = <842>;
+				};
+				mfc_d_qos_variant_2 {
+					thrd_mb = <1167159>;
+					freq_mfc = <332000>;
+					freq_int = <200000>;
+					freq_mif = <676000>;
+					bts_scen = "default";
+					time_fw = <667>;
+				};
+				mfc_d_qos_variant_3 {
+					thrd_mb = <1859381>;
+					freq_mfc = <332000>;
+					freq_int = <200000>;
+					freq_mif = <845000>;
+					bts_scen = "default";
+					time_fw = <578>;
+				};
+				mfc_d_qos_variant_4 {
+					thrd_mb = <2078433>;
+					freq_mfc = <468000>;
+					freq_int = <200000>;
+					freq_mif = <1014000>;
+					bts_scen = "default";
+					time_fw = <483>;
+				};
+				mfc_d_qos_variant_5 {
+					thrd_mb = <2563082>;
+					freq_mfc = <533000>;
+					freq_int = <332000>;
+					freq_mif = <1352000>;
+					bts_scen = "default";
+					time_fw = <362>;
+				};
+				mfc_d_qos_variant_6 {
+					thrd_mb = <3173773>;
+					freq_mfc = <663000>;
+					freq_int = <400000>;
+					freq_mif = <1352000>;
+					bts_scen = "default";
+					time_fw = <306>;
+				};
+				mfc_d_qos_variant_7 {
+					thrd_mb = <3716529>;
+					freq_mfc = <745000>;
+					freq_int = <533000>;
+					freq_mif = <1539000>;
+					bts_scen = "default";
+					time_fw = <267>;
+				};
+				mfc_d_qos_variant_8 {
+					thrd_mb = <4282126>;
+					freq_mfc = <745000>;
+					freq_int = <663000>;
+					freq_mif = <2028000>;
+					bts_scen = "default";
+					time_fw = <235>;
+				};
+				mfc_d_qos_variant_9 {
+					thrd_mb = <4855818>;
+					freq_mfc = <800000>;
+					freq_int = <800000>;
+					freq_mif = <3172000>;
+					bts_scen = "mfc_uhd_10bit";
+					time_fw = <175>;
+				};
+			};
+
+			/* Encoder only QoS table */
+			mfc_encoder_qos_table {
+				mfc_e_qos_variant_0 {
+					thrd_mb = <0>;
+					freq_mfc = <133000>;
+					freq_int = <133000>;
+					freq_mif = <421000>;
+					bts_scen = "default";
+					time_fw = <1238>;
+				};
+				mfc_e_qos_variant_1 {
+					thrd_mb = <546599>;
+					freq_mfc = <267000>;
+					freq_int = <133000>;
+					freq_mif = <546000>;
+					bts_scen = "default";
+					time_fw = <842>;
+				};
+				mfc_e_qos_variant_2 {
+					thrd_mb = <1167159>;
+					freq_mfc = <332000>;
+					freq_int = <200000>;
+					freq_mif = <676000>;
+					bts_scen = "default";
+					time_fw = <667>;
+				};
+				mfc_e_qos_variant_3 {
+					thrd_mb = <1859381>;
+					freq_mfc = <332000>;
+					freq_int = <200000>;
+					freq_mif = <845000>;
+					bts_scen = "default";
+					time_fw = <578>;
+				};
+				mfc_e_qos_variant_4 {
+					thrd_mb = <2078433>;
+					freq_mfc = <533000>;
+					freq_int = <400000>;
+					freq_mif = <845000>;
+					bts_scen = "default";
+					time_fw = <471>;
+				};
+				mfc_e_qos_variant_5 {
+					thrd_mb = <2553457>;
+					freq_mfc = <468000>;
+					freq_int = <332000>;
+					freq_mif = <1539000>;
+					bts_scen = "mfc_uhd";
+					time_fw = <359>;
+				};
+				mfc_e_qos_variant_6 {
+					thrd_mb = <3175870>;
+					freq_mfc = <663000>;
+					freq_int = <663000>;
+					freq_mif = <1716000>;
+					bts_scen = "default";
+					time_fw = <287>;
+				};
+			};
+
+			/* QoS table for performance boost mode */
+			mfc_perf_boost_table {
+				num_cluster = <3>;
+				freq_cluster = <1742000 1898000 1456000>;
+				freq_mfc = <666000>;
+				freq_int = <534000>;
+				freq_mif = <2730000>;
+				bts_scen = "mfc_uhd_10bit";
+			};
 		};
 
 		mfc_core1: MFC-1@19ed0000 {
@@ -173,6 +453,15 @@ mfc_core1: MFC-1@19ed0000 {
 			share_sysmmu = <0>;
 			axid_mask = <0xFFFF>;
 
+			/* QoS */
+			num_default_qos_steps = <10>;
+			num_encoder_qos_steps = <7>;
+			max_mb = <5315425>;
+			max_hw_mb = <3888000>;
+			mfc_freq_control = <1>;
+			mo_control = <1>;
+			bw_control = <1>;
+
 			/* Device virtual address */
 			#dma-address-cells = <1>;
 			#dma-size-cells = <1>;
@@ -182,6 +471,160 @@ mfc_core1: MFC-1@19ed0000 {
 			iommu@19e70000 {
 				reg = <0x0 0x19E70000 0x0 0x9000>;
 			};
+
+			/* Default QoS table */
+			mfc_default_qos_table {
+				mfc_d_qos_variant_0 {
+					thrd_mb = <0>;
+					freq_mfc = <133000>;
+					freq_int = <133000>;
+					freq_mif = <421000>;
+					bts_scen = "default";
+					time_fw = <1238>;
+				};
+				mfc_d_qos_variant_1 {
+					thrd_mb = <546599>;
+					freq_mfc = <234000>;
+					freq_int = <133000>;
+					freq_mif = <546000>;
+					bts_scen = "default";
+					time_fw = <842>;
+				};
+				mfc_d_qos_variant_2 {
+					thrd_mb = <1167159>;
+					freq_mfc = <332000>;
+					freq_int = <200000>;
+					freq_mif = <676000>;
+					bts_scen = "default";
+					time_fw = <667>;
+				};
+				mfc_d_qos_variant_3 {
+					thrd_mb = <1859381>;
+					freq_mfc = <332000>;
+					freq_int = <200000>;
+					freq_mif = <845000>;
+					bts_scen = "default";
+					time_fw = <578>;
+				};
+				mfc_d_qos_variant_4 {
+					thrd_mb = <2078433>;
+					freq_mfc = <468000>;
+					freq_int = <200000>;
+					freq_mif = <1014000>;
+					bts_scen = "default";
+					time_fw = <483>;
+				};
+				mfc_d_qos_variant_5 {
+					thrd_mb = <2563082>;
+					freq_mfc = <533000>;
+					freq_int = <332000>;
+					freq_mif = <1352000>;
+					bts_scen = "default";
+					time_fw = <362>;
+				};
+				mfc_d_qos_variant_6 {
+					thrd_mb = <3173773>;
+					freq_mfc = <663000>;
+					freq_int = <400000>;
+					freq_mif = <1352000>;
+					bts_scen = "default";
+					time_fw = <306>;
+				};
+				mfc_d_qos_variant_7 {
+					thrd_mb = <3716529>;
+					freq_mfc = <745000>;
+					freq_int = <533000>;
+					freq_mif = <1539000>;
+					bts_scen = "default";
+					time_fw = <267>;
+				};
+				mfc_d_qos_variant_8 {
+					thrd_mb = <4282126>;
+					freq_mfc = <745000>;
+					freq_int = <663000>;
+					freq_mif = <2028000>;
+					bts_scen = "default";
+					time_fw = <235>;
+				};
+				mfc_d_qos_variant_9 {
+					thrd_mb = <4855818>;
+					freq_mfc = <800000>;
+					freq_int = <800000>;
+					freq_mif = <3172000>;
+					bts_scen = "mfc_8k_dec30";
+					time_fw = <175>;
+				};
+			};
+
+			/* Encoder only QoS table */
+			mfc_encoder_qos_table {
+				mfc_e_qos_variant_0 {
+					thrd_mb = <0>;
+					freq_mfc = <133000>;
+					freq_int = <133000>;
+					freq_mif = <421000>;
+					bts_scen = "default";
+					time_fw = <1238>;
+				};
+				mfc_e_qos_variant_1 {
+					thrd_mb = <546599>;
+					freq_mfc = <267000>;
+					freq_int = <133000>;
+					freq_mif = <546000>;
+					bts_scen = "default";
+					time_fw = <842>;
+				};
+				mfc_e_qos_variant_2 {
+					thrd_mb = <1167159>;
+					freq_mfc = <332000>;
+					freq_int = <200000>;
+					freq_mif = <676000>;
+					bts_scen = "default";
+					time_fw = <667>;
+				};
+				mfc_e_qos_variant_3 {
+					thrd_mb = <1859381>;
+					freq_mfc = <332000>;
+					freq_int = <200000>;
+					freq_mif = <845000>;
+					bts_scen = "default";
+					time_fw = <578>;
+				};
+				mfc_e_qos_variant_4 {
+					thrd_mb = <2078433>;
+					freq_mfc = <533000>;
+					freq_int = <400000>;
+					freq_mif = <845000>;
+					bts_scen = "default";
+					time_fw = <471>;
+				};
+				mfc_e_qos_variant_5 {
+					thrd_mb = <2553457>;
+					freq_mfc = <468000>;
+					freq_int = <332000>;
+					freq_mif = <1539000>;
+					bts_scen = "mfc_uhd";
+					time_fw = <359>;
+				};
+				mfc_e_qos_variant_6 {
+					thrd_mb = <3175870>;
+					freq_mfc = <663000>;
+					freq_int = <663000>;
+					freq_mif = <1716000>;
+					bts_scen = "default";
+					time_fw = <287>;
+				};
+			};
+
+			/* QoS table for performance boost mode */
+			mfc_perf_boost_table {
+				num_cluster = <3>;
+				freq_cluster = <1742000 1898000 1456000>;
+				freq_mfc = <666000>;
+				freq_int = <534000>;
+				freq_mif = <2730000>;
+				bts_scen = "mfc_uhd_10bit";
+			};
 		};
 	};
 };
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc.c b/drivers/media/platform/samsung/exynos-mfc/mfc.c
index b5b66083cc8b..fb9a7317e812 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc.c
@@ -21,6 +21,8 @@
 #include <linux/poll.h>
 #include <linux/iommu.h>
 
+#include "mfc_dec_v4l2.h"
+#include "mfc_dec_vb2.h"
 #include "mfc_rm.h"
 #include "mfc_debugfs.h"
 
@@ -29,6 +31,9 @@
 
 #include "mfc_core_hw_reg_api.h"
 
+#include "base/mfc_qos.h"
+
+#include "base/mfc_queue.h"
 #include "base/mfc_utils.h"
 #include "base/mfc_buf.h"
 #include "base/mfc_mem.h"
@@ -41,6 +46,188 @@ struct _mfc_trace g_mfc_trace[MFC_TRACE_COUNT_MAX];
 struct _mfc_trace g_mfc_trace_rm[MFC_TRACE_COUNT_MAX];
 struct _mfc_trace g_mfc_trace_longterm[MFC_TRACE_COUNT_MAX];
 
+static void mfc_butler_worker(struct work_struct *work)
+{
+	struct mfc_dev *dev;
+	struct mfc_ctx *ctx;
+	int i;
+
+	dev = container_of(work, struct mfc_dev, butler_work);
+
+	/* If there is multi core instance, it has high priority */
+	if (dev->multi_core_inst_bits) {
+		bool is_switch_to_single;
+		bool is_multi_mode;
+
+		i = __ffs(dev->multi_core_inst_bits);
+		ctx = dev->ctx[i];
+		if (!ctx) {
+			mfc_dev_err("[RM] There is no ctx\n");
+			return;
+		}
+
+		/* [DRC] In the case of MFC_OP_SWITCH_TO_SINGLE,
+		 * also need to request with MFC_WORK_TRY.
+		 * Because op_mode is maintained as MFC_OP_SWITCH_TO_SINGLE before subcore_deinit.
+		 * And, subcore_deinit can be started by MFC_WORK_TRY.
+		 */
+		is_multi_mode = IS_MULTI_MODE(ctx);
+		is_switch_to_single =
+			(ctx->op_mode == MFC_OP_SWITCH_TO_SINGLE && ctx->handle_drc_multi_mode);
+		if (!is_multi_mode && !is_switch_to_single)
+			return;
+
+		mfc_rm_request_work(dev, MFC_WORK_TRY, ctx);
+	} else {
+		mfc_rm_request_work(dev, MFC_WORK_BUTLER, NULL);
+	}
+}
+
+static void __mfc_deinit_dec_ctx(struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	unsigned int size;
+
+	if (dec->crc && (ctx->dev->debugfs.sfr_dump & MFC_DUMP_DEC_CRC)) {
+		if (dec->crc_idx * 4 > SZ_1K)
+			size = SZ_1K;
+		else
+			size = dec->crc_idx * 4;
+		print_hex_dump
+			(KERN_ERR, "CRC: ", DUMP_PREFIX_OFFSET, 32, 1,
+			dec->crc, size, false);
+		vfree(dec->crc);
+	}
+
+	mfc_cleanup_iovmm(ctx);
+
+	mfc_delete_queue(&ctx->src_buf_ready_queue);
+	mfc_delete_queue(&ctx->dst_buf_queue);
+	mfc_delete_queue(&ctx->err_buf_queue);
+	mfc_delete_queue(&ctx->meminfo_inbuf_q);
+
+	mfc_mem_cleanup_user_shared_handle(ctx, &dec->sh_handle_dpb);
+	if (dec->ref_info)
+		vfree(dec->ref_info);
+
+	kfree(dec);
+}
+
+static int __mfc_init_dec_ctx(struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec;
+	int ret = 0;
+	int i;
+
+	dec = kzalloc(sizeof(*dec), GFP_KERNEL);
+	if (!dec)
+		return -ENOMEM;
+
+	ctx->dec_priv = dec;
+
+	ctx->subcore_inst_no = MFC_NO_INSTANCE_SET;
+	ctx->curr_src_index = -1;
+	ctx->user_prio = -1;
+
+	mfc_create_queue(&ctx->src_buf_ready_queue);
+	mfc_create_queue(&ctx->dst_buf_queue);
+	mfc_create_queue(&ctx->err_buf_queue);
+	mfc_create_queue(&ctx->meminfo_inbuf_q);
+
+	for (i = 0; i < MFC_MAX_BUFFERS; i++) {
+		INIT_LIST_HEAD(&ctx->src_ctrls[i]);
+		INIT_LIST_HEAD(&ctx->dst_ctrls[i]);
+	}
+	bitmap_zero(ctx->src_ctrls_avail, MFC_MAX_BUFFERS);
+	bitmap_zero(ctx->dst_ctrls_avail, MFC_MAX_BUFFERS);
+
+	ctx->capture_state = QUEUE_FREE;
+	ctx->output_state = QUEUE_FREE;
+
+	ctx->type = MFCINST_DECODER;
+	ctx->c_ops = &mfc_ctrls_ops;
+	ctx->b_ops = &mfc_bufs_ops;
+
+	mfc_dec_set_default_format(ctx);
+	mfc_rate_reset_framerate(ctx);
+
+	ctx->qos_ratio = 100;
+	INIT_LIST_HEAD(&ctx->bitrate_list);
+	INIT_LIST_HEAD(&ctx->src_ts.ts_list);
+
+	dec->display_delay = -1;
+	dec->is_interlaced = 0;
+	dec->immediate_display = 0;
+	dec->is_dts_mode = 0;
+	dec->inter_res_change = 0;
+	dec->disp_drc.disp_res_change = 0;
+	dec->disp_drc.push_idx = 0;
+	dec->disp_drc.pop_idx = 0;
+
+	dec->is_dynamic_dpb = 1;
+	dec->dynamic_used = 0;
+	dec->is_dpb_full = 0;
+	dec->queued_dpb = 0;
+	dec->display_index = -1;
+	dec->dpb_table_used = 0;
+	dec->sh_handle_dpb.fd = -1;
+	mutex_init(&dec->dpb_mutex);
+
+	mfc_init_dpb_table(ctx);
+
+	dec->sh_handle_dpb.data_size = sizeof(struct dec_dpb_ref_info) * MFC_MAX_BUFFERS;
+	dec->ref_info = vmalloc(dec->sh_handle_dpb.data_size);
+	if (!dec->ref_info) {
+		mfc_ctx_err("failed to allocate decoder information data\n");
+		ret = -ENOMEM;
+		goto fail_dec_init;
+	}
+	for (i = 0; i < MFC_MAX_BUFFERS; i++)
+		dec->ref_info[i].dpb[0].fd[0] = MFC_INFO_INIT_FD;
+
+	if (ctx->dev->debugfs.sfr_dump & MFC_DUMP_DEC_CRC) {
+		dec->crc = vmalloc(SZ_1K);
+		if (!dec->crc) {
+			ret = -ENOMEM;
+			goto fail_dec_init;
+		}
+		dec->crc_idx = 0;
+	}
+
+	/* Init videobuf2 queue for OUTPUT */
+	ctx->vq_src.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	ctx->vq_src.drv_priv = ctx;
+	ctx->vq_src.buf_struct_size = (unsigned int)sizeof(struct mfc_buf);
+	ctx->vq_src.io_modes = VB2_USERPTR | VB2_DMABUF;
+	ctx->vq_src.ops = mfc_get_dec_vb2_ops();
+	ctx->vq_src.mem_ops = mfc_mem_ops();
+	ctx->vq_src.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	ret = vb2_queue_init(&ctx->vq_src);
+	if (ret) {
+		mfc_ctx_err("Failed to initialize videobuf2 queue(output)\n");
+		goto fail_dec_init;
+	}
+	/* Init videobuf2 queue for CAPTURE */
+	ctx->vq_dst.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	ctx->vq_dst.drv_priv = ctx;
+	ctx->vq_dst.buf_struct_size = (unsigned int)sizeof(struct mfc_buf);
+	ctx->vq_dst.io_modes = VB2_USERPTR | VB2_DMABUF;
+	ctx->vq_dst.ops = mfc_get_dec_vb2_ops();
+	ctx->vq_dst.mem_ops = mfc_mem_ops();
+	ctx->vq_dst.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	ret = vb2_queue_init(&ctx->vq_dst);
+	if (ret) {
+		mfc_ctx_err("Failed to initialize videobuf2 queue(capture)\n");
+		goto fail_dec_init;
+	}
+
+	return ret;
+
+fail_dec_init:
+	__mfc_deinit_dec_ctx(ctx);
+	return ret;
+}
+
 /* Open an MFC node */
 static int mfc_open(struct file *file)
 {
@@ -49,6 +236,7 @@ static int mfc_open(struct file *file)
 	int i, ret = 0;
 	enum mfc_node_type node;
 	struct video_device *vdev = NULL;
+	unsigned long total_mb = 0, max_hw_mb = 0;
 
 	if (!dev) {
 		mfc_pr_err("no mfc device to run\n");
@@ -60,6 +248,26 @@ static int mfc_open(struct file *file)
 	if (mutex_lock_interruptible(&dev->mfc_mutex))
 		return -ERESTARTSYS;
 
+	/* Check mfc_open() of spec over */
+	for (i = 0; i < dev->num_core; i++)
+		max_hw_mb += dev->core[i]->core_pdata->max_hw_mb;
+	for (i = 0; i < MFC_NUM_CONTEXTS; i++) {
+		if (!dev->ctx[i])
+			continue;
+		total_mb += dev->ctx[i]->weighted_mb;
+		mfc_show_ctx_info(dev->ctx[i]);
+	}
+	if (total_mb >= max_hw_mb) {
+		mfc_dev_info
+			("[RM] now MFC work with full spec(mb: %lu / %lu)\n",
+			total_mb, max_hw_mb);
+		for (i = 0; i < MFC_NUM_CONTEXTS; i++) {
+			if (!dev->ctx[i])
+				continue;
+			mfc_print_ctx_info(dev->ctx[i]);
+		}
+	}
+
 	node = mfc_get_node_type(file);
 	if (node == MFCNODE_INVALID) {
 		mfc_dev_err("cannot specify node type\n");
@@ -109,20 +317,32 @@ static int mfc_open(struct file *file)
 		}
 	}
 
+	spin_lock_init(&ctx->buf_queue_lock);
+	spin_lock_init(&ctx->meminfo_queue_lock);
 	spin_lock_init(&ctx->corelock.lock);
+	spin_lock_init(&ctx->src_ts.ts_lock);
+	spin_lock_init(&ctx->dst_q_ts.ts_lock);
+	spin_lock_init(&ctx->dst_dq_ts.ts_lock);
+	spin_lock_init(&ctx->src_q_ts.ts_lock);
 	mutex_init(&ctx->intlock.core_mutex);
 	mutex_init(&ctx->op_mode_mutex);
+	mutex_init(&ctx->drc_wait_mutex);
 	init_waitqueue_head(&ctx->corelock.wq);
+	init_waitqueue_head(&ctx->corelock.migrate_wq);
+	INIT_LIST_HEAD(&ctx->dst_q_ts.ts_list);
+	INIT_LIST_HEAD(&ctx->dst_dq_ts.ts_list);
+	INIT_LIST_HEAD(&ctx->src_q_ts.ts_list);
 
 	mfc_ctx_change_idle_mode(ctx, MFC_IDLE_MODE_NONE);
 
 	if (mfc_is_decoder_node(node)) {
-		ctx->type = MFCINST_DECODER;
+		ret = __mfc_init_dec_ctx(ctx);
 		dev->num_dec_inst++;
 	} else {
-		ctx->type = MFCINST_ENCODER;
 		dev->num_enc_inst++;
 	}
+	if (ret)
+		goto err_ctx_init;
 
 	if (dev->num_inst == 1) {
 		/* all of the ctx list */
@@ -131,6 +351,12 @@ static int mfc_open(struct file *file)
 		/* idle mode */
 		spin_lock_init(&dev->idle_bits_lock);
 	}
+	if (mfc_is_decoder_node(node))
+		ret = call_cop(ctx, init_ctx_ctrls, ctx);
+	if (ret) {
+		mfc_ctx_err("failed in init_ctx_ctrls\n");
+		goto err_ctx_init;
+	}
 
 	mfc_ctx_info
 		("NORMAL %s instance is opened [%d]\n",
@@ -155,11 +381,16 @@ static int mfc_open(struct file *file)
 		("[INFO] %s opened (ctx:%d, total:%d)\n",
 		mfc_is_decoder_node(node) ? "DEC" : "ENC", ctx->num, dev->num_inst);
 
+	queue_work(dev->butler_wq, &dev->butler_work);
+
 	mutex_unlock(&dev->mfc_mutex);
 	return ret;
 
 	/* Deinit when failure occurred */
 err_inst_init:
+	call_cop(ctx, cleanup_ctx_ctrls, ctx);
+
+err_ctx_init:
 	if (mfc_is_decoder_node(node))
 		dev->num_dec_inst--;
 	else
@@ -192,10 +423,13 @@ static int mfc_release(struct file *file)
 {
 	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
 	struct mfc_dev *dev = ctx->dev;
+	struct mfc_ctx *move_ctx;
 	int ret = 0;
+	int i;
 	unsigned long flags;
 
 	mutex_lock(&dev->mfc_mutex);
+	mutex_lock(&dev->mfc_migrate_mutex);
 
 	mfc_ctx_info
 		("%s instance release is called [%d]\n",
@@ -215,6 +449,12 @@ static int mfc_release(struct file *file)
 	 * So, we need to performed stop_streaming
 	 * before instance de-init(CLOSE_INSTANCE).
 	 */
+	if (ctx->type == MFCINST_DECODER) {
+		vb2_queue_release(&ctx->vq_src);
+		vb2_queue_release(&ctx->vq_dst);
+
+		call_cop(ctx, cleanup_ctx_ctrls, ctx);
+	}
 
 	ret = mfc_rm_instance_deinit(dev, ctx);
 	if (ret) {
@@ -224,13 +464,27 @@ static int mfc_release(struct file *file)
 
 	dev->num_inst--;
 
-	if (ctx->type == MFCINST_DECODER)
+	if (IS_MULTI_CORE_DEVICE(dev))
+		mfc_rm_load_balancing(ctx, MFC_RM_LOAD_DELETE_UPDATE);
+
+	if (ctx->type == MFCINST_DECODER) {
+		__mfc_deinit_dec_ctx(ctx);
 		dev->num_dec_inst--;
-	else if (ctx->type == MFCINST_ENCODER)
+	} else if (ctx->type == MFCINST_ENCODER) {
 		dev->num_enc_inst--;
+	}
 
 	MFC_TRACE_CTX_LT("[INFO] Release finished (ctx:%d, total:%d)\n", ctx->num, dev->num_inst);
 
+	/* If ctx is move_ctx in migration worker, clear move_ctx */
+	for (i = 0; i < dev->move_ctx_cnt; i++) {
+		move_ctx = dev->move_ctx[i];
+		if (move_ctx && move_ctx->num == ctx->num) {
+			dev->move_ctx[i] = NULL;
+			break;
+		}
+	}
+
 	spin_lock_irqsave(&dev->ctx_list_lock, flags);
 	dev->ctx[ctx->num] = NULL;
 	kfree(ctx);
@@ -238,17 +492,49 @@ static int mfc_release(struct file *file)
 
 	mfc_dev_info("mfc driver release finished [%d]\n", dev->num_inst);
 
+	queue_work(dev->butler_wq, &dev->butler_work);
+
 end_release:
+	mutex_unlock(&dev->mfc_migrate_mutex);
 	mutex_unlock(&dev->mfc_mutex);
 	return ret;
 }
 
+/* Poll */
+static __poll_t mfc_poll(struct file *file, struct poll_table_struct *wait)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	unsigned long req_events = poll_requested_events(wait);
+	__poll_t ret = 0;
+
+	mfc_ctx_debug_enter();
+
+	if (mfc_rm_query_state(ctx, EQUAL, MFCINST_ERROR)) {
+		if (req_events & (POLLOUT | POLLWRNORM))
+			mfc_ctx_err("SRC: Call on POLL after unrecoverable error\n");
+		else
+			mfc_ctx_err("DST: Call on POLL after unrecoverable error\n");
+		return EPOLLERR;
+	}
+
+	if (req_events & (POLLOUT | POLLWRNORM)) {
+		mfc_ctx_debug(2, "wait source buffer\n");
+		ret = vb2_poll(&ctx->vq_src, file, wait);
+	} else if (req_events & (POLLIN | POLLRDNORM)) {
+		mfc_ctx_debug(2, "wait destination buffer\n");
+		ret = vb2_poll(&ctx->vq_dst, file, wait);
+	}
+
+	mfc_ctx_debug_leave();
+	return ret;
+}
+
 /* v4l2 ops */
 static const struct v4l2_file_operations mfc_fops = {
 	.owner = THIS_MODULE,
 	.open = mfc_open,
 	.release = mfc_release,
-	.poll = NULL,
+	.poll = mfc_poll,
 	.unlocked_ioctl = video_ioctl2,
 };
 
@@ -278,6 +564,9 @@ static void __mfc_parse_dt_resource(struct mfc_dev *dev, struct device_node *np)
 		of_property_read_u32_index(np_tmp, "info", idx++, &codec_mode);
 		resource = &dev->pdata->mfc_resource[codec_mode];
 		of_property_read_u32_index(np_tmp, "info", idx++, (u32 *)&resource->op_core_type);
+		of_property_read_u32_index(np_tmp, "info", idx++, &resource->max_kbps);
+		if (resource->max_kbps > dev->max_kbps)
+			dev->max_kbps = resource->max_kbps;
 	}
 }
 
@@ -309,17 +598,104 @@ static int __mfc_parse_dt(struct device_node *np, struct mfc_dev *mfc)
 	/* Resource of standard */
 	__mfc_parse_dt_resource(mfc, np);
 
+	/* Features */
+	of_property_read_u32_array(np, "skype", &pdata->skype.support, 2);
+	of_property_read_u32_array
+		(np, "black_bar",
+		&pdata->black_bar.support, 2);
+	of_property_read_u32_array
+		(np, "color_aspect_dec",
+		&pdata->color_aspect_dec.support, 2);
+	of_property_read_u32_array
+		(np, "static_info_dec",
+		&pdata->static_info_dec.support, 2);
+	of_property_read_u32_array
+		(np, "vp9_stride_align",
+		&pdata->vp9_stride_align.support, 2);
 	of_property_read_u32_array
 		(np, "mem_clear",
 		&pdata->mem_clear.support, 2);
 	of_property_read_u32_array
 		(np, "wait_fw_status",
 		&pdata->wait_fw_status.support, 2);
+	of_property_read_u32_array
+		(np, "hevc_pic_output_flag",
+		&pdata->hevc_pic_output_flag.support, 2);
+
+	/* H/W limitation or option */
+	of_property_read_u32(np, "stride_align", &pdata->stride_align);
+	of_property_read_u32(np, "stride_type", &pdata->stride_type);
+	of_property_read_u32(np, "stream_buf_limit", &pdata->stream_buf_limit);
+	of_property_read_u32(np, "support_8K_cavlc", &pdata->support_8K_cavlc);
+
+	/* Formats */
+	of_property_read_u32(np, "support_422", &pdata->support_422);
+
+	/* Resolution */
+	of_property_read_u32(np, "support_check_res", &pdata->support_check_res);
+
+	/* HWACG */
+	of_property_read_u32(np, "support_hwacg", &pdata->support_hwacg);
+
+	/* display_err_type */
+	of_property_read_u32(np, "display_err_type", &pdata->display_err_type);
+
+	/* output buffer Q framerate */
+	of_property_read_u32(np, "display_framerate", &pdata->display_framerate);
+
+	of_property_read_u32_array
+		(np, "bw_dec_h264",
+		&pdata->mfc_bw_info.bw_dec_h264.peak, 3);
+
+	/* QoS weight */
+	of_property_read_u32(np, "dynamic_weight", &pdata->dynamic_weight);
+	of_property_read_u32
+			(np, "qos_weight_h264_hevc",
+			&pdata->qos_weight.weight_h264_hevc);
+	of_property_read_u32
+			(np, "qos_weight_3plane",
+			&pdata->qos_weight.weight_3plane);
+	of_property_read_u32
+			(np, "qos_weight_num_of_tile",
+			&pdata->qos_weight.weight_num_of_tile);
+	of_property_read_u32
+			(np, "qos_weight_mbaff",
+			&pdata->qos_weight.weight_mbaff);
+
+	/* Bitrate control for QoS */
+	of_property_read_u32(np, "num_mfc_freq", &pdata->num_mfc_freq);
+	if (pdata->num_mfc_freq)
+		of_property_read_u32_array
+			(np, "mfc_freqs",
+			pdata->mfc_freqs, pdata->num_mfc_freq);
+
+	/* Core balance(%) for resource managing */
+	of_property_read_u32(np, "core_balance", &pdata->core_balance);
+
+	/* MFC IOVA threshold */
+	of_property_read_u32(np, "iova_threshold", &pdata->iova_threshold);
+
+	/* MFC idle clock control */
+	of_property_read_u32(np, "idle_clk_ctrl", &pdata->idle_clk_ctrl);
+
+	/* QoS level for pm_qos dynamic control */
+	of_property_read_u32(np, "qos_ctrl_level", &pdata->qos_ctrl_level);
+
+	/* Memlog size */
+	of_property_read_u32(np, "memlog_size", &pdata->memlog_size);
+	of_property_read_u32(np, "memlog_sfr_size", &pdata->memlog_sfr_size);
+
+	/* offset for saving result of regression */
+	of_property_read_u32
+			(np, "reg_h264_loop_filter_disable",
+			&pdata->reg_h264_loop_filter_disable);
 
 	/* Scheduler */
 	of_property_read_u32(np, "scheduler", &pdata->scheduler);
 	of_property_read_u32(np, "pbs_num_prio", &pdata->pbs_num_prio);
 
+	of_property_read_u32(np, "support_mv_hevc", &pdata->support_mv_hevc);
+
 	return 0;
 }
 
@@ -341,6 +717,11 @@ static struct video_device *__mfc_video_device_register
 	vfd->minor = -1;
 	vfd->release = video_device_release;
 
+	if (IS_DEC_NODE(node_num))
+		vfd->ioctl_ops = mfc_get_dec_v4l2_ioctl_ops();
+	else if (IS_ENC_NODE(node_num))
+		vfd->ioctl_ops = NULL;
+
 	vfd->lock = &dev->mfc_mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
 	vfd->vfl_dir = VFL_DIR_M2M;
@@ -413,6 +794,7 @@ static int mfc_probe(struct platform_device *pdev)
 	dma_set_mask(&pdev->dev, DMA_BIT_MASK(dev->pdata->dma_bit_mask));
 
 	mutex_init(&dev->mfc_mutex);
+	mutex_init(&dev->mfc_migrate_mutex);
 
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret)
@@ -437,6 +819,24 @@ static int mfc_probe(struct platform_device *pdev)
 	}
 	/* end of node setting*/
 
+	/* instance migration worker */
+	dev->migration_wq = alloc_workqueue("mfc/inst_migration", WQ_UNBOUND
+					| WQ_MEM_RECLAIM | WQ_HIGHPRI, 1);
+	if (!dev->migration_wq) {
+		dev_err(&pdev->dev, "failed to create workqueue for migration wq\n");
+		goto err_migration_work;
+	}
+	INIT_WORK(&dev->migration_work, mfc_rm_migration_worker);
+
+	/* main butler worker */
+	dev->butler_wq = alloc_workqueue("mfc/butler", WQ_UNBOUND
+					| WQ_MEM_RECLAIM | WQ_HIGHPRI, 1);
+	if (!dev->butler_wq) {
+		dev_err(&pdev->dev, "failed to create workqueue for butler\n");
+		goto err_butler_wq;
+	}
+	INIT_WORK(&dev->butler_work, mfc_butler_worker);
+
 	/* for DVA reservation */
 	if (dev->pdata->reserved_start) {
 		dev->domain = iommu_get_domain_for_dev(dev->device);
@@ -461,6 +861,10 @@ static int mfc_probe(struct platform_device *pdev)
 
 /* Deinit MFC if probe had failed */
 err_iova_reserve:
+	destroy_workqueue(dev->butler_wq);
+err_butler_wq:
+	destroy_workqueue(dev->migration_wq);
+err_migration_work:
 	video_unregister_device(dev->vfd_enc);
 alloc_vdev_enc:
 	video_unregister_device(dev->vfd_dec);
@@ -468,6 +872,7 @@ static int mfc_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_v4l2_dev:
 	mutex_destroy(&dev->mfc_mutex);
+	mutex_destroy(&dev->mfc_migrate_mutex);
 err_res_mem:
 	return ret;
 }
@@ -482,6 +887,10 @@ static void mfc_remove(struct platform_device *pdev)
 	platform_driver_unregister(&mfc_core_driver);
 	mfc_unconfigure_dma_memory(dev);
 	of_reserved_mem_device_release(dev->device);
+	flush_workqueue(dev->butler_wq);
+	destroy_workqueue(dev->butler_wq);
+	flush_workqueue(dev->migration_wq);
+	destroy_workqueue(dev->migration_wq);
 
 	mfc_deinit_debugfs(dev);
 	video_unregister_device(dev->vfd_enc);
@@ -665,6 +1074,7 @@ static const struct dev_pm_ops mfc_pm_ops = {
 
 struct mfc_ctx_buf_size mfc_ctx_buf_size = {
 	.dev_ctx	= PAGE_ALIGN(0x7800),	/*  30KB */
+	.h264_dec_ctx	= PAGE_ALIGN(0x200000),	/* 1.6MB */
 	.dbg_info_buf	= PAGE_ALIGN(0x1000),	/* 4KB for DEBUG INFO */
 };
 
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.c b/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.c
index 5baa76a6b405..59cd6f3945ff 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.c
@@ -14,18 +14,34 @@
 
 #include "mfc_debugfs.h"
 
+#include "base/mfc_queue.h"
+
 static int __mfc_info_show(struct seq_file *s, void *unused)
 {
 	struct mfc_dev *dev = s->private;
 	struct mfc_core *core = NULL;
+	struct mfc_ctx *ctx = NULL;
 	struct mfc_core_ctx *core_ctx = NULL;
 	int i, j;
+	char *codec_name = NULL, *fmt_name = NULL;
 
 	seq_puts(s, ">>> MFC common device information\n");
 	seq_printf(s, " [DEBUG MODE] dt: %s sysfs: %s\n",
 		   dev->pdata->debug_mode ? "enabled" : "disabled",
 		   dev->debugfs.debug_mode_en ? "enabled" : "disabled");
-
+	seq_printf(s, " [FEATURES] skype: %d(0x%x), black_bar: %d(0x%x)\n",
+		   dev->pdata->skype.support, dev->pdata->skype.version,
+		   dev->pdata->black_bar.support,
+		   dev->pdata->black_bar.version);
+	seq_printf(s, "           color_aspect_dec: %d(0x%x)\n",
+		   dev->pdata->color_aspect_dec.support,
+		   dev->pdata->color_aspect_dec.version);
+	seq_printf(s, "           static_info_dec: %d(0x%x)\n",
+		   dev->pdata->static_info_dec.support,
+		   dev->pdata->static_info_dec.version);
+	seq_printf(s, " [FORMATS] 10bit: %s, 422: %s\n",
+		   dev->pdata->support_10bit ? "supported" : "not supported",
+		   dev->pdata->support_422 ? "supported" : "not supported");
 	seq_printf(s, " [LOWMEM] is_low_mem: %d\n", IS_LOW_MEM);
 
 	for (j = 0; j < dev->num_core; j++) {
@@ -54,9 +70,46 @@ static int __mfc_info_show(struct seq_file *s, void *unused)
 		for (i = 0; i < MFC_NUM_CONTEXTS; i++) {
 			core_ctx = core->core_ctx[i];
 			if (core_ctx) {
-				seq_printf(s, "    [CORECTX:%d] state: %d\n",
-					   i, core_ctx->state);
+				seq_printf(s, "    [CORECTX:%d] state: %d, queue(src: %d, dst: %d)\n",
+					   i, core_ctx->state,
+					   mfc_get_queue_count(&core_ctx->ctx->buf_queue_lock,
+							       &core_ctx->src_buf_queue),
+					   mfc_get_queue_count(&core_ctx->ctx->buf_queue_lock,
+							       &core_ctx->dst_buf_queue));
+			}
+		}
+	}
+	seq_puts(s, ">>> MFC instance information\n");
+	for (i = 0; i < MFC_NUM_CONTEXTS; i++) {
+		ctx = dev->ctx[i];
+		if (ctx) {
+			if (ctx->type == MFCINST_DECODER) {
+				codec_name = ctx->src_fmt->name;
+				fmt_name = ctx->dst_fmt->name;
+			} else {
+				codec_name = ctx->dst_fmt->name;
+				fmt_name = ctx->src_fmt->name;
 			}
+
+			seq_printf(s, "  [CTX:%d] %s%s %s, size: %dx%d@%ldfps(ts: %lufps, tmu: %dfps, op: %lufps), crop: %d %d %d %d\n",
+				   ctx->num, codec_name, ctx->multi_view_enable ? "(MV-HEVC)" : "",
+				   fmt_name,
+				   ctx->img_width, ctx->img_height,
+				   ctx->framerate / 1000,
+				   ctx->last_framerate / 1000,
+				   ctx->dev->tmu_fps,
+				   ctx->operating_framerate,
+				   ctx->crop_width, ctx->crop_height,
+				   ctx->crop_left, ctx->crop_top);
+			seq_printf(s, "        main core: %d, op_mode: %d(stream: %d), idle_mode: %d, prio %d, rt %d, queue(src: %d, dst: %d, ref: %d)\n",
+				   ctx->op_core_num[MFC_CORE_MAIN],
+				   ctx->op_mode, ctx->stream_op_mode, ctx->idle_mode,
+				   ctx->prio, ctx->rt,
+				   mfc_get_queue_count(&ctx->buf_queue_lock,
+						       &ctx->src_buf_ready_queue),
+				   mfc_get_queue_count(&ctx->buf_queue_lock, &ctx->dst_buf_queue),
+				   mfc_get_queue_count(&ctx->buf_queue_lock, &ctx->ref_buf_queue));
+			seq_puts(s, "\n");
 		}
 	}
 
@@ -175,6 +228,7 @@ void mfc_init_debugfs(struct mfc_dev *dev)
 	debugfs_create_u32("sfr_dump", 0644, debugfs->root, &dev->debugfs.sfr_dump);
 
 	debugfs_create_u32("feature_option", 0644, debugfs->root, &dev->debugfs.feature_option);
+	debugfs_create_u32("core_balance", 0644, debugfs->root, &dev->debugfs.core_balance);
 	debugfs_create_u32("logging_option", 0644, debugfs->root, &dev->debugfs.logging_option);
 	debugfs_create_u32("sched_perf_disable", 0644,
 			   debugfs->root, &dev->debugfs.sched_perf_disable);
-- 
2.34.1

