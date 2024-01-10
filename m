Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA900829A7B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 13:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6126010E5DE;
	Wed, 10 Jan 2024 12:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C582D10E5D6;
 Wed, 10 Jan 2024 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mD6sHMBYmecsugPR+rqNjdttLVO7dQDyLXBJHfA3g1Q=; b=OjdQmEOL6PU8ZoQsQV89vQU3uy
 xumb/fUI9PdT0ruLFWenL+EFY/R95394WPxc2QNSa6b9+lhiCqIZBbDzz//DCiBhiXjxszhvGAjZK
 lubqlfezkUxprHvhWFewYjO8MlMwV/8XU0qiMYiHWdWD93q+pm7cSJGaTmC7UhcepH6pQkziFJBwT
 9zlq4Vm18d/8ENBIIzB64LPPMc7hWRT75a4nD8cKTMDPldLhwu7kCijfcbGe6gCKSr4DmF4rMUVR+
 Z9wPq2/O0uuD9eCs7CXUPNcsIOiJH5ON+eRuVhc1opSoEH66EZS2OkOq4FbVIvqfaCEG4y3+dTzRO
 HZY7dWJg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1rNXpe-00BQ5T-V6; Wed, 10 Jan 2024 12:37:18 +0000
Date: Wed, 10 Jan 2024 12:37:18 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: disable large folios for shmem file used by xfs xfile
Message-ID: <ZZ6Pfk8tLXbvs4dE@casper.infradead.org>
References: <20240110092109.1950011-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110092109.1950011-1-hch@lst.de>
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
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-sgx@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Chandan Babu R <chandan.babu@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 10:21:07AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> Darrick reported that the fairly new XFS xfile code blows up when force
> enabling large folio for shmem.  This series fixes this quickly by disabling
> large folios for this particular shmem file for now until it can be fixed
> properly, which will be a lot more invasive.
> 
> I've added most of you to the CC list as I suspect most other users of
> shmem_file_setup and friends will have similar issues.

The graphics users _want_ to use large folios.  I'm pretty sure they've
been tested with this.  It's just XFS that didn't know about this
feature of shmem.
