Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 866FE6A8CD1
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 00:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2871510E5A4;
	Thu,  2 Mar 2023 23:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59A210E307;
 Thu,  2 Mar 2023 23:17:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322KJ1ZD005271; Thu, 2 Mar 2023 23:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=/+JIn/xOjPrqhUPX6OH4D/agttYKI4KGRVhL+3f/bKU=;
 b=jI5LD53MaHL+o7hnEnElKdvvXzDhaW6VV3ZBOWH6ZXiibieKTQFWRBs1xZKI97b4InQv
 iP7y9J16c96ZefkPgurIkM1gFGD2/Borq+/lhw4FmOcxqztOkN0FNxhNCKJspE39sDHR
 j913N2IUkP5Ut20Hb7RQFzMHQobVPucfQadKnM18M6cM6af3zbyj+0Y7FOdu5jG85c/c
 NWz4/QoKde3tqhbFaDGGrW/90qzvzfEr8Shkim11TMp/V9ZS2yGCiuX/nPQWxt2eZON1
 ficp+gxBURxAjyToqU1FlAQPrN74bYrUZ5yw8SH8nubyHD0fRx1cvzci8Wa/g8yERQuA fg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p2ar144ku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 23:17:06 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 322NH5T2013534
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 2 Mar 2023 23:17:05 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 2 Mar 2023 15:17:05 -0800
Date: Thu, 2 Mar 2023 15:17:04 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] drm/msm: Initialize mode_config earlier
Message-ID: <20230302231704.GA1373835@hu-bjorande-lv.qualcomm.com>
References: <20230113041051.4189063-1-quic_bjorande@quicinc.com>
 <eea1c5dc-6bc5-4246-f0e1-0c790de9f078@linaro.org>
 <9a64c685-9ff0-bc1d-e604-e3773ff9edd7@linaro.org>
 <20230117025122.jt3wrjkqfnogu4ci@builder.lan>
 <Y8ZWl85gSpOaLgO4@hovoldconsulting.com>
 <Y86vaTQR7INWezyj@hovoldconsulting.com>
 <20230123171749.GA623918@hu-bjorande-lv.qualcomm.com>
 <Y8+SHQ/klPwusQRj@hovoldconsulting.com>
 <Y/9aGus6jzIHqjoK@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y/9aGus6jzIHqjoK@hovoldconsulting.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -CB_9uDJ1kIcrcrIE2q3T62hI2T5W_u5
X-Proofpoint-ORIG-GUID: -CB_9uDJ1kIcrcrIE2q3T62hI2T5W_u5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_15,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020201
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

On Wed, Mar 01, 2023 at 02:58:50PM +0100, Johan Hovold wrote:
> On Tue, Jan 24, 2023 at 09:09:02AM +0100, Johan Hovold wrote:
> > On Mon, Jan 23, 2023 at 09:17:49AM -0800, Bjorn Andersson wrote:
> > > On Mon, Jan 23, 2023 at 05:01:45PM +0100, Johan Hovold wrote:
> > > > On Tue, Jan 17, 2023 at 09:04:39AM +0100, Johan Hovold wrote:
> > > > > On Mon, Jan 16, 2023 at 08:51:22PM -0600, Bjorn Andersson wrote:
> > 
> > > > > > Perhaps we have shuffled other things around to avoid this bug?  Either
> > > > > > way, let's this on hold  until further proof that it's still
> > > > > > reproducible.
> > > > > 
> > > > > As I've mentioned off list, I haven't hit the apparent race I reported
> > > > > here:
> > > > > 
> > > > > 	https://lore.kernel.org/all/Y1efJh11B5UQZ0Tz@hovoldconsulting.com/
> > > > > 
> > > > > since moving to 6.2. I did hit it with both 6.0 and 6.1-rc2, but it
> > > > > could very well be that something has changes that fixes (or hides) the
> > > > > issue since.
> > > > 
> > > > For unrelated reasons, I tried enabling async probing, and apart from
> > > > apparently causing the panel driver to probe defer indefinitely, I also
> > > > again hit the WARN_ON() I had added to catch this:
> > > > 
> > > > [   13.593235] WARNING: CPU: 0 PID: 125 at drivers/gpu/drm/drm_probe_helper.c:664 drm_kms_helper_hotplug_event+0x48/0x7
> > > > 0 [drm_kms_helper]
> > 
> > > > So the bug still appears to be there (and the MSM DRM driver is fragile
> > > > and broken, but we knew that).
> > > > 
> > > 
> > > But the ordering between mode_config.funcs = !NULL and
> > > drm_kms_helper_poll_init() in msm_drm_init() seems pretty clear.
> > > 
> > > And my testing shows that drm_kms_helper_poll_init() is the cause for
> > > getting bridge->hpd_cb != NULL.
> > > 
> > > So the ordering seems legit, unless there's something else causing the
> > > assignment of bridge->hpd_cb to happen earlier in this scenario.
> > 
> > I'm not saying that this patch is correct (indeed it doesn't seem to
> > be), but only that the bug I reported still appears to be present in
> > 6.2.
> 
> So after debugging this issue a third time, I can conclude that it is
> still very much present in 6.2.
> 
> It appears you looked at the linux-next tree when you concluded that
> this patch was not needed. In 6.2 the bridge->hpd_cb callback is set
> before mode_config.funcs is initialised as part of
> kms->funcs->hw_init(kms).
> 
> The hpd DRM changes heading into 6.3 do appear to avoid the NULL-pointer
> dereference by moving the bridge->hpd_cb initialisation to
> drm_kms_helper_poll_init() as you mention above.
> 
> The PMIC GLINK altmode driver still happily forwards notifications
> regardless of the DRM driver state though, which can lead to missed
> hotplug events. It seems you need to implement the
> hpd_enable()/disable() callbacks and either cache or not enable events
> in fw until the DRM driver is ready.
> 

It's not clear to me what the expectation from the DRM framework is on
this point. We register a drm_bridge which is only capable of signaling
HPD events (DRM_BRIDGE_OP_HPD), not querying HPD state (DRM_BRIDGE_OP_DETECT).

Does this imply that any such bridge must ensure that hpd events are
re-delivered once hpd_enable() has been invoked (we can't invoke it from
hpd_enable...)?

Is it reasonable to do this retriggering in the altmode driver? Or is it
the job of the TCPM (it seems reasonable to not send the PAN_EN message
until we get hpd_enable()...)?

Regards,
Bjorn
