Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ACCB247CA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 13:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49B810E1DE;
	Wed, 13 Aug 2025 11:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="efHLnc+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A5710E1DE;
 Wed, 13 Aug 2025 11:00:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 472884405F;
 Wed, 13 Aug 2025 11:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7177AC4CEEB;
 Wed, 13 Aug 2025 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755082825;
 bh=pVBUctv6a7hHpBHFt5YC4+ibU3IDgNVLqiCYEtBc9a0=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=efHLnc+9hVS3/Z6pbE8olMidSsQLiLectidty7sW+Pr1QupIibRqmF93lAdRANhUF
 7UvkyA0+8ISiujGZPjuwYJ8zI/gkBDYgDtJXJVadNrW3bp1iyzHuw6l2G45gJkk2ik
 5KxSlZEisvcF7fN+QcUT9ym+AXqX/d+NSsoLc64Y3X3s/idourIB03+FAiIACQk5eJ
 esS4yuskbGfrjnJfXlne7ofzzwL/aiC/hZL0XQ5NtyrJseIQcreP3psmkluGllG5+O
 pGO2tc4e/r99E4oupGmaqk3xJ0SOCpaeQyhMFiEndVtc6e/Db8Abip1Zq97UHTKVvA
 uaR5iKuGxmgaA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 13:00:21 +0200
Message-Id: <DC18XPLOI092.3BTLNFSDWJU8G@kernel.org>
Cc: "rongqianfeng@vivo.com" <rongqianfeng@vivo.com>, "airlied@redhat.com"
 <airlied@redhat.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "lyude@redhat.com" <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Zhi Wang" <zhiw@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
References: <20250811091910.404659-1-rongqianfeng@vivo.com>
 <4ca70a236502a2359b8ba332919b1fe4f9f09010.camel@nvidia.com>
In-Reply-To: <4ca70a236502a2359b8ba332919b1fe4f9f09010.camel@nvidia.com>
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

On Wed Aug 13, 2025 at 12:52 AM CEST, Timur Tabi wrote:
> On Mon, 2025-08-11 at 17:19 +0800, Qianfeng Rong wrote:
>> Replace kfree() with kvfree() for memory allocated by kvmalloc().
>>=20
>> Compile-tested only.
>>=20
>> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
>
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
>
> This does fix a real bug.
>
> However, I think the real problem is that it's really confusing that
> r535_gsp_msgq_recv_one_elem(gsp, &info) returns info.gsp_rpc_buf instead =
of just success/failure.=20
> r535_gsp_msgq_recv() does this:
>
> 	buf =3D kvmalloc(max_t(u32, rpc->length, expected), GFP_KERNEL);
> ...
> 	info.gsp_rpc_buf =3D buf;
> ...=20
> 	buf =3D r535_gsp_msgq_recv_one_elem(gsp, &info);
>
> You wouldn't know it, but this does not change the value of 'buf' unless
> r535_gsp_msgq_recv_one_elem() fails.  If it does fail, the code does this=
:

Ick! That makes no sense, r535_gsp_msgq_recv_one_elem() should just return =
an
int and we shouldn't overwrite buf -- that's a footgun.

> 	if (IS_ERR(buf)) {
> 		kvfree(info.gsp_rpc_buf);

Should just be

	if (ret) {
		kvfree(buf);
		return ERR_PTR(ret);
	}

It also doesn't need the info.gsp_rpc_buf =3D NULL; assignment, info is loc=
al
anyways.

> It would be a lot clearer if we could kvfree(buf) here, but we can't beca=
use 'buf' no longer points
> to the buffer, even though the buffer still exists.

Agreed.

Zhi, Timur do you want to send a follow-up patch for this?
