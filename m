Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E282627B9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228256E9C3;
	Wed,  9 Sep 2020 07:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDAC6E59B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:21:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 655D5AF93;
 Tue,  8 Sep 2020 11:21:03 +0000 (UTC)
Message-ID: <e4c672bc5237f6efb415efb77353b018d191b5ae.camel@suse.de>
Subject: Re: [PATCH v11 07/11] device-mapping: Introduce DMA range map,
 supplanting dma_pfn_offset
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>
Date: Tue, 08 Sep 2020 13:20:56 +0200
In-Reply-To: <20200908094345.GA20959@lst.de>
References: <CA+-6iNzc38OAL7TGxobpODKXOD1CW-VFNU0rK9Z043QfR3MfsQ@mail.gmail.com>
 <20200902223852.GA1786990@ubuntu-n2-xlarge-x86>
 <6922bc0b-1849-2f2f-ec2f-fe9f0124dcfc@gmail.com>
 <20200903005240.GA1118@Ryzen-9-3900X.localdomain>
 <CA+-6iNyv_sFJOxDi5OcYNWe=ovLnOnrZNsWFQk5b-bzQzA8T_Q@mail.gmail.com>
 <34aa0d6094e7d6fb3492d2cda0fec8ecc04790ed.camel@suse.de>
 <CA+-6iNyJ3ey0zPKj9nh8uL3AwTBhJqgD01wc=7G4NF35NXmV1Q@mail.gmail.com>
 <b4761ade39af346eebec917ca2a415c09681542a.camel@suse.de>
 <20200908072935.GA15119@lst.de> <20200908073203.GA15176@lst.de>
 <20200908094345.GA20959@lst.de>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open
 list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, "open list:REMOTE
 PROCESSOR REMOTEPROC SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>, "open
 list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Frank Rowand <frowand.list@gmail.com>, "maintainer:X86 ARCHITECTURE 32-BIT AND
 64-BIT" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 ACPI/arm64" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Yong Deng <yong.deng@magewell.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============0963292513=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0963292513==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-1OGRXui0587Xh/1Wx88W"


--=-1OGRXui0587Xh/1Wx88W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-09-08 at 11:43 +0200, Christoph Hellwig wrote:
> And because I like replying to myself so much, here is a link to the
> version with the arm cleanup patch applied.  Unlike the previous two
> attempts this has at least survived very basic sanity testing:
>=20
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-range=
s.2
>=20
> Note that we'll still need to sort out the arm/keystone warnings from
> the original patch.  Do we have anyone on the CC list who knows that
> platform a little better to figure out if the ifdef solution would work?

Had to do the following to boot without errors:

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index ef61a33c47bc..7dd88a0b6d0b 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -97,6 +97,9 @@ static inline bool dma_capable(struct device *dev, dma_ad=
dr_t addr, size_t size,
 {
        dma_addr_t end =3D addr + size - 1;
=20
+       if (addr =3D=3D DMA_MAPPING_ERROR)
+               return false;
+
        if (!dev->dma_mask)
                return false;
=20
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 90f1ecb6baaf..25809703a5bf 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -71,7 +71,12 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device *=
dev, u64 dma_mask,
=20
 static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t s=
ize)
 {
-       return phys_to_dma_direct(dev, phys) + size - 1 <=3D
+       dma_addr_t dma_addr =3D phys_to_dma_direct(dev, phys);
+
+       if (dma_addr =3D=3D DMA_MAPPING_ERROR)
+               return false;
+
+       return dma_addr + size - 1 <=3D
                        min_not_zero(dev->coherent_dma_mask, dev->bus_dma_l=
imit);
 }


Regards,
Nicolas


--=-1OGRXui0587Xh/1Wx88W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl9XaRgACgkQlfZmHno8
x/5hmQf+KJxR0hNS10JTc726MNRsObKDOzjwqaR1tJerfDOL1gaY6j5AbZEYFEv8
KpIPxjeVvN6hP8IGpKk3kxohk3GEOWPUkvmEbX79/SpKW6CGVVYIqjbBM0bUGkId
xxvo9IaqucXQMH5Okolzi0XwfNWpKsJMiVsJvXE4xchSsxd0MWG1qdM/VkToQl/n
gSJV/O1hASL+CKekOPoU7+/qlRRnzJFpH8d/H7TnlT5nkaUyPcdMqUX4NFo/PtpQ
w5j70lkemGFNmKHwUPeTZBL2C4BRohEe0MpZgTtDPIhNQ81WVQRoPuqaCqL3vsZg
45Ziy9UCeOvxaCasbOZA3ihex/Y4/Q==
=yLRF
-----END PGP SIGNATURE-----

--=-1OGRXui0587Xh/1Wx88W--


--===============0963292513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0963292513==--

