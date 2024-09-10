Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA539741C2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 20:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A53110E8D0;
	Tue, 10 Sep 2024 18:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gp7OH0Lv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D520B10E8CF;
 Tue, 10 Sep 2024 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991888; x=1757527888;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RvM7p6FVYsBnr89IGnErMlDGsn3r9hW8fIDjr0DuoK8=;
 b=gp7OH0LvTF7MQjbaFscFUe4EZellKDB1G1N+ajZV825zbjHr3zkDXCXI
 j/fQN+pm2SUsaRpn7SHod+Zj+N0GCSqMfw0gutk9ij5vwdv1tCq1xquY3
 wSUUWsb+sWXBLxqtsbLgzwWLpE1tBhDD/7xqzVD9BfQfT1Sbpn5+UNLj0
 I3Xrur/fhJyF6Cu/cRyRj1AZKAsxvOWYkkzxuFyAL/+NtTP870w094QSo
 oOuSP+Et8No7SEKlMV0HoKG+eFJzD9NK4MBl/7Ac7nbwtBP18LNLJFhe7
 +N9wWt3AFrRnWVu//dEL2XZ/sVSYq+A/7hJJjG1ct7yVHWTSFbmwrFi4R Q==;
X-CSE-ConnectionGUID: EAJFCCaWStm2oYlhCSYSSA==
X-CSE-MsgGUID: Cq5ezQzxTduOx1Wfhm4JbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24577085"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24577085"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:11:28 -0700
X-CSE-ConnectionGUID: zvk2egsERxO9V3c9RLxwSg==
X-CSE-MsgGUID: z0L+F7NKSiaBnoQo9Ep5Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="66748668"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:11:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:11:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:11:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:11:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVfB/ddwaehdt1fCJv2I8jH3i95W9xl3UhRU+P1ApnLN7syY+oXyNYywHkVQnmutb5EM+88/aAu5UWmSldY4xGJg1HF/XZeh477SRgtjgvfKyQ7w34rwwdE7FgwSMv/BNEu6yvf1N3Jy8ZLone2t1c1jRLRMAa0Ndpq/nfzX1g90B3DRQCMHsRFErAT7jTFpUks1LrDh30KegjTBQPLmoZJeXl0z0950nNPeuS35aCpPSoFgUfh7mUOGg9ck75LEoAQfGVzNvXgc5o5MSgA+xPO8q9wgi3OZ4dlBak+TJN2bzzOWik5bjVO/WI7g9MFuLsMRHb5s69RvtbfVeqN4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYftcO+Dfo2UDyd842IyW+MLQbKy5zB6QXktBQITQgY=;
 b=Gc5RFC2920UcNeL839nkUx60j9yT3CzX/bDPc00pOK26pohKvkExG+xomQIH3d89vhG4oebbp9A9tYQ3igJLOnr6LLepSPmhx6+ASnE/SDTn2OIu9rqS2wqqIwYEfVs+eX7tnti5Eagg1l0kcXF3xrVwD1VmLd/oeHAchZjevYxMgfNWsa5/F7gdDU39G1POZ0rMoUsKLvaALj8RYcs4NfZ5n7OuFBQmfe/TZhaCtfbVjBouw6c8UipZbWdUtocSOMWs1NPXZTeAs6+AjkpqbufMAzXY27YSP8bic7JYvrITthTxrN2Hef+D7Ar5liYbORLijYlysufCFThBEdm8GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7903.namprd11.prod.outlook.com (2603:10b6:8:f7::10) by
 CY5PR11MB6488.namprd11.prod.outlook.com (2603:10b6:930:30::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.25; Tue, 10 Sep 2024 18:11:23 +0000
Received: from DS0PR11MB7903.namprd11.prod.outlook.com
 ([fe80::44f8:aece:f6a8:e42a]) by DS0PR11MB7903.namprd11.prod.outlook.com
 ([fe80::44f8:aece:f6a8:e42a%3]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 18:11:20 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nathan
 Chancellor" <nathan@kernel.org>, Edmund Dea <edmund.j.dea@intel.com>
Subject: RE: [PATCH 3/8] drm/kmb: annotate
 set_test_mode_src_osc_freq_target_{low,hi}_bits() with __maybe_unused
Thread-Topic: [PATCH 3/8] drm/kmb: annotate
 set_test_mode_src_osc_freq_target_{low,hi}_bits() with __maybe_unused
Thread-Index: AQHbA2jViHeZYYz/fkWpDpXfBThEgrJRUk3Q
Date: Tue, 10 Sep 2024 18:11:20 +0000
Message-ID: <DS0PR11MB7903E49100A373DBE8085B608C9A2@DS0PR11MB7903.namprd11.prod.outlook.com>
References: <cover.1725962479.git.jani.nikula@intel.com>
 <29a83771edd9b85032095ed3ecc1e91a77229b90.1725962479.git.jani.nikula@intel.com>
In-Reply-To: <29a83771edd9b85032095ed3ecc1e91a77229b90.1725962479.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7903:EE_|CY5PR11MB6488:EE_
x-ms-office365-filtering-correlation-id: ba6f5160-5b24-495d-c2b9-08dcd1c3f8cb
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?vyDLghmG1iRk/aPkdD07ytA5GbecG22XcQGUTlwgy3V8hT05WgNPWgA0CA0d?=
 =?us-ascii?Q?rC1N2xVOjZcHwB69X338kvtQS9Dea5aNjVpdLI/mtqRW70QY7MeBYl8/ALiM?=
 =?us-ascii?Q?iaZBn5inUTmV1SOa9Bg4FfHaB3W0nYRG7cWQFoJpG5jSqclLw2xI45jJ2sNB?=
 =?us-ascii?Q?wgFFe3o/i6mdHL6LnbzwNv+pQIPUh5EeNb+0G6xG/ylCjv3Fx+Vsbjj9nioq?=
 =?us-ascii?Q?EVpH2pDBVNLUIGgJdE6SO5q/YYkRpNqYMy4fVS1EhVrfMBv+V6e5kIumda70?=
 =?us-ascii?Q?C8gAFWg/7eEYNhYbRmgxviAAipkks8JLDZLSsw7SrQV7FX+Pe3Z6BVF8I1EM?=
 =?us-ascii?Q?7Z0XnIPAXtnzb9K2cJ46SWRzg5pUtg5oLJfkf8JyLwErICD7DWVWXMMZ+0dQ?=
 =?us-ascii?Q?WTFJSEfKb1UA4FtM6dYkvr6yfPM+BvRkyhugFjN41HFBoeTrpdbr50UkBimo?=
 =?us-ascii?Q?355iU6cmH5/dpRg8eHa89zZRH3Jb200Ot1Y+s6ager7aYWIO3IHlkzBWKBAZ?=
 =?us-ascii?Q?t9wOdoYXLl+bkH+1yJi8R2CN+DHL9Pks917XgdlW7mXaBLVBSZZ2FX7hVFjT?=
 =?us-ascii?Q?lq52++jjfeAgFLJ5PixNMgcwqa/ldGajrJbnMsyrsqNxbv8yr1jZO/JT50l1?=
 =?us-ascii?Q?RSogZmdPBo3qtYUf2//bpDdLAAjtGR7Zi52utZtdLrERXqUqefeHph/yecUW?=
 =?us-ascii?Q?miXRYne/Wz7Uovt73ocfMam85eDxR9/x+cw/+jgdsVDLHHvOOfc44I2vnABm?=
 =?us-ascii?Q?fOuyrmQObSS9jgJiAedrMmMLgpL3E3D3svzahUxPPngXO7aqNJy4bOj942lK?=
 =?us-ascii?Q?FqS9GjHqJSJaVoKlSH0KUNDF735ENqFZGu2bW6STK5HMJzAw7Tkm9Z/igahv?=
 =?us-ascii?Q?A2nVDXbVUGUo+cQgh0MdgBExb7K4TwTa4ibdamZj+oV+GT/8z1LKVKIDzSrA?=
 =?us-ascii?Q?NaexArDGFjpfUjvjSCdBJUsS33vF03lMW+LOP7H+i3ZR3R7IXeKBOrJANAVU?=
 =?us-ascii?Q?thrD/fv/pIbmDIXmUoQH9OYsgyuC26yEgEfL/5sIte1JMoKR6bc7gaqFjyJ+?=
 =?us-ascii?Q?1BFWwlZr7LLz0NEzyr7x7pELCa2MWmzlEV+1CIEPGGLJCiqzutwstMFd9QX3?=
 =?us-ascii?Q?6zaGxnZntAeJkMhpALdoU8a982yqPJe2ju3sXCQUdSvfx4RIQV3CEErLZlzo?=
 =?us-ascii?Q?pRrIOckBdTzBPx4Xxys2xg0QwQNa8XZrayrM/Q7CvNgTXXMS3z3M1a6k8PBY?=
 =?us-ascii?Q?095y9WrlpJjR+Wysq7HxONYmUgF6578zVC76uJr+KoVcImwipWJ+OzHliUSq?=
 =?us-ascii?Q?5auZ5oomjOr4ajAriiAb9rhJ/CGthJf23xX/HWcNcCofuau7Ez0ogPqmlFWz?=
 =?us-ascii?Q?LjyFzu5Zi30njh4nZAh4OI8hD2Zi4jb6OR3ldu15mZ2oHQJL4A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7903.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ANYTb32Ex95K3jeYBtApe8pck95tG0fXZANdG6j1smfleMiK14aK1leqcvaT?=
 =?us-ascii?Q?u4TlR+ilKn7Vgu6Ttie+t99hS/Ukqcjz+Mg/Pm+jyX8mvYIZVF7uB6YVIiwl?=
 =?us-ascii?Q?PpUoMsvrgm4PvmBFQnNZ+M0K48+PO3D5n1sG5XNZxUg4+yAp/Nz9vwHr3iYj?=
 =?us-ascii?Q?ALB6P9zn52qSbxpX2XeXzc2syiI2pYVVkoEkTjODYFetPC5kSotRjyMOC+ny?=
 =?us-ascii?Q?RXN6aejKk3Qr+ABooWqRMtC+zzpNX+nflsMp7oJh266njfF0S/Fo4G4UpJVa?=
 =?us-ascii?Q?Dw4Y45vyXduxSpLFYvE/tP5Ho0aeX8d6uLsU+LvMVf/hSOy7nDmeGo6eKtpp?=
 =?us-ascii?Q?KBE0js98F45IXhPYwYpp3t5+RIEKpZ/t+lPmr+SVxXChN0KnI8nREQSYh8gW?=
 =?us-ascii?Q?heW782EfJ6kEsy06scxQnQLoZ6ZY33xKlW5kIuqAV1lKIwLWhmvPESQ0wxbe?=
 =?us-ascii?Q?P4DoDzN1z0Si6PPO/mhCbWYbz0gfDdze+JLriMeOh5ijpDMCfrP6vtWQo86r?=
 =?us-ascii?Q?fL0Llxmu4ECLhAyx0r9X1hgVof0WVRQHdYiLmA+r5VJXBsjvqC4P3B7OOEEd?=
 =?us-ascii?Q?mWXhkJ8NLQtN7DS0MZ8OkyOHkZ4/gSJ0cCMW1BqMeeHgh7E4x2iogT1t9iCK?=
 =?us-ascii?Q?xblJ1VuNBVviGcEN8Ia0lATyg7KY4BxO0dLzI70+VDg4YvlpzExfs7RVF5Ak?=
 =?us-ascii?Q?9m7vh29hltWB3pobwXcb0ZZ/vfhVOiNV0Z5XoRYiC97D9FlWYEhyc/L/EE6u?=
 =?us-ascii?Q?5DtH8DrXmY9ndpB+QfgALyDZxH3VnWVX2bOGAjLrgfenXzX1WGfZVKU0ZTQ3?=
 =?us-ascii?Q?yOghaaBa0nJ2iYJ04/e2aBCOd7Ix/n7BFfk7CkB31KUYQmvqq5wb5AINpyvK?=
 =?us-ascii?Q?OR88Oh1cntwMahsvXquO6W+oAjR4rPOlGUAlhRIs6lRlmT/vGClnY9eJE1r+?=
 =?us-ascii?Q?fqCftoiUyPEmtvGpUN5ydVgU3OfOFRXVbk7VbYNBXLejXS93b42nidMwAx1J?=
 =?us-ascii?Q?4iXlzUi6fpihyPfBdboTbNNHeGG0LqvEJi4xHCTUu0DxJX0ThfgZ03Z1DzLB?=
 =?us-ascii?Q?KWibvKiomD64dzRNyT6VgPYgk//dVypIrmXrpZdhzCnmOejwtcpkGgj/kIwv?=
 =?us-ascii?Q?Mb0A5QGNK5gNbKpx7o00xc1bRTI6pdfjBPYJ4cRj3OZ0RXifJGXHMfRSbD2H?=
 =?us-ascii?Q?4icEMkwoFoW79MAk7r1tu2dxUEb/uKDuxPTZ9F7tlREK2o052VmqoESAQRn6?=
 =?us-ascii?Q?F2MP0MaBOQe/zxTCtoC8EaV3ie3Nvih4kDysEKZruCEyxJdqYlwTc7iD2XWP?=
 =?us-ascii?Q?Uciw08VNVe+/b8DOfsM1jyFvW3zC4IrHkaSPP/x3ozfCaVy0zIW/wwa/j+gY?=
 =?us-ascii?Q?6dDIXSiUp/Wf/5qwHAoQAcJc6ylHkJJc+9JR1qrfnLjrAglRwAaTQApVr8U9?=
 =?us-ascii?Q?kApoygO7yPSjsSOzitPFqShCc+yPYNcHDiPohE84I8ejfNptwGgutkGQoitW?=
 =?us-ascii?Q?4dtoDlguEb3Pp10oB6WjEXThCjjIQw2dqfU3rsWnkhyl4OXs6pTIh11wT0OY?=
 =?us-ascii?Q?rGeD8g69wh8uNx170O5uGYgfusMsnhfwIiwSBbK5s0qY6Akj1fu+xVCnhCts?=
 =?us-ascii?Q?/w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7903.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6f5160-5b24-495d-c2b9-08dcd1c3f8cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 18:11:20.2314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r/a+XoBdUUL3jYhC89kDeFiR1TvBr42CblZAf4k0H68eAQO95lQw9zhbYIUWmGANfVuiCu2WyuJfT6KsEq24ilgk1oD4T+GCMQkEnmAsZCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6488
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

Thanks for the patch.

Acked-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>

Anitha
> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Tuesday, September 10, 2024 3:04 AM
> To: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Niku=
la, Jani
> <jani.nikula@intel.com>; Nathan Chancellor <nathan@kernel.org>; Chrisanth=
us,
> Anitha <anitha.chrisanthus@intel.com>; Edmund Dea
> <edmund.j.dea@intel.com>
> Subject: [PATCH 3/8] drm/kmb: annotate
> set_test_mode_src_osc_freq_target_{low,hi}_bits() with __maybe_unused
>=20
> Building with clang and and W=3D1 leads to warning about unused
> set_test_mode_src_osc_freq_target_low_bits() and
> set_test_mode_src_osc_freq_target_hi_bits(). Fix by annotating them with
> __maybe_unused.
>=20
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=3D1 build").
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>=20
> ---
>=20
> Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Cc: Edmund Dea <edmund.j.dea@intel.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/kmb/kmb_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.=
c
> index cf7cf0b07541..faf38ca9e44c 100644
> --- a/drivers/gpu/drm/kmb/kmb_dsi.c
> +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> @@ -818,7 +818,7 @@ static void test_mode_send(struct kmb_dsi *kmb_dsi,
> u32 dphy_no,
>  	}
>  }
>=20
> -static inline void
> +static inline __maybe_unused void
>  	set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_dsi,
>  						   u32 dphy_no,
>  						   u32 freq)
> @@ -830,7 +830,7 @@ static inline void
>  		       (freq & 0x7f));
>  }
>=20
> -static inline void
> +static inline __maybe_unused void
>  	set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
>  						  u32 dphy_no,
>  						  u32 freq)
> --
> 2.39.2

