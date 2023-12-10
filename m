Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7819180B8A0
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 04:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4BB10E30B;
	Sun, 10 Dec 2023 03:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDC510E30B
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 03:49:30 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-5c1f17f0198so1440983a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Dec 2023 19:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702180170; x=1702784970;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=MW0tH0tCLOPnmE9TK7jB709vE7J7udoTWRcjSJbRbzw=;
 b=R7s5Nxd27kpJpOqdOf/Cprt46lNB0rYTXkPviwGYUuHVJ1LCpv/qfkqcHvRZyk17F0
 zt2hv3ICaEw4Mqb/IuCT58txtQXzfWqcr67v9SB6vbirhXKhlRa9GBnjHqYtsdpclvbj
 Pg1GhBk1BGqVpjLOdasy7z9MDxGnI9CJPXCn2S9V97XJHCMUCxixVc/QGTuFb+lq5AZT
 qMScoPg01G+43mzMbta2RUK75EZ5t/a9Fbz3C5Feedp/P2zcODK8JFsnwpqS8Lrbif/e
 ps06pShOZm2TUGKFonAlNaT6Agmt35JcXvYi0UoCnnar7okpReSjStcRK3duro+pPS1o
 SGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702180170; x=1702784970;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MW0tH0tCLOPnmE9TK7jB709vE7J7udoTWRcjSJbRbzw=;
 b=NGiC+C45Ro4lK6nte8It76P7v2eU+7u7f5sDrT0cuIwsc16f04Q2DzaqWq7qiH5ajL
 jqaEUcNqwN2eqhxIq5AjaoAVmA1Qf5PSjCjd08GYdddhV75d81ucwOIRKPOwrI3qxSqt
 BADQQFQB4gEKW/DJrU91h7k0vNqmv9ovg0w8xEyOken0SIFEVmSmYb/2jAwnIK9GUt9d
 SdvEbs8gD/cyqnsuZTBIh7aIgDNxhoYmQxOJ7UZqKiLtWjsY5oucmBztcjxvFJJF0oLY
 KarrcsQNrM8GRE7dVCk6n2SqvfaXDisKo1ae3Q/Hk0cIZNrHPX2J+XSOt9d/byKIDxU3
 TA1A==
X-Gm-Message-State: AOJu0Ywz8DXPbE8rpw0DL7Ni5OIy9lXqfeEG/D/co5Ir5myXJCgjSNMe
 WrUx81+a4Fla9jnMYRDgrZZb/xQol/dEMA==
X-Google-Smtp-Source: AGHT+IHLBajZsz0VxcL0CaCLjiP+JcpZ3Z6iSNDh4oLOCNKWTm9OPBX9RXcqYsgny9cLWKIkHF4CYYDwWcNIvw==
X-Received: from shakeelb.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:262e])
 (user=shakeelb job=sendgmr) by 2002:a63:7317:0:b0:5b8:fe99:152d with SMTP id
 o23-20020a637317000000b005b8fe99152dmr15385pgc.7.1702180170422; Sat, 09 Dec
 2023 19:49:30 -0800 (PST)
Date: Sun, 10 Dec 2023 03:49:28 +0000
In-Reply-To: <20231208005250.2910004-2-almasrymina@google.com>
Mime-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-2-almasrymina@google.com>
Message-ID: <20231210034928.mk4ufxqis2w3wesg@google.com>
Subject: Re: [net-next v1 01/16] net: page_pool: factor out releasing DMA from
 releasing the page
From: Shakeel Butt <shakeelb@google.com>
To: Mina Almasry <almasrymina@google.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 04:52:32PM -0800, Mina Almasry wrote:
> From: Jakub Kicinski <kuba@kernel.org>
> 
> Releasing the DMA mapping will be useful for other types
> of pages, so factor it out. Make sure compiler inlines it,
> to avoid any regressions.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 

Reviewed-by: Shakeel Butt <shakeelb@google.com>
