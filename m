Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E147AEB30
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 13:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22DE10E3A9;
	Tue, 26 Sep 2023 11:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6709410E3A9;
 Tue, 26 Sep 2023 11:16:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inubOcd97XPrVGOLURbafzLbcweihH30KRyvHdvGL6SrSWK7jrwyjZxA8Mbl8WutdIrlD/KHz3pojrrKRQRISRPMG1jIh7IVSp0wqCiNoe5L1U/bXH07dcR8p4oGokoqqUQYguh2eNmfP7PS0Ds+R0dD027kMAcO5Khm+fJu20CpDztKANE7ja5OcOrIEu3FdUFRp46k2AqtFiIU5+BlfjAxOnbpinKfonUhrV7Lq/s9TpRKsedCd9bSxelL2dF5GpuSAl2DrWwBMNba3ykCguz1kC6WZMPYKS3Bsj2aLZdqDsTA8NQZbOY7BBc2BnevwwfUQP46f2fNMGWDQt0LIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlJeIo+eTgo/VDlD8hcMGmUyp0y4+Lv2X7OLS+FXucg=;
 b=JuKFG0C4nzjTfLbg3cnF6VAZx+xU0rRE4V6pnvdvSLRLUo/naF7JOl4urxjruVWBu0Ks6S/l/dZ/ERAabVs+s4r0807uhzGybhjwblaO4lopXr7Ciph00SiUO2jhrQPnW+E0P5HAqRnECqktVP/5ZrTfBidukL5OXAmjnhQqLFXA6OiKNBKeZN8Oj/K56hGAMRAD1yz+3weLG+aGvGwAbA8+linedGfvxH8/95lubm11cggtzX8HyUjpfGBPlA6TDccV8bST425kofs+Vton7SLD9u23WbYmY0YSEP+OO0JApT+c8WxftJtp0jZ3HKSer7WBZE8UjeBw35d0y0g3mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlJeIo+eTgo/VDlD8hcMGmUyp0y4+Lv2X7OLS+FXucg=;
 b=KKE5aOmJSyYPjVFzzH7GswS8iPiKAnmNlWmX1Tztk2SS4nwxIkbRG61Xj09C9Ltz8SXiBn7/7amZWL5j17PgpBUHyWIss2FE2DnW/Yyw+Gkt8NAseBTZIBnw22D41VCargiyBhDC4j9FUZx+8l3+qrUx6acBUFCFL3cVlY/lOLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY8PR12MB8364.namprd12.prod.outlook.com (2603:10b6:930:7f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Tue, 26 Sep
 2023 11:16:17 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 11:16:16 +0000
Message-ID: <9419f86e-5502-439a-8f11-e5ad07357529@amd.com>
Date: Tue, 26 Sep 2023 16:45:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "markgross@kernel.org" <markgross@kernel.org>,
 "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
 "jikos@kernel.org" <jikos@kernel.org>,
 "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
 <BL1PR12MB51442D18C314B1E34B77DE2BF7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <BL1PR12MB51442D18C314B1E34B77DE2BF7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY8PR12MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: fea12f76-aceb-426a-9de7-08dbbe82005b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i19+ICAMNa2fcv0SbxmyM8CpDvrCb2DHvh7Pjjn5TiTD+svjqwOjqr4EnuNIoea3Uc2H6teq4lHBI1Nz3Y129Zwq4SugwwxKsY5hYwpVyrqJAOiTIuof7dkQ0yElnIZnyVvQ4k5AGUBfDu/omptqUsw7QsAXZ4ucIka09XUs0SzYqWk4n7KqVrLu1GrNGXo+NMNTy+efoSkYOAxdgFexVhavUbkkPZuYtfeRhagKlu0wDPqIyx6wRqaCLuyeJ0CqfcXXJFy3K/lbcE6FQdZg/BGIOG0mH5ZVQ6XBvsjg2a/UKxCxc8a6NoSTt5vrZ0q0qpbcuIp21Q2v39vVWHnfbV7ggfQ+ulqcj6eXQzxiZoYeZEAX5iGMLk95fAG2KGL8wmwNi1KwYZzJSXaX9T+tkEsl8N7V8cpU2HwSAmSNJ4LV5+aiKKuPrkNIKinH0seIQn6stv9Sz18OhpuR2BHE3uWFsd7PtY9Jz4iA2BXrP+j24H48qJmCioZQuuejeUs8Epv1VLkaOjHnNjO+KcrTuOgNVFnq41OfDYcUSZUMKlo4tRg/Ixv1zHcdO1qWAbEV9hvtqpJO3WxVGKBZjQZEpx30qenef+xQiuJgqoI3avePIap+/ChhUcSRocu5UF/mJQu+u/RaZKAs3yOh5KlipxiInnqRICLNxyhkkgG/aFk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(366004)(376002)(396003)(230922051799003)(451199024)(1800799009)(186009)(31686004)(6666004)(53546011)(6506007)(6486002)(478600001)(38100700002)(921005)(86362001)(31696002)(2906002)(7416002)(41300700001)(83380400001)(6512007)(2616005)(26005)(36756003)(54906003)(66556008)(66476007)(110136005)(5660300002)(316002)(66946007)(8676002)(4326008)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWQ5RXlqanppTnFWandMY041RkVKZDlmelBIWWE1NFNOWklMVGp2Q2RjVDBH?=
 =?utf-8?B?TlN2bkN3TXpvYzJiMkVLRmJvNVVWUGtYYStVZ2MyTkhxdXFQNS9xZGU3cmwr?=
 =?utf-8?B?NUM2MW50M0MyL3A4ekhUQk4zREgrbXJGWWY4aXhkQlRmcjV3c1N1VWcvMGVD?=
 =?utf-8?B?d0FlY2lHR0N1SWE0azdPNFpZTmFadTdrOS9HT2ZuU21CRFNjYWJCTStwYWEx?=
 =?utf-8?B?VkNWMmJlTjIySVFPZW45QmpEZEZaQklTODduRS90S0grVUpDZlA1SktKQWRJ?=
 =?utf-8?B?OVNPcnZ4d3poc3JYd0V3dlRRTVVleXA1WFRiOXAyQjJHL2cxVDQxZ1FYQjN0?=
 =?utf-8?B?QkNlT25QUUhEVHgxNDVzUk1lK25wVW0wVDcwbloyS0ptd2FodkJUYUg2RlVT?=
 =?utf-8?B?TFNTVWx2TjEvMTh6YVFVVGhYbTJBRFJKWG8xVlhUVFBiZzB1U3NBUUFmTkFr?=
 =?utf-8?B?MVQ4ZkdEd2U0NGY0MkhZTlJoYy9mUjhBSnlCbERLM1MvNU82RnFFM2l3dTZT?=
 =?utf-8?B?eXpockhHenFrNVhTay81ekhGMXBMU1ZWcmgyOTZMRzdCazB5OHBubzZQdWkx?=
 =?utf-8?B?MFNYODBJRFM0NnFOZzByZXEzVnprL3hQTFdMRXdJcEQ5VlZ0K1ZzeWlrMHFW?=
 =?utf-8?B?Nnp0Mk0velM0N0VQdmpSZXFmVnNHWnlZV3hOZjFnK1cwdWlYOGJqYmhYdysy?=
 =?utf-8?B?VTBtajJWR2xTcDVvUWRZSk1mL0syZ3FKeDNneUpralR1VmZHUlBYaHpWRHZK?=
 =?utf-8?B?UXlaMzdoVS9OUXJ0VUlUcVM2VmYxdmZJQkRhaW1TbEpReDVOY0dMbHpoUStD?=
 =?utf-8?B?QmlsR3AvNkw1MWxnMjNrNzNiRjBHRWg2NVoyUXVBK0h3RVlDd05EMHRCOVFu?=
 =?utf-8?B?WE5aNG8rUTZ5RmwxR0dhekVNUlZjRURrWEpObVUxOUhxNHhlWko4Y1RUVk9z?=
 =?utf-8?B?T0xYZERqSWhzUnRxblQvWGhsMnNwVlBaY0l2MjhFdHVHaE1SUVJiVmdMT1hk?=
 =?utf-8?B?QXV2NVd1aFJwK242MTl3NTBhb2VUL2ZmMjJ2bzVrZnMxMkp4WXRHU1BpUEph?=
 =?utf-8?B?bGhzVDA2cE5WTm1HUW1LbGxMb0VQQ3RnNmE3NkhwZDYvQk13OXJKbWRUT1lQ?=
 =?utf-8?B?M2tCd1R1STJEM3pWbWdORUxqNVdPU25BbExvUElzRzdRYTNFUnZyQTk2dEth?=
 =?utf-8?B?RFVUZllveitSZHM5NGN5TTBudDhRQ2RWL3ArMWF2VG1tTSs4WEI5a0FOTlB4?=
 =?utf-8?B?Y1UvS0N5QUc3RFBmWGs4MEh1UzJvY3NGaUxvSnlUNUk4K0lIeHhadXJkbXh6?=
 =?utf-8?B?NGhrcEJEZGh5UWx2WWpoeVYzeGdrWmU5YWZYQ0UwT2lPYVZUVmczYk9RSmto?=
 =?utf-8?B?dCt2UWtNZU9qVWZUdGJRdEhmK1lNSzg0ekZwMjRZV1l2UkxibGRSUmlMQUpq?=
 =?utf-8?B?VWRkMlBvVWc0aGltTllMb1FySjgySlJndU9DVHo2K2RXY1d2dEFkdUltSmEy?=
 =?utf-8?B?UUdlUDRISVpNT3F0bE5sTy95UjlwNnlYRERwTlZ6Q3REUXpvNmQ0bzRjYlQz?=
 =?utf-8?B?YW1zYU9wbEpmRE5DMTZRVUpvbmhpV3BSQ0FLM3l6TUo0Qk1xWVhONUpzQVBP?=
 =?utf-8?B?WjVQeEZ5ajJNc1IzTkVaVDJyVnpqc1RjMmIwbmpuWnVYeGV4TldLbitjcnR3?=
 =?utf-8?B?T3NIMjh2WFBrcWdTQ0RzcDhmTGJOaWw1QUp6YUdzVXREelhsUVBFYVMvTHZ4?=
 =?utf-8?B?SnM4NXp5WGJTaGF2aGpQL0p3Ym5Db2l4R2p1RWhhd1g2L0h3UnVCTnNMY1pa?=
 =?utf-8?B?ZlFCVDBIVGNFa1RHQy9rT2ZKVGlQaGk3K3NjNGtBVndGSVkxSzFSV09NalNT?=
 =?utf-8?B?OGZnclRwQmM3eExVa2dVRjFzbzhGZHQ2UnpFeE1qWkg3MktCZUZEYUpuWW9v?=
 =?utf-8?B?TUJOZStDZ0NzMXJxM1I0THAzUGNkRWJSS25BTlBaa0I0MkdCSzFxVkRIeWY3?=
 =?utf-8?B?WEcwelFDS3Jva2V6VnB6SFpTVUZDa21iajRIUm1zRTVJMmZYVDJpNTR2c1Z0?=
 =?utf-8?B?QXl4Y1J5RHdtSnlXVlZ4SlJhbmUvTDlieWxaYzFlSkdDWnFPd0tUb2wzZ3Fo?=
 =?utf-8?Q?CS1n4icCzHNLeU4s9di6CMcG2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea12f76-aceb-426a-9de7-08dbbe82005b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 11:16:16.7274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smlSos0t+IClGTqVIt2bbImHGNOA6F4rTBaYM7hrWXJVbI4EKJZoWMLTVfWTLiAtAY1JerU4mfztSoET4r0Zqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8364
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 Patil Rajesh <Patil.Reddy@amd.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/25/2023 9:57 PM, Deucher, Alexander wrote:
> [Public]
> 
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> Shyam Sundar S K
>> Sent: Friday, September 22, 2023 1:51 PM
>> To: hdegoede@redhat.com; markgross@kernel.org; Natikar, Basavaraj
>> <Basavaraj.Natikar@amd.com>; jikos@kernel.org;
>> benjamin.tissoires@redhat.com; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> airlied@gmail.com; daniel@ffwll.ch
>> Cc: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>; amd-
>> gfx@lists.freedesktop.org; platform-driver-x86@vger.kernel.org; dri-
>> devel@lists.freedesktop.org; Patil Rajesh <Patil.Reddy@amd.com>; linux-
>> input@vger.kernel.org; Limonciello, Mario <Mario.Limonciello@amd.com>
>> Subject: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set
>> interface
>>
>> For the Smart PC Solution to fully work, it has to enact to the actions coming
>> from TA. Add the initial code path for set interface to AMDGPU.
> 
> This seems to be limited to backlight at this point.  What does setting or not setting the backlight level mean for the system when this framework is in place?  What if a user manually changes the backlight level?  Additional comments below.

The unit here is nits that varies from 0 to 255. User can manually
update the backlight but if there is an action from the TA to update
the backlight, PMF driver would send a request to GPU driver to update
the backlight to the updated value (in nits)

At this point, yes. PMF is using to PMF-GPU interface to set
backlight, but there are additional things to be added in future. This
patch builds the initial plumbing for that.

> 
>>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21
>> +++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>>  drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>>  include/linux/amd-pmf-io.h              |  1 +
>>  4 files changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>> index 232d11833ddc..5c567bff0548 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data
>> *pmf)
>>       return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>> +
>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf) {
>> +     struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>> +     struct amdgpu_device *adev = drm_to_adev(drm_dev);
>> +     struct backlight_device *bd;
>> +
>> +     if (!(adev->flags & AMD_IS_APU)) {
>> +             DRM_ERROR("PMF-AMDGPU interface not supported\n");
>> +             return -ENODEV;
>> +     }
>> +
>> +     bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>> +     if (!bd)
>> +             return -ENODEV;
>> +
>> +     backlight_device_set_brightness(bd, pmf->brightness);
>> +
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>> b/drivers/platform/x86/amd/pmf/pmf.h
>> index 9032df4ba48a..ce89cc0daa5a 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -73,6 +73,7 @@
>>  #define PMF_POLICY_STT_SKINTEMP_APU                          7
>>  #define PMF_POLICY_STT_SKINTEMP_HS2                          8
>>  #define PMF_POLICY_SYSTEM_STATE                                      9
>> +#define PMF_POLICY_DISPLAY_BRIGHTNESS                                12
>>  #define PMF_POLICY_P3T                                               38
>>
>>  /* TA macros */
>> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {  };
>>
>>  struct pmf_action_table {
>> +     unsigned long display_brightness;
>>       enum system_state system_state;
>>       unsigned long spl; /* in mW */
>>       unsigned long sppt; /* in mW */
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>> b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 1608996654e8..eefffff83a4c 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct
>> amd_pmf_dev *dev, u16 event)
>>       return 0;
>>  }
>>
>> -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct
>> ta_pmf_enact_result *out)
>> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct
>> +ta_pmf_enact_result *out)
>>  {
>>       u32 val, event = 0;
>> -     int idx;
>> +     int idx, ret;
>>
>>       for (idx = 0; idx < out->actions_count; idx++) {
>>               val = out->actions_list[idx].value;
>> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct
>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>                               dev->prev_data->system_state = 0;
>>                       }
>>                       break;
>> +
>> +             case PMF_POLICY_DISPLAY_BRIGHTNESS:
>> +                     ret = amd_pmf_get_gfx_data(&dev->gfx_data);
>> +                     if (ret)
>> +                             return ret;
>> +
>> +                     dev->prev_data->display_brightness = dev-
>>> gfx_data.brightness;
> 
> Are we using standardized units for the brightness?  On the GPU side, we align with the standard blacklight interface, but internally, the driver has to convert units depending on the type of backlight controller used on the platform.  Presumably PMF does something similar?

Yes its the standard nits. There is no conversion needed.

> 
> Alex
> 
>> +                     if (dev->prev_data->display_brightness != val) {
>> +                             dev->gfx_data.brightness = val;
>> +                             amd_pmf_set_gfx_data(&dev->gfx_data);
>> +                             dev_dbg(dev->dev, "update
>> DISPLAY_BRIGHTNESS : %d\n", val);
>> +                     }
>> +                     break;
>>               }
>>       }
>> +
>> +     return 0;
>>  }
>>
>>  static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev) diff --git
>> a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h index
>> a2d4af231362..ecae387ddaa6 100644
>> --- a/include/linux/amd-pmf-io.h
>> +++ b/include/linux/amd-pmf-io.h
>> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {  };
>>
>>  int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>>  #endif
>> --
>> 2.25.1
> 
