Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3411764438F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 13:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AF610E328;
	Tue,  6 Dec 2022 12:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A7D10E31D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 12:56:09 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6C21If028261; Tue, 6 Dec 2022 12:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tH9ebQTUTGg5MhqISV0alVchqVg/SsibRHJIe86lDPI=;
 b=PjiIWcH5s8GcZNHOvZuo2sel6OmAXplsv6O8xSJWup5CPWYXDe0OPgWrRHIIFJSMfxYd
 Bht2QdhFNUitPIDm0HMwdOdkKlwhgpXRMgvhimYp3PVEP/s4YGI4p7pbTvhImPQZ00WV
 uY33WXmAFrK4RUjDtywSHRxdmQoF9uYMuVsuckJfemozo3WMRqjnva2ALAYoUAX0J+jD
 K8L93budHn3RLuxNdTskZa58YoTVs5TlYKP2iHmoTalEuXl/HoR5TwHJVs4FcPE/5n1Y
 RytQnae1/F502cZLw5Af1GnL2BzzQjEwNPXWjLH1EMrJsRhJogway4lbWnEUZrhRkRdy RQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m9e61kdan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 12:55:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B6CtuAN016224
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Dec 2022 12:55:56 GMT
Received: from [10.216.21.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 6 Dec 2022
 04:55:52 -0800
Message-ID: <866708a4-9f31-b5e5-fbda-10b2a6c948bf@quicinc.com>
Date: Tue, 6 Dec 2022 18:25:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Fix possible UAF in
 dma_buf_export
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 cuigaosheng <cuigaosheng1@huawei.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, "T.J. Mercier" <tjmercier@google.com>
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
 <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
 <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
 <CABdmKX1UMB0L0PmHB59nijReZef6LUQ3XKXitHZo2YnUrJTz9Q@mail.gmail.com>
 <2c9fa595-e788-5474-4f2b-ffbd08a70d13@amd.com>
 <CABdmKX0KJJV0iQwy0aUNXcLc1DGyLjmh6_Y53asHEoh-uyHzAA@mail.gmail.com>
 <83944425-c177-7918-bcde-9cf7296a613f@amd.com>
 <e12784da-b3e3-ddec-0e84-f968d60097c4@quicinc.com>
 <b2d5d904-99f2-7974-a22d-63a6cf864973@huawei.com>
 <689ad89b-0e34-3743-24c9-3f92856720f8@amd.com>
 <a87e407c-f858-28f1-c5ea-ca69b39db53a@huawei.com>
 <3de513b2-8ec3-2ff4-136d-0f56ac07c0ff@gmail.com>
From: Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <3de513b2-8ec3-2ff4-136d-0f56ac07c0ff@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: GQnB74ySEOxHXNZTF5sxudZXdkSM6bdB
X-Proofpoint-GUID: GQnB74ySEOxHXNZTF5sxudZXdkSM6bdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_08,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060104
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
Cc: Pavan Kondeti <quic_pkondeti@quicinc.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Christian/TJ for all your inputs!!

On 11/24/2022 6:25 PM, Christian König wrote:
>>> I was already wondering why the order is this way.
>>>
>>> Why is dma_buf_stats_setup() needing the file in the first place? 
>>
>> dmabuf->file will be used in dma_buf_stats_setup(), the
>> dma_buf_stats_setup() as follows:
>>
>>> 171 int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>> 172 {
>>> 173         struct dma_buf_sysfs_entry *sysfs_entry;
>>> 174         int ret;
>>> 175
>>> 176         if (!dmabuf || !dmabuf->file)
>>> 177                 return -EINVAL;
>>> 178
>>> 179         if (!dmabuf->exp_name) {
>>> 180                 pr_err("exporter name must not be empty if stats
>>> needed\n");
>>> 181                 return -EINVAL;
>>> 182         }
>>> 183
>>> 184         sysfs_entry = kzalloc(sizeof(struct dma_buf_sysfs_entry),
>>> GFP_KERNEL);
>>> 185         if (!sysfs_entry)
>>> 186                 return -ENOMEM;
>>> 187
>>> 188         sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
>>> 189         sysfs_entry->dmabuf = dmabuf;
>>> 190
>>> 191         dmabuf->sysfs_entry = sysfs_entry;
>>> 192
>>> 193         /* create the directory for buffer stats */
>>> 194         ret = kobject_init_and_add(&sysfs_entry->kobj,
>>> &dma_buf_ktype, NULL,
>>> 195                                    "%lu",
>>> file_inode(dmabuf->file)->i_ino);
> 
> Ah, so it uses the i_ino of the file for the sysfs unique name.
> 
> I'm going to take another look how to properly clean this up.
> 

How about deleting the dmabuf from the db_list directly in the error
path (which is usually done by the fput()) and then continue with the
normal fput() here.

Just compile tested the below code and If the logic make sense for you,
will send the final tested patch.
----------------------><---------------------------------------------

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e6f36c0..10a1727 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -87,19 +87,28 @@ static void dma_buf_release(struct dentry *dentry)
        kfree(dmabuf);
 }

-static int dma_buf_file_release(struct inode *inode, struct file *file)
+static void dma_buf_db_list_remove(struct file *file)
 {
        struct dma_buf *dmabuf;

-       if (!is_dma_buf_file(file))
-               return -EINVAL;
-
        dmabuf = file->private_data;
+       if (!dmabuf)
+               return;

        mutex_lock(&db_list.lock);
        list_del(&dmabuf->list_node);
        mutex_unlock(&db_list.lock);

+       file->private_data = NULL;
+}
+
+static int dma_buf_file_release(struct inode *inode, struct file *file)
+{
+       if (!is_dma_buf_file(file))
+               return -EINVAL;
+
+       dma_buf_db_list_remove(file);
+
        return 0;
 }

@@ -688,6 +697,8 @@ struct dma_buf *dma_buf_export(const struct
dma_buf_export_info *exp_info)
         * early before calling the release() dma_buf op.
         */
        file->f_path.dentry->d_fsdata = NULL;
+
+       dma_buf_db_list_remove(file);
        fput(file);
 err_dmabuf:
        kfree(dmabuf);

--------------------><-----------------------------


> Thanks for pointing this out,
> Christian.
