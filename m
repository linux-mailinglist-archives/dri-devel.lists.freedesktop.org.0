Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456A5997C5E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 07:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5909B10E861;
	Thu, 10 Oct 2024 05:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TmT6J0gz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B191810E861
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 05:25:56 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bDQQ015787;
 Thu, 10 Oct 2024 05:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Rrxvtk20DyXUT9Q3kRJiXziMCR5VRU40fplU6u4GV+k=; b=TmT6J0gzyMToyrUc
 sm0IA/vdygGwHb0dLlrl+LVOVxCG8p7zOHWf3atuSMabPf/qDeDiWjRO6P923/6l
 QJteYZlTTKcPkTfL6/xIQqLO0eAG1AfSz7G/Nr+rpeYhJm+47A73u0oRR610n4PF
 4ZR9TpMsiq6nH1o70S30u85BKOmNlkhbM8ISKPpaEEovBgbaRAjpv/VpM66yLZYC
 tR1QSG4ORhwuvvuoBnMVUbkrNjhJgoeUIXkVVCdrgHpRWuz9XN+nFUMlte/nhfcq
 zeJBfioR/C0S4MH2tnnduxOH25bvBpRrYUa3Vy+dGwf3SoMglvxZN4pwFzeyJrnU
 UjSQqA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424kaf0knk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2024 05:25:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A5Ppm0023201
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2024 05:25:51 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 22:25:48 -0700
Message-ID: <27fee62d-a39c-4473-88b4-91670ddc8fde@quicinc.com>
Date: Thu, 10 Oct 2024 10:55:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <arnd@arndb.de>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
 <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
 <2024100729-overall-sugar-d3b8@gregkh>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024100729-overall-sugar-d3b8@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6uFSrIisUPkg-C-OKWfDOjKCSIUIdko2
X-Proofpoint-GUID: 6uFSrIisUPkg-C-OKWfDOjKCSIUIdko2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=703 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100034
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



On 10/7/2024 2:23 PM, Greg KH wrote:
> On Mon, Oct 07, 2024 at 02:15:15PM +0530, Ekansh Gupta wrote:
>> +struct fastrpc_invoke_v2 {
>> +	struct fastrpc_invoke inv;
>> +	__u64 crc;
>> +	__u32 reserved[16];
> I'm sure we have been over this before, but if you have a reserved
> field, you HAVE to check that it is zero if you ever want to use it in
> the future.  As you did not check it, just remove it from this structure
> as obviously it can never be used for anything.
>
> Your internal review should have caught this, if not, please go fix it
> AND get some internal review and signed-off-by before submitting this
> series again.
Thanks for your insights. I'll fix this in the next patch. My apologies for missing it.

--ekansh
>
> thanks,
>
> greg k-h

