Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60A7AB8CBE
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 18:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F8710E91B;
	Thu, 15 May 2025 16:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ak7bar3R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A2F10E1A8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:44:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGOofghiyq5hlyXPjZaAF1GdKbUX9GseTcEioeL2+FmUi9/Yd2zxSTQGD1gKHFbSOjnwzEVrfNJ35rvWHATcl/YanR64aMxYrjqkv4ISzg4H7TaAyZaUNYVdSlEdMP9gcKLbVQNLjdq2zvl/+ZkMlT0cwGeD1tIzHdDFar7HWRe9s5sWKFjgOjbTTumoXzFPU9A8+WP6bV0YtDM1sVrMc0OQJZh4tmof0h8qn//oOqWmATdRJkgfojWIBHn9mWvZk4n+02b9eGMKRtYRRox/R49UzgjBBkq80yw64l5gJbVn+yp1SQUUOQSAB8YTzU2H8/DB/geRscjJRy2yIAnWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9T2XMCd0/z1SZbQrKwhCVLeillMyHUNqQAjx7a35C0Q=;
 b=wQ9zhw5MH0PJHedBa3Qc+DIU7V9MM/cwgG0x8QuD1KEI3KGL9zkvlP4gtOmBI4zABytslZCXNLHM9KpD+6VSu+fVQ7/R6J5dMeW2TZTQPG6Ul87Cgh3wVsdT/fyjuBlXzlPHYlmAAWUnE1cCB0tztsPut1R04y4Ooez0aQGEwNyqd7TnGU51gM9uTNpsO1yRmEQvdAscfR+UsWfRl1XY+bwNCmKz4sNKnY3aGvGM7+vlEFbLtFaLH58lobUxmybuI3xd0NFVE6SgYY+GsGjzRWgX/VVT16cA1KiSbRWC6o4Pobq5SHapOU+CrsR+zdCjxRPcgWhgCLsJq5IPj3rX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9T2XMCd0/z1SZbQrKwhCVLeillMyHUNqQAjx7a35C0Q=;
 b=ak7bar3RAKCPuf+MQDbPJvWf/PiYVlPQU6Z+GXKdIzSx8iREPPWyiJu460+OutJBlUurIoGMhUu0oyDh32gI/rFBJjY/FQR6CSIu96S2AdHmRXrplumTO1uQeYqVnySBlsifP5n3grAlEdEddScz3gOJ0Mv+VctAC1OEzVpjOnS6vJYhIAqvJRzd9VM/4TQfSJec+WIhsCrPYuJv9qPjJ0AC6XUfWEKhutCWPTxSYVqP99VkIoe6NzFKlWjtAM3wnmA19VCLENmQ39L/y2vjp1DrBetWSqorasfFHM/IxJ81FN+VqKhGZ3rU0gvnrVqo8irZPP+OSHAkptP3yaBc8w==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by MN2PR12MB4237.namprd12.prod.outlook.com (2603:10b6:208:1d6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 16:44:47 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%2]) with mapi id 15.20.8722.021; Thu, 15 May 2025
 16:44:47 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Alexey Kardashevskiy <aik@amd.com>, Jason Gunthorpe <jgg@nvidia.com>
CC: Xu Yilun <yilun.xu@linux.intel.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "seanjc@google.com" <seanjc@google.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "vivek.kasireddy@intel.com"
 <vivek.kasireddy@intel.com>, "dan.j.williams@intel.com"
 <dan.j.williams@intel.com>, "yilun.xu@intel.com" <yilun.xu@intel.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lukas@wunner.de" <lukas@wunner.de>, "yan.y.zhao@intel.com"
 <yan.y.zhao@intel.com>, "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "leon@kernel.org" <leon@kernel.org>, "baolu.lu@linux.intel.com"
 <baolu.lu@linux.intel.com>, "zhenzhong.duan@intel.com"
 <zhenzhong.duan@intel.com>, "tao1.su@intel.com" <tao1.su@intel.com>
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Thread-Topic: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Thread-Index: AQHbxYQ1qjoVYkN+ZU+DlJUqD7XT0rPT5kwA
Date: Thu, 15 May 2025 16:44:47 +0000
Message-ID: <dce6c363-20ea-49b2-9cd1-9cc5e697162a@nvidia.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050> <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <20250513130315.0158a626.zhiw@nvidia.com>
 <8bc605ad-54ad-4d3a-9547-caa9d15887f2@amd.com>
In-Reply-To: <8bc605ad-54ad-4d3a-9547-caa9d15887f2@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|MN2PR12MB4237:EE_
x-ms-office365-filtering-correlation-id: e301fb4b-291d-4781-ab81-08dd93cfcdb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?b1p4WDVoOG1RMzVRLzJ0cXpoUjhadGFYdGRidDdVRko1bVhLekc2dDVnY0pw?=
 =?utf-8?B?c21sRnFWcHBkQm5jMHFZRU80dW5IUnl4L0ZkMUlqb2pXQk1ObndQSXVTd244?=
 =?utf-8?B?NlJNa2ZLaS9hWGFYd1Yzc1Q4bzZPNE5EQVpiREdCYUhHS3BpK3pyZm5LRTVk?=
 =?utf-8?B?NjVYdFBZYitYakMwekxiVU9pY2tUVGlYU3NOVmNlc1h1SVVLSEMrZWZ3YUtu?=
 =?utf-8?B?SWJHT3JWMzlHTWwwV04vUXlUek1HQTB0ZzdWd3RObXlTQXFEZ2RVcWhFR0Ni?=
 =?utf-8?B?Nmg5aTZnQVU3N1U2QXJ3OTQvOVNnbm9pa1NQZlE3NDlJZE85TVEyMklhaFZ2?=
 =?utf-8?B?TGpmWG9MdnR5SWlpRTFYbDVJN29HU0wzYjRGNjh5cm5SV1RpOXpiTzJ4aWhw?=
 =?utf-8?B?Y1NzaVIvaGovTzQ0byttZ0ltSXk5VEhveHdEWitBN1RaR1pldUhSeHF0TWNu?=
 =?utf-8?B?a2h2OGJXR1MxSEFyZWFnWUFxamN2M1lqS2xOWEFmTHhCN2kzRmNyWVpjZHFI?=
 =?utf-8?B?VXZqQ2daNUYyL2VXZE9zNUFUNyszUm1rd3RsTjBtQ0xSbytObUp2cnhQOWtC?=
 =?utf-8?B?ZVAwRExwQTFGa2RONlpjb0tCZ0lNNDF5bU9LT2dNWlZ2M0VwSHcxcU5QdnFI?=
 =?utf-8?B?SWszTWNqSW9GTFJ2MktXemlsM3FKUFBUeVBrSm5id0ZmbHA2dXdDc2dqMURo?=
 =?utf-8?B?cEV0eVZITUZEZXRMSGNpN3RVaUNxVE1udWhESW5YL3NGWUxFQUVzS0RzK3ZC?=
 =?utf-8?B?cWFJaE9hVFN2bEtBL3hhYXl5Vy92SWJrUi95VWhaWlAzcTJSbXByUkVLS2hw?=
 =?utf-8?B?NmNzY0dMWm9HVHg3WXRIbExXbUlBYUlGT3poSy9UejJXUmNJWmpqTnhtWTJV?=
 =?utf-8?B?bndoVGl1c25lYy9QbVpxUjdOT3NRbi9ZcWEzd1pScnlmUS9OczEvUnVLWXZK?=
 =?utf-8?B?U0hTSjBYbGhhSk4waU9XU2RmR1drZVJEaTVNZkpmY3pTNnRtT0x0cGFUMlNr?=
 =?utf-8?B?T1JLbjZIcWVneVg3OTZRUS95RlRIRUdEM2RoUmVGZUdVUldpcUdRYXlBTGxU?=
 =?utf-8?B?dUZkYzk0QjdxSVlEZXZ6Y3RuTmNrbklTTElnTGNYN09zQmJVbXFTYUdqSENo?=
 =?utf-8?B?SlBjMzVxdkVKTW0vMG9SSmd0cHBqZzljSFpGOGt5aGdjbG5RZ0FhSmV4SnN6?=
 =?utf-8?B?clNoZXBHZGZQM1Q3SEI4VTd0V0RRUU15UlBEdjhOQ1V2TVJYYkljeGhIRXNP?=
 =?utf-8?B?Vk13Z0tjL3RsSjN2RkhmU1hmQ0pNeEpRdzYzTFdkRUt6bHlia2tVeDVIdjNO?=
 =?utf-8?B?aHJPU0VybzdzMGRCd3BpbzNMVXNFYjU4V205eVIrakhTNk5Lekx5UC93ZjZO?=
 =?utf-8?B?OTg3QWxNN21FNVFKQTExL0QxK1B6S1FPaGIxNTBSU0U5UmFLanZuUzJ6SDZR?=
 =?utf-8?B?QmFPbWF3QVl0L3FITVVFWDh0R21Gb2Z0VVdxMDZnYld3REVrRnlBQXJFczY1?=
 =?utf-8?B?Rm5tTFc2SWNvcEJwWEhsSnIrdGpDK1hyRXQveG5TVUNpY21oMlIra2ZrRDB0?=
 =?utf-8?B?UjVnSXFSVGRsT0lkamk1ajBDNzhQemlSdGUxYnpaOTdTenN4MzJ6NVppdVRi?=
 =?utf-8?B?Y0tqcU9DdVRaMzhqcncyTFM1N2tUQzVZRGY0TitHSVBTY2pIOGxCMDdtNlZS?=
 =?utf-8?B?ZVVLcS8wWEdaNWg1Z2RWWVR2VWhCVnZJbTFwblRQL3RzT29QWnFFT2lpcVJ0?=
 =?utf-8?B?eGJiVm0yZVZRVTE5QmF2WTBVTGtWVlJkYnF6b2VDSVk5WSs1aEU5ZGRrZmpm?=
 =?utf-8?B?TXQ4eHQxdXdIT2gwaVB1Y3hKVGpBWTZKYTM3S0ZkS3lQK01hTmpKaVNWSDIw?=
 =?utf-8?B?QzV2bHd4RlZ6Ym5UYzAybWh6R0xDL3F5MFVEQldjVUZEWmxWRHp0cVdBNGJo?=
 =?utf-8?B?L2lreUUzekZtK051SUIvYzJRY0JlYjFYeHUrWG84bG41NjFXL1A3eFlzWmlt?=
 =?utf-8?B?YWNQWHA2OFpnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVliM2ROcmZVbExjcThacHFpNkJ4UlNrd2U1S3JpOS9vRGtadU9tWlE1WDVU?=
 =?utf-8?B?R29lNS92NVRYQnpocndFeG4ya1JJTFNSM1FuN05sdDhwR0FTREtWNERpMlM4?=
 =?utf-8?B?ZXcxWXVmdDdlYmQ4aDMzWWJoUUZNT1VRNHd0REVZd1dqQnc3ay9sa0lHbmNF?=
 =?utf-8?B?M2I5NElneVh0aEI4TTBwR1hZZzNBa2VhVWtuOFVaWTYweEpFZUpRY2xLYUtj?=
 =?utf-8?B?Y1Z2ajZBQ3NpOGhiV3N1Q0lhbHNMWGphalF2dXJWb1p4SURBUmt3WTdodFFB?=
 =?utf-8?B?UG9RNFVqMVdnREg4OFRWWmhNb05iUy9SeDF1TkFVd0FXa29ibXhoWjdQUUFs?=
 =?utf-8?B?YXFDa0FpQ015RlRCZitySm91anVHZmRzUXQzdVh6TXZNYWFJNTRrOVV1Q0RT?=
 =?utf-8?B?REV3Nnpuekhva1BMSU1RMnE1ajNWSHJNdmtmSE41T0I5aDdpZUdaOHlHeWRX?=
 =?utf-8?B?RTN2WmEvNk5NUE1OekVNeXVtcDZhWmE5UnlOTTBXQ0IxQ0MzUmM1a0dqU1I0?=
 =?utf-8?B?NGZnRHNwaVFzTHZsWGU5S3E4cGJtKy9FSGRCWkxkRUdsUlFHN09qV0YvM3Fu?=
 =?utf-8?B?N2xqZE5rNzhOMHVkM3h3aSs2RlI3NUF6MW03MGxQZXo5Q0RjdDNVSCt6cmlq?=
 =?utf-8?B?WlJmWWdkQTduRXF6c1Q0Tm1peE5kczBZWlpscmlkRzNNYjhGMnZCbnlQYjBT?=
 =?utf-8?B?SWZUb1Q2QkdWVVJUNUpNd1BWZ2lsWlcrbmY3V0VoV3hCWEpVcGdEckxxNGQ0?=
 =?utf-8?B?UDFCNzhCZkpyUDkzYWdPMEZncmlTN1FrVlhIU2pvRUZTeERLZ3Nkd2VpUzVT?=
 =?utf-8?B?MlpnL1RYMWNEZHY2N1RWNElXdFpudFZLamlKNStFV0pXVTBLWFY1NHVRdHlW?=
 =?utf-8?B?S2V0T0E4MTArSzVYUVZwTWgydDl5MkRvdDN3dUZQbTBTdTlrUDBkQ2NlNlc4?=
 =?utf-8?B?bk9STUFOeFcwWmx2Qks2bHlZRVhtVm90dFlUWmtnc0JmSlVKSDFaeU55amQ1?=
 =?utf-8?B?bldWL0haaDFRakZ0VVBVTE93eU5vYTAwMXpvekdXejg2TXphL2Q1cnF6MEdI?=
 =?utf-8?B?Tm9oN1JRT1RJdXNPeWRKR2FLc2pmbXI5QnBheERzRWhQYVpDSDVqMHkyczls?=
 =?utf-8?B?RUp1TFpzanphS2hJTUdBc3poUjhPcmowNDVVZkVQUkl3elZ4Q2ZjNmtRMWR0?=
 =?utf-8?B?cU1ZQ0QvQW9wSlJwcnoyNVBoLzZxVHBwV2hRbEVTeDFoTlptVkNvR3JVU2pa?=
 =?utf-8?B?TjJtZUVoNExvSVAwL2c5eWx6UXlXT0QvUTRXZXYycWtMMW9OUjJnczZURTRG?=
 =?utf-8?B?OFpDYk5JdTJtVWhSeGM3ci9TbTFSRmNqSS9SeUVJaGd5QmU0Ui9PaDNZWTNQ?=
 =?utf-8?B?dHpUZnFtSGI0NFpxcDJabWYyV29POXJyWE9zMERjaEVaM04xVUhib3VRdHBu?=
 =?utf-8?B?djRDWDZYRXhjOC9XT1pjTjBDRVpCMVFMVU9QTDRXSXF1TGJ6clB4dGl2TlZW?=
 =?utf-8?B?ZEdSOXE0Ly9MUWJCREpGbG5LRlNSM0VmR05BelNPUmdPcXN4a3RaaC9MMTRV?=
 =?utf-8?B?cmVKVTA1dkNHdXgyK0dINUhBSjZCWlQ1a2hPUXFlVmVIWENhdEQyb2ZUV0tp?=
 =?utf-8?B?OUdzejB4N1NGb25YaE43b1gzcEdLeEtyUzdic1Y3YkQ4ZVR6QUdhbGRrZmpy?=
 =?utf-8?B?T0U3eFI4aGlPYTN4QUNPcmZ0ZUhidCtQdXNqT1Joa1ZtWnREUnltai94Qncv?=
 =?utf-8?B?WmtvRzFycVRkeDBQUGRnZ281R3FHMkhsYVFvYmhyTXo4M2ZYNWZ5TnUvR0hk?=
 =?utf-8?B?ZGVTMnVPZVhheHE0MzJIV1lyVzRhd3JzcU81NmJBN0JKLzhCY29CZmhLT2F1?=
 =?utf-8?B?T2djSmo0TXByQTZSSWNmQXQ2ZU4wVytiYUs0L2Y1ZlU1cURlYnlIYmJaWUY3?=
 =?utf-8?B?djY1ZUw2QlJ2QlNVT254VGtzVlJDTStkeHIxMGdXNWoyVDQ4eUlCanFybWpr?=
 =?utf-8?B?ZXE5YmdJYmVwWjRzbnQxYWRYUjBIZGZpaWMzZGJRMEZqVkR4eEQwMWI3WVFR?=
 =?utf-8?B?M3ZSOUhWRVVsRnVsZEw3WU8yYUROU0xvdHZsNm5WaWt4akcrUXdsOHp6SFYx?=
 =?utf-8?Q?cXKQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E55F31FF9BEA554898FD8AC0E4D2813C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e301fb4b-291d-4781-ab81-08dd93cfcdb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 16:44:47.4386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QFvF6clSeVOK532sOFg1YixLjNVwxgl++DpL5RZE0EZAQeRHnl5fxzbwrh3aL6T5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4237
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

T24gMTUuNS4yMDI1IDEzLjI5LCBBbGV4ZXkgS2FyZGFzaGV2c2tpeSB3cm90ZToNCj4gDQo+IA0K
PiBPbiAxMy81LzI1IDIwOjAzLCBaaGkgV2FuZyB3cm90ZToNCj4+IE9uIE1vbiwgMTIgTWF5IDIw
MjUgMTE6MDY6MTcgLTAzMDANCj4+IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+IHdy
b3RlOg0KPj4NCj4+PiBPbiBNb24sIE1heSAxMiwgMjAyNSBhdCAwNzozMDoyMVBNICsxMDAwLCBB
bGV4ZXkgS2FyZGFzaGV2c2tpeSB3cm90ZToNCj4+Pg0KPj4+Pj4+IEknbSBzdXJwcmlzZWQgYnkg
dGhpcy4uIGlvbW11ZmQgc2hvdWxkbid0IGJlIGRvaW5nIFBDSSBzdHVmZiwNCj4+Pj4+PiBpdCBp
cyBqdXN0IGFib3V0IG1hbmFnaW5nIHRoZSB0cmFuc2xhdGlvbiBjb250cm9sIG9mIHRoZSBkZXZp
Y2UuDQo+Pj4+Pg0KPj4+Pj4gSSBoYXZlIGEgbGl0dGxlIGRpZmZpY3VsdHkgdG8gdW5kZXJzdGFu
ZC4gSXMgVFNNIGJpbmQgUENJIHN0dWZmPw0KPj4+Pj4gVG8gbWUgaXQgaXMuIEhvc3Qgc2VuZHMg
UENJIFRESVNQIG1lc3NhZ2VzIHZpYSBQQ0kgRE9FIHRvIHB1dCB0aGUNCj4+Pj4+IGRldmljZSBp
biBURElTUCBMT0NLRUQgc3RhdGUsIHNvIHRoYXQgZGV2aWNlIGJlaGF2ZXMgZGlmZmVyZW50bHkN
Cj4+Pj4+IGZyb20gYmVmb3JlLiBUaGVuIHdoeSBwdXQgaXQgaW4gSU9NTVVGRD8NCj4+Pj4NCj4+
Pj4NCj4+Pj4gIlRTTSBiaW5kIiBzZXRzIHVwIHRoZSBDUFUgc2lkZSBvZiBpdCwgaXQgYmluZHMg
YSBWTSB0byBhIHBpZWNlIG9mDQo+Pj4+IElPTU1VIG9uIHRoZSBob3N0IENQVS4gVGhlIGRldmlj
ZSBkb2VzIG5vdCBrbm93IGFib3V0IHRoZSBWTSwgaXQNCj4+Pj4ganVzdCBlbmFibGVzL2Rpc2Fi
bGVzIGVuY3J5cHRpb24gYnkgYSByZXF1ZXN0IGZyb20gdGhlIENQVSAodGhvc2UNCj4+Pj4gc3Rh
cnQvc3RvcCBpbnRlcmZhY2UgY29tbWFuZHMpLiBBbmQgSU9NTVVGRCB3b24ndCBiZSBkb2luZyBE
T0UsIHRoZQ0KPj4+PiBwbGF0Zm9ybSBkcml2ZXIgKHN1Y2ggYXMgQU1EIENDUCkgd2lsbC4gTm90
aGluZyB0byBkbyBmb3IgVkZJTyBoZXJlLg0KPj4+Pg0KPj4+PiBXZSBwcm9iYWJseSBzaG91bGQg
bm90aWZ5IFZGSU8gYWJvdXQgdGhlIHN0YXRlIHRyYW5zaXRpb24gYnV0IEkgZG8NCj4+Pj4gbm90
IGtub3cgVkZJTyB3b3VsZCB3YW50IHRvIGRvIGluIHJlc3BvbnNlLg0KPj4+DQo+Pj4gV2UgaGF2
ZSBhbiBhd2t3YXJkIGZpdCBmb3Igd2hhdCBDQ0EgcGVvcGxlIGFyZSBkb2luZyB0byB0aGUgdmFy
aW91cw0KPj4+IExpbnV4IEFQSXMuIExvb2tpbmcgc29tZXdoYXQgbWF4aW1hbGx5IGFjcm9zcyBh
bGwgdGhlIGFyY2hlcyBhICJiaW5kIg0KPj4+IGZvciBhIENDIHZQQ0kgZGV2aWNlIGNyZWF0aW9u
IG9wZXJhdGlvbiBkb2VzOg0KPj4+DQo+Pj4gwqAgLSBTZXR1cCB0aGUgQ1BVIHBhZ2UgdGFibGVz
IGZvciB0aGUgVk0gdG8gaGF2ZSBhY2Nlc3MgdG8gdGhlIE1NSU8NCj4+PiDCoCAtIFJldm9rZSBo
eXBlcnZpc29yIGFjY2VzcyB0byB0aGUgTU1JTw0KPj4+IMKgIC0gU2V0dXAgdGhlIHZJT01NVSB0
byB1bmRlcnN0YW5kIHRoZSB2UENJIGRldmljZQ0KPj4+IMKgIC0gVGFrZSBvdmVyIGNvbnRyb2wg
b2Ygc29tZSBvZiB0aGUgSU9WQSB0cmFuc2xhdGlvbiwgYXQgbGVhc3QgZm9yDQo+Pj4gVD0xLCBh
bmQgcm91dGUgdG8gdGhlIHRoZSB2SU9NTVUNCj4+PiDCoCAtIFJlZ2lzdGVyIHRoZSB2UENJIHdp
dGggYW55IGF0dGVzdGF0aW9uIGZ1bmN0aW9ucyB0aGUgVk0gbWlnaHQgdXNlDQo+Pj4gwqAgLSBE
byBzb21lIERPRSBzdHVmZiB0byBtYW5hZ2UvdmFsaWRhdGUgVERTSVAvZXRjDQo+Pj4NCj4+PiBT
byB3ZSBoYXZlIGludGVyYWN0aW9ucyBvZiB0aGluZ3MgY29udHJvbGxlZCBieSBQQ0ksIEtWTSwg
VkZJTywgYW5kDQo+Pj4gaW9tbXVmZCBhbGwgbXVzaGVkIHRvZ2V0aGVyLg0KPj4+DQo+Pj4gaW9t
bXVmZCBpcyB0aGUgb25seSBhcmVhIHRoYXQgYWxyZWFkeSBoYXMgYSBoYW5kbGUgdG8gYWxsIHRo
ZSByZXF1aXJlZA0KPj4+IG9iamVjdHM6DQo+Pj4gwqAgLSBUaGUgcGh5c2ljYWwgUENJIGZ1bmN0
aW9uDQo+Pj4gwqAgLSBUaGUgQ0MgdklPTU1VIG9iamVjdA0KPj4+IMKgIC0gVGhlIEtWTSBGRA0K
Pj4+IMKgIC0gVGhlIENDIHZQQ0kgb2JqZWN0DQo+Pj4NCj4+PiBXaGljaCBpcyB3aHkgSSBoYXZl
IGJlZW4gdGhpbmtpbmcgaXQgaXMgdGhlIHJpZ2h0IHBsYWNlIHRvIG1hbmFnZQ0KPj4+IHRoaXMu
DQo+Pj4NCj4+PiBJdCBkb2Vzbid0IG1lYW4gdGhhdCBpb21tdWZkIGlzIHN1ZGRlbmx5IGRvaW5n
IFBDSSBzdHVmZiwgbm8sIHRoYXQNCj4+PiBzdGF5cyBpbiBWRklPLg0KPj4+DQo+Pj4+Pj4gU28g
eW91ciBpc3N1ZSBpcyB5b3UgbmVlZCB0byBzaG9vdCBkb3duIHRoZSBkbWFidWYgZHVyaW5nIHZQ
Q0kNCj4+Pj4+PiBkZXZpY2UgZGVzdHJ1Y3Rpb24/DQo+Pj4+Pg0KPj4+Pj4gSSBhc3N1bWUgInZQ
Q0kgZGV2aWNlIiByZWZlcnMgdG8gYXNzaWduZWQgZGV2aWNlIGluIGJvdGggc2hhcmVkDQo+Pj4+
PiBtb2RlICYgcHJ2YXRlIG1vZGUuIFNvIG5vLCBJIG5lZWQgdG8gc2hvb3QgZG93biB0aGUgZG1h
YnVmIGR1cmluZw0KPj4+Pj4gVFNNIHVuYmluZCwgYS5rLmEuIHdoZW4gYXNzaWduZWQgZGV2aWNl
IGlzIGNvbnZlcnRpbmcgZnJvbQ0KPj4+Pj4gcHJpdmF0ZSB0byBzaGFyZWQuIFRoZW4gcmVjb3Zl
ciB0aGUgZG1hYnVmIGFmdGVyIFRTTSB1bmJpbmQuIFRoZQ0KPj4+Pj4gZGV2aWNlIGNvdWxkIHN0
aWxsIHdvcmsgaW4gVk0gaW4gc2hhcmVkIG1vZGUuDQo+Pj4NCj4+PiBXaGF0IGFyZSB5b3UgdHJ5
aW5nIHRvIHByb3RlY3Qgd2l0aCB0aGlzPyBJcyB0aGVyZSBzb21lIGludGVsaXNtIHdoZXJlDQo+
Pj4geW91IGNhbid0IGhhdmUgcmVmZXJlbmNlcyB0byBlbmNyeXB0ZWQgTU1JTyBwYWdlcz8NCj4+
Pg0KPj4NCj4+IEkgdGhpbmsgaXQgaXMgYSBtYXR0ZXIgb2YgZGVzaWduIGNob2ljZS4gVGhlIGVu
Y3J5cHRlZCBNTUlPIHBhZ2UgaXMNCj4+IHJlbGF0ZWQgdG8gdGhlIFRESSBjb250ZXh0IGFuZCBz
ZWN1cmUgc2Vjb25kIGxldmVsIHRyYW5zbGF0aW9uIHRhYmxlDQo+PiAoUy1FUFQpLiBhbmQgUy1F
UFQgaXMgcmVsYXRlZCB0byB0aGUgY29uZmlkZW50aWFsIFZNJ3MgY29udGV4dC4NCj4+DQo+PiBB
TUQgYW5kIEFSTSBoYXZlIGFub3RoZXIgbGV2ZWwgb2YgSFcgY29udHJvbCwgdG9nZXRoZXINCj4+
IHdpdGggYSBUU00tb3duZWQgbWV0YSB0YWJsZSwgY2FuIHNpbXBseSBtYXNrIG91dCB0aGUgYWNj
ZXNzIHRvIHRob3NlDQo+PiBlbmNyeXB0ZWQgTU1JTyBwYWdlcy4gVGh1cywgdGhlIGxpZmUgY3lj
bGUgb2YgdGhlIGVuY3J5cHRlZCBtYXBwaW5ncyBpbg0KPj4gdGhlIHNlY29uZCBsZXZlbCB0cmFu
c2xhdGlvbiB0YWJsZSBjYW4gYmUgZGUtY291cGxlZCBmcm9tIHRoZSBUREkNCj4+IHVuYm91bmQu
IFRoZXkgY2FuIGJlIHJlYXBlZCB1bi1oYXJtZnVsbHkgbGF0ZXIgYnkgaHlwZXJ2aXNvciBpbiBh
bm90aGVyDQo+PiBwYXRoLg0KPj4NCj4+IFdoaWxlIG9uIEludGVsIHBsYXRmb3JtLCBpdCBkb2Vz
bid0IGhhdmUgdGhhdCBhZGRpdGlvbmFsIGxldmVsIG9mDQo+PiBIVyBjb250cm9sIGJ5IGRlc2ln
bi4gVGh1cywgdGhlIGNsZWFudXAgb2YgZW5jcnlwdGVkIE1NSU8gcGFnZSBtYXBwaW5nDQo+PiBp
biB0aGUgUy1FUFQgaGFzIHRvIGJlIGNvdXBsZWQgdGlnaHRseSB3aXRoIFRESSBjb250ZXh0IGRl
c3RydWN0aW9uIGluDQo+PiB0aGUgVERJIHVuYmluZCBwcm9jZXNzLg0KPj4NCj4+IElmIHRoZSBU
REkgdW5iaW5kIGlzIHRyaWdnZXJlZCBpbiBWRklPL0lPTU1VRkQsIHRoZXJlIGhhcyBiZSBhDQo+
PiBjcm9zcy1tb2R1bGUgbm90aWZpY2F0aW9uIHRvIEtWTSB0byBkbyBjbGVhbnVwIGluIHRoZSBT
LUVQVC4NCj4gDQo+IFFFTVUgc2hvdWxkIGtub3cgYWJvdXQgdGhpcyB1bmJpbmQgYW5kIGNhbiB0
ZWxsIEtWTSBhYm91dCBpdCB0b28uIE5vIA0KPiBjcm9zcyBtb2R1bGUgbm90aWZpY2F0aW9uIG5l
ZWRlZCwgaXQgaXMgbm90IGEgaG90IHBhdGguDQo+IA0KDQpZZXMuIFFFTVUga25vd3MgYWxtb3N0
IGV2ZXJ5dGhpbmcgaW1wb3J0YW50LCBpdCBjYW4gZG8gdGhlIHJlcXVpcmVkIGZsb3cgDQphbmQg
a2VybmVsIGNhbiBlbmZvcmNlIHRoZSByZXF1aXJlbWVudHMuIFRoZXJlIHNob3VsZG4ndCBiZSBw
cm9ibGVtIGF0IA0KcnVudGltZS4NCg0KQnV0IGlmIFFFTVUgY3Jhc2hlcywgd2hhdCBhcmUgbGVm
dCB0aGVyZSBhcmUgb25seSBmZCBjbG9zaW5nIHBhdGhzIGFuZCANCm9iamVjdHMgdGhhdCBmZHMg
cmVwcmVzZW50IGluIHRoZSBrZXJuZWwuIFRoZSBtb2R1bGVzIHRob3NlIGZkcyBiZWxvbmdzIA0K
bmVlZCB0byBzb2x2ZSB0aGUgZGVwZW5kZW5jaWVzIG9mIHRlYXJpbmcgZG93biBvYmplY3RzIHdp
dGhvdXQgdGhlIGhlbHAgDQpvZiBRRU1VLg0KDQpUaGVyZSB3aWxsIGJlIHByaXZhdGUgTU1JTyBk
bWFidWYgZmRzLCBWRklPIGZkcywgSU9NTVUgZGV2aWNlIGZkLCBLVk0NCmZkcyBhdCB0aGF0IHRp
bWUuIFdobyBzaG91bGQgdHJpZ2dlciB0aGUgVERJIHVuYmluZCBhdCB0aGlzIHRpbWU/DQoNCkkg
dGhpbmsgaXQgc2hvdWxkIGJlIHRyaWdnZXJlZCBpbiB0aGUgdmRldmljZSB0ZWFyZG93biBwYXRo
IGluIElPTU1VZmQNCmZkIGNsb3NpbmcgcGF0aCwgYXMgaXQgaXMgd2hlcmUgdGhlIGJpbmQgaXMg
aW5pdGlhdGVkLg0KDQppb21tdWZkIHZkZXZpY2UgdGVhciBkb3duIChpb21tdSBmZCBjbG9zaW5n
IHBhdGgpDQogICAgIC0tLS0+IHRzbV90ZGlfdW5iaW5kDQogICAgICAgICAtLS0tPiBpbnRlbF90
c21fdGRpX3VuYmluZA0KICAgICAgICAgICAgIC4uLg0KICAgICAgICAgICAgIC0tLS0+IHByaXZh
dGUgTU1JTyB1bi1tYXBpbmcgaW4gS1ZNDQogICAgICAgICAgICAgICAgIC0tLS0+IGNsZWFudXAg
cHJpdmF0ZSBNTUlPIG1hcHBpbmcgaW4gUy1FUFQgYW5kIG90aGVycw0KICAgICAgICAgICAgICAg
ICAtLS0tPiBzaWduYWwgTU1JTyBkbWFidWYgY2FuIGJlIHNhZmVseSByZW1vdmVkLg0KICAgICAg
ICAgICAgICAgICAgICAgICAgXlRWTSB0ZWFyZG93biBwYXRoIChkbWFidWYgdW5pbnN0YWxsIHBh
dGgpIGNoZWNrcw0KICAgICAgICAgICAgICAgICAgICAgICAgdGhpcyBzdGF0ZSBhbmQgd2FpdCBi
ZWZvcmUgaXQgY2FuIGRlY3JlYXNlIHRoZQ0KICAgICAgICAgICAgICAgICAgICAgICAgZG1hYnVm
IGZkIHJlZmNvdW50DQogICAgICAgICAgICAgLi4uDQogICAgICAgICAtLS0tPiBLVk0gVFZNIGZk
IHB1dA0KICAgICAtLS0tPiBjb250aW51ZSBpb21tdWZkIHZkZXZpY2UgdGVhcmRvd24uDQoNCkFs
c28sIEkgdGhpbmsgd2UgbmVlZDoNCg0KaW9tbXVmZCB2ZGV2aWNlIFRTTSBiaW5kDQogICAgIC0t
LT4gdHNtX3RkaV9iaW5kDQogICAgICAgICAtLS0tPiBpbnRlbF90c21fdGRpX2JpbmQNCiAgICAg
ICAgICAgICAuLi4NCiAgICAgICAgICAgICAtLS0tPiBLVk0gVFZNIGZkIGdldA0KICAgICAgICAg
ICAgIC4uLg0KDQpaLg0KDQo+IA0KPj4gU28gc2hvb3RpbmcgZG93biB0aGUgRE1BQlVGIG9iamVj
dCAoZW5jcnlwdGVkIE1NSU8gcGFnZSkgbWVhbnMgc2hvb3RpbmcNCj4+IGRvd24gdGhlIFMtRVBU
IG1hcHBpbmcgYW5kIHJlY292ZXJpbmcgdGhlIERNQUJVRiBvYmplY3QgbWVhbnMNCj4+IHJlLWNv
bnN0cnVjdCB0aGUgbm9uLWVuY3J5cHRlZCBNTUlPIG1hcHBpbmcgaW4gdGhlIEVQVCBhZnRlciB0
aGUgVERJIGlzDQo+PiB1bmJvdW5kLg0KPiANCj4gVGhpcyBpcyBkZWZpbml0ZWx5IFFFTVUncyBq
b2IgdG8gcmUtbW1hcCBNTUlPIHRvIHRoZSB1c2Vyc3BhY2UgKGFzIGl0IA0KPiBkb2VzIGZvciBu
b24tdHJ1c3RlZCBkZXZpY2VzIHRvZGF5KSBzbyBsYXRlciBvbiBuZXN0ZWQgcGFnZSBmYXVsdCBj
b3VsZCANCj4gZmlsbCB0aGUgbmVzdGVkIFBURS4gVGhhbmtzLA0KPiANCj4gDQo+Pg0KPj4gWi4N
Cj4+DQo+Pj4+PiBXaGF0IEkgcmVhbGx5IHdhbnQgaXMsIG9uZSBTVyBjb21wb25lbnQgdG8gbWFu
YWdlIE1NSU8gZG1hYnVmLA0KPj4+Pj4gc2VjdXJlIGlvbW11ICYgVFNNIGJpbmQvdW5iaW5kLiBT
byBlYXNpZXIgY29vcmRpbmF0ZSB0aGVzZSAzDQo+Pj4+PiBvcGVyYXRpb25zIGNhdXNlIHRoZXNl
IG9wcyBhcmUgaW50ZXJjb25uZWN0ZWQgYWNjb3JkaW5nIHRvIHNlY3VyZQ0KPj4+Pj4gZmlybXdh
cmUncyByZXF1aXJlbWVudC4NCj4+Pj4NCj4+Pj4gVGhpcyBTVyBjb21wb25lbnQgaXMgUUVNVS4g
SXQga25vd3MgYWJvdXQgRkxScyBhbmQgb3RoZXIgY29uZmlnDQo+Pj4+IHNwYWNlIHRoaW5ncywg
aXQgY2FuIGRlc3Ryb3kgYWxsIHRoZXNlIElPTU1VRkQgb2JqZWN0cyBhbmQgdGFsayB0bw0KPj4+
PiBWRklPIHRvbywgSSd2ZSB0cmllZCwgc28gZmFyIGl0IGlzIGxvb2tpbmcgZWFzaWVyIHRvIG1h
bmFnZS4gVGhhbmtzLA0KPj4+DQo+Pj4gWWVzLCBxZW11IHNob3VsZCBiZSBzZXF1ZW5jaW5nIHRo
aXMuIFRoZSBrZXJuZWwgb25seSBuZWVkcyB0byBlbmZvcmNlDQo+Pj4gYW55IHJ1bGVzIHJlcXVp
cmVkIHRvIGtlZXAgdGhlIHN5c3RlbSBmcm9tIGNyYXNoaW5nLg0KPj4+DQo+Pj4gSmFzb24NCj4+
Pg0KPj4NCj4gDQoNCg==
