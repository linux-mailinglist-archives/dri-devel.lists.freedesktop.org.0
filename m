Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A36BAAE5D6
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 18:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4650E10E899;
	Wed,  7 May 2025 16:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDBGhfH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DF710E851;
 Wed,  7 May 2025 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633815; x=1778169815;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KAFenRZpEA9/CWVSwm+mqTUM6PyZEgriCGkjb5d9QH4=;
 b=UDBGhfH3cnYMkxr1aCL4J8Qf3qunNC1H1SOD53JHuqH6mvjpygmtIb9C
 ZAyIK3FO1P2dGsUwkXET0WqnQGWZXRsynqE2IcRmG52qMGqhaF3sXq0+l
 4FCb6Xtoh6YDxOJCOsmsd9994weexYOOntt+5l7xW+ZfJ7BCxDMerNrXt
 dvzmiCUDq64S+OWV4XSQAkVcXF1oS+6dzVkhfRl3xgY7d22JSncFUyQ/p
 i4BM1VSIqFu6An+MFZ243NFRpqhGuJtNdzpJFg2XEj2R4EuB44eR6Igv8
 WwPFrYp14BFZ1x7Tg4pG0Qz0PO9/MSeGJ/rCWnTqHQqHRHsDgtsVZTL4T w==;
X-CSE-ConnectionGUID: gOdoRushSlGbpND6dBF3cA==
X-CSE-MsgGUID: pCmjM/H8QhmXgbHfiwXA3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48518422"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48518422"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:01:44 -0700
X-CSE-ConnectionGUID: NDXWnlySQF+pXrNoaEg3Fg==
X-CSE-MsgGUID: +brV5aVSSrGjkLaOay5F0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173198953"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:01:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 09:01:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 09:01:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 09:01:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMpZWfzRG7p9+MbQQkdRitg8rG4PywBxrBLUqS0Gzr+hCZ9swTZOgAyNpADCEru5GDMXq/GjXjZIoAZ+84r0K3j4vf5WXWZqVUZRW5XdqcM3v1cNcN/rXedg6yfVe+fe7ewFfGbsIwiL06chYNHDK5qFCPMdOUNe/aLM7jfRYiorCqT31lqtFarvl87pzoz2KaDTNd4DUhtVpbdIkJ/0ww0sgNJ4LEVCUSbmFEJYIgstoqrY76raTC8P+g8v6D3Il70nblnRVq/ykOG3r4HnryrJhdXtRHr/9ykyHD47mGwHm2VRKCKabhc0K1Km0eewX62DueLQ/zjwCAf8CrKrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uMA8tITmNFF+ROKHxwuvII1qEc6YMDy/xKFQqiP2rM=;
 b=vLlhoffMGUAavz3oA1sXjpHG84iH1eWATFbqzH0MKxLAiS6KDVMKSOmDXRa6Fh8A0fdY805Xj67BBXvMdp7CCVp6lTMMAOM3pQ7K6qKcMTPUv/ess+FWM940whPPUNVVU99CZrnFVVKq1jPOHLTQSaVUc5xtqyaEOWmAD2ziVyyHJ+XDRTeC6fuAfAxl7I+dEICLQM3PaRTgFJh4ViJlhBB2Rj/WIizc7Cb5Ta43ntj9hpZsj+5fS1r/Q/KyAnWegmh4wemPBSvhpGNlaBmP/aiLZOCkrISXiIEpaqKwolCCy6fNPH+yG6V+exEPGEm9GpPTAUs0uVJ47uU/JzBeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 16:01:39 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 16:01:39 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>, "dafna.hirschfield@intel.com"
 <dafna.hirschfield@intel.com>
Subject: RE: [PATCH v24 0/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v24 0/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHbv2jBdNjLuoA5DkeVfkhUQssE0LPHU6ag
Date: Wed, 7 May 2025 16:01:39 +0000
Message-ID: <CH0PR11MB5444FD727C01F584E9172A1BE588A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250507155727.130444-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250507155727.130444-1-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ5PPF57F27BA08:EE_
x-ms-office365-filtering-correlation-id: 1392dfd5-25e3-4d13-823c-08dd8d8073a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?D+oZjA4T2aO4E/Q/kXNbjkSD4bHQvDrWQFvJBLt5jnw81SSoE9CFtkwUS/dy?=
 =?us-ascii?Q?LC0X03ZEBX3dJRreKbEi2/vYSXPxpUtE0H3cS05iaERnRptMGk8BQ1+564JN?=
 =?us-ascii?Q?P7xY2t0Au5UpCy1rMnxMMJYwsmZq1lXDrgKU9/5JhOt9rTZtcn2R64jVayGS?=
 =?us-ascii?Q?MCfCQY41o9TyZjU9+Onpimir2gKLrCOe2vJuAyGMAwxW6KlZG1moZi3bIY3e?=
 =?us-ascii?Q?emqAWhd01/wvfIiytBcr4amKp4+C5qWI9wJgj1ovQjev37BP0fWRfP0T3L3c?=
 =?us-ascii?Q?ce6DyXIU9nU3G/7aIQQk4NgbDfUCL2kyWL0VgYqzDtHLO8Z4g1d+or8pAAi+?=
 =?us-ascii?Q?kEPKlUtBmu6amYE0UiMWpVGfFxn7LxOhBFSiYRu/2Ou0msO20khHatzJdahj?=
 =?us-ascii?Q?kA7i/4F/MiTmp1OoR28pIWSMtGU6j1Z6EP+Xe/WD6EBhoNGa6sBwar96cGKq?=
 =?us-ascii?Q?lFWUP/Vofeol82gIK+acj2IFNzUWp6MAks221wLC7y1FN9LO3NGAtBvH0jAb?=
 =?us-ascii?Q?wpfFn12jHBvYCugS5eWkH4IJh9gEajI8WVMTaxC6xGqwitT//CZTI2EcUjcg?=
 =?us-ascii?Q?hBHCJ/Y0rD7GBNgEtkVTRcSY4JxkDoZZLXGD6bdC8cABsGU4hxkOeXqex0Dl?=
 =?us-ascii?Q?ywj3X/inT6KffJfVEZit9lIEi7JPy5V/5EF1OrnPny3LOek8YBSpJaEzKnSz?=
 =?us-ascii?Q?wd/zFbzK3j6qv4RHvn6SezmZVxzD95zlEh/alaaKUnAfriA2j9L0FBSTXBLE?=
 =?us-ascii?Q?PyXdb6a+b99I+RuLpk/ZbuzJS/Y2fHglZKdVjfIbiuX4h8TwtzkZyWIhzXta?=
 =?us-ascii?Q?fro9wgpewUbkBKfInFg5svcQbU3vvctsKEzxutssMHTggKBsSNw4QUSMMI7g?=
 =?us-ascii?Q?nzftMdcps3dqd3LW3LKM0zLFdu6CT/1pVu+O6Npz2Z+wOsHOZCy/2evzpDU/?=
 =?us-ascii?Q?iooeYG5YGinVMt7NsYtfagZXde9dZUQoBK7YBUn3KH3tmpKW5i4uGMspg+Ra?=
 =?us-ascii?Q?odzuxry/LEqlZ62x8lU6g/8og36Y8xuHcBV7M8iOmthAgSinZq6KiPBjJAJS?=
 =?us-ascii?Q?i0IYQe7bj3QctVjqySBWubh2fzglKtOxVHHsmnVPY/tSQwGgaLC1XHEvZAGv?=
 =?us-ascii?Q?Uc+1AeCyPQdohk82a9SpfbKa6Thz5Hv/5uIq+/k9J4zLpQo2F/b7jwns6gZv?=
 =?us-ascii?Q?0zGK95cGj436SwtU0PMhOKQ+NI1E3YB0Tbsv8VsCwn1UDeZYIDVG5hCrhZVV?=
 =?us-ascii?Q?919BNiq7X4wPSQBIKQTe1RopJTgwNULhkrMeIX/miQ1V2ciWn1O93gw4qXVt?=
 =?us-ascii?Q?JB3Vr4izG6wrgd9XLjk9gkNvYdQzIHhufaNMaJ0Pe8O0G7quuGrJ/EnHnciy?=
 =?us-ascii?Q?XbqrQMPdt5VcLL2zv+mCrskl2VGyZ4RYffAj0WXJUC9Elo3+6xAogwaMZfag?=
 =?us-ascii?Q?GqUbYkasujc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D8aRZrQlU3jhjhdYlufKi4eBANCfHu1ZgJiROp3/ZM/jPSHehLOgVwtgF1hR?=
 =?us-ascii?Q?+lb2UghyEYsoWarq9p8CBWS/mJqCiyPXTFVW4/1U9rvmc3j7qcqSINhV20ol?=
 =?us-ascii?Q?ujlFpKXmDq+bQHzc6C3IYp+iVkAKYnYcp7hOalEPisYoxjqLonQvG2vEl/7G?=
 =?us-ascii?Q?LuZ2mTgkdr18onFzajGxe/VSEqg5Mhf09t1QNkFGKs2tmeQQN/ZW4UhYFEUw?=
 =?us-ascii?Q?S2J1771saO3pWPzdQXmRU+6jRmh0hedx+vODPS85e6lNfMuy8UN4HA1hjzPb?=
 =?us-ascii?Q?gSLvFuCbywJMXXMI0HGlbWomgQgyPSy5ZfHA7jArbgQoUNq+DD5+Bwbf8KSt?=
 =?us-ascii?Q?EkvZAxvym0ls3g8Z69rnwpzBTbVj7hDyVPf7WVU0O4FuWYju0DOA7hjC4xak?=
 =?us-ascii?Q?lSQ9or39TWYZhOvAUpN9i3FKe6wu4i+4RRsuueAojjpCq4GKZb3hFLCCRdwr?=
 =?us-ascii?Q?2RQAF6H8oWZpmjXBymE2xXqh+4RcvgaWZfPrCbW9LU1sikjGZG9NKsdH+ZTJ?=
 =?us-ascii?Q?E61h4CHE+xRFJLsZH3I1t0f6IuH2I/kmk4lVd1omnamiEoiJDsjPDz3wfryg?=
 =?us-ascii?Q?d9n7hm+LSuDVPsI0YRQtJvHAwdpfNZ3MVcetUmeEC+wBcSb7k3jCgM+t5yqW?=
 =?us-ascii?Q?tB9FDTIT+01i5IEBtKny8bleK5A57xNR5DNsiBq8V9dMRiev/cXhcr2hjVd+?=
 =?us-ascii?Q?sc9syLAIelK5rBoUrHIhtLe+pcnjdb63Hgdewrrp695oPl8UWEyYrGu5YKBg?=
 =?us-ascii?Q?HU5G58N7HDYQ+O8F/ncbUE434jp4Mg8HkjolhiTet/ypnh+fGxCKkqrBcbDY?=
 =?us-ascii?Q?tC5VzXVFgcy5t/MKk8wTuPFwjv2cFHLSr4whCXDq9Jtz4nNitboTl06cYFeh?=
 =?us-ascii?Q?gNzqdgRt8L2aeNvpKbQ5qw/Nt+RWp3FWWe9Q7Epmk/NA/HuQidscWOIc0v8u?=
 =?us-ascii?Q?Z7y46dDG4Yf3QLpJchNxj+0b1MQWm+IeNCIk7br8ARbKYSF37C5kRWrMOP9z?=
 =?us-ascii?Q?Qp4F+9VCKFqOdWck0E/JL0TZcMTKTI7yzCODSCrsrhkynC+dGssw5CXtn3KJ?=
 =?us-ascii?Q?YVhuPouFrY4aXMC5aai7J21jKoiBaDFuXIemvN8T045nlUa1JGuFjRNIGj5y?=
 =?us-ascii?Q?KQSbXcNjnTNpPxkR9mjqqWBLP/a7fejfvnxZKSP5JhrVPWMdj5/f92Pc9+BZ?=
 =?us-ascii?Q?Q7eETwXq7tQ7LKjBbeVOqjbZN201NM6DUVskHzF/lwhkpBxnpJxTsIsJIKHr?=
 =?us-ascii?Q?A4eVbqiwanta26aMO4G6y4FBIyCyEMReLVgby//El4av90JVZDUjJEnwtEvC?=
 =?us-ascii?Q?+DOdO/gpd129Q2wxJr/fEcW+gNE71U4thB8xfgr9DtqkYxfxJnolCEzayt2T?=
 =?us-ascii?Q?QU80zZ5GCCsMaepsGtKttqdFWkgaPKzx1taPHmZFk9mQhkmoiqjjwloo3Vgr?=
 =?us-ascii?Q?93MAHPxdvBHoI2GjKNBqc0Wu+jXiJo7otEzryy9p35D7mZaH8dquqii1KPWw?=
 =?us-ascii?Q?3byxrsfT79NUuaSSmyzAMes4pwmu6TQlZF/A1OcyE68ha/WUHUVZU04GTgYs?=
 =?us-ascii?Q?xFpHfdl2oZnGrvbaXSIhhY4urcsZQ7dlB5CNgAoh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1392dfd5-25e3-4d13-823c-08dd8d8073a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 16:01:39.1638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7yj2g1nG6quxC4g5i89tUOj0FivZYrb7XyNgzCBY9gOYyMt0obvNx8ZQA/m68hoQMd3FDDB40Ce+HgD3Qce9hqmDTB5e6FWDq+n7XRzG6ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF57F27BA08
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

Ignore this one: I misspelt the name of a recipient
-Jonathan Cavitt

-----Original Message-----
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Wednesday, May 7, 2025 8:57 AM
To: intel-xe@lists.freedesktop.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; joonas.lahtinen@linux.in=
tel.com; Brost, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.=
zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists=
.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, M=
ichal <michal.mrozek@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Harris=
on, John C <john.c.harrison@intel.com>; Briano, Ivan <ivan.briano@intel.com=
>; Auld, Matthew <matthew.auld@intel.com>; dafna.hirschfield@intel.com
Subject: [PATCH v24 0/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
>=20
> Add additional information to each VM so they can report up to the first
> 50 seen faults.  Only pagefaults are saved this way currently, though in
> the future, all faults should be tracked by the VM for future reporting.
>=20
> Additionally, of the pagefaults reported, only failed pagefaults are
> saved this way, as successful pagefaults should recover silently and not
> need to be reported to userspace.
>=20
> To allow userspace to access these faults, a new ioctl -
> xe_vm_get_property_ioct - was created.
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
> v7:
> - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> - Fix double-locking error (jcavitt)
> - Assert kmemdump is successful (Shuicheng)
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>   (jcavitt)
>=20
> v8:
> - Revert back to using drm_xe_vm_get_property_ioctl
> - s/Migrate/Move (Michal)
> - s/xe_pagefault/xe_gt_pagefault (Michal)
> - Create new header file, xe_gt_pagefault_types.h (Michal)
> - Add and fix kernel docs (Michal)
> - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> - Store address, address type, and address precision per fault (jcavitt)
> - Store engine class and instance data per fault (Jianxun)
> - Properly handle kzalloc error (Michal W)
> - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> - Store fault level per fault (Micahl M)
> - Apply better copy_to_user logic (jcavitt)
>=20
> v9:
> - More kernel doc fixes (Michal W, Jianxun)
> - Better error handling (jcavitt)
>=20
> v10:
> - Convert enums to defines in regs folder (Michal W)
> - Move xe_guc_pagefault_desc to regs folder (Michal W)
> - Future-proof size logic for zero-size properties (jcavitt)
> - Replace address type extern with access type (Jianxun)
> - Add fault type to xe_drm_fault (Jianxun)
>=20
> v11:
> - Remove unnecessary switch case logic (Raag)
> - Compress size get, size validation, and property fill functions into a
>   single helper function (jcavitt)
> - Assert valid size (jcavitt)
> - Store pagefaults in non-fault-mode VMs as well (Jianxun)
>=20
> v12:
> - Remove unnecessary else condition
> - Correct backwards helper function size logic (jcavitt)
> - Fix kernel docs and comments (Michal W)
>=20
> v13:
> - Move xe and user engine class mapping arrays to header (John H)
>=20
> v14:
> - Fix double locking issue (Jianxun)
> - Use size_t instead of int (Raag)
> - Remove unnecessary includes (jcavitt)
>=20
> v15:
> - Do not report faults from reserved engines (Jianxun)
>=20
> v16:
> - Remove engine class and instance (Ivan)
>=20
> v17:
> - Map access type, fault type, and fault level to user macros (Matt
>   Brost, Ivan)
>=20
> v18:
> - Add uAPI merge request to this cover letter
>=20
> v19:
> - Perform kzalloc outside of lock (Auld)
>=20
> v20:
> - Fix inconsistent use of whitespace in defines
>=20
> v21:
> - Remove unnecessary size assertion (jcavitt)
>=20
> v22:
> - Fix xe_vm_fault_entry kernel docs (Shuicheng)
>=20
> v23:
> - Nit fixes (Matt Brost)
>=20
> v24:
> - s/xe_pagefault_desc.h/xe_guc_pagefault_desc.h (Dafna)
> - Move PF_MSG_LEN_DW to regs folder (Dafna)
>=20
> uAPI: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32987
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Dafna Hirschfield <dafna.hirschfield@intel.com>
>=20
> Jonathan Cavitt (5):
>   drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
>   drm/xe/xe_gt_pagefault: Move pagefault struct to header
>   drm/xe/uapi: Define drm_xe_vm_get_property
>   drm/xe/xe_vm: Add per VM fault info
>   drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
>=20
>  .../gpu/drm/xe/regs/xe_guc_pagefault_desc.h   |  51 +++++
>  drivers/gpu/drm/xe/xe_device.c                |   2 +
>  drivers/gpu/drm/xe/xe_gt_pagefault.c          |  74 +++----
>  drivers/gpu/drm/xe/xe_gt_pagefault_types.h    |  42 ++++
>  drivers/gpu/drm/xe/xe_guc_fwif.h              |  28 ---
>  drivers/gpu/drm/xe/xe_vm.c                    | 196 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h                    |  11 +
>  drivers/gpu/drm/xe/xe_vm_types.h              |  29 +++
>  include/uapi/drm/xe_drm.h                     |  86 ++++++++
>  9 files changed, 456 insertions(+), 63 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_guc_pagefault_desc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
>=20
> --=20
> 2.43.0
>=20
>=20
