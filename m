Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A27937FBA
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 09:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D980E10E03F;
	Sat, 20 Jul 2024 07:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UuNywDTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B42D10E03F
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 07:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721460773; x=1752996773;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BEHtcYwR+mYtjMK72B2WE1kJKHJMTaT3/hN/KK8iuhM=;
 b=UuNywDTaUN2s6Hy94sbZVAJeHkn1GlvegKPKgVkt6GKN3SjXgCcaXP09
 gZ9Rs00mTW6yISTT0wxJaIy5kdBnih6Ap6d03vSdIRWsSPx2xOLShvJ9F
 YL/6z1BMAlnn+ke2rsBZozIhfMimQJtNt9AKvclMvi+RfGIvsn9wokq+i
 HG1/o0yxApr3AaakCW73mHL85/o2FtH59Trs2GDTb4ODsn4fidABsk2Be
 uUbbudKt9w46W+J5bXztIxNCMyevVwJsz4e+FiACOHGfwcoJecvDGSGEJ
 3Gd2hy8KMOYpmgibGECjYxOvIAcKl5+IrwZ2hzgNqSho7jLdCSsJ3pci2 Q==;
X-CSE-ConnectionGUID: LJONiL8RQdaZjTZV7cHz5g==
X-CSE-MsgGUID: Fl9fbhVLR3m9c/9dhRItFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22853240"
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; d="scan'208";a="22853240"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 00:32:53 -0700
X-CSE-ConnectionGUID: WlpgHTjiROqev4U8NTYZRA==
X-CSE-MsgGUID: kV0p7DJ6RmapqumWhBY0Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; d="scan'208";a="51366338"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jul 2024 00:32:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 20 Jul 2024 00:32:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 20 Jul 2024 00:32:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 20 Jul 2024 00:32:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlARNyUFf/14VfvQHwHjjeTYw/eypVzvNSIVUZPKZJxWZ8AuWCYD/Hqs7tsMKHKxTTBECpUvu19aN7Yvk/KBytfQ6lEsacAmkwpBOYrrnCIrQsTqmxw+mztGM/qiFfjQ6n8pNKNfinwkr0NwMmQiFgLjalfUf8VR6r/WAu5TTHRp1utU3LXkLKorwKoUXuRFm4Q8OZCLNjh92nZI8SUkG7UTmRqAUamZhyQYy8emhMf5qjufH8bIzEvf4baEIpxHq1wlEMzqDZQ4QxR2CWdfHSa2cwqu3jHlEe8nsR56AOpdI/MsMgDSwQ/A0sSOJRPZe16SiGdrE80s/SNcB0j76A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEHtcYwR+mYtjMK72B2WE1kJKHJMTaT3/hN/KK8iuhM=;
 b=csLWmibO5foI2PSl/0RUHBI6U4IHhTcLTKr9Gt5RsscsY2INb7kik/DKg8c/BVs7O6mVbaqMUmEdDSu2J6uIm+XhXdYBuwHM14dzBHWLKJLnm+g+qvxeJESMUFC5KWcRgwz7kiBQS6Ni5MVx8oYtaA7kBee/VCwSGHiYXCRWQOfWyFSOrYehBddWE2df6agN8X/NH7IcXyx31hPMhbzhK8w6dOvVDa+pOw6+Jzf5JAvVnspSdKY55W8fGsGRT2qyJQzpvf+Drfe1aC+zFncWan7v2thP+dHVsiCC/2OvQlDg+Lwta9d3EJuPUojWb75D2YNXGxry7hqrgz0mrPAw2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by IA1PR11MB6290.namprd11.prod.outlook.com (2603:10b6:208:3e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Sat, 20 Jul
 2024 07:32:17 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.7784.017; Sat, 20 Jul 2024
 07:32:16 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v1 4/5] drm/virtio: Import prime buffers from other
 devices as guest blobs
Thread-Topic: [PATCH v1 4/5] drm/virtio: Import prime buffers from other
 devices as guest blobs
Thread-Index: AQHaxgYXkVhASybroEGLg+75uwHGjLH9BtOAgAJPkGA=
Date: Sat, 20 Jul 2024 07:32:16 +0000
Message-ID: <IA0PR11MB7185A2A9F2057ABE4E01717BF8AE2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240624064841.1572452-1-vivek.kasireddy@intel.com>
 <20240624064841.1572452-5-vivek.kasireddy@intel.com>
 <bb5ee059-08fe-4535-9a06-cba508de78d6@collabora.com>
In-Reply-To: <bb5ee059-08fe-4535-9a06-cba508de78d6@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA1PR11MB6290:EE_
x-ms-office365-filtering-correlation-id: ecefd83e-2f78-4f6a-38e7-08dca88e14dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZjIwWXIxL09aQXpvSFdOamlkc1F6emVBYjJ0akdzVERpMzdtWC9HRUZISTVw?=
 =?utf-8?B?VmtNSzh2djFwUmFFSkJzaElldjRjd2J2MnEydStMYWt6RUdmVm5wZmQ5NjBk?=
 =?utf-8?B?U0pNaVBOTzh0VUZNcVR3bTlSMkxKcjNMZSswbVV5V2pPTjZLWDdLMzNzUmNI?=
 =?utf-8?B?MWE4YU12bVh4S3FFSmdqQ0JnQ0ZwWktRVS9ySGpVTmwzTW9Wc3d0UVorSnlH?=
 =?utf-8?B?RFFUcjZHbEJ3b2ZHRzBUS1lKYmhyTlM4WHRMcGNQYUJaZzJMazNJV29meHVP?=
 =?utf-8?B?UDJlamFVa1duUFN0NzFHQXBVMUlMOGtsWlF1YldMWk1YelpVeHlEbEdwR0Nv?=
 =?utf-8?B?cmlrWkRMaytnc0RNay8zWU1NL3hyQ2tHYi9lbllkS3JMT3pYaG0rZzlpbUYw?=
 =?utf-8?B?anBSc0Nta3ZISVVYc1B2dVlqZnJBYzlhbGRweHVPNFJrZTB5TkZiWTgzQlF6?=
 =?utf-8?B?Wi9pUHdCa281UGVvUURrVDVnS002bkI0cklpY05Eb08rd29hSldBWkVpbFNp?=
 =?utf-8?B?bm0xbHlQL2I0NFdKbExneFFnd3dBelVyVENtQzlmNEdURlRxSkY2c3FsQjlG?=
 =?utf-8?B?YWI0bXpzZWVzOGR5K0gxTVFEZVkwd2tTczFkcVB5L1JwWXlOalRrWEV0SmEw?=
 =?utf-8?B?L1Q2R3hJNFNvWG9OVERiV1dPWTdkZFFNWlVTN21nazZNSkh3bkJtUVZtVzNJ?=
 =?utf-8?B?MGNzOTk1dVQ0YjBTczNsU3pWVHp2QW1JajBPZUhuNlVnNWdVWjVIallJYU5n?=
 =?utf-8?B?SnZMWG1OVFdCYTFTeG9iYzNlbHR2U3czbEJNSXZwdTErSWNWdVFHOFpYQVJE?=
 =?utf-8?B?MW03T2luekFwYzdxY2plc0lkbzZ6K1R6aWFNTkhoYTlVaFkyMVJEeDE4S3Bp?=
 =?utf-8?B?dkJuUXRiQUVlQzRwS0JKV0JqL0NNa0pteks5alRMeGRZQUVnT01ZdzVQMEkv?=
 =?utf-8?B?ZWdLbG01S2t0MHNyS2VTdkNBcndtQ3dtNTRiUVo4Q01iZzFEUmpWTWNSL3hW?=
 =?utf-8?B?ajNXbGROMXVQODh6Vk9UTFYrSmpmOHFQTFYvL3JmRWo4L3hQQXRQSlVJNDNn?=
 =?utf-8?B?M1FCZVR5UXdDUU12YUpiNU05bXk1WUdDZXZ3V3ExT3U5MXZlbXBCN2t2MHNx?=
 =?utf-8?B?NDFKbllFbWJEeTBaTE96VkU1amF3ZVBLZ2tOdGpzS1MvM0RWK1o3ZDZCSjhi?=
 =?utf-8?B?VVdYVTBaUGJtdHV0NDZlQVhDUDFZQ3pIeEU4SkVkQzd4RVFHRFp0MFNRY2x6?=
 =?utf-8?B?MHhwKzEyMkkzbyt5eEVmRzRrTGx1bHVqa3RJR1FibEhLSUhvUEJDOTlReG85?=
 =?utf-8?B?ZE92SWR1NXd5SUdWSEc4dUxhdU9LWERLRzRQVzR0LzFibXBVVXE3cndNZkVH?=
 =?utf-8?B?QUR2cWRrZ3g4Z0hwSXpNdW1Eb0o4NkFvWFhOa3lIanV2ZHpOMUZ4N0RSblBz?=
 =?utf-8?B?OFZnYXFQL2dmOEVTQ2N2ckF2RHpLS09KbEVhdk1Ea0crektsZ2tvWEFONlhF?=
 =?utf-8?B?S3dGdHh4d25GNjE0Ylc3K2d6ZzRKbFZZSUdwOEx2K3ZYRVpDcGpsd3Y4K09m?=
 =?utf-8?B?U2hkV2F3OTZ5aWFRWnhsdWdkanVNWFhMdXZ0UlZlWDVsNlY4VXZqTks2OEN0?=
 =?utf-8?B?aWE0b21iai8yS1ZLTXIvdnY4aHl2SmY3a3VjdmZSbG1taERFTzdBS1RZR1Er?=
 =?utf-8?B?UnBSWHV6S3luMlBsaHBqQUE4b1h4N2V2U1N5QnQxRmxZM3NFd1d1YkR5TGY0?=
 =?utf-8?B?bHpDZ2NtZFd1WHZtNVE3UzRHMWhMSjhUaUs0cVV2TlMwdkd0SEdHaHlIc2pP?=
 =?utf-8?Q?R/fSsGTORYoJaMY+2JZ9EYCFA14lUOMDpr1fQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1R5UEplWEhHZlhHYXA1RDc5ZEh0bjJuZFU1bUhGMVVoUXdueE1qUUZ6VjBX?=
 =?utf-8?B?UXEvU0pZSVZuYzBPT2hHaGFab3RxVDhjYzc0V3hSZ3VuSGJZbHNweCtiVEd1?=
 =?utf-8?B?Zk1CeFR6UU5Ib2RHVU9Ta3JpblpSbjY2WkNDcDJLK25lV3NWdjR3bU9salMw?=
 =?utf-8?B?enZFNDl3cmxyS3doNnhneElPNTBKbTdqaWt5UGtlRVRNY2tjNWFsRWFQZEpz?=
 =?utf-8?B?L1RPWW9wN01nQXEvcUtHaGdNK0YwWFRzandEOHo5bktCdGcyNjlJbUJFbURh?=
 =?utf-8?B?YlhpTzV5TFA3KzBGeDFoaFZ0d0FrZHVIUjBRSjNZaVJsdW9IM0owR0xSb1Vp?=
 =?utf-8?B?WC9SYUxRZG5jQ3piK0RBNkhMNUY2Q1JmdTN0MHN5UjFpRVdXdHlBMTV4ZUZD?=
 =?utf-8?B?a3IxVWtZa21IL05ZellSSDJIdDBjTFJnQXp3UHJDRnJINmNkeHpTYXdaT2NP?=
 =?utf-8?B?UUh2UVpYZWVIZEVyRU53ZHpkdmkzU0VQRVI4UUtOTUNSSG5HdldwV2U4T1d3?=
 =?utf-8?B?ZkhOVGhCM0R2SlBEODh0bXZ0bEZvSWFjL1FnejVwV3RScDJFbmQ5dllScjVi?=
 =?utf-8?B?dHU0cGRJR2JoWkhYemNZZmw1VVV5Mnd3KzNtUlBjTnMvYWhHT3JJa3dadVNR?=
 =?utf-8?B?WDBvRGljejRka1ZnaHRaN294L2pqTGExU0NMTHg0VUxYTGFVcTBzWTZhdmJt?=
 =?utf-8?B?c01NNmtQWElBNHpaUlBJS1dNZmU1dHF0TG9pbmdxYWh5c3Rkbm9HZzZrOWZn?=
 =?utf-8?B?aUpFeWJmUHBjQVdNYlBPcnZaN3c1ajZrMEhxY1JocXkvVmlSZXNPdlRVelhs?=
 =?utf-8?B?VGJxSllqZndCVVJvTDArMlZjTXJyUkVzUXhpMDlwTXk2U0tXQU9rRTFQYzJF?=
 =?utf-8?B?eXJhd0pvblBVcmVNb3dGd1FkcUJkcURWZ1BYejVFRlVKYlNrKzJkU29XbjVN?=
 =?utf-8?B?VVBjL3ZScnFmM2FDaEZla3RyWTJkVGI5bmVVRE9JYUlSc3dKcTk4VERxSmoz?=
 =?utf-8?B?OTBJaWREMDJmOVJ4bWYvaDFSS3Fvb2xQTlNidy9DZ3o3MVBISWU4WURKLy9p?=
 =?utf-8?B?d2RTL0t0VmIvMnhHR3lmdFJlbWhoYWQ5QTBzYjlVd2F2NVR5UXRTL2Uzc1Nv?=
 =?utf-8?B?OUQ4TU5lK2J3eGxZc0Q4T1ZnWG1XN2RWbHBmL3hiMkllMmZqTVF3clBYYXVW?=
 =?utf-8?B?ZEZEYWFpaTJzRGVJVy9wcFZaMDdOY0UramVJemdBc0hxTG9vYWhJVFFWT042?=
 =?utf-8?B?ZEczUTFNMk1lbmhpcWd5NU9DY0JDZVR5VzQxeDRCTWJaaCtjVkdJd1doblVW?=
 =?utf-8?B?MTNzS0trVWxVTnJuZU5nMHA5ajd0Tkl6R0xONFJPYUwxQWhGZ2thaGVTelFN?=
 =?utf-8?B?VkQvcW9tUG5jQzRuQ0FvcGlXOEl6WXdwTDh1M2hic0dWSXJ0UVFSSDVDU0Fs?=
 =?utf-8?B?SUJZWUpOM2h4NWIyZ0FGWDl3R3lkSUdhaEwxbkZ3R0dhNzBqcXI1TFRocmg5?=
 =?utf-8?B?Y205NmZMWmJlT0VSZTRKMTZpdWRGbmc3K1VkZGg2YmVyUWFqRWZYTXdvenVX?=
 =?utf-8?B?MFdEcUtQZWNwdnRoUldnL2VZVE1CUzJPb2RsRE9QNlFYTFNHN2NlbytxakJP?=
 =?utf-8?B?ZmwwVzRyVnErdlJ6MEIwVFJDYkdUWXFiUDVudXc5RGJ2MzRNM0tVUU13dUhw?=
 =?utf-8?B?enVTMkJkZW1BbUFyVmdaVGZURThRT1k0NlJpT2dJUVdqZTBjNnFRTHFPU2NB?=
 =?utf-8?B?QnlRb05PMWUzeUhvUzdHTGZSSDN2RGhVVVNwS3N3a2FHOVJFcnVFK3NWakJo?=
 =?utf-8?B?dUE3NnBuanpUTFFkVXVpWUdlTmhmWDBweGlNYkdHLzk3aEZwaFBXaUYxR3U1?=
 =?utf-8?B?UWx0WE1XcnJ5cnljMDR1a0t3bzNHbHVTUzRDV0pLYi9qS0QyeDJJaE9iTHJx?=
 =?utf-8?B?VmpWbEg5cXdEckhZY1JtelcrN3d3QTQ2Uk5pZHpXbnFOQ3k4V3B2c2xVNzV0?=
 =?utf-8?B?b2JtOW9KMDZsVlE0NkVreHR5NXM0anhKMXJmV1ppQVV1SUZNbmJKakFmZDFI?=
 =?utf-8?B?bmlpaG1PRnVLNEpjRENQSVJrUW5LcGhkbGR0TGJpam5NQnkwM1lSZG0wUEtU?=
 =?utf-8?Q?py1ETSEl0BwZwjpbAVz68XhCV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecefd83e-2f78-4f6a-38e7-08dca88e14dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2024 07:32:16.8100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4FDtoHTYhrMkZaxZ7aU4J05kWZ3mJ63pPT6311wS/mcPB5rfwfL8URec30MLAZmV+FlhQO4fFYf1CTaWZPpYFe6ZrxKPBO1pIfGV63ZZVg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6290
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

SGkgRG1pdHJ5LA0KDQo+ID4gK3N0YXRpYyB2b2lkIHZpcnRncHVfZG1hX2J1Zl9tb3ZlX25vdGlm
eShzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50DQo+ICphdHRhY2gpDQo+ID4gK3sNCj4gPiArCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gYXR0YWNoLT5pbXBvcnRlcl9wcml2Ow0KPiA+ICsJ
c3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiA9IG9iai0+ZGV2LT5kZXZfcHJpdmF0ZTsN
Cj4gPiArCXN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8gPSBnZW1fdG9fdmlydGlvX2dwdV9v
Ymoob2JqKTsNCj4gPiArDQo+ID4gKwlpZiAoYm8tPmNyZWF0ZWQpIHsNCj4gPiArCQl2aXJ0aW9f
Z3B1X2NtZF9yZXNvdXJjZV9kZXRhY2hfYmFja2luZyh2Z2RldiwNCj4gPiArCQkJCQkJICAgICAg
IGJvLT5od19yZXNfaGFuZGxlKTsNCj4gPiArCQlpZiAoYm8tPnNndCkNCj4gPiArCQkJZG1hX2J1
Zl91bm1hcF9hdHRhY2htZW50KGF0dGFjaCwgYm8tPnNndCwNCj4gPiArCQkJCQkJIERNQV9CSURJ
UkVDVElPTkFMKTsNCj4gPiArDQo+ID4gKwkJYm8tPnNndCA9IE5VTEw7DQo+ID4gKwl9DQo+IA0K
PiBCTyBkZXRhY2htZW50IHNob3VsZCBiZSBmZW5jZWQsIEFGQUlDVC4gU2VlDQo+IHZpcnRpb19n
cHVfZGV0YWNoX29iamVjdF9mZW5jZWQoKSBpbiBbMV0gZm9yIGV4YW1wbGUuDQo+IA0KPiBbMV0N
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0MDEwNTE4NDYyNC41MDg2MDMtMS0N
Cj4gZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20vVC8jbWU2MmRjYTU3MGZkYWUzOWM0MWJk
ZjA4NjdjOTkwOGVmNjINCj4gZDVjYzJlDQpPaywgd2lsbCB0ZXN0IGFnYWluIG9uIHRvcCBvZiB5
b3VyIGNoYW5nZXMuDQoNCj4gDQo+IA0KPiBCVFcsIGZvciBuZXh0IHZlcnNpb24gcGxlYXNlIGNv
cnJlY3QgdGhlIGxpc3Qgb2YgZW1haWxzIHJlY2lwaWVudHMuIEkNCj4gZ290IG9ubHkgcGF0Y2gg
MCBpbiBteSBpbmJveCwgZm9yIHBhdGNoZXMgMS01IG9ubHkgR2VyZCBIb2ZmbWFubiBpcyBDQydl
ZC4NClN1cmUsIHdpbGwgaW5jbHVkZSB5b3UgYW5kIGFsbCB2aXJ0aW8tZ3B1IHJldmlld2VycyBv
biBhbGwgdjIgcGF0Y2hlcy4NCg0KVGhhbmtzLA0KVml2ZWsNCg0KPiANCj4gLS0NCj4gQmVzdCBy
ZWdhcmRzLA0KPiBEbWl0cnkNCg0K
