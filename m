Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B5EB1ACCB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 05:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C092B10E1BC;
	Tue,  5 Aug 2025 03:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dQ7h+RuI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010019.outbound.protection.outlook.com [52.101.84.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A483210E1BC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 03:34:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrZzSpsC9a1syTPC7Tl52JYJqdAYRmAFICIc9SjAhSQ8cVx5zw0M2m4sOkMcSBDXZli+mKI0BdSoF08hsYA8HQXYFV1UvtZDw+mMLc7fFoLCwov3KOQSx2vX+ibuNsW9dlo47Kt7QWUtn5g0cfJqbnpgxnwsEeVx9xGhE3jKNx89Z5jzuRw1SRFAu3m4D0pSGJ+27CEkfbgt/OjXLnaQLAANankfVM9TFaPKpZdDgVvKggWYZcA0PAyM5dy258SZ/TVEeON+wwWNUgsgLm3P0rGA8y3d/f630EnVhmyig2gFB0nlKAUidqXEkkMDGDhJZPmDSvPd+u9olce0WiHM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhU10mZDu9TEcPQKpZeqsZKzlYSrOqfvxMl2UDkBDnU=;
 b=RFT2ZuunqUOv99MaUCP5wzE0gCU6c75IbelZ08hZEbV/ts7rpRyO/JW7Y8uDQK8LF+LOf6QWTKoBHColtKpObDEzC4iU+qnPFA+Avy0PArB/yS7GXgiC64hej4VOPO9GohiWUgJZ7q3f3QTCy3JARX1xmYgHoVZNWc0HhC0Uw8519hyaNJAeUCFjK2oFidwpxyR7pm1HNACVXtBBzSuCLIG1apv3142BvxtNa370FP1i0G04lwaDj35RLMfssfKTVrBdTFPik7K6kHcyOXGf59KulKfFC2/fwhAMMhQUWljkBxQVs4CxWU++trwYibcQVR2gG6+/3k0vnYUvpkHsog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhU10mZDu9TEcPQKpZeqsZKzlYSrOqfvxMl2UDkBDnU=;
 b=dQ7h+RuIHjO0Ug8DFdw2FXYqhfmXT4S6LEHwYcVA/a4zf8mVIZaIpWJkM4lpo57kuSu8JFQbcqGet7JkBv0rJIt0WNJgGs8naIelUvlb3KScUdU00n/M3Pn5PTfgHbYi2HA5+YrP4VB14OzVumrWJaXhJlzqQo4/wQFtbU+vkvr5QU5McZ5FVgqqCmxOsekAvMmkiItn0qWvKpyPVfDJNabs6oDW1bdoWp4YEyAgr9+aaUj2BQdFRalJmglJ6kGYn2XXt0W+qMiruD44NEZyVotog9z3Sx2dWCL300kgFThb+a92cFxkHAzQxYKTWIQ9bzw0KISpgYlXJrNskl3Ctg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 03:33:00 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 03:33:00 +0000
Message-ID: <cc99ab50-64c4-4ebf-8147-4ebca96ccc41@nxp.com>
Date: Tue, 5 Aug 2025 11:34:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm: bridge: Add waveshare DSI2DPI unit driver
To: Joseph Guo <qijian.guo@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250804-waveshare-v2-0-0a1b3ce92a95@nxp.com>
 <20250804-waveshare-v2-3-0a1b3ce92a95@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250804-waveshare-v2-3-0a1b3ce92a95@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:3:17::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 84475c2f-6768-47d1-4741-08ddd3d0c6c7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akFnS0YzNjNBZ3JHRFl0eVdFMER0Y1JZajI2NGFmWFFsUG5kdXJxS0lwVUlB?=
 =?utf-8?B?ZXdBR00vVjlCZjhmMHVuK0lOUUNTWVZHQTcyUC9OYmZBb2RNbXBVZ0R6elkz?=
 =?utf-8?B?SU5PdS85QVhiekVQcEtEdlRsYTBXN0Z0akYxd3lTTlRCeEVKM2cydkY0OE1u?=
 =?utf-8?B?dGxmYVhFM1E4MHI5aVVuUlJ3aHpwaURzNFJSYnpEV05mclo3MjVjdVpraVA0?=
 =?utf-8?B?Z0pNZm9zUjNoRHpDcEJkeEh0QVVwZExJdTRTVVlVY1d1cFIzZ01Nb3dOQTRG?=
 =?utf-8?B?cVhjZTV5WFlnWDFQUVpHaUIxWlAvV3hPQVkyRXJVUktSZGFJVnlnZ3V6TFZH?=
 =?utf-8?B?b21ybUxuaTRZbTF6VkFtK0NqUXgzTFJiZ3NYQ3lsbkM2djI1ODJsaU14d2xQ?=
 =?utf-8?B?bDlLeU5NbGJJb29NRmNUUnZobm5Ca1ZzcDJYUjZYa1pPL1h5TzVNSG9ZQlY2?=
 =?utf-8?B?L2VOeDFxdTBYQlM0bFhEUVBtTE0xMjMramxnZnJqL1Z1T0dVc0p5NmJZUG0w?=
 =?utf-8?B?b1ozbTR6T0pmb1hmTmJJbkxDcUFvajBPOUpSSFdYZ2ttOVc1S2dZeDRiNjVQ?=
 =?utf-8?B?aXVIRTRwWDJOb3RxdFFSbld5eHUxWDVSOTBMVmFVMVg0bkF6K3B6dUQ5TmhB?=
 =?utf-8?B?bFlUV2thaFhXSGxnNXNhN1FjZ3ZiWDkyNFcrdHE5SUM3bHpwbjN4TjBDWDA2?=
 =?utf-8?B?WC9LeThnaTRtVFRYWFJBRUFra2tZaUtKeHY5NHE0RDk3bTRyRGRCaEZha1JY?=
 =?utf-8?B?WS9BUmZrV1FjbjZqZkwvSXhOcnZYelk0L3kzVzhoVXNvWEhqM2IwMGJzU0dm?=
 =?utf-8?B?dkdoWnc4V3NtQ1ZCS0lDaTNOelNHTnhDL1k5SGQ2SUYwMEU4WVY2MjlSOW9G?=
 =?utf-8?B?cHNPd293eXUvZHJsYktHUkU4TEJpNUw5bzdLNzhCck1ubjFGV1N6dExiUlND?=
 =?utf-8?B?M0daK3gwTXNLdUtYWW1TeWlnZU5lNy9jb2hOQUs2bEpabko5eU00WmVQKzB0?=
 =?utf-8?B?SWpKVTh6b0hMZC8xWkFBZk8rTjB1ZmZHSW1LVDYvY29ZVk5zT2N4NVlwNXMz?=
 =?utf-8?B?T1lxWURFQ24xeE5uU3V0Rm5SVWxhazhxS0FsU0NtbEVsT1RjOUZOMmY1eERj?=
 =?utf-8?B?RWFvSUV5b2gxL1RzTFNUQ1lXb3dPekpuZUZ4aVpTUnU3RFUxTHR3QktOeFhK?=
 =?utf-8?B?bzJxMk9Lbnh4cGRWMmY5U1NmeHBaQXc2S3ZVWmRWTHRPWTR6WXZ6bGFLTUkv?=
 =?utf-8?B?YXd0WVJmay9SbnpNaG5BQzN4bm1ObEVYQk1sQTBjUUFsK0FPaFFHdW9vS2xi?=
 =?utf-8?B?QTk2L2VQbUVIUGhpaHBBa3lDSkl2WEhENGF1SitRUmJyeUhnYnVFaXhHNVUv?=
 =?utf-8?B?VG9BZUpzUlNmbHZ6eTBPM245YnJIbnFyUEFZZ0g3LzFyejJiQzVIeXNUTTFk?=
 =?utf-8?B?bHVHdWZObkp5ZEZHWEFOaCs2Z3JSOTdsN2FUVi9OSFR0UlY2b1dnNTNzZzFB?=
 =?utf-8?B?NXdndzlBQXlSVllDYnYyV2NBM0tSMCtGWXBOZ3lVUW5IODhsRERpWmdBV0Vz?=
 =?utf-8?B?NmZDUVBaVUwrSWErSkc4MFJORU1HY0NJd0JJOS9KKzJmd0FxVG4wYUtSdmxO?=
 =?utf-8?B?L3ZwR3p2a3NoN2xTcklmcTBRVWlOOHZHZG8xZzhxQ09saDR1Z2Z0ZHZ2TTgr?=
 =?utf-8?B?aGJaK0d4QW9sa1llZkc5Wi9BL1VnWnJic0FOR1lkaExUU0dTRjBaalFiVUFv?=
 =?utf-8?B?Nkd1QUdXTUpBYWhzTWJOS1UwU1REclNpYlpHK2piWlRWTGtCR2tOUHFydmdB?=
 =?utf-8?B?aGRZYURqTmNKOWd4REJhb0hPMkRQQU9aS0R2ZVNRRit3VkdFRzVVRFZ5bUc3?=
 =?utf-8?B?VS85dDFhR1VWaFRQN2NkZVF6UHArMlBXZnl6T3VtcXhNZlFTcnlMYUxxdCtM?=
 =?utf-8?B?aGg1SVpDbktuQzVhSXlieVd5WE1vOXJmWjBVWU9HdXA2ZTZiOTJ0SzM2Nldh?=
 =?utf-8?B?ODRmWENsVUtnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?andPbWNWeGFxcGRWM2FOK05oYUIvTnAweWlNVEhoV2hLd0x0Ritrd09vQTdX?=
 =?utf-8?B?b3F1bk9DYkREb2c2Y0VqUjIvZHg1d2piUXVJQURoRmdLVGhRMDByNVkwSGN4?=
 =?utf-8?B?M2JxeUFsb1J2YnByQkNoYjFFdTRVL05mQWk5aTlZWitYQWx0czMrOHU5YlJT?=
 =?utf-8?B?SktqSjRmcDZRc1FTTnVqUTRMU0dTOG5qZ1RabmcxTXVwY1M1S1gwTFM0azNV?=
 =?utf-8?B?Qzhjcy9YVi8xeUNNbXFhS2Z3QnUvQ2xJdHFkMHJaZ2xkajBhd1Z4OXVqeXFR?=
 =?utf-8?B?NDV6cS9lZTFZblVTNk96NWNnOHlSVkxseSszVWE4ZlYzRWNLZ2Zwc1JiQ2xL?=
 =?utf-8?B?M3hKamx0SThic3V3cEpQM2FLYS9pYjJ3Z2pLdGl6d0prb3NrcWlkSWtGelFj?=
 =?utf-8?B?MnNGVVBacFg2bC9tVGNFeTQvVkhyeUJKNDQwM1FKY3pSam90MEVaOW9Ra1JL?=
 =?utf-8?B?YjZ2emNJYjhxcjZaL25kR2xITDRPUGxjMlp5S0NEMlJCNGQ1bmYwVDZ1ZXZK?=
 =?utf-8?B?VUtOeGx3OHBZRGVDMXZWOWYyQlZGejJ3eXlxZ0ZFWlVSMVdiZnQrUWJtZk5w?=
 =?utf-8?B?bjl2OGpHT3d6MGJrU0FERG5tU1RnZmpRdEJOR0ZLRE04d0dQZUlzb0RORnps?=
 =?utf-8?B?TEw4SGo0N2FLZzV1dC95Z0g0TjhGajZlYmR3dkE3MW95aC9sa2dGaHVLN3Rk?=
 =?utf-8?B?R2FydnFsTnlmME4vTlNLQ1N3NDJDaDVWRU03bG52bENhdHp3alpyL29lUHpU?=
 =?utf-8?B?YVlKM3pmWjY5Q29sc1RHaGNuM3F3M0Y2WHUzVDJCdlFhV2NpeWtBUDhUOTJS?=
 =?utf-8?B?WmhwL0ZKNTFQWEt3c3ZGTU40L3VKeFNwWE05NzlMeHJLOTJBU1RjQloxWm9l?=
 =?utf-8?B?SHVNMXl5d2E0SUxOdXZiVng4a3BzSFc4ZktkVXhKUmhKclRzVDF1NlUxWnBz?=
 =?utf-8?B?a1FzNFlMdWROM0ZXc2JnNnF3ZXpyZzdGNHFzcHRZV1QrZXluM1ZkbE1rNUZN?=
 =?utf-8?B?QTJraGpjT3RTOWZUczk2RFpnT2p2RHAwV3o5Z0M1a0cxT1Jac2Q1TTNPSzFq?=
 =?utf-8?B?ZmRaVEhvM2c5emVscVEveGt0eFN1amZMMTJPMFBCcVI5dXhIc2NwMHBIYUs0?=
 =?utf-8?B?cHpsWkxaMDhYbGZ0REk3VnVQRE1KTGlxaVlzYm50TEg2YjNVYnZaZE9jMUZD?=
 =?utf-8?B?bWowNmp2WXEvSDVmTnBRb1NCQ3NxMXVHQTVBTXkvUXF3UHMwY1dXSmJCUzNV?=
 =?utf-8?B?b2dhMHNQLy81ZG5OVWl5cm9nNTRVeitPcnMxa3FyU0RUdVNwN3djU0JIRm10?=
 =?utf-8?B?SDZDSzlZdFU2NXV2TnZ2cDh5Y3RVQmFoUzRwY0JBb3dCNFlWaUl3dVRSMVBm?=
 =?utf-8?B?MS9SUDhNRHNhcW1mbXY3TndPR0JhQjhjUjRRZ1J1cERxaWlPUGtia21tV0lh?=
 =?utf-8?B?MW84aENSenFyaHk2TXB6VWl4OURVOEYxRlY3QzRmbWEwcEJTSHBrdmNQY2tW?=
 =?utf-8?B?M0s1VGszUkZoQnkrS0tRVlprbWZoN0pqVTY4ZTE1WXJOaXQ3YzRGaG9ISVVU?=
 =?utf-8?B?aDhzbStSeWZBQzNIY2NUMzFScmE1cW1naG1BK1BObTV2TU9xUTNadjE3RWY5?=
 =?utf-8?B?ckVxNVRWUFpqVmJFVkdLa0dBc2dJMUt4Rm8xdjdHNWRvOVE0d1lmbTRxTHFZ?=
 =?utf-8?B?MzhwRVdQbDdzdDhRMXhCRjhOeWVTUERTdUVrQ0FEZ1dkaC9IK1FBNTlVYzJG?=
 =?utf-8?B?cVpKZ2M4czVOVmhJeExXelNiS2k5UldpOFRKOHlFYndSeU02M1l6RTRCL2FV?=
 =?utf-8?B?NzhiTFR4Z0FScjlUN3hxaGhZRVhraC9BYXJ5dU9yUnpaUHhhejBaT0lQMEpE?=
 =?utf-8?B?ZWVPM1F3TDFCY0o0UEtZTUNyaURtODBzQnYwQnY0TlhwWU45UFM2MDZwMVRv?=
 =?utf-8?B?QlIxbnJQN2tOMEt3WUIycU5XUnlWSi9vMnJpSmlJc1k1MHNpRk5kb3pCK2RQ?=
 =?utf-8?B?VmNtK2ZLRTdwYVpzVzNoS1l2cWhJMitmZXZuN0xPQ2J5bmNUVE5FSWI1cWd1?=
 =?utf-8?B?QUxlbVF6RVRydmhaZ0tMNkR1aXduMmxma21oRklUbnFiYzN4aUVVQzY4UDMw?=
 =?utf-8?Q?LRC/xqRf+ZMSftU1Ued+i9cug?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84475c2f-6768-47d1-4741-08ddd3d0c6c7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:33:00.1000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pfb/lRc05OIR6wPnMTccRJcWaT8P/LENXM1CJxqzn5n15+DeBQm3BKvBBGCbRZl+EGIJGUn6eRyOnyKOiOE2MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9180
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

On 08/04/2025, Joseph Guo wrote:

[...]

> +#include <drm/drm_atomic_helper.h>

Unused header file. Drop.

> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>

Ditto.

-- 
Regards,
Liu Ying
