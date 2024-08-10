Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA5994D9C0
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 03:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699FB10EA4C;
	Sat, 10 Aug 2024 01:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYMutwby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5317C10EA4C
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 01:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723253334; x=1754789334;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jeNQnqqScYHk1kwAU+0nvS5SsQDqiP5AcBUC78MmHvY=;
 b=UYMutwbyHlqWppdwWRC3w6eqSJgN/tuMNxSluY9s+byOMwokImOPczHk
 JHqpKlA1VfhzLne2Irp3SbyT1p4jhP3awUfg69CLrRMWaGMaEQqeTo9Bj
 7qAOkpPvvIDgZY6mbtrL3JnCB2Uixh13mEih0j8j4nr+KnOUzEkyDo9sb
 iQJtiO9HEeSdJ+CJaAEzH818eIpHqk2LzoI2b5ZZy24ULiiO4wdwtFEd1
 TNrAVZh/QhzccgffUyuniy2oSE8DZAkIqQ263Q0OBW2hFlj2BQ2Be236G
 d86dxIgQUKTPI8M3R4fCTAGaHAkm9G9pauFhSg0waaw1Ai5JViZd+72C+ A==;
X-CSE-ConnectionGUID: i5LooTbqS8iqf7inwsLnFA==
X-CSE-MsgGUID: CNqkpSrrSVqA4xY1sUp/ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21592497"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="21592497"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:28:53 -0700
X-CSE-ConnectionGUID: 19KRqTIYRAKUogX9B4N1Ag==
X-CSE-MsgGUID: wPhFUU8uSmmyIu5NLyOHcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="57631632"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 18:28:54 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 18:28:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 18:28:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 18:28:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QI4qvtJ+sIDUzbU9Zp/QWnY1Ifao7D8m/Uq51v03s7jLSVl8djjugpMyQH3HpJ3ibUl9V94Mi1uclh4gZ6jNtlU8Hpb8gdV/u85+8OXWM8gDQvEOxkS/riXUUhN0r+CFJxzH8f2tThfua084gEERvEZ1bQubD2RqOnVcYzJpwL1GKjZuScxl7r5CbOTgQYPPvPCPis4GK5ixTPmdWZ4Bw/NRHHF3UbnzxMVRzyQzj7GU/eAhY/Mtr7I7cufDlt58iI7W0g7D9k4z0JT3hOSq3lBHguc73zXGQj7XZBAVlp3SClJMF1tsMx7ARvMzr763AMGng7LCurpwzOW/PF0TtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKMfg+jRdv7H9Biio3GoEFNmZ/K8PU39N7RnmMvGMzk=;
 b=aB6p0OxCwW8hW6sNPzfrSVRpUltY+IluHFXM/FfZfqK8Vx3AMJw0X691e/mcZrE7tNhpSm2fHXyR6NbvkeXK0ce1YiI7F9Q89KeinTp06yEVQ+IvFsAIGrVDvaEgWCVLQKkDKHCnih4Piof3NGkbXnc89i7FcTtxkRmXjX+Ec6Sv6OD0lI+qYNCr1YF/OTgWlxILjmxfPScVaESdDo+yglFQFpogWpBd4kaauGld7IVSyqhnAYtn5OImns9WI9u7T6T/RgcHJK/OMryCs+TIa9ZGSEwZ407GC+vpQhdCW26yuQEfuCX7YG3d37BN87b6oNL3fj/lYsoA/Do9SSOvlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH0PR11MB5299.namprd11.prod.outlook.com (2603:10b6:610:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Sat, 10 Aug
 2024 01:28:50 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.7828.023; Sat, 10 Aug 2024
 01:28:49 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v2 1/4] udmabuf: cancel mmap page fault, direct map it
Thread-Topic: [PATCH v2 1/4] udmabuf: cancel mmap page fault, direct map it
Thread-Index: AQHa5uc/EbdykAxM+ECUA5tcjekmybIeFDuA
Date: Sat, 10 Aug 2024 01:28:49 +0000
Message-ID: <IA0PR11MB718542BA11A38A5BD40ECB00F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240805032550.3912454-1-link@vivo.com>
 <20240805032550.3912454-2-link@vivo.com>
In-Reply-To: <20240805032550.3912454-2-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH0PR11MB5299:EE_
x-ms-office365-filtering-correlation-id: 5bd33ec5-a376-43c7-8a75-08dcb8dbc998
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ouSgv4Glf0tbXi3p+R8scuXqc6sP04kte5yF/HyyKUyIHrDuodPjtA0seY?=
 =?iso-8859-1?Q?7Z2+L4AQRzMSbDRRUmU04MC+fhBRS82GgLH89i7unb4F2VTRA5FNQGr9o9?=
 =?iso-8859-1?Q?TyvjuHshsSdqEakaunZO4Wq4YYquE5sRf+ULzaCytn4gSfUxAnA9bSvtNj?=
 =?iso-8859-1?Q?khQcuBD7B4BMNuBY3KKP0TVNEzq+/Z8/BDmT1e0zXqzB1tOl9fvyj+GTvT?=
 =?iso-8859-1?Q?dYX4Tdr43n3FgmqmgZjTnuRIhJ6oNl62P0Q6Kc+VWqlCyoOWcBNTEftXW3?=
 =?iso-8859-1?Q?9dp2UDpuaxTMNs1jabci4A/H9bYI9k0IluvqZyqnWy4ATvuMT/f26UAp+S?=
 =?iso-8859-1?Q?ir/VkS5gycYY8H0q29KOhraLd3mCV2BMZoqMl0ggC0fVNiWscLvTWoTzmm?=
 =?iso-8859-1?Q?7c0uE684XKAYaZoN29tSf3/xsa4s8BpYNjlYAc36XoUYVCB0ewlp3WLEEj?=
 =?iso-8859-1?Q?xlDmWmLVr+KQY2SyRxuMMDd537Dk/D8b+8DbKqSazApmMhUyuxyHRz0N2q?=
 =?iso-8859-1?Q?vT6Kyb9k95o6Ad/Sa1Uc0GftUp4N1NMAE8EBgm7uQDw6bBHTVoXaUMBsJy?=
 =?iso-8859-1?Q?ZXKbkp8ttL7K3VNQsFeRA829AtzR5DsxEhgL/K44OhALKLJmSawGO/rtLH?=
 =?iso-8859-1?Q?tEg3XJh3mKZKKS4uBEnLs01ja7Cfduk3M0zSxmkauHTJ6cYNovPb4KYnZm?=
 =?iso-8859-1?Q?BTQaIRXGcXU0fU99GgT7VWfsrEKeX4pLbcZnoHzAcWOMmJhNXzXjlgg/Yw?=
 =?iso-8859-1?Q?CeZtTrP3bA4I9ESBJlmo3N0g2cJe4QM8kWgHl8+Sj7M/bDX9XOVrss8G0J?=
 =?iso-8859-1?Q?hGfCtFrFxkCeyN1zIWgUpfsD8q6iI8k3iTgoSmOpFmdtPZlepT0uUNB+f7?=
 =?iso-8859-1?Q?fIrjPEyHk9tAV0PAoNuVpn9YYR0d0Lvo+pQQFni1vhCwYD48UJzN8WIfmA?=
 =?iso-8859-1?Q?pfZaUyumbuBkDq+z7WX92nlDNCRnZTflYV/H1cFxwtsDIgUQR60BBIxTA5?=
 =?iso-8859-1?Q?l2W/BsWOlsTCwXZdzLPLkwFk9P2AmL8XpKMfU0cibeLTzfSZrrOadkThf8?=
 =?iso-8859-1?Q?Wk3IigCS07VTx3dremDHybArNedTWdAju5Kvf2Kx13P3uau/HwDlaxOF3U?=
 =?iso-8859-1?Q?Mw1bIithJg7asmPPb4KzXD/o0rukVTC9ojpcAodK7omR2wRvhJG6Drx/JM?=
 =?iso-8859-1?Q?VkIMdbTLAJPT13dcRpCXlO4Qy8/uHut6emxD0FYQRzCypewbi7O1DIfrNl?=
 =?iso-8859-1?Q?SHJCzf26u0rZEWg1X0hiJ0r7r+/g3NF3e4NvQfRa3ty9e4RtbNlsXgVPON?=
 =?iso-8859-1?Q?gEhXyToI0UgVF9tOanw82k166z8Cb4SaAscRtBM2Grp4/TQbCt1zGVp0UI?=
 =?iso-8859-1?Q?6d2GnZ6fkQLb5SoL5Gd98ROigrJjVnFXNqyPnbmB5LCnOpeBle5BMFF9ZS?=
 =?iso-8859-1?Q?tCKDUY8p2dPfnyElBC/sdhkisJEXJOIw9IOtcA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vs1zxxxGMhY2R0fD1hfDNpqFRPWjxofPHuBYlOwD77wVbXccUhWqitzbHa?=
 =?iso-8859-1?Q?Bh+2wDb2WfGVKVwelh4fbdKIyqWeHTtgqR3XMw6+FAGwodoFHwCFQ8yVan?=
 =?iso-8859-1?Q?mXWB+dM1SFGTpWSuBiKd4EAp4uPOSjiqDgYpvh8+KS07/QJ53kM3+Xhv+1?=
 =?iso-8859-1?Q?uy/Xc3+G5HenywwNtuBhzr5fYZSzyFea9WYFSp82kfq3A2dhHPy65xqUPe?=
 =?iso-8859-1?Q?hPqaN+gC80Hvs/rrnS5CGT0uzRRowd3fE/SSrMF+tWPFVeoYe/Rt/CjLoG?=
 =?iso-8859-1?Q?Ocqaso55rj7p+APqEiSDZqOaeBr1jkNNYhspOKI+O5FK14/Iinm3g721f5?=
 =?iso-8859-1?Q?JjE3ujzfOmCv/rraSkHovoLLjw42q9OtnsHKmtYZaVUakoohZEAly5lgjw?=
 =?iso-8859-1?Q?kduKOGbWb5DFJqwMMxVOd0gzObi1I+SLiZwJIZ0QTTL0DZGTfQ8EXV4CuT?=
 =?iso-8859-1?Q?pJ5oaCuBwjcur26kiw95Car9FVaVFcvn5QHt1h+X7wlfPjC5cZdLLgGg3Y?=
 =?iso-8859-1?Q?r8iTIrzCkbgHxIU1w6HQRI8h1RmB6I/K/8BMoRBEricIKOX8yWiSyHGWJL?=
 =?iso-8859-1?Q?DyViltmM9WJF5xg6c6tCoN/rRLIkSOQ0M0+ksy+lQN/D/Qw8KiBYSItdT2?=
 =?iso-8859-1?Q?05w4Ftd3PmEJlrV6EskGa9TpjSBonCMN5+bHj29A8eckIAtpy/6NAtk9kE?=
 =?iso-8859-1?Q?XRLfENBbluLNX75x+zSlyKEqEaXzpt0a91gMIumCa8XDfPV4RmwcbbKBdt?=
 =?iso-8859-1?Q?ndqS4ztamVaPABFxBZrHfYsSBPnzeld/za3Gzo/2KDSFujGT2PevTYj6lU?=
 =?iso-8859-1?Q?wLrj3+O+FhV0MnZfGUqQaJ1yEgHY1n47NPLZsjR/m3i0WQ7IUSQxT7Tfq6?=
 =?iso-8859-1?Q?iBVh87qzN05a+kKAmnZFLsSQ+iuPDf0GC1vS0NDOZULsxNr1/NcU+KeOPU?=
 =?iso-8859-1?Q?uU6t5vBdVY34m1yPmvxW0/r7AJp1AnNVpG1kagRIKscfLnV+kNIeyFJWTK?=
 =?iso-8859-1?Q?Qs2ZtvIlw/yR+I3BWq90Ae9fDIZS+HpxVg/d3t/6cV3AN4N3AFTX31p7f7?=
 =?iso-8859-1?Q?toKzX/t79r4qrBzGy/FxexZEm7ZQ5AsJeebHTL045YMYNhGncpREMO5G6x?=
 =?iso-8859-1?Q?nXcsYmm07dt8PLd9+lnyXQIAW3Qz0cueBuxPXW5GhGwyRT4PDrUzjqMR5H?=
 =?iso-8859-1?Q?sJZjX90H70FP4+vTGtY+T2n5hmcic6X49Hg0eaB6wnmdBBPLHcjfLbeJJt?=
 =?iso-8859-1?Q?wcLu0oD/OWqMiLndbbaT0b6hOdjmnhDetOSY6UQ1an1+bVWqxAxHNpS/Bq?=
 =?iso-8859-1?Q?DhI7Fmikh/oTIkt11m32vN5reFI4bmZsg6ge3Dc6FSvdN8+nn6WihLkIIr?=
 =?iso-8859-1?Q?YWe3t27r7TUKE1zf/7Y+mP/LDypRgIsniLHgagrTuv9LuPpfnQT6GJhNu9?=
 =?iso-8859-1?Q?3+9Zso7p+LJa0vykmcbeloPlHlYLs+HwwedChN5ethH9S/btD37YGRAdyd?=
 =?iso-8859-1?Q?twBHUUQehyyYj0qWUtG9qDUF4TufzmdcxJGa6ilVuWGZKP+bAQXdt+XvW2?=
 =?iso-8859-1?Q?UNQtKaLjYN2CT8L1D2cqtRTNQ+MuiFoITEfbSI8i2OpgFJE5AgdTE4pSfb?=
 =?iso-8859-1?Q?6nNJoHY/jKwdAW7Kry5HrMp+Zch442ssiP?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd33ec5-a376-43c7-8a75-08dcb8dbc998
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 01:28:49.9268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kLbLHXyTQympKIvQuSD3hCd40ztuZq3xJSCPwWi55n0ubKPrIW1tWmKRI8wbXgHPuxpCtRSKDkKhVPt2fJrPSDC7bNvK9ek47z+AbKU1dbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5299
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

Hi Huan,

>=20
> The current udmabuf mmap uses a page fault mechanism to populate the
> vma.
>=20
> However, the current udmabuf has already obtained and pinned the folio
> upon completion of the creation.This means that the physical memory has
> already been acquired, rather than being accessed dynamically. The
> current page fault method only saves some page table memory.
>=20
> As a result, the page fault mechanism has lost its purpose as a demanding
> page. Due to the fact that page fault requires trapping into kernel mode
> and filling in when accessing the corresponding virtual address in mmap,
> this means that user mode access to virtual addresses needs to trap into
> kernel mode.
>=20
> Therefore, when creating a large size udmabuf, this represents a
> considerable overhead.
>=20
> The current patch removes the page fault method of mmap and
> instead fills it directly when mmap is triggered.
I think it makes sense to populate the vma when the first fault is triggere=
d
instead of doing it during mmap. This is because the userspace may call
mmap but does not actually use the data. Qemu works this way depending on
whether opengl is available in the environment or not.

>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 39 ++++++++++++++++-----------------------
>  1 file changed, 16 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 047c3cd2ceff..475268d4ebb1 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -38,36 +38,29 @@ struct udmabuf_folio {
>  	struct list_head list;
>  };
>=20
> -static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> -{
> -	struct vm_area_struct *vma =3D vmf->vma;
> -	struct udmabuf *ubuf =3D vma->vm_private_data;
> -	pgoff_t pgoff =3D vmf->pgoff;
> -	unsigned long pfn;
> -
> -	if (pgoff >=3D ubuf->pagecount)
> -		return VM_FAULT_SIGBUS;
> -
> -	pfn =3D folio_pfn(ubuf->folios[pgoff]);
> -	pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
> -
> -	return vmf_insert_pfn(vma, vmf->address, pfn);
> -}
> -
> -static const struct vm_operations_struct udmabuf_vm_ops =3D {
> -	.fault =3D udmabuf_vm_fault,
> -};
> -
>  static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct
> *vma)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> +	unsigned long addr;
> +	unsigned long end;
> +	unsigned long pgoff;
> +	int ret;
>=20
>  	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) =3D=3D 0)
>  		return -EINVAL;
>=20
> -	vma->vm_ops =3D &udmabuf_vm_ops;
> -	vma->vm_private_data =3D ubuf;
> -	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND |
> VM_DONTDUMP);
> +	for (pgoff =3D vma->vm_pgoff, end =3D vma->vm_end, addr =3D vma-
> >vm_start;
> +	     addr < end; pgoff++, addr +=3D PAGE_SIZE) {
> +		struct page *page =3D
> +			folio_page(ubuf->folios[pgoff],
> +				   ubuf->offsets[pgoff] >> PAGE_SHIFT);
Please don't use struct page pointers, given the recent conversion to use
only folios in udmabuf driver. I think what you are trying to do above can
be done using only folios.

> +
> +		ret =3D remap_pfn_range(vma, addr, page_to_pfn(page),
> PAGE_SIZE,
> +				      vma->vm_page_prot);
Could you please retain the use of vmf_insert_pfn() here, given the simplic=
ity,
among other reasons?

Thanks,
Vivek

> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
>=20
> --
> 2.45.2

