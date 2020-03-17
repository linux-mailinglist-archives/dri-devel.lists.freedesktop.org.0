Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D50B18871F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715E56E17D;
	Tue, 17 Mar 2020 14:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F224889E4C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 12:15:39 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id l20so17124241qtp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 05:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=embLdYCC+n7Oc9s6Q8ZHyjDJLIa4kBbr1h9BCOMYbH4=;
 b=SQzUEb66s7EkVHhGjTvINACKhElAAylB3fP+JIE5uJtINxUSWP+viORRExV6sx6htD
 HpVjFFlfhYosV5Dtv6arQkz6yiV2Baf2i4b1LfAOirqSi7orDhzKcNalylzPx3FE1iin
 oP+wLU4hopi4dKyJTpvXWz51qQrzPAGcS4kKz84+9KAoAC2yW49o3KG6agUJaN37k6yK
 HuepGzVyNECsPyMpp1CtLxq1h9Taueop5kQtr0Zv8iKdXRs41vSS5Kb4H/Sh9sxSVbBi
 Mn9h5qwb5Z+4eSnt+xfXYW9HjJYHq+hghoj++xGbpVpzLV1xGx/h/5X4aTndQ1jk78Xd
 Y1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=embLdYCC+n7Oc9s6Q8ZHyjDJLIa4kBbr1h9BCOMYbH4=;
 b=liOhLOYFLsO83tAHa1PRtETfmYJXee8Pk+Sed7oog0G7pLFGINEU+402tziTPsv9PQ
 H4xWVXeE+5rdl59Idx7NqLCgwFvQAiTvo6uL1vxoWi6xdTsdTfdGrYJcoiHWG+8Nlp/y
 Njqd1NbHgJM7ZpQKu3pI0YZxRwytA6xitTMJiuzG3wD+OHtZ9/+rm/yJ7ar6lpO3muJP
 G4g3Crv0+FaT3DFDi3Cc0wlvxaDel+synzuZsqCHf9kVcNOaC0Ses2QpyVTTD8npfuhT
 DGv1pLB/Iuq2pQpYLRuYuf+5+117iGrnj0cFeyR0tlp9+jn8qWQJZI1mK9/VrQggQIMN
 yLuw==
X-Gm-Message-State: ANhLgQ2gpQgi4WS3Ta3JPtTd1rrohipb+x3BxLi7eGyp+z5FsLkgFdd1
 CIq0ODZlC0+Sb7UIPtv2AXmwpA==
X-Google-Smtp-Source: ADFU+vsrbs1FMDMvrBo9cu5QRVB0IZzDlkTw1XDG3EBbGMsL3EdtYUQXQDIyFHCwplMScIrZT+xPIg==
X-Received: by 2002:aed:2ba2:: with SMTP id e31mr4988796qtd.286.1584447338651; 
 Tue, 17 Mar 2020 05:15:38 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id k13sm2042705qtm.11.2020.03.17.05.15.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 Mar 2020 05:15:38 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jEB8C-00012L-NV; Tue, 17 Mar 2020 09:15:36 -0300
Date: Tue, 17 Mar 2020 09:15:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Message-ID: <20200317121536.GQ20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
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
 Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 03:49:51PM -0700, Ralph Campbell wrote:
> 
> On 3/16/20 12:32 PM, Christoph Hellwig wrote:
> > Remove the code to fault device private pages back into system memory
> > that has never been used by any driver.  Also replace the usage of the
> > HMM_PFN_DEVICE_PRIVATE flag in the pfns array with a simple
> > is_device_private_page check in nouveau.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Getting rid of HMM_PFN_DEVICE_PRIVATE seems reasonable to me since a driver can
> look at the struct page but what if a driver needs to fault in a page from
> another device's private memory? Should it call handle_mm_fault()?

Isn't that what this series basically does?

The dev_private_owner is set to the type of pgmap the device knows how
to handle, and everything else is automatically faulted for the
device.

If the device does not know how to handle device_private then it sets
dev_private_owner to NULL and it never gets device_private pfns.

Since the device_private pfn cannot be dma mapped, drivers must have
explicit support for them.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
