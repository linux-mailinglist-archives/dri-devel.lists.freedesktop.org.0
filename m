Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115BC8BEA55
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 19:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084AA10E243;
	Tue,  7 May 2024 17:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="JCPKVvFi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1720A10E243
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 17:19:52 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-34aa836b948so814060f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 10:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715102391; x=1715707191; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bM/Dw+slNgawZzGt48alAXy5N8w9IYCinYKDze4Obec=;
 b=JCPKVvFi3Q4IgwFbYzF5+RVS94MtlflTeDncMy1zdeRLamBV/jSm6Zdjqmfbe7jn/I
 KPNuotHEVlb0ODBxZwx2o7r6HrmDgveOQUa7DlmiHY83dMdR/CJ9E8XrKcCtB4ELJpSG
 aWyFxLK+veuu225ZNz9O2lGpsD5ueyg+Eq0QM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715102391; x=1715707191;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bM/Dw+slNgawZzGt48alAXy5N8w9IYCinYKDze4Obec=;
 b=fh9GZsXLcBdW/JeDp/k5c/n/fIYuaY7Hxr4BuUR79HnhMx2Hfj8wWo2RXvWkqMfZut
 g43fjNi0bKVrVnWzcLLJT+itd3f8uA7bXpKa3iSX0/ci5BiJKe9noB2VxG7kzUPdF5+k
 ziEFRtXyyKFWKTvtm46dZn2UJyiBqmaDzd/dMImHc1qr0FhW1TW0JkN/AtZYtdBxzmuy
 u/04UXYCqbZOXLj4Un5uOm9usNzLM4WMjKW9NQ3o4r/wJnd1i8eMRakOhxw+1n6wRu2Z
 VsS28Y518/K487pgU/sCcBlwJpyQvz9zrfuz4batp90Atz0ZtcHZfhoY5z72Texai9MC
 9JxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQLvIxQdbBwhbQkWF78jm39OvLm8R5ScaWavIltogUrvNdDiy+RLyX9nGKMJpq71hXVDhUFot2ct/Xblzk0EdkYHj72QJ8FImHrNEQ6N1s
X-Gm-Message-State: AOJu0Yy/3rV8AvYVYIAyb15CcDaEKRvSBPytwLX6CvQANhz+GEmE+o3P
 vNUDWolaNf+6wkPnEheu9jJkOcbp6XGlupYuoicBMMyjOVUPwBTqJoCmUQ6+o3Y=
X-Google-Smtp-Source: AGHT+IGjYrAFJPkOT/+jV38wR5mJiJ3AoSBk6cawRCaea6OsXoRTzzuMP8kcLArTQhqp2IAKTK96/Q==
X-Received: by 2002:a05:600c:1ca0:b0:41a:bc88:b84 with SMTP id
 5b1f17b1804b1-41f71cc26f6mr3013945e9.1.1715102390920; 
 Tue, 07 May 2024 10:19:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c10-20020adfef4a000000b0034a3a0a753asm13300068wrp.100.2024.05.07.10.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 10:19:50 -0700 (PDT)
Date: Tue, 7 May 2024 19:19:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mina Almasry <almasrymina@google.com>,
 Christoph Hellwig <hch@infradead.org>,
 Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>,
 Christian Brauner <brauner@kernel.org>, Simon Horman <horms@kernel.org>,
 David Howells <dhowells@redhat.com>, Florian Westphal <fw@strlen.de>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>,
 Arseniy Krasnov <avkrasnov@salutedevices.com>,
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Johannes Berg <johannes.berg@intel.com>,
 Abel Wu <wuyun.abel@bytedance.com>,
 Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
Message-ID: <ZjpisrsAZdqTXuLT@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 Mina Almasry <almasrymina@google.com>,
 Christoph Hellwig <hch@infradead.org>,
 Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Simon Horman <horms@kernel.org>,
 David Howells <dhowells@redhat.com>,
 Florian Westphal <fw@strlen.de>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>,
 Arseniy Krasnov <avkrasnov@salutedevices.com>,
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Johannes Berg <johannes.berg@intel.com>,
 Abel Wu <wuyun.abel@bytedance.com>,
 Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-3-almasrymina@google.com>
 <ZjH1QaSSQ98mw158@infradead.org>
 <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
 <ZjjHUh1eINPg1wkn@infradead.org>
 <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
 <20240507164838.GG4718@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507164838.GG4718@ziepe.ca>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Tue, May 07, 2024 at 01:48:38PM -0300, Jason Gunthorpe wrote:
> On Tue, May 07, 2024 at 09:42:05AM -0700, Mina Almasry wrote:
> 
> > 1. Align with devmem TCP to use udmabuf for your io_uring memory. I
> > think in the past you said it's a uapi you don't link but in the face
> > of this pushback you may want to reconsider.
> 
> dmabuf does not force a uapi, you can acquire your pages however you
> want and wrap them up in a dmabuf. No uapi at all.
> 
> The point is that dmabuf already provides ops that do basically what
> is needed here. We don't need ops calling ops just because dmabuf's
> ops are not understsood or not perfect. Fixup dmabuf.
> 
> If io_uring wants to take its existing memory pre-registration it can
> wrap that in a dmbauf, and somehow pass it to the netstack. Userspace
> doesn't need to know a dmabuf is being used in the background.

So roughly the current dma-buf design considerations for the users of the
dma-api interfaces:

- It's a memory buffer of fixed length.

- Either that memory is permanently nailed into place with dma_buf_pin
  (and if we add more users than just drm display then we should probably
  figure out the mlock account question for these). For locking hierarchy
  dma_buf_pin uses dma_resv_lock which nests within mmap_sem/vma locks but
  outside of any reclaim/alloc contexts.

- Or the memory is more dynamic, in which case case you need to be able to
  dma_resv_lock when you need the memory and make a promise (as a
  dma_fence) that you'll release the memory within finite time and without
  any further allocations once you've unlocked the dma_buf (because
  dma_fence is in GFP_NORECLAIM). That promise can be waiting for memory
  access to finish, but it can also be a pte invalidate+tlb flush, or some
  kind of preemption, or whatever your hw can do really.

  Also, if you do this dynamic model and need to atomically reserve more
  than one dma_buf, you get to do the wait/wound mutex dance, but that's
  really just a bunch of funny looking error handling code and not really
  impacting the overall design or locking hierarchy.

Everything else we can adjust, but I think the above three are not really
changeable or dma-buf becomes unuseable for gpu drivers.

Note that exporters of dma-buf can pretty much do whatever they feel like,
including rejecting all the generic interfaces/ops, because we also use
dma-buf as userspace handles for some really special memory.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
