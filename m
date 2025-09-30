Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1725BAE2C3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 19:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8E410E616;
	Tue, 30 Sep 2025 17:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bB9hH66y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A9D10E279;
 Tue, 30 Sep 2025 17:28:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CEqx+La4I0m5VYOUxALQQWf+ErIsHVN2RPS1D9JX5dXkzzek+siNzjyhNJF0Eva2LbvcEY4W+dnF8z7lav7XhC7cMgbzrBbdF6LrR8rAyqSMBmo0SsYoICp1xwe8yV02tfEPXNd92/KJosVb5qB7YWx6WYjhaqmSHkHvsKySJh5JeC8uJB9ib/vjK2NuVisSECKHdBZ19AnkXHbHmDmbI/kboZ6vkYF1pxBKFJrK4TgNnOMBIlUI1rY324fISTcQ8tbfHH5Rs8guftBRP7NScYhofkgRvWJmaeVorN5zoGDj9Cl3K1fNPLebFqnCH4RKNacovQneTJsNHxpbx0L3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqLmdjRbVCk7eJAtT8m6ta67nCZ3bEWAEfAluoD8ZFQ=;
 b=Kd2+a49BImkwRRA4fkFci2Tr8EYHCbXPOeBS3ASictVc/8zKybBiOOfGDZiAc+D8LyCX7Iyjge1lppUB/cZ2iXrdm8bCnwZAHQaoZ6/EiOaSyd5yzOFQMpbfpKZAkL2UQU1UpP6dpIynpqzbQ/JMWYzJcOm8VmSCnuygk+nD6IKGCSmHZKGBIo0dRZ43LY/dVMGIjdYwNitgUpQMHbzmE75PArY/HFzcC3YkyD5E6OeyMMuxgU1u08HGRUMr10/Ja7zngJXMUL/sXJ/wfsliVOh/kmsk5Jftda/2WMHuzNn0gCfi4UDGgvFyUplrmxY5MazT/eN1jCecjXhLlTLYmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqLmdjRbVCk7eJAtT8m6ta67nCZ3bEWAEfAluoD8ZFQ=;
 b=bB9hH66yM5JHQCrMQxL12yzyoTBbmhTuIFrcy/96QzIoko4htMZ5vyHu6mruNrSNclO9+2SwLEa8GQzXgrhs2MoX2GaN32pXJelZ1+s+XLLsRCUrEbtsKDa7FlC4W2q70ulUoDDgdCTQhVpDzev/1mW1QMo2ty4olpW3TKag8HNP9CcXnqz/LZkUVdQyWR9RU4clYKA3GaNDl1i1B3SPfxPynUGvx7mreUJEr91b67NAn3WnSr0B/R6npglAOdp5zgowlCf7dFMCx3JE4HuT0I82Qdg+tWFAU4joJ7NfGe26Db5A0c+Dg1cHHYsgRlgtkhpxKx+c4LrwDttFcQ7E7Q==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by IA0PR12MB8906.namprd12.prod.outlook.com (2603:10b6:208:481::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 17:28:16 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 17:28:16 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Hubbard
 <jhubbard@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [PATCH v3 13/13] nova-core: gsp: Boot GSP
Thread-Topic: [PATCH v3 13/13] nova-core: gsp: Boot GSP
Thread-Index: AQHcMgyqlbPlQBD1p0epVgqrC9Xo5rSr+xwA
Date: Tue, 30 Sep 2025 17:28:16 +0000
Message-ID: <4ca375c118ff2207baa09e3a6878de546872e250.camel@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
 <20250930131648.411720-14-apopple@nvidia.com>
In-Reply-To: <20250930131648.411720-14-apopple@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|IA0PR12MB8906:EE_
x-ms-office365-filtering-correlation-id: 0888eae7-e752-4f92-7e3c-08de0046bdeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?N21sUzR3d1JFa01HTWhydzlNVTVDcnlTUWZONEd5YjlVUjA0cDFQUzd5QTcv?=
 =?utf-8?B?ODV0SE00ODBXbENoVzhuS2toZk1xblNSYU5QWFdwbHVLMHQ4R0dmVUVWR1dv?=
 =?utf-8?B?VVlkMDVNZnNXS213VjBFdzhpZjhVdVFtRHc4UXBBVlI5QkFPYzhIZFBDWVNV?=
 =?utf-8?B?TWhuaDRvaUtvV01KNDg2SkNjUzNqQURRK0NsQmdmVTFleC9rb1dQa2I0Ukdp?=
 =?utf-8?B?ZzJGYXNqaTh4Sll3ZUZZcU5BOE91RmphZEVEYklqREdVMW5VbjNsK3BjVTJC?=
 =?utf-8?B?Z3NFa0FNaEFBVkVJWVFoTlBNTHVraTc0SFBMbE5JK1NvRXBTTjl1ZmlXR1dM?=
 =?utf-8?B?djlMS0t5cHhyY2FwdWV4WURwTTVQSFpBbGNMM2lGSER4RHhQVHVlNWo4M2ph?=
 =?utf-8?B?eDRlS2JXNC94UUpCNHU4REJIdno3eVFTNUZ5WVk3TmxYcWo1ZzdxR3pHeHNh?=
 =?utf-8?B?VVFZaTZiUU55TkgzM2Y2d00rcWcyL3BqcFZKSWdTMWJlUTVWejM0alpkQ044?=
 =?utf-8?B?WmtGc01rMGhqUm45SHVCUi9VVDlLMm84RWw0cUFhaFBzSjdBUjZ0SDNhUFVu?=
 =?utf-8?B?RUlWQktlYWhxdnJnTnVuSEk4S2l0ZlZGRWNNSFpJNldoOGtrd1dxNExFODRP?=
 =?utf-8?B?dnFvYUJWL21IbnovbEMzUmlDTi8wOEJUOGVtd1g1WjlvZjVDYVlIcVNoQTlB?=
 =?utf-8?B?cW1WbEZLUlFJbFZaVi9XNlJyQ0JMeDgzL29LdElHbDlkNHBORTZzV3BsTmc2?=
 =?utf-8?B?elYzclUrcDE3WVRiK2Y0Q0k4eis4K0pFNTN4Ti9KVnhvTzFjVmJwZ3FkakVt?=
 =?utf-8?B?dXBFc0QyUzJ4dGk0dW9mdyttS0RMZHRnQlFJQVlEMzZSNHNsdkl0VnVWWE1i?=
 =?utf-8?B?RTFlRjFKZkQyQVdFdkhZOS83K1hvbFZ5ZTJNNlhvM2JiWXdaZFdsR3g1RXJl?=
 =?utf-8?B?K1ptRng4ODltUG5QRW1qQ0V6UG1jOVZ6OXJzZDZRdm4wSDdPaHhCWTRyVFNX?=
 =?utf-8?B?VXpmTmVlWGpzQkQ1WUV0NmRiQ0JzdnVCbjVuWFQyVkNRZDkxTWJ6VGl1YWJF?=
 =?utf-8?B?Mit2aVhsMnRGSkZKSFhZOTBHLzdKcjcxZUFyMHMvMFY3UkQvNmx6UEo0QWkx?=
 =?utf-8?B?VTlSYnZsNHg0ZHV1cTFOTFc5VS9lSDhlYjBOWmdmYUxNb255N0ZtZ0JxT2FN?=
 =?utf-8?B?NXZSUmxyTERiUE93TExpNDJlbnRrbGtFOHY1eE52Q0k2Mk8zRWVwN1dTL0VK?=
 =?utf-8?B?U2ZnMEV1aHV4ODloT3VvdkpGY1djVlQ3eVZSSERIK3dwK1NrWTJZQm9RdzlC?=
 =?utf-8?B?WEt0Tk0vVTh4VGU1dzJsTmhIZXVUc2ZSczJzeEpIdUF3ZEl2ME5hYnVBdUh6?=
 =?utf-8?B?cVpjOGZheWdORGE5THFJRjcvK1RrSHVaVEFzam1iVE84RWhvNXJUYnUrZnNl?=
 =?utf-8?B?ejhVdHFsRkZuNmd6eHhpNGx6bmcyS0RrTldVN2pNalJwTEowZE0xT2hPS3NE?=
 =?utf-8?B?ODRwMFNxVWtrM3RPZkhyczY0bDVhYlU2QVlhUEM5VVVTN1Q2VkViUnk3YUcv?=
 =?utf-8?B?Z3d1dW80TkJneS9MOGQ2YTNVNzFGMDFnK2h0MDhqZ0Znb01KbHllTFNmSnFS?=
 =?utf-8?B?Y2doRGFHNUxzL2xRdDhJaEZabkNmUGRsK3YzRXBlN2ZwZ0Z0QUVER2tMV3NG?=
 =?utf-8?B?NWF4amxaL0ozanQvN3JOT2daZTVhSmZqZ2hOVlBSdEtmV2hFSEh1Q0pEaFVF?=
 =?utf-8?B?NG9zWWRQR1ZUR05zRCtRWXNhN2Z1ZkwxNUZFYVViL0h2QkloamZkMjI5cEVK?=
 =?utf-8?B?NHJXL0x3MnFwODYxc0ZWZkNhYStqR0E5YXl6RXRWSkJUQ0wxZGRpTDJzbCs5?=
 =?utf-8?B?dHQwYWxYaGdZdGVDOXVaRHUwNTE5ZjFQdmlIdlBRc0NPOVRldGtXYm4rOURY?=
 =?utf-8?B?ZS9vTjdxTWowc3RPd2hBTThLZThzcm5xSi9SOG5PalllQ2diT1FBdEFQSCs1?=
 =?utf-8?B?enZJb3lsM0pUWE96MjFscUY3Z0JVTDFiT2NveENJakN4SyttYmd5QUtsSTNY?=
 =?utf-8?Q?19QqwH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1lUQWVOR2pwb1lHSDhvTEVqM2pqNHVVZDlMemRvK1F6R1NZOVhJdU84QVJ2?=
 =?utf-8?B?SnF2V2wzVVFRazVJaXF5TWZtVkJvSGkyb1JnZ0VLaS9oQ2hUUG94UlBnVDIx?=
 =?utf-8?B?cmVEU1BJL1NvTnlYcktLajAvbk53WDJDMklxL0xPVE9PYWFaaFNZUXpKN09I?=
 =?utf-8?B?dEo3NEVMdHBNVSs3TlFxYjhMQWhmSkIyV3RDY2IyT2V5VGt5a3kwUGRheXZI?=
 =?utf-8?B?Vkd0aUV6QTVrcnl1cFB5YTN5Q1J2V3pna3d6Wk9OdUZJYmxYWWZROEtTYWhE?=
 =?utf-8?B?SkZsNk5raEFha0l1TUV4MmZKdjhsNWRYVlkzNWI4RGFNUnd3dVdQc1VDL3pC?=
 =?utf-8?B?bHBCdjNHRXlwNFU1UFJ4MXZPMWVVNndGbWdUSndMRjhKZms1WmgybjRrdk1D?=
 =?utf-8?B?c3h1eWk1dGM4aU1oQ2puL2VmZGRxdXhCSFc5NWN2TUs1cmNyOXZKMXpTZHh6?=
 =?utf-8?B?MzBQN29oa2IzMDlaK1N5dmxvalJ6QVAwN2NOakNvOXBjaWhaUlRXeTNoc2NS?=
 =?utf-8?B?QnhVZVprcVpKZFIwTkMrSVlObGtDcldYTHl2bWY4S1JYVnlEOVBZL0x2dGMx?=
 =?utf-8?B?TUs3Y21aMDBqbHhqbnRaZGhJNmpzdGQwWDI4YjRwMmtoVi94QzduTFBOUGtK?=
 =?utf-8?B?eCtLTFZpRGR3ZEhUYXRidjlrdlhCQUhGa2NoOEFQb0pkVHFxcEVMZ29GRGlz?=
 =?utf-8?B?eWhiQzAwSDdqckYyR3V5UmYwRzhFa1RiVmg3RGNzZWkxOGkzU1RTTXRLVncv?=
 =?utf-8?B?emJkZ1NtQXB4cXM5dTdxSUdEQ2UxSWJHN2RCTXVjbnlZWlhSTXZuV2k1M3l4?=
 =?utf-8?B?ejF6SmRqbUhPSytBQm55SmRKMzVGOEgzdmRQRXl4US9QRkc0TTRBQVNqOVR2?=
 =?utf-8?B?bFppOFFUSWpvbWlIejVlQkEvVEtpeFlyUGd1YUt0NlRZeVpQZ2hUdm5adzNT?=
 =?utf-8?B?R2o4blhpa2RCOTg0bWV3L1NGMlo0cy9yektOMnRNRjFPQ2xHeDYyWENpK3gw?=
 =?utf-8?B?Zzh0WnAyVWV5QWdNMlJUQmdTU3ZXMzgvYmdLSW9JbVlvMnQydmZpM29sTy9u?=
 =?utf-8?B?VHdBN0JzM1Zmc0xpajJ3dHY5UUd6dU00WXRzc1pPaE9OOTlhdlVXYVIzNXpN?=
 =?utf-8?B?NFpTenJIYWxjV05TZDVYSVlGUTc3SDgyeEUzVVgxT3RrdXAxTUQ2enFCWmgr?=
 =?utf-8?B?YjVWRFUzTWNyNU9adTliY0xXSVhTeHR3b1dMY1N6YzdKaDVGem5kWGphVXpu?=
 =?utf-8?B?cVV5aTJqYlRHVUpHOWppMGVSQkY0UndhMkNsY0xxdzdIWFBmUXppcEFGWjVB?=
 =?utf-8?B?VG5tRUpBalQrL0s0ZzBXMkVFSVZ6d2FuU0xTS3E5TTkrRUdjdkJNeDdtU2pk?=
 =?utf-8?B?MzhhcHo3TG9rQWcwMVNWWXhlcm1weXY4NUJxWis4UHVMclZMVi9ySGVGbDFk?=
 =?utf-8?B?eElCbFM2TU5NR2YxZWJvT1hMa21FMzNQek92d3hTajlpNG5Mc3NvYTV0dXQw?=
 =?utf-8?B?ODdsVDh5Y254c3QwVTdtLzBBS1psTExkbTU0VW5SeFRINzVqY2VHNGxmOTFZ?=
 =?utf-8?B?SE9YR3YxK1RxS04xeWQ0c1N1NnJ2T0luRkZWVkk4WDgveWI2dFBGTnhJWnF2?=
 =?utf-8?B?ZnVQbHNzWlp6SXUxeWNSa1EvYUc3ZVdjSzBSLzJsdnNUSUJ3ekh5ay9VcFJa?=
 =?utf-8?B?bXJtb1U3cWJNTGRaaXpNSVF6aUhUcTEvc050bkI4Q2gralFkZ2lKNTUwVEh3?=
 =?utf-8?B?eWU5MWxMU29UQ040LzZpOWZVQUo5ZmVWYlBQbnpVRzFkcFRVLzQ2MVRjMXl2?=
 =?utf-8?B?UXlxVzJkSVl0d2dHTktUWmJleXZIM25qMEs3RzJUT0VpanNEU2d3T0NPSFdt?=
 =?utf-8?B?MlJtYVpsQUJpcGhveWV1ZkUyTGNBandvaG1jSEhvZGFDbDJxbEtHWi9uUERB?=
 =?utf-8?B?ZXBiSFlPYU9LTjVQN3A2cDd6cytQSVpSZUVMZ2lRWEZ4L2ljY0ZDMmQ3MW4y?=
 =?utf-8?B?MjVlYWFhY09RMXUzeGdKMzE2Mkx1ODBLL0MvSFJOVGZIZEVUd3ZCSTJPYlFp?=
 =?utf-8?B?cDM5Zk5ZZkttY2ZyNk9TSVBpdFloZy9jZXRWUVVWMGp3UDhIb3lwWWszdVZV?=
 =?utf-8?Q?TFgKiT2vWOMXx7wh2HD7/aS2p?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32B6932456EFE14487CEC19CFE3AD1EC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0888eae7-e752-4f92-7e3c-08de0046bdeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 17:28:16.6704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FhAFdTAHJyA9zRMyeJC7lte2RYEzLUKcfpB6VwUyJfFXE8DViGeiV5NHd+JMRNU/C84RhHiswYx3WANiwSyJXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8906
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

T24gVHVlLCAyMDI1LTA5LTMwIGF0IDIzOjE2ICsxMDAwLCBBbGlzdGFpciBQb3BwbGUgd3JvdGU6
DQo+ICvCoMKgwqDCoMKgwqDCoCBsZXQgKG1ib3gwLCBtYm94MSkgPSBnc3BfZmFsY29uLmJvb3Qo
DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJhciwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgU29tZShsaWJvc19oYW5kbGUgYXMgdTMyKSwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
U29tZSgobGlib3NfaGFuZGxlID4+IDMyKSBhcyB1MzIpLA0KPiArwqDCoMKgwqDCoMKgwqAgKT87
DQoNClRoZSBvbmx5IHRpbWUgLmJvb3QoKSBpcyBjYWxsZWQgd2l0aCBOb25lIGZvciBtYm94MSBp
cyB3aXRoIGZ3c2VjLCBhbmQgSSdtIHByZXR0eSBzdXJlIGl0IGRvZXNuJ3QNCm1hdHRlciBpZiB3
ZSBzZXQgbWJveDEgdG8gMCBpbiB0aGF0IGNhbGwuICBTbyBJIHN1Z2dlc3QgdGhhdCB3ZSBjaGFu
Z2UgYm9vdCgpIHRvIHRha2UgdHdvIHUzMnMNCmluc3RlYWQgb2YgdHdvIE9wdGlvbjx1MzI+IGZv
ciB0aGUgbWJveCByZWdpc3RlcnMuICBJdCdzIGp1c3QgdW5uZWNlc3NhcnkgY29tcGxpY2F0aW9u
Lg0K
