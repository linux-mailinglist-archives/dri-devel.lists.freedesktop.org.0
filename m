Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 822E62789CC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 15:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9913B6EB29;
	Fri, 25 Sep 2020 13:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B276EB29
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 13:40:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeuDw/Jyhd6EEqEnWqyplYYu1Bbcs8nTeZt5jBvi/0j2FV45PzuJN2z1dKxsBK7BS8rzm8ZxN+yR0NSEybDRo/7/grl68V3ei+ST3IcrafenFNBYT+hQEbKdLprHLx926p8K5klVmtysmo8Nb2CXXNBenIa71WA97/7ACbpDKQx/7F3eiPSbqdWbMtOs20sDuSDwzUDZAodIW9mnzcjgyktlW9KMHqKZe+bjun0EDEEgbCD+fMp9i3PnPDERNKs0FIX38hJOwEoFQh2cLfc0lNORAu7M3nM86nf4EZgejIYSXJpMolO6sRP7QCUxR1/oYq5ijvOD4SR7+W3Dw9H4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl2iFiQkJgqzuys/aTsypG0WrjtCktkOPrCzeNDYWLo=;
 b=VORS14twO8E5uLlZZQ9l6WEz37VvhzRxoU12bYTqQF8YQlw1VTk/pKQ/rsn/798j7Rz5hQmPOy+e9NTcVgfsKXR7AjDj+CGev4JJApAFYLA7yNtZq8nB3lsjdsA+s0974+zFTsdzZI1bXiQvfDBv5zgzoUkpr8p/PnPjULnDpzH35E2gJ0hsulo50OmnrJ7B2x6v1ToNufW8VgCZLQiab7URrKTowFWTOPYjA59OJvuiIzVO5uwegwBS5W74YWKws7xCwKYbDRX8MfYVYas57A6MarTDBw8Ua7Kph9L6bszXGYPWSGgdjmSfgZvwvTngnFIBg8tj9fk4/07y4vA7Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl2iFiQkJgqzuys/aTsypG0WrjtCktkOPrCzeNDYWLo=;
 b=gWD5W8Bs18ERxaZhYzCMptjh1E6p+tFBFnjAtIXK1Al/O+C1ScId6qBVYUM/ch/yl+3R25p9riV6pXfA8iu8VqEmNty5aAFZrpbTWnQphS+fxtgBoxN1vZGay/QA6SaPy+x1umRG8B2TRjr1t61iO9q/8SmdpuYBeDg7i0szI3s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Fri, 25 Sep
 2020 13:40:38 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Fri, 25 Sep 2020
 13:40:37 +0000
Subject: Re: [PATCH 37/45] drm/ttm: add a helper to allocate a temp tt for
 copies.
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-38-airlied@gmail.com>
 <39ca897a-e7f2-93c8-e844-449ccbfe6041@amd.com>
 <CAPM=9tw6a6E+KZV7LceHUj=SHFaTe9M+KjjYgouhdX0gkDsuzw@mail.gmail.com>
 <4b16b60d-228d-164d-396f-f8344fd67674@amd.com>
 <CAKMK7uF0CnQDCnCVLL2dReh0Tmo=gou=XLvAihq7VVihz0ysBg@mail.gmail.com>
 <CAKMK7uGMNh=uFHnBdk2B3A5VGTHFzaX65Bw4-3cz5RB717pwMw@mail.gmail.com>
 <f299a276-53b4-4eb1-416d-3aa56407ebdb@amd.com>
 <CAKMK7uH+rupecO8uSvK3MzJ8OpDsFMhm0w7e_-9kzdiK-k+Dvg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <94a603bf-7a91-dc6f-9ba9-2561ab8e6f64@amd.com>
Date: Fri, 25 Sep 2020 15:40:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uH+rupecO8uSvK3MzJ8OpDsFMhm0w7e_-9kzdiK-k+Dvg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR05CA0079.eurprd05.prod.outlook.com
 (2603:10a6:208:136::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0079.eurprd05.prod.outlook.com (2603:10a6:208:136::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Fri, 25 Sep 2020 13:40:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bed5f3a4-998e-41ee-72e1-08d86158960f
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4899A76161582F05E0DFC09083360@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kMMc9HWVxC/iA3uG7K0EJWveoZEKTz1JfvJmeoB/+lyoO2LuUzTHDg0mGclRvLQiFjokrelKKMLI4RzKcwCfWO5TDPw6MWC6FDXpmXL+X49TB1UKvq8a9DfmpG5yptpK5VTgWFlsXTgNUGW8KpjWnT5scZAyhbv2Qk23IfcUva/H+oBR7VpbT/Z6w8WW9/0F4u3vveV6SqbDWvQ6g1g7EY1CEVzeQCFus4CIfc9ego13RzfN5g/mkqrKwRppqAjvttCbSD733F3zBya+oX4zZ2wvw+Gxnb87Txk5cbzzYDOsTQ12hTegDQcGueLZR4RthA2xduaQ2GyyD2pvXQ7hqBqVj4j9a91qdR3JsyA+Lvfn32F1G2Mc3qTPl/82CRd9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(66476007)(316002)(66556008)(8936002)(8676002)(6666004)(86362001)(52116002)(6916009)(2906002)(83380400001)(16526019)(5660300002)(36756003)(31686004)(186003)(31696002)(6486002)(54906003)(478600001)(66946007)(4326008)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: pw9HGzrnGrQB/9oa73KFJHMOC66fUy9bzusHTklQBz4pF+LFCZrzMBCFazlKCou3Yh2MEKfkLZqzd4Yxp7htTvfPnRPHokRURDSfv3gycmEPsnpAeuLejAXT1UOlHu24yYBk2BEIryMQVvH5SMaqaFQtk0vd/DZlIjnjUMn5hVVTAqAvvBWTygt5FAVv7ekkBWOJxbG7XqSdGpMMwGXBEWa9fRhfZGqvzPqDd3t64JXQ88oaOjGx/Kih/132m2qx5b5Fz1ZujohqHcBfxw+L0inKu404v6Axm0pTG3sGmPOj0rGqJaA7zF6J5hUwPAySCCvMiPgBPW9QKQL+ZHNbzsRzHLQhdIlWaVlg0+CBXNHG7FGfmRUz9xpFqsuR6Q+x8rUa58oXE6Tzu2/arQPUsPpnLTuD1+uOhhyFTbBGKXGZG7LpfiIrihUTw59PnVvqrd4MrHr00uvpWkbgzW905iQXJ6MHyD7I+m/nr0xsyGS6oxq0SIAO6jubQe4jFns4a0cD7AUoHwAArtQ9qrVvQUWme/LINKnL9y3oME4nLSozTNJ3KEL585uzxI8HbuYJtwZCXkK+UvbVyVCl04cLg2v9Ccfc0pNy7MGmY/o3/uj3Kiduzvkf4hcACIlkZpVfYEQ/oh2zFbuuFSertXinC64ONv17zTjM9vxtN7IrcrQ42ZcdlDP0RolHt+i/wzlfzYv4qgFmbQXsPnwMbscLAw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed5f3a4-998e-41ee-72e1-08d86158960f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 13:40:37.8364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGR+IEHUnn1Th2Wo712VN2VuGCFbYbbNgSEbJUrL9FzItRlzHXCpHBgWGJOLnAao
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.09.20 um 15:17 schrieb Daniel Vetter:
> [SNIP]
>> Eviction is not a problem because the driver gets asked where to put an
>> evicted BO and then TTM does all the moving.
> Hm I guess then I don't quite get where you see the ping-pong
> happening, I thought that only happens for evicting stuff.

No, eviction is the nice case. One step after another.

E.g. from VRAM to GTT, then from GTT to SYSTEM and then eventually 
swapped out.

> But hey not much actual working experience with ttm over here, I'm just reading
> :-) I thought the issue is that ttm wants to evict from $something to
> SYSTEM, and to do that the driver first needs to set a GTT mapping for
> the SYSTEM ttm_resource allocation, so that it can use the
> blitter/sdma engine or whatever to move the data over. But for
> swap-in/validation I'm confused how you can end up with the "wrong"
> placement, that feels like a driver bug.

The problem happens in the other direction and always directly triggered 
by the driver.

> How exactly can you get into a situation with validation where ttm
> gives you SYSTEM, but not GTT and the driver has to fix that up? I'm
> not really following I think, I guess there's something obvious I'm
> missing.

For example a buffer which was evicted to SYSTEM needs to be moved back 
directly to VRAM.

Or we want to evacuate all buffers from VRAM to SYSTEM because of 
hibernation.

etc....

>>>> Or should we instead move the entire eviction logic out from ttm into
>>>> drivers, building it up from helpers?
>> I've been playing with that thought for a while as well, but then
>> decided against it.
>>
>> The main problem I see is that we sometimes need to evict things from
>> other drivers.
>>
>> E.g. when we overcommitted system memory and move things to swap for
>> example.
> Hm yeah ttm has that limit to avoid stepping into the shrinker,
> directly calling into another driver to keep within the limit while
> ignoring that there's other memory users and caches out there still
> feels wrong, it's kinda a parallel world vs shrinker callbacks. And
> there's nothing stopping you from doing the SYSTEM->SWAP movement from
> a shrinker callback with the locking rules we've established around
> dma_resv (just needs to be a trylock).
>
> So feels a bit backwards if we design ttm eviction around this part of it ...

Ok, that's a good point. Need to think about that a bit more then.

>>>> Then drivers which need gtt for
>>>> moving stuff out of vram can do that right away. Also, this would
>>>> allow us to implement very fancy eviction algorithms like all the
>>>> nonsense we're doing in i915 for gtt handling on gen2/3 (but I really
>>>> hope that never ever becomes a thing again in future gpus, so this is
>>>> maybe more a what-if kind of thing). Not sure how that would look
>>>> like, maybe a special validate function which takes a ttm_resource the
>>>> driver already found (through evicting stuff or whatever) and then ttm
>>>> just does the move and book-keeping and everything. And drivers would
>>>> at first only call validate without allowing any eviction. Ofc anyone
>>>> without special needs could use the standard eviction function that
>>>> validate already has.
>>> Spinning this a bit more, we could have different default eviction
>>> functions with this, e.g. so all the drivers that need gtt mapping for
>>> moving stuff around can share that code, but with specific&flat
>>> control flow instead of lots of ping-ping. And drivers that don't need
>>> gtt mapping (like i915, we just need dma_map_sg which we assume works
>>> always, or something from the ttm dma page pool, which really always
>>> works) can then use something simpler that's completely flat.
>> Ok you need to explain a bit more what exactly the problem with the GTT
>> eviction is here :)
> So the full set of limitations are
> - range limits
> - power-of-two alignement of start
> - some other (smaller) power of two alignment for size (lol)
> - "color", i.e. different caching modes needs at least one page of
> empty space in-between
>
> Stuffing all that into a generic eviction logic is imo silly. On top
> of that we have the eviction collector where we scan the entire thing
> until we've built up a sufficiently big hole, then evict just these
> buffers. If we don't do this then pretty much any big buffer with
> constraints results in the entire GTT getting evicted. Again something
> that's only worth it if you have ridiculous placement constraints like
> these old intel chips. gen2/3 in i915.ko is maybe a bit extreme, but
> having the driver in control of the eviction code feels like a much
> better design than ttm inflicting a one-size-fits-all on everyone. Ofc
> with defaults and building blocks and all that.

Yeah, that makes a lot of sense.

Christian.

> -Daniel
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
