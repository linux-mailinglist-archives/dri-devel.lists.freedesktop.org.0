Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1970C679D2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 06:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7431F10E1EB;
	Tue, 18 Nov 2025 05:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIHo3h3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000EB10E094;
 Tue, 18 Nov 2025 05:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763445001; x=1794981001;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f+I98s/lCT4ahExNwlZfC/wkCxBMERHTvYRrhPedsGI=;
 b=AIHo3h3WYSKBtClWdRo016CHoKj6tPm916ml0U59+1slVUJi0Ok8PYxF
 hTiFvb1+VknJ/+zXAF7xecmLuXVtGVuOSVm7xhcm27SIU3ukV4icS1Zk7
 mF9uBe+dMrbDrJ6DfJ1LsPYgr5kWKEVOjx79mhmhjawy2vyE82tB2D0YE
 kHVZ8XAb+d3jPW34s8h6YdCyxAGjCHlSMq/kTw1PR207bZLtbT/qPV4Ia
 U+eVOO4SoWQnP+ThCl68uAJqpUGkzTCwSHZCM4TKHLTN/AVQQvfKh7XpC
 Svc8kEb7QGFdrCYcQ3SSI7Ggz3CvP/DQPK0eeNBvbrUo6jQnUSP736RAO g==;
X-CSE-ConnectionGUID: zZBJPn4DQjKo47xANs2MNg==
X-CSE-MsgGUID: yW70/kI/SniC0Meyp3l8oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="64458293"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="64458293"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 21:50:01 -0800
X-CSE-ConnectionGUID: hgv+0grDRzaAz33mit7pQQ==
X-CSE-MsgGUID: THcsLCaORjKSo+vc9NeHDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="228000472"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 21:50:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 21:50:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 21:50:00 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 21:49:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyfpeILvAnvGCaN0ckMm+Oe7Oyk/dYLYxvL0pEoEHqYwQO2RFzzOHKPfKntV3Hjty8yP2hvI8ofwVY9Qmt+QrkjH/NERUK19voDwP4ng/khl7/tUjR1I0qZBO9w9B6fuiafDvXQEgd67Vm5lAbKMtsMoQsJkVQ4UC85lLm8Y8eN1c4d/g1u92KEoG2MKEi23exHnwBcRcVFQoUxSRNe4W3/tMY3OQS4Ysw3eZHkjTpsL66whb75JSK9zzNkBhvq/UKgUeXd1P1Fr0RbC6Pa9aut5fGWZuL0EP86AByzmxsU0nOGjkKxL4pTJrc+E9jHBNeDmKTsdrXr+jtZVlyxMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+I98s/lCT4ahExNwlZfC/wkCxBMERHTvYRrhPedsGI=;
 b=cSxLGlZc8p3tn1+dg46oLfQhmT4moKNlM8H7GnePstYeGT/pPmnt/DMMW0CnhtRZLVY19Ft8GNMR6q/ZbB84hCEjd1BAuMu6xkK6O95X/sHzf4q2/izYfq2UPqKsZ5MYWFxm1WcYtvcLngG1SVYCfjsQsa8eMn/BX8eCO8A7MrvfQQEOS6se5nBUVQ4NJrRettp91cMqUQr0ut2hVKN3t9dLx2hKDAJS9w2r5Ip4HstNotPdpdgwOHe8ULckJNoozHKh7eP+7UvIX2920hz+DvWaWbfKck4rO8l+iF9tVf6KVBS8f3hDIO0W/SbQojPLNg7EUsVrGeBnx+CyyEo7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS7PR11MB7737.namprd11.prod.outlook.com
 (2603:10b6:8:e1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 05:49:58 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 05:49:58 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v4 05/10] drm/i915/alpm: Auxless wake time calculation for
 Xe3p
Thread-Topic: [PATCH v4 05/10] drm/i915/alpm: Auxless wake time calculation
 for Xe3p
Thread-Index: AQHcVJkeCpXo+gYYKku7c6q003bGtLT2lXrQgAFZKyA=
Date: Tue, 18 Nov 2025 05:49:57 +0000
Message-ID: <DM3PPF208195D8DC325EFBB3A3BF29307B4E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251113120119.1437955-1-animesh.manna@intel.com>
 <20251113120119.1437955-6-animesh.manna@intel.com>
 <DM3PPF208195D8D3F4BCC7EB56041E588D1E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D3F4BCC7EB56041E588D1E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS7PR11MB7737:EE_
x-ms-office365-filtering-correlation-id: 1bbd4950-a77b-472a-6993-08de26664e8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QUNmazNRMXRiOXNhTXNTWTFmeDc4bHB5UEJORHhwakN0cHlMRVNMbFZ0dnhu?=
 =?utf-8?B?OVo3RkNCUHNxL1lFVlhyLzRlTkRMa2hUVkh1MDBETjZZUmgvNURqYWdSeVRr?=
 =?utf-8?B?VHU3RkpOSDU1YlVMbm9Wc3gyOHlidEF0aGVuSUp3NDFoRHRTbi9BY3AvL09w?=
 =?utf-8?B?c20zWUlWZHMrREluOGgyUG9uMUxnTDVzYlNGZk5zU2c1RTRlbC9lZ1JlRDUy?=
 =?utf-8?B?aXFwL0JIK2ZiOW4yZ2MzWklWa2ZoKzNVOGxGc1JRQXV4TnVRS2FXenRCVExw?=
 =?utf-8?B?UENnMmFEK1M0RjZzblM5bWRWNWVwVXN0Q3RyVDJjK1FablVQZHY1N3NTUTFh?=
 =?utf-8?B?enBqUjlqdzlZdE5JRHAzRFIzcW13NVpQMHdldGo5bkdMK2tRR1JzQWRQMEpP?=
 =?utf-8?B?RE11ay9PWkl0RG5rUzN4dEhsQUEzaTk3R3lBRXNBajlYSGIyOE4ycGJnSTY0?=
 =?utf-8?B?OXpHQXdCQWNwcFYzNG5ZcTd6NlJIM2dzbGxNby9uZmsxelNVRHR6MzlTLy81?=
 =?utf-8?B?SW9tTXlBMTRCcU1CNU5BLzFyZW5GOUdyblZNU2tpWkIyT0RyTklGTW9zYUV6?=
 =?utf-8?B?ZWtyYjV5OEJpWStzRlhnemhtZFZ0cnVpVlFwYktvTkZhY2VOU0w3UGJzbzBt?=
 =?utf-8?B?d2hkT0d2Q1J0eDVQU2o1cnlnQjZGTzNzUE9yNjQ1QWtyQXU0RlJrbU1OMVhE?=
 =?utf-8?B?Zm05UGhFMXJ3U0s0R1hwSkpicHloWjNsWFB5QnRnODZ0V1FFcFd2MkdEM1ht?=
 =?utf-8?B?T2N1V3dUeVA1TXhiVHErb0pkNTJNbnJ0NlI4bnFUTi9oY2hsS2p4dDE4YzF5?=
 =?utf-8?B?TE5LWmQ1LzdVckZqekFZVkJNbnMyajM5RjNSZXpkZnd2eXBYdjZvUFlwanBs?=
 =?utf-8?B?Q29pQ0VOWThCb1E4TjBxa09ycno2WC8raGFVVm9kL0tLNW1iYTJPNEVNVDMx?=
 =?utf-8?B?cVQ1NjNqVHU2ZFVaNGhOeDgzMlhwVXJQRE9kS2RYblA4dWl0bE1JdWNSSXFs?=
 =?utf-8?B?Uy81R1d2OGJ3NjA2S3BWazlYVm14Ni9YcGlFUU5ZcEpVaU1Pc2ZYdTgvTmxu?=
 =?utf-8?B?bExlQno3QzlwU3ZJSUVjTEpYL0ExcE5ndU5RSWxsTVpLZWEyYk10RG9wdENU?=
 =?utf-8?B?Y09aMnIzVFMxNmlyRzZXaVZGdXVEelNDb0ozd3J6ZmhyUGVBM3lCYmh1SjMy?=
 =?utf-8?B?QjRXandIMVFHbkFocTJjSzVkb2FiV3NRWGRxZmlGRFRqVkpYSWozMVJFTTZJ?=
 =?utf-8?B?UTM1c3Q1cFRLc0dSdVhZREVFaElOa2Q3ZTVTN0VkOWtSMjltZkhyeGJuMHpW?=
 =?utf-8?B?SFZYY1FGUXBsS1poVEJXVVBZckhxeGVmdjU4L3JVZGk3VUZ4MExhUGcvbW91?=
 =?utf-8?B?d1FTRkJnNUZhb1ZKMVREUFFPdVY4ZU80MDF4bE1HNDk0UUJxMDIxb3FmQXlx?=
 =?utf-8?B?YjNrMEZZNURqYnAxSnRBNXZrSnRBNjg0YUxMd1lQWkx4VFArbVJUWjRoU2RK?=
 =?utf-8?B?bWhVaU93Y21HeWFwYzNuS0FmcURtTWdoV2tsRVlFREQvZ2FCSk9uMCtIdDdV?=
 =?utf-8?B?N0MxcXo5R1ZEQkRKdFE4MWU4eWh6azY5Nlc3amxocUYxeGJMNGJJRmxBNzlD?=
 =?utf-8?B?dk05WFVsWlkvcGlwZTQ3VWs3VG02QUtmbElXQUYrRS9nYjEvOUQ0ZTBFTXp2?=
 =?utf-8?B?N2U4K2gvNHBiY01rYXRxcFVEaGgrNzlpaWt3eXoxVDgrQVJHb3dreDFWbElS?=
 =?utf-8?B?R1EzTTNSUGp5RlZRd2J0dm03dTZuUkZObnA4TE9xekVjOSsrVkxqeVRjTW9Q?=
 =?utf-8?B?RnV6S0o4amEyaWtTWU1vczhTRHhQSUdncTdxVkVudzMvVHJnU2Z2a1cyeVZO?=
 =?utf-8?B?RnJBNzFJYmhYQlNJVHVLN0lXNllnaDdJM1N5Zi82T2NIZUQzTkJsOTBxa0lx?=
 =?utf-8?B?WWJpbFl4YjJWSUJEQlZtL1Q4UTlyK0M5NWhLMGd3eU1GTkd5Y1BMS2Y2MXZO?=
 =?utf-8?B?b0djUUV5Mlp3SjNobzhzREdua3JYT0dNR2VtSHR6QTdETlg4YmtiYnRFWUZM?=
 =?utf-8?Q?yZw2Ni?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTBXekJxZEtVV2YyTUwySndlOS9MS2p0QkQ0di9SV1RWa01RVzV6akFvRkhv?=
 =?utf-8?B?UmxUNGtzS3IzVnYxWExBTnZDeHQzcWNWTE9iWHVGcTRQY2YyRkhMTHhBdzRm?=
 =?utf-8?B?em81VXgzWFNUQ0N2azFLaWtCS0cyNWdzUkxXcDlVMGt6bjBWQkRDcXltNHBF?=
 =?utf-8?B?NWczT05RdEtrZmpuNi9OTk95UDdVK1o1WUdPUFBlUmRuNDZBbVdPeGNwMzRq?=
 =?utf-8?B?MFVnUUErREMzK1o1WHFOQmVOeUUrWUNoaFh0TjdKeVBnYWNoSGJ1bVhXT0Np?=
 =?utf-8?B?Z1FGK1lhaGkwbVovd29jQ2tHL2M2aU1scXhocjRGcllnMEk0Wlp3OVVsZVdt?=
 =?utf-8?B?S1BDYWsyNWVPMDlNdFptMDdyTytkc2Vaa1FRK1JvWUdBNFdDUDBnWlV5OXR3?=
 =?utf-8?B?WlRKaVZKQ0pneENNOE1FVmJ1bXBKUGZmT2RqV3lBK0ptVjgxU1BhdGtjZG92?=
 =?utf-8?B?THNWbmJFeHhINEk5c2FodWk0d0Y2L2tOMUpobDRsNEFwa1NWN3RaWlhhNzFo?=
 =?utf-8?B?UXM1ZlhaK1RNSGZJNTQvYTE0bWdyY2oyUDNuMndDUTZwZkhQckRvNjNpb0lH?=
 =?utf-8?B?d3NEdlorWE5Mb2FObmZmUTZjcUhYV3QwMUl4STVic1VYdUQvRUdzenZPd0Vo?=
 =?utf-8?B?OXdJWXVrbXpmVlBDa3lpa2hWQlJtSWNhTVhDUkFDbjZnSFdQYlA0b2l0U0tC?=
 =?utf-8?B?OWpKVTg0SVpNcWUzQm9WcWtxWXhmNVYzRnNmQ3R5eXMyY0ZJVm1kWHpPMHhZ?=
 =?utf-8?B?RDBqUUpkUkhVV1AxSUZ6dURhWlRMSzRKM1NueS9rZ2lmMGJPZ0dFelhBSCti?=
 =?utf-8?B?QmF0TTN0ZmlwVkdnUUIzd1JRdHNyYXIwMTQyb1ViWW9QWmZOR1pKS3gxZjBH?=
 =?utf-8?B?ckRBanR3VUdJMkNRVWRDbHNUQWpCcUlyMFBwcTFGZGY1V0FnYzJtdUg1dGhl?=
 =?utf-8?B?TSs1eWhSd0NmZ3k0NmNQUmc1MTUxOER1NzIrRlI5bzJ0S2hjalArbTRNdUx0?=
 =?utf-8?B?Qlpnc1M3Q0VzbFoxMmV5bXNYaFJ6Q0M5cVZmZHg5eFJwR0MwWkE3Vjd2eldv?=
 =?utf-8?B?ZFZxQlFPMDdCZ3EwZmJNMUZxb1RHcjJPQkJWYnRXWVF5R0VhelN4WWxPc3o5?=
 =?utf-8?B?V3BYemxJeDg2N1lrQXA1SkwybVRBUzViUFNyZFNoT2tDSktVWTlSZkNWOHhz?=
 =?utf-8?B?RzR0ZUo1T3JCd0daaDAxUTdCOVE3a1Y2SXdYdHdEcVU2ZTBGTWw4TWNLL1ll?=
 =?utf-8?B?VFlxeWMybG9wSXYyTE1uVjBxS0R3MnduSWxhYkpXcHQvT2lRbU94anpwR1l3?=
 =?utf-8?B?cW1FR0JabmRuVld5S3FHS3BHVmJYS01tampSMmZRTlRkdG0xTktUMm5SSVN3?=
 =?utf-8?B?anlNcnBmQW9DV2YzMEFDeExXZ0dCT2Z3MGFpS0VaY3hpSGFIUVgvV01OaFJq?=
 =?utf-8?B?SW10RitKT1ZLL2FIV1ZnYktQRVlaT3EwUFE1VllSVXduUVIzVGpTK3JrWVhw?=
 =?utf-8?B?NEg1Z0hzVWE0NGEvd1BVd2k0Z25Nc2hGRE01TnFLYUNRcHVSVzhjVXp5eDBj?=
 =?utf-8?B?NGVUTzVmWlJxNTBYRVg4T3Yrd1FKSUpFN0hVSFBtN3gwbXBhVXgya1prZGky?=
 =?utf-8?B?dFhwY3RLMVJsZWR4bVdDSGEwWExsYmRvNVE2dVJjSnJ0OHRHWjBlUjU3blQ2?=
 =?utf-8?B?b0RJbWJlZmM2SW50eFBQS3QrakFxaWNOSDJOMCtIUGJPZG9LVU50TldpYTVK?=
 =?utf-8?B?RXB1Z0hQdWlyU3pKOG0yOTFYRTFkcThYV1IrVkI4WVRYTjdGMmgwd0Z1dDhB?=
 =?utf-8?B?Yng1cjRPRCt3ZTkrZ2tvOHM0Z2p4bnRlanRTOE5lK0hEZjZOenBoWjRYa05N?=
 =?utf-8?B?MWU0eXU1dzd6OUxmVFFrbnBFQUZmM2FFR3ZVUENRKzRsZFJpSXUxMkRsT0hC?=
 =?utf-8?B?RGw1eXdsMXBxLzJ3VjhDTi9tb096aCtRTkpqZU4vN2VZeE01TDEvZW8ra3Rt?=
 =?utf-8?B?cWw4WFQ4REVGZyt1cEVxTVdUbGVtK0x2WXE3UmFvL1haK0RGUlNtYlg1QzlP?=
 =?utf-8?B?cTlEVmcyaWxXSklHeTVyVmJKUXZSZHNNNmEzQUxzaTZydzhLUU9jZmw1dkZR?=
 =?utf-8?Q?9hAfHJyGOd9T7+jrVM9oOQgzf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbd4950-a77b-472a-6993-08de26664e8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 05:49:57.8985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O5UUTW9pRuutlpwsj5E65pgTeJzNr9khmYkRYE9KuuiXMtHVEZBsQMyzahGCp1grpR2u9A9+cejQ0YMkbmJwyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gS2FuZHBh
bCwgU3VyYWoNCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAxNywgMjAyNSAyOjUwIFBNDQo+IFRv
OiBNYW5uYSwgQW5pbWVzaCA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+OyBpbnRlbC0NCj4gZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBk
cmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTmlrdWxhLCBKYW5pIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+OyBIb2dhbmRlciwgSm91bmkNCj4gPGpvdW5pLmhvZ2FuZGVy
QGludGVsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2NCAwNS8xMF0gZHJtL2k5MTUvYWxw
bTogQXV4bGVzcyB3YWtlIHRpbWUgY2FsY3VsYXRpb24NCj4gZm9yIFhlM3ANCj4gDQo+ID4gU3Vi
amVjdDogW1BBVENIIHY0IDA1LzEwXSBkcm0vaTkxNS9hbHBtOiBBdXhsZXNzIHdha2UgdGltZSBj
YWxjdWxhdGlvbg0KPiA+IGZvciBYZTNwDQo+ID4NCj4gPiBBZGQgc3VwcG9ydCBmb3IgYXV4bGVz
cyB3YWtldGltZSBjYWxjdWxhdGlvbiBmb3IgRFAyLjEgQUxQTSBhcw0KPiA+IGRlcGVuZGVudCBw
YXJhbWV0ZXIgZ290IGNoYW5nZWQuDQo+ID4NCj4gPiB2MTogSW5pdGlhbCB2ZXJzaW9uLg0KPiA+
IHYyOiBVc2UgaW50ZWxfZHBfaXNfdWhicigpLiBbSmFuaV0NCj4gPg0KPiANCj4gQWRkIEJzcGVj
IG5vLiBoZXJlDQo+IA0KPiA+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGlu
dGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5h
QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9hbHBtLmMgfCA2Mw0KPiA+ICsrKysrKysrKysrKysrKysrKystLS0tDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiBpbmRleCBi
NGI4NzRkZDM3MjUuLjgxNDcyMjU0YWI3MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gQEAgLTEwMCwyMyArMTAwLDY0IEBAIHN0YXRp
YyBpbnQgZ2V0X2xmcHNfaGFsZl9jeWNsZV9jbG9ja3MoY29uc3QNCj4gPiBzdHJ1Y3QgaW50ZWxf
Y3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkNCj4gPg0KPiA+ICBzdGF0aWMgaW50IGdldF90cGh5Ml9w
Ml90b19wMChjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkgIHsNCj4g
PiAtCXJldHVybiAxMiAqIDEwMDA7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxh
eSA9IHRvX2ludGVsX2Rpc3BsYXkoY3J0Y19zdGF0ZSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIERJ
U1BMQVlfVkVSKGRpc3BsYXkpID49IDM1ID8gKDQwICogMTAwMCkgOiAoMTIgKiAxMDAwKTsNCj4g
PiAgfQ0KPiA+DQo+ID4gLXN0YXRpYyBpbnQgZ2V0X2VzdGFibGlzaG1lbnRfcGVyaW9kKGNvbnN0
IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ID4gKmNydGNfc3RhdGUpDQo+ID4gK3N0YXRpYyBp
bnQgZ2V0X2VzdGFibGlzaG1lbnRfcGVyaW9kKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+
ID4gKwkJCQkgICAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+
ID4gIHsNCj4gPiAgCWludCB0MSA9IDUwICogMTAwMDsNCj4gPiAtCWludCB0cHM0ID0gMjUyOw0K
PiA+ICsJaW50IHRwczQgPSBpbnRlbF9kcF9pc191aGJyKGNydGNfc3RhdGUpID8gKDM5NiAqIDMy
KSA6ICgyNTIgKiAxMCk7DQoNCkFsc28gSSBzZWUgMzk2IGlzIHVzZWQgYXQgbW9yZSBwbGFjZXMg
dGhhbiAxIHNvIG1heWJlIHdlIGNhbiBoYXZlIGEgZGVmaW5lIGZvciBpdA0KTUxfUEhZX0xPQ0tf
TEVOIA0KDQo+ID4gIAkvKiBwb3J0X2Nsb2NrIGlzIGxpbmsgcmF0ZSBpbiAxMGtiaXQvcyB1bml0
cyAqLw0KPiA+IC0JaW50IHRtbF9waHlfbG9jayA9IDEwMDAgKiAxMDAwICogdHBzNCAvIGNydGNf
c3RhdGUtPnBvcnRfY2xvY2s7DQo+ID4gKwlpbnQgdG1sX3BoeV9sb2NrID0gMTAwMCAqIDEwMDAg
KiB0cHM0IC8gY3J0Y19zdGF0ZS0+cG9ydF9jbG9jayAvIDEwOw0KPiA+ICsJaW50IGx0dHByX2Nv
dW50ID0gMDsNCj4gPiAgCWludCB0Y2RzLCBlc3RhYmxpc2htZW50X3BlcmlvZDsNCj4gPg0KPiA+
IC0JdGNkcyA9ICg3ICsgRElWX1JPVU5EX1VQKDY1MDAsIHRtbF9waHlfbG9jaykgKyAxKSAqIHRt
bF9waHlfbG9jazsNCj4gPiAtCWVzdGFibGlzaG1lbnRfcGVyaW9kID0gKFNJTEVOQ0VfUEVSSU9E
X1RJTUUgKyB0MSArIHRjZHMpOw0KPiA+ICsJaWYgKGludGVsX2NydGNfaGFzX3R5cGUoY3J0Y19z
dGF0ZSwgSU5URUxfT1VUUFVUX0VEUCkpIHsNCj4gPiArCQl0Y2RzID0gKDcgKyBESVZfUk9VTkRf
VVAoNjUwMCwgdG1sX3BoeV9sb2NrKSArIDEpICoNCj4gPiB0bWxfcGh5X2xvY2s7DQo+ID4gKwl9
IGVsc2Ugew0KPiA+ICsJCXRjZHMgPSA3ICogdG1sX3BoeV9sb2NrOw0KPiA+ICsJCWx0dHByX2Nv
dW50ID0gZHJtX2RwX2x0dHByX2NvdW50KGludGVsX2RwLQ0KPiA+ID5sdHRwcl9jb21tb25fY2Fw
cyk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWYgKGx0dHByX2NvdW50KSB7DQo+ID4gKwkJaW50
IHRsdyA9IDEzMDAwOw0KPiA+ICsJCWludCB0Y3MgPSAxMDAwMDsNCj4gPiArCQlpbnQgdGxmcHNf
cGVyaW9kID0gZ2V0X2xmcHNfY3ljbGVfdGltZShjcnRjX3N0YXRlKTsNCj4gPiArCQlpbnQgdGRj
cyA9IChTSUxFTkNFX1BFUklPRF9USU1FICsgdDEgKyB0Y3MgKw0KPiA+ICsJCQkgICAgKGx0dHBy
X2NvdW50IC0gMSkgKiAodGx3ICsgdGxmcHNfcGVyaW9kKSk7DQo+ID4gKwkJaW50IHRhY2RzID0g
NzAwMDA7DQo+ID4gKwkJaW50IHRkcyA9IChsdHRwcl9jb3VudCAtIDEpICogNyAqIHRtbF9waHlf
bG9jazsNCj4gPiArDQo+ID4gKwkJLyogdGRybCBpcyBzYW1lIGFzIHRjZHMqLw0KPiA+ICsJCWVz
dGFibGlzaG1lbnRfcGVyaW9kID0gdGx3ICsgdGxmcHNfcGVyaW9kICsgdGRjcyArIHRhY2RzICsN
Cj4gPiB0ZHMgKyB0Y2RzOw0KPiA+ICsJfSBlbHNlIHsNCj4gPiArCQkvKiBUT0RPOiBBZGQgYSBj
aGVjayBmb3IgZGF0YSByZWFsaWduIGJ5IERQQ0QgMHgxMTZbM10gKi8NCj4gPiArDQo+ID4gKwkJ
ZXN0YWJsaXNobWVudF9wZXJpb2QgPSAoU0lMRU5DRV9QRVJJT0RfVElNRSArIHQxICsgdGNkcyk7
DQo+ID4gKwl9DQo+ID4NCj4gPiAgCXJldHVybiBlc3RhYmxpc2htZW50X3BlcmlvZDsNCj4gPiAg
fQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgZ2V0X3N3aXRjaF90b19hY3RpdmUoY29uc3Qgc3RydWN0
IGludGVsX2NydGNfc3RhdGUNCj4gPiArKmNydGNfc3RhdGUpIHsNCj4gPiArCWludCBwb3J0X2Ns
b2NrID0gY3J0Y19zdGF0ZS0+cG9ydF9jbG9jazsNCj4gPiArCWludCBzd2l0Y2hfdG9fYWN0aXZl
Ow0KPiANCj4gTWFrZSB0aGlzIHN3aXRjaF90b19hY3RpdmUgPSAwIHRoYXQgd2F5IHRoZSBlbHNl
IGJsb2NrIGxhdGVyIGlzIG5vdCByZXF1aXJlZA0KPiANCj4gPiArDQo+ID4gKwlpZiAoaW50ZWxf
ZHBfaXNfdWhicihjcnRjX3N0YXRlKSkgew0KPiA+ICsJCWludCBzeW1ib2xfY2xvY2sgPSBwb3J0
X2Nsb2NrIC8NCj4gPiAraW50ZWxfZHBfbGlua19zeW1ib2xfc2l6ZShwb3J0X2Nsb2NrKTsNCj4g
PiArDQo+ID4gKwkJc3dpdGNoX3RvX2FjdGl2ZSA9IDMyICogRElWX1JPVU5EX1VQKCgzOTYgKyAz
ICsgNjQpLA0KPiANCj4gSSB3b3VsZCBsaWtlIGlmIHlvdSBoYWQgMzk2IGFzc2lnbmVkIGFzIGEg
dmFyaWFibGUgbWxfcGh5X2xvY2tfbGVuDQo+IA0KPiA+IHN5bWJvbF9jbG9jayk7DQo+ID4gKwl9
IGVsc2Ugew0KPiA+ICsJCXN3aXRjaF90b19hY3RpdmUgPSAwOw0KPiA+ICsJfQ0KPiANCj4gU2hv
dWxkIHlvdSBub3QgdGFrZSBjYXJlIG9mICB0aGUgbXN0IHVzZSBjYXNlLg0KPiANCj4gU28gdGhl
IHN3aXRjaCB0byBhY3RpdmUgbGF0ZW5jeSBzZWVtcyB3cm9uZyBoZXJlIHdoYXQgeW91IGFyZSBj
YWxjdWxhdGluZw0KPiBoZXJlIGlzIFRfc3dpdGNoX3RvX2FjdGl2ZSA9IDMyICogRElWX1JPVU5E
X1VQKCgzOTYgKyAzICsgNjQpLGZsaW5rKQ0KPiBTd2l0Y2hfdG9fYWN0aXZlX2xhdGVuY3k9IENF
SUwodF9zd2l0Y2hfdG9fYWN0aXZlL3RfbGluZSkgQW5kIHRoaXMgbmVlZCB0bw0KPiBiZSB3cml0
dGVuIHRvIEFMUE1fQ1RMMiB3aGljaCB5b3UgYXJlIG5vdCBkb2luZyBzZWUgYmVsb3cgY29tbWVu
dC4NCj4gQWxzbyB5b3UgYXJlIG5vdCB0YWtpbmcgaW50byBhY2NvdW50IHRoZSBmYWN0IHRoYXQg
Zl9saW5rIGlzIGluIE1IWiBhbmQNCj4gaW50ZWxfZHBfbGlua19zeW1ib2xfY2xvY2sgZ2l2ZSB2
YWx1ZSBpbiBrSFogc28gcHJvYmFibHkgbG9vayBpbnRvIHRoYXQgdG9vLg0KPiBTdGlsbCBub3Qg
c3VyZSBob3cgZl9saW5rIGlzIHRoZSBpbnRlbF9kcF9saW5rX3N5bWJvbF9jbG9jayBjYW4geW91
IGV4cGxhaW4gdGhhdA0KPiB0b28/DQo+IA0KPiA+ICsNCj4gPiArCXJldHVybiBzd2l0Y2hfdG9f
YWN0aXZlOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAvKg0KPiA+ICAgKiBBVVgtTGVzcyBXYWtlIFRp
bWUgPSBDRUlMSU5HKCAoKFBIWSBQMiB0byBQMCkgKyB0TEZQU19QZXJpb2QsIE1heCsNCj4gPiAg
ICogdFNpbGVuY2UsIE1heCsgdFBIWSBFc3RhYmxpc2htZW50ICsgdENEUykgLyB0bGluZSkgQEAg
LTEzNiwxMw0KPiA+ICsxNzcsMTUgQEAgc3RhdGljIGludCBnZXRfZXN0YWJsaXNobWVudF9wZXJp
b2QoY29uc3Qgc3RydWN0DQo+ID4gaW50ZWxfY3J0Y19zdGF0ZQ0KPiA+ICpjcnRjX3N0YXRlKQ0K
PiA+ICAgKiB0TUxfUEhZX0xPQ0sgPSBUUFM0IExlbmd0aCAqICggMTAgLyAoTGluayBSYXRlIGlu
IE1IeikgKQ0KPiA+ICAgKiBUUFM0IExlbmd0aCA9IDI1MiBTeW1ib2xzDQo+ID4gICAqLw0KPiAN
Cj4gTG90IG9mIGNoYW5nZXMgaW4gdGhpcyBmdW5jdGlvbiBhbmQgaG93IHdlIGNhbGN1bGF0ZSBk
YXRhIHNvIHRoZSBjb21tZW50IGFsc28NCj4gbmVlZHMgdG8gY2hhbmdlIGhlcmUgVG8gcmVmbGVj
dCB0aG9zZSBjaGFuZ2VzLg0KPiANCj4gDQo+ID4gLXN0YXRpYyBpbnQgX2xubF8NCj4gY29tcHV0
ZV9hdXhfbGVzc193YWtlX3RpbWUoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gPiAq
Y3J0Y19zdGF0ZSkNCj4gPiArc3RhdGljIGludCBfbG5sX2NvbXB1dGVfYXV4X2xlc3Nfd2FrZV90
aW1lKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4gKwkJCQkJICAgY29uc3Qgc3RydWN0
IGludGVsX2NydGNfc3RhdGUNCj4gPiAqY3J0Y19zdGF0ZSkNCg0KWW91IGFsc28gc2VlbSB0byBo
YXZlIG1pc3NlZCB0aGUgYWRkaXRpb24gb2YgcmVnaXN0ZXIgYml0cyBhdXhsZXNzIHdha2UgdGlt
ZSBleHRlbnNpb24gaW4gQUxQTV9DTFQyIGFuZA0KVXBkYXRpb24gb2YgQXV4bGVzcyB3YWtlIHRp
bWUgaW4gQVBMTV9DVEwgYW5kIHRoZSBjb3JyZXNwb25kaW5nIGNoZWNrcyB0aGF0IHlvdSBuZWVk
IHRvIGRvIHRvIGRldGVybWluZSB3aGF0IG5lZWRzDQpUbyBiZSB3cml0dGVuLg0KVGhlcmUgYXJl
IGFsc28gc29tZSBvdGhlciByZWdpc3RlciBiaXQgaW4gQUxQTV9DVEwgdGhhdCBuZWVkIHVwZGF0
aW9uIG9yIHJlZGVmaW5pdGlvbiBvZiBob3cgdGhlIHZhbHVlIGluIHRoZW0gaXMgd3JpdHRlbi4N
CkhhdmUgYSBsb29rDQpBVVhfTEVTU19TTEVFUF9IT0xEX1RJTUUNCkFMUE1fRU5UUllfQ0hFQ0sN
CkFVWF9MRVNTX1dBS0VfVElNRQ0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+ID4gIHsN
Cj4gPiAgCWludCB0cGh5Ml9wMl90b19wMCA9IGdldF90cGh5Ml9wMl90b19wMChjcnRjX3N0YXRl
KTsNCj4gPiAtCWludCBlc3RhYmxpc2htZW50X3BlcmlvZCA9IGdldF9lc3RhYmxpc2htZW50X3Bl
cmlvZChjcnRjX3N0YXRlKTsNCj4gPiArCWludCBlc3RhYmxpc2htZW50X3BlcmlvZCA9IGdldF9l
c3RhYmxpc2htZW50X3BlcmlvZChpbnRlbF9kcCwNCj4gPiBjcnRjX3N0YXRlKTsNCj4gPiArCWlu
dCBzd2l0Y2hfdG9fYWN0aXZlID0gZ2V0X3N3aXRjaF90b19hY3RpdmUoY3J0Y19zdGF0ZSk7DQo+
ID4NCj4gPiAgCXJldHVybiBESVZfUk9VTkRfVVAodHBoeTJfcDJfdG9fcDAgKw0KPiA+IGdldF9s
ZnBzX2N5Y2xlX3RpbWUoY3J0Y19zdGF0ZSkgKw0KPiA+IC0JCQkgICAgZXN0YWJsaXNobWVudF9w
ZXJpb2QsIDEwMDApOw0KPiA+ICsJCQkgICAgZXN0YWJsaXNobWVudF9wZXJpb2QgKyBzd2l0Y2hf
dG9fYWN0aXZlLCAxMDAwKTsNCj4gDQo+IEkgZG8gbm90IHRoaW5rIHlvdSBoYXZlIHRvICBhZGQg
dGhlIHN3aXRjaCB0byBhY3RpdmUgbGF0ZW5jeSBoZXJlLCBTd2l0Y2ggdG8NCj4gYWN0aXZlIGxh
dGVuY3kgYSBzZXBhcmF0ZSBmaWVsZCBpbiBBTFBNX0NUTDIgc28geW91IHdpbGwgaGF2ZSB0byB3
cml0ZSBpdA0KPiBXaGljaCBtZWFucyB5b3UgbmVlZCB0byBjcmVhdGUgYW5vdGhlciB2YXJpYWJs
ZSB0aGF0IHlvdSBmaWxsIHdpdGggc3dpdGNoIHRvDQo+IGFjdGl2ZSBsYXRlbmN5Lg0KPiBIL3cg
d2lsbCBpbnRlcm5hbGx5IG1haW50YWluIEF1eCBXYWtlIHRpbWUgKyBTd2l0Y2ggdG8gYWN0aXZl
IGxhdGVuY3kuDQo+IEkgZG9uJ3Qgc2VlIHlvdSB3cml0aW5nIHRvIEFMUE1fQ1RMMltTd2l0Y2gg
dG8gQWN0aXZlIHRpbWVdIGhlcmUgb3INCj4gYW55d2hlcmUgZWxzZSBkaWQgeW91IG1pc3MgaXQ/
DQo+IA0KPiBSZWdhcmRzLA0KPiBTdXJhaiBLYW5kcGFsDQo+IA0KPiA+ICB9DQo+ID4NCj4gPiAg
c3RhdGljIGludA0KPiA+IEBAIC0xNTQsNyArMTk3LDcgQEAgX2xubF9jb21wdXRlX2F1eF9sZXNz
X2FscG1fcGFyYW1zKHN0cnVjdA0KPiA+IGludGVsX2RwICppbnRlbF9kcCwNCj4gPiAgCQlsZnBz
X2hhbGZfY3ljbGU7DQo+ID4NCj4gPiAgCWF1eF9sZXNzX3dha2VfdGltZSA9DQo+ID4gLQkJX2xu
bF9jb21wdXRlX2F1eF9sZXNzX3dha2VfdGltZShjcnRjX3N0YXRlKTsNCj4gPiArCQlfbG5sX2Nv
bXB1dGVfYXV4X2xlc3Nfd2FrZV90aW1lKGludGVsX2RwLCBjcnRjX3N0YXRlKTsNCj4gPiAgCWF1
eF9sZXNzX3dha2VfbGluZXMgPSBpbnRlbF91c2Vjc190b19zY2FubGluZXMoJmNydGNfc3RhdGUt
DQo+ID4gPmh3LmFkanVzdGVkX21vZGUsDQo+ID4gIAkJCQkJCSAgICAgICBhdXhfbGVzc193YWtl
X3RpbWUpOw0KPiA+ICAJc2lsZW5jZV9wZXJpb2QgPSBnZXRfc2lsZW5jZV9wZXJpb2Rfc3ltYm9s
cyhjcnRjX3N0YXRlKTsNCj4gPiAtLQ0KPiA+IDIuMjkuMA0KDQo=
