Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA478D164F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 10:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC1B10E9C1;
	Tue, 28 May 2024 08:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="p/ebaB0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2090.outbound.protection.outlook.com [40.107.21.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9F210E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 08:33:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7oTbd8vRm/2Lp1+VXUV3vmYHMRsw4S4KgV+Q29eOagQPbqf36hGfXNwd00maM6iO8+dyoNqt33ohDWDbK+Gv8/19j/QfEeJSXxwOGpkZanEzFdvhAQzi3G3hI/H3BnSpQI0O6Z2lENUIQou1y5COkut2afIeBLEXixAaOy7AJI6BV5nNaXbCuLnwIn1e6ACjHgcForGYwEol0JGWWp0LNB5jjygAcrmAuoSAaIJ1+mqp+KOHOCoyFUoGhpUjSLoD+/0FbiHgEfmUIjtUXGN8JAVk9zyLJvz6xJwOV+6feyQw/5gmdd8TunQlNt0gn7tes1eMkF3zXoR9Xv+lxVLHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EM9BM7NROHLDTPLPC3FQFnhfeVsAi/mFrMO7Uo9OCns=;
 b=BE0I5wk0WaUO5+ayvy0CEFibL+5oXyiIAA+vMSyU0BR1DjnVlqdGvBD9GsMMc9f6jU1b6ZOsvZEa0pz1tBQ+/Kctopn/kdGM9FciO0c+E0Y0hKFzvRpknvfStRYxykbBvoheq+6hqmLRmDjsWnvzuExIcrvvCgJDWa2h7EjioOMWfcaDWhiRx7HbWgGbvHjeert2q04E4Ei8FFjBo3KIXhtSapqpM2V0vMG0U9cKVqvZCH1RkrrBb2WRZ/USbp91c6oC4uuYGtlZMVd37FT4kqPff0uTsqgCy3gUrCdpVzHL0IMcfqriOC+d0FCyrF/d5kuzytXqVVt2+CuDwGdjqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM9BM7NROHLDTPLPC3FQFnhfeVsAi/mFrMO7Uo9OCns=;
 b=p/ebaB0O9QFOiNpWef91mUgENanmPqzFikHAA0ge3bAf76u048pgvTMiDOmuPtbp3YKosU2iC+w7JD/dPgQUnMY4eZz0DbYLIrZ1Xe2JXKPJEn+ahmD6hiV0pj9WoD/tLcAjnlmXOY05U6iKLTepsliuM8A9GxqiB5z7Ltxy9Kk=
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
Date: Tue, 28 May 2024 10:32:54 +0200
Subject: [PATCH RESEND 1/3] drm/panel: sitronix-st7789v: fix timing for
 jt240mhqs_hwt_ek_e3 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-1-f8351d4a8d4b@wolfvision.net>
References: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-0-f8351d4a8d4b@wolfvision.net>
In-Reply-To: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-0-f8351d4a8d4b@wolfvision.net>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716885217; l=1056;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=7iARjiADrdPjTmt5PCj4o6fziLM4cv3Jg7R3sLbVu1Q=;
 b=gguBnEo7zsQnMt/y4zCmkYV1p4hwvAy+6Yyepu+RJNpZLbMpGxtHXwx1xDrVSk54WpRDY96zZ
 FoaByc25mquCSXiliTt+nMTRxzfR0qz8Rl+7Mvn2gg2M5cQDi9Ona89
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1PR08CA0251.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::24) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|PAVPR08MB9745:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a5c2713-c902-4e7e-a767-08dc7ef0df4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|376005|366007|1800799015|52116005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0l4UTNDVnBYeVljY214WHV3Z1NpSmdGVzYzMC9MSkcxTG11bkp0VmVLNWFS?=
 =?utf-8?B?b2lmajJROGtYUG9ab2orbDl5ZXMzN2ozK0w1UXhCOW5ubWFBWmVtekpkbUxP?=
 =?utf-8?B?RHlFTmFZTVFKN1praGt3eWM3TkRTMG5EQ0R3VDd4TE5WOVVRcWVkbk5PV2kw?=
 =?utf-8?B?UXkvV2pDVW0rbTVsT2NFVk9CWldkTWVDMUZOU0o1Y1Y1Yy9PbXZ6bXJ4ZElZ?=
 =?utf-8?B?V1d1cEJwckNXS2kxaDlhekhObTZNYndCOTRWUWx1YndrTkFTOU8zbVRWWS9X?=
 =?utf-8?B?Wnh3ZStYdXNBSkJrT2VMSkNCVHhIbFlvZE5JdTA4YkEvU3Z3Y3lIODQySW16?=
 =?utf-8?B?ZHIyT1FjaE1IdUIwdDJXWnVrbFBXdWdUZkJpdWF6OVpsWlZlTFV6VzBKOXBj?=
 =?utf-8?B?SVNtbEdMRE9EcFZxZ1dLN2lKMUVPQ1Q3SGgzQjNzL1pHVG54Q1VaZGU2Z1ZI?=
 =?utf-8?B?c01zbkMxN1FrSXZDa3FFbkNNMmZmcDJ1Y3duckJYS0wvT2ZxQ2libmlXM0NG?=
 =?utf-8?B?K3U0QjBOVVhRc1NuUHc5QTZIMHBKNGcwWmhUTTZvVUFSM3oyWVdSMmVtSEM2?=
 =?utf-8?B?UVBnZDlRWmhmbGw3OWQ4ZEY2d1dZZ1FoSGxFTnE5aGhRTEJ1Z2lKOUxESy90?=
 =?utf-8?B?UlBYZThZRlZLYUs1TnV4bCsxRXphVnVBWXVvMDF5Q1gxSUlHOElrTm5oajhi?=
 =?utf-8?B?ODlzOEJab0oxMU1UYUxrd1BMOXNLWHo1MXVsMmhCNE43OUtlNTBpc1IzS0dq?=
 =?utf-8?B?M0R5Z0lBS2NBN0FlLzRIaW43bkZvZFh2R0Q1ZE1hZTBXcGF3a0lkcmZ3djJj?=
 =?utf-8?B?N0dNOGtEV291TG52NEU5bElTSVFPN0wrMm05OVA5NW9neitucytodjdKcW9Y?=
 =?utf-8?B?aGtBaHNqSDFGbmN6QWc1VS9zWGt1TUV2RnpkdUMvOUlUV3oyVHpoRGd0VnFV?=
 =?utf-8?B?eGZiby9zUVMxWXhlWXFUWVM0VWxDQUtOQStkK1NWVEV5dDhwQVdPWDVqRlNh?=
 =?utf-8?B?MzNkc0FWVnZ3aXk4WmRDeFM1UFB6azJFakFodXArOFVSMDZZS1crc0Y1OTIr?=
 =?utf-8?B?TlRUTXlaanExWjgzc0hQdDJBK2t0OUpPbERRQlNrZGJqVkxMNzdONU02RnBH?=
 =?utf-8?B?ODdvRzQvSS9pMU1EUXlheHcwSVQxMlIwZWc0eXI3dzFwVjd0SlZaWXcxYWgx?=
 =?utf-8?B?dU91V0NjYzVmYTRCKzduNnBaWEJqbS9zY3RlTmd3a0s3OFBUemVnWFlxVVVN?=
 =?utf-8?B?VkxWVE5mVGU4YmVzQnpVelR6UllHMXNFWEVxTGswaU1IL1RKZkdweFVxMDdu?=
 =?utf-8?B?SERtVUs5T3AwOVBRRE5QQ3B1c0RmZ1U2b2lJUERmeFllbHBUbnZUTXg0ZEl1?=
 =?utf-8?B?ZldLRHV6TUJKdjNsWlFXWXNFOHJnbHh0dkk3ekpYcU01dS9MMnVoSFdpaWNW?=
 =?utf-8?B?K2hlVzFtd3VZSGl6cC9kMDQ5SzFxcUEvVlh6R0RPM0t5UlN4Z1B4WlNnMUdj?=
 =?utf-8?B?dUp1N2wyWE1VbmVjSlZkSmlHLzlJNGYxMldiMWR3M0VDdHdvdWo0ajJaVGox?=
 =?utf-8?B?K0JqVHhaQjNHazdmQzNOTzhUSmZwZkdqU29aMmVTK3NVWE5QaWE2bk9vUjR6?=
 =?utf-8?B?MU1ZS0NJbTBoaUxEQVJDQnI2d29DNkw2d05LcG05d0t1Q1JLRDUxbGdHSUV1?=
 =?utf-8?B?VlQ0WjVhNzA4cFZqT3RLVmxlZE5za0FJa0ZEcnBFTUFWbXNNNmZJS0NzcWx5?=
 =?utf-8?B?UHNJVHMxcGtPbG01SVF1bVZVU0E0Tm9keFpUUm5UL0R6UzUzNHFRUUpvV1hH?=
 =?utf-8?B?enhZZVNTQmNyRGF5QjNCUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(366007)(1800799015)(52116005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDBIVHlNbTR5TTV2TE1WcEh2dTNZSFN3V3BhK256dUp2dU5hYllWKzB0Njc3?=
 =?utf-8?B?SEdWQzJsckNlWjJiNm1iNmF6VytaOU1QNjBFTVpqNGhGdU80VFhFL2NLOUFH?=
 =?utf-8?B?ZXpFUWtpbkVhTUJXUm5qVFlWZ0ZNUWwwSXdVQlB3Q0tPVmlNOUFVWDJjcC9V?=
 =?utf-8?B?enhsdkYrakFBMThVQi9zSkw3S3ZobTZVNm5QMmUrTkl4ZzcrNUJ5M0J0UGc1?=
 =?utf-8?B?a2V6S1IrRC82SGNyY1BZVk1LSDQvb3lLNTN3Y0FQTi9SczdYcFVTNU5GMUwr?=
 =?utf-8?B?amI2NlNsYiszQUlGMzljZ0cwWHBaSmY3UURCZlpZZU1JbmNwV3RrQTRidkRZ?=
 =?utf-8?B?SDQzbmhqeFd6MDdhcHU3cHFNRDJuMVNXbWh3aDZxRlFuVzljbjhVNW5sMUtK?=
 =?utf-8?B?VzlmUkpHQVpWVjEyMW9EQTZZbU9JRHQ1clNPTW9CRUlhZTd3N2poMTVmTDdv?=
 =?utf-8?B?RlV0ODIzNXJuUGNFcnFqNER3ZUl3N1pmYjdhbVVtM0lKL0RLREV4M21jQVZs?=
 =?utf-8?B?TDU3MUdXbXIyUzRXSUpNbU5tc0JWVFdIeGtaZThHVFpCOHFXZjRQWHNHM0sr?=
 =?utf-8?B?RmVQUHhmczY1VHRJS0JlWUNIYUFKcHp1bUVXbzd3ZndEeEc3VjVoTHcvMGFO?=
 =?utf-8?B?Zk5pY3E2YXFZSUw5MHFBYWEwaDNBZDEwc05LekRMaWtMVUpCRXV5aDNXOVU2?=
 =?utf-8?B?SWN4UnhuWE5acWRsUlZsS1c0N0puMkxSWWlPbkJ2azdwSkJMd3lFRGs0RWRR?=
 =?utf-8?B?SUFEaDdCZ0pXMHJOSDF6VWF1YUNqVkRQTTd4bEx6VzQrQTRIakVtUW81UHFF?=
 =?utf-8?B?U3gwNjVYejJqMlNHMGlPY0s3Vm4xRm9tdFVQd0ZzTnIwMzhxSXNuVmVzRmd4?=
 =?utf-8?B?VUhzczNjbS9MWFZQaUMyTVRxOW1DbTJMc3JLVzJmdnBuaHdIY3hoL1lMREcv?=
 =?utf-8?B?eGNGK3cxTTZDMXBnUGhRbHJpTFVIdjhmS3dJN2JWbnlmN0VCMmV5NSttOW5V?=
 =?utf-8?B?bmd6R0ZNUnFZdG8yNEp1eXI0NzU5bDZiVjlmR3hlZlJQaGo2TEdNUUpYQTlS?=
 =?utf-8?B?RmtXNGxzMDQ3NnNPWXA0a25JTHgwNmw4T09zM3ZFV1pRVW1QQUVFalJqK3Bv?=
 =?utf-8?B?MlJraWxEVWlwRlhGRmNaNUpZYUtNRjRnUWZ5MXBVdVhkY1VmOGZRRVpnL0Ez?=
 =?utf-8?B?aHVucnpISjV6RHErUytnb3hDckw3N0J2R2pxbi9ab0M5eWsyVERIWVVmVEd0?=
 =?utf-8?B?dTlpQ1pRUytOeUN6NE91Nlp1S0ZLZ1lxQWtvT0pUZVprbjJ6dUh3RHRSMHdx?=
 =?utf-8?B?a3BLUVY0L0xtcUF2ZmJ2WUVnOGZUOGdiRXRLeEFNeVhMb3IrN0IxR21WWDhB?=
 =?utf-8?B?Wm1XRFVPVjBadXZOZXlXb0FCdkxEVmZueVllVzMrNU16Uktwb2hya09Xazc5?=
 =?utf-8?B?c1RIR2hxNUxnV1UwNE9kVmhrN0pHVy8weFd5b2tGVVhRR2pmVll2SzcwdWhO?=
 =?utf-8?B?Mk5Od0gwQ3VlRjRvTXNDWElCZXVDNml1b09sN05JQ0JhSVQzWncyM1F1WTIw?=
 =?utf-8?B?TG9VNXdiNS9MNnRjQ0VwbFZWN3h5MzFZR21iYVlLOW9CRGtwNlR2NW1QNHll?=
 =?utf-8?B?bGpOSG9mSm54YkgxWUpPSEdNNUwwci9oSDVIbFZvR3ViZDJDOTlNTXRaVzlO?=
 =?utf-8?B?enlVQXg2V3U2Qi9uWTRoZHo4RlUrcFZ0M0k5ZVJ4TThEeVZtdjN4ME5oeVRt?=
 =?utf-8?B?QktOMHloZEF5c0gzWG5YYXE4eS9QR09MM2lmWVg0alUvazlhRWZWcnF1RjFx?=
 =?utf-8?B?QkhDamhGVVNlaDFXN09zNC9PT0cvZ0IzRHRTZnJoZEduYTVhaXNNWHk4ZnV4?=
 =?utf-8?B?YTlQRVpycHFhQXpCcmhoKzVuVUhLYmR6NFVCOXlENklBc2JGbi9Cd2dlUjhW?=
 =?utf-8?B?allLMThPeXAvRU1SMnZRK2VvMWNodHJGNG5RNG4yT0p1YlN0aEJCYkpPOVNt?=
 =?utf-8?B?OWpnblZMZFRDRWNPUXgyRUxMcThEUUo2MTVkT3AyYUNzY3gxNVpjNGtuSE5C?=
 =?utf-8?B?MW51TFBTaDFSdktIK1FwUmxxM2lUaVVBWUMvWHR2Y0ZHWHM1eGdRQWdUeU94?=
 =?utf-8?B?WWlXMmxhMjV5VzhmLzFQTElSU011bEg1bUE4bkxhcDN2SlFaZ2E1RVhKVFMy?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5c2713-c902-4e7e-a767-08dc7ef0df4f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 08:33:38.4333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qv2RQ4NpB6JiljnYV2YkiX6qzC/zA+pb5a+qvmyY2jrFEtr2A6q+ZcxuhNwXhVHFXx7V3At5QBCAZOOT+OKT010hudH6tJMRtWvh4KsdM4=
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

Flickering was observed when using partial mode. Moving the vsync to the
same position as used by the default sitronix-st7789v timing resolves this
issue.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 88e80fe98112..32e5c0348038 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -286,9 +286,9 @@ static const struct drm_display_mode jt240mhqs_hwt_ek_e3_mode = {
 	.hsync_end = 240 + 28 + 10,
 	.htotal = 240 + 28 + 10 + 10,
 	.vdisplay = 280,
-	.vsync_start = 280 + 8,
-	.vsync_end = 280 + 8 + 4,
-	.vtotal = 280 + 8 + 4 + 4,
+	.vsync_start = 280 + 48,
+	.vsync_end = 280 + 48 + 4,
+	.vtotal = 280 + 48 + 4 + 4,
 	.width_mm = 43,
 	.height_mm = 37,
 	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,

-- 
2.37.2

