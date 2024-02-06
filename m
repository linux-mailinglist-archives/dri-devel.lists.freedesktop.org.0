Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E393684BFFE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 23:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1D6112EE3;
	Tue,  6 Feb 2024 22:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="d4DsACTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7E7112EE3
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 22:25:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 42333CE1742;
 Tue,  6 Feb 2024 22:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA06C433C7;
 Tue,  6 Feb 2024 22:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1707258351;
 bh=WU3x0zIeoP6xyUMyTVcnpXfLJrwhP5APoHffIvSjMFQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d4DsACTSy8TyyqJS3vN1FDuQFelfApE/DdBxnrCS9iPQH/Zy2u6zE1d/W0TvEFZgi
 hoUTECZ7LJ2xfiTR0yzszUXCmhASl9nJ4P93wMC8/fqYcIpm5LEckg8nQ6/LDkUM+m
 00qmGUqbRWbeJh/vyhvDo7YkU+xeniPBDG52Rxi4=
Date: Tue, 6 Feb 2024 14:25:50 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/cma: Drop cma_get_name()
Message-Id: <20240206142550.62bed7715692ddc0071da7d0@linux-foundation.org>
In-Reply-To: <20240206041518.438801-1-anshuman.khandual@arm.com>
References: <20240206041518.438801-1-anshuman.khandual@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  6 Feb 2024 09:45:18 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> cma_get_name() just returns cma->name without any additional transformation
> unlike other helpers such as cma_get_base() and cma_get_size(). This helper
> is not worth the additional indirection, and can be dropped after replacing
> directly with cma->name in the sole caller __add_cma_heap().

drivers/dma-buf/heaps/cma_heap.c: In function '__add_cma_heap':
drivers/dma-buf/heaps/cma_heap.c:379:28: error: invalid use of undefined type 'struct cma'
  379 |         exp_info.name = cma->name;
      |                            ^~

Fixing this would require moving the `struct cma' definition into
cma.h.  I don't think that's worthwhile.

