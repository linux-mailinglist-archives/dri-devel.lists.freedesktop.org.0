Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCF2978A89
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 23:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342E210EDAB;
	Fri, 13 Sep 2024 21:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hPORs8CW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4527F10EDAB;
 Fri, 13 Sep 2024 21:24:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAMtOY020721;
 Fri, 13 Sep 2024 21:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tQMAo/P1IflG7nAnXqAA/OEs
 PpPBcgSWfyxQsLmmhyQ=; b=hPORs8CWJDrsMA5BXP/N68whcDL+nSNB9SPTABw/
 Acpf8YX9z4OI/G4BLtm/YqqJZ5n0mQDE8XYtDUcaL/h4V0opZB86jsBrzT2Z21YS
 KqYivrNAg/vJgycnhWJmQh0pVJRoe0n91alO8yeI7HeNRsykQ0sPpfr+3bCgiQWG
 2kEG9IzsJKmp41YKOgJDkQmvKEmmXxJIW7DHomvcfInzKYbeO7GAGsrOe72JS6fF
 cBT+86BdIO47aux8VpSObs5MaRnXat1TRfU0FRx80pxUIKP6wqwB7O4OQ/x6POEN
 eDTqMSsyOZDj+I1cO+oPRvfZF2ybA9PqHhOJR/AvpQvmGA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6phxea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2024 21:24:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DLOZXO020049
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2024 21:24:35 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 14:24:35 -0700
Date: Fri, 13 Sep 2024 14:24:33 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <konradybcio@kernel.org>,
 <andersson@kernel.org>, <simona@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <abel.vesa@linaro.org>,
 <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <quic_khsieh@quicinc.com>,
 <konrad.dybcio@linaro.org>, <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <quic_riteshk@quicinc.com>, <quic_vproddut@quicinc.com>
Subject: Re: [PATCH 5/5] drm/msm/dp: Add DisplayPort controller for SA8775P
Message-ID: <ZuStkRFvwJT7re6D@hu-bjorande-lv.qualcomm.com>
References: <20240911100813.338-1-quic_mukhopad@quicinc.com>
 <20240911100813.338-6-quic_mukhopad@quicinc.com>
 <ZuH3WqMwn7fl3nhh@hu-bjorande-lv.qualcomm.com>
 <a44a6f08-1f4a-4e5c-a4e4-30ab65c467f7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a44a6f08-1f4a-4e5c-a4e4-30ab65c467f7@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: g_fwJ9nxwhCCQryUMpJpBLvqMux3AxWq
X-Proofpoint-GUID: g_fwJ9nxwhCCQryUMpJpBLvqMux3AxWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130152
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

On Thu, Sep 12, 2024 at 03:34:05PM +0530, Soutrik Mukhopadhyay wrote:
> 
> On 9/12/2024 1:32 AM, Bjorn Andersson wrote:
> > On Wed, Sep 11, 2024 at 03:38:13PM +0530, Soutrik Mukhopadhyay wrote:
> > > The Qualcomm SA8775P platform comes with a DisplayPort controller
> > > with a different base offset than the previous SoCs,
> > > add support for this in the DisplayPort driver.

Please check the line wrapping of this as well; the lines here should be
wrapped at 75 columns.

> > > 
> > > Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index e1228fb093ee..e4954fd99eb0 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -118,6 +118,12 @@ struct msm_dp_desc {
> > >   	bool wide_bus_supported;
> > >   };
> > > +static const struct msm_dp_desc sa8775p_dp_descs[] = {
> > > +	{ .io_start = 0xaf54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> > > +	{ .io_start = 0xaf5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> > Why is this list incomplete?
> > 
> > Regards,
> > Bjorn
> 
> 
> Do you mean to add for mdss_1 as well?
> 

I don't see a reason for not submitting them as well.

> We only added dp controllers for mdss_0 as we plan to validate and enable
> only these.
> 

As far as I can tell there are 5 DPTX blocks on mdss_0.


It is perfectly fine that you just state in the commit message that
"Only MDSS0 DPTX0 and DPTX1 have been validated", but please add the
others as well in this commit.

Regards,
Bjorn

> 
> > 
> > > +	{}
> > > +};
> > > +
> > >   static const struct msm_dp_desc sc7180_dp_descs[] = {
> > >   	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> > >   	{}
> > > @@ -162,6 +168,7 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
> > >   };
> > >   static const struct of_device_id dp_dt_match[] = {
> > > +	{ .compatible = "qcom,sa8775p-dp", .data = &sa8775p_dp_descs },
> > >   	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
> > >   	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
> > >   	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
> > > -- 
> > > 2.17.1
> > > 
