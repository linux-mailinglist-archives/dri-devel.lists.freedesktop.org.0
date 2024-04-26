Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35A88B4049
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 21:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA50911A9BF;
	Fri, 26 Apr 2024 19:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sVbFVJJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C341111A9BF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 19:47:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdwglIwDE41fUHUcev/3gPEM8Cedj6dRPoMlq1EJlimuC+bnT42kbxEzcsGcydS1zdqcIPEDThnpESCQKbQk2xZ4rGYwXh3/3N/ELZpu2J6AxlllAuCc37R9Uz1CX/U+/VaUuNzNDWAG6Sqr8x0yjFvPhNq5Ge2xaR0wlfEdDDPq+tn91oG/8JTAECHWLZwoh5h7d9LrZ7Oc3BSpvT/GTAi6enyWDVeE1FD2H0x5MOMipB7AmimahAM2MRFQarAjI/OrDm2pi4QWrf90qOk0HJeR2vv96XGt0k2IZhK/Ks+WmRejA9o2cAGVfx9Famv1H1pu8+oZWM3EJd6Tq8TXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkOW1V3iK6j4Kuu0DyZjJF4exk+mpf8vXqyb+Qwkeq8=;
 b=i+YoCo2EF64mjeA/eFFq6FH/CPiZzCC5B9SinW64s8eQ4dgS62QdKjcqWGS/9rrwGlw2ZCVibssFvPuKWVuoRg/jgrtq6RruOUsUkgSZidL//8aB7bS0Unq/5bjFaNooMXeYUHrDq1+QfeZ0dfJs7aMeBtbaO5YzuTdUQB+DbltKn36887JKxTd0DOCGvookesGppzM1/G1fXqrJk8Mtkh1LNX52O1mAkbf6bf4QPxNKLuZXQTczQG5Ao6d+lNbuQJxBoNttpuC6oZlbXlB7wc+KL7Lwog6UN0ms3BA/ZYqAikfuyRh9UEp2yZj+X9sRvnK9F1uAamkPoUZ2ijHu0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkOW1V3iK6j4Kuu0DyZjJF4exk+mpf8vXqyb+Qwkeq8=;
 b=sVbFVJJMNAch0mCQx67bIZYLmD/yMpyNynnNjTWF7KD3pnD0QouFwTOpujCOxq5Ws/IWRfsrn+HGmRqQ/wQ2fLjusi/E5wlY44DKbzC74vPmOBpSOawFgodm6wQP0KMSdqwpGEIdP7RXLJLOqhrYYml15Cs94S2yUEEUyDGONvw=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by PH7PR12MB7869.namprd12.prod.outlook.com (2603:10b6:510:27e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 19:46:56 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7%4]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 19:46:56 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>
Subject: RE: [PATCH v2 2/2] drm: xlnx: zynqmp_dpsub: Fix compilation error
Thread-Topic: [PATCH v2 2/2] drm: xlnx: zynqmp_dpsub: Fix compilation error
Thread-Index: AQHal3ut/ICi/zy530OrmkuvCcEGsbF6GSKAgADcyrA=
Date: Fri, 26 Apr 2024 19:46:56 +0000
Message-ID: <MW4PR12MB716503F7F5668AF9B054C2DDE6162@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20240425-dp-live-fmt-fix-v2-0-6048e81211de@amd.com>
 <20240425-dp-live-fmt-fix-v2-2-6048e81211de@amd.com>
 <99218e32-bd37-49d8-bb90-b6ce9a6447ac@ideasonboard.com>
In-Reply-To: <99218e32-bd37-49d8-bb90-b6ce9a6447ac@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|PH7PR12MB7869:EE_
x-ms-office365-filtering-correlation-id: a189fa3e-b667-4a82-a300-08dc6629a174
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?SWJTLzM5eVdxNzZMb0RpSU1HM2h6QTVGVXhkZXlzaVhEUjhSOTJQbTRSL2Nn?=
 =?utf-8?B?ZGdDUHAvc3FZSGJucTc3ZUE1WjhWWGtYbnBXUzlVT1dwMVA4andOQXpZeElZ?=
 =?utf-8?B?MUZVMTRxSXZlbFdWVWQ1RHQ3aVB0NnIwTllVc2pJaDBqamI3eS9OeHFteUQz?=
 =?utf-8?B?Z0UrcGxTZkcvYlp6M3hqWm1qbm9wKzBUTFRoSi9KNmVqSEJHVG5BNkRJcmFU?=
 =?utf-8?B?cExzZ1YreU82SXJaK1RmY1Ntb2tkVURZZno3TmZRMW10U1BvRGtPS3BIemZo?=
 =?utf-8?B?bGVkR21CMjBhbWRNTTA5T0tKbUM5WjVSL1U3U01jeWZyeE5pYkNDMDBDdDNM?=
 =?utf-8?B?bmFZMzYzd2xIS05UV2hNNit4U1FzRzk0TXB5ekUvWC9vcmEyMlo3dXEzUDlv?=
 =?utf-8?B?a0VHcXFuRjlQYmJab0JjMk9IbzhKVlRVUFNzMDlLSWlMQlZSV0tWcHpLeWth?=
 =?utf-8?B?VHFWQ0NKTi9IWExvMWM0a3F3c0dqUlJBbmFDeG5WOFBxbHZMZnBHU0RNRFhO?=
 =?utf-8?B?U3hIaTI0Z0s1QzZFRTNyZ2QxRVpOTXR2RjgyVXoxcFJrZi9iMWE3V0l0QU9m?=
 =?utf-8?B?WVpjcGQzdSsyeXBGWnNPL3FXQ3QxUEduNHF5Wk5MZytxNmU3b3FaLzg3WDM3?=
 =?utf-8?B?SzFoZ0FLVzNpNXJlVC9tT1JNVDNtNk9oRjBhNEpTSGxkZklzNkZFN2N3WDZW?=
 =?utf-8?B?dHlqUXp4a21VdDFybGZyOUxpTXlMT0F3NlA1T21GbzdYZGRMQnU3anRpMW1l?=
 =?utf-8?B?MGhGRjhZNGVXZUh6SXV1Nlg2M1YxQVZVcXA1MWV1UXQxaUlEOTNFQlhYNXgr?=
 =?utf-8?B?M2xaaExXRlZuMitLTEY0NzJWbnlqMzRrZWFwMEF1WER3MHV2M0M4YkRFYUJs?=
 =?utf-8?B?L2dXN0JGK3NWcGMzYkFiVmNxbjVyVVhiT3ZFSVFaK05oWFdHRGROak5zK3Vw?=
 =?utf-8?B?MkFSZENCdkpxMmZmMVFWdkM0S1NjVkdFZmNwb1JHeU5MYmJNd3FaT3B6TUZx?=
 =?utf-8?B?R0puNExtU3JLL3VoOHA4QzhpUndaYWVYMmU4Qzd3UXVNdTlGM3F3alZ1dm0w?=
 =?utf-8?B?MlZmblgrTzNQVHZIc3Yvek41dklBbkcxL2FOYTAxT0lWSGpxZjJSdVRTNmcy?=
 =?utf-8?B?YmxpR2JYYmIwQTMrRzd4REFEQmFDMjRUOEo5SFBYMEhEOFp6ZGszTWplNFRR?=
 =?utf-8?B?dlRjWHB0eXhhaFIvUWxVRUZnZkVaclo3WlVFc1p4U2xuUXlyYVV1U2VKdTgv?=
 =?utf-8?B?a2NkeTVadnhlTTJlMU1QS1Axc3lVRzFKWWJpZHl2Z25QUlNnNnU4eGxpV29X?=
 =?utf-8?B?SEk0ckpscWx0OWtLR2k3Y05MUGsyeVlYNFBRSlZ5MUFNS0xZbEh4L2lyZWht?=
 =?utf-8?B?OVg5bHJDekF4UnlEWm9sM1dJMkNXMjN0blFxd003akJmRjB3M3UyMkp5REdS?=
 =?utf-8?B?c1R2dnZ4T3JZWnNaOTJWaEV2N1RwaC93THdyNElFSE5DbHdlaXFpNXQ3eDBD?=
 =?utf-8?B?SXNVRHI0Z2ZNMExwa0twcFZlSjN1YWNDUUZoMUNMa2NtdTJiWm8xeFV5NnJm?=
 =?utf-8?B?cTJBK0dMVkQ3R2hscEZ4Qjg4SW8yUXdsVUFkL3FJQTlQRUk5cWl0SkV2OG9L?=
 =?utf-8?B?bk1rZDFxYkN5UmJoZGZhRWZERjdiZzluMXRSc3FzRmtWZ2lpRWxKQ0djei9Z?=
 =?utf-8?B?eUxnM2h4K1VwMTI5bmdvWXJvaXFNTVVKQUp6UHpkWWFPT0tqTzJkTndvWjdp?=
 =?utf-8?B?TVJjRHNjYkdhN3MyVnorNlFRTlZybnh1ZjRvR0dWakFxOStONzFXLzQrQXJS?=
 =?utf-8?B?ZEFud3ArWWtrdUlSdmQrZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzE5WUxBd0M2bGVzVEx0YzBucXQxTWZDemlqUlRtNlZiK2RuSEl1cC9kUGI0?=
 =?utf-8?B?L0V2MEcxV2t4M0gxVFFRUFRpVW1TcDFFU01WWENwZkxLY2JyK0pxQ2wxa2NT?=
 =?utf-8?B?MmJvTWlpVTNqdVc3bEtnejlWZDI3M05TaXFhU3cxKytIWUFaOWlzWlMweXVB?=
 =?utf-8?B?VUlQcU1GZ2grRVpWcEd5SHFTTUxtYXQxRjNRb0d6akd3ODZZZkRiL0FZeDdy?=
 =?utf-8?B?ZnQzNXF5b1RoOXo4aGxUQUIrQmJaSVhlVG82SE82NVF4V3NqREdHOXJpRjZH?=
 =?utf-8?B?YmdqTEpGUi82MVpVZ2taVWw2NXhSeXZGQUxkN0dWaDJMRnN5Q1d4OXNPZzNK?=
 =?utf-8?B?bjBjdWlhUCtNQVhuSEgxcEM2OWkzRWhrdDFQTk10WlkyRGU5Q2RadUYrVUN2?=
 =?utf-8?B?K1B2N1lUdUExT0EwbmY4MWtPTjBxZ1RDNE1wQ2wyY0t2aDRDMHQ4Zkg4Yjlk?=
 =?utf-8?B?OGliTktUYmRKNDBiejJNZDZHaHJnTEJiRlI3VnU0c3p1bWY2U3V1dWJ6eEwz?=
 =?utf-8?B?enN2cGwwWGhQbUszL1RsNk9XT2Iwcy9HbEtMSU1pT1U0L0Rhejl6c1VVRUVY?=
 =?utf-8?B?VzkrdFVkVy9Ib1ZWUTFqc0QvQk55ZXg3VjlGdkR0eGRQTURWMXRpMWRxY09Y?=
 =?utf-8?B?RHplcXlIVTMxU2x2NGtRcG94SWFRS2c2T3Y2SG5mOStKcDc2Y0xVZ2haRE1B?=
 =?utf-8?B?Tm1GMi9CL21tci9FRzcyRERhNnhUL1dqUWh0Z3ZQSGFmNFFuc09yeDBFNmtu?=
 =?utf-8?B?YjIwaUlFWStRMWJCOUd3Y1o2NzBtVEtQZC9IWmVHOFd1WGY1cHFtRUxBb0NX?=
 =?utf-8?B?b1kwdzQvYzRGbjBVK0FJdVFGUzJ4MVhNNnltL2ZKQTIyUGRNNU5LSERrTThQ?=
 =?utf-8?B?bEdMWkpVSk5oSG9pTW03M0tiZGpNSUZvYzVMR3h6MEdPV1NXZkhKaFJ1RXhS?=
 =?utf-8?B?UXorYlRUMFZvYThTdXR4U1UwckpIeEQ5R1VnY3JlT25YQ1JMSGdJWDNOdVhM?=
 =?utf-8?B?Ni9ZNFdsMlZUZDlzMm9uZ2xwMXVHUWlid3lBbm1veExtQ0g5MDQ2Q2NUMEs4?=
 =?utf-8?B?RFpUMHArL3B0MUJRczlzSXRORTNycUhtQVBPazNmUHF4ME42Vm9PNGRhNlIx?=
 =?utf-8?B?WWlXNy8zS2RZdE1jekVmSEQwYmZzWHRMYk1KbTlxa1dzbmh6cnh5dTRvNk1M?=
 =?utf-8?B?Z3d6QXp3ZE5CVXVCTmVKd3RGcWcrVjFsSTFoZnhqa0xPM01XMmVjcDBocnBR?=
 =?utf-8?B?S0pqMWt5bFFjRUEra3pIVFEyVjI5QjhWZkZ3eThqR3NsSS96OW4yNFlPRDd2?=
 =?utf-8?B?eTIwc3lLWmtXdFpYejR5OWNVRWFvS01BZ3BBR1k5T0NzUndOMTFiMlZmUWNi?=
 =?utf-8?B?T2M1aHEzWmZHSU1SaGR5TlRReThzaGtSRU4veU5UeEdINXFlQVZCTDZyd0gr?=
 =?utf-8?B?dmNMZG1JMTNQZzVrUFdmZGFpVzlaWi9kT25IdmFrY1RDeU16T3pySGMwL1Bt?=
 =?utf-8?B?RkFqQk4zQTJ4Skk1dkUvbHVXZzJhd0JuNzlaSHY5T1RnN1NjYXlXYjB3V0xw?=
 =?utf-8?B?OTNBc0licHRJZFZLT0dQM3VwdWpKUFhkYyt1WDdGVnNpaXRVS1d0M1hmeW5O?=
 =?utf-8?B?bUUwTDFLQzNnLzY5cnFNV3VJVXg2aGxJbThMY2luUHh1YTNkODFhMnp3aE15?=
 =?utf-8?B?NUlnMC9QZVdNelp5L3ZBSjh1RkxteW45clNPR0hIKzFIRFpUZGtlRlcvMkd0?=
 =?utf-8?B?eTd5T0FQT3NNdDY0MUh2YmdCa1ZLOXdsL0t5bWhXWGJ6RXg5YnBzcHYybEF2?=
 =?utf-8?B?cUZCSUtkMDgzc1JZSE9xZzVQaENqNUVjcDlodU9XUmZjd3pHOTJPTy9GWVBW?=
 =?utf-8?B?dmY2RzB5dGdodG8xOHF3Mm10NWNnZmJZN08rMzJSbytKVkJhWVZGbk5KeVhT?=
 =?utf-8?B?L0JkaUtZWmFOUml2N01DaUJ1dVc1c1QrR2k4bjRpbjNpUzVzZFhpUStueDF5?=
 =?utf-8?B?ZjFxVkZ6dkF2NjFlZXNOQ0d1TS9BTzlrTUdqU3RrVlJsbUNhUFcyK0p6azA3?=
 =?utf-8?B?R2xuT2p0SXVxNFlMcEE4RnlPdEZRNTVYc29wZ1IvZVdpMnIvYmoxRXRkSFhS?=
 =?utf-8?Q?p7NY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a189fa3e-b667-4a82-a300-08dc6629a174
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 19:46:56.7909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: itoKFyhObY7hkwHnBEMSX5cBY6wp+gZuY2BJnfWjmxCfoWWTFWsCDtlyKtgxZD1zZEldHDM/d7dfY1Bn5J2BGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7869
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9taSBWYWxrZWluZW4g
PHRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJp
bCAyNSwgMjAyNCAxMTozNiBQTQ0KPiBUbzogS2x5bWVua28sIEFuYXRvbGl5IDxBbmF0b2xpeS5L
bHltZW5rb0BhbWQuY29tPg0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT47IExhdXJlbnQN
Cj4gUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT47IE1hYXJ0ZW4g
TGFua2hvcnN0DQo+IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUg
UmlwYXJkDQo+IDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT47DQo+IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ow0KPiBTaW1laywgTWljaGFsIDxtaWNoYWwuc2lt
ZWtAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIGRybTogeGxueDogenlu
cW1wX2Rwc3ViOiBGaXggY29tcGlsYXRpb24NCj4gZXJyb3INCj4gDQo+IENhdXRpb246IFRoaXMg
bWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyDQo+
IGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVz
cG9uZGluZy4NCj4gDQo+IA0KPiBPbiAyNi8wNC8yMDI0IDA0OjQ2LCBBbmF0b2xpeSBLbHltZW5r
byB3cm90ZToNCj4gPiBGaXggVz0xIGNsYW5nIDE5IGNvbXBpbGF0aW9uIGVycm9yIGluDQo+IHp5
bnFtcF9kaXNwX2xheWVyX2RybV9mb3JtYXRzKCkuDQo+ID4NCj4gPiBSZXBvcnRlZC1ieToga2Vy
bmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+ID4gQ2xvc2VzOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjQwNDI2MDk0Ni40b1pYdkhEMi0NCj4gbGtwQGlu
dGVsLmNvbS8NCj4gPiAtLS0NCj4gDQo+IFRoaXMgaXMgbWlzc2luZyB5b3VyIHNpZ25lZC1vZmYt
YnkuDQo+IA0KPiAgIFRvbWkNCg0KVGhhbmsgeW91IQ0KDQo+IA0KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL3hsbngvenlucW1wX2Rpc3AuYyB8IDIgKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5x
bXBfZGlzcC5jDQo+ID4gaW5kZXggNDIzZjVmNDk0M2NjLi5jOWZiNDMyZDRjYmQgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3AuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMNCj4gPiBAQCAtOTgxLDcgKzk4MSw3IEBA
IHUzMiAqenlucW1wX2Rpc3BfbGF5ZXJfZHJtX2Zvcm1hdHMoc3RydWN0DQo+IHp5bnFtcF9kaXNw
X2xheWVyICpsYXllciwNCj4gPiAgICAgICB1bnNpZ25lZCBpbnQgaTsNCj4gPiAgICAgICB1MzIg
KmZvcm1hdHM7DQo+ID4NCj4gPiAtICAgICBpZiAoV0FSTl9PTighbGF5ZXItPm1vZGUgPT0gWllO
UU1QX0RQU1VCX0xBWUVSX05PTkxJVkUpKSB7DQo+ID4gKyAgICAgaWYgKFdBUk5fT04obGF5ZXIt
Pm1vZGUgIT0gWllOUU1QX0RQU1VCX0xBWUVSX05PTkxJVkUpKSB7DQo+ID4gICAgICAgICAgICAg
ICAqbnVtX2Zvcm1hdHMgPSAwOw0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+ID4g
ICAgICAgfQ0KPiA+DQoNCg==
