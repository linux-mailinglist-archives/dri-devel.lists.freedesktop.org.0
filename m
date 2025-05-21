Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A5ABEB67
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 07:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F46B10E601;
	Wed, 21 May 2025 05:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YcY6ItGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F33C10E10A;
 Wed, 21 May 2025 05:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747806190; x=1779342190;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=3p23x9B19VCXaC/U0LJTIBaJr6t7eaDRdp23WxDZ3mI=;
 b=YcY6ItGO5L4zIrM2PYKwTQenv/zYT1sx/CM3KidlpQF2hwkBCA4Fq46G
 2KdVSn81FUwtcwAMUQKHklBaZL9Qh/0JYGu3v1scrqI4NfgtGeJDSRZcJ
 /NlUBPqZV8NTv53N/sUT/9FEC2e1u6oscsFNXSBwtGoL4TQ0zxR3sqfVy
 qs66Nl6MIxh+e1mCFGjJOgu3snFOf7BfpJhmujT9Y/pbD4CvW0YMI8OyR
 hkiByURG6c5hmMGs9Nx37nELHotM9PbybqLbVN4oW2LRQU6nygDk6aa/d
 RbwXurij1uT39KAWC2AZdSodUOtRvu/ienPa5Xmai8hHuI44M+i5oXbxp w==;
X-CSE-ConnectionGUID: stQwT0ANTyi6D+byjt07Xg==
X-CSE-MsgGUID: oD6G5XxnRzCSMdh6gbaN5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49669436"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49669436"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:43:09 -0700
X-CSE-ConnectionGUID: OOD5fQJuQOWgsT/Vd6eSWA==
X-CSE-MsgGUID: iHx/EbKjTt6Z7vZ4IHB5Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="170792462"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:43:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 22:43:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 22:43:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 22:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THlnwhpE+mwYvjTtDNi1AAMuj6Etnz7/wdGkreyWr71m/ABO5SaAyO/PRpvz2nMTLbtY8HhMIM80RyvX/UnQ6PrCpBh3b0u9TwmPMtN6ywHhLlnpFSArXXvNPtL9NOTpwY6cvQXhUf1qB+XCdMo5A0WqUfEncw53oS0L9qfIlHE6YLk2/J6PrNebOJZD8qH57fmpzfSpwdJcEU44ysEXisCu5SN1u8JLaBsRRn6n8yTG7SuOpel380AvPWgou5pxzv1DdjhXgkaXAdiXYz0uk7Fft5lJwPaMXBFhOutn+Q0CpQqlHlzToxXOom3a4HDNV8DDom7HNk34N0cIe4UDIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3p23x9B19VCXaC/U0LJTIBaJr6t7eaDRdp23WxDZ3mI=;
 b=rzaYc9P3sAmCIwCONsxNx7xzons1jaOEdJaL9qG/qnSlJadAWZqLdGCRSQeWYsScZ5fk8xCfvPmvvmJNUsrVqHacJlWn0m9PUaGcjPx5bA8W02WNwFvunp6DoRpLASzxI/59/OlhovKVHbTgFJ26Qnig7T2sgdlr+rghX7Vc4G096MrNU42pdFEq+bQ9mbLNcZmQ98VH8fiMSbZR2R/BfNYUk4xepL7wiKSSxeNyldsVSwMu2Zd8UeUZbSNXREGIVSqHuHiXor2xW62ehSuuimdO+XumYxGxiRER9qA2BzQ8Z6VlYSI/+TRc7JIW6B6ZBOJxtrpP9ug3yjM7O6VHsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 05:42:53 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.8722.027; Wed, 21 May 2025
 05:42:53 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 12/12] drm/i915/psr: Do not disable Panel Replay in
 case VRR is enabled
Thread-Topic: [PATCH v2 12/12] drm/i915/psr: Do not disable Panel Replay in
 case VRR is enabled
Thread-Index: AQHbyafRJPGo12+c+0epvYEI6i8667Pch3oAgAALmQA=
Date: Wed, 21 May 2025 05:42:53 +0000
Message-ID: <78b7cc0a8e1faac798d4ce6a33f646aa8180de23.camel@intel.com>
References: <20250520165326.1631330-1-jouni.hogander@intel.com>
 <20250520165326.1631330-13-jouni.hogander@intel.com>
 <3fd9c099-eae0-4f14-89a5-ad463471e3d3@intel.com>
In-Reply-To: <3fd9c099-eae0-4f14-89a5-ad463471e3d3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH8PR11MB6707:EE_
x-ms-office365-filtering-correlation-id: 540ee1a6-e985-4b30-f86b-08dd982a54e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NzNWYVNzeGRnT1JmaXUvbklqeWpYVFBxTTVHR1k2ODNkeFk2b25Eam1MUEdM?=
 =?utf-8?B?TVNWWi9KdVJBeUhFK25WeWE1aDRsYThJWjlDWGc2WW5yNFN1MUdjOGVQRG13?=
 =?utf-8?B?ZythMjdsVXJJMUl2S0dOSHNqSFFac1FGblk4MzM0MDYzRDhMR25MVmtJNXI3?=
 =?utf-8?B?SnhKTlpsOUY3OXNmRXRoKzFKYmJ3YnlsSHNWeHA3RG9oZzQrNnFPRTBKNm1H?=
 =?utf-8?B?aDJsVDEzTUVMNnNTZ2lkb2RnakRIamZUSjVCek1lL3NWdEd6NHZEeVFVVldY?=
 =?utf-8?B?QkxFLytjS0kzRjFEeHl0bkpjYmRsbFBZVW9rUW9aL0ZKMVlZc0xtMGZoSkxU?=
 =?utf-8?B?dEJnQkluTkI0Q240R1UycWFyVFVqRDlMTHhVRUI0Mzd0MWgwblRzSkVxRER6?=
 =?utf-8?B?QlBzZ3hXY3BiSDEvNEZ0eXZHeHIybDdyUEVpYlAyL1VwWmRsNFhxUWVDUktl?=
 =?utf-8?B?bVk3aHhtU1NvMm5IdFIxWC9vbXVvR0w2a3VaTUxIUXBuWUxVZVVHTnVObCtO?=
 =?utf-8?B?WjYwVXcvRys2R2ZRK3BmOGt0QWR3UVhmdzlsQzRtbEM5UkpkMk5xd0lUQzIv?=
 =?utf-8?B?V2h4QVVQRTIybnFqZFF0a3pseXJ1WW1UNjVYZFdlYzI3ZUJYWVlESnAxUUpG?=
 =?utf-8?B?V2JkNmRtbTdPNEVhZVlwYXh0UktLUERqc3ZINXRvOE5DbHZhTTVEZzI0bTJa?=
 =?utf-8?B?c3gvcFg4eGpmSFNlOHRRUWZGQmd0M201V0RQN1Mza3JxVHVxWm1hclJ2bUtW?=
 =?utf-8?B?Q1Q2N2wwNjJXK0lUVTNQbHBSK1NzNWJ3enJpL1RuY3MyaDJ1N3ZMY0o2SHFO?=
 =?utf-8?B?YmdGUGIrcyszMnUzYm8rZnJXRzZXeDhHWHg0ZzBrNnZoTTlVMzYyRm82QXZI?=
 =?utf-8?B?OHZoSGxneFJHK2xnYWx2eHBNVU43RGZUVEZua3BCdm1ZTkVQbzVwVG8rdWpZ?=
 =?utf-8?B?bC9acERRc2Q0ZmQ1QUhKWGJHTStyN3pmaXRsbCtOT25UZ096WW4wTklzR3Aw?=
 =?utf-8?B?empXWGNGYXJuSGs1aEhqeWVadElPeXF6WkI3WjZYd1ZSbVh4WHkxVkttQlBB?=
 =?utf-8?B?czhlcHNXNlZ6Mk1aKzVBUzBHZmFuZHJKTyt0b3gwNFZCdm1NMFBFZFdGSU02?=
 =?utf-8?B?b0hEdGRscWNyS1Zpc0tScG5vcS9TMXc1RWhXaGR2ZTExMituUHZuR2NheVly?=
 =?utf-8?B?MjVKaXA3SUhvNStVckZGVjFPUFFWL2poNUxxZzM3eTdlT3RYbEJFVi9ISFhY?=
 =?utf-8?B?dTVQT1NZL0drRTVCRmFwc2lMOWZ1azR1UndFZ3A2QUZmRFpVeTBFYm1YUDcr?=
 =?utf-8?B?bWhpc2I5ZnJjREJlaTRlcHlxS2grUkZkcjJjWGJMY0llenJibnNiNzkrcHZV?=
 =?utf-8?B?QXhVWUFSSVZheGcxQlVMUWcwRVFvWjRWUVdBSGNFN2JrOStRc2pCNlZWUDFy?=
 =?utf-8?B?bDZCRkh5TnFWeHh3dW9salZkUndJdkxhMmdXYW11MTBiU3haN3BuMmgzSDZk?=
 =?utf-8?B?VytRd0pNamNBcm5LeTlJSXBPMW5sMVVOQjRENE1idDRiWjhwOWFPK2tFYmMw?=
 =?utf-8?B?QktNMXR2U1kvMkhIZ2xXVFBSbGtSQlk4QUpEeENNcWNTc1JBd1JDeVk3MWFR?=
 =?utf-8?B?d2NZUUxHcjJMVkIrUFUxUUlKWmgxNVNzUGpPZHRyMDRENnN5WFdkYWVPSUNn?=
 =?utf-8?B?MVF3MmkrRVhuTmFqUENUb1h3b2loZzQwc2JMMktDMTE1bGtwalZPc3YyaFRz?=
 =?utf-8?B?T1lBcHE4czFjYldoOGZqUzBMeUk2d2NpVE41WmNWZjBCQkp6KzJYYVYwY2FI?=
 =?utf-8?B?R2xJU2diT3NoUk9mS0VsenAwZEFtSTc1ZkorU1JPRDV5Zm9Fd1laNlVQOWU3?=
 =?utf-8?B?b0dtTU1wQXlXTjVzcFhGUkhSamVyYnI2eG0xNFZkbWs2UGdLcC8ralFISWtC?=
 =?utf-8?B?YUg4RWpBQnVpY3VZeTBNazhqWThHYzlNWWVyVW5GSVg0ZTB4ckk4Q09TSmNh?=
 =?utf-8?Q?FQT4eaeMrDFpeMAwStg9bAJ/Y7Gd84=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWpMekpBbWtvZHNBbzBmMk1LV3pzVzZ1T01HOUJ4ZU94ZnkrbzlyQ2hJN1ps?=
 =?utf-8?B?N20rb1NtdUEzRFFHSHFqUElVY1Uxc1lBNUY4a0pSUlcrd2dXL3d0Qlh4blRw?=
 =?utf-8?B?RTQxSDJUVWsyWjJUdnhaVU5XbytOTzJLN3NvVWhQQ2g1TzJUdTdVTlRIL1NC?=
 =?utf-8?B?bjBSbTdKNHhVZHVHRCsrdUJuTkVrcjlHUnVuaE53Qkx2WUs0VlJiMmtiS2pY?=
 =?utf-8?B?YWZORXRubldyN2s3NSt4RUF0dnNsTlBVRUFYcHpLazRmQldPd0oxU3R6Nm9k?=
 =?utf-8?B?QXZ6QkcxVEtIWnh2eXBVS1pyVTRLOGxtUFlxOWJ2Zmk0c3dxbnVqRExGdmtk?=
 =?utf-8?B?SU80L3ZTNFRxYWZCVHl0Z0ZQRDF0dSszVW9jS1hiekVWMExNbVRNdEdvb0hL?=
 =?utf-8?B?dk04WjlFV05tTWxlb0o0b0VxNUprNmdmT2pZekw0WGozNFc4MVZGWk1kU2hR?=
 =?utf-8?B?dkVJNnlHdTg2d2dHZ3g0dGp4N3RMZ05WTENkcWVDT20xUWlRUUo4ZGNUeEMr?=
 =?utf-8?B?VDdpQnY0QXJ4UTdEeEpNS1pJTE9WQzNzMjhIVjFSckMzNm9qRUNIcGI3VFJw?=
 =?utf-8?B?Rmg2MXQxZkpKaVhabCt5cWQvcDg2L0tNaVZxYW5iMUdMbHduTHUvMHZFYjdV?=
 =?utf-8?B?bzNpNjM1eUszOFhxUFBqbytnVENGUmlkUm1hdnloem9MZm5GY0R0UWROSENN?=
 =?utf-8?B?UCtBdFFXUFVzSW1uOE1GVFp3K0N0TWZ1YzZ4ZjZXUVgyRFJJT1YxY3RPM2VP?=
 =?utf-8?B?ZG8xdVpyYTEwRkIyajJCWkxpTGw3TjZoTEM5dUtNYTdxTENkWVdZZ1pCemho?=
 =?utf-8?B?TmRiT0t5cEUzK3lzQXgrcDNNbUNMWFBPZWYwWHcvdGlLcXl4SzdRSkNZTFhv?=
 =?utf-8?B?aXNjZllTRGVmRjlmTGIzOWNxeGE5bG50MnZ2QitVSnBkRElOem9jWnROdHc3?=
 =?utf-8?B?MVRPUFJ2MnBpRzBSN0IxMEpaaVFidlN0RTkvTVE5VjhJMllJcHl3ZG9zanc4?=
 =?utf-8?B?U3hDWDRhSHVqZzZIQkR4SFBlNEgycWlvNlJYWDZNM1oybW03RlRGMXdSR25P?=
 =?utf-8?B?bm1PUDlVVU5LaDF4TUMrcHZ6aEdaaEhBRmxJaWxIN2lLL2NaQUk5eVhYa2gv?=
 =?utf-8?B?ODVlM3N6ZWdFc2tKQXhWQldvU0FHeDZXQzJyZXIzR1BRZkQyOWFFbHorT3NB?=
 =?utf-8?B?SFNuNU9lNzJPZC9YMjhGZ3JaTXdIUklnRnBDMFZzQThoUkhEckZ3a2J6bnAr?=
 =?utf-8?B?MkhrbHBDRENLdHgxcCt0czE0Vm4rQm5qeERCSE9IRXAvU2ZiRllLbHJxaXVu?=
 =?utf-8?B?cEl0NUloSFFPcUoyVzcrWmFUSGMyNGZYMjdBK1c2MnNiOFBtNG1CTi9NaTRh?=
 =?utf-8?B?R293R2JtQjNHN1lzd1ZDenQ3QmtXUG1mZTdVR2UzZlJYR091bEJ6S3ZrZGcz?=
 =?utf-8?B?QllTM0VWOWJEdFBhbUJkdlE5b0xvalBDVGlydlBoMEpUT2MzNytHRTdwbVgw?=
 =?utf-8?B?WmFOSG9yWXJ4akNCWmgvSEhRN3VEUm54VGRnLzk4OEJZek1JTW54S1EvT3VJ?=
 =?utf-8?B?WTk1MllKSzFURW1lbjR4OGM5S2d2MWFsYXcyM0tqR1FRWFBRZ3d2Sk5qYXJT?=
 =?utf-8?B?OWpqMTlDQWpCd3ZyZmRza3FvMVdFNHZGelorQ2k2K1VUblF5UDRUNGVwcitE?=
 =?utf-8?B?d0I4RExlNWx6bnBkdlZ3cjFZTFlETUx4elN3Um1pNkJYZWVFSERFUnMrdWFo?=
 =?utf-8?B?RWFvbGFVUllycWVUYTlnZFV6cjdWYVdGbGJjNzdidjc5MGlsZmx0MExoc3Y2?=
 =?utf-8?B?em9WUytwN00rcTUzMVpVbTJHUGlPV3RLaGE0YmxyWFNpd3RKVllKM2JGWlNT?=
 =?utf-8?B?QytkdW9RNTZGOHR1aFpCb0dqeFArOUY3YWhDZ01xWWovTG13cXArUFUxV1la?=
 =?utf-8?B?S1Zkdms0VTIvT2pEZDBvcFRJcXdSVXFDbVdmVkQyUmxya0lGckl5S0plNnNl?=
 =?utf-8?B?ZTh5WHB1cVQ2R295YnRtellDVFVTNHp2QmExamVEVEdmSXNhVHlCWFF4WUNL?=
 =?utf-8?B?ZXJQcnU0OWhVNWlLUDdkZEdjNm9ySWw4VElDN3QzWnJDcUFLT014TnQ0OUlw?=
 =?utf-8?B?M3RFYmR1SzRtRWZmYUk4aVhyVUU0M3QwbGg4ZVk0RGVobVFRMk9mOWVmYm5n?=
 =?utf-8?B?VnV0VVRnRG82aVArN0VyZTlkTXJ4aDhpajE3NHhWRWFhY0VxaHdXa1FEQzBO?=
 =?utf-8?B?YmV0QUJPUzZqdXRUajdMVXRoYUpRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <268954C5A00D1048BD67D13A8066B303@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540ee1a6-e985-4b30-f86b-08dd982a54e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 05:42:53.6529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PJYQpHWJmnzei/egG+R7rs74B/opceU5HpOZ6PnE3Uaj+zdAkODvOTAGm7CA2O6DQB6FVJmnKNbUS0PylXo5Riipaz/XgIS2yYvdf40ku2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
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

T24gV2VkLCAyMDI1LTA1LTIxIGF0IDEwOjMxICswNTMwLCBOYXV0aXlhbCwgQW5raXQgSyB3cm90
ZToNCj4gDQo+IE9uIDUvMjAvMjAyNSAxMDoyMyBQTSwgSm91bmkgSMO2Z2FuZGVyIHdyb3RlOg0K
PiA+IFRoaXMgcGF0Y2ggaXMgYWxsb3dpbmcgUGFuZWwgUmVwbGF5IHdpdGggVlJSLiBBbGwgVlJS
IG1vZGVzIGFyZQ0KPiA+IHN1cHBvc2VkIHRvDQo+IA0KPiANCj4gSSB0aGluayB5b3UgbWlzc2Vk
IHRvIHJlbW92ZSBgcGF0Y2hgIGZyb20gdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpJIG1pc3NlZCB0
aGlzIGNvbW1lbnQuIEkgd2lsbCBjaGFuZ2UgdGhpcyBpbiBsYXRlc3QgdmVyc2lvbi4NCg0KQlIs
DQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiANCj4gUmVnYXJkcywNCj4gDQo+IEFua2l0DQo+
IA0KPiA+IHdvcmsgd2l0aCBQYW5lbCBSZXBsYXkuDQo+ID4gDQo+ID4gQnNwZWM6IDY4OTIwLCA2
ODkyNQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJA
aW50ZWwuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBBbmtpdCBOYXV0aXlhbCA8YW5raXQuay5uYXV0
aXlhbEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9wc3IuYyB8IDEyICsrKysrKy0tLS0tLQ0KPiA+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiBpbmRleCAzODUzNWUwZDI0OTYu
LmRiNzExMTM3NDI5MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Bzci5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9wc3IuYw0KPiA+IEBAIC0xNTc5LDYgKzE1NzksMTIgQEAgc3RhdGljIGJvb2wgX3Bzcl9j
b21wdXRlX2NvbmZpZyhzdHJ1Y3QNCj4gPiBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4gwqDCoAlp
ZiAoIUNBTl9QU1IoaW50ZWxfZHApKQ0KPiA+IMKgwqAJCXJldHVybiBmYWxzZTsNCj4gPiDCoCAN
Cj4gPiArCS8qDQo+ID4gKwkgKiBDdXJyZW50bHkgUFNSIGRvZXNuJ3Qgd29yayByZWxpYWJseSB3
aXRoIFZSUiBlbmFibGVkLg0KPiA+ICsJICovDQo+ID4gKwlpZiAoY3J0Y19zdGF0ZS0+dnJyLmVu
YWJsZSkNCj4gPiArCQlyZXR1cm4gZmFsc2U7DQo+ID4gKw0KPiA+IMKgwqAJZW50cnlfc2V0dXBf
ZnJhbWVzID0NCj4gPiBpbnRlbF9wc3JfZW50cnlfc2V0dXBfZnJhbWVzKGludGVsX2RwLCBhZGp1
c3RlZF9tb2RlKTsNCj4gPiDCoCANCj4gPiDCoMKgCWlmIChlbnRyeV9zZXR1cF9mcmFtZXMgPj0g
MCkgew0KPiA+IEBAIC0xNjk2LDEyICsxNzAyLDYgQEAgdm9pZCBpbnRlbF9wc3JfY29tcHV0ZV9j
b25maWcoc3RydWN0DQo+ID4gaW50ZWxfZHAgKmludGVsX2RwLA0KPiA+IMKgwqAJCXJldHVybjsN
Cj4gPiDCoMKgCX0NCj4gPiDCoCANCj4gPiAtCS8qDQo+ID4gLQkgKiBDdXJyZW50bHkgUFNSL1BS
IGRvZXNuJ3Qgd29yayByZWxpYWJseSB3aXRoIFZSUg0KPiA+IGVuYWJsZWQuDQo+ID4gLQkgKi8N
Cj4gPiAtCWlmIChjcnRjX3N0YXRlLT52cnIuZW5hYmxlKQ0KPiA+IC0JCXJldHVybjsNCj4gPiAt
DQo+ID4gwqDCoAljcnRjX3N0YXRlLT5oYXNfcGFuZWxfcmVwbGF5ID0NCj4gPiBfcGFuZWxfcmVw
bGF5X2NvbXB1dGVfY29uZmlnKGludGVsX2RwLA0KPiA+IMKgwqAJCQkJCQkJCcKgwqANCj4gPiDC
oCBjcnRjX3N0YXRlLA0KPiA+IMKgwqAJCQkJCQkJCcKgwqANCj4gPiDCoCBjb25uX3N0YXRlKTsN
Cg0K
