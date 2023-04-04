Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B786D700E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 00:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A5010E7D2;
	Tue,  4 Apr 2023 22:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Tue, 04 Apr 2023 22:21:49 UTC
Received: from smtp102.iad3a.emailsrvr.com (smtp102.iad3a.emailsrvr.com
 [173.203.187.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E235C10E7D2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 22:21:49 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp29.relay.iad3a.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id 93E0E23A6C; 
 Tue,  4 Apr 2023 18:15:07 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cache at BO
 creation
Date: Tue, 04 Apr 2023 15:15:02 -0700
Message-ID: <841291489.4Es8JzXQGL@mizzik>
In-Reply-To: <ZCsDaDzyOyu9mYU3@intel.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230403163532.GT4085390@mdroper-desk1.amr.corp.intel.com>
 <ZCsDaDzyOyu9mYU3@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6533292.K0ekAHHfTp";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Classification-ID: 43e8f2a4-730a-4a8d-b9b3-2a2d0a1f4921-1-1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart6533292.K0ekAHHfTp
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Kenneth Graunke <kenneth@whitecape.org>
Date: Tue, 04 Apr 2023 15:15:02 -0700
Message-ID: <841291489.4Es8JzXQGL@mizzik>
In-Reply-To: <ZCsDaDzyOyu9mYU3@intel.com>
MIME-Version: 1.0

On Monday, April 3, 2023 9:48:40 AM PDT Ville Syrj=E4l=E4 wrote:
> On Mon, Apr 03, 2023 at 09:35:32AM -0700, Matt Roper wrote:
> > On Mon, Apr 03, 2023 at 07:02:08PM +0300, Ville Syrj=E4l=E4 wrote:
> > > On Fri, Mar 31, 2023 at 11:38:30PM -0700, fei.yang@intel.com wrote:
> > > > From: Fei Yang <fei.yang@intel.com>
> > > >=20
> > > > To comply with the design that buffer objects shall have immutable
> > > > cache setting through out its life cycle, {set, get}_caching ioctl's
> > > > are no longer supported from MTL onward. With that change caching
> > > > policy can only be set at object creation time. The current code
> > > > applies a default (platform dependent) cache setting for all object=
s.
> > > > However this is not optimal for performance tuning. The patch exten=
ds
> > > > the existing gem_create uAPI to let user set PAT index for the obje=
ct
> > > > at creation time.
> > >=20
> > > This is missing the whole justification for the new uapi.
> > > Why is MOCS not sufficient?
> >=20
> > PAT and MOCS are somewhat related, but they're not the same thing.  The
> > general direction of the hardware architecture recently has been to
> > slowly dumb down MOCS and move more of the important memory/cache
> > control over to the PAT instead.  On current platforms there is some
> > overlap (and MOCS has an "ignore PAT" setting that makes the MOCS "win"
> > for the specific fields that both can control), but MOCS doesn't have a
> > way to express things like snoop/coherency mode (on MTL), or class of
> > service (on PVC).  And if you check some of the future platforms, the
> > hardware design starts packing even more stuff into the PAT (not just
> > cache behavior) which will never be handled by MOCS.
>=20
> Sigh. So the hardware designers screwed up MOCS yet again and
> instead of getting that fixed we are adding a new uapi to work
> around it?
>=20
> The IMO sane approach (which IIRC was the situation for a few
> platform generations at least) is that you just shove the PAT
> index into MOCS (or tell it to go look it up from the PTE).
> Why the heck did they not just stick with that?

There are actually some use cases in newer APIs where MOCS doesn't
work well.  For example, VK_KHR_buffer_device_address in Vulkan 1.2:

https://registry.khronos.org/vulkan/specs/1.3-extensions/man/html/VK_KHR_bu=
ffer_device_address.html

It essentially adds "pointers to buffer memory in shaders", where apps
can just get a 64-bit pointer, and use it with an address.  On our EUs,
that turns into A64 data port messages which refer directly to memory.
Notably, there's no descriptor (i.e. SURFACE_STATE) where you could
stuff a MOCS value.  So, you get one single MOCS entry for all such
buffers...which is specified in STATE_BASE_ADDRESS.  Hope you wanted
all of them to have the same cache & coherency settings!

With PAT/PTE, we can at least specify settings for each buffer, rather
than one global setting.

Compression has also been moving towards virtual address-based solutions
and handling in the caches and memory controller, rather than in e.g.
the sampler reading SURFACE_STATE.  (It started evolving that way with
Tigerlake, really, but continues.)

> > Also keep in mind that MOCS generally applies at the GPU instruction
> > level; although a lot of instructions have a field to provide a MOCS
> > index, or can use a MOCS already associated with a surface state, there
> > are still some that don't. PAT is the source of memory access
> > characteristics for anything that can't provide a MOCS directly.
>=20
> So what are the things that don't have MOCS and where we need
> some custom cache behaviour, and we already know all that at
> buffer creation time?

=46or Meteorlake...we have MOCS for cache settings.  We only need to use
PAT for coherency settings; I believe we can get away with deciding that
up-front at buffer creation time.  If we were doing full cacheability,
I'd be very nervous about deciding performance tuning at creation time.

=2D-Ken

--nextPart6533292.K0ekAHHfTp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6OtbNAgc4e6ibv4ZW1vaBx1JzDgFAmQsoWYACgkQW1vaBx1J
zDh7nw/+OdMoftQAugjEg3ahzqIEgMZYmgc6UKJYgyGu+Vuy9ipH+1CQJs0AsHGJ
NBq07PvNAtPgNDQgCPB7unxrzXzGkokgfhJnTxpl+gd+nVimE9EQkku+L0k8eI9h
1gXptoX0B//duToZgLIQnBSE2sT1In5mX2RcuGQ2ZHIXraVSsV2jvqM9zV4eTz8A
CQAcmSDsggjhSF5jaciVaMa3wN38zscsF64xpVojMfuNl2Ra3Qc/QDzLlUtGwgu0
0PxmV6qN5plViC3P2AXCVFmMiIwtvoFMnUmLrS+oicPk92SZaNxYwuVUCGZveMS1
4bubTcFqq6dPcMf0KQ+qk1pRJK1AwDb9ncxlKxoRbaMVqdMY9Z91U8H2eiPp3cE2
sDEptihFwnscTIVgr/NiNNTKK2FyDInZdF2Xkr0JZA/GWPf7EbCjyXA/yzAIqnF7
J52XXOeYOGc3EIPLn8J53PTQ3dOV8i73CeWnKKaQIPeyvohR0ER6IBTdtZ9pxbNl
zarROr78qInME3M582uHucxAR5QCfsQJ+zRa8iagmbsiYx3X2zeqNEkPl18f3IBR
oh2LVGFNpf2gDglomsXQF5daB++pwKjtBAbF25tRksii+yf3pojs7BZGXCC+wUUW
yOLhhwaH6MfHVJRLYfzy8hTY4EKTOZMac6P5ihVmofw68twwGNo=
=bYu7
-----END PGP SIGNATURE-----

--nextPart6533292.K0ekAHHfTp--



