Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B363427F6C
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 08:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533CF6E226;
	Sun, 10 Oct 2021 06:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB6C6E226
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 06:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1633848974; x=1665384974;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=etwVVuZuUkG6awoP/rSKVgKfSupqLMPX6Kk+2INZpPM=;
 b=YvJ+G/A2iOKooM6VzyoTJX0ZNMwGBEBIAGAkFVa4C7VO5d/30L7AKgXM
 DiUxj9hFVJwzhocK1BpNgxVrpzNP0JMYWBJMDywkZz9Bylk0KfSrJuZ3l
 45XpHOQqS5dLepfWrKh0O5DZfTjAVKXNIb5pM+oynamOjpLz7TcaZUxm5 8=;
X-IronPort-AV: E=Sophos;i="5.85,362,1624320000"; d="scan'208";a="143534706"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-a264e6fe.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 10 Oct 2021 06:56:04 +0000
Received: from EX13D19EUB003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2c-a264e6fe.us-west-2.amazon.com (Postfix) with
 ESMTPS id 6F91441EDB; Sun, 10 Oct 2021 06:56:03 +0000 (UTC)
Received: from [192.168.22.40] (10.43.160.215) by EX13D19EUB003.ant.amazon.com
 (10.43.166.69) with Microsoft SMTP Server (TLS) id 15.0.1497.23;
 Sun, 10 Oct 2021 06:55:55 +0000
Message-ID: <77082c57-29f8-1eba-b260-7cb658ec34d1@amazon.com>
Date: Sun, 10 Oct 2021 09:55:49 +0300
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
From: Gal Pressman <galpress@amazon.com>
In-Reply-To: <20211007114018.GD2688930@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.43.160.215]
X-ClientProxiedBy: EX13D39UWB004.ant.amazon.com (10.43.161.148) To
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

On 07/10/2021 14:40, Jason Gunthorpe wrote:
> On Thu, Oct 07, 2021 at 01:43:00PM +0300, Gal Pressman wrote:
> 
>> @@ -1491,26 +1493,29 @@ static int efa_create_pbl(struct efa_dev *dev,
>>  	return 0;
>>  }
>>  
>> -struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
>> -			 u64 virt_addr, int access_flags,
>> -			 struct ib_udata *udata)
>> +static void efa_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
>> +{
>> +	WARN_ON_ONCE(1,
>> +		     "Invalidate callback should not be called when memory is pinned\n");
>> +}
>> +
>> +static struct dma_buf_attach_ops efa_dmabuf_attach_ops = {
>> +	.allow_peer2peer = true,
>> +	.move_notify = efa_dmabuf_invalidate_cb,
>> +};
> 
> Shouldn't move_notify really just be left as NULL? I mean fixing
> whatever is preventing that?

That's what I had in the previous RFC and I think Christian didn't really like it.

>> +struct ib_mr *efa_reg_user_mr_dmabuf(struct ib_pd *ibpd, u64 start,
>> +				     u64 length, u64 virt_addr,
>> +				     int fd, int access_flags,
>> +				     struct ib_udata *udata)
>> +{
>> +	struct efa_dev *dev = to_edev(ibpd->device);
>> +	struct ib_umem_dmabuf *umem_dmabuf;
>> +	struct efa_mr *mr;
>> +	int err;
>> +
>> +	mr = efa_alloc_mr(ibpd, access_flags, udata);
>> +	if (IS_ERR(mr)) {
>> +		err = PTR_ERR(mr);
>> +		goto err_out;
>> +	}
>> +
>> +	umem_dmabuf = ib_umem_dmabuf_get(ibpd->device, start, length, fd,
>> +					 access_flags, &efa_dmabuf_attach_ops);
>> +	if (IS_ERR(umem_dmabuf)) {
>> +		ibdev_dbg(&dev->ibdev, "Failed to get dmabuf[%d]\n", err);
>> +		err = PTR_ERR(umem_dmabuf);
>> +		goto err_free;
>> +	}
>> +
>> +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
>> +	err = dma_buf_pin(umem_dmabuf->attach);
>> +	if (err) {
>> +		ibdev_dbg(&dev->ibdev, "Failed to pin dmabuf memory\n");
>> +		goto err_release;
>> +	}
>> +
>> +	err = ib_umem_dmabuf_map_pages(umem_dmabuf);
>> +	if (err) {
>> +		ibdev_dbg(&dev->ibdev, "Failed to map dmabuf pages\n");
>> +		goto err_unpin;
>> +	}
>> +	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
> 
> If it is really this simple the core code should have this logic,
> 'ib_umem_dmabuf_get_pinned()' or something

Should get_pinned do just get + dma_buf_pin, or should it do
ib_umem_dmabuf_map_pages as well?
