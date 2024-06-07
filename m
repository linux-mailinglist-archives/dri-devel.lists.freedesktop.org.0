Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4035A90055A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 15:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB9D10EC4F;
	Fri,  7 Jun 2024 13:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Urp9Jopz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B11910EC4F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 13:45:55 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-57c60b13a56so434378a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717767953; x=1718372753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F/r/t9G5Ibm8rqPv9khaLM6u/j/EOl3KKmdgoUFwllc=;
 b=Urp9Jopzc6XXjT4xaNYmzf9I9mv4Q/eFurAg/4bfhsKPewEUEaToVBzcHFRhXBntKV
 7JbKMg9uxcdnvvgAAx4WsNgI+s8cZtMJfs9nCAtLivh1KjKgmnY9L4LJM1KwvuUNrAg6
 dKpXiLIBG3wxy2kwzjarwV73eSWxdpnyp7cXCMfPxWLhVpB26f39ocZt0CRJHweEIBTj
 VM4bzoQH/ixU4E5be5cTWIkf+M+IYwX6OyPPup659BxYgblamv2uw3v6+moWaFuFxaCF
 D+ghGzo48hotHmS9MbafaXRVo9caFOeSDfMmU77s+4fB3APkQPhlQfhtfQcFd2vu0zN2
 aspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717767953; x=1718372753;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F/r/t9G5Ibm8rqPv9khaLM6u/j/EOl3KKmdgoUFwllc=;
 b=UQU2WDhyrtFtDPlmFS+BykmomOgr6zQ6bSplYP+tPlUufDGPdVLk3WnhixjU6n8zr3
 7F2KnCxypmpcy0gW/eoPsIuOGIOxeLu8fQN06s2Yh8RVjn0Ffr+v5Fb0Ho7GCWLA6Uth
 zaJNfyoE4povI3aNir+PNG47FVNPmvMAtXB69z36lUCARAoUaJsIRZCcnn4BfNk7ZLUE
 ALb2PVOCLr1cD4lAg6LXHcEmC1NnMrFVcHzpYtXqWCSRhjjdt6/Ey6eIrm7Sot2hVm7V
 rwjKV6y1ShiaEUzVleZ11wwXFHgmbv6QXVI8t6MEYE9H2GllyzEEAH9YTRwsHZhdlnvp
 faGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6X4GrINpx69KHlaJN3GVthanyLsjhmINAxko2xalcQW5tieDgTirZ6W8IojsjOwWNL2ntrc+8MfATy7K9Eg7e9uQuuVhcQUKZxvN2e0tl
X-Gm-Message-State: AOJu0Yxdl999hZYNg91GLDIJuMiIukPIzy57092fYiM9hT3m3KsbBIkL
 ueTffO0dJf0JH1oCElhVySBRNWAlGeeovfK7Xwo+QlJCzwl0sWLE
X-Google-Smtp-Source: AGHT+IFVOACJ8jhSl4BQSkTV7VPNec/iQ97B361R1DBH0V33lAwuXw0dKze57MI6+rDcTkZyQ3kqqw==
X-Received: by 2002:a50:bac6:0:b0:57a:4c22:bd with SMTP id
 4fb4d7f45d1cf-57c508292e9mr1554431a12.7.1717767953444; 
 Fri, 07 Jun 2024 06:45:53 -0700 (PDT)
Received: from [192.168.42.51] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aae1412absm2766177a12.57.2024.06.07.06.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 06:45:53 -0700 (PDT)
Message-ID: <ee9a55cd-7541-4865-ab2a-9e860b88c9e4@gmail.com>
Date: Fri, 7 Jun 2024 14:45:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
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
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <ZmAgszZpSrcdHtyl@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <ZmAgszZpSrcdHtyl@infradead.org>
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

On 6/5/24 09:24, Christoph Hellwig wrote:
> On Mon, Jun 03, 2024 at 03:52:32PM +0100, Pavel Begunkov wrote:
>> The question for Christoph is what exactly is the objection here? Why we
>> would not be using well defined ops when we know there will be more
>> users?
> 
> The point is that there should be no more users.  If you need another

Does that "No more" stops after devmem tcp? Or after io_uring
proposal? For the latter I explained why io_uring has to do it
for good design and that's it's not even related to the memory
type used.

> case you are doing something very wrong.

That's not a very illuminating answer

-- 
Pavel Begunkov
