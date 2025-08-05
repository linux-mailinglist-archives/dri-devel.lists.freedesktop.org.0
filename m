Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F18B1AC7B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 04:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D8110E5CF;
	Tue,  5 Aug 2025 02:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DALKrL3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7684910E5CF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 02:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEUjdTAF75ZirCYx5OmUg3VWL0JQHWbZFUqSm/p7MW/10vhaQZg+rUfpDcrKqLxEbqfUysZf4cJL4he0C4NhZB+QbmU1q4eyamm0C/10N7sZDvqWCAb3Efw5k1qD11iF/BhzRhxYRB9RDWu+Jg6ptYd0bvo8UyK9Xk1/whC1CNzTIy4xnFkTrg4iNlY2vuYdolViCa5IU5lPUeBPrrk1luxMSWC4ZbOzEIxwnLkvxPlIIQwNm+kfpJYh3/zQDXOqsh8Igk7yIviw0cxwvZST09MY41e7/pMHre0ht72CfVofJmuwXNhwEPR1UfE/Hi8PDM7YE/xPgoXG356wqipOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWPwGpOjBFYCKGRRMoFSkhBHy4r8zBLxW5RS/xf36GM=;
 b=rI5hFWZZIwdn2JDhZI5A0GmnXwBZkYFu0yXDL78FB0yg4teZ9Xc9j429Lz51HtBZoa/qx96ziYzTpuqI5uciBFRgP3DEgd+o19izTk1WbdRTgzpum42O1c7qmZc58xtAWt6lryzrMqkKh0bzLsRwc88fOQ3pVuUn/XxdzX59C3bqkFtOxg7elvbrrNytcpBXOgxMsDlZex7eX/MtuaqoZEo7fx3XgrvkjekNARD7gRyfsXdwR7JPJshUT1gLaYK0rf1fNxk1KBr4IyZz6QcTuby28ZROzS859jxSsUd3HFa5qU/Wu754fjXyho5uqCo101yuTKU/jxCQdwfkESoPJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWPwGpOjBFYCKGRRMoFSkhBHy4r8zBLxW5RS/xf36GM=;
 b=DALKrL3hQbs2RlRcTCENkOn2ei9cmQqXeZZaN/Iqi2ZQWm3ogqYJETD0r37SYeHyqKEWeG0wTbvHJKA2G+weuCF+eK9de065x99m21On/WpYlvDaVxAgcozw31UZm3kI2M/zZo9HWMtXf5wYx5lHKaqiXs/MGf6bXnONmfZWEPczC7mt0Myr7PrkxVzbMyjltSFSV6grNwIpVW8beROIE6NzNdYImBQAp4zQi8CuQzgUDt9aKM0lopdXPKlrmtaVqxQwlS9nJFYZmmCtnnK62BcA1ri3fgm0r1ONLhC6D+8d+lI/xhm8RfrI067o16dno8qjMlwmdG7zpQgIK3Gcjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PR3PR04MB7449.eurprd04.prod.outlook.com (2603:10a6:102:86::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 02:44:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 02:44:43 +0000
Message-ID: <76e31dd9-c786-4d75-b686-81ded16afc68@oss.nxp.com>
Date: Tue, 5 Aug 2025 10:46:13 +0800
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
 linux-kernel@vger.kernel.org, victor.liu@nxp.com
References: <20250804-waveshare-v2-0-0a1b3ce92a95@nxp.com>
 <20250804-waveshare-v2-3-0a1b3ce92a95@nxp.com>
From: Liu Ying <victor.liu@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <20250804-waveshare-v2-3-0a1b3ce92a95@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PR3PR04MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c4ea72-1fff-4786-a06c-08ddd3ca0874
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGJ3OFV4LzJsU2dBdnA1NlNXL1FEdUt6YU5CSVNiMUVybHkxWWx2WDVYTFVI?=
 =?utf-8?B?SXJQZFlGL0xSOE5YbFNjSldnZXNnMUQ4cUg2L2MvK1BRWkhFMm9mMi9nVkhJ?=
 =?utf-8?B?cUZ5VlBuVXh4RWJZZDFNY1RBRnF5cmZkSEp3V2xkWHRpNFVtOGZMTFp6cWVa?=
 =?utf-8?B?MmdpeURNUHlaU3NCZHNJeVRnM2hQeHlFNGNDSGFtMjlJeHhXbUFIcU5VN1B1?=
 =?utf-8?B?V2RqSlRtZzBzNitiRDlaQ2RJL3V6STFVaFB0MlBEcFhYcGgxWGg2SnoybVpk?=
 =?utf-8?B?OTl4QXdVREJHeHFPWG16UEcra0JMRUxHWnRoNHk0TDBIMlY3Q29aNGg0Qk16?=
 =?utf-8?B?bWtyZytVVzFRVXJoUXJzanFEcDYxZi9PY2VlUExTMU02NWE3d3FMc0JVVTlY?=
 =?utf-8?B?RE1hblp1aDFoNDl0b0I4RWFDYUNMKzdwN1FUWG5rK2tRTzFiY0x5cjNoYkFV?=
 =?utf-8?B?UGtkUGZESDg3TThmT0FPQmdYR05kY2dQSHgwckFEM0NGMUhYSXhGNXh3cnR4?=
 =?utf-8?B?TG11TjQ1VFhrQjJaaXBnTHJodTQ5NjM1RnpMc1dlMkM2THlObkszN2VvbGpJ?=
 =?utf-8?B?WEE5c0kzcDFkTHBwc1I2aU4rS2tVVXFzYllQUVJ0S2Rzc2tiNm52RE13eW1q?=
 =?utf-8?B?dllHbTFuRitWRlA1TE1PQ2FGUHFzUHFidWRmMm1GcDg4eXRydHMzWG9IUGxF?=
 =?utf-8?B?emdXd0xPTXhUK3lwV1ZrUm91ZHd0bno5bzV1L3pGbGFqVTVhRXNuVzRrUkpZ?=
 =?utf-8?B?ZlRidEE2eUdGcTFzNTJ6bzE4NmlrMXgwWjdWcHBkRXZvdXlOSDc3MEQyTFJi?=
 =?utf-8?B?REFiazdCdXdJN0lTYklpbUFhZGE1TTZRM21nSGdaOVlLUDdRYlV5ZUVQQ3hJ?=
 =?utf-8?B?d0tGN1pYZWpBUG9LTkJNcXc3enJVdEJwT0JOV2hmTlJ6MEYrQVZkUko0byth?=
 =?utf-8?B?TkxzNE5COFlkYWhSNjNITnZNc2VZKytsNE9VWm9ZMkFEL3lVd3JEcER0S05a?=
 =?utf-8?B?K25OaC9hK0p0cWYrY2k2ZGFObkhKSStabzJLZHl1ZVZDeklzUzhYd0ludWtE?=
 =?utf-8?B?KzFEMW1ZVi9CZWZ4N25GblNsalZHa1dRV2dmbEpUWkhNRzdOdXlXNk52ZVo4?=
 =?utf-8?B?engvQnRvZzdoTFpyZTY0YmhWVitlVDJTaHU0RmcydDlSRWgxVVRJQ2tHRCtz?=
 =?utf-8?B?NHczUzh2V1UyNWdwdVlTY2w3OXIvVWYvdk5jR0NLaTFsblovRW9oSkZpVXRt?=
 =?utf-8?B?bVhZMG13MjVMSkRNUWZ6L00zNWRES3dhcUxNY04wY1h0ZzQ4NUQ1UCtzTzFM?=
 =?utf-8?B?V1o1aVpUZGFiOXlsVk9OLzNLWlpFQVpQQWRkZjRFdlorUDdrc0Ryd3hCejZk?=
 =?utf-8?B?eFhNWllpMlRmMWNxc2VGMk93TnlRS0lGUFM1UlY5UUFwL3ZjMlZyYytMQ3h5?=
 =?utf-8?B?bWJ0NXpvOG1na0RROVI1eG5WdVNSWVFlcnEvT09mVGwrWGVmK1U2TVlXcjNi?=
 =?utf-8?B?M0pLbDJhRnlCMHFZSHZjdWFQeXU1Mk45L2FtU3BWNEYyNjdaRkFOWk1ocDZy?=
 =?utf-8?B?UmpzWFhPRTBaMDcwdmZuK1ByL2NtSlF1d0pFWUJ1VGVGajBaUTQ1TEJycEU3?=
 =?utf-8?B?b2hEaEhKOFFLMHZjcTQxOE1FSEo5S1JrR3Z2S3hkQ1V1bmdSM3Q5dW03WWhW?=
 =?utf-8?B?U0Zrb2U2T1pza0xsdGpXZS9CL1lIVmE5ZURFQ0NwTXZ4SHlKRjQydElmdnJT?=
 =?utf-8?B?V3l1LzFHRi9iRmlNb1k3dW1CcUlxQ01wQ1pYclNEaUZMU0RqWjMzUTN4M3RG?=
 =?utf-8?B?ZW56NXVBdnY1bmFRSzlyTmhpa0syTGJydjBoeHlDamkrOFUwUEZSZEpNWEpR?=
 =?utf-8?B?VW80YVExbzhFWnNHR0U3YTVSRU9jK01NSUZSWnVWSXppeUhvV05xY1M5T3gz?=
 =?utf-8?B?QjcvQmNKRXFLampxRnlSV09BV3dDMjJJVkFoZGpxRStoNk1wSlV3bzBqK3dT?=
 =?utf-8?B?cythazhPVWx3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3orKzR4b25ZaGZLQ0dtR3IzVFhRWVo4ZUMrRzlRK1VEYnNpcTZ4eGxlRG9s?=
 =?utf-8?B?cHE1dHhOaUpkWWJ3RDNqUVoxRUhGNUtiOUNYVVFLK0phOGZyZm1mWmZQNHky?=
 =?utf-8?B?ZVk4MVp4QmNlek56OXJFem5ESGJIcUVJUzhreWlIaHVFMUIycS9zR2VacDht?=
 =?utf-8?B?WkhRMHZLRU9aaDlwVGpTMHUrdmlPYUl0ZndYYzZsczUyV0FFNkg1RXdmTUE0?=
 =?utf-8?B?bDFPbjE4NGFhTkNEZ20rV3JHTjlZY2VPNWNpbTdaalZYTjAvMnBOUVJiN1hT?=
 =?utf-8?B?VlZTbDFUa2tDSytpdHYzbldwSy9JRENTU1NjbmZWZGdTbnhoRVhmT0I3dExY?=
 =?utf-8?B?bUk4K2IxVmJxUjFEZlBWR2dEVXlDQXdNTkZzSmxEa2ZwWmJkSmZNUzFtOC9B?=
 =?utf-8?B?V1JwcVovQUN6M0lQR3EyRzVkdFhrMGVwWXJyY3lZWGRjeGVmNXhBTEYwUWFZ?=
 =?utf-8?B?UTVXSFcvN3F3SzBhWEZSRnBYYlRvZlBsNkh5RjFRTUxHUlhSVFBUYkRBL2FL?=
 =?utf-8?B?R3BYQXV4RG4wK3FKTmF5MGNsd0ZMcmthclhWVGFTWjBxVTFmR01PNUlNMkV0?=
 =?utf-8?B?ZW5FTWxtM3JWYmFDMFlXazgwQ2pna05tZ25sNHV5TFNYMmQxOGlVTUFoaUVL?=
 =?utf-8?B?cE8rV3dyZmxEZjU1ZVdnaGpwZXRtalZZdCtsYkJlWlZKZkYrUC96aHlMcWg1?=
 =?utf-8?B?M0kySGY3YUZQZmZ4WWNJU1VGSVdTT3FNLzdKTytzYmRHVG5SYUNydGVOc0Zr?=
 =?utf-8?B?elVJcHAzdVA4c0NaUjk5cEtHTUdZZkIvN2hWV2hvZ1JiS0dkMmRRVFRTNE1B?=
 =?utf-8?B?ZndzbTI4N3BGVmlpSEc5NXRMS2RPZUxHN3BqRkpJTG14Z3ArcG1ZN0VPUFFU?=
 =?utf-8?B?SHJaNVlMWTVGYXVDWFBreDlBd0IxaXFINXppbmFVRWYvck92QUZ5YjAxanBy?=
 =?utf-8?B?OGRlWlJqa3hHMGNURWFWZHZ6YURUT3hpc1FhNHFKOEU0SEpDMFV0VUEvbDlW?=
 =?utf-8?B?YVZWWTZMTitRbU9WK0I3S0NXbVMwM2ZpY1pnWUtsTWNiQ3JpYTRYUURhQ2hi?=
 =?utf-8?B?YVpPQ2YxYmZzT3IrdUhNZ2hNYlBRMWxIVDM2S3RmdlM2VU5jdWE5bWtxTUY5?=
 =?utf-8?B?dmcwOGNjWW1UdFlCZ3UyWjhzVUxmS0VkV05rS01NUGJ6bmg0OXNXU0NvcEx6?=
 =?utf-8?B?WVBnSENuMXN4c0FVRFlTY0kzY0JZY1VrOVFuOXJDUjBVWkVLT2pVWm9TeEdq?=
 =?utf-8?B?VlYwVHkvaDZaZG4rR3VRWjZaTjVueWlCVU5sS3g3NHF2VlNFS1Vzc1VOMVBj?=
 =?utf-8?B?bWQ5WkFhS2pXYzBkN0pGVkFkRWphdnpBRkFkN3gzRDVrU3pwL211bFZ5U1Ro?=
 =?utf-8?B?UGtUenhoc0YzWHhReFdqRmsxcVgwK3k2Mi9EY0hWemRTZmhhT1BVVzFUTmpG?=
 =?utf-8?B?Yk1oendndHdPTS9wOGF5QitmR0xYeFlHcGVCNk82eGNvNkhXR1YzejkvNmVo?=
 =?utf-8?B?Sm1WVVQ2Q01jZENZMmYyTjFzSHZqS0IyamFENFJKY3Q3ZlpFZU5icUNuaysx?=
 =?utf-8?B?eG8xWGxMeDdHS1pkMWVTSEVlQ2JEaHU4eXZ0U1c3dTBTMStxMm91RVVrUGpo?=
 =?utf-8?B?YlhHTmhwc1prekNTNTREcjNORE5qYWsydGVYUzlOVlNIdE0vT0paby9IRDJC?=
 =?utf-8?B?YmFoV2E1VkZVcmhuTzBNcGxtQ3pYT3ljQzlqS3lnL3d3ZmtxZEgyeTIyRzNv?=
 =?utf-8?B?SU5OTWhwWnozb0Q5SllzTDZjRER4OUZMcXI2TTFSekpvb3ZzKzZBdUQxdW9Q?=
 =?utf-8?B?L1hoaW91TDNoNTY4aW54SGxZVkhGaDRvdmhMWWFLdng1d01qS1ZqUG5rZVo4?=
 =?utf-8?B?a1RTa0dQU3psckFzcEprN3VScWVmOG5KRmkzVGthYUUvNW9uM0V1RUpsTVRZ?=
 =?utf-8?B?Z0dEM1ZXYXFWODhvRE05ZWo3T0tjeEV3M0lLTWEyaEMyOC84TjZvSG9zaGlR?=
 =?utf-8?B?Rk5ueU5BWm9tNEJGNXlSWVFBdU5BQXo3Y0srVThJNkpMb0Q2MVI0MjhMWWdJ?=
 =?utf-8?B?Zk9TWEdqTmxoZFVkVTgrWDhzb1NpaGVWNUlRQ0MxU09oMjhlTlROZXIyTGty?=
 =?utf-8?Q?OC1bgLJwU5+bTgRM6I/mUcSMI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c4ea72-1fff-4786-a06c-08ddd3ca0874
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 02:44:43.8808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yh+5txGR1MT61lsG44rFdJEfY5OfftLeefxI3gryhPyk1xtlm1LL5jEAWOVhX9LXBP2cuFaJaUbICOXICCgJ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7449
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

> +static int ws_bridge_probe(struct i2c_client *i2c)
> +{
> +	struct device *dev = &i2c->dev;
> +	struct ws_bridge *ws;
> +	struct drm_panel *panel;
> +	int ret;
> +	struct backlight_device *backlight;

Drop backlight as there is ws->backlight.

> +
> +	ws = devm_kzalloc(dev, sizeof(*ws), GFP_KERNEL);
> +	if (!ws)
> +		return -ENOMEM;
> +
> +	ws->dev = dev;
> +
> +	ws->reg_map = devm_regmap_init_i2c(i2c, &ws_regmap_config);
> +	if (IS_ERR(ws->reg_map))
> +		return dev_err_probe(dev, PTR_ERR(ws->reg_map), "Failed to allocate regmap\n");
> +
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, &panel, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to find remote panel\n");
> +
> +	ws->next_bridge = devm_drm_panel_bridge_add(dev, panel);
> +	if (IS_ERR(ws->next_bridge))
> +		return PTR_ERR(ws->next_bridge);
> +
> +	ws->backlight = ws_bridge_create_backlight(ws);
> +	if (IS_ERR(backlight)) {

s/backlight/ws->backlight/

> +		ret = PTR_ERR(backlight);

s/backlight/ws->backlight/

> +		dev_err(dev, "Failed to create backlight: %d\n", ret);
> +		return ret;
> +	}

-- 
Regards,
Liu Ying
