Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEAAA478BC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 10:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34F110EA63;
	Thu, 27 Feb 2025 09:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="WqCe7VR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C96010E1E3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:27:27 +0000 (UTC)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QF0mZS002770;
 Wed, 26 Feb 2025 10:27:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 s2048-2021-q4; bh=7I+LQ7S4gIqQdTNrm9BnDtMXwcSBjziz5s4+J+38M08=; b=
 WqCe7VR6f3lqxl3lGPIDattAA+6G0lf3JT6Yeb6dBsammIRAlxqABIREB7xinBMb
 2ivmf7AjS95VZNh+UidC0N2XWb8d0xYa/9bQ6hTubCQ/Xwt5Zt6vyUUxorISQEfh
 w7kBzlaRxngVMq9y9k7HA9ik0Kt07lHPLGU6IlqiafVk5IB8U9xUdBUjmzSubfLg
 +NkvZNHURLye9fBFcFnTx5sv5mw7cTf76RikjB9oq1EE+6bQAYNUassA9EV4XfSA
 SWmcx0Ft8Dz1tcssXgBlk849ML2VOdNh6qzEf1rWadWjun8KxV8ukqNfSc068otz
 88txQWR4K9rBYbhzA6/3zA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 45257gsk9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2025 10:27:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OW8WSa8aUX13iQkmus2bbMCWrktPSsZhMTMR8sOaeVjsOe0n7BkOqcep9PU5GRW6n7SDG6z+LnIgHUjeSE00cWe5f8byLPN9w+YgRcVlq0ICoETPa4+VdUIzdIKDxlGBy7+36FqCY3QZzY5MWvoZXrjfA0eRYXyV/fnr/OM5WE+VPTT+dXZGE3jGG1W4iGjAKJlY5uZTwNthJm2jRpFYMy04O7a0g+0m+rGfz24nZK7MFlcyy56uXu7qHLyMTzKEvNjJaU3VTU5md2EeD1k2v4n6hc9uO3d/v0HnffRaqDWwAYW/pnVHxsbY18PWTifehZNQ/CKz0RBFvum3SmbV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wo6poNKqfKoAf7DUrkVeO6Tz7VgnWEEZJ2tcnems29Q=;
 b=t8YwGj5iRC/DdyE5A1QVN6K8DQsoNy1k/23a3apLAOzPkese3gy71ZQoEL9tDgI7fW+AC8QXLFx8gJXuhE74b2tww6UUVr7ecfL5uSRKApaNNWL1J7IbYNBz2oePZKR028N4WHkuuuic1yVg2hpSMEzWdpkZf+l1JDPdiz2R7K5BuN87Xecko5bVmFU747HdLE/oIJWHFwdGHt2piBNgVIAJODTVwGhYIU+WdeYUyHqkeDBPdde0JoShcURwRggU/HMo3wAiQArx7I3TJcBBtsy5CQuW+z9pk16kATosWWmdNzedD9I04BuWPIpUe3UFPefIyWBWOPrB5Jia84Mrfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SA1PR15MB5258.namprd15.prod.outlook.com (2603:10b6:806:22a::12)
 by IA1PR15MB5920.namprd15.prod.outlook.com (2603:10b6:208:3fc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 18:27:17 +0000
Received: from SA1PR15MB5258.namprd15.prod.outlook.com
 ([fe80::a29e:a332:eb15:993c]) by SA1PR15MB5258.namprd15.prod.outlook.com
 ([fe80::a29e:a332:eb15:993c%5]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 18:27:16 +0000
From: Wei Lin Guay <wguay@meta.com>
To: Leon Romanovsky <leon@kernel.org>
CC: Jason Gunthorpe <jgg@nvidia.com>, "Kasireddy, Vivek"
 <vivek.kasireddy@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, Dag Moxnes <dagmoxnes@meta.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>, Nicolaas Viljoen
 <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Maor Gottlieb <maorg@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Topic: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Index: AQHbT6O5Loc/d/3VGEWjEKeLiKCgu7LpIlYAgAE6MQCAATnSgIBqC0IAgAQGnoCAAF/nAIAASQWAgAAHpwA=
Date: Wed, 26 Feb 2025 18:27:16 +0000
Message-ID: <DA567C0F-82BF-4D60-95D4-7E7AA0FD66FB@meta.com>
References: <20241216095920.237117-1-wguay@fb.com>
 <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <924671F4-E8B5-4007-BE5D-29ED58B95F46@meta.com>
 <IA0PR11MB71858B2E59D3A9F58CEE83DCF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <61DF4F0E-D947-436B-9160-A40079DB9085@meta.com>
 <IA0PR11MB7185E7DBB9E959A2F40D4170F8C22@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250226133822.GA28425@nvidia.com> <20250226175943.GL53094@unreal>
In-Reply-To: <20250226175943.GL53094@unreal>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5258:EE_|IA1PR15MB5920:EE_
x-ms-office365-filtering-correlation-id: 3489671a-a1b8-43db-ef35-08dd569332d1
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?/bxwJ/V1m6KYaC6+Pd5Zr3caPEOd/ZXgJYUg3yQpTS03qIz/tkXYPFC3ca?=
 =?iso-8859-1?Q?NpOLbbXf84rcRqBDmU9hUiXLWgH3fc28hnfvQ+cgi5xT0B4k//Dgs+Ni5h?=
 =?iso-8859-1?Q?cVREASX6lKTPHEBhmM9tZgYWhhIJDE2seNVpCHXZbm4EGg+JfaVmof0YWP?=
 =?iso-8859-1?Q?uj2vMnUusmGLrfOcMigqJjzYB3TW9cOx5de9ASg+vRAzBPkhwNTlVw6nOk?=
 =?iso-8859-1?Q?Ul8t6wQh2F5zeFm6fGWjDZgyBB3S1LWhQNmewB29gJAV4oIrg4EaNn7SKJ?=
 =?iso-8859-1?Q?+8lJZbTeXprwx+OdQDVUMUAxqcE2iudtfd19gGParUyHr0feM9vwBdAkKi?=
 =?iso-8859-1?Q?53H2FBk4tQd9aczKr2fEtxJ8RqJF0HbY7qGZ/ZYzwecl//b+nfRJiINVzi?=
 =?iso-8859-1?Q?iwozFzzF/obLwvSg7eGOD3FBadUhInloH7HfsHsOIyYXER6ig99bteGHjJ?=
 =?iso-8859-1?Q?hhTtW4F32UX+OBHHUOyDGH3PM1mYO6PEGh6TV97NXnN1RnK7gERXLSDhVl?=
 =?iso-8859-1?Q?jzKEYP1dxJfaUGpauCpjHd1UWXKqpp1vxH+ETjD4kyWBQD0cBGJDZS9L0l?=
 =?iso-8859-1?Q?X0XpO0wMzA+8dVTgX/EhFB424OIFUwzlp6FDVE2QbXZn8gh6DrGtqwNSzf?=
 =?iso-8859-1?Q?XMbBkamPxqrEwP78OEtCVciaF2O6iOE0QCXzhEbqaSAR9u8OwVIcrBTcsA?=
 =?iso-8859-1?Q?3PhEwOFbhFVz+1+yqPu7JqQBU9ayNva9Gu8pJhB9MFXFEjoGnHpYe2ITSM?=
 =?iso-8859-1?Q?myyQtuCCcUe+Os3m8WHb7I9fQ4HuUV+3UI4mfvppX3EU8Jc5+FqKshM8Qm?=
 =?iso-8859-1?Q?SmzAKFw4Ol9ptIgEOnK6+ptEwm3WCxfX0CoihQzAu8kbEexd/i/b59zmmL?=
 =?iso-8859-1?Q?lxV2t0i+BJmHa4zk8Ib49D2Y+igDcxqZZDSGAOqAd26AB3Znyx7pPEtZQl?=
 =?iso-8859-1?Q?3Lc87E5FtKvMGx6kd2u2kw/CDb6ShJcLR+E/QZw8lZynErHKVTYUtFeZv0?=
 =?iso-8859-1?Q?aa/H0v9hNJhdlR/QhxX/W675hi6yjkHTC06EMqbtj+sPRXaARaib8bZZee?=
 =?iso-8859-1?Q?zyBflegEHpSp42aTY2ZQqvTOp369GeBZJw8Y3auv5c15WN1UEehi0o/N4p?=
 =?iso-8859-1?Q?3nORUtxNjLDuKK65y7wvINDiWppbKT/kWU8ROJeC3TNMJWobJU1e7nQIQT?=
 =?iso-8859-1?Q?RhicwNloSZesjsJ9Po65tU2rD+4CGzs7qcJYlRiXYhvx3epz4XRPYe69JH?=
 =?iso-8859-1?Q?vgu6fIreGdrSJTd/RV20mPZFsCkNZeh/cGyn6zRLLCwQSR2v6HmwuxqOq4?=
 =?iso-8859-1?Q?cgmA4nm0TLUk9ORjX3ziFD/ze0m96ZN2HZVPhT2mGYsF91GWT6dN+Q3Ghp?=
 =?iso-8859-1?Q?+t71IJQxqs8ingD3f/ghNXx39KSIytmSF0MiKbTlEHwneCcqlGNdyFuaHC?=
 =?iso-8859-1?Q?RtZAdqLNG/ezyiwUjLp1VBrvdRTgyouxU0CfTyCBCp1IgQUuf/X+vFJV1Z?=
 =?iso-8859-1?Q?Csi5aXpWM6NaXiD+TTtytk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5258.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3OcSgMH93hN/P8O3PKwdJMtthq1o5khV269GfV70qPSBL+K23O+4D/j2CH?=
 =?iso-8859-1?Q?HohWXFqwspkmrw7W2AH3M2FzqrnZqkzY1dUcqErcytEFrliZdEsm9I4oDL?=
 =?iso-8859-1?Q?3qZYqCC0xycKhuL/gbPHkJZxEeMtBa/gZubZ0K/+C7TshspiZA7RgmEzL4?=
 =?iso-8859-1?Q?h2J6uY9Iy9WkOWfHy6kXQMpwFVteHofpm2hpslpsyAAhdhBfZlGG3Q/deX?=
 =?iso-8859-1?Q?/rSMrcdFNp50TX9FjHJ0U2pRhRpTjq4bLIVKiNYL+eSm7OIZQ+2vVC9OJn?=
 =?iso-8859-1?Q?h1xbm1AI98CPC6HA8Bi6LRH66yNaV2IU1Cj5DejtwnJ3WaiKxt7b7c6YNB?=
 =?iso-8859-1?Q?j3rkCvwOieCJVhqw9ppLO+MXfBYJS3DshSFFLMOBoPZ3Etb94PuHZ3mZyy?=
 =?iso-8859-1?Q?B0JURaSD01cWtUs3CnCaoK9OuMDLvdqeM3B8JopsvB3rMBRrLOoLBd1/IT?=
 =?iso-8859-1?Q?r5gROFJNKdmEq5FTGUA/JV+NzOgdrtgFQPfpKrqX8dn88qS4PbGrMI8vfO?=
 =?iso-8859-1?Q?rfmyS5YZ4PvHcHCJ/Ua3Z7EYrVZ23IHMhWGW7A2zyUIzGn4MRfYV1+5YpX?=
 =?iso-8859-1?Q?7b4n5VWozBx1+NYP+qM+lBRYxb2XS4/dUxaNH5S12tU1KJq44/hpTLCnsf?=
 =?iso-8859-1?Q?YnS83UveDpMYrDrwbMeo2yaNugazsM0qczKlSgN9cMTsRKMAMneiKs5dNz?=
 =?iso-8859-1?Q?F5Rcyco8b+lJdEOCpxsQe5hRPdDg8MvS7cK47rV9NOjDXHlrRu1UJefyBv?=
 =?iso-8859-1?Q?2yxnQbo5XCR8QrFGfsb3a3X1kM72CyCFPAjsdv6io8XW7zjypvYKqG5bob?=
 =?iso-8859-1?Q?nL75EHC80TXEoAMIvJBinngBjIIOtDErOdlI/2A0K12U9pSfnLqKLf0r47?=
 =?iso-8859-1?Q?Lc0nkoYqim9l9WUYJZdUSIIQGvbRKk+hVJpnn5t0kIGgOwU54cDNsJtJwO?=
 =?iso-8859-1?Q?OmybhjoKeruwB7l2f7A37/4X0++bPJslv63F+jrXNsnlJylgtqwxW2k2c0?=
 =?iso-8859-1?Q?P65R2MI9hrRcSxeYvcH53gUAiDsEHlZn58izqk24HIb5elS8ZaYhpA6Qcx?=
 =?iso-8859-1?Q?ooVh5f1R/zTfjlt2K7JhyDPPgCrbpD5xBPdJJy6vX/HSkxa1p5ui2mJgZY?=
 =?iso-8859-1?Q?TKdj59wI47+klYbqHXssgUzIqhAJRtk+WTVi/GUpwF+Q0v6CshP8rJ7lfg?=
 =?iso-8859-1?Q?7TOqR+pAP4Enc0c2x5bKTbbQG74Rc/y218m5BDD7BLtZEf++m5JU285I1C?=
 =?iso-8859-1?Q?9zm3rQCyxLuN/L1OkcbUqUIh5MDJdM6oOditzSmkWPmG9ZsbPnGXwKbydb?=
 =?iso-8859-1?Q?faHPzgMaX76qE0TNhbgsvooNMqoos4BP6voDhPt1qG0Gg2oy5CLp6wg67Z?=
 =?iso-8859-1?Q?2GfEBn2A/9MmEXnNH7ZTb3483JMQu2Ne3OLdmox7cQOJXsM+FGXq/YfSts?=
 =?iso-8859-1?Q?aJqkOLLwTHZfqCeYV03NTQvzIFtYMjMh0lBcFmoyrgr/t0+Z3ewHx5zA5N?=
 =?iso-8859-1?Q?ks68b2VoGLW4TOkqIaQeNAyuDkAuMQvHDIxmq3rOFIndBu6qTtaE0wxWik?=
 =?iso-8859-1?Q?jJ2OPbYXM7hnuTvV4nl0z8zvRkQuDcyWrOaUwl/HKQEE19XNaOijzgPHcm?=
 =?iso-8859-1?Q?GN62vZdbF8FNBXoMssnp03Rf+o0lSTlsMY?=
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5258.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3489671a-a1b8-43db-ef35-08dd569332d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 18:27:16.8598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fqYTnHsUlBFMvZhH02D9tXtKGt4AiF+7W3LRE7pYFVxdwt8ztP24ykUAvw0wiqp4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR15MB5920
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-ID: <DC7615743CD1D548AEB99C5A36694360@namprd15.prod.outlook.com>
X-Proofpoint-GUID: tzYZEEs6j-By8AGufSjL7DkzOI_sDR8L
X-Proofpoint-ORIG-GUID: tzYZEEs6j-By8AGufSjL7DkzOI_sDR8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Mailman-Approved-At: Thu, 27 Feb 2025 09:10:01 +0000
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



> On 26 Feb 2025, at 18:59, Leon Romanovsky <leon@kernel.org> wrote:
>=20
> >=20
> On Wed, Feb 26, 2025 at 09:38:22AM -0400, Jason Gunthorpe wrote:
>> On Wed, Feb 26, 2025 at 07:55:07AM +0000, Kasireddy, Vivek wrote:
>>=20
>>>> Is there any update or ETA for the v3? Are there any ways we can help?
>>=20
>>> I believe Leon's series is very close to getting merged. Once it
>>> lands, this series can be revived.
>>=20
>> The recent drama has made what happens next unclear.
>>=20
>> I would like it if interested parties could contribute reviews to
>> Leon's v7 series to help it along.
>=20
> Link to v7 https://lore.kernel.org/all/cover.1738765879.git.leonro@nvidia=
.com/

Thanks, Jason/Leon for the v7. We will begin by reviewing the patch series.=
  =20
>=20
> Thanks

