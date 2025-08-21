Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C084B2F8F4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA78A10E98B;
	Thu, 21 Aug 2025 12:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vEYLpKmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E9510E985;
 Thu, 21 Aug 2025 12:55:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BEB1661154;
 Thu, 21 Aug 2025 12:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4077C4CEEB;
 Thu, 21 Aug 2025 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755780909;
 bh=uOEZ+WrgBeI7diT8YOQYePsMVi/6BPeIL2bBCWmNYcY=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=vEYLpKmoWuEWj4x+UO6eLhoLe6ayPI7gxh5eZgjn4Lj8c7VP4lIsOS3bb8SWkfota
 jdEUL4lxtgGLNal82QTk8c882/lm5dJVyKQtWNiooof3MHsHlUzij7Ptkb0z0fKZ4p
 1jXY0nnQhwcHmIAlhU4FHXRn2iS6tTMJxaD483uo6ELEAqBalK4U52E4ErZepoJAiI
 /S0IAOCCqqq9PddHhwYIbs5UelzjB9ZIDVDbcF8dUMWXgfsdzP6d+27qGUEFnNAZrR
 55RJFnUC1iG68Srx17RAiD/ywqQcn9VxlWzb5+tjVMXJ0nFreHu3lsvnEPk+DacjPz
 ODzYPiKN9u52Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Aug 2025 14:55:06 +0200
Message-Id: <DC84DX5YA27J.2UNA0LDKUMUB9@kernel.org>
Subject: Re: [PATCH] drm/gpuvm: Rename 'map' to 'op' in drm_gpuvm_map_req
Cc: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, "Boris Brezillon"
 <bbrezillon@kernel.org>, "Matt Coster" <matt.coster@imgtec.com>, "Rob
 Clark" <robin.clark@oss.qualcomm.com>, "Matthew Brost"
 <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
 <20250820180742.20623521@fedora> <20250821130146.471cd653@fedora>
 <20250821132535.0424d0b4@fedora>
In-Reply-To: <20250821132535.0424d0b4@fedora>
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

On Thu Aug 21, 2025 at 1:25 PM CEST, Boris Brezillon wrote:
> On Thu, 21 Aug 2025 13:01:46 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>> On a second thought, I'm now wondering why we need drm_gpuvm_map_req in
>> the first place. It would kinda make sense if it was containing an
>>=20
>> 	bool madvise;
>>=20
>> field, so you don't have to pass it around, but even then, I'm
>> wondering if we wouldn't be better off adding this field to
>> drm_gpuva_op_map instead and passing an drm_gpuva_op_map object to
>> the various map helpers (like Danilo suggested in his review of the
>> REPEATED mode series Caterina sent).
>
> More on that: the very reason I introduced drm_gpuvm_map_req in the
> first place is so we have a clear differentiation between an overall
> map request and the sub-operations that are created to fulfill it.
> Looks like this was not a concern for Danilo and he was happy with us
> using _op_map for this.
>
> The other reason we might want to add drm_gpuvm_map_req is so that
> information we only need while splitting a req don't pollute
> drm_gpuva_op_map. Given I was going to pass the flags to the driver's
> callback anyway (meaning it's needed at the op_map level), and given
> you're passing madvise as a separate bool argument to various helpers
> (_map_req just contains the op, not the madvise bool), I don't think
> this aspect matters.

Good catch! Indeed, when Himal picked up your struct drm_gpuvm_map_req patc=
h,
there were additional flags included in the structure. Now that it is
essentially a transparent wrapper, I prefer to use struct drm_gpuva_op_map
directly.

However, given that you still have patches in flight that will add a flags =
field
to struct drm_gpuvm_map_req I think it's probably fine to introduce it righ=
t
away. Or did you drop this plan of adding those flags?
