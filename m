Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27C09D90B5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 04:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A043E10E770;
	Tue, 26 Nov 2024 03:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZyqXfRC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DD710E05F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 03:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732591194; x=1764127194;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6L4HU8+K2Tuak0rDV9igpfwBGxLqhPhKSryiIgWN6cQ=;
 b=BZyqXfRCdmyKP4R0XvVV+QCaW+wlu5cZYxJseTRUEdfadHcqRWpfx7lr
 e2iR8MLx3513a0ECKgy2rHkmM+mTjKqDqxps8/jZllyRf3Sm9esz54YGS
 Xh6cxfnVDx41MSLxygJm0WlSPMhjvucGPWxb9Tdg2RLdOvx+UaFADLAML
 vY0yT+oWPChFSXVRqUdrd+ZMA1BFyOghJ/FK1fK+XaxpC5dnXm9+vNHUj
 BLxCrJV38nS9fuYPy83f6xS/gHm6AKvym4dHPc3BBzJqn53U0Quhkthmb
 LFTdZJwk8fshj8MTN1ZHKO+hq970pjtDXviZu2P4JYXKEjAp4kyCfnwlp A==;
X-CSE-ConnectionGUID: /W415LICSuKgoNGdUgek0A==
X-CSE-MsgGUID: tSueAjR2SGu2E+m4DJ21Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="35582486"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="35582486"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 19:19:53 -0800
X-CSE-ConnectionGUID: WOooGXNHQmCOykNby0Xxqg==
X-CSE-MsgGUID: +Z57JFDwRv6GSKVCcpDbDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="96556164"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 19:19:53 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 19:19:52 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 19:19:52 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 19:19:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlVqUzNkX16NH6Bc+6IJAudKFu3tYnb2UAj5e+eJDq+E+WkHjeLmdl6Rgoryagz+PnIEdAHenSNKJJdxdew125BQM1zFJL6k5KFXaQVQ8HBa0nSy/l2tQ++NTk05OEE46WhhIhOJUr0OdXqkugxHF0mT0vzWIgfTjr6BdtzNgbzGya2SLmdjCqlI6HHmLRFs5TEPsqaK9S0oyEc2Aw0WBSfp1xHR2SKs0LLnyuzXz7jnwCDrsciiU2vUwDvHZgZEARgdpW48Kf8HifudKN7g+i9F1dJeGzcfEioQXIqXvCu2+luiRXXoYxMA/GMsqFZpnt8kZhyWqDRV0PNtyTsO2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6L4HU8+K2Tuak0rDV9igpfwBGxLqhPhKSryiIgWN6cQ=;
 b=jYkOdci437/4pseWwZ1PAUh1dUlzSRnGZ2Zbp9lqfITGlNhMCgQNZWB1De9q+FMSssmkjE4qnfMFPnSZmzj/G0uvQbM7CPVz1bfxf5/0xXbpqMVnzN+AYC5loX9woeAX8FNJ54kyQjqE1lVwxB7SsedR/hle7YLJYctUy9d8XUBjfm23c8Lizo8jIfEVIJbOMa2l7cBVu7OUdieHDqpQbC38KeIDDNI0vNaA8mOpjpAVtw1QXFuFK2DMa4fNLo8Imhi3w0cqRuMbh9Bwl/2bzjQl6j1tDnIutuBwsHK2QaWg7XsTJnD2UCnwIWpG5uiOpxjshYCcAI41vQNzpdImMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ1PR11MB6251.namprd11.prod.outlook.com (2603:10b6:a03:458::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 03:19:44 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 03:19:44 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [PATCH v4 4/5] drm/virtio: Import prime buffers from other
 devices as guest blobs
Thread-Topic: [PATCH v4 4/5] drm/virtio: Import prime buffers from other
 devices as guest blobs
Thread-Index: AQHbPw+AkVADU1CBJ0m64rE7NuyPF7LIMbIAgACF+uA=
Date: Tue, 26 Nov 2024 03:19:44 +0000
Message-ID: <IA0PR11MB71852238882CCB38560323F3F82F2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241125073313.3361612-1-vivek.kasireddy@intel.com>
 <20241125073313.3361612-5-vivek.kasireddy@intel.com>
 <fc4223c0-0346-4a14-96fd-8dced8b41167@collabora.com>
In-Reply-To: <fc4223c0-0346-4a14-96fd-8dced8b41167@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ1PR11MB6251:EE_
x-ms-office365-filtering-correlation-id: 849dd4d5-842e-4ed2-877e-08dd0dc92ca1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N1NNZ1ZYRHJGeVdTUENISnd5bS9vb0NlZDBJb2E0ZktmQnZtUFFiQmJ6NWdo?=
 =?utf-8?B?Tm5pcitXVEFuaDZvcTNKMDZxZWZiRTFsaFhEWTF6Sk9hZ0NLY1FaNjNNbnBl?=
 =?utf-8?B?cEtJNWlES0RldFMxclN6TEFPajgvY1JtclJHeDlhaVFOdGd0emx6cStMWjFC?=
 =?utf-8?B?V2cyNXdhY2NkYjN4Y2hZb05aUEFMbEJIcmFqMHRmV0t3R3E2L2g2RmpENnhI?=
 =?utf-8?B?N2REb2tHb3RZWEpKK2lsRE5OVFJyZGtmSmxZV1QwS3MyNERCRDU3ZUtFS01u?=
 =?utf-8?B?RUYxajFxK3dOb25WVVNDbGxIOGxUNzZlMjQxckkvTHNPVnRvS1BiRG9aRDFk?=
 =?utf-8?B?QXNzOXZDcyt2dWFPZXYyVWdnNVJNcHpURHQ4MU5RMHh5SzUzUVJKUVN1ZjVB?=
 =?utf-8?B?T2NIdDBkKzhFOFR0RXZFRUlnYVVhcVNiUklwT283UThhNldnZXkvNVp2K2R3?=
 =?utf-8?B?ZEtUZmsvNlpBd29ocjY4V3hNVGhKd3ZYNS9JNFFNcmxlbFNPUElrUk0zUHZH?=
 =?utf-8?B?aEdIbVBkRnJnZXIzSGt4ZjBrU28wNjBlYUxudEJ6bkk4V2pYNVRhSzBJRThJ?=
 =?utf-8?B?eFh6N2pjZWpMcnptZ2V3Y1VQcnREMXBMZ2pCT2lyeU5hUUREKzgvbzZ0UkVH?=
 =?utf-8?B?dzI0MW1XWHNqOWNjb3M3djRhSllWVmxCME1VS20zeDFRR2thRDIvQS9wNHo3?=
 =?utf-8?B?UTlzZDc2VDFWb3N5NkJZZDlwdk5BM3RoQkJxK2JQUi9IQXhBdzBDUTk1WXpG?=
 =?utf-8?B?QlZRalBkWUt6b25XWUNQRVptZko5WGk1enlEWXhKTUhYemZTVkdCNlRqaUNS?=
 =?utf-8?B?TXhJK3FqSWFFdGxOaHI0NTk4a0pkRnNFSXhLd0JoK1lUeXdBRHF2T1NPaVpi?=
 =?utf-8?B?b2R4WEpNYk1MS0IxVUhLdkRDNVcyVi9JYTZZOVBWcE5qbUtPM0hjVCt1L1pN?=
 =?utf-8?B?cG10SXlkNEN2SlMxQno3RmRHTnM5YTlGNXhOQm4rMXVEQi8rR3gva1BPVllJ?=
 =?utf-8?B?cnhLWjVmRU5yQ1A2bVhwbUNvSk5oTy96OW9iZHdYL2VPTm9PV0JranJ2SWtU?=
 =?utf-8?B?TGY4Y3JUTUhBbW1ORmFLY3poTFplMFZWMXFuVVZ5OWVKRzZSQ2t0ZERSSzhv?=
 =?utf-8?B?SWRBelhjajlsMFRKTm1ObXhlZGxabHFrUVljYUVYY1JKMEFYNHhqT2tmRkQv?=
 =?utf-8?B?dmt6NTh5S3RsNDBxVmNGWkFYbWxvbyt1Yy9SQVVGb3FmYlgzaXlwRWRLV1Bt?=
 =?utf-8?B?NnVPYlUzdXBUUTB0MEVZU3l0bzA4NXloWEZWa0JMWVFZOUQyREdSVXdDZzRy?=
 =?utf-8?B?cXNIelhBc0JxZWN6Q1ZlQmFzeHVyc0ZKbHc1Y1V6Ylk3RVdZQlJsc3BiWW5s?=
 =?utf-8?B?L0RTSVNvdllxVmI3aU0wd2h0bzZ2ak1zZ2JaQTc0NWRwcVVBOFV2QVJqSFFB?=
 =?utf-8?B?K0JNdUxIVzBYdTQwVUZzOHEwMWNYL1NwRHF6OVQ1NnE4SS9RRHV4WExsdEVY?=
 =?utf-8?B?aS9jb3ZCNHhJU0o4UlVCYTBVcFZoSlR2SkxrcENzWjhxQVdPUU9vL0JSR2xO?=
 =?utf-8?B?cFozUjBxM3ROWFo4aG5adFJqbndUZm5BSElHNm5MalkrcUVlNXlBU29NV2ky?=
 =?utf-8?B?cjJJNWRBUlcrbzFqMHZidGZhay9nNi84bDA3VkRTcVdvR1ZPK1E2RHZncURw?=
 =?utf-8?B?eXVsZEhlRWNUQVgrRmQzNGtFUXdOaXhteUd0Ry9iYThpTEQxODZVaFpZSjM0?=
 =?utf-8?B?TVYxS1U4NmVtRG5XWkFEWHZYWU05cXp1dGFlcktkNmFuRUN5dmZnT1d5RmRO?=
 =?utf-8?B?U01YdmxyMG4vdlFCRHdRZ2R2WSt2QXIxWXBnay92anVvMFF6Tnd5VzBsWmEx?=
 =?utf-8?B?SW94TzRncXlORExRUGRWTWpNZXNreVV3UzZLRG5Fem1aSkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clFKWk1tWUliMkRIMUptVHpFSkhWNzNack9uZXc5VjNObzZicmRrdHNWSDJV?=
 =?utf-8?B?cUxtRkFhMjhvT0ZWMFQzbnBDZHNiV3YzRGE4KzZ5ODQ4MW45Vi9aSmhTck05?=
 =?utf-8?B?WjJlZ05yR3BpQlY1MUxPc0hja3hPQ0YzVzBwc2dHc3JSaEpQdGJVOC9Fb1Y4?=
 =?utf-8?B?WE9oSjJpc296MGJrUlZqTEtVMW4yZ1dRSXNvYmg3NmE2MTFXYlVpdUFyL3NP?=
 =?utf-8?B?RXpCM0ZGVTdzbVF2cVNRdFprWCtPZFg2bmZMS3pEa0ZlWVNSalBNQkIydDY5?=
 =?utf-8?B?QS9ET3BqcVorU3ZtL2d1K1pJb3U4WVRlNnNIR0F2dGhweTdRcUdIOHZ2aGVH?=
 =?utf-8?B?K0lJdS9JR1plcUFKbkhYOURGQmpqRy9PVnhLY1VkTFRQUmh1QUVXaVJ5ak1R?=
 =?utf-8?B?VEowbjhnOUdwbERJY2FTWlNoQldQNUJTMkhZOFFrNmFvVmIvM3o0bHB4Q3pB?=
 =?utf-8?B?WXB4eURIKzMzU0RudWgrVlBYUHFPNmdobW9PUGsxa3k2VjBxemhETGZrVmw1?=
 =?utf-8?B?Z2thNU9saC9sRVlEckxUN2hHTkRLaFowc0VrV0RpYVlKVVF0YTBsWEZhT3lC?=
 =?utf-8?B?RG1zaTBGbXN6Q0lWZ2Y1RUNwdk5qSG9WSjVZSDJkalRiV3JsRDBqWXpuQUlp?=
 =?utf-8?B?UUJ5R0xIMFZjcTV3WTQwZnlsVHpVbVRsR3N0TllwY2xRSGRjaER6T1BkTDhC?=
 =?utf-8?B?Tjc2UlRCS25BS0xrSklkQU9sOTZjclUycWtyVGxUZmhiYm83RXV3N0NLMDBr?=
 =?utf-8?B?Nm95cjEwWGNDK0dRYVRtK09CdWdoWjVTS3dkQVJmTmZYbUdUZUdQcitUbytQ?=
 =?utf-8?B?RGxFK2tpalBhZmxIclBmcCttSGttV3NGN3dmWm5FcVkvWTdUVDNnYmt3bjBa?=
 =?utf-8?B?RW5oSVYwdXlGakFuSnJ4UzVQZUNQUVAwVjdWSlg5S1EzRGt1cmNQRUY4SUJi?=
 =?utf-8?B?eCsxdWRBWnVLcG9VZWJVWHV1QUQ1NXduL0hWRkhCdFdRMGcxbzhFRlhiWWNC?=
 =?utf-8?B?WVFFS3FFa1NiTWk4UUFjSkx2RVNxSm1FYUE4ekVGUy81NmFuRGp0aU1JL09H?=
 =?utf-8?B?TFhLYjFRazZxYlljc2ZyT0J6ZGFoSHRuQ0RoQy9hL2Y3NUJiamx0VjBHd2pn?=
 =?utf-8?B?eHJIUEpDcFl3N1VGMFJ3dDl0V2ZoVmV4UkN4bTczdkpjUTRnZW1mT1hES0Fu?=
 =?utf-8?B?TFdHTWN2cWpkUVMyMURtVGhrcUpLU1p6V1ZkUjlpeVM3bE9CWUZPdG5rdWtq?=
 =?utf-8?B?WEFCc2pXOTdkcEtQSUJDVURtOUc5UWNzckJydjFZNlYwWXh6OHQ4TjlJaHd0?=
 =?utf-8?B?dEllZE8vMlFSSEhZQ0xlVTAySmZZaHVrWUtyV1dWSHJsVk5qMjdPMzA2ZC9B?=
 =?utf-8?B?M3JRcDNRS2czUlluQXFBUmgyc2hCc2paSlBNREdxVENsRSt0VExJTENQOUdn?=
 =?utf-8?B?MFQ3bzE3TW1IRXdBSXpvaUZibElHU2Mvb3NuNzlZZGQ5dStDczdkZ1lKdGMx?=
 =?utf-8?B?SGVKUDROdkQ1Ky9GZ2hibEJpYXFoZ2ZnT2FQYTdMZjBnNDhPaUR5MVBhWUZO?=
 =?utf-8?B?NklPbkF4ZHNnTGgxUGsyMHpyN3ZpeWEvZXNQY09PejE1eFhNNTMzOEZ2U2RI?=
 =?utf-8?B?K0JtL1dSK1UwYVRDWnVscFRqRzJGZjc5VG1pdGNTb2R0dTJrbk9kY2xPY2VZ?=
 =?utf-8?B?c1dMU252TFJSNWgxYjdEZlBJN0VheXlJYThuQkVkQmVUbysrV0dZd3VmY2Yy?=
 =?utf-8?B?Q1NZVjFjaW1UTnJKM1VsSlp1REdNR2h3NVFzTzFhRWZNM2l3QW1CMFBWK0ZF?=
 =?utf-8?B?S2ZSNU5NQk5YRk1OaFFURTZ3SHFlRE1CM3BSM2M0YmJGcUl2OGNzTmhabWov?=
 =?utf-8?B?Rmk2eFJqaEJDa21jVklzaTA5V1BwZm9DeVNDd2ZSVWdXOEZDRmhCbVBxZS9y?=
 =?utf-8?B?TlhUOFJpV1hVWi9xUzlqS2s4TXBLQW50SnFQTzBVWjY1eHRRWklVWFRoeXJY?=
 =?utf-8?B?Sk5yWkYrcmgrb29HOXBPVzFjTi9aMElDK2k2bkJvVjEvb1lYb1VyYndjU1pu?=
 =?utf-8?B?UXBoTnRHWFNEZGY5b243RTBzUFZsYVhpWlRKdGpUOHZodWpZaHU1cU1iVm9l?=
 =?utf-8?Q?jLuzAya+opHy4HU8GLrFwSc53?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849dd4d5-842e-4ed2-877e-08dd0dc92ca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 03:19:44.4553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fiV9yL17Kc35dNvoHVCvv9CXBAW3MKQIn3iTqEW3/+f5XWvJsEIz3jsOFaNDR4zmTSKmymGTu8TNq6rppY8GikuGNNAOkAEyiE3z0cRmsUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6251
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgNC81XSBkcm0vdmlydGlvOiBJ
bXBvcnQgcHJpbWUgYnVmZmVycyBmcm9tIG90aGVyDQo+IGRldmljZXMgYXMgZ3Vlc3QgYmxvYnMN
Cj4gDQo+ID4gIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqdmlydGdwdV9nZW1fcHJpbWVfaW1wb3J0
KHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsDQo+ID4gIAkJCQkJCXN0cnVjdCBkbWFfYnVmICpi
dWYpDQo+ID4gIHsNCj4gPiArCXN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYgPSBkZXYt
PmRldl9wcml2YXRlOw0KPiA+ICsJc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoOw0K
PiA+ICsJc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibzsNCj4gPiAgCXN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqOw0KPiA+ICsJaW50IHJldDsNCj4gPg0KPiA+ICAJaWYgKGJ1Zi0+b3BzID09
ICZ2aXJ0Z3B1X2RtYWJ1Zl9vcHMub3BzKSB7DQo+ID4gIAkJb2JqID0gYnVmLT5wcml2Ow0KPiA+
IEBAIC0yNzUsNyArMzA0LDMyIEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdA0KPiAqdmlydGdwdV9n
ZW1fcHJpbWVfaW1wb3J0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ID4gIAkJfQ0KPiA+ICAJ
fQ0KPiA+DQo+ID4gLQlyZXR1cm4gZHJtX2dlbV9wcmltZV9pbXBvcnQoZGV2LCBidWYpOw0KPiA+
ICsJaWYgKCF2Z2Rldi0+aGFzX3Jlc291cmNlX2Jsb2IgfHwgdmdkZXYtPmhhc192aXJnbF8zZCkN
Cj4gPiArCQlyZXR1cm4gZHJtX2dlbV9wcmltZV9pbXBvcnQoZGV2LCBidWYpOw0KPiA+ICsNCj4g
PiArCWJvID0ga3phbGxvYyhzaXplb2YoKmJvKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAoIWJv
KQ0KPiA+ICsJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiA+ICsNCj4gPiArCW9iaiA9ICZi
by0+YmFzZS5iYXNlOw0KPiA+ICsJb2JqLT5mdW5jcyA9ICZ2aXJ0Z3B1X2dlbV9kbWFfYnVmX2Z1
bmNzOw0KPiA+ICsJZHJtX2dlbV9wcml2YXRlX29iamVjdF9pbml0KGRldiwgb2JqLCBidWYtPnNp
emUpOw0KPiA+ICsNCj4gPiArCWF0dGFjaCA9IGRtYV9idWZfZHluYW1pY19hdHRhY2goYnVmLCBk
ZXYtPmRldiwNCj4gPiArCQkJCQkmdmlydGdwdV9kbWFfYnVmX2F0dGFjaF9vcHMsIG9iaik7DQo+
ID4gKwlpZiAoSVNfRVJSKGF0dGFjaCkpIHsNCj4gPiArCQlrZnJlZShibyk7DQo+ID4gKwkJcmV0
dXJuIEVSUl9DQVNUKGF0dGFjaCk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJb2JqLT5pbXBvcnRf
YXR0YWNoID0gYXR0YWNoOw0KPiA+ICsJZ2V0X2RtYV9idWYoYnVmKTsNCj4gPiArDQo+ID4gKwly
ZXQgPSB2aXJ0Z3B1X2RtYV9idWZfaW5pdF9vYmooZGV2LCBibywgYXR0YWNoKTsNCj4gPiArCWlm
IChyZXQgPCAwKQ0KPiA+ICsJCXJldHVybiBFUlJfUFRSKHJldCk7DQo+IA0KPiBQZXJoYXBzIGZv
ciBhIGZ1dHVyZSBpbXByb3ZlbWVudC4gVGhpbmsgd2UgY2FuIGRlZmVyDQo+IHZpcnRncHVfZG1h
X2J1Zl9pbml0X29iaigpIHVudGlsIGZpcnN0IHVzZSBvZiB0aGUgb2JqZWN0IGluIGEgY2FzZSB3
aGVyZQ0KSSBiZWxpZXZlIGl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIGRvIHRoYXQuIEkgdGhpbmsg
SSBzdGFydGVkIG91dCB0aGF0IHdheSBidXQNCmZpZ3VyZWQgd2Ugd291bGQgbmVlZCB0aGUgYWRk
cmVzc2VzL2JhY2tpbmcgaW4gb3JkZXIgdG8gY3JlYXRlIGEgZ3Vlc3QNCmJsb2IgcmVzb3VyY2Uu
IEFueXdheSwgSSdsbCB0cnkgdG8gdGVzdCB0aGlzIGlkZWEgYWdhaW4gd2hlbiBJIGdldCBhIGNo
YW5jZS4NCg0KPiBleHBvcnRlciBzdXBwb3J0cyBkeW5hbWljIGF0dGFjaG1lbnQuIE90aGVyd2lz
ZSwgd2UncmUgcGlubmluZyBvYmplY3QgYXQNCj4gdGhlIGltcG9ydCB0aW1lLCBwYXJ0aWFsbHkg
ZGVmZWF0aW5nIHRoZSBwdXJwb3NlIG9mIHRoZSBkeW5hbWljDQo+IGF0dGFjaG1lbnQsIEFGQUlD
VC4gSS5lLiBpZiBpbXBvcnRlciBuZXZlciB1c2VzIG9iamVjdCwgdGhlbiB0aGVyZSBpcyBubw0K
PiBuZWVkIHRvIGJvdGhlciB0aGUgZXhwb3J0ZXIgd2l0aCB0aGUgcGlubmluZy4NClllYWgsIEkg
YWdyZWUuIEl0IG1ha2VzIHNlbnNlIHRvIGRlZmVyIHRoZSBpbml0aWFsaXphdGlvbiB1bnRpbCBm
aXJzdCB1c2FnZS4NCg0KVGhhbmtzLA0KVml2ZWsNCj4gDQo+IC0tDQo+IEJlc3QgcmVnYXJkcywN
Cj4gRG1pdHJ5DQo=
