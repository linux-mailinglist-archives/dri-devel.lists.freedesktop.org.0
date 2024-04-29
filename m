Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FEA8B5993
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 15:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9706110EA58;
	Mon, 29 Apr 2024 13:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4KE36Oc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB08210E506;
 Mon, 29 Apr 2024 13:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714396390; x=1745932390;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=kLArVaVY6USYck85kWcy5GOpznRvGdXXyp982DOoFNY=;
 b=O4KE36OcE4zIyJKrkx5AYmLNmDelvCnW6v34BLtWTtxjWal/myolJ2BR
 lZSDgGzgGxfYBEsoswD53NqOWcTwrPvi+A546MOfGXPI0e0jy59Fb8hun
 o+8423M79FMv8IOKfNbhRt6D9mtqV9FnlVy9ZwVlA15kKlhp/yEZAIEky
 LoIiyXe2PqPpVsNcRsjNBYGLcdUGYONOPEuXOULQWuuSGBpdHJob5cqeP
 7xP5kJHRMZEXwSy9MpwaTFbL4sR7icUQLX9PK6qE2iOTufOzvWWqE26yo
 osKs45pGI27w4RvklYF6VZ7v6R7bYtOcd0uc67lCm1ZHQCF2gbzGGuB5N Q==;
X-CSE-ConnectionGUID: 2Ohc/HZcQQ+R+ZWU8N/nOw==
X-CSE-MsgGUID: Vt5k681cT3KjFK3/L62poQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20604863"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="20604863"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 06:13:10 -0700
X-CSE-ConnectionGUID: b+vHI7y/SFG4XOMLIB4G5A==
X-CSE-MsgGUID: mLtbAa0XQTGwzjGKC3nRiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26210863"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 06:13:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 06:13:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 06:13:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 06:13:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 06:13:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHA6daGRw3nrJH+uL8/GpsS33kVNVggtFq5swHUSKcY9Sew8idtSAvcCx1JNjwVMI6Ij77kL+ekP0uSYf2b0HPpqImSYYgHkiTzadRu5oWUelbVpAbspEPkF1tMqoJem80u0/nDlktw5AQzzg9TAiDwNde/k9bunBut8KCMEDQnLNtkRU2FhHOP5wsztrZwkdaM2pfe3iGHsHxZ9y2VB8Nq1Mb1qi4qg7T2G/EUgRcKZhNWFOPvCFH0L2bg6o6AqD2vUKeGDCy0lpqLFFORoH/zpb0jXRgi2bXwpXWQUtAFU4EdQRTbKQxUA5la9bAYdUdI0PUYlYlGFgg9/sK3JYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3FNHwCmfUbQJjvXi4hiOi3rZRVnJKd6fXBIcy9IVkg=;
 b=mfWJBfHaXz/WbYZK9BhBqSNXLB2XFLNrhHOfpaan/XuUs8DRuRafsbPUx1+7C0bri4Z9QLMVnvtlnnUKPjk79bIdmc+A9Q4OR1fzSrHkyp/JJY3yLknCVpazbcR9apJ11eegIV9HVfsOvO96eNuph11vYAL/rMV0q0EdiGVgCwWHmkVrjUitP8IzFHIaZHBPItqPI7vavLer84+PNb4c/ygWormEoPBKDJ3v9UjjJxB8gQpSqhdY+3V1JbP/Ia12hkZztj3rJP9c2N6CQnvVCF+ojlFpJhJTup8vOELcmKuLpS+b/bunhpbzxX0Zc5yJBHAjmd1YtR9tZeVip+RLBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5889.namprd11.prod.outlook.com (2603:10b6:303:168::10)
 by SA2PR11MB5036.namprd11.prod.outlook.com (2603:10b6:806:114::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 13:13:06 +0000
Received: from MW4PR11MB5889.namprd11.prod.outlook.com
 ([fe80::89d6:5ccc:1dcc:3073]) by MW4PR11MB5889.namprd11.prod.outlook.com
 ([fe80::89d6:5ccc:1dcc:3073%4]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 13:13:06 +0000
From: "Gibala, Krzysztof" <krzysztof.gibala@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@kernel.org>, Gnattu OC <gnattuoc@me.com>, "Chris
 Wilson" <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/i915/gt: Automate CCS Mode setting during engine
 resets
Thread-Topic: [PATCH] drm/i915/gt: Automate CCS Mode setting during engine
 resets
Thread-Index: AQHamja0lMQF51vlwk26SxFmi1n8RrF/OSLw
Date: Mon, 29 Apr 2024 13:13:06 +0000
Message-ID: <MW4PR11MB588914A644099F7EE2553EA48F1B2@MW4PR11MB5889.namprd11.prod.outlook.com>
References: <20240426000723.229296-1-andi.shyti@linux.intel.com>
In-Reply-To: <20240426000723.229296-1-andi.shyti@linux.intel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5889:EE_|SA2PR11MB5036:EE_
x-ms-office365-filtering-correlation-id: f6bb86fb-c172-47ef-2b4a-08dc684e1bc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?eooH02w4s32HyqMmfF6XEhdEPp5Tn0DdNWp3tqZBusjBMUgSnnQNfNC64sSj?=
 =?us-ascii?Q?mU7c+hRktVH8HCHZmLJ53odPCej8weRtBF2d7K8E76m1v81bDQJaL4js4AvM?=
 =?us-ascii?Q?6TAtkuiO7ARm63fIKuYLrAS5M0fogCykTGdLwV4AL1e3s+qFxQ+8w0Snj5a7?=
 =?us-ascii?Q?+pfpKl/ipc0pMjUJnFUQdOD/TDsSKj3LMZvdxlZ1VcYw6duHSKtLQAwI4DZh?=
 =?us-ascii?Q?FfP7/YdYpw1wk0QwShZ7tnBNsGuu06CVgujKYvxFFiLsuQCYWR6Z6YTal37U?=
 =?us-ascii?Q?QbohAKf8hnLEK96fbkRJ3R/4gHX7atbm7nUECaNIelXUF5iUdNqq/sOKhdPt?=
 =?us-ascii?Q?d+PdeJb5EUrMRZ6RAV2kSLMNo0hOQ7/cSpDbH3JGZIQ63EYGkgGUUaL1Qv1s?=
 =?us-ascii?Q?kGxKUY7u6vI2XfyP6qQdvMahirnx2gge5Rl8lig1zhOqgCirntAwvhQhqIq4?=
 =?us-ascii?Q?or1PqH18gKmoXNCgDKsdajqWBhhrqe3E5zFcMkLrID4zCrv5hy1wPi9FVkzd?=
 =?us-ascii?Q?sgPSvxRKMLfpOAqjyPEyuG3jQv5W+Nfle2Pz69UMKMCfC+DoB0PyWlZJAJul?=
 =?us-ascii?Q?2p4GIsrtc0RbIl8Ubzdzi3cGCHQ3iCWhidORINP1e984nsZRnNhCuF9RCW29?=
 =?us-ascii?Q?kKXuSnVFJJSyx6nex8xL403gnfKBrTdJaQEu+j6gMgHfM4i2cHMN5bxwUr2M?=
 =?us-ascii?Q?H8Adl7BUDC3UutfeXnKaMMpvznF/bSiQi2BpqM/GaS4wzC2QIY3KWpX34Io6?=
 =?us-ascii?Q?fKLlqZwQX5CqGIzNNINQfgAJES9sEzVNOjpnTMPuE/3UxAWPGdN/cpqj20lU?=
 =?us-ascii?Q?Hm+gDacj2oJmYbqabBNcgnYurVNGIm3xDH1NW5x+Gt1QmkPMjZmIbojqKTaH?=
 =?us-ascii?Q?noHFv/vbknImLmk5PwUZ3/UMEGHYlXXyd2LccQd4gIxJRUknId9WJEeqHKCV?=
 =?us-ascii?Q?vxHl0Wht3dHJmzV9u4pWnqcuoRezo9IhBzLesYutB9lj5302/elWxp37MM67?=
 =?us-ascii?Q?Ryc/zxSIImRJnaZTrVumHgs1CInN5t4pi8IAW52H9ww3S2qWJqMFyNRjyJz8?=
 =?us-ascii?Q?DFWsNPatjnzjDYUX6cqfODehial87GW89KujtwXcpsnMpQuMezFQm0t+EBDb?=
 =?us-ascii?Q?tOU1sKswh7Jsuw4i46y+qrCh+yrIaZ5xRirl3f1kEWxFxjS8PkhlPkOq3Nvt?=
 =?us-ascii?Q?QnxgEtYhj7Ilv1UBiFnrEbB9jAVjKxXQCRfpp7jsyD2GAbM1tmosLdVDVwu/?=
 =?us-ascii?Q?k+YuJI9RbSWpxRSiLenpPbpLlDiTuOGCdvfzEpOihg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lUXIqNAlgiXSvb2oY/e0vDDElTRgXmdcj346bGHcjiKY8pyh0TvPuEYk17qx?=
 =?us-ascii?Q?mt2FAttd6rIFykKu7zBAZEqA7V/i04jJDznMey5aROp1OwgMMhSofvU3xsR8?=
 =?us-ascii?Q?RCGRKm3dSkdM/FhALspKnMDtp8embXm1yXis9LbyiJgo74OvtrWS2/pbMdIJ?=
 =?us-ascii?Q?MIZNo3vk/fSDkbW00Vs5njZpEwzkwLGsqCbazl0cwYBjAqYoRELwHuOobXMa?=
 =?us-ascii?Q?l0yAAqoFhEN+wtDNKBC1sY0bHvFT9nbhaXawlORbLwC7OB3i+1GBSaSOe6Fa?=
 =?us-ascii?Q?Llr/RBgOUKjRuhHGxZiC54rIyX/+GULfkFpwQBQlnP5HDlSZigRWpoGoCph8?=
 =?us-ascii?Q?gliGhAQSOLJqZcUGCz2Gz/z+kw94d1xnUfaDoQ+Cwp7JqpfFI1KrvQvaj1XA?=
 =?us-ascii?Q?XPdiqhxrH/nwcynXgZzqyy+V7pWDV9bP6a7nHSmnEl/yQQCDK+cDKjW2FYSd?=
 =?us-ascii?Q?RRzUqMrrgIdwbZ4P2SB/6ccxwgZluAYfR5gq/M3hwyeeKM3b0G8MGsvEQMNH?=
 =?us-ascii?Q?zejV2qbWnoq4cjgKcxYeXuZlTyOANrBdYBcrVS0EdmqCO2frg/TmefB/novF?=
 =?us-ascii?Q?m6MAu3t5PbUSUK/MVB/KrVtZDTZPhVWL3dKtjw0rENg3GrMse+0Emklp9yPt?=
 =?us-ascii?Q?237mqGMh0R0x8nY5UuPdJ/KrGyUm8rzzxSTc6k8tuII51liChuoDAmc9B7Bx?=
 =?us-ascii?Q?+10tykEjLwpcmCaK0Ntnf5SqigfVHOyMqUhXurAK2gGERuIjzpnevvZ0fRm2?=
 =?us-ascii?Q?8Ay9bhLyxPFflsp1XDT/Lb4MXcCLzaB8VMKrx/IMH5KkAJalCNJyBI67Z4FD?=
 =?us-ascii?Q?N/MD8v2E5UoKi7I5cK7mgJWiVLqnCT7ORGgsmAzVgBSDns1Aa9hk+weePBKw?=
 =?us-ascii?Q?D29p7ihQLEyyi256q4FJFLZtMMFAwDYoemfI+Q0isx/yfl5JVjEMiHem/L03?=
 =?us-ascii?Q?aNaC0l490bhcQ3+cagHfqnK3x+hCJDrPV7PT4kBAforx+19K9neML+8OjmKH?=
 =?us-ascii?Q?jo5w9Sdd9mZzzHv75fQt13O3sK7OJ7xfPdswXxbRwolKlBwPW2EnNbPr9fPB?=
 =?us-ascii?Q?5hqg7npCbJ26PuLHJItkidr2w49LtsjRiBdHUFGVxX2AAdV0kQczrscT5IBL?=
 =?us-ascii?Q?oi45JkGbOFb18nYMHsmObM6fd0YXr5qps5Ygq3n/xJz+XpRvOUVe7/v0vwbu?=
 =?us-ascii?Q?Uowg++eXIDzVf/BZeJAcqj1JBL5y3FDArSWCMnljT9HmSzT7n3ye0ItvC7Aj?=
 =?us-ascii?Q?iV9JIs6J1hx6Z7qsfBLvfLByF/xcpxzH/xbYDazOM3/M66CmM17A8epXd+tF?=
 =?us-ascii?Q?dyQcBSWgJrzWjRB1mop+XKqhLkrDgAt1LIWxNazFmqe5vkzkMShr9UMvGahP?=
 =?us-ascii?Q?LlBr+nz4ziPwH2Cl7UpbQBUX8klPZeae6U7XFQK023jQbuLwVI0IDJ9SUl8B?=
 =?us-ascii?Q?sqqJyeUoVsWP3uKliXpPq7sgOOTZvDBmP1XKqqE/IWli9CBpZNNN0VF2G/Dr?=
 =?us-ascii?Q?+ek73dK/wE3VC0yshFRCWCteTGO5aZhsXDBISQpV6Nas+VmkEPv15R2n6SjQ?=
 =?us-ascii?Q?0nRWC44C6jWvou7wbFIowuvEpJl06Lhgw1Z0+Qp5?=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bb86fb-c172-47ef-2b4a-08dc684e1bc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 13:13:06.1940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YSgpGHXcQUJorkWmnswlEABG4U23+nMHGgcjCXx9Kh+yrvvLMQLnWJjvioCW9aEF5sCZMORkhwDh1Zsw3pqQTIbl9b1TRpOIO8eAMQ+M5kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5036
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable
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

Tested-by: Krzysztof Gibala <krzysztof.gibala@intel.com>

-----Original Message-----
From: Andi Shyti <andi.shyti@linux.intel.com> =

Sent: Friday, April 26, 2024 2:07 AM
To: intel-gfx <intel-gfx@lists.freedesktop.org>; dri-devel <dri-devel@lists=
.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>; Andi Shyti <andi.shyti@kernel.=
org>; Gnattu OC <gnattuoc@me.com>; Chris Wilson <chris.p.wilson@linux.intel=
.com>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Roper, Matthew D =
<matthew.d.roper@intel.com>; stable@vger.kernel.org
Subject: [PATCH] drm/i915/gt: Automate CCS Mode setting during engine resets

We missed setting the CCS mode during resume and engine resets.
Create a workaround to be added in the engine's workaround list.
This workaround sets the XEHP_CCS_MODE value at every reset.

The issue can be reproduced by running:

  $ clpeak --kernel-latency

Without resetting the CCS mode, we encounter a fence timeout:

  Fence expiration time out i915-0000:03:00.0:clpeak[2387]:2!

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10895
Fixes: 6db31251bb26 ("drm/i915/gt: Enable only one CCS for compute workload=
")
Reported-by: Gnattu OC <gnattuoc@me.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: <stable@vger.kernel.org> # v6.2+
---
Hi Gnattu,

thanks again for reporting this issue and for your prompt replies on the is=
sue. Would you give this patch a chance?

Andi

 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 6 +++---  drivers/gpu/drm/i9=
15/gt/intel_gt_ccs_mode.h | 2 +-  drivers/gpu/drm/i915/gt/intel_workarounds=
.c | 4 +++-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/=
i915/gt/intel_gt_ccs_mode.c
index 044219c5960a..99b71bb7da0a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -8,14 +8,14 @@
 #include "intel_gt_ccs_mode.h"
 #include "intel_gt_regs.h"
 =

-void intel_gt_apply_ccs_mode(struct intel_gt *gt)
+unsigned int intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
 	int cslice;
 	u32 mode =3D 0;
 	int first_ccs =3D __ffs(CCS_MASK(gt));
 =

 	if (!IS_DG2(gt->i915))
-		return;
+		return 0;
 =

 	/* Build the value for the fixed CCS load balancing */
 	for (cslice =3D 0; cslice < I915_MAX_CCS; cslice++) { @@ -35,5 +35,5 @@ v=
oid intel_gt_apply_ccs_mode(struct intel_gt *gt)
 						     XEHP_CCS_MODE_CSLICE_MASK);
 	}
 =

-	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, mode);
+	return mode;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h b/drivers/gpu/drm/=
i915/gt/intel_gt_ccs_mode.h
index 9e5549caeb26..55547f2ff426 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
@@ -8,6 +8,6 @@
 =

 struct intel_gt;
 =

-void intel_gt_apply_ccs_mode(struct intel_gt *gt);
+unsigned int intel_gt_apply_ccs_mode(struct intel_gt *gt);
 =

 #endif /* __INTEL_GT_CCS_MODE_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/=
i915/gt/intel_workarounds.c
index 68b6aa11bcf7..58693923bf6c 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2703,6 +2703,7 @@ add_render_compute_tuning_settings(struct intel_gt *g=
t,  static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i=
915_wa_list *wal)  {
 	struct intel_gt *gt =3D engine->gt;
+	u32 mode;
 =

 	if (!IS_DG2(gt->i915))
 		return;
@@ -2719,7 +2720,8 @@ static void ccs_engine_wa_mode(struct intel_engine_cs=
 *engine, struct i915_wa_li
 	 * After having disabled automatic load balancing we need to
 	 * assign all slices to a single CCS. We will call it CCS mode 1
 	 */
-	intel_gt_apply_ccs_mode(gt);
+	mode =3D intel_gt_apply_ccs_mode(gt);
+	wa_masked_en(wal, XEHP_CCS_MODE, mode);
 }
 =

 /*
--
2.43.0
---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu usta=
wy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w trans=
akcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

