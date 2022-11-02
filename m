Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 901D7616FC8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 22:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB49E10E664;
	Wed,  2 Nov 2022 21:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6EF10E663
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 21:30:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A2LQbru031291; Wed, 2 Nov 2022 21:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8M4oNJWBxl6J9cF9aFri0vLNH3Y5FE7K8nXrAL0guLc=;
 b=i1L6aPKtVZRGXOQMyvSgw4r0vkHAQ0rhXQFGFiBvfrXtC25bD2qm1jopOdWisdqVuA/x
 RZItexTxAwyCTqZ85eBoCu9jobTy6KWvxPxqMJdMhbPTh4dEM3abXM0unkDPY8PGz8BQ
 YDVdRRvHgpEuteKLtjPwhCKcMEEZiz9T9t714g73PigK5St/LI3EtqEx/3wqtGDfOQN7
 T4X2rOCj9A9/A0VAlOokkSlDicsrLHWKEPQbvf+M4Y3baITZ46kzb9qT1FLrRUcDn/Vz
 iksmgNUmYt6RR8RKEmu53YUvBffqVbtNySzr/1gv8fa8J3EOiaCNQh4sggx8p75yGkzj Tw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kkw41gsdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 21:30:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A2LUTNe005843
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 2 Nov 2022 21:30:29 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 2 Nov 2022
 14:30:28 -0700
Message-ID: <b6faacac-46f2-7643-7796-b34840fc94f5@quicinc.com>
Date: Wed, 2 Nov 2022 15:30:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v2 3/3] drm: initialize accel framework
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-4-ogabbay@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20221102203405.1797491-4-ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 1ML62Efs16CUbymup6sHIAEFHeWbnW3l
X-Proofpoint-GUID: 1ML62Efs16CUbymup6sHIAEFHeWbnW3l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020142
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
 Jiho Chu <jiho.chu@samsung.com>, Christoph Hellwig <hch@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kevin Hilman <khilman@baylibre.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/2/2022 2:34 PM, Oded Gabbay wrote:
> @@ -163,7 +174,11 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
>   
>   	ret = drm_debugfs_init(minor, minor->index, drm_debugfs_root);
>   	if (ret) {
> -		DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
> +		if (minor->type == DRM_MINOR_ACCEL)
> +			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/accel.\n");
> +		else
> +			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
> +
>   		goto err_debugfs;
>   	}
>   

This doesn't look right.  Don't you need to call drm_debugfs_init() with 
accel_debugfs_root for the case - minor->type == DRM_MINOR_ACCEL? 
Unless I fail to understand something, this will put all the accel 
devices under /sys/kernel/debug/dri
