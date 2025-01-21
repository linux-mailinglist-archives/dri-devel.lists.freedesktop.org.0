Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2A0A176A6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 05:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054FA10E4B9;
	Tue, 21 Jan 2025 04:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADz6VqGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3D110E4B7;
 Tue, 21 Jan 2025 04:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737434719; x=1768970719;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vgBxh5YxXy1dJodEUhJ5SLLV9r3dSWnJzk/k3SMwRUY=;
 b=ADz6VqGJY2xNnKrLHAUlqTMQcW7Td7MxydHremmeycoRpXFj4IJN2thv
 Dsmx2UBEu9tSUs/4s8cEdKdyPTnTpMIAGryizLHDcsmlg12i7Sqci5lqX
 VtMiPzIqwH00CAr9LlZnx+CWOWQkdt2/qpLcUPWE/QVAHlDUk4IMoPTUI
 RDrSRWwRsWKQ2tgZN6JZflekWOZ0zmu0eljjL/WUVMqCt38hEdYWJ7dro
 mNCpdPBNVUHWE8cK4Tn0KNI6ZRbHMnU8tvmAvWOd92A4SSS/Bd6W7kXfZ
 tuETahbdSAFdgcj0nP6SvglckS1bTVu+ZI2+GSLupl0aduo9OI2MiB4+B Q==;
X-CSE-ConnectionGUID: IcXCr/W8QYacapD+CtboXg==
X-CSE-MsgGUID: YewrmMUvQVO5w0z8LwPbUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37857100"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="37857100"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 20:45:18 -0800
X-CSE-ConnectionGUID: Q37yMt23Tmq0Gn/JNlNGKw==
X-CSE-MsgGUID: aW/Qg4s8RjW1SqSrFDyRww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143953333"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jan 2025 20:45:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 20:45:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 20:45:17 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 20:45:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SudBh/fbSXWprcQJx1avI+0eEI4mhv/tnmHZWigOdC5vhx9IYWGBIYn2+/eMJJUAVqiU9rD0EJUDJJt0GPfxY2CqhxA6YdKyuoiMetx/0bnUIXbJwoP7cegRWlt633N+wrANXJ4ZUM2Rzu68R/L+I45aHS/5r7hct+9f+xRtCERsu6YgKG8nQdFpD0o3sIfZJQEOK52FAaG0u0wD67DClclREiKKtXNbR0KkDRyk7fvIm8CERTgM68614FwEJBa6lipiL9DySI0wJsn6NMoRzzJ1p+6O3bYh+E95WUteKiFwEbqalzXqjcxVPVjLs/KW9Cygjlm/f/Z5dMrM59TT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9Aet8rLk4Lx9/e/dDmVfP52ANVEy0+0t+wsPUSG1d8=;
 b=RS4oRXtw4QDiZeVnxt19FtzcQGFbbyePTpp68yEWAATlWyC/cjEgmyoThUEyZudegrNzRikHvZujbSsNTnpZzLFJPn41xVA+6WaGLl7pzrwyGwb+CzYP6hVKFQce2oj22I/Lbxd5yFlp40a5gVV9rTmAyf822pmqyupi7REUapBbXSoVMiDFsTBSW3buSGAxpwRZRoR6mesHDqMGFHo7rTG9nJKckutRb5XXgw0wMmwzo/nygakc8wMmHsqb0kTLQmGPjBIyWJPOxfc8XdXfMxBvG4HNTDco42WNZRxFhPu74IiY1Nm8cWVaB5VVJvWScp9hUQyxb5kv9YY/O985Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 04:44:33 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 04:44:32 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH 2/2] drm/i915/lttpr: Enable Extended Wake Timeout
Thread-Topic: [PATCH 2/2] drm/i915/lttpr: Enable Extended Wake Timeout
Thread-Index: AQHbaKOmqPoAUwuokEOMR8JRg1EtubMafkyAgAYuptA=
Date: Tue, 21 Jan 2025 04:44:32 +0000
Message-ID: <SN7PR11MB6750B351A861E38AAF0DE8DFE3E62@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250117054850.1189650-1-suraj.kandpal@intel.com>
 <20250117054850.1189650-3-suraj.kandpal@intel.com>
 <ztphlheh43abwngqvk7a2ht3bk2njytxlijykzf5ucuc3hrg5h@s22pn3wfdpai>
In-Reply-To: <ztphlheh43abwngqvk7a2ht3bk2njytxlijykzf5ucuc3hrg5h@s22pn3wfdpai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DM4PR11MB6118:EE_
x-ms-office365-filtering-correlation-id: daea3466-89f1-4b38-64b0-08dd39d64cbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Mdbgl8yPx/i6/6XJOc3COXOESlJOSKQDqua/aTRBz2dqlMAaL8uxNv+VRVTc?=
 =?us-ascii?Q?qhReFszDNAk75ptgKoxTyoHwir1W29X7ASsCzY4DkKRELIZmEljqOxBv0kAt?=
 =?us-ascii?Q?b7JpcvmRR+p1gT2wF4SW3aSC9nJJJNsAwP/OR3+Jjnd2oXqa+BPuwe6byrLZ?=
 =?us-ascii?Q?Cqx88eT+UqH4fCVf67IysIO/MmHfSqzK4CcXIA35eA4uc98AywfgOMuJuUsW?=
 =?us-ascii?Q?GHkQ1girX8UZiss06SfGK66rT4Eksd4BtV7TuoSrFRte4ke/lNRRMTbR07tv?=
 =?us-ascii?Q?9xrdHdLrZqUptWKQjb1ndwkBIr510dV2LSD+0AiLmd+8L1mYJOlqIvLxorey?=
 =?us-ascii?Q?LYkvdNiwnbSAdw7NM/YZKra/msPpXBBcBYgFcFNJWPlMVFwi3aaEu7BpAzUZ?=
 =?us-ascii?Q?SDhrMGJ1tVysfHxmqG69nAy9q7yElHWxtQL9uqS1GQz1guRZnseBxysBBS7Q?=
 =?us-ascii?Q?Ee8E0btCP5ZZOX/g+SJ5qRSblM0rdEoft7LbXmvsp/r0qOrRAz/tsE4SEWcA?=
 =?us-ascii?Q?V0HA/2rS8bmek6uv6qx6XJhIL6dQmyMD3Boium+5nm63xFDO69qO0qZwEZ0h?=
 =?us-ascii?Q?gNqzvXrDDsjON5e/3FGsPJKTFu2xN1Sw1HUAO+IsmhTXbrVQv1sQVvOCTK3d?=
 =?us-ascii?Q?kqZ2eMKHq4a0MXUkj37H/5GNsrlvlVabVJ5NVNSqUy8WIB2kH69+Ujt2InWx?=
 =?us-ascii?Q?82KFzeBhO7RzJ1scKmSdgzVZBs85o0F72fhmUs4YLQz/DiYzN3HDRDm88vxL?=
 =?us-ascii?Q?KVEEaMOBfr+i3vP6HFphyrd46jb9Q+IN7si13eIKIvCKHkZPvjRyacVqSskJ?=
 =?us-ascii?Q?hMXpWZfoCvmOLQ6a6UfesWPrVMm0nPNholZIb9AfSF5IzuwWvoQjNtNWTBIK?=
 =?us-ascii?Q?Z6cq8OqsMucpzLPFP3ZAQ/eZMV9K6tqk8vcTIUCWuK1mNqj/E0I6bC4tV8MQ?=
 =?us-ascii?Q?hgePBKBBjSxHfx4p3qA8znJv6W83v3ha9fGfQYtBeMa3ZR8AhVXeVW9rQO9D?=
 =?us-ascii?Q?CoVUWnlIGVDAQ9GZQawfsZTHSh7J5bchPCqlAvshjU6K6Z1fhRo2g4bwn4tQ?=
 =?us-ascii?Q?NlXWnt6hlt57fVR+jc3vtLSiRSVDminAZ+YzxMVl6yfjWq/a5uoxM7qdGkiW?=
 =?us-ascii?Q?F4NGChr80UcooNlg4xQLOmp75nDW4VTSCykaFHT6sOfhx9wJfnqnVOXb/Wxo?=
 =?us-ascii?Q?irk0EVP24cXYwnXbEOrOUgcCDV93qPZ6juuRM6hgxIQQOqxq7Pd93QDDtUD7?=
 =?us-ascii?Q?iOT/uWo243GR70/N6ouUJ55TeHJHbZV0KBnIS/ZM8yGrSFPPLVTRydFmjpMx?=
 =?us-ascii?Q?ZIxeWAWJCVC628oQYWyAoowno+mQUCuW5IvZSXKQ+cIb2PsNewTMFBnCvINB?=
 =?us-ascii?Q?zpUD7MgNfmh/lyMO8SXro6UEOtvePg3Gy/viLLbc/VL3vQ3Sg4vTPN0VlxSA?=
 =?us-ascii?Q?5RjPW/6CErdcL0XBsbdaeO2RUCJWhQ54?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/aB12Czflyr9vOr7CjUKply2I4BTrHvnlGLQAfMeg0VOKYsW6uQ+40MmfjRd?=
 =?us-ascii?Q?EsqZMjd9YRnStREE7O4CooCdALGUprW5Q5PjU0a6z2H9iKcTCDRsrJHVgM8j?=
 =?us-ascii?Q?gTCuildDWcFlzv0KDxYtMPRoio0Xc5Ubx0CdvzAIADu3kh3dBxHbIsDcLHvG?=
 =?us-ascii?Q?+D036dtNsGkUc1KhqSXzDZdOsbvRHI0vCN2lJvZVUTGR+GOhgHVjGezIZjQe?=
 =?us-ascii?Q?UJdq+39vKR0sFT8tw5vbfiYmdG+k1bLHv4wVgGs6dwLmR+Gpf861QEJQKI94?=
 =?us-ascii?Q?5t5d3We7guhR749s9Q4nJ6MPGP2nXexA74xcNtgNDI7VFc+YGP+T8OG0QhaB?=
 =?us-ascii?Q?sr+9fc+J/T1vyCKWYE61JV5WaZWm3zf058rxEqgyV/0bAjH7WkGe/grvta7R?=
 =?us-ascii?Q?gjbj4J5mSymniv2imcsUMMXe7tjtG3MBz5xTwlo8IcW26iUJPN7sCj6JrTN3?=
 =?us-ascii?Q?nJ2CWulSzU9NSQIWfP4Agoa4W518554PoY8Fw1QwSrX3ekFiYtJe2V4ZeyGw?=
 =?us-ascii?Q?Z6s/tL59eDntflL89XhDa+A+f+jblNqNPdjRwuIlfLbo5hIPZHqkpRvx9Hl6?=
 =?us-ascii?Q?88QP8GOaOOjcL7nWuzwM2bZMu4zosX0FT/ZLG0GY6du/1mTy6Qmbk9VF/g79?=
 =?us-ascii?Q?JImVZYOe+CcYMy8V24OXodKrPDDJ3iIwgMwv1f4bfDfZu+TnmuU0YFlGG6yE?=
 =?us-ascii?Q?10+Q0r15jxnzFqDDem3S5Xa6AY4LMHkiw3+2pPkamXS5cCcXDej4fQA0i7Et?=
 =?us-ascii?Q?RO3S8QS+CvKTB8A+xf//hii9CSOlMTMDGev4eql201XYBnUtYRNXuZZ05IBL?=
 =?us-ascii?Q?WDQ92dYsuZ3jaabVfwJwJYdlGecmY3xQ8J/CRWNTmGLC0xDN2W30WULScfjz?=
 =?us-ascii?Q?yEonDwedVxHqN0T+ikph1tLRfh4WH5Zwv/QXRHvx6n+bQXuHPTurD3I/0JtD?=
 =?us-ascii?Q?I9FRNiN16UPPVV5e0Ysisi1eeniZ7kDPBYNU8ZIERS/C24aa80guwjHtgEax?=
 =?us-ascii?Q?6945t0QPS8vCvnu35YnMEbF03rbDWejsSgzOFLsHPkY69YmC6Sem/f2Iid0Q?=
 =?us-ascii?Q?qJ7St+GY5IIb2NVfQ74trst+H9nwb30c2fCBuEOnEbNKGfAJnvZmyXA6vQcL?=
 =?us-ascii?Q?gQgrKD/lwpSd3RxS5hGm9QRoJ+dqW74U8u8k121y08rcfqE7OStHAqGF5koN?=
 =?us-ascii?Q?meNk022gt+AV6W6X+kPbj9moK+6tgnz97pEHcc+lsn/E7V/eSR/TuMutLgKj?=
 =?us-ascii?Q?wpu8z+yt12elibVfEiZ1tFxTj47RAQNUMienHmOm91+uzaNOvQu/f1Iy1DYQ?=
 =?us-ascii?Q?lzSC/XNrN4sfnnBbYncPKYTP98heG6zJAh9AILYaJ2xu040iYcw+njIkiMtK?=
 =?us-ascii?Q?ssgD4niF02oLFyWrRJ32Ic0kkDaP7Nwr7kVCoYVad8YCB2KAoh8CWU+I+tdx?=
 =?us-ascii?Q?o5R3NCACyeTjKs0+9jTF1JvlCuxd/1qwBz/uoXoLC/fiE70gOmwu8rd7ej/9?=
 =?us-ascii?Q?8mlk6hei9KcREJT6Il7Kc8JcF97VN3FO3B+CHXVDl/xFHE82dC2R8LnSTWCv?=
 =?us-ascii?Q?mRJkxlKsqhXxzQVYddZLloeJTnEwndNk8bTTR817?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daea3466-89f1-4b38-64b0-08dd39d64cbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 04:44:32.9509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0kU5NzIaZ2t5RMj2pOzocg2rRVKTLCPJG4U+EYaNkqUJIykZtAzWZyJpPpjOvVET+0VoUXmqlEyNnd1jWHCZQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
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
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Friday, January 17, 2025 11:50 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>
> Cc: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: Re: [PATCH 2/2] drm/i915/lttpr: Enable Extended Wake Timeout
>=20
> On Fri, Jan 17, 2025 at 11:18:50AM +0530, Suraj Kandpal wrote:
> > Usually retimers take around 30 to 40ms to exit all devices from sleep
> > state. Extended wake timeout request helps to give additional time by
> > reading the DPCD register through which sink requests the minimal
> > amount of time required to wake the sink up.
> > Source  device shall keep retying  the AUX tansaction till the
> > extended timeout that is being granted for LTTPRs from the sink device
> >
> > --v2
> > -Grant the requested time only if greater than 1ms [Arun] -Reframe
> > commit message [Arun]
> >
> > Spec: DP v2.1 Section 3.6.12.3
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +
> >  .../drm/i915/display/intel_dp_link_training.c | 49
> > +++++++++++++++++++  .../drm/i915/display/intel_dp_link_training.h |
> > 1 +
> >  3 files changed, 52 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> > b/drivers/gpu/drm/i915/display/intel_ddi.c
> > index acb986bc1f33..96cabe618678 100644
> > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> > @@ -2645,6 +2645,8 @@ static void mtl_ddi_pre_enable_dp(struct
> intel_atomic_state *state,
> >  	if (!is_mst)
> >  		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
> >
> > +	intel_dp_lttpr_wake_timeout_setup(intel_dp);
> > +
> >  	intel_dp_configure_protocol_converter(intel_dp, crtc_state);
> >  	if (!is_mst)
> >  		intel_dp_sink_enable_decompression(state,
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > index 8b1977cfec50..c113b0be259e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > @@ -135,6 +135,55 @@ static bool
> intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
> >  		DP_PHY_REPEATER_MODE_TRANSPARENT;
> >  }
> >
> > +void intel_dp_lttpr_wake_timeout_setup(struct intel_dp *intel_dp)
>=20
> Please move this function to drivers/gpu/drm/display/drm_dp_helper.c
> Except for the intel_dp_lttpr_transparent_mode_enabled() call there is
> nothing Intel-specific there.
>=20

Sure will do.

Regards,
Suraj Kandpal
> > +{
> > +	struct intel_display *display =3D to_intel_display(intel_dp);
> > +	u8 val =3D 1;
> > +	int ret;
> > +
> > +	if (intel_dp_lttpr_transparent_mode_enabled(intel_dp)) {
> > +		static const u8 timeout_mapping[] =3D {
> > +			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_1_MS] =3D
> 1,
> > +			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS]
> =3D 20,
> > +			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_40_MS]
> =3D 40,
> > +			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS]
> =3D 20,
> > +			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_80_MS]
> =3D 80,
> > +			[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_100_MS]
> =3D 100,
> > +		};
> > +
> > +		ret =3D drm_dp_dpcd_readb(&intel_dp->aux,
> > +
> 	DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_REQUEST, &val);
> > +		if (ret !=3D 1) {
> > +			drm_dbg_kms(display->drm,
> > +				    "Failed to read Extended sleep wake
> timeout request\n");
> > +			return;
> > +		}
> > +
> > +		val =3D (val < sizeof(timeout_mapping) &&
> timeout_mapping[val]) ?
> > +			timeout_mapping[val] : 1;
> > +
> > +		if (val > 1)
> > +			drm_dp_dpcd_writeb(&intel_dp->aux,
> > +
> DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_GRANT,
> > +
> DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_GRANTED);
> > +	} else {
> > +		ret =3D drm_dp_dpcd_readb(&intel_dp->aux,
> > +
> 	DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT, &val);
> > +		if (ret !=3D 1) {
> > +			drm_dbg_kms(display->drm,
> > +				    "Failed to read Extended sleep wake
> timeout request\n");
> > +			return;
> > +		}
> > +
> > +		val =3D (val &
> DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK) ?
> > +			(val &
> DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK) * 10 : 1;
> > +
> > +		if (val > 1)
> > +			drm_dp_dpcd_writeb(&intel_dp->aux,
> DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT,
> > +
> DP_EXTENDED_WAKE_TIMEOUT_GRANT);
> > +	}
> > +}
> > +
> >  /*
> >   * Read the LTTPR common capabilities and switch the LTTPR PHYs to
> >   * non-transparent mode if this is supported. Preserve the diff --git
> > a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> > b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> > index 2066b9146762..cd4e0d6db6ed 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> > @@ -15,6 +15,7 @@ struct intel_dp;
> >
> >  int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8
> > dpcd[DP_RECEIVER_CAP_SIZE]);  int
> > intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp);
> > +void intel_dp_lttpr_wake_timeout_setup(struct intel_dp *intel_dp);
> >
> >  void intel_dp_link_training_set_mode(struct intel_dp *intel_dp,
> >  				     int link_rate, bool is_vrr);
> > --
> > 2.34.1
> >
>=20
> --
> With best wishes
> Dmitry
