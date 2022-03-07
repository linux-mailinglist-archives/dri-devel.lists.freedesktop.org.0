Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE8B4D0334
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813F410E03D;
	Mon,  7 Mar 2022 15:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B8B10E03D;
 Mon,  7 Mar 2022 15:44:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E65C3614BB;
 Mon,  7 Mar 2022 15:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0485DC340E9;
 Mon,  7 Mar 2022 15:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646667898;
 bh=U0RuGnkHGZSN7rcOCs7fzKl6Y7/Lp0fhUWcoOUZcq5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ij3eAcL4q9iwJKBYHI831XyC2X3aweJTDGKv6pq1qYjqFEHhsWcwvpfB4x74p7jeI
 jFVHLTLY/v/fHZGjI13dQeb/stTFMTUwwewrvRGShRnmRMpzfD4CzTq8UH75DJsGDx
 r0WKa4OnhjgUMOWB7xEGpUJBcf8WpA6K0sJJ9iRggWFEXACaqjHBng5aBZAJw4w+KM
 Ar3x3Ce8iUywGtRo6BWM6TWzj4MetT1f1Ul5K0nGGW0FPta87KPXS8vPUoHbgrrlsy
 Iq/eaXjutkywtcI/65tVlISD1sXTttoZX4PxUOO0P8p65u7DT9fjliaLz36kMGk1pb
 203t6MtlONLhA==
Date: Mon, 7 Mar 2022 17:44:17 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH RFC v2] mm: Add f_ops->populate()
Message-ID: <YiYoUfYuTDsld6L0@iki.fi>
References: <20220306032655.97863-1-jarkko@kernel.org>
 <20220306152456.2649b1c56da2a4ce4f487be4@linux-foundation.org>
 <c3083144-bfc1-3260-164c-e59b2d110df8@intel.com>
 <YiXsJRE8CWOvFNWH@iki.fi>
 <3c974f25-ece6-102b-01c3-bd7e6274f613@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c974f25-ece6-102b-01c3-bd7e6274f613@intel.com>
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
Cc: codalist@telemann.coda.cs.cmu.edu, jaharkes@cs.cmu.edu,
 Nathaniel McCallum <nathaniel@profian.com>, linux-unionfs@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Reinette Chatre <reinette.chatre@intel.com>, linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 07:29:22AM -0800, Dave Hansen wrote:
> On 3/7/22 03:27, Jarkko Sakkinen wrote:
> > But e.g. in __mm_populate() anything with (VM_IO | VM_PFNMAP) gets
> > filtered out and never reach that function.
> > 
> > I don't know unorthodox that'd be but could we perhaps have a VM
> > flag for SGX?
> 
> SGX only works on a subset of the chips from one vendor on one
> architecture.  That doesn't seem worth burning a VM flag.

What do you think of Matthew's idea of using ra_state for prediction?

BR, Jarkko
