Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEFD2B150A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 05:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29916E372;
	Fri, 13 Nov 2020 04:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF1D6E332;
 Fri, 13 Nov 2020 04:16:29 +0000 (UTC)
IronPort-SDR: SremlatBCL3N/fpihAhTq3FcXHI+oZLyfOKNw7ZmMuiaeK+bx87rdfjfnk8NZ8HqbEZKtk69Ym
 1oY3yaQU1Zcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="149694534"
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; 
 d="asc'?scan'208";a="149694534"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 20:16:20 -0800
IronPort-SDR: V9PKPP4pGn768q/bpv+VGB/U90M8zzH2YWRMptBq7vAlf95WLn2zXDhE1zfpNrwZHFJ7l6hvRW
 KTv8zdptWNbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; 
 d="asc'?scan'208";a="366823985"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga007.jf.intel.com with ESMTP; 12 Nov 2020 20:16:17 -0800
Date: Fri, 13 Nov 2020 12:01:57 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiongfeng Wang <wangxiongfeng2@huawei.com>
Subject: Re: [PATCH] drm/i915/gvt: return error when failing to take the
 module reference
Message-ID: <20201113040157.GC1239@zhen-hp.sh.intel.com>
References: <1605187352-51761-1-git-send-email-wangxiongfeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1605187352-51761-1-git-send-email-wangxiongfeng2@huawei.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chenzhou10@huawei.com, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2034226698=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2034226698==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7vAdt9JsdkkzRPKN"
Content-Disposition: inline


--7vAdt9JsdkkzRPKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.11.12 21:22:32 +0800, Xiongfeng Wang wrote:
> When we fail to take the module reference, we go to the 'undo*' branch and
> return. But the returned variable 'ret' has been set as zero by the
> above code. Change 'ret' to '-ENODEV' in this situation.
>=20
> Fixes: 9bdb073464d6 ("drm/i915/gvt: Change KVMGT as self load module")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index ad8a9df..778eb8c 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -829,8 +829,10 @@ static int intel_vgpu_open(struct mdev_device *mdev)
>  	/* Take a module reference as mdev core doesn't take
>  	 * a reference for vendor driver.
>  	 */
> -	if (!try_module_get(THIS_MODULE))
> +	if (!try_module_get(THIS_MODULE)) {
> +		ret =3D -ENODEV;
>  		goto undo_group;
> +	}
> =20
>  	ret =3D kvmgt_guest_init(mdev);
>  	if (ret)
> --=20

Thanks for the fix!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--7vAdt9JsdkkzRPKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX64FNQAKCRCxBBozTXgY
J45NAJ0VnPJIl47zMeVco/AbAnMwTEJOYwCglU9+zHkgsgnFxJR5VKwxpu7ag0I=
=JW7h
-----END PGP SIGNATURE-----

--7vAdt9JsdkkzRPKN--

--===============2034226698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2034226698==--
