Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ED799B13D
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 08:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA0510E2FB;
	Sat, 12 Oct 2024 06:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lmtHawoq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CD110E2FB
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 06:17:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HX44UJS/xmq94cvxQ/pJbhJaFJ/ka/guAjjgtJfxZwFdmGHWCnEONk+CN623F0Hppykuj3etqzddcpN7BSZZP24rv83vJdbLYjRXJfIq3mM2ykfLrVuDZsAUPL3EQlCKk+Z3M5Vf5ltzSAKRtvZWZGbSao0CzQJTth5rgqJm7J03O93KxNUEfdNo+5lMFPs80qRLeGp/VwN8gg6Ezr5DyuZCLtzk5jsXL17sAHljNECuwU2srUnjMC6dMaOTCFK/5djVZW+n23gMPoYAd0yv/7SYBcr8bxChfq/0NZg9OPfauj5E119XFImPwN26Zi75CW04+OhpVgbzcuegAaFFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sv1Co+exwwbx5vdzXdoPDIevOdPnNJvFOLXoJUsiJpk=;
 b=TcpjMpQyYTCDyJlcgjPeCeyyZuNfu9lnxSnACmdFflqWo9EfyjSZMitDzWVSF2omPHs9wVXvvc9qqMCcY1u3xo5ZEDL/6dfgv7wwH2dzJKHSo3Hpl5mBpjxFhCB8tWTi1/BuTdFiqnPDIK4gJy/bOZ8QEkn+rzu2WxSrZH0BQoKyqUGNxj704joMxTITS6T8HWQb38CU54bvYC455BNfEACNXM9jCK284ck1b78WL44WszvlnPaLPR8qPWSED4QBQziuNjxxhhXPuxf5KYg97FDJ25nafPNEPuPphoBfWLnwfQWFuUNe4wNINkpy0AupbPetggrcEZVAaADBFnEUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sv1Co+exwwbx5vdzXdoPDIevOdPnNJvFOLXoJUsiJpk=;
 b=lmtHawoq7BbtZzZGCjBc63YqmhTyCBTbbZlmDS7lhGLGcm8YOmmYeNg21ZGlH88EV3EDJK0PjZb88Q0qkn81IBw24KX7Rn+4a2t7wkkSGTaKy/JIODZ/cyY8W2bQRZ7yKZrDLN1zgL0hpaSPGDwShQwG9nruXmOnlDEHER02kUKy46K9E5LbvSjsah+WNGnfXsRz90R6Sh3BGWTAZeWxGIVSK8/nLh+AzEnCxgrmKxPtbLRTh3zQvjD5tPZVDOl3udjZVByzvXHJmzaXnfMgPdXun0ch5fwqMKiydkKQx13jCAahQ5slxsh2lOQjdYuFqdCoo3HVaQT7KVzISQnQkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11024.eurprd04.prod.outlook.com (2603:10a6:800:260::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Sat, 12 Oct
 2024 06:17:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 06:17:52 +0000
Message-ID: <6be9d2ac-7e0b-4b6a-885d-ad40158a2998@nxp.com>
Date: Sat, 12 Oct 2024 14:18:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/bridge: fsl-ldb: Use clk_round_rate() to validate
 "ldb" clock rate
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
 nfraprado@collabora.com, o.rempel@pengutronix.de, y.moog@phytec.de
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-5-victor.liu@nxp.com>
 <2on4bu5jsxvaxckqz3wouwrf2z6nwbtv34ek4xda2dvobqhbsf@g7z7kxq5xrxi>
 <5fb80bf6-96be-4654-bd54-dc4f1d5136ae@nxp.com>
 <20241011-mottled-translucent-dodo-8877e6@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241011-mottled-translucent-dodo-8877e6@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11024:EE_
X-MS-Office365-Filtering-Correlation-Id: d8bb6140-0edd-4c22-cbed-08dcea859a38
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHJ3L05GUnQ2UVl5UEI0NEtwQkw0ZnF0ZUlHdkJCNWErdmtjeFV4dUxTbHd1?=
 =?utf-8?B?ZlVZNmtBdU9RZjRDakpicm1KYy9DRk5mMlkyeEwyZmJYMXpWSnRNcE1FZTM2?=
 =?utf-8?B?MXB2RTRTdEZXM1hwM3dVVy80cGRqcGZacmsvQzEwOEJGYUpYSGpGRFdXVy9t?=
 =?utf-8?B?M3VVdjcwV2YxSm12cEsxdkQwbTI0SngzQUIzS3VOdDU1MzdPMkwwb0xtRTJa?=
 =?utf-8?B?cmdWeUgvSmtjeVlvVFVzbEpCeVN3ODlrRHdTczFScE1nV0FKdVJXTHVzdEpl?=
 =?utf-8?B?WWQzc1FsUjRER3NpV2kwK2F4ZEJpMWl1UzNJaXVqbWRLakZDTmV4VW9nS3R2?=
 =?utf-8?B?WkhSNCtHZld3SDZRdlg2YVp1MHFiRlNvNk5zNUxmM2Yvb1NWaTVET09iVXdu?=
 =?utf-8?B?VkwzUHRHczhndS83d0pka1VQZUNMb2QwYks3TGpLYUZhN0p4MTRaQTF5b3FK?=
 =?utf-8?B?dnhFbHNONFhTYjFjcW5ZK0F0MHRET2FXeFEwTGJ5VmJWRXNTQ0Z6dVZkcVRD?=
 =?utf-8?B?YXZZM0RCbDZyUytIbWtrM0tNZjZjZ2VpQnJnSWdHOFVaMlU4U3Fvb0RwUW9s?=
 =?utf-8?B?WndHMlYrMnlOd3ppTWkzTEtBNTluR0Q0RHg5WTFzTCtGdE4zUmJpWUhRRTdw?=
 =?utf-8?B?WERsR3dGbnJVQkRMZTAxUGpIL3pROUVJUno2ZFBXeHE0YjJXN3IxcUtGcUxD?=
 =?utf-8?B?NVlBSHB2L2JoaDd2Q3pPYXRObUV2WFpRVjljbmg4NCtGYzhkVHp2MEZRelow?=
 =?utf-8?B?NG1PMUx4UUlOeDM3OVVaQjhWS2FGMWlvemt1b0xHaEE0aTU5TGQzSW5vZ2NL?=
 =?utf-8?B?TU4yYi9hNWZvd0RZQzRoUDlhbUJZR3RGSkVjTHhzeDh2akVyQ1JGdzBvenlr?=
 =?utf-8?B?NXNhKzJua3p2Z2pVTWRVbEV1d0M1SHBJQWF1UitQbGRxMzN4ZjFTaDZDV05E?=
 =?utf-8?B?b0xpZ2w1S3dSbzRqazQ5dnM1VWZmTkhJMHN0dkQwVVhWczErL0srcW9yYndY?=
 =?utf-8?B?bzM2bGp1R2lZV0hneVhNclNvdXExWWFhdm4zcHVBQVJwNlRmRng2UzdpREVQ?=
 =?utf-8?B?UTI1d2VUL2R5U2FCTngwVml6ZjVDdlVEOW9UL1hWOURURnA2akJjQVc0UTlu?=
 =?utf-8?B?RTkxb0k5bmsvdEZqaWJoK2dVNzdJbjZDaWlja0FIbXJXNTNtTlBvemMvdGU4?=
 =?utf-8?B?NWErdGpjOFRzS3h4SUlXajI1bVZKdWRoS0Jrc1lzdmlSdzA2TERWYjNDSEFa?=
 =?utf-8?B?RnZkRW4wa3ZGTUhIR3FOSXgwT0ZRSnNHZXlVNC9jNnNRMFVHdmhibGpmNFcv?=
 =?utf-8?B?NHBNTmhNUlhsdjB3WDhhNjUwOTcrVmxDOUhSSElxRDhPWGFTSnlsV3VZWE1t?=
 =?utf-8?B?WDZVVnJuRjUxVTcvb094aFlmWVVEQVE2Nm8yUjc4WVk1Q2JUcnZ6bjFtWFNS?=
 =?utf-8?B?NDcvdjdxWTZnMGxFekJkZVBMejZxV1pDaU5wSkQ3Qnd3UmlES2JpYjlxWVRh?=
 =?utf-8?B?T202N3JTQWJPZTFqcjFyRUxuN1FCcFhtNUhHL245LzZCMk80ZHpaUDU3NmRl?=
 =?utf-8?B?Y2Y3U3hFOHNHT2xEL2EvUnBWK0o3ZFg0NFZIVExJMm1UT1d6OFNsdS9sYUpN?=
 =?utf-8?B?WGQxQk9BWHJreXd3SHZqUk5OOVJkV0VnMnhNbHBDRmc4MzdhQXBGUkhUYkhz?=
 =?utf-8?B?RitFdEdVV2lJZ0MwS3VqQlR6Q0Q1VHNiMkhXblpRd1VkY3BTYkVCWXBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mll3aXFxU1piWldMTUxVN1JJcmRDMzVnM1FHS205WnphTEh6dWRpdGN3TWxs?=
 =?utf-8?B?elFLMUxuTWRzN25hbDhrQkgvdE5PdGlyTTNPUHdHdnhsRVVFc1AxTzhISWQv?=
 =?utf-8?B?UzZ1b3pGdW50bEg3dFY4S0ptKzdWZlhaWkxMTncvSW9KeVF4UFYrWVo0cHZC?=
 =?utf-8?B?TWVPWXJBNFVSclFtS0tERDNaKy9meFJhVERVTDJIWGpGVU9WU2F1VG9oNHZQ?=
 =?utf-8?B?ZkJFa04rNGlPYlI4UTkwU2R6Vmg1aVM3OWhNR3BpWC9EV1FwZWJMb293NnBv?=
 =?utf-8?B?WVErMGQ5S2tJcEh3eitkLzRFVnduOXlqUHpoNGpjdTZENXdXblJPdGJVN3Zs?=
 =?utf-8?B?NTVOSEtmZ1dJbFRYazN5akFZc2JCaEh0OXpDd0QvUlBtd3dIeEwvZjFIUzVC?=
 =?utf-8?B?UHJxQThIR1VnRXVHTXd5NGtYRnFJaEVnMVgzUVQwbEVqczU5dmV3blVVeWJW?=
 =?utf-8?B?dFFCZ1l0WHJSV0U0Mk1jU3BXZzNod2djZndaOWh6U0wwM3RWWnhwZVMrTkF3?=
 =?utf-8?B?Qms3SDdQNHd1VUtCM05SSHRMTlpwOER0ZFVlM0FSbndzT1kvYVFtTEVoVHVh?=
 =?utf-8?B?UTgzekl2U213NnY2K1ZwWUMzMVpMUW9RTHBIREdYaG1lbnZIbkdab0Y3OVZV?=
 =?utf-8?B?eE9kRWxyL21rN0tHK2srSjlMRnhYZXFQUEVoUWxrczB3Ri9TNGxJakthbEk5?=
 =?utf-8?B?bUJ4bDdrdEwxOG1lalhwaEUxUXhDSUpJNTFxNUlhRHpQb3lGMGNZWms3SHJi?=
 =?utf-8?B?NkpVb1hWaWxueU9kSXhFM0YxdzNha3czWGdKbzVNcHFGajdQTlVPNzBaSDZn?=
 =?utf-8?B?aEg1NDVsRVRSK0lxdGZVOFdZZTR5MWM3UWtHdmg0MnREV2I3STFRMkdwS3RL?=
 =?utf-8?B?QlliZmZwclVTemtNN3UrSnlDa3h3WFlrR29haEljdjNEQlN6ZVczQWJMOFJW?=
 =?utf-8?B?WEdKenVJRU1SS283Y1UrRVQzRk5PdkhiUnc3emtQRTZuZjVjNnlIaXp2OUgy?=
 =?utf-8?B?NFRTOW9IMGZWNW13czhIeHlXQkZBckQrMjhreGJNZUp6RGdpTW1ibVZoS2xq?=
 =?utf-8?B?dGlzenlKcmpyWE5OUW9tQzRlc0drczM0aTBMNk1aK1M0ZUd6cXl5bkk4ZWkv?=
 =?utf-8?B?a3hXK2ljL2RLU1U1alVsa2VZbDdxWHZoYkE4aUdVbEhCdUh3LzBScTJCbzRK?=
 =?utf-8?B?d2U2R3BTNi9QeCsrM25hSmhnc0F6WHp4VjV2Z0dvR2pZM2d1RnIwaUpCRmZP?=
 =?utf-8?B?cUx6SG1QZGNlQ0NNa3JLbHVOVHVTaDJTaUJrMjZCWlZNb05wUTZjb0FBOUQy?=
 =?utf-8?B?azZEVGd6VDlFbnMvY2FkSHNDUUJhenRtOHJjdHkvSmR4SXJPYXE3UzVVUERZ?=
 =?utf-8?B?TS9PYkdtQ2Z1MEpNcHZDTUJacmxHVmd3SDUvWVNRdEU2bWkzcGMvd1Q3Slor?=
 =?utf-8?B?ajE2Qk5HMThEOG1XQWpXWFN3UXUyVnliTnFSa09MTHdEMzhqNEliRGRHUEhz?=
 =?utf-8?B?YW1mWnpuWTUveHpFSjJOYVZIdGRVdnpnbk1HczZGVmIwZkF3aDNRUDZodnhv?=
 =?utf-8?B?dlNtaHhFMldyb1ZMNVNHMTdIU2k5a0l2WmlyWWp6VzZvSGcrZUNRcldmQ3NK?=
 =?utf-8?B?dFFNMnlIVGVHekZBdkI3Z3pZeU9MdWdLazZjK045bno3SW5sZkFkb09WSDRl?=
 =?utf-8?B?aytCNWc2ME9IcDFJTTZXT3hHQlVheEQ0bVNGT2VmbjFMRTd4dEZWYXp4ZC94?=
 =?utf-8?B?RTVhcURRV2hFMmF1M29xN2gyaFNoS09Qbkl6UDZLTU5zRTBldXQ0MGZDNVJl?=
 =?utf-8?B?blNIelNtVUJZTlRLalhRajFZUFlmaGltQUExUHF4cDdLM0NCQ2ppejBYTG53?=
 =?utf-8?B?a2NBTERWaStISWJUTzVNaEMxZzFSbEdLWE14R1FVTGJJcExYSytwL2I4MGsv?=
 =?utf-8?B?ZzlocStDaWtkTUdENHZXMmJGOVVjUTFUQzZCMm02SG15bEdpWHl1MG4rc2RI?=
 =?utf-8?B?cFRNZExIOGJnZVZOa0p1cWl6cHNLTDN0Yy9FYnpmWC9QVWllcW9rM1dRSXR1?=
 =?utf-8?B?ODhvTTRESnJhTHVLdVU3ZmdyZzhERW5JNzNGanJWd1d1MG5HSkZuQ1dWYWc0?=
 =?utf-8?Q?MNI4/n9Golnmt1uN+DxdEdAjl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bb6140-0edd-4c22-cbed-08dcea859a38
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 06:17:52.0398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJzXM9gcv6aD4i9mSlI1F4fwVYHxuDe2f5ovyES0D6+pO8MKWfma+Rn/u3HCjlwg4nVOmhUjQImUJVKTyEx6oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11024
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

On 10/11/2024, Maxime Ripard wrote:
> On Mon, Sep 30, 2024 at 03:55:30PM GMT, Liu Ying wrote:
>> On 09/30/2024, Maxime Ripard wrote:
>>> On Mon, Sep 30, 2024 at 01:28:59PM GMT, Liu Ying wrote:
>>>> Multiple display modes could be read from a display device's EDID.
>>>> Use clk_round_rate() to validate the "ldb" clock rate for each mode
>>>> in drm_bridge_funcs::mode_valid() to filter unsupported modes out.
>>>>
>>>> Also, if the "ldb" clock and the pixel clock are sibling in clock
>>>> tree, use clk_round_rate() to validate the pixel clock rate against
>>>> the "ldb" clock.  This is not done in display controller driver
>>>> because drm_crtc_helper_funcs::mode_valid() may not decide to do
>>>> the validation or not if multiple encoders are connected to the CRTC,
>>>> e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
>>>> parallel display output simultaneously.
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>>  drivers/gpu/drm/bridge/fsl-ldb.c | 22 ++++++++++++++++++++++
>>>>  1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
>>>> index b559f3e0bef6..ee8471c86617 100644
>>>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>>> @@ -11,6 +11,7 @@
>>>>  #include <linux/of_graph.h>
>>>>  #include <linux/platform_device.h>
>>>>  #include <linux/regmap.h>
>>>> +#include <linux/units.h>
>>>>  
>>>>  #include <drm/drm_atomic_helper.h>
>>>>  #include <drm/drm_bridge.h>
>>>> @@ -64,6 +65,7 @@ struct fsl_ldb_devdata {
>>>>  	u32 lvds_ctrl;
>>>>  	bool lvds_en_bit;
>>>>  	bool single_ctrl_reg;
>>>> +	bool ldb_clk_pixel_clk_sibling;
>>>>  };
>>>>  
>>>>  static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>>>> @@ -74,11 +76,13 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>>>>  	[IMX8MP_LDB] = {
>>>>  		.ldb_ctrl = 0x5c,
>>>>  		.lvds_ctrl = 0x128,
>>>> +		.ldb_clk_pixel_clk_sibling = true,
>>>>  	},
>>>>  	[IMX93_LDB] = {
>>>>  		.ldb_ctrl = 0x20,
>>>>  		.lvds_ctrl = 0x24,
>>>>  		.lvds_en_bit = true,
>>>> +		.ldb_clk_pixel_clk_sibling = true,
>>>>  	},
>>>>  };
>>>>  
>>>> @@ -269,11 +273,29 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>>>>  		   const struct drm_display_info *info,
>>>>  		   const struct drm_display_mode *mode)
>>>>  {
>>>> +	unsigned long link_freq, pclk_rate, rounded_pclk_rate;
>>>>  	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>>>>  
>>>>  	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
>>>>  		return MODE_CLOCK_HIGH;
>>>>  
>>>> +	/* Validate "ldb" clock rate. */
>>>> +	link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
>>>> +	if (link_freq != clk_round_rate(fsl_ldb->clk, link_freq))
>>>> +		return MODE_NOCLOCK;
>>>> +
>>>> +	/*
>>>> +	 * Use "ldb" clock to validate pixel clock rate,
>>>> +	 * if the two clocks are sibling.
>>>> +	 */
>>>> +	if (fsl_ldb->devdata->ldb_clk_pixel_clk_sibling) {
>>>> +		pclk_rate = mode->clock * HZ_PER_KHZ;
>>>> +
>>>> +		rounded_pclk_rate = clk_round_rate(fsl_ldb->clk, pclk_rate);
>>>> +		if (rounded_pclk_rate != pclk_rate)
>>>> +			return MODE_NOCLOCK;
>>>> +	}
>>>> +
>>>
>>> I guess this is to workaround the fact that the parent rate would be
>>> changed, and thus the sibling rate as well? This should be documented in
>>> a comment if so.
>>
>> This is to workaround the fact that the display controller driver
>> (lcdif_kms.c) cannot do the mode validation against pixel clock, as
>> the commit message mentions.
> 
> That part is still not super clear to me, but it's also not super
> important to the discussion.

As kerneldoc of drm_crtc_helper_funcs::mode_valid mentions that
it is not allowed to look at anything else but the passed-in mode,
it doesn't know of the connected encoder(s)/bridge(s) and thus
cannot decide if it should do mode validation against pixel clock
or not.  Encoder/bridge drivers could adjust pixel clock rates
for display modes.  So, mode validation against pixel clock should
be done in this bridge driver.

In fact, the pixel clock should have been defined as a DT property
in fsl,ldb.yaml because the clock routes to LDB as an input signal.
However, it's too late...  If the DT property was defined in the
first place, then this driver can naturally do mode validation
against pixel clock instead of this workaround.

> 
> My point is: from a clock API standpoint, there's absolutely no reason
> to consider sibling clocks. clk_round_rate() should give you the rate

Agree, but it's a workaround.

> you want. If it affects other clocks it shouldn't, it's a clock driver
> bug.

The sibling clocks are the same type of clocks from HW design
point of view and derived from the same clock parent/PLL.
That's the reason why the workaround works.

> 
> You might want to workaround it, but this is definitely not something
> you should gloss over: it's a hack, it needs to be documented as such.

I can add some documentation in next version to clarify this
a bit.

> 
>> The parent clock is IMX8MP_VIDEO_PLL1_OUT and it's clock rate is not
>> supposed to be changed any more once IMX8MP_VIDEO_PLL1 clock rate is
>> set by using DT assigned-clock-rates property.  For i.MX8MP EVK, the
>> clock rate is assigned to 1039500000Hz in imx8mp.dtsi in media_blk_ctrl
>> node.
> 
> There's two things wrong with what you just described:
> 
>   - assigned-clock-rates never provided the guarantee that the clock
>     rate wouldn't change later on. So if you rely on that, here's your
>     first bug.

I'm not relying on that.  Instead, the PLL clock rate is not
supposed to change since IMX8MP_CLK_MEDIA_LDB clock("ldb" clock
parent clock) hasn't the CLK_SET_RATE_PARENT flag.  And, we don't
want to change the PLL clock rate at runtime because the PLL can
be used by i.MX8MP MIPI DSI and LDB display pipelines at the same
time, driven by two LCDIFv3 display controllers respectively with
two imx-lcdif KMS instances.  We don't want to see the two display
pipelines to step on each other.

> 
>   - If the parent clock rate must not change, why does that clock has
>     SET_RATE_PARENT then? Because that's the bug you're trying to work
>     around.

IMX8MP_CLK_MEDIA_LDB clock hasn't the CLK_SET_RATE_PARENT flag.
I'm fine with the "ldb" clock tree from the current clock driver
PoV - just trying to validate pixel clock rate as a workaround.

> 
> Maxime

-- 
Regards,
Liu Ying

