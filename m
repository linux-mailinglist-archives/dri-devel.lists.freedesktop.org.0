Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1444DAC3E5E
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 13:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A2510E2A6;
	Mon, 26 May 2025 11:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iMrEfU1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470F110E322;
 Mon, 26 May 2025 11:14:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F80C5C5FD7;
 Mon, 26 May 2025 11:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940CDC4CEE7;
 Mon, 26 May 2025 11:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748258079;
 bh=x08+t9ZNZo5ns82lQJEAr/AqzJKE1dOrTbvfqHay+W4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iMrEfU1G8yMK/f9vQenf0mefZDcESsRRMRzA28ZJ9wJf2BGIvfiVqps/dncFiG/Ii
 MbCzQGBZmrNOa3t7R9/Ie60dcuiEB3oLdVSpi5P/qKPW619R+L43fZUoYC/VpUiMKt
 l91fXG0WZqMbhWvpzZwVtMbPMO164UY1eDZo+n0JRtSuRLUEgICyLUPctxaioyKYRn
 roVmyRzPlgok39qAOe1cMFPRdtzZJgicvYH28iRi1w0rqZelzff87loJaqKrvIKlYZ
 TrANSvLXaxYler2q2bl/IMN6Dct4p60qxzFhu4Jrq+bDMyKfmp4hoXd+86q6QqTRT0
 ebI+8dcdMjmSA==
Date: Mon, 26 May 2025 13:14:34 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 i@cassiopeiae
Cc: tursulin@ursulin.net, phasta@mailbox.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
Message-ID: <aDRNGnPjmFDwzPOR@cassiopeiae>
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
 <aDCCF0JFhO7lR2VJ@cassiopeiae>
 <aDGqt0jERFlU42J6@pollux.localdomain>
 <9ee10cc3-733b-4d64-b396-28e62c631dc4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ee10cc3-733b-4d64-b396-28e62c631dc4@amd.com>
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

(Cc: Matthew)

Let's get this clarified to not work with assumptions. :)

On Mon, May 26, 2025 at 12:59:41PM +0200, Christian König wrote:
> On 5/24/25 13:17, Danilo Krummrich wrote:
> > On Fri, May 23, 2025 at 04:11:39PM +0200, Danilo Krummrich wrote:
> > So, your code here should be correct. However, I'd still remove the goto and
> > just call xas_store() again. There's no reason to make this a loop and backwards
> > goto is better avoided anyways. :)
> 
> 
> I was considering that as well, but than abandoned this idea. The xarray() sample code and test cases as well as the use cases where I took a look either use a loop or a goto.
> 
> I'm not 100% sure why, my suspicion is that you need the loop when there can be concurrent add/remove operations on the xarray, but I think we should stick with the common approach.

I don't think that concurrency is relevant here. xas_nomem() stores the
allocated memory in the XA_STATE structure, which is on the stack.

I know that for maple tree a pre-allocation is only valid for the exact state
of the tree it was allocated for.

But I think xarray does not have this limitation, i.e. concurrent modification
of the xarray does not invalidate an xas_nomem() allocation in terms of being
sufficient for a subsequent store.

@Matthew: Can you clarify this please?
