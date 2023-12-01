Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7CF8009D2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 12:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9621410E0E5;
	Fri,  1 Dec 2023 11:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A283210E0EE;
 Fri,  1 Dec 2023 11:22:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bc57d81f4so2891722e87.2; 
 Fri, 01 Dec 2023 03:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701429769; x=1702034569; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tDYTbMEHTA+PA+CkrLL7nufZCEtkNLGajLlCGSCmAZE=;
 b=YYevimwNl4H9JeTWCujXkpPgBRPAtOI0RQOreOVhDzo+NZHms3bhdozc0K5r5IGwKa
 V1X26zjO1H71sAMqQSH7zIfn9bph4+SgPfBEWMRErjW5b2w3L5JF4OYZVlsOtOwOduKY
 GT/KSYz7dABqcXZbLporSW8L4uwyXUV2PQxp6mqj5wrwILgt0oE8R7nsnZbkwd1pIesb
 2xmu/HjuTCOSD2wnGYaVhUWjOmQNd2CPWSx8g0indlCp9wwE6uiqMhUcvB/baiaRBo5c
 X81QxkXz69Ff862/40Y+KCpEpR4IE5ILtEKD2iqE6S9JT7P7biPfFK5AVYMhY6zKZrTr
 Tcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701429769; x=1702034569;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tDYTbMEHTA+PA+CkrLL7nufZCEtkNLGajLlCGSCmAZE=;
 b=HK75Jvv0j0eFmBOxGpn40SprD2AkBn2iExRUyZa/hcUp4MfjcKtOrC0fMWdETyAagP
 1n8ySfKsxYsPmiX3MvCrSa1wRm+i4sRkQxIOve+3ka5X6VlC1N8ph1JP0jcUmfwhCP4S
 2W74X9WZ8+NjI4i8OIhjRZRufbkYxAeC2banOuN/kdTuFORNxKTIWGLcUYqxB+VT7AAD
 Otb0F5c2k8Z1qTo+KZpMdWjWqVvHdew+uxzO/C/cMdydOHAQgrlX1ULj67KPoe8FfGFv
 3CQfpf1qcv4NhfB5GRuhiQPDda/VFKUYhAEF3x1g2IOMvjS+cZ0GYL2lXw/hNUwm6yU0
 HD1Q==
X-Gm-Message-State: AOJu0YxBWFFVlhhaJ8zhO6JHtXeN3bFayDkzz6KpKfaxOxFrFg6iPVnB
 aMr3nv4rAu/62I3SqCAjE2XLto4V890=
X-Google-Smtp-Source: AGHT+IF/kNTDoQQTbuA8uVZADKdRmi7YjxqAP2WFPIMlihKsslpNF/yUJ1acTPp4hs3YLYpCcnqKnw==
X-Received: by 2002:a05:6512:488:b0:50b:d764:2916 with SMTP id
 v8-20020a056512048800b0050bd7642916mr403101lfq.174.1701429768197; 
 Fri, 01 Dec 2023 03:22:48 -0800 (PST)
Received: from orome.fritz.box
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 r3-20020aa7d143000000b0053de19620b9sm1523779edo.2.2023.12.01.03.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 03:22:47 -0800 (PST)
Date: Fri, 1 Dec 2023 12:22:45 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 08/10] iommu/tegra: Use tegra_dev_iommu_get_stream_id()
 in the remaining places
Message-ID: <ZWnCBTWcxqJfemvR@orome.fritz.box>
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <8-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <ZWdlcboM4Xzs38NI@orome.fritz.box>
 <20231129192603.GA1387263@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TpTVMO/RkXn9/fAN"
Content-Disposition: inline
In-Reply-To: <20231129192603.GA1387263@nvidia.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Cc: linux-hyperv@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Laxman Dewangan <ldewangan@nvidia.com>,
 Hanjun Guo <guohanjun@huawei.com>, linux-riscv@lists.infradead.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Frank Rowand <frowand.list@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Wei Liu <wei.liu@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Jon Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 iommu@lists.linux.dev, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Haiyang Zhang <haiyangz@microsoft.com>, Vineet Gupta <vgupta@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Robin Murphy <robin.murphy@arm.com>, Hector Martin <marcan@marcan.st>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, asahi@lists.linux.dev,
 Sudeep Holla <sudeep.holla@arm.com>, dmaengine@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--TpTVMO/RkXn9/fAN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 03:26:03PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 29, 2023 at 05:23:13PM +0100, Thierry Reding wrote:
> > > diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/t=
egra186.c
> > > index 533f85a4b2bdb7..3e4fbe94dd666e 100644
> > > --- a/drivers/memory/tegra/tegra186.c
> > > +++ b/drivers/memory/tegra/tegra186.c
> > > @@ -111,21 +111,21 @@ static void tegra186_mc_client_sid_override(str=
uct tegra_mc *mc,
> > >  static int tegra186_mc_probe_device(struct tegra_mc *mc, struct devi=
ce *dev)
> > >  {
> > >  #if IS_ENABLED(CONFIG_IOMMU_API)
> > > -	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> > >  	struct of_phandle_args args;
> > >  	unsigned int i, index =3D 0;
> > > +	u32 sid;
> > > =20
> > > +	WARN_ON(!tegra_dev_iommu_get_stream_id(dev, &sid));
> >=20
> > I know the code previously didn't check for any errors, but we may want
> > to do so now. If tegra_dev_iommu_get_stream_id() ever fails we may end
> > up writing some undefined value into the override register.
>=20
> My assumption was it never fails otherwise this probably already
> doesn't work?

I guess the point I was trying to make is that previously we would not
have written anything to the stream ID register and so ignoring the
error here might end up writing to a register that previously we would
not have written to. Looking at the current code more closely I see now
that the reason why we wouldn't have written to the register is because
we would've crashed before.

So I think this okay.

>=20
> > I'm also unsure if WARN_ON() is appropriate here. I vaguely recall that
> > ->probe_device() was called for all devices on the bus and not all of
> > them may have been associated with the IOMMU. Not all of them may in
> > fact access memory in the first place.
>=20
> So you are thinkin that of_parse_phandle_with_args() is a NOP
> sometimes so it will tolerate the failure?
>=20
> Seems like the best thing to do is just continue to ignore it then?

Yeah, exactly. It would've just skipped over everything, basically.

> > Perhaps I'm misremembering and the IOMMU core now takes care of only
> > calling this when fwspec is indeed valid?
>=20
> Can't advise, I have no idea what tegra_mc_ops is for :)

In a nutshell, it's a hook that allows us to configure the memory
controller when a device is attached to the IOMMU. The memory controller
contains a set of registers that specify which memory client uses which
stream ID by default. For some devices this can be overridden (which is
where tegra_dev_iommu_get_stream_id() comes into play in those drivers)
and for other devices we can't override, which is when the memory
controller defaults come into play.

Anyway, I took a closer look at this and ran some tests. Turns out that
tegra186_mc_probe_device() really only gets called for devices that have
their fwspec properly initialized anyway, so I don't think there's
anything special we need to do here.

Strictly from a static analysis point of view I suppose we could now
have a situation that sid is uninitialized when the call to
tegra_dev_iommu_get_stream_id() fails and so using it in the loop is not
correct, theoretically, but I think that's just not a case that we'll
ever hit in practice.

So either way is fine with me. I have a slight preference for just
returning 0 in case tegra_dev_iommu_get_stream_id() fails, because it's
simple to do and avoids any of these (theoretical) ambiguities. So
whichever way you decide:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--TpTVMO/RkXn9/fAN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVpwgIACgkQ3SOs138+
s6HXLg/9HWFRkWBCsjCmwhdNLy/49eLCajrcOU069eBFBS0YM+rhIa4d/XwXv96C
WEC1AzUuDGAVKvfWbkjzCOtBKr+o0psunt8sHYRX+PtyekOF270j3ud+7Ny/6dQk
Ca9GevvG0yyYfEcSiowRZXKSzrhj4OSDS83QJbmBiyw3+VyA25+zO/C+Lzib1mG9
2Kn+od5hqOQFqylwazJAZy358DzVSmyF6iSR0kbmS5mvNrtWS/dT4Zeh2raYJgRn
MF+f0u+1M8i7Iv65/I5sG83I086p9ictlV1qkMGHY01q7uCAo5p2EM6KlP8Qv/N1
W+DZQpciP9+ENmkcYjEiNEnNw4efMQThCtXbB4VYxb8Jo/To8eV2/sOGUoLdhwWV
H8tPPCBfzYtSAsSNXpYK8gWQXCfaHjuO3SFe0itosbSHYw4x+SoECXTVi8L6GBwV
jDEYuyrcakUhR+vsxuOXlP4TzcIiNoCf1lO8LnfWVjoHcA/1dG1uA6Bup6CtNe+A
lS3xMmMXDVdZS49hw5EvUTd7Liu+si9RzLkmv4IGWBXlL01VTFYRygKZ1lZLKgPP
lZWUFLZPunTK7Mlew7PLW7GJg1MzsEkM3htQmVfWzPL7D95RKk3ufiOimGdzknro
ZaxbslDQOTUAoqgnKVnmzMJbfR+HTasb+X8EuoCb4G9dHDEPq1g=
=hKzE
-----END PGP SIGNATURE-----

--TpTVMO/RkXn9/fAN--
