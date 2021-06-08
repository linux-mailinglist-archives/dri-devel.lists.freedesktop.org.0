Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB09839EAAE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 02:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B6A6EA56;
	Tue,  8 Jun 2021 00:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F856EA56;
 Tue,  8 Jun 2021 00:29:13 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1580BxQl154554;
 Tue, 8 Jun 2021 00:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=UVlFCOe7iOaumc67zbX6/B6hwJ+V/FV3WjFQPjzQ6P0=;
 b=n6dFSh6p5ymu2urtB8oZYIQxuSlJaMhVVOC+5lCFHzBs4jNsbCGYm8/W2yZT+e69lmoV
 hkPuuClCHbKWjrMujteuQYCOuMfpWabU9JmW1k5cUkvluHyLEmmeeuPRLDlqNyXLYkM+
 dLwS1mrEs6Cv23EuZlXpHb+oHLqssf8YpJT1FDNBA+/MedjGwMNfIiNHVxseQDUHwMXe
 +YY0fzacPqOW/BmqobCqbRFqwIoM16+clpjgf+NRI2Enr93H8PGkNFRJVEtAMcY9Nwfq
 cq1iOnoQqeGgkSB0SOE1pjTw95oBrrSoyVEXB1lDSdVYyu/AnPaIvb1YC2nW/hN+1im7 fA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 3914qujw9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Jun 2021 00:29:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1580ARjt165302;
 Tue, 8 Jun 2021 00:29:07 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
 by aserp3020.oracle.com with ESMTP id 391ujw9j46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Jun 2021 00:29:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daBj3mwIy6Wm1yce38Q+3FLqZn5D6wam49NooYm/9SUF+DR3UV1uAKUYJpAJIaprUkhXlppnTn6KI+9vnHvRnJnTsqyLUJ5yRNYcDKmsPSJe3Km3jkPrqejJiynomgK5E3uTrcpXY+nkeemTZpens12FAM8p6tlmqnlErEFUMdIvlIbzVAF3wlfveV5KV2X44x/Fd5Gv7h/yG+NgJ736VUMSkTLl98UHXI7N1qr/BhluMVz/+xNTjF4dSstOIx4LLgNmQ20G9Iwm2yAn1lH7rSZ+Jt5X8X+L282YKMcZajHx+wB09iCVJ1CdLkiT04UjLfGtw7Tiv1MU3nDjQ/i5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVlFCOe7iOaumc67zbX6/B6hwJ+V/FV3WjFQPjzQ6P0=;
 b=VpEmuQBwwXfBFGznqBenHwKe8hPkxmZ5gCBPFwlLhuqI00NH2vIiAQXvwdZ1iRDdh2YpbYKCDhpL+iQCPjsoFRbY4tNnBwmfVSd5IozVbF5dLJFS0nZG+vdJSsblC2BfnW7jXm3G6JjSxyniBzH2wHbU2d9Hssaws4MvTfUXSolCiBhh+opMvTI75fjHO7v/s8RFcO60rnJxen08MpJEpN9ip7+aPOf4VAkGpr7TnG7KuIiLYZPaasLV9v+SDvUWlyHg3+G+cBtQRcAkh2usW1XYKTIkIQA8cShiIzuqdWtXmDCRQ30NB06DXneX+vq/AA16bc0wHRtyo4KYs7W74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVlFCOe7iOaumc67zbX6/B6hwJ+V/FV3WjFQPjzQ6P0=;
 b=YVU9o6NqIN+xdNR6jHmggDkhpAJ0azo5Cr0SBfyvBSidrqCyUgWg7MyGpKDuwMHjGf6+q+0R9szXKHDzKvfKNXc5JVeUMviWe6uod8DlaLjHuL4kgYOmxv7Aqgyl31r3xsh83H2CE01dph0CbOoVyWTAEuZCSxc1iltRZw8cya0=
Received: from DM6PR10MB4380.namprd10.prod.outlook.com (2603:10b6:5:223::19)
 by DM8PR10MB5415.namprd10.prod.outlook.com (2603:10b6:8:35::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Tue, 8 Jun
 2021 00:29:04 +0000
Received: from DM6PR10MB4380.namprd10.prod.outlook.com
 ([fe80::b8b4:5900:668b:c9c2]) by DM6PR10MB4380.namprd10.prod.outlook.com
 ([fe80::b8b4:5900:668b:c9c2%5]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 00:29:04 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [RFC PATCH v2 1/8] ext4/xfs: add page refcount helper
Thread-Topic: [RFC PATCH v2 1/8] ext4/xfs: add page refcount helper
Thread-Index: AQHXW93EOm+ULG7yHkuFMoDbrBIUu6sJQs8A
Date: Tue, 8 Jun 2021 00:29:04 +0000
Message-ID: <20210608002858.gegg6sl2z2dwwstb@revolver>
References: <20210607204226.7743-1-alex.sierra@amd.com>
 <20210607204226.7743-2-alex.sierra@amd.com>
In-Reply-To: <20210607204226.7743-2-alex.sierra@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8825acba-9aa3-4236-05c7-08d92a146bd8
x-ms-traffictypediagnostic: DM8PR10MB5415:
x-microsoft-antispam-prvs: <DM8PR10MB5415D9BDAFC758A303103C07FD379@DM8PR10MB5415.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PgeSNXxEJIbVHb0+BjJdQKi7DHUBjcB6rX6FejbqLrg7NvzI4aaYQ4SZyCIT3ihNaqIUR/Qp9OW6shU+rdsDeQQ1vPGTX+JoczcMz8J6q/ZnzfA5jO2qp9zuxOM5oGuV825p8jJ/6O3WvILg9v+MSt88pLQJAxJ6dIieZywVkcBykQkylBUW3pCnqWYMs5MwX/HsT6RYz+5LLacCMzxXWYiJFDQ+hPZmPEKgMuTPZulkfaxRdw8WZaRv3Q3YNpVQqxbDt5B6Lc8i7gIkSDxyZI897cJ+xYtARy5/NcSKmtMjDPQ77uxf41imyRoeTRmWvHPpQ/QT7wWrTY9PmfdvoFx2IsDvdJtn6RY3KGVDebr7WfeOSedVpRdicW5GWNgmLMg6JT9CSmsDiIVzIhMTlcmps6kZNI/SWiOVuEs8h4CsAbnlkdebHDXwmn/HFoUucKvdK1dNS3P5GoiKJhzOP7VNLH1pCmR2jOfnOPomZAXRbgk2WHJdJUwv3RsPeCOxAAwVIF8vZIw9IBQWSioNDKmaC2imFrJtu8xqD3/TL98fUF+6RWOrRbDJRdx2EqbJbpcZ75nhPB9MU/CIWbBjIpb+nYw8Q5eyiKxoCyJwh8M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4380.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(136003)(346002)(376002)(396003)(39860400002)(7416002)(478600001)(71200400001)(122000001)(6486002)(2906002)(9686003)(6506007)(38100700002)(6916009)(83380400001)(54906003)(4326008)(1076003)(76116006)(91956017)(186003)(33716001)(86362001)(66946007)(66446008)(44832011)(66476007)(64756008)(66556008)(5660300002)(8676002)(8936002)(6512007)(26005)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Nc3DMo+GTejzIHcAhCMt+Sqan2RDJuhStPjI7Cf1T8vj6lAn2LGIngSFhqI7?=
 =?us-ascii?Q?uIE3e6QPi+CKhH9ccYgKUdyl7xObhozVG/OfUrD1/Duw9P1pUiGxt0rBjFf7?=
 =?us-ascii?Q?CBRtMjLN+6wPsLLeXKO+x4XtjirquqbrJL/jnRUzHr+l94dngNveXYiEiSRf?=
 =?us-ascii?Q?5NHlz7wlCgb4BbWIEwG42tjdQnRcgW+Te2E3p28GDQn1/NKMDkZV85Mz25Mc?=
 =?us-ascii?Q?CblfcAqQqkoalU4mrIrP1T/Wqk9XGiodjMvCkHU/eXQ7UqMxWnuR9xjKQT+w?=
 =?us-ascii?Q?/Qt98tdLUiX3ABzEYnCUksjwLV85WOGbWTPVJbvBmO7UQ7ByyNZuJAyastvc?=
 =?us-ascii?Q?96gnkxgDD7X8gMb6h6+xi/NoQlQZZn9yuYYF0aq1ZsKHvK5kJgsR59+TuVqn?=
 =?us-ascii?Q?+/hEba1kaHDsJBDwV1VGU//IbM3NjUaHZuf9/ZNcqirTM97ESd6Rt7Ao7owz?=
 =?us-ascii?Q?HlpYWjpZaZyb/IseDt0bye9dBZGuYTllGqGetS3Vt9MmWlj/HRKzMbw3MBdF?=
 =?us-ascii?Q?HP3AeWSfX52L5i6DJXgEV4AANTCV7yV2ag5K3cgeKc9R7rVkExBnTcQl/h7M?=
 =?us-ascii?Q?8MaVKf/qh7Pbml6xYshFIhmCMuQjpkcU+twkRBXEaqDoln/EqwSEjhJCHWiA?=
 =?us-ascii?Q?oqY5zorqEJDJmInPUqCdhUazMbbz9B63BN/lsqUIonGb11EyH8QfB0DusADZ?=
 =?us-ascii?Q?0SvXntIOigleNH3h4u1FMz5RBVnk10xHeT11mOCZgtQ1Y8VAuEcjc5F/IxJ1?=
 =?us-ascii?Q?bhgxlKweYc9UgFhT2cIuTMggD76vfB9gvnUpxs7T5xV/mLnShY3QIQypvELz?=
 =?us-ascii?Q?Sy7hwLq82/RTZEi4IFTo710se2gSC6Nk9HNmuV67oKo/vOjvZGjqOGnrTzJz?=
 =?us-ascii?Q?FfEj3Tl4WRtT2wYPGigSYNBwaWhXspdJaNAxQJX2zxg9K6OU2/0sRcI6IOaa?=
 =?us-ascii?Q?ccbSVuKx5xzxt2vPQ+YU9g8fo+z6fgvjlbMM1hUGss8BMWcBrx/MGLcbaGZd?=
 =?us-ascii?Q?dfcLdN8fr/X4+5V+CJKXAmcLmXwZF20pzm8h4BjCI+Be68Pp97sYLF5pFAt8?=
 =?us-ascii?Q?/IZTKp40WpUkyBFPStAAf/j141mx7iPlVOgKks55TG9iUGvSTaIYVodmwxyd?=
 =?us-ascii?Q?rpTBt1BikrLrPU9PHnhCOmGamZLI3CLaoqNCOZWb2Ogc1bOEiPkLCQSIVA3o?=
 =?us-ascii?Q?mVuk3+gxN1+hwyDCMewOIWBd+AqgQxjWAI9BU+IEvApcz4AsMR8L3AumJcnx?=
 =?us-ascii?Q?08SrQqNl3vU2G1IfuEfbCMsIfgW3X7nIm2MUJaFkdojE/GHMCFmwOVEYGizi?=
 =?us-ascii?Q?zA2l4v8TU7PEZmLjYNi8y/p8?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <00DF20E2546CAB448E48AEEDFD52FEB7@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4380.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8825acba-9aa3-4236-05c7-08d92a146bd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 00:29:04.6075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Zek+B8hCj9c655HxPgYo5mEuvCAq6r8eSlScb9qT6p99iYRGv/0+SpDJhkF3j06DXQAOuMfPV2TTv72MrB02Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR10MB5415
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10008
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106070161
X-Proofpoint-ORIG-GUID: YF7_DijuX-Oo4dW9XB0jpqgWEHZ1XJOX
X-Proofpoint-GUID: YF7_DijuX-Oo4dW9XB0jpqgWEHZ1XJOX
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10008
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106070161
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
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "hch@lst.de" <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Alex Sierra <alex.sierra@amd.com> [210607 16:43]:
> From: Ralph Campbell <rcampbell@nvidia.com>
>=20
> There are several places where ZONE_DEVICE struct pages assume a referenc=
e
> count =3D=3D 1 means the page is idle and free. Instead of open coding th=
is,
> add a helper function to hide this detail.
>=20
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>  fs/dax.c            |  4 ++--
>  fs/ext4/inode.c     |  5 +----
>  fs/xfs/xfs_file.c   |  4 +---
>  include/linux/dax.h | 10 ++++++++++
>  4 files changed, 14 insertions(+), 9 deletions(-)
>=20
> diff --git a/fs/dax.c b/fs/dax.c
> index 26d5dcd2d69e..321f4ddc6643 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -358,7 +358,7 @@ static void dax_disassociate_entry(void *entry, struc=
t address_space *mapping,
>  	for_each_mapped_pfn(entry, pfn) {
>  		struct page *page =3D pfn_to_page(pfn);
> =20
> -		WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
> +		WARN_ON_ONCE(trunc && !dax_layout_is_idle_page(page));
>  		WARN_ON_ONCE(page->mapping && page->mapping !=3D mapping);
>  		page->mapping =3D NULL;
>  		page->index =3D 0;
> @@ -372,7 +372,7 @@ static struct page *dax_busy_page(void *entry)
>  	for_each_mapped_pfn(entry, pfn) {
>  		struct page *page =3D pfn_to_page(pfn);
> =20
> -		if (page_ref_count(page) > 1)
> +		if (!dax_layout_is_idle_page(page))
>  			return page;
>  	}
>  	return NULL;
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index c173c8405856..9ee00186412f 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -3972,10 +3972,7 @@ int ext4_break_layouts(struct inode *inode)
>  		if (!page)
>  			return 0;
> =20
> -		error =3D ___wait_var_event(&page->_refcount,
> -				atomic_read(&page->_refcount) =3D=3D 1,
> -				TASK_INTERRUPTIBLE, 0, 0,
> -				ext4_wait_dax_page(ei));
> +		error =3D dax_wait_page(ei, page, ext4_wait_dax_page);
>  	} while (error =3D=3D 0);
> =20
>  	return error;
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index 5b0f93f73837..39565fe5f817 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -782,9 +782,7 @@ xfs_break_dax_layouts(
>  		return 0;
> =20
>  	*retry =3D true;
> -	return ___wait_var_event(&page->_refcount,
> -			atomic_read(&page->_refcount) =3D=3D 1, TASK_INTERRUPTIBLE,
> -			0, 0, xfs_wait_dax_page(inode));
> +	return dax_wait_page(inode, page, xfs_wait_dax_page);
>  }
> =20
>  int
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index b52f084aa643..8909a91cd381 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -243,6 +243,16 @@ static inline bool dax_mapping(struct address_space =
*mapping)
>  	return mapping->host && IS_DAX(mapping->host);
>  }
> =20
> +static inline bool dax_layout_is_idle_page(struct page *page)
> +{
> +	return page_ref_count(page) =3D=3D 1;
> +}

If this races with page_ref_count(page) =3D=3D 0, then it will return false
that a page is idle when the page is being freed.  I don't know the code
well enough to say if this is an issue or not so please let me know.

For example:
!dax_layout_is_idle_page() will return true in dax_busy_page() above
when the count is 0 and return the page.

Maybe you are sure to have at least one reference when calling this?  It
might be worth adding a comment.

> +
> +#define dax_wait_page(_inode, _page, _wait_cb)				\
> +	___wait_var_event(&(_page)->_refcount,				\
> +		dax_layout_is_idle_page(_page),				\
> +		TASK_INTERRUPTIBLE, 0, 0, _wait_cb(_inode))
> +
>  #ifdef CONFIG_DEV_DAX_HMEM_DEVICES
>  void hmem_register_device(int target_nid, struct resource *r);
>  #else
> --=20
> 2.17.1
>=20
> =
