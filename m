Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99483892CD1
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 20:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D7110E445;
	Sat, 30 Mar 2024 19:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CFOUq/PA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97E910E0E7;
 Sat, 30 Mar 2024 19:39:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42UJdp9Z015062; Sat, 30 Mar 2024 19:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=qZ9KYDFeCa/c9/NzVccTMi5IzSb5H+omSw8GeZ+cvd0=; b=CF
 OUq/PA/507Wrw4usfl4xhng98Mn5G4rokVqJlrxC/saar/0wBh6ybi7xVMywH4sv
 atLV6hAJKdCwFiAxGpbhUr06mT/T4BxhrLGl+iAVoXrKCo/L52LeNzXx7zT/Wnyu
 Un57CSzY641uR2gbeFnFaTx5ejbj5ExmRjyWmr8q13rc3syWTBx1+f4NqT9Cgn2R
 A96q8HY96GXJ8Hy8uLP+hGSXxpd6kqF/Jadf8XEk5dHDriemlLWv2wJ4KcWwfP2V
 3F52E3SpDT36+czDmGs4+XdinXfhTOxRxSBr/eK13kZvh6h71N2V14mhDphWIku4
 PyLkZA5OiixK9PNwjvcQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x6a2p9ah1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 30 Mar 2024 19:39:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42UJdJY7021689
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 30 Mar 2024 19:39:19 GMT
Received: from [10.110.118.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 30 Mar
 2024 12:39:17 -0700
Message-ID: <7e21dd0d-5140-1d37-aa1e-535310ea6ac0@quicinc.com>
Date: Sat, 30 Mar 2024 12:39:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: fix vblank IRQ handling for command panels
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240330-dpu-fix-irqs-v1-1-39b8d4e4e918@linaro.org>
 <mxwrvnqth5f2vd4m55ryzqgyj7brykiqynzldelanxkuj2zny3@4pqi6p57c2q2>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <mxwrvnqth5f2vd4m55ryzqgyj7brykiqynzldelanxkuj2zny3@4pqi6p57c2q2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JbjXzBCsR4aKZ_mC_GJvCRY4Wb9ehB6x
X-Proofpoint-ORIG-GUID: JbjXzBCsR4aKZ_mC_GJvCRY4Wb9ehB6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-30_14,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403300161
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



On 3/30/2024 9:49 AM, Marijn Suijten wrote:
> On 2024-03-30 05:52:29, Dmitry Baryshkov wrote:
>> In case of CMD DSI panels, the vblank IRQ can be used outside of
>> irq_enable/irq_disable pair. This results in the following kind of
> 
> Can you clarify when exactly that is?  Is it via ops.control_vblank_irq in
> dpu_encoder_toggle_vblank_for_crtc()?
> 

Yes, please explain the sequence of events a litte bit more.

>> messages. Move assignment of IRQ indices to atomic_enable /
>> atomic_disable callbacks.
>>
>> [dpu error]invalid IRQ=[134217727, 31]
>> [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable true/0
>> [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable false/0
> 
> You are right that such messages are common, both at random but also seemingly
> around toggling the `ACTIVE` property on the CRTC:
> 
> 	[   45.878300] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_disable
> 	[   45.909941] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_unprepare
> 	[   46.093234] [drm:dpu_encoder_helper_wait_for_irq] *ERROR* encoder is disabled id=31, callback=dpu_encoder_phys_cmd_ctl_start_irq, IRQ=[134217727, 31]
> 	[   46.130421] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_prepare
> 	[   46.340457] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_enable
> 	[   65.520323] [dpu error]invalid IRQ=[134217727, 31] irq_cb:dpu_encoder_phys_cmd_te_rd_ptr_irq
> 	[   65.520463] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable true/0
> 	[   65.630199] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable false/0
> 	[  166.576465] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_disable
> 	[  166.609674] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_unprepare
> 	[  166.781967] [drm:dpu_encoder_helper_wait_for_irq] *ERROR* encoder is disabled id=31, callback=dpu_encoder_phys_cmd_ctl_start_irq, IRQ=[134217727, 31]
> 	[  166.829805] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_prepare
> 	[  167.040476] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_enable
> 	[  337.449827] [dpu error]invalid IRQ=[134217727, 31] irq_cb:dpu_encoder_phys_cmd_te_rd_ptr_irq
> 	[  337.450434] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable true/0
> 	[  337.569526] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable false/0
> 	[  354.980357] [dpu error]invalid IRQ=[134217727, 31] irq_cb:dpu_encoder_phys_cmd_te_rd_ptr_irq
> 	[  354.980495] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable true/0
> 	[  355.090460] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable false/0
> 
> Unfortunately with this patch, turning the CRTC off via ./modetest -M msm -a
> -w 81:ACTIVE:0 immediately triggers a bunch of WARNs (note that the CRTC turns
> on immediately again when the command returns, that's probably the framebuffer
> console taking over again).  Running it a few times in succession this may or
> may not happen, or reboot the phone (Xperia Griffin) entirely:
> 
> 	[   23.423930] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_disable
> 	[   23.461013] [dpu error]invalid IRQ=[134217727, 31]
> 	[   23.461144] [dpu error]invalid IRQ=[134217727, 31]
> 	[   23.461208] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable false/1
> 	[   23.461340] [dpu error]invalid IRQ=[134217727, 31]
> 	[   23.461406] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_unprepare
> 	[   23.641721] [drm:dpu_encoder_helper_wait_for_irq] *ERROR* encoder is disabled id=31, callback=dpu_encoder_phys_cmd_ctl_start_irq, IRQ=[134217727, 31]
> 	[   23.679938] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_prepare
> 	[   23.900465] ------------[ cut here ]------------
> 	[   23.900813] WARNING: CPU: 1 PID: 747 at drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:545 dpu_core_irq_register_callback+0x1b4/0x244
> 	[   23.901450] Modules linked in:
> 	[   23.901814] CPU: 1 PID: 747 Comm: modetest Tainted: G     U             6.9.0-rc1-next-20240328-SoMainline-02555-g27abbea53b6b #19
> 	[   23.902402] Hardware name: Sony Xperia 1 (DT)
> 	[   23.902674] pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	[   23.903133] pc : dpu_core_irq_register_callback+0x1b4/0x244
> 	[   23.903455] lr : dpu_encoder_phys_cmd_irq_enable+0x30/0x8c
> 	[   23.903880] sp : ffff800086833930
> 	[   23.904123] x29: ffff800086833930 x28: 0000000000000001 x27: ffff0273834522d0
> 	[   23.904604] x26: ffffd46ebdb5edc8 x25: ffffd46ebe0f1228 x24: ffff02738106b280
> 	[   23.904973] x23: ffff027383452000 x22: ffffd46ebd086290 x21: 0000000000000000
> 	[   23.905452] x20: ffff027382712080 x19: 0000000000000008 x18: ffff8000840550d0
> 	[   23.905820] x17: 000000040044ffff x16: 005000f2b5503510 x15: 00000000000006ce
> 	[   23.906300] x14: 0000000000000f00 x13: 0000000000000f00 x12: 0000000000000f00
> 	[   23.906778] x11: 0000000000000040 x10: ffffd46ebe853258 x9 : ffffd46ebe853250
> 	[   23.907146] x8 : ffffd46ebec30000 x7 : 0000000000000000 x6 : 0000000000000000
> 	[   23.907621] x5 : 0000000000000000 x4 : ffff027384eac080 x3 : ffff027381a1a080
> 	[   23.908099] x2 : 0000000000000001 x1 : ffff027384eac140 x0 : ffffd46ebd086290
> 	[   23.908467] Call trace:
> 	[   23.908688]  dpu_core_irq_register_callback+0x1b4/0x244
> 	[   23.909113]  dpu_encoder_phys_cmd_irq_enable+0x30/0x8c
> 	[   23.909417]  _dpu_encoder_irq_enable+0x58/0xa4
> 	[   23.909814]  dpu_encoder_resource_control+0x1e8/0x498
> 	[   23.910116]  dpu_encoder_virt_atomic_enable+0x9c/0x15c
> 	[   23.910531]  drm_atomic_helper_commit_modeset_enables+0x180/0x26c
> 	[   23.910871]  msm_atomic_commit_tail+0x1a4/0x510
> 	[   23.911277]  commit_tail+0xa8/0x19c
> 	[   23.911544]  drm_atomic_helper_commit+0x188/0x1a0
> 	[   23.911842]  drm_atomic_commit+0xb4/0xf0
> 	[   23.912226]  drm_client_modeset_commit_atomic+0x1fc/0x268
> 	[   23.912540]  drm_client_modeset_commit_locked+0x60/0x178
> 	[   23.912963]  drm_client_modeset_commit+0x30/0x5c
> 	[   23.913256]  drm_fb_helper_lastclose+0x64/0xb0
> 	[   23.913542]  msm_fbdev_client_restore+0x18/0x2c
> 	[   23.913948]  drm_client_dev_restore+0x8c/0xec
> 	[   23.914233]  drm_lastclose+0x68/0xac
> 	[   23.914499]  drm_release+0x128/0x15c
> 	[   23.914765]  __fput+0x7c/0x2cc
> 	[   23.915017]  __fput_sync+0x54/0x64
> 	[   23.915272]  __arm64_sys_close+0x3c/0x84
> 	[   23.915661]  invoke_syscall+0x4c/0x11c
> 	[   23.915932]  el0_svc_common.constprop.0+0x44/0xec
> 	[   23.916230]  do_el0_svc+0x20/0x30
> 	[   23.916600]  el0_svc+0x38/0xe4
> 	[   23.916854]  el0t_64_sync_handler+0x128/0x134
> 	[   23.917139]  el0t_64_sync+0x198/0x19c
> 	[   23.917515] ---[ end trace 0000000000000000 ]---
> 	[   23.918007] ------------[ cut here ]------------
> 	[   23.918324] WARNING: CPU: 1 PID: 747 at drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:545 dpu_core_irq_register_callback+0x1b4/0x244
> 	[   23.918720] Modules linked in:
> 	[   23.918878] CPU: 1 PID: 747 Comm: modetest Tainted: G     U  W          6.9.0-rc1-next-20240328-SoMainline-02555-g27abbea53b6b #19
> 	[   23.919248] Hardware name: Sony Xperia 1 (DT)
> 	[   23.919424] pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	[   23.919725] pc : dpu_core_irq_register_callback+0x1b4/0x244
> 	[   23.919934] lr : dpu_encoder_phys_cmd_irq_enable+0x78/0x8c
> 	[   23.920214] sp : ffff800086833930
> 	[   23.920373] x29: ffff800086833930 x28: 0000000000000001 x27: ffff0273834522d0
> 	[   23.920686] x26: ffffd46ebdb5edc8 x25: ffffd46ebe0f1228 x24: ffff02738106b280
> 	[   23.920922] x23: ffff027383452000 x22: ffffd46ebd086020 x21: 0000000000000000
> 	[   23.921237] x20: ffff027382712080 x19: 0000000000000029 x18: ffff8000840550d0
> 	[   23.921545] x17: 000000040044ffff x16: 005000f2b5503510 x15: 00000000000006ce
> 	[   23.921780] x14: 0000000000000f00 x13: 0000000000000f00 x12: 0000000000000f00
> 	[   23.922092] x11: 0000000000000040 x10: ffffd46ebe853258 x9 : ffffd46ebe853250
> 	[   23.922405] x8 : ffffd46ebec30000 x7 : 0000000000000000 x6 : 0000000000000001
> 	[   23.922640] x5 : ffffd46ebe0878d8 x4 : ffff027384eac080 x3 : ffff027381a1a080
> 	[   23.922953] x2 : 0000000000000001 x1 : ffff027384eac458 x0 : ffffd46ebd086020
> 	[   23.923266] Call trace:
> 	[   23.923411]  dpu_core_irq_register_callback+0x1b4/0x244
> 	[   23.923616]  dpu_encoder_phys_cmd_irq_enable+0x78/0x8c
> 	[   23.923893]  _dpu_encoder_irq_enable+0x58/0xa4
> 	[   23.924078]  dpu_encoder_resource_control+0x1e8/0x498
> 	[   23.924273]  dpu_encoder_virt_atomic_enable+0x9c/0x15c
> 	[   23.924547]  drm_atomic_helper_commit_modeset_enables+0x180/0x26c
> 	[   23.924763]  msm_atomic_commit_tail+0x1a4/0x510
> 	[   23.925030]  commit_tail+0xa8/0x19c
> 	[   23.925205]  drm_atomic_helper_commit+0x188/0x1a0
> 	[   23.925477]  drm_atomic_commit+0xb4/0xf0
> 	[   23.925653]  drm_client_modeset_commit_atomic+0x1fc/0x268
> 	[   23.925856]  drm_client_modeset_commit_locked+0x60/0x178
> 	[   23.926136]  drm_client_modeset_commit+0x30/0x5c
> 	[   23.926325]  drm_fb_helper_lastclose+0x64/0xb0
> 	[   23.926585]  msm_fbdev_client_restore+0x18/0x2c
> 	[   23.926771]  drm_client_dev_restore+0x8c/0xec
> 	[   23.926956]  drm_lastclose+0x68/0xac
> 	[   23.927206]  drm_release+0x128/0x15c
> 	[   23.927379]  __fput+0x7c/0x2cc
> 	[   23.927541]  __fput_sync+0x54/0x64
> 	[   23.927785]  __arm64_sys_close+0x3c/0x84
> 	[   23.927965]  invoke_syscall+0x4c/0x11c
> 	[   23.928141]  el0_svc_common.constprop.0+0x44/0xec
> 	[   23.928411]  do_el0_svc+0x20/0x30
> 	[   23.928582]  el0_svc+0x38/0xe4
> 	[   23.928746]  el0t_64_sync_handler+0x128/0x134
> 	[   23.929008]  el0t_64_sync+0x198/0x19c
> 	[   23.929180] ---[ end trace 0000000000000000 ]---
> 	[   23.929429] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_enable
> 
> - Marijn
