Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B116A027C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 06:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89C110E49D;
	Thu, 23 Feb 2023 05:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7144910E49D;
 Thu, 23 Feb 2023 05:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677130970; x=1708666970;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=fNthTe0hqtFD5hys4g4BTack0W8Cr5nveuNKNdiA4Ak=;
 b=mA9Bn5e83oyHqMWfF/2hNu3eFo4hlro4Y9P1ZlyhGZPBFFnTYdZf8B5S
 DAjtfhZJ6OEcUi8HJN2ySPdPEOa/mXHAi1vbgeLF9IhkBQz6+hDtb9qRK
 ta7XylkGQHZpNO3Kg6l6lCVMmGirKqSp3xJcp7cRrbuz2c8nIg8jwDNeu
 VfqY+TwfjZapEdoffcqh1cd8nwx0/tsNQu3hKlgeGH1ZMVxzNJw5beQXS
 9JVXwU7neOnoFwWxsBKomrbX0gNtQOpUxp6FzSg4VzB14X9p97JTRubZ/
 agcpahLWP2H9XhlpLjy+0EA5qB62YW5lAS+TLy7aTy0FMsmSP1B6xfvfM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="360609745"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
 d="asc'?scan'208";a="360609745"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 21:42:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="674389293"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
 d="asc'?scan'208";a="674389293"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.159.40])
 by fmsmga007.fm.intel.com with ESMTP; 22 Feb 2023 21:42:48 -0800
Date: Thu, 23 Feb 2023 13:41:00 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] i915: fix memory leak with using
 debugfs_lookup()
Message-ID: <Y/b8bLx+fbGOWgJx@debian-scheme>
References: <20230202141309.2293834-1-gregkh@linuxfoundation.org>
 <Y+Fh2w1Iw3kHp5D+@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="9wh4AwoWCfukJxS4"
Content-Disposition: inline
In-Reply-To: <Y+Fh2w1Iw3kHp5D+@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--9wh4AwoWCfukJxS4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.02.06 15:23:55 -0500, Rodrigo Vivi wrote:
> On Thu, Feb 02, 2023 at 03:13:09PM +0100, Greg Kroah-Hartman wrote:
> > When calling debugfs_lookup() the result must have dput() called on it,
> > otherwise the memory will leak over time.  To make things simpler, just
> > call debugfs_lookup_and_remove() instead which handles all of the logic
> > at once.
> >=20
> > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > Cc: Zhi Wang <zhi.a.wang@intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: intel-gvt-dev@lists.freedesktop.org
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>=20
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> Zhenyu or Zhi, could you please propagate this through your gvt branch?
>=20

Sorry I missed this one after I migrated my mail stuff onto new machine..
Looks good to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> >  drivers/gpu/drm/i915/gvt/kvmgt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gv=
t/kvmgt.c
> > index 8ae7039b3683..de675d799c7d 100644
> > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > @@ -699,7 +699,7 @@ static void intel_vgpu_close_device(struct vfio_dev=
ice *vfio_dev)
> > =20
> >  	clear_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status);
> > =20
> > -	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
> > +	debugfs_lookup_and_remove(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs);
> > =20
> >  	kvm_page_track_unregister_notifier(vgpu->vfio_device.kvm,
> >  					   &vgpu->track_node);
> > --=20
> > 2.39.1
> >=20

--9wh4AwoWCfukJxS4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY/b8ZgAKCRCxBBozTXgY
J2QHAJ4mxXdBrJyJ7kZX42GmAhaFvJCFvwCeLi7grFnnr8QIUCde6A1N/D3zKXQ=
=VkT4
-----END PGP SIGNATURE-----

--9wh4AwoWCfukJxS4--
