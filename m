Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EAD46067D
	for <lists+dri-devel@lfdr.de>; Sun, 28 Nov 2021 14:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E658A6E044;
	Sun, 28 Nov 2021 13:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9906E044
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 13:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=z5cmO+w0Xv1Obso/iLfol1dI+hkAIwHqoz5lNKuJgZI=; b=P9whX+3qcnmMIQZQ1j9q62QIt4
 PgNyt1JwbMkxu6edw637P9L/GO0D94vqRuAr+MU16jB/oKm9uU0zODxVe6IP1fUjdW6couujR4kmm
 y3Fxfc6Kt9ToTQLLKE2nSOzIcr3v84pd4X2GSMQjvxybVxcbsv7Yr8ZyvRhM1cDhObakBsgkcfKHC
 24qrhCy6m4gAa6V55LTpOrPsvl7d4bMZXvE7FYNJqS7TlQyFf8k2qxnDb+dYi50xrXDLNrMd9fdGh
 gG2fo73GzaTP2AR0rPHa2N9ajr5IgbwuxQ4aTv1F/N0Nw/GiLAPyRP7GrkO/zwoxorX6wX89XjoDI
 YGYj6U+g==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mrKBo-0006ie-G7; Sun, 28 Nov 2021 14:25:56 +0100
Received: from [82.135.83.112] (helo=[192.168.178.20])
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mrKBo-000QTE-5M; Sun, 28 Nov 2021 14:25:56 +0100
Subject: Re: [PATCH 11/15] iio: buffer-dma: Boost performance using
 write-combine cache setting
To: Jonathan Cameron <jic23@kernel.org>, Paul Cercueil <paul@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-12-paul@crapouillou.net>
 <20211121150037.2a606be0@jic23-huawei> <8WNX2R.M4XE9MQC24W22@crapouillou.net>
 <YX153R.0PENWW3ING7F1@crapouillou.net> <20211127160533.5259f486@jic23-huawei>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <e46c6f2d-26d7-64d2-ebfc-ff6dc78aad2f@metafoo.de>
Date: Sun, 28 Nov 2021 14:25:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211127160533.5259f486@jic23-huawei>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26367/Sun Nov 28 10:19:58 2021)
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

On 11/27/21 5:05 PM, Jonathan Cameron wrote:
>> Non-coherent mapping with no cache sync:
>> - fileio:
>>      read:	156 MiB/s
>>      write:	123 MiB/s
>> - dmabuf:
>>      read:	234 MiB/s (capped by sample rate)
>>      write:	182 MiB/s
>>
>> Non-coherent reads with no cache sync + write-combine writes:
>> - fileio:
>>      read:	156 MiB/s
>>      write:	140 MiB/s
>> - dmabuf:
>>      read:	234 MiB/s (capped by sample rate)
>>      write:	210 MiB/s
>>
>>
>> A few things we can deduce from this:
>>
>> * Write-combine is not available on Zynq/ARM? If it was working, it
>> should give a better performance than the coherent mapping, but it
>> doesn't seem to do anything at all. At least it doesn't harm
>> performance.
> I'm not sure it's very relevant to this sort of streaming write.
> If you write a sequence of addresses then nothing stops them getting combined
> into a single write whether or not it is write-combining.

There is a difference at which point they can get combined. With 
write-combine they can be coalesced into a single transaction anywhere 
in the interconnect, as early as the CPU itself. Without write-cobmine 
the DDR controller might decide to combine them, but not earlier. This 
can make a difference especially if the write is a narrow write, i.e. 
the access size is smaller than the buswidth.

Lets say you do 32-bit writes, but your bus is 64 bits wide. With WC two 
32-bits can be combined into a 64-bit write. Without WC that is not 
possible and you are potentially not using the bus to its fullest 
capacity. This is especially true if the memory bus is wider than the 
widest access size of the CPU.


