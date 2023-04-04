Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0C6D63DE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C25510E2EB;
	Tue,  4 Apr 2023 13:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1687 seconds by postgrey-1.36 at gabe;
 Tue, 04 Apr 2023 13:51:07 UTC
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56E910E2EB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=KS/PAoriGWh0QOffAFISIzaXM+OMfc5TD47VKbQqGh4=; b=TUkvrOCa+EQWog7XwVqSljA8HD
 qs2uTEGpr2nmASxWKFA1vB2Poh7nyFNj9w113QvxnlY4tvxhsqQrxoawdCD+od0ySVNeXsqFy4n/2
 xN6eIdhOYuaq2NIb+WxMh7ji1niYAtbXtxi2rwSnmoJoX6zYA4tUeYPjTDsB4DAA2WqtTUsd7Z2V3
 RzKDrAnDsG9wF57PofWXZXvYGQlwAQpuNtcQY9AVARJSbzI+L7nCHVRvUSPqc1UzD/ruTSJGDJu8+
 7iUzG8xnoqjZxlDbVFmxCRzWhp85EjGK/W0E2LUhIlWifeS/8ATIx7/eW3GFWoN6562CF6JaPr/rp
 EVd7tMug==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <lars@metafoo.de>)
 id 1pjgch-0008PQ-BV; Tue, 04 Apr 2023 15:22:55 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b]
 by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1pjgcg-0003TQ-Ou; Tue, 04 Apr 2023 15:22:54 +0200
Message-ID: <370bccc6-e418-a05f-2c3b-6a17b02392a2@metafoo.de>
Date: Tue, 4 Apr 2023 06:22:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 07/11] iio: core: Add new DMABUF interface
 infrastructure
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>, =?UTF-8?Q?Nuno_S=c3=a1?=
 <noname.nuno@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230403154800.215924-1-paul@crapouillou.net>
 <20230403154800.215924-8-paul@crapouillou.net>
 <798e1ff0651da8e4b113d30bf8cec2a7a0e6898f.camel@gmail.com>
 <2dac030470ffe74b6d21a1e6510afcefaf58cd6a.camel@crapouillou.net>
From: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <2dac030470ffe74b6d21a1e6510afcefaf58cd6a.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26865/Tue Apr  4 09:24:56 2023)
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
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/4/23 00:55, Paul Cercueil wrote:
> [...]
>>> +       priv = attach->importer_priv;
>>> +       list_del_init(&priv->entry);
>>> +
>>> +       iio_buffer_dmabuf_put(attach);
>>> +       iio_buffer_dmabuf_put(attach);
>>> +
>> Is this intended? Looks suspicious...
> It is intended, yes. You want to release the dma_buf_attachment that's
> created in iio_buffer_attach_dmabuf(), and you need to call
> iio_buffer_find_attachment() to get a pointer to it, which also gets a
> second reference - so it needs to unref twice.
Let's add a comment documenting that.
