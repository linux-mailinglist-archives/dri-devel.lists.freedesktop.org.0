Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D8F4AFF09
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 22:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E01910E5BC;
	Wed,  9 Feb 2022 21:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF4210E5B3;
 Wed,  9 Feb 2022 21:14:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQL5r3J1frd3BWbtaYAhH+z2jhAuRP5hIA85NN9lf+MYwiuQLA9HvYnz2sOxG/0YpIz9DicD9rvRBRUkZHfdfb9RvPUilIpIrl++gYmj/2boA9ap5FUpSf8A1QK22d2BxzUV5JGJecmM1sT3cMzAl+rouHojRezsWkVeqkJVASYGIl0eYlFEuOop/OFePUL/YC/ghGcH9wX0Og2YFgK4f227CmLdIW5ufGp9iEY4pQ1onqEpSTFzh7r6ymgTHh3KbNvffSRujpZ823DyWl3tsUscTnRWE3nDYa98eZFDjAXUoWG8I3g68C/mpFxbTtyOW6Kdn949M0CHUIPyXDV2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c43PZfsRv9v0IjTb4KXwlk1RJymvTfJmgA5mWNJ3Y8Q=;
 b=gcx2z2RpVl/3dSD0Nm6UldjG0r9n8X26+qLkeuyc3DqP8kKnMysinZy6+2ZgRQU8rvJ7YstpOSUrgwU+HgF131lHXDA9iarq5/ojcpIAor5aK1XVxzadP3d98E6XX2VaMB2qoTvkIQAxYr+Lw7brBqX4MxIvxcnlw9MQbTmbWzcKzWRlzOxILEiLJyPjvN1j/fks6jffCUa2XP+OgJSFT4v+JWZcXwqjDGo8Qu21zJHh4V0P0i9nGzb9NYaLZScRM3JPNBP54OIBuXuZIfSD95cGVNspsBXMltDsJ/oD/uFYFGT5jN+yIzZ5CiQNxwlMwZfAr+23vaB1N3j/N7W6ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c43PZfsRv9v0IjTb4KXwlk1RJymvTfJmgA5mWNJ3Y8Q=;
 b=N97eyhOrirVtCQ2Ls3maxbSuo45iGkYOdCyx2ctONZFyEkh6Pr5ulwUlsniX8zj4gfjfdOVWAIyX6QQ+TpbtVF6xypoZijTPziaoLNjzqyfy3zLk00YKhTgkrSE2bvNCGVTNHDWJWd54XAsp8m3ndj2Rg0YNJE1DsemtFNsYBNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 by BL0PR12MB5556.namprd12.prod.outlook.com (2603:10b6:208:1cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 21:14:51 +0000
Received: from BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::f071:728c:3813:3376]) by BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::f071:728c:3813:3376%9]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 21:14:51 +0000
Message-ID: <8622afaf-6448-8932-9971-6bfaaa8c311a@amd.com>
Date: Wed, 9 Feb 2022 16:14:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next] drm/amdkfd: Fix NULL but dereferenced coccicheck
 error
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, daniel@ffwll.ch
References: <20220209013940.71348-1-yang.lee@linux.alibaba.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220209013940.71348-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:208:120::26) To BL1PR12MB5112.namprd12.prod.outlook.com
 (2603:10b6:208:316::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85f00187-eecf-4ac2-c5df-08d9ec113602
X-MS-TrafficTypeDiagnostic: BL0PR12MB5556:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB5556EAA5822E521767DDF01E922E9@BL0PR12MB5556.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Ms3eVlcjpVuSFRLinBygWXbczu6vyGBYeCidoL2m7dsW2WuLw8gbKxJKaYjMvo3atjRUwsC6wYoyBS28p+Sx9THq4i+GjEbThzjOFLrv1DRH0Pdo4jLLSxoCjurYWlEyW4tIPa7ABcHmA0GBeteFTFECwUqqA50I+QxlI+khwJEmLr2zzxlJR8NygJSUKrKMlYcfVG2zkq+JR81hsFYPdo9g5MEl8ygtVY+WmHnP5WwvN6GGOYgysDsd/TsqlcvJkPP7NgDtThuUk+29S7TeGubS9njoXY9h2udtPjpSl0xYXwfLChKBK1bSYdsnoRe8BH8Z61c52rL7Thdl3ugT7em/WNeEXlsmPs4vC5WBCPaCM14jHJoTR6SLEi/rbrJcHX28mYoWnnFhL6vvHp2KRm4HDDCOq6Zq/5kSYx0c7G3FtJB1c/aMuVTbUbXmOS+V34WL2Lqc5XmDsEb1gYLN4gsrARIl+aem1ybWw3y6C5WOAMOiFmeKLv51Fb4kPqgRW9a+XGr62Z1sc8gZgtlRcRe9ZQDbnDQeVwS+7ZntXGl6rJW7IB0IphQhcTzxrvmw83RVwTtgTFNohbchGMh5e6WtNHTWBQhRI7smsoQty8eA4ds6MJnfp6VvG4hJrdexMPde21tpmSLNyeZ9IPDiyEqRSseKSNxcxnxGQtL4sUszWSpFmP1R3lCfLszm87HbB8HkiIOzUXnJfBVe5fVLKG6NWXdFsMjI/z+Ac5AnZ6c+yIr+jRdgjo3DxBPk0i2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5112.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(38100700002)(6506007)(83380400001)(36756003)(2616005)(186003)(86362001)(6512007)(44832011)(508600001)(31696002)(8676002)(4326008)(5660300002)(66476007)(6486002)(8936002)(66556008)(2906002)(36916002)(31686004)(53546011)(66946007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ri92MUZ0MGFHTXZET3dRSU1hNDEybUgyL3VUQmhyRGhwR3VoNGEwSU5WbEQ2?=
 =?utf-8?B?aW4zL3hTRFF2YjZDbDgxUVpKNmlyVms4bUFMcTdkMGVURVN4eThZaklTVTZN?=
 =?utf-8?B?di9tL25mRWZEVkZORmZqUXZTWkJNd3lVNzBDQVBDNkZ1allYRC9nTEZUSEtj?=
 =?utf-8?B?NElBcFI3d0phbnhRTEpOMktUR0NDcWU1NE02YjUyaldKWC9MRmlNQ3dwU1JL?=
 =?utf-8?B?TWorYmtWcmE3aVFmbXJRcE5wOU83dlNDTm9McWVFdG52OS9ETG1GYzhDYzBw?=
 =?utf-8?B?WTdyOU5jRDZGMU4vTWw0M3hlSS9SUjY2dWRRTDRsaGwvTWhlODBUZG5SZjRV?=
 =?utf-8?B?QVkweitDUnFWdHZONUxLQmxXTGl3UXlLK3NqZlYwNUJ2dGVDTlkzVFJGUk5t?=
 =?utf-8?B?Wk5nRnUwZmlzODJ1RFk1M0dERWY1eFJ6cU9IN0ZhVzRla0tZWDNDbUI0VmFi?=
 =?utf-8?B?OUdKVFpUemhodGtjL0JqR1cyclVDdkcvNDcwQWFUUWVNWTEwVDlUaGZTQzJp?=
 =?utf-8?B?NmJCb0kwazdKTHd1MnA4bnR5c2l4bmdLVzRWL0d0WXdRTm5xUDBPTlBnNk15?=
 =?utf-8?B?ZHREUEU2ekFaUUxWbUFtalNLZmRHMUlSc2VJUUNhOUxScjVmUnRJZTJBUkVH?=
 =?utf-8?B?UkhMd0xERXgyYTRmd2duYUNoZk1Ndko5T0E1emMwckdPN1hyQjR3N1R3dGtn?=
 =?utf-8?B?Y1I4NCttL3lHdXNEZDFFUDBjQjVKMTIxYXl3anljdllsVDZLaHV4Q1dlQWpF?=
 =?utf-8?B?NHA5aW41UFZtanFlM0NXbE4vbHFkK2FSZmpuQ1MzOEdaS2pmdGFybnBZa1hp?=
 =?utf-8?B?RUpRZi91cFNTOU5PQTdvQXh5RjVpYUk2bHQyamZoYVEwQWRvSDR0bFZZZHpm?=
 =?utf-8?B?NW8yRWVyb29GNFVsbDVBdDdTNXIwWlNjaTNDQXZEZkowbW00dUw3YVU1Wkda?=
 =?utf-8?B?TVF2WHFyazl2ejhXVzM5dlFuNGtMOXdkN05UV2pDUlA4UXJOWDVKSnlTbnl1?=
 =?utf-8?B?d3FIVWU1elhpNGozNU1hTG1IRXFoUDBiKzExYmdFYzRHdWFiS3pJL3YzUlh5?=
 =?utf-8?B?SVVyNHQxVVdmWUEwVC9MSVRxZDBMRDNNUnJ4aS9DSG1OMnRidWlQTWZOZUJ2?=
 =?utf-8?B?Z1paV0NTVUZmUHJZM3dJVk0rVzNVR2NBZWlSR3o3UHZ5b2V6Y0tkZTJySGdi?=
 =?utf-8?B?VCtScDhJQ1NHSlRyc0FoT2FEczUybmlLdzVFU2R3N1VZSzdxR0grc2h5NFho?=
 =?utf-8?B?emEyZ1NEZjNVYllhSkVhQnZYSFdYK2ErVTJlYjMzWmtCWWkwZ2Y0bFgxRG12?=
 =?utf-8?B?ei9iRFJKWmlSNXNseUZxclB3elB4ckVTR2hPdXc5aHBqSXRIQkJGNDkrLzFL?=
 =?utf-8?B?RS8xTzJQcjNCV09aMFVjTW5lcmt5MEFWMlpmOGkxZDRabWF6UmwxUVZsRjIw?=
 =?utf-8?B?Q0gzU3BtS28xNEFjMnE2eXRVTEd3MFJBQ2lmYU9TNzRTRG5TaUk4U0RpdHpt?=
 =?utf-8?B?RC9OdGhGWmdoWGpoQU1SNnppcVQ4MC9YYkF4Ymt6Y0FaNU5lZnhCMkhGTDQ1?=
 =?utf-8?B?UXlMcDFoUW02WnJkRjAzZ3Z1cXd0QWh0ZnFLTmtRNWJtd0xjZzBhQ2piSVpl?=
 =?utf-8?B?ZHN1Qmk5TGxQNHlsdWQ4c01kNDhMS01iTW0vOXlTVDdSUGFhTEhGNnFzVjZG?=
 =?utf-8?B?WDJ2VjVEeWhuTXUvQ1k0bDJML1YxRFU1UGd2K2lRNnYvSEpKODBpWlkxVFda?=
 =?utf-8?B?VW0zczBqenRmdG1pd0Nrb003S1BjWlFoVDY3ZnNLTk9zZGpwUHloVmNTSEhW?=
 =?utf-8?B?Wkx0OUtQMTdjNWZ5VzVNQS9JeGVydzRJT1hEUXZOWlVxbGt6VjkxcTRsamM3?=
 =?utf-8?B?MlZ3d0IweG9QK2ZtTkdoeWpkcitCVFhBZE1QdVY4aXRuVldiWDlBdDdpRWVG?=
 =?utf-8?B?aU9UeHkyOHVjdkJuSzRPSkE4cUpqckR5dUtyOEFYQU5remtTanpSOXN0S0FK?=
 =?utf-8?B?T1JkWEdUQld2YmJJSnNXTDJtUkU2NnBIK3VuZlU4bG96ZDFINTlGL21jdFZn?=
 =?utf-8?B?L3dnYWJIanR4Z29PcUpDZVB2UXlNUG1BejRscjJVanNLL1hZVUtORHVTK0Fj?=
 =?utf-8?B?R2QvcmM5V1VGdHZZempCU1UrS2lkZzVHZW91dUNmUml0OFlhK29IOGFRRDhj?=
 =?utf-8?Q?+HKdNBm4JjsOuM2tYHEECEw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f00187-eecf-4ac2-c5df-08d9ec113602
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 21:14:51.6104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PN3+RtGmspX+/fx4zvG/tl4AXmA4cmSImq0QfQA+iTnkNAeaCec0RCLvN7XSFJsxZeztUQNkUeK21/IkpRn86A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5556
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-02-08 20:39, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./drivers/gpu/drm/amd/amdkfd/kfd_chardev.c:2087:27-38: ERROR: bo_buckets
> is NULL but dereferenced.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Thank you. I already picket up Tom Rix's patch for the same issue.

Regards,
   Felix


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 64e3b4e3a712..636391c61caf 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1982,10 +1982,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
>   	void *mem;
>   
>   	bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
> -	if (!bo_buckets) {
> -		ret = -ENOMEM;
> -		goto exit;
> -	}
> +	if (!bo_buckets)
> +		return -ENOMEM;
>   
>   	bo_privs = kvzalloc(num_bos * sizeof(*bo_privs), GFP_KERNEL);
>   	if (!bo_privs) {
