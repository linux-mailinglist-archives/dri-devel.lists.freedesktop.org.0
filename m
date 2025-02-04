Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BAFA27A42
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 19:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB40510E063;
	Tue,  4 Feb 2025 18:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QhA2ATR+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F69310E063;
 Tue,  4 Feb 2025 18:42:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tj/9dj7qONSI1w1bETwQ2iOmIOGky1n/X0B/GvlVKZGTq3yorXNKLk/9y9fpmt/7S/DO15S8Z0aQLAhxxWwcOVBwloho4VWCTa5AaTDjlN0qj6N/gnlY9rfkx/9/u9LXZAbDLY+KCFX+8X61B3dzPyGEYF6/XVcgrTsvP2eKncqyTBLIgVmkuymWoDNYbHdG866NmbCc8EYZW9REkbiOJRmbwWwuakS9YfLvmzAyr1amZxrpiAV2LwjCb4aGyGkrczYpCddCEsISmorXNSMnTMtcvJQzi5jJ0DVjxlEYbpPNT2JROiiEMsDWbYQSxB7GYx+xYTAWYs7PhYYPw6pNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EbsdZl2sihDYazsXMXOQ16yEzxnbf771lNBQIGenW4=;
 b=mGNHgQpd4i0coN5DHo7QCzuVFGMxnMqkgtPtViDfcndfmW3fHzWO1b5F7xxCJ83NfTm16uVncfdm6pKaBAVujvKSBx7jqn+o4pWuPC+hRjzz1AfpgwUPkHfTh66WA9xCLq98uwenCdMw4Fb1FiZOOIjOQejX0dvDmpTIZ8IUDie/4Zh0IxcsHvQkzd/nWtKbXHmpXmOWKY3SrgATODyWTSL0albRPlnqLWYSNrTW8WfosU5GcGP0ZMMjE6j6oiz8W2wr2UVtqiWnJXcAeSq8Y6VhhrOmPGHjm/mwVM95bKzm5P6ip2+jI6BBY37DSK8QcxY7pBOHXSxV4sEYzhFP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EbsdZl2sihDYazsXMXOQ16yEzxnbf771lNBQIGenW4=;
 b=QhA2ATR+u7unYnoNXiW0SN8Ah0A53sb7OiXAW/G0YNgoPpl9odr2bLoFCoQ62kFOVQ1VkLbf8Z2ueZG40mwz/cFxaB7vPuebXgR934vIw4fTfPNSZr0ce0oBsXm4BBViwQnyT+VlwiD6Lj7a59o/pafWM5e92rBcU13QiAu6ScAkK1GrcmcNxP56e5QeL7tLdx90TujYvuNPgn+n2XD4+IR5QH4PMxGUAXYrGaR4DmFCdQ6Qbeo2GNK1nqCmYBmZdCDYva2PQSeloWpj3L7AR7h+JF5xyDY3NrOImq3yYh+tQeO069nx/kCX9k9kqqpN/btbhTgbH/FIV/TUBg8sqA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DS0PR12MB6630.namprd12.prod.outlook.com (2603:10b6:8:d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 18:42:47 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%7]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 18:42:46 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "ajanulgu@redhat.com"
 <ajanulgu@redhat.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "lyude@redhat.com" <lyude@redhat.com>,
 Zhi Wang <zhiw@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>, John
 Hubbard <jhubbard@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, Ben
 Skeggs <bskeggs@nvidia.com>, "mripard@kernel.org" <mripard@kernel.org>, Neo
 Jia <cjia@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
 "pstanner@redhat.com" <pstanner@redhat.com>
CC: "tmgross@umich.edu" <tmgross@umich.edu>, "benno.lossin@proton.me"
 <benno.lossin@proton.me>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "gary@garyguo.net" <gary@garyguo.net>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
 "aliceryhl@google.com" <aliceryhl@google.com>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
Thread-Topic: [PATCH 1/2] gpu: nova-core: add initial driver stub
Thread-Index: AQHbdCwnDkxEyO+2HEeq7GomvtwNv7M3gNEA
Date: Tue, 4 Feb 2025 18:42:46 +0000
Message-ID: <2d521b9d57338927a176118587dca545f5e4f170.camel@nvidia.com>
References: <20250131220432.17717-1-dakr@kernel.org>
In-Reply-To: <20250131220432.17717-1-dakr@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DS0PR12MB6630:EE_
x-ms-office365-filtering-correlation-id: 78352297-a898-4041-7766-08dd454bb800
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?amZib3A1RlFnS0x0NzdpZ3VBYXhOcEh4RWNpd3pMYzQwWXpNS0ovYzBEM0pk?=
 =?utf-8?B?eTZCZVFWVjU1SWkxNTd5N2hQOXRPK24yWno0bXZCSkJuYnc3SXF3bkJoQmFG?=
 =?utf-8?B?UkJKb0o4TTllUC9FNXpCSUpwZXoyYTJ5cFV6VzVuZDZDMFpoNmdHV2M3czFz?=
 =?utf-8?B?Skc3aDUxeEg4eEt4MnhZQS8wWi9NczdZUFpHVDhBb3VlRXRnRkc4b2I3RElM?=
 =?utf-8?B?d014cTRlTGsxVm9zemx0TDlLbnVaSUdVQlJhd2huemFNTWt4eStHbExhS1pC?=
 =?utf-8?B?ZjdLVDFXc2VXOFgyeFczRGhJOWUwSUx2QUhVbWhqQ2pmWGwzUzlOUndyRlRk?=
 =?utf-8?B?eXFTK3YxWjdJTDlGdEtlM2tueGV2SjkrRkpXOUJhR0dLaHhsMWROSHRuWkxr?=
 =?utf-8?B?Q0grdnBmT2FvUVlMYngzdXJXUUtPRG1RTk9ONkN3QU1wWDFDdHBSNFZYUzc3?=
 =?utf-8?B?OGNEZnlUUUNWbGdXdXRBekxHKzA4NmVsaTF6clJKSmVhOGRqTjkvWUVhUUtM?=
 =?utf-8?B?UitvVW0zV0hTdUVCU2FLa0pCYlc2T0I4ZWVIaTNjaUgvaVZlRTlHVzNmY3lO?=
 =?utf-8?B?RkxRcklOWGRHSWlWdWw2S2RhQUFLK1ZJWm9Yd2VENGxna0VMQ0hOR1luRnIw?=
 =?utf-8?B?Z2ZIVUVsWjVleHBBcVhlR0hXOW1qczdBOGUveUxiU3VXbUhrVFdwOVorVlBI?=
 =?utf-8?B?UExCN3F5Rjk2OUhwRjdGZGUzQ2Via0NiYmdGa2grdWZXdHhtMC9ZcWJzQ0dv?=
 =?utf-8?B?L1JSWUJmOFlDZUxsL2NVRlNudGJwRUFJNUVEL2tkdGdIWWVVdVMwTHNycUhJ?=
 =?utf-8?B?akR0VlRxWFcxVVl5cXN4eHN0T1MzR0JNVkRwVGViSnFvVmNwWUFzdWcwc2hq?=
 =?utf-8?B?YmE0NDlMT2k5Uk5rRWJpMEdGY3JVeTM1dGZaeUZ6NExVWGlmY1ZRU1ozTWZS?=
 =?utf-8?B?aWtxKzYyY2dNN2h3QTFMemlmZWlkNXFsQWxMZy9JNVBKbU9SMmJyMDVtd1lu?=
 =?utf-8?B?MzVyM2szU1Q1SjlHWXowTlhqVi8zY1c1OTZTaEduM2NEY3E0bS9Zbk1MSUVa?=
 =?utf-8?B?T2NzdWx4RmRlWkVrWjZ3R1JHQkFTZllaNXBVTEVocHAxWmQxcmkySXZHQlV4?=
 =?utf-8?B?S2J1alo5c3BUMjZqcEZuQUhoTGhrQ2pDeGNzWkp1Wk8yKzZMNzlvcGlRUFZm?=
 =?utf-8?B?aG0zUjZ3WXFUWFZQdUNHRWVScVZZejV1RHc3MWlYTnRuNS9JVWRBdjl6L2xS?=
 =?utf-8?B?NGxqR2xFRUkyanBPaXZYejF2MXBRWnp2R1FiYnorOEtwSlJoNjV4ckFwTUhU?=
 =?utf-8?B?dFVCVjZMQkZYYVZYd0dqWU1kaEd1MkNDTHVFWkJiVEc0akhWaHZYcElVV3NX?=
 =?utf-8?B?OUNCY1RTTEpUM0JIS3pzWGl2a3RkTVZ2RHg1VGQ5andiU1pRZzI5WlFPNzhN?=
 =?utf-8?B?WE4ya3dndzZMLzViTnZXUEQ2ZThGRHZnbU0rNjVSajRjNmt2R09BbkcwMmU0?=
 =?utf-8?B?ZnNxV2FxNE1XQksyR1ErazkxdGVjRnQ0eU9pTjZhby85aGpQaUIrTEFJQm5a?=
 =?utf-8?B?QTlrOC9iWWlLQzdzTFpoN05nQjZ5d25HRG1Remw4dzNxazdpS0N1Q0ZtR0Y3?=
 =?utf-8?B?V3VyTGhPTDN6TytZejlMSGlBeTJrM2hxRzUrNS9jcFFGS25YZjlsR2piTW5T?=
 =?utf-8?B?T3A0d3dIV2tvNDNkMUFidjE0VDMwMEVwYlR3aXZXeS95b3NHN29zbjhMZFBZ?=
 =?utf-8?B?ZHpTd2dmZzRqR21JUlV3bThSUnFIb3dQY1BMN1BHSnFEa1V4TWxZL1FCS1NK?=
 =?utf-8?B?dEF5K2hWYjN6dyswWU9UOG9FZHM2aFVXVGRNWXdsblg5YVgvVnEvamFkVXJY?=
 =?utf-8?B?aWNvZmVzYm5xK0Y0QlVuUnRuKzdEWW5kWDFxSHBnV1FaSUExejVGNDRCTnh4?=
 =?utf-8?B?WWM1ak5XK1lubHFDcFJCeG1HdWhmTzlsdHAvRzRmaHFBbjczZGtrcGNLbzhU?=
 =?utf-8?B?UGNJTUcyMUFnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnVrUFlFT2w3WVZWZlFxYWM1S0NRNElXTC9nUmk2R01MR3ZBaHd3OUU2RllU?=
 =?utf-8?B?OUJnamdxSmd1N3RGTlRvMzVwelRhZytkbldSY0pmTFlYVldhOExyVThDL0oy?=
 =?utf-8?B?NmVpLzBoMnlKWStYbHBoV1phdHNPT0Z2bWxIT000dHpMQlF1aEp2endlbHJS?=
 =?utf-8?B?ckNOc1B3UHRuZTZIZ2VTRDVLWmxaVmN3Z3VrcFdseEp5TTN5b2taYWNHeWxs?=
 =?utf-8?B?WVdnbS8wUTNoM2d4TThZUnBaK3dOdFg1WG1YdlcxMkRNcHpZQi9XRk9HSFIr?=
 =?utf-8?B?VHNuQy96OExqSDhES1BxU1ZEeUllOUJGZWNVcWhKMTBGTkNiM1FkQW5uenVU?=
 =?utf-8?B?N3FkbS80NW5FdjQzeEprdUIyVFpYb2JBY0w2L3U5Nm54YlhYS2FqMVk5Vlc1?=
 =?utf-8?B?NENjMGlrYVFQenI5Mmd6SGRENFNmemdIaW5NVzlqYVRQYm1xR01keWxDbzNW?=
 =?utf-8?B?Y3Q3djhBNjVycnhCYnlMWGFEbGk4Zm40ZFJBMTV1TzFNR1hENGVLcWZ2SEFJ?=
 =?utf-8?B?SGtseGlLQXkvNUNseWduZEY1YzBXV1pKZVRjMnZNN2xVN29ySG1XRExUdHA2?=
 =?utf-8?B?ZnNJblNWSE1XVEgxWWhXTFhEYUhCMENYVHRBVXYweDdSalJwUGxKWHJPNnN0?=
 =?utf-8?B?djFKc2ZYbEQwNlhkYmNsNmEyMmduamNTU0pvT0MyVmJtYk54S3gzVS81VVZZ?=
 =?utf-8?B?ZnRGZFNqOHRRbWZuOUY5czVCclE4c1daWTJuM09WL0Z2emQ2ZHIxdlRJazZK?=
 =?utf-8?B?QXdqUUVtVXg3RFZNL0Q0NWMvZTRTWUZrbm8rQThDK1owQ1V6Ulpidng3NnpW?=
 =?utf-8?B?QWljUnBWZHBCQ3M4WnNpL2xDSnpkb2pMalRYakEwTHN2c3l4eDZ4dVNZS2ky?=
 =?utf-8?B?THRQU0NHcGI0SmJJYmFiU2c5d0UyeDFGODRYTEYrQ0VCZVFEMUNybXhpNnZ5?=
 =?utf-8?B?V0dqUEF6T0RDQWorUzZvZDFra05wME5NOHVFSHdFcG5SV2dvSlpXQXFzYXhk?=
 =?utf-8?B?WHM4blplaTZ5WFZYcFBEc3dCQjdJaTJHSFJiN21jNzI1d0NPL0hNV0VhQmFY?=
 =?utf-8?B?RUcrK3V5MzRJTkVqTHZMUHloaGNsRkpaZm9YaDRtZGtTUXRzQUFJNjFoZllF?=
 =?utf-8?B?WGd5RmZ2NlhPclhjMVdRdkhDNUliMjdlS3lsUFBNZWxSSEkwWmpZNjhXYVR5?=
 =?utf-8?B?WEI1VHpiUm9CWUZNYm1zMzNFc2pZWlM1WUliSm45OTlXbG9oTnZjN0xydDI0?=
 =?utf-8?B?UWdzMEFmTy9pcTNkaE9JazRNQVFSTUZVbHh3S05JbHBGWUFQbm1iaGdFbTBh?=
 =?utf-8?B?U3pQV3NscmEvZ1VXSUFFbGN5M2lFdVJYdDVCcEI0eVdOb3dobThDUTUvUmo5?=
 =?utf-8?B?aVBONXVsUWc1ZjUxQmpTd2tNUi91blk2bkcvYWsvUFovMlcrb0kzUmlWV000?=
 =?utf-8?B?bTRiSk0rNzRzU0dsajVqKzExN0pzempUVStkT01wRjMvRHh0L294UTBKV0xI?=
 =?utf-8?B?UE1HWGFSYUx3bHQ3allUcnR2Qm5CcDkrMDdHekdvdmtZRng1SDdiTWlZeVhX?=
 =?utf-8?B?Rzl3YTZWSzZSNTgrY1M5RVdpd1piVGlkMC9yWXgvRFFrN0dreU94Z3VVeGdI?=
 =?utf-8?B?TkpJQzNkOGp4b3pvcm1Mc2trMktlRTFwUXhXZnkxbUVLTisvWTJhSXIxSjRY?=
 =?utf-8?B?a0gzNFMwYTZKN1FzMmN1aGhPcS9FNmEwMUVCb3FzU2c0Q2tmelBpWHZ5ajVH?=
 =?utf-8?B?dkxWRUFpZy9DVHp4ZXlOZ3V2K3NoYVFvZkNLS0g3cnZmL3Qwcy9xcndqMEpk?=
 =?utf-8?B?VU01SnN0WlpWZnJ0ZnBrRVh3SnNaTE5jM09raGJseVhPRUxaV0pJcUVZcGNa?=
 =?utf-8?B?YjZHcW9RVHpVa3ZoZzRQdnBSdzFHYy9QaDB3MjBmRWwwU1ovMUx0emFsblZj?=
 =?utf-8?B?V2dWM3F1Z25QR3VvQmphYmo2eFZvOGhxdURYQUltSk9UVG00THhaTU9ETHBS?=
 =?utf-8?B?ZU1rdDZQVERUbm1zVVpIV21SaFVOQ3hWNGtSQXlPeExaYUxQVVZkWFl1ZkV3?=
 =?utf-8?B?QkpjVVNRUCtNejFFK3RYbmc4ZFM0cjRiZURSeGhqZXlzOEh2aXFvOGVHNGpj?=
 =?utf-8?Q?M3fkfU1RazrUiWKHfmywNlsEZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0ED157FE7D096349B4A6D5374AFE8DF6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78352297-a898-4041-7766-08dd454bb800
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 18:42:46.8198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2flTc6H+4vmmO8tEzYwTuy1A3+5ERM/wBW/vcEoF+4JS1GRYFcoTKcdF1eaIKoVkumtFPJusl+3gZCGLBsHivg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6630
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

T24gRnJpLCAyMDI1LTAxLTMxIGF0IDIzOjA0ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiArLy8vIFN0cnVjdHVyZSBlbmNhcHN1bGF0aW5nIHRoZSBmaXJtd2FyZSBibG9icyByZXF1
aXJlZCBmb3IgdGhlIEdQVSB0byBvcGVyYXRlLg0KPiArI1thbGxvdyhkZWFkX2NvZGUpXQ0KPiAr
cHViKGNyYXRlKSBzdHJ1Y3QgRmlybXdhcmUgew0KPiArICAgIGJvb3Rlcl9sb2FkOiBmaXJtd2Fy
ZTo6RmlybXdhcmUsDQo+ICsgICAgYm9vdGVyX3VubG9hZDogZmlybXdhcmU6OkZpcm13YXJlLA0K
PiArICAgIGdzcDogZmlybXdhcmU6OkZpcm13YXJlLA0KDQpXaGF0IGFib3V0IHRoZSBib290bG9h
ZGVyPw0KDQoNCg0K
