Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045E7B1AC40
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 03:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E6710E39C;
	Tue,  5 Aug 2025 01:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gHrSkkpW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6E910E39C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 01:51:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aY5xQOT33jIJqEwGn4JqE3rnmGR5j8kqgSxjnE/z3mZbvWKv4Bww1U/jlfA63wNfzeH90HS9Rr+XXJb/qGSnFx39/UxOO9NdNjwWxBsRmKTHleB+x+3bMYN9LvrR5y7xbv8DhnwscZnG74QfB6Xm77zlMwxxQk01wqUzFkAY7Z6YQQk6vyv5eQFBircyKxuYdbw8+Xb0jpnyV29GiGcMkxYDezeH5RpPYmmfXH0lXUBUJINnvdjlv0z/sNBa6HiybWroJ+h0QkwJ6M8j8SPn/sxGFKEjY80ZhJKPvLzO75SgOuJMOe4ylmrfPWSQ8CByRZWAcB1BKVhsILU4+GheFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QF/j7b/IK0CKUSi+O0GmvHjyQr+hPNliDR4qbf6LpJI=;
 b=BqIxgWqMggXNaid55UzHeh1Xwgf0gaGxhylndm3B0X8ui/KskhnCt8Jc89kxe9wf83GfuNzn1EeFYHjjwGxm5Pn972pewLc1ijXLKuydSClJ6svq6BVK/IGRYSvyPdcctT8bpKMq1SdkmHS2dqHVpeARZMw5DOLwsbLk+Ba1qvMH6zztXNLML6h1qFQ96c+d4bTzxthx2oF2XTuzJEyNh6WtMSp+IHpk6Fz2OYP6eDOP+Qvh+WydU9eUIau1/oTLfhSf3UY7Y1Zhf0G8/fAeIe1p9N+UQ65g74u/xQupaDH1LYS5OpAgzad9TYPLiofwHFiCC7naBgFrigPrmBP1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QF/j7b/IK0CKUSi+O0GmvHjyQr+hPNliDR4qbf6LpJI=;
 b=gHrSkkpWXaT70XaAuRCbYJC01E8MQbU7aYlSw2B2Db7aaMxlstUdkRPQmBLN4VQd5CP1E24p7NiSnOatelUwBumMn8MXIcI8e5vfPT3XWmsILOflUi2R1oxwDDpSjxh/5sKEwZcKAvbrU4GF5RRKlKb/QXHPkPraDvMCs4lt3LwPZsbzgBLZogi1qRj6nWOx1KMXkV+U70VKeTsjiE4pxnBfJgtN/j4eMMok/melXMEe8iPl4Q8MRa+1jTfl3bll20e8AP7KM2KRCJcNuWeoRdIuqt0P92QNf/aeHVKKv+X9Yn6+Wzbgq9YW06qpzCqr6+YpbhiUHrVe+FriE6pFPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB11037.eurprd04.prod.outlook.com (2603:10a6:150:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 5 Aug
 2025 01:51:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 01:51:45 +0000
Message-ID: <302605ed-d638-4ae4-9347-07ef335f478d@nxp.com>
Date: Tue, 5 Aug 2025 09:53:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: bridge: Add waveshare
 DSI2DPI unit support
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
 <20250804-waveshare-v2-1-0a1b3ce92a95@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250804-waveshare-v2-1-0a1b3ce92a95@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0138.apcprd02.prod.outlook.com
 (2603:1096:4:188::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB11037:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b82a08-be7e-4fc0-b684-08ddd3c2a240
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|19092799006|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTdwMGtjNCt1c0N6L3ZnendPbDZzb1Z2VVAwdkFaNVg4am1RTkhRZStscGpG?=
 =?utf-8?B?d0FqNWdTR1NEdE9aclBnK1FzZHlSYlJBT1dTZFVSNHc2VTRDNjVnK0YzcWhr?=
 =?utf-8?B?c2sxd0hWZmhaZ1lGNjJiMm9JSWt6RnUzZ0Zma25MOGNkMTcxQm9nTW00TjlO?=
 =?utf-8?B?WGgyNzd3SWxhdEJQNzlxTWErNVJSSFcyWTY3dk5tTzRCd2hDZFBkREhRTmFO?=
 =?utf-8?B?ZklDVVVuTVhsT1dITTFBYjM4TTkrelgwS1JiWWNxejNZSmRCbzJ5eU9RZk9z?=
 =?utf-8?B?MHNVU0M4VDJxRFdpNm0zWC9rQVlFejlLNThmUTllY0JaaytZcUdLcm05eU92?=
 =?utf-8?B?VVd5WVNrVktha1BDbXhzU1dOT1AxRmZxbG5aWTcwdFFCTytYYzAyUDNqYlBL?=
 =?utf-8?B?VGtuZlEyZ2xrSFBMYkFhZkhBM0Nwcmh4dUNCTVhUdThHcXdJWnB6ajJDa0FX?=
 =?utf-8?B?dUNsekNwSHFRODRrcEhTdHNmMnNiZG1vcFZyV2JoNXdyTW8rQmtXRWFiekpp?=
 =?utf-8?B?SGtoTzBrcHc1eVRwdWl1ZWx3REhTSmNHMVJ0VDd4OC9XWnRPU3JiK1hBR3F4?=
 =?utf-8?B?cjNXN1NGWkdpRXo0V1d4RDJPV3FCUXAyMkVYRkliME8vWUFucU5aL1I0TklW?=
 =?utf-8?B?QkJ2aHk5Q3NEcFhnSTFqTGloU0E0L1A0ZndOTmdaZ0lpUnFOUlNIY21BekNL?=
 =?utf-8?B?SkVxSHJtbUFUUEhqSWpNNVdNZkdtSnZwYy9teURFcklqMGJJbjg2aTk0Uk95?=
 =?utf-8?B?cW5iaTd5U2VkOWlrdEdGanBtZ1I2R0dYQ1ZnRDNIMXlUTDdVS3lMeGtEdVNF?=
 =?utf-8?B?ejhVcktYMkk1cWt4QlkrRllNVS9SeUg1ektZNDBEMHRtb2tRSVR6THhaOTZa?=
 =?utf-8?B?d1dIS2ZlSmRYVmNWSVFUanFDRjZwMWV3Szh3TCtCRStpWDZsZ28wbE1sSUR4?=
 =?utf-8?B?ODg4d3dxVmNwRVRVTUZURWQ0YWY3QWZoVUlwZjVDZm91YWIzcGN6SGhkbEZ5?=
 =?utf-8?B?S2lLNnpXL21TRDU2YkZ5REJRUUhseUZzd0crZGtCanB2S283bWFzTktRZ1pP?=
 =?utf-8?B?S0lROFpkMTVxcGJ1R2VvZ01zZ29QSDFIYmxuVWFHNng4bkJuL1NhWEhxOVZ0?=
 =?utf-8?B?d2UvUDRpY0dFcWIvZnczUWtGcDE5MHJ2NDVRKzArbVgxREliR2MwZ3N6Q211?=
 =?utf-8?B?T0dTWDNFS0JZbG01N1BJQmg3L0dGVzRZbVhmakpYY0NhcXhZRjhhYnovS0p5?=
 =?utf-8?B?ek51U2k0cGFKNkx1VENTYTM0S2dVVWRRdVIxcWo5MTlSSXk1Mi9kNklBYWtJ?=
 =?utf-8?B?d0FFZjhiY0RBREhoc2JjMGhteGlrZzlGVWVZSCtQcWNQRzYvdm9DMXVqL0N4?=
 =?utf-8?B?bi9GU2p4cS9NUmJZZms5UDQxZDJvTUpIajFnR0ZBWk9xUzhENGlhVHM2S2dU?=
 =?utf-8?B?RWhzdElaTWdrWmR1MFYxMmFjcjk2ZVo0MnlaOEtDZU4zL0NwYnZ0MEJpdUxr?=
 =?utf-8?B?VlQ4a3J5VFRMcWVxSVVqL1RPM2hRK2JVMkdSd0xzREMwRCtqZzkxOHd1dkRu?=
 =?utf-8?B?S3dFaEdCZVlMcEttdXFIQkM0S09zc0FBNFl5b29aY2xyaC9SalNvOFVEK2NX?=
 =?utf-8?B?eUNiWVNhaVpKVS9TS1JqZjRMZENUYkQ4c3pqYmpEYnVjb3ozR2xxb3ZiWXQz?=
 =?utf-8?B?OHVYUFVIeDYrN09zYUJ0cTgwUkVNZUhoSW5uOUNKYnZxd1pWczQ0R2hKNTRE?=
 =?utf-8?B?WFJ3TCsvcUpMUWViaVNIR2l5a0JWU1VtUlhzbDRaWFg4WVM2SWViOUovV2pW?=
 =?utf-8?B?aU83YjMrTURKUHlJZWlEN1RxNnpEZy9jK0tjZzFzR0Z3Um5qeGtvTTFheHJp?=
 =?utf-8?B?SDFEcTlUMnlQeVh5ZTVKMmhidHNGM3JjZUNkYnVEZUZXYzJKNlAydCtEcG03?=
 =?utf-8?B?dmRpZUJFUUtFUVlwNGxBUW9najRIWnF2V3U0V25hV1FzVUh4cmFLaHRGZ0c2?=
 =?utf-8?B?eUN6N01RWEVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(19092799006)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rmc4TVpVUVBPRnpjT3pRaFNtSUZPVXA3QWYrTjJITjA1UmlZOUFJMXEyVjlP?=
 =?utf-8?B?RGwwZVR3Qk1YeURJUHlYb2hHYU9sMW1UZXlWSXgyV3k4TFI3TTdyTDdkVGM1?=
 =?utf-8?B?NEgwMloxcmpFb1JlV0liL2p1ZDZaVHlNZEs3R0RVT0xZcGl3elBvc0NtSVlq?=
 =?utf-8?B?RzZXbVNLNWVRTE02OFlrc0lULzFBUDI0d3V1eit3NmZldXh1aUR6NVQyODVI?=
 =?utf-8?B?TVZZRnVONUdMTVVGTldnRXd4OVlsa2VzNXJXTnVuVVU5TmxpN3k1a0RUODBN?=
 =?utf-8?B?TkQwY3laZHlveUhQM2lJVE9lOTFNNnlnQkgyMTZjMVFRMm9tZG9sVmM0dmhL?=
 =?utf-8?B?SmFlOC9OMjIycVhXR0xkWFplR1dCK2xhSmoyWElHUlJVOVF5SS93MnFWMWsr?=
 =?utf-8?B?aC9FczdqaUZpQ3VicnNoQmFsUFJLYmJuS2pFMXpBSFB2ejZlQXlPN2ZBQ0kr?=
 =?utf-8?B?dE5jQnRDaFIxajM1dC9yeTVQV0pNZmw4R3ZHMEl3VDdKVzduSW1wcDZRWjFT?=
 =?utf-8?B?N0g4VXh6Qys3c2hNZmM5TnJMMkdCUEkySE9MZW96bnBVTTNLN0VLWFpFdHRP?=
 =?utf-8?B?WUpmVXQ5TldGdjgwVHptZUtYMmtaNk96Mzc3bVJ2eG1IZjFNYVdyOTZIa2R1?=
 =?utf-8?B?OUNnT1pDSnd0SFhFdnVpQ241TzkxakhSUWJySlV1UjdFL00wbXFKY3FmSHYw?=
 =?utf-8?B?b0kzZklZTVZWYXBKMTlNN3l4UXVqd2l4cWRwT1hUVGpLL2xFSURuZ1lYSW9M?=
 =?utf-8?B?VGs4MXFQUXE1Z1RmQ3pJdWE5WDU1QUd0VCtaZ1JEMm1JdVpweTB3clNqZUZQ?=
 =?utf-8?B?MTRQTWxSSFQrYTk3ckROMHlaSVhwdVdpczZTRmlvZWQxWUFQdWVvQS96MzQz?=
 =?utf-8?B?V2Q4c0ErUWEzeDhZdDhLcXFSVFhOVXZXZUpZTWtnWDkzdXJ6K2pSKzU5YnVz?=
 =?utf-8?B?T2dZWjBiN2RvTm5MbnFPdytRTE5LZmlncnBNblJqRGNPZFpVcFo3dURWazVE?=
 =?utf-8?B?MjJNUjdkeVh6VHlwSE95cHhMdTBVb3VKRElRREVxUCsyZFBueUhmSCtKa2x5?=
 =?utf-8?B?WkNkNWpkc2xTLzZrTldsUittdHVUZmRpamE4VjlFcENFajZpOHpXYzJaSUpq?=
 =?utf-8?B?Q3d0Wk9zR2pvVVZwd1gvQVpUNmJRbjRzMTh4cGxKbGFlSG8xc2tYVkRQRUd1?=
 =?utf-8?B?VFZTdks3OHB4b1poV29kS2libmtyWGt5am1ZOXg1d1RBNDNVem5ydHJGNXBJ?=
 =?utf-8?B?Rk8zRGJ4Q2pGTzBiSTc3K0pLQWpLVnY5MzRGbUNTaVpvdWpXSlFTc25raUVV?=
 =?utf-8?B?YjNQaXZIQU5jamtOVlR4MWFzcnAxdnpGTXM5T2VVVytoR09DK2VCT0x5L3Vr?=
 =?utf-8?B?bXY5eXlsOHFJQXNtV2ovN2tZTEVITlNOUGZkOTNEbldjZzRSa3JLZkhSaS9y?=
 =?utf-8?B?M1o5UDVhdSsrUTR5VEpSUTJ6ZThCTzJnTElOYlRkZ3JaalVRTCs4OHNOd3Bz?=
 =?utf-8?B?ZWk2MFVQalgxanVpbFhzUVlSTFB3YmQwTE1zNkFGbnJPem9UR3RvUDd4OXJT?=
 =?utf-8?B?dldZREpyRERWVGZEMTlucjNyTEthTWpQMm02OVFKaXBiTzJyOHBJZDZmNlRs?=
 =?utf-8?B?T0pXSUk4b1YwMU1ueGwxcDdDcHJoMklwa0JYVE9pYnNGaTBhTWZuakwvcStQ?=
 =?utf-8?B?RGs0ekNIL21zWG8wRUFhNnJBOGhSZVBBUmk4WUpKb0lHY3NmZ0QxcEJIQ0NO?=
 =?utf-8?B?ZFhTQU1RQy9udTRuaG1pYWhmNitDR2ZydmNSZ3BrZjdpbnYyUkROVlBQcDJ3?=
 =?utf-8?B?UUltMjJIemtGNTJFMHhqV04yM1U3RkxtVFREOGtLUDlsNTBIYm5VaE00dkNr?=
 =?utf-8?B?WUZ6WlRtYWIrZ3ByN3RodlFURE9qRjkvaHRlTDFRZEV6eWFhbXQ1VzRJSWVJ?=
 =?utf-8?B?eGY1MzdlS1daSzhpNWkzaWQwcVc1b2d4NHFzVnJ4RzJ5czEvZ2VVa0RQeTJ2?=
 =?utf-8?B?SHFFNlYrV2hRWml4RHVIS2dnazFXZUxUZ1p3d1RCS2Q0ejl5WE5kZ0gzZmI2?=
 =?utf-8?B?NVBJTnFFdmlaN21LMTJISXlYeHNLNVcwVExUU2tPOEdqM2Y0UG9pVE52dWpu?=
 =?utf-8?Q?cZIVN1Z50NtoqQy94cvpjgRzR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b82a08-be7e-4fc0-b684-08ddd3c2a240
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 01:51:45.7727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSLmb1iHxQQ1E6OsYMf0Bc8aReS3/Ou5dbhNOLH9D8zLNJ3ZaFrj4X3aqqf3DgVRuqir/yBxAa9MczwkQU0PcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11037
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
> Add dt-binding documentation for waveshare DSI2DPI unit
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Change from v1 to v2
> - /s/i2c0/i2c/
> ---
>  .../bindings/display/bridge/waveshare,dsi2dpi.yaml | 103 +++++++++++++++++++++
>  1 file changed, 103 insertions(+)

Suggested-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Liu Ying <victor.liu@nxp.com>
