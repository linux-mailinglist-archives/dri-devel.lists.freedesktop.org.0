Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E21E4D1A49
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 15:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D826410E20D;
	Tue,  8 Mar 2022 14:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D918A10E20D;
 Tue,  8 Mar 2022 14:21:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOA4KsUFqKuhZr/zq3SXRtU3xoKAKnHbvUPq1Rrsfg2xqvexfec9TL76ofeWqq9yqRVHOSo42uGFVtN6r2dLNqxhcLUSphhY3Jr0COTMN5UH2b3otx855OP+afJ+DbP0zzM0NM2k/EYE5UlWvGGk2zkeaNnMxqDvl1PyLqi6XPTK84xKXk2Wk9RTjy+d2ccsEskwJwNC7WYefVgXqd2YXBNZWHtZz4McrL2vkGP3fGH7txowIEW/fd4OKyNkma9agatznUycUP2122wA+yfRpX0TmUwAckmG6MH0sD3cPK73+oQJhR/+xGfK6Gk9iigYHuGDnAWfk2PMMcqP7GYXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFI0jhdMHQr95ornTFLkC/P0n+FyDTRaq2xYe/uxUbI=;
 b=LH0rCQUVGTuQJ1FjrbNam2YZmVbh6lMGL9Rs34Os20eTNfmEW3/e/Ixut3yaGZMi2qOtz+QCr9oBURhWS0wQHSfEOalKGoay0JYl+a0+X702WGPn58/uQ9le94E543E3vpoKpuwq4lkzGLlpbo7jZneb5vrWQPXTpgzbLSIrJvRmkbp8sH6vU3yv/0uIXxRsGE8OduApuR7KnoDS2LYBbtGESwh79EixXJDfhWXV/i4VSHzftM2Q54vezJxECVV6UaOtjqMg1n77fmGc980jeGcH8sBdNHyW9sVzeblybloEoK3dCkk0AXCn75V9liUmQzozE1F9lfffh1bHfYstyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFI0jhdMHQr95ornTFLkC/P0n+FyDTRaq2xYe/uxUbI=;
 b=SR3eNn8GFCAi9XfZ+mrwljyK1QA2ktTdrxxQvYZdFGMwbKtC4ZgSu7h03kttHsCrDddVj5oQc+ciYLCHFxyXmCdMzER4hecvJ1zzMzBIXFwQohIM7V5++D21YLtDQjtlpKreFZEOxW31lIpRXj/cxOwZ6alyWWs17Z0sMqhrdvU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DM6PR12MB4893.namprd12.prod.outlook.com (2603:10b6:5:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 14:21:37 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%5]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 14:21:37 +0000
Message-ID: <82bc8418-2214-3008-edd4-5de3becad952@amd.com>
Date: Tue, 8 Mar 2022 20:02:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [Intel-gfx] [PATCH] drm: remove min_order BUG_ON check
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220307143707.3687-1-Arunpravin.PaneerSelvam@amd.com>
 <874k493jou.fsf@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <874k493jou.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::15) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1d908dc-2a67-48a2-2d1c-08da010ef49c
X-MS-TrafficTypeDiagnostic: DM6PR12MB4893:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB48934BAAF922409B1399AD0CE4099@DM6PR12MB4893.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3BN0MLJDTuFTnQxJ4U31OjEu5Dn8sJtl0RmO8rrCUpFTwaZpR0xrsF8mQK6ddV9IpVqmM5PWSR7IP3fZJCYgXfoKwJoDjmwzczn0KIeVVH5W06Tx5ZImthXMbCOQHfCpUqSOycXCQD/dAy18lPOgVj0QFsUHYO+eIoZxlLSfsxramvFu4kMROOew47wtN3db53bDgsIvSS6+mPd4DWF+yJFWHQrdNQXHyvPwCDIKd/ICBFiQ+PpsSgShH7765djO0oQl1t+cZX0bV/MphuHHzRocDtRLQj5Cj3eH1w/HDoigB/hV2OnOBhAYjy9X2g5OYKLYBtaaxxBHu6USjiVIePSXuasdhK+OkK6hLF6ktOb8SL6xU8brHQoQB5p5Ik/b1P41GJ15OkWlscHi+dCGbQ/gcs4u7/3QNbp8HN5f8NXOvzZKG3DaMPRTW8eYvWo65iTBU8z8pNhMyqyP+UDRmGdOdl+5Jv2U3Uj8Qi52LU8++UldmWNGIYWlEkcM6CtAmq5vrTswE4UU5if07a51JvelbN26IZedU/QAPTiybSq9aScPnWSYb2Wj+sqAHd8sXzTYq7BsgYzWMZProT1R5J1pU2JndJFvJi+6WR0ptm9Hi5hdH85nPxqaWV5sKubvbhSpWf+sVr8wR1HTdjRriTFhL1Jz1H5VwvlBLHLpHgZ9+ZpgC222tdALb+VxKy4824JIkUZKmAyTHYwceOsFZU94M/jxMGDgLYYYfizqg9w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(36756003)(53546011)(6666004)(6506007)(2906002)(4326008)(8936002)(66556008)(66946007)(66476007)(8676002)(31686004)(5660300002)(86362001)(508600001)(38100700002)(316002)(31696002)(6486002)(83380400001)(186003)(26005)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T253aXh1cW1sNXByZEFCczNZOExhYjdjd3dJMVVDaE5jandSbGVxUVd6YjJa?=
 =?utf-8?B?dytXcURDb2lvRm1FZGtWQTA4YWNUd2lpZ0tBQ2lGZXIrNjVRT21RY3RKdmpE?=
 =?utf-8?B?RXdHYVo1YlYvSjNvQXNMV2VzVlFTT3ZZQSszQWtKQTZaQWE4WUxFTDZDK0p4?=
 =?utf-8?B?SzlNZzQwU2k5S0t5MzhhUzJ5M2dxNmo4WGg0aFRscG9CdGlBTnZwK2kzZlM0?=
 =?utf-8?B?UllXUWRCOEdaUHlPZmRKZ1BmNVhDYUx2dHVBb1JoUHg3S0J4Ym1KMngxWDYr?=
 =?utf-8?B?ekJnTUVCMGhjRlNlVnVEY2xQc1JvaVB6WjBPVWdEallEU0ptWldTNkxtZ0hw?=
 =?utf-8?B?N0F6NGZnQ0RvQXh0SUFJbGtxeWptTzVUVjk3VjA1czFOVVlBWDRNdVVLMnNC?=
 =?utf-8?B?b25BQ0I4cW5nbTcxVkx0VE1UT1IrMnlROHh2Mk9zL2ViN1ZZbHhYeURhSDAw?=
 =?utf-8?B?NXhxL0VpVWFIQTZIc2RWVmNYQzd5aDZrN2t2dEl2ZFdRdUNhaVdXWHBwbGRT?=
 =?utf-8?B?UlVGTUNpcWYzZjhFTStKRjk1SGJTS3JNVndqQm9XdUZQUjhGVmZhVUNDS1Nn?=
 =?utf-8?B?U3BHNk9QTW92Zk9jTGlLWHNFWjc4QTc4U2tVUFBxUkZWcjFyVGZSUmxXQldB?=
 =?utf-8?B?SHgwRXA4bWV6R0IvOWNPZThsTW9UVzk3Vjg0VCs0QnpudVBVSXpMa2ozVnp1?=
 =?utf-8?B?bk1xdFowak9rZTZwRG84c0hWRHlFaHFscDRmcms3byttQTErRlpjdjY3TWNw?=
 =?utf-8?B?OWlQemRVYzJxRVJXT3JJakUxczBBekVQZWFiNWY5ajF1QmlkTmNmVjF4dEls?=
 =?utf-8?B?MU5OUFEzbXpCN2RNQnlRMFZzQ0c3WHBzN2JES3dDQ3lEOG55TjcxMkRKU0p1?=
 =?utf-8?B?RGFpKzBlb0JWVzN3YkVEcmdwOHB3MXU4Y1p2WUl4UUwxSUJqNVBMQzU1S0ZT?=
 =?utf-8?B?V3RHNEFMOThVOFNaMXlIL0dQVEJmQ29CaExtNmZjQi9XSzNkeXc1cjlpWXdL?=
 =?utf-8?B?SkZKQXdUajg5T294UEozSXh5RFdPMHk2ODExSHM1MXhtK2k1WGRzaXdDakV5?=
 =?utf-8?B?Y3Z4bmY4d1RCNE9BV05JWDJwYWxIQW9RNjBrWlhESGk0RVhiaXVoS3dlRENO?=
 =?utf-8?B?K0pCOUpvUTNPUXFxaFIxamxzdGZNdzk4Z0tXQXZxQ2xOcnl2MUF0RXNVWW1O?=
 =?utf-8?B?RjJYeFQ0Q0tJZndLUjNGdFcvdWpCcmFZY2VPekJmZEpHbEVPcEdRNFYySHV4?=
 =?utf-8?B?Z0wrYW1aUHlkR2tBR2RaQWpNWEh2TnhmNEpJNGhaR1lYVnYwNFQwM3dHdWxi?=
 =?utf-8?B?WUZna05xQkUvK1k3a01uZmJKRHVuRU5aWVl0KzRpMnE3c2dId1RveU9OWkgz?=
 =?utf-8?B?YzhlQ2s0OW5pRUVTcVhQcnV0aGkwTUxkQmlCN05jQzVxRnp3N2RFdmlKeHVD?=
 =?utf-8?B?bjVxV1FQYmR1VWpNcEkzeG1XM1NwV3lsbmNpUlMxVzU4aXJDUTlvL2JxU3dv?=
 =?utf-8?B?K0dZK050T3VNQStxT3ZYVnRJUXhyZ0JTRElKOEd5bW9Xd2ZlS0h6dXVMT2hO?=
 =?utf-8?B?K3BYZ0tKSUJNSVlwcHVnR0RTWXEwZ0hFU1kzdmNzRTlNc2NYZGgxMU9HeHRE?=
 =?utf-8?B?ZjNITEw1R21DSDRPQkl1Vk41cWEvMitiQlI1ei9lNUJDUTNoc0M5VmV0Z1F1?=
 =?utf-8?B?UDZvMGJyMGNaWDRzQ1o0M0J5TFpJai9EQXBHdVppbjZRazVEL3ZwY3ZGNVI2?=
 =?utf-8?B?d2hHalRaVUdmT2M3alBBeXhLeW1OcTRrUTNvOHpQQUVFcmZlOHJ4VnNSa2V0?=
 =?utf-8?B?TW80RXVIWElXeUFISDFCdmRvWnBXdFEvL0JUMGo3ZytzRkl0M05DOHEza0ZC?=
 =?utf-8?B?eGpRdDd6VlM1bjV2SFRaVlltdmRhaDB2QlgrcjFTMUxSQTVJd3pRTEI1MDlL?=
 =?utf-8?B?a2N4N3VwYjllN0JlazJkeW5kK0JFOGZNQXJNeEt3Mzgrd0Q4bklkcW4rMzhl?=
 =?utf-8?B?TnBFS1E2Zkdlanhhdis3ZEdoUGNSd2hrSEY4UlMwSjAxQ2NCKzk5SWNnNTZK?=
 =?utf-8?B?UkQ1eFBmQ2FFMXNXU0taUG5KbUYzeWw2MUFDR1g3MFdIdy9WTncyNXd2NEIr?=
 =?utf-8?B?QXNPaTdyYStINmtjelMxSDdiZTYvbG9YQVR1R3J1MDhiWjJWUEtiUHF1bS9t?=
 =?utf-8?Q?LK5AnKTbDAEKZ+ko8OkdJKU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d908dc-2a67-48a2-2d1c-08da010ef49c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 14:21:37.4686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: My9p5JyRhkcwkVKQmgs7cRTdvb8sqYf9z55R5g3EJ/XBAwaXZAmDlsvRe9fT9k1XuHZtIGuxmc7Tvp7I7z0/uQ==
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/03/22 8:15 pm, Jani Nikula wrote:
> On Mon, 07 Mar 2022, Arunpravin <Arunpravin.PaneerSelvam@amd.com> wrote:
>> place BUG_ON(order < min_order) outside do..while
>> loop as it fails Unigine Heaven benchmark.
>>
>> Unigine Heaven has buffer allocation requests for
>> example required pages are 161 and alignment request
>> is 128. To allocate the remaining 33 pages, continues
>> the iteration to find the order value which is 5 and
>> when it compares with min_order = 7, enables the
>> BUG_ON(). To avoid this problem, placed the BUG_ON
>> check outside of do..while loop.
> 
> How about turning these BUG_ON()s to WARN_ON()s with an error return?
> What's the point in oopsing?
> 
yes, we will use WARN_ON with an error return

Thanks,
Arun
> BR,
> Jani.
> 
> 
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>  drivers/gpu/drm/drm_buddy.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 72f52f293249..ed94c56b720f 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -669,10 +669,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>  	order = fls(pages) - 1;
>>  	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>  
>> +	BUG_ON(order < min_order);
>> +
>>  	do {
>>  		order = min(order, (unsigned int)fls(pages) - 1);
>>  		BUG_ON(order > mm->max_order);
>> -		BUG_ON(order < min_order);
>>  
>>  		do {
>>  			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>
>> base-commit: 8025c79350b90e5a8029234d433578f12abbae2b
> 
