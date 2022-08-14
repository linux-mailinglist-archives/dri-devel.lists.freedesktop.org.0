Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15BA591E9E
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 08:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80412C9A35;
	Sun, 14 Aug 2022 06:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1624C99E4
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 06:00:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1Q/aKZWONbKmtqPzeirq3QEeErlMWyRzJptwm7VNp6iw3mke7g5QJnLLvJ6QpJiq4xM15qmVvNWQpOn3fOyeHiQyMIAEn2/5lwkhIPQkRramhxJlEeDaXtCGQywesCq7qktRD4kolRLuzLUE/wOJBZK/CmxysL0GBCelCXh0CXl0MUrih6XthG04OfgX0V+oRHT+7cZfMDVB0SNn+9drEG71ndGAoN2SUciawheIKrHu3xowXRkVH+p1snE6Zr4/tmlGw7jewHSJYIo+shGNEMfDwpL3lCzbuiO9sy5KSE1g29GtsmWEvNn2grvPDS7vjZuWju69pMqN0FJ3a+q4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNy+VNlWVYgvlUm6Ic6OyCDSKIQoLVKHbkx2S7ym8As=;
 b=K7F6Gt8oeCNS0ygNPJQrrFhZYKwh6DE9+F+Er8ewuNvgT5VIGQa2y0JYVOnFeHYQ60Drs8y8zLOcjP6O62/0YLbdPIv3aXdgElg6DsfyfOyEuf251HDKkJDYaCaJLReOQGFtXXSbniQd2VsQgM429eI784Giob8T9u2ewlLEsBV0fsJYkPbm58UfoVXQl4bD4yb1AdfrmKRyuytvF7Q6crB/q+KjI9TiJzHHXG7C+OfXDugCcf116aiwbRzLZiSM6pwbubvu4Z1akTd4AW/jj+2uhukV0BaEeYf/PSsc3GcfRAUPLyY+/QRWQ/cMM0sIzkD3uHOKZXyF0LzDLTZcHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNy+VNlWVYgvlUm6Ic6OyCDSKIQoLVKHbkx2S7ym8As=;
 b=5OjM9V3CGiGZvayV6gcneUXKNw7lOHsy4DPfpLTxdtq5vlM70S6eFUl1TvLRee56fvpNeYLirxOeM1XMnJPQOhUdVTUpLXVG5bR/XmYNgx1yDRMN6hb3H8YjY/w+iAetHCq65zrY0I5jPO0UdJukfnHtfPQfxcZdsqaVGKAFmFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MW4PR12MB7031.namprd12.prod.outlook.com (2603:10b6:303:1ef::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Sun, 14 Aug
 2022 06:00:35 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14%9]) with mapi id 15.20.5504.027; Sun, 14 Aug 2022
 06:00:34 +0000
Message-ID: <9433a0ee-ef19-86d4-e4fd-8ccff53ff5a7@amd.com>
Date: Sun, 14 Aug 2022 11:30:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [bug report] drm/ttm: Fix dummy res NULL ptr deref bug
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YvTSD44z0csJ8YsP@kili>
 <28f5d71e-34ca-214a-f8a8-14e227bb42cf@amd.com> <20220811115636.GV3460@kadam>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20220811115636.GV3460@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::17) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e3b39f4-fc28-462a-da45-08da7dba4d44
X-MS-TrafficTypeDiagnostic: MW4PR12MB7031:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k6F7sYBSOGt+7BP33Surp16IvW2W85CKmplomFdQWLcqAM1USqCASBwodS4ZediAr2YPFViA1AjSuq7R+1Po2k7orySoeo+gZFX3h22dekUVBLrGur+eC1/t923xof3f7FtwTHPWc6rUSoeJvJlA6wBdT4KFklMjcMj/MiUzcF3qg/D0XRANhQqdId5FHS38jgFD/mjnbm/9sVByPX2BVamcl+A6PLwh+zlOGPDfl81yJ3u0NfNL9iLSGRYapCL9yTs65zdE2mJiAmcpyG5KntJqLwKw6ZdtEGULYl7Sc5IVsg2D0VwZ4bZ3Qe/zW3e9Jyb6huTh9lVTDA+OOUajYQeVMiRIaszEW1Z2sVUjTwiOCOOEViiG6P1QCmd/x9eJomDPRbkY0/5aOGYmu/PVaspxTXk/Ddjirr5VpG2AcUhtMFdMtoR9GwL/POv27H23B2OIV1jAzp9J/9Ooy/oF/Bh6BeaaleLQoK5MVQnwkwpBVLuSIEbJ8b2SeRxWPw1z3T7Z1uurgAbkifY4fCaOvEWbcWhuBg9MewXhTSXU8MaNCv/91D2xUV4L/nsZFGd36w6HPkj0YlkUBvwwjZC2l3jy28m285BIb28rfiOEKeGtjHnQnJfG1I3jc5SFD19AsVye4vg+CzTp8Sw1H27hiUGkXZZ3OXXAQ9vY8G4ZPGiMQ6YLY61sDifRH9bQdlXBSmS2ASrS8iCXpoapPKtof96ai8ODoduxivS+3xp0inZro4RmPMDgn2ZJ2n5bZucp7gZh0JSyBHVToaWV6Cr9ZSXuV+NkAYhzU7ke+SZ4tS4nktvcUeVKaoVPksRoAqIc9zIizdi67AlH6Uqzb5wawA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(5660300002)(6916009)(6666004)(6506007)(53546011)(86362001)(31696002)(41300700001)(6512007)(8936002)(26005)(66946007)(478600001)(6486002)(66476007)(8676002)(316002)(66556008)(2906002)(36756003)(4326008)(186003)(83380400001)(31686004)(38100700002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WThobm5hdFArNW5kTGdaR0JSNzBjMkVYcXNDOTN4bnJRaWxZeWJwKzVmVFVB?=
 =?utf-8?B?cnFkSnhiOGRTOEE0Q3lUUGdvVDJMYjBqS08vUElPa3NEWk1PelBtOS9uWlFx?=
 =?utf-8?B?czdCTng3NE01NTBPYXdkQmt2SjN6R2lUcW5VKzl5OUpwZ0xtcCt5eWRsai9o?=
 =?utf-8?B?YklZb2wwcDRzYk5IeFVZTE5qZkZJWFQrMWpHU05lNnA4RnUvUzB5VHBvTmYr?=
 =?utf-8?B?dkhCbnlEeVp2aVdydzhZeHhKVXR3WDQ5SjhaZnA0WVpGZVFZL2ZhenNicjhn?=
 =?utf-8?B?bzVLeExpUExINzkwQXRuOFpOVThpbDE5VGlBU2NlZ1o3VnNUSFpDVERvSkhq?=
 =?utf-8?B?cnd0M1NhUzlkZllQWCtoRFluaUJtZ2RUSi9TWWZVUmlpdnE4TU1Qa0xNWmJj?=
 =?utf-8?B?Q2loYnlVa21jR0dtZ0Nwb3N6T3BwV1ZzVnVaOGhFR2lmdUFwR2Z3cGFZakl6?=
 =?utf-8?B?MWpIQzV4N2IvYTZlbUFqTFdkSEVxZ0VuWDF5UVU4RmZ4NUkzVk9DbUExV21V?=
 =?utf-8?B?VW1DV2tnRGdGblB2K3NCeUZsSHY4anZHQ0dpTWxlbjJCYW1vRStnTlZLR0Y1?=
 =?utf-8?B?UWJGeGFBb0xwMUlaRUJpR3BZS1ovN0FaK3FES1hqcEdjbFI4L1dLeHZZck1O?=
 =?utf-8?B?OEJSeVR1b2pRZDc3dDNEV0lDcVd2LzljS3pMM0lmREtQWDNjS0ovS29mWjdQ?=
 =?utf-8?B?UXliL2o2bVdUSU4yL3MvUHpWZUEzWTZPTm1wbEhXZmFZRE9LWkVFbTdTTHdl?=
 =?utf-8?B?NGxneFR2aDVidlRuc2hnWEtpSzMrWEtmNnhoUUtFTW1mTVhEUjllcHhZUUIw?=
 =?utf-8?B?b0JRSUlFbzFUSEQrbm92L2cvZE54UVV1eEpRdjlJMzFrQ2oxTUJDaHhTcXVL?=
 =?utf-8?B?aGFmeFEvNVlxSFhXemY5cXYyMGs1ZFVRSjZGTWh0ckc5Z3JoT3g5M3k3RzYw?=
 =?utf-8?B?R3FiTmJtOTlXZ1NqODA1Szg2eW5zS2UxUlc3aDQwMDBzYUxFQXZjQVp6bkRT?=
 =?utf-8?B?R0ZldmNZRWFSWmZXa0JjK0FwWlgyS0M4cFBTMU0vc1dBSW9WZnBKVGxPN2RC?=
 =?utf-8?B?RVRzTHEreG1tV0VGK2c3aWJmam16NlhFaFc3Z0FTamp0eHZ3QmgvU2lsblFw?=
 =?utf-8?B?ZHJRanpXWVFHdUJmbEYwMG1VNDJzSWpxQ0hQY2hRelpndGY2U0xpRzlGY1ho?=
 =?utf-8?B?MlFORzYwckxVK2JBMWhueDZGQUxSVWJycFVGSVNRN1J6MG4zWmxLUFZaaElx?=
 =?utf-8?B?LzZ5Z21xdmVXTW84VUxsOCsrRnVkU2F0MFVLWWFjVnViU0JNVGRRQW9Fb3hC?=
 =?utf-8?B?YXlpTzBZd05ITlVwdFBjRHZGZklNQzVNQXo4S1lVRFkzV2U0di9QTTVBQlJm?=
 =?utf-8?B?c2lCRGRVeG9wNVkwdGpzRHpkN2JZNVNpNXRnYkJyNTBBY2FzQytYRU1qRVdP?=
 =?utf-8?B?aXlOZjlDd2lzckM2dVMxRkExOXVoQkhtWkpzQ1V3RDYxMkNydXRGY095cytn?=
 =?utf-8?B?SWQ2emJnME02ekMrbFBYT1VzZTVnZmhBcE42a0diQ1JFZVNIUG0yNVArR0ZX?=
 =?utf-8?B?b2FzZkpNNzFBNkI1c3JQekw1aFMvZlFaM1ZsZUhiNTVNdVNHS1grNlRqcm93?=
 =?utf-8?B?d0gwQVdwdFNTTkhMRzBVQWtENnRqYVFnTXJWNjFjZWpieGdwbHY5NzNCeERr?=
 =?utf-8?B?MHBEVThUU3B4anBVejkyQ1YrT0Fjd0swMGVnbFh4eUN2OUV0SFNkUWt4RC96?=
 =?utf-8?B?UnhZZ3JlQnVqbG51YXZBcGlxaFBtMTJEM3pNajVNenhDZ2wzYXRKcWRDaHJP?=
 =?utf-8?B?SG1OQjgwRGI4ZENaZnRxRnJ1K2NHc01ubWxpRzE3SFhUV1hOMFZCSHhHMlpT?=
 =?utf-8?B?bzI1cEZBTHpVTHphbE1oQ2tTNzlXd2pvaWJkWmxpZlR4T2txMW5tVjArTXRS?=
 =?utf-8?B?YkU4VU5leUhLMFRlaWpnZFBMelIvMXJncEJuN3RBbW9OU1J4N2hQYU45emxF?=
 =?utf-8?B?UzhCS29zaEtFRWNnRVl4VnF5bkh6SmFvSmMzdDQ3eUwyRjcrRlROQisvbWlH?=
 =?utf-8?B?S3RDNm1KbFUxbGhRc0tBZFpSRWdFQmc4cnJXalExWk1ZQi9LOENzN3lzTzFl?=
 =?utf-8?Q?P4bOuDIo+L1DdLNEg7ysWQZMa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3b39f4-fc28-462a-da45-08da7dba4d44
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2022 06:00:34.3217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrTG0F5JBs36gPXWUjb6BnrnkMVRiH50amcBL+sZl3KVs5YIv6NHY3jlu3yI5YflKf6v9vlm60NKFszZLCtqvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7031
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

On 8/11/2022 5:26 PM, Dan Carpenter wrote:
> On Thu, Aug 11, 2022 at 04:36:33PM +0530, Arunpravin Paneer Selvam wrote:
>> Hi Dan,
>>
>> drm-misc-fixes doesn't have the updated ttm_bo.c file, we have the updated
>> ttm_bo.c version in
>> drm-misc-next branch. Please find below for the line number 907.
>>
>> On 8/11/2022 3:25 PM, Dan Carpenter wrote:
>>> Hello Arunpravin Paneer Selvam,
>>>
>>> This is a semi-automatic email about new static checker warnings.
>>>
>>> The patch cf4b7387c0a8: "drm/ttm: Fix dummy res NULL ptr deref bug"
>>> from Aug 9, 2022, leads to the following Smatch complaint:
>>>
>>>       drivers/gpu/drm/ttm/ttm_bo.c:915 ttm_bo_validate()
>>>       warn: variable dereferenced before check 'bo->resource' (see line 907)
>>>
>>> drivers/gpu/drm/ttm/ttm_bo.c
>>>      906		 */
>>>      907		if (!ttm_resource_compat(bo->resource, placement)) {
>>>                                            ^^^^^^^^^^^^
>>> Unchecked dereference here inside the function.
>> |if (!bo->resource || !ttm_resource_compat(bo->resource, placement)) { we
>> have this version in drm-misc-next Regards, Arun |
>>
> Huh...  That's very interesting.  It appears there was a bug in
> drm-misc-next, we applied the fix to the wrong tree, and now both trees
> are wrong.  The drm-misc-next tree still has the bug and the other tree
> has a static checker warning about nonsensical NULL checks.
>
> Eventually drm-misc-next will get merged and everything will work.  Is
> it too late to remove the bogus "CC: stable@vger.kernel.org"?
I will look into this problem.
> This could have been avoided if the NULL dereference fix had a Fixes tag.
I should have added the below tag
Fixes: 347987a2cf0d ("drm/ttm: rename and cleanup ttm_bo_init")

I will check on this.

Thanks,
Arun
>
> regards,
> dan carpenter
>

