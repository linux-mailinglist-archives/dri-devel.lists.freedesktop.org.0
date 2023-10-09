Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF7A7BD2E1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 07:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C084510E066;
	Mon,  9 Oct 2023 05:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBAE10E066;
 Mon,  9 Oct 2023 05:44:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pvrgx07LnKfkhcSUbb/xXC9lmvVQXolceBY12RGdYSvtqqkDMpUBXy1UVcWwW1lsU452M3QptuDuwCWorGYdlTJffup5s4p6TjZaXr0HkVXoXDXLvIS4GT/0pOKr8fIeqMfW4MIAIw+KhyBu/ugxUZcRYHbwBA6URo9XxJwZIw9+kn6obVre//SZNTtIV5IJDV70JGaZ+4DAuYQHmMAnqnft3JFo94iJmiHlUnfomnkjOAd9So7UvfIp7XUCNFqmiyMi6/RWSy4azmAfTmzS83cZ5RAHyAC/luldLbquAJUGDQlG/XTpwG7SS9wCsMmTzMtZ5EsvRve3BvRtJF8MTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHqNu3Qvoe93PXS7ADmNHRNvzyBd1ZzHsAHExjaA1z4=;
 b=cDWzjBLSdsJ8kKIq7tuvjLhk+4eS2zGqStber66yUDD79tq3Xe3hIcY6FaZDwPgpWa5cal9I1BpMifOqXm16zVxO9tuAzFAG7AZ7fRFfH0yLDV1TtJmESKAvXf7AYI5HuGyuDHcP5g9t7FtYquhDzIJ3bUs4IPBa6oEPF+UuBBXKjaTWv31zFUcyB1ZYdpXC+JIPhbduMApxQ8te16ruwQ1UUbUG/OE0oIlI3i9M0h/NVn3n+WcIgSaLrd2e4oQ54hAH4DjwwxLyoAXG3GcP3+UDoK0oTL6rmStxSCntP36RT/z3pmpoSaQU75R8Po6QueYTONM21RjowiMGDWlrWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHqNu3Qvoe93PXS7ADmNHRNvzyBd1ZzHsAHExjaA1z4=;
 b=iU0Oo/+JopUnQARSNwwskB/smOd74V75cRR04lvb8zDbBMSK74czJ008QYttkmoZ+KHA8zg1TSM7JFcw1Vtvj75htHu8TXaHHmxBkEsoY755AZlUpxUH2K6Nv7vzGxjAoUUDbws/Xfu+2R6zDHwTVGkbsmVQJm+8N6e0SaidmHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA1PR12MB6458.namprd12.prod.outlook.com (2603:10b6:208:3aa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Mon, 9 Oct
 2023 05:44:30 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 05:44:29 +0000
Message-ID: <ef17ebb8-c2f4-4c44-bb27-4c3d63dd98f4@amd.com>
Date: Mon, 9 Oct 2023 11:14:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] platform/x86/amd/pmf: Add support to update
 system state
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
 <20230930083715.2050863-9-Shyam-sundar.S-k@amd.com>
 <b827b663-871-5437-247-1c6c502d596d@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <b827b663-871-5437-247-1c6c502d596d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA1PR12MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: 72debc78-331d-4c9e-04c6-08dbc88ace6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eOFVfQB+pHaA9k5j+BG+w1vyC5rOe+FZP5LjrMmYbF03foVUys2AXcwn80K3dZqWbqHFXlV+VekCkxnEgGh01UBj6IDujMKMNF/TyAoi0nMFt0DwTlOzx3JepE4yulUqCzTFJ+Ej552q4SL/+0KiZt24GHWw6sMAWQ0LUbNCBylvmmCtlLSnIofdJLwVVLf39a4Dw457AMklw5dLEEPqrJnLo/RMt84hyzdRpdGtp7IfmoHgPVGNiOwAlCHEYwGKQMgksuU1o8tijoGRggVTuqzK9U/H4JkkuLR2JnN9P+yKVgh1t84vTpZD4/Qg64rHU0jgYJOzuZVuz1OBlpq+3A7brjek2wYKFtKDJx16cNvLyaIrg8KwXSTg3VlZorS6l3SsLB1s8pbB4LHRUxsh9eDhPOJ6Xb+OSLd/MK/NG9jhPuMS0dOEwbVasFQjTAqqrPRgsqbFB1mQlHQrhHaW8U6d2LiV1qjUPMU6DeMIEfZ6/1rXBe2+U/ltHSDzSnnpPKYhUrtEn+BTZMCY65Wzp3OY+AJJ6PP5bzxJCiXWD0gkraYiIV3EeAUP5cbBGjuobGATEPGdRPvQwEHiybnLif7GnStsY6dccYvaBEkLoz4P8p0VzTBU+PUSoU6j0AgNEXAC/PurAgQyGxbHgPlw1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6512007)(53546011)(2616005)(478600001)(6506007)(6486002)(966005)(6666004)(66574015)(26005)(83380400001)(7416002)(2906002)(15650500001)(8936002)(5660300002)(66946007)(54906003)(66556008)(66476007)(4326008)(8676002)(41300700001)(316002)(6916009)(36756003)(31696002)(86362001)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEhvREhHUDczaXhRV2tGYUprY0ZhUWtYU2JLYzRXZm9DdjB3K0xTaG5mZTFQ?=
 =?utf-8?B?Z0pFUnV2Q0xWZzdBQmxpdWRZcE1oQmN5SExieTVNRDY0cGR3aXNyd21jRDdE?=
 =?utf-8?B?RzVWRS80czhQankzaTBqeEI2TFltRHJCaTNCUFNzUFhNcC9qeFVneVdKZHUx?=
 =?utf-8?B?S05HazZFWFVxMFptMFFNMjNTamRUTWdFM2tOY3ZSc3hwWXpZd0xueWdERG5Q?=
 =?utf-8?B?UTcwL25yRnl5SktXRGFzNHd4M3BXWEZRRkUydFBlYUI1bTBoaTMyQVIrNXpz?=
 =?utf-8?B?OHdSZkd5ZHROU21FMUJ1ekNPL0hqNGk2R0JrWEdwM2xQbkJlK1VEcGZraHlX?=
 =?utf-8?B?eHNDQzQ5ZktiR3pHcitUM09VeVVTUitmVGN0aFVQOG1SbElrbDV4YWJvem95?=
 =?utf-8?B?RUVaVldENUVPVVhML29wd0xudytsQ1l1NUxFdTJpWFlBRys3YkxRUUN0OThh?=
 =?utf-8?B?QkNkVEdQSWl1TGRVUUZpaUd2TmtsYjFTdU95bFNDQzlhRVdKaFdCS2J0R1hW?=
 =?utf-8?B?T0hGTmdsRFlWbDNkbmxSbEhqMmtXL2NJSlpQMTJBNkk4MzB0M2JxbkZqN0dN?=
 =?utf-8?B?eU0ySU4weGxlenhUbVUra2JWd0F6OHkwTU9hVUhnU3BINDBkbzM5ZW5yYm5Y?=
 =?utf-8?B?dGYxYk54Y1lNK25YR2poTzRSb25TT3poK1ZiT2N4Y1dpaFhqQnFueEVURXUz?=
 =?utf-8?B?VUpqRjhRdXh3YjRxTVM1Z0pHcjM0Y0tkWVUrRTFvVlNMamZxWTFHaFA4M051?=
 =?utf-8?B?SWVsQXI4VGR0OXA1LytPNWhnVjgwWnBFVGl1L05lR3d6ek81eDZkMHJnZ0Ni?=
 =?utf-8?B?d0VoOHBidzU3ZGo4ZktLY3Npek1QVWdYZ01zMzdPSmJFSFVZNXJyTko2TENa?=
 =?utf-8?B?ZW4vVmZGYnVFZ2RGUGdFMzBhNzNNUkhsYTNLUFJtMWk3MkpnMzA3MDArckRX?=
 =?utf-8?B?dzJtSHA4WTBmekFTOVJJczc5Mk4zMEJBRUFKWlZIRFNTY0xlckg4K2tKcnB0?=
 =?utf-8?B?Um03UkcrTzVsckxXdVB6ZWtVdmR0dTBmMTRkcitWZGxJTVR5akhCa2xPY3RV?=
 =?utf-8?B?VTd5Z0lrMERUVU1tOTdMalFSenR5cmRMb295MnNHS25Ta2FZakkrQ1dxQVlm?=
 =?utf-8?B?aHBadlR4a1V4NGVnaE15alIwMndpd2ZtT3VmTndqY1BSU0FSQjEyamFxNTY3?=
 =?utf-8?B?NWtnNUp4NG80cDZQTDlyN1FMOGpCVFI1NFpYTDJBVlg0WmtHVDRIUFFQcWsy?=
 =?utf-8?B?bHZsQmpVOEpHUnlaaDcvclFibytOSWpFNER4c3JoRHJlaW5JOWdpQ1VJbWFq?=
 =?utf-8?B?WmVlSDUveC9yYlh5SXFmUkQ4UHltOFNxbDVtL2dsNVVGQmRwallzSjcwYUZq?=
 =?utf-8?B?bS9VcVUxVWRKNW5XZmJQYVNpQ3VVdzBEUjZsS0N4Nld0TCtZNnNyUEFLdWZE?=
 =?utf-8?B?NTh2Sm5RaVU3RnVSNWFNdTBVdVlCWDhnVWl6czhuOUFsazhYc1dtNWhGcjlX?=
 =?utf-8?B?dktvVUhMYU9TdFZRRDlleGRodXRJNG8vTjdONlNVNm1kWG1TcFFuampremxK?=
 =?utf-8?B?dS9WSkIvTmZ4dFpJYXVQenA1c05YK2FEb2RoS1RxcDl1OFNKUUdQSTZ6Wk94?=
 =?utf-8?B?N3IyY0k2bis1aTFlQm5iM2xKM3ZncjlnNk9VUmwzb3gvakJYRGNHbXFNLzFF?=
 =?utf-8?B?dlplSVRjYmxnSktmcmxHN20yV044VEhielpWUnAxc2U2SURuTjZITUdtZUFw?=
 =?utf-8?B?VEZxNUVEVmxhUnd5dUxKU2svNGFqM3FuSVRzZDc0YW13MlNWaDJKQnh1Slp1?=
 =?utf-8?B?dUtXZzI2THBZSVhGTFdnYis1dFozTzNvTXB5M1U5TC8vU3huRmdOU2hEaGdN?=
 =?utf-8?B?VzBtSjI5bDNPK3RlRnFWdllSTFNWYzE2V2pUZ2ZlNU8vZDE0bk5ENmhtRklE?=
 =?utf-8?B?b3NTb1k0bnRHbURPaVZnRTlKSzhlMTRTVTdKOWJkSTdyTm9CTHpTQVFkNVR0?=
 =?utf-8?B?YVFrc1lXakd2cnduNy8yVWVUdE9tQXA1K2RyM0d2KzEwSUlMZmhUWDh1b0Ir?=
 =?utf-8?B?MDlFdEF5SXF1a1lPSk1KMyswdXBNZkZOU1ZtSjAvamZpZHFZeDA1dG54M1RT?=
 =?utf-8?Q?5XtZfdkkz4qInCm4P7jVNLwRL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72debc78-331d-4c9e-04c6-08dbc88ace6c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 05:44:29.8727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTJLrt7ySfClI8WBH1VNcOzKKBgVvHJNPef3CV86oSKzbRZbRtuLlV2X0JdlRzLeBCUKrKq3m5kUR2n4HS1uHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6458
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
 christian.koenig@amd.com, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/4/2023 5:53 PM, Ilpo Järvinen wrote:
> On Sat, 30 Sep 2023, Shyam Sundar S K wrote:
> 
>> PMF driver based on the output actions from the TA can request to update
>> the system states like entering s0i3, lock screen etc. by generating
>> an uevent. Based on the udev rules set in the userspace the event id
>> matching the uevent shall get updated accordingly using the systemctl.
>>
>> Sample udev rules under Documentation/admin-guide/pmf.rst.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202309260515.5XbR6N0g-lkp@intel.com/
> 
> Please don't put lkp tags for patches that are still under development 
> (even if the email you get misleadingly instructs you to). Only use them 
> when you fix code that's already in tree based on LKP's report.

Agreed.

> 
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  Documentation/admin-guide/index.rst   |  1 +
>>  Documentation/admin-guide/pmf.rst     | 25 ++++++++++++++++
>>  drivers/platform/x86/amd/pmf/pmf.h    |  9 ++++++
>>  drivers/platform/x86/amd/pmf/tee-if.c | 41 ++++++++++++++++++++++++++-
>>  4 files changed, 75 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/admin-guide/pmf.rst
>>
>> diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
>> index 43ea35613dfc..fb40a1f6f79e 100644
>> --- a/Documentation/admin-guide/index.rst
>> +++ b/Documentation/admin-guide/index.rst
>> @@ -119,6 +119,7 @@ configure specific aspects of kernel behavior to your liking.
>>     parport
>>     perf-security
>>     pm/index
>> +   pmf
>>     pnp
>>     rapidio
>>     ras
>> diff --git a/Documentation/admin-guide/pmf.rst b/Documentation/admin-guide/pmf.rst
>> new file mode 100644
>> index 000000000000..90072add511e
>> --- /dev/null
>> +++ b/Documentation/admin-guide/pmf.rst
>> @@ -0,0 +1,25 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +Set udev rules for PMF Smart PC Builder
>> +---------------------------------------
>> +
>> +AMD PMF(Platform Management Framework) Smart PC Solution builder has to set the system states
>> +like S0i3, Screen lock, hibernate etc, based on the output actions provided by the PMF
>> +TA (Trusted Application).
>> +
>> +In order for this to work the PMF driver generates a uevent for userspace to react to. Below are
>> +sample udev rules that can facilitate this experience when a machine has PMF Smart PC solution builder
>> +enabled.
>> +
>> +Please add the following line(s) to
>> +``/etc/udev/rules.d/99-local.rules``::
>> +
>> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1", RUN+="/usr/bin/systemctl suspend"
>> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2", RUN+="/usr/bin/systemctl hibernate"
>> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="3", RUN+="/bin/loginctl lock-sessions"
>> +
>> +EVENT_ID values:
>> +1= Put the system to S0i3/S2Idle
>> +2= Put the system to hibernate
>> +3= Lock the screen
>> +
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index d5e410c41e81..34778192432e 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -73,6 +73,7 @@
>>  #define PMF_POLICY_STT_MIN					6
>>  #define PMF_POLICY_STT_SKINTEMP_APU				7
>>  #define PMF_POLICY_STT_SKINTEMP_HS2				8
>> +#define PMF_POLICY_SYSTEM_STATE					9
>>  #define PMF_POLICY_P3T						38
>>  
>>  /* TA macros */
>> @@ -439,6 +440,13 @@ struct apmf_dyn_slider_output {
>>  } __packed;
>>  
>>  /* Smart PC - TA internals */
>> +enum system_state {
>> +	SYSTEM_STATE__S0i3 = 1,
>> +	SYSTEM_STATE__S4,
>> +	SYSTEM_STATE__SCREEN_LOCK,
>> +	SYSTEM_STATE__MAX
>> +};
>> +
>>  enum ta_slider {
>>  	TA_BEST_BATTERY, /* Best Battery */
>>  	TA_BETTER_BATTERY, /* Better Battery */
>> @@ -470,6 +478,7 @@ enum ta_pmf_error_type {
>>  };
>>  
>>  struct pmf_action_table {
>> +	enum system_state system_state;
>>  	unsigned long spl; /* in mW */
>>  	unsigned long sppt; /* in mW */
>>  	unsigned long sppt_apuonly; /* in mW */
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 315e3d2eacdf..961011530c1b 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -24,6 +24,20 @@ MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (defau
>>  static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
>>  						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
>>  
>> +static const char *amd_pmf_uevent_as_str(unsigned int state)
>> +{
>> +	switch (state) {
>> +	case SYSTEM_STATE__S0i3:
>> +		return "S0i3";
>> +	case SYSTEM_STATE__S4:
>> +		return "S4";
>> +	case SYSTEM_STATE__SCREEN_LOCK:
>> +		return "SCREEN_LOCK";
>> +	default:
>> +		return "Unknown Smart PC event";
>> +	}
>> +}
>> +
>>  static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>>  				 struct tee_ioctl_invoke_arg *arg,
>>  				 struct tee_param *param)
>> @@ -42,9 +56,23 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>>  	param[0].u.memref.shm_offs = 0;
>>  }
>>  
>> +static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>> +{
>> +	char *envp[2] = {};
>> +
>> +	envp[0] = kasprintf(GFP_KERNEL, "EVENT_ID=%d", event);
>> +	if (!envp[0])
>> +		return -EINVAL;
>> +
>> +	kobject_uevent_env(&dev->dev->kobj, KOBJ_CHANGE, envp);
>> +
>> +	kfree(envp[0]);
>> +	return 0;
>> +}
>> +
>>  static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>  {
>> -	unsigned long val;
>> +	unsigned long val, event = 0;
>>  	int idx;
>>  
>>  	for (idx = 0; idx < out->actions_count; idx++) {
>> @@ -113,6 +141,17 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  				dev->prev_data->p3t_limit = val;
>>  			}
>>  			break;
>> +
>> +		case PMF_POLICY_SYSTEM_STATE:
>> +			event = val + 1;
>> +			if (dev->prev_data->system_state != event) {
>> +				amd_pmf_update_uevents(dev, event);
>> +				dev_dbg(dev->dev, "update SYSTEM_STATE : %s\n",
>> +					amd_pmf_uevent_as_str(event));
>> +				/* reset the previous recorded state to zero */
>> +				dev->prev_data->system_state = 0;
> 
> No, a comment won't help you here. As is, system_state is constant 0 so 
> it's entirely unnecessary to keep that value at all. In fact, the comment 
> is wrong because there never was "previously recorder state" in 
> ->system_state to begin with since it's either initialized to zero on 
> alloc or reset to zero by this line.
> 
> So what are you trying to achieve here with this ->system_state variable?

Sorry I misunderstood your previous remark. This was a test code which
was supposed to be cleaned up before sending.

I will fix this in v3.

Thanks,
Shyam


> 
