Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPp1HXrWk2l79AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8DD148894
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD5610E424;
	Tue, 17 Feb 2026 02:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gsL2h/GM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4389410E43A;
 Tue, 17 Feb 2026 02:46:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ph/FMCOooASJQYHrVeKemHWxLOgHXnk5QxEm9UYbAf/ozKTGg5/3wqd72Cabx3ml8rScOMBbi5LJ7uo5pktnxQXO+aYCllANoDjqNGxmAaE+pySPWTF+82igyJA53d7bN2jnCVKcHC4NdwHMZber2yEvoZCsKATBD7gWMuynLJKcrQE4JkxWvf4N0eMvC5bvgHhKalVipuxweD59/HW4bNsSRPgS/3R/LoF7eD6LjfkcpPSCTwLruyZ+SMu0/Ia1kObO3Z2yIbIRTs2/JRRv2YBmi+fesFN9cluWCXAI1TcK8pVCjW90c1PCAPyaY+Y/VztvZnrDDW0n8IKr3PQnNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZdiXC1X1/5kfL+/qkOl1hUH9hyyFCoiM0v27EabG+s=;
 b=pwbI7A8sz4ndN3tb8gEcZj0gQzfxIcMkZu3G/6z8T4f/MT2jvyPOHMu2AhOe/ZDc7Mjxw+uOhHZf29DAfdWGExFDOPp1hWWJ3Alaj+L38eHC1k7yAsRujoWl0M85MNcNvR8EyrFr8hSZdA1VvYpoIpOODCGWtE3piVagm/L/wfGVBUpzS6v3lYkVeaF0BJ6ww0crMAvQfh6chp0phDaOixBw93Oy0t2CO70ZLcdpj/7iUWRLKFweAwn7ycgndlOIjh91CBjzWEr/Clj8XA/PJo/KiiWevE7ayrXq5MAmdrlur3N+abPM0Afh21Y/6EGE0LtKwNN2dpZ0KZCK8IkQnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZdiXC1X1/5kfL+/qkOl1hUH9hyyFCoiM0v27EabG+s=;
 b=gsL2h/GMfpybhWycCiA4iIPgCtUYifhLydr7PxgSdFD2ad0/86zF8EH/h6FuVpDKxwqk4zJLfq0dkaoVYEbJ4I0CrAS/plGLqWbG5YcgvlDh6sPj4q7lvhKWI5E4BsKlGU4rhrLFI2ZMM8iczUhKk9rL2sdkZe12+LF9NVCxUwEhb/EhTeRwXP7bpACPDMErhlT4tiSMUbfCBoYh3MZQczTio5OfbsFvEgZBP/g+q9zzYtvvBXOAlri+siamK5hDGzXInGUcK3LOkEQvCAp17aN8B/y68SKaj8CZu+DEwdMUJnns0HK123UAE9Q7XUCzZAibwiQ1PAbWiZN/VgN59g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 02:46:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 02:46:10 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 17 Feb 2026 11:45:52 +0900
Subject: [PATCH v3 4/8] gpu: nova-core: gsp: remove unneeded sequencer
 trait
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-nova-misc-v3-4-b4e2d45eafbc@nvidia.com>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0106.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: f75f180f-7e95-488f-f313-08de6dceb4f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THZ1bWJtOFg4VmFPMzBLZnd1S0kwU3VYT3pTN0xiOEIwSCtpbDZrRXdZR1Nj?=
 =?utf-8?B?ZnNCYStqR3VGR0xJQnFxS0l6WFUrREREZVZUcVAyN2xRL0xwL1RrTHRtWEhY?=
 =?utf-8?B?amI5dkdrR3hmQitLOWpEQU5ZZHZhV0RiZzhGM3ZSMmVZdlhQWEg2U2Y4Ujla?=
 =?utf-8?B?ZVhxM2tNTC8vZ3JmbGlpWjFxZ3NoWXVPNkp2NnBFelgwYk5CaHV4a2dMSGpM?=
 =?utf-8?B?dmUzOEx6NVVEOXFGUHloTGFkaFUyTktaYWNHSGkvbFhnWEN3ZjdYbGNyZVBL?=
 =?utf-8?B?YzIrZysza2F1YTk5eFJDS0tJMGppSS96V2QyMFhrZnB3WVZIUFpjNWwwb0pJ?=
 =?utf-8?B?d3huTGpwMDVTaDMvQVhjTE1xWXNxT2QxcWl2OERISFdYTGlPcGlOQlhYRkJj?=
 =?utf-8?B?S0l4M25nd0UrdXFzaW5DMWVrcHRYMEkwdWY4REppSDNwUmE5VWpWRmo2cjZL?=
 =?utf-8?B?TkIzZGszd3BPMnFhaDlOUVhFc0NIT09hL0g0RVp3VWZWend4OUxvNjNVa3Z1?=
 =?utf-8?B?YVlrNG0rTnF2a1AxRzdrMjZwZkZmWi9JQ2YxWkttcHB4cWlyUHlpRno5dnNl?=
 =?utf-8?B?ZjVJa0ljbzFacnhCQWkwVUI2Z2Y5dStqN1cvQTZ4YStCd0l2TFplUitkcldZ?=
 =?utf-8?B?VGc3TEdoa213Qms2ckk2aXNZaFI5Rlp0NXpMeWk2MVhEbDdHRFZ6bERDbEZR?=
 =?utf-8?B?UlFCYXZUQzJta1JxSUFFWDFVVUJQb042ZlVEalROcCt2cEE1VnlOWUplL1Zm?=
 =?utf-8?B?T0djRCtDTjh3UjRLeHQ2OTh4c1h2bzIvZjExTzEzM1l1WnRWajJRMFFwRk9o?=
 =?utf-8?B?cXJha3lRWGgyNUtlMnExNjc3NHdIK3NVQldyaFk0dWwvWmdLMXpoa0tCOUhD?=
 =?utf-8?B?SjlqL09RVW5PdHZRUFFNOWFaaUR5bTNlMXJoN21lQ0c5TEVIdUZGekE1RVJt?=
 =?utf-8?B?WVpvSzhLS3dhSmZZcytoaTV6SDl4RFFSbGZZMExHTG01U1V0a1lKcDAzUXA5?=
 =?utf-8?B?MzNKNk1LMU1nVUtXZ25hQldadTJ2ejQvSXN4dC9PNU5qWHhuTitDVjU4a0xp?=
 =?utf-8?B?VmhlQkRPYmZnTHBzMjFicFk0dC81TDFHVEduQWlFRVlPQ3VDSmtISXlXRU1R?=
 =?utf-8?B?eWJQQzRxUnJwVlBBa0xVbHR3WGUwU2ZTbGlPbG9iVXpTaUdzbXV3aERQU3FW?=
 =?utf-8?B?L2N1Q1E3d3JEb29LRXZlRFlmdDN5UjBiMUp3K2U5R2RpV3I5TUhRRURGSXdU?=
 =?utf-8?B?T0owS3duT0ljNTlhREp0amNsU2lDbjFuUkVoQmNPd0ZBUVFwa3oyRVorRU1V?=
 =?utf-8?B?djZIV1lUOHZmU1F1STNOenVucnBkZWkyeitySEt3Tmp6bkhQS3RNeFBDK20y?=
 =?utf-8?B?WjA3ckk5N1Jwd1cyRWRFTm84OE5ZK21wKy9RNTJFTzN5OFlCbEVUM2tlZDcw?=
 =?utf-8?B?NS81RXFndkdKQTR1ZkZnMGdKVVRaSjRZMURsTlVVaGJ1MGN3Z3pLMjJVVno5?=
 =?utf-8?B?M1ZPZGdOYkJ6Qm1MOE9tUEF6VHhpR3BIeE1RWG43d2ptN1NLV29oMkRBWUFu?=
 =?utf-8?B?bFJqVHNyVFhPMjcvc3RCcUFuVGcyclh5Q2ZPODhiZXppcnMwOSswK2FTVTdu?=
 =?utf-8?B?KzQ2S2tza2o3M21hUFJibDNSajhnU0w4bVdodFFCTXpEZDVRZVVYK0VCZUJC?=
 =?utf-8?B?WEpERFgrTGdWVGhFNE9lTnc0aGhqK0hYWTVHd1k3S09rYzBldWJvWUZoSVFt?=
 =?utf-8?B?akRFdk0rZmNwQlpMWjhKQlRhWDI2VjdEOTU1TFNtenU3QS9wWXRLVVlQVjF5?=
 =?utf-8?B?TjJwODZEOEY5TGZpTjhwd0lET1lJVFA5REE2MVJYZm9hYno4c05CZU1OcktV?=
 =?utf-8?B?TkQxWFBKR2ZVQzhkMTBXYTVPWi9tUlhhSnoyemlvZVdsa2lWNXpraFJGV1Z3?=
 =?utf-8?B?dzRsZnl2eC9YSG9TL1lMQUJrb3JTeDdSanJ2M3ZKWW1ObW95R01aTXdNRy9O?=
 =?utf-8?B?WGZvTFh0Q0w4OXZIVUhpZ3hJWmpVcHVQa09uYjc5TEQwMGZIR0ZETlZPaWZz?=
 =?utf-8?B?d25UaWJFeEd5WlZvVzNIZ3cycHZOb1VEaVh6NGg5MFZ4TGJzVytGSWoxMGsv?=
 =?utf-8?Q?9ebE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2x4SXdVWUpkOTRpNWtHMFRsOWRUUk8vbXNXaTdYZUU1MmxlTU9TTkNPVjRo?=
 =?utf-8?B?SW5xeS9GMFovZHp3b1htTHhzWXZSNlFhSWhOWFlUVEhHWTl6MWNabWl4QlRZ?=
 =?utf-8?B?b0x6Mnp6UDFaQ0tlTW8ycXRQYUsyMGFWOVo0K3pnMnFPcFFIZmJkMXV3ZEk0?=
 =?utf-8?B?eC9XWmptNXJ2Umw0T1AwR2I0bElzWklEaE95RitaMDBma2xhY2FJeVM5ZEFE?=
 =?utf-8?B?d0VMaXZrSzFJWERwcmZpdVE5UXdNM2p5ODNRaDJZRGZTYlpmbVdqbFMwTytD?=
 =?utf-8?B?U3BnUG1WNDFjZjNrQnIxRExnRTJJSFJhUlBDSS82Z2FMWGtWVEYwNFFBK3Ju?=
 =?utf-8?B?T1J0NTJIMTJTOW55cnRLT1RaM1paZzhDVVdFK3gyNmxNUUZDN0RvR2I0anBZ?=
 =?utf-8?B?UHhaYU9KWjE4YWdZSUdhTWpPd3N1T3EyU3FyR2tVVFppY0hOTy9mcVlXdEdW?=
 =?utf-8?B?RTRNNVA3L2ZjYXUwV0hONFEwdmc4SE5uT00xaWZWTUFlZHpSRStBOThlekRI?=
 =?utf-8?B?NktEYTc1NTY1UGJaR2k1bW9ET1k2bGs3N2NnNW9jQ3QxRitmdzJqN1h0NXhu?=
 =?utf-8?B?UzBYQmhDeWpQcUZlbFNrQkhvaUlGTnJHL3MrcDdQSGUxenN0TGZkcEdYczdh?=
 =?utf-8?B?RjQ3MkJyYU9MZ0JRbzNuUDRtbGZIWGR3MkJKRGhZU3RCeFBPelVOZ2diWGky?=
 =?utf-8?B?UlVJR1BqN3BDTUdmOEN1S3U2eTdXeU9OU0RCVkxjNEZFUjBSSDEwYlpVWVdS?=
 =?utf-8?B?aDhMeUVNK0hjMnhRUTZSNFBBR3N6bmQrdmlXSS9YNU5NTTRUelgyZFF2aVBZ?=
 =?utf-8?B?WEk0YSs3bnJ1UktDdEIvUlVDdGxYSTZDRjduNGVlQitoMkVzTk0wQzdNTnkw?=
 =?utf-8?B?Q1plQ1VwODdLajd2a3YvUUlUcHRianJtUzRkcEowTkc0djVQZFFQc293Tlgy?=
 =?utf-8?B?SUVGbUJmSG0vTHZEMGdjR0l3TzFuZnJLTVBzYi9hcjRwejlQMlJNTm1kYUVl?=
 =?utf-8?B?aTdHNEVra2RvNFg3U3I1TnZzeVQrYTFZNDR3bGJKL1NndU83UWRPM0ZuNG5Q?=
 =?utf-8?B?bnpQc1pmaUQ2VzZhUzNCSEEyUWREOWswYVE5Y3FUeS9pMVN1dzFGaVNxdFNq?=
 =?utf-8?B?cjJLbHkvZDRhUEE1OHVHMWhpWDlMUE5pb2d1dldkc1lrV1NDNEg3SGZvT0V2?=
 =?utf-8?B?aW9PVzlnR1dieVZPS2pHQXJLSnNTN3MwN2kraWFDcGhFcVVJM1E4ZzRXVmxu?=
 =?utf-8?B?dlVUZWRZQytuUWFjbWFya3JUSnNUaVVtLzZFdjdKWGR1QUdITmFBY3I1dzR3?=
 =?utf-8?B?QzFVam5nQTNBblNseHdkSEF1Q094dkpObUxNVTVNNmNvMktNSEdhbTljSU45?=
 =?utf-8?B?Q1VUbXJuemQ2NUoyY08zUVlUUFZFUzZpdDVlSGhFZ2paRFpSRXZYMnMzWU5P?=
 =?utf-8?B?dlpQTXR0L0JYQWE2Y1o4bkgyM1EwZUtnTkI2OE5QMHkyaWZnT2JuZFhObHF2?=
 =?utf-8?B?NGQrd2dLN1l2bGx3MnVOdUxrSXdqT2hJbjZNSGdCNmVJYmNmQWV0U1lqZC9y?=
 =?utf-8?B?aXB3ZFFucTBSZHhteVdFcTE5dzBkTjc4L01pVmg5ckY1eDVod3RGZGlGaXV2?=
 =?utf-8?B?K0ZYNFVnc2lDNEtFcnNkblBZR290TktkYWx3bjE0eGg2djBxQ0ZaTDZOandy?=
 =?utf-8?B?dHFlY0FjMWpJVHgyMEt6cVBUVW9VNGVEWVJISW4zV1F3dXVTa2pyWm5XT2ln?=
 =?utf-8?B?S3VCNTBOcEtLY2dLbmx4R1hPVm5FZDZXa2lCQm4vUzdtZURQVkY3OFdCaEY3?=
 =?utf-8?B?SG1JSmwvV1NmRzdyVHBid1ZHMEpTeC8wWjZzcGJRcnNsQXpJd3FJU0h1YmJB?=
 =?utf-8?B?NU1tdlVjMXluZmVoSG5iR3IxME81NnRic1BBZU5VVHZDTmFwWEtwZURIbGNQ?=
 =?utf-8?B?VUZVUWF6a1hFZWZoVm9MVkJ0N04yc1g2RzU0UVlrV1FFbSsySG53ZFdZd09G?=
 =?utf-8?B?V3FSSU4xVHJOcEpjVVZ5ZUR4WDVjTjI2QXpKckhOcnB6eUFZb1lwTzBSY2Ez?=
 =?utf-8?B?WFFwT01FUUNMZVNKazZsckNoOEJOaEU4UDNqakZiTWg2b2F0SmpwdnZuVWJN?=
 =?utf-8?B?VkpsajZxYWQ1VUF0YTBZV1hidndqTmQ4aVByQjNCZ295cUg0Y283c2xKaVBp?=
 =?utf-8?B?a2V1YXVBVVNMWEdpcjNocGVOemh3Slh1TDJIdGxJVE5WL3ltUzRMYjRjQkhY?=
 =?utf-8?B?QTI0Vks4MGlDcE1vRWQxaCt1SzlMSC82NktQdFFTNlBrSmo4ZXg1Nm9hWnho?=
 =?utf-8?B?RW92MExLOVhKZ3dmV0RDclZNYmw5L0RJRTFrSCtSZDAzNndXenhWRW1PTDcr?=
 =?utf-8?Q?tY+m6jau2lAICqqaiG8oZcVZmI/RAkidcUlMfvQpZb2X6?=
X-MS-Exchange-AntiSpam-MessageData-1: /s2fLMfqZJl9TQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75f180f-7e95-488f-f313-08de6dceb4f7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 02:46:10.1326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2l6NSROHs2/SPQmN4XpkzAxN10nRZ7QInss4EazLcARtU9/H3qMqmJ4ZLSDLUw5FEfo4tmzcRvuDQN0vejz7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9476
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 1F8DD148894
X-Rspamd-Action: no action

The `GspSeqCmdRunner` trait is never used as we never call the `run`
methods from generic code. Remove it.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index e415a2aa3203..9278ffd5216d 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -144,12 +144,7 @@ pub(crate) struct GspSequencer<'a> {
     dev: ARef<device::Device>,
 }
 
-/// Trait for running sequencer commands.
-pub(crate) trait GspSeqCmdRunner {
-    fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
-}
-
-impl GspSeqCmdRunner for fw::RegWritePayload {
+impl fw::RegWritePayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
@@ -157,7 +152,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
-impl GspSeqCmdRunner for fw::RegModifyPayload {
+impl fw::RegModifyPayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
@@ -169,7 +164,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
-impl GspSeqCmdRunner for fw::RegPollPayload {
+impl fw::RegPollPayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
@@ -194,14 +189,14 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
-impl GspSeqCmdRunner for fw::DelayUsPayload {
+impl fw::DelayUsPayload {
     fn run(&self, _sequencer: &GspSequencer<'_>) -> Result {
         fsleep(Delta::from_micros(i64::from(self.val())));
         Ok(())
     }
 }
 
-impl GspSeqCmdRunner for fw::RegStorePayload {
+impl fw::RegStorePayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
@@ -209,7 +204,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
-impl GspSeqCmdRunner for GspSeqCmd {
+impl GspSeqCmd {
     fn run(&self, seq: &GspSequencer<'_>) -> Result {
         match self {
             GspSeqCmd::RegWrite(cmd) => cmd.run(seq),

-- 
2.53.0

