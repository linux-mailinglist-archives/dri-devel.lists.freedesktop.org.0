Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EBDCCEA9E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 07:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24C910EDE4;
	Fri, 19 Dec 2025 06:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xr6ZGtrQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF6D10EDE4;
 Fri, 19 Dec 2025 06:42:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYYqfTIneWzPDPbOnOsQRTmFfBVWfDhl1/WAt2uPbhvywiKeJXHdmGITnz0qENxcvBjOQiaTRdaobgWIkmmvR0IdnBdWQ6uDcgJ23sOcKlaEMZFLP6ixH4SoiQJ7CGFXWaqfKkBPF5RS05lQr8CodaeC7He4H7sLgvKFZFUEp/PMZZeeOVPwxsdwBXo4H9aEI5JUeAAv9mMU52AHAtxBWHFrjRZQUD0DjxteopT3jYu8vwtp/eqAC/qyzoxTOBpHB92O2Yymmzv8KhTrBrNnEow7GC8z7Gek1J9934tkveigoElKrM3a1KfpG6RKE00/ToMeUHkC9hpGexhLuhlNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRRnEVf2YSjuc3FSwJw7ptpikJ/+QkCIy/0Pk45U2b0=;
 b=sH7gO51Px3QzC4chpma4XZ7x/KRr6bxMcGctdo4qrfWPozRmdecTfR8vl0YgY0XcaGNavF+zDR75APvQIVs9JPL7AvwYsTz60dt8taxHh0GKBflNWkXQorF66NNnsydQh2w5+uqrXhjGuVTqZ1BH+2cwVM9R62FXK64+ZgcxdTBLPlcFD7aIMpm1Epz7XagdN5n8SFQzkXODZAiB1bZPk1C3DIFJOMYI1DEorDQTAx+I+vt9y8iKCWfO0nQDtXZm7kVNH2kCK7+rgtL/UAlbzO6Fyt8xBGM+gZ61r+PmXAHolb7ddiix4Cpjtor2MVyPm1UXZzW2IlS0Ma+KKfM9aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRRnEVf2YSjuc3FSwJw7ptpikJ/+QkCIy/0Pk45U2b0=;
 b=Xr6ZGtrQTjtpTL5YUzvI3wm6q8AiadHp8f/RUsuTlMYskZJLmmgvDfTpICbIV9YjzxmgzFW4HnK2nsGgFHonF1vQiLwKISBIyicNpdG0PyX4AFJ6ylsUABQzO9oXDgwfgb+KB1jZUWLWD8TkikcaeH2V6LoznfMlzfscOjRC7MRXws+EYwH720Y9rngrBMAptbJwKe9+tTdEm6meYpFVTQ0amYB0jWcEfkWDLPuPzjY/9JPuaIQ4aqgCPfU+0FM9MtCaipDdWXWLSfCYl51DyRx3XBRPKCh4zkp4SyAaCHaY9mqpwfvNeuHi1hjiTELCrQn7vibfpppcajJwr3xOdw==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB5976.namprd12.prod.outlook.com (2603:10b6:510:1db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 06:42:42 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 06:42:42 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kwilczynski@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Alistair
 Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
Thread-Topic: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
Thread-Index: AQHcbkrHLZgrNHAX9U+MOO9nREKCZ7UkZ8A6gAL/6ICAAHxZSIAAbeoAgAA22T4=
Date: Fri, 19 Dec 2025 06:42:42 +0000
Message-ID: <81AD31F2-D2F3-4877-BE30-C08EB1839B02@nvidia.com>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-6-6a5d823be19d@nvidia.com>
 <C890CCBB-76C0-4E70-A7B8-846E34DABECE@nvidia.com>
 <DF1DLWE9OOR6.2P43ATQYNAU3A@nvidia.com>
 <47F9A9AB-42B5-4A5C-90CA-8A00DD253DA7@nvidia.com>
 <DF1VFVC7OQJ8.1FOMG6C5M2I8V@nvidia.com>
In-Reply-To: <DF1VFVC7OQJ8.1FOMG6C5M2I8V@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|PH7PR12MB5976:EE_
x-ms-office365-filtering-correlation-id: 2c80e645-a65f-45e1-a41c-08de3ec9cf9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?NmN5enpKWnp4clFFSW04dDQzV1BIcjk2NTZ1TWw5SXBwcTkxc0E1YTNBaGhT?=
 =?utf-8?B?d2txTUxzeW4wcXRGSXcrNnJtaWZtdk5STDE3YkV0U016MGhPcXRMQzB3dXRY?=
 =?utf-8?B?ZUVjZ3IyQzdyOW5jTG5TbWdheHdDUGVOdlgvclN1ekdlMWNhemVwMWlkbURN?=
 =?utf-8?B?TUJxLzh5ZktDck85S3cxQ2xtU0w1cHV2VW5uMHJGSlU4dXIxMFBvcXNqcXpi?=
 =?utf-8?B?d1pGbmhQUWtrQWNjSXpoYWMrdW5VWi9vUStsbldLYkFCT0FhN3ZGbmhPS0py?=
 =?utf-8?B?Q1BjRmd4MlphUGVlRitmV1VPVExHUXVtV2ViWlBvUmE1c0tlVFFaUkdoM1Yx?=
 =?utf-8?B?WmtLK01HUTI4OThXakFKejRHbkRhTHFENytWL0ZIY3ppcWxrQm5zWjhwMzRs?=
 =?utf-8?B?NGc2NitmeVBlMFlOejExQ1l0ZmlpZVdtQWNpcHNFcHZzRzhkd1IyRGRibkJW?=
 =?utf-8?B?Q3JoRVlISGdNclRpOWZjaEFoSE1ZY2puc2s3NTU4NXpEb21OMXBWNVdzTGtW?=
 =?utf-8?B?TWlrY3k1ZXNaWUt6dmJ6TmI2MU5VQWd3SkVoNTNCQ2gzSGV2cUttQVNIejYr?=
 =?utf-8?B?dWRDTW53eTBpTWRLOExpVU9CR2wyOWtacnhIVWpBSExOZjJlUWN6NGdJbDUx?=
 =?utf-8?B?T3lCRGtoeDZvWWRXK01qQjBhdVQxMCtNeEgzUS9yckFFTytpSzJoNDczVXRR?=
 =?utf-8?B?NmpZV1NENGM1aFE0OEdjcEJlL3dzNy82a1doV3FVZHhsZkt2QkR5cjhnTFEw?=
 =?utf-8?B?bmhjTUxuTmRnVGtHWmZWaGVjRHpmc21HZDM1ZmZPd0JmZ0RiOEhpLzVoTVo5?=
 =?utf-8?B?VFljcG1LQlFVWmZ6dngxNWRoOHA5NU03THhmZ0U3RUFLZVJGams0M25OZzFB?=
 =?utf-8?B?UVkzT214M1VlWWd5WUtjdjdyb0w0S0NjWGl5SVp1azk5KzRNcHowdGFCTmRE?=
 =?utf-8?B?WHRsWmNzZjlvUnN5czhoUmxtelg0dmhEY3ZFWUw3a2xma2wrcFlyS1p1Uk1O?=
 =?utf-8?B?bCtuYnpIZ0Vkcld2bThJcHZQMVVYMlF2YnZMRzh0Zy8wNGhGV0pSeWpYeDFS?=
 =?utf-8?B?Z1FPMVhVRndYQnMzblB6akdremlsM014RmlkdW1EbktNSW9SaiszT2JVcGk1?=
 =?utf-8?B?ckNMeklvdkNnODh1SWExejBLRnVlNmpDTkwrTU1OdEpYWHZjWS9SbXJOWGI2?=
 =?utf-8?B?a1dTYkxGN3hMK21hcXRZY1pOV09yYlk3cUxTR1FGOTVZMGtWVm9Jcmx1OGxE?=
 =?utf-8?B?eEx3NVZPTFFKdkJEd3pDWkErTHZJUHpVaEdENXVpZFVMcmhnRGg5ak12dm0v?=
 =?utf-8?B?djdVMHgxdjVLaHl0S3A0RnEyYTRqejA2d2N4aHhwS2hlSDhHY2h3WThzRnYw?=
 =?utf-8?B?aUE1ekpCUVNUU0tUcncyOFU4cGFSYmtXMnMzRktsUzBhZ3liWWFvOHhBSUFN?=
 =?utf-8?B?cDNmaEx0bElHN2pBTDd6YWcyaGx2dzZQVE1QclJoZ01zeFBpSDJiazNjYnZi?=
 =?utf-8?B?S2IybEhlSXZVT0c1RnJJUWRDZDVaMEN3WFkzRVlzamsyS1V0eTZXVDhYWFZt?=
 =?utf-8?B?UENRV3Zxd21xdS9lcXk3RzlyUmdVR21KemU4VFhteUwyUW95S1Q3TzcxZzIz?=
 =?utf-8?B?VzB3b2pNdDdLMHpzZzEvNkd1cGJlZjFxM2FlR0xlQm10UjMya0p6RERJVFU4?=
 =?utf-8?B?VzQyZW9vK2pVKzJxMmkreis4WUtISDI4dUdIT1pMZzBjMjJyUERJSmgweXp1?=
 =?utf-8?B?dDBSUWhQOWdGaDRDQ0tZUXZnaG1STUNuSUhLRUNRZ2dBUzA0b0tSbEkvZFZ6?=
 =?utf-8?B?OEV3MEZrME8yY21jcnRkY0dzNnhycGROdGh1citZOHRvV0Q3S0ZPdFRjZHFo?=
 =?utf-8?B?Njl1SjBZTWhzeHhBOG0xMFo1TnF0elF2THF2NWFGeGJKWUJQUWUyMkhBdXNE?=
 =?utf-8?B?V2MwK3RvVHVzWS9HSFYvcWdLM0hxWXp3Q0JOeHlqYU9Hb0xtaWRDdzFObUJK?=
 =?utf-8?B?dnR4K0E1M04rOStzZytNeUlKYUZ3R0FIdDhXOWdIWmltQTNPV3RKdHY1dGMr?=
 =?utf-8?Q?ZHExGp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTJZeFUwR0V5d01QYmJNcDQxZVVXSzdrWUhDNTRqTlozbHpjaTJZMjBtS3I5?=
 =?utf-8?B?QmNleGJLcjYvV1BDWHJXK3VFZWoxUnFmMjRHZEFlV2Y1clRMODB6RzBQUEJU?=
 =?utf-8?B?T1FqU25iUEowYWJKUEVqZ05GRjBTaG9tRndIVklkOVRuZisyV09TU1VoK0hT?=
 =?utf-8?B?RVBTZUxtdlliNHBPR2lhaDN2YWFoS2VSOEJQb2pJUWI3d2hBZjMrSk10Uzli?=
 =?utf-8?B?ZXFKSjBiRkJLMEFBVHAzMFJ4alZtK2gxUFUrV0FmSzFhZ0tLREZtWnlHVjJT?=
 =?utf-8?B?cTQ2TXY3WTFjeGFnWmd0SWZiWXJHQXZZSkt4YkVJMlFpUmZrSUxycWt6WVJM?=
 =?utf-8?B?RnBiWkl0MS95MHIvV2QySS84RzFzaythalcxZDdrRktraWJSVTRRWk10QnpD?=
 =?utf-8?B?dUFjVUdOanVNYjhwZGRjSHVIWXROOEkybHNzSE50WnlJS0s1NXZKdFA2bTdp?=
 =?utf-8?B?SGN3UTJUTi9VYlN5S2Zkbndqa2EvMXdXYmw4M2JQdjRyalA1Zzd5M0hnTzB5?=
 =?utf-8?B?UXo5Vkt6a2g5YWE4ZlUyOWNEY2pRWUc3aGdxOVk0L0F6WFhVWHVMR1pYNU11?=
 =?utf-8?B?U1ZUeTh6ODZIdnF2WG9NWTVvK1dNMGpxUE5qWGlyc0dFZmxtU05BMWNlazVq?=
 =?utf-8?B?Tmo3MVhnckd6bmlxLzIzVWVDVGpOV1NCOGVKdzNjYmJOZUV1d3FqN1JpRkVl?=
 =?utf-8?B?VjhVMUhsRitvWi8vem1mTUg2eEZ3d21Jb041azhhbVIxcnJMaW9BeUl1RW1y?=
 =?utf-8?B?d2FDdHpCNmo2ZEMxbFk2VGxNRHhjUERFcVh5RWVoNXpiR2pxcUFiT09XajZW?=
 =?utf-8?B?SzcxemRLb1VpbDZNWk9KdklCM2xMTDVWVE9YYWVpeDdFQVlWR1JhSXZKbkpV?=
 =?utf-8?B?YUlNVUZpa2d6UnliTlEyWGJFZnNuUlI4TitmQ3pxRWFkNmx5WGc5SURuUURz?=
 =?utf-8?B?c3JJb0xtTHpVbXFXQlFXTVJ3Rm15K2c1bTVHWWVIMHNHL0c2bzlIa25OV2Q4?=
 =?utf-8?B?NkI0VlR4ckRpOTBsd05BTnU0UjJyMWJ2Y09hUzhMZTJFM3QvMzY4ZmlhNkU1?=
 =?utf-8?B?VlJDZ25uM0ZLQmFRaFBObUNxWVpGSjArdHkwdGV4M1JVMmV3L2hXdTVQS1dy?=
 =?utf-8?B?RVhSaDYyNkNTTHdvNy9oekw0ZjhHSE0xQ0pNT0orL2FMRGcrOFgzSmtYSEhz?=
 =?utf-8?B?SktnOGx1Q1MrTjFJbHJLTjVFMDZHV25KeElhQlBldHI4TGg5ajlXV0ZNUDFn?=
 =?utf-8?B?alhXOXVtYVd3eUQ1QVZmTTNhdm1jTk54QWZjL0FFS2pyQktPKy9UUUhjWDRL?=
 =?utf-8?B?WlFCQ3ZXWjRqRml1T2NQZkhEbk9GdGNoaVN5OXlXM0hMWTZVRitCbWduSWI4?=
 =?utf-8?B?dDdWRFFUNmZHeUg0RGNCNWYyNFI3VTBNeUxEdGt2SVh0Z09takFhTVJKM1Vw?=
 =?utf-8?B?WU9SNGljRHUvSXJyd0ZrWGFIZmFXOGM3ZVlsVDdneERLLzZ4ZnNUSzRuMzl2?=
 =?utf-8?B?R0RoZzg2YUtXS2RZYVFNcWdEN2Y3bXRiR2hLK0RkSWhkWEZZS3BMVlZISDNI?=
 =?utf-8?B?MnpBU1ZlMkFhbGpiZjlzVURnTFBldzhoQkJ1T1FQSWhvcWtjdkFRME91U3FE?=
 =?utf-8?B?ZDJuWFZDS1pFbjVhTXVyMjQzV3o4YnBoM2pudnRVMU5zNk1tdkcwZnlnQWJW?=
 =?utf-8?B?cVJvSmNQWDV2QUlOTTNwY3JMM0w0NE1nenRLY1ZOeFUwd1NkZUs0SDZuK2Nj?=
 =?utf-8?B?K3FMVXJpNHBReVpwb21XQjduZEZWOTg4Vk5aNnFCQVdwRDhqdXY1RWFlLzZE?=
 =?utf-8?B?dTZub2VJU000dzRiUTY1MDB6TU5MTkF0dDFWb29Sc2NwSDJwdEFVc0x2dmFL?=
 =?utf-8?B?MmpTSTlrNEw4b04wMUx6U2pzSjFTSWcyTVNobWZJcmQySExjMGpwTEFWRlFW?=
 =?utf-8?B?NjBrK2gyUWF0ZmVhK2FYeTkrY3RIOEZYS2pKYXRDYjdpZVJhSXVCTDBUU3Zx?=
 =?utf-8?B?ZU1Za0xTSTkyZmYzM1pUZHAwTHhsZWd1dWVVZ0ordU9DMlVhSWFjZzN3dXB4?=
 =?utf-8?B?cUVoZWd0emJjbXhtWlRBQUZuZDVFazA3MEw4VVFjc25wSGQ3amFGbUIzNkJK?=
 =?utf-8?Q?vgJyU+u/ZmG5vktWAcq6Ihwy+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c80e645-a65f-45e1-a41c-08de3ec9cf9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 06:42:42.5644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7RrUQEkc8b+kPu2II2wVaw7Wc+8phL7TLRIfWmRzUkR0il6EZ0MlD77ig334JbCZ1Ov278v/p2U3GwCF2N0gEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5976
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

DQoNCj4gT24gRGVjIDE4LCAyMDI1LCBhdCAxMDoyNuKAr1BNLCBBbGV4YW5kcmUgQ291cmJvdCA8
YWNvdXJib3RAbnZpZGlhLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79PbiBGcmkgRGVjIDE5LCAyMDI1
IGF0IDU6NTIgQU0gSlNULCBKb2VsIEZlcm5hbmRlcyB3cm90ZToNCj4+IEhpIEFsZXgsDQo+PiAN
Cj4+Pj4+ICsgICAgfQ0KPj4+Pj4gK30NCj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9u
b3ZhLWNvcmUvZ3NwL2Z3LnJzIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9mdy5ycw0KPj4+
Pj4gaW5kZXggMDk1NDlmN2RiNTJkLi4yMjg0NjRmZDQ3YTAgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3NwL2Z3LnJzDQo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9u
b3ZhLWNvcmUvZ3NwL2Z3LnJzDQo+Pj4+PiBAQCAtMjA5LDYgKzIwOSw3IEBAIHB1YihjcmF0ZSkg
ZW51bSBNc2dGdW5jdGlvbiB7DQo+Pj4+PiAgIEdzcEluaXRQb3N0T2JqR3B1ID0gYmluZGluZ3M6
Ok5WX1ZHUFVfTVNHX0ZVTkNUSU9OX0dTUF9JTklUX1BPU1RfT0JKR1BVLA0KPj4+Pj4gICBHc3BS
bUNvbnRyb2wgPSBiaW5kaW5nczo6TlZfVkdQVV9NU0dfRlVOQ1RJT05fR1NQX1JNX0NPTlRST0ws
DQo+Pj4+PiAgIEdldFN0YXRpY0luZm8gPSBiaW5kaW5nczo6TlZfVkdQVV9NU0dfRlVOQ1RJT05f
R0VUX1NUQVRJQ19JTkZPLA0KPj4+Pj4gKyAgICBVbmxvYWRpbmdHdWVzdERyaXZlciA9IGJpbmRp
bmdzOjpOVl9WR1BVX01TR19GVU5DVElPTl9VTkxPQURJTkdfR1VFU1RfRFJJVkVSLA0KPj4+Pj4g
DQo+Pj4+PiAgIC8vIEV2ZW50IGNvZGVzDQo+Pj4+PiAgIEdzcEluaXREb25lID0gYmluZGluZ3M6
Ok5WX1ZHUFVfTVNHX0VWRU5UX0dTUF9JTklUX0RPTkUsDQo+Pj4+PiBAQCAtMjQ5LDYgKzI1MCw5
IEBAIGZuIHRyeV9mcm9tKHZhbHVlOiB1MzIpIC0+IFJlc3VsdDxNc2dGdW5jdGlvbj4gew0KPj4+
Pj4gICAgICAgICAgIH0NCj4+Pj4+ICAgICAgICAgICBiaW5kaW5nczo6TlZfVkdQVV9NU0dfRlVO
Q1RJT05fR1NQX1JNX0NPTlRST0wgPT4gT2soTXNnRnVuY3Rpb246OkdzcFJtQ29udHJvbCksDQo+
Pj4+PiAgICAgICAgICAgYmluZGluZ3M6Ok5WX1ZHUFVfTVNHX0ZVTkNUSU9OX0dFVF9TVEFUSUNf
SU5GTyA9PiBPayhNc2dGdW5jdGlvbjo6R2V0U3RhdGljSW5mbyksDQo+Pj4+PiArICAgICAgICAg
ICAgYmluZGluZ3M6Ok5WX1ZHUFVfTVNHX0ZVTkNUSU9OX1VOTE9BRElOR19HVUVTVF9EUklWRVIg
PT4gew0KPj4+Pj4gKyAgICAgICAgICAgICAgICBPayhNc2dGdW5jdGlvbjo6VW5sb2FkaW5nR3Vl
c3REcml2ZXIpDQo+Pj4+PiArICAgICAgICAgICAgfQ0KPj4+Pj4gICAgICAgICAgIGJpbmRpbmdz
OjpOVl9WR1BVX01TR19FVkVOVF9HU1BfSU5JVF9ET05FID0+IE9rKE1zZ0Z1bmN0aW9uOjpHc3BJ
bml0RG9uZSksDQo+Pj4+PiAgICAgICAgICAgYmluZGluZ3M6Ok5WX1ZHUFVfTVNHX0VWRU5UX0dT
UF9SVU5fQ1BVX1NFUVVFTkNFUiA9PiB7DQo+Pj4+PiAgICAgICAgICAgICAgIE9rKE1zZ0Z1bmN0
aW9uOjpHc3BSdW5DcHVTZXF1ZW5jZXIpDQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
bm92YS1jb3JlL2dzcC9mdy9jb21tYW5kcy5ycyBiL2RyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3Av
ZncvY29tbWFuZHMucnMNCj4+Pj4+IGluZGV4IDg1NDY1NTIxZGUzMi4uYzdkZjQ3ODNhZDIxIDEw
MDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9mdy9jb21tYW5kcy5y
cw0KPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9mdy9jb21tYW5kcy5ycw0K
Pj4+Pj4gQEAgLTEyNSwzICsxMjUsMzAgQEAgdW5zYWZlIGltcGwgQXNCeXRlcyBmb3IgR3NwU3Rh
dGljQ29uZmlnSW5mbyB7fQ0KPj4+Pj4gLy8gU0FGRVRZOiBUaGlzIHN0cnVjdCBvbmx5IGNvbnRh
aW5zIGludGVnZXIgdHlwZXMgZm9yIHdoaWNoIGFsbCBiaXQgcGF0dGVybnMNCj4+Pj4+IC8vIGFy
ZSB2YWxpZC4NCj4+Pj4+IHVuc2FmZSBpbXBsIEZyb21CeXRlcyBmb3IgR3NwU3RhdGljQ29uZmln
SW5mbyB7fQ0KPj4+Pj4gKw0KPj4+Pj4gKy8vLyBQYXlsb2FkIG9mIHRoZSBgVW5sb2FkaW5nR3Vl
c3REcml2ZXJgIGNvbW1hbmQgYW5kIG1lc3NhZ2UuDQo+Pj4+PiArI1tyZXByKHRyYW5zcGFyZW50
KV0NCj4+Pj4+ICsjW2Rlcml2ZShDbG9uZSwgQ29weSwgRGVidWcsIFplcm9hYmxlKV0NCj4+Pj4+
ICtwdWIoY3JhdGUpIHN0cnVjdCBVbmxvYWRpbmdHdWVzdERyaXZlciB7DQo+Pj4+PiArICAgIGlu
bmVyOiBiaW5kaW5nczo6cnBjX3VubG9hZGluZ19ndWVzdF9kcml2ZXJfdjFGXzA3LA0KPj4+Pj4g
K30NCj4+Pj4+ICsNCj4+Pj4+ICtpbXBsIFVubG9hZGluZ0d1ZXN0RHJpdmVyIHsNCj4+Pj4+ICsg
ICAgcHViKGNyYXRlKSBmbiBuZXcoc3VzcGVuZDogYm9vbCkgLT4gU2VsZiB7DQo+Pj4+PiArICAg
ICAgICBTZWxmIHsNCj4+Pj4+ICsgICAgICAgICAgICBpbm5lcjogYmluZGluZ3M6OnJwY191bmxv
YWRpbmdfZ3Vlc3RfZHJpdmVyX3YxRl8wNyB7DQo+Pj4+IA0KPj4+PiBXZSBzaG91bGQgZ28gdGhy
b3VnaCBpbnRlcm1lZGlhdGUgZmlybXdhcmUgcmVwcmVzZW50YXRpb24gdGhhbiBkaXJlY3QgYmlu
ZGluZ3MgYWNjZXNzPw0KPj4+IA0KPj4+IE9ubHkgaWYgdGhlIHNpemUgb2YgdGhlIGJpbmRpbmdz
IGp1c3RpZmllcyBpdCAtIGhlcmUgaGF2aW5nIGFuIG9wYXF1ZQ0KPj4+IHdyYXBwZXIganVzdCBq
dXN0IHdlbGwsIGFuZCBzcGFyZXMgdXMgc29tZSBjb2RlIGRvd24gdGhlIGxpbmUgYXMgd2UNCj4+
PiB3b3VsZCBoYXZlIHRvIGluaXRpYWxpemUgdGhlIGJpbmRpbmdzIGFueXdheS4NCj4+IA0KPj4g
SSBhbSBub3Qgc3VyZSBhYm91dCB0aGF0LCBpdCBzb3VuZHMgbGlrZSBhIGxheWVyaW5nIHZpb2xh
dGlvbi4gSXQgd291bGQgYmUgZ29vZCBub3QgdG8ga2VlcCB0aGUgcnVsZXMgZnV6enkgYWJvdXQg
dGhpcywgYmVjYXVzZSB0aGVuIHdlIGNvdWxkIGRvIGl0IGVpdGhlciB3YXkgaW4gYWxsIGNhc2Vz
Lg0KPj4gDQo+PiBBbm90aGVyIHJlYXNvbiBpcyB0aGF0IHdlIGNhbm5vdCBhbnRpY2lwYXRlIGlu
IGFkdmFuY2Ugd2hpY2ggc3BlY2lmaWMgaGVscGVyIGZ1bmN0aW9ucyB3ZSB3aWxsIG5lZWQgdG8g
YWRkIGluIHRoZSBmdXR1cmUuIERvd24gdGhlIGxpbmUsIHdlIG1heSBuZWVkIHRvIGFkZCBzb21l
IGhlbHBlciBmdW5jdGlvbnMgdG8gdGhlIHN0cnVjdCBhcyB3ZWxsLiAgQWxzbyBoYXZpbmcgVjFG
MDcgaW4gdGhlIG5hbWUgc291bmRzIHZlcnkgbWFnaWMgbnVtYmVyLWlzaC4gSXQgd291bGQgYmUg
Z29vZCB0byBhYnN0cmFjdCB0aGF0IG91dCB3aXRoIGEgYmV0dGVyLW5hbWVkIHN0cnVjdCBhbnl3
YXkuDQo+IA0KPiBUaGUgcnVsZXMgYXJlIG5vdCBmdXp6eS4gVGhlIG9ubHkgdGhpbmcgbW9kdWxl
cyBvdXRzaWRlIG9mIGBmd2AgYXJlDQo+IHNlZWluZyBpcyBhIHN0cnVjdCBuYW1lZCBgVW5sb2Fk
aW5nR3Vlc3REcml2ZXJgLCBhbmQgdGhlIG5hbWUgd2l0aA0KPiBgVjFGMDdgIGlzIG5vdCBsZWFr
ZWQuDQo+IA0KPiBFdmVuIGlmIHdlIGhhZCBhIGRpZmZlcmVudCBzdHJ1Y3R1cmUsIHdlIHdvdWxk
IHN0aWxsIG5lZWQgdG8gd3JpdGUgdGhlDQo+IHJwY191bmxvYWRpbmdfZ3Vlc3RfZHJpdmVyX3Yx
Rl8wNyBhdCBzb21lIHBvaW50LCBzbyB3ZSB3b3VsZCBuZWVkIHRvDQo+IHJlZmVyIHRvIGl0IGlu
IGBmd2AgYW55d2F5LiBUaGUgY3VycmVudCBkZXNpZ24gaXMgbm90IGFueSBtb3JlIGxheCB0aGFu
DQo+IHRoYXQsIGl0IGp1c3QgcmVtb3ZlcyBvbmUgc3RlcC4NCg0KQWgsIEkgbWlzc2VkIHRoYXQu
IFRoaXMgaXMgYWxsIGluIEZXLCBzbyBJIHRoaW5rIHRoYXQgY2xhcmlmaWVzIHRoZSBydWxlIGZv
ciBtZSBub3cuDQoNClRoYW5rIHlvdS4=
