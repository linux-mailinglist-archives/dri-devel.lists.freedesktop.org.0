Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE2BCC39AD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 15:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5D810E802;
	Tue, 16 Dec 2025 14:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cwnyoew3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013011.outbound.protection.outlook.com
 [40.107.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7BD10E96F;
 Tue, 16 Dec 2025 14:33:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKnirYkebRJYXVzP8Ahiv01HrQQRQeSh21vgQ9rFB2I6V1GEdzgz9/TMdfv71NULESOZjmv9KSura9uTitRC50Fvp7BDeQH+gc2WrPQdKl5IEvxqr6KJ5BHgYujqN9CTUrWFO5V8/FODke7+5ATUcESrjFyNKFVsHaAqGelD19FWNRBA3PbZZ1ZxAwW0Nsi8eHNgYzI/7C0q/FAh+/7P1wrM/fb5Ix9C/eKg8COYUQ9htmTxAY1TGh8sCQNGJyNPwZiBY/2a35imtFEe+rd+xz9gbpGQVQpcmIeKTcbSJ0QMrXlt/UqCpLyWLQSudIwobMFXPx7gE5vQkQmlC7ngjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTiJReSNNmPhxZu5x0+kdzY3g5q9Qr1ZBdpg31ulank=;
 b=DXvz+hVyiVH1KiDfyK5hgTFuVkgp6SYXw6sWq4s2RsWPYcArxW5KkotjX11BgH2ZO2q8DZeByL1cmR9uIcoV2vaC7hrokGdpaEdqHK9ROF15TT2kXnpWjR2e2XmVp71eu57BJTrNPhn2l5VWOokmfVhrEPLKghCdPHTAEFJ5k6hTvHod0bPQln77OBha4h4EcVuvGMPuHn7eOc3I8YKzSUgdAfK0RbwiItdH/RdPjGhySkshoO+OWZVm/EmHlZ/DDIA2F+jXjGL8bUPlb4syqbqHvJq2LvFwltSWn+oDK60TJhDs5k+hlUXbCz1w5KCALGfCO0OaxHNSVZkLwej75g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTiJReSNNmPhxZu5x0+kdzY3g5q9Qr1ZBdpg31ulank=;
 b=cwnyoew3GMd8nW19nmVsLBfvC8F76WzACPWpQoupBsbLDlnkH8o6oDNqBOLTxgKjHaDdNbX30a6Is0LpCKRcXi6f5AgMP6i8FbTCo7I1RW1hXyzlFPjRh61UTe0YnOK5EhhcWIflcxV+/GdbftSn3M1CX2ZEJo6CCcnYMD7Axo6ZP3GZ48wCaCR8q1hj3txvafUJGhLHU6LctMEtfcm8Tqjfu6CW99pWAx9ZeABY5I3zvY+FRoLaU5RrRg2h606IDJ1K0epyKFbT+mFuBDC5Xb0BYoKWEjJGGMVvQffi4nIbFJhaUJTx8NEPSn5ZmO6DUKmCO+VsNSfB4tpYSHLWWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4228.namprd12.prod.outlook.com (2603:10b6:a03:20b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 14:33:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 14:33:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 23:32:58 +0900
Message-Id: <DEZPQLO5LNME.2DX0F8PX3DW9Y@nvidia.com>
Cc: "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "Danilo Krummrich" <dakr@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Andrew Lunn" <andrew@lunn.ch>, "Heiner Kallweit"
 <hkallweit1@gmail.com>, "Russell King" <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <netdev@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] gpu: nova-core: select RUST_FW_LOADER_ABSTRACTIONS
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Alyssa Ross" <hi@alyssa.is>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251106-b4-select-rust-fw-v3-0-771172257755@nvidia.com>
 <20251106-b4-select-rust-fw-v3-2-771172257755@nvidia.com>
 <c3e35e5hgnx6vozhoyefhvaznr64wm5qlrqwyzuhwn3v7cnuos@ueh6wqayvirf>
 <DEZE2MJFASEH.91JN02AU26VA@nvidia.com>
In-Reply-To: <DEZE2MJFASEH.91JN02AU26VA@nvidia.com>
X-ClientProxiedBy: TYCP286CA0148.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: d42f38ba-60dd-477f-53e9-08de3cb0058f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NG94RU1sU0NnVmtYYUxaNUVtUzRCK3QvdE4xa2QvZ3FuZ3RWUU0yQ1dhdWpX?=
 =?utf-8?B?SDhWYlZwdm9hYXZOMDhRNWJYV3JuTGV2cDNZUkJlbUxscmoxL0E0QmxOdHla?=
 =?utf-8?B?ZXRTTnlWZGU1YThEOTQyMG5pQTJpVGdNb01oSzhwaWU5NkN4aWxaN3JYcFFk?=
 =?utf-8?B?ZExMMDBEN0Z4K2RIQkxaYVZUS0lLUEN5SENncVdOV0hsaUM2WUYwM2pOOWxi?=
 =?utf-8?B?enJDMDBTaHFYRW9vUnhZNDFIaENVa0JBdGFRT09lenFCL05wcHVvMCtOR1Zr?=
 =?utf-8?B?Wjhyd1hHWi9VSzdnWGxLYXZGMkVaQmpNYkxubnliaWtPckRTcWFqY2lxR1Zs?=
 =?utf-8?B?VkkxdXNqMTVPWXZmNExSdENnbHlESTVNRkFQR0lKVy9TcWs4eXJsOHBKOS9n?=
 =?utf-8?B?Z0M1TVo1Zy90dzRkMnVXVFhKN3ZsSC9acjJEUkFIK0Qxcy9VdE54eldqdWNv?=
 =?utf-8?B?YXRZWmZWT3VNcTc0dFBQM2xtaUQ1WVc2akwxc2hwV3lJRGdNQUppNnpybDBD?=
 =?utf-8?B?V3Z2TE05MUI3UXdjZE1Gd3FZRHN5bS9FTzZsRjdGNVM1VFhPcDBVMngxTmRh?=
 =?utf-8?B?WWdxMjRkdm4rZTg4S1VpT2FSa1Y3bnJ6M0pyOXUwbktFdjFNRURlZWFBc2Fu?=
 =?utf-8?B?YVNmVmIxeFdhV3UzVUlTSjQrSlAxWGpHUjlrbDZVY1FTQ1NIaW1XaWRSZG5h?=
 =?utf-8?B?OGU4TklaREZINUNvcExtdjN0K0hoRjhJeWIyU0lQeFBld2VRd2hXVHI0dU9v?=
 =?utf-8?B?NG1Za2pPSUZmRG9mOTRtWWs2SXhnU1VqLy9WUWcwQi9Qc1dpTlloUEFHZi92?=
 =?utf-8?B?Q09wbFdNUmNaQ2tKQTkrNW9xaEg5d0RUbnJqUHlTTkdXWURCWjlzK2lRL1Fq?=
 =?utf-8?B?N3ZkRG9mMkQ2U1ltck9qQmFxWHJUNnAzbklpaDFEdGp6aFdRZkVDM0FPbmxU?=
 =?utf-8?B?OVZnVDlRenhTT3NRd2hDWW9DUW43WkJTNzU2R0ZKd21uZjBGNjJYMFQ1ZlZC?=
 =?utf-8?B?MnJWc3cvWTFLQWxhNXljek9ubzFhVUIzVmZjYlNOQXppWjl5SGc2RFU1Ukpj?=
 =?utf-8?B?djREajdZL0N4Y1ZQdGRJdFBBdDNkenR2YVg1NXFYR2dMZWI2cVczS2MyQzlm?=
 =?utf-8?B?UVpjby9zbDF4WW0rc3hWYW5kVzZscEhMNVZZdkcxdWJpblBUOVNtRnFhNnZv?=
 =?utf-8?B?c3dmdVE2TkZPK0RadFhpUTViekZSOHo0SjFNUExqMGMxODV1RjJiMGltd3ZU?=
 =?utf-8?B?M1BHOUpsUTZTenB1cHQwcVRha3ZaNG9HbDNOb0NEUE1tKytjdlB3ZmtzdWN5?=
 =?utf-8?B?M0R1WlVyS3NSY21UT2I1LzBSbnNzOExURVJUZ3lHU3piS2UzQk5ZcHc5UTJa?=
 =?utf-8?B?V0JBRHh2SmhCS3JSc0szYUFTc0pyYnRCeDd6Uy9oRHA2Q0s3b3FtWUdlcDU3?=
 =?utf-8?B?TEd6SEJnSDBWdmgxenVuekh3THcyUlhQRGhXKzU4S2gwaDI4bm1TYzFMeTE4?=
 =?utf-8?B?REdZYnlZcGNES2FOMkhNeFFCdW8zSElRbXIvRVNOYllPZHJ6NUoydUgyc3Ba?=
 =?utf-8?B?SEV1Z2IwSUcwR0k4cjd2czNDYVBVeHQrVStHLzVncnNuNWFBcU9jSVNqMEpn?=
 =?utf-8?B?cUYrZ2ZuUnByd0owTGxlcmFnT1Y2Nzc2NXZRMEFGUnUxNXlFV0MwUHlFbGZv?=
 =?utf-8?B?UFVZZndSS0U2YWt3ZzFyUnhZcmhTaWNFVjZMcG8xSXZxRGhOejFkeExuMENL?=
 =?utf-8?B?M2NObmJ6cWVUMVVVb0dydzNMcnh4RXVNQW94cjBsM2o1NXk4cG5pUjJRcHZE?=
 =?utf-8?B?S21vTXdONkVTN253WlBCOTZIRkNyUWVLelQ4QTNJYVVBWTc3TDk1bDN4Z0hI?=
 =?utf-8?B?QXY5VDcva1NXdzRWOTZ3Q3Bpa0s3WVdyaVFubzQrTmQrcFdSaE5DQUoxWWpT?=
 =?utf-8?Q?bCcIrXGDjiNyKStZCIBOhSC92n3kc6V6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUxUSy9iQUw3NjhEa0VoMHpTTm1aN0w4VXF0UUFlZ0NiUE5xOVNnbjgzYXFP?=
 =?utf-8?B?MS8rRDBuMlZPWlhBNk52bUhBSlNjNkl0WnlZcnc1T0V5ZG1pNVdGNGE2STRY?=
 =?utf-8?B?US9UakRHYzNaSDFsSWtaWkRhMStib0dFL0VINFdkclJTaEk3QVNDUDlnVTFj?=
 =?utf-8?B?NlBOZnAzd3BkWWhtRVBpSDNnamtEM3M4RkNmK2lrVml2OEllZ3NzMXZ2ZEF5?=
 =?utf-8?B?d1ZtNW5icTFoVDdBM2hUNGUrS3JzV2d0ZVhSSEpETHBtSUJoZVRzUklaS2x3?=
 =?utf-8?B?RXRXQS81NVZjUUtCdFN6aUlpMnBEWVdUaVVBUXdYSnpLc2NlVnd2THRsMWVD?=
 =?utf-8?B?QnhXL21sZTlQMFdNQlBnS3Rrd0Q3R2QrUHAzcmFOcUpaM2MwZ0ExWXE0bUY0?=
 =?utf-8?B?V1JZRitiVkYxRDRPZUNTLys3ZnFSeDREZDF4c0xpTm5hNklzbVpZM0hjNmhQ?=
 =?utf-8?B?OEp6M0ZmczA2Vmg5SzJSUWE0VFVxRklqTjFaRkpzd2QvcWJscS8zeEZrV2pp?=
 =?utf-8?B?WUFTNzlCTTZZT2pNdnp3L25DWnZHTDJhSjA5a0RTS2VtUGtJd21BemhESEdw?=
 =?utf-8?B?VWNKdWRtRVh1bTg5czhIMkpKZ2tBZGZmOEs0dTNEeEpBdVo5S0tjbDlraE1N?=
 =?utf-8?B?YkR3SFF0NWtpK0pCZnU0YTg1VW1kcjYzRFZHMDJNTE5hYWJzMlRyNEI1aVVa?=
 =?utf-8?B?eWZ1UWNKK1dWdEsxcm9aanR5TFhaQmpuMmlwZHlhL21FTEF6N0Y5clVCM2Iv?=
 =?utf-8?B?Wk9rTzJlMkZ0bzJDT1FRWmt2NUZxaGVqbHVEVURXWEJ4aVU5eUVVekdNclhn?=
 =?utf-8?B?QTc0NGIxWlM5M2lTd2hvZVZOc3NOeFJXOTFLdThwMldTNS91MHRqWWVNc1RI?=
 =?utf-8?B?N3JVaXplRkZyV2hWbnJpU3BEL2dVeTN5ZDNadUhuY09Jcm5IY1hUYkladTE4?=
 =?utf-8?B?TTN3Q0NUWXZzNE9jY1o5ZTlCY2FLR1Z6NVY5SlNJeEZQWG96RzBKVWc2Z3ky?=
 =?utf-8?B?cTJWRWV2M3hnd2YzUm5BK2s2eE13UmF3ZHcwWXZkcjNUL3VLR2V0U1hpODZa?=
 =?utf-8?B?REoxVHhNSGRocXBLYlpyT2MzeFcvQTNpL3I2Y3pZRithTmZXQ3dZai9kZzhU?=
 =?utf-8?B?Z1lFTERnK2hZVjhPNCtWMWpwMlpkT2ZjMDZKa01JTDgzTFdJV0F2WFp4bEd0?=
 =?utf-8?B?dHZRNUdSc05YSDZ4WGlGeldTUm1LbUg3aVdiMjZMc0xTS1ZZYzc2dDR0ZDhT?=
 =?utf-8?B?WHIwYXgzaGZpV1hkVWNxU1pUMW1KajZpcklXTmZCc3NZSHRjM3BLeUVGaHVZ?=
 =?utf-8?B?Y3p4YWV1c3FLQjZEdWxrZXlXb1VtRWtHbEJONEpJTEhEWHo2emxxT25vclhT?=
 =?utf-8?B?Um5oWWpaU3ZmRDZEQ3N0N0ZPN1R4RXg2bmlON1FlZ1ZJaUNtZjJaTUMzY1Fi?=
 =?utf-8?B?YXM0cGhMb0pEOHdHdGpRNld1Y1llaVFKb0pQTFNUYXdDUEJnVUZ0ZmRsYjdO?=
 =?utf-8?B?cERJRG1zQXNvOUZISktlcGlpVmlEUmdudHZxOG1NMHBIM3RvSmxRaWozVGlt?=
 =?utf-8?B?eE1aVDRYeVFmZkwwVW5HTDdaVzhhbEp0WWUxMjRQL1dDeWR6eEMxeVZMbitz?=
 =?utf-8?B?SDN6aG91N210anBWVS9kc1ZaOXYxK3E0RlZGbWwwd2ZteHhwOWhQUUNMaWpT?=
 =?utf-8?B?ZTVQYm5SaStha3lqMUt1V0VQUFJxWXpLWVZUQ0VIdExMYTVlQXhNNjhuMFNE?=
 =?utf-8?B?N1RxODJNSmZ3RDk0ZWpqbnVXLzdHZE5pYW02WDNzODI5d1BlVEdvWldlQ3px?=
 =?utf-8?B?d0c3MnJFajl0bWt6R3JXQ0FZVGF6Q3NTcGdUQ2ZEVzZrQXV1NlIrVnRIVVho?=
 =?utf-8?B?Mk1mekZLOVFnbmloQ0RLKzZDUkNYWUxyRmYxYmwyZmhJYnFFNzJOM29Rc29z?=
 =?utf-8?B?VGpsKzFGTHlZWW83SmcvK01KWTFRYzhWUUdNbWF3QWErVTMraDF3Z1ErTVp5?=
 =?utf-8?B?SkNwWW5BUzVucnQ2M0cxekRHNlBnakpXSFpIRFFFcys2ZnpEeGdTWFh6eHVU?=
 =?utf-8?B?VG5sSk5UOElZSVhkdFJxdkpuc0dzTUpZdC9EL1lMWXNQT0tNajJEWHcrdU5G?=
 =?utf-8?B?WTdzOHlkZC9NZ2RnSlZ1YVhNQjR3NTlra3g0endrWW5pbXdSSmZncGhnOW9X?=
 =?utf-8?Q?4WVsFazXz0H6jvgOOfnf7gqswb9qifwNjvUx0qRKgX+J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d42f38ba-60dd-477f-53e9-08de3cb0058f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 14:33:03.9662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M456x0mnrWsD37nB/s5KaLbb5LFNglHAvX1ShnkfUqWIhNd161VLe1PHnLv6zcH806KfroMJwrd2gQzwdUFBpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4228
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

On Tue Dec 16, 2025 at 2:24 PM JST, Alexandre Courbot wrote:
> On Mon Dec 15, 2025 at 11:59 PM JST, Alyssa Ross wrote:
>> On Thu, Nov 06, 2025 at 11:40:55AM +0900, Alexandre Courbot wrote:
>>> RUST_FW_LOADER_ABSTRACTIONS was depended on by NOVA_CORE, but NOVA_CORE
>>> is selected by DRM_NOVA. This creates a situation where, if DRM_NOVA is
>>> selected, NOVA_CORE gets enabled but not RUST_FW_LOADER_ABSTRACTIONS,
>>> which results in a build error.
>>>
>>> Since the firmware loader is an implementation detail of the driver, it
>>> should be enabled along with it, so change the "depends on" to a
>>> "select".
>>>
>>> Fixes: 54e6baf123fd ("gpu: nova-core: add initial driver stub")
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>
>> I just encountered this testing 6.19-rc1, and was pleased to discover
>> this patch had already been submitted.
>>
>> Tested-by: Alyssa Ross <hi@alyssa.is>
>>
>> And it probably also makes sense to add this now that the kernel test
>> robot has also found it:
>>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202512061721.rxKGnt5q-lkp@=
intel.com/
>
> Thanks! Both tags added.
>
>>
>> (I suppose it doesn't make sense to add the Reported-by suggested there
>> since your patch predates that report.)
>>
>> I see that the first patch from this series has already been picked up
>> by Greg, but this and patch 3 are still waiting.  Is that correct?
>
> After rebasing on top of -rc1, I can confirm. This patch is going to be
> taken through the Nova tree. Patch 3 is available for the relevant
> maintainers to take.

Pushed this patch with added taggs and Danilo's Acked-by (received on
Zulip) to drm-rust-fixes, thanks!
