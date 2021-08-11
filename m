Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0183E9A0C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 22:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A23A6E1B7;
	Wed, 11 Aug 2021 20:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203876E1B5;
 Wed, 11 Aug 2021 20:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9Aff/oI3rGEdAO29OVwTzogFdbHu0/TqPWlLPL454aLUE0WNVUfV1fIv9VJyT/rNDYksDc3N+NIiE3K31vFoccCp4FKyAwYf1Lu4eQEvpuEtesXN9bLngUB94tYW0YaM062bMhwejrnDkycnxB9wIDx6mdblyCI8uXhBVbMHyaD35YQgPplXEMAIC7lKVrpIOiDRqNs1aQzUxfVw6d96tY7gIRs39o7v6V0zxUefN6V0qRoWO9lUDudJnmD+AYU7Ze/iCGlhEcPaNy4KuU7Of0TosMAIUiKF8NjkG6rMw++1mTSZLdbuPmaX0/zDqLt6s9O1RJfYxDMW4GmXifLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+xUAlNtfxCFmgk8zTZQItiiaRjejfEIlNpSmXy2FJM=;
 b=WGNnq1Y8ox9obzI6wc1hJi4wswd+cksV+4wCRdPAa/xo9a/MFxReTVZOryARjDNaTbZb+jEdFjTjWyskT3S6uRsPAH1uPxPiS7nxPph+qB5Q21gX+4lkXidM+KaLACJkTYMgCP3RGMOMaEKqdzRcZH/fVJTxON/XpZR4Vx3tghgC2dtzBIN7AazbkZXSpEtH/DJZXkOxx+YoUO1IwNx1uWp4xvi0MLCk8M5r5jYX6hUXA4U3B6c3EXQpAqz0bemZnsbBm5H+o1RSQd2krDqvh0pNN9pq/MZcJNcZQ482ZhM7Apm/hFJGUZc9/rNKczMaM/BbZvP2PT9LICaJJjiO1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+xUAlNtfxCFmgk8zTZQItiiaRjejfEIlNpSmXy2FJM=;
 b=mennxkbnHrxsTVPCW802xVwrDDENEQ5VJUwmq8DjYtDsI8b4LHikmVU3BIzt+fLbykVX5pRN+suD/dbPu0Jzj4CChL+s4gDNSN1h3n2gqIRHRTg/Iwku2nDX+GvCRGiG/OgoTX+DtHZHndURJmEGQRy1o9InCwOTBKK3DwLr5/8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5308.namprd12.prod.outlook.com (2603:10b6:408:105::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.20; Wed, 11 Aug
 2021 20:50:31 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%4]) with mapi id 15.20.4415.016; Wed, 11 Aug 2021
 20:50:31 +0000
Subject: Re: [PATCH] Whitelist AMD host bridge device(s) to enable P2P DMA
To: Alex Deucher <alexdeucher@gmail.com>,
 Ramesh Errabolu <Ramesh.Errabolu@amd.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20210811191104.21919-1-Ramesh.Errabolu@amd.com>
 <CADnq5_OVA1fB5x6=CGrd_5O-i=P7snmoJaTyauF2RKuWjc8Gog@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <ba4ee532-d64a-72c5-7aab-2b86a75b8174@amd.com>
Date: Wed, 11 Aug 2021 16:50:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CADnq5_OVA1fB5x6=CGrd_5O-i=P7snmoJaTyauF2RKuWjc8Gog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::15) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.144.73) by
 YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 20:50:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45d1ce35-0cde-4e7f-285d-08d95d09a858
X-MS-TrafficTypeDiagnostic: BN9PR12MB5308:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB53085A17DFD237447476632D92F89@BN9PR12MB5308.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8/aIx95xq+izVS58AKhjCiQm6hisS/6aln4z/wQVY7rKI2YXgSs7CAqpVhLvy6rV7/ggGq2+RItiLwTCnvlcnveK+ZiIM45Yz8BpoXV9oWluzrEdtVNQ46Y0gK5ZDLTpL+uqqqwPpZgKLG9N7gbmI64l1g/6L7PlvuBPgQcdPqS8ytrufb/+WK/5WAGSppHmw7fxvOo09Rhbhh0vgJqFAQevUF05ortN/Dh4B3svg5OsQ1751Dvmik6q41zlcg5ilZ+EBDX57cG5IKGEPnIrY68mbFoINX4b+4F2h6FExsGp87e5du1ywDdvhEEqyQLqAEXpSlRgcfpt/zr0FQwqUhuTdZy7MOinDuaP95GVdeRyYskDxdYcO0rtvg8Jo6pggs7P/RhfVsavKFuB1WXri7JGfyQMy4//PRpvsBGiNGyr1oxYoWRT0KyGMfzdhZThWcTkSk10khTX4I+ULFVm0HephOUfIYreb/jXSf43xEJMYMQG4SQE+4sdKO5ADKRAVg54YAyhfDUuYupHg9w4rb/GXfXDNdMhayiNrt9Mkc9EdIdmD1wISnslEmdP5AbteAm/KMd1i5fBZW7OT52J0GGDAtTN4DtKptP1WIFWm8FNdxmKNdr4uIg34+O2JML6FcMi6yRVnetMivZIntf8d7xlDpgTOqQLlVMEkt25Gh6YzmAlME9uwF0wtfvEKZKtjyENxx3IcQ3vjX9VsuZyNzbS9Hu99RGkiOaxhOTX2BIm1RoW64bDE/w2S7O8sE/o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(6636002)(31686004)(8936002)(31696002)(44832011)(956004)(2616005)(6486002)(36756003)(16576012)(86362001)(316002)(186003)(478600001)(38100700002)(4326008)(54906003)(66556008)(5660300002)(26005)(2906002)(110136005)(66476007)(8676002)(66946007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QllCdFArM1R6amRoNnJhWUNwUWMzOXkzdUp4OVhmeW5pOFhqSnEvRlJLVUdo?=
 =?utf-8?B?V2wvcVFqeHZmdHZQQUVGdmo1VCtPZml0dXZPQUxYUkJNMWtEcG5aMmFOTk15?=
 =?utf-8?B?TTVNZEdBSzBvZmpucytreFpQditZR3Z2OGRVM2o0M09la0V6M0RteWFzZHlm?=
 =?utf-8?B?K3FUUndCWFVNYTVXWjNVcTZDUWxtUll1dmRhVm0reTh6UDhsbWhtZWlhOVdU?=
 =?utf-8?B?azYrUDFuNmgxQXNPWFMyTE9naC9aZzJKK2ZrRHRwS2hLOVBDYkNFcEpydFpu?=
 =?utf-8?B?QjNjaGpwZGlVMG16dEo1djkrS2hDZXZMVFNSZDZVN21vTjhTSGo1V0YrZVg0?=
 =?utf-8?B?QkxtNVpVMUtuTVNoWXV2UDk3eHVFak5lVFREKzZlVjNVeDYvWDNDZ1pPbzYr?=
 =?utf-8?B?MERrRk1RYkZWUVRMNHdzbllaK0MvZktwQUhvQUhJQ3YydHZlVE5EYThiSEZB?=
 =?utf-8?B?cWVaWnhqeHkvT3Z6TlhoYUlub3hLZnA3RHBkRmhsRGZKWXd2UC9mNit3KzZ1?=
 =?utf-8?B?dHBpVUcrMjMrYTdnSDZQRFhXbGd2U3ZLOGd3OS9jK0hvak9MMDZVNUZlZzc5?=
 =?utf-8?B?bFpZRkhtTHJTK0hEVWxnamQyNVRzZ29rTG02R3RCNGt3SWZIYTVrVjViRHJW?=
 =?utf-8?B?RUptZytrZ254UkJMVVhCRWpJUGdtY1pVSHRySjViWmlDN1Z6cEh3emV4b0RN?=
 =?utf-8?B?M1gycUNUeVMzbEpLNFdIeFR1dXg4eVJ6SXJkSlBXM2NqR2pLQjlZTVh0RWlz?=
 =?utf-8?B?amd6b00vQmdpMVA0aFR2SHQ4K3NvV2JPNCs1SWtIWnFWNG9PUkZrN3JVQ2Ux?=
 =?utf-8?B?Ymw3dzlWWGk4aEZ1Q3FTNmduVGt0cGxWV1o5eTVkdTJ0Sll3MXdUTjNzSUZI?=
 =?utf-8?B?aVpzSGsycTlvWVliWUYvUDF6NW8wdStnNVM4UjJSelcrbzF0WmtVSytCQVdR?=
 =?utf-8?B?alUydlVZM1JpTGQrVVV0WTRYRXRPWEJ3Y21XNGIwdUJHUC9QQm8vN1NTNERV?=
 =?utf-8?B?WHZiNms3dU5jMFZ4K2t3Rlk4WEJJa0paSXg5NkIyNytsM0dzS1Vwam1wZFhB?=
 =?utf-8?B?M1Mya2hQWFFQVVh0bElubXo4MFE2M0VnUml0VWNnQlZ0Z2FaSjNIVVB4OTNL?=
 =?utf-8?B?ZnlmRmhQUm5URkFPQ3hFSmwrQkh3NzdhbnJiUFFsaFo4MDhxTFFkWkRPWThF?=
 =?utf-8?B?Z2tJdmMrTStkQ0ttd3ErZmhQYUhWejFwV1JIUFJNOFZTNXdFQ3FRZ042N253?=
 =?utf-8?B?czVIclJ2QmpYVzRjMUo1NWF0ZlBCMUJxODRUUWdRWHpFeTNGY0piV0VCS2hP?=
 =?utf-8?B?bklDU1kwMUVQSDRJY3RSQUVqNk9rdWdqYjg0WEFrcFN3U29meEJpSUY3VitE?=
 =?utf-8?B?SVpIRE42YUtUb2cvNFRmN2o2U2hNSlRpMkMxRFBxVVcxVjhoQkJlVXJVT2Ey?=
 =?utf-8?B?aG5GakVNbkE4VkhFZVhjcmJ6YXRYaUlkRWVzYSttc240ZzJkSnpZR2l3ZVBp?=
 =?utf-8?B?YmpxNEN4RkswMjE3K3ZqRWxMM3hIQ0FmNTZJRFI4Y0dJYWtxQmpxVzN0V2Jz?=
 =?utf-8?B?SWtTLzVaMlBkeXR3cEhUc0pCeUgrVzdYRkhuQkNNdlQ4T041aEZjcGo4RVlh?=
 =?utf-8?B?c0RFWDFUUkk2SGc2Wm4xL0ZCRk5QMSs1RnJhVkgvNmJRRVU1Zi9wM211ejls?=
 =?utf-8?B?T21ZaitLOU1Remg4S1c5ZGZEV2JmN3FyNnh1NVNoZVVwUHBWRmZCWm51Nldm?=
 =?utf-8?Q?Y8PaNNLe3wysb+UofhIKxjZeW4scIAW2+fhjwow?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d1ce35-0cde-4e7f-285d-08d95d09a858
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 20:50:31.2085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WP2MnkWUva9yyqiBDmNF8lBNuuOWyY+M6MrRc9Lg75rtC2zZXTt1hGFXCqHDFVG8FDuW2WTfscMEnWPGsiX/5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5308
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2021-08-11 um 3:29 p.m. schrieb Alex Deucher:
> On Wed, Aug 11, 2021 at 3:11 PM Ramesh Errabolu <Ramesh.Errabolu@amd.com> wrote:
>> Current implementation will disallow P2P DMA if the participating
>> devices belong to different root complexes. Implementation allows
>> this default behavior to be overridden for whitelisted devices. The
>> patch adds an AMD host bridge to be whitelisted
> Why do we need this?  cpu_supports_p2pdma() should return true for all
> AMD Zen CPUs.

This is part of our on-going work to get P2P support upstream. We want
to use pci_p2pdma_distance_many to determine whether P2P is possible
between a pair of devices. This whitelist is used in this function. This
will affect the P2P links reported in the topology and it will be
double-checked in the BO mapping function to ensure a peer mapping is legal.

I think this change is a bit free of context at the moment, as we're
still working on a few other loose ends for P2P support in our internal
branch. I'm hoping we'll have a bigger patch series for upstreamable KFD
P2P support ready in a few weeks. I also think we'll probably want to
add a few more PCI IDs for other supported AMD root complexes.

Regards,
  Felix


>
> Alex
>
>> Signed-off-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
>> ---
>>  drivers/pci/p2pdma.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
>> index 196382630363..7003bb9faf23 100644
>> --- a/drivers/pci/p2pdma.c
>> +++ b/drivers/pci/p2pdma.c
>> @@ -305,6 +305,8 @@ static const struct pci_p2pdma_whitelist_entry {
>>         {PCI_VENDOR_ID_INTEL,   0x2032, 0},
>>         {PCI_VENDOR_ID_INTEL,   0x2033, 0},
>>         {PCI_VENDOR_ID_INTEL,   0x2020, 0},
>> +       /* AMD Host Bridge Devices */
>> +       {PCI_VENDOR_ID_AMD,     0x1480, 0},
>>         {}
>>  };
>>
>> --
>> 2.31.1
>>
