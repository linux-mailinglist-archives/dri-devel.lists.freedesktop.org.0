Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0402774BBE8
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 07:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2912510E0A1;
	Sat,  8 Jul 2023 05:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F3610E0A1
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 05:06:18 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3685391D020626; Sat, 8 Jul 2023 05:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ih2L8O3sAuVewyL8Xtb1p4OvDu4fjKOPnt0XPOKayMk=;
 b=ncOQpiEx1Tasxn6I4vrMAlYP9s70ktx/Wdt0kCmv3BysCYk+mLNn7lak/Yk0aWB/BR+g
 FaVyHRv8jj1PfreAf2RuWDx/xT00Bx6oAyrWsvhX/ITg+ZyJ7D2IYhUIn1qHHlGoEQN8
 lBRXnN5wnFpDEiL7lJXE3Ba/BQv1YEbdfiIGKcDY24ibpiMXKLwsrvpPZitizDfe6rcd
 JwtNStxH75FLVRL8YFlAPDSeY4qQ3j8kTYzHX/nVeWOmYkJLQajCQ35Gozg/lXvKlTrS
 8HbvakhYsDTYXSsf1B4rgFeLnYS8xAwkHR1odR4VnWxD6J0QYKquWwVn8QSgg4JY7a4m bQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpy4rr46e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 08 Jul 2023 05:06:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 368569Qk001615
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 8 Jul 2023 05:06:09 GMT
Received: from [10.50.31.106] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 7 Jul
 2023 22:06:06 -0700
Message-ID: <1d43bc35-1342-0863-069c-252352f8ae6b@quicinc.com>
Date: Sat, 8 Jul 2023 10:36:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/5] accel/qaic: Add consistent integer overflow checks
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
References: <a914d7ed-f7ef-45b5-9bca-dcc014b700eb@moroto.mountain>
 <09c6589c-2af2-f06a-a2a2-a0658ad31de4@quicinc.com>
From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <09c6589c-2af2-f06a-a2a2-a0658ad31de4@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: K8p9jd-xWFWxGc3jW3D3g4kmOKif3HRL
X-Proofpoint-GUID: K8p9jd-xWFWxGc3jW3D3g4kmOKif3HRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-08_02,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=895 spamscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307080045
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
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/8/2023 12:21 AM, Jeffrey Hugo wrote:
> On 6/21/2023 1:22 AM, Dan Carpenter wrote:
>> The encode_dma() function has integer overflow checks.  The
>> encode_passthrough(), encode_activate() and encode_status() functions
>> did not.  I added integer overflow checking everywhere.  I also
>> updated the integer overflow checking in encode_dma() to use size_add()
>> so everything is consistent.
>>
>> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Looks good to me. Just the #include <overflow.h> as Jeff suggested.

Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
