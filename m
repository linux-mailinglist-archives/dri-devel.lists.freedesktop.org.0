Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2293AC839B
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 23:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9878110E198;
	Thu, 29 May 2025 21:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QW0JBcUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C6E10E14B;
 Thu, 29 May 2025 21:30:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXY+gNWYKojDCfLbO+X+LzmFxAGJJY4ai9O8djmk3ZpVAvG14Ee7Tr3VU6RCnCyxJUvMnhzkBGA8iOAlaCx7Am2l2BvtgVSji8k1OLNH/6XY2l1Ijmww3C/iM7+G8ZCJ0LcSiy/PnwHZwWYvbP+vngly+qIfDskSoA2z+jn0LenftokcCd2567UZC8NZzFnwKImu4ZWRHzuCFvABorDPu9pQSMr1fWn6MQOFEacbFz23oilFSElpHwVJAYfg7uRL6vwVKSs6bqc1PizZ14FcD5i+GEdFb7A+XhVKshng4VgwP4XWBsAeg4s5f8pPIffxkfhUcyfdyswxU5xVAIztYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvHjMlvMU7xk6J9M8lgfKSX/febGeEz58ibiDbvl/sw=;
 b=MR0ODgSs4mSAU1XeJ5rTMCcIRXsNPsFhYLYmd7q4pV8wyPWk/nY9IZ2JSTl8cM3V6ARNLb1Hcpk7HTTVVc5DtpJGAjzL1l77yG3gn2xB2a3ceDfuAOKC0oq3zfXH48Wch1EYQ/5CpwpoFFxywVmNgsZQgLl9lySGwz8ejuJorQXSxPHyGDzCIpj63DsTF3CbIMll8uFy4tlKVK04+3TO4Pe1199Gc/n89WsVVF0LsHdMkir4iuzLDdwViMUS75B2RWnKreIdy3c04BNuXb4k3HRLWBbGRovrFV2FuqNrmZpR/u0Y2Rwua3ZRG8qHkOEKssNdFvrrT1JSyFiLia8Btg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvHjMlvMU7xk6J9M8lgfKSX/febGeEz58ibiDbvl/sw=;
 b=QW0JBcUnAygCa3KOQLE9DRErtjZwbFM4euC1yi8pGIWBr03jBiFQjAPtMosUWcF1et4L87O6xQOInCJ42615s7GDZTNi9zKYnI/Z8jhYTRz/QoKmR8AvlUR1XLsze3rA2yT93jg+ro738p1RUE10atk2aoMUMsAFRWMAYQMf9TFQBR8v1g8LYuTdOfUwJcsIAUyUoxtkKWCAug7PNAVVKxUNZ8xenKyE2hyQTp9EwE8As/8eC1AFbcOmg6xUe9pIfIZXKucqK/r46PboicEVbfIER3g4Fws5JXTSe2e1iYoYnDLt6stWz55ax+g/mWZuv6+T0t9UAMydJt2REWZwYg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by BN7PPF39B20C1D8.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 29 May
 2025 21:30:27 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 21:30:27 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "benno.lossin@proton.me" <benno.lossin@proton.me>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>
CC: Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH v4 20/20] gpu: nova-core: load and run FWSEC-FRTS
Thread-Topic: [PATCH v4 20/20] gpu: nova-core: load and run FWSEC-FRTS
Thread-Index: AQHbyhwP8hArrQTj7kCvLg1szjAfFLPqLZAA
Date: Thu, 29 May 2025 21:30:27 +0000
Message-ID: <31707e2b49015e52f5b1fe185ea6791538c4034f.camel@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-20-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-20-05dfd4f39479@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|BN7PPF39B20C1D8:EE_
x-ms-office365-filtering-correlation-id: 5c938e11-7300-4ed1-63e4-08dd9ef807c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?M2IxQlpaUGIySnpaMXFJTTh0UjR4WVliOUpDQVdhckhXcUlQYjFDVlljczlU?=
 =?utf-8?B?SXBXQXIyTHB3Y2ZrZFNhQTJ0amVHZXBiUVVUUGRYdEtNemZUNUluZmR6b3l5?=
 =?utf-8?B?dFNBV3d4Y2xsVjFiM2JDRFN2QkdOYjZUWmp4a3phOXZZaElDc1gwdzNXWndh?=
 =?utf-8?B?cXZXcENBbzdWSDBWVlU2TlA0dEZaZ1lSdmZnZEpHbG92V3hmaVROeEMrMmxm?=
 =?utf-8?B?ODRORUx1OWxVaVVERHJ0M3hGd1hsTFVPNi80M21iRVdQWDJyVS9kT1J2dUps?=
 =?utf-8?B?NytlaFRwb042UGhHck1DMk5FU0xnWXhiNWFuUzhhSGJhNzBJVVRUcTFxTURS?=
 =?utf-8?B?Y25qZEZ5ajFHZW5GOHdXeFpLM2VTTFNFbFlzczR0MHA0L2h6KzgxaEJGclNO?=
 =?utf-8?B?c3lrWWZ4aVhWakNKSXRmWjNaaHFtM1dJUlpxMCtpOEZVVjFtOTMralRZaVhB?=
 =?utf-8?B?bEdJSS9VNWRXUjdVOWhEcy91Vkw5WVNTY0RmbHBFV0I5NHIreUtSek5UaENp?=
 =?utf-8?B?RVkvak4rVGtPNGFsblJGajh2SVZkMy83VkQrNVJqVVhxTnhKakUzVUlQWXNt?=
 =?utf-8?B?aXhTRWZ4MFdhZHEyV3ZCdkczYzlQS0pYK2I4R3NwNDQ5M3JHOFExR3FSWS9J?=
 =?utf-8?B?OEFYaDl2V0Z1cnVhK0NhUTVJdGsvMGhFNjVpSjZvZXcxUTBaU1VBYlAzVGNy?=
 =?utf-8?B?aHowM0FTY1pubzMxVnp2emhaSDhwRDdaMCtxdW55Tk5lL0Q0Wm5XM3BjL09v?=
 =?utf-8?B?TGtOTCtNZXFJQ3cxc2hhbDZvd1F2aGlaSlR2K0xpQUVQYXNMMUR4YWdrYkMz?=
 =?utf-8?B?LzVRK2xiY2VoRVRNZEZrSHBqT2xCdmUxSklSbXN2WEoxMkpSVEVxckhpVkt0?=
 =?utf-8?B?MHk1R1lVOXIrWmtUK3k3cG53Wnk0eElLSmw2VVM4aHlvYkZiVUoyVk8xQ0Vr?=
 =?utf-8?B?S1NJbFhib09SSlRBenQ3VEt0dURIdUFoTmMxMlIxeVduSzFxVEp5dmhxdzZL?=
 =?utf-8?B?bUV6bk1VbUxQdk55YXJjZWJsOXU1cnVXSGZ6Qnd4ektXUFY3Q0Zxd0s2bjBx?=
 =?utf-8?B?UWZ5TGFxRXRWc2ViUFFaUnlQQ0poR2dLQ1dVemNsOElkaVRmYUw1OEhrZmJz?=
 =?utf-8?B?TzFNbjdIQitwREVLQ1ZwVFRoRkJ0Rk5aa0ZXL0dmZFJzQjZUendrVVo5RlZz?=
 =?utf-8?B?ZDFDK3FBV28rdVA2UStqdnNoQlBvQWhGUml2ZFYxTGNDWTljN1Y2TVVUK0w4?=
 =?utf-8?B?aHVQQlpLWkVCWXpubXlCT0pzd3BvekZGMWd2b2hDZHIraDltTFZrdXI4MTBz?=
 =?utf-8?B?R3lNNVhIbUJjOVdYYVA5YjRoSk9hTm41NklWNXlLaEd5c2tEbk9oV0RTZkds?=
 =?utf-8?B?MVBPYXQ3bXlRZkNSOUhPVHJkM20wRTQwSUdpZEpma21ONUN2TTJzVHhGUlNi?=
 =?utf-8?B?aXlwWEJZVWdqUE1oTlZkU0lCTFNML1RXSHpWMDdBKzdnSmUwY3oxYUdlOFdC?=
 =?utf-8?B?MUQyR3diMjh1VmUxNFBMYUR6S1FtRnhZY3BLZEhuK3ZvZXR6MHFscW0wazI3?=
 =?utf-8?B?eklnSFFZdEppbEM0WjZlcmU3Y1laQy9sTEpmRTR3YzNvaXRDdjJ4R0tFVHN2?=
 =?utf-8?B?YUd5Ni9wWWFnZnpQN1pUK2V5Y0E0a3MycE9KbU84eVI1dWZHeXBPVXhGWGZu?=
 =?utf-8?B?OG9mNmo2VzJpTkJhYkhXdm9zbE1lSnA5YndlSHBsTFZyejYzNTFIWUhXVEJm?=
 =?utf-8?B?RHozYWUrNThkaDlzYmFDRXI3Q3ZsT3JXYytwV29Ea09TeG96b2daZytxaHQ4?=
 =?utf-8?B?VnVUUi9EdUtHVndrcEJDMUZBaFR5SG9OaVlSK1V1anB1dmVKVW1IWUhoVE9D?=
 =?utf-8?B?UTYvT3hmNStVY2R0VHRwOUhjRWJSMGxqRFBoWmZxRkIzU0FMK2tBYTZlZG5U?=
 =?utf-8?B?S0I3bFBsTmFIM3pSSUJLNVhjc3dwQi9qQXB5OXhXL3F0VzlaRG1qU1hEb2ZJ?=
 =?utf-8?Q?H+Z/mK92Tm22mi8n679oexXymvkMoI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHN3R1FjMXNZM25rMkVmRGlCNHZyNFYzUkh4VGxGZHV4bzNPODlueDhQak5G?=
 =?utf-8?B?OVNDTEt2WVZzSXlUR1hmSTZhOVJzV0xzdGtXaUExZEhsNDJxUjlISjdHb2RK?=
 =?utf-8?B?Yk9SOEI0UFpkeis1NXhPdndDWWNiRkpmWm5Jc1cvcnExcllUY3BiVTVwUXA3?=
 =?utf-8?B?L1BrZFBCZWlmRFpDUExpUS96TTZzSUgvaEM3OFpoSW81dUZjZ2xFb3VVRW04?=
 =?utf-8?B?cjhrVTNjenpkaFk4c1JyYThidHZWbmtFMGFNdk1uT2hUaW9pdU5CQmZYbUpu?=
 =?utf-8?B?WFl0ZkxMb2oyNE9tQjJFbDlwZHVkeC9iWVVPVjJ0MXNNNk5JNUFUTFBlVlpQ?=
 =?utf-8?B?N0ZDQStSQVpITXRPbWdqTlNwMXdsN3dSR29NblRoRmZhZmVybGc0ckdMV0Ix?=
 =?utf-8?B?VzdldnMyRUhjT3loblJ4dldFbHUrZXJCa0pXOENyQXhEUDBJbDk3TjZTR3o4?=
 =?utf-8?B?aEJFdW5jeGVja1ZKVFZHczEzM044b29ITE5TL2EwU1luWU50ekRiVFZYNE5M?=
 =?utf-8?B?V2N6R212Zmd6RmlCZVFtODVHaVhMVkFxT0Z0cFY3RnFQWHFWV2pBUFBUMHV3?=
 =?utf-8?B?NlkrYy96UFF1MEF5TnRHcVY1QWlpNTEwR09kVEEyWmlTOTIxNVlpeTNKc0Jp?=
 =?utf-8?B?aW1ocVRXM1lxak1vdUIwM2J1cWJhR0x1bTNob3NReCtGZm1nRU1mK2Q4dFA2?=
 =?utf-8?B?SW9yM0VwNDE4b1ppamUxUEhsNzc0ZHRhWTMzcG5ZdERaMm44ZDU4VkNLY1Iz?=
 =?utf-8?B?WGlTdlF2Sm1WZHFQemJZM0p6cU8vR3RCaTlTOVZrcVNnbWlqQ25Sd0RlOVpl?=
 =?utf-8?B?bzVFTkVJQ2lMei8vSTQwVWpLMEY0RjN3Q2Q4QU1oY1FpK1BLV2FBYmx4QlJa?=
 =?utf-8?B?bGVneXllOThWYWFTTjZUYVRZZ2dDTVM0dHRld3cwRWZ1NzZUVVJnMWlhZTJ3?=
 =?utf-8?B?Q0tFMFpnTEFtQkxYcDY2dGVqaTEyZmREQ3FqSE5GWStVNGs0VVJUd0xFdGUx?=
 =?utf-8?B?VTVSbU1lbTE3dCtKVWVBS21rbVFyN3c1dHZYV3JCRmpvaDMwaVg0cVVXMVgv?=
 =?utf-8?B?aTNTdTZESDRQcnJvRnFkdkdFakZNWjlKRGhzaFNQb1hQMjYxRWptcnVUa1kr?=
 =?utf-8?B?YzJuOGhLWmVsZEc5S0RGUXdmUUhmVVdqbjRNcUlSQ1lTdkRzRFVBZGlKeis1?=
 =?utf-8?B?UHVZRG0vWUVPcXkxMXBUOTBKaU1qenhoMU44d1oxNm5oSGgvMWZheHhKQkph?=
 =?utf-8?B?M3VpVjdBSi9QdThQT0lPQ21sdWp6clJ3OVRycUlKaUxKSTgxK0F4TmZLVDh3?=
 =?utf-8?B?eHBET1p2YmNYTXFaamVhQmQyOGFkdk96RWRWRFY5b3ZCQ1JlQm1TUTNBVGpY?=
 =?utf-8?B?Q1R6RElRNytvdWVPSGRJNnVSOTd3LzFTdytJV1FhQWZWdFBiVXo3dllPUG0x?=
 =?utf-8?B?QmVvcWdqZHVUOFZFQWhjeUloOXhpYTBwSFQ5T1RseGJTME93YXZlWkc0YzF6?=
 =?utf-8?B?TUlhSHI0QmwzWk1ZdGloU3lrTCtwTWdNZU9TeUNud3oyOU9yNWhMU2VJT2Er?=
 =?utf-8?B?OXF2N20xZEYvSlRWcG1TN2lMVEYvSnliZWxqLyt0ZnpManlISlUwMU54OFI5?=
 =?utf-8?B?eTVWSFRwWTZrZytGT2xybWhuUlZxVXVzUlpSTWd2SnpnMS9jL2p4V3JsTlp2?=
 =?utf-8?B?NEZpWjVTVU55ZlMzK1ltTDZFUTJRbDBlQUJMOXRvYnlUem9OWnc2WWUyVW1y?=
 =?utf-8?B?LzdOWlZiU0dKU0sxM3Mzb0xoV0J0RTRVV1NmRU4vNzRySE1tcGlaMDNCMWRq?=
 =?utf-8?B?aU9lLzU2ZGROT3JMdVN6OXBlbmkrOEVUTUtwNU5XUkRnVE5YTGhkRDZNZ1lu?=
 =?utf-8?B?Tmo2VFF6dTBuZEpqK0V0YVdIOEt4SUdqaDRSTGFFSFNHdzVYdlZPdzNGaVc5?=
 =?utf-8?B?MzNzQWF0cHFLc3FIRWhRNk50OS9oSVc3K3h6SnVWVnJhYVpFdUF3Zjk2TUZN?=
 =?utf-8?B?aXlzKzdBcFIwVTZHTWRUdHhsRWRxT1IvZmJjZ0ZhZXRuWXRaODlWd2gvWTha?=
 =?utf-8?B?MkZhWEtkQ2tDbWdqeTRpTzBlYkJWc09KWFh0c3RLSTNNb2VDNmhrNi9zZUht?=
 =?utf-8?Q?hYalK+RfEa+KnFO1PV2kbwyXJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC2AF7D0A4052B4D8013D10BD8807FB2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c938e11-7300-4ed1-63e4-08dd9ef807c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 21:30:27.5857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c8HFrlRbpgHA68ZynMe7pKS3zfR3rfUTcVJKwaAaiA8jzTlk9Pob4blZA5KUUfxD6mfoi3O7WH8hTZ3zM6FGQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF39B20C1D8
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

T24gV2VkLCAyMDI1LTA1LTIxIGF0IDE1OjQ1ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToKCkkgbm90aWNlZCBzb21ldGhpbmcgaW50ZXJlc3RpbmcgaW4gdGhpcyBjaGFuZ2UgdG8gR3B1
OjpuZXcoKS4KCj4gK8KgwqDCoMKgwqDCoMKgIC8vIENoZWNrIHRoYXQgdGhlIFdQUjIgcmVnaW9u
IGRvZXMgbm90IGFscmVhZHkgZXhpc3RzIC0gaWYgaXQgZG9lcywgdGhlIEdQVSBuZWVkcyB0byBi
ZQo+ICvCoMKgwqDCoMKgwqDCoCAvLyByZXNldC4KPiArwqDCoMKgwqDCoMKgwqAgaWYgcmVnczo6
TlZfUEZCX1BSSV9NTVVfV1BSMl9BRERSX0hJOjpyZWFkKGJhcikuaGlfdmFsKCkgIT0gMCB7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VyciEoCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwZGV2LmFzX3JlZigpLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgIldQUjIgcmVnaW9uIGFscmVhZHkgZXhpc3RzIC0gR1BVIG5lZWRzIHRvIGJlIHJlc2V0IHRv
IHByb2NlZWRcbiIKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCApOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBFcnIoRUJVU1kpOwo+ICvCoMKgwqDCoMKgwqDCoCB9CgpZb3UgaGF2
ZSBhIGxvdCBvZiBjaGVja3MgaW4gdGhpcyBjb2RlIHRoYXQgZGlzcGxheSBhbiBlcnJvciBtZXNz
YWdlIGFuZCB0aGVuIHJldHVybiBhbiBFcnIoKS4KCkJ1dCB0aGVuIC4uLgoKPiArCj4gK8KgwqDC
oMKgwqDCoMKgIC8vIFJlc2V0IGZhbGNvbiwgbG9hZCBGV1NFQy1GUlRTLCBhbmQgcnVuIGl0Lgo+
ICvCoMKgwqDCoMKgwqDCoCBnc3BfZmFsY29uLnJlc2V0KGJhcik/Owo+ICvCoMKgwqDCoMKgwqDC
oCBnc3BfZmFsY29uLmRtYV9sb2FkKGJhciwgJmZ3c2VjX2ZydHMpPzsKPiArwqDCoMKgwqDCoMKg
wqAgbGV0IChtYm94MCwgXykgPSBnc3BfZmFsY29uLmJvb3QoYmFyLCBTb21lKDApLCBOb25lKT87
Cj4gK8KgwqDCoMKgwqDCoMKgIGlmIG1ib3gwICE9IDAgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGRldl9lcnIhKHBkZXYuYXNfcmVmKCksICJGV1NFQyBmaXJtd2FyZSByZXR1cm5lZCBlcnJv
ciB7fVxuIiwgbWJveDApOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFcnIoRUlO
VkFMKTsKPiArwqDCoMKgwqDCoMKgwqAgfQoKVGhlcmUgYXJlIHNldmVyYWwgbGluZXMgd2hlcmUg
eW91IGp1c3QgdGVybWluYXRlIHRoZW0gd2l0aCAiPyIuICBUaGlzIG1lYW5zIHRoYXQgbm8gZXJy
b3IgbWVzc2FnZSBpcwpkaXNwbGF5cy4gCgpJIHRoaW5rIGFsbCBvZiB0aGVzZSA/IHNob3VsZCBi
ZSByZXBsYWNlZCB3aXRoIHNvbWV0aGluZyBsaWtlOgoKCWdzcF9mYWxjb24ucmVzZXQoYmFyKS5p
bnNwZWN0X2Vycih8ZXwgewogICAgICAgICAgICBkZXZfZXJyIShwZGV2LmFzX3JlZigpLCAiRmFp
bGVkIHRvIHJlc2V0IEdTUCBmYWxjb246IHs6P31cbiIsIGUpOwogICAgICAgIH0pPzsKClRoaXMg
ZmVlbHMgbGlrZSBzb21ldGhpbmcgdGhhdCB3b3VsZCBiZW5lZml0IGZyb20gYSBtYWNybywgYnV0
IEkgY2FuJ3QgaW1hZ2luZSB3aGF0IHRoYXQgd291bGQgbG9vawpsaWtlLgoKCg==
