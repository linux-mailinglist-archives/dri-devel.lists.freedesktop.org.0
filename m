Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2796FD153
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 00:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8926E445;
	Thu, 14 Nov 2019 23:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720076E445
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 23:08:53 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xAEMxODP142407
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 18:08:51 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w9fb29xcb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 18:08:51 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <sbobroff@linux.ibm.com>;
 Thu, 14 Nov 2019 23:08:49 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 14 Nov 2019 23:08:47 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAEN89Z325100598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Nov 2019 23:08:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53F4742042;
 Thu, 14 Nov 2019 23:08:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B290642047;
 Thu, 14 Nov 2019 23:08:45 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Nov 2019 23:08:45 +0000 (GMT)
Received: from osmium (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2EDD4A00EC;
 Fri, 15 Nov 2019 10:08:42 +1100 (AEDT)
Date: Fri, 15 Nov 2019 10:08:42 +1100
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH RFC 1/1] drm/radeon: fix bad DMA from INTERRUPT_CNTL2
References: <7251833ab9439f4e34ba3fb2c5daf6c9e01b6551.1573698927.git.sbobroff@linux.ibm.com>
 <CADnq5_PGbOsLK11_xEvgKekX0nv_c3+RKxbZF+uQHYbraDQPsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnq5_PGbOsLK11_xEvgKekX0nv_c3+RKxbZF+uQHYbraDQPsQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19111423-4275-0000-0000-0000037DD230
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111423-4276-0000-0000-0000389139EC
Message-Id: <20191114230608.GA3921@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-14_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140000 definitions=main-1911140186
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1447995665=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1447995665==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 12:05:19AM -0500, Alex Deucher wrote:
> On Wed, Nov 13, 2019 at 9:53 PM Sam Bobroff <sbobroff@linux.ibm.com> wrot=
e:
> >
> > Currently, binding the radeon driver to a Radeon FirePro (PCI
> > 1002:68f2) that has been passed through to a guest on a Power8 machine
> > causes a bad DMA read which causes the device to be frozen, leading to
> > the driver failing to bind and other problems.
> >
> > The bad DMA is to the address written into the INTERRUPT_CNTL2
> > register during r600_irq_init(), and it can be fixed by substituting a
> > valid (dummy) DMA address.
>=20
> The patch is correct.  INTERRUPT_CNTL2 takes a bus address not a GPU
> MC address.  Care to update si.c and cik.c as well?

Sure (although I can't test those cases). I see that there's one other
case in si_ih.c (although it's for amdgpu, not radeon); should I include
that as well?

> Thanks,
>=20
> Alex
>=20
> > ---
> > Hello,
> >
> > I've been tracking down a bug, described above, and I've been able to h=
ack
> > in a workaround but I could use some help understanding how to fix it
> > properly.
> >
> > What seems to be happening is that when the first CRTC is enabled (when
> > evergreen_irq_set() writes to GRPH_INT_CONTROL) the device immediately
> > performs a DMA read from the address that's been programmed into
> > INTERRUPT_CNTL2 by r600_irq_init().
> >
> > That address isn't a valid DMA address, so it triggers the problem. The
> > address comes from rdev->ih.gpu_addr, which seems to be a 'linear GPU
> > address', calculated from the size of the card's VRAM. It definitely ha=
sn't
> > come from a DMA mapping operation.
> >
> > Based on the nearby comment, "set dummy read address to ring address", I
> > tried substituting a valid dummy DMA address (using the address mapped =
to
> > the 'dummy page' used by the GART) and it does prevent the problem.
> > However, I don't know what that register is supposed to do or what
> > information the device might be communicating via that DMA, so presumab=
ly
> > it breaks something.
> >
> > Note: I have tried loading the patched driver with "test=3D1" and all t=
he
> > self tests succeed.
> >
> > Could anyone offer some insight into this problem?
> > What does that register do? What kind of address is it expecting?
> > What might be a good way of fixing it?
> >
> > Thanks in advance,
> > Sam.
> >
> >  drivers/gpu/drm/radeon/r600.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r60=
0.c
> > index e937cc01910d..033bc466a862 100644
> > --- a/drivers/gpu/drm/radeon/r600.c
> > +++ b/drivers/gpu/drm/radeon/r600.c
> > @@ -3696,8 +3696,8 @@ int r600_irq_init(struct radeon_device *rdev)
> >         }
> >
> >         /* setup interrupt control */
> > -       /* set dummy read address to ring address */
> > -       WREG32(INTERRUPT_CNTL2, rdev->ih.gpu_addr >> 8);
> > +       /* set dummy read address to dummy page address */
> > +       WREG32(INTERRUPT_CNTL2, rdev->dummy_page.addr >> 8);
> >         interrupt_cntl =3D RREG32(INTERRUPT_CNTL);
> >         /* IH_DUMMY_RD_OVERRIDE=3D0 - dummy read disabled with msi, ena=
bled without msi
> >          * IH_DUMMY_RD_OVERRIDE=3D1 - dummy read controlled by IH_DUMMY=
_RD_EN
> > --
> > 2.22.0.216.g00a2a96fc9
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl3N3ngACgkQMX8w6AQl
/iKKbQf/X/1/1LW2KMrA58YIIEBmQVfx7RCi13Vm1xK9TQhSJHOgjxFLUx7U/rQ7
1c/CMwERz+6hf2rQ4ncGgZ/ewSD5fNDr44rsTSf5SECv0yyhid6uT11cnMsu+lDy
IhlZKxYZVQTQmKY22sUQnovLDDuFh5q+WGQ/VVwEyfCWbDTEIDRqBAjfVeRO+vev
qt3tzTx69iyKIfs2xscbTyjH9XB40SbFWE1L7hpfaNgVd61UL7KavGltt2L97skN
hh/eOwVpb/G+C2yCNWhBPJ+kylAFC8wMS5RazB0lJ5gvp5Gj5NVybUFjkn8jMeNE
MgYUiTN9x6nNQZ4prsJ1LVQkYFwP7g==
=xgjm
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--


--===============1447995665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1447995665==--

