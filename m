Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7857B58A427
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 02:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948BE10FE49;
	Fri,  5 Aug 2022 00:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F5AAB94A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 00:22:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfJXO9bWf/Oo8s4RwLgeEDq275r3dt//2YH331enNmvtAENXP5JuSSCzclcdNWS30zng1NBv6P1ExCTdzI7HofdO2K/DkPvmjXab4/D01f4KvvMmBTKKalP9S2KHSUiD2RFZoLjqd/oZIdwGVJmVcxXxIznvj0EJdR3c+tyuINyByc49vHrFYt1j1O1eIXJiImYRCnYkOmIZFwbO/f/MQYB3q505mAaanworJ0fZ60WrtY60H6nzg8rus2ntqryhGMOjMKzg5uJ0xZ9fH47/47dkSZ3k04Acbpx4S+9V0U0j0Ziqijv7UFhqlBixDLiwxJkNIjTS0XfPf7N1EisU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dq5bimWXHnSLZtnbCx8CWExJL0yNdhVSji+5a9tBzgk=;
 b=YujW+xBhocfSJGTZXLtGC17CYkaNO/cuK4+18hs1OV2EJJ4NaOSM+RbMKxS3WCq9MEPhYL71mepEnNgU0cCeGN9rVje1hUaQmH9BEAZV2zH0u075lyegBx/BEj4BeRRnDGkg3wC7hjACEOlAORkb71XbpfAcL7amkpUqBkI402FPqLB8navUZg4v2bwp1wZZJ34XfudDIjeqFmGuMME6pqrh1N30tLyMXWFLB9X8XIDsPZmnYpnJ4K+SeF3oqpJTm4yHSwKEKmUobwNgV1GLuYstYfTjI5JAFE+e7IoMUMUvo6QSr+qbSrkyCvtGR5jkKtp7TSRGUw8Vvncuyg6pTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dq5bimWXHnSLZtnbCx8CWExJL0yNdhVSji+5a9tBzgk=;
 b=ik+Ek/pOeAizHkYhvIrxiudhhI4pjOlA6zrwwTXLC5w4MQ7OSoQekTnF2uM2SiMuekXKYtxcca9JuESw2wCST8Z4y37+JuDENwHs4EYLpsdZBUrigceH5gtq3CIGB4FyNcTuFgvcN1YiOMghUw3kMmZCpc4XRYSr+f1Ujv3eOO4Vqi1lgvi+5zLkrSMeX6a+4JzWgfI2sstdIB3toTF48koGQqTge/l9SwBMv9hy8eLSU6D59+eegpQ9Fr2hplxCZHoR9XIBGVleI6sKM0uevTmacbolR1IYjPPWgFB2NYxaZzHmuuvR5pqCvsh3hbuVlt5mIagt4r3LqP+Od4Rakw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BYAPR12MB2984.namprd12.prod.outlook.com (2603:10b6:a03:da::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Fri, 5 Aug
 2022 00:22:53 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372%7]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 00:22:46 +0000
Date: Thu, 4 Aug 2022 21:22:45 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: New subsystem for acceleration devices
Message-ID: <Yuxi1eRHPN36Or+1@nvidia.com>
References: <CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com>
 <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
 <YuvctaLwRi+z0Gw4@nvidia.com>
 <CAFCwf12wD3uEhr+kxwN9ROXApHzGh_n1je5susZV5NgGR9fCcQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf12wD3uEhr+kxwN9ROXApHzGh_n1je5susZV5NgGR9fCcQ@mail.gmail.com>
X-ClientProxiedBy: BLAPR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:208:32a::30) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 634d7023-764a-46e2-79b1-08da76789f3d
X-MS-TrafficTypeDiagnostic: BYAPR12MB2984:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Ex0IzZax+xVsG6uegiunWs65osYtlqx1jJJgXqWfXu2GyVTDjDqPVb4hRA8AMrrDXhofg+YO+OGE2uM8tYQR5tK5TBya/+TX3OfSJE0JIiv+8Mko8rDY9d1GwsLN4kXpk4cQYZn80WGMKOq52jDH5UZbbOZTHcySXvuNo3sCe2mcsgEEHdtx+uAharUn9C3J/5SD9huq8FQP6RIXMjlNvx9CWeHxytWiROcrChe/eGXc2wLMmLLfusBhjPXu8sttMHwn4flvqbbhe4LTjL1/5T0vkk6Mo9yJbNLcU78nzvR0kZ0vxL+ySjO5I8LPaKhg0KsrAcpU7GF6gJtkpqxNV1PsxKrR+v3aONJTC/Wmn4E4Kp8xlEJ5zk/si6XPyX3tjbPkxWsFaxcl3GtCAuWuYtdapn/xFRvCurFs7g5DPiIJ2bipQdp/gHIGXZxDUvCj6mhmA3vwc2XgmM/I1CPN5pn/KgkutgmslYLJOqGR7iZ6y8h0CmxxJTvoJ9xVhNG9LIR4Xn3wzJ+8G24Nbv+quwJ6DXXlpt+ioriQSYk/dds7fNWjIrBtlLcScJ/WOsLVkoDsi9C916m2OPgWA5Ve8eK7zy/oTHG0253CUeWKEk3KoTdBkJpsKeHQ6e3o0OunretJthNDaCapWWJO6r1JJe6AeELBN0sDBPV1S+2Mu8riM5R3IkWZdxlmd82FQIk21wD5VGu6DCHzpGKY6I4PSOmKNkCC4rG+0BXsCufk5RZJYcTGzAe46TnBt+NFUx1aRKqv/ZGP1nMqtMFrMzJPvZyjXjs3wI3P2wEH9Nd2mo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(66946007)(316002)(8936002)(66476007)(4326008)(8676002)(66556008)(186003)(478600001)(6486002)(86362001)(6512007)(2616005)(38100700002)(54906003)(6916009)(83380400001)(41300700001)(5660300002)(2906002)(36756003)(6506007)(26005)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ehes2N/DVptHE6h4LODgNiFRunGzUy+lyh18yYXcxtoONm045QwPXdn8EH+l?=
 =?us-ascii?Q?cLItybDSLcQILkBCYPfuAZ2+rIAbPBxoYF9XIl0JWUbo47Lm+YBavyjtaGkf?=
 =?us-ascii?Q?Dm5kQQZcllfqE79kcL3ugxIoaWXTFG9xF+F7dBTduyfKQlNy0wvJXqOg/Lvy?=
 =?us-ascii?Q?95kbFfiKp+9NgyHdubteoAC4hj6r6PDTiTXcBcPNjJouEwtgmrpv/HSFpYax?=
 =?us-ascii?Q?Jc8EIyqvA4ilauhaO8v71mh3OzewQsdn+hv6ZKV2Yuv7ZNsCjY0EzYFCWvAU?=
 =?us-ascii?Q?sid+h/8iYoN5OQSbw9bma056J979/Y2n4JBl1M3Gz/J5h6D/PpSRseoeHIxz?=
 =?us-ascii?Q?5nMd3r3PTNSr1Eb+W6Hp1loqrKvG/1Qk5wk/wOEp/EpBcC5yn+qX1/NT7eXG?=
 =?us-ascii?Q?6MAzKj0wXJncue1hQqB60IstYaXX06Oad4PIOQPhvu++EHzVAJiI63OMg/gf?=
 =?us-ascii?Q?KtaOwgr1Tfr98yJnoNFaquvs8iPWzQkt2ZPCy05YNz5gRRA1YKjpx9NBZprI?=
 =?us-ascii?Q?mmEX0ZlZfvcU2kLr3yasCuyu+7uhnWzgqw3Ea6EQNIwXvT+IBKEFcfBy1eTk?=
 =?us-ascii?Q?zhGzT+7uxSlLoR6eQ+J8FR1tnyRDbMtBrU7tOfWqwIhBdv7ichqHhF21eaEd?=
 =?us-ascii?Q?TNzeF5VNlDeXfUKpHaV0f6Gk/jDzgNkRZyZNndauwz812IXh4A7/Tpn8Boqe?=
 =?us-ascii?Q?g/Vp5ZTDaCOBkt2rLr5Q5FwKT47pLixiQLRUIXaQzsyVJt8x27+cUybqmutw?=
 =?us-ascii?Q?5h+oMv6WpDwSo+VZ4cjr9pv9SU1//MISrzkQqDifojwcWdNf0ZA3OSK+U5Fg?=
 =?us-ascii?Q?pRK0Z2ichkIEIDWmZBW9TEn1jXjnE+WGQ4Cua0diQgI+15LVaa9ktboVCoWy?=
 =?us-ascii?Q?yhMh0IySUkDTcpe4OVqv/sGWdXkA7tx0f4YPhRW/CRMsm4dqY6Hs6V/xnNgb?=
 =?us-ascii?Q?rMXsS5iGI9IRGUwJoHy/sIv17RgWRmaZNqv+WnV8dS/HS7qC7r1uDkkE6YmH?=
 =?us-ascii?Q?sChNrlNs08cH6JInAM6ak3+TUXwNKMI9PWmBwXhX8nhkk0Ai+ETocLPGOO2X?=
 =?us-ascii?Q?nggVolNIlmSip1PNxMeAobO9cHttba+8ck0BbN9b/vvazASxx0XO3DJvJy48?=
 =?us-ascii?Q?5xRfoTPUapKcNsvsiHEtzl01Z//WI6evlLY1A3J4no60rPMmuhgfbilQCfWr?=
 =?us-ascii?Q?EEcVbsPvjQcpOU4E33r041DMYvcFUz4AagnsdeIyMHJDR3zVaQ6YcRMMJgwV?=
 =?us-ascii?Q?hacexrvG8d5I0xwHVIBm8eQFdaEO56ckk9f1APToRoL2sUW6cN0r3n1AVx80?=
 =?us-ascii?Q?e2o9U4MOlwhe5mkbUfcY4EG9vZhJIdVTSPfxpGelvrLi1HCGcAIAncOeevdF?=
 =?us-ascii?Q?FDqcx1Iq3CSyX64MgN+u6fhqGS7TM3UxVgX9oVUhUSmQat5ZZ49APBF6iupm?=
 =?us-ascii?Q?z6cXz3Gzv9dS7kScYMA1XMzGVEgI1vohjpdRMZIvTXaqjLP/WuYhc2kn6N+X?=
 =?us-ascii?Q?n2op3Og27MPptfVAzcmzWRrHEdMz7CNE3wPOn1RHEQgtGl3a380xTuvPRag7?=
 =?us-ascii?Q?VdTRAoZw4xOvBnEUMHR+7tmqz7LQV9TQbIrktNV9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634d7023-764a-46e2-79b1-08da76789f3d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 00:22:46.7511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0k2saZFq41mOieeBylY592NMA2/OpFI0zVFbvdiMvKVh55NlBCig3s8nJuZr6Uu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2984
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiho Chu <jiho.chu@samsung.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 04, 2022 at 08:48:28PM +0300, Oded Gabbay wrote:

> > The flip is true of DRM - DRM is pretty general. I bet I could
> > implement an RDMA device under DRM - but that doesn't mean it should
> > be done.
> >
> > My biggest concern is that this subsystem not turn into a back door
> > for a bunch of abuse of kernel APIs going forward. Though things
> > are
>
> How do you suggest to make sure it won't happen ?

Well, if you launch the subsystem then it is your job to make sure it
doesn't happen - or endure the complaints :)

Accelerators have this nasty tendancy to become co-designed with their
SOCs in nasty intricate ways and then there is a desire to punch
through all the inconvenient layers to make it go faster.

> > better now, we still see this in DRM where expediency or performance
> > justifies hacky shortcuts instead of good in-kernel architecture. At
> > least DRM has reliable and experienced review these days.
> Definitely. DRM has some parts that are really well written. For
> example, the whole char device handling with sysfs/debugfs and managed
> resources code. 

Arguably this should all be common code in the driver core/etc - what
value is a subsystem adding beyond that besides using it properly?

It would be nice to at least identify something that could obviously
be common, like some kind of enumeration and metadata kind of stuff
(think like ethtool, devlink, rdma tool, nvemctl etc)

> I think that it is clear from my previous email what I intended to
> provide. A clean, simple framework for devices to register with, get
> services for the most basic stuff such as device char handling,
> sysfs/debugfs. 

This should all be trivially done by any driver using the core codes,
if you see gaps I'd ask why not improve the core code?

> Later on, add more simple stuff such as memory manager
> and uapi for memory handling. I guess someone can say all that exists
> in drm, but like I said it exists in other subsystems as well.

This makes sense to me, all accelerators need a way to set a memory
map, but on the other hand we are doing some very nifty stuff in this
area with iommufd and it might be very interesting to just have the
accelerator driver link to that API instead of building yet another
copy of pin_user_pages() code.. Especially with PASID likely becoming
part of any accelerator toolkit.

> I want to be perfectly honest and say there is nothing special here
> for AI. It's actually the opposite, it is a generic framework for
> compute only. Think of it as an easier path to upstream if you just
> want to do compute acceleration. Maybe in the future it will be more,
> but I can't predict the future.

I can't either, and to be clear I'm only questioning the merit of a
"subsystem" eg with a struct class, rigerous uAPI, etc.

The idea that these kinds of accel drivers deserve specialized review
makes sense to me, even if they remain as unorganized char
devices. Just understand that is what you are signing up for :)

Jason
