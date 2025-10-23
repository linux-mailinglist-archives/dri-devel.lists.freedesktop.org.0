Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37045BFF1E3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6728B10E866;
	Thu, 23 Oct 2025 04:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fR36UbkZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010065.outbound.protection.outlook.com [52.101.46.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5907410E866
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 04:33:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8bg4T/Sh0WCwUrsKNK96yA3iagkYQJoIqZROMIqHNlwYFU1r9JbaUCu5DNpSW+27sink3NzLBKh/Svz5pj2Cn+dBoo6u8W+OSounOHNuS8Jvh/ZRr2e3b6KAhj67kB3UcrXbPh21c8w369zt8O0y9jwqPf1Q9HXLfN+Z2aR8IHEb3WA8UmLHO4JaaZrIX5v5au5Pbf/t5LfaMJsoomMiWwvAFsPbiaAK83iC8xg6LUdf0z3d0DCJGa2Cp+rP/xY16mhWvTkO+eNtRoiaFAUcFDNpgxVRoFX0kY8zLoijMZrEscWxWUc/7Av7SY2JMBQUQU2kbabbHKIj/YSO2v+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cqwP8RdjG+tPB6nJwDRMAUG0q/nfhU1LWo5PINegww=;
 b=PfSO24I4kdBOO/CFQnd3j2iz7O1Z29x9otNR/GeNVNeuoTPdKT3yA8JZ1GDrMWcjCDbnoFqVGTmb10g6nux4hpY17W46B5jMulA+IVviQvRtoYWDlMjiK7axztvpjhRYQJPEd50r3oLEnG1ZuyNp0x2qGXNZ28/uJZ+OYyGqAAQGg3b511u49kwviL3iNDlpcBAE1SQLFnKwLwyVzYZKjXjxoR5ApE20LEn3T2or4sNDi3gO5a193i1zRPVGg4E9bwIpFlisIjeKkU0QmAAEZHbiYQKe6dRqBIZmXL6jmBmlHZH0Q5wPGzM6WA2InDajaaf7gi8WjC+WMOtdAKe99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cqwP8RdjG+tPB6nJwDRMAUG0q/nfhU1LWo5PINegww=;
 b=fR36UbkZ2fo/4KKEgclwjDT5TUFuBIv2Xuyu+npDtquCA93t2hnq9jXYFsMWu8seIOcYZhkvthSabczWE9J0aSZ/71ld0dNGfMX22ZpoZXhjH09boo+fz0cjMizpJK4TcrhdqWOXg6mPIjO01lMZ/DFcYQ9vCbrl95kcCfD52lrwcxmOb+A0csytTeHweM5m9wOcsXOE2AG1jLmOFDtP+kB8lZkli6JozfqeF7N+IB+zHtF2NkZLTafdBAebUHwNYz6GCr9M8Oe7J1SjiKzMblqlRkV4fz7DfCo448bizG202r7yKsp2LF3fK16arX8pASqwu5uzMHYlqm/cyT6okg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CYYPR12MB8655.namprd12.prod.outlook.com (2603:10b6:930:c4::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Thu, 23 Oct 2025 04:33:00 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 04:33:00 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 jonathanh@nvidia.com, Ma Ke <make24@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 Ma Ke <make24@iscas.ac.cn>, stable@vger.kernel.org
Subject: Re: [PATCH RESEND] drm/tegra: dc: fix reference leak in
 tegra_dc_couple()
Date: Thu, 23 Oct 2025 13:32:56 +0900
Message-ID: <2620730.K71DO8KEF6@senjougahara>
In-Reply-To: <20251022114720.24937-1-make24@iscas.ac.cn>
References: <20251022114720.24937-1-make24@iscas.ac.cn>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CYYPR12MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f3d109-7db0-4e03-f156-08de11ed3f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2ROWlo1bUpZVzM3RThvNEJ4cXE1MTlzcHhKK29jUS91U0s0N08xNTBSN0F2?=
 =?utf-8?B?VmdGTXlodkFrMytwMUo0TWZ6Yjd1VWpsRllIZUJBV1lDMnorNFFtNEtaNC9n?=
 =?utf-8?B?cFhGSFBRa0YxVXkxSHRVNGhIdlF0UXJkbFR4WXpEdWNzalE5aDJsOUtKVndC?=
 =?utf-8?B?MGtHU3FEOWk4dkF6c3JRSzAxcnNGNjJZRjJqdGsxZ2pRTnhlWmJxalRFNVg5?=
 =?utf-8?B?SG9DaEttUzl3OWluOTBlQmZDWXlZeFdLQy9zd3pUNCt3UnFaNTZoMkNnc0Zq?=
 =?utf-8?B?cWJnWWRUQnBmUlU5dWlIV3ExRkFJRm43UTR1SUVyL2oxNG1tZUd2VDZyUWsz?=
 =?utf-8?B?bytOVERCb2tmS3BDQ2VuY2xoNmZJY1ovUER0MmJ2a096TTFOd2l0RmN5ZlBj?=
 =?utf-8?B?VFNtYnJpZ001Wk9iUnI3RDJkMXNsMUt2M254bm9oRWdjRFdEUW15N3dYZWxr?=
 =?utf-8?B?bjNnUmdNWklTM0ZqdzFpYlpSZlpjeGZxdFRQK2d6MzZ0Ryt5akZ5eDZGMWIz?=
 =?utf-8?B?RXJFSDVnaTZzOHlxeXJuQTVJallyVmliTG9tbGE1bVpNczBvZldTNGlKdmtV?=
 =?utf-8?B?RjVaaWZKL1V2RFJEZWY0allwVmtnb0FiQ1hsN29rcGNQL0hSZXc2RmdsT3FG?=
 =?utf-8?B?ODBYMEMvempQcWhVVXpabEs2RHVYd3kzcXpOY3BYbHllWCtTSmhacmFJRzBB?=
 =?utf-8?B?YXBSSkZXeHNTa2hHM3pybmpUZ1VEZWtOUldJcFhnMHNkaUVCb1hXRFJCZ0pD?=
 =?utf-8?B?VHFpY2hjdVB1MFdGMnlVTExNT1JUeWQySkQ4dHVCb2REOEl5WEY1T0RYSHU4?=
 =?utf-8?B?ZXhjVFc4ek8ybUZTUXJyRmV1SUU1N0l3ejVBeUc0WDZuZEcyRFZycFp0dlM5?=
 =?utf-8?B?NWozZEk5TGkrL2RaWmJFNWxjMjhPaWZ5UDQ3ZW1ZRE55bjB0Q2diLzdhcVlM?=
 =?utf-8?B?N1lvNHBUMGp3bmxseDhXdEdsWE1lTjl4MTM0RFJBSUd2YUV4VUR0N1ZrNzI2?=
 =?utf-8?B?RGdad1ZpRk5wKzhjdXlqSjVENEtlNkdzMjBXeEIzaVFwU25mNWRwellnVzNi?=
 =?utf-8?B?blhLNy9aVlg1TUZON3FlLzN2NTRlL3FieXlsMStBR2ZuOEFMQUk4dnJsS3BE?=
 =?utf-8?B?c0hCQXl1Ynd2M1haOTN2TmFiYitDNFdoK1d5dkVwd0lPN2l1TWVGMXRrdmpQ?=
 =?utf-8?B?UE90SDMyZ0hjV1gzcnFFQmpRQnpYY0Vpd1ZxRmI4QXkzQmhKQk9ySE5UVjJG?=
 =?utf-8?B?V2I1Mm9NSks4OHoxMjJ3NCthNkpWMXJLMURkQi9jK0QwUzBEaklyTEs1UVoy?=
 =?utf-8?B?NU91eHJYYmhXZUFQUGwxQU0vZUhNQTVXVGgzc2thRFNMOUFMMjlrWU1zYTVl?=
 =?utf-8?B?QXRjZmk5cWNEWk9KcGJlRUovY3dFUHh3V3hCb3RycEdwRzRnYVBNTkdNUEpS?=
 =?utf-8?B?Q0tEWVcxVG1OZXVNWTlPbnpweWRmS2M0T0V3M0ZwaUYxeU92S2M5U25tMnFj?=
 =?utf-8?B?bFlzSnk5ZERsQ0lMdHJsNGZFRzBXMlVUcXR1cnpaL2FqQ0ZLTXNKVVhocmdl?=
 =?utf-8?B?QW5vSkx5a1oyZGl1c1prYk1FdDRPbmtqaEFUcHNtQ1pVc0w2c3NnMGtRYVdX?=
 =?utf-8?B?Z1YyUTRTdUVKZHg0cWZzaHJ0aUFpdVZrRTZSNURqTG85cmpCc1lMUW1WODVa?=
 =?utf-8?B?dURUTTlPMkJGazRsckQvWWcwUG5HbWhtZHBSaWozT3JvZmVWVFNJN295c0x4?=
 =?utf-8?B?QU4yR2ZnUW00SWE5dG1TMmR3Y05HemE4bm5yQlFvVWhaTE1RS24zN1Mxamh0?=
 =?utf-8?B?RHBZOStna3pDS0RCS1p2clpEQThQRHZyblQxLzBLa25RUVI4RkRiS2tiaXYw?=
 =?utf-8?B?OWZET24xRUkvZC8rRGU1WitvQUVZZ2lDRDErV1N2anVxbFduek1iemRXSUZn?=
 =?utf-8?Q?wLwBWLmqX8fu3Bs4/qHXzMqJgZAq9ufB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzY3dnB5VHBSeGlzRGNsaUlJWnkzbVNRVTBTZzRHcER2UFh6QWNvOTVNdUU4?=
 =?utf-8?B?ZExlMnIvM040RHRBcFhLZUdDdkZyRU52VEJtbHJCbEQ4OWdUVEJ2QVJyV202?=
 =?utf-8?B?UUp3KzNJbWRmYm9vZzMwVytuTFRSbHNOT3BLZ3AycE93YXZpemZqRmxWc0Fj?=
 =?utf-8?B?cDB4WTFHbWxRSkwvSzJ1SE94akUzY3BXTURPMVJtV05TNGRnMU9VWW53ZDho?=
 =?utf-8?B?NEF2VE9vVkpuQ1hOKzQrRmQyMGtybWRWV1dZWnNHZmExbWpBNjVtN01UR2gr?=
 =?utf-8?B?ME1aYnRKUXFxaUtXZnRkVVlHSHJhc01CQk9memVPdVk1czVYb3I5akZxd1Q0?=
 =?utf-8?B?aFdtNXNmNDV5d3Y1ZnI0QURTeVdkMVpES004bXlGSzlucFppbGxEQkM3ZVQ0?=
 =?utf-8?B?SWRnNEh0dUpVTEw4TDlDc3hUMkdMVWRoYU9zZFRmQWR2dE9ndGUzMGd3RzVX?=
 =?utf-8?B?MkcxanpwNXdaVGswNlFUaWM4eHh2b21vNGZqcVJGOHNqaVJzTDRHdStaKzFv?=
 =?utf-8?B?bEt6UGxUL250bDZoYXNWeVVUend2SGpmR1JIMnkyNW54SFlJL3ZKeWlUaTh0?=
 =?utf-8?B?dlExK0NYc2ZJWi82Zld6SW9JTUtEWjNlQ25WTm5HMXlSQi9PVFpEeXZpOVFr?=
 =?utf-8?B?dUt6Qlp6S2Vzc3ViUTZEeU5XY0NjUzlodHlzMU1JbUpMRzJmS0VIT1FsZXpk?=
 =?utf-8?B?T05wTWRiN09kaDg4M2ZTNWxHY2h4M1RrV29SdklpSzlOVUNXRFZUMnRtcEVD?=
 =?utf-8?B?RXhxOFVwVVl3Y3d0TG9QajM3eFhXU3VabWZ4cDEwWk0xRjB3NkpydGdSZm0r?=
 =?utf-8?B?eWNUUVRueUl6VUdiUml1a05QanBrYmNPRk9RVTgwSG03QmRlYnVMbk5iUDJS?=
 =?utf-8?B?T0pmTktxMnZaN2dUaXhEcDE4eVNrVEluc0k2WVYxZlNNazVPS3E0ZUhRNFB0?=
 =?utf-8?B?eHlsY0c5c0tYdTlCVFo2T2hMQUZqZW1Qb1pRdDY0WHZ0a204WFZtN0gwNUla?=
 =?utf-8?B?VHcyWGhNeXRpNmVFbXp0Z1A4VXZHYlYzRTJ1T1hGeHIrcTMzYlVPeG1kcytY?=
 =?utf-8?B?eTZHRGxjMk9KYkRTWjZLZDZFd3NqVnFUQTJZSGgyMGpXR1dTa0ZwbWFzaVVa?=
 =?utf-8?B?bjRvRlBqOUN3YWpOcE9uS2ZKR0ZpSVc4cEo4bEVhSG5GaHhWK2h6QTNJSXFu?=
 =?utf-8?B?cU9FeHZNSUJHVFNLQU1vT2pYaDJRS3hYRm9QK1dEVGZhbEtlKytlUFRVNHZC?=
 =?utf-8?B?RFZPdE9peXpOc1FwVzFoa0c3cGJuc242WXJUZ0M1Y0NYeGllUW1IZ0lqcXhE?=
 =?utf-8?B?cjBWTVJCcWU2Sk1ZM0JVamdITXBFS200Q3VqZXRieTVVT2hzYTB3aHl1bm5m?=
 =?utf-8?B?OUU3cXE0bXlPZ21MWXFVMEtKNHFRSEVBY0JOSHBtTk8vTDMyWWxiRndKL0Jp?=
 =?utf-8?B?WFZQekJuQkp4RlBvZFBCQjM5S1dDd2J1NXIxTS9KRTRhMkIza0J6RnJaTFZT?=
 =?utf-8?B?eVhVNFh3WThXaUxtUUdCdFVjUGovemlzUlFOVS9UbktmS0M1ZHFBdkljNjgw?=
 =?utf-8?B?OTRVbXUyRTBaZTFpT1NtNmFOcDl4MTk1WnhDTDdwSzJxQ0tuTnc5ZmJiajRy?=
 =?utf-8?B?VVphbWNpajBJRXZUbWJ4VlNUbThTWlNWdkpqcU00T240Wit3VHVmTWZDbURS?=
 =?utf-8?B?RCsvU0pyWjdRcVFHTEhyOEkrR2Nwb25WOVJRTG9jK1JNV1NtcmIyQ2g4bGlE?=
 =?utf-8?B?VE55TFg0cG8wZzJpTVhhMWtMeTY2ei9RUE5RekhsWmVZQ2pnVkl5dy8yR3My?=
 =?utf-8?B?OTVJalc1ZmxZelFLbXdKSGNLRmVIOGY5OGdGTWlLMTZ5dEtINldtYjhmZWhU?=
 =?utf-8?B?dmFhTWJCakhTYVVLQ0t1TDNaaGFNd1RiYXUrK2xxcGsyKzlXRnBBemh5Z09j?=
 =?utf-8?B?THlHTXFZODVIUTEvZ3hZR1c4MFFsSFhySzFRR3ZFczdwanViQldvbm9vcEEw?=
 =?utf-8?B?SE0yZ2tCRVVJdm55bXMwWnpxY2xhakl1bjRzYkZMT3hWNDY1K2ZJeVZrUFBx?=
 =?utf-8?B?SmFNb05JRDZvM1U3Q0pCK1ZYZ0lrMlN5WElpb0IzaERGclFxNy9ad09ZK1lx?=
 =?utf-8?B?dmEzeTJHSEhTNUdVc2hBZlM3d3BoLzhaa1MxbUVpQU9MdHgrRzlNL21nS3Ju?=
 =?utf-8?B?TDBGZ2VJOEUySEpUUUNYY0pUZkFnWnJsUXFPOTVCb2RONCs0d3NVNXJ2YlRr?=
 =?utf-8?B?dVp4bGIxcC9GVnZQcXRuMDNuSkZRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f3d109-7db0-4e03-f156-08de11ed3f28
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 04:32:59.9560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tq3AuiXziUeL/VGcu/C+lLMyAlJeQjU7TZZYhXjy5EObjkmw8oNAYNOgiWEXTqlePA/E1Wv55qQuyyfb7QpXdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8655
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

On Wednesday, October 22, 2025 8:47=E2=80=AFPM Ma Ke wrote:
> driver_find_device() calls get_device() to increment the reference
> count once a matching device is found, but there is no put_device() to
> balance the reference count. To avoid reference count leakage, add
> put_device() to decrease the reference count.
>=20
> Found by code review.
>=20
> Cc: stable@vger.kernel.org
> Fixes: a31500fe7055 ("drm/tegra: dc: Restore coupling of display controll=
ers")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/gpu/drm/tegra/dc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 59d5c1ba145a..6c84bd69b11f 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -3148,6 +3148,7 @@ static int tegra_dc_couple(struct tegra_dc *dc)
>  		dc->client.parent =3D &parent->client;
> =20
>  		dev_dbg(dc->dev, "coupled to %s\n", dev_name(companion));
> +		put_device(companion);
>  	}
> =20
>  	return 0;
>=20

Acked-by: Mikko Perttunen <mperttunen@nvidia.com>


