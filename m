Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301218D1A6C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621CB112105;
	Tue, 28 May 2024 11:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UgtYl7GS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2087.outbound.protection.outlook.com [40.107.100.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF48B10E0C0;
 Tue, 28 May 2024 10:45:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiI4RKFGWG4PDkhJS3fC0r+CBtbBgN+DrzBu/SbPAirHsUPQOZV0v2xY4QwqXaObap01OXpkwPbkMYCFRqssZprVHvcciwJw62DT9hUYEGBR4LT51JdbKrW5ormxhizN4s1MRF8GafCsk414FWFzldzhYf3O8M38XX5WFr3W6E4xQ6nFo3HASRsRF2BIG84tPTj68c01664WXlEPoIpggFqHrCuvxYbr/DDHz6VMiuTY/ZYXXxvofa/7Go24u8NQ7Uq+7uweIeEZe6vF0+b5DlkNRdk5pKIuC3lFMzBsn3U9U3fqie584wNbzMWDNrHBduueNqMRDqgXfRHut8xrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3KYo7PIpA/oF/ig+sEeyfCsq4LzgI5SKlvQPP3EDJo=;
 b=LbpYxnan39kWTuvQ7IuYkKcxb/tdN46mzpUukPQ7jR95yL1OTN6lMwsQvNnbBS+Cg/aB4wxfa6PVWI98sJ/fejjXyOsvokymRhXN7a+noGSHkKlLbx12eW7nERZ0XVOI6jjbGuTyPEK30T8h4GZWHMItWjrRIe6zTBHD1BQKxiKk0IuZ9jk7ipy1nZuCE29YlZX0gN9ojaKtaIrAqxKGQEjRNKRpjU67fm1gaul50eg2UeKtFlkovc2gGsFMa6rM8Lkj9ht8I7kUfkgRyDYJqAEAnOImtjFlGsi/DNsMbY0BNFKqKjjir3s01LP213jSj+uozgnXNJw+oqE3ZxRj4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3KYo7PIpA/oF/ig+sEeyfCsq4LzgI5SKlvQPP3EDJo=;
 b=UgtYl7GSuRyNUTvouwT/EYb+15wMcjiN+rFs/qn57XuAJXoykCV6Pw1oNYMAdc2jU6dTO5eN71d88sDNbNFGLhlk1+Vo0KWjvC9vDKu2dXgcdQ9u+fa3h+AF8rxfAQ1gx5NDdSuCMoyhKCNtDahlka93UDrn8MkpE4z2vGk+KupONYLFctRtXu/Kn6XvzuVfBL58ZcG/4nvUyVqcmFgWhLmM9jk/ZVc8IhdwVvar+L3E368KRJrQtC/ROPqI+AA5OmLALPFz+MY6IYvjVdD5s3KCKjSN58YdivRixs4CI5vgN5EFGMXfZ/8RXRkK5NAAJ40UrhlRetDsiLpcZt8d6w==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by SA1PR12MB5672.namprd12.prod.outlook.com (2603:10b6:806:23c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 10:45:32 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%5]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 10:45:31 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
CC: "dakr@redhat.com" <dakr@redhat.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "wedsonaf@gmail.com" <wedsonaf@gmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "gary@garyguo.net"
 <gary@garyguo.net>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "benno.lossin@proton.me" <benno.lossin@proton.me>, "a.hindborg@samsung.com"
 <a.hindborg@samsung.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "lina@asahilina.net" <lina@asahilina.net>, "pstanner@redhat.com"
 <pstanner@redhat.com>, "ajanulgu@redhat.com" <ajanulgu@redhat.com>,
 "lyude@redhat.com" <lyude@redhat.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Thread-Topic: [RFC PATCH 7/8] rust: add firmware abstractions
Thread-Index: AQHasGq9PdWC/vvfakyx3/WUuSONP7GsVISAgAAbQQCAAAe5AA==
Date: Tue, 28 May 2024 10:45:31 +0000
Message-ID: <1e09c517-123f-442d-8184-c33ba52a37bf@nvidia.com>
References: <20240521083231.000074c2.zhiw@nvidia.com>
 <ZlTcnYNff2EDQJdj@pollux.localdomain>
 <fd5dbd42-24b7-422b-bc0b-393347b3fdca@nvidia.com>
 <20240528.191754.1306229738730927340.fujita.tomonori@gmail.com>
In-Reply-To: <20240528.191754.1306229738730927340.fujita.tomonori@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|SA1PR12MB5672:EE_
x-ms-office365-filtering-correlation-id: 28f83e39-a9f9-4f48-6a9c-08dc7f034c24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|7416005|376005|366007|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?STdFTGlZUEdnaHRaUTB3NzVQN05XZ0ozUHV0clRoREI1SGFtUHNsanYwMXJE?=
 =?utf-8?B?R05MNGRpRmV4eFJvWkxScGFVODV6UE9nL2tBWnc1NWF3SjI2V2FaM3pDY05h?=
 =?utf-8?B?Mk5zS0NDdVg1TE5XODJ2emY3WjJiT2JMOStxbmZMdUlpU1VnZ0QxQU8ycmtn?=
 =?utf-8?B?cGtmNjdJT1B6QVV6cDRINDVtZkREbjZmTkpxUkZVbTl4QmpBcldtM2wxV1RE?=
 =?utf-8?B?cWkzQ3hsMkJTZlNXMnFFRmlrc1AwZENVMTUyenB5Q1ZWdWF6YURKOHczOUJD?=
 =?utf-8?B?Y25Kb0xKdjFudzR2dHRXdHl3MGVld3lMSTRqWmhvQVorV08rK1kxRUpER3Ar?=
 =?utf-8?B?dEdNWnBobTVLSzZMb09DVmJZWGhNQWk2Smx1Zm05MXFCTlorRnp5ZWhWZ1dD?=
 =?utf-8?B?VmVyeGNhYjBuZDNLOHlKSWFyM3IzSENwNXcrSXBKL0JwSW1LV2xwa25OLzZv?=
 =?utf-8?B?dTVKdVBXMFkrMDdMTTUweDM5aEVQcHpKL2hWeEw4NXdJV3hrQjBLT3Z2eGc2?=
 =?utf-8?B?dkxXSlc4bTJvN3JrbmRYd2R1TEQ4aXNIWHZQdjc0ZnhQeGNLUnRUZGVNM0Ja?=
 =?utf-8?B?YmYvTTBtQm40dkVPdm5sQXc4ZmNYT01PbzM3SG1FeVJMSkxFeDJpSERaVm5h?=
 =?utf-8?B?VjFNUHNQaFRXL1FCWFR4T1p1ME1nOTVEcnRDSnZNWHVoQ2FMM0FHMXpKbWp1?=
 =?utf-8?B?ZjdFTTJ2TUpqd3lNbHVHdFlsZUF1UkVwRnUvakNmS0NlN0NOOFd4b3M0VXV4?=
 =?utf-8?B?WHlPcXUwRHkxNnRnTnE0MHYzY1d0YVcrMGF2a2JpY2xpUlBxZlZraVYrMG5l?=
 =?utf-8?B?bEs4SDZ2Z2ZUcEluYTQ1QTdxYkVUb2c2V0V0cUJleFpQNmtNRFRFcTVhNG9Y?=
 =?utf-8?B?aU9lT0MrTnBwdDB1YlFremR4TEs5Z0FPQ3VFdElZaFk3NjE1SzRQYzVBQUJx?=
 =?utf-8?B?QmRVRENIMTlhNmJQWjlqL1lHbE1EVlNqaTUrbXlXSk1zaCtZVG5DWnVLeW40?=
 =?utf-8?B?SWhjYWxxclZzak9iNTEvMnBkMWRBbWxTSEgveVNoT0NIV2NnVkRVWGdiaTBJ?=
 =?utf-8?B?aVZJNzhQNWJqSkR4L3krY3hsQ0k3SlowV0dmUVhqaWdLc053blJSQnRQeDRN?=
 =?utf-8?B?d2Y5MUNlL3ZjUlFXUmc2d1ZFR3BYdjRCV2VoSm05TGExWDRITUNIOGx6c0cx?=
 =?utf-8?B?OGxvMGZ3K25tUmF4Nm9pVjJLUll3N2VxckRyZTlsK2owdDEzMHFSNkoyMFhI?=
 =?utf-8?B?T1IxdjhaYTYwNGdqcFA2UEFmSFNENEluYUVZRHExSkxBTVZpcmlGSEZTYm55?=
 =?utf-8?B?SEJaemhIL1hWNEJBZVdNUHBSN2FrNVVjbVpGU1lpWExTb0xnQm1kYlJjOTc3?=
 =?utf-8?B?bWxQTEdHdTBwZk1oMlVDRHpjRFdNUzl6N0tqZ3hMVmNTTm1DVGdhRkR2S0xr?=
 =?utf-8?B?NUVDbG8yeDd5MkgrMWZTd285Zm9DSlMxVFh4MkllTnFQRGxCcjk0d1BMaFNZ?=
 =?utf-8?B?dkFSalo0eEcvblVLYk5yQkJscUdOYUNSb2pGREx5cXVSTnpJeGZvOFg2TUpO?=
 =?utf-8?B?d2Q3NWtDTVJwd0FGdkdOSUxFcERaWUtSWjQvQlhoQUJVd3V4RktVTEV2djZr?=
 =?utf-8?B?Zjd1dGJiK1hwL3VLV3FVZUMwcmw3Nm5hV0VhMWs3UmpRa2dwNWp6dEN1Uno2?=
 =?utf-8?B?UXVFaTNYU2MvMlZyZG5McVkxZ1p3aCtibDk3S3huMWVqTGJDZFVTRmQ4Qkd6?=
 =?utf-8?B?d0FIWlJSYWxnRXBkWEJzMU9yVXlLMUVWQlJrM05RZVpEZWhvYXJpOEE4VDBr?=
 =?utf-8?B?UzJicWJ5WjM4N1FZQSsvUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ei8ranNHQkxTUk53b2tJRkZicGpWZTNUeHEyQy9Dbkh3QytSMmZTYUpLVXpk?=
 =?utf-8?B?emNRc2xOOTZRem5rWWt1YUxGeDZGOGxVdkYwbWVETGsrMUVUQlN3TnVJR0lk?=
 =?utf-8?B?TnZ1U01DZFFuYmZiTXZOZ0dUdUhSM1FEWDZrOU92MU9weXpsZzV4UE5IV0pn?=
 =?utf-8?B?YUFMbDhneUN1eXUxWnVDbnB5TytseFNvNDhMblA1VmNMNVl4dFRER2d2Y3No?=
 =?utf-8?B?ZlVUdm55aENlVDVHUVVFZ3RSbkNjaWk2Zk9za0RMcUgranpGQVozcVRyTmI5?=
 =?utf-8?B?U0xDWXdma3Z2cFhEeUUyQUhFMGttY1dDcWRSVlRUaUFjK1V6bjZ5MHd0Um4x?=
 =?utf-8?B?bkdGNjRvWFJZbkpJeVR4b1kwSjhUOCtNQk5uNDVZSERKVDlzK3lqOSs0d2F5?=
 =?utf-8?B?TTl4YVFrMUxUNWFhbGFlRmtyOWZ0RmxLNm5QNTBuK1RkUStWT2dna2NxdlhT?=
 =?utf-8?B?SFlKeUJsTWxtT0dTNE05Mi9vUC81WmI1akpWdkJwSXhRRndLci91U3hVUWNL?=
 =?utf-8?B?Z0NFL0FkZVZoMUIrb05vTmFaRkl5MTY1d3RIQXI5ZUN0a01lckhqaEF2VHJr?=
 =?utf-8?B?WEwvNUlpQ2FmZTNvVTU4eE5FN0tNVWN2YWxuMVBYL3gvUmc4bjZRWjhhU1VO?=
 =?utf-8?B?L3lPSGRVN1hwV2x2YVYzQmE4VXh1Z0d0bUdqTDZ4dTVmYzZibGxGMVZibEhP?=
 =?utf-8?B?dHV0bzJ4TUN0ZkQ3SGhyd0RBcGp0bEF3ejkvaXFhcnppVVlqcmJOd1RveHpp?=
 =?utf-8?B?T0NrWVdpL3JyRXNJb2tzNjdSMkxBOUtkZXMxMUFWaGxuRVFRSHZzV1UxeTZH?=
 =?utf-8?B?YlN4WDhHb0RHOW9qMHVKWXZ2SjY1R2w4a0RkRWFRTVErV2ptd0QvbktKdk9u?=
 =?utf-8?B?N3Izd0hNVzVKUUUvWmZlclhUYWwwNzdIeFVDTFlvSXBIbTNFbng0dXYrTlp4?=
 =?utf-8?B?RmV0a3I0aFhQcVJNRERtVjNad1V6Z1JoV2dtYk1ES1Rzcy9XaDBObHN4c2tx?=
 =?utf-8?B?VXpoUU9vVHhpdythSzA4NWwzUG16Z2gwTUhzUE1TMlBGRnZDUEFyMnNYdjJF?=
 =?utf-8?B?MHpCQ0tEZDBDZVc0d3BCVU0rU2hkTjd1c0JDSE1ST0VPeE9sSnhHcW5VZExh?=
 =?utf-8?B?cDVrWHVHRDJ1OEVTOWJoOUo4TDMxdGFuQlJCbElhM3kxS0hjSEdjdUdob0c4?=
 =?utf-8?B?LytaOG5zQ1E1Mmp6aTF6MXRJSWlmV3BMdjlHUzlNdzI3U0kzbHJSbzEyNGhj?=
 =?utf-8?B?a1g4cVk4YjI5WElFY0w5NzdLN3dRK3dNQmdhQXc1L3hUbzNZbG9MYlgyRi9J?=
 =?utf-8?B?N3p5S2psaHQ3c0R2TzdXYk5hcHExbFk2aUY3M0swMUNTUDdCQy9reWlEWEJq?=
 =?utf-8?B?UFRJZDBoM2loSmxZc1hkYXJrR1RQejRnR1phSFpGTmt2MzFFdjljNDVPdzFp?=
 =?utf-8?B?S3dNWDhJSW1tNWQyUmFOdVhBRWlHZDJJN3BLN1hxQTJGZWFWQ2ViYmZxeWRl?=
 =?utf-8?B?bzA3Q3R2dG5FRFFKRlJBN3o2N3hSdUx6OUJPamhyZ0EyV2VBMWhKamsvOHBq?=
 =?utf-8?B?bkQ3ZXErVEtmWk1jSTVldkd4TUNDMmNGRmVYSER5bDRtbURsbTA4aDJFVm80?=
 =?utf-8?B?SzFFUk5sSTVOR05qUy9mRnc0UW1jUmpPUnhpaHVzcWxYbzB3dEpOdnZJRjZP?=
 =?utf-8?B?TXB4NkRNVHJIZVZKU0Naa1VLanhoRVNFOXl3RlNUcS9RcXBHSmJrR1dZR2xx?=
 =?utf-8?B?YSsxOTZleFpTdjJ5YWNic3V0MDBDY2VHVDVnM1UvaGZ5TzI3U3ZxNTIxL3dZ?=
 =?utf-8?B?SDc1T1VRWlBmcTdUdy9NYlppRVR2RTlTcjdTNUNiSnU5Rmd0blp1Q1BCbVEv?=
 =?utf-8?B?Snc1UXdodnBsU040ZXV1dXB6YS9VN3BTTldBaGw0aXgwVlB2NG9xSWptUzlM?=
 =?utf-8?B?dmt0bVFmZEIwMVZ3RFpJTXFaTmQzdkJwM2xYZUx3RllqT050a0k5QkZOUDMr?=
 =?utf-8?B?T0N0S21idllndzlOcmtLUWJicVlpMFdBeEtCZEhZSHZSckdmOGtTR2wxTGZt?=
 =?utf-8?B?WndPU1ZYK1RUNldRWlduZlQzbGphQkxGaVFLT3lNcmJuVlZ2VHhWL29BUm9j?=
 =?utf-8?Q?Ohyg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B01111229C76544AB8AF90C0BDF5DE1F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f83e39-a9f9-4f48-6a9c-08dc7f034c24
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 10:45:31.8754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UhWAYWrt5j3hLeQfcwJINs5uj+TyCDv/TndtmcWJn9EZcuXxCW6BZUu5XM49FsHT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5672
X-Mailman-Approved-At: Tue, 28 May 2024 11:57:27 +0000
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

T24gMjgvMDUvMjAyNCAxMy4xNywgRlVKSVRBIFRvbW9ub3JpIHdyb3RlOg0KPiBFeHRlcm5hbCBl
bWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cw0KPiANCj4gDQo+
IEhpLA0KPiANCj4gT24gVHVlLCAyOCBNYXkgMjAyNCAwODo0MDoyMCArMDAwMA0KPiBaaGkgV2Fu
ZyA8emhpd0BudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+PiBPbiAyNy8wNS8yMDI0IDIyLjE4LCBE
YW5pbG8gS3J1bW1yaWNoIHdyb3RlOg0KPj4+IEV4dGVybmFsIGVtYWlsOiBVc2UgY2F1dGlvbiBv
cGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzDQo+Pj4NCj4+Pg0KPj4+IE9uIFR1ZSwgTWF5IDIx
LCAyMDI0IGF0IDA4OjMyOjMxQU0gKzAzMDAsIFpoaSBXYW5nIHdyb3RlOg0KPj4+PiBPbiBNb24s
IDIwIE1heSAyMDI0IDE5OjI0OjE5ICswMjAwDQo+Pj4+IERhbmlsbyBLcnVtbXJpY2ggPGRha3JA
cmVkaGF0LmNvbT4gd3JvdGU6DQo+Pj4+DQo+Pj4+PiBBZGQgYW4gYWJzdHJhY3Rpb24gYXJvdW5k
IHRoZSBrZXJuZWxzIGZpcm13YXJlIEFQSSB0byByZXF1ZXN0IGZpcm13YXJlDQo+Pj4+PiBpbWFn
ZXMuIFRoZSBhYnN0cmFjdGlvbiBwcm92aWRlcyBmdW5jdGlvbnMgdG8gYWNjZXNzIHRoZSBmaXJt
d2FyZQ0KPj4+Pj4gYnVmZmVyIGFuZCAvIG9yIGNvcHkgaXQgdG8gYSBuZXcgYnVmZmVyIGFsbG9j
YXRlZCB3aXRoIGEgZ2l2ZW4NCj4+Pj4+IGFsbG9jYXRvciBiYWNrZW5kLg0KPj4+Pj4NCj4+Pj4N
Cj4+Pj4gV2FzIHBsYXlpbmcgd2l0aCBmaXJtd2FyZSBleHRyYWN0aW9ucyBiYXNlZCBvbiB0aGlz
IHBhdGNoLg0KPj4+PiBVbmZvcnR1bmF0ZWx5IEkgZW5kZWQgdXAgd2l0aCBhIGxvdCBvZiBwb2lu
dGVyIG9wZXJhdGlvbnMsIHVuc2FmZQ0KPj4+PiBzdGF0ZW1lbnRzLg0KPj4+Pg0KPj4+PiBBcyB3
ZSBrbm93IG1hbnkgdmVuZG9ycyBoYXZlIGEgQyBoZWFkZXJzIGZvciB0aGUgZGVmaW5pdGlvbnMg
b2YgdGhlDQo+Pj4+IGZpcndtYXJlIGNvbnRlbnQsIHRoZSBkcml2ZXIgZXh0cmFjdCB0aGUgZGF0
YSBieSBhcHBseWluZyBhIHN0cnVjdA0KPj4+PiBwb2ludGVyIG9uIGl0Lg0KPj4+Pg0KPj4+PiBC
dXQgaW4gcnVzdCwgSSBmZWVsIGl0IHdvdWxkIG5pY2UgdGhhdCB3ZSBjYW4gYWxzbyBoYXZlIGEg
Y29tbW9uDQo+Pj4+IGZpcm13YXJlIGV4dHJhY3RvciBmb3IgZHJpdmVycywgdGhhdCBjYW4gd3Jh
cCB0aGUgcG9pbnRlciBvcGVyYXRpb25zLA0KPj4+PiB0YWtlIGEgbGlzdCBvZiB0aGUgZmlybXdh
cmUgc3RydWN0IG1lbWJlcnMgdGhhdCBjb252ZXJ0ZWQgZnJvbSBDIGhlYWRlcnMNCj4+Pj4gYXMg
dGhlIGlucHV0LCBvZmZlciB0aGUgZHJpdmVyIHNvbWUgY29tbW9uIEFCSSBtZXRob2RzIHRvIHF1
ZXJ5IHRoZW0uDQo+Pj4+IE1heWJlIHRoYXQgd291bGQgZWFzZSB0aGUgcGFpbiBhIGxvdC4NCj4+
Pg0KPj4+IFNvLCB5b3UgbWVhbiBzb21lIGFic3RyYWN0aW9uIHRoYXQgdGFrZXMgYSBsaXN0IG9m
IHR5cGVzLCBvZmZzZXRzIGluIHRoZQ0KPj4+IGZpcm13YXJlIGFuZCBhIHJlZmVyZW5jZSB0byB0
aGUgZmlybXdhcmUgaXRzZWxmIGFuZCBwcm92aWRlcyByZWZlcmVuY2VzIHRvIHRoZQ0KPj4+IGNv
cnJlc3BvbmRpbmcgb2JqZWN0cz8NCj4+Pg0KPj4+IEkgYWdyZWUgaXQgbWlnaHQgYmUgaGVscGZ1
bCB0byBoYXZlIHNvbWUgY29tbW9uIGluZnJhc3RydWN0dXJlIGZvciB0aGlzLCBidXQgdGhlDQo+
Pj4gb3BlcmF0aW9ucyBvbiBpdCB3b3VsZCBzdGlsbCBiZSB1bnNhZmUsIHNpbmNlIHVsdGltYXRl
bHkgaXQgaW52b2x2ZXMNCj4+PiBkZXJlZmVyZW5jaW5nIHBvaW50ZXJzLg0KPj4+DQo+Pg0KPj4g
SSB0aGluayB0aGUgZ29hbCBpcyB0byAxKSBjb25jZW50cmF0ZSB0aGUgInVuc2FmZSIgb3BlcmF0
aW9ucyBpbiBhDQo+PiBhYnN0cmFjdGlvbiBzbyB0aGUgZHJpdmVyIGRvZXNuJ3QgaGF2ZSB0byB3
cml0ZSBleHBsYW5hdGlvbiBvZiB1bnNhZmUNCj4+IG9wZXJhdGlvbnMgaGVyZSBhbmQgdGhlcmUs
IGltcHJvdmUgdGhlIHJlYWRhYmlsaXR5IG9mIHRoZSBkcml2ZXIgdGhhdA0KPj4gaW50ZXJhY3Rz
IHdpdGggdmVuZG9yLWZpcm13YXJlIGJ1ZmZlci4gMikgZWFzZSB0aGUgZHJpdmVyIG1haW50ZW5h
bmNlDQo+PiBidXJkZW4uDQo+Pg0KPj4gU29tZSBzb2x1dGlvbnMgSSBzYXcgaW4gZGlmZmVyZW50
IHByb2plY3RzIHdyaXR0ZW4gaW4gcnVzdCBmb3INCj4+IGRlLXJlZmVyZW5jaW5nIGEgcGVyLWRl
ZmluZWQgc3RydWN0Og0KPiANCj4gQXJlbid0IHRoZXJlIG90aGVyIGFic3RyYWN0aW9ucyB0aGF0
IHJlcXVpcmUgdGhhdCBmdW5jdGlvbmFsaXR5LCBub3QNCj4ganVzdCB0aGUgZmlybXdhcmUgYWJz
dHJhY3Rpb25zPw0KDQpTdXJlLCBidXQgdGhleSBtaWdodCBpbXBsZW1lbnQgaXQgaW4gYSBkaWZm
ZXJlbnQgd2F5IGR1ZSB0byB0aGVpciANCmRpZmZlcmVudCBzY2FsZSBhbmQgcmVxdWlyZW1lbnRz
IG9mIG1haW50ZW5hbmNlLg0KDQpJIGFtIG1vcmUgaW50ZXJlc3RlZCBpbiB3aGF0IGlzIHRoZSBi
ZXR0ZXIgb3B0aW9uIGZvciBmaXJtd2FyZSANCmFic3RyYWN0aW9ucyBiYXNlZCBvbiBpdHMgc2Nh
bGUgYW5kIHJlcXVpcmVtZW50cy4gMSkgaG93IHRvIGltcHJvdmUgdGhlIA0KcmVhZGFiaWxpdHkg
b2YgdGhlIGRyaXZlciwgbWVhbndoaWxlIGtlZXAgdGhlIG9wZXJhdGlvbnMgc2FmZS4gMikgdGhl
cmUgDQpoYXMgYmVlbiBDLXZlcnNpb24gdmVuZG9yLWZpcm13YXJlIGRlZmluaXRpb25zLCB3aGF0
IHdvdWxkIGJlIHRoZSBiZXN0IA0KZm9yIHRoZSBydXN0IGRyaXZlciB0byBsZXZlcmFnZSBpdCBi
YXNlZCBvbiB0aGUgcm91dGluZXMgdGhhdCB0aGUgcnVzdCANCmtlcm5lbCBoYXMgYWxyZWFkeSBo
YWQuIDMpIGhvdyB0byBhdm9pZCBzeW5jaW5nIHRoZSBoZWFkZXJzIG9mIHZlbmRvciANCmZpcm13
YXJlIGJldHdlZW4gQyBhbmQgcnVzdCB2ZXJzaW9uLCBhcyB0aGUgZGVmaW5pdGlvbiBjYW4gc2Nh
bGUgdXAgZHVlIA0KdG8gSFcgZ2VuZXJhdGlvbnMgb3IgQUJJIGNoYW5nZXMuDQoNClRoYW5rcywN
ClpoaS4NCg==
