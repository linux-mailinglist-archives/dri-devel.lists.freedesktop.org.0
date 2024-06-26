Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DDF9182FE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 15:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A2710E8BF;
	Wed, 26 Jun 2024 13:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N2WmdbmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D29210E8C1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 13:47:10 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-57d0eca877cso362960a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719409628; x=1720014428; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RFl4a85rkCgH8ys4lWAdMJzDTuxnq6IRXeCuLnaU+Ko=;
 b=N2WmdbmZ/HKjmACA5wNGz9nw7ALeSbAKoPXWNFW3CvzLYi3pyt4SZbx8Jn7qBn0gZo
 BNDiZBVsTS6G+gg8OjVAj9nVOzHKxUx2SI6qZJ7mQUbb3n9JqdtFJKX8lfXhfMgqNN1/
 4tRXRgi1anMmzzezZ1a8Ar3LAFqjCJNBoLGkGc7YHIGFCd5EmTDllH/vs/AQNcUXfA4x
 57Nv1K8s1B+NT9wj89bW8YZhNKnKA/lCXhpi909j120CDeVr8eniTwCfkBqI1Vm0dwBN
 YkDQ/8cAMYQzNWrq4XH03aKMP7tlJC7QvY6nfAY3nyvFYVW2NqYLJr9K0lGQv0NLzDLG
 ULNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719409628; x=1720014428;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RFl4a85rkCgH8ys4lWAdMJzDTuxnq6IRXeCuLnaU+Ko=;
 b=U5v7Wfp2+xhnbZnFugjIbO/9f4qXEP1hfnyNavtkB7zWcfR8B4vOmJaG3+hLdjhc6z
 33kZgV4qQqdaL3WBtOgV6vPH5o6d/Ltvzv9M95V/jm9UPgudW48zIFg8uwTU+Okkdny0
 O/pFH6tqOPbhLSedKKoIxBkiLpSeQvGYkKZOF1A2CH8dyDyJ5kjiQJLRy7cIkqe0sKlb
 hcojcWN3fIMGLqH19sYKIwJ1Nl/u4Nm3RiUbyJ5eBvnYh7o8JL8Ol+6TE2ArtrnbClLX
 O0gd6ZJNtsl9CuEFQHzzplyWNdESsPt1OLLHc2K9Ar9fLb8i5CpOxI6Z+TqeTdBvw3BS
 2yxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpj6lzfm20JtLDWaQUJoMB5nL5W7uIHIxH9SDauyjdThkoC51uLXogpPdzw5LSjUsZBEGkGZiF9TXGA6Ofn3pQ2R75vRPWOSRoFKmlC9Yp
X-Gm-Message-State: AOJu0YyD7veP9qDG+zPIzpvAmMjIlsVDog+m297PBuf07I+cURiVRIn7
 /cFilw2vhQoKk7rNy8up8sIhniLFOGHBRW1DtlcBF5ceEV/iU5u8
X-Google-Smtp-Source: AGHT+IGD5mGfND6mvQHeN5VakSdcpLJO5iAUu9YTrHEpvfoG3vNqvyJwqGy3yIJ4e8gaM2b8isOyjg==
X-Received: by 2002:a17:907:c01a:b0:a72:8c5e:f3d with SMTP id
 a640c23a62f3a-a728c5e112amr201037566b.49.1719409628168; 
 Wed, 26 Jun 2024 06:47:08 -0700 (PDT)
Received: from [192.168.42.3] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7244cbce5bsm425759166b.79.2024.06.26.06.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 06:47:07 -0700 (PDT)
Message-ID: <09bdd7e5-75ca-42d5-8e59-a8ec05da89c7@gmail.com>
Date: Wed, 26 Jun 2024 14:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v13 11/13] net: add SO_DEVMEM_DONTNEED setsockopt
 to release RX frags
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240625024721.2140656-1-almasrymina@google.com>
 <20240625024721.2140656-12-almasrymina@google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240625024721.2140656-12-almasrymina@google.com>
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

On 6/25/24 03:47, Mina Almasry wrote:
> Add an interface for the user to notify the kernel that it is done
> reading the devmem dmabuf frags returned as cmsg. The kernel will
> drop the reference on the frags to make them available for reuse.

The sock_devmem_dontneed loop is a bit crude, but that can
be handled by follow up patches.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

> diff --git a/net/core/sock.c b/net/core/sock.c
> index 9abc4fe259535..040c66ac26244 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
...
>   
> +#ifdef CONFIG_PAGE_POOL
> +static noinline_for_stack int
> +sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int optlen)
> +{
> +	unsigned int num_tokens, i, j, k, netmem_num = 0;
> +	struct dmabuf_token *tokens;
> +	netmem_ref netmems[16];
> +	int ret = 0;
> +
> +	if (sk->sk_type != SOCK_STREAM || sk->sk_protocol != IPPROTO_TCP)
> +		return -EBADF;
> +
> +	if (optlen % sizeof(struct dmabuf_token) ||
> +	    optlen > sizeof(*tokens) * 128)
> +		return -EINVAL;
> +
> +	tokens = kvmalloc_array(128, sizeof(*tokens), GFP_KERNEL);
> +	if (!tokens)
> +		return -ENOMEM;
> +
> +	num_tokens = optlen / sizeof(struct dmabuf_token);
> +	if (copy_from_sockptr(tokens, optval, optlen)) {
> +		kvfree(tokens);
> +		return -EFAULT;
> +	}
> +
> +	xa_lock_bh(&sk->sk_user_frags);
> +	for (i = 0; i < num_tokens; i++) {
> +		for (j = 0; j < tokens[i].token_count; j++) {
> +			netmem_ref netmem = (__force netmem_ref)__xa_erase(
> +				&sk->sk_user_frags, tokens[i].token_start + j);
> +
> +			if (netmem &&
> +			    !WARN_ON_ONCE(!netmem_is_net_iov(netmem))) {
> +				netmems[netmem_num++] = netmem;
> +				if (netmem_num == ARRAY_SIZE(netmems)) {
> +					xa_unlock_bh(&sk->sk_user_frags);
> +					for (k = 0; k < netmem_num; k++)
> +						WARN_ON_ONCE(!napi_pp_put_page(netmems[k]));
> +					netmem_num = 0;
> +					xa_lock_bh(&sk->sk_user_frags);
> +				}
> +				ret++;
> +			}
> +		}
> +	}
> +
> +	xa_unlock_bh(&sk->sk_user_frags);
> +	for (k = 0; k < netmem_num; k++)
> +		WARN_ON_ONCE(!napi_pp_put_page(netmems[k]));
> +
> +	kvfree(tokens);
> +	return ret;
> +}
> +#endif

-- 
Pavel Begunkov
