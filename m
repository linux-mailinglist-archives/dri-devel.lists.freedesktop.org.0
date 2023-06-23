Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F374C73BD14
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 18:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DE210E67C;
	Fri, 23 Jun 2023 16:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A4510E67C;
 Fri, 23 Jun 2023 16:48:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gyxz6psqXfKGtt2NghUKwJ6aeWdU/Knn0ljih5q1FQuKWWX8NNuf8tnUtIBAnP+L5VOWOCyO7iaRdNopujvccNMHlazlqot5uyS4LJoEdMQF1DxQAlc4KPSBsxEmRDi9x+xaBzruBvLh8DLwJujCaJgCuW6EIcn9UDVZyS/ecZp3fLVhvHhxVHDMJkn/z4Lfoyi9gciGbjtmCIB29xLYYYe0KYHFT4ml7S8htwvzOFLlxbKuiP1tR7zbyRc9nf+pn90TXPlW3wXdmR9Y5Fi4GbAr6Wn5e40TmxBzQe4orSHer+IMpG5OS+noPQSceg6rME3517DJbnFkXl77Gn6KYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6XQ0U8iZdBfMciciO92IvQbgCD98QPwchDhmike6s0=;
 b=T2QAQP6L4hv0cUJZdmev2yDvmvzl3Aq2/gkZWrFvWEDUDIX6JBk0Ydh009BIrpydvURLkceKC5RGIbCcOKzbx/csN/XHgmChTc3OUWZ/vCxCmTwyqhuVmroOsTf+LPmBbIFLn+i0NlIO1WR8ILdPNiQ0oJwEBT50HvAjvi9dG6ZCDPeblq/UXxk5TGrOMOfpen21xu+bUipgA7gaibXk6onF1E/a6r/0rGvvf0NNeKWaGm3GDxDdsrfW0b8YnDz9ps3JbdGCx0htL+wEPiB5ouGUmoewcaoRHa62Vll5avBo3q8LmHklYPd4wnGtwq/Ecl6MqFbSs9u5aVk7le4VlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6XQ0U8iZdBfMciciO92IvQbgCD98QPwchDhmike6s0=;
 b=uau83O7Yt0cqxYgooEfyj5u+WBvq9EFz2e+CMayIO0TR7DRy+u8kOCO+RKa3Am8CQCvNGkcRjd3+Bt5hAOi6Xrn6SuYJR5bV+4LuOIVztqPDcrIwljXivH+WbK1SUL//l8SBVHJmkgBHZzqA/Smf0ByScHRjUtf0qcPH3jvM5/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA0PR12MB4496.namprd12.prod.outlook.com (2603:10b6:806:9b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 16:48:33 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 16:48:33 +0000
Message-ID: <5d6f6a89-1c7f-3763-8616-b80fdc301603@amd.com>
Date: Fri, 23 Jun 2023 11:48:29 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <CAJZ5v0iqy0yMJP5H7ub67R8R6i42=TcS_6+VF-+fWrM-9tYFQA@mail.gmail.com>
 <c518da2a-5ba5-af7e-e26d-1973db7b4c9e@amd.com>
 <CAJZ5v0gnTt0pV4nF+jcYCyZuZXDNuRn3mS0bDoAv-ZDpetyxVg@mail.gmail.com>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <CAJZ5v0gnTt0pV4nF+jcYCyZuZXDNuRn3mS0bDoAv-ZDpetyxVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::29) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA0PR12MB4496:EE_
X-MS-Office365-Filtering-Correlation-Id: 38db0673-7828-4fee-8d21-08db7409ae70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZEJTaOLhQbjHTdZyoF0Y9mTVwZGX/UU78VbsnB2AnCWS16O9pEdR9uZiUzCLVikkawtABG4Bq7l3h8Wky64r5me+XnhZ0QsSQ1x4czHoWrrIedD/PA6sbp5PZrg+ZGK9TWOAp7reRD6/NeEzYvp0aHkrY4x5S8AL3FQzCzZaseglBY92GMadW3HWDD+6bIuU8FzRaeJuJtUQRuyafhFVij4waGdTKcaJnVIyNwVuqcIYecwZEKIXHXtXdr3gwW1l6pNL624G3vB1P6BE/97TPPizc59sBojONX0crM+3EVr49VkZiO94dCQtLd6UfEqw4+g25OhbmKNqKdrvYm8QL/naVeO+rs80T+aNAM18KGfRw3qJxFxERKv5UJATuqYz91jfD6TTSORxKkyb7fQryDMsRQQJMcErwsIWFhs9IgANAPS7WZ3C4ODemxpuZxSX5qAxKi3wkgB7siZRycKPYq9pvWaENRZknaolZkeWJy2KyclLUxIW1R31n0uEsphN/1teV4J6qxZ8FbDfsGkqr0ldqG5i7esNZnq3OQ4E4Cer3QhQ582FYn9jWlOU41KnU3WPCuStCqcRcD9vutlH5qEngXfU4HFd1BxoNVMpIdhVQfZ4EURIzbfuFHucwtXBvlYFX6sP+ObkBEovEQFwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(8936002)(186003)(8676002)(41300700001)(53546011)(6506007)(2906002)(26005)(6512007)(36756003)(66946007)(66476007)(86362001)(66556008)(6916009)(4326008)(316002)(31696002)(6486002)(6666004)(478600001)(38100700002)(83380400001)(2616005)(31686004)(5660300002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVlNMm5GemdWczZ4SHVuMU0yUkNIdUtmTU5FMktoNmpKUXFvZ3UrZ01DQU5w?=
 =?utf-8?B?bTJiUlFBeGtEZFYzT1NOMWVXUVhKZjB5K29sbnNwQ2k2UXhod29BZmRMcStO?=
 =?utf-8?B?V0hQRms4ZG1vVmQwck01RHlyeHhSYkRUR2JrbXVjWXJZVlFrclRFZElUeUt5?=
 =?utf-8?B?eXZ5OGpnSVRkeDR6TWQ1VXQ1TzJMcFNLY1AwWjlOcUdTQkl1NURaT1p5VGdl?=
 =?utf-8?B?Z2JVY2dUZktMNXo0ZEJtU1NqdHg1TjBxQ25NMWgzL0cveWZ6RGd3bWNTdkdD?=
 =?utf-8?B?L0xXcUtpemxRUERUUU5YTFl5aXZ0aHZaUm80cVkxUndCRG4xalU0TkYxdjBw?=
 =?utf-8?B?dVpaaEJubWY2U0hTTUg2eWk0SGRPVHpibUltWnRaeUwxV1NWY2RzZ1NvUERL?=
 =?utf-8?B?R2luZG5yZmtGSzBXdTgwSzNMV1NiV3Z3UTNQL3NxUW80NjdQU2tJcnBsUkVU?=
 =?utf-8?B?LzMxb2prWkYyMnRqbmgwQWJSWWJJR09Yb082cjA0T1JCQXkyMkM2S0RqNFda?=
 =?utf-8?B?bTh4d29MNTAzZnYzSzVSNXJsZnQ4NkZiM2M3NmhRV01mdXExUjh0YnFyL1FU?=
 =?utf-8?B?ZVFzSGFGWndoYkxYcTRaaGRmRXhyTnJxQWcxWkJNeWRjUEk1a1IydkVrdTUr?=
 =?utf-8?B?S3dvby9EVWVKdUxtZ1h5MTNTM1F6bm9hemxZTS9IK3BUVWVkR01pdHBkQUlS?=
 =?utf-8?B?SUZRd090S0JOUFV2S084cmtlbmFKazlpdkM0NWdKSUJuQ0RDWnFtRGJUZXRn?=
 =?utf-8?B?MlRreTZ6WEl3anh1ODB3RWlTeXVJaTRSQ0d5ZE96QUZReFJPMGZXYWNYZ0h4?=
 =?utf-8?B?SjQ0L3R1NEtxeUg0dGZqMUJiblBKMEFRUVh0YktoYzhnRXlUa2Q3UDQ3Sm1E?=
 =?utf-8?B?cFdqUjJCK2Y3UmVVYkx6L0l2K3BJNExUR25lS25HRERVaGJpdHB1aGdVbzc1?=
 =?utf-8?B?V3F6aUdabG53clpFcXBZRGMvZTc5cnkyN2I5cHEzT2IrQkxFaVhBNTdqVnRI?=
 =?utf-8?B?TTVBUWlrelU4UHZPM1JkNVVhRjJ4a0xEblFCU01FV0lpUk93bkFWODZHU3dH?=
 =?utf-8?B?ZVp4a1hZbzErVHoyQW8za3h2Z3hodzIxd3htY0JlQ1crdEV5V21BY2FDT2sz?=
 =?utf-8?B?aFFsZHY4M0NaaEpKRXFiTEdVZURadzYrTGIxallkM21iVFpXSFU5czBMVHIx?=
 =?utf-8?B?b2dzVGVMQUJldk1YTGsyUVdzME5jeTU3TWQ1Tkc5ZTk0eG5TZUNweXFHOG1Z?=
 =?utf-8?B?RWYwWXMzcTVpV21kdXNGZ292VUlHc2laN2RNSDFHVmRSR1dOZ1hXWHZqV25L?=
 =?utf-8?B?eUpkSlJNNG1LODUzc3NET1BUVmRKdVpOait4SFJTQ0VVYVlNQVNZQlhPOFVE?=
 =?utf-8?B?dk5MZ0hKZ0RHV2w3SGZCTEJYTWFoZ2tuTnRZUmh0eWxTNWNjS0F2YTdjSzRp?=
 =?utf-8?B?MUhLUkI0blZkelk1VWJIMjdZWEJhVEMzWkllWEpFYnplUmVIYnhNYzdoVFhr?=
 =?utf-8?B?Vld6NmJHZFR1SmJwYnc2RFd2SnZYSTdRdWJ0UWVtYjM5c3A0MnJJblZQWG5r?=
 =?utf-8?B?WFZDSU9jdGxuNk15QXNYOW55SXB3ZzB0aDJ1NmJCUFR6allySEE5QVRVZDlH?=
 =?utf-8?B?S1d1OS9KZGZvaisrRS9ZdUJlaHZNSWNKaGZUZytNTTNMTmdZWUlRUTZxOHBh?=
 =?utf-8?B?c3IyNkRGWnBETFRjdFg0bk16R2wvRWlqb2I5Tllxam5tY0NmcVdZRlpwcmJW?=
 =?utf-8?B?TDBPeVNhMUhXVGtKalFvbXN5QXJBOXdqQzRFeHpQaVNQckFnbFFiRFdiRUVN?=
 =?utf-8?B?U253VFN5QXU2NThtRTJrS2ZaaTJWWWtYbXFHekRqRVhDYjNUM2VGdFMzQXI3?=
 =?utf-8?B?MjlrSENhU2w0RU5iTHg4dUJkeFY5R1FLMWp1SzZWdEVNNldTb0VSN29ZZmUr?=
 =?utf-8?B?ZjRrZ2I3ZjN4aWw1OW5DZFg1Y1Nuclc3NTh1aHUvRHlCWnMvZFBqUEZjekFG?=
 =?utf-8?B?eVh2YjlSQVdPRzJRUjBsUkw5d3JDVE4vRjV3NnlYQmNoM3o4TForaGhZcTU0?=
 =?utf-8?B?RWxVUHlxZGlsQVlrK0VYL1k3QUxDbjRwNUN5d1dXU05MVjVmWmU3TFRjZXNu?=
 =?utf-8?Q?jP8XmM2Yqd041TV+5R8L9UUXl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38db0673-7828-4fee-8d21-08db7409ae70
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 16:48:33.4817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnayWXdH6U2haJb4WfGjJyU0/BA6jYA1ut19O4opyq8goW8ybxa6MLjT/ueesgY04dStfMmkkMhRrUNld9vmLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4496
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, trix@redhat.com,
 lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, Evan Quan <evan.quan@amd.com>, netdev@vger.kernel.org,
 Xinhui.Pan@amd.com, linux-wireless@vger.kernel.org, edumazet@google.com,
 christian.koenig@amd.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 johannes@sipsolutions.net, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/23/2023 11:28 AM, Rafael J. Wysocki wrote:
> On Fri, Jun 23, 2023 at 5:57 PM Limonciello, Mario
> <mario.limonciello@amd.com> wrote:
>>
>> On 6/23/2023 9:52 AM, Rafael J. Wysocki wrote:
>>> On Wed, Jun 21, 2023 at 7:47 AM Evan Quan <evan.quan@amd.com> wrote:
>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>
>>>> Due to electrical and mechanical constraints in certain platform designs
>>>> there may be likely interference of relatively high-powered harmonics of
>>>> the (G-)DDR memory clocks with local radio module frequency bands used
>>>> by Wifi 6/6e/7.
>>>>
>>>> To mitigate this, AMD has introduced an ACPI based mechanism that
>>>> devices can use to notify active use of particular frequencies so
>>>> that devices can make relative internal adjustments as necessary
>>>> to avoid this resonance.
>>>>
>>>> In order for a device to support this, the expected flow for device
>>>> driver or subsystems:
>>>>
>>>> Drivers/subsystems contributing frequencies:
>>>>
>>>> 1) During probe, check `wbrf_supported_producer` to see if WBRF supported
>>> The prefix should be acpi_wbrf_ or acpi_amd_wbrf_ even, so it is clear
>>> that this uses ACPI and is AMD-specific.
>> I guess if we end up with an intermediary library approach
>> wbrf_supported_producer makes sense and that could call acpi_wbrf_*.
>>
>> But with no intermediate library your suggestion makes sense.
>>
>> I would prefer not to make it acpi_amd as there is no reason that
>> this exact same problem couldn't happen on an
>> Wifi 6e + Intel SOC + AMD dGPU design too and OEMs could use the
>> same mitigation mechanism as Wifi6e + AMD SOC + AMD dGPU too.
> The mitigation mechanism might be the same, but the AML interface very
> well may be different.


Right.  I suppose right now we should keep it prefixed as "amd",
and if it later is promoted as a standard it can be renamed.


>
> My point is that this particular interface is AMD-specific ATM and I'm
> not aware of any plans to make it "standard" in some way.


Yeah; this implementation is currently AMD specific AML, but I
expect the exact same AML would be delivered to OEMs using the
dGPUs.


>
> Also if the given interface is specified somewhere, it would be good
> to have a pointer to that place.


It's a code first implementation.  I'm discussing with the
owners when they will release it.


>
>>> Whether or not there needs to be an intermediate library wrapped
>>> around this is a different matter.
> IMO individual drivers should not be expected to use this interface
> directly, as that would add to boilerplate code and overall bloat.

The thing is the ACPI method is not a platform method.  It's
a function of the device (_DSM).

The reason for having acpi_wbrf.c in the first place is to
avoid the boilerplate of the _DSM implementation across multiple
drivers.

>
> Also whoever uses it, would first need to check if the device in
> question has an ACPI companion.


Which comes back to Andrew's point.
Either we:

Have a generic wbrf_ helper that takes struct *device and
internally checks if there is an ACPI companion and support.

or

Do the check for support in mac80211 + applicable drivers
and only call the AMD WBRF ACPI method in those drivers in
those cases.


