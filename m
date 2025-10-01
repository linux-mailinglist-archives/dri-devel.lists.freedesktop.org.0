Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19B4BB149E
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 18:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3B710E735;
	Wed,  1 Oct 2025 16:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pwnpYRtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912AB10E72F;
 Wed,  1 Oct 2025 16:46:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwIrlW3lfE5SFoE3mQkIQ7Kf+1bnz0gzNQeRSjEvgAfZIJbV4UMnjkDcX1doXktdJPhtSmeCKQF/oduaiQX4N/trOhJ+aQDrrJ4iFZb4uQkkQ24g5OvL5SGznYXySvfnHdFqJxvRymD8XJUAXILbjVFxi94Ci2cuOIb2fxMcSROqmzO02euFevO40IbSRn6Mnu9uOwkQSzaQ36R8vsADAu8M+O9zad4jzJ13/2iMduSfrfkTFC97Qfk/gDCSG6MwS7UlMYxDLqCPQnU5V33Qt3vND9vkAEIge7UscflSNeacBXCQp54kLEzheJzh1CdvU777eQbNyTAR22A9bn33Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvdzynR94Pq7VOa7XHDjTnASyGv4LD2/k/oLC3P4WnA=;
 b=g8iZagH0MnGpTpEB9EhkmmdyM9dVtYjyiKxe5Ger7inuGzZXEMN8k62ZRVPXxIx4CKSxNL6GFPXogfkKaW6weaYySvNVgNLiBLLBG9m3w9H/6doNgphkkEtdAjN3I2GjLay8EUrX+903t0vHXicBKUfes5V2FYPR2bbAI+u7icuqHzBUMY8h54RNoX7aLXb+E/4cAMUbFfJeVIihtsP1JScQPP3h8tSXLvwXFydh73CKlvGXlkZFWh1CPL4USc0bLqmNJweSaB7CVqbuHI5QL6fsgDIFOEBZkVBvIOYfxG7ygB3i1DAiBfF6rAOghCzTOrRbXHd+bDApwQsP57j/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvdzynR94Pq7VOa7XHDjTnASyGv4LD2/k/oLC3P4WnA=;
 b=pwnpYRtbql+kQOkdJ476KysePq7UFGj15daBcHOtDDrXIP7bdxWC7OTopBdjOjxauDlswEehvPj8erdGMvXEs6iBWVdyGsTJ6WofTai52OhzsjxtKdgA/0kUSoTVx3+CzbhZPmYUMmsabeSIl0ToxXW3Pm38lb+dG4PWQft5wufS3y/Zmn1MN4b8a8FIzWCrr0VfRBpfRwVBqblByN6jEyaE8VA4fKUtgiAq6nXuUgSuVJt6ao8kR5we+A8gH19DwP8vlFi8TS5F8HM+D+umaoZM2EUZyWzsI5O8Tuv2sIe9j8dPnOGv9uZcYx4karThYqFT6zDylKzGY+95UgcWxg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH0PR12MB5631.namprd12.prod.outlook.com (2603:10b6:510:144::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 16:46:47 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 16:46:46 +0000
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
Subject: Re: [PATCH v3 10/13] gpu: nova-core: gsp: Create RM registry and
 sysinfo commands
Thread-Topic: [PATCH v3 10/13] gpu: nova-core: gsp: Create RM registry and
 sysinfo commands
Thread-Index: AQHcMgyfpL8Jj0HjREWVuyTz4FiX2LStgdiA
Date: Wed, 1 Oct 2025 16:46:46 +0000
Message-ID: <944d69d9916e53f76e4180b02c63e0f94b2c8950.camel@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
 <20250930131648.411720-11-apopple@nvidia.com>
In-Reply-To: <20250930131648.411720-11-apopple@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH0PR12MB5631:EE_
x-ms-office365-filtering-correlation-id: 91dfe188-9add-47c2-18ee-08de010a1c2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?V1d2RjhTSDltRDFxdm1KM3RWTS9uZDdZd3hLWjZBSW05R2lTRE9LUDJKSFJr?=
 =?utf-8?B?UUU1cW9UNE4xU3dUbmdsTkdIRkNkTnNjOUtmaXFxTzN6V08vSGVxUTA3K3hQ?=
 =?utf-8?B?a2JBSXI0dng5S2hQTzk3aXhsajF6LzFUdnF6V2hOVzZwT1MwNk1COEJ6ZCsw?=
 =?utf-8?B?cGl4QzVSY05sVlBuMmlIbzM1aDl4Sjh2RlFDMjJ2dysvaTFjRVFHNlRJWDVS?=
 =?utf-8?B?VForKzFCbWI5TTJJOFI4cXJ4L3N5ZXNVTlRIWVR1WXN1NVA0a3U3ME90bjJZ?=
 =?utf-8?B?T2thSW1SQnE2LzZZVStvNkxLNzh5cjRiUDlQVUNCb0JMbmdNNHRmWURjUWhC?=
 =?utf-8?B?dGxsQ0lQYVM3OVROWFFMTVNWbFdOd21aY2lFb2l0UnljRWNzTkd0SHNMb0o2?=
 =?utf-8?B?YjA0a2NkYkZkSkpPV0dQenlhdGRsVHRIOWx4OUdIMXAvcTNETVkyQ2hUdm04?=
 =?utf-8?B?alVFazJsc0lPcUdYRGg5SlNUWXZtWVQ3YUE5anJSUnFRb2NTZjV2OVg2bjRG?=
 =?utf-8?B?bXpIUmY5NVd5aTFpOTJGRHVqL3B6WFVHZ3JsdVlCcG93M1h4Nmp4eGRKa0hY?=
 =?utf-8?B?K0xUNld5TTF3OTRRcW1rQzN3aXF0cmpzMTBJYXk2enR4R25VQjMvMUJRb2xQ?=
 =?utf-8?B?bVdVbFRmUk9UWFMyNXQ5T21mSEpDT2t3VWFJRVl1QWtBV05aQUFlM3NndDc3?=
 =?utf-8?B?N3RDMEhKaCtPQmY2ODVDczVPY3I3SlAzWmZoUXhSL1JLWnAwUkZhRDl2MWZU?=
 =?utf-8?B?TUt3LzQ0cG5TdVd0NWJyTDUxMjZxVis5NkR6VHlScVVIenJuZXNCMzk2TktH?=
 =?utf-8?B?ektnSWI5dkN0T3JTampncnB6UFhNamNxSWU5aSt3LzNGSjZnanVhenlkVUE1?=
 =?utf-8?B?bVRaU1pUN2w1eHI4WWtselBXUllmZ0pmYXF0SC9pODQ2L2srOU5sWnoxTlI5?=
 =?utf-8?B?QVlFOEZtSS9KMFZUTCt3aEZXV29BK2FiU2d3RHBrSE5iaCtIV210MU9CeGM2?=
 =?utf-8?B?ZWI2Y0I3VURjZDlHZnZGTGZKeWh2VnovU3JoNGk4bkdndll4UjhiZDdXMm5E?=
 =?utf-8?B?cndBbEw1K2RtSFArRVpqVStCbmg0ak93QW05cDMrK1dhYVNtbWE1RmFBRURh?=
 =?utf-8?B?Wk1GVEdWbkhRRGhOcDBwMnlicFIwY2wvQUNGTlV6a3M2WFF3RmoxQnNsNUVP?=
 =?utf-8?B?bHNwbzFWVUJnRjhCV1RYbDVwa1NINXh1L2NRaDc1MnZHeDhxV1lEYmg5TkQ2?=
 =?utf-8?B?cmN6ODVtWXQrWjYzSnBpeTA2c0lERTZsZUtIK1hIT0s0RWpOSnZDWkFDajR1?=
 =?utf-8?B?QlRld3lVTXRsaDJ3aDJLdmlqOFpjOFppOFh1WWpqNG16MzBXNkJxVGVIMnZw?=
 =?utf-8?B?MHpGcjFVc3lPTE9jZ3pEeDRJc0RLakYvTjVTSTNoRVJ2dXdIZXN1VDlFS20r?=
 =?utf-8?B?UUV5Tm9rWFBCbENkc3NJdkx0Y3NlaVhFWCtpY2VtZ0k2M1ZJUGxhV2pnMVZP?=
 =?utf-8?B?Zktjck11TjlPWEZwcnpzdUdCVk5CdUFEU2wyaGdTb2hQYmxBcjlMU25CeXRn?=
 =?utf-8?B?ZXh0T2JZc05MV3ZZN1BnZjc1cUQwODRXbVltRy9uY2lGcXhBSW16a1JZRGZR?=
 =?utf-8?B?OVVmckx4cEFmZjMzQndWb0NxS2hrdUsvMHV2UGV4NmMxeEFyVjVNcTJydEV1?=
 =?utf-8?B?S0N3WmtrL2wwelZSMHh0MzB5K2xVNG5DcGR4UzJEdzdVcFJVenhvZ01hV2pB?=
 =?utf-8?B?RmZ1NzlBYWZWSWdTOFZURVRaaTcvYlVrcGFxT2tJcjNOblUzclVHOTV4cFZJ?=
 =?utf-8?B?RUFOdTg1c1greFhxU3hWREx1R0k3cys0SnlUdE92UEFHNWduclNuRkd5K3hm?=
 =?utf-8?B?MG0wZFN2cUI4UFkwV1B0Mi9iV09Nbk5kdU93QWtjQUNNSUhaNGpuY1E1Slh5?=
 =?utf-8?B?bXFJM0IxT0dmdHZicEtnVWwxN0x5d0dSOHpKbEo5MTFHNDJDUHZ6ZFdxbEJw?=
 =?utf-8?B?clk1MEZsZjRBTjdoK3g5U2xNa3ZnRklvUzFRTnZpYXcwT3V0TTVHb0M2Uml2?=
 =?utf-8?Q?nQarzm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkZrRSs2NVJyZ2ZUNldkZVpsdDRaVHNjOVlyZU9yTEpPUVVUSWxtWHNVcHc0?=
 =?utf-8?B?bTlnR0R0M1BTKzV2NTN2VEZIZjFOR2o2TEJiWnZ0TElNbUx1ek5ENzVPNHdM?=
 =?utf-8?B?UjVYNlhxUEIxWHFGWWRIWjRveU9SbWJqMHNHMVhmVUIzcDF5NFdUaWdvMGNH?=
 =?utf-8?B?TnowVzVHTjVkV0pldFNNRFlOWEpYWUxFVzBteHFtbkt2VDJUYjlKQXdFY1Ja?=
 =?utf-8?B?bGljSVorT3NYWkFXS3ZlVzZTMjVqL3VpU090RndSTndueDZZeXlveFh2Nk9x?=
 =?utf-8?B?K3FKWi9PTFlvOS9QeDJ6M0VpZVNaaGNGNUtYRFZrN1BlQXJ2Nmd0d3pJZCtR?=
 =?utf-8?B?MVA3YkFEc1ZtMnhOYzZ1LytkcmFuekRYOWRoNy9pWllvNmFnMkoweDMvNC9m?=
 =?utf-8?B?c3pXVFR6a2wrZDhFMER6WkFyL2N2UWJUOVp1R014ais3anJ1M0lPbXkrVGh4?=
 =?utf-8?B?bVdJdDN2OXg0QVlWYkJQWjdPeHd4NmEwMXBHaU1WRnE1ZDJ5TVFyS09SRGdU?=
 =?utf-8?B?eXdrR25LcW94TGJtKzZreDladjRrbnN0N3VUaU1yTXBPSG9SVWMzMGY3SXlI?=
 =?utf-8?B?TTBvS0dxMkxkb01FYU95cWE0RWhLUElPWFRLTHhVaG54UVdLS3MxbTFzVnFj?=
 =?utf-8?B?Tmk0ZHl2alBlMVAvOGdMVjN0KzVEVExTUnYzOCsrNmJvN01BYXI5V1k2UDhO?=
 =?utf-8?B?WXVYTjdRd0JBT1FsT2dob3pjeHV4QS9rNnFLVlRick5FTVhEei9sbzJYbWRS?=
 =?utf-8?B?VGNPb2N0UnhUaUtZUUZWSTV6bEhBYlp5cFFJL1NENEdhSUxTY0Q0UWhpKzdr?=
 =?utf-8?B?T3I1ekNHY1NMZHo2NlQ2VDBRbGpXNVdoYTgxTnZtTzM1Q2RlR0VzVmdTNmFX?=
 =?utf-8?B?TnFkeFJnMHBoMEFqUlhKK0dwRnIwaE5TUUJrZ3AxazFnemtiNmFkalZIeHBN?=
 =?utf-8?B?emRCVk9nSHBic3NjS1JTTkpWU29uOGFKcWY4M1I4WHJGeGJvdkNwUnk4cWRT?=
 =?utf-8?B?anhHeFZ3dDdyT3VQSEN0UE83b2VwVW1wOGc2SzNzZWJtaEFQbHJMdTlCN2Ir?=
 =?utf-8?B?NGJRMHhJT0J5VWRQYUNIT2VDcU5PSEVUanl1MDhGRkxJanFOeCtSUHRjSHlL?=
 =?utf-8?B?aW40ZjZTYWtyV1RFN1R1UFBkeko2bW4zYTUySDJ4VXdvY1ZQUzN6bHFuaGtj?=
 =?utf-8?B?UWhFOVloT2VDWlJkSU5DRXBRMVBqa1NobzBWbzdSblk5c1pRbG51aWhxd2Y5?=
 =?utf-8?B?am1jVGU2c3FkVGpsSml6MEN1eE9jaW4xNHZxMnR6eEtJTlU5SS9IN0pobFdW?=
 =?utf-8?B?UEdBM0g3ZUNHOG15WUk3di9vRXdQbGxLdHBmWktYTUsxZ0hobVFTdlFTbjBI?=
 =?utf-8?B?U2JXajFObmhVOWdycjdnU3VlK0JudlluT2h0TkVqRnRyUTl3bnk5K1VtZUFQ?=
 =?utf-8?B?Q0xad2lsWkZ2RDVEKzZIbHBlQ2lpeW1DTG1FSlFzaUlhNmkwdjczTmdzeUJv?=
 =?utf-8?B?WnR2a3VFV3lLUDhWZGRhOUZDZktCakhWQmo4NS8yRzhvdnZXbGVBQmJqeVBO?=
 =?utf-8?B?cm9BOGduUW5UVEZCejVyZHRWUXlIYlV4c1RLRERUajJhcENCQkhlOGpZS2Rt?=
 =?utf-8?B?UDFac0VYK0haOEdYTm1ucDZWS1ltM1JaL090NnRZdThCZWUzTWpQV2dKQXEw?=
 =?utf-8?B?YmhSclV4YXZOZ2t4VUxBY2p6VzZJU09ZNGhRbGUrMGFFVGxIMmhvejh2UTF6?=
 =?utf-8?B?ZzdVV1JGQzlMRTJKR0hvaUV0eWkzaTVnNjRjREZua0RrTjJ2d0FYelMydWhs?=
 =?utf-8?B?aksvS2psdVEyVE9vZGxwWVZrbERXTGFXNXdqcisxclMyU2JwYXllSXoxM3dH?=
 =?utf-8?B?M3RtdFk2dlh5eTArTHVBWkRraHRyTnR3T204dU9jTGVEV3NKMU9FYUdOR3pV?=
 =?utf-8?B?ckJxb3NoaEI4Q01GaTdETXppWVVkK0lwcjVQRGRqRUY2bjRGT2RSams4NTZq?=
 =?utf-8?B?dVVuaUFHemRyQUZkbHh5Qm0yOWNSZmlEbHMwLy9ITmlFdUdvOXAwOTBhdU1D?=
 =?utf-8?B?ckxZelJWUnpUMkxxZEJnZ25EZVU5aGZSRlp0ekZhRTlsUWdIUmVBeFBEY2t6?=
 =?utf-8?Q?q8FvxVYrbSmpnTw4TMEHjCMI4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70B548FEA8D0E147BAC19BA08A16A75B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91dfe188-9add-47c2-18ee-08de010a1c2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 16:46:46.6752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DVpXRIhQ/tzgZTi0mxfWs31gDU4E0AJUgWf6X69oW1wWkOpJAOCS75LQhr5x0W7AfWK2q3bvBLokVGU/d+YqWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5631
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
Cj4gK3B1YihjcmF0ZSkgZm4gYnVpbGRfcmVnaXN0cnkoY21kcTogJm11dCBDbWRxLCBiYXI6ICZC
YXIwKSAtPiBSZXN1bHQgewo+ICvCoMKgwqAgbGV0IHJlZ2lzdHJ5ID0gUmVnaXN0cnlUYWJsZSB7
Cj4gK8KgwqDCoMKgwqDCoMKgIGVudHJpZXM6IFsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBS
ZWdpc3RyeUVudHJ5IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGtleTogIlJN
U2VjQnVzUmVzZXRFbmFibGUiLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFs
dWU6IDEsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBSZWdpc3RyeUVudHJ5IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGtl
eTogIlJNRm9yY2VQY2llQ29uZmlnU2F2ZSIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB2YWx1ZTogMSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9LAo+ICvCoMKgwqDCoMKg
wqDCoCBdLAo+ICvCoMKgwqAgfTsKCllvdSBmb3Jnb3QgdG8gaW5jbHVkZSBhbnkgb2YgbXkgY29t
bWVudHMgZnJvbSB2MjoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4L2Q4
N2JmZjBjNjRmYjJhNTQ5OTIwMzU0YzhiMDlmNzY0ZTE0NWE0OTIuY2FtZWxAbnZpZGlhLmNvbS8K
IAo=
