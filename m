Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A531C3837A
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 23:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D633510E329;
	Wed,  5 Nov 2025 22:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="foW4JJHO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010023.outbound.protection.outlook.com
 [40.93.198.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5152E10E329;
 Wed,  5 Nov 2025 22:42:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IT6RhQiyX5lveizpEyezmP5h2mregm5WwlvqdVgmOfTYg+neM//a6rj8YQ4n9yVlhZjIDCzWOAWfwQo7sJADcyciC5HEzaKa7qN6eR+2G5d2lbPFSza2svTLk896gWsXitfPfQvfXjYVxsQEfFMmsALFOVBcFTfBY0KaJdSDz7gJjBH1L2eq4XDwrryUdCPGxw46mHkYUoKt2J6agxA84nrLOFrfBO8Hw21ZMMJClyWw+HqeI29Y+hieGnNzsb14iLW8DIKe2d7qcHfIXiQfKym/5RQir7j7kuquOtbGoTjxKGcGpea8PqinkjDrSlATtVtUFxlbeXybJTi7ozdFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFWtcTVvY6gIh/g1YKdw5kSyN4rJXzViA4nQQ161DlI=;
 b=dajmXzuJPwShrtGlEXkP5jpo2qWrmKya7heGt927rxqElHLUER9akqVGrhrSpAsR4PZ9xRLIvMooLmAhaAjT1koecX/DBokVTa3jjI37Si65iije8vZ5H+oW5JaO77Ph36QR7rGbDU5EtiOMaTr134Fv3nY84D5gUB0DNsgfMX/24heEqzkzA+D+QCRI43KYnxbWpZDUMNys+VHogwVsfFVxBTSdJxxI1bvNeXV+3ks6BUzZUqcAFrRUmRREiYoLu/grQb2BPjqHVSFq/n5O0k32T8MoSMjqJyOmlSa6HKum6RGpgxzIKfdUlL75UV38RNHw9f99Fce+zFVrbJbxgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFWtcTVvY6gIh/g1YKdw5kSyN4rJXzViA4nQQ161DlI=;
 b=foW4JJHOTP42ULCAFSuOFWTt/8y1z4cfp/fQLAOegcWKrPoJG6m0KZqBkkdLBwV9QslWSjv7ef6eapyTLs8JE7B0XUhRoSbcSfKJFhRDJn6UVisl7WRysegWBDi6zCAC9tvnCDVp9k/1jzWxIktQEy4ErOOJmofdm0WgBe8xjzBnpT3bxuLXhGi9zmSbremvwxvC2VUHvP33EUQt8jN21FnWK8cWyIdxjTTTyjPNxo1oM1FyWb3yPfrHhOQSYAne3odiMjMnLajK7UF8UB7yw0mlzdlPanpZPeQX3SLvLJEDllhurn+zPGfFcXuZm2i9A7R+vzqt3C61aJ38IFoyNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Wed, 5 Nov
 2025 22:42:54 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 22:42:54 +0000
Message-ID: <b3a8e750-1991-494b-828a-59c377953870@nvidia.com>
Date: Wed, 5 Nov 2025 17:42:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, David Airlie <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com> <20251104005812.GA2101511@joelbox2>
 <CANiq72m692bb+W32QN1G+LJa7sHs=gU8k6dri3mu95Smj7GiRw@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CANiq72m692bb+W32QN1G+LJa7sHs=gU8k6dri3mu95Smj7GiRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:208:335::27) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|PH7PR12MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 94fd5886-32ec-4dcb-f672-08de1cbca87f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bktROGNWcmFONWticVFHdjUyc1ppdXk3N1pIQXJ3WjhaT3RKcnFrR01LN1Yy?=
 =?utf-8?B?d2UvNFZOcHRndFFYZmFSb3BTWlNTZ3dTR1U1UzgxZGl2NjBuZ21SNXkwTEg5?=
 =?utf-8?B?aGUzcG16YVBwVm5FVUhsNTF3SWFnRGY2aDR0K1dFZ1MrS05HS0kxODE4blVS?=
 =?utf-8?B?UGJaVlpKU0ZBcWdKRUlRUW1PSjRVS2Q1a25nbmVNM1ZKenBGNFJXV2dhQVRV?=
 =?utf-8?B?YzR0Q1pJYWZMdEE5MlQzU1p2MzhUTjJ4SythbWlVZ0JwWHdIa1dDS3IrSkVI?=
 =?utf-8?B?cUhBVU1SR3RaclIzQUNnajZSYWxBTmYwSHFabnJ0bFArQTg2MUptaldwNS8y?=
 =?utf-8?B?YitiSTJXTlJlalc4Vmw3Y09VV3JVY0V6V3NaK3pnODV5YTNYWk1qRGhXV1NV?=
 =?utf-8?B?WFpiSGRZdHBGRXZubHlZR3R0Y05rSlNMM2RQZXNScU1VditlZkNuOXRCbnc1?=
 =?utf-8?B?L254d1FoVDdPWWlRUnhOMlMyM0lTOTQ0QmcyQ1Y2eHZObmk1ajlEb25vakJZ?=
 =?utf-8?B?UkpUV08wTHZ5Q0xiOHZabWJhVmtXSFJ3ajdVVGxKTlVLYXBwNjBNdFppYkpn?=
 =?utf-8?B?TTFNb2lwQVdKWU4yYVBkQlVxYnlTbm5MVWtKTUtvbi9Gc2FWcDl3NHJ1emxi?=
 =?utf-8?B?UWlraG1HNkdOM1ZBUlhmQnJlTStlS2ZxUzRpQTU0bHVnV1R6SWd2d2Nidkoy?=
 =?utf-8?B?cDBSQTV5N2FGZ1NVYytYTTJwUWJ0bW80eDc0MXllVlFXK3IwNU1HM0twNkZF?=
 =?utf-8?B?OHBDSVZVbitTODdUL1BmZzNWSU5sRk9FOFhoVURLTWpOK1dTbWpRZlV4KzBF?=
 =?utf-8?B?eVlwSGh2L0lBZ25PNWUyemdIVUpRVXNJa0pOT2x5YzF4N1U5MHpBVTU2enpR?=
 =?utf-8?B?bDNCTFZwQ1M0RUluVWozOTNFd2UvMzVPRFlLQmJKRE96LzJLZ0x0MVVMWk1N?=
 =?utf-8?B?V3dlZzdGam92bUhOaVQydWlGS09wK05xMDN0YmNUZ2xTUTVDTzJUZGNvUEVE?=
 =?utf-8?B?RklyeVRhRFlOdGF2UmVMREJsU0d1TGZmVUhCNEV6Uk1KaHlYREs0MEY1M0dO?=
 =?utf-8?B?MFgxWm9ybElKbm5CT3dEakE2OFkrd01UTmIvZGk4TUN5cFZ0TGx3YkF4MzNp?=
 =?utf-8?B?NjVLWFhuZi9vTUg3ZlgrdkZEUWljTHE4dmpBV3lzY2MxRSs2VXJtd3p3S2I4?=
 =?utf-8?B?ZThDRHZUcTRvMDJOSVZWbjNyR0ttSnQyOE9HSEkzaFo3MGgvL05mcUJLMWlU?=
 =?utf-8?B?NkxRQWZZUVpoMzROQkV1K3B1YXV4L041R2VXSmxjVWU4UC9VTWlVbS83WndT?=
 =?utf-8?B?aDM1WU81MkFBclFTNTM3ZEJYK1N6THNUekhQaDJhbGFjNmw5bHV2RkFRRjlL?=
 =?utf-8?B?MEdVb1VuV2NKaGZFOTZZeXBrcVFudW9IakxnNWQ1b2EvVVNLOHN3cWFSU3hn?=
 =?utf-8?B?di9wWm9INXFMaUhhSE5paU8xOHJxYlg3TlhGVjdjSDZ5RElqMkh6WDlVZTBx?=
 =?utf-8?B?emo4VnI1eVdLOTFXRlFzdVZaLzhWQWx2R1EwZXVyWDl1NGZ1dTFkanA4UlVx?=
 =?utf-8?B?YXlVYkM4WlZOcmtpTDNJQ2NQVE5QR2hMY2Z2dTZ2aWQ1amJBV29RU09MSW5B?=
 =?utf-8?B?cGNpUDFzb2hQdjhUTnNSWUNhVGpRWTZJR1NnK3VYTUxIYitGU1pZNG5hUE8r?=
 =?utf-8?B?V3JoYWNJeE1uKzQ0ZVhYSFNrREdySEVuMml4Zm5EalNoMlRoUlo2RVY1VFNt?=
 =?utf-8?B?cHQrS0VUc1VieWtZTWVWU2M0a0s1SGgyby9SOXYyckg3K0ErMDR3TlZJUm9K?=
 =?utf-8?B?OXdSa1lGdmZBbWtHS1hTR3E0akkwb1dCQTBvbVpDZUJhK3k2eWpMZEUzSzh4?=
 =?utf-8?B?eEQzU2U3cERXbUZFbGp5VVl6RGJCMTR3V2JodXBGVldQNUFId0RYc0ZqNDg2?=
 =?utf-8?Q?f9levdQkPHZPHnSOX1+aV+WXGZkIEo2x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEgydEtzV3lxRmx4cHU2d2VORDhQT3I3WHNhV0lzZFJxVVdwamVpeWt6eVZu?=
 =?utf-8?B?ZFcwRUxZV3NSbUgrL205ZDVWZ0xkTmVnKy9MNjR1ZENCc3FGM0NDc0JPbU15?=
 =?utf-8?B?Z0IwQTZUWUFnWFNnc0RjR3Q4cUd2U2doSjV3UldINnRZQThrWWZYYkNYVktj?=
 =?utf-8?B?aHMweTMxWlJkdTBSWlZpUFM4enRYZis5K0RxYlNVL09ZUHI0bXMzZzdvVUhl?=
 =?utf-8?B?R1UwWUVGa2p3bkVTa3NCaTh4SkdJa3lMMGVvNWFZbzFpZE8zTFRCcGpWTlZB?=
 =?utf-8?B?OE40UGlkNHFpbGNROFNmd3NETGhWd3orMTQ5RlN4ckVBZE01SXl3b3hGYmpC?=
 =?utf-8?B?ZHpsYlZQRzJYSnhtbVhFSVgvUk5SZ3RjVm96N1ByRWljOXFZemdDYnB2YXl0?=
 =?utf-8?B?T2FJYWZiZ1BsZ2VkUy9pVTVGZlRvcTVrNWhMYU5BSmpkOWJockloeHR5d2J1?=
 =?utf-8?B?ZzM5aVF3bi92dFdWVFAvV2pEcExDTmJyQkFuVXZ1MmJHTEZLUHdRd2d5S0Yz?=
 =?utf-8?B?YVZxS0Q1b0RaSHVEYlFqc01OckE3MnRZMGV1RUdacHFtcGEyb2xBNDV3VEw3?=
 =?utf-8?B?V1luWFltOGZtaEEvU0RwM0lXUy9RUytnWkwxOW9CQnA2NkhtWUpWR3JXc2J6?=
 =?utf-8?B?SXdqcFY0ZkVlTlpHYnQyMnc5RlE3NnI4b3djWldCNEIyenVnb0oyYm1VVVZY?=
 =?utf-8?B?K0dIZGJvQ1lYSnhjRlZjMmtmVjNwSkpHbWc5NC9jZnFacDlhK0tFa3MvYkZw?=
 =?utf-8?B?bDY2bGEycm95anFETTZKSTR5Z2JnaVJLMmJnbkkvSHRtNDlKQnZRRldDcTBK?=
 =?utf-8?B?UFgzclFLaEVJU01tQjA4UjdRQjdWaC9iYmpIM2RXTDBmSGxET0M1dkFEbGFy?=
 =?utf-8?B?eTlQLzR3bkF2TGhRbldnQ1NuS0t1Ym54VDEzZVJlN1NWczMyVUpCYk1IY2NE?=
 =?utf-8?B?TFBFa3VxVU5mSktWT0cvbktva01yeDE0MEY4UWRvTE9YL3lRU0ZtaWFOWXNH?=
 =?utf-8?B?eGM3amZiMFJ3cHZZdjdRVDFJeDVOZEU3a0NoU2ZTYjFreks2Rk9ocWloZHVN?=
 =?utf-8?B?TmlKOUhRbTJpR1RCMEgzNFZ2ek5aN2ZtRHc4K0tsRnplSkZmOFJYS3JTRnVh?=
 =?utf-8?B?OG53SjNNQWdRc0wyT0xuQTFGamJsUHdPWXNDaVJMUE1icXBiWmVzdk9sSFhK?=
 =?utf-8?B?NnlYUFkyeSsyK1pyS0Nxd1JTRCt6eVFmZm0veERFSmZUbi9odFdaWGFXd0Er?=
 =?utf-8?B?eXhIT3J2Zk4xbzV2ZUQybHRnUjJtdHJITUNKcm5WY1k3M0Fadk9zVE85UkZk?=
 =?utf-8?B?LzNnK3Y2a2M5V01PakNvYkZlWUhEdjlJWDFqY2g2S2tNY01kTnlJeHR1eHNL?=
 =?utf-8?B?cy9VNnU4NFB4WCt4VlhYaUxFUTQvUSthOXNVM1BqekRqZm1EQ1JXZVcvYnpE?=
 =?utf-8?B?SWltcHJWemRXaGVKTkR6RWpzMWswcktBRkRXRDQ2VEc4YkFvRm5adTJkK3lM?=
 =?utf-8?B?d3VzVnczZFE0RTh5NG9zWEE3aGQra1IrUkV2Mmh5RmFyajhLV2owWmJMQkhS?=
 =?utf-8?B?RWRnUERNaGZOK3JNNW4vRWNqK1J6cXBEWHRwMXQvVk5Ra1VQenFnd01BRGNw?=
 =?utf-8?B?TW82YmFEZ1BML08xOE5zRUlsUXJJQU9WaHB1dkNla3ZyMW55T3dYQkFZUzl2?=
 =?utf-8?B?ODJnV2FiSlVrYXZuYXdwLzRUcG8zVCtjS2dUNDZ3WFpEeWU3eVNjVWFMc3RI?=
 =?utf-8?B?TjF2S1lTOGNUZ3lFb1gyUW9KWTZqek5LRnJVT2JXVnFTNkR5VXB4OWZnWGlO?=
 =?utf-8?B?N0JyNVRFbzhFaXkxZFFOanZ5WWJBUkVvdW5RSEJIdHZZVFdTTTVlaXBlS1hE?=
 =?utf-8?B?TjZmNXhyZDdnUloyanVIbERaUzNCb0pKRzM3SEJJZHJOMFhaNkREME4xdWI3?=
 =?utf-8?B?aDZLUWVFenQ5aDZ3ZGdOUDE0dm4rT3U4cXowVm1yanQxMG9xOS9Pb2g0eVda?=
 =?utf-8?B?MXJkU3ovakZqTklHTHFTVUxBK3N2eTlXSU9pOGhDZ0FsNmUzVmZkQXdGR09N?=
 =?utf-8?B?bXR1eTNkdWhYUzk1cFhZa2N6bHp0ZjZHSFpkdmhTUEJ4S2tBd2Q4SFNrTkFv?=
 =?utf-8?B?Ti9uOG0zd0xSQ2tReWx5eHFNMVROSGRoVEpISDkyV29EMEhZODFUWDRSME1B?=
 =?utf-8?B?S0E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fd5886-32ec-4dcb-f672-08de1cbca87f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 22:42:54.0947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ht2Cynooy8BlsZMl+jluQwc6PnhK8lJ939xlPQeYr/urIsqD9kV27/W2mn7Oqvws+3Hd1zlivilZPSGx2Iddog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5805
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



On 11/4/2025 8:52 AM, Miguel Ojeda wrote:
> On Tue, Nov 4, 2025 at 1:58 AM Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> Perhaps wrapping it is #cfg is sufficient.
> 
> `cfg` attributes and the `cfg!` macro should work in doctests -- we
> have already a few instances, e.g. this hidden one:
> 
>     /// ```
>     /// # #![cfg(CONFIG_OF)]
>     /// use kernel::clk::Hertz;

Thanks for the example! I will guard it accordingly in my next posting.

 - Joel
