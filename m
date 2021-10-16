Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78AE4303CC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 18:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7117E6E479;
	Sat, 16 Oct 2021 16:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958D56E479;
 Sat, 16 Oct 2021 16:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=m+/01TelQmBNfXwVuV7nEanECorZjkMuzOgfdURTYOY=; b=RiRE9VN0tHQNnKKD3WDLCfF35k
 Phk7aInITfjVIkSQvFG5WBTWm/unqkCV22YezdmuSKtqozr/taMnHwqUjEZrPFjQvQmIHY9n6HGVI
 NJMhYQTIc3vVguttckPiHomY80SABnb6NivaD4idfe7Lj3NHeG9YJSolkKBoTnMPUZ9KwzGAZFr4k
 PcJC+TDuVe3RJntjG7APQ99AQ9QJqSUIsy9ti9jNNq8FXSYLd1t7m7RXtx2szXlSjC5bzq/h1x4ba
 AIShMuky2bDx3M2Ssjj7llkdqYvP09vclZm9aOaYV7ukLdOZ6rtx4tRemA7HXBJMlQgsVaBNdwrVu
 UpKiUVgw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mbmiJ-009mGF-Tq; Sat, 16 Oct 2021 16:39:22 +0000
Date: Sat, 16 Oct 2021 17:39:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Alex Sierra <alex.sierra@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, Linux MM <linux-mm@kvack.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 linux-ext4 <linux-ext4@vger.kernel.org>,
 linux-xfs <linux-xfs@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Linux NVDIMM <nvdimm@lists.linux.dev>
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
Message-ID: <YWsAM3isdPSv2S3E@casper.infradead.org>
References: <20211014153928.16805-1-alex.sierra@amd.com>
 <20211014153928.16805-3-alex.sierra@amd.com>
 <20211014170634.GV2744544@nvidia.com>
 <YWh6PL7nvh4DqXCI@casper.infradead.org>
 <CAPcyv4hBdSwdtG6Hnx9mDsRXiPMyhNH=4hDuv8JZ+U+Jj4RUWg@mail.gmail.com>
 <20211014230606.GZ2744544@nvidia.com>
 <CAPcyv4hC4qxbO46hp=XBpDaVbeh=qdY6TgvacXRprQ55Qwe-Dg@mail.gmail.com>
 <20211016154450.GJ2744544@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016154450.GJ2744544@nvidia.com>
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

On Sat, Oct 16, 2021 at 12:44:50PM -0300, Jason Gunthorpe wrote:
> Assuming changing FSDAX is hard.. How would DAX people feel about just
> deleting the PUD/PMD support until it can be done with compound pages?

I think there are customers who would find that an unacceptable answer :-)
