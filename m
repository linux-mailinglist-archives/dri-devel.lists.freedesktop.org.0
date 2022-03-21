Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D784E2059
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 06:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA3010E31E;
	Mon, 21 Mar 2022 05:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EA110E31E;
 Mon, 21 Mar 2022 05:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUWd10GvZox6Uel3dV+0s8wvLy2BRoNckC4OP0PKLbFnI8c1xYaggkKxGhwCroDEr+KTCGKOlMY/2yNN4s0VUNZHzTvjhfBZ7JMVhq8zQTKJNV0M0qLVyQqUtkjfb/ebQw/vM1dSEK+vSGI9SMqARlTonYdJZ5Lwvi3AbWhBMwIlfK2A2VbApyQOM75q8TkWbYxGbhyKoLjnfuB0n8wQQna6UMy9kuzQygl1PIidvc2mIVwgmUlCNgxnW15PqJgpcdUxPGfh/6bzK/KYJ5UpM/YVB5xUHdZkSxrQUv5afZq7krq0SfPycCzTYSXkxdb6+MCIQOMcCDq+PnXsrgFZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K90TGIxroQVz25jVuYSuBe8y8jev52c4ESKkfHXwpd8=;
 b=YdVZsocdLroTIR0RQqwYazqIZe6EfqgCE0CXYZFEKnO4T/1ElIhQpF+DEfjfakjK/+jWuBKMpX0ClX4WeV9ffGjgA9/eWjWucneulLpHnsW7g/mi/Wjh8olIYnGDSK3hSfdoj4zPXopTbAzLTLk6DxLWLsU26iWW+ml3U5Ejy2wJYtBVDYaYuHML8H54zMdQEnbK/l3koXl7lvdaocC0kq5/Dks+YnFRiSt6yl0pJHQ1F+NxIzQSAlysahPYVBcUespygU8rc9uRFpgY9Lh+t0PoisJt4lqgXa6lMbRQG2XH5eBRUyVQWQASd76orcXH0WfD0ZujAAxcMVIB/xkt/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K90TGIxroQVz25jVuYSuBe8y8jev52c4ESKkfHXwpd8=;
 b=R5Tv3JOgT+OvxP3Veq27xqKykgyCZAud+GQ+uNzfMC5fhmRubUjlcYugYcmyT35cW19rmQCIvBTm4AQ00Qcqc1Ru3taGOlgyveVzGNIsZ0E/11Kzn2er8DBnN9eKRS2MhxI7cjlapanTMtGEeXv96ejC+rLHfFYFdGseH4wXb14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21)
 by SA0PR12MB4574.namprd12.prod.outlook.com (2603:10b6:806:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 05:58:40 +0000
Received: from SA0PR12MB4349.namprd12.prod.outlook.com
 ([fe80::e15c:41ca:1c76:2ef]) by SA0PR12MB4349.namprd12.prod.outlook.com
 ([fe80::e15c:41ca:1c76:2ef%3]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 05:58:40 +0000
Message-ID: <05d35051-cc48-5a5c-f678-7c7e2003a712@amd.com>
Date: Mon, 21 Mar 2022 11:39:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] drm: Fix a infinite loop condition when order becomes 0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220316063416.3051-1-Arunpravin.PaneerSelvam@amd.com>
 <7545037d-a60e-7935-67c7-f25a1b00b501@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <7545037d-a60e-7935-67c7-f25a1b00b501@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::33) To SA0PR12MB4349.namprd12.prod.outlook.com
 (2603:10b6:806:98::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1243d8a7-2e13-4c16-58c2-08da0affd8d7
X-MS-TrafficTypeDiagnostic: SA0PR12MB4574:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB45741D304CFCE24AAE30184AE4169@SA0PR12MB4574.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kI1pqVpERd3z0xSfG7Ski6DsqEqQmMLRdn7dh3UBy7+i3LNpBLNw1ESu26ty0oTqhvF3Ch10Q1ucDCJRn+fczz2fZ+9KQBiP2n14k9R48FZqDzit7+yHSaZgc11bbpBHhk8euyQrOK9XJuoanZ5wbI2wuJqL1+nunPs8q4BfdIS6ThaktB2iQTDpNxU4ItqH8wjPV8rQQ8+x/8u03POItfc8CsxHi8UqCVOUJUnsopLUhU+IAabph/wjvoZiRuNjcNYX8Us8z+UONMy0pnfDNPPQvIktvrAyqjTnTBpEM2lv8JplzNobIjpwM0aw6TQhzVa3ogxCp6X2lzVcqJS7tBDjtvbWLr80F6feTD/2HCKFc0OMqFgBNDVkUQDvDoBXyNS18L0MWqonHS+poTgVFGk9caCER2+WZ02LHUZA2W+XbWUGNFtI5CBD1isys7xx1zwzbjwkPVWriZx47lfKZi8lUYyvpC39WHSykucfcA3se1ACMOaA+lcNIIazOu0cBR/8jWs5dSViieX5zDJn9+En+NBbOlXjLJvsMhTGgmh3f5GgT6w7miE6rJefsIHMeb49qRPYvwhUbEYJze8ns4o9nvhZvpdbcAZOWrdozMRFXRtdwITxzQtwFOIqq27J8U7DXY3x5JK1sEBxzDtdkF18mYEjrM6RMN3PogCKmTHnhu0BtF+BU6ae+/su9DAg+G8Her9iw2X3kI5mlKrCxhGyRlAA+P1b1j17bydC2Xs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(83380400001)(966005)(6486002)(6512007)(53546011)(2616005)(45080400002)(26005)(66946007)(66556008)(66476007)(8676002)(4326008)(31686004)(186003)(86362001)(38100700002)(8936002)(36756003)(6506007)(5660300002)(6666004)(316002)(2906002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1FLVXh5TnBDQVlRNXFsekdna2trMjNLL1dtaEpZK3l0OGZxck11MElQMzNU?=
 =?utf-8?B?R20yMVZoK3dTdDI2Q1lFaExRNzZZR0lYcjlTaTlkMzFoc2phdktRenc1NDNa?=
 =?utf-8?B?c0lEQUpMYmlTM3E0ckFxWFBRZWYvd3dnZjlqZnBLM2IvdlRPb3l3YVpvWWJS?=
 =?utf-8?B?TUtyUy9sOE1kbTZQNjN0VWR0YVBZemtSb0VzN3NUc3krVktSSzVMdWNvckRY?=
 =?utf-8?B?T3VyYzFxZytBWkJkTFRnRWhqN20yOG5PMHB1UDhGRWZCVFlDVVAvb0xtWEh6?=
 =?utf-8?B?M3JGZThiNG9oMmRZK1JVZ0F0RW16cWVuTi9QMTUxQmtMakFPU3Bwa0x2MStF?=
 =?utf-8?B?emZJVDZkRVpGZmRCeS9vYW1MNzAzZG1KYWxTb0ZLakhTd1FGMnd3OElyZVBa?=
 =?utf-8?B?WGVmeThTNTZxTGVMSVZHMUtuOWFFRmQzNnBOMHlzaXBrM1FPL3ExQ1hBRnZi?=
 =?utf-8?B?TFE1QTBEVXpac0pZbS81VmhzSkZxK0RRTUVMQ2hXR1FlQWhva3JYVW9QWEtp?=
 =?utf-8?B?ZkwrcGlYUHN6NlNPWGlUYmpUTVNLWXRleWVmZURYR3plUHI4TkJxTHpMNWI3?=
 =?utf-8?B?WDJDclZnVGtTbW1GOENyRDZmTW1sYVNFVnZqOGF5NWIwMWtVZFpCcHUvTjhP?=
 =?utf-8?B?TXhES3FXTkdJaThCVmRyQzBRbHR6KzlNOGIzeVc2RFBPZ01nSEdwRkUyMVl4?=
 =?utf-8?B?aHVTbWpLcHVQMmJwanFqaHNQVWRlUEI3MW1jYnNJNXpGcS9nNzF5U3FlbFEx?=
 =?utf-8?B?TVltWStKUHJUWFNhRWdNMFA4aHVvak51K2cwcEd1NkRUOFdoK2Z3L3FicEt4?=
 =?utf-8?B?dnhaWE9jV0xsMWpLT2JDV0IwV2ZFRFVRR0xZc3NkVDRGOFNPV1JvY2tJRE9U?=
 =?utf-8?B?MWpGNXFPUzhWOUF2bzE1L1YxU1ZVWXdHcHNSa05qU29iMVhkTXBycXZmSWd1?=
 =?utf-8?B?YnRnMWhKN0lma3FiaUZ1NE01RFpCQzZBR0dQVGJsTWI4NDU4UEY4RUxxZEpZ?=
 =?utf-8?B?TEM4RUtEcEU0RzJ6cWhNL2FhRWUwYitpRktObzY3VlcyeTUxVXlZL05TU3Bm?=
 =?utf-8?B?bVd1Mm04RGxWUEUyc21paVZ1OVROMGs2MFZkc29kY1RtZTFFdnpVODFLbmho?=
 =?utf-8?B?L3QyMFdKMkpNU25hKzhpTENQRFB5aTdMWDVXWFpPNDF0cnlxbkVFdkN0eHFn?=
 =?utf-8?B?aWVDVXA1VDZXY0FBT2RSUjcwaFNnVUdvMGFxQlFPTlcvMEtPY011TTgyQzdM?=
 =?utf-8?B?YU0yUm1xRVNBZk83WHlrSk56aCt2cnhsT0lIcUM4Q3UwcWFTTVVqblV5Uldo?=
 =?utf-8?B?ZUlvOFdrL0xjMTJqNGhnMVBZWnBsYThFeStZZEp5UzU4RWhIcTFZeDE4eTJh?=
 =?utf-8?B?TEpTVDNZcjdiVVJTMFAxSllmS29Pd3NoU1l5TmZBelFHTlpxL1d0cVlmdnYr?=
 =?utf-8?B?M1JidkltWExPNUMyeWFOaDlpVWVqOGdzQzhaS3RZeVlIeHB5V2U5aWM2QTJn?=
 =?utf-8?B?YUxiQ05waEh0UHdmT2VBL0FHMjhGcXpkM2NpN2ZMSk5paExjQm1xVEFuRHdS?=
 =?utf-8?B?bG9mZTlOWG9RSGM0OVhUbzVzMTI0Zk9YbGpISkxXV0FHdzM3bGdvcWJNUHZT?=
 =?utf-8?B?cjRPN2dLbEZtVWN4SVlIRmNEbzRIOHBhM3h1UFYzUnJrWU5XMHh4QU50UldD?=
 =?utf-8?B?ZjJoM0Z5SnRNSEg3K1BLT242b0lLZE15VUZNMGt6TUxYZFl4QnRSR0d2QTNF?=
 =?utf-8?B?Tk5oQ0FMYXhWZHIrWFYvUGpEK1ltT2E2SjA4MnNJSkRBUEZUd3JPMk5qSktk?=
 =?utf-8?B?ZW9ua2FhY1VRbmFpZmRoUkVKVENoWEZGU0JVeSs4Umd6SFNXcDZrUGsydnFM?=
 =?utf-8?B?RVB6djV2VDBnVU1GNy9lMjd5L3R1TG5JdFpzMHZjTlZlZmpzYmtSc3Jjc0VG?=
 =?utf-8?Q?2Qh1b+Fz91WLywsOmevsWV/K06VknZ0H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1243d8a7-2e13-4c16-58c2-08da0affd8d7
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 05:58:40.3526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKh2PTrU8q74EFcpz2Nw2JU0ABRyN43vGoYDewhvTTd/DMqTUvrV+FhL3cmJk4eTix1mXYyi6nIXdPmOO9qqPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4574
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
Cc: alexander.deucher@amd.com, pmenzel@molgen.mpg.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16/03/22 5:01 pm, Matthew Auld wrote:
> On 16/03/2022 06:34, Arunpravin Paneer Selvam wrote:
>> handle a situation in the condition order-- == min_order,
>> when order = 0 and min_order = 0, leading to order = -1,
>> it now won't exit the loop. To avoid this problem,
>> added a order check in the same condition, (i.e)
>> when order is 0, we return -ENOSPC
>>
>> v2: use full name in email program and in Signed-off tag
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 72f52f293249..5ab66aaf2bbd 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -685,7 +685,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>   			if (!IS_ERR(block))
>>   				break;
>>   
>> -			if (order-- == min_order) {
>> +			if (!order || order-- == min_order) {
> 
> It shouldn't be possible to enter an infinite loop here, without first 
> tripping up the BUG_ON(order < min_order) further up, and for that, as 
> we discussed here[1], it sounded like the conclusion was to rather add a 
> simple check somewhere in drm_buddy_alloc_blocks() to reject any size 
> not aligned to the min_page_size?

I sent a patch adding a check to reject any size not aligned to the
min_page_size. Please review
> 
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F477414%2F%3Fseries%3D101108%26rev%3D1&amp;data=04%7C01%7CArunpravin.PaneerSelvam%40amd.com%7C51e60632b18847b73da808da074085d6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637830270945242954%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=wVVqKzjUoL6jL00uxXiXZz7%2FzJQeuC%2BuBdB8hPKqQao%3D&amp;reserved=0
> 
>>   				err = -ENOSPC;
>>   				goto err_free;
>>   			}
>>
>> base-commit: 3bd60c0259406c5ca3ce5cdc958fb910ad4b8175
