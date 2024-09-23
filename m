Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C5897E611
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 08:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6851810E062;
	Mon, 23 Sep 2024 06:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzCZJU1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B2C10E062;
 Mon, 23 Sep 2024 06:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727073431; x=1758609431;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=TseBbXlOaUk/vdlZN0ah2yoOurC7HuRkaoZhK+7hUt4=;
 b=BzCZJU1gY37+wBEepGTNajmFFElEQCLBVjQCqI4TEWdjtziMKgbiFC++
 63C/OJHIeDkeEu4P7EQ1YWnKrIlWpOJXUelZE+ZITZ6+4u4XZEhpvFMQK
 sj/JXWXESfexVyPlstD5PUyyGl6eLfVvgxxRW0bp7c90iaZHBlJE0j5li
 R29Iv72EkimRtVKJT75ICnnZZavojAeRS4PweSvejLstG4yunZBp8cbno
 Hqibg5yU8KOy+eadCdETb9T35lVNK5gdLSu3lRxfoXA14yEZTbZz9m8ox
 +XTMHUlHfxrXPiMUtLCEO9vtIcU8KWF2mwLCMNMB1/7EWmNnnqlL7H8lu w==;
X-CSE-ConnectionGUID: hUyEjpAcSyeGIhecGh1gXQ==
X-CSE-MsgGUID: 9tn0BrppTOeyl4XBA/Mikw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37141238"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="37141238"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 23:37:11 -0700
X-CSE-ConnectionGUID: QG5rIxF0Sd+D27SsO+39kw==
X-CSE-MsgGUID: zEEFOWIWSByFv3CVgLKLUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71411493"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2024 23:37:10 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 23:37:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 23:37:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 22 Sep 2024 23:37:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 22 Sep 2024 23:37:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zvgbfi4TX7exT0gCpF9Ejp+Pvx5MentMZplpTXwHTWAT3kL/evUWDFsqvYvkBAmYCfLZRgM6CqXPKnbYclYT2OFNmceDHFAXuYTfoulaJ7kHEcRVzsBDzy8pOBZT4iKUdHKLNGHHKv/lQIihxUuB2Cvyi5nqfdq4yI2ThUQN0j2+J/L72vBWWwA69Ix5ILyy4yCFF/4TYyCvuXAEwOoBS4CwWTQqEEnLUHDZltszI/5jMjDCK80sfGjG3EBIFKA2gxyxcK5ok9MHZ7BmK49/tvwQu2KfGNr+uZDQDRIUAxtkMJrYiWvjxKAU9ltWefiHqd9vaCDso2e42bUoa3dHfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlfS/q3LOWeVZM9mCpnJKDbKz9z5f+WnvAzCgBKEpOI=;
 b=g+Nfuoj7VK++5qnTh9pJJvyseua54sHOSyTygvVCSuyseLAZgetV/6xKek6rnhiUE2EO38PPqLnhKn6TJvmYt3Rp8OWMA2L7RV/Ts/OyU6dZueFi3M6nQNWQCuRxDvz1YM1kOC0Jv0hLCxZZCXZeC2DgK6kY3C7Le433UEdmOhxxFLQgtajhdd+aVpvD7YciDyBEs+xGCS0JswlA648J72+hK0X5+a4kJPFoJTFQsBgTgvxbcakivcxZli2Wj3gBT94ElE53dqegq7rp9eh7Ja44vPkEpF+COy+GRgvRRBsQOKOtVX8zhgWLjJu29luLKNTb6H2xAVAemnebwmLBPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB7002.namprd11.prod.outlook.com (2603:10b6:510:209::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 06:37:05 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%2]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 06:37:05 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "alexander.deucher@amd.com" <alexander.deucher@amd.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Nikula, 
 Jani" <jani.nikula@intel.com>, "Kurmi, Suresh Kumar"
 <suresh.kumar.kurmi@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>
Subject: Regression on i915
Thread-Topic: Regression on i915
Thread-Index: AdsNgelgk895N7CdQ/qTOF6FIrj10A==
Date: Mon, 23 Sep 2024 06:37:05 +0000
Message-ID: <SJ1PR11MB6129EFB8CE63D1EF6D932F94B96F2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB7002:EE_
x-ms-office365-filtering-correlation-id: 267271c8-9e5c-4ce2-1c04-08dcdb9a2410
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?9J98YeySWAELmx9f819AChCTK1Wkpkx3b5D0shRBnk20Ddxyl2y7Wm5SFd/V?=
 =?us-ascii?Q?Lqtwk2WR5SibhTSbbxyTSYPMBtr5urs7kzbj4emwk6D0v98XShU+wLh2SO70?=
 =?us-ascii?Q?BLdm2K8UDGKAm+f0C9MVHyf3HS2HhCSuko/VRooy/b60CSCbLNdVOLhbaaTt?=
 =?us-ascii?Q?wWcLBlNPbaNDhduIk6EJjQmX0P4g5+SBx3O3SxxgSxBFQzD0w+GbFC0F38Y7?=
 =?us-ascii?Q?ql1GnrC9eu8N4RpLFIxDppdVIjCcdQGgA/jBXJ/PqjPfQ2nxl+BjiW/Jyc97?=
 =?us-ascii?Q?KezYxWI8xCsfvrlhI/r1VqVEiSLiVKFUZEEAt9967Rkf9ITpFQaVOHvVWkcr?=
 =?us-ascii?Q?bkFOl+1T/XUwLGthm8a9Dj5+s08AXblSmYsmlVfwsEjlTd2bwA39cGZz9JlM?=
 =?us-ascii?Q?Ywt/5KBsuI/qxmMC46DNn1W4+r9pEV7xsp4GizDldXG6r1HRNqh1omniEJMO?=
 =?us-ascii?Q?ZqYg5s6JDoyqvb9MFy8H86SGPPL+tlZPAtaM1RDQlcZtJ81axjGtkbM0VW72?=
 =?us-ascii?Q?C7rhlsM/BYZhIhxGXW9xLcL1OJcLpMbY4z98YbgRqpC1cSR2rqBisgJRdDj1?=
 =?us-ascii?Q?nUkGl6Ju29uA7VZIoSHu6i3Bqk/bO/1nivtLb+aGjHJeebznRGqB6Fk9nTED?=
 =?us-ascii?Q?a96bEFvCAmJOoLKxleBSpRbHYogd+LKlZpd5Hr4BN8SPHQRJ+eMbNZrzSSeN?=
 =?us-ascii?Q?/9dwOMze3p4BVaPPUtYXJXvzvDDjGvRYZK79sAKVhHlJb3ITeEAJq7HAqs9y?=
 =?us-ascii?Q?IWYfWKdqpumm9K2hlHMV1L+P6TW+ToVWzT1/GccvAXhG1oYPMFRgB2uY9TeV?=
 =?us-ascii?Q?XCPNc0Wy2390l9V6e4TkIWwLi1UJnaIbmilaXPcFmemOp32n2y8w460OMRp4?=
 =?us-ascii?Q?YosLVOmsBFiQeDBPZAY+L4rNyvevVbnnHK2dreVmZgV3Cd3ZqDdBKWqPtl7n?=
 =?us-ascii?Q?D/oalFrCCJ/8NEl9Gh7nBVCL6CbRu6gifIqx5y/lEKdEBC8K6e3dNqmTfpEy?=
 =?us-ascii?Q?Doyf2aAwMkgpbkXAGHHCWob0kzuaHnJiCA6A2svzrxL0MwYRD2Cp6usCNX+3?=
 =?us-ascii?Q?WrV3+sFLhFR4EGhWZQ2UrTdGxfgHGebkyls0Fr49sb8uSB9B0IpyWio+s6NF?=
 =?us-ascii?Q?ZpHVekmzn02GzJTMFSRxVAuuvLhg4+Frhr1T+CWE+st7GocjFcTkDEOJ/AVW?=
 =?us-ascii?Q?8QNd/Bbl4VV/3cuEszcofcJe1fcphzi9qcWf9Xa/jrPySNwkgBzk7z1GQv6o?=
 =?us-ascii?Q?VkLliHxpJrM3SkZuovYk1k/wL/DZfwHdqlnxDZykXems5VzeU8RxiJpUpSqt?=
 =?us-ascii?Q?Gl2ctObd8j/ZL/S5yX3n3FYl7vuHV7D1rQe75BiGeiTvGdsFa72MpYk5xvmE?=
 =?us-ascii?Q?9hGW+qU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RPUyQXneqF0/e7SQjq6VAk6We7CnZMfSj//EZD91lu1hIenZ1j/TFveeKflw?=
 =?us-ascii?Q?U9RJYiUZveZkxVMSRtqpUmjoNG0AvQBAtDInKXpEhrPT2GaBTmr6O9KQeXRG?=
 =?us-ascii?Q?YDwgnoi+ZD//NMaP/IdiXa4BX1OjAuWwEQ8XR5F1Vbw2RWwBvxXREkpbovlB?=
 =?us-ascii?Q?67ajr+Zh8JYSExRKSCRaKpShiX07wbYEFtZhEhL+LYXWHhR/GSIJgNPtZVMB?=
 =?us-ascii?Q?eEhfa+RGVnzljWSPrjsdnDgPGMbW/Lqm6uts/FQOm8ThZizGBcgQ6T43BqgN?=
 =?us-ascii?Q?ZaWKzgacUFz0Sr2bo/Vhcba4BNipSaFqAG57VEZ3LkRWyKuOhbFgFNsWQZVf?=
 =?us-ascii?Q?J8nlp53n6QRQHGJ0VzAU4dELi1sDYAQZd3n/vy1NyY5BayRNmlJ8/NooCJpQ?=
 =?us-ascii?Q?ysB5C6EOu1nl+eQvbfZjE0TggtrnwOvHyaF92aPVgwTdXavma9rllvy882rq?=
 =?us-ascii?Q?YpE+Qh2a6ndPVcPnxV2+IfdFZQ8JOyrgrLr1qXDcOxhV4ZGwlNDEsKGRoLpE?=
 =?us-ascii?Q?ZdwEusTNECkCnOweiUWCGmaMITzpDl0+O+y9RShcBJrvuWLWut7sRmHWjwa/?=
 =?us-ascii?Q?UGJ4BVTSYmBXXANzGAIgyw3dfxZ2MGVm2Usq6vbjSUB7heVeAQdCfENJST4R?=
 =?us-ascii?Q?WFMWml4SmHPcCnKFLVd/PDmgwD0QvTWs3tHl51Lpw7fElVRJlPcUHzK9UaRM?=
 =?us-ascii?Q?+WLMTO6tXc4LXmcZazeQufAZW1x/Il/vOXfC8J36OBFuh21tKA1drwbUW7V2?=
 =?us-ascii?Q?83Kt9sb9jgZnZSNTAIpvjvHjbjDxV7zL+Y8Ug9CaeT/zBKQH2XH/6YRTMdBE?=
 =?us-ascii?Q?7KL8CbyFpvl4y1jENLg5zP3wTDLEvrf1Y3c6mBUWsx5XWSDLU8SIeEFy6ugb?=
 =?us-ascii?Q?CAICxHmrUeXpz0B9Nnmvi7THXXmXLCSbcZj6w0BZEfCo7m8+7amNJ5Q54XXE?=
 =?us-ascii?Q?lQ/siNro5crp3j9+XFP9lgNMmfjC0ZIVi8e4hcx837acsqRYCGuyXdlOQeT0?=
 =?us-ascii?Q?ZPtK4ugKzO194aK2A/6ejBK3zqr70L4ILnw43pfLp+Dh9Sh13HAEuTk8ZVt4?=
 =?us-ascii?Q?HJpqdmcimycLlc4qxTm4L0baPZQtNXe35ymktfeR4KYqkkYL3zmv2SdvK6CN?=
 =?us-ascii?Q?/3V32pu0VR+0wUHejD8z8MDzUuSDxaPf2H6D5NRyRqQJ5ID69pYeXAsXX65+?=
 =?us-ascii?Q?CeWeHniVJtt2rX06xkKH4EfVzaWXqgUTJIZ69VYJIEnRrmPeO3YxdlgDv0Jo?=
 =?us-ascii?Q?//sqwVNSpayIAWymS1r3MDFXS6iuZo4Ir5wStAolgBNIcZ/V3XCJV4uF2MXw?=
 =?us-ascii?Q?+DnWEOXNdSakMSnteS4PU2uTQHMyXVMlhepgzJGDO7lnjTEcl/Uj3SFwM7QZ?=
 =?us-ascii?Q?Os2GcY24TfGx5bY3acx2eeWN3WWJ5N48HF3TG1OQcmCG75iwJbYsWmU4t0jj?=
 =?us-ascii?Q?csktHMKCOMrOExkmHV7zpC5Pg5m1Jl47RsEOMqW7BzZHtSb75DTqcIPGPXXx?=
 =?us-ascii?Q?JkTzSkZik0FNI1nL4D64UszvPDW/1gpaNG1b03Nj+ap8Wv52XsExUNaGqmY0?=
 =?us-ascii?Q?H8vEEdsB8cMG2t23JTAPH8ps+MJQgTajFFcZv+8Z3LKvgivS/UQtlhXh2vdF?=
 =?us-ascii?Q?Fg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267271c8-9e5c-4ce2-1c04-08dcdb9a2410
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 06:37:05.5739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bcHX8BhQQHNMwhLZ6RtsuenY6WE4li8PS+BQApVpzH5PZbR3euCWNJrK736kFmLAIEa2fiFB5FJm9WYSTv7G9naa3Jd+IWoYw9eF+g3ptTw=
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

Hello Alexander,

We have two gitlab issues[1] where a phantom display is detected by the sys=
tem (with i915 driver).
The following patch[2] has been identified as the first bad commit after bi=
sect.

"b49420d6a1 video/aperture: optionally match the device in sysfb_disable()"

Could you please check why the patch causes this regression and provide a f=
ix if necessary?

Regards

Chaitanya


[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12160
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12244
[2] https://gitlab.freedesktop.org/drm/i915/kernel/-/commit/b49420d6a1aeb39=
9e5b107fc6eb8584d0860fbd7
