Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B65A8C7A35
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 18:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5674210E275;
	Thu, 16 May 2024 16:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nl5pcwbS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E7210E275;
 Thu, 16 May 2024 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715876540; x=1747412540;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IsMIEOlVjcW2RyZSZLu3VUrvZCrIQrCFcqgfqvL9Rk4=;
 b=nl5pcwbSuW6CcjdogE3esuKeGCpeXesEt122HHXU0+YA0K/LtwPuycWU
 uNpSmJoLWCMPxW7y1M+a9k9t46rQfZnYunKC/ZIC9BffWtfVyAQAMhDHL
 IDPpjp/f33bDOhY8B4x7JeTmknFcrkjb7OugKL8nCGKbdVyTMi5cUaEXO
 nUbGhMT4MSnCDMP9d8z2nL6K521ooIaW+lY4Td3IWwAOJeEgCKlN5/FMc
 yaKqK8yODnNc5z6xS5fJV2Pyu8HwyiG0/1zRvzMYVQkyFJli1H5YPE04R
 6HqU20CKIiSBOt3Pyjrr4T1kPRIu+i906pP2xhvuUPIfePhhXhv/akv+Z w==;
X-CSE-ConnectionGUID: djRUzThmQdWXfdmJBiOvAg==
X-CSE-MsgGUID: movGy6LwQwK0LgXnrFM34Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11843190"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="11843190"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 09:22:20 -0700
X-CSE-ConnectionGUID: W9GDa93yR+GjlG/nQBrcBg==
X-CSE-MsgGUID: CAzjm0dbTvy/QdIAvSERow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="31486475"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 09:22:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 09:22:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 16 May 2024 09:22:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 09:22:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 09:22:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXXh42AULt7DvoX0FJpBVDZlKOgq9OZllawmgD4ns6O+rccfuWfV5mSb3XPvIQqbczwqJPJnmqo9lQxyCJA4r1QZrHvnVW6e90TnMPWWbceym922pzJZvCBBI6tdWdzXio9DNzYVrPPZTgLe0E5frHIhqVioCLSLajEsOFWQg7SNwo2lzYhLlS716rN56nnpuP+hxQ7H75pimVjkv12vZpBsUPt1zizKK+vUTyR06wbjaLp5IrKqEd2zccL621t4NJt1D5P0b5C6pzNe7kivmLuWTNDBjtSVnrbY1BxaDNJ6hlV1Ln5h7U946bnY19keyZhekLTSly3tb6dsUp+m1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbjxdiMMUUPVwy9lWFsZOQT1Cd/0UNAvsYQuK4gUigk=;
 b=gs04VYci64+kKeVRoJxwlAbcZ/FeZqp0BoPkOt6dpA/5u4NMmo37LijENkJME23aUASjJshIFfzDQgFVeSnZJ8PWKpuh1LuchAN73Z2binMJxYGwfYHU7joZIgcxp5iNO5SLyANUXj70/sVb4aZzNH0thCZElMlHQrmAGIxps8FEdXIHbJXBtDSCwu+Xgv6NGrG7gX7u3l85IzD+FnivH5Av+ZLDSPTrigAMuQ5/QA6zXZFktyoK6CVEwyXJ81WiD+H1LKsLJqTOOt68gd+9zfmKB2rLrfle+N/dvRbnTuxu9ZmXs2uALK4UzNDKmcjLdyzUqMMJJ+PWFclhZf1K8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB6330.namprd11.prod.outlook.com (2603:10b6:510:1fe::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 16:22:17 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 16:22:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Andi
 Shyti" <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
Subject: RE: [PATCH] drm/i915/selftests: Set always_coherent to false when
 reading from CPU
Thread-Topic: [PATCH] drm/i915/selftests: Set always_coherent to false when
 reading from CPU
Thread-Index: AQHap6XFVoJZpiZNUEaExt89zN+GS7GaCuMQ
Date: Thu, 16 May 2024 16:22:17 +0000
Message-ID: <CH0PR11MB544495E38A7AA156209E0B07E5ED2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240516151403.2875-1-nirmoy.das@intel.com>
In-Reply-To: <20240516151403.2875-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB6330:EE_
x-ms-office365-filtering-correlation-id: b7dafb55-94d4-432d-1e0d-08dc75c45a8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?TDl6b5DbPbDS5lYnSiFQWudEjtYkrQAkgfVJjHh3NEjD8Uiz9o4vYuUsR3TZ?=
 =?us-ascii?Q?au+pADP3MnSSaBpsFJh93zcSBoky1NpBSIQYmLWrRj6eZnvmxqIg51RoLSgZ?=
 =?us-ascii?Q?e4rMvTZa3fM/YI+B0t1HHoTUp4n0TOc0ufLXrFs1D63oQKIoVXsrB/Y4C70z?=
 =?us-ascii?Q?krqjKliHmjy0XG9llxbr+N1sR9HkyFoUgy2oQ3fAATO3n1+s/X6ACvAoONqT?=
 =?us-ascii?Q?nbOZbS6C4vpy9mViVmdUb53Vj9dySD+lBXpkwkD4uKMPHY6eRAV/KYF9VcmZ?=
 =?us-ascii?Q?L2INz7eCfkoKsBIn7OeFFXd4D4Ee5afEl9npGxu2ZVFR9OPUlp+Iqpj+5yvv?=
 =?us-ascii?Q?oFtJIePpfHheU1vy7NPYbGui8S4S9VXwI702LMObroBl1xODfTb5VR39qQLZ?=
 =?us-ascii?Q?Lg2j4lJC6wIZzJKtCseBb/bX6dNJJFULWWrwc5WfPSl0SCz8skUZB3eSSggb?=
 =?us-ascii?Q?USsAQlmVHymcnIwXfhJXIoTmM6alLwHUSokigeN1GFqgeu9Q6qq0FPiQNZd5?=
 =?us-ascii?Q?uTOpurTYXbnlAlfl21ut5C2SRrLYb/M7vNcIHs2PvjBIAv9sOJMeGSYj0m/d?=
 =?us-ascii?Q?SpsSyhI7N2HrPv2q6fYTp8Bt5wRxJ1GvIKVetb5p/7xrbm/1fOQeWbBByCFP?=
 =?us-ascii?Q?cgzr4km8OU/Kexv8znLQ6JXR6W1/BhZOO9kPU8mp50aVQq73IrzOUi9Xse82?=
 =?us-ascii?Q?66WW1aseeR4ESWyRUXRFiL0Okw3RuaNfZn10tihRPnwvj+BIrIvC5D2mTVro?=
 =?us-ascii?Q?GeEXzaY71p8NNRCdZv+01HBuI/BJWl7F/6xFH26OrzTGO50rUGhPisncX8ES?=
 =?us-ascii?Q?g7BsgcKDYf22SoD7Zd6aoPedtzhZu2BI+sQsUjf8+Qh8sIuFo83GkJrsBJzR?=
 =?us-ascii?Q?zD+dA6X8mcqRaPO45bEeGnC3SOxgDacl/de10hpRb4P6D8kDrBZMgXFoV9MV?=
 =?us-ascii?Q?WAGHsKeemTjU3r7DAjX09zc+5dmFusEzdMeGrUVLDHBZP5nelr52ySnyxlFU?=
 =?us-ascii?Q?flyIzjjbxR/d8NWUDuN7KbVKB583KRM4UGjpyIpbTp9CaS0Djg6mhkNS511j?=
 =?us-ascii?Q?nvcUmu3Ni6PHnGeruUVOcC8M2QeAXiaYV4KQTBbhgSV7DhFWkru7iAVll0M0?=
 =?us-ascii?Q?raCDEkTDxZOm+eQYsybU1m/Quln5dPIGITaOkmYetKjf3rJ7lvzJvT3K61B2?=
 =?us-ascii?Q?TyzMOcZLr9ArmksaQqvaTx/1RNe2oLX+VOELDRYzn7o1RaVtoCjwwmDSCjpP?=
 =?us-ascii?Q?c64hQiJKKxwhwxGIUUXcRsVyI/O0gkvSVhRaku5Wpe6zPUF7p+F8LO6D6DIn?=
 =?us-ascii?Q?Q6z2qeKYyikVc5MrFGLJpwZhdqJMC7dF39QlVr0Ako8SEA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iPn/Qg969f36BPti2z0w1zvrmm2oYg36iTBWF7+IBsBUMdCfd3Cvj9DY8vMU?=
 =?us-ascii?Q?DM3WH1CWMHU9MThPV9/FC7B5Y1IcpoEZovb54zlm7xSLzDBUHbQsj9cnPQLN?=
 =?us-ascii?Q?v7P6wf7992780puk7HnF1X4TU27ubG3vwLYEgCBs5uDZZraVRtWovB/CZasA?=
 =?us-ascii?Q?+9DYwctz8QtRzk7D8PA7HR6DTo7mXfVt5lEya5JvtMQJzEGtcYrkzrfD84y+?=
 =?us-ascii?Q?3dSF5036G/sVUcrwPnXg4/K49sqwUNbLCYMeWPl6rDblNtMq3YK0oJKkQbtp?=
 =?us-ascii?Q?97gD7crZhB3mfRKeU+VKIHQWdIevNv4MtgtQ/g9LifahawzBcMIEv8sxnI5k?=
 =?us-ascii?Q?NNIf0iMoFyO4zA9+FRZwTzMOx+5sL9h2YGLCZNrI+MzVlwHjaecfzQ5usZAN?=
 =?us-ascii?Q?jonCMH0X5/EwB8kKyxs9FMLV2SdPF7I5YrKLNW///QmPwkE571XVl7LmHa8t?=
 =?us-ascii?Q?XnAnT7sxDR7MqLl3C0qpZqnjiDKfFXD3dACnCXZM6hhVhpYkf4o50JAG6PMs?=
 =?us-ascii?Q?Gv6PaYigz9Sfy+gmsVatSlElFbJFtodrbqZZ4LZuiaTYT53fHlMv0b0Y4RZh?=
 =?us-ascii?Q?UO80TdFg+8eMgR8sz7QfY9spfXkouxQVunlARAnhuNBe6FSfB1OJX9mhV5sq?=
 =?us-ascii?Q?RHWOcFK1X5CFTmtaQN8QGL6JHU70pMl4rz70TQUHqCH+UmeKp9BJ7mHGSoxC?=
 =?us-ascii?Q?yT846PZnbvu0nLf/MXl5gsgS9qd9q1SP3GxXteih4Fhu79IIk0A0ObEk0yRN?=
 =?us-ascii?Q?saeT7AwdBZ+e+zLFm7zBcAbnteQrqzux6jyHyE5IIb8ldZ/hYsQHB/5EGnfG?=
 =?us-ascii?Q?e0QFIMNkUL0MqcSA31pCWNlCTdyTyDorh/pnVZW2GdbkRAOc7qmco93KokEq?=
 =?us-ascii?Q?YSgGTUy2Q5UW51qlNVQd7dY82M1slOJ6pvPdzNtIgjPRXMDB2AQ5PyEPS5WT?=
 =?us-ascii?Q?DKERGHe+ToHZmDiCYqh+C1E+XqfAVNY/o99/gtznFD77w9jpG22ffWYQzmo6?=
 =?us-ascii?Q?oPS34Mkjyh4MqhOL2xehLI8EjyH/0oOyXdAeJOk8yLVXfesRnRitase8/CqJ?=
 =?us-ascii?Q?WhISXBgTLAbHW4M/Hv2HtbIh5aumPzH0RUTxlKdCy+4eVuTyI876MDJQ44Dj?=
 =?us-ascii?Q?GDnDOS9e96WskHAhf+1wNHGUgTr7ELXm1XgyCJfYi0x/kHtl0DUJvF5Zvxe9?=
 =?us-ascii?Q?oe41vD1PhW5xOsuzFSvqn75saZLQIUR0Kh3BiMNRaOvv20DG/oCG2tubNslp?=
 =?us-ascii?Q?vFm1vPMcAwSuaBOhlIuw4VBaezG7q7EkoXfldqCFUGuRVsqZw0zCVfC6FphL?=
 =?us-ascii?Q?eswLr2Dxb+chep2Lb0zU9P3HbNtkHMsUh6nDDvMSuCdlGlvSDUA0WmEXSxvj?=
 =?us-ascii?Q?SxZqJUzc8ljxpIrVtbFhQESfrNQbe5TKp3L6xy4T9Wyr9yubCmeH9DSkLeK3?=
 =?us-ascii?Q?1EEMyPCGX8n9bA+Yb3OKroAt1D/QNQMRupHSAREK8rcSRwLTRxx0RvmJsUGQ?=
 =?us-ascii?Q?XpltOr11LSznCT1UDnr3SG8GFzBpZBplWNMMQ9LuDWSFA1HNObcaL3Cr1MXb?=
 =?us-ascii?Q?sbOxk9rsZH4NublNyBMOZ8J8jrm6lOK0pDekqgqS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7dafb55-94d4-432d-1e0d-08dc75c45a8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 16:22:17.2465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i2d/i2er/4TqIrjDX7Jvji9hV7Q8QmKgtrL0V846F1ysIS8CwwNjn+MZns8pTeaxFs01Cwp/z7nn7E3pyOfKF/GTdva0NFHHxsK8yecNTzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6330
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
From: Das, Nirmoy <nirmoy.das@intel.com>=20
Sent: Thursday, May 16, 2024 8:14 AM
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org; Das, Nirmoy <nirmoy.das@intel.com>; An=
di Shyti <andi.shyti@linux.intel.com>; Janusz Krzysztofik <janusz.krzysztof=
ik@linux.intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH] drm/i915/selftests: Set always_coherent to false when read=
ing from CPU
>=20
> The previous commit 'commit 8d4ba9fc1c6c ("drm/i915/selftests: Pick
> correct caching mode.")' was not complete as for non LLC  sharing platfor=
ms
> cpu read can happen from LLC which probably doesn't have the latest
> changes made by GPU.
>=20
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

I see no problem with this
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drive=
rs/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index 65a931ea80e9..3527b8f446fe 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -196,7 +196,7 @@ static int verify_access(struct drm_i915_private *i91=
5,
>  	if (err)
>  		goto out_file;
> =20
> -	mode =3D intel_gt_coherent_map_type(to_gt(i915), native_obj, true);
> +	mode =3D intel_gt_coherent_map_type(to_gt(i915), native_obj, false);
>  	vaddr =3D i915_gem_object_pin_map_unlocked(native_obj, mode);
>  	if (IS_ERR(vaddr)) {
>  		err =3D PTR_ERR(vaddr);
> --=20
> 2.42.0
>=20
>=20
