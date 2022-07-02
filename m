Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7428563E68
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 06:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C76A1127B6;
	Sat,  2 Jul 2022 04:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873C01127B6;
 Sat,  2 Jul 2022 04:25:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C301E608C3;
 Sat,  2 Jul 2022 04:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C8EC34114;
 Sat,  2 Jul 2022 04:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1656735952;
 bh=CnLxEWfEVwpNoTxWsiwQ1LQuKst+72BKDbjbXAesDa4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LQCMYCHDQR6Snh03VJXykPrYGM58AdpZzxwBcPzIoKS+eBA9CKb8Ndukm4D2HfPUa
 i4yAErDdhscv7vlgetKrJZ7oiJZp8dU98i+LE/12HMErHBMVVau0tOR8gyM7ntkFIH
 yJLFkEd0F9svS2uuJzXBntMgT6QOg+GCbOO/3Vn8=
Date: Fri, 1 Jul 2022 21:25:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v7 01/14] mm: rename is_pinnable_pages to
 is_pinnable_longterm_pages
Message-Id: <20220701212551.7198162dbd65746a69bc41b4@linux-foundation.org>
In-Reply-To: <49315889-96de-8e41-f8ee-dd5b33c5e1db@redhat.com>
References: <20220629035426.20013-1-alex.sierra@amd.com>
 <20220629035426.20013-2-alex.sierra@amd.com>
 <f00f9c93-c115-d222-dc8c-11493ccd2567@redhat.com>
 <575b48a6-e372-acda-9a7c-449f307a588c@amd.com>
 <49315889-96de-8e41-f8ee-dd5b33c5e1db@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix Kuehling <felix.kuehling@amd.com>,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Jun 2022 00:15:06 +0200 David Hildenbrand <david@redhat.com> wrote:

> On 30.06.22 00:08, Felix Kuehling wrote:
> > On 2022-06-29 03:33, David Hildenbrand wrote:
> >> On 29.06.22 05:54, Alex Sierra wrote:
> >>> is_pinnable_page() and folio_is_pinnable() were renamed to
> >>> is_longterm_pinnable_page() and folio_is_longterm_pinnable()
> >>> respectively. These functions are used in the FOLL_LONGTERM flag
> >>> context.
> >> Subject talks about "*_pages"
> >>
> >>
> >> Can you elaborate why the move from mm.h to memremap.h is justified?
> > 
> > Patch 2 adds is_device_coherent_page in memremap.h and updates 
> > is_longterm_pinnable_page to call is_device_coherent_page. memremap.h 
> > cannot include mm.h because it is itself included by mm.h. So the choice 
> > was to move is_longterm_pinnable_page to memremap.h, or move 
> > is_device_coherent_page and all its dependencies to mm.h. The latter 
> > would have been a bigger change.
> 
> I really don't think something mm generic that compiles without
> ZONE_DEVICE belongs into memremap.h. Please find a cleaner way to get
> this done.

(without having bothered to look at the code...)

The solution is always to create a new purpose-specific header file.
