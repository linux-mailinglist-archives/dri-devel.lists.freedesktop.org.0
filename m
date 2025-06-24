Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C68DAE6F50
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 21:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906D610E120;
	Tue, 24 Jun 2025 19:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B04A1y9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E6810E0FC;
 Tue, 24 Jun 2025 19:13:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6bnQDrMNqg9NlrDtYPwZhMD6bbCE8Oi+X3HeNY7fD3FDElkk1Vmi0X5TOYzdt8KajDdgoEWjUMs/qgk1r7RSlNLHr1TFhi3LZrCrWr/pMYI+WSWO0p7YpmhBApMwiohr9izUGaKu9F66wEg2BHqulzIQcgEMQ+fc5arRcDFsulLigJ0FdFjK/KEX6BOJDQ0dAi4+Zp3m+f4Ie9d5v0FfXjwSKSo2zdF91prUTytj5CKjYjpyVYvUe5sX8IihB2x8mcWx8u7rXVOnHj3nnWrWIeqLOaGlAJc5LQcaoH1xHu6Cb0fcGRPIkrd/fk2j/FD/OuDCHzKAybL7f7Uee3vhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9F4xtwR1OVj6e7kZ2ZDYfSoUcSkYBT75IYacWkonRQ8=;
 b=eQi2teOp6PObaiOpdKRUvHl0lxEYtwuP7NRNYCdMT4ukZi9l2z6TJQfC4Zm/+ZiUGYRDFyaMvG/tfp3DO/Bcz9h6qbAxuukE1PRFGuRJZMtiBpmmlYLM0A2gilbJvGOeHYNY2T5KtJphUBl9C3mh0f16XZuk7F28otXhkxdwtf74UK33c04vS5i47UsdJrx1cM5HGtLvmLgT7l1n5DoWXM5S1dDvfpvfSDCS3MlSGPfd/3wfuQVcjO64dJsCmkkXZtgYKrQGnSWm5t/RGLEjp+lhJUFoVhL4lei514B7lcffkxH2cmvtPGKZgxLcMA9g+X1egb4UwZVqq1NAAmVMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9F4xtwR1OVj6e7kZ2ZDYfSoUcSkYBT75IYacWkonRQ8=;
 b=B04A1y9TSYXHICVYTtL6pHTmtptE9pDnKv/V0ewa5njQlspplIGcXvdYBQtNAkXGFL3AVWvfa8St/Hl6AS0aVQablSytgl4qqMd63lATOx8hvH/hXh3dO9+sqmDeFBsrlAu9z0NsMtOhT1Qr4hkXeEiG6Xg5dl1ISA9Qsa9rm0IFkgqFRIDHm0oBUqIaFXhl+NBhkpZLk5m3pEg5uBL16fpFKfYs2qEuUNkoE+vr2H/03VOcYfBfGeeJ5GUeQLkChvmrA7gMjSotodZ1fk2Qh9JULVXSMuSqtH4lmZdAkqJeuhw12FY7ZF0O7/x43OUXGWfabir4WHMZlb4bx+YbYw==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by IA4PR12MB9764.namprd12.prod.outlook.com (2603:10b6:208:5d0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.36; Tue, 24 Jun
 2025 19:13:37 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8857.020; Tue, 24 Jun 2025
 19:13:37 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "mhenning@darkrefraction.com" <mhenning@darkrefraction.com>
CC: "kherbst@redhat.com" <kherbst@redhat.com>, "martin.peres@free.fr"
 <martin.peres@free.fr>, "faith.ekstrand@collabora.com"
 <faith.ekstrand@collabora.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Remove nvkm_gsp_fwif.enable
Thread-Topic: [PATCH 2/2] drm/nouveau: Remove nvkm_gsp_fwif.enable
Thread-Index: AQHb5IuPm2cMLQy/UkmBXqiNS1jtOLQSkbkAgAAaEwCAAANHAA==
Date: Tue, 24 Jun 2025 19:13:37 +0000
Message-ID: <127e866b4bb4fd3a77e1cbfc5b709bcb2533c744.camel@nvidia.com>
References: <20250623220909.7591-1-mhenning@darkrefraction.com>
 <20250623220909.7591-3-mhenning@darkrefraction.com>
 <c3902fcf8bc963cf315e9bfbb9ca4c66e28857cf.camel@nvidia.com>
 <CAAgWFh05pj_9rk7Wcx24tFWR2sgMZH4WtBsm3hYrqM3svwniOQ@mail.gmail.com>
In-Reply-To: <CAAgWFh05pj_9rk7Wcx24tFWR2sgMZH4WtBsm3hYrqM3svwniOQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|IA4PR12MB9764:EE_
x-ms-office365-filtering-correlation-id: 62e46129-80b2-4be9-a01d-08ddb35338d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?K3RyQU4vV1czejZrSFNKMEZYdnM1ZlRWaVRReHE1Q1A5OGFPZXd2dEMxaWxa?=
 =?utf-8?B?M1JtOHNodjUyV0xnbEhDMzZNUGczanhybmFqNTh3NENPaGRuR21mRXNVNFBY?=
 =?utf-8?B?eURmM2xCTVQ0YnhpT2cxbGFKMEhQRDh1a0cvcEdKUEhuOFhFMzZ0V3EzQzNo?=
 =?utf-8?B?blFVOVZUenFkRlhyMEQwQ25uZldJamIybC9JakpvTUw4RVcxYXhTK3hUNHU2?=
 =?utf-8?B?SXNUcFVNd09WZ0JCRFlsRnA0aGNxWWVmK1FjaTNDZEp5Ry9qaHVhcFlGMWRm?=
 =?utf-8?B?cmU1c2lGTHFRYno0ZWNmRVlvMTEraHNnbmppeWlxbEJscCt4NHYyTlpITXNm?=
 =?utf-8?B?cWhCOEVnbVZ2N0RYZEI1RTkyMER4QVZHUVcxM2RtZVJpby9ubE5vN25EaGdR?=
 =?utf-8?B?TWo2NzVzOUpLZGY0anZIb1ZzaTdKVDRCc2ZZcmpXeXAzckRENmNVVnZwR1pL?=
 =?utf-8?B?ZEdQa0t5WGs1Y29tYVNYQUtrc0RyQlJySkYxcEZDdm5hNFI5U0F4cXpHbmlJ?=
 =?utf-8?B?RnN4dGY4SXJoTFI4b1FINjgyMnhqUExDNWdSVGkrVU9TWFN2SkFNcndVeHJh?=
 =?utf-8?B?d015azQ2b2liUHNYUnN2NDZGTW1uOW02ckt2akFjMWdXdm8zRlhUNEVERFVX?=
 =?utf-8?B?RzF0NFVodVgrZllJR2FYWnJ0R3MyOElQQ2ZnNnZwWk5OWm0wVmg1a1o1ckRY?=
 =?utf-8?B?R3p6SGkwRXREMFE0QU01S1lpcEVMRnJsOFZZWWl3VGt6ckRySWhhV2pmam5l?=
 =?utf-8?B?TG1pRksybElpQlo0QnZQaExOdFI4dVhCWDRkQUZ1cHNVSk8xakk2bTUxZG50?=
 =?utf-8?B?U0I5MnRmdHpwVzJ1K0Q2VG85M3lQbnNDTURvOWVjSVo0Z1NSTzVxQjdWbmRx?=
 =?utf-8?B?ZVYwUjlsaG15aXZ6NmVRR3hMVlJnemxaRTNQVzhWYWR1d2oxSXM3bG5MTnNK?=
 =?utf-8?B?cUxSMDVJSGNUUVdKNjNpVEVwQmJCZzhyZW5qL0ZPTjMxclVMNkhLSXFveVB3?=
 =?utf-8?B?amp0YnlHbmREV2Q3alhWZnhPbnZPeVRpNk1nUVdveUxUcWdRNXhTa2kwT3N1?=
 =?utf-8?B?YjdKZnFDRm9BRkVwWC9Hb3pCejBqZm80amE4NWt3anVKMlNCMDEyU1ZuNVU2?=
 =?utf-8?B?MEdLcDZTS1RHbmlDMFZRalFkVzhCSmNDS3ErNkdIQVVYSEE3VzdicEd5Tm04?=
 =?utf-8?B?WmgrNk53cnkwNGJSWHdNRklueVJlZFFsQ0UxSVE0YW1OakluRDBlakpIaVI0?=
 =?utf-8?B?dkVDUFd6a3YwdEUxSWRFMk5OL280c0psZFl5NGtKSWw4OTZNTGRYOUJkekF0?=
 =?utf-8?B?THlxbTJvd05nN2c2M1pXVEpEZFVBVmN3UTh1cEx6Qk81dW01dG9JRnpYeGt5?=
 =?utf-8?B?Z0tGQlVZZ1NadzVINW5lbWZobkp5emtZQXc2VnYxME1zSW5xbWVnNDY3R3pJ?=
 =?utf-8?B?UzhlcHJOZ015M01DQ2REZDEydDJ4R3lXRnR1SC9kMGNxb1YvNmFPSWQrYVN4?=
 =?utf-8?B?QlVTZ2NkUjlPQjdGQzVzbjdzTHdRMzA3MG5PbSs5am9Wb2hGWGR3QXd5OGtO?=
 =?utf-8?B?TzZvREhaUzFmdlRJZ3VCOHJvQmE2a2VzMmxldlhUY2xvRFhlb1U5eitzK0J3?=
 =?utf-8?B?OUVpTXJsakszOWVFMGhGR3ZMVE5PMjNJbXFwN3lxUElRWTVRL1hnZnVpZlBY?=
 =?utf-8?B?K091RzY5YzhpdEN6QTZmc2RNZHk5OXAzVk9xaDlVOTFvY0RVVG16Mkl5MkFn?=
 =?utf-8?B?SVVISFh5QjFRYTVSOE9VOEdGaGhSL05PS3F6Um9wTVdaU0FWdVJza1FZOUxk?=
 =?utf-8?B?MmtrOXNqbDJtS1NOUjNnSCtFMkQyV3RESXdYditKMHlFSjNtcjhvSXVRZmZF?=
 =?utf-8?B?MVRLUWV6Y2t1d0ZUWnhsamE2a21vbTRpUHBNczI1RW4yc3N1cGFCVDRFZk5V?=
 =?utf-8?B?VWRXR2dhYVlQd0JNaURCMjhUK3FqdG5xblJ5b0pWQWRNa2ZJdmhwVkxyK3dZ?=
 =?utf-8?B?bHJQT1pzRW9tbUpTUEQzbk1Rb3h3Zi8vWENrQlJBRzdQZ2NrOXc1UzRia2ZP?=
 =?utf-8?Q?jo8M3W?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjRudmhhUnJZWFYrRTkvdm1GTUgvdDlYRzNUNHNsQlNsbEZyRkJnSmd5RmpZ?=
 =?utf-8?B?dFR2K1oyYzdNQ2NIN3VYeHV0bmFObVZSZEtvR3ZDZFNETlUvNjlhQm1xNlE1?=
 =?utf-8?B?QmZqWjhLUVh1dm91d1R5SWtQV3p6Q01GZFNwVG1vVzZ1b01FbzZlc3dQMDlM?=
 =?utf-8?B?L2FNdkNGNUxHTTFjY1ZTcXRPSnhCQVJDUTBjajlYN0ZQK01OUjZGaHRaOGZl?=
 =?utf-8?B?S08zNjE0TDg3SUZUSXJBam5KVFlqdWVaK2kwZEdHZ3hod3Rxcmg4QXJGTm5U?=
 =?utf-8?B?Y0toWGFWKzV1dE1mU1FQVm1USDh3Z3N2SUJUWXZqSGF0dkFpcmIrMFRPa0Mv?=
 =?utf-8?B?cU9JdlI4SkZhTzMxeVlmRythTktsNnRHckxSYTBVbFhWOEUvWCt4TGQxYnpZ?=
 =?utf-8?B?UWxKSjlqV00zeUpScFJBSHdNUG95MUxPa21LV3ZqTVM4MjVpZjgxKzdNb0F0?=
 =?utf-8?B?dGkrMGhmaUtzRGZPVGVvdXpBNFJENUdLajlRd1RVR0pFdjNVYVI0Ky9DVDBj?=
 =?utf-8?B?L04reHVncUpia3ZTZ1lsVjNUZ3ZiZWg3NmpoS3o1V2hodE5vaFJhSGZxVUxT?=
 =?utf-8?B?aUpwWWlDY1pidnI3cGh0VmtOOXdpenM5ZnQ1eTgzSU9aWEptR2J4b3JYZmx2?=
 =?utf-8?B?Z082RzNSNmliYUVjVTZzU3lidGxRd295Z09TRmZqcEVrZCsrbEE2OW9YbUtt?=
 =?utf-8?B?eGoyNEszekhBTGNRUXJ0Q0Q4UENrbjhWYmNEVlF3dlU2eUpkeGFMR0tYNUVN?=
 =?utf-8?B?Rm1WQXU0eHd6MEIvVHlLZzk4cEtMNTM5eFVEaWpzaGtyWVUvTS9aYWdVYURs?=
 =?utf-8?B?YnBsejNrVzJmOHZUbm9mbkhRWThoKzRPRlltb3lYNHgzQ2VBU3ZaRHdpR3BI?=
 =?utf-8?B?RzRsMllGVXJyV1p5dU5UeU5PMmhldkJKamZmUXR2alhvY2NjSVRUUjUwNzRN?=
 =?utf-8?B?NmVWNVdjaHRrbHhpMG15MkZwRGdNaGp3eldpenkzQU5FTXhGVHBGeVprVFBz?=
 =?utf-8?B?SXFiMVFESTRuSzZVRHd2ZG1wVXlrRk8zRkxyVFo3bHpTRWZia282U0ZSeURX?=
 =?utf-8?B?Ynh2Um5hTUdTTGtmL0l1MXNFdmxsWmhOYkR3c0VDMFdHdjBqUjBVNFZjb01E?=
 =?utf-8?B?V1dkam1yOVdhWVJSK0xQTGRPczdUYWwwSFVPNDIrbzNZNzhBMkFmdUdJdXR2?=
 =?utf-8?B?VFc4QVJBS28xbk1ycGJPQ2pPUlp5NzBHMU82c3AxUXBMa0c0a0xhY0c4NCtW?=
 =?utf-8?B?VmN4Y3J1UHlRZTNuUjFvN054bFc3UmJBYi9zamdhbG95YkppNy9QQk5ldDdi?=
 =?utf-8?B?ZGVmR3FEZWZUMnIyUFdjWlo4SWJjcy9EemIvWEFCL0MwbTRnS2c2YzdVOUJ4?=
 =?utf-8?B?OTVKbmh5eEx4M0JPaXFvdWpPR0dGc0lMcmVTYXpyUml0VmMrWGtkMjlLMU0v?=
 =?utf-8?B?Z1Y3Y013YmYycGQyVjN0MmpMZGZvTkVpYmsrc2xyenY5bkdqY05HWUdTTTg5?=
 =?utf-8?B?ZGFuYngzK2lPQ1lQYmRvdm1HclBSc1BvU05ndjR3NXIyaDhHd1JOMHg2bDlr?=
 =?utf-8?B?RVhQdXpXMmt4V1drS2tLdFMrTzVKY2U2VCtnTzgwbkFhZ3ZiSGNUbFBtQnlt?=
 =?utf-8?B?N2VyVElCbEJpUWRJOCtTUHE4bURMNHljdzdsWVg2Yi8xM3UxT1JxUFhNSkNp?=
 =?utf-8?B?ZHhCZ1BkREp4OGtKeXZmZVkyWWh6MTd5dTBDK1FCZVk4ZzNBOVEyYVZHZVJC?=
 =?utf-8?B?dlV0ampBR0YyVTdvMjZTOXNEcjZlVVZhbnZvcHBvNVpiK3FraCtFMTRheU5v?=
 =?utf-8?B?QWxRVXdDVGJWcnF6VksrT2s5ZEtUMUVOdVBtZlJ5SURORzh3Q0VNcVEwMk1G?=
 =?utf-8?B?ZnFBNXhXSW0vaXdCRmFBRDhVUjdHeTBJWlRUb1JMWHVycmpIaHE5c3pheTYz?=
 =?utf-8?B?Z1dudmV0YUxtd0c4Q1dFeXBqWUxyOVBFcS94QnlMaTVoSHBsN3hpbVZOQjZx?=
 =?utf-8?B?YktGNHlMV2lRaVZ6WlVxb2d6VnRBSjY0NnhhclVzZE9OVzRQWTE3V2x5eEtS?=
 =?utf-8?B?bzFaQnhiTnRlNDdDdWZRbjN6QVZZbEhLM01uTkpzbExnY0NGN0hZRDJ0blNk?=
 =?utf-8?Q?6xsyRYWmfvgzQrbVSY0nSCaYM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <130D6362193D384F9F4D9FBF3F34F33C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e46129-80b2-4be9-a01d-08ddb35338d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 19:13:37.3372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BajY630vi2L7RL92ubcapyNmSS75tUbtEsI/vtw7RvHH6P+ZD5XGbiBD2oi2vt/ABiMEIUS8ZIGZS8i+QlYOQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9764
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

T24gVHVlLCAyMDI1LTA2LTI0IGF0IDE1OjAxIC0wNDAwLCBNIEhlbm5pbmcgd3JvdGU6DQo+IFdl
IGRpZCBubyBzdWNoIGVycm9yIGNoZWNraW5nIGJlZm9yZSB0aGlzIHNlcmllcyAoaW4gZmFjdCwg
bW9zdCBvZg0KPiB0aGVzZSBvcHRpb25zIGhhdmUgYWxtb3N0IG5vIGVycm9yIGNoZWNraW5nKS4g
QXJlIHlvdSBzYXlpbmcgeW91IHdhbnQNCj4gdG8gc2VlIHRoaXMgYWRkZWQgaW4gdGhpcyBwYXRj
aCBzZXJpZXM/DQoNCllvdSBoYXZlIGEgZ29vZCBwb2ludCwgYnV0IEkgdGhpbmsgeW91ciBjaGFu
Z2UsIGluIGVmZmVjdCwgbmVjZXNzaXRhdGVzIG15IHJlcXVlc3QuICBQcmV2aW91c2x5LCB0aGUN
CmRlZmF1bHQgd2FzIG5vIEdTUC1STSB1bmxlc3MgbmVlZGVkLiAgTm93IGl0J3MgeWVzIEdTUC1S
TSwgYW5kIHRoZSBjb25jZXB0IG9mICJuZWVkIiBoYXMgYmVlbg0KcmVtb3ZlZC4gIFNvIHRoZXJl
J3Mgbm8gaW5kaWNhdGlvbiBhbnkgbW9yZSB0aGF0IHNvbWUgR1BVcyBuZWVkIEdTUC1STSBhbmQg
c29tZSBkbyBub3QuDQoNClNvIHRvIGFkZHJlc3MgdGhhdCwgSSB0aGluayBpdCBtYWtlcyBzZW5z
ZSB0byBhZGQgYSB3YXJuaW5nIGlmIHNvbWVvbmUgdHJpZXMgZGlzYWJsZSBHU1AtUk0gb24gYSBH
UFUNCnRoYXQgaXMgbm90IHN1cHBvcnRlZCBpbiB0aGF0IGNvbmZpZ3VyYXRpb24uDQoNCk5vdywg
d2hldGhlciBvciBub3Qgd2Ugc2hvdWxkIGlnbm9yZSBOdkdzcFJtPTAgb24gQWRhKyBpcyB1cCBm
b3IgZGViYXRlLiAgSWYgSSB1bmRlcnN0YW5kIHRoZSBjb2RlDQpjb3JyZWN0bHksIHRvZGF5IChh
bmQgc3RpbGwgd2l0aCB5b3VyIHBhdGNoZXMpLCBBZGErIHdvdWxkIGZhaWwgdG8gYm9vdC4gIEkg
Y2FuJ3Qgc2F5IHdoZXRoZXIgb3Igbm90DQp0aGF0J3MgYSBnb29kIGlkZWEuICBCdXQgSSB0aGlu
ayBhIHdhcm5pbmcgc2hvdWxkIGJlIHByaW50ZWQgZWl0aGVyIHdheS4NCg==
