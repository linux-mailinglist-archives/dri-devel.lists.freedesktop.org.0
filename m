Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900A95ABCC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 05:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC07510E02D;
	Thu, 22 Aug 2024 03:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="ErEpm15G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2060.outbound.protection.outlook.com [40.107.215.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DC310E02D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 03:18:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eC3KjNqbKE6M8QTjkIpd0N4csCNs28D2nlppOlHl6sPM3Tgb1ma0Jvd0V+PdnRTwBFM/V9NXqTHo0V4fGr/ZQQ4ddk3ep9rB3LKCG9lhyengHfSym7otXUcpNVOu0q1HhvuEwsHN8TZaTDXxbQG4Tn/NL7cFYBpZbCmXBlKw1P/8b86F+efJcadlLU1s5udbG/dVqWiWIxO9JbQ/9CD0yNfvennP+7R0dfGefBCZUPMrl5QlVto2hZzeU+dVAzps8otDrDCNhx8pk3lc9V4P/zAA6uNhfSYYSvFb0BXlPkEjxgx4U08hz7P3GevJ8TWsPcov+aPql+Oud5tKcVgC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sn5TTcHUD+SAoJcTT3T74+nnlBsETwLiKCkIucBiPqs=;
 b=m8X76CP5OCnAEY53M0+z4hrHt9J04pCKzE+g9Dw6blyb5VY8kVgA9mtsCy7osVHJKrkSsSRU97ukwsBJ8X1ELz6PFrU961i1mABSL2dRFWgfe+lVaxpvNk1QW3tvkc9K6LEnwl/dMSZ4cHXiMaoR5/tIwll0jEbOXlHk/Jk9jgetC36Is4lTW5f4vMx1BSvhtoykX7sGN5Ce7kLArBjU2Y0cZZU9alyYA2PURN0V2wudrCFR+Tv4klWkqMFQCRL6sicd7syY6nHoYlHgxu7/FoCgci/Ok9maS1ZHANXpWnOGCfTy1SR8i7sC7aVP/lN1G7Skjjay88LY0L32PWIPmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sn5TTcHUD+SAoJcTT3T74+nnlBsETwLiKCkIucBiPqs=;
 b=ErEpm15GPsKkf74n32kdYzRTj7tPSn6/JUbrarR8StWijTvqUum1bKJtQPN8Zl4yyxt2a6kcqjnA0Kx/Gg0LmTh84MKv/ZKuY2QM2E3r7K9VVRJ70ynZ5kDHhBpN1lJKUE7xmch4I+KyCVwwEV4r9M32WbleBQUnY+0tC/cYcpGv3PIeuPS4bmrSZYVxgBJGH01eeIb/QCWspoYYSzo53pLIPv4L3B5SL4oBCcDN+eM/rhiStXid0S99r+VARppkzcbe9/vUTUV5s9aifTExK3QjP4F3AahK9KXIpv7Cx4lXV9Kn1d/d9Zq6Uk84TdKdXr7P+EsvPBfbzL+qgVzE4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 JH0PR06MB7349.apcprd06.prod.outlook.com (2603:1096:990:a5::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Thu, 22 Aug 2024 03:18:50 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 03:18:50 +0000
Message-ID: <01292a92-c5f5-490d-a45f-a11547854c68@vivo.com>
Date: Thu, 22 Aug 2024 11:18:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: drm: Use devm_clk_get_enabled() helpers
To: Julian Calaby <julian.calaby@gmail.com>,
 Rong Qianfeng <rongqianfeng@vivo.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, opensource.kernel@vivo.com
References: <20240820125840.9032-1-rongqianfeng@vivo.com>
 <CAGRGNgXn94ZPROLN4JButpnc+ffFFr1SwtTFM=bvcPH95DFQgQ@mail.gmail.com>
Content-Language: en-US
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <CAGRGNgXn94ZPROLN4JButpnc+ffFFr1SwtTFM=bvcPH95DFQgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0316.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::9) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|JH0PR06MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: b5483a07-7b51-48bd-7a96-08dcc259245a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|81742002; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1BuMU11OE0zOHZBRENWaEIyTE55Z0hPYTNkSXo3M2NTOFlWWHpxdmFnMmds?=
 =?utf-8?B?Q0RLbHg2RGd1a1ZkSzI3M1k3Y1RNczJVZng4Vm9aSlc4K0ZoUzBPVzJZbVps?=
 =?utf-8?B?K3cwNmdKRjlFSWFFdndpVlE3ekFrK1owOWUwdGZMVVJNckdyTWtxd2RmbXlC?=
 =?utf-8?B?V1FYR0RBVDA1aUJ1V2poRzQ3bC9KcmFFYWgvZGFHa1U4ZGh2T1UwSEZYNmVs?=
 =?utf-8?B?SDlDeDFYbWdaSmxrcDkrTHlHTW1BZTY3bHB3cml3S0g0USsxZGtzYlhVSFJ1?=
 =?utf-8?B?NlUySFlNOFpXZkNkUFRYRVNtamJkQnpBQTNTM0FDcWhzSDIzQU9hNjE3TDdk?=
 =?utf-8?B?cjNVT3FCVU9lVS9qcE02WXJiRTN3T001M0NBcllNV2w4a1RLYzdJbFFUQVo2?=
 =?utf-8?B?V2Ezc3lGbDgwSks2NEVSR2pIMWFhNkphVW4wSDI3N0ppeWdKUWlpNHFmaXdn?=
 =?utf-8?B?aEdTNHFBaStqcjBldkppWVhGeGFDZDUyTDl5WDJtekR0MndPZzJtN2NPOElI?=
 =?utf-8?B?cTg4NFVaRktyTkZWZHFKOXRjcnF4ZmFZejA3UHFlZ2xYMCtYN1didWJIQk95?=
 =?utf-8?B?dVBRMHZPV05SSG02QStsK1pGeVJIQ1BiVVVxaWE2NjBIZ3JKN1ZLWDF5cmQ5?=
 =?utf-8?B?akFPM3dTUWtzbms3YW95bkwzdjNuNldHWGY1VFlodkxndHdSM3BnZ0xNa08x?=
 =?utf-8?B?UWk2U3FFTi9qbUJnSkZEWlpiWU9DQmc0TUZZQndiVzZDVERaVmllR1ZCd2xF?=
 =?utf-8?B?bUhBUC9NWGV2L1ltcmdRZnBUYUNLaldOaHd4SHg0YzBkaW14S1djL1krb2Vh?=
 =?utf-8?B?ZUFHZnkraVdQNFZqWTFjbENOTFpYQU5mWUpPOUxOSDhhRkdBUG5zNkZpRDVj?=
 =?utf-8?B?dHNSV3Q5ZWlyRXBEV1g1Unc5bUZPQWxGVFQ2VStDdWk4emhZSWU2RjZRdWhX?=
 =?utf-8?B?ME5KSUxUWUlkR1FKRXo0eU1xWkttUlVnT3RzQnZaeGdPSjVoLzVaNjkxU2xK?=
 =?utf-8?B?dW96Z2piMjFVUE9wR2UvMmg2TVNyVmcreEsvdlZjNmU2RmdQSVdNVkVWYWZ2?=
 =?utf-8?B?S0RYdXMrcFJBc01pNmJkN25Yb0Zrbzd1RXlPRld3Zm9KZUQwTzJFWUR5aHh4?=
 =?utf-8?B?T2lMTkpQcnNCeXRTelJ3TldhemdjRVZSZHp1R25nMXlXQkI4NTgwTHQ2NGFi?=
 =?utf-8?B?NXJyeXRaSzFkek9OSFptR3JTeGw3QkNXWEo5Z2F5U3JkUHpqdFp5TExETUtt?=
 =?utf-8?B?aWVXUTNWaGRLamsyK1puUmpOVlZPYkdKbzNHV2M0WG42aTI3M2orek1KWWpz?=
 =?utf-8?B?dCtTSXlORnNZazdlbHFRZDJkeHJCV25rbmRDVFZiN1M2SjdhaDk5WWFEV1Zv?=
 =?utf-8?B?Tit6b2IxdkJyMHFKWXp2c0c4NWdUdkZ1NlVJVWZlWERsNGhrQXplOCsxMk9k?=
 =?utf-8?B?TjVyN2s5SWd5SEZyNDFnNU81S3BrcHBYM3JSYzBERHhjVDZ2MU9ZTG9Iclli?=
 =?utf-8?B?bnorSnVuK0syQXJPTzNOeDgxY1BXK1puL3pJNVVnVFBZejdycjV5c3FxQ1Vm?=
 =?utf-8?B?SE5ML2FXVmRPTHJCd3FWRWVwL1dNczdlQWdPQ2RFZzZpR3g5NUs5SlRWY0c2?=
 =?utf-8?B?dVNzUXAwSTR6UHc0MkVZVStReDVsOHBTd1JKU0xwWGZQV3Flb1FERFFrdTJ1?=
 =?utf-8?B?cFJyd2w3dzIzbTNjakdabWZPZ2xIb0VWcUM5SXhVaVJTVDdxMkxRT3QrQzBw?=
 =?utf-8?B?Z3hQd1NIOEpCaFJORUFpT3JqMlZoTXQxellXbFg3K21EVVRZR05Da2U1NUdl?=
 =?utf-8?B?Ri9uVjVmRCtiZ2hxZ2JZSFhuMjRrZVlHdTNFVUh3Uk9FSjZZUm5icVg4Z0tK?=
 =?utf-8?Q?Si6EymRSd8JIv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(81742002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ui94RlZza2FDWWlHSE9rN0VvWnkzalBySHZCZUs4RFFyR0dwSUlOSkUwK1pD?=
 =?utf-8?B?SklRdTFnVlI3TWkycDU1cEFwMTMvd2tqYXBXclY3QlNnRVlNY2NiZ1UzVmRZ?=
 =?utf-8?B?NzBFVEs2WnFrZEMxSDRHdG9aU25vRzhVdTI5THlLZWFqblg2YjhoV1dFMC90?=
 =?utf-8?B?RFY3UWJKeVJzOHdiZVRPRkVseG9yTFowU2ZvUUUvSy9QTTBjTHlXR1Yyb3BO?=
 =?utf-8?B?dGJBOGozOEc3OEgraUFkSzJUK1VzbkJKUTBaZEF1MWppdDhrZVBMQm52c1RT?=
 =?utf-8?B?S2IrekZ6c1NZcVVmSnVEQVlEcHRRRW9aTDFhYUc5SU1GYzBuZEpnNThBVmlH?=
 =?utf-8?B?NlhwUk1xOWVrQzN5OHhQTFIxVmhNcnp5QXFRYi9ITlJMaTEweTNQc1BJS0VJ?=
 =?utf-8?B?OTJxMU92c1hjbWZkaExub29nZEVYWTJsRmkwNnVDb25wQllBVEE5MHZFUFF4?=
 =?utf-8?B?UFlPS2tta010QUYwbkllSVJ4anRycUZlVVlNV2s5c0NNMEt4blo2Uys3Mm5w?=
 =?utf-8?B?MFh4TlRVV1dZQzV5WHkyNnNDa1ZEZDZNSEwwQVlmc0doVE5jdXEwcEtSeHpI?=
 =?utf-8?B?Vy9MZTR0eVNOaEVzc2tkZ1JkQXVXY0xOeVJpQUlBUFNTVXZNTTF6ZDJsQ01t?=
 =?utf-8?B?VGRXTFB6TTFxS1FwOUxVaGJocFhrOUV3a2I2c1dxR1dEMytXVXo4eG1NdWVr?=
 =?utf-8?B?c0hnenlEZ2J3LzZJbTZMWjludlpCYnJlVzFRamxMakgwSUk1NEYwdUNrcjdL?=
 =?utf-8?B?Z2FJNkM5VUZxZmRxbkI0Uko4MUVHb1F1MFpRR3RsWTRaNFJQTTVTOG44QzA3?=
 =?utf-8?B?Y0ZDR2RocG5CMHJ4N3djV3M3UnpQTkpOTU92Y1Z2WXVaQnJLc2h4K2luMm82?=
 =?utf-8?B?UDhPVWFtNUhsZDVqbjM2UWMrMjA0U1d5bGpXM0RjQ3c5b1cydWY0S3lUbW02?=
 =?utf-8?B?M29ranltQSt1SXA3YlducXBBNmV3UDNyZXVqa1RzczF0NlhqeWpCem8wTEJw?=
 =?utf-8?B?TXlwOUVoUDNQTDZrbS8za29PdmVzTTdNejVyem5xQ2N3YXdlbmwwVHA5VHdV?=
 =?utf-8?B?VDdycjVqZ1FDQXZrUEJWMkRGRUNpTnVlbmtNaWorN1FLUjhyM1N3TGM3K1ZO?=
 =?utf-8?B?ZG94TFVBck9pVk5aYWdzelh0U3lNSjlJT3gxby9MMWowN3lqbEpJbG1MUWhN?=
 =?utf-8?B?VmNnSE5ZV2lqdERUS2hucDhqN2x5ZDNaSmxnVFd2dTE1bmE1RTlFRU0xYnRq?=
 =?utf-8?B?My9jYzEybUl6QkM2UkdqbGxyb2FPQ1k4cTIrTGxWQVU0aGZ6UGxkQ0swN3la?=
 =?utf-8?B?Q3ZhWU54M1cwUEN6QlovWnZJdFB6UHBsUnc1ZUNxN1RlMXRSWUo1QkV3TDR1?=
 =?utf-8?B?amJLVHBRK2N4WW5NTmltZXNhNWFuaFJqaGFYRXBLY0FqUVJwV0YwaU41Zk5J?=
 =?utf-8?B?c0xSTDFIVlk2djZaVVdCOFkvUTF2ckFKaERiQjJtNElmZ2Vaa29tNEJyaE45?=
 =?utf-8?B?YW1EZjgyVm1LUngycC96cWp1WkdpTmo1ZmE4UUhGU2MvTjFCWVorNVJrWkZt?=
 =?utf-8?B?V0xjdGJNeTRBRzdlb0ZUT3c4VDlGUFJGQmVPV0srUmVzcG1ySDhHRUl2ZFhP?=
 =?utf-8?B?dElWdzA0RFUrT1dHTG1raHBJWFJ2QzlTL0Y0aFZpMmhNWGdhWCt2aWlLdzI4?=
 =?utf-8?B?SmFyU2RRWkRQZzFtdnUrRVZReExERnpOQUtTOU5pSkJnN3lnR1k1dy9ReXM0?=
 =?utf-8?B?VkpNcWpoOU56Rk1XS2ZIK0UwcTNnQmtZTHFiVldZTzRveUw4MEV5ckVWMHEy?=
 =?utf-8?B?SGJ0cW1kUStRc3duNnJIWnMxekJTTFhtd0JpS0dhRXVFY3pHQWl5bE9jUmxX?=
 =?utf-8?B?d0pQanI3d3htRXdYMXBQN0RtNTFDejVCQVlIODRBbWdMdnh1V05nWDR1Znl1?=
 =?utf-8?B?Z21vWC9Sa0ErcFQvTjN1YURZNFRwYlZnMnlWY0JieFRubyswem9rRS9mTFhl?=
 =?utf-8?B?RnM0SGRzcDdUWGZUYzJ2aGJLZmkvN29MeXVsS0ZmNGMxdm1uTXRuSW9iV3l2?=
 =?utf-8?B?WHJGK2RDZEMwV1FRaDhtTzBzVS9McVFqWmxwWUduWFpvOFU2d3NCUXcrMlFx?=
 =?utf-8?Q?hG3yGxBrsgjmA3dnhL3IHoRWY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5483a07-7b51-48bd-7a96-08dcc259245a
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 03:18:49.9870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oCUzwp8r1kiJRUxOk6zZwVsfZ/XUpJvx6Q7WzD4IVSP0kZoKfgViFW9P6rtIUN8u5xIryO1o9sG3TW06nIZIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7349
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


在 2024/8/22 8:35, Julian Calaby 写道:
> [Some people who received this message don't often get email from julian.calaby@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Rong,
>
> On Tue, Aug 20, 2024 at 10:59 PM Rong Qianfeng <rongqianfeng@vivo.com> wrote:
>> Replace devm_clk_get() and clk_prepare_enable() with
>> devm_clk_get_enabled() that also disables and unprepares it on
>> driver detach.
>>
>> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
>> ---
>>   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 13 +++----------
>>   drivers/gpu/drm/sun4i/sun6i_drc.c         | 15 ++++-----------
>>   drivers/gpu/drm/sun4i/sun8i_mixer.c       | 13 +++----------
>>   3 files changed, 10 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/sun6i_drc.c
>> index 0d342f43fa93..f263ad282828 100644
>> --- a/drivers/gpu/drm/sun4i/sun6i_drc.c
>> +++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
>> @@ -42,33 +42,28 @@ static int sun6i_drc_bind(struct device *dev, struct device *master,
>>                  return ret;
>>          }
>>
>> -       drc->bus_clk = devm_clk_get(dev, "ahb");
>> +       drc->bus_clk = devm_clk_get_enabled(dev, "ahb");
>>          if (IS_ERR(drc->bus_clk)) {
>>                  dev_err(dev, "Couldn't get our bus clock\n");
>>                  ret = PTR_ERR(drc->bus_clk);
>>                  goto err_assert_reset;
>>          }
>> -       clk_prepare_enable(drc->bus_clk);
>>
>> -       drc->mod_clk = devm_clk_get(dev, "mod");
>> +       drc->mod_clk = devm_clk_get_enabled(dev, "mod");
>>          if (IS_ERR(drc->mod_clk)) {
>>                  dev_err(dev, "Couldn't get our mod clock\n");
>>                  ret = PTR_ERR(drc->mod_clk);
>> -               goto err_disable_bus_clk;
>> +               goto err_assert_reset;
>>          }
>>
>>          ret = clk_set_rate_exclusive(drc->mod_clk, 300000000);
>>          if (ret) {
>>                  dev_err(dev, "Couldn't set the module clock frequency\n");
>> -               goto err_disable_bus_clk;
>> +               goto err_assert_reset;
>>          }
>>
>> -       clk_prepare_enable(drc->mod_clk);
> Am I reading this right: is this changing the init sequence so that
> the clock is enabled before setting a rate?
>
> This is the sort of thing that might cause glitches and issues in some
> hardware, so it'd be polite to test such a change on the actual
> hardware before posting it.

Hi Julian ,

I have seen this used in other places, but the problem you raised may be
different on different hardware.

I wonder if anyone can clarify this?

Best regards,
Qianfeng

>
> Thanks,
>
> --
> Julian Calaby
>
> Email: julian.calaby@gmail.com
> Profile: http://www.google.com/profiles/julian.calaby/
