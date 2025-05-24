Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D36AC2F4F
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 13:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CAA10E021;
	Sat, 24 May 2025 11:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OjhpC6Wc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97DF10E021;
 Sat, 24 May 2025 11:17:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7EA46436A4;
 Sat, 24 May 2025 11:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC8AC4CEE4;
 Sat, 24 May 2025 11:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748085435;
 bh=gT+tC+6GvrzwwWH+YFzopHjIki5BkkGoo/QhMIcWSOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OjhpC6WcpIYjQ96mWxLNh6+M/amk7/V/tlMJZyfsZDwem+QIJaCe7mQU3pUS3LW/f
 EZn6o07RBM3Ejg6duhb/ZZ/+YkOPZz6d+1O7zWG3CRijdIIAFLTSnjpFrgfczC1q6Z
 8X0Z99MvZgz1UZ/lz+lN0nQaCxfxf7UHImfHT13dsps9lHHIfes6ipAZ23qPNbqDfl
 sDdiatGJaCDuEWof5iKrrE7TcGtznkuywhAqi2uyv/hgCi0sdc7Ub6lHyunQM6FL3e
 Um0EAEMBcbghqQ/S+ykEuZcGLQez8+WiMP5/TYM/dL/UCEDw7X7U+pfJPIKEQ9jo59
 VtVbusoI3Dnsw==
Date: Sat, 24 May 2025 13:17:11 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: tursulin@ursulin.net, phasta@mailbox.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
Message-ID: <aDGqt0jERFlU42J6@pollux.localdomain>
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
 <aDCCF0JFhO7lR2VJ@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDCCF0JFhO7lR2VJ@cassiopeiae>
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

On Fri, May 23, 2025 at 04:11:39PM +0200, Danilo Krummrich wrote:
> On Fri, May 23, 2025 at 02:56:40PM +0200, Christian König wrote:
> > +	if (xas_nomem(&xas, GFP_KERNEL)) {
> > +		xa_lock(&job->dependencies);
> > +		goto retry;
> 
> Please don't use a goto here, if we would have failed to allocate memory here,
> this would be an endless loop until we succeed eventually.

I think I got confused by xas_nomem() returning true meaning that memory was
needed and was successfully allocated (which can be a bit counterintuitive).

So, your code here should be correct. However, I'd still remove the goto and
just call xas_store() again. There's no reason to make this a loop and backwards
goto is better avoided anyways. :)
