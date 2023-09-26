Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF497AEB41
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 13:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A11110E3AD;
	Tue, 26 Sep 2023 11:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A8510E3A4;
 Tue, 26 Sep 2023 11:17:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lToCdLhGU352SkkM7Ne2Uzi5KmG1I3iyRbSj2q+YzDkJDInnC8WPf4FnOHNiHB1TjIk0vEpWhBFyKd2UQPtvRibuyEclife0pbaNI2ckIQBAilFuMxw6bCgXFZOEv9iReHcz5q13bJFQVMqnCRc0XcG/YWCELjtc/g30SaShB7fcHNTFRW25QhGf+oi8PSx8J/YaXz5ndtSezucytkq0MwoAZ9ex20uv8z7JLl2gKSaAhErEI/2XOeV8dPMsJw0qkFV+Jpda226mJ1pQCQCppEB6FoknqsRY2/gX9+gda3z5G4P8tUc7aLOZlpawFgyQjUFAItZpdQx/Rq2ZxajazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pz1saDJ58T11s72CH71rGmrESlEO8IdaIoaToKpdj2M=;
 b=Vki6Q/s+b+LDTGiN1TLvy2Os/74zkh2gal/V5QTXb7LFBk9e/3P1upQ+A7bV6d+6OvhnoZdna7x7hravhBqD5Er+ychqMMcVzq8nCQOp8EW3zszK+do1ydISvxdNBPdgLWZNFXW5ZJOqgssp9mK3DmWx4fspNbL2a8dApOkIBHAu/yjQz5QYmeVQfvfGsWq6sjc5SaY83A6s7rCjnB+O6N/MsxuneOX2b6Bp0Cs7A57bU+6MVuSzChrPKJqk8sCOYqeOXYOT4vuW7oi/nARDh6W6tTN5TFyisApkmew/YTbPdLGI/3pXfNh5owZlAFFza62WyGGeQWo8iFyIv6hXOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pz1saDJ58T11s72CH71rGmrESlEO8IdaIoaToKpdj2M=;
 b=Dy752RgshHRhzbAINQQQTPiDply76hfGFH9RTNkDBI3QnG5AWIAP95EbIEyXM1nXcm9W0JgxQkx3ot4mgYaxCfsIFBtQG4oNRGDfY622gBFvP0uqWPKgRV/AFU47oeRYFxCnWfQM61YiFVyhsaZAoc9VJSl5gHI6wWEYUTj8mG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY8PR12MB8364.namprd12.prod.outlook.com (2603:10b6:930:7f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Tue, 26 Sep
 2023 11:17:50 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 11:17:50 +0000
Message-ID: <42b28960-1c9f-4865-afbe-93e1e23825a3@amd.com>
Date: Tue, 26 Sep 2023 16:47:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
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
 <0ad32609-d47b-4114-8c51-09e96d7737f2@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <0ad32609-d47b-4114-8c51-09e96d7737f2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY8PR12MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f13515-fb89-4415-4c93-08dbbe82383c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ABT5Y5FWs5xuYuqyA1UkZGnn+Q7iNYB5EM/BIAR2JzuvISE9/tJCzwwr3s64/Z+/+OR951xjCPUW7OBJi+tbYbaAyjT1X5/0mWbwzjibrTBJI1RBCNIyBQiTmrhbeHj1EIT1WHiSShIKu6Ra6K2OFzuvBNfk3gPhq/qy5ObF3OBLR0fLTmz7qyOltAlrrnkTUr7msLvlcNt2Qj8cBCWlo6sY7WgkdxCJ5xNo3U9H3ega9pP7/KA51aUauBrHBwQkMALD2uTOo3STDHwwWbPTz8yqUva82yF9kzZP/D5u11GIzakvH1EvbpQ0oRW44Ah4vQh0fltjVvXuz9p/jHefAobfE0jBOvmpaJcMkd+1eB725VDtj6lGeLHXlODnKNVJoabgT9gaD4Vth5I2KpDb3UaJOjD5Y5l5kvMlYrCPyihjrrRRKvv10Wgop5bjBec/qz/6i8vlXp/WZp0cxQGDR1cqWtqXy282J0UXLRjTAEIo/goN20J8VrOlk5ie39h3gr67yfHclCxuVNGfofP+tKoWQcE6Lvu8h3YhIUNq0SfpWpBtgz+PU6xKrrpx5JZZRle2GN4+RaqGKeEuh/OjQvxf+ygTaRmdo21+/GAH5lJqSC5lNDLnsO1LfIZIkPCa8sEAEkCD/Js1LFs2s3pD+itMcUnJMTL/IUFISun1jxA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(366004)(376002)(396003)(230922051799003)(451199024)(1800799009)(186009)(31686004)(6666004)(53546011)(6506007)(6486002)(478600001)(38100700002)(921005)(86362001)(31696002)(2906002)(7416002)(41300700001)(83380400001)(6512007)(2616005)(26005)(36756003)(54906003)(66556008)(66476007)(110136005)(5660300002)(316002)(66946007)(8676002)(4326008)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk0zVzRSZzlyd0RUZGJvV1FGem8xblFiWmMydFA4dFgrYmZIT1ltbGhsazNF?=
 =?utf-8?B?NjIzbk9oSUF6dW1CWlNJUWtWeXlJZCtXcUR2UmxzQUozR0J6S1cxVFk5eEZQ?=
 =?utf-8?B?a0YzeURpU2t3ZW5wWGs3V0tyY0U3ZW5tQkpFQ0wzMXBHWXRQTHUyQkdHY3Uy?=
 =?utf-8?B?aEZiQlp3amRGSFhGN0F2MUJaT3NGN3BQMlJTbjVOaG5hRzhLUVpNakZKbk10?=
 =?utf-8?B?MUl1WkZwa3FZTWlVS1ZvZnJvcS81L3FyRmhhNDNBWlJKOHFWM1h5VnBwQ3Zq?=
 =?utf-8?B?VWNud2FqUFF3TWpiTHl2K0M3NGdxRFVlRXVOUy9hY01tRFcrczNoT0hsaXdJ?=
 =?utf-8?B?Q3ZGaGxBME04S2xQRWt4eWh0MzVYMnhGY3ZnRzZjbzFWazMxMU9IM2lCWnh2?=
 =?utf-8?B?QVNMZUFidnJOUkoyOWdleHlScnBqbTU0SFo0b1NJUGJoR2grMmZURlFtbExp?=
 =?utf-8?B?a2lHcXVNRlg1S3N6NVNxTmxpUGhCRGsvcCswTEZGWE50UHJsUXh1elNhMW9G?=
 =?utf-8?B?SWphQWYxc29aMFpob0Z6RVBVOW92aldDQWRocWxpb1NGazQrUEpiYldsUEMv?=
 =?utf-8?B?VUNMa09QSFV3NVJqeU96NS9SaGFiVUZ4aUwxcVQyVjMwaHVjcUt0d3hnTGk0?=
 =?utf-8?B?Y3JxN2FRb0pDVlBYUWVwK0lnVWo4RUk4b1NIdm5CU0Z4NExadCtaWUNWeEFq?=
 =?utf-8?B?ME1YTTg4TEphcWQ3bVU4YTRUdDBBTGl1MVdsVGhLQjByNGd1ODZ1cHVoVWN4?=
 =?utf-8?B?TTFIY3lOU1BZWENNV3ZWaVNyWkQzQUlQNEp0dG5yV1hpYWlMZk14SVdxVG9W?=
 =?utf-8?B?bGR0RVVIclZvc3kxakZIVk9HbFkxZlNVLzdJU1BTQTVWdG90UWo2elpUTUFG?=
 =?utf-8?B?Tmw3czNoNTM4UVd1eGN5Mk5pNHFoM3pFdFVScVpwaUJIWE1aY2s5K3QxeUFx?=
 =?utf-8?B?MEhkekdMYzRBTmFWRWVab2s3bWhxQ0FtMzlLNE9hN2VUdUNIUlhHaEdpUEJZ?=
 =?utf-8?B?Rk5xUW5SUVgrdllvOHgvUzZBeHgxZVcybFZtV29XQSt5WHBxZ2lzSXVJcExO?=
 =?utf-8?B?TzNxbS9nc09mYXRXSUxLS0pIUmZReFJCN3JCVnVCbDArQnlhc2xHdjFhSUkw?=
 =?utf-8?B?WWZPZ0NsbGNtZmFKYTh2dk81VXZFTUcvTUduOGo2RFhUVmc5T3VqTlppRGFx?=
 =?utf-8?B?aTFNT2FmK1ZNNWhwM0hFYUNNWlNMaUMydzlSUDEwdHZvcWE4N3FOYXkvMGVB?=
 =?utf-8?B?V3E2ZnhSeHRiRHpZWTRSS3ZCTUdlaURYNjkzQUgwL1hlY05YU2t4NVZESHVi?=
 =?utf-8?B?MmV2bzN1bFlvemhSRWc4R2dTN09PNkQzWFZ5cWVMSm11TGN4NzZ6N1hOS0ZE?=
 =?utf-8?B?RE9mYURGVDVHcklQMWIvWkRoMG9SVkpGZUQxWFlBb3hxYzY2MXN4Q0hCZjRp?=
 =?utf-8?B?TWlvWHFlUENJOUoycW14NHFKZkh6aUNXMzBDMDVyNEs2WStQWjJlcVg4MmNS?=
 =?utf-8?B?RzRDOU9LV1E4R3RXbE96Zm9XanN1dSt6d29TVmtjdCtKSVZFMHB0VFRxR0Nu?=
 =?utf-8?B?c09OTGV0WHUvYU94Y1lmalczL2pCUzdIaEM0c25ROXFiK1FWWnJZdjQ1RnZI?=
 =?utf-8?B?eEFtVG0zRWgwWjJ6blBQM05rWDZERWxTMWFsKzkwZ25NVWxHeTBLbXNZN2sx?=
 =?utf-8?B?OEppcnBoakVrVlorQVMzaWFVc1lxL1N4SjZWTnBldjJuTTF3Z3pKUE8xUzJI?=
 =?utf-8?B?SWVUcDE3TW9wTVBoTXV5emZYSUZIMWxJS2FkK2ZyUWhGOEtOTE5lV1dNSExx?=
 =?utf-8?B?OTVUUWpVQ3lXTzlSSVhHTjNSdDdIWGVvMi9pcE1CTHZmWEwrdytmZmNNaVhh?=
 =?utf-8?B?N3ZSSGVRSlJIU1FzT2p1U0V3SFFpWGEvVWNjamFlVTlmaUlCMDROaTlPdUhq?=
 =?utf-8?B?N2g5Zk9iZHZ1d2U2MzdjTEdWalBZSGlKQXdjNjgxUm90MlcxcDhCRUJiK2xx?=
 =?utf-8?B?TUZ6b25sajJuWlYzTCtlUFV1Qzl4MTB4VWpBTWZpclVTczNVRGJqL3lxUHp2?=
 =?utf-8?B?T0NtYlhPbEQ4OXU0eXhxWGM0U0FtRzZ0UktHVDI2d0hOUmo5MXFKR2xDeHRz?=
 =?utf-8?Q?9ys4cnLyGxOmBpCL+ca41vAgQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f13515-fb89-4415-4c93-08dbbe82383c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 11:17:50.4872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQu/VfkqCkkvsAfIGlHmTLmCEU15KRi/sNa+eOgIDmyt8UNUe/8kHg9DfBtxiXB6qNLCSi8s52mQjn+7iu1OpA==
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
Cc: Patil Rajesh <Patil.Reddy@amd.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/25/2023 10:00 PM, Mario Limonciello wrote:
> On 9/25/2023 11:27, Deucher, Alexander wrote:
>> [Public]
>>
>>> -----Original Message-----
>>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>>> Shyam Sundar S K
>>> Sent: Friday, September 22, 2023 1:51 PM
>>> To: hdegoede@redhat.com; markgross@kernel.org; Natikar, Basavaraj
>>> <Basavaraj.Natikar@amd.com>; jikos@kernel.org;
>>> benjamin.tissoires@redhat.com; Deucher, Alexander
>>> <Alexander.Deucher@amd.com>; Koenig, Christian
>>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>>> airlied@gmail.com; daniel@ffwll.ch
>>> Cc: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>; amd-
>>> gfx@lists.freedesktop.org; platform-driver-x86@vger.kernel.org; dri-
>>> devel@lists.freedesktop.org; Patil Rajesh <Patil.Reddy@amd.com>;
>>> linux-
>>> input@vger.kernel.org; Limonciello, Mario <Mario.Limonciello@amd.com>
>>> Subject: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set
>>> interface
>>>
>>> For the Smart PC Solution to fully work, it has to enact to the
>>> actions coming
>>> from TA. Add the initial code path for set interface to AMDGPU.
>>
>> This seems to be limited to backlight at this point.  What does
>> setting or not setting the backlight level mean for the system when
>> this framework is in place?  What if a user manually changes the
>> backlight level?  Additional comments below.
>>
> 
> It's also for the display count.

display count is on the PMF-GPU GET interface. On the SET interface
its only backlight for today.

Thanks,
Shyam

> 
>>>
>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21
>>> +++++++++++++++++++++
>>>   drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>>>   drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>>>   include/linux/amd-pmf-io.h              |  1 +
>>>   4 files changed, 41 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>> index 232d11833ddc..5c567bff0548 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data
>>> *pmf)
>>>        return 0;
>>>   }
>>>   EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>> +
>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf) {
>>> +     struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>> +     struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>> +     struct backlight_device *bd;
>>> +
>>> +     if (!(adev->flags & AMD_IS_APU)) {
>>> +             DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>> +             return -ENODEV;
>>> +     }
>>> +
>>> +     bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>> +     if (!bd)
>>> +             return -ENODEV;
>>> +
>>> +     backlight_device_set_brightness(bd, pmf->brightness);
>>> +
>>> +     return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>>> b/drivers/platform/x86/amd/pmf/pmf.h
>>> index 9032df4ba48a..ce89cc0daa5a 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -73,6 +73,7 @@
>>>   #define PMF_POLICY_STT_SKINTEMP_APU                          7
>>>   #define PMF_POLICY_STT_SKINTEMP_HS2                          8
>>>   #define
>>> PMF_POLICY_SYSTEM_STATE                                      9
>>> +#define
>>> PMF_POLICY_DISPLAY_BRIGHTNESS                                12
>>>   #define
>>> PMF_POLICY_P3T                                               38
>>>
>>>   /* TA macros */
>>> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {  };
>>>
>>>   struct pmf_action_table {
>>> +     unsigned long display_brightness;
>>>        enum system_state system_state;
>>>        unsigned long spl; /* in mW */
>>>        unsigned long sppt; /* in mW */
>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>>> b/drivers/platform/x86/amd/pmf/tee-if.c
>>> index 1608996654e8..eefffff83a4c 100644
>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct
>>> amd_pmf_dev *dev, u16 event)
>>>        return 0;
>>>   }
>>>
>>> -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct
>>> ta_pmf_enact_result *out)
>>> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct
>>> +ta_pmf_enact_result *out)
>>>   {
>>>        u32 val, event = 0;
>>> -     int idx;
>>> +     int idx, ret;
>>>
>>>        for (idx = 0; idx < out->actions_count; idx++) {
>>>                val = out->actions_list[idx].value;
>>> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct
>>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>>                                dev->prev_data->system_state = 0;
>>>                        }
>>>                        break;
>>> +
>>> +             case PMF_POLICY_DISPLAY_BRIGHTNESS:
>>> +                     ret = amd_pmf_get_gfx_data(&dev->gfx_data);
>>> +                     if (ret)
>>> +                             return ret;
>>> +
>>> +                     dev->prev_data->display_brightness = dev-
>>>> gfx_data.brightness;
>>
>> Are we using standardized units for the brightness?  On the GPU
>> side, we align with the standard blacklight interface, but
>> internally, the driver has to convert units depending on the type of
>> backlight controller used on the platform.  Presumably PMF does
>> something similar?
>>
>> Alex
>>
>>> +                     if (dev->prev_data->display_brightness != val) {
>>> +                             dev->gfx_data.brightness = val;
>>> +                             amd_pmf_set_gfx_data(&dev->gfx_data);
>>> +                             dev_dbg(dev->dev, "update
>>> DISPLAY_BRIGHTNESS : %d\n", val);
>>> +                     }
>>> +                     break;
>>>                }
>>>        }
>>> +
>>> +     return 0;
>>>   }
>>>
>>>   static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev) diff
>>> --git
>>> a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h index
>>> a2d4af231362..ecae387ddaa6 100644
>>> --- a/include/linux/amd-pmf-io.h
>>> +++ b/include/linux/amd-pmf-io.h
>>> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {  };
>>>
>>>   int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>   #endif
>>> -- 
>>> 2.25.1
>>
> 
