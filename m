Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E19674940D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 05:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0159810E3CF;
	Thu,  6 Jul 2023 03:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF5610E3CF;
 Thu,  6 Jul 2023 03:09:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vdfbgnnhqo3avu8uOej78n4vS6a1iOzQ/iNe4IKbV7rhAyWTD/oDXdqPwKDkPBALve8GCwNW84hq1/wUbf1O0e6YiyWimiFUfLFNfK4PhsXnjg2cDx2FpYOG5g7C85Cx/8mAEUNzudkVJNEDaC8ir+wvmnOwO2dWy6hUjTUBXQ4QVDnf4SbCQ/LkqrM9jwVnSj8Rtw8jrkcE4qLDn6kvyZmzktoRgwP2VbB2cE0w7qY9mzL3iV3v5PK/SqGjxymjGUkFpJOO5KGSC3Uq8ZDTaGNHp6W4hCq+86zsT1JkKMcFK9wUEeYmnaC+EgWD4keUPAuemvsBeuloYE5ZsHFeeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gEJsgs4IMZp5Q9MpQfjvQyuwdAhe6NQzk7JLGA1PqQ=;
 b=ZdXRNAfdfZMIDhAm3VA2DGAS6CfLxqndN3UwdpEDn7mZKtHy4vlJD0HTt5r1cTQuT2suPReiwS6d79UhHBG683VSSACjg36CJ/dOFF6JHAzypm0zP2odzsa7qz/6kl/CyrdkO2Bdkrrp8s0rCE+p//Ap0gCxHk8bblJ9fBk11PiBO0FCgvoC5NUqPS+07FyLNkoNKyLIwDXHu3Tfzlxm/ECFcfJyVDQJfyWk7OYc0Ii0rKU9oA0+Qp2c9g39kLov2rYLqYiCkp9/oW0RL5EjjwQl3f+X84tOgAZ932LkAuKhzWaJHEa5McikcXOciBHGVKiQRa1hXLc9ptngl4dMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gEJsgs4IMZp5Q9MpQfjvQyuwdAhe6NQzk7JLGA1PqQ=;
 b=X+M+/wTlkREULk6v/Mhci9SGrUoFpA73s9sbAgK4+fB/HiFv9PQtQVydzf5WQF8TAwcX1EkWJiL9Cp9U0hu8Zt/M49U7RV32tA5pyuhEMHOf+aqv7E2sdoH+o1dByuSzqtlnFhz2+SYOFzQUun2fXIl5dIh0O7IXEeoR4GHozMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6881.namprd12.prod.outlook.com (2603:10b6:510:1b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 03:09:05 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 03:09:05 +0000
Message-ID: <f2612b12-5c9d-dcba-2221-220261ac7b44@amd.com>
Date: Wed, 5 Jul 2023 22:09:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
To: "Quan, Evan" <Evan.Quan@amd.com>, Andrew Lunn <andrew@lunn.ch>
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-2-evan.quan@amd.com>
 <7e7db6eb-4f46-407a-8d1f-16688554ad80@lunn.ch>
 <DM6PR12MB2619591A7706A30362E11DC5E42EA@DM6PR12MB2619.namprd12.prod.outlook.com>
 <18dfe989-2610-4234-ade2-ffbc2f233c19@lunn.ch>
 <DM6PR12MB26198720EBBAAB8C989F8D4BE42CA@DM6PR12MB2619.namprd12.prod.outlook.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <DM6PR12MB26198720EBBAAB8C989F8D4BE42CA@DM6PR12MB2619.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:5:3b5::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 4440bdcc-b80a-4c7b-0cb9-08db7dce5b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AT+DpR9XkPzWwMV9rfPGSugp/iDMOvm+vECJ6ThKib0qRTQR4i8JiJKM5cgbSaA16oASj2kghkQHdOsTBsMkrwq0CQfxSaGrwfrOgoqtXgo8oNxRCwe02CZjGeE2ONHr2acBA6dKAshVyYM6n+GaZddiPp1LLDjn12tSX6JTNK8D8ysR9sr+ygYOxvagLQ3YbKLOszyVwkd2aRW8uOTiZKDP7mFWW+uYvuQCyxo7ms6gkBL67sKQzQxWQjAbQEZsWhBLO5Mj1hziYVQTs06KLH0c7E3MwW2qUNcG3aajQfISdP1TP8MBnU/uacWu7+0fY4FMOHmPI1dtGIojuISL95Tmd/kQxyJEBXBuWJ+shTMgIyycl3sdm6akq0jQ1calQpx7bKhedfnHIYhwJfsaOsTlZJqV0LlDtW7cTeyAfD0sevDaQ9FMuJvudN2eabwhduQV3T1WZaILWHdojxgsl7OURyGZt+mzoU3LqBR9MRW2eMTKXdaNsKzRS3lui5o8nB8uZyRzccwEBtGOjdWk37pOvUr5qEQjBH4JMFOWVcHMDj1ib77em8SwIpkPLS6nYVs8dNRITtQsDszlmnhybR9y5t1RHkfzNA9fydyuOCpCAbeDH2gbGk2aC2rhlBLIz+IjSMiFyYoNMkWspbC+OA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199021)(53546011)(5660300002)(2616005)(8676002)(31696002)(86362001)(8936002)(54906003)(83380400001)(38100700002)(41300700001)(316002)(66556008)(66476007)(36756003)(4326008)(66946007)(6512007)(186003)(110136005)(6666004)(6486002)(478600001)(6506007)(2906002)(31686004)(44832011)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emtkdmJ0YUthbkFHN0VTUTBHM3lPNkordVREOW81STVoZm1XdGZCZmlwRURj?=
 =?utf-8?B?Tng5THptbUkrckoyZDE5cXUwdnR1OG9oNFZ6TTZtNHo5YnkvSVhWV1QzT0Z3?=
 =?utf-8?B?ZGRKdlN4NG1VZ3orbHZHY2FEWEt3SFBqUXNjTjM5a3hmamlRWjNjcnhVT2ZH?=
 =?utf-8?B?TVE3MDhjM1d2M0VLY29TV0gyZFFzVWZETWR0bXIrdDdXbXZCSmVkdVR2dFJE?=
 =?utf-8?B?L2JTWG4xSFhTY1lxdmV5aVVCcE10UEpBNmhUUVh5T1pZZXpXY2dNU094ZjUx?=
 =?utf-8?B?QjZXMGIrV3ByanJCcUhibVBkWlZOYXc1U0MxSlRRdjNoczdsclJLbG9aKzBZ?=
 =?utf-8?B?UHhBWUhZQURVUTI3UFJIUjRUbVpFc0M4a0x5T2c5Szd0a3dMZmk5ZWNFcGdF?=
 =?utf-8?B?NzhSbGtEa3J4WHIzT3FLMnlYZjNVUUNuMVErODVwajdaYmlNdVhYQ2xBM3h3?=
 =?utf-8?B?dE14UVZSbGV3bDhnUHlFaWZnL2dtYVVZT2FlS1pOa2FsZlhpL1gxdXU5M3Ny?=
 =?utf-8?B?NEJTS0FNRXZvWXZka2ZsV24xUHpUcEVpMXR6S0VUZ214ai94UXU4OUc3TEdU?=
 =?utf-8?B?RWgySXhCOHhxM21HckdHSTNQc25wS3ExcTFKRXdrM2xHSHlGSHVxeG9YZlIy?=
 =?utf-8?B?U2MyOFJYVmxoQjJUMG9Ya3F1TUI0RWt6L2JQZERtTTFLbWFTMVFvUWVqQUVx?=
 =?utf-8?B?dnN3bHpnQVFtcDhnVmhPU0s0eDVsTUR4V0xNSFBpUm9peFZPa1NqSXcwSURQ?=
 =?utf-8?B?bG1yUFlpY0Q0ZWR4cldYWEtydHh0bDUzb3dCQmRZQ091a0FUMEFpZ1EyeWxa?=
 =?utf-8?B?Z0VYUFdjOVVJUUVUM1oxRCt0VUxsUXhuWnVYTnF0aGxKYjVvblA3bVhZcFZt?=
 =?utf-8?B?KzRiMHhTejNjWHUvc0NjK1NHYjhUK0NYaitBMUFLeVFkT2ZKdlQxUVpUV29a?=
 =?utf-8?B?WldJT1FYWXF4dUFLdDhGZ2lsUWJtMzRBSkxiNDRUK1ZMZWlQd2JIRlRsNi93?=
 =?utf-8?B?YXcyeXJ4TmVIKy9mTFRhamd1U0lJa0dGZW50THVQRUFBeEVOakFBYnovYlV4?=
 =?utf-8?B?UTVZSXdDeVc3dUtrTEpzcnRIUkZpNDNXOGdSTkhrZVRYZ0MwRDYrVko2VW9R?=
 =?utf-8?B?Vjg0WjV1K1JXYU5FQ21WZHpab0tNNVFvSFpwdkdCb1cxekRlNnJzTHZMNDJo?=
 =?utf-8?B?aE0rOExaL3FSTmJ3ZTdOelNyYVZtbW0zenNQODNIOEJ1b1Z0K1NPY01lVm1V?=
 =?utf-8?B?VTJickhNZkZXMmxvMTFTa3AwVXlrVmRxemJIZFdPYnlxSXlwdHJiTGxjK25Z?=
 =?utf-8?B?ZFJKU1E2eXcvUXVvV0Q0aFVwWUZQM3NaRVk5MVhiRjdmaUJxVml6SlhFOTVl?=
 =?utf-8?B?bG5ZZHNNdk1oSzBNOWkrNDJnREFaZEJhTHYyamZRcVlNZFNBWWVLNDZyQ1Nx?=
 =?utf-8?B?dG9hSGxsM0UzQ09qemVmbnFyRWt4amg3emxvV3FSMHp1bTE0bWlCRXBnZFR3?=
 =?utf-8?B?cU9WNzVCSnFXcEMrNDJJVEIxcVRCbWQxUVZmY2Niek9tMHllQlRIaDRjaDRJ?=
 =?utf-8?B?UEFrYWRadU8zRVA3Z0hNRTNnSmF4Q1oybFZRaFVHemR6YmQ0UHJSSkpicUV6?=
 =?utf-8?B?R0FnZTVCcXMzdGVjRloyTEYvcExMYWp2dE1sME5tUkhhYWNKOThaZk1nbXRl?=
 =?utf-8?B?cjZBUE93NkEzL1JSVkVadzhhS0NHNUdKdU9NQ3gwN1JNN1lMdGx3Tm1wZHpD?=
 =?utf-8?B?eW9nMjN1ZEgxL3RFYWFyWkRQM241RkpMRTdPdjFUM0tCL3htTytjRUpvaGs3?=
 =?utf-8?B?VExPSUw3bGVGekQydkFGeGFGdzlCVGhKaTdJSlE2U3JGbk1tN1FvU1ZKTVc2?=
 =?utf-8?B?VXZwU0ZENGtlSGJ3S212dTlRekFJZjRYeU1OSWRiN0NmK211SFpLa3BpQnJB?=
 =?utf-8?B?SHNnckxQMFoxdlU2UjdibzIvZzZJcUpNNWgwRm1yWXlNVnBFbWx0ZERXdmIy?=
 =?utf-8?B?SjdrSnJsRmdZc200dmo1ZXNXLzZ4V3g5N2t4Z3doN0JZcm15MUVCZmd3K1hM?=
 =?utf-8?B?eHB3OFRCeFdBSzhwdUFReWtPTmVBZHZES0w2ZHRyUTdXeG5KZmk2bGhjSDNM?=
 =?utf-8?B?cHo2dzR2a09VUFBwOTRuZDhnbVp3RnR2MkFCcHJEVW5DWDZvcjhaYnpXL3dK?=
 =?utf-8?B?NkE9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4440bdcc-b80a-4c7b-0cb9-08db7dce5b07
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 03:09:04.9126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcNGsvTp8Lwa/ccRYUc7CkMtIqfS2ZYLF9R5sVf3e9GiNT6FYjEyOKvIzZ4PE3JoTu/zhaggaTSbTQgpgrgsgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6881
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
Cc: "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
 "bellosilicio@gmail.com" <bellosilicio@gmail.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "trix@redhat.com" <trix@redhat.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/5/23 21:58, Quan, Evan wrote:
> [AMD Official Use Only - General]
> 
> Hi Andrew,
> 
> I discussed with Mario about your proposal/concerns here.
> We believe some changes below might address your concerns.
> - place/move the wbrf_supported_producer check inside acpi_amd_wbrf_add_exclusion and acpi_amd_wbrf_add_exclusion
> - place the wbrf_supported_consumer check inside acpi_amd_wbrf_retrieve_exclusions
> So that the wbrf_supported_producer and wbrf_supported_consumer can be dropped.
> We made some prototypes and even performed some tests which showed technically it is absolutely practicable.
> 
> However, we found several issues with that.
> - The overhead caused by the extra _producer/_consumer check on every calling of wbrf_add/remove/retrieve_ecxclusion.
>    Especially when you consider there might be multiple producers and consumers in the system at the same time. And some of
>    them might do in-use band/frequency switching frequently.

One more piece of overhead that is in this same theme that Evan didn't 
mention is the case of a system "without" AMD's ACPI WBRF but the kernel 
was configured with it enabled.  Think like a distro kernel.

Moving it into add/remove exclusion would mean that every single time 
frequency changed by a producer the _DSM would attempt to be evaluated 
and fail.  To avoid that extra call overhead after the first time would 
mean needing to keep a variable somewhere, and at that point what did 
you save?

> - Some extra costs caused by the "know it only at the last minute". For example, to support WBRF, amdgpu driver needs some preparations: install the notification hander,
>    setup the delay workqueue(to handle possible events flooding) and even notify firmware engine to be ready. However, only on the 1st notification receiving,
>    it is realized(reported by wbrf_supported_consumer check) the WBRF feature is actually not supported. All those extra costs can be actually avoided if we can know the WBRF is not supported at first.
>    This could happen to other consumers and producers too.
> 
> After a careful consideration, we think the changes do not benefit us much. It does not deserve us to spend extra efforts.
> Thus we would like to stick with original implementations. That is to have wbrf_supported_producer and wbrf_supported_consumer interfaces exposed.
> Then other drivers/subsystems can do necessary wbrf support check in advance and coordinate their actions accordingly.
> Please let us know your thoughts.
> 
> BR,
> Evan
>> -----Original Message-----
>> From: Andrew Lunn <andrew@lunn.ch>
>> Sent: Tuesday, July 4, 2023 9:07 PM
>> To: Quan, Evan <Evan.Quan@amd.com>
>> Cc: rafael@kernel.org; lenb@kernel.org; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> airlied@gmail.com; daniel@ffwll.ch; johannes@sipsolutions.net;
>> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
>> pabeni@redhat.com; Limonciello, Mario <Mario.Limonciello@amd.com>;
>> mdaenzer@redhat.com; maarten.lankhorst@linux.intel.com;
>> tzimmermann@suse.de; hdegoede@redhat.com; jingyuwang_vip@163.com;
>> Lazar, Lijo <Lijo.Lazar@amd.com>; jim.cromie@gmail.com;
>> bellosilicio@gmail.com; andrealmeid@igalia.com; trix@redhat.com;
>> jsg@jsg.id.au; arnd@arndb.de; linux-kernel@vger.kernel.org; linux-
>> acpi@vger.kernel.org; amd-gfx@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org; linux-wireless@vger.kernel.org;
>> netdev@vger.kernel.org
>> Subject: Re: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
>> mitigations
>>
>>>> What is the purpose of this stage? Why would it not be supported for
>>>> this device?
>>> This is needed for wbrf support via ACPI mechanism. If BIOS(AML code)
>>> does not support the wbrf adding/removing for some device, it should
>> speak that out so that the device can be aware of that.
>>
>> How much overhead is this adding? How deep do you need to go to find the
>> BIOS does not support it? And how often is this called?
>>
>> Where do we want to add complexity? In the generic API? Or maybe a little
>> deeper in the ACPI specific code?
>>
>>         Andrew
> 

