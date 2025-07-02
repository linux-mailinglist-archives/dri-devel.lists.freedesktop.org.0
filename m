Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83F1AF132D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2222010E329;
	Wed,  2 Jul 2025 11:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uDoA+9hR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0489810E329;
 Wed,  2 Jul 2025 11:06:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZdT8zgY3Jo6jPlzct3xRCfsKjRrw1MCx+7Z2HOiwV5su6EZgMB2PDvOffskCjHXwL10Uszv+OB3P+M3KLMBP0iYnQad2LEkpYE5Kp8gxWqhtUHASMaXGxjhSM93BQNlaF3My4Eu2HtS1WIOd/1opYndXHunltVPsJMlpH1zblLiCMChTnOwaaAhWCztDfclSAVJMc9ygcnA/j0NZbInT+OQ0398ZABFvDlJSM5QYRlsU52sEXoUj6xoEyWoizH5liCVnHNU0csUwuuUY2svfORO5eJ1IAGQ1EngNKXAf4oWxe3mQWaNK7BJcO2QM00xOGa0oBjOCVXRtY8GYcfcKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ht39CetnpSoZKUOmtHy7I6owb8V7xpZxt5o1/RGwFOw=;
 b=YqINKD88Wl633bnevZ00rnQf2OgidLWX2E5wBZuyb1TDzZYlX7DizUvf87s6Zs/T8qglwHR/eVtQAVoJVpsMBD9LFY7RWoAi3LIXoUxRWPL5AzJhX0yhXVbqY9JzH2o8iXrhCpOBd4FHBjrMeKGV4c5iNrmygu2Q7VBxicuLz6goP10d5ww3AW0HCvKln9ccDAQh+r29k0NAPsdV0pt6w7ulGuxWvETMnTZECKHqq8STW15kgkhqh1MY+bDeUCYeZl9RjlE8f3949utqg49xCMMhDzuvG6Ru5CNImKEuBOMggjtwt7pkwQWb6MqWC9ZCdknMkEHiMm+xfNs6XwzsSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ht39CetnpSoZKUOmtHy7I6owb8V7xpZxt5o1/RGwFOw=;
 b=uDoA+9hRcj6pM6jAcRDP6QnzSp6EBcHuMY/IScXg1fOfGTFnQUo+68TSx1dgUlzGa28gkU8gxhZvURS36JzAf5qKC0ETV4pbA/bfU5qmcijbiF+mldQhrEasPm1RELsyZ4Q61CBD1Wlg9DShWREhIu0/MbS2OwLAa2WWfJQGwCid6XNQ7pfk7AwDM1Q/Yw3EcfJbuxjQEbg/WX7+Rr/4z+hy0jEP7UiOTUot5ibr8Ev6fgLu1W3LNNrLxELQwqixUf1FRIEc1nThoXRi6aVLEbvCJeJXvmwZovRJh/PKnFz/+GPctlIzEtVG9znCb0p0HY2Qr5VXczYRr742EGFm4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB8537.namprd12.prod.outlook.com (2603:10b6:208:453::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 2 Jul
 2025 11:06:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 11:06:12 +0000
Message-ID: <f19addac-54fe-4fab-998d-e30a22f965ae@nvidia.com>
Date: Wed, 2 Jul 2025 07:06:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Documentation for nova-core
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0023.namprd22.prod.outlook.com
 (2603:10b6:208:238::28) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3690b0-09b4-46f5-7e8e-08ddb95874eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkswcW9PNWdDNkJjOVdCMU5LWkVQb2hCR3lHMG1EVTNNZldHZEVuc3lvaFJS?=
 =?utf-8?B?dUwrQy9UOG9rMkdGVFBpM1RSVEZVU2pvc3hDQmxwcDZSMWppQ0NKYzMvcUNC?=
 =?utf-8?B?ekczMGE4SGpBL3dzQlI0cVJHd2JIZjMvQ2I1SWttcFZxWHpZR01ubFlQUFMw?=
 =?utf-8?B?ZzhRQndaSGJEVUkzdkdlZWNiNkIyclRUeXpTeVFSNzlIaEhhb2QvK2hNSXV5?=
 =?utf-8?B?Kys3cXhQM0VCRDQxSVloMFBrVWsyMG4zSmhBcFhjdzBlN1pabXZtWC93Wnpw?=
 =?utf-8?B?eVBHZ21DbEFGZW8vVWlNZitzZ05VWVA3WEVQN1ZrTi9GSysrNWtnaGxYZzM4?=
 =?utf-8?B?SmV0aUgrUDlGd2I3TjJyLy8xdlB2OXpvR0dyMHl4b2t5bkdTenJZRjh4VHk1?=
 =?utf-8?B?UStHdHQ5SWttV2cySHIyeG9QajhZU0RQZ0U3KzFYS1RMdGI2blNKcFY4UGZi?=
 =?utf-8?B?WnNNL1JYb0dPWEE5SzhDRmFuUzBHcVRveGdYQXc0bDcxNE5xc0JHcmtKeHEw?=
 =?utf-8?B?ZFA1NWdhSWxYRUY5ME1SQjM4dGxTY1luaExidy9zZVdvcGM0a3hSUGt6U2ps?=
 =?utf-8?B?MmtBblByYlFkV1BzcXpBa1I1Q2hvK3kwSjc1Qkg2S05iQzQvQlliSGFvTVNz?=
 =?utf-8?B?U0lxSVU0NGRNMldlQnQxRjc4TndFQ0d0b0hVOXhXemJSNWs5eGlyZ0RsTTkx?=
 =?utf-8?B?bGpUc0haWmtYRFdiUEFSeUxtUW9aWno5b2RGbWhPbTVQYUNSUW5TUTdYd01H?=
 =?utf-8?B?Rk9KRlZKTHBVbmNlL3phN2lOU3d3cHNHQ2R4MTJFNGYxTTduUmprMkxyNXhh?=
 =?utf-8?B?Q3Z6TGFNNWI5QmVteGNLSk1URXJkSVd6R2RZRUdlOWpjanFueUZNS1ZSeExO?=
 =?utf-8?B?Y0h1SHdORXJuWUdXOTBYZGthRklpWEQwbVpPbUxhOUVHV0lEeW05eXpzZmsr?=
 =?utf-8?B?WFkzbk1xT2NSeUFwUDkxSUwyVTl6OHJneEovWVNkOTNSMG0zYnRJVWMvSVZz?=
 =?utf-8?B?RzdtcGMwUEt4Q3h0Z1JIR09hcmF0Umo0bmNuT1JjNTI2ZGN2a3pWOGRKSnZY?=
 =?utf-8?B?bER1cTRlWEpmRTdxZ1VheDZCeStxNlZRSTRadHlla2lmVFZDTmNSNER0Slg1?=
 =?utf-8?B?Z0JKVFpJS3BScXRzU1hnd00ySzFNTFlOekdJRVlUSXdiQ3puSG5mZENSYno3?=
 =?utf-8?B?WFFVT0Eva3NGNzdWaVZEbVRzdjBsZlMwZVUvbzgyMThSY0Y4bEYvZEcyaVNF?=
 =?utf-8?B?clVUVjRnUHNkZjlwTFBJTi9WNTQwQU8wY3hRZnpzT3N4R1VsbFQySktabE9n?=
 =?utf-8?B?S3hNSDJUUWx0VmkxVkxyLzhHbEFuYjdFSlJodEl1YjdFZ0J3M3M5SzZSTkVP?=
 =?utf-8?B?YmFsNkhzZWE4aWdkTzBJNCtJVEVGYURLVjRzajNMd0c4SGxoak0vOVBsU1FO?=
 =?utf-8?B?WUtaeVh4QmFkY293OEk3aUlrQ0JwUWgwR1ZyRUJZRDhNVWFMMVRJM1A1Qmti?=
 =?utf-8?B?SU1IK1JRUGNtQmhEa3VSYXdiK011SjRSbmR3NnhOcXZDQ3dkampud0hTd1R3?=
 =?utf-8?B?VzAyaUUyMGoxVHY4Q2hST2Vna1Vtdy91SWlGQ0J3NDJmcTI2WDBYNGFOOHN3?=
 =?utf-8?B?RGxiR1B5Z0F2TFRRRDZsZmxSUnpHaERhYUFlZlY0MFNyYXdmM2NYdFNqenlm?=
 =?utf-8?B?TlVsWHlYZWR0aUpJOU8rN0p1TXdBNDJLYm5iODBzWTQ0ZVFWTHhqQVdGbzQ0?=
 =?utf-8?B?c25naWxlVStsYUZqdmM1TEduT0FhV1laQW9hRFJBTC9xWmFLTnNlWGhmRUsr?=
 =?utf-8?B?KzlnNzY0d3ZsYzk4MC9TKzBvckhrZGtBUU0yY2FXejAvZXVPcEpZd0hzZDZN?=
 =?utf-8?B?UTRtaWk5VUJueXFvWHhUdW1SZHArZS9aWUtBRGl0MlF0ODJqd1Q0YXBrZXM5?=
 =?utf-8?Q?4rmUnQHW5pk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGVnd2o4SFFPenByV1hrN3B2WFZQSTBUdjVkbGg5Lzk4VENnQTcrTCs0WW04?=
 =?utf-8?B?TzBuMHNlSDcxQ2tMbytXSHhjbE9VN3BkL25aRW1GdjZlTE1USjNRdS91NFMr?=
 =?utf-8?B?eFNNR3Fqck5jd3Bib3dYd1RrRG9RcWx2R2x0ZTlWRlJpODJkMXRmTFN4Rmhy?=
 =?utf-8?B?VjBFWHN3clpVUlh2VjNCVFRXU0hmb3VDM1pyZjRhblVOVmQ1T2xaTVpxL3VL?=
 =?utf-8?B?bWNLMUcyT2NSTE42N3lUUDh0OVRERHBHbzJTOU42ZURNZHM2T3l4bit3dzhB?=
 =?utf-8?B?VVVPZ2puTDY3WWVqcTM5L3JMamdQV2tqYWdQdXE1OXQ1ZktZSnZoVWNEUmNR?=
 =?utf-8?B?ZVdvdW94NnY5WnM4aWlRVldmRGVaK2V1Q0kvQXJvMmorbU9keGpHZjZsdS83?=
 =?utf-8?B?Yjhlc09JcC9Za3BmbXQwdnk4c3dSSHpQczQ0bytPT3o3cEdLOE9YYUQvVHBa?=
 =?utf-8?B?UHF0ZFl2bHEwcHJGOU9tUVN4Qi9Qc0M5MXl2MzJPcmVNZDhya2RkSHFZM2ts?=
 =?utf-8?B?WUw2eG1HaUZSVVNiNHVBb3ZwMzNCbEZvNXpnUk8vK3NWclNyRmZqOGlPdW91?=
 =?utf-8?B?djg0M2V3SmpyUWplRmFscWl6Y3VrM2RnVy9uVVBFUjAyVHJSZ2M3R1JMUzFD?=
 =?utf-8?B?d3dJdkcvQmNseXd1K085ZURNUFJPb1VVaGhQMFZjVmlCUzcwbXhPSFpXVnF6?=
 =?utf-8?B?YUZhYXhIcSsxcmpvWG93TkFHRll3Zmt2QkR3cTNBbjlrTWlsSHZ3RFNpN3d4?=
 =?utf-8?B?UlFJMnJCSUpBNE1xNnVGMndKZDlobmdkc3F5QlB5YjZFT3FPNGxMa291a0k1?=
 =?utf-8?B?Y2xUeTZpYVYrb1hPTkdnSjY5dDExZkR3M05WQ2FQWmptVUQxR1puNzhrQ0FP?=
 =?utf-8?B?KzE5cncyK2E4Y3JGNmowQ21hVWE1T1pYS2pjcHNsRDVLWlBwYndWQXJvdExH?=
 =?utf-8?B?UmRBTXVES0FIWTFsRm05MHJkdENwY3Q1MW0xaEJLcmZDZkwyN0lOQVpObHJx?=
 =?utf-8?B?bVd6dVF4VUkzR1A4aTZpWTZLdTJldFYyOEpOMDA2dmY0SFN4czRHRzNMTDFl?=
 =?utf-8?B?VnFLKzBLVEl0TmwxYkprRSsxL0hVenlVQ0lQWXFnUzN3dndkOVZBekZ5Mjgw?=
 =?utf-8?B?bThublRnemRxVHVBYW5PazJ5bFVxaHJxY01jUElkNk1xZmdHaVhPcC9VbEN1?=
 =?utf-8?B?QzkxMmVnWElwS2cvOG11aENVMmM0cmpnanJQa25kRFcybWpSMWRPbTRNdm4r?=
 =?utf-8?B?WDZ0ejFuT1ZBZ013anEzeDRBbXpqZkNKN2kvcGFQd1dHbTk0Z1NJWWo5QUNC?=
 =?utf-8?B?WkM0UmJ4aUJmQmxpMjFZTDJYTDF6WFlNYVdQZHdqY24vQUVJemtSdldTbXRJ?=
 =?utf-8?B?QkxjLzVqQkVhL0VUd0xQRFFNREJ6L1hSb0tISEJEMUl2L0lSSGEvWVNJcmpX?=
 =?utf-8?B?MXdPeDFVR0ZTL3gwRTU2cmpCQ0NMaXl3bG1SUmNHUWRoeElrWUkzMzNEQ2Yz?=
 =?utf-8?B?UnNFSTRkY1RrRGVySXJhMFN6WEZHNTlvdjlQTko1RWw1QlRRSVd6NWZSSnpS?=
 =?utf-8?B?ODZSaHZEM2JSRG1NbGxFbFMrUUljZjhoWC9HYUdadUI1L2FTeWNaRFRQM1d3?=
 =?utf-8?B?SzJGYThmc0ZLQ1RwdUQ0TWVMc0k4d3VHTTNXZFFsWlhobUJ4RE5peFhhdGVV?=
 =?utf-8?B?NE9nRTJPSmJqRnFiQTJWTXA0elVCelZpUzh1bE40cGVwY3h4bXZsbkRSaUF6?=
 =?utf-8?B?SVdySXZ2VDRRbFQ1MTRad3dzS212b01YYUM4aUkvQm9VaThtdlp1SVNaOXlP?=
 =?utf-8?B?Z21adHpnOW1OV3cyTzE1RldOT3lVc1p5SDM4Y0hwQkxIejVQTXA0aFYwYWx6?=
 =?utf-8?B?cmR2bUhpcER5OEVJSFNWTFN3TDRUbmdSWGx1TDJIZ3p3YUhDd2lCY0VnU0dF?=
 =?utf-8?B?YlA5NzZzSkVPQk40UWZVVjlRUE5sUVlFWDZZZmFOL3ZCaDNycVVaOU83OWdv?=
 =?utf-8?B?ajNjbVJCRWFHSTFqdmtxMWRDdDh0WDBPWHdJQ0xtUzVlVXZQYXh3aUQ5TDBZ?=
 =?utf-8?B?T0pDWGVWYmhFT1dSSVQrVGNieVlodjVjU1hYQUlicmlTbWtiSHdUQ0JDQnFI?=
 =?utf-8?Q?4H1CiiDH+h6Cr1A0fz0P9M1gA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3690b0-09b4-46f5-7e8e-08ddb95874eb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:06:12.8057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnAL7KCvWvdAU0zVT7Xqs9rvOhahF+n2ZNRiBc+nR+Mkub8DtIlbFHgHECTlwexlGZfOOpYzEDVGlUncHoBGCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8537
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


On 7/2/2025 7:00 AM, Alexandre Courbot wrote:
> This series adds some documentation that was relevant to the FWSEC-FRTS
> [1] series, but wasn't sent alongside it as it was worked on in
> parallel.
> 
> It notably introduces a lot of HTMLdocs that adds key explanations to
> understand and work on the GSP boot process.
> 
> [1] https://lore.kernel.org/all/DB0I8WAH970B.25D3S59AYF85P@nvidia.com/
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks a lot Alex!!!

 - Joel


> ---
> Changes in v3:
> - Rebase on top of latest nova-next.
> - Reorganize patches a bit and use standard prefixes.
> - Convert diagrams to only use ASCII characters (thanks Bagas!).
> - Move sysmembar documentation to the new `SysmemFlush` type.
> - Reword things a bit here and there.
> - Reorganize order of `index.rst` for a more natural flow.
> - Link to v2: https://lore.kernel.org/rust-for-linux/20250503040802.1411285-1-joelagnelf@nvidia.com/
> 
> ---
> Joel Fernandes (7):
>       gpu: nova-core: Add code comments related to devinit
>       gpu: nova-core: Clarify sysmembar operations
>       gpu: nova-core: Clarify falcon code
>       Documentation: gpu: nova-core: Document vbios layout
>       Documentation: gpu: nova-core: Document devinit process
>       Documentation: gpu: nova-core: Document fwsec operation and layout
>       Documentation: gpu: nova-core: Document basics of the Falcon
> 
>  Documentation/gpu/nova/core/devinit.rst |  61 +++++++++++
>  Documentation/gpu/nova/core/falcon.rst  | 158 +++++++++++++++++++++++++++
>  Documentation/gpu/nova/core/fwsec.rst   | 182 ++++++++++++++++++++++++++++++++
>  Documentation/gpu/nova/core/vbios.rst   | 180 +++++++++++++++++++++++++++++++
>  Documentation/gpu/nova/index.rst        |   4 +
>  drivers/gpu/nova-core/falcon.rs         |  29 +++--
>  drivers/gpu/nova-core/fb.rs             |  10 ++
>  drivers/gpu/nova-core/gfw.rs            |  39 ++++++-
>  drivers/gpu/nova-core/gpu.rs            |   3 +-
>  drivers/gpu/nova-core/regs.rs           |  18 +++-
>  10 files changed, 669 insertions(+), 15 deletions(-)
> ---
> base-commit: 4092e1b41202ff39aad75a40a03ac1d318443670
> change-id: 20250702-nova-docs-b9900d0505b5
> 
> Best regards,

