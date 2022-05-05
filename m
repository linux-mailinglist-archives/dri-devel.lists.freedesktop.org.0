Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F40851CB57
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7619D10FA25;
	Thu,  5 May 2022 21:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827B010FA23;
 Thu,  5 May 2022 21:38:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEqv6C2X9poGzvsLJ3GynIcrj0yqUzvnAYkWKrogW1wm2aBmP09wtK0/Kj/C8lALlfb8faPrev6NIxslEYwFpmR0W4nsrfy4H71UYXgvAgfOwbh3O1XN3PVToHQRD7yPeBsUMheZyANrP2Gv+aIEa03x/aWtBZC43z3dAy8ksgzpwBaTkh+yYBZLLCp0MjgN4PBqOY4n9JTLO8Lkqkvk2JIOzdRbR5PvBMERDyNvAREH/4qsRZd25gU1FCvxCy16I1kOOXkJTXWhuSufUx83s8nri+4nJLEV1vzXNRGHM4lXt1pr3Zmg7y/8isoc5OTp3hK9vdyjVlrTdOtMPgms6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3irBkaw7MSw5EGYTgHR9KPyQK6kZCo+BSGv5T23HPDE=;
 b=PbkDoKnpk2k389XedvcubpG0OYx73godnSJyJ0ylIgmv1uEAR8K3/Z1PwZzuPlBafyrZFxTkVx2UZnPgcOyzvEQLwSdeKo4cXXzkWI3laXsKDkAXKn+VzGxOHe/f3QB0+HGO1dW7hiKsQ8FsMUPM3HK+F4HF7yW3trnSxgNvQOjfII8c57MAO5VnUYdUnj/IayuBBC50tvyipTSnd8HzRKMg87VAAqexelpAQ2/kuarh/JZbRCYxS4uYPzW+qlDiBriHobxw58K1L3tzCx1Z/SjV1SzQQ8ZOhM47Hm7iuUA72ijM9GakZpTx/A0YJjVldlT+Da/xExaafPrD3qGUWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3irBkaw7MSw5EGYTgHR9KPyQK6kZCo+BSGv5T23HPDE=;
 b=QRjjbEnlOHnK1WDB9+5cfXLL7iPaMtnLvHbohKphmKfMHCeYIBcwACr7Ormb6ZzVksW20QwIhOKEhVjiDE58ffgvWhA9csrtD5rawtmPHIhvpjfZXRQAU8vReTkfZGuF22pdD7HJIVvsWEnes6YU5MebUALPdpn0cYpMaMcYFBE=
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by LV2PR12MB5991.namprd12.prod.outlook.com (2603:10b6:408:14f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 21:38:08 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::2c05:6d91:e76a:6e24]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::2c05:6d91:e76a:6e24%4]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 21:38:07 +0000
From: "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>
To: "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "apopple@nvidia.com" <apopple@nvidia.com>
Subject: RE: [PATCH v1 04/15] mm: add device coherent checker to remove
 migration pte
Thread-Topic: [PATCH v1 04/15] mm: add device coherent checker to remove
 migration pte
Thread-Index: AQHYYMgGjgxyHrmtGk6QLDJATlgC2K0Qzsjg
Date: Thu, 5 May 2022 21:38:07 +0000
Message-ID: <SN6PR12MB27173F2F37294D6DDBC3457CFDC29@SN6PR12MB2717.namprd12.prod.outlook.com>
References: <20220505213438.25064-1-alex.sierra@amd.com>
 <20220505213438.25064-5-alex.sierra@amd.com>
In-Reply-To: <20220505213438.25064-5-alex.sierra@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: apopple@nvidia.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c917ea8-4da3-4a26-5ae6-08da2edf8b54
x-ms-traffictypediagnostic: LV2PR12MB5991:EE_
x-microsoft-antispam-prvs: <LV2PR12MB59911F586A94A9FE9A6041F9FDC29@LV2PR12MB5991.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e0cJaDWALjuUH+yTX6zCzyfcL5EvF35igo2w8hUZ2fUKbxKywtnlHxZFzlurlnZvyJ1sweyIjgc4lgMNIXZ7i5v0qjmmWNUmVcGRvyUXfPlLxV2zZLgLqggd6R/ihI33IzqBbViUu3r+qYcXan66A73OTIOgl3sEfukrvrWK7kWJTfxiqtOb2c+BhQrk0Tm10u11Mz/s3HG1X/594njCSKpyQUgh25i5ENcLa2s1RXRK65DABsYlPRUOO1koDv+msABu0DaGa7ytr+3LCt3pa9syRwbPRw9Y9Bnf5zo2msvyAMIRjCbnkucpNXMHkam7NYc0Qt+4y3KRU8dWWHtXnJluKSW1pdVayFqIfCYGxzh43orsz3/YKduZOdZbPxyGrCQ8y4BgYz8RaoC+2IUbBogsD8bVRQ+Kruf8cwpPdgh2+65aTRITdmXO7PVFcTSZE2iVOTDSltPesM4oQ1jrvkPAgwFJwk7f3vn5g7hvUAWv4CEKT3nzFNZBjQzgDK0oiXtjIVgj2qXqajx+El0mT/q8yGHlGENiZkGABOymUcQHbGduCZ5iYkVUd/5GIJ2xVuivW4RX2cf+SHfAUw184XIwaTza5Bz6KlurTkvzKbnVNsgeU2jI6uAkcwLvFbd4lxuObEhmT1Ovo/03NJPc2w6mnYs73ieECztlTvrfsJBIqgj4wO1v01WD/swgSZcLymWHtVz9xNKZuXpch/lRdQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(9686003)(186003)(6506007)(53546011)(33656002)(7696005)(26005)(122000001)(86362001)(38070700005)(38100700002)(55016003)(110136005)(83380400001)(508600001)(5660300002)(7416002)(54906003)(316002)(76116006)(66556008)(4326008)(8676002)(66946007)(66476007)(52536014)(8936002)(64756008)(71200400001)(66446008)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z96eIh5ESCSV5/dOLE/VRFh4gROWsa4oSxnft0n8d6psRoFH5vnJS6pNJYew?=
 =?us-ascii?Q?Y1a3CSrbIXbO4zSzwQlB5TFheBOGjuFDPEEkfeNyf92PkFMMdn91LsmV2Tqj?=
 =?us-ascii?Q?1bjx8tWuKP4Y8Z8fQ+GlNpD3UFN55uifMd4Rssm0cTeigm8pOtwFZdttU9eQ?=
 =?us-ascii?Q?EpcafKdwkmifKLYR6vbnZ8NvsfhIfA1uLeAf3Nf4xx0FPU3tpcSY4SLov5Vt?=
 =?us-ascii?Q?S/5hEYuw2pYeuDomss1Eb7L7CoognDQo259bNIA5riweVoZqk2c7x3TDjY6b?=
 =?us-ascii?Q?gfYSidq9NO32mVkxOoXriqM3sxmNXKSd72l2tNAt8RcqJixfQO9dg7cA7Di6?=
 =?us-ascii?Q?5u3AaCnBmpxNdFBacriWVjpBhrGto5e8eyY8xncIFg5TYTfADhJU9vDSNMDi?=
 =?us-ascii?Q?gFjdIfQTVMODvbek0gpxmsk+IFcpxQctb2JeYQLUf7w/kx5NSF50BDdJl/eW?=
 =?us-ascii?Q?U7xvz2jz+dnRWGk0bhL6ovzgeJyAAUMWCBAZyeLroo6vl564we+wxBrlSpCR?=
 =?us-ascii?Q?Y01HGBOgYGNgy4yM+cjESjtmZAPuKy3nqdGl1Tl+ThPCO9bzA0LJvCLDPV+j?=
 =?us-ascii?Q?ZCUJ9fUAEWBGAWAS9DDGTaNR/43dMYQD4hVC2M7y7kMQm+jN0Sr8HXOj94uW?=
 =?us-ascii?Q?oX22cgKEOZQfaS7VUh6cstmzw5TOaEza7Zl/M7g8IxlpbxUuv0dMxeSdttDl?=
 =?us-ascii?Q?CQY99Ky3VD22EevAljHKKOSyi25VU0HOvwUj/7FQzCq+brVq0Y11KJCY1QJq?=
 =?us-ascii?Q?N0B73oGk9I2d1jQfrpD5nxuAEWo7b1jlDUck6iCpeRE4cE3MIV8HbS4UWWVf?=
 =?us-ascii?Q?W5kI8IMFVjU/QvBJvHIXtuY/cyr25fnw3C/J9pDl800kCYt91vcqJszJtB9q?=
 =?us-ascii?Q?t+qkIJvv+a99UDzLzNaFvw7949Snom8UoUukwe/nXNYOQrOVOdib7/btYj9Z?=
 =?us-ascii?Q?Z6pjqoGPVuDEkxjYqrzhvukByoJw3s6Nzi1cgLaosn9SozqMNn4l/PyPb83O?=
 =?us-ascii?Q?1gIbXiYgvFJ9EAMEuJwYfSFAJJrgJm/U6tl3cF4xkgWN1N5e9DruQaJM3JGe?=
 =?us-ascii?Q?iF6yf9cmJzyrOV53H0ReriGb6ABqjCXUWZc2m2BuWWgMZmP+MW7vF4UC95ss?=
 =?us-ascii?Q?dmrAcjofZkfeoos5BHVCl1kAMxEOqKlVZc17/QRhMg8fMCj2VeZhuyPNirjk?=
 =?us-ascii?Q?qMztCruqPw+JKUQX7hf4ordxryQwkl8YjPMF0UcW46lq8irHoNVPYcdIKq87?=
 =?us-ascii?Q?rzxejnSE5Ek0mU1iXwPhrhcGgs+1LMOWFqzU18oqF1Ekau5lHK4vLDE3lI9s?=
 =?us-ascii?Q?9NrFResylkyC0fGPbsAZNTLYNPr9JyA4r7s9G416KXfaJJwihTwp6112GT8k?=
 =?us-ascii?Q?OhyBJwgQHiwIth7z2Ho9RhueBzxqgjke5v+TwnuIEg0gIx7/yMJFUPhrmJnq?=
 =?us-ascii?Q?MevYjhY7fNt2fngmBEXQci68lVMVeiNVs+AzdtXWai5siOOW8wvBTvOucl8T?=
 =?us-ascii?Q?dB4ZDRANOztOfdHikYhpN5IpcDZJq0DB/KbpM6EcVMXb060trMQcAMIWnFiZ?=
 =?us-ascii?Q?bwJJY32owKeuFuosSAdRXWgApWCwlaHBLPElF1pbhRVTo9pij90pUxMjun3O?=
 =?us-ascii?Q?m9rk6IoonFJk5lgYdFDg0TVZsYfKxjk0hOR8+2RJKkin4T5ojtKXhIGjcwH5?=
 =?us-ascii?Q?tAaV2sW++VrkTU5KSD7oZGTyy95oxLMhmja7E8Umi7brLmQH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c917ea8-4da3-4a26-5ae6-08da2edf8b54
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 21:38:07.6023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nUHSTSIuR/+r3WgTV+FI6dEwxezN9wOcWVxFbKaQXRPGTdtahlkmyXLKeIv2HyiPuGbSGOh7v34bNy1jm8hQBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5991
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "david@redhat.com" <david@redhat.com>, "Kuehling, 
 Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "willy@infradead.org" <willy@infradead.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

@apopple@nvidia.com Could you please check this patch? It's somehow related=
 to migrate_device_page() for long term device coherent pages.

Regards,
Alex Sierra
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex
> Sierra
> Sent: Thursday, May 5, 2022 4:34 PM
> To: jgg@nvidia.com
> Cc: rcampbell@nvidia.com; willy@infradead.org; david@redhat.com;
> Kuehling, Felix <Felix.Kuehling@amd.com>; apopple@nvidia.com; amd-
> gfx@lists.freedesktop.org; linux-xfs@vger.kernel.org; linux-mm@kvack.org;
> jglisse@redhat.com; dri-devel@lists.freedesktop.org; akpm@linux-
> foundation.org; linux-ext4@vger.kernel.org; hch@lst.de
> Subject: [PATCH v1 04/15] mm: add device coherent checker to remove
> migration pte
>=20
> During remove_migration_pte(), entries for device coherent type pages tha=
t
> were not created through special migration ptes, ignore _PAGE_RW flag. Th=
is
> path can be found at migrate_device_page(), where valid vma is not
> required. In this case, migrate_vma_collect_pmd() is not called and speci=
al
> migration ptes are not set.
>=20
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  mm/migrate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/mm/migrate.c b/mm/migrate.c index
> 6c31ee1e1c9b..e18ddee56f37 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -206,7 +206,8 @@ static bool remove_migration_pte(struct folio *folio,
>  		 * Recheck VMA as permissions can change since migration
> started
>  		 */
>  		entry =3D pte_to_swp_entry(*pvmw.pte);
> -		if (is_writable_migration_entry(entry))
> +		if (is_writable_migration_entry(entry) ||
> +		    is_device_coherent_page(pfn_to_page(pvmw.pfn)))
>  			pte =3D maybe_mkwrite(pte, vma);
>  		else if (pte_swp_uffd_wp(*pvmw.pte))
>  			pte =3D pte_mkuffd_wp(pte);
> --
> 2.32.0

