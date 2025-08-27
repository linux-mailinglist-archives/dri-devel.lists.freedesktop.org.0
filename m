Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A187B378F5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 06:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7837F10E1A3;
	Wed, 27 Aug 2025 04:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rkQsHFQh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141A910E1A3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:09:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omvyba/eJSpN6dWDRGQjuXVA9rHVOjk5akGiyG1k8QIgriUoLAZJ8sZ7aylk82/n8Bd/ehN01K+Ruhu37Q76fEGd2MZmwLTEM5Fkp2NXPodM4+GEngDHwpWbdbzsFYfpJ3BzBPLov+z4PCQqrtL+ewB4igLvPBjtYr7LCsOFqZkF/a7qAvlay2nj4tBc6aA8qE5y4PBjHBZ0edTXga6xvpqiTHP7x93KwClwhNCfLwrgBATyXWzFYARC17onfKWjExyJu+2UJHzGs96lo/9+sBSivr4nozmNOZtq1NM0XQrMPO2sExx/lEx9qZZfXR2ZXB+E7jpUvSgRVmAjsH++aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Dr9z8wQRsdtQQ02Syv+PfvDegPH7WSwtF9XDzGDbvI=;
 b=vwQ6b+MuMywtRbSOwLAkdKbQbLmhbtgCdZBYjg71u+nuoMMB06drULSpyVZkVdtjCa6R5NMZ0qFqJhTlvDvQgLsUMGQ+yqdCAwqw8SLMBrBXLrhbRRnoV4jj74RZpu7NSPY6E0argqZyGZemDPKWOiE+AxyBtlhwvVUYiSsiel8a+SHco0LO0XJwPpJJZL/kWb8ic6bhsNoIxah5HEhpTaZ7xizEKfDmqyoduaqoTisEkSxlMKa+FjQyzW9Yi1u+aHe3MtxOOf7FbcfyOc4ks8rymtsLitbDUD1waHFgv4naOFAz54C6BM96yuj34rqSAfRD6P1O2swiwA+n8fHF8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Dr9z8wQRsdtQQ02Syv+PfvDegPH7WSwtF9XDzGDbvI=;
 b=rkQsHFQhJSZ1PVyh70DWo9kML6rNDwjp2vxkSyNg61Mw9OoY5wigT/LSzvtEw35H9q4cAPJgCDtALNcjnog38cIHDwJbp1iyYoQev+IVtImCRJ586nTEbHdY0+J9P76GnF4L+qrJwgXCANJFEdvijIKrntU1XzEiZ185o8R3iCCI8+WkKxDg44TtntMJXMto/05LsggbkzJL/mpU8Olrn4jurorllTh4/hBQd6D7b0i+NGYe1bmDSyWHY9jdShVTUEKuitu4drD2FI44FLxDWMA+y2kHd38Bzf0QJ01+o+7FaVpJkVK9Eom0MOLLwKYH7/T7sys+45ziB/a4x07Kcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH7PR12MB6635.namprd12.prod.outlook.com (2603:10b6:510:210::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 04:09:49 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 04:09:49 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 01/19] clk: tegra: init CSUS clock for Tegra20 and
 Tegra30
Date: Wed, 27 Aug 2025 13:09:45 +0900
Message-ID: <1909286.atdPhlSkOF@senjougahara>
In-Reply-To: <20250819121631.84280-2-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-2-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0234.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::6) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH7PR12MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f49e49e-d85c-4a60-d624-08dde51f90a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXpFa1BVVkhRcGRCRTQ5amlaTlFORFRhM3MxNUp6SHRMYUxzdU5mYVkybS81?=
 =?utf-8?B?NDJMdGZIUFkyNGR3KzdrR01iKzllTHdrR0NDQXp3dUxLS0RQNGt0a3k1R1du?=
 =?utf-8?B?V0hueUMxVHh4bXdYa2dDSDRlWWVvQjJMM3JNc3hqY2QrSzVPTXFIeUg0cUsz?=
 =?utf-8?B?bTAyUk05UTAwVWlFRFg3dGxKVC9yQXlXQTlQZDRyckI2L3I5cU54bHFGM3lV?=
 =?utf-8?B?R0VPdkxVd0dSMlZtcmxkOThYdC81VTNPQWkwYlpDcXk3bHloQTlJMm9JVlhh?=
 =?utf-8?B?T3RBY0pNSkNYbStrcnpqaUVMMXJKYU5Bc3BsMHNYU0xRSjkzSVJtam53T1M4?=
 =?utf-8?B?VHByM2FJYVdKYUFBcG50dkN4K0I2YWRpYzBVUGlPQkU3ZWhIenNrS3Zpdlc5?=
 =?utf-8?B?Rmw1SW91d29DUUo2dWlBc3p4T2xRN1A5cS8xWHczVmd5VHp1d1l3eENhOFRp?=
 =?utf-8?B?dEphRmpFS2dMRTFnaVljSHdPd3lwY1puaXd5Mi81cmtXeUFDbDlKT1pVODls?=
 =?utf-8?B?MXVSSzR1UlR4K00wYjFjYTlMaXRKVGRhQzY5YytsNDhSM21XYUFsTm1IMVZY?=
 =?utf-8?B?SU14ZURLNGNsZ3NWTHV6RkljWCtPVkFFK0NHcVBBenU5Zlp4LytsQXU2TWtQ?=
 =?utf-8?B?MnhsUjEveXBSaWs2aTgyRzB4V0RiQ0pNVEtZL1NDbmdZd0pJQ3ZMSERvajBD?=
 =?utf-8?B?QTJMQk5EOWhzMFdYTnlPMVcwdW54MGJ2UWZ3OGJEUVRaRHJ5UFpYaUJGNlM3?=
 =?utf-8?B?Szd2ZEdTUzdXaHZlN1cvbkJYS3JodnhSQnZyZ1BYT1NVUGlzT2lMQUJDK0xE?=
 =?utf-8?B?UUp4M0dyU2pCREM3OGZNeVU1ajFGNXpWVEFRRFdjSlJwMHFkQlNMekhobXY4?=
 =?utf-8?B?S0xmdXdZei9yTFJKSDdYN3g1VVlNa3JPdGNBeStPTFQ0Y0Z1T01CbGRNbGxx?=
 =?utf-8?B?R3FTTkc1dnBUQTlvdHZnQkpUTjhXWUlYaDVWRHJ4OXh2bXNnU29KQkJoeUNW?=
 =?utf-8?B?U25wUkdnd1h3K21OMGJ1WVFxRElZM0dudWtheGRMaUFWcTI3anpQR01URUU5?=
 =?utf-8?B?TFg0Y08zelJodGhFSnh3SlZ2ZE4xdmZWWHhremx4Q0krZStva3hJQllGQURR?=
 =?utf-8?B?S2N2N2lBOE9RdmQ4NUNwWlJKWHpKelpjcm9pOFhEYThZSXNZNGV1bCtpUk5v?=
 =?utf-8?B?dDdMY2RnNnhLb3IwTkJCbkVxclluYTdQTzdQQytDM2VUVnJzSnkvNkZBczNC?=
 =?utf-8?B?NG9vM1Zwcmg3Q1pTenpDc1UrTHNhZE5JUGIvWG00SG1YUUNWQTFCUTUwd2hz?=
 =?utf-8?B?MklIN3ZsQ2d4U0pRa1M4UmM5NDkvMEpXWFlINmdRL3JGVVNRcFhHR1dsRXZx?=
 =?utf-8?B?dmc0aVhsSFd1Q29md3JLN3VTbEh0OEhYZFEwcnpsNXRYMFY2NlQ3Q1ltQVh4?=
 =?utf-8?B?Qk9aTzA3WWxocVJNRDYwMmpTTGlhckFmSDNiUThDa3pWblNEdkZlMDNBeFB5?=
 =?utf-8?B?d0tEeWNvVXNCajU4aGtnVGZaczhab2ZzNlJUU01mVTlGcTBKc25MVlVpV0hs?=
 =?utf-8?B?enpqYndvZHQ3bzdaM0lsd1RhUDIrMEpSWHFXMXUySG5paGszaEFrUEd3YXF2?=
 =?utf-8?B?S3NKeG81SVlXbWgxMjFMZjVBa005dFo0d3R2MXBqQi9xTVVJYXZ0TTV3T1E2?=
 =?utf-8?B?blBsWEYyMW9EWXBkN0RFb1czdjdhSW9UVS82Z2dQT1FRVXZ0S1lrclpSTVJD?=
 =?utf-8?B?eFVjbkxPMHgyV3ptZC82ZkJwbHcyVGNYVlFTYmJYVmtVRERwMmczNEF3Wmph?=
 =?utf-8?B?NEdtT0NJMUI0YUczTHJ6QmpTTlE4ekY5NExvaDJRZzRIS25oKzhlRS93anJN?=
 =?utf-8?B?ZzRQL1puY1BVQm9GTUd0RFlFMzN6VzVPOFdzT0hlWE1nWlc5UGxhYTJWNXor?=
 =?utf-8?B?cEEvM1kxOEpEcGgydzFmcmhxVjBxV3AvWnZnbWZsY01ER1N2aVdxcjg1dlQ3?=
 =?utf-8?B?VzJGNnJRMmpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(366016)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTlKM2JaRkJsbnhmZVlSR2t0Nm8zMUNGc0p2NEVla1NwRnUwRjY1cW55Wm5F?=
 =?utf-8?B?azFqZ3J5ZVo0cVYzYWh0bmhWVWoxeStZTXBuQ25DNXlNaXIvMGtFa2hRK2pq?=
 =?utf-8?B?enN0K1V1WDhxZG9HWE4zYXZSbDV6RllLUDZaN1FqZi9QckdzaW54VHhsbWsr?=
 =?utf-8?B?bnc1NytVcERsQXY1RDFOaFFHZDRkOEtWUTFsK2VvTEh1VHlKUlVTdE5IUWF3?=
 =?utf-8?B?b0J5M205MTFtSitJNFZ5YlJIMFJ0V0ZrcUlpckYzYThnTWVVcTZXaXFjWGdE?=
 =?utf-8?B?Z0huK1J6RmdHY1FHWWJURXh4NlZLb1VwTFVSdmc1MXVVSHdCRzd2TXNmZThY?=
 =?utf-8?B?R2daWjVSV2RPc0k1REF1VDdLU1Mzc2grenZ3T2dkbUl3VFBNdSt3Q0RjQ2g0?=
 =?utf-8?B?M2RZc1Zib0pTVTlJblYrZysrcU83ZUtZUEY5dnlPYis5S3FPSkQxZEJFSlNn?=
 =?utf-8?B?WFBWdU5vbXZTQTBEc2ZRMElQTHJjMUJqSG1mSVZPTFdLZ3ZEQVpNOVJjSEJz?=
 =?utf-8?B?VTR4eTNsMUttdXZCQVdMUWV6cHhjQjE4RU1lRC9EdHE0WFJ4QnQ2STRGTVhm?=
 =?utf-8?B?cEZRWEdUWXVheW5OT2NzNjEvaHljZFRCVlY1ZGEwOWdFY2NTd1VGYnlENUth?=
 =?utf-8?B?alNyczc3U3RHQ3Jyc25CNlAxN2xRa1lWaDMydlBZMEVDTzFCaElUdkVoRlF5?=
 =?utf-8?B?cVplUmNHc2JzeVJtYjdscHFJR0pZK1pxN05JUGxDZm5xU043SGdYaEE5ek5P?=
 =?utf-8?B?eS90STErWkJyM01uMFhvcjNqU3Rod2NPSHJ5dGhMbmlKNmZ2ZHduTEFiUUJO?=
 =?utf-8?B?dVJXSlM2ci9UdTM4aktvbXdURnhKYlpOc2FEejNXMm9wOHhDVWd5b1g2Q2hz?=
 =?utf-8?B?WXF1ZXUyeHNXRGhXRjZROXd0U2xPQTdLNWV4NVdtUnlBeHdaY01BTDhpemw2?=
 =?utf-8?B?VHpjSytBeGc1SDBEQ2tqTmZ1RG5zc2VnSm4zUlNHZzlzNE9NZ3pZeEJnVGZv?=
 =?utf-8?B?Z0lVeWdOeGFYclA2eXBkbnpDSTdoaTRsdjVwc0NaaXV6dzNLcVc0dzZ5SFh0?=
 =?utf-8?B?TXMwZS93bEdpb1NFbzlTUmtoL2tnNkhKTDRtQ3I4c25ETU9mSTJGYXl3d3Y4?=
 =?utf-8?B?VGNpNzRhcnRKODlOUVZ3c3Z5UHFvQjRYMmZxdUpRUENwUnNTZDZXRE54bVhP?=
 =?utf-8?B?OXgvRFZVMXdRMUxqS3A0VVEvSWVBUXo1dlJzYXRJOFJGdSs2RHJrYURSN1dH?=
 =?utf-8?B?SDl1NVhDMVVxU2xhbitIUTlNSTNOYkRFdkd6YUJ3TDZqY2NUcFRVNCtkZyt0?=
 =?utf-8?B?ZHovU2E4TzJXUThCczA4RVcyMUtsd1dxeklENFpVNlBoME04Z0U4dVB1SUxH?=
 =?utf-8?B?bTBYY1pLL0pwcnoxNXpFUDZTMGZ4RmZhUGNKODVTMU8xMnJhMklkNXF4RVpO?=
 =?utf-8?B?WDBJaDU4WkZGQmxnNmM4RTV6c0hNb0kydWp4REg3QkJoUmMyaFV6U1ZIRS9h?=
 =?utf-8?B?RHVvN01MSzQ1WWhud0haMFhhWWJjZGY1anpvOUpHVGs3bmkyVWdRL2J5amxz?=
 =?utf-8?B?VGZkWFFoTjl6UWJlQmlLSFk5cldUQjRmelhrdVRZMnpPTjV1UnNiWDVDK0xS?=
 =?utf-8?B?UVg3RUZSNTgxNWM0WDZ2ZUpGVVRsZ0lOTm5XUDlKamtRZVB3VGhUeGFYTEI3?=
 =?utf-8?B?OG9LaG5FWVVvN21sRlFhMWxQOVZrZTZ6MWt4TGtZTUZCbzhxNmRiRGt2VE1M?=
 =?utf-8?B?aENPUTFIVzVlVVlBWHJHb0ZtNFVhZU9mUWRJRTNWUXFteHhiOXVuMkxLOFpn?=
 =?utf-8?B?aWlFa2J1ZHNmSHY5dWtJVDQ4Zi95MGovdGNjSXk3MEhsT1VHYmZtemg4ZHVh?=
 =?utf-8?B?OVZvUFBBbDMrSU94MGpvT3F6SW9tVUIxT25XY2l1NjFob3Y1U0RmdkdqaW9Q?=
 =?utf-8?B?OWNzb3J0cGFCRUtBL1lNWjAraGN2OXhVRnBtY3BVT2E0dHN6bXZQZ09NdUZM?=
 =?utf-8?B?eGRwYWpuQ05wd0M0Mk5FQWorZjg2SnJQSWVPUDVyU3FsdEk5R0FQNnNKNTNx?=
 =?utf-8?B?SUl5bVhnQnQ5ZDlFNCtaMWVCLy80c216d1RJekUzOW8xVzJVR3gxdW5VbHgv?=
 =?utf-8?B?OUpJUGpBclY0TWloNUI1bGdqZ1h4aTltaVZNaW1HVjBGR0pSam03eXNqS09p?=
 =?utf-8?B?aEdsTGdRWXltTTA2blZFUGczSzFOMWVnWnhhMlI5Sll1cFppeE5VSjlaTnpk?=
 =?utf-8?B?cndIaFNwajJ0cEJ6d1hlNmxiYVhRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f49e49e-d85c-4a60-d624-08dde51f90a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 04:09:49.3448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWzKrFtu/QMDg5KkijNWBIb1/yqden9T9jZpySBJrAK4BFgJikhw6YpRR0IKq1Q2BAucw3IG7Os+9eu5kNUpew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6635
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

On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> CSUS clock is required to be enabled on camera device configuration or
> else camera module refuses to initiate properly.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 1 +
>  drivers/clk/tegra/clk-tegra30.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra20.c
> b/drivers/clk/tegra/clk-tegra20.c index 551ef0cf0c9a..42f8150c6110 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table init_table[] =3D=
 {
>  	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
>  	{ TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
>  	{ TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
> +	{ TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
>  	/* must be the last entry */
>  	{ TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
>  };
> diff --git a/drivers/clk/tegra/clk-tegra30.c
> b/drivers/clk/tegra/clk-tegra30.c index 82a8cb9545eb..70e85e2949e0 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_table[] =3D=
 {
>  	{ TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
>  	{ TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
>  	{ TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
> +	{ TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
>  	/* must be the last entry */
>  	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
>  };

I looked into what this clock does and it seems to be a gate for the CSUS p=
in,=20
which provides an output clock for camera sensors (VI MCLK). Default source=
=20
seems to be PLLC_OUT1. It would be good to note that on the commit message,=
 as=20
I can't find any documentation about the CSUS clock elsewhere.

What is the 6MHz rate based on?

Since this seems to be a clock consumed by the sensor, it seems to me that=
=20
rather than making it always on, we could point to it in the sensor's devic=
e=20
tree entry.

Cheers,
Mikko



