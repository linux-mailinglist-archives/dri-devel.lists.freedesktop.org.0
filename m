Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87B33FD0BB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 03:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9390E6E10D;
	Wed,  1 Sep 2021 01:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E106E107;
 Wed,  1 Sep 2021 01:30:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rx7ZLbWkQiTKqYe/GPWSU0FeisM2ICwsAlER45IfRZUqGBB5RLCaOgS40SFgEsiBjvcdzgAjj+vmzelc/3f140IDhoYg8Qn8FKBgg2tlefHfrwa0rJrjXQVKiz+eX/JfyETNqvqDo/7/3TAfNu3cb1hnW5IBqFItq8Yhz92f9XT8kYKPTIzzlcyQz2lqak/KZO8ybdjqv8uQzhtDnGlpt+QWIdBT1hq0LWN1LFkZCU1M/s50+Um8AHdJtK+RLqiFKY1kUrK2kSaevHQpXLpUuuaLTe1UaiCCwpoF417xAvh4YCiJpddmeaMNOv16uJoogRsyBgfrP9A37hNhv/cSRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=QAu+0GK19Peut1mMsW4NxJZZOkwuZmN1gCWHYj2rRrg=;
 b=eU3VgpQnwooGbZGeqAOBVXox/wMhjepC4cB0OzZkuyBAR3uvAl3GzXmlXF3yWBnZUoODXcSk9bMYNoCmAPVGyy4S+k/23eN6BhxMhXZfpwSxlo0ge9exMy915XG6t4aV9NHIopihwEkqM1qQ1Sxt/NNSSsodfaQT9b0laqHhcsR/VdB+lQyNpeERFdn/YqwpZG0hET5rLW6OTfNXqPG8pw6br/njqZLwLeUPQJKZMpMTtfWGSWFHtvVEMihl4iv6XCebO/ExgD+11QJ2dwIVrDJ7B+sRS+2m2ryoirMk1lXKGyW7+53WEuroHzk2/TNvl9Mq8fRp5tlH6ruv/ESHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAu+0GK19Peut1mMsW4NxJZZOkwuZmN1gCWHYj2rRrg=;
 b=QRByJYsACjAkhpL2zg4ufcbnW6ztcR85KAKwSIVoYDoY5v87Wj1Q+xCjNaZHZa6IYZYqU1XhP0IiD3a+TiI32gRvnEXusBlEMCRmePbfPd7CjlofOdYcM+YI8Z63TkIuDfIZM0RrruX6vhKmTG4IMC9CrLjDytRv44K4mypYlU4=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5224.namprd12.prod.outlook.com (2603:10b6:208:319::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 01:30:45 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 01:30:45 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
CC: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/sched: fix the bug of time out calculation(v3)
Thread-Topic: [PATCH] drm/sched: fix the bug of time out calculation(v3)
Thread-Index: AQHXmjadxsIrIGn2Y02EiNcylnR376uF0cOAgABnvwCAALnqcIAAbyWAgAAI6wCAAEEfgIAAAjQAgAXvW4CAAM8IcA==
Date: Wed, 1 Sep 2021 01:30:45 +0000
Message-ID: <BL1PR12MB526981C97D188633E7C728D984CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
 <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
 <BL1PR12MB5269AAC2FA518CF85724C85D84C89@BL1PR12MB5269.namprd12.prod.outlook.com>
 <257202a9-a670-5b89-f98d-01855b6e41cf@amd.com>
 <da180d36-b5dd-733e-3721-3333b0cf405e@gmail.com>
 <9bb9b448-ea93-e8f9-818e-c6d27d4a8264@amd.com>
 <8171ae25-72b6-7400-6969-61885ca5094b@amd.com>
 <YS4pz4SZBLPyllG+@phenom.ffwll.local>
In-Reply-To: <YS4pz4SZBLPyllG+@phenom.ffwll.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-01T01:30:44Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=b5fcefe8-2217-4699-90c3-b7b72f7fc7e8;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91f19b1e-6d5a-48b0-7c37-08d96ce81eea
x-ms-traffictypediagnostic: BL1PR12MB5224:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB522476D13269EE76CEA4495C84CD9@BL1PR12MB5224.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZITAUskfftz1pkA2EpjUxSCdTJIx7Yu/EyHPl/ICGyG3sjOrKInwR3AC2yEOypkypXcib9MMmDDemHz/6xw+wJ/Ok0grP2yZYBuQk50+lZ0NfIIVIHSudjj5Mu6Lbf+qVsIBuSKo3zcikyLNRXWge/Mhj2LQ9A7Ux/uyCiUwClne65ccyfw2oXuSpt9gjd4arkPj7sQXBhRINjDxwEtpVvIgD7yvdJRVfXF13/qWPWWdm7PDICJAtPeP9OJvZISPIOyZnXryIqE5DvB3ibxUjV9h83WPywVxkvlq+Na4j/2aVM/6KWvSnQ6xtK+h6IHH04mDDMyGzhhyQuiCY/X2Jr+2THHj1plTuHi8efpmXNgMLxClGNIeyIKoPlA7/1avzZ68MX1CcqBT2FSGaq/udGKfViKnz3mU/XlPPvX1Y6JF/MRr7I1/0zyhCsNNCTUn8dD1q73P8IADaLm9Z1FLzzwrYeqOifRECn3xvlQqPI08s9NXh+3ShkNuyEleoks52bU/Ke9N521bQVEV9O2ghzGP2WSkDmMPsuDcj8bA5tKs8ISCMm1Vuq7X9Hju8Rn16SMpXp48TBoP6F0EC8uXUPkYg47bUi9fnDHvgaz291XiVb9N4iEKk6cLic89enFAXzYqBBVO54BbazU+najdxXTIq0RjRW3+vwfJ6E2GqWPmCKLtaZucMZYxslDPdx9eMnaZl9uo9ThYj3WC9Tx9Rh+qXe5tYkfV9w5hbu7SDCyGQrthM4lgC+4ZD/gGbum1PWpVq/JgIOc8nQAklh5J+VrDVWaHA2Q/cuJ+dpnLb4GiAzSfuPQgTrk/fo/S3GJNd6A7i+PvyjfJ5SaJgXiWPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(38100700002)(5660300002)(122000001)(7696005)(6506007)(478600001)(53546011)(33656002)(66574015)(71200400001)(2906002)(52536014)(4326008)(110136005)(86362001)(9686003)(55016002)(76116006)(186003)(8676002)(45080400002)(38070700005)(54906003)(966005)(6636002)(316002)(66946007)(26005)(66446008)(64756008)(66556008)(66476007)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?IvNao+iI94irCUq9PJ/VH6dxVB0gvFAYfYCxbpdO/PvG3M8cexfvLJDOBi?=
 =?iso-8859-1?Q?GYZ/kLAcsng//xRNqEfkc0GRmUzQlK08chXbpNutVrfFHOS0XzKN0G6GgW?=
 =?iso-8859-1?Q?z2MKvjqqjn+g7AdEnFlet7Dy9y9/Pc6811+AGdfgSwWWYNLcWqwkuh+Csn?=
 =?iso-8859-1?Q?nM0HfQQUIzZ4KDLzkbnRMi5FzeqSepAaoZPJrcl91U/gImw2Km4pkPx4pk?=
 =?iso-8859-1?Q?MWzKdPWgWSLxmZ9f0loyKRGjhpgyVUJcOkfj4q5/UXddD8VBUitzBYUjvc?=
 =?iso-8859-1?Q?Xe3EwkGs3Xglvx0UnOnBQtJNFwb/VrjtSNWBQ7ZTCAfsC6KsG0B2Rd1zIy?=
 =?iso-8859-1?Q?cDf8+pkpKiwkV1JoxR7TxGHaDLhzkjAIDo6VXsKdMD4wZMiJjo9AmizmKK?=
 =?iso-8859-1?Q?rzBz6PZ6OGHLM6iy9osn8XmNcXQrZ4LbvpJUcYonZ+vHqZwkyPm8+a4v1k?=
 =?iso-8859-1?Q?IX4T8lS9maMej0QDfmlztWPcDpuNITokswygbT4VwZA6XCf3ANovAJF6Fx?=
 =?iso-8859-1?Q?WPfGSgW7ES6Ci8qeepNyEQbIz8khQQzIcBrPtGpnhPVkX2b5KeH+wepH9v?=
 =?iso-8859-1?Q?7/UdMu+Nc7YcCycdtWr0nxuCZ9wWAIk6q8xO4foLgXoZa5Cdc5B8X+d3fv?=
 =?iso-8859-1?Q?LjJCXjyrES51ka0YnJdEUyAcP+jgeDwA38z6LTaQEhf78RL3aOpsQdXpzy?=
 =?iso-8859-1?Q?rJX2QWueRaRpRw8ZIJr7s+1nDzkov4FfHgRo3NW6uUDeP8GuTml0CaIYXr?=
 =?iso-8859-1?Q?SCdtEXCkpUpS9SbsFO0aN9YQOU48Vl9RjQ9TeXUNIb99FiZKnA93wOv4HX?=
 =?iso-8859-1?Q?BFJXR8szmF+E/IejaZZ5/IYcu8Qh9CcjVvlGj2v3vVcKwzqOoMUoSnhSdM?=
 =?iso-8859-1?Q?gvrzI+in/BCSmwhyg0UFb5Ln8a9taIEg+OJ1kJFC1hc0KIH3v1pRlO2uzq?=
 =?iso-8859-1?Q?nPIvxC3NdTFi4ciDAahGPazoAI0TooPrSCFflFbT2lfqNf2Dkky4YVCkcV?=
 =?iso-8859-1?Q?ZcijJzetgDt3ht/CwfiEJjErNW476c8eJJ+WIKFtTbvEMWC1HQ9w0t30R0?=
 =?iso-8859-1?Q?rfSIn9thza4zlUIXs452NZin6ITCIZDhj2gxrcWuxNSw4EIdckNOTnodJA?=
 =?iso-8859-1?Q?T8jMMiGPzCrG3FCz8qdaSml3GMqUFPMPjgcYB56a3inqY1Py9zqFIIUj7Q?=
 =?iso-8859-1?Q?VrFXJiSB9jkLKD15ewXrownJCibKpl9biMihlAm/mcEb45FakHvSG9M4ij?=
 =?iso-8859-1?Q?EjrCv7tJsG2LOSIu+iOPrLGBAfpywcSbRJrkYLsYvnF5LhLkn9gD4oFEPj?=
 =?iso-8859-1?Q?4CYz9AWwEHHqEqXEUa6B2meILPUyItSj816HTtM4Opn2REQ/9absajYBN1?=
 =?iso-8859-1?Q?YaF1GzkGOg?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f19b1e-6d5a-48b0-7c37-08d96ce81eea
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 01:30:45.5735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yZ0hRg/zCgHdeyDofa3lV6YOlzEwQzCA3NHPCRQDQtNi/pDYJZpCvx1jlFOPs+Hq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5224
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

That' really matter in practice, when two jobs from different process sched=
uled to the ring close to each other, if we don't discriminate A from B the=
n B will be considered a bad job due to A's timeout, which will force B's p=
rocess to exit (e.g.: X server)

Thanks=20

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------

-----Original Message-----
From: Daniel Vetter <daniel@ffwll.ch>=20
Sent: Tuesday, August 31, 2021 9:09 PM
To: Koenig, Christian <Christian.Koenig@amd.com>
Cc: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Christian K=F6nig <ckoe=
nig.leichtzumerken@gmail.com>; Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.=
freedesktop.org; dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)

On Fri, Aug 27, 2021 at 08:30:32PM +0200, Christian K=F6nig wrote:
> Yeah, that's what I meant with that the start of processing a job is a=20
> bit swampy defined.
>=20
> Jobs overload, but we simply don't have another good indicator that a=20
> job started except that the previous one completed.
>=20
> It's still better than starting the timer when pushing the job to the=20
> ring buffer, because that is completely off.

Not sure this matters that much really in practice, and in some cases we mi=
ght want to actually just reset it all if the built up backlog is way too l=
ong.

For anything that really runs way too long you want preempt-ctx/revoke fenc=
es anyway, not end-of-cs fences with tdr.
-Daniel

>=20
> Christian.
>=20
> Am 27.08.21 um 20:22 schrieb Andrey Grodzovsky:
> > As I mentioned to Monk before - what about cases such as in this=20
> > test -=20
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi
> > tlab.freedesktop.org%2Fmesa%2Fdrm%2F-%2Fcommit%2Fbc21168fa924d3fc4a0
> > 00492e861f50a1a135b25&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7Cbd1847
> > 4429e34f8eaac208d96c80710e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C
> > 0%7C637660121179715855%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> > CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D1WTD3
> > opiBtT29bbbqJub5nfhWgX5vMNppiFKgWDe%2FoQ%3D&amp;reserved=3D0
> >=20
> > Here you don't have serialized sequence where when jobs finishes=20
> > processing and second starts, they execute together=A0 concurrently -=20
> > for those cases seems to me restarting the timer for the second job=20
> > from scratch will let it hang much longer then allowed by TO value.
> >=20
> > Andrey
> >=20
> > On 2021-08-27 10:29 a.m., Christian K=F6nig wrote:
> > > I don't think that makes sense.
> > >=20
> > > See we don't want to start the time when the job is inserted into=20
> > > the ring buffer, but rather when it starts processing.
> > >=20
> > > Starting processing is a bit swampy defined, but just starting the=20
> > > timer when the previous job completes should be fine enough.
> > >=20
> > > Christian.
> > >=20
> > > Am 27.08.21 um 15:57 schrieb Andrey Grodzovsky:
> > > > The TS represents the point in time when the job was inserted=20
> > > > into the pending list.
> > > > I don't think it matters when it actually starts to be=20
> > > > processed, what matters is when this job was inserted into=20
> > > > pending list because right at that point you arm the TO timer=20
> > > > (when no other is running already) and so when the previous job=20
> > > > completes and you cancel and rearm again you can use that TS=20
> > > > from the next job in pending list to calculate how much time has=20
> > > > actually left for it to run before TDR must be initiated and not=20
> > > > just give it again full TO value to run even if it has already=20
> > > > been running for a while.
> > > >=20
> > > > Also, i am not sure also about the assumption that what we=20
> > > > measure is processing by HW, what we measure is from the moment=20
> > > > it was scheduled to ring to the moment the job completed (EOP=20
> > > > event). At least that what our TDR timer measures and so it=20
> > > > makes sense to set the TS at this point.
> > > >=20
> > > > Andrey
> > > >=20
> > > > On 2021-08-27 3:20 a.m., Liu, Monk wrote:
> > > > > [AMD Official Use Only]
> > > > >=20
> > > > > what is that 'ts' representing for ? it looks to me the=20
> > > > > jiffies that it get scheduled to the ring,=A0 but a job=20
> > > > > scheduled to the ring doesn't represent it's being processed=20
> > > > > by hw.
> > > > >=20
> > > > > Thanks
> > > > >=20
> > > > > ------------------------------------------
> > > > > Monk Liu | Cloud-GPU Core team
> > > > > ------------------------------------------
> > > > >=20
> > > > > -----Original Message-----
> > > > > From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> > > > > Sent: Friday, August 27, 2021 4:14 AM
> > > > > To: Liu, Monk <Monk.Liu@amd.com>;=20
> > > > > amd-gfx@lists.freedesktop.org; Koenig, Christian=20
> > > > > <Christian.Koenig@amd.com>
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Subject: Re: [PATCH] drm/sched: fix the bug of time out
> > > > > calculation(v3)
> > > > >=20
> > > > > Attached quick patch for per job TTL calculation to make more=20
> > > > > precises next timer expiration. It's on top of the patch in=20
> > > > > this thread. Let me know if this makes sense.
> > > > >=20
> > > > > Andrey
> > > > >=20
> > > > > On 2021-08-26 10:03 a.m., Andrey Grodzovsky wrote:
> > > > > > On 2021-08-26 12:55 a.m., Monk Liu wrote:
> > > > > > > issue:
> > > > > > > in cleanup_job the cancle_delayed_work will cancel a TO=20
> > > > > > > timer even the its corresponding job is still running.
> > > > > > >=20
> > > > > > > fix:
> > > > > > > do not cancel the timer in cleanup_job, instead do the=20
> > > > > > > cancelling only when the heading job is signaled, and if=20
> > > > > > > there is a "next" job we start_timeout again.
> > > > > > >=20
> > > > > > > v2:
> > > > > > > further cleanup the logic, and do the TDR timer cancelling=20
> > > > > > > if the signaled job is the last one in its scheduler.
> > > > > > >=20
> > > > > > > v3:
> > > > > > > change the issue description remove the=20
> > > > > > > cancel_delayed_work in the begining of the cleanup_job=20
> > > > > > > recover the implement of drm_sched_job_begin.
> > > > > > >=20
> > > > > > > TODO:
> > > > > > > 1)introduce pause/resume scheduler in job_timeout to=20
> > > > > > > serial the handling of scheduler and job_timeout.
> > > > > > > 2)drop the bad job's del and insert in scheduler due to=20
> > > > > > > above serialization (no race issue anymore with the=20
> > > > > > > serialization)
> > > > > > >=20
> > > > > > > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> > > > > > > ---
> > > > > > > =A0=A0 drivers/gpu/drm/scheduler/sched_main.c | 25
> > > > > > > ++++++++++---------------
> > > > > > > =A0=A0 1 file changed, 10 insertions(+), 15 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > index a2a9536..ecf8140 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > @@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct=20
> > > > > > > drm_gpu_scheduler *sched)
> > > > > > > =A0=A0 {
> > > > > > > =A0=A0=A0=A0=A0=A0 struct drm_sched_job *job, *next;
> > > > > > > =A0=A0 -=A0=A0=A0 /*
> > > > > > > -=A0=A0=A0=A0 * Don't destroy jobs while the timeout worker i=
s=20
> > > > > > > running OR thread
> > > > > > > -=A0=A0=A0=A0 * is being parked and hence assumed to not touc=
h=20
> > > > > > > pending_list
> > > > > > > -=A0=A0=A0=A0 */
> > > > > > > -=A0=A0=A0 if ((sched->timeout !=3D MAX_SCHEDULE_TIMEOUT &&
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 !cancel_delayed_work(&sched->work_tdr)=
) ||
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 kthread_should_park())
> > > > > > > +=A0=A0=A0 if (kthread_should_park())
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return NULL;
> > > > > >=20
> > > > > > I actually don't see why we need to keep the above, on the=20
> > > > > > other side (in drm_sched_stop) we won't touch the pending=20
> > > > > > list anyway until sched thread came to full stop=20
> > > > > > (kthread_park). If you do see a reason why this needed then=20
> > > > > > a comment should be here i think.
> > > > > >=20
> > > > > > Andrey
> > > > > >=20
> > > > > >=20
> > > > > > > spin_lock(&sched->job_list_lock); @@ -693,17 +687,21 @@=20
> > > > > > > drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
> > > > > > > =A0=A0=A0=A0=A0=A0 if (job &&=20
> > > > > > > dma_fence_is_signaled(&job->s_fence->finished)) {
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* remove job from pending_lis=
t */
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 list_del_init(&job->list);
> > > > > > > +
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 /* cancel this job's TO timer */
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 cancel_delayed_work(&sched->work_tdr);
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* make the scheduled timestam=
p more accurate=20
> > > > > > > */
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 next =3D=20
> > > > > > > list_first_entry_or_null(&sched->pending_list,
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 typeof(*next), list);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 if (next)
> > > > > > > +
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (next) {
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 next->s_fence->sch=
eduled.timestamp =3D
> > > > > > > job->s_fence->finished.timestamp;
> > > > > > > -
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* start TO timer for next=
 job */
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 drm_sched_start_timeout(sc=
hed);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > =A0=A0=A0=A0=A0=A0 } else {
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 job =3D NULL;
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 /* queue timeout for next job */
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 drm_sched_start_timeout(sched);
> > > > > > > =A0=A0=A0=A0=A0=A0 }
> > > > > > > =A0=A0 =A0=A0=A0=A0=A0 spin_unlock(&sched->job_list_lock);
> > > > > > > @@ -791,11 +789,8 @@ static int drm_sched_main(void=20
> > > > > > > *param)
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 (entity =3D
> > > > > > > drm_sched_select_entity(sched))) ||
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 kthread_should_stop());
> > > > > > > =A0=A0 -=A0=A0=A0=A0=A0=A0=A0 if (cleanup_job) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (cleanup_job)
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sched->ops->free_j=
ob(cleanup_job);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* queue timeout for next =
job */
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 drm_sched_start_timeout(sc=
hed);
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > =A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!entity)
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > >=20
>=20

--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7Cbd18474429e34f8eaac208d9=
6c80710e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660121179715855%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;sdata=3DyB5ssoeNrhCR6b%2BndHJd9IQK2mjoKlpyYP5noVeh=
0iA%3D&amp;reserved=3D0
