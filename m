Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344AEC99284
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 22:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CDD10E469;
	Mon,  1 Dec 2025 21:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ht24G94Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCEA10E113;
 Mon,  1 Dec 2025 21:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764623943; x=1796159943;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0zSBBmTXo18KbvIyZz0Ld1f/9OT+DePMW0yVjsBbnJ4=;
 b=ht24G94ZD2ysZ0uy00Cr1SKap4purK6prIXwZJKGCGfwOjTZJG/e8fv7
 WWe3okWQK2qq+9ZU1CpstX2G0hK6gf2j3wYPvpzFtpv6q3t4PZsoiv1Fa
 lpwERfPf9iE74XOzwmSVEu2CrYu/WfSmQjv05fvobYvee+TTrRhoeXRQT
 XxQT4ntjio/9Vtp2ykQk4Z1Yrd0Avc6rU1b1ZzTCkMiNvde9aBcp6eAp2
 WopRwrzAvCVH994ZTZnZELyMaL0ZNMFTYPOSqL8GS3Fz8Gvge6/Jk7jFW
 DiYMcVvCqG9dDZoSV3vFcDD0X/OqqLLyinR7FcIaz9IT9tXUadYs5SR1n Q==;
X-CSE-ConnectionGUID: EAy+cGISQ4q4VXcKEpZ4wQ==
X-CSE-MsgGUID: xs/KGuEuSO+92iTXYwQ1Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77207734"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="77207734"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 13:19:02 -0800
X-CSE-ConnectionGUID: 8k5GYUT4Tsq/lRAWtcdN7Q==
X-CSE-MsgGUID: /TqVID/BQbe7Tx0uggyDXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="217522542"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 13:19:02 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 13:19:01 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 13:19:01 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 13:19:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grz8OhQkZ+pXDMBnWiQ3J3yH/LGw8x6M+UEzDqdvhw997rDpBeNSl/BgBRO1nJvQXX95FwRLN677eCKYxk79C49gcgCus0Q7Ab1KCnOXNPfnOrOWkXcTBXnNAE8nf2NrnhsN4RrntZWVpdsyFAvpwjdWX0/LTM0dFLEQqoyhhrLOeF4J3lO3rzE4ptn1oWFMqRw271fAGWImsmhSpPV4cHVmx7ZNMNPS532Tblz+1veznsKIZTY+4CfGk92LcFf+SwRWwlTbpAOZbz7sz3Ahxznxy6ea5IfFdayOBnkCV5RLOOjBsGvJGHCsabU1UeT7dsozhaZTb3u4SoCf9dsekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qP21tKjxGQfDXuDe5XBTgD3wcBOF6iY3K8p97HJ+uqg=;
 b=jHMg1Covb7ShgkHXcnESaP/vw+1qlQsdaIBSES3uRgusoUjiNO8IczDXsyIilbisFMr7dsXQwjcSq+QGjsqt8KEUEUk/wdAwb+JqoOXIIxZu+KbwAj73ktoexcr5A6P9d5JtSC6lt2J+BfzzcJOvNF+AJ8Nfv2h9pQj+Gx8+83JgOamuxsAQBXplB+PEHkXmr90DHx33SC3Y+WuH1ySmzapwvjqGj7fdOee6S06XoVt72NJBNRWLB26NugvOKJrkCCJCGgXyAap9ORYr2OFhE2dXgo/PTtRKK17qZb3Iet8y7fVi0oAUbCH1OlgGNsUXQp2Zcs5PEVb4CJuaYXHXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS0PR11MB6470.namprd11.prod.outlook.com (2603:10b6:8:c2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 21:18:57 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 21:18:57 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "john.c.harrison@intel.com"
 <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Hirschfeld, Dafna"
 <dafna.hirschfeld@intel.com>
Subject: RE: [PATCH v27 3/4] drm/xe/xe_vm: Add per VM fault info
Thread-Topic: [PATCH v27 3/4] drm/xe/xe_vm: Add per VM fault info
Thread-Index: AQHcYuo1GIlWr53Ct02upu4aNZAfdrUNKKMAgAASkACAAAuWIA==
Date: Mon, 1 Dec 2025 21:18:57 +0000
Message-ID: <DM4PR11MB54565168AC71BCFE647EF783EADBA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251201174443.139151-6-jonathan.cavitt@intel.com>
 <20251201174443.139151-9-jonathan.cavitt@intel.com>
 <aS3p9Cwhwu8tWFNb@lstrano-desk.jf.intel.com>
 <CH0PR11MB54440A4D690DE5A8730EF7C3E5DBA@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB54440A4D690DE5A8730EF7C3E5DBA@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS0PR11MB6470:EE_
x-ms-office365-filtering-correlation-id: ce6938e3-57b3-41c5-83cf-08de311f3d6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?40YCx6HnpCHux0howT/BxGA/WgabKmpRQukal9Ke9+vXUmSCXSk97gc0ystf?=
 =?us-ascii?Q?MZrXThhwqJp2sKT8vClB80qA6JuNsqkiS2z3/SemJoyIgnqtH7+v3YHfNCyb?=
 =?us-ascii?Q?FEyXLUI2nccmaHHUu3hC/dsnxZl6q58UGUYJjrQodlM7lgDyTQ8rSpuj4nnk?=
 =?us-ascii?Q?kWCnt38/rbfJawBvbZkArXDixmK1yYnEt5dXnUrrjFBrh6LXAuILTDQmirN5?=
 =?us-ascii?Q?urrBMibWrAi1JHlfU/DsMkxO7zjHkflZ6eEkJj63mnVpeevsSs9UHBrURc/N?=
 =?us-ascii?Q?1vuk0LM9RG8i6MCKq0jEqMsGHJOsbS/g4DfgxSGwfvB41jSwL7Opw5UCdbgv?=
 =?us-ascii?Q?urPDwQCC86hdaKGU2l5dtILHa/7zCJRejNWrF6+33l+ZJMBDwRqjEi35RREc?=
 =?us-ascii?Q?U4UM16cDWneSy9ch/mpaEDslRyhNu8bOsgiA1W/255KRcJZmrbZpeErxIloW?=
 =?us-ascii?Q?IPxF9u3/rSvirSj2Iiise2EoJlTTtsQLmYCgu4kmsvjYOob6L8Q0aXVscU5n?=
 =?us-ascii?Q?fvcTyhrdwRHyqi0v56JWKGiDXn/CnHXRdxPz5bTIiCyMobh4I+1KA0398etz?=
 =?us-ascii?Q?FvTiXvkwlSHh6SJSwm9/75i0hrHMtnckEMRr77XINkeza7N3WK8ILPaCuQc+?=
 =?us-ascii?Q?r0pcuJetJfT6ygMpLB1QX4H+3IcFaG0oKz/tXAYTiH8u9YjJTI5VcezH1e5r?=
 =?us-ascii?Q?I5WDMHhw7qEio68AUf4ZdkugMzqZUHptZCr1hVBnOpcazMK8Bn8BV+JssLGU?=
 =?us-ascii?Q?DRWQP9UraFzkQWW/i/idxvSB2mauJufAYDISEJs4fUC4yq2At0axiRfCwWk6?=
 =?us-ascii?Q?92wxIn83DLOYGIKJ1rPSi/s/D9vmgquS+Tb/tjwXwVd5qCU//6ok5T0rZrRC?=
 =?us-ascii?Q?SeaCkZNkN6hSGzB1UHoC11LnMFg+ZMmjwkIwk2ypBbFJFQ245kZEFkDoq0uH?=
 =?us-ascii?Q?gSaQ0dplWvQ/oV6cTogyNFixGhXRLtydRX2Uu31QedTptv+mMLvA1qI3tKno?=
 =?us-ascii?Q?8G6fMosfLriZXAmdgF2c0mG1/nR0bObg3UYyD/e2RA1ioEQA8YoR7/WzwtpM?=
 =?us-ascii?Q?cwdSklRVNb762mo1QPIwLHCrXJNwD4xqx7nzAZ64CkvhZJ3/hUwO9KzYFbkS?=
 =?us-ascii?Q?+VIaSgfMnOlEpAso4nBiSAoHGhQZtKX/oPJBy+w7AdZsDvty/R11/9U+m+h0?=
 =?us-ascii?Q?UwcXW1++glJHtaFwLQTpAbsK1UPbvEiJJ0D4+ZHuT5aUFqU1/CYRlF9DLieD?=
 =?us-ascii?Q?2lm0ExiD5IQJILhOkH2uKzeYjSMBL1N2iIudVPEpjowFNgJUXFS2CcAMGuYy?=
 =?us-ascii?Q?GVZUJ0FFT/GNb6Cje8geaJhMzdqryx+pobJ3aQowrp/kfS4GuabEAdq6pKLJ?=
 =?us-ascii?Q?5twsw7JRKueBzaw6iFUYk0iVMnxsOiDCPrx/Zz/2CJpTfzqoYxRNZqweB/j8?=
 =?us-ascii?Q?HKo0GB9D1vt3PYWVAuxbIgkff2f9UUThZvILvVjpH0MkvXvVf3ev23tHv27p?=
 =?us-ascii?Q?Ox4yoLKl7COdIFZfLFUZJs2Oxynb0XMDqHfn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/INJvYaa1LBYazBWWYgYmnabq3E4GIsoVVo/HnUxyS/uTqQBos627pfBHCcX?=
 =?us-ascii?Q?xrRod6uWJl3la6g0B4cCLqn1zD6AyRgotzwIgHXzGGgqtVYEq0ON5JpXjkR0?=
 =?us-ascii?Q?VfYSB9YItBdB3UOaG40ckmGxrK/m0gxnJipKPBDJgP/VB4ONRnz5o6W9bJzp?=
 =?us-ascii?Q?WVyzH06UjauXfwKqRQe+EyX1L/wwNAGngxwm9L3i3OQNfb4S2LQWKVRBTmEb?=
 =?us-ascii?Q?UwN8UAYO/kDZJG/QHKqaTgH8Dou9ka7JEPz8zAPD5WMMjuHB37D8YoNobrXw?=
 =?us-ascii?Q?voHCuuiWLoE3064peQH5KkAjkiWeypV0Jw03lkm7H+KAfBPRxiIDu07UPTJz?=
 =?us-ascii?Q?I8h2TX3OtHp8aXrnZ03+cVopk4xvILv+jl8nfO02pM5ArxJoOaknNmzu6BN2?=
 =?us-ascii?Q?KpAf1FgNjm++rUY5v6Zr2NhwD6c+byhJX0UTsqkmPeeYrDO247jjhlOMOV90?=
 =?us-ascii?Q?aMeRNNuT7mRLH6A54Y2IixJ707Q5Rc8/HVa3w9L59urF7KUrUr6gpNhSQg1O?=
 =?us-ascii?Q?oBR5hhncRM/acteFpPyDKzNUuUcc33wXmOQghsJuZ5iNHOQ1umdzoOTRiqTQ?=
 =?us-ascii?Q?xV8zdY5kke5NoAnTfiktz21pwCxlHKUSIGU4tHxWyzYEWoKui5nh7D6f7Lub?=
 =?us-ascii?Q?AEH4jxE8Yt5+9cqHy8B6Id51PaY+6Avi/Uq4lqoBjKt0U4128uqkOpmFZZtZ?=
 =?us-ascii?Q?7ELvcnWAIuY5dZucYQHUlF/+n/k/XHt4lYnI/OpUxfKjTs8pBRzcgFSql4Ur?=
 =?us-ascii?Q?Osu7AxbOpmsCdBZ6G2d05yMMHiMz2arCeV8PtHrP+wkwWTTOwpkbBo1dh2kv?=
 =?us-ascii?Q?/9mZNdpcJ4Nt9d1qcCsFiGy7dwXt+8/l1QG3XM+qOust1Ms5CARn/cRlmS18?=
 =?us-ascii?Q?Px0hdp8EejuUExmnvhT2IW3fTxIpSM5rVGtBaoBE1TE3Zcf4Xhi1aiaabmtT?=
 =?us-ascii?Q?W4uSZGPL7jPN4JjJM3Q9vujZHas/OC4B3vixfR7yEX8mTAYp128mxGkLb5bp?=
 =?us-ascii?Q?zv66xibAWox2l5+iiUmUNfASaQuHYv8uQFAfImdDxPs67aDz8CuiSvDVqoOJ?=
 =?us-ascii?Q?fGD5RN5ZEN5rJoHFtlPyn9VfW1EHDCeq5A+U1rELDzq1IDWk/LdDsV/76PMj?=
 =?us-ascii?Q?7nc0eVtMU65i/WTaDHguJfkLYOtY+5PROEq0h26yskRwMtxdJLgsnZqrdiEV?=
 =?us-ascii?Q?0CAJpY7z1Btki4p5xuSRo3JndOyc+cR6+GLh/1CuzM4B34kHvGslpZalmP81?=
 =?us-ascii?Q?Hr2C8VfB2VYK6zC1wTTiWUh7GBI9S/hq7BMFJePiqLiUw70m3kWPrTIEUFRS?=
 =?us-ascii?Q?DQxj60rfMvWK3Ewxvn73IPviWbbElwUeSUimyyIW9PSPX8RGkyXm7HvztuRj?=
 =?us-ascii?Q?d/IL4VA5KR8+rlsREnLgTbroRaCrw4mEgh8PM4dH49zGnMYDoRehRlztmp/U?=
 =?us-ascii?Q?cZUBmEoG0q/eqw9tzKA6TsD7/GzxCWTcjKaa0YkCHd22Swz1p6xbLU7qFutN?=
 =?us-ascii?Q?vk0UvwO1xr8878+228ESmdoqI8/lL2lFI9jZA5v1ab9WX6MBoKgD52g4otQL?=
 =?us-ascii?Q?bcWmH8KIeZkP64qIE4yGbUhnvNV3K8memyHRT4lM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6938e3-57b3-41c5-83cf-08de311f3d6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 21:18:57.7102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: beTWKadKmQU/WHnP4iUqH7Bi9sImKNwffkkz0M8z6FhiavXyPJngyV1GSYnbSNvX0d2WCLQ8ZALKnX06UB5QAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6470
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

On Mon, Dec 1, 2025 12:25 PM Jonathan Cavitt wrote:
> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Monday, December 1, 2025 11:18 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg
> <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>;
> joonas.lahtinen@linux.intel.com; Zhang, Jianxun <jianxun.zhang@intel.com>=
;
> Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.org=
;
> Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal
> <michal.mrozek@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> john.c.harrison@intel.com; Briano, Ivan <ivan.briano@intel.com>; Auld,
> Matthew <matthew.auld@intel.com>; Hirschfeld, Dafna
> <dafna.hirschfeld@intel.com>
> Subject: Re: [PATCH v27 3/4] drm/xe/xe_vm: Add per VM fault info
> >
> > On Mon, Dec 01, 2025 at 05:44:47PM +0000, Jonathan Cavitt wrote:
> > > Add additional information to each VM so they can report up to the
> > > first
> > > 50 seen faults.  Only pagefaults are saved this way currently,
> > > though in the future, all faults should be tracked by the VM for futu=
re
> reporting.
> > >
> > > Additionally, of the pagefaults reported, only failed pagefaults are
> > > saved this way, as successful pagefaults should recover silently and
> > > not need to be reported to userspace.
> > >
> > > v2:
> > > - Free vm after use (Shuicheng)
> > > - Compress pf copy logic (Shuicheng)
> > > - Update fault_unsuccessful before storing (Shuicheng)
> > > - Fix old struct name in comments (Shuicheng)
> > > - Keep first 50 pagefaults instead of last 50 (Jianxun)
> > >
> > > v3:
> > > - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> > > - Fix double-locking error (jcavitt)
> > > - Assert kmemdump is successful (Shuicheng)
> > >
> > > v4:
> > > - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> > > - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> > > - Store address, address type, and address precision per fault
> > > (jcavitt)
> > > - Store engine class and instance data per fault (Jianxun)
> > > - Add and fix kernel docs (Michal W)
> > > - Properly handle kzalloc error (Michal W)
> > > - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> > > - Store fault level per fault (Micahl M)
> > >
> > > v5:
> > > - Store fault and access type instead of address type (Jianxun)
> > >
> > > v6:
> > > - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> > >
> > > v7:
> > > - Fix kernel docs and comments (Michal W)
> > >
> > > v8:
> > > - Fix double-locking issue (Jianxun)
> > >
> > > v9:
> > > - Do not report faults from reserved engines (Jianxun)
> > >
> > > v10:
> > > - Remove engine class and instance (Ivan)
> > >
> > > v11:
> > > - Perform kzalloc outside of lock (Auld)
> > >
> > > v12:
> > > - Fix xe_vm_fault_entry kernel docs (Shuicheng)
> > >
> > > v13:
> > > - Rebase and refactor (jcavitt)
> > >
> > > v14:
> > > - Correctly ignore fault mode in save_pagefault_to_vm (jcavitt)
> > >
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > > Cc: Jianxun Zhang <jianxun.zhang@intel.com>
> > > Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> > > Cc: Michal Mzorek <michal.mzorek@intel.com>
> > > Cc: Ivan Briano <ivan.briano@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pagefault.c | 26 +++++++++
> > >  drivers/gpu/drm/xe/xe_vm.c        | 88
> +++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_vm.h        |  9 ++++
> > >  drivers/gpu/drm/xe/xe_vm_types.h  | 29 ++++++++++
> > >  4 files changed, 152 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > > b/drivers/gpu/drm/xe/xe_pagefault.c
> > > index 0b625a52a598..5997023a5889 100644
> > > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > @@ -247,6 +247,31 @@ static void xe_pagefault_print(struct
> xe_pagefault *pf)
> > >  		  pf->consumer.engine_instance);
> > >  }
> > >
> > > +static void save_pagefault_to_vm(struct xe_device *xe, struct
> > > +xe_pagefault *pf)
> >
> > Every function in xe_pagefault.c starts with 'xe_pagefault_'
> >
> > So maybe: s/save_pagefault_to_vm/xe_pagefault_save_to_vm
> >
> > > +{
> > > +	struct xe_vm *vm;
> > > +
> > > +	/*
> > > +	 * Pagefault may be asociated to VM that is not in fault mode.
> > > +	 * Perform asid_to_vm behavior, except if VM is not in fault
> > > +	 * mode, return VM anyways.
> > > +	 */
> > > +	down_read(&xe->usm.lock);
> > > +	vm =3D xa_load(&xe->usm.asid_to_vm, pf->consumer.asid);
> > > +	if (vm)
> > > +		xe_vm_get(vm);
> > > +	else
> > > +		vm =3D ERR_PTR(-EINVAL);
> > > +	up_read(&xe->usm.lock);
> > > +
> > > +	if (IS_ERR(vm))
> > > +		return;
> > > +
> > > +	xe_vm_add_fault_entry_pf(vm, pf);
> > > +
> > > +	xe_vm_put(vm);
> > > +}
> > > +
> > >  static void xe_pagefault_queue_work(struct work_struct *w)  {
> > >  	struct xe_pagefault_queue *pf_queue =3D @@ -266,6 +291,7 @@ static
> > > void xe_pagefault_queue_work(struct work_struct *w)
> > >  		err =3D xe_pagefault_service(&pf);
> > >  		if (err) {
> > >  			xe_pagefault_print(&pf);
> > > +			save_pagefault_to_vm(gt_to_xe(pf.gt), &pf);
> > >  			xe_gt_dbg(pf.gt, "Fault response:
> Unsuccessful %pe\n",
> > >  				  ERR_PTR(err));
> > >  		}
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 8ab726289583..e69e10233b00 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -27,6 +27,7 @@
> > >  #include "xe_device.h"
> > >  #include "xe_drm_client.h"
> > >  #include "xe_exec_queue.h"
> > > +#include "xe_gt.h"
> > >  #include "xe_migrate.h"
> > >  #include "xe_pat.h"
> > >  #include "xe_pm.h"
> > > @@ -578,6 +579,88 @@ static void preempt_rebind_work_func(struct
> work_struct *w)
> > >  	trace_xe_vm_rebind_worker_exit(vm);
> > >  }
> > >
> > > +static struct xe_hw_engine *
> > > +hw_engine_lookup_class_instance(struct xe_vm *vm,
> > > +				enum xe_engine_class class,
> > > +				u16 instance)
> >
> > Can we use xe_hw_engine_lookup or xe_gt_hw_engine rather than adding a
> > new helper?
>=20
> Both of those functions require the GT ID, which is unknown.

GT ID should be able to got from pf->gt->info.id.

Shuicheng

>=20
> >
> > > +{
> > > +	struct xe_device *xe =3D vm->xe;
> > > +	struct xe_hw_engine *hwe;
> > > +	enum xe_hw_engine_id id;
> > > +	struct xe_gt *gt;
> > > +	u8 gt_id;
> > > +
> > > +	for_each_gt(gt, xe, gt_id)
> > > +		for_each_hw_engine(hwe, gt, id)
> > > +			if (hwe->class =3D=3D class && hwe->instance =3D=3D instance)
> > > +				return hwe;
> > > +	return NULL;
> > > +}
> > > +
> > > +/**
> > > + * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
> > > + * @vm: The VM.
> > > + * @pf: The pagefault.
> > > + *
> > > + * This function takes the data from the pagefault @pf and saves it =
to
> @vm->faults.list.
> > > + *
> > > + * The function exits silently if the list is full, and reports a
> > > +warning if the pagefault
> > > + * could not be saved to the list.
> > > + */
> > > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault
> > > +*pf) {
> > > +	struct xe_vm_fault_entry *e =3D NULL;
> > > +	struct xe_hw_engine *hwe;
> > > +
> > > +	/* Do not report faults on reserved engines */
> > > +	hwe =3D hw_engine_lookup_class_instance(vm, pf-
> >consumer.engine_class,
> > > +					      pf->consumer.engine_instance);
> > > +	if (!hwe || xe_hw_engine_is_reserved(hwe))
> > > +		return;
> > > +
> > > +	e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> > > +	if (!e) {
> > > +		drm_warn(&vm->xe->drm,
> > > +			 "Could not allocate memory for fault!\n");
> > > +		return;
> > > +	}
> > > +
> > > +	spin_lock(&vm->faults.lock);
> > > +
> >
> > Michal would say use guard(spinlock)(&vm->faults.lock) here. Probably
> > a little cleaner as the goto can be avoided.
> >
> > > +	/*
> > > +	 * Limit the number of faults in the fault list to prevent
> > > +	 * memory overuse.
> > > +	 */
> > > +	if (vm->faults.len >=3D MAX_FAULTS_SAVED_PER_VM) {
> > > +		kfree(e);
> > > +		goto out;
> > > +	}
> > > +
> > > +	e->address =3D pf->consumer.page_addr;
> > > +	e->address_precision =3D 1;
> > > +	e->access_type =3D pf->consumer.access_type;
> > > +	e->fault_type =3D pf->consumer.fault_type;
> > > +	e->fault_level =3D pf->consumer.fault_level;
> > > +
> > > +	list_add_tail(&e->list, &vm->faults.list);
> > > +	vm->faults.len++;
> > > +out:
> > > +	spin_unlock(&vm->faults.lock);
> > > +}
> > > +
> > > +static void xe_vm_clear_fault_entries(struct xe_vm *vm) {
> > > +	struct xe_vm_fault_entry *e, *tmp;
> > > +
> > > +	spin_lock(&vm->faults.lock);
> >
> > Probably a guard here too.
> >
> > Nits aside, overall LGTM.
> >
> > Matt
> >
> > > +	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
> > > +		list_del(&e->list);
> > > +		kfree(e);
> > > +	}
> > > +	vm->faults.len =3D 0;
> > > +	spin_unlock(&vm->faults.lock);
> > > +}
> > > +
> > >  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool
> > > array_of_binds)  {
> > >  	int i;
> > > @@ -1503,6 +1586,9 @@ struct xe_vm *xe_vm_create(struct xe_device
> *xe, u32 flags, struct xe_file *xef)
> > >  	INIT_LIST_HEAD(&vm->userptr.invalidated);
> > >  	spin_lock_init(&vm->userptr.invalidated_lock);
> > >
> > > +	INIT_LIST_HEAD(&vm->faults.list);
> > > +	spin_lock_init(&vm->faults.lock);
> > > +
> > >  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> > >
> > >  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func); @@ -
> 1808,6
> > > +1894,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > >  	}
> > >  	up_write(&xe->usm.lock);
> > >
> > > +	xe_vm_clear_fault_entries(vm);
> > > +
> > >  	for_each_tile(tile, xe, id)
> > >  		xe_range_fence_tree_fini(&vm->rftree[id]);
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > > index 361f10b3c453..e9f2de4189e0 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -12,6 +12,12 @@
> > >  #include "xe_map.h"
> > >  #include "xe_vm_types.h"
> > >
> > > +/**
> > > + * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm
> can
> > > +store before future
> > > + * faults are discarded to prevent memory overuse  */
> > > +#define MAX_FAULTS_SAVED_PER_VM	50
> > > +
> > >  struct drm_device;
> > >  struct drm_printer;
> > >  struct drm_file;
> > > @@ -22,6 +28,7 @@ struct dma_fence;
> > >
> > >  struct xe_exec_queue;
> > >  struct xe_file;
> > > +struct xe_pagefault;
> > >  struct xe_sync_entry;
> > >  struct xe_svm_range;
> > >  struct drm_exec;
> > > @@ -309,6 +316,8 @@ void xe_vm_snapshot_capture_delayed(struct
> > > xe_vm_snapshot *snap);  void xe_vm_snapshot_print(struct
> > > xe_vm_snapshot *snap, struct drm_printer *p);  void
> > > xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > >
> > > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault
> > > +*pf);
> > > +
> > >  /**
> > >   * xe_vm_set_validating() - Register this task as currently making b=
os
> resident
> > >   * @allow_res_evict: Allow eviction of buffer objects bound to @vm
> > > when diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 3bf912bfbdcc..fff914fb0aa6 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -20,6 +20,7 @@
> > >  #include "xe_userptr.h"
> > >
> > >  struct xe_bo;
> > > +struct xe_pagefault;
> > >  struct xe_svm_range;
> > >  struct xe_sync_entry;
> > >  struct xe_user_fence;
> > > @@ -165,6 +166,24 @@ struct xe_userptr_vma {
> > >
> > >  struct xe_device;
> > >
> > > +/**
> > > + * struct xe_vm_fault_entry - Elements of vm->faults.list
> > > + * @list: link into @xe_vm.faults.list
> > > + * @address: address of the fault
> > > + * @address_precision: precision of faulted address
> > > + * @access_type: type of address access that resulted in fault
> > > + * @fault_type: type of fault reported
> > > + * @fault_level: fault level of the fault  */ struct
> > > +xe_vm_fault_entry {
> > > +	struct list_head list;
> > > +	u64 address;
> > > +	u32 address_precision;
> > > +	u8 access_type;
> > > +	u8 fault_type;
> > > +	u8 fault_level;
> > > +};
> > > +
> > >  struct xe_vm {
> > >  	/** @gpuvm: base GPUVM used to track VMAs */
> > >  	struct drm_gpuvm gpuvm;
> > > @@ -302,6 +321,16 @@ struct xe_vm {
> > >  		bool capture_once;
> > >  	} error_capture;
> > >
> > > +	/** @faults: List of all faults associated with this VM */
> > > +	struct {
> > > +		/** @faults.lock: lock protecting @faults.list */
> > > +		spinlock_t lock;
> > > +		/** @faults.list: list of xe_vm_fault_entry entries */
> > > +		struct list_head list;
> > > +		/** @faults.len: length of @faults.list */
> > > +		unsigned int len;
> > > +	} faults;
> > > +
> > >  	/**
> > >  	 * @validation: Validation data only valid with the vm resv held.
> > >  	 * Note: This is really task state of the task holding the vm
> > > resv,
> > > --
> > > 2.43.0
> > >
> >
