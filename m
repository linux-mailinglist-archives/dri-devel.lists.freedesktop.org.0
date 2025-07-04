Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FB7AF86EF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 06:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B8210E928;
	Fri,  4 Jul 2025 04:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tPKE7w4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7643310E210;
 Fri,  4 Jul 2025 04:54:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIkXfeckReFiZbMLaI9RJIOnKaZsYi0xJ84I6BHJLw8USLNbQulBWU5eX015E9F6GVUFUyMbc5zWrABof3tAMI4o0vruAvfh5UdvCiP1vne8Qz/RboQ4MAsVDLrHSi5p7tCM0Nh5E/qrWXuEUOIzt9iIE6+2hOJhrL2YE3yC9cH/WN/9PVwz1mHBIWWMG34+mC8Dy/a/eGJEnr+bJXeCzX07NYmohtj/5stPArvCbXYi2RODP7y7tUrq+1vVZ2LDpZ2GfHxwl8WzTXbiVWb6doTaveaMGO6QaQmUGstA2MYhxyptYeI52LIMMtYebql/DIBglIcwtfxmPF8b8QSs3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lc5/8NSkz8h+QToYpEfM66Qqg2Jb3ZfUv0Bf2MPs2WQ=;
 b=J0Rh1R4Zq0VMv7zZOjHZ08wklfg77LW+tZIibeR9JXyZWXfqKR74uqztwQulritLjZSN/o6W0CqwRvzZ+B6Q1R+xbVQxSTRhLnZdTrVgSC5u8L66EFhRVsnWA8jCG0VrYZg5cdMbIYQ7sAriVYPYp9Ggj/ldS+jVs9zEjJvXCACBSZLMx8ulDUeJfEU6wFVpi+SqgM1hIuUImeP3OoF+DKFeCLNj31txooz6Lph8glCyrzwpbj2XwyMtBfM3SPiSaja51XhBoy5xQPVm2287m16X6N4JE6XiihuJFvnp7nVYReB9wadDx1AMJd18MqxKB0AtyZ5fh1pxML1xk3XK4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc5/8NSkz8h+QToYpEfM66Qqg2Jb3ZfUv0Bf2MPs2WQ=;
 b=tPKE7w4Qb8mOOL8jXokvecK5GDWs8WaU3FDrhs/aHZGQ8RG60PFxtz+IkOKhfDXxBl7AQiePomlpA8dWUegVeeK7UXttCGbpiv0u/jK8z8NU0mroInc4OOjhOY4pDtaVngKYzQVRcvHoCE7nYmEr3Vuc8hYrtbCfPnKCwcpiM0AvtTiccdrfnArv4xC15sdIZHVib55ziqJvz24SW4gi3+UexV2K67hwk7hZjauGEwnOTd1W4AsFotiKlT9lotV9bbowy/JZWZMAG/IbvKkrlwdDRYk2ENVxYjwQ/wLsvBT8kAtGeEmUnxx5hjI2mFrsI+uwelDivGIaRni6fWS4NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by SA1PR12MB7295.namprd12.prod.outlook.com (2603:10b6:806:2b6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Fri, 4 Jul
 2025 04:54:15 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 04:54:15 +0000
Message-ID: <059f71ee-0fd8-4546-882c-73d0c1d031e2@nvidia.com>
Date: Thu, 3 Jul 2025 21:54:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/4] drm: define NVIDIA DRM format modifiers for GB20x
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: David Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
References: <20250703223658.1457-1-jajones@nvidia.com>
 <20250703223658.1457-5-jajones@nvidia.com>
 <CAOFGe95mU1P-BeMXM506Jmdr66b1poFyFquxQr_s9KoEDbqVcQ@mail.gmail.com>
Content-Language: en-US
From: James Jones <jajones@nvidia.com>
In-Reply-To: <CAOFGe95mU1P-BeMXM506Jmdr66b1poFyFquxQr_s9KoEDbqVcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::21) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|SA1PR12MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 1952d574-ba39-44ab-a21c-08ddbab6d351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU9EWmlETkNCcWdhUEgvTnhzaE1rNkpkM2tSMElsTjhhLzFXZU9sdFFXbmdy?=
 =?utf-8?B?MjJIaVFxdUF3N2NuRWZ6d1J1OU1aQ0xMaEwvLzZwajFHSnAyQjlFME4zSG9N?=
 =?utf-8?B?TkF2WlM4Y2UvSU44M3JPemU2ODVrNDU0UDFWdGo5NVpaSjRzUk05RGdyd2VQ?=
 =?utf-8?B?cUpTSG5FVUo5ZVRTZlE0MWFTWXY1bjYxZ2xnM2tTbjI2OXJHOGoxYTAvVCta?=
 =?utf-8?B?cXh0VzEva2JnT1dmT2hyTHJyTmN6Tit2L0NXUGlrWjErYUNva0pQZjE1NXZK?=
 =?utf-8?B?QUhOa3NER3RCcStDM0xoV2tmdjZ2d0xpbkNpT0hxOVdGWENvVk5jeThBU3BV?=
 =?utf-8?B?UU0rSFNacTJ3K3dUM0NTSjRmKzVQODFqcHoxeE9TNUJxckpFSHVDaHh1Wjh0?=
 =?utf-8?B?K1djMjVaUzhsK3dPWjlSQ3JadXVJMDFNK3BGUTNHcjFLOXdKWjA5UkdZRmoy?=
 =?utf-8?B?bHVwWFZGMlltN1pBejc0M2NTKzFjdVVWOWlxQi9vcHpSSmtTTG1TTzVZN3Rr?=
 =?utf-8?B?L3h3U01wZTczeG55TnB6b3VxRU12VzZSUlVDNVExY2dSVWJlY2MyRkh5VUow?=
 =?utf-8?B?KzlVL0k0cE1MZkd3UHJrOHVXOW9HSGxjcWxrOFFUVEUrcWNKbkhIZjUyS1pY?=
 =?utf-8?B?UDkxUVVyVUxlSWNkOE8vcGdMYmFkVThCN21ZVTJzVXZ1aTRseHl2UTJGMmhy?=
 =?utf-8?B?SnVYZWhSNTZEQnllVHFCRFI1Zm1CeUJvQ1B5eitDN2NrTk85VzAzbEVSWjE5?=
 =?utf-8?B?Nlp6NFhYYk9QWjA4NnNKTEJscFNyWVFpT3hJM2p4TlF2THVMamJDbEx4YnNY?=
 =?utf-8?B?Y3pRZjhVN3lyU3pQb2dCTFlhN2wweFIyeERwRDVxSlQ2a2d4ZmxGZ2RtSmN6?=
 =?utf-8?B?UzZEaU9QazBKNkVWVHNWLzBYVlgwZ2ttZkR5aEZjVkxkYmhUUG9JQzV5MHcv?=
 =?utf-8?B?YzNTK0N6QXFTWlZvNnpOUmt0dnRQQ0RtWFphNXEwRXNVNHFrUGdzSGdqZEd4?=
 =?utf-8?B?RHhlaFpSYU44T0lRc3M5NGRMbjh1aW1MVWlSYTcraEdYZFF5TjJLaG1saDR4?=
 =?utf-8?B?MTRGOEsxYW5zWXdEWU1QV1pZNTFRMEg5VjZyc1lpY2JrZWp6ZWFiTmk4MmhZ?=
 =?utf-8?B?R1Vwc3pxQnlLYmVxcGl5a3J2ckczdllCWFhld1hFMDc5b1dBZjJYQ0dURmVq?=
 =?utf-8?B?SWhUbThBSnMrS3pJK2RsYkMyNytVVkdETGtoSEJXM0t3dFdONDduWGt0YXhz?=
 =?utf-8?B?T2JERUhaZG1sNjQ4SDNzbWlFMHNaeFVKY0EzSjdDb0E2dTZYQ0IzUXc2M1FR?=
 =?utf-8?B?VXZtSllKcjZ5c0dIdDJzQ2RENmdsQ2RqSlFkdzBla2dFcUxMYStxS2FTRkZr?=
 =?utf-8?B?UldLb25nTEF3Y0pGU0xlN0gyWlV4K05ESXJxNDdoSUlteTd1MEJvUzlXSjlw?=
 =?utf-8?B?NlVTNUZkS0xJdkVDS1M2aXBZbTI0QjdyZnk2aTBsQ0w2OTcxQXMwOVF3d25W?=
 =?utf-8?B?cmN1QmZWdkhxMnpHcXhPT1hTVjJ4Syt1SEZOa2x6cWpmVXBJV1ZQemo5clhh?=
 =?utf-8?B?Q2RhY3lHU2I5YWxPSzN6N09odjdib1dTc29ZVEFTTmFQRVpIaDRacnRGZ2NM?=
 =?utf-8?B?NURiWHNNK0pwTXN1WDJ1cVJOU2ErQjEwcWQ1NHVrejl1empJSnllNmxrRVFS?=
 =?utf-8?B?MXM2SVpTMUoyWlFtd2JCelc0dHpwdDk5YzM5Wkx2U0dIaGxMb0VEZ1hHVzBy?=
 =?utf-8?B?U0tHaXR2S00wWk0ra3MweldHQmlSNU9tR0lrQlNlbnRuTkFuQVhrNC9vTWdo?=
 =?utf-8?B?d1JHQ1pHU0hzbXJqZW9HODgzSk1VbTlGWGZzeDVVRnU2T1Fmb1REOHhnTFV0?=
 =?utf-8?B?c3NGdk4vNGgrMzhIWVFWYXVod3F0Y1RPMS84SmZBdzcwUnI4M1hxS1ppUGsv?=
 =?utf-8?Q?Zbm6LR36ZpQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk0wa0FCS0JoWTl5M3EwS3poYlQ3ei9FcWtsMC9HTENuNEdpSlF1eEFLVmlR?=
 =?utf-8?B?MHVBUWFCcytXZjNtVURvNE1OemhsSHh4cmM2TDZUaTZvQmJ6Y0EyZW1PdGJM?=
 =?utf-8?B?UWpPcm1DZ2JEeCtsbXZhdllRZWJQU2NON0Z0VjJiZncyMGFnanNtbEs3S00w?=
 =?utf-8?B?M1BHYzNBSE1aaEhXeHExenU1U054dlorcTAvY3RYSEpBUEZSbDYyU1VWZldy?=
 =?utf-8?B?ZVJMcVg3eTcwdnhPK21ydzNjazhpSWFIY3dWcTBaNHErejlLUXJZYzIzYWVE?=
 =?utf-8?B?aytoSXZ0bjExYWhubGZwcVVGVjQrUmJJNWtxaHdkOHVBaEJoaEo4TkhhbERC?=
 =?utf-8?B?UzhSUUdkL0E4VElUTjBqT0szSnRwVGgzSlFwQnhDK3NadG40aVpleUxNcWZB?=
 =?utf-8?B?clN6clNOcmFrUURQcDNrdDlOZ055TVJtdS9heUZhc1NaTkkwVEpqZlRLaXNr?=
 =?utf-8?B?Q1JDNFRIZzJnTi8zcFhQMHl1aFo5ZE00RW10RkZwMWN5QTZidUlVemtqZ05M?=
 =?utf-8?B?STNvcFA3L2FOWEVKRWhXQ1RvZGRWbXNjd0dwb2Z2QVRnUVZwT2ZReFBNN21o?=
 =?utf-8?B?d2hWeGNFaFJXT0dtZXFtMVhUU3hJQXZzTmIydHBEbTVCVEhvOEJkQVJubk5k?=
 =?utf-8?B?dG5WOEZIcnh2eGcrU0llK3JNcEo3NVdCcWVITFRUbTRWZUZZMkJFYnFDR3Mz?=
 =?utf-8?B?UitKR0dPYUFZaWJoK3pUbnVrKzg3OWJpRG9nUkc0TURlZlhPV3d3N2poSElC?=
 =?utf-8?B?eGIyUGpiYzYzWHpoMXNlTzRDZE94YXZwNGw4NVhhc2I4bnc1VEswR1ZUZnh2?=
 =?utf-8?B?TkQ2Y0lSeUhLUTRhOXlQSnR3OGV0UEN4SDVRaEcyNjZDQmgweUFpSFJhMzFw?=
 =?utf-8?B?bzFPa1RWYXhTNDFsdTJUYVh3QlAwbzBWbDY5RnQzOTlwWTJkUWV1YVpqYUNs?=
 =?utf-8?B?UExVc0VGTThpVENta3JzQ0pNK3hzbWlNaWZFekpxaG0rZk1Banh1d0lrK1FM?=
 =?utf-8?B?TDBzV29jOCs1NDFFVVB4V0xFWjFIRFNIZS8zSGpBZHdRNDZxcTJLUVBTTEY4?=
 =?utf-8?B?aExEendEdTNLRVI0ZnE0QzBGK3pNQkROVTZ4WEZrV3lVRVdiMTBENjdvVitQ?=
 =?utf-8?B?WVNGNXN2UmxWejM3cjd2Mk05V1Zlb0JmSHhTd1ZuSzF4TzFndmpTYmtuYzZT?=
 =?utf-8?B?Wlk2MndvZkpmS05yREthSC9DVm5sQlR4NHZ3WmYxWGRoN2N0Mmk0Q044blF3?=
 =?utf-8?B?U1YwblpSZGw2ZkwzQTBFZytJWHlGeTVySEUxTDdaeFZGWTUvSHZPQWpQakdG?=
 =?utf-8?B?OXVYS2ZITzIxanFIbkpXNUZ3TEtVbUc2amtMTmF5YURNcVl5ZDBvbzNXWFZ4?=
 =?utf-8?B?ZG9QSEFLUlJwQ21FZG9uQ0FaK1h1aGdoWG1xRHJQTVVtL0xlZ0IxR3hEUlVt?=
 =?utf-8?B?aEh4dlRYT3VMN0YyTitVc09PL1ZWR214aXp4RU0xc2pucEFJUGVyT0lRSnF0?=
 =?utf-8?B?bHpaLzBOcW5qeit6empuajZYTWQzb283N1BVdXlrUkFWeXlKZFA0Q3REbGNu?=
 =?utf-8?B?RUFOb2JLRWRxLzRFVys5alNETVpnVUw0VnV4UnMrbnFsbmRjZWhTRmp3QUZI?=
 =?utf-8?B?R21scWVXVEhXNlV2aEdzMHp3d2ErZlFOeE4xMzB6SGdzeHdrditQVFBRMU5w?=
 =?utf-8?B?ejZwNG54OXRVWlAwZ2UxUWhyOEJmckYwZElQNkdPdm9PbUJlaU13QmlHTXho?=
 =?utf-8?B?OVkzeEZiTFZleVF4UW9TVU92Q3Y1dVBvR2hScGt0a0dua3EyWVpnL2ZVTzU2?=
 =?utf-8?B?RDd2bE5oaEg3bHp3NzhRS3AzdTN5eVNvSnhwaTVJVmRZaDIvci9ZT091ejdM?=
 =?utf-8?B?d0xMNTNSM2ZXU2xPbFVMVWFtSmowUkNFaU5JejhDcjk2ay9INDVscjk1NTNW?=
 =?utf-8?B?TFAzWGhPU0U3ejFCM25EYUdnTEVJNVFFMnlZQkd0L0hIM3RUT0FzRWtpdWR6?=
 =?utf-8?B?VnFVcU5NWUY0L3J2UllZd20raklJcTVCMEEvWCtKS3NUUWRya0xoNzhHd0cr?=
 =?utf-8?B?YXVvS2c4c2dGVHVuZGY1eXFRUUdURG83WVVBV3NRc2dib2tMeld5ZUZsSUY2?=
 =?utf-8?Q?r/RuxhHI/ufYBig2/cF1OSm+l?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1952d574-ba39-44ab-a21c-08ddbab6d351
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 04:54:15.0069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/s9LYNbdHnLtvfszGmXTaRmUZzJfKK1eBVbxCDCYd7nZcxN0++hUTjLb5IwtxmDBkZpQbpITM3cwBocrfXwjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7295
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

On 7/3/25 16:22, Faith Ekstrand wrote:
> On Thu, Jul 3, 2025 at 6:34 PM James Jones <jajones@nvidia.com 
> <mailto:jajones@nvidia.com>> wrote:
> 
>     The layout of bits within the individual tiles
>     (referred to as sectors in the
>     DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)
>     changed for some formats starting in Blackwell 2
>     GPUs. To denote the difference, extend the sector
>     field in the parametric format modifier definition
>     used to generate modifier values for NVIDIA
>     hardware.
> 
>     Without this change, it would be impossible to
>     differentiate the two layouts based on modifiers,
>     and as a result software could attempt to share
>     surfaces directly between pre-GB20x and GB20x
>     cards, resulting in corruption when the surface
>     was accessed on one of the GPUs after being
>     populated with content by the other.
> 
>     Of note: This change causes the
>     DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to
>     evaluate its "s" parameter twice, with the side
>     effects that entails. I surveyed all usage of the
>     modifier in the kernel and Mesa code, and that
>     does not appear to be problematic in any current
>     usage, but I thought it was worth calling out.
> 
>     Signed-off-by: James Jones <jajones@nvidia.com
>     <mailto:jajones@nvidia.com>>
>     ---
>       include/uapi/drm/drm_fourcc.h | 46 +++++++++++++++++++++--------------
>       1 file changed, 28 insertions(+), 18 deletions(-)
> 
>     diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/
>     drm_fourcc.h
>     index 052e5fdd1d3b..348b2f1c1cb7 100644
>     --- a/include/uapi/drm/drm_fourcc.h
>     +++ b/include/uapi/drm/drm_fourcc.h
>     @@ -909,8 +909,10 @@ extern "C" {
>       #define __fourcc_mod_nvidia_pkind_shift 12
>       #define __fourcc_mod_nvidia_kgen_mask 0x3ULL
>       #define __fourcc_mod_nvidia_kgen_shift 20
>     -#define __fourcc_mod_nvidia_slayout_mask 0x1ULL
>     -#define __fourcc_mod_nvidia_slayout_shift 22
>     +#define __fourcc_mod_nvidia_slayout_low_mask 0x1ULL
>     +#define __fourcc_mod_nvidia_slayout_low_shift 22
>     +#define __fourcc_mod_nvidia_slayout_high_mask 0x2ULL
>     +#define __fourcc_mod_nvidia_slayout_high_shift 25
>       #define __fourcc_mod_nvidia_comp_mask 0x7ULL
>       #define __fourcc_mod_nvidia_comp_shift 23
> 
>     @@ -973,14 +975,16 @@ extern "C" {
>        *               2 = Gob Height 8, Turing+ Page Kind mapping
>        *               3 = Reserved for future use.
>        *
>     - * 22:22 s     Sector layout.  On Tegra GPUs prior to Xavier, there
>     is a further
>     - *             bit remapping step that occurs at an even lower
>     level than the
>     - *             page kind and block linear swizzles.  This causes
>     the layout of
>     - *             surfaces mapped in those SOC's GPUs to be
>     incompatible with the
>     - *             equivalent mapping on other GPUs in the same system.
>     + * 22:22 s     Sector layout.  There is a further bit remapping
>     step that occurs
>     + * 26:26       at an even lower level than the page kind and block
>     linear
>     + *             swizzles.  This causes the bit arrangement of
>     surfaces in memory
>     + *             to differ subtly, and prevents direct sharing of
>     surfaces between
>     + *             GPUs with different layouts.
>        *
>     - *               0 = Tegra K1 - Tegra Parker/TX2 Layout.
>     - *               1 = Desktop GPU and Tegra Xavier+ Layout
>     + *               0 = Tegra K1 - Tegra Parker/TX2 Layout
>     + *               1 = Pre-GB20x, Tegra Xavier-Orin, GB10 Layout
>     + *               2 = GB20x(Blackwell 2)+ Layout for some pixel/
>     texel sizes
> 
> 
> I'm not sure I like just lumping all of blackwell together. Blackwell is 
> the same as Turing for 32, 64, and 128-bit formats. It's only different 
> on 8 and 16 and those aren't the same. The way we modeled this for NVK 
> is to have Turing, Blackwell8Bit, and Blackwell16Bit GOBTypes. I think 
> I'd prefer the modifiers take a similar form.
> 
> Technically, this isn't strictly necessary as there is always a format 
> and formats with different element sizes aren't compatible so a driver 
> can always look at format+modifier.  However, it is a better model of 
> the hardware.

Yeah, my thinking was drivers would only use sector layout 2 for those 8 
and 16-bit formats, and still return sector layout 1 modifiers for other 
formats, so I think we're in agreement there. I could update the comment 
to make that clearer.

You also want one sector layout for 8-bit and one for 16-bit (E.g., 2 == 
GB20x 8-bit and 3 == GB20x 16-bit)? I guess there are some cases where 
that would be useful. I just hate to burn extra values, but I don't feel 
strongly. I'll add that in the next iteration if no one objects.

Whatever design we settle on, I think it should be a goal to allow 
pre-GB20x cards to continue sharing e.g., 32-bit surfaces directly with 
GB20x cards. Some users are going to want to mix cards like that at some 
point.

Thanks,
-James

> ~Faith Ekstrand
> 
>     + *               3 = reserved for future use.
>        *
>        * 25:23 c     Lossless Framebuffer Compression type.
>        *
>     @@ -995,7 +999,7 @@ extern "C" {
>        *               6 = Reserved for future use
>        *               7 = Reserved for future use
>        *
>     - * 55:26 -     Reserved for future use.  Must be zero.
>     + * 55:27 -     Reserved for future use.  Must be zero.
>        */
>       #define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(c, s, g, k, h) \
>              fourcc_mod_code(NVIDIA, \
>     @@ -1006,8 +1010,10 @@ extern "C" {
>                                __fourcc_mod_nvidia_pkind_shift) | \
>                               (((g) & __fourcc_mod_nvidia_kgen_mask) << \
>                                __fourcc_mod_nvidia_kgen_shift) | \
>     -                        (((s) & __fourcc_mod_nvidia_slayout_mask) << \
>     -                         __fourcc_mod_nvidia_slayout_shift) | \
>     +                        (((s) &
>     __fourcc_mod_nvidia_slayout_low_mask) << \
>     +                         __fourcc_mod_nvidia_slayout_low_shift) | \
>     +                        (((s) &
>     __fourcc_mod_nvidia_slayout_high_mask) << \
>     +                         __fourcc_mod_nvidia_slayout_high_shift) | \
>                               (((c) & __fourcc_mod_nvidia_comp_mask) << \
>                                __fourcc_mod_nvidia_comp_shift)))
> 
>     @@ -1037,12 +1043,6 @@ __DRM_FOURCC_MKNVHELPER_FUNC(pkind)
>        */
>       __DRM_FOURCC_MKNVHELPER_FUNC(kgen)
> 
>     -/*
>     - * Get the sector layout specified by mod:
>     - * static inline __u64 drm_fourcc_nvidia_format_mod_slayout(__u64 mod)
>     - */
>     -__DRM_FOURCC_MKNVHELPER_FUNC(slayout)
>     -
>       /*
>        * Get the lossless framebuffer compression specified by mod:
>        * static inline __u64 drm_fourcc_nvidia_format_mod_kgen(__u64 mod)
>     @@ -1051,6 +1051,16 @@ __DRM_FOURCC_MKNVHELPER_FUNC(comp)
> 
>       #undef __DRM_FOURCC_MKNVHELPER_FUNC
> 
>     +/* Get the sector layout specified by mod: */
>     +static inline __u64
>     +drm_fourcc_nvidia_format_mod_slayout(__u64 mod)
>     +{
>     +       return ((mod >> __fourcc_mod_nvidia_slayout_low_shift) &
>     +               __fourcc_mod_nvidia_slayout_low_mask) |
>     +               ((mod >> __fourcc_mod_nvidia_slayout_high_shift) &
>     +                __fourcc_mod_nvidia_slayout_high_mask);
>     +}
>     +
>       /* To grandfather in prior block linear format modifiers to the
>     above layout,
>        * the page kind "0", which corresponds to "pitch/linear" and
>     hence is unusable
>        * with block-linear layouts, is remapped within drivers to the
>     value 0xfe,
>     -- 
>     2.49.0
> 

