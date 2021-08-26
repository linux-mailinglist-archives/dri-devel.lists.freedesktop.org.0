Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A23B3F9071
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 00:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B666E8C2;
	Thu, 26 Aug 2021 22:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2079.outbound.protection.outlook.com [40.107.95.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0D16E8BF;
 Thu, 26 Aug 2021 22:27:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqJyOQFrFKl6brxbHRWFM/nEaelG/P5Fm6jzj+a8bSsuYmtriaQs9CzsAcMSvE5vPjvDa3p7SLYgcq2zENlDZrN6We1iQ34H5b1D9wSLeRFBmO1iYz3EkcLc8+/cKk4W0iD69ZWUMtAB4anPL0zyDJ65rMcSxIcWIe7OGsQTDEUCGTFD6RiT4/IQuqq1vgatZCNNwIx3p+UsyEQ/BW9z/BTbd6gGmV8yOc8MvQnl1jdIcA8GdjwEockSi+QRfKSeb/larhxJR3zypIqrLEeupDJpCqPJ/Oo+N90W4j5O5RsBRI95iUDkA5ZBj1OM6NsmWULih9d1O6UhZJqkD+7Iyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eW8bnWEViOjMUDQKAQ+jUogWF+7PCXFNpo0HjvN+wsM=;
 b=AMFrg4KXR5qG9dkvYhECexQZ9MSPOmnuJIJEu8/c9aXhQZbG5FhYVzB9eqIAEu8Cc1hv4fq2YVP95FmdDgfi5MI9ADlRTee/Ri5oi+GR0pJag3HecY6tCX1jmv0Kfh1A/otkpjNh1xcQfLJSAJh+VN3p/9KJRwFoGCr4Xfm8s/bi+8MMUJ0z/1xekypTRgsP6CyyT+pTdUQ08oVRgLDIXnflSO7wYbPuL3wEaSGizr07aXjpH0TRnPi2+F0eGznfPSEkhqTi7ZY4f87/kOykShpS+sJTak31iNcefTysIJcYOz8UtfmAHsg2IQm3uFyQg6coJe0rQ/EOxcNV311MMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eW8bnWEViOjMUDQKAQ+jUogWF+7PCXFNpo0HjvN+wsM=;
 b=MQ8ksyJ8Ljo6WsuvIardfhwRus0yRfuF7oLMkQ9brkLIAQt1aPABqL6pDKUOr08R4NJEVTQXAGZNbti76ozPC1lORiZKaQuILYSqW+E9aZsgvX1OLwTgL8Rk1kvi/cRhfGF0QrI//2Roj2mjBNpN+2EN9HixiVYWaB/KErjB57o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5164.namprd12.prod.outlook.com (2603:10b6:408:11d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 22:27:33 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 22:27:33 +0000
Subject: Re: [PATCH v1 03/14] mm: add iomem vma selection for memory migration
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 Christoph Hellwig <hch@lst.de>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-4-alex.sierra@amd.com> <20210825074602.GA29620@lst.de>
 <c4241eb3-07d2-c85b-0f48-cce4b8369381@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <a9eb2c4a-d8cc-9553-57b7-fd1622679aaa@amd.com>
Date: Thu, 26 Aug 2021 18:27:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c4241eb3-07d2-c85b-0f48-cce4b8369381@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::9) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.47.3) by
 YT1PR01CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.21 via Frontend Transport; Thu, 26 Aug 2021 22:27:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d51cac4-1386-465b-0702-08d968e0b2d1
X-MS-TrafficTypeDiagnostic: BN9PR12MB5164:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5164EABA0E4E61AB480ECF8E92C79@BN9PR12MB5164.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E2FnfY0U+VrvBEXCdeyQtF53uTJz7koYuW1iwgZfxyUR3XVRdwyQIKdv62Nx9T1jskBY2ZA8qMvzrpjisWBJzaCq/TSOG0vPQhHF0q7mXfjDPGYWtAgU4HSxJ5l/JKWQ9T0xQJxFHv1wW9XgYRKd2gG8CS8gHR6st2FacCntyRSla36kVMn8nP7e+jcLyM/sdl5DRyebd3kTPrW4kmeG/mV/SM5ptf6herh4rLOJuI38egJ6MaIER+xd6uXuZsfh7EDtzFsAgyWQwvr696e2fzuWaZWqAHuGlAc2p78ZhMqE65lMhWcnBtEF/54UIqW0cs7VRf1M1MrwnEQKk6/oYtfCBCn4FYlaNY0n4ohPvRx5ewOeBGnPb0zQoSeycVpbdHhg85ZHcaJrjCwOZlTDfR577PcWlBBKvFSDqy2p9gXqmSlMymZoUDNLrlXg885ydLZvQLz9xNNaP42g7JuwvErG2cuo6jk2M9vKxwxS9ut5qSUpm2HTgRkDi7G0At+V8L6Kg50wEUS58YD7t+j1V1Ji3vBuCsSYWDlnIISJwuflLWFsKF+liyDs5RpXiibHCBlQ+gOwnxkZCTvHDoUm5He5w111Uq6/r4otXy31s7tOk3lWExbeL7mVQRoKctnK0dV8FBFprfw4ChgCA/oxV7IaDF0F0g+7dK39XtHS7gGrwuMIfDFZKYSQNvSvcXiJpExFIIPQkSlUBG6uXWrqqR9V0IRi3mWp93EaBqsS6Qg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(478600001)(4326008)(86362001)(31696002)(8676002)(66946007)(66556008)(31686004)(316002)(66476007)(8936002)(16576012)(110136005)(2906002)(38100700002)(36756003)(53546011)(44832011)(26005)(186003)(5660300002)(2616005)(6486002)(956004)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWV6cFB6engrMWExWUE1TS9jekZDS01IR0RiY0lTWjdIMTgxTW5mdW85ZU9r?=
 =?utf-8?B?UnhuM05QRWRaRW5PckVTNEcvQjg5V1E4R0FnS1l4NS9nVmtZVzR1RGlJYWUz?=
 =?utf-8?B?V2JsVlQ5eEJhYW5zY1VFbmtIVHdMUjZ3WXdWbVozWDljZXFzczU3NXVRcU0r?=
 =?utf-8?B?YVJxVytUbDhVWGM2QWRnNno2Tm00elBWTEdoc09hMS9DbVZNWm9idGJ2elhK?=
 =?utf-8?B?eWtuMTFaWGdBUk05cnU3eDlYNHREaWFGZHJTcXBJWHlEbWFCcTJLbXBKRnpN?=
 =?utf-8?B?QzdPOUsxOUZhQWFFSUJRcTJyK0ZnSmtmdnV5QmVKMEpCNlJBc1dpRGF5bkZC?=
 =?utf-8?B?NytncnR2dHZzZVNIeHJsMVRlK1MrUStaU0EvUFJSYmlVZ1dpaXZaSlFTSTB3?=
 =?utf-8?B?Tm5FZlNvZ1lyTExoVzV4YnE1VVRxNEVwMXRUL3oyUHVTOEEvVlFGQjNGTXJG?=
 =?utf-8?B?eXpWbzRMMmpxWjcrVmY0emRSSmpSNndXR0ROQndoT3FEcmQ5Mkg4ZEV5V2pP?=
 =?utf-8?B?Y0FhYVpUaXlPMkFhMUZZUUJYVkpJcVpNbVpJZ0JBMlZJZkViY3IwRVRrckVr?=
 =?utf-8?B?WGtKeWdkUm41NDRMUzM5Z3JrODUrMHJuMnBlZHlPblloN1VxejJMM1gzc2Vn?=
 =?utf-8?B?Rm5oN0xQRTZDTmZXd0tRSGtHNlhGZU9STGVaL2lsT1FjbkwrR2hBRjhKeEZF?=
 =?utf-8?B?NytSWmJkWmRyUEhSZUQzVThQMXlrbktvb2pPOWtxVFFpRTloWmhEczZNR2VV?=
 =?utf-8?B?TDNHVzRDVWpwb0E5ZnYyeEdHVXg4clpXOGxyUkNHQ2JMZG1iOHNxSlRQMS9a?=
 =?utf-8?B?WVU3cHU0Y011Mk9LTCtaZlI0MmpZbEtmMzQrZElhbmZnUTNuakdZWWM1S0RP?=
 =?utf-8?B?NnpGZG02a0F3RkpPNHMveUYvcjh2MHVkSiswdEpkQXZ5QTBTM1pnQzNKS25W?=
 =?utf-8?B?V0F5NkdjdWVXNXNxSkdDeWVoR0xMUjlVeXlDNTdIY1ZOREFhNG9NZXIyUUFJ?=
 =?utf-8?B?U2RKb1RBUGkyUlo2LzZlbS8xME80WTQ3dENTeml4V29qWWh2dm5FbnRaL2I0?=
 =?utf-8?B?S1JveitQaXdwNFNBYlNmeVZPYkFrYWFGU0FzWGJaVEJpZHdHbWF2bGdLWXAz?=
 =?utf-8?B?TFRtWVFwRjV2OFl2bjBNOHR6NktsQk9jQW9QaVJVQzJjTzFNdGNvT1FjL1U5?=
 =?utf-8?B?NUo0SmVCdXpzOFhyNUpuZGM3TGpwY3dNSDIwWXB3ZysxaU9MWHdUVktZanBB?=
 =?utf-8?B?azF0ZFJXKzhPbXRrcFIxeVNxQ3hVbEoyQUZuYkl5ZXFaNDAySHFWRldwWGow?=
 =?utf-8?B?alA2QVZYK3RneFFWTUZKZDlzV1I4NHlSSlNYcDJ6WmFyakJrT05QWGdpaHpr?=
 =?utf-8?B?OEJHMVd3L3Bxa3JKWW5Rc0pRNTRkVFRsdEhRd1lzb3l3Tm1UbVY1RjYzM0hM?=
 =?utf-8?B?aVM5TWRxOEpPdXYxZEt3QkNienB6R0hCN2h4d2YxalE3azhuZWZ5S3FoSGlQ?=
 =?utf-8?B?Ti94SURyZS8xTDBaYTNQOU1wUGNsVCtwbFduV1Z1b1NPdnRoN24yN0xrTE5R?=
 =?utf-8?B?endqbVpCdVFpclRmSnF1ZzY5MTUzNFc4Qm9ldzA3WUhSd1FUTU9QZVEvdlFC?=
 =?utf-8?B?U0VjSHRCTE15S3RyMlFtazFCdDZRTTRGem1TOEFXWVd6TmR6REtxVU50dWxR?=
 =?utf-8?B?c24rdjNYZldUYjlpYVZvUVd2N1V0Qk1aZ3ZWZlUzMkZ0MmhIM1NaNy9aVTRz?=
 =?utf-8?Q?lkeLxPHUswi8F60B3QgarQOonVqKI1+VQNFK5PI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d51cac4-1386-465b-0702-08d968e0b2d1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 22:27:33.3593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SanLMPqS/O0oQBvAUwxmh6AI2jEy1jvvINlDyDy+WyjeV0uYES/JgaGJdyKHJec7Y+DsVhUaHmH0BXr/nqvOGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5164
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

Am 2021-08-25 um 2:24 p.m. schrieb Sierra Guiza, Alejandro (Alex):
>
> On 8/25/2021 2:46 AM, Christoph Hellwig wrote:
>> On Tue, Aug 24, 2021 at 10:48:17PM -0500, Alex Sierra wrote:
>>>           } else {
>>> -            if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
>>> +            if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM) &&
>>> +                !(migrate->flags & MIGRATE_VMA_SELECT_IOMEM))
>>>                   goto next;
>>>               pfn = pte_pfn(pte);
>>>               if (is_zero_pfn(pfn)) {
>> .. also how is this going to work for the device public memory?  That
>> should be pte_special() an thus fail vm_normal_page.
> Perhaps we're missing something, as we're not doing any special
> marking for the device public pfn/entries.
> pfn_valid return true, pte_special return false and pfn_t_devmap
> return false on these pages. Same as system pages.
> That's the reason vm_normal_page returns the page correctly through
> pfn_to_page helper.

Hi Christoph,

I think we're missing something here. As far as I can tell, all the work
we did first with DEVICE_GENERIC and now DEVICE_PUBLIC always used
normal pages. Are we missing something in our driver code that would
make these PTEs special? I don't understand how that can be, because
driver code is not really involved in updating the CPU mappings. Maybe
it's something we need to do in the migration helpers.

Thanks,
  Felix


>
> Regards,
> Alex S.
