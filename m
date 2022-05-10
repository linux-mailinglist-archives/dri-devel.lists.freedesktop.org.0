Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D82C522216
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 19:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4A410E073;
	Tue, 10 May 2022 17:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DF610E073
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652202861; x=1683738861;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=83162g9zxtcfDjx2nWTNvvkXPY5uRoho8j7OS99ySF8=;
 b=aosI5TvhuLwLKBWFXyA4X3UGCFk83FMw9ffWM73KAL8BGTqZoH3XBNGu
 9KCMcsv4S8EKOs1AZ+NVVe+zVHcPAaeaDx4enE/4XN3D/I3Nsro9E0xG/
 B0XzgG3GX59VbgjDIm6wz6EagQbCSlHm+VcSL0pNlmZQ07w2CuBJSTt2i I=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 10 May 2022 10:14:20 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 10:14:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 10 May 2022 10:14:19 -0700
Received: from [10.216.42.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 10 May
 2022 10:14:14 -0700
Message-ID: <6dc59fa7-5885-9ed1-54c3-f2d112786312@quicinc.com>
Date: Tue, 10 May 2022 22:44:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2] dmabuf: ensure unique directory name for dmabuf stats
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>, <hridya@google.com>, 
 <daniel.vetter@ffwll.ch>, <tjmercier@google.com>
References: <1652191562-18700-1-git-send-email-quic_charante@quicinc.com>
 <4ac55be2-7d55-2c3b-0d5e-f61c02c62792@amd.com>
From: Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <4ac55be2-7d55-2c3b-0d5e-f61c02c62792@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/10/2022 8:42 PM, Christian König wrote:
>>    * The information in the interface can also be used to derive
>> per-exporter
>>    * statistics. The data from the interface can be gathered on error
>> conditions
>> @@ -172,6 +172,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>   {
>>       struct dma_buf_sysfs_entry *sysfs_entry;
>>       int ret;
>> +    static atomic64_t unique_id = ATOMIC_INIT(0);
> 
> Please move that to the beginning of the declarations.
> 

Done. Any scripts I can run at my end to catch these type of trivial
changes? checkpatch.pl didn't report this coding style.

>>         if (!dmabuf || !dmabuf->file)
>>           return -EINVAL;
>> @@ -192,7 +193,8 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>         /* create the directory for buffer stats */
>>       ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype,
>> NULL,
>> -                   "%lu", file_inode(dmabuf->file)->i_ino);
>> +                   "%lu-%lu", file_inode(dmabuf->file)->i_ino,
> 
> Why not just use the unique value here? Or is the inode number necessary
> for something?

This will ease the debugging a lot. Given the dump, I can easily map
which dmabuf buffer to the process. On the crashutilty I just have to
search for this inode in the files output, just one example.
