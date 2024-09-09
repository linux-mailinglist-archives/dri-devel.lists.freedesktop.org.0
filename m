Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99049972202
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 20:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9343B10E631;
	Mon,  9 Sep 2024 18:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0fIvxE+W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2056.outbound.protection.outlook.com [40.107.101.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC5210E5B0;
 Mon,  9 Sep 2024 18:40:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MazTAM8kIs9zjZ5S5gdrLsxUtb+AUcrLtPGFdwq5xgGVfbrEdnQa6nd9fxBBIz/UbugBtqUV5sKMOhLnx472EL4J7WsZ/XQKI2xjzDduvEvMIzpjFDf6H3SMgMJwF1TXURbtvH3lGPssXFMu7SweqH7asmF16ZvI+PyFiBca1XZx2HTqKEABI1XLjhHrb45xS4AuCRejQfMm67EG7o0EK0SwF7I+qPvpIz8oZv1US3nW0UZ6OjIRPzmaZ8I0E1Jdyg+g2vWW7WAVGebwdqz4JwIlGExllb2XuKa1BbNP8qQpIw4geTCJJpbsjrqr+nWSCd/SmQ1TUvAcAa12WBE9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JDIkVIwLHVhsTd2xPSlpGRJwhLmNV3iBwaD/hDUqNA=;
 b=m1kLkMqr/57K35sbJYObRfpt9EJBGCufpJ99wD1BPTYRTrPFGANqMf52A4Gtjff5WtC9JKSvHDr7HRAsnXpeQoEe5itecFdqkN83ty+Hzuhbht0r7YAO2qmsUk1fXkns0k0ew71m8A+JiXV1DMc49CPTczp8xrv0YrmEPff00OGfQ8owvXfNXu6GB3lN7LCSUPffGDQihPy8kfO9QseHANnjk5KDsXDHOLOttPoHZOAvfviF4tVS0mWtH6Wl2N6KJxWR0dwebxy/IVgPZv1vK/3kHEoKAD7vY6C3spSACoooMjDB2nLTmoq8zMm87BOVWri6TO32TZVvHWBGFgTlGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JDIkVIwLHVhsTd2xPSlpGRJwhLmNV3iBwaD/hDUqNA=;
 b=0fIvxE+WYy3JI0Xq3b56b6LMe+f23IjRUiiRA0F+CwVLtahEjS4eM8TNy7hfPflZkZSZrt76sBvL7fliysagU0jljUWSq7jMB7tduS4AHOU2xDwLtCYvc88IcFw8ybGHp3qwYN1bXm+U8Ao9yoKKT5L2Imspj2VWM6oG5y91oz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by MW4PR12MB8611.namprd12.prod.outlook.com (2603:10b6:303:1ed::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Mon, 9 Sep
 2024 18:40:08 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44%7]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 18:40:07 +0000
Message-ID: <07cfa0ee-9160-4a99-82dd-0a0b11af243f@amd.com>
Date: Mon, 9 Sep 2024 14:40:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/44] Color Pipeline API w/ VKMS
To: Xaver Hugl <xaver.hugl@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Alexander Goins <agoins@nvidia.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Victoria Brekenfeld <victoria@system76.com>,
 Sima <daniel@ffwll.ch>, Uma Shankar <uma.shankar@intel.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Hector Martin <marcan@marcan.st>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sasha McIntosh
 <sashamcintosh@google.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <CAFZQkGzLjCOSPvk0kYYXyJm8E6Szdw9PJUcUQzew-EBfQjzz_g@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAFZQkGzLjCOSPvk0kYYXyJm8E6Szdw9PJUcUQzew-EBfQjzz_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0123.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::26) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:EE_|MW4PR12MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ddd08d-690a-48de-8b83-08dcd0fed3d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clVRVzF3Z2hkekxEUXE3blE1a05BVWJzNDFwQjQ1YUs4eTF3YTN6bVY0c0hU?=
 =?utf-8?B?YzFPS3Z1MVVjekxoRnlMTVZLUlJUcmNIQUh0UnpBSWpjRnFBYnE1NWNpT0xp?=
 =?utf-8?B?cWFUejVOck41S3R2ZFY3N1JRM3VMRkFMWFFtdU82UzNxdGxKUW5YdXdNY2dm?=
 =?utf-8?B?TTAzSWppU2ZoNFF4K0hWSHdmU0VmT0RuRTdVc29oZHpuSEFucHdJSGMwMjFp?=
 =?utf-8?B?V2R5SVJLOVFneWpyS1F5U2xUQ0p1WUxJdms2eEtNTll5ZE1YdHRuWnlWTjAy?=
 =?utf-8?B?R2djeXZ2MklGZ3Qrd0dwdFhRQ0x3UTdDdHQvN1RQcWFVOHZ6ZE1LY0wzMWpw?=
 =?utf-8?B?MlpNMm9kNlRVVzdOTVJEVVhQT01DMlBUTWg5KzFZWGVXNWI1OFFieW9kR0hm?=
 =?utf-8?B?ampGZ2pMcDB6akFFSDhxdHRsRmlPS0hKaDZrMHdyd0VVam1INmkzeDYzeFNt?=
 =?utf-8?B?Q2w5WERQZnFHMVlvK3M3ZHZoSGVGU09OUXpNdzhFSUlSRmEzY0pId0Q0MC9J?=
 =?utf-8?B?c3h2dzJkTGtRY2ZWQnRZbExhei9ZMmlWa2ErUm0wK1NaMGRmaFVUTUx3ZjRw?=
 =?utf-8?B?eUNVL1JpRENKTFl4VnBoekhRQW9EcHkzOERFcUpIdnl6dW9FdGhWaG9oUm9h?=
 =?utf-8?B?M2VnaS92YW5NenZkYm5PdlozdlN5K011ZWlZRkNqRkE4OVdlSHJjOUpia2JC?=
 =?utf-8?B?OVdHdWNHalFoRVY1UUdkYmxQT20vSnRnWUdMa2dlSUNJT1o0TkE3dlpDNGNM?=
 =?utf-8?B?c1ZuakFoUTFKVkxhWERlYWgwM25hbjBFKzEwczhqNzBXMXJ5d1RhTy82ZU43?=
 =?utf-8?B?TTZLVFRrbXlYZlpqbjhuYkdqVi9GYWoxclpwa0VkZjhsa3pPTmV2aDVYQVlG?=
 =?utf-8?B?bHlvRFgydGRoU0puSFJVR1lnNkx2N2gzZ1hMdC9VZ3VYU25GNkFPdkhmaDNv?=
 =?utf-8?B?VHpHTGZQYXVOWUZNRS9KVStIUzc5RVpWV0g2NHFvRUhZeEpVSHMyekxnelBH?=
 =?utf-8?B?MHZTT01KZlRQOVFTMzhvT1dzSVdGRDI2K2RWQ1VOMFRtLzVKSXZUay9KMU5J?=
 =?utf-8?B?OFpjSDB0RStYMWJRL0tJRDFjNWU5UE9sdGJYL1RuVUN1WTA4MnovcnZmWTl1?=
 =?utf-8?B?UVM2RlpBRytZTVVaYVMyQzdEU0J5dFJ5Q0FZcytoditWM3g3L2lxdE5JZEE0?=
 =?utf-8?B?OU8rU281cmJYaXNlcGxDY0g1cTJiNkFvUFpSTld2T0dSN1NLcWV0RUF5cmFI?=
 =?utf-8?B?aHkwZGV5WVBHbE9QeW5LT0k4M0lrUFA5TTdTNkg4Z0huL203eDJSRHdCN2xx?=
 =?utf-8?B?Ly9qbzNhTzhHTTg3ck5WRVpNdlFuNHRBWS9TS2J5SVN1U1loelF1V25NWmdv?=
 =?utf-8?B?d2wxN1NacjIrQi9DK3prektsd1Y0WFJYM0J6bmx0Rkp5M1grazgvRjVXbkh4?=
 =?utf-8?B?eUtNQnR4MHRrUFEyd0pOd2hkQnBFVFVyeXNrSkN0eGwwYS8xbHdkaDVncW03?=
 =?utf-8?B?L1ZTVWpGRCt6dloydlk1R01rTElkZ1djWlBWNW83ODJQWmkvRzR2Sm0wbjFv?=
 =?utf-8?B?dTQ3NlpYaG80dnNHbk1oKy9Nd09VYUJyK1RXWU44RGpRWGtpcFBSL0RFVG44?=
 =?utf-8?B?VUNmWGYycmh0cExaRVhIcU9aTzJ2QS9iYnZEWWZOaFlhSmFnVlNhM0ZaNDdw?=
 =?utf-8?B?Y0xSRmNkeSszbzNFY3RGSnd0Yk9EY1N6NlpMd0VlMzM3SktlazdZcEdpZG5j?=
 =?utf-8?Q?Rua/0n3flscDgXa63Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGxnTEhMZU1HNnhJWkd4ZUhFcU51YnRzWTYxYklybDBvYUpBS0xTYndLejZE?=
 =?utf-8?B?YnJqRmlUQ0lISVVHRWJKMFNRMzNOcVZ5aTMzTDY2dHZvQ08xS3FQM00rekdB?=
 =?utf-8?B?Z0k1RjhJOElkOXZ4QmNPRk9JS3FBNGpzVFpEV2tnNm42eVZoOXdWYXFMVGxC?=
 =?utf-8?B?SkNOZHF1MmJjcTZCYnlpNnVxaEhyLysxUnhWMksrQ242bkJIUVgrZXpOK0xV?=
 =?utf-8?B?aWdhb3pEUURLMHAxaGlKTGFHdlRvOWx6b21iNVA5NmhpZVZMbVZIdW9ZQzhw?=
 =?utf-8?B?QXZ6Z25vb2tYUUxsNWZkU0diVmp6RU9DK28rSzVNckFROEoxb3ZkTi9oeTdF?=
 =?utf-8?B?ZFVveFIrUnhnOWxlZmcxNUFlSFFLZk9jSnc4NmZDcFVYWldDZDFFVjdGWlZx?=
 =?utf-8?B?c3NHRXJyTmhYOGdTNEhUSDh3eVAvUTlwYVlYVlA0NVRDWUFTL1pKSXd5SjB5?=
 =?utf-8?B?YjE0aWlmT2w2WWcvSWM5NmV0RjFGajhZZEpyVzI0V1ZkRnhFQzB5c2NGTitz?=
 =?utf-8?B?U2pzZXo3bEk5MGl1cURVYU56NmlKOWIwN0d2Y2l2OUhERTdKYWVnMUhZT3NM?=
 =?utf-8?B?MDNjcFRpQjFBOU0xSkRsVnBnWDZQc01JN0s2UDZlaThHWFZ1c3FveTRKdnda?=
 =?utf-8?B?bzQ2akgvcnJGb25odStTMFZCTmJjamFPNFFnekZhUExYa3Q0Wlg4WDJidXR2?=
 =?utf-8?B?eVp1UTZ0OU9uT3dXSnV3czNlZzZzYkZzV2xWakllejQ5MW80WEx3dUVZZ3h0?=
 =?utf-8?B?UUFJckFBM0lQa2FxUG51TmVsanp6eElFZVNha1g2SkhGWmJVOHNyTWh2cE8x?=
 =?utf-8?B?ZGs3cGUvYlR1bnB4NmE2YTlZcStXTUh6VW10VzdHdGlJQmRsZ09Qd0xBcHl4?=
 =?utf-8?B?VHJHb2xRU3RON0lIcGFENFdza2hINERVRmNKNW5BNGJLbHRhWUV1d1BvU3hl?=
 =?utf-8?B?Z20vUFo5aG1DV2dzMlV3dkdPVUJndS9neDNGeml6cE90TnNWMUdzR1ptUVly?=
 =?utf-8?B?UjB2cjZDZGgzbVRvZlFhZXZLdTJON3VKZW9Gam5zUGp1ZWtNRmdyUmZiQWpV?=
 =?utf-8?B?MlJjbHdiY1BtMk1zUkd5U1I4WlJkMWdzMHFuVHFaR3YyQWJweDhwV1p2WjJP?=
 =?utf-8?B?aDM1enlTWE81cmdwRWZ5OU53dmtPbDFCcWswMERrTXpGc0dmSHB4elhWUzM5?=
 =?utf-8?B?eUlmemhhVXV1Ly9MK3BIZDJ3MG9TYTliRCtVZk1BK0E5VXpLcnhBWTE5NE1v?=
 =?utf-8?B?aE9yejc4NFlNNXg0djVkZkpTcC9Bek5EaUVpRWZJQnlqUTdxWUlFRXQ4a2pM?=
 =?utf-8?B?SEJVaUY3dmZPMVdUZDFKd0ltckovblU0L3BWRndDK1ZHMXFVTzRSbWhXRE04?=
 =?utf-8?B?N0hXSzRMUHdkNWpZVWpGNDZPVTdMNnpZVXQzaTBBNHN2YkpEZCtVM0xINFlV?=
 =?utf-8?B?QVU5UHRCWFJyY0R2RE9ZMW5OalNLV3dCS2FUamEwUWU2TzdYa3FwU3BkMEx6?=
 =?utf-8?B?NFdSaGdvQXRVZ1ZrKy93RVVONXRlcFoxeDE4Rmw4MWc3NDRuMU9WLzhhRFVW?=
 =?utf-8?B?VU9QY005b3F1VVZRRkcwVGxZa0RpY2VvWWFCaFMvMWt1d0ZsR2R0UmNhNEdR?=
 =?utf-8?B?MGVOdGVkMWM1OTJZUExxNUpLSk1oWTJIUEVLWTN5Tm04Y3JvanFJV1N3N0Zk?=
 =?utf-8?B?aHp2bWVXeVlmcWxXK0hBV3V4NjBoL3pjdmNVa1VEQzlTc2pIWG9lMkQvcXg3?=
 =?utf-8?B?M05FZWtnbUx4dDVRZTVYSHhITGZJN2Zwai9Ia2l1YVU5SXR3SnlyZGovdmMr?=
 =?utf-8?B?VERiTG1SM2h0TG12MnpGYkpDUzdnTVlrNHNxQktYM3lTVi8vSXBsdVg3NXg1?=
 =?utf-8?B?ZEpZMEp4bzRuZGMwYmRyakxYNFR3VUNsMS9UYXNiU0RoZHFRdjhHV2ZDTVkx?=
 =?utf-8?B?N0wvQ0VIcWtoT1NtTmtFRmI1cFNaZzF4Ri9VZU8wdFd6amZLUjlCOVVHeHdh?=
 =?utf-8?B?aGxMZDM1MWpTTlVuMGVibGNWUmFrcFZJKzljNmIvVERvVG5tVnp4d3lqZklz?=
 =?utf-8?B?dU1BY2NPMmFuaUh4YVdFekUwZVpsc09sN09qOEhRdDVmYmNOQ3paRmZCYkpk?=
 =?utf-8?Q?WFPPv5fLV/RVJceSQX9XAZ+6g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ddd08d-690a-48de-8b83-08dcd0fed3d0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 18:40:07.7315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvINFZp/bbP6zpNXQkOxraQPKNKcIwzb9pGIg3Sy2PuuRoa1TPnx0i2I8coOhH0qD5pypZyJANC4gc8+Ds6nYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8611
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



On 2024-08-29 10:55, Xaver Hugl wrote:
> Hi,
> 
> I have a WIP implementation of this for KWin at
> https://invent.kde.org/plasma/kwin/-/commits/work/zamundaaa/drm-colorop.
> It maps KWin's color pipeline to the drm one to get (primary plane
> only, for now) direct scanout of HDR content on SDR displays while
> doing tone mapping (or SDR on HDR, but that's been possible before).
> It currently uses the two 1D custom luts and the 3D lut for this; once
> I add support for named 1D curves, it should also make use of that and
> the matrix. I haven't tested the Intel version yet, but if it can
> match the pipeline, it should work the same there.
> 
> In testing your amd-color-pipeline-v5 branch I get two crashes in the
> kernel though: https://invent.kde.org/-/snippets/3217
> The null pointer dereference only happens sometimes, seemingly
> randomly, but if I make KWin generate new blobs each frame, I can 100%
> reliably reproduce the list_add corruption problem by just opening
> glxgears in fullscreen while the color profile of the display is set
> to "built in" (which makes it use the 3D LUT for gamut mapping).
> Here's a branch that generates the color pipeline each frame and
> triggers this: https://invent.kde.org/plasma/kwin/-/commits/work/zamundaaa/drm-colorop-list-add-corruption
> 

Thanks for the test branch. Got a repro and will investigate.

Harry

> 
> 
> Am Mo., 19. Aug. 2024 um 22:57 Uhr schrieb Harry Wentland
> <harry.wentland@amd.com>:
>>
>> This is an RFC set for a color pipeline API, along with implementations
>> in VKMS and amdgpu. It is tested with a set of IGT tests that can be
>> found at [1]. The IGT tests run a pixel-by-pixel comparison with an
>> allowable delta variation as the goal for these transformations is
>> perceptual correctness, not complete pixel accuracy.
>>
>> v5 of this patchset fleshed out documentation for colorops and the
>> various defines that are being introduced.
>>
>> VKMS supports two named transfer function colorops and two matrix
>> colorops.
>>
>> Amdgpu advertises the following pipeline for GPUs with DCN 3 or newer:
>>
>> 1. 1D Curve EOTF
>> 2. 3x4 CTM
>> 3. Multiplier
>> 4. 1D Curve Inverse EOTF
>> 5. 1D LUT
>> 6. 3D LUT
>> 7. 1D Curve EOTF
>> 8. 1D LUT
>>
>> The supported curves for the 1D Curve type are:
>> - sRGB EOTF and its inverse
>> - PQ EOTF, scaled to [0.0, 125.0] and its inverse
>> - BT.2020/BT.709 OETF and its inverse
>>
>> Note that the 1st and 5th colorops take the EOTF or Inverse
>> OETF while the 3rd colorop takes the Inverse EOTF or OETF.
>>
>> The 3D LUT is a 17^3 tetrahedrally interpolated LUT but the mechanism
>> exists for other drivers to describe their own 3D LUT capability.
>>
>> This mirrors the color pipeline used by gamescope and presented by
>> Melissa Wen, with the exception of the DEGAM LUT, which is not currently
>> used. See [1]
>> https://indico.freedesktop.org/event/4/contributions/186/attachments/138/218/xdc2023-TheRainbowTreasureMap-MelissaWen.pdf
>>
>> At this point we're hoping to see gamescope and kwin implementations
>> take shape. The existing pipeline should be enough to satisfy the
>> gamescope use-cases on the drm_plane.
>>
>> In order to support YUV we'll need to add COLOR_ENCODING and COLOR_RANGE
>> support to the color pipeline. I have sketched these out already but
>> don't have it all hooked up yet. This should not hinder adoption of this
>> API for gaming use-cases.
>>
>> We'll also want to advertise IN_FORMATS on a color pipeline as some
>> color pipelines won't be able to work for all IN_FORMATS on a plane.
>> Again, I have a sketch but no full implementation yet. This is not
>> currently required by the AMD color pipeline and could be added after
>> the merge of this set.
>>
>> VKMS patches could still be improved in a few ways, though the
>> payoff might be limited and I would rather focus on other work
>> at the moment. The most obvious thing to improve would be to
>> eliminate the hard-coded LUTs for identity, and sRGB, and replace
>> them with fixed-point math instead.
>>
>> There are plenty of things that I would like to see, but they could
>> be added after the merge of this patchset:
>>  - COLOR_ENCODING and COLOR_RANGE
>>  - IN_FORMATS for a color pipeline
>>  - Is it possible to support HW which can't bypass entire pipeline?
>>  - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
>>  - read-only scaling colorop which defines scaling taps and position
>>  - named matrices, for things like converting YUV to RGB
>>  - Add custom LUT colorops to VKMS
>>
>> IGT tests can be found at [1] or on the igt-dev mailing list.
>>
>> A kernel branch can be found at [2].
>>
>> I've also rebased Uma and Chaitanya's patches for the Intel color
>> pipeline on top of this to show how I envision them to mesh with
>> my changes. The relevant branches can be found at [3] for the kernel
>> and [4] for IGT. There were some rebase conflicts in i915 and I'm
>> not entirely sure I've resolved all of them correctly, but the branch
>> compiles and shows my thoughts for the new DRM concepts to support
>> Intel's pipeline.
>>
>> [1] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-color-pipeline-v5
>> [2] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-color-pipeline-v5
>> [3] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-intel-color-pipeline-v5
>> [4] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-intel-color-pipeline-v5
>>
>>
>> v5:
>>  - amdgpu 3D LUT
>>  - Don't require BYPASS
>>  - update RFC docs and add to TOC tree
>>  - add drm_colorop and COLOR_PIPELINE kernel docs (non-RFC)
>>  - add amdgpu color pipeline doc
>>  - define SIZE property similar to drm_crtc's GAMMA_SIZE
>>  - various minor fixes and cleanups
>>
>> v4:
>>  - Add amdgpu color pipeline (WIP)
>>  - Don't block setting of deprecated properties, instead pass client cap
>>    to atomic check so drivers can ignore these props
>>  - Drop IOCTL definitions (Pekka)
>>  - Use enum property for colorop TYPE (Pekka)
>>  - A few cleanups to the docs (Pekka)
>>  - Rework the TYPE enum to name relation to avoid code duplication (Pekka)
>>  - Add missing function declarations (Chaitanya Kumar Borah)
>>  - Allow setting of NEXT property to NULL in _set_ function (Chaitanya Kumar Borah)
>>  - Add helper for creation of pipeline drm_plane property (Pekka)
>>  - Always create Bypass pipeline (Pekka)
>>  - A bunch of changes to VKMS kunit tests (Pekka)
>>  - Fix index in CTM doc (Pekka)
>>
>> v3:
>>  - Abandon IOCTLs and discover colorops as clients iterate the pipeline
>>  - Remove need for libdrm
>>  - Add color_pipeline client cap and make mutually exclusive with
>>    COLOR_RANGE and COLOR_ENCODING properties
>>  - add CTM colorop to VKMS
>>  - Use include way for kunit testing static functions (Arthur)
>>  - Make TYPE a range property
>>  - Move enum drm_colorop_type to uapi header
>>  - and a bunch of smaller bits that are highlighted in the relevant commit
>>    description
>>
>> v2:
>>  - Rebased on drm-misc-next
>>  - Introduce a VKMS Kunit so we can test LUT functionality in vkms_composer
>>  - Incorporate feedback in color_pipeline.rst doc
>>  - Add support for sRGB inverse EOTF
>>  - Add 2nd enumerated TF colorop to VKMS
>>  - Fix LUTs and some issues with applying LUTs in VKMS
>>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Jonas Ådahl <jadahl@redhat.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alexander Goins <agoins@nvidia.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Aleix Pol <aleixpol@kde.org>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Victoria Brekenfeld <victoria@system76.com>
>> Cc: Sima <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
>> Cc: Hector Martin <marcan@marcan.st>
>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>> Cc: Sasha McIntosh <sashamcintosh@google.com>
>> Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Alex Hung (13):
>>   drm/colorop: define a new macro for_each_new_colorop_in_state
>>   drm/amd/display: Skip color pipeline initialization for cursor plane
>>   drm/amd/display: Add support for sRGB EOTF in DEGAM block
>>   drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
>>   drm/amd/display: Add support for sRGB EOTF in BLND block
>>   drm/colorop: Add 1D Curve Custom LUT type
>>   drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
>>   drm/amd/display: add 3x4 matrix colorop
>>   drm/colorop: Add mutliplier type
>>   drm/amd/display: add multiplier colorop
>>   drm/amd/display: Swap matrix and multiplier
>>   drm/colorop: Add 3D LUT supports to color pipeline
>>   drm/amd/display: add 3D LUT colorop
>>
>> Harry Wentland (31):
>>   drm: Add helper for conversion from signed-magnitude
>>   drm/vkms: Round fixp2int conversion in lerp_u16
>>   drm/vkms: Add kunit tests for VKMS LUT handling
>>   drm/doc/rfc: Describe why prescriptive color pipeline is needed
>>   drm/colorop: Introduce new drm_colorop mode object
>>   drm/colorop: Add TYPE property
>>   drm/colorop: Add 1D Curve subtype
>>   Documentation/gpu: document drm_colorop
>>   drm/colorop: Add BYPASS property
>>   drm/colorop: Add NEXT property
>>   drm/colorop: Add atomic state print for drm_colorop
>>   drm/plane: Add COLOR PIPELINE property
>>   drm/colorop: Add NEXT to colorop state print
>>   drm/vkms: Add enumerated 1D curve colorop
>>   drm/vkms: Add kunit tests for linear and sRGB LUTs
>>   drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>>   drm/colorop: Add 3x4 CTM type
>>   drm/vkms: Use s32 for internal color pipeline precision
>>   drm/vkms: add 3x4 matrix in color pipeline
>>   drm/tests: Add a few tests around drm_fixed.h
>>   drm/vkms: Add tests for CTM handling
>>   drm/colorop: pass plane_color_pipeline client cap to atomic check
>>   drm/amd/display: Ignore deprecated props when plane_color_pipeline set
>>   drm/amd/display: Add bypass COLOR PIPELINE
>>   drm/colorop: Add PQ 125 EOTF and its inverse
>>   drm/amd/display: Enable support for PQ 125 EOTF and Inverse
>>   drm/colorop: add BT2020/BT709 OETF and Inverse OETF
>>   drm/amd/display: Add support for BT.709 and BT.2020 TFs
>>   drm/colorop: Define LUT_1D interpolation
>>   drm/colorop: allow non-bypass colorops
>>   drm/amd/display: Add AMD color pipeline doc
>>
>>  Documentation/gpu/drm-kms.rst                 |  15 +
>>  Documentation/gpu/rfc/color_pipeline.rst      | 376 ++++++++
>>  Documentation/gpu/rfc/index.rst               |   3 +
>>  drivers/gpu/drm/Makefile                      |   1 +
>>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 581 ++++++++++++-
>>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 196 +++++
>>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
>>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
>>  drivers/gpu/drm/drm_atomic.c                  | 184 +++-
>>  drivers/gpu/drm/drm_atomic_helper.c           |  12 +
>>  drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
>>  drivers/gpu/drm/drm_atomic_uapi.c             | 175 ++++
>>  drivers/gpu/drm/drm_colorop.c                 | 562 ++++++++++++
>>  drivers/gpu/drm/drm_ioctl.c                   |   7 +
>>  drivers/gpu/drm/drm_mode_config.c             |   7 +
>>  drivers/gpu/drm/drm_plane.c                   |  52 ++
>>  drivers/gpu/drm/tests/Makefile                |   3 +-
>>  drivers/gpu/drm/tests/drm_fixp_test.c         |  69 ++
>>  drivers/gpu/drm/vkms/Kconfig                  |   5 +
>>  drivers/gpu/drm/vkms/Makefile                 |   4 +-
>>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 449 ++++++++++
>>  drivers/gpu/drm/vkms/vkms_colorop.c           | 102 +++
>>  drivers/gpu/drm/vkms/vkms_composer.c          | 115 ++-
>>  drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
>>  drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
>>  drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
>>  drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
>>  include/drm/drm_atomic.h                      | 130 +++
>>  include/drm/drm_atomic_uapi.h                 |   3 +
>>  include/drm/drm_colorop.h                     | 427 ++++++++++
>>  include/drm/drm_file.h                        |   7 +
>>  include/drm/drm_fixed.h                       |  18 +
>>  include/drm/drm_mode_config.h                 |  18 +
>>  include/drm/drm_plane.h                       |  19 +
>>  include/uapi/drm/amdgpu_drm.h                 |   9 -
>>  include/uapi/drm/drm.h                        |  16 +
>>  include/uapi/drm/drm_mode.h                   | 156 ++++
>>  40 files changed, 4595 insertions(+), 34 deletions(-)
>>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
>>  create mode 100644 drivers/gpu/drm/drm_colorop.c
>>  create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
>>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>>  create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>>  create mode 100644 include/drm/drm_colorop.h
>>
>> --
>> 2.46.0
>>

