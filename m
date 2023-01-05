Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EDD65F111
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 17:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1424710E11F;
	Thu,  5 Jan 2023 16:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B5110E11F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 16:25:38 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305D01jw030387; Thu, 5 Jan 2023 16:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qAbvP7pebfchHRIY4TdEKr/tY4nBQhqVIWFADnt+jpM=;
 b=PzSuG1bAOEsTnva4oYb7/8Ciav+wHEyqVeGsRTVFgKUEpFXXJWJ23x3lYHm9X75Zen2f
 exSNjiK6dt3XWGQZJjlTCQnWvexRQhXLA63IJ8TgwghgqB2Jxp6xzQkZ+DOfT7xhICMD
 pZh2G4lc9BEpNKqhn/qjlhFX54FxhbbcB5SgCqsX1szPreM88bQcVqhpgP4WY18Fbohy
 d9HnJr+8YAQ9cuA0YBK8hhrZT6pTUmI/p60eYxxgYSZG9OJII3yf05kKPoP7lVGviqjA
 BaLCYdjBugEdUMYUqcBB0GtgSFEDlL51QFzPmWUmTTtsCyyRfk32MnKpK4CXQPZrgxyX 0g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwj4hhqg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 16:25:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 305GPXtJ005857
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 5 Jan 2023 16:25:33 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 5 Jan 2023
 08:25:32 -0800
Message-ID: <ff231f90-9b67-7f47-b543-e8194f3cdec6@quicinc.com>
Date: Thu, 5 Jan 2023 09:25:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Jacek Lawrynowicz
 <jacek.lawrynowicz@linux.intel.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
 <Y7bJLkXF7xFYX4Qe@phenom.ffwll.local>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <Y7bJLkXF7xFYX4Qe@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fS8RqpzF-mYoQ74lx34woilB1FpWA_mZ
X-Proofpoint-ORIG-GUID: fS8RqpzF-mYoQ74lx34woilB1FpWA_mZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_07,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1011 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050129
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 dri-devel@lists.freedesktop.org, stanislaw.gruszka@linux.intel.com,
 tzimmermann@suse.de, andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/2023 5:57 AM, Daniel Vetter wrote:
> On Thu, Dec 08, 2022 at 12:07:27PM +0100, Jacek Lawrynowicz wrote:
>> +static const struct drm_driver driver = {
>> +	.driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
> 
> So I was wondering whether this is a bright idea, and whether we shouldn't
> just go ahead and infuse more meaning into accel vs render nodes.
> 
> The uapi relevant part of render nodes is that they're multi-user safe, at
> least as much as feasible. Every new open() gives you a new private
> accelerator. This also has implications on how userspace drivers iterate
> them, they just open them all in turn and check whether it's the right
> one - because userspace apis allow applications to enumerate them all.
> Which also means that any devicie initialization at open() time is a
> really bad idea.
> 
> A lot of the compute accelerators otoh (well habanalabs) are single user,
> init can be done at open() time because you only open this when you
> actually know you're going to use it.
> 
> So given this, shouldn't multi-user inference engines be more like render
> drivers, and less like accel? So DRIVER_RENDER, but still under
> drivers/accel.
> 
> This way that entire separate /dev node would actually become meaningful
> beyond just the basic bikeshed:
> - render nodes are multi user, safe to iterate and open() just for
>    iteration
> - accel nodes are single user, you really should not ever open them unless
>    you want to use them
> 
> Of course would need a doc patch :-)
> 
> Thoughts?
> -Daniel

Hmm.

I admit, I thought DRIVER_ACCEL was the same as DRIVER_RENDER, except 
that DRIVER_ACCEL dropped the "legacy" dual node setup and also avoided 
"legacy" userspace.

qaic is multi-user.  I thought habana was the same, at-least for 
inference.  Oded, am I wrong?

So, if DRIVER_ACCEL is for single-user (training?), and multi-user ends 
up in DRIVER_RENDER, that would seem to mean qaic ends up using 
DRIVER_RENDER and not DRIVER_ACCEL.  Then qaic ends up over under 
/dev/dri with both a card node (never used) and a render node.  That 
would seem to mean that the "legacy" userspace would open qaic nodes by 
default - something I understood Oded was trying to avoid.

If there really a usecase for DRIVER_ACCEL to support single-user?  I 
wonder why we can't default to multi-user, and if a particular 
user/driver has a single-user usecase, it enforces that in a driver 
specific manner?

-Jeff
