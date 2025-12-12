Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B512CB7969
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 02:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B464A10E319;
	Fri, 12 Dec 2025 01:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V9y0Hguv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4B210E319
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 01:56:11 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-298250d7769so5692895ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 17:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765504571; x=1766109371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZJsiZe/XqcKJjkVqYeKzXPFPwj1/tSmTc15CXhIwXUk=;
 b=V9y0Hguvl0bmYh1jX3r6xZVfVhGB65Qm09wGjph7QTAp9xLvHCHHK+yBQ1kD0UosCt
 cwjM03Ji5jBBO/gnKj5NtoEkFu+rHioiHVUKPivj7WdHR9FyNisiIGMVbxDpl2kJlO0i
 nKpu0DmxC7yl7Zm2bm+vshQiaLH7K/xBMQL8usG0Woy8vVrnQiKttY+hl7w7E+9Fz5vq
 B1z5bkwNcZm8L5VBHZdDBUZdw0mZELTR1Ha8uRTnQec22wODQGi7//v15K9WVm0/HhMy
 3Bp9IFb07Y8a9TXFsKQdicJNKYoquO3JuxRt4gtGyf9vwGrpQcbBQlrSkAvAvquvb2JZ
 Uz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765504571; x=1766109371;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZJsiZe/XqcKJjkVqYeKzXPFPwj1/tSmTc15CXhIwXUk=;
 b=kiP82kvgdHcuvexjhNioBuMc6zk335JsPkND+60Lq0lEx+SzI3Zi2F3LhZefjCqSOx
 XRiGRxkGOR2z/0eTxiV5dJYCav1i54eL6N7hz9R/EWHPHuyi6NElyHevx6LozURxmfKS
 FoG7CNdaNcXWqeKiryhTXlzPmOyjGqvpFtwG8S+qlWrg8qCuXEMNupGpI+8uNu5XSuMy
 wBjsSKlZ55xYUgdkophVeSgpXHU5NPZxb/QHhyfwNBY5ylMs69h7SopHencZgWwUUsIt
 nveLnXPhM46Do1gHU2Cbrqd7qhg0val9nDbIp5IH7x1tvPzL2u0cW3iFH1sZc+QEGMDl
 HBAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9ygOhbxN8hARuXB0Uy4AxdT8wjz6YaDl5EIe5f/Ov4DBo7zFBmbS04VJf5vcgcd6xxGreL27q+Ys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLgOf0H68c+tLbG6pscVhGq5sPPO0sLHrzEdX3OBchVyenqv9t
 PsMU//VMyQPLzoQ/UCeIS9R2HhQjJf76onTe2E6X/9rMazEfEDY51ufF
X-Gm-Gg: AY/fxX4KCvjVLCqsPyiD3/hfaPH47ZkTNNs4my/7SpS10S1ixMUDCskp2/xlBgt0Osz
 vDfMyQDJ5fvTmRXa5+bOXzAucmVyjxfNKLX0lMQzoIUOry6kFUTzwFFMXRmfUz/yfcVRRQDpPyE
 RQGM6Qw2CD38ZUjctNFrxRz5ux1UZpwrUuf9wElRi1H/+gvjQtYaH0jNj81N8/sk6VfgIJA3oFE
 PS0s3lVMMsE52ieRxrNftmPiFCPyfpb1ayiYVCxhfNQw0svLBTT3cmiUxkG0KseDE2QLxoHZOFI
 izPw2SuGn/tkEZbkNr7onu3afROvmTU5nDgjWPUIoaBN4HmtgaoAtkKCCZXeeBlKz3FGSlGrGzD
 rxqeHCrmtSJW+TrQy/BjZs4bixndBLMbNICFCESl9oJ1A6BqNKmbLe70ikWr/F+OpRuzpeuo/9m
 Za63Yf1sdhSryVlsIm/KrFBcR7VaguPZOuOhEDcHkW73IAS1cR0NepaflN6akKT0DuuOHbT5JG4
 ABICrItgXFYY+Nr8ZFgPAWlEGjO6PLyxBlK5/PAVJ5dTKlBnLM=
X-Google-Smtp-Source: AGHT+IHrNZHNZ799rRWGx+LvO7XaRwwtcVkWXSf4q+3pQ1pJSMCA4DafAXljIyZfD2BV+qpIbTHyew==
X-Received: by 2002:a17:902:d4c9:b0:29e:ba45:350e with SMTP id
 d9443c01a7336-29f23cd48c2mr6283765ad.44.1765504570758; 
 Thu, 11 Dec 2025 17:56:10 -0800 (PST)
Received: from [10.200.8.97] (fs98a57d9c.tkyc007.ap.nuro.jp. [152.165.125.156])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29eea016ac2sm36260535ad.49.2025.12.11.17.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 17:56:10 -0800 (PST)
Message-ID: <eb72c089-a6ba-48df-a215-af35d5dd808b@gmail.com>
Date: Fri, 12 Dec 2025 01:56:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 05/11] block: add infra to handle dmabuf tokens
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <cover.1763725387.git.asml.silence@gmail.com>
 <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>
 <aTFo-7ufbyZnEUzd@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aTFo-7ufbyZnEUzd@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 12/4/25 10:56, Christoph Hellwig wrote:
> On Sun, Nov 23, 2025 at 10:51:25PM +0000, Pavel Begunkov wrote:
...
>> +	struct request_queue *q = bdev_get_queue(file_bdev(file));
>> +
>> +	if (!(file->f_flags & O_DIRECT))
>> +		return ERR_PTR(-EINVAL);
> 
> Shouldn't the O_DIRECT check be in the caller?

If the interface will get implemented e.g. for net at some point, it
won't be O_DIRECT. If you want some extra safety for fs implementing
it, I can add sth like below in the common path:

if (reg_or_block_file(file))
	// check O_DIRECT

> And a high-level comment explaining the fencing logic would be nice
> as well.

I'll add some comments around

...
>> +static inline
>> +struct blk_mq_dma_map *blk_mq_get_token_map(struct blk_mq_dma_token *token)
> 
> Really odd return value / scope formatting.

static inline struct blk_mq_dma_map
*blk_mq_get_token_map(...)

Do you prefer this? It's too long to sanely fit it in
either way. Though I didn't have this problem in v3.

  
>> +{
>> +	struct blk_mq_dma_map *map;
>> +
>> +	guard(rcu)();
>> +
>> +	map = rcu_dereference(token->map);
>> +	if (unlikely(!map || !percpu_ref_tryget_live_rcu(&map->refs)))
>> +		return NULL;
>> +	return map;
> 
> Please use good old rcu_read_unlock to make this readable.

Come on, it's pretty readable and less error prone, especially
for longer functions. Maybe you prefer scoped guards?

scoped_guard(rcu) {
	map = token->map;
	if (!map)
		return;
}

...
>> +blk_status_t blk_rq_assign_dma_map(struct request *rq,
>> +				   struct blk_mq_dma_token *token)
>> +{
>> +	struct blk_mq_dma_map *map;
>> +
>> +	map = blk_mq_get_token_map(token);
>> +	if (map)
>> +		goto complete;
>> +
>> +	if (rq->cmd_flags & REQ_NOWAIT)
>> +		return BLK_STS_AGAIN;
>> +
>> +	map = blk_mq_create_dma_map(token);
>> +	if (IS_ERR(map))
>> +		return BLK_STS_RESOURCE;
> 
> Having a few comments, that say this is creating the map lazily
> would probably helper the reader.  Also why not keep the !map
> case in the branch, as the map case should be the fast path and
> thus usually be straight line in the function?
> 
>> +void blk_mq_dma_map_move_notify(struct blk_mq_dma_token *token)
>> +{
>> +	blk_mq_dma_map_remove(token);
>> +}
> 
> Is there a good reason for having this blk_mq_dma_map_move_notify
> wrapper?

I was reused it before and reusing in the next iteration, maybe
v2 wasn't for some reason.

> 
>> +	if (bio_flagged(bio, BIO_DMA_TOKEN)) {
>> +		struct blk_mq_dma_token *token;
>> +		blk_status_t ret;
>> +
>> +		token = dma_token_to_blk_mq(bio->dma_token);
>> +		ret = blk_rq_assign_dma_map(rq, token);
>> +		if (ret) {
>> +			if (ret == BLK_STS_AGAIN) {
>> +				bio_wouldblock_error(bio);
>> +			} else {
>> +				bio->bi_status = BLK_STS_RESOURCE;
>> +				bio_endio(bio);
>> +			}
>> +			goto queue_exit;
>> +		}
>> +	}
> 
> Any reason to not just keep the dma_token_to_blk_mq?  Also why is this
> overriding non-BLK_STS_AGAIN errors with BLK_STS_RESOURCE?

Yeah, it should've been errno_to_blk_status()

-- 
Pavel Begunkov

