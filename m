Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F251BD7F9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 11:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFDF89C97;
	Wed, 29 Apr 2020 09:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD18E89C97
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 09:11:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl6NWBfuYs7/w74QgPRWwOicT8ddnzgERtGFLHBPHd5HXLOZacrfAA3X5dkRmpHJdg0lk5EAvmuypzl8FIFHeEeP7LiPFYyLAYgXfSU7YC3pUYSUyRzqXHTVXsxGHcX21YnPABEFL1MwMdytgVwaN7iRxPjSsOskvhDOQLnzKTkzzofHE6Wa4LwORVQgJy43MIDXRWj5oZDSpb4WgfRNw3X6ARoqxvbpnCZlGvYsCXD+kEDSeRrqb1bug1Ie9oEWVfcyW0LlX1Yu0lrX4rkG0ueMnfNXzi1aqmOeLAF5af2VTLaA4qg+mlm2JlxfTrvhuzy7zY91Zi5iKilC8Kj27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRk1F9Q0L3SVa/MLXto56/8CnL30QmAaRZHwrSljUPc=;
 b=WFKtL4lQ8s37wS8qlPcvJVHXaOpn8OlnhvaRX5ctaUhIZVkNWsN3Yyf2udkO6G4zh5mQlMvdBhiouKp7dIKdXXnNuMSWhgu5S9BRDKvC6yKD3FdMs/vVBFi5UheeKqhZGO/d39NVpD7E020mAQXbKPQKve7edFxVHWkbgXddN8c+w9sZfC/cV5kPNl3KYKdUrNYkqhXmTeX4aRyjOOpGGoB0gGuWnaW0fkt11kF72hsPa6ae8Cphk5n8TDle4VTL62+9KkR3/kjE5M3O9o3SkW60jANfiT5UIAZvPzquPmRQcmNBr+74s4WmixAwTSsxyUgmZiIkUWXa114nR/9+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRk1F9Q0L3SVa/MLXto56/8CnL30QmAaRZHwrSljUPc=;
 b=gr3kZsMIG+NLBsPCOEnu9DP6zvQDY+KNzAxI998OIG/pq0AB0uj4jCjI6hlnO3Za1LLXq7S3vjEs09rTQ7E/zAGldxJLHvsa9iRgXbGFmCRTtUjHBKQo3+HqNKN3BFI5iUZCgKEZwurSkV6iRXIa2foFk568huLDA/EfNEpV5DE=
Authentication-Results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Wed, 29 Apr
 2020 09:11:26 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2958.020; Wed, 29 Apr 2020
 09:11:26 +0000
Subject: Re: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and
 top-down placement
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20200422144055.27801-1-tzimmermann@suse.de>
 <20200422144055.27801-3-tzimmermann@suse.de>
 <20200423111808.fbh23br7jrkte3ih@sirius.home.kraxel.org>
 <da7bb4d1-852e-6372-cc2a-938561220483@suse.de>
 <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
 <b9315d4b-0f3e-712b-8a26-0ed5e3ac6f68@suse.de>
 <20200424093849.tiyukod37qeztaxb@sirius.home.kraxel.org>
 <2cbafd95-22cf-5471-9ee4-807b152828ec@suse.de>
 <20200429072500.bp5qkquyc2hc2emp@sirius.home.kraxel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <78c34d35-5760-8f69-f98c-bc34d52fbfc7@amd.com>
Date: Wed, 29 Apr 2020 11:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200429072500.bp5qkquyc2hc2emp@sirius.home.kraxel.org>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0065.eurprd07.prod.outlook.com
 (2603:10a6:207:4::23) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0065.eurprd07.prod.outlook.com (2603:10a6:207:4::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.10 via Frontend Transport; Wed, 29 Apr 2020 09:11:25 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 33fb4117-bd31-495d-bea2-08d7ec1d4b96
X-MS-TrafficTypeDiagnostic: DM6PR12MB3962:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3962A067B3E8EC06D9A55D4A83AD0@DM6PR12MB3962.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03883BD916
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(478600001)(8936002)(31686004)(6666004)(186003)(316002)(2616005)(110136005)(86362001)(52116002)(66556008)(31696002)(2906002)(16526019)(36756003)(8676002)(6486002)(66946007)(4326008)(66476007)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pT6a/Jnae1muLfy1WTEIXtJdJRaBcF7yIhfHaZ6uEU4jOsF3gaigaorBMAYW9lvXyY04GAC2mBvdZQeFLBYEfqr+c9J5VwcKpj68RFG4rGixA4YPotyRHdbNnlxdx6ZlQhS33ls2Y3ejxmxEiUlFRBTwvlAxtRM8fbLDInWO8pHRcGbToDjZEjcThFaGcGt58xqHC/91EJK/xcPk63MFlxxTiPlguMkVodP9403JN3KISIcSAho8Hs1ACmDkb70ojig5VC+8md10Txu2Deo61RSdfEcVwjKE6SVzM8B3SIkrohRXlrgVIJAsW6/vEfmn9SMxhk6uwr7W1k7ujraVm0spZkAmyFx+3HvIYORzZfI7WCPQtBxB5d5dPcTl1egm57sFmqUk9FNYTL6UX9Fm48gJtrVvKYBFnzrTcf2v7wiGT3FyGgxq+OLSruzctK0k
X-MS-Exchange-AntiSpam-MessageData: 55voggnzf8CckOxgeKIhDjX+ZMgC/87XI1oZOSdb0+b/pVxY7tRee/s7piEaSTbR8OHqt8S2miqXSE31uxpP7jFeVyrJonmKAcdZR0kogb+pgScmIeV2X0CCUMUCEolTSsjlkJv1byU6O+tbeT88wztLDafB5kMRQRx40r9ZdWKiYZwHba7c9CpI/xMZEMVK/kQZt1s1ZpmjrxGFejm2iHo1y0j9EL8c6BAuAACSqmGj5WHCTH0vbpBn8EEuaqOMaNFFDywi2F/ijq4h1oZVt6+umOvSBz25uDazYjg6mBpCdRyRTR9I10XzaEw/W/tdOcvBp4yIX3pzl+tBJIJM11xAdZF0/R/eL3IibUrL2V8g55jkV3PfRfV3MzhXJLKji1RyV2vtTJPeMvctYQmAN0ZtKzNF6Z27t91OGypB+HBlASY7C+782QGGlBgqP3eaQ63SrGhbtushYMAHYmMJQz9oL2DaJpsMCeOdRxDiONE2I2S1gpTC7WQ1k2S0oWPLNQBSLIsfQTxI9eZOaDJdq6CVNhb1iF9NK8QbwEYac0ZNiSqEYkgQyH0mTYah0dTOLYrJQ1K3jOWvG3iBZ7/Jy+hXC2N1K8pkle2HqBWkIR+eHdIvBxhLy/hfjGE8G3pSXFjvIfdJYA9rNPPiCqqe+AXiCit+eSdwgKmVmTSa0gLAUFyoLHM3oK92Ctpq36SFjZjA1KkYRWTJ7DmdAczk8lnpJl9OYdPrSV4oLl6qwpZOTKbLXnz43o2HcdgQ+ZZPwvHc184By1+cDndw9ssP0SRRnCRoTxnN1OsZDYaBITSx2Z6iaN37fRKt2jD1LmN/7MDAcxx9vyw7XkoWsiOXWSPWXcWetm2rs4EjXyefsi4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fb4117-bd31-495d-bea2-08d7ec1d4b96
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 09:11:26.5628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Y+u31n6GcogCGIsNED/nKpR0N0Sg39Rh3j8fl6VkHRoGKJz0Hvb4QGITAaZa31V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3962
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.04.20 um 09:25 schrieb Gerd Hoffmann:
>    Hi,
>
>> It's not that easy. Current cursors n ast are statically allocated. As
>> soon as you add dynamic cursors into the mix, you'd get OOMs.
> Well, with the split you can simply allocate dynamic cursors with
> top-bottom to keep them out of the way.  It's not 100% perfect, the area
> where the cursors are allocated from has a bit less free vram, so the
> split effectively isn't 50/50 but more like 49/51.  But hey, still alot
> better than what we have today.
>
> With two static cursors you can allocate one from TT_VRAM and one from
> TT_PRIV so the remaining free vram is the same in both regions.
>
>> If the framebuffer BO goes into VRAM and the cursor BO goes into PRIV,
>> pinning the next framebuffer BO during a pageflip would send it to
>> VRAM.
> Oh, seems my idea outline was a bit to short.  The plan is *not* to
> alternate between VRAM and PRIV on allocations.  The plan is to add both
> PRIV and VRAM to the placement array when pinning the framebuffer.
>
> ttm can simply place the framebuffers as it pleases and where it wants.
> Due to the split it can't do a big blocking allocation in the middle
> of vram though.

There is an easier and most likely less CPU intense way of doing this.

All you need to do is to make allocations which are below halve of your 
address space allocate from the beginning of a hole and if they are 
above halve of the address space from the end of a hole.

This way you should always keep the largest hole in the middle.

This can be done with another flag to drm_mm and would most likely would 
be a nice addition to other drivers as well.

Regards,
Christian.

>
> If you are going to pageflip you should have one framebuffer already
> pinned (the one currently displayed).  If that happens to live TT_VRAM
> ttm should be able to make room in TT_PRIV to pin the new framebuffer
> you want pageflip to, and visa-versa.
>
> ttm will only evict unpinned BOs if needed, when running with smaller
> framebuffers ttm will happily keep more than two framebuffers in vram.
> All fully automatic without vram helpers having to pay much attention
> to the allocation strategy.
>
>> I'm preparing v2 of this patch set. It'll get static cursors out of the
>> way and make the feature opt-in.
> I think with the split model there is no need to make that optional.
>
> cheers,
>    Gerd
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
