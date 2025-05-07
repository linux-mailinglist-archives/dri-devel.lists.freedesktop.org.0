Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF04AAE0EE
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4380110E087;
	Wed,  7 May 2025 13:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n6aZXoQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B058C10E087;
 Wed,  7 May 2025 13:42:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXy/4IVyH3vkkIfMwEst2GAf7d9vTwf8Zw6jtFMA/BmUY+37zcoeuiwgPMMQA6YpHdBUtlpJv7ezGFpHHsjkJzQ7VatstOAH43dShwrmQw861cPBbu1hr2vStGazGbiOA5ruTbclj97Q1FWr/6MfQrpLBWTPYK04qlk2BFRrnH5Ki9KPqdwHWEKxqsJ0XxlEiMdE7iRumt8CV4kWzst0F8xUAjvMcfPw5EolaWDRcfaOCQQv92iv9C0WAJ8iB3dAoxmyAmJNana3dVITW5zVgBXRCf5P9iuWhMCEl7X4kRQpnjqLGLkGunt2jM6n/nTCD49SDmX35Ji1ndOzm2yXSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g353OcRqUyim3joaoyXxo6Wn+lexsELnIzxqyjw5zc0=;
 b=B1aJ5TWzkENgW3JbhiIx3csvbInmEypkpAmqmxx85WAvXBVPGqQvI6tTgC7P8c2hR0LKHOCoGb0PeebDJXCKJud2oU5s0LIUF5OiRRuLWNbgLpDw2SxyvVaE6jJcnJi9z3NXuRSET5aZmH8uPrqXQ+BjmNEdoiXtXqTGm3tNaLus+P/1TcZUe7ew5142klR42V4HHK0tEjQJJ2cE3VSZqd7nGYfADbza0aJGcPthqgyue7k0PPWxH0ZK1Yxoli0wmqyStanYOxUlTRnsHZyvd3xVlUa9YX+5KxpepGobT0of6JrO4sGdoBrYsfsMmKRh4g+kegKyqE3RkXM1sYLlEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g353OcRqUyim3joaoyXxo6Wn+lexsELnIzxqyjw5zc0=;
 b=n6aZXoQMqAw4VeAc7wicKE7kZu4vUVg8fddBzFKgNb+XYMuKkW7bYkH1fh/a4ypFEvuQu/AAcM9snPoq5sk6c50tLlFk7FGX0X8jgywYGdfogrjG4FEWIoimvT6ngi1g7YY7HQOZQ2DW+mDB3ioeZVZ9YJH5/hElt3UaNWFKdlSc/0Ug3G8sQ218FihpravtbRe/tA6hyhvMFtL/3c0waqngyG21fXCC1P93YEgZkxi6Yo160zrO+qvRoiVXauUw6iAUWzbAUJggv27Z+okfnTn92SEIvX84/NVr4CEGAFkkRnVctL60tDtSs6wM35hb4S3rAyOLW0XcT04wxuRgvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 13:42:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:42:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 22:42:14 +0900
Message-Id: <D9PZ09J54KJ1.3F0PQFTZ1Q8QO@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Ben Skeggs" <bskeggs@nvidia.com>
Subject: Re: [PATCH v2 09/21] gpu: nova-core: move Firmware to firmware module
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "corbet@lwn.net"
 <corbet@lwn.net>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "benno.lossin@proton.me" <benno.lossin@proton.me>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-9-b4a137175337@nvidia.com>
 <8bd3e3621e810dca2b71f287708ccf41861a9c93.camel@nvidia.com>
In-Reply-To: <8bd3e3621e810dca2b71f287708ccf41861a9c93.camel@nvidia.com>
X-ClientProxiedBy: TYCP301CA0040.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: d5848b89-a743-4670-5fde-08dd8d6cfb80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0FrYUYvanFTcGZDTml1QjFGbVVzNkh1RmN1OHprcEdBRmlnUEJobzdsVjk1?=
 =?utf-8?B?ck0rdXRPeHhZMjQxMU9ZUkg5T3ZCamU2VTFVZ3RZS1hIYkRrTDRLdzN5VVBZ?=
 =?utf-8?B?QmJSRmxrZTh2Y2ZhV0NBdEZ6WnB4enQzM3BHNW9aWm8vM1NFMUlwaFlYZUlo?=
 =?utf-8?B?NjllT1NtazJvUzg4YU56OVB1dVNiL3NBWEZqQVNxQXZCakF2Q1N4Uzdsd0p5?=
 =?utf-8?B?L1JnSk9ENHIzRGZJU3EvQzFUK1oyUkY1Nk9uSVR1QW1YTlZFdnMxc0tRTGtJ?=
 =?utf-8?B?UVlrRVFxNTF0OVUycm5oYTdpL3RDRk41c20xR0I1UjRONXovUTFRdDNRc1Jw?=
 =?utf-8?B?ZWFDejZwWGdONTdXTVZ3cWFuN3VlMVdabERJVGFNQm9PTUtTbHlralRlbERJ?=
 =?utf-8?B?Q1ZCc1FMOHYrT2gwbTFhTzZKTUVoNFk5UFVmb1lFQ2ZVNFd5bEJKZHFjK1BN?=
 =?utf-8?B?bjBjQ2VWUmFHdWxmTHVPZDJxenJUOEU2SG1RcXQvT0xCc0N4d0pEdmV1dmJj?=
 =?utf-8?B?QXRHcW9pZGtleHlyVUh1YVJpeHBpWEZodVV2UHh2V09yQzdESUoxZjJyckRw?=
 =?utf-8?B?OTYrSGVBaWVPQTE3b1F2MG5BeGxUeGJvUmpsRlkyVDQvNk5YSnpMZXA2THpa?=
 =?utf-8?B?eTQwTit2NjdSMGhlcDRTUGVyL0dzOGtURTZJQnlWdDgzdjkyK29SKzVldHBV?=
 =?utf-8?B?OXFHeGdEUXptaTM2ZjdmY0wyb3VYa3J6cDVoNWlWeUhoVmZsRDk3VFg0NWdy?=
 =?utf-8?B?S2t2Vzc3dlNpMGV3T29lRGZBRDBJT1ZsSHNpcThLTXFLYVZqVkl1WWFtbkRH?=
 =?utf-8?B?aG92eWp3elZhMGRQelFWYmhLMjJSQ3NOekV0VzhvSnNrbnB6NWYwZUs2dC9T?=
 =?utf-8?B?SHMrR3VCTVdPeDc4bUxibDQ5SWxtSUFQSlpyYjJvamliMDBQSGdwSWF0cW1z?=
 =?utf-8?B?MTdWT0N3KzgwNlhIb3BIb1F2bFliUEZTTm1XYU5kRGJ5SExoS0V0QlpBL1gv?=
 =?utf-8?B?MUgxMVl3clRFdnphWUMvR0NpRVV6VkVzTzZEVTV0WjZHZmc0S3liYUp5TTMv?=
 =?utf-8?B?V2R5RGZwbmptSTVyTDlkUUxUZHhNMnpBMXpIeEhHWkoxOGNUQTEzSHFaZmRJ?=
 =?utf-8?B?YmU1eElYWVg2ZVF2cWtDSE1kdlNxSkg2bWxWQzBWN3lYMlNleG5EUmhCOWxG?=
 =?utf-8?B?dDdwVHRBQlcra0RJMmZIR0t1TmF1TXJzUldFSERvdUdVa01jNU1ZY0NRa2tz?=
 =?utf-8?B?ODRISTh0bXduU0JkREZVK3NxRWJTY05tV2NHT2lES1V2cDZzRTNPUUhIYlVl?=
 =?utf-8?B?ZUxpem13QTYwb21WOTV6Q3FuQjArSm0zSjMxMFVhaFMrbDdUZElGOFZNK0pD?=
 =?utf-8?B?dmVIb2QwMUtteWlIWk96b0ltNXVMdDJHVHR6TVFHY2xpd3VYNWRhOWhVSm9v?=
 =?utf-8?B?UXhDVis3aUVIcWFpeXlucDd5OHNVQ256dzBDcHhrdVJHVGhSWEl6NUFPMzdF?=
 =?utf-8?B?ZE9XRXFSYVpSK0RaK2RvMlN2eXpHN3NyOGtaUFFLY0R4SEkwM2NsZGJhWTd1?=
 =?utf-8?B?ZVpzME1TNDZNTWhRM3kvc0xETEs2QXZnem5JY1pLcURONndjTzZOYUMrb0Zy?=
 =?utf-8?B?MlNsQTdIN1lsRURsZ2NsakZUaHd3SUJkS0V5VEJEd2l1RHZCSnBLeGpwc25p?=
 =?utf-8?B?VDI2ZkdtaU52RjRtL1UrYk1tTy9UazhzTytRc0pGUmhxV2E2T0NIODZnSS9B?=
 =?utf-8?B?aldSb0NraXlqeCsyQ0JOQTRWK3BTMVdpWkFlME80MnozTjR6eVpjUHBMdlJu?=
 =?utf-8?B?N0ZKOVgzSUd2NWRFdzR1WjRXc1V4V1dFb0tPK2RZaDlxTzVmY2wvWUIrTXcr?=
 =?utf-8?B?QjFoUnYvQXlKRnVHZ0FiWjFWa1MwMHlTOTgzQU1RMnlaQTJzQlRMcXBhVlJa?=
 =?utf-8?B?MDRXU3BVUXZZNW81MWlaZTQ3MG1OVi9YZVhTdllwa2ZoVGJHQkxsWTRaYWNz?=
 =?utf-8?B?VytLYStoWDR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(366016)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWxHUkZxV2NKSnNiSzI0MXhlRDZaRkN6UDlYemxlRTl6ck9KS2ZvWWRRU2FG?=
 =?utf-8?B?THAxTTNFN2N3RUV5bnJ5VElkdzVsVnVjU3Jad1AvQzFhS216Y1RNTi96S2ZN?=
 =?utf-8?B?Y25Qa0ZYS1Z0YjY4ZGFMcVpTZE1JeUd6VThSS1FqRGptcmgyNWt4YUdXWFN5?=
 =?utf-8?B?OTlpczhqUFlrOTlvOE9nT3hDSW14N3licHkwYS8rbVk5RHBHU3N6amNFaWY4?=
 =?utf-8?B?UHB2MzlLaDFERlpNSEVDaHVVNGFXWnJJN045cDB3YXNBOUNHTi9xd3dTU1ZV?=
 =?utf-8?B?YkFySXU1OStkWHllUHNRVjd0aythZkkxeFFYZTlONEFOMVpVOU95QXFUZ3BP?=
 =?utf-8?B?N1hsQjVhWVJDS2hvTmt0VXovcmdJWE1uTjdSYXlTcGFYVnVtc3dtOVBBVjFH?=
 =?utf-8?B?L2xJMGxOaUVQNkd1SUEwVGdRSTVLUVNzWmRmZlZLSVp2RXBqUFpFU01Cakxh?=
 =?utf-8?B?NVpyRzRRLzl6ZE54OHZxZVVjYVBLVjhEeDduM0hXeHRkb3k2MEEycm1CL05H?=
 =?utf-8?B?amRQY2QrdFYxWXBNQkFoUzZNUlJMK2dqa3pGU1MwOG5iWFNWSDh6Q1FzUUNS?=
 =?utf-8?B?MnpYK2NRK000NVBVWUl0UzVDV283bnh0UEhjQ2VMUjlvOHFJeGtJVTZGZDF4?=
 =?utf-8?B?VnpFVTZHNGR3dTcxcno5WkFhNms1RUZqRG9QWHZWeTd1TnZ2dW40VmQ4a2J2?=
 =?utf-8?B?eWJ4MkYwY0Rmb3hCcm53Qkx5RHJweTZhSXBxa2FORmloNkR3amlmSkprL05u?=
 =?utf-8?B?WjRxQktSblR5MGNJZnR5NjI2NDROVmovOHVpWmtaUXlGcjJMYWlURVE0TnBS?=
 =?utf-8?B?RDRDT1RBUzltWWk0VkIrMkhHMkZYR21tU0JVWGZ5UzFmbnYvRmRyTWxKcTcz?=
 =?utf-8?B?RWM4R29QdXhhOGNxMEtGZGJkMzA0aHd3eTBoaEZ0aGI5RFlobmxUTTh6Q1NY?=
 =?utf-8?B?YVlrUDdObExnbUZoTXRtV1JDRW1VRHhETGd0cnp6anVmVU5sRjZ6bzdZaXJU?=
 =?utf-8?B?U1AraHJaQTl2N1R3bTVqZndjZk1CcmJCK2x4QUE0OE4rUWJLakxBTGd2TlFS?=
 =?utf-8?B?Y3NFR0Y4Y0JBYTVMMWNlVUJzb1dOclNhNUE1MzhzY1dlNTJuMjFTcy9LQlZV?=
 =?utf-8?B?ZXcvU0pKMFpmTkRDZEc3R0dHd25KZTloR01seGJlQ3Bmb2hXYXg4R3g2VmdT?=
 =?utf-8?B?M3Q0UXpqUmFsM2ZSb3BRai9vK3RYZndFUXpTMlZvc3RXZEpsa1FlbmRVVWFD?=
 =?utf-8?B?NmV6aElQVVFsZ3JvZnJrQnExKzlGc0pQWVlMM290R2pwYjJEd1VpS3ZJODQz?=
 =?utf-8?B?VE9RRVV2bkpYc3RrcmxVRm1iejRqeHBIdlNNbFJ6bXZlWkNmbmh2bVhXVTRU?=
 =?utf-8?B?QlBvWVNNcURqUDEwTEtoVUZ4SzlkOXdTWGlRL05kTCt3Ly9zdEpUSkxtQUc5?=
 =?utf-8?B?K29sMmFmQnNPRWR0Mk10OGJlNStET1NTNTdwZ2x2MUZCelBLMkdwNElmTWRi?=
 =?utf-8?B?ZHZMV0F0blQzQXkydFNpNWN3THBIdmp0UU1nTDUwdGM1cEJEeEtKanRCTU5l?=
 =?utf-8?B?MXM3aHVKVWNCaEo5V3JNaFpCTXVnNGtkV1dSYzRKVGJ5V1laRVQ0V2pOUWE1?=
 =?utf-8?B?SThCUmlpRkUvL054b2ZJajUzSk1MRFQ4ZGxINkp5SXpkVWpza2NkcWkrTHZa?=
 =?utf-8?B?VEpaRmdqNERQRDhCSDZLdmVVSG5GQjRXcjR4M3lmbzNvcXcxZllzSXBDZ2J5?=
 =?utf-8?B?K3V6VWRyL0dmZGVuQy9IVnAzcGpwdGRDQzhpMExydjdQc0xQK0RzVlgvaS9S?=
 =?utf-8?B?MmJIVXFzV2RGZVRhY1JrS2JnVnVnekN4eGNnZDZJSk9mTW40cVV1d0FUQ3NP?=
 =?utf-8?B?b21rTTY1ME1lbk1oam1OTllkUDI4QWNJN1g5NDZ2NmZWdndFNlNiczVySzZx?=
 =?utf-8?B?VkkvbUI5d1VUd1RSbWw3UTJYdUVyOW5DdFpSckJ5TlZiUzBLV1dZcy9idFRv?=
 =?utf-8?B?YkZlNEFtdnNtdVM2dDIvZ3lBNDBEUnJRYVVhdlBEdFRUQUlUZXhDRGl6WFpL?=
 =?utf-8?B?c01tR0NRRnY4ZTZnOVl5dFM0cDFYK1NsYk1oTjJ6VC9yY2NKbDdqaG5PMjNh?=
 =?utf-8?B?WXprcStTK0tqVTNYV0R2ZHpvRE9IbkdMdXZyZW9BNmlKRXljdEpiSTc5Qmpv?=
 =?utf-8?Q?IRgmK397AFABfcEczv/BLumGzPPMrqcpTlNZT3bN1PFH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5848b89-a743-4670-5fde-08dd8d6cfb80
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:42:17.4086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DATupA8O4aeG7HydqcCzADWHLRJsSV6Xz0b44igdoH02GKT5DwKzZ+zxq2Jve0lq24B4WeHMQEszZpWxJhfi7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356
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

On Sat May 3, 2025 at 6:14 AM JST, Timur Tabi wrote:
> On Thu, 2025-05-01 at 21:58 +0900, Alexandre Courbot wrote:
>> +pub(crate) const FIRMWARE_VERSION: &str =3D "535.113.01";
>
> This needs to change to 570.144.  You can find images to use here:
>
> https://github.com/NVIDIA/linux-firmware/commits/nvidia-staging/

I have the patch ready for that, just holding on to it for now because
nothing it done with the loaded firmware yet, and getting r570 adds one
extra step to testing this patchset.

Once we start loading and running Booter I will switch the version to
r570.

