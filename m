Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B55B55691
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 20:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE87810ECD1;
	Fri, 12 Sep 2025 18:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="iC3G+Okv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EB410ECD1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 18:52:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTANrkJNYSEzF/p4agd56ub5g50sANNDHegBtbf50FBkOiAOHmAMSOO/hW0mpIneo1sa2cToTWnyrqz3/QM5Zkoi7R2Z9AywV4pgX6Nk3jKMf8an87NuurTOUK5YAjOrHtcGDBD+DxJEiB8x/U8bFudH5/w2753F/TUkHYXzbYOvEUETj5inXFK4971GfM32DIDuQngHAsYZv4ViAdWEuA404NIQ0gKM1jWCY/IxzLSggshtqDogAkiz4xd49QZpcFkogK5GoJqZArMdplIaL6A7IbxxXl6NSsSOU9iU1Olw6qAwQSekFrfM70Yp80Nn4zVfKwm23ftjCZq9JIuGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zO1nMwuha9pKDdyR0lzZUSPos0IX/rXy+1KeQ5BbQdc=;
 b=DfBRIYg+kPqlsZuW1/ihyQtpgndLU599XFAxiK0o1v988RGlWwHkyWDEqGWfgG5J9RLSdxiZqGrdz+Ii9iWiARMSrczJROhoas8QMp0kXbSj9JZVOSV8/Kd1zomK9m4yM5yygIf02LpwY9VuNnJ9hDTz6pqMEm8Kc9gVtRXC2PTbKrkw8achH3rnNRHrQd6P+ZMoX1nmq7SemR2LdTSmpDatUixqo7KR8huAxzmYOt5phTvONRcIlsQbI6L5NKuzth2wsBsFhLsPIXXL+QebTUUA4bzuAMMMYtxOqNGImODZQza/6ZHb/qOZf9bBqcrMygXDQASQ2XccxyTrtV6cuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zO1nMwuha9pKDdyR0lzZUSPos0IX/rXy+1KeQ5BbQdc=;
 b=iC3G+OkvMp1h7FKgUsgvilEMnN8O6/W7o9uT2nkDF0f/+nFuUsnBoTQMKbsmXl+nSywXgs3ImsccOXF6VhcYb7JsY9tzkNGHyrs9WioqhWWOp9FhuaagQ4TdVWrVdxBfE0M/3Bt1rbdSwjlh/kauhKeKabWzhCTGeh2r/H6wAPKFJfm3/w7g3KvTCLXdElJGfFIlB4371EIInsRlVQr5B7UYVToLvbQ2JgMaAooNcPvSJBTQXvuvFAm7n1Zv0II9OVn7PoBEkNjtA0Aiz0vINsSxVXW6kZBqm89aF48bMqwQb1DTOfvIVd5R1kpTY3NfYX73faQfasf/7j0PL4sa5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AM8PR04MB8033.eurprd04.prod.outlook.com (2603:10a6:20b:234::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Fri, 12 Sep
 2025 18:52:17 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9115.015; Fri, 12 Sep 2025
 18:52:17 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: display: simple: Add innolux,
 n133hse-ea1 and nlt, nl12880bc20-spwg-24
Date: Fri, 12 Sep 2025 14:51:59 -0400
Message-Id: <20250912185159.1118209-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AM8PR04MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 340e33b9-3314-4ffa-75f7-08ddf22d7ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUYrWmVnOW5mTkdsS1N4MHZsUmg3QWI1TVRRTVNKNjMwSlVxdEJWcWlNbGFS?=
 =?utf-8?B?d05HMmhZKzJZRWNEaEpjemtwdG9hek5DQ0FBcDRyeW9XSWZKeWxhLzl0Nk8w?=
 =?utf-8?B?cGxENTZNSmdma01MN1hGbEhJSjk5RFJ6ckdhVlkxeVVhR04vdCtIcDVsdGRq?=
 =?utf-8?B?KzhZT0hFUThvbGdDZGVyTE1RYnl4NVRsWktOb1RxVlVKUTNYbk4rZkxnUzA4?=
 =?utf-8?B?Y1lYTzVmbzNqeGdCNUhqZzdyNmJienpISjZlWXV3UUhuRlZEbkMrM0J0RWU2?=
 =?utf-8?B?UWNJRy9GRDdUS1ozZnY2bDQ2dzduNUpQLzR5LzVteEF0a00zSXMxT004ZzdX?=
 =?utf-8?B?eGs4NDcyV1hibGdrYVFUTnFJSXdtNEd2WTErYmhGam5uYXJsOVpIQ1dkMUF3?=
 =?utf-8?B?OFp6RGlPMnduNHBIMEJnZ0ZCUGJIWkZ5OXFWZXNzSHR4bXBhRmU1WUh0WmFJ?=
 =?utf-8?B?RmNSM0FmVENtazdIdUE5YThjVnRjeDIva0ZFb3B3c1dCcWM1N2J0a3JUVVc3?=
 =?utf-8?B?WnlFWllwOGduWGtTSzdDOUF0N09LRkpBVmcxelh0Y1N5Y2xrWmRyRzRtWHNp?=
 =?utf-8?B?blZsaGpaZmFmNGxDNnFtYWJMVy9oL3QvUERFNUh3dDJDQkgyN2dTd2U3RWpQ?=
 =?utf-8?B?RDgwRkZneTNkUlpvanl0Uy81cGpHbnU1UDErZWw2ci9wMXBCaEp0bkxreGdX?=
 =?utf-8?B?c2U1alI4OXJSUm9KYjhuazdqMzJROUhldDFHb2VwUm5KRmo1TGdNc1dNeTdB?=
 =?utf-8?B?MkNEeUZBNEdBUWdqTlVyMHFybk9HbkU5emJ1S25HUGcwM3JKMTV0MzY2T1pq?=
 =?utf-8?B?SW1uQ3lNemY1T0gzRnJSMGkxOTd3c2VkU29YV1RYZ292QmJneVp4emhLUWdW?=
 =?utf-8?B?U0RFSzRRa1B3S2pmdk81MkpVc0ZrY1NIblhpaWJmNXFaVWd4SmxLYkVuVDdt?=
 =?utf-8?B?dEFVMnJOc0x3cW9PdmFBRU9LNTcvTjhHdnB3VUtvOWw0S3E4RkhTOWFicE5N?=
 =?utf-8?B?U0hoNjUwV1puaFpUVUFBd2pOMEp2OFZkb1lpdUk2SGViOC9malE0cWZnNjRZ?=
 =?utf-8?B?M1lVVVFybUY2UHpENGVjZTdENW1VLzlpT3N2eXQ4MmU4aHpUeWVrQlh5Q1lO?=
 =?utf-8?B?cExCRDVJV0xzMW93NmhHYjRCdCs1ZnR0U2VSN25RSkZJN0hHdFlRZXBYRUUy?=
 =?utf-8?B?N0ROT01ISm1KdGxxd3Q1Z1ViRVExR0g2SDhQTkdNRDNTMFJVcmpQVXp6Yk5T?=
 =?utf-8?B?bDNhdVEyNlJhOHp5SGJIUy9EY3VpRWZJOHk5cDFxbW9xaG91V2h1djN2c1lK?=
 =?utf-8?B?d1NNelNJTWtMZEJ2Rmd6QndrN2c2RVBUZklOMXRyakEvckdDS0NJL01rdkRV?=
 =?utf-8?B?ZGhRaGE5S1VQZUJadG5xUVRQQlgwcmlNNk5EZk5GQkRzTGJtMVNQQmxCbWw5?=
 =?utf-8?B?Q01sSjBqdU5nRzJvTVBqRDg1MGdGS1piMTJibkg4YmNMQ3UyVkwzWHRnY0Zj?=
 =?utf-8?B?ZG00TE1lbWd6VzhLK1B6djJ0d3pRSU1UbXAwYTVyZC8wek1peE1kUVNvekI3?=
 =?utf-8?B?aVFQYUJmRFFBT0xia0hMcExBV1pKVnFZeElDUCsrZGVUZm1PdWJ5RzZwSlVF?=
 =?utf-8?B?cVRGQS8xMG9NaWpMMGN4QytnaEtvUmM3L09GOURIVk5FODAzbkN4U29ZaHcv?=
 =?utf-8?B?M0l4MWFSZ0k2K25wQjdMcCs2ZXZyaHFUcVBxQUZVNlk0STlpcWI5OStpOVVT?=
 =?utf-8?B?eCtKZ1NmR1BodjFVSHFIK2hITmQzaVNaN1FrMGlMUDdQbDRKNFJNcFNleWl1?=
 =?utf-8?B?R0hUajk4TFU5WjBZN2xINDkwWVkzL1QxaEZMR3lvRVhNQ3JtT1hJLzc5aCtL?=
 =?utf-8?B?c25kMml6N3ZtWjdhRlVMTDRVU1Z1bE16QTJiTW5XSWpIQ3NGQVNXMkdpM1Jl?=
 =?utf-8?B?NXNuaEJ6eUw2WlZ0ZUs0RnA0ZUxlbmZ0ZVUyRk8rTGN6ZGtibjRmUXoyUGxy?=
 =?utf-8?Q?TE9jWsh66RF5pIw4IgUJcvUgFHRUPA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzBleW9Zb2RrRGVZMU41RjAzenFxeWRBVDVKRS9FWXI0OXNRUld6alpxUXpr?=
 =?utf-8?B?MksxRGIwL09pUi9TbjcyZFNCZkFxalptMG5iSDZFSERFTlI4dytlaDY0aHdr?=
 =?utf-8?B?VTZyYUM2QURDUW12QXNmQXJaaURHL3lKR0p5dEVyaitIKzc1T2w1b3hLaVpO?=
 =?utf-8?B?MUViMWgzdk4xOWNheVZmYUxCL2wxdDN0TDZpUnNKdVFEdllSQlBoUUlvU2F3?=
 =?utf-8?B?ZGhFZVViRUQ4YXhXWXl3M2pNaHJTeVlmemZaQXF3UnlydlBRclFndUNxS2lr?=
 =?utf-8?B?VER2T2JRM1RvNUtKRTBzajU5ZjkvWThhUVJ0NXp5Z0pFZ203Q1ZkT2d6UTVu?=
 =?utf-8?B?aW5XVVJCMi9XclJ5a014MU5EMFRyUis3TWtSSHIzNWtHbncyUC9RNU1oRERj?=
 =?utf-8?B?a2pIZS9LbmF5N3NSdkdjUUNGMzcvQmkxNHJsUG44R0dqeUFtQjdLc3hoWGZz?=
 =?utf-8?B?TDlucUZMMG5XMnE3ZFhqNVZ6RE1yTy9qSys3c0s2Q1JyUjRRdDl3ZW9zUHNn?=
 =?utf-8?B?aG5XSDZtbC9wTTdrV2VHTDMyMUM1UytSVCt6TzlIZ1dnRDNNY1M0cU5CNVN5?=
 =?utf-8?B?czNCMGdsWGdUVDdBSE0wZHlhallkZ3NkK2cyVjJVTHJzdkhjZXFoZkMyMkpE?=
 =?utf-8?B?QmRjK1ZGMHk0bXYwNkphTHFON3lMeEZUMzh5bk5id1pNUE55eTZERlV4SzBa?=
 =?utf-8?B?Uk5hMGVJR095eG1ZZkg4SldPK2tUZSt2NlNvaEZzUGZlSEQ1WW81NTl2bXhi?=
 =?utf-8?B?L0U0R21YRnRrek42S2RLWFhNcXJGL0xwVmJ5V3d1N2FDK3JPMVl5OHZqREMw?=
 =?utf-8?B?VGNHUXNQRElvNGIwMWJUMll2RHlkYUpMYXJVR3BPbDNwSDNVaXJVODVocnlq?=
 =?utf-8?B?TVk1RUppUktrbGdSdTBjWlRENlhIME1xU0Vrd0xvLzhuOVJ2WHI3SEFMWE0z?=
 =?utf-8?B?RWwrSU5Ib2lKdlRhV0hTdnpUN1NCRVVLR0o5NEdNbm94dVBHTzJqZEI2T1Bz?=
 =?utf-8?B?UFhOd0xkU2ZQTWpSODZoQU93NE5mUWREQzRuZ0JhWEpZYXVteEpOb1pReVpP?=
 =?utf-8?B?UVRXK0w2NE5qdUNxMkppb291VTBzcHpacGNsOGYrM1ZnNFdVeHYweFlBclBT?=
 =?utf-8?B?Q24xZUVLR0JXYjg5R0RrdzRVR3dBMjhkbnpiUUo4OGV3UVE0WitaQ1FUYy9y?=
 =?utf-8?B?RTMycEk2YkZQZGptb0hOQmFVbnhEMm9mV2k1azdoSmVxTldKZHBzK3l5UmE4?=
 =?utf-8?B?T05ub0RneVlrRzB4bG1WMWlGWklPeW0wUkFIZE9NcE1udWV0elhWeUs5dWp4?=
 =?utf-8?B?YjdaV2JQS25Qa0dqdUhzQjhMTTF6Z3NnSVRWSnZQYkNwK0hrNGZoZllDL1VO?=
 =?utf-8?B?U2wyRUpLYTRIcUpiY0hEMm52UUVsNllLN3B4djZweU9ybE9pRWFBcTlqSmt5?=
 =?utf-8?B?Z05zL09WeDNaWkxRcUt4U3RpOTBCNlRkVGY5UCtPZmJSeWdmdDhpY0tTSlRJ?=
 =?utf-8?B?cVNZLzFsMlYwVmt0bjB2c3Q4RnpJSk9Rc0xNU0xNdWhnME4yT2ZnbHdBMGFj?=
 =?utf-8?B?ekpobStodThlZU5HeVRNOVJWVlBmeXhiZkJKcXhJeHgvclhxY056VnNaTmFj?=
 =?utf-8?B?YktUMjJwT2FKZUlWNElxUDFQb3lNZVpVcjFQZlRGS3NGK012OHJqaEhXKzhP?=
 =?utf-8?B?aTJPTnZXdi9uUXZUeWt2OEZ1SWZMWnNZeXdNZXY2c1Q5b2x0QkVORFF3NmJx?=
 =?utf-8?B?cWxYVWZ2RzB5dndIV3EyTzBpY2hEY3dzeVh1YXp4OGt3dDdLOTdsS1pTL255?=
 =?utf-8?B?ZVVhU21WRVJ3T3RTd0dHcDFiNHZGUGpra0xhQUhaUXR6bmVweTJ2SU81OFFq?=
 =?utf-8?B?ZmlaRDhCSnR1cTJFTHA1WmlUMXBoZ3Y4ekZwV2xCTW5jL1VLRVBpcVBKQ0NY?=
 =?utf-8?B?ZkYrNHNpaXUyOVgybDhMVEZFRERTQ1NCWFFhM09qaVVZMUpKZXRtVUFCa3FB?=
 =?utf-8?B?anJpSG5sOG1aS0lHYmtLMlI1UVhxaDQ3NTNtam1DOVYxMzVEMzRkZ0NpOFJX?=
 =?utf-8?B?dkViMmdqZU4zRU12ZFpodHI0eUsvbFJwcEhKeGtiS2NGWnYySTRYcFovU0xt?=
 =?utf-8?Q?/ukJrYQsQoGNMteOGWCGR+6x9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 340e33b9-3314-4ffa-75f7-08ddf22d7ec6
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 18:52:17.2384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuF5371iCX49XEopxvB8BZrj8Dsum3s1vIPOoVXObPzXCVXy9SUWRO5L+5dLo6pYwo/PTkWqUsHOvjpgOXzulA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8033
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

Add innolux,n133hse-ea1 13.3" TFT LCD panel and nlt,nl12880bc20-spwg-24
12.1" WXGA (1280 x 800) LVDS TFT LCD panel.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 48344ce74a6e7..742ec6033b724 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -180,6 +180,8 @@ properties:
       - innolux,g121xce-l01
         # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
       - innolux,g156hce-l01
+        # InnoLux 13.3" FHD (1920x1080) TFT LCD panel
+      - innolux,n133hse-ea1
         # InnoLux 15.6" WXGA TFT LCD panel
       - innolux,n156bge-l21
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
@@ -230,6 +232,8 @@ properties:
       - netron-dy,e231732
         # Newhaven Display International 480 x 272 TFT LCD panel
       - newhaven,nhd-4.3-480272ef-atxl
+        # NLT Technologies, Ltd. 12.1" WXGA (1280 x 800O LVDS TFT LCD panel
+      - nlt,nl12880bc20-spwg-24
         # NLT Technologies, Ltd. 15.6" WXGA (1366×768) LVDS TFT LCD panel
       - nlt,nl13676bc25-03f
         # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
-- 
2.34.1

