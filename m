Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641C5AA53E3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 20:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60E710E29A;
	Wed, 30 Apr 2025 18:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PpABYVY7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0008710E0A1;
 Wed, 30 Apr 2025 18:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746038528; x=1777574528;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pA0X9aBbMD5ijbbPMIMlCl4Xhg0wjExBQFz0utECOpQ=;
 b=PpABYVY782wszKRwKV0t9sYUnEK42Uyi+A1GOkoe+1UzgPy23NUHF9Nz
 8Hw2c61Nxcz27aH1kHzl3vx7MMf8gur/Okl3cw3VHkJvDVfUjBbY7FxjC
 qcQyKs0ReG3AeQOqvno5TDT6GC2dOzKXAzjsZFfjVH2LT9TnpVhRyXdKz
 Py8hcDT22n/H4bwB1R+L638UMlgqPv8elA0Na0lXAvcZ5D+oUXsh5uMa1
 eMO0qwJdy3HPuC0lLI6SkK0I2sebPek2D/zu0DmkgWLzQ8No76EJpcAA8
 ex0v8FtvWtaQprJNS5vN7GyLk5Ri84dg3Bt1Qg8Cfi6Te22x0QckEImf9 w==;
X-CSE-ConnectionGUID: 2ZUia4zzSmCXyeosPYpv7Q==
X-CSE-MsgGUID: 8pSTnQm6RU6a3jLBD7od2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="51378411"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="51378411"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 11:42:05 -0700
X-CSE-ConnectionGUID: bPFqAm1HSieQlBnJ7x42tw==
X-CSE-MsgGUID: ff6+Z1KGRSKsFcP4I5/3bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="157433097"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 11:42:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 11:42:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 11:42:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 11:42:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLK0brI9ZRZc2jvlnxd+XXA081Q3oJx12v+z7Z7LuavW4HfZ/0XgU1gm42KubmbIC7XehxFC/reCqBRAh3/P05Y31Qcj2cJji9rP7HWffGLvGL4/C5Q0BLBNlAmqOvVzRUP7wsTJTDTpvSH8FfqZ8dj82K+4i0iKJRZDBTNWiNE5V4kSioVgiGrxgyQQ9CIbPiFMI5MbCX8+8dnL4YDF0kVU3COv0Bq4OYbA2l7tmuyc3xUjYFjSeOABZWNjIrLOmrs2v73FHhs3i4vfo03EUVJhQhL0Rzh1iI0ZG933Wyk+TYS4Dq/G3b4cFMOTA/Zhval5qjDDodQy9ePGoNPGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH1KgsGn/zSy4Z3vKNCum3AH4WjvSzelQ/IdQxwbZnE=;
 b=u7DuXClLYKG22lKD+6rc0xPeRO75K65U4/A8HNYHPLrnTLP90O/xN8kCExFMUvLC5xTh9d9U5DJ4vu66wVVHG/2rmR8Gf0vFKWNXBonOmTxHU3X3aQCzEiufqU+LLSkfug39LfoMCAjcAqC+HzAPr0SorgNXBASLQAY/aCyz/vM5XbfzGUEnTF2a2U4ZWVwQxnd99LUpnSZnIrgYCW3WoUQb9a764qT3IyMmYlJfg8IKDhJy5qZVj4ftjPip3zZWO7lNy1pRK3wxR2SMvc/GCrYmKNIAAjT7s4b7VPFkXxrl5Qq9ePqe4OkHTOOD+zhwI2mT156X5K87CEuSJC6uug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 18:42:00 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 18:42:00 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Hirschfeld, Dafna" <dafna.hirschfeld@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v23 2/5] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Thread-Topic: [PATCH v23 2/5] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Thread-Index: AQHbtVpgi1/2p1GPXUq6RBiICW9LNbO6uX6AgAEYnICAAKhQEA==
Date: Wed, 30 Apr 2025 18:42:00 +0000
Message-ID: <CH0PR11MB54441430BC7884703A315AF7E5832@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250424204917.172708-1-jonathan.cavitt@intel.com>
 <20250424204917.172708-3-jonathan.cavitt@intel.com>
 <zqvdl3mu7q5vynymsbz7ax76sz2opyfhr4cwyp6vsi5yz4fl5w@jxxwcgbzoqhf>
 <c6abnjkhl2szjpql5hkvg4is3oxdeqzjdhskijlznif3gbbh2m@tc6evykceayg>
In-Reply-To: <c6abnjkhl2szjpql5hkvg4is3oxdeqzjdhskijlznif3gbbh2m@tc6evykceayg>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: matthew.brost@intel.com,Michal.Wajdeczko@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ2PR11MB7573:EE_
x-ms-office365-filtering-correlation-id: 16991b73-c24a-44da-a3cb-08dd8816b139
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Ng9NLTuNlxQpBW1r/iYexbB/XNi0dRbpVNmqN5inAmx0qnW4Cw21IBXJ4pcR?=
 =?us-ascii?Q?RFFLllEanAvtHCu4LIAC45i5L6+6eG4QSSk07awGtIhApXPehQHRA7S3kNDz?=
 =?us-ascii?Q?8aIJ4Uysl0S5mwXzCXqtA4MxGVpaXUjg2yceUcKbD7FjUByym/yGmgYBW7D2?=
 =?us-ascii?Q?aqOIy3lMWE7Tr5VS/h7WqG1TXMZ/x1VU6vAwZYIJj00zEKN3hgoZjFFVtD7a?=
 =?us-ascii?Q?6JyOQAzmz7uivnNC4soVMBMxVWNFtawEs66w1R3+S62aJUSqNwvx4XFLa3oS?=
 =?us-ascii?Q?pAhl/AJXN+uO/mbxysX4hfm/Hifq2vQU52p3hT9WrE3zsXe9l8yv/cwM1VGI?=
 =?us-ascii?Q?2kpjK4WCavEd5l+nod8JsE/YjsHMP2demtMw8yMyHb/y9ET9c7irhA/MdbZw?=
 =?us-ascii?Q?Tzef0YQB8d+wePPfiFWxy5nJjvoycF2xmRs0zEBADNG79uUcPqDUZHVMyAsJ?=
 =?us-ascii?Q?VyLAXBIvM2OXt23qmjAvAdw48U9NwX3FQdRySlHZBtuu6n02eZLU1wlJBd2Y?=
 =?us-ascii?Q?fO27AWHtHWxpBLOuUoP+jf+5KY8Jie5Lv44RA1EZyMLmIbCl6ACxc/vbUfvk?=
 =?us-ascii?Q?3WfsIyaI1UYcUz9LSHXMAo5CN65eBggPm/jj2Kv6TCUxATTzIAolYzAepOVM?=
 =?us-ascii?Q?QDpQwtXKxvCU29Ka5Fq6qm410sYlfdCy6Q9i/LSx2aTqjljj3t8GYWkL6nr1?=
 =?us-ascii?Q?Quc91z8o5Xvns4lLWrLZ037HgnqwQZgann1qpLxTyPLWZF+XbfmEFh1TmLky?=
 =?us-ascii?Q?qvaBv5ByBRrwnxp2ysyInpof+KPbsoLEQiJLTqHNHukeUZ3aDQrU5YhbpUil?=
 =?us-ascii?Q?ADQrSKhFOhRpup81o9WJnzoSkq/9hgFBuVus7fVym6u2zXqmBPf/wX2be7Ch?=
 =?us-ascii?Q?uj2KKQFOF/epuRamG0OHyw+tJoL5Gdrcqd8cqgVnUk+en+J/toPgmuwO+a5p?=
 =?us-ascii?Q?xCrZQVTw8CPnozHfALVoUSjYcSbAJ0Ln7ijLA/l4lq+j8QAhf7X1sRyxw3WZ?=
 =?us-ascii?Q?8boZYIJw7mpKVNGbJ1eRyD+5hMbaPpN+prDAfYRoI5vCUZYoOvjebg151qwY?=
 =?us-ascii?Q?bnrImIfBcfxdckfOVbwoJlRuj6gkMHGfzO7qbX9UUxtaXEaTVA7EhRnzByY8?=
 =?us-ascii?Q?Sm6lJzL+MVlKoI9UrfN6XKPFAg2MUgT28AYWki9j4Y40Rcgwtmt1NP/dPK7U?=
 =?us-ascii?Q?fHmRiqiiYqNDsuDE0ILeYO8ba1Xes0RZtRM0Xry5wIXt3xX9xGVRsxLjB90d?=
 =?us-ascii?Q?1KcI2IKM8DyxhPe+NwHVv0/+7IqyMxc0Bq+oc8fJDGS3S0KCmbmx/Ai/8h5c?=
 =?us-ascii?Q?xP9vgo0fSQQAHV5eTY1QYWEL2n07Qg0Ul4ogeimUt8mi0vEdtUmrZ34a0SWy?=
 =?us-ascii?Q?RFCtYMH3vzc+rOoFa9iIveNpjh32R41DGY9IXsn6ZRC0FH1+qwqzcVIq94Rg?=
 =?us-ascii?Q?82M1IhpfpXCF7frFf88x7qnUX/zQX2U5nxAWSxYpJkkD7OrikVT4Hg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t7SilTDQdTNVPmq0ohUuugjXk7IAvr56rtaTxtLkiSA4QHkEum8U13ORnDC+?=
 =?us-ascii?Q?erXZFeZmrCKj5fuLDlsbCxRWk2Ze3NQ+/RcG1E10g8EN+L8iCpsuntOF6Vut?=
 =?us-ascii?Q?NbG1n0fPCHDcd+nNzchv1iB3S5R9OB4M+fzxVBbn1KqS9VMnopV54LaDTycQ?=
 =?us-ascii?Q?nGWzf9kwzbJ15xRMFtMzLcSFSBF5wvBwZ1CWzgUeqN9jzhDwREGjk9M5hAsT?=
 =?us-ascii?Q?Mg2167a3VFvr0ON6M/KFaeInkok2Bnw76hb5rp8FCnQ92C/wAVlzv2CoUJ2z?=
 =?us-ascii?Q?C+hUMl6IcdepP1jb7CNAE5opzrLut9A3foqrbe+xoinMc7wvD9jVpQg32tiF?=
 =?us-ascii?Q?n5OMc0DKuGyCzapMzC+EYjQRUTLIwc4rEs5BXu2WiArTClNVI5i8lIdKC/yR?=
 =?us-ascii?Q?nIbem73EXTsVmR5tDW3qsCkEG94ngO/nlEeVFp5btFB9r69oVSJpszBiSaVj?=
 =?us-ascii?Q?I1J2K/Vi3rYCHHpYz14ewhwSyaflp9XuxDQH7X9syZj4v1rTfyyHsTKr0JrJ?=
 =?us-ascii?Q?fRDtbnLKDw6xdYFf+Jpaop0e54U1hpqpdwPLIzzwbCWcqk6l/gAwtzfQYHy9?=
 =?us-ascii?Q?mBaCSruY48aVTM+Kr9OOafLdi/IR5U7i6M8Kd1HZDU6LPVh1GPpOtTbdYwAc?=
 =?us-ascii?Q?XCHJL15OBo+q+jNTcGxShP3vAjyrTJ+V3S4PzszXAzDJccXG3sxXtK+d/ZIl?=
 =?us-ascii?Q?njxpR6o2JMeWQOtT+wsCHMftaBV26JSs3m7RoHe0/hHdIHIsgSgnVzwjgIZZ?=
 =?us-ascii?Q?RG3laVvY0PvbepHiNvBNM0AUchNYzuTJlF1d5BLsRzob86WF4UsEsew7ofSm?=
 =?us-ascii?Q?qtX5Qau5esHZ5clRCKJ2rd0Ogm8QDLYyHUtQYkUQTdGjSGJc3lv6DARnBdF8?=
 =?us-ascii?Q?g5GmRv7I6EwEUy9J034OI5dU3jS9G9wsgJvmh2rWx4BK+wOUb5IjqFJXCr7q?=
 =?us-ascii?Q?lsbZGukzv0ijR4JfFI1d+lG68CwBSdtQS31PWMUSVcxX4fUuc5V/lk7reVW3?=
 =?us-ascii?Q?ypO/dr+kqq0TlDlOj7njCpKSaC2VG+onQpKqmKksXOeeXQfn2LZsaNp2TSsL?=
 =?us-ascii?Q?aC13KkZsIRHSbDw7iUxoeFg76zfu7+mH4VKxyCMZJDtPYPNy7zEC5dHEhcmV?=
 =?us-ascii?Q?/hyZpzDIQq8I3rqZy/mBRyIWl/F7WcW+CBv3dvvNpK0fbMlamGKoOZz4NOmw?=
 =?us-ascii?Q?joJfSJHa0zhjuFQdqXk4J0/TeubLIJmMS1dzZWdx2yl/5rpgHIhH2Hna/oi1?=
 =?us-ascii?Q?+iz3tUBS+a7EofTZ7DiTwysp7F2BM0H1mcCSpZOwtGHpyFMj4TA7xJ5KpZkU?=
 =?us-ascii?Q?BvgWLNRV2OhKqe5/pGT51H5l2xvFOoxipWb7cH5Fgs2jAIbUzMMaCa4RWwtC?=
 =?us-ascii?Q?HVYhWd7QgdQ01VL0887ekMCJgIFC3K235CSUOj4HIxf4+MjVivVg/KB6+Ga3?=
 =?us-ascii?Q?aS3IZ7958Iu9Jnle3gg0cdfkBxw/OR4gNSqtuy/IMcbiyuwwoACb4IwYcDB4?=
 =?us-ascii?Q?8ry3QOsAf9J1yqJWn+RZXm/xcAh8nCaNSobdH8lIAgIRGI01gBbiqqGDK1BY?=
 =?us-ascii?Q?jrp4XYJbo2jrWNCTRcoyxGGTeMcRHK3HS5FaTYKQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16991b73-c24a-44da-a3cb-08dd8816b139
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 18:42:00.0452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DPGF7lKcTxjjeNfNIOZmPNAmJE63URVEHeQJ2fAt+pENNWE0thcSPK8QkNrMiM8wtwJn6Pet/0pN9xfALCSpPbsyYSyPpWqJLAKaiQ4r9Vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7573
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
From: Hirschfeld, Dafna <dafna.hirschfeld@intel.com>=20
Sent: Wednesday, April 30, 2025 12:07 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost=
, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.co=
m>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.o=
rg; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal.=
mrozek@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Harrison, John C <jo=
hn.c.harrison@intel.com>; Briano, Ivan <ivan.briano@intel.com>; Auld, Matth=
ew <matthew.auld@intel.com>
Subject: Re: [PATCH v23 2/5] drm/xe/xe_gt_pagefault: Move pagefault struct =
to header
>=20
> On 29.04.2025 17:22, Dafna Hirschfeld wrote:
> >On 24.04.2025 20:49, Jonathan Cavitt wrote:
> >>Move the pagefault struct from xe_gt_pagefault.c to the
> >>xe_gt_pagefault_types.h header file, and move the associated enum value=
s
> >>into the regs folder under xe_pagefault_desc.h
> >>
> >>Since xe_pagefault_desc.h is being initialized here, also move the
> >>xe_guc_pagefault_desc hardware formats to the new file.
> >>
> >>v2:
> >>- Normalize names for common header (Matt Brost)
> >>
> >>v3:
> >>- s/Migrate/Move (Michal W)
> >>- s/xe_pagefault/xe_gt_pagefault (Michal W)
> >>- Create new header file, xe_gt_pagefault_types.h (Michal W)
> >>- Add kernel docs (Michal W)
> >>
> >>v4:
> >>- Fix includes usage (Michal W)
> >>- Reference Bspec (Michal W)
> >>
> >>v5:
> >>- Convert enums to defines in regs folder (Michal W)
> >>- Move xe_guc_pagefault_desc to regs folder (Michal W)
> >>
> >>Bspec: 77412
> >>Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >>Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> >>Acked-by: Matthew Brost <matthew.brost@intel.com>
> >>Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> >>---
> >>drivers/gpu/drm/xe/regs/xe_pagefault_desc.h | 49 +++++++++++++++++++++
> >>drivers/gpu/drm/xe/xe_gt_pagefault.c        | 43 ++++--------------
> >>drivers/gpu/drm/xe/xe_gt_pagefault_types.h  | 42 ++++++++++++++++++
> >>drivers/gpu/drm/xe/xe_guc_fwif.h            | 28 ------------
> >>4 files changed, 100 insertions(+), 62 deletions(-)
> >>create mode 100644 drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
> >>create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> >>
> >>diff --git a/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h b/drivers/gpu/=
drm/xe/regs/xe_pagefault_desc.h
> >>new file mode 100644
> >>index 000000000000..a169ac274e14
> >>--- /dev/null
> >>+++ b/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
> >
> >Maybe change the file name to xe_guc_pagefault_desc.h ,
> >since this is currently guc specific.

On paper, this shouldn't be a difficult change, though I'd like to ask
@Brost, Matthew and @Wajdeczko, Michal if this request is
amenable.

> >
> >Also, the define 'PF_MSG_LEN_DW	4' relates to the
> >length of this struct so should move here.

I don't see the harm in moving it, though I'd like to wait for a second
opinion before proceeding.

>=20
> Actually, the struct 'xe_guc_acc_desc' and its defines should
> also move here.

IMO, I think that if xe_guc_acc_desc needed to be extracted from the
xe_gt_pagefault.c file, it should be put in its own header file in the regs
folder, rather than sharing a file with xe_guc_pagefault_desc.h.  Say,
regs/xe_guc_acc_desc.h?

Though at that point, I think the migration would be out of scope for
this series.
-Jonathan Cavitt

>=20
> Thanks,
> Dafna
>=20
> >
> >Thanks,
> >Dafna
> >
> >>@@ -0,0 +1,49 @@
> >>+/* SPDX-License-Identifier: MIT */
> >>+/*
> >>+ * Copyright (c) 2025 Intel Corporation
> >>+ */
> >>+
> >>+#ifndef _XE_PAGEFAULT_DESC_H_
> >>+#define _XE_PAGEFAULT_DESC_H_
> >>+
> >>+#include <linux/bits.h>
> >>+#include <linux/types.h>
> >>+
> >>+struct xe_guc_pagefault_desc {
> >>+	u32 dw0;
> >>+#define PFD_FAULT_LEVEL		GENMASK(2, 0)
> >>+#define PFD_SRC_ID		GENMASK(10, 3)
> >>+#define PFD_RSVD_0		GENMASK(17, 11)
> >>+#define XE2_PFD_TRVA_FAULT	BIT(18)
> >>+#define PFD_ENG_INSTANCE	GENMASK(24, 19)
> >>+#define PFD_ENG_CLASS		GENMASK(27, 25)
> >>+#define PFD_PDATA_LO		GENMASK(31, 28)
> >>+
> >>+	u32 dw1;
> >>+#define PFD_PDATA_HI		GENMASK(11, 0)
> >>+#define PFD_PDATA_HI_SHIFT	4
> >>+#define PFD_ASID		GENMASK(31, 12)
> >>+
> >>+	u32 dw2;
> >>+#define PFD_ACCESS_TYPE		GENMASK(1, 0)
> >>+#define PFD_FAULT_TYPE		GENMASK(3, 2)
> >>+#define PFD_VFID		GENMASK(9, 4)
> >>+#define PFD_RSVD_1		GENMASK(11, 10)
> >>+#define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
> >>+#define PFD_VIRTUAL_ADDR_LO_SHIFT 12
> >>+
> >>+	u32 dw3;
> >>+#define PFD_VIRTUAL_ADDR_HI	GENMASK(31, 0)
> >>+#define PFD_VIRTUAL_ADDR_HI_SHIFT 32
> >>+} __packed;
> >>+
> >>+#define FLT_ACCESS_TYPE_READ		0u
> >>+#define FLT_ACCESS_TYPE_WRITE		1u
> >>+#define FLT_ACCESS_TYPE_ATOMIC		2u
> >>+#define FLT_ACCESS_TYPE_RESERVED	3u
> >>+
> >>+#define FLT_TYPE_NOT_PRESENT_FAULT		0u
> >>+#define FLT_TYPE_WRITE_ACCESS_VIOLATION		1u
> >>+#define FLT_TYPE_ATOMIC_ACCESS_VIOLATION	2u
> >>+
> >>+#endif
> >>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/=
xe_gt_pagefault.c
> >>index d4e3b7eb165a..93afa54c8780 100644
> >>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> >>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> >>@@ -12,8 +12,10 @@
> >>#include <drm/drm_managed.h>
> >>
> >>#include "abi/guc_actions_abi.h"
> >>+#include "regs/xe_pagefault_desc.h"
> >>#include "xe_bo.h"
> >>#include "xe_gt.h"
> >>+#include "xe_gt_pagefault_types.h"
> >>#include "xe_gt_stats.h"
> >>#include "xe_gt_tlb_invalidation.h"
> >>#include "xe_guc.h"
> >>@@ -23,33 +25,6 @@
> >>#include "xe_trace_bo.h"
> >>#include "xe_vm.h"
> >>
> >>-struct pagefault {
> >>-	u64 page_addr;
> >>-	u32 asid;
> >>-	u16 pdata;
> >>-	u8 vfid;
> >>-	u8 access_type;
> >>-	u8 fault_type;
> >>-	u8 fault_level;
> >>-	u8 engine_class;
> >>-	u8 engine_instance;
> >>-	u8 fault_unsuccessful;
> >>-	bool trva_fault;
> >>-};
> >>-
> >>-enum access_type {
> >>-	ACCESS_TYPE_READ =3D 0,
> >>-	ACCESS_TYPE_WRITE =3D 1,
> >>-	ACCESS_TYPE_ATOMIC =3D 2,
> >>-	ACCESS_TYPE_RESERVED =3D 3,
> >>-};
> >>-
> >>-enum fault_type {
> >>-	NOT_PRESENT =3D 0,
> >>-	WRITE_ACCESS_VIOLATION =3D 1,
> >>-	ATOMIC_ACCESS_VIOLATION =3D 2,
> >>-};
> >>-
> >>struct acc {
> >>	u64 va_range_base;
> >>	u32 asid;
> >>@@ -61,9 +36,9 @@ struct acc {
> >>	u8 engine_instance;
> >>};
> >>
> >>-static bool access_is_atomic(enum access_type access_type)
> >>+static bool access_is_atomic(u32 access_type)
> >>{
> >>-	return access_type =3D=3D ACCESS_TYPE_ATOMIC;
> >>+	return access_type =3D=3D FLT_ACCESS_TYPE_ATOMIC;
> >>}
> >>
> >>static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
> >>@@ -205,7 +180,7 @@ static struct xe_vm *asid_to_vm(struct xe_device *x=
e, u32 asid)
> >>	return vm;
> >>}
> >>
> >>-static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> >>+static int handle_pagefault(struct xe_gt *gt, struct xe_gt_pagefault *=
pf)
> >>{
> >>	struct xe_device *xe =3D gt_to_xe(gt);
> >>	struct xe_vm *vm;
> >>@@ -237,7 +212,7 @@ static int handle_pagefault(struct xe_gt *gt, struc=
t pagefault *pf)
> >>		goto unlock_vm;
> >>	}
> >>
> >>-	if (xe_vma_read_only(vma) && pf->access_type !=3D ACCESS_TYPE_READ) {
> >>+	if (xe_vma_read_only(vma) && pf->access_type !=3D FLT_ACCESS_TYPE_REA=
D) {
> >>		err =3D -EPERM;
> >>		goto unlock_vm;
> >>	}
> >>@@ -271,7 +246,7 @@ static int send_pagefault_reply(struct xe_guc *guc,
> >>	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> >>}
> >>
> >>-static void print_pagefault(struct xe_device *xe, struct pagefault *pf=
)
> >>+static void print_pagefault(struct xe_device *xe, struct xe_gt_pagefau=
lt *pf)
> >>{
> >>	drm_dbg(&xe->drm, "\n\tASID: %d\n"
> >>		 "\tVFID: %d\n"
> >>@@ -291,7 +266,7 @@ static void print_pagefault(struct xe_device *xe, s=
truct pagefault *pf)
> >>
> >>#define PF_MSG_LEN_DW	4
> >>
> >>-static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault =
*pf)
> >>+static bool get_pagefault(struct pf_queue *pf_queue, struct xe_gt_page=
fault *pf)
> >>{
> >>	const struct xe_guc_pagefault_desc *desc;
> >>	bool ret =3D false;
> >>@@ -378,7 +353,7 @@ static void pf_queue_work_func(struct work_struct *=
w)
> >>	struct xe_gt *gt =3D pf_queue->gt;
> >>	struct xe_device *xe =3D gt_to_xe(gt);
> >>	struct xe_guc_pagefault_reply reply =3D {};
> >>-	struct pagefault pf =3D {};
> >>+	struct xe_gt_pagefault pf =3D {};
> >>	unsigned long threshold;
> >>	int ret;
> >>
> >>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu/d=
rm/xe/xe_gt_pagefault_types.h
> >>new file mode 100644
> >>index 000000000000..b7d41b558de3
> >>--- /dev/null
> >>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> >>@@ -0,0 +1,42 @@
> >>+/* SPDX-License-Identifier: MIT */
> >>+/*
> >>+ * Copyright (c) 2022-2025 Intel Corporation
> >>+ */
> >>+
> >>+#ifndef _XE_GT_PAGEFAULT_TYPES_H_
> >>+#define _XE_GT_PAGEFAULT_TYPES_H_
> >>+
> >>+#include <linux/types.h>
> >>+
> >>+/**
> >>+ * struct xe_gt_pagefault - Structure of pagefaults returned by the
> >>+ * pagefault handler
> >>+ */
> >>+struct xe_gt_pagefault {
> >>+	/** @page_addr: faulted address of this pagefault */
> >>+	u64 page_addr;
> >>+	/** @asid: ASID of this pagefault */
> >>+	u32 asid;
> >>+	/** @pdata: PDATA of this pagefault */
> >>+	u16 pdata;
> >>+	/** @vfid: VFID of this pagefault */
> >>+	u8 vfid;
> >>+	/** @access_type: access type of this pagefault */
> >>+	u8 access_type;
> >>+	/** @fault_type: fault type of this pagefault */
> >>+	u8 fault_type;
> >>+	/** @fault_level: fault level of this pagefault */
> >>+	u8 fault_level;
> >>+	/** @engine_class: engine class this pagefault was reported on */
> >>+	u8 engine_class;
> >>+	/** @engine_instance: engine instance this pagefault was reported on =
*/
> >>+	u8 engine_instance;
> >>+	/** @fault_unsuccessful: flag for if the pagefault recovered or not *=
/
> >>+	u8 fault_unsuccessful;
> >>+	/** @prefetch: unused */
> >>+	bool prefetch;
> >>+	/** @trva_fault: is set if this is a TRTT fault */
> >>+	bool trva_fault;
> >>+};
> >>+
> >>+#endif
> >>diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_g=
uc_fwif.h
> >>index 6f57578b07cb..30ac21bb4f15 100644
> >>--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> >>+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> >>@@ -290,34 +290,6 @@ enum xe_guc_response_desc_type {
> >>	FAULT_RESPONSE_DESC
> >>};
> >>
> >>-struct xe_guc_pagefault_desc {
> >>-	u32 dw0;
> >>-#define PFD_FAULT_LEVEL		GENMASK(2, 0)
> >>-#define PFD_SRC_ID		GENMASK(10, 3)
> >>-#define PFD_RSVD_0		GENMASK(17, 11)
> >>-#define XE2_PFD_TRVA_FAULT	BIT(18)
> >>-#define PFD_ENG_INSTANCE	GENMASK(24, 19)
> >>-#define PFD_ENG_CLASS		GENMASK(27, 25)
> >>-#define PFD_PDATA_LO		GENMASK(31, 28)
> >>-
> >>-	u32 dw1;
> >>-#define PFD_PDATA_HI		GENMASK(11, 0)
> >>-#define PFD_PDATA_HI_SHIFT	4
> >>-#define PFD_ASID		GENMASK(31, 12)
> >>-
> >>-	u32 dw2;
> >>-#define PFD_ACCESS_TYPE		GENMASK(1, 0)
> >>-#define PFD_FAULT_TYPE		GENMASK(3, 2)
> >>-#define PFD_VFID		GENMASK(9, 4)
> >>-#define PFD_RSVD_1		GENMASK(11, 10)
> >>-#define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
> >>-#define PFD_VIRTUAL_ADDR_LO_SHIFT 12
> >>-
> >>-	u32 dw3;
> >>-#define PFD_VIRTUAL_ADDR_HI	GENMASK(31, 0)
> >>-#define PFD_VIRTUAL_ADDR_HI_SHIFT 32
> >>-} __packed;
> >>-
> >>struct xe_guc_pagefault_reply {
> >>	u32 dw0;
> >>#define PFR_VALID		BIT(0)
> >>--=20
> >>2.43.0
> >>
>=20
