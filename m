Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED33188716
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75626E16B;
	Tue, 17 Mar 2020 14:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398566E40C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 19:49:22 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id n5so15373305qtv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 12:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=o7JqLPPCRpGtDbfSiR++DTgayckzFt0qLULy0U0IXIw=;
 b=GGJyf40oBvUn3UsnYOHO6ftCMOlhlUE53mKdQJAM3RZ49VrR7NfNu6vFSbIJg0Vrp+
 nKaEHE/9u/3vvjCCe8WwHh8SthbR1oMP/lq3mlydxzkJGNn/tuTNACX8TZxQceM/9mon
 YIOCmCOQYTnLI6cUij9NQ1KEjPZ6YzkCBGaFSk2yslH5PGKF31RBGv+LalaZ8j2uIFLh
 bC7emlaCft8W3JdiciO0idkiwtVoNDBdFG9zx0aEVhvj80fXi5TE1dCzgDd5RWL/YOhG
 YYChBQ/vDVC92ft0WvWlgaDNuQmhJ1/CKwgNKV4aCfjmwGoqd/IKybrQhzqaZzus/5a5
 BRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o7JqLPPCRpGtDbfSiR++DTgayckzFt0qLULy0U0IXIw=;
 b=RrS2GooYamzKebGEveXiuAeRup5YZ2SRdxmSt+DCb0NE+RYf22zNaeSR3/B0fBB0XC
 SU1urw8Nd5zt3yCfprB9mHMG9IzyAUFCekgFN6jQqMzTSobydbSOeguQegCgp9ZFYyFo
 f9x8gCtUdA8zdG8FPljeXUtE/+i9dBaVY7d4vdfkhCUXIOLCN4HHEV4Ww17eKoHqj0PZ
 H0AErGzk3dPmQPDy59+vcj/WQ51i5N64tu9ITlBjFBfYPO3hNOMx+SC18lKqMYItWeXr
 YMlbC1Brd/WtyrPyQRl0XMkAOCfttJ+Cr7P4rI458L3CDHMtb8dHqNLaLNTYMgp033Fb
 q/xg==
X-Gm-Message-State: ANhLgQ3CPdWPGqX5GXS0bgNcRBw8LvZ1680DVMtV0ti+O0r6Xv6LBops
 5Dxe/Sg20g+qPRTbGv8zZBawWw==
X-Google-Smtp-Source: ADFU+vtYiqHgSFb/FCS3+UBgOOiW2jlaSoZd/0nI0+DDGOjwoiONzmkAwxqo+x9vqhMLJgCeBnROrw==
X-Received: by 2002:ac8:5209:: with SMTP id r9mr1812897qtn.61.1584388161299;
 Mon, 16 Mar 2020 12:49:21 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id m67sm406383qke.101.2020.03.16.12.49.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 12:49:20 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jDvjk-00071k-6b; Mon, 16 Mar 2020 16:49:20 -0300
Date: Mon, 16 Mar 2020 16:49:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/4] mm: check the device private page owner in
 hmm_range_fault
Message-ID: <20200316194920.GA20010@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316193216.920734-5-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 08:32:16PM +0100, Christoph Hellwig wrote:
> Hmm range fault will succeed for any kind of device private memory,
> even if it doesn't belong to the calling entity.  While nouveau
> has some crude checks for that, they are broken because they assume
> nouveau is the only user of device private memory.  Fix this by
> passing in an expected pgmap owner in the hmm_range_fault structure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Fixes: 4ef589dc9b10 ("mm/hmm/devmem: device memory hotplug using ZONE_DEVICE")
> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 12 ------------
>  include/linux/hmm.h                    |  2 ++
>  mm/hmm.c                               | 10 +++++++++-
>  3 files changed, 11 insertions(+), 13 deletions(-)

Nice

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
