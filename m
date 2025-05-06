Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE59AACAEA
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 18:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2607210E703;
	Tue,  6 May 2025 16:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ufsp1Ihm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567D710E267;
 Tue,  6 May 2025 16:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Me12iBm73YtDkx69ojl+swZtuvnXiymfXFnEQJZwQH4AFP/P47o16CPst23ggOYSI6ev2UNcu2/gK52v6VdaR8is+6w4z7oOngtceXbs7M9GmppAYXk3RZoR3UE6HKaAfmZjk4mi3leLQpxPzOszOvJHcwa6qIl95Mm5SX1Td8+r9O6vu7p5yxSZtYD2mmXVKFJfQyDNxiBxQZZOEjqac3sHUiZx8ZZw3fnOl7xphyNuBJJaAKGdY/G31u+dVatktE7GpKkL6JEv8PgPma4tNednne/ox1yCYccITTL4RUjY/1rzbd44pdiFnfT9uB86ajU3OIYlUW488yC4D3j0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1b8J5gx/sNG19XS1PrMEkLl+F7C/y7jZZ1W/WCfAaQ=;
 b=xOf/j5MfC/m2FBilK377goxotCl6UNs+BZ24G1U2cBFSumVRYsCU+LAphbXY0IN/+SR1by4cSJVxdlS4QxhuI0qE/cRqirYaYaiUUucPQ7vbB0dQdqLkQPt8MK7yPQHUMQ0nwHSW3l0naW7EMnAQzen88EP2+H4Iz/28dMw27YJw10yBxVVIBa9PswYE4BclIcw4YSteWPoLNFDB628AEVl3Tl+jCWtvWAxiuNhDRcGoIxNrHHF+i62O2A3LAWgVS1hMSmcKbTjVghUF8MU8obCwDSMgXv6D9Le2dE0urE8W4g/LFgjsQz3b2HtpwHW0uUDNp1G6EVvGZzZoQOK+1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1b8J5gx/sNG19XS1PrMEkLl+F7C/y7jZZ1W/WCfAaQ=;
 b=ufsp1IhmA+8/dFA4ThQJpBdOd0A17u+3CSX1BtopQPt7abkJaJZD5QXeI90p57qHza59JSOa7mRGkfXIFvvztToKNPpWWy3GlsCZpfv8JAy+W+wis9rLDnc6sjAR4rf/ERHKXUPad3IU1WyPaaHDswrw+/4loIHiXQAfC4viCiugNput5Di0R0irCsuSBUpiIDPNSl2qLiLNkJbe4cvQEt2W1Zto9BSVgUeJH+11Zh92DukcPCafGlp0LI6XhBGLY42Qz6/FaTXy29Xj9n2OlUgvDM2DJHqoqu3dmS0nMmn/od9CTIJUA+XX1VrIeMg2HmcsKUtFQSrHGCQp6WyqiQ==
Received: from BLAPR03CA0152.namprd03.prod.outlook.com (2603:10b6:208:32f::16)
 by SN7PR12MB6929.namprd12.prod.outlook.com (2603:10b6:806:263::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Tue, 6 May
 2025 16:27:04 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:208:32f:cafe::b4) by BLAPR03CA0152.outlook.office365.com
 (2603:10b6:208:32f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Tue,
 6 May 2025 16:27:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 16:27:03 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 09:26:54 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 6 May
 2025 09:26:46 -0700
Received: from inno-thin-client (10.127.8.12) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 6 May 2025 09:26:42 -0700
Date: Tue, 6 May 2025 19:26:41 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Jonathan
 Corbet" <corbet@lwn.net>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, "Ben
 Skeggs" <bskeggs@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] nova-core: docs: Document fwsec operation and
 layout
Message-ID: <20250506192641.7872cbd0@inno-thin-client>
In-Reply-To: <20250503040802.1411285-5-joelagnelf@nvidia.com>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <20250503040802.1411285-5-joelagnelf@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|SN7PR12MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 31866a20-ef2a-48c4-b4f0-08dd8cbad5fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z21LcnQrSXNxQm1EbTZyWnNCeHBxUDF3UER1N01hMDN5QW5TaG42bjdmRXhq?=
 =?utf-8?B?NFlkS29VdnJyRlBHWlRqc0Mzd29qd2E2eUtSbHpITWF1c3cweTcwTnA2VlRv?=
 =?utf-8?B?Qkpob1FEd2UxaUJUQnFBSFBXMnlwMHRkOHo2VU5EUUVPU2R0R3EvV1M4bFYz?=
 =?utf-8?B?TDB6aGFlek9MYTNwMlVmQkY3dXpieURoVjg1Z29Qb0c3aldwMXZ3bkNQRzR6?=
 =?utf-8?B?a2w2ZU5NLy9lUVcxbXVZa3p6eWVreUN3RThMUVhwNmtjY2FkRVNUZjc1NHZB?=
 =?utf-8?B?WFVQSVVQRENnTjc1ZGphU0xJK0d0OTZYOG5xYXdEN09IMmxYR1IzWjhvY1FK?=
 =?utf-8?B?a25PQjc2Sks1akVJSUo1bUR6czh5WkdEWHNwVE5RSFdWZGp6bTdSZWFjT0Vw?=
 =?utf-8?B?MlFxa0dMK1ordHpkYlk5MHlkbzdiYTNFT0lvUjdRVnBrMkZjTEV5MEhvZ0dM?=
 =?utf-8?B?S0dlQkZ1ZmY0Nzl0VVUzUG9iNUE1N3dGR2NzVUU0SnVObkd0Q0ZBaUs0N29L?=
 =?utf-8?B?cGpjalNmeUl5a2FEOGVvdE1Qc3BPMTJyaWxKQ0dHdnhxM2QveHhXV0s0dXFL?=
 =?utf-8?B?TlpWNG1ncmp3VzgzOGJiT3J2dUpPTU1vMFBRcnJMNHF2QkhSSEZjQjkxbEFt?=
 =?utf-8?B?V0lySm5WdDc0NU01ajVNZkNYbFZLWGgxZEFubHNmMVd6WEUwZmE0NnhEWmtV?=
 =?utf-8?B?VTBiSk9oQ1RGS0tnWXpYOFBPdkwwZUhxZFlDMFZiaHgxbWJVSWswbjlDbWE0?=
 =?utf-8?B?aE1yVkQ3alNJYVdtYllmOFBRdlBZa2Fwd1lkaEM5TnoydFdtYUFnbWxjaFVl?=
 =?utf-8?B?MUxnNFlxdmJqTHlXdCtUbXF1bFY0cU10NU5NeERFMTU4YU1XM1FXcHVrc2Jm?=
 =?utf-8?B?NHllUDZ6Ri9VTHZvSU9iZFJndmdlOWZtSzlPSzV4b1BOeEN1NmlOU05ZRGZD?=
 =?utf-8?B?N2c5U3lDRFRFemdDTUJ3a0hLT3RsRlNGMThqcXFTUDhGRVh2TnlSRTlKU0t6?=
 =?utf-8?B?ZnNELzJ5bEY4eE50MXEra2EvbUtPR2daTDc1LzF6VldOajZ6cS9VOVVKeDA1?=
 =?utf-8?B?eXMrNDFBNC82M1BMeHVFbXdkS3M1L3JQcFdPR3duWHZyc1BXUmQ3WWVlZkFl?=
 =?utf-8?B?WmdibHVHb3dzampWY2pmTjhEam5yVTIzMjJqUFFJQWllVUVCbUhNZU1KUFFt?=
 =?utf-8?B?V3Q4eW5MaFczMFhob2VYU0dnMWI5OS9tNlRsYSt3bFNBZW05dXNWWit0MkNW?=
 =?utf-8?B?cXZFNGFTNzJFdnFpeElZVDlhSCtaRURNb2JQSkN6SWlUVGVCUGV0bGtwMEFM?=
 =?utf-8?B?NFZ3UzY5Mm5OOGlYaU1tWmxsQWlCNW9RMU1UbTIxQ1kzWmdEYm1ZT054YVNZ?=
 =?utf-8?B?UGhteExLUlRVZS8vN0FrbGdYOU5pS2R2eGUwTjBFeXMwdUdHWk9PRTF4S1RI?=
 =?utf-8?B?YmZLSkVwdGQrbWkzbjJJMThYZFNvRSswaUM1RlhieWduTVB1WDNnTXpIczZC?=
 =?utf-8?B?NTlsZk9BcjIzZEVaUFBwTW02dzVoTHgyT0FlM2NGTlN5RkMzNUplczhsUk10?=
 =?utf-8?B?MTh1U3UyYzh5ak5DWTdrczIyYXJCYVpMaVd3Z1JmejBCOUEvc2ZIZjVJbXVX?=
 =?utf-8?B?bHZpcTEzZ3hNbUNlUWxRbE4rMERyQy9HamlQb2piOVZrT0EyWStTRXZ5TlF3?=
 =?utf-8?B?Z0F6K3R0aVhObVZWeTk3bHJBQ2ZjVUVsOWN1clhBWEZBVENkd2IvVTU1cVph?=
 =?utf-8?B?SW9OWi9QcXlic3BKV21ueTVaeXhWZ3M0SFEydFdtaTcyM2FFc2JJQkdFcWJQ?=
 =?utf-8?B?aWhhOUNwajNHYkNxbVVTM0Q5WmQ1RFhwcGw1UVV0NzJ6d0tJOC9mc2pybWpz?=
 =?utf-8?B?TDcxV1czWjZoUE1GZDR0UEJRR0xaTlU3RG5WS29YMDV6Y0Faand5T1J4R0JC?=
 =?utf-8?B?SVhOcWhUT2JxQXFTOFdtYXZKNWt6TjRXSDB0dXRPTHJ4UHhaNzltM1R5dmdJ?=
 =?utf-8?B?Q3ozOUlDS3B6S1NESU9hb0RaeFZXeEZmeGpQY0VkM3k2dkRodU1YMU54d2pr?=
 =?utf-8?Q?bNceT0?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 16:27:03.6413 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31866a20-ef2a-48c4-b4f0-08dd8cbad5fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6929
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

On Sat,  3 May 2025 00:07:56 -0400
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> Add explanation of fwsec with diagrams. This helps clarify how the
> nova-core falcon boot works.
>=20
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  Documentation/gpu/nova/core/fwsec.rst | 180
> ++++++++++++++++++++++++++ Documentation/gpu/nova/index.rst      |
> 1 + 2 files changed, 181 insertions(+)
>  create mode 100644 Documentation/gpu/nova/core/fwsec.rst
>=20
> diff --git a/Documentation/gpu/nova/core/fwsec.rst
> b/Documentation/gpu/nova/core/fwsec.rst new file mode 100644
> index 000000000000..bed941ac3f2b
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/fwsec.rst
> @@ -0,0 +1,180 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +FWSEC (Firmware Security)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +This document briefly/conceptually describes the FWSEC (Firmware
> Security) image +and its role in the GPU boot sequence. As such, this
> information is subject to +change in the future and is only current
> as of the Ampere GPU family. However, +hopefully the concepts
> described will be useful for understanding the kernel code +that
> deals with it. All the information is derived from publicly available
> +sources such as public drivers and documentation. +
> +The role of FWSEC to provide secure boot, it is running in
> Heavy-secure mode. It does +firmware verification after GPU reset and
> load various ucode images on to the other +microcontrollers on the
> GPU such as the PMU and GSP. +
> +FWSEC itself is an application stored in the VBIOS ROM in the FWSEC
> partition of +ROM (see vbios.rst for more details). It contains
> different commands like FRTS +(Firmware Runtime Services) and SB
> (Secure Booting other microcontrollers after +reset and loading them
> with other non-FWSEC ucode). The kernel driver only needs to +to do
> FRTS, since SB is already already after reset by the time the kernel
> driver +is loaded. +
> +The FRTS command carves out the WPR2 region (Write protected region)
> which contains +data data required for power management. Once setup,
repetitive word "data" ^

> only HS mode ucode can +access it (see falcon.rst for privilege
> levels). +
> +The FWSEC image is located in the VBIOS ROM in the partition of the
> ROM that contains +various ucode images (also known as applications)
> -- one of them being FWSEC. For how +it is extracted, see vbios.rst
> and the vbios.rs source code. +
> +The Falcon data for each ucode images (including the FWSEC image) is
> a combination +of headers, data sections (DMEM) and instruction code
> sections (IMEM). All these +ucode images are stored in the same ROM
> partition and the PMU table is used to look +up the application to
> load it based on its application ID (see vbios.rs). +
> +For the purposes of nova-core driver, the FWSEC contains an
> 'application interface' +called DMEMMAPPER which is used to the
> "FWSEC-FRTS" command (among other commands it +is capable of
> executing). For Ampere, FWSEC is running on the GSP in Heavy-secure
> +mode and runs FRTS. +
> +FWSEC Memory Layout
> +-------------------
> +The memory layout of the FWSEC image is as follows (this is using an
> GA-102 +Ampere GPU as an example and could vary for future GPUs and
> is subject to change +completely, it is just provided as an example):
> +
> +Here is a block diagram of the FWSEC memory layout::
> + =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> + =E2=94=82                         FWSEC ROM image (type 0xE0)          =
 =E2=94=82
> + =E2=94=82                                                              =
 =E2=94=82
> + =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=90                          =E2=94=82
> + =E2=94=82  =E2=94=82     PMU Falcon Ucode Table      =E2=94=82         =
                 =E2=94=82
> + =E2=94=82  =E2=94=82     (PmuLookupTable)            =E2=94=82         =
                 =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82                 =
         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 Table Header            =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - version: 0x01         =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - header_size: 6        =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - entry_size: 6         =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - entry_count: N        =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - desc_version:3(unused)=E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82                 =
         =E2=94=82
> + =E2=94=82  =E2=94=82         ...                     =E2=94=82         =
                 =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82                 =
         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 Entry for FWSEC (0x85)  =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 (PmuLookupTableEntry)   =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - app_id: 0x85 (FWSEC)  =E2=94=82 =E2=
=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=90                     =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - target_id: 0x01 (PMU) =E2=94=82    =
=E2=94=82    =E2=94=82                     =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - data: offset =E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=90 look up FWSEC   =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82    =E2=94=82   =
=E2=94=82 application.    =E2=94=82
> + =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82   =E2=94=82                 =E2=
=94=82
> + =E2=94=82                                         =E2=94=82   =E2=94=82=
                 =E2=94=82
> + =E2=94=82                                         =E2=94=82   =E2=94=82=
                 =E2=94=82
> + =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82   =E2=94=82                 =E2=
=94=82
> + =E2=94=82  =E2=94=82     FWSEC Ucode Component       =E2=94=82<=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98   =E2=94=82                 =E2=94=82
> + =E2=94=82  =E2=94=82     (aka Falcon data)           =E2=94=82        =
=E2=94=82                 =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82        =E2=94=82=
                 =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 FalconUCodeDescV3       =E2=94=82<=E2=
=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98                 =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - hdr                   =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - stored_size           =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - pkc_data_offset       =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - interface_offset =E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - imem_phys_base        =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - imem_load_size        =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - imem_virt_base        =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - dmem_phys_base        =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - dmem_load_size        =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - engine_id_mask        =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - ucode_id              =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - signature_count       =E2=94=82    =
=E2=94=82    look up sig =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - signature_versions --------------+   =
       =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82     =E2=94=82   =
       =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82         (no gap)                =E2=94=82     =E2=
=94=82          =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82     =E2=94=82   =
       =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 Signatures Section      =E2=94=82<=E2=
=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=98          =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 (384 bytes per sig)     =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - RSA-3K Signature 1    =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - RSA-3K Signature 2    =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82   ...                   =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82                =
=E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82                                 =E2=94=82         =
       =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82                =
=E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 IMEM Section (Code)     =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82                         =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 Contains instruction    =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 code etc.               =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82                =
=E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82                                 =E2=94=82         =
       =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82                =
=E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 DMEM Section (Data)     =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82                         =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90 =E2=94=82    =E2=94=82                =E2=94=82         =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Application         =E2=94=82=
 =E2=94=82<=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Interface Table     =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 (FalconAppifHdrV1)  =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Header:             =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - version: 0x01     =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - header_size: 4    =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - entry_size: 8     =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - entry_count: N    =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82                     =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Entries:            =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90 =E2=
=94=82 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82 DEVINIT (ID 1)  =E2=
=94=82 =E2=94=82 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82 - id: 0x01      =E2=
=94=82 =E2=94=82 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82 - dmemOffset X =E2=
=94=80=E2=94=BC=E2=94=80=E2=94=BC=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=90                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98 =E2=
=94=82 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90 =E2=
=94=82 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82 DMEMMAPPER(ID 4)=E2=
=94=82 =E2=94=82 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82 - id: 0x04      =E2=
=94=82 =E2=94=82 =E2=94=82    =E2=94=82 Used only for DevInit    =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82  (NVFW_FALCON_  =E2=
=94=82 =E2=94=82 =E2=94=82    =E2=94=82 application (not FWSEC)  =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82   APPIF_ID_DMEMMAPP=
ER)   =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82 - dmemOffset Y =E2=
=94=80=E2=94=BC=E2=94=80=E2=94=BC=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90=
                    =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98 =E2=
=94=82 =E2=94=82    =E2=94=82     =E2=94=82                    =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98 =E2=94=82    =E2=94=82     =E2=94=82                    =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82                         =E2=94=82    =
=E2=94=82     =E2=94=82                    =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90 =E2=94=82    =E2=94=82     =E2=94=82                    =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 DEVINIT Engine      =E2=94=82=
<=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=82 Used =
by FWSEC      =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Interface           =E2=94=82=
 =E2=94=82    =E2=94=82     =E2=94=82         app.       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98 =E2=94=82    =E2=94=82     =E2=94=82                    =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82                         =E2=94=82    =
=E2=94=82     =E2=94=82                    =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90 =E2=94=82    =E2=94=82     =E2=94=82                    =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 DMEM Mapper (ID 4)  =E2=94=82=
<=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80+=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=98                    =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 (FalconAppifDmemmapperV3)  =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - signature: "DMAP" =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - version: 0x0003   =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - Size: 64 bytes    =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - cmd_in_buffer_off =E2=94=82=
 =E2=94=82=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=90             =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - cmd_in_buffer_size=E2=94=82=
 =E2=94=82    =E2=94=82            =E2=94=82             =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - cmd_out_buffer_off=E2=94=82=
 =E2=94=82=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=90       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - cmd_out_buffer_sz =E2=94=82=
 =E2=94=82    =E2=94=82            =E2=94=82     =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - init_cmd          =E2=94=82=
 =E2=94=82    =E2=94=82            =E2=94=82     =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - features          =E2=94=82=
 =E2=94=82    =E2=94=82            =E2=94=82     =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - cmd_mask0/1       =E2=94=82=
 =E2=94=82    =E2=94=82            =E2=94=82     =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98 =E2=94=82    =E2=94=82            =E2=94=82     =E2=94=
=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82                         =E2=94=82    =
=E2=94=82            =E2=94=82     =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90 =E2=94=82    =E2=94=82            =E2=94=82     =E2=94=
=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Command Input Buffer=E2=94=82=
<=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=98     =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - Command data      =E2=94=82=
 =E2=94=82    =E2=94=82                  =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - Arguments         =E2=94=82=
 =E2=94=82    =E2=94=82                  =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98 =E2=94=82    =E2=94=82                  =E2=94=82       =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82                         =E2=94=82    =
=E2=94=82                  =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90 =E2=94=82    =E2=94=82                  =E2=94=82       =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Command Output      =E2=94=82=
<=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=98       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Buffer              =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - Results           =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - Status            =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82                 =
         =E2=94=82
> + =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98                          =E2=94=82
> + =E2=94=82                                                              =
 =E2=94=82
> + =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
> +
> +.. note::
> +   The FWSEC image also plays a role in memory scrubbing (ECC
> initialization) and VPR
> +   (Video Protected Region) initialization as well. Before the
> nova-core driver is even
> +   loaded, the FWSEC image is running on the GSP in heavy-secure
> mode. After the devinit
> +   sequence completes, it does VRAM memory scrubbing (ECC
> initialization). On consumer
> +   GPUs, it scrubs only part of memory and then initiates 'async
> scrubbing'. Before this
> +   async scrubbing completes, the unscrubbed VRAM cannot be used for
> allocation (thus DRM
> +   memory allocators need to wait for this scrubbing to complete).
> \ No newline at end of file
> diff --git a/Documentation/gpu/nova/index.rst
> b/Documentation/gpu/nova/index.rst index 91cc802ed94f..22e5712ac6b0
> 100644 --- a/Documentation/gpu/nova/index.rst
> +++ b/Documentation/gpu/nova/index.rst
> @@ -28,4 +28,5 @@ vGPU manager VFIO driver and the nova-drm driver.
> =20
>     core/guidelines
>     core/vbios
> +   core/fwsec
>     core/todo

