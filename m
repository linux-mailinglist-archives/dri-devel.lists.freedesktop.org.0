Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB71AB804E
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 10:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CDD10E7B5;
	Thu, 15 May 2025 08:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sti4lCct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E51610E7B3;
 Thu, 15 May 2025 08:23:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qafFmUV/v8lISfW8Cr1Ps9kQOwz05k2GJ78ZgEULYx7RW/yQNKb6bk2L7nr4XQdcHny2Zf2d36QTX3D+FBuiUVo6awGrGmrjmmpse1YleXfyZG1MMY8LTPDTSjti4NuhwWk2OROXsaw5mlET60GP7r7Omy/fkpP58RuIDkBwUemcMl1rEwVkW++3WiFxg8fw0MFWdbzDWkszKNGaG+JTzdsMbddOFtB+eFAY2cJEnqDprdMFjqt+zQV0ghp14YHM1dRim+fPIkMeMxHcj06joquf43FNE6+oJ/NDmg9cmIK//hKDf6PHZ9t6gcI92Cwn837SMUL5bdmqdJnuAwB7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYBeAEi9yqWwXw81Or2UjntIxkgzl3l02YsHIFPGxSc=;
 b=LmVJ4PwptCgfm6btlMXIRetPgUMT5ucMjTEzjgc+SyIJ2S0+41kU0LMD6UQO4Vm2NmShXC0AduZZ3Sowj8dKlx9iWgF71GTv4jVXZFepMCyUY5kQ8/q5HukzTIaAsk2/MWsL8GfBAdG+O4CiEhq+zpS5i5nXIQDAISbwhV1IH0idwF+MgjcSDuhmnZzsM5P2XQxcXuY/kxPE1z2CClt4Mf6Rr8c/DLrFQNkwI83YUA8ZJl2M2ROFku9yUg39uAus4tpw3Kk0Y7GIl3BpSj+ELKE+vfj9clY4l7bMBYr1s4+OwqNFwnu9pQ261+gvj1OeakvtOS0xOJfMNiJJ82skjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYBeAEi9yqWwXw81Or2UjntIxkgzl3l02YsHIFPGxSc=;
 b=Sti4lCctWDFHQ2feDPmjl/OvR/UK3efQIW2GrfQv6gRS+Q2aQYIAzUC2wJrpLguq/cGi/9/BJsZXMx28vLCddZnLUsiEWmxUGfcKb4+JhLvZy7dOMKihSuIXIHV7U6nJa9WJnXXaH47jBhWfdvU+e4QZNsTe7Pw3bqbXMT+R3Vcbh/r5wxrnaswWK9vJOUREPkHqsc6ZX65FQcXKvprPqNY5ZEwlw/lXklTTsJO6FrYivGHhiIL4PCqW9gAYSNMYAIKugYSoxC6kvS/rwE/knFvSiqfxtcHn3f3r3iL5UNe+yqfryXxeP5p5vzFw4VwC4BH/HHP9gnrV8NfSGluc8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 08:23:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 08:23:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/3] rust: select AUXILIARY_BUS instead of depending on it
Date: Thu, 15 May 2025 17:23:17 +0900
Message-Id: <20250515-aux_bus-v2-0-47c70f96ae9b@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHWkJWgC/2XMSw7CIBSF4a00dywGEFLryH2YxvC4tXcgGLCkp
 mHvYqcO/5OTb4OMiTDDpdsgYaFMMbSQhw7cbMIDGfnWILnUXAvNzLLe7ZKZG7wZOLe9O03Q3q+
 EE627dBtbz5TfMX12uIjf+m8UwTgT/VlYrZRUqK6hkCdzdPEJY631C5507DufAAAA
X-Change-ID: 20250515-aux_bus-c9da900b7c3f
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYXPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:403:a::27) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba27614-8c7e-4836-1622-08dd9389c39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnMwa0tMMkdRcWYrZUh0V05sZ0VmMThlYXkyQjJPbkQ2dkFYYUoxOTJwRG9y?=
 =?utf-8?B?Zmk0ZjBpZVFBcjhhYU9sNTFQSVFOQnR1VkhwTVFtMDdzQ1N2bWVlckJXT2RH?=
 =?utf-8?B?bUhGeU12K01ncWw0ek9pNkhnQXhBYnNQVjdVSFNqTXpxMStKMVlLV1NBTjZo?=
 =?utf-8?B?b0NXUTc5cUhOaWxBQkhlWnZSVTI4T3I5UXY2QzRySS9IOFR2aDYxT09SOWZm?=
 =?utf-8?B?SXdzSUVoTGFJd2FHc3N0NDdsZm1DWFZSbkRlMnpVQXZLQnhGUmpPbGZDTUlJ?=
 =?utf-8?B?YnpyRXJYd3N0RlR5R1RCc3Nwd3NQcGZuSGE1Mkc5M1RkclhabHY3T29scTdY?=
 =?utf-8?B?bjBpTUp6L0dVZ1BZY0ZxNEdRQnRqL0ZaMVpZdTljUWVtVHJ5eUxiQWVnOGtv?=
 =?utf-8?B?bHQ4VVJJUVFwK2lMMklhaUJ2bktNN1dETU42WGtFNFM0S3A5QmpobWpyRHBk?=
 =?utf-8?B?czBVUkg1Q0ZoZHJpemU0dWN6SllrMk1lL2ZQVDEyWVZ0WElvbGREMU1QQlBV?=
 =?utf-8?B?Q1pWUC9HYWZ2YTFNSUNrMGVpMkpNRDdHVnVEcXRUMjlJNE5mSFZNRnU3OUF0?=
 =?utf-8?B?WFpBcEdYcWNBQXh5MkcyR1RqdmxLZnZibzlaWGJNVEZURG5PcEVQYTlWd01h?=
 =?utf-8?B?YWE4YkRManh5UEZyb080RlNlNHZuN3JVbXNmVGdwNktWakRZSlk1dDZlRnZp?=
 =?utf-8?B?d3ZCMVdUZmMzalZ1WWlLdSs5Zk9mZDN5d1puV2E0U1dwRkRaaVhadkVtY2Zj?=
 =?utf-8?B?YWNZR1lzRlh6VW1YNHlta01FdE5ieTN3TGdXakRJMUIzcDIzVW5UdXNEaDRH?=
 =?utf-8?B?S2xLNkl2RUxjZW9yRFlUZC92QU5GZGQ4M29OREJUbURCSGIwMmRSNEFXcStY?=
 =?utf-8?B?QVNKYjA4a1R0OFo0TlYraitVcVZWMkNTU0w3NGRGK3ZsV0JEQ3JONEhwYURW?=
 =?utf-8?B?a0hqcDZBZUhleHZOMmZjaHVQeUJmNzB5U0Z4d045NStVMURYb0sxeDBpOEhx?=
 =?utf-8?B?c2t3T29KTUpScGgzU0EwR25EdGU1VC8vcFZZNVdGWU5BeDFlV051K1lhcmht?=
 =?utf-8?B?MVF2by9RN3ZGb250ZUtTRDdQV0NZd3FSeGlzT25kZStvcEIwZExvbXNpdmZ6?=
 =?utf-8?B?c01nbC9QM0VJVkdsdVhRbWxiVDZocE8zd2tkMVh4WTRvL3gxNkN4U2M0UXhh?=
 =?utf-8?B?S3VRY2o3R1FRUlNwR0grUk9EZ1gwaTAxRFlpOGJuWkJSUmNhaS9ncy9UcVMv?=
 =?utf-8?B?Mm1QUVhWS3A3SHFjVVVjSmpDL1V0T2NhZ0xWUUJNQlplZ3BueTFrTjYyajg4?=
 =?utf-8?B?aVRrVitGTC9wREhCaVZwaXVuUWZPNFJFUWRxWFhKaE1tY0FYWE9xb1ErK0Fm?=
 =?utf-8?B?MDNCZFpMYzNvTkJtbWtmTUxzS0twUlJLRVgrbHllMFY1aEpaaGNZVGpKbmQ4?=
 =?utf-8?B?TVoxZHROTHBJL3lOLzNrUzl0ai9TMXBnemFFN3U5S3VONjl3MWc1QWk4QVB4?=
 =?utf-8?B?amlhbnRocVQrOXhtbExhM04rdE9WamNVNnNaZWhWUEg5MVFCMkg1bTNkbFYx?=
 =?utf-8?B?Q2dieGtBZ0dtK2dRelV3N2t3ZGZnMkxXc1IwZnRqSEtCRjR0Sk12b3lHSTJI?=
 =?utf-8?B?ZTlNeFBTWFE0WWppU1o5RFRIWElLMGdqS3U1d3BCV09tNkpFVUdkYSsweDlz?=
 =?utf-8?B?VnhEbVlKQ0d4MThMdU1ibkJFQzlTT0NvcUNGWmhITHF1dEVZYkx6bDdrQlpr?=
 =?utf-8?B?bXg2TlE4UnJWS1p5LzVheWNnaXRSUTE1dkc1L2NMNjFYcFFSbHozTkIxSGJK?=
 =?utf-8?B?aHBqb2dmQmZ3VVNpQTNNWXQzT3N2Nnh2Y0dQNGVFVS9MTUV3dEJRRDJsdlFz?=
 =?utf-8?B?TFIrUGkvdW1PZjJkdUJvbVlmYlQwazBML3lRRkdNVHZMOW9UT1M2TlBEQzFF?=
 =?utf-8?B?YVdDbnQ2cEtFTzZVNzZMbTgzclBVai9zM21KZzFjTGhTU3J2TloyN2JudWY0?=
 =?utf-8?B?RXVPQVh4VmlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFFpR0phdHJBOEFLbmEvUWRzcjRyUkNTUkNZKy9GUk05TW1zTlBsQms0ZGtz?=
 =?utf-8?B?ditpVXRreEppb3hBeEoyZGdQdkhUM3lxbHFFL05wV1R5cmVQZjM4aE9KUXJ2?=
 =?utf-8?B?SkZCdVJMVE5TU3NmK0RyV1E1d1BjTW5YNnlXSFpiWHpQVGFaWVNyc3hxNVlu?=
 =?utf-8?B?MzdUSHpHdG05Y3lFKzIxVW85NWs1UjFCZXAweElxOGlTNG1YUXhhSk56R0VJ?=
 =?utf-8?B?YzlzRnVSc2wwOG14cHF2N3Z0c0REZXVEd09hQVREbWdkSVR3UUVyMzJUZ0ZK?=
 =?utf-8?B?T0lqekhiL3lLNnp4dlpvQzduOTdRYi93aGxpSGwzVHNQbVhYUnZYL2tkdDVi?=
 =?utf-8?B?amUvOGY2aWNSc3JMc3hsN2VJazZnVytzekRHK3Vwei9sSG9tSTltY3hrZ3NV?=
 =?utf-8?B?Z2c0MEdRRktkRXVCZkNJNHJ1d3Jxd281MTdSOXJ5aFlGYWZlbDg5REppWVRq?=
 =?utf-8?B?KysydTBaemxhUmt0TXNWdkk2ZitTMXpycGE5TDcwVnk2eTFaNGFJZzlYY0sv?=
 =?utf-8?B?ZjZiSWlOWnBPU25PM3puS0lmcXpKbDY1STBYZzJNSFdqMkdhanBCdVd4blRU?=
 =?utf-8?B?UGxiZTJ4a0h5UWp5cFYxd0lVcXBMejVMaElIQkJUdlE4dkdCTzJLdmxrSGVU?=
 =?utf-8?B?a0dMbHQvMHhmMG9GRzFNNlNFeHNPNXphc1ArZStQMnZVNWltVkxpRFNWUVpX?=
 =?utf-8?B?VGUxOUMrdkQ3K2w3dTdZUlFqazNHVHFhUldleDVkY3ZJMzBKRWt6bnhyY3FO?=
 =?utf-8?B?bTc3OEtXTUgvdDBUaFc4bFlsKzFsZDVVQndmYWJyWDdGaXBPYXYrRkZOajls?=
 =?utf-8?B?YzlzM3NJTlBkckhqYk5aQ2lmd1VIUVBwbGpmcVpXNXJaV2krSG5tZnBaL3Bu?=
 =?utf-8?B?OXZPaWltNVR3aE9GSU1vWnJUUkdueEdpRVZHVEFPMGI0ZU1zQWRtYmdCQnRh?=
 =?utf-8?B?K0xhS2FBeFZaWW8rUis2U2wzenFUTUEyRDhvVWN0aXA4TkdYZHM5VjNLd1hu?=
 =?utf-8?B?V25oekhIeG1KSENBeE43aEdiUUdPKzRLTDBkUFhxSXVmZzFVMVN6K1JyRUVj?=
 =?utf-8?B?VDIvWlpheFhFdWl0TnppZnlrOGRuRmY3WWdaUWxCT01Pc0htT3ZEaXl4Y2Fm?=
 =?utf-8?B?SkN4eXFUZGFsQ0RET1NYR2ZvWFFCQ3R1T2k1SGQvM2hoR1piNURmN1J5OTJp?=
 =?utf-8?B?UFloR0VORWZVU05KUHh5cG00MEd1Z1NWaDBuaUg2VnA0MHh4U0VTQ1Q1dW85?=
 =?utf-8?B?QWo4eWROZ2lZZkRwaDMwRHduSStYUVgwdGFQYjhncEdrN2x5TzhpSkNxL29j?=
 =?utf-8?B?TStRZnMra2V2WFphUWd1QWFOYWQ2T2ZYSHJPak5GdlJ2R0wveVlNKzJLQ3JC?=
 =?utf-8?B?QXI5ZlFTd0VHTk1NSzZ1Wmp4ZEUzWTZrOU1LUXFUemFZenR4bGQvcmVUcG1B?=
 =?utf-8?B?OEd0TUpkQ1ZBYmFQU0xWUEYvcHFVTVFOSjFMR0VTWVIwL1dZTnhDNTJ3b0d4?=
 =?utf-8?B?WmxySGVqRVllMDRIU1M3Sng3RHZZUXVjRGcrZVdPNHF4Z0dpbTJURWpxTUpz?=
 =?utf-8?B?clFzMjQ0N0VDbWYvVkZCYm9LWklSdEF1ekNYSEFwZ2JRZG1HazNDZC9FKzJQ?=
 =?utf-8?B?cjZGUDVUdTNGclg5aVVwNlFab050RUE5Y1RMT2VtVFNrQmJ5UFZvN0YwMC9s?=
 =?utf-8?B?YmJ6aWpwQzJWZXBZUTNWbkNER1BJVVBYWGluU3AvWEJMQnFWQzVKVExWYTZm?=
 =?utf-8?B?V1kzK0tUWFZtSUNwQVJNYVlsaU1ydHR4QWlQcGRydGdLcysxQmV5amtCZGR3?=
 =?utf-8?B?bDhIbVpzcjA0N3kxYzlXTDJsNE56ajdWZFArWXZZZ3hLL3A0eGJ0NHdJOEtB?=
 =?utf-8?B?MWZqZzJqTXl4QTYrbElvem14UWczU0tzdDFrV0p0bEVSNUFtVHc1cy9Rbnlj?=
 =?utf-8?B?UmFzclJuOE9VN05hVjY5UVB6Z1RpRVR5WHpGNElWYU5JVWczVkkyNTlLOWRH?=
 =?utf-8?B?Uit3dldYbzR6WFR4eTlGcWZuVncxOUpXY2MwT1NsOGtoQmppMHdrak5NZW1v?=
 =?utf-8?B?aXh5SWZpOElCK3pRaDhhemhFbDFZWkY3SWE3R2FhWGEvS2xuai9ZZHExWTdz?=
 =?utf-8?B?bUJYZ1o3QU9YOEhYUVNvbXl4WGJKUkdmZHA2djA3OUV4c0hpSG5sN2lwRWNG?=
 =?utf-8?Q?sZCvNCITJxf4O4N5dMp4K4oDVGyUya7/Mk+MF6zXPOHb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba27614-8c7e-4836-1622-08dd9389c39b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 08:23:26.1653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DZ6gErDuhIHL+0lGBEusmnpUypbYE4qAVlLkhmd6Fv81IYWwThpaj+3jsaBhAVnGhRtjSWbXO6MnDAq/eqiHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962
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

I noticed this after trying to understand why my minimal Nova defconfig
was not selecting NOVA_CORE anymore and why I couldn't even find it in
menuconfig.

CONFIG_AUXILIARY_BUS cannot be enabled directly and must be selected by
another module. Options that depend on it thus cannot be enabled unless
a different module selecting AUXILIARY_BUS is also enabled.

All non-Rust modules using CONFIG_AUXILIARY_BUS select it, so it should
make sense for the Rust ones to use that scheme as well.

Btw Danilo, since the fixed patches are not in mainline yet, please feel
free to just squash these fixes into the original patches if you think
it makes more sense.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Added missing Fixes: tags.
- Collected Reviewed-by: tag.
- Link to v1: https://lore.kernel.org/r/20250515-aux_bus-v1-0-1781b54424e4@nvidia.com

---
Alexandre Courbot (3):
      samples: rust: select AUXILIARY_BUS instead of depending on it
      gpu: nova-core: select AUXILIARY_BUS instead of depending on it
      gpu: drm: nova: select AUXILIARY_BUS instead of depending on it

 drivers/gpu/drm/nova/Kconfig  | 2 +-
 drivers/gpu/nova-core/Kconfig | 2 +-
 samples/rust/Kconfig          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 61479ae38cb7bf6083de302598b7d491ec54168a
change-id: 20250515-aux_bus-c9da900b7c3f

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

