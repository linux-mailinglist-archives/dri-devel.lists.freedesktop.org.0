Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AC79958CA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 22:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7BA10E25A;
	Tue,  8 Oct 2024 20:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dEsJgAXR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E61710E241;
 Tue,  8 Oct 2024 20:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728420863; x=1759956863;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i093yPM8d2YMXv67oaxgnSGV/aq/7nPENAsQUuh7pjI=;
 b=dEsJgAXRzixp0tXVdxLi1ZmfYHyHjkwQ7q8an7qXUV9ZXlwO1UD/2rpt
 /HwGZCrLT6Jnkl/10vPQdYvF3fcBKPN/bPEoUkMsb0Nv29Uikz1eqeUQ9
 d9agbnr/YsHsASeP+5Zxwd88x5qLN/g3T/uXKbx7saSGhwCGH1szuGXqo
 VgApgXK5StKa4ljj5Jow6CPP8IjFwaWz+xCSUkVJHoCY7oNRZp4qpEnLp
 grqVO63v1uBNR0iIx2/k4wkVL4DvIbYvtkuTKhn8ROGbsdg3UY93EC2MI
 2Rzq8Vw4og3c4fWL2b91N5Gh32GYZIctZJi/q2N/lqIv96aNsKWrOZcbR A==;
X-CSE-ConnectionGUID: GP6VFgZcS/OoEzR0F3K8Ow==
X-CSE-MsgGUID: TnmKsn8aTAqI/YRxY9qVdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27552783"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="27552783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 13:54:22 -0700
X-CSE-ConnectionGUID: SEl6aQO2Q6SGEHolrM5C2g==
X-CSE-MsgGUID: uwIpqLzLR5qSAmvP7xAkYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="75565850"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 13:54:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 13:54:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 13:54:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 13:54:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMLN7A0rRNZw08znoemPnAI7mJVPpF87Xzaj5sXLqNfKniV3vnWTlWKegJizSFcWnDYy/rD3IV7I7mfJCb9Ny4RIcuezxn0mAKY6psc77t+z/qJ1j/Z6QfqVFfFr1P3XAmoeIbDWZw4JQH9GUBEUq+x70mUHLg8inatqKuEqq/9k//bODCcWCstFZ4n0Jp1S1B2jCocxeXpUoM7lhZj3s4VexNCW6+JfNl+eUwMm3d6Fc11+NfeogGVYy90pJZpMS4Jyq81VDzR/etjmkJKsTCRoEJ9dH8ANOePYjysQKVOrp1fKr7vzXaw4yEqyNDllhuPyIG0cHTEOzBhKTjT1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QBYoHNlwx4/rBSoMkzXVwF+m3dv4bVi81LncxXiYpQ=;
 b=d2vyfqGhw0r209uDH3dcXlQXnwAgRS+i2rA2cv9a077TXUm3uz6wE5Mo/hgbAhwBu1L6sDkqEXJd4u2tVdV5KoOiFbhmZ1N6JMIBtPrXMnlJNfZrAo/QHljmphLs30nWZi1HVVW06XJtsTIR6rfOTwRndwq+82Do0hFRff6Hzwl6iLGJuRto08v/TZmBE2Nb5zLP2AMpVMSMNd5dH1DZ4FH8MZrb1PvBZ6ys7K/3ZpmQ7ScgIU1H4RBTcUgaoyUtpAj+AqphfK3iLg6Ti/AG+woKLlpOWSjs1WwsHxBOA7oeAiftGttnBYoQZ9q6vGJ+ns9q4X5I1OvfahEoDzmFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 20:54:17 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 20:54:14 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 01/12] drm/i915: Select DRM_CLIENT_SELECTION
Thread-Topic: [PATCH v3 01/12] drm/i915: Select DRM_CLIENT_SELECTION
Thread-Index: AQHbGXqikNy6Gj+g6EiYa3C02U6V7LJ9QdVw
Date: Tue, 8 Oct 2024 20:54:14 +0000
Message-ID: <CH0PR11MB544467A7CA14DD503333E226E57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241008120652.159190-1-tzimmermann@suse.de>
 <20241008120652.159190-2-tzimmermann@suse.de>
In-Reply-To: <20241008120652.159190-2-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB7278:EE_
x-ms-office365-filtering-correlation-id: b5ae1225-febb-4633-66f7-08dce7db5e40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xbNl+MrAVa7ydDy5vygflAGEn+Tz1x9v7IYs8a22IdYyHzFK+FONAuDUGCzx?=
 =?us-ascii?Q?TRMeFA36IQIr2UwjRIIFsmSab83+on7Z/PiSbKbSdV6BQA4pSBPuv+NXDapJ?=
 =?us-ascii?Q?4Bpzqf8qrhVJic5bCqafKnyjqDTWbQ1yQ7uxVQ3zwYWSIP0NHa8pvhPKCpdk?=
 =?us-ascii?Q?d0ENlKQRn5eGPEld43CPrvDDlO1nc5HsO5VgONzKnzOm203iXGXYdDmp1nOm?=
 =?us-ascii?Q?F7GrhVTFuod+9xfIDS2CkyVb8fYuj//nrQ8onIFABrDXidrb2+ZJ3s2eXmls?=
 =?us-ascii?Q?WOHmRAHNlHLhRgTz6v9+6MXRThjfZ+8Rc3BBda3jZjIQoUv9QdRGJ+m7vvOp?=
 =?us-ascii?Q?nsyVLH98wecvz6bXd47yabJjhYc44+gQzBNCCM4dg8GX59L5FvSdp8RDJwWl?=
 =?us-ascii?Q?azGmj3+I+oK2WSDuwFCgBlPZGfuIchBPpyDGm3G1dFHEiGW0YT2xwgKo3vqR?=
 =?us-ascii?Q?jbo73KgWiVZ2s80/ORbQYvrLfx0kXKCremOAR5uhuUSNxrLiQRaamWi89aXf?=
 =?us-ascii?Q?44/rBdxduMgunQf0Ok/ZRXFGlcV+mVjxurhZtJh4io3yX6KcdzJN9yEI79MM?=
 =?us-ascii?Q?29QGn0TX8rmGEin08avZ4Z2vphXkDcj0g099mbE0OAIHccPdC5VCBjJbrwrK?=
 =?us-ascii?Q?mOuMaTxoRsnxXcAEDJ7522Sr77d3l3cY6ZpayLBLaoqPuvZ05aFfJQ37tnTS?=
 =?us-ascii?Q?OYlt/ffawqUmZA36NSGhbTtnD5OS0xCuRgbkhC/u+EXp6bdWs8ZInbX1io+v?=
 =?us-ascii?Q?JFfOPSQa/gINJfEzu5BeQFs8APixPBANrVtnWRpJhVg95jQp5muBGpTKM+ad?=
 =?us-ascii?Q?2rMWht5xgB5+CBm584yeTo+NNiOTGo/KQIhuUxz0ZarErhjkcZLH3ceEpaiT?=
 =?us-ascii?Q?Qz9N56j0tcvYYVhDEgljzNxOz1aqvt0ru03Uq+xMYZyizGRy8NzB88uS9bJD?=
 =?us-ascii?Q?9COVAU2Jxvattk9zz0nWCHTxZygZPSPUHlRiiwWVJePAyp8ZiF1Xw/oo2y+x?=
 =?us-ascii?Q?N1N+ck0hDV9cRHTyjYVAK838WKeKuxE0Hv4Td1uw+waQrIRQDOj8+lxXW+Tb?=
 =?us-ascii?Q?7c0ZWwaXdrK0TdVTd4f3bP9uJaqRqsjikBpkxu+ZX9Y3H47FWhtZcI7SY5VY?=
 =?us-ascii?Q?Z8FutCIf1+bTwyAbzyPH37Jkfo1vTLHASqz6du/XeYdYI7/8d35fHoifYrVz?=
 =?us-ascii?Q?EF8eYNYwe7Np1YLch/KZnutSe8iu6lHqO3wGXIgWnX/TqbKVmBnKhM49A0cm?=
 =?us-ascii?Q?DGyJ3FBV0e5UdZxn9HBt9v/dE4UmtOhIi+vwBkEamJJUmPUw2SoicHQYBPHu?=
 =?us-ascii?Q?/v5KKEpFipx8LpO6JV8FBJE39qKt7Q7YClsFYOw3osvotA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YzHPafwb+EItdQA4nhxTc2zN4tHww5bp3q+krCpFHWqL2gufsbFwGrz25Mzy?=
 =?us-ascii?Q?yipeDuC/Dq37OYh2D92mGqUfab8Dn83ifnaihjUGxSBpAkq6ZDz/wGFi6W1/?=
 =?us-ascii?Q?gFHhKzx9tYO8nD+kEKlzNrUcxtdKGdhQVsGaWPUmMGXW0PJDUl6O5aWEE0MU?=
 =?us-ascii?Q?wPIeFvnKxBek465mkpSXc1uZ/VHUeZm6yXPLsoZuf//tXrcMMxILqodPWEjh?=
 =?us-ascii?Q?ZLxXhfEiaOZUiyALZc3+oHC2spNbqE0oNRIwMH9E0YKaD5BUL6Vy4v6iM9XL?=
 =?us-ascii?Q?MS85ADZInsGcctmZDNUYHgzUVwKarYn4ZutMue4q0BBPSSOgLI0lQODCebdL?=
 =?us-ascii?Q?brkSxzjbDgQNghmpUK9P8MiYZ4EUtzfsXPgkMHvBjVU21lf8yxnhR8GIkqrw?=
 =?us-ascii?Q?FoOFdQexR65JqQNqyL+WgsBTUlNnZBOlNp/b80D6yvKh5VCvKc0mvcsfEdTL?=
 =?us-ascii?Q?Dm8qW3sDUAFuoHuQ9Y4aKTfvdFT33KgM97s3RcXeRFPNYr0B0N6OM+fCSXju?=
 =?us-ascii?Q?k9RoM2fVnqjMilvFXHmj8bPhyqzSX/92UYktxm7gEl9oGBJIGpM+Jne/ZWUk?=
 =?us-ascii?Q?RijxzBrgW3qxvB/IZWH9edOjA+4GHEr+lwlK/JVQKkXvaDCn4cBz3qnCI5Ay?=
 =?us-ascii?Q?T8XaPiR/d3vJyGcxBMjKgAycaLnZovzooYgcS/HCnTbH6NCrIfNgeaec+SyP?=
 =?us-ascii?Q?yc/YPy6imVjis/hkGJEDDWF4X2sNqZ0IUXFqXGzRRNjIWa/mksJk/w4OW43S?=
 =?us-ascii?Q?nOnph1Czk7UhN9v5MkEH1s1dZd/VeMNurkScuRsQm7PIKpEL5vj1el2eihkT?=
 =?us-ascii?Q?pN5N8tKK5ccGGzJGWmjdt6ye1DN+xdXmGRR0SchhSExZdYFr2xSJ7LBvZ9mU?=
 =?us-ascii?Q?djN6B8vOiN3nwkDD7o7lEzB4MuC+uuQH28FLWFl+0tg4pRFqSG3s/cdA2VIf?=
 =?us-ascii?Q?L8s9Uhlfx9oaic4nXMYATmdgbY9HI5OvTBK3ryaJURp8D0T1qvOqF5TMFxt1?=
 =?us-ascii?Q?NirV6opLoB+uCXf2A6lSLfB+e8ygnLaecwT0QcS3GDI0fDZTY9PCkGsgrGs6?=
 =?us-ascii?Q?gyw3Tqr4Z4s/RazawgUB8UpV1NlDeJDULaIoJTP7+h8qb3eEk5Z1/uTzsWtg?=
 =?us-ascii?Q?RvXc7IUcT+UGh8XkG1vJFX7niSF5XkMp2lBhXFlq9fhTTU/HkCWJZ9JCzAzJ?=
 =?us-ascii?Q?ZL31BLM8q4gbl72p1buBO5S5Z/y+LrMjgKLTZZp7hNvCmS81nxre0ngqq7mC?=
 =?us-ascii?Q?k8/7oo4JB9+WuxhUrBZLpz52pAyMXhTN/LH5gLJ2TzopZK9Jdk4SDo9iW3No?=
 =?us-ascii?Q?Vxcy17SKx1u6xa2VBIZAGKFu2FCdJU8gptwxrnYPHIvogC1tBwrYuWQVz9ip?=
 =?us-ascii?Q?pDpzvYGdqVfYlPHhfbB04yPSP/akwyMFvr7Ja+s0nQQY1T2lpaQoE6EsRxBe?=
 =?us-ascii?Q?hFBmmsBt6KJzwPikXRPyKqULlobUmNDNTooIV/P5Q1SkAvOzPlE/v0Ye7Kq7?=
 =?us-ascii?Q?A7GTM/eW+w/DjKsHpVnk1CUe8OY2wyXM/1dB/j/T3Lc/zUryGt2BtLtejewv?=
 =?us-ascii?Q?c1QBpcWsavsCfcq5aHvTfZ6U++cmcg0UxIHiF7DdXrd0TFgetDqB0caxGdOH?=
 =?us-ascii?Q?oA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ae1225-febb-4633-66f7-08dce7db5e40
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 20:54:14.4328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZKeNaIHwgGqhlDWmirPtVyCrNa8e3JpoXTy+Vg0sLizxYE+Au2DCgcfjtPzOjUP+sP51AgOgVsVp63A8cam0wtKATfiVYkvx5Enj1Ir/Iak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
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
 <tzimmermann@suse.de>; Jani Nikula <jani.nikula@linux.intel.com>; Joonas L=
ahtinen <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@inte=
l.com>; Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v3 01/12] drm/i915: Select DRM_CLIENT_SELECTION
>=20
> The Kconfig token DRM_CLIENT_SELECTION will make DRM clients
> available to drivers. Select it from i915.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/i915/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index db400aad88fa..1158a6b97f9a 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -10,6 +10,7 @@ config DRM_I915
>  	# the shmem_readpage() which depends upon tmpfs
>  	select SHMEM
>  	select TMPFS
> +	select DRM_CLIENT_SELECTION
>  	select DRM_DISPLAY_DP_HELPER
>  	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HDCP_HELPER
> --=20
> 2.46.0
>=20
>=20
