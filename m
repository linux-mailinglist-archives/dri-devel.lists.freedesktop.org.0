Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1D6637937
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 13:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5449310E0EC;
	Thu, 24 Nov 2022 12:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88D510E0EC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 12:49:25 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NHyQG11FkzqSPQ;
 Thu, 24 Nov 2022 20:45:26 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 20:49:22 +0800
Subject: Re: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Charan Teja
 Kalla <quic_charante@quicinc.com>, "T.J. Mercier" <tjmercier@google.com>
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
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <a87e407c-f858-28f1-c5ea-ca69b39db53a@huawei.com>
Date: Thu, 24 Nov 2022 20:49:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <689ad89b-0e34-3743-24c9-3f92856720f8@amd.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
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

> I was already wondering why the order is this way.
>
> Why is dma_buf_stats_setup() needing the file in the first place? 

dmabuf->file will be used in dma_buf_stats_setup(), the 
dma_buf_stats_setup() as follows:

> 171 int dma_buf_stats_setup(struct dma_buf *dmabuf)
> 172 {
> 173         struct dma_buf_sysfs_entry *sysfs_entry;
> 174         int ret;
> 175
> 176         if (!dmabuf || !dmabuf->file)
> 177                 return -EINVAL;
> 178
> 179         if (!dmabuf->exp_name) {
> 180                 pr_err("exporter name must not be empty if stats 
> needed\n");
> 181                 return -EINVAL;
> 182         }
> 183
> 184         sysfs_entry = kzalloc(sizeof(struct dma_buf_sysfs_entry), 
> GFP_KERNEL);
> 185         if (!sysfs_entry)
> 186                 return -ENOMEM;
> 187
> 188         sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
> 189         sysfs_entry->dmabuf = dmabuf;
> 190
> 191         dmabuf->sysfs_entry = sysfs_entry;
> 192
> 193         /* create the directory for buffer stats */
> 194         ret = kobject_init_and_add(&sysfs_entry->kobj, 
> &dma_buf_ktype, NULL,
> 195                                    "%lu", 
> file_inode(dmabuf->file)->i_ino);
> 196         if (ret)
> 197                 goto err_sysfs_dmabuf;
> 198
> 199         return 0;
> 200
> 201 err_sysfs_dmabuf:
> 202         kobject_put(&sysfs_entry->kobj);
> 203         dmabuf->sysfs_entry = NULL;
> 204         return ret;
> 205 }
Did I miss something?

Thanks.

On 2022/11/24 20:37, Christian König wrote:
>
>
> Am 24.11.22 um 13:05 schrieb cuigaosheng:
>> Some tips:
>>     Before we call the dma_buf_stats_setup(), we have to finish 
>> creating the file,
>> otherwise dma_buf_stats_setup() will return -EINVAL, maybe we need to 
>> think about
>> this when making a new patch.
>
> I was already wondering why the order is this way.
>
> Why is dma_buf_stats_setup() needing the file in the first place?
>
> Thanks,
> Christian.
>
>>
>> Hope these tips are useful, thanks!
>>
>> On 2022/11/24 13:56, Charan Teja Kalla wrote:
>>> Thanks T.J and Christian for the inputs.
>>>
>>> On 11/19/2022 7:00 PM, Christian König wrote:
>>>>>      Yes, exactly that's the idea.
>>>>>
>>>>>      The only alternatives I can see would be to either move 
>>>>> allocating
>>>>>      the
>>>>>      file and so completing the dma_buf initialization last again 
>>>>> or just
>>>>>      ignore errors from sysfs.
>>>>>
>>>>>      > If we still want to avoid calling 
>>>>> dmabuf->ops->release(dmabuf) in
>>>>>      > dma_buf_release like the comment says I guess we could use
>>>>>      sysfs_entry
>>>>>      > and ERR_PTR to flag that, otherwise it looks like we'd need 
>>>>> a bit
>>>>>      > somewhere.
>>>>>
>>>>>      No, this should be dropped as far as I can see. The sysfs 
>>>>> cleanup
>>>>>      code
>>>>>      looks like it can handle not initialized kobj pointers.
>>>>>
>>>>>
>>>>> Yeah there is also the null check in dma_buf_stats_teardown() that
>>>>> would prevent it from running, but I understood the comment to be
>>>>> referring to the release() dma_buf_ops call into the exporter which
>>>>> comes right after the teardown call. That looks like it's preventing
>>>>> the fput task work calling back into the exporter after the exporter
>>>>> already got an error from dma_buf_export(). Otherwise the exporter
>>>>> sees a release() for a buffer that it doesn't know about / thinks
>>>>> shouldn't exist. So I could imagine an exporter trying to double 
>>>>> free:
>>>>> once for the failed dma_buf_export() call, and again when the
>>>>> release() op is called later.
>>>>
>>>> Oh, very good point as well. Yeah, then creating the file should
>>>> probably come last.
>>>>
>>> @Gaosheng: Could you please make these changes or you let me to do?
>>>
>>>> Regards,
>>>> Christian.
>>> .
>
> .
