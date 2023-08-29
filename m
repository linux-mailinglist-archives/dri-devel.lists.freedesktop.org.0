Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D978C84E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAE010E126;
	Tue, 29 Aug 2023 15:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6121310E394
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 15:10:35 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TBkjRb021462; Tue, 29 Aug 2023 15:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cU2tL0JEIYpbB3kKTlPCp9uXA5N+i56QrqVX0XA9geE=;
 b=F/IagfGKAYc9eVF4hVAfIUmL2odSfDrhNDAqcL4uSPW4kxU7O3h3Gmc+IZ84Rg/jFjAY
 cd2ZEj+hnUSL2PTRz9GndY+LvWclkFyY270bbJi03QaGRVovvWriSRiJK+FkhYK/Tz+N
 eMWoJpztwBuGKng1RkOkAoV7pHSFDLfIG4zYoAhJ0wEFpSvqXpFt2gen1p1VDX25oPW7
 d5NkOO8qI3Z6tWEj2stcCBDGNqP4YjFJo0U3gQKvQnqWMrIzGws4HNYrjl8Syu9Ob/KI
 H4U/MHxXYqq7fTuMctNc8Prhz1b59E51fz+WGWSITpve0YT21dReBbn5ivhXWgdSbNo2 uA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss7mesrjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 15:10:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37TFAVXa024018
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 15:10:31 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 29 Aug
 2023 08:10:30 -0700
Message-ID: <7fe1f725-9ca9-d407-d1af-2d31dc676fb0@quicinc.com>
Date: Tue, 29 Aug 2023 09:10:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 5/9] accel/ivpu: Move ivpu_fw_load() to ivpu_fw_init()
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230828094736.4137092-1-stanislaw.gruszka@linux.intel.com>
 <20230828094736.4137092-6-stanislaw.gruszka@linux.intel.com>
 <c1dcb25e-5a8a-9d25-deb5-81a81af16726@quicinc.com>
 <20230829111204.GB4086697@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230829111204.GB4086697@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Fm61RlSHfFuVjfwMTp893XP-nwod9C9q
X-Proofpoint-GUID: Fm61RlSHfFuVjfwMTp893XP-nwod9C9q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_13,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308290132
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/29/2023 5:12 AM, Stanislaw Gruszka wrote:
> Hi
> 
> On Mon, Aug 28, 2023 at 02:49:34PM -0600, Jeffrey Hugo wrote:
>> On 8/28/2023 3:47 AM, Stanislaw Gruszka wrote:
>>> diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
>>> index 8567fdf925fe..10ae2847f0ef 100644
>>> --- a/drivers/accel/ivpu/ivpu_fw.h
>>> +++ b/drivers/accel/ivpu/ivpu_fw.h
>>> @@ -31,7 +31,7 @@ struct ivpu_fw_info {
>>>    int ivpu_fw_init(struct ivpu_device *vdev);
>>>    void ivpu_fw_fini(struct ivpu_device *vdev);
>>> -int ivpu_fw_load(struct ivpu_device *vdev);
>>> +void ivpu_fw_load(struct ivpu_device *vdev);
>>
>> If ivpu_fw_load() is defined in ivpu_fw.c and only used in ivpu_fw.c, do you
>> need it in this header file anymore?  Seems like you could remove this, and
>> also make the function static.
> 
> The function is also used in ivpu_pm_prepare_cold_boot() from ivpu_pm.c

Ah.  Missed that.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
