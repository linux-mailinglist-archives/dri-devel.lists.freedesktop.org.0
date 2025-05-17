Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09D3ABA9B5
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 13:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C786C10E0F6;
	Sat, 17 May 2025 11:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QmKnm8rM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFA110E0F6
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 11:32:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D9E1361127;
 Sat, 17 May 2025 11:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E761DC4CEE9;
 Sat, 17 May 2025 11:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747481515;
 bh=xjvMDCx8i9vBvCJr0E6wUxIHogd0KLquBF6x0OZC2bk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QmKnm8rMEn6iNLXPb0AjNCRHcGTn2+JEyGd0XAj50THBKS+/0yHMTpVvM/laPonBB
 E4jStq57sc9gG35/dJyvXND1PBVWneo/ruNoq4Qx91XKTK/+fZGGV2MK20MtlxW/Fh
 j6+S0wMXnVmMR/APmKwnRYyLjyx0R9skfwX39O9AhXcnttpyav5Eh3yWvPGiNOydS3
 GAPMxSohUfEaDSoCIodosprPI1o1aIPbfweHGjdHRElWLldMc8adSbx7no381C8CQb
 X/S/x7ATtRfdwz70rIMPVh4g+d98IOW/6mHlS0GkNu6Fk0vlT7t2+y7nCGClHj1Qw5
 /X3ETq51iqrVw==
Date: Sat, 17 May 2025 13:31:49 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v2 0/4] rust: drm: gem: More (and final) cleanup
Message-ID: <aChzpeMfDvxQsFb-@pollux>
References: <20250516171030.776924-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516171030.776924-1-lyude@redhat.com>
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

On Fri, May 16, 2025 at 01:09:15PM -0400, Lyude Paul wrote:
> Look mom, no generic soup!
> 
> Anyway - this is just the last of the cleanup stuff I ended up while
> working on cleaning up the gem shmem patch series. It simplifies the use
> of generics and also adds a type alias for some very long types
> currently in use. Also, drop one unused constant I noticed.
> 
> Applies on top of nova/nova-next:
>   https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next
> 
> Lyude Paul (4):
>   rust: drm: gem: Simplify use of generics

This rework breaks nova-drm, which, given that this series either needs to land
in nova-next or (which is much more likely) targets v6.17 merge window, needs to
be fixed in this series.

>   rust: drm: gem: Add DriverObject type alias
>   rust: drm: gem: Add ObjectFile type alias
>   rust: drm: gem: Drop Object::SIZE
> 
>  rust/kernel/drm/gem/mod.rs | 102 ++++++++++++++++---------------------
>  1 file changed, 44 insertions(+), 58 deletions(-)
> 
> 
> base-commit: 38cb08c3fcd3f3b1d0225dcec8ae50fab5751549
> -- 
> 2.49.0
> 
