Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839FF8D164B
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 10:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C2E10E2D6;
	Tue, 28 May 2024 08:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="296MTfP0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2090.outbound.protection.outlook.com [40.107.21.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4959710E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 08:33:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYRxrPRaxE/IOvorY83qBmERyOLwDyYDAo8Q1XND61UBMF7IMKz2cEUSmIz7T/m05lbe2Uz39+1Ivei5VAClWOoNCdGAooqNPjCKcHrqsVLPxgJX9cYTTSpXZ8wFOTI5U85xzqUAgGP/iNBLVZI/OELuUtaciQZvMJqr2jWHpc60Jq8TnUl188XcvVMDFFyMD1EmyR5uSDBSwKldmkRyVSpk43WaqdMLEwcr1ki2HTJQMURti79rZ0k+o/0gajUNjgFG6dRLzY8XpOSoUNpgJQNY4N0fsQ7GhVyRzN5mAwZuAharoxTT/hoPify762oxqpKzOW75p3SujWT0Ygvgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnWdPUJfSNVt9nl7/jD+/UMrJAzarK7hJZi+TS1ehDI=;
 b=lZeLp+hl+n9SnqiT47SBtz/Ys5txLQsGUJOsjrbFoj48s8uwwyot4ckVyZ1pNEvcmi08iv5+scd9AwqShQc+xhfv6VhMYZBcbXOJGwUzf/d42aaKiKpbsMmrEgb4PDeom8sAQB1gGYXTgIG/MTsjkdjWDSPF55hD039qbx/DUYj5DuH/hKiTPLC/FLp7fx2/SdTD7dQdx6JOuMLxpqwVwNcnwCaxhVcN3DDpjTmkbm0BRRwaXpeQj/rhoh3kKqHT2ufQ10yARZ4OPr/PHS6p4yXHL9RN01MXekRhoXGFvXilNY/ww2yaACsqXyzTbj70I9AkzpNX77ojpEh4bnt72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnWdPUJfSNVt9nl7/jD+/UMrJAzarK7hJZi+TS1ehDI=;
 b=296MTfP0UvpMAjkeinholiCnkrhiUvQrtzeU/5VJFWdC9Rss9ZT/EB/KJzOaGxAtWndGIV9XnQAN+1cxTJFmR4GKg4kgEd85cIMVrgfZC1+Tl7fBjVD2GNwZ1ZUXI5h6mzlKalngUZjGENYRItX4hYORCOVimA4jDSZl/J2x8xE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by PAVPR08MB9745.eurprd08.prod.outlook.com (2603:10a6:102:31c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 08:33:38 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::1f7f:ed46:6440:8b38]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::1f7f:ed46:6440:8b38%4]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 08:33:38 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: [PATCH RESEND 0/3] drm/panel: sitronix-st7789v: fixes for
 jt240mhqs_hwt_ek_e3 panel
Date: Tue, 28 May 2024 10:32:53 +0200
Message-Id: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-0-f8351d4a8d4b@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716885217; l=848;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=89NU/HOUVxRsB9hO7/oyFknA7930S9CGc8u97ipy/Bw=;
 b=xFNQa1EB2IAgrOcDZG/3BBiFYANh92Ni8Yt0Z6LwVBf1J7ayHMTxLP9Ir4gm88wHmZvQ/u7iS
 k5RnGS+XJu3CJXyydEOE8i1x3wiTUK2m0okNs/y0yb4ZT9Df7lmSmry
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1PR08CA0251.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::24) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|PAVPR08MB9745:EE_
X-MS-Office365-Filtering-Correlation-Id: b4d2fba9-a40f-4aef-5751-08dc7ef0deff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|376005|366007|1800799015|52116005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3pEZUthRUJNS2lqaHdrL1pQQm5wK0R2T0gxb1JPZW1CZGI5KytXQVQ5djM1?=
 =?utf-8?B?d29WYVd6WFJha2NiUTJWeGdOb3NaeWJyTjgvS25XMVIyV01UK0Q3WlRIQnpH?=
 =?utf-8?B?RlRWWHV4ekt5eEc1Rld1QXJIeWlTaWNCQS9PNjdTMFltYjJOMWRsYUtHdWQr?=
 =?utf-8?B?WUpDVmRlUWhhR0ZtcHlvL05tbXZzcExTNUpQaXIvWjN6K29RUElxSCs5OFBG?=
 =?utf-8?B?dGs5SUYyK2RwWWtTR0lzVFlxM3ZEWk15ZVZzVWtRZktXZER1TEZseTM4aGs2?=
 =?utf-8?B?cGJocVNRMmpJOXFTYURhRnJxbTQwRlNpaGhhVTVHWFFZdzZWa2FmTHJqc3FB?=
 =?utf-8?B?SVdWWVVMSDBHNGNFRnFGLzQxUUUraGk4TEhnRmQvU1owQ2Ixc2tXcXZVOHFS?=
 =?utf-8?B?QXdKM1JCcmtDZ3VNeXd4SnU1cnJpWlFMVVI5RmdMTERUMHNoV1dGTFBIN3ZF?=
 =?utf-8?B?bUd2WUNxTkRnbG5PbnByM1JyajR1dXlXbWozeXN6QkxMUDR4eUIyaXl5OUdj?=
 =?utf-8?B?SVlMb0srZnprL3hBUmsxbnhuem5waTRHY3M0M3I4Ym9XczJmL285V0hMTVUr?=
 =?utf-8?B?VUNvNGhINXd0SHRieFdHZ3VyWkFTSjZpWnlqYStRbm8xUUg2ZHQya2QzQ0RO?=
 =?utf-8?B?aWhaZWVhQ1lGVnRWVm5jUm4yRDVWMHZzaFp4NmpKS1BQNGFvellQaGlaSGp0?=
 =?utf-8?B?L2RxTlMyWXE0SUpBNDBrTnBUd1Z4TEpDazY3MjBib3ZYK3RMK0tsOFlaU0px?=
 =?utf-8?B?czJpZ3B4Qk9OeUtZaFM5YjNNaVdOcUxuS1RobllYTFFyVHFSczN0Wlo2SFUr?=
 =?utf-8?B?cEZmYVBEc1FETEF0ZHdFa2txQlJtTXFESStBdzN2bVoraFFCV3J3MzdFaGgr?=
 =?utf-8?B?cGI1Z2ZUYzhwRzQ5czZ0Z0NEdGM2M3RaV1hpU3pNenB0UG5iKzQzQitKY1d0?=
 =?utf-8?B?dUV4ajFUckIyRFp1eVFiMHFNWjFGelJOYTJTQnkvcGYzOXJ4WGhFUjNwR2p3?=
 =?utf-8?B?ODhXSDRLcHN5L2dZbHhVSlZyWTZBeVlBQXN4Y211eGlsR3hTWDhrVmhzekRm?=
 =?utf-8?B?blgrcktQTC96bE9uRmM0RnkwYnVuajdPaXY2eVRxTFVEVUVtakhQdEdrQ2d1?=
 =?utf-8?B?RUlwK3hNcUFWRmxxWHQzcjNoWFBlclBGY2xVTU9ra3hFL29KU0R3bmdOSlEy?=
 =?utf-8?B?MCtTTG9lNkhZTGJ3S1NkYVIzcmVsbUJneHg0MWxMQlp5UnpDeDRiOUdVRk13?=
 =?utf-8?B?c2ZRNUdmd0tMb1R0UG0yKzhWUFRMVTE0TGo1TkJSNVNKaWFXNExNMUJaaGdh?=
 =?utf-8?B?Y0IxRXBOTjdzczh2YzNucHFac3JHYWMwem1UcGpMZnZDN1dGVkVYbVFUWnA3?=
 =?utf-8?B?Rm1ETE9uM1laejFOTUlHWmt5M1Y4RFNOcmJ2OW1JUk41bjNvVW1kcEdJR0k3?=
 =?utf-8?B?U3l3Z0RaSkV2Q0JzR2RLRVhhY01TN0ZqeitteHBVNmY1MUdBVFY1elJXYm1P?=
 =?utf-8?B?TjZXOUFTNE5xYWRZelVuS2xJbFJ4UHZzOFhiU205ckxEdWRUSHRaRjNnYlJY?=
 =?utf-8?B?RTVHOWJKam4wWjNTZEFXalVHSWx3Q0p5NXNLSUVMS1prZ2lMNC8xNVZWczA2?=
 =?utf-8?B?ZkpORm9FeXM4MHBDaU9KSE9hcThHRlVwZjdUNm1WSnBabUJzS1BXajdlR1lO?=
 =?utf-8?B?eVBaR2xGSGF3L0JBamJ2emsyTGFhbFNaaER4aUdZaHlCNkNnOG5XaExKeU4w?=
 =?utf-8?B?Wk5zczJHOHRENWJzdi8vRktzNUtJU3RvckY2VURIN0pSaG53dkVac3dRRDY0?=
 =?utf-8?B?RFpZOWpjSjQyVFMyMkFzQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(366007)(1800799015)(52116005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmcwZ0JLZjZRUUIwd1h4a2VHTUhnU0Z4cXJpelVtbC9TOHo4UlZlSVAvY1F6?=
 =?utf-8?B?Y3lFYm9zcHllMXl5SnFPRHRnN3FmZlA1S0tncHlyVm9PemJYaTNNOFZUQkFk?=
 =?utf-8?B?UExITnRrZmhBUVN5TzlnalEyZGdXTVRSeGUrQ1lhZ2krSzA3eHpwQjNMYmxo?=
 =?utf-8?B?T0RESngrZnVIOEd1QXNlTzdOU3JYTWpNa2w0N3BHN0RVdnhzdktaM2gwZVVa?=
 =?utf-8?B?K083VG5NbGh2eHVuTDZSakRFY2ZydldkL3dnRjdUY2t5MVloR3loT0JSNFVK?=
 =?utf-8?B?NTVFMDJwenFYWVRzM3F5Y3A3aUQrQlJOMEErajFDQ3ltTDlmd0xEa2pSci9j?=
 =?utf-8?B?WUJKSWFWb2lYbmpSQmJwMzBkK2NJbGZ2anJYSFJqWW5BLzNQRHhtakhsUEov?=
 =?utf-8?B?ay9qbUg4VWVhdlVGd3F0NVZrbFNUVEtRZDU4dlBodm43cmRsOHB3WUg5KzdU?=
 =?utf-8?B?VC9BeEVDdS9GdHRkNEc1c0dDZThmdXQ4UUFSUFd4NEIrVUlNdFRFaVdjUHBL?=
 =?utf-8?B?ODIwTjNSQ1Z0cDlFbEJnTUFGenBVMVh1U2VSU2kvR2dPOGVqMGpKNll0RTZ1?=
 =?utf-8?B?b2RWWExWU3JDQUhlcnJzRDR6bmI1N1JrbWIzMmtJL25uYmxsMVl4a0szS1po?=
 =?utf-8?B?N0lsQ0VRanFZZEt3aE9HRkt0cTlveUhnKzBaT3FMaHdhRGhOb3pKMVFFR0xD?=
 =?utf-8?B?SjFHdlFJTVl6WFhPZ0xidkQ0cnRKNTdzU3hLMXJzamVWbE1RZTJwWDlWQ1lP?=
 =?utf-8?B?SVdzd0ZuT044eEFBWkVvR0hnTjZNVUcyMTYwUEdQUHA1djJiVW8rVnc1dUlz?=
 =?utf-8?B?RzQ5Y00wZTNvWG5xb0tWL2pyMzRyZmxzVm5HZmo3SHFOM2FuM1hud0xjbFJI?=
 =?utf-8?B?NTZRcGJ6c3I4cmVaRVNYVHBzYkVudFpxMnFVVGFJOEFSYWhlZG55S3R0UEVE?=
 =?utf-8?B?RHRmRlpSZUNlR09KYTdQNjYrZnh5cFFXczhzc2ZvUlFYMDdoSVB5VXczdm4v?=
 =?utf-8?B?Yk0wa2NFVVo2NWhKV3hydnNiYUpCU3VhVUNsd2k1ZlBLWExYZjFhRTU1akky?=
 =?utf-8?B?QTYyNUllZ1g4dHB3L0ExVjJ4RzR4elZmejIrdUV5SFVNWUVwUVVPTytPcC8v?=
 =?utf-8?B?YnEzc1ExdS9zUWRlNkVTeXhNYU9NaW8xRnZNWnhmb2J5QkxaRHRqak14Qmwv?=
 =?utf-8?B?dURUOFJtOVFTdmNEOFJsZWMwbFNvb2FRYUthNDA3NkVOT25SQUxBZlJSd1lL?=
 =?utf-8?B?cThEbUhOaG9DM1V6d011SmlZVEpESjdsaCtIRE9HQXc3RXJpY1BnTXhMcXcw?=
 =?utf-8?B?S3NXY04wS1dMMWlqa3M5cjd0K25aSFZ3OXJKaGN2QS9wb0lqNkR5b0hOTW55?=
 =?utf-8?B?K1BTRzlhL0RudVJUQjZLZG1iNWR0ZGhTYmo3M2x3ZW9ZTERMdVlyVGwrQ1N0?=
 =?utf-8?B?V1Y3OUFCYnZtVGsxMnFuOVpEYW10bjE1MlNQVnIyYTJWRTZGVFFsVkpMZHVX?=
 =?utf-8?B?VCtaUWVsY2tGbHlJMWtiaThBMkVwMU4yb2NhTkJKN3gydDI2VDlsYkFnVVhE?=
 =?utf-8?B?TWw4UjhNSFlPcE9RSXRjeThzZExGMXVKeTEzTUlKSC9JdFNPTUttdFJTSjVu?=
 =?utf-8?B?UFFveUdhckIwS2laWjlzcm5nT0dHVm9ZeW5wak85YXlidXE5K3NzZ29NQmRl?=
 =?utf-8?B?T0owWmhKNjVXRDNKUzQ2cnU5cERMMVJ5SmNRWm5VRnNlOXdRRURBNmkyQWw5?=
 =?utf-8?B?NHdrQzByZUM3RGlITlhHbzlEdkRjVU4zZG5BNHJWVE84ZkJPaUcxMGFpMzdn?=
 =?utf-8?B?VUJJSW1RZlhKS1BIL1hzdFdxNWE4alZwWENUVGh0WW9DdEtwM0ZoMUxRWEhV?=
 =?utf-8?B?L2dUK1RZZDRSbHVmM1BlM0RKNmp2VTJpQ1pHZ3YrbjRSY1daT25sZW1VL0xw?=
 =?utf-8?B?K3RjdmJNdlVlMlBRTEMyWEVIOFRHVzkxcVl2M0t0R1A3NGtyMk0xYTcyUW42?=
 =?utf-8?B?T1ZIYk95K3dWOXRLcUhzZUlLRENNcmpGVFVZL1JPK3lzTHJ4ZXE3Nk1BLytu?=
 =?utf-8?B?L0dIUElxSnB6UGNwRnBSODY3bmRsTUQrQ0pVV0p0ZElyNk1paHJvYXhGWlRD?=
 =?utf-8?B?VU1rS2hLQmpvenFUeGdDc1oyeVpORUVUeXZrcTBvTVJRbWlNblZEM2IreUF4?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d2fba9-a40f-4aef-5751-08dc7ef0deff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 08:33:37.9354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OB1a/m7E9sXT+JOKgQs3CM3AVL2XyOg6Vo2yXNtLggyejzRQ2/v5BPKI78gjNOBYO9H11lQ0W88psw6fNwxMtQpaC7aRZtKEkg7c+q/3IJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9745
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

At the jt240mhqs_hwt_ek_e3 panel, noticeable flickering occurs. This is
addressed by patch 1, which adjusts the vertical timing. Patch 2 and 3 are
two more minor fixes for timing and dimension.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
Gerald Loacker (3):
      drm/panel: sitronix-st7789v: fix timing for jt240mhqs_hwt_ek_e3 panel
      drm/panel: sitronix-st7789v: tweak timing for jt240mhqs_hwt_ek_e3 panel
      drm/panel: sitronix-st7789v: fix display size for jt240mhqs_hwt_ek_e3 panel

 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
---
base-commit: fec50db7033ea478773b159e0e2efb135270e3b7
change-id: 20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-d26983703b27

Best regards,
-- 
Gerald Loacker <gerald.loacker@wolfvision.net>

