Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C02B72DA8F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478DE10E32F;
	Tue, 13 Jun 2023 07:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E84910E234
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 13:03:19 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35CCUVEL030059; Mon, 12 Jun 2023 13:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vwUQ1F8I7JI/UaeWgCAqXrFbc20JHeM5AvHArrbGZns=;
 b=G6ua1Gn9MbO7FPY+XSeGpjItS1FFYvAY0JwZYk1Uiz/KAgD+xkH4m7U8pwqrdL37oyex
 7TZdggKYfXNzWeA2MDyCWykL95+zxUR89pNu4OGnk4jVnVK+nH9rjJUmj55OTHOcphJT
 dOPFqY/Pp8hRXz4zgbOqQA+oAHP4bjcttkDOmNrE+CAkfUCPh4AOsXe9E65w2LopWTTf
 YqQzadC33GUZF6tsXq37njVCMe6Hyj+hBeY5EmDlt29zKG27sdlJQyUZp/tlnTYuzxgd
 T+gQCi9Y69hRp7ndog5L4cG+9oKWIWmV6HgTHHHNlMgyS3PWvivDVnLdbP5NDyKh0Wd9 xQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r4hd8bcah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 13:03:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35CD3ArR004276
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 13:03:10 GMT
Received: from [10.50.37.200] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 12 Jun
 2023 06:03:07 -0700
Message-ID: <e3a867a8-284b-7250-b1b2-1956f533f6b0@quicinc.com>
Date: Mon, 12 Jun 2023 18:33:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] accel/qaic: Fix dereferencing freed memory
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "Sukrut
 Bellary" <sukrut.bellary@linux.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20230610021200.377452-1-sukrut.bellary@linux.com>
 <fc979a4e-c30a-2606-9eec-afbba4fdd774@amd.com>
From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <fc979a4e-c30a-2606-9eec-afbba4fdd774@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: SeHIjpfi9M7u3H3WwjT4NY5sa6NN1EoZ
X-Proofpoint-GUID: SeHIjpfi9M7u3H3WwjT4NY5sa6NN1EoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_06,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306120112
X-Mailman-Approved-At: Tue, 13 Jun 2023 07:14:01 +0000
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/12/2023 4:52 PM, Christian König wrote:
> 
> 
> Am 10.06.23 um 04:12 schrieb Sukrut Bellary:
>> smatch warning:
>>     drivers/accel/qaic/qaic_data.c:620 qaic_free_object() error:
>>         dereferencing freed memory 'obj->import_attach'
>>
>> obj->import_attach is detached and freed using dma_buf_detach().
>> But used after free to decrease the dmabuf ref count using
>> dma_buf_put().
>>
>> Fixes: ff13be830333 ("accel/qaic: Add datapath")
>> Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
>> ---
>>   drivers/accel/qaic/qaic_data.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/qaic/qaic_data.c 
>> b/drivers/accel/qaic/qaic_data.c
>> index e42c1f9ffff8..7cba4d680ea8 100644
>> --- a/drivers/accel/qaic/qaic_data.c
>> +++ b/drivers/accel/qaic/qaic_data.c
>> @@ -613,11 +613,13 @@ static int qaic_gem_object_mmap(struct 
>> drm_gem_object *obj, struct vm_area_struc
>>   static void qaic_free_object(struct drm_gem_object *obj)
>>   {
>>       struct qaic_bo *bo = to_qaic_bo(obj);
>> +    struct dma_buf *dmabuf;
> 
> Maybe move that variable into the if.
> 
>>       if (obj->import_attach) {
>>           /* DMABUF/PRIME Path */
>> +        dmabuf = obj->import_attach->dmabuf;
>>           dma_buf_detach(obj->import_attach->dmabuf, obj->import_attach);
>> -        dma_buf_put(obj->import_attach->dmabuf);
>> +        dma_buf_put(dmabuf);
> 
> I strongly assume you are not using the GEM prime helpers for this?
> 
> Christian.

Driver uses drm_gem_prime_fd_to_handle() helper function but it also 
registers for ->gem_prime_import() which is internally called by 
drm_gem_prime_fd_to_handle(). All the operations done in 
gem_prime_import() are undone here.

> 
>>       } else {
>>           /* Private buffer allocation path */
>>           qaic_free_sgt(bo->sgt);
> 
