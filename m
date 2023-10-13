Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253107C7D8B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 08:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F4110E087;
	Fri, 13 Oct 2023 06:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9698410E021;
 Fri, 13 Oct 2023 06:13:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilASP8wvk/q+7xRpkkY4+D92lqumr/G/gDqSMwYfIzQXdtM16IhuSsvgm0cvgW082DNGLfNeMJHdg3fiyx3YbwHKlI+GLIxsrs7+5rF51n+Xa/Nva2iNgJk57FLr25FgdSoDOlSZqg110vvsvPAGxBhhixqZhUk3kvE9qvDOa9/mLi8rQ2qpIydsRpGUB2y6K3IY593bSWFbG0Yq1OAyAh1GQ1YpDGD/373az/jTo1bAsSmksmXgi0UFinJjns3zLQUr/yA2d4rO7xf4F7nJv59KcsLOefOOZOcE2bYCPSbZu3/9TkVXKfPDUMZkjN6mic6Sk8CXZvcnjINkA/FJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rFoDLKJKe+FuhIZ/+J1+Zd6bpDuNmDTtRfQ1MjC6to=;
 b=EtQSqRgNFxWSQ5oxys9/Z8EMe+OL1LF8aZmX40H2YQ0EOHeLIlp9qndGVLcH0W8JKQcbqN6j1pVHI2F8v9XA64iVufIf4gWNB3L1JqLI4GgbDFOGNqwvlsefBLJtmr6H2zi7JRHsD+hudmNF2pHgiFFP+DSSGquARjnMyWtCcxTiPgGRgQTN0F510zJe97ZI1Iu4cMN+iRTv036BC3iByc8K1FNIRCxQB6Pc+794lmrM61FAWSNihWtomXcO9qAq1CD/psauz2q1BeszJhEOFf+RkcUZWau7voj6Tlts78s7rHAGlT7xJGxfKjr9XbU2TVM08Wn3k76zNBKKmwrzgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rFoDLKJKe+FuhIZ/+J1+Zd6bpDuNmDTtRfQ1MjC6to=;
 b=3meSiI3H42GEQnepQ1SDU6sc78WOSOq7W9raQf1naMJzU0Is3Xjn4I9Vv0vK9Zk1eCkok2NyDNjtwJiRFEJ9XVa/cA+gTSphx5iQS1CUGM4s8BohaPZA/cntEOObEd3lUHFAOwulatzahN04kB2jeLIZGornlOfMEGA6sxwYnoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB5391.namprd12.prod.outlook.com (2603:10b6:5:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 06:13:30 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 06:13:29 +0000
Message-ID: <de5a0629-b15e-4375-b076-c8689b9d5edb@amd.com>
Date: Fri, 13 Oct 2023 11:43:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/16] platform/x86/amd/pmf: Add support for PMF Policy
 Binary
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
 <20231010125917.138225-5-Shyam-sundar.S-k@amd.com>
 <db29fe6f-1ac1-4e8f-9f77-f3569c503a76@amd.com>
 <55a1230c-e9ef-421e-930c-13f5016546b4@amd.com>
In-Reply-To: <55a1230c-e9ef-421e-930c-13f5016546b4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0185.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::12) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB5391:EE_
X-MS-Office365-Filtering-Correlation-Id: ba50e797-7b56-424f-52fe-08dbcbb384f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ivQOZgI+NYi7IRZaP0bidVkU/TYJk3c+eNB4yYn9AhgBZ+thb1caB2KijsZHukntBderVEcpW0TvVvP14MfbP+c0BMFTOHkAj3vZCyPU222oTiraHo6giR/IkyrOnJt52RG5Dy/UQ/CF81HHNi+x0P4NkIwKhSCG+4R+KrU9asik0ENbBsE560wogwcM5o4t/P0ktHSk1UcXFE0bORcoHXGhjFvYF6+Ugx0nGiFg8K9XZQlFmmEUajP0sW7jiopUJnU16qAv2WdwlUvNlwcFMsoVC0cC7+3Nf66H0ChZZBZ+MxJzbIK1ZPXg9qlhjUjXSRAcD0AdqtsC7cCo5Nhi+gVmujCW/BammqV5b3o90e4P+1uoh9T11fje+FpciKiS1pyqFk2avp165ZQuJrABVjl550xnLkCdqymGcTieyc5KJMGDOv8vV1s2prsyKBeaQFdE0aSMFqbhM0daRt6yAkA71X08qAAmPbXKr2BcCol7A40M7xR8weS1OIK/aZtpooQjfg3IvlbUVTy4kI+fsQIGnBFb4Gr8qiql8m0qWgnJGPurVGHjiCse/mYPLZClv7IM396cmNwJLBISsxpYPteFHfPiFqC6KTP/uiB+Vrts3HyfcK8FyHpcUUEgfu4LO8NG+bmlR/3/IQI+utWNqujWhDVThTCugobSghvfXkU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(376002)(366004)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(478600001)(316002)(6512007)(6486002)(6506007)(6666004)(53546011)(66556008)(66476007)(66946007)(31686004)(4326008)(41300700001)(8676002)(8936002)(921005)(26005)(2616005)(38100700002)(83380400001)(7416002)(2906002)(5660300002)(36756003)(86362001)(31696002)(30864003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2k2bVltclg0cE1FODlpbE1ReW04aVRzbEo1ZWRpelY4ZjdSeW5IWDVnaGtQ?=
 =?utf-8?B?L0YyMnRTNTNQVWpuN1dKckdpbnAwME52OU5ZNG9mTVR0cU8wRUdnYis0d0Rm?=
 =?utf-8?B?bk83NFcyS0FJV2trUngxUU0xNTQySVVCVzlEUEZFS0pLclhmMk83TUhZWURu?=
 =?utf-8?B?eDNCTDZEVUhGdDY1bC9zNVdGaGk3MmhGNXVFbURzb0hLdS9CSzQ4U0pzc0Mx?=
 =?utf-8?B?SE40QVdKRXk3U24wQUZFN0tWaTU3Sm5nQ0dKSU5yOGRmOW1XSENYcHp1Y1p3?=
 =?utf-8?B?YXZia0lJaDFaZmlFYTJ3S1d0OG0rR0V5Y2xDS2lGa3NhR0VsWmZ1bmV6VlNt?=
 =?utf-8?B?TXFzNE95R3lkUTZoNjhBM3M3d1lJWDE4Zk1sSUFHZlZJSWNPbGF3djRDWmZW?=
 =?utf-8?B?WFNaZWlWbVZQbUtPUGJiOHVTS3pzcG5VcUFRajhJV3NWVkNvazdiWU84ZzBD?=
 =?utf-8?B?RWYrMm91QjFIY1pKUGVITjk3Y0NUQnRuMWlzM29ndzUwN2pyM245c2l3ZFEv?=
 =?utf-8?B?cDllV0NBRXdweWNiTkorUmZnMlBEUlZUWlc1RzNjTDk5bkpBRER0cWxMVFhE?=
 =?utf-8?B?RWVqS1BrVDJSeWh3ZnpXb0s4cDZiZHJWS09qRVAvcUlISXBBZ3RDcVAyRVlH?=
 =?utf-8?B?SkMzZmRCYVRXekZLa0hjRWdFRC9QRVBVMCsrU2hnTzBzVElVNkpySjBwZjJ1?=
 =?utf-8?B?VXFBSkNMaXZmUWRXNHBMcHdNbjlBdjlDUkFCQzlGZTVURDJ0Tmc5cnN6ejFa?=
 =?utf-8?B?YWc4K0ttcytYa1k4WVB3V0ZRSWpSeVd3OVBuMzc4S0UzZDhhR1hzYWdCWjBj?=
 =?utf-8?B?MnJ2WTVOcWNPM1JIY3FZcmY3RDgvMDhqV0lVUHpiaS9KYy9DeDVRSzRnWWY4?=
 =?utf-8?B?RTNSNW82Zm5iT2hET2tmeW9yYWNFMFZhb2ZkR2R4VzVWTUhwMTVhUmc5MFlv?=
 =?utf-8?B?YWphWDlrbW4vUjNuK2pXS1ZlYVVqWDNaZXR2QnZEanBrdVdQVUlFTWRqQjJW?=
 =?utf-8?B?RHVadGpBU3ZXR3p0emxpUjFsbmcrcDgxY0hDRFRESmM4ZjVCVlZDSWw4aTdq?=
 =?utf-8?B?aEVFK3VWZld1TW9vNDBNMm9lRzB0M1RxcERIVUJIeUdPcTBiOVE2bG9hNW5t?=
 =?utf-8?B?eDZ1WUM1MzdlOVhxU0ZMRDZUbkwrYTRRTHhFdGJJdVBUZ0VaOVhOUjRBRDlt?=
 =?utf-8?B?ei80YnlGWnB0ODdNWU5aTTBmTlJtMEJvWXVyTEt1TXhzYWRPQWgzRHBWVWUy?=
 =?utf-8?B?SG50WE92ZTJYekpmNWlnNjg4ZGZUVFI4UHl5WmYrSHhYN1RSalp0Sy9MZVFG?=
 =?utf-8?B?Vm1wUmJuRnR1OGNOamJ2cVV1cVB4SHVkZzFua0dOQVZNTTFsL1lpU3c5M2do?=
 =?utf-8?B?VVJYdTU0eFM3VklkSVU1Y1RJaXloL0lpSG9mWTJ4MDBUVVZZQXczUUhxWDFk?=
 =?utf-8?B?TzdyQkcyNVJBaUV4ZWU3dWx3cXI2T1UwbDhua3RPNkNEajNHUkpIWmRFTWZY?=
 =?utf-8?B?MERFR2lHZTRUNUdIYVNFRWUrVU91ajMwL3NFeGFJQ0ZoK0luRytFckczMkJp?=
 =?utf-8?B?azBlWkVmdisxalBCUUloSHRUb0dYVGQ1M2lJN0k4TTRNQ3EzQjUzNi9UL05i?=
 =?utf-8?B?RUNncGRiL0VGQVoxL3VJbHNuMlV2NzcvWXdHMjlqdlhTczlPVU5YRzRwdEx0?=
 =?utf-8?B?UHlYSVlXNFNrSlJ4ZGg4Wld2YUd2b2dVVVVNdEd6K3h1VUoydlNBL2FhUDNP?=
 =?utf-8?B?ZXRkd2tKclFna25GY3kyRFV5amxHSlU4T3VxZVZkNm91Q3hpcHJJUmRQeVF3?=
 =?utf-8?B?UkhReG5mNmxlRzJtSGxTMnJCcksvdGppdkxTQXZUY2tDdUU0ZkFWS0cxVzhp?=
 =?utf-8?B?d3pXSTVydUZGOXFQNHA1VVpLclJ2cWVqNzZKQmR5ejZERExRN1dhblpYTFdE?=
 =?utf-8?B?aE9LK04vSHpnV3paYndzZW9qOU12VEY2elFUNXFGQXp1WU00YU5iWW16aWNQ?=
 =?utf-8?B?Um93TFBwNVlEdWRpTjh1MDF0K1BlN0JZcVhXd0x1V21ubzNPNC9Ga0h6emU1?=
 =?utf-8?B?VDRNTHppR0trdDQvLzhrN251ckZ5R3RUNW8reWlQUVcxbmVSOHlwY1dyc0Nx?=
 =?utf-8?Q?JfhUeB1buQjTO+LDQ1q/IbPVr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba50e797-7b56-424f-52fe-08dbcbb384f0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 06:13:29.6359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFy9qqAEEzIjs38wVQhT/b59rd2VD9j9TaYMRwE/kkUFjBDThxQzPojzFHvgaM3splpav2qjTB+DTw5wMG4lhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5391
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
Cc: dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Patil.Reddy@amd.com,
 platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/11/2023 8:47 AM, Shyam Sundar S K wrote:
> 
> 
> On 10/10/2023 9:56 PM, Mario Limonciello wrote:
>> On 10/10/2023 07:59, Shyam Sundar S K wrote:
>>> PMF Policy binary is a encrypted and signed binary that will be part
>>> of the BIOS. PMF driver via the ACPI interface checks the existence
>>> of Smart PC bit. If the advertised bit is found, PMF driver walks
>>> the acpi namespace to find out the policy binary size and the address
>>> which has to be passed to the TA during the TA init sequence.
>>>
>>> The policy binary is comprised of inputs (or the events) and outputs
>>> (or the actions). With the PMF ecosystem, OEMs generate the policy
>>> binary (or could be multiple binaries) that contains a supported set
>>> of inputs and outputs which could be specifically carved out for each
>>> usage segment (or for each user also) that could influence the system
>>> behavior either by enriching the user experience or/and boost/throttle
>>> power limits.
>>>
>>> Once the TA init command succeeds, the PMF driver sends the changing
>>> events in the current environment to the TA for a constant sampling
>>> frequency time (the event here could be a lid close or open) and
>>> if the policy binary has corresponding action built within it, the
>>> TA sends the action for it in the subsequent enact command.
>>>
>>> If the inputs sent to the TA has no output defined in the policy
>>> binary generated by OEMs, there will be no action to be performed
>>> by the PMF driver.
>>>
>>> Example policies:
>>>
>>> 1) if slider is performance ; set the SPL to 40W
>>> Here PMF driver registers with the platform profile interface and
>>> when the slider position is changed, PMF driver lets the TA know
>>> about this. TA sends back an action to update the Sustained
>>> Power Limit (SPL). PMF driver updates this limit via the PMFW mailbox.
>>>
>>> 2) if user_away ; then lock the system
>>> Here PMF driver hooks to the AMD SFH driver to know the user presence
>>> and send the inputs to TA and if the condition is met, the TA sends
>>> the action of locking the system. PMF driver generates a uevent and
>>> based on the udev rule in the userland the system gets locked with
>>> systemctl.
>>>
>>> The intent here is to provide the OEM's to make a policy to lock the
>>> system when the user is away ; but the userland can make a choice to
>>> ignore it.
>>>
>>> and so on.
>>>
>>> The OEMs will have an utility to create numerous such policies and
>>> the policies shall be reviewed by AMD before signing and encrypting
>>> them. Policies are shared between operating systems to have seemless
>>> user
>>> experience.
>>>
>>> Since all this action has to happen via the "amdtee" driver, currently
>>> there is no caller for it in the kernel which can load the amdtee
>>> driver.
>>> Without amdtee driver loading onto the system the "tee" calls shall
>>> fail
>>> from the PMF driver. Hence an explicit "request_module" has been added
>>> to address this.
>>>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>   drivers/platform/x86/amd/pmf/Kconfig  |   2 +-
>>>   drivers/platform/x86/amd/pmf/acpi.c   |  37 +++++++
>>>   drivers/platform/x86/amd/pmf/core.c   |  13 +++
>>>   drivers/platform/x86/amd/pmf/pmf.h    | 136 ++++++++++++++++++++++++
>>>   drivers/platform/x86/amd/pmf/tee-if.c | 146
>>> +++++++++++++++++++++++++-
>>>   5 files changed, 331 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig
>>> b/drivers/platform/x86/amd/pmf/Kconfig
>>> index 32a029e8db80..f246252bddd8 100644
>>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>>> @@ -9,7 +9,7 @@ config AMD_PMF
>>>       depends on POWER_SUPPLY
>>>       depends on AMD_NB
>>>       select ACPI_PLATFORM_PROFILE
>>> -    depends on TEE
>>> +    depends on TEE && AMDTEE
>>>       help
>>>         This driver provides support for the AMD Platform Management
>>> Framework.
>>>         The goal is to enhance end user experience by making AMD PCs
>>> smarter,
>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c
>>> b/drivers/platform/x86/amd/pmf/acpi.c
>>> index 3fc5e4547d9f..d0512af2cd42 100644
>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>> @@ -286,6 +286,43 @@ int apmf_install_handler(struct amd_pmf_dev
>>> *pmf_dev)
>>>       return 0;
>>>   }
>>>   +static acpi_status apmf_walk_resources(struct acpi_resource *res,
>>> void *data)
>>> +{
>>> +    struct amd_pmf_dev *dev = data;
>>> +
>>> +    switch (res->type) {
>>> +    case ACPI_RESOURCE_TYPE_ADDRESS64:
>>> +        dev->policy_addr = res->data.address64.address.minimum;
>>> +        dev->policy_sz = res->data.address64.address.address_length;
>>> +        break;
>>> +    case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
>>> +        dev->policy_addr = res->data.fixed_memory32.address;
>>> +        dev->policy_sz = res->data.fixed_memory32.address_length;
>>> +        break;
>>> +    }
>>> +
>>> +    if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ ||
>>> dev->policy_sz == 0) {
>>> +        pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
>>> +        return AE_ERROR;
>>> +    }
>>> +
>>> +    return AE_OK;
>>> +}
>>> +
>>> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>>> +{
>>> +    acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>> +    acpi_status status;
>>> +
>>> +    status = acpi_walk_resources(ahandle, METHOD_NAME__CRS,
>>> apmf_walk_resources, pmf_dev);
>>> +    if (ACPI_FAILURE(status)) {
>>> +        dev_err(pmf_dev->dev, "acpi_walk_resources failed\n");
>>> +        return status;
>>
>> You're returning acpi_status here, but the return for the function is
>> int.  It "happens to work" but I think it would be better to do
>> something like:
>>
>> dev_err(pmf_dev->dev, "acpi_walk_resources failed: %d\n, status);
>> return -EINVAL;
> 
> OK, I will change this.
> 
>>
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>>>   {
>>>       acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>> diff --git a/drivers/platform/x86/amd/pmf/core.c
>>> b/drivers/platform/x86/amd/pmf/core.c
>>> index ffb78e9709d9..96a41e7d4e7d 100644
>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>> @@ -395,6 +395,19 @@ static int amd_pmf_probe(struct platform_device
>>> *pdev)
>>>           return -ENOMEM;
>>>         dev->dev = &pdev->dev;
>>> +    err = apmf_check_smart_pc(dev);
>>> +    if (!err) {
>>
>> Rather than just failing to init smart PC solution builder, shouldn't
>> you fail probe entirely if an err is set from probing the BIOS
>> resources?  This seems fairly fatal.
>>
>> For example I'd think that setting up static slider is relatively
>> pointless on a system intending to use smart PC solution builder if
>> smart PC solution builder isn't working.
>>
> 
> What if - the BIOS advertises the smart PC bit and forgets to add
> resources (or a buggy ACPI thing)?
> 
> Atleast that way if the static slider is enabled, atleast some amount
> of power saving can happen.
> 
> Note that, I have tried the fallback to static slider if the smart pc
> fails and that's working with the current we have in place.
> 
> 
>>> +        /*
>>> +         * In order for Smart PC solution to work it has a hard
>>> dependency
>>> +         * on the amdtee driver to be loaded first even before the
>>> PMF driver
>>> +         * loads. PMF ASL has a _CRS method that advertises the
>>> existence
>>> +         * of Smart PC bit. If this information is present, use
>>> this to
>>> +         * explicitly probe the amdtee driver, so that "tee"
>>> plumbing is done
>>> +         * before the PMF Smart PC init happens.
>>> +         */
>>> +        if (request_module("amdtee"))
>>> +            pr_err("Failed to load amdtee. PMF Smart PC not
>>> enabled!\n");
>>
>> Did that softdep thing Ilpo mentioned not work for modprobe? 
>> Hopefully that generally works for everything except the insmod case
>> so this code path is unlikely to be hit in the wild.
>>
> 
> unfortunately no. Hence that's the reason I had to retain back the
> request_module() here.

Apologies for creating confusion here. The system which I was using
had some modules blacklisted and that lead to softdep not working.

I tried on couple of other systems and softdep is working. I will
remove request_module() and change it to softdep in v4.

Thanks,
Shyam

> 
>>> +    }
>>>         rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>>>       if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>>> b/drivers/platform/x86/amd/pmf/pmf.h
>>> index a91c22d9b532..51c0e17f7720 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -14,6 +14,11 @@
>>>   #include <linux/acpi.h>
>>>   #include <linux/platform_profile.h>
>>>   +#define POLICY_BUF_MAX_SZ        0x4b000
>>> +#define POLICY_SIGN_COOKIE        0x31535024
>>> +#define POLICY_COOKIE_OFFSET        0x10
>>> +#define POLICY_COOKIE_LEN        0x14
>>> +
>>>   /* APMF Functions */
>>>   #define APMF_FUNC_VERIFY_INTERFACE            0
>>>   #define APMF_FUNC_GET_SYS_PARAMS            1
>>> @@ -59,8 +64,21 @@
>>>   #define ARG_NONE 0
>>>   #define AVG_SAMPLE_SIZE 3
>>>   +/* Policy Actions */
>>> +#define PMF_POLICY_SPL                        2
>>> +#define PMF_POLICY_SPPT                        3
>>> +#define PMF_POLICY_FPPT                        4
>>> +#define PMF_POLICY_SPPT_APU_ONLY                5
>>> +#define PMF_POLICY_STT_MIN                    6
>>> +#define PMF_POLICY_STT_SKINTEMP_APU                7
>>> +#define PMF_POLICY_STT_SKINTEMP_HS2                8
>>> +
>>>   /* TA macros */
>>>   #define PMF_TA_IF_VERSION_MAJOR                1
>>> +#define TA_PMF_ACTION_MAX                    32
>>> +#define TA_PMF_UNDO_MAX                        8
>>> +#define TA_OUTPUT_RESERVED_MEM                906
>>> +#define MAX_OPERATION_PARAMS                    4
>>>     /* AMD PMF BIOS interfaces */
>>>   struct apmf_verify_interface {
>>> @@ -183,11 +201,16 @@ struct amd_pmf_dev {
>>>       bool cnqf_supported;
>>>       struct notifier_block pwr_src_notifier;
>>>       /* Smart PC solution builder */
>>> +    unsigned char *policy_buf;
>>> +    u32 policy_sz;
>>>       struct tee_context *tee_ctx;
>>>       struct tee_shm *fw_shm_pool;
>>>       u32 session_id;
>>>       void *shbuf;
>>>       struct delayed_work pb_work;
>>> +    struct pmf_action_table *prev_data;
>>> +    u64 policy_addr;
>>> +    void *policy_base;
>>>       bool smart_pc_enabled;
>>>   };
>>>   @@ -399,17 +422,129 @@ struct apmf_dyn_slider_output {
>>>       struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>>>   } __packed;
>>>   +/* Smart PC - TA internals */
>>> +enum ta_slider {
>>> +    TA_BEST_BATTERY,    /* Best Battery */
>>> +    TA_BETTER_BATTERY,    /* Better Battery */
>>> +    TA_BETTER_PERFORMANCE,    /* Better Performance */
>>> +    TA_BEST_PERFORMANCE,    /* Best Performance */
>>> +    TA_MAX,
>>> +};
>>
>> The comments above at end of the line don't add any value.
> 
> OK.
> 
> Thanks,
> Shyam
> 
>>
>>> +
>>>   /* cmd ids for TA communication */
>>>   enum ta_pmf_command {
>>>       TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
>>>       TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES,
>>>   };
>>>   +enum ta_pmf_error_type {
>>> +    TA_PMF_TYPE_SUCCESS,
>>> +    TA_PMF_ERROR_TYPE_GENERIC,
>>> +    TA_PMF_ERROR_TYPE_CRYPTO,
>>> +    TA_PMF_ERROR_TYPE_CRYPTO_VALIDATE,
>>> +    TA_PMF_ERROR_TYPE_CRYPTO_VERIFY_OEM,
>>> +    TA_PMF_ERROR_TYPE_POLICY_BUILDER,
>>> +    TA_PMF_ERROR_TYPE_PB_CONVERT,
>>> +    TA_PMF_ERROR_TYPE_PB_SETUP,
>>> +    TA_PMF_ERROR_TYPE_PB_ENACT,
>>> +    TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_INFO,
>>> +    TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_PCIE_INFO,
>>> +    TA_PMF_ERROR_TYPE_SYS_DRV_FW_VALIDATION,
>>> +    TA_PMF_ERROR_TYPE_MAX,
>>> +};
>>> +
>>> +struct pmf_action_table {
>>> +    u32 spl;        /* in mW */
>>> +    u32 sppt;        /* in mW */
>>> +    u32 sppt_apuonly;    /* in mW */
>>> +    u32 fppt;        /* in mW */
>>> +    u32 stt_minlimit;    /* in mW */
>>> +    u32 stt_skintemp_apu;    /* in C */
>>> +    u32 stt_skintemp_hs2;    /* in C */
>>> +};
>>> +
>>> +/* Input conditions */
>>> +struct ta_pmf_condition_info {
>>> +    u32 power_source;
>>> +    u32 bat_percentage;
>>> +    u32 power_slider;
>>> +    u32 lid_state;
>>> +    bool user_present;
>>> +    u32 rsvd1[2];
>>> +    u32 monitor_count;
>>> +    u32 rsvd2[2];
>>> +    u32 bat_design;
>>> +    u32 full_charge_capacity;
>>> +    int drain_rate;
>>> +    bool user_engaged;
>>> +    u32 device_state;
>>> +    u32 socket_power;
>>> +    u32 skin_temperature;
>>> +    u32 rsvd3[5];
>>> +    u32 ambient_light;
>>> +    u32 length;
>>> +    u32 avg_c0residency;
>>> +    u32 max_c0residency;
>>> +    u32 s0i3_entry;
>>> +    u32 gfx_busy;
>>> +    u32 rsvd4[7];
>>> +    bool camera_state;
>>> +    u32 workload_type;
>>> +    u32 display_type;
>>> +    u32 display_state;
>>> +    u32 rsvd5[150];
>>> +};
>>> +
>>> +struct ta_pmf_load_policy_table {
>>> +    u32 table_size;
>>> +    u8 table[POLICY_BUF_MAX_SZ];
>>> +};
>>> +
>>> +/* TA initialization params */
>>> +struct ta_pmf_init_table {
>>> +    u32 frequency; /* SMU sampling frequency */
>>> +    bool validate;
>>> +    bool sku_check;
>>> +    bool metadata_macrocheck;
>>> +    struct ta_pmf_load_policy_table policies_table;
>>> +};
>>> +
>>> +/* Everything the TA needs to Enact Policies */
>>> +struct ta_pmf_enact_table {
>>> +    struct ta_pmf_condition_info ev_info;
>>> +    u32 name;
>>> +};
>>> +
>>> +struct ta_pmf_action {
>>> +    u32 action_index;
>>> +    u32 value;
>>> +};
>>> +
>>> +/* output actions from TA */
>>> +struct ta_pmf_enact_result {
>>> +    u32 actions_count;
>>> +    struct ta_pmf_action actions_list[TA_PMF_ACTION_MAX];
>>> +    u32 undo_count;
>>> +    struct ta_pmf_action undo_list[TA_PMF_UNDO_MAX];
>>> +};
>>> +
>>> +union ta_pmf_input {
>>> +    struct ta_pmf_enact_table enact_table;
>>> +    struct ta_pmf_init_table init_table;
>>> +};
>>> +
>>> +union ta_pmf_output {
>>> +    struct ta_pmf_enact_result policy_apply_table;
>>> +    u32 rsvd[TA_OUTPUT_RESERVED_MEM];
>>> +};
>>> +
>>>   struct ta_pmf_shared_memory {
>>>       int command_id;
>>>       int resp_id;
>>>       u32 pmf_result;
>>>       u32 if_version;
>>> +    union ta_pmf_output pmf_output;
>>> +    union ta_pmf_input pmf_input;
>>>   };
>>>     /* Core Layer */
>>> @@ -460,4 +595,5 @@ extern const struct attribute_group
>>> cnqf_feature_attribute_group;
>>>   /* Smart PC builder Layer */
>>>   int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
>>>   void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
>>> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
>>>   #endif /* PMF_H */
>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>>> b/drivers/platform/x86/amd/pmf/tee-if.c
>>> index 4036f435f1e2..38f02676261d 100644
>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>> @@ -42,9 +42,77 @@ static void amd_pmf_prepare_args(struct
>>> amd_pmf_dev *dev, int cmd,
>>>       param[0].u.memref.shm_offs = 0;
>>>   }
>>>   +static void amd_pmf_apply_policies(struct amd_pmf_dev *dev,
>>> struct ta_pmf_enact_result *out)
>>> +{
>>> +    u32 val;
>>> +    int idx;
>>> +
>>> +    for (idx = 0; idx < out->actions_count; idx++) {
>>> +        val = out->actions_list[idx].value;
>>> +        switch (out->actions_list[idx].action_index) {
>>> +        case PMF_POLICY_SPL:
>>> +            if (dev->prev_data->spl != val) {
>>> +                amd_pmf_send_cmd(dev, SET_SPL, false, val, NULL);
>>> +                dev_dbg(dev->dev, "update SPL : %u\n", val);
>>> +                dev->prev_data->spl = val;
>>> +            }
>>> +            break;
>>> +
>>> +        case PMF_POLICY_SPPT:
>>> +            if (dev->prev_data->sppt != val) {
>>> +                amd_pmf_send_cmd(dev, SET_SPPT, false, val, NULL);
>>> +                dev_dbg(dev->dev, "update SPPT : %u\n", val);
>>> +                dev->prev_data->sppt = val;
>>> +            }
>>> +            break;
>>> +
>>> +        case PMF_POLICY_FPPT:
>>> +            if (dev->prev_data->fppt != val) {
>>> +                amd_pmf_send_cmd(dev, SET_FPPT, false, val, NULL);
>>> +                dev_dbg(dev->dev, "update FPPT : %u\n", val);
>>> +                dev->prev_data->fppt = val;
>>> +            }
>>> +            break;
>>> +
>>> +        case PMF_POLICY_SPPT_APU_ONLY:
>>> +            if (dev->prev_data->sppt_apuonly != val) {
>>> +                amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
>>> val, NULL);
>>> +                dev_dbg(dev->dev, "update SPPT_APU_ONLY : %u\n", val);
>>> +                dev->prev_data->sppt_apuonly = val;
>>> +            }
>>> +            break;
>>> +
>>> +        case PMF_POLICY_STT_MIN:
>>> +            if (dev->prev_data->stt_minlimit != val) {
>>> +                amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
>>> val, NULL);
>>> +                dev_dbg(dev->dev, "update STT_MIN : %u\n", val);
>>> +                dev->prev_data->stt_minlimit = val;
>>> +            }
>>> +            break;
>>> +
>>> +        case PMF_POLICY_STT_SKINTEMP_APU:
>>> +            if (dev->prev_data->stt_skintemp_apu != val) {
>>> +                amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>>> val, NULL);
>>> +                dev_dbg(dev->dev, "update STT_SKINTEMP_APU : %u\n",
>>> val);
>>> +                dev->prev_data->stt_skintemp_apu = val;
>>> +            }
>>> +            break;
>>> +
>>> +        case PMF_POLICY_STT_SKINTEMP_HS2:
>>> +            if (dev->prev_data->stt_skintemp_hs2 != val) {
>>> +                amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>>> val, NULL);
>>> +                dev_dbg(dev->dev, "update STT_SKINTEMP_HS2 : %u\n",
>>> val);
>>> +                dev->prev_data->stt_skintemp_hs2 = val;
>>> +            }
>>> +            break;
>>> +        }
>>> +    }
>>> +}
>>> +
>>>   static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>>>   {
>>>       struct ta_pmf_shared_memory *ta_sm = NULL;
>>> +    struct ta_pmf_enact_result *out = NULL;
>>>       struct tee_param param[MAX_TEE_PARAM];
>>>       struct tee_ioctl_invoke_arg arg;
>>>       int ret = 0;
>>> @@ -52,7 +120,10 @@ static int amd_pmf_invoke_cmd_enact(struct
>>> amd_pmf_dev *dev)
>>>       if (!dev->tee_ctx)
>>>           return -ENODEV;
>>>   +    memset(dev->shbuf, 0, dev->policy_sz);
>>>       ta_sm = dev->shbuf;
>>> +    out = &ta_sm->pmf_output.policy_apply_table;
>>> +
>>>       memset(ta_sm, 0, sizeof(*ta_sm));
>>>       ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
>>>       ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
>>> @@ -65,6 +136,12 @@ static int amd_pmf_invoke_cmd_enact(struct
>>> amd_pmf_dev *dev)
>>>           return ret;
>>>       }
>>>   +    if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS &&
>>> out->actions_count) {
>>> +        dev_dbg(dev->dev, "action count:%u result:%x\n",
>>> out->actions_count,
>>> +            ta_sm->pmf_result);
>>> +        amd_pmf_apply_policies(dev, out);
>>> +    }
>>> +
>>>       return 0;
>>>   }
>>>   @@ -72,6 +149,7 @@ static int amd_pmf_invoke_cmd_init(struct
>>> amd_pmf_dev *dev)
>>>   {
>>>       struct ta_pmf_shared_memory *ta_sm = NULL;
>>>       struct tee_param param[MAX_TEE_PARAM];
>>> +    struct ta_pmf_init_table *in = NULL;
>>>       struct tee_ioctl_invoke_arg arg;
>>>       int ret = 0;
>>>   @@ -80,10 +158,21 @@ static int amd_pmf_invoke_cmd_init(struct
>>> amd_pmf_dev *dev)
>>>           return -ENODEV;
>>>       }
>>>   +    dev_dbg(dev->dev, "Policy Binary size: %u bytes\n",
>>> dev->policy_sz);
>>> +    memset(dev->shbuf, 0, dev->policy_sz);
>>>       ta_sm = dev->shbuf;
>>> +    in = &ta_sm->pmf_input.init_table;
>>> +
>>>       ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE;
>>>       ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
>>>   +    in->metadata_macrocheck = false;
>>> +    in->sku_check = false;
>>> +    in->validate = true;
>>> +    in->frequency = pb_actions_ms;
>>> +    in->policies_table.table_size = dev->policy_sz;
>>> +
>>> +    memcpy(in->policies_table.table, dev->policy_buf, dev->policy_sz);
>>>       amd_pmf_prepare_args(dev,
>>> TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE, &arg, param);
>>>         ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
>>> @@ -103,6 +192,51 @@ static void amd_pmf_invoke_cmd(struct
>>> work_struct *work)
>>>       schedule_delayed_work(&dev->pb_work,
>>> msecs_to_jiffies(pb_actions_ms));
>>>   }
>>>   +static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>>> +{
>>> +    u32 cookie, length;
>>> +    int res;
>>> +
>>> +    cookie = readl(dev->policy_buf + POLICY_COOKIE_OFFSET);
>>> +    length = readl(dev->policy_buf + POLICY_COOKIE_LEN);
>>> +
>>> +    if (cookie != POLICY_SIGN_COOKIE || !length)
>>> +        return -EINVAL;
>>> +
>>> +    /* update the actual length */
>>> +    dev->policy_sz = length + 512;
>>> +    res = amd_pmf_invoke_cmd_init(dev);
>>> +    if (res == TA_PMF_TYPE_SUCCESS) {
>>> +        /* now its safe to announce that smart pc is enabled */
>>> +        dev->smart_pc_enabled = 1;
>>> +        /*
>>> +         * Start collecting the data from PMFW after a small delay
>>> +         * or else, we might end up getting stale values.
>>> +         */
>>> +        schedule_delayed_work(&dev->pb_work,
>>> msecs_to_jiffies(pb_actions_ms * 3));
>>> +    } else {
>>> +        dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>>> +        return res;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>>> +{
>>> +    dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
>>> +    if (!dev->policy_buf)
>>> +        return -ENOMEM;
>>> +
>>> +    dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr,
>>> dev->policy_sz);
>>> +    if (!dev->policy_base)
>>> +        return -ENOMEM;
>>> +
>>> +    memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
>>> +
>>> +    return amd_pmf_start_policy_engine(dev);
>>> +}
>>> +
>>>   static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data
>>> *ver, const void *data)
>>>   {
>>>       return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>>> @@ -146,7 +280,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev
>>> *dev)
>>>           goto out_ctx;
>>>       }
>>>   -    size = sizeof(struct ta_pmf_shared_memory);
>>> +    size = sizeof(struct ta_pmf_shared_memory) + dev->policy_sz;
>>>       dev->fw_shm_pool = tee_shm_alloc_kernel_buf(dev->tee_ctx, size);
>>>       if (IS_ERR(dev->fw_shm_pool)) {
>>>           dev_err(dev->dev, "Failed to alloc TEE shared memory\n");
>>> @@ -190,11 +324,19 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev
>>> *dev)
>>>           return ret;
>>>         INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>> -    return 0;
>>> +    amd_pmf_set_dram_addr(dev);
>>> +    amd_pmf_get_bios_buffer(dev);
>>> +    dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>>> +    if (!dev->prev_data)
>>> +        return -ENOMEM;
>>> +
>>> +    return dev->smart_pc_enabled;
>>>   }
>>>     void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>>>   {
>>> +    kfree(dev->prev_data);
>>> +    kfree(dev->policy_buf);
>>>       cancel_delayed_work_sync(&dev->pb_work);
>>>       amd_pmf_tee_deinit(dev);
>>>   }
>>
