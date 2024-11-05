Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896D79BD055
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 16:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C4610E5CD;
	Tue,  5 Nov 2024 15:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S9Iq4Wg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714C510E406;
 Tue,  5 Nov 2024 15:26:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DDE0EA43422;
 Tue,  5 Nov 2024 15:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F5CC4CECF;
 Tue,  5 Nov 2024 15:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730820411;
 bh=OyFK8z5qd2PX1b2mFjzhp33XMWRNRnaVbtklFXmouuA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=S9Iq4Wg+y13VlLFXaCQFBHoEgqCWwKO3J18E6ea4A9GXtutCKimycjyX2UFxyAhoF
 V4zfgXb+m4cZ7L2DVprXpqm4toiyK4X3fHoT0bFJC1hfvM+d29JMkfSCUtDadGZ1mM
 gT0lycJy0BIpkCVswsVeI1OtIeIJ6mh/cAV5ueBJEksXiYYTLfI2txEbP+TVdv+InM
 k+R+IoMimw7bxRmY3j+VQL++psf2Y8wUojmN2FH2obDVCN3oClU+GQmcZHilH7wLQo
 Uq5K49ASfVd1DC1B9B9WpCVygRAayMBQMhrPc0fqW+EnQJzM392ryKWN7Ckjb77xSI
 s/iv9g17O3mZw==
Date: Tue, 5 Nov 2024 09:26:50 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Logan Gunthorpe <logang@deltatee.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-cxl@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 05/10] sysfs: treewide: constify attribute callback of
 bin_is_visible()
Message-ID: <20241105152650.GA1472729@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
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

On Sun, Nov 03, 2024 at 05:03:34PM +0000, Thomas Weißschuh wrote:
> The is_bin_visible() callbacks should not modify the struct
> bin_attribute passed as argument.
> Enforce this by marking the argument as const.
> 
> As there are not many callback implementers perform this change
> throughout the tree at once.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# drivers/pci

> ---
>  drivers/cxl/port.c                      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c |  2 +-
>  drivers/infiniband/hw/qib/qib_sysfs.c   |  2 +-
>  drivers/mtd/spi-nor/sysfs.c             |  2 +-
>  drivers/nvmem/core.c                    |  3 ++-
>  drivers/pci/pci-sysfs.c                 |  2 +-
>  drivers/pci/vpd.c                       |  2 +-
>  drivers/platform/x86/amd/hsmp.c         |  2 +-
>  drivers/platform/x86/intel/sdsi.c       |  2 +-
>  drivers/scsi/scsi_sysfs.c               |  2 +-
>  drivers/usb/core/sysfs.c                |  2 +-
>  include/linux/sysfs.h                   | 30 +++++++++++++++---------------
>  12 files changed, 27 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/cxl/port.c b/drivers/cxl/port.c
> index 9dc394295e1fcd1610813837b2f515b66995eb25..24041cf85cfbe6c54c467ac325e48c775562b938 100644
> --- a/drivers/cxl/port.c
> +++ b/drivers/cxl/port.c
> @@ -173,7 +173,7 @@ static ssize_t CDAT_read(struct file *filp, struct kobject *kobj,
>  static BIN_ATTR_ADMIN_RO(CDAT, 0);
>  
>  static umode_t cxl_port_bin_attr_is_visible(struct kobject *kobj,
> -					    struct bin_attribute *attr, int i)
> +					    const struct bin_attribute *attr, int i)
>  {
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct cxl_port *port = to_cxl_port(dev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index 0b28b2cf1517d130da01989df70b9dff6433edc4..c1c329eb920b52af100a93bdf00df450e25608c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -3999,7 +3999,7 @@ static umode_t amdgpu_flash_attr_is_visible(struct kobject *kobj, struct attribu
>  }
>  
>  static umode_t amdgpu_bin_flash_attr_is_visible(struct kobject *kobj,
> -						struct bin_attribute *attr,
> +						const struct bin_attribute *attr,
>  						int idx)
>  {
>  	struct device *dev = kobj_to_dev(kobj);
> diff --git a/drivers/infiniband/hw/qib/qib_sysfs.c b/drivers/infiniband/hw/qib/qib_sysfs.c
> index 53ec7510e4ebfb144e79884ca7dd7d0c873bd8a7..ba2cd68b53e6c240f1afc65c64012c75ccf488e0 100644
> --- a/drivers/infiniband/hw/qib/qib_sysfs.c
> +++ b/drivers/infiniband/hw/qib/qib_sysfs.c
> @@ -283,7 +283,7 @@ static struct bin_attribute *port_ccmgta_attributes[] = {
>  };
>  
>  static umode_t qib_ccmgta_is_bin_visible(struct kobject *kobj,
> -				 struct bin_attribute *attr, int n)
> +				 const struct bin_attribute *attr, int n)
>  {
>  	struct qib_pportdata *ppd = qib_get_pportdata_kobj(kobj);
>  
> diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
> index 96064e4babf01f6950c81586764386e7671cbf97..5e9eb268073d18e0a46089000f18a3200b4bf13d 100644
> --- a/drivers/mtd/spi-nor/sysfs.c
> +++ b/drivers/mtd/spi-nor/sysfs.c
> @@ -87,7 +87,7 @@ static umode_t spi_nor_sysfs_is_visible(struct kobject *kobj,
>  }
>  
>  static umode_t spi_nor_sysfs_is_bin_visible(struct kobject *kobj,
> -					    struct bin_attribute *attr, int n)
> +					    const struct bin_attribute *attr, int n)
>  {
>  	struct spi_device *spi = to_spi_device(kobj_to_dev(kobj));
>  	struct spi_mem *spimem = spi_get_drvdata(spi);
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 63370c76394ee9b8d514da074779617cef67c311..73e44d724f90f4cd8fe8cafb9fa0c0fb23078e61 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -298,7 +298,8 @@ static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
>  }
>  
>  static umode_t nvmem_bin_attr_is_visible(struct kobject *kobj,
> -					 struct bin_attribute *attr, int i)
> +					 const struct bin_attribute *attr,
> +					 int i)
>  {
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct nvmem_device *nvmem = to_nvmem_device(dev);
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 040f01b2b999175e8d98b05851edc078bbabbe0d..13912940ed2bb66c0086e5bea9a3cb6417ac14dd 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -1326,7 +1326,7 @@ static struct bin_attribute *pci_dev_rom_attrs[] = {
>  };
>  
>  static umode_t pci_dev_rom_attr_is_visible(struct kobject *kobj,
> -					   struct bin_attribute *a, int n)
> +					   const struct bin_attribute *a, int n)
>  {
>  	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
>  
> diff --git a/drivers/pci/vpd.c b/drivers/pci/vpd.c
> index e4300f5f304f3ca55a657fd25a1fa5ed919737a7..a469bcbc0da7f7677485c7f999f8dfb58b8ae8a3 100644
> --- a/drivers/pci/vpd.c
> +++ b/drivers/pci/vpd.c
> @@ -325,7 +325,7 @@ static struct bin_attribute *vpd_attrs[] = {
>  };
>  
>  static umode_t vpd_attr_is_visible(struct kobject *kobj,
> -				   struct bin_attribute *a, int n)
> +				   const struct bin_attribute *a, int n)
>  {
>  	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
>  
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 8fcf38eed7f00ee01aade6e3e55e20402458d5aa..8f00850c139fa8d419bc1c140c1832bf84b2c3bd 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -620,7 +620,7 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  }
>  
>  static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -					 struct bin_attribute *battr, int id)
> +					 const struct bin_attribute *battr, int id)
>  {
>  	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
>  		return battr->attr.mode;
> diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/intel/sdsi.c
> index 9d137621f0e6e7a23be0e0bbc6175c51c403169f..33f33b1070fdc949c1373251c3bca4234d9da119 100644
> --- a/drivers/platform/x86/intel/sdsi.c
> +++ b/drivers/platform/x86/intel/sdsi.c
> @@ -541,7 +541,7 @@ static struct bin_attribute *sdsi_bin_attrs[] = {
>  };
>  
>  static umode_t
> -sdsi_battr_is_visible(struct kobject *kobj, struct bin_attribute *attr, int n)
> +sdsi_battr_is_visible(struct kobject *kobj, const struct bin_attribute *attr, int n)
>  {
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct sdsi_priv *priv = dev_get_drvdata(dev);
> diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
> index 32f94db6d6bf5d2bd289c1a121da7ffc6a7cb2ff..f3a1ecb42128a2b221ca5c362e041eb59dba0f20 100644
> --- a/drivers/scsi/scsi_sysfs.c
> +++ b/drivers/scsi/scsi_sysfs.c
> @@ -1274,7 +1274,7 @@ static umode_t scsi_sdev_attr_is_visible(struct kobject *kobj,
>  }
>  
>  static umode_t scsi_sdev_bin_attr_is_visible(struct kobject *kobj,
> -					     struct bin_attribute *attr, int i)
> +					     const struct bin_attribute *attr, int i)
>  {
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct scsi_device *sdev = to_scsi_device(dev);
> diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
> index 61b6d978892c799e213018bed22d9fb12a19d429..b4cba23831acd2d7d395b9f7683cd3ee3a8623c8 100644
> --- a/drivers/usb/core/sysfs.c
> +++ b/drivers/usb/core/sysfs.c
> @@ -925,7 +925,7 @@ static struct bin_attribute *dev_bin_attrs[] = {
>  };
>  
>  static umode_t dev_bin_attrs_are_visible(struct kobject *kobj,
> -		struct bin_attribute *a, int n)
> +		const struct bin_attribute *a, int n)
>  {
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct usb_device *udev = to_usb_device(dev);
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index 4746cccb95898b24df6f53de9421ea7649b5568f..d1b22d56198b55ee39fe4c4fc994f5b753641992 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -101,7 +101,7 @@ struct attribute_group {
>  	umode_t			(*is_visible)(struct kobject *,
>  					      struct attribute *, int);
>  	umode_t			(*is_bin_visible)(struct kobject *,
> -						  struct bin_attribute *, int);
> +						  const struct bin_attribute *, int);
>  	size_t			(*bin_size)(struct kobject *,
>  					    const struct bin_attribute *,
>  					    int);
> @@ -199,22 +199,22 @@ struct attribute_group {
>   * attributes, the group visibility is determined by the function
>   * specified to is_visible() not is_bin_visible()
>   */
> -#define DEFINE_SYSFS_BIN_GROUP_VISIBLE(name)                             \
> -	static inline umode_t sysfs_group_visible_##name(                \
> -		struct kobject *kobj, struct bin_attribute *attr, int n) \
> -	{                                                                \
> -		if (n == 0 && !name##_group_visible(kobj))               \
> -			return SYSFS_GROUP_INVISIBLE;                    \
> -		return name##_attr_visible(kobj, attr, n);               \
> +#define DEFINE_SYSFS_BIN_GROUP_VISIBLE(name)                                   \
> +	static inline umode_t sysfs_group_visible_##name(                      \
> +		struct kobject *kobj, const struct bin_attribute *attr, int n) \
> +	{                                                                      \
> +		if (n == 0 && !name##_group_visible(kobj))                     \
> +			return SYSFS_GROUP_INVISIBLE;                          \
> +		return name##_attr_visible(kobj, attr, n);                     \
>  	}
>  
> -#define DEFINE_SIMPLE_SYSFS_BIN_GROUP_VISIBLE(name)                   \
> -	static inline umode_t sysfs_group_visible_##name(             \
> -		struct kobject *kobj, struct bin_attribute *a, int n) \
> -	{                                                             \
> -		if (n == 0 && !name##_group_visible(kobj))            \
> -			return SYSFS_GROUP_INVISIBLE;                 \
> -		return a->mode;                                       \
> +#define DEFINE_SIMPLE_SYSFS_BIN_GROUP_VISIBLE(name)                         \
> +	static inline umode_t sysfs_group_visible_##name(                   \
> +		struct kobject *kobj, const struct bin_attribute *a, int n) \
> +	{                                                                   \
> +		if (n == 0 && !name##_group_visible(kobj))                  \
> +			return SYSFS_GROUP_INVISIBLE;                       \
> +		return a->mode;                                             \
>  	}
>  
>  #define SYSFS_GROUP_VISIBLE(fn) sysfs_group_visible_##fn
> 
> -- 
> 2.47.0
> 
