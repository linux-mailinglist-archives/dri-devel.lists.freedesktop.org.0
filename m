Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19C52F4616
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F556E095;
	Wed, 13 Jan 2021 08:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Tue, 12 Jan 2021 12:54:47 UTC
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692AB6E1F1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 12:54:47 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5ffd9ae90002>; Tue, 12 Jan 2021 04:49:45 -0800
Received: from [172.27.1.139] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Jan
 2021 12:49:37 +0000
Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>, Alex Deucher
 <alexdeucher@gmail.com>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
 <MW3PR11MB4555CCCDD42F1ADEC61F7ACAE5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20210111154245.GL504133@ziepe.ca>
 <MW3PR11MB4555953F638E8EDCD9F2CA90E5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <CADnq5_NTwynVt=ZPF-hiNFaWfEWiDnoTQCS0k1zx421=UAFSNA@mail.gmail.com>
 <MW3PR11MB455518915ED5AE1F2FF0CAB1E5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
From: Yishai Hadas <yishaih@nvidia.com>
Message-ID: <8aa96c52-f31f-b8d8-bf16-897775bd9c78@nvidia.com>
Date: Tue, 12 Jan 2021 14:49:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <MW3PR11MB455518915ED5AE1F2FF0CAB1E5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1610455785; bh=Kb5mhXf8+nPz3gANP9X6mGklYoy6MOrBECmhqgZmGjc=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=IfFZJwiMzlIbG2e23sgbOGF/6ahNHlaRyxw8IQQW6QM1USDmncOBcr971afXjpOlv
 kogItNoLz7bsYW4niTvSwJB7tnjt3TdsrW0yaoQo5i06GGlR/FVfKWokLsBLsDNVUW
 vHbF9zPQj22sCbDvu7g3CxASLkcWgORmXCDdsbyzOdxDXifmiZvCHpMwYr31ar3NsH
 rtxntJ9EVI/VLJCp3yyuCJMkmiEWtOZSvcD2jtT9mXPdRw69y1lQK5/lMn2qbmp7/8
 NNkjc642yDLLxyXlB6LecFH5BXLJyX5mpqGkiBOruhhuNCtAnqCw68qW93N6SYK0in
 tSAneGAAirkdg==
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug
 Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/11/2021 7:55 PM, Xiong, Jianxin wrote:
>> -----Original Message-----
>> From: Alex Deucher <alexdeucher@gmail.com>
>> Sent: Monday, January 11, 2021 9:47 AM
>> To: Xiong, Jianxin <jianxin.xiong@intel.com>
>> Cc: Jason Gunthorpe <jgg@ziepe.ca>; Leon Romanovsky <leon@kernel.org>; linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org;
>> Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>
>> Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
>>
>> On Mon, Jan 11, 2021 at 12:44 PM Xiong, Jianxin <jianxin.xiong@intel.com> wrote:
>>>> -----Original Message-----
>>>> From: Jason Gunthorpe <jgg@ziepe.ca>
>>>> Sent: Monday, January 11, 2021 7:43 AM
>>>> To: Xiong, Jianxin <jianxin.xiong@intel.com>
>>>> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org;
>>>> Doug Ledford <dledford@redhat.com>; Leon Romanovsky
>>>> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian
>>>> Koenig <christian.koenig@amd.com>; Vetter, Daniel
>>>> <daniel.vetter@intel.com>
>>>> Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
>>>>
>>>> On Mon, Jan 11, 2021 at 03:24:18PM +0000, Xiong, Jianxin wrote:
>>>>> Jason, will this series be able to get into 5.12?
>>>> I was going to ask you where things are after the break?
>>>>
>>>> Did everyone agree the userspace stuff is OK now? Is Edward OK with
>>>> the pyverbs changes, etc
>>>>
>>> There is no new comment on the both the kernel and userspace series. I
>>> assume silence means no objection. I will ask for opinions on the userspace thread.
>> Do you have a link to the userspace thread?
>>
> https://www.spinics.net/lists/linux-rdma/msg98135.html
>
Any reason why the 'fork' comment that was given few times wasn't not 
handled / answered ?

Specifically,

ibv_reg_dmabuf_mr() doesn't call ibv_dontfork_range() but ibv_dereg_mr 
does call its opposite API (i.e. ibv_dofork_range())

Yishai

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
