Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7940F260BA7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BA76E093;
	Tue,  8 Sep 2020 07:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7AC6E48D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 15:01:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C97A1B6CF;
 Mon,  7 Sep 2020 15:01:13 +0000 (UTC)
Message-ID: <34aa0d6094e7d6fb3492d2cda0fec8ecc04790ed.camel@suse.de>
Subject: Re: [PATCH v11 07/11] device-mapping: Introduce DMA range map,
 supplanting dma_pfn_offset
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Jim Quinlan <james.quinlan@broadcom.com>, Nathan Chancellor
 <natechancellor@gmail.com>, Christoph Hellwig <hch@lst.de>
Date: Mon, 07 Sep 2020 17:01:08 +0200
In-Reply-To: <CA+-6iNyv_sFJOxDi5OcYNWe=ovLnOnrZNsWFQk5b-bzQzA8T_Q@mail.gmail.com>
References: <20200824193036.6033-1-james.quinlan@broadcom.com>
 <20200824193036.6033-8-james.quinlan@broadcom.com>
 <20200902215314.GA881878@ubuntu-n2-xlarge-x86>
 <CA+-6iNzc38OAL7TGxobpODKXOD1CW-VFNU0rK9Z043QfR3MfsQ@mail.gmail.com>
 <20200902223852.GA1786990@ubuntu-n2-xlarge-x86>
 <6922bc0b-1849-2f2f-ec2f-fe9f0124dcfc@gmail.com>
 <20200903005240.GA1118@Ryzen-9-3900X.localdomain>
 <CA+-6iNyv_sFJOxDi5OcYNWe=ovLnOnrZNsWFQk5b-bzQzA8T_Q@mail.gmail.com>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Sep 2020 07:17:17 +0000
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
 "open list:PCI NATIVE HOST
 BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, "open
 list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Frank Rowand <frowand.list@gmail.com>, "maintainer:X86 ARCHITECTURE 32-BIT AND
 64-BIT" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 ACPI/arm64" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM
 BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Yong Deng <yong.deng@magewell.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
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
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============0735131606=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0735131606==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-cTysW+6S+4/l7Qusohcm"


--=-cTysW+6S+4/l7Qusohcm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jim, sorry I'm a little late to the party, but was on vacation.

On Thu, 2020-09-03 at 13:32 -0400, Jim Quinlan wrote:
> On Wed, Sep 2, 2020 at 8:52 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > On Wed, Sep 02, 2020 at 05:36:29PM -0700, Florian Fainelli wrote:
> > >=20
> > > On 9/2/2020 3:38 PM, Nathan Chancellor wrote:
> > > [snip]
> > > > > Hello Nathan,
> > > > >=20
> > > > > Can you tell me how much memory your RPI has and if all of it is
> > > >=20
> > > > This is the 4GB version.
> > > >=20
> > > > > accessible by the PCIe device?  Could you also please include the=
 DTS
> > > > > of the PCIe node?  IIRC, the RPI firmware does some mangling of t=
he
> > > > > PCIe DT before Linux boots -- could you describe what is going on
> > > > > there?
> > > >=20
> > > > Unfortunately, I am not familiar with how to get this information. =
If
> > > > you could provide some instructions for how to do so, I am more tha=
n
> > > > happy to. I am not very knowleagable about the inner working of the=
 Pi,
> > > > I mainly use it as a test platform for making sure that LLVM does n=
ot
> > > > cause problems on real devices.
> > >=20
> > > Can you bring the dtc application to your Pi root filesystem, and if =
so, can
> > > you run the following:
> > >=20
> > > dtc -I fs -O dtb /proc/device-tree -f > /tmp/device.dtb
> >=20
> > Sure, the result is attached.
> >=20
> > > or cat /sys/firmware/fdt > device.dtb
> > >=20
> > > and attach the resulting file?
> > >=20
> > > > > Finally, can you attach the text of the full boot log?
> > > >=20
> > > > I have attached a working and broken boot log. Thank you for the qu=
ick
> > > > response!
> > >=20
> > > Is it possible for you to rebuild your kernel with CONFIG_MMC_DEBUG b=
y any
> > > chance?
> >=20
> > Of course. A new log is attached with the debug output from that config=
.
>=20
> Hi Nicolas,
>=20
> Can you please help us out here?  It appears that your commit

It's dma_offset_from_dma_addr() that's causing trouble. It goes over all th=
e
dma regions and, if no region matches the phys address range, it returns 0.
This isn't acceptable as is. In the past, we used to pass the offset
nonetheless, which would make the phys address grow out of the dma memory a=
rea
and fail the dma_capable() test.

For example, RPi4 devices attached to the old interconnect see phys [0x0
0x3fffffff] at [0xc0000000 0xffffffff]. So say you're trying to convert
physical address 0xfa000000, you'll get 0 from dma_offset_from_phys_addr()
(since your dma range only covers the first GB) to then test if 0xfa000000 =
is
dma_capable(), which it is, but for the wrong reasons. Causing DMA issues
further down the line.

I don't have a proper suggestion on how to solve this but here's the soluti=
on I
used:

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 4c4646761afe..40fe3c97f2be 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -217,11 +217,19 @@ static inline u64 dma_offset_from_phys_addr(struct de=
vice *dev,
 {
        const struct bus_dma_region *m =3D dev->dma_range_map;
=20
-       if (m)
+       if (m) {
                for (; m->size; m++)
                        if (paddr >=3D m->cpu_start &&
                            paddr - m->cpu_start < m->size)
                                return m->offset;
+
+               /*
+                * The physical address doesn't fit any of the DMA regions,
+                * return an impossible to fulfill offset.
+                */
+               return -(1ULL << 46);
+       }
+
        return 0;
 }

I didn't catch this on my previous tests as I was using a newer bcm2711 SoC
revision which expanded emmc2's DMA capabilities (can do 32 bit DMA as oppo=
sed
to 30 bit).

Regards,
Nicolas


--=-cTysW+6S+4/l7Qusohcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl9WSzQACgkQlfZmHno8
x/7bxQgAq+hxWcUTGOm78RMY+sJ/vmapTRt7oyJb7Lveh5vUDXmv6qDBblJRUU7M
uhwz/DHwnoJS8qsUKpmkuz5thA96uATLTDNBDRQ3TSAfM1L62TrgIklSBL8QJhov
djYxt05Roimhkzx2OIzIjx52N+G4t/unl4Pcfm837cYCCwA4DKuDF5eYLriboTHg
8osj9aYS4X3f75bWGuNRgMJk16v/Cz5h+DoXHPWbarzBDH1xBV30pUzftEc9bW/0
8O2Rihk2HT8p1DOz2jkNttE6OW0bD+tpDcU0dBUJ/areTb/Bdxh/OcYMWqybtMV7
7rUzo5M4M9oHMwPQf6KN2p/9cpQfTQ==
=08KD
-----END PGP SIGNATURE-----

--=-cTysW+6S+4/l7Qusohcm--


--===============0735131606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0735131606==--

