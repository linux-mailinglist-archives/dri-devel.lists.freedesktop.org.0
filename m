Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15166394D04
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 17:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB446E21D;
	Sat, 29 May 2021 15:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226436E21D
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 15:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id A08B93FB76;
 Sat, 29 May 2021 17:48:18 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="U/Pvy1HU";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8qfUu4CKAzR; Sat, 29 May 2021 17:48:17 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 6DA823FB62;
 Sat, 29 May 2021 17:48:17 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D3A993600DD;
 Sat, 29 May 2021 17:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622303296; bh=PaRU1HGhApkHFd3OFTsufrjsd0SEE817yTgmp52knMU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=U/Pvy1HU3+J6xu8myfRVdxint2pg0/H9Jl0MhTsrbGGKpCar6g7VpA0CGfzippHck
 zlMKx7vA9Gr1Hlby05URURvL/oK2cXZYQF2IeWmaUcZGK+/Rb4xE0MPHibkPdHDGE0
 HmHyQuyNFfw6LrzPgVmj/kJhseyfokw8O4Ie/444=
Subject: Re: [PATCH 06/13] drm/ttm: flip over the range manager to self
 allocated nodes
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210430092508.60710-1-christian.koenig@amd.com>
 <20210430092508.60710-6-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <f792308b-389d-67da-0cf8-667c1e6ac96d@shipmail.org>
Date: Sat, 29 May 2021 17:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210430092508.60710-6-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: daniel.vetter@ffwll.ch, matthew.william.auld@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christian,

On 4/30/21 11:25 AM, Christian König wrote:
> Start with the range manager to make the resource object the base
> class for the allocated nodes.
>
> While at it cleanup a lot of the code around that.

Could you briefly describe the design thoughts around this. While it's 
clear to me that we want separately allocated struct ttm_resource 
objects, it's not clear why the visibility of those are pushed down the 
interfaces to the range managers?

In addition to the need for a separately allocated struct ttm_resource, 
when looking at TTM-ify i915 I've come across a couple of problems.

1) People have started abusing the range manager interface to attach 
device private data to the mm_node, or probably really to the struct 
ttm_resource. That makes it very unclear what the input needed for the 
managers really are. For examle what members of the bo does the range 
manager really use and why? Same for the struct ttm_resource. I think in 
a perfect world, the interface to these range managers should be a 
struct ttm_placement as input and as output an opaque mm node and 
perhaps a way to convert that mm node to something useful like a range 
or a scatter-gather table.

2) But that doesn't really address the problem of drivers wanting to 
attach device private data to a struct ttm_resource, which at some point 
caused someone to add a bo to the manager interface. The novueau driver 
attaches a "kind" member to the mm node that it pulls out of the bo; The 
i915 driver would want to cache an st table and a radix tree to cache 
index-to-pfn maps.

3) In the end we'd probably want the kmap iterator methods and the 
various mapping funtions to be methods of the struct ttm_resource.

So basically here

1) Would help making range managers with various functionality simple to 
write and share.
2) Would help drivers attach private data to a struct ttm_resource 
without abusing the manager interfaces,
3) Would help clean up the mapping code.

But at least 2) here would probably mean that we need a driver callback 
to allocate a struct ttm_resource rather than having the managers 
allocate them. Drivers can then embed them in private structs if needed.

Or is there a way to achieve these goals or something similar with the 
approach you are taking here?

Thanks,

Thomas



