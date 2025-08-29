Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC35B3C032
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 18:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDEA10EC09;
	Fri, 29 Aug 2025 16:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Md5MRJNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C5E10EC09
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 16:03:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B7EB944D66;
 Fri, 29 Aug 2025 16:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CF8C4CEF0;
 Fri, 29 Aug 2025 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756483437;
 bh=yD526623ptv12O6Qctiy8Arz8SPmPGDHLcoV4eu59Oo=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=Md5MRJNiE+srgPDaniHmUmj9Dg85YmAByPkYmHOAQUtd8ic/PO9EDV6TjSu43LxKb
 7BP7ryxzJsQCs3QpnCfWEXa5g+yyrmYPgGzeCPqisOrfA5Z4D5gbyNLxY5qHUL3oAD
 HGdifv5Ek86FumP3m30aOlNDKKz/cTIenqsDrglhdwQ0SBMn++wZxt3HyIQp6IXEUY
 BTassvalIPO05hdB9xZSrwzl+r6jYwAUhQ9Pbo7umxyRBqsEG0iVdx+Z95Vxviwvd2
 SntOlRkE0JqUVnjdavYMi/MsPP3/PWEBXla4yZV1g/Kj7U8kkrr9P9rIO/eQG/j4rk
 AbzO0SOS4x7+Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Aug 2025 18:03:54 +0200
Message-Id: <DCF1EU09LIK8.24NDGBI967VSC@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>, "Alice Ryhl" <aliceryhl@google.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/test: drm_exec: use kzalloc() to allocate GEM objects
References: <20250829075633.2306-1-dakr@kernel.org>
In-Reply-To: <20250829075633.2306-1-dakr@kernel.org>
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

On Fri Aug 29, 2025 at 9:55 AM CEST, Danilo Krummrich wrote:
> Since commit e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")
> it is possible for test_prepare_array() to exceed a stack frame size of
> 2048 bytes depending on the exact configuration of the kernel.
>
>   drivers/gpu/drm/tests/drm_exec_test.c: In function =E2=80=98test_prepar=
e_array=E2=80=99:
>   drivers/gpu/drm/tests/drm_exec_test.c:171:1: error: the frame size of 2=
128 bytes is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>     171 | }
>         | ^
>   cc1: all warnings being treated as errors
>   make[6]: *** [scripts/Makefile.build:287: drivers/gpu/drm/tests/drm_exe=
c_test.o] Error 1
>   make[6]: *** Waiting for unfinished jobs....
>
> In order to fix this, allocate the GEM objects in test_prepare_array()
> with kzalloc(), rather than placing them on the stack.
>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-misc-next, thanks!

    [ Use kunit_kzalloc() instead of kzalloc(). - Danilo ]
