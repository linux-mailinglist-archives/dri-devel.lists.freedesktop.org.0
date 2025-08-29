Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C8BB3B537
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 10:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B1210EB68;
	Fri, 29 Aug 2025 08:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lZbow2as";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F1A10EB67;
 Fri, 29 Aug 2025 08:01:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0B13B60052;
 Fri, 29 Aug 2025 08:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EE6C4CEF0;
 Fri, 29 Aug 2025 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756454498;
 bh=JsqSYUFY71T/FozS0NYvmOp7npQw+HrhzSRNRp5JVCI=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=lZbow2as6el92Vbw1I33IWpZPr5TY2TotYichgG3/9fDybdxNE4idD41qglrSrGJw
 qM6NW/rpfbTfdWZ6ABMeq0KRItNiVkvWbGfwx49Ds9WIbzJzqL9YW+nr+y4eVpfZjF
 6O9z6dxwgbXRx/ga1m7jTW//0PiL5RXXi/6abvlDxFFztSATnN7X7tMCq5M6l+UHRb
 HLACyGyr9t7TFWihKt9tmcZmnqS3KHliJilubUhjSsbyZtoiosdCaSGyJHWr1hannD
 4ciZwl2uVaRXE2HtOIWge99Pzs+wjLqB3EDG95cgcGhdgl4/jJ8M7DLFUye2+0qNoJ
 NfV1MAzBz3QZw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Aug 2025 10:01:35 +0200
Message-Id: <DCER5JXJYKB0.2FVV3H6S55YQN@kernel.org>
Cc: "Simona Vetter" <simona.vetter@ffwll.ch>, "Alice Ryhl"
 <aliceryhl@google.com>, "Intel Graphics" <intel-gfx@lists.freedesktop.org>,
 "DRI" <dri-devel@lists.freedesktop.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
References: <20250829122343.4b31642f@canb.auug.org.au>
In-Reply-To: <20250829122343.4b31642f@canb.auug.org.au>
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

On Fri Aug 29, 2025 at 4:23 AM CEST, Stephen Rothwell wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/tests/drm_exec_test.c: In function 'test_prepare_array':
> drivers/gpu/drm/tests/drm_exec_test.c:171:1: error: the frame size of 213=
6 bytes is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>   171 | }
>       | ^
> cc1: all warnings being treated as errors
>
> Possibly caused by commit
>
>   e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")

Thanks for reporting!

Unfortunately, it didn't happen with my configuration, but I could reproduc=
e it
with a simple allmodconfig. I've send a fix for this [1].

[1] https://lore.kernel.org/dri-devel/20250829075633.2306-1-dakr@kernel.org=
/
