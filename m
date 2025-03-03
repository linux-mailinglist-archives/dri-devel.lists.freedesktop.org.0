Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8FCA4CF62
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 00:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7AD10E4CC;
	Mon,  3 Mar 2025 23:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJQV50Nb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A53710E2EB;
 Mon,  3 Mar 2025 23:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741045180; x=1772581180;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8/R6VRIXvRibmnBf46ix3rhbECM7ZNRNlK3DKWCpVts=;
 b=RJQV50NbymSU4xKNRqygyfnj/NsoyDGPtGKNK5CbXjYX6dD2HG/O8jJN
 XPmX/YjpNnw+Hq1fC0wDrqjlzxo5y42Aeo1DxQnSaoOkaC4R1eoPZMd6q
 H2Vsp6coOYm3BjxlYVCfHnMM6bc/S7QYMV4L5h+O8gz70CTOLnCpuaUx4
 z7LfK+rXjG+Z1FO6zR1QbF3Nv1vzli2VF8V6B15t8Va+97prkNzlikf3P
 ZeIUH/ltW7DdLAwIfPpn8+HgxPhEAMAXOvzFNSiuXQpQ+pflvtJK8fP+f
 rzLnCZPF+lD0W5z6SG4y/qVkFYOMKcBOHSyoNwBxwjzBOfC2J0MlY1ANY w==;
X-CSE-ConnectionGUID: HCKoctLBTpW3G2gDyO2nYw==
X-CSE-MsgGUID: k+AnFFjEQTerXpsil5mTJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41836754"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41836754"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:39:30 -0800
X-CSE-ConnectionGUID: OPLTXVoiS+WUvcbtZ7s28A==
X-CSE-MsgGUID: kLHA88SDRk6AWxTCYtpYHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="117983495"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Mar 2025 15:39:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Mar 2025 15:39:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Mar 2025 15:39:29 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 15:39:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EuwwQJrf1A8vUwxT0Um47573jQ1XFZL85tFxysDC2XCqRnX4OXR3M4kZF/ja4JRcb4eJ8N+gRX66lj56oGqixUOpqn3SltKWVG7L/60GkQkaozxmiV2s8pJXkK5LUWdRrpdLLD0WGJ+2vID44UQsRWn4qKKitYuxEXgFkZFOq3u1r6rj4Rv/9RNcw7W6br6inQIrpu5Lf6VE+Kq5wyG0YVcIv9F86Av72TF9gmbbLiFnJCQYG278vpa1g8b8f0RGjd8+bsIHec8oywHK4LI/wnX5qLUzM6SVuwu7cyEd0gpnikkYzU7wDkqKzDE2rjodKsEHr3SeCOvNTuWL/H1dFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7Fba63z1Rzp3zp6V4u/Eg0fWXTNs/ZzyokVzn8Onec=;
 b=I9CJhICPC4QtxvCERWfGiDjkbuHR0Xu8Ix/M0ocRCi36ZP/9ZAp1X2JP+iEiStB5UwWsAJI/1Cl/KfZjx9FYov0HWiDdcrzzcuKJMklQT29GUxQ0kROx3QNyI7cMtef0h32BjpgUhnZBGxRYHVij4Fo0AC4nOxmIQeQBgKk8M1DmgdBea/u8VJ/iO617bVlti9VDOXlkJjxtJw5qVkG7YCcv7DP0cqLGhRmOwFHVrdeM2VPma86Yy2arEvyfmuWJeA0WbH8J+/EmKmcSKjw7A7b0AzDxZxMjd+oipW8KQOYOoqDzuWb1fNDnfHfz+AZVgZkFySs2Fb4VXY8CVWA64Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH8PR11MB8106.namprd11.prod.outlook.com (2603:10b6:510:255::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 23:38:11 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 23:38:11 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Zhang, Jianxun"
 <jianxun.zhang@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v4 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHbjIfPywRdYqIDVkGj72TOxboRPLNiDRtQ
Date: Mon, 3 Mar 2025 23:38:11 +0000
Message-ID: <DM4PR11MB54566852679E2A8CEADE161BEAC92@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250303220022.67200-1-jonathan.cavitt@intel.com>
 <20250303220022.67200-7-jonathan.cavitt@intel.com>
In-Reply-To: <20250303220022.67200-7-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH8PR11MB8106:EE_
x-ms-office365-filtering-correlation-id: c23d8273-bc4e-494e-2111-08dd5aac75e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?nTo69HkvlKJMPSM7Q4QNHKNXl0+nRZa8HwBM0Va/WF0dtHJ9aOuO5rI55LU7?=
 =?us-ascii?Q?tpctrEbn/QFVRguJpZ/WiIceybRQ4W9dTtmQVQHMkl+37JLQSD5panVFF+p9?=
 =?us-ascii?Q?LehoPLLW2wqM/HQ7wC9NViQNGXvmY8E/INQfIPl87eCsPimyJavZ5v7Ostyo?=
 =?us-ascii?Q?Ywa0TX91cK30BPNIlZ18dwm9r5pvQsigiymYEV4wyMQLNRnyn281znPDzcte?=
 =?us-ascii?Q?odHVX/plHYaxEsGHN8NJ9PnCAdc2WF1k6yq0W3EKrJTlsytbuSpxBn8/Zpt+?=
 =?us-ascii?Q?Jye6YPnqjg4hNNKxemo8nX9WtLxgI41OSVWVw5aD1TAFgZojR5jnEcgAQwR5?=
 =?us-ascii?Q?ZuziBPfy4kSQl+I3KQ9rg6FeZryptH0qJobYkgR3h63myFhtl7l/ucRzkM+5?=
 =?us-ascii?Q?GB3gHBrBOo1nVZYzSzq3fK+a3SoJdvxu6e3P/2gatLY1oOjsSbqmjYZPUVAD?=
 =?us-ascii?Q?l4hd7ehbqyYyfqcWcp3TyZ+7PJrpfcCkqjtRN/+96RxwA+qCwaza216kj9fq?=
 =?us-ascii?Q?UVdSMIxkaNka2pSS6dmwE1wbm2ObdMwHYMKG+PqFlx60QA0L23JO2T8/MeXM?=
 =?us-ascii?Q?Ck0hiw4+w/D+eaytVNmAx6Mue9d0UhhseKxw2kVaIscFjFzWVuHr273dNhqR?=
 =?us-ascii?Q?AkYHOb9lS8BRyoXB4opt4iZ8u1zxwRTHyAb9FZvDf5EIxpMJsjYjXMQXV+kq?=
 =?us-ascii?Q?drzd3nTCu47E3xNahP67TsTxcc4t2ZVSRiuhf20QBXdPgL8IVpGkgP2kQEJN?=
 =?us-ascii?Q?Guvof/542qCKQtL9wxU8GLyTocWD252YkR7D1G0kLERrO+t+LGeFn+Pi5g2F?=
 =?us-ascii?Q?FEkiQcF9h3PnmqPyO+HkHhgR/0FdHLXudrd6T3ISX2GE8RG9ORXaQuW1CPX6?=
 =?us-ascii?Q?dmgQw3a2dgH9oEduEZwJYGjgemwbHY6Gs3r9Gbsi1K8RW3eiS4ZEe9q1/5+4?=
 =?us-ascii?Q?O3UqEJ4oei76KpuwPPdVwq7u8GvP9v7GWZBYtX/hj/pNIg4gXHW2bNxL+Bnu?=
 =?us-ascii?Q?/OG/cTT5U6boKC23kOHCnTkmz9cTljUal/FTOraSaaDVgHgelMSRWepAz9B5?=
 =?us-ascii?Q?8Sb3l8ZVqI67/EHORAyNkQHFgaF+D6KNtRWGo11zIhz2awdSXmhpg+/rNlYj?=
 =?us-ascii?Q?Cn5UBzTgzdOcwggLah6jAb/e3dIKG4SrwKDvVnWkzZcqkHu/C2KbtYRHFiEN?=
 =?us-ascii?Q?8xiTKmCfqoSsAdIjJOeGvV4WJHq1RV8HHl+5FThG2Ng+Nmd3euq1vLdxYIrE?=
 =?us-ascii?Q?8vIjWwtuZFM4bwfGEBS+Roj2K8M/xVvh4uPeKlegVlRCQuTIt/QPrEH0F06F?=
 =?us-ascii?Q?fbX+KEwXi6Sb4zCS4YWfKW/KBxehXV4zMoALNgr4uzmxqxsi8dNI0AghiLa1?=
 =?us-ascii?Q?xrB6ax2weo6fMo+4G7F78PgbrmuaupAAt1kVyo9QFWHvMteFsy/RlW+KywOV?=
 =?us-ascii?Q?RpqrMUeLWvFNJABLFKX18/ntJaLQjCjb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qsLwb4uAhoQqqA6xj5PY/C3HMi3XcdBqja3Rfr7kZWW7nO+jXRnKBBICkNgu?=
 =?us-ascii?Q?vmWn2y4pAXYYZnuyQDAXpaJBVFUfr31f0y002Fic2YDY73gPdR71NdiqCTFF?=
 =?us-ascii?Q?kakW4AVX9NO+yXsFxgE0y3y+4DHiK6D/3kEs6EtHCrI6TQ+vHGtdAFlxbmH8?=
 =?us-ascii?Q?20kzuIgpmup9uPaxXcWEeCOgyx4z6oIkG32I9wmTUW2NXt1VaQK42MpEs2rO?=
 =?us-ascii?Q?1bcSEbNX9+x/3VrsG/FMuDwiQ2UlsP9Yp77erdL06w58RL8d9SZiX4apumH9?=
 =?us-ascii?Q?BUJ1+2Y+YFZ0DG8zKbiJ3ApK37gAHY4B6YAbGFeFk5x0coKUuOlLWlzc8gea?=
 =?us-ascii?Q?urMCjG/YNPasIYtAIS2ljyBMMdG2zOaPVz9O3UrV9aSaL1LevsM1PqWGMt+m?=
 =?us-ascii?Q?1IsMksnaPqmsKxyKEn7RMSalmkDsrPzlIhwEvl3h8DwGRTq+8dggdw+ANtwR?=
 =?us-ascii?Q?XUhIH57DKlAPoyDzxyqcuxvPKjlgwnReEF5xw3th79iZE1lhsZusXmP2/PhW?=
 =?us-ascii?Q?IXvohHPvqnNP0Y1Ssq64Lh2mreZdW+3V5/H4TtPe1s/8QbFf/ZR1Cgm5uFMB?=
 =?us-ascii?Q?NH4WlA7aK9De+zEDJUMgK5K4uNda8l9hYaxr0cPRGpeqs7/Y6DvNxiJH9mqy?=
 =?us-ascii?Q?lWiAM3bKZ8STTrlWxCQoBgHEUe3Tf7tGQckq1AjYOqIg0MALGSzuxtdyyqYm?=
 =?us-ascii?Q?mB1vTKrP5TPwLwUucsx7M+2+vPtchfC6elujAsyhn192+XG4r/cEEPBU52sQ?=
 =?us-ascii?Q?25Z7T36nbXdLbO60GuX9xbcPfRDK+IxIZ9CtGlpD7H3yuh2/70BirEFUHT8l?=
 =?us-ascii?Q?JLi8LRPWrgUds454KTRXkxlEPbF2rYP3KgLtm99HKz1lwShDWxaeF4wy8Zxv?=
 =?us-ascii?Q?mKrPIj4TyT4b3AZJM6FT9e0cAS49ZdAkzG1Faaxq7u+diN1NZapCsUzEMZQj?=
 =?us-ascii?Q?hYHqbO/Ss5Sm+TfDzSeh64Tr+3gBqsYsYFZSGx/4AbRe7NvvPEF2H82Myvlf?=
 =?us-ascii?Q?xdiLyTH+jbe6CjpEm1XL/hzzUXmKyF09CDtHRCbhb0X8Xwus14UufvqrA+vY?=
 =?us-ascii?Q?DSZTphdzxy9PtLhi8RTYO4kyIye+9mQ+L0azcxJngeDDkUvreaxDlIA5+gtJ?=
 =?us-ascii?Q?J6zW/Kyv/3k7Wup/z+w03hSo2DZdOujK0Qly+axucIH8tweQe72q8QxMyvlu?=
 =?us-ascii?Q?tFsMuoAlVbvk47e4U5A6ofoAtWN5gTCFNAD3Oa3McUMRjnZwwPu092kyeEm7?=
 =?us-ascii?Q?aYjlKeQOnfGBDpJn7V4mqV595WTPzlDVX0QVxZeURnRaujcTADRE+/H4K1ra?=
 =?us-ascii?Q?vNsaD+TrzBgAnAEiZGawDSUM5ZUyCqEjP8iNDptjf7kEUgWtLYFttF6wxRte?=
 =?us-ascii?Q?RBAldsBo8R+xPZv+yqa6nyR711Af/oGJSESahfLUNZjnDiiCijIat9DDJgWC?=
 =?us-ascii?Q?tPzqglmMyajFIarBoou/1lUyewO6IRHxxxTYN4f0V7kkEu9JKzbX+1Ku3IqV?=
 =?us-ascii?Q?iUPvmJGJWHI+YX4MoRYy59Sa9eMxVoGMz8Wk50Y8p8B0znic3cxAy9xt6Y9V?=
 =?us-ascii?Q?HmJQQ7O1E5cTK1a3290yUKkXBj/KLPcHyL9mHvLl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c23d8273-bc4e-494e-2111-08dd5aac75e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 23:38:11.5122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6Ta615s/URziRdz0z2R09pwGmn47FbtTF6eop/yV+Elqt7TalTk5Yj+S5W2Lu4aEpBiVjfnjnDx+YD6BOkEsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8106
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

On Mon, Mar 03 2025 at 14:00, Jonathan Cavitt wrote:
> Add support for userspace to request a list of observed failed pagefaults=
 from
> a specified VM.
>=20
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
>=20
> v3:
> - Remove unnecessary size parameter from helper function, as it
>   is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>   purposes.  Total memory usage is reported separately.
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> CC: Jainxun Zhang <jianxun.zhang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  3 ++
>  drivers/gpu/drm/xe/xe_vm.c     | 77
> ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |  2 +
>  3 files changed, 82 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 9454b51f7ad8..43accae152ff 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -193,6 +193,9 @@ static const struct drm_ioctl_desc xe_ioctls[] =3D {
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE,
> xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl,
> DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY,
> xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
> +
>  };
>=20
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned l=
ong arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 6211b971bbbd..139fcecf56c6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3234,6 +3234,83 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
>  	return err;
>  }
>=20
> +static u32 xe_vm_get_property_size(struct xe_vm *vm, u32 property) {
> +	switch (property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		return MAX_PFS * sizeof(struct drm_xe_pf);
> +	default:
> +		return -EINVAL;

Since this is a negative value, should we change the return value to be int=
 instead of u32?=20

Shuicheng

> +	}
> +}
> +
> +static int fill_property_pfs(struct xe_vm *vm,
> +			     struct drm_xe_vm_get_property *args) {
> +	struct drm_xe_pf __user *usr_ptr =3D u64_to_user_ptr(args->ptr);
> +	struct drm_xe_pf *fault_list;
> +	struct drm_xe_pf *fault;
> +	struct xe_vm_pf_entry *entry;
> +	u32 size =3D args->size;
> +	int i =3D 0;
> +
> +	fault_list =3D kzalloc(size, GFP_KERNEL);
> +	if (!fault_list)
> +		return -ENOMEM;
> +
> +	spin_lock(&vm->pfs.lock);
> +	list_for_each_entry(entry, &vm->pfs.list, list) {
> +		struct xe_pagefault *pf =3D entry->pf;
> +
> +		fault =3D &fault_list[i++];
> +		fault->address =3D pf->page_addr;
> +		fault->address_type =3D pf->address_type;
> +		fault->address_precision =3D 1;
> +	}
> +	args->value =3D vm->pfs.len;
> +	spin_unlock(&vm->pfs.lock);
> +
> +	if (copy_to_user(usr_ptr, &fault_list, size))
> +		return -EFAULT;
If return here, there will be memory leak of the fault_list.

Shuicheng
> +	kfree(fault_list);
> +
> +	return 0;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe =3D to_xe_device(drm);
> +	struct xe_file *xef =3D to_xe_file(file);
> +	struct drm_xe_vm_get_property *args =3D data;
> +	struct xe_vm *vm;
> +	u32 size;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
> +	vm =3D xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	size =3D xe_vm_get_property_size(vm, args->property);
> +	if (size < 0) {
> +		return size;
> +	} else if (args->size !=3D size) {
> +		if (args->size)
> +			return -EINVAL;
> +		args->size =3D size;
> +		return 0;
> +	}
> +
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		return fill_property_pfs(vm, args);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  /**
>   * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>   * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h inde=
x
> 4d94ab5c8ea4..bf6604465aa3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -184,6 +184,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void
> *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
>=20
>  void xe_vm_close_and_put(struct xe_vm *vm);
>=20
> --
> 2.43.0

