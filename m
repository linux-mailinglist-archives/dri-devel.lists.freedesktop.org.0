Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD1CB2DA02
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 12:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8836E10E6EA;
	Wed, 20 Aug 2025 10:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mek/xkFR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FDC10E6E9;
 Wed, 20 Aug 2025 10:30:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 07E036142E;
 Wed, 20 Aug 2025 10:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F143EC4CEEB;
 Wed, 20 Aug 2025 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755685817;
 bh=P/oQpoiWxChiJCM1oIYIzsoGt24WyUjDZ+cuYN5z6pQ=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=mek/xkFRir8nUYuV8F1j/oqDG1hgTdyrxPmeVdti2LpLwZlLCLmps8ZfTGdeBJacW
 C11ZNiZGRh0uV4rvkOKwRgUwCVhNEr6M+jiqHhJ23E+4JqvpPGo0heqw0kovLgc9Wg
 FB81vfneu0FRe+UaDiuywgLJ1sqh7S7db58E1Uv6aXIoTMtFaDLJdTHc9xN+Go7w0o
 MRvrGPm/LqbmgzlIO0TVyugmmfEXUXo21xyy7aEb54oGvV5OsQgrC61JF8fN/+KYIb
 dsbJ1EUGNHIQFM5vQsbcIOM7TEXlaxMXZeiNT3urYcbmLFELs4CkYjQAY0QKFAeiVK
 DtuZeYy1aosKg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 12:30:14 +0200
Message-Id: <DC76OGHHB0NH.2150TC0DHRN8A@kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: linux-next: manual merge of the drm tree with the
 drm-misc-fixes tree
Cc: "Dave Airlie" <airlied@redhat.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Beata Michalska" <beata.michalska@arm.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "DRI" <dri-devel@lists.freedesktop.org>,
 "Intel Graphics" <intel-gfx@lists.freedesktop.org>, "Linux Kernel Mailing
 List" <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
References: <20250820112144.43714c90@canb.auug.org.au>
In-Reply-To: <20250820112144.43714c90@canb.auug.org.au>
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

On Wed Aug 20, 2025 at 3:21 AM CEST, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/gpu/drm/nova/file.rs
>
> between commit:
>
>   db2e7bcee11c ("drm: nova-drm: fix 32-bit arm build")
>
> from the drm-misc-fixes tree and commit:
>
>   94febfb5bcfb ("rust: drm: Drop the use of Opaque for ioctl arguments")
>
> from the drm tree.
>
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>
> --=20
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/gpu/drm/nova/file.rs
> index 4fe62cf98a23,7e7d4e2de2fb..000000000000
> --- a/drivers/gpu/drm/nova/file.rs
> +++ b/drivers/gpu/drm/nova/file.rs
> @@@ -39,8 -36,7 +36,8 @@@ impl File=20
>               _ =3D> return Err(EINVAL),
>           };
>  =20
>  -        getparam.value =3D value;
>  +        #[allow(clippy::useless_conversion)]
> -         getparam.set_value(value.into());
> ++        getparam.value =3D value.into();
>  =20
>           Ok(0)
>       }

I think this resolution doesn't compile, since attributes on expressions ar=
e
behind an unstable feature flag.

I assume your config does not have CONFIG_DRM_NOVA=3D{y,m}.

The resolution in [1] is the one I came up with in the drm-tip tree.

I should probably have given you a head-up on this conflict, sorry for that=
.

[1]

diff --cc drivers/gpu/drm/nova/file.rs
index 4fe62cf98a23,7e7d4e2de2fb..90b9d2d0ec4a
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@@ -39,8 -36,7 +36,7 @@@ impl File
              _ =3D> return Err(EINVAL),
          };

-         #[allow(clippy::useless_conversion)]
-         getparam.set_value(value.into());
 -        getparam.value =3D value;
++        getparam.value =3D Into::<u64>::into(value);

          Ok(0)
      }

