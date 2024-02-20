Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF47D85C316
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 18:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90C610E50A;
	Tue, 20 Feb 2024 17:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZmgGg/l+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D73D10E4FB;
 Tue, 20 Feb 2024 17:55:53 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41KFxWIL006394; Tue, 20 Feb 2024 17:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=HLpjRfYBX4Z8FmpCiRCvzl2Jwb82cJ0rrawhZ/x4Ozk=; b=Zm
 gGg/l+ph2pNmowA+NDGNmRNXp1bXp+d/7BAJuzX50fuJnG5CcnFFHhv4xim0GCOf
 K2iNd+qbpuIMC0IRPflriZE+BPocV4B7hCu8KAkBanbEc+ecqnMrzWTwmWJDCLE7
 2b0Gau9UjMFsKwHwl8xf6vsvQ4pC4Ags5ESHnLY6ogOqiuNgnKXqIo2j8lgFtIoL
 1J5EEiabjHGTEHiwP/+ECPZgHBaJ/0uA9y6IGy7JhITiVYDBgQvJbISUtkg8HKi6
 kgpdp0lvfu3oRz0w6Dc5h1K3XKPowZVwfkSegoJFw3UuVgLpQp7EVk5iExS/y/s3
 q7Km3SfghFZNXCtGbN4Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wct390y8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 17:55:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KHtlmo021443
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 17:55:47 GMT
Received: from [10.110.53.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 09:55:46 -0800
Message-ID: <30f383ce-0952-0dc1-a7a1-a7565526f728@quicinc.com>
Date: Tue, 20 Feb 2024 09:55:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 13/19] drm/msm/dp: add VSC SDP support for YUV420 over
 DP
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
 <quic_khsieh@quicinc.com>, <marijn.suijten@somainline.org>,
 <neil.armstrong@linaro.org>
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
 <20240216230228.26713-14-quic_parellan@quicinc.com>
 <CAA8EJppO4FcJJex8mBbPoDyUbkn4zFvDFR0h3sOY75Qth15Rng@mail.gmail.com>
Content-Language: en-US
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <CAA8EJppO4FcJJex8mBbPoDyUbkn4zFvDFR0h3sOY75Qth15Rng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: j15BYvnis1Mvt5KWqgekM_BLg8vb60Xo
X-Proofpoint-GUID: j15BYvnis1Mvt5KWqgekM_BLg8vb60Xo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402200128
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


On 2/17/2024 12:56 AM, Dmitry Baryshkov wrote:
> On Sat, 17 Feb 2024 at 01:03, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>> Add support to pack and send the VSC SDP packet for DP. This therefore
>> allows the transmision of format information to the sinks which is
>> needed for YUV420 support over DP.
>>
>> Changes in v4:
>>          - Remove struct msm_dp_sdp_with_parity
>>          - Use dp_utils_pack_sdp_header() to pack the SDP header and
>>            parity bytes into a buffer
>>          - Use this buffer when writing the VSC SDP data in
>>            dp_catalog_panel_send_vsc_sdp()
>>          - Write to all of the MMSS_DP_GENERIC0 registers instead of just
>>            the ones with non-zero values
>>
>> Changes in v3:
>>          - Create a new struct, msm_dp_sdp_with_parity, which holds the
>>            packing information for VSC SDP
>>          - Use drm_dp_vsc_sdp_pack() to pack the data into the new
>>            msm_dp_sdp_with_parity struct instead of specifically packing
>>            for YUV420 format
>>          - Modify dp_catalog_panel_send_vsc_sdp() to send the VSC SDP
>>            data using the new msm_dp_sdp_with_parity struct
>>
>> Changes in v2:
>>          - Rename GENERIC0_SDPSIZE macro to GENERIC0_SDPSIZE_VALID
>>          - Remove dp_sdp from the dp_catalog struct since this data is
>>            being allocated at the point used
>>          - Create a new function in dp_utils to pack the VSC SDP data
>>            into a buffer
>>          - Create a new function that packs the SDP header bytes into a
>>            buffer. This function is made generic so that it can be
>>            utilized by dp_audio
>>            header bytes into a buffer
>>          - Create a new function in dp_utils that takes the packed buffer
>>            and writes to the DP_GENERIC0_* registers
>>          - Split the dp_catalog_panel_config_vsc_sdp() function into two
>>            to disable/enable sending VSC SDP packets
>>          - Check the DP HW version using the original useage of
>>            dp_catalog_hw_revision() and correct the version checking
>>            logic
>>          - Rename dp_panel_setup_vsc_sdp() to
>>            dp_panel_setup_vsc_sdp_yuv_420() to explicitly state that
>>            currently VSC SDP is only being set up to support YUV420 modes
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_catalog.c | 107 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_catalog.h |   7 ++
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 ++
>>   drivers/gpu/drm/msm/dp/dp_panel.c   |  55 ++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
>>   drivers/gpu/drm/msm/dp/dp_utils.c   |  56 +++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_utils.h   |   4 ++
>>   7 files changed, 236 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> index 5d84c089e520a..c6e57812a239e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> @@ -901,6 +901,113 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
>>          return 0;
>>   }
>>
>> +static void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp,
>> +                                         u32 *header)
>> +{
>> +       struct dp_catalog_private *catalog;
>> +       u32 val;
>> +       int i;
>> +
>> +       if (!dp_catalog) {
>> +               DRM_ERROR("invalid input\n");
>> +               return;
>> +       }
> We are two or three levels deep in the dp_catalog. Do we really need
> to check that dp_catalog is not NULL?
>
> Side note: I think we should drop most of such checks. They add
> nothing, just clobber the code.


Ack. The dp_catalog checks do seem unnecessary.


>
>
>> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
>> +
>> +       dp_write_link(catalog, MMSS_DP_GENERIC0_0, header[0]);
>> +       dp_write_link(catalog, MMSS_DP_GENERIC0_1, header[1]);
>> +
>> +       for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
>> +               val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
>> +                      (vsc_sdp->db[i + 3] << 24));
>> +               dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i, val);
>> +       }
>> +}
>> +
>> +static void dp_catalog_panel_update_sdp(struct dp_catalog *dp_catalog)
>> +{
>> +       struct dp_catalog_private *catalog;
>> +       u32 hw_revision;
>> +
>> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
>> +
>> +       hw_revision = dp_catalog_hw_revision(dp_catalog);
>> +       if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
>> +               dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
>> +               dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
>> +       }
>> +}
>> +
>> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp,
>> +                                    u32 *header)
>> +{
>> +       struct dp_catalog_private *catalog;
>> +       u32 cfg, cfg2, misc;
>> +
>> +       if (!dp_catalog) {
>> +               DRM_ERROR("invalid input\n");
>> +               return;
>> +       }
>> +
>> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
>> +
>> +       cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
>> +       cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
>> +       misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
>> +
>> +       cfg |= GEN0_SDP_EN;
>> +       dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
>> +
>> +       cfg2 |= GENERIC0_SDPSIZE_VALID;
>> +       dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
>> +
>> +       dp_catalog_panel_send_vsc_sdp(dp_catalog, vsc_sdp, header);
>> +
>> +       /* indicates presence of VSC (BIT(6) of MISC1) */
>> +       misc |= DP_MISC1_VSC_SDP;
>> +
>> +       drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
>> +
>> +       pr_debug("misc settings = 0x%x\n", misc);
>> +       dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
>> +
>> +       dp_catalog_panel_update_sdp(dp_catalog);
>> +}
>> +
>> +void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog)
>> +{
>> +       struct dp_catalog_private *catalog;
>> +       u32 cfg, cfg2, misc;
>> +
>> +       if (!dp_catalog) {
>> +               DRM_ERROR("invalid input\n");
>> +               return;
>> +       }
>> +
>> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
>> +
>> +       cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
>> +       cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
>> +       misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
>> +
>> +       cfg &= ~GEN0_SDP_EN;
>> +       dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
>> +
>> +       cfg2 &= ~GENERIC0_SDPSIZE_VALID;
>> +       dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
>> +
>> +       /* switch back to MSA */
>> +       misc &= ~DP_MISC1_VSC_SDP;
>> +
>> +       drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=0\n");
>> +
>> +       pr_debug("misc settings = 0x%x\n", misc);
>> +       dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
>> +
>> +       dp_catalog_panel_update_sdp(dp_catalog);
>> +}
>> +
>>   void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>>                                  struct drm_display_mode *drm_mode)
>>   {
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> index 6cb5e2a243de2..4bdc087410a68 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> @@ -9,6 +9,7 @@
>>   #include <drm/drm_modes.h>
>>
>>   #include "dp_parser.h"
>> +#include "dp_utils.h"
>>   #include "disp/msm_disp_snapshot.h"
>>
>>   /* interrupts */
>> @@ -30,6 +31,9 @@
>>
>>   #define DP_AUX_CFG_MAX_VALUE_CNT 3
>>
>> +#define DP_HW_VERSION_1_0      0x10000000
>> +#define DP_HW_VERSION_1_2      0x10020000
>> +
>>   /* PHY AUX config registers */
>>   enum dp_phy_aux_config_type {
>>          PHY_AUX_CFG0,
>> @@ -124,6 +128,9 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
>>
>>   /* DP Panel APIs */
>>   int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
>> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp,
>> +                                    u32 *header);
>> +void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog);
>>   void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
>>   void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>>                                  struct drm_display_mode *drm_mode);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index bffb7bac2c2c8..a42b29f9902c1 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1947,6 +1947,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>>          dp_io = &ctrl->parser->io;
>>          phy = dp_io->phy;
>>
>> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
>> +
>>          /* set dongle to D3 (power off) mode */
>>          dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
>>
>> @@ -2021,6 +2023,8 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>>          dp_io = &ctrl->parser->io;
>>          phy = dp_io->phy;
>>
>> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
>> +
>>          dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>>
>>          dp_catalog_ctrl_reset(ctrl->catalog);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index db1942794f1a4..417655dca2bba 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -4,6 +4,7 @@
>>    */
>>
>>   #include "dp_panel.h"
>> +#include "dp_utils.h"
>>
>>   #include <drm/drm_connector.h>
>>   #include <drm/drm_edid.h>
>> @@ -281,6 +282,56 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
>>          dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
>>   }
>>
>> +static int dp_panel_setup_vsc_sdp_yuv_420(struct dp_panel *dp_panel)
>> +{
>> +       struct dp_catalog *catalog;
>> +       struct dp_panel_private *panel;
>> +       struct dp_display_mode *dp_mode;
>> +       struct drm_dp_vsc_sdp vsc_sdp_data;
>> +       struct dp_sdp vsc_sdp;
>> +       ssize_t len;
>> +       u32 header[2];
>> +       int rc = 0;
>> +
>> +       if (!dp_panel) {
>> +               DRM_ERROR("invalid input\n");
>> +               rc = -EINVAL;
>> +               return rc;
> return -EINVAL directly.


Ack.


>
>> +       }
>> +
>> +       panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>> +       catalog = panel->catalog;
>> +       dp_mode = &dp_panel->dp_mode;
>> +
>> +       memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
>> +
>> +       /* VSC SDP header as per table 2-118 of DP 1.4 specification */
>> +       vsc_sdp_data.sdp_type = DP_SDP_VSC;
>> +       vsc_sdp_data.revision = 0x05;
>> +       vsc_sdp_data.length = 0x13;
>> +
>> +       /* VSC SDP Payload for DB16 */
>> +       vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
>> +       vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
>> +
>> +       /* VSC SDP Payload for DB17 */
>> +       vsc_sdp_data.bpc = dp_mode->bpp / 3;
>> +       vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
>> +
>> +       /* VSC SDP Payload for DB18 */
>> +       vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
>> +
>> +       len = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &vsc_sdp, header);
>> +       if (len < 0) {
>> +               DRM_ERROR("unable to pack vsc sdp\n");
>> +               return len;
>> +       }
> So, at this point we have the header data both in vsc_sdp.sdp_header
> and in the packed header. The relationship between them becomes less
> obvious. Could you please pack dp_sdp_header into u32[2] just before
> writing it? It really makes little sense to pass both at the same
> time.


Just want to clear some stuff up. Do you want to call the 
dp_utils_pack_sdp_header() function right before 
dp_catalog_panel_send_vsc_sdp()? The point of putting the 
dp_utils_pack_sdp_header() function inside dp_utils_pack_vsc_sdp() is so 
that all of the packing could be in the same location. Although I agree 
that we are passing the same values twice, I believe that having it the 
way it is currently is better since it shows that the 
drm_dp_vsc_sdp_pack() and dp_utils_pack_sdp_header() are related since 
they're packing the data to the set of GENERIC0 registers.


>
>> +
>> +       dp_catalog_panel_enable_vsc_sdp(catalog, &vsc_sdp, header);
>> +
>> +       return rc;
> return 0;


Ack.


>
>> +}
>> +
>>   void dp_panel_dump_regs(struct dp_panel *dp_panel)
>>   {
>>          struct dp_catalog *catalog;
>> @@ -344,6 +395,10 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
>>          catalog->dp_active = data;
>>
>>          dp_catalog_panel_timing_cfg(catalog);
>> +
>> +       if (dp_panel->dp_mode.out_fmt_is_yuv_420)
>> +               dp_panel_setup_vsc_sdp_yuv_420(dp_panel);
>> +
>>          panel->panel_on = true;
>>
>>          return 0;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index 78785ed4b40c4..aa9f6c3e4ddeb 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -142,6 +142,7 @@
>>   #define DP_MISC0_SYNCHRONOUS_CLK               (0x00000001)
>>   #define DP_MISC0_COLORIMETRY_CFG_SHIFT         (0x00000001)
>>   #define DP_MISC0_TEST_BITS_DEPTH_SHIFT         (0x00000005)
>> +#define DP_MISC1_VSC_SDP                       (0x00004000)
>>
>>   #define DP_MISC0_COLORIMERY_CFG_LEGACY_RGB     (0)
>>   #define DP_MISC0_COLORIMERY_CFG_CEA_RGB                (0x04)
>> @@ -204,9 +205,11 @@
>>   #define MMSS_DP_AUDIO_CTRL_RESET               (0x00000214)
>>
>>   #define MMSS_DP_SDP_CFG                                (0x00000228)
>> +#define GEN0_SDP_EN                            (0x00020000)
>>   #define MMSS_DP_SDP_CFG2                       (0x0000022C)
>>   #define MMSS_DP_AUDIO_TIMESTAMP_0              (0x00000230)
>>   #define MMSS_DP_AUDIO_TIMESTAMP_1              (0x00000234)
>> +#define GENERIC0_SDPSIZE_VALID                 (0x00010000)
>>
>>   #define MMSS_DP_AUDIO_STREAM_0                 (0x00000240)
>>   #define MMSS_DP_AUDIO_STREAM_1                 (0x00000244)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
>> index 3a44fe738c004..5577e2366a520 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_utils.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_utils.c
>> @@ -4,9 +4,12 @@
>>    */
>>
>>   #include <linux/types.h>
>> +#include <drm/drm_print.h>
>>
>>   #include "dp_utils.h"
>>
>> +#define DP_SDP_HEADER_SIZE             8
>> +
>>   u8 dp_utils_get_g0_value(u8 data)
>>   {
>>          u8 c[4];
>> @@ -71,3 +74,56 @@ u8 dp_utils_calculate_parity(u32 data)
>>
>>          return parity_byte;
>>   }
>> +
>> +ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff)
>> +{
>> +       size_t length;
>> +       u8 header, parity;
>> +
>> +       length = sizeof(header_buff);
>> +       if (length < DP_SDP_HEADER_SIZE)
>> +               return -ENOSPC;
>> +
>> +       memset(header_buff, 0, sizeof(header_buff));
>> +
>> +       /* HEADER BYTE 0 */
>> +       header = sdp_header->HB0;
>> +       parity = dp_utils_calculate_parity(header);
>> +       header_buff[0]   = ((header << HEADER_BYTE_0_BIT) | (parity << PARITY_BYTE_0_BIT));
> Drop extra parentheses, please. Also it might be easier to just call:
>
> header_buff[0] = FIELD_PREP(HEADER_0_MASK, sdp_header->HB0) |
>       FIELD_PREP(PARITY_0_MASK, dp_utils_calculate_parity(sdp_header->HB0) |
>       FIELD_PREP(HEADER_1_MASK, sdp_header->HB1) |
>       FIELD_PREP(PARITY_1_MASK, dp_utils_calculate_parity(sdp_header->HB1);
>
> This is more error proof and (I think) easier to comprehend.


Ack. I agree, I''ll change it for the next version


>
>> +
>> +       /* HEADER BYTE 1 */
>> +       header = sdp_header->HB1;
>> +       parity = dp_utils_calculate_parity(header);
>> +       header_buff[0]  |= ((header << HEADER_BYTE_1_BIT) | (parity << PARITY_BYTE_1_BIT));
>> +
>> +       /* HEADER BYTE 2 */
>> +       header = sdp_header->HB2;
>> +       parity = dp_utils_calculate_parity(header);
>> +       header_buff[1]   = ((header << HEADER_BYTE_2_BIT) | (parity << PARITY_BYTE_2_BIT));
>> +
>> +       /* HEADER BYTE 3 */
>> +       header = sdp_header->HB3;
>> +       parity = dp_utils_calculate_parity(header);
>> +       header_buff[1]  |= ((header << HEADER_BYTE_3_BIT) | (parity << PARITY_BYTE_3_BIT));
>> +
>> +       return length;
>> +}
>> +
>> +ssize_t dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc, struct dp_sdp *vsc_sdp, u32 *header)
>> +{
>> +       ssize_t len;
>> +
>> +       len = drm_dp_vsc_sdp_pack(vsc, vsc_sdp, sizeof(*vsc_sdp));
>> +       if (len < 0) {
>> +               DRM_ERROR("unable to pack vsc sdp\n");
>> +               return len;
>> +       }
>> +
>> +       len = dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
>> +       if (len < 0) {
>> +               DRM_ERROR("unable to pack sdp header\n");
>> +               return len;
>> +       }
>> +
>> +       return len;
>> +}
>> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
>> index 5a505cbf3432b..9d1057bd5a24c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_utils.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_utils.h
>> @@ -6,6 +6,8 @@
>>   #ifndef _DP_UTILS_H_
>>   #define _DP_UTILS_H_
>>
>> +#include <drm/display/drm_dp_helper.h>
>> +
>>   #define HEADER_BYTE_0_BIT       0
>>   #define PARITY_BYTE_0_BIT       8
>>   #define HEADER_BYTE_1_BIT      16
>> @@ -18,5 +20,7 @@
>>   u8 dp_utils_get_g0_value(u8 data);
>>   u8 dp_utils_get_g1_value(u8 data);
>>   u8 dp_utils_calculate_parity(u32 data);
>> +ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff);
>> +ssize_t dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc, struct dp_sdp *vsc_sdp, u32 *header);
>>
>>   #endif /* _DP_UTILS_H_ */
>> --
>> 2.39.2
>>
>
