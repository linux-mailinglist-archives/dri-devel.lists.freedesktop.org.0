Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF2B06B3A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 03:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D8210E731;
	Wed, 16 Jul 2025 01:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TAWK7faK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEEC10E731;
 Wed, 16 Jul 2025 01:40:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtW5HgrYLX5xvtn+XfgVAamvmrC39/46lg7ElpoigFCZnnhIQS5+l0ePC1BGcxVfB4xdfsZXcCdB9USgHuyZ0/pRR9/SrWU7XP6dHMWhgqJ2zhl1wY13+lBhCh6+VWVJZVhFpHsgDilYOemA0NHTu/DHXlqD6zlEkbFmm64Jt/Gd1/HuN0OWRWBWcVVv0Oktn+BqKpwPRDLN1eDAI3q6ZNlVk4PHZTtWdFK4zagLHAFZEgMHffoB4Ghlis2rOTUrVBncYfFCb5ZcWmcbRWZZY4DbTXnO1XgpQY7Kwid+yKWE8mjHtRkn+QCuUencjQJRpDyghkxW1KFW9k0SjBHPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0FRqqoJXIDTPUhfozRz3YYuIWBCQCD5idq/+yN7zuM=;
 b=Uyz1ukrzsVvXjNt1oBxfIq2T97cK49d2DrIOelCj+qrAvsN9E0v9pu3NLXUgOJVXvm/T71+zabSPhCdKchyFy5MvMIGO5okE88h6i5TiioXCvn9uIhS0gmtbgzByKWQzSDvTiwPJ4yeqnTDfptmXgoMMRv7vsEiiXHea99IX31kV91ttdaAZadn4uK9DPECTHHoNuzH9cKFChlkwlDm8Xbq2D3ldGGGgnI83ZG5EdvLQ1WMODcWV4Sa1Ka9CoTRydj8RDGhwCOvCTmy8xq+UlOK2OugKEka6P4roxmvD2vhnYuhKCjfOQMoZLUyWfH7zVyZwTf9JhfGD2op663WF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0FRqqoJXIDTPUhfozRz3YYuIWBCQCD5idq/+yN7zuM=;
 b=TAWK7faK0keNOP5FKfO3687Nk4qgLD3tq4c3ap2bu9DOTmt4Cpron90yXCXK9AdeubFq7i6xLmNLphvXTSimXk3xjEuWmrrapm57fxAeg55+5KmeFCsJ/IqQ5TUEvQiqqNZ73Mx5AWH6HcIBobpLwTRkzy831FRuh+1Nmd7e0V3FElsmOaCyezIN2S8EnrLdLmnyxeUmryRW82REN8TOQEOSJ5ofwGwMyGnKIgsVqCbDRvdxKx9eoflqDoYr24m+xq4raFpyABG02vhfnfBKVLKKDzbB/9t2gP6V0W1h6WAZ3SarmJfYseIM0mHJlcjfvPM7dAlfvYKPi08TbO8pDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB5795.namprd12.prod.outlook.com (2603:10b6:8:62::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.32; Wed, 16 Jul 2025 01:40:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Wed, 16 Jul 2025
 01:40:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2025 10:40:47 +0900
Message-Id: <DBD3I0RWQ39M.XA1Q0WSOJWSE@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: vbios: split out PmuLookupTableHeader
 from PmuLookupTable
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Rhys Lloyd" <krakow20@gmail.com>, <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250714104322.100511-1-krakow20@gmail.com>
 <20250714104322.100511-2-krakow20@gmail.com>
In-Reply-To: <20250714104322.100511-2-krakow20@gmail.com>
X-ClientProxiedBy: TY2PR0101CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB5795:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5b7671-5cc5-4cee-1210-08ddc409cc1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V05HbTZrZmVsZ3lneW55Snl1aFNhekZLOVFId1VBRVZ2RmdoVzdScFJBc09X?=
 =?utf-8?B?dWJRYXdjTUNRRUNnZHpCeVNoWUM4T0J1bVlvZ3FXQlZwb3RLNUpIcHFWNmJN?=
 =?utf-8?B?ektGbDVwK0ZQMVlTKzRGOStRUUg3R1BWbmppbHZGaTUzU083WjFTZWJFVnNF?=
 =?utf-8?B?KzdYL1NodUJyWmMrRkhzTkJ4TllPcktJVkUxU1RTbmF5NHVjbnQweTBkRUtL?=
 =?utf-8?B?UVJZU1BoWSt1YlVaY1RVRGJWS1AzbGxLeWZDejFBZkNnNHFFL1RNTTdzY2Vk?=
 =?utf-8?B?YVpibkhGWXRPa2R4a09MNW5sUitPejVhem1QWndhT1dBTVFjVVBBOU5FdlJH?=
 =?utf-8?B?VVFaSzhmbm9aNlRUTEVOQzlLZ1BBajdlOE9acXgxaXFJUFIxaWhaSzlHcmxW?=
 =?utf-8?B?WHFCQzhrMlVVNE9id1VhMFFmUjBzMERTVzB4ckpKcnlBSVN4SXNkNWFPdGZ6?=
 =?utf-8?B?Z0pGcDZDZGFUMkxIdzllQkRvLy92NXZrWDFtOFdiemFWVC9MaWU4d1NVYXNL?=
 =?utf-8?B?a3pORjVaOHVKRE9jUmZJMkZWaUFRa3VOMHkxVzN4dUVtZ3crTHhlQzNXU1hZ?=
 =?utf-8?B?MUdrbjcwYVpHbzZUZzFySGYySU9NNXpWcUZhVjJDc0NjTUI5Sno2YjZnK1lH?=
 =?utf-8?B?SC9VVSs4ekVxdy9NVkVydFdTdnp5MEJNcDg0dkVHS0ZxVnB2YjMyM0tKcXFo?=
 =?utf-8?B?VW9vWkpqclRTR3JEN20rbkZYbEhEcUhZRVgwR2JDZmFRbHBORGxHZ3BnMk9O?=
 =?utf-8?B?RjhmQjdrQTc5blQwV2F3RWtqdTU4YUVibGJIaXptREdKcytSNlZWWjQ5Qkk1?=
 =?utf-8?B?TXA5bWVHbUF4Y2V6aHlBTkFYTE50dlJlL3p4Nnh1YU1meEdpL1FzOWNWays5?=
 =?utf-8?B?b0hhQ2xONHc1eEtHWTVjMjJFblduWDh0QVo4QXY4TnllNnMzM3lIYjZ4OVR6?=
 =?utf-8?B?Y2tzMmljVEhNbzVVQVFsUHpwNWk5TFJRK1JwMGwyUE8vcUhlRGFjd2JibzBs?=
 =?utf-8?B?dEMxWWhuQXgvZ2FPbXYrRzlPcDNjUFVBMk81YjdUSXNDZHNDMXVTaVo5SHJT?=
 =?utf-8?B?MXprYTFhV1lEU0JqcHU3NWo2Z3p1KzhmOEd0c3ViM0k2RnBOWGFTVjd1aFpx?=
 =?utf-8?B?SlJKSmxwVGdOOUNlWHJGSlF0VVBlWWthbkthWG1nc2llZjhCakVRKytQTW94?=
 =?utf-8?B?L3RMWFJsd3ZSaVp5VVBGWDB0ZWI1ZXhtUjk0MS9KVFZLbVJmNzMzdU80TlRT?=
 =?utf-8?B?Tjk5WDRwSHZMNlU0RmU1Si9RYXBZZ3NxU3RISFhwcFBXOE5NNmc1NFl3Smds?=
 =?utf-8?B?ZVljQXo2dS9SMndOUnpiOFZ1NDBzNTJ3OGVuSzhYdytscytUTHVVSlNnbk5Y?=
 =?utf-8?B?VHBmR1czc3B4R0lkSDk2Q0FoblkwQVZqSE1DN053ZndSaEk5ZmJBN2VXNFR5?=
 =?utf-8?B?V1A4SUxjZ0Erc05BSENicHdPTVNFeGpocnBxeUNZd3NXY1hSQTNBWjAyalhK?=
 =?utf-8?B?RVplRXc0em52Y241UkRTRlpYV3ZFQ3huR25LNUJxS2tTR1R4c1pJREdiOGlw?=
 =?utf-8?B?Ym1nT1lueklNMVhxUWEzVi9YUlhUOU5lL3pQRlZ0dUpQZmc3NHMwZDY1U2kw?=
 =?utf-8?B?d005QW16WVFXQTU2MkRocDlxRWJEdFBYOE9QTStQZ3l1My9LZ1I2eGxqWUF5?=
 =?utf-8?B?NDQzeW9zT3UyVE9GQ0pRSS9WWVhFSUdzOE1SUVZGNmZ4eHRQczVPb1M0WjV2?=
 =?utf-8?B?MmdTYkJpVzlLZFFJd0NGUzNlek5qMmx3VUFINHhLQUcxcWtkdjlqbk41YUln?=
 =?utf-8?B?dnF1bmNFZnFkME42THI4VHRNSlJhR3JJWVhQZEJEcnJLWjJVOGtKeG5kQnZU?=
 =?utf-8?B?MWQ2NngrVldiUEFkWUtIdld5S0gxRFZDMUhJa1Y5ZDdwQ0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzVGQm4wWkRTa3RrdGdwd2hYQ1hXOFBWcTIwYzV4S0htSmZXbjN1UTg3a0RD?=
 =?utf-8?B?ZHR3WHFzd01NNE1JL2pnZmxacngwTnpDeGlNRmpvcUtJUTVwZ1ZZVTZRY0E5?=
 =?utf-8?B?RW1NMUNpeHordjhqRzd4RVpzZUZYeGpjSGNTQVVLUXdDdmdpVTVIQWRQUEo3?=
 =?utf-8?B?WmpXUTVKZllkRzFSd0M1ZUFkZkFSMURHMVd2S2IxTkdxaXFQWVVKYTNPWGMy?=
 =?utf-8?B?dTVaOGFnTzdpeUtjaG9oQmo0ZXJzN1c5a1VqOXNDeHEyUkJDWFd0Z3FWWmlC?=
 =?utf-8?B?a0NQZm02WklzNW4zT2thVmhIL24zZ2gvcWdJQ1BUeFRveG00MFJOQUd1WHFZ?=
 =?utf-8?B?a1NySkhhOC9MVFZDNUdsb0lwcHZsQ2lTK29WNFhsRktEMWh1OTRvejdwT0Y3?=
 =?utf-8?B?SlJyRVhTUG1mbW8xTmNHcTBoSTMwV3VtV0NvUFVyRE5pTURlaDFORkU5R0la?=
 =?utf-8?B?by9WaWZ0bHFwZDRkSG1ZUVV3RmxLTGt4Y3RPWmE2OHlnRXpIbU5vL08rU1Nw?=
 =?utf-8?B?UkdhY091OE1NdkJZcjE4VHBwWDc1QmpzOG8wN0YvUGdIQVhZaWFWY3FFWk5B?=
 =?utf-8?B?dkIwL1VvQjlIN1R1ak9oVUs4bmlrR1cxNVBmUThZRTFDVS94V1hRWitzdVhK?=
 =?utf-8?B?US9RVXNiZ0l6cFlxRXkwNWZ4TlhjYWNOWlBJUmVic1dXRnRNS2FnZ3ZNQ0Vj?=
 =?utf-8?B?NEZOSjhVNWk5N0RPTk8yc25LeUt6L3JKdFVoTC91ZFF3WkVCSkVYdVRncXJy?=
 =?utf-8?B?QUZ5RWxSb1oxbHhqOEtDUGJ4djJlU01xUksySzlUb3hMQm93VHI4V3pCa1Ro?=
 =?utf-8?B?ZXNWeEluWDNpREZXSnl6N2g5c3NWTW1XT2Y3UFF6V3p0UWJZc0lRZDYwK0Fs?=
 =?utf-8?B?WFI0dzF3OHl6b2F3dHNhV1F4dmpaNVpFUXZZdUdETmJXWnlUYlNKT2sydXZj?=
 =?utf-8?B?a2M0Rnh3OHRrc3lHaXJtRklSdWYyVXV6aGx2VDRJTEFvNFhSUWh4UVBZd0Yr?=
 =?utf-8?B?WkVlQ1NYYVhORlZDL0lBZ3BuemxiSEVlTVVHWEc2WXgvckkzU09iUUN3RHV3?=
 =?utf-8?B?OUJiNTBYQzRrMldkd1JyWUV6TUxqWGZJUTV3aStwNGdWdERsSmlONlRXNzJs?=
 =?utf-8?B?Z2JTZ3NJTWVWT3pVRTQ1NGx4U3VmWEp4TmhQcmJrSzJWT0M0c1ZuaWg0Ylc0?=
 =?utf-8?B?bGxiOU1weWx1WEFJUXJUN3pGK2cwcHN4a0ZTeGlHR1pCRjA2MHR0R3g2VXNJ?=
 =?utf-8?B?MGloWndzVWRhM1Z2ekhuL3RRcDlwR01HSlJPUnhWTE5Vd2dic200UXpvR3p4?=
 =?utf-8?B?RWoxQmIyc2ZjTGd4TFdwSVBiWkNLRjZHYVJMK0I0Q2plTC9FMmFXYllCVHFl?=
 =?utf-8?B?MHJ1OGJyMHlKMytJbDkxQWVSOUZzSFVpUTI5R0N1UFNXdzRoazNPaGpzYk5t?=
 =?utf-8?B?OW5PRHlMYkdONnZVdjh6V2V3Q1czdlVUcXJLczRkRW8wWGhFUSsvZi8vTU5J?=
 =?utf-8?B?b3JQSVBsb1kxeUhVSGF3UGRHaFVLazhXdWhQR1I0WVhrcjdGTnlwcXJBSHYz?=
 =?utf-8?B?TEVYOGwvTlhRTGtuZzY1L2ZiNmpteHpjZWxadnFIQnBuVU5BNFAwWmJ6QytH?=
 =?utf-8?B?ekFRVk5yaHA0Zm9IS0RPWlNnTVhqSGtVRVJOZUV0eGFKSEswM2UvNGZKNml3?=
 =?utf-8?B?aDQrRC9wT2ZpcVhTWC83bEdVbHJTMkcvS3V1UmFXcmxlUWxRaE1FeGJTQndO?=
 =?utf-8?B?TDE5OFhkcCttU25xYzhEUTJHdnRwK0FhTDlnWXZhTkFhdDFZOHB1WHVQcHF1?=
 =?utf-8?B?Y3prVWhPYTV6b1NmL3Y3SVR0dWc2U1hBT2E4T1VFV2I0WWJCWDVmakR3Rkkx?=
 =?utf-8?B?Skx6TGptVi9IVHEvM1JicTlNeWRoOFpEVHNsT3U1MHQzMDNTSW8zYVQrRkJW?=
 =?utf-8?B?V1lkeS9sMFhFWGI0ZnlBaG9tL3ZvSTBqb1RBZHFpN0M3c2p4S1NIc29xcy9M?=
 =?utf-8?B?eldYSnpqdHFhdTE2SFB4Y3dWbnRweG9xTTNUR2V3WDZROE9HTjUwcDZ3eS91?=
 =?utf-8?B?d1VlSncxNXdGN3lQNWI4NWpLa2Zlb0FSeG10b2JVSWZRbmV3UG1rRVpXR1l4?=
 =?utf-8?B?Unc3NWttMFhxWkhCM3pCaVBicjhFZnJrS1NKMDlzMVYxNnVOdzJ5MmlER3cr?=
 =?utf-8?Q?HVZW3wOhIhfblDBS/k7Lp5C5EsmwoVxgAkXJDlZmBP2s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5b7671-5cc5-4cee-1210-08ddc409cc1e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 01:40:51.6720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sk0fod9qa6ADNnfuEbc6IpfKK3ifGvCnmWSP3gpWth/7Xwr+PhvwEGM2kVbJI9jv0gv+8E3k0j41Bve0gBNSSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5795
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

On Mon Jul 14, 2025 at 7:43 PM JST, Rhys Lloyd wrote:
> Separating the header allows the use of `size_of::<PmuLookupTableHeader>(=
)`
> instead of the magic number 4.
>
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
> ---
>  drivers/gpu/nova-core/vbios.rs | 56 +++++++++++++++++++++-------------
>  1 file changed, 35 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index 663fc50e8b66..20011c5c9bbc 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -889,6 +889,32 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
>      }
>  }
> =20
> +/// The [`PmuLookupTableHeader`] structure is header information for [`P=
muLookupTable`].
> +///
> +/// See the [`PmuLookupTable`] description for more information.
> +#[expect(dead_code)]
> +struct PmuLookupTableHeader {
> +    version: u8,
> +    header_len: u8,
> +    entry_len: u8,
> +    entry_count: u8,
> +}
> +
> +impl PmuLookupTableHeader {

Can you add a=20

  // TODO[TRSM]: use FromBytes::from_bytes when it becomes available.

as ultimately that's what we want to do.

(we are using these markers to keep track of tasks to complete as Rust
features land, see Documentation/gpu/nova/core/todo.rst)

> +    fn new(data: &[u8]) -> Result<Self> {
> +        if data.len() < core::mem::size_of::<Self>() {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(PmuLookupTableHeader {
> +            version: data[0],

How about making `PmuLookupTableHeader` `#[repr(C)]` and using
`offset_of!`? This will also set the stage for the transition to using
`FromBytes::from_bytes`.

