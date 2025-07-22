Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEFCB0D9DF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 14:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541AE10E2FD;
	Tue, 22 Jul 2025 12:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ToX8UgRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D16910E080;
 Tue, 22 Jul 2025 12:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0UzirmFpC0mF3a6bf/FMEDG7RTIIfJ4L3rt8yccKkYO1HvUCsMTiEBwIU58IvyQQHfCepAKwbS8mMiCLsJKFDuw+pA+ywBMu2bBGfnM1eXZC+GkwMKeYmOFD4I9NxU8PW03ISEAHxlmpiqhsbTy2Hxn6srAsGpvFHdzo2xChUFbC8R1CEY4OtKuRWT15GNspDMqiVo46H/OdRhkDE7RRhp8QjtuaG8D3vq653f3uTM88GjBumX0AxoBDesxUQBPQ/rBZhEuTQ32UUY4jHPR8MgBEMHKXcyM2tWPGQT0YHsryZ5dUioevwrM7JviogU4K78lafsD0gXjANSMDvBFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gqum8bG/foRacrV7+ZclRUc5XA7NaWQNsPleQNrqP6E=;
 b=X7V+i2nntKQfC4W4DnItP0R167iLBwgecnIqpq8LHAQAkF/e9ONwONUjBkqH0h+/cAUfme8G3P0eazjgBmHBisFW1J5TMEFEeZNi1fOY3ElHh+oHAWDygi3ITSDdN9LHSpDmp38K39YbmdbLWWwiBUfpmaHOQ27O++qyHWDqik/G0P4neVUfuuVNYQPI2eFM+lD0+zVdRyKg1sakrZAgxXkcN2+4CV3pkL2NFuu04ITMbqqIxTvdVjSmPtCCBHvuvjtFxN+BLt0MawH0MnAD001pSZGzcMx7e33l/4MCtAAY6/sJdo9Y10FLrHFg3mjfC5/WGRAhBfkBhPv+AnePcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gqum8bG/foRacrV7+ZclRUc5XA7NaWQNsPleQNrqP6E=;
 b=ToX8UgRxGiBchOja85dJa7J4wF/HstEeqYLA/TSHdKk+hLR0mwe1r0pMMKi0GkLvV42+R/MFcX6AC9WyBfsN/mJF+ARYVipCePLWkYtkgJ+7bTkNoeniFvolCYrb6opHqSEe6ROMUgxMGEH1L+v3VhDwfKyrX/+j1lYU0EAlpEHvPW1tjKGV7z5Mo/TlvRwOk71K/g76LBEb8tCR5oHm2kCocbv0Nc+HsboRq+IBLT0e+3eMlXRPQ78ab+jKgnCGJ0KhDpekeFRnqClJX2FbE9IwwH0mmUsc+0rzR8kERPB+rKqztjMT5XDJ5IGuFYJBTyBcOCgBC+W4wtcTIlc2mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6463.namprd12.prod.outlook.com (2603:10b6:8:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:39:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Tue, 22 Jul 2025
 12:39:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Jul 2025 21:39:56 +0900
Message-Id: <DBIL9YRWHSHK.2MAH6T0KEHF74@nvidia.com>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Beata Michalska"
 <beata.michalska@arm.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 16/19] gpu: nova-core: falcon: add distinct base
 address for PFALCON2
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-16-7b6a762aa1cd@nvidia.com>
 <5beb884b-f0fe-46b8-ac62-f11637fcc93f@nvidia.com>
In-Reply-To: <5beb884b-f0fe-46b8-ac62-f11637fcc93f@nvidia.com>
X-ClientProxiedBy: TYCP286CA0283.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: bde87fcf-a279-4e97-3e1c-08ddc91cded6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REtiZnBweUd1cG1uL3FnWDRnT1BJQ1YrczVramozbDNCbUdIdTE3QWZXQWF3?=
 =?utf-8?B?K2ZSYWx5L2Jpd2kwaHVBQU1SZ1pjdGlaRktsTm9BZzd2YllFWWx5NllIL0FX?=
 =?utf-8?B?eGJScCszUkk5VG44YlFFTXJzYkxEZDdLTmY0SEh2L3NLY3h5bHB3S3ZhTlV6?=
 =?utf-8?B?NlBsamZ0OUNRa3NvZkl4eDBTL0NPaTd1U1U4bDNKSGZtQ0d3UDN0ZDlvYVV6?=
 =?utf-8?B?cDNLYzhZV0VmclJnOW1VTks3SHROem1sVHBTRUtEVzAwSFdVbmxySXM1cCtS?=
 =?utf-8?B?VkcyWFF4OGIzZ2UvYTJzaERhRjUwNlNzMk9qQUVaNnRJQ3I1YlBnMFhQaG91?=
 =?utf-8?B?R3Y5dndvcWo1WXN1dXNhdVNhbms0bUdaNURKRVhOeSt5eHdha2NTYzQxc2hV?=
 =?utf-8?B?dG1JNGZiSU9xMnJSTHpzcCtoU21lNVFYbDdKVDQwU01xOEp5bk9NNzRLTTNh?=
 =?utf-8?B?ZHhhSUxjN2lRQlpvd0k5MnZ5YjcvTzhucTliZFlJQVh4S0ZFNGdCVFluVzFt?=
 =?utf-8?B?ZXYvZ1hhaVVpTDNzejhiZmVDSytiNGpEdVYwN0Q1RU4zNnF5VXFEbVptbXdz?=
 =?utf-8?B?bG1BZkZFa3hKWStId3I1eDJoMEJRN2M0KzgxSTU2MG82MTd4anYyRkI1Ymow?=
 =?utf-8?B?UkRKR0RIek53YU1yWmxNU08xK3lHUUkyWWdEdkxiNklKWDNOYTYvdkhKRHFC?=
 =?utf-8?B?dU9LR0hDaXg3MjVsUElKNlM5dkpQYTB5VjN4NnNIeUI2T0RCTGZVY2lxanlh?=
 =?utf-8?B?TUpraWNaRnV4VkVGZVZITy9xeWVaWFpiUHZFRVhIb2l4Ly8ySVMvcVRqZHM2?=
 =?utf-8?B?U1RIVmtkQUlGSnV5ZUs0Z0R2S1BSMVNZZHJwZk4wUGplVlRsdXhZSm1mL3Za?=
 =?utf-8?B?MWVxbVZtbDZFR1ZpQ2NUaG9RUzZ1cEMvTDZQdkpxU1FPTkQ4d0M4UWtDSlVt?=
 =?utf-8?B?NDgzVmFXdkZneUdqOVVvdVkrL3p5QjEzb2hRZDRmWUNuVmEwRDlObVZGT2Nt?=
 =?utf-8?B?OHlqSWFMMUdYelVFMGdPUVJ0TnlkQjJIaWtiVFFRVTZqQnMwVmxZMThMM3Rk?=
 =?utf-8?B?dVhHWmlCc0Mrc0pVRFE1SE1SRDAyVzcxeW9jU0NvWU1Nb3NOUjh2NEhBUmN6?=
 =?utf-8?B?WWxCbnNNbHI4WThGQ283MFNJdElwWjFtTk9xQlFuZ1RKa2FVSmozelZoYU5q?=
 =?utf-8?B?VmxNNGFKRC9lMjRLZmhPK2x2bzVzWHF1d3o0M2F1dXFQY0g4TnVkWTBJa1pJ?=
 =?utf-8?B?RUk0eUZKOUVOem9Ga2hYVU5iejFQTEdMZENzanB6QmNIazhqd016REgzTVRQ?=
 =?utf-8?B?U1ZJRFVmaFM2SjFsUTBkcWhMYkJLQkY3T3N1WS9EVzFYY2pXUVpNUFBpbUN1?=
 =?utf-8?B?RUpURFZuZGtseDNRbjhDSDhzbldjcWNSZjlwL2dzZUQwUUdNNGlEM01qVmxp?=
 =?utf-8?B?Q3lNTHdSekRyR1NhR285ZDlBNHBVM1ZrWm51NHordGJocS9mejFRNkVYRzFO?=
 =?utf-8?B?MHBLVzZKODd0b1dkOUx2U0tsZWRQbGl1bXh2QlpzZkM1Ti8rS2RYMkZSUkJJ?=
 =?utf-8?B?NDd3aUFHT1N3MWU4djV5bWhIVTM4bm1ZbnhqV2t1STlMOVRKdzdncGYyeG4z?=
 =?utf-8?B?QnlrS1ZIZVFwUzVWeHg1c1dGdXk5Wjk3d05aWktTT3dDb2RTQk5WTWRlWTJj?=
 =?utf-8?B?YU9rOU9aSFdadEsvcnZOd3JkM3RhVFcxR1BpUWFuY1FQR0NLSDhiUG90anBo?=
 =?utf-8?B?WmdmaFFMY3o1YUIyVXdKTkptS0Zkd1JPeC9nYit6WFdRZXlBQ2hNcWYrTm9X?=
 =?utf-8?B?UTF2KzN2WVFUSGx3QllDWGJMUDZ3cCtMUlZSMWxBQ1pYcjd1Q2pYUUM4c29z?=
 =?utf-8?B?Qm1SU3pPaEt2ZkFLVnZsVFFLbHM3NW82ODJsQUtlRG41Tk9ueU1kMFRaNEJ4?=
 =?utf-8?Q?ekn4srHRrx0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGJRZXFoSXFTOEFBRndGclB3OGc1N1RTNk9XeVJ6b0lXQjY1QU5GTkpVZjMv?=
 =?utf-8?B?U29RUVMyVUkycktUUnBrK3FkYnFTVVI1dENaWUF5UldpVmpKM3BNVW12TGQ2?=
 =?utf-8?B?bmpUMW5Ma2dDNFQ5cng3cm9pK0JGM2dzOFBoUUVtVzhMVFhOaE5IK2VQdU1l?=
 =?utf-8?B?SmtSQ0pMMnh3ZjhDeHk0dXNJSHRud1VTSU1xTElkSGp0dGl0c0lINllaN0tj?=
 =?utf-8?B?TzRPM3J6bSt6QlVXeU5lYUJVbEQzSEFZZjZRODNXbnZVenRXNHVUaWJTcWdZ?=
 =?utf-8?B?anFKczBlWmFic0lHWkV4YWp0TGU1RUEvMVoydVNhQytmTjBhdnU5anNXTFUv?=
 =?utf-8?B?N3BYMHZ6Zk9SRmZybFpHUWJaTENwY1R2WitaOTNWSisyNzFoYzhTSStsNlND?=
 =?utf-8?B?ZDh4bnVzT29jSG54QmxwZWwwN1JWK2dTS2JDTEFZUVZnUXJ5djZKMGhza052?=
 =?utf-8?B?SVNYZFNtT2tNYkhMUUZFWUhMQUozR2Job1RyQ2xLL2wxL1Y5ajNQVm1DcGVz?=
 =?utf-8?B?L1g0NEYyZTdHOExjU25hVHhRZzBJNmd1OXNLYXBTalBEdjJHUjVyK3gzMVZH?=
 =?utf-8?B?VUlERDFmb1dleUVkbHQ4bmFZa0I1ZEN4QmJkMyt5OHZBQkQxWENmSGRpeEN0?=
 =?utf-8?B?S21Rc1lMV2FrVUxLMDVITmd2b1JsQ2pSNGU1Mlk3Z0FRZDh4TGkxN0dEQkFt?=
 =?utf-8?B?Wkp3Y1MrRUR6dnI1M3dNRnI5RC9ncmU4bk9EbTZVbFhtUDhGZDFOc1ZHZS9i?=
 =?utf-8?B?QzE4QVB5NDhwT00zVFdwVk1WOUJzaWU4eHZsOXBNc1BuSDNpMXJBcGdYVU13?=
 =?utf-8?B?S0RYZXdiWDNNUHFuNUV4YkZlTDJQMFk4ajVhc3Q2RHhSa3FGSk5kcVN5emlI?=
 =?utf-8?B?cjgxWXhyeFE1RVQyOXNMbGlxS2lGWlRjU05KZUkrR0pabUJobVVTQllUQTgz?=
 =?utf-8?B?TytqRHBlTzhmSitOT2dvNGo1TjM4RFNMN1YzV2UzT0lzQmV4N0JJSHRmUkpI?=
 =?utf-8?B?QUJ6bXpTUmdJaVRMUGpGN1p0SXdBdjREZnF3R2FFV2t5TmF2UThXSjFVVUN6?=
 =?utf-8?B?YndYQTlSYzlTclhPUWFocWxrTlNBT1p4akVPVEU2UVZtMWxEaVdQd09GekpB?=
 =?utf-8?B?T2IrVTdwTWdxVWpuNTFKa0xOWC9jaG96ZHJwb2NNa0REK0d3TDBUdkRMMWla?=
 =?utf-8?B?dFFnb1g3ZlV1dHVuQVBNSUU3NDhKN2pCKy9xVnErNWw4OENpcDhLdmFkRG50?=
 =?utf-8?B?cDIvakVkK3ZtL0hLUjB4eUdnNnRKbThIVThIZHNsSXZQRkhNK0RwcmJQQ0Vr?=
 =?utf-8?B?QmhtSHdjMy9SK3FkMDdwR2J5UDVwNFVPZnFxd1MyMStNb0lZUWE4dDN6dFVE?=
 =?utf-8?B?RFE1cnpJRVlmc3ptSmN6SUlOZ0Z5eXAwR3ZrUVVXL2daekc0alkzTndLWms0?=
 =?utf-8?B?bndqUHJFMEt1c3JXdEs5OFAyU05OZGFLR3lrdlVPK3F5RlhnclpTS0Z2dlZE?=
 =?utf-8?B?YjJJSlJMVzViOU1kYVpRWTl5dlV6TEIwZTRFMVJaVktYcGhicmsvcWJOdHVv?=
 =?utf-8?B?ZTRZTkZVaGlBSDhqNk1qZGFndStJSHFGWHA5Q1QwSDRnZkJUdVlvL3ZCckF1?=
 =?utf-8?B?SXVaQ29QYndpYllqaG5OV0xDQ0FydmJIcGVsaXZuSHZlSEZnZVptMkpDMHFv?=
 =?utf-8?B?ekxScFdaeHBZcTFJSWQ4Znh2NU1MODJqTFFPNi9jVlZjOXRuWWxGSlM0Nk4r?=
 =?utf-8?B?ZytncUhDa2VKY0Z4VDlFT0gxYTNMZzlLL2VJR0kzNXNOUGE5UG55dWJWWVZM?=
 =?utf-8?B?YzNRVit5V0FmZzJtOXROeVdBZGtvSHBsbUNqS1JSdHlTRWlwbkpPb3lCUEgy?=
 =?utf-8?B?QWFRQURwTkxTYTVEUEh1cXdUNEt2MW50d1B5WGd0ZHZkeTNqaVlKUlhGbW4w?=
 =?utf-8?B?c3FZdmU3NXA1S25pOW14Smd3YmhCNlkvUFlnLzJwaGRkb0JVb013eEZ5UE5l?=
 =?utf-8?B?RGdBNHhWZjliSUQ5d0pPcGZydFp0akpjMUdJNlViUkM3a0pwL2FSWEQ3aU84?=
 =?utf-8?B?TUtDMUFOOHA5Yms3bkhoOHRDQlp4c2U5TW5DMlJFVHpLNGF5M0xJSlY3QTBR?=
 =?utf-8?B?T05RQVFjTW9IMEN5S0h3aWVya2pGSEJCeFk4UVk1a2Y3eC9qS3gxRmljKzEx?=
 =?utf-8?Q?xJu5eExb90yU6mS2UISIr2EsHYdUMynY8Z1/omyRrpqI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde87fcf-a279-4e97-3e1c-08ddc91cded6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:39:59.2795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVrmQ+nIVL0YBR6Fl+cOL8HewT1N3gzoju9xdOuc1GH2peVaDjpi5Fq172dIhY255HZzIoLiKw1FQIc8xbN1Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6463
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

On Sat Jul 19, 2025 at 5:23 AM JST, John Hubbard wrote:
> On 7/18/25 12:26 AM, Alexandre Courbot wrote:
> ...
>> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core=
/falcon/gsp.rs
>> index 0db9f94036a6a7ced5a461aec2cff2ce246a5e0e..f17599cb49fa1e5077a554dc=
14b3715aa62a4ebd 100644
>> --- a/drivers/gpu/nova-core/falcon/gsp.rs
>> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
>> @@ -2,7 +2,7 @@
>>  =20
>>   use crate::{
>>       driver::Bar0,
>> -    falcon::{Falcon, FalconEngine, PFalconBase},
>> +    falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
>>       regs::{self, macros::RegisterBase},
>>   };
>>  =20
>> @@ -13,6 +13,10 @@ impl RegisterBase<PFalconBase> for Gsp {
>>       const BASE: usize =3D 0x00110000;
>
> This approach means that the reference manual values such as these, end
> up being scattered throughout the code base, as magic numbers.
>
> I'm thinking that there should be no problem with using a symbol from
> the manuals, listed in a common area, instead, right?

Correct, there should be nothing preventing us from doing that if we
think it is a better way to organize these (which I agree it probably
is).
