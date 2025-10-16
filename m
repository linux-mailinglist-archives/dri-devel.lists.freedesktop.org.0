Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D2BBE15C2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 05:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BCE10E2BD;
	Thu, 16 Oct 2025 03:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BoaZBsO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013065.outbound.protection.outlook.com
 [52.101.83.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EDE10E2BD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 03:30:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbPKLyLDf2pDYNLnqi+1EydqRMLpnaeKS2WrD3Tczj5i056zOElcjtFf3TD7ZOL87Gai/6vflD8SLwI4ePLXHR1wSDg4HcdwIz4na6iuSFLRID0SXhKZRZ87M86uVW5dup2fMFCtmLu8sR/vDpMKIV33KmeqJRiAA9h7Za7rdBEpHIZmtVusGSWfhRxCVb1IC5jdfgTTS0qn7i1kEbkVSKhi0CiV5xnkEHsRTapE2bBQykH6hZV65rbCDS7Tqg1ddFGtlAcnu7YMuSmeLrA0D8XnC7x/uLNFjnQDEcvmWELme5LxgqVWmZtKYMrlFm3V2FNRDizkoM486qFXXK0w9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=om9SatJzuimHylrWCpd1pbyR1izye2nmvP55ZKNKGLk=;
 b=o/kI1TTKPXEoFGZc8kyadFbNtwv4jrOKEyO0WrJqyCLldbOAtnh5J8WZU/zkTgH9JPHptwUADlYX0vfkRFcnWB3pDYirvvelDECrnLh+N4FsZ49v19UBCN7zVbpnajyJJOqz1ALBAfXuaNE8uS1mT86JLGetr9VKW0A2fQLxZICGPBBXnx0LPbZdGCs0/TvqyHgfBW4LVm/idHxiqtxoNBu3zWfsAzFjwAAuchLJLyGgXUDrCqn5tmfg5GLw0VD1PYgMsj/+vOpuST/Z8JfLG4q1Znv9kGivl1vR+kfc4bH21UnaS7GtV3wNIDCQVAxTMehy8c2zvdInIBhiejJTvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=om9SatJzuimHylrWCpd1pbyR1izye2nmvP55ZKNKGLk=;
 b=BoaZBsO+QEMIFFdm9gSy2bGzMGzyL0ndBvadQRwaOF7HTqexxZ20BywbTBhrnHaSWlHPzkAuICc6/PbnwkWZpE97AspyBOsAYbrOIZKeEt/l78SOr8djZZLAP5clQBc2x2qcdRny9AghNjNmaG15GszmCmPnc2x1d55YP8cwUVroe6jbh8/n0k7HnOI59b50n1nJOuRuO3nVB8m+A/f/tzoUSZdCzBQ6goOoGXbAdguvi+TF2J9E1ELsWPsCuwCjLMveUOuqdZBZrF3SsdyoPSQ7CPTO4WsxCsQDajHLvfn3K009v1AGA0pT2m9QuJ3lONA7i0rz1mzXPvZqNDHubA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7710.eurprd04.prod.outlook.com (2603:10a6:102:e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 03:30:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 03:30:23 +0000
Message-ID: <c769adbb-3be5-44cf-ac27-afa669b6caf8@nxp.com>
Date: Thu, 16 Oct 2025 11:30:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imx: dc: Sort bits and bitfields in descending order
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251014114148.43922-1-marek.vasut@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251014114148.43922-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0187.apcprd06.prod.outlook.com (2603:1096:4:1::19)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d0c2dc-a895-4112-c451-08de0c64575e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHZWNVlVQjBhTGNzbDNaWUt5UUlUZk12cUY3R2ZOT01OOHZIajVmWVgwL2p4?=
 =?utf-8?B?L3MvU2dDZVhvMmd0OXdJYUNXaGxROGMxRG1lbHZMYUtQb2psTTNNUUFURDdw?=
 =?utf-8?B?dG9GZUJPS0t0Q0pySFBhNXRNc1pvQVFNZ3dDa1hyM3VyWjAwd09NdlpZSURG?=
 =?utf-8?B?a2NqMlVNYzNpWEVQUVJaaXp3UWFoOWtBWm5oOFNzNHBHMU5RMDVEcFJERmlN?=
 =?utf-8?B?VTFyVGw5VlFDdFRybGNDZE01TUsvem9xNE1XK0lTcDRteTFVZ0EwYjNiaWpa?=
 =?utf-8?B?Z3c3amp4ZHhSQlA5RmlqNThCUEl2WGNPN1JNTGVESjRPNnZoQm1aTng5NEdH?=
 =?utf-8?B?R0xYL0xNT0cxNHNlN1VIVUtOOWxKbGhaQUNlemZDdXpkR1p4UmtrbmJRaEZY?=
 =?utf-8?B?cUVTc1NEcW9MM0Rob3pxbVZnbkVLYVkxUmYzTWY5REJWa2YrQ3EzMmRXcVZW?=
 =?utf-8?B?MytMZ3dwUExmdUNUU01oeE0rcDdEQVBxWlovWHkxbTNQeFEwYVRTZzFzM2dM?=
 =?utf-8?B?Sml3M3NXWXc3dHFaQmdJZmd4MS9Gd0tISWdkSUZoUmpxbFpVMTBXNVk3elJw?=
 =?utf-8?B?U1h0NnlaVHdSOUMvVjNUYndtWVk1ZWVZdUUveFY1ZnVLeW1RbUhuUEpxMk5G?=
 =?utf-8?B?U0VJRmRLTTBhSEsyWjNId3pEam13QkY4S3QwK3BJT1RyRGhmOG1tWXFzQWFx?=
 =?utf-8?B?alNBVC9KK3NMQXhmR3MxOFNzVk9wYWw3TVg0MUp4NVVsWWdtRE55aWpyVlpS?=
 =?utf-8?B?MWNlQkVjbzBzenFjaXYyYWJxdmU3bGpiWDRaOHc0cVhXRzlWcTN2NjFjTHNx?=
 =?utf-8?B?WmZrSGVVOVU5UDA5ajdaVG9rNE90NlRUTUl0TFJUT2liQzliZWp2Q2g5c2hj?=
 =?utf-8?B?Q2xJZDFvUUFJQWhOd3U2Yi9KU2p2Tmh2ZldmNk50NytKK1ZJR1l1cUFwWVIz?=
 =?utf-8?B?ei8xbXloN3hrSVNBdDJtYVFsWXBBanZ6YjVzanpmQ0FpUjBObEtsRGN4UWt2?=
 =?utf-8?B?NW8vdWZTK2tmUjVIWEdtQmhkVi9nK2ZQbjZpaGdsOEJpSHVkRitIM3c0dnNV?=
 =?utf-8?B?dFlGbFQxK21uS0lQVkV0Tkk0UnhCMkQ1UkE0c1YrWXErQnRnS3UyUGV4TjZx?=
 =?utf-8?B?Y3dLMy9EQmlYc0J4UjFuZ1hTZTB4d1R2ZGJ6QjE2VkpIWFFHZjVibkI5NWQr?=
 =?utf-8?B?c1Z5RTVrbXJjY3g4SDlBdnJZbHR5ZUVmMFZjYUVqSXZtKzBzWldTTWNmWDQ5?=
 =?utf-8?B?VUkveFRwSjZHeTVGWjllekp2WTFEVWJ3cWhBUGlPUUZsaTZTNXF4YzFySDdy?=
 =?utf-8?B?TTdHQytwMkJCUnh3RjhNaTNqZDlsczNoL25xcFpiNnZjZkRza2FNS2YzanBi?=
 =?utf-8?B?WVN3UFlHa1BFczVtM0RlWlQwSytOWXc2c1krMlA3QzIrZGRwcGpkMExGMDdq?=
 =?utf-8?B?T1IyRjhRYUVWSW8rbE85TjJlbG1pQzYxTlhjalZ1cEh6VmVSTHNLZE9BUms3?=
 =?utf-8?B?eTV6RlAxSFJBUEtTVDZtQUZibmV0ZVh4bkRqWDdPY1ZHYVA0UHJGdURxL2hk?=
 =?utf-8?B?NzdKVTZHMEtwVTZlOGZVTnl1dkQ2Tk43UTJ6V2JxMEdyTE9sNWcyMkI1Ynp5?=
 =?utf-8?B?RXc0T2pZaXVWbUZPcFNlWFA5RkIxVVRxSjJVRHhEK0RsdkNyZ25iL0c0VEF4?=
 =?utf-8?B?Rkd1eHRiUFJqSUh5SVNoUEx4cTZmUFdnZUdueDE1akoxcjRyNzhwRTlVVVJy?=
 =?utf-8?B?TGR2Qm01NmZiZWIrN05tZ3RzT1JLMXdGNWtIUlZlQkhGZEF2UzV4VkxhbmtT?=
 =?utf-8?B?aVgxU0g5MXJzanZ5QzdtNTNYNVVzU3BKTGUrZ3M2c2JOVDhSd1JxODdvdDZH?=
 =?utf-8?B?dXdjaGMxWjZiOHdvNFUyTWgvTEN2WlJ6NHpKWEZSb3Y3c1N1YnYzYWJHNCtN?=
 =?utf-8?Q?lfqeCR8SlVIoMJiN5i93P5wnovYMQI1o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW1lY3NFWmtFSXdYS2JTTzRjS3VGbDJQUm8xbUlpYlpxSmtpMExNSzZ3c1Yx?=
 =?utf-8?B?VkV3L2ZMK3FIU0l1Q1JyQTR1S1pCNDZtY3RTekhyTzAzc3oyc2gyTjRGbU5u?=
 =?utf-8?B?c2svNEZNdHJ0R0g2Y1g1L2syalJuRnFHazhybTVPY2pEWUU5K3hlUEJTaHdz?=
 =?utf-8?B?d0Jjb0xibXdTQ2l3UkhIeDhEeGIzK2k5OFF4TlM4YUVydGgyazA5VFQraTNX?=
 =?utf-8?B?QVNWZTVvaU5LM1VaZVFhNk5uRS82L252WldQMXBPL0MxQmw3dW54ckdycUxm?=
 =?utf-8?B?TVpPc1JvYnRXY2FucUYrUEI2RWdpVFkwdUtkZ2RiYjV3eE5Ic0lNMFFpWTho?=
 =?utf-8?B?SDExUlpsVzlCeWhTYk15ZWlsR3R2RXBrK1JBV3JFL3J5dzhKODVxVmZ5NFVp?=
 =?utf-8?B?N2JwSEpkWnNRU3hxZEFBQlBoeHhqdk5maXVtNEl1cGJHeG01WkJIRFJiQU5M?=
 =?utf-8?B?WVJsTDVUejkybC8yMWdGa3p1bXMvazlaQkNsVkZNM3RId1VNaks0VHlrNlhu?=
 =?utf-8?B?REIzb3ZWdmh6S2g0blp4K21RSzdhL1E3MVNCL2dTcW54Wnk3QWFsOEtWL2kz?=
 =?utf-8?B?UFV3SG4vTlNQelNsN3ErWS9Rdkt6eWtYVFhOazEzVDJGQW9pakpIaHdianh1?=
 =?utf-8?B?RUt4Z0Vvd1p6cnFDK2FpamloYVQzaEZqaXg3aXRBVm9IRklqOFc2ejlmMnNz?=
 =?utf-8?B?bkxlSUZuc054bWF2b0xwelh5YTVBMCtQNlpVdEFZcGtnckxtaW5vTVJOcGtV?=
 =?utf-8?B?OVFsWlE2amsxeW1wSjh6NW9tSVAvbjZCeFJ4REFiSWVpTTlLc3hoR3hWT1Bv?=
 =?utf-8?B?VU83UENYQzgvVUlhNnR4VGprQ1RIN0FudDhkUGVYNld1SUI0ZnZlRlFQazRq?=
 =?utf-8?B?YzdQUFR1Zm5LekZRRTBiKzZyZjJwUTg3VWRET0RnaElHOFhwNjdzQ3U0Z29k?=
 =?utf-8?B?em4zMFRab0VzdlRIQncwTTdRV0VuWFRoTE52ME9Fc0JzeFl5R2gvSW5teTJM?=
 =?utf-8?B?Mmk3U2VhQXV6K3Q4RkpPaWZ2UHJWM2RwNXAvbFlTV1Iwc05zOFpBSWxLWjRy?=
 =?utf-8?B?cC9YRWJZZlpMYzJiRWp0Q3JYMEpITWtRMjF6VWI3RzdMQ3VBZnRWU2VDaHIy?=
 =?utf-8?B?WjU4eXVWbUpLaWVrdVUxU3Uwbkh1Tm5VcVNJcWMzMUU2U0FvVVJMTTVEdXBo?=
 =?utf-8?B?Yy9WQUVFYm83VXE3ZmpFMVBHMVhuNDFDZk1xNlB4bXFrcmszRUZBaGtIaXIw?=
 =?utf-8?B?WGxvbFNuMWwwUHBBSzIybngvSDVwTDZDWnR6VHlRakV1ck04TUh3bHJzMm9z?=
 =?utf-8?B?NUxmZER0aHlLSWM1YWZZTkRabytXZExkQ2pHQVBiL3NDM0RQbGdwN0VqUDJh?=
 =?utf-8?B?YkorU0RkS1FiYUhSakxSTHdtZDhiOGFYbU1KRll6TDdYR3Ewb2I5TGlwdnZy?=
 =?utf-8?B?eHlmMk5pSDdCQzlGM2IrdDFOOFlIcWtENWxESmpRWFJsWmQybUJ2UklCWXNz?=
 =?utf-8?B?WEs0V3pHaTAyNHVUNGNLUjYzN2lLRlhqSDh6dGl5bC9GSjFHVzJyTVhMbklK?=
 =?utf-8?B?UStRZDJWNXlQYWs2Y2MxdjZoVW1iOTVKb1JValE3cnVZTUJ2eEJWSTBma1Vj?=
 =?utf-8?B?bkczZEJnZFBSRkRpbXRmei9PZmxOVG5MQldPYVNLY0lCemxScml0b1hIekFj?=
 =?utf-8?B?MlF5dVV3b2todDk0cklEczhTS1BEOC95VHFxdXZzZ2QrVWFzbE5adWpLUkhB?=
 =?utf-8?B?TU1oYmVvekE1WmFXbjZhVmU3R2U0NmZUMFptaWo5Q3NDdGk4WW9TaGYzVW94?=
 =?utf-8?B?RVkrZDdBdE56OFVWZzJJc3p3VytnU0ltblhnVDRFQys4K0c3ckRYUWNNTlA4?=
 =?utf-8?B?Q0tuSkl6Zjk1MXQ1UU16NmVTTWVYRHQxcy92bEdiKzZaZWNyNjAwOFR3QzYr?=
 =?utf-8?B?Z1RvNXhQcExtYXFaZHZXdWh3UVVTYlY1bUdHcWVWVml6ajEwRWMwOFFReW1H?=
 =?utf-8?B?dEF1Z3pFMkxTcWFpUm80V21GUW8vOFp6RThnbVhob2pqTDRuZmRtQzB6TFhX?=
 =?utf-8?B?MTJMaHh3MzNhV29Bd1BpVUljaG5OTFptT1Y0QkZBOVZPSXpjTlNLTzdvYUVv?=
 =?utf-8?Q?OTj1Y0N86So9WXLpptXHBpCJG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d0c2dc-a895-4112-c451-08de0c64575e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 03:30:23.7091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6m/9LIwUx9pX7e4pNs5yQazV014bOgi4uLxVPInXi6MEod3ifMTvC/d7kqJfBJiwdMpiEXNhkpke6LrpvpZz3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7710
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

On 10/14/2025, Marek Vasut wrote:
> Consistently sort bits and bitfields from highest to lowest bits.
> No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/gpu/drm/imx/dc/dc-ed.c |  8 ++++----
>  drivers/gpu/drm/imx/dc/dc-fg.c |  4 ++--
>  drivers/gpu/drm/imx/dc/dc-fu.c | 10 +++++-----
>  drivers/gpu/drm/imx/dc/dc-fu.h |  4 ++--
>  drivers/gpu/drm/imx/dc/dc-lb.c | 28 ++++++++++++++--------------
>  5 files changed, 27 insertions(+), 27 deletions(-)

Applied to misc/kernel.git (drm-misc-next).  Thanks!

-- 
Regards,
Liu Ying
