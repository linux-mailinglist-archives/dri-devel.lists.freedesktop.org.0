Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC633D2B08
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 19:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DACE6F484;
	Thu, 22 Jul 2021 17:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8A46F484
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 17:22:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuVCAX4Wrnzp4z2xNVw+zNYFD9alWqUecxs5FA6tjK1lBN7Dx8RM60kVwzvHrlK0bkCG3meVNstcq9yMd6ysdFTPG6O/ihHdDlyx67MsYR9J4Xa3jr/u+XkZgJHZrUm3Y6Sq92klAq4DTEMoe373yL8CKV4X+TWuam9RPbHMgca45t1NbyyP4YbyhdeEO5SwoVilx9sQbLFvqTCh9RM7txwuQG16r2fm5AObB8ERYd/bgGe2KkOSWKahWePoC63cF+Gs4e65FNiABA2C97cWrwQjl+R8qs9EWBbWjr+IAIfq47528NpTyDySBIn3H6TpvWbNEr0n82/V9N3X2oeX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4/6pl+TNO9IvpB9uGhALKVHQEE1RkgZ1hY3EpZMf50=;
 b=HKBwIjNKGpbKxhMbdkECPD5Jwv0KhO/Crs/6cP/K4bEb30KXT+1rGHo+QIqjynPFn4Ku8PZEqOMLunQBLP09EPQMNG67kZZ/ag7N3jtHPVmIyfRdWjuo4+kNrXNRzToKBQnFizCeK/xX1MAJhBqiR/8HBRii5nojD0yvbPHvbriXTcNACZQ04pQboqxCrichKk274FhuW+dYgNGQRUgAcfOw19q5yPp0w1LuOw1lm+QK2jzZB8KX4vcSGT6zD1E/eldwcVbuyC3NoDbouxmPzMI+0IOFWQcg6lAuQL9y4DvgTwEyYdvgxSJtL0fBCwXOuMkCmPC811NRyY2KzPIfZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4/6pl+TNO9IvpB9uGhALKVHQEE1RkgZ1hY3EpZMf50=;
 b=TUfb0k2uMqcyIeudzBDwSswxoxmQkIihuGrZwtczSViwfrM0WM6IxnlgheowPH23xA6twUIh0cY5MheqRtOSqEivBMA1SdRIJalM+PeCqvfMEOHdD7UIG6QmvLgk6nMmoG5AR9QrMATPhI9WDnaiE8NVY2lBALnIdPQ0x/rCSx0=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=vmware.com;
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by BN3PR05MB2467.namprd05.prod.outlook.com (2a01:111:e400:7bb5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.17; Thu, 22 Jul
 2021 17:22:14 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::b5c1:f355:fee4:c23c]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::b5c1:f355:fee4:c23c%5]) with mapi id 15.20.4373.009; Thu, 22 Jul 2021
 17:22:13 +0000
Subject: Re: [PATCH 1/4] drm/vmwgfx: Add support for CursorMob and
 CursorBypass 4
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
References: <20210714041417.221947-1-zackr@vmware.com>
 <676dcb6a-b95d-f29a-f76b-51450fe3998a@suse.de>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <4a772e31-962f-32a4-7417-a9f664c2784a@vmware.com>
Date: Thu, 22 Jul 2021 13:22:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <676dcb6a-b95d-f29a-f76b-51450fe3998a@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR01CA0038.prod.exchangelabs.com (2603:10b6:208:23f::7)
 To BN8PR05MB6611.namprd05.prod.outlook.com
 (2603:10b6:408:57::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 MN2PR01CA0038.prod.exchangelabs.com (2603:10b6:208:23f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Thu, 22 Jul 2021 17:22:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7c6c85c-94fa-403b-f934-08d94d353ebb
X-MS-TrafficTypeDiagnostic: BN3PR05MB2467:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR05MB24671CE7A8260596FAE89B90CEE49@BN3PR05MB2467.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1imbBVi0oaAgg8bmM+Gz2y9U+wa8T6UxMJKQ/Mk2hA1lpMuxZXX2OYMza3+b3B8gzSoYYs0BO8Y6MzlYc/dTFEdynenxolIeDJifDw8vlRTqRs3NccHk+Nae/d0PD9gnN5jTzygG7UuKKE8MTOPYSXAU9OF8qBv+25Nztl8A/tvYe5tAKWDnj91i0OBEAtQ8HKxukJD5jSk+A5x1rxrReryEyANGG3CcCAYycTRjfzJ4YKDzY6i7dY5S/Hy7fNY+9B22cxLgr5cYa2kuVX3dXWOtMUf5/2a66/iBex39aNgKmt9Jw2SC+SyU2T6Mb2Hz6psucAGEjG4fjrKYW323b/igvbtVSLq1qpOU5FlFzuU0Atgn2O4ib4JZQHrERBtrRQuygzIUF8ZZ8rSknogSHJEmJpvaIFCnRDTEGnFF82aA9UJUKjEj/4ev0B8ff1GjYvq4EqcuaFhNC3onJKHyn6DR/ErIpg2IlLKUmu+wDWFVtfSHmk3fhRJ7plrjy0HV9uh6cDvOXch/uKB3dJw/YrrsYzWRF0atnxf4u996NtJXquitry/ZIKiadN5sitjNr5JBTh8k6MDgKjL3HnjFCRV5ZCqNBcuvNWVTR0aGWtqslf8fOnQBLRSJTwNz/a0IzD7CRFk4b/brJa320T1wFUEzZ30hp+8SkntbkRNiqdN4Xi5zawwdiK8Zo3nqtLGqbg4KvbNJ2eS0vkFgqe0cJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(316002)(86362001)(478600001)(66946007)(16576012)(956004)(36756003)(66556008)(8676002)(2616005)(6486002)(2906002)(66476007)(186003)(31696002)(38100700002)(5660300002)(8936002)(31686004)(26005)(83380400001)(4326008)(53546011)(107886003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y05pWnoxVHJid1hIWnpaOHNidlBESGk2MnJQbjhwKzlkV05odlVGYzhBZXhw?=
 =?utf-8?B?eXdDZ2FISnZLVEVjb1hGOHBRUUlCOGprSkFNa1haNnVMNS9yWk40Yk9XS28v?=
 =?utf-8?B?YzZiQlgrdThrWlhVYi92bnIwWVJJZHAxUjdlT1hwSHdZbGJPU0Nsa0d4VzNS?=
 =?utf-8?B?bzZEenpIVjZOR0FpbkhHdWk4RjdSRWUyVm1kZTNzTmxWUzY0T1dTbTdqTk5D?=
 =?utf-8?B?bkQxZHhSaUNkanRHb3l3b2tXK0xjV3YvVHA3b2cyNjVUaVNGN2kzVS94Z0Rz?=
 =?utf-8?B?VUlNbUMvaTI5ZWFrcEdjNUZOMElleE5RMzFqRjR6N3JyRGNVVjZITDZNeWhN?=
 =?utf-8?B?MWljWG5hbEFqcWVSQlFJcmZ5L1B3Ukw2L1U2NUZoT2M4cUc1WXdlTTI0SjFm?=
 =?utf-8?B?T0thQ01vKzZIMi9FeWpQQkNsL002cmVETXAvR2g3bHdwZFY5VHZyZVpLRnhF?=
 =?utf-8?B?eURzZkk5Qk03UHlvUXh5RFJyc3grNWhPTGY0R1Zrb1FIYjhNbEwrMDAzYlh4?=
 =?utf-8?B?eTJJdXNFUHZVdUdGZVpsaEhWeERIdkhZWksrMVRMUG5iQUJsMUR3U3FDb1Fa?=
 =?utf-8?B?YkwzV0JoRlNDeEFKWlcydXY0aVF2WTRnY0ZJRnpqZFdJVHJVclBEcGJvTXFh?=
 =?utf-8?B?NlRDWVZoaTAxVGttQVJaempIaGdZSUdCWkExNFl6L1c3UDI2cHArNldFdHgz?=
 =?utf-8?B?b25Qbk5ETUJ2QlVFeTZ5cjZMTkppZUJXaEJXSmVaaTc5QW1pdndNcGJ6RzVP?=
 =?utf-8?B?U2dYZldPNDZJd0FIQWtPMzVrRGd4cDdrRmFsTjU5eVlKZDQ4VVRzUUJOa01p?=
 =?utf-8?B?QzduQ05naldCNm9XWithMUVRQUFaVzRLQmhxUlhLZS9DUTYwTkxUbkhvOERq?=
 =?utf-8?B?WDdaQWI1MjlRNW42VEtyNUJ0aDliQVFYZ0JrbmFhWVpKRVlicTVIRzhoZ2Ns?=
 =?utf-8?B?N3dWaUxWR1Fzbzc1QVdHRjAyd0x4eEFRanNvREtjM1ErUUVKRzVvbUUwVjdN?=
 =?utf-8?B?YkYyQkk3Q213dnZtWTZPaGVBUmFhQ2Z3R1dkYlVaOTRXVVIxcW52WmZGUGwr?=
 =?utf-8?B?UXlIQkR0bEJXVzJYV3piaHdSOCtkMTk0a2k3Z1VEbXE1bVdEWjVhTm90U2dx?=
 =?utf-8?B?c05WOUVRcHZucmVINkVIeS9QeXo4U3VMemJTWHJwSlF1QTJSdTVnVm5XcGVi?=
 =?utf-8?B?M0VsVGx6aWZ3dEgyT1cxOXVGL1BWcUlOVGdvOWV4czRlY0NQUXB0WG5uNDZG?=
 =?utf-8?B?WElmWlR6Y0tPZDlFUnlkQUV6Y3Blb1dhMFFDQ3NkV2pkT3JnM0FvOUFBWjJh?=
 =?utf-8?B?Nys3aERqWXA4L01QVnpxQXIzZi90dlc1UlZYR21ER0VYMmFsU1NnM0lVem15?=
 =?utf-8?B?UHVyelljZTBtZTdFcThpb3JURUVPK0xITVpSVlpub3h4S1VFdk41QzkydEJF?=
 =?utf-8?B?NVNueEI0TzZFSGNOZFE0MktxWGxwRkdVZFlNYTBTRmVaZUpUU1lvcHMzM3Ns?=
 =?utf-8?B?ZXR4ellsVko2ZmV3U0l6aVZkdEpNZ2VqeTdPYXdEWGZnQXVLV3NpOEFRaFFH?=
 =?utf-8?B?eWthN1RzODJkbUdkbkh5Q2lJNERCWWIvZzFNaG4zZWlwOU1TbFFsSTBXbzFk?=
 =?utf-8?B?ZzI0TWNDclQzVlJGcG44M1pFelVFMUlDdVUyOVJmc2pLZjRQemdmSnBVak44?=
 =?utf-8?B?ZnJNa0RLODZ6Q2xmbGY4dkp3QkVvZC9nYzZhdFZtd0RHNVRBZkRQSFR4Nk41?=
 =?utf-8?Q?c8NalFO7XQd026Qg/EzFBQ5MGZoB5O6mLatcV4v?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c6c85c-94fa-403b-f934-08d94d353ebb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 17:22:13.2946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONpIbyIoc+G/mSV51OSbknqom/dWGf9hRhjE8S8jHZtFFU3aSgNKeB4QyX/CPa4MP+KAmfQ29tpgvlgm6Y3N5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR05MB2467
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
Cc: Martin Krastev <krastevm@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/14/21 3:30 AM, Thomas Zimmermann wrote:
>> @@ -301,8 +301,12 @@ static void vmw_print_capabilities2(uint32_t capabilities2)
>>           DRM_INFO("  Grow oTable.\n");
> 
> These macros have been out of fashion for a while. There's drm_info(), drm_warn(), drm_err(), etc as replacements. They also print device information. Applis here and for the rest of the patchset.

Yea, that's messy, I'll go ahead and cleanup some of our logging in v2.

>> +            BUG_ON((*bo)->resource->mem_type != VMW_PL_MOB);
> 
> BUG_ON() crashes the kernel. The prefered way is to use drm_WARN_*() and return.

This one is really an assert. This should never happen, I'm not sure if it's worth even testing for this because the driver is broken if that happens.

> That's something like page-flipping with alternating BO's and shadow buffering?
> 
> You really want a cursor plane to hold this information.
> 
> 
> I briefly looked through vmwgfx and it has all these fail-able code in its atomic-update path. The patches here only make things worse. With cursor planes, you can do all the preparation in atomic_check and prepare_fb, and store the
> intermediate state/mappings/etc in the plane state.
> 
> The ast driver started with a design like this one here and then we moved it to cursor planes. Ast has now none of the mentioned problems. Relevant code is at [1][2].

Yea, I was hoping to the the cursor mob's first and then go back and refactor the error paths for all cursor modes. I do agree that it's not the cleanest approach because it leaves us in a bit broken state until the refactor lands. I'll take out the cursor mob change from v2 of this patchset to give Martin some time to clean up the patch a bit. I'll probably send that out as a separate "cursor mob and atomic errors refactor/fixes" patchset later.
Thanks for the review!

z
