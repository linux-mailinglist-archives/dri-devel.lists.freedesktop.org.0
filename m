Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5BB7AEDE0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 15:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E70810E0C3;
	Tue, 26 Sep 2023 13:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09A010E0C3;
 Tue, 26 Sep 2023 13:17:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGIq5hCUjkGxcQQn+XvoCDRNWg5uJSj/JAAxLycXKoLynmOMmpOPt8dQO6JUz2qgPaydmV7Bxi6EHaTtKjr27wf7Dn22/ARS4Eo/Q+nobReLJPu3Ei/xok2h/9oMVhjJgEwMchY0QSzpRiZreBSmc/nm/ku03vmqVUgwuhTeuspcX3TnapWVTKC75KbPCsH6Ym0fiRnVCRNlILkqJBgkJy++Iin3HcdfL7pcpQgfZINJmrEu2KJZLt9pDydfnc8k0+HqJV8WeaPjHJ39l3cof2WIUd3/PqshY4ADquqqK6Sg0PyYFbjv1qcma5wNpDIkugcvwsnPSR0M5bKRBnF0UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3RTmQqN6aZtCanVlj/fqSjXperLjQ60Ag3aJtJ5taY=;
 b=giFCicRCiq9cPPPIhA33BMazr78Rp1vMNtzP/zKu/fErbTaZCXHmlduHO6UuTPQvoneiSXlbnzyJzQJJAS1GuNCUezYUBnm04B2cDwH+1rIFpnKLxfw/GV/L8t7efrUBLqjeV+bxrLhDNaU49MUYd/AwVNwicwIGVHRpDq8zr0nA6wETOoYMtAiZyvqHG5Mrq+68t9YMDC0wxHfkV7LKgqycgQ9AzSSX3Srx9i2oi6VQ6ao5CTFb80H0LPrbfyNbbpO8eM1ABlFHbbjyE5dvb7320KTlc2SXmSeDBSeefLCzIxU/GDGxjl29xMCm4vhZpYPDIAN+89UqXo3A2LxZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3RTmQqN6aZtCanVlj/fqSjXperLjQ60Ag3aJtJ5taY=;
 b=ffTlItzwj0iaa1bmna5o+NLrYwC+g9u7Ib/SsQZLRfpJjiMPLPG2drhLwlIeL/ZPEKtB8i/LvqFmI3p2D9u72UOQRusU4nHwzlRpTmzmyyvIS8E0+xGMv+KmqmHyrncrfX2kQvQsC+dxmmPeg2t4BwWHQWHkBn4xOyhp281nJ8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 13:17:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.016; Tue, 26 Sep 2023
 13:17:37 +0000
Message-ID: <4e79121f-01bb-729b-1e70-043e8911cb12@amd.com>
Date: Tue, 26 Sep 2023 15:17:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
 <2e201a3b-d75f-916d-5135-b084ad5da23e@redhat.com>
 <437fbd5c-386f-4609-a350-77f61c8aaa0c@amd.com>
 <6c047e17-66b0-c3ff-1b4e-4478663619a4@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <6c047e17-66b0-c3ff-1b4e-4478663619a4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be3b419-c829-4268-6a25-08dbbe92f408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ac+Ah+ZSo0UbQ5auvKNwHHa352lvdjjZJH/ZX5rRJtuhTtwAAGsQbLUojflF3SKkIQSEUvM3t+j6C7SpFMVQxk6uUY1iUOJvNWmnz/nxLMjknVKFqAafal+bgc0a6naUrgNVSiK8+QpXFtrR+pCDpub/SVcx33DYA6LESKhZc6450+kZaW2/rsV2AVdBXG6g5JoukWEcp4A47YT2/ebzlDV1Na4JXODswUNk0O3MjApZ/kdPekJ4bHnmjtne3Twz5aTNlxkhtCKSl/PSgUn5Rzvlt+lnVtdwbcMr16j8UgxdQg3AJVGtkK0S2zMiEA/obXvikAKMnX6Qlg6LenfyyzeORDIlBVW3G45lvuklxxe+jSP8Ol+yBWlao5gelwh/K5JZxXwRMPDjzJ7JeGXs+V7hFVfipSjI4wpMKHcsynQkWx4KUMGMSHFIrp38FlHqkeIz7DwudI2oaDyJi6GAYqazlh98+PgvWNnuGdWuZdG0mZPECq2F/nw2KM7p8P6QC2V796rPy6eOkZtWN51LulLB9VbobmK4DoVuAN72Q1e0OiAeORupmFakb537CO1lcM+2G3zi8PF94XQpBncUh5jp3IWZSHurqWqbdsZ0Ewj0FDxqZOWD+THoOgHSjDBHQIC2UTzTDVmIUhSe6zsXm01R7lVS0QBzaV6oIP4teykPGDIElrqwy9mesahpYNjd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(366004)(230922051799003)(1800799009)(451199024)(186009)(41300700001)(2616005)(8936002)(4326008)(8676002)(31696002)(7416002)(66476007)(66946007)(66556008)(316002)(26005)(31686004)(110136005)(86362001)(2906002)(921005)(6486002)(478600001)(53546011)(6666004)(83380400001)(36756003)(38100700002)(6506007)(6512007)(5660300002)(87944015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVFmTHRmeXM4anA0UVQ3ek1mWk5lL0tJTnVwRUg0WDdLVDRkYjBsQVVOTFZY?=
 =?utf-8?B?dEd0S216cXRiaW5uREhtSTlyOS9FU3ExS0w2TjJNUzZsbzZoSTZSWFpZeWpw?=
 =?utf-8?B?RmJpYXkwdFdyb1hpejllV245V1R1OUhDNEUzWWxBSEs3T25jT0RuRUF4K053?=
 =?utf-8?B?Y2NPUUxEVGlaNXNITFRPYkNHMEpSMktQTTlraXZaYXJWUlBmYWl1R2R4UDVt?=
 =?utf-8?B?aVM0QVN6U2hPRm5uaC9ST1R2UXBRakJpYVdEamVBVEZtWnMwMkFXTmc0U2l0?=
 =?utf-8?B?cC9rRUZpSHBPRXJDMlNRVHV2Y1BITjRCRDNoMTE4bXhnRHU4ODJFeXVFSjlk?=
 =?utf-8?B?d05XRFBnb0dwN3hiYzhmODNBYmFPVlF0WllpZGRhQXNZL0J4VmRUaGxoUlhF?=
 =?utf-8?B?aU9CbWE0UEpwYjdSNEw5Zk0zS01BYWMxakdNK0VvdW1NWC92SldnZlVtM2ps?=
 =?utf-8?B?b1dpWFFQNVUxd2t5WGFDdjlIMWh1eWJwTnJNemZNQlBPYzkvY2dkWlFLNGxC?=
 =?utf-8?B?bEVRNFpjbW1PR0tUaW9lZm5uM1NsbDVCVWpXV08zenpBSGVuM25PNmQyK1R2?=
 =?utf-8?B?NWVFWlR4VnBlTWlkTUhIaEx3cXFaQldxWlVOOVNtOE5BUmNtYkF1UzZSaFpl?=
 =?utf-8?B?bS9mRitHSWpMSEVPd0pJOTA5NWRiZ09yUCtycEp0alZzWDFNakFIeFY5SDhz?=
 =?utf-8?B?WEVCWnhRL0cxWUF3TEhicWJDZFlLY1NmKzNLSzNLR3lDdFJPRUhDYnd3TVMy?=
 =?utf-8?B?NS9QL3pJSVYzdTFUUnNGWjcyaWpoQkxiZDBRaTc4RGZqN1hlcWdSRXNvb2pZ?=
 =?utf-8?B?UEUyMm8rV1gwWlB1SjB0OUp1L3J6VXFLSmxzN2NvY2g3ZUNyRzBrMmVFd0Zq?=
 =?utf-8?B?UC9PVnhkWXc0TVVQVG9QdDV5MEgyK0k3TWNVNlNJWkxMbitpZ2IrSUhtdjNs?=
 =?utf-8?B?Qm5nd2I4d1NBTWw3NmZNSmVxS0Y4U1c3R1lFeHJneks3VUZKS0kycThyY01p?=
 =?utf-8?B?YWVzM1hWZFB4SWpRVThYOXlIZTNYTUczVzNLa1d6THFaZnNrYkJPM3RaWGpn?=
 =?utf-8?B?ekFHS042WlZZeUtXMm90cFNwNXFBenB5WVcweTVTMm9nTTlqUE9NZ0lJc2NR?=
 =?utf-8?B?bnZ3ejE5NDMvSzdlUG13NVVTTjN5QWZUeHVOZmFubm91WU5vYkVyUXl5Yndy?=
 =?utf-8?B?S1RGcmtKWmRGRjRmZGZHNENmM2RteG1Lak5URzkyMlptcU1JWEVPU0IzQlpm?=
 =?utf-8?B?UjNyNW1xR09OVFVGeDhRc2g4WmJDSSt4Wi9NRXZTU2lGRXR2cGJXUkw4R1Y2?=
 =?utf-8?B?RksyVjN5dmN1dm9YbngzM3RHaFhmQk85R2c1ZldEd1YvWDZYK1BEWnU0MWxi?=
 =?utf-8?B?ajgzQWRZK2NuYStDRjZvbCsyV1FrcTR3VkNHZy8zTzRuT3VTYTNHRGxYdGp5?=
 =?utf-8?B?bzNML1ByODFnZ3h6bHNWZmRyZlJrS2xob1RybHJvbGlwU2V5Yk16V1JndUh6?=
 =?utf-8?B?MThSZGlMREFCdVlkMGFhRFp0bytOS2tNMldYZFRpOCtFcjdpTFhSYTh3SnRY?=
 =?utf-8?B?bm4vOXkyZnB2N2JVZTU4SG9LZHlDR0g3VDhFckhsOTk5Nlg2ZXJDbzVOem1z?=
 =?utf-8?B?QkRYTmpUeFFkeFpLeDVXUThwMDBUWDNUbEZhRUlJdCt2RmxKNXI2VloyRlFT?=
 =?utf-8?B?aVl0UHRKQ2FodTFNbkxmZUY5RTRCVnhjbTdDcC9CblRvSTZzZlVwRDFKc1Rw?=
 =?utf-8?B?ZUtoeU9FL21lOFc0Y3dUbGcyZnNscHM2R0VucnFsNGZGM1FaK3VzVE5FZ3E3?=
 =?utf-8?B?S3B4SVFlWUdaZGxFbEtzQlE0QWYwdThWTzFaa2ZjYWNMaGdMTVYrY3VCM2xW?=
 =?utf-8?B?SzNoN25IaVB4cGx6OGZzWFhNVlVWZHI0K3JCRzRxYldaMWVjdkg3MjVOMHgv?=
 =?utf-8?B?c3lMZjVQZFNZd2pEcW5XSmR2MS9JUjMrQ0xTQnlPY0FaSUgzZUdWUDRPMml0?=
 =?utf-8?B?L01MVEQrdzV1QWxMRHVTaGE3UlprbnU3aWl5ckQwMXF5QWYvbXJ2bHhGbm8z?=
 =?utf-8?B?UTM2U1M3WUJKd0tXc2RIeGFiTk5ZcllYdVppVXdwSlU4QzBVYmpualRvNG5l?=
 =?utf-8?Q?bbPaJmY7lmB2gEIX/5X6+TUei?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be3b419-c829-4268-6a25-08dbbe92f408
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 13:17:37.2841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kk3ous5iz+iKcI0LYC4cMdHBzkMcX/12+u8ZusFOLbB3H640WmLoJigi6Ab+I/wa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.09.23 um 14:56 schrieb Hans de Goede:
> Hi,
>
> On 9/26/23 13:24, Shyam Sundar S K wrote:
>> Hi Hans,
>>
>> On 9/26/2023 4:05 PM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 9/22/23 19:50, Shyam Sundar S K wrote:
>>>> For the Smart PC Solution to fully work, it has to enact to the actions
>>>> coming from TA. Add the initial code path for set interface to AMDGPU.
>>>>
>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21 +++++++++++++++++++++
>>>>   drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>>>>   drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>>>>   include/linux/amd-pmf-io.h              |  1 +
>>>>   4 files changed, 41 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>> index 232d11833ddc..5c567bff0548 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>>   	return 0;
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>>> +
>>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>> +{
>>>> +	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>> +	struct backlight_device *bd;
>>>> +
>>>> +	if (!(adev->flags & AMD_IS_APU)) {
>>>> +		DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>> +		return -ENODEV;
>>>> +	}
>>>> +
>>>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>> +	if (!bd)
>>>> +		return -ENODEV;
>>> This assumes that the backlight is always controller by the amdgpu's
>>> native backlight driver, but it might e.g. also be handled by
>>> eacpi-video or by nvidia_wmi_ec_backlight (when using an AMD APU +
>>> nvidia dgpu).
>> PMF is meant for AMD APUs(atleast for now) and the _HID will only be
>> made visible if its AMD laptop. So using amdgpu's native BACKLIGHT_RAW
>> should be safe, right?
> Users can pass say acpi_backlight=video and use the acpi_video
> driver for backlight control instead of the native GPU backlight
> control.
>
>>> For now what should be done here is to call acpi_video_get_backlight_type()
>>> and then translate the return value from this into a backlight-type:
>>>
>>>          acpi_backlight_video		-> BACKLIGHT_FIRMWARE
>>>          acpi_backlight_vendor,		-> BACKLIGHT_PLATFORM
>>>          acpi_backlight_native,		-> BACKLIGHT_RAW
>>>          acpi_backlight_nvidia_wmi_ec,	-> BACKLIGHT_FIRMWARE
>>>          acpi_backlight_apple_gmux,	-> BACKLIGHT_PLATFORM
>>>
>> I can add this change in the v2, do you insist on this?
> Insist is a strong word, but I think that it is a good idea to have
> this. Evenutally it looks like this code will need to either integrate with
> the drm drivers lot more; or the drm core needs to export some special
> hooks for this which the PMF code can then call.
>
> Actually thinking more about this, I think that the right thing to do
> here is make some code register brightness control as a cooling device
> (which I think is already done in some cases) and then have the PMF
> code use the cooling-device APIs for this.
>
> IMHO that would be a much cleaner solution then this hack.

Yeah, fully agree with Hans. This looks like a rather extreme hack to me.

Apart from that what exactly is this thing supposed to do? Prevent 
overheating by reducing the brightness?

Regards,
Christian.

>
> Regards,
>
> Hans
>
>
>
>> Thanks,
>> Shyam
>>
>>> Also I'm worried about probe order here, this code currently assumes
>>> that the GPU or other backlight driver has loaded before this runs,
>>> which is not necessarily the case.
>>>
>>> I think that if the backlight_device_get_by_type() fails this
>>> should be retried say every 10 seconds from some delayed workqueue
>>> for at least a couple of minutes after boot.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>>
>>>
>>>> +
>>>> +	backlight_device_set_brightness(bd, pmf->brightness);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>>> index 9032df4ba48a..ce89cc0daa5a 100644
>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>> @@ -73,6 +73,7 @@
>>>>   #define PMF_POLICY_STT_SKINTEMP_APU				7
>>>>   #define PMF_POLICY_STT_SKINTEMP_HS2				8
>>>>   #define PMF_POLICY_SYSTEM_STATE					9
>>>> +#define PMF_POLICY_DISPLAY_BRIGHTNESS				12
>>>>   #define PMF_POLICY_P3T						38
>>>>   
>>>>   /* TA macros */
>>>> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {
>>>>   };
>>>>   
>>>>   struct pmf_action_table {
>>>> +	unsigned long display_brightness;
>>>>   	enum system_state system_state;
>>>>   	unsigned long spl; /* in mW */
>>>>   	unsigned long sppt; /* in mW */
>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>>>> index 1608996654e8..eefffff83a4c 100644
>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>>>>   	return 0;
>>>>   }
>>>>   
>>>> -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>>> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>>>   {
>>>>   	u32 val, event = 0;
>>>> -	int idx;
>>>> +	int idx, ret;
>>>>   
>>>>   	for (idx = 0; idx < out->actions_count; idx++) {
>>>>   		val = out->actions_list[idx].value;
>>>> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>>>   				dev->prev_data->system_state = 0;
>>>>   			}
>>>>   			break;
>>>> +
>>>> +		case PMF_POLICY_DISPLAY_BRIGHTNESS:
>>>> +			ret = amd_pmf_get_gfx_data(&dev->gfx_data);
>>>> +			if (ret)
>>>> +				return ret;
>>>> +
>>>> +			dev->prev_data->display_brightness = dev->gfx_data.brightness;
>>>> +			if (dev->prev_data->display_brightness != val) {
>>>> +				dev->gfx_data.brightness = val;
>>>> +				amd_pmf_set_gfx_data(&dev->gfx_data);
>>>> +				dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS : %d\n", val);
>>>> +			}
>>>> +			break;
>>>>   		}
>>>>   	}
>>>> +
>>>> +	return 0;
>>>>   }
>>>>   
>>>>   static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>>>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>>>> index a2d4af231362..ecae387ddaa6 100644
>>>> --- a/include/linux/amd-pmf-io.h
>>>> +++ b/include/linux/amd-pmf-io.h
>>>> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {
>>>>   };
>>>>   
>>>>   int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>>   #endif

