Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64F79018FA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 02:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B734510E155;
	Mon, 10 Jun 2024 00:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="Up0G3plG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA0710E155
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 00:37:36 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1f717b3f2d8so1439525ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2024 17:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1717979855; x=1718584655;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hS7n98TDY72tf1Gt3gpPTHvSO7f4fNN8VMGdhY9nX8c=;
 b=Up0G3plGpECdWMXcY6AmyfMGlDDphE2t78vihulf6fVVrPHr2hU4/4UjhYNPYANqCF
 9nzzAZSJUZxs9UF3N5DCH8unouU8h2MCk3VWkY/JuUdF+wx0RQb6lBRavDzsEWzmdCJW
 Jl8+P8+Y/BQJQglZ8UM1OwUCFUASanw1wg1htdJziTcwNLuTUvU4eA7yeKiZaaddnQo2
 RR0G7ZlRVq+qoDRGvXTsf3tXZC+/DOH7gFF19aVIk1oCBpkkA7E4F/MnPYTKwkvV9cFC
 hEf6w33z778K9dDwmBapU7vxtW2hzJ5Yt10JFlWHIib4hwUdQSpPftDartvhu31fXmcV
 N+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717979855; x=1718584655;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hS7n98TDY72tf1Gt3gpPTHvSO7f4fNN8VMGdhY9nX8c=;
 b=KTLm88PFPbOitKSkaANLSx/k9Xf/Syz3WPZx/MHn4g/FpLzaq3m/njvl/qJLLoc78O
 JJFd3kRyf+kPIkmZaMnV53Udk1tIbYpG2tp3Ys3iPynlWfg/Y0GS1S5fhVSYKE1+lTmK
 wIwN6nc9PLRE32coBy48narT4Zduvk5jGSFRq9MAqiFdrHXKcUAmOcjqTIGJnvqt8OnC
 UXe022tjE7wqXDTYQyKJJLyuCHPaNloIIsAmPwWw7xXWYPy9UlE57bzjOt82JAVbxt4F
 Xh0jbNJqqjnbe/Km/LaOcTr2onoeKG7fKNflVj+cHIdDmLM0ejOB0wVAnyVcJZZAkwW7
 8CrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9FejW462Cp2Q94mNuGP10rfYfZyyuEg5PSnHWsHNueHQLKujOl0bli4g6zIlbw0jMszh5kBEZbjcarmFGIOofRZ/vGuSnoonEEb0u79Rs
X-Gm-Message-State: AOJu0YwArY+2NuGiU7WwV/qPgU0FFjhZYldgavQRV03MCEJ8UUIJP8E8
 tQatQYtZXd6GxQZiOkdNfdpUONjAfuXu5HAdrkNnnjtOwk+Pi1cQ2D/obIby/YU=
X-Google-Smtp-Source: AGHT+IF/jQhCZx2Abw7DSxRG+gkk1EZNGK2154m819MXP2LbgwzefTTWrobn4NY5q6T/kzn7SpSdLA==
X-Received: by 2002:a17:903:32c6:b0:1f7:18cf:a70f with SMTP id
 d9443c01a7336-1f718cfab0amr8620855ad.34.1717979855488; 
 Sun, 09 Jun 2024 17:37:35 -0700 (PDT)
Received: from [192.168.1.8] (174-21-189-109.tukw.qwest.net. [174.21.189.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6bd76c240sm71665825ad.89.2024.06.09.17.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jun 2024 17:37:35 -0700 (PDT)
Message-ID: <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
Date: Sun, 9 Jun 2024 17:37:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
Content-Language: en-GB
To: Jason Gunthorpe <jgg@ziepe.ca>, David Ahern <dsahern@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Mina Almasry <almasrymina@google.com>, Christoph Hellwig
 <hch@infradead.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240607145247.GG791043@ziepe.ca>
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

On 2024-06-07 17:52, Jason Gunthorpe wrote:
> IMHO it seems to compose poorly if you can only use the io_uring
> lifecycle model with io_uring registered memory, and not with DMABUF
> memory registered through Mina's mechanism.

By this, do you mean io_uring must be exclusively used to use this
feature?

And you'd rather see the two decoupled, so userspace can register w/ say
dmabuf then pass it to io_uring?

> 
> Jason
