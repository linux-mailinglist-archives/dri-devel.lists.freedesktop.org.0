Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3470A359CD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 10:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D233D10EC0E;
	Fri, 14 Feb 2025 09:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qa3Jff8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C18410EC0E;
 Fri, 14 Feb 2025 09:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739524236; x=1771060236;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=1SlGUkKL6YYLjEM61lIY5klvhOLgkuTQLgkSxv3sVQk=;
 b=Qa3Jff8KCmHbHutL3uQOA3N6lD5f2zifQo9F/dEMLYdQolNChlr29Gp3
 bR0p2x6El1ZbGRTF0enbUgEzmOAqPgLOYq3l78tLATSWHlZWeQHh7fS32
 WrrjPMqAugfULXK92D0dLfSaQq2yOshqW0DfQ6oz4lQTc7Lnt/m0MQg6E
 g4IYeTD4dVaOv2Hpr76wsLEO+4EIias/qUfyJSzNj8N4K12vXpyL6GEb3
 9abZ/JouBAgUtJToXfabLEmD91KWxLdQrE0DqSM+U/GaA0yqET0eGAwDs
 uFNLVyN3mYHju9URgIt+/m6OnThdOJyUOyKciNqbRGAMATsB7NY5zCv4E Q==;
X-CSE-ConnectionGUID: VtusBwj0QLO/tXWg8jU6Tg==
X-CSE-MsgGUID: srB7pv3BRBmQzimM5qFrWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51666048"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208,217";a="51666048"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:10:36 -0800
X-CSE-ConnectionGUID: PhBr4TxFQ228FFjgmgaNQA==
X-CSE-MsgGUID: Lv19sjzBR/+SNm4CX4OmGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
 d="scan'208,217";a="114048801"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:10:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 01:10:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 01:10:34 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 01:10:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVc46Avn/+5aQe+z/yBYjONwxp1lDK2/fnQitipnf1+6sZdXlAE77IsBMLX7iesMIqPPkEULyAafWY6p7rhgZr3EuwuSWBOWkcztU/SGgapaZuFrcjuQUivRd9RsIVMWC1z2jCNbXwc35EyHNJAGMNESH3duOQ4nVlv+Q7fw9l/fueudDAVLTQjrnBOW4v3t60YcwBHX75hB67knneIBzWB6GAWxMQB+rXOGF5x/4bEPWWmLst0Ge1951FP11sTUapj5Wvne9IHk4qu03d4SeR0ZuagerqFtMxd4PhO55C/B5uGkJcJQQM9QUrNJiaBKS6whj5Imbr2CBiDyIgUFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qX/BkPFvwjsVntTZV47Q/0Bxk3ODMwTn/5BS1vy9egU=;
 b=u6dbBOD+JucUrRcIaXaVxLtyM+dByoAIR7zEviAETLnDSL+z3xUpHyTDlJu2PMN3COQVtzjVp2NpGwd/PNl5EQKeFZQGAUKCKN+4OUxd1nEO6eyoO0UXkzTjVOsCXWXVfnM1aVAJnTMcJSRvMFFsqXV+zVWHQt4UdRqT4bfN+ATwKn+/nL7XYtqXo6kJn7wz1DXsLHpXUlpsGIQRGEkIgB5fP2KEAFi4k4jmecRE6wJMpcu4bKHYLrpbxuVPmIzpZ7t3gRJ2EU4CpP62JSE9U83n/6QYmHgWoS8L9ZhO6il5jshUES/vPB61waqzPmQI94ytghug3gokcSRoA/3Rug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW4PR11MB7079.namprd11.prod.outlook.com (2603:10b6:303:22b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Fri, 14 Feb
 2025 09:10:30 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 09:10:29 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Intel-xe
 <intel-xe-bounces@lists.freedesktop.org>
CC: "apopple@nvidia.com" <apopple@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "felix.kuehling@amd.com" <felix.kuehling@amd.com>, "dakr@kernel.org"
 <dakr@kernel.org>
Subject: Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation
Thread-Topic: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation
Thread-Index: AQHbfbx0tm29quczTU6iC1uqisINKrNFv3gAgAC/JICAAAVlMYAAANFC
Date: Fri, 14 Feb 2025 09:10:29 +0000
Message-ID: <MW4PR11MB7056301F097E108403C98C38B3FE2@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <Z65ix566lLCPOsob@itl-email>
 <433228556ac6ad42b21c942dc6c070069107660e.camel@linux.intel.com>
 <MW4PR11MB70561D782F6A83E6B4A63BE5B3FE2@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB70561D782F6A83E6B4A63BE5B3FE2@MW4PR11MB7056.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|MW4PR11MB7079:EE_
x-ms-office365-filtering-correlation-id: 64279443-b726-4dbb-9f11-08dd4cd76dbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|8096899003|38070700018|7053199007;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?WNhyoAyemeiI066UtB3/0tdXKDN7TjNnW7MSnbWV50un1gO5dlJOiNOFrO?=
 =?iso-8859-1?Q?nARjEqeTzTLZrnfjlGYGugOt8KMK53y8zyW6zjnrQ/+GgaOVM1E/DS86WA?=
 =?iso-8859-1?Q?0wfUr+JnmxqoW4j6oDzmTOVXLpq294D+mge8yGdyCwhtvkDbeEptl8votk?=
 =?iso-8859-1?Q?T/sOV4v+z9OS0hYsT4aJwqbJL19K8Wnx63DmNg9JVLBbYIwFHOOCNtPk3S?=
 =?iso-8859-1?Q?I4TvCVdQoaR00WRn6TTSettsZVVuuTiwO1TTcXcXFkbrf/GGCOMR32MCjq?=
 =?iso-8859-1?Q?NafFBFmTex4LuhetfDRz7eNy0i7IXY3do2fzyqed3KE4Jv0zsutzMKZvfc?=
 =?iso-8859-1?Q?w6NYeY2nlHmFI08Cubl4XauAwaHAgFhgjj9WIGFghEM/Ycm3e0qkDyoFwn?=
 =?iso-8859-1?Q?tTAu7vAL0onmBbSZSb6m3p/MB5RojZEvM1nunJ5X/w6WtDbnOyiULtW7LZ?=
 =?iso-8859-1?Q?APrYgV/ldK+YaZsYTehMqHHXjSV+xRZ0wqmQ1+CdlfwQWEqREdY+zIrVNP?=
 =?iso-8859-1?Q?lQhjCmqOFgoOMpnudaB9xS25wa3CDQkNgeg11zcUrcittS64metlOyB+TH?=
 =?iso-8859-1?Q?YYzaTdS7teBruMkJxvInKzsyLn0z4vqZ8Wjjtr/zxWieRwL0/TMotBtalD?=
 =?iso-8859-1?Q?xOjMrdLmb8zFrO7X7f0YvbhNGuoRjBRknw8PwJRG433kzwWzX5vZbFaZmQ?=
 =?iso-8859-1?Q?CHb12FxIhf0K/XiJ7itPKdeHvmbVpz0RL73RPN/95hyholu7XOLNxLjzSO?=
 =?iso-8859-1?Q?oq4iNW9UGf4jHA4duc5wjEpUArcapS30mZbNKigy1Lz+tJLyYkjLTYNcqv?=
 =?iso-8859-1?Q?8wZdKmmQAT7j2u/uEw8irtKGFaNXT4l9FIlZL2r0SVpEKFQWYNogXVVu7C?=
 =?iso-8859-1?Q?vVJ97VoCYN38rjBzKjksehfALWd80MBFrUHUJ9e1t7+JaRmnNHyl3uCpNm?=
 =?iso-8859-1?Q?WXDIFasAqSpf+8DKFMMSXkcWQ9pLMbN9+pqZ22n7BqrvtpdbgZr275Zryd?=
 =?iso-8859-1?Q?BdI3WkiaYRAYBYFyViCCrkjHMiP0yyx3ZVu3DJ+5ZoqkuZoNDh+6DU7XEc?=
 =?iso-8859-1?Q?XDr2qr17N9/wi3BDPMg/anV2IX/P78TXlcZ+frDd9ydmOZvSZFquMoy0F1?=
 =?iso-8859-1?Q?eRpXCL3Zg3F57vL3FwX3tBdqhyH3avJjHcfTZ3LVGhF0hcJ/NlpV7zdO9k?=
 =?iso-8859-1?Q?hEsbto/2koDIsAAfEVfR8KOa+reUbnYO1gLCNk4zOeEK3TGCLL/yDANoMy?=
 =?iso-8859-1?Q?3FSkzmFeZEc9JHSUey1we8tpml1kcfPP/bx8CfBF18R0gBU5YOTfH0t3VI?=
 =?iso-8859-1?Q?oBFRkOd7t36/yEXojS+rP0NCQek3uvMo4ED1rXE8KSl5n8Guqf1J4JNrZ9?=
 =?iso-8859-1?Q?rv4g+fGZvuUkmO9UOhxX/YepjAa/1QNWTG2HQ3RlcXdy+J1p4JF/Vj5OJ5?=
 =?iso-8859-1?Q?48oAqKPkvp7+88eaS+zsJ7ZLmNcZyzKS06sRqbP7gIKHwTPOUQtlkSSUQD?=
 =?iso-8859-1?Q?/sRZ+Y4FcO2B8/J++AYZVI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(8096899003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VpU/5A/iQFcMkFcJbHeCDbEuvA+CsRwg4zA2WyUS4B0DmGS38LxATAGrgT?=
 =?iso-8859-1?Q?e6dWzMcV5Lm5SdPiHJcijFEhw06RNPxKDVZPqWoC2JKAqLS8GNBBFX5aXL?=
 =?iso-8859-1?Q?vLsddc3X/+Abetpkks45Bcr3J7rbQzRgX7ORq5BbSkQGFYk3jGK/G/kh1b?=
 =?iso-8859-1?Q?9R3zKe0B6TfPI7UD1CDc2J7HJOhQarWJ7t3WLLfJOdAtXWnhMrtsuGslUL?=
 =?iso-8859-1?Q?nu9vs5xdEshBQ9B44cV68CZzGYJtS9t+6vboebg2GsBL3NDi9StTJyDOyC?=
 =?iso-8859-1?Q?eaCiBrmyL/LdED42wzJGBDmOVU+QE/CpasP60tQCNfqQMh9+LqfBIvUjwz?=
 =?iso-8859-1?Q?xe5QKI4a2n9eR+MoyQXfO8W/3alEOLGRnxy3FVJMnzuGyAWSWf3Uuf8gzw?=
 =?iso-8859-1?Q?XXp5b/y/vGiEFNabV6uQBQ5QcWvJjVwmfPYQ9ElYCcyMGMk2CWJshzrlsn?=
 =?iso-8859-1?Q?tUaQFgSygBJ4sY0wmRmk2u/DsREHoWRTwvveve55i+LkcGhm2zYKuFozA0?=
 =?iso-8859-1?Q?Tlx3POdshZ2//7VoRY2TdRgezuQQJUg4x9XaMxw47J7JN+Km9qcU+YBX40?=
 =?iso-8859-1?Q?7qe5sJqTB/s2dh8KJP6PvxkSrBl7uD06daiHJQWyAlGUWaKFmns+2Z3gHw?=
 =?iso-8859-1?Q?4kK7pYCvbzFYa0AgUwVQGtSWi6zYM0gI8pPCPZ7VFsJEj+MQrGG8PEKYfM?=
 =?iso-8859-1?Q?NqdmjxfRRspBlbdUtVesxL4vOWhjG/EYyyzYu07r2m/OVjcqIm4zRHVVXu?=
 =?iso-8859-1?Q?fNylyaTadheKZ0iHowWIR3rog3UPk2KXqzWtkAKNYBV1yQvc599bHOxyo7?=
 =?iso-8859-1?Q?Npb39wUUoK2q0cKO0GxLeY/5SuCnpwBN748ztHxnXmgdVNKCEUTtKC3dbQ?=
 =?iso-8859-1?Q?SOL7XDEzmFxf3ogk2khOgpuW4rfs0ALRQ2ueH5GZglVF0EG97jVUj+F0nW?=
 =?iso-8859-1?Q?kGnlfglIx3iqnffGQAPIiSLs3DgpI615IWhNGK8b/0mPivCp349C7x8qol?=
 =?iso-8859-1?Q?k7cevNhkoqQ/paDYKM97RDRY49fxLEdPkJh87GFnxwa0QelmcuOic34CLS?=
 =?iso-8859-1?Q?8qFQphcmQpwkdxgk0504mvpLVZ9ZG9HkSgFun7TTd5rbzqHZzzPTizMLDo?=
 =?iso-8859-1?Q?9yvgJJjTa1DSJlvCFWnLuawiGcOlbA8ONU745rdN5Bar6Y6OJJ5q0eULsX?=
 =?iso-8859-1?Q?gZTEYHUK87HbzUzJeYAEm4p1aFARNp0T8gqiv+PJHDxIm1ebyMQRMZjXzs?=
 =?iso-8859-1?Q?5XsHpDkkQlYPTFWfDz3TPZEg/ki0HIXJqzKDFyFI8tkVolexmy283Ej5WL?=
 =?iso-8859-1?Q?PvCLXv+nqpYoWk5a87cgnkdhFC5VY4NIav+gmmn1fm+NBpjQvucOyMpBx/?=
 =?iso-8859-1?Q?BDEeFh/BKa1gfXXJF51H6blmqSA3392cncVYtDb9Qi5lLy4YE52aC5Z1SB?=
 =?iso-8859-1?Q?c66ZVCiT5cHDMrWaPs4eUhJhTbqD0X7PNF1T6h/fLggquupH746QYO/WaN?=
 =?iso-8859-1?Q?B88OMsxppSTTsp3pupzbr4g8+U++gqwhBx1gRwFhq63T256fojP3TqMd77?=
 =?iso-8859-1?Q?l56n1vDWH0MC4v+z3z5I7kd2YYyMDyZl7/mg0/TWDjO+5dZgAXOBMyS57d?=
 =?iso-8859-1?Q?H0MwVd3q4pvW+s5wyMd8Fzv1vGYLYCV1z07k0MyO8hcpl0m3J12S1mZGas?=
 =?iso-8859-1?Q?YksLJcdUufRzXa6jQRc=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR11MB7056301F097E108403C98C38B3FE2MW4PR11MB7056namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64279443-b726-4dbb-9f11-08dd4cd76dbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 09:10:29.9309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F4bYIUKllbf+3xlYJtk0Wia9U0oS7AQZ8UN2/WLOGrh+mzvlko1ZNlxzfIX3Ce11QhsEbceA0jxOS0BCU5Y1jw7rgvh15WkU3kSd0SXI5tM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7079
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

--_000_MW4PR11MB7056301F097E108403C98C38B3FE2MW4PR11MB7056namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> on behalf of Ghimir=
ay, Himal Prasad <himal.prasad.ghimiray@intel.com>
Sent: Friday, February 14, 2025 2:38:10 pm
To: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>; Demi Marie Obeno=
ur <demi@invisiblethingslab.com>; Brost, Matthew <matthew.brost@intel.com>;=
 intel-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>; dri-devel=
@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Cc: apopple@nvidia.com <apopple@nvidia.com>; airlied@gmail.com <airlied@gma=
il.com>; simona.vetter@ffwll.ch <simona.vetter@ffwll.ch>; felix.kuehling@am=
d.com <felix.kuehling@amd.com>; dakr@kernel.org <dakr@kernel.org>
Subject: Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation

k,
asx.ddk

please ignore
________________________________
From: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
Sent: Friday, February 14, 2025 2:17:13 PM
To: Demi Marie Obenour <demi@invisiblethingslab.com>; Brost, Matthew <matth=
ew.brost@intel.com>; intel-xe@lists.freedesktop.org <intel-xe@lists.freedes=
ktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org=
>
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; apopple@nvidi=
a.com <apopple@nvidia.com>; airlied@gmail.com <airlied@gmail.com>; simona.v=
etter@ffwll.ch <simona.vetter@ffwll.ch>; felix.kuehling@amd.com <felix.kueh=
ling@amd.com>; dakr@kernel.org <dakr@kernel.org>
Subject: Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation

Hi

On Thu, 2025-02-13 at 16:23 -0500, Demi Marie Obenour wrote:
> On Wed, Feb 12, 2025 at 06:10:40PM -0800, Matthew Brost wrote:
> > Version 5 of GPU SVM. Thanks to everyone (especially Sima, Thomas,
> > Alistair, Himal) for their numerous reviews on revision 1, 2, 3
> > and for
> > helping to address many design issues.
> >
> > This version has been tested with IGT [1] on PVC, BMG, and LNL.
> > Also
> > tested with level0 (UMD) PR [2].
>
> What is the plan to deal with not being able to preempt while a page
> fault is pending?  This seems like an easy DoS vector.  My
> understanding
> is that SVM is mostly used by compute workloads on headless systems.
> Recent AMD client GPUs don't support SVM, so programs that want to
> run
> on client systems should not require SVM if they wish to be portable.
>
> Given the potential for abuse, I think it would be best to require
> explicit administrator opt-in to enable SVM, along with possibly
> having
> a timeout to resolve a page fault (after which the context is
> killed).
> Since I expect most uses of SVM to be in the datacenter space (for
> the
> reasons mentioned above), I don't believe this will be a major
> limitation in practice.  Programs that wish to run on client systems
> already need to use explicit memory transfer or pinned userptr, and
> administrators of compute clusters should be willing to enable this
> feature because only one workload will be using a GPU at a time.

While not directly having addressed the potential DoS issue you
mention, there is an associated deadlock possibility that may happen
due to not being able to preempt a pending pagefault. That is if a dma-
fence job is requiring the same resources held up by the pending page-
fault, and then the pagefault servicing is dependent on that dma-fence
to be signaled in one way or another.

That deadlock is handled by only allowing either page-faulting jobs or
dma-fence jobs on a resource (hw engine or hw engine group) that can be
used by both at a time, blocking synchronously in the exec IOCTL until
the resource is available for the job type. That means LR jobs waits
for all dma-fence jobs to complete, and dma-fence jobs wait for all LR
jobs to preempt. So a dma-fence job wait could easily mean "wait for
all outstanding pagefaults to be serviced".

Whether, on the other hand, that is a real DoS we need to care about,
is probably a topic for debate. The directions we've had so far are
that it's not. Nothing is held up indefinitely, what's held up can be
Ctrl-C'd by the user and core mm memory management is not blocked since
mmu_notifiers can execute to completion and shrinkers / eviction can
execute while a page-fault is pending.

Thanks,
Thomas



--_000_MW4PR11MB7056301F097E108403C98C38B3FE2MW4PR11MB7056namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div><br>
</div>
<div dir=3D"auto" id=3D"mail-editor-reference-message-container"><br>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"divRplyFwdMsg" style=3D"font-size: 11pt;"><strong>From:</strong>=
 Intel-xe &lt;intel-xe-bounces@lists.freedesktop.org&gt; on behalf of Ghimi=
ray, Himal Prasad &lt;himal.prasad.ghimiray@intel.com&gt;<br>
<strong>Sent:</strong> Friday, February 14, 2025 2:38:10 pm<br>
<strong>To:</strong> Thomas Hellstr=F6m &lt;thomas.hellstrom@linux.intel.co=
m&gt;; Demi Marie Obenour &lt;demi@invisiblethingslab.com&gt;; Brost, Matth=
ew &lt;matthew.brost@intel.com&gt;; intel-xe@lists.freedesktop.org &lt;inte=
l-xe@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org
 &lt;dri-devel@lists.freedesktop.org&gt;<br>
<strong>Cc:</strong> apopple@nvidia.com &lt;apopple@nvidia.com&gt;; airlied=
@gmail.com &lt;airlied@gmail.com&gt;; simona.vetter@ffwll.ch &lt;simona.vet=
ter@ffwll.ch&gt;; felix.kuehling@amd.com &lt;felix.kuehling@amd.com&gt;; da=
kr@kernel.org &lt;dakr@kernel.org&gt;<br>
<strong>Subject:</strong> Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM=
 implementation<br>
</div>
<br>
<div dir=3D"auto">k,</div>
<div dir=3D"auto">asx.ddk</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">please ignore</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> Thomas Hellstr=
=F6m &lt;thomas.hellstrom@linux.intel.com&gt;<br>
<b>Sent:</b> Friday, February 14, 2025 2:17:13 PM<br>
<b>To:</b> Demi Marie Obenour &lt;demi@invisiblethingslab.com&gt;; Brost, M=
atthew &lt;matthew.brost@intel.com&gt;; intel-xe@lists.freedesktop.org &lt;=
intel-xe@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org &lt;dri=
-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Ghimiray, Himal Prasad &lt;himal.prasad.ghimiray@intel.com&gt;; =
apopple@nvidia.com &lt;apopple@nvidia.com&gt;; airlied@gmail.com &lt;airlie=
d@gmail.com&gt;; simona.vetter@ffwll.ch &lt;simona.vetter@ffwll.ch&gt;; fel=
ix.kuehling@amd.com &lt;felix.kuehling@amd.com&gt;; dakr@kernel.org
 &lt;dakr@kernel.org&gt;<br>
<b>Subject:</b> Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implement=
ation</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hi<br>
<br>
On Thu, 2025-02-13 at 16:23 -0500, Demi Marie Obenour wrote:<br>
&gt; On Wed, Feb 12, 2025 at 06:10:40PM -0800, Matthew Brost wrote:<br>
&gt; &gt; Version 5 of GPU SVM. Thanks to everyone (especially Sima, Thomas=
,<br>
&gt; &gt; Alistair, Himal) for their numerous reviews on revision 1, 2, 3&n=
bsp;<br>
&gt; &gt; and for<br>
&gt; &gt; helping to address many design issues.<br>
&gt; &gt; <br>
&gt; &gt; This version has been tested with IGT [1] on PVC, BMG, and LNL.<b=
r>
&gt; &gt; Also<br>
&gt; &gt; tested with level0 (UMD) PR [2].<br>
&gt; <br>
&gt; What is the plan to deal with not being able to preempt while a page<b=
r>
&gt; fault is pending?&nbsp; This seems like an easy DoS vector.&nbsp; My<b=
r>
&gt; understanding<br>
&gt; is that SVM is mostly used by compute workloads on headless systems.<b=
r>
&gt; Recent AMD client GPUs don't support SVM, so programs that want to<br>
&gt; run<br>
&gt; on client systems should not require SVM if they wish to be portable.<=
br>
&gt; <br>
&gt; Given the potential for abuse, I think it would be best to require<br>
&gt; explicit administrator opt-in to enable SVM, along with possibly<br>
&gt; having<br>
&gt; a timeout to resolve a page fault (after which the context is<br>
&gt; killed).<br>
&gt; Since I expect most uses of SVM to be in the datacenter space (for<br>
&gt; the<br>
&gt; reasons mentioned above), I don't believe this will be a major<br>
&gt; limitation in practice.&nbsp; Programs that wish to run on client syst=
ems<br>
&gt; already need to use explicit memory transfer or pinned userptr, and<br=
>
&gt; administrators of compute clusters should be willing to enable this<br=
>
&gt; feature because only one workload will be using a GPU at a time.<br>
<br>
While not directly having addressed the potential DoS issue you<br>
mention, there is an associated deadlock possibility that may happen<br>
due to not being able to preempt a pending pagefault. That is if a dma-<br>
fence job is requiring the same resources held up by the pending page-<br>
fault, and then the pagefault servicing is dependent on that dma-fence<br>
to be signaled in one way or another.<br>
<br>
That deadlock is handled by only allowing either page-faulting jobs or<br>
dma-fence jobs on a resource (hw engine or hw engine group) that can be<br>
used by both at a time, blocking synchronously in the exec IOCTL until<br>
the resource is available for the job type. That means LR jobs waits<br>
for all dma-fence jobs to complete, and dma-fence jobs wait for all LR<br>
jobs to preempt. So a dma-fence job wait could easily mean &quot;wait for<b=
r>
all outstanding pagefaults to be serviced&quot;.<br>
<br>
Whether, on the other hand, that is a real DoS we need to care about,<br>
is probably a topic for debate. The directions we've had so far are<br>
that it's not. Nothing is held up indefinitely, what's held up can be<br>
Ctrl-C'd by the user and core mm memory management is not blocked since<br>
mmu_notifiers can execute to completion and shrinkers / eviction can<br>
execute while a page-fault is pending.<br>
<br>
Thanks,<br>
Thomas<br>
<br>
</div>
</span></font></div>
<br>
</div>
</body>
</html>

--_000_MW4PR11MB7056301F097E108403C98C38B3FE2MW4PR11MB7056namp_--
