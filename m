Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A87C8D6FE4
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 15:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9204F10E0BD;
	Sat,  1 Jun 2024 13:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NWMc4q6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F60710E0BD
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 13:09:09 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1f47f07acd3so26068895ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jun 2024 06:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717247349; x=1717852149; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JeCV8WyWwZWgsRBoBsXvODv76tCrqrpoTPjcXqyhaow=;
 b=NWMc4q6eZQ2XinqvaH9JG9f8aVSi122S69KP8OH1EQUB7wgEoL0/Zm03gDTDNGUO5s
 O0bOOdTztIybODUOAn+bV0yqySHkE3GIvPvOjsFa/WECdSmBCWwn6uc5xxVTMvXbuaw8
 4j70XtF/kDo64WafifhA4y2+FBjV9g0r2YOn9nekWvhxEVP3hGznicJomcGK3jNLreUy
 NTcLU2duq28TEllEn+emodLNTy6CMinim8ft4qN9l5nwGL+ptGa62SjMCdLU2MWtVAIB
 CcAORrfGnegtT2CWvvSueCWhAjD+fF1WnSysV83I54brz8AzURcJmIBc7fP5XWR7D8Uk
 Gi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717247349; x=1717852149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JeCV8WyWwZWgsRBoBsXvODv76tCrqrpoTPjcXqyhaow=;
 b=TvIceyDuHyKOWbRPGJqlcduaYwRzYuUoiBjFgcjGmTdS+MV2ePkAFuLH39kNHL7G3l
 7Tsw1QtU6ORhs6xvY1ace27BZ1eM8bb4aw681VWvvCjSy4CXD2q2M3Ky2QNIYI7Ii7Qb
 /RAMpZCcxBxqkgQ9mRGxaAAMliP54Or2cGizMDGpEM8K2A/5hFi1iV9R/UOAVY3jH5PP
 saKUMbGAKgIUlk7Da16duUA8PfUS9FTjVLfzupeBxZeT0jJmLuKGv1i4OVJKz4KB6i/o
 IPAVtvodYFOYEgSrphARYolycIxneKpx/Npxr6enZNywqz44Q2sysG7qcjvS2wWMwiNp
 vLuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhsuLWAXnIBmhDz6netsvRLi6zkg5tEFLVwSZXPBvPBgvpJmqI3IUodUxFR14gJllgery2qhrkFESnH70eX78oHtHCHt5s5iuHF5BfnjcA
X-Gm-Message-State: AOJu0YydrPzkYZQ21855kZ8oVzqKUaLdEznjnVO7m8N8TUHNX5/i1NFb
 N7RqpFSZrLS3E/ngTGOGOcmUnSzy3nfZM6aytHujXKRGlXv3D7il
X-Google-Smtp-Source: AGHT+IFMrqly2po5FAbpY8Ll75+7jqZGxykv2GKZgaeba5l+UFazICmi5KDmbbiaIzRe6tWODUDHbA==
X-Received: by 2002:a17:902:c412:b0:1f6:310b:a3cd with SMTP id
 d9443c01a7336-1f637018d0dmr55346295ad.20.1717247349084; 
 Sat, 01 Jun 2024 06:09:09 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f632338afbsm33014155ad.47.2024.06.01.06.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 06:09:08 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id B7AAC186E1EBA; Sat, 01 Jun 2024 20:09:03 +0700 (WIB)
Date: Sat, 1 Jun 2024 20:09:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
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
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Mao Zhu <zhumao001@208suo.com>, Ran Sun <sunran001@208suo.com>,
 Xiang wangx <wangxiang@cdjrlc.com>, Shaomin Deng <dengshaomin@cdjrlc.com>,
 Charles Han <hanchunchao@inspur.com>,
 Attreyee M <tintinm2017@gmail.com>, LihaSika <lihasika@gmail.com>
Subject: Re: [PATCH net-next v10 13/14] net: add devmem TCP documentation
Message-ID: <Zlsdb05xe4EnIXmq@archie.me>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-14-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aC8Ai/5tbLCsiak5"
Content-Disposition: inline
In-Reply-To: <20240530201616.1316526-14-almasrymina@google.com>
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


--aC8Ai/5tbLCsiak5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 08:16:12PM +0000, Mina Almasry wrote:
> Add documentation outlining the usage and details of devmem TCP.
>=20
> Signed-off-by: Mina Almasry <almasrymina@google.com>
>=20

The doc LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--aC8Ai/5tbLCsiak5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZlsdaQAKCRD2uYlJVVFO
o0YSAP9oUIejut2Xeqpj9kDBtkMcGA4Nf4zKVIgKdapDIWoSMAEA/6GrjlpUnXa2
aFvYS6BFsRnMWpsP7c/bQ/LplabX6wM=
=YUa0
-----END PGP SIGNATURE-----

--aC8Ai/5tbLCsiak5--
