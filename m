Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7D3AE5BCC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 07:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06ACA10E13B;
	Tue, 24 Jun 2025 05:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTnRq4Hf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCBA10E021;
 Tue, 24 Jun 2025 05:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750742037; x=1782278037;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4soMYujdUwD9MKArNiKrssDU/6LBjo5rgIk9J1NqKz8=;
 b=RTnRq4HfveEYZlBRSBVUWlmGy/Yij0gKHrjljAH+jHT4yuwV65zeVmGJ
 xSiNcE0AfEB+daaGedDxdPKSK9a+7zo74BY7d+Oc+T1jE+kAOuJ4yEB8M
 gSLuQvYJ0rIjQD2WW+BTe3EVV+cUfBW7yr4DI+o0S38ifNH4qrtUEyNAk
 zdUhBMqPyJDi0N39MUAz0A/lt2ewFmV7mpEonVGyyiuC8/rsjeXYiHDXy
 mLVHMJwpD/zkmlIF9r+Aiq2YhqvTLIO3UlTnvqI6T1ZqcwcrdWEr9LFqk
 hjJkjdBeRiJmLu71r4/ISWo49x58x4UjzBV889OVehJ7l/WKbWXEoXkow A==;
X-CSE-ConnectionGUID: vLEDsy//TVO/H4qD0aKV8g==
X-CSE-MsgGUID: AvINOy5sR3WO8k2rJN4alQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="78385443"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="78385443"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:13:57 -0700
X-CSE-ConnectionGUID: jPeu6QZNR+63qYW2qX2Ahw==
X-CSE-MsgGUID: ktfrMWYtRXSKqodLozUQbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="151951257"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:13:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:13:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 22:13:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.86)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:13:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVFvPJ8wT2GfoxDllza+zbtESRMcyRH6WG0r8Jvnsyr25ptRYYzMTC2j0YQ55REzeTfzmYHMnMHg/h15Xxm8tVL1rNe/i5D9OhnOHWWExBz+0lqWRvtcrawviGSfiLYq9/6UsMtfQ6K+52ENZ2VgVZL4/byqnqteNT49P13EulCh+iqtXJVdwMmaukvC1e8QepkGZ0zg11tJcGJ9W3e1YJDJkuJxDz4QKuqseHEPE1fFGDdiUsIFWTkqIswMaT3J+WwHIVWLRSEBObqTrxa6etPbWRSM8VrJZ2T2s6MLuj9mYmy9d5/9P7yaaeC3MK1Hha6YPfUOXoja9XIcxtBBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIcZER3RPJEGRz5XTfbvm+VwuA8kyDqfZsmDvoUyXCA=;
 b=OhgWPkFasK7woXAz8dj1030SgNipSiLSf2T2WHjxnIq76IJLLMxVBEtfp6i2hoZxpUFub8OypyVG27tgOFGtThs7aZgLoafd+0DNWDI5Y9p5jUR24yzptasS1t9tnpcWjLT4jLvEr48pXZmGSJLqcs5MkWvz3HKFD1TQX5y1XqfP13aGuj5pcm4AKasEWe4gM9rTTuIjI3KcG1DWnGsbAGxEDszFOzVlh2RdY0yAnTkSDQKE5va/AIicTezknbX3Ns+/KobDuqcgPQivLbml1yi97tSwHYlrpwIkvhszWMdFElZnqOAV1rMrZgRR/Ejb1ZwfAMMqGD0jiEGaw0ae1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CY5PR11MB6257.namprd11.prod.outlook.com
 (2603:10b6:930:26::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 05:13:53 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 05:13:53 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: RE: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to initialize
 edp backlight
Thread-Topic: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to
 initialize edp backlight
Thread-Index: AQHb4a2VslIhNy7FZk+I2ydD2jRb1bQRwteAgAABONCAAAKTAIAAA26w
Date: Tue, 24 Jun 2025 05:13:53 +0000
Message-ID: <DM3PPF208195D8DC6E6E550A47ED997D9A7E378A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250620063445.3603086-1-suraj.kandpal@intel.com>
 <20250620063445.3603086-12-suraj.kandpal@intel.com>
 <IA0PR11MB7307746E548211C22AEE96A6BA78A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DM3PPF208195D8DC0A3BFD202B0AB765727E378A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <IA0PR11MB7307EC4666FD32BD780FCF8CBA78A@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307EC4666FD32BD780FCF8CBA78A@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CY5PR11MB6257:EE_
x-ms-office365-filtering-correlation-id: 357d403a-8ebc-4800-ca52-08ddb2dde9c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?RsDbyGZ4AGSmyMmsLGGUx9/F6B29WnS/Kia8pq4WkOHCRtNPC+wA94RH23t5?=
 =?us-ascii?Q?Bzq3znIS+ZtGahb7isbcllJ6xhxkYVOx7cNflhBNqww1/H/uhlEZ/1Tu374R?=
 =?us-ascii?Q?exdEkjK/z2gqc34/gonB2CIMoEYmWgRWyy2otbhPhugB37Pgi9ADWYlERNj/?=
 =?us-ascii?Q?BlhGYxXbTsO7GeQti2sbCHhcl2t2+NkxvNny9fe87YN9aA66fJ6xlku67FA+?=
 =?us-ascii?Q?rYrCgO1y6IDJTEM+bKwcTZtUZRzl33PkClMot5k6btklcrgdl4I6U1+C/DFs?=
 =?us-ascii?Q?fyR1alj+uaHCS5/tO8KpxNL09xrEpvM0tNdMzMXB9kGfZDl8KoeYUxKlqiwA?=
 =?us-ascii?Q?34EsrrMKXymXt7GfCL7B1ivk0tO3sgymDVBUdjfakrCoCIFhkcu8/jDU0ASV?=
 =?us-ascii?Q?MXfQV2Gs0V6KH7U6eq7dJchtyXizA9N+I/h6OTumpopUeUQnBIGnn87sMKzM?=
 =?us-ascii?Q?o6jM5WTHh2BYce7Pb/6xIO3KeYoxMyY0Fkt8X12HEltTx358F36LM2Gxlxuc?=
 =?us-ascii?Q?HIkTYdAsK/a/+XMqABEviJ4unWPcmQKpSNInzV9gmC40R4pmxfOQhlBRrq2m?=
 =?us-ascii?Q?T6X+x8Qn9rvMEKxiQnS/R2cxq77BfSGuEoDvrJwD7SjcUjO364kIsHOj2NSj?=
 =?us-ascii?Q?FAYr9NFLbHwHxQuqCXZpwkgUhsnhSxQYTOMnhFre8Kp4dJu30XGnBLyopYhb?=
 =?us-ascii?Q?lkUgaO9IKK7LCcralpoitR5YDbB4oBEJpYmtYvebDuY77rkiuuo2VF+/H7Lv?=
 =?us-ascii?Q?/LF+QHrpGoVaeG2vJOOLZtm1wp3FDU/HzSHZF/yH950OIHOTCeMcz+KfLUD0?=
 =?us-ascii?Q?MEZDI8Vsdrkmzv6JYp7aFyQBPN+MvdnHh7hGhLRh2nxNMq9yxK7r4CGOtQsw?=
 =?us-ascii?Q?f/zwmN3AhddnzD11EDLmrqjL/DZAFqOE7Jk0r10xschc8Nh62C3PRbJbUFqP?=
 =?us-ascii?Q?xm21y6Atw6+xEGKjcy/78WvDtECWV25PsM+AjA9u+Sut4v6uTkblqOnLsi2d?=
 =?us-ascii?Q?bknfpi2lEfWLR6q3qDeVA+PxQ/NyTp7r7yYMFMdLsn+dev3TbDpGIWj2kHry?=
 =?us-ascii?Q?yurP9tKeruC/qN3DjaujMtHAal5nvzMvH7jJtZEiDv+8BoV4L7npG78oWzI8?=
 =?us-ascii?Q?/nyuQogu5pXwuzFGNP/B4tmkz67fFqNzGdFMNkVExqI5mEp1a42A2JwBKTkx?=
 =?us-ascii?Q?ZpLEHrCfn4a4+GxZnpr5as3i1cjVG//XcAtYMVPYHumQ5gpOW1PzMgOhczvr?=
 =?us-ascii?Q?6X06kgvLQbQepCrFSwcpZ8r2gMSMPJ+BbrWCRRyvVmqu7DX+9R3H8IzEoEX8?=
 =?us-ascii?Q?UX4ok1lZw5In01iXKvP3/H3SoME+Ld9GcbIwKhMUiBYPV9PyLxxMCDo78YiC?=
 =?us-ascii?Q?4lYpOkHp8FK7eEkLARMEQpdJZ9BBpBt90Ft3A2CUtjbcduRNsucfRzyK/Rvx?=
 =?us-ascii?Q?3z+KEP/+o7fUlh19+S/GTLiERdhsHRU/gRcpWzQ4Wx4JCg/gCwQ9TCxABNaD?=
 =?us-ascii?Q?iJg6DKVx1PL2DKY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UcPC0cWn7RX9S/9yRjfOzB2NXfUsmB+QnDuRIEY3E5/g3IMK/oO7HCOlabvt?=
 =?us-ascii?Q?FGJjU+DHODVFrfk1K6Ysj4lZ+UW/zsgnVZSNZAvrnVRGwZO/1SzyO1/ZeBxL?=
 =?us-ascii?Q?LfqphNe2fpz25LIRPjUX19izdJ+QwDz/3Utzk8ea6xCIVh33FTLAscx8z7QY?=
 =?us-ascii?Q?JGLwutgEzjNDv6R78DUq+G8C32rANnoX0x6RA6nyIqDjTg7OyVrVIUmAhgsh?=
 =?us-ascii?Q?gO1R0wBUnNzXa56n34i+nma2I+i09IEFsLCtnoN2QvYyZYN0FBpG6N5PHvae?=
 =?us-ascii?Q?xwV8dikpF5YWikFEL4rMVmIIsdlEEV+N6ax+rd6weQS5sf/f3GfpHeiQJpQl?=
 =?us-ascii?Q?EboTidtOeB7a7rszNji5xD56KfIf1qYa4/TH3+Nm9NmSGR2ptkntcU4fNlxh?=
 =?us-ascii?Q?EI9eMh6JUFpXZo847tIzc0T539O5SYY3TO2jVYERJm584YgMMwKbJUi47WGg?=
 =?us-ascii?Q?nB/ymJv8PZ5rp8TE/GYMxia9aSYysRXD7LCJcV6diApg08uTxHXudv3s44Pk?=
 =?us-ascii?Q?KrIItDDnFXeT/z6OD0/0abcEtTKQge3supPMjvi+Mghz/O+uOgFz5YDSfFNP?=
 =?us-ascii?Q?qs8TY63TzM5cq0/qbkUvrgb9MZkZl25NGJHHU7YcB+o6XvtSdUE+xtrVO8MK?=
 =?us-ascii?Q?rI2z7SAoD0zg66aG4lyTWs+i7KcxFSCr59Khk0yy5mkRaxItJJVXQqVvLTpy?=
 =?us-ascii?Q?N1juhLk5YaQrxEG1Cz9rouOCaGmFP1rSd6PXdQY7yDuqX/oNZoyZIue87iRg?=
 =?us-ascii?Q?CaWDfpWShFbhmM0jMFpFPOLtYJ3l6daXyhXa6KcarYc06mSzJQcsjHC8A0ZK?=
 =?us-ascii?Q?nCWIS3gWOH3iJL56X7Vwdljb7jSwRgljpuw2C1n+EcRFLMeUDMoEsIfATP8T?=
 =?us-ascii?Q?1NWbj6zcp416aj9GvKNTD5ak3ZZTluQtImDyD9D4vm2RNB1zVk2zbx3Y7O7F?=
 =?us-ascii?Q?h4dvRMp5P/vI0ihMSVC/8OWmqTs7jNQ9DqeP1Ft06wQNfTasj04gmagu/3kh?=
 =?us-ascii?Q?BOpU8zv2DRbcQoi3jJx2rZntKvbTRv6hZqlGw4qgggN5alDsE/T22U53/b6Y?=
 =?us-ascii?Q?XLQRvH3cwMgep9MecX062rHG/m7fXlJ9MZiEa24T32/HAB+A447e1+hjVkKM?=
 =?us-ascii?Q?+D0zZMHG7dhnfeoUpXDbiq7htu4VUfIAivabSeoxA+oMAs1c9ATMbk1n+kIA?=
 =?us-ascii?Q?jpoGeHaxYK7QPZ/kORLOLIQTS8skGzH2Aw1KE0+rj1kdt2muXyu7QvMjww5z?=
 =?us-ascii?Q?uM9giotqGcjg96CKkvxaGJ3cqxebBQYCjUtXvakJmN2expCD27OIdSnBXT6R?=
 =?us-ascii?Q?5RIBGU/L6YwAeozV/46gR6ZoxcxouiD0Bl3xmUE3meGwA5UPtwks/oiQXdGB?=
 =?us-ascii?Q?4sa3uhyEWUNNjdKW9Ku1zJUf2mE3gb8gGwhB+xRjJUGcNrVXgBAz/z7NSm/k?=
 =?us-ascii?Q?wIEcxFsFMvRy9yPnwDUD833+huXlRESmd+wD3JjYkFx7MZ1Kpdgq0PIq4pyh?=
 =?us-ascii?Q?pnml9OHESm4t5NSTAhNgey4tklWCviZg7VFXYSH+urJweZmCjzUPKgfv7IV1?=
 =?us-ascii?Q?/KBcZrUu0a06zYKi3eiZgVRWO21+72vGKWSbJOTR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 357d403a-8ebc-4800-ca52-08ddb2dde9c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 05:13:53.2879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6nM1t8/eAzcsvtDbFmkSyppgQlqKy138cDq7W/gLxVyMDmWX6AlwAxUfy9oYBtmLI18O3UKsR6/d5wOYBEvUvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
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



> -----Original Message-----
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Tuesday, June 24, 2025 10:31 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> nouveau@lists.freedesktop.org
> Subject: RE: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to initi=
alize
> edp backlight
>=20
> > > > -----Original Message-----
> > > > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > > > Sent: Friday, June 20, 2025 12:05 PM
> > > > To: intel-xe@lists.freedesktop.org;
> > > > intel-gfx@lists.freedesktop.org;
> > > > dri- devel@lists.freedesktop.org; nouveau@lists.freedesktop.org
> > > > Cc: Murthy, Arun R <arun.r.murthy@intel.com>; Kandpal, Suraj
> > > > <suraj.kandpal@intel.com>
> > > > Subject: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to
> > > > initialize edp backlight
> > > >
> > > > Now that drm_edp_backlight init has been modified to take into
> > > > account the setup of lumininace based brightness manipulation we
> > > > can just use
> > > that.
> > > >
> > > > --v2
> > > > -Fix commit message [Arun]
> > > >
> > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > ---
> > > >  .../drm/i915/display/intel_dp_aux_backlight.c | 98
> > > > +++++++++----------
> > > >  1 file changed, 48 insertions(+), 50 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > index 800d07c7f041..117c762fa2fe 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > @@ -584,9 +584,37 @@ static int
> > > > intel_dp_aux_vesa_setup_backlight(struct
> > > > intel_connector *connector,
> > > >  	u8 current_mode;
> > > >  	int ret;
> > > >
> > > > -	if (panel->backlight.edp.vesa.luminance_control_support) {
> > > > +	ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> > > > >backlight.edp.vesa.info,
> > > > +				     luminance_range->max_luminance,
> > > > +				     panel->vbt.backlight.pwm_freq_hz,
> > > > +				     intel_dp->edp_dpcd, &current_level,
> > > > &current_mode,
> > > > +				     false);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	drm_dbg_kms(display->drm,
> > > > +		    "[CONNECTOR:%d:%s] AUX VESA backlight enable is
> > > > controlled through %s\n",
> > > > +		    connector->base.base.id, connector->base.name,
> > > > +		    dpcd_vs_pwm_str(panel-
> > > > >backlight.edp.vesa.info.aux_enable));
> > > > +	drm_dbg_kms(display->drm,
> > > > +		    "[CONNECTOR:%d:%s] AUX VESA backlight level is
> > > controlled
> > > > through %s\n",
> > > > +		    connector->base.base.id, connector->base.name,
> > > > +		    dpcd_vs_pwm_str(panel-
> > > >backlight.edp.vesa.info.aux_set));
> > > > +
> > > Can these both debug prints be combined?
> > >
> >
> > One talks about backlight enable and other about backlight level do
> > you still Want to combine them ?
> >
> Yes, can replace with "enable and level controlled by"

Sure will do that

Regards,
Suraj Kandpal

>=20
> Thanks and Regards,
> Arun R Murthy
> --------------------
