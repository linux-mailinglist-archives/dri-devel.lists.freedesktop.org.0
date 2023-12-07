Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E81480899E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 14:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A5F10E8AF;
	Thu,  7 Dec 2023 13:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008BD10E8A4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 13:55:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbz1qijp2gNY2rvZeo8AiEiaRD66ff8DXUQkPxPk13Rg+RG5QDjzXn/FRV07qvSovU4gSedDFfKsGhpRmtgxvfVjI//RkZeiiM0BNhANquCgisFJ+59eCCzvK7Ms9lMKYQ5uk+DeKuZbJ0Qynx0uZXNvN+GY+Zzr9fb3O9SO/r0SvB+JvWcco01WUyydACi7m55ysSQeDMbe9DJwV/bsDAXCvWpXfWm8dvJ9vVwXM26A/rL7wT9aIvYczNUopzOkOs9LI2c5hixU6Ed1ybg22pj3oZxIqQ2dPoQXLYcngcyGFSkr6z3D2SBIgOXprYBBA0Tq9bxyvykJ/xR8jDY9tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5yrApzTgQl78j+pJAmJmjA/TuybReY1vQpuok36u5M=;
 b=LluMFhNKGzgroeb+CJZYPiz1IQD7WH3lxMijTXdWWlmlLuG0ORTb7vUBnUZnuFgbdk+fpBvxkZBmRTxfx8X1MMx3G1wlTORD8p99PbPQvQRpGI588vslCcp4z3Yfjt5CkC5MgRlOYGWP4a2TXcv5fxrSOfvUxjAJSb0fMv0ZpClUaHZu8boVNsVoxjLZOqElM1vW3ArsOxGeeYvxZgSju3kGBFHESK6wC1oHOZnvZGPYfOH3wK2NPfjEc2iS6S+ODvTKgQAcY5gKvd0ipoKEEQcME6CZ6bUtUrKi72dPVYtFcXMEI8HkU2THTj0Kz9YxV6oEU2/qzfThW6W/QncBJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5yrApzTgQl78j+pJAmJmjA/TuybReY1vQpuok36u5M=;
 b=ZJXRMJoaYOElGWixqhCgqX2jhWI+QUG01YRXO3GkqGekmOCNEaWVRFA8nIR7uhqpfSrwuhfx2IMO69PWF41HRa/c7EAHTb+5QS785xR0lugt83elvCpJHbBb1IYHvHyFZBHEzDcT8axP+zYAjKua7++q6f1vqQ2c5yqCX03K7BQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4893.namprd12.prod.outlook.com (2603:10b6:5:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 13:55:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 13:55:37 +0000
Message-ID: <db412bd5-cc75-4d27-b0b2-b01a9de48be3@amd.com>
Date: Thu, 7 Dec 2023 14:55:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Fix FD ownership check in drm_master_check_perm()
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lingkai Dong
 <Lingkai.Dong@arm.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: <PA6PR08MB107665920BE9A96658CDA04CE8884A@PA6PR08MB10766.eurprd08.prod.outlook.com>
 <CACRpkdbPoDGrxCsuwmz-ep7V38Gi5P74jkfMBX+XJMPXFb=SJg@mail.gmail.com>
 <bed6544c-9434-42df-ba4c-a32022823b24@amd.com>
 <c3eba2be-2498-4271-b1e5-305432600bc4@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c3eba2be-2498-4271-b1e5-305432600bc4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4893:EE_
X-MS-Office365-Filtering-Correlation-Id: 6110a82c-e60c-4748-5ee9-08dbf72c3070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D6YdzsMMrhTn2/6nsQtcRX0HWi1d9QYiJJVxGgvar7xpVkVe9yutD9Oq8tO7ioolrBOCIasnKwcWm/NGRXdNRe05QIsB6Uj5W8fuSA9BVpmPTjvQsDbQWac288Gz+vUICIsR6wYIGsCBPX7TBWzxZLYCIarhzX75YFTsKoYM495M3AoJ2Byxdle4x0u7Fx7Z0y0/j4S3K0Fx00J7ueRF3qpAM/jD1BudWzL3wjAA/NVXXkTOz4iOWyyaj1Wzp/UN987WGoaRxQnrQX4tRbnPxoPb+CwpxVUhTPkZNi4jOz63XTZHMt77LyY131Gfv2cRQyWOYK4t9zqUs+tGcBL9XB2bLw7uyBQ4XFb1baXiSwswXiWtqCKc1dlx2OY9pzi8tPF3WUohi7OTr4HKlfPsGO0T4qG65RuTdFsOmd1B48MtlYCkPS0yX3l7j2NDPryqa3E1RJzF7aKwf+LNL2+0kLhK4ydoIPRsXjQcxqPvL+qG51mOorZ1xTybBntor7vafZWZfdpLZAAFd+i55qWdTXoAUHCLfEYo79k1h2U4VcRJdG3Itu3nVMAmGlvAqT35NupqEQNNmimOQAVSMeX40AkQZgIsE0vEnvB6y0WZOYnQnLJjXdk1Nf5unDbVccRoJ3c8pCVDCEVHMTPCg1XROQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(366004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(4326008)(8936002)(8676002)(5660300002)(31686004)(316002)(966005)(31696002)(66556008)(66476007)(110136005)(38100700002)(54906003)(66946007)(86362001)(6486002)(478600001)(45080400002)(36756003)(41300700001)(6512007)(53546011)(6666004)(6506007)(26005)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmkyNmpOR2I3cllkUmVIMXJRdlVSdjhXVTFEMCtwTml4cTJZUE9tNDRlZm9m?=
 =?utf-8?B?dmRZakZOYTdhM3VnL1h5Qk1DZGJQSTBwVSt5ZytIOU5HQWFTTWlGQ0FFRnZC?=
 =?utf-8?B?UFVLN0EzeU9Lb1k1MTU5aCtLVm9LSlJ5N0NSSWJzakNtNXFWRjEweWtOVEQ5?=
 =?utf-8?B?NGFmdjBZcDAyRDM1OUIrekVMYmVhYWh5WTlVQ0dWSnd2NWZnaElXSDdVOVgx?=
 =?utf-8?B?YlQ5eFYrdnQza3cwTzVtVXhKa0R0TFdLazgzdkpwd2hzT2JjY01LKzczQ3E2?=
 =?utf-8?B?ZFFzYkVtNTRXcllJMmRtU3U3RmRKTzhRV3Q3K1Q2ejhlZkZhUUFjSzZJMld3?=
 =?utf-8?B?eXN5eGczN3B3TENTVnExMHBocFQwblMvUmxwNlpPZTQxa2Yrc3hpaE93NlFa?=
 =?utf-8?B?bFVGTWl1aE9QUHcxd1M0Mk5KSFdzYys3aGQyVkZ6ZjJRVWkyVTRUMWlKUEJP?=
 =?utf-8?B?N1NmbHZuRVBta29tckpSUERjRGVPWDBvTW5oWFNJWGVETjhvdXBMSTR2Zkd6?=
 =?utf-8?B?QkhwRG1YQ2l5M0NibkVBbU5JQ25Ycnp5Yll3dzRhUSsrSHdTY1J2OG9hQTJs?=
 =?utf-8?B?SEJSVlNCdVM3UU4xTDB2OHhmMytSZ0JpQ3E2VGhTY3BZVHd4NnBhcld4UDU0?=
 =?utf-8?B?cXZBUUpSWE5iUXhPbGZUMnlBY2NibDltSXpPSnczaUFiM01HN2I2VjJjYjR6?=
 =?utf-8?B?TjZZNHJZRnNsM3hpczduR3lEQWx5eWswUW85M0VzeUdBTHJXWDBvZnZYek53?=
 =?utf-8?B?RGNLOFM3M2NZWER1eVgwdDZ3REU1cmJTazRsa2xZRkpYTGw0Z1FUcVFLUmlU?=
 =?utf-8?B?cjNQc0g1MFJuWXR4UWdwOWl6ci9ETk1HQ3ZDTitBTUwxVWxvdUV1aEp4SHMx?=
 =?utf-8?B?UEZLNXlpeXB3LzNQaHgrNFBEMjRJd0owQjZLbmVrV1RNU0duc3ArbjdkWDdV?=
 =?utf-8?B?Rko5ZTdrUlppQisrUWxRNFBDZGwyZFBqNnd4bkxTVE52WHFlTjdSQ3BtMEZt?=
 =?utf-8?B?eFQ2dXFWWlZJeTRHTnRjdEN0aTRlZnVCRkVEY0Z4aXBsV3B5dTQzNDNsVVpv?=
 =?utf-8?B?VC9MVDJ2b3BOQWMrV1pvclJST2w2T0NrSHR6VXR3WHgyMjRrZy8wZ1MwdUJq?=
 =?utf-8?B?Z1NOTWplck5yVFBITFB0U3h1WXBTNFdlMzFaZmVIaGtCckdCYmdIZlVhWVFH?=
 =?utf-8?B?V1VIbi9sMU5FNU5hR1Y3ZlNIK0hzVWUzZnhGMTVuR3NYWm0vNGp6Q2YrcWJV?=
 =?utf-8?B?Uk5lM25tTzNKaVdiUU5HcHUyR1YwbW15YTRhQ3B5bTNqeWlmVzZYcFF2ZXlI?=
 =?utf-8?B?N29ndlREdFNtSnROVExzeDF6dSttblQ5T1pnVDR6R2JJWGoyZEhDSDdzMDVm?=
 =?utf-8?B?QWtQQm5uZFphd1V6bXZVS0RINWptOGFZNFV2NW1TNmNFK2ZzTk9EV0dSbXBz?=
 =?utf-8?B?RExiNXpRWE9GbXNtdy9wcTViU2VZbmlyamVWdU9RV0U0MG1Ib3hJSDRic1pk?=
 =?utf-8?B?Q1h1dk82cUZQOW9FamQyVGV3VzVnQ1pMZG9yOWFiMEI0Z3lXaUFyVTNjc0I2?=
 =?utf-8?B?ejY3dTJYZnhyS1FGOEc5TFMvS3JjS2prOFdJSzZmQUo4N0RqTVdqbVVFL2hx?=
 =?utf-8?B?dnNLZ3gxZXVuU2NXUDNoSUl1ZnQvWlN6WFNjV1RWT3BxaCt4QzdPQ1AycVNN?=
 =?utf-8?B?dGl3TjVmOERWcWFLYUI1cUNaWFJzRDhYaGczcEpyNEVWNlR5dk1TUm9aS0Fp?=
 =?utf-8?B?Wlc5cVRmZVlzcU1jWHBSenYrbG9aUVZMVUdJbVhNKzd2SHkzWlNjaWU4ZmRw?=
 =?utf-8?B?cS82R0VKN0JRSVJ3WVpkWVpncUNpL2RTTnJKVHd2RU9CL1hWTzNCSXlEelpF?=
 =?utf-8?B?NGJ2SDBJTmJxQTNXeDk4S0JJY0FKTFp5cE5PUFZGd3Irb0UvUW1lbGdYK3FQ?=
 =?utf-8?B?ZjQwRjBPOVR3TnZwS3dveWwzTGNXN05wcFpTLzYwbUlSNWd4ZUpKRmM0aWYr?=
 =?utf-8?B?MytibEZYb3FaV1RsMUFFMzZVRXU5bGY3OUVvcWs5eW44RXNDNnJBTUZUOEoz?=
 =?utf-8?B?V1dPR3U0M1JtQ3p3RzMyOXRqUlZXZjJESmluMlU0Q1ZJODhPN0IzSlNQVnFo?=
 =?utf-8?Q?pcz4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6110a82c-e60c-4748-5ee9-08dbf72c3070
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 13:55:36.9820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5udEOlqxcpt+hxwfjDqI8Wn+yWcDJT6d8fG/H4RK8nzryHLqegN1EiFf4zZ+A8L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4893
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
Cc: nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.12.23 um 11:22 schrieb Tvrtko Ursulin:
>
>
> On 07/12/2023 10:18, Christian König wrote:
>> Am 07.12.23 um 11:12 schrieb Linus Walleij:
>>> On Wed, Dec 6, 2023 at 2:52 PM Lingkai Dong <Lingkai.Dong@arm.com> 
>>> wrote:
>>>
>>>> The DRM subsystem keeps a record of the owner of a DRM device file
>>>> descriptor using thread group ID (TGID) instead of process ID 
>>>> (PID), to
>>>> ensures all threads within the same userspace process are 
>>>> considered the
>>>> owner. However, the DRM master ownership check compares the current
>>>> thread's PID against the record, so the thread is incorrectly 
>>>> considered to
>>>> be not the FD owner if the PID is not equal to the TGID. This 
>>>> causes DRM
>>>> ioctls to be denied master privileges, even if the same thread that 
>>>> opened
>>>> the FD performs an ioctl. Fix this by checking TGID.
>>>>
>>>> Fixes: 4230cea89cafb ("drm: Track clients by tgid and not tid")
>>>> Signed-off-by: Lingkai Dong <lingkai.dong@arm.com>
>>> Paging the patch author (Tvrko) and committer (Christian).
>>> Here is the patch if you don't have it in your mailbox:
>>> https://lore.kernel.org/dri-devel/PA6PR08MB107665920BE9A96658CDA04CE8884A@PA6PR08MB10766.eurprd08.prod.outlook.com/ 
>>>
>>>
>>> I'm seeing this as well (on Android).
>>>
>>> Tvrko, Christian: can you look at this?
>>
>> Good catch, looks like we missed this occasion while switching from 
>> PID to TGID.
>
> Oops, yes..
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
>>> Will you apply it to the AMD tree for fixes if it looks OK
>>> or does it go elsewhere?
>>
>> I can push this to drm-misc-fixes as long as nobody objects in the 
>> next hour or so.
>>
>> CC: stable? If yes which versions?
>
> Cc: <stable@vger.kernel.org> # v6.4+

And pushed to drm-misc-fixes.

Thanks,
Christian.

>
> Regards,
>
> Tvrtko

