Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC167EED07
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 09:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5633210E71F;
	Fri, 17 Nov 2023 08:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EF910E71F;
 Fri, 17 Nov 2023 08:01:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cz5ven0tm8MC0EEp+Ga3YgaR02zUANtMZ80e+2CVzU1fVquWB1iYjPoTCo2LXT5VEzign6UoB/AF0GnFrYYUZ6tfJXq3nv1n3sL28z1X+P1ZzwgABJVOJnS4wIJi9CI7SE5JzhJDeHsH6ccjxX1TJhTwgiNoHY+uWcc4zK7urZtgXkQWMO3ratrQNpggqqZhcwUoK08I+JEEfwcm2CrXAZ5CWmflV0iJRyMEAx53Ibtn6G/Z6AHISTd2I+UnaduGmPza+h5uXlr+ig+oNeZQLzVlfA3D5WK9zMnnD51Mo0hEhPTywI8cOPfUhkk7lQ5S2sd+qOgmtLfy2/KAK/s9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjE1DdI91HBiCL+9OlfK6BWSSi6l9/tHRjfUd1QnCVA=;
 b=dQA9LRXQpW3NUmayYL3tlLF06FMIlZLqDQ+GLqKoW3RLj3Aqh1JP8R94IbxgMTEPHYqjxCPjC2J+VPToDKLOS3qVr8IFzw4X68/pOQZlcFC/YR4YUkzIm1Q+DHh1Kuf0wMAOIxZLvLjCAMLSPvv+RVtuqOskRMocPniaJPZdnwHd49ZnfDyOyq8jRvHfIziOvJN81itLxeCmJbN915u8UjcNhKqLAja6YRwUkCf+0XcKvUnIS8fbFPhRk3/9A2Zxno9gNgjkcVIsAOH+xJERUOLaF19IZ4ber8bIyP9oz6DS9CCXpP5PIJZN1FMLurhgSwbk/0VZ5t8dLaNRrhzWFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjE1DdI91HBiCL+9OlfK6BWSSi6l9/tHRjfUd1QnCVA=;
 b=y9/jSeYYcVVYUMQ+umXDg2LbrPEJSlqxfi5h6Sqhd2bXXgPRNmne3e3Ma+TwBQgQJXEh7jpMS6etwT5XfG/PIc67fgRlccKh80LZqYggucWH/pP83Ntmw2c1TAx28APnM3243fbjBkQQtj4afS3lhlUmA3HN4PkHeGRXlO8cv8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB6835.namprd12.prod.outlook.com (2603:10b6:510:1b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Fri, 17 Nov
 2023 08:01:05 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 08:01:04 +0000
Message-ID: <831efaf6-3926-421d-93d4-c89f147b3cac@amd.com>
Date: Fri, 17 Nov 2023 13:30:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-14-Shyam-sundar.S-k@amd.com>
 <9e6c4a42-fbce-c5ea-15ce-5eb22fc3767a@linux.intel.com>
 <84af64f2-42bd-4e09-a1c9-bde2a935c8f2@amd.com>
 <92bba3b3-a3f9-4fab-86c7-4d0ef4c23fcb@amd.com>
 <238f915f-b95f-4d85-ad67-66781f53e75d@amd.com>
 <c8ed2e1e-77b9-459e-b81a-e95db4d22a9b@amd.com>
 <80fcdcb2-1a22-4002-9bfd-d6cf15d5a57b@amd.com>
 <0c816746-7f52-442f-aea5-0d8c713aa2ce@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <0c816746-7f52-442f-aea5-0d8c713aa2ce@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: c108959e-b643-4f6a-c48b-08dbe74358bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X26vNgEktJgi79ngUfns7yvBMpiYcM7gjzi+/pDXvtXDwcTmcoLvUEE6Zym8OeNamS/adLOIxXX6A+so84jGSEEbKrLIZSrvvBsyBdISvesWZHXzgkwodbjLS3iJ6MlssxfC8FH9zBtYp9gKtWs+u06v+U04UKCkWs7VuidmuXF8vxv9Hu1KgT35F/nt6tN00tAsf9MmZagqRlQHRCzydwj08f4Y+eY4o2fpNFZxmuoo7+N7IoEJ0uNsyfiM8cLYYpA1MNh6z5XdqQX7MZykq7Oh/SCNVTBrmxrdTlwKoOzxXkyAZPTecw/msW4dInle2Gu79MGhzSSimJFf50yuUYzbwgCMo4nvMxNBWPSBELeVd2QjvtumpA87903FE8NLWtOzovhIZ1r6zHGaGrrxeUaJ4Jh4dGYKeDXJMR/KLcgzGRmH1uIwqZI8SKKIs62puNOw/cvzc3cBzGKIv6LZar2f7Bu+E29faKnzYTaaOLEkpvzER5D3tyZO73IPaPXXwsU8Ui3jY0qOr3aMQYoOyF/L77Z7sh0Fm8PPqgqjFQFyPoH8InnHUayYpiTcHgLIo3zWelW/6VsAjxUD4yaEcI7ugmuG6QGqyW9iL3MO0ntVZxsKq1J4xIMd+kQux2bcWTbZCAfGFZMkp0UzRIiDDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6512007)(66899024)(26005)(7416002)(2616005)(66556008)(66574015)(6486002)(966005)(478600001)(36756003)(8936002)(31696002)(4326008)(86362001)(41300700001)(2906002)(316002)(110136005)(66946007)(66476007)(8676002)(30864003)(5660300002)(6506007)(6666004)(45080400002)(53546011)(38100700002)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QktKZVJnOW9wU3FmM3hJVkFvS2djbEhhVjlQU1hDZjJnbUk5Sy9kdzNwdURu?=
 =?utf-8?B?K1FXcEdRM29ZSk54dmRiUDlWbGdiZ0c0N2QrS3FQVGVFclJlUmljcEtiTDlw?=
 =?utf-8?B?WW05WmdLWTUwV1ZhSG9CcmZ1QnJjTUJoREVXbWVOdmx0aTZNbUhjVkM1d2N4?=
 =?utf-8?B?ZmhXelR5eTZXUDNGd2VINWVKaTNuandkZjJ0ZHVPQ21EK24zclpESTlIRnpK?=
 =?utf-8?B?bkk4Z0tNVlhSZk93K1lkZC9FSmcvaU16Q0tMaVArbnd1NzI1V2g1N083M3po?=
 =?utf-8?B?MVBORU84UU1VWWw0K0RHZ05NdnZ6N1p4YVpHZHkzeVdqcUJpcERyTGRnVUk3?=
 =?utf-8?B?WWNWd1AzV2lzYjVaWnJZWStMYmVnMys2cm1JcHQ3MnNrdHBHblFITHNFQlVJ?=
 =?utf-8?B?cjhSSmVZeHg1dGtNWFVPdkF6cUc5ZFhVNStyRjhnYVpFaDNKUk9FMkFxOWht?=
 =?utf-8?B?VVJ6L2lkbkNHdDlNdVpUcWZpbWx2dTZQK1BoYXRuT01IQVR0ZjB1L3R2RmpU?=
 =?utf-8?B?YXNBTkpDNzZJRnQvY3N2djJnWHMyOHZhU2MxMDFyOUdGMXhlU0NoTlhOeHVT?=
 =?utf-8?B?eXVLd2JmUHZuUVg1ODlNNHdzemwvUTZ0RWcvc2lCZ3pnbldSN3JrbUcvYTJB?=
 =?utf-8?B?Zmlva1Z4dG81NFVMZnYzbnYraDNZWkVDUnpPT0FOdXh4NlJ6T1JRTjg1S1Aw?=
 =?utf-8?B?V2xMQkdrT0Zuc25QUUtJeGlGNWllcExKenpmVmNtb3BXQkZPRlZZRmhlWVVs?=
 =?utf-8?B?akw1czB5ZkZWUS9OaTRxbFhzOGh5WFZnZUViNWQweUZCalZPRDZVWG0reStj?=
 =?utf-8?B?alF5ZGZRMk5QT2FEbzR4SnBSc1JVNWdBMEVBUUtkOVdDZkNpRFRlZDJsR3A1?=
 =?utf-8?B?ZXNwZGlkOUdmd0JVOXpONnlnYXpBMjNEc2YxWURBWmJtdTc5enJqV3VKUm5T?=
 =?utf-8?B?NjkwUDFzZExMcjZzdTZLT2hRNzZuaVBON1o5Qk51WGRDbmVacm9za3NtcUtR?=
 =?utf-8?B?L1k2eEVGUjB1YWVqWVRxczhSYlV5NTFMWElUcFl3bEhUeE96MVlZaUFiTFlQ?=
 =?utf-8?B?SWVQd1dabjdzZXV6SnJWR1FibE1ZUCsyK2hDWVgwZ1pyYkhTRUFtb3EwTnZm?=
 =?utf-8?B?YllGaHBnenJscDBaWFcvUG1EenVlRzU0UGU2RnRIWXFoL3hGQlFJTldTbXFX?=
 =?utf-8?B?Ty9DVEZVcHNMeUFPTmVWaUV0Z3YySC91cWNwSnRoVmJ3R3ZRcXpIMnRWZkQ5?=
 =?utf-8?B?Uk5qOGlrakgvL1ZVT2d1ckdxYjQ3bEp4NDRKcHJHc1VoNjdpVE5JNWxybDhi?=
 =?utf-8?B?ZWlQVUNCem85c0oxd0QybkVNaGJiWUlXZFczSXQ5V2ZWb0pQR1pYQjdSblAr?=
 =?utf-8?B?TzFENnQxMG5mOGlDMmVXcURLK3FEeW95Tk5VTWswZ09CYldESEE1ajByVDVY?=
 =?utf-8?B?OGhmUTBiSnEwTVhxN3ZFUmY3MHAxbjlROGVENUVQZEdUOG9lZHQvd29JVmR2?=
 =?utf-8?B?c1VGOTY2cmVpZWNkcG9KbHZkaXNVTEFjQkZQNTBrSDRqWmxTOXdGMTcwWVVI?=
 =?utf-8?B?dG9ydzFRNWMyOTJ4WUw2RmNJbXFtNTBzVll3NW9DR29YRU11bHUvME4xNGVG?=
 =?utf-8?B?N01wZjJVbDdOVUMydGVzSE95d0RrR1ZhUDNhbnN6UE1JV3dqb1hFQzAxU2hq?=
 =?utf-8?B?UkpoSkxPT25QSTJ0OE15S2xWRGR0SUNvOXNaWVhJOTBXM25taEkvZHRpNWlL?=
 =?utf-8?B?cW9PTFdWV012T1RaeEFOQjB6cCtYVW02bkNRaCsxZUo3WU1JbWdGakRaSWcr?=
 =?utf-8?B?VHFZc0NHdjd3MUJGN0pEUWVWTkZ1QmpxL0lLdVBHUzllVERaMHVrWVdmYVJJ?=
 =?utf-8?B?MWZLS0NJeGlqUzk0RGFpbGN3ZGRrWDNFWHVoTmYzbStXMXE3TFoxM3g1M0Rt?=
 =?utf-8?B?S3JZYW9jWUtqUUUyeEFmSGhNL3lKRzdITGZrdjVPMU9EYzhrcE5EVFlJM0hy?=
 =?utf-8?B?c21PQmdoYTlRVWJ2c3JnL3pJK1V5cDRDMVZoUXdhOTh1aXhqb2M4TmxESzlj?=
 =?utf-8?B?bTY1SkwzbS9xckNNN01GZm1ET2hsOUpCZmpFRHkwaFcrZmNvM3hwME5CdjZK?=
 =?utf-8?Q?oi7kMrrtsAs9by7JBI4RzIi44?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c108959e-b643-4f6a-c48b-08dbe74358bd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:01:04.8841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dfsd56Td+1jWH/makg0UFQ7sGeBEIDS7h6gkaDCF5tKpJ2ntZjFV2XMJB0gndYp3a+BCvl/dxOJ8eD3rWFHPIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6835
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
Cc: Xinhui.Pan@amd.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, dri-devel@lists.freedesktop.org,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/19/2023 2:31 PM, Christian König wrote:
> Am 18.10.23 um 19:05 schrieb Shyam Sundar S K:
>>
>> On 10/18/2023 9:37 PM, Christian König wrote:
>>> Am 18.10.23 um 17:47 schrieb Mario Limonciello:
>>>> On 10/18/2023 08:40, Christian König wrote:
>>>>>
>>>>> Am 18.10.23 um 11:28 schrieb Shyam Sundar S K:
>>>>>> On 10/18/2023 2:50 PM, Ilpo Järvinen wrote:
>>>>>>> On Wed, 18 Oct 2023, Shyam Sundar S K wrote:
>>>>>>>
>>>>>>>> In order to provide GPU inputs to TA for the Smart PC solution
>>>>>>>> to work, we
>>>>>>>> need to have interface between the PMF driver and the AMDGPU
>>>>>>>> driver.
>>>>>>>>
>>>>>>>> Add the initial code path for get interface from AMDGPU.
>>>>>>>>
>>>>>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/amd/amdgpu/Makefile     |   2 +
>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h     |   1 +
>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 138
>>>>>>>> ++++++++++++++++++++++++
>>>>>>>>    drivers/platform/x86/amd/pmf/Kconfig    |   1 +
>>>>>>>>    drivers/platform/x86/amd/pmf/core.c     |   1 +
>>>>>>>>    drivers/platform/x86/amd/pmf/pmf.h      |   3 +
>>>>>>>>    drivers/platform/x86/amd/pmf/spc.c      |  13 +++
>>>>>>>>    drivers/platform/x86/amd/pmf/tee-if.c   |  26 +++++
>>>>>>>>    include/linux/amd-pmf-io.h              |  35 ++++++
>>>>>>>>    9 files changed, 220 insertions(+)
>>>>>>>>    create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>>>>    create mode 100644 include/linux/amd-pmf-io.h
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>>>> index 384b798a9bad..7fafccefbd7a 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>>>> @@ -86,6 +86,8 @@ amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>>>>>>>    amdgpu-$(CONFIG_PERF_EVENTS) += amdgpu_pmu.o
>>>>>>>> +amdgpu-$(CONFIG_AMD_PMF) += amdgpu_pmf.o
>>>>>>>> +
>>>>>>>>    # add asic specific block
>>>>>>>>    amdgpu-$(CONFIG_DRM_AMDGPU_CIK)+= cik.o cik_ih.o \
>>>>>>>>        dce_v8_0.o gfx_v7_0.o cik_sdma.o uvd_v4_2.o vce_v2_0.o
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>>> index a79d53bdbe13..26ffa1b4fe57 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>>> @@ -50,6 +50,7 @@
>>>>>>>>    #include <linux/hashtable.h>
>>>>>>>>    #include <linux/dma-fence.h>
>>>>>>>>    #include <linux/pci.h>
>>>>>>>> +#include <linux/amd-pmf-io.h>
>>>>>>>>    #include <drm/ttm/ttm_bo.h>
>>>>>>>>    #include <drm/ttm/ttm_placement.h>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..ac981848df50
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>>>> @@ -0,0 +1,138 @@
>>>>>>>> +/*
>>>>>>>> + * Copyright 2023 Advanced Micro Devices, Inc.
>>>>>>>> + *
>>>>>>>> + * Permission is hereby granted, free of charge, to any person
>>>>>>>> obtaining a
>>>>>>>> + * copy of this software and associated documentation files
>>>>>>>> (the "Software"),
>>>>>>>> + * to deal in the Software without restriction, including
>>>>>>>> without limitation
>>>>>>>> + * the rights to use, copy, modify, merge, publish, distribute,
>>>>>>>> sublicense,
>>>>>>>> + * and/or sell copies of the Software, and to permit persons to
>>>>>>>> whom the
>>>>>>>> + * Software is furnished to do so, subject to the following
>>>>>>>> conditions:
>>>>>>>> + *
>>>>>>>> + * The above copyright notice and this permission notice shall
>>>>>>>> be included in
>>>>>>>> + * all copies or substantial portions of the Software.
>>>>>>>> + *
>>>>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
>>>>>>>> KIND, EXPRESS OR
>>>>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>>>>>>> MERCHANTABILITY,
>>>>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
>>>>>>>> EVENT SHALL
>>>>>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY
>>>>>>>> CLAIM, DAMAGES OR
>>>>>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>>>>>>>> OTHERWISE,
>>>>>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
>>>>>>>> THE USE OR
>>>>>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>>>>> This is MIT, right? Add the required SPDX-License-Identifier line
>>>>>>> for it
>>>>>>> at the top of the file, thank you.
>>>>>>>
>>>>>> all the files in drivers/gpu/drm/amd/amdgpu/* carry the same
>>>>>> license
>>>>>> text. So, have retained it to maintain uniformity.
>>>>> Please add the SPDX License Identifier for any file you add.
>> OK. I thought to keep it same like the other files. I will change this
>> to SPDX in the next revision.
>>
>>>>> Apart from that the whole approach of attaching this directly to
>>>>> amdgpu looks extremely questionable to me.
>>>>>
>>>> What's the long term outlook for things that are needed directly
>>>> from amdgpu?  Is there going to be more besides the backlight and
>>>> the display count/type?
>>> Yeah, that goes into the same direction as my concern.
>> PMF is an APU only feature and will need inputs from multiple
>> subsystems (in this case its GPU) to send changing system information
>> to PMF TA (Trusted Application, running on ASP/PSP) as input.
>>
>> Its not only about the display count/type and backlight, there are
>> many others things in pipe like the GPU engine running time,
>> utilization percentage etc, that guide the TA to make better decisions.
>>
>> This series is only targeted to build the initial plubming with the
>> subsystems inside the kernel and later keep adding changes to get more
>> information from other subsystems.
> 
> Yeah, and that's what I strongly disagree on. Don't come up with such
> an approach without consulting with upstream maintainers first.

PMF is there since sometime and this is an additional feature, so you
should presume that its being consulted.

> 
> What you propose here is a system wide framework for improving power
> management, that's fine. The problem is that we already have something
> very similar in the thermal framework.
> 
> See for example the Intel solution here
> https://docs.kernel.org/driver-api/thermal/intel_dptf.html
> 
> From the general design the job of the amdgpu driver is to drive the
> display hardware. So this should in general be completely decoupled
> from this driver. As Mario suggested as well you can iterate over the
> connected displays independently. Same thing for the backlight.

Well. Same should be case even with PMF driver as well. It should
provide overall interfaces for OEMs and ecosystem partners.

So, PMF should not have the DRM related changes IMHO and should have
an interface defined to talk to AMDGPU.

> 
> When it comes to hardware state like GPU engine utilization then we
> don't have that inside amdgpu either.

I spent sometime to get the stats for GPU utilization and other
information required to be passed to PMF TA, but the results were not
really favourable (maybe these could be issues in the PMF-TA as well).

So for now, I think it makes sense to have the DRM related code
changes within the PMF driver. But once we have other inputs from the
GPU/DRM subsystem ready, IMO GPU driver should provide these inputs
back to PMF driver.

Let me know if you have a different opinion on this.

Thanks,
Shyam

> 
> Regards,
> Christian.
> 
>>
>> that is the reason you see that, this patch proposes amd-pmf-io.h as
>> the interface to talk to other subsystems. For the initial path, I
>> have opted to get information from SFH and GPU drivers. But this is
>> meant to grow in future.
>>
>>>> At least for the display count I suppose one way that it could be
>>>> "decoupled" from amdgpu is to use drm_for_each_connector_iter to
>>>> iterate all the connectors and then count the connected ones.
>>> And what if the number of connected displays change? How is amdgpu
>>> supposed to signal events like that?
>> PMF driver polls for the information based on a configurable sampling
>> frequency.
>>
>> you can look at amd_pmf_get_gpu_info(), that gets called from
>> amd_pmf_populate_ta_inputs() in spc.c in this proposed series.
>>
>> Thanks,
>> Shyam
>>
>>> This whole solution doesn't looks well thought through.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>>> + *
>>>>>>>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>>> + *
>>>>>>>> + */
>>>>>>> Remove the extra empty line at the end of the comment.
>>>>>>>
>>>>>> I just took the standard template for all the gpu files. Is that
>>>>>> OK to
>>>>>> retain the blank line?
>>>>>>
>>>>>> If not, I can remove it in the next version.
>>>>>>
>>>>>> Rest all remarks I will address.
>>>>>>
>>>>>> Thanks,
>>>>>> Shyam
>>>>>>
>>>>>>>> +
>>>>>>>> +#include <linux/backlight.h>
>>>>>>>> +#include "amdgpu.h"
>>>>>>>> +
>>>>>>>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>>>>>> +{
>>>>>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>>>>>> +    struct drm_mode_config *mode_config = &drm_dev->mode_config;
>>>>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>>>>> +    struct drm_connector_list_iter iter;
>>>>>>>> +    struct drm_connector *connector;
>>>>>>>> +    int i = 0;
>>>>>>>> +
>>>>>>>> +    /* Reset the count to zero */
>>>>>>>> +    pmf->display_count = 0;
>>>>>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>>>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>>>>>> +        return -ENODEV;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    mutex_lock(&mode_config->mutex);
>>>>>>>> +    drm_connector_list_iter_begin(drm_dev, &iter);
>>>>>>>> +    drm_for_each_connector_iter(connector, &iter) {
>>>>>>>> +        if (connector->status == connector_status_connected)
>>>>>>>> +            pmf->display_count++;
>>>>>>>> +        if (connector->status != pmf->con_status[i])
>>>>>>>> +            pmf->con_status[i] = connector->status;
>>>>>>>> +        if (connector->connector_type != pmf->connector_type[i])
>>>>>>>> +            pmf->connector_type[i] = connector->connector_type;
>>>>>>>> +
>>>>>>>> +        i++;
>>>>>>>> +        if (i >= MAX_SUPPORTED)
>>>>>>>> +            break;
>>>>>>>> +    }
>>>>>>>> +    drm_connector_list_iter_end(&iter);
>>>>>>>> +    mutex_unlock(&mode_config->mutex);
>>>>>>>> +
>>>>>>>> +    return 0;
>>>>>>>> +}
>>>>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>>>>>>> +
>>>>>>>> +static int amd_pmf_gpu_get_cur_state(struct
>>>>>>>> thermal_cooling_device *cooling_dev,
>>>>>>>> +                     unsigned long *state)
>>>>>>>> +{
>>>>>>>> +    struct backlight_device *bd;
>>>>>>>> +
>>>>>>>> +    if (!acpi_video_backlight_use_native())
>>>>>>>> +        return -ENODEV;
>>>>>>>> +
>>>>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>>>>> +    if (!bd)
>>>>>>>> +        return -ENODEV;
>>>>>>>> +
>>>>>>>> +    *state = backlight_get_brightness(bd);
>>>>>>>> +
>>>>>>>> +    return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int amd_pmf_gpu_get_max_state(struct
>>>>>>>> thermal_cooling_device *cooling_dev,
>>>>>>>> +                     unsigned long *state)
>>>>>>>> +{
>>>>>>>> +    struct backlight_device *bd;
>>>>>>>> +
>>>>>>>> +    if (!acpi_video_backlight_use_native())
>>>>>>>> +        return -ENODEV;
>>>>>>>> +
>>>>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>>>>> +    if (!bd)
>>>>>>>> +        return -ENODEV;
>>>>>>>> +
>>>>>>>> +    if (backlight_is_blank(bd))
>>>>>>>> +        *state = 0;
>>>>>>>> +    else
>>>>>>>> +        *state = bd->props.max_brightness;
>>>>>>>> +
>>>>>>>> +    return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static const struct thermal_cooling_device_ops bd_cooling_ops
>>>>>>>> = {
>>>>>>>> +    .get_max_state = amd_pmf_gpu_get_max_state,
>>>>>>>> +    .get_cur_state = amd_pmf_gpu_get_cur_state,
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf)
>>>>>>>> +{
>>>>>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>>>>> +
>>>>>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>>>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>>>>>> +        return -ENODEV;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    if (!acpi_video_backlight_use_native())
>>>>>>>> +        return -ENODEV;
>>>>>>>> +
>>>>>>>> +    pmf->raw_bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>>>>> +    if (!pmf->raw_bd)
>>>>>>>> +        return -ENODEV;
>>>>>>>> +
>>>>>>>> +    pmf->cooling_dev =
>>>>>>>> thermal_cooling_device_register("pmf_gpu_bd",
>>>>>>>> +                               pmf, &bd_cooling_ops);
>>>>>>>> +    if (IS_ERR(pmf->cooling_dev))
>>>>>>>> +        return -ENODEV;
>>>>>>>> +
>>>>>>>> +    return 0;
>>>>>>>> +}
>>>>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_init);
>>>>>>>> +
>>>>>>>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf)
>>>>>>>> +{
>>>>>>>> + thermal_cooling_device_unregister(pmf->cooling_dev);
>>>>>>>> +}
>>>>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_deinit);
>>>>>>>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig
>>>>>>>> b/drivers/platform/x86/amd/pmf/Kconfig
>>>>>>>> index f246252bddd8..7f430de7af44 100644
>>>>>>>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>>>>>>>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>>>>>>>> @@ -10,6 +10,7 @@ config AMD_PMF
>>>>>>>>        depends on AMD_NB
>>>>>>>>        select ACPI_PLATFORM_PROFILE
>>>>>>>>        depends on TEE && AMDTEE
>>>>>>>> +    depends on DRM_AMDGPU
>>>>>>>>        help
>>>>>>>>          This driver provides support for the AMD Platform
>>>>>>>> Management Framework.
>>>>>>>>          The goal is to enhance end user experience by making AMD
>>>>>>>> PCs smarter,
>>>>>>>> diff --git a/drivers/platform/x86/amd/pmf/core.c
>>>>>>>> b/drivers/platform/x86/amd/pmf/core.c
>>>>>>>> index 4b8156033fa6..c59ba527ff49 100644
>>>>>>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>>>>>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>>>>>>> @@ -411,6 +411,7 @@ static int amd_pmf_probe(struct
>>>>>>>> platform_device *pdev)
>>>>>>>>        }
>>>>>>>>        dev->cpu_id = rdev->device;
>>>>>>>> +    dev->root = rdev;
>>>>>>>>        err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>>>>>>>>        if (err) {
>>>>>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>>>>>>>> b/drivers/platform/x86/amd/pmf/pmf.h
>>>>>>>> index 8712299ad52b..615cd3a31986 100644
>>>>>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>>>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>>    #include <linux/acpi.h>
>>>>>>>>    #include <linux/platform_profile.h>
>>>>>>>> +#include <linux/amd-pmf-io.h>
>>>>>>>>    #define POLICY_BUF_MAX_SZ        0x4b000
>>>>>>>>    #define POLICY_SIGN_COOKIE        0x31535024
>>>>>>>> @@ -228,9 +229,11 @@ struct amd_pmf_dev {
>>>>>>>>        void *shbuf;
>>>>>>>>        struct delayed_work pb_work;
>>>>>>>>        struct pmf_action_table *prev_data;
>>>>>>>> +    struct amd_gpu_pmf_data gfx_data;
>>>>>>>>        u64 policy_addr;
>>>>>>>>        void *policy_base;
>>>>>>>>        bool smart_pc_enabled;
>>>>>>>> +    struct pci_dev *root;
>>>>>>>>    };
>>>>>>>>    struct apmf_sps_prop_granular {
>>>>>>>> diff --git a/drivers/platform/x86/amd/pmf/spc.c
>>>>>>>> b/drivers/platform/x86/amd/pmf/spc.c
>>>>>>>> index 512e0c66efdc..cf4962ef97c2 100644
>>>>>>>> --- a/drivers/platform/x86/amd/pmf/spc.c
>>>>>>>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>>>>>>>> @@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct
>>>>>>>> amd_pmf_dev *dev, struct ta_pmf_enact_table *
>>>>>>>>        dev_dbg(dev->dev, "Max C0 Residency : %u\n",
>>>>>>>> in->ev_info.max_c0residency);
>>>>>>>>        dev_dbg(dev->dev, "GFX Busy : %u\n",
>>>>>>>> in->ev_info.gfx_busy);
>>>>>>>>        dev_dbg(dev->dev, "Connected Display Count : %u\n",
>>>>>>>> in->ev_info.monitor_count);
>>>>>>>> +    dev_dbg(dev->dev, "Primary Display Type : %s\n",
>>>>>>>> + drm_get_connector_type_name(in->ev_info.display_type));
>>>>>>>> +    dev_dbg(dev->dev, "Primary Display State : %s\n",
>>>>>>>> in->ev_info.display_state ?
>>>>>>>> +            "Connected" : "disconnected/unknown");
>>>>>>>>        dev_dbg(dev->dev, "LID State : %s\n",
>>>>>>>> in->ev_info.lid_state ? "Close" : "Open");
>>>>>>>>        dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>>>>>>>    }
>>>>>>>> @@ -146,6 +150,14 @@ static int amd_pmf_get_slider_info(struct
>>>>>>>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>>>>>>>        return 0;
>>>>>>>>    }
>>>>>>>> +static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev,
>>>>>>>> struct ta_pmf_enact_table *in)
>>>>>>>> +{
>>>>>>>> +    amd_pmf_get_gfx_data(&dev->gfx_data);
>>>>>>>> +    in->ev_info.monitor_count = dev->gfx_data.display_count;
>>>>>>>> +    in->ev_info.display_type = dev->gfx_data.connector_type[0];
>>>>>>>> +    in->ev_info.display_state = dev->gfx_data.con_status[0];
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>    void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev,
>>>>>>>> struct ta_pmf_enact_table *in)
>>>>>>>>    {
>>>>>>>>        /* TA side lid open is 1 and close is 0, hence the !
>>>>>>>> here */
>>>>>>>> @@ -154,4 +166,5 @@ void amd_pmf_populate_ta_inputs(struct
>>>>>>>> amd_pmf_dev *dev, struct ta_pmf_enact_tab
>>>>>>>>        amd_pmf_get_smu_info(dev, in);
>>>>>>>>        amd_pmf_get_battery_info(dev, in);
>>>>>>>>        amd_pmf_get_slider_info(dev, in);
>>>>>>>> +    amd_pmf_get_gpu_info(dev, in);
>>>>>>>>    }
>>>>>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>>>> b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>>>> index 2f5fb8623c20..956e66b78605 100644
>>>>>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>>>> @@ -9,6 +9,7 @@
>>>>>>>>     */
>>>>>>>>    #include <linux/debugfs.h>
>>>>>>>> +#include <linux/pci.h>
>>>>>>>>    #include <linux/tee_drv.h>
>>>>>>>>    #include <linux/uuid.h>
>>>>>>>>    #include "pmf.h"
>>>>>>>> @@ -357,6 +358,19 @@ static int amd_pmf_get_bios_buffer(struct
>>>>>>>> amd_pmf_dev *dev)
>>>>>>>>        return amd_pmf_start_policy_engine(dev);
>>>>>>>>    }
>>>>>>>> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void
>>>>>>>> *data)
>>>>>>>> +{
>>>>>>>> +    struct amd_pmf_dev *dev = data;
>>>>>>>> +
>>>>>>>> +    if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
>>>>>>>> +        /* Found the amdgpu handle from the pci root after
>>>>>>>> walking through the pci bus */
>>>>>>> If you insist on having this comment, make it a function comment
>>>>>>> instead
>>>>>>> (with appropriate modifications into the content of it) but I
>>>>>>> personally
>>>>>>> don't find it that useful so it could be just dropped as well,
>>>>>>> IMO.
>>>>>>>
>>>>>>>> +        dev->gfx_data.gpu_dev = pdev;
>>>>>>>> +        return 1; /* Stop walking */
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    return 0; /* Continue walking */
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>    static int amd_pmf_amdtee_ta_match(struct
>>>>>>>> tee_ioctl_version_data *ver, const void *data)
>>>>>>>>    {
>>>>>>>>        return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>>>>>>>> @@ -446,6 +460,15 @@ int amd_pmf_init_smart_pc(struct
>>>>>>>> amd_pmf_dev *dev)
>>>>>>>>        INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>>>>>>>        amd_pmf_set_dram_addr(dev);
>>>>>>>>        amd_pmf_get_bios_buffer(dev);
>>>>>>>> +
>>>>>>>> +    /* Get amdgpu handle */
>>>>>>> Useless comment.
>>>>>>>
>>>>>>>> + pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
>>>>>>>> +    if (!dev->gfx_data.gpu_dev)
>>>>>>>> +        dev_err(dev->dev, "GPU handle not found!\n");
>>>>>>>> +
>>>>>>>> +    if (!amd_pmf_gpu_init(&dev->gfx_data))
>>>>>>>> +        dev->gfx_data.gpu_dev_en = true;
>>>>>>>> +
>>>>>>>>        dev->prev_data = kzalloc(sizeof(*dev->prev_data),
>>>>>>>> GFP_KERNEL);
>>>>>>>>        if (!dev->prev_data)
>>>>>>>>            return -ENOMEM;
>>>>>>>> @@ -461,5 +484,8 @@ void amd_pmf_deinit_smart_pc(struct
>>>>>>>> amd_pmf_dev *dev)
>>>>>>>>        kfree(dev->prev_data);
>>>>>>>>        kfree(dev->policy_buf);
>>>>>>>>        cancel_delayed_work_sync(&dev->pb_work);
>>>>>>>> +    if (dev->gfx_data.gpu_dev_en)
>>>>>>>> +        amd_pmf_gpu_deinit(&dev->gfx_data);
>>>>>>>> +    pci_dev_put(dev->gfx_data.gpu_dev);
>>>>>>>>        amd_pmf_tee_deinit(dev);
>>>>>>>>    }
>>>>>>>> diff --git a/include/linux/amd-pmf-io.h
>>>>>>>> b/include/linux/amd-pmf-io.h
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..5f79e66a41b3
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/include/linux/amd-pmf-io.h
>>>>>>>> @@ -0,0 +1,35 @@
>>>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>>>> +/*
>>>>>>>> + * AMD Platform Management Framework Interface
>>>>>>>> + *
>>>>>>>> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
>>>>>>>> + * All Rights Reserved.
>>>>>>>> + *
>>>>>>>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>>> + */
>>>>>>>> +
>>>>>>>> +#ifndef AMD_PMF_IO_H
>>>>>>>> +#define AMD_PMF_IO_H
>>>>>>>> +
>>>>>>>> +#include <acpi/video.h>
>>>>>>>> +#include <drm/drm_connector.h>
>>>>>>>> +#include <linux/backlight.h>
>>>>>>>> +#include <linux/thermal.h>
>>>>>>>> +
>>>>>>>> +#define MAX_SUPPORTED 4
>>>>>>>> +
>>>>>>>> +/* amdgpu */
>>>>>>> Document the structure properly with kerneldoc instead of an
>>>>>>> unhelpful
>>>>>>> comment like above :-). Please also check if you add any other
>>>>>>> structs
>>>>>>> into kernel-wide headers that you didn't document yet. Or fields
>>>>>>> into
>>>>>>> existing structs.
>>>>>>>
>>>>>>>> +struct amd_gpu_pmf_data {
>>>>>>>> +    struct pci_dev *gpu_dev;
>>>>>>>> +    struct backlight_device *raw_bd;
>>>>>>>> +    struct thermal_cooling_device *cooling_dev;
>>>>>>>> +    enum drm_connector_status con_status[MAX_SUPPORTED];
>>>>>>>> +    int display_count;
>>>>>>>> +    int connector_type[MAX_SUPPORTED];
>>>>>>>> +    bool gpu_dev_en;
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>>>>>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf);
>>>>>>>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf);
>>>>>>>> +#endif
>>>>>>>>
> 
