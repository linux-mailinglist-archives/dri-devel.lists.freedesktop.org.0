Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228D8B9CB3B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 01:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70D510E038;
	Wed, 24 Sep 2025 23:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qWc4Oh6H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE94710E038
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7P3ARbtDXfjUtVmAKY/sPMwV9TWGPhCIxzooFVAt0pr9m1LDfsWv2euUcbfpB1Bypf4ufrc3dNvyZYvdMWJmFtaUx5c76b7xraNlPQFksjYNV4GMr8oDT+0jD33qwv5RHInA5zv0fWN/oMGqT568/jIijCEae0X8p3msjIoqj9R5tlIMliyXkHx0dAcSmRhRBSaHzBDTnKBnsEbs4apgBgCsqQxRaYfFYhTdTz1gRjP5XmKC8cjpnaPjmjbaUkdSYw43xZvKIMJhlzYefKlpdxxZ0quhTpY/3q8F8PQV3aWWC8gvBpw8y9IDpt/lw2Ozb0GxGNfh6B2M4fYLSxduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLkhg6BeEBbfh5Y+oa1G2VAUXCQJVTymnsY7m2vOVi0=;
 b=jr3ksKUWospCguGbpt7f184p8lNuRMZvMmY+xTXC0Qe240l1drNM1MP2AJbDviWq1u3Tr9j1XD1ZlyBr+rRv8Bw4oQxTmYV4iqJvJmZta+RuzIUmq26LekQU+AOorVq16mYzq/ho1aC/Zxv/jfkxPL3AwGDYtmH/a3PhrSFLq9O20Ul5wu1epUSKuG9aphdentbZOWN511/hWiVWxyQaamKWUHRGNAG0ejXLv+uiyg9njbU2gPOUo3/1TnoRTX0HKgLqWKuaIQyRjFT4WaoiN5kP0ZvIuXYZj/+49DW050RrkdCiepAS9UZbDRJyTUkly8LiRGRcpWyC+A2O0SuICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLkhg6BeEBbfh5Y+oa1G2VAUXCQJVTymnsY7m2vOVi0=;
 b=qWc4Oh6Hoq0dojpypB6LdqUjT7Jh0bDlct0vw2h5LDlvvRREXyJ1SeJExsNueKEnstN9aE2vixHpngw4sSJo3r8kOM++W/b3odApNAUpeGZV3COcY3/TPWp2GMQgYrcb5SYUDnVdcOJODbp2uukE3goKnKgyulu5HN/hRCyUYUHVfxiBJWYL/4VdSwgLkBefxZtcmVHKmLSVTQp46n0+udZ5dyII01uIVaXX/Rfs0JgXR5PeO2ujrh8OlccJLrv1IpKBbPUK0ixbBfiqMDv+uaVYqEtQALOd5LBMIiXzcOiRujubYJcpnB1Z/VbxViyjqhDNqkdLijiLNCOLYFEFZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB8547.namprd12.prod.outlook.com (2603:10b6:610:164::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 23:45:42 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 23:45:42 +0000
Date: Thu, 25 Sep 2025 09:45:36 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, 
 Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, 
 damon@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, 
 Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v6 01/15] mm/zone_device: support large zone device private
 folios
Message-ID: <tz2rrz626f7667i2wtwb4pegqm4ga7sr2xfpzipy6y5qchxycb@acx2unx27zsi>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
 <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
 <f026c5a1-ec51-4fa5-bc58-c2d690f9248c@nvidia.com>
 <87F52459-85DC-49C3-9720-819FAA0D1602@nvidia.com>
 <891b7840-3cde-49d0-bdde-8945e9767627@nvidia.com>
 <c7a2ad6e-68cb-4689-b72e-6e7ebfcf5e64@redhat.com>
 <4534DB6E-FF66-4412-B843-FB9BC5E52618@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4534DB6E-FF66-4412-B843-FB9BC5E52618@nvidia.com>
X-ClientProxiedBy: SY5P282CA0066.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 926853f5-70ba-4fd2-f960-08ddfbc478fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmVnekMxY29Pb1daR3lZVnNHWTFvN1VaTmRNOWtlVURNeUxWRHdYenhXcDZM?=
 =?utf-8?B?YUVkUXBtM3Z0dlZ1dEZUeDlFZEIyejR3TEE1dlczcWFCcTV0MzZwaVlQOTZa?=
 =?utf-8?B?R0hJVDI2ei9oNll3eGh0REx1ZW4xUVBQcTlrd2gxR3BzMGYzalVWTTdXTlVL?=
 =?utf-8?B?OU1BZUlHSFdtMGpJUm1yMTFUdjRFZkpCYi9IampGUllZVzZDb0poeWgwN3lO?=
 =?utf-8?B?eFB6MnZ3NTFXVXo5NzVrcXlFdjNkcUNVT2JURlltbXNKRFM0Q1NzSWpqd2g1?=
 =?utf-8?B?WStPSEMzajZBT243cTdkZUFtOWJOOWoxQ1h4NDZSYkc4MHUvdmRqRXFsUlJ6?=
 =?utf-8?B?UDVya1R3am1wRysyck02MDR5cUJNS2pzbUxqeEU1K2hVcVlkelBCL0o3SW10?=
 =?utf-8?B?Q1BHNEY3VDZGejZiTU9yUzhpZzkrWHZFYnM5TUovVkdIQzM1R2FMVzZ4bW9Q?=
 =?utf-8?B?Q0Q0Skh1anZMWEhTbXJWRHV1dVhJWGFwTmFLdVNtTG8zUU5JMGFKc0d4RVdG?=
 =?utf-8?B?MExUaEN2Ym5yZ1I5Yjl5a3BYMURLSWVxbFJIYVQxcEpvYkNXbTA1dFBTZ014?=
 =?utf-8?B?SmZ2TlRDMmlVcWxiQm1JQlJpL1ZsaUZqaXVVVzlTcXg3Q2ZuR0hpRTRub3dr?=
 =?utf-8?B?bHJrb25WclFMdGI1dUx4bnFEV0xWMWl3UzdlT2htZHF5cTBSblNmZEpiZ1dO?=
 =?utf-8?B?YXROdTdTY1hsK2tGOVZsWkZxU1NQSVVYNkNJcGdDK25hUC9LTUpob1FUdkVJ?=
 =?utf-8?B?TlRyT1ZrdUp1KzNNcU1IcUhUT3JQMjZPWldSWm85bENyTHlOYmV2OG1yNldE?=
 =?utf-8?B?WWJpaE1LUXhVYzZqS3ZtS3djcGI1L0VmVVkvOFBmSnE3NFkyL29WUUI1K3lL?=
 =?utf-8?B?cjgwL1ZWRWlUUFJkVFhsalVCWE4zVXVqc2diTUVkeE4xTXNIN21kSk9JWFor?=
 =?utf-8?B?cHhtR3ZpVTkxdFpHcGllVUJtUFQ4enZGakZUcGdsQ2pCMlg0dzlmdndEU05o?=
 =?utf-8?B?Q1NoN2pqYmkyRkdkMldFMVBxNC8xQm93RTQ0R3lCL1Y5QUZVWTN1eGthcTgr?=
 =?utf-8?B?dTk3ZFFka2I2elBERm1JbFBNSEt2dkUwS0s4Wld3WkN1UHVJQ1lCUG5sMmtC?=
 =?utf-8?B?T2VwUkwvUkUrTTlBUk5tOXdhQTJsL1RoYml2bWJhUXNpZURwTVNsOG44Ni9Z?=
 =?utf-8?B?SGNGd25ZTEJzVkcwM0lkeEVPVkFQSWQzb25wck5uVk4rcmNTT0NiREJWMVov?=
 =?utf-8?B?eGIzdjU2Zi9RbGpVRFAwNDQwVWlrK1Q1YkgrUE9HSXlya0g4KzdJbGtMOGRv?=
 =?utf-8?B?bVVyTTFxU3FVcWRrRjVDbFo5QUVZWEw3T3ZKRW8wQzZSbDlJaGp3VWRXTis5?=
 =?utf-8?B?ZWJ3dGFzcCtjSVFXZHk2dVRkYWtVQlVtVUNDdDdZNkZpekZoWWlBZGhTdTJ5?=
 =?utf-8?B?cU5aWDNoQ3NaaWFSVlVKb1VXTEZHYXZxTGZ1MzZrTHNLYWFyc05WSlUvamQ4?=
 =?utf-8?B?TGlRVWE5SFJmOENEaXM4MzlNTjVWYVo3bHZqdzA1Y0hjeFBsb3lubHE2c0Rq?=
 =?utf-8?B?bHVaNDUzWGdHdTVZSnlLcWhoS2poZXlMR1pwYVozTVFtdE5WbEpTd21uK0R1?=
 =?utf-8?B?SENkaXB3WHd5ZzdpSndYU3c3cStlenI2Q1ZYckJXV1VFckEzRWxpSVV0RzFE?=
 =?utf-8?B?TWg1ck1HSjhOVEY1eXA3TWg5SFVqV1VUSFVlZHNkZnl5MFE5WS9FeFd4Vi83?=
 =?utf-8?B?Vkx1bWZFaGdUbWI1NlhUM2ZDbmRZNTl3aG1tNnFnQTAzSVpENDJqM2tpa05S?=
 =?utf-8?B?ZEExeG9UWWpma2FkUmdvUjB1RFdlN2poZDFqMDcxNHdyaU5YYkRNdHdaRjlN?=
 =?utf-8?B?MGJvZVVRV1VLQzl6cTlJVTNCUW9hZVZMZHd6SXNzNUJ5dEk1Ykk2U2JLUkpw?=
 =?utf-8?Q?r9qGGVPGuiQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjhjWnZheXkvcTY1YzZlUkVpV01DUXFRb2dCKy9IaThsQ0dncE1SaTI0YWdr?=
 =?utf-8?B?SEE2WGhzeGN1QWxHbVBXQUd4Vnl5R1FOcVRaVTRRRU81d0hOdFJmY0hkSU0y?=
 =?utf-8?B?eWF2QVFjZTZvcFoxQVFqbWxjVk56dzRJcjBHSFMrM240c0drZC9uMzJhZURV?=
 =?utf-8?B?c1pTank1cEw4OExYYzRVQ2czeXRFU3lQVUJBazRsWGxpeXg0RnBGd3VrQzcv?=
 =?utf-8?B?aXc0cnU3U3Z2dUFnSTVpVFVncDYrYTRFd3lPaEFnKzRCdGw4VFo4cGFyeTNl?=
 =?utf-8?B?R1JQNjZHazlGWjFNK0hZSlZQT05USG5FK3o5di9DQkVDOURBR1RDZk1MZjkx?=
 =?utf-8?B?bDRBMWx2N201c052Qy9tV3FDa2V3RTZ6VGpJd09QdzdtczliUThpaGRGNTdM?=
 =?utf-8?B?U1F6eTRMRm9EZGJVR1cvOS9KZXB1eEVMMkFsQU11U2psUmpEZU1FRjIzamN5?=
 =?utf-8?B?Njd3akl6QndsL21sZ2h3ZG5YYTVRb2pSRSs5cDB1ZTVTZHduek5mZkNOUEZH?=
 =?utf-8?B?a1VUMTVkZDZNWmF6eU5jN0JXWWs2TmhJR2lDZk4zKzBWV2IrWUhpZVBYZnEr?=
 =?utf-8?B?aEhCempFNm13VGJxRnVvOW9oTkdWMzdOUHVPVk9DQlV5d3IwN255eS85YWcv?=
 =?utf-8?B?bmdLVnA4NGpJU1RHVDlTTi91Zlc1NDJJcC9DWEVwdW04bTVaV044K1VHWmZO?=
 =?utf-8?B?amhWQmp6Z0o5eEZrVWhVOCs2YnJxcmdmQUF3SUdLSUNJRXJ3WndRRXNaNERK?=
 =?utf-8?B?M2k1ajEvc3FieTdjb2RHSHZLb01DbG1oVFRUSERsMzFtYk00SGU3dWMrUlM2?=
 =?utf-8?B?aVNISUliK3VmeUZhb2tHOXV1VC84QnJZSWxGL01EYS9xOTFlNy9qcE9vWVZD?=
 =?utf-8?B?M1k3cDl0WTRWUjhpVXZPQ0lhUC9obW5TOFFiV0ZMZDdJVEVuMW81aVJzd2dh?=
 =?utf-8?B?Q2FXdm16SkNFam0xVXoxeHgzaTRrNnNGcFpCanB2MTRoVVh1RURZYnozV1lj?=
 =?utf-8?B?bmFMeG1lSklZUUZkQXFBN3c3R0x6Wmo5VlMrQnF4WDV0VFlCM3hIYm90bEJJ?=
 =?utf-8?B?czhqMkUxaDVEZEx1UEsxdTR5NDFucUl5NzUzakl4SXRibyszTmNBM0g2dnAy?=
 =?utf-8?B?STFKTUdxa0YyM0pZUzFrZ2Z4cFNGR1JmSmNISUVpMG9lc1FQaTRzNlFSbFJr?=
 =?utf-8?B?RWRqb1M4U1BEMFVHVHJ5VjMvTXhnaWxQNEdqZTNpUWJTWW0zdjZWRmhweWpm?=
 =?utf-8?B?NVpEbEVHU3lxcmhlODliSzNEQmRmeEFrRDlaRnBxdm5RV0J0ay8vemRMUDJ2?=
 =?utf-8?B?M1lXV0M1bWJFK0dxc25DeDZ2czFIbklmbWJadjQ2bDFLNVp1cGNWaW45Yktk?=
 =?utf-8?B?ckVSWG5ySTdvTVlOVU9WTFBTU2lXUml4VjR6TllYVStVUGhTSjdZa3kybHJH?=
 =?utf-8?B?WWhXTEFUWTNrSjU4R2kwR2FENHpjTnU1QTdDa1g1eGRidUdMbEtDdkZIVCs5?=
 =?utf-8?B?NTl5NysxQjdweUcwcHNBV3loYnc3S2lhWXdicDdBZVNIdEs4VWNIcE1tUnRX?=
 =?utf-8?B?bU1JenRhTzViUGRUR2dOb1ZQU0pDQWM0UVNibUM0dmdPeHgrbWpsaERjdEJT?=
 =?utf-8?B?b0FhOVlTRXcxYmgxUUZEMWp2S0tzNEQ5TVMzNk8zOURTb2EvYjcySitsTXFs?=
 =?utf-8?B?MnIwZUZHUjk1VUU3NStLZ3d0MmJRYWt0TFdVREV5VHphblFPMklVclVGZmp3?=
 =?utf-8?B?dEZmWW5ndHhTcjJuU1RJY2VTNWFpS3Qyd0NOWFhCdDdLZy9hT0RNYW5OM1Ax?=
 =?utf-8?B?aldKY3NjRWxHQng2ZnRKSGlyeWUveEl1TDNtb1BVdWJPd0FBVmxPd25HN09B?=
 =?utf-8?B?N0dsb0I0Z2N5dUZTNEtsY0NZMzRsVnBIc3haWGd0azZ6OEdnR3U2NmM1WmR4?=
 =?utf-8?B?cjdiL1VWRmEzZmJackpWMWYzZXkxaGNwejUyR0ticlRoZnRjM3l4VTFmU0tM?=
 =?utf-8?B?OU9iQURtMTJFL2xHQkdpN21TNlordC84cXNBVWVHcGpZRk5nSVVic2ZjOWxw?=
 =?utf-8?B?Znc3L0dWMmxsM2NIbk8ya2hib3doZXQ4eW05MndseHcxajA5SDl0MlZlcjB6?=
 =?utf-8?Q?Ciiy/etLGK88nMqJG59ieK3C0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 926853f5-70ba-4fd2-f960-08ddfbc478fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 23:45:42.2817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EW6q/SHitj/gOjJSZOi1b3fGHc73c6dBiWajN/NSNlN4wRV6Liz+TykUISmCCVDatLzimgj1duNZbmMTy+aLgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8547
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

On 2025-09-25 at 03:49 +1000, Zi Yan <ziy@nvidia.com> wrote...
> On 24 Sep 2025, at 7:04, David Hildenbrand wrote:
> 
> > On 23.09.25 05:47, Balbir Singh wrote:
> >> On 9/19/25 23:26, Zi Yan wrote:
> >>> On 19 Sep 2025, at 1:01, Balbir Singh wrote:
> >>>
> >>>> On 9/18/25 12:49, Zi Yan wrote:
> >>>>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
> >>>>>
> >>>>>> Add routines to support allocation of large order zone device folios
> >>>>>> and helper functions for zone device folios, to check if a folio is
> >>>>>> device private and helpers for setting zone device data.
> >>>>>>
> >>>>>> When large folios are used, the existing page_free() callback in
> >>>>>> pgmap is called when the folio is freed, this is true for both
> >>>>>> PAGE_SIZE and higher order pages.
> >>>>>>
> >>>>>> Zone device private large folios do not support deferred split and
> >>>>>> scan like normal THP folios.
> >>>>>>
> >>>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> >>>>>> Cc: David Hildenbrand <david@redhat.com>
> >>>>>> Cc: Zi Yan <ziy@nvidia.com>
> >>>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> >>>>>> Cc: Rakie Kim <rakie.kim@sk.com>
> >>>>>> Cc: Byungchul Park <byungchul@sk.com>
> >>>>>> Cc: Gregory Price <gourry@gourry.net>
> >>>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> >>>>>> Cc: Alistair Popple <apopple@nvidia.com>
> >>>>>> Cc: Oscar Salvador <osalvador@suse.de>
> >>>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >>>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> >>>>>> Cc: Nico Pache <npache@redhat.com>
> >>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >>>>>> Cc: Dev Jain <dev.jain@arm.com>
> >>>>>> Cc: Barry Song <baohua@kernel.org>
> >>>>>> Cc: Lyude Paul <lyude@redhat.com>
> >>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
> >>>>>> Cc: David Airlie <airlied@gmail.com>
> >>>>>> Cc: Simona Vetter <simona@ffwll.ch>
> >>>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
> >>>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
> >>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
> >>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
> >>>>>> ---
> >>>>>>   include/linux/memremap.h | 10 +++++++++-
> >>>>>>   mm/memremap.c            | 34 +++++++++++++++++++++-------------
> >>>>>>   mm/rmap.c                |  6 +++++-
> >>>>>>   3 files changed, 35 insertions(+), 15 deletions(-)
> >>>>>>
> >>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> >>>>>> index e5951ba12a28..9c20327c2be5 100644
> >>>>>> --- a/include/linux/memremap.h
> >>>>>> +++ b/include/linux/memremap.h
> >>>>>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page *page)
> >>>>>>   }
> >>>>>>
> >>>>>>   #ifdef CONFIG_ZONE_DEVICE
> >>>>>> -void zone_device_page_init(struct page *page);
> >>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order);
> >>>>>>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> >>>>>>   void memunmap_pages(struct dev_pagemap *pgmap);
> >>>>>>   void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> >>>>>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn);
> >>>>>>   bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> >>>>>>
> >>>>>>   unsigned long memremap_compat_align(void);
> >>>>>> +
> >>>>>> +static inline void zone_device_page_init(struct page *page)
> >>>>>> +{
> >>>>>> +	struct folio *folio = page_folio(page);
> >>>>>> +
> >>>>>> +	zone_device_folio_init(folio, 0);
> >>>>>
> >>>>> I assume it is for legacy code, where only non-compound page exists?
> >>>>>
> >>>>> It seems that you assume @page is always order-0, but there is no check
> >>>>> for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) != 0, folio)
> >>>>> above it would be useful to detect misuse.
> >>>>>
> >>>>>> +}
> >>>>>> +
> >>>>>>   #else
> >>>>>>   static inline void *devm_memremap_pages(struct device *dev,
> >>>>>>   		struct dev_pagemap *pgmap)
> >>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
> >>>>>> index 46cb1b0b6f72..a8481ebf94cc 100644
> >>>>>> --- a/mm/memremap.c
> >>>>>> +++ b/mm/memremap.c
> >>>>>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
> >>>>>>   void free_zone_device_folio(struct folio *folio)
> >>>>>>   {
> >>>>>>   	struct dev_pagemap *pgmap = folio->pgmap;
> >>>>>> +	unsigned long nr = folio_nr_pages(folio);
> >>>>>> +	int i;
> >>>>>>
> >>>>>>   	if (WARN_ON_ONCE(!pgmap))
> >>>>>>   		return;
> >>>>>>
> >>>>>>   	mem_cgroup_uncharge(folio);
> >>>>>>
> >>>>>> -	/*
> >>>>>> -	 * Note: we don't expect anonymous compound pages yet. Once supported
> >>>>>> -	 * and we could PTE-map them similar to THP, we'd have to clear
> >>>>>> -	 * PG_anon_exclusive on all tail pages.
> >>>>>> -	 */
> >>>>>>   	if (folio_test_anon(folio)) {
> >>>>>> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
> >>>>>> -		__ClearPageAnonExclusive(folio_page(folio, 0));
> >>>>>> +		for (i = 0; i < nr; i++)
> >>>>>> +			__ClearPageAnonExclusive(folio_page(folio, i));
> >>>>>> +	} else {
> >>>>>> +		VM_WARN_ON_ONCE(folio_test_large(folio));
> >>>>>>   	}
> >>>>>>
> >>>>>>   	/*
> >>>>>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
> >>>>>>   	case MEMORY_DEVICE_COHERENT:
> >>>>>>   		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
> >>>>>>   			break;
> >>>>>> -		pgmap->ops->page_free(folio_page(folio, 0));
> >>>>>> -		put_dev_pagemap(pgmap);
> >>>>>> +		pgmap->ops->page_free(&folio->page);
> >>>>>> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
> >>>>>>   		break;
> >>>>>>
> >>>>>>   	case MEMORY_DEVICE_GENERIC:
> >>>>>> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *folio)
> >>>>>>   	}
> >>>>>>   }
> >>>>>>
> >>>>>> -void zone_device_page_init(struct page *page)
> >>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order)
> >>>>>>   {
> >>>>>> +	struct page *page = folio_page(folio, 0);
> >>>>>
> >>>>> It is strange to see a folio is converted back to page in
> >>>>> a function called zone_device_folio_init().
> >>>>>
> >>>>>> +
> >>>>>> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >>>>>> +
> >>>>>>   	/*
> >>>>>>   	 * Drivers shouldn't be allocating pages after calling
> >>>>>>   	 * memunmap_pages().
> >>>>>>   	 */
> >>>>>> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
> >>>>>> -	set_page_count(page, 1);
> >>>>>> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> >>>>>> +	folio_set_count(folio, 1);
> >>>>>>   	lock_page(page);
> >>>>>> +
> >>>>>> +	if (order > 1) {

Why is this only called for order > 1 rather than order > 0 ?

> >>>>>> +		prep_compound_page(page, order);
> >>>>>> +		folio_set_large_rmappable(folio);
> >>>>>> +	}
> >>>>>
> >>>>> OK, so basically, @folio is not a compound page yet when zone_device_folio_init()
> >>>>> is called.
> >>>>>
> >>>>> I feel that your zone_device_page_init() and zone_device_folio_init()
> >>>>> implementations are inverse. They should follow the same pattern
> >>>>> as __alloc_pages_noprof() and __folio_alloc_noprof(), where
> >>>>> zone_device_page_init() does the actual initialization and
> >>>>> zone_device_folio_init() just convert a page to folio.
> >>>>>
> >>>>> Something like:
> >>>>>
> >>>>> void zone_device_page_init(struct page *page, unsigned int order)
> >>>>> {
> >>>>> 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >>>>>
> >>>>> 	/*
> >>>>> 	 * Drivers shouldn't be allocating pages after calling
> >>>>> 	 * memunmap_pages().
> >>>>> 	 */
> >>>>>
> >>>>>      WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> >>>>> 	
> >>>>> 	/*
> >>>>> 	 * anonymous folio does not support order-1, high order file-backed folio
> >>>>> 	 * is not supported at all.
> >>>>> 	 */

I guess that answers my question :-)

> >>>>> 	VM_WARN_ON_ONCE(order == 1);
> >>>>>
> >>>>> 	if (order > 1)
> >>>>> 		prep_compound_page(page, order);
> >>>>>
> >>>>> 	/* page has to be compound head here */
> >>>>> 	set_page_count(page, 1);
> >>>>> 	lock_page(page);
> >>>>> }
> >>>>>
> >>>>> void zone_device_folio_init(struct folio *folio, unsigned int order)
> >>>>> {
> >>>>> 	struct page *page = folio_page(folio, 0);
> >>>>>
> >>>>> 	zone_device_page_init(page, order);
> >>>>> 	page_rmappable_folio(page);
> >>>>> }
> >>>>>
> >>>>> Or
> >>>>>
> >>>>> struct folio *zone_device_folio_init(struct page *page, unsigned int order)
> >>>>> {
> >>>>> 	zone_device_page_init(page, order);
> >>>>> 	return page_rmappable_folio(page);
> >>>>> }
> >>>>>
> >>>>>
> >>>>> Then, it comes to free_zone_device_folio() above,
> >>>>> I feel that pgmap->ops->page_free() should take an additional order
> >>>>> parameter to free a compound page like free_frozen_pages().
> >>>>>
> >>>>>
> >>>>> This is my impression after reading the patch and zone device page code.
> >>>>>
> >>>>> Alistair and David can correct me if this is wrong, since I am new to
> >>>>> zone device page code.
> >>>>> 	
> >>>>
> >>>> Thanks, I did not want to change zone_device_page_init() for several
> >>>> drivers (outside my test scope) that already assume it has an order size of 0.

It's a trivial change, so I don't think avoiding changes to other drivers should
be a concern.

> >>>
> >>> But my proposed zone_device_page_init() should still work for order-0
> >>> pages. You just need to change call site to add 0 as a new parameter.
> >>>
> >>
> >> I did not want to change existing callers (increases testing impact)
> >> without a strong reason.
> >>
> >>>
> >>> One strange thing I found in the original zone_device_page_init() is
> >>> the use of page_pgmap() in
> >>> WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order)).
> >>> page_pgmap() calls page_folio() on the given page to access pgmap field.
> >>> And pgmap field is only available in struct folio. The code initializes
> >>> struct page, but in middle it suddenly finds the page is actually a folio,
> >>> then treat it as a page afterwards. I wonder if it can be done better.
> >>>
> >>> This might be a question to Alistair, since he made the change.

Hello! I might be him :)

I think this situation is just historical - when I originally wrote
zone_device_page_init() the pgmap was stored on the page rather than the folio.
That only changed fairly recently with commit 82ba975e4c43 ("mm: allow compound
zone device pages").

The reason pgmap is now only available on the folio is described in the
commit log. The TLDR is switching FS DAX to use compound pages required
page->compound_head to be available for use, and that was being shared
with page->pgmap. So the solution was to move pgmap to the folio freeing up
page->compound_head for use on tail pages.

The whole percpu pgmap->ref could actually now go away - I've debated removing
it but haven't found the motivation as it provides a small advantage on driver
tear down. Basically it just tracks how many pages are allocated in the pgmap
so drivers could use that to determine if they need to trigger migrations before
tearing down the pgmap.

The alternative is just to loop over every page in the pgmap to ensure the
folio/page refcounts are 0 before tear down.

> >>>
> >>
> >> I'll let him answer it :)
> >
> > Not him, but I think this goes back to my question raised in my other reply: When would we allocate "struct folio" in the future.
> >
> > If it's "always" then actually most of the zone-device code would only ever operate on folios and never on pages in the future.
> >
> > I recall during a discussion at LSF/MM I raised that, and the answer was (IIRC) that we will allocate "struct folio" as we will initialize the memmap for dax.

Sounds about right.

> > So essentially, we'd always have folios and would never really have to operate on pages.

Yeah, I think I mentioned to Matthew at LSF/MM that I thought ZONE_DEVICE (and
in particular ZONE_DEVICE_PRIVATE) might be a good candidate to experiment with
removing struct pages entirely and switching to memdesc's or whatever. Because
we should, in theory at least, only need to operate on folio's. But I'm still a
little vague on the details how that would actually work. It's been on my TODO
list for a while, so myabe I will try and look at it for LPC as a healthy bit of
conference driven development.

> Hmm, then what is the point of having “struct folio”, which originally is
> added to save compound_head() calls, where everything is a folio in device
> private world? We might need DAX people to explain the rationale of
> “always struct folio”.

Longer term isn't there an aim to remove struct page? So I assumed moving to
folio's was part of that effort. As you say though many of the clean-ups thus
far related to switching ZONE_DEVICE to folios have indeed just been about
removing compound_head() calls.

 - Alistair

> Best Regards,
> Yan, Zi
