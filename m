Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DD9CCDDB6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 23:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CED10EBED;
	Thu, 18 Dec 2025 22:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ft93n1yL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F4510EBE9;
 Thu, 18 Dec 2025 22:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gy3Pq2t0Xm+3tWD4/ZuaXGcPqQhR1iK38Rk2AfETRqQ4n93xD05Na4lKlxeHgXijtRaV9AFdjaCjmLHoV0oqkOGGzm0QA+fzshe+PXWBRV4ae1VYHvYNhmc9Go5tVeTvxSEzbgsOnMbJROh/HiaHXShxW88HOXiSByDQCSpJuJ4nkbUc5T1vt+bd9r+oSWEkCQAMxieGh7ZsMyys3rlRHSBO7zZidtOrII4zTY8q/7cAum1eVdukByGfb1zkGDPKS2VP68DIXLtTQFMis0VyGTpBTZ2/A4N2sOF8Y0VjU9LT9thGC54qEpYtJOip6tSjkPnLBuSOg1hK8WJIledKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpZwd5+D6bOGj36+kYaX/u6kmGYT3FIIAgG+3kCE0Qg=;
 b=NgmYNPaftkLun4pLqiykInzr3sMx5J9KNG28H8ODiiSHbStC/KTIXXMtVPd1YhtA5K8mF51ANeS3yK2sv8gHgvb5Xmf34yXUJEQnUUrfILVBqKl5VCifnVSBP+nCZrakCCPTLr97s7+a7FIhIzHRGZRyRz7xylrS7fuocYoh18DXZTMW1pgVv4Ndcm5p+ZF+yuk0FgQEkN/MNjeCk/3PSGaderndRSIUM4DnrbyyLJuHyTkin9c2BHDPnIBBtRWWTUhvXzRXunuUMhi1SuoG2jR6uYpx6w3pkeQn7/4oMqDtqbUL7dW6F/j0/W1TWnPAvqgR7j3bY9q9A/qmqrfOzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpZwd5+D6bOGj36+kYaX/u6kmGYT3FIIAgG+3kCE0Qg=;
 b=ft93n1yLE8gsljtYmvgf5vOTohWsldWQkqmVbzzjBPuYlqQumuCvU1dDoIT1G00uJJqNi8/Lm1Eb+j/ZjI9lAVCGT2e3WAFHO7FxX2thSBjz5sj7/84uRhlpm4tCtSJ3Q/rKa9xAln8bLpBGntDjMWLPsovlaCCmaeXcqgYK4Ool4h4S+fZfRWLDciu6p0t5/s6+l+FApuNlwylbBqlaMo54zfG0tFKv5eyD6S/RS7bF2yHxJ1XzGM76DBtfWCAt6xidmPh7RlRaDJ7+bOCHfa8Jql/Owz0xqWtEhZZEVKI9AXgW9+cI70kTkaPbMNsqNjD4Hb2OTItbdyh4pLyfUw==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB6887.namprd12.prod.outlook.com (2603:10b6:806:261::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 22:44:40 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 22:44:40 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
CC: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>, 
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Eliot Courtney
 <ecourtney@nvidia.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>, "bhelgaas@google.com"
 <bhelgaas@google.com>, "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple
 <apopple@nvidia.com>
Subject: Re: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
Thread-Topic: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
Thread-Index: AQHcbkrHLZgrNHAX9U+MOO9nREKCZ7UkZ8A6gAL/6ICAAJiHAIAAAwT8
Date: Thu, 18 Dec 2025 22:44:39 +0000
Message-ID: <F72EBB64-BB07-4FFA-85C9-3EDE9AEE3C48@nvidia.com>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-6-6a5d823be19d@nvidia.com>
 <C890CCBB-76C0-4E70-A7B8-846E34DABECE@nvidia.com>
 <DF1DLWE9OOR6.2P43ATQYNAU3A@nvidia.com>
 <1369611d0014a4e5b630462d66790939b0f564c0.camel@nvidia.com>
In-Reply-To: <1369611d0014a4e5b630462d66790939b0f564c0.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|SN7PR12MB6887:EE_
x-ms-office365-filtering-correlation-id: 3ce4c765-ed20-4034-5166-08de3e87077c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?V3dINGhuK1BST1M1aEF2OHA1YVJuQjAwMXNSRE1tNzF4UHFvZmw4TmxNTTFq?=
 =?utf-8?B?T2tXWHA5ZTRPWVErVHlIRjcvRGRTUVlEQ2Z5TjV1ZFJPVVFSNlpoVWd2VnN1?=
 =?utf-8?B?N0xHa2ZEK1czd1FnOHhZNGdXMm9xUi9yQ1h0VytjcDBpNzJNMStjUyttM3M5?=
 =?utf-8?B?aCt6c1BQSlpQWVNNSDF5VVNEYmFFaHBqdHcwUHpjTnJyYUpBK202Y0FUMWtn?=
 =?utf-8?B?bW1oWGwzZG9VTlVDeTFzVHA2QTR1K2c4aHlpMDA0amtLRlR5SUI4a1hLUFpZ?=
 =?utf-8?B?UlhidkJCRlUvNi9XbWFIaTNoTVQ2aXdHdTQ5ZkVnWEtrcVJVcHVOakVrM2Rm?=
 =?utf-8?B?VnVKV0ZIMTVtWDEyY3BMaUZnZWxyamt1N1hTSjJ6cSs3dU5Hc3ZhM1hhaExZ?=
 =?utf-8?B?K2JRdzlpYmpQN3NEUGxmOXBjTjA4SEJSeEVsdVIrVGhGQ0lyazcxcGNvVWJr?=
 =?utf-8?B?TEZybEJnNGhSckRrcG9iZ0Q0cGI0TldPbldCaVpEU2IvUU9vMHhPemZlSWU1?=
 =?utf-8?B?dDlDSHVlbUZvWGZBWjFKdG96LzBuc2JadDluZFNscDVLYmhrN3dtZzNBUGF5?=
 =?utf-8?B?cjRiSGsyQ295bVpGR0p2TmlCR3JPU3dORGhlZDhDeXduSmlncU1ZaDJKc1BI?=
 =?utf-8?B?ejRid1F5TFNGM2NvQ2VtU2l3TW1LL0Z2cFhSU0lTSkFVZWxKSTBYOHc0RkpF?=
 =?utf-8?B?TEx2MGR1ZnVOLytaRmZnK25YaS9vbWc3T3h1RnhvY2htMDhiUmlOVDBMaEUz?=
 =?utf-8?B?RENyck1pVU1CUVlraHFIdHlkU0FweVpBK3UxdHdPV3U4WkN2ekh5ZzkwWSs3?=
 =?utf-8?B?WFRodWtkSEJRUEtjMXBSRmRQOFplWThVR25vSTcwL3ZyVG1pMXhOUDcwcDlz?=
 =?utf-8?B?UkEvT3R0c0dVelFzVWtCT2FPU1UxWHE3dFQ3M3BuZklVbjgrTVNLSWh0T0VV?=
 =?utf-8?B?VTZWcFBHMFRJNCtOYWxXTlNjaG9DZkxDNGtXUmFibDNjU3BJMDcwbkpHbjVI?=
 =?utf-8?B?YU1vSFhIVGgxMXMyazFndzIzUnJwVHBnUi9VSmo1TkJ3dm4yNi9NdW9xdE43?=
 =?utf-8?B?UUlvUlJKeEtsWjJTS0doWWlmV1R0M3FrNGZ6Y05kSXg0N3k3ZVJFRzlweWl6?=
 =?utf-8?B?Z1BncG16QUxnRVJzNmZyUnJWdU8xSk1yV1ViYm5EWThDV2JLTk12ZnJnZEF6?=
 =?utf-8?B?QkgxNDVPVENaVHhISFhkL3lNaExvRlJ3blJzZHhIbWdCeW1GUE9OQzZGTFQ0?=
 =?utf-8?B?bVVPY2JIQk5ESjA0aTdFNHpwNTVRbGdsbk9SMTJDTjJkbTBOcWp1WFgyR3Vs?=
 =?utf-8?B?NkZDSGExZ0pDYm1ZSHVyRkhMak9Zdmk1N1Nnc2ZiOWc4SUUxeU0vVi8rcE1j?=
 =?utf-8?B?TjFWRW5jNVp2aEgxeHlaQm45Y0ttcjhpTG5LNmE1em1NcUg0OVV1eWdJeUhl?=
 =?utf-8?B?cC8wTGx3UDNwYys3c2YyM0xBRjRhZElhdHozSlNlYi9RSGZsVU9sempVaW1m?=
 =?utf-8?B?WXM1c2xUcHVoY0dHalNnb2pKSEp5QXVXT3BrYTlGWWRJaFFpTkU5NzZueXFh?=
 =?utf-8?B?aXJ3bHlXbnRRNDBvaUxNazlKTS9IMlhrcm9PWUVzMkxkLzhPM0FoZjdwN3Rm?=
 =?utf-8?B?ejVaSlpnRldkbXptTWtjYzVGVU56MW1kVWZNWkF4SXZuRi9NWlUzcmQrUnpL?=
 =?utf-8?B?N0hQQVpIRVJJaTJqNDY2UFNKYkloSllHZnIrMld3ZnAwNXFjUXdBMjB5bTQw?=
 =?utf-8?B?VVIzOUUva0VQTWxXSGk2bWVnMU9XWGxQOVBRTDhETUdRMVBWdTRuRmExNEQx?=
 =?utf-8?B?RldFeWRHSHJrRVVYeHA4cEc0eitxd054SHNFdFlGYzA0VmxHRVhPalVnZXpM?=
 =?utf-8?B?bnpXMklqSWhWOU1tellyWUs3WkM3SmVCNTdHZUx6eFY3bEloaHlqYlNCZzFa?=
 =?utf-8?B?RDVFbVVjQ3h2djc1ZkxHQ3hwek1jTHN6RmgrUEZobmt2N29YVVBzU1l1WkNx?=
 =?utf-8?B?ejZBMXM3cXdsL2FQZVVYMGtUZUM2NVUxWVN5SzVLRE8xSHRXTmN1RDZCSmhT?=
 =?utf-8?Q?sTlMaK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzBMOUFLTlJETkk1QTRaanQvREVteXpRbGhybU9rNGFGbmhCd2pLbnd6dU9S?=
 =?utf-8?B?a3RYRkd5em1xMGJ4ZTNJckJEM3UxaVZ5djQ1OUpzZGVWa2FSYTNiZDlwSzhO?=
 =?utf-8?B?ZFNSL1VhSGw1N1dqc3lveXRhRlFSTG13N1hZRUk3SGhhVzFPcGVpMkhtUTU5?=
 =?utf-8?B?WFVSSGNBV0pET0VtRHArL09kNzYzZHJKOE1jak5pSUxaL01HTEdPMjBEYS8x?=
 =?utf-8?B?Y2pnYzA0QzBWTnlxSFUrSDVrZ1FvUGRzckdpM3FpSGd6ZGlvUnFHNy9NandV?=
 =?utf-8?B?SHBKNFpFZmQ0bW55d1U1VWw4VWc4S01zYytyMWpSUWZ3WU94SGszOWU2ZVFs?=
 =?utf-8?B?b0Vqakh3Y2RJZ0g0NDVoSkZUK1JIQTlEN3dkNkNnV2dJUUI1QVFMUzd0TlZS?=
 =?utf-8?B?YlpzNllsZnovVitGdkZDVDdXc05DTkxNQ2ordFkvTFFMS1dMVk5VdE51Mi82?=
 =?utf-8?B?eXpJalg0VEc1UUhleGdydXJ5ZGVYVFhqNk1qVE5JQ0xMOTJab1pPY0tlUmw2?=
 =?utf-8?B?Ulg1RUVzdEpLK3BVTXVOcGNaL1FIU2ZFekRzZFhiblgwbk1BU0pGQzdEa0hH?=
 =?utf-8?B?bTdhTk5KNWNVdWV0ekVvOU9xQUMzTHJRM3NNRVVxdmQwQjcwMy9aaU5sVmZj?=
 =?utf-8?B?L0RINlBCNHRSemkwcFRPQVovOFJnZEpIWXBUNnhiZHdoeHlhU0xMNC9oZVl0?=
 =?utf-8?B?aTNhK094alFiSlkvWVR6dmNPNEd5bkNyc0tIT2ZzK2l2OVFHdnV2RXpuVkp6?=
 =?utf-8?B?L0R3VW9vTjhqTW1yVEsyY2NNS1c4RE9KM0tUbWRHeVJycjE4WkVldytKdE9p?=
 =?utf-8?B?VURrTjFvSWlmL29RN1BndjFqRUdNRDR4cG1XTDlxWDlsT3FOYm5VelRrSjhj?=
 =?utf-8?B?OTVtWklsdXNOK1NXRThtU2lKN213RUxDU3VQKzhuUzYzWWFSb1J6ZUJFbzRU?=
 =?utf-8?B?cG9yQlo5UmI0S0lXUjVncFIvcmxVcDFORy9LWUJsQXl0Z1Q2YjJBL042dUJG?=
 =?utf-8?B?d1VObGxjMTYrNFhEeHFWR05zanQyWFZtQUJLT3VoeFhrNEk5UXU4MHZRMHBy?=
 =?utf-8?B?YU91RFNQYTUvOTVndVZyb2lOQ1hWTDFaT3Fua09FWk45akdrVzFrMHpMUUhz?=
 =?utf-8?B?Y21jTEM2T3FsZWpIcmVTVlFlaTFxZTlWQ0tFVzRhUkRxSzlwcDJhUTZxQ2pn?=
 =?utf-8?B?REl3QThna0U0b2pFcmVkN1MrNGo3WEFjb1YwUlU5QTNVT040OWVwNXRqSjVG?=
 =?utf-8?B?S1AwMEFvOGg5MFlVMjU2SlhwY3ZwbHNORXVROWtNaDB6WFc0ZnpoSWVZajl6?=
 =?utf-8?B?Tm5ReGd3dlBFcUM5b3hMSjB1L3ZGYmVSdnFwTTYzZUt1aU50ZEpYQzR1aEgz?=
 =?utf-8?B?OXh5L3JaN1Y0eFBJSy95OTFybDNJWGdIMUVhZGRUOTVJNUZVL2FSRXYyVnZI?=
 =?utf-8?B?VkwrUVp3b2dIVVdoSm1IK3FmNW1CT0FoVTBpdjVuUW41THhTZkxoYmtrUXhn?=
 =?utf-8?B?Z2RSc2FYZkFSK3VSODNPVjRxL2dWMjVOU2d3ZlN3dkRSa054MlhrQS93MkVR?=
 =?utf-8?B?YTY3aURvcmMvMTU2V1ZsQ2lyZkxCVnZVMEhvZlFzVGkvZjRmYkxjd25ZU2tT?=
 =?utf-8?B?V0tnTzFWTEdOempXeWJCUkJPYS91NnVWcWZ0d0RCYWtLR21YTVY2Mkk2RGk1?=
 =?utf-8?B?MFZmSVRFS296SHdiajRvakVBc2JydWJMVHZoN0o4WjNUVkZmaHFWMlQxOEsz?=
 =?utf-8?B?TkhhS3hwM2lSWll0WkU0SmpiSTBIcmg1c3VqMjFtMlB1K1BwNFZHZGx4ZFNF?=
 =?utf-8?B?ZitXTFZJQmxhd2ljZkMwaFowTlRWbzExeFBWSmN5d2ViVGtISll4WW5CeEt2?=
 =?utf-8?B?VEFVWmZiZjI3bUV3aElVS0Y4b2tROHgweWdqTkZid3BiNExVRkFJSW50enBK?=
 =?utf-8?B?U0hINlUrd2dOT2hRd2hDUko0VXlTbUQzWFNjVjRrU2FzaU9Uc1dTaklQMkVx?=
 =?utf-8?B?Tmp6YVNyMS9lNDB5ZGFxQ20wYzFYMFJEMXdMdGVTYnRtTS9sS3p3eWNpbGVF?=
 =?utf-8?B?c1oxUHFvT1pBaEtJSkZPWWFuKzdUZkZ1UzQreVViVVVVZE5ERkRMeWZYQkVx?=
 =?utf-8?Q?BwvZDa/8yzXAX4+fgppvCVZbt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce4c765-ed20-4034-5166-08de3e87077c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 22:44:39.9605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PphX4qOPUsHa9JgIVr2HH08o8uMJOgbU/+MxocSD1LKkSC37HxY9CnkwVLmr507FJ2h8l+UTAdIz7n9qYxEPFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6887
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

DQoNCj4gT24gRGVjIDE4LCAyMDI1LCBhdCA1OjMz4oCvUE0sIFRpbXVyIFRhYmkgPHR0YWJpQG52
aWRpYS5jb20+IHdyb3RlOg0KPiANCj4g77u/T24gVGh1LCAyMDI1LTEyLTE4IGF0IDIyOjI3ICsw
OTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90ZToNCj4+Pj4gKyAgICBsb29wIHsNCj4+Pj4gKyAg
ICAgICAgbWF0Y2ggY21kcS5yZWNlaXZlX21zZzo6PFVubG9hZGluZ0d1ZXN0RHJpdmVyUmVwbHk+
KERlbHRhOjpmcm9tX3NlY3MoNSkpIHsNCj4+Pj4gKyAgICAgICAgICAgIE9rKHJlc3ApID0+IHJl
dHVybiBPayhyZXNwKSwNCj4+Pj4gKyAgICAgICAgICAgIEVycihFUkFOR0UpID0+IGNvbnRpbnVl
LA0KPj4+PiArICAgICAgICAgICAgRXJyKGUpID0+IHJldHVybiBFcnIoZSksDQo+Pj4+ICsgICAg
ICAgIH0NCj4+PiANCj4+PiBUaGlzIG91dGVyIGxvb3AgY2FuIGdvIG9uIGluZmluaXRlbHksIGxl
dHMgYm91bmQgaXQ/DQo+Pj4gDQo+Pj4gRWl0aGVyIG91dGVyIHRpbWVvdXQgb3IgYm91bmRlZCBu
dW1iZXIgb2YgdHJpZXMuIEJvdW5kZWQgdHJpZXMgYmV0dGVyIHNpbmNlIGl0IGhhcyBpbm5lcg0K
Pj4+IHRpbWVvdXQuDQo+PiANCj4+IFllcy4gQW5kIHdoYXQgd2UgcmVhbGx5IHdhbnQgaXMgYSBt
b3JlIGdlbmVyaWMgd2F5IHRvIGRvIHRoaXMsIGJlY2F1c2UNCj4+IHRoaXMgcGF0dGVybiBvY2N1
cnMgd2l0aCBzZXZlcmFsIGNvbW1hbmRzIHNvIGZhciAoYW5kIG1vcmUgdG8gY29tZSkuDQo+IA0K
PiBJc24ndCB0aGUgcmVhbCBwcm9ibGVtIHRoYXQgd2UgYXJlIHBvbGxpbmcgZm9yIGEgc3BlY2lm
aWMgbWVzc2FnZSwgd2hlbiBhbGwgbWVzc2FnZSBzaG91bGQgYmUNCj4gaGFuZGxlZCBhc3luY2hy
b25vdXNseSBhcyBldmVudHMsIGxpa2UgTm91dmVhdSBkb2VzPw0KPiANCj4gICAgICAgICAgRXJy
KEVSQU5HRSkgPT4gY29udGludWUsDQo+IA0KPiBUaGlzIGVmZmVjdGl2ZWx5IHRocm93cyBvdXQg
YWxsIG90aGVyIG1lc3NhZ2VzLCBpbmNsdWRpbmcgZXJyb3JzIGFuZCBhbnl0aGluZyBlbHNlIGlt
cG9ydGFudC4NCj4gDQoNCkluZGVlZCwgZm9yIHRoYXQgd2UgbmVlZCBJbnRlcnJ1cHRzLiBGb3Ig
dGhlIHJlc3Qgb2YgdGhlIHBhdHRlcm5zIHdoZXJlIHdlIG5lZWQgdGhlIG1lc3NhZ2Ugc3luY2hy
b25vdXNseSwgd2Ugc2hvdWxkIGJvdW5kIHRoaXMuIEhhbmdpbmcgaW4gdGhlIGRyaXZlciBpcyB1
bmFjY2VwdGFibGUuDQoNCkludGVycnVwdHMgYXJlIGFsbW9zdCBoZXJlIG5vdywgY29uc2lkZXJp
bmcgd2Uvb3RoZXJzIGhhdmUgdXBzdHJlYW1lZCBhbGwgdGhlIHJlcXVpcmVkIHBhdGNoZXMgZm9y
IFJ1c3QgaW50ZXJydXB0IHN1cHBvcnQu
