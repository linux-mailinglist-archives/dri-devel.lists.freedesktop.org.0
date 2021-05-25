Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D60239091B
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 20:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747106E0AC;
	Tue, 25 May 2021 18:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACC26E0AC;
 Tue, 25 May 2021 18:39:53 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PIXG9Y031960; Tue, 25 May 2021 18:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=MQg/RdvjXp37MT4tUsah2YAZMSe8oyWQDQM0pArYMLA=;
 b=ERmgIDYUWH534NBWLt3eU7v8lwgCwsKvkDxPT0GiyCXTK0oyELjXhz6UHkvh5jHymyHk
 gTZSms2EOWgOhxPPgQd0wglb9QYkB3wromEO0I3/qf5YqSyMRCMdsY1l29NL/UjkCd2p
 n3JK2Fu4NEmFd5Iuv4yTlXHzlJ7tfVXfxeFZ+D93zNhsWp3OPUPbKGna4QlgcF0Bmi7r
 OAg9Nm2TR7eqQ68U2d510k7v2zvxP5ZQdAbLNeDeKNHcLlJf1xdJ74TTMJiWXlrGcvXR
 6Od+vfwiz2CbsYkpWWeYj9UM2A68Z1NW7f0L677ZLKaO+9JB1IUYFcWnRkpFtfCwy+XY lA== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38r267rrd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 18:39:29 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14PIdRfq153064;
 Tue, 25 May 2021 18:39:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by userp3030.oracle.com with ESMTP id 38pq2ufyyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 18:39:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tlu2LXECOpjzejlRGJD6G3i4j19Jqfbp17u73MzdGtOgh84tXwZU12G+Yadpl+7dxWOydhFNLeLUYMjcQgEacBFk7hnqFpUvVAoOy25bMwLEovl/ZtmCs9jRgTJIGiC4r5Z25sf7m23AjwH1DNTvs4Nw4QGfhWTpOwdFTAvJKz/DR1FOpJr1GvttYyjSLZJu3zth57eM7PqRNV9nFr+zHCminDVh2RY/M4kcnn+6euMWFcMqMT6WCmeRv8jFPnbQBBw1B5qW3awUmqZzKzjd4eFcgEvCYfTbWvISUmSgC+5Bu4V64Ah2UcxJyysXds0q1An9/wU5rJ7upRgrJ2dL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQg/RdvjXp37MT4tUsah2YAZMSe8oyWQDQM0pArYMLA=;
 b=gdg91JMCqCfOLzM0AXUv1xcOHkNjyzSAh6r3XjqxDNswVSEZC1eQ01Z9xJ3S5yXRAHDmQ5/6ZHpw3jMJC29CvPEvZxnfHOeBfvhqsC0YB6jBfWGG+heJeURbDRkURJunh8nc/LP847gIsZrmVljcM3Z7PNKTJ3dd+Ofli7OmLJkhNeyjGnCNAMl08IsY+Z1nMo2ws+Q0fzUq4j6g9BewBg/arszrK3Bp0hmLHwL0BxX2pxRzhGQ3nbb9Te8OAbVIDfWymUU10raf5JRYuSqbQj4Hs+x7K7LEQi6dvd2z+ZslvLH7oIGRWiJlGffbXo+5ek/eqNsUujhRiKmLCACFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQg/RdvjXp37MT4tUsah2YAZMSe8oyWQDQM0pArYMLA=;
 b=Er5WnhY3zhVJdbEeOsz0hi+tHc/3B1oKdUWgHIidr6wNAXeK7UszL9G4DZ2HZRjP189f5D4/aTKOvl9vLf99wdUOYinHGSoNS/dVU3jk4Rpiz/u0HQLGexJSdQY0+osOGlHCE9p0A3MXLmDT7aB4PCP+frMyE6QMnNxmDmQ12io=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by CO6PR10MB5444.namprd10.prod.outlook.com (2603:10b6:303:13b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 25 May
 2021 18:39:24 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::353a:1802:6e91:1811]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::353a:1802:6e91:1811%8]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 18:39:24 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v9 03/10] mm/rmap: Split try_to_munlock from try_to_unmap
Thread-Topic: [PATCH v9 03/10] mm/rmap: Split try_to_munlock from try_to_unmap
Thread-Index: AQHXUKDDOO6CIzaEtEqx7vu0BJsuU6r0iUyA
Date: Tue, 25 May 2021 18:39:24 +0000
Message-ID: <20210525183710.fa2m2sbfixnhz7g5@revolver>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-4-apopple@nvidia.com>
In-Reply-To: <20210524132725.12697-4-apopple@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 491868d1-d775-4bf5-848d-08d91fac6b80
x-ms-traffictypediagnostic: CO6PR10MB5444:
x-microsoft-antispam-prvs: <CO6PR10MB5444502B237CB87055C616CCFD259@CO6PR10MB5444.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NFiCibiNm+61xNPsngizT7Mmm4UShp0rC3J6sshnqJHccoRSKvYUSKT7TQcGFQMx5mq35WAjm9d0J+E7FTlii/WJNIgA4lf5ypj3Lz9vffNoVl2PWFpwUtrtAqlCeaT9K4HCqXK4fv81FJ/O1ak6dBCOmTlAW4ViuOCaoFC21K0RzzKevBZlPpst9730V0SaWYEidneU6jhO+vxWqUIthSSUkzAqUouOe05xZxqzfGOrr2ZLNUC/k2ddJI4K7LkbyPPCqejW6uEslljuWLfMUcv2Krn5DQ60nOX3LZD76k/PAjI7z4PMhI/wghXis/U7t76juXHMN2KIs8Hkx8YSAtwwQhZQwI+NxP1l3/NiBVYMHxzY3yaHhn+4MudeVU2g0XvnP0JYeyM0dfuQcmvSKrOjXYeYLMNdWlVx1wykVWv56aq4J0njTVcMQH0mSP+cUqlZoSQ/QQOvUrgnDo9rYDUEqxMtJNXx57jKvWedxDqhSNUZg0Vsz5XEHNX03X66rgzLuVJ5B2OpNPEgAsol68KirPZ6mRD6J2cW+KsOO9FrPMXr+U6zSC8YsDpEsIPcDV0CoQyst5GciDvi6WdGF9GFn7XGLe4O+eI4qyjpYfk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(376002)(136003)(39860400002)(366004)(346002)(396003)(8936002)(6486002)(6916009)(8676002)(4326008)(2906002)(26005)(38100700002)(9686003)(6512007)(66446008)(478600001)(66476007)(64756008)(122000001)(91956017)(76116006)(33716001)(83380400001)(71200400001)(66946007)(186003)(44832011)(86362001)(30864003)(1076003)(66556008)(54906003)(5660300002)(6506007)(7416002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?CvSZVsQ1w4X5vbPJNKuAHnV7EfJJKJo5eolm/HuiR4hC7it64FYfm0cpQOIV?=
 =?us-ascii?Q?UHEgwXxnDMfR5dFyunoL6Gyt6cdBKJZo1fUll4bz++N1x2UtFtweWmQKZ/ea?=
 =?us-ascii?Q?0fk8WniOFttiAKsoX/Zc8PhY/Lyou6YZFVEIkBXvatpmsPOhkgVFUHA+FfOl?=
 =?us-ascii?Q?08WyXlVsCF/ZeDDni9lM6+MtLAn/qmBqKfm4MSUkaJNZUzp7vni+ieY65SrF?=
 =?us-ascii?Q?99xEtMKop/k3n/QCVunwTT1ApkrD3zhgvgsxR8ouhV2HGjRYL/oTpU6Y+Do9?=
 =?us-ascii?Q?r19XZSyCgkUKMVCk93qMnVOxL7DO210wafWJTXQTPi3jf+v4BIUy9Jy6y0Lj?=
 =?us-ascii?Q?otOnPkNPT42zikGFO1rhThx+glzh/r9pnSfiyk05W45g2tSFSqEUEvozOYB6?=
 =?us-ascii?Q?IqnNtMPshtpX/deuyKQ/C6bjM/vLg/u+TaOrjJimJ1lJAobtQ5XDyGWzoGqI?=
 =?us-ascii?Q?u1QgjVYJVHhCbX0UOJdD6Z3mR8L626iAkFwUYr7aqg7WwIL3T2dzuO4PQt68?=
 =?us-ascii?Q?WJMkxFC8t9t6daWhrAtmZe2JXiMXKm0hCfJGC/sGh7fNH5wuCMuHbfSJMT9Y?=
 =?us-ascii?Q?NBfL0qItwMZQqUZbdAZp8r5qpWEFR79IZSKan4iYkAz7rmqRYdPyziTlskQc?=
 =?us-ascii?Q?sPwDsVvDtd3uxVUVxrzik7JkjfW9ftwzhXW1e8JD0fBQMslX63g+2t9/LNej?=
 =?us-ascii?Q?b6AMXhxFuBjePrBI7iCN+XWxfTqKME5LwgNqpJDn3HCG2us6cQfghctsJ68Y?=
 =?us-ascii?Q?+xpkksHGY42Uw5EGAUXt4nMoLn5iMJDVCLvK95THLHMfrDHR/pXcvWGMFYAk?=
 =?us-ascii?Q?1h1eL/YyFL7EFtewmPaYup+SFi4Ayho3AhyOe8qdjzJhWA5aQHRrKgsFTUfq?=
 =?us-ascii?Q?iuyp7JHmFalWRolySpdmKDSJB8qiplym3O9I8kmhfQxd/bClO9rYrAZ2AC8r?=
 =?us-ascii?Q?ciZbKnoI+2m+P7nCE8yiwjd8sUXnvHlezk41F/nMRSd4uNVLuVze2ORJKgV6?=
 =?us-ascii?Q?EV5n4RjngR2jzO8/dKfmz20rzAIvEmg4/fBdLQsa0BWXL2CKPBYBwmzo5xbK?=
 =?us-ascii?Q?1DTmuDH3EzF6wjLvnEVOc/at4uTh+oK6EJmKNHUewzxm5OjLWMokIc/pBalc?=
 =?us-ascii?Q?URrvLTkR2FQ4PTiuvnxuOtzee6ftqc0lnSX6j3DKoPmb6X1ctlPvPGCLBAC2?=
 =?us-ascii?Q?K92OnNj2m4uMGaSbN39f/zf3RGGBV1Fo+JCCLQP5QMzKimQElPKRt4rCkXxF?=
 =?us-ascii?Q?g/UnDiYOVldAI34d8LvlfCYhNc2jxQOvhMxRR7ICRcP95kKod+TFFDxKMRO/?=
 =?us-ascii?Q?DVkQzblBx0UDhNFIYYHXKHy1?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ECC80F99F566E648827974EC63F57791@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 491868d1-d775-4bf5-848d-08d91fac6b80
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2021 18:39:24.6437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g7CFyE8FyTYd9awEFT3APdRCyjlTPuo/rViTyCwkAiK0xbo7IwpVCsNfgkJIgm+Zd0q0wWg0PWE2nbjRmzIA/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5444
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9995
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250113
X-Proofpoint-ORIG-GUID: KUesdam5e4VyIK-UmwxoRiUyg_CxktE8
X-Proofpoint-GUID: KUesdam5e4VyIK-UmwxoRiUyg_CxktE8
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
 "hughd@google.com" <hughd@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Alistair Popple <apopple@nvidia.com> [210524 09:29]:
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
> v9:
> * Improved comments
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
>  Documentation/vm/unevictable-lru.rst | 33 ++++++---------
>  include/linux/rmap.h                 |  3 +-
>  mm/mlock.c                           | 10 ++---
>  mm/rmap.c                            | 61 ++++++++++++++++++++--------
>  4 files changed, 63 insertions(+), 44 deletions(-)
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
> index df590fda5688..a518d4c48e65 100644
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
> index bc08c4d4b58a..e88966903e1e 100644
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
> @@ -1784,20 +1778,53 @@ bool try_to_unmap(struct page *page, enum ttu_fla=
gs flags)
>  	return !page_mapcount(page) ? true : false;
>  }
> =20
> +/*
> + * Walks the vma's mapping a page and mlocks the page if any locked vma'=
s are
> + * found. Once one is found the page is locked and the scan can be termi=
nated.
> + */

Can you please add that this requires the mmap_sem() lock to the
comments?

> +static bool page_mlock_one(struct page *page, struct vm_area_struct *vma=
,
> +				 unsigned long address, void *unused)
> +{
> +	struct page_vma_mapped_walk pvmw =3D {
> +		.page =3D page,
> +		.vma =3D vma,
> +		.address =3D address,
> +	};
> +
> +	/* An un-locked vma doesn't have any pages to lock, continue the scan *=
/
> +	if (!(vma->vm_flags & VM_LOCKED))
> +		return true;
> +
> +	while (page_vma_mapped_walk(&pvmw)) {
> +		/* PTE-mapped THP are never mlocked */
> +		if (!PageTransCompound(page))
> +			mlock_vma_page(page);
> +		page_vma_mapped_walk_done(&pvmw);
> +
> +		/*
> +		 * no need to continue scanning other vma's if the page has
> +		 * been locked.
> +		 */
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  /**
> - * try_to_munlock - try to munlock a page
> - * @page: the page to be munlocked
> + * page_mlock - try to mlock a page
> + * @page: the page to be mlocked
>   *
> - * Called from munlock code.  Checks all of the VMAs mapping the page
> - * to make sure nobody else has this page mlocked. The page will be
> - * returned with PG_mlocked cleared if no other vmas have it mlocked.
> + * Called from munlock code. Checks all of the VMAs mapping the page and=
 mlocks
> + * the page if any are found. The page will be returned with PG_mlocked =
cleared
> + * if it is not mapped by any locked vmas.
> + *
> + * mmap_lock should be held for read or write.
>   */
> -
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
> @@ -1849,7 +1876,7 @@ static struct anon_vma *rmap_walk_anon_lock(struct =
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
> @@ -1901,7 +1928,7 @@ static void rmap_walk_anon(struct page *page, struc=
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
>   * vm_flags for that VMA.  That should be OK, because that vma shouldn't=
 be
>   * LOCKED.
> --=20
> 2.20.1
>=20
>=20

I believe munlock_vma_pages_range() still references the old function
name?

Thanks,
Liam
