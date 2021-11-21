Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021EF4584AC
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 17:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607286E53E;
	Sun, 21 Nov 2021 16:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E9B6E53E
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 16:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=oZVCnlPC3T6cEUOtCE9ILr/4ExEi3Cvw3mp4gMnNg/4=; b=Q+8ikT8LHTflCRifKN7/GdmmFu
 AjbGDFjvXhBwuj7G0SN3oOEl7CzyOJaxw3/NcsU4DV4aboW68kayZEtYcOFXbwvYwaD2HP+HkJjpp
 VznB5LMl2SuskGBaIUi8Qo55mJaihRRvyxAveX1yMWcyNSXmoLpX/HaZi7Q/vnaxtEGOC/FCv1OT0
 73052P+KU+aN/RkhrXeJYArqT4Z8/Fpwpx4fOTrMeF27eSJ9JV/0lY992WBqPpBdxhE1ZjdS4FgtI
 pHr/ZD0kIwY7YC02lhb1vi4+hk0hyVzvoFPV96E+gtn2DvysrOt5Vr3KrXgyXxwHvNlqk3qkqtXEx
 ln/6SXTg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mopcu-0008HE-57; Sun, 21 Nov 2021 17:23:36 +0100
Received: from [82.135.83.112] (helo=[192.168.178.20])
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mopct-000Qqa-T4; Sun, 21 Nov 2021 17:23:35 +0100
Subject: Re: [PATCH 01/15] iio: buffer-dma: Get rid of incoming/outgoing queues
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron <jic23@kernel.org>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-2-paul@crapouillou.net>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <e2689f0d-dc16-2519-57df-d98caadb07b0@metafoo.de>
Date: Sun, 21 Nov 2021 17:23:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115141925.60164-2-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26360/Sun Nov 21 10:19:26 2021)
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/15/21 3:19 PM, Paul Cercueil wrote:
> The buffer-dma code was using two queues, incoming and outgoing, to
> manage the state of the blocks in use.
>
> While this totally works, it adds some complexity to the code,
> especially since the code only manages 2 blocks. It is much easier to
> just check each block's state manually, and keep a counter for the next
> block to dequeue.
>
> Since the new DMABUF based API wouldn't use these incoming and outgoing
> queues anyway, getting rid of them now makes the upcoming changes
> simpler.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
The outgoing queue is going to be replaced by fences, but I think we 
need to keep the incoming queue.
> [...]
> @@ -442,28 +435,33 @@ EXPORT_SYMBOL_GPL(iio_dma_buffer_disable);
>   static void iio_dma_buffer_enqueue(struct iio_dma_buffer_queue *queue,
>   	struct iio_dma_buffer_block *block)
>   {
> -	if (block->state == IIO_BLOCK_STATE_DEAD) {
> +	if (block->state == IIO_BLOCK_STATE_DEAD)
>   		iio_buffer_block_put(block);
> -	} else if (queue->active) {
> +	else if (queue->active)
>   		iio_dma_buffer_submit_block(queue, block);
> -	} else {
> +	else
>   		block->state = IIO_BLOCK_STATE_QUEUED;
> -		list_add_tail(&block->head, &queue->incoming);
If iio_dma_buffer_enqueue() is called with a dmabuf and the buffer is 
not active, it will be marked as queued, but we don't actually keep a 
reference to it anywhere. It will never be submitted to the DMA, and it 
will never be signaled as completed.

