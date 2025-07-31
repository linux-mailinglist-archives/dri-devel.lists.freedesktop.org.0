Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F72B16DFC
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 10:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE0310E73B;
	Thu, 31 Jul 2025 08:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/9/YYXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8F410E73B;
 Thu, 31 Jul 2025 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753952221; x=1785488221;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l1uoLZzQ2WYczpv8a6pJAGAJ+c23jZ0Vvy6lpKgkjMY=;
 b=T/9/YYXl3kdUnwI84+cTU22KChKpFKWLq7bHkr/kqqSigIfHNRvPFmu2
 kahzIuWckeNtSE2CDuXCkPZ0LQDR6CY2AYgUoynyL+GDCHguwFVAXEiar
 ZqyZQjgndp0+LKrmR8KPDaUE4uSX9FitEw6m+gNxnXDzYVaGHYBnTO+2c
 GuqsGt1l6KMq+MQdw0HuSYZC7pPpf0pIQTAReBhebnjwBIs0ltIqjBnMx
 fb30Amo+M8ToYGmJXmCd+npaTyzadyT59APP4LUNz8DRNSHWVoFigmaNl
 MuM3tig/4A0HpUQ9kQzNqnbma4Q1MluEvu9x92VVxLpNKjazBdwfsJyno w==;
X-CSE-ConnectionGUID: UA6dmqiBTIqx0jq2q8h9GA==
X-CSE-MsgGUID: pLsO8y9AR2ikyJft99TxsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="58891872"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="58891872"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 01:57:00 -0700
X-CSE-ConnectionGUID: r8jQQxK9TNy7RHOrS9C6Gw==
X-CSE-MsgGUID: c1z6SrKdSdeMGlcKTbM/7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="200377211"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 01:56:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 01:56:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 01:56:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.55)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 01:56:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOsNGTb+l0tsOmx3vlWN9T11iwYjAB+JXTi6W7aZb0088SZ5xGJqhAfi0t3DLeMMNlCjvMxYdPI1vcpJU+eMAmuSQeclIybzfd2DXd7k9NqhSOadsQSM+sH8zS7efYKuiaU64P6JvXkUOdOPXA8PJ9PjWLjhUQIz1pHhYkZTucqjgVh7MQdeBF1lZKmyAsbo5mvULm6F13RyiOGIsC2KVT2y1GLhOb46mIo1seWmf7KGBCcGDXM9c9jVuNl/+fwA3dJ35+Gt17f1DVsw4U8uqxODTaiqWqbV017nwBCd5ddo+mHe2GHln5VWp8Jydc8QsTPeHz/p6vciLY508AqhTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67jhWCOX1rxrFlJxfNA2lxzCkZePAg1QK2JGnABy4kk=;
 b=TXw0YIm9t4d7f7MGmN+K/tO2ZJ05IDMSvwbidnRrpoHil8k3Ifo2QRCzM27GKDVqPVduDzXdrek3HmpPvtZkoOO8gYa4ddMCRWhsDMrZ078Jrd3gqpvvWl5+PPBhtfxYcLrNOAcAMyI5rMt/X7SJEvA0dC+rtIZYtyIgTlZrZFiUFsobocMf4qVlun/Y1Ys17ZW6m4MtQooFPup32XQEcRkQ1muBTAR06576pH5HbhemTHAJ2nSfC8j/2CRjGS73C/ZE7J69RMG4LTjuBQZygaLDPpVIQsUsekV6ST/K89i9uKdBrFAr1JNhotWUqYP2fbFjBWFS9GEFhrbh/1ycNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by PH7PR11MB7002.namprd11.prod.outlook.com (2603:10b6:510:209::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Thu, 31 Jul
 2025 08:56:51 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%3]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 08:56:51 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 02/10] drm/i915/display: Introduce HAS_CASF for sharpness
 support
Thread-Topic: [PATCH 02/10] drm/i915/display: Introduce HAS_CASF for sharpness
 support
Thread-Index: AQHb/KICiotmwcJewkKkVMQEDyPA87RKTu8AgAAAQICAAalpQA==
Date: Thu, 31 Jul 2025 08:56:51 +0000
Message-ID: <IA1PR11MB6467F1DCBC5DFBD04A4C60C2E327A@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20250724134544.284371-1-nemesa.garg@intel.com>
 <20250724134544.284371-3-nemesa.garg@intel.com>
 <2c93ca60e6125a9bd1792fb0b00dd01dd6705781@intel.com>
 <559c287032ae48697188eefa78b769da322b8063@intel.com>
In-Reply-To: <559c287032ae48697188eefa78b769da322b8063@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|PH7PR11MB7002:EE_
x-ms-office365-filtering-correlation-id: a6675e6d-aa87-4547-2a55-08ddd01030dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4BzfxAP/X9aK9PPFYbL9c2F7dJcp/xmEHadzK1bHj9bppktMwzubF823ksMs?=
 =?us-ascii?Q?zehS+xbod2VFZ1LTVhOWVMu7VTEGeUiihf/whjcX0RGH9kk6/F9e0gFnSCQd?=
 =?us-ascii?Q?6poUIMX/Rnt1fFzOxqsY9+HgOCVvLU94iQ3AvNTDz5AJo4tep4h94o4ONTs6?=
 =?us-ascii?Q?8e7jY6j6BCDAT5j5DEpFVUSegwCjHJ9LMploKmWBAFRcjpK8wRW/82YOO7AI?=
 =?us-ascii?Q?rELxSVgvDiB+mytC7ZfRN7guZypPqBmgx9va8pLQLSfRqlzieAUFB73wGE7d?=
 =?us-ascii?Q?gw6UQDuVH4VEKo9Gp2cstcWikCP39hKUMK3qykzzYa7sWSOHJ1W/kdO5wwZp?=
 =?us-ascii?Q?kKZaR48KVmBNs5hZ84+9XUC17Ek7sfR5du0IfwcA723/xQrXEcXYqtSP97VV?=
 =?us-ascii?Q?RX1c55A0vsROL4H2T4dYByIzXf+AveuPtJwoAZl67jqADCZsEMPe0QWEm74o?=
 =?us-ascii?Q?oH06aAvwcMBxpx5B0j7ynQrORyxvVqPz7DQBhVWlhDH9STOpLBBrqW6wUC3Q?=
 =?us-ascii?Q?bSrtMDW1jlBvIvPTUuw3YOafaYdA4ZicPnn9jExEN8ioNoTscg/FpA9Z2uIu?=
 =?us-ascii?Q?KCkAYqJQ7kds2nNDR9Gg1CkPEwfYx3HxVm+C/LCuHUGxV6ltSpEXW6z41Xn1?=
 =?us-ascii?Q?8p3CylVgpbgpW2QDbmWHP32qxtKbEA7mMlYKp/nge3cTkK5sx0epspZV6IBT?=
 =?us-ascii?Q?3jdJ4jRO3I1W/sQUMLGDbvozs8XBHOPP6E7B0QCAHwYTehjUd1So7vnpPYe0?=
 =?us-ascii?Q?IgFaa2QpfOPD8YWdJaolBIbKSAM1KNGvEQ5lwyp+PVvSme2O8Z1Y37s4jDX3?=
 =?us-ascii?Q?EhVL98jljhgH5V9ksYCSc6B/iEkF1hX/ZCfr+bugxxGmguy1jb6O8jO4gEK+?=
 =?us-ascii?Q?7jxmK7looDBl6zh5LDn4RX27Rb6grsqOGN2uEIDRdby8ghK3ov0/xsxAN8os?=
 =?us-ascii?Q?yp40wuYqnyLb+0f71CLJtqNPrcAi4xRjbHA+yQRt27XlxG+bNlvdcAWDvzA8?=
 =?us-ascii?Q?wWtckW+aJLrXZMpY1SstwTMvL3HZIPoNLAQElFXeIYHJ8MO2v/p8Lmdft0yL?=
 =?us-ascii?Q?nvRxs5UpfxCuQO77c4TO4OQWX0t3wRXZ8SZ3KgUiiWLivXC89FkVDqF40VRx?=
 =?us-ascii?Q?dyxMCP1M/3QcnIhMw4A9Zk5bGaZh+VbBu9RZuHWpmNT0x60gCKCaurH7slEb?=
 =?us-ascii?Q?5hRhTSpekGLpPB1smmu1v92sZ/b+PyzH3Jdr5AJoW19gvFMpvS/E/GkkU4Df?=
 =?us-ascii?Q?HkgpDKUsH5V2yCa5ocyWz/v0RmeXDqWPa8wAwCx7S6cC8GRP1dpgC8TOBbpB?=
 =?us-ascii?Q?h3cSCMIB7WlCMDKh7rMtkqTp8XSVCRvm3s7ZnxzussouvLM2acsijpX7YrEz?=
 =?us-ascii?Q?4QVk6ycXy/qb5MLUaVLq16MVR0UgGSnBqQEJ8pi9/82/ojerjGHTjz4A2uH7?=
 =?us-ascii?Q?LvCP9zOqCvyKS2qDMZuXUc7AwmoDg4jkV0ZbfMX6vAvYIEJ+Saq0fg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bph/WLVxNs6DXMnFwgwt4PK360Twb1NVHCqSIXKnPfyYrFvriTvLtf1klK09?=
 =?us-ascii?Q?3ChFBA4I99MkTtmeuH/zYojgoAg8fLBjmElgVQ3OiOgmRBEBwA6OmQcitT8Y?=
 =?us-ascii?Q?8XNlLhCw8uA1C4N8yXnl3e9LHt6vpdSt1A98ZrV8IyHsVoXoebIP60N+jvdS?=
 =?us-ascii?Q?nbXqmCsSjaEycZpLQq7D1KJ/zylIW9UBCjo2xVgtxFdwKw9si+bqsVTOsCCv?=
 =?us-ascii?Q?j9AQrNaB6HwlCX2OBGjD7iTiOQTXs/UT14IdecRwwNCVngw7Cd0ZVbwSX1ek?=
 =?us-ascii?Q?Tkfsj6QucjJklzTWrfnXMZWoWhymzNGCROWOStKKVPzZqsdiTAgxdOzEEilP?=
 =?us-ascii?Q?Q6b0ckHItmMtsb5I5aVEUox/hNp1ee24pOnhpify4XgzTShWnMHQxM5Jnpyf?=
 =?us-ascii?Q?v9uYJYB/KWMeFDkhbhj4M3ON566jiHHoGGm6D+vc6ihHmF48aHsbOfc6Xtjd?=
 =?us-ascii?Q?zCv5ODqvrSVxcS3fXjTpKj9Msnu3oqgk8cBG2a+64SxG08ZINFyLTLF2xiWH?=
 =?us-ascii?Q?U8O6+plj5nc9Y1N+oZr9gq5HiV6no2EbS1feypqOX5Yoy0qCgoUzFd6wuW6l?=
 =?us-ascii?Q?X8k+FCt2gRYriQZk7tvIw63Pi4hsmuQlGy7Yo/8Aqk1j89g6ur1W2teCeNge?=
 =?us-ascii?Q?a/sLWyVD9uf0KYntIBeVf5gcHtmASwbHscOpkKiU8k2ETeHLSGwTmWHgKzgR?=
 =?us-ascii?Q?r60OrJPk9ucQKnmgA1EIdmmtdfee8GM+PVBd0wBp0MvDPb6GGhRtETmznX8N?=
 =?us-ascii?Q?ZEoOPei3qhnhyvoJcmd74oXyIWCz/WRpB4ysTF8xGu83CVJSy0ovgEtuzXYK?=
 =?us-ascii?Q?FYSXToJhxcq4LQwpXzm+BB/kRgEbsvkCxMscfXP32Lmw9FJm8ryG6BDMzkVJ?=
 =?us-ascii?Q?ksv55qbKpfFQw7fSIoP7+uDIlEFhXN5oJ5g1U33/9mpTWNCOlWmlus5AH0qr?=
 =?us-ascii?Q?lUM+ejmV8gn59Q9G+ZoSr/fhQJP10PP2EIjbcNLn7KNLgpkiC+fmJzl5ErDi?=
 =?us-ascii?Q?7yF8aHNLUJG2qnMiOcCh89Q89n8XGTsxuWPzzU+193EL0YkXOsKXMWSWT4md?=
 =?us-ascii?Q?r+DmdtsoFdlWo/xcHokn+XsmLQAlruRCEWRjRWL9WRMV0nCEda+dxhlY6V0k?=
 =?us-ascii?Q?qD/t9KaCVhHh8sQY87H8/DDD4xKWUbRNK5lB1txckFg8oBdnejXqr02MsZrw?=
 =?us-ascii?Q?vOt5igwbHYBKYRNbj8ddEq7IJZxcnkE0Gd0uWHuzuSi6fNGE+I3MdYB/9EtH?=
 =?us-ascii?Q?boEGO5awZ/4MdTxdmThfSa6FAybk9QzvtI8OL+CLcc8iYTJA26f4VPIEWaeC?=
 =?us-ascii?Q?iPJnVlO/NoVk72d4i0qNWx8XN+nEml0r9C7AEfjNmZmDlwfE4bqw97Br4u4W?=
 =?us-ascii?Q?8UzYSlDR1EXd/z02V8EdwfoNdLIy9g6J/rsn+wlvhpluFv5IG/C+ABBaZCmc?=
 =?us-ascii?Q?BpVN17VjqClMUFSE96loPyJCKHAEzBrC9x8/JFntbzLtcAKAVMXBh+u/AWna?=
 =?us-ascii?Q?cBEuHd9NbKtdxLc1qaHYxp+1FmfCG6jLCiL4bnlMrG9xOGBT1PJkxpW42Wa8?=
 =?us-ascii?Q?xGxR7XkMCiJOtLlslTgeSftpEBpm6l4piZtgmbo/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6675e6d-aa87-4547-2a55-08ddd01030dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 08:56:51.4224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rAw99itsHqptzOCxyRnMlHJT0jV3LOqz9FP/BBKSoynEhifNVU+fLKIiNeRYQu1Sb+lEGd+N60dV4afJXcZVFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7002
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
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Wednesday, July 30, 2025 1:03 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org=
;
> dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: Re: [PATCH 02/10] drm/i915/display: Introduce HAS_CASF for
> sharpness support
>=20
> On Wed, 30 Jul 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Thu, 24 Jul 2025, Nemesa Garg <nemesa.garg@intel.com> wrote:
> >> Add HAS_CASF macro to check whether platform supports the content
> >> adaptive sharpness capability or not.
> >>
> >> v2: Update commit message[Ankit]
> >>
> >> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> >> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 7 +++++++
> >> drivers/gpu/drm/i915/display/intel_display_device.h  | 1 +
> >>  2 files changed, 8 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> >> b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> >> index 0c7f91046996..33ec30123214 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> >> @@ -373,6 +373,13 @@ void intel_crtc_state_dump(const struct
> >> intel_crtc_state *pipe_config,
> >>
> >>  	intel_vdsc_state_dump(&p, 0, pipe_config);
> >>
> >> +	if (HAS_CASF(display)) {
> >> +		drm_printf(&p, "sharpness strength: %d, sharpness tap size
> :%d\n
> >> +sharpness enable :%d\n",
> >
> > No \n in the middle please.
>=20
> Moreover, place the space after ":" not before.
>=20
Sure will remove.

> >
> >> +			   pipe_config->hw.casf_params.strength,
> >> +			   pipe_config->hw.casf_params.win_size,
> >> +			   pipe_config->hw.casf_params.casf_enable);
> >> +	}
> >> +
> >>  dump_planes:
> >>  	if (!state)
> >>  		return;
> >> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h
> >> b/drivers/gpu/drm/i915/display/intel_display_device.h
> >> index 4308822f0415..7f76215195d8 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> >> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> >> @@ -145,6 +145,7 @@ struct intel_display_platforms {
> >>  #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >=3D
> 5)
> >>  #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >=3D
> 13)
> >>  #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >=3D 11 &&
> HAS_DSC(__display))
> >> +#define HAS_CASF(__display)		(DISPLAY_VER(__display) >=3D
> 20)
> >>  #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)-
> >has_cdclk_crawl)
> >>  #define HAS_CDCLK_SQUASH(__display)	(DISPLAY_INFO(__display)-
> >has_cdclk_squash)
> >>  #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >=3D
> 20)
>=20
> --
> Jani Nikula, Intel
