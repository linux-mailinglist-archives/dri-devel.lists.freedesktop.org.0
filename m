Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EE83EDD61
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 20:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B03B89F55;
	Mon, 16 Aug 2021 18:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2057.outbound.protection.outlook.com [40.107.96.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B672989F55;
 Mon, 16 Aug 2021 18:54:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6DShGAaUNyRM329EWQwWj1Vo9c7S7oBIJ6CAKHGrGlrWgM54idDKJmw45UcRoAcLxZaXuUXdxRRA0buvQQ99euUxRI9cqKNMrlFrXqxNBReml3qTx4AsrCkEiDgEt+xZvwwVfS9iYlUFPSJC4j9W+3Y2yfn+fdheSbj71MdroFCBvNp/VgmRQujl2wctDEBI7raTq5xh5slo0cnmZyxIAe/mIBBxLU/CufLQNOFKJ/pG4kW1G+2K0xZ6c124PjkOUv9D8gqazLLVzxLv1AXQvwE/DkEac4koqXJGkh/kv43QGYbNkTA5pzoywmyZp1kM25RrOctrlUNtni60tWwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3bwmqksWWe68qYd5qNwQTIE2TaOCg+PbN38JQb0Efc=;
 b=Fe7kL1NCz9C6YferRQQfj0AsV+kA8HYA+6hMR1K8JxIhWWr/wbaRLnZMp0quoX08CYmLd7LX+b6VaJ8s1r04RHrLHQx9okJuTAWmT6Lhul+E6IfZJgKE6yC48YrwjCCDcwiLtzeVJA+BGANhkd7Nkz4mrr8NoQVjrAbMUur5aFbkusTJAGzcYa4K99mXDOjLW8wkjxtA9+a+9NcQBHIoANk7KpA/o69Tjdjs+D/v0ytEK0DPIAZ77y4AG2fZOASRP3y7tORUEWvB+NwE7FCQnfvVC/6diqPGzR9yK8QCNkJSIXxNqpd34rF9NjSqraWQunnSAnhSRUZEG8c3ohSZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3bwmqksWWe68qYd5qNwQTIE2TaOCg+PbN38JQb0Efc=;
 b=Ks8QP+Sp0xNQ4wI9Y/46tydoTDU8apiV+66s5IaeB1/dQpdC6o0p0UB+na3rprEzUab8uvu2J7orlQnnfTOXzPtsrtKQZRwJeproknBWuPlGAz2HWah1d5Ja6//6AcY4KjMz99pFk2mT0CrdtR1V2Uh3aIvBE8+QmTzxrfwt7sA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5355.namprd12.prod.outlook.com (2603:10b6:408:104::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Mon, 16 Aug
 2021 18:54:33 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%4]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 18:54:33 +0000
Subject: Re: [PATCH v6 04/13] drm/amdkfd: add SPM support for SVM
To: Christoph Hellwig <hch@lst.de>, Alex Sierra <alex.sierra@amd.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-5-alex.sierra@amd.com> <20210815091000.GB25067@lst.de>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <0ecf3253-5c77-e982-981a-b340ff705838@amd.com>
Date: Mon, 16 Aug 2021 14:54:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210815091000.GB25067@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.47.3) by
 YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Mon, 16 Aug 2021 18:54:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c6874b4-bf08-4bc7-cc15-08d960e74914
X-MS-TrafficTypeDiagnostic: BN9PR12MB5355:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5355465B8E0757A636CEFF4292FD9@BN9PR12MB5355.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LOUrCJasW0uQhXwTMS3bW00UBl1YcJOVchsyCDlDw4XmRBO1orOKH+oXf98Ct9bTaq+lLFoTNF1cvsFJ/Oj6819Povb+CG3wScKMY1DUw6QzcM+zYghCgy0FYaWFP65eWNqf1QbHDRHOUyn7YQ5Ehoq+t8EtwHAhejb326gfKngONixZaxyLzFVT6/L0FxAxCz9j7nqqMtqWm9tS0ybo3rkzy2Ukks4bkj6G+atWsAXsYti+CRRflx0Xr7wqFAlp8kGEqx7w8TdSlE1TcdMhz6tyuxbaDNj93Hy1R7wgPzX6+CDsVQxAGmrRrHSP8m2RX9qZ/Iw2Moc5Zr7CkC3bfmkyZIYS5l851bZmNb8UA3kHtFLRAr561nuD0YhAeTJUaxBzHOxKu2i/8XtIjpoK/6xYg7VSk/j+tGalNuWh5+W/0T3IumCFlpLOY4da02bVwq/MQZ/RhvK7nZTscVB7Hh+sQpFSoIo6YxJBUoNSATlZNlq3I27IdiipOq+8nKAheTgjDePrEyH2dli0/2CqfVxTafhiZ/BVP5GuXzNeEcJeQ6Cv04bnGMdlRBHR7HplqsdLnbGCB1D6g6EwxZe9kp5PHyhcwx2Z2XPrgP949dFonv75QQ38MJRHz80MWGoJtewqcBnHNkm52utTlQF8m+LaadhHz/0EgaajMQjs/k447M3KYsx/RF4A2fYa24xTJWUa5ZqhK+NvUqCtaV+BQCiDaI3X3YlNiQJaAibojNxrVM3IA/zP2D5ayMYPTFzG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(6486002)(38100700002)(8936002)(66946007)(66556008)(66476007)(186003)(8676002)(6636002)(4326008)(2906002)(7416002)(44832011)(110136005)(956004)(316002)(31696002)(478600001)(5660300002)(16576012)(83380400001)(26005)(86362001)(36756003)(31686004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blZEUEVlYmxEdUt2aEtBSHNBQVhnK0tPYUZXbEVGb3JIa3pmbzFwZnNsT3pv?=
 =?utf-8?B?WE9lNGNNL3BTcnFkNUdzVEh0ZXJrWWpKWGRkWHcyd1c4RnRVVk0vYmVIOGJM?=
 =?utf-8?B?TDlNT3ZFL1N3bCsrNzdlYzg3SnB3L05xZnE2K0hGTmIxNEgxWHl0TnhyWWlm?=
 =?utf-8?B?cVlSc3BNaEx3Z09OQ1dJaXJ6dllvZjgrcDI1ZnZMQXRCMmJHUThZUVJqNEo5?=
 =?utf-8?B?dGNCTFhuWjZTb2FYVXF6elFGblpxa2lZU3ozOWgxUHk4ZUQ0T3ZSeXMvWWR3?=
 =?utf-8?B?L0QySVh2dzhjdHNNbDMrMU5mdXNmYndLY3RCTkdGMXQvSi9FMlVqQXBTY3Bh?=
 =?utf-8?B?ZFlMMGQwbHlSUEhBQU1xTTh5aFJGZnQyT2haMVVpNFVaNG5jdEdCNFl3LzZN?=
 =?utf-8?B?eTdEdU1TQStnM2Z2VlZ4eFBVRURiVWU3cE9ybUZ0eGJJU1Zxbk9seXU0RGcw?=
 =?utf-8?B?WVBJOHlGYmx2NVFlUUNaV05WNjZVREMvUy9JNkJmclF1R1ROczR1UkhqR1li?=
 =?utf-8?B?UmdVTjgxNlZHMkFLV0FjSFgxcEdWTGQzSVRreUFjMXNrT2diMklDSG9ta2Nq?=
 =?utf-8?B?bDYzRW9JY1Z1NTEwSG1LWUN4UzhNc3J1RVZxcEc3a0RHd09vUExlQk53bFVS?=
 =?utf-8?B?YWFYZ1VpVkhvQStZUHI5Y0ZxczJQWW1rY2hlaTAxck9RMVVUMWlsTG4vZGJM?=
 =?utf-8?B?YW9vc3JmcjlJUkIzQmY0M3plTHREazZvZGFqZnVoeGhnd3d5Q00yRHJjM0Ry?=
 =?utf-8?B?YUY1V0VKWEgvWGdwaGYwcnRGelJTb1dUTzY0a0RMcll6dG5PM2lCQWFwbnhB?=
 =?utf-8?B?L2FYdWtVUjdBN09YQ211VlNTSERHSnZsaXgydld6bjUxT0RENEdlbVBOY1Fv?=
 =?utf-8?B?ZzBhR0dFT1F4V29SYThIVHlCUXdJWEMxV2hoTjYzYWJCNDRlWUNHbUg1UjJW?=
 =?utf-8?B?ZWxUQU91QUh5azlBNVNTYjhIVm5PSjE4bTZObnRidzFBdFk1eEFGZ2V0SFo2?=
 =?utf-8?B?N2NDY1VJelF6M1ZmTW1QOXMzN093ZndvRmlZc3pidHJLOGRkV3A1azRRV0JP?=
 =?utf-8?B?U0FlU09IRnhGdHpSOXZlOTVmWDdWNGFUZHltMEhRTG03RlJYVEhKTkdZb1BN?=
 =?utf-8?B?bEZyclFUMVR6S2ZjL1UvUnM3UzVnYTVBSE1rZjJ1c3lSdjlDMHNadjJxeElW?=
 =?utf-8?B?MjlMckIrSmtYaGlnTENlakRsL0ltc3Bmc3drNlZ0OW5SdVFxV2RtYWxiS2k0?=
 =?utf-8?B?Z2ZWeHh5dnJCanZBWXVNTjFmOVYxSWZmVnkyNlpKUURFZU8wVWs1UWF6RlU4?=
 =?utf-8?B?b3NKK3l2V2ozd0lBQzNIL0pGdkI2MVVPcm5mZkpKQjdsdXI1VEtlZmJsRldB?=
 =?utf-8?B?NVRiUU9NeEFaZ0NKNTRQTHluSnNzS2Z4Q2Q5a2FGTTFTTnlWU1Q5UEZWaWxG?=
 =?utf-8?B?MW93V2FJWGl2bm9MUjBOOHU4ZVpZK0MvQTUxUkdpb0ZxdVZmWkRYaloyaC8y?=
 =?utf-8?B?SU9RNGU4Rnl3cXR6T2hkb2M3TUZmczlhSmtJU2ZCZ2E3QzdoZUJQWFZ0NE5G?=
 =?utf-8?B?T1F4aTlQYVBhVGdTeklUNVQ2VTNxTTNGQVUzdXZ1M0d6YUsvY1JhdE1CYXF6?=
 =?utf-8?B?L2pzU1pyNmEzVGduWjNwZ0hFTFhjTFBtZE4wYkFWYWMrZkFGdk9WakVNMTZn?=
 =?utf-8?B?VzNMcytaL0QzdWRUSlE4TmdvTW5iQ3kxOHNLSWtURm81L3B4QVF5bXU0bkZF?=
 =?utf-8?Q?m9JloXmhhYI0wkNvbehIj83KgCadryVq+AeSPsw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6874b4-bf08-4bc7-cc15-08d960e74914
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 18:54:33.1020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsyEqJVYdnFUX9AVT81StrRAS+R5i+7Q9A2YHhatS652xIF9X2/3f3/BHuLqB8YhUXJFVBiWC7+eE2lyrYGOCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5355
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

Am 2021-08-15 um 5:10 a.m. schrieb Christoph Hellwig:
>> @@ -880,17 +881,22 @@ int svm_migrate_init(struct amdgpu_device *adev)
>>  	 * should remove reserved size
>>  	 */
>>  	size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
>> -	res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
>> +	if (xgmi_connected_to_cpu)
>> +		res = lookup_resource(&iomem_resource, adev->gmc.aper_base);
>> +	else
>> +		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
>> +
> Can you explain what the point of the lookup_resource is here? res->start
> is obviously identical to the start value you pass in.  So this is used
> as a way to query the length, but I'm pretty sure the driver must
> already know that as it inserted the resource itself, right?

I think you're right. We only need the start and end address from
lookup_resource and we already know that anyway. It means we can drop
patch 3 from the series.

Just to be sure, we'll confirm that the end address determined by our
driver matches the one from lookup_resource (coming from the system
address map in the system BIOS). If there were a mismatch, it would
probably be a bug (in the driver or the BIOS) that we'd need to fix anyway.


>
> On a slightly higher level comment svm_migrate_init is a bit of a mess
> with all the if/else already, and with the above addressed will become
> a bit more.  I think splitting it into a device private and device
> generic case would probably help people finding it to understand the code
> much better later on.  Even more so with a useful comment.

I don't really see the "mess" you're talking about. Including the above,
there are only 3 conditional statements in that function that are not
error-handling related:

        /* Page migration works on Vega10 or newer */
        if (kfddev->device_info->asic_family < CHIP_VEGA10)
                return -EINVAL;
...
        if (xgmi_connected_to_cpu)
                res = lookup_resource(&iomem_resource, adev->gmc.aper_base);
        else
                res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
...
        pgmap->type = xgmi_connected_to_cpu ?
                                MEMORY_DEVICE_GENERIC : MEMORY_DEVICE_PRIVATE;


Regards,
  Felix


