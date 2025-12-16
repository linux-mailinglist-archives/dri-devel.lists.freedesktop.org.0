Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0054CC1BC1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 10:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0086D10E747;
	Tue, 16 Dec 2025 09:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oR86OqQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013065.outbound.protection.outlook.com
 [40.107.201.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B02210E751;
 Tue, 16 Dec 2025 09:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAWpK/wP7LApjJql4bqeEeSa1v5zeGtVhZXXvWBBgmqNhdSSyDXaCAcZGIs7OhUEt556RWsCCseUyBJlMbyVLajDJ34mxV+OIP6d6NRbOsaCmd9czjaqRwniqlO8WcGFoM+D1k4qQxlwKMsFbI9NHUJgNLNpFH2O1g3Bqw+jdKTUXoTG+pDGEygsEOl8IUcFKcZ+mYYxtUDECV8dLfe24KENCodIJhtkzaP1QzK5eSJeFHuxjw4dYja+AB8Et6/9UDndgYrhdzEuXwzUC82+7ufTWgSFZU5LpDfHdhUCkYpx32cjzI0wfSGNa3ngGuU8M0m1+iR5FO+SK34KtVnuDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9LzVN9OxcqUKp5k1gz7OfnPXdWsSmLSljPD+POrUQ0=;
 b=FPUmfuPPXw1SgXBcHy0ZkRAIUv6C1aPOsVnETkiIFa5MUtoH7Tkt3nwl7ZeP5BUY2LQZQ7/k+O4KbIUYpxQBNi9MfOh5Y1LJeX5u89VQduEVTC2Yr/pdlzzNA0iQ81sB6jl9dundpTkKZ2TXo+RX/GZIKXI14+l0nMnG3imT0pWtS41zaMkUf08d2Gxd3ekcKnuwIoMbb1Z23BHf9jgx3vJiX3ocRTh6xSLUqEuePwYp6gAnJtU8Mz16pDsj1Djm9ulAovQSqGQX1UAmah9VKlEqCjZtkS50gjNfFFfwIS6MUt70EKVEglahAtmih+L0mUBRB+fbSKhGETrC9hRpWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9LzVN9OxcqUKp5k1gz7OfnPXdWsSmLSljPD+POrUQ0=;
 b=oR86OqQZG1wifdkfriEL5NMk+iW5zMSUkDAkVr3bp7gED9gFLctqZB5/PdOtPV3w6fJ3b0tvSZYJ2oiu2jit/N5IfIcuFOfQs908/mG+i9MZ0Ugw8uyuhnCCGoOVHt4okL2h+5m6IUeC4l5IRI1XvplKij9q1LvYBeYUNFrAUsb12at/hsswjjJ+al1SBbAuWcTCaqYz6ogdXZPdZgJI2dSCLBIPDVYgO+R9LXZc8vWGsctb3JtaQqziap00zIwYVtFHvf5VjF5MI5UYl8s6ddSUHyWUROQnbpUVL7IXl3l8QUG6sScPSuviMLAu0DmV4sdkbxRurO7FNgtxWRZ37Q==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 09:21:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 09:21:56 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer
 <epeer@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v3 0/4] gpu: nova-core: fixups for GSP message queue and
 bindings
Thread-Topic: [PATCH v3 0/4] gpu: nova-core: fixups for GSP message queue and
 bindings
Thread-Index: AQHcbje6HdeDHH/TGECugI1zF73m4LUj/mkO
Date: Tue, 16 Dec 2025 09:21:56 +0000
Message-ID: <9C5D3184-E3D7-4628-A844-07E4B86696BA@nvidia.com>
References: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
In-Reply-To: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|SN7PR12MB6909:EE_
x-ms-office365-filtering-correlation-id: f7dde8cd-1ff6-4d60-3fea-08de3c848f1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WnQ4Z05wZmZVTUVva1dGc2p1dFNkM0xkd3MreG5leG9EQ3EwcjdKYmpzRjlT?=
 =?utf-8?B?Mysyc1l4dWZybS91NDEvVW5DUmpyQ2FBN01vTnJUc1dyV1ZPZG5yc3NFQ2ho?=
 =?utf-8?B?TzEwNnY0WkVySHpZR3RIRmxIclE1VXdTa0pJUlJBcktNcmJVa1ZpcmtWMmdh?=
 =?utf-8?B?bUp4Q1lCNHRheGtJSVd6R21jTVhTa1h6QzNjc1gxLzlac0sxZTB4dUVJSEJU?=
 =?utf-8?B?a3VtU3E4Z2g4Wlo0VS9HT2FLdU9TKzgvdmdrVGpMZ3JlMnZ4cjB3VWErMkZP?=
 =?utf-8?B?VUtTQnZKSVdVRWFKM2piU2FDTldnS3RXM2lGWWtmL0ZyUmFJb20vMHo0Z1l3?=
 =?utf-8?B?aVRFYmFPQ0RPOXRsRlBOeCs1YU8xaTF1YVNOS3lGYVVLWEdZai8vdnhkZDYw?=
 =?utf-8?B?WExodU9BdVpkTE5IaGRFM0tuclByc2FYaVJUQmVKNGJHNEc5NG9mTitHSDhv?=
 =?utf-8?B?S2dRUWErNTRmdFRpcW5jQnY5Y3k4LzNrT2t0a2ZxMXA3ZmY4Vkwra2picHds?=
 =?utf-8?B?K1pKVCt3ckM4ODFqa0k1d0Fqd3FDRTNBTUkwQzYvSU95SE03Yjhad3cvMG9u?=
 =?utf-8?B?ZCtSSEdJRm92QmduaDZmZjc1YU1rYkt4S0xncTIvNlRteUFEZiszejFXNEJP?=
 =?utf-8?B?UHBVdjFHZ2FTazU1RG1SWkVFa0dxS0xkUlJWUW8wbGhoR2RMODk1TW1vaTRL?=
 =?utf-8?B?anR4NVdyakJmd1pncTlOVTNOU20xeUhOOXcrdktWZVBFbS9qQ0tjdmJ5a2lP?=
 =?utf-8?B?YndNanVYT1diTzMxS1RGV0dFaHNDNGdGRThzZTVacnptTXI0SEs4bXRLUEh5?=
 =?utf-8?B?UHUrSlFlYjJTcnJnTmxvNUJYcnZySFI3bDVoYjZsQnFlL0svTzJKSWV5UTVG?=
 =?utf-8?B?T0g1YzlNSXVnZU5rb2lzZDFVbW9ENnh1V0tqQ2d4b1hCNFp5RTUxNEdQQk1u?=
 =?utf-8?B?aGpyZ2kveGdFNVV6YTloaEwrdG9EOWF5TDBVcm05bEl5UXVNWkNhcVFtQ1JZ?=
 =?utf-8?B?bFM4QktLM1ZubDQ0eEtLUDhJcTlMQzNlZE1hN0Y4cU10cytwblprMlpQV3dr?=
 =?utf-8?B?ajlTRGhoYkZINVdhbktrY3IzWDM3N1NaT2xZQ0tVM3Rsazl3RVI2U0F6cGJn?=
 =?utf-8?B?VVhVNGhibSt3b1BBWmgxK2JTVHBhSUZMUGhnYk52QVlJMm5qQVM4dFI5ak9h?=
 =?utf-8?B?c3lUTjM3bURaY0pWdGYwb3RTNkxqSCtHckgzbkQ3WGZpdW9kaWFPTEt2RlZL?=
 =?utf-8?B?REhBZUpiY3IyZTQ4K3A5bTFrQmdWbzRFWUo4a2w5b3VJdGp6aXovOVdVQTZi?=
 =?utf-8?B?MlRiNFZCZDczTzZBMXFHQ0g3U1BEUGxXT2Z4eXdEQXBBNmFwWDRMZ05uOTla?=
 =?utf-8?B?b0tiYmJYeXNVeHFBV0NkSTIxQnR5VHRsV2g1em9uRzZIQ0t6dFJqaWVZNkhz?=
 =?utf-8?B?MmlvMFI5bFZKeE5TaWpUV1MvdFhVcUFtWTRDV2ZRUGpsWkdQYnZwR1c0RzlI?=
 =?utf-8?B?eHp1ODV3cG1EN0JCRkZEWkIzcUk3Ryt0ZUMrYUswZHFQMGgydis3MmZkY2VP?=
 =?utf-8?B?NUZ3dzhzTGQ5RUxqaGE1cDBrNTdYTmtBNTVBMThGZk9pQXR3YnlqZmRNNWlW?=
 =?utf-8?B?dTJGeGR5SE1wVElYV0IzdnNaTjl4anhpTGxVMEQwUy8rNmtRTlBCS3VkOW5s?=
 =?utf-8?B?ZHIwa1hzVFoyMkVQeFVvbjZBTnhwRGlDTUZMTkpOUnpQV0hRK1RqaG1aL1pF?=
 =?utf-8?B?YjFHWDRwYmtJdmZjOXh2TEQ2Q1JLVURGSjBuUEJ5WnNRVXkrZTIrRVNMTGNp?=
 =?utf-8?B?NmRrVnlHOTg3SFZYbFk1RERUanVHQlU2Rkw4NWZDNXlLSnBRQ0Y0MGFGRTFW?=
 =?utf-8?B?RFZFZnFqWStaNlpQMGtyZ20xY3ZVZTFJSEZHWTF1V2tXd3hpSXREa0VsUnVW?=
 =?utf-8?B?RjBXM2lySmV3VU9peEVvYzFYcEphRUFncG1ZdVNWaFRndm5iRkR4VmRTRW5z?=
 =?utf-8?B?TUMzQUozUmN1WGhtT0tHN3JWZHUyZy9sNkY4QU9Va01Ea1o2ZWQ2SldQL1lz?=
 =?utf-8?Q?aJwlTq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1IzeDdZRzNuQnV3YjB3V2NKaXErVkVlTzV6ZTRseTh4cll1aU11ZkdESG04?=
 =?utf-8?B?K2x4a25kS2tTUzVNTGx3bE1wd1FqWlpMYS9RWFRidkZuNWJkc2dydDRUSk94?=
 =?utf-8?B?SUhXWTZCMi93ejBiVk5VR3lWalFqVklMVXpkTWEwdDUvZXMyTFlnaW1YNk9o?=
 =?utf-8?B?QVRuTk5hN3lBY0thcUhnY3RYZ0VoalFrNWVOOG9WK1FKWUFoOWpSa1dHY3Q2?=
 =?utf-8?B?S2dpT01DcU1Vb3lpQnJ5Ynp3UFBYdXJsOVplc0hZek9GUVpNV2tqOUJ6Njlo?=
 =?utf-8?B?S28zbU4zN1R5RWNqK3UvREdlMHc2SXV1NTZkNnZwbEtwdWNjajJ2LzY2eFQz?=
 =?utf-8?B?aHFCRmgxaEQrcGVxNzZUYUlVZURNMWtydU1FeE1xUy83SzF3UzZGdHRmWHBi?=
 =?utf-8?B?Q0lxWHR1aUhNSWxIYWhBZXBraUxpZzA5NG42TkVMSXJ5WWErUzloNHB0cTIv?=
 =?utf-8?B?M0RGTlBxRWdwcS9iMXFpck9DVjZveVJ6WkY5UFBxOExTTlcxRHNlajFmSWYz?=
 =?utf-8?B?OEpYdEZ2L1JxSUlzUkl1T1NEclNNVHdOUHBuclkvNVNHMU1IeXM5NUFpdEM5?=
 =?utf-8?B?Qm81dk9QWmVoVXJQbEQ5YmpaeVlNN3lEV2RGZFk0RkFGc002bVRuVTdwNW4w?=
 =?utf-8?B?NEg4QkZCZkt3TlZyQjY4MzJ0SVV1SmxjRlhsVTBTd2ZGRjFVamR3MjZYaE1z?=
 =?utf-8?B?a2VHWGNYbDJrU1FObVp5clZ6VEE2bHRhc0IySHRUVS9xVDdDQTJZSmlRL0o3?=
 =?utf-8?B?dTJ4eUFWQVk5QnpWT0pNbjBMZVhqY3BFdUdMbjFnK1hSRXFoelYyWnNOdnJm?=
 =?utf-8?B?dDYvWTF5SGpEblVkN08wSnQ4YmJQR2srWTlseWFrTjRNWXd3UEVacUhYbUJ2?=
 =?utf-8?B?U2hpNHhQSHR1eTFmRWRsaW9kcnhnM3FENlFoRjBlalFrNFJ2RXBGWWNBNi90?=
 =?utf-8?B?VTVrYzlvb29IcmpFUFJUOWl2Rmc3STlmTlBnMFdOK2ZDQi8wUjV4bXhDQ2ht?=
 =?utf-8?B?TCsvdlRpaXZHNHNYYUNMb1ovQ2ZHMUJsZVhYU00xcjI2M1c0OHFmamdxekFx?=
 =?utf-8?B?bGNrWUxQdUM0U3QrNllPMnZWSHdScGhiOGVFSHB2eVR3UlZIRDk1cGpLejNG?=
 =?utf-8?B?U0w5ZUdnOUxyM0IwYVNQbGx1Mkc4RHpCM0V2KzRpWVZrekF5WHNRakhZZWJx?=
 =?utf-8?B?TG9ZZkJRNDlIVWZRL0x1bXNZV1cydm9TbFJZMmZ3SzAzY1o2VmtsSnY1UWRX?=
 =?utf-8?B?VnJQNkxmTzFBcXJnSEZhNSs3eEJLWGptVjlyY0RhM2M3aTFPYXhlQVBCVkdz?=
 =?utf-8?B?Y0svTFJrS0p3NC93WFJHVzFtMGIzWHNRbDFEc2dkOTV4aVV3RGRtSU5Sd3lW?=
 =?utf-8?B?TmN2Z2FzcCtQRkhIUzlKeHg5bXB4WlVVR2hMdXVOVEhhNVNvcDlqdWV0T080?=
 =?utf-8?B?ZnVHUmhzSEJHSVpOMGlHQnR1V2hSMUlRMWVjZU1UdmM3WndLSkQyN1RDbGYw?=
 =?utf-8?B?ZHBqYVR6RmM3TUxqL2FKR1N5VDlkdkpyd2lKeVhRTkFoSGMxeWxkZEtGSXhF?=
 =?utf-8?B?cFZQV2NIbkpub3pVUHBzZ1drbG8vMUtmNFE1SlpIbFR3NXRTdGV2RFErSCtS?=
 =?utf-8?B?bWpDeG16aXN0dkkzM1FtbUY3clJuUDRLcW51VmcxdGc2RTljWVBmUDh3blo0?=
 =?utf-8?B?YVc5WDcwUTY0T28wbXVwOEtjSlc2d0Y5NXdNVVgyUE90RzdCdkJKUFZ0Q1Rr?=
 =?utf-8?B?aDRkZ2NSejdZMlBHVldRcCt4OVNodERGS0RHc29ORHg0cDgxWVlSeUF4LzN3?=
 =?utf-8?B?VFpmWmFpbndHek1RUm95bitxQlVEVUV5d1hpZGJGbUJaZURLN2VFSm81K0ZF?=
 =?utf-8?B?dWs3UGl5MndYUmlaQWNDWUNVV0MyVlZWdVdaQ0Y1bUpKaG43SDdBWlI2dGV3?=
 =?utf-8?B?Z3ZqaldVck1Cei9nbzVQZ0dyVGh1SXVPSVNqTDhOeWF1M0gveWc5ZWxNOGsv?=
 =?utf-8?B?YStrdUk3T0FWWHUxVnA4SDRnVUY3YzdBUTZYWGc1MDFvNHl4MktkcUQ3aitp?=
 =?utf-8?B?dWl3QldDZ2xPM3owTGJDb3ZweXd6bE80MVZ2WlFIYmhLVlZvMlZCUmxYOEZs?=
 =?utf-8?Q?sNc9Pwufufq+CCNBOWctNdVKD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dde8cd-1ff6-4d60-3fea-08de3c848f1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 09:21:56.7116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0eaGKWYQh7NmrxFB6/oYD+vfnP/WIoUit7CuuV+68MCamvh7zz91qtAuup1kV6iFYJ2bcQDr0y1oh+4+Op1y/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909
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

DQoNCj4gT24gRGVjIDE1LCAyMDI1LCBhdCA5OjU34oCvUE0sIEFsZXhhbmRyZSBDb3VyYm90IDxh
Y291cmJvdEBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v1RoaXMgc2VyaWVzIGNvbnRhaW5z
IGEgZmV3IGZpeHVwcyBmb3IgdGhlIHJlY2VudGx5IG1lcmdlZCBHU1ANCj4gY29tbWFuZC1xdWV1
ZSBjb2RlLCBieSBvcmRlciBvZiBpbXBvcnRhbmNlOg0KPiANCj4gLSBTb21lIGV4cGxpY2l0IHBh
ZGRpbmcgcmVxdWlyZWQgdG8gc2FmZWx5IGltcGxlbWVudCBgQXNCeXRlc2Agd2FzDQo+ICBtaXNz
aW5nIGluIHRoZSBiaW5kaW5ncywNCj4gLSBBIGJ1ZyBpbiB0aGUgcmVjZWl2ZWQgbWVzc2FnZSBs
ZW5ndGggY2FsY3VsYXRpb24gcmVzdWx0cyBpbiB0aGUNCj4gIG1lc3NhZ2UgaGFuZGxlciBiZWlu
ZyBnaXZlbiBtb3JlIGRhdGEgdGhhbiBpdCBzaG91bGQsDQo+IC0gYE1heWJlWmVyb2FibGVgIGlz
IG5vdyBkZXJpdmVkIGJ5IHRoZSBrZXJuZWwncyBiaW5kZ2VuLCBidXQgdGhlIE5vdmENCj4gIGJp
bmRpbmdzIGhhdmUgbm90IGJlZW4gdXBkYXRlZCBmb3IgdGhhdCwNCj4gLSBTb21lIGl0ZW1zIGlu
IHRoZSBiaW5kaW5ncyB3ZXJlIHJlZmVycmVkIHRvIHVzaW5nIHRoZSB2ZXJzaW9uIG1vZHVsZQ0K
PiAgZGlyZWN0bHksIGluc3RlYWQgb2YgdGhlIGFsaWFzIHdlIGRlZmluZWQgdG8gbGltaXQgdGhl
IGRpZmYgd2hlbiB3ZQ0KPiAgdXBncmFkZSBmaXJtd2FyZSB2ZXJzaW9ucy4NCj4gDQo+IEFsbCBv
ZiB0aGVtIGFkZHJlc3MgImJ1Z3MiICh3aXRoIHRoZSBmaXJzdCB0d28gZml4aW5nIGFjdHVhbCBj
b3JyZWN0bmVzcw0KPiBpc3N1ZXMpLCBidXQgc2luY2UgTm92YSBkb2VzIG5vdCBkbyBtdWNoIGFu
eXdheSwgdGhleSBhcmUgYWxzbyBub3QNCj4gYWJzb2x1dGVseSBjcml0aWNhbC4gT3RoZXIgc2Vy
aWVzIHBsYW5uZWQgZm9yIHRoaXMgY3ljbGUgd2lsbCBkZXBlbmQgb24NCj4gdGhlbSwgc28gb25l
IHdheSBvciB0aGUgb3RoZXIgaXQgd291bGQgYmUgZ3JlYXQgdG8gc2VlIHRoZW0gaW4NCj4gZHJt
LXJ1c3QtbmV4dC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291
cmJvdEBudmlkaWEuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBSZWJhc2Ugb24g
dG9wIG9mIGRybS1ydXN0LW5leHQuDQo+IC0gQWRkIG1ldGhvZCB0byByZXR1cm4gdGhlIHBheWxv
YWQgc2l6ZSBvZiBhIG1lc3NhZ2UuICh0aGFua3MgQWxpc3RhaXIhKQ0KPiAtIExpbmsgdG8gdjI6
IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI1MTEyMy1ub3ZhLWZpeGVzLXYyLTAtMzNkODYw
OTJjZjZhQG52aWRpYS5jb20NCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gQWRkIG1pc3Npbmcg
IkZpeGVzOiIgdGFncy4NCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjUxMTIyLW5vdmEtZml4ZXMtdjEtMC1hOTFlYWZlZWQ3YjVAbnZpZGlhLmNvbQ0KPiANCj4g
LS0tDQo+IEFsZXhhbmRyZSBDb3VyYm90ICg0KToNCj4gICAgICBncHU6IG5vdmEtY29yZTogYmlu
ZGluZ3M6IGFkZCBtaXNzaW5nIGV4cGxpY2l0IHBhZGRpbmcNCj4gICAgICBncHU6IG5vdmEtY29y
ZTogZ3NwOiBmaXggbGVuZ3RoIG9mIHJlY2VpdmVkIG1lc3NhZ2VzDQo+ICAgICAgZ3B1OiBub3Zh
LWNvcmU6IGJpbmRpbmdzOiBkZXJpdmUgYE1heWJlWmVyb2FibGVgDQo+ICAgICAgZ3B1OiBub3Zh
LWNvcmU6IGdzcDogcmVwbGFjZSBmaXJtd2FyZSB2ZXJzaW9uIHdpdGggImJpbmRpbmdzIiBhbGlh
cw0KDQpSZXZpZXdlZC1ieTogSm9lbCBGZXJuYW5kZXMgPGpvZWxhZ25lbGZAbnZpZGlhLmNvbT4N
Cg0KdGhhbmtzLA0KDQogLSBKb2VsDQoNCg0KDQo+IA0KPiBkcml2ZXJzL2dwdS9ub3ZhLWNvcmUv
Z3NwL2NtZHEucnMgICAgICAgICAgICAgICAgIHwgIDEwICsrLQ0KPiBkcml2ZXJzL2dwdS9ub3Zh
LWNvcmUvZ3NwL2Z3LnJzICAgICAgICAgICAgICAgICAgIHwgIDc4ICsrKysrKysrLS0tLS0tLS0N
Cj4gZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9mdy9yNTcwXzE0NC5ycyAgICAgICAgICB8ICAx
MSArKy0NCj4gZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9mdy9yNTcwXzE0NC9iaW5kaW5ncy5y
cyB8IDEwNSArKysrKysrKysrKystLS0tLS0tLS0tDQo+IDQgZmlsZXMgY2hhbmdlZCwgMTEwIGlu
c2VydGlvbnMoKyksIDk0IGRlbGV0aW9ucygtKQ0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDYwYzcz
OThiZGVkMmUxMWYwZGI0MGE0MDlhMjQxYjhiZTU5MTBlZTINCj4gY2hhbmdlLWlkOiAyMDI1MTEy
MS1ub3ZhLWZpeGVzLWRjOWI0ZjE3YjkwZQ0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBB
bGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAbnZpZGlhLmNvbT4NCj4gDQo=
