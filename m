Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8078553C6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 21:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B98C10E066;
	Wed, 14 Feb 2024 20:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="BgrlIAri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEBC10E066;
 Wed, 14 Feb 2024 20:15:13 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41EJ8QxP013235; Wed, 14 Feb 2024 20:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=jpKmv42GdGSw4tuUDQEg6UNt6brYymbTwvBJdvffXtY=; b=Bg
 rlIAri2nrXpp3rUI+CXd1i64Dfqa+f7jEoRjipmDSReTeCBr3KH4MkiW9WzZxBrv
 PmDosDzF7n26qNpbatxYG/Ycs5hXl21fMN83VDeJ8gRcmAuuVUA7mrMUYx6OsSsE
 YkeXjNVKMVEjbNKpgOZPnFvzWWe4I6jc1vKH8bp32iRRRpS+xBkdtiFGiTcfyQej
 x9DuZIMiR7ZfeNHORN6bd7IMd5hUocU84HSxN/YzR00GEu3Td+DIZS57/jSiAUsx
 TolPvvL9JK08rlt7HnPw99vUrN1yyxd4w5MXuKx2FjDB/Qqm6eHOlZjBIeTKE0ay
 owVudQuJCGABBKyOSqfA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8j65t7fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 20:15:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EKF8Kp004008
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 20:15:08 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 14 Feb
 2024 12:15:07 -0800
Message-ID: <917eadef-0d84-be62-9ef2-9048dea97144@quicinc.com>
Date: Wed, 14 Feb 2024 12:15:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 13/19] drm/msm/dp: add VSC SDP support for YUV420 over
 DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Paloma Arellano
 <quic_parellan@quicinc.com>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
 <20240214180347.1399-14-quic_parellan@quicinc.com>
 <CAA8EJppCxHrcUYRdtGJYmjLYu=VwX3KbPXZ4YNsCzagkMEPvLQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppCxHrcUYRdtGJYmjLYu=VwX3KbPXZ4YNsCzagkMEPvLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mNCZ5IuIAdvhS_e7l9deSxk__eVCzm8F
X-Proofpoint-ORIG-GUID: mNCZ5IuIAdvhS_e7l9deSxk__eVCzm8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_12,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140158
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



On 2/14/2024 11:39 AM, Dmitry Baryshkov wrote:
> On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>
>> Add support to pack and send the VSC SDP packet for DP. This therefore
>> allows the transmision of format information to the sinks which is
>> needed for YUV420 support over DP.
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
>>   drivers/gpu/drm/msm/dp/dp_catalog.c | 113 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_catalog.h |   7 ++
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 +
>>   drivers/gpu/drm/msm/dp/dp_panel.c   |  55 ++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
>>   drivers/gpu/drm/msm/dp/dp_utils.c   |  48 ++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_utils.h   |  18 +++++
>>   7 files changed, 248 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> index 5d84c089e520a..61d5317efe683 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> @@ -901,6 +901,119 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
>>          return 0;
>>   }
>>
>> +static void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog,
>> +                                         struct msm_dp_sdp_with_parity *msm_dp_sdp)
>> +{
>> +       struct dp_catalog_private *catalog;
>> +       u32 val;
>> +
>> +       if (!dp_catalog) {
>> +               DRM_ERROR("invalid input\n");
>> +               return;
>> +       }
>> +
>> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
>> +
>> +       val = ((msm_dp_sdp->vsc_sdp.sdp_header.HB0) << HEADER_BYTE_0_BIT |
>> +              (msm_dp_sdp->pb.PB0 << PARITY_BYTE_0_BIT) |
>> +              (msm_dp_sdp->vsc_sdp.sdp_header.HB1) << HEADER_BYTE_1_BIT |
>> +              (msm_dp_sdp->pb.PB1 << PARITY_BYTE_1_BIT));
>> +       dp_write_link(catalog, MMSS_DP_GENERIC0_0, val);
>> +
>> +       val = ((msm_dp_sdp->vsc_sdp.sdp_header.HB2) << HEADER_BYTE_2_BIT |
>> +              (msm_dp_sdp->pb.PB2 << PARITY_BYTE_2_BIT) |
>> +              (msm_dp_sdp->vsc_sdp.sdp_header.HB3) << HEADER_BYTE_3_BIT |
>> +              (msm_dp_sdp->pb.PB3 << PARITY_BYTE_3_BIT));
>> +       dp_write_link(catalog, MMSS_DP_GENERIC0_1, val);
> 
> I still think that this is not the way to do it. Could you please
> extract the function that takes struct dp_sdp_header, calculates
> padding and writes resulting data to the hardware? This way we can
> reuse it later for all the dp_audio stuff.
> 

hmmm ... dp_utils_pack_sdp_header() does that you are asking for right?

OR are you asking for another function like:

1) rename dp_utils_pack_sdp_header() to dp_utils_calc_sdp_parity()
2) dp_utils_pack_sdp() takes two u32 to pack the header and parity 
together and we move the << HEADER_BYTE_xx | part to it

dp_catalog_panel_send_vsc_sdp() just uses these two u32 to write the 
headers.


>> +
>> +       val = ((msm_dp_sdp->vsc_sdp.db[16]) | (msm_dp_sdp->vsc_sdp.db[17] << 8) |
>> +              (msm_dp_sdp->vsc_sdp.db[18] << 16));
>> +       dp_write_link(catalog, MMSS_DP_GENERIC0_6, val);
> 
> Shouldn't we write full dp_sdp data, including all zeroes? Here you
> assume that there is no other data in dp_sdp and also that nobody
> wrote anything senseless to those registers.
> 

As per documentation, it says db[0] to db[15] are reserved so I thought 
its better not to touch/use them and start writing for 16 onwards.

1592  * VSC SDP Payload for Pixel Encoding/Colorimetry Format
1593  * db[0] - db[15]: Reserved
1594  * db[16]: Pixel Encoding and Colorimetry Formats
1595  * db[17]: Dynamic Range and Component Bit Depth
1596  * db[18]: Content Type
1597  * db[19] - db[31]: Reserved
1598  */

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
>> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog,
>> +                                    struct msm_dp_sdp_with_parity *msm_dp_sdp)
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
>> +       dp_catalog_panel_send_vsc_sdp(dp_catalog, msm_dp_sdp);
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
>> index 6cb5e2a243de2..4bf08c27a9bf3 100644
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
>> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog,
>> +                                    struct msm_dp_sdp_with_parity *msm_dp_sdp);
>> +void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog);
>>   void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
>>   void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>>                                  struct drm_display_mode *drm_mode);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 209cf2a35642f..beef86b1aaf81 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1952,6 +1952,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>>          dp_io = &ctrl->parser->io;
>>          phy = dp_io->phy;
>>
>> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
>> +
>>          /* set dongle to D3 (power off) mode */
>>          dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
>>
>> @@ -2026,6 +2028,8 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>>          dp_io = &ctrl->parser->io;
>>          phy = dp_io->phy;
>>
>> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
>> +
>>          dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>>
>>          dp_catalog_ctrl_reset(ctrl->catalog);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index db1942794f1a4..18420a7ba4ab3 100644
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
>> +       struct msm_dp_sdp_with_parity msm_dp_sdp;
>> +       ssize_t len;
>> +       int rc = 0;
>> +
>> +       if (!dp_panel) {
>> +               DRM_ERROR("invalid input\n");
>> +               rc = -EINVAL;
>> +               return rc;
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
>> +       // rc = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &sdp_header, gen_buffer, buff_size);
>> +       len = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &msm_dp_sdp);
>> +       if (len < 0) {
>> +               DRM_ERROR("unable to pack vsc sdp\n");
>> +               return len;
>> +       }
>> +
>> +       dp_catalog_panel_enable_vsc_sdp(catalog, &msm_dp_sdp);
>> +
>> +       return rc;
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
>> index ea85a691e72b5..2983756c125cd 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -142,6 +142,7 @@
>>   #define DP_MISC0_SYNCHRONOUS_CLK               (0x00000001)
>>   #define DP_MISC0_COLORIMETRY_CFG_SHIFT         (0x00000001)
>>   #define DP_MISC0_TEST_BITS_DEPTH_SHIFT         (0x00000005)
>> +#define DP_MISC1_VSC_SDP                       (0x00004000)
>>
>>   #define REG_DP_VALID_BOUNDARY                  (0x00000030)
>>   #define REG_DP_VALID_BOUNDARY_2                        (0x00000034)
>> @@ -201,9 +202,11 @@
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
>> index 3a44fe738c004..81601f3c414fc 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_utils.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_utils.c
>> @@ -4,6 +4,7 @@
>>    */
>>
>>   #include <linux/types.h>
>> +#include <drm/drm_print.h>
>>
>>   #include "dp_utils.h"
>>
>> @@ -71,3 +72,50 @@ u8 dp_utils_calculate_parity(u32 data)
>>
>>          return parity_byte;
>>   }
>> +
>> +ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, struct msm_dp_vsc_sdp_parity *pb,
>> +                                size_t size)
>> +{
>> +       u8 header;
>> +
>> +       size_t length = sizeof(struct msm_dp_vsc_sdp_parity);
>> +
>> +       if (size < length)
>> +               return -ENOSPC;
>> +
>> +       memset(pb, 0, size);
>> +
>> +       header = sdp_header->HB0;
>> +       pb->PB0 = dp_utils_calculate_parity(header);
>> +
>> +       header = sdp_header->HB1;
>> +       pb->PB1 = dp_utils_calculate_parity(header);
>> +
>> +       header = sdp_header->HB2;
>> +       pb->PB2 = dp_utils_calculate_parity(header);
>> +
>> +       header = sdp_header->HB3;
>> +       pb->PB3 = dp_utils_calculate_parity(header);
>> +
>> +       return length;
>> +}
>> +
>> +ssize_t dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc, struct msm_dp_sdp_with_parity *msm_dp_sdp)
>> +{
>> +       ssize_t len;
>> +
>> +       len = drm_dp_vsc_sdp_pack(vsc, &msm_dp_sdp->vsc_sdp, sizeof(msm_dp_sdp->vsc_sdp));
>> +       if (len < 0) {
>> +               DRM_ERROR("unable to pack vsc sdp\n");
>> +               return len;
>> +       }
>> +
>> +       len = dp_utils_pack_sdp_header(&msm_dp_sdp->vsc_sdp.sdp_header, &msm_dp_sdp->pb,
>> +                                      sizeof(msm_dp_sdp->pb));
>> +       if (len < 0) {
>> +               DRM_ERROR("unable to pack sdp header\n");
>> +               return len;
>> +       }
>> +
>> +       return len;
>> +}
>> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
>> index 5a505cbf3432b..6946bc51cae97 100644
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
>> @@ -15,8 +17,24 @@
>>   #define HEADER_BYTE_3_BIT      16
>>   #define PARITY_BYTE_3_BIT      24
>>
>> +struct msm_dp_vsc_sdp_parity {
>> +       u8 PB0;
>> +       u8 PB1;
>> +       u8 PB2;
>> +       u8 PB3;
>> +} __packed;
>> +
>> +struct msm_dp_sdp_with_parity {
>> +       struct dp_sdp vsc_sdp;
>> +       struct msm_dp_vsc_sdp_parity pb;
>> +};
>> +
>>   u8 dp_utils_get_g0_value(u8 data);
>>   u8 dp_utils_get_g1_value(u8 data);
>>   u8 dp_utils_calculate_parity(u32 data);
>> +ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, struct msm_dp_vsc_sdp_parity *pb,
>> +                                size_t size);
>> +ssize_t dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc,
>> +                             struct msm_dp_sdp_with_parity *msm_dp_sdp);
>>
>>   #endif /* _DP_UTILS_H_ */
>> --
>> 2.39.2
>>
> 
> 
