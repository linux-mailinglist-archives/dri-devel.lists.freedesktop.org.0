Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B8CCEFDB3
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 10:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0444510E00D;
	Sat,  3 Jan 2026 09:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kxlcrifn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E6D10E00D;
 Sat,  3 Jan 2026 09:52:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 75CE76014D;
 Sat,  3 Jan 2026 09:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F5FC113D0;
 Sat,  3 Jan 2026 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767433957;
 bh=Z73Af2+RRxrUg3W9C+jBUFDIPjZKIyc/ygvMlU1xwmw=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=KxlcrifnRdFRe2vVpgBAT8VXFHpGPqfol64UrKSuIPiubQnhw0WnKkZ1qp2GhwWza
 Fa9OnJUMeSMgfQVagtA6lddv8xQBCZMcISMFdZc3gZRLRwdv6kZeS78xH+nNTx02ow
 i+LSUMtDDFWYfPCwB6SA5TUeCZ7NgWjwo77yomppZIDXcTRAXG/cTiLL6Sm0yiyoy6
 5qrNoWFE8Dy7X/xUdA/E+B2Xf1l0fntwXQ3y5kbgHBW6c/ivVVGCb0Q0hzqizv6SXn
 U4NDc2SB9PVp1nEn7ZcfLRC7/0h2ix1xtvPEiUaEFo9S+h+SbhN40BkwCPhHCqHXIK
 DWCjf4QEl7lSA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Jan 2026 10:52:33 +0100
Message-Id: <DFEV1P747QKG.3O75MCC6HFYK4@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: use stable name() method in Chipset
 Display impl
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Maurice Hieronymus" <mhi@mailbox.org>
References: <20260101184137.80445-1-mhi@mailbox.org>
In-Reply-To: <20260101184137.80445-1-mhi@mailbox.org>
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

On Thu Jan 1, 2026 at 7:41 PM CET, Maurice Hieronymus wrote:
> Chipset's Display was using Debug formatting ("{self:?}"), which is not
> guaranteed to be stable. Use the existing name() method instead, which
> provides stable lowercase strings suitable for firmware path generation.
>
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
> ---
>  drivers/gpu/nova-core/gpu.rs | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 629c9d2dc994..be8c882338ea 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -107,17 +107,9 @@ pub(crate) fn arch(&self) -> Architecture {
>      }
>  }
> =20
> -// TODO
> -//
> -// The resulting strings are used to generate firmware paths, hence the
> -// generated strings have to be stable.
> -//
> -// Hence, replace with something like strum_macros derive(Display).
> -//
> -// For now, redirect to fmt::Debug for convenience.
>  impl fmt::Display for Chipset {
>      fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> -        write!(f, "{self:?}")
> +        write!(f, "{}", self.name())
>      }
>  }

This also converts the printed string to lowercase. While this is not that =
big a
deal, the solution we are looking for instead is what the TODO comment says=
: be
able to derive a Display implementation (for enums).

Now that we have syn in the kernel, this seems quite straight forward to
implement. Are you interested in working on this instead?

Thanks,
Danilo
