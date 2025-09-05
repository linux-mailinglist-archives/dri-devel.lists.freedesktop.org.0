Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F304FB44CC7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 06:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB57B10EB17;
	Fri,  5 Sep 2025 04:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYE+p7t0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DD910E2BB;
 Fri,  5 Sep 2025 04:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757047347; x=1788583347;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K2ZTCpfuIOuO7Pm/wWtRvQ0nUPwkMXY1cUYFEa38gpw=;
 b=UYE+p7t0eKYs2OlKXvGAKDcof7yfa5vtKt1HFJxt1VBCLuMZ7QJmvWIm
 Sv1n26p22PwMH4IBjioVaKEjuPFF7kWkD9AHXzrxd0Qk3rAp0b1RGCpyQ
 v1Klxyuv5apmGkBcPUOvJOxzwO9OayfP91/SMVK4lDFV0XRzLcU65COeQ
 manZibGF4B9pHhWvGPa974N+eexw80MAbrNnUD65ZKwHaNMNSbn9IDaLV
 D7MjhJ9b/0SOSxsUl9cqPRFGh9kg2ev3OzLCiGv/+MB4RKpaQnegPiFYC
 f/tXDY+6aR4FIDvy0yhc/q9ovwKbD3L4t0S3ppPFWVwsPfB2M15K7sUIP g==;
X-CSE-ConnectionGUID: pa4o5uOnSXOuVy+XZS83pA==
X-CSE-MsgGUID: qoI448DxSa20pZX5RJvIUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63228571"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63228571"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 21:42:26 -0700
X-CSE-ConnectionGUID: bkJWlIxDQmOvndgHuGLFMA==
X-CSE-MsgGUID: rRsBXYMqS6OBE9X4dw+VFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="172512430"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 21:42:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 21:42:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 21:42:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.89) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 21:42:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqMapm+bFPFLr89sGhkCJq8WBL3ufRKnDbgSKwBuV7MmOI8m/+cgPHXz2qAi7M/GGPYK4Eth/ME8Wb9Y6m59jvMsOBWKRzUPnm/si+BVMCwRNBhxWqY7n16tF7lFdnYAnS0qH430v55A70rPxMsgKvc1ZW8CayHc36iCxRpKBxRInddRUP2xumAv8PmGvs5Ub5TK6fcvr1Kcl4dsCwAz6IDuq7i9egxUIW/MCuoPcStUjDQ5JHx8EXjbD+kxuBrjTBYQLLIiItrOFnKRG5N86aCtrxBSIQFQqKDZZY9CGtsxYxsZVDA4SKZqR/9RzacQXz+7IpaKIB1vXy9JEzcSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2ZTCpfuIOuO7Pm/wWtRvQ0nUPwkMXY1cUYFEa38gpw=;
 b=ZY/YpZ2ISAK5dQJWKaL2HMhF3cp5ci1h5s3El+RwbY4tqA85kyec5j1fGh6o3Is5jJMvLcIK7hCuMqCB8CWWnrBo1OBOgJnkXPSf5fCUremRtGHDzMpDroPlB2EtUGXBd/8hB8JkCOUdZ767LkDWBXT/NVkMY+UL/l9o1DW/8RFKwq1vl2wzSz0+0pzSLvmys+Qj8TvLzQh6WILxadrT6URIpEB+rGavEe9Ouj20Jhq9KlNx7S6FTxCUZswRG1dzKiwDAN/PPLMePy8ysN6RcL9I0s0GCDn0APOGO7ElFba6nL/V9/9wSG5HMAryznAgkVDHy62TLzvuSC5qAyZm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 04:42:23 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 04:42:23 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Logan Gunthorpe <logang@deltatee.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v3 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Topic: [PATCH v3 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Index: AQHcHSMrynG8dx38uE6Ns9wqatNXh7SDIy4AgACGM7A=
Date: Fri, 5 Sep 2025 04:42:22 +0000
Message-ID: <IA0PR11MB71857B76BF6EF35F043AF2BFF803A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
 <20250903223403.1261824-2-vivek.kasireddy@intel.com>
 <f0479622-6f3e-4e86-95e6-61244053a8b3@deltatee.com>
In-Reply-To: <f0479622-6f3e-4e86-95e6-61244053a8b3@deltatee.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA0PR11MB4591:EE_
x-ms-office365-filtering-correlation-id: 87b2ebf7-6efe-4956-51d7-08ddec369b0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S3lZcHkyMmg5eXF0QThINU4rcDdzZWVZMDVLVFpvYmswMThZWDU2aDk4cjho?=
 =?utf-8?B?VkVNN1BTY3o3MFlZcFg2VkFhYVlGMEN3NWEvWW9sRjNaVEFOUFhVVk5aWWtB?=
 =?utf-8?B?VHNUSGd0M2toQWplZWJNeG56WC9SUmJZZDdjQnA3NjdZRnVEcjB3SHE2anhL?=
 =?utf-8?B?U1ExVkFiQjZidXNOcjVCczlycnAra3NUbnRZc3dDUWNkOEN2b2IzVlNEUHRx?=
 =?utf-8?B?bjRVa0hGbkE5SzFuUW1mRm5kenUzQk4xZ3NVdmZHNkM5ay9lQ0RGL1V0ZDMx?=
 =?utf-8?B?RTIrbDdNVnZaSnA2MGxsdDY3Z3EzY0xGZkpFSlBGOVI0Q1owbTQvY2ZTSHE2?=
 =?utf-8?B?QURrQ3JGV3dIOWEvYzdBVU8vOEJwRlJjWHc0Um5XYjkwTWQ5RXNzMEN3azZr?=
 =?utf-8?B?ZFEvSDB0YzFVQnJrVFo3MDBwVjZsWllxNVA0em5tUkd1ZFljR0hGSVYySU1h?=
 =?utf-8?B?VkhUYmFDcU5pam9NcFNFTUFVTHdSNDhVQlBQWlhtK0VLdTcreGxCb2lxbnBz?=
 =?utf-8?B?TWpXUGR2ZGJZOG5jN0l5ZTNKNDhPRUZQaDdqNlJWeXVDRWRsNlFwUmk3eUxI?=
 =?utf-8?B?M0xzYTBpZm1CUCtXMkQ4TS80aWlNOGhXelhoNzlCKzViODdOUWRNeHk2LzlG?=
 =?utf-8?B?SjV6MmwxRmFnVU9STDlvNzlDdVFVOHdKUjlaZ0lWMlVZcFVGQTBmM1FpUmhB?=
 =?utf-8?B?L3JEaUJFb1dEN2RxbEt3MEphUXNFZUI5SGdvUTZjelV3K0dUUkxJWFF0dzln?=
 =?utf-8?B?aENheEhpencydVJVaXZTMUNMTHNGNEVpRGVVRm4xQkhsVHBBbm93RG9LbzRE?=
 =?utf-8?B?aFBWeEN1SVlVdW1Xa2ZlOS9xZ05RcEx4OHlSN2J0RkVBb1FaYjlQMnlWS3BB?=
 =?utf-8?B?UThQM0ZnTHNjTmQ2bXBkU3RURFJnaUJFS0hEbTgwUERPZFFCbWhCWm43UWZm?=
 =?utf-8?B?ZTNYTStQRXNZZW9jWGRwVEZTWldESmJ2MzVUWThubFNRd0RtOUJNTUc4S1NT?=
 =?utf-8?B?UnQvWVhiU1dKNE1kZHZrNytJaG8yblk5YWZsZEY2Y0J6Y2dadnZnUFdSVGhF?=
 =?utf-8?B?S0VVQ0t2Rld3dlFzSXRIYy9lRXE2VFZCdnVOODlzcHgwdytqVlc0anhZczlL?=
 =?utf-8?B?di9tSmRsMjBPdjFpaXEzdDBkbXpXTjN2clFPNkxDcGZINEFndHppblZNaVlB?=
 =?utf-8?B?UFBqNk9xL1lnTTZ1ZVFKTkhzRk84N09lcWRGREhXTzAyYnoyN09IT0RmSWtn?=
 =?utf-8?B?OG90OXFlZmhOSU1vckozSVJCZnFHbG81eWo1RzNSZzZrcllERzFON2JqSnBP?=
 =?utf-8?B?Z25wKzN3eVdtdlFaSDJ0STQxcFYyRzZpL3E3R1JzV1NIcnJGVkVxZ2xVU01z?=
 =?utf-8?B?WGMrNjk2cldSemJmOFc2dFpXMmxOREJvL05YSHU1MngzekFuZW9ER3lsQmE4?=
 =?utf-8?B?VXllM0RSWEFsY0xZZ2N5MDJwaitSMmhCUzY5OHJtcmJwcFFIZjdaa01mRGpW?=
 =?utf-8?B?YVduVnd5aTNSbnllbG5hK3F3M0g3UU5FNjdqQUtyNkhUWklad1RGdWdkUXpD?=
 =?utf-8?B?Y2U0aXpPVlhHL0hvTjYwM04wTXRiZWkzeGdEV2F4Q1VIelplNWw0NGJhZ2cr?=
 =?utf-8?B?V29ZNnZvSG9JQjE4cDE0US9OVnFlb04zRXBvVnJYSlB4T2JYZVJ1anIyNmEx?=
 =?utf-8?B?dzZZZjRUVGQvVER5enIxNkV2UVlyOFVPajlPT0RZZ3hoTGlxb2RRR1VpMWpK?=
 =?utf-8?B?NGJLQUl4amdjR0laaTE1am9ldlpaLzErZUprakg0UWRRNElLZE92M0lMUXg3?=
 =?utf-8?B?ZVU5MGNQdUFRV3pBRGFuOGp4Zm9CQnVMeTBqM3FZKzh0ZFRvU3M0eUFONHlT?=
 =?utf-8?B?Mld3NDlRMFRXNE13bE1SUTBZaUlIa0tsM3lTU2FLc0haUmM1ZEdjcEVtOE9n?=
 =?utf-8?B?RWNHYzNIQVhubW9XS01NUHJNNDhnOEJrSWpYWFp3OEY4ellvaEU4Z044OGU0?=
 =?utf-8?B?MnRXL3o5ZWpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1hmNTBDM3RBUkp6YUI4ZmhsQ01FbERaVUFTQVRNL1Q3STJqMm9xUzZJdTFM?=
 =?utf-8?B?ZVo1MWFjckhtWjVkRGtkcFc0YXRqRmg4bGpobkRvbnBOdktjOEltM2lNaUkv?=
 =?utf-8?B?ZFNoTXhpRy94RHFOUzFNUmpjc252WU9lenFMbXljRStPYWRFZ3d1TmplNWtq?=
 =?utf-8?B?eXZTV0V3ZnNmUGUrQXEyVndsQnkzOHduTWNKb1lXTmdLVWRVdXpYT1NkRVFm?=
 =?utf-8?B?V0pnM01Dc3FqRVRmR0tBTjJOcUlneTNFNlBybDdxSU9UbEk5c2lrdVZqbXlp?=
 =?utf-8?B?TVZGUU5RZ3QxRTkrZGh4RFRiMXM1SWhTTDhGTTlDbFB4Q1VLZ1VmZUhPZDNM?=
 =?utf-8?B?T3k2L2dUbTVLaXVNWUFJQ2FFK0FYSm9Jd1JhUlhFT1RmREx0cnhXRGV2aHVK?=
 =?utf-8?B?K1BxOGNST29ib1B1bzJhc1BNOERSUloyQ2Z5YTNJMW1VbVpraktlQjdINlBI?=
 =?utf-8?B?c0NuQmh2TkpGQkF4eTlBUnllYTFjc0grVWlIdDYwRjBMcjNDUzdoSW5FYW1q?=
 =?utf-8?B?Ymg5ZWRMYkdqZUlIYUlUbTJXandQS2RkMXo5YnhnNGJ4WElITzROU1hKYWpX?=
 =?utf-8?B?OXRLeFZHd0dpWnlURks1aHJ5SkFHRU01OW1DeFlSaGVhUmRzcUpWSGFPMW1T?=
 =?utf-8?B?K3NJVnF2TW9Uem9IWWFoRkZuM2Y1ck44SFY4RU96RndYd2pHWmJwRnppVkRJ?=
 =?utf-8?B?c1VXK0htZEFURVRIRFVsdUNLZm5tQnI1SUhtd0N0TXRUOThxTnRhUVArM3FN?=
 =?utf-8?B?d1FnSFJ1a3N6TkFzdnNaTnduN0h2dzZvWmdDSlZIYU1ZRXZnTEozZzZzaXVZ?=
 =?utf-8?B?S1NXUS8yQzY2ZmlWNDBZbWZjUm90V1JWd0ZwYVNQdC9qc0R6NDBLME9CS1pO?=
 =?utf-8?B?YTZUWlVmQjlpeUVRUWNDZzlnNU8rN3ZMcldOMmdLOUM5NWdmYzJwR3lTZE5V?=
 =?utf-8?B?NGdsQWJHVVV3dzVDYjE4dWVuN2hZWmtRNXdxRnRsemFvbkd5Sjg2WXc2dm1r?=
 =?utf-8?B?Y3loditOYm9VZ2ZpTW5CbXZSbFdMcnFUY0hrSnN4eUE5WjZ6bTRKeXhPT2FB?=
 =?utf-8?B?cElGaEozS1RzZGl5TGRkZllEeWRlZXpqanZldEdVZ0NYQjQvcWFRNnZIMkow?=
 =?utf-8?B?UlRjNkR0MVFWdWpWY2JrMmdhOS8xalVuU09FRGtQZU4wRU5zQlFlTFFVUi94?=
 =?utf-8?B?dU8vU05sRWptV3VDemNSbGdzSWtOZm15OE1GY2VNWG9IQmxScWtpQTA3M2Y0?=
 =?utf-8?B?RkJzS1NoQkVNdzNiTGRpd3o0d0pkTGF2VjMwUUxmcVNCSUoyQ3lUaFlXanhn?=
 =?utf-8?B?U29KK0ZQdGl0TytrWjU0dFB5NlN0MFoyS3dCVTZNdVJ5OThORkhFVnFkZktq?=
 =?utf-8?B?c000M0k0Z3BadVIxSWpQbGVNMit0OUZDSFR2R3RhRU1tOVVxdUF4ZmJYNHpO?=
 =?utf-8?B?ejFDTW5TZjVxZUtZd3hvTTlFZjJadnRrTGJCWnJLeE9SR04vMGR0dGdadnN1?=
 =?utf-8?B?R01pdGY4V1NHRGZFZkJEamY0cmpKUkRtRjRJYTE0K3lEL2RyS0FOWElkY0Uw?=
 =?utf-8?B?ajUwaE1sTGtFK1N1eW53UTJmK2dKM1VZVkV3NFB6Uit1VkwzZUNOcUE5dEVM?=
 =?utf-8?B?dERUbllyZjZoVTB1THRJcjNEalFRSTRzYXAzUm1VcnF2bzkweVZIYVBQcm5r?=
 =?utf-8?B?N3pXZHJrSGFhbjBhL05tQ1N2NzY4VWo0Vm0yTnBzSFNLWUNQRzZIRE1TR3hE?=
 =?utf-8?B?QWxVMS85Myt4RHFuVEhkcEc2cDZLeXRHYWdYOUFqSWpGZGYzRmlhQ1hNUkRW?=
 =?utf-8?B?OFNQVDB5ZU9MaG8reWtxM2JXYUtSQ09RQWExYjBtbVYvWUtPWmpEaTdMM1Zq?=
 =?utf-8?B?RlNacmFxMVJTZVBYZHcvNTQ5K3NsSlFsdk9wb0xXZWRmN2dXNnpYZ1pHVHly?=
 =?utf-8?B?RTFZTkJteUFveC80ZElsTk9jaGRoQkQ2MkdZUlVEMytkVUw1Zll2RTl4UWw3?=
 =?utf-8?B?djFVUjJnSDFob0Qyc0ZRT3dDeXBkVmJrUXdrbDVGdmNISElndU9CdTlDS211?=
 =?utf-8?B?UVRSRUMwZ1FzTVlHTktoOEIzZGNVUHdKUGllcDFCMVF4dlczL0hhWVk3SW9T?=
 =?utf-8?Q?DSEXjRrZRtIdBSZBK15kR3dbt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b2ebf7-6efe-4956-51d7-08ddec369b0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 04:42:22.9712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzWzWj8hcO4gqBuhJmL0+67L9VL3ItSe1NuCdT4S/oP40RejTHgJYsefDrfspOcj9MIw2xxAzulZIHU7GaIEMnYqhAz02v7Cm0wX4e9JIoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
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

SGkgTG9nYW4sDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzVdIFBDSS9QMlBETUE6IERv
bid0IGVuZm9yY2UgQUNTIGNoZWNrIGZvciBkZXZpY2UNCj4gZnVuY3Rpb25zIG9mIEludGVsIEdQ
VXMNCj4gDQo+IA0KPiANCj4gT24gMjAyNS0wOS0wMyAxNjozMCwgVml2ZWsgS2FzaXJlZGR5IHdy
b3RlOg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wMnBkbWEuYyBiL2RyaXZlcnMvcGNp
L3AycGRtYS5jDQo+ID4gaW5kZXggZGE1NjU3YTAyMDA3Li45NDg0OTkxYzQ3NjUgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9wY2kvcDJwZG1hLmMNCj4gPiArKysgYi9kcml2ZXJzL3BjaS9wMnBk
bWEuYw0KPiA+IEBAIC01NDQsNiArNTQ0LDE4IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIG1hcF90
eXBlc19pZHgoc3RydWN0IHBjaV9kZXYNCj4gKmNsaWVudCkNCj4gPiAgCXJldHVybiAocGNpX2Rv
bWFpbl9ucihjbGllbnQtPmJ1cykgPDwgMTYpIHwgcGNpX2Rldl9pZChjbGllbnQpOw0KPiA+ICB9
DQo+ID4NCj4gPiArc3RhdGljIGJvb2wgcGNpX2RldmZuc19zdXBwb3J0X3AycGRtYShzdHJ1Y3Qg
cGNpX2RldiAqcHJvdmlkZXIsDQo+ID4gKwkJCQkgICAgICBzdHJ1Y3QgcGNpX2RldiAqY2xpZW50
KQ0KPiA+ICt7DQo+ID4gKwlpZiAocHJvdmlkZXItPnZlbmRvciA9PSBQQ0lfVkVORE9SX0lEX0lO
VEVMKSB7DQo+ID4gKwkJaWYgKChwY2lfaXNfdmdhKHByb3ZpZGVyKSAmJiBwY2lfaXNfdmdhKGNs
aWVudCkpIHx8DQo+ID4gKwkJICAgIChwY2lfaXNfZGlzcGxheShwcm92aWRlcikgJiYgcGNpX2lz
X2Rpc3BsYXkoY2xpZW50KSkpDQo+ID4gKwkJCXJldHVybiBwY2lfcGh5c2ZuKHByb3ZpZGVyKSA9
PSBwY2lfcGh5c2ZuKGNsaWVudCk7DQo+ID4gKwl9DQo+IA0KPiBEbyB3ZSBub3QgYWxzbyBuZWVk
IHRvIGNoZWNrIHRoYXQgdGhlIGNsaWVudCBoYXMgYSB2ZW5kb3Igb2YNCj4gUENJX1ZFTkRPUl9J
RF9JTlRFTD8NClllcywgSSBtaXNzZWQgdGhhdC4gV2lsbCBhZGQgaXQgaW4gdGhlIG5leHQgdmVy
c2lvbi4NCg0KPiANCj4gPiBAQCAtNzA1LDcgKzcxNyw5IEBAIGludCBwY2lfcDJwZG1hX2Rpc3Rh
bmNlX21hbnkoc3RydWN0IHBjaV9kZXYNCj4gKnByb3ZpZGVyLCBzdHJ1Y3QgZGV2aWNlICoqY2xp
ZW50cywNCj4gPiAgCQlyZXR1cm4gLTE7DQo+ID4NCj4gPiAgCWZvciAoaSA9IDA7IGkgPCBudW1f
Y2xpZW50czsgaSsrKSB7DQo+ID4gLQkJcGNpX2NsaWVudCA9IGZpbmRfcGFyZW50X3BjaV9kZXYo
Y2xpZW50c1tpXSk7DQo+ID4gKwkJcGNpX2NsaWVudCA9IGRldl9pc19wZihjbGllbnRzW2ldKSA/
DQo+ID4gKwkJCQlwY2lfZGV2X2dldCh0b19wY2lfZGV2KGNsaWVudHNbaV0pKSA6DQo+ID4gKwkJ
CQlmaW5kX3BhcmVudF9wY2lfZGV2KGNsaWVudHNbaV0pOw0KPiANCj4gSSBkb24ndCB1bmRlcnN0
YW5kIHRoaXMgaHVuay4gV2h5IHdvdWxkIHRoaXMgbmVlZCBzcGVjaWFsIGhhbmRsaW5nIGlmDQo+
IGRldl9pc19wZigpPy4gZmluZF9wYXJlbnRfcGNpX2RldigpIGxvb2tzIGxpa2UgaXQgd2lsbCBk
byB0aGUgc2FtZSB0aGluZw0KPiBqdXN0IGxvb2sgYXQgdGhlIHBhcmVudHMgaWYgaXQgaXMgbm90
IGEgUENJIGRldmljZXMuDQpSaWdodCwgdGhpcyBodW5rIGlzIG5vdCBuZWVkZWQuIEl0cyBhIGxl
ZnRvdmVyIGZyb20gYW4gZWFybGllciBleHBlcmltZW50YWwNCnZlcnNpb24gdGhhdCBJJ2xsIGRy
b3AgaW4gdGhlIG5leHQgaXRlcmF0aW9uLg0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IA0KPiBMb2dh
bg0K
