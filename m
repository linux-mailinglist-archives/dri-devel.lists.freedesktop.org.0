Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3586E4E1F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 18:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B06710E32B;
	Mon, 17 Apr 2023 16:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC6910E316;
 Mon, 17 Apr 2023 16:20:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V08jW8LLUdFDZplDUA14K+0Z3pOLXSG+v2fwJ12keTGJUQqdAKhghn3WvCezpNeGTLhvmrA3KgTObth0E5gV5oy0GiSIB/U7dbaKVRZLrkzoQbU5NYttoavp5tdg5pLf4Cdcg7PxXntFGvjsEDL7alK7m6KMvUkDPBIqws/QChjTO7woGB5Avc+DkdBjmd7FmABtVZaa83AfshzAl/A+X3GKdWkVFs6lBRzTkUvrddUngpyI3V1CswEVCGmIUxQFmAnliOh1WaT5Ois8W4HMt6E5KnMrWmluSbRZfIxuieYwpAShUmOyKVf4vheqOFIHhP+3ICh4GJ2QVcnGa1X1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baLaEE5jBJEIpR72RXopifMCEPBRhYo+uJhTbV0yEyc=;
 b=bhqZPS/bGOqqzIRNza5P1AcWIsh6MnQHxqYGXT1VAOTorRGuUG8L8r7dsTSQdNqmHFxtaMamjeVBcKdr0rtzPnEK5QgfZZzxImqNApTO/k8b0dZwsYqKvPR53eRU3EHPa8dnecI6XiAcGrCp4TaGpjkBQg0mghxOgr+6yxV8qiAsiDn8Pn6nNuI5Nhg4G+dOjru44YvO1FSGJuCKh7VCdNARBMwallq07GubVhEVFLxKqiVhKC3O86SxEl1r5psNCh17mXHLuNP3j6PhEu16yucTlIwN+2MQfjeI3J39BcgBcGsKCIPng1T4NbPY/L5Omxn9PJFfd4cJCIhuk1vcZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baLaEE5jBJEIpR72RXopifMCEPBRhYo+uJhTbV0yEyc=;
 b=IYT23ryni9VkLbkSTO1OtzSyTQP+YQV0dZVi6RinMmRGPFUO2NQiC3692aTUpLSuS3vA4jyrXIRBXk5hJ+z5Yb/rYZ+eUCTi7uoSRvvwm0jCrh3I9U5Ea3moHmH8OhQlNVefAqJqfqs+lq3HSNMVN3oJncLedvMZpiMdLSxCyvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5264.namprd12.prod.outlook.com (2603:10b6:5:39c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 16:20:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 16:20:07 +0000
Message-ID: <f708dbc2-cf55-6cf6-eef0-b69d00c3eee9@amd.com>
Date: Mon, 17 Apr 2023 18:20:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC 3/6] drm: Add fdinfo memory stats
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-4-tvrtko.ursulin@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230417155613.4143258-4-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da48c64-1dd0-4e2c-15cc-08db3f5f9c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MOCmxO0zmV/2KObSVjT0AnVWFM1Mp3OzNvV6AojG5hfhYVgGusZuP086QQi9X2ea/bVRlHXv12jEfrtCVRfa3oVfzfeDYNLMUf290yk7i/Vj5DoLm7fGeQuoyx2uFNLyJSJ2l4izB2Q5Qi+IVEdoZBuclmz88hdH7pRSUbYBXRn1AsG2Pd1IoWuJ3GjI/Aorkq/wg4Sxy0RvvyQTt+GIIfi3RE+2Uzm1Tp/5QRoklbeSdhjY+IbvL1YLi8ThyQis0rmVk+K3tUhokOB4AnYE7KXIWayJnUg4JuMDkhYTRk73eAOo473dWcgJYSKdz3Rg6qaFUddXkmV0TxIN3VNxFUOT5MDLhq1OjjMYvhm97XGlOgplNnuU9T/gVyGOvMiIDUNA6JLywj8w+d+cToCccWNu822iAYSM+p79Va2Xqk+bSga9x8hkRSwVUdpFrxIz03ZOYqColOoMmjnaft0FS7+yqIU7hXyROK85o+CpJ+WqUx3kpcQ587LpDPO/gjyPicU7YGAvpWKrIqctIlq0Yhz2osw7E91tiNGqLYeGQKZdONveGQOJArKXzIZw3UesHUV5Qe4FpBYzeNN6WfERLCR5xbxzMFuItHDydFGWltz9Gg1fAJLwlGgovOhIIRU3w2+XE4Fu1QaXingJ2SqgTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199021)(38100700002)(8676002)(8936002)(5660300002)(2906002)(36756003)(86362001)(31696002)(478600001)(6486002)(6666004)(54906003)(31686004)(186003)(2616005)(6506007)(6512007)(66946007)(66476007)(83380400001)(316002)(41300700001)(4326008)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K05qWkU2YzFkNkV0NUdhZmtBdnVPRkJoY0tUakplK0NTaUcxdUlxUjUyTUlw?=
 =?utf-8?B?Z0lQZG1GQ0NzSkFoWEJKWUY5VEw2aUc1UlMxN1YzQSsxSDhrdmpyMENsMzBU?=
 =?utf-8?B?NUpXZjhiZDB2c2ZUTG50eG1WbElsYW1vQnZsTkZLcUNWVmhMOFcxbHZqQWxn?=
 =?utf-8?B?cUJoYld3Q2VOQmZtQjRQeTZmMVFOZ2lqZ3FaMVVjd2xKcEhNOSt5ckhJMEV2?=
 =?utf-8?B?aFJSMmtQSHBqQkF4SmlUMkFFZWZLVXAvdDZNMEIvby9Ub2kwOE1BeXRJS2F3?=
 =?utf-8?B?Z0c3YS9KYll0T2ErWDlVY2xvL3ZnYzJtSW9vcFN4R21YVzNkNFlLUzF3cW1O?=
 =?utf-8?B?bDNiNWQ2RFU0UWx5eGtQK3Bjc1RXVWQva29uWnI4ekw5SnFPakdTSWZkWVhp?=
 =?utf-8?B?ZzBsWDVLNXk2Uk1zU0ZMc3NtY0hNL0UwWVBnQ0dCOVpJazlFVUQwRkVKOTVJ?=
 =?utf-8?B?eml5THI0VDVsRTVxWDJOblplL2F6bFhDZW9YSVQxRWpZZ1d6ME5VMWJ6KzYv?=
 =?utf-8?B?STJVd3ZxejM5RmpxQk0yTWpUNnE2L1J1b2hTTEVFNWZUbmF2K29YMmVzbEFV?=
 =?utf-8?B?MDBScklEcmJONU1heFl2VkRSK1RuRWQrbEpPbnV6TmhIZnZpTGZEZ2M3aktO?=
 =?utf-8?B?V01DcEtrNm4rSlgyc1ZLU3I1YXp0aDNKQi9lUTZ3ZFEwdVF2cWJTSjRNTERl?=
 =?utf-8?B?QnBNZzFOaGpINVdjMnEySEVrOXowZGNQQVJtWk9TVU5UNUtORitoeklNNVpV?=
 =?utf-8?B?QVZzeUlzc1dZaXVDZHBTQ0RPV1ZyNkFPcDZ3b0crVFRRSDJJaXZQT0phQlJa?=
 =?utf-8?B?NEczTDVsMjFBYUdJUUExSHZ6MGxrd0RmM2dRSlNOQmlHZFBTdnhZc1FZZFc4?=
 =?utf-8?B?R0JrekVNc0hFb0JDOFlCd29rVWk0ZWlnN2wwN05FUGJQR2tSazFGT0pNZ3Ny?=
 =?utf-8?B?cnFtQjNlMDNOZHo1SzlkV2xlZGtCK3ZoUlE0NWI4UGhzRFh5empwTWhOODZ5?=
 =?utf-8?B?T25JK1h5OEV2bGlzMHZaN2dETzI2WENVY0JWNjkwL3BrZHpmM0EvQVRHZU03?=
 =?utf-8?B?QU1RcUV1NnBqcUNHUkxFY01OanlSTVN0VmovczVYMFRlR2d0L2tDQS95a1lp?=
 =?utf-8?B?VFYyekxUTHNBVDJxVUkxcTkzY3ZheUVqK0xvcC9vZ3FSNzExUnhaZm10U1F5?=
 =?utf-8?B?RjRmZnRUblRpYzQyZy92bkQ1UlRNbjFwYTI1TVhuTm9xYlVGdmRCcFFQaDJh?=
 =?utf-8?B?UEJxMFhsUjQ4b1pBVXVZaStSTE9BMnFpN2hNbDZNT1pMRnJTMmo4R1RNNXVm?=
 =?utf-8?B?bTlGYUFPRE5pVVhoWlVxMkRsTVhwNUxHNVJjalR0Zm13cWg3Qm0vY2k3Umw1?=
 =?utf-8?B?cFNOMmdTMWlrdjlzdXN3R1orbEFVYmRCc21DVHE5WkVqekR5MUhGRXF5SWUw?=
 =?utf-8?B?TDFFa0JHNEdvUUFIU0g2ZlVhajBqRmw5V3pOTEpIbVNqQ1UrTDE0K3dQL1ln?=
 =?utf-8?B?czd6ZHVSeHlaS05HWkNDbUtQODJCeWdpcXFPaDFwTmVMM1ZML3MzdFRhaWxO?=
 =?utf-8?B?Tm4zUCt1VXh3R1RxWlpQTklUSlhQTUtYRkJJem5aR1hGNVRpckp6cUY3MVIy?=
 =?utf-8?B?YTdPSHpvU0ttcVdtSDlPckVjR3hNcnNMcHBtVXZlY1hTUTJOMVJsV0xXL0VY?=
 =?utf-8?B?Mk0xZ1o0eVNQeFpTM2dlTllVY1pDUkFJKzB3ZDZUOWVuRU43T3A0bVdyNTNi?=
 =?utf-8?B?bisydE0zbm9wQldEa3dmWXhSK2RVWW5xaDhUWmRHcmd3SXMweWZuYVh3L2pi?=
 =?utf-8?B?cUtuYXlBUmRjeDQrTzJ1R0ZnOUU0TTl3WExsYkFCNmRKUnFYR3YwUzQ5TVV2?=
 =?utf-8?B?T210c3NQTFhyQkVXOVFkdkJlTDAwVDJTcy9HbmdDM3k4SzVmVmd5SGpEK3B4?=
 =?utf-8?B?V2pSbkZ2TXlML3dQVGZUallCOGFhSTlqdXpGRDB4Tm5xaDNVZ0Z6T3pTdHpX?=
 =?utf-8?B?K1R0R0pZeWNJVTNlZFJtL2h2RTNGcEtVeVpKRFpMWXFIZGZ3TDI0ajhSdU5O?=
 =?utf-8?B?RndsbnJFckRnVU9rYzRLbnlUakhGakYyakNBQmhuQnpKa3FQT1Y3ZTZwS3Jy?=
 =?utf-8?B?c0FjdjBKOWZzUDhwYW5zbnhMbmRLZjltMW5rZG9ESjVTaXBSbnNzQk1WSnQ2?=
 =?utf-8?Q?V08ahe5QiOYiK2blnWISQqU+/60kXMZX3HorTTJxJiZ0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da48c64-1dd0-4e2c-15cc-08db3f5f9c1d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 16:20:07.7973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiOmV7JosXRfrQYRYZbaPh34EWbUBP3GMy9+IltFJxnAQcSf7lwWkt3/McZl8T/i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5264
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 17.04.23 um 17:56 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Add support to dump GEM stats to fdinfo.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 12 +++++++
>   drivers/gpu/drm/drm_file.c            | 52 +++++++++++++++++++++++++++
>   include/drm/drm_drv.h                 |  7 ++++
>   include/drm/drm_file.h                |  8 +++++
>   4 files changed, 79 insertions(+)
>
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 2ab32c40e93c..8273a41b2fb0 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -21,6 +21,7 @@ File format specification
>   
>   - File shall contain one key value pair per one line of text.
>   - Colon character (`:`) must be used to delimit keys and values.
> +- Caret (`^`) is also a reserved character.
>   - All keys shall be prefixed with `drm-`.
>   - Whitespace between the delimiter and first non-whitespace character shall be
>     ignored when parsing.
> @@ -105,6 +106,17 @@ object belong to this client, in the respective memory region.
>   Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>   indicating kibi- or mebi-bytes.
>   
> +- drm-memory-<str>^size:      <uint> [KiB|MiB]
> +- drm-memory-<str>^shared:    <uint> [KiB|MiB]
> +- drm-memory-<str>^resident:  <uint> [KiB|MiB]
> +- drm-memory-<str>^purgeable: <uint> [KiB|MiB]
> +- drm-memory-<str>^active:    <uint> [KiB|MiB]

What exactly does size/shared/active mean here?

If it means what I think it does I don't see how TTM based drivers 
should track that in the first place.

Christian.

> +
> +Resident category is identical to the drm-memory-<str> key and two should be
> +mutually exclusive.
> +
> +TODO more description text...
> +
>   - drm-cycles-<str> <uint>
>   
>   Engine identifier string must be the same as the one specified in the
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 37b4f76a5191..e202f79e816d 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -42,6 +42,7 @@
>   #include <drm/drm_client.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
>   #include <drm/drm_print.h>
>   
>   #include "drm_crtc_internal.h"
> @@ -871,6 +872,54 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>   }
>   EXPORT_SYMBOL(drm_send_event);
>   
> +static void
> +print_stat(struct drm_printer *p, const char *stat, const char *region, u64 sz)
> +{
> +	const char *units[] = {"", " KiB", " MiB"};
> +	unsigned int u;
> +
> +	if (sz == ~0ull) /* Not supported by the driver. */
> +		return;
> +
> +	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
> +		if (sz < SZ_1K)
> +			break;
> +		sz = div_u64(sz, SZ_1K);
> +	}
> +
> +	drm_printf(p, "drm-memory-%s^%s:\t%llu%s\n",
> +		   region, stat, sz, units[u]);
> +}
> +
> +static void print_memory_stats(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct drm_device *dev = file->minor->dev;
> +	struct drm_fdinfo_memory_stat *stats;
> +	unsigned int num, i;
> +	char **regions;
> +
> +	regions = dev->driver->query_fdinfo_memory_regions(dev, &num);
> +
> +	stats = kcalloc(num, sizeof(*stats), GFP_KERNEL);
> +	if (!stats)
> +		return;
> +
> +	dev->driver->query_fdinfo_memory_stats(file, stats);
> +
> +	for (i = 0; i < num; i++) {
> +		if (!regions[i]) /* Allow sparse name arrays. */
> +			continue;
> +
> +		print_stat(p, "size", regions[i], stats[i].size);
> +		print_stat(p, "shared", regions[i], stats[i].shared);
> +		print_stat(p, "resident", regions[i], stats[i].resident);
> +		print_stat(p, "purgeable", regions[i], stats[i].purgeable);
> +		print_stat(p, "active", regions[i], stats[i].active);
> +	}
> +
> +	kfree(stats);
> +}
> +
>   /**
>    * drm_show_fdinfo - helper for drm file fops
>    * @seq_file: output stream
> @@ -900,6 +949,9 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>   
>   	if (dev->driver->show_fdinfo)
>   		dev->driver->show_fdinfo(&p, file);
> +
> +	if (dev->driver->query_fdinfo_memory_regions)
> +		print_memory_stats(&p, file);
>   }
>   EXPORT_SYMBOL(drm_show_fdinfo);
>   
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 89e2706cac56..ccc1cd98d2aa 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -35,6 +35,7 @@
>   #include <drm/drm_device.h>
>   
>   struct drm_file;
> +struct drm_fdinfo_memory_stat;
>   struct drm_gem_object;
>   struct drm_master;
>   struct drm_minor;
> @@ -408,6 +409,12 @@ struct drm_driver {
>   	 */
>   	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
>   
> +	char ** (*query_fdinfo_memory_regions)(struct drm_device *dev,
> +					       unsigned int *num);
> +
> +	void (*query_fdinfo_memory_stats)(struct drm_file *f,
> +					  struct drm_fdinfo_memory_stat *stat);
> +
>   	/** @major: driver major number */
>   	int major;
>   	/** @minor: driver minor number */
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 7d9b3c65cbc1..00d48beeac5c 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -375,6 +375,14 @@ struct drm_file {
>   #endif
>   };
>   
> +struct drm_fdinfo_memory_stat {
> +	u64 size;
> +	u64 shared;
> +	u64 resident;
> +	u64 purgeable;
> +	u64 active;
> +};
> +
>   /**
>    * drm_is_primary_client - is this an open file of the primary node
>    * @file_priv: DRM file

