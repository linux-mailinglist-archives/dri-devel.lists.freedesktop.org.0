Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283D6CBC2E6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 02:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA2E10E0D2;
	Mon, 15 Dec 2025 01:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lw0lWHOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1E110E0D2;
 Mon, 15 Dec 2025 01:22:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hymdTALs2Rz+IkjWUJ22gDHrHsx50fTrxXf5wqP65/LklN0qwXMi7ZxgCP3AzeIVkNW3/pzZRqM0Sh80wQyMLw9v9w0Q4mABknf+rwlIorq8oLgqegcxFJqecrx474d/5iBoN2Bl3wxG0ZZ7wGLSkJuGNWNuvTIIuRHCyannrXsC1t0gCeoB8VBofWPgwZu2KddvvUk3yD1Vf5AuwmwJ5io/5+/wMfajAe8mimFo1c2Qdx81jbtOmd9MfaKzdgFBCWZnQbARE14yUDaIffyBs2IdyqitVlHmdt1ReuhrbgY3Sf8Lex8zLEqaDjs11dPTGMGO/twZJYhUlwvYgwKoBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhPaghOxJc22wg9fFD/GmWF7nsIpin9BX54DDcFVPYE=;
 b=YZUGfp1a80pjFvBaQ+4PpbcTLOUiMTdI1Q2Q3hFjkiDpZsioTyI8ToXmBfIxlQlXQudSBkbk/zFmLJ+0OEH0TyC78TccfWH+7/ejwWwSCsJAZde6K0QAES24a60fFYJElXnGsBxyhwX2Fv5zZ+XJN2Qly0oGHnddBH51WA2yeiQs1LL68SUmn59RsKYGQXSe/NIXCwTfG4xBPcg6OwRQMUxV5hU/Sdivfj8x5pEt9iL41un5PW7Pt7vEjgtdlnJ3vyM+6Kh9WUyj+qbiwsu8j57L7c5R3QDd1569lvRw9FBqbNZ/62K60nZrO0W+48iYwa7nipB5S9/7KdLn56QNxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhPaghOxJc22wg9fFD/GmWF7nsIpin9BX54DDcFVPYE=;
 b=Lw0lWHOP10xeOfVqaA5oVlM1CrYu1WkktzjA6wplnAWGM+t2ovVil7qwPQO+iVSSVrhvb8ZmZx8vhWhJuuLo1Zgocl/tSaDg5dliCXZpEuYCr1UWxFO/gfj9Qxof34RiLXjvtlJYRs26uhY7vc9wO1gnSHwXvIW5twyQ0J+6SqBVdvdn76ipGNB6s7DbUT/b11u+jBoyoPIZZdl4WV1L60Htjgyq+30A3WpCjlZqWPE7J3PXakO3N2F7h4znRbu8gY/9FRc8K/QpP71wy76lp2WV5mGbwULgVYQxUIFKmmlMA4lQHbdrxmW36Qs5KkjkhdUYKIOQGjiWoAB0qv4K5g==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM3PR12MB9351.namprd12.prod.outlook.com (2603:10b6:8:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 01:22:01 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 01:22:01 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
CC: Dirk Behme <dirk.behme@gmail.com>, Alexandre Courbot
 <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, John
 Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer
 <epeer@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
Thread-Topic: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
Thread-Index: AQHcWveUsuyLFfWLdEG+RWwvvKBbTrUdxGs2gAADE4CABClqgIAAG5ZA
Date: Mon, 15 Dec 2025 01:22:01 +0000
Message-ID: <B5724DA0-6031-4576-9B3D-DB67569711A2@nvidia.com>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
 <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
 <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
 <25aa90a7-e9f4-471e-9d93-c61b9a7a429c@gmail.com>
 <lgncc2k5klyqxzlz52dzia5v5ly3nfnjbv5if6esniulruahnz@b5fc5bfyltny>
In-Reply-To: <lgncc2k5klyqxzlz52dzia5v5ly3nfnjbv5if6esniulruahnz@b5fc5bfyltny>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|DM3PR12MB9351:EE_
x-ms-office365-filtering-correlation-id: 7c95f26f-02c2-4df3-1fb5-08de3b785949
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MEtidjBjRlpYMjIrdjhQNnk5TXcvYUVueHVEUWorcy9GM2VaSFdxK0ttMU5H?=
 =?utf-8?B?OEl4SURsTmdYbklsM2k5S3E4WWsxM1o5cVl6YWtrMlJ3U09XSlZ5eWdTRVha?=
 =?utf-8?B?aGFacTA2NCtiaXIrNWNXZG5KVEVwWmlVZFBSU1Q4ZzEyQUVnZWMxRU4zQjFo?=
 =?utf-8?B?TlhTUUFjblNIUWx1Q1lOdDVzczJydEZqVVpNRUl1S1RCRmNXZ2JoRTRBM2VK?=
 =?utf-8?B?cUttZE9XZkRKRWFiclptd0VkNkE5a2ZrKzErZzh5N0pTdFRlVDJhNlJCeFk5?=
 =?utf-8?B?SUpzaTYydjVJVVRoV2psdzZzNVhvK2d1QWRhZ0JBbzgxYkE0WGNhbEJWbC8x?=
 =?utf-8?B?Zncyb0hXRXg5aHNYR2s4eDlmeThaem1EQnlDbUtKaUdiZ0h2UzFOU1hQOVFz?=
 =?utf-8?B?UnpYWjBuaWtrZytzNit0bXNYREhiRVlackpHaXpRUElNOFRJNUh3dXlHMHJm?=
 =?utf-8?B?cStOUDdhU3VEMnhnSkd2amhFZ2tFK3NYblFnc0ZwWTh0RHNCUDBrZ3A3UXdJ?=
 =?utf-8?B?Wk5sdkRGUVhBZmRPWHpIeVNMM2hMU0wwWFViWm52ZmJ4UmhaUmJtNDlSNjRU?=
 =?utf-8?B?blRFOStwUWRpYkRKNXdVZ0JYSHNUWGxWMlc5THRaVXJqR1VkdXk5MEtjL2l0?=
 =?utf-8?B?bzZvc1JpN2IwQ1Bhb29ZN2F5SVV3UDMwc0FpdVZGM3R0amRYVE0zdmtNdmpF?=
 =?utf-8?B?NS9XdDFRV0s3Z21VWFNpdTZlNkV3akZMbVJBejE4MTZaUjJuc05iek9IemlJ?=
 =?utf-8?B?dFdRSEV5Vi90Q2ZjaVJPanlmTnR6SDhyajNqSmEyZVFhc1R1aXBkcU9BWGFK?=
 =?utf-8?B?M05YclhVNU1TRmdOZVVoVkpWZmJhcmtkUU0zRGNkQnhkczFzcUxtYVEyRlN3?=
 =?utf-8?B?NTYwei9BcG9JbitqSk1aZlc4SWVQOVg5RnZtaXFyZ1lpRmw0aHJTNFFJL2FH?=
 =?utf-8?B?VGJTa3BYamhiTFBLMTIvVUFDSzdZc1AzOURqRVBqK0dYNTcvbzZWakRkaGo3?=
 =?utf-8?B?K3p1ODRqZUtodmtZSlYvTmZYajhPOTNYWDFJRUt2ektTd25rVkUwRm1IRXJa?=
 =?utf-8?B?UDNnSk9CNHRvNTNUZEprWDcvNXpGaTdPcEpYOEl1SEhwQ05xR0hybFVpSlh2?=
 =?utf-8?B?cUpUdktoVG9EUDhHUkFTbUIyV2trTnMveHQvanVIT3VybFRFVFZIUjFnV21P?=
 =?utf-8?B?OTM4Q1U2Z1RoTThHM2U1ZS85VTlZQ3pWMk5HUHFEczJOa1diT0hweVhjY0dE?=
 =?utf-8?B?MVNyUVNrU1gvN0I3M0NKaXNMK2VPUVFvWmtVYmdycDBna3RIZnJMNksvamNJ?=
 =?utf-8?B?VkdPWEs5UmFOb3FqSVcvREpreU9HNTc1QTFLYkxyRzF1aGg2Tm1ZK3BIaktL?=
 =?utf-8?B?eW5rS01peS9tQkdBNTV2YWRadkh1ZnAyOThJQ2pNV2MySXNkRTJsVGFqbXVC?=
 =?utf-8?B?cUxBT21hRXhTOE9PN3E3MkNaUlk0SHlFdmJyc3d6S3lSeUNzVTZLYVNEd2pw?=
 =?utf-8?B?OUtYMVZ3L05vZEhUdGtsbjNpei9QTjBaM3dDeUdLYmE5R2lsSkNRdm9LSkh6?=
 =?utf-8?B?ZlMrT1lyMXNUTFo1RlJ2OVBrQ0NVbkRlVnBzVDdlZTRPRGtFdzcxcE9BNFRT?=
 =?utf-8?B?NEorbGNUb0F2L1BhSXZleW10ZDB5ekRuUlFicXVOamphbWt2ekdVVUttOXZs?=
 =?utf-8?B?SHJFZUlsRDRSNmxVaXFyeUo1ZStubzAwQ1JraUFHV2JYSmNoSE01T2p5NzUy?=
 =?utf-8?B?QVpoUStiVjNkVDZqb2UrKzVGMk12NEVpcXJoeTNYQUVFUllhUTFKZURFcW1u?=
 =?utf-8?B?amtIdkN1UHRGOWhQbnR2cDRzckV2bFJtcXp5NTNYci9DZ2FWRGxHRVBjWitT?=
 =?utf-8?B?aTk4RXZXOFloa2V1VUo5a0IxUkpDYjBXSi84UW04NUtLeXdRNzNYSDBZcWRR?=
 =?utf-8?B?VExDVUpFb0lZNWdaVktwWUZyelk4V0hXeVJuNWI1RkpBTW9FM1pNMFVpNzNC?=
 =?utf-8?B?VmFvbVpZcjVtZ1VUK3VmNjM0UUFhdDhEdnBTNVI4MHF2d083Zkp0NVVZU2pl?=
 =?utf-8?Q?ncKhZ3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WG5hYzFoK1JpNmIwWEZIaEZNREUyL3FycUI1TnFDNzNTNEQ0Tm1LL1RoUkRO?=
 =?utf-8?B?OGFUYitOdy91VXBHOXNLRklkdENJRzdCRTFMMi8yR3E1MWpsSGpqMS83dzBU?=
 =?utf-8?B?dVhTT2NwbkRCbDk5Q0JUYTlYNnpBMEswWFpDRGZaUEN3WUR6MnV3WW9OenhX?=
 =?utf-8?B?V1V4NnpncFZPcERtOXkraW0zak9rRzVObVBNOHRkWWZTeUtna0NFaDU1UVUv?=
 =?utf-8?B?dmJnNm5VRm9yNmlWRzlpR2tKNmYrTzViN1pLeXNGZWNCUm1Xc1RvdHp5bmtD?=
 =?utf-8?B?NU9DVUxYcThRMDFXYkJ3Ky9yK1E0OUs3UFY4MmdkQmtZVVJnUGdFejY4aHpD?=
 =?utf-8?B?UzlDWWdaYkp4dUhKMEpXZHFmZDFnbXdJd3Nhd2N1MzFoQ3o2L3dzVTQ3UkN1?=
 =?utf-8?B?ZjJ5NkI5Qmd0WWlsZGJXWXhSQ25IMTJmZndKLzRGNUhPZzVLUVBmVDRXMFBD?=
 =?utf-8?B?MDdrVUIxOEJveUhHQ1JiTFczWEpKZk1IUXZZdWdiTEZGbU12cW10b0dhMloy?=
 =?utf-8?B?M2U5UkNsWG5jSjhtR0F0UjZ0cFJhWHlhOTlYeDdiM2N1cTdSYnlDVUlNVEpZ?=
 =?utf-8?B?OW01NW03VlUzZS94L2JhZS9OTGd3Y2MwVXVUdkFSZ1FDalQra1dneE9rb2o3?=
 =?utf-8?B?ck1PWnMxUGJMaGhXWE5obGdXYWdDNHg0RElCQk9ZdGhOTlNseG9oWDE4LzZu?=
 =?utf-8?B?YlpQK2tGSXdVTWNzVXNBV3ZKY3l0elZSNHRLMHcvcDRKc2FQZXB5eFAxQ3l6?=
 =?utf-8?B?Sm9KejA0RFVOam5GeUFTazV5MWY0VG0zZmQ4bnplQnM3QkVmRms1RkQwWkpQ?=
 =?utf-8?B?ZHE3WVd1U2UwOUJRMmFwK3lQWHFqbVpCK1JGQnlHa3U5bWZjMWRpSTBibk91?=
 =?utf-8?B?MXlhMlBYQkJKSjNzZkQyc2hQR2Z2ekdJWDEzSG9Qb3llaFdJQW1hVGNkWUs0?=
 =?utf-8?B?QmFFNWxmL1FGYkF0MWh0aFNTZ09HaG1qOHE1bjg3WnRFZThRaG84WXAyR25W?=
 =?utf-8?B?T2pkOWVmRGNPYXNMNHFMaFVnK20xd056MTdjMVJFVUw0RFJNcHNrYkJzN1o3?=
 =?utf-8?B?cFY5R3FqS05HdmZwVDJLZCtHNkVNZFRoYk56czFLdVJjaXQ1V3NTcllWNklR?=
 =?utf-8?B?V2d3YzlCUVlOOWpkZFNUb3cweXlKYWxDMklPYTlkRVY4aGxFQW5vcVdoQmhM?=
 =?utf-8?B?dHFEd0RQWnRiWllEUGkyKzhjcHRSZ2ZxS002Mmt3RkxkR3RmTHJCdCtxcTVr?=
 =?utf-8?B?ZXdnZkQxNXlycWM5MDk1RjFSOFdZYURoVWI3cFl1Z0EyTkNnN0R1Ylo2NWlN?=
 =?utf-8?B?TmxqaThXdEJPNHBZZzB5Y2dpa2pQb2cwTndrYUJKMkxjdWtZOFU0SVRBOFc0?=
 =?utf-8?B?K0VCdk1hc2lpNTh4dlRaZDEwbFRSY1lMY2EvTzhVSEp5S0Y0SjVBT1M4TnRC?=
 =?utf-8?B?SEVkcWNIMEg3TjhGSDJoZEt0SzlmWjQ2L3pZcXpuSGk1WXl5YTczb1N1MnJl?=
 =?utf-8?B?bFZiRXhxeW9Qa1hzSGo0YTBMenZWQzF2TjhDN1NkQ0dTZ25QTjVTQ2NsbnRr?=
 =?utf-8?B?VDcxMG9zZGxRZWhqc3pzKzV1dk5VajZLTFVPYUlONHNKbVA3NVdpRTdLTkd2?=
 =?utf-8?B?cGJ4YjNvRWRvK08rT0JjY2ZheVV4bS8zQjNXcUY0OTExdFBHNnRqNG5oQXBv?=
 =?utf-8?B?dys1M0lVcHBoL3JCUUxsK1ZEbGNxL3pDVmpvNmpLQm1rYkppVGJZZ3FwYzlx?=
 =?utf-8?B?RHhVU3RlSG0yVzJnQkJnUFlTaG9neHlkRjM1NkJJYzk3WElydndTbm1JaUpF?=
 =?utf-8?B?bjVkZWVkeXdUdFZ1NUtMd3JNdGI5dFlWZ3hIY0lSOGFOemZZays4RE9qS004?=
 =?utf-8?B?OW90RVliNENrOThWUHRwMkx4M0JxV1VjM2VYcmtnVHNjZkJTSFVVSDlsYXBq?=
 =?utf-8?B?aUhXZDAyWERBdDhoVUExMmFUV2llZUFjWkdPVDBHdEtLY05BTytydjhEb3B6?=
 =?utf-8?B?YXcyYnZhT2twNSt1ZEtkNDBOQVd6V09hcmdiOFFXWkV0ajFxeW9LSkZOV3hD?=
 =?utf-8?B?b0h2UitlaHQ2Sm05TUM0SngxVlNmMjVmTDUrekx4ckpDdEVwU1ZoV3g4dDJK?=
 =?utf-8?Q?HE98BKtNzsFIC41cIXLcwaxC4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c95f26f-02c2-4df3-1fb5-08de3b785949
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 01:22:01.3169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ClAJd4ACEMwHiwMK7/MpREB1E070sVVVTwHAtlSyXq5fq8/CeqvOjLoQTw/iJfaUwXoAHJkvSERGAoaqBbogw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9351
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

SGkgQWxpc3RhaXIsDQoNCj4gT24gRGVjIDE1LCAyMDI1LCBhdCA4OjQz4oCvQU0sIEFsaXN0YWly
IFBvcHBsZSA8YXBvcHBsZUBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIDIwMjUtMTIt
MTIgYXQgMTk6MTAgKzExMDAsIERpcmsgQmVobWUgPGRpcmsuYmVobWVAZ21haWwuY29tPiB3cm90
ZS4uLg0KPj4+IE9uIDEyLjEyLjI1IDA4OjU5LCBKb2VsIEZlcm5hbmRlcyB3cm90ZToNCj4+PiBI
aSBBbGV4LA0KPj4+IA0KPj4+PiBPbiBOb3YgMjIsIDIwMjUsIGF0IDEyOjAw4oCvQU0sIEFsZXhh
bmRyZSBDb3VyYm90IDxhY291cmJvdEBudmlkaWEuY29tPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IO+7
v1RoZSBzaXplIG9mIG1lc3NhZ2VzJyBwYXlsb2FkIGlzIG1pc2NhbGN1bGF0ZWQsIGxlYWRpbmcg
dG8gZXh0cmEgZGF0YQ0KPj4+PiBwYXNzZWQgdG8gdGhlIG1lc3NhZ2UgaGFuZGxlci4gV2hpbGUg
dGhpcyBpcyBub3QgYSBwcm9ibGVtIHdpdGggb3VyDQo+Pj4+IGN1cnJlbnQgc2V0IG9mIGNvbW1h
bmRzLCBvdGhlcnMgd2l0aCBhIHZhcmlhYmxlLWxlbmd0aCBwYXlsb2FkIG1heQ0KPj4+PiBtaXNi
ZWhhdmUuIEZpeCB0aGlzLg0KPj4+PiANCj4+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIENv
dXJib3QgPGFjb3VyYm90QG52aWRpYS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiBkcml2ZXJzL2dwdS9u
b3ZhLWNvcmUvZ3NwL2NtZHEucnMgfCAxMSArKysrKysrLS0tLQ0KPj4+PiBkcml2ZXJzL2dwdS9u
b3ZhLWNvcmUvZ3NwL2Z3LnJzICAgfCAgMiArLQ0KPj4+PiAyIGZpbGVzIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+Pj4gDQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9ub3ZhLWNvcmUvZ3NwL2NtZHEucnMgYi9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3Nw
L2NtZHEucnMNCj4+Pj4gaW5kZXggNmY5NDZkMTQ4NjhhLi5kYWI3MzM3N2M1MjYgMTAwNjQ0DQo+
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3AvY21kcS5ycw0KPj4+PiArKysgYi9k
cml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3NwL2NtZHEucnMNCj4+Pj4gQEAgLTU4OCwyMSArNTg4LDI0
IEBAIGZuIHdhaXRfZm9yX21zZygmc2VsZiwgdGltZW91dDogRGVsdGEpIC0+IFJlc3VsdDxHc3BN
ZXNzYWdlPCdfPj4gew0KPj4+PiAgICAgICAgICAgIGhlYWRlci5sZW5ndGgoKSwNCj4+Pj4gICAg
ICAgICk7DQo+Pj4+IA0KPj4+PiArICAgICAgICAvLyBUaGUgbGVuZ3RoIG9mIHRoZSBtZXNzYWdl
IHRoYXQgZm9sbG93cyB0aGUgaGVhZGVyLg0KPj4+PiArICAgICAgICBsZXQgbXNnX2xlbmd0aCA9
IGhlYWRlci5sZW5ndGgoKSAtIHNpemVfb2Y6OjxHc3BNc2dFbGVtZW50PigpOw0KPj4+IA0KPj4+
IElzIHRoaXMgaW1tdW5lIHRvIHVuZGVyIGZsb3cgd2l0aG91dCBvbmUgb2YgdGhlIGNoZWNrZWQg
c3VidHJhY3Rpb24gd3JhcHBlcnM/IEVpdGhlciB3YXksIHdlIHNob3VsZCBub3QgdG9sZXJhdGUg
dGhlIHVuZGVyZmxvdyBJIHRoaW5rLiBXaGljaCBtZWFucyBpdCBjYW4gcGFuaWMgd2hlbiB0aGUg
cnVzdCBvdmVyZmxvdyBjaGVja3MgYXJlIGVuYWJsZWQuIFNpbmNlIHRoZSBoZWFkZXIgbGVuZ3Ro
IGNvbWVzIGZyb20gZmlybXdhcmUsIHRoaXMgY2Fubm90IGJlIGd1YXJhbnRlZWQgdG8gbm90IHVu
ZGVyZmxvdyBpbiB0aGUgZXZlbnQgb2YgYSBtYWxmb3JtZWQgbWVzc2FnZS4NCj4gDQo+IEkgdGhp
bmsgd2UncmUgZ3VhcmFudGVlZCBub3QgdG8gdW5kZXJmbG93IGhlcmUgLSBjaGVjayBvdXQgdGhl
IGltcGxlbWVudGF0aW9uIGZvciBoZWFkZXIubGVuZ3RoKCk6DQo+IA0KPiAgICAvLy8gUmV0dXJu
cyB0aGUgdG90YWwgbGVuZ3RoIG9mIHRoZSBtZXNzYWdlLg0KPiAgICBwdWIoY3JhdGUpIGZuIGxl
bmd0aCgmc2VsZikgLT4gdXNpemUgew0KPiAgICAgICAgLy8gYHJwYy5sZW5ndGhgIGluY2x1ZGVz
IHRoZSBsZW5ndGggb2YgdGhlIEdzcFJwY0hlYWRlciBidXQgbm90IHRoZSBtZXNzYWdlIGhlYWRl
ci4NCj4gICAgICAgIHNpemVfb2Y6OjxTZWxmPigpIC0gc2l6ZV9vZjo6PGJpbmRpbmdzOjpycGNf
bWVzc2FnZV9oZWFkZXJfdj4oKQ0KPiAgICAgICAgICAgICsgbnVtOjp1MzJfYXNfdXNpemUoc2Vs
Zi5pbm5lci5ycGMubGVuZ3RoKQ0KPiAgICB9DQo+IA0KPiBTbyB0aGUgYWJvdmUgY2FsY3VsYXRp
b24gZXhwYW5kcyB0bzoNCj4gDQo+IG1zZ19sZW5ndGggPSBzaXplX29mOjo8U2VsZj4oKSAtIHNp
emVfb2Y6OjxiaW5kaW5nczo6cnBjX21lc3NhZ2VfaGVhZGVyX3Y+KCkNCj4gICAgICAgICAgICAr
IG51bTo6dTMyX2FzX3VzaXplKHNlbGYuaW5uZXIucnBjLmxlbmd0aCkgLSBzaXplX29mOjo8R3Nw
TXNnRWxlbWVudD4oKTsNCj4gDQo+IFdoZXJlIHNlbGYuaW5uZXIucnBjLmxlbmd0aCBpcyBndWFy
YW50ZWVkIHRvIGJlID49IHNpemVfb2Y6OjxycGNfbWVzc2FnZV9oZWFkZXJfdj4oKSBieSB0aGUg
Y29uc3RydWN0aW9uIG9mIHRoZSB0eXBlLg0KDQpCdXQgdGhpcyBsZW5ndGggZmllbGQgaXMgY29t
aW5nIGZyb20gdGhlIGZpcm13YXJlLCBjb3JyZWN0PyBUaGUgZ3VhcmFudGVlIGlzIHByb3ZpZGVk
IGJ5IGZpcm13YXJlLCBub3QgYnkgUnVzdCBjb2RlIGNhbGN1bGF0aW5nIHRoZSBsZW5ndGguDQoN
Ck1heWJlIFJ1c3QgdmFsaWRhdGluZyB0aGF0IHRoZSBsZW5ndGggbWF0Y2hlcywgb3IgaXMgZ3Jl
YXRlciB0aGFuIG9yIGVxdWFsIHRvLCB0aGUgbWVzc2FnZSBoZWFkZXIgd291bGQgYmUgb25lIHdh
eSB0byBhdm9pZCBkb2luZyB0aGUgY2hlY2tlZCBzdWJ0cmFjdGlvbi4gSSB3b3VsZCBzdGlsbCBi
ZSBjb21mb3J0YWJsZSBkb2luZyB0aGUgY2hlY2tlZCBzdWJ0cmFjdGlvbiBpbiBjYXNlIHRoZSBm
aXJtd2FyZSBwYXlsb2FkIGluIHRoZSBtZXNzYWdlIGJ1ZmZlciBpcyBjb3JydXB0ZWQgYW5kIHRo
ZSBsZW5ndGggZmllbGQgaXMgY29ycnVwdGVkLg0KDQpJIHRoaW5rIFJ1c3QgY2Fubm90IHRydXN0
IGZpZWxkcyBjb21pbmcgZnJvbSB0aGUgZmlybXdhcmUgYW5kIG5lZWRzIHRvIGNoZWNrIHRoZW0g
dG8gcHJldmVudCB1bmRlZmluZWQgYmVoYXZpb3IuIE9yIG1heWJlIHRoZSBwb2xpY3kgaXMgdG8g
aW5jbHVkZSBzYWZldHkgY29tbWVudHMsIGxpa2Ugd2UgZG8gd2hlbiBleHBlY3RpbmcgQyBjb2Rl
IHRvIGJlaGF2ZSBpbiBhIGNlcnRhaW4gd2F5LiBJIGRvIG5vdCBrbm93LiBCdXQgd2Ugc2hvdWxk
IGlkZW50aWZ5IHRoZSBwb2xpY3kgZm9yIHRoaXMgYW5kIHN0aWNrIHRvIGl0IGZvciBmdXR1cmUg
c3VjaCBpc3N1ZXMuDQoNCkkgdGhpbmsgb25lIHdheSB0byB2ZXJpZnkgdGhhdCB0aGVyZSBpcyBh
IFJ1c3QgZ3VhcmFudGVlIGFib3V0IHRoZSBsZW5ndGggZmllbGQgaXMgdG8gZG8gdGhlIHVuY2hl
Y2tlZCBzdWJ0cmFjdGlvbiwgY29tcGlsZSB0aGUgY29kZSwgYW5kIHRoZW4gc2VlIGlmIHRoZSBn
ZW5lcmF0ZWQgY29kZSBoYXMgYW55IHBhbmljcyBpbiBpdCAoV2l0aCB0aGUgb3ZlcmZsb3cgY2hl
Y2tpbmcgY29uZmlnIGVuYWJsZWQuKQ0KDQpJZiBpdCBkb2VzLCB0aGVuIGRlYWQgY29kZSBlbGlt
aW5hdGlvbiBjb3VsZCBub3QgZGV0ZXJtaW5lIGF0IGNvbXBpbGUgdGltZSB0aGF0IHRoZSBzdWJ0
cmFjdGlvbiB3b3VsZCBub3Qgb3ZlcmZsb3cuIFJpZ2h0Pw0KDQo+IA0KPj4gV291bGQgdGhpcyBi
ZSBhIHBvc3NpYmxlIHVzZSBjYXNlIGZvciB0aGUgdW50cnVzdGVkIGRhdGEgcHJvcG9zYWwNCj4+
IA0KPj4gaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzEwMzQ2MDMvDQo+PiANCj4+ID8NCj4gDQo+
IFJlc3BvbmRpbmcgaGVyZSBiZWNhdXNlIEpvZWwgYXBwZWFycyB0byBoYXZlIHNlbnQgYSBIVE1M
IG9ubHkgcmVzcG9uc2UgOy0pDQoNClNvcnJ5LiA6KQ0KDQo+IA0KPiBJIGFncmVlIHdpdGggSm9l
bCdzIHBvaW50cyAtIHRoaXMgZG9lcyBzb3VuZCB1c2VmdWwgYnV0IGFzIGEgc2VwYXJhdGUgcHJv
amVjdC4NCj4gSSdkIGltYWdpbmUgd2UnZCB3YW50IHRvIGl0IG9uZSBsYXllciBsb3dlciB0aG91
Z2ggLSBpZS4gaW4gdGhlIGNvbnN0cnVjdGlvbiBvZg0KPiB0aGUgR3NwTXNnRWxlbWVudC4NCg0K
QWdyZWVkLCB0aGFua3MuDQoNCiAtIEpvZWwgDQoNCg0KDQo+IA0KPj4gQ2hlZXJzDQo+PiANCj4+
IERpcmsNCg==
