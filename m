Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C9A575FD
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 00:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E33910E35F;
	Fri,  7 Mar 2025 23:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mluMMLjw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3E610E34B;
 Fri,  7 Mar 2025 23:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741389939; x=1772925939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2BIwp3gMCVkof40d+CcL67EhWx+053wNKc4QSzUP1z8=;
 b=mluMMLjwwOmGMTHFdRbpOvU0HCNbGHpjfOYlLTfDnNsfi12hC/SLs/Mj
 Q2iEt2ttxB8GKbZne4wOOGL+kOp/gJq9/DppDxOteyH0Rr3L5jOjIaqj4
 mFZEUpDkkdrQmd5mKn5ujAKsKJh+wXMc3C3qFgLGZmSSlowQpEKpDJe6S
 mC8CXdZeW68LYd5Ldno7FPHFqC8stIdy6M5QdeH0qFtWLrUYVHpHXa+Ql
 Kv1BGgEQuiq6xGSv6GN6XRwzl4qZBPLZ/NMepqalVavnh3OdHSp7Iy8UO
 An1QuiJohfn5q9i4z8GUIT5o1gvPkBhQnDrJTxsxwf6sVWGvJAL5giqXN w==;
X-CSE-ConnectionGUID: SUsFcMhtReedX+1EtoAX6Q==
X-CSE-MsgGUID: BtzqFKboRSanN9jHTgYQVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="46233701"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="46233701"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 15:25:39 -0800
X-CSE-ConnectionGUID: ESWkxjr0TjanNeTK7zVNhA==
X-CSE-MsgGUID: 72v5EymhT1GJYLoZPssAtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119387156"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2025 15:25:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Mar 2025 15:25:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 15:25:38 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 15:25:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/KF27gtoIzFGpMhrZ66fA38v6/UbkwjQZx5xqK4QaOm+V8PWmC8stKYJvBB91cjJyIueAKXRgq4LpUfxLQIlXmdygtdDhcJrQ7s8BSq9+TzPzMFyWgqp2MMbp+WMalQPPwc6QHo2hCWBvyivqqdK+9sN/0Jm2MgJUP6LCyuXIYRTf2YOhTnjE6sfoDXNEXDBGdaZsmyuxOQ/nJL5iCHDhEHWtY+NkOXfLrYXSatI07WT16gX75C4DpYtQgU/hYFr61AmAx8xK3qNLU2Gk4UxOPtyCYsmspzuS6mIi8wB1oNmuo49+L+nHPtq+SzYf8T9BPprk+/xj9oApMLoMqBQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJTab5uozLCi1OMN7GEU9mcO8u5PYzmqBkn/hLlzyaQ=;
 b=FZPi70wSpYi9dq08ezHmI2uYb+MgW5wl4X5FMS1m8D4fim/XQuWQvZZNvTnBnz8DvseNldelKETgsL0cRO4V7OBPcBBA0xkY8ttk3zdisgDvPbPrrNhQ4G5Ggf95UJFxrGRYNEXoA+BNRdbpgWxJeI50KC6bvYTti35QvzWcgH/38up3f6ckMIIYfTNEMRPDPMB5PLumGcfmUvQEVLCYnYFJns6kDV15KxGQDOt+E1pimFUGefh+EUaaHXKBQZud8V3Z7t1LwK8EVDQOYR2hcD4V7U6cD7mknubIvtR/y8+wpcH1sQfXwqBdUP8AEdSXWgRszS/NrYZz4j/kU44VVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5447.namprd11.prod.outlook.com (2603:10b6:208:315::17)
 by IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Fri, 7 Mar
 2025 23:25:36 +0000
Received: from BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::ad51:b35d:1aca:726e]) by BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::ad51:b35d:1aca:726e%6]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 23:25:36 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v6 0/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
Thread-Topic: [PATCH v6 0/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
Thread-Index: AQHbj7IUwhMs1LVI/UOd14jeRmVjC7NoT23g
Date: Fri, 7 Mar 2025 23:25:36 +0000
Message-ID: <BL1PR11MB5447C81DA54DC962C590BC26EAD52@BL1PR11MB5447.namprd11.prod.outlook.com>
References: <20250307224125.111430-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250307224125.111430-1-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5447:EE_|IA1PR11MB7271:EE_
x-ms-office365-filtering-correlation-id: b888c61c-7ac6-40a9-75e6-08dd5dcf5d5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/cL8Bh3bsQvBEf20sWUSbVmILwPspPQ62J6ax6qWqKAIEBgHF4PvqmJ5pawP?=
 =?us-ascii?Q?qKOucUUn+dEVXyZPj+BEUeSTue7ypm+1hFiylBJqJVdmTzdPWVS+AgqBZng2?=
 =?us-ascii?Q?ONcynpbMJKyrRATtlZRnXtSrbkDZm0EUMpBXm6hgthkfLyRC4vKARmirfyb4?=
 =?us-ascii?Q?v7MmnWUMUrR62QmmNbDEMQEuDyMSmXpk470mz5EQ6lsQMw4awG5w093xOA5W?=
 =?us-ascii?Q?teHOat/WwMkHUtHeKAd35fO8Aq5u/xjFGgGT6fuYpyU0BRRRItSzQ+orcXhf?=
 =?us-ascii?Q?mqjUTbDWDI94dxYfMQ0CiOACEiVqxiywvLiGC5+CWMl3hF3OWO8JliC07Mg7?=
 =?us-ascii?Q?NL4qWmZzk6fdh6WoQIucPMqrdLsUAtLVcRNVrQ5zUNcHSI3sxOwszpQlYe1N?=
 =?us-ascii?Q?nR61H07+sxhoyCHpJA8OcRfKYLQY+pIHLPsz5NubPpS8Nn9EYwPX34NoSl4k?=
 =?us-ascii?Q?YpPAeQiz554YMcD+nnlNukXdr73guHegUDlmUaiGsaRIm6AEdSf7LH2IZ/X5?=
 =?us-ascii?Q?xbCpZpXOiF7z/y+k/dTsHDyE1c2GmfU4a4HL10bD62QsLmuOK+iVGYrCnR/9?=
 =?us-ascii?Q?fClUCftVN0RFYYrBuuyO2F7fgx0LgmtcdDLPc5SQ2hpcxC2qTX00VUbDpF7c?=
 =?us-ascii?Q?DVaufKmFe+sJF0leMXODZS238vUKp1wHJ2vwwAUn5Vu0t4pdW4BH5PRqqX/m?=
 =?us-ascii?Q?l2xTyKVSdylgi8o4pQGf20ywMuP5xt+ntItPbfy5taJ3qm1bpO9ckeO+L7+e?=
 =?us-ascii?Q?BUy+pahst+eKpXLAKP+aNTfCW8O89krkWYlVsDBe6Cp2FUhyjHq0WVRWg11b?=
 =?us-ascii?Q?UHit7uGw+w52fDwzH1Y2vcAZjw8Lo8vGLJ1tKSbNs/JFmLXMhrpqVTzyHVtS?=
 =?us-ascii?Q?uzTSCQK0L9sBBPlTC5WyvV4vXrbQnYVw3iZ8SPTz4G+Yu16dz4EsCHlo2Uj8?=
 =?us-ascii?Q?3N2eGFWZkEUAQFhr3PnFT/aJpZPU7/gB9CdTIVXrDVDJOa7pqTeitwvohhcz?=
 =?us-ascii?Q?BdQrcQyMg4gwxqhQ173eZ3JYpRQgrBaLvhnqE1FuoHFF2CgdWzKzAEHPxV8K?=
 =?us-ascii?Q?+/hFThg/0bo9/Cuzeavwv8bP0BZOAhw9Vg10AxPwJ1aYpLkA0Jo0VpPWtqhT?=
 =?us-ascii?Q?FDBSDSh+qBtyApFVmBFoAA3k256D3Uai449HR6KhaRe3bqex9v3VCaey7uqT?=
 =?us-ascii?Q?yVhRdWHC28mP5Yo/qGNBwi8aC1N8YlbgdqPsiQYp7qwrobwM/K5d+vXJVbj3?=
 =?us-ascii?Q?f5B0GgKpn6K8TntAM9vTP3HnoHOycIU6VqUiRYk0RvONRheaIv/mpMyQ8+gb?=
 =?us-ascii?Q?YI7WqyRbbbAIQe5NVh2bx/dS1RaNZjeX0MN9taqr/fkWyycvdruwd/OhJsTG?=
 =?us-ascii?Q?vEuaRi2+7sfGhvz19Yyhzv+oV7Wmt2rpsrgc1gz+jezcuWFgLs7RnMrfAmX1?=
 =?us-ascii?Q?tBB5iHWfWpWLOpt4fAk6OA5t/WZsT9FM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5447.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q7Pjd63vX1RL2qM6X+DLTZYf198uZ887mf9WUs2EW4zVwWiRzFCmevvPoSCj?=
 =?us-ascii?Q?JNo6ubk2DazgW83K4XZZpFilCqsq7+2dkZmrNUnSiA4JSdH1Z2YvCf7N2xN5?=
 =?us-ascii?Q?bcfoFIlJN1C2/cpY3FRWJCdfykLvcq/w7p4Aphy8g/eWQfa1aeZK2/EtOe8P?=
 =?us-ascii?Q?1mL+HgJ4OLFrwFboYfkysNQyxts9IQrf9/SRtKGi1VLD2zbAHKiSWFKrlwM5?=
 =?us-ascii?Q?3A5Vx3hFjvg5GWI7K5utBR1qpuDshMyvqSZBg7747ThH2RCwO4FdC6oZ/mDO?=
 =?us-ascii?Q?rXyiz4c2OEe/D7+KnuKWKcy4zxwW6HTJIsh7J1br6/jlQh8HaLsRXoqzu13Y?=
 =?us-ascii?Q?nMPV5iuRpEfVY45AriPxTgsM2ZghfufwgrUJUaEoskanx8dH2uWKtlh9Nt5g?=
 =?us-ascii?Q?ROBoUGzPM+ngq65wnmv18wPOc89FlOHYZYNAJYUesD8ZOBsdoEkrLIKHhym1?=
 =?us-ascii?Q?R8Ae/44H9lGnl9hJMk6kcIa0IYc1SQRDHrjuqG6er1JZutQle+74KeMZIlDu?=
 =?us-ascii?Q?R6IJMDoX9/v3fS1HOQDHIro4EaObn0NatyaIKF8TAhqxayQtkpKvIkFm8MCs?=
 =?us-ascii?Q?F3T3/87+WIZn+1PGfO9O4Kqc1vNVSC7qxF7hhQMuZA+2jJTzRKDWyowfY2a6?=
 =?us-ascii?Q?aA08FAYn6HcoJX3IvwefNudPWvWEIbVD29Rj9TVyOZDE/qx/RSjYYr2XWGP6?=
 =?us-ascii?Q?EJlONPHjJ2akPjipw9m8Bxm3I9xY9xrLm7PCDfxY/w+ztknj7QDQyHNmuipM?=
 =?us-ascii?Q?cTyief3uRe08gnIWxdK3Zy8mpvnGXDYLNSGhSUG7sDPBgwNh01TnnSy+mjkI?=
 =?us-ascii?Q?ZRugg5tD8DYwiM1ZT5QvCeib+kUNcu8cElOtjE5eVXjpi+IQzjC0m5rDllxX?=
 =?us-ascii?Q?XpA8yYCkNlhsuHSUoePzagU+NtDt/qw+xCs9P4QX1C5WCpBRI36+83GP3Z3C?=
 =?us-ascii?Q?uO0LnM5zKBDvCqn9hWuoZTBcKsAuujM+Dtp2a7orjsufkb43ukyh0bFYIIPD?=
 =?us-ascii?Q?i+hGls0kg9coNEnJ8vuC44AkhkOUUtf/sI1uirpjQzX+wgKqNMgDgDztcS4Z?=
 =?us-ascii?Q?7YbnBSXWnfmWNbrgJKIGBowrG50X/5PeW/0kcplldn7nVaqR9FFM0boBvFAg?=
 =?us-ascii?Q?6h24hU/Bgky+lDYzOCzPyFiMI7nF6keZjuWSo9YH1tXW/tQL6g/U1pKEFZ61?=
 =?us-ascii?Q?6Di87PjgchJ/eUGu0RqvgYlt0Z3IzdAEQbKXMIC0bHNmvlAtg1MeLPFsRTKk?=
 =?us-ascii?Q?PRADMhPuC4N2Mkni4+Ljb5gAPKEsJ/krE6DbnLoNfXu4d/zKphz728OKtlbc?=
 =?us-ascii?Q?7+naKx7iibWQv398gBN2ApPZvTDQ5oEcD8bCW8m2M5Ln5VQbjrYPf4ULs6Md?=
 =?us-ascii?Q?NLgRfUjBUkMh4LpwVvRPKzG9P0wfTzUnfB7SlSPShHSwPUvjjUaF9QJGviH9?=
 =?us-ascii?Q?4H0SiAkKK2iO9rJ8WNtltU/BEXqC6YPEd8CZb1GQ3EJwpyMFZnV4IIiS1U53?=
 =?us-ascii?Q?IrlMo89lKKhjIvBmmvotg75n1jDroNfVodB4NfUJY5meXjyfd/HLdbg4XKSq?=
 =?us-ascii?Q?4aOQB9iC17Ff570baFN4bqSx+6i95YPqJC6Hbyxt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b888c61c-7ac6-40a9-75e6-08dd5dcf5d5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 23:25:36.2356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L9gwUJ3Z+x1LS+5JsiGasNLtZibw/VliK/DMceg9RoWFOWZANXIqpnx53Jdj4rWNp5QJLNeM1BuQaZVjCuR9MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
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

One generic question, do we have test case to verify whether the function i=
s working correctly? Thanks.
I think we could have IGT test case to trigger the fault, then have another=
 IGT test case to query it with this new uapi.
And make sure we could get the expected data with the new uapi.

Shuicheng=20

On Fri, Mar 7, 2025 2:41 PM Cavitt, Jonathan wrote
> Add additional information to each VM so they can report up to the first
> 50 seen pagefaults.  Only failed pagefaults are saved this way, as succes=
sful
> pagefaults should recover and not need to be reported to userspace.
>=20
> Additionally, add a new ioctl - xe_vm_get_faults_ioctl - that allows the =
user to
> query these pagefaults
>=20
> v2: (Matt Brost)
> - Break full ban list request into a separate property.
> - Reformat drm_xe_vm_get_property struct.
> - Remove need for drm_xe_faults helper struct.
> - Separate data pointer and scalar return value in ioctl.
> - Get address type on pagefault report and save it to the pagefault.
> - Correctly reject writes to read-only VMAs.
> - Miscellaneous formatting fixes.
>=20
> v3: (Matt Brost)
> - Only allow querying of failed pagefaults
>=20
> v4:
> - Remove unnecessary size parameter from helper function, as it
>   is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>   purposes.  Total memory usage is reported separately.
>=20
> v5:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
>=20
> v6:
> - Free vm after use (Shuicheng)
> - Compress pf copy logic (Shuicheng)
> - Update fault_unsuccessful before storing (Shuicheng)
> - Fix old struct name in comments (Shuicheng)
> - Keep first 50 pagefaults instead of last 50 (Jianxun)
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
>=20
> Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
> Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> CC: Zhang Jianxun <jianxun.zhang@intel.com>
> CC: Shuicheng Lin <shuicheng.lin@intel.com>
>=20
> Jonathan Cavitt (6):
>   drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
>   drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
>   drm/xe/xe_vm: Add per VM pagefault info
>   drm/xe/uapi: Define drm_xe_vm_get_faults
>   drm/xe/xe_gt_pagefault: Add address_type field to pagefaults
>   drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
>=20
>  drivers/gpu/drm/xe/xe_device.c       |   3 +
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  64 +++++++-------
> drivers/gpu/drm/xe/xe_gt_pagefault.h |  29 +++++++
>  drivers/gpu/drm/xe/xe_vm.c           | 120 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h           |   8 ++
>  drivers/gpu/drm/xe/xe_vm_types.h     |  20 +++++
>  include/uapi/drm/xe_drm.h            |  49 +++++++++++
>  7 files changed, 260 insertions(+), 33 deletions(-)
>=20
> --
> 2.43.0

