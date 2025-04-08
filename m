Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E6A7F53A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 08:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC6410E216;
	Tue,  8 Apr 2025 06:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Rzk3VnFq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011036.outbound.protection.outlook.com
 [52.103.68.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B9310E216
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 06:48:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXaCTB9P5lk42Vf1+cRUz88zm6IaJlHD/w0S3pLarNXpq7GNLzDx7+KMBndh3qhbgYh591Cu6Y62cNgfgHGCV1Y8zcJeToG20I5rh+ebgmJbD7ivYTFmDc6LyspU9JLZCmc1SVZV04qxzSAz4tc1whjKQorY2HCUaMTXVavUXgxIX1zlmujIVElH/PbyHkZxSUC7N5Fge9H4A1Oz7a7uTMt1CDLNIDOU4JGrT4xSZWlaWHy6XD0VZP6R26gwa7NyvRWu4XcOJWafhMYvupA4v4PEHo2pN7/Pwoy/IpKttPJiMtOby6V5Qs2npoDhUSLZYVCAkIACyLEnuuzr0rLo3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BaK2sIbKkGMx/9FF6qJRdXWycczn6mmYQVjFvZlDi8=;
 b=OufoNkMz4NA9PV9HJWkPtDfZSHdz6sFLmpjL7I5RcZwJ2jUt2qsWccj1dO1rMK7UZQ0XWe4EoxRvS9YfzZf1wlSrbiymEi89vEZZnodpSXCWiTMmQ9QRBOup8pTvzr7/aGizut1em2j6W+JUuXiWD+B+VRGtO8jX0LQEsDB26s9vZtgk4sNQaZBm7Tnq0oEqqsqDdj3pTAYCjGQy0bujY0CV3sHn5j4xWg+uHKOHIbsZzBM6MyBHXJjXV5PmMsULZImE17gUwrxjiTjeGptDiXvCRL350u9+JsAn6LAISURryP8LWgzcPqLLaSBocMMocpnKSQcsJRZe77B0Z4lPfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BaK2sIbKkGMx/9FF6qJRdXWycczn6mmYQVjFvZlDi8=;
 b=Rzk3VnFqu7mu9f9eqHK3uYwwwVCv93ExBinNxJ8SVgCi9ZcXFY3yXjvbGCGl8N9Thq9KFQWwZtolzn54pdUfrFRyZzv0pzmTa8wp1bM8Y6HjtwJ7fAR8YQjTHKKhpqzxNSp34lAvReX7B0Y7c6w+t2ba4B68HSrVReMSR6kMWwMcy20Tc9r8jkv40i9kqDBR1wVv1I0GNx9s7n/Eej/92tkLq/t+uap3lAKo2x42VQGR1sZaV8DcZjzf9WT0Mod+zbXxUvHpmBk4OTJF493buZNTvq3lQft/nz17DP3oSd5bmo8256oP1DiPilDVLakBBKmdG1Ga2UNMxC/FQLJZmg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9261.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 06:48:02 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 06:48:02 +0000
Message-ID: <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 8 Apr 2025 12:17:57 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
From: Aditya Garg <gargaditya08@live.com>
To: alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 airlied@redhat.com, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::9) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <65855c14-4158-423b-8d0c-0afaadeca8ae@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: 55964a5f-a61a-420c-b890-08dd76694e8f
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799006|7092599003|15080799006|6090799003|5072599009|461199028|19110799003|3412199025|440099028|41001999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjcvVU1iSDZoc1AzR0pqVEdLN2Q5bzR6Y0hPMnlUbEtDVElaNjdRYnBiWXBv?=
 =?utf-8?B?UkhKS2k1alF3aURKMjRrVXd4a0Fydm5LcFBrRFBCdDR4bnpTYUgwUURualc0?=
 =?utf-8?B?Rzlmb0p1RHNYY2ZhUkZsQnlSb3ZsWXZmTmJ0RUdUUVd5RTBJUE5CUDRtaG0v?=
 =?utf-8?B?VVZGU0hXeWtUVUhJZGNxMHg1WkQ2MUZsSEd3ZldrOTc3MERMK1lMSndnTnN1?=
 =?utf-8?B?SkFCaWNWbnZDeFNmVzdOeHd1OUZrNnB2ZnBhRFJGRUFRcVphSXVHbDdDWDR3?=
 =?utf-8?B?UUlWNHJzVWMrRHp6TUpQT1d1Wm5QdzV4K0w0SzZLdTYvMCtwbGx0QmZMWHRZ?=
 =?utf-8?B?by9oeFZlZ3lwcUQrcXBQODRqVnRrRExtVHZsTy9jRUJXcDlRMkpPSnp1RWFp?=
 =?utf-8?B?bXQ0T2srMFFLcldVZXcrRDFhY2Y0T3NaTnMrRGo2M1EzRmRNemFkU0YrOWpB?=
 =?utf-8?B?NlQxVDVzcCthU3hJNTVpSlZEeDFkZUFGcGZYVG5sYjlaZkN4S2FjVXg2V2hq?=
 =?utf-8?B?VzlqR3A4dFpUWUJNWWJXU3FCRFdCY0FqTTNHWjR5ZGFNbEpqcm4vYzFvYkJz?=
 =?utf-8?B?UWhhRHBmT0tucUd4TFVTZk1ENHRtMlNiSnBiMU1POTFBay82UDkvOE9RNFRv?=
 =?utf-8?B?QS9wRFlNdU1UWG52bDdNenVhREFneGY2OERFdHNGeU5NcjBPZkdIQzgvcWtk?=
 =?utf-8?B?LzRSamhteUl3ZUcvOURFY3RKNVk2Q3dwS0QrTmFhc3EzSjVjOWJUc2szQmJm?=
 =?utf-8?B?Q3k4Mk9Hc1dRcyt1TUlNc0JhWTVIWVdIQTdLek5QcXlZYmJYdVZta2ppMWtz?=
 =?utf-8?B?WTBKZHZvQzNOVVY5eGtMSkkvNzk1eG85d2NaUDNxOWxyNUZLR0xBWTNBQm1m?=
 =?utf-8?B?enBydzRuUG9FVFIvTm03NlNYSkRXMG1FcFg0V3BpS1NmSFNqeFVUZnYySStF?=
 =?utf-8?B?TjYzcjJjUmFCWk12NUdKTS82OHRYUjlxaU9qVlhDZytRUy8vTS9hZlhHSXAy?=
 =?utf-8?B?K1p4RERNNE5JUzdRRCt4TXEwQVdDSVgzWFJVek83ZkRpcGFVU09aVXROd2Y5?=
 =?utf-8?B?QitFVjlkREVvdE1jKzJEaEt5WjFtZ0pLTGV2VnBpa3prNlgrcTlRMS9rTHpa?=
 =?utf-8?B?Y2V3R1lEalo4L0pBSTVqNXZlY1FuM3VPNnphaTAxS0NlSG13eTVHWlRnMFJN?=
 =?utf-8?B?U0duTGJEMXJHK3M5by9Pc0Q5TXB3OWpwZTEwakY0WmNTMlFnNnp5Y0Q0RExF?=
 =?utf-8?B?c0tJRWVtbHJ2Yk9QNXRlVllDRm1LNHdxdjVvQnFTZktrWWVOKzgzLzhoN2p6?=
 =?utf-8?B?Q2ZQWUxkOThBdE5JSjk0RG9keVBuakc2azRyak91OThnZmJBejdIblhwRzUr?=
 =?utf-8?B?QkFZVGF5OEQzdTBpUk9vN2duSTZIVDJ0Wnc4YURidEZybnJPbFppa00xTkpi?=
 =?utf-8?B?ckhRWXM2c21Mbld5TWdYT0k0Z0pzOTVGb0k1emdRcUo0L3hMNkJGWnVCUzR6?=
 =?utf-8?B?bVoxT1pRZkRta3dDM1BManJTaE9tVjNsSnI0dXluUEpZVmtLdkI1T2xSSFMy?=
 =?utf-8?Q?3Ma5gYYiidABy6qAhN6nSbTxs=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajYrOVVBSTRMQXdnbHpUSHVjVm1aK1g2dmdrVVdTb0l3MWFxZUd3OFAzM1Bt?=
 =?utf-8?B?aDZod054eEg0WGlQTjBPMFA5WC92T05MNXUxeTBKUUtBUHpybW80N0t5NjZH?=
 =?utf-8?B?dkh6NFJLd2VWV3RRQTMxbWtidnY2c0xqVzg4cnhtanlONHg4VGwzUmlxdHZD?=
 =?utf-8?B?RzRYZjdwQTc2SWx1akpHMjFZMU9PMnd4eGJKMDBEeXdIcHg0MTlqOFBSY3Rw?=
 =?utf-8?B?T3YxK2lIaUNIMjZBOFZHY3FVTGhEK3pQOHlOR0tDdTZneXJWVG9OSjVycWNj?=
 =?utf-8?B?amo4czlRUWQwby9UelJkTHVsRjNGRzdRa2Q2Z25UMFJmbTVhWXJqWnJHVjYy?=
 =?utf-8?B?dnFzclVLKytaTVdCUExINHVKWllzWlJBa3J3a25ydWttaGpJNFBYRnNNczQ1?=
 =?utf-8?B?dUJhV0g3ZVAvbW5FZHZNYVM3WHl3ZEY3UXJ2YjM4TEl1djkwbER4WWNQYk5Z?=
 =?utf-8?B?QytJaW9HMVRmN3VxeTFxcmdEZVg0bHprbTRRVlhyVEcxaEUxWk5BNWZHQ0wz?=
 =?utf-8?B?SC9WQmkydllUYkZaZGc4VU5kVSt0WjFGTUlMR045eHYyL1JXRDY0eGU2OWZZ?=
 =?utf-8?B?RFJiY3ZVS2pCdW9ja2g2Ukd4Z2VuTmowY3VIa2dtS285a3RwYS9sNFRLWEZX?=
 =?utf-8?B?dVRPWGMyYmtTbHpuYjBwd2htbjJkOWMvWjFRdnBhNG5ibTFxSHJzUk1WMm1r?=
 =?utf-8?B?Yy9CZ3RQRWJSZUY4a3Rhb0FqbTdCcW9Cbk0xcG1jak1GT3crVThEMEo4TGQv?=
 =?utf-8?B?Wm5pQkV2OFE0ekxkY29CcEZHeGI3RVJxL3h2YmttbzA0b3R3MWNER3FOTEw5?=
 =?utf-8?B?SVZ4NlYzZVUrbnhBKy8xSEFUNjV4U2VLelV5ajhna1prQ24xaXBlQlhxTS8w?=
 =?utf-8?B?QU1OTVVzM1htcDZ3SVBOTGdRcWxJYlVLRk0zdVNVNThUc3JiQVAzd2pnUnBk?=
 =?utf-8?B?d0doQ0VIZmV2ZE5wYmJKUVhvempQWnpMTmtOdUNoYUREaWFEdEllN05RUWgx?=
 =?utf-8?B?SGtWUitkY0hOZFJwN1NwdXdWaENoMVZzVllZQW5yVjExejRXYmx5bC9JRVhq?=
 =?utf-8?B?OEZhNDZiOGNwc25BSFlrc0RPYkIvUUlJMXg5dGt1U2J3OVJac0lxNWZ0MUxW?=
 =?utf-8?B?V28rdjdZR2I1bGY0QlBMWURtajAva2lLTUJkSVE1b3NnVG5UN0tQLzAzSmZ0?=
 =?utf-8?B?aUp1aGNIelVRWGp0SkYrM1NCcmptRHQ4NFk4ZXppWjY0Y05iajNDcVRUTWJK?=
 =?utf-8?B?Zk05WHVmelUyMlp4SEpmNFJRb2xZRktMOVN0TjMwc04zSFRyeGpHSmZPL05w?=
 =?utf-8?B?SVEyL05xdVVPSFhXRVRod2tLZndFenFpdmZyNW9FMlZibWRQTWN6U09CTHNs?=
 =?utf-8?B?QXkyTkp2QXNybTF3RU1CZXRQUWFzc3NFYjZyUkxYOG1WZkZpVzhwNUM1dXJP?=
 =?utf-8?B?YThhdG1BUDVBYUV1M2Nob1VjNjY0Q0hkSlB3dmdHbzNxNG1RTWZoTU9GNGI1?=
 =?utf-8?B?V0lGRC9jNWszZ01pbWRJV3hxRnRHU3ZPQ0ZUdnphL2k2dVp1YlJkeFloWU1M?=
 =?utf-8?B?eEdmWmpQZS84WnNBV2YyVm44czEyaGpQOUFMeURWVE5vcXE0ZVlwZTc0YjU5?=
 =?utf-8?B?MzlScm55bEZadTUxVituNkNabUxLcjJSc0ROSktXK0ZLR1hsdEphakpQS1hz?=
 =?utf-8?B?MnBNUlF4M2dGL0dVMUVTVjlTRjEyZGR5cnNjME51aFZDeTRQWFlGcUlLRTVW?=
 =?utf-8?Q?RQA2qU33pBhwZtYrHRjYLXHOLGpnstKpWM/x9tz?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 55964a5f-a61a-420c-b890-08dd76694e8f
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 06:48:02.0516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9261
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

From: Hector Martin <marcan@marcan.st>

%p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
it's useful to be able to print generic 4-character codes formatted as
an integer. Extend it to add format specifiers for printing generic
32-bit FourCCs with various endian semantics:

%p4ch	Host byte order
%p4cn	Network byte order
%p4cl	Little-endian
%p4cb	Big-endian

The endianness determines how bytes are interpreted as a u32, and the
FourCC is then always printed MSByte-first (this is the opposite of
V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
allow printing LSByte-first FourCCs stored in host endian order
(other than the hex form being in character order, not the integer
value).

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++++
 lib/vsprintf.c                            | 35 +++++++++++++++++++----
 scripts/checkpatch.pl                     |  2 +-
 3 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 4bdc394e8..125fd0397 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -648,6 +648,38 @@ Examples::
 	%p4cc	Y10  little-endian (0x20303159)
 	%p4cc	NV12 big-endian (0xb231564e)
 
+Generic FourCC code
+-------------------
+
+::
+	%p4c[hnlb]	gP00 (0x67503030)
+
+Print a generic FourCC code, as both ASCII characters and its numerical
+value as hexadecimal.
+
+The generic FourCC code is always printed in the big-endian format,
+the most significant byte first. This is the opposite of V4L/DRM FourCCs.
+
+The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
+endianness is used to load the stored bytes. The data might be interpreted
+using the host byte order, network byte order, little-endian, or big-endian.
+
+Passed by reference.
+
+Examples for a little-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cn	00Pg (0x30305067)
+	%p4cl	gP00 (0x67503030)
+	%p4cb	00Pg (0x30305067)
+
+Examples for a big-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cn	00Pg (0x30305067)
+	%p4cl	00Pg (0x30305067)
+	%p4cb	gP00 (0x67503030)
+
 Rust
 ----
 
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 01699852f..6bc64ae52 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1793,27 +1793,50 @@ char *fourcc_string(char *buf, char *end, const u32 *fourcc,
 	char output[sizeof("0123 little-endian (0x01234567)")];
 	char *p = output;
 	unsigned int i;
+	bool pixel_fmt = false;
 	u32 orig, val;
 
-	if (fmt[1] != 'c' || fmt[2] != 'c')
+	if (fmt[1] != 'c')
 		return error_string(buf, end, "(%p4?)", spec);
 
 	if (check_pointer(&buf, end, fourcc, spec))
 		return buf;
 
 	orig = get_unaligned(fourcc);
-	val = orig & ~BIT(31);
+	switch (fmt[2]) {
+	case 'h':
+		break;
+	case 'n':
+		orig = swab32(orig);
+		break;
+	case 'l':
+		orig = (__force u32)cpu_to_le32(orig);
+		break;
+	case 'b':
+		orig = (__force u32)cpu_to_be32(orig);
+		break;
+	case 'c':
+		/* Pixel formats are printed LSB-first */
+		pixel_fmt = true;
+		break;
+	default:
+		return error_string(buf, end, "(%p4?)", spec);
+	}
+
+	val = pixel_fmt ? swab32(orig & ~BIT(31)) : orig;
 
 	for (i = 0; i < sizeof(u32); i++) {
-		unsigned char c = val >> (i * 8);
+		unsigned char c = val >> ((3 - i) * 8);
 
 		/* Print non-control ASCII characters as-is, dot otherwise */
 		*p++ = isascii(c) && isprint(c) ? c : '.';
 	}
 
-	*p++ = ' ';
-	strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
-	p += strlen(p);
+	if (pixel_fmt) {
+		*p++ = ' ';
+		strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
+		p += strlen(p);
+	}
 
 	*p++ = ' ';
 	*p++ = '(';
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3d22bf863..44e233b6f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6891,7 +6891,7 @@ sub process {
 					    ($extension eq "f" &&
 					     defined $qualifier && $qualifier !~ /^w/) ||
 					    ($extension eq "4" &&
-					     defined $qualifier && $qualifier !~ /^cc/)) {
+					     defined $qualifier && $qualifier !~ /^c[hnlbc]/)) {
 						$bad_specifier = $specifier;
 						last;
 					}
-- 
2.43.0

