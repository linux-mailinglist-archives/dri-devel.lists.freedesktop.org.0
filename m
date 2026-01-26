Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHEjClvndmmLYgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 05:02:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185783CE7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 05:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F340810E395;
	Mon, 26 Jan 2026 04:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZMFHVc8c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010014.outbound.protection.outlook.com
 [40.93.198.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A430110E395;
 Mon, 26 Jan 2026 04:02:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPwao0G34+wUpyeWXQ5bMy8QY9p/bF+gW/XsMJ9D9yFYsKyImDeTNIxFY4fCyP/TtkMizqj1JDOoDcpS+oYI/QZYoXHY91B+YQCi6QLf7yw5kbQSBYqPK0FEZa1aw0mH3s5q1lxHIPz3Wly+wNaiXzSstKg9qJxSU5T+L4VCspB3Cvegeftrqh+pgLQ3Pg3g872R6tY5wrCqnLCOo6xUY8aCOUim/tq0eIZLaFULmzIuxq9UpL1NrYX7NJCPZyykXnzWdgumqllISKDZm6IRwLTXcLKQjAsGKdo/o+2UyHjhYtoC15PfdChSYe+tvGLBXQBDJinxjhhxUAG1xida3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0IOIS4Al1ZnWYj+xrCNFjfNI7Exj3KxE1hXPePH9wE=;
 b=H5JaEwKXzUHjvX7GHQzOVZrMz+HdGT5EMp1tGyqyGQqDj7XERORyCTVLImu8c7GeZN43T1BQObw9IhISPLhV2PPyg3rHW5eHiRnQLShgPrkN/IduvuVtx3OW9dkrOhKqJjxR0mO8lIKC7+FV0IF/rRD/+BPqZZgTFgVoCNfxouwNHCCIWU14yPf0mG3MOmcvXev6LkBpZuqmGoPlwgdPH7+NF4RuJyFWKG2tJN1PJUcFtjE3f3Qj856uipLXBDcvXB8ZJTvpC4PfJc+p+veKs8d3d4zCT/kHi9S/DHUI2IWVI2TgkYDJrs+vbVfj1oGq602Q7xkStMmjWfJ5xeug/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0IOIS4Al1ZnWYj+xrCNFjfNI7Exj3KxE1hXPePH9wE=;
 b=ZMFHVc8cVKZ/uXQXd5FwfIPFqm06ulHreaodjgNgJgy8wlmVsXJZUuIow4xORVId2Ik3sGKnDrab7NvhW+vuW1EdpOvg3rsFbhIlxcH2pruC7gHL5F+cbo/3+jKmN1F9cnfwynLaCBMFIotJWhttlUAdWvgMoEgvfRka/kxqABKUzi3CHF4aoV+FFFW+Ug0AftRDwrBO31aCBfS8hYbUIJ5g41mVUVzJnjzGkOAuxlImRsPx0qkJ5xrp5TCjniJvHAcecygdW2d79qlE69X2QBr88VaOLEimK1A07W7Ve65DYOb/S3sPteC4QGOzXyPIHJfIdIAqKCZ0uTgSvlaWeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH3PR12MB9314.namprd12.prod.outlook.com (2603:10b6:610:1c5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 04:02:26 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 04:02:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 13:02:22 +0900
Message-Id: <DFY803SR0JSR.3U1NXL7KHCGU1@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] gpu: nova-core: gsp: fix incorrect advancing of
 write pointer
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple"
 <apopple@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
 <20260122-nova-core-cmdq1-v1-1-7f8fe4683f11@nvidia.com>
 <DFW6JA3YWVBT.165YBPOMPL0KI@garyguo.net>
In-Reply-To: <DFW6JA3YWVBT.165YBPOMPL0KI@garyguo.net>
X-ClientProxiedBy: TY4P301CA0093.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH3PR12MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: fa941f6a-27e4-4f90-b3d1-08de5c8fb736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHR1dG1wMjRLamsvNXVmMldEbGZwbHlzbzA3MUVoeXBBN1o5MVJaUWFiT2Np?=
 =?utf-8?B?bU1hMng0OTZLOEh2RjVtcDZ3Q3BIekRaRlh3V1htWE1PVEd5U1g4THkvTWw4?=
 =?utf-8?B?K0tZRlZ0ZkpEd1BVVit5Q3dCYTlxK2dkZ0FuTitpU2JPZS8vZGNHRE5pYjg4?=
 =?utf-8?B?R1dudHZRaUIyb0R6Q3JzekZMSjFKTFQ2ajJNRjNlZUNQRDZTaGQ2MWVoT3Ri?=
 =?utf-8?B?Vnh2VWUvUWFIdk9waTFTdXlMU0xMaUFWYXYrMVRHNXUrZnBLTDc0VlBqWHFU?=
 =?utf-8?B?UFZoZWRSR0FUelgvWGhtVm56dFl1SS9ObS9nUDVOK2dmaTh0Qmpwb3o0ZUNp?=
 =?utf-8?B?dWdSdUNid1l5R0FTdWhGRjR1M1FSeWRpNnRFN1VnU1FiWHMvL0VWWlBnRUJY?=
 =?utf-8?B?QktpV0srZi92a044TDFqVjl6SlVRajR5SXBSTERvVkE5U2toTHFoS01xbFNI?=
 =?utf-8?B?Ym9SRWpNSUlESjBXK3BKdU9SYXJhd3FIWUg3UU9aQ0JIbGtxVVRzd2FjSlVl?=
 =?utf-8?B?cFZyamZwc1Q5T21HTm9RTjBhM2t4MTZHMmZmbnZhekV2cHFlZEp6Z2g3U0R4?=
 =?utf-8?B?ejh5ZFl3cGJTYlErektMQUdzSnM2ZmxwR08xeXZhTGZhN1p0a3ZFNzVON0J4?=
 =?utf-8?B?OFBaM25JVWhickg2R1VqaDE3WjNqV2NuNUZBa0tMN01wYUhQWW5yYzltTEQ4?=
 =?utf-8?B?b1U5K1lWRjVqYTNXNEVQbmxFYjV0eEY0RTAzdkJFS3gyeVZyTDJ0MjdZSzVJ?=
 =?utf-8?B?cGtma040V2JDaGx1U29rUXdtbjZLdUNzZElyTUdNTkIvTFZxbHB6NjNDR0VU?=
 =?utf-8?B?Z1RCMUVvZEJ5N1BvNTdwVkRPallLcFV0N1F4Q1FNR1JxcXVUQTU3YlBjNi85?=
 =?utf-8?B?TmZqeG95VzRObzgwS1d1V2FVWXJEVDdLeldDaTRXM2EzVFgzUVdhK0lNemZO?=
 =?utf-8?B?anhaekFzZW5pRFhHdVMwazBPZ2UxTjErOUY4SEtYcWJQK0RXOUdGT2FBcjFL?=
 =?utf-8?B?WUFKWFJ1RXhYVEcvYy9sWXBobDQ1KzNHWmZXWWluK215UlVFN1ZPZFJlMWgz?=
 =?utf-8?B?d1FtV0xqb1pOMy93QjN1bGQ5dDVTWVBYcUQzNXkyUTRRT2J4VGF2ZGgxL1Fs?=
 =?utf-8?B?VnFiR3lWTWh6aEpZd0xWSWE1djVUUTRRaXJ6UTlXTWlodjBqbkJWdzZDUUt3?=
 =?utf-8?B?N3l4THZ4emk4U3ZtRnlaMHpvclNRbXlCampDVTlnODRSMytTRGlSR25sdlJz?=
 =?utf-8?B?dlIwcWhPNmhUakxqT0RBUUt1SzBZdCtIS2RBNTJKcnNwc0UvSXRlWStqOFRm?=
 =?utf-8?B?bmZNbHhsbnpIcXI5TnFsMW1qM3NzTHpieCtUZjBSd2h1eFJwc1FVVytGQWpy?=
 =?utf-8?B?TzVudklxL3dOOXNYbFVoMVFMOThNMi9YSU9ueVp5eVdKY0RDNEc2NXVBWUI4?=
 =?utf-8?B?S2hUeHZsYUh5S3BibjNNNFhaR2V2YlhjNTloWThoVGI3L2RmMUhLL2cwMlZQ?=
 =?utf-8?B?end6L3N4STVOUm1EZTZPejc0M3pLallPT1VqVVo2eWxzaFJCOHdwV2l0RlU1?=
 =?utf-8?B?WFpOM1lNZFRxOHIxcmFISHhLVmV1Q0Vrb2lFbUtKTmhIMW9yUHIrNU4yUXpI?=
 =?utf-8?B?Zk8yY1ZsNVR3SVErTit0UHFYQ3lWL3N6QzNMMDk1NGtpUFdwSWFmbDJKNDNa?=
 =?utf-8?B?VkpwZGFDK0NLcVVVQUhVVFBUSmplNVA3RStPRTlyakxlT3JBTmdqWVhCSU1i?=
 =?utf-8?B?akRIUDhmak1BOUxYM3NHMGNtYXU3UWY0T1ZGNWh4OTJRWTRLMll4UkVoSG5S?=
 =?utf-8?B?a3BVcnpOUkt4dUtxeXh0STdvOXZIZEdGY3dKWU9uMnpoaUQwZm1uRUY2YXM0?=
 =?utf-8?B?bnR6MmtKT1RlaHc4TWdrL2dtSFhza0R3bmd4UE5uR0I1YmdTWWoyTFh2ejJB?=
 =?utf-8?B?TU9pY0phcUpIZEE2M3JkZWlVclVQRnZZSTQwQUFycFRrWGhaUGFqTzNtNWJE?=
 =?utf-8?B?ZGhYUm9oMmZ0YWRWYjJ0ZzUvLzlFUUR1VE5VQWd2K3pCSjZwcGZDMG4vNzdV?=
 =?utf-8?B?N05UMEp5TXlCY2dTTndEVXdlSENEdnY2UHd4Y2dBN2xCV25QWjViMWFqLzJj?=
 =?utf-8?Q?lqOg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnlOQ1k0MDRBbTJ2elMyQUxKc2lhSXNTbml4NHVPMVgyeXZXNnA2WkN2SUNn?=
 =?utf-8?B?a28ya29peUJ3a2JJdlp5a2x2c0pzRUxQNVdUS3M0RHFqdWZid291WWNsdTQ0?=
 =?utf-8?B?bStiZ2RwbFpPVGNxS2ZXTUc3cjRabXlaY1dTVTR1NUhPNkhid0kzN3FXVWts?=
 =?utf-8?B?WG9VTWV5R2xjSWhOeWVONnp3L3U5Ui8rVDYvMjloYXYzS1QveGJVM1pyYkVN?=
 =?utf-8?B?cWthOHRmZjM1Yk0vdUdCTHRuNHN3TjB5b1Y0OTdjREhjNVNoL0J2bHQ3ZTdw?=
 =?utf-8?B?UWkyUSswRkEyWHZBdGFVbExZNGgyN0EzSlRiNmhXNkU2cGFraEpMUVNlMVZW?=
 =?utf-8?B?dkRwdUlibnlIdzZaSkFTRGNSbzV5eS9PQ2l2UUd0c0VQVlljaXF0alE1b1pJ?=
 =?utf-8?B?VFFHb1hiaS9lbnE0VXpMYXBEWWlnWXd3S0t1TnRHQXk3NEppa1BGUlVxTTNC?=
 =?utf-8?B?YVZhQkN0UlBaaWJ4LzJxcFdEM1pXK1J1dm9GWUNaNWhiQ0pXVUROTTE3Wllj?=
 =?utf-8?B?aVNRd0RRYkZSS2ZRM1N4NXFteUVGS0ZvMGFnRHN4VXhnRldSbm9NRDV3VHdj?=
 =?utf-8?B?bHlMQnBzQmlEaFNtZyt3Vnl4Q1MxeUUvTVBrSjZTZVlaekZpVkpXRmJTWlRY?=
 =?utf-8?B?UHdKSUVyaXlCNWhyYmkxUFQ3Yjl0SU8vU2JJRG92aGptREhVRW40UEtoNXND?=
 =?utf-8?B?aDFuNUlpbmhzaVFsUWk1VmhvV1ZFR2w4UmVHNzFKNHR5NGRJZmNlSmE4UVRu?=
 =?utf-8?B?b1JHbFRXTUorTUZjakx4V2U4KzRVOFI4Zi80VnJrVE9jN2hXRmYyZFc1WGtr?=
 =?utf-8?B?c0tBVk96a0hlSlFldjVBNTRpOTAvdnZoTzR0NU5ZQkQ2ZGpOeUdEdEYrMEJL?=
 =?utf-8?B?SkN0Mk95QnJnYjVSenFTRGVEeUpPTHdaVFNYbFVnQVQvZmxUUzA4ZUxaa2l0?=
 =?utf-8?B?a0VOSjJtOUlqbCsxejYvY3Q3QTdUYXd1TzdRSHpvU0FCWGx1a2NMbmdZTTI4?=
 =?utf-8?B?RCtSOERlcjVBVHBQbldyNkd2a05UVWNrWlc2SldrMUYwbTJ4amo4dzc4bytQ?=
 =?utf-8?B?UnkwZ3dKQk8yb1czN1QxMHVUcWRNNkhXRkFNb1ZsR2cxN2d0Q2VLS0phVWtL?=
 =?utf-8?B?VVBCZnhwUERwVE1xTjFGQjBKZUMwdjYvQVZmamJFMlhXbDZLaXpDZTFDYjFq?=
 =?utf-8?B?bmJkV2VBQlV6bXpJb3gvMXJLdjV2QlpLajJHVUlQeDhacW1CZGlYbW9GMFR3?=
 =?utf-8?B?L2hsSFdVME9Dd1YzUWZxWUE1Y1NFVkQ1cG4zMWNPdjNYc05YYzI4bnZoZUN5?=
 =?utf-8?B?L3luS0RkcW9UTURJRW03SnpNR0o4ZkxWeUNXSVNBL2dCK29LMEhxVUhlQjBl?=
 =?utf-8?B?RWFOYi9KdXNEUWV4NFFqejRzVzNKckwwdGpETHozdC83T3JQdzBwL0xKVFB0?=
 =?utf-8?B?NjJ6d1RHNVY0TTJZNFBzeGNBSld5Szdxdm01UkVyaTBiY01KeUE5b1ZHeU9E?=
 =?utf-8?B?ZCtZYUZNTEpjKzVvN0s1TmNsV3BuMmxtcUU1ekphejl1UlVQcXBnRStQS2J6?=
 =?utf-8?B?L2daVWdTWjFVNHZSNFVYb0FCbmdCMGxFVWhZUTVkRkpWbUsrZGJTQURuVWEx?=
 =?utf-8?B?Y0VjTEpNdjBqeG1JcWdyRWxtWkNVc054ZzhDbnUrdmc5QkJnaVdONU5GUkda?=
 =?utf-8?B?R012aUVlN1FXcnRBSHRJN1V1NDhvSWQyTk5HUUtpM095ZUpwanJqbjZBTTJ5?=
 =?utf-8?B?OGgvUnkzaHMzejRmVU9ZS3JvUWZRM29UY3JGOVlOd1NrV1c4YWRzVVlkdnhu?=
 =?utf-8?B?M2xzamN6N0tDMXc1SndCLzZZVTJDUlJUTzdSd3htOFo4Q2MrV0tkWU1RMlVq?=
 =?utf-8?B?MmprMjhRa092TkVpcTBZSWxpYjJUVC9UWXZFRGFrc2lFaDZaTlJuMEhNanM3?=
 =?utf-8?B?ck9NVUlSQlozYjZrRVFva2ltQ0gyT2NRTWlTTHpTNVF2WVN0cWdhWTB0cTg1?=
 =?utf-8?B?amdCaHdZOGJLZjVyUWVBdVZWeWowem9INEw1QmpTbmFGcWZVQWVSeWxoMVF6?=
 =?utf-8?B?UGVGSjh2a2pZNEtpb2g0ak1VQTFaUnFRLytUYlNhRk5DSzJNMnBWeUtac3Ju?=
 =?utf-8?B?OGw2YTl4V3gyaEVOWUNZTFFEM3ZTVVZ5RnRZZ0ZRT2FMUk11anNSenFMSFpq?=
 =?utf-8?B?MndBYlhET0w5am9iTTlSajNPKzVqc2xqQXdYSnd3Ync2SGU0dDN5RDgra1Bu?=
 =?utf-8?B?VHJITmJEeFhMU3NLWkxGclozWE5PL1ZLMVlDc1ZFekEwQS96QlRkd3JjcnR5?=
 =?utf-8?B?K3JTcnJBcXBNYytTWmlWYkwycEd0dmRHcG5zSWVhcTZMeERobUZjeEc2ZzZt?=
 =?utf-8?Q?HP6DKlw3N1WvmQBgzvZn5C3O3NuCnG/bT8H/UK4HSBhPW?=
X-MS-Exchange-AntiSpam-MessageData-1: 9TS4ErpOwCA+Kw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa941f6a-27e4-4f90-b3d1-08de5c8fb736
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 04:02:25.8720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SAAv40DpW4/z6CMvfxWYOMfHkrtHkqiNJNVzgFOtI/ASOBYIdNHq0fW5KnbL86BcjmiljCW9WybOidvlRFXoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9314
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
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[garyguo.net,nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 8185783CE7
X-Rspamd-Action: no action

On Sat Jan 24, 2026 at 3:28 AM JST, Gary Guo wrote:
>> -        let wptr =3D self.cpu_write_ptr().wrapping_add(elem_count) & MS=
GQ_NUM_PAGES;
>> +        let wptr =3D self.cpu_write_ptr().wrapping_add(elem_count) % MS=
GQ_NUM_PAGES;
>
> So the actual number of pages is indeed 0x3F, not 0x40? That's interestin=
g...

Yes, that's right. I thought it was weird as well, but the reason is
that the first page stores the rx/tx pointers (see `Msgq`) and the
remaining 63 are used for the actual ring buffer.

