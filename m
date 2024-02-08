Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D57C84E243
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 14:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEA310E768;
	Thu,  8 Feb 2024 13:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5toUHofW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C4A10E43E;
 Thu,  8 Feb 2024 13:47:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TC+sKpa6NypZ5nMBojpyISKjuDtw6yDLJmVfsmt94TxlhJ77bTyuV3DEbw57jX0TQDgKXvvh9jHLbw2tMqI09K4de79OUEvrqnSp+u0FLeKUw8r3qyjN0H5LIAWI7Gf7nMRhmw2UL/+3yN19BfgzpWmtOvJRw+dbeiwAR63NHll4023xefrxfgbMTXLiBu/7cxZt7CTPrJWouTWG1gpMUsDDZ5uB+m/NucOHzZ/jB0Ta2qZnMLi8NstfK+MQcrdXNzzQABglE/Lr4BCcdRvB9e8eWYQJYkSCR9814iW/0Cm6HtkkfubE+2mSh+y3f5tmAKEMY2zqZ7mLHxz4Z20RiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3/p6lcmHkdsicOCcVZcP2b8o5iHe0yyYh3tn0I0H8M=;
 b=eJjmO5r6skh3HOQsECIQRxJeOOUe389FHSbs17OlWStEY6zLYurU7nseRwArzPoMcNthTWpY+hjdcPLPIvUDzXE1YRZtp42tRtEFUGQngNkdYBm0KqPpeQNNTW4UD+xJudmye+AaYUkxQtU0E6/26A09sf2U4LHe/YJlIG1RPfuX/Jsm4LgBnbTUWibi/AG8+xAfp+4E4ufNB/cTpsZAhTEfG7zGTXQk/1gxCreH/E28yEHnQP600taleKxnTaUO3X3FK0En2UGdXNftjWfCUMpebWbl4MNGMshJlu+olntIidAVXyJ+4hRRGDK628s6kJhTt90DvSAfdVpSo1U78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3/p6lcmHkdsicOCcVZcP2b8o5iHe0yyYh3tn0I0H8M=;
 b=5toUHofW4rT7z+57TgsnssCqk+P8y7yodZQtcxgGVxf72GvBZfcp8Kt6eQSLCX/dzx8auNG57D6CPzi/hMYYj7Vg5zNtdNxZr4jj0te+FBOIY5+TgrG7vCqh/jTKaM4J+mYURngcXbqAxb5vNGnCQYGThJY8oJFYNOiWTlm4K6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DS7PR12MB8083.namprd12.prod.outlook.com (2603:10b6:8:e4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Thu, 8 Feb
 2024 13:47:25 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe%4]) with mapi id 15.20.7270.016; Thu, 8 Feb 2024
 13:47:25 +0000
Message-ID: <ba6b433d-e672-bcb2-4d25-66b2db50d7b8@amd.com>
Date: Thu, 8 Feb 2024 19:17:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/buddy: Fix alloc_range() error handling code
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com
References: <20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com>
 <c5d75c40-7fb4-44a4-8ea5-327385f88004@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <c5d75c40-7fb4-44a4-8ea5-327385f88004@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::16) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|DS7PR12MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4388d4-8702-493e-d95b-08dc28ac7b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S7p63QiL3LSQdcE9wp2oOhrSr3TNlvqKuTnAODWYeAgosLK5HvLOPw4pH+mJwdBhBkLxxHPGmbMr7jKGAnuUyHKI+2EaFPaNyE1gfwvdFmpkuDivNCEzkv1J5bqTqlYd5zoZlkiCsujfX+yRHojCHqDCOB0Y3kR7pQBU177f+5KJ9azXTaYsX5NAche9hgbIswD/jDj9WXNYmBVPvOuH5PD90PYcd3tocNTS7f1hlu/x0z4c1kMIYkwdQCnFpkEcmzeKcjYOF9dwLDp4wjicBS6Ca+iyT6IOxuySLBTHlu8MYcdG/rnbyr3glieOENllac2gnw4/2ptOu+GWL+8dpHTyLPqjeWNkV+0m1Q7tiF0Bxgfq/IemEhCL8Ou0b8/kTZpqe9I4B1w3YuXSSMw/nsmUYo0LC1+T1ZxyAQuSjXM9hCqj83ETZaF4u5wnGmGeafS/FLcDVP3/QvYOoiq+amrJpxYW1NwvupJcuDzd1Cy49jNHvw1XdEcfaldbhficP75p8EPnnciReBcvnuR76I6IDtlobRJg1qzJdFt0IeQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(346002)(366004)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(53546011)(31686004)(26005)(83380400001)(41300700001)(6666004)(86362001)(8936002)(66556008)(66476007)(66946007)(478600001)(6506007)(6512007)(2906002)(31696002)(2616005)(38100700002)(5660300002)(36756003)(316002)(6486002)(4326008)(8676002)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzVQcG5VeU0yN2ZRWklhbDlWNHFOaUJSdzNveUZrbmpZd05ua2xnMVNncVRa?=
 =?utf-8?B?M0tWVFl4Y0JianZQakREWUpPMDFLSmF3dndkeWk4K1pmUmdVbG5FazBPM3Ur?=
 =?utf-8?B?TzVMV09GbFhzQlIxUCtKYXBCSWY3cTUrSXVLNmRkZHczM01yZDlVRnJQMklw?=
 =?utf-8?B?RGdKZUJyK1ZUN3Jha0tJZGg2YnVhc0dPYnA1TS9TaEhnZlBSdDhUOGR1TXV6?=
 =?utf-8?B?TW1PRXgzd3M0MUFsS2FIODVneE0rUCtKdCtPU3ZsTU9ZM2NKZlBGZVgrWE93?=
 =?utf-8?B?bVZWek0xUkxsa1FzbHgzMVcvanU1d0g4YUZqUlBUVjlzVGxoNGNBSkdVWjcz?=
 =?utf-8?B?Zms2U3h5Y2hOdUtUUlpXQk5acGhKUmcySzlmZ3hzbnM5Vmw0dVg0bTNkL0Jh?=
 =?utf-8?B?RjVkZCs1Z2xvM2poLys0Z0lacG4rUDdIRVQ1YjgwdkpHM3hmbDhKMS9VVnpK?=
 =?utf-8?B?VXR6S2tOQTA0S2VLOWlnMGNlQ3JlbmhGUG13TWp2MjBkcjlMemdyOExOaXFi?=
 =?utf-8?B?T24xNlR5N2RVZDBiQTllY0R5QmtRTGNRUnk4VkE2UWRPSitPcFNBRDN2VWpl?=
 =?utf-8?B?WFAwUlp4SnEyUTBnMUFxb2hTNnJQWEc2SkprQVZFVXpNMzd3WkdwY2l6VThn?=
 =?utf-8?B?djYvSHpQM1prbTZLZGRjUHdCVkRqTmw5dmRBanM5Ujl2WmlyZlZjRVRLSHJz?=
 =?utf-8?B?R1ZDYmt3MU5qUSt5cUlTTndUZDlTRUduaHloV3FMRmQyRlY5WDZxNHZZdTVa?=
 =?utf-8?B?cm5hQWp2UndUeGM3WFRqOWQyU2d4cWFKU1FsendkRjRoTFBTckszb04wWTd5?=
 =?utf-8?B?MStEb3BCMHhjZ2dLNitaM0ZxRm9yVGRkd3U2MEFxZUt0SjM2SE9uUk10S2JO?=
 =?utf-8?B?Wk9NZjVsLytjRjVOeGFpMmF0bVdmbzBzMGRrVVkxMEhJVGRpcUpWSTdwRTA2?=
 =?utf-8?B?Z2RJOERhWCt2djM4NXBZMmJvVW12QlcvOXlXVEpBRm5PalBvcjgzWVNyYStr?=
 =?utf-8?B?WVcwQVZiRFk3bTVnQ3V3ZUt0YWl5RFR0c3ZZRjFycktPSlRlWC9yYnB6Qno4?=
 =?utf-8?B?QldIZnRnVkwrQlVPamx6VU9DQnVLNDJGYTFoRGNJeS8vVlltTWtPNnhoMVhy?=
 =?utf-8?B?SWNGYkVnbHFhZ3YrZW01N0VOclJzNkJPTVIvVDNqdGpkUWZSdDliTHdwZCto?=
 =?utf-8?B?anpqa1NiQXBEckplbXBJS0EvcllFbSt6NzlSY2NOTHVNdEVxM0E3Z1JENTVw?=
 =?utf-8?B?aExtZWJnSXNQNDlZcFNSNjBSK1RHWGd1MXJ0OWlKZ296V2dMLzBDeXhlWU5W?=
 =?utf-8?B?ZEpuZWQ1YXY5S3FQUHFSKy9PUzRrMWY2eHB0SjFydjFrTUF2U2txSUUvUlln?=
 =?utf-8?B?a1g1VUZHa2JrSzNpUjhSZElkVnNJaGxIc2ViVXVXbXhwcDh6RnhnSCtHUEVz?=
 =?utf-8?B?eTZSd0RPS3Y2TDRaQ0E1YmxwbWc3amlMYWNZemRxbCs1dk1wTzQ3c2F2eGcr?=
 =?utf-8?B?Sk1UWnU2Qm16SzRRMElRT2Q0OHhpVWQ4eEFyL2xjejJuUEswM0dwZHVWcThi?=
 =?utf-8?B?WjB2cnhSVjJqSzRINVNDRTVJZWQxRFFrNDFLYXpwTFJQMGlweWVISzQwYWlK?=
 =?utf-8?B?RmQ1NU1zZ1JOb3FJekN4ZDIySkRWWkw1dk0zRXpGcEU0YVRMUmV5d1MrdDNj?=
 =?utf-8?B?N0l6MXNwdDFzbFc0bk5LZ2MyckNEcW56aERTWXZxVHpzcWZRMEx1UkMvamJM?=
 =?utf-8?B?MFJJWEZjVUdldi9RaUh1MTAyL0t2U0lkTW00QkU4U0NLNndyck9OcjYzemor?=
 =?utf-8?B?YjhWVTJjWVJyeGRrS2ptSUlLMUU5UTUvU2c1QUlXdm9XUmRlSDJ1WEVtVjlN?=
 =?utf-8?B?bHVLVUlpWVRDRkF5MmFpMjViOExiRmJSUnc0cXVRMTJwZDRiSXByK2p2NW9p?=
 =?utf-8?B?Q2sxTXE2TzRNa2hHeVBhNFJWb1VqVkRsTFQvMTU1TzJoS1NZS2RNZUdKVXRr?=
 =?utf-8?B?UksyMFhVTDc3U1ZNeVlUSG83c2pmY1cyaENsdmJITU1Odjh3OGV6Q3dQdkd2?=
 =?utf-8?B?Sjg1dWg4Y2QrTWg1RlBRL0pxQ1lWOXpTc2dzb0thbjVHeGYyTExMb1BjS0RR?=
 =?utf-8?Q?2wVnMAAZDAq9muopMSo7ZF+KB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4388d4-8702-493e-d95b-08dc28ac7b60
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 13:47:25.2440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lH9nCGeo18zE6xZWsTuj/oH9AEIQYC7/D4rWEtesQ35L3ItDKjOm1pXzIgBM0RCeBWPgK5qOaj8imjRUosn2hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8083
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

Hi Matthew,

On 2/8/2024 7:00 PM, Matthew Auld wrote:
> On 07/02/2024 17:44, Arunpravin Paneer Selvam wrote:
>> Few users have observed display corruption when they boot
>> the machine to KDE Plasma or playing games. We have root
>> caused the problem that whenever alloc_range() couldn't
>> find the required memory blocks the function was returning
>> SUCCESS in some of the corner cases.
>
> Can you please give an example here?
>
In the try hard contiguous allocation, for example the requested memory 
is 1024 pages,
it might go and pick the highest and last block (of size 512 pages) in 
the freelist where
there are no more space exist in the total address range. In this kind 
of corner case,
alloc_range was returning success though the allocated size is less than 
the requested size.
Hence in try_hard_contiguous_allocation, we will not proceed to the LHS 
allocation and
we return only with the RHS allocation having only the 512 pages of 
allocation. This
leads to display corruption in many use cases (I think mainly when 
requested for contiguous huge buffer)
mainly on APU platforms.

Thanks,
Arun.
>>
>> The right approach would be if the total allocated size
>> is less than the required size, the function should
>> return -ENOSPC.
>>
>> Gitlab ticket link - 
>> https://gitlab.freedesktop.org/drm/amd/-/issues/3097
>> Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Tested-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index f57e6d74fb0e..c1a99bf4dffd 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -539,6 +539,12 @@ static int __alloc_range(struct drm_buddy *mm,
>>       } while (1);
>>         list_splice_tail(&allocated, blocks);
>> +
>> +    if (total_allocated < size) {
>> +        err = -ENOSPC;
>> +        goto err_free;
>> +    }
>> +
>>       return 0;
>>     err_undo:

