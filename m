Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743BB7BD2EB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 07:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDA410E0C7;
	Mon,  9 Oct 2023 05:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A251E10E0C7;
 Mon,  9 Oct 2023 05:56:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5jdllcSjugBFICkmb1SzTq5CD8yEwJJ/yTIyirVPHAyNqs2GX+w8TeQ1yDCvL0V9+vTfEtQ7NZFQ8P9X0nqs4XE5XC3StqGLsXhQ1ATLtDPXBgPf8MQ81ymbpkLOlWssQmttNhEomig7xz4CC9ENPpUkDzC3JfCpj2g910Avrb/Wzk1Tmrz8nWfg6bW5iStizJdlkVdKB0P+gt26WfvtZo7J34J58BrW9k1lCIgfRBdjySPzMUl2gUHHJfPJfoYvJa1Lfzhl7lLj0xLyTKamd6A3Cp601+XnP1C1/4bg7CL/lI6kEZRR94rGbChN915upSvqFQFyPsYR8v4Ppp0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeYxtBGWkGe09dJRuwj/lOqJsER43qWv1ykrWcqV9Do=;
 b=DN9WDsyL+CGrTrXjyw5D7QFmBNLkEi3knOsGLTDw/cgI2Q2uRkc2FvKrfJxcwimYVwXTxrYR0XNLfiaBmp3ylLHbRXeVsuME5yBaGBYhB1MXMR9GBjTchCOc3d7c/6p92yYPcnt90UNxe1rNf3ykKYCMR7CkZLi6AOW4mRZLe1aOi6fZELn5bUHWPKvl9FyEW95qf7H81hL24ft0FX6ni0AHuabTz+rWmHppPFto2AWQA82GY8ykpX7nrPhwFAyBkkmkkbkY428yPsbBJdLYqM6qUiEGfr0TwZTszrE6L3+p7p/hckZDb+HbbBPpuAjxkpei54vqvBp6Odb8hnU6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeYxtBGWkGe09dJRuwj/lOqJsER43qWv1ykrWcqV9Do=;
 b=R5cwADm7BS55y/hDmQjkv7gzRf6QZF79CyHwmAPdxzMtIaNMiMRSmec+wOLox5TICEFmbV9gmibbjd7E/H3IYmdQkdiC5oqoDef37XinvBLomipJh3/5vRb9OU3L/JHwKfMXDOcCkeqLLZJ0m1LjQJ6a08OeUMsYrpj8XOx25us=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY5PR12MB6300.namprd12.prod.outlook.com (2603:10b6:930:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 05:56:17 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 05:56:17 +0000
Message-ID: <c5834d5e-af71-4d96-88ae-c2acd5f6604b@amd.com>
Date: Mon, 9 Oct 2023 11:26:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
 <20230930083715.2050863-13-Shyam-sundar.S-k@amd.com>
 <e7b33961-23bb-cb8-2941-ced3f0cf2620@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <e7b33961-23bb-cb8-2941-ced3f0cf2620@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0129.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::8) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY5PR12MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a8aae2e-9eff-4108-78b1-08dbc88c7459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ySogopu3FuzPt8wSzy8avMBVqaYWb0SRTBlSm83mJ0Qm0F97+4jWNbrjkc3CtqenQr03phrddVLGf8I9oM2b/U5yliaoWZx/PRXixTRuDCZ6NCOeuNzJXGDCAwO4ts8PRrF3iL8b1a6/Ma5LbJrdvW0pD89dKJQ873R7WcyAF+rWhJr0qmlNNWH+XsK/YX3IiyzcFK77FDW3hd1xgX3AcLAHV89xvkgZA+p6gv7zilG3Y1MSICQjI74HiL7ABXZBNtC8RPIfsNdeNm/IGkxQs8N2FIcuUN5RAA5N+d5NboWa4yUBogGs/lJcdMpcsxvOJnczxWLVlBf3bB38oPmul0z8/qhWQ95VMUgwEkSjlFFPx7Duf8+LPWXOY9SKUIeJuBRFiAhAdLTTSukCBond5yd2ZxuT42fuX2mglroG90BFU4geROYgiDGJ/IYfUKO7ExkUywrqSUlXpPzrrxW9BYMB7rHiDWW8Wzrihb8e5pMVOPs9kTi6gV4Yuxj+aUAPI33cAc5tMooFblCg5rgtx1Hq9HuFiQFKyNt5W9zy88qf225JFG5QoDtW0y028KpI4oH91Yw+c7do6QYjZKQoTWBS1kOnjYKDFS4i5/QNAMVD2gdX/T4CBQZN7XcWc8ZMUl8BK+QI7Dse/u+ffV0nbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(31686004)(2616005)(26005)(53546011)(36756003)(31696002)(86362001)(38100700002)(8676002)(83380400001)(8936002)(4326008)(2906002)(7416002)(6506007)(478600001)(6666004)(66574015)(6512007)(41300700001)(6486002)(6916009)(316002)(5660300002)(66556008)(66946007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2swL3l1ZzVOeHJnSndJZG5IVVlGSWNybXNqTUFmcWUwYzN1aXZvNGVBanBM?=
 =?utf-8?B?cll6aW1CMkthdmw4TDlGbEVJYlJLWEg2ZXZwU3Ryc3phQlVZbzJaWmJoWHFs?=
 =?utf-8?B?Njk2K2c0aUtvN2V4dlZxR3JGdDNXcllwem9JQ09zaWl2VjlzS3BQQVpZN2wz?=
 =?utf-8?B?UWcwT2tBbXlMTWszTnpibDhGdGN6U1RxL2JHOFZpRmJxa3JYU3dLak96dlQv?=
 =?utf-8?B?NlBsM0U1Uk5CeGNuYWpQSHRjQWg2M2krcDVjRTcvbGN3a1Nyamhuck1QTkpM?=
 =?utf-8?B?RFZDN09iTURvMWdMUXZVWnpoSjgxRDlqQWJWMkl3Yi9nODNicS9BeUtBTE8x?=
 =?utf-8?B?ay9EMVpGdFl4bUVjZVFtSXdxcEp3UEJhaVhqV3RtejZCa1ZxTjJEOGoyZTJ6?=
 =?utf-8?B?OFlneVZTNWNZZjNIbjhIZE1pOFpyVjUwUE9KdmMrellONTQ0Z05hWkxPNWhT?=
 =?utf-8?B?NlhNdlJYZWlvVVRtZmpWYk96ZGZPYkc4dElMUEhLNkIvVFlQYXlvQjNlZm5x?=
 =?utf-8?B?eGZiem9TdzdBZXV1VEJwS09CREMwcGp5UFdjVmsrV1V4NGk5QTJiVkw1RElP?=
 =?utf-8?B?S1dGakxUalJmZlFjME5VOFVPb3VHK0IxZzBvU0FZeC9DTUNKTWt5eDFKdGl1?=
 =?utf-8?B?WTExRGpoZGdxWW9yOGU2blNBK0FndnRPQllxS0t3VE9FdkVpelhRQW96Wncv?=
 =?utf-8?B?ZUhtUGhrUHhSaFZMYTQrTTBTejlWdE8wSHVWZW1BdHNaZXJlb2F2b2JTcHpU?=
 =?utf-8?B?N1h2NmlneGl1cTIvL0xIMndUMXNJSXU5UFRzb1RGSEhTOFJhS0FDY2I5bGUx?=
 =?utf-8?B?N3ZQY0gycVo3V2VaOUhLa3pRanhyaENKRTRMNFNieUhCejdKNjF1ODF1Rm5R?=
 =?utf-8?B?MkVZZ3FxbnB2d2tCa0M1c2hieXN4K2U0d3NaTURCR240c2VJRmpCNW9YemVk?=
 =?utf-8?B?Qmh0THRYRGZXOWtXVnZza0tGcVBCRmhtVTRmREFkWUZnM3hPb0V4MVdhM2p2?=
 =?utf-8?B?eFVJQW9xSyswVERwanExekZMZVRRNDRKeU5oVDVLOS9KcDMxd2NkancrQWVM?=
 =?utf-8?B?cXpDU3RwdTlEUWE5T3BrTzdHZVVoWmZqSWkxZ3doNS9CUE8xd3p1ZklZQnJs?=
 =?utf-8?B?cFNUWFdHWGhxZjRmM2thNGFVVU5MUldycmpjWVRoTXhCbUE5ajk5K1U1SjB1?=
 =?utf-8?B?RXdmM0RZRzJYS1hCeGJNOFJFK05nem9xQldjdHdUeWEvTGlsWkdXM1RkblNt?=
 =?utf-8?B?OE5KeXpROTk3SkkrODBVY3AxRWwrOHJmRk1NVGdPUWthdTZUK0p2RGF2S2hQ?=
 =?utf-8?B?bG9UV09wMU5KMXA3dFBzYmI4YVUxRUFOd1NkQnhjMTlVT1NFREt4VTNBSkI3?=
 =?utf-8?B?ZVVWc3pNTzlNbVBLQTNsZEhJU1pJYVYxY0NyYWNoZTloc0JqVkhscEdLYzJi?=
 =?utf-8?B?Z0hHalFCR2VzcVNBekdjQk9wbmRvL3lsMSt1Q3VsMTh0NkU3eWF1WUg1MVBU?=
 =?utf-8?B?V3hTQTc4ZWl1Q3FsaHlnQWxtK2RRak9RR3o2ZFhHV0FJOU02bFFiTFZiNVhR?=
 =?utf-8?B?S01WcE8vRnJCWW8reGVmcVNxdk5DOGJPL0xaOXUyMmNYMld1aHBvRUNrV0dv?=
 =?utf-8?B?dXhwU05jaVFyKzdHYVJVdnYvNXpkbll0aHpRSXhsYmw3aFdiMVYxcGpQeTBu?=
 =?utf-8?B?djhCTHNlYk1NcWpxQm9PeFNpOVVWRkNZSTdkbVZ5WS9KWE1nN0hBenJzTWRJ?=
 =?utf-8?B?NkJaZTBWMzhvdFpESGUycEJKY3lSMmFoa1ZEQjJiYUlCWTg0WSt2M0c4eWI0?=
 =?utf-8?B?b3ZKd2tZQ2hZZkc0MnJWeHAyZ1JxZit3R0dDMDdkaXpYaWZNb0huV3NWVGRN?=
 =?utf-8?B?eUFDRldmMVp3SHdsdVd4citLWVhDMWFWVXNiSGRnOS83ellQc2VnaVE3ci9x?=
 =?utf-8?B?TXB4OVU0Z0RlNlgxUlRSRUd4NkdGZlRzWldLZ0J2dFNWTmNQMVFSMlpGRi9L?=
 =?utf-8?B?VXhacmpneVIrd2Z4dGlFeitBOXQzUGRUKzI5QlYvMzZrejgxaVNFZ1dSd0Q5?=
 =?utf-8?B?TjRnMVQvTXl6bmdBVmk2bEloREhlVkhZRVpqMlAwRk5FNTl0cGFFTmllenha?=
 =?utf-8?Q?RD0O9mgw/eNnRb4FKNuR+/9Fg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8aae2e-9eff-4108-78b1-08dbc88c7459
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 05:56:17.7173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOfhWsybWBnhU145shZum60XPEqizO9GonWjL80k5IF+h4knLZypOAeCXl+7rueZx/fvk8ntVGBQUC6NOWLQoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6300
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/4/2023 6:19 PM, Ilpo Järvinen wrote:
> On Sat, 30 Sep 2023, Shyam Sundar S K wrote:
> 
>> In order to provide GPU inputs to TA for the Smart PC solution to work, we
>> need to have interface between the PMF driver and the AMDGPU driver.
>>
>> Add the initial code path for get interface from AMDGPU.
>>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
>> @@ -355,6 +356,21 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>>  	return amd_pmf_start_policy_engine(dev);
>>  }
>>  
>> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
>> +{
>> +	struct amd_pmf_dev *dev = data;
>> +
>> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
>> +		/* get the amdgpu handle from the pci root after walking through the pci bus */
> 
> I can see from the code that you assign to amdgpu handle so this comment 
> added no information.
> 
> It doesn't really answer at all why you're doing this second step. Based 
> on the give parameters to pci_get_device(), it looks as if you're asking 
> for the same device you already have in pdev to be searched to you.

Not sure if I understand you remark completely.

amd_pmf_get_gpu_handle() is a callback function for pci_walk_bus
(which is done below).

What I am trying to do here is to get the PCI handle for the GPU
device by walking the PCI bus.

I think the 'pdev' here refers to the pci root, using that root we
walk the entire tree and only stop walking when we find a handle to
GPU device.

Do you want me to change the "pdev" parameter to be renamed as "root" ?

Am I missing something?

Thanks,
Shyam

> 
>> +		dev->gfx_data.gpu_dev = pci_get_device(pdev->vendor, pdev->device, NULL);
>> +		if (dev->gfx_data.gpu_dev) {
>> +			pci_dev_put(pdev);
>> +			return 1; /* stop walking */
>> +		}
>> +	}
>> +	return 0; /* continue walking */
>> +}
>> +
>>  static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
>>  {
>>  	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>> @@ -451,6 +467,15 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>  	amd_pmf_set_dram_addr(dev);
>>  	amd_pmf_get_bios_buffer(dev);
>> +
>> +	/* get amdgpu handle */
>> +	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
>> +	if (!dev->gfx_data.gpu_dev)
>> +		dev_err(dev->dev, "GPU handle not found!\n");
>> +
>> +	if (!amd_pmf_gpu_init(&dev->gfx_data))
>> +		dev->gfx_data.gpu_dev_en = true;
>> +
> 
> 
