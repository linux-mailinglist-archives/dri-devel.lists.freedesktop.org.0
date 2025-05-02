Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8498BAA7B45
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 23:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690EC10E1ED;
	Fri,  2 May 2025 21:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ff+mt9VV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FF210E1D2;
 Fri,  2 May 2025 21:15:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0be6zIy8xlzHknkTCtidXtapdgpVs2WDcLngcluHT18PlX9vZ0wUCW37cPdsluigRZ7Nfv1TJJQQRORnMc/n5iQB5qGFxBOfSDEnH62+4EEwCtJa0JWi9Vme7n92Inv7vDzPrqZVUWmpzceA028kWwcSoaoFCoIRBTgmxE+0xeexUbHLXvv28xbWMLE4KC3bQMM+QW01lXeiLIr0RuAPytGXzNGQRp6P9FR69EXpcEZlMhH3PaGW7i7F9+BsVP4Bu3K6NOeYcoCVYdWGHNosniFZVS3XIRJoE5mtrrwewxLVMoa8vfmL7ld6NXsg6SNx9t/2i5KKzyNd+a2+SSxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJk823orw33Km555LuaMFbdWtERbUqXlNJQWtIFOy+M=;
 b=GO7bcauPaZhyQeGLKoIPAsPytudE7oLJGoL4Ldd495quc3X2fO02N4du5bJ9SKD5wGuy/4ciU1xht6/GIABZm783NQr+FvTkQA71Xb5YcNnjLAIECB9HJufU7ckNdbncTGqryCDiAsVHwtVoYyuuQfan6Bf9fk/CfQU+10Qe6ftLPHrbl8Xr5PINi6XtWvuSZOArIVG10s6G8pMZm4dHvFkxNP7UfmE/vekCIlM1YtNZPEL5el1omcKd0RKCQNTdznrArGRbclzz7nHERxWpX+aEkB3OHw0aDs9IWlZOt3yIKMy545WFLTM8E5Uf5r+9glTOVnleo8U8mfy5b+NtTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJk823orw33Km555LuaMFbdWtERbUqXlNJQWtIFOy+M=;
 b=Ff+mt9VVxtF0WM4lLepAu0izqAp6prvwrtB2rDJhN667fY1+EJHWixNL5lmKUgJU7Zv7+uRNFSvMusbA3nP7sgPh8lUD3QzV6gHdwARWNd0VFAHlcsv4pbPAw2DmCvk8I1yoreQT5HSKxPDLCaaKFIPNsdp7t98mFINTKpG8NOTP0y3hmo+6iXvZONlPELKSkfXdUvosz4YaYCMmMeHj/wDQ4ZTgdTLCEGnVOMhxDtjj1lbditvDahWdKmEfxXJzJ8n5THpvBIJd2IOFcmcQcm9eK9n8jrdcyHu2s+zUYNJt+sg7pH6OckYiK+zQeAcMjCVlgtYII5r1cYLWsCJOhQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DM4PR12MB5913.namprd12.prod.outlook.com (2603:10b6:8:66::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Fri, 2 May
 2025 21:14:58 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8678.028; Fri, 2 May 2025
 21:14:58 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "corbet@lwn.net" <corbet@lwn.net>,
 "mripard@kernel.org" <mripard@kernel.org>,
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
Subject: Re: [PATCH v2 09/21] gpu: nova-core: move Firmware to firmware module
Thread-Topic: [PATCH v2 09/21] gpu: nova-core: move Firmware to firmware module
Thread-Index: AQHbupjbMH9WILFuM02OQaLezoPMXbO/2VGA
Date: Fri, 2 May 2025 21:14:58 +0000
Message-ID: <8bd3e3621e810dca2b71f287708ccf41861a9c93.camel@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-9-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-9-b4a137175337@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DM4PR12MB5913:EE_
x-ms-office365-filtering-correlation-id: 29a4f252-b14d-4e3b-f9b8-08dd89be64c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?VzJ3ZlJhN2hVY1pnUkJLOWc1L3ZoVldhRjk5dFRub1p4ZVpaZGg1QytLNmNQ?=
 =?utf-8?B?UFdibDdvQmloVE9MUjJYUGtRbzIxYU9xNFBzejZJUXVMZ1hyOHhUV0RBV2kw?=
 =?utf-8?B?NVFmUTZ3S0tHTjFiVk0vYmZsOXpNZ2ptWElMS21tZkVPMmJ2S0FsMEMxcTdJ?=
 =?utf-8?B?elluTGZLVkxYRjBTRHpqOHRxUlczWkVJQWViazFHUy84anFtc0NROGJEazlu?=
 =?utf-8?B?UTBwTmlqbEhXY3I2eUducG1oWjlKSWR1ZHU2T2V5eFhNcmdpa3NMSjBPZGJL?=
 =?utf-8?B?dzh2UnNLMjdxRWM5NWFTRi8rR1I0eWZvWjZzazFDalFNT2NkYzNUd2lheGZ6?=
 =?utf-8?B?SEZqWXBCdVd1dlNNd3cvc0VtR0x3TWJpdFcxQ3hacGpRbGYxR3NpU0ZicTdU?=
 =?utf-8?B?Z3JYZi9TQlQ0bC9tZHk4dllsMHBvRnFqV3RUQzI5NEJlRE9ldEg5SnpOaXB1?=
 =?utf-8?B?Y2hmU2wybHdVL0ZpbjEzTkdMQ2xyOTNQRm02UEEvUExsczduMVYwUzJFU0xX?=
 =?utf-8?B?dElQcjZxdW9lYkhqTEI2N2F0SVJ0SWhZanMvZkhPeXltWDF1Uzk4Nm9MQWRK?=
 =?utf-8?B?eWdVU0FEc1FBN2lUYW1rT01WbktPTTBuTUhza1A3OU02TEVudndQalBRVHdC?=
 =?utf-8?B?N1lWYmxYTk45RzYxQkNVOGRDWWdnNUt1MUw5UUM0a0U4anAxU1I5UWtFZkhG?=
 =?utf-8?B?RjdDUUFMQmlkKzBNZXcyRXJGc09qaVRTcGpIV1RCZHJUOVYrTE9yWFFHRDAr?=
 =?utf-8?B?QnQydHlXdjNKd09HQWMvcEVjViszeU9NMWduK2d4R3QweW93aFR4UjF5NWJt?=
 =?utf-8?B?R3J6UHVHUkVsTWc1REo5bHl3aDFTL2NnVldiWGxXb2NnTU9MQ2YyZmEyM3Bm?=
 =?utf-8?B?RWMyRVpBUW4zNUNuWnlBYzNGckNmT3lub1VDWDlOeTVuTEFQNDgwcWRvR1c4?=
 =?utf-8?B?SGRRQTRsTDUyYTVDcVozUzVKd0JJRGZKenVrMFlveDkrSEZRUUR6dFlrWjVy?=
 =?utf-8?B?aUlYclRMYklUR202K2xadmpya2JzRFhPNzlWMlhMMmtqVFI5bmVjdG9JT3Ju?=
 =?utf-8?B?Zk4xU1dYN0FCaS9JYytiSVRHZitZU1lsZEd3LzlOVmxWRmhnQ1dERFhDTlUw?=
 =?utf-8?B?bEkyYTFPQmVBY1kzWmtzQm1GNkthRlRjWnU4RVBjeHNJRVZnay9yNzdWZ0tz?=
 =?utf-8?B?TUszMEY5ZG5reFA3N3N5OUhldU1ka3J2ekljZTk1ZGpvU1NpWThrT2gzQWZN?=
 =?utf-8?B?c1ovTHBXbC9PQlZmVVBmK0NnZEFKMzBUUGk0bUN4L0FoVnQrT3ZzRHVhdkcz?=
 =?utf-8?B?bnkvTytMc2hGZzc1THhaWTFDYm1VM3RMcnJ0OUplOEkzZGd5OVVzK1QxUGpH?=
 =?utf-8?B?bTZzQjBja0pwc09ydURxd0pmejFHU2pBL3ByTVVZWmRxdmtHUkdvUkZ5M1Zv?=
 =?utf-8?B?MXU2SEVkMW15UFJOd3VYbVh4ajcrSWNrc3hiVmVTRXZHWWoxOG1xdmU5RkE3?=
 =?utf-8?B?UWhkZWtzcEJ2aWRlRGY3UlNCcW9yamUybm1JQmh3cjNpeDNFMHhseUU5RU1n?=
 =?utf-8?B?TWhycjI2NVJVeWw5eG04OVRJWXhTQk8venFwS0xwcmZEL1NTWHVTbndYcjd6?=
 =?utf-8?B?SFo0MkQyajRWQ0JTY1dMRGt6bUtXM1JiMnpNaUFnS0FFQkxyNnpsTXNOemZh?=
 =?utf-8?B?TWpyNlVlOERCZllXN28zNjJjaW5iTGVmbFVKdVlEVlFnUDZ5bWRpMENwV0w5?=
 =?utf-8?B?M2tub3NTSnU2VGRRSWd4b2F1R1p5Uk5rQTBoU294d05BT3c5VWErL2FOcGJq?=
 =?utf-8?B?Sm0wZUx3YXJWcEZaU1dxTmw1Z3ZjMzhCejQ2U2RIWDFaMW1MOE5uYVZZVWFT?=
 =?utf-8?B?Rm1PQzNEbkN6UFdrcmJXdyt0MWpGSDNWakhONGNFeUlpN0pQWlowN1VvMmxM?=
 =?utf-8?B?dXF2QnRGNnpDalVkSHRoYUxla1N5VDdGa1hTTnRaNGhCWVNHeE9nb0tTVCtP?=
 =?utf-8?Q?VFPy3qHIeHIcgfAdsJFBb2chtGlMX0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUJ0NlJBNGNOR1hSSnJnaEFCMkdZUTFoVm1lSllFcnNkekFqQlV2eW9VTXpY?=
 =?utf-8?B?MGhJZEdxVkE3d3U1VEhVZXdwZVlDOUFjU1ZDbHluMnBZa3pEOGtyVjFVNVNZ?=
 =?utf-8?B?SjFnN0E4SDhoTTcxY3BGcmpvd29hMmh6bklxdnB0SmNUL3V1S01pNHh6QVVj?=
 =?utf-8?B?L1hka3dNd0RGc0d6Z2hDeGpWL1VDRmVIYWlET3QxQ0NCWFNxV3ArK0toNGY3?=
 =?utf-8?B?a0NySERlK2dpZHptYlR5SFV2eHJLSVZEYTNJOTZScGI0U3gxR3gvZFNzYjhh?=
 =?utf-8?B?SnlILzR2OW1wK21NWVhWUHI0WDRvVlM0bmF0S0lDcFpvMysxdTVPbFhTSFpI?=
 =?utf-8?B?THI2cHZZbDRsdzRJdHR0cURKOExiQWN3NlRzM1RJSjUySURYUldVT1oxV2Vw?=
 =?utf-8?B?SW1KcVJ2NTRpWmFEOFdodmdiaThjMlRPL2FQak9XMXdGOFdVSkZHbGkrWVJp?=
 =?utf-8?B?Tm4rSmZ0d0Y1bHR4c0gxcFBmT0U1eWtTMVlYK29JdVNMbEhhR0h6MURMRHht?=
 =?utf-8?B?M2dtUUtOa0JSRlNRTERXV0NpSko1Rmg0VUpRemlQUG5taEtSMWsvc204L2Nt?=
 =?utf-8?B?QVpQcktUTXZYRlFkdk9UT3RacEtWY0d2VitIdUFScC9tODhVRkNkSUpGN3hy?=
 =?utf-8?B?TUh1NExKTXpIQ0lVcUNMblhvQXkrdnpRUHFIdU4zYm83SmNkSW5CQlBYTWg1?=
 =?utf-8?B?Q1o3YnV4SG1sWDBEWEhpS04ra0RwVlp0YUpaQURtc3hFUU1pbWxkWkNYQU4v?=
 =?utf-8?B?Y0FDRjkvUmlobGx1ZWs1VnNpRml4dGcrZkhIQW9meUIvTEhjQmhaTjBNOVIw?=
 =?utf-8?B?QmNuNWtKWjBrOWJ1eEdNVVprSlR6d2JSaWhtWEYySDI0blYxSHRHejFwWHN4?=
 =?utf-8?B?YUErNmRHY3VqeXhwMVlpakhUOWxNVE1CWkZKKzhRNC9ocWlKY1I0YzVYTlNq?=
 =?utf-8?B?UDhhUDFUV29QUWsxZ2VKczY2MytNaGhUMENTdDhMYW1Eblh1aE5jVDd4cnMy?=
 =?utf-8?B?MVdhQ0o4QjMrNWlPZS94ZWhiTlpSbGZlS0xIaFgrek9RenV3TWFOQWhESlFn?=
 =?utf-8?B?aHRUYnRwTFhZRVloeEZvUEduT2RoLytGNmtoSW0yZmFaU1J5cGVubjNkMjE5?=
 =?utf-8?B?V01PTG1ubGVyM080N1lueGdBbHhSQzE0dXVTR2xqYks3SjRnejQwa0JnWkFE?=
 =?utf-8?B?dVhzU1V4SFJoS3hMSEUrN1JQZnJYbDNPVnJ0RHNtWDFNWTBlNFp2V3hwa2dH?=
 =?utf-8?B?cysrUlRGdk1EcWVsTytxdzhva0dGVUthZkg5cHhPZkJXMVpNWk9jVWJCZVh4?=
 =?utf-8?B?T0VsMnFacmJMUUZLSUk5K3cxN0JEVWtJK0ljZGZzdi9aaW9paDhKcEU1OXV5?=
 =?utf-8?B?dFRXdCtmOHpDRWhubzZTTW1tcjR4VTQyUGxnb2pvNEFuRmZGb3JpdmhWdHJE?=
 =?utf-8?B?OXMwSFpQWXV3cFdxTk5Md1Qyc0tjZDVROUNQcUJibFh4c0hic0pSek94anZL?=
 =?utf-8?B?N3Zrd3Jtd09SNTdQRUJINWZMUk9ieEVKRWp4MnppQW1kbkRKZmQxRnIvbmJL?=
 =?utf-8?B?OW00VkZCODhhbkZDSmg2VFlvaGFhcHQ0Q1dQYmZrZDJUelRlN1lsYTlZOFVa?=
 =?utf-8?B?Ymw1VXNiWnVldkJzejBIWHpJdlJWM3FYT1ZHRjBkaGVWMUNibjJiNmtmZEcw?=
 =?utf-8?B?NUtjK2Nscy85ekVNMUVkejVUN1ZpYXpROXRRT2dmRWpmWS9jaG1Hb1YvREtX?=
 =?utf-8?B?MnhjUXRGd1N2NUJOR1JvNkxVd3VhYkc5YU55YXgvUVhReHdub2xLak1xcHNH?=
 =?utf-8?B?Z0ZJV3ZKb0dEVk5zOFU1Ump4NzFOeGFqS09iTC8weDhFekUwcEtyZEk4UFlp?=
 =?utf-8?B?b3BBUVRBTU9FNit6K24vcSt2M1JVUnl5MnRUK3NxWEJFS1YvOXp5c1hvbmlo?=
 =?utf-8?B?eVVzQ1I4SncvY3ZVQ0FMc1lJNVdHQ2hMUUFvRWhrQjVaazYyZTVKUTF6VlV2?=
 =?utf-8?B?bHRrV3pucnUwWGRmeWlaUGkxbWhZS2RvWko3QzZQTVQraFR2OWlEdWVxTTVS?=
 =?utf-8?B?OVMrRElOOU4vbmdFbUx6RWh6b1VxREJYR0c1elEvZk5ndG5vdTBaek5QYVQ0?=
 =?utf-8?Q?E8V0NUV+7P+qmR9D/A5ieYQlk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89C14FDA7D1D8D43A20605466D39A2D1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a4f252-b14d-4e3b-f9b8-08dd89be64c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2025 21:14:58.3493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yjndV3Ut86UdizYvxgdNzLc7mwOB/Ey0MNTEQqBGPBwuqoUwx8MQ0Ps8bauIBLpCufGYBl5+pPAMZuar5B/29w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5913
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

T24gVGh1LCAyMDI1LTA1LTAxIGF0IDIxOjU4ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gK3B1YihjcmF0ZSkgY29uc3QgRklSTVdBUkVfVkVSU0lPTjogJnN0ciA9ICI1MzUuMTEz
LjAxIjsNCg0KVGhpcyBuZWVkcyB0byBjaGFuZ2UgdG8gNTcwLjE0NC4gIFlvdSBjYW4gZmluZCBp
bWFnZXMgdG8gdXNlIGhlcmU6DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9OVklESUEvbGludXgtZmly
bXdhcmUvY29tbWl0cy9udmlkaWEtc3RhZ2luZy8NCg0K
