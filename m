Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0FD2123CB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 14:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BF96E200;
	Thu,  2 Jul 2020 12:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6116E1F7;
 Thu,  2 Jul 2020 12:57:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKFjtQq3KYYVgoaoKAw8kcUvt5Yl17FsD0gcr8xF934cIjyk7uA314y5vDAk9TeMaOHUUA3bDEBM5+GaWpZHzlhX1VgW4ERq/TWgpUg9CBCHo7lY39YV50OKcMT5HWFqDhIMu8SZrVFhUhTgX+8zQfoTPai8MXhHGHV3OFAG2K+ZrgaK+mJ4JRrS/ZJsdv1CksrTejcJDZeZAqZFSW2brbVzlH/VAkilY4Rfcb1DUqRXrHRuftj21yoiVwC4Ys49A/gEO3XmP/Ki5Eia/nyXNXRokOe/epKqDMgy39ircW7mwt3e6orJa1ZM6EKAKo4Hyc/C1LqemEkk5eFTBJwvhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vHwGM1j3h3zMrfkrgCdJ3BVqlGq3GbBYqZb0upz87k=;
 b=V8Ae1/iz+oAbPOz0z5088IGLzdNNEiFMehcIQtZHQRIIoAuVcjTmXwJEQYBn+NuWKonJ5dH+vgi+W3yl2KMaH8uwNQzGv+oSVqZQ8KiylCawJVe8f9e4Z00r+yURbi/9LZm+I2Pu4f0AbQcaxADN3dJVX2IqpCzHkmHiESJYdgfsa34hmYdDqHz8LAz1ObFqwhgTiK8S4YZMrOH8n6qjm1KLlKXlxZRojiQlOGu9BBtIWGlxunPU1KOcDSGd1bnc2TM8+EE7fKZ80WfIOKpHQRWxXrO6b5ROJzu3bnt2jhh7jWgHsgt1uBHRGlgvlSp13uWGXkhikc1t9sUPNfEtKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vHwGM1j3h3zMrfkrgCdJ3BVqlGq3GbBYqZb0upz87k=;
 b=xWioqp5kize9DazdLv5N2gYj3jaiFn1W7vN/TveDjDcTH/E0CdBYg71sf2ayugGYdy9ZTQoI77cFiVLTo5+QqEN5y6YxQMTDAAXeYt/Uhxc5XDXkXMPDytcekL4a5S/0cedPWDShdfQJ/LQRqmWiNgTeyzv8FEqqdgNNhLzHT0s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4112.namprd12.prod.outlook.com (2603:10b6:208:19a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Thu, 2 Jul
 2020 12:57:29 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3153.021; Thu, 2 Jul 2020
 12:57:29 +0000
Subject: Re: [Intel-gfx] [PATCH 2/2] dma-buf: fix dma-fence-chain out of order
 test
To: Daniel Vetter <daniel@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <20200625123443.19680-2-lionel.g.landwerlin@intel.com>
 <159309113252.4527.2883585204850736358@build.alporthouse.com>
 <c6f72d4d-c8a0-c484-7c31-761e9c37b85e@intel.com>
 <CAKMK7uHgwUQYLDPJnmTqcX1=UPuinifm+Y7+z-krSzqXpKXnow@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <73e53177-d8a7-80eb-8cf5-a99388977368@amd.com>
Date: Thu, 2 Jul 2020 14:57:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAKMK7uHgwUQYLDPJnmTqcX1=UPuinifm+Y7+z-krSzqXpKXnow@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0109.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0109.eurprd06.prod.outlook.com (2603:10a6:208:ab::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.21 via Frontend Transport; Thu, 2 Jul 2020 12:57:27 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d1039e89-7f93-4b0d-4e58-08d81e8779d2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4112:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4112C2CB21F2C4ECCEAE092D836D0@MN2PR12MB4112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0452022BE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 77GjWJZlBETza3ac+eXSe/ts0REhYoMWCRzXXz6lOsGR+QQivbs5Fx4vs37dRA8y1qZUQoCkDHuJL90nvPq0WhvbN5B1FA716zBvvffrxMQuPDtYEUvYNuiPPhmrWPSdE1AIH+Lky5OecvHugDE8xFFAGz2RRzGw2P04J9z8cCjkNQUlEk/3eqwoKSXf3+pwuEOOGkqkdO7Fx1yWzag/rALBEB8Hyomvg2hR3m4fGI2oFRqKprZ+/pwZH/65EpiD2/mIkt0PkQPuw7VJJCSkQIb+2chdzf7nZsW6aNLr1Eb97SM03qTgowv2oNUigLIycsuMLljH6MJmDmqFfaAlgeExQkpXbtbPcgo6fF0UMOrB8Uy9iqEBrHUr0Uyd52wY+y7jveIfmd6j8XGVeEzGzTcsWI4fzVQteLZEg3j0vao=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(31696002)(66476007)(31686004)(86362001)(5660300002)(66946007)(36756003)(4326008)(52116002)(53546011)(16526019)(186003)(6666004)(2906002)(8936002)(8676002)(66556008)(83380400001)(2616005)(45080400002)(110136005)(54906003)(966005)(316002)(6486002)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ycDexrLEVsI1V1fOuPaJdZD6lawOoBuWIyX+hDopkK593g6aursXAx1vJDFaIXBv2oHWSn6BTA26UHV6TGzXxHnUpKPS8Fr2g8aCtnSsM9sca/nXLqcLq9VvZdLZWwlCdGIi+GDEyoW6ExdnMiTR/EIkEsDxEt//DI08AOLvps788ym0p7hNoTwNBWM34A2qabx+BLqFRRkNqpkQ83SxUmZbqnjqRo00OKgOAik3h9P0C93em1Y3d6PMm80QJdgR6czSazB6q5Uvq08aYomieuxJVVEuNEspxndfSo0UysXex2Cooi8UWj/voEHlCIkmKKiqRuJpoGMtKjrO/8E+ozrcXfB1CQoZ9sjbXajXiQj5q2W63Y2MoDnDmxl134/YpA9oVR8qn+hVTIp5dNT7R/iAI3wu8jMr716/uKLQfdvjVUsnVB4VacWpAVbDA5C1C1LkzBQRtIke41Whpuoq5mIo4AM3l5fXf08eDw3Rw0g9xrcFllEGWGkKQUGuxv1p6I2jOaesDEhltiw2ZQsD3fKzxKMauC5kFSb+oAjNpBb6gUHci2qESxQhA6NSgK9A
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1039e89-7f93-4b0d-4e58-08d81e8779d2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2020 12:57:28.9897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJgMFE2PjbibLiQXrRVy8UmpOsbooqdXw6YT9xL5l2ZvIO7rXye8ZD5kwqqzMu/s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4112
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.06.20 um 15:59 schrieb Daniel Vetter:
> On Thu, Jun 25, 2020 at 3:23 PM Lionel Landwerlin
> <lionel.g.landwerlin@intel.com> wrote:
>> On 25/06/2020 16:18, Chris Wilson wrote:
>>> Quoting Lionel Landwerlin (2020-06-25 13:34:43)
>>>> There was probably a misunderstand on how the dma-fence-chain is
>>>> supposed to work or what dma_fence_chain_find_seqno() is supposed to
>>>> return.
>>>>
>>>> dma_fence_chain_find_seqno() is here to give us the fence to wait upon
>>>> for a particular point in the timeline. The timeline progresses only
>>>> when all the points prior to a given number have completed.
>>> Hmm, the question was what point is it supposed to wait for.
>>>
>>> For the simple chain of [1, 3], does 1 being signaled imply that all
>>> points up to 3 are signaled, or does 3 not being signaled imply that all
>>> points after 1 are not. If that's mentioned already somewhere, my bad.
>>> If not, could you put the answer somewhere.
>>> -Chris
>> In [1, 3], if 1 is signaled, the timeline value is 1. And find_seqno(2)
>> should return NULL.
>>
>>
>> In the out_of_order selftest the chain was [1, 2, 3], 2 was signaled and
>> the test was expecting no fence to be returned by find_seqno(2).
>>
>> But we still have to wait on 1 to complete before find_seqno(2) can
>> return NULL (as in you don't have to wait on anything).
>>
>>
>> Hope that answer the question.
> I asked Christian to document why timeline works like this, but I
> can't find it in the kerneldoc right now. If it's missing I think we
> should fix that and add the explanation, iirc it was around gpu reset
> creating too much havoc otherwise.

I do remember that I wrote a patch to improve the kerneldoc for timeline 
semaphores, but then somebody else came along with an even better 
description.

Unfortunately it looks like neither was ever merged.

Need to dig through my mails,
Christian.

> -Daniel
>
>>
>> -Lionel
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fintel-gfx&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7Cfd87640cd9bd422971bf08d8191004d2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637286903879074805&amp;sdata=M3WGWbuyQKZeGC0J3wEKtgQ1oKYo6GOAMvKU2mU3r%2FM%3D&amp;reserved=0
>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
