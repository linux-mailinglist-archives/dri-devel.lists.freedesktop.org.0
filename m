Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5675388144
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 22:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15AB6EC80;
	Tue, 18 May 2021 20:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 864 seconds by postgrey-1.36 at gabe;
 Tue, 18 May 2021 20:20:30 UTC
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D486E890;
 Tue, 18 May 2021 20:20:16 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IJx5dS009382; Tue, 18 May 2021 20:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=AYh/7aNyPIielV487TyQr4hPVYaH3V4ZNB6zEymZOTo=;
 b=ozHy3Dk31CZgvpD3UcG+5gsq8kpwKQoe8C6IIkBjPczu+NEFPN3CICVsjuG5FrEXj5OS
 QJunrpsGPPNTsZlBm4Z04RbEJl3HKs/CC/PWB19ndPp0EuZZko1vxCXQeke0xLTuWaTD
 nCsVmCddcx/Bo4vkj6U64DpKoel/8JyAIwXu7MTMExcAfi7nDJvOw/NHY+YmmAXvY2DR
 Xm4ifhLeBSNPIBXj+CamlQcL/HuD30fhj72xydbPkhHlJKM5qAGhhR0MELuV2Ce15oMI
 wiwokjMFrJBubjjFT8qe6o0K6FcCHPvsP5M3grYy9847eda73iijp1rslYvR97cfF1Vi FA== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38kh0h8thq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 20:04:55 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14IJxMjl116347;
 Tue, 18 May 2021 20:04:54 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by userp3020.oracle.com with ESMTP id 38kb3889av-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 20:04:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzSNHLQ29+0IBRdIH1blySQTxSfFGhad0ETPpfx1QFdGFaCES3gdTmvABwUCdEcS818fU8sbUeHJS9dGd7NjeW9Wd9lYoYm7a+Ce4NwV2kp30y/1FlHVAxETtPVI5xyB5DqovoEzbOKxj4uqOPtUVb/xQxuVFzXATNjx2ICQMfgk3lCN+mZ26LIHzCy99vnH/qzVc0JaQ71xwCWT86O3UxSncfXL5JsQvaYbmgRpGqRVOX2isEggOy++WO8+9cN6AUQBU4KRYNEhsdC9DJZvVsqyG/bRbGSx2EdElv0vGDaaF/TpX08RLFjCTa/EdhEEFf9xwNx3niCIUa2DA03PWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYh/7aNyPIielV487TyQr4hPVYaH3V4ZNB6zEymZOTo=;
 b=CPV7cuNHoobCspTEoJVOumWm54FG9vki8MNTpo/uHMxcLxM9PdcZBrkieiKjZKIX3bgEKJ6tjO2qS6fn/FJfMOSGYU4r86eWehTzHEbibrKDz3VmZWKemoAoud/wpsPHY1m44b5lv2M27vxieQl48nvcLQW8Ly8sICym9G/maaYDh7FoTiZuCBQxsMz45gL3gOKo8WVbO0VR0d4biLT34Qn1S8zka556g1UvDhtTS6aoVgxA4M0Hdx6/hmAvqImrbFvQzMg9r0O1c8i8MNI/VWWymg8rLloXdnT9uGR7J/SxIhcp+lySDuScZfr2svzfdCBMg7XNrANAN2MIyfv6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYh/7aNyPIielV487TyQr4hPVYaH3V4ZNB6zEymZOTo=;
 b=MKDF8/P5J9hSF1AOPe3HqW3O22Y9Ql+16ZMePI47B3FKCyu8umXjsPtrzX8EUpsd1uC+UqLArNEMwUJDc7D649W+gklPRwQyfH8fXWEFJ4+rpr/ZHbqw4XO4yUE4Lif/+yJiO/GvOml1H60fMDj/RklpW6xlOTOV0WstFj52+FU=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by MWHPR10MB1583.namprd10.prod.outlook.com (2603:10b6:300:27::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 20:04:52 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::353a:1802:6e91:1811]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::353a:1802:6e91:1811%8]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 20:04:52 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v8 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Thread-Topic: [PATCH v8 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Thread-Index: AQHXK4oPyN3KgFk4qEysJNDFdITYW6rp6v0A
Date: Tue, 18 May 2021 20:04:51 +0000
Message-ID: <20210518191451.fcjw6tlgow33gxbq@revolver>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-4-apopple@nvidia.com>
In-Reply-To: <20210407084238.20443-4-apopple@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53a85e3e-31b2-47a0-ce0e-08d91a3832ad
x-ms-traffictypediagnostic: MWHPR10MB1583:
x-microsoft-antispam-prvs: <MWHPR10MB1583B1ECD624E3AD45937206FD2C9@MWHPR10MB1583.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 63aTd1AWMmSORovuUk1KE2jcsi18CMI0u4PBitU54Yx57konjnB/XHMAW8izsyjcSMI1N7YDqnn3M1n7iWIgvk5W8RMiSifoGvfDRLJBF0PzgbmIZM6IuezFGnFMxWLyZOmPhyxuh2eBmFiPMWTZjgZ22sJ6rxH/TAFUbHABtUvI4NBh1HIrwf+R2aRSrCgT8wVtowtiMDI9cM+ED1NZwa+oVIzff1iNCKrvWcnS1rCLCK/P2xK8/GEODc6T/hTC7iH0zNLXPSvlOqBDSdkb3eBwuvjRBwrh4lhuJRZnb78DMLavAwz6Ls76mR1s2jAF0kMu4psoLRDeGu1s9SQBZjlpx1Vva4WRZoM1N9CA60P40gXbTIN35Ic3J1+UGZdUZNXd76JBSE1/Z9bjhvdPiXRq35Bisd/zskshUNgsmSjPGAU7TWv3HC+59LL6P8YmiJ+wjgX6oEAuD/SX3Wlp60sPLivrISdjoskqx9IF9wVX95x0hicPCOneRrw3N/fiI17GHAeHGeWkC99EA4arXOnSpTpxvj8e9hNST5bzaZpuJytC8Ke+BtKZcdOH8B4NEbMOIm6Lp/mfe+jLnfuoIC5ccxhdeqiY5Vk5HEOjjL0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(39860400002)(376002)(396003)(366004)(346002)(136003)(71200400001)(44832011)(66946007)(66556008)(478600001)(33716001)(8936002)(26005)(66446008)(54906003)(30864003)(7416002)(1076003)(64756008)(316002)(83380400001)(66476007)(38100700002)(8676002)(122000001)(6916009)(86362001)(5660300002)(6512007)(186003)(76116006)(2906002)(9686003)(6506007)(4326008)(91956017)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?HntgeosxWJlBKuwCDn3JJa+shqI5k/Wp4d1iBdyPsGV8kudbeOA3wIQFDTka?=
 =?us-ascii?Q?SkxisT317roqZlo7TApvrz8RTwVN1P7MZyGHDVNz2ei4T7XQ/040/j71qyJM?=
 =?us-ascii?Q?4ZgMejrWNy241j11qMmHmd4fC+o5WgPEhjX5IshjsnDn5s1DrIwc5UaaN4Zh?=
 =?us-ascii?Q?LWWyMoB6ianeXFPvuN1LFOJ9jksU7QhYv9E5px0p+Dbk9ucNfX+3e60HfVzf?=
 =?us-ascii?Q?ocoYpMF5j80yZs7Ireh5NU7vdVYPgvxvE0nduleMDHADG8u9qzagyZ+71Kll?=
 =?us-ascii?Q?GR++l4JuYzxbuAMsG8tbzBt2OU2IjbhQ+utVMReiXFQNv6017i8RyQ3D1HSq?=
 =?us-ascii?Q?bRjfLlOLkGr3y0bNAh9Bki+bDRvxaKy4uNbXCnJX/XF8KJKAd8dLqi5NB7x1?=
 =?us-ascii?Q?4r6G08Hl+dcJw3RO7z71FT/qEs7FAXrCgWBEPFjAIp6m5ztIWr7USuXbJxXl?=
 =?us-ascii?Q?Ge9SWjI9s2sK6AYGd8uJRRAD94RaiOcmV067ziSDzagCw6rt4PSoXILpjvnx?=
 =?us-ascii?Q?+4emiSxfTKDdwoK4SA7B2+UohFDxhAfQTo+cO4mPrG/WJyaNoMPGJul4FRYj?=
 =?us-ascii?Q?cMiAh0QlRpWsxLLXfXPPAWhODcWW2Mu/75OUFd8oJO5AWEU3IPpB8dRyQp4y?=
 =?us-ascii?Q?FpqS9VIY69Gv1GyHow/LXZ2L+datAPKLVncylDjiAM891kpClWGPghp+QVFF?=
 =?us-ascii?Q?AfLg3QuPPnE2ycE38+B5nxu+NitjjhT48NJUV9s+nlBJcijGsEUUZJC2fECa?=
 =?us-ascii?Q?lWkbHiOJ/XIYYamgK7IdEQUu5agj2WCOOuASYm6u6BdlqHh5zsL1mfxZR2ER?=
 =?us-ascii?Q?1B7kiAc4iCaTY8dKXTD4LGIfqVWqRJ70JXPvbneaobDfPFV3og1KaTbqz5Fi?=
 =?us-ascii?Q?dZ+lBDro6UAFv/nFQTsmVrr9/nfmT7cw09F76d5Edkio5CK+yKK/DPa4jRAu?=
 =?us-ascii?Q?oMVWJDIdtnf7aVspedAG5wt5Gh+TtjfQzMDP7kAzxL/vpYYvHoRjUjejwB6y?=
 =?us-ascii?Q?ebyGPtdsrF7hhnJGE6uIOiJQOgkQh+guP2Y3RXDDNu8On1T/EJ51mhG3iOn+?=
 =?us-ascii?Q?6LBCWdeDuDVqOtDbQRUS8qVeUIdH9fn+IBacUf0EiUvbw6wY6EXEjCYX65pb?=
 =?us-ascii?Q?EL9Tj8nYbd36OT6kDUC5Dl0hTxyMxXfvL1815XTcoBme0/0n/mQ+hDGADMgL?=
 =?us-ascii?Q?rsIP59XNju04fra8Iq2Bos5CdFS6qANu53vgaq7v2HfSB/qXD+ga+LnosATT?=
 =?us-ascii?Q?wFsw2EbaO2NV6R1Az0pRHFkwNvfPl2wHKOUp0QoTfL5igI0n9hmv8yGt9tG2?=
 =?us-ascii?Q?uGjA7uSJcNYsgFoCAX4AeEQj?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3DF2400BEFAA8A4789DA65AF2013FEAD@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a85e3e-31b2-47a0-ce0e-08d91a3832ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2021 20:04:51.9688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jemm6G8UwZyRj3qeFaWM5xFqCObZefox7S5nPSAPzwPvR8tWWS8WPVZauTBoFUwvp+jPs8mAFmDf8W9jYQDHfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1583
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105180139
X-Proofpoint-GUID: 2yogDlchJd1i16LuQkxuDyKqs3gFVtU6
X-Proofpoint-ORIG-GUID: 2yogDlchJd1i16LuQkxuDyKqs3gFVtU6
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "bsingharora@gmail.com" <bsingharora@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Alistair Popple <apopple@nvidia.com> [210407 04:43]:
> The behaviour of try_to_unmap_one() is difficult to follow because it
> performs different operations based on a fairly large set of flags used
> in different combinations.
>=20
> TTU_MUNLOCK is one such flag. However it is exclusively used by
> try_to_munlock() which specifies no other flags. Therefore rather than
> overload try_to_unmap_one() with unrelated behaviour split this out into
> it's own function and remove the flag.
>=20
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>=20
> ---
>=20
> v8:
> * Renamed try_to_munlock to page_mlock to better reflect what the
>   function actually does.
> * Removed the TODO from the documentation that this patch addresses.
>=20
> v7:
> * Added Christoph's Reviewed-by
>=20
> v4:
> * Removed redundant check for VM_LOCKED
> ---
>  Documentation/vm/unevictable-lru.rst | 33 ++++++++-----------
>  include/linux/rmap.h                 |  3 +-
>  mm/mlock.c                           | 10 +++---
>  mm/rmap.c                            | 48 +++++++++++++++++++++-------
>  4 files changed, 55 insertions(+), 39 deletions(-)
>=20
> diff --git a/Documentation/vm/unevictable-lru.rst b/Documentation/vm/unev=
ictable-lru.rst
> index 0e1490524f53..eae3af17f2d9 100644
> --- a/Documentation/vm/unevictable-lru.rst
> +++ b/Documentation/vm/unevictable-lru.rst
> @@ -389,14 +389,14 @@ mlocked, munlock_vma_page() updates that zone stati=
stics for the number of
>  mlocked pages.  Note, however, that at this point we haven't checked whe=
ther
>  the page is mapped by other VM_LOCKED VMAs.
> =20
> -We can't call try_to_munlock(), the function that walks the reverse map =
to
> +We can't call page_mlock(), the function that walks the reverse map to
>  check for other VM_LOCKED VMAs, without first isolating the page from th=
e LRU.
> -try_to_munlock() is a variant of try_to_unmap() and thus requires that t=
he page
> +page_mlock() is a variant of try_to_unmap() and thus requires that the p=
age
>  not be on an LRU list [more on these below].  However, the call to
> -isolate_lru_page() could fail, in which case we couldn't try_to_munlock(=
).  So,
> +isolate_lru_page() could fail, in which case we can't call page_mlock().=
  So,
>  we go ahead and clear PG_mlocked up front, as this might be the only cha=
nce we
> -have.  If we can successfully isolate the page, we go ahead and
> -try_to_munlock(), which will restore the PG_mlocked flag and update the =
zone
> +have.  If we can successfully isolate the page, we go ahead and call
> +page_mlock(), which will restore the PG_mlocked flag and update the zone
>  page statistics if it finds another VMA holding the page mlocked.  If we=
 fail
>  to isolate the page, we'll have left a potentially mlocked page on the L=
RU.
>  This is fine, because we'll catch it later if and if vmscan tries to rec=
laim
> @@ -545,31 +545,24 @@ munlock or munmap system calls, mm teardown (munloc=
k_vma_pages_all), reclaim,
>  holepunching, and truncation of file pages and their anonymous COWed pag=
es.
> =20
> =20
> -try_to_munlock() Reverse Map Scan
> +page_mlock() Reverse Map Scan
>  ---------------------------------
> =20
> -.. warning::
> -   [!] TODO/FIXME: a better name might be page_mlocked() - analogous to =
the
> -   page_referenced() reverse map walker.
> -
>  When munlock_vma_page() [see section :ref:`munlock()/munlockall() System=
 Call
>  Handling <munlock_munlockall_handling>` above] tries to munlock a
>  page, it needs to determine whether or not the page is mapped by any
>  VM_LOCKED VMA without actually attempting to unmap all PTEs from the
>  page.  For this purpose, the unevictable/mlock infrastructure
> -introduced a variant of try_to_unmap() called try_to_munlock().
> +introduced a variant of try_to_unmap() called page_mlock().
> =20
> -try_to_munlock() calls the same functions as try_to_unmap() for anonymou=
s and
> -mapped file and KSM pages with a flag argument specifying unlock versus =
unmap
> -processing.  Again, these functions walk the respective reverse maps loo=
king
> -for VM_LOCKED VMAs.  When such a VMA is found, as in the try_to_unmap() =
case,
> -the functions mlock the page via mlock_vma_page() and return SWAP_MLOCK.=
  This
> -undoes the pre-clearing of the page's PG_mlocked done by munlock_vma_pag=
e.
> +page_mlock() walks the respective reverse maps looking for VM_LOCKED VMA=
s. When
> +such a VMA is found the page is mlocked via mlock_vma_page(). This undoe=
s the
> +pre-clearing of the page's PG_mlocked done by munlock_vma_page.
> =20
> -Note that try_to_munlock()'s reverse map walk must visit every VMA in a =
page's
> +Note that page_mlock()'s reverse map walk must visit every VMA in a page=
's
>  reverse map to determine that a page is NOT mapped into any VM_LOCKED VM=
A.
>  However, the scan can terminate when it encounters a VM_LOCKED VMA.
> -Although try_to_munlock() might be called a great many times when munloc=
king a
> +Although page_mlock() might be called a great many times when munlocking=
 a
>  large region or tearing down a large address space that has been mlocked=
 via
>  mlockall(), overall this is a fairly rare event.
> =20
> @@ -602,7 +595,7 @@ inactive lists to the appropriate node's unevictable =
list.
>  shrink_inactive_list() should only see SHM_LOCK'd pages that became SHM_=
LOCK'd
>  after shrink_active_list() had moved them to the inactive list, or pages=
 mapped
>  into VM_LOCKED VMAs that munlock_vma_page() couldn't isolate from the LR=
U to
> -recheck via try_to_munlock().  shrink_inactive_list() won't notice the l=
atter,
> +recheck via page_mlock().  shrink_inactive_list() won't notice the latte=
r,
>  but will pass on to shrink_page_list().
> =20
>  shrink_page_list() again culls obviously unevictable pages that it could
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index def5c62c93b3..38a746787c2f 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -87,7 +87,6 @@ struct anon_vma_chain {
> =20
>  enum ttu_flags {
>  	TTU_MIGRATION		=3D 0x1,	/* migration mode */
> -	TTU_MUNLOCK		=3D 0x2,	/* munlock mode */
> =20
>  	TTU_SPLIT_HUGE_PMD	=3D 0x4,	/* split huge PMD if any */
>  	TTU_IGNORE_MLOCK	=3D 0x8,	/* ignore mlock */
> @@ -239,7 +238,7 @@ int page_mkclean(struct page *);
>   * called in munlock()/munmap() path to check for other vmas holding
>   * the page mlocked.
>   */
> -void try_to_munlock(struct page *);
> +void page_mlock(struct page *page);
> =20
>  void remove_migration_ptes(struct page *old, struct page *new, bool lock=
ed);
> =20
> diff --git a/mm/mlock.c b/mm/mlock.c
> index f8f8cc32d03d..9b8b82cfbbff 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -108,7 +108,7 @@ void mlock_vma_page(struct page *page)
>  /*
>   * Finish munlock after successful page isolation
>   *
> - * Page must be locked. This is a wrapper for try_to_munlock()
> + * Page must be locked. This is a wrapper for page_mlock()
>   * and putback_lru_page() with munlock accounting.
>   */
>  static void __munlock_isolated_page(struct page *page)
> @@ -118,7 +118,7 @@ static void __munlock_isolated_page(struct page *page=
)
>  	 * and we don't need to check all the other vmas.
>  	 */
>  	if (page_mapcount(page) > 1)
> -		try_to_munlock(page);
> +		page_mlock(page);
> =20
>  	/* Did try_to_unlock() succeed or punt? */
>  	if (!PageMlocked(page))
> @@ -158,7 +158,7 @@ static void __munlock_isolation_failed(struct page *p=
age)
>   * munlock()ed or munmap()ed, we want to check whether other vmas hold t=
he
>   * page locked so that we can leave it on the unevictable lru list and n=
ot
>   * bother vmscan with it.  However, to walk the page's rmap list in
> - * try_to_munlock() we must isolate the page from the LRU.  If some othe=
r
> + * page_mlock() we must isolate the page from the LRU.  If some other
>   * task has removed the page from the LRU, we won't be able to do that.
>   * So we clear the PageMlocked as we might not get another chance.  If w=
e
>   * can't isolate the page, we leave it for putback_lru_page() and vmscan
> @@ -168,7 +168,7 @@ unsigned int munlock_vma_page(struct page *page)
>  {
>  	int nr_pages;
> =20
> -	/* For try_to_munlock() and to serialize with page migration */
> +	/* For page_mlock() and to serialize with page migration */
>  	BUG_ON(!PageLocked(page));
>  	VM_BUG_ON_PAGE(PageTail(page), page);
> =20
> @@ -205,7 +205,7 @@ static int __mlock_posix_error_return(long retval)
>   *
>   * The fast path is available only for evictable pages with single mappi=
ng.
>   * Then we can bypass the per-cpu pvec and get better performance.
> - * when mapcount > 1 we need try_to_munlock() which can fail.
> + * when mapcount > 1 we need page_mlock() which can fail.
>   * when !page_evictable(), we need the full redo logic of putback_lru_pa=
ge to
>   * avoid leaving evictable page in unevictable list.
>   *
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 977e70803ed8..f09d522725b9 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1405,10 +1405,6 @@ static bool try_to_unmap_one(struct page *page, st=
ruct vm_area_struct *vma,
>  	struct mmu_notifier_range range;
>  	enum ttu_flags flags =3D (enum ttu_flags)(long)arg;
> =20
> -	/* munlock has nothing to gain from examining un-locked vmas */
> -	if ((flags & TTU_MUNLOCK) && !(vma->vm_flags & VM_LOCKED))
> -		return true;
> -
>  	if (IS_ENABLED(CONFIG_MIGRATION) && (flags & TTU_MIGRATION) &&
>  	    is_zone_device_page(page) && !is_device_private_page(page))
>  		return true;
> @@ -1469,8 +1465,6 @@ static bool try_to_unmap_one(struct page *page, str=
uct vm_area_struct *vma,
>  				page_vma_mapped_walk_done(&pvmw);
>  				break;
>  			}
> -			if (flags & TTU_MUNLOCK)
> -				continue;
>  		}
> =20
>  		/* Unexpected PMD-mapped THP? */
> @@ -1784,8 +1778,39 @@ bool try_to_unmap(struct page *page, enum ttu_flag=
s flags)
>  	return !page_mapcount(page) ? true : false;
>  }
> =20

Please add a comment here, especially around locking.

> +static bool page_mlock_one(struct page *page, struct vm_area_struct *vma=
,
> +				 unsigned long address, void *arg)
> +{
> +	struct page_vma_mapped_walk pvmw =3D {
> +		.page =3D page,
> +		.vma =3D vma,
> +		.address =3D address,
> +	};
> +
> +	/* munlock has nothing to gain from examining un-locked vmas */
> +	if (!(vma->vm_flags & VM_LOCKED))
> +		return true;

The logic here doesn't make sense.  You called page_mlock_one() on a VMA
that isn't locked and it returns true?  Is this a check to see if the
VMA has zero mlock'ed pages?

> +
> +	while (page_vma_mapped_walk(&pvmw)) {
> +		/* PTE-mapped THP are never mlocked */
> +		if (!PageTransCompound(page)) {
> +			/*
> +			 * Holding pte lock, we do *not* need
> +			 * mmap_lock here
> +			 */

Are you sure?  I think you at least need to hold the mmap lock for
reading to ensure there's no race here?  mlock_vma_page() eludes to such
a scenario when lazy mlocking.

The mmap_lock is held for writing in the scenarios I have checked.

> +			mlock_vma_page(page);
> +		}
> +		page_vma_mapped_walk_done(&pvmw);
> +
> +		/* found a mlocked page, no point continuing munlock check */

I think you need to check_pte() to be sure it is mapped?

> +		return false;
> +	}
> +
> +	return true;

Again, I don't get the return values.  If page_mlock_one() returns true,
I'd expect for my page to now be locked.  This isn't the case here,
page_mlock_one() returns true if there are no pages present for a locked
VMA, correct?

> +}
> +
>  /**
> - * try_to_munlock - try to munlock a page
> + * page_mlock - try to munlock a page

Is this an mlock or an munlock?  I'm not confident it's either, but more
of a check to see if there are pages mapped in a locked VMA?

>   * @page: the page to be munlocked
>   *
>   * Called from munlock code.  Checks all of the VMAs mapping the page
> @@ -1793,11 +1818,10 @@ bool try_to_unmap(struct page *page, enum ttu_fla=
gs flags)
>   * returned with PG_mlocked cleared if no other vmas have it mlocked.
>   */
> =20
> -void try_to_munlock(struct page *page)
> +void page_mlock(struct page *page)
>  {
>  	struct rmap_walk_control rwc =3D {
> -		.rmap_one =3D try_to_unmap_one,
> -		.arg =3D (void *)TTU_MUNLOCK,
> +		.rmap_one =3D page_mlock_one,
>  		.done =3D page_not_mapped,
>  		.anon_lock =3D page_lock_anon_vma_read,
> =20
> @@ -1849,7 +1873,7 @@ static struct anon_vma *rmap_walk_anon_lock(struct =
page *page,
>   * Find all the mappings of a page using the mapping pointer and the vma=
 chains
>   * contained in the anon_vma struct it points to.
>   *
> - * When called from try_to_munlock(), the mmap_lock of the mm containing=
 the vma
> + * When called from page_mlock(), the mmap_lock of the mm containing the=
 vma
>   * where the page was found will be held for write.  So, we won't rechec=
k
>   * vm_flags for that VMA.  That should be OK, because that vma shouldn't=
 be
>   * LOCKED.
> @@ -1901,7 +1925,7 @@ static void rmap_walk_anon(struct page *page, struc=
t rmap_walk_control *rwc,
>   * Find all the mappings of a page using the mapping pointer and the vma=
 chains
>   * contained in the address_space struct it points to.
>   *
> - * When called from try_to_munlock(), the mmap_lock of the mm containing=
 the vma
> + * When called from page_mlock(), the mmap_lock of the mm containing the=
 vma
>   * where the page was found will be held for write.  So, we won't rechec=
k

Above it is stated that the lock does not need to be held, but this
comment says it is already held for writing - which is it?

>   * vm_flags for that VMA.  That should be OK, because that vma shouldn't=
 be
>   * LOCKED.
> --=20
> 2.20.1
>=20

munlock_vma_pages_range() comments references try_to_{munlock|unmap}
