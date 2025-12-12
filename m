Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C1DCB77EB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 02:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382FC10E2A9;
	Fri, 12 Dec 2025 01:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WCug7e/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC0510E299
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 01:02:01 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7b22ffa2a88so714065b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 17:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765501320; x=1766106120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PiqT1y0DQKTCKplE+X4RtztJVQKRqPD52kbRIZIB4Kc=;
 b=WCug7e/GhWYCq+DaFQI/QOAg2jyqWbQog7eG8yQy8cfM+oDM2Ywb+C1t5wPEw+0dNJ
 rDWWZTQimzXInB5OfCmrIBjtbP/XWaNFzQa9DlbJMdwh/oo6hx5/eASqKZ7M71q7081+
 dxA3dO6Lz+vYdJkkn5KfOZGM9wL4dTxlEYvrLYD38enchREWvV69PPH8WP0ZRDRAmhJd
 J+QlsrXqDKA7Biwa5VAiGnXB3P0qtJEBsjDFotbDv+yaw73gu4DrEM7cAvg0aS3Yf4xF
 6IhmRiuW+6EsYO/3eSJSwCqBrCWZoVBakQVxINWRq65+QmdA6ow1HYj5kht15lSmzS1+
 bSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765501321; x=1766106121;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PiqT1y0DQKTCKplE+X4RtztJVQKRqPD52kbRIZIB4Kc=;
 b=TdJ5DOf9VcSJeO+KdCfQG7cxH4M15Wtp3bYeU2TSDliuzSHDSCUvmtur+TO2K5cAki
 rxDynm4bVs9BJGmNQa9/t77PVMu/Gb+Y74cBXRQ0SsHH89a7o+EbJ3fqMJmrXlWzvgVI
 doLqS2kVNrBY2S0owY9Kkxs0zX93I6WAAVfH7AuT7wlaT+YBE7IlPWtCSA7/c8YRWhdx
 koYdjktR6mVYXUIsPnwJN0p0yirFV0pi5XJ4QQkpbQW90dI3BL+yspPNtjLML6yj4HNl
 GkuKZdXakS4UzSGrhAastdmZRWUzNKlzW7L4Zt//8CcO6O0P8TIz4ZnLUuxIkPijKhS4
 Pggw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTS5W28likF89REdXbTsrfpEHKlKkcrq5KylyVO+UjDh6TZBgMBECf5MSUUa9IhUXovPd7rmix5XM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yykz61cW+7/cSpvcn3QQJouZfbwn7pToy9o0Zy/G4YAetJMl5zR
 9xrKsGN2I+3hEsijqV0ZKsHLJyh5VfbTgomzU/sQyG0+Buq6FqjLS+Oz
X-Gm-Gg: AY/fxX4yE6JJ+9bTvcxC2UZtMvN5Nu7ktVedYQYpFeqzESs4jnjxJxiLzzjCMeJ65uc
 /AhWzs2N6KDvflmPm+LLnqwQFh2AglBW7VQMQ8QGf+D1lhl63u03EcGzeFBQbX14DcOiIDRTtTX
 WT6TNQ+3LBjiX7s9EsBcr5CJYCTuviAFnllh+NpST8DnOUPRbcN5KlFt2IPRgQTjqg9cVYE5UT5
 pCRpSniER+NV1LwdfaXhDBAKdtm4/XUnyUTh/ISWmV/GN/VgqI9hq4yUCdyxusA+ZROI25ERFxi
 Iwo2EUMhzGR5j4Bd/XF+GBq9PaFDlKBQY6auJ838cJdB8n97vaN12bi+8cqV/VwVRF9wYoQNatn
 +UR3jQGRb15xPMZOoDrvD1rHiHzbu1YRz5COO4SULGdwFPGBf67YQKMDv/SP+im0Xfi5VSn+7q+
 XxiSWMf08ebIi+r4LuvjW6qZve+JuZ27/3HRY7ZWL8kS4N06fFGsdawQ8YklsjEy8qEpPnS1DbP
 yPzd7P+peNAgmryiafPfsReIGKArWj/q0jJk4NGEU0ypA0nDf+5xS2zw7JAGw==
X-Google-Smtp-Source: AGHT+IG0+NAokoVmG4o76ltchxh72cgR5S6czK8w8NPqiA4lCkRSaBrc+e6H5PWtVLyiGmX8KUNYIA==
X-Received: by 2002:a05:6a20:1584:b0:35d:7f7:4aac with SMTP id
 adf61e73a8af0-369afa01e9emr370191637.47.1765501320420; 
 Thu, 11 Dec 2025 17:02:00 -0800 (PST)
Received: from [10.200.8.97] (fs98a57d9c.tkyc007.ap.nuro.jp. [152.165.125.156])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c0c2b9d8a2bsm3358325a12.27.2025.12.11.17.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 17:01:59 -0800 (PST)
Message-ID: <fb1abb05-ac8a-4130-a6a9-1a1089df441d@gmail.com>
Date: Fri, 12 Dec 2025 01:02:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 01/11] file: add callback for pre-mapping dmabuf
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
 <74d689540fa200fe37f1a930165357a92fe9e68c.1763725387.git.asml.silence@gmail.com>
 <aTFllxgsNCzGdzKB@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aTFllxgsNCzGdzKB@infradead.org>
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

On 12/4/25 10:42, Christoph Hellwig wrote:
> On Sun, Nov 23, 2025 at 10:51:21PM +0000, Pavel Begunkov wrote:
>> +static inline struct dma_token *
>> +dma_token_create(struct file *file, struct dma_token_params *params)
>> +{
>> +	struct dma_token *res;
>> +
>> +	if (!file->f_op->dma_map)
>> +		return ERR_PTR(-EOPNOTSUPP);
>> +	res = file->f_op->dma_map(file, params);
> 
> Calling the file operation ->dmap_map feels really misleading.

agreed

> create_token as in the function name is already much better, but
> it really is not just dma, but dmabuf related, and that should really
> be encoded in the name.
> 
> Also why not pass the dmabuf and direction directly instead of wrapping
> it in the odd params struct making the whole thing hard to follow?

I added it after I forgot about the direction and had to plumb
it through all the layers. In a draft of v3 I had I already
removed it as dmabuf is passed with the token to drivers.

-- 
Pavel Begunkov

