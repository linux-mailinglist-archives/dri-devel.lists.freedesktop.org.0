Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3CE7539C9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 13:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014AA10E85F;
	Fri, 14 Jul 2023 11:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A43010E85F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 11:42:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36E8PpnV031735; Fri, 14 Jul 2023 11:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RnMOdpGjADd7dPnDpFV65a4UlZO34/W6vYojGbJb9Zc=;
 b=joL+tbicGLER+LtP/AAT2GV4s2zSjAOB/YNPkU3GYwEeH2EIxM4m9wVHpmIN22XMR2JK
 piEtkqwLKhvM/aQhz3Onk7lOthyjJ52ve39Dz24wg/NFRefSzby+knj+6aFJEyqjo/63
 y7Hdg9yRgeBw/0YcNcEkuPqarh8I+oC6pPZpv9HH3DkR4UuHHhVC0RdyYuegJlkh8Zbq
 y+1rI0gNsdd8obYa4Ca0ToEnTvZu8J/wc8owUxUU8RWulZ+ifEsq6IdAu2dfRGe+u9JN
 i4zYqJY21AqirLmGjV+kMr3MrIImb+Ae2sMVr5oeen7U6X3zf2kvgSQ52tVlB6olB/Ix YQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtptr1kns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 11:42:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36EBgGnx012259
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 11:42:16 GMT
Received: from [10.50.55.51] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 14 Jul
 2023 04:42:13 -0700
Message-ID: <aa6e5330-1d61-35cf-89c5-93ba0cb7a6e9@quicinc.com>
Date: Fri, 14 Jul 2023 17:12:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/5 v4] accel/qaic: tighten bounds checking in
 decode_message()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
References: <ZK0Q5nbLyDO7kJa+@moroto>
From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <ZK0Q5nbLyDO7kJa+@moroto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: TN4yv3xJiJ63JhOmetygJ26kgs6gizrf
X-Proofpoint-GUID: TN4yv3xJiJ63JhOmetygJ26kgs6gizrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=715
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307140105
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



On 7/11/2023 1:50 PM, Dan Carpenter wrote:
> Copy the bounds checking from encode_message() to decode_message().
> 
> This patch addresses the following concerns.  Ensure that there is
> enough space for at least one header so that we don't have a negative
> size later.
> 
> 	if (msg_hdr_len < sizeof(*trans_hdr))
> 
> Ensure that we have enough space to read the next header from the
> msg->data.
> 
> 	if (msg_len > msg_hdr_len - sizeof(*trans_hdr))
> 		return -EINVAL;
> 
> Check that the trans_hdr->len is not below the minimum size:
> 
> 	if (hdr_len < sizeof(*trans_hdr))
> 
> This minimum check ensures that we don't corrupt memory in
> decode_passthrough() when we do.
> 
> 	memcpy(out_trans->data, in_trans->data, len - sizeof(in_trans->hdr));
> 
> And finally, use size_add() to prevent an integer overflow:
> 
> 	if (size_add(msg_len, hdr_len) > msg_hdr_len)
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
