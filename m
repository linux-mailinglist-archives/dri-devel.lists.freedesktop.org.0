Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3388CA86D
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E46E10E111;
	Tue, 21 May 2024 07:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eUBkMohU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0458810E149;
 Tue, 21 May 2024 05:32:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCDMQ09/bvfUbGlQbR1PZTZt7wTMIqiaSA52FYXIgPh9X9xdfwXB0JJAVtXWX+6thI+tLvFi5T/W+7hBdLVtiaApJ3e3STrhJtjB1ZYFwCV38Zgn9CVkuZCIbU6sDipes5PMFiufnndN09XBSnBxWYM5EyY/YhL0YS9ZpFa0eOauL1ryJVbRAyjumy8Glfw25feOKtTZ97nnJdZN+Jb4btTeD8e39x1pl6n0Q7IP3fBRp9ayGtiun/cABEax018/GnVrghO7u1fmmmgnmPntp8FTl7f0YQsR39/zWfgGowU38CsOLky6dA5+Cg57kBHXrVVhuLhKKxPz6NVadvD1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pstbe91UcByHUI2rX6yclJjmfZwRKdxBJLtJ+KsLJic=;
 b=DpW9ouly1oAl55dFsUQwwE/n3iGLskrAxZApdTE/3P9yAaUrtWEqJ2pmOYbUnc/QNM0OxxsMfdEYCTdu3LbS2ZUazXZFlSXyBz4vmeRIPF+54ehslsJf1k+6fAVJUBFxgEc31i77pZEOAUh0U2mURK+aBikTrqD06Y9xMRYeKjQ8JBTZAVGM9WMvMlAvjczmWD3QxuY98DlG+xybvEwuSWO+pPqLtuHEUUOQmiEViZzTB1HToIhTJ/MWVxnqnaKHbsLTFh+YbQk/Z+Q8Ezzf6wbvpiq5YqLoZyRrlBZ2x9OPI5qKjWK5CJUfYI9xHAbFwoleVROnMWZa1VIBS54YLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pstbe91UcByHUI2rX6yclJjmfZwRKdxBJLtJ+KsLJic=;
 b=eUBkMohU9ktXT6HK5cXLm8UaY6BEbDBCLhH/cEnkTGHwcGrmuXJOvCqfBuu/WdOx3Ec+h2GDE2bc7v53tND4TGoyKqcS8Po1YP4B4UcA67pWBWhYwJaEWbxisjvigp6+voDYatm5QGJ36fInW8PTO8VVZangrPYAqWVUXCls3ACWwOyy8E8j9f5E0UXKjRl1yPMYJv/MnVTPsDCDvQcmebWpEsw5CjPCA19+cesg7lgdgm/J1Dev0kngD8DqZ0K4QGSg+FYVTtK3HVOSr7i+22SPSL6Vr+KKdjscHJOn08iON2ZBp0tSxVUVamKIKNxf0YPmnKQikdwHGXz83hXj/A==
Received: from SA9P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::33)
 by CY8PR12MB7609.namprd12.prod.outlook.com (2603:10b6:930:99::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 05:32:57 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:25:cafe::44) by SA9P221CA0028.outlook.office365.com
 (2603:10b6:806:25::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 05:32:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 05:32:56 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 20 May
 2024 22:32:39 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 20 May
 2024 22:32:39 -0700
Received: from localhost (10.127.8.10) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Mon, 20 May 2024 22:32:34 -0700
Date: Tue, 21 May 2024 08:32:31 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <wedsonaf@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@samsung.com>, <aliceryhl@google.com>,
 <fujita.tomonori@gmail.com>, <lina@asahilina.net>, <pstanner@redhat.com>,
 <ajanulgu@redhat.com>, <lyude@redhat.com>, <gregkh@linuxfoundation.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <20240521083231.000074c2.zhiw@nvidia.com>
In-Reply-To: <20240520172422.181763-4-dakr@redhat.com>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|CY8PR12MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 108f9c62-773c-4c96-87fe-08dc79577861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|1800799015|82310400017|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A4r8yspaop0dvsSthELRqxU5FVqnBXolMFBAFY3tav3QD7iVWJdgmoV14QDL?=
 =?us-ascii?Q?7bTV0/s8nEBL+nnDF62NL2m9p2bXXY28RxeCRktzQ0kofZf6KG6lnbl+Z7C/?=
 =?us-ascii?Q?ZEfbMme/Y0DEJGJ6TboZ/FcUaIYetH46SrCbU+oqjelgE/lGmxuke3BPtd2D?=
 =?us-ascii?Q?lzz+xaSCeOsQkjcwEbLB8Em2Fr15Z/jYJdRy83nui4BBTQx9v0c+e7Zsdt9d?=
 =?us-ascii?Q?D/48BAtbAYbd1ekckPOrEF3Skf6ha/5Iylx62xJqVAysd1W1FAh5H+lKX/e/?=
 =?us-ascii?Q?z5+Pd3Ui1XvqQ5nIuzKAEO1xmPt7h5zoNvd/lBqU8r3ZuzLn4kVITFPhxPf6?=
 =?us-ascii?Q?QB2EjguguZAhyDApnW9lXM46b/dv3nmf641DidtFAPRrhqwt6M+gbOWeOHvi?=
 =?us-ascii?Q?nbuGTtVdDAEi5WVgMkE7Nu2xS5+ZfDnLQqETVeoMgP9lh1FxTdr942AH1OE5?=
 =?us-ascii?Q?KsBgNBNhxpE1ZsHXYr/7InRz1w16sFc7+EtyZuxpsm0EPCFvWYWvZ+sLJCQg?=
 =?us-ascii?Q?Ksl6PEMSupC0Q/4OxwpS9F1wDUqcBrgwD21Av5v7St8mL8v5cYLbTyls4bxE?=
 =?us-ascii?Q?RW7az9Yf+L2KZ8EqbDiq5moxrGjNacBacz69VEZS6OP2zxqh9ZYxqE2NDk2r?=
 =?us-ascii?Q?4Kmk3UtaceErYYWtuuBrqz07jblNpAvIMrIAaxDh3DW8L208iL8Ou79Ess6p?=
 =?us-ascii?Q?blrkQ1xs6cuqaO33Xqb8YvwTMSPLapJooJl9hBpG+jaKZVUl2UHl5l9NUuWR?=
 =?us-ascii?Q?xT8t0PA4R9rL4JknVJd7O7IPYR9xoc8btg1pVHhoc08sP5Xomib8+VicQ2mm?=
 =?us-ascii?Q?VyVNg85WOzLYVjUFkLoyYk6NPyI2eWvNo5wisy4cmhwjtVd+ht3MbQNyhF+U?=
 =?us-ascii?Q?jWD8g1ZQtaYRWEGUZQbBIix3OikDN+scnNBssnWpcePkrP5qopHdvU7vHt5f?=
 =?us-ascii?Q?fjXNtLk1uT5RnnrRIZsJE3Kw0+JAsWVzTTYompwHJqXHGAmdlYt84Ac8Hujs?=
 =?us-ascii?Q?DEUd8b/nrECaw6+xOjEOVymWlVjh/UmVGoIg3zcqmSHDsGMe1SWvEQIaXUD6?=
 =?us-ascii?Q?HsNy2H2gQHsn89b6DiJ9lNPMs/PekWOfvW9y0qHUNWoqtOLLr5IOuRUYRwex?=
 =?us-ascii?Q?YZWYVCXqLwRdyZKmXTij2MNoR36ZzRn/uTlECNbYXXKMvUruXovvACA4Nldh?=
 =?us-ascii?Q?LQycJooeW7q42EVN2wpF1PMdxkh0nFcEdPNBiBuHjhV09/9AAeE58umQE5vB?=
 =?us-ascii?Q?VN1pBk6PkckJfQnetZXIyi/Pg82kky5gekz9uZEYQb77F4uCLewkKVMmGMiy?=
 =?us-ascii?Q?muD53h+ZteGlwCUeiZceVrc3IegIL55uQXPOswc2iTmdyT9GaGK6+zkChCAT?=
 =?us-ascii?Q?l9030p0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(82310400017)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 05:32:56.7134 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 108f9c62-773c-4c96-87fe-08dc79577861
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7609
X-Mailman-Approved-At: Tue, 21 May 2024 07:08:13 +0000
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

On Mon, 20 May 2024 19:24:19 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> Add an abstraction around the kernels firmware API to request firmware
> images. The abstraction provides functions to access the firmware
> buffer and / or copy it to a new buffer allocated with a given
> allocator backend.
> 

Was playing with firmware extractions based on this patch.
Unfortunately I ended up with a lot of pointer operations, unsafe
statements.

As we know many vendors have a C headers for the definitions of the
firwmare content, the driver extract the data by applying a struct
pointer on it.

But in rust, I feel it would nice that we can also have a common
firmware extractor for drivers, that can wrap the pointer operations,
take a list of the firmware struct members that converted from C headers
as the input, offer the driver some common ABI methods to query them.
Maybe that would ease the pain a lot.

Thanks,
Zhi.

> The firmware is released once the abstraction is dropped.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/firmware.rs         | 74
> +++++++++++++++++++++++++++++++++ rust/kernel/lib.rs              |
> 1 + 3 files changed, 76 insertions(+)
>  create mode 100644 rust/kernel/firmware.rs
> 
> diff --git a/rust/bindings/bindings_helper.h
> b/rust/bindings/bindings_helper.h index b245db8d5a87..e4ffc47da5ec
> 100644 --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -14,6 +14,7 @@
>  #include <kunit/test.h>
>  #include <linux/errname.h>
>  #include <linux/ethtool.h>
> +#include <linux/firmware.h>
>  #include <linux/jiffies.h>
>  #include <linux/mdio.h>
>  #include <linux/pci.h>
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> new file mode 100644
> index 000000000000..700504fb3c9c
> --- /dev/null
> +++ b/rust/kernel/firmware.rs
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Firmware abstraction
> +//!
> +//! C header:
> [`include/linux/firmware.h`](../../../../include/linux/firmware.h") +
> +use crate::{bindings, device::Device, error::Error, error::Result,
> str::CStr, types::Opaque}; +
> +/// Abstraction around a C firmware struct.
> +///
> +/// This is a simple abstraction around the C firmware API. Just
> like with the C API, firmware can +/// be requested. Once requested
> the abstraction provides direct access to the firmware buffer as +///
> `&[u8]`. Alternatively, the firmware can be copied to a new buffer
> using `Firmware::copy`. The +/// firmware is released once
> [`Firmware`] is dropped. +/// +/// # Examples
> +///
> +/// ```
> +/// let fw = Firmware::request("path/to/firmware.bin",
> dev.as_ref())?; +/// driver_load_firmware(fw.data());
> +/// ```
> +pub struct Firmware(Opaque<*const bindings::firmware>);
> +
> +impl Firmware {
> +    /// Send a firmware request and wait for it. See also
> `bindings::request_firmware`.
> +    pub fn request(name: &CStr, dev: &Device) -> Result<Self> {
> +        let fw = Opaque::uninit();
> +
> +        let ret = unsafe { bindings::request_firmware(fw.get(),
> name.as_char_ptr(), dev.as_raw()) };
> +        if ret != 0 {
> +            return Err(Error::from_errno(ret));
> +        }
> +
> +        Ok(Firmware(fw))
> +    }
> +
> +    /// Send a request for an optional fw module. See also
> `bindings::request_firmware_nowarn`.
> +    pub fn request_nowarn(name: &CStr, dev: &Device) -> Result<Self>
> {
> +        let fw = Opaque::uninit();
> +
> +        let ret = unsafe {
> +            bindings::firmware_request_nowarn(fw.get(),
> name.as_char_ptr(), dev.as_raw())
> +        };
> +        if ret != 0 {
> +            return Err(Error::from_errno(ret));
> +        }
> +
> +        Ok(Firmware(fw))
> +    }
> +
> +    /// Returns the size of the requested firmware in bytes.
> +    pub fn size(&self) -> usize {
> +        unsafe { (*(*self.0.get())).size }
> +    }
> +
> +    /// Returns the requested firmware as `&[u8]`.
> +    pub fn data(&self) -> &[u8] {
> +        unsafe {
> core::slice::from_raw_parts((*(*self.0.get())).data, self.size()) }
> +    }
> +}
> +
> +impl Drop for Firmware {
> +    fn drop(&mut self) {
> +        unsafe { bindings::release_firmware(*self.0.get()) };
> +    }
> +}
> +
> +// SAFETY: `Firmware` only holds a pointer to a C firmware struct,
> which is safe to be used from any +// thread.
> +unsafe impl Send for Firmware {}
> +
> +// SAFETY: `Firmware` only holds a pointer to a C firmware struct,
> references to which are safe to +// be used from any thread.
> +unsafe impl Sync for Firmware {}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6415968ee3b8..ed97d131661a 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -35,6 +35,7 @@
>  #[cfg(CONFIG_DRM = "y")]
>  pub mod drm;
>  pub mod error;
> +pub mod firmware;
>  pub mod init;
>  pub mod ioctl;
>  #[cfg(CONFIG_KUNIT)]

