Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJjZDOSYcWngJgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:26:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94217614DC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8047C10E8E4;
	Thu, 22 Jan 2026 03:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S2RbbNgD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD82E10E0A5;
 Thu, 22 Jan 2026 03:26:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3jkEtU4nCABb99dxhqQeCyEvLRJ3SvxU51Y+n+SdkXl6gtK6076bR+Pb8bUKl3FWS0QvN25vzI0/d3Jn4eCPMjsmiyZAemXXhP55yuCXF7trmnTP3tmxvoRa78XgV/FDejx0qeUOnzG25sWt1NkbyrY6dfphE2dhWlDK8P2TmIwU3qbor6+KMLX8vEASCuegpm/aDzv1pmOKB2NL6KEORqSGxBxSmHHpQ2hZ4QYlH4qomQUYxztNSu+KlPKBoZ1dDbxtE3tdT8YLIZ7T0hEKAz7qxKA5D5rSW+GduDquAXEzWabjVfrPvjvUTo0DYJRrecvhAuM7p1XlOnnCZ6V/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJegxlSF2zG2x+gcoT0H1FK6d/puCPe0JRWDwruX1G0=;
 b=StyrLTyi4rc1srWfIjXdxAZebesWAQWY1b1vyIHxvDzHJY+Zrf4C8FapopsjHEGWXtxkTZ+Fq10PF7iWa6bL6Jf3E+Qx6+cxmd6vowe10kXPdM54lI1N1WTf3aRgkNauh1mr8TvEV1uHKe6WOyOzrOTQKaV5byVNZT7tEqm9637Ob+3YNqlhaZXY4J8gpOhEfpFT18zpE+zqVPP7SetRW+U6dOgim5rqPJ6dDXHSdJIA4tfAEiF9gzTGcNov3rT+4ZmUYKGWkpfZT9CWTOngq2ftjPT0MWAwxqjjp7+GNgf2PVxR7diAXPhDWJemqjLGvSb6PYacbKrtbWyLmjdTug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJegxlSF2zG2x+gcoT0H1FK6d/puCPe0JRWDwruX1G0=;
 b=S2RbbNgDkhMdjr8/IcgOv0CT/5TROzGD+Z7A43hx1CMn855JlVckaPFFQNQ7WpMi5lrZGyUxKABHVKpTSUtovVQjWyTnFDJjnqXthVowj5SmDNb+EU4eCaYO7kalXvE7IcEDaLHqFQLMsXEaJmXwHAp/E7D8pIQ3QekHtOblMhEIOTXawJ/Wn730JRpkTnhcCE5eJqF8njz+X0YbTUaU+PzHCulIjFKoghgLGQfvmvS3tpmpxJMf83WvGNgUy3gEeKsgXQQyoC52AAsF7aXN7B5bNvk/SjaRZqFWyIL9h15e1bMXjv//nSf3VEfA7KkkoSu28Wo2zbEDWP1DRa2Wvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB7740.namprd12.prod.outlook.com (2603:10b6:610:145::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Thu, 22 Jan 2026 03:26:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 03:26:20 +0000
Message-ID: <ee459198-04f2-4bae-8e1f-4ec413d92f89@nvidia.com>
Date: Wed, 21 Jan 2026 19:26:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
To: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
 <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc83e10-11c6-4032-ea4c-08de596602e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VisrNC9SUTgyaU9ZdWoxT1R5L0pZNEc3cUJkV0NrYWRkNVBsZXRaZ2k1UXJ1?=
 =?utf-8?B?YWN3dDNoVFI1akZXQlluemxyUVNnS0Z3ZExneU1NOU13VTZvM2FvM3RSSjI2?=
 =?utf-8?B?cGhRMmMrRVRYSXpESjVwd2NJUDhNWGJaYnQ2VzdxaXh2d1FqZXp3YTVJWjFF?=
 =?utf-8?B?VHRwN0RZWTY3YU5rbi9oUXY1bWowckVhZjZSMDFlU2ZPVU1hT0VyQmx5ZWk3?=
 =?utf-8?B?N09TTi9taDJrbFdPMW85dTdHcS8wUWt5UGN4cmRueDVIRk1INlU5UHBaTHJ6?=
 =?utf-8?B?cjZRcUd2S2FGZW5KSEN5Vi9OVWh6Y3ZUTHI4aVZjSHN1aWhmaUpnWlVMcktB?=
 =?utf-8?B?WmZGZzBiM1QxdG93N0xXbW1xOXRzc0JwQzJXSFRYTWVwZ0hDZ1YyL0U5eHZC?=
 =?utf-8?B?ZFdmQnpUQW4xaUhPMFVxZ1dkNGUxQk9LT25tOVF6aFI2R0dpeTgydENTYlFD?=
 =?utf-8?B?cHFaMzdKZi84c2lQNjNvNTkvdHdGTGhqRkUwVnB3U3JqUHB0TlMvaGVSODRH?=
 =?utf-8?B?bEJFV2lXQzVuK1dDdWVrb2lhcU05WVpNZENQa2Nlb1oxVzR5dXNmRnB1aXZ2?=
 =?utf-8?B?YzR4dGdwSkJ0dHRseUxwR1EybDNITXh2ZllBYXFWUkdaeW9vQzV1b05MckdN?=
 =?utf-8?B?d1J6eHVEMXZERm4wS2dyQzhNeGcvWnFsNEs2ZzR2WjV5QmRYamRCR0RVTzJT?=
 =?utf-8?B?Z2VhSUJLcVZUU25LWHQrTHRkOENtbEZydkR3MFZyd3BWT3poSGY4dG52UVkw?=
 =?utf-8?B?M3dFcnNqWHA0OHRaaVV0WlF6MEVFa1FQQjRpK2cvL3ZBRk9COUVkU0N5VWg0?=
 =?utf-8?B?c1FlYXJhcGdaOU1JdzU4SS9iajNGemtBNjdJbXdTK3pYMG50RFErY0wray9J?=
 =?utf-8?B?cGZudHZDK2FlUW9WTTFBdlFQZFZGWXFaMTZ2WXNSWTFzYXJMdjFBbE9CZFoz?=
 =?utf-8?B?SHZnZnhhbHBjYS80KzVhaUlLQTBTcm9RQythTzRBdlMwWExDQnBRWWUvdUdT?=
 =?utf-8?B?TEVCVW5uS29BcVJYWkVZNTJIVDQvY0JDaGs4U3hxNWRiYmpOUXVrVUNGOVE1?=
 =?utf-8?B?STlZYVJERTNmR2d6ZW9MUG9nRE5UQ2IwS29LZDhSNTJkekdPdWR5RjJoZy9C?=
 =?utf-8?B?RHVpWjRlWi82TVlTL0hOYmhlODJPNWJVU1ZGSDZ6UDZjMGlhREF5dDVCSmpY?=
 =?utf-8?B?cVhTQ29oTFRNeFdVZWxTVW53K3JqdU12TXd5SFBpRDQzQ2lQOHU2RmRxRmpu?=
 =?utf-8?B?SjNTMGIrMmdubWY0SDBUcXo1cHMwRWZnVytCcVk0RktWcnJOcmNmRm9KN1RM?=
 =?utf-8?B?aGxPL29RWU90ZHJnaGFtRmlqYTVDVWlwWnJyR1FJcjNzZkt3a3NWQWJXRkMz?=
 =?utf-8?B?SmlNWW8ybWZJYk9yZmVqVDhnNGlzb2hNdExqWEVudDBsT3AwU3lkcVk4cmNo?=
 =?utf-8?B?TzV6SXFDa29WbEN3eG1SOVhINFJpZG44dXZLenMyMGZZUFpOdExpNEViOU4z?=
 =?utf-8?B?S3ZDRmdzVmx3QW9HYTZnaHAzc2VKYUM2aFBFaGFIaFJLeWpxcDFSOEwzQ2Rv?=
 =?utf-8?B?cmxwTU03TDR4bVM1bWp1YXVyRXRkUnhiaVVGc1JhNzZoUjFiZlZPSHAzQ2px?=
 =?utf-8?B?ait0QU95cEtteEF4dkhERGZ3c3c5N0ZjTVBnaEEwZ3lxSFBlUmJOQjA4SHM5?=
 =?utf-8?B?clB2bkJkQU40NFp3TDhlb2lTdStmaGovZ1RHdTFMREJWVXlSblVKS1ZIdDlX?=
 =?utf-8?B?eVdmdTQvMDVFMU9tYjM1MEdpOEM1NE5ZQlpHeVdURndXL1N2cmhGWnZ5Nmpo?=
 =?utf-8?B?cWI2OHY3MnBEcHRUVm1yZFFiQm96cXo5dmZ2YWwrVE4zVFUyb01FSzRQUWYr?=
 =?utf-8?B?RVUxS1F0Q1dyaGRkMG16TWF3RnRSL00vclhUbnRPVWg0SUlwZVVkamJOOUV6?=
 =?utf-8?B?KzZsMk9paXVVV21sM2xGekhzWWZHMStCQ0NQVmJjNWZyL3dNWU9mandwT3FL?=
 =?utf-8?B?RHhjaVkxb0hGRHZWRzk5eUFPTHFpTlBPWVZ5M3NPQk1LdXc1bDdwQlZOb2Jz?=
 =?utf-8?B?b1VIckNka25tanpsYlNnbVZHSnc5Vkpyc0VLdUp0b3AzL3JFQ3N1Q2xFV1Qy?=
 =?utf-8?Q?Lk8o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUZrMEVFckZlYk9FL1ZJVDRUMWRSdTI3NzEyQWc2TU1GWFNNZ3d4SDJlaHRL?=
 =?utf-8?B?ci94UE9mM0xFalYrVWhSMkRZRXlPaWk4UFQ2Zjl0Z0l4V1lpMzJxSlVhb3kz?=
 =?utf-8?B?OHpVWkVmVkJGVGpNK2pTZWdVRWlySzU3UG9GbElNNkhsNi8xcithckxwOVRD?=
 =?utf-8?B?bk0weXJoWUdCKzE5cHNTaHdJK0JoQkE4bEg5VVJiMk9TZXZSRGpJU0NkWEhm?=
 =?utf-8?B?TTVLbTlRRWNZWldTMTV2bjZzRFBJTk9vQUQ3d0N6M2V4WElqQ2lzbTg5L2ZZ?=
 =?utf-8?B?V2tlck4rY1RGRnNBZWY5WUZjNkdhSXNNbnIrQm5IUk9lMUlSSVlwaXcyTU5R?=
 =?utf-8?B?TFpFblFaQ1pTL3dEMTZnWGdWd3l2MUFHZjU5TnliWk1hQ1Q0cE4wKzQ0USth?=
 =?utf-8?B?aFNtelk1NVFjdmx5bEJmSC9rVFhKUzRkR0J0VXdmdk9hdEhDOXQvYmM4MEZU?=
 =?utf-8?B?MytXQjdyYmUrT1Nqb2c3RXpialdGNk5VUkhuakNldVZaeWVMV1F4TGdUZTUv?=
 =?utf-8?B?UVdkYW1xYWFkbzZTUEhjdFQyQkluUXE5NXNhU0hHaHNuWjYwSE55L0k1YWtW?=
 =?utf-8?B?NlNyenQ5WjFqWlhudVJRS2xkMjBKN1RvUXJwSFlrUFFGOW5IbTFsTkdReDZn?=
 =?utf-8?B?Tk1RSEdHLzZ5NFI0ZTYzQkhrNEtsTk11SUNRRlpXWVd1c3liNVNkbFI1V3Nx?=
 =?utf-8?B?UEQ3RFdQRkFOMFNsVWdhbnF3WnNhSnpGT0EvWkpJaW5ScjA3YzhKOFZaRFFn?=
 =?utf-8?B?cDVSeGJpbmxJbTJCdk5JYWI5dHZtR2gyanFucnR4cDl4T3QzbEg0TGt3eERJ?=
 =?utf-8?B?WndFdWtqa2tRL0hvb1UwN1FZbnhheVBrVjR3Ni9zakEydS9neWJudktrSVF2?=
 =?utf-8?B?OTh2T2N0d3hYaWNzbVpUb0xEaVFGNkdUeXB6RVpJY1MyNjNXdFBUaysyb2Y2?=
 =?utf-8?B?K3V6UjhLWVVEempPaGVWOGplSjBPOVhnS1hKL0lMazdLQTIxYXhWbDBmS2lk?=
 =?utf-8?B?eXd6RzdBQmNFVkhQcmQ3aWZGazBJSkx3TzYwK0dOUVF3dDQ3QXNZWG5HUHVk?=
 =?utf-8?B?ajdhejJFMmtURUJGOU5Mdm5TK0Ivd3d0d1dyR0o2OTZlZjdoL2M3aWlaNmJn?=
 =?utf-8?B?cXlLTXU4cU8rdzBDLzJtSUh6a2dQdWpiRXhsRVd5VngvYURnczdSQlhIL2do?=
 =?utf-8?B?bE5PSmtaakY5OWRzODMxUk5Odlc0UUNRYmVQZG82cGlTd28yOXRhNTMzNTFG?=
 =?utf-8?B?L3NEOVhrL2pTc1hkM3RKYlpEVllLNms4SXJlb1k2UjN4a0lkbmpsS1piRVN1?=
 =?utf-8?B?R1ZnMmQ3SmwwazZEdVVTb2FEaWZ3d0FINGRzeDFKYnJSaWZNdEtLK1Y0KzhZ?=
 =?utf-8?B?MmhMNVQ0M1FJUm8vZnQwZTB5bE81dUlDNmZYaENzTUFFWFRsRHdVelZjTWpR?=
 =?utf-8?B?NDJ0akpXTldrQzFRVjJlSGhFQkU2Z2RWdGU4ZlZiTlF3OVJIY2wzNEJ4ZTZ1?=
 =?utf-8?B?QXg3djlCM1J2Znd1V0FHOWpwWDAyTWRKaE9QNk5lTmwzQUU3THNqUnZDejNz?=
 =?utf-8?B?bVhiaWxQbjlsRGlQenkvUzV2U1g4UUlTTHdvNDFhTHZRY29Vcy9hU3F2TVE1?=
 =?utf-8?B?U0o1aFdHNW1Zd1dmK0VpUEhrdkh0RnQ3ZkVRdWJrcmlkeGx0d21ydmtqYW1P?=
 =?utf-8?B?SVNLdVJsbVRNOHA3VXE2T09YV0FTOWZISFFvbCtYRTlsWHpvRUxSWmN5M2o0?=
 =?utf-8?B?QkFoU2dXL2ZnVFVQN3krQ1JxL05yTUxEemJ2TVM4M21reG9LNWk3S1NQdVpP?=
 =?utf-8?B?K0YxdTVic2I0eGNVMHo4aDg0ckhSQllGd2R4ZTRPVk91cGZxRWRPaHp1eDkv?=
 =?utf-8?B?dk9Rb2M1UHZHa1RzTkpzSlVtZ0ZaYW05eEtNNWZnU0RGUm9hMWpzbldVbTBi?=
 =?utf-8?B?KzYwdG8vazc4WGlwcXNYbTZGcDhWNUJPbzZrc1BCNk12czNoakM1Q1FXWFU5?=
 =?utf-8?B?a0I5RXp3c1BGMXZ2akdjSndadGxkTEt0UXJPZGFSVEc5QUIwZ0lMdXhpN3Z6?=
 =?utf-8?B?bG5leUxRN3paeENoZTk2cWRhZG9oVWpaWlBQRzlVUjMvUURzNEJZK1F3dDYr?=
 =?utf-8?B?ZmtWaWkwZ285NjR6eVJPWkc2bGlpVGRXb1RhQTRkNFc5SDU4QWExc1FOeHhn?=
 =?utf-8?B?UzBVWWczWmtNM21MVUxTYlcwRS9RZGhjdXRzMkl4Mi81bmZXNm5KcXlRUFJy?=
 =?utf-8?B?WUNVQTVjSWNYYnFCVld2Sm1naHVuYnlPRng4R1pTbTdUdm56YWtsMUF5ZGRH?=
 =?utf-8?B?UHhsN1JLVFJPNElvMEJtSFNDR3NyTzUzbURPTGdWZSttTFY1ckNRUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc83e10-11c6-4032-ea4c-08de596602e1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 03:26:20.5626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaANmOeCLS7TATAm+r2Xn2Lkuey1mH9bQY/3O1A5kE9vojqUOqx55h/7z4Q1bEDPcR3RBXqLc0D1H0VyYSAz5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7740
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 94217614DC
X-Rspamd-Action: no action

On 1/21/26 6:59 PM, Eliot Courtney wrote:
> +            // The area is contiguous and we leave an empty slot before `rx`.
> +            // PANIC: since `rx > tx` we have `rx - tx - 1 >= 0`
> +            // PANIC: since `tx < rx < MSGQ_NUM_PAGES && after_tx.len() == MSGQ_NUM_PAGES - tx`:
> +            //   `rx - 1 <= MSGQ_NUM_PAGES` -> `rx - tx - 1 <= MSGQ_NUM_PAGES - tx`
> +            //   -> `rx - tx - 1 <= after_tx.len()`

Hi Eliot,

Documentation nit: the proofs are great, but the above just does
not go into my head easily, because it's a proof, rather than a
sentence.

Can you please reword these PANIC comments so that they are complete
sentences, along the lines of:

    // PANIC: a > b and therefore c cannot overflow, therefore this
    // cannot panic.

And please also use words "and", "therefore", "because", instead of 
symbols such as "&&".

Same for the other patch with PANIC comments.

I did a quick search in Rust for Linux, before writing this, in order to
ensure that what I'm recommending is How It Is Done. (Not to claim that
Nova in particular is fully correct, though.)


thanks,
-- 
John Hubbard

