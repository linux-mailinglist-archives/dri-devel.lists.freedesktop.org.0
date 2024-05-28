Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B758D21FB
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 18:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FA411245B;
	Tue, 28 May 2024 16:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DcXVeYI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B6611245B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716915134; x=1748451134;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K89o+IgOxURbicQnKS1rjv4Vm8AImvj8IC6ZfrcfCU0=;
 b=DcXVeYI1w0R2lOO8qrdtc5HSRHRtpbAfo2SEFiZyhhRIHW4dAeEV41k+
 qbj4Ib3A67fPpHSI/0a7GiV1dcpdkWJqkR2JBb8lr6tPPB5WT0ENP/d78
 YU9BU35CZel8c3BsyZkcpaaz2p2FbJdrOQuArpG/yb1tp4BbEtPmaGRzJ
 fWel15BAKlTVrqEMLnhj+hlYmkA9vYzfQytlFAbJ5+gH4qPb+E6CzEx3o
 eX/vAzZ2/ueNvjuh4/exjgqLNj86t3dRoloQqLliFHWwrOlEa9AxHiOQo
 uPOiGiEF8pQ2JZHK3p+iv4Zs2pacB0jogL7QgHvqxHZ26kO6wT5Y/3avJ Q==;
X-CSE-ConnectionGUID: 8O8KEx+LSB2SJYsyXzydfg==
X-CSE-MsgGUID: /6GxgxuYTReWOGxmikiUog==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11732295"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="11732295"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 09:52:14 -0700
X-CSE-ConnectionGUID: /gREiTHnSoiGPLF3qrdMcw==
X-CSE-MsgGUID: GkrLdymwSYOeqdvjSqzG3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="72572069"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 09:52:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 09:52:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 09:52:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 09:52:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 09:52:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlexxtOippK4KL8iTU90LjuuJ2X84XaIo9yaRDerzjv/jeKkXk8ovA8lWgmNe+AE/N6P6QPMR4jcfzYE0fY4aksKmpvLgs57Y3RbmhVbXGLKoEsEKH30TQz/nMy/BKNcSRvR/A63zwEfBeKB612gj3epo8gqPRoRpVHIWFCCMC3Bdj3vDjxF++wrj9JlUFp4Nb3LDzHaKe9/Vlt2c91+pfO4rzMb19tfNxESF1Gctrk7nsJH/EbzcWTHk3gcaN02//zeM2/OPR+Ttsnj1SFSE452MoUa1COkGZLF0+VkSu1oIyRUGDACtjYuhxEjVzxMaxTZMH7wXppRCFgkn2M1fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtEfeopWqFlKR4Zhpd5fUqzGAgjKTHsambNg5aUZMdg=;
 b=QGXB/1HZqASkoeQc31ZRNg5ljhedtkqP15wNnfRRATpf5vK8JuVegvHRD7GTX+0/2uk5x1s+G/C1QH3sKYY0n8Uw3l78d810VeUF0t27lV63dQODTjbrpwXKCV9ZP3O+KuIi3qffcPUZKedNC9PjidovvcL9eEhVcKJt/tMkvlugsggfm1CVfYVH2qfi13lkjnZD4F3rBE0HT2JOfphkP/q7NJweWObtY6QzjIBVmReCsUFutNJ1secLoN4UPUCPi1y/CXwFTZkpvASmS136uTllzBFgkNYyNb6hEplIep00lSxVcsRUuR8UMnh9mgRchJEWekKzlpQTnavRoKeayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Tue, 28 May
 2024 16:52:10 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%6]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 16:52:10 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Dave Airlie
 <airlied@redhat.com>, David Hildenbrand <david@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] udmabuf: add CONFIG_MMU dependency
Thread-Topic: [PATCH] udmabuf: add CONFIG_MMU dependency
Thread-Index: AQHasQNqfd65vYC/LEW+sVy8jwjwCbGs2/aQ
Date: Tue, 28 May 2024 16:52:09 +0000
Message-ID: <IA0PR11MB7185AFC7F39C244665B6DAD6F8F12@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240528133138.2237237-1-arnd@kernel.org>
In-Reply-To: <20240528133138.2237237-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|BL1PR11MB6050:EE_
x-ms-office365-filtering-correlation-id: 00ad8f8d-7c19-4e05-4583-08dc7f368401
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|366007|7416005|1800799015|38070700009; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?P4y+gwz/Exrp+DIId7X79cOLTKLtsJsMX2s84y/8NmPkXiOH3BE5SBVW7i?=
 =?iso-8859-1?Q?VCObtoMgwJVwcvzCrtR9RuEK2O0bs7HzJYP0PYjOPc1R3LR8nhhcNlx+1g?=
 =?iso-8859-1?Q?WtKxu4g8gv0jRgH/6NziLeIcg9fl4OLIOkLo8h6mY3wMmG9GUYtVHA8gqc?=
 =?iso-8859-1?Q?UvXyN2Q5oUfQwFc31cpInLr/hUHsa0xfSDn3W4r1W8TcRrWOpHdE22UNIx?=
 =?iso-8859-1?Q?Hy3LZMNpumg2AVkthV+ANi8etRZ7aLixUwmSGoJgujlc43mrglEHQy3hV1?=
 =?iso-8859-1?Q?SxWdmycJ8vuvHKwDjR2uRH1uN64nUxX8riutYbNK43x0JdOLV1SRSby1G8?=
 =?iso-8859-1?Q?vXECu1kM+kxueOEqbMQGtz0B6zS6w0CyzDbxz68hFLE2vJucBX69ZY5vkC?=
 =?iso-8859-1?Q?Uz9uoOZ1YBNeI3pJDYBYF/g/N1YSyjK/GhsnYPW3krycsnCYmmMjmTGxBz?=
 =?iso-8859-1?Q?gZ6rLC/ERGgCHsP7MKtpamdosgh9cRdnETtss7S10gT8CL1pLyaqaFr28a?=
 =?iso-8859-1?Q?PeHWBn5tVQrfbZP9iY1+euBHbpe+I25XfkmnfV5ui2Ep+PkCZ7ZQFIW/TZ?=
 =?iso-8859-1?Q?LmhqaISJJ+V/tPp8S5qcpDI5/7YgX/e/lVxtGHHKlsw6hgMrKLAG94Nsiu?=
 =?iso-8859-1?Q?oj4YTzCqAxSuYos+7L/IgW/XVTeP/a7GAO0TdBe9hSVMTY04kR0ZcEMY2Q?=
 =?iso-8859-1?Q?EwwUmFdu4emg0uP3ji9tWF+Uj/jIRFDWksGO5AekPyCPifn3wsTYxAmCG/?=
 =?iso-8859-1?Q?XF55w/RV+GQKRO2WXKbz4N2eL2qBn8AzK5fTK4QSuAQ1sUQlEGlBeSYcdN?=
 =?iso-8859-1?Q?xvGES/c+PKPHlHEI9v2ixbTiI3lNmxQY3MpZSR2a0/vbD6teXa4pArEW9j?=
 =?iso-8859-1?Q?9c0tMY08FfHpmBC/XMzmYesnaZQJrnQl2EK2Ce37rHjipQcY5dEKhpkf6f?=
 =?iso-8859-1?Q?j2ob6orZc6OiVsNWoR+tZrmm6hH4eCOQJCNgxCH7xKI4gfzXuGZLjua207?=
 =?iso-8859-1?Q?pbfc55bPU/RzhPuxE4lEcme2r/SSX+UgkB5E5LU0934BzYwP6aF4NIDbM7?=
 =?iso-8859-1?Q?w/xtRLIFnNif7ge8FFkDcWbyej9Zj2+yl7JYxyZeHu4t+SIFD22XW1tOXw?=
 =?iso-8859-1?Q?B3RI7q3sx0P/PS/sxHOcGC7infIP+v7kfBP3LfirmsDKOlel/jstV8JnY5?=
 =?iso-8859-1?Q?JVrLAPTxsR8WlA8YaknRgBPgqZTEwa0WTtMWtVazgvNGIKorXGmn5P9v+4?=
 =?iso-8859-1?Q?k4sC5rfrgs1Ot+8ymkEqA+esexsAVHD+90Epl92NE0Fnv3vdD8qdTypHIj?=
 =?iso-8859-1?Q?udGhVGRDcZeHy9XHgXcg65DxbgvrRh1XnveOtQ7I/EjXMvxbvqWGDhsXcX?=
 =?iso-8859-1?Q?ZEoD51qzT7nfy8HuKDtlC1+h4JaIuzrA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RCd/hCoTX/AFDVNTbux79nT879AX4kL52oppsubsKQTEzpTbySJHadrGV2?=
 =?iso-8859-1?Q?ORVXNgUKxhQhWJn1/tt7kkWTbbhIBCufmnPUlG/dlY/mhNaKhKleDGcCgR?=
 =?iso-8859-1?Q?HOu2Y1Aa2iJ19Ti99872KmdsHR0RxaLJWQsoM3jvqZ+ttbPbdO7SBJEIfo?=
 =?iso-8859-1?Q?UsIJF4E5p6BjH9V2+2fcRtpHop5mI7F/UB3inofn8wWV+K5VfMYaPRWBEW?=
 =?iso-8859-1?Q?pHafS7dEoH8tSNVOm7h3M+PiOMpC9LgX8nsNmbUCv6d+vorNO79hXGB0RT?=
 =?iso-8859-1?Q?2rqmai3DEWMuUXzFrOW5w2l9E7U917w20pwvSY1HnFoTgymu7h9J3m5WSp?=
 =?iso-8859-1?Q?ZnM6j9iY4ER2qQ7SfAUVbDYoW6VtUB2qPzj1mOhCDWI9kjlsmUHaJjzEt0?=
 =?iso-8859-1?Q?X3QRBAEesOXHW2SvIpgvUZ1PV6QttD650NwbGz26k+kK204S6XnfWcMjne?=
 =?iso-8859-1?Q?DWD4dTsbszkWH8eUh2f+TgnwOs11yfa1eCysuHSnMt/GuLIf+bUK7at8EM?=
 =?iso-8859-1?Q?tQCZu/93uUSVV5wDDve6wZOIQiV3Cgaj6+TB4jrJUvCs9sQU7gQxxNXM2W?=
 =?iso-8859-1?Q?b/0FTxTTgdF9suHJM41Np88cM+LDguvmLD/himp91emT9fIOe3t5HtS8tx?=
 =?iso-8859-1?Q?xFh6Eh8ZlDcYH6hMqHCzxD9noU5B9Jd4IqC1sn7aUmRkUhS/2Iq06RbKAJ?=
 =?iso-8859-1?Q?WYAYuugSZFMlRwGS6wDeJdqAxMdtThImvOSq4Y7V6WDs2cI+yPJZT9J/Ma?=
 =?iso-8859-1?Q?rssQNd6aXqAZrIljJgTRPiTsE8JMsWQLME1PbE4roOCvZmWYY0OWFgETx8?=
 =?iso-8859-1?Q?4czpszsFMLC40VC0yzKy5E805MDL0IUNW3prpYWzsww6i7CvbaOgD15Hhn?=
 =?iso-8859-1?Q?n85WkpqC/dHlcvDWtgkgAHzX667XWY7TEVtzEThbaV+AHxgXD2P1zQ52r+?=
 =?iso-8859-1?Q?xqGgL9rS/zcLsfSWI8xKJp2Pfra5ENkHrosYzbUDMuQ6I2wVjWd43XLOe3?=
 =?iso-8859-1?Q?0eChFu12LUVeXeqBSh35Hs8PINFYRdwjuPibHHCkqPY2QHFGKsaf9nrwJ1?=
 =?iso-8859-1?Q?srxr9zOLB0B6joG+dPkuVJ1lBJAnPiKN6udntem4BqkTNnGVAIMVXzmx4W?=
 =?iso-8859-1?Q?YtWlIufxj/w/chS12YfI1n4JO5obonCoro2gZq51OF3IPWylRzssZaoFop?=
 =?iso-8859-1?Q?xu9sa5niXOgX7xnH0VoWBBBE7hQLAEBT67WI7+F+cv96ruV1Pvc+WE5cEr?=
 =?iso-8859-1?Q?PBrJDe8uatOEq4uAHxh4w58gmdcAMbM0/tKh6/pbUu8a5jookd2Ch8gPrv?=
 =?iso-8859-1?Q?7PIUbXP8HqJJ08z/W0W53MQNVCw0gdOKzhm9b2KIK0Jbz//7210VbtW3As?=
 =?iso-8859-1?Q?06+B/0x/rUkK7UPWj5/rA9Pe+dZLIGKultXWkbKS01eeh/EcXQ9luN3dg9?=
 =?iso-8859-1?Q?IRuXfEO846rxlB7R6KK/O45yV1HTOZSCKEIRySChpuluBeZjP8Ecy/cn/t?=
 =?iso-8859-1?Q?i5e1T/wWLD+EAxeXLFFeWvHO9XBO9cqSyNEcPqicF8ua3Z+5aQ9Wd4aUPX?=
 =?iso-8859-1?Q?ZaJdz44fhqu5F9UqSIdagZrtiID/7tUhJt8i/T19LwlPgmCWa6krcoWYM2?=
 =?iso-8859-1?Q?e6k3GOZmVFGqZME3MmabmXnzbZYyZGUBiH?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ad8f8d-7c19-4e05-4583-08dc7f368401
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 16:52:09.9313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ZiPpVvEXib+jN0ZUbTYxJh9ZNayO7HZ4BT/B63lCNhZbJPzX8i2Xly5N2p1oK21nQ3F+yNekQej4JH9UOCCzss+plVQXd3NAiGcqP3CeZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6050
X-OriginatorOrg: intel.com
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

> From: Arnd Bergmann <arnd@arndb.de>
>=20
> There is no !CONFIG_MMU version of vmf_insert_pfn():
>=20
> arm-linux-gnueabi-ld: drivers/dma-buf/udmabuf.o: in function
> `udmabuf_vm_fault':
> udmabuf.c:(.text+0xaa): undefined reference to `vmf_insert_pfn'
>=20
> Fixes: f7254e043ff1 ("udmabuf: use vmf_insert_pfn and VM_PFNMAP for
> handling mmap")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/dma-buf/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index e4dc53a36428..b46eb8a552d7 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -35,6 +35,7 @@ config UDMABUF
>  	default n
>  	depends on DMA_SHARED_BUFFER
>  	depends on MEMFD_CREATE || COMPILE_TEST
> +	depends on MMU
Thank you for the fix!
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

>  	help
>  	  A driver to let userspace turn memfd regions into dma-bufs.
>  	  Qemu can use this to create host dmabufs for guest framebuffers.
> --
> 2.39.2
>=20

