Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7028D164C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 10:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E0A10E5B6;
	Tue, 28 May 2024 08:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="kNREzoFi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2090.outbound.protection.outlook.com [40.107.21.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0006E10E5B6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 08:33:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrFrMT6Ggx7XK63TDsGrCUuR7Vrmlkey4CsDyxJBS2RoVy4Cs07T3k5CKKNNCujs2uFxf7ojv5r39xW8GIjxAm/45MLjtv3yPgFUOYK4dFiG7o5MqFWk9NrU7XP+Ajrdb+x+XmFlvZkTnTOw3LSsCbOJQQtZoQIFysQrGRxa/WfQnGdL/qwjk49Vq1Cjvc7zEvYMxyhij5Qsp94vSKrv61pFzXkQO2xSCx3Dvy0bmnAtiNYmWoSgj+CcQGFf1emqKd4U2NIGC5pfHK29A7ZacENfIxaPuskHgHpbRqw5Pz64UAM4yHGqIKw/gA8DMY8+6zUCzX2FEq3g3YjODx/uOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9opRFzleX7w0RsgDIjAUz6Mwuc/zJwkYCLstivxccEc=;
 b=e8rm0SSKN4DAyq3ODI320DK2QSrVfd+n57m1+iBZTijsBcV/17Ps9XtxLbSmNd9pK4iwqFLCjt3SIMaQqT9RquIXQ2Slewdv3cCtVHmN8M3kCbCApKkcbUqHS1aliJn+R+0sg51bkpqlTbX1ojnHo7ZH+No8T2kWdoIpSQyXzPzqL3pMa5ITZ0QIUCH+0Y7OwpPyWVQ1nLHaHdvGqt4GkRuSVxfLGMC+KohKELlV1GeMYTqCaENR/xmSnW0aAQ9jJWjUT+OlMXaUlGbIJ3x67fLgtPeC0zZ4rcrL6tCQtbJ3ozTY9PXXIopG5mjpTyg9WPAjlAk7nmsS50Vc+GzfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9opRFzleX7w0RsgDIjAUz6Mwuc/zJwkYCLstivxccEc=;
 b=kNREzoFi22xIJjJqtIu46Iluv0I8+xwRZNboVgb3CutTyjt1kf4zxYfiBu3mxqjzbNOxCuGusi1UXdcNBW3E4c66oulcGkrtSjadDPdyaY7FOGeJP6Z8fOPugFYKPI2MmIx88Ok/HbVN6IbJWBw7Urj9xijyVHZjJdYc7RhLgzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by PAVPR08MB9745.eurprd08.prod.outlook.com (2603:10a6:102:31c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 08:33:39 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::1f7f:ed46:6440:8b38]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::1f7f:ed46:6440:8b38%4]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 08:33:39 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Tue, 28 May 2024 10:32:55 +0200
Subject: [PATCH RESEND 2/3] drm/panel: sitronix-st7789v: tweak timing for
 jt240mhqs_hwt_ek_e3 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-2-f8351d4a8d4b@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716885217; l=998;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=L75Ahzdg028IAtu+zqtyqJPYqEpvooArWModEJr1xcs=;
 b=BSgOJyDgREps6kb/Pqy/+VdWQBrz1dtFJZHYE88aZIg0WohfR3iyGO5KR7UUM3E7O0gYbVdI4
 fLK8OBW/2WRBlzG2ThFcP3pnSK0oc+OCuMi7AIudHNVxPuewEoxJf9A
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1PR08CA0251.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::24) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|PAVPR08MB9745:EE_
X-MS-Office365-Filtering-Correlation-Id: 428d94f1-8b05-481e-7963-08dc7ef0df7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|376005|366007|1800799015|52116005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGd6a2NPWWZLZDdwQzlxbEl2Zm1ybTJCWFJRZkgvNUl2Nm1TMlpVTU9RNzR4?=
 =?utf-8?B?WHppUGI0VWZGdDJaMWYyT0pkZFBQUDRyUFRvUi9udng2YmpuSTR6WkVKcitI?=
 =?utf-8?B?T2VyMHpPbVJrSUNaQ3JUTWpxNU9ITXdBRFNYcHV0cmUwYWFmN3pQZzlOOHBE?=
 =?utf-8?B?bXNEeEdlM0dJbHAzUGRjeDY1S1BHYjdlNjl1M3NnQjYyWVdxRHM3TW5WYjRD?=
 =?utf-8?B?ekdZODVGOEsxeU9sT3RueEFpQktxZkg5NkJkNjV2R3lZMUxxbFFqblVkbEVW?=
 =?utf-8?B?WWFQWWZPdW9BSEE4bGZ2VDRmN29VUXRaYmN0SG5CZHArZTVPUENZbHQva3BX?=
 =?utf-8?B?bXZzRmVncnVWdzNrL1Z4ZTkwQUs3VlllclNSSmExYjdad2VHcXVUTGtFOXRo?=
 =?utf-8?B?NWtuemRJL0pDV2lEOXFmU1l1aFp4OUFZWFdFRjB2Z01ISlJ6QS9xaXpDMG0v?=
 =?utf-8?B?WEdaYitCRzFSUUhKN2d2dktHUm9mUHBpdW03dWFVV1N0eGhiUG9jdndraVZl?=
 =?utf-8?B?eG5Jc3hJT3JmRG9LQkZLWHcwRTRKVzE5Q2JyN0pvcVZFNlhLSTBWRGJaL2lV?=
 =?utf-8?B?ZGYyVVNJQ1VKRjN0NlhYS0tpUGNJRVFLdWl6WHk1Ty9Vb24vc1lXOTVKWWFZ?=
 =?utf-8?B?b0h4Ny95QVRzSkcxUW5sbkMwQ252RU5ZUVo3Y0JHL2pieTEyeGVwK0tIN1E2?=
 =?utf-8?B?dlQ2Q3NRVXJ0WnhSZlNYUThvREo0Q08zeFo3Qzl3dWRJcGJuVjVBSnl2SUNq?=
 =?utf-8?B?bE1kTnMyUiszcjRXUE9aK1h4UHRsdHZvRmJnWjdqT3hSRmpzTFFFRTJ5dWR2?=
 =?utf-8?B?ZzJ4cm5oOG53TmpSeVF5Y3NaRWd6NE1XQU5iSHZZQjlYYklUeTQySSt0cTVi?=
 =?utf-8?B?bVNaQ0JPb2F1ZjdFTGlHa2VTQVE5YjFhbWFTTkc4T0o3WjJoZ0NOOXVGRkNT?=
 =?utf-8?B?OTUxN05YSEVId05xSmZyNFlaUWp0ZStWK0pWays1WDkxRWpHdjZIRURnRmpj?=
 =?utf-8?B?WE5meVI0bkVCYjc0Qy9uNWpCMkRvamlKd0Zydk1nL2U3TDcrY2RVM2FZQTg3?=
 =?utf-8?B?SXgwd05QTlVBT1BiSTZqd0xXUHY0ZThOa3NWdTZHMFFzdlcvcUJLbGVCWC9W?=
 =?utf-8?B?NUVuZFd0NVBPVEFmL2J1RWxabWtuM0V5bGpibnpsQU1oR2pKV3JlU3d1bFc4?=
 =?utf-8?B?NEdvaGNpZWNpL0QyRUlqTk56UVBZZ3dXUFdMM1hCZnhpQStzbHpXditVei9r?=
 =?utf-8?B?eVJUZW9tRk9zS1UzaEN0N1FwUjUvS2wzUVZxRFRITVR0aGtqVDNSckZQemo0?=
 =?utf-8?B?N0preUplZG94dFlueXZSbEdHcXJyYVFUT1VnRko0VDBDZnFyMC92dTREVXdm?=
 =?utf-8?B?NCtFclNJT3dsaWxpNTFpQU5lcnozT2QwbHdUUk90V0dsd0FFZnNvOWZDVXhz?=
 =?utf-8?B?VTBxK3JCZk9EZWRGZytiUm5JVFJ4M1J5eWcvWENXY0ZLd3ViL3FTbFZTSEJL?=
 =?utf-8?B?R2NnemVNSzljcGc0eElldXByWlE5ZXBjSTFVNFNtNGZlRU51RmdYanRvRGdZ?=
 =?utf-8?B?alFqWEJMWS9rOThiTlFoSlRSVGtkMkVMdzA3MVppNGEyUDNDSWVaYTZuN1Rx?=
 =?utf-8?B?bWR0R3RFaWxQVng0RVBnTkxyN0tOK0puTGVFQm9nTW8xNXgrcjFxZWNNWngv?=
 =?utf-8?B?azJjQjZ3NzdSanA5Z3Fsa3ZTSlJoRmwvVHFjdVp1RjZjUDlMQWJkYzlvMVg4?=
 =?utf-8?B?NEFaNFlCTkJ1dHRYOGcyWjRsWGVscGJaSXJRekVyY2FnLzBNdzFNZGJrQzVR?=
 =?utf-8?B?S2ZhQUFGelo1d0ErRFZWZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(366007)(1800799015)(52116005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHl4K2JzQ1QyanlKaGVEV0dGam5ud3RmT01xRkNFSWNWN0s4UjYzNFZPU0VV?=
 =?utf-8?B?M3N4TWlZWjZVY2hualJaK0VjekR5Z0xlS1BIa0d2Q0labll5RDl5NmYxVXJa?=
 =?utf-8?B?ek5iVW0rblNMNnA2cXVLRDd4R2cwcmlUK3ZZUm9CSGtMck80OTlpYkxiYTVZ?=
 =?utf-8?B?bjNxMStsWFZqVWhiK084V3pOY2RDcjBQMkxOalNnSTF6TjVLbTk5Umd5WUpJ?=
 =?utf-8?B?RkJkMFRMNnV0a2xHZ2pjYTJTR3Y2bXhESlVYZE8vTjVSNC9qbkZNTTFsY0Nv?=
 =?utf-8?B?NHpOTlJ5TjI3d3Q1MFI5c0hXZVZCUDM3bzBoWnl0NzJrQllmdFVoY1BPSGVY?=
 =?utf-8?B?QXlYK25pYllWTTJ0UDNoNHU5aENyeHp1cXNJdzFrWXo3TzA1dkw5OHhGTmg4?=
 =?utf-8?B?RUNPRXNGbHVYYThPWDRiSVpDekNYMklwUEk4cURlRGpJU0tnTkc0aFZsY1ZY?=
 =?utf-8?B?a3RzZ0NjRHRFdUFaQUJHQ3lqTEhGVDgwQ0VXTWRuaFlnTjY3VXFnWWxvb3ha?=
 =?utf-8?B?SkRvWWQ0QlZ1b1MvQm5EOFZvT01OcElpK2F4aTROZzdSOGhHQ2JrRTN4cHd4?=
 =?utf-8?B?SXlINjZxVWZRM1Z3MVV3RWhWS3FndytlUzRyNG91YUY0enZlMXpWTU1FaS9R?=
 =?utf-8?B?Qkl6M2NGd1RZVEZqTWY3bW9oOXp1SHZjZ09OQ05Ib2tXZVRGVjRINHc2M0Er?=
 =?utf-8?B?cFc3VVAyMmdlNXNVamdHUmY5Q1QzVGlHWmhjV2M0OHpqVm1MZnBwNkFZelc0?=
 =?utf-8?B?L3pCNkVIVUdsRjB2Ym16TlNTOHA5cEw2eDFHWHpTbFhIc0gxNjFKSHovcnRk?=
 =?utf-8?B?QVdpajQ3MTY4OGp0QWNjMjlwTnJqUDNEcWV6bWp1aWZRZGptQldiWjVDOHB6?=
 =?utf-8?B?WXh6WE5HOGpVaXNoM1FrMmhTMHc4ditOYUpsZnJsc1hNVVdaRzlQWkdrZXBU?=
 =?utf-8?B?N2tmYk5TWE1QYjNSTndvTXM1VG0wN3pybjdvanRZUXZtN0FhcSszK1E5ZU4z?=
 =?utf-8?B?VlBvenRzL0VUSTBSRmZXVU50V0U0bHB1UjJEWElkV1hralg1eWs5WXFncWND?=
 =?utf-8?B?MHU1bnZQTGRkMmJQMTNJeE1sbjY0Qk43NEhpclNLWTJPWVFnbEFPeTU2bmtx?=
 =?utf-8?B?bDlkaVN3Q0w5WU9jVit4Q0NWRmdVME9vVWpYNnBIZDJtR0tEZVYxeTFDNTlO?=
 =?utf-8?B?OWlUbzJoY2VvQTZHNmRuZHpHaUUxM2NVVlhZcVM4VHFxb3RDYTFtOThIZ2h2?=
 =?utf-8?B?aXlFTEhuK01HYWM4NVNoSWNRSFVSQ3F4RDk1MjkxS3h3bWswWTJFUkQ5cjBS?=
 =?utf-8?B?Z1FPNEI3cWNEUDAzQjB6NkREV1hJWUFKOE9LTzgvMXc3ays0OUdEcGxKVWRK?=
 =?utf-8?B?VjJIQ3psUzF5dzgvY3gwT0x4N3JUREJUTXZXTkk4dEJyaEpGOWU4UlBhc083?=
 =?utf-8?B?ZXVwMllYWlM4Rzd0YXlwQU5wZmwzUndQdSt4b0tqRTBzODNERS9FMnpBcldL?=
 =?utf-8?B?OXI0aXBlLytuUWtteURQQkxzNGFoWjJSVUxMYVg5SHBlMzF3eGZWQktxNitu?=
 =?utf-8?B?aXJnRS81NVRyRThtMVBxbFhZUXlTOERXTnl5RVcyVXpMNVZCekNPdGpRVU5i?=
 =?utf-8?B?Y2hwelBvVlVHNEZNM0VyWGIybGRERDBiNmxzWWhHZEdLdEEvQWJPaUw5dTla?=
 =?utf-8?B?NFpUeVhQcGQ3MmZHNUFvVmxnVzAwWmIxNHdSejVTckpKbkhnMm0rMHJTR1Vt?=
 =?utf-8?B?WlIyZUlvQkFSSDEyM3ZHdnlhZlpjbk5QbWpQeUM5Y0pFVmxYWG0zNHR3RGpB?=
 =?utf-8?B?TGhaS3B2OWNuR2ZGZjFVNUl6STFuZDRtKzljeGRuYzBNUWhNVHFjOFJNVFFI?=
 =?utf-8?B?aVlnNHNpR0Nmd1VxcGdUbEhNd3FSUjJVd2dYME5VU2pKZFh4aUlqWUFxMm9K?=
 =?utf-8?B?YzZwUHJsSE9JOTdSSzB4aUIyRXF6RERSb09ZRi9pb09ZV2hFaTM3bHJGbVA2?=
 =?utf-8?B?MzlMV2hhQUdNTTRLTUtNRmdoVHpKMG5GYXF6MDJ5Nm1JOGhzem5zb21TZmp5?=
 =?utf-8?B?NWw1Y29ETDFpNUE2MFFXOTYweU14R2VYajFqY3JFVXhnSlNQTW0wTngxY2Jp?=
 =?utf-8?B?OHJ4QysxNU5LdTViWUxyV3lXOXduKzlyck40MDNjQmpZZ0xOeittWDA4NHNQ?=
 =?utf-8?B?M1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 428d94f1-8b05-481e-7963-08dc7ef0df7d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 08:33:38.7266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eJdrEueBXlTTAfLz92FwVE6xCN2ZUWjyLwVXwpWqcYl9tS9eW22ES0hKfAZ7YRVAvFOp3YaAtXTxMlEF0Z+xdEY4ppz0GOQh6nrBPWNoB8=
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

Use the default timing parameters to get a refresh rate of about 60 Hz for
a clock of 6 MHz.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 32e5c0348038..c7e3f1280404 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -282,9 +282,9 @@ static const struct drm_display_mode et028013dma_mode = {
 static const struct drm_display_mode jt240mhqs_hwt_ek_e3_mode = {
 	.clock = 6000,
 	.hdisplay = 240,
-	.hsync_start = 240 + 28,
-	.hsync_end = 240 + 28 + 10,
-	.htotal = 240 + 28 + 10 + 10,
+	.hsync_start = 240 + 38,
+	.hsync_end = 240 + 38 + 10,
+	.htotal = 240 + 38 + 10 + 10,
 	.vdisplay = 280,
 	.vsync_start = 280 + 48,
 	.vsync_end = 280 + 48 + 4,

-- 
2.37.2

