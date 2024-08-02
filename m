Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05D9455E4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 03:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74EE10E074;
	Fri,  2 Aug 2024 01:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="FF+1MZhW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2046.outbound.protection.outlook.com [40.107.255.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332DB10E074
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 01:16:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LncoHQFB0rnDFlWjxdfVnQXlrTToACuo0fK1kYAXyqnE3Ez1hxdwdyM90wE7EV8R6RSRcjtfmrVLsOw65fE5Q4GDoctnpI73/1RxfWUfUEDg/ZkOcpGG2Q5Gk01H+vzkNeqbaHZGoEODPtwtTK/vD9Iopb8SSQAViZTOKi4SGmPg5ccuv4anVwoSh0gIoE5OtqnmPFv/o3jqNnqv1N7FDa/b1kQHf7VF5inoOAZkb29FMgRkLBlpq7nf3w1nfXBbR1lI3x9CK/q+27Km6CrKXSnSiefK9v2PaVr6fyJLaaBVxAHyTXH8xH5S2NF2EehtDRGTap8sVwyaXS8/caJMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tHPysq8litAGVkepNacHzoMhqIpXrcVUF0F1k3h/qY=;
 b=eia/NHHaMbfwghwZ7JYWS//qxIq9+lLrKpWRM9W+aCPUXx7q2/yb1Ja7ZB9DW0QnkG5BTLTJ5sI6xK4cQHNhmDp76nZiKWl1Uz+sQQ5ZnvPs3FcHG310v56hFt1wGEtqsiNtoYvmC9V+by+dOZOuMePdh7Q8L/IXDMopBBgaSO+w01ta+Dlr+17ct1Eea6HvSDeYGxOOOh439Tgt4A1zCv6MKNZyelUaejGFjJ8NsPPvJEW6AHVBGNmqmOaqfrk6L00yTdermfXAPLfx5jyl++YiArEjateFF+1GSfzgh55cplb87mZHGGx7V1g+Ww/fWKP7ehk6V46zryO3BgKzOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tHPysq8litAGVkepNacHzoMhqIpXrcVUF0F1k3h/qY=;
 b=FF+1MZhWe88gOUR2PJuzAwQCoGJetkUDUuoCwi5YtBx+MNgltNuYYhI5B61+RjqG/kRzha+frogMwfTtwtFlGobRiodTtCDP3NdySdyEzZ7uY/6R4xo5ZghU8pm65bER5sbhCoURpBPmQKAW6LvQrJZiH7cbT0EpDfgO1I5+YnSEXRsX7scn3Xd8Wy3E4FcWlY7A72UvkpsUjg8BxJUanlOepog1/wuU6EAvmw8aOn+z80D60PeDKCPMr0Ji3cbDMUKVleNs/0nldKzdEuDfTB3Wl2Dj4TY80h2DRr6/Xqn0WAWLungeTVrsh41WFHtxgGmF81WH0V83j2zqGkhHFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEZPR06MB6287.apcprd06.prod.outlook.com (2603:1096:101:126::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Fri, 2 Aug
 2024 01:16:45 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 01:16:45 +0000
Message-ID: <154e015d-f8d7-4452-bb9b-018fa04bb6d1@vivo.com>
Date: Fri, 2 Aug 2024 09:16:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] udmbuf bug fix and some improvements
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240801104512.4056860-1-link@vivo.com>
 <IA0PR11MB7185EDB259502BC6937CE566F8B22@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB7185EDB259502BC6937CE566F8B22@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEZPR06MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 6592e319-4061-4dad-9618-08dcb290c621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkZWL01IRmplZldNQUE3WWVxeHVVZHNqY2liQi9YbFEwaGJuRVowc0pCYUZH?=
 =?utf-8?B?eGVCdkFocEZ5NHhpNHBiWGZOVlprdWV4M3l1eUFML1FnYlhrbFJlbTA0TU1p?=
 =?utf-8?B?Q2NaSzN6eE9hZXpLUjJraVUyaGdqTS9BNFBZTE43ZTVheHFRQUN3Z3NRYmRy?=
 =?utf-8?B?SC9DZDdHblFHSkoraDBjRlkvQ1B1R2dwdi9kaGtWeXpmOGNHK21mU3I2Uzc4?=
 =?utf-8?B?YjhFTG1BRXNVNlBTSndTZlJWOHJoMlJqSldXSXNpbGE0cXd3QWppdjc2cnI1?=
 =?utf-8?B?NzRsYkV6c2RZdTJBbmJ4SDJpU05UOUo1VWc5eTdrc1NXV1RPMCtHWWZTcG9T?=
 =?utf-8?B?cTY0bXZkTHN5S3dDY1oyQW5la3FEc1FEYkVrOTZKV0t5TzFKU1lDOEV1VHp6?=
 =?utf-8?B?bDNjbk9lSmluVDRJSEhJRVkvdW10d2t6aGQ3djFFbFdIc3dMQ1pROEl4elJJ?=
 =?utf-8?B?dXZhVlE4MjZ0Y21nb1VRYVpDbnZwK1EzdGhRUnViRFdHVnpmOXF3T0hNeW10?=
 =?utf-8?B?cnNuV2xibGFoa0FnQXlMb045UlQ2cGtrdWVIejRiL2NHUDRBSUhmUi95TUVy?=
 =?utf-8?B?a05venR5MWZsWlZjR1VIRnJ0MGJRUmtzRlFZS0tZU2c3d21aZjdzNENnamla?=
 =?utf-8?B?eVB1Z1JUeGQwUlBmaHpGUXNKQm9DVWVmbkpUN25Uc2lLQ1YxdFo3TlBhL2V5?=
 =?utf-8?B?VlRrNmRobzU3Y1Q2Zmdxd0s5TkMxNEF2cmx0Tk92dk9CZkxZdXkyUkVrSCtT?=
 =?utf-8?B?aU1GNWxPZ0JZZW1BYnFjVWJMeDIwOEtLRWVqeEYwV09LdW9VSGUvQVI0VEZO?=
 =?utf-8?B?TTQ3eHRGZVZBZi8vRWd5MzZ4UURKTHpRYlBaZXdVS3hKT3o1VnRnYVhWN0Fy?=
 =?utf-8?B?d3UrcHVhR0RsYTVCUzVKT3FwcTVHM0ZCNUMvVWdIU1l1UDhWTzNNaEtoRm40?=
 =?utf-8?B?MmcydTQwL0dqa0o1VkVuYUQ2QjdobnhVeDVlaFZtdVFwenR1OHFIRTZMU2dm?=
 =?utf-8?B?bWNNQllIbzhwbENvL1E3c0Y0TmY3VXl6R0lOekUyRytweVJXVTBJWDZjMEtJ?=
 =?utf-8?B?Q1pQakZCVld6WEw2Q24wVWgzTEYyZWlKc1YzUUVLZWN6MXZTaWZOSjEwc2xq?=
 =?utf-8?B?MjRqcklNVGMzM1BRWkdyUmRQWndWUGczNG95UEVjSkRwQkhUMExYTlJGY3hW?=
 =?utf-8?B?amFSQ3BmbkptZWw1RmdUM2prZkZVK0FZRFRyc2tqcUF4RlNzYjdIL3ZVbmg5?=
 =?utf-8?B?clJXdElmcURndUxST3dNRWdlc1hkUFpSYmh2VmRRZUJsbm13RlE1UmVlK1U2?=
 =?utf-8?B?T2tTM0ZLUUNHNkMxcVdRNGNoUnV0ZTkrcEIyVEpSWVlKYmQ4Z0VrVG1lTExy?=
 =?utf-8?B?MDhSTnJWWWR3Ty9ydFhGUzBUMlNjSG9Ya2Jia05hOHZWSnpmdEFZR0dkMjBo?=
 =?utf-8?B?NndCMzNzbTFRb3ZSNTZGU0dabXM5eFZtQmtyRmQzbXBSR2tTMHQxc0svZEdD?=
 =?utf-8?B?S1E5Q1BBd1EwaXBXNkdYTDlzNE1xcEthVVFFTGozZHlCL013dnF0cnY5cjlG?=
 =?utf-8?B?bXh6VDYxSEF3SXhaUGluVzJsdzZrdkhRN0xyaGprcFZEa3FkVDB3aE5mQkoy?=
 =?utf-8?B?WEQrbUpoRVNZUHF2VHF3eGVvcnphUXdUVTBFcENzeU0yRUFPTENXekJHRjA5?=
 =?utf-8?B?UFJqREdmcmpCanFYZ3l6amFFQjNrVDhBYkgwQ1VRbmlIUGpZWHc3dThZVkpz?=
 =?utf-8?B?RmdkcDVnNjBjYURGck14SkdDZkFqMS9JdFI5NEtobGJiUHBrQ2ZVUDZMOTRP?=
 =?utf-8?Q?dkuq2RVLJeCq9oaueAZZClR3WWrzipfat6avs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlBLZHp4WnR2SEVkU1A1eW5iU0xDay9OSjNjYmVlQjl2Q0wvWlU1b3hyUW4w?=
 =?utf-8?B?S2lBNDJKdnk3ZXRtdXdZOHExRU1MTmlkMTdLcGg3cWttTHkrSjlITzRqSDdq?=
 =?utf-8?B?M0JsTmVpK0k3aEp4Mmx0MTJPTW1QWW9vOWVENFVuWkplVzVlQWc5MWk1ZDBQ?=
 =?utf-8?B?K0JTQzB5ZjJ1TWhzZEJHSENid2N0dW5rRjdoU2VuemxkWHN2SnJjdjI1cDdS?=
 =?utf-8?B?UnJJK3pmdDZ0Y1pnNDJoZC9BcE9ORWg4RkF4NEppcnpkM2hBamZHdlJWQTlB?=
 =?utf-8?B?VE12dGI4K3ZxcW04azZGZU1INDF3Nk9LeVhGbXd2eEs2R1FqRVlqYUFPL3lo?=
 =?utf-8?B?eUdWbVIrcVYwOFd3WFJ5QVBvZFdnNlZXdXkzU0wxa2JtNWxCOHlqWWtqUkQ2?=
 =?utf-8?B?MUVlQUplbHF5ZHVvNlFkU0x6WC84Q2RxZXR2UDVyc2NLTnhNUDltSnA0YkUx?=
 =?utf-8?B?UzZSMS9uK090NWxxQWNNM0JNRjJLdzJMejc2T0RvUFhLV2FpeVZpbjFiZUFU?=
 =?utf-8?B?a1JLSkVhTVBWMzh0KzIwTkkwbFpJRTR5WHdVaHhpRWVoRSt5c2dhSXBKSU5N?=
 =?utf-8?B?MDd6dHRhazFMQUVNQm93eHFjQmtnb3NrWFQ4WUN1ZENYK0prN01KN3RMWWpl?=
 =?utf-8?B?TDhkM1Naay80SVo1MTYrK21KNWVKR05OcDNOeDNMQ3NwTjNUT1luVEY2cFJw?=
 =?utf-8?B?YTkzOXdBWG8wMVpGUEtNQlJNNmxocWI4NW1GRHlDMWxpbEdOMVlvQTYyVVJv?=
 =?utf-8?B?bCtZTjhoclFTMjYvSTU5SHhsZ1N0a3pIVUNlNzVtb3RCTnNtbEszWlZrZkJk?=
 =?utf-8?B?Y0FSS3JWSG1DbW1SZFNFaGdRUkR1WmlIMC92bkhhZHlaY0dxQ2Q5UVZyYU0r?=
 =?utf-8?B?SkxJVzlaVzI5ZTJEcDlFQ1VjaEV4UFBOVzZhOVptTklXS0RKZVNhMmJoNGxW?=
 =?utf-8?B?c1I0Q0NSaGhaMkk1SFF2eXpyZFZaRmZuUEgzcUw5bnB4S0NNb2dydndNdjJa?=
 =?utf-8?B?a1J5eWpFMmY5TXZZMDFWY3dxOXlFeFV0S2NPT3p0UW15TVhITTBjT3g0djE0?=
 =?utf-8?B?SHJMM2dyWStpUFNzREtLNXJWby9mQXM2SVoyME5OTjhkcjkrTFVlSy92VXAw?=
 =?utf-8?B?OHJGbEpXTUdYTlFLYVIxRWQvQ1lHZGtsVXVZMmJ3NDhjSWxlbE9uNEVUbDJT?=
 =?utf-8?B?VkttN0RERXpKK3pBWjdLVlRjdnFiTU1pK3hEbTYxdHNsT3NwYUIzand1bHlG?=
 =?utf-8?B?dUJsNG1uK0NlaXhuK0QwbGdOL0NZMG01d2NIWVBUb1VNa0xuQVlLWlM2bnVU?=
 =?utf-8?B?YjB2UzBSOENlY0NURXZIenFuaDhLQ2VoVXFRcDFiTHhFZTZxYXpyTndBNlhm?=
 =?utf-8?B?MmFpdlRxaEdMRFJ4cFBZQThEekRTS1lNTlRkZWhPQitaODJLVHZRZ0RZQ0Uz?=
 =?utf-8?B?NUdSYURFWkEyK2ZwMFZuSStqWHczVkwyMG1PYmRKdWpycnVhaTVQZG5NRnU2?=
 =?utf-8?B?UENVMDA0bDY0ZGJqUWpSZzEwM3hHY3JONTJHcnpTT3ZZa3psVG1RRmNSc1pr?=
 =?utf-8?B?bGpjRjdjK21BL0NtNmE0YWRDRlhNZy9tczc2REcvRWVuelFYNEF3U2VFZmVM?=
 =?utf-8?B?algrdlJnNEJ4cmg1MUZFZnhmUkF2MHRqSUVWNUlKNGFWa2FXbkRLR3pSQ0pU?=
 =?utf-8?B?bFFnVVZ0Skp5UTE4Q0RDSldWWmVEQndXZXV6YVc5VTlYY05hbmN3amd5VjV3?=
 =?utf-8?B?S09iOUtybmwzaExadkdsdFVTZ1dlMUxKeUlhMldicUZUSW5RU0Z5SkpsYUlj?=
 =?utf-8?B?UkVqajU0VXRxSk1BZnlJWlkrRitCeFcwUm1HeVRoMGdDdzMyaUs5TTI4OVpO?=
 =?utf-8?B?NUFsT1RXSnV6T3NFcG9wZTF2UHFiTi82bjRxanhURmFmWG1SZ0FXb1dUREtz?=
 =?utf-8?B?N0ZzeE5uQXE5alVzT0JLSUZOUUlIakVNclloY25oalZtOXlHeDdweGxsbXZG?=
 =?utf-8?B?TFE0Y0JuQWJqN0lmZ1d5WVJlVzVNQ29FYnllWFUwZGt3bEl5M3h0NlhqNU5w?=
 =?utf-8?B?anozcTlWSGJraFlwRjVHb1dWWDRza3ZkUzVUTE9nS2UxeXVvdUR0R1ZzN054?=
 =?utf-8?Q?fMfDiTTWGWYVgvEDtEtBwKIqr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6592e319-4061-4dad-9618-08dcb290c621
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 01:16:45.0524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZk/NzGzZIpdKUE2tfrcq7BYSiUt+eYqJ9ToiIc7YagJkz7lEP9o8gwy/rVsqtJjnoLOMNZR12SxF7XtXEjXrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6287
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


在 2024/8/2 2:32, Kasireddy, Vivek 写道:
> [Some people who received this message don't often get email from vivek.kasireddy@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Huan,
>
>> This patchset attempts to fix some errors in udmabuf and remove the
>> upin_list structure.
>>
>> Some of this fix just gather the patches which I upload before.
>>
>> Patch1
>> ===
>> Try to remove page fault mmap and direct map it.
>> Due to current udmabuf has already obtained and pinned the folio
>> upon completion of the creation.This means that the physical memory has
>> already been acquired, rather than being accessed dynamically. The
>> current page fault method only saves some page table memory.
>>
>> As a result, the page fault mechanism has lost its purpose as a demanding
>> page. Due to the fact that page fault requires trapping into kernel mode
>> and filling in when accessing the corresponding virtual address in mmap,
>> this means that user mode access to virtual addresses needs to trap into
>> kernel mode.
>>
>> Therefore, when creating a large size udmabuf, this represents a
>> considerable overhead.
> Just want to mention that for the main use-case the udmabuf driver is designed for,
> (sharing Qemu Guest FB with Host for GPU DMA), udmabufs are not created very
> frequently. And, I think providing CPU access via mmap is just a backup, mainly
> intended for debugging purposes.

I'm very glad to know this.

However, recently I have been researching on using asynchronous and 
direct I/O (DIO) when loading large model files with dma-buf,

which can improve performance and reduce power consumption. You can see 
the patchset:

https://lore.kernel.org/all/20240730075755.10941-1-link@vivo.com/

In the discussion, the maintainer suggested that we should base our work 
on udmabuf. I tested udmabuf and found that using asynchronous

and direct I/O (DIO) to read files performs similarly to my patchset.

So I turned to studying udmabuf, and once I become familiar with the 
system, I will be able to encourage our partners to adapt it.

>
>> Therefore, the current patch removes the page fault method of mmap and
>> instead fills it directly when mmap is triggered.
>>
>> This is achieved by using the scatter-gather table to establish a
>> linear relationship for the page. Calling remap_pfn_range does not cause
>> the previously set VMA flags to become invalid.
>>
>> Patch2
>> ===
>> This is the same to patch:
>> https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
>> I just gather it to this patchset.
>>
>> Patch3
>> ===
>> The current implementation of udmabuf's vmap has issues.
>>
>> It does not correctly set each page of the folio to the page structure,
>> so that when vmap is called, all pages are the head page of the folio.
>>
>> This implementation is not the same as this patch:
>> https://lore.kernel.org/all/20240731090233.1343559-1-link@vivo.com/
>>
>> This reuse sgt table to map all page into vmalloc area.
>>
>> Patch4
>> ===
>> Wrap the repeated calls to get_sg_table, add a helper function to do it.
>> Set to udmabuf->sg use cmpxchg, It should be able to prevent concurrent
>> access situations. (I see mmap do not use lock)
>>
>> Patch5
>> ===
>> Attempt to remove unpin_list and other related data structures.
>>
>> In order to adapt to Folio, we established the unpin_list data structure
>> to unpin all folios and maintain the page mapping relationship.
>>
>> However, this data structure requires 24 bytes for each page and has low
>> traversal performance for the list. And maintaining the offset structure
>> also consumes a portion of memory.
>>
>> This patch attempts to remove these data structures and modify the
>> semantics of some existing data structures.
>>
>> udmabuf:
>>    folios -> folios array, which only contain's the folio, org contains
>> duplicate.
>>    add item_offset -> base on create item count, record it's start offset
>> in every memfd.
>>    add item_size -> base on create item count, record it's size in every
>> memfd.
>>    add nr_folios -> folios array number
> I am not sure if these changes improve the readability. Instead, I think it makes
> sense to add comments to the existing code.

This is not aimed at improving readability, but rather at saving memory 
and performance,

as unpin_list is 24 bytes for each folio.

If each folio is 24 bytes, it would result in a lot of performance loss.

I previously provided a patch to establish a kmem_cache to reduce memory 
waste, but after recent study,

https://lore.kernel.org/all/20240731062642.1164140-1-link@vivo.com/(This 
patch forget to unregister when model exit)

I believe that the unpin_list may not need to be constructed, and 
instead, operations can be directly based on the folio array.


>
>> So, when building the sg table, it is necessary to iterate in this way:
>>    if size cross item->size, take care of it's start offset in folio.
>>    if got folio, set each page into sgl until reach into folio size.
>>
>> This patch also remove single folios' create on each create item, use it
>> be the ubuf->folios arrays' pointer, slide to fill the corresponding
>> folio under the item into the array.
>>
>> After the modification, the various data structures in udmabuf have the
>> following corresponding relationships:
>>    pagecount * PAGESIZE = sum(folios_size(folios[i])) i=0->nr_folios
>>    pagecount * PAGESIZE = sum(item_size[i]) i=0, item_count (do not
>> record)
>>    item_offset use to record each memfd offset if exist, else 0.
>>
>> Huan Yang (5):
>>    udmabuf: cancel mmap page fault, direct map it
>>    udmabuf: change folios array from kmalloc to kvmalloc
>>    udmabuf: fix vmap_udmabuf error page set
> Do you have a test-case to test this patch?
>
>>    udmabuf: add get_sg_table helper function
>>    udmabuf: remove folio pin list
> Please run the newly added udmabuf selftests to make sure that these

Yes, you're right, when I release the next patch, I will include it. 
Thank you for point this.

Christian König reminded me not to build page associations based on the 
sg table, which I had not considered.

Therefore, the overall logic of the patch needs to be revised.

> patches are not causing any regressions. And, we also need to make sure that
> the main use-cases (Qemu with memfd + shmem and Qemu with memfd + hugetlb)
> are working as expected given the invasive changes.
>
> I'll be able to test and provide more detailed feedback on all patches once I am back from
> vacation late next week.

Wish you a pleasant holiday.
Thank you.
>
> Thanks,
> Vivek
>
>>   drivers/dma-buf/udmabuf.c | 270 +++++++++++++++++++++-----------------
>>   1 file changed, 148 insertions(+), 122 deletions(-)
>>
>>
>> base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed
>> --
>> 2.45.2
