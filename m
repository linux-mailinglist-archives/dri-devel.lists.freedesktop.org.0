Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0736A92ECB5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 18:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844C210EAEA;
	Thu, 11 Jul 2024 16:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPF8E8k7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558B010EAE1;
 Thu, 11 Jul 2024 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720715341; x=1752251341;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S8tgdROi5Ccsij68VEkHHUPt7REf12sI4f4vy1oatRI=;
 b=kPF8E8k7qNEZq/zWZKyHWg+j78o0GjEAKSYk3SKUUxOXyWjwGcRCLdd4
 yf7KC2zvLXBOL2QxvXkXmbYuyKvVxY8MLLA8fVe5T/0pQNZ2IsbyrFYQM
 ug1oeVgJrZOzw9BR9ch6irgg0uOvL3clR4diWYZPhqJ6trgpf8XzI7xVr
 H+5u8DjzPvmxlWFyujkE4Z5ZRACaJFbeE4dlQ77o+H/pavEzWGXz3vDOX
 OLGK+tZvzCaf9sE8vV3B4wR/d2CEeTHzlo6sAX/UVw1kZys3eO1JPjA4S
 5U5rDZg7X9QMBNLBKFWIAgCeB8H9ZHI9D1zfRXuBs+MtpYn9wQjLzxssG Q==;
X-CSE-ConnectionGUID: MVe5+YImR3y8rTnMIgYVkQ==
X-CSE-MsgGUID: e3jAhwypSf+ZvAVKb6fwVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17984365"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="17984365"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 09:29:01 -0700
X-CSE-ConnectionGUID: Ep58ZBAqRw6sZ4LNrvjoDw==
X-CSE-MsgGUID: NDjR77d9QeGJe+Y3XL006A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="52929711"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 09:29:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 09:29:00 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 09:29:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 09:29:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 09:28:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPgDRSYBNbhQ9VCvPXYQz14IGaOS6iZYWvAdyk/urwhg9aY0nnXZJo5RAbuG/MJ8ObSOv0FvBK1ggVNdJ6Z3S/uMqiDPB0JYYCxF7M9+LAmhT+HuP/7i0xIf5dtLmG0IU5F0jV4XTvO5wLZhtqQcMfQl3XAMXsjWLY3ApFBcNJe9TdVSiuU7tafTxVqp+KqZsPt43xzNAn7huSEmiv8mNLycjZ2PjDgccKMiIKt2FN7bbaz0TaQ9Op5ZcUJ/WVVTBJMLMNV6eaFyh3Nr0vHmeo4rYZea/KM7af94lcH0DEesAO6onLXVFNH6mY0T+Z8in0Sj1fSeNx+ZRpxfgg4+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXU48xedAnCnNWCeisNi0yhTsPFzGUIwPDRNzK4oSLI=;
 b=jam5YkhY9ftUAgSmcxbQaC4hjwBkpTO1+UBNIOmsNoi6CYu9MH6aiaVLUwhDrCoMZILicAZ28OB6+BsSWZBOXxP4uk7/jx1X+SJ8AnPUe+R8TRDdSKFnI7hIKJwX18ZKTUqntkWkI41vqltkAaW0+6PrsiFwxBKmZsJ1Y/Kn21lH3ra0+mcWXFQNYcexPDlCC92v9TP35ZkVvg8h+VaVtApP0kiIgC7SDhA9H+e088Yp/L6VCtE0b/ckpnceiAeYfZHzRDmj8Wg0nGamE6dIPold8en4IeMvpRMcRIITc1xRaVnuGAEXOUGAP4xu/Hu6FKThisQwR3666hizhMIKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4720.namprd11.prod.outlook.com (2603:10b6:806:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.38; Thu, 11 Jul
 2024 16:28:53 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 16:28:53 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "Wilson, Chris P"
 <chris.p.wilson@intel.com>, "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Shyti, Andi" <andi.shyti@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "janusz.krzysztofik@linux.intel.com" <janusz.krzysztofik@linux.intel.com>,
 "Gote, Nitin R" <nitin.r.gote@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v3] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Thread-Topic: [PATCH v3] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Thread-Index: AQHa062rtWGakUg7CE6gjN+nLFOUfbHxtPfg
Date: Thu, 11 Jul 2024 16:28:53 +0000
Message-ID: <CH0PR11MB54443CBE8B4A052419FFFD1BE5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240711163208.1355736-1-nitin.r.gote@intel.com>
In-Reply-To: <20240711163208.1355736-1-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4720:EE_
x-ms-office365-filtering-correlation-id: 2175eb3e-9823-4c0a-e77b-08dca1c68e00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?1mTFdtWzz8H9lUJ7JzqBOQOB4ktbjWC794RmUYb4A03gCZHIHmYCVkBJak1M?=
 =?us-ascii?Q?FuhrKZ8dYbCEcb6zrLCmUGp+xQhrDxleQUpY89rL+ChqvUKSsROHNSyXkOtB?=
 =?us-ascii?Q?6DpfAlo1ZQgiyvnB67Sy6pIY+56MqmsrdrRx/eqdovlmr6AzpRa1geTXk74t?=
 =?us-ascii?Q?1mMOBLWJFyW1eEWg3MiCibMfruGEK1O1GEWNszpHkzGxWqVEeHBJZeQYfwLO?=
 =?us-ascii?Q?2QrsxCEyfPLZJceSF0v5sPls90ARkMOor2zY56846oLL2o7uRTnWzTC56M1w?=
 =?us-ascii?Q?T3N3Z2ufiGYwWw7zsBNODO2hPWsq/9Vq+3tXw17tfgrWXJIldCLs1x8b+BI6?=
 =?us-ascii?Q?eGGHOD3zkEnCg8nTjATnI8hlbJC4vbsORvQGkZNApCwvc+06E7Hq9tlalkNH?=
 =?us-ascii?Q?NKKtdGD0jHSwbqzleqD8VRcz+q0MiQG6IvYbHDdBRIpwKJUCwpkJtVRpPmj1?=
 =?us-ascii?Q?LXwlhLbcZzhdpTpT70h19FsDIvcc7xM9r6HImCOGx/9GvgJruTIdUVc7HQOL?=
 =?us-ascii?Q?DrtvGwA7zPgD+IS+D7ZEs+galwEg43OmkQaigmg84uGYxwPm26ZKmmyTwLTU?=
 =?us-ascii?Q?NN+ZB8fqC1hIl+6HovUgnEBSFZGaKbEMqvjI15M9KdjXiRYw1atS4bXhfloB?=
 =?us-ascii?Q?OQHGH2Cm22ITqb/w6/zDBJ68AlwDKPWyf1nR+Yf8GmpJNCs39YYEykSb/QKI?=
 =?us-ascii?Q?BUVTa4Awug3kqVdgGWKgdGDgeqA9FhpCjFCJbHurMznyD0p85a1clTL9s8ZA?=
 =?us-ascii?Q?l3jOJX4EnBmt0W9q09NJKOLf8FxwZY+hPDF4bEtCPOi4awo8wML8hFcO6FnE?=
 =?us-ascii?Q?k33rA9C6t1uGHlccbhnKBd1nUztrEVIXRY45ACOO+3PUm/UUhwAv1DOEJQ9y?=
 =?us-ascii?Q?qPbnAZsWoDU3q0OUaAumSg6vEqXZ89nDdgZY3DRDcSD3aAOKt+d9EUGTPVar?=
 =?us-ascii?Q?cn4tJ9elEcHGprmEUUC0pfrdd3Ca4bNE7ATORriMTawXzrPpeJis9C9iNHnP?=
 =?us-ascii?Q?6KKmvfnjQUMtZzv76UltDInNQzVKo+srxaAOJr+h1z9FumRIQPHRv54weO0G?=
 =?us-ascii?Q?1QZ2luMeObxXv11VvlR7jdxSDy7/nFDQqzR1Hhb/pZGNXBiG5sUxSO7Us/iQ?=
 =?us-ascii?Q?8znk+uRB60H8dnp8185enoA7WNikGcyrl1RUT7krUYE+4uFu7nr/J/1eGG/e?=
 =?us-ascii?Q?H8EiWyHNriDUw64wi9isSfGjyIseBzlXwKiO5ZRlY9W/QrqtUgxgfyrfE7c1?=
 =?us-ascii?Q?F9JQXpIvOipV0/Yv4t93jUdZFdLMcKttnz6vmwn8FY+dTVk3wmMuJYvdIEUI?=
 =?us-ascii?Q?5KERJS0+QDqKghlxpFLi501IDKFNXA5x+MXk0FzJ4uHKevxQw9ybH3tyimqq?=
 =?us-ascii?Q?DHoyBAs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WA2qoH4Vt/w6dJsN0VxBNrLaZA/klaw8qv66V5pG2JC6nEQmZlCykyVCfxJJ?=
 =?us-ascii?Q?ES4X4vyY0akTkyJ/eijLvfeNwzaA5LPJHSulGvfcFYTuj4bQUcqeKBZqOmLb?=
 =?us-ascii?Q?+mP/y1L68wtXPbCWk0+SqnEiekewvKkkfYgK3IdvreT5dF+o1/Nd/SKt3E/P?=
 =?us-ascii?Q?bZ22pLTQeCDZZS65z2I8tZo21agUw/GcQ0c67/ChrkwIE7wYxY6HOQwETLBy?=
 =?us-ascii?Q?jC52Kiven/frl3AaxVZ5gmqHNTMzKGYAiRUwBHfdyOa8xUrygEj4+Nt0QY9f?=
 =?us-ascii?Q?l1czGVzvIyB5iQd6yAF2l0LGV731ZGBbeIIR70oZtrx5YDPtMJnyTOAALzw3?=
 =?us-ascii?Q?Bcs+hoCsDB7h8VnDtDXaN2HOCufZRJ6bxCuh/Qc2k/1CSWl22AlZFXqhZ6wA?=
 =?us-ascii?Q?BVOuSjkHrPDwwP27TzXPtRKgGhJEO9nIndOF+c+5jBSU1WQb+R8ZiNZ3PWtS?=
 =?us-ascii?Q?/T87hNOvHi3Hsz4BltlbthHQjAo45Xrj3gNHjZH6db7qeqVLZ3xWwlBRGGTr?=
 =?us-ascii?Q?Xs1JGv6snDaWYcnMey4+YUEES0o24T/XTx2pCMHrJ32yvNQlrPClys1kLc7h?=
 =?us-ascii?Q?Sb5YnvBGiEWbqAbmGvE0g0pP6l3t4sT2s+P00ZxL6l/MgcLPzseIMKIcuHzC?=
 =?us-ascii?Q?vgZeXcWOKqGNP7vUbpbV0NZ9mq1zUBre7CbSrCQlpr2PVVekH07bDcbk4eJS?=
 =?us-ascii?Q?hgCkSMTPAifEWgzi+qqw5j9M7blXAV86juImpJGyIzBTQZCHWRlF9wzc/+D+?=
 =?us-ascii?Q?EufglMTzl5JkfYpWamsqnD0te/5FJ2hqThy70G5R9cBHqPGZew02BDGPeoNL?=
 =?us-ascii?Q?449ilFNveLbebnYZDXbtMATTOQtGAF/NvboN0O/+dnyhyclJKVcbknpbsQjo?=
 =?us-ascii?Q?YE5GXR+nc+gKJVFsuCvypT3OGXz2WdkuYfen6OhZ2iNkyCnC+vPlwPnREEUJ?=
 =?us-ascii?Q?ld2PSzjYiaXIJLoylhgSP0f11KmjMPxXDMK5NEsE8PShgKbk8bBbOzNjAZ01?=
 =?us-ascii?Q?Om4N+kNPFQ8MRgL1ATfEWG4thEliz3ggSWOoh3VEU73dnSrQBmgHgDQH/DUk?=
 =?us-ascii?Q?Tc6AQu687ArjMgAsHMmCcYaWreX1nI1f2qJ2oD31vOkWK6og09NHkc5Wrp6j?=
 =?us-ascii?Q?ydPFcNrcPKlmFfmF7m9j8lEMjEqVALa1hGuGwlnrgkbE38Y+0KecWGwRS2tb?=
 =?us-ascii?Q?/MXeoFaXvJgUyOboiQ1lXaKFd4faK0ZXxVQES+d5vzXvs4u6dzhZml1NgEuS?=
 =?us-ascii?Q?9l8mUeUsOskdDS6AqossGAmMqgB7Wzv4SGF26MhIsWRVRDePPqVc+JBqrm8z?=
 =?us-ascii?Q?OZSZuWgFC2L9jJRUgEVY42+Ct5Q0q/dZXgwO5U+FMSHjg/HgP82DiTeqDVB0?=
 =?us-ascii?Q?PWWSDvHkg0aY9/jZkrBzsmiXWqWgV49byBTeM1vlOTERhZ81hMJyh4E1wc15?=
 =?us-ascii?Q?I0VkLvBkhlIk5mcDaOilb3s2GpcLIuznbIA5pfdVBeCaC6V4YZTPBHFx+L1x?=
 =?us-ascii?Q?B4L4wG+Shn7SUIOR8YK8vv+iCQ0ozAfPvd7CwXpM6zJRJTZec7QKjmbzXkFX?=
 =?us-ascii?Q?uOpsr71zCnB5sRwWhdIimFPMji/sqlfmXvLSbjjT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2175eb3e-9823-4c0a-e77b-08dca1c68e00
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 16:28:53.7660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYZL0nCsTdaTE+bAUAyUro6T+t41FgFRclnCwhUahzHCkPU3stAzUzWb3inJf/0ohZ5SV+6mdQb0HzvznDH5XNGw2/p42803Kovt6dy0U+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4720
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
From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Niti=
n Gote
Sent: Thursday, July 11, 2024 9:32 AM
To: Wilson, Chris P <chris.p.wilson@intel.com>; tursulin@ursulin.net; intel=
-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org; Shyti, Andi <andi.shyti@intel.com>; Da=
s, Nirmoy <nirmoy.das@intel.com>; janusz.krzysztofik@linux.intel.com; Gote,=
 Nitin R <nitin.r.gote@intel.com>; Chris Wilson <chris.p.wilson@linux.intel=
.com>; stable@vger.kernel.org
Subject: [PATCH v3] drm/i915/gt: Do not consider preemption during execlist=
s_dequeue for gen8
>=20
> We're seeing a GPU HANG issue on a CHV platform, which was caused by
> bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries fo=
r gen8").
>=20
> Gen8 platform has only timeslice and doesn't support a preemption mechani=
sm
> as engines do not have a preemption timer and doesn't send an irq if the
> preemption timeout expires.

That seems to mean the original can_preempt function was inaccurately built=
,
so fixing it here makes the most sense to me, especially if it's causing pr=
oblems.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> So, add a fix to not consider preemption
> during dequeuing for gen8 platforms.
>=20
> v2: Simplify can_preempt() function (Tvrtko Ursulin)
>=20
> v3:
>  - Inside need_preempt(), condition of can_preempt() is not required
>    as simplified can_preempt() is enough. (Chris Wilson)
>=20
> Fixes: bac24f59f454 ("drm/i915/execlists: Enable coarse preemption bounda=
ries for gen8")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11396
> Suggested-by: Andi Shyti <andi.shyti@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> CC: <stable@vger.kernel.org> # v5.2+
> ---
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drive=
rs/gpu/drm/i915/gt/intel_execlists_submission.c
> index 21829439e686..72090f52fb85 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3315,11 +3315,7 @@ static void remove_from_engine(struct i915_request=
 *rq)
> =20
>  static bool can_preempt(struct intel_engine_cs *engine)
>  {
> -	if (GRAPHICS_VER(engine->i915) > 8)
> -		return true;
> -
> -	/* GPGPU on bdw requires extra w/a; not implemented */
> -	return engine->class !=3D RENDER_CLASS;
> +	return GRAPHICS_VER(engine->i915) > 8;
>  }
> =20
>  static void kick_execlists(const struct i915_request *rq, int prio)
> --=20
> 2.25.1
>=20
>=20
