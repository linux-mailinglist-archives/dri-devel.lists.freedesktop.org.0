Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411816782D1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 18:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D5E10E514;
	Mon, 23 Jan 2023 17:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F043D10E514;
 Mon, 23 Jan 2023 17:18:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NEVrPQ027149; Mon, 23 Jan 2023 17:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=+/QnazVlttuMWED5A7tV9NfctdDmL+/pPXa5D4TpEuQ=;
 b=YVZXFjjcPAH8yzk0dDo7L1f+V0J/3defmItiVjSbwbDgfT33DVy4YYcwXyMLJskfdi/w
 fCicNnXxcL/YZaQ5GWs59YwCJo5puJ4tyfRMWE19YD4uSvU1O4wTLROSz82lyu6x9eGF
 Ztwa/u26PnWoOBozFy6LI3qwVIKLK5kpsE9dFD3A5vIYqVHqgg3AYXfCZgDdKz1O2L+w
 eh9yhr8FGhARLrTycIJBQ8AE/WcxfOWu4VpjRr53+Fn2R1hzHsNl5XJ8C9V3x+LyG9oA
 uXmTge33YBFrns5B7+wBGYsAFhysF9GELY7ZTUBgRcfwwrbsT2RpAmyPfLlEWe4Jjnm1 OA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89hk3dsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 17:17:51 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NHHpfB021708
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 17:17:51 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 09:17:50 -0800
Date: Mon, 23 Jan 2023 09:17:49 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] drm/msm: Initialize mode_config earlier
Message-ID: <20230123171749.GA623918@hu-bjorande-lv.qualcomm.com>
References: <20230113041051.4189063-1-quic_bjorande@quicinc.com>
 <eea1c5dc-6bc5-4246-f0e1-0c790de9f078@linaro.org>
 <9a64c685-9ff0-bc1d-e604-e3773ff9edd7@linaro.org>
 <20230117025122.jt3wrjkqfnogu4ci@builder.lan>
 <Y8ZWl85gSpOaLgO4@hovoldconsulting.com>
 <Y86vaTQR7INWezyj@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y86vaTQR7INWezyj@hovoldconsulting.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ESmtiDStjWIbmmzJOuoVzktNX_m2Qx9I
X-Proofpoint-ORIG-GUID: ESmtiDStjWIbmmzJOuoVzktNX_m2Qx9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230165
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 05:01:45PM +0100, Johan Hovold wrote:
> On Tue, Jan 17, 2023 at 09:04:39AM +0100, Johan Hovold wrote:
> > On Mon, Jan 16, 2023 at 08:51:22PM -0600, Bjorn Andersson wrote:
> > > On Fri, Jan 13, 2023 at 10:57:18AM +0200, Dmitry Baryshkov wrote:
> > > > On 13/01/2023 06:23, Dmitry Baryshkov wrote:
> > > > > On 13/01/2023 06:10, Bjorn Andersson wrote:
> > > > > > Invoking drm_bridge_hpd_notify() on a drm_bridge with a HPD-enabled
> > > > > > bridge_connector ends up in drm_bridge_connector_hpd_cb() calling
> > > > > > drm_kms_helper_hotplug_event(), which assumes that the associated
> > > > > > drm_device's mode_config.funcs is a valid pointer.
> > > > > > 
> > > > > > But in the MSM DisplayPort driver the HPD enablement happens at bind
> > > > > > time and mode_config.funcs is initialized late in msm_drm_init(). This
> > > > > > means that there's a window for hot plug events to dereference a NULL
> > > > > > mode_config.funcs.
> > > > > > 
> > > > > > Move the assignment of mode_config.funcs before the bind, to avoid this
> > > > > > scenario.
> > > > > 
> > > > > Cam we make DP driver not to report HPD events until the enable_hpd()
> > > > > was called? I think this is what was fixed by your internal_hpd
> > > > > patchset.
> > > > 
> > > > Or to express this in another words: I thought that internal_hpd already
> > > > deferred enabling hpd event reporting till the time when we need it, didn't
> > > > it?
> > > > 
> > > 
> > > I added a WARN_ON(1) in drm_bridge_hpd_enable() to get a sense of when
> > > this window of "opportunity" opens up, and here's the callstack:
> > > 
> > > ------------[ cut here ]------------
> > > WARNING: CPU: 6 PID: 99 at drivers/gpu/drm/drm_bridge.c:1260 drm_bridge_hpd_enable+0x48/0x94 [drm]
> > > ...
> > > Call trace:
> > >  drm_bridge_hpd_enable+0x48/0x94 [drm]
> > >  drm_bridge_connector_enable_hpd+0x30/0x3c [drm_kms_helper]
> > >  drm_kms_helper_poll_enable+0xa4/0x114 [drm_kms_helper]
> > >  drm_kms_helper_poll_init+0x6c/0x7c [drm_kms_helper]
> > >  msm_drm_bind+0x370/0x628 [msm]
> > >  try_to_bring_up_aggregate_device+0x170/0x1bc
> > >  __component_add+0xb0/0x168
> > >  component_add+0x20/0x2c
> > >  dp_display_probe+0x40c/0x468 [msm]
> > >  platform_probe+0xb4/0xdc
> > >  really_probe+0x13c/0x300
> > >  __driver_probe_device+0xc0/0xec
> > >  driver_probe_device+0x48/0x204
> > >  __device_attach_driver+0x124/0x14c
> > >  bus_for_each_drv+0x90/0xdc
> > >  __device_attach+0xdc/0x1a8
> > >  device_initial_probe+0x20/0x2c
> > >  bus_probe_device+0x40/0xa4
> > >  deferred_probe_work_func+0x94/0xd0
> > >  process_one_work+0x1a8/0x3c0
> > >  worker_thread+0x254/0x47c
> > >  kthread+0xf8/0x1b8
> > >  ret_from_fork+0x10/0x20
> > > ---[ end trace 0000000000000000 ]---
> > > 
> > > As drm_kms_helper_poll_init() is the last thing being called in
> > > msm_drm_init() shifting around the mode_config.func assignment would not
> > > have any impact.
> > > 
> > > Perhaps we have shuffled other things around to avoid this bug?  Either
> > > way, let's this on hold  until further proof that it's still
> > > reproducible.
> > 
> > As I've mentioned off list, I haven't hit the apparent race I reported
> > here:
> > 
> > 	https://lore.kernel.org/all/Y1efJh11B5UQZ0Tz@hovoldconsulting.com/
> > 
> > since moving to 6.2. I did hit it with both 6.0 and 6.1-rc2, but it
> > could very well be that something has changes that fixes (or hides) the
> > issue since.
> 
> For unrelated reasons, I tried enabling async probing, and apart from
> apparently causing the panel driver to probe defer indefinitely, I also
> again hit the WARN_ON() I had added to catch this:
> 
> [   13.593235] WARNING: CPU: 0 PID: 125 at drivers/gpu/drm/drm_probe_helper.c:664 drm_kms_helper_hotplug_event+0x48/0x7
> 0 [drm_kms_helper]
> ...
> [   13.679429] CPU: 0 PID: 125 Comm: kworker/0:3 Not tainted 6.2.0-rc4 #110
> [   13.687159] Hardware name: Qualcomm QRD, BIOS 6.0.220110.BOOT.MXF.1.1-00470-MAKENA-1 01/10/2022
> [   13.696947] Workqueue: events pmic_glink_altmode_worker [pmic_glink_altmode]
> [   13.705044] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   13.713054] pc : drm_kms_helper_hotplug_event+0x48/0x70 [drm_kms_helper]
> [   13.720812] lr : drm_kms_helper_hotplug_event+0x18/0x70 [drm_kms_helper]
> [   13.728557] sp : ffff800009e33c90
> [   13.732779] x29: ffff800009e33c90 x28: ffffad90862eb000 x27: ffff62d2362ee305
> [   13.740956] x26: ffffad90862f1ea0 x25: ffffad9086309b50 x24: 0000000000000000
> [   13.749125] x23: 0000000000000003 x22: ffff62d0c5dad000 x21: 0000000000000002
> [   13.757291] x20: ffff62d0c6d24000 x19: ffff62d0c5dad000 x18: 0000000000000038
> [   13.765443] x17: 0000000000000004 x16: 000000000000d323 x15: 0000000000000004
> [   13.773585] x14: ffffad9086594208 x13: ffffad90865f50e8 x12: 0000000000000000
> [   13.781723] x11: 00000000000400d7 x10: 0000000000000008 x9 : 0000000000000002
> [   13.789867] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000097d00
> [   13.798013] x5 : ffff62d0c3395000 x4 : ffff62d2362ed750 x3 : 0000000000097e00
> [   13.806161] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
> [   13.814304] Call trace:
> [   13.817604]  drm_kms_helper_hotplug_event+0x48/0x70 [drm_kms_helper]
> [   13.824959]  drm_bridge_connector_hpd_cb+0xa0/0xc0 [drm_kms_helper]
> [   13.832227]  drm_bridge_hpd_notify+0x40/0x60 [drm]
> [   13.837993]  pmic_glink_altmode_worker+0xc0/0x150 [pmic_glink_altmode]
> [   13.845505]  process_one_work+0x288/0x6c0
> [   13.850404]  worker_thread+0x74/0x450
> [   13.854948]  kthread+0x118/0x120
> [   13.859032]  ret_from_fork+0x10/0x20
> [   13.863473] irq event stamp: 7440
> [   13.867631] hardirqs last  enabled at (7439): [<ffffad9085b00450>] _raw_spin_unlock_irqrestore+0x80/0x90
> [   13.878157] hardirqs last disabled at (7440): [<ffffad9085af33e4>] el1_dbg+0x24/0x90
> [   13.886885] softirqs last  enabled at (7308): [<ffffad908514046c>] _stext+0x46c/0x5d8
> [   13.895697] softirqs last disabled at (7303): [<ffffad90851467b0>] ____do_softirq+0x10/0x20
> [   13.905038] ---[ end trace 0000000000000000 ]---
> 
> So the bug still appears to be there (and the MSM DRM driver is fragile
> and broken, but we knew that).
> 

But the ordering between mode_config.funcs = !NULL and
drm_kms_helper_poll_init() in msm_drm_init() seems pretty clear.

And my testing shows that drm_kms_helper_poll_init() is the cause for
getting bridge->hpd_cb != NULL.

So the ordering seems legit, unless there's something else causing the
assignment of bridge->hpd_cb to happen earlier in this scenario.

Regards,
Bjorn
