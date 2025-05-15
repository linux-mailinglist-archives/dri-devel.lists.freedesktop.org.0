Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C14AAB88F6
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 16:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DCA10E8BE;
	Thu, 15 May 2025 14:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hzoBsLUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792A310E8BA;
 Thu, 15 May 2025 14:11:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+/8hHRd9TdCno9PnIK0hkamg/5NbD0R7qkKxzOcdEaM3Ga16bpQS+ma0LiHRX57LfkDVoG7RiMSeBtUZLAS6DmMm8zgCSm3NMilQmhZoJb/NNxkDYQZminfKOOiLzO+/y/Q098dztpwwjscTr9Z5I4mO3i0XEkPoUnlIm/LwqVqTsjoV/BnmtoFD21iBIiyV73eDs8yUCHprF/9za9+ffWdFgiQCc7l7396SS3VBJFGyYwgSim3UKU2mComAYP7SztLgwhAxS2j/TyVMfwWpq0x4xfqzAq6kkCTv07vE6R9d9584IIylFAJwxSuGObFntOawTEf8G7BpYLmjs+yPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ODjFYu2p+ZVpfRpOE8Fz6WnWmOYgnnj5Er0ZlMhV74=;
 b=bjS0Sxre4mSAOoH+dbSTOFvI1LKBknWFZJLi4+/0cPAdr0TWmzyOFxhXyIgvV4259aqvO4Hng9uBN2EKYp1TFpVFx2m1W4tHF2dhMBvEDCU5pOUj1+vN9ua2IswLvEOHxlRpkRVXvx+9yOuuFTdmxQZroOcObfOjVX5ymnGv+jQHqNN9KLKxkd/kC9EB3zDSjQjCe5mRJlfILCYRn+VHx5MOfEjVxRxJuuK5+QaNlirZK37nxBKb84qAdAfJpk9Zr1NCWDYab3BKZgRWsHLjuUvYzCd8fXrvM505PWUbu4xYcKDjseCawJfDQcp/G2bw/+ofzVxQS5Y+OpqgGaR0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ODjFYu2p+ZVpfRpOE8Fz6WnWmOYgnnj5Er0ZlMhV74=;
 b=hzoBsLUPSPI4Wx7IZbOB6sR/u+C4EaPkTTiKscY0a0IAcT2H5m/WICKgOZ08I+NUS5hwgzqKz+Tp2G8TFbOuOhzjNXycTW0ieyytnsCiwtw6DShQaZN+vco6evlbHlgY6WmqAzcTjHyHmr/RDP6o4Xfvp4N74grUNUq6S30LO/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB7758.namprd12.prod.outlook.com (2603:10b6:208:421::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 15 May
 2025 14:11:02 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%6]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 14:11:01 +0000
Message-ID: <3bbd4bd7-7217-4a14-b7bb-383226f44f55@amd.com>
Date: Thu, 15 May 2025 10:10:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
To: Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>,
 Misyl Toad <misyl@froggi.es>, Xaver Hugl <xaver.hugl@gmail.com>,
 Ribeiro <leandro.ribeiro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <o4MtjqyDUjuFR4Y9Q1IEZlvVQ7Nkggq0v-KtBcH0aM3pTvEq8UcSoUDxefSBVdTmLj_1_a6GmbjU_mRSFinOb44B4bu1u3mMIckuQhhZWCc=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <o4MtjqyDUjuFR4Y9Q1IEZlvVQ7Nkggq0v-KtBcH0aM3pTvEq8UcSoUDxefSBVdTmLj_1_a6GmbjU_mRSFinOb44B4bu1u3mMIckuQhhZWCc=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::16) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d981c1c-5e2a-4f0c-d4c7-08dd93ba5287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVhjV1J0RkhRMWM4eWgyV2J4Mm53K0l4d0gxZ2Q0V0dHcGZnS2kvbHhHdk9W?=
 =?utf-8?B?VGhGbFp1Vi9FT0VDL0xSbDBXZFdKVE9YOWdWbGhEaXZ0cVQySU1pWVdMK3M3?=
 =?utf-8?B?c2I4YWw4cVA1ZUl2Q1JubEFVMFVpSHM3VTQ1WXNBdGlnbUFPaTA4T2N6ZFNU?=
 =?utf-8?B?ODRJQzRiZ1d2R3RqRlRFU3hUcW5VVlZNTFBYb2E1ejgxZnR0eDNNQUJBdThN?=
 =?utf-8?B?cEZoZWE3Z3RxSFpqNWp6dCtoMXQ0Si9sQWoxWkJ4ZkwxOVQyR2RQbDZNTXV0?=
 =?utf-8?B?NFhteGxaZlRKenRneG1jOVBDRW9kam11T2tvLzVvM1hFbXFtZEFOeDY3VlNK?=
 =?utf-8?B?bDhCK1RWNDdJRkFiWUVQakx1dXJGbnF1WmNsTFkwdUMxQ05hMVRpYzRTSG9K?=
 =?utf-8?B?TWw4RURTcVJqZmhhMlNFUjRjTkRHQ3hmbXQ2SS9hV2c3UnpsTlZ5OTN6bTRx?=
 =?utf-8?B?VjlrOG8zcTNFS2NLZVQxVHhWOU5qb1JVYnpCQVRUVzN1NkgwMGxFRHR2aEgv?=
 =?utf-8?B?YU40VmtzZ2RvUGs4YUtkZjYzMkN0R0JpVkVpc0RGdjM3S3BkY2ZwQmNVZ1Jk?=
 =?utf-8?B?K0xJT3lBbHY0WmZFbkcyc2JLT0dndk1VZlFGRFhWNzZDeHE3SXc1Skg0eVlo?=
 =?utf-8?B?ZGZsMFVkK1NJWlUzSGVVa3JuUm5CNWdLUy9qTlVBaDNCRTR6K0ZhS2lzYVdZ?=
 =?utf-8?B?b2h0NUU0T05xRkdBTEp4SElNMUs1NERvbmNHVzhXMHJmbVdFRE5BUFJiUVV6?=
 =?utf-8?B?dkpVTkhVSTVTYXZUS3BEdFpaWUs3alF3KzJmUGhxVWpodU9pbGJKbGdtQThm?=
 =?utf-8?B?TUFVcUxhbURkM2xtUlgwTlJhYUZlZ0QzZ2hhMlI0Y0ZtZlZtTzFCOE5Ba0tP?=
 =?utf-8?B?c1YrM1JBL1FWQm5sbkJpT0VrUmRPVzJCZlo0NWwvNTIvZjZVQ1NSK2pZdnRN?=
 =?utf-8?B?V3dmYlFmTVVBWHJRMkUvSnZJeWREZisySUdoMnA5d1NzNVJVamdUQWg2eWxS?=
 =?utf-8?B?S21SWm9qaXNISDFxbGxsN0xMWVU5eWpGVTZxUFR4SHJ2NFUvZHBvbWxaV255?=
 =?utf-8?B?NFhYZGJsNDB0Q2JkTzN1aDAwRUtHMU1USGpWbzN1YTYvdmhlQS9WUTlmNmZk?=
 =?utf-8?B?eWM1YzIyRWZxRmFwYXRlOUJ5SVFtNDcvM3I0djJZRXhrYmRJZW5rS3ZPaTdR?=
 =?utf-8?B?akVvWlVhNERka09QcHNHRkYxdE1iK0dwU0Y5cVp1UlZEbS84NU5ubS8vVVJV?=
 =?utf-8?B?TWFGRWNXdE8vZzZEcU5SZGN6aEZkV24rQVYyRnBiaEo2YWZYdzR0WnV1b01O?=
 =?utf-8?B?M3BrdHZ4T2dQN3VmWlBYanU5djRObytiWno5bUFoays2c2J3Q2dsYXhnQTNX?=
 =?utf-8?B?dmpYVkpISDZaNjdlakRaNVFuQk9WQUppd3lHUHB0bktOTmVTR093c0J5TEo4?=
 =?utf-8?B?QzlUdEJBQ0Y3ZmVjOXdUR1lDNmdxM3JNVjFUdmkzVnBKd0I4K0VTL3NiQ0dk?=
 =?utf-8?B?bytzRnNRNzVnT1RnU2dDd2VxcXNvVGdxaWFTdUpFdDNvb2M5bjlnR3h6c3BB?=
 =?utf-8?B?Z25CZ0ExS2l5NmVhMXBUSmEyaXRUbW5qTUVaakxZei9qeHM3cVZVQWNCS0Uv?=
 =?utf-8?B?Snk2WERlRGFMbUwxZHZxMUJ3anNDZFNMUHhoSlZ4dzJ1Tm8xTjVZRk5PVVpZ?=
 =?utf-8?B?OHpPcEo3OGxYU0h3cWFrUmlwSmdQc2lRZlRDUEJhTTI0TytvQkg3MWlpcW95?=
 =?utf-8?B?bXpaa0Q5V3lvOCtGck1IYlRvbENYNmdXc3I0TTV6UDZyRTZKNWZWVE9aelN4?=
 =?utf-8?B?UXNBRzh1N2VpcERHU2d2ekRNTmxTZUNYUG51Vnh3QXZhVTJnT3JjdGg2RkhB?=
 =?utf-8?B?Sjc1ZFRHdFRBRjJBSXRUY2tFdlZ5MmVVRGY5WFhnMElvTUEvMG5USlU0V2w5?=
 =?utf-8?Q?xI1FjY0XuLE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q08vY05yMHdoZ0pnV3pwajRhMlRRYWh6YVR6dnF5YVEwcGxKVlRzUVpmVnBw?=
 =?utf-8?B?R0NZTC9yWVZGNDJHSit2ck5kNUZ3VFR0cUxvR2Q5eXVaQXdzajFXMC9ycCtt?=
 =?utf-8?B?RUF2MXM5NXFWdGQ4bSszRU90T3hlMWhoSXVsMGVmK2MwV3NWWlA0ZGRMSlZs?=
 =?utf-8?B?QnBCZm9MNnJEeFJIY3ZnMjlWSE9xZXVWN2pZN0lzSW9qSitoQWRsZzZiWHhE?=
 =?utf-8?B?Z1VEZUx0UWpra2VuSERqc29xRURZVTFScU4zY0ZuUThZVnJiTzNtcG9jeVlv?=
 =?utf-8?B?b0pTdWhJeHYyQ1QzRVgzYVc2eFJpQUVhSWhZM3R1b0VBM0wwdGMxNDYzdWNk?=
 =?utf-8?B?cnFOU25ZenBIY3NSUlk5M3FCUHRWUGhoVWdiNmRBYkVhd2dtVzZGNjVWSjNS?=
 =?utf-8?B?OTNndnVzakxuT3dpTEl6czArcmxPeHhwaGh5R1JaT2R2dDM0d2pVaHFUYXdp?=
 =?utf-8?B?aXd0RWo2UU00bEkwUDZ5Rm85UUQrenlkM1VqMk5VendGeHlnWGgxWEJ4cW52?=
 =?utf-8?B?MEdTRUVYa2RqK1pHQ2hOZkwxdXNWWE0zUk45T1U4Qys2WG1sd0pQam4xUzVX?=
 =?utf-8?B?ZXJDTEYya2o1OHdFVzBWOWhSQUp2aEN2dzduUkhoM0QrZmR4MDV6RTdIbGI1?=
 =?utf-8?B?ZS9qOFpyTytWQnZxc1dFUmkwYUZWVXBBTFBsZWJWK1JqcTJXS1hobHBhTkJG?=
 =?utf-8?B?aDFSb2hyY1k0eXJlaXVLbmo5c0tHVld4UDZVcVZwNHdIL3l5eDR2NjJLNWlK?=
 =?utf-8?B?bFFNNDdmZzBMQkRLYjFCdUlsRG51cE5BTmp5SVdOQ1l4bTVlK2k3d2FhM0gv?=
 =?utf-8?B?c1FTY1NWaWtWU0VsY01xdzVDUE9wSmx5WS9kMmdaN3gvelJoZjdyR2F0N0s3?=
 =?utf-8?B?Wmp4bHZlQlM4OGlKUXo2OUZwMUlHNE5wemhRYkNQL0Y2cmg0MDhLT1BHUlQv?=
 =?utf-8?B?d1ZKblUrcGZUREQwdzR0em9tZEhJS1JXYjJzdzM0aERibnV6M2Rob1E1SUR5?=
 =?utf-8?B?OGVkL0E2Y2NCYVRwVHVIRVVSVERpdlBFZTlZUXdBb0o1cFpJc0VLYXUrc3NG?=
 =?utf-8?B?TmM2WEpIQTIxaHJER3F0TUhIK3pId3FlNzF2OTZJZjJoaGRuMHNRSElqR3Q0?=
 =?utf-8?B?Y3NXTUU2eVZXSWNjWFdMN0ZVekFhK1lyU1ZTKy9wWHJUR1hsT0txL25WU05O?=
 =?utf-8?B?OWFIRVI0TEovY1VhMFhDTGFLOU1QcVNiYUZvNVlLNmgvYlJ6NzM4d1MrSmlG?=
 =?utf-8?B?aW9vUDlDUFA2QnFSeGVMYk5samFXYjhmVDQwSFd2VkMwcmJ6NjN4TjZFVng5?=
 =?utf-8?B?SXloYVJFbVNlV0NIQ0RlRTdrZDYwYXk3Mm5XanEzd1dIR3RER0ZVNndoM1pZ?=
 =?utf-8?B?c2l5RU0ySnZiTHBlVXdmT2FseCsrNFFPOGxFSDhhVjhYSTh2d1kzdmloaDR1?=
 =?utf-8?B?bWhHTEhTaUJETzRCTk5SWTJlNnNkS01ncHFtZk9BY21mN3lNaFZjWkJLMUVN?=
 =?utf-8?B?d1laU0ZCOHJYVHR5S0wycGlidWJGQ2lnczNoSUFHcWpESEZtaTgza2NzVXlH?=
 =?utf-8?B?MW9YUmJEN2N1TktPcVlBNjNvOGhqNVRqZWpmNGMram1uaFVBWFpyVTlpeHpO?=
 =?utf-8?B?T1JtQnAzMnFvaERLOVFFbzlSZ0hnUG93TlNxdHZHQlJRUWhWL3pwcU02eS91?=
 =?utf-8?B?QnU4VzhDaUJiWWpjWXZ1a1pTdFcvSzBHNEVKZldRYmpObGNjWHlZTkcxUDJT?=
 =?utf-8?B?ci9pRnZBeG9LSEpWWmdUdEJnSENaMU55MkxKYy9pTHhSaTkwTi95WDhlUFlI?=
 =?utf-8?B?U1lpT3V6RGhJRUtRekxhWW1SN1RLQkwvNnQ5c09FNHVBVkZYcDBSeTBFcHFG?=
 =?utf-8?B?aTdFSWZVN3MzWHpJY1pSUjBLVkNUYll4Z05mLzRVZ2w3OS96Y3VvNU94N3pF?=
 =?utf-8?B?aTNsM0t4QVpTVk5zci9vVjVGb3RZR3hwLzVRR1lJVXk2OUpnTUtwSEJ2ZkxZ?=
 =?utf-8?B?K1F5MFdHTGozY1VwNU9ON2lhMnJSOEtoWmNwYktiSEhNWkNESGZKbzh3dzFE?=
 =?utf-8?B?YTAwVnpFS1N6SXFHU0RKY3ZyOTN0b0VTdTY5NFFMWW1jbzVFd0V6emxVUzcw?=
 =?utf-8?Q?qBCB7PM5YLSQE7oKRFFzT4vZx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d981c1c-5e2a-4f0c-d4c7-08dd93ba5287
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 14:11:01.6666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sp9PDyE0fwu1/Uj0wg6PgYWXcPUSFuK5rTwsU6Gt+WrxkYtGNoCBSyeYpE2zfsEdYSDvUyB1ISQViy4792GIaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7758
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



On 2025-05-15 05:45, Simon Ser wrote:
> I've reviewed all of the core DRM patches :)
> 
> Have there been updates from user-space implementations?

I know Leandro has been working on Weston to make use of
this and last year Xaver had a prototype in kwin.

Ideally we'd have gamescope adopt it and switch off the
"temporary" AMD private properties and show that it
behaves the same without breaking things.

I added/moved the relevant folks into the "To" field.

Harry
