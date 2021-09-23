Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6576A41679B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 23:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9066E112;
	Thu, 23 Sep 2021 21:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA13E6E112
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 21:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPmlwhOFytlnTfmznXZMAKSuYJ4HVpBQHndjJpl5TU5bMjWvOMQxwk8gjnL5uKbRpnIlDPaPEsgghGtJU4VT6jdSP8eqU/HVkSJDvsKE4W7JdRpolvWmCPMChL8372SP7+Jg7xpQd4K0K3BsRjbeqgwvvBbewqrXcnSsHPY2jyueSFbvU7cV+3HOdghpiZ8VaYLuvoPvkllgrAYwdG+GdNH24Q3wo84UKiJoLUkLyJSNRKbSGIYU+8cSp/7UmJt51SkvpqIGcMEEfJXx/VM1U/EmE+wRFUZ09QuBt3r4ark5CDCFg6SHGs0vrCDO7hgMR4vN30lecWomhjWHIbpS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=gNHYj/rFA7W7MM5DxiyE82h+KsIBqi88hsh0ieeIuRc=;
 b=i++2YxUASTPdl1HwTgEleLZavN63sdUX2FGyeE+mJn7tURHNwxef0YdCZ13JOO2oIVCS0KvR+GqSkYLXvxDTt/mzG5chbev4fttgCaVETZXdUhxOGdQHCmgV0TIrOxOqIbkhngziFoJjy5Kt8v9jYyGpY6qXIfOSZt4o7uMIhY644UU1e7yothqRJ4OsQTTzVG5iWwdqEiF5G8M9lsAUyPp3CGbzDXMvvJaux8AI+dz062I/jGPDHi0LJXDGE4pba34veyUOv5/k+cDWGY9gpcjdyfG4KTKhtlKIYx2VXDNWQ01M/N/OWZ2fvs/EQ31qJZ9bN5SOkhv37tnQa7kx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNHYj/rFA7W7MM5DxiyE82h+KsIBqi88hsh0ieeIuRc=;
 b=BsczkaA3kx00OgVb7Pa7mXg04LY8UKV4AuD62SfCOxzfeKZA0jqN+u7DhkIhL1Cnzup4s5JPLB4YqnZ2slp9DBQ4T1KElDVzTCnT0F82MBB+yrVkX+MUr5e8DGM57PAtDsHrvO+fXqtn34fKRY58VywlGa12/TQE+XhC/Wus8cI=
Received: from MW2PR12MB2505.namprd12.prod.outlook.com (2603:10b6:907:4::16)
 by MWHPR1201MB0160.namprd12.prod.outlook.com (2603:10b6:301:50::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 21:40:56 +0000
Received: from MW2PR12MB2505.namprd12.prod.outlook.com
 ([fe80::b0ca:a449:3c3:a119]) by MW2PR12MB2505.namprd12.prod.outlook.com
 ([fe80::b0ca:a449:3c3:a119%5]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 21:40:55 +0000
From: "Phillips, Daniel" <Daniel.Phillips@amd.com>
To: Matthew Wilcox <willy@infradead.org>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>
CC: Linux MM <linux-mm@kvack.org>, "linux-ext4@vger.kernel.org"
 <linux-ext4@vger.kernel.org>, "linux-xfs@vger.kernel.org"
 <linux-xfs@vger.kernel.org>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Jason
 Gunthorpe <jgg@mellanox.com>, Jerome Glisse <jglisse@redhat.com>, Ralph
 Campbell <rcampbell@nvidia.com>, Theodore Ts'o <tytso@mit.edu>, Andrew Morton
 <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, Peter
 Zijlstra <peterz@infradead.org>, "Sierra Guiza, Alejandro (Alex)"
 <Alex.Sierra@amd.com>, Daniel Stone <daniel@fooishbar.org>
Subject: RE: BoF at LPC: Documenting the Heterogeneous Memory Model
 Architecture
Thread-Topic: BoF at LPC: Documenting the Heterogeneous Memory Model
 Architecture
Thread-Index: AQHXrx2LN10Y7437XUSgh9raYvqchKuyE/gAgAAD7ACAAAZRgA==
Date: Thu, 23 Sep 2021 21:40:55 +0000
Message-ID: <MW2PR12MB2505680AC156F2A4F04E9271E3A39@MW2PR12MB2505.namprd12.prod.outlook.com>
References: <23aeacb6-0cd9-d10f-76bc-3c9d33905daa@amd.com>
 <ca132183-e778-4a86-c81e-4d292e9d41a7@amd.com>
 <YUzl7qywbtVHipUT@casper.infradead.org>
In-Reply-To: <YUzl7qywbtVHipUT@casper.infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-23T21:40:54Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=549a49ed-d01a-4c07-af9b-4488ecdb81c3;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54303191-8924-4396-ab6f-08d97edad2ca
x-ms-traffictypediagnostic: MWHPR1201MB0160:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1201MB016016045A6A81A36AA722CAE3A39@MWHPR1201MB0160.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lp6WRYXw7DoNVuZTrnX8nb2+8GxKOK+oysQsmdILD96pXzbWtjcYZdOuuQv/UWKXt9yWq/i+WZCtocpdXZWXvgV2NaProRhIG76DpxU9+9v0uQzBruBSGLTdwp9/BHIzEcRflY7F95Kpna5INo5POIMGnO5oLdbIrLU8yCx2jOzIWqs8/BCBUwGkyz9ulJLZ5fg/VjuFG5fXLeGLF+QAkr3ifgvMkvDBFqdlvys0tLj7wAQ9cMGSpVtOUVGlSSwg8pKyT2Cr5vFo4q2AlpNxjAyhrCKg8cde0YevfF+ZM7PtmQN+fL1bq/SCI7ImDpJhRbR10p3P3Z8T5BdVjvAG5d6gab/Hljv3icdophbKoLucyujPKlecgEYM1qMtu7NtO/HyrSHBs5KkZqN3O+/Hl0P+KjUxz9kxTA5UcZ4aNRHH+c1UIRs+ICr+cTpGrASvGe7wCOSm42hHf2cOaw5iBbR/wqrUUim+F1Vh4ttvMuDUKDU5XlwPR+i8GrdTJI5cA/g2bP9SurY2GheFUILFekGo72VKU6tkQ4xltMISPWnMLtAQnTSBnvFpnGregLxT4iftBmBPwbiU55XNKH6iWuSw1TMQvc1n7c7LNdP+IAM2hRN50tIOaMHrSuW0fAZxhWvHxJTUO5NDwGSxPxuOzDbXQn6g8j9qXFnSRoDTs+f4Rq6zhWeX4m9U4oGiOWm/+uWPjW6HfvX+Nf6zw5gco7wooV8tm3tBLWOwFc7jRauyyARGOPoVaLLFviv1vUZwNLfChEuOE2o1zJhhQhvW1L7h5tjqKFU45RmG1ZuSUJk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB2505.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(86362001)(45080400002)(71200400001)(508600001)(66446008)(316002)(6506007)(53546011)(38070700005)(83380400001)(33656002)(7696005)(9686003)(55016002)(966005)(7416002)(66476007)(66946007)(8936002)(52536014)(4326008)(122000001)(186003)(6636002)(66556008)(76116006)(64756008)(8676002)(54906003)(38100700002)(2906002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Wsd/N7GKMOC3W/0KmxM+qtBEk1rCKY2iWf4PQGPqGfg45AFJc8TGo/j/MHPq?=
 =?us-ascii?Q?anWYZxvUEFpYOotz8FzJsbiy9urx2ePOaQQXa7Lz1m0YoMmysBbmYmNwVy7Q?=
 =?us-ascii?Q?qzRgNvySZtlQPd/pTaH2MILfUh2LE+eLt1i3unQf9K8Lvh+Ukvb1xSShif3e?=
 =?us-ascii?Q?irvMjWFhjNbjzn/Fq2wQ/8wjrjdUr62N791htmGWWQZlZhvFatnm5PN0M8b7?=
 =?us-ascii?Q?b/dc5tbNI0EEnzFsJgF9lFCDgVmxY3FdJzCsCu7xkUCGhI953boCxympJSj9?=
 =?us-ascii?Q?0T2oVPsoAdVIzhhH+gsJIPH0cH6AFvg1KmevphCCCaHbsy1GTG4ObGbOViZ7?=
 =?us-ascii?Q?8mSBro5sRC3McfMIySkSz4ApCOsR034bGhwmjaenI6er5c4gcjtnVbt59LL9?=
 =?us-ascii?Q?o+MkPU9yYP5sAB77o/2JjBScAlQ6n03/qEX0vd5YP7XNKH1h9rYu8mZpUVaC?=
 =?us-ascii?Q?lNdiZP6g8D4pfFRkH1trUaiOvKUk55kGwZmJnjBp5fkNAJWhkIlb4uA0fWVN?=
 =?us-ascii?Q?QVWZF5PxffDJoAMr1m2b4mR+025PxmS+J4/GNCKMneghByvMLOUc/aXEFLNY?=
 =?us-ascii?Q?m6hbVDvhsBfSzZVslO46q7OdE9B4jF68TpAMIMOwbp6yyKl+UORP/iDs824C?=
 =?us-ascii?Q?IeeFanx43nvmftYgJCM1BnGDTE30o9I2SV5tWWXYXUCUr0Ix2m6mJAwkMKmh?=
 =?us-ascii?Q?cTzOmHrtFb/00qgMau+YkDWr5M2Ic3VF73PFf4uDgG42zXxweJKssvTQnu4Q?=
 =?us-ascii?Q?833vjuMqou2i3xR5Sws+t+fPU5zmG9X4qv52epPdutjZHuozV+oVXRQP3CIL?=
 =?us-ascii?Q?5Aznq3nrw5HAfQnda4Sda0BAFO8v12y6r054N9Z8817D8KrceQ9STWXUTWY5?=
 =?us-ascii?Q?M6g5P2N2H+Vj/piwyRMLNdIfGjfHgMQT6u5mrlKRhXw3N2BqB+UsEtDuUirB?=
 =?us-ascii?Q?uQ1VWRlvNBuokfQlE3rSIcVoYiloEdRGNDGAY1t7OlDxVwfgWWdkldTRRX55?=
 =?us-ascii?Q?rcyk/dKG6bxneZEHOwuMQfrQgndDEoaoABqLP1KZoSRKiz3S+GFpOsQKVzaU?=
 =?us-ascii?Q?TanJbxRAqF/oVMe6/X+QkTpvSeGjgLq5euM/kDshWXPBy64le3ecCxR26t7e?=
 =?us-ascii?Q?wz2OTRBb9UB55ynySfoARisVHA8fJ+ZDPSm24QuvP8iTiYBsGz/iEVDuYr3h?=
 =?us-ascii?Q?UXQl/fjTVqutS/2cJkZqpQdIHtMu/Ty958Ov+Oi2JgY4fkr/MP3fdY1WcThP?=
 =?us-ascii?Q?jWtOMYjzPHpyjV4bmwHZEZ1AVSHqPw98EYxzetHUwV1gtumMxHtDJSEY0AUX?=
 =?us-ascii?Q?xpR9lub+drb6MHOIK28zy3d8XM8xxhomKlFcokXPDgzC0q6v46hYGNRUk8jk?=
 =?us-ascii?Q?fhsnyKSttnrY/y4EJ2QtmJlgmXnc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB2505.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54303191-8924-4396-ab6f-08d97edad2ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2021 21:40:55.2984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xOdmWPAcJ14nFZInGRxLrD5mp2Tovh+Xb+nw+stOJwcF5fsLgsl4smIHdiZtrbhBOIGG8mN/whjGlDZn7yxtxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0160
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

[AMD Official Use Only]

Hi Matt,

I originally picked the 10 am pdt time slot to avoid those conflicts. But I=
 see the overlap is only partial. I also see Peterz is giving a talk that a=
lso overlaps partially. But I think this is survivable. I suggest we just t=
ry to make this work as best we can. It's not a presentation, it's primaril=
y intended as a meet and greet and discussion. Whatever starts there will c=
ontinue on lkml and etc.

Regards,
Daniel

-----Original Message-----
From: Matthew Wilcox <willy@infradead.org>=20
Sent: Thursday, September 23, 2021 1:39 PM
To: Kuehling, Felix <Felix.Kuehling@amd.com>
Cc: Linux MM <linux-mm@kvack.org>; linux-ext4@vger.kernel.org; linux-xfs@vg=
er.kernel.org; Maling list - DRI developers <dri-devel@lists.freedesktop.or=
g>; linux-kernel@vger.kernel.org; Christoph Hellwig <hch@lst.de>; Jason Gun=
thorpe <jgg@mellanox.com>; Jerome Glisse <jglisse@redhat.com>; Ralph Campbe=
ll <rcampbell@nvidia.com>; Theodore Ts'o <tytso@mit.edu>; Andrew Morton <ak=
pm@linux-foundation.org>; Mel Gorman <mgorman@techsingularity.net>; Peter Z=
ijlstra <peterz@infradead.org>; Phillips, Daniel <Daniel.Phillips@amd.com>;=
 Sierra Guiza, Alejandro (Alex) <Alex.Sierra@amd.com>; Daniel Stone <daniel=
@fooishbar.org>
Subject: Re: BoF at LPC: Documenting the Heterogeneous Memory Model Archite=
cture

[CAUTION: External Email]

On Thu, Sep 23, 2021 at 04:25:08PM -0400, Felix Kuehling wrote:
> Change of plan: Instead of a BoF, this is now a session in the=20
> "GPU/media/AI buffer management and interop MC" micro conference.=20
> Thank you Daniel Stone for making that happen.
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flinu
> xplumbersconf.org%2Fevent%2F11%2Fcontributions%2F1112%2F&amp;data=3D04%7
> C01%7CDaniel.Phillips%40amd.com%7Cb5064a1c5649431a90be08d97ed2517b%7C3
> dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637680264672385094%7CUnknown
> %7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ
> XVCI6Mn0%3D%7C2000&amp;sdata=3De%2Bpn4vXZI9yhLAbB8rtqik6OiZsEwOCBMdqk4JZ
> n%2FC8%3D&amp;reserved=3D0
>
> It is scheduled for tomorrow (Friday) 08:40-10:00 Pacific, 11:40-13:00=20
> Eastern, 15:40-17:00 UTC.

That's up against:

 Direct map management
Vlastimil Babka, Mike Rapoport, Rick Edgecombe  11:30-12:15.

Seems like a lot of the same people would want to be in both sessions.
Maybe one could be moved?=
