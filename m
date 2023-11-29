Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DDF7FDCE9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 17:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517D510E631;
	Wed, 29 Nov 2023 16:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2DB10E631;
 Wed, 29 Nov 2023 16:23:19 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c8880f14eeso88619381fa.3; 
 Wed, 29 Nov 2023 08:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701274997; x=1701879797; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BE4DN2NIJid+M8TUF/vMVc9hXeYzBXdHSi7xojD4wk4=;
 b=ViSm8XG6LaMSqMyLqKN43dzS+1TgaU6r5vers8nvZS1n9yiWS5SPvgQqjXpPIl4ahO
 eLddiVaxo5u6ezDp4NP5eVIylxm4QnRyTQK39SpqQT/wyF8qkdSecwP4iCAHycjkxKHM
 Ohn8b2CpkQ8So7ass00P3a+PRjppaQPrFHgDyH6mdrXYlRq2hI5MRP/qBxUwp3d5k3rv
 Keef78xHJFbey2NTfLbm2lJIJ7+jbRhr+cOou44HIp6rmP/yztAaZxgHVzXluW5ns6aL
 FM5jX12AQ4yOqSJ5fh6Y1ggEAbZJhJ3x+PZOxnEUYGNm97iIzZloq5SHAym5/FvGZud1
 zw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701274997; x=1701879797;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BE4DN2NIJid+M8TUF/vMVc9hXeYzBXdHSi7xojD4wk4=;
 b=lRuX354RGZQVCzsCjNM2fTLlXg3xy/L6lWwZLKkRaVqZZSAH4dvnkVBpeDs9jVPkcP
 nQ8rpkjKpOkZ18Iee3YNSyPENKDphb0LbUPKbWgLnTvQAYzCZdFLTMc02J/H+cjyna0c
 MWoS/lXv2U8z0je3wv/H/8P9zXdUm0TMXWVDqWYhABNQKu2iuAT7zJz5w0FChP4PYkAp
 fXkjW9zbPNp0pb/2TZ2089pHZWYJ4/3Kbn8ECAK9/b9CVXtENdUCb0VkNGS6erHUhp7s
 gDmL3IkrUjKzT5Q0wdb+en2puzYLdcJ6jO/ZnIGKWsMkw1iNdF1y8BYYq9s0R/WHdY9F
 l/Bg==
X-Gm-Message-State: AOJu0YyAkWdtZFpvcZyuraqooDTeWcgOiLNWH+GsHNhAof3EnQn8rkRC
 wt7yGF7j02HTCjZRNuOUSIE=
X-Google-Smtp-Source: AGHT+IFpkXFRA9JtjkMulyQU+vE6lllIuj8DaTvHOgPc7kkDjVJCH1EZdgBzk/x+Nxw/nDpm1ZgC3Q==
X-Received: by 2002:a2e:9557:0:b0:2c9:b623:ddf1 with SMTP id
 t23-20020a2e9557000000b002c9b623ddf1mr3708530ljh.51.1701274997225; 
 Wed, 29 Nov 2023 08:23:17 -0800 (PST)
Received: from orome.fritz.box
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c501000b00407b93d8085sm2743768wmr.27.2023.11.29.08.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 08:23:16 -0800 (PST)
Date: Wed, 29 Nov 2023 17:23:13 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 08/10] iommu/tegra: Use tegra_dev_iommu_get_stream_id()
 in the remaining places
Message-ID: <ZWdlcboM4Xzs38NI@orome.fritz.box>
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <8-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OR6CuieIvqboqm08"
Content-Disposition: inline
In-Reply-To: <8-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
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


--OR6CuieIvqboqm08
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 08:48:04PM -0400, Jason Gunthorpe wrote:
> This API was defined to formalize the access to internal iommu details on
> some Tegra SOCs, but a few callers got missed. Add them.
>=20
> The helper already masks by 0xFFFF so remove this code from the callers.
>=20
> Suggested-by: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/dma/tegra186-gpc-dma.c                  |  8 +++-----
>  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c |  7 ++-----
>  drivers/memory/tegra/tegra186.c                 | 12 ++++++------
>  3 files changed, 11 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dm=
a.c
> index fa4d4142a68a21..88547a23825b18 100644
> --- a/drivers/dma/tegra186-gpc-dma.c
> +++ b/drivers/dma/tegra186-gpc-dma.c
> @@ -1348,8 +1348,8 @@ static int tegra_dma_program_sid(struct tegra_dma_c=
hannel *tdc, int stream_id)
>  static int tegra_dma_probe(struct platform_device *pdev)
>  {
>  	const struct tegra_dma_chip_data *cdata =3D NULL;
> -	struct iommu_fwspec *iommu_spec;
> -	unsigned int stream_id, i;
> +	unsigned int i;
> +	u32 stream_id;
>  	struct tegra_dma *tdma;
>  	int ret;
> =20
> @@ -1378,12 +1378,10 @@ static int tegra_dma_probe(struct platform_device=
 *pdev)
> =20
>  	tdma->dma_dev.dev =3D &pdev->dev;
> =20
> -	iommu_spec =3D dev_iommu_fwspec_get(&pdev->dev);
> -	if (!iommu_spec) {
> +	if (!tegra_dev_iommu_get_stream_id(&pdev->dev, &stream_id)) {
>  		dev_err(&pdev->dev, "Missing iommu stream-id\n");
>  		return -EINVAL;
>  	}
> -	stream_id =3D iommu_spec->ids[0] & 0xffff;
> =20
>  	ret =3D device_property_read_u32(&pdev->dev, "dma-channel-mask",
>  				       &tdma->chan_mask);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> index e7e8fdf3adab7a..b40fd1dbb21617 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> @@ -28,16 +28,13 @@ static void
>  gp10b_ltc_init(struct nvkm_ltc *ltc)
>  {
>  	struct nvkm_device *device =3D ltc->subdev.device;
> -	struct iommu_fwspec *spec;
> +	u32 sid;
> =20
>  	nvkm_wr32(device, 0x17e27c, ltc->ltc_nr);
>  	nvkm_wr32(device, 0x17e000, ltc->ltc_nr);
>  	nvkm_wr32(device, 0x100800, ltc->ltc_nr);
> =20
> -	spec =3D dev_iommu_fwspec_get(device->dev);
> -	if (spec) {
> -		u32 sid =3D spec->ids[0] & 0xffff;
> -
> +	if (tegra_dev_iommu_get_stream_id(device->dev, &sid)) {
>  		/* stream ID */
>  		nvkm_wr32(device, 0x160000, sid << 2);

We could probably also remove the comment now since the function and
variable names make it obvious what's being written here.

>  	}
> diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra=
186.c
> index 533f85a4b2bdb7..3e4fbe94dd666e 100644
> --- a/drivers/memory/tegra/tegra186.c
> +++ b/drivers/memory/tegra/tegra186.c
> @@ -111,21 +111,21 @@ static void tegra186_mc_client_sid_override(struct =
tegra_mc *mc,
>  static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *=
dev)
>  {
>  #if IS_ENABLED(CONFIG_IOMMU_API)
> -	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>  	struct of_phandle_args args;
>  	unsigned int i, index =3D 0;
> +	u32 sid;
> =20
> +	WARN_ON(!tegra_dev_iommu_get_stream_id(dev, &sid));

I know the code previously didn't check for any errors, but we may want
to do so now. If tegra_dev_iommu_get_stream_id() ever fails we may end
up writing some undefined value into the override register.

I'm also unsure if WARN_ON() is appropriate here. I vaguely recall that
->probe_device() was called for all devices on the bus and not all of
them may have been associated with the IOMMU. Not all of them may in
fact access memory in the first place.

Perhaps I'm misremembering and the IOMMU core now takes care of only
calling this when fwspec is indeed valid?

Thierry

--OR6CuieIvqboqm08
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVnZW8ACgkQ3SOs138+
s6H3xA/+PnJPzNAATgGeEaxpY8VPfo7h0kY98vc1QYnUCiV46yzQPUq+/nVkkq24
ybBtQ8hr0vl4ZxtflekHYxb0WsXO560ODmmckXEYPWRfVyxckFz+CRyvDx+zxyxJ
d/TtD8p0l6DGFlZGume2h/cDafF5+3td2JEJ2vEfu0tMmRLIFC7L+Pj2IB4/Fz21
2M6M6T0Al7obecinfW9jzg00G20RybQSrdPq+H9z3BNhOXGKy+1fjIzCsnr4H0gD
kE4WooU9uLbMdpEYYZ8idqC1OieIr6p2IF802/4/TAvWHreHlH7uPcDRry8rxkwQ
j0CAwBlcvLLtLj2pw7kYgxMpXwahgXSuhxX42CXDWsUUW4mxiZkvG0o8Cv2EGtSD
emTIMrC3w1R2MSemI8+RQdOHhOnTNC0sADGo9EyurPrYC9TzwqTOPI35kNqJ8ZAw
zCmhDKieZM9dxlOdFrpC+eLz8eVEjo5oV+OchMT6k8nw7TkD6dGHBOJlDhQeJNWZ
tZBnlBamoEmlD5Kz/Oe90S47MnYtx8EX7o9bpEV6/ZO13P+F07rasP3l6hCJuybO
c2YAeCxY8cuwHLnIJZTm3hR7UU9PQwPn4utolLuSqaXkL5wSdVr+1eZyTye25W0J
CSzMCL3SkMgfKaZ7L6ptSRFtOWxiH6943ahvYpDBXlgEp/R9aVg=
=ORi/
-----END PGP SIGNATURE-----

--OR6CuieIvqboqm08--
