Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F290892CF53
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 12:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82B010E722;
	Wed, 10 Jul 2024 10:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yub14HrM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D77310E722
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:37:18 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52e9c55febcso8015544e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720607836; x=1721212636; darn=lists.freedesktop.org;
 h=mime-version:user-agent:references:message-id:date:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jUv1TKKjUHthOG7mdtMKuqVjyWEdEs5skCdldKg/BLA=;
 b=Yub14HrMAvUKxwSA1Xy7altybJVsRSRDK9SmpDd44MwI9tAfD8iVZsdTneGhy5WRLf
 xlu1TYcOc3QiCqr9e8aGTWiXKWznLbIT8bl3nIe1IG4RNUdhSnkGrupTOmPwgMF/pdZz
 PX3Z3mRhqIhuFL4xWt2zaswITFHAwojArKPPN0igpcMp+lDMhR1Cr3DMc6W+ENbjSZEX
 iLpUcqt8MM50rUZ8ZEQhLAjI4+7z9QO1QXwX7bBx2xkei/5crZXZhn27CsNElAj7Pbt7
 PyLNK4WgNXChJsVmuIpFgRTuOBo1k2SlFZ3zsYLEfqBgb6iSfRWFpWSEKvLyP3AL806v
 cwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720607836; x=1721212636;
 h=mime-version:user-agent:references:message-id:date:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUv1TKKjUHthOG7mdtMKuqVjyWEdEs5skCdldKg/BLA=;
 b=HdPv24LAjqR9toUIdXtUqnoNimkRxuCYTjJ/XF5tbACyKZbyQ4X39hVU3lsEnw4N0b
 4n8EL/arNMKoUkiCSfvHv03iKgpQatWrkA4gEeYM8cwEPz1nus6rwGKR3uQTYIgMnhYe
 jcGT/S4+UPzWShJNsqOJJE48MncnGiaqmBussdpmvVGaTNgW4/POt/nw0kr0A/HMCYba
 GLA++7oQ6/K6L/FZXD58Kh3/w8zPEEJabmy7JR9CShg10xk4ittLEk4Juaw5tULJHUK0
 HfkxsWv78E9h5HeCwcX18awkGC9XZGcrmlNSDO9ubLS9jzVU9/zu9+JIXqw0aBH2F62T
 mhqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/c4+J7aoldhtgOU+VHtXP+XkIc2B3/4t4tcgn4LaSh2ytgecmnfrh2fHxR0WGiUA6F7150mBwcr6j8kqAztiGQNUeihFNh5bkFj8aWZHH
X-Gm-Message-State: AOJu0YyHGYigxB0LOxYXuYZl8JREKdz0y6IzPi3T1zBYv2sEGSJBI5rW
 9NCqaxEYRz4vy14+jh9c707Qp4csf4mpmSlNneeXzqjTz0V+qKbI
X-Google-Smtp-Source: AGHT+IEYBZWIZpjV7C9ssz+2I4yf8GPHbR8l+2RYZAsApi0hWbugWj4h9Cu7wWaqd85eKzfkNy/N7w==
X-Received: by 2002:a05:6512:3e19:b0:52c:e17c:3753 with SMTP id
 2adb3069b0e04-52eb9991919mr3752798e87.5.1720607835793; 
 Wed, 10 Jul 2024 03:37:15 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:d1a7:2644:c75e:c5ee])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266ac156easm114146345e9.38.2024.07.10.03.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 03:37:15 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,  linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org,  linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org,  linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Paolo Abeni <pabeni@redhat.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Richard Henderson <richard.henderson@linaro.org>,  Ivan
 Kokshaysky <ink@jurassic.park.msu.ru>,  Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,  "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,  Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>,  Jesper Dangaard Brouer
 <hawk@kernel.org>,  Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,  Masami Hiramatsu
 <mhiramat@kernel.org>,  Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>,  Arnd Bergmann <arnd@arndb.de>,  Steffen
 Klassert <steffen.klassert@secunet.com>,  Herbert Xu
 <herbert@gondor.apana.org.au>,  David Ahern <dsahern@kernel.org>,  Willem
 de Bruijn <willemdebruijn.kernel@gmail.com>,  Shuah Khan
 <shuah@kernel.org>,  Sumit Semwal <sumit.semwal@linaro.org>,  =?utf-8?Q?C?=
 =?utf-8?Q?hristian_K=C3=B6nig?= <christian.koenig@amd.com>,  Bagas Sanjaya
 <bagasdotme@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,  Nikolay Aleksandrov
 <razor@blackwall.org>,  Taehee Yoo <ap420073@gmail.com>,  Pavel Begunkov
 <asml.silence@gmail.com>,  David Wei <dw@davidwei.uk>,  Jason Gunthorpe
 <jgg@ziepe.ca>,  Yunsheng Lin <linyunsheng@huawei.com>,  Shailend Chand
 <shailend@google.com>,  Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,  Jeroen de Borst
 <jeroendb@google.com>,  Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v16 11/13] net: add devmem TCP documentation
In-Reply-To: <20240710001749.1388631-12-almasrymina@google.com> (Mina
 Almasry's message of "Wed, 10 Jul 2024 00:17:44 +0000")
Date: Wed, 10 Jul 2024 11:28:37 +0100
Message-ID: <m2a5ip1qy2.fsf@gmail.com>
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-12-almasrymina@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
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

Mina Almasry <almasrymina@google.com> writes:

> Add documentation outlining the usage and details of devmem TCP.
>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
