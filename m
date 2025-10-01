Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5496BBAF1D0
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 07:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D1110E611;
	Wed,  1 Oct 2025 05:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ndU6o5xF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276B610E611
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 05:04:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMuXLBYS9wc+K4q2zDEGhLtDEjIrS5St1rbL7cMH8+Vvr98B0nq68jowL8du+GZOp1FCepdD6BlsC3JgsCvW/vRMBY8oiz4hB745+n6BguHM2gHPEvAkFTEuPerksbVOYYdxGI5uOYHPGiABTgU3WNz4jS8+J5gPRRgBNzYuMPB+hi2XrS7X08y1JvP4OjhUVnGH8mzkNQJY+6Js1iUJ0lEaK/DtVsXNTkCLCaZ5TOdQ6ZZ5MvbCUIOZQcOp6fqbiSjs/WWzWvHFZIDWjexhIWGO0W357YmuDY7HILHCCmhga6jwBy9owOYbe/N+aa2Vp/2aiKp2Z3IniQVgWvJ1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8qvfKxPfDVhKR9AYu9OQJbt5kG5g/Tmc5B5nPUQUsM=;
 b=FhLMAyMGR1V6ypqGnKKBB5RpFuQbSUCtyj5jIPT3bshphpt576jQO4QvlnidOFDgxFeJ+Fq1JR3OxBUHloA+k8CvlIn14CG8mvI9NaSvr9jbjjPsMRmF3AN5CUtovUz+WMLqov1YCuq2+kzlwvhLLElxMHeWMb58TsERuEaJBh9T/Bp5N0tMlQ7GhlsChAEUfru4G2gZJTTudzTjfh71VyTtHm/+h7PuaCGHV/4lP8AfZJnWm5Pnj2no/nXxcWsApD6fXWHf7cC63C4MJ0+1XiXbTYT6EssYPGPZaTSKg9Dx6A9CuoTGeZUDltU42hS6L6mxH6ElkmOUq7OnHl5zsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8qvfKxPfDVhKR9AYu9OQJbt5kG5g/Tmc5B5nPUQUsM=;
 b=ndU6o5xFLSFD2C/tM8HWxmmZnkZ8HGYGpjEsKZVpFZaWPtrLIrEqM5ysy9Ppwkpvku3muq2CKLPZKSm2agxq/CWRVP3J/B/L8xd0Ivp9BkEoDPzR6QA1CerYELkGyHwYL0nkcDR/TESkZy4kOvC/2QaY50NR388w0R0YxzaZT8ryWOuVwIPBdnZAfdz3jeSYJGPXIGnMsPYge+t+bojZ4vriOqNC6RQhsW4EHuoNE6/mNaq3PeHU4kz7IxCRAyFX/g8fh140fgkygkYwNruv6hJNwouaGKgnyWJrrMDmm+K3CQ3mLCDzRi5qDB4yqB/2ioIDMfMYfIcE+7qJsfhBMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Wed, 1 Oct
 2025 05:04:11 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 05:04:11 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 22/22] staging: media: tegra-video: add CSI support for
 Tegra20 and Tegra30
Date: Wed, 01 Oct 2025 14:04:07 +0900
Message-ID: <7265577.tM3a2QDmDi@senjougahara>
In-Reply-To: <20250925151648.79510-23-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <20250925151648.79510-23-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P301CA0059.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::12) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: f348fc6d-adbb-436d-d373-08de00a7f55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0dHTlpwSWJFV1o2TmJqdHdnMHhKdlBoQlhHNUpQZ0NXTlM5SVQ5eGVHd0to?=
 =?utf-8?B?SVpqUmxiSUg4S1NOK1d2a213VDFPbXpkdHZOQVRuaGZKRFMwU1pVVUNEMmVH?=
 =?utf-8?B?NXVvL1FDWVd5RlBiaU15VExOWXYvNlY1L0hXc2h0Q3RrT2dBRVcrL2tBS1No?=
 =?utf-8?B?cWZNUGVlSHVqVHFrMnNXeEZnWDdQYTl5b2sxUlgyMmVGdDR3UmE4VWw4Z2F0?=
 =?utf-8?B?NThKdGMyZCtwTDQxUmphZXg3ZDFQaGlUQlVLNGtwYjF6ZWhyNWsxSW1pMzFU?=
 =?utf-8?B?NVNJc3BJNFNHdEVLOWtvMU44RCtETlFhd0tPSS96NW5YR3hLdlNpVERvVXRT?=
 =?utf-8?B?eHpXa3RmbHZtWW1xR0ZyWmJjRE92Q2huWGdOMlNmVWtXNjNueFVsVlJQeCtu?=
 =?utf-8?B?Vmgzb0tLR3BtT0ZJdExWMnBnTDFhWHFQcjdSQ3lwSWk5Z1BoWTV2cEczblVG?=
 =?utf-8?B?R2ZEMTBSeUFUVGxMWUV5OFgxSkNodHJUQkdoaDhxQW50Y2t1Zzh0cXltdTZj?=
 =?utf-8?B?MHFEQ2JCck1mVlczaDBGYnV6a1MwNkt4WHl4ditFdndyWVNpUEkvUkxaV2l1?=
 =?utf-8?B?U1Ira241M2dBZmc3TUtIaEtnVHpSMDNic3gydUw4MXpORGRCWlV3NGFyV0g4?=
 =?utf-8?B?VGdKYTAwcklXdmFLZWN6ekFaSjZDamdjUzBEeXcwWnIwbWVONFU2VlprWDMr?=
 =?utf-8?B?ZnpBVHg5MU5UN2FNRlcrRUF6bkdnQWhIc0JFbzJYSnBIRExBOUhRNm9FcG5l?=
 =?utf-8?B?bGhWcHNsU1dYTmIxUkhwV1lyd2dKaUdPSDJ5T3Z5aWx6dmo4aGhHUVdBMitS?=
 =?utf-8?B?WUluQ1ZzZ3NSdmlDYzB5MnNJOGVDVFZINFNDN2YxWmgvWFJ4Q2pWWTFtdUEz?=
 =?utf-8?B?SC9WenAvekJwQjNtaCtyeGg0VE1SYTFqTDBRazlBaE0rSmVrMU8wa3NLWGp1?=
 =?utf-8?B?ODFVZFlna3FsMDN5ZmYyR1lISTVOQWhqeUFvT0xJV1FrdklETkF3Z0ovb09W?=
 =?utf-8?B?bG9HVFkyeDA4OENyYU8zc0pMUy9aUEVNOG52cGs3azZKdmt3aHRYMVpPdGtU?=
 =?utf-8?B?My9wVGdON1U0eERNMkt2cmlJSVBCSEhnaVlMYkpYcWdsZ1czVWo4TllLUzVF?=
 =?utf-8?B?YWo3SXZBL1NlOTI4VjJOeGxHNnc5S1hualZBU2xZaWZONUt1Q1N0a095Nm5Q?=
 =?utf-8?B?Q3hVdGlsN3pPckhPanlzVlk0OUlCVkY3NmozWHdvSkdaRzFnSms0c2VKMW1i?=
 =?utf-8?B?Z1BjZ0krdzJ2WE5LWnRBWE5kZ2VkOTBLOWptVVp5RDZQeVZ6VlIwajNUTkV0?=
 =?utf-8?B?dXNYYnFDTkJHMld4VXVab1B3OGdQWjluTE1oNTV2bXMzdFloSTBRQ2JQa3JR?=
 =?utf-8?B?bUpWNGU3bWdPOFZyUXQ1VzlveGlNSjJVMWcrNFlMbHZXeFNoRGpqYkoxdjd2?=
 =?utf-8?B?MHovZEp6Z3dOVUpESWErMEViNnRkeFRkcU5TZzNrL3M4a1FDVjhpTXlFYm5j?=
 =?utf-8?B?VEM4aG92dTdmbEY0WURKZGFteUdObWtpK1pqVncwVHJNTmxtQkRlcGdIelBY?=
 =?utf-8?B?QmdHMU93QUphMStUR3RnSWRwbGlSdGFLazA5ako1c3A2MGswUkxFaHM2L0p0?=
 =?utf-8?B?QUFkWXorKzJhRDhoM1R4cU9vRm96MTRKT1lsdTcyTlBoeEx1L3RoOEZPQkx4?=
 =?utf-8?B?SmRmTUh6M1hiQVoxc0RuaGZHb3p4cUpqaVFnSlFmYlB3UkN0VWo4TU5PcGs1?=
 =?utf-8?B?SmRvS2tyYWtSSG9NbDJ4TUxZZEdldlVUUjU3azBpTExPT1c4Z0lKZDlVWHAy?=
 =?utf-8?B?dW9EalE4UzZQRndMUENzN2N6a2RqOXBUTW9ldjd6YmxlOG5WSTlaYjA4SEFr?=
 =?utf-8?B?NlpVQ3VJWDFzZXUra0x4R0w4UGcyL0xvY3k1Zmtwem1LeW9tN2hGeTBxbTBp?=
 =?utf-8?B?NElsUXRtWlh0eVFXeGdZc25HdXMwUVpvbk9LbVZKNVpzV1FXZVc4c3VGOGlm?=
 =?utf-8?Q?Yu4oeOx9PJQ+ceTrqBNdWG+ncPF2no=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUlSOU1lV3NoOUg3dXBrOFlWbyt0eGJiWDRzTVlmVDZjakxnbHgvTWR5dGZn?=
 =?utf-8?B?Tm5qdXdDQ25wWWNiYnJiek5OaU1qYXJYMmgrU2IrNWlUYSt0S1NUaWVSTnBF?=
 =?utf-8?B?RDcxOGczS0swT2pKUXk5ZVpnZTNOcTFsTitGbkRMQk5ES015S08xNWFOblpB?=
 =?utf-8?B?VEp5RXRHeDV1cHVONFpQbytVL1ZZUUhHVTUyMTZHZ3p6UWFRU0wwKzV1NC8z?=
 =?utf-8?B?WWF0eVNsOUh3TTh5MjNxc0lwbGtEM3hmbUx6ZU13RURpaEp0aGNEdkU5RGo1?=
 =?utf-8?B?VlV6VVVYQVRURXNNaTRnRXlFaVk1ZVVMek8vNVdKdDlqZjJJT0l3Ykk2WWli?=
 =?utf-8?B?bkN1ajlnRmZ0dllhblZXTXdQOWloNjBxWlhXL0NkYThMZEQvM0VYYkwwYkhP?=
 =?utf-8?B?enkrRjBkZFVsS1pLREp5TGVkbytSczZSUkpFcE5qM0dUNlpPMjFEOVg5cEdy?=
 =?utf-8?B?RlF1cncvUzBiTTBXTzdrTmEydUMrSTR0NkhuTTA5TE5uOXo5RGVoUkFxVzM5?=
 =?utf-8?B?YllsV1lBeGN0VG9Db2YvMnovU2R3N3krNi9Vdm8yZWFmRFlIWkxMVmlHWlhi?=
 =?utf-8?B?M01hK3EydzNiOS8vayszSFNpQlBJUE0rSFNjRWJQajFUT20vbVgwU2FYQTVs?=
 =?utf-8?B?N1BFVS9UbG42QkF2ak90eVVjSEwzUmZ6YkpZbzNvUXRhZkNFdHhSRldKT0M2?=
 =?utf-8?B?bFhMRHJxTE5CVzVCak03NVlvVnkvaWVvTFBRN2g5TzdvRmJ5UWpUeU5xSjRV?=
 =?utf-8?B?OHkxT0FJWXJldDlodFhkNk5EM0hGcVlBdEV3aW9maWtpeFVVK0RIYy9VMDEv?=
 =?utf-8?B?YXZkbEh6SllMbUdyZHlIbnpYTzZ2aWl1eFE2OEZhMktFZ2EzRmNGK3EwN1JQ?=
 =?utf-8?B?amxRK0ZWRzE1alZwV2tpVEtFNitnNm9oL3hUbkVsTzFvT0lTUEEreFljS056?=
 =?utf-8?B?anhwV2I3cUpBalVhWU5HWXdpRjlWOW1LWGwydjJ5TDBDaDk5cXMwa2N6NmpD?=
 =?utf-8?B?ZDcxTjRRei9GMjA4WForR0grQktEQmQ1VTZlRWRFV0pCQTQwcDRIMFBGQWcz?=
 =?utf-8?B?WWh1SWRJL3pHc1h1ZW01UHBkT213ang4b3NTaURHVFdTWDhMY3JJNEtCcFpn?=
 =?utf-8?B?TXJyK09UaDhtZ1Nvd2tPUkdOd0lpTDBXVGozY3cvMjgzdjFiejBWQkN1MndK?=
 =?utf-8?B?Kzg4Z01DZFowVTlhSWdGdkE1VjVrVmw2azJ2RDBEMmR3QVRUYXlLVW5YdUdN?=
 =?utf-8?B?aHNGdnVZeVR4cmk3TUtDdEY1TnhlZjVVdmJRdVk2akZwK1dpOFVScUltelM1?=
 =?utf-8?B?NmxIOUc4Zk4xTGNzRTB0MDltK1ZJV2J5T2hRb2UxL3A3Tks1bGQzbXA4bFZr?=
 =?utf-8?B?Tkd5NzdmTUVJT3Y1QUlyMWJMNWw0UVNGamRGTWdmYjRvZEt3UmtCY2NOVUla?=
 =?utf-8?B?VzFkM25PZyt0VlE1NHJRM3ExMGhjbjBsTlp0dlMwSjhINHpLcWtGTmF0b0tS?=
 =?utf-8?B?VHozaWtuaGFWemIyOEZqcHBQNk1tMDYzaE1YSUhjaWxHME0vNzJ4RDN1RGpW?=
 =?utf-8?B?aitjNG1aU000OGRZbHBEVUtNc3pWZkRPME1KZlRzOXU1WmcwN1lWd1lvTE5X?=
 =?utf-8?B?Znc3bEtvMEkzaGVIallxQUZJVkd0dzhkaGFKTTBQWDlBRW1TdEwwbHNzOFhV?=
 =?utf-8?B?TElYVkZTL1hXOG9DYnphR08rb0t5TjdkZnFCUHlyVFNYc1ZueCt6UFJkUzZH?=
 =?utf-8?B?eDk5QmNRRjNXZUZYdzZrcTdsY2FiRmNDSUNXZk5WcWU0MkMzZmx3OFhNNzFP?=
 =?utf-8?B?cU82Z0J6d2pobzQ1YXMvekhDMmhKSEdnSXVRS0d4cXFsemxSUVhIUzZiTVZz?=
 =?utf-8?B?bSt0aUhidSt6YVFZNlg5bWhmMjIvWW56SStVeEhZN0tEVG96cnJYaitQN3VQ?=
 =?utf-8?B?ZHhQc2JFWW5kNWtaelN4d1hSVWZUdUpyaEFITlh2MDZpVjAzaXk4OVRqZVRk?=
 =?utf-8?B?UmdKaW54OWplOWE4RGlsTnBsNzNzU3B5ZHRDNXVYR2xmK2RCUkpZMlNqaFpH?=
 =?utf-8?B?eDRzSEM3ZXRIRHp3TTVtcGFxOVJ6UHB3RkUzUDUxK0JoTVJvbzQ5Q3pJVjZs?=
 =?utf-8?B?NlB6c1Yrem1ib1lpNVh3eTZzRVJlZmdpd3lZd203L095ZFlWU2IyYzdjQUxz?=
 =?utf-8?B?N2VCZG1Sa2p2ZFVodU5TOHdyZUNka2FQTkVxWXJna1dFTWU0NFA0SU1QVElt?=
 =?utf-8?B?WjVYc05IbGY4TDhpaGVTZysvNVBnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f348fc6d-adbb-436d-d373-08de00a7f55f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 05:04:11.2831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDiZ7uDxcKNxxobRX58p6aHaeNVS0Jx4uwNiPkuJ+kRxZh3bznov12Mx6i5X7YsBkwRNBtNN2XxmQzIRebvtEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375
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

On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device and calibration logic found in Tegra20 an=
d
> Tegra30 SoC.
>=20
> To get CSI operational, an additional syncpoint was allocated to serve as
> the CSI frame counter. Both VIP and CSI use an existing syncpoint for VI
> frame start events. That said, the frame capture function was refactored
> to reflect the addition of the CSI syncpoint, and the CSI-specific
> configuration is guarded by the presence of a passed CSI channel structur=
e
> pointer.
>=20
> The camera capture setup's configuration was reconsidered: the first two
> writes must be done before tegra_channel_set_stream for MIPI calibration
> to work properly; the third write was moved to VIP/CSI-specific functions
> since it must be source-specific; the function was placed after
> tegra_channel_set_stream so the initial sequence is preserved and expande=
d.
>=20
> CSI configuration sequences were added based on downstream 3.1 kernel
> sources and adjusted to the existing video-tegra framework. Although
> Tegra20 and Tegra30 have the same set of configurations, they differ by
> the number of clocks used by CSI.
>=20
> Dropped the software syncpoint counters in favor of reading syncpoints
> directly and passing the incremented value to the polling function. If th=
e
> syncpoint increase fails, the PP is reset. This change should prevent
> possible race conditions.
>=20
> MIPI calibration logic was registered in CSI since Tegra20 and Tegra30
> have no dedicated hardware block for these operations and use CSI. These
> calls are used for both CSI and DSI to work properly, which is why MIPI
> calibration cannot be contained within CSI. The pads passed to the
> calibration calls resemble CSI PORT_A (0), CSI PORT_B (1), DSI-A (3) and
> DSI-B (4).
>=20
> Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/csi.c     |  19 +
>  drivers/staging/media/tegra-video/csi.h     |   4 +
>  drivers/staging/media/tegra-video/tegra20.c | 608 ++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h      |   2 -
>  drivers/staging/media/tegra-video/video.c   |   6 +
>  5 files changed, 592 insertions(+), 47 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/me=
dia/tegra-video/csi.c
> index 7d70478a07aa..92ee4c84a988 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -827,6 +827,13 @@ static int tegra_csi_probe(struct platform_device *p=
dev)
> =20
>  	csi->dev =3D &pdev->dev;
>  	csi->ops =3D csi->soc->ops;
> +
> +	if (csi->soc->mipi_ops)
> +		tegra_mipi_add_provider(pdev->dev.of_node,
> +					csi->soc->mipi_ops);

Error handling should be added. Also, I realize that we should have a tegra=
_mipi_remove_provider to call if the probe fails after this or at CSI devic=
e removal. Since tegra_mipi_request refcounts the platform device, AIUI the=
 CSI device cannot be unbound while it has users, so we don't need to worry=
 about the CSI device being removed while there are active users.

> +
> +	mutex_init(&csi->mipi_lock);
> +
>  	platform_set_drvdata(pdev, csi);
>  	pm_runtime_enable(&pdev->dev);
> =20
> @@ -858,11 +865,23 @@ static void tegra_csi_remove(struct platform_device=
 *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
> =20
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +extern const struct tegra_csi_soc tegra20_csi_soc;
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +extern const struct tegra_csi_soc tegra30_csi_soc;
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  extern const struct tegra_csi_soc tegra210_csi_soc;
>  #endif
> =20
>  static const struct of_device_id tegra_csi_of_id_table[] =3D {
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +	{ .compatible =3D "nvidia,tegra20-csi", .data =3D &tegra20_csi_soc },
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +	{ .compatible =3D "nvidia,tegra30-csi", .data =3D &tegra30_csi_soc },
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  	{ .compatible =3D "nvidia,tegra210-csi", .data =3D &tegra210_csi_soc },
>  #endif
> diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/me=
dia/tegra-video/csi.h
> index 1550defb115a..422f30655945 100644
> --- a/drivers/staging/media/tegra-video/csi.h
> +++ b/drivers/staging/media/tegra-video/csi.h
> @@ -115,6 +115,7 @@ struct tegra_csi_ops {
>   * struct tegra_csi_soc - NVIDIA Tegra CSI SoC structure
>   *
>   * @ops: csi hardware operations
> + * @mipi_ops: MIPI calibration operations
>   * @csi_max_channels: supported max streaming channels
>   * @clk_names: csi and cil clock names
>   * @num_clks: total clocks count
> @@ -123,6 +124,7 @@ struct tegra_csi_ops {
>   */
>  struct tegra_csi_soc {
>  	const struct tegra_csi_ops *ops;
> +	const struct tegra_mipi_ops *mipi_ops;
>  	unsigned int csi_max_channels;
>  	const char * const *clk_names;
>  	unsigned int num_clks;
> @@ -140,6 +142,7 @@ struct tegra_csi_soc {
>   * @vdd: vdd regulator for CSI hardware, usually avdd_dsi_csi
>   * @soc: pointer to SoC data structure
>   * @ops: csi operations
> + * @mipi_lock: for MIPI calibration operations
>   * @csi_chans: list head for CSI channels
>   */
>  struct tegra_csi {
> @@ -150,6 +153,7 @@ struct tegra_csi {
>  	struct regulator *vdd;
>  	const struct tegra_csi_soc *soc;
>  	const struct tegra_csi_ops *ops;
> +	struct mutex mipi_lock;
>  	struct list_head csi_chans;
>  };
> =20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index 8c9655ffa886..d99a04fa25af 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -4,6 +4,9 @@
>   *
>   * Copyright (C) 2023 SKIDATA GmbH
>   * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> + *
> + * Copyright (c) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
> + * Copyright (c) 2025 Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
>   */
> =20
>  /*
> @@ -12,10 +15,15 @@
>   */
> =20
>  #include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk/tegra.h>
>  #include <linux/delay.h>
>  #include <linux/host1x.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/kthread.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/tegra-mipi-cal.h>
>  #include <linux/v4l2-mediabus.h>
> =20
>  #include "vip.h"
> @@ -42,6 +50,9 @@ enum tegra_vi_out {
>  #define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT	BIT(8)
>  #define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT		0
> =20
> +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(n)	(0x0070 + (n) * 8)
> +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_END(n)	(0x0074 + (n) * 8)
> +
>  #define TEGRA_VI_VI_INPUT_CONTROL			0x0088
>  #define       VI_INPUT_FIELD_DETECT			BIT(27)
>  #define       VI_INPUT_BT656				BIT(25)
> @@ -88,6 +99,8 @@ enum tegra_vi_out {
>  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST	(3 << VI_OUTPUT_OUTPUT_=
FORMAT_SFT)
>  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR	(6 << VI_OUTPUT_OUTPU=
T_FORMAT_SFT)
>  /* TEGRA_VI_OUT_2 supported formats */
> +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER	(7 << VI_OUTPUT_OUTP=
UT_FORMAT_SFT)
> +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER	(8 << VI_OUTPUT_OUTP=
UT_FORMAT_SFT)
>  #define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT	(9 << VI_OUTPUT_O=
UTPUT_FORMAT_SFT)
> =20
>  #define TEGRA_VI_VIP_H_ACTIVE				0x00a4
> @@ -152,8 +165,106 @@ enum tegra_vi_out {
>  #define TEGRA_VI_VI_RAISE				0x01ac
>  #define       VI_VI_RAISE_ON_EDGE			BIT(0)
> =20
> +#define TEGRA_VI_CSI_PP_RAISE_FRAME_START(n)		(0x01d8 + (n) * 8)
> +#define TEGRA_VI_CSI_PP_RAISE_FRAME_END(n)		(0x01dc + (n) * 8)
> +#define TEGRA_VI_CSI_PP_H_ACTIVE(n)			(0x01e8 + (n) * 8)
> +#define TEGRA_VI_CSI_PP_V_ACTIVE(n)			(0x01ec + (n) * 8)
> +
> +/* Tegra20 CSI registers: Starts from 0x800, offset 0x0 */
> +#define TEGRA_CSI_VI_INPUT_STREAM_CONTROL		0x0000
> +#define TEGRA_CSI_HOST_INPUT_STREAM_CONTROL		0x0008
> +#define TEGRA_CSI_INPUT_STREAM_CONTROL(n)		(0x0010 + (n) * 0x2c)
> +#define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
> +#define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
> +#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
> +#define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
> +#define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
> +#define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
> +#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
> +#define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
> +#define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
> +#define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
> +#define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
> +#define       CSI_PP_DATA_TYPE(n)			((n) << 8)
> +#define       CSI_PP_CRC_CHECK_ENABLE			BIT(7)
> +#define       CSI_PP_WORD_COUNT_HEADER			BIT(6)
> +#define       CSI_PP_DATA_IDENTIFIER_ENABLE		BIT(5)
> +#define       CSI_PP_PACKET_HEADER_SENT			BIT(4)
> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL1(n)		(0x001c + (n) * 0x2c)
> +#define TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(n)		(0x0020 + (n) * 0x2c)
> +#define TEGRA_CSI_PIXEL_STREAM_GAP(n)			(0x0024 + (n) * 0x2c)
> +#define       CSI_PP_FRAME_MIN_GAP(n)			(((n) & 0xffff) << 16)
> +#define       CSI_PP_LINE_MIN_GAP(n)			(((n) & 0xffff))
> +#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(n)		(0x0028 + (n) * 0x2c)
> +#define       CSI_PP_START_MARKER_FRAME_MAX(n)		(((n) & 0xf) << 12)
> +#define       CSI_PP_START_MARKER_FRAME_MIN(n)		(((n) & 0xf) << 8)
> +#define       CSI_PP_VSYNC_START_MARKER			BIT(4)
> +#define       CSI_PP_SINGLE_SHOT			BIT(2)
> +#define       CSI_PP_NOP				0
> +#define       CSI_PP_ENABLE				1
> +#define       CSI_PP_DISABLE				2
> +#define       CSI_PP_RESET				3
> +#define TEGRA_CSI_PHY_CIL_COMMAND			0x0068
> +#define       CSI_A_PHY_CIL_NOP				0x0
> +#define       CSI_A_PHY_CIL_ENABLE			0x1
> +#define       CSI_A_PHY_CIL_DISABLE			0x2
> +#define       CSI_A_PHY_CIL_ENABLE_MASK			0x3
> +#define       CSI_B_PHY_CIL_NOP				(0x0 << 16)
> +#define       CSI_B_PHY_CIL_ENABLE			(0x1 << 16)
> +#define       CSI_B_PHY_CIL_DISABLE			(0x2 << 16)
> +#define       CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 16)
> +#define TEGRA_CSI_PHY_CIL_CONTROL0(n)			(0x006c + (n) * 4)
> +#define       CSI_CONTINUOUS_CLOCK_MODE_ENABLE		BIT(5)
> +#define TEGRA_CSI_CSI_PIXEL_PARSER_STATUS		0x0078
> +#define TEGRA_CSI_CSI_CIL_STATUS			0x007c
> +#define       CSI_MIPI_AUTO_CAL_DONE			BIT(15)
> +#define TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK	0x0080
> +#define TEGRA_CSI_CSI_CIL_INTERRUPT_MASK		0x0084
> +#define TEGRA_CSI_CSI_READONLY_STATUS			0x0088
> +#define TEGRA_CSI_ESCAPE_MODE_COMMAND			0x008c
> +#define TEGRA_CSI_ESCAPE_MODE_DATA			0x0090
> +#define TEGRA_CSI_CIL_PAD_CONFIG0(n)			(0x0094 + (n) * 8)
> +#define TEGRA_CSI_CIL_PAD_CONFIG1(n)			(0x0098 + (n) * 8)
> +#define TEGRA_CSI_CIL_PAD_CONFIG			0x00a4
> +#define TEGRA_CSI_CILA_MIPI_CAL_CONFIG			0x00a8
> +#define TEGRA_CSI_CILB_MIPI_CAL_CONFIG			0x00ac
> +#define       CSI_CIL_MIPI_CAL_STARTCAL			BIT(31)
> +#define       CSI_CIL_MIPI_CAL_OVERIDE_A		BIT(30)
> +#define       CSI_CIL_MIPI_CAL_OVERIDE_B		BIT(30)
> +#define       CSI_CIL_MIPI_CAL_NOISE_FLT(n)		(((n) & 0xf) << 26)
> +#define       CSI_CIL_MIPI_CAL_PRESCALE(n)		(((n) & 0x3) << 24)
> +#define       CSI_CIL_MIPI_CAL_SEL_A			BIT(21)
> +#define       CSI_CIL_MIPI_CAL_SEL_B			BIT(21)
> +#define       CSI_CIL_MIPI_CAL_HSPDOS(n)		(((n) & 0x1f) << 16)
> +#define       CSI_CIL_MIPI_CAL_HSPUOS(n)		(((n) & 0x1f) << 8)
> +#define       CSI_CIL_MIPI_CAL_TERMOS(n)		(((n) & 0x1f))
> +#define TEGRA_CSI_CIL_MIPI_CAL_STATUS			0x00b0
> +#define TEGRA_CSI_CLKEN_OVERRIDE			0x00b4
> +#define TEGRA_CSI_DEBUG_CONTROL				0x00b8
> +#define       CSI_DEBUG_CONTROL_DEBUG_EN_ENABLED	BIT(0)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0		BIT(4)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1		BIT(5)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2		BIT(6)
> +#define       CSI_DEBUG_CONTROL_DBG_CNT_SEL(n, v)	((v) << (8 + 8 * (n)))
> +#define TEGRA_CSI_DEBUG_COUNTER(n)			(0x00bc + (n) * 4)
> +#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(n)	(0x00c8 + (n) * 4)
> +#define       CSI_PP_EXP_FRAME_HEIGHT(n)		(((n) & 0x1fff) << 16)
> +#define       CSI_PP_MAX_CLOCKS(n)			(((n) & 0xfff) << 4)
> +#define       CSI_PP_LINE_TIMEOUT_ENABLE		BIT(0)
> +#define TEGRA_CSI_DSI_MIPI_CAL_CONFIG			0x00d0
> +#define TEGRA_CSI_MIPIBIAS_PAD_CONFIG			0x00d4
> +#define       CSI_PAD_DRIV_DN_REF(n)			(((n) & 0x7) << 16)
> +#define       CSI_PAD_DRIV_UP_REF(n)			(((n) & 0x7) << 8)
> +#define       CSI_PAD_TERM_REF(n)			(((n) & 0x7) << 0)
> +#define TEGRA_CSI_CSI_CILA_STATUS			0x00d8
> +#define TEGRA_CSI_CSI_CILB_STATUS			0x00dc
> +
>  /* ---------------------------------------------------------------------=
-----
> - * VI
> + * Read and Write helpers
>   */
> =20
>  static void tegra20_vi_write(struct tegra_vi_channel *chan, unsigned int=
 addr, u32 val)
> @@ -161,6 +272,35 @@ static void tegra20_vi_write(struct tegra_vi_channel=
 *chan, unsigned int addr, u
>  	writel(val, chan->vi->iomem + addr);
>  }
> =20
> +static int __maybe_unused tegra20_vi_read(struct tegra_vi_channel *chan,=
 unsigned int addr)
> +{
> +	return readl(chan->vi->iomem + addr);
> +}
> +
> +static void tegra20_csi_write(struct tegra_csi_channel *csi_chan, unsign=
ed int addr, u32 val)
> +{
> +	writel(val, csi_chan->csi->iomem + addr);
> +}
> +
> +static int __maybe_unused tegra20_csi_read(struct tegra_csi_channel *csi=
_chan, unsigned int addr)
> +{
> +	return readl(csi_chan->csi->iomem + addr);
> +}
> +
> +static void tegra20_mipi_write(struct tegra_csi *csi, unsigned int addr,=
 u32 val)
> +{
> +	writel(val, csi->iomem + addr);
> +}
> +
> +static int __maybe_unused tegra20_mipi_read(struct tegra_csi *csi, unsig=
ned int addr)
> +{
> +	return readl(csi->iomem + addr);
> +}
> +
> +/* ---------------------------------------------------------------------=
-----
> + * VI
> + */
> +
>  /*
>   * Get the main input format (YUV/RGB...) and the YUV variant as values =
to
>   * be written into registers for the current VI input mbus code.
> @@ -283,20 +423,27 @@ static int tegra20_vi_enable(struct tegra_vi *vi, b=
ool on)
>  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *c=
han)
>  {
>  	struct tegra_vi *vi =3D chan->vi;
> -	struct host1x_syncpt *out_sp;
> +	struct host1x_syncpt *out_sp, *fs_sp;
> =20
>  	out_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANA=
GED);
>  	if (!out_sp)
> -		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n"=
);
> +		return dev_err_probe(vi->dev, -EBUSY, "failed to request mw ack syncpo=
int\n");
> =20
>  	chan->mw_ack_sp[0] =3D out_sp;
> =20
> +	fs_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAG=
ED);
> +	if (!fs_sp)
> +		return dev_err_probe(vi->dev, -EBUSY, "failed to request frame start s=
yncpoint\n");
> +
> +	chan->frame_start_sp[0] =3D fs_sp;
> +
>  	return 0;
>  }
> =20
>  static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_channel *=
chan)
>  {
>  	host1x_syncpt_put(chan->mw_ack_sp[0]);
> +	host1x_syncpt_put(chan->frame_start_sp[0]);
>  }
> =20
>  static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int =
bpp)
> @@ -418,41 +565,79 @@ static void tegra20_channel_vi_buffer_setup(struct =
tegra_vi_channel *chan,
>  }
> =20
>  static int tegra20_channel_capture_frame(struct tegra_vi_channel *chan,
> -					 struct tegra_channel_buffer *buf)
> +					 struct tegra_channel_buffer *buf,
> +					 struct tegra_csi_channel *csi_chan)
>  {
> +	u32 val;
>  	int err;
> =20
> -	chan->next_out_sp_idx++;
> -
>  	tegra20_channel_vi_buffer_setup(chan, buf);
> =20
> -	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_E=
NABLE);
> +	if (csi_chan) {
> +		u32 port =3D csi_chan->csi_port_nums[0] & 1;
> +
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +				  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +				  CSI_PP_SINGLE_SHOT | CSI_PP_ENABLE);
> +
> +		val =3D host1x_syncpt_read(chan->frame_start_sp[0]);
> +		do {
> +			err =3D host1x_syncpt_wait(chan->frame_start_sp[0],
> +						 val + 1, TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
> +		} while (err =3D=3D -ERESTARTSYS);

This function is called only from a kthread, so I don't think it's possible=
 for any functions to return -ERESTARTSYS. Have you seen otherwise? (Anyway=
, it it were possible, we should add a parameter to host1x_syncpt_wait to s=
pecify whether the wait should be interruptible or not, instead of working =
around it)

> +
> +		if (err) {
> +			if (err !=3D -ERESTARTSYS)
> +				dev_err_ratelimited(&chan->video.dev,
> +						    "frame start syncpt timeout: %d\n", err);
> +
> +			tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +					  CSI_PP_START_MARKER_FRAME_MAX(0xf) | CSI_PP_RESET);
> +			goto exit;
> +		}
> +
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +				  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +				  CSI_PP_DISABLE);
> +	} else {
> +		tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_=
ENABLE);
> +	}
> +
> +	val =3D host1x_syncpt_read(chan->mw_ack_sp[0]);
> +	do {
> +		err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], val + 1,
> +					 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
> +	} while (err =3D=3D -ERESTARTSYS);
> =20
> -	/* Wait for syncpt counter to reach frame start event threshold */
> -	err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], chan->next_out_sp_idx,
> -				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
>  	if (err) {
> -		host1x_syncpt_incr(chan->mw_ack_sp[0]);
> -		dev_err_ratelimited(&chan->video.dev, "frame start syncpt timeout: %d\=
n", err);
> -		release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
> -		return err;
> +		if (err !=3D -ERESTARTSYS)
> +			dev_err_ratelimited(&chan->video.dev, "mw ack syncpt timeout: %d\n", =
err);
> +		goto exit;
>  	}
> =20
> -	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> -			 VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTROL_VIP_ENABLE);
> +	if (!csi_chan)
> +		tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> +				 VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTROL_VIP_ENABLE);
> =20
> +exit:
>  	release_buffer(chan, buf, VB2_BUF_STATE_DONE);
> =20
> -	return 0;
> +	return err;
>  }
> =20
>  static int tegra20_chan_capture_kthread_start(void *data)
>  {
>  	struct tegra_vi_channel *chan =3D data;
>  	struct tegra_channel_buffer *buf;
> +	struct v4l2_subdev *csi_subdev =3D NULL;
> +	struct tegra_csi_channel *csi_chan =3D NULL;
>  	unsigned int retries =3D 0;
>  	int err =3D 0;
> =20
> +	csi_subdev =3D tegra_channel_get_remote_csi_subdev(chan);
> +	if (csi_subdev)
> +		csi_chan =3D to_csi_chan(csi_subdev);
> +
>  	while (1) {
>  		/*
>  		 * Source is not streaming if error is non-zero.
> @@ -477,7 +662,7 @@ static int tegra20_chan_capture_kthread_start(void *d=
ata)
>  		list_del_init(&buf->queue);
>  		spin_unlock(&chan->start_lock);
> =20
> -		err =3D tegra20_channel_capture_frame(chan, buf);
> +		err =3D tegra20_channel_capture_frame(chan, buf, csi_chan);
>  		if (!err) {
>  			retries =3D 0;
>  			continue;
> @@ -504,28 +689,6 @@ static void tegra20_camera_capture_setup(struct tegr=
a_vi_channel *chan)
>  	enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_R=
AW8 ||
>  					    data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
>  					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
> -	int main_output_format;
> -	int yuv_output_format;
> -
> -	tegra20_vi_get_output_formats(chan, &main_output_format, &yuv_output_fo=
rmat);
> -
> -	/*
> -	 * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
> -	 * for luminance, which is the default and means not to touch
> -	 * anything.
> -	 */
> -	tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> -			 0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> -			 0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> -
> -	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
> -	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> -
> -	tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> -			 (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> -			 (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> -			 yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT |
> -			 main_output_format << VI_OUTPUT_OUTPUT_FORMAT_SFT);
> =20
>  	/* Set up frame size */
>  	tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channel),
> @@ -556,18 +719,28 @@ static int tegra20_vi_start_streaming(struct vb2_qu=
eue *vq, u32 count)
>  	struct media_pipeline *pipe =3D &chan->video.pipe;
>  	int err;
> =20
> -	chan->next_out_sp_idx =3D host1x_syncpt_read(chan->mw_ack_sp[0]);
> -
>  	err =3D video_device_pipeline_start(&chan->video, pipe);
>  	if (err)
>  		goto error_pipeline_start;
> =20
> -	tegra20_camera_capture_setup(chan);
> +	/*
> +	 * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
> +	 * for luminance, which is the default and means not to touch
> +	 * anything.
> +	 */
> +	tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> +			 0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> +			 0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> +
> +	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
> +	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> =20
>  	err =3D tegra_channel_set_stream(chan, true);
>  	if (err)
>  		goto error_set_stream;
> =20
> +	tegra20_camera_capture_setup(chan);
> +
>  	chan->sequence =3D 0;
> =20
>  	chan->kthread_start_capture =3D kthread_run(tegra20_chan_capture_kthrea=
d_start,
> @@ -662,6 +835,345 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
>  	.has_h_v_flip =3D true,
>  };
> =20
> +/* ---------------------------------------------------------------------=
-----
> + * MIPI Calibration
> + */
> +static int tegra20_start_pad_calibration(struct tegra_mipi_device *mipi)
> +{
> +	struct tegra_csi *csi =3D platform_get_drvdata(mipi->pdev);
> +	unsigned int port =3D mipi->pads;
> +	u32 value;
> +	int ret;
> +
> +	guard(mutex)(&csi->mipi_lock);
> +
> +	ret =3D pm_runtime_resume_and_get(csi->dev);
> +	if (ret < 0) {
> +		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
> +		return ret;
> +	}
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_DSI_MIPI_CAL_CONFIG,
> +			   CSI_CIL_MIPI_CAL_HSPDOS(4) |
> +			   CSI_CIL_MIPI_CAL_HSPUOS(3) |
> +			   CSI_CIL_MIPI_CAL_TERMOS(0));
> +	tegra20_mipi_write(csi, TEGRA_CSI_MIPIBIAS_PAD_CONFIG,
> +			   CSI_PAD_DRIV_DN_REF(5) |
> +			   CSI_PAD_DRIV_UP_REF(7) |
> +			   CSI_PAD_TERM_REF(0));
> +
> +	/* CSI B */
> +	value =3D CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +		CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +		CSI_CIL_MIPI_CAL_TERMOS(4);
> +
> +	if (port =3D=3D PORT_B)
> +		value |=3D CSI_CIL_MIPI_CAL_SEL_B;
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG, value);
> +
> +	/* CSI A */
> +	value =3D CSI_CIL_MIPI_CAL_STARTCAL |
> +		CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> +		CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> +		CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +		CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +		CSI_CIL_MIPI_CAL_TERMOS(4);
> +
> +	if (port =3D=3D PORT_A)
> +		value |=3D CSI_CIL_MIPI_CAL_SEL_A;
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG, value);
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> +
> +	return 0;
> +}
> +
> +static int tegra20_finish_pad_calibration(struct tegra_mipi_device *mipi=
)
> +{
> +	struct tegra_csi *csi =3D platform_get_drvdata(mipi->pdev);
> +	void __iomem *cil_status_reg =3D csi->iomem + TEGRA_CSI_CSI_CIL_STATUS;
> +	unsigned int port =3D mipi->pads;
> +	u32 value, pp =3D 0, cil =3D 0;
> +	int ret;
> +
> +	/* This part is only for CSI */
> +	if (port > PORT_B) {
> +		pm_runtime_put(csi->dev);
> +
> +		return 0;
> +	}
> +
> +	guard(mutex)(&csi->mipi_lock);
> +
> +	ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> +					 value & CSI_MIPI_AUTO_CAL_DONE, 50, 250000);
> +	if (ret < 0) {
> +		dev_warn(csi->dev, "MIPI calibration timeout!\n");
> +		goto exit;
> +	}
> +
> +	/* clear status */
> +	tegra20_mipi_write(csi, TEGRA_CSI_CSI_CIL_STATUS, value);
> +	ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> +					 !(value & CSI_MIPI_AUTO_CAL_DONE), 50, 250000);
> +	if (ret < 0) {
> +		dev_warn(csi->dev, "MIPI calibration status timeout!\n");
> +		goto exit;
> +	}
> +
> +	pp =3D tegra20_mipi_read(csi, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS);
> +	cil =3D tegra20_mipi_read(csi, TEGRA_CSI_CSI_CIL_STATUS);
> +	if (pp | cil) {
> +		dev_warn(csi->dev, "Calibration status not been cleared!\n");
> +		ret =3D -EINVAL;
> +		goto exit;
> +	}
> +
> +exit:
> +	tegra20_mipi_write(csi, TEGRA_CSI_CSI_CIL_STATUS, pp);
> +
> +	/* un-select to avoid interference with DSI */
> +	tegra20_mipi_write(csi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG,
> +			   CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +			   CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +			   CSI_CIL_MIPI_CAL_TERMOS(4));
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG,
> +			   CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> +			   CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> +			   CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +			   CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +			   CSI_CIL_MIPI_CAL_TERMOS(4));
> +
> +	pm_runtime_put(csi->dev);
> +
> +	return ret;
> +}
> +
> +static const struct tegra_mipi_ops tegra20_mipi_ops =3D {
> +	.start_calibration =3D tegra20_start_pad_calibration,
> +	.finish_calibration =3D tegra20_finish_pad_calibration,
> +};
> +
> +/* ---------------------------------------------------------------------=
-----
> + * CSI
> + */
> +static void tegra20_csi_capture_clean(struct tegra_csi_channel *csi_chan=
)
> +{
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_VI_INPUT_STREAM_CONTROL, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_HOST_INPUT_STREAM_CONTROL, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK, =
0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_INTERRUPT_MASK, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_READONLY_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_COMMAND, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_DATA, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_MIPI_CAL_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CLKEN_OVERRIDE, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_DEBUG_CONTROL,
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_0 |
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_1 |
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_2);
> +}
> +
> +static int tegra20_csi_port_start_streaming(struct tegra_csi_channel *cs=
i_chan,
> +					    u8 portno)
> +{
> +	struct tegra_vi_channel *vi_chan =3D v4l2_get_subdev_hostdata(&csi_chan=
->subdev);
> +	int width  =3D vi_chan->format.width;
> +	int height =3D vi_chan->format.height;
> +	u32 data_type =3D vi_chan->fmtinfo->img_dt;
> +	u32 word_count =3D (width * vi_chan->fmtinfo->bit_width) / 8;
> +	enum tegra_vi_out output_channel =3D TEGRA_VI_OUT_1;
> +
> +	unsigned int main_output_format, yuv_output_format;
> +	unsigned int port =3D portno & 1;
> +	u32 value;
> +
> +	tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_output=
_format);
> +
> +	switch (data_type) {
> +	case TEGRA_IMAGE_DT_RAW8:
> +	case TEGRA_IMAGE_DT_RAW10:
> +		output_channel =3D TEGRA_VI_OUT_2;
> +		if (port =3D=3D PORT_A)
> +			main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER;
> +		else
> +			main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER;
> +		break;
> +	}
> +
> +	tegra20_csi_capture_clean(csi_chan);
> +
> +	/* CSI port cleanup */
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(port), 0)=
;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port), 0)=
;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(port)=
, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port), 0);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, BIT(25 + port)); /*=
 CSI_PP_YUV422 */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, BIT(2 + port));=
 /* CSI_PP */
> +	tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, BIT(2 + port));=
 /* CSI_PP */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_H_ACTIVE(port), width << 16);
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_V_ACTIVE(port), height << 16)=
;
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port), 0x1)=
;
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(port), wo=
rd_count);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port),
> +			  CSI_PP_FRAME_MIN_GAP(0x14)); /* 14 vi clks between frames */
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(port)=
,
> +			  CSI_PP_EXP_FRAME_HEIGHT(height) |
> +			  CSI_PP_MAX_CLOCKS(0x300) | /* wait 0x300 vi clks for timeout */
> +			  CSI_PP_LINE_TIMEOUT_ENABLE);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port),
> +			  CSI_PP_OUTPUT_FORMAT_PIXEL |
> +			  CSI_PP_DATA_TYPE(data_type) |
> +			  CSI_PP_CRC_CHECK_ENABLE |
> +			  CSI_PP_WORD_COUNT_HEADER |
> +			  CSI_PP_DATA_IDENTIFIER_ENABLE |
> +			  CSI_PP_PACKET_HEADER_SENT |
> +			  port);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port),
> +			  CSI_SKIP_PACKET_THRESHOLD(0x3f) |
> +			  (csi_chan->numlanes - 1));
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port),
> +			  CSI_CONTINUOUS_CLOCK_MODE_ENABLE |
> +			  0x5); /* Clock settle time */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(port)=
,
> +			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> +			 host1x_syncpt_id(vi_chan->frame_start_sp[0])
> +			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_channel),
> +			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> +			 host1x_syncpt_id(vi_chan->mw_ack_sp[0])
> +			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> +
> +	value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_D=
ISABLE :
> +		CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_DISABLE;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +			  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +			  CSI_PP_DISABLE);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> +			 (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> +			 (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> +			 yuv_output_format | main_output_format);
> +
> +	return 0;
> +};
> +
> +static void tegra20_csi_port_stop_streaming(struct tegra_csi_channel *cs=
i_chan, u8 portno)
> +{
> +	struct tegra_csi *csi =3D csi_chan->csi;
> +	unsigned int port =3D portno & 1;
> +	u32 value;
> +
> +	value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS)=
;
> +	dev_dbg(csi->dev, "TEGRA_CSI_CSI_PIXEL_PARSER_STATUS 0x%08x\n", value);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, value);
> +
> +	value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS);
> +	dev_dbg(csi->dev, "TEGRA_CSI_CSI_CIL_STATUS 0x%08x\n", value);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +			  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +			  CSI_PP_DISABLE);
> +
> +	if (csi_chan->numlanes =3D=3D 4) {
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND,
> +				  CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_DISABLE);
> +	} else {
> +		value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL=
_NOP :
> +			CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> +	}
> +}
> +
> +static int tegra20_csi_start_streaming(struct tegra_csi_channel *csi_cha=
n)
> +{
> +	u8 *portnos =3D csi_chan->csi_port_nums;
> +	int ret, i;
> +
> +	for (i =3D 0; i < csi_chan->numgangports; i++) {
> +		ret =3D tegra20_csi_port_start_streaming(csi_chan, portnos[i]);
> +		if (ret)
> +			goto stream_start_fail;
> +	}
> +
> +	return 0;
> +
> +stream_start_fail:
> +	for (i =3D i - 1; i >=3D 0; i--)
> +		tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> +
> +	return ret;
> +}
> +
> +static void tegra20_csi_stop_streaming(struct tegra_csi_channel *csi_cha=
n)
> +{
> +	u8 *portnos =3D csi_chan->csi_port_nums;
> +	int i;
> +
> +	for (i =3D 0; i < csi_chan->numgangports; i++)
> +		tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> +}
> +
> +static const struct tegra_csi_ops tegra20_csi_ops =3D {
> +	.csi_start_streaming =3D tegra20_csi_start_streaming,
> +	.csi_stop_streaming =3D tegra20_csi_stop_streaming,
> +};
> +
> +static const char * const tegra20_csi_clks[] =3D {
> +	NULL,
> +};
> +
> +const struct tegra_csi_soc tegra20_csi_soc =3D {
> +	.ops =3D &tegra20_csi_ops,
> +	.mipi_ops =3D &tegra20_mipi_ops,
> +	.csi_max_channels =3D 2, /* CSI-A and CSI-B */
> +	.clk_names =3D tegra20_csi_clks,
> +	.num_clks =3D ARRAY_SIZE(tegra20_csi_clks),
> +};
> +
> +static const char * const tegra30_csi_clks[] =3D {
> +	"csi",
> +	"csia-pad",
> +	"csib-pad",
> +};
> +
> +const struct tegra_csi_soc tegra30_csi_soc =3D {
> +	.ops =3D &tegra20_csi_ops,
> +	.mipi_ops =3D &tegra20_mipi_ops,
> +	.csi_max_channels =3D 2, /* CSI-A and CSI-B */
> +	.clk_names =3D tegra30_csi_clks,
> +	.num_clks =3D ARRAY_SIZE(tegra30_csi_clks),
> +};
> +
>  /* ---------------------------------------------------------------------=
-----
>   * VIP
>   */
> @@ -681,10 +1193,11 @@ static int tegra20_vip_start_streaming(struct tegr=
a_vip_channel *vip_chan)
>  	enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_R=
AW8 ||
>  					    data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
>  					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
> -	unsigned int main_input_format;
> -	unsigned int yuv_input_format;
> +	unsigned int main_input_format, yuv_input_format;
> +	unsigned int main_output_format, yuv_output_format;
> =20
>  	tegra20_vi_get_input_formats(vi_chan, &main_input_format, &yuv_input_fo=
rmat);
> +	tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_output=
_format);
> =20
>  	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
> =20
> @@ -717,6 +1230,11 @@ static int tegra20_vip_start_streaming(struct tegra=
_vip_channel *vip_chan)
> =20
>  	tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_ST=
OP_CAPTURE);
> =20
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> +			 (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> +			 (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> +			  yuv_output_format | main_output_format);
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/med=
ia/tegra-video/vi.h
> index 5cbc0606ed6c..bad55e0bd313 100644
> --- a/drivers/staging/media/tegra-video/vi.h
> +++ b/drivers/staging/media/tegra-video/vi.h
> @@ -125,7 +125,6 @@ struct tegra_vi {
>   *		frame through host1x syncpoint counters (On Tegra20 used for the
>   *              OUT_1 syncpt)
>   * @sp_incr_lock: protects cpu syncpoint increment.
> - * @next_out_sp_idx: next expected value for mw_ack_sp[0], i.e. OUT_1 (T=
egra20)
>   *
>   * @kthread_start_capture: kthread to start capture of single frame when
>   *		vb buffer is available. This thread programs VI CSI hardware
> @@ -188,7 +187,6 @@ struct tegra_vi_channel {
>  	struct host1x_syncpt *mw_ack_sp[GANG_PORTS_MAX];
>  	/* protects the cpu syncpoint increment */
>  	spinlock_t sp_incr_lock[GANG_PORTS_MAX];
> -	u32 next_out_sp_idx;
> =20
>  	struct task_struct *kthread_start_capture;
>  	wait_queue_head_t start_wait;
> diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/=
media/tegra-video/video.c
> index 6fe8d5301b9c..9f2bddc460bf 100644
> --- a/drivers/staging/media/tegra-video/video.c
> +++ b/drivers/staging/media/tegra-video/video.c
> @@ -127,6 +127,12 @@ static const struct of_device_id host1x_video_subdev=
s[] =3D {
>  	{ .compatible =3D "nvidia,tegra20-vip", },
>  	{ .compatible =3D "nvidia,tegra20-vi", },
>  #endif
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +	{ .compatible =3D "nvidia,tegra20-csi", },
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +	{ .compatible =3D "nvidia,tegra30-csi", },
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  	{ .compatible =3D "nvidia,tegra210-csi", },
>  	{ .compatible =3D "nvidia,tegra210-vi", },
>=20




