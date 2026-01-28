Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGRrJRjGeWl0zAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 09:17:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB0C9E1E3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 09:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B6710E286;
	Wed, 28 Jan 2026 08:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AXOsdecA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F241510E286;
 Wed, 28 Jan 2026 08:17:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItBg07Url/Ntj2UFF5S7infJlpUnbpGXDWRsJxyYKkTIQthg940CdFOd5cTUob9gpMamWOvS62UAELXeVeqq0NRoNrZZb/8F2fK4LJSk/KWKg1olZB6/3ADWzoL8PoSlubLqW5dK0tDmDy8l1A0GVezBG0ELA68z8UfRTZOmvCEfpoDUETSHGm8TKsNQVJDkdylNU9PRos8X5hG77ATph8EtCCy41+wwTzPyPTno5sZJAl6QB/ye0C1bAFY3aAnzmmLDTFTB7x9VTDaLnfetxX38F0rSKbcc0OVwSEwJS06vX5d/L6hdo0GjmdB8y2rBiwuNd94sIszyTtFlwctJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3gdXoDXkO2VRMZARsdvWIj0cuI+J6+waL9fxlseaWM=;
 b=yJqOWlebY5rwgPeEuYjHOuu1Y0aQz9LG1xco6Yt0Z9wESWABI3TRRQbS7aMZRHBNPIaqj1vK91noqAeXkIfSTRRSmh2CRuTSzN7RZPCFyWJ1HxaTI4q1Ii5cB9pdhuHCWndrAgYomMH8hMRYzrlTxnDkhkWG1POiuUjONLkjaMpo44v6ocLo92B4mxGSFYKr/6pN3tizIh3skMjBm7E8EbLHhBN3iq0TAoOqif/0RWU+3mxkmzVXK9oohTE78NY4ZPDrvJv6ADpwluwguAo6A/Hxp5YlAvW2p/vG5cS8uGZSce8i3CJkjethfOtYWmRlGXhSjlHTrQrFsZgTmEmFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3gdXoDXkO2VRMZARsdvWIj0cuI+J6+waL9fxlseaWM=;
 b=AXOsdecAkRMoLz8Mj7PZ4AdGeVog2vImEDfRzD6fHbF6TY78fUikH/9q17iPnzjsSM99EVGXZmhdtVPrm+z5tbSi1N+Az809+l45jQefPh/GvggV1JSE0DwLyRKTISC+bkZDVYDttqgrvqdDGmIbkZMDlfbH4e07lZGrnNZBFJmPv19lR1+bUMQ+SVk25Xtwvvxd1Guz3oQBigIfTaTSmIJqgnd6Nc4fqTdI+DdsaEHAw1KTyYKEeJmAdya+Zk/byxEs+ciHjyAhJLt4Bb7IjvY9+VSet6ZSHBtkTu56foYTTU5uL1BQc6DG/U0dJ63XHN+DFMI1cHYalqgm3nZFZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7171.namprd12.prod.outlook.com (2603:10b6:930:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 08:17:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 08:17:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 17:17:13 +0900
Message-Id: <DG02OBNM1OPY.2W9JKV0IF8VPK@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: clarify comments about
 invariants and pointer roles
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
 <20260123-nova-core-cmdq1-v2-2-e797ec1b714c@nvidia.com>
 <DFYPX3TNI3Y2.38MQUIWHHR9Z1@garyguo.net>
 <DFZXYMSS9OOI.5NUPB8GCHRKD@nvidia.com>
In-Reply-To: <DFZXYMSS9OOI.5NUPB8GCHRKD@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8dda57-2fa6-4e22-2974-08de5e45a62d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3NmcFE5RHl6V2RVSDJJVnlSczlMZUpTaDZOVExrVGVmNUthb1BVNnlWVG8w?=
 =?utf-8?B?S2JWSlpTakFxeTgvN1pybnBldFpabnRMSEo1YTVrQzZaUUpWbEFLeE43OVBH?=
 =?utf-8?B?VDBtZWRhMUZqVWxTalBWbkl3YTlWOUNNdmtaWmJWNHZ5N1Q5UmdYUHFlbEF3?=
 =?utf-8?B?bUZqSXNyajQrb1hlZHJsdGt4TGtqYWVzTUVyRUlFYStNOHNCOUdIOWZDdCtX?=
 =?utf-8?B?am93cE1MSXlXcnppWlhYWmpHaXhiVzRCM3JTTTRyd2gyb0xQSTllSnNKZWU1?=
 =?utf-8?B?a3c3Vy83dzN5WUl6QWxPNVo4MmxNaEhVM21EMnBkSW5QK0IzclhvalJ3QzQv?=
 =?utf-8?B?WXQwRFpOeU5Ic0psTVJNZW5rZkRtK01oVW1vUnFSRjdGUHk1aXMvTUp1N2pv?=
 =?utf-8?B?VFBkZUVad3ZBVTZuNUsxSldsK3BQa0VEUlowTC9QV0ZmcDJtYUF0S3I1QThH?=
 =?utf-8?B?UC85b084c2lDM0RkN0NDUk80c0tuaG5TeThmQ2d0TFJjQmtobkpWWnRVM2lw?=
 =?utf-8?B?WkRtQXdtUWlLWDl5QnE1dncza2NwMjNqblFFVjB2SzRhRGk3K2w3RDF6eXhJ?=
 =?utf-8?B?UWw2MFFaTFk5VkxZbHVQSDlqMXB3NlVqZExxQWxidlBVcnFvTHgxQ3F2dlJr?=
 =?utf-8?B?d0VKc1ZiM1h0dUt1dTFzK2ZSWTR4RFFtOFpSL1hSOW5KY2dZd2d1N0g2bFlk?=
 =?utf-8?B?S3lld1JOdzVEOUpuNlpkMktVMnVXWEV5b1AwRW1xYWdsZGRoaTdaS2l6L1pR?=
 =?utf-8?B?Um44Q0xYeFJZOUJLaEwyS3U1clVwQzAvTEFIKzdMTXJWTE5Ud1l1bmZRQklI?=
 =?utf-8?B?aTJBNGc5Rkw4N0QzMzhQM3pyN2RVYm1VZUdKZ0FOTGNLd1RxNEtqOGtzbGxD?=
 =?utf-8?B?c1Nzc0VqazlsdG9MbmZuVWo0NHp1WmhlL1RMSTVxS3I5U0lHYk9RQmx5Nk9E?=
 =?utf-8?B?ditCMGJMN3FuaU16Q3VPeFVuNXFxNS9ETjVKSDU0cmJoMnNGbUJCUmR4Vy8v?=
 =?utf-8?B?em5ZYW5ZMmVYUnRXVjdRMHQ3WTBRMnFBaW1peWJKRWJhSHM0dktpTzEweElP?=
 =?utf-8?B?cXJEMyt0eTh3MjJXcmRhckk0ckdGSDZBUGt1anh1b09HVHVzTlp3bmhkKzlI?=
 =?utf-8?B?Q3FPMTJLTzVxTmcvWVhCS2V0Q2REQXA4RXA2bmNwWndMd2RLcWJsWlg0MkpR?=
 =?utf-8?B?QlhMZGViYkJhQjM4eHBvMzJOb3laMThraW9ZREYwNmh4aGFZTUM0WWFQWXcr?=
 =?utf-8?B?TkZmUUdqeHJpZHJEV2ZRcjNLengxdjBLeUFLY3N4TjZqR3h4MG9IUzlKN0Vw?=
 =?utf-8?B?RkJZd21PRVVTaTg5VVFGbGxqbUdHblIraFdzRFk5dzV4L3N3MmJOYXF6RHlt?=
 =?utf-8?B?c3dZRGNudEk3K3FGaURuUGF1b2JFSDI4bmNIZjltd3Rjb3BOYzM0RnRZQVFJ?=
 =?utf-8?B?d0dVL2YrV1g0dDZlaHZhbmlYS2o0bHEvdkVqZ2dOSGdwNEkvVlVUSm9FOXAz?=
 =?utf-8?B?YktwK1ArVWVRZFFOeFZ6V2dBUTVFTmswWVN2ZHhGS2VoQ1B0RkFjdFV0VUxa?=
 =?utf-8?B?S2NIVDZtT0V3WG1hVk9UWmRjRVpSWE80WXViRXhseEplZTc5OHZxdW5SWUZN?=
 =?utf-8?B?VVRpRlJUbGc0c0dMaXkxa3kva1Foa05TSTY2OVV3YXoxblFGOVZOalVoOTFt?=
 =?utf-8?B?YzNFM1Q2SHlWM09yU1JSeG50TXFpWUV2RjlWLzUrbUFTYU5BSmFQcFNPNkh6?=
 =?utf-8?B?dmZ0bW8xVWo3Qi80WDdlYXd6ZEg2V0dKVDB3aXVmczc0U29kTlVRMy8xZC9X?=
 =?utf-8?B?djczUTdWUFVqaW1vZzY3b0FIRTRwVzdqMnJIMzlFbDJGOWdPYm0wL0FqYjFk?=
 =?utf-8?B?YTlQSW83T2JoN3dSQ1E1THkzMW5WRGo1NzBvZ295WU13SGZJU3VGbFBGMUtU?=
 =?utf-8?B?dUowOTMzckFtTFZ4N2NKemt3L2hXMDE2clU3U21Cd2lReHovSnZTQlVLTTZl?=
 =?utf-8?B?Z2pIV0RTL2dGUUtxdmYzVmJMSFZLVGJEMEJPM1RHVjNIbjRWWVZ0azVBQTVx?=
 =?utf-8?B?Mzk2MWxia3ArVXRIQnU5RzlYUjNYTEhMOUpnbmlNbVFXZEZ5TDl6RC96V2xl?=
 =?utf-8?Q?1w58=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW5JRGc0VElLRkFpbzkyNGJkOHcrWkdtNW5XV3Nkd2N5NEZQUGhtaDIvRjVk?=
 =?utf-8?B?TWozeTYwY1dpd1NLZzFOWllrWlV5eHhTNFFCckMzVnJQenRxMGg0SFlNcTlr?=
 =?utf-8?B?OGtaU3UvMW83TkFwSjlPUFBBYnhEZ3Q5NXBZaFZpYTV2RTFCWVhSL1FqMHNB?=
 =?utf-8?B?UUFlSUNPdS9JWXQweHEvT3RBZThzYWVVN1psT2N1cG9XL0czMm1XczI1cE1Y?=
 =?utf-8?B?SjdLazFxaTg4eU5HV0hLSWRWOTVkaThsOEcrdDB0Y21ndGpJS1ljSUZCR0R3?=
 =?utf-8?B?RkV5dmRicXFpS0g5TFF0WFBORllnQW9oenZDdVNTSUlWVEVXZWpCZ2YxZEFS?=
 =?utf-8?B?bHFCZkdGTHVzb0F5WGNmREF0WTQzWXNGcHJ5aXlMUEZQeE1JZmRrNHd0SGdm?=
 =?utf-8?B?dDVLWDRweE1VV3F4S0RTWEZvdGh0eDlvUTlCa3ZvS3ZaanRGMjdNYVg3NDJh?=
 =?utf-8?B?Y0JXVE8yaWZSZ2ZRdU1TSjFMR0hFWGdZd3gwSEI1a2VvOE10dHVMQmdaQlVZ?=
 =?utf-8?B?QndWYlpuZ2RmRlYvaTlJam0zYUNDN2krTkhMbUU4M2NqclBxRDVxT05XVU1Y?=
 =?utf-8?B?djF3Sm9GL2RwSlR2bHQ5WVNDaTNJdDVtUjAxaWh0RnFxUnBJNUh6bzdidnVq?=
 =?utf-8?B?b3ZwZStzT1ZyMnUrb1ZMSW8rcGx2TTBGejRCTVFaNDc5VjFNR0dPZisxb0p3?=
 =?utf-8?B?WFR4SFVIcFZualp0VGxlVDdiR0l4RFRvakdYS0RiRDdnSE95NlRMMDNPU2Jn?=
 =?utf-8?B?Zm8yNXg1c2NCMXU4emtZWXBubGxYS1JublBQRU5IUGtoWStYdnE0alUzL3dl?=
 =?utf-8?B?VURNQjJUMWxycnJHQUZQUG0xa21BR2o1cXA3d01La0NLK1kwa3BmYVhsdldP?=
 =?utf-8?B?SGkyNTVCKzRmMU5XQ1BheUNBNnV1TDVBSmZuZ1lDR0lLUHlKRHB6MDB0Rms3?=
 =?utf-8?B?MHNXbG9jOGxQNFRRU3pyNCtDdFpHWmkwWk9CZG0wQnU3ektJcHQwU093emRB?=
 =?utf-8?B?aE1JYXo3MjlNb2d4RXB3MmFYeVdpTjk4UzFjZndOc2lSNTFvOFBnSFNRU1Bi?=
 =?utf-8?B?MDlQUHhsQTlmRVM5RlQ0a2p2R0NXdkJkaTZObWFuUjE5ZWFMb3E2SW5Qck5E?=
 =?utf-8?B?cUttbWU4SUxoWThZV0cwM2tZVXFWZ2xUY0puSER2eldyWE8vSjFwOWpFaEFw?=
 =?utf-8?B?VHdud0JPcEVNK3EzUHRCSGxjWFkzR0VSNE1WZ2N3Q2d0MWtqdllrZ04xd1dn?=
 =?utf-8?B?SGNMNHQ3UGVvNEJoMFVRQU5PMGFLT2t6RzRGVXZsYUZkWDVpc0d3OXljcjJB?=
 =?utf-8?B?N1I5WnFKbW1hOThVanJwaUdsN3ZLTjNtRDR6N0QvOEIrWEtzSDh0d1hUK3k3?=
 =?utf-8?B?M285Y3NRR3dqQWV1bGVUL0U2K1hiczVCWFFxckZJZmRnMTZnVTlxSUFpVmV0?=
 =?utf-8?B?Tlh2WTFVNDJWVFQzQWxLR0RmL013Nkg1bnArMWEycng5L3phckJxdVRleFVO?=
 =?utf-8?B?QXhFZXlLb3NqZzErYXhEc2dZdURIWTRzVzVWdTEraEdFL3IxbTliT0ZadmEz?=
 =?utf-8?B?U3h1UU9zNTZZR2s0ZnQyL3VabUw0UUhXb1ZXd0kxTXMvSTJwRVFkYjdyYWNx?=
 =?utf-8?B?eDFBVmo3YnAxa09lcDI5RURyc3dDakkxS2d3aEFDeVNsdG5EeEtuV2xtZjdD?=
 =?utf-8?B?dmpqQ2gzS0krSk9pd1laMWVjcE9VUmMvbnYxV1RkSURFbVpFczNWcmNHSkdU?=
 =?utf-8?B?N0c0YlAzaU5FVVdxK1lJaW1zbEg0NWllcGNPVTUraFBFSURReFdvSnlBcjRq?=
 =?utf-8?B?Y0gySHQveGtNSFozbGZRTmZkanBQdDB4UWdSVnQzVXVTOTJrdVY3czZ3Ynpw?=
 =?utf-8?B?cHV4b01vVEI4MGxvdWkwcEsvczl0RW1LTHJHMUF6ak9FY1lOeUhKd2dFdW1U?=
 =?utf-8?B?T2lLODJxSTlraUVhQkhJc1hReXBURE14c2prMm1vSWt6RXlLOU83OUNuNGlU?=
 =?utf-8?B?dmhMejZHQ0ZQb0h1SmJKcUtqL3NRbTc3TVRraDg4ZTkyQkMwcE5CdkU5ZUZ3?=
 =?utf-8?B?WWF6ckNyUk5TVkNZRVU5SGFPSjN3RmFheHZTUkduWExCZzZnQm9QT1lOZWV2?=
 =?utf-8?B?ZkdGcWQ1ajlwL3NJZnlVVHpEM0lsNHFPV2FtS0o1RW5lMUVDVFVHVXk5V1V5?=
 =?utf-8?B?bkk4MHZ1ZUwveWU4aFZTaWdoSFBYN3M1ZmVOODdjbnZZTzFhSGhrVE14blE2?=
 =?utf-8?B?dDI3TmNrZDdvOTVXVjNoMzFnak9NeWJTeU0vQlYzU0tDTi9qWWlDVzcybEQ2?=
 =?utf-8?B?UEd2WDRVaWtJQkFtd1MzWEZzclBkTlE1UmhtUGRzOTYwRENsTERPZlI4VUNo?=
 =?utf-8?Q?Xy2ZTD8zKJfjIMjUTqeMmR0cfMC/q4eu3Rb5pURRUU4pT?=
X-MS-Exchange-AntiSpam-MessageData-1: xoJAa63up+4ggg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8dda57-2fa6-4e22-2974-08de5e45a62d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 08:17:16.9774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQeUyMzGC+26Q/RvwlGhnUmTl+b9gaKTRDVa08If+BH4soxw0kukcclvcxgohPcZQQBdpONxZ+rAFjvBcjV7Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7171
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,google.com,gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: DAB0C9E1E3
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 1:35 PM JST, Eliot Courtney wrote:
> On Tue Jan 27, 2026 at 3:04 AM JST, Gary Guo wrote:
>>>          // - We will only access the driver-owned part of the shared m=
emory.
>>>          // - Per the safety statement of the function, no concurrent a=
ccess will be performed.
>>>          let gsp_mem =3D &mut unsafe { self.0.as_slice_mut(0, 1) }.unwr=
ap()[0];
>>> -        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `<=3D =
MSGQ_NUM_PAGES`.
>>> +        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSG=
Q_NUM_PAGES`.
>>
>> Can this just be `tx < MSGQ_NUM_PAGES`?
>
> In previous discussion[1] it's been noted that it's important to
> explain why the preconditions are satisfied, not just what they are,
> so that's the reason I kept this in. Happy to hear arguments either
> way though.
>
> [1]: https://lore.kernel.org/all/CAH5fLgg0O=3Dt2T2MQH2hvm4eZnCOa_NffzRw=
=3DXZPi9+7+=3DXsmRg@mail.gmail.com/

I agree it's a good idea to mention the source of the invariant, lest we
may lose track of why it is indeed true.

>
>>>      // # Invariants
>>>      //
>>> -    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
>>> +    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, i=
nclusive.
>>
>> I wonder if this can be `is within 0..MSGQ_NUM_PAGES`. What do others th=
ink?
>
> I think this is very reasonable, since this is part of the rust
> range syntax so it should be understandable. I also considered the
> mathematical syntax `[0, MSGQ_NUM_PAGES)`, but not sure if this would
> be conventional - it does seem that this notation is used in a bunch
> of places though. Will apply your suggestion in the next version unless
> there is a definitive convention for this.

Since this is Rust code, the Rust syntax to express ranges (within ``
quotes) makes sense IMHO.
