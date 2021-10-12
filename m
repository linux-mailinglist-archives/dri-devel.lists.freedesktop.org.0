Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB23D42A385
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 13:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899D26E83B;
	Tue, 12 Oct 2021 11:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6D86E83B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 11:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1634038903; x=1665574903;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vhUkg9h0xV9ZvVTvkdqrzA9Qz3YC8T3rVvXz96y15vQ=;
 b=RRTwmqyFWvTt0IT8903LhGpFaxOMUtz1yLKG5TvhKF+tDKa555qn1dfU
 KXfgjTh0IGmv8aYexjw4SOpK2vOhVorBGpUBWJNnQiz5hSTXrs+zUhY49
 Y8fD2KB8iY6IyBDUqc9kzGSMOyCv2Rz2xQkgHGHFY7ojUhdttmGc6JDVz c=;
X-IronPort-AV: E=Sophos;i="5.85,367,1624320000"; d="scan'208";a="148529692"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-686c2610.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-6001.iad6.amazon.com with ESMTP; 12 Oct 2021 11:41:34 +0000
Received: from EX13D19EUB003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1a-686c2610.us-east-1.amazon.com (Postfix) with
 ESMTPS id 935D460EA7; Tue, 12 Oct 2021 11:41:30 +0000 (UTC)
Received: from [192.168.29.157] (10.43.160.241) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 12 Oct 2021 11:41:23 +0000
Message-ID: <50bd7a39-b5ed-c15e-096f-2823d22cc5cc@amazon.com>
Date: Tue, 12 Oct 2021 14:41:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [RFC PATCH 2/2] RDMA/efa: Add support for dmabuf memory regions
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Doug Ledford <dledford@redhat.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>, Oded Gabbay
 <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich
 <sleybo@amazon.com>, Alexander Matushevsky <matua@amazon.com>, Leon
 Romanovsky <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>,
 Firas Jahjah <firasj@amazon.com>
References: <20211007104301.76693-1-galpress@amazon.com>
 <20211007104301.76693-3-galpress@amazon.com>
 <20211007114018.GD2688930@ziepe.ca>
 <77082c57-29f8-1eba-b260-7cb658ec34d1@amazon.com>
 <20211011232839.GF2688930@ziepe.ca>
From: Gal Pressman <galpress@amazon.com>
In-Reply-To: <20211011232839.GF2688930@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.43.160.241]
X-ClientProxiedBy: EX13D47UWA001.ant.amazon.com (10.43.163.6) To
 EX13D19EUB003.ant.amazon.com (10.43.166.69)
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

On 12/10/2021 2:28, Jason Gunthorpe wrote:
> On Sun, Oct 10, 2021 at 09:55:49AM +0300, Gal Pressman wrote:
>> On 07/10/2021 14:40, Jason Gunthorpe wrote:
>>> On Thu, Oct 07, 2021 at 01:43:00PM +0300, Gal Pressman wrote:
>>>
>>>> @@ -1491,26 +1493,29 @@ static int efa_create_pbl(struct efa_dev *dev,
>>>>    return 0;
>>>>  }
>>>>
>>>> -struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
>>>> -                   u64 virt_addr, int access_flags,
>>>> -                   struct ib_udata *udata)
>>>> +static void efa_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
>>>> +{
>>>> +  WARN_ON_ONCE(1,
>>>> +               "Invalidate callback should not be called when memory is pinned\n");
>>>> +}
>>>> +
>>>> +static struct dma_buf_attach_ops efa_dmabuf_attach_ops = {
>>>> +  .allow_peer2peer = true,
>>>> +  .move_notify = efa_dmabuf_invalidate_cb,
>>>> +};
>>>
>>> Shouldn't move_notify really just be left as NULL? I mean fixing
>>> whatever is preventing that?
>>
>> That's what I had in the previous RFC and I think Christian didn't really like it.
> 
> Well, having drivers define a dummy function that only fails looks
> a lot worse to me. If not null then it should be a general
> 'dmabuf_unsupported_move_notify' shared function

Will do.

>>>> +  err = ib_umem_dmabuf_map_pages(umem_dmabuf);
>>>> +  if (err) {
>>>> +          ibdev_dbg(&dev->ibdev, "Failed to map dmabuf pages\n");
>>>> +          goto err_unpin;
>>>> +  }
>>>> +  dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
>>>
>>> If it is really this simple the core code should have this logic,
>>> 'ib_umem_dmabuf_get_pinned()' or something
>>
>> Should get_pinned do just get + dma_buf_pin, or should it do
>> ib_umem_dmabuf_map_pages as well?
> 
> Yes the map_pages too, a umem is supposed to be dma mapped after
> creation.

Will do, thanks Jason.
