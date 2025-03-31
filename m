Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B347BA76C9D
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 19:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18F510E17C;
	Mon, 31 Mar 2025 17:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r9Svj+QY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EE810E17C;
 Mon, 31 Mar 2025 17:42:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqZ2IUiPFOXHn3bO0yyyuXOowHZF4rHFBjRNhTOQ+qsQ+KB15CKboPC9EOXtuJPwL377c8NOkqenpzvsgDs4Jz0cuivJBfEccjkA8Uy5SpYMcnZvUcTCvx1ZEm6FhgN+BHm46yM4jZOUB1DfE43e3M6nMS6t3FYYyve5FpkaohhyvYOgjaJ5+F3lzZl9eeXML4dqqBPyFRfSSOxmPAIn8hvwTzVZrmywkqaEzDwFGktSZs9xzXShJLyfrtyHz1bKWDEX7UiaXTEdrpJkiyBBzQZ5jnVuT8bsbt6AX8WdYJJt+xr3nZbMXn4S6HlY85VNPCpwGQ7cmukFz+b1/EchxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guFteVA3KW6muJdrqQhm7cjp349BxMd0DSAGHziAmKM=;
 b=QFFJnmSfwchlwKFo669pfmGH/cx6VG5qX5efRKai29nFn8LiTgqglOBk6s1+2h3qWhFbC3jLg1CtIHjJxUZyrSVACRKlVcLh/sRQJtfLgqeAppdYiVLaNoJUdswlMqLwUcGrW+o91KYYqDgvmBakKvs8vyNvO1V7cZ8Ic8NLpYSPENAgb1hZrIwkWP8zMLTSXUdGuuOcbEfBTWoG/r9CeTuURn3mMgekRX2ZJXBCxy3kGT8OieCy4lCr/gVGR/SqehWNC8RrRwUjbQDMU75zH2zS5VL5J0soWn4uZuoDCn8SWwg2DGZQeaA+ZfkFWg7jSrVresyXdsq9SJ1j5IkZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guFteVA3KW6muJdrqQhm7cjp349BxMd0DSAGHziAmKM=;
 b=r9Svj+QYvKGlKeSKuOm2XfgCZqb93i9qveja/1QVuf+7Py+IHxo9qTZr38C5MxpBJNBm5qs6woM+Cmi3JKjGJUpzWvBZS8ZboyCrDB59erL3DwiVFpBYIG8uRWy1nuQJ9xUBw5W6qfyGOx7jWjRyPfWFlWMeS8g6VfRNFGnThFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS4PR12MB9636.namprd12.prod.outlook.com (2603:10b6:8:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 17:42:20 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 17:42:20 +0000
Message-ID: <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
Date: Mon, 31 Mar 2025 11:42:14 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Shengyu Qu <wiagn233@outlook.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::11) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS4PR12MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: 238ba43e-c25b-4149-0d30-08dd707b62df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEd3Uk9TQmNhamdUTmdFM2h2OFNGYkt3OEFSM1p1b2JBWXZyeHFJaXRGcGdD?=
 =?utf-8?B?NkR1bWYra1IxVldqQTZVQit5YTU0NVVzM1JXOERKYWpBRXE4dklySFN3VTBJ?=
 =?utf-8?B?VTVTOHJHOHBMVlRWSG1ZNGNsL1NtU2puVUQxWVBRM3kvQWRnZUxpTmg3SlVi?=
 =?utf-8?B?WmxvV0t0SmY3WXFlSTBQaXAxSkpDK1NxbCtnbVROa3ZnaXFYNFFMeU05ZzBx?=
 =?utf-8?B?a2xYUWJxanYrTzJDck1haWFIVzVtNnBuZFhVYkVmdXppZ3hxSlVtREhldDdD?=
 =?utf-8?B?bmRaL2RGMHJicDJYRnRJSUxYb3VwRGM2UG9jWlErd1A4bWVKQlp4MDJSUWNy?=
 =?utf-8?B?aVo0Z01uWG9lUWZOZFhDdmZ6SUVkdFBRSit6MkE2MjZiSE8vWmVsM1c2Z1Y4?=
 =?utf-8?B?bTVkVjg1NXAyMUNxUjJKSmRzemxMbHNGaFg2am1LV2pJSmdEK3VMOTMxb0xB?=
 =?utf-8?B?NEJYcXczMGt1LzFmbW5rVG1VbGxkdDdmZjl1WFZ4TnVMb3FxbjdkcE9ZWWNC?=
 =?utf-8?B?NnpIRTE2M09ZUEhFd1JnNW5lcUgxUUNsMXkrbis3SDllS1RHMXlFcHkrc1Jw?=
 =?utf-8?B?ckZqcUhSbVVhaCtZWlBuMUIrNlJzeGhhdFUxS2ljRDFDK0dqSzhIRWJ4VE9C?=
 =?utf-8?B?NVcxN3ZoM2FaVFZpZ1g2dWhqdjBWSFF6UWhIR0tIbHBLM0lOZUNuMjNjSjdr?=
 =?utf-8?B?cDF1eCtXTVRkRUtxNjZDWGwrWW44YkEyRlA5dXhKTXpST01LQVJWQXJPSWNM?=
 =?utf-8?B?YVM5VDdWdFhzcjRMTUNGd1VTYXAzY1dqclBQSnJpQmlLR0VEaVVrVzV6ZFJn?=
 =?utf-8?B?dENVOGFmcnRIZStORDIrL2RCMHJMcCtJYkRqVThUeGRYTitWY0hFQk92QWJK?=
 =?utf-8?B?dE81UHNXckdRaTJQbndXR3FzcENVNXg0WmdNcHZRYzdudFBPN0lRMkZSUGJx?=
 =?utf-8?B?dTRnb1dablBUVjh6d1pMUC83VFV0ejF0TDRLZ1ZRdElZSXVLSEZXQjFWSWtC?=
 =?utf-8?B?Mm4wMkRiTzRXdk1TUFMyMmgxZ2I4d2tzSzErQ1FGbCt0SWNNaTM5aDlDUzNq?=
 =?utf-8?B?bnVrY0VOaUt4bllTdW9wMk9oSmkwdFU2enZHSHFvV2JjYVVvSzFVYnhTVm9n?=
 =?utf-8?B?RGdZS3lEWERiNHFUdjErR01MSWgxNWxsVFRnWkRYUkVJMlcwSVZqbEI3NDd3?=
 =?utf-8?B?Smpaakdkcm9CMDd2ZUI4cXovQkNMa1l5eWZic3V6Z3pSWWZkbTB2N1RsaTNK?=
 =?utf-8?B?RkJEczBtaE01ZWRBYk9CUFVLNHdiQTdyMUJXTXJaODNOMGZucW02ZEdvOGRO?=
 =?utf-8?B?TzZrbi90V245M05QUWNkZjZYd0wwMDBZTGt6b0hzTVFCRXdJWE1UUmhBKzdu?=
 =?utf-8?B?NHdDbktramUrT3FtYnFYTzljalJQcW9GTks3Nyt4SzBJTnNiQWZ1VVJTRHQ5?=
 =?utf-8?B?a0tmdDR6Vmd6WlZMaW04a2FiWVhCNlo5cFhvcnRsYmxzRDd5NW5HdFhpd2ZF?=
 =?utf-8?B?WFRsUmUwTmRXUlYrUDZvVVdGUFloTlZkVzkxNHR2eEhDTStvWlhzM2IvSlBs?=
 =?utf-8?B?RmNPcG80MUdQSHBPbWZSemlaOXNFQXp2dEFqNUozaFVKdEVXb3lSK1F4Zmtt?=
 =?utf-8?B?TC9RSGFCNTFON0ZqdCtaOWxrbVI3N1E1ZGs3VS9UZzBpQ2tzU29Rdy9vd2l6?=
 =?utf-8?B?LzAzc2R1Q2J1MzFLRGJ5ZE8wU0kyU3lXbGJFb3lWSTFyRmlnMEg5VWhLRG5K?=
 =?utf-8?B?NndadzhPQnBLSjVydFNnR0kyYlJEV0czYklnOE9Eei9lU09uNGJ6cVVDTmI4?=
 =?utf-8?B?TmVWSC9vNWhaK2xUUUh1SDJzazR2dURXWEFXd0E1Tys1MDhRUmkrU1I1VGNx?=
 =?utf-8?Q?y1f1PrM782v14?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDFzMHYzb1JpR1BmUjNHQjlYUHNSYmZOWGp6R1pnc3FMVENtNWdqOHVtU2dD?=
 =?utf-8?B?M2dGR2k1YXpkbEZpZjRsUzFNMlc1bit0QXBZY2lpK1VocjJCcCtoU21EM0l4?=
 =?utf-8?B?bUVDRzFwaEZVdXRna3RSR0M1QnlEdlpwMnU1aEwrd2Z3QUNaT25oNEdQTlJE?=
 =?utf-8?B?ZFFJYk1FcDc2aFdVbXpaOUc4WlREZjFiRXpaeWg5Q0Q1NzV4aWVkT3ovU2sw?=
 =?utf-8?B?OEpBQUFFQlFlUmVmamVkUVNza1dNaGJvY0xnWVkxVjRRYUFvV0g3UkdlWGFS?=
 =?utf-8?B?aG9kWVhST3B6WTRPUUQzR1JqZXNvWkMzS2RVbWpuQzh6K0ZhVTY2SkxjaWpj?=
 =?utf-8?B?Qm8wY015UlNqRWp0QUhPSHVMbzNCOW9oT2szV29tTmlQU2c2VnRTd0U2QlNM?=
 =?utf-8?B?dzRCN1hZeFJXWnhEY1FpbVI2VDg4RmxRM2FzS1QveUxrT2haUURpbXA0YnBw?=
 =?utf-8?B?OVNnNDcybCszQVBVN0IvNUtRakxweUxGclluaDRNRk9sZGx6RWN0NDZqc25l?=
 =?utf-8?B?TnVocmVrR2FNL2FzdWhhMktWRFcvRHJnR1RuaXNIbm5iWWJLcHpDWFFMWlVJ?=
 =?utf-8?B?RDJrQUliZHErbHJiWk9yblRJNlh6MzFZb0d5eFEzVlVMN05WQkJEbEpxTXZw?=
 =?utf-8?B?dm9wVnRJRFRYRS9DcnM4dkJYZlVwWitBNy9XekdkMUJCRkdUVEZFSlJaQ0lJ?=
 =?utf-8?B?Uys3dVpEN3c5UUpOSWhUend0aFN3cW5UOHFvdURCQzFYZlpPV0lQcGZpUko3?=
 =?utf-8?B?L3ZheTZhakNDVDlqRUx2NEtHYzE4NVF0ZlZSd3hOWFFrWU9GMDJrTGhtd2Rs?=
 =?utf-8?B?ZHFkRHJrVURaWHplejBxdEl6VWZkcXVaaHFVMFFWSlVIdHVkZzV0YTh3bWI5?=
 =?utf-8?B?Vm1DNnVyOHV2ejJQZDR5ZE1oUnQ2RHplcVlUUUpyYmZpa2ppMlpQay81Zm0y?=
 =?utf-8?B?bzk0a1BvNHBqblE1eWdBMTJHUmFmVXFwRGZ0TFhoaHd6c3EwUmZ6SjVKZmZk?=
 =?utf-8?B?NTBneDhiZlBES3RJa2NkSHY5RytzNGVDUXNtWEpRNEZtSnhtVWJWWjdmNmtO?=
 =?utf-8?B?VHVSa3ZuZEFTMFBYRFkwdUhOZnhjSXhLaDN5bzZhbkhDcVIzbm8xL21lRDAx?=
 =?utf-8?B?UHN3cTgwNE83MVRPamVGcXRUWHhhekQ1MTY0OTBydE9oWC9XajJpWWM0bnNk?=
 =?utf-8?B?WFBPOFNoKzIzTjNEQTk2MHJNVlhSMDN4UU5EWUpLM3NId3RCZVpjSldpT2Jw?=
 =?utf-8?B?UFU0Q0JGd3A2alNDOWlQY3pqcU92MDRjUk9LSDNnK3ExbVJlRC9PM29rbjly?=
 =?utf-8?B?VnBqeDFDMXNoWExLeE82KzdUWWY0RHFnMGxFMWVEYzFNTCtCaThZZmRWOGtL?=
 =?utf-8?B?T2pqRjJOcTdWeENVbWJrZ2I5RDNFQlkrcVcybzl4YjZIOFIzcEdNMG1mNzRF?=
 =?utf-8?B?VW5GT3FmWXJtanNab0kxZnJBaHRET0N0SVZPTk1YTWUxZDBOVEIrUmk1VnVL?=
 =?utf-8?B?TWc4L0hLa0JvQmgxUmViVk5IRGwxeUZERnJKU255UlI5VWplRnhsRmFlc2la?=
 =?utf-8?B?VUJMVGVKNDBZUE90Q25FNjlKZmJqQjFWNml5WW4xVnRIY0t5MVhkbTRHdWMz?=
 =?utf-8?B?WTBtUUc0TENLZEszcFArTkFScGwyeVIwZ3ljcGlxRCs2MTNWQi9UQWZMc09P?=
 =?utf-8?B?bXVEUUdVUW5QbEFLaWloVDl5WmJJOTZ1c1ZUYzNNSHV1dEEzNHJTYjMwT0lk?=
 =?utf-8?B?UmpXQm0zTGxGYVBML05PcGY1VkNDZTVyOFVFZmc2aW9uNmVVanFwYUgzaE9i?=
 =?utf-8?B?VXo4NGthNTI5bDBRWlo4V2JTYXp6dG9kNVN0SHF2RWFXOXZDQ0s5LzR6RFR0?=
 =?utf-8?B?VzNLZ1k4dGVrZXVTZ0xtNkcrcUNtdStPV3NlVW1nUjBpdUFaOXc2SlZFM3NF?=
 =?utf-8?B?ZU9LVFFQWHBLTXk0bVM5RDlvL095Z3owQjdTNmhXTGs4d09XWkRwWnZmY1dq?=
 =?utf-8?B?VUw4alJqb2ROeDR3eDhoWEZTTVBTeWFveER2TlJkeWEwMjNWRnFQQm1NcFRu?=
 =?utf-8?B?dHpFZ1Bsd0tPR2t0YnNRMWZuZmlWdFV1UU9BQkE5M3FXNHNNV3NWb0ZnemRU?=
 =?utf-8?Q?M2f+0qGCSzLmGeTcpxZ8eiiUE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 238ba43e-c25b-4149-0d30-08dd707b62df
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 17:42:20.3596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYoiovGUYea0NXVfObc43Kr2mc55ZJcHJiZ3bKX2g9s1QeUyNyb1pod1HkB9ifyapHzlck2IT1alTgJO/GVT1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9636
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



On 3/31/25 11:04, Shengyu Qu wrote:
> Or we can add some kind of "linked with" info to plane's COLOR_PIPELINE 
> property, to let userspace know that cursor plane and background plane 
> share the same colorop config. So that userspace could do extra 
> conversion on cursor image data to avoid display wrong cursor color.

That's over-complicate and makes little sense for both device drivers 
and userspace applications.

If any planes share same colorop config, a device driver exposes the 
same color pipeline with the same colorops.

If a plane does not support color pipeline or a driver doesn't want to 
support it, there is no color pipeline and no color objects.

Again it is up to compositors or apps to determine how color pipeline 
and colorops are used (or not). For example, both primary plane and 
overlay plane have the same color pipeline, HDR can be enabled only on 
overlay but not on primary.

> 
> 在 2025/4/1 0:50, Shengyu Qu 写道:
>> Thanks, I mistook about the MPO document. Maybe we should also disable 
>> colorop on the background plane of the cursor plane? So that 
>> compositors would do sw color convertion on both cursor plane and 
>> background plane, which should keep cursor display correctly.

Cursor plane has no color pipeline and thus it has no colorop either. It 
inherits color processing from its parent plane.

You can create a color pipeline for cursor plane for your hardware. If 
none of existing colorop matches your need, new colorop can be defined.


>>
>> 在 2025/4/1 0:34, Alex Hung 写道:
>>>
>>>
>>> On 3/31/25 10:31, Shengyu Qu wrote:
>>>> Sorry for vague expression. I mean that I think we shouldn't 
>>>> register DRM_PLANE_TYPE_CURSOR in the driver, as we don't have 
>>>> actual hardware support.
>>>
>>> This is not true. AMD has hardware cursor support.
>>>
>>>>
>>>> 在 2025/4/1 0:26, Alex Hung 写道:
>>>>>
>>>>>
>>>>> On 3/31/25 10:12, Shengyu Qu wrote:
>>>>>> So currently we have to hope the compositor won't use 
>>>>>> DRM_PLANE_TYPE_CURSOR planes at all.... Why do we still register 
>>>>>> DRM_PLANE_TYPE_CURSOR in the driver?
>>>>>
>>>>> I am not sure what your question is. A compositor can choose or 
>>>>> skip any hardware features, but this discussion is out of the scope.
>>>>>
>>>>>>
>>>>>> 在 2025/4/1 0:06, Alex Hung 写道:
>>>>>>>
>>>>>>>
>>>>>>> On 3/31/25 09:43, Shengyu Qu wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Thanks for reply. So currently we have to apply color conversion 
>>>>>>>> on the background plane of the cursor to do some color space 
>>>>>>>> conversion. What would happen if cursor and background plane 
>>>>>>>> needs different conversion config? Or we just give the cursor a 
>>>>>>>> dedicated plane?
>>>>>>>
>>>>>>> This scenario is not supported on AMD hardware, but software 
>>>>>>> cursors on other plane types won't be affected.
>>>>>>>
>>>>>>>>
>>>>>>>> Best regards,
>>>>>>>> Shengyu
>>>>>>>>
>>>>>>>> 在 2025/3/31 22:28, Alex Hung 写道:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 3/30/25 06:59, Shengyu Qu wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> Do we really need to disable cursor plane color pipeline 
>>>>>>>>>> support? I don't think we need to disable that if it is 
>>>>>>>>>> supported, since there might be some user-defined colored 
>>>>>>>>>> cursor icon.
>>>>>>>>>
>>>>>>>>> This patch applies to AMD hardware only: https:// 
>>>>>>>>> elixir.bootlin.com/ linux/v6.13/source/Documentation/gpu/ 
>>>>>>>>> amdgpu/ display/mpo- overview.rst#L101
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Best regards,
>>>>>>>>>> Shengyu
>>>>>>>>>>
>>>>>>>>>> For some unknown reason, seems my mail is not shown in the 
>>>>>>>>>> mail list archive, so I resent it.
>>>>>>>>>>
>>>>>>>>>> 在 2025/3/27 7:47, Alex Hung 写道:
>>>>>>>>>>> cursor plane does not need to have color pipeline.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>>>>>>>>> ---
>>>>>>>>>>> v7:
>>>>>>>>>>>   - Add a commit messages
>>>>>>>>>>>
>>>>>>>>>>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 
>>>>>>>>>>> +++
>>>>>>>>>>>   1 file changed, 3 insertions(+)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/ 
>>>>>>>>>>> amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/ 
>>>>>>>>>>> amdgpu_dm_plane.c
>>>>>>>>>>> index 9632b8b73e7e..b5b9b0b5da63 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>>>>>>>>> @@ -1792,6 +1792,9 @@ dm_plane_init_colorops(struct drm_plane 
>>>>>>>>>>> *plane)
>>>>>>>>>>>       struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
>>>>>>>>>>>       int len = 0;
>>>>>>>>>>> +    if (plane->type == DRM_PLANE_TYPE_CURSOR)
>>>>>>>>>>> +        return 0;
>>>>>>>>>>> +
>>>>>>>>>>>       /* Create COLOR_PIPELINE property and attach */
>>>>>>>>>>>       drm_plane_create_color_pipeline_property(plane, 
>>>>>>>>>>> pipelines, len);
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

