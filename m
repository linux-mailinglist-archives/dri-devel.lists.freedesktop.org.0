Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26878B7E768
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702A810E40E;
	Wed, 17 Sep 2025 03:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z71521IY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011069.outbound.protection.outlook.com [52.101.62.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB99310E40E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 03:54:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWPjIFVtfNVfReXhHu5yYo7lW5Yv0HiiQBAHtYunpseUN8VXpWAC7o0MytJzbc/1B33trsYK4IFBVZBnA0VRradXU3QnfPFbY9PIJaXMlsyjAS/dD3b5aV7tPFySLOAmC4r4Hr+BGj+VjGav+qCbDuPluD6M9thlOKfj7oirHVlVOQfw6iVrTvh3gubSm1kDCe/LX5IncQEjYqjPpVTCJI73bgGXo4M7Rh7k8DBE4UrdeACnIeKr+E45kosuDrNJDvavRrvrihZSjP1jpxsydmwoHTP1zV9d4XzhOD8f+UR5uzAPnq4YlFwepYpjEKv2Vr7siR5g2WNA1yhAk5sSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Whx/O0xhkmg1H8Ed4utNPDv2ldNCw/d3yyIzbHWPpYI=;
 b=ZkkmVp6zj1b/C8dv4DhSXnzEETD+kP9OAf6quGM0V2uYVrdTC7nW5CCPCpoIvy7gRYFWGuCtdqz3HXK8sFqxJZW6o81YUjOXRdUewsPB74iNDep6q/l/H+2D8iFoc8CD2Cd6JiEi0CFXjU1EMJy+ELGYyO0bhNBk8TNamAXcc4X7VJpCilq8iTPzHkfOEk20WW8vAv0y4hgDyDqkoVRjpfb10J4bg+eURPgPtkoYh4MrDawOq4D1ntCBl1c9/G2/A8Xp5ibdmN8buGcwwwPLd0TT5ZySzPFCdKC/59Qqnbrb/rIJbp1ov6aPv9ejq0KhO3vfZZouwG85tMIGBndINA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Whx/O0xhkmg1H8Ed4utNPDv2ldNCw/d3yyIzbHWPpYI=;
 b=Z71521IYanSlEdhPiMlEgZ1C7O/AXudjo0z5TWCeQpcb0o+S8JUae11se55haQ0RioPSI3UdhxvN94YACRo+5+ChFbrsARrB+MCkgU9xAQJaz9N30Qdz5K+8D1G2TDXFndnZ5RFzbQ36Wy72ydU6RTyDqrw/CkOtw7qN2gRJtdG/PbDby8KGPpm2v2A4EQc8mhsKe6X5NVGOPkjCAgWtx0C3HuPo7M40VAp3Wua4xO94JlX3+c+Lv6m8UnGUd+bIZqE4ct7xHgO6GtzZhpLs2dR9KKra3MKtudfdj2oyFJB314F21/9iv1EKsTw+FWD0BuLPXrBkRSevh9PSqN4Ucg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH7PR12MB6393.namprd12.prod.outlook.com (2603:10b6:510:1ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 03:53:58 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9115.018; Wed, 17 Sep 2025
 03:53:58 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Brahmajit Das <listout@listout.xyz>
Cc: thierry.reding@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 jonathanh@nvidia.com
Subject: Re: [PATCH] drm/tegra: hdmi: sor: Fix error: variable
 =?UTF-8?B?4oCYauKAmQ==?= set but not used
Date: Wed, 17 Sep 2025 12:53:55 +0900
Message-ID: <6392398.DvuYhMxLoT@senjougahara>
In-Reply-To: <20250901212020.3757519-1-listout@listout.xyz>
References: <20250901212020.3757519-1-listout@listout.xyz>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0086.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::12) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH7PR12MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f215c2-e206-4b29-4b38-08ddf59dd4b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkYvSVJLb21DNFJ2SEUyR00zdlM4MW52cUJBaElzV1BqWDBMR2hlN2ZRNTZl?=
 =?utf-8?B?MkNxSDErL1dHWVZXKzkzMGJmVmw5bjR6S0pQUUlvM3llUkcvc0RaWjRTTlVM?=
 =?utf-8?B?cjhTVEhYNDN1Sjl3VVB3N1FVL3hibTR0anRQcWlVOE92ek5iSHhndTB0QlMv?=
 =?utf-8?B?empsYVBaMC92K2cxNEV0YlQza1Fpa2oyYXpBZ0U3WGpqajBGVzlFajBVNmM1?=
 =?utf-8?B?djdNYS92bWlWSjZqbTRiblpSV2hFSU9taXcvRlN6alFHU0RWOGpiQ1VUN2hr?=
 =?utf-8?B?ZXEvUDFaTUo0RmZPcG9ibTVlRGlOZFRXVDFaR2Fkd1N4OVNFaHJWRFB1NXVQ?=
 =?utf-8?B?U0VIYTJuR0YrYTRpbW1RcnQxWG9TektIekUralZCdjVwVkdPWUlrNm5ZK0FV?=
 =?utf-8?B?cXNFeUI5VzEvRHo3OWpTVTNuNTl2UjJtNDlGNngvbU4wOGlpdHo0ckJMek5l?=
 =?utf-8?B?c05vOUVZVHRBbitVc3VreUVwWldCV2NHVEVkMlNpbXduTlREQjJ1c040cXpM?=
 =?utf-8?B?cEFJSy8xcThrSzdxMXRnK09COEx0eTNENlhidjdMM3ZaQnAzTnlTRXkxZjhY?=
 =?utf-8?B?V2hqOElkS0dVR25qaWxsSGdiaXQwRTZRdGVXcmt0WW9LVytJS1RLTW9HaTFZ?=
 =?utf-8?B?bDMwZlVFYUpnZWIrMXZjSUtYWWE4NGRSMzVjblgydG5LWm1oYVpScW9CSmMx?=
 =?utf-8?B?L1lIdmlaNEFYa1dSeUsxanNiVFRqNVdCeGtaU0RFOVJHcXNweU9ITFBCbDVN?=
 =?utf-8?B?Yjk3ZHU2ZVJFMkM4ZWYyWVN3bVA5TnFxYUhsRmRHUTFDaEo1d1pDNnJPS21o?=
 =?utf-8?B?QUF2NmtWYnVQWmVzUC9IYmdKSkxLamc4dHo2YVJoMHpHajE4RHJaZnl5VXQ3?=
 =?utf-8?B?STN5QVJQb0xQdjJHQVM1VDhvV2lJMFRnZGFXOHlTdjR1SytHY3I5UzJ0U1pS?=
 =?utf-8?B?ejQ5UWcrZ2ttRDcrMkJ6Z0s2dmhvTWRCVmpkQU5pVS8rR2VBZDQxZVhKaDdY?=
 =?utf-8?B?TktRcDU5WVdXQ1krRWtHY3ByRU1iUWNkTWJYUnZ5TE9vY29EN1lpd1UxY1BI?=
 =?utf-8?B?aCtzWi9jQ25VTEtxZXFocVpHR3pYUlV3NDZSYnhITWZKRklQeVI5R21VT0tV?=
 =?utf-8?B?TEIxOHhpK2JNN2hJWlA5SjBUS3ZpdWdQdHptZWw3RnVmSHBUZ3BoUkxYZ2xy?=
 =?utf-8?B?NWpaZzhybUJlQUhMcWhQVXNPdkdrd3J1SUVLakkvVG9kUzVUdnJ0VTQ0VXRS?=
 =?utf-8?B?MHE4WnZ6UTZNa2ZmV1JsWVBoRTBHMVBxTm1PcDdrZ3Vka2d3RHJPUncxNFVu?=
 =?utf-8?B?UStIVzB4SnRNanpldGl3YVhjaFgvOFJHQThET2ptZW9lN2MvYytqYUtuYy9E?=
 =?utf-8?B?b1ZkaFRTNDhjRDFaSXc4SHJacjV5STlFZGFTT0VoNzlsajViL3poK0J4dzFx?=
 =?utf-8?B?UUNqTU5VOEgxK0xMNlI1TjNxUFYrYlZ4ZEdXS3VpQkFsWFZYMFRqcWFkd21n?=
 =?utf-8?B?Skc1aldsZTcrNVNtVkNxQUZ4cHV3N0wrV3ZOYXEzQTRQbStCNVlOaDZ6cjRG?=
 =?utf-8?B?NVBNU0JnSmpnZ0xCQWNVSC96cXErM0szUVhGM0xycjEvMnRtYjJNcU9VTEVR?=
 =?utf-8?B?RXRIY3NoQU5LdHRkd0VZdnloQ3o1ak9jcXNCaWx6QkFOdzFCeHUrcUFaNUFM?=
 =?utf-8?B?Yjl3ZEVTVjNMZzRuTTZqMnBWVzlMeEVpM05sSEtJaUZWZlQrRHlzajZiVU1W?=
 =?utf-8?B?OUk0blByRS8xY2tyWUZKc2dWWVVpbkplZlU0SU9tUWJXWG1LVDUxVDhsdzgw?=
 =?utf-8?B?dE1sM0MvUjg3aGRiMEcwNHZ6TkYzUUZ3d2Fwd0svaDQ0NWJCR3NDbVdONGsz?=
 =?utf-8?B?QmJUQjdtcWR0cFBkQUFCZ3o5KytIeDBwMFNmSWJPeXFPd3RZRGw4a01zeEZr?=
 =?utf-8?Q?lKFOOEURKBo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVNVRHZNL0R0TWszSDhxQTNsVGRRaXUvWklXcFpUUGRoby9IVzN3Mjd2VStU?=
 =?utf-8?B?K3VDaFhvN3BOMEFjSGFPb2Q1bHk4T3RmaFlQQlc3WWV5cWhXZkpMUEhBYmFp?=
 =?utf-8?B?Vk9CaDUxZ2hEY2FpNUQvUFRCQXorVDVUUnV3NC9hVnVuVmJnanQxRGczZVVo?=
 =?utf-8?B?RFo0RU9CcXpybWpUdzBsMEtNbElOMDlLdXZ6TDFwdGtydTZicFhybnJhWm01?=
 =?utf-8?B?bE5HQXV6Nk5VT3RqdENhMnVSeVAyTG16SWVDUjZDU2MwUStGQ0VPbHpLNUp3?=
 =?utf-8?B?aW9YL2NjY1gvdkdteXRYZmRnN0pkdm9vZ0ZnRi9uSURGM0tMNjZRa2tjMFdI?=
 =?utf-8?B?ZjlTOE91cCtNT1ZPREh0VFJ5RmxJUFlNZzMvOHV5SEpXNjdPdHpQOXRrMDdH?=
 =?utf-8?B?ZGJBZmhqTXJmdzZyQTRTcTFJR0dLMk5jRXpVVDkvNmpEOEdmWmNiR1ZCQ0hE?=
 =?utf-8?B?ZkljTUwyUDZKNlo5S2lRanlhaEV2dUtCZTdGNlFyQ1U0b2w1eEFkYjBoQXN2?=
 =?utf-8?B?bjRJa25EOU16aFdCbkpRb282azZaZmJqN1BpOE9KNHgzYWRJZzFHTTFyM0Ji?=
 =?utf-8?B?TCtYb2xEMTIvMDJwdmJ1U0ZrQ2hvdjdlTEJjaVlmZ2hGbzdyMCszNitxQm50?=
 =?utf-8?B?aVNTcm5sRjFieXN5NDhSZ2VReFJ0WmZRRXByNkFPUjI5dHQrR01kcG5hbDZr?=
 =?utf-8?B?anF1OHRzanFxRG5jTXN1SnBJN2s0WU91bXpZaVJtVjhtWWttVkhCbEt0bzBj?=
 =?utf-8?B?THdUUlBkTzJ0Z3JhREFWQ25LeUx1K2dyMmxBTk9FYTF1QlozRzhSb1hxTnR3?=
 =?utf-8?B?WjV3a3V1aElvTkwxWXRmNGgxY016QzVlSVF0TkNDSjMvZUF3NmJRN3NKa1E3?=
 =?utf-8?B?ZFRmMWdWb3RSMkxWM2VXNjlSdUpFa3Z1aThUNDFpYXJGSkJzcWJPOTN1VHNW?=
 =?utf-8?B?MFhlVWVkeVRndnZxVFFXNTZkK2VJbU9XU2hWWjF3Vm1SQkhROG5XTkxsUW5x?=
 =?utf-8?B?dEpzSU5kWHY0ZE9JK2VzY0tueE9sZUp5M0xvcGNmVFVhNkxEQ01zZlVnOFlH?=
 =?utf-8?B?SmtjR0JEQi9XSEc4WGJFTFBYZXNuTEU5NUtYUWE0N1UwVStQc3JOd1hXUE93?=
 =?utf-8?B?MjlXbGRtQW1CSFdPS1MxWWRFK3FkVHZ4NXZNRVYvV2l2M3FhZzJLbVBPSlhy?=
 =?utf-8?B?NFRMUWlnTW50OVNZb2U5OVhFbnMvYWk0WmlHOGVIV3NQcGdJZWs4clVPZDZq?=
 =?utf-8?B?eklobHUzRDFlVlpzWlFWUFMySnJ5dFNseWpFMW9xdUNiYXJDbWNPaUY0M3VN?=
 =?utf-8?B?di9pcFNHaDBZZW5HdHJMdnVmUXRUZVozS08yT205cytWWnJHUWo1SmJ4RXA3?=
 =?utf-8?B?OUxUT25zUDlLYXMxMVBhczBubGJwV1c1SzNQVjA4bGZ0aGR4d1FrSm9vR2ps?=
 =?utf-8?B?QVJjY2l1eGkvMFNZYVA2OWJ6YjY5SFZVNmFRWjZtUW15emYrRStHKzZEODhw?=
 =?utf-8?B?cE41aVVySFMvZUdjRFo5R0lJQVY5RmNzTklVNmJqRHNwd1h1TnE0MkhwNTA1?=
 =?utf-8?B?ejFibG5nUWRRRFVFdTFCQk9sV1FQcDZqci9ZNXF3OCtXK3FSeE9Odi9vaTdK?=
 =?utf-8?B?NUJPcVNVVGllNHVuS0IyTjZrY09aQ1FDaVV0WHBGQkd1M1U0ZkdFMlBUNGVw?=
 =?utf-8?B?S3h6YzdDcU15b3lDNmJtbmpKS1BnUEhLRGxBcUdpMllVVEJwTmFLTU9kWGZC?=
 =?utf-8?B?V0tzTG0rcVlKTzJUZjNjTDMzOXJOb3h1eTUwOWk0SXo0WnFvaUtlYnh3Y1lH?=
 =?utf-8?B?b3FVejBWczlmd1NubVhRNGJtOE9QbmRwL2ovdU5sMGNVK0g1MklNUkdWenpM?=
 =?utf-8?B?RUhmQzNnZElMSzhsQXNwZSt1ZWEyRjcrTnlIamRWSktrdGV2NmFCcHBUTHht?=
 =?utf-8?B?ZXRaSDZtUzJJaURxWm11ZFBFM0pneWoxZHNPenpOUHc0SDVmelZ5ZkpBcW4r?=
 =?utf-8?B?a2ZrQUNSeHZzNGE4bC9SV2cwK1M5UEt5Z04xUnpVWlN4aWhCUy9meWh3bzQ3?=
 =?utf-8?B?SDk2QlpNeGRuTWJhWHY1aDh4TFdKaHZsSmN5Ti9mUlFBZ2dSdnoreXJvTnlw?=
 =?utf-8?B?ZktiZkRYQnhUVlZlVWllT212NFRiODJzcUN4ZEczM2trSndIeUU3ZUEwM3Fw?=
 =?utf-8?B?UG03VmlpUTdqMmdkbU1GemltUlNiUmlyNGM3NFgwaWNNU2UxRHVpYlljdDdR?=
 =?utf-8?B?OWFjeS9BSVZIOGNJNFkvRktzTVNBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f215c2-e206-4b29-4b38-08ddf59dd4b1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 03:53:58.5381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYuJKy9JxZ/Zyx4mBPsdNdT64uqH9OQ+dWcxPgL7q9DbkRsjAmpBRQRFlU9f711h+1BVv6xwlaPogExShv6bYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6393
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

On Tuesday, September 2, 2025 6:20=E2=80=AFAM Brahmajit Das wrote:
> The variable j is set, however never used in or outside the loop, thus
> resulting in dead code.
> Building with GCC 16 results in a build error due to
> -Werror=3Dunused-but-set-variable=3D enabled by default.
> This patch clean up the dead code and fixes the build error.
>=20
> Example build log:
> drivers/gpu/drm/tegra/sor.c:1867:19: error: variable =E2=80=98j=E2=80=99 =
set but not used [-Werror=3Dunused-but-set-variable=3D]
>  1867 |         size_t i, j;
>       |                   ^
>=20
> Signed-off-by: Brahmajit Das <listout@listout.xyz>
> ---
>  drivers/gpu/drm/tegra/hdmi.c | 4 ++--
>  drivers/gpu/drm/tegra/sor.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 8cd2969e7d4b..c4820f5e7658 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -658,7 +658,7 @@ static void tegra_hdmi_write_infopack(struct tegra_hd=
mi *hdmi, const void *data,
>  {
>  	const u8 *ptr =3D data;
>  	unsigned long offset;
> -	size_t i, j;
> +	size_t i;
>  	u32 value;
> =20
>  	switch (ptr[0]) {
> @@ -691,7 +691,7 @@ static void tegra_hdmi_write_infopack(struct tegra_hd=
mi *hdmi, const void *data,
>  	 * - subpack_low: bytes 0 - 3
>  	 * - subpack_high: bytes 4 - 6 (with byte 7 padded to 0x00)
>  	 */
> -	for (i =3D 3, j =3D 0; i < size; i +=3D 7, j +=3D 8) {
> +	for (i =3D 3; i < size; i +=3D 7) {
>  		size_t rem =3D size - i, num =3D min_t(size_t, rem, 4);
> =20
>  		value =3D tegra_hdmi_subpack(&ptr[i], num);
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 21f3dfdcc5c9..bc7dd562cf6b 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -1864,7 +1864,7 @@ static void tegra_sor_hdmi_write_infopack(struct te=
gra_sor *sor,
>  {
>  	const u8 *ptr =3D data;
>  	unsigned long offset;
> -	size_t i, j;
> +	size_t i;
>  	u32 value;
> =20
>  	switch (ptr[0]) {
> @@ -1897,7 +1897,7 @@ static void tegra_sor_hdmi_write_infopack(struct te=
gra_sor *sor,
>  	 * - subpack_low: bytes 0 - 3
>  	 * - subpack_high: bytes 4 - 6 (with byte 7 padded to 0x00)
>  	 */
> -	for (i =3D 3, j =3D 0; i < size; i +=3D 7, j +=3D 8) {
> +	for (i =3D 3; i < size; i +=3D 7) {
>  		size_t rem =3D size - i, num =3D min_t(size_t, rem, 4);
> =20
>  		value =3D tegra_sor_hdmi_subpack(&ptr[i], num);
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



