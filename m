Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F544AC979
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 20:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6EE10F8E5;
	Mon,  7 Feb 2022 19:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7982610F8EB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 19:27:32 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id t1so6828579qtq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 11:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BoyrZhI/SFo2F7HoszDIan4CMWU1RWbm6+Gl19zQGEA=;
 b=Ch8C10PSNgUgzrJSYUwNmUYPnK3KqD5nVzs8U25K8dQe5Nz0RHnqD34dfcVzOfHQn0
 Z7A2NrwTV3T8U5qAOPkdl18fdhCkDtt27sDhMF9az9KwL3bhZc1wWsNakacs8mHp4+2i
 ATHSdkH9LZE8z74Q7FsDuavDIliXPR3QE65Wv381+/ZcyQuEMN7ZFrlis4MW0UWFA66p
 hAq2I0gQh10LCJLc1hBJhl0b+SX/rRCFuGSDgkT7h5GKbOua68a4YV58mo6/qZ9LpsXw
 xHl/NBuQ1Pg3+hWr0zmMYM2z5/HBKY5RxkuejNX/FdePkUnSlgZKK24pt/x4bYmxOQsS
 FISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BoyrZhI/SFo2F7HoszDIan4CMWU1RWbm6+Gl19zQGEA=;
 b=xItnCFD0VJJ+7k6+qyPAY8Cf2Cdie8XiHbxBF1mFTMSCxLcTk74jSDCJC+ywe+OcSG
 WyjFVqxvPPrFVPJme1NuMetn7Ycg2lxpsH4H0SennrUEiXjLdy0PFC5jBjOQt75dA6gX
 +WkOWHkQ8QRwk4LD7AlaNuYp+Rosm/jFvPrFAisacLU2/EpWYMPYMi7zJ5Kpa8fhk71U
 euFW9U964fTGUynh9gDjTavJSay1QNLxEoN7AiL4h2A2u1edirs5RPTE4jQPlIBVB9kG
 ENR9LaIx+r0x4RjW+EH3HvD6EswPaMwQ8WHAqqctYQAu81IOa6ZBcEE6X4O4dnUIpwIr
 irKA==
X-Gm-Message-State: AOAM533e00dFDzUd7N2ccGD5Y7FH923Irff+f0qG/KySuOTGT2oLsopy
 OUankFMAhU9KJe15F/Y/bJ4OLQ==
X-Google-Smtp-Source: ABdhPJxE/dHX+9xmPplXl1VvJP7kBTi3tiLgJTGk2+Y/ZJni8J0n6I1+6ACqdKe2xRydNCRf+KVUww==
X-Received: by 2002:ac8:7ca4:: with SMTP id z4mr750427qtv.526.1644262051598;
 Mon, 07 Feb 2022 11:27:31 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id de15sm5546110qkb.107.2022.02.07.11.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 11:27:31 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nH9fe-000HwP-GM; Mon, 07 Feb 2022 15:27:30 -0400
Date: Mon, 7 Feb 2022 15:27:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/8] mm: move free_devmap_managed_page to memremap.c
Message-ID: <20220207192730.GE49147@ziepe.ca>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207063249.1833066-5-hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 07:32:45AM +0100, Christoph Hellwig wrote:
> free_devmap_managed_page has nothing to do with the code in swap.c,
> move it to live with the rest of the code for devmap handling.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/mm.h |  1 -
>  mm/memremap.c      | 21 +++++++++++++++++++++
>  mm/swap.c          | 23 -----------------------
>  3 files changed, 21 insertions(+), 24 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
