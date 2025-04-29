Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE9AA0DED
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 15:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4972D10E493;
	Tue, 29 Apr 2025 13:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="YBsv3Vr2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010004.outbound.protection.outlook.com
 [52.103.68.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A36A10E493
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 13:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iO3vhfP8Z8H4Xmb+6MrQoMAxVn5qev/aBcT4eNoqyWN0P6FNwaJ6rBFxE3Ny/GGJnMA73zdYfw+Wl7rWcaWCbLk5tvjpu8DtUfBD8N8QYS/mKt8t7fFX2LOqj27+qKacFmtK37pQ/VPXVqtP47x0zVyXbFuyf13H+TM8dyQdnYMlxKkplin/YL+CEsjDliYcEGYP+GyoxLFHMLouEfiSznkJ9a+6RGm33HO+ZtfIB1S4WJ53s+SfZ5aQDM/p5E5fiRkHBl3WEIpVp8ShL1XplmQA9rEuOEjB9WJZ3681kinjW/CFVN7OCRUd8GV9ur891lRFJK0VNIP5SmN/ND8GPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RciTsEniuhDyw8rEMvE/fX1SmZvAZ4qrN6iVS9VU8Ho=;
 b=H1rHe8lxMiJipCEI0ktYh1pOppZtrNIZTeLX8xzRJl2hVB6OA63ZklDaKPKHz2uaBKBEAHS1HTJneZHXishbcA5birbVxWhMTmceMuVWdRdRJr3ERunz+BwOT3KRPEaRThhcBza/iEO/gvb0UOlHWy1f0btmdM8T8K518QGtjuYy3/1DoABlWfLw6bgszSp3msMfQiLRhrzW742dCr3pJarZ9GVyDGTMHDuBgJlzGlRqKfaM4yZ+K5zXM3+4i/txCioLjmFCM/Ju3pR5cQRoMktNikOyGmF3u/KyK7wvwvOJNprbNRGNK+kUE1M8SZ7XbX/EIotdMrsyV2FC8Gzopg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RciTsEniuhDyw8rEMvE/fX1SmZvAZ4qrN6iVS9VU8Ho=;
 b=YBsv3Vr2CNJuM8KH5U24edTcnvyumvMyjp/dxJz+mVpdKJ2KEGwyEEUQRcLUw2BkLyIDSXIojFL8RNeCTfD9pDFmMZnVOuuEBlM5Tw2o0DfHetg9OzTyMt2tKXF91DwyeyesQo1OjmdPxv1xbh7XWsYu/+1DEhxnWvA0vJgjl+1/WK10CGQVfI7K9PPmkeF6SXB7A1rgnAwztnn6DNBwAEkNAhlEJdcKg52CyOgZrxj2BgAqEyB3/RrCrI/dTHJtVHwUo8DjGCoEfgC7a4/rePCGZ2bEGWg0fOD1VhV0wMC/qEwtJ9mwIK7yNqt3AR9rybSU38R5tBasSbRBFtTWBQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB9497.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 13:53:28 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 13:53:28 +0000
Message-ID: <PN3PR01MB95973805D81090E8776BE5FAB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 29 Apr 2025 19:23:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data in
 reversed host ordering
To: Petr Mladek <pmladek@suse.com>, alyssa@rosenzweig.io,
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
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20250428123132.578771-1-pmladek@suse.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <20250428123132.578771-1-pmladek@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::36) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <2467f41c-ddb6-4fcd-9fd5-9d4c9d99fb56@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: 6325179b-ce34-401b-ec3f-08dd8725384d
X-MS-Exchange-SLBlob-MailProps: f3ElpFvzDvbd2x7ZNKI55WBhevLDC8F5yemQ1Z7VX0NS3OxwFw1Prs4Fw7snE+JKMcffE6Q6F+IO5iLZYCWgVxh2UJcF8mHeX0CijL4M/pFNBSHxSyW7qyfy0c5fOZ8F9WgbH75+yYDGM56PAGofCePMi4OAYjfMg4wCc1paL6IjiaRCdCTOdsLbY4cjfu1O9m4nodbKgb6qpge0PKEdIXNAhTCKH+f+zNMq94aj50pZNOulkANplP9RUrzJaTGqD4dD2hmj4W/yOCCgW17whhw0n6CB9AKcWwKt65ODW04i2Xj55Kmzlejf3wogm7I3lE9pUauUI3ITL6+wKrOIDWhswVvtp59/zWrGL8gIdZVG7fJoZ/pGPqNG/C4KQjOCNtLeOUe3QP2c9DN4cTrC1cCwSWiwmX7/Ii+5MZq2hy7/ot/UWrq9101W/8Of8uClOg57DjT/t2+yN0U7elE/cmP/MBUhggE53Gh4U8pJbdOSN8BDT1svh4ub8Iz+Usp3vgkR1whdpuv9PHTo6IcuoDsv25SdgySegJLsUgs6FZNBY7P+iDySeHYnyVmB+G6DQXOanHm/zH/DLKPXUVMJE4Yq1N2FRYMY4DZcXyoZOcffTQTkYuAdVUBVf9/U1sydw3ivp7rlZs2ZDrHvE+qiG7211maliDzB3RM/0Eei0zrNXGj7SaszfVOLzEGZ3OUWss/pgK2tNuV0aBUvj0AmDzZMA63tS5MXKmIrM1+RUdIm8PptXUxMwTmWdZm+o4epYDGrUeeflokaKlFhD67iixsIiIlduqB1Ft9b6LE6SxNwPKtQkOA9xS9pCl1tB7AnAvAiEOjKD83nFtvGH4oRrlZ6nXauIPTFlp+upl8Fd9Nhly7tFcfiA2vHtCduxQ8My7nJjo6VObw=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799006|6090799003|7092599003|5072599009|15080799006|461199028|19110799003|1602099012|3412199025|4302099013|440099028|10035399004;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFFxVk9uN2FoRk1BcGtyeXBkcXZxYmNJZDErNGxiZURvMzhwckU0OHN1MjRM?=
 =?utf-8?B?dHhRenRmc0FwdHBQMTdicE81RkYwKzZiaWNncXJ6d3RCNVZROEhPZWVhdXpx?=
 =?utf-8?B?YU5lQ2s4YURWci9nSWttdzgwcEF3bzM0ejIyRVowY0hudkdsK2ZYWlkyWDB2?=
 =?utf-8?B?UmNPeFFYT2wzcHlWaThTV0ZwWk5WQVhuUTc4RWxnU091WVFQc2U3empqZGd1?=
 =?utf-8?B?VUxoeW9yMFM1a2xFZUVYWlN1ejJYNHl3cHgvTXJsSmZpRUpyTjdYUkx4UDlB?=
 =?utf-8?B?Y01McUlxTStWWXFwR0UzNzBJY25tTnkxa051M0lrdUNtYXNUcFBqRStzSkdy?=
 =?utf-8?B?bExTT2NKcHBWZ09vOEVFaTc3NGtYeUt3T2RaUTN1bXQ2MTZ2alFMd2wzYXZZ?=
 =?utf-8?B?SnpWRnBldTMrR01PVVBMSlozaGR2cmtaZmRBd2lEMjYvVnJjVjhEcmF5ZzM0?=
 =?utf-8?B?UGZ6QnZ5NmpaR2JwU3lIVDBUd2ZpNzNYK3Z0cCsvM09yTmVOQkVzMXpFdXJj?=
 =?utf-8?B?bSs1bzh3dWlLbHFKZGxRQzA0YkJXdWVjMjZnZXc4U2Z4bVF6d2QwSzRRWUFT?=
 =?utf-8?B?aXZ0ZzJFbWlrOW1sKzk1UlBjSXVvbzUzZmwwL0w4NWV1bmw1d2VRR1pHbHNj?=
 =?utf-8?B?VnNuMDJleDVLaGRhSFBqbFlXRHZJbHROWFpaeWZhazVIUTBGQXZOYzlROVYr?=
 =?utf-8?B?bE1YampPYVlMdjBoOWo4YmpOMzFTNVE5UmwvTzlsTURVcEFtM2FaaXRXbm1Z?=
 =?utf-8?B?cjJKMzVHWVpab3A1TzZsb1I5ZEY0aFdjR3JEeXNiNjN1Z0hXbDU1bnVMRHYz?=
 =?utf-8?B?a0NKUHlCRkJMZnVmcXNSYW9JaS8wb3Q5ZkhVOFAxRG02VVZaN09uMG5lb0pL?=
 =?utf-8?B?d3NBK3dDeEdhY0kzdEVwdmlOcTlSQ2l3cTlLb2l4aGQzRlNjemplNzJ1Z2h1?=
 =?utf-8?B?NllmZ29GaHV2U0lMS2xyRElWNmwxcmw1bzlSTTk2K2ltUThjMGw0Tkw1NG5Q?=
 =?utf-8?B?TENzZU1CQ0RXbS9DclJZTzBKc0o3NWY0VS9xck5MM0U2NTJlUmpjYVlvY09n?=
 =?utf-8?B?M2UzOFlGM3MvajJaeVhKcmY2VXhqTFAvZnNzb21DRmhHSVZZT3J6cnh5UUVz?=
 =?utf-8?B?RFdtM3FEaHdsMExLVFB1bWgwRzB4VDZqdTNOTTFzS0hvN2hUWERqa2pFNkpP?=
 =?utf-8?B?TmtJVXZ5UEZ1bVBlMW14K1ZXYXF3NElrelN1NzJZbVpKaUFRejlUMFMrbXJk?=
 =?utf-8?B?Q1lBRjBwRTdUdy92WW1nM1NsUXUzUUsrcGtBQlZCdlFVcjNFR2xCdWZjZ0o0?=
 =?utf-8?B?T1E5Y24ybWFDMXlGSDJXTUVGK0EzMHVtaXpVL0p4UXJDbEhiUStPakMwOCtX?=
 =?utf-8?B?ckZWYWV5bjJVMmJGT1pLOXFEM050TG45d3RETndMTytITnpzT3ZOUHIybTAx?=
 =?utf-8?B?SGY1dHNaWHRFUEFEMHRHQm5FQU9TaFhoMzlCMUYvalZia0VGMDFrZFJkQVNq?=
 =?utf-8?B?ZkNjeG9HZ2FzTDFqZnF1cjczR1MzQnQrcEwxb044bDVnVEFzUUNlcEY0cDE1?=
 =?utf-8?B?Vjd5VElVRy9wNG9VaUlyR1B1cXRvbTJEVTQyc2c5UHpVb0xQNnhZWTNLQXNl?=
 =?utf-8?B?T2pnb0hscXoxbllXVnR5UVc4dGpXVlh5cHNQWWc1WGZveGpadEYwOEd2VVgw?=
 =?utf-8?Q?Eu7Gd6Zz3an0q61xbZG6?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFl0QjUyT2FpUDlXL0l6cVBQeFUzaUlXWlZQd0cwZUNPT2FjaHhLSS9GY0ZV?=
 =?utf-8?B?Zk8wTVhPbDJQVmNzOVc5cnE2eFg3THJiUzd0Qy9rb2g3MjF1emc1N01QcTRl?=
 =?utf-8?B?ck1DK0FNNU80QXFlZTQ2MUlpdExtSlhmOVNEM1d2a1BMUXZheTFwYmFnRm5i?=
 =?utf-8?B?SXpxME5IU1ZwNkRpamtaUVVvSURLb3h6LzVRREw1UHlvVU9uTVpySU5TMVdS?=
 =?utf-8?B?MDdIN3diUVlQR3A3bi9XVWhKenFmTWRyZ1QyNmx0OW5DQ2t4QzQwbnZCWVZx?=
 =?utf-8?B?UjNIdWRTb1pVT2JZQzRaWTA3RG04TUdjRE0yWm9WMlVlY2JuKzA5WDd0c1dF?=
 =?utf-8?B?aVNORkw0UnFKTzlWUTk4TnNjaDdMZTR1eHcwZWlRTGlTdU5LWmpZcDZnOFpr?=
 =?utf-8?B?TFhuTGoyT3pscHhOT3RqZFpHRFNYOVphVmJlM2FiT3BTY0JHTEp0aVFSZEdh?=
 =?utf-8?B?eGt4bkVsalg3MUJuMUhqRXVHR0lDeVdqb3JFaWNlZzV0RVlpbUZ2bEtRTGNh?=
 =?utf-8?B?WWJtcEtvMUg5K2FoSHpkdlhjWERXRU81VjhFcy9VdW1xR1BlWkhEK0RoV0VR?=
 =?utf-8?B?ZGRPdWJNaFNpNzZLT1U2ZjhZRW5JUlliZUtGa0Z0Umh0Zk8yK3pNTmNMUENW?=
 =?utf-8?B?c3d2UTIzWHFEY3Z6cFRwQStVdWhhdld5TjJocUtOWDdVTnN3clkwNm5ZWDhl?=
 =?utf-8?B?eDNXK0pEL2RYekpmaVp5bGFpQlYyeWF6V2d1WmpJNHNDNUlFNjB4aTYrYU9S?=
 =?utf-8?B?TTZFYi9JdEFnVmdJeVVrWGhXeTZxM1pWTmVhdlRITkQvYU9lbXF4VEFsNGpV?=
 =?utf-8?B?YU41WnpvazhXNzF0Tk93ZUtCc3p5VlVBNitTQWtvVDBobzcwWjh4VnNMSEpY?=
 =?utf-8?B?NTFsZ2dxeEIwb2FNeElCVlBnNnI1VCs4eGY4cS9HSUJpQ1JSMGs3WXMzdjRv?=
 =?utf-8?B?Z3hsTFpqYllNRmJSNy8rci9zTHdvM0doR3ZKY2c5cGdLektYQTREQUUzUTF5?=
 =?utf-8?B?TnhYbGc0anhFS0FqalV1WUNEV1I4bTU5NzlianZ3Kzl4OEFGMHFYT0E2c0ZV?=
 =?utf-8?B?cTFRV2I0VW1KV3BBd0UyMHZkNEFNTHpSUEZUenA2Y0R4dzd0NDVBU0F5WnlY?=
 =?utf-8?B?UEpnT2xHTnlZMWlzdGpVU0d6a3hHaDhBcjAvWnh5UHR5SWtvNmh5MDhLL3hH?=
 =?utf-8?B?QVk1bFhST2tNU1RPMXZMR0pIVjRsTjExVkduSWRRRWRaVUp5ajRjU1d2d1ZD?=
 =?utf-8?B?ek5ZaEE3ZnM1NHY1U1pPdE5HeW5GNW5Ya2dCUmc3YnBZL05IckNuWkQzMnRZ?=
 =?utf-8?B?M2hmT1o4OXNSQjVSanNVcHhQWnp6VzUyU0cxSmFLc3AzMXIweXR4MjdaQUNn?=
 =?utf-8?B?a2c4VWN0aVFwQ3JDZ2IxT1hYWjEyNHhZcXBKMkdqNHJCYjU0cCtwclBBUXpr?=
 =?utf-8?B?cFZ3Nm5zbEtsd3FndjVqYkNFYlA3UGtpb2F2cloyMXJ3dndsdWtvQlhpZXdt?=
 =?utf-8?B?TXMyNC9qOU04d0hTREFGOU5WUWl6eEgvcFlobW4zQ2Y4RzBCdFE2UFVqZXd3?=
 =?utf-8?B?bWRabk42UVBTRXQxOEp1UWJRQkNnamlIMDhYRGhhSVYxdXpESXUrRk12cWE4?=
 =?utf-8?B?Si8rM0drVUh0WWZDYU42SThPdGpRbDJVME43Y2NyZ29yQ1NqdmFucHM5NzJM?=
 =?utf-8?B?YUZKSndaK2Q2R2M5SjhoaGhtK1U4Vi9waklOckczNVdNM1djYklocXNCZ1hr?=
 =?utf-8?Q?dhi/UcTEuMDz1nN9Wlqy9wGHcsvZ8xU9bwUJtSo?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6325179b-ce34-401b-ec3f-08dd8725384d
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 13:53:28.6581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9497
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



Hi Petr

> The generic FourCC format always prints the data using the big endian
> order. It is generic because it allows to read the data using a custom
> ordering.
> 
> The current code uses "n" for reading data in the reverse host ordering.
> It makes the 4 variants [hnbl] consistent with the generic printing
> of IPv4 addresses.
> 
> Unfortunately, it creates confusion on big endian systems. For example,
> it shows the data &(u32)0x67503030 as
> 
> 	%p4cn	00Pg (0x30305067)
> 
> But people expect that the ordering stays the same. The network ordering
> is a big-endian ordering.
> 
> The problem is that the semantic is not the same. The modifiers affect
> the output ordering of IPv4 addresses while they affect the reading order
> in case of FourCC code.
> 
> Avoid the confusion by replacing the "n" modifier with "hR", aka
> reverse host ordering. It is inspired by the existing %p[mM]R printf
> format.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/r/CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---

I just realised you forgot to fix checkpatch.pl with your update:

https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/1938479b2720ebc05aab349c7dc0a53921ff7c87/scripts/checkpatch.pl#L6894
