Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF28A28D30
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 14:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D1810E7B6;
	Wed,  5 Feb 2025 13:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ti4XGWFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A60110E1EA;
 Wed,  5 Feb 2025 13:57:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuOblGkJOeapPZ0wuOgUsZHr+JR+jtKHKCtW7RJrAv0kIxQC827lxcdeiZrf0v7gTdOTeK0wcGggJowBYxvkRVEDalfT6fgPbrMh03skxEJAPK29H6fc4ABQBkjvTNSXeo+SNDaXq19ObhQ6NlBA/NtO5cSHcDsgi5GTbRtg+Nlj+/2IjUO9qzu5j2tcsx68SNt3LkNRoFZZK6Q3LeewANrt+/CW86mGReEpwjUOgRnL4cgv1LSRVd1Uy1ddsznvdIboThahM3SmKFXAofRUChgpS1JleRyBF1Leowz9sEnrDB4zi1eFkqFZgfFT9q7NIrWnh0K06O47eKl9aa/yVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KG9Cz6cv5UJTe7nkxSACgZVZjH1AcRl43ztjDGbg32Y=;
 b=BXYP67GDe9D6AKN2EMb7akiEsA95iS56pyoRGPfdM5tTh1jYgUSpJREBQr58jpcrp1TnB8Yhi/jAFVJs0c/bG1jUKhVObWy0Hpji+ZlOQJvj4jRCM/42pddTDjf2BWtfQ48S7tpa1nHa0nsjpae52sYmrRjIBUMYZYG5CuKqwDFObRS+F/TaXHJFOFxi4sL2h/ijsqyBTlGgRjEk50q8FdbQOctdoC4SUI9Pa3nDxtrCzKvJLsEQtw3yJImg/MBwbLWlugWoednix1Yt/BJfLsNsXJWcd+tWhA/MUwbFLYScEZybINcj5QHHcqXu32dFqXgYfUdf28duny1MpzaCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KG9Cz6cv5UJTe7nkxSACgZVZjH1AcRl43ztjDGbg32Y=;
 b=ti4XGWFwe4i6KadOEkQ7+1bx/QcH0GBhyLZoJoEI14UovOERBZ1s+2pOn/hSSud0NR5TnPuTJ4m5i+cYSzfpnaOhaQ64ym3BdFt9DHBi7u264IuogOEA9BrUHsDt6PT1YzW4x7m1+4KfjKvKOgFuFfD2dIjvdposZi3nS8821nYesDu976CisPdPf0upB+eyNAflm0T438CRrDQnyjDDn98QqaUguFp8Rmq8XmeapNG6i8V7mdN0oukcCqoxF6SU/3Jv1FLkk3pxdBZ7kMAZDANqucQ8hPRCvQG7v36jhz9GrAhpmacAjL5oovIhA5GBApnClnIl7IGgu3Y99fDB6w==
Received: from BN0PR04CA0080.namprd04.prod.outlook.com (2603:10b6:408:ea::25)
 by CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 13:57:12 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:408:ea:cafe::68) by BN0PR04CA0080.outlook.office365.com
 (2603:10b6:408:ea::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Wed,
 5 Feb 2025 13:57:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 5 Feb 2025 13:57:11 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 5 Feb 2025
 05:56:53 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 05:56:53 -0800
Received: from localhost (10.127.8.14) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025
 05:56:46 -0800
Date: Wed, 5 Feb 2025 15:56:46 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <corbet@lwn.net>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <ajanulgu@redhat.com>, <lyude@redhat.com>,
 <pstanner@redhat.com>, <cjia@nvidia.com>, <jhubbard@nvidia.com>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add initial documentation
Message-ID: <20250205155646.00003c2f@nvidia.com>
In-Reply-To: <20250204190400.2550-2-dakr@kernel.org>
References: <20250204190400.2550-1-dakr@kernel.org>
 <20250204190400.2550-2-dakr@kernel.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|CH3PR12MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: e9566676-b792-4bbb-7dc5-08dd45ecfd52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFkvQWtOMCtHNERzaGFlV2pUYmdKaVd1dUptMWVHN3BWWlZSM3NaZGZEVXZy?=
 =?utf-8?B?dXEvektJaC84RmNYdm9aaHl3VU1zSUkvUkRHOHRield5bnQ2MjVEVzBNR1lt?=
 =?utf-8?B?eUQ3TkJmWktKSmZQV0pGcUZkdkl5OElHT0cvMlJKUm5qY0NlUEIxUHAvSmg0?=
 =?utf-8?B?Q0FPaDhuRFN1NWxreDFraWU0ZVY4WG1LK3lzaXVJNE9BVkl4T1JOdHdjM0JE?=
 =?utf-8?B?SzhhdEVkaTc0cm9iRjI3VG9vLzMvQWtQZHUrOHErcGh0TnN2dzZzTzZDazJ2?=
 =?utf-8?B?VkVlak5Fbm81NXFKUWN4UTU5aFo1bEgrVlRBdkJnbm5JZ05WZzV3YUY4NDNU?=
 =?utf-8?B?TGZpbUd5VnhYcGxZUlc2d01Jeld6Sk1peHlKVmVCcEl5UVV0SUI1M0RjMFRx?=
 =?utf-8?B?U0NtMDNKMXJKYktwZVFQV0J2ZHRINVZYTnNPc0JPdE1zWmZiRm11K1FWQXF4?=
 =?utf-8?B?a3BzZjdIY0QvZTNoaHMzaDE5b3U0YkhjajNFYkhLVm1NVXdER0F2NVJFSlg0?=
 =?utf-8?B?VU1OZEFGMWQ2NndsL0EzVzlhZDdOdU1pYmNQRElXZlhoS1I0OUlyeWxpSFpQ?=
 =?utf-8?B?cDdNMkttbXk5OTBkc1FvVEhEcjJHVHBkaDNHQUZ4R3hVd2x4S2FqdUlDR002?=
 =?utf-8?B?eXJseEtSRDJZOHBxdVhEblVjTlFUTjJtV1IwRDJBVktSMTJWOG0vT1A2MHFE?=
 =?utf-8?B?akY3TDIzeCtkLyt2WS9XVnVFUnFxaDRLR3ZiUGp6T1J0UDQxNHd3RzBTZE1P?=
 =?utf-8?B?Vm1zQW5yWC8xRFRyYWtJcnBkSm8raTZ0WENqOURVc1FNVzNJcG1wMHM5T3k5?=
 =?utf-8?B?bmdwTDVGVG5zN3lyUXo2MFkyUGtOejhoRTZSd1VEYktoUXVHV3BodEFJSmpD?=
 =?utf-8?B?bzBuTXIvU1lBRGlpc1dkVHp2bm9uUzVXd0FEcTk5VXBMYnJETXYrUm1DY2VV?=
 =?utf-8?B?WTQ0WXJSbHpnUUhYa0VId1RrY1RZNmJpUFhndDdCMHlZQVppVi9mWHVlN1JQ?=
 =?utf-8?B?Q0tKVzJXYkxHNUhxK1h5aDhEbWVkaTE5OEIwQjRXTVRSenoySk9MTHB6cUpR?=
 =?utf-8?B?VXc0blhEczV6bGVCb0NUTEdhUittQmlBZlBTV2xzZ0JKMW9SeEx6bDVrWHdC?=
 =?utf-8?B?NExhOVgrekZ0Rm5FcnhDK1hvaHYwYkpTQ3ZGK3hCajJOZkk3NE1XMzN5a3A5?=
 =?utf-8?B?S01TSUc5VEFBWjJEQ2g3Q3haU2xTN0JPb0wvcVE0YXJ6aGp4ejlISDdOaVEx?=
 =?utf-8?B?cDFybXZhdjNTU0tiN0FhVTlpbFUwNmpOTW0wSlpwbEhva3BGcHVKT1pUbWR6?=
 =?utf-8?B?Y2hFMlJ5TmdkVWplYWYyaXJFS0F0MHBsb1lRc0RpQXNBY25ZSHBCT2hrYm0w?=
 =?utf-8?B?L3grS2dLNG5VRkswbmJBVDNZQVFyKzBlMTVOQmxTajd0bWZJNWdYYTNDVkd6?=
 =?utf-8?B?czZUN016Ukg2d0xJQ0plRmRBOUpPVm1HTjVNSjVraG04Wk01amVsY3hJeFJv?=
 =?utf-8?B?ci9zb05VVWcxbnVtcElrSmowdXRhaWMxVFovdUVLMVpVYTdpQlRrN2dzdVJz?=
 =?utf-8?B?TUNPcGw0OERXa0Z6WHZyZk5yVkc3TWJwQzlaZlc0dzZpT3FCaWdGZkVpY2s5?=
 =?utf-8?B?OWNIZktaT0hCSU5BZGhCUEVvaGh5bk9CcCtwUU9jNkhDdW9MVm1qM2xoanYx?=
 =?utf-8?B?c3Z5ZzF2MVA3dWhTd2FtZ25HbjZvWE9xaGY0LzZwU240YWpQRlQ0aXpjU3cw?=
 =?utf-8?B?anRiNUV4aXpjMWViSzJwTmpWOW5MVG5vcHR5K3Y1RVBXeUxzQUJGeXFsMWJj?=
 =?utf-8?B?dE1FcTRXaW1ieXhlYjZkNE1WUCtqTER0Z2R5Zi9SNFZjdFpaalU3bjhtRVlC?=
 =?utf-8?B?RjZlNGdhbHFYZ3AzdUdLY0ZwM3FHZTNSb3pJaERLQ0s5UTRKS0E2WXlDVHl4?=
 =?utf-8?B?SUg5eXJKT3YzdGovVjVVNzdDMC91d3NRUTNIVldWUFRqY1FtUmIvSUtqY2Zu?=
 =?utf-8?Q?RBr804fJ7GXJDzwAM+RISV5pDylzxI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 13:57:11.9087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9566676-b792-4bbb-7dc5-08dd45ecfd52
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8660
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

On Tue,  4 Feb 2025 20:03:12 +0100
Danilo Krummrich <dakr@kernel.org> wrote:

> Add the initial documentation of the Nova project.
>=20
> The initial project documentation consists out of a brief introduction
> of the project, as well as project guidelines both general and nova-core
> specific and a task list for nova-core specifically.
>=20
> The task list is divided into tasks for general Rust infrastructure
> required by the project, tasks regarding GSP enablement and firmware
> abstraction, general GPU driver tasks as well as tasks related to
> external API design and test infrastructure.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>   - Add task "Generic register abstraction".
>   - Change complexity of "Debugfs abstractions".
> ---
>  Documentation/gpu/drivers.rst              |   1 +
>  Documentation/gpu/nova/core/guidelines.rst |  24 ++
>  Documentation/gpu/nova/core/todo.rst       | 445 +++++++++++++++++++++
>  Documentation/gpu/nova/guidelines.rst      |  73 ++++
>  Documentation/gpu/nova/index.rst           |  30 ++
>  MAINTAINERS                                |   1 +
>  6 files changed, 574 insertions(+)
>  create mode 100644 Documentation/gpu/nova/core/guidelines.rst
>  create mode 100644 Documentation/gpu/nova/core/todo.rst
>  create mode 100644 Documentation/gpu/nova/guidelines.rst
>  create mode 100644 Documentation/gpu/nova/index.rst
>=20
> diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
> index 1f17ad0790d7..7c2c5dcb5fd4 100644
> --- a/Documentation/gpu/drivers.rst
> +++ b/Documentation/gpu/drivers.rst
> @@ -24,6 +24,7 @@ GPU Driver Documentation
>     panfrost
>     panthor
>     zynqmp
> +   nova/index
> =20
>  .. only::  subproject and html
> =20
> diff --git a/Documentation/gpu/nova/core/guidelines.rst b/Documentation/g=
pu/nova/core/guidelines.rst
> new file mode 100644
> index 000000000000..a389d65d7982
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/guidelines.rst
> @@ -0,0 +1,24 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Guidelines
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This documents contains the guidelines for nova-core. Additionally, all =
common
> +guidelines of the Nova project do apply.
> +
> +Driver API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +One main purpose of nova-core is to implement the abstraction around the
> +firmware interface of GSP and provide a firmware (version) independent A=
PI for
> +2nd level drivers, such as nova-drm or the vGPU manager VFIO driver.
> +
> +Therefore, it is not permitted to leak firmware (version) specifics, thr=
ough the
> +driver API, to 2nd level drivers.
> +
> +Acceptance Criteria
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +- To the extend possible, patches submitted to nova-core must be tested =
for
> +  regressions with all 2nd level drivers.
> diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nov=
a/core/todo.rst
> new file mode 100644
> index 000000000000..5e66ec35c5e3
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/todo.rst
> @@ -0,0 +1,445 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Task List
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +

...

> +
> +Generic register abstraction
> +----------------------------
> +
> +Work out how register constants and structures can be automatically gene=
rated
> +through generalized macros.
> +
> +Example:
> +
> +.. code-block:: rust
> +
> +	register!(BOOT0, 0x0, u32, pci::Bar<SIZE>, Fields [
> +	   MINOR_REVISION(3:0, RO),
> +	   MAJOR_REVISION(7:4, RO),
> +	   REVISION(7:0, RO), // Virtual register combining major and minor rev.
> +	])
> +

I think it is better not to tie this to pci::Bar and its operations. It
would be better to have a intermediate container as the macro param. The
container holds the register region vaddr pointer, size, read/write traits.
The macro expands it from there, thus, we can also use this on firmware
memory structures, e.g. GSP WPR2 info.

Probably we are looking for a even more generic solution/type for deferring
a structure in the vaddr and generating the the accessing methods
accordingly. It might also be useful later in GSP message queue
manipulation, ELF header extraction, page table manipulation? (to avoid
ambitious unsafe statements in the rust driver)

> +This could expand to something like:
> +
> +.. code-block:: rust
> +
> +	const BOOT0_OFFSET: usize =3D 0x00000000;
> +	const BOOT0_MINOR_REVISION_SHIFT: u8 =3D 0;
> +	const BOOT0_MINOR_REVISION_MASK: u32 =3D 0x0000000f;
> +	const BOOT0_MAJOR_REVISION_SHIFT: u8 =3D 4;
> +	const BOOT0_MAJOR_REVISION_MASK: u32 =3D 0x000000f0;
> +	const BOOT0_REVISION_SHIFT: u8 =3D BOOT0_MINOR_REVISION_SHIFT;
> +	const BOOT0_REVISION_MASK: u32 =3D BOOT0_MINOR_REVISION_MASK | BOOT0_MA=
JOR_REVISION_MASK;
> +
> +	struct Boot0(u32);
> +
> +	impl Boot0 {
> +	   #[inline]
> +	   fn read(bar: &RevocableGuard<'_, pci::Bar<SIZE>>) -> Self {
> +	      Self(bar.readl(BOOT0_OFFSET))
> +	   }
> +
> +	   #[inline]
> +	   fn minor_revision(&self) -> u32 {
> +	      (self.0 & BOOT0_MINOR_REVISION_MASK) >> BOOT0_MINOR_REVISION_SHIFT
> +	   }
> +
> +	   #[inline]
> +	   fn major_revision(&self) -> u32 {
> +	      (self.0 & BOOT0_MAJOR_REVISION_MASK) >> BOOT0_MAJOR_REVISION_SHIFT
> +	   }
> +
> +	   #[inline]
> +	   fn revision(&self) -> u32 {
> +	      (self.0 & BOOT0_REVISION_MASK) >> BOOT0_REVISION_SHIFT
> +	   }
> +	}
> +
> +Usage:
> +
> +.. code-block:: rust
> +
> +	let bar =3D bar.try_access().ok_or(ENXIO)?;
> +
> +	let boot0 =3D Boot0::read(&bar);
> +	pr_info!("Revision: {}\n", boot0.revision());
> +
> +| Complexity: Advanced
> +
> +Delay / Sleep abstractions
> +--------------------------

...

> +
> +VRAM memory allocator
> +---------------------
> +
> +Investigate options for a VRAM memory allocator.
> +
> +Some possible options:
> +  - Rust abstractions for
> +    - RB tree (interval tree) / drm_mm
> +    - maple_tree
> +  - native Rust collections
> +
> +| Complexity: Advanced
> +

I am leaning towards having the abstractions at a high level APIs, e.g.
wrapping drm_mm and possibly the rust side can choose the backend type of
drm_mm if it really needs a different type of data structure other
than default supported by drm_mm. If we need more type of data structures,
we can extend drm_mm in C side. That can save us some efforts.

> +Instance Memory
> +---------------
> +
> +Implement support for instmem (bar2) used to store page tables.
> +
> +| Complexity: Intermediate
> +| Contact: Dave Airlie
> +
> +GPU System Processor (GSP)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

...

> +
> +External APIs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +nova-core base API
> +------------------
> +
> +Work out the common pieces of the API to connect 2nd level drivers, i.e.=
 vGPU
> +manager and nova-drm.
> +
> +| Complexity: Advanced
> +
> +vGPU manager API
> +----------------
> +
> +Work out the API parts required by the vGPU manager, which are not cover=
ed by
> +the base API.
> +
> +| Complexity: Advanced
> +
> +nova-core C API
> +---------------
> +
> +Implement a C wrapper for the APIs required by the vGPU manager driver.
> +
> +| Complexity: Intermediate

Thanks for calling this out.

I believe the "vGPU manager API" is not a standalone task, as many of the
required APIs will intersect with other components in nova-core.

As one of nova-core=E2=80=99s users, vGPU represents the simplest use case =
to get
started with, offering significant value to both nova-core and its users
in the near term.

I was thinking that if we could align with the folks on making vGPU +
nova-core our initial short-term goal, it would be beneficial for
nova-drm's development, since the APIs required for nova-drm are a
superset of those needed for vGPU.

It would be valuable for us to be involved in key areas related to vGPU,
including:

- Task review
- Design discussions
- Unit testing

Additionally, we are working on a vGPU requirements document that will
outline the complete API needs for vGPU beyond those already covered in
the RFC patches. Hope that will be published soon.

> +
> +Testing
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +CI pipeline
> +-----------
> +
> +Investigate option for continuous integration testing.
> +
> +This can go from as simple as running KUnit tests over running (graphics=
) CTS to
> +booting up (multiple) guest VMs to test VFIO use-cases.
> +
> +It might also be worth to consider the introduction of a new test suite =
directly
> +sitting on top of the uAPI for more targeted testing and debugging. Ther=
e may be
> +options for collaboration / shared code with the Mesa project.
> +
> +| Complexity: Advanced
> diff --git a/Documentation/gpu/nova/guidelines.rst b/Documentation/gpu/no=
va/guidelines.rst
> new file mode 100644
> index 000000000000..28a959f51c2c
> --- /dev/null
> +++ b/Documentation/gpu/nova/guidelines.rst
> @@ -0,0 +1,73 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +

I think this will develop into a maintainer handbook in the future which
reflects maintainer's requirements, thoughts, tips...maybe we can make it
explicit? I think it is rules of book that we agree to follow.

A similar one can be found here.
https://lore.kernel.org/kvm/20230411171651.1067966-1-seanjc@google.com/

> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Guidelines
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document describes the general project guidelines that apply to nov=
a-core
> +and nova-drm.
> +
> +Language
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The Nova project uses the Rust programming language. In this context, the
> +following rules apply.
> +
> +- Unless technically necessary otherwise (e.g. uAPI), any driver code is=
 written
> +  in Rust.
> +
> +- Direct FFI calls to C kernel APIs must be avoided; instead C kernel AP=
Is
> +  should be accessed through shared Rust abstractions.
> +
> +- Unless technically necessary, unsafe Rust code must be avoided. In cas=
e of
> +  technical necessity, unsafe code should be isolated in a separate comp=
onent
> +  providing a safe API for other driver code to use.

Also need to comment why the unsafe is the last possible approach to go.
the last thing we want to see is "unsafe" flying here and there in a rust
driver. :)

> +
> +Style
> +-----
> +
> +All rules of the Rust for Linux project as documented in
> +:doc:`../../rust/coding-guidelines` apply. Additionally, the following r=
ules
> +apply.
> +
> +- Code must be formatted with the ``rustfmt`` make target.
> +
> +- Code submitted for inclusion into the Nova driver project must pass th=
e Rust
> +  linter, which can be enabled with ``CLIPPY=3D1``.
> +

It would be also helpful to make the process explicit. E.g. sharing your
command lines used to checking the patches. So folks can align with the
expected outcome, e.g. command line parameters.

Z.

> +Documentation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The availability of proper documentation is essential in terms of scalab=
ility,
> +accessability for new contributors and maintainability of a project in g=
eneral,
> +but especially for a driver running as complex hardware as Nova is targe=
ting.
> +
> +Hence, adding documentation of any kind is very much encouraged by the p=
roject.
> +
> +Besides that, there are some minimum requirements.
> +
> +- Every non-private structure needs at least a brief doc comment explain=
ing the
> +  semantical sense of the structure, as well as potential locking and li=
fetime
> +  requirements. It is encouraged to have the same minimum documentation =
for
> +  non-trivial private structures.
> +
> +- uAPIs must be fully documented with kernel-doc comments; additionally,=
 the
> +  semantical behavior must be explained including potential special or c=
orner
> +  cases.
> +
> +- The APIs connecting the 1st level driver (nova-core) with 2nd level dr=
ivers
> +  must be fully documented. This includes doc comments, potential lockin=
g and
> +  lifetime requirements, as well as example code if applicable.
> +
> +- Abbreviations must be explained when introduced; terminology must be u=
niquely
> +  defined.
> +
> +- Register addresses, layouts, shift values and masks must be defined pr=
operly;
> +  unless obvious, the semantical sense must be documented. This only app=
lies if
> +  the author is able to obtain the corresponding information.
> +
> +Acceptance Criteria
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +- Patches must only be applied if reviewed by at least one other person =
on the
> +  mailing list; this also applies for maintainers.
> diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/in=
dex.rst
> new file mode 100644
> index 000000000000..2701b3f4af35
> --- /dev/null
> +++ b/Documentation/gpu/nova/index.rst
> @@ -0,0 +1,30 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +nova NVIDIA GPU drivers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The nova driver project consists out of two separate drivers nova-core a=
nd
> +nova-drm and intends to supersede the nouveau driver for NVIDIA GPUs bas=
ed on
> +the GPU System Processor (GSP).
> +
> +The following documents apply to both nova-core and nova-drm.
> +
> +.. toctree::
> +   :titlesonly:
> +
> +   guidelines
> +
> +nova-core
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The nova-core driver is the core driver for NVIDIA GPUs based on GSP. no=
va-core,
> +as the 1st level driver, provides an abstraction around the GPUs hard- a=
nd
> +firmware interfaces providing a common base for 2nd level drivers, such =
as the
> +vGPU manager VFIO driver and the nova-drm driver.
> +
> +.. toctree::
> +   :titlesonly:
> +
> +   core/guidelines
> +   core/todo
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f7ddca7de0ef..07455c945834 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7454,6 +7454,7 @@ Q:	https://patchwork.freedesktop.org/project/nouvea=
u/
>  B:	https://gitlab.freedesktop.org/drm/nova/-/issues
>  C:	irc://irc.oftc.net/nouveau
>  T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
> +F:	Documentation/gpu/nova/
>  F:	drivers/gpu/nova-core/
> =20
>  DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS

