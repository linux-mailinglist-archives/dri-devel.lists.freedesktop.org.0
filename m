Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4069C3ADACF
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 18:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E87A6EB33;
	Sat, 19 Jun 2021 16:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDD36EB33;
 Sat, 19 Jun 2021 16:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVF3boRUHPGJz/Re/TBcx+XrczeQAlaaAnYqRXmajyH6HQA7Nw2TBpNkqgco53hB8RBBW8XiLW0JO+lwa43f52DelNRJXUzgJjcGMset0S1bcHQPEnLJalwyh70o3IGS+TJSBnAiwLDONKQnu0WCkT7RK6TVmD0LLd7CdRZMDXg5GUa8qmYs+iRqIJ6cibD+Z/RmPcznwk+TkihNFC81z9S6QljcCaqsAI1ljNCHRcD/Pk8Ch2gDpwH0uu2QwiNXIaGqXAD3oA5zGU9ilHXntv0Jm91hx5DZId3xszwG7F2WtMY3CN7IvQ2qQB+sJ8O2wAsHG66eEaNv20F0w7KnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1rnC2kOjdNy5wDyvoRwIoOxTHeBALQ8jntlpMIeuZg=;
 b=meL5qxnMJsFXPCguwLYUQxEU4sQBg4kwy1tl8NAiu4XDh8tiXGL2V3U4faZfuJSMdpuO0m37C8vJ2WN2dRCir+1+QBGis5+67A8zPVeC34R0oDEc4qhi2FvH4Y0zCnxWSlNKNua91/QpmkDXSfgRddeNLnCv4gGT7nIz1JUlGIjOEojIybumDiX+swPipESnFghw8iPmTDnJPBkcXfuBN5/xhINohqXFUfu9J7PW0qXQC2YMd6rYaBb0nAOGwrgKApY2Pxryhcc5EHJsBbtp8iqGpAuh1ysGecxlaLGy61apPPoaqgP+d6ezvGiD4SE6qNCP92r33ufdsOuJ5GHbhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1rnC2kOjdNy5wDyvoRwIoOxTHeBALQ8jntlpMIeuZg=;
 b=X4ZbBYAgeg3TS/YA5v37zzLkmOrJldpKdJeeQmPBGjwEM5Jxh+bqiQz7iGmeLY0TaVt2kHBUKCmadztW2J2opRzkmkdEDbKtKwGlzRdpC4LnGvdMTPp9TtkXtOGtkeXWZsEKjMHprb8Y085vVkWYmrbOYYyojQXqp5RKA9vj/14=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2415.namprd12.prod.outlook.com (2603:10b6:802:26::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Sat, 19 Jun
 2021 16:14:22 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 16:14:22 +0000
Subject: Re: [PATCH v3 1/8] ext4/xfs: add page refcount helper
To: Dave Chinner <david@fromorbit.com>
References: <20210617151705.15367-1-alex.sierra@amd.com>
 <20210617151705.15367-2-alex.sierra@amd.com>
 <20210617235226.GI664593@dread.disaster.area>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Message-ID: <12d08476-6f2c-e411-2999-f0d4a8ad887a@amd.com>
Date: Sat, 19 Jun 2021 11:14:20 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617235226.GI664593@dread.disaster.area>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [165.204.77.11]
X-ClientProxiedBy: SA0PR11CA0047.namprd11.prod.outlook.com
 (2603:10b6:806:d0::22) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.9.47] (165.204.77.11) by
 SA0PR11CA0047.namprd11.prod.outlook.com (2603:10b6:806:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.21 via Frontend Transport; Sat, 19 Jun 2021 16:14:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf7df0e5-d919-4c27-83ea-08d9333d4ccb
X-MS-TrafficTypeDiagnostic: SN1PR12MB2415:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB241566743BA030561EDF41DCFD0C9@SN1PR12MB2415.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MkcEGTnOgRIwEk9eMoAPmSQrHB5xvF6jgtTXqfLo2BGWAJiUNJ7DgqfDGH4JtRvyZQCDWr0sG+THDq3PvAGtANTwWX0HGjkD8jjtM00diYJnvXRIZkAuzSETdGLfn/ujmUmz2fP4e9I9o2xdWQ7J2K5kNtNwpKJalFmbmd5T5hpSKtshpnauXAbaCFAz7xgVrDwLKayT+ZU6gXjpQ1A7K/K8uI6H0gXOCXaESAwVh/yX1fKR3D9C1MCaTZbQ1hGY96j5W1GaocMb3GxA9CK4nvPI33mVLGO8PDY2U70aN2pa9u396oajIuVyoVruuXhFaanqxq7FAoB197PkAhSbdya7F61ofwRkgks/7SJ2/XbpDUXOiSgM/WThGI79ErzU58DdisDSfCqiac/Z2t3xsy2oxb91CTPkvdRzJTbXWhFhiKQqMva2mFAgrRM0lqhqISC0CTc7GS4UxNNZTIHkDk3AJVzj8yul67r5wtuBrtncNQu5Z6ZAnWns9UTjS2bElGqFB1lXwlurWYmYJQUgAzTsOXLMn0/Y3hn9T8Y+mJFhSVbBoy+h7wL66cLPMfdOGjieikV52CcnVYVyzGwnOj6h9+OGlsejfrORyo534dzmq5qJQikLJght1BWdpizPk0Qd9VocQVOPWpWIeeTM1xOn1gsFLPhurAOLLTd2s/PGmLH94Pp28MK5Ljyq5S9dqqC3CjDue9/tacASLpzDZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(16526019)(38100700002)(66476007)(83380400001)(186003)(36756003)(38350700002)(8936002)(5660300002)(86362001)(66946007)(478600001)(52116002)(31686004)(956004)(4326008)(53546011)(2616005)(26005)(6916009)(8676002)(316002)(16576012)(2906002)(31696002)(66556008)(7416002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVNuZ3BvUWJKMi9YNGJsNzlxNnhDUHJTMFF0MTlBNkV1ck9XMjB4NFRpWjhV?=
 =?utf-8?B?WUpucDA4eG9DeTVKcmdEQWwwT1JGeXNVZ2IyTW5ibmJrbVhlZDFkYXdCZm5D?=
 =?utf-8?B?dERDRVQ2WTB0YXVINlZnTzRPTXB2VEZFN3pMVUhMZ2RpdE50bHluMzVCbVdT?=
 =?utf-8?B?WjNUQU1ma09sM1FmY2tnakdWa3JlZ2ZuOWJsK244bzZvWWlpaldVeHoxeFoy?=
 =?utf-8?B?MTlUeHcvaEpWSnRFLytNdTJWTzZ4ZUtOc0Z2ZGFhK3Vpakp6RFlRMFg1VXg2?=
 =?utf-8?B?MEdTUWdWdm1RS3FkNUYvRnJuWFhrRG5sbUUwREhScmNzTmpsS2RlRUxTNFN6?=
 =?utf-8?B?bElYM1ptUkFvZzZibVM5Um9teWJ6dEZCc0k3KzRhMlBzczQvdUtEOVR3MUVt?=
 =?utf-8?B?emM0dVIzdlNzRHNBeXQyRDlRczcwR2xOc3lPNjl6SXV4QnE1U3NDWHQwalNT?=
 =?utf-8?B?RHRDdzM2a3N1bWtaNFhxZzFKZUpHVjdIRG1YQUNma1A2ZnlwZFY3VXpOdnda?=
 =?utf-8?B?OW14WVNNZkVWeDZVdmFuajVwcEdram9UMXpnVnkwclF0MXZEcHY0bFo4YWVQ?=
 =?utf-8?B?MG1VTC8zT29iZ2MyOGhIVDZEdXVyMVB5SDJBcmxXblhzb2JIZTJtWUxjZW5R?=
 =?utf-8?B?SVZYWk8zZ2loNStUa0FlLzNYaEhFdngvSXJIeWRnZzhqMlUzTFJSK0ZydXFu?=
 =?utf-8?B?cU4yeUJDcjJsQldmN0RlMzFicmpXelFaR0JWRmxBbUlMQy9Jb0Zzcjlrd2xk?=
 =?utf-8?B?VVAwUUNJZitpeDVTVG4rd25OQUZuL1RHRnFxS3NLd1BEYjF5NTZLYkdsV2V3?=
 =?utf-8?B?UjBtU0MzQzlDbGdod21YYlUwekZyNjFzK3pFcEkydU4xV0RIYzAwK1F3ZnV5?=
 =?utf-8?B?MzNrajNQdE5XM0t4czFzanNBc21BVUlwOGdsTEVNVmJ4ZFcvcFFxUVNLWi8r?=
 =?utf-8?B?VVVDZTgwWjNzRDNlbm1nOEN2YUg0WUF0Qm5qMWZDY3JyazVGODlkREs2eXdF?=
 =?utf-8?B?VGp6Skc5TWZDWkRFYlpaT09EbWR4T3I5NFVNUndqN3B2VkdqVVJ6aGhzK0Nx?=
 =?utf-8?B?SjZLZ0dDNWZlZTdTT25SYnVyL3dGQzFEN0dKKzNtMjNDNEtSYi82M3l6S3lj?=
 =?utf-8?B?ZFBZb3djUk9EOUExRjZHdFBRWFZBWHJEYXZoblhJNjlpQ0hrNmNPdkRiRkh4?=
 =?utf-8?B?SHc0ajlPRGtiZDhzWWJmZXlGczF2MlM3TkpQZU5HaXBRSkErWFYwMzVYbS9t?=
 =?utf-8?B?WGtZZUlqVDl6TFNVRHY5a0FoUDNOZTNJenFQMWdGcUNvTVhVRFpSWkszenZo?=
 =?utf-8?B?cXptOTV6OEgvUDJaVDFRc2ZPVVJyVXFVdWZQMGxCaTNGYm9vbFI5b3M4R2RF?=
 =?utf-8?B?YWt3OGtqOXZDejNOMWFEbTJROWZsZkNLTUJzZVRPRUJYcnpvVXNzQjE1Y3JO?=
 =?utf-8?B?cnNoNDMrSXk4YzRyWDRlMHFlVXBOaWkwWFk0djh4ZGpPQ0kxbXlINk9zd0Zj?=
 =?utf-8?B?aUJScldjSUdXY3NKYkdpbzJTU3pXM3I3VFBpV1hYdnFrK2xuSG1jYmJmb25z?=
 =?utf-8?B?YXZBNjl0S1NKNVBRVHJvU0lHS0V4clVmNGt6bEl5bmFaTlhEVE9wMEg1bVZF?=
 =?utf-8?B?ZWdHWEsrTWlBSnMyUFFVYWhKbXlDZk9wMXVjR3JtUDU1VkJnM0NqSnNZZkNW?=
 =?utf-8?B?UVluV2p0NFQ3dnNsOGNtQm5uMWFwZTZERE9OYzlBcEo4eW5SMFRiZ2NmS3h6?=
 =?utf-8?Q?9ZtuNjhl7z9erJOPBpfe9bN5sc4DcnlKIa48bVj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7df0e5-d919-4c27-83ea-08d9333d4ccb
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 16:14:22.7100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mAGd+CUOxi03UOZSdHcPiwYEq1a9mfKqHB9CzFFDx0I6sb0nXAlS0YWf6EPRJS51JxGQBWYk2OiIf6i2K/Z0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2415
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
Cc: rcampbell@nvidia.com, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/17/2021 6:52 PM, Dave Chinner wrote:
> On Thu, Jun 17, 2021 at 10:16:58AM -0500, Alex Sierra wrote:
>> From: Ralph Campbell <rcampbell@nvidia.com>
>>
>> There are several places where ZONE_DEVICE struct pages assume a reference
>> count == 1 means the page is idle and free. Instead of open coding this,
>> add a helper function to hide this detail.
>>
>> v2:
>> [AS]: rename dax_layout_is_idle_page func to dax_page_unused
> Did you even compile test this?
Thanks for catching this Dave, my mistake, I was building without 
CONFIG_FS_DAX, as I was using DEVICE_GENERIC only.
I'll send the corrected patch in replay.

Regards,

Alex Sierra

>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> ---
>>   fs/dax.c            |  4 ++--
>>   fs/ext4/inode.c     |  5 +----
>>   fs/xfs/xfs_file.c   |  4 +---
>>   include/linux/dax.h | 10 ++++++++++
>>   4 files changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/fs/dax.c b/fs/dax.c
>> index 26d5dcd2d69e..321f4ddc6643 100644
>> --- a/fs/dax.c
>> +++ b/fs/dax.c
>> @@ -358,7 +358,7 @@ static void dax_disassociate_entry(void *entry, struct address_space *mapping,
>>   	for_each_mapped_pfn(entry, pfn) {
>>   		struct page *page = pfn_to_page(pfn);
>>   
>> -		WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
>> +		WARN_ON_ONCE(trunc && !dax_layout_is_idle_page(page));
> Because you still use dax_layout_is_idle_page() here, not
> dax_page_unused()...
>
>>   		WARN_ON_ONCE(page->mapping && page->mapping != mapping);
>>   		page->mapping = NULL;
>>   		page->index = 0;
>> @@ -372,7 +372,7 @@ static struct page *dax_busy_page(void *entry)
>>   	for_each_mapped_pfn(entry, pfn) {
>>   		struct page *page = pfn_to_page(pfn);
>>   
>> -		if (page_ref_count(page) > 1)
>> +		if (!dax_layout_is_idle_page(page))
> Here too.
>
> Cheers,
>
> Dave.
