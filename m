Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E4950D89B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 07:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28556112507;
	Mon, 25 Apr 2022 05:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8A91124D0;
 Mon, 25 Apr 2022 05:02:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3ZQwnykZM6a7w1fQGRc1o77UBGlKIlUFNiu8XS7rtHjaDcF6AsVxENozXJ2PMgvBiNIC3KEhlYcRxIwjLqHntvPzAaFOhtKaEuPMkF02hBLCtJT/v/wAM2asSgzT9fK0ONqaaF74k8P0Bsfp2E3f92odkJiyw/Pk5aLIsokmMvPD1FpdfUkukpsFTfZGUqZmKE3//4zqo9tn3z/pyvUjvooSxtXZGnhkuQ7xwQZixzvUmP+GoK8w25YqwY4l+A/VEJYn94GAbj6RjxGOvbE/KOeXyPYEYjy2ltrs2F/19pikZVn6ydtCZv0k/jLd1qMwMrlfIRZgWFtMv9xbsiIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bAPjosXjOTJodJpr+648Lx5Ag0VcnYGWfX8s40Wo2Y=;
 b=fepu8K2i4TYAMqriBhQ9TjJWl/zLsMe9Zebb8Lo6XOkY3QHjXv569rSmTeqsA4BUEhlfxsYWvqxRspDFd1H2lSxHrXxn7utAMc2bHYmcuo2kpjitZciWJQAlue8mGYztbM+6cO27yrx+eNjmZiGwYU3k4iiUNkkXftQtRmjf5FzYLsfSsXiETnm3xoOfwK73dMweMyw9efH7FCrRemcqeVBjEAUrDpqWb58M/qjijaegy6CcFjLQhwC4hBsb5x8uIdqMZFghZBEBy4bqV4KetqvBBs1KQn9N/pdze+20Fq+xWt/l6LSROYz2nFuM4EAmjGD7fviKJSmTBPNiIQfdCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bAPjosXjOTJodJpr+648Lx5Ag0VcnYGWfX8s40Wo2Y=;
 b=LtCC9COLEd5X4hZQxnue9Of4Q3Echztwv1syrU5cUP0YvBU13yMlQ/GqP18MCi75aNZ9T8VJ2Olw/SMfrui1whDeU2HGKMeth2CjJwaif9Q8pv6PVuOmMAjAMZ7mokI0eoIpsc9wBXhWT3pz9ti3WrahRYTuHIzAmS5QLBc1pjI=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by BL0PR12MB2356.namprd12.prod.outlook.com (2603:10b6:207:4d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Mon, 25 Apr
 2022 05:02:12 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::1c90:f807:7b0b:a862]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::1c90:f807:7b0b:a862%8]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 05:02:12 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>
Subject: RE: [PATCH] WIP: drm/dp_mst: Add support for dumping topology ref
 histories from debugfs
Thread-Topic: [PATCH] WIP: drm/dp_mst: Add support for dumping topology ref
 histories from debugfs
Thread-Index: AQHX0D+AE15V0cuVgkqFgVkq+XJhhqwbv0zAgAwd2gCAAEwcgIASwW2ggCVww4CACbQzgIAJv2yQgA1ywICAIuyLMIABQxUAgATGo4CAAcvdAIAJb+bAgAyKrgCAAKMZMIA30wAAgAas6ZA=
Date: Mon, 25 Apr 2022 05:02:12 +0000
Message-ID: <CO6PR12MB54892529AAE073053489DF9FFCF89@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20211102231502.286654-1-lyude@redhat.com>
 <CO6PR12MB54896F2BBF20F6C04D187D1AFC679@CO6PR12MB5489.namprd12.prod.outlook.com>
 <37497a7c6ce031bf4c99decdd4eecfacf95969b5.camel@redhat.com>
 <CO6PR12MB5489E282DA251241843EF4E4FC6F9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <CO6PR12MB5489D4C51655B1D8B817A50FFC7B9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <4074c2ad21ebe692022d4e097209910e9f32383e.camel@redhat.com>
 <4516b3a53a7d673ff451ca4c7542b40f4e10713a.camel@redhat.com>
 <CO6PR12MB54899D612BCEB3D485367045FC5F9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ad5c80b1f9bd0087b87903b0156bdfa80b8043ca.camel@redhat.com>
 <CO6PR12MB5489AA5549DC251E202BD58AFC3E9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <660715cddbf8284531972c77ee16570ea6d66267.camel@redhat.com>
 <55113c2ddb041bf73b9363df94cca9544aa7f9bb.camel@redhat.com>
 <4607907a7cf6937b2c2fee1b7c0ce077e8f3d10c.camel@redhat.com>
 <CO6PR12MB54892DC34D5D2FA0886657BFFC099@CO6PR12MB5489.namprd12.prod.outlook.com>
 <c0e30cebdf986ff3a70a9941148002bd32f26fe2.camel@redhat.com>
 <CO6PR12MB54895A5B1E30DC619B95C7ABFC119@CO6PR12MB5489.namprd12.prod.outlook.com>
 <9930fd40c7b7877fcf20d7483916a9090245dbd5.camel@redhat.com>
In-Reply-To: <9930fd40c7b7877fcf20d7483916a9090245dbd5.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=fa2247bc-3b7a-47bc-a4d6-1e7d05024302;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-04-25T04:57:49Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d117c80c-1287-4f67-af57-08da2678c224
x-ms-traffictypediagnostic: BL0PR12MB2356:EE_
x-microsoft-antispam-prvs: <BL0PR12MB2356DC11AF592D0391A0994FFCF89@BL0PR12MB2356.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /y10p9y66Z4HCyJXYsONVsqM3YqYMhc/CWKavagW54r+SB79pHkvzYM5hmapD/T6Y4RE72q+cG0hcOoPyHHUo5ELfNH+zuC+awY/scLAMqiD92MB71ejdXSJuPjTPO6CtzyXi5W1gtr16X98FFjLv3m3kGnga81N05mZu5/txZ2eF50k1ROJXIn9qnIskwHw2AjA27LyKoZxQHZ+UuYCGw+aqsD5p2UWeF7Ie146o2p8MMLISlUHMaAicdx0fxLwptWuV8NbMUrUNh6rT1dDJP55tIAHVNcOuDsRuZOEnxKNQXWlD3BWRLiVvxAoFvVQDBKELukSiJ9+la4mvdb70tg0qJfCMbRZrBeUAkBkZ2M4MKBVUmS9upuJsM+n8gD6vHhuK3QoevA/jEfQ2TBVNiTDxpyu6fGG5rG3DG3TvEXkUs3eaaiEAKyrwzytGbOM8U06KrcqQcMbGToMsC9AF8MT03tzexg7+iHLNiUFz8r5yU1uBkI6aWvhXSt5vektrmQm8tfs1GutFkGzuWq+5C+8BRRj81s6n2NW+VapngUgFQCoXQhspy5hg+E6EE2cG1SwdSR8Jcjuy1xxCYBYPXu8MDgr49RBBK1nGFeAnASMsSGuZ0D7RzYfucSYEEF5ltfbt/3D7sJCJPeMysNgv4+jK1tAi5vu/Aze9xmyUcdP6ex3b6d3blGBytyKGb0q83QFtYjS6aonWlCFkXs77npsrY7CBpuwaOXObXu01bwE/xRYP7qdbBdXj4pqT/AmIVHtWvJeGdbsnQwQvURw4KPdzTWjDlp7dM78DWevifq9hH2AtN1+AMYSHShqcA84BbShYMf/UmYTKURQ8NKeJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(33656002)(45080400002)(508600001)(8936002)(52536014)(30864003)(966005)(5660300002)(38070700005)(71200400001)(122000001)(86362001)(26005)(186003)(9686003)(4001150100001)(83380400001)(38100700002)(53546011)(6506007)(7696005)(2906002)(66476007)(66946007)(76116006)(54906003)(66446008)(6916009)(64756008)(316002)(66556008)(19627235002)(4326008)(8676002)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?av0rWEeqR6GVONjyOrAN6qGAGe/aycYEksQ1AWpv77WGPerJHl8i/lzGAd?=
 =?iso-8859-1?Q?lEcXFNNlVM6Zt4Mn41VX+Itje2dGew0M+looD4Dvr5Youwp+PUnkHhLsN8?=
 =?iso-8859-1?Q?03mPBXKAnpOgixWVv3d/nLa53gHy+GSwcK5x94D4/GZ9xFaOBcEmNJbQib?=
 =?iso-8859-1?Q?z5NYIkKdZjlpOwexoN06gUp1T7wwntUpKcq/PpWbhRKKTnL0Mxiin4ZSaF?=
 =?iso-8859-1?Q?wZLgyARL4e+k9dEx9Mm1smXg7kRt50fh7PIKsOnuLvQIT4OmtwfWHlF/GU?=
 =?iso-8859-1?Q?jtUKOdd95iuZLODZ7kRmfyzHZpCrpTwtP6Q9njT5TRQ50IUEO3yufnYR8h?=
 =?iso-8859-1?Q?atnlTPS3w9eWaYYoNgwHKVLqOXamRXgYCSGsrh7nDtkryzcyCQuDBgqpgG?=
 =?iso-8859-1?Q?b78GMiK+jySHx32aP4mcU77aHxSY0fYMf9R6aTruWQRdA7elf1lafQ4AcH?=
 =?iso-8859-1?Q?CjfeK+dVGKp1dje95NuVSqDOUhRZ3pcszjA/NnqKTBV5doq/KImg5w45r4?=
 =?iso-8859-1?Q?pQiZXrewvvuKWC3Av/8PQksql1vA1/8XWfIkJksn49ZfNw/1Fo9ZYZE07w?=
 =?iso-8859-1?Q?1XYEMGIX90pg32TjJvcqmYLCzYUWuvzrnG4m+K4NlA/M3oC1QOyteIc14U?=
 =?iso-8859-1?Q?B3SqBPc4+QLPsQ59wQO7wfVSKhyB7MD4cC2w9BF6ddWtLGDH+6M3WYNjMm?=
 =?iso-8859-1?Q?eW0Nl9nLCo9nv+LMCAJqi2QTpAo3UFXOpVKt3ZQwZeBJHk9XUA4Se0pAdI?=
 =?iso-8859-1?Q?w1vpaDR/o1N9m4jvscJ0KIWruUzKCnL2rLVwQdn04wy92aFLDdNLX8h9vT?=
 =?iso-8859-1?Q?e/U1NlJwTUoY8k9OTXfpbdubZeDfQvt75jiuBTgmvL1IsAW16Pv7dzm93K?=
 =?iso-8859-1?Q?7Ge3kGQxnj5eul2ut5NkZokMWX2cwGfPcZsMhnzGSWRAZn9kb1DQHpgyym?=
 =?iso-8859-1?Q?NBwAF190NmQko/18VzpDcJqFxExFuZ1dXYPwpW9aJMKGruc3jMpIWX7y7h?=
 =?iso-8859-1?Q?E1azYP1jZ36g4/DTbpWxuhCIgD8150NxzUDMWfMMgA2aYywjFNP5sUhPl5?=
 =?iso-8859-1?Q?ptOJM2KLmUAOhUxgpxB1m41t7FnkhWeZykj5gFTiWdLtfwj+w59EWG+BKh?=
 =?iso-8859-1?Q?DrubfXxID7UTRXoVd0+J9cqwuh7mdlebyCpNcyoP8741vdMlSbZb0QAly0?=
 =?iso-8859-1?Q?ub4yQnrvAP7qGBQ8l93JhF621+gPvRKoqT0r2qYnfXe4Qf5o6tZKoTdO6j?=
 =?iso-8859-1?Q?UeO9ovkU/0pqzddtxFBg4ywxl6Nw+cYey2eeJrajCVjX3a/ALE4aH5bWTm?=
 =?iso-8859-1?Q?Bk8p/r3SsKuj9Sg+277QRo0sjUTy8/OznyRu8W7seoKycQyjn3M9S6gAEe?=
 =?iso-8859-1?Q?lrdmhNH8RSLUOXj0Ry78tnzGMw2kJa/20y8VphJ1Z5wwhBzNCkA7xos3pC?=
 =?iso-8859-1?Q?F3GSDctY3i3EeqExUhIk/LeOXHNL8S7p+nZx4bpc9GJflRMmdlzwIhbEAg?=
 =?iso-8859-1?Q?+n4ZIRejW+0w7qPdTueSRpcgzv/o5gCM33Lm/2RqTMx5jHJtKRH5Ytlw/A?=
 =?iso-8859-1?Q?jGV2fcjhiatiIxo5pecmD0gx6ZqWk7mAYmp1AoOutrp1QtRrwYesEWajh2?=
 =?iso-8859-1?Q?PNJv3QcHbLmH27aPEqPxmZHluJlhN/5jYOVdNQL30HyjXGhcbcTXxIIqMb?=
 =?iso-8859-1?Q?wAXm6r8sTNRkYjcq9um8pZsWeBes5OzpPGxVBQbQ89AJ0Hqz8NPvRhdOQf?=
 =?iso-8859-1?Q?1X4FWy86bju4PA4ULAXoyWRncVRMqJLJO6GdFW1Po8UlBo?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d117c80c-1287-4f67-af57-08da2678c224
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 05:02:12.1149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q5GzQ9mIYJJeR0smJAun5D9r0+ySinet8kTei+oCQwFG3LnR7PNoaUIENwj07eGV+IirBrCIa/R81SRrlXIKlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2356
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Thank you Lyude!

I just have a tentative patch set to deal with this. Would like to give a t=
est on some platforms first.
If the result is positive, will send out for review immediately.

Thanks for tracking on this : )

Regards,
Wayne Lin

> -----Original Message-----
> From: Lyude Paul <lyude@redhat.com>
> Sent: Thursday, April 21, 2022 7:01 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping topology re=
f histories from debugfs
>
> Hey! Figured I'd check if there's been any status updates here since it's=
 been
> a while, just to make sure I haven't dropped this issue from my radar. No
> problem if you're busy :)
>
> On Wed, 2022-03-16 at 10:46 +0000, Lin, Wayne wrote:
> > [Public]
> >
> > > -----Original Message-----
> > > From: Lyude Paul <lyude@redhat.com>
> > > Sent: Wednesday, March 16, 2022 8:48 AM
> > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping topolog=
y ref
> > > histories from debugfs
> > >
> > > (Adding this back to the dri-devel mailing list since I didn't notice=
 it
> > > got
> > > dropped from there)
> > >
> > > Hm, some comments on this issue down below. Sorry for the delayed
> > > response, I
> > > was going to try this right after I finished the MST legacy removal b=
ut
> > > that's
> > > ending up taking longer than I hoped.
> > >
> > > On Tue, 2022-03-08 at 01:46 +0000, Lin, Wayne wrote:
> > > > [AMD Official Use Only]
> > > >
> > > > Oops...
> > > > I didn't notice that I replied to wrong mail previously : P
> > > > Sorry for the confusion and reply to the correct thread.
> > > >
> > > > Good day!
> > > > I probably know why you can't reproduce the issue there. Please ref=
er to
> > > > the
> > > > attached
> > > > patch file which makes me easier to explain this.
> > > >
> > > > In dm_dp_mst_get_modes(), we will create a new dc_sink by calling
> > > > dc_link_add_remote_sink() and add that dc_sink into the array dc_li=
nk-
> > > > > remote_sinks[].
> > > > However, if we find that aconnector->dc_sink is not null, then we w=
on't
> > > > create a new
> > > > dc_sink for that aconnector and won't add the sink to the array dc_=
link-
> > > > > remote_sinks[].
> > > >
> > > > When the issue that I mentioned before occurs, we won't be able to
> > > > release
> > > > the dc_sink
> > > > for the aconnector when we unplug the sst monitor. Hence, we can't
> > > > create
> > > > new dc_sink
> > > > for the latter on connected new stream sink of that port. Which lea=
ds to
> > > > two
> > > > issues
> > > > 1. Unplug monitor and plug in another monitor "to the same port"
> > > > =3D>  Since we use the same dc_sink to reflect the capability of th=
e new
> > > > connected stream
> > > > sink, we might send out inappropriate stream to the new connected s=
ink.
> > > > 2. Because we can't release dc_sink in the array dc_link-
> > > > >remote_sinks[],
> > > > when we
> > > > plug/unplug sst monitor to more than 4 different mst port, we will =
break
> > > > the
> > > > criteria
> > > > "dc_link->sink_count >=3D MAX_SINKS_PER_LINK" in
> > > > link_add_remote_sink_helper().
> > >
> > > Ok, a lot of this seems to be happening in amdgpu which certainly exp=
lains
> > > why
> > > I had so much trouble following along with this originally (also, hav=
ing
> > > learned a bit more about how DC works definitely has helped a bit). I
> > > already
> > > see a bunch of issues though with how this code is structured that wo=
uld
> > > definitely break things, though note I haven't sat down and tried thi=
s on
> > > a
> > > real machine yet - will try tomorrow.
> > >
> > > So - it seems like dc_sink =3D=3D a bunch of hotplugging state for a =
dm
> > > connector,
> > > which actually tells me for one that this is definitely the wrong spo=
t for
> > > this code. get_modes() really should just handle filling out DRM mode=
s and
> > > pretty much nothing else, because callers from DRM aren't going to ex=
pect
> > > side-effects like this when get_modes() is called - which could
> > > potentially
> > > lead to all sorts of weirdness down the line if the DRM call paths th=
at
> > > use
> > > this ever change. i915 and nouveau have good examples of what these
> > > functions
> > > should typically look like, and amdgpu actually seems to mostly follo=
w
> > > this
> > > advice for it's other get_modes() callback.
> > >
> > > Note there's also another problem here: the assumption "no EDID =3D=
=3D
> > > disconnected" isn't correct. It's totally possible to run into EDID-l=
ess
> > > displays if the display is some ancient pre-historic relic, or if the=
 ROM
> > > (or
> > > EEPROM? can't remember what type of chip computer displays tend to us=
e...)
> > > chip
> > > in the monitor containing the EDID has died. Note that the second
> > > situation is
> > > suprisingly more common then one might think! I ran into a 140Hz 4k A=
SUS
> > > display where this happened, and I know another friend of mine who ha=
d the
> > > ROM
> > > in their display die randomly as well.
> > >
> > > So with this being said: I, think the solution here is actually just =
to
> > > add/remove dc_sink from dm_dp_mst_detect() based on the CSN, and drop=
 the
> > > calls from get_modes()? detect() should always be called before the
> > > connector
> > > has been removed, and we could use the return status from
> > > drm_dp_mst_detect_port() in order to tell whether or not we should
> > > add/remove
> > > the dc_sink.
> >
> > Thank you Lyude for guiding me through! After your elaboration, I think=
 I
> > roughly
> > know the idea from drm perspective now. Let me get through this and wil=
l get
> > back
> > to you.
> >
> > >
> > > If you don't get to it first tomorrow, I'll see if I can reproduce th=
is
> > > locally and try writing up a patch.
> > >
> > > Also a final note: I don't think it's a good idea in general for ther=
e to
> > > be a
> > > fixed size array of dc_sinks like this. Those probably should just be
> > > stored
> > > somehow on a per-connector basis. I say this because in addition to t=
he
> > > fact
> >
> > Understand and agree with that. I plan to remove the constraint as well=
.
> > Thanks!
> >
> > > MST connectors aren't destroyed immediately (which could lead to a
> > > situation
> > > where we have more then 6 connected MST ports briefly before their
> > > destructors
> > > run, e.g. during suspend/resume reprobing).
> > >
> > > Also, one question below:
> > > >
> > > > Anyway, these are my steps to reproduce the issue.
> > > > I use a startech mst 1to4 mst hub, a sst monitor and a mst monitor.
> > > >
> > > > 1. boot up with sst monitor connected to the hub and plug the hub t=
o the
> > > > system.
> > > > 2. unplug/plug sst monitor to all left three different DP output po=
rts.
> > > > Which is used to
> > > > Pollute all four aconnectors to have them keep the stale dc_sinks.
> > > > 3. plug in the mst monitor to arbitrary ports. Since the new connec=
ted
> > > > mst
> > > > monitor will
> > > > have us add new mst port to the topology and attach a new aconnecto=
r for
> > > > that mst port,
> > > > we'll try to create a new dc_sink to that new aconnector and break =
the
> > > > sink_count
> > > > limitation. As you can see in the log the error message : "*ERROR*
> > > > Unable to
> > > > add a
> > > > remote sink"
> > > >
> > > > (Note that different hub might influence the result. Some hubs will=
 pull
> > > > down the HPD
> > > > when there is no monitor connected to its downstream ports which wi=
ll
> > > > run
> > > > into different
> > > > code flow)
> > >
> > > by "pull down" I assume you mean doing a long HPD instead of short (o=
r
> > > vice
> > > versa?).
> >
> > Yes, long HPD!
> >
> > Thanks for your help Lyude!
> > >
> > > >
> > > > I also attach the dmesg log under different debug level (0x104 & 0x=
116)
> > > > for
> > > > your reference.
> > > >
> > > > Please let me know if you can reproduce then : )
> > > >
> > > > Sorry about that Lyude and hope this time I send to the right threa=
d..
> > > > Really appreciate for your help!!!
> > > >
> > > > Regards,
> > > > Wayne
> > > > > -----Original Message-----
> > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > Sent: Wednesday, March 2, 2022 9:10 AM
> > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping top=
ology
> > > > > ref
> > > > > histories from debugfs
> > > > >
> > > > > Ran into some issues with my system yesterday (hooray being the f=
irst
> > > > > to
> > > > > find
> > > > > a rather annoying zsh bug that broke my scripts!), but I've final=
ly
> > > > > got
> > > > > things
> > > > > setup. I'm not able to reproduce this issue though (I've tried
> > > > > hotplugging
> > > > > the
> > > > > way you mentioned here, but nothing seems to leak), which makes m=
e
> > > > > think
> > > > > there's something special in your setup we might not have noticed=
.
> > > > >
> > > > > Do you think you could get some drm logs with drm.debug=3D0x116
> > > > > log_buf_len=3D50M
> > > > > from when this happens so I can get a better idea of the drm even=
ts
> > > > > leading up
> > > > > to this? Also, if you've been testing this in a GUI could you con=
firm
> > > > > whether
> > > > > this happens when you're just in a plain old VT?
> > > > >
> > > > > On Mon, 2022-02-28 at 16:43 -0500, Lyude Paul wrote:
> > > > > > Alright - starting to look into this now and setting up a syste=
m to
> > > > > > try
> > > > > > reproducing this, will let you know as soon as I've got results=
.
> > > > > > Sorry
> > > > > > again
> > > > > > about all of the delays
> > > > > >
> > > > > > On Fri, 2022-02-25 at 15:47 -0500, Lyude Paul wrote:
> > > > > > > I didn't get a chance yet, but I've gotten through most of my
> > > > > > > backlog
> > > > > > > now.
> > > > > > > Sorry about the delay - I've been catching up since I had to =
take
> > > > > > > two
> > > > > > > weeks
> > > > > > > off work very unexpectedly. I'll put aside time to look at th=
is
> > > > > > > first
> > > > > > > thing
> > > > > > > monday.
> > > > > > >
> > > > > > > On Fri, 2022-02-25 at 01:33 +0000, Lin, Wayne wrote:
> > > > > > > > [AMD Official Use Only]
> > > > > > > >
> > > > > > > > Hi Lyude,
> > > > > > > >
> > > > > > > > Good day!
> > > > > > > > Sorry to bother you, but would like to know if you can repr=
oduce
> > > > > > > > the
> > > > > > > > issue?
> > > > > > > >
> > > > > > > > Thanks!
> > > > > > > >
> > > > > > > > Regards,
> > > > > > > > Wayne
> > > > > > > >
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > > > Sent: Thursday, February 3, 2022 4:12 AM
> > > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dum=
ping
> > > > > > > > > topology
> > > > > > > > > ref
> > > > > > > > > histories from debugfs
> > > > > > > > >
> > > > > > > > > JFYI I should be able to respond to this soon, I think I'=
m
> > > > > > > > > following
> > > > > > > > > your
> > > > > > > > > issue a bit more (haven't gotten to go through the patche=
s too
> > > > > > > > > so
> > > > > > > > > I'm
> > > > > > > > > probably
> > > > > > > > > going to see if I can reproduce it locally as well. Sorry=
 for
> > > > > > > > > the
> > > > > > > > > delay
> > > > > > > > > -
> > > > > > > > > dealing with some X.org stuff and work issues at the mome=
nt
> > > > > > > > >
> > > > > > > > > On Tue, 2022-01-25 at 08:32 +0000, Lin, Wayne wrote:
> > > > > > > > > > [Public]
> > > > > > > > > >
> > > > > > > > > > Hey Lyude,
> > > > > > > > > >
> > > > > > > > > > Sorry, just got chance to get back to this and BIG THAN=
KS to
> > > > > > > > > > elaborating
> > > > > > > > > > in
> > > > > > > > > > such details!
> > > > > > > > > > Following are some of my comments : )
> > > > > > > > > >
> > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > > > > > Sent: Wednesday, January 19, 2022 9:59 AM
> > > > > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > > > > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for
> > > > > > > > > > > dumping
> > > > > > > > > > > topology
> > > > > > > > > > > ref
> > > > > > > > > > > histories from debugfs
> > > > > > > > > > >
> > > > > > > > > > > Hey - so, the original issue here was that payloads w=
ere
> > > > > > > > > > > not
> > > > > > > > > > > always
> > > > > > > > > > > deleted when we expected them to be - correct?
> > > > > > > > > >
> > > > > > > > > > Actually, what I was trying to do is not relevant to pa=
yload
> > > > > > > > > > maintenance.
> > > > > > > > > > What I wanted to do is having a way to notify
> > > > > > > > > > amdgpu to release its enumerated resource "dc_sink" whe=
n
> > > > > > > > > > unplug
> > > > > > > > > > event
> > > > > > > > > > occurs. Currently, under specific scenarios,
> > > > > > > > > > we can't release remote "dc_sink" and ends up can't all=
ocate
> > > > > > > > > > resource
> > > > > > > > > > for
> > > > > > > > > > new connected monitors. I'll explain the scenario
> > > > > > > > > > underneath.
> > > > > > > > > >
> > > > > > > > > > So, get back to the main issue that I was trying to sol=
ve
> > > > > > > > > > when I
> > > > > > > > > > pushed
> > > > > > > > > > the
> > > > > > > > > > patchset:
> > > > > > > > > >
> > > > >
> > >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work.kernel.org%2Fproject%2Fdri&amp;data=3D05%7C01
> %7Cwayne.lin%40amd.com%7C5f734314a44c4f8f82b908da2321b4c2%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C63786092
> 4939974636%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000
> %7C%7C%7C&amp;sdata=3DVtrMzZ2Evr%2BRCUCHIAUPUxqsRuuH9CW3jrNczubY%2BFc%3D&=
amp;reserved=3D0
> > > ayne.lin%40amd.com%7Cd77e829cfd3a466e25e508da06e6a9dd%7C3dd8961fe4884=
e608e
> > > 11a82d994e183d%7C0%7C0%7C637829885024
> > > 474689%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI
> > > 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sda
> > > ta=3DMvKilTT1CkBqZVK1N24JyNPjiPYORV%2FsCwvEzwx%2FIAk%3D&amp;reserved=
=3D0
> > > > > ayne.lin%40amd.com%7Cbbc27043edc04bf8067c08d9fbe9620c%7C3dd8961fe=
4884e
> > > > > 608e
> > > > > 11a82d994e183d%7C0%7C0%7C6378178020798
> > > > > 98960%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJB
> > > > > TiI6
> > > > > Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdat
> > > > > a=3DRVUc8KgTO3mhFL9qemshHJqiyXJs%2Fvytx21AMyUaW%2Bs%3D&amp;reserv=
ed=3D0
> > > > > > > > > > -
> > > > > > > > > devel%2Fcover%2F20210720160342.11415-1-
> > > > > > > > > Wayne.Lin%40amd.com%2F&amp;data=3D04%7C01%7Cwayne.lin%40a=
md.com%
> > > > > > > > > 7C2e
> > > > > > > > > 19d9
> > > > > > > > > 32
> > > > > > > > > 1b
> > > > > > > > > 5f4e948c1208d9e6884f24%7C3dd8961fe488
> > > > > > > > > 4e608e11a82d994e183d%7C0%7C0%7C637794295422403301%7CUnkno=
wn%7C
> > > > > > > > > TWFp
> > > > > > > > > bGZs
> > > > > > > > > b3
> > > > > > > > > d8
> > > > > > > > > eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> > > > > > > > > CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DrvtwQioO=
3pT1BoH
> > > > > > > > > b7S5
> > > > > > > > > 32ms
> > > > > > > > > Ra
> > > > > > > > > 61
> > > > > > > > > gP1vIyE8AB7M9I4E%3D&amp;reserved=3D0
> > > > > > > > > >
> > > > > > > > > > I was trying to fix some problems that I observed after
> > > > > > > > > > these 2
> > > > > > > > > > patches
> > > > > > > > > > * 09b974e8983 drm/amd/amdgpu_dm/mst: Remove -
> > > > > > > > > > > destroy_connector()
> > > > > > > > > > callback
> > > > > > > > > > * 72dc0f51591 drm/dp_mst: Remove
> > > > > > > > > > drm_dp_mst_topology_cbs.destroy_connector
> > > > > > > > > >
> > > > > > > > > > With above patches, it changes our flow to remove dc_si=
nk
> > > > > > > > > > (by
> > > > > > > > > > calling
> > > > > > > > > > dc_link_remote_sink()) when connector is about to be
> > > > > > > > > > destroyed. And let's see below use cases:
> > > > > > > > > > a). Disconnection happens between mst branch devices
> > > > > > > > > > e.g.
> > > > > > > > > > src - 1st_mstb - 2nd_mstb - sst_monitor =3D> src - 1st_=
mstb
> > > > > > > > > > (disconnect)
> > > > > > > > > > 2nd_mstb - sst_monitor
> > > > > > > > > >
> > > > > > > > > > In above case, after receiving CSN, we will put topolog=
y
> > > > > > > > > > reference
> > > > > > > > > > count
> > > > > > > > > > of
> > > > > > > > > > 2nd mstb and its port which connected to the sst monito=
r.
> > > > > > > > > > As you suggested before, we will destroy 2nd mst branch
> > > > > > > > > > device
> > > > > > > > > > and
> > > > > > > > > > its
> > > > > > > > > > all
> > > > > > > > > > ports due to there is no more mst path can route to the=
m.
> > > > > > > > > > As the result of that, we at end call
> > > > > > > > > > drm_dp_delayed_destroy_port()
> > > > > > > > > > and
> > > > > > > > > > unregister/put the drm connector and eventually call
> > > > > > > > > >  dc_link_remote_sink() to release the dc_sinck we enume=
rate
> > > > > > > > > > for
> > > > > > > > > > the
> > > > > > > > > > specific
> > > > > > > > > > stream sink of sst_monitor.
> > > > > > > > > >
> > > > > > > > > > However, in below case:
> > > > > > > > > > b). Disconnection happens between mst branch devices an=
d SST
> > > > > > > > > > monitor
> > > > > > > > > > e.g.
> > > > > > > > > > src - 1st_mstb - sst_monitor =3D> src - 1st_mstb (disco=
nnect)
> > > > > > > > > > sst_monitor
> > > > > > > > > >
> > > > > > > > > > In this case, which is the case having problem, it
> > > > > > > > > > definitely
> > > > > > > > > > won't
> > > > > > > > > > decrease
> > > > > > > > > > the topology references count of the port of 1st_mstb w=
hich
> > > > > > > > > > was connected to the sst monitor to zero since the port=
 is
> > > > > > > > > > still
> > > > > > > > > > existing in
> > > > > > > > > > the topology. Same as the malloc reference since the po=
rt
> > > > > > > > > > can't
> > > > > > > > > > get
> > > > > > > > > > destroyed. Hence, the port still exists and we won't ca=
ll
> > > > > > > > > > drm_dp_delayed_destroy_port() to unregister and put the=
 drm
> > > > > > > > > > connector.
> > > > > > > > > > As
> > > > > > > > > > the
> > > > > > > > > > result of that, we can't release corresponding remote
> > > > > > > > > > dc_sink
> > > > > > > > > > under
> > > > > > > > > > this
> > > > > > > > > > case. And after few times hotplugs, we can't create any=
 new
> > > > > > > > > > dc_sink since the number of stream sink is exceeding ou=
r
> > > > > > > > > > limitation.
> > > > > > > > > >
> > > > > > > > > > Hence, what I'm thinking here is to register a callback
> > > > > > > > > > function
> > > > > > > > > > for
> > > > > > > > > > notifying us that the remote sink is detached. This jus=
t
> > > > > > > > > > aligns
> > > > > > > > > > what
> > > > > > > > > > we
> > > > > > > > > > do
> > > > > > > > > > for handling long HPD event (unplug monitor from system=
) of
> > > > > > > > > > legacy
> > > > > > > > > > DP
> > > > > > > > > > (none
> > > > > > > > > > mst). For which case, once we detect long HPD event
> > > > > > > > > > indicating the monitor is detached, we will immediately=
 try
> > > > > > > > > > to
> > > > > > > > > > release
> > > > > > > > > > the
> > > > > > > > > > dc_link->local_sink and fire hotplug event to upper lay=
er.
> > > > > > > > > > Same as here, once receives a CSN message notifying a d=
rm
> > > > > > > > > > connector
> > > > > > > > > > is
> > > > > > > > > > changed from connected to disconnected, trigger the cal=
lback
> > > > > > > > > > function and we can try to release the dc_sink resource=
.
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > If I'm remembering that correctly, then (and I'm not =
100%
> > > > > > > > > > > sure
> > > > > > > > > > > on
> > > > > > > > > > > this
> > > > > > > > > > > yet) I might already have noticed something very poss=
ibly
> > > > > > > > > > > wonky in
> > > > > > > > > > > how we handle payload allocations currently, that I f=
ound
> > > > > > > > > > > while
> > > > > > > > > > > working on
> > > > > > > > > > > the non-atomic removal branch that I linked to you in=
 my
> > > > > > > > > > > previous response. Basically, in the
> > > > > > > > > > > step1() function it looks like that we follow this ge=
neral
> > > > > > > > > > > flow
> > > > > > > > > > > with
> > > > > > > > > > > updating
> > > > > > > > > > > payloads:
> > > > > > > > > > >
> > > > > > > > > > >  * Loop through proposed payloads and compare to
> > > > > > > > > > > previously
> > > > > > > > > > > programmed
> > > > > > > > > > >    payloads
> > > > > > > > > > >     - If a payload has a different allocation then it
> > > > > > > > > > > previously
> > > > > > > > > > > did,
> > > > > > > > > > > update the
> > > > > > > > > > >       payload
> > > > > > > > > > >     - If the payload is new, create it
> > > > > > > > > > >     - If a payload no longer has an allocation, remov=
e the
> > > > > > > > > > > payload
> > > > > > > > > > >
> > > > > > > > > > > At first glance this seems totally correct - but I'm =
not
> > > > > > > > > > > actually
> > > > > > > > > > > entirely
> > > > > > > > > > > convinced it is? Particularly because it seems like t=
he
> > > > > > > > > > > order
> > > > > > > > > > > in
> > > > > > > > > > > which
> > > > > > > > > > > we do creation/deletion of payloads is totally arbitr=
ary.
> > > > > > > > > > > To
> > > > > > > > > > > explain
> > > > > > > > > > > what
> > > > > > > > > > > I mean by that, consider a state transition like this=
:
> > > > > > > > > > >
> > > > > > > > > > > vcpi_slots=3D15 vcpi_slots=3D35 vcpi_slots=3D14
> > > > > > > > > > > > 1 | 2 |xxxxxxxx|
> > > > > > > > > > >
> > > > > > > > > > > Let's say we want to increase payload #1 from 15 to 5=
0,
> > > > > > > > > > > and
> > > > > > > > > > > disable
> > > > > > > > > > > payload #2 in the same atomic commit on DRM's side. I=
f the
> > > > > > > > > > > order
> > > > > > > > > > > we
> > > > > > > > > > > update payloads is entirely arbitrary, we could end u=
p
> > > > > > > > > > > doing
> > > > > > > > > > > this:
> > > > > > > > > > >
> > > > > > > > > > >  * Increase VCPI slots payload #1 from 15->50 (total =
VCPI
> > > > > > > > > > > slots=3D99,
> > > > > > > > > > > overflow!)
> > > > > > > > > > >  * Decrease VCPI slots payload #2 from 35->0  (total =
VCPI
> > > > > > > > > > > slots=3D50)
> > > > > > > > > > >
> > > > > > > > > > > Notice on the first step, we've technically overflowe=
d the
> > > > > > > > > > > available
> > > > > > > > > > > number of VCPI slots in the payload table. This is st=
ill
> > > > > > > > > > > before
> > > > > > > > > > > step
> > > > > > > > > > > 2
> > > > > > > > > > > though, and I could be totally wrong here - perhaps t=
his
> > > > > > > > > > > is
> > > > > > > > > > > entirely
> > > > > > > > > > > OK in
> > > > > > > > > > > the real world, and we're allowed to overflow VC slot=
s as
> > > > > > > > > > > long
> > > > > > > > > > > as
> > > > > > > > > >
> > > > > > > > > > I think it's forbidden to allocate time slots beyond 64=
 when
> > > > > > > > > > we're
> > > > > > > > > > updating
> > > > > > > > > > payload ID table of the branch in the real world. Branc=
h
> > > > > > > > > > probably
> > > > > > > > > > will NACK the DPCD write.
> > > > > > > > > >
> > > > > > > > > > > we repair the issue before step 2. But so far I can't=
 seem
> > > > > > > > > > > to
> > > > > > > > > > > find
> > > > > > > > > > > anything in the DP 2.0 spec that explicitly states th=
is
> > > > > > > > > > > would
> > > > > > > > > > > be
> > > > > > > > > > > OK
> > > > > > > > > > > -
> > > > > > > > > > > which
> > > > > > > > > > > makes me think we might fail some payload allocations=
 if
> > > > > > > > > > > we
> > > > > > > > > > > don't
> > > > > > > > > > > always
> > > > > > > > > > > ensure we avoid overflows in between VC payload table
> > > > > > > > > > > changes
> > > > > > > > > >
> > > > > > > > > > Agree.
> > > > > > > > > > For amdgpu, I think we always do deallocation (call hws=
-
> > > > > > > > > > > funcs.reset_hw_ctx_wrap()) before allocation
> > > > > > > > > > (apply_single_controller_ctx_to_hw()).
> > > > > > > > > >
> > > > > > > > > > > Note that avoiding overflows would be as simple as ju=
st
> > > > > > > > > > > making
> > > > > > > > > > > sure
> > > > > > > > > > > we
> > > > > > > > > > > send all VC payload table changes that free VC slots
> > > > > > > > > > > before
> > > > > > > > > > > sending
> > > > > > > > > > > any that take new slots.
> > > > > > > > > > >
> > > > > > > > > > > Again - I haven't actually confirmed this yet and am
> > > > > > > > > > > hoping to
> > > > > > > > > > > test
> > > > > > > > > > > stuff
> > > > > > > > > > > like this very soon as I'm pretty close finishing up =
the
> > > > > > > > > > > initial
> > > > > > > > > > > attempt
> > > > > > > > > > > at removing the non-atomic MST code in the DRM helper=
s
> > > > > > > > > > > now. If
> > > > > > > > > > > my
> > > > > > > > > > > theory
> > > > > > > > > > > ends up being correct here, I can fix this in my rewr=
ite
> > > > > > > > > > > of
> > > > > > > > > > > the
> > > > > > > > > > > MST payload management code. But I figured it might b=
e
> > > > > > > > > > > worth
> > > > > > > > > > > mentioning in
> > > > > > > > > > > the mean time in case you think it might be relevant =
to
> > > > > > > > > > > the
> > > > > > > > > > > problem here :).
> > > > > > > > > > >
> > > > > > > > > > > On Wed, 2022-01-12 at 16:47 -0500, Lyude Paul wrote:
> > > > > > > > > > > > (CC'ing this to dri-devel, since this is basically =
patch
> > > > > > > > > > > > review)
> > > > > > > > > > > >
> > > > > > > > > > > > Alright - so first off sorry about the broken debug=
ging
> > > > > > > > > > > > patch! I
> > > > > > > > > > > > thought I had tested that but I guess I hadn't test=
ed it
> > > > > > > > > > > > well
> > > > > > > > > > > > enough,
> > > > > > > > > > > > I'll get it fixed asap, but feel free to try gettin=
g to
> > > > > > > > > > > > it
> > > > > > > > > > > > before
> > > > > > > > > > > > I
> > > > > > > > > > > > do.
> > > > > > > > > > > >
> > > > > > > > > > > > As for this patch... (comments below)
> > > > > > > > > > > >
> > > > > > > > > > > > On Mon, 2021-12-20 at 02:17 +0000, Lin, Wayne wrote=
:
> > > > > > > > > > > > > [AMD Official Use Only]
> > > > > > > > > > > > >
> > > > > > > > > > > > > Hi Lyude,
> > > > > > > > > > > > >
> > > > > > > > > > > > > No rush and thanks for your time! : ) Just want t=
o
> > > > > > > > > > > > > help
> > > > > > > > > > > > > clarify
> > > > > > > > > > > > > what
> > > > > > > > > > > > > I mean that "registering a callback function"
> > > > > > > > > > > > > for CSN of disconnecting
> > > > > > > > > > > > > stream sink device (not mst branch case). Attach =
below
> > > > > > > > > > > > > the
> > > > > > > > > > > > > tentative
> > > > > > > > > > > > > patch that I planned to do. Thanks so much!
> > > > > > > > > > > > >
> > > > > > > > > > > > > Regards,
> > > > > > > > > > > > > Wayne
> > > > > > > > > > > > > ---
> > > > > > > > > > > > >  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | =
53
> > > > > > > > > > > > > +++++++++++++++++++
> > > > > > > > > > > > >  drivers/gpu/drm/drm_dp_mst_topology.c         | =
16
> > > > > > > > > > > > > +++++-
> > > > > > > > > > > > >  include/drm/drm_dp_mst_helper.h               | =
 1 +
> > > > > > > > > > > > >  3 files changed, 68 insertions(+), 2 deletions(-=
)
> > > > > > > > > > > > >
> > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm=
_mst_
> > > > > > > > > > > > > type
> > > > > > > > > > > > > s.c
> > > > > > > > > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm=
_mst_
> > > > > > > > > > > > > type
> > > > > > > > > > > > > s.c
> > > > > > > > > > > > > index cc34a35d0bcb..d7343c64908c 100644
> > > > > > > > > > > > > ---
> > > > > > > > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm=
_mst_
> > > > > > > > > > > > > type
> > > > > > > > > > > > > s.c
> > > > > > > > > > > > > +++
> > > > > > > > > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm=
_mst_
> > > > > > > > > > > > > type
> > > > > > > > > > > > > s.c
> > > > > > > > > > > > > @@ -472,8 +472,61 @@ dm_dp_add_mst_connector(stru=
ct
> > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > > > > > > >         return connector;
> > > > > > > > > > > > >  }
> > > > > > > > > > > > >
> > > > > > > > > > > > > +void dm_dp_notify_csn_disconnection(struct
> > > > > > > > > > > > > drm_connector
> > > > > > > > > > > > > +*connector) {
> > > > > > > > > > > > > +       struct amdgpu_dm_connector *aconnector =
=3D
> > > > > > > > > > > > > +               to_amdgpu_dm_connector(connector)=
;
> > > > > > > > > > > > > +       struct dc_sink *dc_sink =3D aconnector->d=
c_sink;
> > > > > > > > > > > > > +       struct dc_link *dc_link =3D aconnector->d=
c_link;
> > > > > > > > > > > > > +       struct amdgpu_device *adev =3D
> > > > > > > > > > > > > drm_to_adev(ddev);
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +       ASSERT(dc_link);
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +       if (dc_sink) {
> > > > > > > > > > > > > +               mutex_lock(&adev->dm.dc_lock);
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +               /*clear the remote sink of the li=
nk*/
> > > > > > > > > > > > > +               dc_link_remove_remote_sink(dc_lin=
k,
> > > > > > > > > > > > > dc_sink);
> > > > > > > > > > > > > +               dc_sink_release(dc_sink);
> > > > > > > > > > > > > +               aconnector->dc_sink =3D NULL;
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +               mutex_unlock(&adev->dm.dc_lock);
> > > > > > > > > > > > > +       }
> > > > > > > > > > > > > +}
> > > > > > > > > > > > > +
> > > > > > > > > > > > >  static const struct drm_dp_mst_topology_cbs
> > > > > > > > > > > > > dm_mst_cbs =3D
> > > > > > > > > > > > > {
> > > > > > > > > > > > >         .add_connector =3D dm_dp_add_mst_connecto=
r,
> > > > > > > > > > > > > +       .notify_csn_disconnection =3D
> > > > > > > > > > > > > dm_dp_notify_csn_disconnection,
> > > > > > > > > > > > >  };
> > > > > > > > > > > >
> > > > > > > > > > > > I still don't really think this is a good idea. Thi=
s
> > > > > > > > > > > > seems
> > > > > > > > > > > > like
> > > > > > > > > > > > it's
> > > > > > > > > > > > just adding another hotplugging path to the code in
> > > > > > > > > > > > order to
> > > > > > > > > > > > avoid
> > > > > > > > > > > > sending hotplugs for non-endpoint devices. In addit=
ion
> > > > > > > > > > > > to
> > > > > > > > > > > > the
> > > > > > > > > >
> > > > > > > > > > So, what I wanted to do is to add a callback function f=
or
> > > > > > > > > > endpoint
> > > > > > > > > > devices
> > > > > > > > > > case as described above. For disconnection of non-endpo=
int
> > > > > > > > > > devices
> > > > > > > > > > is
> > > > > > > > > > already taken care by current code.
> > > > > > > > > >
> > > > > > > > > > > > drm_connector issues I mentioned before, we also re=
ally
> > > > > > > > > > > > need
> > > > > > > > > > > > to
> > > > > > > > > > > > stop
> > > > > > > > > > > > doing any kind of payload maintence in hotplugging
> > > > > > > > > > > > paths.
> > > > > > > > > > > > The
> > > > > > > > > > > > reality
> > > > > > > > > > > > is any kind of payload maintanence we do outside of
> > > > > > > > > > > > normal
> > > > > > > > > > > > modesetting
> > > > > > > > > > > > paths is a relic from legacy modesetting that I'm
> > > > > > > > > > > > dropping
> > > > > > > > > > > > ASAP
> > > > > > > > > > > > (more
> > > > > > > > > > > > on this below), and we can't keep adding to it beca=
use
> > > > > > > > > > > > it
> > > > > > > > > > > > dramatically
> > > > > > > > > > > > complicates maintanence as well.
> > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > Sorry for repeating this point so often but - the
> > > > > > > > > > > > biggest
> > > > > > > > > > > > issue
> > > > > > > > > > > > too
> > > > > > > > > > > > is
> > > > > > > > > > > > I'm still not sure what it is we're even avoiding h=
ere.
> > > > > > > > > > > > We
> > > > > > > > > > > > know
> > > > > > > > > > > > resources aren't released consistently, and that we=
're
> > > > > > > > > > > > able
> > > > > > > > > > > > to
> > > > > > > > > > > > reproduce the behavior with repeated hotplugs. We a=
lso
> > > > > > > > > > > > know
> > > > > > > > > > > > that
> > > > > > > > > > > > if
> > > > > > > > > > > > we
> > > > > > > > > > > > skip sending certain hotplug events, that fixes the
> > > > > > > > > > > > issue.
> > > > > > > > > > > > And
> > > > > > > > > > > > we
> > > > > > > > > > > > know
> > > > > > > > > > > > we can workaround it by adding a special case for
> > > > > > > > > > > > forcing a
> > > > > > > > > > > > payload
> > > > > > > > > > > > release in DC. But none of those actually tell us
> > > > > > > > > > > > exactly
> > > > > > > > > > > > what
> > > > > > > > > > > > piece
> > > > > > > > > > > > of code is leaking and why, which means that any
> > > > > > > > > > > > workarounds
> > > > > > > > > > > > we're
> > > > > > > > > > > > putting in to avoid this mysterious guilty section =
of
> > > > > > > > > > > > code
> > > > > > > > > > > > we
> > > > > > > > > > > > don't
> > > > > > > > > > > > entirely understand either - which means we're just
> > > > > > > > > > > > adding
> > > > > > > > > > > > more
> > > > > > > > > > > > code
> > > > > > > > > > > > in that no one actually fully understands. This jus=
t
> > > > > > > > > > > > ends up
> > > > > > > > > > > > making
> > > > > > > > > > > > maintence difficult because every change in code ne=
arby
> > > > > > > > > > > > workarounds
> > > > > > > > > > > > like this has to strugle to try to figure out said
> > > > > > > > > > > > workarounds
> > > > > > > > > > > > in
> > > > > > > > > > > > order to avoid breaking things.
> > > > > > > > > >
> > > > > > > > > > Thank you Lyude for the reminder and I totally agree wi=
th
> > > > > > > > > > you by
> > > > > > > > > > avoiding
> > > > > > > > > > adding workaround since it will get the code maintenanc=
e
> > > > > > > > > > harder.
> > > > > > > > > > And
> > > > > > > > > > I
> > > > > > > > > > think the root cause of the issue that I observed befor=
e is
> > > > > > > > > > quite
> > > > > > > > > > concrete.
> > > > > > > > > > There is no code path for us to release dc_sink under t=
he
> > > > > > > > > > unplug
> > > > > > > > > > scenario
> > > > > > > > > > that I described above.
> > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > I'm actually currently running into these "later" i=
ssues
> > > > > > > > > > > > right
> > > > > > > > > > > > now,
> > > > > > > > > > > > as
> > > > > > > > > > > > recently I've (-actively-, finally!!!) been working=
 on
> > > > > > > > > > > > trying to
> > > > > > > > > > > > remove as much non-atomic MST as I can because. As =
it
> > > > > > > > > > > > turns
> > > > > > > > > > > > out
> > > > > > > > > > > > -
> > > > > > > > > > > > a
> > > > > > > > > > > > huge amount of the payload maintanence code just is=
n't
> > > > > > > > > > > > needed at
> > > > > > > > > > > > all
> > > > > > > > > > > > when we stop caring about non-atomic drivers and st=
ick
> > > > > > > > > > > > everything
> > > > > > > > > > > > in
> > > > > > > > > > > > atomic state structs. Step 1 for updating updating =
the
> > > > > > > > > > > > payload
> > > > > > > > > > > > table,
> > > > > > > > > > > > e.g. drm_dp_update_payload_part1(), is a great exam=
ple
> > > > > > > > > > > > of
> > > > > > > > > > > > how
> > > > > > > > > > > > messy
> > > > > > > > > > > > things have become. Here's a small sample of some o=
f the
> > > > > > > > > > > > stuff
> > > > > > > > > > > > I've
> > > > > > > > > > > > seen from just that one function so far that either=
 just
> > > > > > > > > > > > don't
> > > > > > > > > > > > make
> > > > > > > > > > > > sense here or is totally redundant. I should note t=
hat a
> > > > > > > > > > > > lot
> > > > > > > > > > > > of
> > > > > > > > > > > > these
> > > > > > > > > > > > things also come from patches I reviwed, but didn't
> > > > > > > > > > > > really
> > > > > > > > > > > > look
> > > > > > > > > > > > at
> > > > > > > > > > > > as
> > > > > > > > > > > > closely as I should have because I was swamped at w=
ork,
> > > > > > > > > > > > some
> > > > > > > > > > > > are
> > > > > > > > > > > > historical artifacts, and others are less-than-idea=
l
> > > > > > > > > > > > patches
> > > > > > > > > > > > I
> > > > > > > > > > > > got
> > > > > > > > > > > > wrote myself when I was first started working on MS=
T and
> > > > > > > > > > > > didn't
> > > > > > > > > > > > know
> > > > > > > > > > > > the code as well as I do
> > > > > > > > > > > > now:
> > > > > > > > > > > >
> > > > > > > > > > > >  * We try to avoid some sort of userspace issue by =
using
> > > > > > > > > > > >    drm_dp_mst_port_downstream_of_branch() to avoid
> > > > > > > > > > > > releasing
> > > > > > > > > > > > payloads
> > > > > > > > > > > > for a
> > > > > > > > > > > >    branch if we can't prove it's downstream of the =
top
> > > > > > > > > > > > of
> > > > > > > > > > > > the
> > > > > > > > > > > > topology. This
> > > > > > > > > > > >    seems to workaround either a userspace bug. This=
 is a
> > > > > > > > > > > > redundant,
> > > > > > > > > > > > since
> > > > > > > > > > > >    that's what topology refs are already supposed t=
o be
> > > > > > > > > > > > doing to
> > > > > > > > > > > > the
> > > > > > > > > > > > extent is
> > > > > > > > > > > >    reasonably possibly. It's also unfortunately rac=
y
> > > > > > > > > > > > solution
> > > > > > > > > > > > because
> > > > > > > > > > > > we have
> > > > > > > > > > > >    to be able to handle the situation where a conne=
ctor
> > > > > > > > > > > > is
> > > > > > > > > > > > removed
> > > > > > > > > > > > from under
> > > > > > > > > > > >    us. That can happen at any time, including
> > > > > > > > > > > > _immediately_
> > > > > > > > > > > > after
> > > > > > > > > > > > we
> > > > > > > > > > > > call
> > > > > > > > > > > >    drm_dp_mst_port_downstream_of_branch() - renderi=
ng
> > > > > > > > > > > > the
> > > > > > > > > > > > call
> > > > > > > > > > > > not
> > > > > > > > > > > > really
> > > > > > > > > > > >    useful.
> > > > > > > > > > > >  * If we fail to validate the sink in
> > > > > > > > > > > > drm_dp_update_payload_part,
> > > > > > > > > > > > we
> > > > > > > > > > > > don't
> > > > > > > > > > > >    update the payload table. I think at best this
> > > > > > > > > > > > solution
> > > > > > > > > > > > is
> > > > > > > > > > > > racy
> > > > > > > > > > > > and
> > > > > > > > > > > > not
> > > > > > > > > > > >    useful, at worst it leaves us with a payload tab=
le
> > > > > > > > > > > > that
> > > > > > > > > > > > doesn't
> > > > > > > > > > > > match what
> > > > > > > > > > > >    we attempted to set in the atomic state - which =
at
> > > > > > > > > > > > worst
> > > > > > > > > > > > brings
> > > > > > > > > > > > us
> > > > > > > > > > > > into
> > > > > > > > > > > >    undefined territory where we're just plain out o=
f
> > > > > > > > > > > > sync
> > > > > > > > > > > > with
> > > > > > > > > > > > the
> > > > > > > > > > > > reality in
> > > > > > > > > > > >    hw.
> > > > > > > > > > > >  * Actually fun fact - mgr->payloads and mgr-
> > > > > > > > > > > > >proposed_vcpis
> > > > > > > > > > > > both
> > > > > > > > > > > > can
> > > > > > > > > > > > and
> > > > > > > > > > > >    definitely should be removed entirely. All of th=
e
> > > > > > > > > > > > info
> > > > > > > > > > > > for
> > > > > > > > > > > > mgr->payloads
> > > > > > > > > > > >    could just be in the atomic state, because that =
+ the
> > > > > > > > > > > > magic
> > > > > > > > > > > > of
> > > > > > > > > > > > atomic state
> > > > > > > > > > > >    duplication means we'll also have an accurate vi=
ew of
> > > > > > > > > > > > the
> > > > > > > > > > > > previous
> > > > > > > > > > > > state's
> > > > > > > > > > > >    payload allocations: which renders mgr-
> > > > > > > > > > > > >proposed_vcpis
> > > > > > > > > > > > redundant.
> > > > > > > > > > > >
> > > > > > > > > > > > Apologies for the long explanation again, but I hop=
e
> > > > > > > > > > > > that
> > > > > > > > > > > > explains
> > > > > > > > > > > > my
> > > > > > > > > >
> > > > > > > > > > Really really thanks for your kindly help on this : )
> > > > > > > > > > I'll try my best to get to your WIP branch soon. Thank =
you
> > > > > > > > > > Lyude!
> > > > > > > > > >
> > > > > > > > > > > > point here a bit. I'm going to be trying to get to
> > > > > > > > > > > > moving
> > > > > > > > > > > > amdgpu's
> > > > > > > > > > > > DSC
> > > > > > > > > > > > code out of amdgpu and into DRM helpers as well soo=
n, so
> > > > > > > > > > > > I'm
> > > > > > > > > > > > really
> > > > > > > > > > > > determined to clean stuff up beforehand as every ti=
me
> > > > > > > > > > > > I've
> > > > > > > > > > > > done
> > > > > > > > > > > > so
> > > > > > > > > > > > it's become substantially easier to make changes to=
 this
> > > > > > > > > > > > code.
> > > > > > > > > > > > Things
> > > > > > > > > > > > used to be even worse before I started cleaning thi=
ngs
> > > > > > > > > > > > up 2
> > > > > > > > > > > > or 3
> > > > > > > > > > > > years
> > > > > > > > > > > > ago, where simple changes would end up getting me s=
tuck
> > > > > > > > > > > > spending
> > > > > > > > > > > > hours
> > > > > > > > > > > > trying to dig through lockdep or memory manegement
> > > > > > > > > > > > issues.
> > > > > > > > > > > > As
> > > > > > > > > > > > well,
> > > > > > > > > > > > I
> > > > > > > > > > > > would be entirely unsurprised if bugs like this ver=
y
> > > > > > > > > > > > payload
> > > > > > > > > > > > leak
> > > > > > > > > > > > we're working on just disappear once we've gotten r=
id of
> > > > > > > > > > > > all
> > > > > > > > > > > > the
> > > > > > > > > > > > extraneous workarounds and state tracking here -
> > > > > > > > > > > > especially
> > > > > > > > > > > > with
> > > > > > > > > > > > how
> > > > > > > > > > > > many special cases we have for maintaining the payl=
oad
> > > > > > > > > > > > table
> > > > > > > > > > > > right
> > > > > > > > > > > > now. That's certainly ended up being the case in th=
e
> > > > > > > > > > > > past
> > > > > > > > > > > > with a
> > > > > > > > > > > > number of other difficult to track down issues I've
> > > > > > > > > > > > dealt
> > > > > > > > > > > > with
> > > > > > > > > > > > in
> > > > > > > > > > > > MST.
> > > > > > > > > > > >
> > > > > > > > > > > > Anyhow. I've been way more productive this year the=
n
> > > > > > > > > > > > last
> > > > > > > > > > > > because
> > > > > > > > > > > > I
> > > > > > > > > > > > had over a month off work and am finally not super =
burnt
> > > > > > > > > > > > out
> > > > > > > > > > > > from
> > > > > > > > > > > > my
> > > > > > > > > > > > job, and so far I've been making progress on the pa=
yload
> > > > > > > > > > > > state
> > > > > > > > > > > > cleanup
> > > > > > > > > > > > far faster then I was last year :). I think if you =
can't
> > > > > > > > > > > > figure
> > > > > > > > > > > > out
> > > > > > > > > > > > where the leak is coming from even once I get the
> > > > > > > > > > > > debugging
> > > > > > > > > > > > patches
> > > > > > > > > > > > I
> > > > > > > > > > > > mentioned fixed up, it might be a good idea for us =
to
> > > > > > > > > > > > try
> > > > > > > > > > > > again
> > > > > > > > > > > > after
> > > > > > > > > > > > I've got some of this code cleaned up. I've got a
> > > > > > > > > > > > currently
> > > > > > > > > > > > WIP
> > > > > > > > > > > > branch
> > > > > > > > > > > > here:
> > > > > > > > > > > >
> > > > > > > > > > > > https://nam11.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgitl
> > > > > > > > > > > > ab.freedesktop.org%2Flyudess%2Flinux%2F-
> > > > > > > > > > > > %2Fcommit%2F624dd68fa804e64b5b
> > > > > > > > > > > > 2060e4735d7317090692b5&amp;data=3D04%7C01%7Cwayne.l=
in%40am
> > > > > > > > > > > > d.co
> > > > > > > > > > > > m%7C
> > > > > > > > > > > > d4
> > > > > > > > > > > > bd
> > > > > > > > > > > > c7
> > > > > > > > > > > > 59eb274bfccc8208d9daef41fe%7C3dd8961fe4884e608e11a8=
2d994
> > > > > > > > > > > > e183
> > > > > > > > > > > > d%7C
> > > > > > > > > > > > 0%
> > > > > > > > > > > > 7C
> > > > > > > > > > > > 0%
> > > > > > > > > > > > 7C637781543416430632%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4
> > > > > > > > > > > > wLjA
> > > > > > > > > > > > wMDA
> > > > > > > > > > > > iL
> > > > > > > > > > > > CJ
> > > > > > > > > > > > QI
> > > > > > > > > > > > joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&am=
p;sda
> > > > > > > > > > > > ta=3Dn
> > > > > > > > > > > > FpVl
> > > > > > > > > > > > %2
> > > > > > > > > > > > BV
> > > > > > > > > > > > oF
> > > > > > > > > > > > 40JPabfRMcR6Cz7ZHDwt%2BBpLDBNdXftJaA%3D&amp;reserve=
d=3D0
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > >  void amdgpu_dm_initialize_dp_connector(struct
> > > > > > > > > > > > > amdgpu_display_manager *dm, diff --git
> > > > > > > > > > > > > a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > index 857c5d15e81d..a70e26c5d084 100644
> > > > > > > > > > > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > @@ -2508,6 +2508,7 @@
> > > > > > > > > > > > > drm_dp_mst_handle_conn_stat(struct
> > > > > > > > > > > > > drm_dp_mst_branch *mstb,
> > > > > > > > > > > > >         u8 new_pdt;
> > > > > > > > > > > > >         bool new_mcs;
> > > > > > > > > > > > >         bool dowork =3D false, create_connector =
=3D false;
> > > > > > > > > > > > > +       bool notify_unplug_event =3D false;
> > > > > > > > > > > > >
> > > > > > > > > > > > >         port =3D drm_dp_get_port(mstb, conn_stat-
> > > > > > > > > > > > > > port_number);
> > > > > > > > > > > > >         if (!port)
> > > > > > > > > > > > > @@ -2520,6 +2521,9 @@
> > > > > > > > > > > > > drm_dp_mst_handle_conn_stat(struct
> > > > > > > > > > > > > drm_dp_mst_branch *mstb,
> > > > > > > > > > > > >                          * port, so just throw th=
e
> > > > > > > > > > > > > port
> > > > > > > > > > > > > out
> > > > > > > > > > > > > and
> > > > > > > > > > > > > make
> > > > > > > > > > > > > sure we
> > > > > > > > > > > > >                          * reprobe the link addre=
ss of
> > > > > > > > > > > > > it's
> > > > > > > > > > > > > parent
> > > > > > > > > > > > > MSTB
> > > > > > > > > > > > >                          */
> > > > > > > > > > > > > +                       /* should also consider
> > > > > > > > > > > > > notify_unplug_event
> > > > > > > > > > > > > here.
> > > > > > > > > > > > > +                        * but it's not a normal =
case
> > > > > > > > > > > > > for
> > > > > > > > > > > > > products
> > > > > > > > > > > > > +in the
> > > > > > > > > > > > > market
> > > > > > > > > > > > > +                        */
> > > > > > > > > > > > >
> > > > > > > > > > > > > drm_dp_mst_topology_unlink_port(mgr,
> > > > > > > > > > > > > port);
> > > > > > > > > > > > >                         mstb->link_address_sent =
=3D
> > > > > > > > > > > > > false;
> > > > > > > > > > > > >                         dowork =3D true; @@ -2541=
,10
> > > > > > > > > > > > > +2545,14 @@
> > > > > > > > > > > > > drm_dp_mst_handle_conn_stat(struct
> > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > *mstb,
> > > > > > > > > > > > >         port->ddps =3D conn_stat-
> > > > > > > > > > > > > > displayport_device_plug_status;
> > > > > > > > > > > > >
> > > > > > > > > > > > >         if (old_ddps !=3D port->ddps) {
> > > > > > > > > > > > > -               if (port->ddps && !port->input)
> > > > > > > > > > > > > +               if (port->ddps && !port->input) {
> > > > > > > > > > > > >
> > > > > > > > > > > > > drm_dp_send_enum_path_resources(mgr,
> > > > > > > > > > > > > mstb,
> > > > > > > > > > > > > port);
> > > > > > > > > > > > > -               else
> > > > > > > > > > > > > +               } else {
> > > > > > > > > > > > >                         port->full_pbn =3D 0;
> > > > > > > > > > > > > +                       if (port->connector &&
> > > > > > > > > > > > > +
> > > > > > > > > > > > > drm_dp_mst_is_end_device(port-
> > > > > > > > > > > > > > pdt,
> > > > > > > > > > > > > +port-
> > > > > > > > > > > > > > mcs))
> > > > > > > > > > > > > +                               notify_unplug_eve=
nt =3D
> > > > > > > > > > > > > true;
> > > > > > > > > > > > > +               }
> > > > > > > > > > > > >         }
> > > > > > > > > > > > >
> > > > > > > > > > > > >         new_pdt =3D port->input ? DP_PEER_DEVICE_=
NONE :
> > > > > > > > > > > > > conn_stat-
> > > > > > > > > > > > > > peer_device_type;
> > > > > > > > > > > > > @@ -2557,11 +2565,15 @@
> > > > > > > > > > > > > drm_dp_mst_handle_conn_stat(struct
> > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > *mstb,
> > > > > > > > > > > > >                 dowork =3D false;
> > > > > > > > > > > > >         }
> > > > > > > > > > > > >
> > > > > > > > > > > > > +       if (notify_unplug_event &&
> > > > > > > > > > > > > +mgr->cbs->notify_csn_disconnection)
> > > > > > > > > > > > > +               mgr->cbs-
> > > > > > > > > > > > > >notify_csn_disconnection(port-
> > > > > > > > > > > > > > connector);
> > > > > > > > > > > > > +
> > > > > > > > > > > > >         if (port->connector)
> > > > > > > > > > > > >                 drm_modeset_unlock(&mgr->base.loc=
k);
> > > > > > > > > > > > >         else if (create_connector)
> > > > > > > > > > > > >                 drm_dp_mst_port_add_connector(mst=
b,
> > > > > > > > > > > > > port);
> > > > > > > > > > > > >
> > > > > > > > > > > > > +
> > > > > > > > > > > > >  out:
> > > > > > > > > > > > >         drm_dp_mst_topology_put_port(port);
> > > > > > > > > > > > >         if (dowork)
> > > > > > > > > > > > > diff --git a/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > b/include/drm/drm_dp_mst_helper.h index
> > > > > > > > > > > > > 78044ac5b59b..ff9e47729841
> > > > > > > > > > > > > 100644
> > > > > > > > > > > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > @@ -525,6 +525,7 @@ struct drm_dp_mst_topology_cb=
s {
> > > > > > > > > > > > >          * IRQ pulse handler.
> > > > > > > > > > > > >          */
> > > > > > > > > > > > >         void (*poll_hpd_irq)(struct
> > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > *mgr);
> > > > > > > > > > > > > +       void (*notify_csn_disconnection)(struct
> > > > > > > > > > > > > drm_connector
> > > > > > > > > > > > > +*connector);
> > > > > > > > > > > > >  };
> > > > > > > > > > > > >
> > > > > > > > > > > > >  #define DP_MAX_PAYLOAD (sizeof(unsigned long) * =
8)
> > > > > > > > > > > > > --
> > > > > > > > > > > > > 2.31.0
> > > > > > > > > > > > >
> > > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > > From: Lin, Wayne
> > > > > > > > > > > > > > Sent: Wednesday, December 8, 2021 11:39 AM
> > > > > > > > > > > > > > To: 'Lyude Paul' <lyude@redhat.com>
> > > > > > > > > > > > > > Subject: RE: [PATCH] WIP: drm/dp_mst: Add suppo=
rt
> > > > > > > > > > > > > > for
> > > > > > > > > > > > > > dumping
> > > > > > > > > > > > > > topology ref histories from debugfs
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > No worries Lyude!
> > > > > > > > > > > > > > Thanks for keeping helping on this. Take your t=
ime :
> > > > > > > > > > > > > > )
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > > > > > > > > > Sent: Wednesday, December 8, 2021 7:05 AM
> > > > > > > > > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > > > > > > > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add sup=
port
> > > > > > > > > > > > > > > for
> > > > > > > > > > > > > > > dumping
> > > > > > > > > > > > > > > topology ref histories from debugfs
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Sorry! I will try to get to this tomorrow, if=
 not
> > > > > > > > > > > > > > > then
> > > > > > > > > > > > > > > sometime
> > > > > > > > > > > > > > > this week.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Tue, 2021-11-30 at 08:41 +0000, Lin, Wayne
> > > > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > > > [Public]
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Hi Lyude,
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Finally have some bandwidth to get back to =
this
> > > > > > > > > > > > > > > > problem!
> > > > > > > > > > > > > > > > I roughly went through this patch and I'm j=
ust
> > > > > > > > > > > > > > > > aware
> > > > > > > > > > > > > > > > that
> > > > > > > > > > > > > > > > we
> > > > > > > > > > > > > > > > already have such kind of convenient tool f=
or a
> > > > > > > > > > > > > > > > while.
> > > > > > > > > > > > > > > > I think it's definitely useful for us to tr=
ack
> > > > > > > > > > > > > > > > port/mstb
> > > > > > > > > > > > > > > > reference count issues and I'll start to em=
brace
> > > > > > > > > > > > > > > > this
> > > > > > > > > > > > > > > > feature
> > > > > > > > > > > > > > > > for cleaning up those issues. Thank you Lyu=
de!
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > However, I think the issue that I was tryin=
g to
> > > > > > > > > > > > > > > > fix
> > > > > > > > > > > > > > > > is
> > > > > > > > > > > > > > > > not
> > > > > > > > > > > > > > > > related to what you suggested:
> > > > > > > > > > > > > > > > " The idea here is that if stream resources
> > > > > > > > > > > > > > > > aren't
> > > > > > > > > > > > > > > > being
> > > > > > > > > > > > > > > > released, my guess would be that we're not
> > > > > > > > > > > > > > > > dropping
> > > > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > > > references for the port which means the
> > > > > > > > > > > > > > > > connector
> > > > > > > > > > > > > > > > never
> > > > > > > > > > > > > > > > goes
> > > > > > > > > > > > > > > > away."
> > > > > > > > > > > > > > > > The issue I was trying to fix is about rele=
asing
> > > > > > > > > > > > > > > > dc_link->remote_sinks while receiving a CSN
> > > > > > > > > > > > > > > > message
> > > > > > > > > > > > > > > > notifying
> > > > > > > > > > > > > > > > the connection status of a sst connector of=
 a
> > > > > > > > > > > > > > > > port
> > > > > > > > > > > > > > > > changed
> > > > > > > > > > > > > > > > from connected to disconnected. Not the
> > > > > > > > > > > > > > > > connection
> > > > > > > > > > > > > > > > status
> > > > > > > > > > > > > > > > changed of a mst branch device.
> > > > > > > > > > > > > > > > e.g.
> > > > > > > > > > > > > > > > src - 1st_mstb - 2nd_mstb - sst_monitor =3D=
> src -
> > > > > > > > > > > > > > > > 1st_mstb
> > > > > > > > > > > > > > > > (disconnect) 2nd_mstb - sst_monitor
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > In above case, after receiving CSN, we will=
 put
> > > > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > > > references of 2nd mstb and its port which i=
s
> > > > > > > > > > > > > > > > connected
> > > > > > > > > > > > > > > > with
> > > > > > > > > > > > > > > > the sst monitor. As the result of that, we =
can
> > > > > > > > > > > > > > > > call
> > > > > > > > > > > > > > > > drm_dp_delayed_destroy_port() to unregister=
 and
> > > > > > > > > > > > > > > > put
> > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > drm
> > > > > > > > > > > > > > > > connector.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > However, in below case:
> > > > > > > > > > > > > > > > e.g.
> > > > > > > > > > > > > > > > src - 1st_mstb - sst_monitor =3D> src - 1st=
_mstb
> > > > > > > > > > > > > > > > (disconnect)
> > > > > > > > > > > > > > > > sst_monitor
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > In this case, which is the case having prob=
lem,
> > > > > > > > > > > > > > > > it
> > > > > > > > > > > > > > > > definitely
> > > > > > > > > > > > > > > > won't decrease the topology references coun=
t of
> > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > port
> > > > > > > > > > > > > > > > which
> > > > > > > > > > > > > > > > was connected to the sst monitor to zero si=
nce
> > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > port
> > > > > > > > > > > > > > > > is
> > > > > > > > > > > > > > > > still existing in the topology. Same as the
> > > > > > > > > > > > > > > > malloc
> > > > > > > > > > > > > > > > reference
> > > > > > > > > > > > > > > > since the port can't get destroyed. Hence, =
the
> > > > > > > > > > > > > > > > port
> > > > > > > > > > > > > > > > still
> > > > > > > > > > > > > > > > exists  and we won't call
> > > > > > > > > > > > > > > > drm_dp_delayed_destroy_port() to unregister=
 and
> > > > > > > > > > > > > > > > put
> > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > drm
> > > > > > > > > > > > > > > > connector.
> > > > > > > > > > > > > > > > I looked up the code and
> > > > > > > > > > > > > > > > drm_dp_delayed_destroy_port()
> > > > > > > > > > > > > > > > seems
> > > > > > > > > > > > > > > > like the only place to call drm_connector_p=
ut()
> > > > > > > > > > > > > > > > which
> > > > > > > > > > > > > > > > means
> > > > > > > > > > > > > > > > we
> > > > > > > > > > > > > > > > can't put reference count of drm connector =
under
> > > > > > > > > > > > > > > > this
> > > > > > > > > > > > > > > > case
> > > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > > can't release dc_sink resource by destroyin=
g drm
> > > > > > > > > > > > > > > > connector.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > I would also like to point out that this
> > > > > > > > > > > > > > > > resource
> > > > > > > > > > > > > > > > (remote_sinks) is specific to different str=
eam
> > > > > > > > > > > > > > > > sinks. So
> > > > > > > > > > > > > > > > if
> > > > > > > > > > > > > > > > we're trying to release this dc_sink resour=
ce by
> > > > > > > > > > > > > > > > destroying
> > > > > > > > > > > > > > > > the drm connector, it conflicts the idea th=
at
> > > > > > > > > > > > > > > > you
> > > > > > > > > > > > > > > > suggested
> > > > > > > > > > > > > > > > before that we should always keep the drm
> > > > > > > > > > > > > > > > connector
> > > > > > > > > > > > > > > > until
> > > > > > > > > > > > > > > > it's
> > > > > > > > > > > > > > > > no longer reachable in the topology.
> > > > > > > > > > > > > > > > Releasing dc_sink should be binding with th=
e
> > > > > > > > > > > > > > > > disconnection
> > > > > > > > > > > > > > > > event.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > I understand your concern that we should no=
t
> > > > > > > > > > > > > > > > just
> > > > > > > > > > > > > > > > easily
> > > > > > > > > > > > > > > > change the logic here since it's the result
> > > > > > > > > > > > > > > > after
> > > > > > > > > > > > > > > > solving
> > > > > > > > > > > > > > > > tons
> > > > > > > > > > > > > > > > of bugs before and might cause other side
> > > > > > > > > > > > > > > > effect.
> > > > > > > > > > > > > > > > So,
> > > > > > > > > > > > > > > > just
> > > > > > > > > > > > > > > > my
> > > > > > > > > > > > > > > > 2 cents, what I'm thinking is to register a
> > > > > > > > > > > > > > > > callback
> > > > > > > > > > > > > > > > function
> > > > > > > > > > > > > > > > for our driver to notify us that the remote=
 sink
> > > > > > > > > > > > > > > > is
> > > > > > > > > > > > > > > > detached.
> > > > > > > > > > > > > > > > This just aligns our flow handling long HPD
> > > > > > > > > > > > > > > > event of
> > > > > > > > > > > > > > > > legacy
> > > > > > > > > > > > > > > > (sst) DP.
> > > > > > > > > > > > > > > > For sst case, once we detect long HPD event
> > > > > > > > > > > > > > > > indicating
> > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > monitor is detached, we will immediately tr=
y to
> > > > > > > > > > > > > > > > release
> > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > dc_link->local_sink and fire hotplug event =
to
> > > > > > > > > > > > > > > > upper
> > > > > > > > > > > > > > > > layer.
> > > > > > > > > > > > > > > > Same as here, once receives a CSN message
> > > > > > > > > > > > > > > > notifying
> > > > > > > > > > > > > > > > a
> > > > > > > > > > > > > > > > drm
> > > > > > > > > > > > > > > > connector is changed from connected to
> > > > > > > > > > > > > > > > disconnected,
> > > > > > > > > > > > > > > > trigger
> > > > > > > > > > > > > > > > the callback function and we can try to rel=
ease
> > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > dc_sink
> > > > > > > > > > > > > > > > resource.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Would like to know your thought and insight
> > > > > > > > > > > > > > > > please :
> > > > > > > > > > > > > > > > )
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Btw, I got some errors and warnings while
> > > > > > > > > > > > > > > > building
> > > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > > have
> > > > > > > > > > > > > > > > some code adjustments as below : ) Thank yo=
u
> > > > > > > > > > > > > > > > Lyude
> > > > > > > > > > > > > > > > for
> > > > > > > > > > > > > > > > your
> > > > > > > > > > > > > > > > always kindly help!!
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Regards,
> > > > > > > > > > > > > > > > Wayne
> > > > > > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > > > > > > > > > > > Sent: Wednesday, November 3, 2021 7:15 AM
> > > > > > > > > > > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > > > > > > > > > > Subject: [PATCH] WIP: drm/dp_mst: Add sup=
port
> > > > > > > > > > > > > > > > > for
> > > > > > > > > > > > > > > > > dumping
> > > > > > > > > > > > > > > > > topology ref histories from debugfs
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > TODO:
> > > > > > > > > > > > > > > > > * Implement support for i915
> > > > > > > > > > > > > > > > > * Finish writing this commit message
> > > > > > > > > > > > > > > > > * ???
> > > > > > > > > > > > > > > > > * profit
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Signed-off-by: Lyude Paul <lyude@redhat.c=
om>
> > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Hey wayne! SO-hopefully if I did this
> > > > > > > > > > > > > > > > > correctly
> > > > > > > > > > > > > > > > > then
> > > > > > > > > > > > > > > > > this
> > > > > > > > > > > > > > > > > should just work on amdgpu. What this pat=
ch
> > > > > > > > > > > > > > > > > should
> > > > > > > > > > > > > > > > > do
> > > > > > > > > > > > > > > > > is
> > > > > > > > > > > > > > > > > add
> > > > > > > > > > > > > > > > > a debugfs file to amdgpu called
> > > > > > > > > > > > > > > > > "amdgpu_dp_mst_topology_refs", and when y=
ou
> > > > > > > > > > > > > > > > > read
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > file
> > > > > > > > > > > > > > > > > it
> > > > > > > > > > > > > > > > > should print out the topology reference
> > > > > > > > > > > > > > > > > history of
> > > > > > > > > > > > > > > > > every
> > > > > > > > > > > > > > > > > MSTB and Port in memory, along with how m=
any
> > > > > > > > > > > > > > > > > times
> > > > > > > > > > > > > > > > > we've
> > > > > > > > > > > > > > > > > hit
> > > > > > > > > > > > > > > > > the codepath in each backtrace. An exampl=
e:
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Port DP-5 (0000000005c37748) topology ref
> > > > > > > > > > > > > > > > > history:
> > > > > > > > > > > > > > > > >   1 gets (last at    58.468973):
> > > > > > > > > > > > > > > > >      drm_dp_send_link_address+0x6a5/0xa00
> > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > drm_dp_check_and_send_link_address+0xad/0=
xd0
> > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > >      drm_dp_mst_link_probe_work+0x14e/0x1=
a0
> > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > >      process_one_work+0x1e3/0x390
> > > > > > > > > > > > > > > > >      worker_thread+0x50/0x3a0
> > > > > > > > > > > > > > > > >      kthread+0x124/0x150
> > > > > > > > > > > > > > > > >      ret_from_fork+0x1f/0x30
> > > > > > > > > > > > > > > > >   1 puts (last at    58.469357):
> > > > > > > > > > > > > > > > >      drm_dp_mst_topology_put_port+0x6a/0x=
210
> > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > >      drm_dp_send_link_address+0x39e/0xa00
> > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > drm_dp_check_and_send_link_address+0xad/0=
xd0
> > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > >      drm_dp_mst_link_probe_work+0x14e/0x1=
a0
> > > > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > > > >      process_one_work+0x1e3/0x390
> > > > > > > > > > > > > > > > >      worker_thread+0x50/0x3a0
> > > > > > > > > > > > > > > > >      kthread+0x124/0x150
> > > > > > > > > > > > > > > > >      ret_from_fork+0x1f/0x30
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > The idea here is that if stream resources
> > > > > > > > > > > > > > > > > aren't
> > > > > > > > > > > > > > > > > being
> > > > > > > > > > > > > > > > > released, my guess would be that we're no=
t
> > > > > > > > > > > > > > > > > dropping
> > > > > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > > > > references for the port which means the
> > > > > > > > > > > > > > > > > connector
> > > > > > > > > > > > > > > > > never
> > > > > > > > > > > > > > > > > goes
> > > > > > > > > > > > > > > > > away. So, if that's really the case then =
once
> > > > > > > > > > > > > > > > > we
> > > > > > > > > > > > > > > > > unplug
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > offending connector we should be able to =
find
> > > > > > > > > > > > > > > > > a
> > > > > > > > > > > > > > > > > pair
> > > > > > > > > > > > > > > > > of
> > > > > > > > > > > > > > > > > gets/puts for the offending leaked connec=
tor
> > > > > > > > > > > > > > > > > where
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > get/put count doesn't match up. Also, if =
the
> > > > > > > > > > > > > > > > > frame
> > > > > > > > > > > > > > > > > count
> > > > > > > > > > > > > > > > > on
> > > > > > > > > > > > > > > > > the backtrace isn't long enough you can
> > > > > > > > > > > > > > > > > increase
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > value
> > > > > > > > > > > > > > > > > of STACK_DEPTH in
> > > > > > > > > > > > > > > > > drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > > > recompile to get more frames.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > To enable this, first enable CONFIG_EXPER=
T for
> > > > > > > > > > > > > > > > > your
> > > > > > > > > > > > > > > > > kernel
> > > > > > > > > > > > > > > > > which will unhide
> > > > > > > > > > > > > > > > > CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS.
> > > > > > > > > > > > > > > > > Then just enable
> > > > > > > > > > > > > > > > > CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS,
> > > > > > > > > > > > > > > > > recompile, and it should be good to go.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Let me know if this works for you, and
> > > > > > > > > > > > > > > > > hopefully
> > > > > > > > > > > > > > > > > this
> > > > > > > > > > > > > > > > > should
> > > > > > > > > > > > > > > > > tell us exactly what the problem actually=
 is
> > > > > > > > > > > > > > > > > here.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >  .../amd/display/amdgpu_dm/amdgpu_dm_debu=
gfs.c
> > > > > > > > > > > > > > > > > |
> > > > > > > > > > > > > > > > > 35
> > > > > > > > > > > > > > > > > ++++
> > > > > > > > > > > > > > > > >  drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > > > > |
> > > > > > > > > > > > > > > > > 173
> > > > > > > > > > > > > > > > > ++++++++++++++----
> > > > > > > > > > > > > > > > >  drivers/gpu/drm/nouveau/nouveau_debugfs.=
c
> > > > > > > > > > > > > > > > > |
> > > > > > > > > > > > > > > > > 35
> > > > > > > > > > > > > > > > > ++++
> > > > > > > > > > > > > > > > >  include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > > > > > |
> > > > > > > > > > > > > > > > > 18
> > > > > > > > > > > > > > > > > ++
> > > > > > > > > > > > > > > > >  4 files changed, 228 insertions(+), 33
> > > > > > > > > > > > > > > > > deletions(-)
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/a=
mdgpu
> > > > > > > > > > > > > > > > > _dm_
> > > > > > > > > > > > > > > > > debu
> > > > > > > > > > > > > > > > > gf
> > > > > > > > > > > > > > > > > s.
> > > > > > > > > > > > > > > > > c
> > > > > > > > > > > > > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/a=
mdgpu
> > > > > > > > > > > > > > > > > _dm_
> > > > > > > > > > > > > > > > > debu
> > > > > > > > > > > > > > > > > gf
> > > > > > > > > > > > > > > > > s.
> > > > > > > > > > > > > > > > > c
> > > > > > > > > > > > > > > > > index 1a68a674913c..1a14732c52b4 100644
> > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/a=
mdgpu
> > > > > > > > > > > > > > > > > _dm_
> > > > > > > > > > > > > > > > > debu
> > > > > > > > > > > > > > > > > gf
> > > > > > > > > > > > > > > > > s.
> > > > > > > > > > > > > > > > > c
> > > > > > > > > > > > > > > > > +++
> > > > > > > > > > > > > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/a=
mdgpu
> > > > > > > > > > > > > > > > > _dm_
> > > > > > > > > > > > > > > > > debu
> > > > > > > > > > > > > > > > > gf
> > > > > > > > > > > > > > > > > +++ s.c
> > > > > > > > > > > > > > > > > @@ -3063,6 +3063,37 @@ static int
> > > > > > > > > > > > > > > > > mst_topo_show(struct
> > > > > > > > > > > > > > > > > seq_file *m, void
> > > > > > > > > > > > > > > > > *unused)
> > > > > > > > > > > > > > > > >       return 0;
> > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_=
REFS
> > > > > > > > > > > > > > > > > +static int mst_topology_ref_dump_show(st=
ruct
> > > > > > > > > > > > > > > > > seq_file
> > > > > > > > > > > > > > > > > *m,
> > > > > > > > > > > > > > > > > +void
> > > > > > > > > > > > > > > > > +*unused) {
> > > > > > > > > > > > > > > > > +     struct amdgpu_device *adev =3D (str=
uct
> > > > > > > > > > > > > > > > > amdgpu_device
> > > > > > > > > > > > > > > > > +*)m->private;
> > > > > > > > > > > > > > > > > +     struct drm_device *dev =3D
> > > > > > > > > > > > > > > > > adev_to_drm(adev);
> > > > > > > > > > > > > > > > > +     struct drm_connector *connector;
> > > > > > > > > > > > > > > > > +     struct drm_connector_list_iter
> > > > > > > > > > > > > > > > > conn_iter;
> > > > > > > > > > > > > > > > > +     struct amdgpu_dm_connector *aconnec=
tor;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     drm_connector_list_iter_begin(dev,
> > > > > > > > > > > > > > > > > &conn_iter);
> > > > > > > > > > > > > > > > > +     drm_for_each_connector_iter(connect=
or,
> > > > > > > > > > > > > > > > > &conn_iter)
> > > > > > > > > > > > > > > > > {
> > > > > > > > > > > > > > > > > +             if (connector->connector_ty=
pe !=3D
> > > > > > > > > > > > > > > > > DRM_MODE_CONNECTOR_DisplayPort)
> > > > > > > > > > > > > > > > > +                     continue;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +             aconnector =3D
> > > > > > > > > > > > > > > > > +to_amdgpu_dm_connector(connector);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +             /* Ensure we're only dumpin=
g the
> > > > > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > > > > of
> > > > > > > > > > > > > > > > > a
> > > > > > > > > > > > > > > > > +root mst node
> > > > > > > > > > > > > > > > > */
> > > > > > > > > > > > > > > > > +             if (!aconnector-
> > > > > > > > > > > > > > > > > > mst_mgr.max_payloads)
> > > > > > > > > > > > > > > > > +                     continue;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +             seq_printf(m, "\nMST topolo=
gy
> > > > > > > > > > > > > > > > > for
> > > > > > > > > > > > > > > > > connector
> > > > > > > > > > > > > > > > > +%d\n",
> > > > > > > > > > > > > > > > > aconnector->connector_id);
> > > > > > > > > > > > > > > > > +             drm_dp_mst_dump_topology_re=
fs(m,
> > > > > > > > > > > > > > > > > +&aconnector->mst_mgr);
> > > > > > > > > > > > > > > > > +     }
> > > > > > > > > > > > > > > > > +     drm_connector_list_iter_end(&conn_i=
ter);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     return 0;
> > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +DEFINE_SHOW_ATTRIBUTE(mst_topology_ref_d=
ump);
> > > > > > > > > > > > > > > > > +#endif
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >  /*
> > > > > > > > > > > > > > > > >   * Sets trigger hpd for MST topologies.
> > > > > > > > > > > > > > > > >   * All connected connectors will be
> > > > > > > > > > > > > > > > > rediscovered
> > > > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > > > re
> > > > > > > > > > > > > > > > > started as needed if val of 1 is sent.
> > > > > > > > > > > > > > > > > @@ -3299,6 +3330,10 @@ void
> > > > > > > > > > > > > > > > > dtn_debugfs_init(struct
> > > > > > > > > > > > > > > > > amdgpu_device
> > > > > > > > > > > > > > > > > *adev)
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > debugfs_create_file("amdgpu_mst_topology"=
,
> > > > > > > > > > > > > > > > > 0444,
> > > > > > > > > > > > > > > > > root,
> > > > > > > > > > > > > > > > >                           adev,
> > > > > > > > > > > > > > > > > &mst_topo_fops);
> > > > > > > > > > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_=
REFS
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > debugfs_create_file("amdgpu_dp_mst_topolo=
gy_re
> > > > > > > > > > > > > > > > > fs",
> > > > > > > > > > > > > > > > > +0444, root, adev,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > &mst_topology_ref_dump_fops);
> > > > > > > > > > > > > > > > > +#endif
> > > > > > > > > > > > > > > > >       debugfs_create_file("amdgpu_dm_dtn_=
log",
> > > > > > > > > > > > > > > > > 0644,
> > > > > > > > > > > > > > > > > root,
> > > > > > > > > > > > > > > > > adev,
> > > > > > > > > > > > > > > > >                           &dtn_log_fops);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > > > a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > > > > index 1aa8702383d4..0159828c494d 100644
> > > > > > > > > > > > > > > > > --- a/drivers/gpu/drm/drm_dp_mst_topology=
.c
> > > > > > > > > > > > > > > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology=
.c
> > > > > > > > > > > > > > > > > @@ -1366,23 +1366,6 @@ static int
> > > > > > > > > > > > > > > > > drm_dp_mst_wait_tx_reply(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > > > *mstb,
> > > > > > > > > > > > > > > > >       return ret;
> > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > -static struct drm_dp_mst_branch
> > > > > > > > > > > > > > > > > *drm_dp_add_mst_branch_device(u8 lct, u8
> > > > > > > > > > > > > > > > > *rad) -{
> > > > > > > > > > > > > > > > > -     struct drm_dp_mst_branch *mstb;
> > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > -     mstb =3D kzalloc(sizeof(*mstb),
> > > > > > > > > > > > > > > > > GFP_KERNEL);
> > > > > > > > > > > > > > > > > -     if (!mstb)
> > > > > > > > > > > > > > > > > -             return NULL;
> > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > -     mstb->lct =3D lct;
> > > > > > > > > > > > > > > > > -     if (lct > 1)
> > > > > > > > > > > > > > > > > -             memcpy(mstb->rad, rad, lct =
/ 2);
> > > > > > > > > > > > > > > > > -     INIT_LIST_HEAD(&mstb->ports);
> > > > > > > > > > > > > > > > > -     kref_init(&mstb->topology_kref);
> > > > > > > > > > > > > > > > > -     kref_init(&mstb->malloc_kref);
> > > > > > > > > > > > > > > > > -     return mstb;
> > > > > > > > > > > > > > > > > -}
> > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > >  static void
> > > > > > > > > > > > > > > > > drm_dp_free_mst_branch_device(struct
> > > > > > > > > > > > > > > > > kref
> > > > > > > > > > > > > > > > > *kref)  {
> > > > > > > > > > > > > > > > >       struct drm_dp_mst_branch *mstb =3D =
@@ -
> > > > > > > > > > > > > > > > > 1642,12
> > > > > > > > > > > > > > > > > +1625,20
> > > > > > > > > > > > > > > > > @@ topology_ref_type_to_str(enum
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_type type)
> > > > > > > > > > > > > > > > >               return "put";
> > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +static const char
> > > > > > > > > > > > > > > > > *topology_ref_history_type_to_str(enum
> > > > > > > > > > > > > > > > > +drm_dp_mst_topology_history_type type) {
> > > > > > > > > > > > > > > > > +     if (type =3D=3D
> > > > > > > > > > > > > > > > > DRM_DP_MST_TOPOLOGY_HISTORY_PORT)
> > > > > > > > > > > > > > > > > +             return "Port";
> > > > > > > > > > > > > > > > > +     else
> > > > > > > > > > > > > > > > > +             return "MSTB"; }
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >  static void
> > > > > > > > > > > > > > > > > -__dump_topology_ref_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_history *history,
> > > > > > > > > > > > > > > > > -                         void *ptr, cons=
t
> > > > > > > > > > > > > > > > > char
> > > > > > > > > > > > > > > > > *type_str)
> > > > > > > > > > > > > > > > > +dump_topology_ref_history(struct
> > > > > > > > > > > > > > > > > +drm_dp_mst_topology_ref_history *history=
,
> > > > > > > > > > > > > > > > > struct
> > > > > > > > > > > > > > > > > +drm_printer p)
> > > > > > > > > > > > > > > > >  {
> > > > > > > > > > > > > > > > > -     struct drm_printer p =3D
> > > > > > > > > > > > > > > > > drm_debug_printer(DBG_PREFIX);
> > > > > > > > > > > > > > > > > +     char *connector_name =3D NULL;
> > > > > > > > > > > > > > > > >       char *buf =3D kzalloc(PAGE_SIZE,
> > > > > > > > > > > > > > > > > GFP_KERNEL);
> > > > > > > > > > > > > > > > > +     void *ptr;
> > > > > > > > > > > > > > > > >       int i;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       if (!buf)
> > > > > > > > > > > > > > > > > @@ -1656,14 +1647,29 @@
> > > > > > > > > > > > > > > > > __dump_topology_ref_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_history *history,
> > > > > > > > > > > > > > > > >       if (!history->len)
> > > > > > > > > > > > > > > > >               goto out;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +     /* Get a pointer to the actual MSTB=
/port
> > > > > > > > > > > > > > > > > so
> > > > > > > > > > > > > > > > > we
> > > > > > > > > > > > > > > > > can
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > +memory
> > > > > > > > > > > > > > > > > address to the kernel log */
> > > > > > > > > > > > > > > > > +     if (history->type =3D=3D
> > > > > > > > > > > > > > > > > DRM_DP_MST_TOPOLOGY_HISTORY_PORT)
> > > > > > > > > > > > > > > > > +             ptr =3D container_of(histor=
y,
> > > > > > > > > > > > > > > > > struct
> > > > > > > > > > > > > > > > > +drm_dp_mst_port,
> > > > > > > > > > > > > > > > > topology_ref_history);
> > > > > > > > > > > > > > > > > +     else
> > > > > > > > > > > > > > > > > +             ptr =3D container_of(histor=
y,
> > > > > > > > > > > > > > > > > struct
> > > > > > > > > > > > > > > > > +drm_dp_mst_branch, topology_ref_history)=
;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >       /* First, sort the list so that it =
goes
> > > > > > > > > > > > > > > > > from
> > > > > > > > > > > > > > > > > oldest
> > > > > > > > > > > > > > > > > to
> > > > > > > > > > > > > > > > > newest
> > > > > > > > > > > > > > > > >        * reference entry
> > > > > > > > > > > > > > > > >        */
> > > > > > > > > > > > > > > > >       sort(history->entries, history->len=
,
> > > > > > > > > > > > > > > > > sizeof(*history->entries),
> > > > > > > > > > > > > > > > >            topology_ref_history_cmp, NULL=
);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > -     drm_printf(&p, "%s (%p) topology co=
unt
> > > > > > > > > > > > > > > > > reached
> > > > > > > > > > > > > > > > > 0,
> > > > > > > > > > > > > > > > > dumping history:\n",
> > > > > > > > > > > > > > > > > -                type_str, ptr);
> > > > > > > > > > > > > > > > > +     if (history->type =3D=3D
> > > > > > > > > > > > > > > > > DRM_DP_MST_TOPOLOGY_HISTORY_PORT)
> > > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > > +             struct drm_dp_mst_port *por=
t =3D
> > > > > > > > > > > > > > > > > ptr;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +             if (port->connector)
> > > > > > > > > > > > > > > > > +                     connector_name =3D
> > > > > > > > > > > > > > > > > +port->connector->name;
> > > > > > > > > > > > > > > > > +     }
> > > > > > > > > > > > > > > > > +     if (connector_name)
> > > > > > > > > > > > > > > > > +             drm_printf(&p, "Port %s (%p=
)
> > > > > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > > > > ref
> > > > > > > > > > > > > > > > > +history:\n",
> > > > > > > > > > > > > > > > > connector_name, ptr);
> > > > > > > > > > > > > > > > > +     else
> > > > > > > > > > > > > > > > > +             drm_printf(&p, "%s (%p) top=
ology
> > > > > > > > > > > > > > > > > ref
> > > > > > > > > > > > > > > > > +history:\n",
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +topology_ref_history_type_to_str(history=
-
> > > > > > > > > > > > > > > > > >type),
> > > > > > > > > > > > > > > > > ptr);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       for (i =3D 0; i < history->len; i++=
) {
> > > > > > > > > > > > > > > > >               const struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_entry
> > > > > > > > > > > > > > > > > *entry =3D @@
> > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > 1682,24 +1688,92 @@
> > > > > > > > > > > > > > > > > __dump_topology_ref_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_history *history,
> > > > > > > > > > > > > > > > >                          ts_nsec, rem_nse=
c /
> > > > > > > > > > > > > > > > > 1000,
> > > > > > > > > > > > > > > > > buf);
> > > > > > > > > > > > > > > > >       }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > -     /* Now free the history, since this=
 is
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > only
> > > > > > > > > > > > > > > > > time
> > > > > > > > > > > > > > > > > we expose it */
> > > > > > > > > > > > > > > > > -     kfree(history->entries);
> > > > > > > > > > > > > > > > >  out:
> > > > > > > > > > > > > > > > >       kfree(buf);
> > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +/**
> > > > > > > > > > > > > > > > > + * drm_dp_mst_dump_topology_refs - helpe=
r
> > > > > > > > > > > > > > > > > function
> > > > > > > > > > > > > > > > > for
> > > > > > > > > > > > > > > > > +dumping the topology ref history
> > > > > > > > > > > > > > > > > + * @m: File to print to
> > > > > > > > > > > > > > > > > + * @mgr: &struct drm_dp_mst_topology_mgr=
 to
> > > > > > > > > > > > > > > > > use
> > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > > + * Prints the topology ref history of al=
l
> > > > > > > > > > > > > > > > > ports
> > > > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > > > MSTBs
> > > > > > > > > > > > > > > > > +on @mgr that are still in memory,
> > > > > > > > > > > > > > > > > + * regardless of whether they're actuall=
y
> > > > > > > > > > > > > > > > > still
> > > > > > > > > > > > > > > > > reachable
> > > > > > > > > > > > > > > > > +through the topology or not. Only enable=
d
> > > > > > > > > > > > > > > > > + * when
> > > > > > > > > > > > > > > > > %CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is
> > > > > > > > > > > > > > > > > enabled.
> > > > > > > > > > > > > > > > > +Can be implemented by drivers to assist
> > > > > > > > > > > > > > > > > + * with debugging leaks in the DP MST
> > > > > > > > > > > > > > > > > helpers.
> > > > > > > > > > > > > > > > > + */
> > > > > > > > > > > > > > > > > +void drm_dp_mst_dump_topology_refs(struc=
t
> > > > > > > > > > > > > > > > > seq_file
> > > > > > > > > > > > > > > > > *m,
> > > > > > > > > > > > > > > > > +struct drm_dp_mst_topology_mgr *mgr) {
> > > > > > > > > > > > > > > > > +     struct drm_dp_mst_topology_ref_hist=
ory
> > > > > > > > > > > > > > > > > *history;
> > > > > > > > > > > > > > > > > +     struct drm_printer p =3D
> > > > > > > > > > > > > > > > > drm_seq_file_printer(m);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     mutex_lock(&mgr-
> > > > > > > > > > > > > > > > > >topology_ref_history_lock);
> > > > > > > > > > > > > > > > > +     list_for_each_entry(history,
> > > > > > > > > > > > > > > > > +&mgr->topology_ref_history_list,
> > > > > > > > > > > > > > > > > +node)
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > dump_topology_ref_history(history,
> > > > > > > > > > > > > > > > > p);
> > > > > > > > > > > > > > > > > +     mutex_unlock(&mgr-
> > > > > > > > > > > > > > > > > > topology_ref_history_lock);
> > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > +EXPORT_SYMBOL(drm_dp_mst_dump_topology_r=
efs);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +static void
> > > > > > > > > > > > > > > > > +__init_topology_ref_history(struct
> > > > > > > > > > > > > > > > > +drm_dp_mst_topology_ref_history
> > > > > > > > > > > > > > > > > *history,
> > > > > > > > > > > > > > > > > +                         struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > +*mgr,
> > > > > > > > > > > > > > > > > +                         enum
> > > > > > > > > > > > > > > > > +drm_dp_mst_topology_history_type
> > > > > > > > > > > > > > > > > +type) {
> > > > > > > > > > > > > > > > > +     history->type =3D type;
> > > > > > > > > > > > > > > > > +     INIT_LIST_HEAD(&history->node);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     mutex_lock(&mgr-
> > > > > > > > > > > > > > > > > >topology_ref_history_lock);
> > > > > > > > > > > > > > > > > +     list_add(&history->node,
> > > > > > > > > > > > > > > > > +&mgr->topology_ref_history_list);
> > > > > > > > > > > > > > > > > +     mutex_unlock(&mgr-
> > > > > > > > > > > > > > > > > > topology_ref_history_lock);
> > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +static void
> > > > > > > > > > > > > > > > > +__destroy_topology_ref_history(struct
> > > > > > > > > > > > > > > > > +drm_dp_mst_topology_ref_history
> > > > > > > > > > > > > > > > > *history,
> > > > > > > > > > > > > > > > > +                            struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > +*mgr) {
> > > > > > > > > > > > > > > > > +     mutex_lock(&mgr-
> > > > > > > > > > > > > > > > > >topology_ref_history_lock);
> > > > > > > > > > > > > > > > > +     list_del(&mgr-
> > > > > > > > > > > > > > > > > >topology_ref_history_list);
> > > > > > > > > > > > > > > > > +     mutex_unlock(&mgr-
> > > > > > > > > > > > > > > > > > topology_ref_history_lock);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     kfree(history->entries); }
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +static __always_inline void
> > > > > > > > > > > > > > > > > +init_port_topology_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > +*mgr, struct drm_dp_mst_port *port) {
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +__init_topology_ref_history(&port-
> > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > +mgr,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +DRM_DP_MST_TOPOLOGY_HISTORY_PORT);
> > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +static __always_inline void
> > > > > > > > > > > > > > > > > +init_mstb_topology_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > +*mgr, struct drm_dp_mst_branch *mstb) {
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +__init_topology_ref_history(&mstb-
> > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > +mgr,
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +DRM_DP_MST_TOPOLOGY_HISTORY_MSTB);
> > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +static __always_inline void
> > > > > > > > > > > > > > > > > +destroy_port_topology_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +__destroy_topology_ref_history(&port-
> > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > +port->mgr); }
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +static __always_inline void
> > > > > > > > > > > > > > > > > +destroy_mstb_topology_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > > > +*mstb) {
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +__destroy_topology_ref_history(&mstb-
> > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > +mstb->mgr); }
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >  static __always_inline void
> > > > > > > > > > > > > > > > >  dump_mstb_topology_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > > > *mstb)
> > > > > > > > > > > > > > > > > {
> > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > __dump_topology_ref_history(&mstb-
> > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > mstb,
> > > > > > > > > > > > > > > > > -                                 "MSTB")=
;
> > > > > > > > > > > > > > > > > +     dump_topology_ref_history(&mstb-
> > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > +drm_debug_printer(DBG_PREFIX));
> > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >  static __always_inline void
> > > > > > > > > > > > > > > > >  dump_port_topology_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > > > > {
> > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > __dump_topology_ref_history(&port-
> > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > port,
> > > > > > > > > > > > > > > > > -                                 "Port")=
;
> > > > > > > > > > > > > > > > > +     dump_topology_ref_history(&port-
> > > > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > > > +drm_debug_printer(DBG_PREFIX));
> > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >  static __always_inline void @@ -1729,6
> > > > > > > > > > > > > > > > > +1803,14
> > > > > > > > > > > > > > > > > @@
> > > > > > > > > > > > > > > > > topology_ref_history_unlock(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr)  }  #else
> > > > > > > > > > > > > > > > > static
> > > > > > > > > > > > > > > > > inline
> > > > > > > > > > > > > > > > > void
> > > > > > > > > > > > > > > > > +init_port_topology_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > +*mgr, struct drm_dp_mst_port *port); sta=
tic
> > > > > > > > > > > > > > > > > inline
> > > > > > > > > > > > > > > > > void
> > > > > > > > > > > > > > > > Should also add the bracket, otherwise will=
 get
> > > > > > > > > > > > > > > > warnings.
> > > > > > > > > > > > > > > > =3D> static inline void
> > > > > > > > > > > > > > > > init_port_topology_history(struct
> > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr, struct
> > > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > > > {};
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +init_mstb_topology_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > +*mgr, struct drm_dp_mst_branch *mstb); s=
tatic
> > > > > > > > > > > > > > > > > inline
> > > > > > > > > > > > > > > > > void
> > > > > > > > > > > > > > > > Same as above
> > > > > > > > > > > > > > > > =3D> static inline void
> > > > > > > > > > > > > > > > init_mstb_topology_history(struct
> > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr, struct
> > > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > > *mstb)
> > > > > > > > > > > > > > > > {};
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +destroy_port_topology_history(struct
> > > > > > > > > > > > > > > > > +drm_dp_mst_topology_mgr *mgr, struct
> > > > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > > > +*port); static inline void
> > > > > > > > > > > > > > > > destroy_port_topology_history() takes one
> > > > > > > > > > > > > > > > parameter
> > > > > > > > > > > > > > > > only
> > > > > > > > > > > > > > > > which
> > > > > > > > > > > > > > > > is port.
> > > > > > > > > > > > > > > > =3D> destroy_port_topology_history(struct
> > > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > > > {};
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +destroy_mstb_topology_history(struct
> > > > > > > > > > > > > > > > > +drm_dp_mst_topology_mgr *mgr, struct
> > > > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > > > +*mstb); static inline void
> > > > > > > > > > > > > > > > destroy_mstb_topology_history() takes one
> > > > > > > > > > > > > > > > parameter
> > > > > > > > > > > > > > > > only
> > > > > > > > > > > > > > > > which
> > > > > > > > > > > > > > > > is mstb =3D> destroy_mstb_topology_history(=
struct
> > > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > > *mstb) {};
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >  topology_ref_history_lock(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > *mgr) {} static inline void
> > > > > > > > > > > > > > > > > topology_ref_history_unlock(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr) {} @@ -1740=
,6
> > > > > > > > > > > > > > > > > +1822,25
> > > > > > > > > > > > > > > > > @@
> > > > > > > > > > > > > > > > > dump_port_topology_history(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > > > > {}
> > > > > > > > > > > > > > > > > #define save_port_topology_ref(port, type=
)
> > > > > > > > > > > > > > > > > #endif
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +static struct drm_dp_mst_branch *
> > > > > > > > > > > > > > > > > +drm_dp_add_mst_branch_device(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > > > +*mgr,
> > > > > > > > > > > > > > > > > +u8 lct, u8 *rad) {
> > > > > > > > > > > > > > > > > +     struct drm_dp_mst_branch *mstb;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     mstb =3D kzalloc(sizeof(*mstb),
> > > > > > > > > > > > > > > > > GFP_KERNEL);
> > > > > > > > > > > > > > > > > +     if (!mstb)
> > > > > > > > > > > > > > > > > +             return NULL;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     mstb->lct =3D lct;
> > > > > > > > > > > > > > > > > +     if (lct > 1)
> > > > > > > > > > > > > > > > > +             memcpy(mstb->rad, rad, lct =
/ 2);
> > > > > > > > > > > > > > > > > +     INIT_LIST_HEAD(&mstb->ports);
> > > > > > > > > > > > > > > > > +     kref_init(&mstb->topology_kref);
> > > > > > > > > > > > > > > > > +     kref_init(&mstb->malloc_kref);
> > > > > > > > > > > > > > > > > +     init_mstb_topology_history(mgr, mst=
b);
> > > > > > > > > > > > > > > > > +     return mstb;
> > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >  static void
> > > > > > > > > > > > > > > > > drm_dp_destroy_mst_branch_device(struct
> > > > > > > > > > > > > > > > > kref
> > > > > > > > > > > > > > > > > *kref) {
> > > > > > > > > > > > > > > > >       struct drm_dp_mst_branch *mstb =3D =
@@ -
> > > > > > > > > > > > > > > > > 1747,6
> > > > > > > > > > > > > > > > > +1848,7
> > > > > > > > > > > > > > > > > @@
> > > > > > > > > > > > > > > > > static void
> > > > > > > > > > > > > > > > > drm_dp_destroy_mst_branch_device(struct
> > > > > > > > > > > > > > > > > kref *kref)
> > > > > > > > > > > > > > > > >       struct drm_dp_mst_topology_mgr *mgr=
 =3D
> > > > > > > > > > > > > > > > > mstb-
> > > > > > > > > > > > > > > > > > mgr;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       dump_mstb_topology_history(mstb);
> > > > > > > > > > > > > > > > > +     destroy_mstb_topology_history(mstb)=
;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       INIT_LIST_HEAD(&mstb->destroy_next)=
;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > @@ -1856,6 +1958,7 @@ static void
> > > > > > > > > > > > > > > > > drm_dp_destroy_port(struct
> > > > > > > > > > > > > > > > > kref
> > > > > > > > > > > > > > > > > *kref)
> > > > > > > > > > > > > > > > >       struct drm_dp_mst_topology_mgr *mgr=
 =3D
> > > > > > > > > > > > > > > > > port-
> > > > > > > > > > > > > > > > > > mgr;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       dump_port_topology_history(port);
> > > > > > > > > > > > > > > > > +     destroy_port_topology_history(port)=
;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       /* There's nothing that needs locki=
ng to
> > > > > > > > > > > > > > > > > destroy
> > > > > > > > > > > > > > > > > an
> > > > > > > > > > > > > > > > > input port yet */
> > > > > > > > > > > > > > > > >       if (port->input) {
> > > > > > > > > > > > > > > > > @@ -2135,7 +2238,7 @@
> > > > > > > > > > > > > > > > > drm_dp_port_set_pdt(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_port *port, u8 new_pdt,
> > > > > > > > > > > > > > > > >                       ret =3D
> > > > > > > > > > > > > > > > > drm_dp_mst_register_i2c_bus(port);
> > > > > > > > > > > > > > > > >               } else {
> > > > > > > > > > > > > > > > >                       lct =3D
> > > > > > > > > > > > > > > > > drm_dp_calculate_rad(port,
> > > > > > > > > > > > > > > > > rad);
> > > > > > > > > > > > > > > > > -                     mstb =3D
> > > > > > > > > > > > > > > > > drm_dp_add_mst_branch_device(lct, rad);
> > > > > > > > > > > > > > > > > +                     mstb =3D
> > > > > > > > > > > > > > > > > +drm_dp_add_mst_branch_device(mgr, lct, r=
ad);
> > > > > > > > > > > > > > > > >                       if (!mstb) {
> > > > > > > > > > > > > > > > >                               ret =3D -EN=
OMEM;
> > > > > > > > > > > > > > > > >                               drm_err(mgr=
-
> > > > > > > > > > > > > > > > > >dev,
> > > > > > > > > > > > > > > > > "Failed
> > > > > > > > > > > > > > > > > to
> > > > > > > > > > > > > > > > > create MSTB for port %p", port); @@ -2366=
,6
> > > > > > > > > > > > > > > > > +2469,8 @@
> > > > > > > > > > > > > > > > > drm_dp_mst_add_port(struct drm_device *de=
v,
> > > > > > > > > > > > > > > > >        */
> > > > > > > > > > > > > > > > >       drm_dp_mst_get_mstb_malloc(mstb);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +     init_port_topology_history(mgr, por=
t);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >       return port;
> > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > @@ -3745,7 +3850,7 @@ int
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr_set_mst(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr, bool ms
> > > > > > > > > > > > > > > > >               }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >               /* add initial branch devic=
e at
> > > > > > > > > > > > > > > > > LCT
> > > > > > > > > > > > > > > > > 1 */
> > > > > > > > > > > > > > > > > -             mstb =3D
> > > > > > > > > > > > > > > > > drm_dp_add_mst_branch_device(1,
> > > > > > > > > > > > > > > > > NULL);
> > > > > > > > > > > > > > > > > +             mstb =3D
> > > > > > > > > > > > > > > > > drm_dp_add_mst_branch_device(mgr,
> > > > > > > > > > > > > > > > > 1,
> > > > > > > > > > > > > > > > > +NULL);
> > > > > > > > > > > > > > > > >               if (mstb =3D=3D NULL) {
> > > > > > > > > > > > > > > > >                       ret =3D -ENOMEM;
> > > > > > > > > > > > > > > > >                       goto out_unlock; @@=
 -
> > > > > > > > > > > > > > > > > 5512,14
> > > > > > > > > > > > > > > > > +5617,16
> > > > > > > > > > > > > > > > > @@ int drm_dp_mst_topology_mgr_init(struc=
t
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > > > > > > > > > > >       mutex_init(&mgr->delayed_destroy_lo=
ck);
> > > > > > > > > > > > > > > > >       mutex_init(&mgr->up_req_lock);
> > > > > > > > > > > > > > > > >       mutex_init(&mgr->probe_lock); -#if
> > > > > > > > > > > > > > > > > IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLO=
GY_RE
> > > > > > > > > > > > > > > > > FS)
> > > > > > > > > > > > > > > > > -     mutex_init(&mgr-
> > > > > > > > > > > > > > > > > >topology_ref_history_lock);
> > > > > > > > > > > > > > > > > -#endif
> > > > > > > > > > > > > > > > >       INIT_LIST_HEAD(&mgr->tx_msg_downq);
> > > > > > > > > > > > > > > > >       INIT_LIST_HEAD(&mgr->destroy_port_l=
ist);
> > > > > > > > > > > > > > > > >       INIT_LIST_HEAD(&mgr-
> > > > > > > > > > > > > > > > > > destroy_branch_device_list);
> > > > > > > > > > > > > > > > >       INIT_LIST_HEAD(&mgr->up_req_list);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +#if
> > > > > > > > > > > > > > > > > IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLO=
GY_RE
> > > > > > > > > > > > > > > > > FS)
> > > > > > > > > > > > > > > > > +     mutex_init(&mgr-
> > > > > > > > > > > > > > > > > >topology_ref_history_lock);
> > > > > > > > > > > > > > > > > +     INIT_LIST_HEAD(&mgr-
> > > > > > > > > > > > > > > > > > topology_ref_history_list);
> > > > > > > > > > > > > > > > > +#endif
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >       /*
> > > > > > > > > > > > > > > > >        * delayed_destroy_work will be que=
ued
> > > > > > > > > > > > > > > > > on a
> > > > > > > > > > > > > > > > > dedicated
> > > > > > > > > > > > > > > > > WQ, so that any
> > > > > > > > > > > > > > > > >        * requeuing will be also flushed w=
hen
> > > > > > > > > > > > > > > > > deiniting
> > > > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > > > topology manager.
> > > > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > > > a/drivers/gpu/drm/nouveau/nouveau_debugfs=
.c
> > > > > > > > > > > > > > > > > b/drivers/gpu/drm/nouveau/nouveau_debugfs=
.c
> > > > > > > > > > > > > > > > > index 1cbe01048b93..53ec7c1daada 100644
> > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > > a/drivers/gpu/drm/nouveau/nouveau_debugfs=
.c
> > > > > > > > > > > > > > > > > +++
> > > > > > > > > > > > > > > > > b/drivers/gpu/drm/nouveau/nouveau_debugfs=
.c
> > > > > > > > > > > > > > > > > @@ -29,9 +29,13 @@
> > > > > > > > > > > > > > > > >   */
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >  #include <linux/debugfs.h>
> > > > > > > > > > > > > > > > > +#include <drm/drm_dp_mst_helper.h> #incl=
ude
> > > > > > > > > > > > > > > > > +<drm/drm_encoder.h>
> > > > > > > > > > > > > > > > >  #include <nvif/class.h>
> > > > > > > > > > > > > > > > >  #include <nvif/if0001.h>
> > > > > > > > > > > > > > > > > +#include <nouveau_encoder.h>
> > > > > > > > > > > > > > > > >  #include "nouveau_debugfs.h"
> > > > > > > > > > > > > > > > > +#include "nouveau_display.h"
> > > > > > > > > > > > > > > > >  #include "nouveau_drv.h"
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >  static int
> > > > > > > > > > > > > > > > > @@ -68,6 +72,34 @@
> > > > > > > > > > > > > > > > > nouveau_debugfs_strap_peek(struct
> > > > > > > > > > > > > > > > > seq_file *m, void
> > > > > > > > > > > > > > > > > *data)
> > > > > > > > > > > > > > > > >       return 0;
> > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_=
REFS
> > > > > > > > > > > > > > > > > +static int
> > > > > > > > > > > > > > > > > nouveau_debugfs_mst_topology_history(stru=
ct
> > > > > > > > > > > > > > > > > +seq_file *m, void *data) {
> > > > > > > > > > > > > > > > > +     struct drm_info_node *node =3D m->p=
rivate;
> > > > > > > > > > > > > > > > > +     struct drm_device *dev =3D node->mi=
nor-
> > > > > > > > > > > > > > > > > >dev;
> > > > > > > > > > > > > > > > > +     struct drm_encoder *encoder;
> > > > > > > > > > > > > > > > > +     struct nouveau_display *disp =3D
> > > > > > > > > > > > > > > > > nouveau_display(dev);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     if (disp->disp.object.oclass <
> > > > > > > > > > > > > > > > > GF110_DISP)
> > > > > > > > > > > > > > > > > +             return -EINVAL;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     drm_for_each_encoder(encoder, dev) =
{
> > > > > > > > > > > > > > > > > +             struct nv50_mstm *mstm;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +             /* We need the real encoder=
 for
> > > > > > > > > > > > > > > > > each
> > > > > > > > > > > > > > > > > MST
> > > > > > > > > > > > > > > > > mgr
> > > > > > > > > > > > > > > > > +*/
> > > > > > > > > > > > > > > > > +             if (encoder->encoder_type !=
=3D
> > > > > > > > > > > > > > > > > +DRM_MODE_ENCODER_TMDS)
> > > > > > > > > > > > > > > > > +                     continue;
> > > > > > > > > > > > > > > > > +             mstm =3D nouveau_encoder(en=
coder)-
> > > > > > > > > > > > > > > > > > dp.mstm;
> > > > > > > > > > > > > > > > > +             if (!mstm)
> > > > > > > > > > > > > > > > > +                     continue;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +             seq_printf(m, "MSTM on %s:\=
n",
> > > > > > > > > > > > > > > > > encoder-
> > > > > > > > > > > > > > > > > > name);
> > > > > > > > > > > > > > > > > +             drm_dp_mst_dump_topology_re=
fs(m,
> > > > > > > > > > > > > > > > > &mstm-
> > > > > > > > > > > > > > > > > > mgr);
> > > > > > > > > > > > > > > > > +     }
> > > > > > > > > > > > > > > > > +     return 0;
> > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > +#endif
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >  static int
> > > > > > > > > > > > > > > > >  nouveau_debugfs_pstate_get(struct seq_fi=
le
> > > > > > > > > > > > > > > > > *m,
> > > > > > > > > > > > > > > > > void
> > > > > > > > > > > > > > > > > *data)
> > > > > > > > > > > > > > > > > { @@
> > > > > > > > > > > > > > > > > -213,6
> > > > > > > > > > > > > > > > > +245,9 @@ static const struct file_operat=
ions
> > > > > > > > > > > > > > > > > nouveau_pstate_fops =3D {  static struct
> > > > > > > > > > > > > > > > > drm_info_list
> > > > > > > > > > > > > > > > > nouveau_debugfs_list[] =3D {
> > > > > > > > > > > > > > > > >       { "vbios.rom",
> > > > > > > > > > > > > > > > > nouveau_debugfs_vbios_image,
> > > > > > > > > > > > > > > > > 0,
> > > > > > > > > > > > > > > > > NULL
> > > > > > > > > > > > > > > > > },
> > > > > > > > > > > > > > > > >       { "strap_peek",
> > > > > > > > > > > > > > > > > nouveau_debugfs_strap_peek,
> > > > > > > > > > > > > > > > > 0,
> > > > > > > > > > > > > > > > > NULL
> > > > > > > > > > > > > > > > > },
> > > > > > > > > > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_=
REFS
> > > > > > > > > > > > > > > > > +     { "dp_mst_topology_refs",
> > > > > > > > > > > > > > > > > +nouveau_debugfs_mst_topology_history, 0,=
 NULL
> > > > > > > > > > > > > > > > > },
> > > > > > > > > > > > > > > > > #endif
> > > > > > > > > > > > > > > > >  };
> > > > > > > > > > > > > > > > >  #define NOUVEAU_DEBUGFS_ENTRIES
> > > > > > > > > > > > > > > > > ARRAY_SIZE(nouveau_debugfs_list)
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > diff --git a/include/drm/drm_dp_mst_helpe=
r.h
> > > > > > > > > > > > > > > > > b/include/drm/drm_dp_mst_helper.h index
> > > > > > > > > > > > > > > > > 78044ac5b59b..e3a73d8d97c0
> > > > > > > > > > > > > > > > > 100644
> > > > > > > > > > > > > > > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > > > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > > > > > @@ -35,6 +35,11 @@ enum
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_type {
> > > > > > > > > > > > > > > > >       DRM_DP_MST_TOPOLOGY_REF_PUT,
> > > > > > > > > > > > > > > > >  };
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +enum drm_dp_mst_topology_history_type {
> > > > > > > > > > > > > > > > > +     DRM_DP_MST_TOPOLOGY_HISTORY_PORT,
> > > > > > > > > > > > > > > > > +     DRM_DP_MST_TOPOLOGY_HISTORY_MSTB, }=
;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >  struct drm_dp_mst_topology_ref_history {
> > > > > > > > > > > > > > > > >       struct drm_dp_mst_topology_ref_entr=
y {
> > > > > > > > > > > > > > > > >               enum
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_type
> > > > > > > > > > > > > > > > > type;
> > > > > > > > > > > > > > > > > @@
> > > > > > > > > > > > > > > > > -43,6
> > > > > > > > > > > > > > > > > +48,9 @@ struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_ref_history {
> > > > > > > > > > > > > > > > >               depot_stack_handle_t backtr=
ace;
> > > > > > > > > > > > > > > > >       } *entries;
> > > > > > > > > > > > > > > > >       int len;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     enum drm_dp_mst_topology_history_ty=
pe
> > > > > > > > > > > > > > > > > type;
> > > > > > > > > > > > > > > > > +     struct list_head node;
> > > > > > > > > > > > > > > > >  };
> > > > > > > > > > > > > > > > >  #endif /*
> > > > > > > > > > > > > > > > > IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLO=
GY_RE
> > > > > > > > > > > > > > > > > FS)
> > > > > > > > > > > > > > > > > */
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > @@ -769,6 +777,12 @@ struct
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_mgr {
> > > > > > > > > > > > > > > > >        *
> > > > > > > > > > > > > > > > > &drm_dp_mst_branch.topology_ref_history.
> > > > > > > > > > > > > > > > >        */
> > > > > > > > > > > > > > > > >       struct mutex topology_ref_history_l=
ock;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     /**
> > > > > > > > > > > > > > > > > +      * @topology_ref_history_list: cont=
ains
> > > > > > > > > > > > > > > > > a
> > > > > > > > > > > > > > > > > list
> > > > > > > > > > > > > > > > > of
> > > > > > > > > > > > > > > > > +topology ref
> > > > > > > > > > > > > > > > > histories for any MSTBs or
> > > > > > > > > > > > > > > > > +      * ports that are still in memory
> > > > > > > > > > > > > > > > > +      */
> > > > > > > > > > > > > > > > > +     struct list_head
> > > > > > > > > > > > > > > > > topology_ref_history_list;
> > > > > > > > > > > > > > > > >  #endif
> > > > > > > > > > > > > > > > >  };
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > @@ -873,6 +887,10 @@ void
> > > > > > > > > > > > > > > > > drm_dp_mst_put_port_malloc(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_port *port);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >  struct drm_dp_aux
> > > > > > > > > > > > > > > > > *drm_dp_mst_dsc_aux_for_port(struct
> > > > > > > > > > > > > > > > > drm_dp_mst_port *port);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_=
REFS
> > > > > > > > > > > > > > > > > +void drm_dp_mst_dump_topology_refs(struc=
t
> > > > > > > > > > > > > > > > > seq_file
> > > > > > > > > > > > > > > > > *m,
> > > > > > > > > > > > > > > > > +struct drm_dp_mst_topology_mgr *mgr); #e=
ndif
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >  extern const struct drm_private_state_fu=
ncs
> > > > > > > > > > > > > > > > > drm_dp_mst_topology_state_funcs;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >  /**
> > > > > > > > > > > > > > > > > --
> > > > > > > > > > > > > > > > > 2.31.1
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > --
> > > > > > > > > > > > > > > Cheers,
> > > > > > > > > > > > > > >  Lyude Paul (she/her)
> > > > > > > > > > > > > > >  Software Engineer at Red Hat
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > --
> > > > > > > > > > > Cheers, Lyude Paul (she/her) Software Engineer at Red=
 Hat
> > > > > > > > > > --
> > > > > > > > > > Regards,
> > > > > > > > > > Wayne Lin
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > Cheers,
> > > > > > > > >  Lyude Paul (she/her)
> > > > > > > > >  Software Engineer at Red Hat
> > > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > > > --
> > > > > Cheers,
> > > > >  Lyude Paul (she/her)
> > > > >  Software Engineer at Red Hat
> > > >
> > >
> > > --
> > > Cheers,
> > >  Lyude Paul (she/her)
> > >  Software Engineer at Red Hat
> >
> > --
> > Regards,
> > Wayne Lin
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat

