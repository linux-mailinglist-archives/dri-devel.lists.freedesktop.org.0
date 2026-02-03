Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LtsJWB8gWnBGgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 05:41:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46619D4737
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 05:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC61C10E507;
	Tue,  3 Feb 2026 04:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6mqVQ8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C0E10E507;
 Tue,  3 Feb 2026 04:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770093658; x=1801629658;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kiSO+Or/OnZEIGjuUltfRgnw/6SdnU7T38z3TjBAlbQ=;
 b=D6mqVQ8M/+KWM4u95cLUb+CcVSl5lL2atjecxdNXq+VFTNRyX9Y/JNHf
 +8OXs4YO0O2j7xA6e5buVVXNCVkhZXk16YTKuD+0ZyOB8iGlU66MyMcGt
 PlgBby6DmX9GK8R94ZjpL3cK9rwk8OeYDeqZ0+e6or13LRgcVWSSu5Mou
 6ST/wWcVmJUCW92m8luIKoh0V1sNgW0Um+rvkqR/PdR/Mho8mOb2CaTOM
 ivGk8iWziu4gi+SUFU0ugj87pTwt8HqKJ8vjxjajNRpAXAH53EfnM2hWW
 WZrmi00wJtm4fPo8Lx6+dgk+HYu37VpE673A6qhWelAzZUsv3vK41FcQc Q==;
X-CSE-ConnectionGUID: ZSwgOx59RiOgZLss7I/ycg==
X-CSE-MsgGUID: eBJUHBVASgSe9QgtZh9MIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75115364"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="75115364"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 20:40:54 -0800
X-CSE-ConnectionGUID: q880mkBWRl+4KL4h7iEsdQ==
X-CSE-MsgGUID: koC1U3/HQAqMupK6NcWq8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209486311"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 20:40:52 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 20:40:51 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 20:40:51 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 20:40:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJv+pwAPJjPK+ca5p2P5MjKjEe2SIcmsCufDtNCBxFPrwyEDJr2QdO0nxCLvBzglG0qFKz4MYgpdVjJFfbzLyrbzZH3uFXot1J6mGZf+Xn7rNIHJ50uRJLH9N8BHDJ79OH2+M6pLX429WZQnzy2uY6EOH5W35uRbn7FSmYhh3xwsSpnI+R9aC4OZyyXhasad++kqcbIG1EhZuYdNf1w7SKg9nHnoNn/jeYJahm0PLCAY0Exi9FRNOsU5zwWO18PqIE03q5j061Sd5F0gEmVPJcJUQFeDjzr1zP2JSoHbKJ29hr6UNlZDX4gIPkaQPth+/NGpocB5JKCaNpKg2HDDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lj3S0sX9AVoTRICMZhpz6ryLFDdlLxdEuhMAoa3Qiug=;
 b=gYzAdQHgKG/66paGM6nYVAqO0avvJvscIyl8mCSESJHZIsYFz+phqDwyH0o3O+ZGmLPBRQuEPu0F0hs3P42uvroBU4ODIbfF0jWoQnWh1MveFfhPELpyt97grW9oKjW2gDU0n6g9zFf3ndskZfoVMfGxxaaIKoDQpX+7BE2bFcO1GY2OteaDTpoHmdl7TeRrMft5f6woYRdJlkQDrgPmgAskcbf1HpcoZYiWA4+igtjnnT4VniiLnyZu9sfj2Bto8SRD95vHHOe8t2O/uTq1hlZhgY+HHwNDmNpzgjATnIiqWrrluVPYueGvDz0Jbb79A7LSKRSU6PR5rQykOQM8lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB7571.namprd11.prod.outlook.com
 (2603:10b6:510:27e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 04:40:43 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 04:40:43 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Rahul Bukte <rahul.bukte@sony.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "daniel.palmer@sony.com" <daniel.palmer@sony.com>
Subject: RE: [RFC PATCH] drm/i915: i915 null pointer dereference
Thread-Topic: [RFC PATCH] drm/i915: i915 null pointer dereference
Thread-Index: AQHchf/fbVnN+n7Gs0+CQrzrRhBXQLVwgWow
Date: Tue, 3 Feb 2026 04:40:43 +0000
Message-ID: <DM3PPF208195D8D5D24B6BA0387168AD2FDE39BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260115015454.3226069-1-rahul.bukte@sony.com>
In-Reply-To: <20260115015454.3226069-1-rahul.bukte@sony.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB7571:EE_
x-ms-office365-filtering-correlation-id: 2c559f65-55a6-4e74-70d4-08de62de6444
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?qqD2hQ9761YffbsYMTwWjsEmWT/fBGDi8w7rqhrjLGsoaMWGkOSr/V7HpE9m?=
 =?us-ascii?Q?G+9g0oiVjOFPhQIX21b5qanB2LL7zhJEaxbv8WHVIMTJurCIsYCkzwwniOxJ?=
 =?us-ascii?Q?irXaLsxRRXjpeA2mXt46ZlYaJwpSX4UIJGZhbWuNjy5WQrmlxDRNQo6DaiCo?=
 =?us-ascii?Q?vqExgKDGdrgq9aTcov0HwTjKQxybI9s6bTO81SD5vRqzEAuQR/7ags3tKL0r?=
 =?us-ascii?Q?ZAjvftuFlqoFGlb8RjCVBx6yc+4f/+wgz3TD5+TxDBH0zQ3JXQ6zViztfO8D?=
 =?us-ascii?Q?K9FvNd5Zf2JcO5notv7Sutt19jP4NRtFXdGNhL27CT2VV85M6rsIxHkrJBmC?=
 =?us-ascii?Q?BZMKfGpUviq8BmQXmRtl+xodyKLurXt2ItboNaUEsB2dp1cJ/WrAhV3dJPEA?=
 =?us-ascii?Q?59wFGqVeo8b9bLPhmymtNBTFFL6nkkfGb4l6nMPLvGQ36kLomyxxPxASFijK?=
 =?us-ascii?Q?G4Jgr7DHRMRDP67xZwCx7Xos/qEPJVp5UfbvSFo14mAqHbXbI5kmMNram6qR?=
 =?us-ascii?Q?Fu5OLJ2OFZXw3+eDHZfotSCAPlpWZud4puGiT/dveN8vgyXkhy/Pk3zPS8Rt?=
 =?us-ascii?Q?PtLKEjMzRANQKcjwacEBhlORGbDfeiI5i/712t4tQJNJxBpftLWWpyxYR3hP?=
 =?us-ascii?Q?oYMThD5ZjQTBWLYGeKIo7yVYGZ8cYSIyJ5TIOgN7fiEeBgmV6oEjeWUWjuYY?=
 =?us-ascii?Q?iGeLKQ3d/TAzfBIfssLRNfE+JQtOlkvcTaoB5RkzR0GZkFf99wejy0PNY3BO?=
 =?us-ascii?Q?ecYtiJiWgaJDMS5tzROIuqGv/S7V9qp6YKXt+sYpfP3nH2vVI2c72sBbI0s3?=
 =?us-ascii?Q?dF17rU2oogT6YU//x/VEsKLc8/W7FLLcFSlrh2Mv5JRvjnoTBBJjDi62mRYA?=
 =?us-ascii?Q?DwOpsLm8sDpxM1f+9xyh82KQHbzjkXl9eEkpDAAsKGRW0dnk1Eec7OnryurM?=
 =?us-ascii?Q?zu1TTb/9cZ87yOMvp9tkeA8AnFsUqYVRalEYPl8IojqbJdBLd+wSifbxyvlu?=
 =?us-ascii?Q?tnVXB+ReK/mocqMfuleHUQy4iD03tqRJeZ/I4hfOiRZ7CWjCC0n7pDDxqvcj?=
 =?us-ascii?Q?rR9ndV9hNQeq5h/9Gje6LceJTez+Kak15wh5DLNaMIcJ5HuRaLpfUuJQ+sPN?=
 =?us-ascii?Q?Lq7YT0mVCtwFNpOeXlDG8GyJaQBdsnUkHriJX4XXrg1nNjXw1+qcccYt5zDb?=
 =?us-ascii?Q?k9LA9hlXl2O2++SuIILknKoK7DoGjtuADJ9GsFm6EB5rFgX3/el+tPAQD47S?=
 =?us-ascii?Q?nvK6t845+okfBxMbL5JcRjel1huCNKTJF/GWN8De6zYlInCeUglkZxgfF4vY?=
 =?us-ascii?Q?953LzClfvFhbUZeuCk4OZJhCSRDtIMCeFvBlClPHT13QowVewAzNVhJqtFYR?=
 =?us-ascii?Q?rYb9deF6NHKoiW4EfrJ+8PDNtJJ4rzxviS3pzsFmx7zaCF6cmu0dfoqHEGWN?=
 =?us-ascii?Q?+LkdVEsrmh0+K5XgJHz80Zmi7iwW3eRw1hnDOPi563QRM31crV+t2eavPkVN?=
 =?us-ascii?Q?ERcux1mlTducTwvftjwB813IuBS8jfhs6xtxmSYWUf2VDnAf5NtTMl4qccQB?=
 =?us-ascii?Q?DVJX1r6CE2jR/yynhNdckbIGvIkrffAdmjb9+F5c76dVhC7OMz61K+JgSM+T?=
 =?us-ascii?Q?voAucfv/a2QgIHVKgjW4ElM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CUAL9pVXBCopH1MCUlQbwAoYFrGSAwxHLUB933ix21hlt21hbua6/8Udxphv?=
 =?us-ascii?Q?mT30kk5BMvLAjAHwiAspx0dBh3/yfmdnAvpdSGRyw0/1cc7diIcwtgnHEM7b?=
 =?us-ascii?Q?r8kSaJpV87bHBxt4RJRoGvz0HQTFs2pEH+eycXBjoSlhXwjPgrNH+YmuhF33?=
 =?us-ascii?Q?Mm/VrXrp9j8WpIjdTA2pj0EbeNXwjX+hY//sAu13V1BqY5f0AupEcfYqIag0?=
 =?us-ascii?Q?Rif1985gdPonr1TkcGKx95YLaOMznv8Utoyg3eUODW6omZwJqqtWjU0vCu8j?=
 =?us-ascii?Q?iv1d25hKjcmYwG3san+kSPZz6qu3gvGrMhV87wzQ747KTF82l0v8Gp+bO2pw?=
 =?us-ascii?Q?9gaj/toeTc15++igmOPoB1WWtYgtBRuc3xyAi4lzlK4cLgleuoU4lcZxboGP?=
 =?us-ascii?Q?17mg/TdNClxDCt56eCTHQZEqzrSmHO5x8yp8keuJDUmOf7lqCCzSYR6Qmv34?=
 =?us-ascii?Q?eLwRrMAIy3Dgayca3okFBoJL3wqTy4wt67TudJ8xU3s8eOyySNHOj1VYUC05?=
 =?us-ascii?Q?Th9p1O9YiNQR74PRhWhl+yGyYVea/r4edyowhMHzK+kPmGhylfUm6D9cNmSH?=
 =?us-ascii?Q?+IuMx7vzYlYggRrRr0LLhN9quHiN22o/QvlLz+C60L6TdtlxG2dhi5kUlUmH?=
 =?us-ascii?Q?jU6FwTGjA0vwR7pjeQOkppjehgHD5UEvgS3UwBws8eMkK1U6tk/HFMqyGiSa?=
 =?us-ascii?Q?jyijFf1IA3TpLabQr60N42W5labeoTUkw/lloT8zir0effP5RGEHzmcNk9DV?=
 =?us-ascii?Q?k+9o1JhavRjGdZOYZ4NzzojK2UurujRp7BlWM2l65Xs/tfdZgmIg9PKnAIpH?=
 =?us-ascii?Q?KBItYQPdo3v12somE3QrgLHc/rz+R7rgI6zpOdP9e7grZFSquQump3yVqYlP?=
 =?us-ascii?Q?R+6hl4E3d3g5LNxlp7WMjqBgcFNxLQ3Ea0hWDmR/3pFuC/YQzyXoEgOZNkum?=
 =?us-ascii?Q?dWv98WwetFJDwKUq047xPcWpx/jl52D9sk4eAiROdBj3V94ha6ZnWQ46OeOE?=
 =?us-ascii?Q?8P3s/yG38oyNKESn0R892FyAq1P5jfZViDCfnddxgEyXlTrXbWPMA6LmLRr/?=
 =?us-ascii?Q?++sPwxm2zzXGo2TlvL3uV4Txx61GrSlyt7iWEIFwsIVk/MhkxDaTrMRcieDV?=
 =?us-ascii?Q?Y37/hwRhWiL+UAoG+AH/6s7MtPnDVJadYjO/VDSk/LPAB56sQhJYK4gfPW/O?=
 =?us-ascii?Q?O7hQgS100CJNciCuXELAXTx0mGErcFJIS4IcwP45pm43NvHnloyT/3PRbNp4?=
 =?us-ascii?Q?s99MfJ7B7QuaY8O49pBpRZ8Mq+jtQRNxgpMRdXyurHhEuvtqzsZpB4Iyg06w?=
 =?us-ascii?Q?C+MDo05Etg7+ux1rZ2TCufDSPQgvw9v79jEFDGIBdvmmhfoZHlzP306wz5lD?=
 =?us-ascii?Q?Ofx6PslwoxTk28La4ODwr1f0/lhwYrcGfW8U/KrQ+nxUuO2OYquHQhMyg4fj?=
 =?us-ascii?Q?X+2pVxiKoyc03UrdldphfB++vI/8dBxb97Dp6SYDV/AR6ZgejsQLX3voDDej?=
 =?us-ascii?Q?iGxh93zmeak0Ha7mZqv209R52Lj+Om9bnAoggjhQvjNoSaprXOnUcYbokzL3?=
 =?us-ascii?Q?QmQzbnxdVVTfNJ87qsdRkx8M0yYVJeod0A/Cq1+B2j20JdbzKYveung8wlFY?=
 =?us-ascii?Q?gUa9r8ktsazf2iRjb1z0LC0YGsjgXm/QOIvQaY+OPllB//1fkyPS6+/5xn5N?=
 =?us-ascii?Q?WjfA5q+d7t6afpevEbPMZljSmaN04mCudsr/3ldsQZgWQm9YryTioIPVj/tu?=
 =?us-ascii?Q?CfEkHKnv8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c559f65-55a6-4e74-70d4-08de62de6444
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 04:40:43.4316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CS+ZVQi5HcOqDQ+n7YqK6WHZzwmrhkYVErYQ2j7N/cdV9/Mql6vEfOM4Qm1eoOsjQVT6YSyuHzOZdYCSmBP61A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7571
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,DM3PPF208195D8D.namprd11.prod.outlook.com:mid,intel.com:email,intel.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suraj.kandpal@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 46619D4737
X-Rspamd-Action: no action

> Subject: [RFC PATCH] drm/i915: i915 null pointer dereference

You can remove the RFC patch this patch LGTM from a solution standpoint.
You need to modify the subject to drm/i915/gt : Check set_default_submissio=
n() before deferencing it.
Ill be resending this patch to get results from LGCI. After which this can =
be merged.

Otherwise this LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>


>=20
> When the i915 driver firmware binaries are not present, the
> set_default_submission pointer is not set. This pointer is dereferenced d=
uring
> suspend anyways.
>=20
> Add a check to make sure it is set before dereferencing.
>=20
> # echo +20 > /sys/class/rtc/rtc0/wakealarm && echo mem >
> /sys/power/state
> [   23.289926] PM: suspend entry (deep)
> [   23.293558] Filesystems sync: 0.000 seconds
> [   23.298010] Freezing user space processes
> [   23.302771] Freezing user space processes completed (elapsed 0.000
> seconds)
> [   23.309766] OOM killer disabled.
> [   23.313027] Freezing remaining freezable tasks
> [   23.318540] Freezing remaining freezable tasks completed (elapsed 0.00=
1
> seconds)
> [   23.342038] serial 00:05: disabled
> [   23.345719] serial 00:02: disabled
> [   23.349342] serial 00:01: disabled
> [   23.353782] sd 0:0:0:0: [sda] Synchronizing SCSI cache
> [   23.358993] sd 1:0:0:0: [sdb] Synchronizing SCSI cache
> [   23.361635] ata1.00: Entering standby power mode
> [   23.368863] ata2.00: Entering standby power mode
> [   23.445187] BUG: kernel NULL pointer dereference, address:
> 0000000000000000
> [   23.452194] #PF: supervisor instruction fetch in kernel mode
> [   23.457896] #PF: error_code(0x0010) - not-present page
> [   23.463065] PGD 0 P4D 0
> [   23.465640] Oops: Oops: 0010 [#1] SMP NOPTI
> [   23.469869] CPU: 8 UID: 0 PID: 211 Comm: kworker/u48:18 Tainted: G S
> W           6.19.0-rc4-00020-gf0b9d8eb98df #10 PREEMPT(voluntary)
> [   23.482512] Tainted: [S]=3DCPU_OUT_OF_SPEC, [W]=3DWARN
> [   23.496511] Workqueue: async async_run_entry_fn
> [   23.501087] RIP: 0010:0x0
> [   23.503755] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> [   23.510324] RSP: 0018:ffffb4a60065fca8 EFLAGS: 00010246
> [   23.515592] RAX: 0000000000000000 RBX: ffff9f428290e000 RCX:
> 000000000000000f
> [   23.522765] RDX: 0000000000000000 RSI: 0000000000000282 RDI:
> ffff9f428290e000
> [   23.529937] RBP: ffff9f4282907070 R08: ffff9f4281130428 R09:
> 00000000ffffffff
> [   23.537111] R10: 0000000000000000 R11: 0000000000000001 R12:
> ffff9f42829070f8
> [   23.544284] R13: ffff9f4282906028 R14: ffff9f4282900000 R15:
> ffff9f4282906b68
> [   23.551457] FS:  0000000000000000(0000) GS:ffff9f466b2cf000(0000)
> knlGS:0000000000000000
> [   23.559588] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   23.565365] CR2: ffffffffffffffd6 CR3: 000000031c230001 CR4:
> 0000000000f70ef0
> [   23.572539] PKRU: 55555554
> [   23.575281] Call Trace:
> [   23.577770]  <TASK>
> [   23.579905]  intel_engines_reset_default_submission+0x42/0x60
> [   23.585695]  __intel_gt_unset_wedged+0x191/0x200
> [   23.590360]  intel_gt_unset_wedged+0x20/0x40
> [   23.594675]  gt_sanitize+0x15e/0x170
> [   23.598290]  i915_gem_suspend_late+0x6b/0x180
> [   23.602692]  i915_drm_suspend_late+0x35/0xf0
> [   23.607008]  ? __pfx_pci_pm_suspend_late+0x10/0x10
> [   23.611843]  dpm_run_callback+0x78/0x1c0
> [   23.615817]  device_suspend_late+0xde/0x2e0
> [   23.620037]  async_suspend_late+0x18/0x30
> [   23.624082]  async_run_entry_fn+0x25/0xa0
> [   23.628129]  process_one_work+0x15b/0x380
> [   23.632182]  worker_thread+0x2a5/0x3c0
> [   23.635973]  ? __pfx_worker_thread+0x10/0x10
> [   23.640279]  kthread+0xf6/0x1f0
> [   23.643464]  ? __pfx_kthread+0x10/0x10
> [   23.647263]  ? __pfx_kthread+0x10/0x10
> [   23.651045]  ret_from_fork+0x131/0x190
> [   23.654837]  ? __pfx_kthread+0x10/0x10
> [   23.658634]  ret_from_fork_asm+0x1a/0x30
> [   23.662597]  </TASK>
> [   23.664826] Modules linked in:
> [   23.667914] CR2: 0000000000000000
> [   23.671271] ------------[ cut here ]------------
>=20
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index b721bbd23356..ce8cdd517daa 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1969,7 +1969,8 @@ void
> intel_engines_reset_default_submission(struct intel_gt *gt)
>  		if (engine->sanitize)
>  			engine->sanitize(engine);
>=20
> -		engine->set_default_submission(engine);
> +		if (engine->set_default_submission)
> +			engine->set_default_submission(engine);
>  	}
>  }
>=20
> --
> 2.43.0

