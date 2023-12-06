Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5276F8065DF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 04:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACBE10E07A;
	Wed,  6 Dec 2023 03:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD24610E07A;
 Wed,  6 Dec 2023 03:51:15 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B63kPSK016358; Wed, 6 Dec 2023 03:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=qFuWcg1lSo4SYB/c0K5uToTZ+KryMcI7nagBT4uknTk=;
 b=bjTuNGoV5aoEMyGV2k934pniPWHWjw3Ar5WBhUM/sHKRwUxQkEgr9QXwklDAD5V1ofgW
 4JK4tkP7K0pOG4CU+cAt58MlLVhw7PeSnJzWKcTQcWRgKw3wEJFNVR2Qd5DEF5mLmKdI
 hQoy9ZjaIqa0aHXm9YOtRszYoShlD0FNLRnyTO2SAvj67RK12ibWVzEgqppyRGno6lfk
 C46HzDajwLbjeUc9PA/YOOXL5HXOqsQZ/OWBg7E/0mj+3fJilBdHWBm/76zs5tobs7cP
 A1rQ/q6jXrBiWjrbWMVCIphuy+DYUmoHyxYcYSEqOAVGHTkhrv2Wy+fvJSvvrm0QBljJ BA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utd510g2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Dec 2023 03:51:09 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B63p8QW002883
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Dec 2023 03:51:08 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 5 Dec 2023 19:51:08 -0800
Date: Tue, 5 Dec 2023 19:51:07 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 2/2] drm/msm/dpu: Add mutex lock in control vblank irq
Message-ID: <20231206035107.GK1766637@hu-bjorande-lv.qualcomm.com>
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-3-quic_parellan@quicinc.com>
 <20231201034710.GB1766637@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqFya5H+4PPZ8A3CqqqRJXsJ3KKbbcfS=C13QTr1vAtSw@mail.gmail.com>
 <20231201162252.GG1766637@hu-bjorande-lv.qualcomm.com>
 <a78c42d1-6ce0-2c34-5513-c04948d2ff31@quicinc.com>
 <knm2uvjuad47famhr5uzibxxx3reknxdpb5raj3fox2vlkarvc@w6xer6jo4yok>
 <14e6d232-8e6d-0b5f-4ec4-a23244bcd701@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <14e6d232-8e6d-0b5f-4ec4-a23244bcd701@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Em9r5LIVTaOyBhOT2THsP4prCts6WicW
X-Proofpoint-GUID: Em9r5LIVTaOyBhOT2THsP4prCts6WicW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_01,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=816 spamscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312060031
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
Cc: marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Paloma Arellano <quic_parellan@quicinc.com>,
 steev@kali.org, quic_jesszhan@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 04, 2023 at 11:22:24AM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/3/2023 7:31 PM, Bjorn Andersson wrote:
> > On Fri, Dec 01, 2023 at 11:43:36AM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 12/1/2023 8:22 AM, Bjorn Andersson wrote:
> > > > On Fri, Dec 01, 2023 at 10:34:50AM +0200, Dmitry Baryshkov wrote:
> > > > > On Fri, 1 Dec 2023 at 05:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> > > > > > On Thu, Nov 30, 2023 at 05:40:55PM -0800, Paloma Arellano wrote:
> > > > [..]
> > > > > > > @@ -2386,6 +2390,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
> > > > > > >         dpu_enc->enabled = false;
> > > > > > >         mutex_init(&dpu_enc->enc_lock);
> > > > > > >         mutex_init(&dpu_enc->rc_lock);
> > > > > > > +     mutex_init(&dpu_enc->vblank_ctl_lock);
> > > > > > 
> > > > > > Is this somehow propagated to multiple different dpu_encoder_phys
> > > > > > instances, or why do you need to initialize it here and pass the pointer
> > > > > > through 2 different intermediate structures before assigning it to
> > > > > > phys_enc->vblank_ctl_lock below?
> > > > > 
> > > > > Yes, there can be two phys_enc instances for a single encoder, so this
> > > > > part is fine.
> > > > > 
> > > > 
> > > > Thanks for the clarification, Dmitry. Sounds like it make sense then.
> > > > 
> > > > But, if I read the code correctly the two instances will have separate
> > > > vblank_refcount copies, and the dpu_core_irq_*() interface does mutual
> > > > exclusion within. So why do we need shared mutual exclusion between the
> > > > two? (This is where a proper description of the problem in the commit
> > > > message would have been very helpful)
> > > > 
> > > 
> > > Are you suggesting we just have one vblank_ctl_lock per encoder and not have
> > > one vblank_ctl_lock per phys encoder? I cannot think of a display specific
> > > reason for that other than just the SW layout.
> > > 
> > > The reason its like this today is that control_vblank_irq is an encoder phys
> > > op because it does different things based on the type of encoder.
> > > 
> > > Because its an encoder phys op, it has the vblank_ctl_lock at the phys
> > > structure and not the encoder one.
> > > 
> > > Its just more about how the phys op is defined that each phys op operates on
> > > its phys's structure.
> > > 
> > > Generally, if we have one encoder with two physical encoders we anyways bail
> > > out early for the other encoder so this is mostly a no-op for the slave phys
> > > encoder.
> > > 
> > > Please take a look at below return point.
> > > 
> > > 715 	/* Slave encoders don't report vblank */
> > > 716 	if (!sde_encoder_phys_vid_is_master(phys_enc))
> > > 717 		goto end;
> > > 718
> > > 
> > > So technically its still providing protection for the same phys encoder but
> > > the catch is this control_vblank_irq can get called from different threads
> > > hence we need exclusion.
> > > 
> > 
> > The way I understand the code is that the atomic is used to refcount
> > when to enable/disable the interrupt, and the new lock protects this
> > refcount during concurrent updates. I have no concerns with this part.
> > 
> 
> Correct.
> 
> > 
> > What I'm seeing is that the refcount it per phys_enc, and as such there
> > would be no reason to have a common mutex to protect the two independent
> > refcounts.
> > 
> > But I'm probably misunderstanding something here...
> > 
> 
> There is no reason to have a common mutex to protect the two independent
> refcounts. In fact, there is no need to even have two independent refcounts
> because whenever we have one encoder with two physical encoders, we use only
> the master physical encoder for vblanks like I pointed above.
> 
> The only reason we have it like this is because today the vblank_refcount is
> part of phys_enc so the mutex handle is also now a part of it.
> 
> Do you think if we move both the mutex and the vblank_refcount to the
> dpu_encoder from the dpu_encoder_phys and maintain the mutex at that level
> it will be less confusing for you?
> 

The two functions operate on dpu_encoder_phys objects, and as you say
above the two instances doesn't need to be handled under shared mutual
exclusion.

Moving the serialization mechanism to dpu_encoder seems like it would
create an entanglement, for the sake of making the lock common. If
nothing else this would act as documentation to me that the two
functions are intertwined somehow.

I was rather hoping that we'd move the mutex_init() to
dpu_encoder_phys_init() and avoid passing a reference around in
unrelated parts of the code just to set up the sharing, if that's not
necessary.

Regards,
Bjorn

> I am fine with that.
> 
> > Regards,
> > Bjorn
> > 
