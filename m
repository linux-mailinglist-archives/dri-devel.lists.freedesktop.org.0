Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 266B96A1D7E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 15:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB1310EA59;
	Fri, 24 Feb 2023 14:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD24410EA59
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 14:32:49 +0000 (UTC)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk
 [IPv6:2a01:4f8:1c1c:f269::1])
 by madras.collabora.co.uk (Postfix) with ESMTP id 06CB26602FBB;
 Fri, 24 Feb 2023 14:32:47 +0000 (GMT)
From: "Helen Mae Koike Fornazier" <koike@collabora.com>
In-Reply-To: <20230224140421.29774-1-david@ixit.cz>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Fri, 24 Feb 2023 14:32:47 +0000
To: "David Heidelberg" <david@ixit.cz>
MIME-Version: 1.0
Message-ID: <2466-63f8ca80-15-200c5ec0@118513565>
Subject: =?utf-8?q?Re=3A?= [RESEND PATCH] =?utf-8?q?init/do=5Fmounts=2Ec=3A?=
 add virtiofs root fs support
User-Agent: SOGoMail 5.8.0
Content-Transfer-Encoding: quoted-printable
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
Cc: wsa+renesas@sang-engineering.com, akpm@linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(from get=5Fmaintainers.pl script) +cc Wolfram Sang, Andrew Morton

On Friday, February 24, 2023 11:04 -03, David Heidelberg <david@ixit.cz=
> wrote:

> From: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Make it possible to boot directly from a virtiofs file system with ta=
g
> 'myfs' using the following kernel parameters:
>=20
>   rootfstype=3Dvirtiofs root=3Dmyfs rw
>=20
> Booting directly from virtiofs makes it possible to use a directory o=
n
> the host as the root file system.  This is convenient for testing and
> situations where manipulating disk image files is cumbersome.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Helen Koike <helen.koike@collabora.com>

> ---

> We have used this option in Mesa3D CI for testing crosvm for
> more than one years and it's proven to work reliably.
>=20
> We are working on effort to removing custom patches to be able to do=20
> automated apply and test of patches from any tree.

Thanks David for this work, it would be awesome to have more automated =
tests, and if we can do
more towards this goal, making the whole process more fluid, I would go=
 for it.
                             =20
>=20
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/.gitlab-ci/crosv=
m-runner.sh#L85
>=20
>  init/do=5Fmounts.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/init/do=5Fmounts.c b/init/do=5Fmounts.c
> index 811e94daf0a8..11c11abe23d7 100644
> --- a/init/do=5Fmounts.c
> +++ b/init/do=5Fmounts.c
> @@ -578,6 +578,16 @@ void =5F=5Finit mount=5Froot(void)
>  			printk(KERN=5FERR "VFS: Unable to mount root fs via SMB.\n");
>  		return;
>  	}
> +#endif
> +#ifdef CONFIG=5FVIRTIO=5FFS
> +	if (root=5Ffs=5Fnames && !strcmp(root=5Ffs=5Fnames, "virtiofs")) {
> +		if (!do=5Fmount=5Froot(root=5Fdevice=5Fname, "virtiofs",
> +				   root=5Fmountflags, root=5Fmount=5Fdata))
> +			return;
> +
> +		panic("VFS: Unable to mount root fs \"%s\" from virtiofs",
> +		      root=5Fdevice=5Fname);
> +	}
>  #endif
>  	if (ROOT=5FDEV =3D=3D 0 && root=5Fdevice=5Fname && root=5Ffs=5Fname=
s) {
>  		if (mount=5Fnodev=5Froot() =3D=3D 0)
> --=20
> 2.39.1
>=20

Regards,
Helen

