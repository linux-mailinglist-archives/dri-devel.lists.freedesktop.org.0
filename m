Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20BED00BBC
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 03:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFF610E28C;
	Thu,  8 Jan 2026 02:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dt8OTQE5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013065.outbound.protection.outlook.com
 [40.93.201.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D50810E28C;
 Thu,  8 Jan 2026 02:54:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4uOYdQixm6ebHtE3VjU1k3SoBCQjdXup7WlLwWAt42WZqqhROjgiKMK+faViI7Gf1/AXAkB4PjUWzeFVS4+tTyVhlmJnoVIg6GDsXmYQCnnsO6xlfby7n3XxfwpERaeFawf7YEFhUpaldcDcLJavNx96IiXQuswEAHiPMF+v2uF10snKwb1L5O+eCsYXlrmURH94t+IWRK1ji8Q0OS5WMtJOve9ShNN8JNIH71P72r4dVJ4qmcEEBVXp8mhCg0aMIZRlklKt9M3Z69r9O/ip+Z/bDZSrf7YgHd9V19I3bT7SxNe141gkhB2EvCRGJryjN17ZX85nddi0IC2L/5psA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMLgjO12OZdnwtEnAhCbd74RSzvBmasESQ3mytDbDqo=;
 b=tV3VidQKfhMew/VrJZh2GiFzKb/S9yyjJtddz3gBKaaA9Plzn5vxEuDDItdpyxabQR3uwhEltVYVtIgt++Cpewc+5Imsf+5M1H9fcv791IIVqXpfufKWx5f2GMEtGzXZ4VC64Kqlk4v0plHwJKS4GzOr0cbe7px7qZGTtss/HyCHZS2JOtrKRmLoei1eySeDZtY3bH1YTKQdCva0vQ4ZjYQ76xMc3lHinspWIwk9AFzSUtq2Ob/cMuXM5ncmXXewmZDHoy43091c4jZI9B6AOe8MwMnR4WnkVxtCB2MvivbqQw9oDtSuIFmuz5vzDOG0BpgYxkTQ+pOHZlrZ4rhQfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMLgjO12OZdnwtEnAhCbd74RSzvBmasESQ3mytDbDqo=;
 b=Dt8OTQE5MSccDSd1EXdrXvQIEHqUgEuTznuJlu5DiAoXkh2vVX0G70HocielMsk46476FtzblAOVC0Qy92Y/RGo2OywVFKhkJn09JAETi8vvynyBW2Fk9h9NouQ3xSSnyQkxOVW0sPIr240uxLWW2xiK+XT2xmq+QFGldgqAKgqOcPTVJ4sYnvt4YoxoL1tN23ryNoOPrRVOe6ky2br0nj0zyQ0CcXKESUA8Mc3dthMjFBp1Kgf13DQSOR5hXSHCE17oLU5ZONk7PJYSPv4rBfMESOWqQkSQcjBYhxRpQz2pLOfBbKkQ8DlNtSHWHH0PNRqQvw0s09Uk3FDUp4xAyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 02:53:57 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 02:53:57 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>, Balbir Singh <balbirs@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/4] mm/migrate: Add migrate_device_split_page
Date: Wed, 07 Jan 2026 21:53:52 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <0419825F-D627-41E9-887D-51E18A2D54E7@nvidia.com>
In-Reply-To: <aV8TuK5255NXd2PS@lstrano-desk.jf.intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-2-francois.dugast@intel.com>
 <F4EAA470-C922-4066-A115-13D6D055C73A@nvidia.com>
 <95BD5D5B-C8EB-4EFA-A895-CFD660504485@nvidia.com>
 <aV7NBE3NS1wdsXBo@lstrano-desk.jf.intel.com>
 <541B31AD-1472-4D32-A968-B92895CC6890@nvidia.com>
 <b39d13b2-cc10-4803-b6b8-0a0447aa3349@nvidia.com>
 <aV8TuK5255NXd2PS@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e45f194-4ec5-4f83-3de1-08de4e612aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0pnejVqNlY4Z2p6dEt3NWF5T0E4RUlLK3RzRXpzamNQYWtpWDFDbFBZTndy?=
 =?utf-8?B?bjJmTHJSNGxXU1Q3Q2R6amd0Q2EzekdYZC9BN1BWOU9BbmRyNGQ1VjZoODd3?=
 =?utf-8?B?U3prbUxmYWRZMytOSXVwK28wUmp4V3pZd2xjbUhXMDVleE14dk1hcHBTSGEx?=
 =?utf-8?B?bDNqNGlEMGJWQzB4Mk5LYzZTMjF2RUxtN1BoZDBKbHlZcHZiMW9GY3hNUTRQ?=
 =?utf-8?B?SHBkVHZKMitONjJWZ2RvZ1BmZjBnYXNzcWFWd1d4YmpNN3hPaStXNHNxZnJO?=
 =?utf-8?B?N1B4RzJsaXBOZDNiWWFkaW9tNDUzRnpJOTMydmtSSW1ZQ203UEJFRW81RHFU?=
 =?utf-8?B?WU11c2lxV3hIdXNQblhYS25NSWRkUjZ0djFpb1RVT2ZycGFwR29GTWJncU1L?=
 =?utf-8?B?VmtPckgvRWNyOG5xNHRKbUxWRmRUVWpQR2FEeXZlRjdpSytEVWRPNnZQRkJW?=
 =?utf-8?B?eGwwaFk4eWVJak41K2NJdDhrVmNkZ1dUem1lNWRvM0pGSHNQaXBpMGVCTGdT?=
 =?utf-8?B?U0FPYSt5Y0dtQjNPeEhXWkp5ZWRmYk42VFYyc2psdjVVcXNTZGJHQXFpTjds?=
 =?utf-8?B?WkJiTGF4alpEZGw4bmRpTXJUdkoyYkVUamVIOXYwZ2FYMDdBUVdJSnZmS0Y4?=
 =?utf-8?B?V1lTOEFIUGliUTRrRWc5cElaOEMyaXB5L3lUZEhqWnNnSDhRbEx2VXQ0aHNz?=
 =?utf-8?B?bllzQUFLWlJ1UE13WUZCR0h6dkZ3RG5CdS9aSklwWUhsMXhUYXJOaForRWpx?=
 =?utf-8?B?Tkk0SURSVFlyT0EwVFI0c1VUUE1FMFBMczBUZXVkWjMrTHNSUmFJTCt4SnRs?=
 =?utf-8?B?SFN6T1dKN2hCd2xuQ3ROakc1SnFodDFxTEIzWU1NZmluRmxvcDFWL2RNbU0x?=
 =?utf-8?B?aFE3MDVxbFhiTWlDemZna0doU1Btb1JjVHpPMTdMRkkwZVdlTmVpL21nYlBG?=
 =?utf-8?B?SE90ODRMUEpseE85VEFFN2RKZG0wSDJuelE1SHdNRTRPRSs4RjMzT1h3ck1P?=
 =?utf-8?B?RTNNRFVsQzlGL2xzRnR1Q0JFY3VLNEFiWTFlRjMyeUF5N1dHQjQ0SnBORCtP?=
 =?utf-8?B?V0JZMU5RcUl5TnhNbzdFTVJxVElpTUxiVHEzTVdJRGZ5MUczdkEvVElSV0JX?=
 =?utf-8?B?amRtUFZGc1M2QnpKNng0c3Z0dE9qcTRodUV4bXA2cVJvZGlZMzdsRkJMdHFO?=
 =?utf-8?B?d29VY3JoM1BmM1VWYTB1R3U0dmtuUFF0N2N4QWozd3p2bXd5dnlxOFlnc0x3?=
 =?utf-8?B?SXZCbFUxRjAvZ3B6cXlWRm05bVdxYkpJQ0VnOTBhM0RyZXNTY2x2NmllR3c0?=
 =?utf-8?B?OGRNRkk3SW93YU8xeDA1NmNxeUFDaU1NRXozMHJWOVlnTG8yY1pRTU1WM2NL?=
 =?utf-8?B?Mmx2Zm91Z0tWVngzbWYzV0JRNkNxM1NrRzBRWVRqQ2FsbUsweUdLL2tOWUlo?=
 =?utf-8?B?QUQ4VVZQYkJNdzExM2xWQjNwVXFFalREOWpmVzdJODJPVlhqMHl0TW0wUzZC?=
 =?utf-8?B?N1JKaDUwcUszQUd1UkZCNyt2VWFsSUdkQm9lVUFTQkxpV3BoNzVNbiszZFB1?=
 =?utf-8?B?QXl5NkhLRG05MDY2TUFEU1YyTXpDYkhRYWQ1NzNrdmlKWnpuaEE2MkNCUzVz?=
 =?utf-8?B?eVoxaGVqQi9UVHV5emlhMUoycGYwM21qTkVRWE5lMENlN1R1Ykp0UTVDcnBT?=
 =?utf-8?B?cHVaWU1Ldmo2ZzJVUFd2elhWZ1Vnb0pwTlgwUElhbXhDaXRpbGVQeEJrU1lr?=
 =?utf-8?Q?Xk8BUJKcuBGnc19ei/AWIEvV5LQ8xrtRljOr7bt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODduSWpYM3lSamNxMXZkdG5QeFB1cnFIRUVPVktsU3hvQ1BDa3Nia0o5bmY2?=
 =?utf-8?B?ZFZSbmEzT2JtNW55RWlpNlZmYmJMR1NjS0xCMllwSC9PTmRhWDBUUFpWd05O?=
 =?utf-8?B?bks0Z0RpQmZNaDN1eWxER09ZZFFMS0NGRk0xNHBUSmpQTFJKQURLYjA2bGM0?=
 =?utf-8?B?SFNVd1Vtb0NXaW9BUSt5a0liZjRSeEM2UzZhRDBrdVYyelNDS0w0ajd6TjBI?=
 =?utf-8?B?QmpTOVFKMHY0Vm03QVNYTm5XUm93TjBzSlQyL2RDbG1Gb3ZwMVF6WDdtdWVl?=
 =?utf-8?B?eWxDTzNCZU1XeHNOTnY5VXlFbkJxb3FJQzIwRGhiZmF2ZE9JUVVadEh1TkpQ?=
 =?utf-8?B?MkcvZm04amhEcDdyWHZKTjlsWnpTYm8veTZOaVB6RDJEZUg0VUkwczgrWjdi?=
 =?utf-8?B?ZjdocEVRNkpQMDlqcld2a2N3N0k1VjBzcmJOd3VUUkFWdmR2SlJKakpIV3BJ?=
 =?utf-8?B?U1hDZkV2eGdEV1VPSEpCVlFaTjJGQlZLZ0xHOGttK2pjTmt6b1NBbHhDZzRH?=
 =?utf-8?B?d2tZNllKcUx5VmxIdHVESHB1OUNIMmRqSlIxRWs2Qm1DU2FNejJ5UnBIN0FH?=
 =?utf-8?B?dEowbWlWNkxCaHlTOGxJUWkzMW05c3ZwMnZQbjAxOVFLVlFwM3ZjYTFVN1ZZ?=
 =?utf-8?B?dlllR3VVeFdkdFk3Lzg0L0EveE5DdFNWVmxpVjY4M3Q1KzZaUUl6YjNkNUF5?=
 =?utf-8?B?a0tjSU16cnlBTm1kb1lzWlhYL1BZemJDWFVJWHRRcG5URmo5UWJiYUcyYnNh?=
 =?utf-8?B?WGd1SjU0dmJTaTVKWUFXWElJNmJVU1VkZUhsQkZpSWd2Mm9HMC9rbjBjaGFK?=
 =?utf-8?B?T3BFK1JwTEtYRCt2a1hTbHZGUnlMMy9JM2FTN0ZoS0k4ZXpnT3VlVDZIWmlB?=
 =?utf-8?B?MGdBYmU4d0tGYS9YU2ZnV20yN2tMTUl2MkpWdU5Gd0tlNXhJVzNwY1AvbEZH?=
 =?utf-8?B?cTZqOWhnc0xyZzZneFgyamdvbFAzbnlIeDROS2tSYXNBWDhJWjMrNGRKTUFK?=
 =?utf-8?B?aWhnN0o5bGNzZnRVbVJTOHdmem5lelV1TnI1SFFudEV5dkdrSGRySFdPbm5I?=
 =?utf-8?B?dGJRTlhrZnUwbEhkVHV4dG1vY0h3M25uY0R6Q2dRaHNiTDYrK2h5WCtJakRu?=
 =?utf-8?B?aVU5bzU3TmRqZjNsUVhuRzZ1aXpmSVhFWWcvUFMzS2s2WDF4T3d6US83Nnk2?=
 =?utf-8?B?VS9CNDJYQjBaeFhUd0hoa0dtTUlzbjA0NDV5Ym9tS2FreFhDanMzSXFHdUVv?=
 =?utf-8?B?c0hWdThoU3RUSXJxYmR5WTg4NkgzbFRlVE9uZksxd0dYREt4RFZTOGNmTkd3?=
 =?utf-8?B?bmlkdXZTK3JqV2dtTUc1WHh1THMvL2d5VU9hN2NxZDU1eGFKOU03TytrMnRL?=
 =?utf-8?B?QVEzR1Q1SG5icUVqeE5tejRpL1kwR005dG9pVjhHcHMzUXV5NUhQcUM3MnNx?=
 =?utf-8?B?U1B3a09vZUpib1FlVUhGaGpoMmdxQ2wrZDExbUdsbEtPKzdNRU5jbk40S25q?=
 =?utf-8?B?OUEramhTNkJUaGxLM3hlVHU2MGFtQTVEYXdSSW5BMmhMLzZ6L29WZjErajV6?=
 =?utf-8?B?WHpmQzZOaXBwaENUQzc0NXJlSjhnaEU3TEpJdFJzeEtqd3JsYjlEdThvNTkw?=
 =?utf-8?B?dTMwbGxodURONVJHcE5uUUFzQUJmVjVLMXVHVWxKYU1IM2dPMkEvMEQwLzU1?=
 =?utf-8?B?azBrUHRucFc5VkdndTQrMlRJY0VRc0JmTG8vaklOZXFUSG1RYTMvS3dFVmtw?=
 =?utf-8?B?aXRaMFVFc0VjR3JUYm9ub3NhWjQ4Z0FWN0c0QzNLbzhtaGduVnprZWZKZXhy?=
 =?utf-8?B?SERraEl1UVU5ayt1WFFPenhYTmlianFPMllOc3J1ZDB3em91MjA2VkxYL1lT?=
 =?utf-8?B?VzBMNy96Mzh1R2oyaXJaQVFieFNPYmhnNVh0SWRVVXVYU2xTa1RKUmlEQ3Vj?=
 =?utf-8?B?eE1qM0ZrQlRiVVA1Nm5UYTJaTkpFcGNLRUd5UFhua1NLK0g0N0tDbVZhTUlS?=
 =?utf-8?B?VXd6MGx0azdqWWpPb29HRzd6akFZMzBHTWdvYndTRGYrMGN3cUg4dzNtbWIr?=
 =?utf-8?B?VWw0RDhIRFR6QTR4bDhHNHlkQ0JEM3BuN2tLeWhjYXhIOGVxMit3UzJVR3Qy?=
 =?utf-8?B?MFdkU21Pb2IybnQ3QXFDVk5JZkRCWFc4U2ptZ3lKZGRiZko3bmdJSDJQQVJq?=
 =?utf-8?B?TC8wMFVsam94eWx3SEVueVlad29PelNHY2FNNzJzNS8rNmU1bGUrTGlZTnRy?=
 =?utf-8?B?U3N1akc0TThwUGttdjlEeGhGb00zYjhxKzhpT05nSUhPem1RT2h5cmtOQjZJ?=
 =?utf-8?B?endzbkp4TFdoMjFabGgxOEN5NVZSTEsyRzFOWGFZRTB4OTY0MFkzQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e45f194-4ec5-4f83-3de1-08de4e612aed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 02:53:57.4163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QpRAVd5RO2P1A1KCfBMnxTd66YHf89q2QGFkuLzTLugt+VB+g8Vrdj4qYFrCxki
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163
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

On 7 Jan 2026, at 21:17, Matthew Brost wrote:

> On Thu, Jan 08, 2026 at 11:56:03AM +1100, Balbir Singh wrote:
>> On 1/8/26 08:03, Zi Yan wrote:
>>> On 7 Jan 2026, at 16:15, Matthew Brost wrote:
>>>
>>>> On Wed, Jan 07, 2026 at 03:38:35PM -0500, Zi Yan wrote:
>>>>> On 7 Jan 2026, at 15:20, Zi Yan wrote:
>>>>>
>>>>>> +THP folks
>>>>>
>>>>> +willy, since he commented in another thread.
>>>>>
>>>>>>
>>>>>> On 16 Dec 2025, at 15:10, Francois Dugast wrote:
>>>>>>
>>>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>>>
>>>>>>> Introduce migrate_device_split_page() to split a device page into
>>>>>>> lower-order pages. Used when a folio allocated as higher-order is f=
reed
>>>>>>> and later reallocated at a smaller order by the driver memory manag=
er.
>>>>>>>
>>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>>>> Cc: linux-mm@kvack.org
>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>>>>> ---
>>>>>>>  include/linux/huge_mm.h |  3 +++
>>>>>>>  include/linux/migrate.h |  1 +
>>>>>>>  mm/huge_memory.c        |  6 ++---
>>>>>>>  mm/migrate_device.c     | 49 +++++++++++++++++++++++++++++++++++++=
++++
>>>>>>>  4 files changed, 56 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>>>>> index a4d9f964dfde..6ad8f359bc0d 100644
>>>>>>> --- a/include/linux/huge_mm.h
>>>>>>> +++ b/include/linux/huge_mm.h
>>>>>>> @@ -374,6 +374,9 @@ int __split_huge_page_to_list_to_order(struct p=
age *page, struct list_head *list
>>>>>>>  int folio_split_unmapped(struct folio *folio, unsigned int new_ord=
er);
>>>>>>>  unsigned int min_order_for_split(struct folio *folio);
>>>>>>>  int split_folio_to_list(struct folio *folio, struct list_head *lis=
t);
>>>>>>> +int __split_unmapped_folio(struct folio *folio, int new_order,
>>>>>>> +			   struct page *split_at, struct xa_state *xas,
>>>>>>> +			   struct address_space *mapping, enum split_type split_type);
>>>>>>>  int folio_check_splittable(struct folio *folio, unsigned int new_o=
rder,
>>>>>>>  			   enum split_type split_type);
>>>>>>>  int folio_split(struct folio *folio, unsigned int new_order, struc=
t page *page,
>>>>>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>>>>>> index 26ca00c325d9..ec65e4fd5f88 100644
>>>>>>> --- a/include/linux/migrate.h
>>>>>>> +++ b/include/linux/migrate.h
>>>>>>> @@ -192,6 +192,7 @@ void migrate_device_pages(unsigned long *src_pf=
ns, unsigned long *dst_pfns,
>>>>>>>  			unsigned long npages);
>>>>>>>  void migrate_device_finalize(unsigned long *src_pfns,
>>>>>>>  			unsigned long *dst_pfns, unsigned long npages);
>>>>>>> +int migrate_device_split_page(struct page *page);
>>>>>>>
>>>>>>>  #endif /* CONFIG_MIGRATION */
>>>>>>>
>>>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>>>>> index 40cf59301c21..7ded35a3ecec 100644
>>>>>>> --- a/mm/huge_memory.c
>>>>>>> +++ b/mm/huge_memory.c
>>>>>>> @@ -3621,9 +3621,9 @@ static void __split_folio_to_order(struct fol=
io *folio, int old_order,
>>>>>>>   * Return: 0 - successful, <0 - failed (if -ENOMEM is returned, @f=
olio might be
>>>>>>>   * split but not to @new_order, the caller needs to check)
>>>>>>>   */
>>>>>>> -static int __split_unmapped_folio(struct folio *folio, int new_ord=
er,
>>>>>>> -		struct page *split_at, struct xa_state *xas,
>>>>>>> -		struct address_space *mapping, enum split_type split_type)
>>>>>>> +int __split_unmapped_folio(struct folio *folio, int new_order,
>>>>>>> +			   struct page *split_at, struct xa_state *xas,
>>>>>>> +			   struct address_space *mapping, enum split_type split_type)
>>>>>>>  {
>>>>>>>  	const bool is_anon =3D folio_test_anon(folio);
>>>>>>>  	int old_order =3D folio_order(folio);
>>>>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>>>>> index 23379663b1e1..eb0f0e938947 100644
>>>>>>> --- a/mm/migrate_device.c
>>>>>>> +++ b/mm/migrate_device.c
>>>>>>> @@ -775,6 +775,49 @@ int migrate_vma_setup(struct migrate_vma *args=
)
>>>>>>>  EXPORT_SYMBOL(migrate_vma_setup);
>>>>>>>
>>>>>>>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>>>>>>> +/**
>>>>>>> + * migrate_device_split_page() - Split device page
>>>>>>> + * @page: Device page to split
>>>>>>> + *
>>>>>>> + * Splits a device page into smaller pages. Typically called when =
reallocating a
>>>>>>> + * folio to a smaller size. Inherently racy=E2=80=94only safe if t=
he caller ensures
>>>>>>> + * mutual exclusion within the page's folio (i.e., no other thread=
s are using
>>>>>>> + * pages within the folio). Expected to be called a free device pa=
ge and
>>>>>>> + * restores all split out pages to a free state.
>>>>>>> + */
>>>>>
>>>>> Do you mind explaining why __split_unmapped_folio() is needed for a f=
ree device
>>>>> page? A free page is not supposed to be a large folio, at least from =
a core
>>>>> MM point of view. __split_unmapped_folio() is intended to work on lar=
ge folios
>>>>> (or compound pages), even if the input folio has refcount =3D=3D 0 (b=
ecause it is
>>>>> frozen).
>>>>>
>>>>
>>>> Well, then maybe this is a bug in core MM where the freed page is stil=
l
>>>> a THP. Let me explain the scenario and why this is needed from my POV.
>>>>
>>>> Our VRAM allocator in Xe (and several other DRM drivers) is DRM buddy.
>>>> This is a shared pool between traditional DRM GEMs (buffer objects) an=
d
>>>> SVM allocations (pages). It doesn=E2=80=99t have any view of the page =
backing=E2=80=94it
>>>> basically just hands back a pointer to VRAM space that we allocate fro=
m.
>>>> From that, if it=E2=80=99s an SVM allocation, we can derive the device=
 pages.
>>>>
>>>> What I see happening is: a 2M buddy allocation occurs, we make the
>>>> backing device pages a large folio, and sometime later the folio
>>>> refcount goes to zero and we free the buddy allocation. Later, the bud=
dy
>>>> allocation is reused for a smaller allocation (e.g., 4K or 64K), but t=
he
>>>> backing pages are still a large folio. Here is where we need to split
>>>
>>> I agree with you that it might be a bug in free_zone_device_folio() bas=
ed
>>> on my understanding. Since zone_device_page_init() calls prep_compound_=
page()
>>> for >0 orders, but free_zone_device_folio() never reverse the process.
>>>
>>> Balbir and Alistair might be able to help here.
>>
>> I agree it's an API limitation

I am not sure. If free_zone_device_folio() does not get rid of large folio
metadata, there is no guarantee that a freed large device private folio wil=
l
be reallocated as a large device private folio. And when mTHP support is
added, the folio order might change too. That can cause issues when
compound_head() is called on a tail page of a previously large folio, since
compound_head() will return the old head page instead of the tail page itse=
lf.

>>
>>>
>>> I cherry picked the code from __free_frozen_pages() to reverse the proc=
ess.
>>> Can you give it a try to see if it solve the above issue? Thanks.
>>>
>>> From 3aa03baa39b7e62ea079e826de6ed5aab3061e46 Mon Sep 17 00:00:00 2001
>>> From: Zi Yan <ziy@nvidia.com>
>>> Date: Wed, 7 Jan 2026 16:49:52 -0500
>>> Subject: [PATCH] mm/memremap: free device private folio fix
>>> Content-Type: text/plain; charset=3D"utf-8"
>>>
>>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>>> ---
>>>  mm/memremap.c | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>
>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>> index 63c6ab4fdf08..483666ff7271 100644
>>> --- a/mm/memremap.c
>>> +++ b/mm/memremap.c
>>> @@ -475,6 +475,21 @@ void free_zone_device_folio(struct folio *folio)
>>>  		pgmap->ops->folio_free(folio);
>>>  		break;
>>>  	}
>>> +
>>> +	if (nr > 1) {
>>> +		struct page *head =3D folio_page(folio, 0);
>>> +
>>> +		head[1].flags.f &=3D ~PAGE_FLAGS_SECOND;
>>> +#ifdef NR_PAGES_IN_LARGE_FOLIO
>>> +		folio->_nr_pages =3D 0;
>>> +#endif
>>> +		for (i =3D 1; i < nr; i++) {
>>> +			(head + i)->mapping =3D NULL;
>>> +			clear_compound_head(head + i);
>>
>> I see that your skipping the checks in free_page_tail_prepare()? IIUC, w=
e should be able
>> to invoke it even for zone device private pages

I am not sure about what part of compound page is also used in device priva=
te folio.
Yes, it is better to add right checks.

>>
>>> +		}
>>> +		folio->mapping =3D NULL;
>>
>> This is already done in free_zone_device_folio()
>>
>>> +		head->flags.f &=3D ~PAGE_FLAGS_CHECK_AT_PREP;
>>
>> I don't think this is required for zone device private folios, but I sup=
pose it
>> keeps the code generic
>>
>
> Well, the above code doesn=E2=80=99t work, but I think it=E2=80=99s the r=
ight idea.
> clear_compound_head aliases to pgmap, which we don=E2=80=99t want to be N=
ULL. I

Thank you for pointing it out. I am not familiar with device private page c=
ode.

> believe the individual pages likely need their flags cleared (?), and

Yes, I missed the tail page flag clearing part.

> this step must be done before calling folio_free and include a barrier,
> as the page can be immediately reallocated.
>
> So here=E2=80=99s what I came up with, and it seems to work (for Xe, GPU =
SVM):
>
>  mm/memremap.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 63c6ab4fdf08..ac20abb6a441 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -448,6 +448,27 @@ void free_zone_device_folio(struct folio *folio)
>             pgmap->type !=3D MEMORY_DEVICE_GENERIC)
>                 folio->mapping =3D NULL;
>
> +       if (nr > 1) {
> +               struct page *head =3D folio_page(folio, 0);
> +
> +               head[1].flags.f &=3D ~PAGE_FLAGS_SECOND;
> +#ifdef NR_PAGES_IN_LARGE_FOLIO
> +               folio->_nr_pages =3D 0;
> +#endif
> +               for (i =3D 1; i < nr; i++) {
> +                       struct folio *new_folio =3D (struct folio *)(head=
 + i);
> +
> +                       (head + i)->mapping =3D NULL;
> +                       (head + i)->flags.f &=3D ~PAGE_FLAGS_CHECK_AT_PRE=
P;
> +
> +                       /* Overwrite compound_head with pgmap */
> +                       new_folio->pgmap =3D pgmap;
> +               }
> +
> +               head->flags.f &=3D ~PAGE_FLAGS_CHECK_AT_PREP;
> +               smp_wmb();	/* Changes but be visable before freeing folio=
 */
> +       }
> +
>         switch (pgmap->type) {
>         case MEMORY_DEVICE_PRIVATE:
>         case MEMORY_DEVICE_COHERENT:
>

It looks good to me, but I am very likely missing the detail on device priv=
ate
pages. Like Balbir pointed out above, for tail pages, calling
free_tail_page_prepare() might be better to get sanity checks like normal
large folio, although you will need to set ->pgmap after it.

It is better to send it as a proper patch and get reviews from other
MM folks.

>>> +	}
>>>  }
>>>
>>>  void zone_device_page_init(struct page *page, unsigned int order)
>>
>>
>> Otherwise, it seems like the right way to solve the issue.
>>
>
> My question is: why isn=E2=80=99t Nouveau hitting this issue, or your Nvi=
dia
> out-of-tree driver (lack of testing, Xe's test suite coverage is quite
> good at finding corners).
>
> Also, will this change in behavior break either ofthose drivers?
>
> Matt
>
>> Balbir


Best Regards,
Yan, Zi
