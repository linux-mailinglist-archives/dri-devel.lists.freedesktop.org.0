Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7020961F98B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA6910E494;
	Mon,  7 Nov 2022 16:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469E510E494
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:25:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A7CrqAV013913; Mon, 7 Nov 2022 16:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=s50hR/GCzmFQRvNbtM/53m/Jdy4zBTTllf2Oe2mGHDA=;
 b=QigOjB/rYStnzvlgyYK2BJof3turH6m6rO9epIxXz6AdxRNTOXAmrr25XjraelCQyAav
 PBL2UgdC+V5QqzfbW3LPSbIGLtJoi/n9i6H8LcyCWU9On9xoT/ghXbImvkEOgF+gMpfh
 JA5+v9mb3OkouZVbRqaYCski0PHLaN2cb61ZvAiupbeS2hX6TJFyNfJEoRQmLGKBKD/g
 onp4kQt5hwijqIxmsrAS/s+jrOa8zEJR2ejDYFXVZcHJ57sjm66LVr4i5TuQlpuce8Gn
 m8AjCYJwTO1XW5+GdyLFHCx/FQo2lja8qYo2gazo9MDye4JIIGmhqvJf6+FP0OMAmSoW 7w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kphj8j8qa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 16:24:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A7GOtS3011461
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Nov 2022 16:24:55 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 7 Nov 2022
 08:24:53 -0800
Message-ID: <2537e41d-f863-4819-57d2-09b9554f801b@quicinc.com>
Date: Mon, 7 Nov 2022 09:24:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v3 3/3] drm: initialize accel framework
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20221106210225.2065371-1-ogabbay@kernel.org>
 <20221106210225.2065371-4-ogabbay@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20221106210225.2065371-4-ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -yaopUW5-8pXniYB_FOCekDEa0cF5-fA
X-Proofpoint-ORIG-GUID: -yaopUW5-8pXniYB_FOCekDEa0cF5-fA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211070131
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jiho Chu <jiho.chu@samsung.com>, Randy Dunlap <rdunlap@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kevin Hilman <khilman@baylibre.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/6/2022 2:02 PM, Oded Gabbay wrote:

> @@ -603,6 +626,14 @@ static int drm_dev_init(struct drm_device *dev,
>   	/* no per-device feature limits by default */
>   	dev->driver_features = ~0u;
> 
> +	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) &&
> +				(drm_core_check_feature(dev, DRIVER_RENDER) ||
> +				drm_core_check_feature(dev, DRIVER_MODESET))) {

Shouldn't the indentation for the 2nd and 3rd line be such that the 
start of the lines is aligned with the "(" on the first line?
