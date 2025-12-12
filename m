Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54CECB9BA8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 21:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0428010E95D;
	Fri, 12 Dec 2025 20:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="dKPDXOLt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A56C10E95C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 20:10:55 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-29845b06dd2so19484185ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 12:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1765570255; x=1766175055;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gsVed5WgXtZPXSfJ2PXjLRbNCmFwRAyF31OH8siBSJw=;
 b=dKPDXOLtCdMTVzEATp1XhDwWt+h0zxzxlEk09SpMR4zI44kpnEephSPbJ1lxdAyo3X
 nrRT1HxB4bfEuluqMuesfyvMz/aGXyRsBlxjGjw/czBnyEEodOYxUzBGkMJzn7GYMdrC
 Q29h0wNZY7HEVjYfqDIGn2geG16Fu2/a99sIdrfHGGxsUL7PW+e8RkAXabJKzZIa8OR9
 3UuKqsL5RUjNfwmtQVj9k8ZjKL/sLhyz9jJnBIwyvtq9DfibWaw5fLH517XF1MkhJXeP
 /0S+a2wYRzCbawZwnY/ShFF9naQ2LVtkD2ACJKIjJDjYqCzebjUFUdVTkqzbo8uUkmdH
 6jNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765570255; x=1766175055;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gsVed5WgXtZPXSfJ2PXjLRbNCmFwRAyF31OH8siBSJw=;
 b=GJgS/SA5WM+i2303+2uES16f2OYsIsqs+9GyWHyGle35NlreZrhqFCRk9kFiJ8C7XI
 doClsqgVFLC7ZhoMuWlkunftojlIyz/diKcK9S2UiremnM9mixUY7XOq6HMQg1hsIFRk
 nXbLJERyiXrgtBT79/fC8MLPJW2cLCgTox5/iQijLTN35jCjBFR0Ugop6m4tOUH0RILO
 4tV2VFJFVPoDtOMPghgVxTGmjSV9Fe5ntkXwGaNSkue+A78XW+ao8NwBfPts8s9r3YMS
 nwXB8ShGvy8H7vJfL0+6JDlL1jqqAsMY7+8K2dw6sZdymuOGsBZrZyAZ3stZ6En+pcYc
 n43A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8z29iB53cxpTyHi8M3ZoH6ef9A45QBH4FpwuCimhouCB3lUt5XGOEgmQllo1RvazVd/FyMtWr+fk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6pfRMafXbftYcWd3FlQ6EHG1AF61PsQ1EE9lpGfPorTJUCO7K
 y6UhPAjzZpiIn4jpy1za/2Z1waV2qGmgt6PuszIWYOlUUI+yNfak21KEk4KfTCDDZ+o=
X-Gm-Gg: AY/fxX4eeR171wuTbFzZo+7ad7v7Wgb4ZIaAGZrj0cqPV7bOSwJL4JOcvvGeE8mpf6u
 tfSMCfWdf/BbO52Svav1FDghZ0rd+by8M0cKfhy1+JmtutyUyhzikVNzMPYr/a9/ftQ7fcp3ed7
 J6l0PyTDu2nhQ7cesBh5dTHuhB2CA88erD0TsQe04o0k0jL19hv58O4fjDr43ndhR/+qfejC+/d
 HfRzL6b49g1HVUPcWV3JN3qZLiQ0cEX44N1Ii1qqwFhz4IZ357bioBU9P+e0tVeiPkyv0SNqkbk
 gtZtZT5zM1n+cZTab19mZAbLD8ceWlrAtT6m2BDWaPeBj48vVsA3pUfgWwG93G/SaSJYa2i33YI
 W9mr/kry6HYuqLO3TcuMBOhJJrGaxNPloTCQ0Lhpb1jicxjlAyig4p53DiDtNiJ8Tv4LVT/3TQi
 W2pW8/LoAjcpOW38AtGBpXeXsQ32bneb22yy2ryKPirvFB9fvR/w==
X-Google-Smtp-Source: AGHT+IH4YKlBbDeLqTy95z05gm75S6dqOblA2F2FrB859WtV1ZEekn7/gpBPyoL8TMFo+3JpfAzaQQ==
X-Received: by 2002:a17:902:f688:b0:29f:29a8:608b with SMTP id
 d9443c01a7336-29f29a861cemr19807075ad.13.1765570255065; 
 Fri, 12 Dec 2025 12:10:55 -0800 (PST)
Received: from [172.20.4.188] (221x255x142x61.ap221.ftth.ucom.ne.jp.
 [221.255.142.61]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29ee9d38c7fsm62825655ad.39.2025.12.12.12.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Dec 2025 12:10:54 -0800 (PST)
Message-ID: <2729b31b-ba58-4f32-b71a-75bd07524ac8@kernel.dk>
Date: Fri, 12 Dec 2025 13:10:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 03/11] block: move around bio flagging helpers
To: Pavel Begunkov <asml.silence@gmail.com>,
 Christoph Hellwig <hch@infradead.org>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 tushar.gohad@intel.com, Keith Busch <kbusch@kernel.org>,
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
 <6cb3193d3249ab5ca54e8aecbfc24086db09b753.1763725387.git.asml.silence@gmail.com>
 <aTFl290ou0_RIT6-@infradead.org>
 <4ed581b6-af0f-49e6-8782-63f85e02503c@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <4ed581b6-af0f-49e6-8782-63f85e02503c@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 12/11/25 6:08 PM, Pavel Begunkov wrote:
> On 12/4/25 10:43, Christoph Hellwig wrote:
>> On Sun, Nov 23, 2025 at 10:51:23PM +0000, Pavel Begunkov wrote:
>>> We'll need bio_flagged() earlier in bio.h in the next patch, move it
>>> together with all related helpers, and mark the bio_flagged()'s bio
>>> argument as const.
>>>
>>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
>>
>> Looks good:
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>
>> Maybe ask Jens to queue it up ASAP to get it out of the way?
> 
> I was away, so a bit late for that. I definitely wouldn't
> mind if Jens pulls it in, but for a separate patch I'd need
> to justify it, and I don't think it brings anything
> meaningful in itself.

I like getting prep stuff like that out of the way, and honestly the
patch makes sense on its own anyway as it's always nicer to have related
code closer together.

-- 
Jens Axboe
