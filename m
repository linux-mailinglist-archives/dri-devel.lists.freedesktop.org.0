Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4064EAD85D9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 10:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184DE10E8FD;
	Fri, 13 Jun 2025 08:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qoIG0p8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778D310E2B0;
 Fri, 13 Jun 2025 08:42:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F250D6113B;
 Fri, 13 Jun 2025 08:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA6EC4CEEB;
 Fri, 13 Jun 2025 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749804144;
 bh=KXRSR1wQeLU58A3wUt/V+UwL406ER2CjT55ZE1Y4+Yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qoIG0p8v8QeyMMSIYMO4C36MTcz2snMv22ynE3xIOXzsxryRyOhsguqPJ8E1JZneO
 SBiVFqxMto6c7LyRDMTQa9rxzO2Jvkuk8lN+uRQCAcRuXvQ1lRwsB+ul/eFvkURuLV
 c5y/e5FwaG76M1Ygf8lUtQYC3i68DL0tbQFmYKFe9DkgNmP68sePs2h9CEWz4i/8TV
 lDjMaj/bmxy/fskSC+7RMmIocTfQPFysQDZcXu1e+TFCxIHMYZpXIizjal4/G1sj/q
 /KrbNOfkj+WfrAN45KmuU0+zWYrlXqfpTJSKFHnuET/nMdoi025B36eH/n/okDTKND
 +YWy49gvjLeGQ==
Date: Fri, 13 Jun 2025 10:42:20 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
Message-ID: <aEvkbKGaZD2NQggd@pollux>
References: <aEmR9420vj-ISz-W@cassiopeiae>
 <dc661205-1e5b-4697-863b-36a299365219@amd.com>
 <aEmcpsXwS8dLNGUg@cassiopeiae>
 <5f71cfd0-fd38-491c-8255-bdd3e0fb19dc@amd.com>
 <aEtnS6kvh1mssFTb@cassiopeiae>
 <099816b4-0b7b-4ac7-9bb5-22f23b1db7b7@amd.com>
 <a495f31526f19457f44d502cf2de98ab0de33383.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a495f31526f19457f44d502cf2de98ab0de33383.camel@mailbox.org>
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

On Fri, Jun 13, 2025 at 10:29:35AM +0200, Philipp Stanner wrote:
> Shouldn't the xarray be used nowadays for ID allocation? I think
> idr_alloc_cyclic() (ida_alloc_cyclic() doesn't exist) is just a wrapper
> around the xarray anyways.

Yes, IDR is basically xarray under the hood. But, a raw xarray (or IDR) is
unnecessary overhead, since we don't need to store pointers.

While IDA also uses xarray under the hood, it does perform some tricks to
provide only ID numbers, but much more efficiently.

Given that there's no ida_alloc_cyclic(), the atomic is probably fine, even
though, ida_alloc_cyclic() doesn't sound like a bad idea to add in general.

But maybe it's difficult due to some of the optimization tricks IDA performs.

I think we should stick to the atomic for now, but add a proper API to reserve
kernel IDs.
