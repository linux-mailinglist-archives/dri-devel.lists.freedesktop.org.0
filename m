Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0FE8FB944
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D199A10E54F;
	Tue,  4 Jun 2024 16:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB9710E54F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 16:43:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 96B516134A;
 Tue,  4 Jun 2024 16:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BBAC2BBFC;
 Tue,  4 Jun 2024 16:42:46 +0000 (UTC)
Date: Tue, 4 Jun 2024 12:42:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Paolo Abeni <pabeni@redhat.com>, Mina Almasry <almasrymina@google.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Arnd Bergmann <arnd@arndb.de>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Pavel Begunkov
 <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Yunsheng Lin
 <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, Harshitha
 Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, Kaiyuan
 Zhang <kaiyuanz@google.com>
Subject: Re: [PATCH net-next v10 05/14] netdev: netdevice devmem allocator
Message-ID: <20240604124243.66203a46@gandalf.local.home>
In-Reply-To: <20240604163158.GB21513@ziepe.ca>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-6-almasrymina@google.com>
 <bea8b8bf1630309bb004f614e4a3c7f684a6acb6.camel@redhat.com>
 <20240604121551.07192993@gandalf.local.home>
 <20240604163158.GB21513@ziepe.ca>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 4 Jun 2024 13:31:58 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Tue, Jun 04, 2024 at 12:15:51PM -0400, Steven Rostedt wrote:
> > On Tue, 04 Jun 2024 12:13:15 +0200
> > Paolo Abeni <pabeni@redhat.com> wrote:
> >   
> > > On Thu, 2024-05-30 at 20:16 +0000, Mina Almasry wrote:  
> > > > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > > > index d82f92d7cf9ce..d5fac8edf621d 100644
> > > > --- a/net/core/devmem.c
> > > > +++ b/net/core/devmem.c
> > > > @@ -32,6 +32,14 @@ static void net_devmem_dmabuf_free_chunk_owner(struct gen_pool *genpool,
> > > >  	kfree(owner);
> > > >  }
> > > >  
> > > > +static inline dma_addr_t net_devmem_get_dma_addr(const struct net_iov *niov)    
> > > 
> > > Minor nit: please no 'inline' keyword in c files.  
> > 
> > I'm curious. Is this a networking rule? I use 'inline' in my C code all the
> > time.  
> 
> It mostly comes from Documentation/process/coding-style.rst:
> 
> 15) The inline disease
> ----------------------
> 
> There appears to be a common misperception that gcc has a magic "make me
> faster" speedup option called ``inline``. While the use of inlines can be
> appropriate (for example as a means of replacing macros, see Chapter 12), it
> very often is not. Abundant use of the inline keyword leads to a much bigger
> kernel, which in turn slows the system as a whole down, due to a bigger
> icache footprint for the CPU and simply because there is less memory
> available for the pagecache. Just think about it; a pagecache miss causes a
> disk seek, which easily takes 5 milliseconds. There are a LOT of cpu cycles
> that can go into these 5 milliseconds.
> 
> A reasonable rule of thumb is to not put inline at functions that have more
> than 3 lines of code in them. An exception to this rule are the cases where
> a parameter is known to be a compiletime constant, and as a result of this
> constantness you *know* the compiler will be able to optimize most of your
> function away at compile time. For a good example of this later case, see
> the kmalloc() inline function.
> 
> Often people argue that adding inline to functions that are static and used
> only once is always a win since there is no space tradeoff. While this is
> technically correct, gcc is capable of inlining these automatically without
> help, and the maintenance issue of removing the inline when a second user
> appears outweighs the potential value of the hint that tells gcc to do
> something it would have done anyway.
> 

Interesting, as I sped up the ftrace ring buffer by a substantial amount by
adding strategic __always_inline, noinline, likely() and unlikely()
throughout the code. It had to do with what was considered the fast path
and slow path, and not actually the size of the function. gcc got it
horribly wrong.

-- Steve
