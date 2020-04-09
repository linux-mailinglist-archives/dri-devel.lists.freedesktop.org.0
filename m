Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC241A3783
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 17:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58546EBF5;
	Thu,  9 Apr 2020 15:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF656EBF5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 15:52:14 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i10so6183969wrv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 08:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eqkR8PSND6qViZd9vmRT63/nOL3pGElbecF9kS9AV5s=;
 b=QgRm05+CyacyjOY3RBmn9C1g8k6GXprcIgmaaiKHOq3Myld5Dlqlx8RX+91G56bQK4
 31vtk9G1HTWRQeJiHk2wHYp5V9WI9Q8hA9wIfwC1+GWqqb3WG7IQEr95Xd1K+f4zySMq
 BfpWJM/GyQ2b1A9qunvFu8HTj97POnZg9ks3RyiTtLoaW+4oRhqCpcZCi81zrBODFi5M
 PS+omeprLH+7qCgGsgNqavalSunqspAgBy1s4xm2JglmUJnbq5g3/UgDapBVZzufvAE7
 reIvlBiF79OgdnB39sEdSX4wiBM+GhIbexe7RMRNWDcA+wt9s7nIdOTRkKK6tp2S8hot
 qqUw==
X-Gm-Message-State: AGi0PuZwv+Uh073YxpxaRbchBonPJSTIet8bf/Si0qWYM+5/Zd0MVeMB
 CnlfWjvTQeSxXU5RrigGoz7SlskIOe0=
X-Google-Smtp-Source: APiQypKMJHF6OiHO4wdgZ4uGElDczTXQUdaiFhgSzp0EipiSdhIJoRoqAA6vF3j45RxLstvXaIP8Cw==
X-Received: by 2002:adf:8b5c:: with SMTP id v28mr13870834wra.98.1586447532733; 
 Thu, 09 Apr 2020 08:52:12 -0700 (PDT)
Received: from debian (44.142.6.51.dyn.plus.net. [51.6.142.44])
 by smtp.gmail.com with ESMTPSA id o13sm18258592wrm.74.2020.04.09.08.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 08:52:11 -0700 (PDT)
Date: Thu, 9 Apr 2020 16:52:09 +0100
From: Wei Liu <wei.liu@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/28] x86/hyperv: use vmalloc_exec for the hypercall page
Message-ID: <20200409155209.4tqaipnwifcsrmda@debian>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408115926.1467567-2-hch@lst.de>
User-Agent: NeoMutt/20180716
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 01:58:59PM +0200, Christoph Hellwig wrote:
> Use the designated helper for allocating executable kernel memory, and
> remove the now unused PAGE_KERNEL_RX define.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Wei Liu <wei.liu@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
