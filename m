Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CA6284736
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3E76E3C6;
	Tue,  6 Oct 2020 07:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02F189C13
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 17:35:33 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c2so12869822qkf.10
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dKlbhuywYV4trrm533av5g+rTKLjmfZBMKtZHffEpfg=;
 b=Ogo60Itj+Op78dH8jXVJTtV1hFSvseMGAPGjIPJsWqBdL7wrA/UqdSqhsRz6b6AZDM
 I9lloFYxDZt04k/RrwXKkkLdJMtxhJtNbj12+kE6LDkefxEQsCuRyrXoqt5kaQaq6WYb
 TAJSecm4UNC7SEcfUU6PY9R+QlVJxVh8DUZlIM8VVCjCl2LyiL/ccw9cwG5QMQ2xTI44
 Tsx7MrXatCC9vxW+HHqRf4BEp5WLpvB6gW+CUVpFiZvvvlnoDb5wXthNwJdpMlarLbeU
 y3GuwL2OQtzoT2TdhVV09xynxfFdakx3hgKX1AnIaRavPLMbXV35KK2VeBNdbDGcrEVO
 zBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dKlbhuywYV4trrm533av5g+rTKLjmfZBMKtZHffEpfg=;
 b=tuhIFYEtaQ26gXVQuhP1V2b5mco5o2JL9asAX1M9tv3f6sCftavT0Jn/D0emByYerl
 KXgLjKqPjz4G1ysdsNqnnJaOhcVZMIBucw+bU4R69ggPntmP0lXqcBBuDMzu0NZObKRx
 JGs2SlhomMhCUg0hZV325xpnpenH8+i074cAuFCAL1Z/ebBCTILQYaVL3Esa5a3cK6OK
 6ayI8g3lgBbn+rz/0vw5i5ReP7E/zOeX2XhbRlqsGulwrKmg1jARwGgCvlzh+VyXqxTw
 DAJOxN2SZauw83QD9dITSM7lPK69+fRRyUrQ+8WRCAXL2TPFKGEf4+2ZKv0fRmAX3zrI
 qC8A==
X-Gm-Message-State: AOAM533O4Zu3X9lM0nmGqHOw2pyrE2kLM+QSn8vY5Ieo07ephLtATKWY
 P2/JDn2F4c5uZPtudlGkRxmixg==
X-Google-Smtp-Source: ABdhPJxqFhDsb/GS5ATRJ1dE6t/BFvds0ofvMeomDoUgmoopjs8lj4GVNFEIhuceI6nxBgwZWdG7Tg==
X-Received: by 2002:a37:9e87:: with SMTP id h129mr1161317qke.276.1601919332852; 
 Mon, 05 Oct 2020 10:35:32 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id c13sm320627qtq.5.2020.10.05.10.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 10:35:32 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kPUOZ-00020z-L7; Mon, 05 Oct 2020 14:35:31 -0300
Date: Mon, 5 Oct 2020 14:35:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201005173531.GB5177@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <cb56763e-4fda-a783-03ae-7f749ec55981@nvidia.com>
 <CAKMK7uGzZ2dBe040vP1BJmQ7cuhj_OQHL0ncyz5XyUcb=bPjmg@mail.gmail.com>
 <f5130c7f-eebe-7b21-62b8-68f08212b106@nvidia.com>
 <20201003232441.GO9916@ziepe.ca>
 <CAKMK7uFjGDiWMD+KeEFziY-nqWy_FtCpn0rekb70yVLaxzJHjA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFjGDiWMD+KeEFziY-nqWy_FtCpn0rekb70yVLaxzJHjA@mail.gmail.com>
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 04, 2020 at 01:20:31PM +0200, Daniel Vetter wrote:

> Yeah I think that works. I tried understanding gup.c code a bit more,
> and it looks like FOLL_LONGTERM only works for the pup_fast variant
> right now? All others seem to have this comment that it's somehow
> incompatible with FAULT_FLAG_ALLOW_RETRY and daxfs. But grepping
> around for that didn't show up anything, at least not nearby dax code.
> For my understanding of all this, what's the hiccup there?

IIRC it needs the VMA and various other flows can't return the vma
list becuse they unlock the mmap_sem will running

> For plans, I only started this for a bit of my own learning, but I
> think I'll respin with the following changes:
> - convert exynos and habanalabs to pin_user_pages_fast directly,
> instead of going through this frame-vector detour

+1

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
