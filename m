Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518B3B354A2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E50210E2D0;
	Tue, 26 Aug 2025 06:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cKfUfDzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31B210E2D0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 06:30:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqpXKdPSulJvKVS9bfUNvenEFQoCaKq5nUoM0Wd4kTos+c2iPFlCURhIW+IQDw+9jvPFpFeWs86imlXCPNc86PmetG0UE6z+rq+S6Li6Pqyv6xyn5MKz1De2wh48HxUmu9D8yhJSIyFxsrCAKZ5HNHT1UBC9InjwK9elWOANal1go3htCdDbLjFmYc0vbW9YNHshMqf82wXD+uOm1wKHgHlsqWnLnJBcgOv0+rOacWpCIcAZRTPQQbWYQiXTlyXuJ21EDTepwEdErvGMSXoSXMmaPXQ3RX/bar36tZlnNwNKSEbJQUI0N/RXrsew1ZkVQqj8aNFhfe8yIRGkvKSJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeHh2s0UGVkNcDLyFZd2yvaihHhgHuC61FcbEn4qhGI=;
 b=BViv3Wbf1IZoN/GKxnbgSPdK4Eo0tQEAALJD0PKc6gJ7qMGPaR3wAl5Ja84ZGgULNAM414AV4F8exfPWsa9AGwEZ+cPiv6r34Tg0lTlA4ipqpLy1dEWUSp6VUy3fuES8uCl6xOPVWF6ia3JtK0HqpeENzLJx9MRENlAMabB+aIyNvjhweqGylYzvILX/QskXwE1nIx75jrgEjHgJgwqKuZCIn27oX+VZj8h5TXlfJTN+K3+GhzkAYuB7LSeU0jilSCTZExy79PrZwcrG9tn98rNU+0FfDhyVpyNSOrgrp3o7BBDb4TnesQ2SjWKlO9wdidKvtqkWsWfqBLpEtVlVVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeHh2s0UGVkNcDLyFZd2yvaihHhgHuC61FcbEn4qhGI=;
 b=cKfUfDzSPxlFB1A/Wvw7F9v+Cuo5dSB7fa/io+qUxPQ7t7Ji4K67oiR3D+wu/bRV7pdgQoT+7M76o2Oouko61DrQZLsnXzLsFrFUpF3ENoGYbvNnXMVqDoNnUhSmhLRn8+hfTA74GXbQDvRmbP2lQ+s4OePg5WFmJ4opY2wvfF9cOG1mXzDOalDo1UhxkJOARtPe2xuXDHC0pbECmchs+9PL+cMoMslgVtwfCflOO08MdpA7aZqIcgBOFPQ70c/++K6H43jvpfgj4UxOYCkYgGfuLmiw5javwNMTdimZEnz1dUwQuTMga/O/JdTJdjTMJD5KEn1QZqrlwnpOpORc/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH0PR12MB8775.namprd12.prod.outlook.com (2603:10b6:510:28e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Tue, 26 Aug
 2025 06:30:22 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 06:30:22 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com,
 skhan@linuxfoundation.org
Subject: Re: [PATCH v2] gpu: host1x: use dev_err_probe() in probe path
Date: Tue, 26 Aug 2025 15:30:18 +0900
Message-ID: <3902554.kQq0lBPeGt@senjougahara>
In-Reply-To: <aKgKrCxUvP9Sw0YI@bhairav-test.ee.iitb.ac.in>
References: <aKgKrCxUvP9Sw0YI@bhairav-test.ee.iitb.ac.in>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:404:56::29) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH0PR12MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: 326c51c7-f83b-484a-39e1-08dde46a0899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkxnN3dIT0NuakQ0a3orTVdCT0VNMkFyQlE2T0lOYjgvZ0NJRzBQRGx5L095?=
 =?utf-8?B?eStmRTVsVjlHYmpPY3pZL1F0VjJlaHJ6azVaSUJIaElKNTF6WC9pQW42NW1r?=
 =?utf-8?B?NWF2bnR3RGFWNnpBdURBNGcxZ2o2MUNicmR0ejNLTmRrM1M3ckRBYndWM0Yx?=
 =?utf-8?B?blhPbEZ3UmNyQVR5THFrNmR4L0J0dTN4dTJBU0tXOVBMbktKM2IxTlBaVlJa?=
 =?utf-8?B?c2kyaHk5bkFZa2hpU2grMjNTZTdpRmtvOGlMOEd4NWkydmM5UCtFQjQrd3Fx?=
 =?utf-8?B?NFBxUUUwZng1dFp0bUpUSTgxa012Z1dFRXUzUko3VWh5d1M2L0ZNRmpoaTYx?=
 =?utf-8?B?ajUyeHIrajZNNzhwamZTb1JtZVNPOC80Tkp5YTRXTTdpZW5MVm9kbFZLOUxB?=
 =?utf-8?B?WEF0bGlWMVFxbVJOejJObTAwZ2tyU1FzZkxoNXhZVkVsbjVGeWJJR3E1elBP?=
 =?utf-8?B?alFpUVk5eFdrZ0s4Znc5YXRIc21HTS9KdjladlpHcU5CQllFaGJneUVVemdF?=
 =?utf-8?B?ZWxRN3lhODBNNXdPcmZ5LzQ1L2xMRS9XeXlCUXhlV01SckpDeVRBR2o5Y2xZ?=
 =?utf-8?B?THkwL1hwaGdtN2JjSzRVWnZNRnRMcm5zSVZqNGJac1hIaEtHYzYyN1Z6ZDQy?=
 =?utf-8?B?bEV2dlJnYjA0Rmt6d0RMR3pxRE13aHNGdXIwbWVkSmVGQXAzRHFBMVUvcm5O?=
 =?utf-8?B?ODZYMmdJeXhRZzVXNVlVOU9YeHMrbU1rYXNRbk5VaVlkUFc3RDRDcUJUbEFJ?=
 =?utf-8?B?dnBXZnJBUS9MaHBkQ2JBYlBrQVdDVHNrUkdSQXBOc0hkejVzOUNBanlOWDlo?=
 =?utf-8?B?R3RLWCs1aXBpdzdrUFNodWpOY2J6RDRjQWhIK2krTXJWUTE5UU45TFpUZEJB?=
 =?utf-8?B?b05FcFAvTHpqMXg5bzBJUkcrVDEvUXJNMUUzYjNNb2p2bEMzS3c1MUgzNkJs?=
 =?utf-8?B?N3h2MGpnL2VQdlYwUVBmUHBIbjh4SmRoeFphblZIZHk3M1BxYnpEcWZ1Nzl3?=
 =?utf-8?B?RFF2VldDeFNKM1hTbk1waHpHS3R3OUdVckpsdndROTJoMEJ4cGtMVUdrNFFN?=
 =?utf-8?B?QTVMUmM1ZXVsSk9pSC9iM25mbThZdFIvSU90TEJRZGU3TGo0TW9BY3RhQjRD?=
 =?utf-8?B?OCthYmhyTnRtSHdUdlh0TkNjNmlHL2ZQbjZ3WnJPcCswQ1VPVUFjSkREVzRF?=
 =?utf-8?B?cjljS1V3eElnczJYa29FYzh0M0kyYkV0TWszVkdkOEo4V2hqR0ZNU0pXOG80?=
 =?utf-8?B?dWtXUklBZnNHZnRHdi9Lam9mN0xiOG54Q0EwN1pIalJzSXA3V3FMYnJKZHdW?=
 =?utf-8?B?ZjViL3daeVlHajdHcTMxY0ladXh4bnZKUndSdm16ZnJOTjluRlNLQVhOT0ZR?=
 =?utf-8?B?dmUvc0hwUitWWVdHQzJNa0pJaE5lT3JiM3Awd3pqamhsM09MS053T3NEYUEx?=
 =?utf-8?B?NHdEamR3T01LUmg4Z3NIUkU1NEs4d3lER0lRcURXN1p6Q1drSVEvN2hZbTRP?=
 =?utf-8?B?RWF4VVRWQkRmQkhFV0dtS2oxOUhQdC93bEs0dGJBMlNuUEJrVTBvK2kwZlk4?=
 =?utf-8?B?TXYyaloreEg2aUtqWDBpZEsvZnRQSmQxb2RsRjFqaXBVWjdpQTN0WlVqZW1D?=
 =?utf-8?B?THRVUUlrek0yMEszQUVmTU14allsV1VZTTdMWnlhZHlIMzNhdzBCSG9NVkhp?=
 =?utf-8?B?ZWp0djkyUlFvckx6WHF6d0p1YkFhNjZ0dDhHYVZETTNQK2NNcTAwVlRuRjVL?=
 =?utf-8?B?ZFBlWHVBd2lHVUxZSlU1YjhQKzJlWkIxL2pJNkZwM3hQQktOVTZFRFRyUGpy?=
 =?utf-8?B?UU1sN0FHSjBSa1NjSHNJQUh1UFFmZzE0bmtvcXZEWU9qc1lVKzRXdnBPU3Ax?=
 =?utf-8?B?ekhVUklMa3UvWm9hbEpCZG51eHFrL2V1ZFlGVUpCNnppVjJHQW9ZNzIvVFp3?=
 =?utf-8?Q?c4qbpHG1uXI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDVMSTJ5V2crWmg0aFYremR6dUc2a2lxbG1hTTJOSzBLRmJSdGVyTXMzV20v?=
 =?utf-8?B?bS8zVkttWml1dGlybW44aG02MmdKcmRBMk5uM3B2VGhoU0VmSDF2L0VoaU1S?=
 =?utf-8?B?M0FaRXlFb0hXQWxibW5nME5jaFpGRkxWM3V5ZXlBZ0ZvMmNXL09GN1RBSU1P?=
 =?utf-8?B?Z1NmMzEzempzTk9UMFhDbHFvVDlGczlsNFNKRFNSN1hPWU5pMzRHN1FnQ0Jn?=
 =?utf-8?B?bzFTeURZcG94ZmNaR3RZYVNVNytOcnExV096OTc5SDhmR29ybnVhbVJiVjBo?=
 =?utf-8?B?NWRDVHlzQUNJbjF2MTJlRUtSc0lxa0RTT2NnckgxbjQraS9vZkJDVVpOVjdW?=
 =?utf-8?B?TGFKQklGKytjL0dzZ3BhdG5WdkVmd2Rxb3p2TzJ0UFBHa2xFcWVDUkVoblg4?=
 =?utf-8?B?Z0NKS1B0eVpFS1dzTVJiSUFhYkw2M2RiQjM4VkRkRnIxeUF4ZzROQVhKTXJ0?=
 =?utf-8?B?WThPWjRnb05PTnAyUXZNbVI4TnhSOW5QUGttTUNZUFBTNnZZR3lQdlAvdUxN?=
 =?utf-8?B?OU8rK0R4aWtZeElmcTE5aXI3OVRqZG9PRlIwMThlU2sxb2llbERMTk5EYStQ?=
 =?utf-8?B?Q1pIdFdJdURuSC9CNXZHUktjRDlBam45SzBDTytINWFZMVprTi8yM1l6TFhB?=
 =?utf-8?B?SUtzNHJMbjVHdTEwUEpzSURxSTlZUUs1R3ZnbG81ZVN2ZmROQTIxRUJOd2l4?=
 =?utf-8?B?YnNGVis3VHFsbGNTVFFuVThtemxJMi85NXllbEJXVWU3bzRVZlpKVHlhejF2?=
 =?utf-8?B?NXpZakpGUkVsdnk3VlptUExKSEFVblhDdEI0WURKNEtBenlDL0pESGFDRmVX?=
 =?utf-8?B?aXRUN1ZwTGdkVGZ3MTRsU3M1NHF1UzFJa2lIbVVqdmlBQTI4UnhwTWVWM3Fu?=
 =?utf-8?B?Y0lLMTA2OUpZSk1VZE02OUVtMHo5Z25paHIvSWtuNno2OStGN0RFSWJDTW9M?=
 =?utf-8?B?ZUlOZ1dGOW1OeFp1aTEzT28wRTlibnc5Y2NNcnRoaTJLblpoSHBHcUZVbmpO?=
 =?utf-8?B?aGRKK0JBT3VrZm1MU2dRdkQ0ayt6dHlPQWMvQzRlb2ZyN2hHUEtzS0pEeUN4?=
 =?utf-8?B?SCtxSXZhZ1ZSOTFyOEIzbHZaU1J6WisyVnJ3MTBlVW5CQ0NYNk9QUU1DZkJ0?=
 =?utf-8?B?dGUrYU9mNVEySUgrY3FUWHFnekl2K2hGZUdmNEE0Ujk5bjJHbEhSckhNR0pX?=
 =?utf-8?B?QTRUQWZnRUlpV054eU9TYVkxbGRSeDk0SWcwakJyUWJoL1hzakJ6aXBoQVdP?=
 =?utf-8?B?S0NKSExhSWtXYUlhQnVQRlIxdXBPbTdjMFZFMHVCbG9IY21BZy9YR1N3eGNJ?=
 =?utf-8?B?WkRrRHh4NEh5OWJRZHNIczJEVmp6WWxOdmNNTGpsaVg4V2UrR1ZLT0dINHVv?=
 =?utf-8?B?QVBKRjF0L1RDOFRvN3dPUUh4WWNTUHFVT09JTDFFVjY4Q3VoeXB5TkZIQURZ?=
 =?utf-8?B?OVZHYjRmU0RSRmNUOE9VQTJXM1VkMjFMNWhwUFNhQzBJUzlFZ0gzREswZzJQ?=
 =?utf-8?B?cnhRdjZINGI4dXljOFdpNkllOEYrVUtOdmptT1YyclU3Qmx6d2c0WUZsUnUx?=
 =?utf-8?B?NC83SkFDYVJaV21RSmY2YUlFckR6ejRwT2hKNmdNTkM3TnkwTittdTNnTVpS?=
 =?utf-8?B?ZmxwaDdMVzRTUEE3aDc0NDA3R0lqVy9nNkNxOTZkSnBZbkhNQnpuL1NCMkhO?=
 =?utf-8?B?NlZ0bWhxeXhPem9LSmRNVjFTN2p3VDA4a3ZrT1BqcjZCTVRYaHptaUE4UmFp?=
 =?utf-8?B?cEtxZE5ZWVFxK0tIT3NmTFkrcXhKQno3c3piZXBIVlVCQU1MVkE4OGVqK21O?=
 =?utf-8?B?S0RIb2UycWNpM29yNGxnakcweElxemRjNTJIQlZNTlo3dmk3M1ovUEZuWUcr?=
 =?utf-8?B?KzFCaTVDdTJzOFZaRGNFalhLMUhzSGhsU29SVy9Hb2hqa0o4cnFwQTlZdkNn?=
 =?utf-8?B?RWs2QUJMWjFjYTV2MS80dEJDZURiRzA1Unl4dlV5TjRzWUxoOXErTVhhZ1pR?=
 =?utf-8?B?MFhOd2JKbnAyTVliNU52VGNzcUdOTVNpcjlzTVZoYS9CSmEzU1laQXUweGw0?=
 =?utf-8?B?MXk4bm5maUUzSlEzV09IaWZLY1A3dmJKTUZZMnlVT015d3BLUWptdTEzdk81?=
 =?utf-8?B?cW0xVXdPTTVVSmNFQSt4d3dRd3d6YzA1Z2hHTnY0S0V2N2xrTm9mVVgrendS?=
 =?utf-8?B?TTVkMVdwa2tPek45d1lhbnZSbitmc01WQzhQQU4wbG9mNEZGaDNSaHJqcEp4?=
 =?utf-8?B?U3NZb3pRR05JVG9QekpwNmxNTE9nPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326c51c7-f83b-484a-39e1-08dde46a0899
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:30:21.9582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzrLW6p2p9oodxptOs8OxR/kicVHRrjRtp1i50WVaWIpmxCkdzQkIHt54AzD7ak0Zrky2uUDc5RaJrJpvT0VUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8775
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

On Friday, August 22, 2025 3:14=E2=80=AFPM Akhilesh Patil wrote:
> Use dev_err_probe() helper as recommended by core driver model in
> drivers/base/core.c to handle deferred probe error. Improve code
> consistency and debuggability using standard helper.
>=20
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---
> V1 -> V2: addressed review comments as below.
> * inline - err =3D PTR_ERR(host->clk) inside dev_err_probe()
> * avoid printing err, as dev_err_probe() prints it internally.
> * rebase and compile test with v6.17-rc2
>=20
>  drivers/gpu/host1x/dev.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index 1f93e5e276c0..c586c242f2c2 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -585,14 +585,8 @@ static int host1x_probe(struct platform_device *pdev=
)
>  	}
>=20
>  	host->clk =3D devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(host->clk)) {
> -		err =3D PTR_ERR(host->clk);
> -
> -		if (err !=3D -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "failed to get clock: %d\n",=20
err);
> -
> -		return err;
> -	}
> +	if (IS_ERR(host->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(host->clk), "failed=20
to get
> clock\n");
>=20
>  	err =3D host1x_get_resets(host);
>  	if (err)

Thanks!

Tested-by: Mikko Perttunen <mperttunen@nvidia.com>
Acked-by: Mikko Perttunen <mperttunen@nvidia.com>




