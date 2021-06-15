Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2C63A7E05
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 14:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682FA89A56;
	Tue, 15 Jun 2021 12:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1AD89A56;
 Tue, 15 Jun 2021 12:18:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fcthde5PayEnibSvlYzfzbbw7maEjoVq4Wru9dfCohLcEmXg0NjtqkgpkvHyJAKKgLUpjpiEH+invLuelWxobIxUlrnuXx8vZkSR53By4SbfpHLRn/BdKLqk0iCAc5L8IXJTYC09v+6tSM+QYyoxhslRi/DTJrptGUwc/45haHdPkH9BiNE5qfmHJN4KTFmtLSNML/Z4vso8VuLR15pZyyLylP5BrUjGFcSYBocJdGXDEXpqiKIcsyxQoLmrGuU7LqXvhg3XVszO6ndwEZjLnexvLGdRHtOB6K6i5FBQiY2nzvKaG0qiU+Tx4riw/+JI7UMJkGvWJa6ypSOSwVRX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JS0/33fMUfRWzm0eTKIut6RMUL91tK0C6Bj7kcBVUY=;
 b=QeuIHGyP9/IVhjWXG9QZzsmRS9QemDgQKTSKtwVAngjxg/tTWalWRD5R2odmHxdH02sqJuSr+Q/e+Qw79Oh03F8AETfyuyxSMt7jDtGdTqL8cHBCeH5hW2AtkI77zQhPyUnfT3wcnOsIvKeKJaMjpdQVQr9Iu9bI+plPSXWoXc4u64K3vj4CPCKKuEMKuFtG5gTyEfUF+mjT6y3eBYTzJX9zVehEli5pdfkRQI0wTI8AGdpcyWXughcTG7lI5DwkCja7Eqk0cKu99kr4+x0lPdCEiqGOnsiKtuAjcEMcht2p1Mvf/NHuh/6b4tl4+rDwKCWsYLMJABYkYo2oQuBtGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JS0/33fMUfRWzm0eTKIut6RMUL91tK0C6Bj7kcBVUY=;
 b=sSNdKOTi6BdVPynlJpSu+OPcSYwrVbEF1lR6DtmADlKn4yVAR72O5zPsXzkDV15RInWXlEaqk3bzjP3PVw0jQXpBOriA7p/pUbTJzDYbi+r1bjq84kWtf2oHQEN74hHZRqzEHbwVqTakps7MbrgWCDXb7ZRNJxUFL23qV3+v3dY=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Tue, 15 Jun
 2021 12:18:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 12:18:37 +0000
Subject: Re: [RFC PATCH] drm/ttm: Do page counting after populate callback
 succeed
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210615115746.27424-1-xinhui.pan@amd.com>
 <f70e88b3-f0db-fca8-f05e-f685f1a913ad@gmail.com>
 <4719A30A-0B23-4053-B8EB-AC9BD21DBE40@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <88115e0c-5cee-5b16-f60f-480136f0bcad@amd.com>
Date: Tue, 15 Jun 2021 14:18:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <4719A30A-0B23-4053-B8EB-AC9BD21DBE40@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:f438:4e93:3853:400c]
X-ClientProxiedBy: AM4PR0902CA0010.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:f438:4e93:3853:400c]
 (2a02:908:1252:fb60:f438:4e93:3853:400c) by
 AM4PR0902CA0010.eurprd09.prod.outlook.com (2603:10a6:200:9b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Tue, 15 Jun 2021 12:18:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 158f92f2-fd50-455d-7cef-08d92ff7b3ea
X-MS-TrafficTypeDiagnostic: MN2PR12MB4224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB422431D16F0A8FD355AD1CCE83309@MN2PR12MB4224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eAmOnLlDN55Icdj/vxtB+1/wb+ki7zA+tpFG1g1BTbZCL0tzvXVTXLydo1KEl15ACzi/tAQIbmyMRDyNarkmYd2To3RHUvdygaZuh8BERbx87azYrJF4Y0Ib8LZJ4zpqgz9YsxrqD8yrsk2WjKmgQplTRZUZiNHExJRip5NW1ld0BefVnvp31s72o8rCQlMkbuzUyGPskt0bNOS4KYHse6ujKh+EN7gaZZR7+VOyJlpEgERw3j6rZxW9aj1fwd/RGMYJs1VQsGSQjYE17f3kZSt1x1zorhvs5+5tVXSP3CzLwIZs70o0Sm8ekzdkubZITPd9L6g4nY7Jc4cQxlqMWtmTobwWxeyPWoV2IsHyPBdP5hQORfolgGSriJXekF52VUMpbqLrsNkknm2jIfjllN5ah6n4N9ufmMb4CHiPvlZCJbEK/KICkP5LTgiBKEv8FO4HhLMS/aG2JR/oIYbMtuSd3PWHAPNze3vuVbjA7PFXA/OJaZe1IFCng6tEzTsrUbjC6u4kmvYSBjlMfib2kUPiB/56M0xIazzHUKqMyQXJ2mxfS3hRa/HJsjUPdxieDBLM9paoAOUviQ7pU+bfgcUXW4LnESpyPC//ttiNte/1nIWnGhx/pgzr+cy33IlP7PIHIeL/XC5VwQer+UclI3Y3xJ4MV9Gfw9CBJjVEPxS6ayFGYOAIQorps8V/GHiF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(396003)(376002)(39840400004)(6486002)(2906002)(316002)(66476007)(478600001)(54906003)(31686004)(110136005)(4326008)(186003)(2616005)(66946007)(16526019)(86362001)(6666004)(83380400001)(8676002)(66574015)(36756003)(5660300002)(8936002)(66556008)(31696002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2VpNk1GNkROTm52RkRocDcwYnl6c2RmSHJ1SnR0MFQwdVJ0ZU40NXFheXFS?=
 =?utf-8?B?RSs0bFFhOHE5M1Fob1JQRlI1a3pESnRIWEVITnhxeUV5R2w4WkVHV25saG40?=
 =?utf-8?B?TXdwWVNWbDZOTFprY3VVam5BblZOVE9TZFpKNTZSc0RZekhSendsRDc3ZkRy?=
 =?utf-8?B?azl2NnFJUmFPZ1dtaHVQSnVUbStYMWRGWWMxbUZKeWZqNkIwVEJLRnRlVFFs?=
 =?utf-8?B?MEZENGhjTElTcVhKOGQ3b2R5eFhBOVhJaTNwZHRPMjhtbWluNFVQWnRMREhi?=
 =?utf-8?B?cFN0ZEM3eEY3UGIzUTFBcnBFN0ErTjlSZHpaSkpTMjM3UFdLemRZUmR4UXZ6?=
 =?utf-8?B?OGNOQzNxeW1FVUUwVUpDVjRwLzl4M1BRREdadEFNSDhoZlR2K0RsUlRPSHdW?=
 =?utf-8?B?cDNJa2k3VFl1Qkl5czhGM3NTNlRuSkpJRWRscVRXMHVBS3lzNzNUZ3AzVXRM?=
 =?utf-8?B?N2F2Q3lmWkRjeU5NOFB4RnNyaE90YnlhUCtCZlVwQmZKL1lwbk9pNENUK2pK?=
 =?utf-8?B?K2xEUVIzUnRja013cHlxZE9KUXNVMW9Od0JKTkdBN21OZ0dUOXZUemdXREhT?=
 =?utf-8?B?MmlMUW1MeDl5WTl3b2k4Y3FEREwxUVNuTndtYjBnRTlNTWQvQkhLYmZ6dG5B?=
 =?utf-8?B?NEcrVHY0RTRqNzBBQmJDb3FzcWdKNjl1WlZOMTdSYXRoS01oVE1mSCtHSVpq?=
 =?utf-8?B?UnZUdTlZZ0NJczB4bDFPRWU1YlV3VG10aXUzSDUrcVpZMm5oTWdvT0lkQ2tu?=
 =?utf-8?B?R2N3UnJmYlRweFkyY3FML1pNQnVLWWtMMWh5emkwZ3BxaWNhcmNVa0svMmFt?=
 =?utf-8?B?QUttTDFXQWF0WWZQYVh0WDBnbUtFYnRmbTlIck1icXlUVE1lcy9lZ1BYR2hQ?=
 =?utf-8?B?OUNud0JqdC9ROXVLMFJBZU5nY1Z6bnE5dDNIOHZUb0dZbU5LMmMxQnV2QUJE?=
 =?utf-8?B?Vmc2cm45WUI4ZDFyQzROMkZyS0JTc1JnK0UxTEtzRkdTZG4vSWRSQVhnTEZN?=
 =?utf-8?B?WkF3elRwWVNubk5vM3lQZTdqRFovM2dReG1FdVE1YS9iZnFLSSszVlVqdzEx?=
 =?utf-8?B?RDJsclpVa1JiWFNQOHBsdGJFOU1RMHRUOFlEaThON3VhVFN2MzVSak5DMXhD?=
 =?utf-8?B?WDFCdXNxOTR4ZGxTdEVBY2x5NWNXZU5KeDg5cXNUSDZpWFIwVDhXbUZKcHVm?=
 =?utf-8?B?aWl5L25OYndqdUhkK3IrcFZvUUZuRmtUSnVxcUF5eTJsSkF1cEdxMDJmSDRu?=
 =?utf-8?B?NEdFR3Z6ZFRNcTdFU2g4RWhYRUVtOXhkYXFPdVZvVlFXYWJmOHRQd1ljUVA4?=
 =?utf-8?B?d2tEVC8yU2NmaS9jMStCQUIyRkZqTWVqSlZ1R3J2cFFEb2duVm9odGlQemR1?=
 =?utf-8?B?QnYzM2JQNHNaaGxvbDJmYU5ORk5vaVNaK2FmUXdlZEVMVVF6WFNDWHJFVm84?=
 =?utf-8?B?dlBiVm9EVCtjemJwVE1mSSs0ZXVHblA4ZWJpMXQ3SmpvT0VDdlU1YkpheXpC?=
 =?utf-8?B?YWFuVXZTb09lbmRJekdhNk0rVmRBZ0xxMG9CTlNYdGw2Tnh4VERaY2RLUnhS?=
 =?utf-8?B?UG4wL0hBakgrTHQwcEM3MGo2UUZUamU0dy91eGpKaE1rZ3B2VmVCQURlRFdM?=
 =?utf-8?B?MUYvalFXR3A3MWcvQkhqcE52ZW00L2ZxUG9jWnFleVZoUW1qOVBQVWpuOEht?=
 =?utf-8?B?b1lwMVY4MHJzamc4WnFiNktNc2VXQThUVGlScXQ0SnpEeVlGYTZTNldmV1pr?=
 =?utf-8?B?eC9xYmN5YnhaSDhIcUtmMGQ1RUlRUWU1QWpFSWtydG52TEFkRzYrWEt3bHlI?=
 =?utf-8?B?Mkx6Q3RkdUhZa0FmVWcwL1NzcjB3UlV0K3g3YlZ3ZUtJNEFRRnlPK1UvdHpF?=
 =?utf-8?Q?Vy6sT6jQhXLnP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 158f92f2-fd50-455d-7cef-08d92ff7b3ea
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 12:18:37.4021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tk8/Y72JflyL4wtWqFUhE347FoK0ny43vyJRYFuSznwn3QZ5b5XND2HSPf18HoO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.06.21 um 14:11 schrieb Pan, Xinhui:
>> 2021年6月15日 20:01，Christian König <ckoenig.leichtzumerken@gmail.com> 写道：
>>
>> Am 15.06.21 um 13:57 schrieb xinhui pan:
>>> Amdgpu set SG flag in populate callback. So TTM still count pages in SG
>>> BO.
>> It's probably better to fix this instead. E.g. why does amdgpu modify the SG flag during populate and not during initial creation? That doesn't seem to make sense.
> fair enough. Let me have a try.
> No idea why we set SG flag in populate years ago.

That's pretty recent IIRC. Felix moved the code around a bit to fix 
another problem.

Christian.

>
>> Christian.
>>
>>> One easy way to fix this is lets count pages after populate callback.
>>>
>>> We hit one issue that amdgpu alloc many SG BOs, but TTM try to do swap
>>> again and again even if swapout does not swap SG BOs at all.
>>>
>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_tt.c | 32 +++++++++++++-------------------
>>>   1 file changed, 13 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>>> index a1a25410ec74..4fa0a8cd71c0 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>> @@ -317,13 +317,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>   	if (ttm_tt_is_populated(ttm))
>>>   		return 0;
>>>   -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>> -		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>>> -		if (bdev->pool.use_dma32)
>>> -			atomic_long_add(ttm->num_pages,
>>> -					&ttm_dma32_pages_allocated);
>>> -	}
>>> -
>>>   	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit ||
>>>   	       atomic_long_read(&ttm_dma32_pages_allocated) >
>>>   	       ttm_dma32_pages_limit) {
>>> @@ -342,6 +335,13 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>   	if (ret)
>>>   		goto error;
>>>   +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>> +		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>>> +		if (bdev->pool.use_dma32)
>>> +			atomic_long_add(ttm->num_pages,
>>> +					&ttm_dma32_pages_allocated);
>>> +	}
>>> +
>>>   	ttm_tt_add_mapping(bdev, ttm);
>>>   	ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
>>>   	if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
>>> @@ -355,12 +355,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>   	return 0;
>>>     error:
>>> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>> -		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>>> -		if (bdev->pool.use_dma32)
>>> -			atomic_long_sub(ttm->num_pages,
>>> -					&ttm_dma32_pages_allocated);
>>> -	}
>>>   	return ret;
>>>   }
>>>   EXPORT_SYMBOL(ttm_tt_populate);
>>> @@ -384,12 +378,6 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>>>   	if (!ttm_tt_is_populated(ttm))
>>>   		return;
>>>   -	ttm_tt_clear_mapping(ttm);
>>> -	if (bdev->funcs->ttm_tt_unpopulate)
>>> -		bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
>>> -	else
>>> -		ttm_pool_free(&bdev->pool, ttm);
>>> -
>>>   	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>>   		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>>>   		if (bdev->pool.use_dma32)
>>> @@ -397,6 +385,12 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>>>   					&ttm_dma32_pages_allocated);
>>>   	}
>>>   +	ttm_tt_clear_mapping(ttm);
>>> +	if (bdev->funcs->ttm_tt_unpopulate)
>>> +		bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
>>> +	else
>>> +		ttm_pool_free(&bdev->pool, ttm);
>>> +
>>>   	ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
>>>   }
>>>   

