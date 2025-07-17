Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E38B0843A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 07:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709F410E2E5;
	Thu, 17 Jul 2025 05:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ao6C1vaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD27410E154;
 Thu, 17 Jul 2025 05:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3RjmrBVT/7DAOiYEFx0qBUv86NZaESlI4fpM5/W0IBYUnEWLSqSnhkbl62r8H/Ga549TCUyW/XQuiLrbqkqdqlInsIFPww/19wmz7arrXqXzNH/ZGIEFOc3iuBU1ASv9bnv6iYMwGB/bD2AF1+JvFqNbXrZVunNqMCVYkcZlqT6wyry2bumYZpE+8Z9AYhU6Z4sNX+GzoGmyAwMfL3rbZgy5rDW5Qza0e+L8dsidUTIvFbmxfMtx8W8CJKCUne04vyRxgL1rQw1s3xkU1p2/e01A3MSKz0/dE470PgSft7eIp6euOv9Lz/O1fKKrAPh/zOLoHh2V4xO8rXqoCC0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfAtTLcbnCGHt7NjPUEq04mrQGDnDnTNyEdpzoXi7i4=;
 b=gN5zBwL5I/IKjmrbPcN2rnYCKIf/1gRY/Wre8MF2DrUzzqIa5ye7oPm8fAiZPSm2hZIthBnALhj6/vYr79S6SP6p12vcfBks40LCJdR4b4SldhX5nW+aBUNPNRadyjLoqifLJjfusUw+kLAJO3LU2hGP1EiTYHldnEeOnOL7RjeXXa+rSi4xRB6GGFulUpXKjdz0q2az+LcaH9caHeLZw4CbISuXUnsbYxoPWNTbLYHp9kcZR4coOrFosCbHY4uuqniHi/xjJzbISM/UuHvc4I8shvkkW1RSR3KGUh2T134Dc/uIEt2yEw4LfCOREgs3MJrzibGlBSTmdCDS307X1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfAtTLcbnCGHt7NjPUEq04mrQGDnDnTNyEdpzoXi7i4=;
 b=ao6C1vaRLzmNVHfTQayRyvhAjfYEbJel+RHV6SaS8qrPX2ZIs6qCtxbSnMcqvUwILuOIStW6nRn2MJtPYNL8Ek5TyYcdi3dwEI8e990BOXTqbcMUiRrljjLLfp8fwoxKvbnb3IW9KrsctJG6MR3E2+l6oaE4t3fZrCiJ+oP+yVHrKCuHDNYE051TgPtg3kit0ujZBQdY/suf7oHWKtJOv+miCV+hNJuR3HodXHvQ0haJXxopU/lJM6YFXMWT/HOpkFDS7TWmEs7vvX1PG13UfsN2JAWkUtwOE+aouRG7+4ZS/tmeP68yz+8ISIS1zGbfOKQb3SEUKpG7La5/l0e6pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS5PPF7B9F1F8E0.namprd12.prod.outlook.com (2603:10b6:f:fc00::656)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 17 Jul
 2025 05:15:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 05:15:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 14:15:42 +0900
Message-Id: <DBE2P44O4NLZ.5IZ298IF5NUR@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Rhys Lloyd" <krakow20@gmail.com>, <dakr@kernel.org>
Cc: <airlied@gmail.com>, <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix bounds check in
 PmuLookupTableEntry::new
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713025108.9364-2-krakow20@gmail.com>
In-Reply-To: <20250713025108.9364-2-krakow20@gmail.com>
X-ClientProxiedBy: TYCPR01CA0062.jpnprd01.prod.outlook.com
 (2603:1096:405:2::26) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS5PPF7B9F1F8E0:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e07503b-6e27-4d56-dee9-08ddc4f0fcb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TSt2UVA4R1lRYnBqMVpKeFRlYU10UE5WNmVOd2NiRjJWMXEySStyVmdPRm5i?=
 =?utf-8?B?V0ZKT05BaGwwdzcyaGFJdmJYNWlXUWZjZDJQRHlBUHpDR3NYV1E3aXg5QTBx?=
 =?utf-8?B?NDdZdWJxQkg2NUhvODhwSG5QZ09TaFNST1V6QWRSRGhwUENxRHNBV200OXNE?=
 =?utf-8?B?am1wcklZMWtuOFBhaHdJNUw0Ulo0ODNyODQreUpMT0kwcEdOV0Q0d0dIbVBh?=
 =?utf-8?B?SFYvVjhQUTdFS2NkU3RWVldJK2NoN0FYTTM3djBGWFdZWkpuQXp4elB4R1Mr?=
 =?utf-8?B?OXIxUkhydCs3NDZ3SGhndlFCUlpnZnpUU2FaUStuK0RvWlduSU5wNm1VQVhq?=
 =?utf-8?B?dERBTFVkUDA5TlJBVm02VzAzUThsMzZ3MHJFMmQ4c2IwWkw2UDFLVVNxcnhm?=
 =?utf-8?B?YzNPY0pST0ZoczVtWmFoVzVxaGVlYzcyaVRWb3BCV3ZRbDA0UXlOZnBFenJq?=
 =?utf-8?B?akV1cG1xSy9GVnh0SThYdlE3Z0ZoNTEwTHNjbDFQa0dUT3BZS3AyZW02WEFa?=
 =?utf-8?B?NkgzTkM3WVRrZ1JvcEVtekdOUXB6UHhrWnFZekJxL3FJTzdwcFlJVldLcHUr?=
 =?utf-8?B?TXFHMEFEVEVoc04vNGpLaUdIaEUzbC9pcE1HUTRsN2N6dHNJeVBjbGxvdUdD?=
 =?utf-8?B?N2QySGpsbVBsb3pwdXBuT0tBeU8vc0x6R1lwZDBLajk5Ymw4aGFRTjlzNzV2?=
 =?utf-8?B?WWw1bXFaa3oyMzcrU1UwRFUvWUpMZzdwL2VmYlNtdm1ISEJpVW90L01kS2wv?=
 =?utf-8?B?b0ROTm92eHNnZlVCVnpXbFpXRTlxVytQUEM0Q3FlOGdGQlNIVEptMnluU2pn?=
 =?utf-8?B?dnhCRndKYzhXM0FYTkZxb2M5ejZFLzBmWGUvMUo0QzhIMDQ1RndaTlBZYmNI?=
 =?utf-8?B?MmxLQjNGUFVRanBEclJ1OFVQNTZVQWZVUk1rQ3VNWVBkWFF3bm9hclJYa3dN?=
 =?utf-8?B?cjVIZVpCZW8wYUdpcnV1UWh5NytkVWl0eDV3UU00K2JIc2RNR3JraE1PYVFv?=
 =?utf-8?B?ZCtvd2Q0Ujdlb1d5bmQwWWhHNTVrNWtGd3AweTRSeGRvRkMxbjIxWTF5R2ZW?=
 =?utf-8?B?ZDNaSFNuTWkwYmI4d3psTENtQ1lLeUdsekxkTHlqR2pRZ1NJWG42M0taVVBk?=
 =?utf-8?B?bk5IQ1V5TmpSRDBCZC93VGI4NFNVOTh5K1RVZllTY0N1QzFOdTBsVlZXQ2dQ?=
 =?utf-8?B?ZVZHWXRoWEFhaVd2eTNMUUp4UTlKUFk1ZXV0SkdOUjhKT3BZRnA3aEhPN0tY?=
 =?utf-8?B?V3NyMnpJazF4TnFRemZGNTE0VmhxaWxzQmlUSTdtdjRDeXA0NTlUcmNab24z?=
 =?utf-8?B?K0xjTnV6RklTRTdwSG9IME1BWnRWRUhoVUlwTFhROGFyejlIRTVER1Z0ZENO?=
 =?utf-8?B?dk1xK0QzTEt5VG9ERnljNnk3Ym9oa3pJU1duaHgzcWM2Q1RiMGp6NnBHdHVF?=
 =?utf-8?B?ZWhKVHJURmRmTFdFZjFIVVJ0a252MCtLdklndnBSMmN1bHp5K1RHci9TaVRa?=
 =?utf-8?B?SFdnU3hLOWs0dHE5WEVUTjRNcDB5dXNRRWh4UUVHU0pDVENLTllDRVMzR0pF?=
 =?utf-8?B?cnYyRTdpOFh1TnRDL3RjbTBFYVQyZlE1cDR2eDRWU0tPWGgxQnMvdVRGK2tY?=
 =?utf-8?B?WEJ3NDNkVzI3WjBGQ2J4a2JxYVREa1Q0eUlQekpRcVJ4Q0ltK0hBK1dlYTYr?=
 =?utf-8?B?RVh0NzA3OFdEcWlidkRabm00TDZHTVBOTUZXbnp2TmlqR2VHRDVZb2ZDU0xX?=
 =?utf-8?B?WDZJcEVtSFp3TWNWd2hQUm4rcUFnb09uN0hwSUk0Z1ZrUlBNVzkxLzQwMWli?=
 =?utf-8?B?M2JubWY3azVQK1BpeHRpbDRLWEJFQzJObnd2MG9EcEVxUXJvZy9UMUJGZzJ0?=
 =?utf-8?B?NW80bUMyRjZ0NDR3V2dKT3l3N0lla0JXb1RLQTJ6alo2aWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGdyVWxKaDl6ZUVvenRLWW1UaWdsWm5tT0lpL2l3YlBYY2hiS2gzV211M1do?=
 =?utf-8?B?eDJCeXl6eW84M2ZEQ3A5OUtrWDMzV3hueDBGMzRTZXdxWitMb2dyamJiTExZ?=
 =?utf-8?B?M3VtTWJJRndWYmVDdUxXWGR4V1BrbzZtamE3L3VIMDNGUytaOXl6SVhLdnlr?=
 =?utf-8?B?ZVVVTkU1MG54V1owaVlEMEltdlMvU2RyMlV3eUhtc2t6dnIrREl1Q21YZGVG?=
 =?utf-8?B?NGx3TjhVMjRJUjU5U2YxazdrNytXMXE5TE44T0xzSnYrK21BMTFnSFFBZkNx?=
 =?utf-8?B?Sm5wdTZPUVRxbGttS0dFRlIxcHhGVVZVMXJNdlNrMW1kVElqcmtBRm5pTnNL?=
 =?utf-8?B?TFh6Q1hUbThIMm9XckdQNGFZdm81ekh5QUtGK21MTXpRNi9MVmdyZjZCcFZj?=
 =?utf-8?B?ci9OcmFVVUpDMW1jRVN4RDQwK0p6Z2pyWHluWVpmdzAwdGtvVnY2c0tLRThz?=
 =?utf-8?B?MlkrY1duVzQ1NVM4aEptNVpKR1lVU05vMkpJTHhKWGZYRXR2RC96cGZ5ejFS?=
 =?utf-8?B?YU0wNVZKaG1Fa2huOUVOcGxUQUVEbDkzSlpNSWtZM2gzZ0xwTXhwTXNaR3NT?=
 =?utf-8?B?ei9sRitwWGJJbzBHVUJxQ1NrT2s4R1g5dTlubkJYR1VnVnFCZy9TR0RqeEJo?=
 =?utf-8?B?cXlqMFoveXZYVkJiT250QUFiTHpEUGtsTitWUWpENW15R083LzRraUEwdW5h?=
 =?utf-8?B?cDNBcGsyK2tjbjZydEhEREYyYS9sOFRwaGg2VU56RjVxdG9PYXdWeExjZnhz?=
 =?utf-8?B?Z2ozZ3JyRlVMU0hjWlBoclNJT0ZWVytVWDB2cG1BYkNhMmhLUDFOTFcvVWR6?=
 =?utf-8?B?MHdoYklEQVdFS3ZXSUhXeSs4akkwNjZkR0RlWUF2eFJoZUJCQTMyQUhleGxM?=
 =?utf-8?B?M05RR1FHSVU5YWVqU2grd1gyRUYrOCs1RUtIbUQydnNuWTRDdUxLNDVGdHRP?=
 =?utf-8?B?TlA4VDJTdGVUSTdwUENiV3hacXJrMU9WRU1TcjFUUHM0M0UxM2Z3L3pZTmZV?=
 =?utf-8?B?V1E2c25KaWUvaVBOMVlFZFBBbmVCczEyR1l5Qk4veVpkNGpsTm1GWEltZmNy?=
 =?utf-8?B?ajJnaGNaT2JiZ2ZzR3JVaW53TFFZY0djdWhIaHY3OVU2RWdwVFNLZ1Bma2N1?=
 =?utf-8?B?cmt3QmpNTjVqSENFckxyb2w3dnJEa2R5bkhvUkZaSjEyRms0UThJQmhpcDFa?=
 =?utf-8?B?N2tqZHlrNHdtanJ0UGNyUWNJWFZBdVl0Y3JQLzFzNHpWcUFUMnl5Qk5MbEUr?=
 =?utf-8?B?QTlGVWZWS2dnYkxQemNpWkVGclhjd3RjZGNzQ2M0cnM0Zll2aXVIZkUzaGxu?=
 =?utf-8?B?dWtiWjBDaFBueWlHQmd0NkNsODNLU21hZmtsbW1HSHFrRXExY3k1cUlJeUVy?=
 =?utf-8?B?SkQ4SzhGb3FqVjlXdTVzUWFBMGJLdmhYNjVpS21aVmQwWVp1cVZjcjZBY3FT?=
 =?utf-8?B?RDdSVG5sODJ1QnRscUtvemVZenRaRTJkbG84ZnB3NENCV3JGNzA5YmliZ2Nt?=
 =?utf-8?B?UFRHVFJZRFVNQm5ML2RGNlBEVllHUDd1MlpSV2pEdGVoSEt6UzFFU282eVB4?=
 =?utf-8?B?RzM1aVVUVGNFQWx4Qkw5Z3lPaHVDTXVVeHl0ME1abkVpTmc4TVdFOXNTa0tS?=
 =?utf-8?B?cVNvVnhMaFl5Mnk0THlueWZVblQzeUJlSXhmSGNSWjZKeGRDbXI4TXVqQzhU?=
 =?utf-8?B?Q3JSNENEVHBNOU9EWHUzWVBScUQ2aDNqcElzMXREbHBNbWwvTDYyMWZETjdq?=
 =?utf-8?B?V2p0MWVtMHR3UmlqZHoyemhoQUxmK0ZTdCtERDl1d21kdG9peW84eTZnT3RU?=
 =?utf-8?B?K2VLbUduakd1ZU04dDlNWnkyU2JEOVpYUUY3bXdtZnJQUk02N3dTRzZEY2lG?=
 =?utf-8?B?ZjdXbDhHQWNIUGJLS3IzNlNEbjFrMXlNdE1vaVFKY0dyTEJ5MDEwakNVbTAy?=
 =?utf-8?B?alMxSkZLMStDcTlueGxLOWlQT0RwUXVORlgxSHV0OHNHSlJHYlkzdjh0WlVo?=
 =?utf-8?B?cjhpbHBYeFFzY09qQ24weHY1ekRxN3kxLzUrc2xZSEM0UXFIbVVDcnhRSU5D?=
 =?utf-8?B?M2laSVR6TUM4YTI2eUVzZmd0VFFvL3JieFNxRXBLVTNrd2hTYWROZHRSTVEy?=
 =?utf-8?B?eHEwR3ZuZTUrRnRseHZLYkYwYzBQZEVwMFBscnlSai9DcWJ4MHVjM1RuTE9E?=
 =?utf-8?Q?6YB6IxbmpgkHGuRTFWCLju2o1M0remrry9PMAWXkGnCO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e07503b-6e27-4d56-dee9-08ddc4f0fcb0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 05:15:47.1443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGUjz6P4VLKVF0HVSrZPzvOAJxWnvZQKQAqBgW+/ynHMugSkDDuLYEX8JpVPGfI4+qnOOLT2o9aEKHdPNGGqlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF7B9F1F8E0
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

On Sun Jul 13, 2025 at 11:51 AM JST, Rhys Lloyd wrote:
> data is sliced from 2..6, but the bounds check data.len() < 5
> does not satisfy those bounds.
>
> Fixes: 47c4846e4319 ("gpu: nova-core: vbios: Add support for FWSEC ucode =
extraction")
>
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>

Applied to nova-next, thanks!
