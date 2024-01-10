Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83030829DAA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 16:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7D910E5F8;
	Wed, 10 Jan 2024 15:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56A110E5F8;
 Wed, 10 Jan 2024 15:38:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C7291B81DBC;
 Wed, 10 Jan 2024 15:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B660C433C7;
 Wed, 10 Jan 2024 15:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1704901125;
 bh=64lqTH5iAcNgqPcOUhTjX1MTBLqxaK2xsqzvXQVWa98=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=12YLOq2msOrGh5ihkM0KYcAfSzQGt2JWuTC0DDJBK8ZQmLPKjhtXQ0oDaGj2TuisX
 oTdQV7wRT0kWu+/eQ/4aYSPU+na3UorE7axwiTiigCT/2G/sdmtTYry8mEY7bNk1BP
 ZvIMG1YRpOTjNG5aKANS7xGXt7wNQmbk9Ojb9B54=
Date: Wed, 10 Jan 2024 07:38:43 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: disable large folios for shmem file used by xfs xfile
Message-Id: <20240110073843.d663fa6610785a8611b2cebe@linux-foundation.org>
In-Reply-To: <20240110092109.1950011-1-hch@lst.de>
References: <20240110092109.1950011-1-hch@lst.de>
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, dri-devel@lists.freedesktop.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-sgx@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Chandan Babu R <chandan.babu@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Jan 2024 10:21:07 +0100 Christoph Hellwig <hch@lst.de> wrote:

> Hi all,
> 
> Darrick reported that the fairly new XFS xfile code blows up when force
> enabling large folio for shmem.  This series fixes this quickly by disabling
> large folios for this particular shmem file for now until it can be fixed
> properly, which will be a lot more invasive.
> 

Patches seems reasonable as a short-term only-affects-xfs thing.

I assume that kernels which contain 137db333b29186 ("xfs: teach xfile
to pass back direct-map pages to caller") want this, so a Fixes: that
and a cc:stable are appropriate?

