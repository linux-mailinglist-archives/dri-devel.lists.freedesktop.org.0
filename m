Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8661446026
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 08:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8616E045;
	Fri,  5 Nov 2021 07:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284CE6E045
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 07:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcZ9MQkCfypAbIHKFcVvEeQvRwH2071dI+sDwgQvUreifKU+pN4fD+WzTuOuW12UFJ05RRdErymDmhnuETA1UMds9d01VjWZk9ispFKaJyJCrJ/P4zifAPkIujJvsDpx/Be7i6myhyKR69c00gI0aIFB35N1/yXByd5JZakTFj+Nds4QBojJv+oTfAUnQJoWYKAxA4zXkZ0Fhi2Z1nzfbd1tVRnP3rZmaPHk1f7/vnkyS5wF/wEX6OfJOhPhpyB2jB1I1PZmoRNk0Jco/DeH/G7fKUXZR57o4g5dVKU3f2dlf3PfueJzjQguusENzb8iL+GJdJVrxrfbzJbQa7IV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMQBSo9XFfoXDV5H8pBpBIYfSrP5fcNTWmJ3z+/HMV4=;
 b=IDXKlyse6s24Ql6x+djGZ07RufP7mUonVej+yOy2bGaM//zTnAocy5yXutUag3uaCOD73e5Si/a6vzEh52HqiUT8nIdVVCLeTL7TifQ2NeNauIb2qSvryK06kAQJcc121AOqGHvsG/iT5hj1GXhplqMj7PxzUYlzQ9G9vE9WQ8xHa8xiMdnkX5MZ/70b6zVDQFQmT8WY7OR2MDh3gu1+/pfYTeS6bc2/BOVm4nvf4mEQu12liMNbW0uOl3oHp1RViJCtacJGAiTHbt1pNl/0yFhwyVjIXejnG88Jwh1lhSgqOyayyeoyDOv0NF3ympOFIUFkAYAM9ZoxDZ7Ktj0jRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMQBSo9XFfoXDV5H8pBpBIYfSrP5fcNTWmJ3z+/HMV4=;
 b=zDlAF4HK6F1pxP83+EYYga3vrtr7juABDaspkb3nisiPydLao2EA8pBnAATRQCS0TKyJqYeWsfccFqXovF02vF0Fh7jI+mzlqbvnz3PK9s4Q3zWNVb55q5uQB492MyzDiNfRK+dmjC5E5CJuSRPohHpzgUkYOkP+dSmtgbe74X4=
Received: from MWHPR12MB1631.namprd12.prod.outlook.com (2603:10b6:301:f::19)
 by MW3PR12MB4489.namprd12.prod.outlook.com (2603:10b6:303:5e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 07:35:06 +0000
Received: from MWHPR12MB1631.namprd12.prod.outlook.com
 ([fe80::48ee:f48:5a1:dcd8]) by MWHPR12MB1631.namprd12.prod.outlook.com
 ([fe80::48ee:f48:5a1:dcd8%8]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 07:35:06 +0000
From: "Yuan, Perry" <Perry.Yuan@amd.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereference on
 drm_dp_dpcd_access
Thread-Topic: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereference on
 drm_dp_dpcd_access
Thread-Index: AQHXzudL2995hzb9gUSl5xB6lKH0RavupMsAgADbG0CAAGzFgIABkBRAgAAyHYCAAstmgA==
Date: Fri, 5 Nov 2021 07:35:06 +0000
Message-ID: <MWHPR12MB163123C11A51C8B82F80F3CC9C8E9@MWHPR12MB1631.namprd12.prod.outlook.com>
References: <20211101061053.38173-1-Perry.Yuan@amd.com>
 <87a6iodnz7.fsf@intel.com>
 <MWHPR12MB1631610D235FCC3B47064F6B9C8B9@MWHPR12MB1631.namprd12.prod.outlook.com>
 <87y267c5nc.fsf@intel.com>
 <MWHPR12MB163124867D43AD8E19EED1D39C8C9@MWHPR12MB1631.namprd12.prod.outlook.com>
 <87wnlpbhma.fsf@intel.com>
In-Reply-To: <87wnlpbhma.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-11-05T07:35:02Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=6d422305-6d27-419e-9d75-65b4ec9c28ea;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e845b59-7c61-4e4a-6ff0-08d9a02ec9f0
x-ms-traffictypediagnostic: MW3PR12MB4489:
x-microsoft-antispam-prvs: <MW3PR12MB44896373266819EC0413F3099C8E9@MW3PR12MB4489.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vohH8sI6yHNgbuPpBJytnL69GFW4vn2P51TK/IzrQ9Ek5dbWXtsiqPVNM5VnU7ZJEsmS+99Spxe7eD7/yvnCOess+4CeAfUzcf8qWAgjlqwArJcJHMwkSohQpFe1oJ3UP0UDS1NgsQoFAVqXxJunMQFB0lqnP6iuLXjbdI0YtRAe1fzlrG5sBYFPdZiZlUf6D0nLY0hCamlIAvJqe4tIJtXtP2jMxY1Mbxknp9JWR7pL59agUoB8nGcWwOy4LB/lQG1AL8LHc04X9ihg6qEn7GbWsfklNVnwslywmdGhhN98b6aMUTC+Fpc0b7U9NSNytlp5i3DhUqWtWCJk1VBLl+W3tVKfufelwZ5yuSyPef40C1K+8rnevzt7Hkr4MXFpNNsUvx7dlSW7jr2ZzDgyTTS0YV22MOHdIW1x9O+6c76Wq51emvAPA0k/cKbCTLfcU3EMf9lCiaL31dDpdtQ7p0k6ZCGQOAy9AaSkbYciCtDG5P4ItrWzR49ROj6K2LKSCZPmBGWY/8F/nnYU26NiXWGbHmTR07ykIOEFQy6jXNsMWsWES/sXVTlXTTJmfirc18fM3STYhVq2H5HMm9LP+l1EHKlAFhoc+Fnx0y4nrNUb80LVLl9YAd3LjoQ7jOlmN4GdiqK6SG21U8pMrJmXyTMyVg7NavEYBCEfxT+RzmE98nkiYZ+KUD2LXv67+2Rc3ElI0330MmfjAUyHueD1w8rdtGOWdB+IadK5ie9yDT3xpSKP9nXHtrGAL4MKwJAn5h7XGkJQj26NVHhPpMImTPFAnVBIz1daeNNyyzJsJUk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1631.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(45080400002)(6506007)(966005)(54906003)(508600001)(38070700005)(9686003)(110136005)(2906002)(7696005)(316002)(186003)(71200400001)(122000001)(38100700002)(52536014)(66946007)(64756008)(33656002)(66476007)(4326008)(66446008)(66556008)(83380400001)(76116006)(8936002)(53546011)(86362001)(26005)(8676002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lhxfKhhPBa0K7FOhelNG/lzI2NB3jiPka0xDSEFVgf1PWdH2f/lXNRZz0m8r?=
 =?us-ascii?Q?FFupKGwZx0U6WK14EU8KuaT9Uy873fdOCZAzFh7mv0TH/9YNTu5q5hbn0EX/?=
 =?us-ascii?Q?TkU3TEFSklgRTdOPgURNpz6sA2JkGGbURe3hLlJ3L9TrO64mfA5aA/uq3xGJ?=
 =?us-ascii?Q?4zULtP7ZsOaF898pVsYAjEarZVVL6rKJJSOLVC+KDJXX3mUBd164MrGSi/Hn?=
 =?us-ascii?Q?ymRAG6flbUfvzzP6VzncSl8IVaXrjNjF4HlGOdtEkkdC8pGo9RcSeEqkkdvl?=
 =?us-ascii?Q?HdrDRBQLC0D4cUeGkKCLQnCC8xLTSI2cLOXMhTjV24V9qBvz+i0ZhR/Hwye7?=
 =?us-ascii?Q?Gc2KW9xZ6Ws3C2rN9UlJRW8okt+IjZmSBAdbBcIOezU+9OAKSOkZrRdcU316?=
 =?us-ascii?Q?DJyiCvnzhBRYBFBwk2c1M35x+yfzamKBNsa/ppM9ymIexdCkiuMJrhg3oGDF?=
 =?us-ascii?Q?teRSYzyA2WJMrv+j1HXW4gjGQwqss/kjikWMlsS23CPN+nTMEUX6MNoRnlTX?=
 =?us-ascii?Q?Dk+Nun1xXJsWfVzTL9qO7cULORuQIUDNMLGCE4u8qxaj/9lQs8+5UIjz4r74?=
 =?us-ascii?Q?2hFsg0P12DWAZ5tKEtmILpE+9bacAqFROmlZ06o7DbjXdlXV1x7hsh21DGl/?=
 =?us-ascii?Q?miHSX91/2VRrmJpYCCL7ZwnNqpu2Aej1A6gxNVRDSnH3yY+L768f/4BBaSrA?=
 =?us-ascii?Q?xEhuBOo6/IPox61VrQQbFnKffMAqsSfONTnO4DtuNpP9a6ZrTTOGUQ2HaZh6?=
 =?us-ascii?Q?9evjZIxnhChJGYDju6M9ekuCXf1ORBMl4UdeGko0k/7aWUwKrgTPUu3yTv/d?=
 =?us-ascii?Q?qg1K2+3xG6yjwb6PGv19dovy9d76INxA1v0qf9KvjNENqavoVJegGLrWc/HQ?=
 =?us-ascii?Q?jfpOuLsEp63HRy3SKDROyHo8jkzl/894PDbXPbEO0hiNJMnBiq0JDr3rEKat?=
 =?us-ascii?Q?Y7xHlfFN9fZf+vDh1aJwsbbTRPUP+cQRNufSRtCQUBOmyGgkly70LmmVU0Yf?=
 =?us-ascii?Q?x1p2EMe/7j+Ox0SsSObSbqVs6UuGf060FM1b8uO+HdRMZ0PxMkkD+aIBmNqB?=
 =?us-ascii?Q?+lwnBldA0dfaFqVXkNBiL4nWR71KXYM3Mi1BYkgEkbxPYcUWs3awQMXUgG+d?=
 =?us-ascii?Q?eUsfBlGYqjx+LQKAcWvcV1V199+R5UMXB67FdO80lWQwQIRcTv7o4truVhb2?=
 =?us-ascii?Q?ZuhkrcBFZ52nLXVNXKMA4snz7tRYUkPb7xFtKnrcnzOdeaGxAgNXH5C/V/58?=
 =?us-ascii?Q?IJmYeFWsouZ8WEkucmzv7z5JXeiGlexGbF7U9HTWI1F/bnvO63oPVslPR6aO?=
 =?us-ascii?Q?/QKKIAsbpiGck6Evf48qPqQrhBDuxpaQNNQPzmPMLZ+0Kr0IlUjTwomViYvg?=
 =?us-ascii?Q?p0G387mKOF9ON4cYq95BaaD5/2Jv8sIRGVVOvDnMAK2+Z4DehKOu5uKpL4/G?=
 =?us-ascii?Q?zE0ss23VmHvoljIvnFCZNZBwF2GlC7dVumjvHXXfeDfQWF5vvXAoG+lXPqHa?=
 =?us-ascii?Q?Rtvr8fTVaggZx9EYkuqcBGP/hKmZXIW7JrRfvKKW64kH+83Sm4p0GvQ+AQvY?=
 =?us-ascii?Q?FU2buNHB8tpMozF2WMCE1dbuWW2/UyxqA46zXLPK5VG+D8nfTHtp4+yZ/B4f?=
 =?us-ascii?Q?/fAebn20c9wbz2BGzmzAV9A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1631.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e845b59-7c61-4e4a-6ff0-08d9a02ec9f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2021 07:35:06.3664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQKA3DB0B4jHuFv8622XDuSolCKEv4NG6zYdgxuQmGkJxu7eGlRMyPfPojOL86QtfF3HMUs+T+EvF4glhw3RUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4489
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
Cc: "Huang, Shimmer" <Xinmei.Huang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Hi Jani:


> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Wednesday, November 3, 2021 7:31 PM
> To: Yuan, Perry <Perry.Yuan@amd.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Huang,
> Shimmer <Xinmei.Huang@amd.com>; Huang, Ray <Ray.Huang@amd.com>
> Subject: RE: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereferenc=
e
> on drm_dp_dpcd_access
>=20
> [CAUTION: External Email]
>=20
> On Wed, 03 Nov 2021, "Yuan, Perry" <Perry.Yuan@amd.com> wrote:
> > [AMD Official Use Only]
> >
> > Hi Jani:
> >
> >> -----Original Message-----
> >> From: Jani Nikula <jani.nikula@linux.intel.com>
> >> Sent: Tuesday, November 2, 2021 4:40 PM
> >> To: Yuan, Perry <Perry.Yuan@amd.com>; Maarten Lankhorst
> >> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> >> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> David
> >> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>
> >> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org;
> >> Huang, Shimmer <Xinmei.Huang@amd.com>; Huang, Ray
> <Ray.Huang@amd.com>
> >> Subject: RE: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer
> >> dereference on drm_dp_dpcd_access
> >>
> >> [CAUTION: External Email]
> >>
> >> On Tue, 02 Nov 2021, "Yuan, Perry" <Perry.Yuan@amd.com> wrote:
> >> > [AMD Official Use Only]
> >> >
> >> > Hi Jani:
> >> > Thanks for your comments.
> >> >
> >> >> -----Original Message-----
> >> >> From: Jani Nikula <jani.nikula@linux.intel.com>
> >> >> Sent: Monday, November 1, 2021 9:07 PM
> >> >> To: Yuan, Perry <Perry.Yuan@amd.com>; Maarten Lankhorst
> >> >> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> >> >> <mripard@kernel.org>; Thomas Zimmermann
> <tzimmermann@suse.de>;
> >> David
> >> >> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>
> >> >> Cc: Yuan, Perry <Perry.Yuan@amd.com>;
> >> >> dri-devel@lists.freedesktop.org; linux- kernel@vger.kernel.org;
> >> >> Huang, Shimmer <Xinmei.Huang@amd.com>; Huang, Ray
> >> <Ray.Huang@amd.com>
> >> >> Subject: Re: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer
> >> >> dereference on drm_dp_dpcd_access
> >> >>
> >> >> [CAUTION: External Email]
> >> >>
> >> >> On Mon, 01 Nov 2021, Perry Yuan <Perry.Yuan@amd.com> wrote:
> >> >> > Fix below crash by adding a check in the drm_dp_dpcd_access
> >> >> > which ensures that aux->transfer was actually initialized earlier=
.
> >> >>
> >> >> Gut feeling says this is papering over a real usage issue
> >> >> somewhere else. Why is the aux being used for transfers before
> >> >> ->transfer has been set? Why should the dp helper be defensive
> >> >> against all kinds of
> >> misprogramming?
> >> >>
> >> >>
> >> >> BR,
> >> >> Jani.
> >> >>
> >> >
> >> > The issue was found by Intel IGT test suite, graphic by pass test ca=
se.
> >> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg
> >> > itl
> >> > ab.freedesktop.org%2Fdrm%2Figt-gpu-
> >> tools&amp;data=3D04%7C01%7CPerry.Yuan
> >> > %40amd.com%7C83d011acfe65437c0fa808d99ddc65b0%7C3dd8961fe4
> 884e6
> >> 08e11a8
> >> >
> >>
> 2d994e183d%7C0%7C0%7C637714392203200313%7CUnknown%7CTWFpbG
> Zsb
> >> 3d8eyJWIj
> >> >
> >>
> oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1
> 00
> >> 0&am
> >> >
> >>
> p;sdata=3DsnPpRYLGeJtTpNGle1YHZAvevcABbgLkgOsffiNzQPw%3D&amp;reser
> ved
> >> =3D0
> >> > normally use case will not see the issue.
> >> > To avoid this issue happy again when we run the test case , it will
> >> > be nice to
> >> add a check before the transfer is called.
> >> > And we can see that it really needs to have a check here to make
> >> > ITG &kernel
> >> happy.
> >>
> >> You're missing my point. What is the root cause? Why do you have the
> >> aux device or connector registered before ->transfer function is
> >> initialized. I don't think you should do that.
> >>
> >> BR,
> >> Jani.
> >>
> >
> > One potential IGT fix patch to resolve the test case failure is:
> >
> > tests/amdgpu/amd_bypass.c
> >       data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe_id,
> >                                        - AMDGPU_PIPE_CRC_SOURCE_DPRX);
> >                                        + INTEL_PIPE_CRC_SOURCE_AUTO);
> > The kernel panic error gone after change  "dprx" to "auto" in the IGT t=
est.
> >
> > In my view ,the IGT amdgpu bypass test will do some common setup work
> including crc piple, source.
> > When the IGT sets up a new CRC pipe capture source for amdgpu bypass
> test,  the SOURCE was set as "dprx" instead of "auto"
> > It makes "amdgpu_dm_crtc_set_crc_source()"  failed to set correct  AUX
> and it's  transfer function invalid .
> > The system I tested use HDMI port connected to monitor .
> >
> > amdgpu_dm_crtc_set_crc_source->    (aux =3D (aconn->port) ? &aconn-
> >port->aux : &aconn->dm_dp_aux.aux;)
> >        drm_dp_start_crc ->
> >               drm_dp_dpcd_readb->   aux->transfer is NULL, issue here.
> > The fix will  use the "auto" keyword, which will let the driver select =
a
> default source of frame CRCs for this CRTC.
> >
> > Correct me if have some wrong points.
>=20
> Apparently I'm completely failing to communicate my POV to you.
>=20
> If you have a kernel oops, the fix needs to be in the kernel, not IGT.
>=20
> The question is, why is it possible for IGT (or any userspace) to trigger=
 AUX
> communication when the ->transfer function is not set? In my opinion, the
> kernel driver should not have exposed the interface at all if the ->trans=
fer
> function is not set. The interface is useless without the ->transfer func=
tion.
> IMO, that's the bug.
>=20

Yes , you are correct , the transfer shouldn't be called before it is ready=
 !

Let me explain more details in my view .
Maybe the root cause is not why the aux->transfer is not called before it i=
s registered in this case.
I suppose the issue was triggered by wrong CRC pipe source .

Actually the aux->transfer has been registered when amdgpu DM registered at=
 kernel boot.
IGT test was run when system login to Gnome desktop.

amdgpu_dm_initialize_dp_connector->
aconnector->dm_dp_aux.aux.transfer =3D dm_dp_aux_transfer;

The test case failed when the IGT  set an  "DPRX"  CRC pipe source while th=
e HDMI connected to monitor only.
At this time, the aux->transfer is NULL,  and dp helper did not check the t=
ransfer pointer NULL or not.
It calls the transfers to DPCD read, then you see the kernel panic log.
=20
amdgpu_dm_crtc_funcs->  amdgpu_dm_crtc_set_crc_source-> drm_dp_start_crc=20

* And if the DP cable connected only, the issue will not happen.  Test will=
 pass.
* If I change the CRC source to "auto", kernel will not see the panic as we=
ll.
Maybe the failed test case need to run on the DP  instead of HDMI, I am not=
 sure at now.


Hopping this info can help.=20

Perry.
=20

>=20
> BR,
> Jani.
>=20
> >
> > Thank you!
> > Perry.
> >
> >>
> >> >
> >> > Perry.
> >> >
> >> >>
> >> >> >
> >> >> > BUG: kernel NULL pointer dereference, address: 0000000000000000
> >> >> > PGD
> >> >> > 0 P4D 0
> >> >> > Oops: 0010 [#1] SMP NOPTI
> >> >> > RIP: 0010:0x0
> >> >> > Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
> >> >> > RSP: 0018:ffffa8d64225bab8 EFLAGS: 00010246
> >> >> > RAX: 0000000000000000 RBX: 0000000000000020 RCX:
> >> >> > ffffa8d64225bb5e
> >> >> > RDX: ffff93151d921880 RSI: ffffa8d64225bac8 RDI:
> >> >> > ffff931511a1a9d8
> >> >> > RBP: ffffa8d64225bb10 R08: 0000000000000001 R09:
> >> >> > ffffa8d64225ba60
> >> >> > R10: 0000000000000002 R11: 000000000000000d R12:
> >> >> > 0000000000000001
> >> >> > R13: 0000000000000000 R14: ffffa8d64225bb5e R15:
> >> >> > ffff931511a1a9d8
> >> >> > FS: 00007ff8ea7fa9c0(0000) GS:ffff9317fe6c0000(0000)
> >> >> > knlGS:0000000000000000
> >> >> > CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> >> > CR2: ffffffffffffffd6 CR3: 000000010d5a4000 CR4:
> >> >> > 0000000000750ee0
> >> >> > PKRU: 55555554
> >> >> > Call Trace:
> >> >> > drm_dp_dpcd_access+0x72/0x110 [drm_kms_helper]
> >> >> > drm_dp_dpcd_read+0xb7/0xf0 [drm_kms_helper]
> >> >> > drm_dp_start_crc+0x38/0xb0 [drm_kms_helper]
> >> >> > amdgpu_dm_crtc_set_crc_source+0x1ae/0x3e0 [amdgpu]
> >> >> > crtc_crc_open+0x174/0x220 [drm]
> >> >> > full_proxy_open+0x168/0x1f0
> >> >> > ? open_proxy_open+0x100/0x100
> >> >> > do_dentry_open+0x156/0x370
> >> >> > vfs_open+0x2d/0x30
> >> >> >
> >> >> > v2: fix some typo
> >> >> >
> >> >> > Signed-off-by: Perry Yuan <Perry.Yuan@amd.com>
> >> >> > ---
> >> >> >  drivers/gpu/drm/drm_dp_helper.c | 4 ++++
> >> >> >  1 file changed, 4 insertions(+)
> >> >> >
> >> >> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> >> >> > b/drivers/gpu/drm/drm_dp_helper.c index
> >> >> > 6d0f2c447f3b..76b28396001a
> >> >> > 100644
> >> >> > --- a/drivers/gpu/drm/drm_dp_helper.c
> >> >> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> >> >> > @@ -260,6 +260,10 @@ static int drm_dp_dpcd_access(struct
> >> >> > drm_dp_aux
> >> >> *aux, u8 request,
> >> >> >       msg.buffer =3D buffer;
> >> >> >       msg.size =3D size;
> >> >> >
> >> >> > +     /* No transfer function is set, so not an available DP conn=
ector */
> >> >> > +     if (!aux->transfer)
> >> >> > +             return -EINVAL;
> >> >> > +
> >> >> >       mutex_lock(&aux->hw_mutex);
> >> >> >
> >> >> >       /*
> >> >>
> >> >> --
> >> >> Jani Nikula, Intel Open Source Graphics Center
> >>
> >> --
> >> Jani Nikula, Intel Open Source Graphics Center
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
