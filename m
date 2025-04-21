Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CB1A95157
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 15:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630BA10E089;
	Mon, 21 Apr 2025 13:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="MCVVNlbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011028.outbound.protection.outlook.com
 [52.103.68.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B6010E089
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 13:05:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAaVrqkfcmBdSIgHhhQ7HjIN/VB+U8gSKCglYFOW/t0aSm58W0IF9595PDm1iuG5yNKv2tr2r3ePus5Pl5LMtSWyJ/4rRGlIO6p4gj2I0ant783FvGvdcFTMNx45bvvyNFp1KWrvT6UeXmQuOqcA0A1zl2yf1+qjot20Vkp6Bmc54gZrJfa3hKhKMf6P7z+htcfmBc6USEdh2L+GN5cifJuoi5PQtKjdSGhmeymiGdcMy4Bn4EjxlzNS8GCZ7bPDlrbclGGp6wKKYEt1jtqrRnQQbyVk9Vvv/hxa7YIA+9WCk2fkEM8hwyG4Q5jf7Vg2X963GaNPLuDzlT5O4XY6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pz6yFIJdU7o7k2VMNkNir+44fv5yM+FQNgigBPbFz5Y=;
 b=IA9BhdbUe7cOumjCHOfpv9rUbK4arpS30o3OS7Tp5EFvjqlQVAV8iXxf0Qhk3YfAZdkcV/cVXK3z2u0fzyRdFry/L+jBoheH8JVw03IGulGTND5P7u5Hthc+EqgBUOWBIdt2VDHIZ4nAS/yQ+T6HC4ubXqHq3qaILAbyqn9mGK53A0WWEF2mcjq14ihJIj66PRPJxAyUtxeuVDfB8c/Wf5HcM5PxDJWCN0CvX9rPmc9oqNIAjYWanSviyHiXvF8jle00s6oCbIZ5jUBsna0W916keITRMoYkvp5QkfZ9ptM1lQa8xIq+Vq6VIE5svOecxHH2jNA9hCpiw2Omx9LWpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pz6yFIJdU7o7k2VMNkNir+44fv5yM+FQNgigBPbFz5Y=;
 b=MCVVNlbHDgOaFskb1qYiPXDeOsMvlVWyZC3rBbSoM2tm6jKOwxLK00xPvBfZB0gVr4fFCqYXMlWZM2Lar/rvuTaZZMFyXpT5KJbqJETo3tSKV6T0r2lJ2Qjh8vTzXM6fbmp2YFwYDWubUCyoRpEQ1pH4JM0pRBXm8BVO5ftqRLgRYhq1HRq/w0LVd7kGIsGaF7s9WOBIQ+KsGNsnUFZ04lJITQmlQh7X1WmjHWTnjaYJBwsMRtuHGP1C+946y6rtvt+KlEYgcq3UB5qEPbEgRguwVtS9H8eA8Bkj6eHXPqvAnbec/7+zRIMhkztR8f2r+WVss41qD7gXdbkQiOYJUQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB6492.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:75::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 13:05:17 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 13:05:17 +0000
Message-ID: <PN3PR01MB95978C5635B676286A9F0EB7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 21 Apr 2025 18:35:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 airlied@redhat.com, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597D506487C3133B0358CE5B8BC2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAY0hRvNCi0y6rlt@blossom>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <aAY0hRvNCi0y6rlt@blossom>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0052.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::17) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <9ae6da7e-729b-4372-afb9-f64a44f7eaa9@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: c9700d05-8db9-4af2-99ba-08dd80d52969
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|15080799006|461199028|7092599003|5072599009|8060799006|19110799003|6090799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTh3dmgyclFKQUxiaFdZNlFRVWtWRjFMOU80dHdOcE5qbFJTaERyeUVuK2NL?=
 =?utf-8?B?MGliSk9uSDhWREVIeEp5bGp0QU5yY1UwdVQ2ZksxTnExVStpQ1hlSEJZU2Zi?=
 =?utf-8?B?elMvWk14bjVibUNTT0F0M3hSUG9JM2t1ZjBOam5IejhldzNHT044eW5JZ0tW?=
 =?utf-8?B?OUtTRnpwZTdIRTYzQ1NoTnpWNG01bzl2NTVJWVVUZHY2VUJKVWRyQUthNmZZ?=
 =?utf-8?B?Tms5RTllVldzNENXZThYU2s0aFJCd0wyYnp4ajZrZlJqZDVHOWRjZDJaMkha?=
 =?utf-8?B?VGNISGZTK0dCSng0N3lrVG9DUlN1Q2g5RS9MaWk4T2JCQkhRMWVyWVgzVU15?=
 =?utf-8?B?VGEvQUcxcHh1cVZiL0g2ZVhjNnFQbzhodE1pSkFkNllUUm5Cc0crYUtvdlY2?=
 =?utf-8?B?ZzVmKzZjUWxqemJYajBXV05STUZjMW1relNtQUp0Q2oraEZVd1lYY3Y0eGpm?=
 =?utf-8?B?dWsxNlJ6NzJzRzJqWlZxTFNqcjkrNFhnUXVaelJoRlVUY0QrMERkQWZRRUZl?=
 =?utf-8?B?YzR2ZE5UdlVUVUxLeVRWZ0htejZKWGVFUG1sclZPWWhHNTZaMGN5WjQ0MVJP?=
 =?utf-8?B?ZG9VVm1zZEw4OUtSWUxTa29XYzJkdVI5dGtnOHQwRlJtWDRiSnpnV21oOWdq?=
 =?utf-8?B?RncxNHVzaDZZMC9nNFV3eXRqNUk2ekVUOExDMFFsNTVBRmp0YkRlL1BVK05W?=
 =?utf-8?B?UzBWQmNJTGVHZHdvQTFBTHR6WUo2aVgxS0ZFRXMxcUJHcTQ0a2FkMm50WDR1?=
 =?utf-8?B?dld0djlHUGNDV2hXb3Y2ZjV3ajNxcS9wcitxYWZNNWcwd0JpWVFPbkQxSjJp?=
 =?utf-8?B?RnVKU0NMNHN2cTVFb2prSFBmNFhsUjN3cmE1QWliVy8vK09neDkwVHB0VWtP?=
 =?utf-8?B?OEVVUnBIcDRRYjRDSHYyQjJFY05JcUk0WlZxemxLTjVWZTJrTVI5SitZV2hj?=
 =?utf-8?B?NWRqV1lPaERvRHBDbU5DMnRkS1dtdVFQZTFEVlZtZExDRDZtcXR0Qm5kSGZ3?=
 =?utf-8?B?Zmx5T3ZUWVVLSEZoL2hVWks3V0pBdU9TSkFzRTM5RnZ3OEF5a0RseVU0cUUv?=
 =?utf-8?B?ZjY3M29NTE01dWlVQWpkWnFTTFZoNFFlYXAyYkwwZUtaRXJvNnJxYmNCbG9p?=
 =?utf-8?B?ZXVaN0dwSStDeHpVSzlUeGtZUmY0WXhwdDN2NWFydzFxUUJnUTM3Wm5BU0t1?=
 =?utf-8?B?b20vbXE4K0N0WFN1cWYrOTdPd09TRjRBcE5tZ0prYnN1WU12NXFwMHFtZFJW?=
 =?utf-8?B?RXdiN0JKYWdiTXBNV2tVZUFwRXp0aTdCN3RvdWI0VXRPTVBpUGR5cXNWVHUw?=
 =?utf-8?B?bUlNMmFLQWRPWjNscWhSaVhOcHlERkg0QkIvUVJ6UFhvaG9Bek83ejJsamt5?=
 =?utf-8?B?U3JHVE5JZXhhbldTNER0akNKWTUwR2V1SStsdnZpRnVZZ3hvUkNPN01iRmp4?=
 =?utf-8?B?RnkvS2lMOTVpYVA4T2hYMmNETVpYWWtCd3NqTk9QdnhEVXNaZ1VsYWl1NHlx?=
 =?utf-8?B?RlhOV2FHWENRcGNGN0JzZUZnUVJvckZDd2VvWW03SEVaK24wclM1UEFKV0Q2?=
 =?utf-8?B?S3FJZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVpiRG5LNWd4V0xyVzZTY2tyWjV6RVlkMm8ycGxhMVJ1Mmkwb1RUSEJFdkhS?=
 =?utf-8?B?aDdKcGFFT2k1bHp2U2lBTmQxSGhrSHlKSS93RTlqWXNpSVpHMDlTZHN6WFlU?=
 =?utf-8?B?QkhValB1dURJVEVLNWRTTjFsNHFLUW0rSXk5cDZUNDhoclVPY2UrSzFmbEJB?=
 =?utf-8?B?MHhiNXRlNHhFMHdJbTNsWHlOT0x4cHU5VSsyZGp5WXNIcnpSdXBKUHNlOUxQ?=
 =?utf-8?B?dVdHTjVXakU4eHZ1UGg4YlBybkhIcFgrd1ZBa1poazlMYTJoTHZzbzNsbG54?=
 =?utf-8?B?V3NmYks2MStnclE2TzBNRm5KMW9BQWxvT0ZHM3FLclBhbUxhbTBBdEQ3Qmt6?=
 =?utf-8?B?dFJiZCtYZm9sVjlvc0h3M2tLWjhsOENicjhBY016VEJHS0dCMjNocnJOWHRy?=
 =?utf-8?B?MXlLRVJBc2hLUVNGd1JuQ3Z3N3JPckgxTFpiWmJsbVNPdnpkeXZuaEhRS3JX?=
 =?utf-8?B?Z1EzZGRpMk85WjUwWHI2VmEyd1BLUHJRS1ZMSnRNM0Z6SnBwdTRYNkttWWFh?=
 =?utf-8?B?N0tSbzhZaVF4VVBXUlBUNWkzZXhpeTNORlhvdjl1ZWdLVDhqWVdCU1lzSE5V?=
 =?utf-8?B?UDlERTZYdzlYVWVndFU4YmZ2b2ZraGtZTjN6YndsdUQ5dzZiRWhYaUlFRlpz?=
 =?utf-8?B?UFdsWWRzV2lJZHZvNVZ1T0FDSE9ra3Y5eUljckJtbkZXSFFURmw2QmF3b1A2?=
 =?utf-8?B?OUhPTHFOQ2ZHcmxXMHlYT2IwL1VxLzBMUDBBSDE2TW54aDRKeHV6R01rejJq?=
 =?utf-8?B?cUtweWVzVzhjOHRFWUt0RnN6UVdqdTJwRHdGaHlEOW9vbGtNaWp0OStlaUF2?=
 =?utf-8?B?OTNnN2ZrVytXVlpydDVLZEZ4VmxMT3AzdUdnN0d0MXBsRHFVa3ZITDBEOVRD?=
 =?utf-8?B?ZzN5ZTlydTRTQUhzc3VWTS90dmEremVTaXlPRXM2bXVGL1ptTDV0Z3E0Wjly?=
 =?utf-8?B?WHNqQlhJVFAxclVYeEt1dkpySWQzbGIvMUF2VlJlMGZnVHNXZDdFUjNDVnpi?=
 =?utf-8?B?SlpyVGlpQ3AySGxRck5laDJGTUJldnNnSmFsM2NZd05DYXVVUUJvZk1iN0xR?=
 =?utf-8?B?NjhhOVFJRlpYT3ZvL3JCdjVkMVo4VGIwOVNLaVhMeUJ5Nlg5eFREQ1JuL0VC?=
 =?utf-8?B?VmsxdFBuRTJmNzZWdGtFZVpYeDZmRVR4b2xpOFBYZ2lCRUVHbDVFZ3ByclNO?=
 =?utf-8?B?b1AxcDA1RjlGaFJPTFBVbkhOMlJVbGJML1Bsb0N2ckd4dTVZRjZKOU5jUWlU?=
 =?utf-8?B?dVRNdU0vc1QxVHE5Z1dONWgydzBSY3k4TFAyZkptR1ZLL05ybEhVTE9oU3h4?=
 =?utf-8?B?Y2xMNk1jS0h5bWlnTWd6Uzl6em5kT2htbWo4VUhzZkRhWVNKRGIrRTBWV00r?=
 =?utf-8?B?T04wNUw3MlZBcnZrekx6cFN3RHNKaGI3Y2RiWk9EOVpwckNSN0syYWFsdjlN?=
 =?utf-8?B?UXBDdDIxZXBWZWcyTTdzNWlPMHp2bmhHRklIMU9ObGFha284WFJLNDFnZ2h0?=
 =?utf-8?B?L0xvUjl0Z1JtMjlzS2Q5bGhsRWhtN0x6UzN2ZE56N3RFUE9vdGN5SzluQkVh?=
 =?utf-8?B?ay9pMm1jaUJtNnMxRjZXbm9TQU13WlRzeVNpd2ZjZ1J3bUNpM1NPUHRRdmxR?=
 =?utf-8?B?NERWeVAySkMwc0tHeXFRakhxN0dYUHFLKzk1cE5TbXdJUXhINklFR0JpWEFK?=
 =?utf-8?B?MEpaRmpWcCt3T1J1RWFxVTR5MGVwOC96ZkUzc0FBb09GOUlPOStmMlFxZmFQ?=
 =?utf-8?Q?PAk0nE2vlGn/AQ8/G1NpvIzYdaG9fcHpfyAOmsn?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c9700d05-8db9-4af2-99ba-08dd80d52969
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 13:05:16.9639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6492
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



On 21-04-2025 05:35 pm, Alyssa Rosenzweig wrote:
>> Can I have a feedback from some DRM maintainer on this? AFAIK merge window is over for some time now. It's been more than a week and last time when I submitted, it just stayed in the mailing list without any feedback.
> 
> DRM hides the merge window from committers so that's not super relevant.
> 
> I am a DRM committer and can pick this up if necessary but it's not
> clear to me what's going thru with DRM vs elsewhere.

All the three patches are intended to go through DRM. IIRC Petr, the vsprintf maintainers had requested for that to be done.

The relevant patches have been Reviewed-by Petr as well.
