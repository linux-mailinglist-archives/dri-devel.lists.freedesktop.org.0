Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOeaCiWSeWmOxgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 05:35:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D069D039
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 05:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123DC10E228;
	Wed, 28 Jan 2026 04:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BEP2gxDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6335C10E228;
 Wed, 28 Jan 2026 04:35:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4dmZH7sJGiVeTVzql6/MmN0WH60PL5I1X2LykgM/4ERnd/iaLAOD/myVsh96Fyv+/+rO3S7wrqdFY1UDqyDz6LYDN944FuMpuXSGOQ6FXQj4fuGMEM3KI+TTPK2YjhSbTL0H3OKieyZpq4C4qTTq9ImjX2BPHiSQ8N3g7m+cd3U3gsfdYrqMiEAB2A9ounuzqjyeOl2i5GAw6iaZEBj4mHVcMdhF98fxCh+emXzB/VrR6OOgGVTUrWUafyGTzhewc7mzk241PrK0QREdKguO9GFrfSYeIN6DyytV4PnY5fnxO9hTXE5od/DFQArqLheOa+i7waAvX7UnFbTlSULqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFFjNnAKjo/hyhs6dMIsnUMrYYop+DSDnIj/dhYzpEo=;
 b=i3AVEj5hbqpCTaDVyKd86OHuXZvfs+l6WO0FXTxad/nmsy8Lmh0Ommc9x6l7gU0LVck12/jirbhKaM2F/m5teG8IGe2HPodzltKSuNpA+p9Y5moxJfQTsuYiu2VM4qpDj41gM9Rj69cxcnDdNFXcDuOEdnp/wmp+LDgs2kbGrIDvl4yqB9mZagVCN9ubacEQf0AcLiUgM8SPQDkRPDi+40mDDo2Dya3WE6lME5QxXIFkjLrDRmBlkzyaf1sc+whKu/crki1oqdff/DNw7/ksZjYSlYtDosliIXxkyzRgnnKESCjjvTrNs7QxeoAD0SRhVZXHO/BjujRJBbwQEP2NCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFFjNnAKjo/hyhs6dMIsnUMrYYop+DSDnIj/dhYzpEo=;
 b=BEP2gxDANv7rvLKMgeMAE9ZktUXDiwdfddglSZ/KwgRMTWIjsdzan9/Dk38w5fzaUgnsXDDBhZDSHZNUpAgDwQFZmcbD1YXQ92S3uzs4DrzaPu1EwB7A0d7m3X//F1mmBz2qnVW3FglpEJX9quVn7OUmf+8vjIGtlU/+6ylrnw2tpRrQFrriSQoRcpmL2EyxN7GKaQ5/czyb6AKyJzscWb57QjuzAUdwBMI5f/n5LK7+4JgQKvDiUEyJmJ4Oy0zzleP1aeCRtjMEGPwF7Pi5Cf4pVdbPTj9aXqZ/6tsyGwnwZ2gwhuXSLkVVHa4xQFLLUf4toNVAsiMbpWx75edlFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MW4PR12MB7286.namprd12.prod.outlook.com (2603:10b6:303:22f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 04:35:39 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 04:35:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 13:35:35 +0900
Message-Id: <DFZXYMSS9OOI.5NUPB8GCHRKD@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: clarify comments about
 invariants and pointer roles
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple"
 <apopple@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
 <20260123-nova-core-cmdq1-v2-2-e797ec1b714c@nvidia.com>
 <DFYPX3TNI3Y2.38MQUIWHHR9Z1@garyguo.net>
In-Reply-To: <DFYPX3TNI3Y2.38MQUIWHHR9Z1@garyguo.net>
X-ClientProxiedBy: TY4PR01CA0104.jpnprd01.prod.outlook.com
 (2603:1096:405:378::9) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MW4PR12MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: a90cc780-a4d1-4345-a58a-08de5e26b03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1JQTVRjSXBpTVFEVWl1RUE5Wjhyck9zRm90c0dlcFhzUXFUYlZnVkV3bnU1?=
 =?utf-8?B?MlJSQVVwQ2ZRTU5mQWJsSmx3ME41MUNyeXhqNUp1U1pyc1A2UHJXaWRHZmNZ?=
 =?utf-8?B?TnpDaVp6bEhEa2ZkZnplYjZNb3NscE9mNmpqazVZZE9WdThKdDMrOTdrby9h?=
 =?utf-8?B?YVZ6L1FBNitvU05rZEJCU3VHY2RZUUVDUUtYMUxLaFZ5MEhSem1lWUNSN0tE?=
 =?utf-8?B?M3B2T1VGYTQzaGFCUGxmNUEvY0dpbEl5cklwam5BdUNYTUp5emtsT0xmY0pp?=
 =?utf-8?B?ei91b2laZHlsM3FqRXBTdHFNVGxEVTM5eVlEeFVVc2JjS2xNZVQ1VEVaRGJ2?=
 =?utf-8?B?ZktnaUg0dkJWT0E4L0hac29JNUhDRnhZdzk0N0x6bElCRkNmWStzQXhnSTgv?=
 =?utf-8?B?NXFQWnlMd2NvckJsbExkcUpzdUd5anhQbTdTQlVhL2hLWlZMelNWYTFPTGtt?=
 =?utf-8?B?OHYwK25wdDh4Wmgwc1AvaXlUS3JsdEx0a0cwWlVXeGIvcFY1Ui9pMDA5MjVD?=
 =?utf-8?B?cGgrakhVSlRzbW5hR2tSQ05DUXM3WlRtWVdxbXFxdVlBTElnd2JZVk02MDR2?=
 =?utf-8?B?QmdXODFUTkdFRjNWNXpCS20wK1FWQjVRb09lSEp6TWJKWGhhTk5qN25seTNL?=
 =?utf-8?B?eDdHYUJaS2JlTXVFNjZTaHRRNjdVQ0EvRU5BNTZ0YWgrWE55aktBYWF2M2Jy?=
 =?utf-8?B?a0pXSkNYSFAyUStNbVFnelNwRjRIY1NtR1YrWVJzNTBJNW9pS3g3NzdxRlJs?=
 =?utf-8?B?ZXhkTlJFdjFka2ZRdjRXN2k0eTJXeDNMREhFcHBiTVpFa1BWbGY4UXMrV1Yz?=
 =?utf-8?B?QVUzb3Z1S25mMHN3dkkrbzM3NEhlZGtqaWZHWFhFa21sc3VTa1czang3TEdO?=
 =?utf-8?B?OC9QM3RxZmk5QkkxRThCeVh3RDhoMDdQRndXUnZSMkZWcHZIRHM2N3AzMjBC?=
 =?utf-8?B?QTRscnRoS2VXVlkxcEhVVU1RQkN3YXBhUjJJb09ZNEw1VlpOdkNrbTNSNkZN?=
 =?utf-8?B?TzNHUFh2Q2d6NGxSaG9qZWg1NDVac1dqU0xCcUw0L251QW5Ha1hGbnJ4aGt5?=
 =?utf-8?B?MktUK1krcllIbmZDc2w1ZEZhdWcwOUhYdTZKNjR1MkRSWU9YUEEzTTJ0VXgy?=
 =?utf-8?B?dGZ3OUR6cHo4RVFIUFcweXpmeWFiTExmSDNjQ2REbUtyOEVvMko5eXRvbFlJ?=
 =?utf-8?B?YkhubE9uNFBDeWZ6ZzkrbUcvN3hDUWhPRmRSUXArMzgzNWZONDVTTGJ6WnhR?=
 =?utf-8?B?Q1pQaDNBelc0OVdOUUhGdmJsNjBHOGkzdmVsTmtRWlN4WFZISGpxb3VHRU9j?=
 =?utf-8?B?bVprSEpCTXdsY0JETEpReExXNFUxRHJPYmpZTFVPcjljRjZlazRBMFZoQ0VI?=
 =?utf-8?B?TEpLYVFwdUJyeWxaUmlNTElKb2NRTE1XLzA3eW83TlNMaE9FSFpWOXYzdFVR?=
 =?utf-8?B?UHcyUitncndIT216VjJQRzlSeWpnby9oWDJYdjFqdEdVdEYyb2xiZUZKRkF4?=
 =?utf-8?B?dmZDUi9Hcno4Y3ZxKzZqT1Yvb21rZHZxckFpYkkvVE9EQ1dWMzdjSndWQlBz?=
 =?utf-8?B?dEJnbGhvb1ZEdUs1MVRVTjlwQnI1SG45dDZYejU1SjVFS2pINVRKdmo2c2F5?=
 =?utf-8?B?aEZlSGptdUQ2ZWpJNXkyaytYS2N3UXFBelJKQVJrTVdRV3ZCOGxRUTRXbFFo?=
 =?utf-8?B?YWw1dTdmS09jOTZKRkE0NFhmK1o5MmpIaGt1ZUxxM1V4cFZCSzBFMDRPZnBW?=
 =?utf-8?B?S3poaERPTUN4TmZCZFB0RDJ6bXFTRXMwc3ZrQk96dDhUZVNrVWZKaDFOMVFC?=
 =?utf-8?B?WnQ3anRRRk55TUZ6RHZGenJ6NncrYXdYWG5yL0RQc0szZ0JKM2pJdWQxQTB6?=
 =?utf-8?B?MVA3Sjh0WTVhek9jZ1ZMMC9hcHV4ZHRDWnViQWxyZVVSbGczZitCMmRVcEFR?=
 =?utf-8?B?blZ3cE1VRXUrdzB3NndOZXdlU3JYRURjNmZkaTNyM0N0M21TRkYwcm5jbVpD?=
 =?utf-8?B?ZWk5alhNTjJNY2ZFZ3pVZGN3bTFtN0dhdk9vcUlReDZhZzAyTUV0UVowakNC?=
 =?utf-8?B?S1BxeGhCbHEyUERsYmh2UEkrU2xST1dxamg1SmdpaUtvYzdaUktaOXhBTnJm?=
 =?utf-8?Q?pmJqvsDJe+e3vzMHojTTkPTPp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWtUcUZwZEpUSVB0MXhWM2NPdFhEcXZBMVd4eno3RnltWHFPNExVTCtLMTBp?=
 =?utf-8?B?dGpmNWtwY1FPS0M1NVVSLzN3b0N0QTNpVFpvUlVEOHppODlTTitUdkd4WW9u?=
 =?utf-8?B?Mkt5dXNJcXBlZmN4a3FwaUd6RDcwVHNSNnJuL2xUem9LYXM2LytwM1JMdWRk?=
 =?utf-8?B?Z2xSeG9rYUpxR085T2h1NnJsaEhHS3VnOUR1cXIxM2N0cGR5NzNBclhMYnh0?=
 =?utf-8?B?N1FZSmIzaGFuUFNkVVFXbTlLY1h2WmlleExEUEJSODRCMk03dlNmM1VnNWFv?=
 =?utf-8?B?M0tNSDQ5eElZK1ZnUU9DMGlqRGJRcEcwN2VMdVE0dXJ3RHo0QVE0Y0pTTk1l?=
 =?utf-8?B?b2dacVNRMGtqWjdKUDlBUHZGZHB0NkZ2Q2trdVRqblZqZVlPSDlNVVI4c3hu?=
 =?utf-8?B?VXVTMXhKVHdFM2p6ZFJML0xGdWVaTGtGYjV6aTV3ejRJajh3THFnWFJWSHVi?=
 =?utf-8?B?N2VjKzJRMkptWmNqWk5VMmpJVit4V290d2gwcy80NFd2c3djdUxzVVN6cmdv?=
 =?utf-8?B?UmhHa1ErVlMyckF2YVdZUEdKWmVqL0V1L0sreVFUTzNzT1NFTy9Bam94d2lR?=
 =?utf-8?B?YkRPOTVOcm5va1JXSThzaGVZZHp1VDRudkduK2syQmJid2hpemd6Sk5Gb2dw?=
 =?utf-8?B?cFJvN0pwT1Q5dGcrS1BId3V4ejYyNm80SkpBV245dXdZR2FGbUtpV0FCd0lS?=
 =?utf-8?B?dE54a1oxM1J2TkR4KzhOL1IyOWNONE1XbmQzS1U3SjVNTW16cTd0YmFEUDc4?=
 =?utf-8?B?eDI4TjBzNDc4RWRjYWJBaTR4OCtRYUZNVUFmUjZ2aTk2ajE1WEJGbzliaDFM?=
 =?utf-8?B?T0w4UjNLbjJSb1NVTmVydkQ5d3c4dUlOaWNtTmo3V0s4VndFMU5YN0pRZnZJ?=
 =?utf-8?B?Z05hZ0Y3dzRSeWR2cGZpbmxaQ2gwSXVTNjlabUs0MG1CT1I5SFF5bU9CaCtS?=
 =?utf-8?B?clN6dklTcXQzdXZOb2M1dlFnWTR2RVFpejdCOFFmazFaTVdsZmJBdEZldmI1?=
 =?utf-8?B?bGRUYjFmc3hLU1dtSUk1RmZaYVdFNDhFeU9PSHBIUnVCVlhKaDRQS2pqVTZW?=
 =?utf-8?B?YVZJcEZRTzN0NlNJamx1aUtOSVEycFhKWExzNVExaWdpRkdwSVU1czI0cnRl?=
 =?utf-8?B?cE04L1lJWURKckF1TDJEQXMzVDByS1N5Tk10ZDhyblZOMDI5RlZqOWF0L3ZY?=
 =?utf-8?B?Y01tZ0lDSDltbnB0TXNuN1lwbUw5ck4vRjJaNUUxcEFVOHJpdnpUTmw0MHZz?=
 =?utf-8?B?M2cwZWgxTE9WR28zTEhlaWxxcmg2WVUrRi9CaDdka1lhU2NDTUxXbnRxQ1Jm?=
 =?utf-8?B?L3kvdEJXdHlhUUszZUhmaHY1TXRlc2NvL0tzVmQzSmNhU0xqSzVadm9aN093?=
 =?utf-8?B?cXNkR2pBazBpUFVsZE8xN0pQZ1VKUlJkaUQxL3B1UHppOGRTdUJlUGFNYjVa?=
 =?utf-8?B?VVZRcFZuN2g0WmNFYVV4N1oxQmlTdXRkOHF4SGs5bCtFVGJEc1lSby80OUxa?=
 =?utf-8?B?Wm1QZ2M4Um5aMDVvWUtXZlB4eURZd203Q2tmQXJ3Z1dvYXdzNjA3ZVRWT2wx?=
 =?utf-8?B?aWhVdXN5R3lVa2hnYmcyeU1vVkJkaGpVNzZ6UXRTOGtMVFZocEgvQXNRd3JP?=
 =?utf-8?B?bDFTUkxZM3JWbDNMOGFvbWJvQU5YbkR1ZnorQkw0U0FqUEZ0eHkzSWhCOTJx?=
 =?utf-8?B?dmFIYW5FY3JuNlZhSHpKQjBEbEtLd01NSzJPR04vazVFRzA1Z0kwcG4yemx5?=
 =?utf-8?B?UjhQUDFHVDRKT3hhb3I1ajZrU2ZSbEdoZ0p1cmE1c1pDOVNkVWpyWmdPc2o0?=
 =?utf-8?B?UXRYNXV3bWx0d0pyYi9YblpvaXpiQ3NDUW1Ec3g1WFlVcW41L0xFMnQrSHdw?=
 =?utf-8?B?Z0xURjhNY2VxeEMyYkJ5NElQYWwzYVl0eU5LdzdIZ0pwV2w5NXR5RjZ5eU1X?=
 =?utf-8?B?TVE5VHFSQVErb0NhSXhNeXdqaW1mRm8vMk1NZzdTc2JxWHg4WG9CYTJrQ0k2?=
 =?utf-8?B?NUM5WWlpTnJNMXRyZndVVzY2NGZ0SFNQR0pyUkNJWkhZdXdPMk5mMmk2d1JY?=
 =?utf-8?B?WTZUVFNzTFJWMTQwMVBKbEROUkVNK2tRdW9mRXpnYmhZbXNDeC9xT1NXUWph?=
 =?utf-8?B?aDJsb1pQRnZOblo4d1hqSDZ0aDhXWUszR2phaGdoSkVWV2c5L0dHLzYvdnR2?=
 =?utf-8?B?YVlwMWNIaDNoK05Vd3BEampVZVFrN0w4QnBOeGV1VzhzUSs5R28wKzB2TXQ0?=
 =?utf-8?B?dTc2Qm1yMVRlaW1ydVA1NmlwVUhWdmdNMTdXZDNOYlh0SU51c0JoRTFzbEJs?=
 =?utf-8?B?NUd6TnJ3d1pvUTNDRUlYUENyclhyZEpUVTg5bTdBYUd2Vk1MZ2tVcUJNYlZZ?=
 =?utf-8?Q?8QACei4+Li4IJJN3HH6PoBSKFDRs//iTXNU+z13wGcITf?=
X-MS-Exchange-AntiSpam-MessageData-1: 0/cLxsx6ck6lUQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90cc780-a4d1-4345-a58a-08de5e26b03a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 04:35:39.2994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FttLfaCunqbd7mRkf4jbxS5CXZ/Jpjq8Ry77ajF74evVNTE2YrOltgJZz6PrcBcZ6avG0+r3+sd+fK+v75qsug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7286
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[garyguo.net,nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 62D069D039
X-Rspamd-Action: no action

On Tue Jan 27, 2026 at 3:04 AM JST, Gary Guo wrote:
>>          // - We will only access the driver-owned part of the shared me=
mory.
>>          // - Per the safety statement of the function, no concurrent ac=
cess will be performed.
>>          let gsp_mem =3D &mut unsafe { self.0.as_slice_mut(0, 1) }.unwra=
p()[0];
>> -        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `<=3D M=
SGQ_NUM_PAGES`.
>> +        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSGQ=
_NUM_PAGES`.
>
> Can this just be `tx < MSGQ_NUM_PAGES`?

In previous discussion[1] it's been noted that it's important to
explain why the preconditions are satisfied, not just what they are,
so that's the reason I kept this in. Happy to hear arguments either
way though.

[1]: https://lore.kernel.org/all/CAH5fLgg0O=3Dt2T2MQH2hvm4eZnCOa_NffzRw=3DX=
ZPi9+7+=3DXsmRg@mail.gmail.com/

>>      // # Invariants
>>      //
>> -    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
>> +    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, in=
clusive.
>
> I wonder if this can be `is within 0..MSGQ_NUM_PAGES`. What do others thi=
nk?

I think this is very reasonable, since this is part of the rust
range syntax so it should be understandable. I also considered the
mathematical syntax `[0, MSGQ_NUM_PAGES)`, but not sure if this would
be conventional - it does seem that this notation is used in a bunch
of places though. Will apply your suggestion in the next version unless
there is a definitive convention for this.
