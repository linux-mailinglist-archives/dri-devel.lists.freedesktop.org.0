Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 310166B01FB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 09:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E4810E5B1;
	Wed,  8 Mar 2023 08:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1D110E5B1;
 Wed,  8 Mar 2023 08:49:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYBz93s8n4ZhQdkFCWUbRdnXslDPf1A+UYfpVBRtqODhDNzzp5rtGxF0neiG0CpmyFSTcivw1WMckJsIoRaPWwSPaPcmFPnCPcDkcuzmepDBi4DT3pz5H1fpvUP8cV0X37mhpV2oK2jrOcA50Bo69vyqOXy9/+6VnntP+smfo0K3EJ2OmIZ6eAwv2ZlG6DmYvUceO9W4QfPOYK7GAB4LxXo2aCeDnGFcOOchJ0RxX2TCA7U0uJI2qaFL/+FZwqowx3Ba1Z5ltu90SnCPiHujwaTv9yfbdg4o/H3pAhZ+2WFreZOY8XlB2uF/x+WAzDBINLT8OP6f4O/HNmfF78p/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5h/Cew1DP3sf722C4vQOleqbX5/meg1xc+vF3BHnxTU=;
 b=L0M8rboefhCWFaSwjFPgjjbxfMDzvnqRlh4ehsOHqkEZF4SUyxLluV+LeGfpiySN8iQD+PO+XZZrsp8gIti7huZfQWvJVKGNqxvfZ5BEMw5jqFCUtV0Zf5Nfe1x4tHMCpyo94rQ20akMRRD6KxcSHCd/F4SL6lIpkXMPh/DWSGVOpoHMD+FSCLGQk/igwvhr9BI18NpNHLCz7J0Gj1ygdaQw2GCqD9ptU/7Sbd5+XIdQMjultKdWypPJM7XywLsO6XTRkjuC+IMT+jpL9sNxdeXTefWQ4kPbDHu6pDSLMAd49lAqi3reHrx1mzmlm6srmVJCR7eQ+D3QHXVRm+NpcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5h/Cew1DP3sf722C4vQOleqbX5/meg1xc+vF3BHnxTU=;
 b=O7OdlfWTLHQ2ysKuaXrRtUK4DdvBS65PjkjavISq03s7E8QDgUqU+wOgEPHySit+GHp0sWYGfCesDsW6v/7Y2P4u7MoOpFsw30UrvBqryr2DkyL+xMn/bK3C0pOauFggKgzEYrtQmHOwCjMeIfcceuuOCOgGaya2OL9+G6Exajs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB7670.namprd12.prod.outlook.com (2603:10b6:8:105::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.31; Wed, 8 Mar
 2023 08:49:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 08:49:30 +0000
Message-ID: <c1a9f255-9ee4-c020-9767-afb2591faaec@amd.com>
Date: Wed, 8 Mar 2023 09:49:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/7] drm/ttm: Use the BIT macro for the TTM_TT_FLAGs
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
 <20230307144621.10748-4-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230307144621.10748-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 794fa289-3dec-4e19-93cd-08db1fb2080f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ziUykWLNtNp6/RMaWo4sz1cvlwH8JX2v7uYob/u6AhWZ9GUA/RYp73NxY0gDkZBKsqXknpi/T2ybgbIteQmI2MjYmhRUWFPB84LOt7w3Ncxk0vLhKgLxNZtMRE+mfKbAYfVo15xxo3iPQFVDAXxWeYtM6B19+4NT2miUAL4BUd3BmPYEjpCYwZHGwmcYnRQ57/3LLl7+9jcgvXYkl4V5ufMGq9X+A7yAPsylgfOtqbU9pssIbD8WAX+gRTPyHm2pmTwtV9MA9ZeGfJnKmR2BoFvII70rfF8yM9oX4g15BD8N7MYUaoY0YusK0LImrXv0bGOrtA1neRYt0mP8yHRZmvcF2kCpNLdwdN7VLxD5JX3G+SMCMH6s7q0j5y59Idl0AtMyiZIxk0MwggLww0LBvfK6gD8ETnmT6RZjzkDWf4mdWMMmV4kXhWySuB+NJDX+p+jk9F8wVzWOlsMAC1s3RrtUUdMpFsHmckY8w2P0EqXn1DXuaE8bhqPbuG2u3CtqZBlxmTr8ez/AYKPaewZ+6nAdG+racNVOicJzQZzumHGhYxfgFISD7OJD4+eF6296oU+lT1Ftri8qeotmPuuu6JulUQADWLpHjEnFYmTz0caDVM3EIUtI5s4HgdXiXbwesI+fm7+0q1whGQsHJyyei+1gK8mBoeBH9x0lAfdI73xmjmBJCcARO8z4JveU6X5nZOalPZQKJ6q6JP3EiuGJn7i8YB/rNRmkQ3BBSAYtHPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(4326008)(31686004)(41300700001)(8676002)(66556008)(66946007)(66476007)(316002)(38100700002)(186003)(36756003)(2616005)(8936002)(2906002)(6486002)(478600001)(5660300002)(6666004)(86362001)(31696002)(83380400001)(6512007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGcvUzdublZTV2ZGb1IxaE1Ra3dORTNRM1V5bDFKOGNycW5BYVloYU84VmxN?=
 =?utf-8?B?ZUtiWXNrMkF6elY5ZmQzdC9FODBlSUc1VDRMTEFqRGV4YlhIZUhPVHpqbkd2?=
 =?utf-8?B?dXdSMjkvcnJXMVlVdmlucW13WUVMVnlnZUFYVUhXWHIyUURPYm1lazQ4T0FQ?=
 =?utf-8?B?ZCs1dDJvbW1kWnl2aEFNWG43a0xSVXcwaWFSVTNTa1RUM3JHalA0TnlNakQ5?=
 =?utf-8?B?RTRPVHA5Y2l3dW0vcXduTGxmSkdUd041QkJ1UkpJcnViRUlDNy8rbTQ5bG1Z?=
 =?utf-8?B?QnV4bnNFR3NOWGRVa3hTcEMvRE5KNTNoNVBMYmZ0NXZWNEtHcHlVdGthUlFr?=
 =?utf-8?B?T241UzdmenFXRXlVWm9qN2pkaU9Cdll5Vmp6TXNVNkRRa08yZllqQlc0TkR2?=
 =?utf-8?B?TU9DNXBENmRydEk5aUxrK01NSjJpWjlQL3Y5Tnoyd1ZmU3kySGNBblErUjdO?=
 =?utf-8?B?VWkzTXFnakdubFdPemUxV2xqZGlRUTZ0NmRnYy9iSWNUMlpYMUl0RmgxZVlm?=
 =?utf-8?B?R0djbS9hU0VTWGlDdkd4WXRYMDRZbE1PSk1QeDV3VERjT3dRTEZYMEd6SGJ4?=
 =?utf-8?B?MWxham1FZFduK0hBc2FuTjdMRVYwUS84R3NCbS85L0ZyZFlPbGJjSnF3bUVJ?=
 =?utf-8?B?aFN0R05mUHM5RmtvalF0UW5yaWx5UXNnenlQc0h5TUZmNGx1RE5uZEY1Z0VD?=
 =?utf-8?B?MlFhRW0ydFJsNEx2ODhXSUJPZ3NrRGxTUGpmcVFJTGVLVWpxdWpEZjduMFpr?=
 =?utf-8?B?ZktjRWQybWdCNUJpeHBiaTVnaXdhcm9YLy9aWDN2QUJUaWROWkQvbU1lL3VC?=
 =?utf-8?B?SWVqVTR1VVVGVXF3RGhTc0x0Qlg1M0REbkJTTkREWEFWU1kzbWFISXc4U1dG?=
 =?utf-8?B?Qyt3blUvY3J5UTlScVhqN1dJOFRhYW1xQVkxeE1TYUhKOEpLUkZzVnpkODU5?=
 =?utf-8?B?dzFMUVhBYUlZV1gzTVdrSWN2Ti9tYjEwNXNjYmZtbzVWODAyZGk1eC9mSEZS?=
 =?utf-8?B?NzRNRmJKWWVldnBXMWI0RjhPdXg1MW5WK0xjMFlxUmdCeHdWeTJUMURDNm1Y?=
 =?utf-8?B?Q3pDK3JRVUZJcU9TdnIyNWhQRFYyUnNvWDV5WVpHNVJxdnRSZ0tERDE0a3pG?=
 =?utf-8?B?ZE0rY1lCbzRuNEdYRXJPaFhkWXp4L3grQ0JYeDBGeEFSNGM0L0FJaXVXZDJZ?=
 =?utf-8?B?Mzc3QnlEMVlLZGIyT2lmM25UN2d5dmlTMEt4THJaTW81ODgxUng2dHFXWFZ6?=
 =?utf-8?B?cTZPQ056bVV2c09lS21iYjJxQy9kVU9BVWE1dGRxMXZFV05IeFVDOWlYNlpo?=
 =?utf-8?B?ZytiVDZYNUJmU0VveEdsMSswRDR3b1BlUEpxV0pjU1crQ2ZuUkVzZHo4Zm5k?=
 =?utf-8?B?amNRM09lSU9lQVdJb1ZOaXowaVIzZk1ZbEliaDhiRkYrNkM4amJRZUFtcjFY?=
 =?utf-8?B?ZzErdnZGLzVKd093Y25NQlhnWlczUlNLM1FuQzRhbng0Y0ZabnFFQk1SRTVK?=
 =?utf-8?B?NGdyYW1TcXR4YUNsMiswcFkvRkM0RVpNUDJaaE1UWHJsZnpaa1E3ZGJUNTBM?=
 =?utf-8?B?ZGo5dnlkNWNJQitnRkhTbTZwMFdsSzNES2J0RE9nNFJZVFl6a2dPV2x6VXpn?=
 =?utf-8?B?alBVczBpNHRkc2dvcFRPbUhJNnkyL0hhOC9CSVMrNUNUMnZBdnQvcERPeGVx?=
 =?utf-8?B?a3NIUlBxaVhNZTdJcmJFcW9HR1poa20rQkR0cXV4ZTJvNGUxaElNUjBwRnlH?=
 =?utf-8?B?blF0STE0WWc4TVVjOTNMTVVIaVJlZWRwRjBJY0lBZFdNUG1YVy9PdUR0L0px?=
 =?utf-8?B?cWZzZEp2TFYzcmRISWRlcDdjNnA5UzVWaW4wVE1tQXJUMmc5TzBPbXFRS0o0?=
 =?utf-8?B?MUZIQ085TWxNQ2VheGt1V2xBbWJsQlZkTkVPa3U3Q2doRmhRS0svdFlJd09U?=
 =?utf-8?B?OWhXbVhTL0RBbm9TK3RDSngrdFJQUy9mbU1JSmlpVmJreGhZbnd3WEtJbmc0?=
 =?utf-8?B?ZTNmbkJKSE5oVENPWGtTcUZRa1o1TlFTR042bnNaQSszSS82OE1NdnNVOEpu?=
 =?utf-8?B?ZEltSHhvcncyVTJxTHp4NEh0alhxTmJTZjE0ZWswT2xLWmd2ZGxsUzMyMnpy?=
 =?utf-8?B?cmZxQXo4ZVcvWmk3Y3cvdzVZeGZnQTVnd09Jakh4QXNNVWEySHZubW5UTEtw?=
 =?utf-8?Q?iMlTm0myVVv9nOVCE+16zEBDCaguxWvS/7b+Glj+4LNA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794fa289-3dec-4e19-93cd-08db1fb2080f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 08:49:30.5435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QvCgSdCQm81PG9fGZWnNw0ysyOmEmjasDr3/Z0Zm0hcMB/4MjcepxJtf8F2W1xw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7670
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.03.23 um 15:46 schrieb Thomas Hellström:
> New code is recommended to use the BIT macro instead of the explicit
> shifts. Change the older defines so that we can keep the style consistent
> with upcoming changes.
>
> v2:
> - Also change the value of the _PRIV_POPULATED bit (Christian König)
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   include/drm/ttm/ttm_tt.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index b7d3f3843f1e..977ca195a536 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -83,12 +83,12 @@ struct ttm_tt {
>   	 * set by TTM after ttm_tt_populate() has successfully returned, and is
>   	 * then unset when TTM calls ttm_tt_unpopulate().
>   	 */
> -#define TTM_TT_FLAG_SWAPPED		(1 << 0)
> -#define TTM_TT_FLAG_ZERO_ALLOC		(1 << 1)
> -#define TTM_TT_FLAG_EXTERNAL		(1 << 2)
> -#define TTM_TT_FLAG_EXTERNAL_MAPPABLE	(1 << 3)
> +#define TTM_TT_FLAG_SWAPPED		BIT(0)
> +#define TTM_TT_FLAG_ZERO_ALLOC		BIT(1)
> +#define TTM_TT_FLAG_EXTERNAL		BIT(2)
> +#define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
>   
> -#define TTM_TT_FLAG_PRIV_POPULATED  (1U << 31)
> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(4)
>   	uint32_t page_flags;
>   	/** @num_pages: Number of pages in the page array. */
>   	uint32_t num_pages;

