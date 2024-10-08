Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16A799595D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 23:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2433810E5D3;
	Tue,  8 Oct 2024 21:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7evvpa2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E132710E5D3;
 Tue,  8 Oct 2024 21:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728423638; x=1759959638;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9FzV6McrwCSscR7ceHJDZD48N/dbIV2o/ptECsotPJI=;
 b=K7evvpa2KeBUzfDradHqw9qrFrbcoVklTIWeGPjdf4Il7yFTFLRU9my/
 3CVg7yYOk5sqAFFrcAhu1N5bJE70G1COIBiJBhjpWAxVf0HIntLX46c0B
 281GqbVVHOF5ys3aKL8OOGPSs2B4paTVF4AT8sQnXk39//xNvfdHSoHYI
 OxTz/hV5CL4Ko/CUL083essOawNUAVwgoJAd0h3VW6h1RMHNiIsQjDTNG
 E+C7UFIWzFKLq2U80Xx0i/kDo53StgjrypukRk7cKQuXem+Qycg9rP+oA
 DnozjqPOnwEITr1V2ElkK9b+I/p2AwtNUHo/ieiaup6qSjoZjFD/go5oh g==;
X-CSE-ConnectionGUID: eeoJa9yfS4SA3jD0EWuqUA==
X-CSE-MsgGUID: +tHDRJziQmCcNK3sMVuf0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="15288409"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="15288409"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 14:40:17 -0700
X-CSE-ConnectionGUID: p6JR4ZV7TkqWyBXGPTEfmQ==
X-CSE-MsgGUID: 1LSNfjyCTiaAWOJDyQgKFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="80796069"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 14:40:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 14:40:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 14:40:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 14:40:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 14:40:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzpHQf23czYXbjsbqEsMGHgLlMh7DPb8+ZnewvPmBen2IbzDnlJakkKfpIf3vMLHjAThYMRfbL6PIOOwouF05egKqqkGSjujcUA5z/ftF4/+DM0CiQ54g8+v2ZXs9ZHb5XOGILZ3cCWiSDsIEgLlE9NcjcJsP4QZCDl6NLzbZa4ScA/Ket2mplOJ4jkBh9IhMtnUZr//Qi7LGCq4mSqtZkZb/LIT79lAiFi6Gz3/oi5dFYyH7GvKPKxCaiqQHwr3cnvv2LahqyJ2YlbQ3i1RtMjhx6uwNu7p8g0Pz79wzTLpb0ek7xgYKAWr6wwcz3aMsW3VJE3qHfrU2SteAa5cvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1+c55bSi6J3ffSGGFyMPQrYkk7o7X3Id6WkGgwu3nM=;
 b=vI6SZJyFgk/tUsuC65xGMqPqP3aKCnyID4wxro/TmQ8SG8xDiso6YzT4qGwu5gf+KiYFF3D7TW4lSaDc00X4XTxYAWGh3CBINgW9z5nchPkfnSLmJfoiw6SO7nuLQPgFq5gObuGNkYpj6iIyJLmCFzsE86PHmNLUEf40zDDD3eda4bs0v9VC0m1l985ERSQf7R1Y54djDTHRfAtIAD3PPpXVFZ2Ze0eoBePDvybjPDchYi6HMngtgPAKyXO3Td+jNqKd8W7sK4iqLGc8ecV7/XfG5ZPLk0WrSntBejaDkb8TisekwiC0Z2dzf1xDH/joLGSJe04SiiNTlYUh58Uabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB8108.namprd11.prod.outlook.com (2603:10b6:510:257::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 21:40:13 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 21:40:13 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 10/12] drm/radeon: Suspend and resume clients with
 client helpers
Thread-Topic: [PATCH v3 10/12] drm/radeon: Suspend and resume clients with
 client helpers
Thread-Index: AQHbGXqn9NsL7WCgO0S3ZD43YGgKLbJ9RDJg
Date: Tue, 8 Oct 2024 21:40:13 +0000
Message-ID: <CH0PR11MB544422DBC75D7F7326EB8246E57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241008120652.159190-1-tzimmermann@suse.de>
 <20241008120652.159190-11-tzimmermann@suse.de>
In-Reply-To: <20241008120652.159190-11-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB8108:EE_
x-ms-office365-filtering-correlation-id: 95a58039-cd3f-4c63-c845-08dce7e1caa2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?9AEGbm25tLAkIU1JSQzykDuz++dV0qcvAoNUZ42U+7JEK0ibGF5YbVleZL?=
 =?iso-8859-1?Q?kKSmEhHbumJsuGdOpKJKX5/MCbg2jVyDIGDNZJ3A9Ib6/X+h1PaJeRHwov?=
 =?iso-8859-1?Q?NGD76rjB8E7r2/7b0kvCHKxTsMc3mcWz41AJoHWAvZY7HFowFiA2fbhqmp?=
 =?iso-8859-1?Q?7kbNgLdgiPDMd8AiI5d47LQSxumnlXBLesugLGAnA/kL7346s2gyWSQvBW?=
 =?iso-8859-1?Q?NaM7nvpzS12q292HFnKvGpZcmsCX8XNOBgjSCtP/9kC75ShpGaDGwE8CYA?=
 =?iso-8859-1?Q?O0kAccfqA06Oq6y2ZWWldsCCXp98wluT4/ZVkPc8coVdR7BZJfC1+UPcMi?=
 =?iso-8859-1?Q?GJI2ZAoeO1bHgQWRyEEkpEFxBMMmH55LCempCrgzJ4ScS/dQQIamAuLGcP?=
 =?iso-8859-1?Q?UZQsVb2wDy9ktUfW39GYDT/XWr6KIwP/CvCSaeDG1b/wo+DECY3Lthbm83?=
 =?iso-8859-1?Q?Bw/5UXngsPqemQZ47WkuMWrDH0u1XPOa2MPltrgnQdra4YuYpccSwOmZ/y?=
 =?iso-8859-1?Q?tDD5ksPgogeo7WeJDixpWQnE9d1PYw/rllKTXrbLX/NqugF3PzW47DCt+P?=
 =?iso-8859-1?Q?Jzoums0PCT+jfyHRFmFx+cn2TUUUJ51Y2UDxUuFDsTgSOpIRds9bV6xk1T?=
 =?iso-8859-1?Q?r8XDw9gdgYqVogYrW1G/RCOL/hVQ5C9H+JUGap3aGiB6On0p7/uMkzcE9e?=
 =?iso-8859-1?Q?DLdXqOMJwi6DpiGNTlgHbLjhEAbgjK1dLPVf64biP5vDFhmQnGRTNgcsM+?=
 =?iso-8859-1?Q?XYIQpEPcSEAG0rlx/7hBkx2P+1Q2nvoelyx574W/aA+mEaQWLsISBPBZW5?=
 =?iso-8859-1?Q?m9n47iB+sHfK2aUiqvRiK779nwl1hcxyQWsG+HIEzwxNCc6HKMPJRVweHp?=
 =?iso-8859-1?Q?dOoWX9ebYNo5ulHeKy9L4d6hqVSVSCe8fIf5d3ReHFUut1u/RW76TR2kLd?=
 =?iso-8859-1?Q?YyZvzlnwn+Pi0mtmwHceXNCsBt8h6rCwJjwwoUEfA2uthSjR66XNKpzX2l?=
 =?iso-8859-1?Q?UcMH+L5QkjcYTQ7xaZBOGtFxYhEoaY3POO1D0wVfuptfWyh4OIvAIvMXOV?=
 =?iso-8859-1?Q?oluAcy6p/1gEo/PJ6IIaJtUrPX5V18+kMYry77Ipm3IFqNpAzQeTj2po5+?=
 =?iso-8859-1?Q?ExQ4jZL4Jsw68aBAUmoWG7/2gkLYyhoJXJZvG57079czyT9cuFpk91Txo9?=
 =?iso-8859-1?Q?jBg5PUGaMwqrZIyCtaIpcUPeqAkyzMBN2pxGrN6BP2A92gSSdz5o5yxsWg?=
 =?iso-8859-1?Q?0MpOoRdjnJYTRcMKI5rKdiy5gTMC4Fa6ELtKhs2karIt5kxGl/Z8O8E98B?=
 =?iso-8859-1?Q?vTnqAFPbh9TsaDQCzWxH2SrRRtpcTfgaMdbSCnLMlpFlOoybptSvILaveh?=
 =?iso-8859-1?Q?3dv9CVepm3WiDtnfX5Wq2DsIuUnYABew=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?dTNl5BcjW0n6/VwNUDPIwj/n1InDh8oAZRnPQ5l/vSXSTPe6tzDGD8imG3?=
 =?iso-8859-1?Q?yFdyRxES6+0Cb/tUSaLe+thjmfvbi5JfaNrjgtk1JRU6kPOtgtOC4c1Xmz?=
 =?iso-8859-1?Q?S4XuVgfxWnpFnrl++U/fl/QUYfRiQ8DiKiEkFy87uKDVJ3E/BzStyptiqt?=
 =?iso-8859-1?Q?nQ/MT3/SVjeUApWxKO6kHy+P3gC4xHwHeMUMfTxosiCiSw+0gNxYi/3yCH?=
 =?iso-8859-1?Q?vkQAnJr79WiuKt6it19D9GFrDf/PV2343KCU2Mx9w3PGDRCyfhwXSJbxwN?=
 =?iso-8859-1?Q?9SJEif8V+a1MNEjIMK9CYK9bql25F89dn+uykEO12U0jVAJS9CyThhtKww?=
 =?iso-8859-1?Q?xU6q8imxAlmpyg1L2aT4lHEcHe5hOh6Gm8Ta+M4NTfNK3FHTuPoqyDNDnP?=
 =?iso-8859-1?Q?UnSo9umBWRTPfjhTZ/7oPkxhhE76Cd9j3TnII4EE/2UzkS8mWnpXmHmL+5?=
 =?iso-8859-1?Q?oBzVc2MaH2aZJK5DmJZaLnN4t0lZ2XqUw97cHjHzqRcbOXFoQh08+HWa5n?=
 =?iso-8859-1?Q?X6ZXlW5GsVrdbysoqp1AoMTOMRp1ka213hIY/sL/j5NhtMDe0/hzoVoFwE?=
 =?iso-8859-1?Q?0qjE/gQ7c0Mlgzi+6Xh5zDjp3a9It9f+oZ+TuquKLSaQbcq3uoUqqio45/?=
 =?iso-8859-1?Q?IA42V81Vy6WK8NTuwdAsboX5O87mMgxaCSEazT07v8YBpyA6eN+6Ff72DE?=
 =?iso-8859-1?Q?UzFvI6FnLHmsx3z7Bp8NeG3vMR2GUUgca5eqy3QlAcyUS8xFGyEzPcRaY/?=
 =?iso-8859-1?Q?2veSTObHNvH0w43ZANuYiAzjlm3GlJ8FpctW8eojuGabQK3FXLEQxgEjLm?=
 =?iso-8859-1?Q?1ADDyAzqtlxxaWZq4OBLC64Zgj04vM9uxDPeYkRlQzKtIihU4sM6XS5uVQ?=
 =?iso-8859-1?Q?qNHT+j21aOhbv1e0+ppENuI4EPdg9EZn46MW1TAP3ew8jKj4fTP+QNWUaD?=
 =?iso-8859-1?Q?Eg2WPPdED05xtkwftUHKuaVakTYV9DSq2DcM17QDv8w99LW1sxP/fqedHY?=
 =?iso-8859-1?Q?xdbvkGo2uWj5CHk6qvcUOv41U3mK9mb4BgT+IwWGKsohNsgc8iLprPRngK?=
 =?iso-8859-1?Q?u+GQpRx8/Nho1eU3wfhlWYr+7cYbrBrjdFD5IMyI7rsFX7LJeLJBw4HOeE?=
 =?iso-8859-1?Q?JwAmDzyqmTxLSP2RdBNd37EdVwOnXyZ4g9XOU+kb4rBLE561XRplaacT3K?=
 =?iso-8859-1?Q?vXQ3j2asm5Ems1AZW9+3qmFvXknXm0T3dSSugXha0KbXU/gypgFMqqmEQm?=
 =?iso-8859-1?Q?84FD5Et2d1qqHfv+cpGcpQseHVQuy2iziOOKtwZiZcFuuEhdarwRjeUwN8?=
 =?iso-8859-1?Q?dnyMWcn4KbPkLnfDPHmHIbkX/e98hgJVRV0c0EZ7yG8015wPXpKAg33j6y?=
 =?iso-8859-1?Q?cxx+OaLqcfBhYRDuYalIwzTIQHmlp2wcxMbeU+Y1z9E/267admIG+wMm+Q?=
 =?iso-8859-1?Q?HntDTXBB2xvTYNdcgFZE50F4vjjb+OtrL58OFBUB+pmqjH4ZLkeBVX1wkN?=
 =?iso-8859-1?Q?WuonUUEjXzh8ZTsqaoa1ShNJ6SEFq+JR+qWQRMzP+DhDO+Y0MgqnaRiav5?=
 =?iso-8859-1?Q?HqP9H3Y8AdoqwUYfKFQ23+vpk4bJitfXJEDg/qW46Yhxb9BevuByLZmonr?=
 =?iso-8859-1?Q?vuWYbSdE5tib7IzyedammyHCU0y0LfyHcPZBocu1PrCUKMk1pv2DzuaQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a58039-cd3f-4c63-c845-08dce7e1caa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 21:40:13.2728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ls/HbFQdMOI6M+rW36EjmQdA0TFs5FX4jLW9PmmBBoWTgyaPlCDWO6AyKxrQLlEY4ZMs2md1cy/iQQk8p96iR3zJ0tfmsJ15UqqEbQC3wSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8108
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Thomas=
 Zimmermann
Sent: Tuesday, October 8, 2024 4:59 AM
To: simona@ffwll.ch; airlied@gmail.com; javierm@redhat.com; jfalempe@redhat=
.com
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-g=
fx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas Zimmermann=
 <tzimmermann@suse.de>; Alex Deucher <alexander.deucher@amd.com>; Christian=
 K=F6nig <christian.koenig@amd.com>; Xinhui Pan <Xinhui.Pan@amd.com>
Subject: [PATCH v3 10/12] drm/radeon: Suspend and resume clients with clien=
t helpers
>=20
> Replace calls to drm_fb_helper_set_suspend() with calls to the client
> functions drm_client_dev_suspend() and drm_client_dev_resume(). Any
> registered in-kernel client will now receive suspend and resume events.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>

LGTM, though referring to drm_fb_helper_set_suspend in the commit
message when we're replacing radeon_fbdev_set_suspend, while
functionally correct (as that's what's being called internally), might be
a bit obfuscatory.

It's not a big deal, you don't have to change it.

Though you should probably wait for a radeon expert to review this
patch before deciding to push.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/radeon/radeon_device.c | 19 ++++++++++---------
>  drivers/gpu/drm/radeon/radeon_fbdev.c  |  6 ------
>  drivers/gpu/drm/radeon/radeon_mode.h   |  3 ---
>  3 files changed, 10 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/rad=
eon/radeon_device.c
> index 554b236c2328..6f071e61f764 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -35,6 +35,7 @@
>  #include <linux/vgaarb.h>
> =20
>  #include <drm/drm_cache.h>
> +#include <drm/drm_client_event.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
> @@ -1542,7 +1543,7 @@ void radeon_device_fini(struct radeon_device *rdev)
>   * Called at driver suspend.
>   */
>  int radeon_suspend_kms(struct drm_device *dev, bool suspend,
> -		       bool fbcon, bool freeze)
> +		       bool notify_clients, bool freeze)
>  {
>  	struct radeon_device *rdev;
>  	struct pci_dev *pdev;
> @@ -1634,9 +1635,9 @@ int radeon_suspend_kms(struct drm_device *dev, bool=
 suspend,
>  		pci_set_power_state(pdev, PCI_D3hot);
>  	}
> =20
> -	if (fbcon) {
> +	if (notify_clients) {
>  		console_lock();
> -		radeon_fbdev_set_suspend(rdev, 1);
> +		drm_client_dev_suspend(dev, true);
>  		console_unlock();
>  	}
>  	return 0;
> @@ -1649,7 +1650,7 @@ int radeon_suspend_kms(struct drm_device *dev, bool=
 suspend,
>   * Returns 0 for success or an error on failure.
>   * Called at driver resume.
>   */
> -int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
> +int radeon_resume_kms(struct drm_device *dev, bool resume, bool notify_c=
lients)
>  {
>  	struct drm_connector *connector;
>  	struct radeon_device *rdev =3D dev->dev_private;
> @@ -1660,14 +1661,14 @@ int radeon_resume_kms(struct drm_device *dev, boo=
l resume, bool fbcon)
>  	if (dev->switch_power_state =3D=3D DRM_SWITCH_POWER_OFF)
>  		return 0;
> =20
> -	if (fbcon) {
> +	if (notify_clients) {
>  		console_lock();
>  	}
>  	if (resume) {
>  		pci_set_power_state(pdev, PCI_D0);
>  		pci_restore_state(pdev);
>  		if (pci_enable_device(pdev)) {
> -			if (fbcon)
> +			if (notify_clients)
>  				console_unlock();
>  			return -1;
>  		}
> @@ -1730,7 +1731,7 @@ int radeon_resume_kms(struct drm_device *dev, bool =
resume, bool fbcon)
>  	/* reset hpd state */
>  	radeon_hpd_init(rdev);
>  	/* blat the mode back in */
> -	if (fbcon) {
> +	if (notify_clients) {
>  		drm_helper_resume_force_mode(dev);
>  		/* turn on display hw */
>  		drm_modeset_lock_all(dev);
> @@ -1746,8 +1747,8 @@ int radeon_resume_kms(struct drm_device *dev, bool =
resume, bool fbcon)
>  	if ((rdev->pm.pm_method =3D=3D PM_METHOD_DPM) && rdev->pm.dpm_enabled)
>  		radeon_pm_compute_clocks(rdev);
> =20
> -	if (fbcon) {
> -		radeon_fbdev_set_suspend(rdev, 0);
> +	if (notify_clients) {
> +		drm_client_dev_resume(dev, true);
>  		console_unlock();
>  	}
> =20
> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/rade=
on/radeon_fbdev.c
> index 0aa20c8df546..d4a58bd679db 100644
> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> @@ -288,12 +288,6 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_he=
lper *fb_helper,
>  	return ret;
>  }
> =20
> -void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
> -{
> -	if (rdev_to_drm(rdev)->fb_helper)
> -		drm_fb_helper_set_suspend(rdev_to_drm(rdev)->fb_helper, state);
> -}
> -
>  bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_b=
o *robj)
>  {
>  	struct drm_fb_helper *fb_helper =3D rdev_to_drm(rdev)->fb_helper;
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeo=
n/radeon_mode.h
> index 12a1d99a1815..4063d3801e81 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -942,13 +942,10 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_h=
elper *fb_helper,
>  				    struct drm_fb_helper_surface_size *sizes);
>  #define RADEON_FBDEV_DRIVER_OPS \
>  	.fbdev_probe =3D radeon_fbdev_driver_fbdev_probe
> -void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state);
>  bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_b=
o *robj);
>  #else
>  #define RADEON_FBDEV_DRIVER_OPS \
>  	.fbdev_probe =3D NULL
> -static inline void radeon_fbdev_set_suspend(struct radeon_device *rdev, =
int state)
> -{ }
>  static inline bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, s=
truct radeon_bo *robj)
>  {
>  	return false;
> --=20
> 2.46.0
>=20
>=20
