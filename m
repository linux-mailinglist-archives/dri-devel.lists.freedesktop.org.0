Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100574B300F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 23:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7427110EB50;
	Fri, 11 Feb 2022 22:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE22410EB50;
 Fri, 11 Feb 2022 22:06:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmItb8t9IqecKnWN4sSx0Wto8uIu4yyDCjTSvAVadeUzDiuHNZ9tw+yjXEq8K530hsaLbOXXVIr1hZGAOF1aSEGrqA+CjcbN0mnA6JJ/k9THd3YaESS4mAEqMXaQNirZOiJdzUdhJU94RNZ1FcLhZcAVYavPaHsbW4x+jqsFNA2BWVfmxVHbId2mQoDP3caLU6eYIjC1K/bsqGY4cu5cpvsgf8bbmWVrzsLUJnms0FSpHPOuMrlzw+IDwLEMV8o0e0GkW1rLaFKjlqdpunRm64ZxPDIY/i/U8120ynVg9Or+hNCH5X5mYkahatAn5SYqPfQWs3mmSebe5GEHmGtbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCm5eEFZ9xsi/2YQJiAUzW//rClESadSCQ5rl0ZeYGM=;
 b=Mc7X2LAZyGzcRly9cUSplHLseEinModjCX7EPfFx1YIe+oVV/wM4p9d7x6fRM1AFonYpuYUwTtgZ8mU6bcW8ZJ3y//u6FF99LF76+SKSLYrj1uqQZjRS89a8/5r3M/gHNKx43oL+SjA30OFfEbUKLU27wFZDLl03fZdegO0RzwYcja3+v3jnKAOGd2IR6NSu5JREfuy2hbT9Nni9LZ6uaDk6ecTtNbBdv/XZ16/T4ct2dMVMkcQ5aiS8wHNvLzGVxlQvR4KqjyJAKoMWNpuD8cO1GQb6Zag/DPrrOi1tFKBl6EfDJoXyHzVNyrLl6iPs2U8cr4Wyh3Z46d+No+ZPQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCm5eEFZ9xsi/2YQJiAUzW//rClESadSCQ5rl0ZeYGM=;
 b=CusewDAXOv7e7PqlxrVQfCIKPvslBwAH60eBLrmmucL64vWbyniG4is6t2KNabwuWFQ7u6Ta6gUZU7ZuE4/OMbYxdl5k4gs0+8g3jClVsiUAbnCeR2TjH6ACUj9Tx8tPyPKeI3mq0PTphzGL3ffUsJYh5J9p0hHMYAOhrbWuI3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by CY4PR1201MB0136.namprd12.prod.outlook.com (2603:10b6:910:1a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Fri, 11 Feb
 2022 22:06:26 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%4]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 22:06:23 +0000
Message-ID: <9d19c3f0-e5da-c9e5-d192-b5db88353888@amd.com>
Date: Fri, 11 Feb 2022 16:06:20 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 03/12] PCI: Move check for old Apple Thunderbolt
 controllers into a quirk
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20220211213508.GA736191@bhelgaas>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220211213508.GA736191@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:208:256::29) To BL1PR12MB5157.namprd12.prod.outlook.com
 (2603:10b6:208:308::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a25fd8c-d4e3-4bce-90c8-08d9edaabddc
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0136:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB013632F53E55D2C5F0149CBFE2309@CY4PR1201MB0136.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DXhZC6vBJTW3EzG/TqM5O5Wk6qeHFNt/NhshB8bjttSUO/B9kv1ypKDMCbUKRiaWNPEKUpXzQCxIZVVv693zhTTauwDAjUtlRsR1+YNM5l1w2QE6h1vuxOodXm0Rphy5uCaTJjm5k4CJmZ/VP94MzcK/Szdxg0elEbvo94af6B7qDQ3ohrFWQReMv2fjRpIeZdaoS0eKS0swYaxwrwiE97YH+hcH0qYDAr9/TazJA2QReiVg+I6b+f+85ARtKuYP6wkQHvekBskB8HiG4u3BX/e0i9Lm2hvt5kLzP1BCYcimZmni3mVdn5FZ8JRZphkAyRYtgQfz1wq0h2bf0fXVl5ShJV0IJOwGAaoOdJQUgIOJ5Awb0Flnei2sQi94mZYT/plugpVQPfptOnQ5tYYuRfzlsF8Ct50w74l7rQa1YCpMYDMDBDdgnzfyb45caUXcm3caxr2/lGS2OfCI2GR3fizBYx6YJIqM3eHvwq+1Wk8dt3xkL2ClQlgGhBkcrcf2/axpzUq6BHI7CnBfaUsZaUaHQdr4dED6K8pdqtyc/p+fGRiiS6Jp5r0B8HMY0xV7d1ad1FQRbTNNFTJZRlO4IuJ7vKf3yLmLMNwUIKLCFRbgIsLDdMTp8GtGljGwq/V9qGbRoOuePfe+LJjFcrbMZcoGNGHYudXYoG+sTnOZFwhrrSBUE2qHgEBFJRn8q/cUPnCelcrM47+/tSTeD4Ct7aAcr+p9vPJsDOnBFWDeiMk6R81D0aYB9uiVc/LEreab0SqCJLGiDBcECBoBWTGNtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(47660400002)(36756003)(66556008)(38100700002)(2906002)(8676002)(31686004)(53546011)(6512007)(6506007)(19627235002)(508600001)(316002)(54906003)(83380400001)(66476007)(186003)(6486002)(26005)(7416002)(5660300002)(2616005)(4326008)(8936002)(6916009)(66946007)(86362001)(31696002)(46800400005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWQyNmFKYlNhdkZrR0NvN3lCemVvUzduRDVncGFMc3VTVzE1Yk5jQ25WaE92?=
 =?utf-8?B?ZzZaNy84U1dYSlNHaVJFSHgzcjk5blE0VXQvY3orWnEwVkpJY2NQZ2E1WFp0?=
 =?utf-8?B?VkdCdSt6ZmNpcmNKcGJiUXZ6QXVVbmpaMUx4Y1REcjIzQlFSbGRGQklMdzha?=
 =?utf-8?B?K3RVM1JJVGRBWDA2OE5PY2lJcFVMR0Ywa1JmQVZoSlNKZWo0eEdPeWVHbSt4?=
 =?utf-8?B?RmtOdzJRYTQ5bFQvQ1l4WjdaRGxjelA0M1pqb0UzMTVYdkVCUi9ZaDdDQzF5?=
 =?utf-8?B?b00ycFVqaDdqcU1ldjhRdi95eUdBbXhIUG0vYzFZQXlxZHlYTFBiUW13dis1?=
 =?utf-8?B?R3VBTjV1MjRhaHJkb0FQSlIyQktFYnkyTXQ3dVBIQnpjOHltOUZhbUJnMTBD?=
 =?utf-8?B?Z2IvMm1jOG1iKzFhNWIvb2wwWTNzZzZ3YW4yQnhSUEdHb2tDK2EvVEp5eHZk?=
 =?utf-8?B?UExJT3ZUVW5RUjVtOEhvc0lKNzRNSXROeUlzdDRVc2NaZ2RZWXFnME5LMHE4?=
 =?utf-8?B?eG4vN0JjWTdnNTFCaDdnbCtCbkhqckN5MEh2d1JTWkJxV1JTRlR0SlBFOGlt?=
 =?utf-8?B?Yi94Zks3bmp4MmxuQThMUjhwTWhMU00rU2dscG9uekhOeXN0RXdxeFA4OXht?=
 =?utf-8?B?WWh1c2JReDNNcTlTSmRKelRTMkZPOVdkaGdoVlhQeTBRU0pFSFRvYWJGWVVP?=
 =?utf-8?B?LzRQaTRTRTMrOW5zK2hhclVDeXh0TGM2WVMwZE50R3ozYzNXM3NjY0Fjc3VU?=
 =?utf-8?B?eVFUU3RlSHVlc3dCSFkwK1BGeHEwQmoxZEYzalJuTUxZcTdlNS9ZVnp5SkxL?=
 =?utf-8?B?L2lFa3JITU4yZDFMUHlBNGNWNDlpeHVuN2puU0dHUE1tUHVCUWU4WmQ1SXBr?=
 =?utf-8?B?SWN2aHhTR011U01Fejg0ajdnQ05oU1ZraFpUUlFJb29BU3plZUFSR3hlcEFP?=
 =?utf-8?B?VERSOHprbGdSd200ZDZwUGd6ck05YUxmNk5tdy9IYzNYNTNjVmk4SEFldHpl?=
 =?utf-8?B?RkZRQi92ZDJWL2djaEpMS3N1RFJNaC9RUFh3U1pFNWUxLzkwa0p2UWljSXlQ?=
 =?utf-8?B?ckREamhjbVBnQk1SemxWVW1HQzhQTFZtRzlkaWQzTkV3dTNRZ3Y5M1AyaHU3?=
 =?utf-8?B?NXMxblA1K21zTHR6aisvVGJ2UzduaXY3eWVHTmtqMGtJUGZpcTZEYWRFcDBS?=
 =?utf-8?B?NGJHOHJOc2g3bmZ6WDVRQndyUE1qWmNUakhuSDI2Sk9jZ0h4dFBoV0c5UDBO?=
 =?utf-8?B?YThyV2ZDUlRqbFVsRTdFQmVFMGZRUmUxNjF3b0xneWpGRTE2VG84VElOd0ox?=
 =?utf-8?B?K3BBZ25ncjdVTGJNbzcvUElLT0RleDBaekFibmtaUUJFUUNzdENmaDNTbXRl?=
 =?utf-8?B?VDBDdXNwSVNUUk01NnZUajY2YmgraGZ3WlZHSFZVVEo2M1loOUo3ZTBCcmpU?=
 =?utf-8?B?R0hRb2JRRWhhMHpqTEpYbitpK25teUUvaXhvaVlPa3oydUVTWDQxb1NPNEty?=
 =?utf-8?B?MW1FY1pVOG1Cc08vS0ZEeC8rdmQ3dGthcUx3UTBJSFlTekNMeCt6d0RqbnlQ?=
 =?utf-8?B?N2U2U2luNE5QTW5EVFovWmdVblh3aWNpa1hRWWxicXB3WlZrQnkreStrbUJo?=
 =?utf-8?B?djh4R1lzZFNZY05EMmRwTkFQcHc0M3VEMjhreGF4L1hBRFdrd0YxbTlqa0VJ?=
 =?utf-8?B?SituSEpGMUdRWTJZM0liOUFiOWxhUWRUQWNjdCszZVdiTUhRRlpaUUd5eFdn?=
 =?utf-8?B?cEUreGNLMFI0YjRxSnJLTFl4TUNleWsxdE5iZkZjTGx3dDUxUzlxU1FDd3BW?=
 =?utf-8?B?Skk5TWR1MlRNbUhoa2xEREJCN1BpWERxZ2lqWXdveDJYME9uM2lvamJhM3k2?=
 =?utf-8?B?eWcwQVRUTjdCMkhYOWdFWWNzQ0VtK2dDTURHWUhCMEpwMUFpMWdEVTA1ajYx?=
 =?utf-8?B?ZGdRVitOcmhYeTZwV0RpMjRIUEhEeVFRM3hqUlJzbEQybWo4RktPcWtkUllZ?=
 =?utf-8?B?ckFHVlB5SS96YWhnNEhhci9tQVhNWGJFazN2QWR2a2p5NE5OYjFCbGJ2ZFc1?=
 =?utf-8?B?bDJQeVVzTkhiOWpRSlF6R0d3WkVFV3QxM1pOVjdZdTl1ZXhwVGhEMHFmUkxj?=
 =?utf-8?B?VGgzejYyMTkrMUoxc1lFdFovdWZXd001QmhxK0pjOFR3c1d1d1AybEc0cXRT?=
 =?utf-8?Q?3A0f3fSwZHN3igJnsOTWYf4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a25fd8c-d4e3-4bce-90c8-08d9edaabddc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 22:06:23.6301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWHY40afzUpbdiZb8Nwiaw/vCv1+qg/blVc1L7+/PTbUmjbheWuX89AFAJo7loII/g+Kolg0ug4si5KsEdu0fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0136
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
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com, Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/11/2022 15:35, Bjorn Helgaas wrote:
> On Fri, Feb 11, 2022 at 01:32:41PM -0600, Mario Limonciello wrote:
>> `pci_bridge_d3_possible` currently checks explicitly for a Thunderbolt
>> controller to indicate that D3 is possible.  As this is used solely
>> for older Apple systems, move it into a quirk that enumerates across
>> all Intel TBT controllers.
>>
>> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/pci/pci.c    | 12 +++++-----
>>   drivers/pci/quirks.c | 53 ++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 60 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index 9ecce435fb3f..5002e214c9a6 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -1064,7 +1064,13 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
>>   	if (pci_use_mid_pm())
>>   		return false;
>>   
>> -	return acpi_pci_bridge_d3(dev);
>> +	if (acpi_pci_bridge_d3(dev))
>> +		return true;
>> +
>> +	if (device_property_read_bool(&dev->dev, "HotPlugSupportInD3"))
>> +		return true;
> 
> Why do we need this?  acpi_pci_bridge_d3() already looks for
> "HotPlugSupportInD3".

The Apple machines don't have ACPI companion devices that specify this 
property.

I guess this probes a different question; can 
`device_property_read_bool` be used in `acpi_pci_bridge_d3` instead of:

	if (acpi_dev_get_property(adev, "HotPlugSupportInD3",
				   ACPI_TYPE_INTEGER, &obj) < 0)
		return false;

	return obj->integer.value == 1;

If so, then yeah this can probably be simplified.

> 
>> +	return false;
>>   }
>>   
>>   /**
>> @@ -2954,10 +2960,6 @@ bool pci_bridge_d3_possible(struct pci_dev *bridge)
>>   		if (pci_bridge_d3_force)
>>   			return true;
>>   
>> -		/* Even the oldest 2010 Thunderbolt controller supports D3. */
>> -		if (bridge->is_thunderbolt)
>> -			return true;
>> -
>>   		/* Platform might know better if the bridge supports D3 */
>>   		if (platform_pci_bridge_d3(bridge))
>>   			return true;
>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>> index 6d3c88edde00..aaf098ca7d54 100644
>> --- a/drivers/pci/quirks.c
>> +++ b/drivers/pci/quirks.c
>> @@ -3756,6 +3756,59 @@ DECLARE_PCI_FIXUP_SUSPEND_LATE(PCI_VENDOR_ID_INTEL,
>>   			       quirk_apple_poweroff_thunderbolt);
>>   #endif
>>   
>> +/* Apple machines as old as 2010 can do D3 with Thunderbolt controllers, but don't specify
>> + * it in the ACPI tables
> 
> Wrap to fit in 80 columns like the rest of the file.  Also use the:
> 
>    /*
>     * comment ...
>     */
> 
> style if it's more than one line.
> 
> I don't think "as old as 2010" is helpful here -- I assume 2010 is
> there because there *were* no Thunderbolt controllers before 2010, but
> the code doesn't check any dates, so we basically assume all Apple
> machines of any age with the listed controllers can do this.

The old comment was saying that, which is where I got it from.  Yeah, 
I'll update it.

> 
>> + */
>> +static void quirk_apple_d3_thunderbolt(struct pci_dev *dev)
>> +{
>> +	struct property_entry properties[] = {
>> +		PROPERTY_ENTRY_BOOL("HotPlugSupportInD3"),
>> +		{},
>> +	};
>> +
>> +	if (!x86_apple_machine)
>> +		return;
> 
> The current code doesn't check x86_apple_machine, so this needs some
> justification.  How do I know this works the same as before?

Mika and Lucas were saying the only reason for this codepath was Apple 
machines in the first place, which is where this idea came from.

Something specifically relevant is that the Apple machines use a SW 
connection manager, whereas everyone else up until USB4 devices use a 
firmware based connection manager with varying behaviors on generation 
(ICM).

> 
>> +
>> +	if (device_create_managed_software_node(&dev->dev, properties, NULL))
>> +		pci_warn(dev, "could not add HotPlugSupportInD3 property");
>> +}
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_RIDGE,
>> +			quirk_apple_d3_thunderbolt);
> 
> The current code assumes *all* Thunderbolt controllers support D3, so
> it would assume a controller released next year would support D3, but
> this code would assume the opposite.  Are we supposed to add
> everything to this list, or do newer machines supply
> HotPlugSupportInD3, or ...?

This quirk is intended specifically for Apple, which has stopped making 
Intel machines with Intel TBT controllers.

So I don't believe the list should be growing any more, if anything it 
might need to shrink if I got too many models that weren't actually in 
Apple products.  Lucas probably needs to confirm that.

> 
> How did you derive this list?  (Question for the commit log and/or
> comments here.)

I went to pci_ids.h and got all the Thunderbolt controllers listed there.

> 
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_EAGLE_RIDGE,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_PEAK,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_2C,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_2C_NHI,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_2C_BRIDGE,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_4C_NHI,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_4C_BRIDGE,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_BRIDGE,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_BRIDGE,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_NHI,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_BRIDGE,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_NHI,
>> +			quirk_apple_d3_thunderbolt);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_BRIDGE,
>> +			quirk_apple_d3_thunderbolt);
>> +
>>   /*
>>    * Following are device-specific reset methods which can be used to
>>    * reset a single function if other methods (e.g. FLR, PM D0->D3) are
>> -- 
>> 2.34.1
>>

