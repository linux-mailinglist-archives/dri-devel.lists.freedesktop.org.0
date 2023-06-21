Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B64738CB9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 19:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADC710E33C;
	Wed, 21 Jun 2023 17:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0190F10E341;
 Wed, 21 Jun 2023 17:08:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYB8VTtneW8mjooQaNGTFmVJ6Zm4JWNfFVP+HzfMglMnOHmN/dbstI9x9LJ3I8WcJtul926GS6oHzUZ0c/Njo7xJg5IsRCFmh6MfRG+/XQfyt/GIA2o0JmbTAtTOAtq9HJvqDR3C//kinr6u0l4kZYV/2ry3e8/6ZQ6L8m49ynSKstbElSpam8ClGgA+c2KRnW3b/93Y/cTx5/ASq0Q+LmdI7Cqi7J5hcaXh0TmURF7UfZDpkioO0ISPw8K8485sX6HagOYj29KTLqijitMj61GRVi+JwrvX8IDtps07enT2J9rW5HDeMieiV8iaWJ9s/N1G+r9nkCa28Leeo1rVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9KX6vjWCiEaoz9+fmMzriIOIhMMBvv8jQarjqQypBk=;
 b=igb/CrHGRnhD9nlaqThRdCQmHKLziuQ0r2bzotLnvfJ+GBscya4PNKAt+pwL8GXj19wDNwNUaD7Hs44/EJ4/UJL9ZpEv64Ka2dyC2jm4IMbB9/DcMxGCJEyt3+7lbsjgzauiIA+LWqrb1B+JgumtnCKB+iD0UBcE9f5yVfOfOR/EGQpulz1PGe+UQdi4wxJsLGfPRGOthrIdoO6e/CI5Aqgi/GgAjyllojKH2zsUkU3HgYsJGBE3me0SMyWnvBxmwySfJjCh9HSlzZAU36HSzOZxLOS1Xe9S/H79/Uk6R1nCTh3ERoEDXxhSkPEuu5AwEKGsNekORXoBWjKeF54ZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9KX6vjWCiEaoz9+fmMzriIOIhMMBvv8jQarjqQypBk=;
 b=UNpsF/FuMDA5HK/k3JPC+6zBIhy8Z9CaFOlEpaAiqhEeD92hYqgQSnZP3VDcTK95PlYQrFrlowFtTFbmJpku2qM97+URS4zkl0kNMOW1758hYxmjK1KL+e7k7KxQQ6HiiMziVndo2qzrMDIfdqa5kCMUlpcl0ffobFe2ii8c7PI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 17:08:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 17:08:37 +0000
Message-ID: <33d80292-e639-91d0-4d0f-3ed973f89e14@amd.com>
Date: Wed, 21 Jun 2023 12:08:33 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
 <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
 <b1abec47-04df-4481-d680-43c5ff3cbb48@amd.com>
 <36902dda-9e51-41b3-b5fc-c641edf6f1fb@lunn.ch>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <36902dda-9e51-41b3-b5fc-c641edf6f1fb@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0120.namprd05.prod.outlook.com
 (2603:10b6:803:42::37) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: dab95048-8de4-4020-ecc2-08db727a2748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKaCygsjdpm9d9kYBclL1gVH7sih1jzYUE1i3hT02TVqLlCHA+2PTS73psXg3dJy8U33SvV2gvx+BSkGJsFUbJzwaM47DWRll+h57O/dQaqv+MkFuH4i3a0kL9ESLNj6/gd1JrBTkB4A34w7NToTV4EtosOdSlDjTwbc3wrQD0E39GMOqOmugMCF25R9l7X5XQ+Ph/P1usEbGXL7FsZIV/uggXidD0lqOEmUED1QVVNhZFKTaAIDtRhJb89+ab7EoF/6ZC7PcanZpmeoA0ivN+6Wmu6itf6sYjEGYy+BbkjPYLVTPq2IlB/wvucmPlKKRB+pGrq9bO97lx+5+glutncS9urtX7UbCZYRQ5q9A7MvSvDyhnpqRJgw0pnFn9ZLhReyIJ76crKsjYwKIPfqMkkWZxSpJd/qOiQpx32tjyVSr74d4/LI25rdCNtNnZfKCWqCr3rs5+UPHnjSH3jw5uY+UCmxbxyu+0Yp4BT+dIotbkJYEVnbNHFdtDiwBWXdkp2pZ3cpEd/ROLVWyFbimJirVbjoiPxBIe+Xe3e0ecinX9wE0mzESZzyZJFQwjkeyASSxNeimOzDhXv2Olt45bnHAWp4TGkBYoM0DyHBTmGFtlxKWBbtLoRqYdFjd8b9403nvBFIUBG4anf9G1Mo/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(26005)(478600001)(6486002)(2616005)(6666004)(54906003)(83380400001)(6506007)(53546011)(6512007)(2906002)(7416002)(5660300002)(36756003)(86362001)(66946007)(4326008)(31696002)(316002)(8676002)(6916009)(8936002)(38100700002)(66476007)(41300700001)(66556008)(31686004)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUVkeHBBWm9kWEVqRGdFRnZMQWtQZHRXS0M5WVRBOTVqSFg2cHNyZ1JLQk9K?=
 =?utf-8?B?WjFwclc3R1RNQi9uM01tNVg4L1pSQ1NKNXd4djV3YkpZSHd1QmFEZUltUlJE?=
 =?utf-8?B?NXRmV1NGMWMzdWRnYnorQnNCaXUzS1FiTjZFSC9ZTFJDNkZCUDJWU3VTRndR?=
 =?utf-8?B?bEdYcGxKNVUyVk1wR2pnY0JNZ2tCOGpDdytCMjFjOUd5SU1CY1oybGZZcXgx?=
 =?utf-8?B?Y1QwM2k5WU9mZHJBNEpWQmd3VDY5Wk1wTU84QVdDMUdVcjg5amNNeFhCeEw0?=
 =?utf-8?B?aW1sc1hTWlNJbmRLOTZjYjd3VkFsRVhtT3ZPVDdmWFhRTUcwbW5tc0V5clNT?=
 =?utf-8?B?MmZTejhoUldLblhSL0lrSGVMUlowdWl3cFE4Q0tTbmFlR0ZKRzVMR2N5THNr?=
 =?utf-8?B?d29kRkFxWlhpMWRHUkIzRjdsTmJsNTI4NlMzZ0UvYU1HVG9mRERaQlE0QzhN?=
 =?utf-8?B?YlF5NEtYV1A4RmtXTk5ZTjFnUUlpSXpmUi9pV1N2U1YvK2FJRTl4M1BpQWJ2?=
 =?utf-8?B?bnl1aUFraDZZRWI5L3FxYnF2TUV0U0liV1h3VVpNWjByNC9FWlV1djI2OXVB?=
 =?utf-8?B?Nkc4ajVpd09tYjllTjhBMzBPemlLb1BMOHpCZUNidkt1ZUtSYlRGbmhUU2NU?=
 =?utf-8?B?ZnlNdXY5czl1eVIwMzRObzhnUmwyZ0tNMXlpUnk5ejlzVG1tRlZLQnFoMmIw?=
 =?utf-8?B?V3FQNDRhZWkza1A4QUMvODFCOUJ5VER5ekx5c1AvczViTzl0SlhBQzNHMWhM?=
 =?utf-8?B?UUYzVW5LS1dxRG1ldEVtaS85Z3hJQkhpUTFoMmwwY1BFUTBIaTVsQlhONi9F?=
 =?utf-8?B?YVBUV0Y1SUJoajV0bVA2UmpiVzNsVnJTQzZXSVNsaHhjWSs2b01qQ2E2U2pv?=
 =?utf-8?B?RlRXMkdqVGtDVE02WTk5aDF6dGNSc2pQVjNPSE4vUXhrSGd4ejdWdUZOdVJk?=
 =?utf-8?B?eGw4aklMMVM3VHpwbWhYT3NkUkkvejJ3VEE2QlRFMngyazk4M1RucDVnRG9C?=
 =?utf-8?B?Q29QMUF1RmFnTHA1Y0RLS0gvWTZoZnVaV1BQdzF2c2RlWm5CR1ZSOGlqTnNr?=
 =?utf-8?B?bytvbk5wMGtwRjVJUG9pcG56aWhsSG1uWktBaTQrdjd4bEFSVlMrRHU1RW1P?=
 =?utf-8?B?Sm4yS29lQVRSbkZ6TzRNTEMrYitWOGhhTUFpUUlZcUFTaDgxMGE2Y1RlUU5w?=
 =?utf-8?B?VU5sY3JQRHNJR3E4UWtjSTZuaFpVNVBSeDE0RmdBRWNwOUI3ZjdpbkRDTlE2?=
 =?utf-8?B?SHc3QmJCS1ZoQXQxTEFqMTNBZVJFSG12ZzExYzRxVUZJMXJndnorMlBDRTJK?=
 =?utf-8?B?SnFUNDRUbGpiMnc2Z0c4Yk1BcFV2WDRPbzZicUppQVRHNzVEK0VhT056MlZY?=
 =?utf-8?B?THFsb2lsN1NJcGJCc2NLRFlXbG5qaG1OR0puR045ZkF0dkF5NzhjWGhoeU50?=
 =?utf-8?B?RzJua3pNaGRXZmJMQjd0WFFGbVpLQVV3SndFM3Vabm9CdC9GNm9yMzd0T1pO?=
 =?utf-8?B?NUFBWGpXODNxZm1UTG1uYmxaOERxbEVYUzRzNlpaVk9tdjRBb043Nkc5b2Jq?=
 =?utf-8?B?QVpkeHI3RTFGM1lNNnpMYU13WEt5OXdHNFZia2t4K3hwM1BsR3dlN2pWVDNT?=
 =?utf-8?B?V1BMbHRQOHhXQnVudFM5WmFYdmhCenA3MWxhRXU5ODIxWld6MUIyK3JoM2Yw?=
 =?utf-8?B?VFdmTWpBRWJLOU81a2ZnUGRhVGdDQUxMK0hpMWg5RUs3dFFjbE5zUEhHUkdO?=
 =?utf-8?B?VGZUR294em0xQ09zTzcxazJZL05rNDRjNmNabk9GNW1EVEpqR1BoYXMxKzhu?=
 =?utf-8?B?bE1aek9OeUpjZTVESGpvQUEwRnlGWGY3UW9sZlZCb3JESE13ZG15bzV4azlD?=
 =?utf-8?B?VUh6SmZIVXFsMDNVeG9la3FzZ2pJZXNHQ3BIWUl5cWNabEpZYkZSUnh1d1Jp?=
 =?utf-8?B?YTNEdDhwU1Zud2MyVThvSWN0aDdFZDVkR1AzSDRZaWswVjRhKzEyd2NYamVG?=
 =?utf-8?B?N0FRSjdTR0YrUTZFZllMcHBYeXZuRXhnTndNV1UvaFpWL0k4OU9UZmxFUFg3?=
 =?utf-8?B?TVE2aHZ4b1VCNVphQXhiOVR2ZVhsN3lDYWJyWW9FN2dvVHJPNUNxSkJ6cFRO?=
 =?utf-8?Q?K5Hlxc/XGyGtBsMq5N+OG7xlN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab95048-8de4-4020-ecc2-08db727a2748
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 17:08:37.5273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FBWPmZUh1kT+RCT90pFbIwQWqF4hjf+rDulOmBg3YIdiqG4cqS67rLtk4q58mDW83BZHJbJUa3wRfawNBthhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, rafael@kernel.org,
 trix@redhat.com, lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, Evan Quan <evan.quan@amd.com>, netdev@vger.kernel.org,
 Xinhui.Pan@amd.com, linux-wireless@vger.kernel.org, edumazet@google.com,
 christian.koenig@amd.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 Johannes Berg <johannes@sipsolutions.net>, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/21/2023 11:52 AM, Andrew Lunn wrote:
> On Wed, Jun 21, 2023 at 11:15:00AM -0500, Limonciello, Mario wrote:
>> On 6/21/2023 10:39 AM, Johannes Berg wrote:
>>> On Wed, 2023-06-21 at 17:36 +0200, Andrew Lunn wrote:
>>>> On Wed, Jun 21, 2023 at 01:45:56PM +0800, Evan Quan wrote:
>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>
>>>>> Due to electrical and mechanical constraints in certain platform designs
>>>>> there may be likely interference of relatively high-powered harmonics of
>>>>> the (G-)DDR memory clocks with local radio module frequency bands used
>>>>> by Wifi 6/6e/7.
>>>>>
>>>>> To mitigate this, AMD has introduced an ACPI based mechanism that
>>>>> devices can use to notify active use of particular frequencies so
>>>>> that devices can make relative internal adjustments as necessary
>>>>> to avoid this resonance.
>>>> Do only ACPI based systems have:
>>>>
>>>>      interference of relatively high-powered harmonics of the (G-)DDR
>>>>      memory clocks with local radio module frequency bands used by
>>>>      Wifi 6/6e/7."
>>>>
>>>> Could Device Tree based systems not experience this problem?
>>> They could, of course, but they'd need some other driver to change
>>> _something_ in the system? I don't even know what this is doing
>>> precisely under the hood in the ACPI BIOS, perhaps it adjusts the DDR
>>> memory clock frequency in response to WiFi using a frequency that will
>>> cause interference with harmonics.
>> The way that WBRF has been architected, it's intended to be able
>> to scale to any type of device pair that has harmonic issues.
> So you set out to make something generic...
>
>> In the first use (Wifi 6e + specific AMD dGPUs) that matches this
>> series BIOS has the following purposes:
>>
>> 1) The existence of _DSM indicates that the system may not have
>> adequate shielding and should be using these mitigations.
>>
>> 2) Notification mechanism of frequency use.
>>
>> For the first problematic devices we *could* have done notifications
>> entirely in native Linux kernel code with notifier chains.
>> However that still means you need a hint from the platform that the
>> functionality is needed like a _DSD bit.
>>
>> It's also done this way so that AML could do some of the notifications
>> directly to applicable devices in the future without needing "consumer"
>> driver participation.
> And then tie is very closely to ACPI.
>
> Now, you are AMD, i get that ACPI is what you have. But i think as
> kernel Maintainers, we need to consider that ACPI is not the only
> thing used. Do we want the APIs to be agnostic? I think APIs used by
> drivers should be agnostic.
>
>        Andrew
I think what you're asking for is another layer of indirection
like CONFIG_WBRF in addition to CONFIG_ACPI_WBRF.

Producers would call functions like wbrf_supported_producer()
where the source file is not guarded behind CONFIG_ACPI_WBRF,
but instead by CONFIG_WBRF and locally use CONFIG_ACPI_WBRF within
it.  So a producer could look like this:

bool wbrf_supported_producer(struct device *dev)
{
#ifdef CONFIG_ACPI_WBRF
     struct acpi_device *adev = ACPI_COMPANION(dev);

     if (adev)
         return check_acpi_wbrf(adev->handle,
                        WBRF_REVISION,
                        1ULL << WBRF_RECORD);
#endif
     return -ENODEV;

}
EXPORT_SYMBOL_GPL(wbrf_supported_producer);

And then adding/removing could look something like this

int wbrf_add_exclusion(struct device *dev,
                struct wbrf_ranges_in *in)
{
#ifdef CONFIG_ACPI_WBRF
     struct acpi_device *adev = ACPI_COMPANION(dev);

     if (adev)
         return wbrf_record(adev, WBRF_RECORD_ADD, in);
#endif
     return -ENODEV;
}
EXPORT_SYMBOL_GPL(wbrf_add_exclusion);

int wbrf_remove_exclusion(struct device *dev,
                struct wbrf_ranges_in *in)
{
#ifdef CONFIG_ACPI_WBRF
     struct acpi_device *adev = ACPI_COMPANION(dev);

     if (adev)
         return wbrf_record(adev, WBRF_RECORD_REMOVE, in);
#endif
     return -ENODEV;
}
EXPORT_SYMBOL_GPL(wbrf_remove_exclusion);

This would allow anyone interested in making a non-ACPI implementation
be able to slide it into those functions.

How does that sound?

