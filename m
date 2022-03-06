Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8064CE878
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 04:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D091C10EA3B;
	Sun,  6 Mar 2022 03:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1EB10EA3B;
 Sun,  6 Mar 2022 03:21:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1EB81B80C0A;
 Sun,  6 Mar 2022 03:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDEFC340F3;
 Sun,  6 Mar 2022 03:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646536912;
 bh=REVJSPu0LMK0qtybGjVcYKrtnj1nArD7KxhlEeXpL5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FLMwT+NpOuEP0vOHJMxtaQQCN/mZaYJMCmAdZvyES6nO1Jm9Au4J35+ADH3prFkmM
 ZsC2YEFVN7imDE5s5m8f6PyDIVn26Y6IqFvrL83GF/k/fzjXYe3wb03jR5BRTgcRrr
 GplpnIQyNciooTCOdLNEMZ4J6FdjftAAzxXYLvLg5JuVN5xalRzaVfVDXNYEjymA2u
 G39goguDmEepx6hgQ/mKOml4CV+xaHXfjnm/O86YxVDqFDzM3UK9bjFVdOxTUxUeu7
 yImes0TPKrEI4GAgeKyN+EY3e+9oLaGDV0HhAbva7R4LTpTZ+3MuNkaM5Do/Q61952
 YLB3lWUFpmNpQ==
Date: Sun, 6 Mar 2022 05:21:11 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFC] mm: Add f_ops->populate()
Message-ID: <YiQop71ABWm7hbMy@iki.fi>
References: <20220306021534.83553-1-jarkko@kernel.org>
 <YiQjM7LdwoAWpC5L@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiQjM7LdwoAWpC5L@casper.infradead.org>
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
Cc: Nathaniel McCallum <nathaniel@profian.com>, linux-unionfs@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Reinette Chatre <reinette.chatre@intel.com>, codalist@coda.cs.cmu.edu,
 linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 06, 2022 at 02:57:55AM +0000, Matthew Wilcox wrote:
> On Sun, Mar 06, 2022 at 04:15:33AM +0200, Jarkko Sakkinen wrote:
> > Sometimes you might want to use MAP_POPULATE to ask a device driver to
> > initialize the device memory in some specific manner. SGX driver can use
> > this to request more memory by issuing ENCLS[EAUG] x86 opcode for each
> > page in the address range.
> > 
> > Add f_ops->populate() with the same parameters as f_ops->mmap() and make
> > it conditionally called inside call_mmap(). Update call sites
> > accodingly.
> 
> Your device driver has a ->mmap operation.  Why does it need another
> one?  More explanation required here.

f_ops->mmap() would require an additional parameter, which results
heavy refactoring.

struct file_operations has 1125 references in the kernel tree, so I
decided to check this way around first. 

BR, Jarkko
