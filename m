Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D32A3F2C2A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 14:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F116EA7F;
	Fri, 20 Aug 2021 12:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C9C6EA7F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 12:34:02 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id c14so5384880qvs.9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 05:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FxHzHqYkZIYKuBII5yJmxkfX68sHHNA5VrSWbqQXyKE=;
 b=LKWHjCeNEUlwo8stybqJCnXzWMQM7x0bGZxSQUSvDEzvNf1rR/5NIRBxcsq8j+/O1Q
 n0nUB2SGq4I944/SzVA06PgpS5TZJLAeuT0eHnupeq9B+6Ke4eApnMJzh0PSSn3USY22
 DCevWLZt6mnoLjPVwnT/B6qIy3u8gu6R9V0eYF2w1BUAXn85ddRUOkrnCFaTavga7CyB
 OHwKCMDxBA7mQeV8i9u/U1itYCfjgHgpthcASaDTqWMWWREFiEjUsvbxUeQR41p24/42
 cXB4sxzSr+JXUbmuhE4oft2wqIs67/Ai41z+4L6PkD8HA2B/GtZI5tt/EczYHI2wefxZ
 10cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FxHzHqYkZIYKuBII5yJmxkfX68sHHNA5VrSWbqQXyKE=;
 b=Gn/Obwj28EusmTWt5O+ZPCUFi4mHpNYTG7Esmf2U9Ybq8LrejST2ybgFUkWWIWe/fC
 wQCOKhHye20r6ofEADpPu2HEJTm5c+RBooOQZUtj3aNCST220HQwEqtSL1JBuNOuPupz
 2jd43shV3BgH3JwxXmAaKEhik/4iNun/TJHQC1Gn+qs1FKOgb0afggSTV1is1Pkk+CD3
 +Pm7v9qaSsNBx9ePggZJFYg8HXS2UtIs7S/wQqBA448KnsqI+/LmYhchmdaMToXXSrgQ
 KjL8M3a4ALv6nt9MSWYxor+p0eYfanY7PXSQPbxBc3/n2Ilesn6IwSm+VLXdvDDZ5VWZ
 Pfuw==
X-Gm-Message-State: AOAM532dePozL72E20J4wvcrNxE2/bZH7nGE0ZVD+4yQcy2y5ZS8D684
 gk9PbDUozj/8RPib+HvUfvwXeA==
X-Google-Smtp-Source: ABdhPJwGEOvhoU1c/BkmKt9S+cy9PyrWCoEZ7eevTf7BK/BVeVCzTaDTUl3qnqghNI/H9rEss9GPTg==
X-Received: by 2002:a0c:d6cd:: with SMTP id l13mr1047928qvi.24.1629462841673; 
 Fri, 20 Aug 2021 05:34:01 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id 69sm3472288qke.55.2021.08.20.05.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 05:34:01 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mH3ii-001q0s-MH; Fri, 20 Aug 2021 09:34:00 -0300
Date: Fri, 20 Aug 2021 09:34:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
 Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 56/63] RDMA/mlx5: Use struct_group() to zero struct
 mlx5_ib_mr
Message-ID: <20210820123400.GW543798@ziepe.ca>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-57-keescook@chromium.org>
 <20210819122716.GP543798@ziepe.ca> <202108190916.7CC455DA@keescook>
 <20210819164757.GS543798@ziepe.ca> <202108191106.1956C05A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202108191106.1956C05A@keescook>
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

On Thu, Aug 19, 2021 at 11:14:37AM -0700, Kees Cook wrote:

> Which do you mean? When doing the conversions I tended to opt for
> struct_group() since it provides more robust "intentionality". Strictly
> speaking, the new memset helpers are doing field-spanning writes, but the
> "clear to the end" pattern was so common it made sense to add the helpers,
> as they're a bit less disruptive. It's totally up to you! :)

Well, of the patches you cc'd to me only this one used the struct
group..

Jason 
