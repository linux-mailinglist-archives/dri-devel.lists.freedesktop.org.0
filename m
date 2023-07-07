Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D47174B6A5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 20:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8356910E5D9;
	Fri,  7 Jul 2023 18:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3BD10E5D9
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 18:51:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 367HglVG032227; Fri, 7 Jul 2023 18:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=U5h+hxqvX71rJU3yat61W+CQz/j4S54vVfLJ9TR4yY0=;
 b=GivQHTqSi5rZOJwcztKCO5RPEmfEA+903lSrooTGgi8S+kknW6adPcYlaxn3iTq7JPw5
 gMPvaHBf9UbBWeEurexVjq+dY4yQpzGCn0cg8FssThFn4N/el2eahENiOd6r8RkyCmkh
 UcNbmHsDBTRysKbCpoRrj+PxtLP77e7Kq5vh7qcnNW6OlCoSYvdpmNx7qoVuHnPCTsYn
 SjSbU6pj0DX78l0ofOmBkkl5pcKJ6zQVl98Nfg+fvJ96eu88YYI8iCEltplXIOTQfIvf
 Jd66jMdDd2TO5iGOsRqOvIrqVlfPNe4DESEvgBxoOxNG/aTjufLrSqT/NoM/OTwAbWgL Ug== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rp8a62adw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 18:51:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 367IpkgS011401
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 7 Jul 2023 18:51:46 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 7 Jul
 2023 11:51:45 -0700
Message-ID: <09c6589c-2af2-f06a-a2a2-a0658ad31de4@quicinc.com>
Date: Fri, 7 Jul 2023 12:51:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/5] accel/qaic: Add consistent integer overflow checks
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <a914d7ed-f7ef-45b5-9bca-dcc014b700eb@moroto.mountain>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <a914d7ed-f7ef-45b5-9bca-dcc014b700eb@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: n3JY4vzpJqXig5D2nC_HT-y1kLISYpwD
X-Proofpoint-GUID: n3JY4vzpJqXig5D2nC_HT-y1kLISYpwD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 clxscore=1015 phishscore=0 mlxlogscore=833 bulkscore=0
 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070173
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
> The encode_dma() function has integer overflow checks.  The
> encode_passthrough(), encode_activate() and encode_status() functions
> did not.  I added integer overflow checking everywhere.  I also
> updated the integer overflow checking in encode_dma() to use size_add()
> so everything is consistent.
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
