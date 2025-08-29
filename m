Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FBBB3B015
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 02:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA92A10E0AA;
	Fri, 29 Aug 2025 00:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pcNyzL7Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0779B10E0AA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 00:56:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXs8d1z9PgcsqSTXIz+IG5NU6IdkEAtenNBX10eMC3KOeAF7jqUS5hS2cE3k9n/5K3ALjAnJGcTn/5R7iQGnG/bWp4jQmOzLtCD4/byrcYS8A/o3eJmki3YnE5yuDIZE17WJu2qEQ6n3+6y078kqQTrWBFjQmIp56E7nx4brdtlG8FivF2WKFImTBpQSp7fOyj4QBqBXq0IT3bGmC/TSG3Du21F1DUsuhdTAX7xqKTAz/ZELd2pV/HL4puhnJrgwouHBFXq44g6b6fCDn8MIjR19u7YJ1s3E0KoJizOlSWQFQYU0wGjzGmPYVapyV+CNbKyrNaAjTH0FIiBsRZhEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElV8c7UXYWpDa86Yt0jvN7wvxWF0XAijYX6lzQqg9UE=;
 b=qOr3U8cCIL26d2qQvNKBwrkai2EzeEwBMo4UCnZBJxvc4MO8GNHeZI9XqB+3LFb1TdIuSyYmozgBn/i3BYFhFK0WtYeFoiw0Q7XsWZEgwyKRXDfos+D3nXSJDsDEKApK99ZWxVFGvegKuoEC1/B8MApunUPKHTmCAujPGaClecPM3EgJ6yS8ZmJRkBIOQ4yhkNyvzAscYFGkMZVFcg0BgPAO4a+GdH3471CQ3DEq/6FLak19MsS7NoLpS9JA9Zd0kXIpDTC0hKNT/vz79Emv4x4z5gjWBq3oYprVY0dvIoTSyfidMa+zW7hIAiGctlxLG8YJ0LxJvMyHHf8IiZwEGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElV8c7UXYWpDa86Yt0jvN7wvxWF0XAijYX6lzQqg9UE=;
 b=pcNyzL7ZkcEq27uL1IWn5CtWNMci+LFVZFvG2F1eWY27yLaVR0q33whndwxbIENjGNdk2rQq+pXF9v0sivSJcVwGV0LZLDdYY7pXVgkfEulLNzxthH1Gu2MDbag7vrjmu8JRaM/hwnWVpNST5mdPZsICIE4rSOQ4aijtfxTwNiaMfupfr5X71HUv0CwFEWVNp3N3/y9gJZCAJNY7E6OMrtzYM/pWabP84ryiFrRUktWEXWADBhjrfar2PacRjSklW1UapcMLxsJwvltowSH5OWvcV9x4a0Zhp4TnwNHd9nMHWjzZ1jpuynfiBzVAtYu42/8yT/1tkgrE9OoUv8LRwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.17; Fri, 29 Aug 2025 00:56:25 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 00:56:25 +0000
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
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>, Svyatoslav <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 05/19] staging: media: tegra-video: expand VI and VIP
 support to Tegra30
Date: Fri, 29 Aug 2025 09:56:15 +0900
Message-ID: <2289640.ZfL8zNpBrT@senjougahara>
In-Reply-To: <4BD9010B-3F5B-4EE3-B57C-A20DFAEC5276@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <2271797.NgBsaNRSFp@senjougahara>
 <4BD9010B-3F5B-4EE3-B57C-A20DFAEC5276@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::20) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 4720403f-1076-45ed-c323-08dde696e0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2htb1RlU0IwMEVJNTJoNXRxVUhuNXR4aDRENCsrZEFCQTRFbEVjTElzQTBt?=
 =?utf-8?B?MTU1K2lHbEtqbEMrN0F3bjFkM0tWeWNhMXgxcUNSWFN4Nno5RUZpejlsY1RU?=
 =?utf-8?B?MXBISmJEVG9vMGhzLzVGUzJsYndkK3dzSStnMGExWmx3QUhQLzhVcndBRnRI?=
 =?utf-8?B?WEg5Vk5EeXZnM082eDJkem5QQ21HKzhKaE5iME1ZRUdEYWRRcHlrUGZ2UkpM?=
 =?utf-8?B?c2JVM3prRTZya0I4Q3J6Q0s5ZVlaK1hUYXE1eC96L0d0c20rTVRSaldxNHoz?=
 =?utf-8?B?azdaRmNibUIvbk1EZUoyTjZOOE1xbUhjbUdqdm56S25WNjVJbWErY0praVUz?=
 =?utf-8?B?YWVRdlRLMWRKUnBUNUJCb1BlY1RiL09KcjBiL0VmbXdxbXNTb1VXOVYyZUxt?=
 =?utf-8?B?UW00RytmNW9jUVk3YzhlZ1lsZU92V3ZxRjhsTVJBaFFNUXVTZUxHM3l3bWgw?=
 =?utf-8?B?dlVqd3ljcmRGQW5XSm5hRHNsbnYzbVNzR2VOK3hHbW0yWFROOGsrRVN6T3NP?=
 =?utf-8?B?QmRiZnd2WWgvVTRraUpCTmpyYVRpaUMrNFA4UithbnhzMkwrb2E5WnRqUEgr?=
 =?utf-8?B?c2kxaVk1VHNpeE1VdzhkK1pMRHZCRHYzbE50ZjBKM0JNWHlLVitiVzNwdXlL?=
 =?utf-8?B?Uko1cWVTTjVYQ0dzNjZJOG5sdmY4VndIS0FhMGd5c053NG96NlJ1SkQ4WGVF?=
 =?utf-8?B?TjZUNmVEK3kxK3BlZEhvYzhTVGdnYnRWWXZPQjlzMlpKbE5IZ1UvK2NUTVow?=
 =?utf-8?B?OWorNGJjV2VNMzQ4MTZpQU5WSHRGZmJ6WTBqMGNSbjRwNURMQmxCMVFQS2k1?=
 =?utf-8?B?R1UwQm54WjZkbjJnTUVCanE0WWZtM2tkU1QrZHZsaWVMZ1c5bk54a09LVVQw?=
 =?utf-8?B?T3owSjRkTzJIVlh5TkZIYmc2NU9DOU4rbW0wcGtIbkRUaUV0bmd1emZEeTRK?=
 =?utf-8?B?SkVUNmp5S3hFN3ZoTGlGNkZUYjlmWjVMcXptYUVHM1c2azc3cEphV3VnUE02?=
 =?utf-8?B?aUE3Ym5LY2FZTWJuek9HWXZTeTFFRkdOZHh5YytmM2YxRkxVa3VKTWVmTmxz?=
 =?utf-8?B?RmRyQ0hIRHBSK1FmZ05XdG1XNWZwSDlaaVRWaHBiOWtoQkxEWU9rTUF6Mksx?=
 =?utf-8?B?VS9wZi9BTS9XN1RHVDVuY09DYVg3NjN6Nml3K3dDd1JsL3J3UGFKM2tNdDQr?=
 =?utf-8?B?dko0REVna3o1ak81d3pWY1VSVTZZUXJxTTBHT2Rxb1pWdVNPcE9ZYldLSWcr?=
 =?utf-8?B?K04wMFRObnUzZkQ3VTU2bzdLWmtxMVliNCtxa1UzMm1tY0JOWDRNVDRQSldp?=
 =?utf-8?B?N0dmZDArQURwRkNOWkN2cDV0NmNObjFIaHdhb1JrLzEvVkZkNEIvL0duWXBo?=
 =?utf-8?B?TXg5Ni9PVzkyUnlKTUlVK21MUTJ4TndUTHdTVnNaVWl0UFdqU1JpelJUa3hy?=
 =?utf-8?B?UlFJYkNBc1VWWDBad0c4elRaNU56bEN4NlBHZTBSR0tnZWpUZFNmcUo5RFln?=
 =?utf-8?B?VENXNUxtdEZ4QURpV091YzFJazZZdldEbTNENHFDYmxJR0FvMUFLSTljU25S?=
 =?utf-8?B?ZU5POFdtaXN5amdDUG9XR2RraUt0cWZyejlnb1lqVzlJZTFPTTczMS9ReU1h?=
 =?utf-8?B?VGZ0eHBKNHJ3TE1iVHdvRStCUUw3QnBrUjBBMXdBeU5uZ2xwa0dKOW15eDR3?=
 =?utf-8?B?QTNLRi90bjVJSDIvLzM1eUVEb1NxVTdtaDR1U0NUYlBnWjJsajBoTTl6V25Y?=
 =?utf-8?B?RHZMb0NYeXplZHpWK2ppTWZ0RDY4YkNkMHhkMTVqOXp3OEVEd0VXODI1czZ6?=
 =?utf-8?B?MWZNV2QyOE1vWityN2pvQUYxSHUrbmxMbmxZS0FHZ2todjgxNVBvUFQ4REla?=
 =?utf-8?B?bGg2cVF5QmJaZHhsTXIxLzlqVWlQa1NuNE04Z2ZmS2lQSHpiM2V4SlozbEJN?=
 =?utf-8?B?blVnb1pGWW9Sdnp0VVBLNEU4SEIybG80N1Q0VUc1Z0Z3MFBwajRCSiszeTJv?=
 =?utf-8?B?YXdPcitvVFBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUVaSFZ5MCtXM1NUcmkyM1hPV3J6b1hJNWo5WWsySjVES1hhN1hvRmhjUGw2?=
 =?utf-8?B?eko0ZU1UWG1Sb1dhVUlheXQrbXpKbTFjZWVwaSswcWxXOTJ4ZTh0QmZTUzFW?=
 =?utf-8?B?ZEJ2dG9OSFlNRE5RTVhGUWw1KzZNaXJKTDNmS21JbWUvQjJWOGxSblVjTmhw?=
 =?utf-8?B?TzNrYTdXbW5JVHhKbWpQN2tCRkJmUGlrbUllQlpqKzBIaXJsU0VUV21BWHFW?=
 =?utf-8?B?NXppVVlwcFpvTS9za01JQldDRzdhNStUSm5Mdk1raGpEZWM2UHdFWUo2eXFs?=
 =?utf-8?B?eUxzeE5WeCtvL3N0TUFpOWIwcnAwQy9mZnFISG52UnhRblRrbnZCVFVmMUhS?=
 =?utf-8?B?Yyt3YnplTVhyT3ZMMmc2OGwwWURYNGVKZjRjRmUyWU1iVER0Y2VzOWpUMnhE?=
 =?utf-8?B?cnphZGNxcUhyd01BSmRheWJVdnpaTkZpWFl3NUJZZ2NscWU5dUsyeUlSWW1S?=
 =?utf-8?B?aTRHVXp2RGMxbFBMcUY4NTRRVitKVVloSG1waTZ1V2UrdUR3S3JDdG12Z1N3?=
 =?utf-8?B?ZWhjWnc2eU1nb3Z5V3YwcFB1YktHOWJ0L3crRTZMY1l4VEJMeWhoUzdzRCt5?=
 =?utf-8?B?cFJIM2dIMkMvemE4dHhkTnVZRnpYbElOZzltNzVENWlwZWxhZUR3MVJ1V01a?=
 =?utf-8?B?a0E5ckdrOUVUT0JMQjFIeUgzam9Eajl5WU5sVFUwU2xIT1JyN1lLYXJDZVk5?=
 =?utf-8?B?UlRhc0s3Vkp2by81M21va1B6YmE1NUxCLzlZMmF2ekcwbjQvUGdMWldkL0wy?=
 =?utf-8?B?cUNaY28vYWlBQ2ZHOFJoWXZUaytxZTVBVHJSOE5uWm8wcDloU2NWRXZUaWZC?=
 =?utf-8?B?bGFFUWpacVVwNmFMMU45ek5Pcy90SjdKY0E5ZzVWaVgxdGEyVDhrZG5mdDRB?=
 =?utf-8?B?ZW91U3hFSGxyVmRLeUJNNG1ibFUzOWgvL0g1aTRidzdJOVhsUzNCYnBIUDNh?=
 =?utf-8?B?QnBDNVA5dE5jS1pTaXd6dzlqYXltTVpBRUZaSEpKOFJ5L2hCTmFuRThmTmZU?=
 =?utf-8?B?TFpZdkFwRlRwMURKSHowQTdZZFlQL2oxbkR6MkdNNS9sMVBJYms3ZlBoMmNi?=
 =?utf-8?B?WFRWRWN6eldtZXZyWFJ3b3BKY0QrKzVKWmhCbjZoTVJyMkRsWllPNzVWc3NG?=
 =?utf-8?B?ZXZ2QTRLdmpOT1BvblpDazdGRThONkh3cERnZm50eEZUbzZMakJKRkx5dE1r?=
 =?utf-8?B?T21pdmVrSHM0MktQZGxybXlkTkVtZTB0aDVoTUNiaVcwTGQrdVlTRUs3WEEx?=
 =?utf-8?B?Nkl4YTlYajVtNXlMRlVGR25vc3RLVDhKOWdMTEdWVFF5K1pIamZIdXpLWlJz?=
 =?utf-8?B?Yzh4RHYxWmEyWndiR3hwSE9KNWJna2ZRa0hCMGpjNUcyZGFHWnJ4cTdneENH?=
 =?utf-8?B?OWFnVjZhaFRKdFBkSkFmYWhDeEtJV0taeW5qWWU2UGRrVUhnNEcwcW4wRkho?=
 =?utf-8?B?QW1STSs0enVZRUxGa1ptQms5S1k3WXpEYU93c0x4aVVTUWU1SHNJNVgxdnp2?=
 =?utf-8?B?RE1KNXNzaDFOU3NLbEtKZWlKeFdIVWhFOEN0NzJ2blVNMVBBekxia1pudzc5?=
 =?utf-8?B?T01paUMwdURGNkdWRjdhWHlZRFZFODJsV3RzWno3YlhYY0NYRGRPRjlsMlZF?=
 =?utf-8?B?Z0loUFBNeDU1NHpTV0FVOVJLbnZiK0YxU0RIUE9JYVBVbGJibUgyditzMmxl?=
 =?utf-8?B?aHNJUkdQbzQva0FwM1l3QlZYSENuaUxLWFdDN0FMQ1FMVlVzOVF4MGJ2SDdN?=
 =?utf-8?B?V204dUxtbzBKdmNFSTFhMExjVHJxQ2NKWHdVenFQejNHN0FGc3U0TjEvZ0V3?=
 =?utf-8?B?U3p4OVB5MGNZQ3QyU0phSGxWRUxhT2gvTWdsd2dTRCtNUi9sdnd4bVZOWFVR?=
 =?utf-8?B?SWFBa1hZazQrZGpHUTcwWndLYXdDWGZsZU9BZGxVcUxxUkhKelpORXhmaVly?=
 =?utf-8?B?NUpLTDFCbzZmVytuZDExRUd5WVMyUWNoWEM5cmZMOTBTbnFadTBoeWlDSzZ0?=
 =?utf-8?B?K3NZcC9ncTZrcXRpNkxBeU9PTC81VE1KUFdnSVYyWWpBVDkxM0JPRDczUmt3?=
 =?utf-8?B?ZUg5RzZrTVNDU01SOGJ2TlpBd0g3WTEvbWNkdjBCTkhCWDBlTmFPMEM0c1Vi?=
 =?utf-8?Q?Pd9J7Mcbtpnfb7+SshpLDBijt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4720403f-1076-45ed-c323-08dde696e0cf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:56:25.0856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP58oMPw0WWX3EdahHD4crvLnJYgK91UEzHHYRHRnB+c9Lvdh/pb2/aUAEUYxVVW1RIJv9NHuPf88MSihUaaRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930
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

On Wednesday, August 27, 2025 1:47=E2=80=AFPM Svyatoslav wrote:
> 27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80. 07:29:40 GMT=
+03:00, Mikko Perttunen=20
<mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> >> Exisitng VI and VIP implementation for Tegra20 is fully compatible wit=
h
> >> Tegra30.
> >>=20
> >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >> ---
> >>=20
> >>  drivers/staging/media/tegra-video/Makefile | 1 +
> >>  drivers/staging/media/tegra-video/vi.c     | 3 +++
> >>  drivers/staging/media/tegra-video/vi.h     | 2 +-
> >>  drivers/staging/media/tegra-video/video.c  | 4 ++++
> >>  drivers/staging/media/tegra-video/vip.c    | 5 ++++-
> >>  5 files changed, 13 insertions(+), 2 deletions(-)
> >>=20
> >> diff --git a/drivers/staging/media/tegra-video/Makefile
> >> b/drivers/staging/media/tegra-video/Makefile index
> >> 6c7552e05109..96380b5dbd8b 100644
> >> --- a/drivers/staging/media/tegra-video/Makefile
> >> +++ b/drivers/staging/media/tegra-video/Makefile
> >> @@ -6,5 +6,6 @@ tegra-video-objs :=3D \
> >>=20
> >>  		csi.o
> >> =20
> >>  tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  +=3D tegra20.o
> >>=20
> >> +tegra-video-$(CONFIG_ARCH_TEGRA_3x_SOC)  +=3D tegra20.o
> >>=20
> >>  tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210.o
> >>  obj-$(CONFIG_VIDEO_TEGRA) +=3D tegra-video.o
> >>=20
> >> diff --git a/drivers/staging/media/tegra-video/vi.c
> >> b/drivers/staging/media/tegra-video/vi.c index c9276ff76157..71be205ca=
cb5
> >> 100644
> >> --- a/drivers/staging/media/tegra-video/vi.c
> >> +++ b/drivers/staging/media/tegra-video/vi.c
> >> @@ -1959,6 +1959,9 @@ static const struct of_device_id
> >> tegra_vi_of_id_table[] =3D { #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> >>=20
> >>  	{ .compatible =3D "nvidia,tegra20-vi",  .data =3D &tegra20_vi_soc },
> >> =20
> >>  #endif
> >>=20
> >> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> >> +	{ .compatible =3D "nvidia,tegra30-vi",  .data =3D &tegra20_vi_soc },
> >> +#endif
> >>=20
> >>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> >> =20
> >>  	{ .compatible =3D "nvidia,tegra210-vi", .data =3D &tegra210_vi_soc }=
,
> >> =20
> >>  #endif
> >>=20
> >> diff --git a/drivers/staging/media/tegra-video/vi.h
> >> b/drivers/staging/media/tegra-video/vi.h index 1e6a5caa7082..cac0c0d0e=
225
> >> 100644
> >> --- a/drivers/staging/media/tegra-video/vi.h
> >> +++ b/drivers/staging/media/tegra-video/vi.h
> >> @@ -296,7 +296,7 @@ struct tegra_video_format {
> >>=20
> >>  	u32 fourcc;
> >> =20
> >>  };
> >>=20
> >> -#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> >> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC) ||
> >> defined(CONFIG_ARCH_TEGRA_3x_SOC)
> >>=20
> >>  extern const struct tegra_vi_soc tegra20_vi_soc;
> >>  #endif
> >>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> >>=20
> >> diff --git a/drivers/staging/media/tegra-video/video.c
> >> b/drivers/staging/media/tegra-video/video.c index
> >> 074ad0dc56ca..a25885f93cd7 100644
> >> --- a/drivers/staging/media/tegra-video/video.c
> >> +++ b/drivers/staging/media/tegra-video/video.c
> >> @@ -127,6 +127,10 @@ static const struct of_device_id
> >> host1x_video_subdevs[] =3D { { .compatible =3D "nvidia,tegra20-vip", }=
,
> >>=20
> >>  	{ .compatible =3D "nvidia,tegra20-vi", },
> >> =20
> >>  #endif
> >>=20
> >> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> >> +	{ .compatible =3D "nvidia,tegra30-vip", },
> >> +	{ .compatible =3D "nvidia,tegra30-vi", },
> >> +#endif
> >>=20
> >>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> >> =20
> >>  	{ .compatible =3D "nvidia,tegra210-csi", },
> >>  	{ .compatible =3D "nvidia,tegra210-vi", },
> >>=20
> >> diff --git a/drivers/staging/media/tegra-video/vip.c
> >> b/drivers/staging/media/tegra-video/vip.c index
> >> 5ec717f3afd5..00e08a9971d5
> >> 100644
> >> --- a/drivers/staging/media/tegra-video/vip.c
> >> +++ b/drivers/staging/media/tegra-video/vip.c
> >> @@ -263,13 +263,16 @@ static void tegra_vip_remove(struct platform_dev=
ice
> >> *pdev) pm_runtime_disable(&pdev->dev);
> >>=20
> >>  }
> >>=20
> >> -#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> >> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC) ||
> >> defined(CONFIG_ARCH_TEGRA_3x_SOC)
> >>=20
> >>  extern const struct tegra_vip_soc tegra20_vip_soc;
> >>  #endif
> >> =20
> >>  static const struct of_device_id tegra_vip_of_id_table[] =3D {
> >>  #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> >> =20
> >>  	{ .compatible =3D "nvidia,tegra20-vip", .data =3D &tegra20_vip_soc }=
,
> >>=20
> >> +#endif
> >> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> >> +	{ .compatible =3D "nvidia,tegra30-vip", .data =3D &tegra20_vip_soc }=
,
> >>=20
> >>  #endif
> >> =20
> >>  	{ }
> >> =20
> >>  };
> >
> >If tegra30-vip is compatible with tegra20-vip, we don't need to add the
> >compatible string into the driver. Just mark it as 'compatible =3D
> >"nvidia,tegra30-vip", "nvidia,tegra20-vip";' in the device tree (and as =
Rob
> >alluded, have this compat string pair as an option in the device tree
> >schema).
> While I am fine with using fallback but it may be a good idea to have a
> separate compatible so in case tegra30 would need a specific set of ops
> (tegra20 and tegra30 VIs are not exact match) no additional changes into
> schema would be required.

The standard practice is to use the compatible string fallback in device tr=
ee=20
when we believe the hardware to be compatible. If that later turns out not =
to=20
be the case (which should be unlikely), the schema can be adjusted along wi=
th=20
the source code changes.

> >Cheers,
> >Mikko




