Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9882874B70C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 21:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3936C10E14E;
	Fri,  7 Jul 2023 19:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFB210E076
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 19:25:40 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 367HeNOt016276; Fri, 7 Jul 2023 19:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iBeFKc94SpYiLDchrjSwg3dQW+HvM0CWKOPWx91gaBs=;
 b=J2Lw08HBa6mCH1/kpE2Q4RFuKOTlYFKMa+BKXpfNOMLWS3A11we5V2P/P+Uk+aoG8Bbm
 NGr2uv6XKoxlJCC/zYCpo3gX/TeUR6GGsIdaPr58Wjg4L6cJ9nVslpupVdDFfKR39xA4
 jeSNVheFVfvCdlOieP/mjNRxorqIooL5+gI2aULen2CQuD6lDDeTg5l9lsfamp7IKd6G
 g+ajFRBA5glsjZV/nm6YeuXqOXQa1KRGVlT/6zgppHsiHAYIukKp+6ppeRIu1n53PKWE
 52Fc8n2wglt4oocTtiz3fih5b26e9uuxENEPNxfaoi4vM3yPsefellMUhvh1W2PyI3C5 cg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rp71yafx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 19:24:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 367JOl9i030556
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 7 Jul 2023 19:24:47 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 7 Jul
 2023 12:24:46 -0700
Message-ID: <849e621c-956c-c482-08de-ce73b7859d49@quicinc.com>
Date: Fri, 7 Jul 2023 13:24:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 5/5] accel/qaic: Fix a leak in map_user_pages()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <d04e5fc2-7b2b-4fb1-a9d7-17b55ecb9986@moroto.mountain>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <d04e5fc2-7b2b-4fb1-a9d7-17b55ecb9986@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: T7wttOLaVhDPALKqRK7W0czavjdS2PQl
X-Proofpoint-ORIG-GUID: T7wttOLaVhDPALKqRK7W0czavjdS2PQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=727 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070178
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>, Jacek
 Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/21/2023 1:22 AM, Dan Carpenter wrote:
> If get_user_pages_fast() allocates some pages but not as many as we
> wanted, then the current code leaks those pages.  Call put_page() on
> the pages before returning.
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
