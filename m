Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13482E9B1B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 17:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C81E6E03D;
	Mon,  4 Jan 2021 16:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114FC6E039;
 Mon,  4 Jan 2021 16:33:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFgz1ENjZpwD46kgXjXa+mY1kBTceJlaF/UFFi2xOaRakqXyHZEvirMGp4WK2acYnNJBbGwh8KcAvp4D1A6qEm0DZOkdUlnVrKcGX508R3B/zJNY6n+GQvuwHY/NYCAOd81+8tAMlnF0hCAqOzHjzSX4Q7jSy62cHUPC/i+GorIb8EYU1eP6AM2dHMnr8TxICA6++UXGY1/qh457d3zJskXUO6UeKqrn5MT8a/nS5q/9nc3wZHH3PiN24jckvu/gcDpqzJ4wNozuHwsV16gXIIV4b7m3yu4dyvRsqdKTXLrd0CXjfeFtUBgQRpdbCta/HZrz5UhTda8lkZu93hun8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vnnBvE3oLkXTgodSn36WN5ZIQT94+yE/SuIixZxtSw=;
 b=iyNXnn+pAQI1+eOHnBSlvBh+0w6M0t3q7yWgjPAvnl9OGvua224fJBjXtOSwX3CVrofNlDqA2bWEJaK43opi1JTApjVMzrXNiqWcsOgQPbJi4JKWiyGlVzz9eFz2HpcUF3FTVkV7EhFvA4IXMipqz58BZWManx4IozsO1f4vr14pc6D/ypJnOj8Bcf63EGqLVUIAETUvMq6B0K0GH2h1uy4JhquTEy0gpkh4d1kunw+gqP5NmQtS6mP4Jmjri/LNlIGkn0c7hSz71xPvTI6ZyiPP+yCPuLq43hr52hfIVw6qaanFuCc5SL65/b0ZMRDfn4TgLGftAq2rMXCROV/O/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vnnBvE3oLkXTgodSn36WN5ZIQT94+yE/SuIixZxtSw=;
 b=TajODBmilaLGkXDO4ITv1MabPqLj8NKdJF135ytJ009ytRFo14MVpm1GOA4je0INZbGc1nj6ShQBPlc2fEeoYCNBf/Ndy+CGy2jrZlRNcrvzc2GWW8pYMaTAo3AhLeUV/AiI4vkTZOf0E/eoPso5XthYbTa3LN9H1PvZd23Xsp8=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2349.namprd12.prod.outlook.com (2603:10b6:802:2a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 16:33:27 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d%4]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 16:33:27 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
References: <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <1fa4dd77-deec-aa7b-7499-0537e9a01919@amd.com>
 <a818be68-518c-754d-f63b-3754ce882fdc@gmail.com>
 <CAKMK7uEx631E1NB1=NYh7V2_+X=pK0WhA_sBwpxCGOhFaYw9wQ@mail.gmail.com>
 <e389b7d7-196c-ee03-ff94-ffd110c1013f@amd.com>
 <77cdb5bf-a418-bafd-2360-163e428c7394@amd.com>
 <CAKMK7uEgY4gYqowUZP0FZYHB7FNPCqApWojmSnuwhQ9WnY6hLA@mail.gmail.com>
 <8083b9f8-ee43-504f-0690-7add68472ca9@amd.com>
 <CAKMK7uGQtOgHxXQ_AK7f0unrwOnLQm3nb-VUJ_pW6vonRazu0Q@mail.gmail.com>
 <74140041-d838-87ce-5408-806d860cf9b3@amd.com>
 <X9tIrE0Ak68HJ391@phenom.ffwll.local>
 <864df6cc-33f4-6624-6756-5a171ad7ed4f@amd.com>
 <CAKMK7uHbgnt7sHoDEm76xdM5T8EYJft7Fu5Kpqxqpm=Pyx7Z_A@mail.gmail.com>
 <5feff301-0aca-3e07-c1c4-31e4a91fc942@amd.com>
Message-ID: <b20b7304-85ba-45ae-d801-78461cc96e1d@amd.com>
Date: Mon, 4 Jan 2021 11:33:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <5feff301-0aca-3e07-c1c4-31e4a91fc942@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:4465:d1cb:357e:d8b0]
X-ClientProxiedBy: YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:4465:d1cb:357e:d8b0]
 (2607:fea8:3edf:49b0:4465:d1cb:357e:d8b0) by
 YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.19 via Frontend Transport; Mon, 4 Jan 2021 16:33:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cfa7cd05-7ebe-4acc-b1d5-08d8b0ce7692
X-MS-TrafficTypeDiagnostic: SN1PR12MB2349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2349F1B5ADA9EE68FECEF183EAD20@SN1PR12MB2349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /I/HqScqeOfqJREqxNyecuDiHWEY+XU0M+zqCYXZbbLmf7Tz2+qx3/7pgw+ge9tbh1E/dnAbnn0fVp+q1SJb1LeCOMJ/sD6fAy/GS/0Ju3SbFre5mTRXZl2NHkv5M/ahPlrSQxFjiOFXDbbGf0ypYGv1pNpF3CgUD17ktymbM3j0Q3lKcV5g0ruemNpXWaPItnWm/sSmFqV4xAM2tAE6ZgLvoox+PB+V4CYQOTRNYUQ/rM5T9AoH6enpx1OFH64VwYxSOHlaL9KqOGgvdAfAvi+qgSjzAl0nrtI0dpxilTQI4EumFppBETcD2y1zAb8FYPqmzpp3FPNu2rr3mPYvUh5it6BL3dtxyFISgnWuRvCPDUhQoyFtD8euwFYeoosjrNsPtNPaIeH38wzcaXN5EEyRw9p33b3JTvtwQXc1sPM5wUH7bX28VcuPIT5iVWMN9t8+DCzyYQz2emb8VA4bKnrxFOH9xHQSB4JilWZxvMs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(8676002)(2616005)(31686004)(2906002)(53546011)(86362001)(33964004)(4326008)(52116002)(6916009)(31696002)(16526019)(186003)(6486002)(478600001)(5660300002)(66946007)(66476007)(66556008)(8936002)(54906003)(316002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TStvaTZVYnZtUXVNcTZhaFVHYXQwUjZ2R25MUk5GcERJWERlZXM2L05GWHNO?=
 =?utf-8?B?QTg1UVNGMGdIbXdiSXk0enJrcmMxYXBFdU1kamlUcko3TEVoRCtISWt4a1Vr?=
 =?utf-8?B?RUlKTENtMGFCTE9LcFhOQWROb1BvdlE3ckRkUld2MlZmRE9VZ3ZpOWp0Zlpv?=
 =?utf-8?B?dkRXb2tYZnE2bVUvODI0OEVjYUx5aVdUNEtGbXdXdnh5TmxLWUpBWTNrN0ZJ?=
 =?utf-8?B?YWNaWkxUOVpRVFRpaHV5Sk1VVDFpOWgzNmY3M3FRTTJRVVg4cEhtNy9tUTZC?=
 =?utf-8?B?T0o3K1RzSUc0V2NKQk50MTA3ajZ3cms0Y3liekFrdytZNjBPby9sVS8wOXJi?=
 =?utf-8?B?azJvcUVjSUt3YlArNGFxZ2xId0g2MkdYOERQdHkxSkdwNVRCYnhFMVRvdFNI?=
 =?utf-8?B?aWhVbVJGd2dob3dXS00ybFZSZkpVOFVma1JOWWJGK0xvaUk5eFRDUHk0N1FQ?=
 =?utf-8?B?azhsUTFPU0NuVTBaSDZEbDk1WXR3L2NaR2dMR2UvcUxLUDhDb3l2NytyYWp5?=
 =?utf-8?B?MmRGWXJCcWZ2NFpuWUh1TG5yam1jV0I4Ylp1eXl1QUNwVWRncHcvM29mMzla?=
 =?utf-8?B?Zk0xaW4yQnptUlVab1IweXNpaEFhYVBmOVJ6WE1QazZpWXlxVFh6NnRSZEUr?=
 =?utf-8?B?c3B4ZERSdHc5RHBQaGIrMk9HN1BmWEkrVGlsT3M3K1hTdGhpVHpPbHRPdXJR?=
 =?utf-8?B?SzRVNmpvMGluL3F6dGoxWGZ1SDJCa1RndHJJbkVPbTcvbmh3a1U1RlM5TmlO?=
 =?utf-8?B?TUdDcS8rS3hsclA2WnN6dE9KMDd3cDUrM3RnOGIxekhsZ2poU0tsVDZQMEE0?=
 =?utf-8?B?dGJTZTJvYmUvU2hjaHJLT093M3hmMVczNXFVb0hrUWFNd2d3Q1pyNVArMEZj?=
 =?utf-8?B?dlB3Q1J1OUN5VjlLeFdxNnhReDJuSU5SM1ZhTVVMYWlpZEEydWpqT0NNMDdB?=
 =?utf-8?B?OTVlTkl2RllLdDlwaTVEMDV4alZOWitZcitZelg3Yzg5OTBnZlREREJCVDQ0?=
 =?utf-8?B?ZklaMmI1ZCszZGxpdnljWE9tRmlSWHg0WWpnUWFhT04wSi90S0lPMlE5V29R?=
 =?utf-8?B?bUEwRGtKV3F0OUY0RnN0MWpSc0JMUlZQNENHZmtvOFg3bEZVbm5OckFQOHN0?=
 =?utf-8?B?SGliQUlmMzVIdFphV1VFUkdFK2RjeDUySlJYdldPMzR0djZvZUZhK3FjRU80?=
 =?utf-8?B?bUF6TzJYVXp0T2FxeGl3aTliWHBiRWxwSkZ6ak9VWXlMdXFMUWl6eE5DWEtH?=
 =?utf-8?B?NW1QUWs0MXgrOUU3dGkrdmhjSFZOQnhwT3Bob1haWVpQblBvMGdUWXE2a3hl?=
 =?utf-8?B?ZUtCQnl0WWpKVkdjdnhkT3QrL3FRb2xSRzBmc2VEeU4rRG03amRnbGM3WWR5?=
 =?utf-8?B?dzl2akY3THo0MnNUSWhzaHZTRW5Gd1RhN0RMMnRJNEV3QURwUzRUUTJIaUpu?=
 =?utf-8?Q?EIdr+G/b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 16:33:27.1392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa7cd05-7ebe-4acc-b1d5-08d8b0ce7692
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Phu/XCW9LfuMcoKXiWsXjACAJOVJmDsE+QKWeOO+u4YJDPsRRksgqJXYyr3XCiQiE6q0MGfpue1bjSzNItWajg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2349
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>
Content-Type: multipart/mixed; boundary="===============1796295914=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1796295914==
Content-Type: multipart/alternative;
 boundary="------------8551C34539B62030AA3E359D"
Content-Language: en-US

--------------8551C34539B62030AA3E359D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Daniel, back from vacation and going over our last long thread i think you 
didn't reply
to my last question bellow (Or at least I can't find it).

Andrey

On 12/17/20 4:13 PM, Andrey Grodzovsky wrote:
>>> Ok, so I assumed that with vmap_local you were trying to solve the problem of
>>> quick reinsertion
>>> of another device into same MMIO range that my driver still points too but
>>> actually are you trying to solve
>>> the issue of exported dma buffers outliving the device ? For this we have
>>> drm_device refcount in the GEM layer
>>> i think.
>> That's completely different lifetime problems. Don't mix them up :-)
>> One problem is the hardware disappearing, and for that we _have_ to
>> guarantee timeliness, or otherwise the pci subsystem gets pissed
>> (since like you say, a new device might show up and need it's mmio
>> bars assigned to io ranges). The other is lifetim of the software
>> objects we use as interfaces, both from userspace and from other
>> kernel drivers. There we fundamentally can't enforce timely cleanup,
>> and have to resort to refcounting.
>
>
> So regarding the second issue, as I mentioned above, don't we already use 
> drm_dev_get/put
> for exported BOs ? Earlier in this discussion you mentioned that we are ok for 
> dma buffers since
> we already have the refcounting at the GEM layer and the real life cycle 
> problem we have is the dma_fences
> for which there is no drm_dev refcounting. Seems to me then that vmap_local is 
> superfluous because
> of the recounting we already have for exported dma_bufs and for dma_fences it 
> won't help.
>
> Andrey 

--------------8551C34539B62030AA3E359D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hey Daniel, back from vacation and going over our last long
      thread i think you didn't reply<br>
      to my last question bellow (Or at least I can't find it).<br>
    </p>
    <p>Andrey<br>
    </p>
    <div class="moz-cite-prefix">On 12/17/20 4:13 PM, Andrey Grodzovsky
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:5feff301-0aca-3e07-c1c4-31e4a91fc942@amd.com">
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">Ok, so I assumed
          that with vmap_local you were trying to solve the problem of
          <br>
          quick reinsertion
          <br>
          of another device into same MMIO range that my driver still
          points too but
          <br>
          actually are you trying to solve
          <br>
          the issue of exported dma buffers outliving the device ? For
          this we have
          <br>
          drm_device refcount in the GEM layer
          <br>
          i think.
          <br>
        </blockquote>
        That's completely different lifetime problems. Don't mix them up
        <span class="moz-smiley-s1" title=":-)"><span>:-)</span></span>
        <br>
        One problem is the hardware disappearing, and for that we <span class="moz-txt-underscore"><span class="moz-txt-tag">_</span>have<span class="moz-txt-tag">_</span></span> to
        <br>
        guarantee timeliness, or otherwise the pci subsystem gets pissed
        <br>
        (since like you say, a new device might show up and need it's
        mmio
        <br>
        bars assigned to io ranges). The other is lifetim of the
        software
        <br>
        objects we use as interfaces, both from userspace and from other
        <br>
        kernel drivers. There we fundamentally can't enforce timely
        cleanup,
        <br>
        and have to resort to refcounting.
        <br>
      </blockquote>
      <br>
      <br>
      So regarding the second issue, as I mentioned above, don't we
      already use drm_dev_get/put
      <br>
      for exported BOs ? Earlier in this discussion you mentioned that
      we are ok for dma buffers since
      <br>
      we already have the refcounting at the GEM layer and the real life
      cycle problem we have is the dma_fences
      <br>
      for which there is no drm_dev refcounting. Seems to me then that
      vmap_local is superfluous because
      <br>
      of the recounting we already have for exported dma_bufs and for
      dma_fences it won't help.
      <br>
      <br>
      Andrey
    </blockquote>
  </body>
</html>

--------------8551C34539B62030AA3E359D--

--===============1796295914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1796295914==--
