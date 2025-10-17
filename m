Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1168CBE61FA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 04:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E20E10E0F6;
	Fri, 17 Oct 2025 02:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NVNVGl6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010046.outbound.protection.outlook.com
 [40.93.198.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4E410E0F6;
 Fri, 17 Oct 2025 02:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbFY4nrlEr7mC+MOv0TR0qzLY6Y/qdlPhKcMfePdwocnMJ95z3QBWwIsfLxAdXFsp++W4HfD6TmdCddzww0+GCjPo3J9GqAZEmrl+8fVfaTlj3iEpC/2ziHT+2gyxMfDOHFxRXo5w2cRpMJkoZrGdz8BlEVl4ZYznbVPdcSxQlLu1Jzo82LJF01+HYY1hLLilxKEL6txlqkZIeV+b1e9gLsLEmMC++PyAVLpsmVZZPNHZoEnIgceszQQQQhIXiR3hxcwuE8LFjpfJaTKUVtWEQGRFIW5UE2ZqMhoF3fI1OY+cvVRSANsuaAerU1Yzlx0mMwXYNvc6tlaD9QsWluKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJI1Eh18uLYv45Bch+5J9eW1WAoAUuAcuNkf/fTx57I=;
 b=N6g0uXEpcZrEJ3xyeYjUPBw8V22TOaeh9i5cNrZpxvi6b402eTQp/IP6tVNYiIuAg9gVTiBQwelHuAuuEwMZJCSn6yhvlUB05gdbfDSIHEgYqOfNZxaQIB3CcIb7sIrh2+C+Ebq2/dEvXVQNKEV7hGfufS7T2gJTvI75Qg9RufLt5s/uQq4+xkoHHC7C+k872mrysrjhvRh8qlBah20eRcK5zZZe9dz7jXIPkFSNgtbUtUEbaH6XIVq4gbWctmJeyFdLZtz7uvq+k8PiYpF4C0RpROTww1K2AhhAknWxKceAcNrE30i2nSjwPhCb6XcETPL96U8p1Uq5ONbIlVrX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJI1Eh18uLYv45Bch+5J9eW1WAoAUuAcuNkf/fTx57I=;
 b=NVNVGl6c/R0PDIBxfwEQMjPWEJ47kpXo0qxv7G/Ao4Bo5CKXgjEHaCsdDA2Y2jq6VaeI+MRr+uSUMeH8q30+ksX53QJs3h2yGoJaQglaJqbW0Bd62qQW1MsO5OGiNuaMbHLPl0wWQ2AWJlgHDtHAM1WCo04as1ggb5CgxfLNKcQD0GyRnpZkzO5NrYHH6KBfgjnfebXHoTXuGb8t2PoHgs/avTAbLEkI7EglSjZcT3NLno8mi6akn3ZUqSAeQW0G9xZP0ZC/DD5V1mjT4f3DRHglfzAGkE3GlXNP7UQu+PKlTnMyb/A2A0APbo8LWTcuiLi/R1LE+MMU6hSvekAJvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB8801.namprd12.prod.outlook.com (2603:10b6:806:312::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 02:43:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 02:43:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 11:43:42 +0900
Message-Id: <DDK92UVGWKGE.2LEEVWDBRGVMC@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: "Yury Norov" <yury.norov@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Timur
 Tabi" <ttabi@nvidia.com>, "joel@joelfernandes.org"
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Edwin
 Peer" <epeer@nvidia.com>
Subject: Re: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move
 bitfield-specific code from register! into new macro
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <20251016151323.1201196-3-joelagnelf@nvidia.com> <aPEv_UO4vViOcOvN@yury>
 <2CF462DB-D2C8-473F-9D70-522E6AFEDCE4@nvidia.com>
 <DDJZY40SO5EF.2066SEKKQ4U8I@kernel.org>
 <e4f5ca12-bf67-4b48-97a1-7ab2c771056e@nvidia.com>
In-Reply-To: <e4f5ca12-bf67-4b48-97a1-7ab2c771056e@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0085.jpnprd01.prod.outlook.com
 (2603:1096:405:3::25) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 752f7072-fb3c-4458-f512-08de0d26fe48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlE2QVVjVk5WMXdzWVVwOHBuR0dGZzFXcDlSOFZEeEhLeVJNQlppTDE2UFR5?=
 =?utf-8?B?Z0tVd2NZYXE1VWowSHpwdFJCNnVzYldvL3FTR1VTT2s1dUNYZnFCZlpuUS9v?=
 =?utf-8?B?NGMvSE1KYzVmYlNNbDFBc2dYcHl5TExpRmw0T1dDbVVkb25paE5iaWN2cndN?=
 =?utf-8?B?Mlc1U1BudUV3bllqUUhZWFdyL0VsNVpQWUJKdnVCcFQzendxUlRQYnpKYXl1?=
 =?utf-8?B?Y01oakdmdjVyZW5iZlVCY0Zvb2RXdnVNUlpOR3BDYVdPSzBudkV2a1pWWGdO?=
 =?utf-8?B?RFlWbGRsYk8zbDcvVE1MQks1aG83eDM0M0pnRElKVWxLa1hhUkpFNVRyUWtB?=
 =?utf-8?B?Slk5RGh5dWpYUzR1TlFoM280bU91K0lEa1RRTXZZenpUeFp2c2NCOTQzaFY0?=
 =?utf-8?B?S1psTkZ1T0pjN2VnQllmd0dSaitWa2xzaUhsL1FZZ3dodFZ4MmlYZHhOQWxi?=
 =?utf-8?B?ZTJsQkxCNDVMbHpYeUlOdlBEb0s1R2kvdzk5WWs3Ukl0b3Zldlp2eTJ1YVh2?=
 =?utf-8?B?RkNGZjBVb21taHQ2VGZxYVlxUzBmdTErdDBBeUZXc2NyODZsK2JUeWtYQ01M?=
 =?utf-8?B?bUJ2Sm03ZDkvc2E0bFI2dlJWNEdlbGI5dVdrQ3FTNGRVRHhtWHNQRzRWODlN?=
 =?utf-8?B?SG5kaDlLQkhiaENpK0N2YVJuQmZzT1lFSTNIa3NQSzZReFg1YjdGUW01bjBp?=
 =?utf-8?B?aTFtZlVhK3pqUUl2VEhVVUsxZE9pdVE2NFJLYUZ4N00wZ2txM1Y5L0ZrWFQ4?=
 =?utf-8?B?MFBIY2diY1FoeFplUUYzOG9XYWpRWUQ0WnJYRFBjVWdIYkFIUHJyenhBNGFw?=
 =?utf-8?B?dlVHaHBVSU9hZkV5VWJuN2VTSzdDTkw1clFsdHd6Smk5dmtWSkplRXNENndu?=
 =?utf-8?B?bzBXVTUvZ1ljeTNlenNEakVoTWRvTFMrQ3pFdmRuQ04vMG1FZ09zZFdQYWov?=
 =?utf-8?B?UWpyaEsvbXduYkVoRHRvaFE4QTB4R0NJc2hZR0FQaHd2UG1aWVJMa0lEK0tG?=
 =?utf-8?B?OVVLQ0x1R3ArOEFFeDBHVGtydGNVZlZpcnVKam5xSWtvVENKU2c3TXNOSi9P?=
 =?utf-8?B?ZU4wSnlyZGpVRkh1L2R6dDA0U2tDeitwRjJISU42WTZRdXlTenpuc2JOK3hQ?=
 =?utf-8?B?V05qQ2NtUlY3RklkUzAyUVJmbmQ1eWRvZk1lc1Z6STc2NXgrNU1BSEc2bFBM?=
 =?utf-8?B?cW0raXg4aGVFSW95MlNTei9ESThyTUtWUXI0a3pSRGxIY1QvZ3c1RkcydFU3?=
 =?utf-8?B?dUFjcDdsamtYSjVLRkJ5a2NGQmlBelRTMkREWm9JUmdCSUFxQWNGSld5RExt?=
 =?utf-8?B?Q3N2cC9DMjhzWCtzbFV0UzhWOElrODFDY21CSW9Ja3lNSk1IdGRUTEFFT3RN?=
 =?utf-8?B?bWl3bFk2eVhlcmZVL05UdWxkaURvNHNFRjFwQkEwZ1BGYmg1SWxpYWtuYlpm?=
 =?utf-8?B?azMyRndUUjcrZk5EUGU3S01HRTljNlJNSHFZVzZFaE9DQ0diU29BV0FFZjhv?=
 =?utf-8?B?RDc2YzE0eHJlYjd0aEFrbStNSjEyNVNVMmRpYTQwZ2dJV1lGODlFUjBLWkwr?=
 =?utf-8?B?ZkJCYnFnZUVoN3MzVytzRUppcm5rRGZuckdBTVp4emRvbmlPZkM0WFZLdTM4?=
 =?utf-8?B?WEY3eFNHa0J6WWVLN1ZnMlF4TGJ2amNGN08yOS9aN3dlbitWNWw1T2M4bHc2?=
 =?utf-8?B?Q0xxTzB0ZmN5Mnc4cHBLZmFQRTJoaTNLamU1U3F0UDR0VHNXbUN5WDBPbGYr?=
 =?utf-8?B?em01S3dkVXY1SVlXREhTODFmekVVY0tRc3BQY3p3djNjUXBXMExTemlPdmZh?=
 =?utf-8?B?WFFJMUVsN3dqQ2ZCMVp0cTlBNGI4UHYrdkxUVzhxaU4vQnRuQ3FUZkRoSFFh?=
 =?utf-8?B?aFIvMzNZcDVuWEE1Tm12VytCT3NDZ01QV3QvVy9RQkJBT2JXU3k3UDBsWDhH?=
 =?utf-8?Q?CGp0OaLnzeNpMc3GbFHP8MulhFCGvTdR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZERJUG5yVmE1RzVEY1RSeEpEUDdYYy9URzZtUEVFU3ZFM3pISDRXcy9CekxE?=
 =?utf-8?B?bHczeUFEN2NCYVZtR1ovYjJwZW5ITmdDMmdZVERUSFBHWHVLaDZGSXEvMTNN?=
 =?utf-8?B?UTBmNFYrSFBCQVp3QjFTeWUyV2Jjdll6TzIvcEVoM2FyZ1doeW5CTFp5QXJv?=
 =?utf-8?B?MEF4UFJKMzh4QU5QWTdSSGc5WjVBOWVxcFVnaWJSd1d2aUNxTWxQb3lXOUpZ?=
 =?utf-8?B?YXBMMzM4VkowM1J0Mi9KMzluSGRzQysrRmhHZ05obXFwdXJpbDBVMGMyQXd2?=
 =?utf-8?B?c0pOTnlySjlnMlFuVThNaHl5LzR1eUw2ZU1GWHhBR2hQSFQzSjAvYi82NUpu?=
 =?utf-8?B?L2M3TnUwY1BGSnhFaUpXZ29BZ1duT2RDQzhLY2ErYmE5YkdQWisyYndPZVkv?=
 =?utf-8?B?bWNVcmlMWktVd3pNVjVRUHQxdW5JN3pCTkpqaXc5VUluNW5BUVJEbUpLQjNm?=
 =?utf-8?B?bjNWOXFQOG5lNWNkMkpzUDlDRklYWkMvZmxEZmU1eEsrUnVoRUNIR0tPWmFX?=
 =?utf-8?B?emMyZE9jUDlWSmxoQllocHNNRVl0QmI3MXgvdTZWUHd3U1VzV3JvNmFTN25U?=
 =?utf-8?B?eG9KQWpiV0lEWGoranlIeTFZQUNOQ1NwVEkvTytySmZqTDFKRmhwRjJTTjVt?=
 =?utf-8?B?U3lKRHdtbjhSYUlOMUhWaTFZMVg2NVI1dkg4dkttM2dCVDdjQmltVVZrc3BR?=
 =?utf-8?B?WWFTazRzakkxOTlKdFZrWTJtQm42WlBJano2OXZkY2ZKZEIzYi9RYVplZ3E2?=
 =?utf-8?B?NnBrV04zU0w1ZG1mNm13dXVRZWpPY1M1Q3JyT0pHZmFzM3V5RlBFckpFdmx0?=
 =?utf-8?B?N3VESFEyUk1zRFZTbnFHOGErMklwZXhDU3k2L2JDSmNDbUN0NjhaYnVtZ2Yx?=
 =?utf-8?B?MU5KMlRoNnFGaTR6WUJ2MUlsb2xFNGJmZmc1VHZiZGZrVnA3WTJMVWwvb29Y?=
 =?utf-8?B?c29YNHVwakVheFBxOUhWb1pzZzYrV2krd2tjbVFwcVYwRHpIZnRqSkQ0SENH?=
 =?utf-8?B?b0FzSnZSNXE4OE1GNkFjbFhsaTIzellqblp0REhuUkVndFYwUHR0YVk4SUdC?=
 =?utf-8?B?OUZ6aEgwVWRpU21qanRFRkJib0NZdE5nZDVoM2VJalczcG5NVVVNSUZPQjdG?=
 =?utf-8?B?a2llb016NitORWRGelc2MExodnUxYjd4akJKRFV0WXoyenhDcWFOczE1eUpM?=
 =?utf-8?B?ZUVvQkZhNllGNnJNZFNLVHkyUVN5MmNoRjFyMkN1NWtOcE1kY1BjRXB6SXY2?=
 =?utf-8?B?SkRUN25xOTdDVUZYL3dDUmY2bTk2OXc1Vm53VCs4VU5HaS93MEhjVmpWQVZI?=
 =?utf-8?B?ZjY2clZmaVRIb1l4ZlVZU0l3TVRRYm1DRDNWQVAwRmV5QXhkL1dyWDhiS2Ux?=
 =?utf-8?B?L3Q3TUpmQ09zN3VBbWNNc2xVMUlTSkFXMFc0TG1KMEgxTE1pOFlHY0lvYTY0?=
 =?utf-8?B?VUpUNlRscTJpRWRVUUtBRVo5TndITFNYZ0x2Slk0N3pnck51KzIrOGFNVGsy?=
 =?utf-8?B?WUh3VFN1M0RZN3drZHJhdjhsUFl5WW9mczJxaU5mckNQbW9wMU5aQ2lUMTMv?=
 =?utf-8?B?a0JUNFpudlZ6RGRnR0NOdlVmVXpRenB4b3ZubTc4eEpQZ000MThXWS9Yc2lK?=
 =?utf-8?B?T1VhMExqZHJvUUdjdG5WRlI2aVpuNHdNSWVDaVZ4WExDTEZZblZxOGZIN0ZU?=
 =?utf-8?B?NERHWnB5R0FJTEcrODRFb1psU29zaE94Zzltc2ZJNE5iQkNDendOTXlXQ282?=
 =?utf-8?B?Z1VXRndKRk45SU81cmwwWVIzTjBPb3dibjVZc2g5M2N0V3c3TzdOa0pIOXdW?=
 =?utf-8?B?bElhZXNBdi93Q2pTUmFLR21rcjZUWndEcVk1WU9EQXRSWWFSREY5d2FjV0V6?=
 =?utf-8?B?RXhjbTZoSEMvakdtMEczdWNvQlBnUVZHQjVMWFBHY1hiWi9OaUNBZXpvRHh6?=
 =?utf-8?B?RVROZFZHUnEzZzFtVFVoRnF3KzZac3NlV1Y4UUhyU2RFUHY4Z2N0alUrTkdT?=
 =?utf-8?B?ZWJ5VGhDMlpPaGVFSTgwcm1XUEFBdzJoU0dDQm8vdEt4OFVhUzlCYnArTUV3?=
 =?utf-8?B?SGh6S1RRdC9xY1NQUk1WeDZmMFZ0bm9yeGgvdVFkc3ZEUDNKMmprQWhBcVRi?=
 =?utf-8?B?RmR0RmQ2SlhCRnlYcW10TWhVc1I4dTIyM3U0ZlQrb0FkL3ZmeGVUZmNxaTFQ?=
 =?utf-8?Q?asaOhidF9d7zNgFXvdL6OLvEa/zlYI9imY9p+eh/zNyb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752f7072-fb3c-4458-f512-08de0d26fe48
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 02:43:46.2201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeCNqfFFcWxtojMXzz+FJzeH6tSk+VpPSAcWE7knktOMUVvrI2gMgsU5JYYYtFjGMOyXHQYePR+mOfFGPfNZ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8801
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

On Fri Oct 17, 2025 at 4:39 AM JST, John Hubbard wrote:
> On 10/16/25 12:34 PM, Danilo Krummrich wrote:
>> On Thu Oct 16, 2025 at 9:28 PM CEST, Joel Fernandes wrote:
>>>> On Oct 16, 2025, at 1:48=E2=80=AFPM, Yury Norov <yury.norov@gmail.com>=
 wrote:
>>>> =EF=BB=BFOn Thu, Oct 16, 2025 at 11:13:21AM -0400, Joel Fernandes wrot=
e:
> ...
>> While I'm not super opinionated for general bitfields, for the register!=
()
>> infrastructure I very much prefer the hi:lo notation, as this is the com=
mon
>> notation in datasheets and TRMs.
>>=20
>> However, if we use hi:lo, we should use it decending, i.e.:
>>=20
>
> Sure, descending works.
>
>> 	bitfield! {
>> 	    struct ControlReg {
>> 	        7:5 state as u8 =3D> State;
>> 	        3:0 mode as u8 ?=3D> Mode;
>
> And hi:lo matches our HW reference manuals. And if you're dealing
> with bitfields, you are often also dealing with HW, so this is
> a reasonable place in the SW to use hi:lo.

Definitely agree here. The use of `:` is what makes the difference with
the GENMASK macro, which separates its argument with a regular comma.
There is no room for mistaking these with anything else.
