Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A774AC95A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 20:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9119910F848;
	Mon,  7 Feb 2022 19:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C6E10F848
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 19:22:44 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id l14so542573qtp.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 11:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yHQiDHxA3qZlcWTxLN1MgZypNnbjTwUZO2QoeiWP/cI=;
 b=WalR+vjdCg+8zPlO5aZ1ywuN+woRsi3gerM9e8um5R75M05o/0A4tTPV0sDoS0iLf7
 MI5Ayh/aUjA3lzGk4knlGcpvrjJkTAzgzCaIVUlu2cLGGSbDhpJ/GrhJhUdc2HnXtmRK
 stuNg7sUYxLt5HQjP/PwyCP9ZRninXNxW8lX4+8vi6VkUSLgg5BY3Jxg39rH3WH2BDNx
 g9rpWqR/RtcR0wf2poNmSVgkhRnSCPEG3oCgynxbJlts+OBBSOpC9atYeDDQCpJbBHmV
 OdyYF8TiYTFFifPNOFO5hE7XJgkPbqKroSw//vj0hDKtL6BLQKT8a9/Jd8uxBZMUHGVb
 3Hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yHQiDHxA3qZlcWTxLN1MgZypNnbjTwUZO2QoeiWP/cI=;
 b=hI2r4EIUbmu41s86hiEPsLapQDwgqGqHlh6OuXEW6O928/1PEm8VZRIFT0NNT3E2V6
 rm/FDXVAzHFuRC4kkfsOdLCg4m0SkquY6Xcfk7ph4hwNGBcSoERwXiKSIYmgywtfP/0i
 eR2tJ1w1I/135D4SLdfIaqSPxdz9stm/aV9jJMZsttpoX6ogAG2fNNCN0rF/FrUbBijC
 xGr3nGDGOOOFCS2BIOAIviEeGrb4m3czBg7Z6u/5m9SNoeGcpCbNCkQPOsSCDMEf4wjm
 2f3S9po+KQ9/OESKit7iy+ezLvu+4Z9luXxx0YqJyJVFxTDuOOziBGSNVIWA352iha28
 z4+w==
X-Gm-Message-State: AOAM532ntdc9VHebQH+2JLfnNYCqInklJnUnoBE24CjOpfob+fEEr+JB
 OpS/oycCTGSH9/EiTM11uJINrg==
X-Google-Smtp-Source: ABdhPJyusc4Y6UBxGsOMvrtpT2MH3zTc6ABg/OaP0sDSZntIjW01XzJV/gLuVV8p/6/141fWu3yUUA==
X-Received: by 2002:a05:622a:1303:: with SMTP id
 v3mr740294qtk.294.1644261763197; 
 Mon, 07 Feb 2022 11:22:43 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id y5sm5930001qkp.37.2022.02.07.11.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 11:22:42 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nH9b0-000HrC-2F; Mon, 07 Feb 2022 15:22:42 -0400
Date: Mon, 7 Feb 2022 15:22:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/8] mm: remove a pointless CONFIG_ZONE_DEVICE check in
 memremap_pages
Message-ID: <20220207192242.GC49147@ziepe.ca>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207063249.1833066-2-hch@lst.de>
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

On Mon, Feb 07, 2022 at 07:32:42AM +0100, Christoph Hellwig wrote:
> memremap.c is only built when CONFIG_ZONE_DEVICE is set, so remove
> the superflous extra check.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/memremap.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
