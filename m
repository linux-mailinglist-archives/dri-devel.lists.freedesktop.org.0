Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9069473D4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 05:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0354E10E114;
	Mon,  5 Aug 2024 03:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="nLQtw5nE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2045.outbound.protection.outlook.com [40.107.215.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4EE10E111
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 03:26:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAHzvs0zhAAxkvwni4WuadJsl43EkEXt4294iLXKxTm3Y0rAL8OzYuxYlVU6LNpxErHBz5mfv/NXlSRkzDbdGn1VAw1Trz+KCdqanwxdPSmvoJ7PyYAzeXWe7JSLeTYdsMfT0XIGLlHAZScFuF99B7UquPRnEZEVcbwuj7GK3mY8DbNPjzcedcdi8vd/134vEpzz8wmnWeAnOtjcGwkdFuVos2wsdIxscnifHQs8Vu8SaGiadgnZBdTEvjr6tVr5gSsgq1OHdgFqQAHZLwQonG01rPaUIDtaiJBWKZ3FaTBg3SQTYgj/z2KTUKurZkUCl+AWvsITsgsOpFZ7dvutXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsHH4X5CdxMLGJRzF8Qxk8XqsOUiC6aUr+MRuw1SGcU=;
 b=CSDEKNsZgKiAUD5dKC9TRFW1P/YoNMcUoqLh81EGp+Bqo1gyKQuxIztnwNBve0oZCxnrmjLHhWwtU/YP/eQ4V0265kpAGhC3QQbL86VVY6qnJ/U5XKayOISqAT7VRRAxIWfg0N7T1wU73zeiniS7zMyWHJKgSmOAOxcwnHmRL69GDUaeCdDhPHhnoy3xkiEymoiuXzr/Kxo0h/jd8tdLIVTUs2i7qvwSII1p6wePhXMiMEuarlQ0kQu1ubL5mHLqWxi6QEVC8LRAzfxgJAJLG/J7e598McEeLHrmSNIpH1LCoy+SyC8vNgXVvHHb4VZwDYXsInPCQ0o7iUmkuLjSRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsHH4X5CdxMLGJRzF8Qxk8XqsOUiC6aUr+MRuw1SGcU=;
 b=nLQtw5nEjr6NORcz+HemiqGEyLFIkoPO2DkSdXG8NeGAGyPUq+Tr8+8YBaTVsOj04p+Di68uj+i6D43XSatd139HMjYZHeaCdLepLCRcjLdLE++xShGyj9RnFXCZJsgoyPJLrChs7vrmQRyRqS8FixsoYZuNEn3uE2ZLXl0JN7vEDdugHvtOP1PzvTjwtr01wLG+P6AmgP9OLPOGXcfwJItXPscsC0YOv6uvjSaUEFmo4eiN28xHQ8NqiCj8XLFSYTgzlUfGT3K64WWfsOozAXDYveytnolQAyxuO7xbU+x1VF0zUFm+y/6Q+XGuCekQi8Va/AclkpgQn6qrluICKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by KL1PR06MB6988.apcprd06.prod.outlook.com (2603:1096:820:11b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 03:26:10 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 03:26:10 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v2 2/4] udmabuf: change folios array from kmalloc to kvmalloc
Date: Mon,  5 Aug 2024 11:25:44 +0800
Message-ID: <20240805032550.3912454-3-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805032550.3912454-1-link@vivo.com>
References: <20240805032550.3912454-1-link@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|KL1PR06MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9b9454-d87f-48c1-5537-08dcb4fe59e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVUxcFlKTWdkT1AyeUtZT0xhdEhGRlhhQWhXQWM1a2NsdkhkdmJLbjYyR2c0?=
 =?utf-8?B?MHAzSFVvVjlCbktmbzdQelNLUU5NK3QwMENndW5QcytLbnpWR3h4WGlYTWVW?=
 =?utf-8?B?OEFPN0Noak5SQk45b1gxOENTL2hSaXVRYnFHVG5BNFlEOUhjY0hWei82UERB?=
 =?utf-8?B?MEFNUGI1TlhQT0toNDI0UU56aENlRWFpeVN3WmdSSUhyTG9ZR3F1b2IyaUlE?=
 =?utf-8?B?c2NjM0ltcFIrbFJFQmhFc01ZdE5OMDNRM2tjeW5lOWdGK01zKytseVFhcHJM?=
 =?utf-8?B?aFhvSUM2NjVGWThEcmluZmlMOXd6WUZ3VWpTVE5ua2x0R1dTYkFvakdqNzRw?=
 =?utf-8?B?NkwwSlBNelJHMWdVblIwVm93dW9JQ0ZiVXZXeWZUanFma2NoMkc5YXA1SWlH?=
 =?utf-8?B?NmFOcGpVK1Fpdk95RUVuODNVN200Q1JuMHNsV2Y5SVJwNzVLdHZGOUxXOGpo?=
 =?utf-8?B?MElBWWRvclhBU0xycmdYSkR4SmNqMGp6Qmdsb0l2YytObWg2SkZTQmtNZ09D?=
 =?utf-8?B?Sk1FN215cTlsUnVCUVJDdEZTT2lVemE0blFYLysvRmJoVmpuMlRTYlpXTGIv?=
 =?utf-8?B?WU1HMC83TnRhUlZIUzBxampjdDZOV2NSZE81bjBBNDdiZ3NJeC8wbUVEL0Iz?=
 =?utf-8?B?a2NEZW9lell3OFVYc3RmbGtLU1YwVDZoOFJYU1lNeFgwTEgvUVJtWStzSlNv?=
 =?utf-8?B?aFdZK2orTjJPcHBxMkp6bHRjSTdDRGVSU203Q3lyWllIc2pzaGtvNng4cnU5?=
 =?utf-8?B?WE1XYjdqUmg1ekR5MXZScWQvRFl2WTAvYm5iWG1aR1d2a3hHU1ltNnN2Zmta?=
 =?utf-8?B?S0s5ZFhzZnB5dU1xZWhoZ3lEWGZuWVI0U0EwNW1YVjA0cEJCekUzSHUwUVM3?=
 =?utf-8?B?RzNQK3RtMjZkS2xUdWlUU21Fb3J4Qms5ZTdaR3Z0c2VrRFcxd01ZclU3WjlS?=
 =?utf-8?B?QzRmZGZHVmc1Sm5iRklBNUYzVTU1Uk42OHNtaWhROHJzUFZEY21tSldnTFd2?=
 =?utf-8?B?T1JuRGMyN2dXODJGUllhejB2eU55andmbWpsYlQxdUYwcjl3VGZ0WFY2bGpI?=
 =?utf-8?B?ZnRndWx2bDVhY2lpVVVWbER1N21wZTZ2dWFtZC8yS2F0QmN5U2o4STR5a2ZX?=
 =?utf-8?B?SW1XcmNrTjlKUTBvL3FIMXRVMjlGb1dHN2loYU9GV2pWZnJMODRjZTdJQ0RI?=
 =?utf-8?B?K09wUXVZaUgzaVpwS0k3enJRcC9aa1hkaEJvMlEvTisrTDdDellQYjBuODJk?=
 =?utf-8?B?OHo2V2RCMm1tWlAvSk9WTEw0V09yWFQyQy9na1VOcnk5bThFdGFoTWJaZ0hw?=
 =?utf-8?B?UjRYR25oTm85MTNWdmVQRU5IR2FUWGNDSWZza253WFI3WVVzQzRjRStuN2lC?=
 =?utf-8?B?UnZyVnBlSkNqR3NUbklnc2FmczZQSVFjbzdJV0tNM2kreW5yNWtRVEEzK3pF?=
 =?utf-8?B?anBsQlZtWmxldkhSRVUyckxLSGk4YTJnRG44WkZld0RnS0R6eHdUKzYvK2dl?=
 =?utf-8?B?eExxREhHaitUeXFyZDd6enVTTS9OSEgwNytzMmVsTG9BVy9OUkxsZGNIQmUx?=
 =?utf-8?B?NEwyR2lDekNtS3h4VG9UV2JGaTB5MDAyNHlDZFc2ckRXaFZiWU5LeHczNm03?=
 =?utf-8?B?aGZ0cEo1RFZjWHNnUnFRRTdld3JsYldWckZ3RUcxK3NuZjZzRHB5eHcwbGt5?=
 =?utf-8?B?ZEZnWXBZUGVNSU5ISmhScmQwK0tQb1cxOVpOVjNMRUJCcjgxRVM5akU2U0t5?=
 =?utf-8?B?aGMwSXlwUHZ0TllkSlZHSWVBaHNvOURCZGZnRnZNQUZKM3Nkd0RzWWtUZDYw?=
 =?utf-8?B?ZExyV05Pa2RZenBieW1MUFZoY3VTczFXbmJCMktXK1VsNi9LZmoxQy9scTdh?=
 =?utf-8?B?bW5qTDQvMWxvWHRUc1Izcks1aE9GeTNYajltUXpKV2NDeXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djhxS0FCMkxnamtkaktaTzJWK1N1NWMrZ0JsT3Nhb25qZWp4WS9ZUDk4Qll3?=
 =?utf-8?B?eFg5cEE0VUQxeG01UmRMWHdQbEhDQ0FGL2k2MUZRQ09ETGg1OHhjSEQweis5?=
 =?utf-8?B?dUVzWkhxeXBlZXVJdkxsTTNEQkRibUxaWFJhM2orVEVvVzhlemlzSUxkZDdO?=
 =?utf-8?B?UysyU1lvejc4RnlXTEJBOUQ5c2gweURpbFozTFhlZHJST1hYdUxycURlQUkw?=
 =?utf-8?B?Z1dTTGhiWHVKL2NRS21jdFlqM21CU0RtL3VKS3d4SU5VTldaTlNNNEE3ZVg0?=
 =?utf-8?B?Y1lZbk10V29sQ1VpZFVaL0QyTk9RY3pIZ2ZaVEkxVlRTbU10QUQwUlFaL21u?=
 =?utf-8?B?bG4rMVV1TVdqaUJ0aFczdmY5dFZrNklITGZxSnBsbXFLeHBvZXNhalJMOGZz?=
 =?utf-8?B?bkdvRXdGMklmRmswYzNpakI0a0VLQTE4anFORUFwVjFwSW80RmdFYjNBQmJE?=
 =?utf-8?B?VUIrcUt4TjU5MjE1R2ZBQVpieXByNzVhbkpRY2RXSDJoazJIT1huTlVoVGp3?=
 =?utf-8?B?dWhKcFVwUzFOc1N3YmwvWkxwQUdkY1gwQlJUTFQ1aUp2ZU1OUlVmbS9ab2JQ?=
 =?utf-8?B?SGZER2dGOXFuVEJYaEhlOWhVODJMRU5INTRIeGdaK1JoaWRsbWdLdU5qd0F5?=
 =?utf-8?B?eWtDWklMVXEvakpNUzRlcU1DSDRyaGpsUEFSLzNsR3JRSVJ0c1hPejNmNFNt?=
 =?utf-8?B?UkgwY1VINzNBa3BNN1hsZXdmeVQ0TXpzazE2Q3B5SkpzSk5lNTdPZ1FaaE82?=
 =?utf-8?B?Nk1zK0taL016MGtsckI4VjJGTUt0eDhiY0p4c21Jc2lBWHE3Q0NFLzM2a1BC?=
 =?utf-8?B?RTByYVpaVEQ4MmcyY0RpSks0MXlvRnhFd3V3QTY3cUNZU1FJSEMxaEh5ZVBv?=
 =?utf-8?B?bjlpUjR0VVlXNmF4T21FRWE1aEFESWxERFBBb04vVUhpeXJJYUI3NFdoblhK?=
 =?utf-8?B?NWNpbHlqQ0lYdEd0c0tFVk9IdzNkQVlaeXIxUG5XM2MwTVA4aTVab0tCTThl?=
 =?utf-8?B?U2E4YXdST1BDYWE5SSt5djNCZ3FSREJTZnErU1BrbEE5WkVraU5uOFN5RmIw?=
 =?utf-8?B?S2FERnp2NW96cUEyUXVEcGhTQkxzeXpMOGhHOGJEZzJWLzhjMmNXWjBlMU8y?=
 =?utf-8?B?dzVkUXBzQjFXVzQvTCtBNndYNlBjRU81blBpS2FJczZTWlROdllQWVR5eElV?=
 =?utf-8?B?Sk4zYnU4NzhqUFpCOC9mQWxHaWxBYWpFWVRDaGtjQk8rZG9xenFpck4ydnVo?=
 =?utf-8?B?NEIvZlZCK1BOMUdWTGtib1ladGJnRjlJN1RDZHJjV1VaL05DQlcwOVNqei9T?=
 =?utf-8?B?aytONG5tRk1BeFlwRG0vUkxNd2xmUzJ0SGpFNUNNZmcvaFFiMjU5Sm1mak1G?=
 =?utf-8?B?U3ZWdlhaMDBFeDd6d2xLR0EzNEpoUkZFMjU0dUNUeFdzdlg5dU9UMG5SSzFU?=
 =?utf-8?B?ZFVFOEQxQUlFZGZNN0ExMkp0a3RmZldUSkpack1qZkxKVmJhbHNmdXV1bXdh?=
 =?utf-8?B?OGw2YUJIQ2RBZUVLQkdvUTFjR29Gd3ZQNWNQVVlZQzlFTlhkYlBSUDdPakU3?=
 =?utf-8?B?Yy9Md3RYSVlSb2IvYTk0WDIxZ1Q5bytEME1vZnRPWW1YdWFSZ2NUdHhoTUNI?=
 =?utf-8?B?V20yK1dKZjE4azBDaXFic2ZrbFpGU0FHZnI5dmhaakZxSC9oaDVJMGttbStU?=
 =?utf-8?B?bFpnYWFLUXBXMEkvakU2cHloaitzVUUreVBuT2hydUlpR1dRc0ZocEIvYWt0?=
 =?utf-8?B?dFM1RkZGV0ZLMTNlSHFRUHk1SUkrdkdoUW5MYVRQTEpnRWlYT280Wk82a2xC?=
 =?utf-8?B?Y3pNZ05lV3N3QlVaM2h1ZTB2UHMrN1ZYVDNPN1o3ZVZESHJaU3dOemEvc1Rm?=
 =?utf-8?B?VHVHc0ZLZVBzbEt1UHVLcFo0ZmRPWGxRK3NuM1ZpVTRHWUx2am92ZHQzdXVG?=
 =?utf-8?B?cThQbGtJSWRZL09BaUZtajhUWlJaRy9MSnphdkJOaFB2S0dQUGMrUmMwVmIr?=
 =?utf-8?B?QzF3a29EWC8zczQwMmswTU9qaXZrWXh2TmtjdzU1WlNtMCs0UzNsbE5kOTBB?=
 =?utf-8?B?MUJBblF5L2IxVmRsU3FBdVRmelh4VG4xdzlDdkNrODMwbDdZdlNwWm1JUWJq?=
 =?utf-8?Q?bqy/Dr1EbkJ8NyYDpR7E6vZW2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9b9454-d87f-48c1-5537-08dcb4fe59e8
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 03:26:10.5236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddhW1yfnWIcNHiLjML+fhV/EqjdlpvMj3Qf0A8A68SOskCSBnUpOstVsFMF0+nzbE/A8k+Q4ZHdFzM2cwAhzNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6988
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

When PAGE_SIZE 4096, MAX_PAGE_ORDER 10, 64bit machine,
page_alloc only support 4MB.
If above this, trigger this warn and return NULL.

udmabuf can change size limit, if change it to 3072(3GB), and then alloc
3GB udmabuf, will fail create.

[ 4080.876581] ------------[ cut here ]------------
[ 4080.876843] WARNING: CPU: 3 PID: 2015 at mm/page_alloc.c:4556 __alloc_pages+0x2c8/0x350
[ 4080.878839] RIP: 0010:__alloc_pages+0x2c8/0x350
[ 4080.879470] Call Trace:
[ 4080.879473]  <TASK>
[ 4080.879473]  ? __alloc_pages+0x2c8/0x350
[ 4080.879475]  ? __warn.cold+0x8e/0xe8
[ 4080.880647]  ? __alloc_pages+0x2c8/0x350
[ 4080.880909]  ? report_bug+0xff/0x140
[ 4080.881175]  ? handle_bug+0x3c/0x80
[ 4080.881556]  ? exc_invalid_op+0x17/0x70
[ 4080.881559]  ? asm_exc_invalid_op+0x1a/0x20
[ 4080.882077]  ? udmabuf_create+0x131/0x400

Because MAX_PAGE_ORDER, kmalloc can max alloc 4096 * (1 << 10), 4MB
memory, each array entry is pointer(8byte), so can save 524288 pages(2GB).

Further more, costly order(order 3) may not be guaranteed that it can be
applied for, due to fragmentation.

This patch change udmabuf array use kvmalloc_array, this can fallback
alloc into vmalloc, which can guarantee allocation for any size and does
not affect the performance of kmalloc allocations.

Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/udmabuf.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 475268d4ebb1..af2391cea0bf 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -73,7 +73,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 
 	dma_resv_assert_held(buf->resv);
 
-	pages = kmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
+	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
 		return -ENOMEM;
 
@@ -81,7 +81,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 		pages[pg] = &ubuf->folios[pg]->page;
 
 	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
-	kfree(pages);
+	kvfree(pages);
 	if (!vaddr)
 		return -EINVAL;
 
@@ -189,8 +189,8 @@ static void release_udmabuf(struct dma_buf *buf)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 }
 
@@ -315,14 +315,14 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf->pagecount)
 		goto err;
 
-	ubuf->folios = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
-				    GFP_KERNEL);
+	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
+				      GFP_KERNEL);
 	if (!ubuf->folios) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets = kcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
-				GFP_KERNEL);
+	ubuf->offsets =
+		kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets), GFP_KERNEL);
 	if (!ubuf->offsets) {
 		ret = -ENOMEM;
 		goto err;
@@ -336,7 +336,7 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 
 		pgcnt = list[i].size >> PAGE_SHIFT;
-		folios = kmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
+		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
 		if (!folios) {
 			ret = -ENOMEM;
 			goto err;
@@ -346,7 +346,7 @@ static long udmabuf_create(struct miscdevice *device,
 		ret = memfd_pin_folios(memfd, list[i].offset, end,
 				       folios, pgcnt, &pgoff);
 		if (ret <= 0) {
-			kfree(folios);
+			kvfree(folios);
 			if (!ret)
 				ret = -EINVAL;
 			goto err;
@@ -375,7 +375,7 @@ static long udmabuf_create(struct miscdevice *device,
 			}
 		}
 
-		kfree(folios);
+		kvfree(folios);
 		fput(memfd);
 		memfd = NULL;
 	}
@@ -391,8 +391,8 @@ static long udmabuf_create(struct miscdevice *device,
 	if (memfd)
 		fput(memfd);
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 	return ret;
 }
-- 
2.45.2

