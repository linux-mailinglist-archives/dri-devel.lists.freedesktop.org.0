Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9154C9056
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 17:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D726210E65F;
	Tue,  1 Mar 2022 16:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E0D10E641;
 Tue,  1 Mar 2022 16:30:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTB/ibcPHaeW9A8Vvr3GRAi9LBnFk/zIZ4O2vslInrk/7EgJyg1ruAyiz/RN5hlAy2Y1qJ8ZXLGjICjgpNmbEiKmDzdeNPiD6bmuASjXTf/se8DvTUD3tEzq0ZUOoaXGbgW9eqT2YQe7P9GjH3e0HV37Gx2vM+ywSDymqG2dgDjEYMDZ7j5rfzMzrHf0OPUIWgz9DrntVp6masVdsXTZQqLx/fngTYHNszT9mi9oxSRoj/Mw8enRNPyKUW6G8QPQG3NmpBt+wuwPH5k44TBo60nGrDdCbiW1aquAq1e2/hse703fYz1x+bq/5Byu3FW8YDPxQwM9wzAK+J02X2ptew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO83ZQujlW8PPDU506wktrgF4ubhHsRCSVhr9JL4lMY=;
 b=NuVxBlNfag05kB/QUh+TVtOu8ZTwEfpY4ZTE3G145QxaPn0x1kB/18ctW4iadSd6ary5wE1jQ8IhTjy8WfgPyTshpaH4aze2XwrSq3Mq0q8tq6cVmedVlCPnAEsMX5w3qj8CwDHC9ES+JYmwmePl0So8Q3ouIIXjWHGwcyfJTd+qWrdS1TJqZO2wHG1wz/eooDpQrV8mlAmlKvmvP3dTPN5vD78xz68hZckidGL9hNvpto0NdZAtKqsmG4WgGXZDnVjafSQ1p5u5I4GmyXH9OY7klWKid/NryoChSnSRuV10mCH6UIchdzWpPRSYrlAG3OSPkgW1rlZ4ETjPvNQLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO83ZQujlW8PPDU506wktrgF4ubhHsRCSVhr9JL4lMY=;
 b=btHwRBVQiinUA5lY/oJo+Y8HWL2GlzMWnt+IEz4j8I2qSEgJZ0P2LItus7HvGlmNwejmwrVK1s3DBBXov7qxMeUkpOqfWoaPC58FgvyVXTWNyHtnYIKKaGqfErLFgelQGOdyIoHaelAXtpdaasfBGkP0STZZFBcw28ck3ICo8Fg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB5841.namprd12.prod.outlook.com (2603:10b6:8:64::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 16:30:16 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::410c:b456:62cb:e3f]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::410c:b456:62cb:e3f%5]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 16:30:15 +0000
Message-ID: <353c7bbd-b20e-8a7a-029a-cda9b531e5e8@amd.com>
Date: Tue, 1 Mar 2022 11:30:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mm: split vm_normal_pages for LRU and non-LRU handling
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Alex Sierra <alex.sierra@amd.com>,
 jgg@nvidia.com
References: <20220218192640.GV4160@nvidia.com>
 <20220228203401.7155-1-alex.sierra@amd.com>
 <2a042493-d04d-41b1-ea12-b326d2116861@redhat.com>
 <41469645-55be-1aaa-c1ef-84a123fdb4ea@amd.com>
 <bfae7d17-eb50-55b1-1275-5ba0f86a5273@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <bfae7d17-eb50-55b1-1275-5ba0f86a5273@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::23) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c1b39ad-8441-4e24-fbf0-08d9fba0c444
X-MS-TrafficTypeDiagnostic: DM4PR12MB5841:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB58414ED519503AB91A21073F92029@DM4PR12MB5841.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2RHjxcfbnVmXZXJg9YLk9dBSDZTIIIZtw2cKx8kJdgNQtA0/ifek/qn/oXeCP7WtQBAwTjFGMJrwf67rBEkRMukZ+wOjtNVPVKbLvjuTwYR+EXpvQ/16ifR0Zj6Fd2dmz+R95JJZwnI6hth45Gtx2PwZs9quoQRY6SewbNL23nZ2VKmK1DKGr70OLkj6v48Zd8cWg/JxYFWKsxFcCSDlkU/HPZAHZVkN1fpPm0CIZ0ylZgb5V4HNEDxD2sOiIN9AcXohYzio/Rmuor3YJ8f90mWA54byKvwgp3t2c/dNip3i63s44HaI/QSOieteec+HmFsbHEdmUKeZ9p7oMv2qy0BvCLcXg24t3SkWCpwCfc0c+SUew1kK6u31f2C9NOhWMQG4/88NjokarMi0qYZ6/aY8o7llBG7IQGU/LNO3tZrBwTGcoal8XjgRZQOZNBioQgzK3hFvv7EZkEMN0KBenLxLZE4obbuuGfi8BN+EY6aPLTSo+jfWdpTM41IjYhvCO8ifbNIY0rB5TcOWEZdpG7qcP0aMKYlHRgmHyDXtJD+NJAmhfaqKkXUhU699YWstv7jWhcypZVe7drvWaIVcXJsYmVjfAo+Ce2XeMVx/aQ/odOH99RnlkVMHqtKPSvrpGJN6l+TJ7O++HPgtyRPQp3AJtRl/9ZXvLQtpieEMRIIYoDWRkXhuX6qwYBSk6hmsAvmySh2UXESQJhRT9g4HF5ePtmcoBUD4H7qp4jxnP1v3/jaC2oGmdvsgkUybzcE7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(86362001)(8936002)(6486002)(38100700002)(5660300002)(110136005)(316002)(7416002)(2616005)(44832011)(8676002)(66476007)(6506007)(66556008)(186003)(4326008)(66946007)(26005)(31696002)(6512007)(36756003)(31686004)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzN0SkE2L2loMWcyMGduVEoxNzNWMW9qRzZtalVkbXFKRDJ3SEx4a2FNdjVj?=
 =?utf-8?B?NU1aZzJQVDBrWDN3NHpNdFI4djlLV2liQzUrbzU4cGgzL25vaTRiZEh6ZDB2?=
 =?utf-8?B?dkcvYXRNdkNETE1Ld2JTdUJYNS9CTU92emY4elBJWXpHeXozUGh6NXhscElU?=
 =?utf-8?B?UkJ5ZzE1dXFQakFBd2hmVVRSaE40Q1BEbXZNRkt6dElwSGlhUWFuTWR5NHVG?=
 =?utf-8?B?QnFpNzRXU2NCSjQzclhDNWdWbEIyNG1YQTVaMTFucG1KQy8yZk01ZXkvWXRn?=
 =?utf-8?B?OFVIbXY2THBPUDJ2WlM3TGMzZzExMFQ0ZGVnTWhFOTZEeFZOdlhtZ0FsRTl1?=
 =?utf-8?B?NlhvbjlOR3hPRDhGWnJZZTFmcWlZWE9NU1VneUQwZVZKTDZKTVVOSjUzbXR3?=
 =?utf-8?B?aStzUFRSSE5BZVg2SWg2UDFrU1Zpb056bDA5N3RSUnhWMG1BT0Fid1dxZ0tx?=
 =?utf-8?B?Z1Nod1c5YzNOQ29LVXp5SURUQUFOZVZGNGhsdllsSnZpSnpBaWlaYTN2YnhV?=
 =?utf-8?B?NGZ5c1dsQ2U2MFIxTU03VlpueWhTeVlzZ2dBWVZGY2JyVHZZNEo2QmF4Mmpz?=
 =?utf-8?B?TWZ6L043R3NNaFhBWHEzcjZXcER6cUZzTTUyNDhramhtamNQQmFJbTlnbm12?=
 =?utf-8?B?U2ltcERZWmE2d0cyRzFtdEdYa1RTc0pETUtUYlNwQXFiS29zRkVsQno4V1Y1?=
 =?utf-8?B?OGpQRzE2N0d2aTd4V3ZoMlg0eDlGRktQa2xsQ2JPQ1ZWK3dHSE1rUWdBdU5U?=
 =?utf-8?B?TUMzSjlMbk5jZWVlUHlweHkvRlNuMVlRUTBFNmlQM3lmWVdwclVmRnk4SXNy?=
 =?utf-8?B?ZVA3T3ZWNW1XaHVYaStzVlVUQWJTME5jMzRLWXBoeEJPN21aano0dUE1US9I?=
 =?utf-8?B?dDRNQk02aFVCY05oRC9HQnRvUENkaGNGSmdZYUJhQkg2T21BSkMybTZYTkVD?=
 =?utf-8?B?aDRHMzRBaUlISXY5OElWTEVDbExkbHJRTzdPY045S1RpQStrZDFXdmpOSEEr?=
 =?utf-8?B?Uk51dWVRT2FNS0haRkpkUWh4c2FtUmQ1RjNnb2RYeEZ3TmhFRXlDbm1LWkJy?=
 =?utf-8?B?RmxLand4aC85dkdiNEdoNlJGYjZPNGlZSlJLODJXRTZrRWo3Y2JibndwWmpz?=
 =?utf-8?B?Lzl1S0JGTkFoNWRHUDI2SUtPMHV6VmtLUkRWSVZMU0p1c1ppT1FWUUF3QnBk?=
 =?utf-8?B?a3JzS3NUbDBvUkUyQmVSdmluYWpvcGhZZVR3QzVQZUFHamRvVkoyV1hQZ0RG?=
 =?utf-8?B?VGlkUm1lTm04OER3SkdLTS9PU1lqd04rcGFvUG9OTFNhWXI4YnRjWFZvUC9G?=
 =?utf-8?B?Yk1UVXIrVnd5MmcwZjNsZ21wUlJyQjhXeWFmZStEc3A1cTg3NkdlelNQc2Fy?=
 =?utf-8?B?YktyRVZudEo4allEaWxjeE13dXlxUDRMdEszT1h3RHIra1oxclQ4b0s3VGdC?=
 =?utf-8?B?aHBQL2ljWG5qeXRPQ1duM1JTajdaKzIreFRhQnVmYkpzWng4VlJKYzZDRklk?=
 =?utf-8?B?Ykg5Mk5MZEwvY292cWNjN2hvWHRzZTAwVVN6SjY4aS9BL1l4cUdSSkZRblVB?=
 =?utf-8?B?N0RZdUNBNkJLQWhQc1V6M0RTOU9NdjE1d0YwZk5jLzV6KzJTMHZQeGlXMTVl?=
 =?utf-8?B?TzhubnAyQmtCQTFIZ2s4NC8xNEpuclpXVnh5bFE4ZDhoZzAxNEpIelNmWkNh?=
 =?utf-8?B?aXJGdjMzbzFWUWJINjVYd3JVK2JsaUlVTldXTVBMMXBNNjJQVlN1YkJsRGdY?=
 =?utf-8?B?dXJYTytJdlpBUUtXblMxSmQ5UUhsdHkwd3dHOElqMHNlbk1vVTdaMVltSFFS?=
 =?utf-8?B?amZVWjRGTVNLdXBIS2ZFZTdxL0VnZHE4V1ZvMEdLQnFoOEdkOWJPWHJBc2xl?=
 =?utf-8?B?M05oTXNPZ3cvK3BNSXk1UnZCTkpGcWdZZjg4SWxLWHJXNXZ4RWQ3dllHdWFP?=
 =?utf-8?B?dmVGbnFUODhyMU5oMGIrSU5MRXYzR253RzByUXUybUZIVkdJN0ZpbWFHNFp5?=
 =?utf-8?B?UEVET2hCZ1VrcmNHd041TmpIelRFS3JnckhLUVp5T0FRUmxnWHRUT0g1R295?=
 =?utf-8?B?cDRBVXE2Z3B3TTVLWU5jZk1vbzlhL3VQL0V5aTJEZHlCdWdENGNrbTVNb1U4?=
 =?utf-8?B?RFhTR3ViY2tzcTdmYllkRHBqL2RUdUVBcnJxblF2OCs3OWU2NHZCdVZubitF?=
 =?utf-8?Q?VxiuxIGsh3Zljiqo6AqUSxI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1b39ad-8441-4e24-fbf0-08d9fba0c444
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 16:30:15.7080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aRSG0e4IShIfDWR0J1jrUeEoFUk3UEXjGT3BNV5FnoK0QDtBRWrwnkJVwVocCSbD7/al2ia1oyoHBfMSDTHgIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5841
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
Cc: rcampbell@nvidia.com, amd-gfx@lists.freedesktop.org, apopple@nvidia.com,
 dri-devel@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, willy@infradead.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-03-01 um 11:22 schrieb David Hildenbrand:
>>>>    		if (PageReserved(page))
>>>> diff --git a/mm/migrate.c b/mm/migrate.c
>>>> index c31d04b46a5e..17d049311b78 100644
>>>> --- a/mm/migrate.c
>>>> +++ b/mm/migrate.c
>>>> @@ -1614,7 +1614,7 @@ static int add_page_for_migration(struct mm_struct *mm, unsigned long addr,
>>>>    		goto out;
>>>>    
>>>>    	/* FOLL_DUMP to ignore special (like zero) pages */
>>>> -	follflags = FOLL_GET | FOLL_DUMP;
>>>> +	follflags = FOLL_GET | FOLL_DUMP | FOLL_LRU;
>>>>    	page = follow_page(vma, addr, follflags);
>>> Why wouldn't we want to dump DEVICE_COHERENT pages? This looks wrong.
>> This function later calls isolate_lru_page, which is something you can't
>> do with a device page.
>>
> Then, that code might require care instead. We most certainly don't want
> to have random memory holes in a dump just because some anonymous memory
> was migrated to DEVICE_COHERENT.
I don't think this code is for core dumps. The call chain I see is

SYSCALL_DEFINE6(move_pages, ...) -> kernel_move_pages -> do_pages_move 
-> add_page_for_migration

As far as I can tell this is for NUMA migrations.

Regards,
   Felix


