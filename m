Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8103A59E3
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jun 2021 19:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA7C89E5B;
	Sun, 13 Jun 2021 17:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2066.outbound.protection.outlook.com [40.107.102.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CD889E5A
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jun 2021 17:37:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lT2UxThKMB8KP3fC9KoWwn2lethqwQ63I21pVpodkRogJb6mCeDYv7gEtd7ndQYx8G+GRdmUH+8GRfPy3AV1sf7rGeSksRP78Yz95TuByRAG6yjEirmpJ5Nihtko9kA2+496MoyPUGYI14nIczMrZ6qdxEgQKtXlCOFsyLB90obaE28qMyWPHKm6NA3NfKpKuKLYOjnIoQnFZDJBBa6Qg2X94CO8gKsKOJdv9lNWjYk3D8WmgFyHUrHCM3ycOQA70v0fSjjAz4Yzypy+6jc2Za+Jwea/lyaKd4lmDyT/jqYMH2DskC89LuDPz6K1jO2wM+twNdcphExomggb/PdqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SHt6liq72VEY8yYNhFIgXybf2ptK/ydCLTwuDisxPY=;
 b=VZwsXVjbepAHzd3PpXDzHfVS6NYSfVFpw8h5KEtApAEJXjlZ7DVXS+3zbgSz78wvfD6cNItkvARLtOq+WntX1k1XIDMX+tOJAHoL+r2iklWvLLLZKFjwd+sVq42PqSYf8CnCXBUhyGiqZxb2yi4bBg4XPYbm+NlCyue+rHZ5+AfMtS2B/mQathgcaP8NmUeRkBZyA7a2I1gUygi6tl45NSf7aCp6pc3ioY/me84cNp1ywsRqrtB0g9QFQ8A5mhVKryyNNRiEf5bo4ue/k99gwinTlRnNYwPSib0PzAERpx8VzLZPZ7/hJX4hnAMeIjwaAY/pts4g/F767jpia+fLIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SHt6liq72VEY8yYNhFIgXybf2ptK/ydCLTwuDisxPY=;
 b=PlupfKxYm4AzCD4y8amyTU6jVXSC1cx/o/R2lvnAJ0ax4M7kQI0JaBtNqYEaGz0sA/0lttRNBth+3qYEA9pYn0CcvpImMv58U5E/0XZ75d/Gl/sVVXT1UK6+clp5vDwuWQQSqZgOyLPubSpbt/cuqDmUYKR9VXUyWEP0lcx5Sts=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6496.namprd05.prod.outlook.com (2603:10b6:208:da::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.13; Sun, 13 Jun
 2021 17:37:22 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::45fe:a746:21e9:e8fc]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::45fe:a746:21e9:e8fc%6]) with mapi id 15.20.4242.014; Sun, 13 Jun 2021
 17:37:22 +0000
Subject: Re: Peculiarity in vmwgfx_mob.c
To: Martin Krastev <krastevm@vmware.com>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>
References: <MN2PR05MB6512A648599E1F07762B9B8DAE329@MN2PR05MB6512.namprd05.prod.outlook.com>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <6f5c40fb-2bba-7f42-0279-e1077ffc426b@vmware.com>
Date: Sun, 13 Jun 2021 13:37:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <MN2PR05MB6512A648599E1F07762B9B8DAE329@MN2PR05MB6512.namprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: BL1PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::11) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 BL1PR13CA0216.namprd13.prod.outlook.com (2603:10b6:208:2bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend
 Transport; Sun, 13 Jun 2021 17:37:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8c45057-171f-4629-d095-08d92e91e662
X-MS-TrafficTypeDiagnostic: MN2PR05MB6496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR05MB6496802369081B44E37A1879CE329@MN2PR05MB6496.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5gFS9j5OuN6I+zbgs7TyF3JwPF89y9qGZUkpGJDNCuhiAlgZso52e4eIoQQ3cgmU0OAi2m8c64Gz3ATHoPvDddemgBnt5uO6OTBRTFBKLg5ENLpoo+Od6M4pzCIzRy0RtW4m6TYf93i+Hc9FGeM7mx0h2EeG2nKeSr8xV47ZL0UjMlRvem/Eq6IKsYh2G2pa+Jhx2pZImObOH54Z3MCRGjwCB37G+SwLzE/iEHL2OCcUpVMd9WDwL20y0tMezlFCAb8Q+SrCL6ZT5EBCGlaE5iKFlEf6CLzLBYVsuWlKTAyWsjJonOoWWFYgEUP9sbVCNPpTTP6F9fLyQXkqqwHBnUnrGIBqquM3CKEHygCm/2gahGJSpX+ArpIDA74Yz2MYGqLRPbzFPxWJcajQZ0o5JDpQTkRaFVmPXTYqQfVC+cr+d8XHeJVizwUriztmsOegZa9VmPbIfWe1utzmeFX9mUv/DSjlrM0rbbfZo3WtoZsvXslQlpY1w+OYO7NOlLhOPjd51u/09rA+Y0QQ6W6+4deoa+kw5NRfm3ZIIlR9f+otC7QsSwJyq5pas3uiS0/z66/lIoienNvEhDR8d5bjaNqitS0E3A3VExsU6btRJMqh6853EJMAwYtBNCpGtw8KM3+KoKKZToPK2BqCj0gPNzJUZ5r6hH1dSDV+3yvF1RTr0c/cY5SlpRdtszeA6HQ6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(2906002)(66946007)(16526019)(4001150100001)(83380400001)(186003)(31696002)(8936002)(8676002)(53546011)(956004)(2616005)(5660300002)(316002)(66574015)(31686004)(86362001)(110136005)(66556008)(16576012)(36756003)(6486002)(478600001)(38100700002)(26005)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1lMZVROMFlSZU1wSXVKKy9YTVUzN2NBN2luR2NSZG9HRGVOUXNBd1hNUWVF?=
 =?utf-8?B?bGc0a1QyMUo3OGFGSTRGRnpkZnplUS9hZEFnV1VBdkZYUFpkL09jTy93eGVB?=
 =?utf-8?B?TmZBa0swUlNOczFxVXRJMndMZ3JkSEJ3KzhkZHVOdVc1ZVRoQlZ0TnJqMnhu?=
 =?utf-8?B?aE1aelI0U1V5L0tNZ3EwUUk1ZjJieURjUFNldHBhRmhDVUZIVUs3TTkwSEVW?=
 =?utf-8?B?UmthelB5eWpCbFExemd5UWt4VTBsRCtKdkxJM2VSK1JqcVJCRHk3T0RNTVV5?=
 =?utf-8?B?bWtBYnhCVFJPdVpPSGhVL0poUTBIeWZpaitxYWNsZU9ibXVOMzdMcjZVdG9G?=
 =?utf-8?B?aFRHdFFnRm5NbzArMUdRV3BSS2Jrc3pucUx4ZW1wNGk0RFNNWGltV2R0ZERO?=
 =?utf-8?B?QlJPZWllc2pQdFc2Y2loN21tc2p2a2xLVGkwcGJZQVlNaUg4ci9nMW9aVjRF?=
 =?utf-8?B?eUFmOTN6NTNzWFlWaTJPczFmbkFydC9kQm5aS1pQV1BvS2xuMU1kNXNkL3ll?=
 =?utf-8?B?MytCQ1JzVk00MUNRWjQyL0NFbGY5dWxGcGc5a1ROR1pDeXJMWXV4QjhFdmZt?=
 =?utf-8?B?Z3V5TTNmL1dEWmF2TTBwTTJFL3hUbzJUVFh6dHpEb3NqaXB0MGx6Z1djbTlm?=
 =?utf-8?B?eWZNejJPMXYyNlZyOEhVU3g5WTdtaXpnTzdTN1ZSZm9hM3U3Wm0wd3NDaE5H?=
 =?utf-8?B?RWdVbnUwUXV6TWExSVVKVWd3V3JGejg4aXVrYXlUTzFRaElPRVRMTHVXb2ZO?=
 =?utf-8?B?Z3BhNW5VakptVUtJZG5IcWovQWxqR3lpMVA2YWlrZjdYa0NFWG11MHNvendo?=
 =?utf-8?B?M1Vaa3c4QjFETlhUK0xPWG4zRTZEdHR4K1FEYmV4S1huR0FuMHlwaFJWTkJx?=
 =?utf-8?B?THNUdTdQck53VFZTSmxFdCtFVHd0RHhFWXpET1RwTUlJbzZ3bmNucktZZ09L?=
 =?utf-8?B?eWczYnRoODAzNmFuTVlLcVpobEFDOG9EalBFU0VtT1Rod1NVdWp0S2sxTVJS?=
 =?utf-8?B?amxWRmZKbkJ5ZUhFNjVhN0JyRGlzZFMzTWM0NkdiU0E2bEsxTSt2UDBUMzFH?=
 =?utf-8?B?ZjJ1eDN6VUJnaEJzdVZWVzZua3dyYkJPUTY0SWw3a3N4TTNPMFpjdnh3R0Yy?=
 =?utf-8?B?VDhmTzlFa0FwQXZOU1V1d0FjeUdUclZJajErcW9oL1pFUE9HR3l4RXVKVGV0?=
 =?utf-8?B?Z1FWRGQ4Vm9iQjkrbzdrTmNNWkxvU3dBbHJVQjhLK0pVOGZyNld3RVRsU0JO?=
 =?utf-8?B?N1RFOVlaR2I0elRjWTMwc0FHeDNVRklKUnYrNnhRZmdxb1FVS3VNT0VNQ05v?=
 =?utf-8?B?Q3ozL0Rkc0FiTWdrVXh2elNWQVZWakVPcHBYaWVPeXJybmxCK1pObnRpa2cx?=
 =?utf-8?B?K294MTQ4N2YvcnNNRGZ4SU11RVNHOG1PMXNsTllNMW1UUzlrK1E0VEgxUE1p?=
 =?utf-8?B?RTJLQUR3aWlSd0pWMTFWaUFqWGs0Vk9Ya0xxcDJSQVpsY1FlL2dPRzJheFVh?=
 =?utf-8?B?aXUwajJFNndWMmdTdElkSTNBdUFKd1JtRVFYQmJxZ0NyZ3lMMml2eXRYdnpv?=
 =?utf-8?B?RUt6VUdsdGRZT1dCRkVXTFRPR044a3Y4NGowNmRVY3hoa3dhY1Jrb1g0cHBk?=
 =?utf-8?B?NnVpMzU1S3gwVHRNKzdyd21STHR6MUZvSVJJeUVLMnZIRHJUUnpaRUI0TU84?=
 =?utf-8?B?LzByZWc4Z2RWZyt1OGFIR3NiU1pYY1hQeGFVN011THZRV1pHamIyRStSTGN1?=
 =?utf-8?Q?6yZX8wzwxh3r4iCoZL77UBacgLIjvh9tB2eBBkL?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c45057-171f-4629-d095-08d92e91e662
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2021 17:37:22.2255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTr+Kuf6SsWobdxjrrZNVZYDbuM87C/VAkC538dOfNWfSGJVnfM4hrsRxMYDv4v6SSo8RiZtbmGbZfzhtEzgUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6496
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

On 6/13/21 6:08 AM, Martin Krastev wrote:
> Hey, Zack
> 
> Looking at vmw_otable_batch_takedown() in vmwgfx-next circa 467343468d53 I've noticed something puzzling. Here's the current state of the fn:
> 
> d80efd5cb3dec (Thomas Hellstrom      2015-08-10 10:39:35 -0700 338) static void vmw_otable_batch_takedown(struct vmw_private *dev_priv,
> d80efd5cb3dec (Thomas Hellstrom      2015-08-10 10:39:35 -0700 339)                            struct vmw_otable_batch *batch)
> 3530bdc35e99c (Thomas Hellstrom      2012-11-21 10:49:52 +0100 340) {
> 3530bdc35e99c (Thomas Hellstrom      2012-11-21 10:49:52 +0100 341)     SVGAOTableType i;
> d80efd5cb3dec (Thomas Hellstrom      2015-08-10 10:39:35 -0700 342)     struct ttm_buffer_object *bo = batch->otable_bo;
> 3530bdc35e99c (Thomas Hellstrom      2012-11-21 10:49:52 +0100 343)     int ret;
> 3530bdc35e99c (Thomas Hellstrom      2012-11-21 10:49:52 +0100 344)
> d80efd5cb3dec (Thomas Hellstrom      2015-08-10 10:39:35 -0700 345)     for (i = 0; i < batch->num_otables; ++i)
> d80efd5cb3dec (Thomas Hellstrom      2015-08-10 10:39:35 -0700 346)             if (batch->otables[i].enabled)
> d80efd5cb3dec (Thomas Hellstrom      2015-08-10 10:39:35 -0700 347)                     vmw_takedown_otable_base(dev_priv, i,
> d80efd5cb3dec (Thomas Hellstrom      2015-08-10 10:39:35 -0700 348)                                              &batch->otables[i]);
> 3530bdc35e99c (Thomas Hellstrom      2012-11-21 10:49:52 +0100 349)
> dfd5e50ea43ca (Christian König       2016-04-06 11:12:03 +0200 350)     ret = ttm_bo_reserve(bo, false, true, NULL);
> 3530bdc35e99c (Thomas Hellstrom      2012-11-21 10:49:52 +0100 351)     BUG_ON(ret != 0);
> 3530bdc35e99c (Thomas Hellstrom      2012-11-21 10:49:52 +0100 352)
> e9431ea5076a9 (Thomas Hellstrom      2018-06-19 15:33:53 +0200 353)     vmw_bo_fence_single(bo, NULL);
> 2ef4fb92363c4 (Zack Rusin            2021-03-22 13:04:11 -0400 354)     ttm_bo_unpin(bo);
> 3530bdc35e99c (Thomas Hellstrom      2012-11-21 10:49:52 +0100 355)     ttm_bo_unreserve(bo);
> 3530bdc35e99c (Thomas Hellstrom      2012-11-21 10:49:52 +0100 356)
> d1a73c641afd2 (Zack Rusin            2021-01-14 18:38:16 -0500 357)     ttm_bo_unpin(batch->otable_bo);
> 6034d9d48e62a (Thomas Zimmermann     2019-01-25 12:02:09 +0100 358)     ttm_bo_put(batch->otable_bo);
> 6034d9d48e62a (Thomas Zimmermann     2019-01-25 12:02:09 +0100 359)     batch->otable_bo = NULL;
> 3530bdc35e99c (Thomas Hellstrom      2012-11-21 10:49:52 +0100 360) }
> 
> Line 357 does a repeat unpinning of the batch->otable_bo, which we already unpinned on line 354.
> 
> But according to 2ef4fb92363c4 line 357 should not look like that!
> 
> @@ -341,9 +351,9 @@ static void vmw_otable_batch_takedown(struct vmw_private *dev_priv,
>          BUG_ON(ret != 0);
>   
>          vmw_bo_fence_single(bo, NULL);
> +       ttm_bo_unpin(bo);
>          ttm_bo_unreserve(bo);
>   
> -       ttm_bo_unpin(batch->otable_bo);
>          ttm_bo_put(batch->otable_bo);
>          batch->otable_bo = NULL;
>   }
> 
> 
> Can you confirm you're seeing what I'm seeing?

Great catch Martin. Yes, this looks like a bad merge that I missed. It looks like it was introduced in:
68a32ba14177 ("Merge tag 'drm-next-2021-04-28' of git://anongit.freedesktop.org/drm/drm")

So, what most likely has happened was that the change:
2ef4fb92363c ("drm/vmwgfx: Make sure bo's are unpinned before putting them back")
probably conflicted with something in either drm-misc-next, Dave's tree or Linus' tree and it was manually resolved by the givens tree's maintainers during the merge and accidentally reintroduced the code that patch was fixing.

I don't know of an automatic way of monitoring for those types of issues, maybe Daniel or Dave know of something. I'll just have to pay a little more attention to what goes in Linus' tree in the future.

z
