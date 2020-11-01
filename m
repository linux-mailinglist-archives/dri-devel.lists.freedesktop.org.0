Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC462A1C7C
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 08:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1316E197;
	Sun,  1 Nov 2020 07:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7966E197;
 Sun,  1 Nov 2020 07:00:30 +0000 (UTC)
IronPort-SDR: SeN9jViIU8sq/KIHi1JMFxI//hs9IkzCr2s/XSzjGKw1xkWWHS9qGJCEfOLhZT3fmoIpk28BcD
 zlCjWT25rA1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9791"; a="186597713"
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="186597713"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2020 00:00:22 -0700
IronPort-SDR: o8bZHuNQBT48IXmzkCk+NeA+8XCVfnC8tGSLsSq3BiP3663Ps6gAzhoc747pAI/oUPF5BhQdgw
 YrFU7L+bi/IA==
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="537584022"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.215.177.133])
 ([10.215.177.133])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2020 00:00:20 -0700
Subject: Re: [RFC 10/13] drm/dp_helper: Add support for Configuring DSC for
 HDMI2.1 Pcon
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
 <20201015105259.27934-11-ankit.k.nautiyal@intel.com>
 <20f0995bdc9c4d3fb4b212a2acc3b257@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <a452b66a-2e91-9535-5b0b-220d0231fb59@intel.com>
Date: Sun, 1 Nov 2020 12:30:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20f0995bdc9c4d3fb4b212a2acc3b257@intel.com>
Content-Language: en-US
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/19/2020 4:49 AM, Shankar, Uma wrote:
>
>> -----Original Message-----
>> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
>> Sent: Thursday, October 15, 2020 4:23 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
>> Kulkarni, Vandita <vandita.kulkarni@intel.com>; ville.syrjala@linux.intel.com;
>> Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [RFC 10/13] drm/dp_helper: Add support for Configuring DSC for
>> HDMI2.1 Pcon
>>
>> This patch adds registers for getting DSC encoder capability for a HDMI2.1 PCon.
>> It also addes helper functions to configure DSC between the PCON and HDMI2.1
>> sink.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/drm_dp_helper.c |  93 +++++++++++++++++++++++++++
>>   include/drm/drm_dp_helper.h     | 109 ++++++++++++++++++++++++++++++++
>>   2 files changed, 202 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_dp_helper.c
>> b/drivers/gpu/drm/drm_dp_helper.c index 33a4ac2fb225..f10a9c2d6f04 100644
>> --- a/drivers/gpu/drm/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>> @@ -2929,3 +2929,96 @@ void drm_dp_pcon_hdmi_frl_link_error_count(struct
>> drm_dp_aux *aux,
>>   }
>>   }
>>   EXPORT_SYMBOL(drm_dp_pcon_hdmi_frl_link_error_count);
>> +
>> +static
>> +int drm_dp_pcon_configure_dsc_enc(struct drm_dp_aux *aux, u8
>> +pps_buf_config) {
>> +u8 buf = 0;
>> +int ret;
>> +
>> +buf |= DP_PCON_ENABLE_DSC_ENCODER;
> Directly assign it.


Alright, will change in next version.

>
>> +if (pps_buf_config <= DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER) {
>> +buf &= ~DP_PCON_ENCODER_PPS_OVERRIDE_MASK;
>> +buf |= pps_buf_config << 2;
>> +}
>> +
>> +ret = drm_dp_dpcd_writeb(aux,
>> DP_PROTOCOL_CONVERTER_CONTROL_2, buf);
>> +if (ret < 0)
>> +return ret;
>> +
>> +return 0;
>> +}
>> +
>> +/**
>> + * drm_dp_pcon_pps_default() - Let PCON fill the default pps parameters
>> + * for DSC1.2 between PCON & HDMI2.1 sink
>> + * @aux: DisplayPort AUX channel
>> + *
>> + * Returns 0 on success, else returns negative error code.
>> + * */
>> +int drm_dp_pcon_pps_default(struct drm_dp_aux *aux) {
>> +int ret;
>> +
>> +ret = drm_dp_pcon_configure_dsc_enc(aux,
>> DP_PCON_ENC_PPS_OVERRIDE_DISABLED);
>> +if (ret < 0)
>> +return ret;
>> +
>> +return 0;
>> +}
>> +EXPORT_SYMBOL(drm_dp_pcon_pps_default);
>> +
>> +/**
>> + * drm_dp_pcon_pps_override_buf() - Configure PPS encoder override
>> +buffer for
>> + * HDMI sink
>> + * @aux: DisplayPort AUX channel
>> + * @pps_buf: 128 bytes to be written into PPS buffer for HDMI sink by PCON.
>> + *
>> + * Returns 0 on success, else returns negative error code.
>> + * */
>> +int drm_dp_pcon_pps_override_buf(struct drm_dp_aux *aux, u8
>> +pps_buf[128]) {
>> +int ret;
>> +
>> +ret = drm_dp_dpcd_write(aux, DP_PCON_HDMI_PPS_OVERRIDE_BASE,
>> &pps_buf, 128);
>> +if (ret < 0)
>> +return ret;
>> +
>> +ret = drm_dp_pcon_configure_dsc_enc(aux,
>> DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER);
>> +if (ret < 0)
>> +return ret;
>> +
>> +return 0;
>> +}
>> +EXPORT_SYMBOL(drm_dp_pcon_pps_override_buf);
>> +
>> +/*
>> + * drm_dp_pcon_pps_override_param() - Write PPS parameters to DSC
>> +encoder
>> + * override registers
>> + * @aux: DisplayPort AUX channel
>> + * @pps_param: 3 Parameters (2 Bytes each) : Slice Width, Slice Height,
>> + * bits_per_pixel.
>> + *
>> + * Returns 0 on success, else returns negative error code.
>> + * */
>> +int drm_dp_pcon_pps_override_param(struct drm_dp_aux *aux, u8
>> +pps_param[6]) {
>> +int ret;
>> +
>> +ret = drm_dp_dpcd_write(aux,
>> DP_PCON_HDMI_PPS_OVRD_SLICE_HEIGHT, &pps_param[0], 2);
>> +if (ret < 0)
>> +return ret;
>> +ret = drm_dp_dpcd_write(aux,
>> DP_PCON_HDMI_PPS_OVRD_SLICE_WIDTH, &pps_param[1], 2);
>> +if (ret < 0)
>> +return ret;
>> +ret = drm_dp_dpcd_write(aux, DP_PCON_HDMI_PPS_OVRD_BPP,
>> &pps_param[2], 2);
>> +if (ret < 0)
>> +return ret;
>> +
>> +ret = drm_dp_pcon_configure_dsc_enc(aux,
>> DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER);
>> +if (ret < 0)
>> +return ret;
>> +
>> +return 0;
>> +}
>> +EXPORT_SYMBOL(drm_dp_pcon_pps_override_param);
>> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h index
>> eb26c86dc8ca..3de022d4a65e 100644
>> --- a/include/drm/drm_dp_helper.h
>> +++ b/include/drm/drm_dp_helper.h
>> @@ -441,6 +441,83 @@ struct drm_device;
>>   # define DP_FEC_CORR_BLK_ERROR_COUNT_CAP    (1 << 2)
>>   # define DP_FEC_BIT_ERROR_COUNT_CAP    (1 << 3)
>>
>> +/* DP-HDMI2.1 PCON DSC ENCODER SUPPORT */
>> +#define DP_PCON_DSC_ENCODER                 0x092
>> +# define DP_PCON_DSC_ENCODER_SUPPORTED      (1 << 0)
>> +# define DP_PCON_DSC_PPS_ENC_OVERRIDE       (1 << 1)
>> +
>> +/* DP-HDMI2.1 PCON DSC Version */
>> +#define DP_PCON_DSC_VERSION                 0x093
>> +# define DP_PCON_DSC_MAJOR_MASK    (0xF << 0)
>> +# define DP_PCON_DSC_MINOR_MASK    (0xF << 4)
>> +# define DP_PCON_DSC_MAJOR_SHIFT    0
>> +# define DP_PCON_DSC_MINOR_SHIFT    4
>> +
>> +/* DP-HDMI2.1 PCON DSC RC Buffer block size */
>> +#define DP_PCON_DSC_RC_BUF_BLK_INFO    0x094
>> +# define DP_PCON_DSC_RC_BUF_BLK_SIZE    (0x3 << 0)
>> +# define DP_PCON_DSC_RC_BUF_BLK_1KB    0
>> +# define DP_PCON_DSC_RC_BUF_BLK_4KB    1
>> +# define DP_PCON_DSC_RC_BUF_BLK_16KB    2
>> +# define DP_PCON_DSC_RC_BUF_BLK_64KB    3
>> +
>> +/* DP-HDMI2.1 PCON DSC RC Buffer size */
>> +#define DP_PCON_DSC_RC_BUF_SIZE    0x095
>> +
>> +/* DP-HDMI2.1 PCON DSC Slice capabilities-1 */
>> +#define DP_PCON_DSC_SLICE_CAP_1    0x096
>> +# define DP_PCON_DSC_1_PER_DSC_ENC     (0x1 << 0)
>> +# define DP_PCON_DSC_2_PER_DSC_ENC     (0x1 << 1)
>> +# define DP_PCON_DSC_4_PER_DSC_ENC     (0x1 << 3)
>> +# define DP_PCON_DSC_6_PER_DSC_ENC     (0x1 << 4)
>> +# define DP_PCON_DSC_8_PER_DSC_ENC     (0x1 << 5)
>> +# define DP_PCON_DSC_10_PER_DSC_ENC    (0x1 << 6)
>> +# define DP_PCON_DSC_12_PER_DSC_ENC    (0x1 << 7)
>> +
>> +#define DP_PCON_DSC_BUF_BIT_DEPTH    0x097
>> +# define DP_PCON_DSC_BIT_DEPTH_MASK    (0xF << 0)
>> +# define DP_PCON_DSC_DEPTH_9_BITS    0
>> +# define DP_PCON_DSC_DEPTH_10_BITS    1
>> +# define DP_PCON_DSC_DEPTH_11_BITS    2
>> +# define DP_PCON_DSC_DEPTH_12_BITS    3
>> +# define DP_PCON_DSC_DEPTH_13_BITS    4
>> +# define DP_PCON_DSC_DEPTH_14_BITS    5
>> +# define DP_PCON_DSC_DEPTH_15_BITS    6
>> +# define DP_PCON_DSC_DEPTH_16_BITS    7
>> +# define DP_PCON_DSC_DEPTH_8_BITS    8
>> +
>> +#define DP_PCON_DSC_BLOCK_PREDICTION    0x098
>> +# define DP_PCON_DSC_BLOCK_PRED_SUPPORT    (0x1 << 0)
>> +
>> +#define DP_PCON_DSC_ENC_COLOR_FMT_CAP    0x099
>> +# define DP_PCON_DSC_ENC_RGB    (0x1 << 0)
>> +# define DP_PCON_DSC_ENC_YUV444    (0x1 << 1)
>> +# define DP_PCON_DSC_ENC_YUV422_S    (0x1 << 2)
>> +# define DP_PCON_DSC_ENC_YUV422_N    (0x1 << 3)
>> +# define DP_PCON_DSC_ENC_YUV420_N    (0x1 << 4)
>> +
>> +#define DP_PCON_DSC_ENC_COLOR_DEPTH_CAP    0x09A
>> +# define DP_PCON_DSC_ENC_8BPC    (0x1 << 0)
>> +# define DP_PCON_DSC_ENC_10BPC    (0x1 << 0)
>> +# define DP_PCON_DSC_ENC_12BPC    (0x1 << 0)
> These offsets are wrong, should be 0x1 < (1, 2 and 3)


Thanks for catching this, will correct in next version.

Regards,

Ankit

>
>> +
>> +#define DP_PCON_DSC_MAX_SLICE_WIDTH    0x09B
>> +
>> +/* DP-HDMI2.1 PCON DSC Slice capabilities-2 */
>> +#define DP_PCON_DSC_SLICE_CAP_2             0x09C
>> +# define DP_PCON_DSC_16_PER_DSC_ENC    (0x1 << 0)
>> +# define DP_PCON_DSC_20_PER_DSC_ENC         (0x1 << 1)
>> +# define DP_PCON_DSC_24_PER_DSC_ENC         (0x1 << 2)
>> +
>> +/* DP-HDMI2.1 PCON HDMI TX Encoder Bits/pixel increment */
>> +#define DP_PCON_DSC_BPP_INCR    0x09E
>> +# define DP_PCON_DSC_BPP_INCR_MASK    (0x7 << 0)
>> +# define DP_PCON_DSC_ONE_16TH_BPP    0
>> +# define DP_PCON_DSC_ONE_8TH_BPP    1
>> +# define DP_PCON_DSC_ONE_4TH_BPP    2
>> +# define DP_PCON_DSC_ONE_HALF_BPP    3
>> +# define DP_PCON_DSC_ONE_BPP    4
>> +
>>   /* DP Extended DSC Capabilities */
>>   #define DP_DSC_BRANCH_OVERALL_THROUGHPUT_0  0x0a0   /* DP 1.4a SCR */
>>   #define DP_DSC_BRANCH_OVERALL_THROUGHPUT_1  0x0a1 @@ -1134,6
>> +1211,12 @@ struct drm_device;
>>   # define DP_HDMI_FORCE_SCRAMBLING(1 << 3) /* DP 1.4 */
>>   #define DP_PROTOCOL_CONVERTER_CONTROL_20x3052 /* DP 1.3
>> */
>>   # define DP_CONVERSION_TO_YCBCR422_ENABLE(1 << 0) /* DP 1.3 */
>> +# define DP_PCON_ENABLE_DSC_ENCODER        (1 << 1)
>> +# define DP_PCON_ENCODER_PPS_OVERRIDE_MASK(0x3 << 2)
>> +# define DP_PCON_ENC_PPS_OVERRIDE_DISABLED      0
>> +# define DP_PCON_ENC_PPS_OVERRIDE_EN_PARAMS     1
>> +# define DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER     2
>> +
>>
>>   /* PCON Downstream HDMI ERROR Status per Lane */
>>   #define DP_PCON_HDMI_ERROR_STATUS_LN0          0x3037
>> @@ -1145,6 +1228,29 @@ struct drm_device;
>>   # define DP_PCON_HDMI_ERROR_COUNT_TEN_PLUS     (1 << 1)
>>   # define DP_PCON_HDMI_ERROR_COUNT_HUNDRED_PLUS (1 << 2)
>>
>> +/* PCON HDMI CONFIG PPS Override Buffer
>> + * Valid Offsets to be added to Base : 0-127  */
>> +#define DP_PCON_HDMI_PPS_OVERRIDE_BASE        0x3100
>> +
>> +/* PCON HDMI CONFIG PPS Override Parameter: Slice height
>> + * Offset-0 8LSBs of the Slice height.
>> + * Offset-1 8MSBs of the Slice height.
>> + */
>> +#define DP_PCON_HDMI_PPS_OVRD_SLICE_HEIGHT    0x3180
>> +
>> +/* PCON HDMI CONFIG PPS Override Parameter: Slice width
>> + * Offset-0 8LSBs of the Slice width.
>> + * Offset-1 8MSBs of the Slice width.
>> + */
>> +#define DP_PCON_HDMI_PPS_OVRD_SLICE_WIDTH    0x3182
>> +
>> +/* PCON HDMI CONFIG PPS Override Parameter: bits_per_pixel
>> + * Offset-0 8LSBs of the bits_per_pixel.
>> + * Offset-1 2MSBs of the bits_per_pixel.
>> + */
>> +#define DP_PCON_HDMI_PPS_OVRD_BPP     0x3184
>> +
>>   /* HDCP 1.3 and HDCP 2.2 */
>>   #define DP_AUX_HDCP_BKSV0x68000
>>   #define DP_AUX_HDCP_RI_PRIME0x68005
>> @@ -2063,4 +2169,7 @@ int drm_dp_pcon_frl_enable(struct drm_dp_aux *aux);
>> bool drm_dp_pcon_hdmi_link_active(struct drm_dp_aux *aux);  int
>> drm_dp_pcon_hdmi_link_mode(struct drm_dp_aux *aux, u8 *frl_trained_mask);
>> void drm_dp_pcon_hdmi_frl_link_error_count(struct drm_dp_aux *aux, struct
>> drm_connector *connector);
>> +int drm_dp_pcon_pps_default(struct drm_dp_aux *aux); int
>> +drm_dp_pcon_pps_override_buf(struct drm_dp_aux *aux, u8 pps_buf[128]);
>> +int drm_dp_pcon_pps_override_param(struct drm_dp_aux *aux, u8
>> +pps_param[6]);
>>   #endif /* _DRM_DP_HELPER_H_ */
>> --
>> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
