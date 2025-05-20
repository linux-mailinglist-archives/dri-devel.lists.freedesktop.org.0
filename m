Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0EBABDFD6
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D8910E542;
	Tue, 20 May 2025 16:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="o3yXie1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BBF10E542;
 Tue, 20 May 2025 16:02:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YejoLSIjabGl4EP/H/On2wMhHmz96bJiZhP7Y2VBEWD+xmbHZNVE+z4pJhmyem4p2xrj4OsH5i8JxcjbSfA/LcIZADftGUwoanNh9j3ZRaAEjCXYek3CdS/8mHLJAfNYZHmQTiaej10bBxRQsTNvpOwGl/mrTQ1ynhPZ0FT0mCLsA+cSQqYDshAqda5s8DcSh3Nm6e59oEM/Hq8rWkujzITmfqQpvSOqw4x/Xa7JH4z9dsZNLivUOMj3eA5UjJAFvFtXz7Pz/VvLs9SCWlLlHPavbt8Kyc3O9XrcKziZ2CIkjdS+S18uCdZaqVrktiN88RBa3u5oCFkuLoH3+BEWmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mes+6W3ZvVpEvcBCmoV5FHD/0ih8JbeupsO9u27wl0=;
 b=EnT7/fTlxz+jabil2mztgtShvT0i7Yj2d+NlgAlhS53za8p/FSZ4zaNmrP9HBvfzo+jORCD9+sdsPQoz1qp43kDIlxcc41rTZzSsi2lorQHq4wp8A2RaZHCUjwcGUCeZRnjRzXBqUz57rXNyR450zr+Y3GwtCBPod6/REPUOtx10v//G9EAqHm/sQWHpUcZ7jDAY4yIgnJtWl34oVyjPIsIDNLA+gVBQU69t5XtGRvfx0Fd913KTNLLSGDAq6NlPOSLpTcXskNZ/yGX84qeboqzzh5rRiWQwBjCOjUA5rxVc0d3ZF9bg+xOAMLu1d7j1N6RxTCxJeQpMMoiRQrkXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mes+6W3ZvVpEvcBCmoV5FHD/0ih8JbeupsO9u27wl0=;
 b=o3yXie1IoWl/XLcVQAR6pOTKXwhbGfer8Z1YZfSdKqUgH025wVqh21Qr9a6tP7nxTZZ+hclUGSEdVV5wn0ZKdAGBiiHzQDYPs/4/81mj81P+8eokIAVakDMvQPKt0g4ul1YZEZQh+ETp+KIPJcGFycytiQMN0jIS+Dkpl9xJrFkg68sFbu8IRPscys18pQw+aMLY2UtMoFpYjw5TO/0wWk36lWQz2PscvV5QCF3yio6lziijipnl3LNsnJySFhw5ww28YiTfVDS01DHpsFO/Wg/oWicPR5SocMUJWcVahX69nqexSq0k8TjN1WapKZby12CZHgQRW6z3gKSVkrX95Q==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH8PR12MB8608.namprd12.prod.outlook.com (2603:10b6:510:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 20 May
 2025 16:02:16 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 16:02:16 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>, Ben
 Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Shirish Baskaran <sbaskaran@nvidia.com>
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
Thread-Topic: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
Thread-Index: AQHbv1d4bmfduM0PI0K0pUPqdjazNLPQ188AgApiggCAABrAgIAARqUAgAAVroCAAALFAIAABykAgAAHHOI=
Date: Tue, 20 May 2025 16:02:16 +0000
Message-ID: <D283FDA6-B581-442D-A965-100F3904979E@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com> <aCN_PIYEEzs73AqT@pollux>
 <4fee85be-a8c5-4a99-8397-c93e79d72d15@nvidia.com>
 <aCxLyxcERNHKzfvI@cassiopeiae>
 <3cfb7a8c-467e-44d0-9874-361f719748b8@nvidia.com>
 <aCyZPUaPSks_DhTn@cassiopeiae>
 <bdb290d4-b369-4b8e-b78d-8c8d3cc07057@nvidia.com>
 <aCyhkiBTXV86P_GF@cassiopeiae>
In-Reply-To: <aCyhkiBTXV86P_GF@cassiopeiae>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|PH8PR12MB8608:EE_
x-ms-office365-filtering-correlation-id: 79a7d484-7b47-470d-1946-08dd97b7b107
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aGV0cnBBb3g3K1ExSjFUdlRKcFAxZzNrV0JPQzFyNnlvT2ZDeGt3aWFNWHdD?=
 =?utf-8?B?aVkxWFROK3oxV3lScUdyQnY4MER6UXc0Z1FoeThmK05CWmYzVVdFV1pOVEM0?=
 =?utf-8?B?aUtjQktLWTNUTHVTOFc2RWpSVFdMa0U0clJKSlVaWDNCaHJNeW5ZODZlOHhi?=
 =?utf-8?B?SXB2NEE3cjR2ZlFLQTdRK0tXMUg2SEowcmFkaW1BSVREUTEwMityV1lDbU9G?=
 =?utf-8?B?Y2R3VjZHdnJGUk9JdkttdFp6OXVtbmpNQVk5YUNpYnBEc1RjcGFjdDJLMVh2?=
 =?utf-8?B?aTJXNkY2cUQvTURKU24yenp3NnA4T1E0b1AzRCs3Zk52clFuSUdUK1o3MDk5?=
 =?utf-8?B?cjRSZ2VCUnRDMWZQTmtXM1VLSXFTQmloeFZuc3FhdEc0RUMxME5uUHBtcEJi?=
 =?utf-8?B?SFhvNnV6Y3B2bW9EZFpxdG5EWVg2TXdaUWJaSy9UNFprNTA4cEJFWGFsdFVo?=
 =?utf-8?B?T2s0RlFVdWkyTjl5Y01CTnJYek5iSHlMVzV3L0hOUzV4STJzVHZnSzVuaW8v?=
 =?utf-8?B?dmx4S1NMMk1odnZJNEp1ZDE3M1hFbEtsUUlsZU1OanNzaFBzK0VzelZwZDl3?=
 =?utf-8?B?R1RUbnRXRHlHeEpUb05sU05CcDlrbG9xNGZHeEIvdklTRjhhcHY3eitRQklC?=
 =?utf-8?B?dVo2akNQcHlDVVNQMXk5V3hiNGRSNTVrTDJxbXRjMXkyQUZ0RW1xeW1oSUV6?=
 =?utf-8?B?MEZ4REp3MkNQZWFFa1o5NTZSUmJONlc2SFlIV0s4b1ljVEd1ejByTVRGYlZ5?=
 =?utf-8?B?U2NWUDlkdVg1NGJGQzl2YmVPVzZGYUpCV1lrWEdyYm5qSG1RQktNc25zeFFG?=
 =?utf-8?B?WWxFRnJkZG5PNVZ6dk1WUEJsRko0OW44T3Jyb2tvSnF5ZkV5UmpXZFJJd0NH?=
 =?utf-8?B?NzlOZjBmVWg1VFFIUlFLMHo5bmM3cUxodkpWM2plU2xiR2ZDS2VHK1ZMbjRK?=
 =?utf-8?B?OWNzU0VIQU10Q2FoUlhMRXJKb3lqY0x4SkNha29PdndxSzVLZWZHRDh0OHZO?=
 =?utf-8?B?Z21sQlVlNW44M0N1RU9RVEZlemx3RHZqTC9pblRRZ3ZHQVhtNVZRQ25sNjRQ?=
 =?utf-8?B?elh5dlpsd1NGYU01MEtWTFV2bjVBN01ZS080c3VvMWNiQWJkTEkrc2UzcWFB?=
 =?utf-8?B?Q3FDeFFPWkx1dXJlMHcyNE96L244c092M1dkZGlNdHpzOVRETW92U0V0TzFU?=
 =?utf-8?B?Zm1lZ0Y3bnMyb2k4d1U3VnZLUnAzN2RUVkNtRzQ5L1h3Uk5oNHZKZXErWTZH?=
 =?utf-8?B?UGg0WVJKTTdlVWh0WjY2RmszNlowcTNPV1F0emNpcFVvWlpGNkdrek5FeHR1?=
 =?utf-8?B?WWY2QjcyRGYrRlJzeE5oQ29RTysvT3NxeDRuNzh5Sm1YSXhMWm1iYm1NNWNo?=
 =?utf-8?B?TE9HWFh3ME53NWUvdGdyZWhGKzFFNVJRUnQwNU50WmJZUW5vYXQ0c1diQS9v?=
 =?utf-8?B?cVk5eHE4cVpwTVpJOENpUzAxMFVXOTZrU3ZsMVJidkE2MlRnSFV0OGhEVGU5?=
 =?utf-8?B?WWpZd3VxaDY5aDQxZWdFVEdzcE9HRi9YOEJuRDdQcXhIbEE4anVUS3Q0eVRU?=
 =?utf-8?B?Y3AwVzIxMXRaWEFMQ29JeFRzQzBWZ1piY0M3QzQvMTdFZitVRFBxQUJFU0tV?=
 =?utf-8?B?eTVGczQzOGtyczB1NFFRS3NCNjdlN3JGblpCMmNoazRTNjVqcVlnR1JrM1VT?=
 =?utf-8?B?YmJxZFZPekdodWxCcGFqVzJXNzMwNlJxVHZHZDJEc1JBL2VUMEZRWjAwa0Yw?=
 =?utf-8?B?cnB2WUxKK0xmQ05HUXorTHU2SWFqanV0SnlvaVJud3g3QnJUbllGbDF0MXU2?=
 =?utf-8?B?TndFVElCeG1sRmRoVkdxRjhaMDlnU0svZHV2aVR2clNXd2oyL2FDS3JObGQw?=
 =?utf-8?B?Y0ZIbTZKWEIwSXUzRDlFM1I1VXE3ODNib3B4ZEJWcjZMSXpJN2JTUEFOTEdh?=
 =?utf-8?B?ZnlNZzFUdzdnOU9BcHhYWWJmSC9RdVFaUVF2U2xKQVJLUGs0QjQxa2h3bFU3?=
 =?utf-8?B?RXphR05lQ2V3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWFablkwdVErMlJxV2dMSWZLVVBkQ2d0dGRFUXJqbFlMNVphdnVDb0ZXcXBm?=
 =?utf-8?B?eXBzU0VONXd5emEreVJaS2tMc0JQVE9oWDBMd3dFVTU2T1Uwell2YmRnNldk?=
 =?utf-8?B?SUJBSnVaOTdRekxhNWNGYVhqV251dGJiczR6Z2lqbXh3R0M2MDRWQThQSXpS?=
 =?utf-8?B?YUlCVElVdDBwc0JtajN3WlBpb2EwTlM4UWhad005R1liNS9xRW1YTDlMSG1s?=
 =?utf-8?B?QjNueHBxUG1ITmZhN1o3enlBQlQ5WXpzYjh0SlBwQlllbUpHN1FFbi81cVd1?=
 =?utf-8?B?UVFxMjM2emdGbFAzalhPTVRuajdaeE54QVFxU3dvUHRsNnJkYXdXWmpOcXNP?=
 =?utf-8?B?VENmWWd3UVJBa3E4MzdFNEZ3M0pBUDlFbXdxOUNmU20xaXJPVzFLT1BOT08x?=
 =?utf-8?B?TC9kNmJOd2tPL0wzUVo2Y3l3YnVud0lRVGJnZlFkem5Ma3BRVnVSVEp5UFFa?=
 =?utf-8?B?U0Yvem9TWnpsUGpNMWFwNTRIOHlsOG5NZ1pmQVlsR3BTMXVhaXZyN3FkUG5P?=
 =?utf-8?B?UFJYZmRHNSt6blhuY1hxdDBidnFSOFJCMjJjMEU2OEhrQUdwVGIvckl4cmJN?=
 =?utf-8?B?ZWF3SCtwNndJaFB3M0dFUW5Hb1ovNTkyelI2S3BMYk84Ymo5YXdmdDB2VkJI?=
 =?utf-8?B?UGlVK2VDclZ2ejVpTGUxSkt4UVM1SkFINE5nSzI2OCtxVGdYdTRlNDRkY3U1?=
 =?utf-8?B?bEwybnVHYWkxMXFZaFdTOWV1NHM4SU9oUjNma3hHbGFVK3VDdTRTdVJsWGQx?=
 =?utf-8?B?RC9saVhIcmFCbStMaWQrM1EyejY0ZTJSRHo5TWM1cHBZVnlkWlEyZkU1dTJ2?=
 =?utf-8?B?eGsxYjh1ZXVhcHNkN2V0a2d2RG1CMTZ3VFcvNHJiU21VL29sSVlaV2ZKaEJM?=
 =?utf-8?B?dHNncis1bWsyNEI5OFFzQnZKdDFKYmlPRXdnaFpHMit5SzZVUnJqK3F5WDhC?=
 =?utf-8?B?dDZLVnNpbnJzdW9weHU2d1JubXJEamxBck5iT3p5cWRFQTUzU25EWkhqbXR6?=
 =?utf-8?B?UTlBSGplTnhpSDdLQkZmWHBaOTJPbkQ0Q3NFSXRNV0FRdFpvZ2M1NkVZOTZw?=
 =?utf-8?B?L2hIc2tYZjJhQ1BJdE5yUHlDWCszZU95anJybEFDRnFIeHJIeUpWMG9wRmdR?=
 =?utf-8?B?VG5YeVorcXQ5c1F3eG1naE0rL0VRdmFtem5tK2VobFUvK1ZGa1I5T3VxbHhW?=
 =?utf-8?B?TzNMNjlITDg5UFdIL2VMM3JMRkVHQk5oc3R0NlRLY0ljaEcvdzd5U3hjellX?=
 =?utf-8?B?cjRtT3BHekNFK3NWaSs0ZnhzbmI1bTNOYzdWclpPczBUN2RGb1EzK0xGQ2Jo?=
 =?utf-8?B?bHZ1cUpTYURlbFFENHhRTTlWUDBwL0dMb0lHbm9NR1M2VzU0ZHFrV3F3VFZB?=
 =?utf-8?B?RlNlTlRtK204akZIWis4aDJQTUltY0hZeWRBY04wa0IzNWU4RzV5N0pBWkM3?=
 =?utf-8?B?ODlvTXpVd01QNklWMFNBcFpHN2l4aFFHY2VnRDVNc0E0alhZOHA0WG5FU01l?=
 =?utf-8?B?OGV4T2I2VlBBN2xTN21DSURXU3hUNjBiMlNJNVRhRmFJUUdxeUtlb3NyMVp0?=
 =?utf-8?B?eTdYSzA2QUl4KzBhcDRVcjQ0cnhUbVFRTDlTdTZDWnRoZkhzRU1yemdJcStw?=
 =?utf-8?B?Rk1pSWgwdndDWWRqSW0yaEcxdlYxaVlQYmsxQlc5YklYY08yTUdsMGtwdVk1?=
 =?utf-8?B?cHBpWXFZM0FoUkNOSFQ2NHRiMUVseG00QjNYTitDS1JXUFc3ZTd1K3BYNTNW?=
 =?utf-8?B?clJTazNteGxJWHo0ZThBZ1JKQlZLWlN0SjlNNzErQ1RMOGovUXVCbDNRd1JN?=
 =?utf-8?B?aWJ1SWdIV3h0dWhNaFE4YXlDc1VvMG1XUFkwRGZvVmhyTGdzR21UcjFndmFG?=
 =?utf-8?B?SllUN0ROUVJGRkFFakdHODcyU3FyOFM5Y2xudGNIVWlOdmRZZ3lyWHA2M2lz?=
 =?utf-8?B?Y1FZTnAvTDIrL0JYVUxJNWNqdkIyRGY3Vm1PZHlYRnJOUEwwVkZKdXZydUZU?=
 =?utf-8?B?dEFIY3ZqSnN0d1N0UU0rMmM3TGdvRDlJRUxQRGJEMndTTkhabHBGZ2ZXdXNF?=
 =?utf-8?B?a0hHUTlzdUM5dHI4Vk1zQkoyVWdmam1CaVVFWVRWc091d0N1bUxaUHMvYng4?=
 =?utf-8?Q?TmAbW0GCQrV/ICqszSVvA4rgo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a7d484-7b47-470d-1946-08dd97b7b107
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 16:02:16.1254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HduzhQOytI3NV96xXbHSA+hTvb1hciAMMvuye0izrP8NxG6KrsV+ShToblDUFfntw3nmcsKzwlZU6TGOP8DTTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8608
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

DQoNCj4gT24gTWF5IDIwLCAyMDI1LCBhdCAxMTozN+KAr0FNLCBEYW5pbG8gS3J1bW1yaWNoIDxk
YWtyQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4g77u/T24gVHVlLCBNYXkgMjAsIDIwMjUgYXQg
MTE6MTE6MTJBTSAtMDQwMCwgSm9lbCBGZXJuYW5kZXMgd3JvdGU6DQo+PiBPbiA1LzIwLzIwMjUg
MTE6MDEgQU0sIERhbmlsbyBLcnVtbXJpY2ggd3JvdGU6DQo+PiANCj4+IEkgbWFkZSB0aGlzIGNo
YW5nZSBhbmQgaXQgTEdUTS4gVGhhbmtzISBJIGRpZCBub3QgZG8gdGhlICcuMCcgdGhvdWdoIHNp
bmNlIEkNCj4+IHdhbnQgdG8ga2VlcCB0aGUgcmVhZGFiaWxpdHksIGxldHMgc2VlIGluIHRoZSBu
ZXh0IHJldmlzaW9uIGlmIHRoYXQgbG9va3MgZ29vZC4NCj4gDQo+IEkgdGhpbmsgcmVhZGFiaWxp
dHksIGlzIGp1c3QgYXMgZ29vZCB3aXRoIGAuMGAsIGJ1dCBJJ20gZmluZSB3aXRoIGVpdGhlci4N
Cg0KQ29vbC4NCg0KPiANCj4+Pj4+IEluIGdlbmVyYWwsIEkgZmVlbCBsaWtlIGEgbG90IG9mIHRo
b3NlIE9wdGlvbiBjb21lIGZyb20gYSBwcm9ncmFtbWluZyBwYXR0ZXJuDQo+Pj4+PiB0aGF0IGlz
IHZlcnkgY29tbW9uIGluIEMsIGkuZS4gYWxsb2NhdGUgYSBzdHJ1Y3R1cmUgKHN0YWNrIG9yIGhl
YXApIGFuZCB0aGVuDQo+Pj4+PiBpbml0aWFsaXplIGl0cyBmaWVsZHMuDQo+Pj4+PiANCj4+Pj4+
IEluIFJ1c3QgeW91IHNob3VsZCBhaW0gdG8gaW5pdGlhbGl6ZSBhbGwgdGhlIGZpZWxkcyBvZiBh
IHN0cnVjdHVyZSB3aGVuIHlvdQ0KPj4+Pj4gY3JlYXRlIHRoZSBpbnN0YW5jZS4gT3B0aW9uIGFz
IGEgcmV0dXJuIHR5cGUgb2YgYSBmdW5jdGlvbiBpcyBjb21tb24sIGJ1dCBpdCdzDQo+Pj4+PiBh
bHdheXMgYSBiaXQgc3VzcGljaW91cyB3aGVuIHRoZXJlIGlzIGFuIE9wdGlvbiBmaWVsZCBpbiBh
IHN0cnVjdC4NCj4+Pj4gDQo+Pj4+IEkgbG9va2VkIGludG8gaXQsIEkgY291bGQgbm90IGdpdCBy
aWQgb2YgdGhvc2Ugb25lcyBiZWNhdXNlIHdlIG5lZWQgdG8NCj4+Pj4gaW5pdGlhbGl6ZSBpbiB0
aGUgImltcGwgVHJ5RnJvbTxCaW9zSW1hZ2VCYXNlPiBmb3IgQmlvc0ltYWdlIHsiDQo+Pj4+IA0K
Pj4+PiAgICAgICAgICAgIDB4RTAgPT4gT2soQmlvc0ltYWdlOjpGd1NlYyhGd1NlY0Jpb3NJbWFn
ZSB7DQo+Pj4+ICAgICAgICAgICAgICAgIGJhc2UsDQo+Pj4+ICAgICAgICAgICAgICAgIGZhbGNv
bl9kYXRhX29mZnNldDogTm9uZSwNCj4+Pj4gICAgICAgICAgICAgICAgcG11X2xvb2t1cF90YWJs
ZTogTm9uZSwNCj4+Pj4gICAgICAgICAgICAgICAgZmFsY29uX3Vjb2RlX29mZnNldDogTm9uZSwN
Cj4+Pj4gICAgICAgICAgICB9KSksDQo+Pj4+IA0KPj4+PiBBbmQgdGhlc2UgZmllbGRzIHdpbGwg
bm90IGJlIGRldGVybWluZWQgdW50aWwgbXVjaCBsYXRlciwgYmVjYXVzZSBhcyBpcyB0aGUgY2Fz
ZQ0KPj4+PiB3aXRoIHRoZSBlYXJsaWVyIGV4YW1wbGUsIHRoZXNlIGZpZWxkcyBjYW5ub3QgYmUg
ZGV0ZXJtaW5lZCB1bnRpbCBhbGwgdGhlIGltYWdlcw0KPj4+PiBhcmUgcGFyc2VkLg0KPj4+IA0K
Pj4+IFlvdSBzaG91bGQgbm90IHVzZSBUcnlGcm9tLCBidXQgaW5zdGVhZCB1c2UgYSBub3JtYWwg
Y29uc3RydWN0b3IsIHN1Y2ggYXMNCj4+PiANCj4+PiAgICBCaW9zSW1hZ2U6Om5ldyhiYXNlX2Jp
b3NfaW1hZ2UpDQo+Pj4gDQo+Pj4gYW5kIGRvIHRoZSBwYXJzaW5nIHdpdGhpbiB0aGlzIGNvbnN0
cnVjdG9yLg0KPj4+IA0KPj4+IElmIHlvdSB3YW50IGEgaGVscGVyIHR5cGUgd2l0aCBPcHRpb25z
IHdoaWxlIHBhcnNpbmcgdGhhdCdzIHRvdGFsbHkgZmluZSwgYnV0DQo+Pj4gdGhlIGZpbmFsIHJl
c3VsdCBjYW4gY2xlYXJseSBiZSB3aXRob3V0IE9wdGlvbnMuIEZvciBpbnN0YW5jZToNCj4+PiAN
Cj4+PiAgICBzdHJ1Y3QgRGF0YSB7DQo+Pj4gICAgICAgaW1hZ2U6IEtWZWM8dTg+LA0KPj4+ICAg
IH0NCj4+PiANCj4+PiAgICBpbXBsIERhdGEgew0KPj4+ICAgICAgIGZuIG5ldygpIC0+IFJlc3Vs
dDxTZWxmPiB7DQo+Pj4gICAgICAgICAgbGV0IHBhcnNlciA9IERhdGFQYXJzZXI6Om5ldygpOw0K
Pj4+IA0KPj4+ICAgICAgICAgIFNlbGYgeyBpbWFnZTogcGFyc2VyLnBhcnNlKCk/IH0NCj4+PiAg
ICAgICB9DQo+Pj4gDQo+Pj4gICAgICAgZm4gbG9hZF9pbWFnZSgmc2VsZikgew0KPj4+ICAgICAg
ICAgIC4uLg0KPj4+ICAgICAgIH0NCj4+PiAgICB9DQo+Pj4gDQo+Pj4gICAgc3RydWN0IERhdGFQ
YXJzZXIgew0KPj4+ICAgICAgIC8vIE9ubHkgc29tZSBpbWFnZXMgaGF2ZSBhIGNoZWNrc3VtLg0K
Pj4+ICAgICAgIGNoZWNrc3VtOiBPcHRpb248dTY0PiwNCj4+PiAgICAgICAvLyBTb21lIGltYWdl
cyBoYXZlIGFuIGV4dHJhIG9mZnNldC4NCj4+PiAgICAgICBvZmZzZXQ6IE9wdGlvbjx1NjQ+LA0K
Pj4+ICAgICAgIC8vIFNvbWUgaW1hZ2VzIG5lZWQgdG8gYmUgcGF0Y2hlZC4NCj4+PiAgICAgICBw
YXRjaDogT3B0aW9uPEtWZWM8dTg+PiwNCj4+PiAgICAgICBpbWFnZTogS1ZlYzx1OD4sDQo+Pj4g
ICAgfQ0KPj4+IA0KPj4+ICAgIGltcGwgRGF0YVBhcnNlciB7DQo+Pj4gICAgICAgZm4gbmV3KCkg
LT4gU2VsZiB7DQo+Pj4gICAgICAgICAgU2VsZiB7DQo+Pj4gICAgICAgICAgICAgY2hlY2tzdW06
IE5vbmUsDQo+Pj4gICAgICAgICAgICAgb2Zmc2V0OiBOb25lLA0KPj4+ICAgICAgICAgICAgIHBh
dGNoOiBOb25lLA0KPj4+ICAgICAgICAgICAgIGJ5dGVzOiBLVmVjOjpuZXcoKSwNCj4+PiAgICAg
ICAgICB9DQo+Pj4gICAgICAgfQ0KPj4+IA0KPj4+ICAgICAgIGZuIHBhcnNlKHNlbGYpIC0+IFJl
c3VsdDxLVmVjPHU4Pj4gew0KPj4+ICAgICAgICAgIC8vIEZldGNoIGFsbCB0aGUgcmVxdWlyZWQg
ZGF0YS4NCj4+PiAgICAgICAgICBzZWxmLmZldGNoX2NoZWNrc3VtKCk/Ow0KPj4+ICAgICAgICAg
IHNlbGYuZmV0Y2hfb2Zmc2V0KCk/Ow0KPj4+ICAgICAgICAgIHNlbGYuZmV0Y2hfcGF0Y2goKT87
DQo+Pj4gICAgICAgICAgc2VsZi5mZXRjaF9ieWVzKCk/Ow0KPj4+IA0KPj4+ICAgICAgICAgIC8v
IERvZXNuJ3QgZG8gYW55dGhpbmcgaWYgYGNoZWNrc3VtID09IE5vbmVgLg0KPj4+ICAgICAgICAg
IHNlbGYudmFsaWRhdGVfY2hlY2tzdW0oKT87DQo+Pj4gDQo+Pj4gICAgICAgICAgLy8gRG9lc24n
dCBkbyBhbnl0aGluZyBpZiBgb2Zmc2V0ID09IE5vbmVgLg0KPj4+ICAgICAgICAgIHNlbGYuYXBw
bHlfb2Zmc2V0KCk/Ow0KPj4+IA0KPj4+ICAgICAgICAgIC8vIERvZXNuJ3QgZG8gYW55dGhpbmcg
aWYgYHBhdGNoID09IE5vbmVgLg0KPj4+ICAgICAgICAgIHNlbGYuYXBwbHlfcGF0Y2goKT87DQo+
Pj4gDQo+Pj4gICAgICAgICAgLy8gUmV0dXJuIHRoZSBmaW5hbCBpbWFnZS4NCj4+PiAgICAgICAg
ICBzZWxmLmltYWdlDQo+Pj4gICAgICAgfQ0KPj4+ICAgIH0NCj4+PiANCj4+PiBJIHRoaW5rIHRo
ZSBwYXR0ZXJuIGhlcmUgaXMgdGhlIHNhbWUsIGJ1dCBpbiB0aGlzIGV4YW1wbGUgeW91IGtlZXAg
d29ya2luZyB3aXRoDQo+Pj4gdGhlIERhdGFQYXJzZXIsIGluc3RlYWQgb2YgYSBuZXcgaW5zdGFu
Y2Ugb2YgRGF0YS4NCj4+IA0KPj4gSSB0aGluayB0aGlzIHdvdWxkIGJlIGEgZnVuZGFtZW50YWwg
cmV3cml0ZSBvZiB0aGUgcGF0Y2guIEkgYW0gT2sgd2l0aCBsb29raW5nDQo+PiBpbnRvIGl0IGFz
IGEgZnV0dXJlIGl0ZW0sIGJ1dCByaWdodCBub3cgSSBhbSBub3Qgc3VyZSBpZiBpdCBqdXN0aWZp
ZXMgbm90IHVzaW5nDQo+PiBPcHRpb24gZm9yIHRoZXNlIGZldy4gVGhlcmUncyBhIGxvdCBvZiBp
bW1lZGlhdGUgd29yayB3ZSBoYXZlIHRvIGRvIGZvciBib290LA0KPj4gbGV0cyBwbGVhc2Ugbm90
IGJsb2NrIHRoZSBwYXRjaCBvbiBqdXN0IHRoaXMgaWYgdGhhdCdzIE9rIHdpdGggeW91LiBJZiB5
b3Ugd2FudCwNCj4+IEkgY291bGQgYWRkIGEgVE9ETyBoZXJlLg0KPiANCj4gSG9uZXN0bHksIEkg
ZG9uJ3QgdGhpbmsgaXQnZCBiZSB0b28gYmFkIHRvIGZpeCB0aGlzIHVwLiBJdCdzICJqdXN0IiBh
IGJpdCBvZg0KPiBqdWdnbGluZyBmaWVsZHMgYW5kIG1vdmluZyBjb2RlIGFyb3VuZC4gVGhlIGFj
dHVhbCBjb2RlIHNob3VsZCBub3QgY2hhbmdlIG11Y2guDQo+IA0KPiBIYXZpbmcgT3B0aW9uPFQ+
IHdoZXJlIHRoZSBjb3JyZXNwb25kaW5nIHZhbHVlIFQgaXNuJ3QgYWN0dWFsbHkgb3B0aW9uYWwg
aXMNCj4gZXh0cmVtZWx5IGNvbmZ1c2luZyBhbmQgbWFrZXMgaXQgaGFyZCBmb3IgZXZlcnlvbmUs
IGJ1dCBlc3BlY2lhbGx5IG5ldw0KPiBjb250cmlidXRvcnMsIHRvIHVuZGVyc3RhbmQgdGhlIGNv
ZGUgYW5kIGNhbiBlYXNpbHkgdHJpY2sgcGVvcGxlIGludG8gdGFraW5nDQo+IHdyb25nIGFzc3Vt
cHRpb25zLg0KPiANCj4gTWFraW5nIHRoZSBjb2RlIHJlYXNvbmFibHkgYWNjZXNzaWJsZSBmb3Ig
KG5ldykgY29udHJpYnV0b3JzIGlzIG9uZSBvZiB0aGUNCj4gb2JqZWN0aXZlcyBvZiBub3ZhIGFu
ZCBvbmUgb2YgdGhlIGxlYXJuaW5ncyBmcm9tIG5vdXZlYXUuDQo+IA0KPiBIZW5jZSwgbGV0J3Mg
Z2V0IHRoaXMgcmlnaHQgZnJvbSB0aGUgZ2V0LWdvIHBsZWFzZS4NCg0KT2ssIEkgd2lsbCBsb29r
IGludG8gbWFraW5nIHRoaXMgY2hhbmdlLiA6LSkNCg0KdGhhbmtzLA0KDQogLSBKb2VsDQoNCg0K
