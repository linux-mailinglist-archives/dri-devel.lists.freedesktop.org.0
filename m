Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EED361A259
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 21:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6C810E81B;
	Fri,  4 Nov 2022 20:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB1310E0E4;
 Fri,  4 Nov 2022 20:41:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFTkhTsBQwAVXu4jxy/GrjnJvuqsipEFx2tWVn76oa/hb21//gwwSFtdVB9gLhBDKbo3EHfn6RAMBZA9PupW8g3hJwBvIeL37KnLlhMukBgeeOud7/4IdVWTycHSIYl8ANuJeDMy44cBU3u84zrojnGDOlvUjr4PwrvM+71H4dprb9bCyle8FxAXUPq9bClRdVNNzG/TiEAGFP0zLYBPGZdo/fazLGd88LybaSNbQCQ5x+2kqN4X1hkU5Xq5UN6QIg1IDCy81/c1eO/DdwxOC6f00ZlQgg399bAIjibO0aO6E1pU6zNigXeuPruI+djVhbdg+s+nM2KTiiIri6PM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHlrOdQgG7aVh9xfrr999Erl0ZXVcYTq0Iltks3NldI=;
 b=HN2EQuXgtRoHp/cnUaSyFHS6WYh8fyL1V3G2+J1AOl0SFIMfKbtXqzuNOyt+0n/0ADYpw2KoRRv6w4zCVsJfTRbpvegqo82Y6AglnQGRw1ToD5Zpn/VhqhHJdeaYZrZ6ut1KdXLB1APGBTMjFD4ReNw31OkkKR9yDcolMKsg0sm8WY7kib2knbaT41zaGuo9RvTjkU1FIEJEHj3RVBQGdYrkesrDhpT545ITYunhVtsnU1e0Vx0MTxfAGEtfkDHccnzAWbTfgfDOS9TSJ42EW0rb6Mkl6BJxtJUH5kbX/eelXGZBKBiW7ZiL+sOchX4to+Akgna98SzhJe5RgrBCbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHlrOdQgG7aVh9xfrr999Erl0ZXVcYTq0Iltks3NldI=;
 b=4m0ruVuGDLq4D30kIHQWWaKojBa69W39ybYMm6eYrKmMxQTRFBkeg1Qy49taoi/wOTRIXhF7Cp87JIlRpH1gZACXJ7D1pLLgHmTK/mHgJAm/0FEA7gftKTuxRgTHAuQ87AHuZxgBTGCww6YJKOHHq4LV+Vw2w1bn24EID1YyQkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BL1PR12MB5995.namprd12.prod.outlook.com (2603:10b6:208:39b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 20:40:55 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350%3]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 20:40:55 +0000
Message-ID: <8bca88b8-e7cb-8458-01e9-544de44302b8@amd.com>
Date: Fri, 4 Nov 2022 16:40:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Coverity: kfd_parse_subtype_cache(): Memory - corruptions
Content-Language: en-US
To: coverity-bot <keescook@chromium.org>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 "Ma, Jun" <Jun.Ma2@amd.com>
References: <202211041239.2B98F280@keescook>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <202211041239.2B98F280@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:610:cd::22) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BL1PR12MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: d07c513a-f7e9-4f4b-4f8f-08dabea4deec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WkEKMRGZLvyczkXEIxFQNshKOjzYmU7ng67QigAUYfSXpIj0UwZXuqDSs/AkXR8vwE11hu5KjgAhhBpux5x3OuDoMIwii9UR3L4wj0YtlOu7bZIuKTSo3Chr1LV2gCnxk+dxSsgFuDL88+M8q0SW5WPFQhWURpx2Q0rGGl2M9cRSOv05sCIWpurCOeAfi2fLosTo1ldriiHcgMNYafjdSqzEFrDqBipifu7B9IE/gpLeg3YPN+iTjwOteu7LIhgXibopI+hHuSzSvHkw+o0ze/6dFuhQlOla5h7o8KWQOGBCWJN+HW/JbzUzo1TwbcfaB5lwADBq1aDbm0J3/48uAf90PiMb7InCJ/DLcSVLeY6HCB5XMBVTu/ozBIF7Tk/uMXy2tFyQEDNFO/Cpcwj42cXiCBQwV8Q3wCORVuAXrbetL/Tc1v5cfV1IOuhJ19MO3AxoblTCBlr9aSfsyNQtwldEA1p4MbIzX3T5v2BWrh4N/V7SimGk1zM3XWYi+RgGM+5uAhjpy31rUUW+Dalgz/CfHG4E7/G3eMIgzanPf5C2/jtKR1p7xx/+b48H5P4sCodKlYweoUDsdEo78oxTiihHF5KpX9b7taF4Bgv0q9pw0KrasEngv32sfK4nLlk5/vyF1iCExUVMyeVPaGKEVcktMkdcAUhvSfQInOr0RXIpvE7L7Llkcruj7NBnWF8dyZd8V1NrVgf+nSGWtTgbHRd+0NbLQgJGcR13a4vcc0w4NPlEY1BHe8MSQpZEX6yPekL1pOkh1Erj5K6sevKWslhrw0P71BRYgqARFJmJlp+G/5G8sHIv4vvAa3Y5suu4Uini/M/c/7bfYFn4lyFgjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199015)(38100700002)(83380400001)(31696002)(5660300002)(6636002)(86362001)(44832011)(2906002)(7416002)(8936002)(66476007)(41300700001)(4326008)(110136005)(53546011)(6506007)(6666004)(26005)(54906003)(316002)(186003)(478600001)(2616005)(6512007)(66946007)(66556008)(8676002)(36916002)(966005)(6486002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnV6N2FOOU1tWWJuSmhvMnJzcEtnYUc0YWFOUUkxNWc0ZCt5eEk1L2JUdE5a?=
 =?utf-8?B?bUYxams4MXd1Zzk3VUtLeTZTTmZyWVBBYmhQSFpBMWgxdUE0cU4xTTAvZ3ZQ?=
 =?utf-8?B?MnUzYW9iNG9DTlVFWUhDdzdUdFkwaURLUGlzSmVsd0VDZzVhWDNVYThHZkR6?=
 =?utf-8?B?amRucDJJeFJtVXpxVlNCK05jdm05UnVaUFQ4SDR0M3A4TVplUkltR25uTTkw?=
 =?utf-8?B?Y2RURlEwdTBmQXRUVGViYWgyZVFvWi9QSXIyN1U5cHR6aUpST0ljYnJSb3lh?=
 =?utf-8?B?N3dvd0xUbGV5eFJlOUxuVGJGNFVmRVgxcFhHYWtjMXdEdm9tN2pwZnBHU0hj?=
 =?utf-8?B?ZHZlZVViVWhhK09mR21YQzkwSStsdjhyTmhIc04yY2JUdmZQRTVaS0Z5eXd5?=
 =?utf-8?B?Mll2MkVvdjg3dC9ONFVjMHZzc3IrTHZscFYvUkhnZkRSUlBiS0ZmdldjSmxF?=
 =?utf-8?B?ZDBQNjNIUlpWSG1nUDNXUGdVRWNQUHZFL0M1ck9nTWlEU0VrY2RRNm1idGFk?=
 =?utf-8?B?RG5VUHNwbzF3cXBMSGtYdkRZZCt3UFpQMGlnYWIwQzRaQ2IwcDJXaHpiTkRj?=
 =?utf-8?B?azZUbkFPMFRxZ3JBaVFvdGpNZCswOUhCcytZVVMwd28vc3A0NnMxQkJvTG1O?=
 =?utf-8?B?YlBxV3VXcnFjNTA2QTI0eEQrd3BGL1dqOUE3ZlFHYldrYU1CZFAwbUdxWG9M?=
 =?utf-8?B?Y0JLWXpUeE5ObCtxbVJqeUJ1Rm1wQkg5Z1NieWpnbzNUaWw2NUJKekZYb2lt?=
 =?utf-8?B?TWNLbXdMQ0t6KzVJTTBhdS9oU3lmcGpqMGN2Z1RlWkJrcWxXaGU0bk94cDV2?=
 =?utf-8?B?bjd6dkg5dUhrTVI4SkorOE5rS1pWdldVcjhWMHJydHB3R3JISXY4YW9QeGNV?=
 =?utf-8?B?Y2IrT1JydXl0a3hsbDQ5VHF5dlZLVWorOHZ3REkvNXNZTW1tNzdvUm1yMkZV?=
 =?utf-8?B?UWVqNWNRbkVoeWVGWUMvb3RWcENsT2RQNDd3SU52MTJSU1VvNi9seDd5S2J2?=
 =?utf-8?B?SCtvT1krdHYwWGJpRWsvTFJJeUR2NzJxTStNL2psMG9UZCtwNnBZZWFTdW1P?=
 =?utf-8?B?a3R1cW9INnRueDRvQ3FyWDJ1blR6bnpNZ1ZtVEZncmVFQjJ0dDYwS0lLS0F5?=
 =?utf-8?B?ZTF6K1hqQ1k2d0lLUzdyMm0yZDJnQ0puK2N5OVBueTk1RnRzdTVrbllDWC9r?=
 =?utf-8?B?QnNLOXJST1ptbFVwWlZPVnBraGsrb1FZTmxRRTdRb05Lbk1oTFJhQ1IwNzQz?=
 =?utf-8?B?S1JZL0NIMnltN3QvZkc5ZEdiU0x3Q1EvVWNZbGpUWHQveXlOcUpMRVJtNC9G?=
 =?utf-8?B?UTBYQ05JNU1hY0VWQ2hZQWJLWTV1Vmh2QXpIZm5EeWtZbDlBS214YUwwNUlw?=
 =?utf-8?B?VzVTUFUxdFdpUnhCVHJ1TU5mUUNrYlM5VkZ5U3FnZXBva2xRbGJSVzA4a1Ra?=
 =?utf-8?B?K09Ib01kcllKMVhlQkJsSHFHc1BGd2ZrWk14MWlacERqenlsemRmZmw1djA2?=
 =?utf-8?B?YUdONHkxNnhJWlZnUmNRc3p6WCtHT0JvR2tsbVNQK3dRZWtXdEpiSENLR3hI?=
 =?utf-8?B?UEhZdU9iZms3VFBPeGlXWVRpd3g4MTN1NHFrMUpHb20yNVYzMXArRWVIK1gx?=
 =?utf-8?B?cHhDS3Y2NVhBRTJyV29IOWpCUE1UUUE2VitLSldtZVJaaGFoWDhQV2NCWmtx?=
 =?utf-8?B?a0UxWmVQWGo3TGVxaVZ5MzlDVy84ZkJxUmpaaFhSVldXdjhUb3h4NTZWNGRS?=
 =?utf-8?B?bDNXVlZHeG9kYmo5bWdGMHVuL2RvYW1pOVRvNzdybXZOUE5UWFJKMmpPdUZy?=
 =?utf-8?B?L2ZDU1NWUGVBYk56V1dQUjRxVVZjd2M1UE9LdDQzZWlLMHJrS1RGS29VVE9z?=
 =?utf-8?B?dmJ6dlBkZlVtK3pBbkY1ZlZEZkU0cWp5YmtpWjhtWHVKSDhUL2NnM1hqU2Ry?=
 =?utf-8?B?WGxuZEtiSTZVVE81eDFWRC9kYTM2VnZDZk1IU3RaaDBHWnVDRnNRMXJ5bnI4?=
 =?utf-8?B?azlLNGw1QkZEaTUyUnBRNk9FSTdvYXRFK3JkNXpnL04rS3FkTjZsTHp6Rk9C?=
 =?utf-8?B?N1pPK0pxVk43R0h3QmUwbm56aDhTdEJ2VkdYRnBDdXl6eVlTRDU1eDZQOXRp?=
 =?utf-8?Q?h511NYdFaeMhGxmgiYE4FtTdh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d07c513a-f7e9-4f4b-4f8f-08dabea4deec
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 20:40:55.2007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBtH/OOIwZBppAhswGrWjs0vfVKfkdzaNbDzarqWqlG6JUwKne2MKSxiSEL8Sp3ao9fggRmw5BoY2rNuZsH/EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5995
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
Cc: Jay Cornwall <Jay.Cornwall@amd.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Amber Lin <Amber.Lin@amd.com>,
 Ben Goz <ben.goz@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-next@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Kent Russell <kent.russell@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-11-04 15:41, coverity-bot wrote:
> Hello!
>
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20221104 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
>
>    Fri Dec 8 23:08:59 2017 -0500
>      3a87177eb141 ("drm/amdkfd: Add topology support for dGPUs")
>
> Coverity reported the following:
>
> *** CID 1527133:  Memory - corruptions  (OVERRUN)
> drivers/gpu/drm/amd/amdkfd/kfd_crat.c:1113 in kfd_parse_subtype_cache()
> 1107     			props->cache_size = cache->cache_size;
> 1108     			props->cacheline_size = cache->cache_line_size;
> 1109     			props->cachelines_per_tag = cache->lines_per_tag;
> 1110     			props->cache_assoc = cache->associativity;
> 1111     			props->cache_latency = cache->cache_latency;
> 1112
> vvv     CID 1527133:  Memory - corruptions  (OVERRUN)
> vvv     Overrunning array "cache->sibling_map" of 32 bytes by passing it to a function which accesses it at byte offset 63 using argument "64UL". [Note: The source code implementation of the function has been overridden by a builtin model.]
> 1113     			memcpy(props->sibling_map, cache->sibling_map,
> 1114     					sizeof(props->sibling_map));
> 1115
> 1116     			/* set the sibling_map_size as 32 for CRAT from ACPI */
> 1117     			props->sibling_map_size = CRAT_SIBLINGMAP_SIZE;
> 1118
>
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
>
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1527133 ("Memory - corruptions")
> Fixes: 3a87177eb141 ("drm/amdkfd: Add topology support for dGPUs")
>
> I'm not sure why this suddenly appeared after 5 years, but the read
> over-run looks legit:


I think this was introduced by a more recent patch that was in fact 
meant to fix an array overrun on HW that is outgrowing the CRAT sibling 
map size:

> commit 0938fbeb6f53fc44bc9b19784dee28496e68ba0c
> Author: Ma Jun <Jun.Ma2@amd.com>
> Date:   Wed Nov 2 15:53:26 2022 +0800
>
>     drm/amdkfd: Fix the warning of array-index-out-of-bounds
>
>     For some GPUs with more CUs, the original sibling_map[32]
>     in struct crat_subtype_cache is not enough
>     to save the cache information when create the VCRAT table,
>     so skip filling the struct crat_subtype_cache info instead
>     fill struct kfd_cache_properties directly to fix this problem.
>
>     Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>     Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
I added Ma Jun to the email.

Regards,
   Felix


>
> struct crat_subtype_cache {
>          ...
>          uint8_t         sibling_map[CRAT_SIBLINGMAP_SIZE];
>
> #define CRAT_SIBLINGMAP_SIZE    32
>
>
> struct kfd_cache_properties {
>          ...
>          uint8_t                 sibling_map[CACHE_SIBLINGMAP_SIZE];
>
> #define CACHE_SIBLINGMAP_SIZE 64
>
> Thanks for your attention!
>
