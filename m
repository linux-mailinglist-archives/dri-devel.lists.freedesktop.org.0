Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 934194F9094
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 10:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABE210EF7F;
	Fri,  8 Apr 2022 08:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974F810EF7F;
 Fri,  8 Apr 2022 08:18:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keqQHEp6d9Dj3uVdL3p6IqoSJTFO+HGI1yWkjG6+YJUszqQc44COPN3Kxf0t6qbK/jruIEJd6IDPOkryoji0r4MGj8+KjyX4NRVjZLArOl27DM0/sOKOoBT1C+xeaYR9W6w7Ky96Av4aprzcruw8m8Ez3Nwt4dQOI7KfcwdYhDClSUaA43CBmt8dCHBXPbnA9D8kk01YiLwPo1oVuQBJ3RC9pbimh3SuefKO17xm+sDq7G8kYg3AbwZzdDnfpi00m+ucvWGxk+fH2GNdA0kFLthxOS72g0pBdX6V+v0oGrGqt5GjFmvQGBUZnxaCyRvdPLu9i1SD8iUjdFtM1j8uNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+a+dLy3kcNGLle8J9LbKGgtIETeBBr6D9GXE7xUAj4=;
 b=XgG09gN0U0bMaFkUwy+JmHAouRYv3cJSyktogA6YQvr3cWTdHj3zh7BY4lowg1qtdRYclnYnQm6TB3NwP4KbBMrWFnnS9tOTstUNtp55DVn0mladkjsaJQXC8MNzIWaxBE9qrUyHmK/sZD1BEMwMtdtcEXWzfDkGuqMBIsVPri3RX5azgQPlYjEgjVC+fUzUgeiYPxZf3TF6dHpfZcEi7UqJjoNApnXwOHspKCD1Y1hkYlBH7SbWmn4D4PgdTZwbaT8UE2O3hLvA7K/xVem6xdwIGWLixytnVpKq46upDaRnQgtyDZtc4elWQuG6FCKJBuWMoE6p8iBo2WP71SF24A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+a+dLy3kcNGLle8J9LbKGgtIETeBBr6D9GXE7xUAj4=;
 b=OnlrLZWARNrB6mItAJuDdX47coPViRn7oFz/rffY8W1HiLekH5vZqfHiERmFt2fwgEm11O2AOEAo7P1VrERQpVPz1G8nBD7wpn8kTftwQzqiBqS1+yBlxO8UUmJ3GWdAcXOTc50UDXR9myM+bbFyAkqW6hMBp6fw5AYjnCh3UK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1935.namprd12.prod.outlook.com (2603:10b6:300:113::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 08:18:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 08:18:01 +0000
Message-ID: <63cabbdc-a062-d51f-0baa-afb09a5705a7@amd.com>
Date: Fri, 8 Apr 2022 10:17:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220408111010.31a7bc8b@canb.auug.org.au>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220408111010.31a7bc8b@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0396.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b3cf3aa-352a-4661-ec6b-08da19384c4c
X-MS-TrafficTypeDiagnostic: MWHPR12MB1935:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1935B046D404315706FF4EA683E99@MWHPR12MB1935.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sNTxdNqGaHrBzlNhFXVx0oakLtwAeH8B0DZW/dEyd9z/MjuplMCFHtsguMRTVNzgEXLg/CwdvTAwJ8BGIIn9fMsyMoudxnK1so1Fz6a+2ac9s9Cbzzd29IweMxpSczIj7kIb2YKHBU7f9qIRbA8kH6wIa2j6A7Q34g8y8LUiK/mZRWwu4DIGt8RNW3XeqCblTwVkEI+6AOKUcTxFkQx3bwrkeg+b2bpg7uT3hkr82mbvzHh4v3yrQAUwmef7uDxZc3EEFagrELw/2kst2jEag/ZCf1pk9ulIj9zsuTdCmw1Oa2wK4n9VCmcVo76F216tqu5uGUNXggZkfC2erq9fOuO/OsoLfpnm2z/5I/VDdcu+Q21bUYCdHaTZhlPjYDGHIYVwJWuABlI/6Y4ZAiLjDpdLFFKxF0i3msE3T3h6NC2TAwR8r4UpFGqg9z1a3n6jzZOvDuucegoyLfN7WPJE0i2tB/iWnXDJEzxUVhXeLFkqj0ljrknoUN5QJgMqEgxtQlMsEZ15hFtagU4q4a1KhPxySPZSGThMhNN661q8mJHYxutGkegBOLNZsW1wIrAOJvcUfpNhGPfo8skBpk3YurBnkhdOO62OVcjchsWfl1Af3x9V3w2waTk1x4kiFIp3X4wSQyFdNrfB95FgVozrvAsp/kCxybI0iu6d+0pSHz9Ev3gdS674cuJKUgeiuiOTFU27uImKBHpI049KgubWnxzJk+hYkEOy/wX9n7Wfyd8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(6512007)(6506007)(8936002)(2906002)(5660300002)(4744005)(31696002)(38100700002)(316002)(508600001)(36756003)(6486002)(2616005)(186003)(54906003)(110136005)(86362001)(83380400001)(31686004)(8676002)(66476007)(4326008)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2F6WlVzSlR0c09iZGl6YUFoanlZdzU4cjZUM1cvY3E0eHNLczF5YzAyc243?=
 =?utf-8?B?UDkySnJVL3dDeFIvNkNCczNCTFJkMVJPUFNYWTNZMkNwNEpLa2s0K1AyNk9G?=
 =?utf-8?B?K0huMUJFRjc3MjgwR0E2MEloRGJXU1FCWW5jM1F5QlFVemg5a1dGSXVjbzJL?=
 =?utf-8?B?Wm1kT0FJdWZNUHYxUFFucGdVRGI1U2FMYWFUenhmRitlUGhWeWNJd0RKcHRN?=
 =?utf-8?B?TEgvQlhVUXFjUlUyRUNMUXBtQjd4QTh0YXBBc2tZRTdHK3lkMEJkN2NvTkhq?=
 =?utf-8?B?M3hjOEVnY2g4YVhqZUVkSUNTZEJOanZYNnpCU2gxR3F4eGd6ZnRnblRWN2Z2?=
 =?utf-8?B?d3NFblpsMjdUQldmTjlyV2lra291MENwcGpsTS9RcWpvTVlVMVJmVC9vYVFB?=
 =?utf-8?B?STRsWFhwR2NSYmp4V0JqM3VjeE9nd3FoUEw2Z2RGQkJtU1FLeUN6d3A2M3lL?=
 =?utf-8?B?SDFFU1hzVnJkNmlocktrZ1Bmcjg0WkJKbmw1NTBzbkVsUExMSmdmcWZhMVpF?=
 =?utf-8?B?MEUybVlIYVRYYytKeTUwUDVJQTdLZVBrSUhTZ3lKWWgxM2dzWHZSTlFUS0Zy?=
 =?utf-8?B?aWhHOUVZeEJvQlRFWmdISll4Z00xaFJ0S2o2djRJODg4dFFQRmdrUHdnajJR?=
 =?utf-8?B?STU1bkYyMjZOMWtSRTljay9jZElFOUlzNzNTQTM5OGh0Nnp3MnozNng3SUVS?=
 =?utf-8?B?L3c4UlBid21ya01MMGExRTNEdktYU2tESXBhN3JlWXFrbzlrNG5YR2dLbCtN?=
 =?utf-8?B?anlFN2lPTTh4OWZ2RWYySXluM0NPeVZMTmQvLytMSVdyeXp0bzV0aXVJUmlC?=
 =?utf-8?B?ZFdRQ0FEVlpieVJjTHgyU2dtVE9TaUQyb1JROVMyZUROdkE0K0FkbG44ekRJ?=
 =?utf-8?B?Si85Z0NuTXdWYm00YkJ5bjNuQmI3K25jcTNBUmJvT2dWaklGQ3VTblkzYVZo?=
 =?utf-8?B?U2pVNnl3Q2dlb3Vyem82cjJIbDhDYmR1eTJLVXYrckhZZ0hsaUM5R005bTE3?=
 =?utf-8?B?NFIxbWxoOWpwakxqdUxvd0VZSkVsZTdrMFVFQ0lnK1JpS3BFQ1BEZDFFQkpi?=
 =?utf-8?B?a1REalZ0Y2ZURXNWQ0w5NElQRFdCcmR5aEh2NDJCVUdCUWsvRGtSMUUwU25J?=
 =?utf-8?B?azVuTDZNbmxzYXIrS2hYbEZFRTJBbG5kVU5QejJyU2psRDdUMTB1OTIzMGxn?=
 =?utf-8?B?UXRPTjVGb3JhWkNIbTdZc0JZUzVjQzJnN09DUUMyeGZiTEJoeGlUSnFaTlFz?=
 =?utf-8?B?QStHV2hvQ09INklnTmFzOC9DcjR4MEZxSUNiQ0ltOStGU1ljU0ZBOU52WExT?=
 =?utf-8?B?MnM1ZE1lOE5Tbkk0bEtrZ3g0RjRrZVB4aWF0UVg1bUhNZGRFVmU2MFVZOVJD?=
 =?utf-8?B?ZWlMR3lCWHdhVWM0dTJ6cGNwVW5SMzc1dlEvQ0Zkb2Ixcm56ZXdzNWgvZFA4?=
 =?utf-8?B?VktKS2V6cDNXR29qYWtSNnRqUXFodHJqN0tzU3pEQXBhU25Bd3BRT2ZXUmUy?=
 =?utf-8?B?Z3AzVi9FZDI2SXZ0YkVkK09lYXMwS1UrQytaSWVrNFUvS2pYMlg3QnMyWXRI?=
 =?utf-8?B?VFNDUUVvbGc2MDZrUktwdnpkOG11aWZYZ3FLb1QvajV1KzFYVWV6VlVlS0Nq?=
 =?utf-8?B?Vy9ibzJ3WFMvQlNwYjR4Qlh2ZkZIM1FhWGgwM0w5M1JwTkxTUE1tYmg2Rkl0?=
 =?utf-8?B?d0I2T1lvaWZWVEQxVkR6Um83bjJJMEs2QVNsYWQxa2w0WklwbGIva0x3TzFz?=
 =?utf-8?B?Y2cwL1MzM2c1UzRCNml5SndVbzZ1K1pET24vb0pVVEZiQTByaytXVEZBSUc0?=
 =?utf-8?B?WkRPMXJMQXd2N055akhod2I4Q2wxVk5WUU5zL2JQYlZoU0d2YUUyV2RHQzIx?=
 =?utf-8?B?azNRekVOQTNwQk5sV24rMVNnd1dwZWlzMUtkdVc5WXZJSkQ3VWlmZFh3ZG94?=
 =?utf-8?B?OUZmWmNFckc5dFlVT09hVVpxU3FIYnUxN1lXc2h1U3I3NzFadjBMK1gwWVlz?=
 =?utf-8?B?alpwMGxPV3dCMlRoenBDWE1zUWs3b3VpS1FJeFFocWZXYzllcSs3enpKa0Zt?=
 =?utf-8?B?WTh4bTBZLzBXa1hnOWZMTEdTUDRkd1laQWtCRWVqSHBmdS9SaWZrQ1JYMWRR?=
 =?utf-8?B?V0Z6SzVmY25JUzdkMUZIbmlLMXljdUErazhVVFB6OFRUVGVnaUp1ODZsZ0dJ?=
 =?utf-8?B?cnhKWG5WQWxkMkd4N0hWNHNRVWg3YWFiODVJSUg3SjdEdU0rRmNia3NtMzlo?=
 =?utf-8?B?bG4va3ZYMDRqcXVXeXFsQ1AvbjdPU0hGY0JKM3N6eW9NNXpUcksxMkE1Mzd4?=
 =?utf-8?B?VnVvRGdlbTY3eEVBWXNram44UnZVaVBnRk1ldUlYaXVBRkVndEd2RG55eTFk?=
 =?utf-8?Q?2Sz+/ytX+bVDKfgNlEPARyhgXhSy9yljuX2CQRYO5/O8V?=
X-MS-Exchange-AntiSpam-MessageData-1: aGbm73pgmlF30w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3cf3aa-352a-4661-ec6b-08da19384c4c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 08:18:01.8443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrI7hdC9ebP5KGL4S/iGSq+IvgRg58S5QDvh8OrOM5Q0kUdkINY34qT8K2rFjnn1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1935
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.04.22 um 03:10 schrieb Stephen Rothwell:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from include/drm/drm_gem.h:38,
>                   from include/drm/ttm/ttm_bo_api.h:34,
>                   from drivers/gpu/drm/i915/i915_deps.c:9:
> drivers/gpu/drm/i915/i915_deps.c: In function 'i915_deps_add_resv':
> drivers/gpu/drm/i915/i915_deps.c:229:46: error: implicit conversion from 'enum <anonymous>' to 'enum dma_resv_usage' [-Werror=enum-conversion]
>    229 |         dma_resv_for_each_fence(&iter, resv, true, fence) {
>        |                                              ^~~~
> include/linux/dma-resv.h:297:47: note: in definition of macro 'dma_resv_for_each_fence'
>    297 |         for (dma_resv_iter_begin(cursor, obj, usage),   \
>        |                                               ^~~~~
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>    7bc80a5462c3 ("dma-buf: add enum dma_resv_usage v4")
>
> I have used the drm-misc tree from next-20220407 for today.

That should be fixed by now.

Thanks,
Christian.
