Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909AAAA5F8B
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 15:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4943110E360;
	Thu,  1 May 2025 13:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uWVSSr9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A475410E360;
 Thu,  1 May 2025 13:52:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRAOIpXanIABdZQqmPQ6LTx+NYeNMi99X/nJrMwy0yJtrmZzM1fMsimSy7Xy9nD5scKj9SYX0abPd/3uJ4/Pca/hhRta/zJag3dTgr3MAZYHO7EVYPJ7uX4ixXSVuqBstzLwKrGIK0C962dVuJ8b8lGJDOKUKdL9dDbvD/dk63wiNcUuubvMylJV+rTQGqb3wcHSzn32U6Yn6uxHqXh+0DRLqCDx/j2ltTBOVu4PT7ank2tWMgHcEpYsPdl84cxK1TBeSrVlxfKqjWb7THJ4D4+/oZ8ECkOYsqk18SY+o5g6W7RgCuCn6cOG/EemmMG8VPdGzeEL+QeS7oLRfojgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31AjLCZLVksDZUHKANMVkw2Xe0ZjSlfwbVsMO2Gke5A=;
 b=S5Mg221PltFRC7KXRALU0cemvt4IBQHGrdLztVfmuIkEpIVcao+gGQWDtFtKxsSO1WX6UPK+Zr1KyLTX+1/Fkne+FDcvarfFi4bVImjFhy5UCCnqPXksF0obEO9ZvExFaWHk9Grfxjqr35xWXT6CPwBVyumy1QInmwEnoQ8bEV6n4lvx/B4X0tsdjjz95IFKLQOnnqWQ1GrmDTjdEBM6wZ6eKVH9tFeY4eZLLk/j0ksR084BNGNyih7PDLWbpdJ+ja8QGQTr/U98s0e628uBgIhjrpuCVfo0GTiXnwGmfdbsOb2QLc/ZbVbIXvl5S8BJlosMv0YcBN7s5EXuAmcLCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31AjLCZLVksDZUHKANMVkw2Xe0ZjSlfwbVsMO2Gke5A=;
 b=uWVSSr9o2e1BtJa6lWnm1tnuqowsfUlCZVxreWfyjn6U2eKyPwmGuy+oYq1zFlG2x7ZZfS/OWKH6n50dYWZuFvD/855gSKH0UrjtsPYWWMpp564S6Smx9QgssDHQSwDvzHvl8xUh52Q0FD5QLQNjfqfxrJ5rm6mMA/ydFmlgg9MTkGdl23MO3BL5moVIXtWpAb6Cpt2tNmbI9xFxv/Z/ppIg/+YFaCcTHx++GNGma0EC3YAibeFhWWUEWPfB9ArrAw76gZPbMW94mPu5ApWCPLs+J0BS8fq/1jNCEhPEorlf64H9NvnRqyHBg6dhS88Nsij2trEnsrholnKi0M6f9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA0PR12MB8327.namprd12.prod.outlook.com (2603:10b6:208:40e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 13:52:37 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Thu, 1 May 2025
 13:52:36 +0000
Date: Thu, 1 May 2025 09:52:34 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 15/21] gpu: nova-core: add falcon register definitions
 and base code
Message-ID: <20250501135234.GA687268@joelnvbox>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-15-b4a137175337@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501-nova-frts-v2-15-b4a137175337@nvidia.com>
X-ClientProxiedBy: MN2PR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:208:d4::49) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA0PR12MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a0e59b-bcb7-4d84-94ce-08dd88b76e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i2pFtV8ZEy7RzrQbxw51UQV5H2dibjnQreCB0zpxIUtnSvIuUFWkQjB/Nn+A?=
 =?us-ascii?Q?JlvxmloDV04d3HC5irDqAwr4ofEx/MjeC5LvV8mP/OpVhoR3i7hXYl0tl+sG?=
 =?us-ascii?Q?AYFiidQT0yly+Okk9jPkp57Q8KQByj/eVmo7m0ZtoxlttlHrFMGXe3q+a50g?=
 =?us-ascii?Q?AOwP3L6rMcP5x45GbG7GKDIM3LGTavfyHBsFSFmxR4sXlr+Fd74W09ubQEsK?=
 =?us-ascii?Q?XKI2kCECpYptN5f6F+8ODXIJPFeXmzHy+xK19gHzyuOXeNLBjsFFVUhoHYfr?=
 =?us-ascii?Q?+evIv2lwolhl6VJWohI9cACgkFg/cadnPgnhWVPOk7ZBAtN0reTF8MaY3LWR?=
 =?us-ascii?Q?fmEF/NCrJeeRX4+sMbTVePjMz03WllCBEFRytB5Lzd48pufHMroDVjt8TEVR?=
 =?us-ascii?Q?UpdEMxD/oGBQ8Z2yp3zZn6Dg1Qd/3WMEpf1f/uB+zW6aDYrzoqN9ipuSLDhx?=
 =?us-ascii?Q?VvAlkZm96/IVHMUNre+dQLmJ13c3iwQqinr7hM1oJvoziDLq10YCZuenP00p?=
 =?us-ascii?Q?ttJHwwg2gUq1kvmGqjZp3s4VqPtFNsccUP63OzsdwGIPZDtm91sPOmA9TJop?=
 =?us-ascii?Q?tWHCEDUd7rjrPj4B+UxOF+xx8U8jTyj0qMS+C1V4wZD4uGyQXb2g3tSyG0TI?=
 =?us-ascii?Q?tLVh1HmKlOQ7dtVNXZnW5U2gWlv8y33FRJDUuLoxpZbkn3wyL7cXW1Go0nH8?=
 =?us-ascii?Q?BWvcY8CeSQ/MLTJJQuECAzpk0fxhnxrNTM3aka+AYcicSl7QcsgSrJnAqcfU?=
 =?us-ascii?Q?rHCHvaZxDrZO7SDh+ro8nGSz320CyXdL7AQDtlXZtd7lRQkzfNcwfhWIiy+b?=
 =?us-ascii?Q?EC02RzpbCVZM2cAATxfwATD5A398plrWzu35To6Pr18XhIREELKCRqG2c338?=
 =?us-ascii?Q?X9NcgM7ENJ2DwqhWGbNm8FeMI5T9/uezoq00KEl8qlJLp6hi33dRYIBb3Mxe?=
 =?us-ascii?Q?GVkW2bhICdsLidIIOzkK/qwW+g9MCyc7oUJZmZf1RdkXoCXY37vYM6De+4OU?=
 =?us-ascii?Q?WQDNm6gYOvqrhoQsAjxl3uBkjqIm2jE/KS/GHeFHMOMYAoh8+HKGtpzigMv0?=
 =?us-ascii?Q?gTZGcojTg5l9OmhN0V7p6UO+RwVmSDD8a4ADL9QfMKBEJ2pR22BeQNnVD5aD?=
 =?us-ascii?Q?IEq1Cci/Jv0SIBz6QEQFg7uxMtvt05Ww5lSG1Q/uyGvB4VSr1BbBHEeoI2Jx?=
 =?us-ascii?Q?HtzYr8pYRWiZxx9uS8pg5nIjPWIsMUqZmVFO0hph4o5cnw465FJOQCABY32b?=
 =?us-ascii?Q?A+iABDtiV5o6dV/jSOPFNWtNwBpSovuXPCoG/0F1GXEA9g6I2O22aQCEnZbX?=
 =?us-ascii?Q?xuXHE9z6bpRzD4I7WgLwyM+wLYwDoWx8J41HmdLrrCwMj3qNiqKoRM6kQUH4?=
 =?us-ascii?Q?rea4QjY/v9q/rrRZyZPwMcW1aDlABqS5eKrNgTJ3h6zncloqbnjr+Qcasf/i?=
 =?us-ascii?Q?KVaUSv1wZOk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9RBacsFntWu3HR8Wc511xfRp3cpfVVj8BCkvKGRBkARNoZ02e5Wi3up2b+us?=
 =?us-ascii?Q?8zT5o9rINt8TSEmID6w/aSFtWBJLvyvvmHjXUU92DbtYSatlEIbUbi7oT1qj?=
 =?us-ascii?Q?LJ8K9FZT7QRjg6prJ17xOfB6O5YwjDiRdIEh6Ufgz69GysFU/bKjivO8RfkV?=
 =?us-ascii?Q?bu/Cb0He5erJI54QwWMT7t67H4cODue8vDFb60tNR3wyne39hCyM+Nze6sEw?=
 =?us-ascii?Q?ge3XPlkk22kgoi5J2EU01Evvr6yNKCHRX8Ay1u8KlyECLcF/zCPsaRS43C7V?=
 =?us-ascii?Q?6XFBWLClNscTOQiPDi7Dy2CZgb++X2002/AWt7/7SG8jQkooBlvwv8E0IKFb?=
 =?us-ascii?Q?s9InXNtiTidhHo1uWsEVoj64ybDCwB82KgP8KdsYl66Ay1Kev5xmriXGybk1?=
 =?us-ascii?Q?i4Bh606IFGe70jwbyBk6TfWYAP2o6KHQnWjEOnmZN6VK90x6oPsCc8Mb5tDQ?=
 =?us-ascii?Q?J/q86LwLgxqMtYV0905RZq8CDRboJf2dqo4phcNt8GMm/DBYnIGBKT/6nZZH?=
 =?us-ascii?Q?UAdbIEw66LSNSzM2DXcHw7UmCicZa3cyNHWbBDtQ57lAh66ZktexJATWsG9m?=
 =?us-ascii?Q?MqHkbWVz4wyYpOk9/pcck4w/XO3Ai/MLKHnUyRkdKbePpXcZYEvzTCKMtSNT?=
 =?us-ascii?Q?GRp7CzCbfn1rjJn4aF1NbGbzYQWQP6nRZrsIUrOHJlnPSQNzQWmdUBs13JeG?=
 =?us-ascii?Q?sDuCwHpmCRtAEZu5Ik9q7j30sAYYAdM+VGeyeptLGJczA/U9m6kjTX3ha/id?=
 =?us-ascii?Q?msKugY4rxl55zEpK7/ewNJJjgtVL2dS3jfzwLk8kPmWcI+q07xFgv4MNJKzP?=
 =?us-ascii?Q?kRcQ4Kq1EJ+C6Dd8MhBG6rAEjdLmd1r/Y8JyhZpNsLNCPZr1Mjkm4+DDsi6Z?=
 =?us-ascii?Q?OM9mv7P6HMfC3R7u0ufV3T8PNxW6tNeFIQS8drW4USWUTgY+PvnI1eyBj68M?=
 =?us-ascii?Q?Z500m/gG1ZVGC8s61P6QDB+y/psSmjhQ7AeG83byR3Gg2iCwFyyKCAF4Mpg9?=
 =?us-ascii?Q?bmenhhj4bJZL74ElN4yL0IOyQZ2yGmNxZNDaVfUzV9BeolXlHdtCEBBuR7Ao?=
 =?us-ascii?Q?n4Anr/V8AigKYPFKdANBoXDKGNuRxuEExXaBg0uO8pO866nt0XYPyQ1xFnts?=
 =?us-ascii?Q?cjviW/2nR5sFV34De56Vky4wPznlA+As1A+nU8KOMLqMxIikAywjJE81u9zM?=
 =?us-ascii?Q?rbIZMRYE+kD/snTcpdyOXmYPSop1nBqiZbYUz4ByufUQNikMbsZkseGsaWVw?=
 =?us-ascii?Q?e1w17UxvSevnWHbid+d1A9DibahhKdWHibcQ9dH+Is/S+nvW7Aq6wME2V5Uh?=
 =?us-ascii?Q?DiOhRHql0R3NIoGkv5kCr6mMC0J/QVhMe5nxw+35O07zCv1qvri9LnzDX5ym?=
 =?us-ascii?Q?UJ/SdFjtRXiYMcMrBwHYkDBXuDy8p4zBQXAKjEJmEpo8XaG5a0rC7/m9CU8n?=
 =?us-ascii?Q?Jbu+cOAf8p9EFd8tz6vFEbmrX6jAXHQJWSY6oFNOum82Dq+L3P7TYbu8Gkgp?=
 =?us-ascii?Q?HtSETAlVKPHuSnN7vA1DIdwjoOeAzYV84YA9He9nrCCSKzqhoTmjGNaDCvbB?=
 =?us-ascii?Q?kkCmmdVX5SHdua8Exr1Fr3I3vsG56dSpB7IvkDY+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a0e59b-bcb7-4d84-94ce-08dd88b76e45
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 13:52:36.8343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiTAg2VqTDtknScLgQHGXmSrcvER9MiIMIOidUZ8dVnCqV1r5YfQfbTx7qTlvAF5Ojqzk6KS2ZmQuLTg+WHaxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8327
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

Hello Alex,

On Thu, May 01, 2025 at 09:58:33PM +0900, Alexandre Courbot wrote:
> Add the common Falcon code and HAL for Ampere GPUs, and instantiate the
> GSP and SEC2 Falcons that will be required to boot the GSP.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs           | 546 ++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/falcon/gsp.rs       |  25 ++
>  drivers/gpu/nova-core/falcon/hal.rs       |  55 +++
>  drivers/gpu/nova-core/falcon/hal/ga102.rs | 115 +++++++
>  drivers/gpu/nova-core/falcon/sec2.rs      |   8 +
>  drivers/gpu/nova-core/gpu.rs              |  11 +
>  drivers/gpu/nova-core/nova_core.rs        |   1 +
>  drivers/gpu/nova-core/regs.rs             | 125 +++++++
>  drivers/gpu/nova-core/util.rs             |   1 -
>  9 files changed, 886 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..7cae45645e548bab5b85cb53880898cedbae778a
> --- /dev/null
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -0,0 +1,546 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Falcon microprocessor base support
> +
> +// To be removed when all code is used.
> +#![expect(dead_code)]
> +
> +use core::time::Duration;
> +use hal::FalconHal;
> +use kernel::bindings;
> +use kernel::device;
> +use kernel::devres::Devres;
> +use kernel::prelude::*;
> +use kernel::sync::Arc;
> +
> +use crate::driver::Bar0;
> +use crate::gpu::Chipset;
> +use crate::regs;
> +use crate::util;
> +
> +pub(crate) mod gsp;
> +mod hal;
> +pub(crate) mod sec2;
> +
> +/// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
> +/// register.
> +#[repr(u8)]
> +#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
> +pub(crate) enum FalconCoreRev {
> +    #[default]
> +    Rev1 = 1,
> +    Rev2 = 2,
> +    Rev3 = 3,
> +    Rev4 = 4,
> +    Rev5 = 5,
> +    Rev6 = 6,
> +    Rev7 = 7,
> +}
> +
> +impl TryFrom<u8> for FalconCoreRev {
> +    type Error = Error;
> +
> +    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
> +        use FalconCoreRev::*;
> +
> +        let rev = match value {
> +            1 => Rev1,
> +            2 => Rev2,
> +            3 => Rev3,
> +            4 => Rev4,
> +            5 => Rev5,
> +            6 => Rev6,
> +            7 => Rev7,
> +            _ => return Err(EINVAL),
> +        };
> +
> +        Ok(rev)
> +    }
> +}
> +
> +/// Revision subversion number of a falcon core, used in the
> +/// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
> +#[repr(u8)]
> +#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
> +pub(crate) enum FalconCoreRevSubversion {
> +    #[default]
> +    Subversion0 = 0,
> +    Subversion1 = 1,
> +    Subversion2 = 2,
> +    Subversion3 = 3,
> +}
> +
> +impl TryFrom<u8> for FalconCoreRevSubversion {
> +    type Error = Error;
> +
> +    fn try_from(value: u8) -> Result<Self> {
> +        use FalconCoreRevSubversion::*;
> +
> +        let sub_version = match value & 0b11 {
> +            0 => Subversion0,
> +            1 => Subversion1,
> +            2 => Subversion2,
> +            3 => Subversion3,
> +            _ => return Err(EINVAL),
> +        };
> +
> +        Ok(sub_version)
> +    }
> +}
> +
> +/// Security model of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
> +/// register.
> +#[repr(u8)]
> +#[derive(Debug, Default, Copy, Clone)]
> +pub(crate) enum FalconSecurityModel {
> +    /// Non-Secure: runs unsigned code without privileges.
> +    #[default]
> +    None = 0,
> +    /// Low-secure: runs unsigned code with some privileges. Can only be entered from `Heavy` mode.

This is not true. Low-secure is also (has to be) signed and the signatures
are verified by High-secure code. I can/will go fix that up in my follow-up doc
patches.

> +/// Returns a boxed falcon HAL adequate for the passed `chipset`.
> +///
> +/// We use this function and a heap-allocated trait object instead of statically defined trait
> +/// objects because of the two-dimensional (Chipset, Engine) lookup required to return the
> +/// requested HAL.
> +///
> +/// TODO: replace the return type with `KBox` once it gains the ability to host trait objects.
> +pub(crate) fn create_falcon_hal<E: FalconEngine + 'static>(
> +    chipset: Chipset,
> +) -> Result<Arc<dyn FalconHal<E>>> {
> +    let hal = match chipset {
> +        Chipset::GA102 | Chipset::GA103 | Chipset::GA104 | Chipset::GA106 | Chipset::GA107 => {
> +            Arc::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as Arc<dyn FalconHal<E>>

I am guessing macro-fication of this did not pan out? i.e. I think we
discussed:
1. Seeing if we can reduce/get rid of Arc in favor of static allocation.
2. Simplify the chain of GAxx | GAyy..
But nothing that cannot be done as a follow-up improvement..

(Also it is a bit weird that the namespace for chipsets for > GA10x is
ga102::GA102::). Example, Chipset::GA104 uses the HAL in Ga102).

thanks,

 - Joel

