Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77837C4836B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 18:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993D910E495;
	Mon, 10 Nov 2025 17:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l658Q0V1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010042.outbound.protection.outlook.com [52.101.85.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355C610E4A7;
 Mon, 10 Nov 2025 17:09:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1+GOSWbT5/GqOMI8cU1YIbGdKWF2qO2znjWtqbjvjv3WcF4qEvikalJxp7effXTPDkUlwRhVE0WtiJLfVTMjc2932f7tgaViFkkCTp3R/0MEvZS70B1vT3TnpxEOF+aoqOzLwI+nWkqIHcD2vHWEYtEMakxMS4HK7f/qzY+DqrY6mvBC4cieLnxQ9PI5YPf/rYTwAeq15CVFu1YDqImVTUnpy/HUNHpCfmGOGddu3d16RDQZlGLmHVHpF/N8KZ2JD4YeOMkCUk66CRRHqVyU4XdklNXB+RuWawulr7Vwcy1kGf77KjXdvD4H29ZgybaskN7o8q1lkz3HD7T0t4XnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovl25wsXGMAyvVby08AYq8Jd5yuE248X0myGgApsxfs=;
 b=J1aFyuzYdsZvqWJnvUfFphdh2evjbnxREdJFDUdEmpKg/nrm4yIPmVbt7gckqSGAdvBwgJtPpzNaAQ47URa9nv6dk7K5zhniVff/wxb3ewYulMxDQRoKCbHn2fg+alSFrJqvBh17bk8YJV7o4kcBFFXe+sA1BabOMxZvLZe9RznRDsZ6A+PdNCl78a/GkYXjucvDZFJs2C10ky9ESdO33isUFGvQ65OtBUa7y0uY/7dXWSlB2G3FcxBe+syODJKN90PCCXMT6gXueby5QQTP43rMBjFgqm6cTO0fY0iinii5e20hn1iskRrCXdWAkgMRKH0UsL9uAiQO239liR9/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovl25wsXGMAyvVby08AYq8Jd5yuE248X0myGgApsxfs=;
 b=l658Q0V1XVQvAODt47zQbeV7Ew5IiczSL6EvQdwZclVlSFgGwW0X5FsmDs2aEAnsV4+u2HHa/4raoP0r+aN+pYt10eU/u3tAjbczFTEGQq4QZY2kV3juK3ikKe6PecUk+NKxkuKmZKW8AUBPK5vjvnzo2LuoikD5PKlBUocxYXkXbxg3L+JaWyqdlNKZ34JfP228Rdry0lmr6Uw5xOp8vYNbKXIbwlkJgjphhHnn/zB8wd8hdAeygr1j8QMG0ukrsGx632zWQD59MwCYY1l5srA7927BnpgYPAZfOqjTu22It/zH9a8+ZVQA9nWzq9qdf3NNiQcDkKFLE29ix9rggA==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH8PR12MB6868.namprd12.prod.outlook.com (2603:10b6:510:1cb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 17:09:01 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 17:09:01 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: Timur Tabi <ttabi@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org" <lossin@kernel.org>, 
 "ojeda@kernel.org" <ojeda@kernel.org>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>, 
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
Thread-Topic: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
Thread-Index: AQHcTFTAORmK0Ghe7UK7TDiVVDAFJ7TjZSmAgAAPi0qAANWPAIAAWs+AgAAXeICAB1SjAIAAADaAgAAcmICAAALGcQ==
Date: Mon, 10 Nov 2025 17:09:00 +0000
Message-ID: <974877EE-0B3D-4723-B3F1-0BFCFCC9D2E6@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-9-joelagnelf@nvidia.com>
 <d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com>
 <0FF9536C-8740-42C3-8EF1-5C8CD5520E49@nvidia.com>
 <93c758298250d2be9262256a698c243343b64ebc.camel@nvidia.com>
 <3c625930-348a-4c96-a63a-6a3e98e59734@nvidia.com>
 <acc56fbb56c3f40119e5a6abf9f13093d7f4c7e7.camel@nvidia.com>
 <ac85d8be-3cbd-4a51-a627-3a1a9926d801@nvidia.com>
 <b07b21e8-5dd4-4d40-bcad-dd8dc4fbaef4@nvidia.com>
 <20251110115905.68bd2826@gandalf.local.home>
In-Reply-To: <20251110115905.68bd2826@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|PH8PR12MB6868:EE_
x-ms-office365-filtering-correlation-id: b5e9a293-3d54-4602-e5ca-08de207bd7f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SEdwNUNJV3VvUjdhWFBHZW9Lc0o5L3U3SmJGK1g4ck1hdS9YTXhVSklCeC80?=
 =?utf-8?B?angxYzVsYXRPblAzN2R1eTBPUjNJSmxNTW0rWDU1M055TUYwY2JLZTgvbXAr?=
 =?utf-8?B?eXFuZEthL0x3RVBoQnhiN1hIWEdySC9iVTUrdFQwbTRzN3BYQVk2S1BSLzFI?=
 =?utf-8?B?cUM1OWRlaHMyY3E5ck1TUmxFM0l1Mk03ek1OQzEvMHFseWlpNW5EVU5EZHdK?=
 =?utf-8?B?Y0RlNmRFeEVucDZBbHpqdTlJUzRmaFJiNzBKd3V3Sk1mU2R3VEhRUm9XS2FR?=
 =?utf-8?B?dmVLYVhSTUp3R1VwZVZ3ejUxV2MvcEhRNHpsTE9OeDVYS2thTlNTYUhtazMz?=
 =?utf-8?B?T2lDU0RneHowWHoya2lFWGM0Uk9iaUQyVUcyMllrRnd3NUxYQ3k3UDI4T1NK?=
 =?utf-8?B?aUtEczIrNyt1WmVGaWRpdFRiKy9ZWDdMU3h6aHNLUi9ycG9vSFVVYkdpaEFU?=
 =?utf-8?B?ZEF5TFVXajdhVGFObDFVYTQ5UnAzbXFpV0lLdlVBMjVCenR5WE41RXJmQ1Zx?=
 =?utf-8?B?Njk1eFVjSzRYTVZkS242UW15NFhmVGI0eEpldStXNU5hS0VrQ2ZQSXpTU004?=
 =?utf-8?B?VHFwMWJXL2liMXRORDNZYzZrdjkxU0wyeHBTTVQwM09ZQjhMRU5xVWRvTXAv?=
 =?utf-8?B?VFVMU21JSDZVME54a2pvazFqN0ljSzFMOUgzY3cvOCtlSkk3UUVISEN0N3Ev?=
 =?utf-8?B?RVYzVWQ1bGNzTWpNQlM2N0tvVUtTUjR4bjY5VnBDc2kvUTJ5WXBGTU9PNjNy?=
 =?utf-8?B?alh6MENzQno1aTBLWU5nZnY2dTA1eEVwS1RCN2E2WFlBQWNxZURGVmhVaVl4?=
 =?utf-8?B?endLMDVlbUs3Z1ZEOGhoUFVyRDJEam5jUGltcmNUeENLeDNQNnRsNXd3UzJj?=
 =?utf-8?B?czNGcS93ODBtUEFEU2ErNFhlMTlXVldDSjFGR005TktLdkpPTlkwNVBXWUtp?=
 =?utf-8?B?NHdqajEzTTdUaDRLRzJmNWk0MG9idVhOV3ZKeGkveDkyTzdiRGErOEhxWVFZ?=
 =?utf-8?B?V2k2elcrZGlWeXVnM2ZhNDhsZkxvamRsTjMvMTB6UHVBdHdwOHVtaTd1MmRV?=
 =?utf-8?B?QVR5eDM2VTBYZU8wanZGa1JCRnF2UktqcmQ3SjVLMUI2T3R3TnlUOVl1RE8x?=
 =?utf-8?B?T3l6Q1p6RmxUZHFBaXcrUUQ1MFNJK1NUMExaQldFRk1GMG1pYjZxMC9DNThk?=
 =?utf-8?B?eS81QVh5dzIwam03WWVBaEFQRG5pNk5qR3VscVZrWDZrcVhOVDRKSU5YSkZX?=
 =?utf-8?B?VTExYTBLUzVNYUxpS2VGV2lxWGZNZi8yVHo1QnFReXZuOUo2OHFCS25wTG4z?=
 =?utf-8?B?UXVXQ0UvblBDbnp6MllzalBSYUpkWllzUlpVZXlBaDhlRUJVYTluL0xLZnVG?=
 =?utf-8?B?c2YrbUFHQmF5Sk8vRkszL1UxeGgzbzBDZUZlMEZGclNydkZFYVNHT0xWbzhw?=
 =?utf-8?B?UTBaQTA0S2RqUXEvUWEvbFBoQ0I4WmZlNUdLQms1alNBNWcwejJ5L3lLbFhu?=
 =?utf-8?B?Z1Bya1Q4bks2TkwwbXQ0amM3Y1VKR2FxR1BqVmJ3YWg5Y245V1lpMUhTclNY?=
 =?utf-8?B?QXZmaEVkNGVESDBSZDFnb0VuS051V2RlNUtJWXl1LzdidCtWb1NMeGU2RnhH?=
 =?utf-8?B?U05xaGFod2lGYVBPYU90TFk4SGcwN21ZdktzdWlqQlRJQTVWREFoeTRDakFh?=
 =?utf-8?B?Q3g0VkZ1dHlWVHhLYUQ3alp4UnY1WTh4aW5MalZweVp5T1BHY3p4TmtwbEhH?=
 =?utf-8?B?QldvQkt4Z2I2cHBPdTArVk9nbnp6OHdnZzhiMnFHdG1MSjBJc25tWWRlVVNr?=
 =?utf-8?B?RExxSDJLWWRSSHNOUWJrZUozdjYvR00rL1hIdGFUOWpsSlR1RUVyODVSc0dF?=
 =?utf-8?B?RzdiYS91bkwweDBXckVRL1Fvamw4OHU3UUlHQUlsdTd5UENtQVZtMjlvRDhG?=
 =?utf-8?B?aUZ6bkpvOGo3eURDY1kwKzNienZPTnRTTml5QmV3ZEpZU3hnSVNHWUxBV1Fz?=
 =?utf-8?B?bmlKaG5UZUJRZ1NFVVlpNzlNcHRGTnJ5UnJSelIvcjY0clIwd0pzMmh1K2F2?=
 =?utf-8?Q?rvMF2R?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlp5bVR0Mk4zOC93aGRSMXpCeWNjZGx3eDJ6MG9YbHBwMXB2emU1bVNENHVD?=
 =?utf-8?B?YWZYcGRmTnEvQTl0bHNBeExYUXo0THBYOTEwMlgzVGlhblVVSHR4SW5UcXM5?=
 =?utf-8?B?bUtxc0hPSHZGSnFCM0cxY3gxSlYyeS9UR1B4S1RjZTl4cnhoQlFtK01zRWEr?=
 =?utf-8?B?UnQzYW9MTmhXVlgwc00rVkxYcEpsSnVjaDVtamc3ZTBjVTBDeDlXMUd6b05H?=
 =?utf-8?B?UnBtUi9aODlzcml6RnN4SDlpMHo0dFRUQ01EWi9RR2t3Qk5qUG9RRDM3Y0k2?=
 =?utf-8?B?MmJsdVhyOXR5cFFHOG9nbzMvOG9mTEFiWWpTTFNsZ1kxZDRUNHRzZUNUUzFZ?=
 =?utf-8?B?a1hUL2JXaWR4SkdkQ3pBbkZJNXh4VWwyOGhoUG45T0UyVkpkb3FkQ3VzUDlF?=
 =?utf-8?B?dzJXUFA2bXhsTEZtNGMvQ2ZFQmpGa0tpRTNsZXIzQnVtTTRMajZDQzUxV3J2?=
 =?utf-8?B?NG1JNENZcHlRVm1SbXZabmRscWxEelpiUmYrWkJHcnNSZUVDTW51NDdkMi9W?=
 =?utf-8?B?U0tJemVTdERkbFB0UUxPc3JiRmpBeU1wVjYwcGYwVEw1Ty8zb2dLNUxWOFFk?=
 =?utf-8?B?TUo5ck9mNjhlSW5MVUFzOXNGSWljNTFMVmlzQytxajBXYlNjYXU4ZHhESUQx?=
 =?utf-8?B?UklqWFkzUG1JS3V0NmZONU5nanJmSmY1ZjRLSFBSYWxUZEZmM2VYMEFPQ3Z0?=
 =?utf-8?B?RFdzQkJLanprVlNObWRuWVNxcVV3Z2pGSDVRK1hOR0xlNlRFRDlYNjBTUTJn?=
 =?utf-8?B?dWx4bHdjR1ZsLzlYU3NDZnYxVlFML1NXdkNaQ1VwZzZtdWR2VVRsaVJScjdE?=
 =?utf-8?B?eFBoQTdubXBsQVNwWHA2U2hUNFNjQlFVZnFVcDdlWTRZWTF3NmQ3R1BjcUdP?=
 =?utf-8?B?ajdFbmhJWHhwZGswaEdNdWltSlZWUDE2U2hHbFV4MXdVSGVwQTFmMldGcmNa?=
 =?utf-8?B?ZCttU0VtUFpWK254RzZGUENKbXpHdEo1UG5vazF2UWsrTlJsUi9DdU4wRFh3?=
 =?utf-8?B?Z2d1a1RjN0cxeG10SDFZTG5Zd1RLSjRDQmhua2dzbWVxRTBjZ3hDTmlzNCsx?=
 =?utf-8?B?eDhtb2U3WUhLU2t5WFB6UzFBMjA5K3dJTG5Cb1lUK2N2U3E3Yk8zd0x2VW9l?=
 =?utf-8?B?blk1ajJISlpFQmI1NFA1QXBnVTRsUG91cSttWFpnMEhhclNrSzRJTFZJakJB?=
 =?utf-8?B?bkdWZ2RLbk95elJ2VWNsWTBycmlsWWxpQmlqRmRCTmx6bFRKZktESnBVTHdn?=
 =?utf-8?B?RDZxTWx4UEZTN0ExMjIvOE1iOFZXT3JmM0Y2bVpaNzAxYkVOL2pOSXhKOGRF?=
 =?utf-8?B?NHpsYXc4enRJc0Ztb3NmL0tRd3hzV2kzZEMvbzZZbG5xRm1TUmpRZ2ZMVjhr?=
 =?utf-8?B?Y3lPWjc1RTZZUnBieHVpZC94bGVvN0ZtNWNXQi9PamxTVUdOZUlrTTJ1cDJp?=
 =?utf-8?B?cTZlM3E5VzgzN0lGU25Qd2pRWCtjQ1BrWHhGN2lSRTQ2ekViNklQTXVkMHRv?=
 =?utf-8?B?ekhVQ1hTRUxHR2V6MkNraCtxb2JpNlU1MkgyemtaWE5NbFRCSXVzK3NGYlps?=
 =?utf-8?B?WCtDZWI5WXRMT3dQS1JmWG5LNWtzZ1lDZWpMY3k2OVcvWG5qZWtjTitHTEdz?=
 =?utf-8?B?YzBpYXFlRVpKeFdVeE9hSWdMZG1KaEF6Rkl3RVdON21sZkU1cWtzSU9tc3dI?=
 =?utf-8?B?YlFVK2pVTHBYRk02b21XazQ1UllrczBYci81bjlXd1JjazNVY241eXB5TXE3?=
 =?utf-8?B?QnpnUTNHU3krSGQ5U0tQcUhKQzZtZkpZOXlHQ2RXMW5jdlVodVM0ZDVhMW1T?=
 =?utf-8?B?NFNJVGZmdWNWd1duNDdwYW5XUHFBa2pESG1tbVdtenJTSGZER0x2Z3NtK0lK?=
 =?utf-8?B?VndrNDZ5QmhBYnhOdWs3dzJTVGFMRGI1QUl0NFFlMXlVMHZiL2Y3YVVmdVlN?=
 =?utf-8?B?UDU1NE5WYkQrZmJidFl4Nm50MlBXWmZHOFk5ZW5VZ2NLYnYxRDdseGx2M1ZI?=
 =?utf-8?B?OGpDTzBHUTdGY3JGZkV3QzRvd1Q2NG5FQ1dhUzhVOUg2NWhSVkZMdGxJUWNr?=
 =?utf-8?B?UHIrNzlvaVFWMDNJem5pY2pxbXh2SE9HTGdXaVkyc291T3BBNURKb1I5bkRh?=
 =?utf-8?Q?uzpvTncFLxvXjH6z6zq7IIh37?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e9a293-3d54-4602-e5ca-08de207bd7f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 17:09:00.9366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LV1BEzDzyQE+mY5qmPWBGqDNksL+2pN9ihpd6C2R+MX8Lcac5qxgu+8CDA9DeL1PpcNqKP7QKOwlpfo3X3PZUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6868
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

DQoNCj4gT24gTm92IDEwLCAyMDI1LCBhdCAxMTo1OeKAr0FNLCBTdGV2ZW4gUm9zdGVkdCA8cm9z
dGVkdEBnb29kbWlzLm9yZz4gd3JvdGU6DQo+IA0KPiDvu79PbiBNb24sIDEwIE5vdiAyMDI1IDEw
OjE2OjQ1IC0wNTAwDQo+IEpvZWwgRmVybmFuZGVzIDxqb2VsYWduZWxmQG52aWRpYS5jb20+IHdy
b3RlOg0KPiANCj4+PiBJTU8sIHRoZSBiZXN0IHdheSB0byBkbyB0aGlzIGlzIHRoZSB0cmFjaW5n
IHN1YnN5c3RlbS4gSXQgaXMgdGhlIGxvd2VzdCBvdmVyaGVhZA0KPj4+IHJ1bnRpbWUga2VybmVs
IGxvZ2dpbmcgc3lzdGVtIHRoYXQgSSBrbm93IG9mZiwgbG9ja2xlc3MsIGluZGVwZW5kZW50IG9m
IHRoZQ0KPj4+IHNlcmlhbCBjb25zb2xlIGV0YywgbmV4dCB0byBubyBydW50aW1lIG92ZXJoZWFk
IHdoZW4gb2ZmLCBldGMuDQo+Pj4gDQo+Pj4gSSByZWNvbW1lbmQgd2UgdXNlIHRoZSB0cmFjaW5n
IHN1YnN5c3RlbSBmb3IgInRyYWNlIiBhbmQgZXZlbiAic3BhbSIgbGV2ZWwNCj4+PiBsb2dnaW5n
IGxldmVscyBmb3IgTm92YS4gVGhlIGJyYXZlIHNvdWxzIGNhbiBhbHdheXMgYXNrIHRoZSB0cmFj
aW5nIHN1YnN5c3RlbSB0bw0KPj4+IGFsc28gc3BhbSB0byBrZXJuZWwgbG9ncyBpZiB0aGV5IHNv
IHdpc2guDQo+Pj4gDQo+Pj4gKysgVHJhY2luZyBDemFyIFN0ZXZlbiBSb3N0ZWR0IGFzIHdlbGwu
IFN0ZXZlLCBOb3ZhIGlzIGEgbmV3IG1vZGVybiBOdmlkaWEgR1BVDQo+Pj4gZHJpdmVyLg0KPiAN
Cj4gTm90IHN1cmUgaWYgdGhlcmUgd2FzIGEgcXVlc3Rpb24gaGVyZSwgYnV0IHlvdSBjYW4gZW5h
YmxlIHRyYWNpbmcgdmlhIHRoZQ0KPiBrZXJuZWwgY29tbWFuZCBsaW5lIGFuZCBpdCB3aWxsIHJl
Y29yZCBpbnRvIHRoZSByaW5nIGJ1ZmZlciwgYW5kIHJlYWQgaXQNCj4gb3V0IHZpYSAvc3lzL2tl
cm5lbC90cmFjaW5nL3RyYWNlLiBZb3UgY291bGQgYWxzbyBjcmVhdGUgaW5zdGFuY2VzIGJ5IHRo
ZQ0KPiBrZXJuZWwgY29tbWFuZCBsaW5lIHRoYXQgd2lsbCBwbGFjZSBldmVudHMgaW4gZGlmZmVy
ZW50IHJpbmcgYnVmZmVyDQo+IGluc3RhbmNlcyAoL3N5cy9rZXJuZWwvdHJhY2luZy9pbnN0YW5j
ZXMvPGluc3RhbmNlPi90cmFjZSkuIFlvdSBjb3VsZCBldmVuDQo+IGZpbHRlciB0aGUgZXZlbnRz
IGJhc2VkIG9uIHRoZSB0cmFjZSBldmVudCBmaWVsZHMsIHByb2Nlc3MgSUQsIENQVSwgZXRjLg0K
PiANCj4gVGhlcmUncyBhbHNvIGEgdHBfcHJpbnRrIGtlcm5lbCBjb21tYW5kIGxpbmUgb3B0aW9u
IHRoYXQgd2lsbCB0dXJuIGV2ZXJ5DQo+IHRyYWNlIGV2ZW50IGludG8gYSBwcmludGsoKSBzdGF0
ZW1lbnQuIFlvdSBuZWVkIHRvIGJlIGNhcmVmdWwgb2Ygd2hhdA0KPiBldmVudHMgeW91IGVuYWJs
ZSB3aGVuIGRvaW5nIHRoaXMsIGFzIHNvbWUgZXZlbnRzIChsaWtlIGxvY2tpbmcgZXZlbnRzKSBj
YW4NCj4gbGl2ZSBsb2NrIHRoZSBzeXN0ZW0gaWYgdGhleSBhcmUgcGlwZWQgdG8gcHJpbnRrKCku
DQo+IA0KPiBBZnRlciBib290IHVwLCB5b3UgY2FuIHR1cm4gb2ZmIHRoZSB0cF9wcmludGsgd2l0
aDoNCj4gDQo+ICBlY2hvIDAgPiAvcHJvYy9zeXMva2VybmVsL3RyYWNlcG9pbnRfcHJpbnRrDQoN
ClRoYW5rcyBTdGV2ZS4gVGhlIHJlYXNvbiBJIGFsc28gYWRkZWQgeW91IHdhcyBhbHNvIHRvIGtl
ZXAgbWUgaG9uZXN0IGFib3V0IHRyYWNpbmcgcGVyZm9ybWFuY2UgZm9yIGxvZ2dpbmcgdGhhdCBp
cyBub2lzeS4gDQoNClRoZSBjb250ZXh0IGlzIGRldl9kYmcgbm9pc2UgY2FuIGhhdmUgc3Ryb25n
IHNpZGUgZWZmZWN0cyB0aGF0IHRyYWNpbmcgd2lsbCBmb3Igc3VyZSBjaXJjdW12ZW50Lg0KDQpJ
IHdvdWxkIGtlZXAgZG1lc2cgcHJpbnRpbmcgb25seSBmb3IgaW5mby9lcnJvci93YXJuaW5nIHdp
dGggdHJhY2luZyBmb3IgdGhlIG5vaXN5IG9uZXMuDQoNCk1heWJlIHdlIHNob3VsZCBhZGQgYSBm
YWNpbGl0eSB0byBkeW5hbWljYWxseSB0dXJuIGFsbCBkZXZfZGJnIGludG8gdHJhY2luZ+KApg0K
DQpUaGFua3MsDQoNCi0gSm9lbA0KDQoNCj4gDQo+IC0tIFN0ZXZlDQo+IA0KPj4+IA0KPj4+IEkg
Z3Vlc3Mgd2UgaGF2ZSB0byBkZWNpZGUgaG93IHRvIGRvIHRoaXMgLSB3aGF0IGtpbmQgb2YgdHJh
Y2Vwb2ludHMgZG8gd2UgbmVlZA0KPj4+IGZvciBOb3ZhLiBPbmUgdXNlIGNhc2UgdGhhdCBqdXN0
IGNhbWUgdXAgaXMgUlBDIG1lc3NhZ2UgYnVmZmVyIGR1bXBzIGZvcg0KPj4+IGRlYnVnZ2luZyBj
b21tdW5pY2F0aW9uIHdpdGggdGhlIGZpcm13YXJlLg0K
