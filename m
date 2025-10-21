Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB60BF8FD5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 23:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BB110E357;
	Tue, 21 Oct 2025 21:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mYdHqKkh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011061.outbound.protection.outlook.com [40.107.208.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAE410E356;
 Tue, 21 Oct 2025 21:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBnLCRQVRteud9nrhXXzTiGo4Q05l10QycBuhQMPmSsTGjA8nRiIoJnZhNo0FUqbXdE4UhsiDDQ6itPV6nfcA9om0LY6np6/BEVp9fWYLLgtCqvT/bptpsk8c65zZDTKiZbSp2huVMk6Bq9+OWnQdXPWcvKge8am48sQWdvP8DKdj0hVgkFifAh2sSw+JSEJXQyQjIBTpQJfZ8bpY4v98PHrI5B60CU54CLM31U+Xi+7fdGn0Q6sityeFT9u7NqmqY7KsA0rcW6ebD4qBlxOIHbbcTwiTMrhYIxQvaGeab9s1wvxwWr+2BIXKCyrJ3/HJWNmn5BTii0Br+eZEZG5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyYq+gT2xKptfoXk1WJdgv27wOX/TYvSeqcrj/6ax54=;
 b=AarPWp+bMcuIxd18g5xoBIqq3ovrh4qKN/PgzasWH1rQZd6T/aQ3RinSBuL/N+0M+0zuhJsdi2dmNvxXtV3JefkX6UApszzlPhHr1FaBVplIJQEtj1c+GZBr/Af/sj7YNCTOAp8bi1UCwGDWj364mIOQ99+UIJPVIBXxZM/qVPEBWm8NO3CrEBUH8BeXafMRoIZiSF60iQhyB9X3JaAPFSxXlmwmt7VnlwhiaNaviAa4Lxulsglk1l69QRdHdXEQ75swa2RyCOQFRkEl+CN9ZvHV9/tRRIe2i095TRQ7nNtptd1VhR6Z99vU9pZjv8XZDQkLW9Fyd22ILjDzmYy+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyYq+gT2xKptfoXk1WJdgv27wOX/TYvSeqcrj/6ax54=;
 b=mYdHqKkhqSJ/AkkD5xLSxL1nakNeow3I/KT4ZCFZS0vraCuVpgpZFZZYn9vFIcurZQS4YDmhp+hgJZAQjUrLh2ReZfUPkJy5El+k8MApOi5poL7yQxuSKST5nYiv0uLCKjYaSnnu5kruVrSTfOXKe2iV0XNDiiWDFYqUo+SoSCt9mymbETQdmQ4hTWOfEBCZ8a3UbtHAln2m4oCfFdCvIGj53i+N73nZL2qGnDfQV6NcJb454pMcDOJxkZqgBWZM6kZHG1p5mdBcgzDK7FyxD9DP01hTs/QUQdnj41WLrqW3w9jIV3+4/K/9ENeopPT3gPIwdf/XOjBVI9UQ8hXBdQ==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB8781.namprd12.prod.outlook.com (2603:10b6:a03:4d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 21:58:37 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 21:58:36 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Timur Tabi
 <ttabi@nvidia.com>, "joel@joelfernandes.org" <joel@joelfernandes.org>, Elle
 Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida
 <daniel.almeida@collabora.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
Thread-Topic: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
Thread-Index: AQHcQfMtaAN7hmZj90ONxNxJIQOdf7TLhP2AgAFnpoCAACKPgIAAGJuN
Date: Tue, 21 Oct 2025 21:58:36 +0000
Message-ID: <42A44181-C64E-4804-95BC-828D0C604A89@nvidia.com>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-8-joelagnelf@nvidia.com>
 <8680705c-7298-4a33-979c-d91bd4e65b1c@nvidia.com>
 <a4241841-b9cc-46ce-baa8-91545c2aa4ee@nvidia.com>
 <fac90f9e-0389-41de-86b7-18b13832f413@nvidia.com>
In-Reply-To: <fac90f9e-0389-41de-86b7-18b13832f413@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|SJ2PR12MB8781:EE_
x-ms-office365-filtering-correlation-id: 794aa070-abcc-46c3-7f38-08de10ecfc86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?RXE0dGpySmRXTk9tZ0tiVy94WEtCVUxlNFlqQmVYUEhjZ2VmNmI1MXU2bG5T?=
 =?utf-8?B?V2xZVkR0K2hsVU5IeURmQS9hU3VXamNOQnYwdFJCQkNYb3RNeWRhckhqZm9u?=
 =?utf-8?B?TXRmazdURVdRQVg0VXZWajZQNHAvVUwySUVGSDBlMW1BVWxTeUxvcmN1eGZu?=
 =?utf-8?B?NlQzYmtGb2VpUmlYdStHNDN5QnduZng4a1hUNFdPdXdQNmVOeEkzUnlqdy9D?=
 =?utf-8?B?MFJXRDNGWFd2TlNoNGYyZW5PN1NNdlI0dThTWGcxaDg2WHcvcHBKay9mVHNr?=
 =?utf-8?B?UDF5bjh3SGpyQVpFWUxRZDdCdmJ5UmErMkoxa21ETmVGVHp4aUVhQU1ZMFc3?=
 =?utf-8?B?YytRM3ZMc2RMb00wbURKbjlYQWh3MHhyNWFIeVVBVXFVbGd2WGVpbTdleHUw?=
 =?utf-8?B?UzFZNldrZW01ekM5WXcxY1lOQTRidDl6VEEzVDA5WXBBZk9BNjRoWkJtUmFv?=
 =?utf-8?B?ZWpnYnRxWVI3bXFTTkhHMHdJNDlNS2Y1VmpPYU5nV2NIUXVBMk5KUXRZZmRh?=
 =?utf-8?B?MldIdUhEb2cxZEI2RHN3YkJpY3JkMmwxdndQRC81L3dIODRKb21KNEhoVXJJ?=
 =?utf-8?B?TFhEa3hkVGt4dGJlNnM4NXU5SE5zcmpQK2UyY2IzTFByckZFMlBPOHJUQWJw?=
 =?utf-8?B?d0hqaUQxMDJzNzhEV3RKTk91NllSNFNhalBRTzg2aGVFcCtCU1BSMStYa0pi?=
 =?utf-8?B?OGhhVnFFNXVhOGs0cVB6VW1aUG5tMFl0b0NwbHJ1TzJnQUhXZVYwMFpkdUkw?=
 =?utf-8?B?bXRrMnplTkd2ajlBSjZCZzlmUzFMcDZ4Q21RMUtGN0h5S2xHYkhGb2RpcStx?=
 =?utf-8?B?NVROT0lJYS9WRW5QYTlIUU5DVmNvOXNqdmRsTDJjeVlCcWJoN2szWjE1T2dp?=
 =?utf-8?B?UmlVSW1HQkZLdTk1WHhIRytoL3dCVm1UWXBZZ0p5NXdURU8wQXlvMGZsNi9z?=
 =?utf-8?B?UDc5VXlBRnI0N2hJbUtIaFJXYloyMTR1QWVxTkJzK1hscDc2bzY5OGtSUkwr?=
 =?utf-8?B?c1NjMFlSeVA5ZXFaYTYzOVNhdkl5SHc1NjgxQU9GU0RvS1IzaEVuWFBWSGY5?=
 =?utf-8?B?NlNiYkhyVE44aHAxRDRsMXBtZU95OUwvVU4vWXRCVjhlSmVYNjlBOCt1VU5O?=
 =?utf-8?B?NFJYZU1aaGlOVjJGdVQ4QVVnVStpa0hVSUdZd3RCenAxQ1h0K0JqdTBEdVB3?=
 =?utf-8?B?aTZhN2VSaGFSSE5EMEtEaDNoNUJFOEN3aytBeTVZRmYvRnljUTZaNGk3cGhr?=
 =?utf-8?B?KzZvTUt4RkFtbHlnUXpOMzhxWm51UFFYeHo2U2VqNHF3b2F4RE53RHJjRDlN?=
 =?utf-8?B?RVBIbElIMjdTNHp1Y3p1N1NZd3pDUU0vYWVEcnR5Lys0eVBOdlhRWU5HaU9M?=
 =?utf-8?B?SFJFQ1hNMUlaREV2UUYxcUF3dExZYU1GTWRsbWp5c1IxVGYrYiszK3RlK0o4?=
 =?utf-8?B?Zk90NVhyb0NrRHNhVUdBUnpsY1dwblJGbkpScE9WS1pzclZndkpFTWt1bDdS?=
 =?utf-8?B?VXcyQ2ZmWTRWNTJFTTNJUGMrcGJKNU9LOEMyWElpWGFLMUgrK2lCdFBWYWJw?=
 =?utf-8?B?Szg5SFhQK2Z5T1Nvc2d2RmhkUTl2dEdLQlZQelRmeEFuZ0s4Z1g5dkdZN0hZ?=
 =?utf-8?B?dStreDVjVnBZWU1KNzNKRWkyOWdrVURmL0s5VElmZVhrVG5JSEdMSXNIK2VI?=
 =?utf-8?B?SzBUWFhFTXI5Mlh1QmFxYjRBMytOZDFCZ015MzVnamZxaFVLeUJnTHVrYklu?=
 =?utf-8?B?K1RTeXRWYjRORlFqVlh2azkwYVlSTURTdDIwTldNTnowT0pEdE9mSnVxeTNY?=
 =?utf-8?B?eWlDRzlkTFFLaC82V3ZtZk5XZUpjdFgzQU9peDlYTEszSk9jNHkrVjFkOW5i?=
 =?utf-8?B?WkhFQnNWVmtlQkQ3Yjl2QVA5U2xDeGFWYzFBMnRBa0hXcXRuVWtEOUV5cVdm?=
 =?utf-8?B?clIxMk1iaDFpc0VvdDQxTlNVakk1OVJsR0VMY3AxWXFzcFZ2eTRPQjU5NWsx?=
 =?utf-8?B?UndUSVRRQVdyYjNXNXVRamNSREl0VEpwTlNpU005VFgzS1p4L2FzZ09hOGt5?=
 =?utf-8?Q?Qp7mtP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFkyeDc0Z0RTTElqUXpWQlIyQjlUTFkzMXQ0YXFoNlh1NzVPcXZlY2NNZ3A1?=
 =?utf-8?B?WktJRWtyakJLbHM4eWhUcExodjVoZ05xWnVkbmllY3JQT2ZESlRJYkN2NEk2?=
 =?utf-8?B?RHlRWVhLUFQ3dXpNYmU0ZldCWTVkenhXMDg0U0h2NjQvUklwWjVuQ3F4VXdT?=
 =?utf-8?B?d1VBRC9BZGdLS1VIdGpJNEc2aUJQckFRcFNpL2M0a0NGWVFOOHBkZnh2OHZW?=
 =?utf-8?B?WUJ6dkF3c0pvYVVEVC9LSHIvbXJObVZRYThMUW5MY1AvODN2NlJwS0pScTMy?=
 =?utf-8?B?aHU2Ump2eU4xN1M1S2RHV3B6ZExjd3lUY2xzeG1tRm9OcXhKQ0QzMWFScEJ4?=
 =?utf-8?B?bWg4T2NyeWVHanZSbW1HYzROMWd2OFRIMHFTWEtjQTFBd2w3VkduR2JuMFFB?=
 =?utf-8?B?NkZxZ2JiOTdvVFlrMkVhWkNueGp6RnpzQjlBUDFHRHZRc0dXTTJZSE5UaHZM?=
 =?utf-8?B?L09rNGlBYzhuamNnQ2ZnM1Vvcnk5cEt6VGF3bGFpYjhNNzMvbi90THFIdGoz?=
 =?utf-8?B?QkYycVdBeTlyQXIrZDFhZWxES2NPcjFJUkJHanBpRlRyVmRFbmIySmhUaEJ0?=
 =?utf-8?B?S1BsRlVudmllK2Zkc0ZwbjRpd0ZHT3MvRFFwVGFoaG82VWQ2NG5NcC8xaWRL?=
 =?utf-8?B?VGxtYytkNGlvbGJrZHNScnl0dXR0TzIxUDhlYnJrVVphK3RiZVVhdjRnalFl?=
 =?utf-8?B?TXVXczZZOU9HSThPN2J5RHdVVnRtTW5paEgzZm9ZSzFKYzhYVnVJU0pDQlVW?=
 =?utf-8?B?cnFZTVdUVHYvdm9SREtISC9ZTFhjOW5TRWR4elc1bHRTSzNmUXRRbkdaQTlM?=
 =?utf-8?B?YkJnRWlHa3k1eElyaHNWdTVBUWFiWnJmeExHZVNqSVhyNDByeGJzb0FLRER2?=
 =?utf-8?B?K0hhVjBZT2hoOUtROHpyWjRGYWl6VXI0WFBlRDBaTHJpL1NxLzV2K21tZEtJ?=
 =?utf-8?B?cVNGR1crMTY4VW4xRDlrQUpROEtOR2h4QWkvZ3VBZFBQU2pySUVZR20rZlND?=
 =?utf-8?B?ZWlrRTN4djcyNFpxdloxTnF4SHhuSjJVck1PWlZnZFNPdWlxbHZGTVJ6cVpT?=
 =?utf-8?B?VGM0RVp2cXpnMmpnZFZGZ0NqWkpDUFZCdldBUDNMdDZLdEF1bGdqREpTTVVk?=
 =?utf-8?B?dUIyeXhSUnUwd291STE4Sk9XOSt4bVYxdHJGaG5BUmc1SnAwUU4zbUFVcWZB?=
 =?utf-8?B?WUh2VUZTb0RzSU1TWDhubnQ4eURJdzByTG9yVDNoTUNhbm9ZVno4TWcxYlh6?=
 =?utf-8?B?Q3daaWRyYTBjbERTUkRBd0hzMmkwQVlwbUdGNlVDTGJjVWlzdmlVRVRLK3lT?=
 =?utf-8?B?cWRQWG5qTzRFakxienVhbVZIMnFvazhjZy85R2gvczFFTTErS0QxMWtqbElO?=
 =?utf-8?B?MlJIMjRnYzYxTnp3VVoyT1Urc3B5MlhZcmp3WEhpbThJR1pHQlBVTTRoZnhV?=
 =?utf-8?B?M2gwQU1pZy9aZ0wyVXptWUR3aGM0MitMZjhDd3MxQ3JuQjNLVW1Sd3dtSDFk?=
 =?utf-8?B?aDFoeHpUUFU0SzBoWVF0cDlHK0t3Kzl5MGZCTWF3WU10Zkk5UUpJVHZtQ2Rt?=
 =?utf-8?B?WjB3UzdKVXVpUUJBbkpjWmt5bUlwdWI4WGpwdXp0Z3o4WXlVdFI1VlZKY2cx?=
 =?utf-8?B?Y2xRbEJJQ0w4V2dvQmV4eVhpYnNkVSs5R01pbHE1NXg4Z0c3aFY0a1JhdkFq?=
 =?utf-8?B?blVVdjRGSWpCdzY3RjdRLyt5dE1XaEpFbW9mczhoUkVRVW9EdHg5bisxSm1G?=
 =?utf-8?B?eWg5NGJ2czRpQjVVdkxBNnJDbUhFTHhUcFJVTHlUMXd6MFRRWjAzQlM1TzY1?=
 =?utf-8?B?S1czMU52cjFNS2RkRGU5endTTm82WDJLSzdSaS9SaEh5WDVRekZFY2lYb3ls?=
 =?utf-8?B?clhkc0tuaEJseTg1L1A2aFRkTjBrL1NOZ21jWVJFWjVySE1LU1ptaXN4MlRI?=
 =?utf-8?B?Z2VML0tBcWhtdUJndGdXWU9EMFdkZElwUGZkVGw0VGlOWUJhdk9mL2J2bUdZ?=
 =?utf-8?B?NDA1cmMwckJUQ2xQeTkyL3RDL1V6MWJYMGNER1NRUXlGSDl5OGg3YmJqUGVH?=
 =?utf-8?B?MzJkVklCaVI0UG9ORlZZZkl0ajh2SEhzUUhiVGk5S0NJakhuZUE0cko5YXhr?=
 =?utf-8?Q?huvcwxDtxsQT8tzryI0tjWRPm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794aa070-abcc-46c3-7f38-08de10ecfc86
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 21:58:36.7843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g/t09VaYX85MAMKCU6fMpo2dYIwlXW5ialUrilCPvQAcpRSCY+I04j1OdnflClg9cYIbJZjcMzk1K5KXzuREog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8781
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

DQo+IE9uIE9jdCAyMSwgMjAyNSwgYXQgNDozMOKAr1BNLCBKb2huIEh1YmJhcmQgPGpodWJiYXJk
QG52aWRpYS5jb20+IHdyb3RlOg0KPiANCj4g77u/T24gMTAvMjEvMjUgMTE6MjYgQU0sIEpvZWwg
RmVybmFuZGVzIHdyb3RlOg0KPj4+IE9uIDEwLzIwLzIwMjUgNDo1OSBQTSwgSm9obiBIdWJiYXJk
IHdyb3RlOg0KPj4+PiBPbiAxMC8yMC8yNSAxMTo1NSBBTSwgSm9lbCBGZXJuYW5kZXMgd3JvdGU6
DQo+Pj4gLi4uDQo+PiBZZXMsIHRoZXJlJ3MgZGlmZmVyZW50IGZvcm1hdCB2ZXJzaW9ucy4NCj4+
IA0KPj4gVGhpcyBwYXRjaCBzdXBwb3J0cyBhbGwgVHVyaW5nIGFuZCBsYXRlciBHUFVzIGJlY2F1
c2UgYWxsIEdQVXMgaW5jbHVkaW5nIEhvcHBlcisNCj4+IGFyZSBiYWNrd2FyZCBjb21wYXRpYmxl
IHdpdGggdmVyc2lvbiAxLiBIb3dldmVyIHRoZXkgd29udCBiZSBhYmxlIHRvIHVzZSB0aGUNCj4+
IHZlcnNpb24gMiBhbmQgMyBmZWF0dXJlcyB3aXRoIG9ubHkgdGhpcyBwYXRjaC4NCj4+IA0KPj4g
SSBraW5kIG9mIGludGVudGlvbmFsbHkgZGlkIHRoaXMgZm9yIGEgZmlyc3QgY3V0LiBCdXQgeWVz
LCBJIGNvdWxkIHNwbGl0IGl0IGludG8NCj4+IHZlcnNpb25zLiBUaGUgMyBNTVUgc3RydWN0dXJl
cyAoUFRFLCBQREUgYW5kIER1YWwgUERFKSBhcmUgdmVyc2lvbmVkLiBWZXJzaW9uIDINCj4+IGlz
IFR1cmluZyBhbmQgbGF0ZXIuIEhvcHBlcisgaXMgd2hlbiBWZXJzaW9uIDMgZ290IGludHJvZHVj
ZWQgYW5kIGl0IGlzIGFsc28NCj4gDQo+IEFoLCB0aGVuIHdlIHNob3VsZG4ndCBldmVuIGRvIHZl
cnNpb24gMS4gV2Ugc2hvdWxkIHRha2UgZnVsbCBhZHZhbnRhZ2Ugb2YNCj4gdGhlIGZhY3QgdGhh
dCBOb3ZhJ3MgZWFybGllc3QgR1BVIGlzIFR1cmluZy4NCg0KTWFrZXMgc2Vuc2UsIHRob3VnaCBv
bmUgYWR2YW50YWdlIG9mIGp1c3QgZGVmaW5pbmcgdmVyc2lvbiAxIHRvbyBpcyBpdCBtYXkNCmJl
IGEgZ29vZCByZWZlcmVuY2Ugb3IgYSBmYWxsYmFjayBzaG91bGQgd2UgZXZlciBuZWVkIGl0IChF
c3BlY2lhbGx5IHNpbmNlIGl0DQp0b29rIG1lIDIgbW9udGhzIHRvIGJlIGdldCBteSBub3ZhLWNv
cmUgTU1VIGNvZGUgd29ya2luZyBhbmQgaXQgbWF5IGJlDQpuaWNlIHRvIGhhdmUgYSBmYWxsYmFj
ay4gTGV0IG1lIHRoaW5rIGFib3V0IGl0LCBJIGJlbGlldmUgaXQgd2lsbCBiZSBqdXN0IGZldyBt
b3JlDQpsaW5lcyBvZiBjb2RlLCBzbyBzaG91bGQgbm90IGJlIHRoYXQgYmFkLikNCg0KPiANCj4+
IGJhY2t3YXJkIGNvbXBhdGlibGUgd2l0aCBWZXJzaW9uIDIuDQo+PiANCj4+IFdlIGNvdWxkIGV2
ZW50dWFsbHkgc3VwcG9ydCB2ZXJzaW9ucyAyIGFuZCAzIChpbnN0ZWFkIG9mIGp1c3QgdmVyc2lv
biAxIGFzIEkgYW0NCj4+IGRvaW5nKSwgaG93ZXZlciBteSB3b3JraW5nIE1NVSB0cmFuc2xhdGlv
biBwcm90b3R5cGUgaXMgYmFzZWQgb24gdmVyc2lvbiAxIChJDQo+PiBkaWQgbm90IGhhdmUgdG8g
Y29uZmlndXJlIGFueXRoaW5nIGluIHRoZSBNTVUgdG8gc3dpdGNoIHZlcnNpb25zLCB0aGlzIHdh
cyBkZWZhdWx0KS4NCj4+IA0KPj4gVGhlcmUgYXJlIGEgY291cGxlIG9mIG9wdGlvbnM6DQo+PiAN
Cj4+IDEuIEZvciBzdGFydGVycywgc3VwcG9ydCBvbmx5IHZlcnNpb24gMS4gRHJhd2JhY2sgaXMs
IHdoZW4vaWYgd2Ugd2FudCB0byB1c2UNCj4+IHZlcnNpb24gMiBhbmQgMyBmZWF0dXJlcywgaXQg
bWF5IHJlcXVpcmUgc29tZSByZXdvcmsuDQo+PiANCj4+IDIuIEhhdmUgdGhlIGZvbGxvd2luZyBo
aWVyYXJjaHk6DQo+PiBtbS90eXBlcy5ycyAtIGFsbCBjb21tb24gc3RydWN0dXJlcyAoc3R1ZmYg
dGhhdCBpcyBnZW5lcmljIGxpa2UgUGZuKS4NCj4+IG1tL3R5cGVzL3ZlcjEucnMgLSBWZXJzaW9u
IDEgc3BlY2lmaWMgdHlwZXMuDQo+PiBtbS90eXBlcy92ZXIyLnJzIC0gVmVyc2lvbiAyIHNwZWNp
ZmljIHR5cGVzLg0KPj4gbW0vdHlwZXMvdmVyMy5ycyAtIFZlcnNpb24gMyBzcGVjaWZpYyB0eXBl
cy4NCj4gDQo+IE1heWJlIGEgZmlsZS9kaXJlY3Rvcnkgc3RydWN0dXJlIHRoYXQgbW9yZSBkaXJl
Y3RseSBpbmRpY2F0ZXMgcGFnZSB0YWJsZQ0KPiBmb3JtYXRzLiAibW0vdHlwZXMiIGNvdWxkIGJl
IHF1aXRlIGEgZmV3IHRoaW5ncy4NCj4gDQoNCkFncmVlZCwgdGhvdWdoIG1tL3R5cGVzIGFsc28g
Y29udGFpbnMgb3RoZXIgbm9uLXBhZ2V0YWJsZSBzdHJ1Y3R1cmVzLg0KSSBjb3VsZCBwcmVmaXgg
dmVyMS8yLzMgd2l0aCBwYWdlX3RhYmxlc18sIHNvIGl0IHdvdWxkIGJlIGxpa2U6DQptbS90eXBl
cy9wYWdlX3RhYmxlc192ZXJ7MSwyLDN9LnJzLiBUaGF0IGlzIG11Y2ggbW9yZSBjbGVhci4NCg0K
PiANCj4+IHZlcnNpb24gKHdoaWNoIGlzIHJlYXNvbmFibGUpLg0KPj4gDQo+PiA1LiBZb3VyIG9w
dGlvbnMgaGVyZS4NCj4+IA0KPj4gQnR3LCBJIHVzZWQgTm91dmVhdSBhcyBhIHJlZmVyZW5jZSBh
cyB3ZWxsLCBzbyBsaWtlbHkgTm91dmVhdSBkb2Vzbid0IHN1cHBvcnQNCj4+IHZlcnNpb24gMiBh
bmQgMyBmZWF0dXJlcy4gTm90IHRoYXQgdGhhdCBtYXR0ZXJzICh3ZSBzaG91bGQgc3VwcG9ydCBu
ZXdlcg0KPj4gZmVhdHVyZXMgaW4gbm92YS1jb3JlKSwgYnV0IGp1c3QgdGhvdWdodCBJJ2QgbWVu
dGlvbiBpdC4NCj4+IA0KPj4gT3RoZXIgdGhvdWdodHM/DQo+IA0KPiBUd28gdGhpbmdzOg0KPiAN
Cj4gMSkgRGFuaWxvIGlzIHdvcmtpbmcgb24gd3JpdGluZyBkb3duIGxvY2tpbmcgcmVxdWlyZW1l
bnRzIGZvciBOb3ZhIHBhZ2UNCj4gdGFibGVzLCBiYXNlZCBvbiBlYXJsaWVyIGV4cGVyaWVuY2Ug
d2l0aCBOb3V2ZWF1IHBhZ2UgdGFibGUgbG9ja2luZw0KPiBwcm9ibGVtcywgd2hpY2ggd2VyZSBh
cHBhcmVudGx5IHZlcnkgc2VyaW91cy4NCg0KU3VyZSwgdGhvdWdoIEkgYmVsaWV2ZSBpdCBzaG91
bGQgbm90IGJsb2NrIHRoZXNlIHBhdGNoZXMgYmVjYXVzZSB3ZSBhcmUNCm5vdCB5ZXQgZGVzaWdu
aW5nIGhpZ2hlciBsZXZlbCB1c2Vycy4gVGhlc2UgcGF0Y2hlcyBqdXN0IGV4cG9zZSB0aGUgc3Ry
dWN0dXJlcw0KYW5kIHRoaW5ncyBsaWtlIGxvY2tpbmcgc2hvdWxkIGJlIGJ1aWx0IGF0IGEgaGln
aGVyIGxldmVsLiBJIGJlbGlldmUgRGFuaWxvDQppcyByZWZlcnJpbmcgdG8gcGFnZSB0YWJsZSBs
b29rIHVwcyBhbmQgdXBkYXRlcywgdGhhdCB3aWxsIGEgZGlmZmVyZW50IG1vZHVsZQ0Kb3V0c2lk
ZSBvZiB0eXBlcy4NCg0KPiAyKSBNYXliZSBpdCB3b3VsZCBiZSBnb29kIHRvIHN0YXJ0IHdpdGgg
dmVyc2lvbnMgMiBhbmQgMywgc28gdGhhdCB3ZQ0KPiBjYW4gc2VlIGhvdyB0byBkbyA+MSB2ZXJz
aW9uPw0KDQpZZXMgSSB3aWxsIHN0YXJ0IHdpdGggdmVyc2lvbiAyLCAzLiBJZiB2ZXJzaW9uIDEg
aXMgc2ltcGxlLCBJIG1heSBpbmNsdWRlIHRoYXQNCmluIHRvbyBmb3IgdGhlIGJlbmVmaXQgb2Yg
bXkgd29ya2luZyBwcm90b3R5cGUgaWYgdGhhdCBpcyBPayA6KSBXb3JzdCBjYXNlLA0Kd2UgaGF2
ZSB0byBqdXN0IGRlbGV0ZSBhbiBleHRyYSBmaWxlIHNob3VsZCBiZSBub3QgbmVlZCBpdCA6KQ0K
DQp0aGFua3MsDQoNCiAtIEpvZWwNCg0KPiANCj4gdGhhbmtzLA0KPiAtLQ0KPiBKb2huIEh1YmJh
cmQNCj4gDQo=
