Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00013994993
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 14:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7A610E4EA;
	Tue,  8 Oct 2024 12:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iV+4IeeZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224C910E4F0;
 Tue,  8 Oct 2024 12:25:24 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4988kPle005200;
 Tue, 8 Oct 2024 12:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d1qCkclHmiO8zSzLYRCvC9gCPXg9PoHqfj4FK/HhTuE=; b=iV+4IeeZbnkkIEvA
 pPEzRt3wjpiKVNh3YOyEfh9ZtMpu5cm4l1QtJrjex+NVuOMNURNkoozeqa7TkOXy
 eaz0kiIn3ldkYJRrUGpb57pfXzbr+kH4KjQRxR1/O22BYP55+FD7gJoiUn9fKIUn
 wQsPG/sDfH4QETNvocins/ntaEryWRqvnmA+BRLVOXSFcZbKbrdu637pHwZrb60o
 JGKLSNI6B10QOKspFwBz7AYLmWxd49HVEOU0B3iWr1JF7kmHFopg66lAJLQXResY
 Aqvwxlyyr6ptplItzzohDk8p+EsJC+RY5XVFdXq2XOi/hNcsQAqhiHGgZHgLO6vO
 s6qT7A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424ndya81t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2024 12:25:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498CPDZT011182
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 8 Oct 2024 12:25:13 GMT
Received: from [10.110.37.37] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 05:25:12 -0700
Message-ID: <d88264f3-29ed-449b-9971-501ce7e1da99@quicinc.com>
Date: Tue, 8 Oct 2024 05:25:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/22] drm/msm/dpu: Configure CWB in writeback encoder
To: <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
 <quic_abhinavk@quicinc.com>, "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-16-7849f900e863@quicinc.com>
 <b9e50652-4556-4eed-a013-8e417eccdb69@linaro.org>
 <866ef212-a00e-48c4-9cf1-d1d4ee78d0ae@quicinc.com>
 <a58abb00-f941-48e0-b2a0-3c401e5220a7@linaro.org>
 <4e0ccd07-fdd1-4e92-bda7-ea6ec9d54c80@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <4e0ccd07-fdd1-4e92-bda7-ea6ec9d54c80@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KKsa5J9UDyySCcvAqG6lVhN1SNL1Antr
X-Proofpoint-ORIG-GUID: KKsa5J9UDyySCcvAqG6lVhN1SNL1Antr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080078
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



On 10/8/2024 1:00 AM, Neil Armstrong wrote:
> Hi,
> 
> On 01/10/2024 09:37, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 30/09/2024 21:19, Jessica Zhang wrote:
>>>
>>>
>>> On 9/30/2024 7:17 AM, neil.armstrong@linaro.org wrote:
>>>> On 25/09/2024 00:59, Jessica Zhang wrote:
> 
> <snip>
> 
>>>>
>>>> When running igt-test on QRD8650, I get:
>>>> # IGT_FRAME_DUMP_PATH=$PWD FRAME_PNG_FILE_NAME=pwet /usr/libexec/ 
>>>> igt- gpu-tools/kms_writeback -d
>>>
>>> Hi Neil,
>>>
>>> Thanks for reporting this. Unfortunately, I'm not able to recreate 
>>> this on the MTP8650.
>>>
>>> How many/which non-WB outputs are you testing with?
>>
>> Here's the modetest output:
>> ==================><====================================================
>> Encoders:
>> id    crtc    type    possible crtcs    possible clones
>> 32    103    DSI    0x00000007    0x00000005
>> 34    0    TMDS    0x00000007    0x00000006
>> 37    0    Virtual    0x00000007    0x00000007
>>
>> Connectors:
>> id    encoder    status        name        size (mm)    modes    encoders
>> 33    32    connected    DSI-1              71x157        1    32
>>    modes:
>>      index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot
>>    #0 1080x2400 144.00 1080 1100 1102 1122 2400 2420 2422 2440 394225 
>> flags: ; type: preferred, driver
>>    props:
>>      1 EDID:
>>          flags: immutable blob
>>          blobs:
>>
>>          value:
>>      2 DPMS:
>>          flags: enum
>>          enums: On=0 Standby=1 Suspend=2 Off=3
>>          value: 0
>>      5 link-status:
>>          flags: enum
>>          enums: Good=0 Bad=1
>>          value: 0
>>      6 non-desktop:
>>          flags: immutable range
>>          values: 0 1
>>          value: 0
>>      4 TILE:
>>          flags: immutable blob
>>          blobs:
>>
>>          value:
>> 35    0    disconnected    DP-1               0x0        0    34
>>    props:
>>      1 EDID:
>>          flags: immutable blob
>>          blobs:
>>
>>          value:
>>      2 DPMS:
>>          flags: enum
>>          enums: On=0 Standby=1 Suspend=2 Off=3
>>          value: 0
>>      5 link-status:
>>          flags: enum
>>          enums: Good=0 Bad=1
>>          value: 0
>>      6 non-desktop:
>>          flags: immutable range
>>          values: 0 1
>>          value: 0
>>      4 TILE:
>>          flags: immutable blob
>>          blobs:
>>
>>          value:
>>      36 subconnector:
>>          flags: immutable enum
>>          enums: Unknown=0 VGA=1 DVI-D=3 HDMI=11 DP=10 Wireless=18 
>> Native=15
>>          value: 0
>> ==================><====================================================
>>
>> and dri state:
>> ==================><====================================================
>> # cat /sys/kernel/debug/dri/0/state
>> plane[43]: plane-0
>>      crtc=crtc-0
>>      fb=106
>>          allocated by = [fbcon]
>>          refcount=2
>>          format=XR24 little-endian (0x34325258)
>>          modifier=0x0
>>          size=1080x2400
>>          layers:
>>              size[0]=1080x2400
>>              pitch[0]=4352
>>              offset[0]=0
>>              obj[0]:
>>                  name=0
>>                  refcount=1
>>                  start=0010102d
>>                  size=10444800
>>                  imported=no
>>      crtc-pos=1080x2400+0+0
>>      src-pos=1080.000000x2400.000000+0.000000+0.000000
>>      rotation=1
>>      normalized-zpos=0
>>      color-encoding=ITU-R BT.601 YCbCr
>>      color-range=YCbCr limited range
>>      color_mgmt_changed=0
>>      stage=1
>>      sspp[0]=sspp_0
>>      multirect_mode[0]=none
>>      multirect_index[0]=solo
>>      src[0]=1080x2400+0+0
>>      dst[0]=1080x2400+0+0
>> plane[49]: plane-1
>>      crtc=(null)
>>      fb=0
>>      crtc-pos=0x0+0+0
>>      src-pos=0.000000x0.000000+0.000000+0.000000
>>      rotation=1
>>      normalized-zpos=0
>>      color-encoding=ITU-R BT.601 YCbCr
>>      color-range=YCbCr limited range
>>      color_mgmt_changed=0
>>      stage=0
>>      sspp[0]=sspp_1
>>      multirect_mode[0]=none
>>      multirect_index[0]=solo
>>      src[0]=0x0+0+0
>>      dst[0]=0x0+0+0
>> plane[55]: plane-2
>>      crtc=(null)
>>      fb=0
>>      crtc-pos=0x0+0+0
>>      src-pos=0.000000x0.000000+0.000000+0.000000
>>      rotation=1
>>      normalized-zpos=0
>>      color-encoding=ITU-R BT.601 YCbCr
>>      color-range=YCbCr limited range
>>      color_mgmt_changed=0
>>      stage=0
>>      sspp[0]=sspp_2
>>      multirect_mode[0]=none
>>      multirect_index[0]=solo
>>      src[0]=0x0+0+0
>>      dst[0]=0x0+0+0
>> plane[61]: plane-3
>>      crtc=(null)
>>      fb=0
>>      crtc-pos=0x0+0+0
>>      src-pos=0.000000x0.000000+0.000000+0.000000
>>      rotation=1
>>      normalized-zpos=0
>>      color-encoding=ITU-R BT.601 YCbCr
>>      color-range=YCbCr limited range
>>      color_mgmt_changed=0
>>      stage=0
>>      sspp[0]=sspp_3
>>      multirect_mode[0]=none
>>      multirect_index[0]=solo
>>      src[0]=0x0+0+0
>>      dst[0]=0x0+0+0
>> plane[67]: plane-4
>>      crtc=(null)
>>      fb=0
>>      crtc-pos=0x0+0+0
>>      src-pos=0.000000x0.000000+0.000000+0.000000
>>      rotation=1
>>      normalized-zpos=0
>>      color-encoding=ITU-R BT.601 YCbCr
>>      color-range=YCbCr limited range
>>      color_mgmt_changed=0
>>      stage=0
>>      sspp[0]=sspp_8
>>      multirect_mode[0]=none
>>      multirect_index[0]=solo
>>      src[0]=0x0+0+0
>>      dst[0]=0x0+0+0
>> plane[73]: plane-5
>>      crtc=(null)
>>      fb=0
>>      crtc-pos=0x0+0+0
>>      src-pos=0.000000x0.000000+0.000000+0.000000
>>      rotation=1
>>      normalized-zpos=0
>>      color-encoding=ITU-R BT.601 YCbCr
>>      color-range=YCbCr limited range
>>      color_mgmt_changed=0
>>      stage=0
>>      sspp[0]=sspp_9
>>      multirect_mode[0]=none
>>      multirect_index[0]=solo
>>      src[0]=0x0+0+0
>>      dst[0]=0x0+0+0
>> plane[79]: plane-6
>>      crtc=(null)
>>      fb=0
>>      crtc-pos=0x0+0+0
>>      src-pos=0.000000x0.000000+0.000000+0.000000
>>      rotation=1
>>      normalized-zpos=0
>>      color-encoding=ITU-R BT.601 YCbCr
>>      color-range=YCbCr limited range
>>      color_mgmt_changed=0
>>      stage=0
>>      sspp[0]=sspp_10
>>      multirect_mode[0]=none
>>      multirect_index[0]=solo
>>      src[0]=0x0+0+0
>>      dst[0]=0x0+0+0
>> plane[85]: plane-7
>>      crtc=(null)
>>      fb=0
>>      crtc-pos=0x0+0+0
>>      src-pos=0.000000x0.000000+0.000000+0.000000
>>      rotation=1
>>      normalized-zpos=0
>>      color-encoding=ITU-R BT.601 YCbCr
>>      color-range=YCbCr limited range
>>      color_mgmt_changed=0
>>      stage=0
>>      sspp[0]=sspp_11
>>      multirect_mode[0]=none
>>      multirect_index[0]=solo
>>      src[0]=0x0+0+0
>>      dst[0]=0x0+0+0
>> plane[91]: plane-8
>>      crtc=(null)
>>      fb=0
>>      crtc-pos=0x0+0+0
>>      src-pos=0.000000x0.000000+0.000000+0.000000
>>      rotation=1
>>      normalized-zpos=0
>>      color-encoding=ITU-R BT.601 YCbCr
>>      color-range=YCbCr limited range
>>      color_mgmt_changed=0
>>      stage=0
>>      sspp[0]=sspp_12
>>      multirect_mode[0]=none
>>      multirect_index[0]=solo
>>      src[0]=0x0+0+0
>>      dst[0]=0x0+0+0
>> plane[97]: plane-9
>>      crtc=(null)
>>      fb=0
>>      crtc-pos=0x0+0+0
>>      src-pos=0.000000x0.000000+0.000000+0.000000
>>      rotation=1
>>      normalized-zpos=0
>>      color-encoding=ITU-R BT.601 YCbCr
>>      color-range=YCbCr limited range
>>      color_mgmt_changed=0
>>      stage=0
>>      sspp[0]=sspp_13
>>      multirect_mode[0]=none
>>      multirect_index[0]=solo
>>      src[0]=0x0+0+0
>>      dst[0]=0x0+0+0
>> crtc[103]: crtc-0
>>      enable=1
>>      active=1
>>      self_refresh_active=0
>>      planes_changed=1
>>      mode_changed=0
>>      active_changed=0
>>      connectors_changed=0
>>      color_mgmt_changed=0
>>      plane_mask=1
>>      connector_mask=1
>>      encoder_mask=1
>>      mode: "1080x2400": 144 394225 1080 1100 1102 1122 2400 2420 2422 
>> 2440 0x48 0x0
>>      lm[0]=0
>>      ctl[0]=2
>> crtc[104]: crtc-1
>>      enable=0
>>      active=0
>>      self_refresh_active=0
>>      planes_changed=0
>>      mode_changed=0
>>      active_changed=0
>>      connectors_changed=0
>>      color_mgmt_changed=0
>>      plane_mask=0
>>      connector_mask=0
>>      encoder_mask=0
>>      mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
>> crtc[105]: crtc-2
>>      enable=0
>>      active=0
>>      self_refresh_active=0
>>      planes_changed=0
>>      mode_changed=0
>>      active_changed=0
>>      connectors_changed=0
>>      color_mgmt_changed=0
>>      plane_mask=0
>>      connector_mask=0
>>      encoder_mask=0
>>      mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
>> connector[33]: DSI-1
>>      crtc=crtc-0
>>      self_refresh_aware=0
>>      max_requested_bpc=0
>>      colorspace=Default
>> connector[35]: DP-1
>>      crtc=(null)
>>      self_refresh_aware=0
>>      max_requested_bpc=0
>>      colorspace=Default
>> connector[42]: Writeback-1
>>      crtc=(null)
>>      self_refresh_aware=0
>>      max_requested_bpc=0
>>      colorspace=Default
>> resource mapping:
>>      pingpong=103 # # # # # # # # # -
>>      mixer=103 # # # # # -
>>      ctl=# # 103 # # #
>>      dspp=# # # #
>>      dsc=# # # # # #
>>      cdm=-
>>      cwb=# # # #
>> ==================><====================================================
>>
>> I pasted all the kms_writeback log, I have nothing more.
>>
>> If I specify `--run-subtest dump-valid-clones` I get:
>> ==================><====================================================
>> IGT_FRAME_DUMP_PATH=$PWD FRAME_PNG_FILE_NAME=out.png /usr/libexec/igt- 
>> gpu-tools/kms_writeback -d --run-subtest dump-valid-clones
>> [   33.250236] Console: switching to colour dummy device 80x25
>> IGT-Version: 1.29-1.28 (aarch64) (Linux: 6.12.0-rc1-00022- 
>> ge581f752bf79 aarch64)
>> Using IGT_SRANDOM=1709054789 for randomisation[   33.256171] [IGT] 
>> kms_writeback: executing
>>
>> Opened device: /dev/dri/card0
>> [   33.360023] [IGT] kms_writeback: starting subtest dump-valid-clones
>> Starting subtest: dump-valid-clones
>> [   34.063316] [drm:dpu_encoder_virt_atomic_disable:1314] [dpu 
>> error]enc32 timeout pending
>> [   34.244272] Unable to handle kernel NULL pointer dereference at 
>> virtual address 0000000000000010
>> [   34.253385] Mem abort info:
>> [   34.256328]   ESR = 0x0000000096000006
>> [   34.260272]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [   34.265816]   SET = 0, FnV = 0
>> [   34.269043]   EA = 0, S1PTW = 0
>> [   34.272332]   FSC = 0x06: level 2 translation fault
>> [   34.277430] Data abort info:
>> [   34.280460]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
>> [   34.286170]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>> [   34.291438]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> [   34.296975] user pgtable: 4k pages, 48-bit VAs, pgdp=00000008824fc000
>> [   34.303673] [0000000000000010] pgd=08000008dc4e0003, 
>> p4d=08000008dc4e0003, pud=08000008dd4af003, pmd=0000000000000000
>> [   34.314647] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
>> [   34.321144] Modules linked in: snd_soc_wsa884x q6prm_clocks 
>> q6apm_dai q6apm_lpass_dais snd_q6dsp_common q6prm 8021q garp mrp stp 
>> llc usb_f_fs libcomposite qrtr_mhi snd_q6apm rpmsg_ctrl fastrpc apr 
>> qrtr_smd rpmsg_char snd_soc_hdmi_codec ath12k mac80211 libarc4 mhi 
>> panel_visionox_vtdr6130 qcom_pd_mapper goodix_berlin_spi ucsi_glink 
>> pmic_glink_altmode pci_pwrctl_pwrseq pci_pwrctl_core typec_ucsi 
>> aux_hpd_bridge qcom_battmgr nb7vpq904m wcd939x_usbss 
>> goodix_berlin_core crct10dif_ce phy_qcom_eusb2_repeater msm sm3_ce sm3 
>> qcom_q6v5_pas sha3_ce hci_uart sha512_ce sha512_arm64 leds_qcom_lpg 
>> ocmem qcom_pil_info qcom_q6v5 qcom_pbs btqca ipa btbcm drm_exec 
>> qcom_sysmon pwrseq_qcom_wcn snd_soc_sc8280xp led_class_multicolor 
>> snd_soc_qcom_sdw qrtr qcom_common gpu_sched snd_soc_wcd939x 
>> drm_dp_aux_bus qcom_spmi_temp_alarm snd_soc_qcom_common 
>> qcom_glink_smem snd_soc_wcd939x_sdw rtc_pm8xxx drm_display_helper 
>> pinctrl_sm8650_lpass_lpi regmap_sdw cfg80211 bluetooth qcom_pon 
>> pmic_glink ecdh_generic pdr_interface phy_qcom_qmp_combo ecc rfkill
>> [   34.321268]  nvmem_qcom_spmi_sdam qcom_stats spi_geni_qcom 
>> pwrseq_core i2c_qcom_geni aux_bridge phy_qcom_snps_eusb2 dispcc_sm8550 
>> drm_kms_helper gpi soundwire_qcom snd_soc_lpass_va_macro 
>> pinctrl_lpass_lpi snd_soc_wcd_mbhc snd_soc_lpass_tx_macro 
>> snd_soc_lpass_rx_macro snd_soc_lpass_wsa_macro llcc_qcom 
>> snd_soc_lpass_macro_common slimbus snd_soc_wcd_classh mdt_loader 
>> qcom_pdr_msg qcrypto gpucc_sm8650 icc_bwmon qmi_helpers authenc 
>> phy_qcom_qmp_ufs libdes soundwire_bus ufs_qcom nvmem_reboot_mode 
>> phy_qcom_qmp_pcie typec qcom_rng rmtfs_mem socinfo fuse drm backlight 
>> ipv6
>> [   34.464862] CPU: 5 UID: 0 PID: 513 Comm: kms_writeback Tainted: G 
>> S                 6.12.0-rc1-00022-ge581f752bf79 #2
>> [   34.475812] Tainted: [S]=CPU_OUT_OF_SPEC
>> [   34.479905] Hardware name: Qualcomm Technologies, Inc. SM8650 QRD (DT)
>> [   34.486667] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS 
>> BTYPE=--)
>> [   34.493880] pc : dpu_encoder_helper_phys_setup_cwb+0xb8/0x1ec [msm]
>> [   34.500441] lr : dpu_encoder_helper_phys_setup_cwb+0x88/0x1ec [msm]
>> [   34.506969] sp : ffff800085fc37e0
>> [   34.510437] x29: ffff800085fc3810 x28: ffffb8c93c953068 x27: 
>> ffff5af315c90880
>> [   34.517826] x26: ffff5af359c55780 x25: ffff800085fc3878 x24: 
>> ffff5af35a956e80
>> [   34.525217] x23: 0000000000000000 x22: ffff5af355dc2080 x21: 
>> ffff5af35a956e80
>> [   34.532607] x20: ffff5af315c90880 x19: ffff5af315c90c80 x18: 
>> 0000000000000001
>> [   34.539997] x17: 0000000000000018 x16: ffffb8c95c9c8c64 x15: 
>> 0000000000000038
>> [   34.547385] x14: 0000001971602a24 x13: 00000000000000e1 x12: 
>> 000000000000000b
>> [   34.554774] x11: 0000000000000000 x10: e7125de8a27ae014 x9 : 
>> 5aef79bd13b1e2a7
>> [   34.562162] x8 : ffff5af355dc2718 x7 : 0000000000000004 x6 : 
>> ffff5af356374d98
>> [   34.569550] x5 : 0000000000000002 x4 : ffff800085fc37f8 x3 : 
>> ffff5af315c90950
>> [   34.576938] x2 : 0000000000000002 x1 : 0000000000000000 x0 : 
>> 0000000000000001
>> [   34.584328] Call trace:
>> [   34.586905]  dpu_encoder_helper_phys_setup_cwb+0xb8/0x1ec [msm]
>> [   34.593075]  dpu_encoder_helper_phys_cleanup+0x328/0x3c4 [msm]
>> [   34.599165]  dpu_encoder_phys_wb_disable+0x80/0xac [msm]
>> [   34.604713]  dpu_encoder_virt_atomic_disable+0xb4/0x160 [msm]
>> [   34.610711]  disable_outputs+0x108/0x32c [drm_kms_helper]
>> [   34.616351]  drm_atomic_helper_commit_modeset_disables+0x1c/0x4c 
>> [drm_kms_helper]
>> [   34.624110]  msm_atomic_commit_tail+0x188/0x514 [msm]
>> [   34.629396]  commit_tail+0xa4/0x18c [drm_kms_helper]
>> [   34.634570]  drm_atomic_helper_commit+0x17c/0x194 [drm_kms_helper]
>> [   34.640990]  drm_atomic_commit+0xb8/0xf4 [drm]
>> [   34.645690]  drm_mode_atomic_ioctl+0xad4/0xd88 [drm]
>> [   34.650889]  drm_ioctl_kernel+0xc0/0x128 [drm]
>> [   34.655564]  drm_ioctl+0x218/0x49c [drm]
>> [   34.659697]  __arm64_sys_ioctl+0xac/0xf0
>> [   34.663804]  invoke_syscall+0x48/0x10c
>> [   34.667755]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   34.672648]  do_el0_svc+0x1c/0x28
>> [   34.676117]  el0_svc+0x34/0xd8
>> [   34.679330]  el0t_64_sync_handler+0x120/0x12c
>> [   34.683864]  el0t_64_sync+0x190/0x194
>> [   34.687699] Code: 910063e1 f8607822 f8607861 b9401042 (b9401021)
>> [   34.694014] ---[ end trace 0000000000000000 ]---
>> ==================><====================================================
> 
> Anything I can try to get past the crash ?

Hey Neil,

Sorry for the late reply -- I was able to recreate this error using a 
clean IGT build. Looks like the NULL dereference is coming from looping 
through rt_pp_list.

I'm already planning to drop this in the v3, but for now can you try 
applying this change and seeing if it fixes the NULL dereference for you:

@@ -2166,7 +2172,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct 
dpu_encoder_phys *phys_enc,
         struct dpu_kms *dpu_kms;
         struct dpu_global_state *global_state;
         struct dpu_hw_blk *rt_pp_list[MAX_CHANNELS_PER_ENC];
-       int num_pp, rt_pp_idx[MAX_CHANNELS_PER_ENC];
+       int num_pp;

         if (!phys_enc || !phys_enc->hw_wb || !dpu_enc->cwb_mask)
                 return;
@@ -2191,24 +2197,6 @@ void dpu_encoder_helper_phys_setup_cwb(struct 
dpu_encoder_phys *phys_enc,
                 return;
         }

-       for (int i = 0; i < num_pp; i++) {
-               struct dpu_hw_pingpong *hw_pp = 
to_dpu_hw_pingpong(rt_pp_list[i]);
-
-               for (int j = 0; j < ARRAY_SIZE(dpu_enc->hw_cwb); j++) {
-                       hw_cwb = dpu_enc->hw_cwb[i];
-
-                       /*
-                        * Even CWB muxes must take input from even 
real-time
-                        * pingpongs and odd CWB muxes must take input 
from odd
-                        * pingpongs
-                        */
-                       if (hw_pp->idx % 2 == hw_cwb->idx % 2) {
-                               rt_pp_idx[i] = enable ? hw_pp->idx : 
PINGPONG_NONE;
-                               break;
-                       }
-               }
-       }
-
         /*
          * The CWB mux supports using LM or DSPP as tap points. For now,
          * always use LM tap point
@@ -2220,7 +2208,13 @@ void dpu_encoder_helper_phys_setup_cwb(struct 
dpu_encoder_phys *phys_enc,
                 if (!hw_cwb)
                         continue;

-               cwb_cfg.pp_idx = rt_pp_idx[i];
+               if (enable) {
+                       struct dpu_hw_pingpong *hw_pp =
+                                       to_dpu_hw_pingpong(rt_pp_list[i]);
+                       cwb_cfg.pp_idx = hw_pp->idx;
+               } else {
+                       cwb_cfg.pp_idx = PINGPONG_NONE;
+               }


Thanks,

Jessica Zhang

> 
> Thanks,
> Neil
> 
>>
>> Neil
>>
>>>
>>> Also, can you share the IGT debug logs?
>>>
>>> FWIW, I haven't had the chance to test with DP yet so that might be 
>>> why you're hitting this issue and I'm not.
>>>
>>> Thanks,
>>>
>>> Jessica Zhang
>>>
>>>> [ 2566.668998] Console: switching to colour dummy device 80x25
>>>> IGT-Version: 1.29-1.28 (aarch64) (Linux: 6.12.0-rc1-00022- 
>>>> ge581f752bf79 aarch64)
>>>> [ 2566.674859] [IGT] kms_writeback: executing
>>>> Using IGT_SRANDOM=1709057323 for randomisation
>>>> Opened device: /dev/dri/card0
>>>> [ 2566.741375] [IGT] kms_writeback: starting subtest dump-writeback
>>>> Starting subtest: dump-writeback
>>>> Subtest dump-writeback: SUCCESS (0.305s)[ 2567.053189] [IGT] 
>>>> kms_writeback: finished subtest dump-writeback, SUCCESS
>>>>
>>>> [ 2567.064505] [IGT] kms_writeback: starting subtest dump-valid-clones
>>>> Starting subtest: dump-valid-clones
>>>> [ 2567.762793] Unable to handle kernel NULL pointer dereference at 
>>>> virtual address 0000000000000010
>>>> [ 2567.771919] Mem abort info:
>>>> [ 2567.774888]   ESR = 0x0000000096000006
>>>> [ 2567.778831]   EC = 0x25: DABT (current EL), IL = 32 bits
>>>> [ 2567.784371]   SET = 0, FnV = 0
>>>> [ 2567.787601]   EA = 0, S1PTW = 0
>>>> [ 2567.790942]   FSC = 0x06: level 2 translation fault
>>>> [ 2567.796044] Data abort info:
>>>> [ 2567.799083]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
>>>> [ 2567.804793]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>>>> [ 2567.810057]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>>>> [ 2567.815600] user pgtable: 4k pages, 48-bit VAs, 
>>>> pgdp=00000008d60cf000
>>>> [ 2567.822290] [0000000000000010] pgd=08000008d6049003, 
>>>> p4d=08000008d6049003, pud=080000089397e003, pmd=0000000000000000
>>>> [ 2567.833254] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
>>>> [ 2567.839747] Modules linked in: snd_soc_wsa884x q6prm_clocks 
>>>> q6apm_lpass_dais snd_q6dsp_common q6apm_dai q6prm 8021q garp mrp stp 
>>>> llc usb_f_fs libcomposite qrtr_mhi snd_soc_hdmi_codec ath12k 
>>>> mac80211 libarc4 mhi panel_visionox_vtdr6130 snd_q6apm 
>>>> pci_pwrctl_pwrseq pci_pwrctl_core rpmsg_ctrl apr fastrpc qrtr_smd 
>>>> rpmsg_char wcd939x_usbss nb7vpq904m qcom_pd_mapper goodix_berlin_spi 
>>>> goodix_berlin_core ucsi_glink typec_ucsi pmic_glink_altmode 
>>>> aux_hpd_bridge qcom_battmgr leds_qcom_lpg msm ocmem drm_exec 
>>>> hci_uart qcom_pbs gpu_sched led_class_multicolor btqca 
>>>> phy_qcom_eusb2_repeater btbcm qcom_spmi_temp_alarm drm_dp_aux_bus 
>>>> phy_qcom_qmp_combo crct10dif_ce bluetooth drm_display_helper sm3_ce 
>>>> ecdh_generic aux_bridge sm3 snd_soc_sc8280xp pwrseq_qcom_wcn sha3_ce 
>>>> snd_soc_qcom_sdw rtc_pm8xxx qcom_pon ecc nvmem_qcom_spmi_sdam 
>>>> sha512_ce qcom_stats spi_geni_qcom snd_soc_qcom_common sha512_arm64 
>>>> pwrseq_core i2c_qcom_geni cfg80211 drm_kms_helper dispcc_sm8550 gpi 
>>>> ipa snd_soc_lpass_va_macro snd_soc_lpass_tx_macro soundwire_qcom
>>>> [ 2567.839860]  pinctrl_sm8650_lpass_lpi snd_soc_lpass_wsa_macro 
>>>> snd_soc_lpass_rx_macro rfkill slimbus phy_qcom_snps_eusb2 
>>>> pinctrl_lpass_lpi gpucc_sm8650 snd_soc_lpass_macro_common 
>>>> qcom_q6v5_pas qcom_pil_info qcom_q6v5 qcrypto authenc icc_bwmon 
>>>> qcom_sysmon qcom_common qrtr qcom_glink_smem phy_qcom_qmp_pcie 
>>>> mdt_loader libdes llcc_qcom ufs_qcom phy_qcom_qmp_ufs pmic_glink 
>>>> snd_soc_wcd939x rmtfs_mem pdr_interface snd_soc_wcd939x_sdw 
>>>> regmap_sdw qcom_pdr_msg snd_soc_wcd_mbhc qmi_helpers 
>>>> snd_soc_wcd_classh soundwire_bus typec nvmem_reboot_mode qcom_rng 
>>>> socinfo fuse drm backlight ipv6
>>>> [ 2567.983445] CPU: 5 UID: 0 PID: 554 Comm: kms_writeback Tainted: G 
>>>> S                 6.12.0-rc1-00022-ge581f752bf79 #2
>>>> [ 2567.994390] Tainted: [S]=CPU_OUT_OF_SPEC
>>>> [ 2567.998483] Hardware name: Qualcomm Technologies, Inc. SM8650 QRD 
>>>> (DT)
>>>> [ 2568.005244] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS 
>>>> BTYPE=--)
>>>> [ 2568.012455] pc : dpu_encoder_helper_phys_setup_cwb+0xb8/0x1ec [msm]
>>>> [ 2568.019009] lr : dpu_encoder_helper_phys_setup_cwb+0x88/0x1ec [msm]
>>>> [ 2568.025532] sp : ffff80008939b7e0
>>>> [ 2568.028999] x29: ffff80008939b810 x28: ffffcbcb66f26068 x27: 
>>>> ffff37ad962cb080
>>>> [ 2568.036388] x26: ffff37ad9887ed80 x25: ffff80008939b878 x24: 
>>>> ffff37ad43642a80
>>>> [ 2568.043775] x23: 0000000000000000 x22: ffff37ad42812080 x21: 
>>>> ffff37ad43642a80
>>>> [ 2568.051163] x20: ffff37ad962cb080 x19: ffff37ad962c8080 x18: 
>>>> 0000000000000001
>>>> [ 2568.058552] x17: 000000040044ffff x16: ffffcbcbb0fc8c64 x15: 
>>>> 00003d08ffff9c00
>>>> [ 2568.065939] x14: 00000013519b2832 x13: ffff37ad9d392200 x12: 
>>>> 000000000000000b
>>>> [ 2568.073325] x11: ffff37ad40dc56c0 x10: ffff37ad9d392200 x9 : 
>>>> ffff37afbe7bba80
>>>> [ 2568.080712] x8 : ffff37ad42812718 x7 : 0000000000000004 x6 : 
>>>> ffff37ad989ac798
>>>> [ 2568.088098] x5 : 0000000000000002 x4 : ffff80008939b7f8 x3 : 
>>>> ffff37ad962cb150
>>>> [ 2568.095480] x2 : 0000000000000002 x1 : 0000000000000000 x0 : 
>>>> 0000000000000001
>>>> [ 2568.102868] Call trace:
>>>> [ 2568.105446]  dpu_encoder_helper_phys_setup_cwb+0xb8/0x1ec [msm]
>>>> [ 2568.111608]  dpu_encoder_helper_phys_cleanup+0x328/0x3c4 [msm]
>>>> [ 2568.117692]  dpu_encoder_phys_wb_disable+0x80/0xac [msm]
>>>> [ 2568.123233]  dpu_encoder_virt_atomic_disable+0xb4/0x160 [msm]
>>>> [ 2568.129224]  disable_outputs+0x108/0x32c [drm_kms_helper]
>>>> [ 2568.134858]  drm_atomic_helper_commit_modeset_disables+0x1c/0x4c 
>>>> [drm_kms_helper]
>>>> [ 2568.142614]  msm_atomic_commit_tail+0x188/0x514 [msm]
>>>> [ 2568.147894]  commit_tail+0xa4/0x18c [drm_kms_helper]
>>>> [ 2568.153065]  drm_atomic_helper_commit+0x17c/0x194 [drm_kms_helper]
>>>> [ 2568.159482]  drm_atomic_commit+0xb8/0xf4 [drm]
>>>> [ 2568.164176]  drm_mode_atomic_ioctl+0xad4/0xd88 [drm]
>>>> [ 2568.169369]  drm_ioctl_kernel+0xc0/0x128 [drm]
>>>> [ 2568.174039]  drm_ioctl+0x218/0x49c [drm]
>>>> [ 2568.178165]  __arm64_sys_ioctl+0xac/0xf0
>>>> [ 2568.182271]  invoke_syscall+0x48/0x10c
>>>> [ 2568.186217]  el0_svc_common.constprop.0+0xc0/0xe0
>>>> [ 2568.191109]  do_el0_svc+0x1c/0x28
>>>> [ 2568.194576]  el0_svc+0x34/0xd8
>>>> [ 2568.197788]  el0t_64_sync_handler+0x120/0x12c
>>>> [ 2568.202321]  el0t_64_sync+0x190/0x194
>>>> [ 2568.206157] Code: 910063e1 f8607822 f8607861 b9401042 (b9401021)
>>>> [ 2568.212484] ---[ end trace 0000000000000000 ]---
>>>>
>>>> Neil
>>>>
>>>>> +                rt_pp_idx[i] = enable ? hw_pp->idx : PINGPONG_NONE;
>>>>> +                break;
>>>>> +            }
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    /*
>>>>> +     * The CWB mux supports using LM or DSPP as tap points. For now,
>>>>> +     * always use LM tap point
>>>>> +     */
>>>>> +    cwb_cfg.input = INPUT_MODE_LM_OUT;
>>>>> +
>>>>> +    for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>>>>> +        hw_cwb = dpu_enc->hw_cwb[i];
>>>>> +        if (!hw_cwb)
>>>>> +            continue;
>>>>> +
>>>>> +        cwb_cfg.pp_idx = rt_pp_idx[i];
>>>>> +
>>>>> +        hw_cwb->ops.config_cwb(hw_cwb, &cwb_cfg);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>>   void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys 
>>>>> *phys_enc,
>>>>>                          const struct msm_format *dpu_fmt,
>>>>>                          u32 output_type)
>>>>> @@ -2557,6 +2630,14 @@ enum dpu_intf_mode 
>>>>> dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
>>>>>       return INTF_MODE_NONE;
>>>>>   }
>>>>> +unsigned int dpu_encoder_helper_get_cwb(struct dpu_encoder_phys 
>>>>> *phys_enc)
>>>>> +{
>>>>> +    struct drm_encoder *encoder = phys_enc->parent;
>>>>> +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
>>>>> +
>>>>> +    return dpu_enc->cwb_mask;
>>>>> +}
>>>>> +
>>>>>   unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys 
>>>>> *phys_enc)
>>>>>   {
>>>>>       struct drm_encoder *encoder = phys_enc->parent;
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/ 
>>>>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>> index e77ebe3a68da..d7a02d1f8053 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>> @@ -1,6 +1,6 @@
>>>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>>>>   /*
>>>>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>>>> reserved.
>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All 
>>>>> rights reserved.
>>>>>    * Copyright (c) 2015-2018 The Linux Foundation. All rights 
>>>>> reserved.
>>>>>    */
>>>>> @@ -331,6 +331,12 @@ static inline enum dpu_3d_blend_mode 
>>>>> dpu_encoder_helper_get_3d_blend_mode(
>>>>>       return BLEND_3D_NONE;
>>>>>   }
>>>>> +/**
>>>>> + * dpu_encoder_helper_get_cwb - get CWB blocks mask for the DPU 
>>>>> encoder
>>>>> + * @phys_enc: Pointer to physical encoder structure
>>>>> + */
>>>>> +unsigned int dpu_encoder_helper_get_cwb(struct dpu_encoder_phys 
>>>>> *phys_enc);
>>>>> +
>>>>>   /**
>>>>>    * dpu_encoder_helper_get_dsc - get DSC blocks mask for the DPU 
>>>>> encoder
>>>>>    *   This helper function is used by physical encoder to get DSC 
>>>>> blocks mask
>>>>> @@ -400,6 +406,14 @@ int dpu_encoder_helper_wait_for_irq(struct 
>>>>> dpu_encoder_phys *phys_enc,
>>>>>    */
>>>>>   void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys 
>>>>> *phys_enc);
>>>>> +/**
>>>>> + * dpu_encoder_helper_phys_setup_cwb - helper to configure CWB muxes
>>>>> + * @phys_enc: Pointer to physical encoder structure
>>>>> + * @enable: Enable CWB mux
>>>>> + */
>>>>> +void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys 
>>>>> *phys_enc,
>>>>> +                       bool enable);
>>>>> +
>>>>>   /**
>>>>>    * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling 
>>>>> block
>>>>>    * @phys_enc: Pointer to physical encoder
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/ 
>>>>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>> index 882c717859ce..e88c4d91041f 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>> @@ -1,6 +1,6 @@
>>>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>>>   /*
>>>>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>>>> reserved.
>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All 
>>>>> rights reserved.
>>>>>    */
>>>>>   #define pr_fmt(fmt)    "[drm:%s:%d] " fmt, __func__, __LINE__
>>>>> @@ -342,6 +342,8 @@ static void dpu_encoder_phys_wb_setup(
>>>>>       dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, 
>>>>> CDM_CDWN_OUTPUT_WB);
>>>>> +    dpu_encoder_helper_phys_setup_cwb(phys_enc, true);
>>>>> +
>>>>>       dpu_encoder_phys_wb_setup_ctl(phys_enc);
>>>>>   }
>>>>>
>>>>
>>>
>>
> 

