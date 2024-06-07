Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D211E900788
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 16:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C1D10EC8A;
	Fri,  7 Jun 2024 14:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="W3IfBsPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07AE10EC8A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 14:52:49 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7951713ba08so181038685a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 07:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1717771968; x=1718376768; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=be9t9+ReZ6YBtow20QbHH2FmkX+nC7rbtPeGa2mS4as=;
 b=W3IfBsPNG4ixznSeATrzDdviw1w8kihlBdz8qBZFTqZTNaPP7qkPUUNWhkrjwjYKUD
 +u7kvVEeD58qGJRN6kSs901KcZ/3C1MpXuRJrrQIOqIoMHUmU3gmYJ6OtXtrd+8Czzh8
 8E+Fq3qPXkzY3rpyVSZidgU7YscOHh82Ru+wByw5/Z7mPul4QlVhGKpVlb7WmDJ+VP9b
 ADj6z92U3FlzjG9DWICamQZ5lK9UUAKkK8uGpB0yhkjBYLc4P4ywPe2GY5YK1k+9Z/Sc
 D7mahgje0sg4KlFWtRLtJFjm/jcxQjkgoV5ri/oTbbdDHj3f81XMlxeiaY3byqWPtJdy
 o7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717771968; x=1718376768;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=be9t9+ReZ6YBtow20QbHH2FmkX+nC7rbtPeGa2mS4as=;
 b=ob8V5QmH19IINhiB8FwP6qEj992z/CfIvDAm9Snkh6fWZCCHuW7qiSrYp6bvRPtmo0
 Q7SgC86HX6cQ6hRucBxjGOqhhCQ7mvITNUQ+A0NlVDfaRZXrmVd0K79YWt3ZizUcrEWq
 xdrrvcVFBs+PBQkve8C7H2MyQ3xtJgDGRleok3JQL+7N12RguA+DJN7xAOrAcc48vmkk
 8Z8pLYT0KAS/biPmWkmgYBlrkOKXGxkvU0gIjgpskv4OvoqpdkRJmugsTKf3t6+G889o
 tgks+x9aEV8fK6iuW/D6uKCG0q78h5BWJHrvTUU96veLiEVGjwbvvQ7yg/ejOw1ZZRXw
 3K/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkeaAzo+1RWD9seoO/+JjPNCrw3yRjdE4kqv4kETYkHiLyUotypz5bI97i+j+6hnqLZlDJ+6acx6tCAVIXC0tJJ7A2QmfaL4OI3p0+L8Zk
X-Gm-Message-State: AOJu0YwTnn4Mfq8/j7maGklRew2sZ4cbZz1ODdBUIeFomPMdMri1UTTI
 k6Mi1bT6l0cOy7zqBVOxZ21VbX6E6Sg1rObRRP1m7aEAhyRSNOne6rAH9JDm5ds=
X-Google-Smtp-Source: AGHT+IEol1YR1WI0zC3A5eIuWJjKcIm2ZGRprGfgrv26PYx2gMqkRphUST2lY2DmLHNeG4xW82MRzw==
X-Received: by 2002:a05:620a:31a8:b0:795:4e67:1ef5 with SMTP id
 af79cd13be357-7954e672231mr106304685a.11.1717771968557; 
 Fri, 07 Jun 2024 07:52:48 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79532870231sm173090885a.60.2024.06.07.07.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 07:52:48 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sFaxT-00HGBa-Cf;
 Fri, 07 Jun 2024 11:52:47 -0300
Date: Fri, 7 Jun 2024 11:52:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Ahern <dsahern@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Mina Almasry <almasrymina@google.com>,
 Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
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
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Wei <dw@davidwei.uk>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
Message-ID: <20240607145247.GG791043@ziepe.ca>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
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

On Fri, Jun 07, 2024 at 08:27:29AM -0600, David Ahern wrote:
> On 6/7/24 7:42 AM, Pavel Begunkov wrote:
> > I haven't seen any arguments against from the (net) maintainers so
> > far. Nor I see any objection against callbacks from them (considering
> > that either option adds an if).
> 
> I have said before I do not understand why the dmabuf paradigm is not
> sufficient for both device memory and host memory. A less than ideal
> control path to put hostmem in a dmabuf wrapper vs extra checks and
> changes in the datapath. The former should always be preferred.

I think Pavel explained this - his project is principally to replace
the lifetime policy of pages in the data plane. He wants to change
when a page is considered available for re-allocation because
userspace may continue to use the page after the netstack thinks it is
done with it. It sounds like having a different source of the pages is
the less important part.

IMHO it seems to compose poorly if you can only use the io_uring
lifecycle model with io_uring registered memory, and not with DMABUF
memory registered through Mina's mechanism.

Jason
