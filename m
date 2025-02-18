Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03B9A3A964
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 21:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FD210E3E9;
	Tue, 18 Feb 2025 20:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBwyzqWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CAE10E0FD;
 Tue, 18 Feb 2025 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739911232; x=1771447232;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xeW83lEpQFoOjB3eAJqNnY4ePpBilBNBgwO83bdN0VM=;
 b=IBwyzqWTT7z+CulOm862vwfoqjYBIYn6iwXf2XPoXiCqi/aUGmL7BCxV
 Tkq2K77O77giCJmHlg1QoRZhq0Cl9HfBrUDC56kQ7GPU1KWEGs6kuj6MY
 o/vU6lei9KNUvcFsZ56d3x+/+PcJj4kXri3q39H4Ztq0AFW2Yk9Yxe5Vk
 9bexou0eCLQ/9FJAX0sJEp0UGqCwN2NV17YJ09UPBma6qUiS4ulPRL7XT
 tfLGc108Hf3Lo/nVIjNEY82ZCFmMHQA4AzNACVVK5tnZl/70AjM0g2JGw
 F0EH/d2CRRN1FbvhhkOstIu1i6v5LuW1Q8mvxySHZlBHBViMQUiVSDgdU g==;
X-CSE-ConnectionGUID: FGj9H6JbR7mzyF+iEZiyXQ==
X-CSE-MsgGUID: yMmFfO/sRBOJgvFyTgp0hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="58165398"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="58165398"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:40:32 -0800
X-CSE-ConnectionGUID: yYvTrgSKQUm/qmdkr3nZYw==
X-CSE-MsgGUID: FSMSLwuvTBGI1XU5MtOhAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="119484676"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:40:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 12:40:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 12:40:31 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 12:40:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYQooZfplPKA+GhVR96c57T0LhJulnqMsO1XXad326gMNRJRFfijLD747l3ch2MQvwgaSZNZ9sk1J5pYy1HAfwuxNQxUBZVrcvDyx19ELDaS6l1Tj36OcQOQpRuIZ6V7njIjONkfAEKz8GG6+aAmcV2xjY/Dla0aTXdNMIV7G4hFckEQSYSzhheGPsLbCnQlF6HTUjnXb4lY4uHpdUPzEEMNmTcnAyIxss+mWcRA46Ns1COVOR+BDWQAvP5HeBvF2KeuqCLH4cqlcsgAsAqqzuxrNARaEf39J79WhLcJE0yyKTsPEmEWN85gl6zK/nac/xqWx0JLYz2di6H2dMSTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XUxIkvAzbjA4CAEdBoRujrAHVAywEItIkSTFyUQoh8=;
 b=mC42RuyPYxesk+IgmRuVtq37vBmAVm5/IeUFQIUv0kOnrYRH8wsaI+pB6sv0NL+KWeprSnrc3Rac7yj7Uju+Rgpp2nKw3KnEyodel7M24ufCwh7UIDOKnybOhoWtA3YlWx+O9GLx0XxDCyuL3eM/sWqF39uHZUQS3sUam9RM3NC9Fn2BShCL4W8D/pYFsX/N+JsK4Z3Ow2I3CZrXp8qKjvZGxCQtLB4clTcgZFqy7LkY+FO/FcPIfhX4/xBlpQ/SZ3CD42fuNJ98eeb/6hYFx4SJyyq3n1dtoiU2vau88lediFJ8ma3PWsh9gpOjyQjOLdQFCsIiEXTf6seXb42hXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB7178.namprd11.prod.outlook.com (2603:10b6:610:143::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Tue, 18 Feb
 2025 20:40:08 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 20:40:08 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Lahtinen, Joonas" <joonas.lahtinen@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/4] FIXME: drm/xe/xe_drm_client: Add per drm client
 pagefault info
Thread-Topic: [PATCH 3/4] FIXME: drm/xe/xe_drm_client: Add per drm client
 pagefault info
Thread-Index: AQHbfyBc/9UysHzYoE2YrFXxmqnAwrNLvOaAgAGtvICAABs40A==
Date: Tue, 18 Feb 2025 20:40:08 +0000
Message-ID: <CH0PR11MB5444C499414CD35A09913FF8E5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250214203757.27895-1-jonathan.cavitt@intel.com>
 <20250214203757.27895-4-jonathan.cavitt@intel.com>
 <Z7NrZYE0lYBgXjJ-@phenom.ffwll.local>
 <41dd9e90-9ba1-40d8-b297-a8c4c40f44af@igalia.com>
In-Reply-To: <41dd9e90-9ba1-40d8-b297-a8c4c40f44af@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB7178:EE_
x-ms-office365-filtering-correlation-id: 474cde46-2e5b-4573-55c6-08dd505c6f16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3/0g1U3afwVDfwJyaFtXmITo3IgZN7zffEpZJusioL5yv0ltZ3oz9t8r08CE?=
 =?us-ascii?Q?i86iaihDOoszskp+pTVsuZcVlWCdyMP3AFX2sEkg+lHJrzWCEyfe+Xai9PH1?=
 =?us-ascii?Q?/MB6MjVKMb/bSKyk/pfUzP+Kt8jwIswmmo4aZ+YE/Pwhvk7lO1UDy+tw57H3?=
 =?us-ascii?Q?rFs6XgxxXhCIhshEzCNYrXE8p8FCkzVsRP+iqVlnV7ezxa/qgKohJpCt8IHs?=
 =?us-ascii?Q?YiozuthPEMzdf1yBX0TJ16sPj9EL7/QMZO/e1v0v6l6gAKpOmBvRybu2je5O?=
 =?us-ascii?Q?XBKWHd1au7tWPdrkO6jVhxo2yrif6HrDlJmlnk7GPvh/M4BAKM0ZZ3fAJELq?=
 =?us-ascii?Q?P3JEYPu56ihjmXst+p4XgyJ3us8VEv0yHPR2Ei7h2lACaOXheTtnyPgRghEp?=
 =?us-ascii?Q?omYjutsMBlkMjR8i9XhBH10TEB54vvaeWu0tkPy+S1dt+QlsWc/3AvykPgnc?=
 =?us-ascii?Q?E3E2HzDN5mk1akIR8wSh4aQC/pEaGZlAcE3E9rqmBWDL3Q+B6xG6OcUt/jjp?=
 =?us-ascii?Q?qkfDoaZ8x77k1tWSPWy0KZvpgaKfn/alMfXiVoRjIt1HBVDgehI+r0G1T1Ig?=
 =?us-ascii?Q?GFfJLVmsM1sJbN2NhoDYmeh4eVc0c5I1qzUWsc7+78+Q49eaKaM7F4ypmxez?=
 =?us-ascii?Q?Fa9LqMGqitMgdTcLpN60LZjXMjxvTv6Mk/Aiz5zeUrudrp7Q1VnHaMoicB8k?=
 =?us-ascii?Q?Nqh55Ii4kWlispDNHFa909Fam5DqSCQUwF8NzbYiKiI4WUWrOHa4qwui1a1V?=
 =?us-ascii?Q?XyleQktC/+WWo5FaozG1cHheE7xGPvQsXH2Dwv35/as5Lm45aMxUbKEMq3Fp?=
 =?us-ascii?Q?L3ePVemrmXOnns/SayMTO8uN+fB2lyD7oq83wtE32qdiO4wivQYx9GypwnG6?=
 =?us-ascii?Q?jxTd8aJRypTkMtu+th1IWJT26uQQJ/G1uOK2qYyCmACh/pZF7IRctX0o3oYl?=
 =?us-ascii?Q?8VBX1wqnvB4w6TWLXh4tnDOOdjisO/1im14BBktksaHg2aaFzyX9Q6XexSRk?=
 =?us-ascii?Q?ai9dAlFFk+xjaKvI8nv+BYVRjEhTNMUp1piUpmxWa1T+KIlzruA0vxQLoQSj?=
 =?us-ascii?Q?xm8tWedrUcFLL5NbKBDPzKfCGbwyMvn80Qiyc29kbQFeopaxaPH1QDoKzFMf?=
 =?us-ascii?Q?TkxDP3C6GW+AGzoGzaXwSj/DFnJu534rd4EvPCAm8luDLbfjkxzsDy4invd+?=
 =?us-ascii?Q?8o+wl+CDflPj8bvb1IkzPovGwvOkvW1oazh1Ol4YXbZuz+QGIh33/MPRaJFb?=
 =?us-ascii?Q?TAKyutPVCKvnLHHktuqw8OseFcxER5l+p9L5cMbI2Rq8tXIKpgO8vaCiL/Ds?=
 =?us-ascii?Q?Zd8LajUpJoMRk7y4+vM+dfrrqsb/OBjJSgTLpJd5PqTBd6oiELaRMU/an2bV?=
 =?us-ascii?Q?V0bpN3YnnyLqOCdL5UZM9R5NydKpuKhx4jzpSAZe1t7ClOMkIqfPOHzK1gJE?=
 =?us-ascii?Q?+OQMkhgzqVUWJGuamPpLNUheB3olYDL7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HO+ue/Fmqnc98wSb8u/JBdllklXJ7U3ZFnNde9sj42m+ej+3C9OZICyR8aZp?=
 =?us-ascii?Q?8TgsTa75IMX40RtbZ4i2j/uBWoo2TxVOm4JGBvKYF3jD5lRWyEjcyuog4VM1?=
 =?us-ascii?Q?F821BIuxG6oEgDYu6+9+8tqlqlT2fYtB0iLq3cZRyn80y5OQplqbskHbIOgb?=
 =?us-ascii?Q?4bFxSrwP9/Pk2CRlmfxHgPSkW4Q/f9awri5mAH+hgaebux6rql3fRu+TmgBA?=
 =?us-ascii?Q?ysp1VdKTTvU9HkbzQe0FkJhBwjgYvtGKnt1o7MMsvnJU0fgu7pzOhPYodRdo?=
 =?us-ascii?Q?Z5sqmSc1S+XXmdImFMEN689vM8CYUgvZuThA36gqUvyzSgta+3zMGLf1Ih7/?=
 =?us-ascii?Q?Xj9LmreychMcFVeL9orfO/wEZNHwoMPNaGzHlc2FuKpZ/EHLwKmou9P2Dbr3?=
 =?us-ascii?Q?fhugqDpc+BMI7p8bTzZJFH19j/YV0YxlJefImBaBXOunvCDKcUtDt1lDrRI/?=
 =?us-ascii?Q?37YFKNji9dDWurDd4we9pdVUYUkbyXHdR+HyAz9VuuszwbyRiFYqrLRdaUnl?=
 =?us-ascii?Q?PtDcyXOLiPghAmbgZmN0b40GQagV2qrdZFAnmgpCST87ItgUzOlJhOpEataA?=
 =?us-ascii?Q?xyKzoP3UpMHF5hnoN1nVtgbTjs6hya9Vw8ruXlEp3BLYmogIYnHuJWcc4DX9?=
 =?us-ascii?Q?3m1sFiy3v9DI/xRJ+iTSfo8XF2LE9hTF1Vdc8Yf8RbqKjyLzfBSXLzMAwbaJ?=
 =?us-ascii?Q?T7KI7B0fwcIdiuf4ntGXHLIrMhostE44dqd2olQvyeBkw7gmJ0Y1gMAcaHtA?=
 =?us-ascii?Q?uuOj2yUFoVPX4H0YVCSMLgPUWOeV/SEkHS57hQpjc0SXLXxHZtzJcGYpyKkw?=
 =?us-ascii?Q?nfiHcNjoFQX8ZTQHSaeFOs6is5R0w5Zn4XaeKKut9r4U+xl/W3y1gGAAoxH5?=
 =?us-ascii?Q?d4iLgSwEQbhWZqRiWGkBIqYK4NYtZmhNq8OCDYiXpyebcWWquMlVNPu+9qqN?=
 =?us-ascii?Q?OfPlh7WGtg/siF4JmHOXIez8BcTPKFaExxzxgA+HOGXd7SncCYxdxJEHQ4Yb?=
 =?us-ascii?Q?lOdAQymFQkNRnm19kqrzHBFhVqFyuDesx0IDovH3kASFdRTYd6yaX60cP+jG?=
 =?us-ascii?Q?3+jGNJqSG8aCJ/DoSgoOYafi+tW0R5JGF24WVFKsQ63WzHdWWA/D/yCQvXiS?=
 =?us-ascii?Q?CSy7k7XkgVxxpkRMujP4FurIJNA6wEye/o5MzGNfrgu60bHfLzLobveWgaO7?=
 =?us-ascii?Q?qr3TeAbkikuwR7ao1xgqd6Y4GcV4hRCCLBilioCwVNLIys1lXiSi6lAgdB1A?=
 =?us-ascii?Q?knwmABwXR3jo89KvuAOMrkCPWss3PI0IxW2do1yDN6zbXURMK44Z87pb6n19?=
 =?us-ascii?Q?Ms1S/s605Cl6kpRozTLfXOxskhYBynxeZoQwH0bbx9kCB4t5K6kPFJJBwy6Y?=
 =?us-ascii?Q?95cCByjvCuxpYsuCFBFmP9sf0BDGowwWzXavp2pOySh2XZCJjVhLP+3O6SF5?=
 =?us-ascii?Q?0ur48a2vRenqDv/vv+7t0Rb8D2FirBaQCTjyE7+UliuYIUy03NAG3hgquv7/?=
 =?us-ascii?Q?0naS6S4gSzd1++EmuUJe+98ZOdQifuiPdYwJZ0yZ7pTo6haExbkS5GC34ArT?=
 =?us-ascii?Q?Aw/Ad1+Bb8ZHEsm7u1S3bCB9mLO7blpv0c2i0Wc/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 474cde46-2e5b-4573-55c6-08dd505c6f16
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 20:40:08.7106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GEfogKqTrLVClLle/k7lZJlT3nnl/ANbiTG3/cNOaYynYYZZP7rEZsX7+Tc2ENC23F2f/YLitfcjoJvUova26H0onqV72s6kdr4TSDlchjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7178
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
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>=20
Sent: Tuesday, February 18, 2025 10:39 AM
To: Simona Vetter <simona.vetter@ffwll.ch>; Cavitt, Jonathan <jonathan.cavi=
tt@intel.com>
Cc: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Gupta,=
 saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Lahti=
nen, Joonas <joonas.lahtinen@intel.com>; De Marchi, Lucas <lucas.demarchi@i=
ntel.com>; Brost, Matthew <matthew.brost@intel.com>
Subject: Re: [PATCH 3/4] FIXME: drm/xe/xe_drm_client: Add per drm client pa=
gefault info
>=20
> On 17/02/2025 17:01, Simona Vetter wrote:
> > On Fri, Feb 14, 2025 at 08:37:56PM +0000, Jonathan Cavitt wrote:
> >> Add additional information to drm client so it can report the last 50
> >> exec queues to have been banned on it, as well as the last pagefault
> >> seen when said exec queues were banned.  Since we cannot reasonably
> >> associate a pagefault to a specific exec queue, we currently report th=
e
> >> last seen pagefault on the associated hw engine instead.
> >>
> >> The last pagefault seen per exec queue is saved to the hw engine, and =
the
> >> pagefault is updated during the pagefault handling process in
> >> xe_gt_pagefault.  The last seen pagefault is reset when the engine is
> >> reset because any future exec queue bans likely were not caused by sai=
d
> >> pagefault after the reset.
> >>
> >> v2: Remove exec queue from blame list on destroy and recreate (Joonas)
> >>
> >> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >> ---
> >>   drivers/gpu/drm/xe/xe_drm_client.c      | 128 ++++++++++++++++++++++=
++
> >>   drivers/gpu/drm/xe/xe_drm_client.h      |  36 +++++++
> >>   drivers/gpu/drm/xe/xe_exec_queue.c      |   7 ++
> >>   drivers/gpu/drm/xe/xe_gt_pagefault.c    |  19 ++++
> >>   drivers/gpu/drm/xe/xe_guc_submit.c      |  17 ++++
> >>   drivers/gpu/drm/xe/xe_hw_engine.c       |   4 +
> >>   drivers/gpu/drm/xe/xe_hw_engine_types.h |   8 ++
> >>   7 files changed, 219 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/x=
e_drm_client.c
> >> index 2d4874d2b922..f15560d0b6ff 100644
> >> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> >> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> >> @@ -17,6 +17,7 @@
> >>   #include "xe_exec_queue.h"
> >>   #include "xe_force_wake.h"
> >>   #include "xe_gt.h"
> >> +#include "xe_gt_pagefault.h"
> >>   #include "xe_hw_engine.h"
> >>   #include "xe_pm.h"
> >>   #include "xe_trace.h"
> >> @@ -70,6 +71,21 @@
> >>    * 	drm-total-cycles-ccs:   7655183225
> >>    * 	drm-engine-capacity-ccs:        4
> >>    *
> >> + * 	- Exec queue ban list -
> >=20
> > This looks like you're just totally tossing the drm fdinfo format and
> > going with something no one else can even parse.
> >=20
> > I think it's time for some proper helper functions/macros and not
> > open-coded drm_printf for this stuff.
> >=20
> > Also for sure needs an ack from Tvrtko.
> >=20
> > Cheers, Sima
> >=20
> >> + *
> >> + * 		Exec queue 1 banned:
> >> + * 			Associated pagefault:
> >> + * 			ASID: 9
> >> + * 			VFID: 0
> >> + * 			PDATA: 0x0450
> >> + * 			Faulted Address: 0x000001fff86a9000
> >> + * 			FaultType: NOT_PRESENT
> >> + * 			AccessType: ACCESS_TYPE_WRITE
> >> + * 			FaultLevel: 0
> >> + * 			EngineClass: 1 vcs
> >> + * 			EngineInstance: 0
> >> + *	=09
> >> + *
> >>    * Possible `drm-cycles-` key names are: `rcs`, `ccs`, `bcs`, `vcs`,=
 `vecs` and
> >>    * "other".
>=20
>  From one angle one could say the new data is not drm fdinfo compliant=20
> and so existing parsers will just skip over it and do nothing. Which is=20
> not a problem per se.
>=20
> So without going into any analysis of what data is exposed here and its=20
> usefulness maybe drm fdinfo does not care.
>=20
> Then from another angle, going slightly deeper into what is proposed=20
> here, it _seems_ to be adding some sort of logging to fdinfo which is=20
> way different than current single counters paradigm. I wonder if there=20
> is precedent anywhere in the kernel for stuffing logs into fdinfo?
>=20
> My first reaction would be that it feels a questionable approach (how=20
> will userspace correlate "Exec queue *N*" to something?). I guess more=20

The user is given an exec queue ID number when they call the exec queue
create ioctl, and that ID is reported back as "Exec queue *N*" here.

However, it was requested that this be converted into an xe_query query
(by Joonas), so this will no longer be reported through xe_drm_client_fdinf=
o.
Apologies for the confusion.
-Jonathan Cavitt

> info on how is this useful for userspace should be added to the patch=20
> description.
>=20
> Regards,
>=20
> Tvrtko
>=20
> >>    */
> >> @@ -97,6 +113,8 @@ struct xe_drm_client *xe_drm_client_alloc(void)
> >>   #ifdef CONFIG_PROC_FS
> >>   	spin_lock_init(&client->bos_lock);
> >>   	INIT_LIST_HEAD(&client->bos_list);
> >> +	spin_lock_init(&client->blame_lock);
> >> +	INIT_LIST_HEAD(&client->blame_list);
> >>   #endif
> >>   	return client;
> >>   }
> >> @@ -164,6 +182,72 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
> >>   	xe_drm_client_put(client);
> >>   }
> >>  =20
> >> +static void free_blame(struct blame *b)
> >> +{
> >> +	list_del(&b->list);
> >> +	kfree(b->pf);
> >> +	kfree(b);
> >> +}
> >> +
> >> +void xe_drm_client_add_blame(struct xe_drm_client *client,
> >> +			     struct xe_exec_queue *q)
> >> +{
> >> +	struct blame *b =3D NULL;
> >> +	struct list_head *h;
> >> +	struct pagefault *pf =3D NULL;
> >> +	struct xe_file *xef =3D q->xef;
> >> +	struct xe_hw_engine *hwe =3D q->hwe;
> >> +	unsigned long count;
> >> +
> >> +	b =3D kzalloc(sizeof(struct blame), GFP_KERNEL);
> >> +	xe_assert(xef->xe, b);
> >> +
> >> +	spin_lock(&client->blame_lock);
> >> +	list_add_tail(&b->list, &client->blame_list);
> >> +	/**
> >> +	 * Limit the number of blames in the blame list to prevent memory ov=
eruse.
> >> +	 *
> >> +	 * TODO: Parameterize max blame list size.
> >> +	 */
> >> +	count =3D 0;
> >> +	list_for_each(h, &client->blame_list)
> >> +		count++;
> >> +	if (count >=3D 50) {
> >> +		struct blame *rem =3D list_first_entry(&client->blame_list, struct =
blame, list);
> >> +		free_blame(rem);
> >> +	}
> >> +	spin_unlock(&client->blame_lock);
> >> +
> >> +	/**
> >> +	 * Duplicate pagefault on engine to blame, if one may have caused th=
e
> >> +	 * exec queue to be banned.
> >> +	 */
> >> +	b->pf =3D NULL;
> >> +	spin_lock(&hwe->pf.lock);
> >> +	if (hwe->pf.info) {
> >> +		pf =3D kzalloc(sizeof(struct pagefault), GFP_KERNEL);
> >> +		memcpy(pf, hwe->pf.info, sizeof(struct pagefault));
> >> +	}
> >> +	spin_unlock(&hwe->pf.lock);
> >> +
> >> +	/** Save blame data to list element */
> >> +	b->exec_queue_id =3D q->id;
> >> +	b->pf =3D pf;
> >> +}
> >> +
> >> +void xe_drm_client_remove_blame(struct xe_drm_client *client,
> >> +				struct xe_exec_queue *q)
> >> +{
> >> +	struct blame *b, *tmp;
> >> +
> >> +	spin_lock(&client->blame_lock);
> >> +	list_for_each_entry_safe(b, tmp, &client->blame_list, list)
> >> +		if (b->exec_queue_id =3D=3D q->id)
> >> +			free_blame(b);
> >> +	spin_unlock(&client->blame_lock);
> >> +
> >> +}
> >> +
> >>   static void bo_meminfo(struct xe_bo *bo,
> >>   		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
> >>   {
> >> @@ -380,6 +464,49 @@ static void show_run_ticks(struct drm_printer *p,=
 struct drm_file *file)
> >>   	}
> >>   }
> >>  =20
> >> +static void print_pagefault(struct drm_printer *p, struct pagefault *=
pf)
> >> +{
> >> +	drm_printf(p, "\n\t\tASID: %d\n"
> >> +	 "\t\tVFID: %d\n"
> >> +	 "\t\tPDATA: 0x%04x\n"
> >> +	 "\t\tFaulted Address: 0x%08x%08x\n"
> >> +	 "\t\tFaultType: %s\n"
> >> +	 "\t\tAccessType: %s\n"
> >> +	 "\t\tFaultLevel: %d\n"
> >> +	 "\t\tEngineClass: %d %s\n"
> >> +	 "\t\tEngineInstance: %d\n",
> >> +	 pf->asid, pf->vfid, pf->pdata, upper_32_bits(pf->page_addr),
> >> +	 lower_32_bits(pf->page_addr),
> >> +	 fault_type_to_str(pf->fault_type),
> >> +	 access_type_to_str(pf->access_type),
> >> +	 pf->fault_level, pf->engine_class,
> >> +	 xe_hw_engine_class_to_str(pf->engine_class),
> >> +	 pf->engine_instance);
> >> +}
> >> +
> >> +static void show_blames(struct drm_printer *p, struct drm_file *file)
> >> +{
> >> +	struct xe_file *xef =3D file->driver_priv;
> >> +	struct xe_drm_client *client;
> >> +	struct blame *b;
> >> +
> >> +	client =3D xef->client;
> >> +
> >> +	drm_printf(p, "\n");
> >> +	drm_printf(p, "- Exec queue ban list -\n");
> >> +	spin_lock(&client->blame_lock);
> >> +	list_for_each_entry(b, &client->blame_list, list) {
> >> +		struct pagefault *pf =3D b->pf;
> >> +		drm_printf(p, "\n\tExec queue %u banned:\n", b->exec_queue_id);
> >> +		drm_printf(p, "\t\tAssociated pagefault:\n");
> >> +		if (pf)
> >> +			print_pagefault(p, pf);
> >> +		else
> >> +			drm_printf(p, "\t\t- No associated pagefault -\n");
> >> +	}
> >> +	spin_unlock(&client->blame_lock);
> >> +}
> >> +
> >>   /**
> >>    * xe_drm_client_fdinfo() - Callback for fdinfo interface
> >>    * @p: The drm_printer ptr
> >> @@ -394,5 +521,6 @@ void xe_drm_client_fdinfo(struct drm_printer *p, s=
truct drm_file *file)
> >>   {
> >>   	show_meminfo(p, file);
> >>   	show_run_ticks(p, file);
> >> +	show_blames(p, file);
> >>   }
> >>   #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/x=
e_drm_client.h
> >> index a9649aa36011..d21fd0b90742 100644
> >> --- a/drivers/gpu/drm/xe/xe_drm_client.h
> >> +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> >> @@ -15,7 +15,18 @@
> >>  =20
> >>   struct drm_file;
> >>   struct drm_printer;
> >> +struct pagefault;
> >>   struct xe_bo;
> >> +struct xe_exec_queue;
> >> +
> >> +struct blame {
> >> +	/** @exec_queue_id: ID number of banned exec queue */
> >> +	u32 exec_queue_id;
> >> +	/** @pf: pagefault on engine of banned exec queue, if any at time */
> >> +	struct pagefault *pf;
> >> +	/** @list: link into @xe_drm_client.blame_list */
> >> +	struct list_head list;
> >> +};
> >>  =20
> >>   struct xe_drm_client {
> >>   	struct kref kref;
> >> @@ -31,6 +42,17 @@ struct xe_drm_client {
> >>   	 * Protected by @bos_lock.
> >>   	 */
> >>   	struct list_head bos_list;
> >> +	/**
> >> +	 * @blame_lock: lock protecting @blame_list
> >> +	 */
> >> +	spinlock_t blame_lock;
> >> +	/**
> >> +	 * @blame_list: list of banned exec queues associated with this drm
> >> +	 *		client, as well as any pagefaults at time of ban.
> >> +	 *
> >> +	 * Protected by @blame_lock;
> >> +	 */
> >> +	struct list_head blame_list;
> >>   #endif
> >>   };
> >>  =20
> >> @@ -57,6 +79,10 @@ void xe_drm_client_fdinfo(struct drm_printer *p, st=
ruct drm_file *file);
> >>   void xe_drm_client_add_bo(struct xe_drm_client *client,
> >>   			  struct xe_bo *bo);
> >>   void xe_drm_client_remove_bo(struct xe_bo *bo);
> >> +void xe_drm_client_add_blame(struct xe_drm_client *client,
> >> +			     struct xe_exec_queue *q);
> >> +void xe_drm_client_remove_blame(struct xe_drm_client *client,
> >> +				struct xe_exec_queue *q);
> >>   #else
> >>   static inline void xe_drm_client_add_bo(struct xe_drm_client *client=
,
> >>   					struct xe_bo *bo)
> >> @@ -66,5 +92,15 @@ static inline void xe_drm_client_add_bo(struct xe_d=
rm_client *client,
> >>   static inline void xe_drm_client_remove_bo(struct xe_bo *bo)
> >>   {
> >>   }
> >> +
> >> +static inline void xe_drm_client_add_blame(struct xe_drm_client *clie=
nt,
> >> +					   struct xe_exec_queue *q)
> >> +{
> >> +}
> >> +
> >> +static inline void xe_drm_client_remove_blame(struct xe_drm_client *c=
lient,
> >> +					      struct xe_exec_queue *q)
> >> +{
> >> +}
> >>   #endif
> >>   #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/x=
e_exec_queue.c
> >> index a02e62465e01..9c9bc617020c 100644
> >> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> >> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> >> @@ -13,6 +13,7 @@
> >>   #include <uapi/drm/xe_drm.h>
> >>  =20
> >>   #include "xe_device.h"
> >> +#include "xe_drm_client.h"
> >>   #include "xe_gt.h"
> >>   #include "xe_hw_engine_class_sysfs.h"
> >>   #include "xe_hw_engine_group.h"
> >> @@ -714,6 +715,12 @@ int xe_exec_queue_create_ioctl(struct drm_device =
*dev, void *data,
> >>   	q->id =3D id;
> >>   	args->exec_queue_id =3D id;
> >>  =20
> >> +	/**
> >> +	 * If an exec queue in the blame list shares the same exec queue
> >> +	 * ID, remove it from the blame list to avoid confusion.
> >> +	 */
> >> +	xe_drm_client_remove_blame(q->xef->client, q);
> >> +
> >>   	return 0;
> >>  =20
> >>   kill_exec_queue:
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe=
/xe_gt_pagefault.c
> >> index fe18e3ec488a..a0e6f2281e37 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> >> @@ -330,6 +330,23 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, =
u32 *msg, u32 len)
> >>   	return full ? -ENOSPC : 0;
> >>   }
> >>  =20
> >> +static void save_pagefault_to_engine(struct xe_gt *gt, struct pagefau=
lt *pf)
> >> +{
> >> +	struct xe_hw_engine *hwe;
> >> +
> >> +	hwe =3D xe_gt_hw_engine(gt, pf->engine_class, pf->engine_instance, f=
alse);
> >> +	if (hwe) {
> >> +		spin_lock(&hwe->pf.lock);
> >> +		/** The latest pagefault is pf, so remove old pf info from engine *=
/
> >> +		if (hwe->pf.info)
> >> +			kfree(hwe->pf.info);
> >> +		hwe->pf.info =3D kzalloc(sizeof(struct pagefault), GFP_KERNEL);
> >> +		if (hwe->pf.info)
> >> +			memcpy(hwe->pf.info, pf, sizeof(struct pagefault));
> >> +		spin_unlock(&hwe->pf.lock);
> >> +	}
> >> +}
> >> +
> >>   #define USM_QUEUE_MAX_RUNTIME_MS	20
> >>  =20
> >>   static void pf_queue_work_func(struct work_struct *w)
> >> @@ -352,6 +369,8 @@ static void pf_queue_work_func(struct work_struct =
*w)
> >>   			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
> >>   		}
> >>  =20
> >> +		save_pagefault_to_engine(gt, &pf);
> >> +
> >>   		reply.dw0 =3D FIELD_PREP(PFR_VALID, 1) |
> >>   			FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
> >>   			FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/x=
e_guc_submit.c
> >> index 913c74d6e2ae..d9da5c89429e 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> >> @@ -20,11 +20,13 @@
> >>   #include "xe_assert.h"
> >>   #include "xe_devcoredump.h"
> >>   #include "xe_device.h"
> >> +#include "xe_drm_client.h"
> >>   #include "xe_exec_queue.h"
> >>   #include "xe_force_wake.h"
> >>   #include "xe_gpu_scheduler.h"
> >>   #include "xe_gt.h"
> >>   #include "xe_gt_clock.h"
> >> +#include "xe_gt_pagefault.h"
> >>   #include "xe_gt_printk.h"
> >>   #include "xe_guc.h"
> >>   #include "xe_guc_capture.h"
> >> @@ -146,6 +148,7 @@ static bool exec_queue_banned(struct xe_exec_queue=
 *q)
> >>   static void set_exec_queue_banned(struct xe_exec_queue *q)
> >>   {
> >>   	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> >> +	xe_drm_client_add_blame(q->xef->client, q);
> >>   }
> >>  =20
> >>   static bool exec_queue_suspended(struct xe_exec_queue *q)
> >> @@ -1971,6 +1974,7 @@ int xe_guc_deregister_done_handler(struct xe_guc=
 *guc, u32 *msg, u32 len)
> >>   int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u3=
2 len)
> >>   {
> >>   	struct xe_gt *gt =3D guc_to_gt(guc);
> >> +	struct xe_hw_engine *hwe;
> >>   	struct xe_exec_queue *q;
> >>   	u32 guc_id;
> >>  =20
> >> @@ -1983,11 +1987,24 @@ int xe_guc_exec_queue_reset_handler(struct xe_=
guc *guc, u32 *msg, u32 len)
> >>   	if (unlikely(!q))
> >>   		return -EPROTO;
> >>  =20
> >> +	hwe =3D q->hwe;
> >> +
> >>   	xe_gt_info(gt, "Engine reset: engine_class=3D%s, logical_mask: 0x%x=
, guc_id=3D%d",
> >>   		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> >>  =20
> >>   	trace_xe_exec_queue_reset(q);
> >>  =20
> >> +	/**
> >> +	 * Clear last pagefault from engine.  Any future exec queue bans lik=
ely were
> >> +	 * not caused by said pagefault now that the engine has reset.
> >> +	 */
> >> +	spin_lock(&hwe->pf.lock);
> >> +	if (hwe->pf.info) {
> >> +		kfree(hwe->pf.info);
> >> +		hwe->pf.info =3D kzalloc(sizeof(struct pagefault), GFP_KERNEL);
> >> +	}
> >> +	spin_unlock(&hwe->pf.lock);
> >> +
> >>   	/*
> >>   	 * A banned engine is a NOP at this point (came from
> >>   	 * guc_exec_queue_timedout_job). Otherwise, kick drm scheduler to c=
ancel
> >> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe=
_hw_engine.c
> >> index fc447751fe78..69f61e4905e2 100644
> >> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> >> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> @@ -21,6 +21,7 @@
> >>   #include "xe_gsc.h"
> >>   #include "xe_gt.h"
> >>   #include "xe_gt_ccs_mode.h"
> >> +#include "xe_gt_pagefault.h"
> >>   #include "xe_gt_printk.h"
> >>   #include "xe_gt_mcr.h"
> >>   #include "xe_gt_topology.h"
> >> @@ -557,6 +558,9 @@ static void hw_engine_init_early(struct xe_gt *gt,=
 struct xe_hw_engine *hwe,
> >>   		hwe->eclass->defaults =3D hwe->eclass->sched_props;
> >>   	}
> >>  =20
> >> +	hwe->pf.info =3D NULL;
> >> +	spin_lock_init(&hwe->pf.lock);
> >> +
> >>   	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> >>   	xe_tuning_process_engine(hwe);
> >>   	xe_wa_process_engine(hwe);
> >> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm=
/xe/xe_hw_engine_types.h
> >> index e4191a7a2c31..2e1be9481d9b 100644
> >> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> >> @@ -64,6 +64,7 @@ enum xe_hw_engine_id {
> >>   struct xe_bo;
> >>   struct xe_execlist_port;
> >>   struct xe_gt;
> >> +struct pagefault;
> >>  =20
> >>   /**
> >>    * struct xe_hw_engine_class_intf - per hw engine class struct inter=
face
> >> @@ -150,6 +151,13 @@ struct xe_hw_engine {
> >>   	struct xe_oa_unit *oa_unit;
> >>   	/** @hw_engine_group: the group of hw engines this one belongs to *=
/
> >>   	struct xe_hw_engine_group *hw_engine_group;
> >> +	/** @pf: the last pagefault seen on this engine */
> >> +	struct {
> >> +		/** @pf.info: info containing last seen pagefault details */
> >> +		struct pagefault *info;
> >> +		/** @pf.lock: lock protecting @pf.info */
> >> +		spinlock_t lock;
> >> +	} pf;
> >>   };
> >>  =20
> >>   enum xe_hw_engine_snapshot_source_id {
> >> --=20
> >> 2.43.0
> >>
> >=20
>=20
>=20
