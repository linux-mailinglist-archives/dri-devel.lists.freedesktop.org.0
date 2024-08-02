Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA17945F7E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 16:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34ADF10E138;
	Fri,  2 Aug 2024 14:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Wzscfxyr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AC710E118;
 Fri,  2 Aug 2024 14:37:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPebq64jFqHlk414JGRF+Rn7zM6ZYtQ5MmVSEyM4eWpqah+J80lOQrUMoFFM6+TWXMgKFefqZDyvko73Nv9yDijVZaaXjup7BvzY76NlJxsR2/5lYhNbiVFnc3xAyXa4VIYNo64ewPqgR3LZtU5lbCNfOU5VtsykdDRZtS4YG+/cntcDmuNn4u/M3490BX0QEWYP4XM6e6Oq0qumgaAKFuhB1srVcBm7YKrghpduz0AYCx6ejk7hG0Tt0TTR/NlaAzviuIcF68Iz7D3VnpZpaVQ0+SeUNpP89+mnVjjiG6DTxAu98z2Fe+yWmpSj5UcpnWzWxl8akbg5xwk0USf22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrraMVgRRvSuY86c2isbrv5/kkGs/0D9FQU+4aGZ5n4=;
 b=jq24UyDVK1Z33lIadj7m5QoXBtPVY7LcYvBitaRw1R3Ac30/V8a5YoemkUJBD5R1Tjv6+MKsa9SP8pzN98LUzMX7GMnUeINEM5HYn4KFi9yHl0RLVLIOKUXVxW56c2dnCNG+1KGVD5Edt5GQCFJQSSzpwzzguxZy8Sg15I5cTk9YO4H/LuuMFU7ow9mZoCzZoqH9cbRnCV36+i+hJ3mT/D5c91fS2eR0ysCgl1kUmF6elDFggbYqojXlof1dFsAbkPWsguUCA8ZSLr7gB2qswdCbUz2sT9/c7Iu211jE1XlkQGa5i8Aa796iOap93tjZKeCI+F0uwarXRjv28iYhgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrraMVgRRvSuY86c2isbrv5/kkGs/0D9FQU+4aGZ5n4=;
 b=WzscfxyrZC+q86k4Ct+Hk6l3DGfMcbBeW/Zp28WHzubMxv/O7/InfoSP7FMSiVsMFc86vX0FdEOaS6fESn3vUEtuQBrRAkcWTrUQJbGUBarRjndqfo3WWUm+dlI35UOZ9YpxTueYvy8LoudgvjpdOCDeXqySwBQNfyiUvP0fIrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB6579.namprd12.prod.outlook.com (2603:10b6:208:3a1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.25; Fri, 2 Aug
 2024 14:37:11 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 14:37:11 +0000
Message-ID: <ce4ce642-39ba-4153-8838-039d8a88c07e@amd.com>
Date: Fri, 2 Aug 2024 10:37:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
To: Sebastian Wick <sebastian.wick@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@google.com>
References: <20240606020404.210989-1-mario.limonciello@amd.com>
 <20240606020404.210989-3-mario.limonciello@amd.com>
 <bc1d81ef-d9d0-4440-b63f-ecfb735ef783@amd.com>
 <d637d3c2-34f7-42f8-acbb-6a1730d3fc3c@amd.com>
 <CAFZQkGy0xuuUw73HQvS8Ce92sUi2rVrRnX25pi1KdNmyQbtBZA@mail.gmail.com>
 <CAFZQkGz8DeoiVX2MohoBoTMxraJk1Ou41N_wKP3GkqRrPg_6sg@mail.gmail.com>
 <87wml0v2vv.fsf@intel.com>
 <CAFZQkGx=Q0W2r6XWxovt90WkBC5CUg7_X2fM7ZicSOALUg8yJg@mail.gmail.com>
 <CA+hFU4w8kR1XjAZgXeUd7Z-pWDWn3yAv59HBr8o0iGhYruUssw@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CA+hFU4w8kR1XjAZgXeUd7Z-pWDWn3yAv59HBr8o0iGhYruUssw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::32) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB6579:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d8e087-7ef1-44d8-6299-08dcb300978d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE8wMkpvbzkzUXRLY3hQbjZvZllHTnUxVEJXOXUvejczcFBMOVdKZERQREpC?=
 =?utf-8?B?TlU0V3orN2ROcDB5dVNYaitkSTRIRWpReGNtejVYbGlPaHlxczc1SGpZYlA5?=
 =?utf-8?B?QnNyU1JxcTRNMmd5cUlETFMwMkVUSlVEaXExL0hERHNCNys1WGRrZFZRYUFO?=
 =?utf-8?B?WXFKcEwzZmg2MEtHU01pekQzL09hZkJSZGZhTzR2SzNVaXBQWStFZWVWOXN6?=
 =?utf-8?B?TDVsaFFKejJ1eW5VSEQxQndDdU5BYmRkQzlnc0ZkQzJjZ1p2blJObG9zT0g5?=
 =?utf-8?B?L2JIMHZDYURzVlFtTStWei9jTHpRVWJBN3Y4QTNkSWlWK3BEang4ak5UbkFO?=
 =?utf-8?B?Z0Z4L3ZobHVwcjdYM0JTdUEvNjNhakZvSVREKy8xNS82NDcwUHdva2ZlUVph?=
 =?utf-8?B?NVRockFYejNlVmpYUU9pbllXMmI5engwOWVGaHl3eGNjenpmRkJoa1JXTjB2?=
 =?utf-8?B?cUxFamU4MDFmWS9xRGhIK2I1WUwzZ25hdkNGR3Jrd2NiTnlQcWYybmZSL3Av?=
 =?utf-8?B?eUpDWHlRZU1tQkxkdG5qclg4bkhTRm14YXJzUFNNbEM4NDBqbnNRQ0EybVhn?=
 =?utf-8?B?NUdRblprNGVLOVUyV0F0NmZMS2tmRkN5amN2UUdnVEJ5clJzdE5WRmNMeE9h?=
 =?utf-8?B?TjZDdUVwVVM5a25LR3NxeG04OEloUkhTTzdMVDNIZnZCcCtmSmVGWElFRDNq?=
 =?utf-8?B?N0prOG40Qkc0cGpUejRKOXpEQjZUTkEra1pvYlJrQWV5UVEyRzlUOGpCNTRt?=
 =?utf-8?B?TEN1VEhuNndoZVd5eHV2MzRjVXM2VGRYLzVzRE41OW5BK1NxejV2UktvSFpC?=
 =?utf-8?B?b1JjckN2ZDlrRldtcld4M3czWXpOZHBNL054djk5dWIrWE00cTYvYlVNRzF1?=
 =?utf-8?B?RnRvVjJLQ0tqY1dLM1M2SHdLWFd2YVlMNEhuNi9kQ0hOMkgwdStheFBPTmlH?=
 =?utf-8?B?WndTTG5lY3pKbUNMNXR0UFpGdG5Cakd2ZFJVTUR1c0pMTUkrMFQ1c3hlQU84?=
 =?utf-8?B?cTBRaVVDUE9qKzM5VXUzazlKL1M2K3p2VjhGT3M3VWV4SzhCa3VpTE50NU5T?=
 =?utf-8?B?Z2FmcWoyL3RvZWpidnpsblRtY0YrRTNzMnJzajBuTTFDQlljZm1ITGVYMU5B?=
 =?utf-8?B?YlNDbDN3aWRxSFAvM2RyeUhaZjYvdjRNcE1QeTBmWGZpVzcrdzRaN0NlTlI4?=
 =?utf-8?B?TXoyUU9xa2txTTFXMUtQQ0pVWERmVnJBcXVvOUM0TTVRY3U5WmgwREJsYW9G?=
 =?utf-8?B?MFhXdHNOSDZVV0VTTzkvWXZVcVZrak1xTUVPQWtiNHNQQ0s5eGRvNG5hS0Zx?=
 =?utf-8?B?TGRhZjJTYU1jQjJqMkI2MWxleTcyanRWMW5MSzZLRTczYkhDMnkyc2lvMklO?=
 =?utf-8?B?NUtxdHZTQ2o3VCs2djNXOFNQTnZReWRSVWpmTzdUZkVpTmdnc1N6UGhWdW00?=
 =?utf-8?B?a0hIemFEeC9CSHN3L1BpT21lemdqL0VhRkV0eUVwY2ZuT0VIbXM5dDM5WWNN?=
 =?utf-8?B?S2ZrSTY4UWNzMWdzbXVuUHJRR2xUa1dnb3pmenByYXh4QWVhYUY1U2lZanBr?=
 =?utf-8?B?TmxyQWZvOU9FcXRlVGNvbmNyVC9YMnV5ZkIzdVJiTklGSTJOS0ZMM0p5MVZh?=
 =?utf-8?B?S0s0ZXg5VmVXa0daRVp1ZjB2UEZKRUlhQW1FNThURjVOblV4QUE3c0ZWWVR4?=
 =?utf-8?B?UHRGcU1veGVENWUwaDFMdXM5SGZlRy9hWlBYVU1wbE5BYTU0K0tmNEFNNnZv?=
 =?utf-8?Q?Fji/WpXH/veIUSF4rM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnYrbWs2OTVGVjFLblVySHQ3UmFUcTMxQ0NuZmprTFNTS2RmRzhmRWVmejFO?=
 =?utf-8?B?QXNVMFlFa1FkbmVldlJMakZhKzF2eGxUc3N5c3lHL3hZRGpLaUxOVVFQLzdv?=
 =?utf-8?B?UXpRaUhuL3FHTGV5Q0NrUVpQazRFLzJrYXQ5U0xiZkhod3BLQzh2UTF4NzIv?=
 =?utf-8?B?Unh3a2YvbFcxcFlWKzZmVjlWWkY3NnlrZmdhcy9md29LaHJUNXdVVnpUN1F2?=
 =?utf-8?B?Skk0eEM3Vm52ZlhNOXRVWUtqT2o0SUFHK01wTFVSSzFGMWVLdnZoZHJzaE1k?=
 =?utf-8?B?QU01cnZrbVJtNkY4aUtyRjdqbmZCNTJuLzN0L1c1d1g3OGQra3dIcHhrZW90?=
 =?utf-8?B?ZDgrL0JWdTV1eXlrdnR3YVhFakJoSWFSTWh0UFZUL2RsczR4NVh0REZQdkN4?=
 =?utf-8?B?ZWxzMEtueWU5WXhCVnpydHd4VEJldlBhc0dKazdHUWx1bUdUVWdUQlNxa2tp?=
 =?utf-8?B?aHlJQTU5ZVR1NnJmbkxoeDNsVGI0VUtJdXU1REp3MUFNb0hmVTdCZ2xjS2VY?=
 =?utf-8?B?MU5CNTcyUlByYlgwZGQwTWtFOG1DMXBsYWthdWlIZXREcEdydTlIM1VJS2Ny?=
 =?utf-8?B?V0syVjA1cE4vRVNQRys2VVozZ1ZFUnpJTGFGbGk5bmxyYVY0QjRjUzIxdWNC?=
 =?utf-8?B?dmpqTXpLbENhVlFhU3VieVlVRWlVVnlCRDVUSFl4Smg3eVN3K250TCtBVEFS?=
 =?utf-8?B?MnYyNk9ONnNQSi9OdWh3NDBQMmZyV1dGQjh5M3pjc3JjVERBZXhNdEtrTHdz?=
 =?utf-8?B?MjlDS0FEYkZscStVd3lVdnVEN052cDRyQ3BBQnArY0U2bTdJRWYybkQ4dTVF?=
 =?utf-8?B?dE9DSnJadmNRbHhCcVYvLzFHZ2d5a3B5Y0pSR29LT1RyMlBhRUpTUTR3UENS?=
 =?utf-8?B?cWpBU1FVbGdKRDMzZ1RSVlp5WGU3bm9BcXNJQTNmZ0k3cmo2THFNaE10SUcx?=
 =?utf-8?B?MU9hWGJFU1dkYmtITVlSbVlsVmJGTGQwbWtZUUNMOFdvQjRFSlI0Z1lsZ3RZ?=
 =?utf-8?B?c1krWHVMRGNpT0RLaGM4M0h2bHlld3hIajh0ZndnUmphUHZtQjRBYXR1MmtE?=
 =?utf-8?B?QU53M0ZzYjZkZHczRzQ4ZGltS3lxSjB0TFYwWG8yaWZFQ3NSV3krVnBCZWdw?=
 =?utf-8?B?aStrbHlBSW1NNU8yaFkvUUZBZnBBK3ZWYVhiNTkrT0pDVXFNSjY5K3pyU0Zp?=
 =?utf-8?B?WHlpK0F1L0ZEay9hWUZMSDRWd0FSQTN0U0Y3elo4UHFRU0kwTU5hdXQxcm45?=
 =?utf-8?B?c29YbUZaTndYWjVWZU5xVVQzUitnOU5NMU1JajZyR0JJZ2JCUUp4VmxVTTlK?=
 =?utf-8?B?TUlsTXZHSnVqcXdpaFNiaTlKdTdaVk5MU3I2RzhvMUpGcEw0aTNiT2crOG84?=
 =?utf-8?B?UFAvUDdzY2RweDNBaVVWb29DUTRZNlprQ09kMW1uWlY2R0sxT3ZMM05TcG8w?=
 =?utf-8?B?R1dMQkdTVzVnMWdWS0JDNS9OcDM4eHRwWmJoN0VhT1M2U1pmUVJucFJrVndh?=
 =?utf-8?B?VjkvSGhIR0RwWU9ZQlo3UXhPWWd0aDZqVnBKUkN5NXZaaHErTkMvNlk1Qy93?=
 =?utf-8?B?SENNd0RsbGJTK1grK3laZGc5WHExMlhjT3N0ZkdUMGFQaXN5RWNuVGVpZU9w?=
 =?utf-8?B?UkFEQmFsd0UrV2QwWVR2TTBzNEY3N3pvMjEyTGNLNGhiZ25qRk52NU93YmVE?=
 =?utf-8?B?UWdJNktuVlFBZ0dmYTZNVUtENnkyMXJ1Zmd2b3d4ZXNjQkhRWXJ6b21kdUZa?=
 =?utf-8?B?cWVJTTBUckNSZHlSaGF6VTBRRHRnVllqVlZYa2QrdXU5VHUwamUrd2RLVjd5?=
 =?utf-8?B?VXBZb0Q5dEswdFVVa0o4RXNybzZYckdPeGZVTXBZVlRYa0dBZW54aWpNekt5?=
 =?utf-8?B?Z2UvU0MzM1IxckZZaE9qQ0tuYTkxM2Q2QTV6MDAvYS9EbDI1cjJTZkdWL2pH?=
 =?utf-8?B?Sk9wdkpWdmlnNHowWWJYbU45T21CeGtnY0dzR3hlckdiQzJ2NGRxK0pwZjZ4?=
 =?utf-8?B?NjI5K0V2ZFhPOC94UjZTUDBrV3FaRmJLSDAwbHE5Yy9mWmtHcWdCSmJzb21x?=
 =?utf-8?B?bGhERll0elJ1QVA2QzhVTGhEaHZvVjc0aUNUVG1PWDhwWTN1NmVndlJXbzhr?=
 =?utf-8?Q?Oqdj4pXOtfTDC++j8k7J/haoQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d8e087-7ef1-44d8-6299-08dcb300978d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 14:37:10.9179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDH6D28wUYSp+UKvBJzNm9EZ0EkDlNrtGezBuXaxLMm9OCAQCEkr31dIJdckw5l/CGYMX30y2kwaKXXGv2uJRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6579
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

On 2024-08-02 09:28, Sebastian Wick wrote:
> I'm very unhappy about how this has played out.
> 
> We have a new sysfs property that controls a feature of the display
> path that has been set to a default(!) which changes the color
> behavior! This broke color management for everyone who is on a device
> which supports this feature.
> 

Has this been a problem that people have noticed or complained about?
Are there bug reports?

AFAIK the default is "off" and PPD will enable ABM if in power or
balanced mode and on battery.

> What should have been done is the following:
> 
> * add the KMS property and have it default to "sysfs cannot override this"
> * add the sysfs property after the KMS property has been introduced so
> it stays disabled by default
> * add support for the new property in compositors and let them enable
> this feature only when they allow colors to randomly get broken
> 
> Every other path results in broken colors at least temporarily and is
> breaking user space! The sysfs property *must* be reverted because it
> breaks user space. The KMS property *must* be reverted because it
> didn't meet the merging criteria.
> 

I agree we should revert the KMS property until we have a userspace
implementation that is reviewed and ready to be merged. It was merged
based on a misunderstanding and shouldn't have been merged.

I don't think we should revert the sysfs property. The power savings to
end-users can be significant. I would like to see compositors take
control if it via the KMS property.

> Another note: The only way to make sure that this isn't breaking user
> space is if user space tells the kernel that this is okay. This means
> that the sysfs property can only be used if the compositor grows
> support for the new KMS property and at that point, why do we have the
> sysfs property?
> 

We have a good handful of widely used compositors. We have one PPD
with a replacement for it in the works. A sysfs allows all users
to get the power benefits even if compositors don't explicitly
enable support for power saving features in KMS. The goal of PPD
and co. is power savings while that is not always a primary goal
for all compositors (even though compositors play a large role in
a system's power usage).

Harry

> On Fri, Aug 2, 2024 at 2:49 PM Xaver Hugl <xaver.hugl@gmail.com> wrote:
>>
>> Am Do., 1. Aug. 2024 um 14:34 Uhr schrieb Jani Nikula
>> <jani.nikula@linux.intel.com>:
>>>
>>> On Mon, 01 Jul 2024, Xaver Hugl <xaver.hugl@gmail.com> wrote:
>>>> Am Do., 20. Juni 2024 um 22:22 Uhr schrieb Xaver Hugl <xaver.hugl@gmail.com>:
>>>>> Merging can only happen once a real world userspace application has
>>>>> implemented support for it. I'll try to do that sometime next week in
>>>>> KWin
>>>>
>>>> Here's the promised implementation:
>>>> https://invent.kde.org/plasma/kwin/-/merge_requests/6028
>>>
>>> The requirement is that the userspace patches must be reviewed and ready
>>> for merging into a suitable and canonical upstream project.
>>>
>>> Are they?
>>
>> I've talked about the property with other KWin developers before, but
>> there's indeed no official review for the MR yet.
>> As some new discussions about alternative approaches have started as
>> well, maybe it should be reverted until we're more certain about how
>> to proceed?
>>
>>> BR,
>>> Jani.
>>>
>>>
>>>>
>>>> In testing with the patches on top of kernel 6.9.6, setting the
>>>> property to `Require color accuracy` makes the sysfs file correctly
>>>> report "Device or resource busy" when trying to change the power
>>>> saving level, but setting the property to zero doesn't really work.
>>>> Once KWin sets the property to zero, changing the power saving level
>>>> "works" but the screen blanks for a moment (might just be a single
>>>> frame) and reading from the file returns zero again, with the visuals
>>>> and backlight level unchanged as well.
>>>
>>> --
>>> Jani Nikula, Intel
>>
> 

