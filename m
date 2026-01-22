Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sC/SNPgvcmmadwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:11:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6D667B91
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E796A10E9BA;
	Thu, 22 Jan 2026 14:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RE9GbYXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB3D10E9B9;
 Thu, 22 Jan 2026 14:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769091060; x=1800627060;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=C8qigTwYmo2pPKxO3ir1sQGZ4cJLNOD/tyapoFjf0F8=;
 b=RE9GbYXOPoa/QCcOM0yLrfq/IafFhIhuaX9odDz8U/2JaiRx5H4Dc9Uy
 4FKx6YQ1KuDrloNxp3eF/a5H1iCs/OQYGGSpoECsQjMI69xAm6k74mLNQ
 oJAEcA0c+N37di01fbLUqUruMTlHz2qY9/tcuvtwMHoRipXVqKmBDTINr
 c9dUUBvkN3FmtgAH5giktPGqdLqdFRpGA2J6KdfjzR2r83FgQ4Ck7kKBo
 VlZUHZ3IvVN5PYA7taSQqySYB6xDb0cLviyCq085rvGG9WIi4Pus6vFYH
 WfNc5E9ObmUq3IrL7u+YLD0Bbi7b/gTIuvWsHuLgmc+6KnecQfmvtn4w6 g==;
X-CSE-ConnectionGUID: QKLrG+CiSF+RVCkAWYwa+w==
X-CSE-MsgGUID: NZN5ujd+T0q8gF1t/ZksZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="95806903"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="95806903"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:10:59 -0800
X-CSE-ConnectionGUID: qptxAM2tToKYIRl26cJ8Mw==
X-CSE-MsgGUID: Q39lNOZpTY2KKA13mFd7Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237411673"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:10:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 06:10:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 06:10:57 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 06:10:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PC84Kl9QMnesqznM/Grv5gW5sW8Uan4RcRymYKEvCDKO4l+lA0LLjsOrdeb0wQFnpL4YOMyEltn0V35Zm95EnEZo3Msm1EtqVavW0hK72vBzhy66ZW3qtH2VzC9cttKDIfiYxZMQ1jLAidfJXzpwT9w8qjNbT/5nCCowejtsslS790JUfEjtHEiawphdv/rnuLukptceYAgjXd1a2kMfjOHZmk2rwLOPGNEM5kHYVJI50U+tNkRTFGHTQSmdfefJ30vhR7oxr1b37yUkTgRIdIp7qjTVlOWgyecYytMX+T5NZcvx9up+hUMJ/RqwwAo7EDp1MJ8jRUQ+GrhbSwhgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8qigTwYmo2pPKxO3ir1sQGZ4cJLNOD/tyapoFjf0F8=;
 b=r669vnAAFQ2fYa+O6xiv0vE6FN+EJHzP/ELgw5TQZler1hivkp4Ggo+Lhc/UgPgKps7XmCx3jIM15O65KlErekrYu6lXLYDRBPyzEAq/p9r5STdYhH2As4dgehEsfsqEVvxzL98T6xavNc4qcFLGeR0f6xqVWStx3lAiplTl5pAu3LucijPQ0UIa/JdVmDT71WNdqjsxeD/H+CLI5L1C25UNFdcO9m6WQul9I27croHRjdNgW+W1XJzdoL46V1q2u9JFfyGYpoiA+iZr7Y3X+Ey5bfNlfjzqujvJSK1yUwNTkeFzAsWLWexeZyClc8ORptXENuLLfhra8lLaaNbDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB4826.namprd11.prod.outlook.com (2603:10b6:806:11c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 14:10:54 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 14:10:54 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "airlied@gmail.com" <airlied@gmail.com>
CC: "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "ogabbay@kernel.org" <ogabbay@kernel.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dim-tools@lists.freedesktop.org" <dim-tools@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [PULL] drm-intel-next
Thread-Topic: [PULL] drm-intel-next
Thread-Index: AQHchjcBDyxDHVP6x0GjJKJ+Os/ONrVctXIAgAD9gQCAAJJ0AA==
Date: Thu, 22 Jan 2026 14:10:54 +0000
Message-ID: <0df963c7a646730ec0ed60ab390cfe8e8a6ca5b1.camel@intel.com>
References: <aWkNThVRSkGAfUVv@intel.com> <aXDgaporPS3I6T4J@intel.com>
 <CAPM=9tx-3UWevjzbJyDTGzQ=WR3KvVDU8M2xqek39fs4zJZhnw@mail.gmail.com>
In-Reply-To: <CAPM=9tx-3UWevjzbJyDTGzQ=WR3KvVDU8M2xqek39fs4zJZhnw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|SA2PR11MB4826:EE_
x-ms-office365-filtering-correlation-id: 83e48bbd-c7e9-4f54-b9b3-08de59c00e63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?eWtEZUlqc2E2Qllqb2JiVCtCaVZwR25mWHlTTVpNUEdyQlZIVGM3NDRuM01H?=
 =?utf-8?B?WEQvYjlnTnFRSmsxaVIzSUlidG8zT3dZcFNvdThKdmFCRVJDT0RQZFZiNnRL?=
 =?utf-8?B?azFUa2ZQMmtFSXY2K0xhN3crdmFEYk51VEhXN3FhRjNWZ0UyZ2Z5eUdmdFNi?=
 =?utf-8?B?cTdYcmFQbm9xd3NXakpwWCtYR09pUmkreU9ML0F6aDRmdXE4bDBibSt4Yzl0?=
 =?utf-8?B?TGFPek9pM2xKOVJJZEFHWEFiTkcrVVpkY2dzRFptNzFCZU9UVituTmU5Um9P?=
 =?utf-8?B?TmlRcjI5V3ZsMVBhbkxrWXFhejdwOGVXNG4wM2Z4Uytib2ZoS0Q3eDlENUdp?=
 =?utf-8?B?Zi81MFJNZW1uMTdXaEQ1ajB0VXQ2Qjl0U1B4WWs0bU5GTS93ZVFpeFUxOTZC?=
 =?utf-8?B?N2I0dDFMNHNEdFJ6Tm1RWkdQeW55ZlViZTFuMGRRdVJmTU5XRWNRbnFoTlBM?=
 =?utf-8?B?S1BvUEptR3FzYysyV2hWeWU3cXkwWlU4dHczdEdia3hndjk1NEhyODJEYlVF?=
 =?utf-8?B?ZzZpdms5UHlTRVQ1MHdhS3pqM2V4cHJ3Y2kyOW01QVBYVXJ3ZGZQK1ExcWVJ?=
 =?utf-8?B?aFVSN2RrUDlySmtRSUVkRlJRMFR3YU1EY2R2UDN2bkxxcUdEMzNEMnAvdUVE?=
 =?utf-8?B?cVZJOG9MbVVQQUFXeE80ckV5T2c4bUM2NUN1dlNGQkRJNllWak1XOUQvU3JR?=
 =?utf-8?B?cU0ySDhadWppQ3ZkMTFob2xCVitZK2tEbnhsVHBsVXowNTJIbTBBUXJoZ1dH?=
 =?utf-8?B?UzNkQTYwVHVPMm9sMW41blFyZDlzc1BkTGlaSUd5dHcya2tENWIyeU85SFBs?=
 =?utf-8?B?Rzl3Z1ZYbmgyTnFCOS9vTWpIeE9FRHNjNWZIb1lqTTdEOWFhQ3NnNTdNRXgy?=
 =?utf-8?B?dnZaUDZTNmhIc3hBYjlDZlNtUFlQUjhxcEFDYURPSlhqSDVuc3ZLQlRVRnNM?=
 =?utf-8?B?VDR3bG1qYkhsVXFhV0JDRGlFNDMxR2ZzYSthQTNEL1Jna0R3dzdQSjZoYUtY?=
 =?utf-8?B?eStNT2JNWGVzY0JEZ3I2ZmJHRmpaZlRYQTZQdytDb1djMWxwQWxnQU8vL1Vq?=
 =?utf-8?B?NitFWXA3M28xU0FZZjc2UlVTSU9zWFFoWnFCWGVkeFg0cGpwZW1NZ0l4QUdm?=
 =?utf-8?B?dkZ3QVNUOE1kdWViSjJrb1FNYTJSTXBKQzZQMlRvVTVJUUJzM2FzUkFRbjFx?=
 =?utf-8?B?Y1M3UlhsZXd2TW9Ea3pDSWVNRS84b2pyVkNDNzFCL1p4Q1Bsb2t4MllGMWk1?=
 =?utf-8?B?bTBRdVpHVW5NSk5NSHRuQWRYVHpwTnI5VHd3NTZOdkVHRGNMVXI5Yy9kdkJC?=
 =?utf-8?B?QlNYQ1RmL0RLbE85ZVlYc2tHNkx1dS9GTStFc1ZSVlVqVnU2d2JnU1ViUzMr?=
 =?utf-8?B?c2d3b0pCZTFtc2luOE1vaTNXeVMvNnpXVHM2bUVBb2g1azR4bkkrcnBtMnQ3?=
 =?utf-8?B?aTc1MzJiWFdsSEFIeVdQTDljVTBDRFJJWXlrTjhjeUFxZUxOUTJjL0lqKzZm?=
 =?utf-8?B?OXVzeFFDSzhRblc3L096ZFRhZWFFUVVZQTExazJJbm0wZFE3Ym1LTEg2aDNn?=
 =?utf-8?B?MWJNVlIxVkJTSm4zOEdQYncrWXV3WUhhSVpuN3R0VThwM1RZVmp5YzVtU3Ba?=
 =?utf-8?B?SUYrM0Z3Y3l5Q0o3am5BT1hKSmZ4b3pxcjI3Uk1mOGw3dGs3a00vRnAzTUpD?=
 =?utf-8?B?N2xvSGMvWTR0eDVqU2FKbUhtN2hZekxleGg1RFUvTEl6c05BNkdzekhyc2Vr?=
 =?utf-8?B?TkhCV2tvaXk1R1k5aFBnVmhYczFWN1BOclNYeVhJWVVvYlBkQy9CZnprZGtq?=
 =?utf-8?B?ZGJzcEswenhFRjIxOXdzWWc3KzJZZ1RHU2Q3ZXlpVGkybWJIdFJkUVVFUXdn?=
 =?utf-8?B?bDJLejEzUzlyTmlkTFNOU0d1aGxnczE3ak1tcGwyYU1MQ2M1cmcwNlVXMUhK?=
 =?utf-8?B?VUtXaGltR1U3QTNxVHd0ZDZhNW54Tm4vbzNtemU3bGRCS29wcjJmc2NLU09X?=
 =?utf-8?B?NUJmbHJJaFFySmtDT3BuYVkvVW5FQ2JCUlBIN3cvOHZyRlVmeXh5UDZaMnFy?=
 =?utf-8?B?MG90a085SHNsWENmTjZJM21lbDJVRHZ5ZmZQbi9wTnk4d0dmOUUvY1BubkN4?=
 =?utf-8?Q?tFIcqqQkypJO5d58okFx7WtAv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3F2MS9icy9LbHg0LzNGOU5oVGJpN1hOY1dUQ0RoUEVqK2w0dDZlMGpJTkNx?=
 =?utf-8?B?Q1BVT1VibWMxVDdHemRIbkp0ejM4S25HZGVOK1BURVl4YWlnQ2FzV3FTdWha?=
 =?utf-8?B?aTN0bW0xVkJRUmphZ2M5Zm1KWFVleG1sZkZzWk1EOWE3Sm5CcTk0WUE4blZF?=
 =?utf-8?B?WU9kcGhZelhud1BwbTdSUld0ek9ud0dmM0RzK3JYUnM4aFFTZzBFdm0zOEhH?=
 =?utf-8?B?Skx1Y3BFUHdiU2ErekVFZ0UrUGRLZFExMUxXa2xPOXJpYUxCQVNGU1J2dVdm?=
 =?utf-8?B?MVlVcE5DNVgxV3VFTVk1bGlpdGp3Y3RjRWkvcEF2Tm5xdTA4a2NLVDN2dGpV?=
 =?utf-8?B?K01NSHBnZUxScjg0OGJxNStKeTdOalAwRUpxR3A1YVVHeHBmZDJYbEZ5UGxT?=
 =?utf-8?B?SGhWR1hRSURTMktKaGo5UUdkbTAwbUJlUVR0WDVXbXNVSDlGTTM4VG5jY01J?=
 =?utf-8?B?Z2xRUHVFOUdzQXI4cFdyNkVuMWVFU1FmdHZEQVNKTFJRTWw1WDBpbm1Sdk5a?=
 =?utf-8?B?eCtnOEVZTHlDQUZObWprMSs1R202SndmZDVackV5cHJoY0hERHNsNlFGcXdU?=
 =?utf-8?B?a25lZkRtbXlGMDRNaE05QnpIV2YyLzMrN0hBanZmVElMcTdJQ0lRdGR3NCsv?=
 =?utf-8?B?ZjN2dzIzb1Nyb2xEV2tEYzRueW8zWnVoQjd0V2FhTy9vZXo1VEFoKzIxRXJC?=
 =?utf-8?B?REE1YzN2bk9CMEhnSDR3WVZLSVNZZEc2UG1HWUNnK0NKYjRXK0dIK1NLQkd0?=
 =?utf-8?B?T0Q2NDhJSjVNNzVUVFlNbVpHdk1qUmwrdUF0THpFelpTR1R4TDBBeEZ2T2NY?=
 =?utf-8?B?WENYRk41eWlDb0x3OTdKS1NPL0RGL0tqR0Q0VmNrRzV6WnFGRUNoYWNUYzlX?=
 =?utf-8?B?TlpETGl4WTFVeGFkem9VMHhIZkFwMGN2bWkxQXNpSzFBSVR0YjRMNFNYQ3Vn?=
 =?utf-8?B?QURkNnVpcmpFVmI2azl6WkVNQ1FTQUszV3h4NTdqSGpSV1IzODVCTHdpbXBL?=
 =?utf-8?B?WmszNW1ZZFl0WDNoU21ZM2NCZno4dEtabUFPY3JKMjllUW5jc0VxeGVSTWh3?=
 =?utf-8?B?ZWhjTjExaFpZYksramgxQVFsRG5kdFJWK1ppOGE0NnpwZ2hUNXVlVzI3WmlE?=
 =?utf-8?B?ZEFJbTJJNmpWT0NneWRQalVvZTdJbGZ4dU5qZlVCdTY1dW9sM0gwMXJobXRR?=
 =?utf-8?B?VVZ4MGhKeVlaWG9aMDFjbXpjYVBFOGVMZ3NOUnRVQTdNejhHekM4dXJyMGs5?=
 =?utf-8?B?UWt1MG1VcmZ5RThmbUVXcTU4VG5ibGQ2MzM3RjhuOGJ2OEJvbTRVeU41K1Rt?=
 =?utf-8?B?VzZ6L0dEZ1diYlVuSzdmazVsSHFadWdpdS80cjZvSm1VWUxrUWJHYXduSldM?=
 =?utf-8?B?UEU5NUhEZWd1NHJBczUwVHNpQjV4WFRHSjNDMFpmOG12QkVRaFdTZTZwcmdM?=
 =?utf-8?B?azFLNzVTSllGbmpJa3RLTTR1VjVOWVhEbW5jT3FSVCt1Q3Z4SVVZd2R1N3ly?=
 =?utf-8?B?OHdHeG1ta0RMaDF1QXRPUFVxdWR1MGVmdHdwMlU0T2M1ZGlKWDA4UkhIV2FS?=
 =?utf-8?B?bzRibGIxRDdrQnJQNVhFUDJWVUxyZTU4S3F0L3VOM0pWSUVDVWhmVDJXOVMv?=
 =?utf-8?B?QkxqSG42cEhXVHlCNEhBU0xySkFJNkhBZGx6a1ZpQnJSWFFwdXFRQjQrZGd0?=
 =?utf-8?B?YlN3bm1DelhyVmxWTlN1Uy9KNlNIaFhTc1BXZ3ljOFJnbVdKSUFzYkw4cHdq?=
 =?utf-8?B?Tmp4NHM2LzZBcGJuNk9tUGk2Y3d2ZHkvam9nL0x2SVpma3VrcS80SENzQlQ3?=
 =?utf-8?B?cjVKQ1A3QUlBWktlU1BDbHRFbXo3Mm14QnNIR0FwZUFZZ0F3YndleUM3bHdr?=
 =?utf-8?B?c0h6SUNOMitMUWFaSkx0eUpHbVBnOWJTYmUxSWJHN3Q5ZjdLRUVzdmVTL0xz?=
 =?utf-8?B?NndmeklXTXoxR1NqU3FlcDNLdnlqcjZrTnVtZ2hvK3JLZllXS29wYThtRlNB?=
 =?utf-8?B?UEJTK3AxTkhKZ3orTzUwZ2FoaGo1K2owMUtpb05KajFCUEx4RmdlaWpyRUxX?=
 =?utf-8?B?MEk1MERSTTBRNHl5aHRDV0tmZGFkek5sWHBxK2RHVGM4a043c0dkNkJvM0tW?=
 =?utf-8?B?R0RJUlZjUnNhWENDakUwREZ1VVE0RXhpZnFLZnM1cXp5VmNualN6VWhST3JD?=
 =?utf-8?B?cGQ2Qnk3d3JJVm5TT3ZRQ1dOYmtxcEJmMWdqK0FOSmZnZUIwYnQvd01adHFr?=
 =?utf-8?B?NWUrbHRrbU9ZQW9FMWV4TmlEV1kyRGgyMTgrN1djN3hlTzF3bzBweU5rSGVD?=
 =?utf-8?B?bGhic1RUenVMa0lTQ3JUa1J6Vlg1dXZOZTRxSndObURyZlJmcmFMeHhEWDF4?=
 =?utf-8?Q?A2wXux44VjXjAmqA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1C7B626A6132043B3EE672CD21C6605@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e48bbd-c7e9-4f54-b9b3-08de59c00e63
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 14:10:54.2236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EDAGkXJUCXDHrzB3J4ldFe3uAEZqP3j9rKRrwkCBOUcmDIs5wmRfFq5rOGMC3FyXjZR5E6LKVwCi3KlGNeha9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4826
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
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7A6D667B91
X-Rspamd-Action: no action

T24gVGh1LCAyMDI2LTAxLTIyIGF0IDE1OjI2ICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
T24gVGh1LCAyMiBKYW4gMjAyNiBhdCAwMDoxOSwgUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlA
aW50ZWwuY29tPg0KPiB3cm90ZToNCj4gPiANCj4gPiBPbiBUaHUsIEphbiAxNSwgMjAyNiBhdCAx
MDo1Mjo0NkFNIC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+ID4gPiBIaSBEYXZlIGFuZCBT
aW1hLA0KPiA+ID4gDQo+ID4gPiBIZXJlIGdvZXMgb3VyIGxpa2VseSBsYXN0IGRybS1pbnRlbC1u
ZXh0IFBSIHRvd2FyZHMgNy4wLg0KPiA+ID4gDQo+ID4gPiBUaGFua3MsDQo+ID4gPiBSb2RyaWdv
Lg0KPiA+ID4gDQo+ID4gPiBkcm0taW50ZWwtbmV4dC0yMDI2LTAxLTE1Og0KPiA+IA0KPiA+IERh
dmUsIFNpbWEsIGFueXRoaW5nIHdyb25nIHdpdGggdGhpcyBvbmU/DQo+ID4gDQo+ID4gSSBub3Rp
Y2VkIHRoaXMgd2FzIG5vdCBwaWNrZWQgdXAgeWV0Lg0KPiANCj4gSXQgc2hvdWxkIGJlIGluIGRy
bS1uZXh0Pw0KDQpkb2ghIGl0IGlzIHRoZXJlLiBTb3JyeSBmb3IgdGhlIG5vaXNlLg0KZG91Ymxl
IGZhdWx0IG9uIG15IHNjcmlwdHMgaGVyZSB0aGlzIHJvdW5kLi4uDQoNCj4gDQo+IGNvbW1pdCA5
ZDEwY2Q1MjYxMTFhOTg5ZWIzNTNjM2E0ZGY5ZDRjNzk2OTVlYThkDQo+IE1lcmdlOiAzN2I4MTJi
N2ZkYzIgZDMwZjc1ZDJkYmE5DQo+IEF1dGhvcjogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0
LmNvbT4NCj4gRGF0ZTrCoMKgIEZyaSBKYW4gMTYgMTI6NTc6MjAgMjAyNiArMTAwMA0KPiANCj4g
wqDCoMKgIE1lcmdlIHRhZyAnZHJtLWludGVsLW5leHQtMjAyNi0wMS0xNScgb2YNCj4gaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbMKgaW50byBkcm0tbmV4dA0K
PiANCj4gwqDCoMKgIEJleW9uZCBEaXNwbGF5Og0KPiDCoMKgwqDCoCAtIE1ha2UgJ2d1Y19od19y
ZWdfc3RhdGUnIHN0YXRpYyBhcyBpdCBpc24ndCBleHBvcnRlZCAoQmVuKQ0KPiDCoMKgwqDCoCAt
IEZpeCBkb2MgYnVpbGQgb24gbWVpIHJlbGF0ZWQgaW50ZXJmYWNlIGhlYWRlciAoSmFuaSkNCj4g
DQo+IMKgwqDCoCBEaXNwbGF5IHJlbGF0ZWQ6DQo+IMKgwqDCoMKgIC0gRml4IGdndHQgZmIgYWxp
Z25tZW50IG9uIFhlIGRpc3BsYXkgKFR2cnRrbykNCj4gwqDCoMKgwqAgLSBNb3JlIGRpc3BsYXkg
Y2xlYW4tdXAgdG93YXJkcyBkZWR1cGxpY2F0aW9uIGFuZCBmdWxsDQo+IHNlcGFyYXRpb24gKEph
bmkpDQo+IMKgwqDCoMKgIC0gVXNlIHRoZSBjb25zb2xpZGF0ZWQgSERNSSB0YWJsZXMgKFN1cmFq
KQ0KPiDCoMKgwqDCoCAtIEFjY291bnQgZm9yIERTQyBzbGljZSBvdmVyaGVhZCAoQW5raXQpDQo+
IMKgwqDCoMKgIC0gUHJlcGFyZSBHVlQgZm9yIGRpc3BsYXkgbW9kdWxhcml6YXRpb24gKEFua2l0
LCBKYW5pKQ0KPiDCoMKgwqDCoCAtIEVuYWJsZS9EaXNhYmxlIERDIGJhbGFuY2UgYWxvbmcgd2l0
aCBWUlIgRFNCIChNaXR1bCwgVmlsbGUpDQo+IMKgwqDCoMKgIC0gUHJvdGVjdGlvbiBhZ2FpbnN0
IHVuc3VwcG9ydGVkIG1vZGVzIGluIExUIFBIWSAoU3VyYWopDQo+IMKgwqDCoMKgIC0gRGlzcGxh
eSBXL2EgYWRkaXRpb24gYW5kIGZpeGVzIChHdXN0YXZvKQ0KPiDCoMKgwqDCoCAtIEZpeCBtYW55
IFNQRFggaWRlbnRpZmllciBjb21tZW50cyAoQW5raXQpDQo+IMKgwqDCoMKgIC0gSW5jb3Jwb3Jh
dGUgWGUzX0xQRCBjaGFuZ2VzIGZvciBDRDJYIGRpdmlkZXIgKEd1c3Rhdm8pDQo+IMKgwqDCoMKg
IC0gQ2xlYW4gdXAgbGluayBCVy9EU0Mgc2xpY2UgY29uZmlnIGNvbXB1dGF0aW9uIChJbXJlKQ0K
PiANCj4gwqDCoMKgIFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5j
b20+DQo+IA0KPiDCoMKgwqAgRnJvbTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPg0KPiDCoMKgwqAgTGluazogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rL2FXa05UaFZSU2tH
QWZVVnZAaW50ZWwuY29tDQo+IA0KPiANCj4gRGF2ZS4NCg==
