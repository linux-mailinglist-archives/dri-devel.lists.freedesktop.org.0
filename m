Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DF7AE0724
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB3D10EA63;
	Thu, 19 Jun 2025 13:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rs7eoXR4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9E810EA5F;
 Thu, 19 Jun 2025 13:25:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhUpkrrPd01aTqoOVd3/QpDHT1mb9Mxxy2rWFeUppP8hStWzvH+lkfjrQGYq4OKSBtDv9/G843cQ81iESdSHaZxvkhVmVmeDOlncl8Loaq+8CXCz1PFUwkRGMkahHqadrYaKG1X5y36RULxw0yod5g9YwaKIURV7Yuw91LjJW9N/gae56QwgSFRpYJN5ia5lJvEPN3KBQdoc3R+mzbzpx1SRd4QKxmDlJv24itqEriFcpnVhGDHLpq49q6nX5zERyZbyloRDiYSzFnys71OsCdcK8xdkbP6CuYJDaIqzHKtGviLx/ZqvN1+LEfSpaok05Z7WTeY+nmCCIFrcELkhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdrrO8d2gatIqHnuEQo2nq8kP+X6B1eFNdIzWh2dgV0=;
 b=VVj4MSWU1X5icTtthcx8jLa3mqo9zjwL8biWJ92EK+X8orPg6Yhos9xA1id2a0cl4VLejMF4vAnzbvOnqBXM4xx/a0j9+jZhGuYDZjDS241XhQcqrGi8RCd8kmIQT2h/GyNbRGp+IQqXw9fVQ+WFiR3Zb91zb4AnN/h0Z0I6m7da/f/3XUDWS1/ZrAjd5HLijuVpESJhmGbrxKtoirJOtYmZMbLmrcg0cJi/afymTNQSNn7z4Ubk/Mi+r1gVtkFsPuYDKNALsp9AQ0pZxOg6l3vg21+I/Amdaq5RUvttSKgIsYAoCx07Ru+m0GCYwAvgHvfN+aLfbL8b00ij9KfR+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdrrO8d2gatIqHnuEQo2nq8kP+X6B1eFNdIzWh2dgV0=;
 b=Rs7eoXR4Ri5DtYpnMXwanyBmBxwfS0ZQTqY8E1XvkoMNEXdcjPPRSs3mlZAGlaBYovZYlSvZKD3RtNezIRXulTf0nbFgFzmkgcWIOG0BeiXaX7DdVCipZkxl7qZFqsigoFxCqjIrOtrpMicZoI8+Gqps7VpddcVwdKQXaX21x5u2AhRbg0G1IzKfpMbeBAyJpVbhsDcU6Yr7Tex761DuZ0me/ggH96XIGX+GYiMEHXOQplltTcNa5Z9TqyzjQfDCDM9PY8gkaMWVpmyi/XsIL822fXtVYw7B0Ht91hZFbJ8TRxKPBVsXa2PXs4kWFa8UycV3n2kq6QYD29/eG5q3Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 13:25:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:24:08 +0900
Subject: [PATCH v6 24/24] gpu: nova-core: update and annotate TODO list
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-24-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0252.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: f855b9fb-5d28-4a37-10e3-08ddaf34cd6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVhHMWJSQnNlUGpjSFFtRS9tRitxTk5xZDlDZjV6Yk04a3NmT1hUMC9WbElJ?=
 =?utf-8?B?NW9iTVgzRUJVb3M5VkRocGZrWSttVDVhdURBWlVTakhuMmtmYVNlQ3VOSCsw?=
 =?utf-8?B?cFlTTmNLTG5hV2xaVG5PamJ3SmtyN3VBZnNXSUEzcXdhR3A5N2tuQWRVVlE2?=
 =?utf-8?B?Y2NwMzNTYjUzSjRqUTRKaDVJU0lrU0ZyQTM3WENjayt5WjU5NXgxWS9VYzVv?=
 =?utf-8?B?TXIycTQ0bVRrVlVTV0p3RXh0akovRUFxQzZTMWhzKzZPS3p4TjJOazN4emd3?=
 =?utf-8?B?M3JjanM0eHhMYkZlaVlScnltN3dNOE41M2RncFhzcHA1cm1DYndCbTNIMERw?=
 =?utf-8?B?Yk9wbnNQY0trU1BqVHo5UitXR0p6REExOTMxdjVIMUZZUEc5eGhlajJ6RVpT?=
 =?utf-8?B?bUY4MDRLMXgwdzZwU2FtSUJreDlVamFram5PZWpqY3doTmF0WTJGN1ovUFFL?=
 =?utf-8?B?OG8wNHRCbHVNOFM2dWhockdSM1psRk9jdVJQYmlBc25MeFpwbjNxUjI4S0lX?=
 =?utf-8?B?V1R3dU9PSVF2N2lsMnljV2JCQlorV3VGY3dIeVhib005WU9EM1pBYVZFL3BY?=
 =?utf-8?B?ajFNcXpYeE9seExjOGovMUVzcTZRTVdEMUxrNEg0cFdJM1lSd1dIOUVWWEdH?=
 =?utf-8?B?enl6bkFDem0wVnp4OWd1a3gwRkZDU2Z0c1ZGY1JWdDlaVm11VTJzcVpxNjVJ?=
 =?utf-8?B?QjRDS2Zkajd5Zkg5R0VjY0gxWUp4ZUZiRGx2QVpDRFU2ZFVtejEvTzQxN2hB?=
 =?utf-8?B?Tk9obFJXTmpRK0JyN0U1SmFiNmY2eGZTTC9JRlp2dmw3TzdWZG8va0lzeGVB?=
 =?utf-8?B?S1lzY1RMMzdoOG5mdXhGMndTREw3Z01PRUFUTzE1S0JYd01lTlJxUXMyMWRI?=
 =?utf-8?B?enp3M1RtMjJXVEIxckF3Vy9TMGpUNDE1eTU3SWFzcFBBMmJGLzA1cXo5Vjcx?=
 =?utf-8?B?SGhmSUVCSnZHYklIckFDWWNRVFA3WWNqSU8zNFowNU14Qk1lYi9rYU9RM01Z?=
 =?utf-8?B?VzF3ZEc1Wk5lL3ZCYUx6UkI2RGQ4Tmpzbm1HY2ZOYkluZWdWOVFjdTNFZXUw?=
 =?utf-8?B?V0cxa1FzNk0wSE55dDlzNUpMUUtSdHA3R1UvSzNwVnlVbFRTU1dPbXQ2R0tB?=
 =?utf-8?B?eEtlMXllVnNsQWFBeVhZVmR3Z2c0aUVHWEZHOTJQUGxNdmVrU0h6UlFYWUZa?=
 =?utf-8?B?VCtaOG1HODd2WjZhbG92R1pEc2s2YjJVN0xadzVud1VIM0t1OTYwU2E3dlZy?=
 =?utf-8?B?NWwxdkNNSFVKVElIS3ZLZkhsdm5oZmpyQzVXZndDM25KN1NBY2dOaU5mcm52?=
 =?utf-8?B?dXBXbmxFNENDVnRHYnJlbXQ5YWFJY1RicThKS0dRSFVSeHVvQzhhRCtvM09W?=
 =?utf-8?B?M0llQzJSQk5JWElBWjBhTCtDRXhCWmpydG5BUlkxQ0RNZnVzMUgvWjlicENx?=
 =?utf-8?B?V3VhUVZKU2FWWFlpOGNFYXRVZVVKL3AyNHVWYVEwNWl6Tm1vd1pRRUN0OTE2?=
 =?utf-8?B?THMrM3hxRGVFQWhjWHMzRUZNMUp6SzJ4YjFOL25hZUJXY29VQms3YytPbUJX?=
 =?utf-8?B?Y0c1b29vK2FsMEVLVjNBU0lDN21OaS92V3FlOHRhaEJwa0NRNHVpWnNOL09W?=
 =?utf-8?B?cktVVWJPYzd4TVJwNzJpVVMxSW04WlprQXJURFJqZkR2MklEN2sxWU05Q29a?=
 =?utf-8?B?VkNLazBnTzZXVlhYbnN0a0Q3K2dnRnFHcndUZEsxT01INFR3NHZCOU5qU3Jt?=
 =?utf-8?B?YS9sUVA2ckxveWd0K3RHOE1YMWYzMjFJS09Fb3NES1phTXBzRzlraG9ZeTJB?=
 =?utf-8?B?YUZDbnJ2b1I4T3FJbWNkSEZHV20rNU5TeDZpdDZxWnJHN1QvTkc5anVxNUZN?=
 =?utf-8?B?cXRyVGp0SSs3Qnc2LzdmMzhta0tTQjJNZGFhZW50M0lEemk2Z05KZ2xkL3Uy?=
 =?utf-8?B?NkVPRjFtVTJxRjk0eUNDR2ZWamJPTHEzYXFrSWt0TElKaTlUcWptQy9RN1Nu?=
 =?utf-8?B?WWlOemJ5N0x3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c09SSHEvRG5FSVVKVnhYZkZhWkNZZ1RjWGJPOWRSN29TaC9kdDNyRlVHbUwx?=
 =?utf-8?B?bTJnckJxTDJ4NW9qMm9iOGJzeERuUWZkTHNMZlhzREoyeTRPM1VaVGh2d2h5?=
 =?utf-8?B?bkFSMDRpREdXSTZjbHYvWmRrRTZwTFAydmlmdkwrQzRSSDV6cVIwRHpyOWpw?=
 =?utf-8?B?b1hHMXlkODhRV3BHTGxZdDFPdjJmUEFudDd4eW1welZja3o1K2p4VHVZeU5O?=
 =?utf-8?B?VWt5bDNJVXBqQStIbiszSkZicVJNbUV2TldWSktzcFR4NjlXd2ZKVS9CMldU?=
 =?utf-8?B?cFdySGxqMk5oaGl6WFpIVDdscWc0am9rWU9oL3dZODdpNUF3VEhUQlpkOEsy?=
 =?utf-8?B?c3FQZHJNWXBndFNSeTNZWE1FODZZVGZqLy9DMGtabVlWNm12WWpCWjIwcVlG?=
 =?utf-8?B?MHphbjBNWkdQK2h1RHpQdy9IZHFTeTFiY0c5RnRLSFpkcCt4dStOenlBb1dI?=
 =?utf-8?B?NkxpZUpGaC81ZUttejZaN3VhYXM4S1FWZDRNSU9rV25LOUs1eTRCNE11ZTIz?=
 =?utf-8?B?d25keWNwQ2k0S0puWDZIdStNR3lZbDlUaTd3TDl4Zyt3UUxFMFN3aFkxUEt2?=
 =?utf-8?B?bHRvZTB0TzUyNVpTY2Vsb3podGp4MXhoQkh1ZDRXWEtIN0UrMVc3ZlZmSEc5?=
 =?utf-8?B?elI4TTZrWVhlOGIyVlNqVFZQM0dwMzc4R2ZaMFFhMXpjYmpqSFlMYkJQNll6?=
 =?utf-8?B?SHZxTCtpUjh3Q0hlVnJFaHNhM0c4aWp1U1p2Ykg3Zkk2VExIbFAvYkIrVUNX?=
 =?utf-8?B?VkVyZzc5K1hvNTN2Mk9WR1VPZmFqY2RLSnpJSEdSRDJhMFJkb0VnZnYxaFVQ?=
 =?utf-8?B?djdIWXp1YUZDZWFSQklmYVBlT3krTzlIN0FGTEJoQmh5aUFyRGtqRVFWaExl?=
 =?utf-8?B?SmN4bm9IVnVBUVNZVnRjcU9WT3I1SmdQaE1oNFlJSW1ZSHVpRXBreVZOcUVB?=
 =?utf-8?B?eXBtaUhPMWlhSFB3ZnlmbkJQWHFOekp3WmJCMlU4c0oydmJ1V3huQUhPN28v?=
 =?utf-8?B?REdmazVVeXA5U1RrekM2QU0zUS9jQjhBL0s2d2llNk4rUTgvV29NUzFyQzY1?=
 =?utf-8?B?aEJkdk5sQ1UxN3VTOFlPbC9jT0M1eWZDUjJ5UWxVR1pDM2ZQM1BCbi90WEpy?=
 =?utf-8?B?bEFXOFJBVlRQK1lzK1Z4ankwL29oa3NsY3JDelhweUlnZGZ3ZWE2dUQvbm9u?=
 =?utf-8?B?UDBMV0N2QkpCY0pKbWMzSWxqTGdRU1ZpcmhmTTF2RkdFVUNOTUUvUDBhRFFK?=
 =?utf-8?B?VjBiZkdrcGg2aVBUYVg5RTk0TmdMdHljZGc4R1J4OStZS0tqd3BxSkVVRjFU?=
 =?utf-8?B?R3dBTzl6dkoyRzIxQS96VW1XL3h6MnF4a0FXZnpsTzZVcS96eTd5OUk4b3NX?=
 =?utf-8?B?TmtYb1FmRjh5Sm9tbGxsTVhzSTUyS2ptSTg2VTZoNUs2V2F0bzVLNk1laE1W?=
 =?utf-8?B?ZGhBdG1oOW5MR2x1SklZMm1OSlZ4d1Zxa2cwTjBPOTBHRkdIanlrVk4vcGtW?=
 =?utf-8?B?a0srSnJTemY0UGJaTHN4NDZjNmREM1ZaTXA1d0pXRGtkRVZtV1FyTHNFQ3JF?=
 =?utf-8?B?ODhIQlR4bUVtZGplMEVDNDJhUktpODdsblM2Q0JEenZ3R3ZKenNhblo5Vkw2?=
 =?utf-8?B?czdzZ25lV1NGTUhPSk9KbTF1T2JFZWpVMzZMNzlUQzFCYVBpWTlWQWJhZVVk?=
 =?utf-8?B?VDMwUzF2WFdGMFJYUitIdDRuamo4MDZmTjNnTUk2dzF0ODBkeFQzOUo4OHZE?=
 =?utf-8?B?TnNra2ZGQU9wRlhUcDExNmFLeFJLb2p4U3ZxemliKzM5b1pidExmUGZLbWk1?=
 =?utf-8?B?d094WG12YnpVTHF2MHlSUDc0bUVMVmRmZEVpaDBDbllqZERsZ0Ixa29ncVZS?=
 =?utf-8?B?VlVSNU9GSzVZUGJuRHFnRkRwTWZjM1FxNm0zWHR1WHk4ZkozY2wrWkVLeFdy?=
 =?utf-8?B?TCtsTmd3WktnTUtUdzJ2TmpFbWFGUHJHWlVBaXNocjZoZkZqZ1ZlRzRSNW8r?=
 =?utf-8?B?UzlmMi9aODlybjByRlQ1VW1TMExnRUdDYVFmejhXU0JoalFuVVh5Z3ljWGgy?=
 =?utf-8?B?eDA3VFFWbWxNaTQ1SkVMQVNwVUYrVVI5NGlobFN1UVh5eDhncmppWkovK3or?=
 =?utf-8?B?bHlMdUNiVU9YWHpoTlpJM00zQ0xqVHVja1RaOHowN1Z2TjNIVnZyayt4R2VJ?=
 =?utf-8?Q?sP9MCxdSuDs8w21pPbaqmb9hF+NqjPMkWbTecZ/BdtmB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f855b9fb-5d28-4a37-10e3-08ddaf34cd6e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:47.7670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEimDk9puCYonJ2bw1px/gp13EzI5lB5XxulxOlbqUNzFDWo60RgNVgiMiQyzAxpT1fqGpHEnir8y2dSunEo6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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

A few new dependencies are required to remove some of the TODO items:

- A way to safely convert from byte slices to types implementing
  `FromBytes`,
- A way to obtain slices and write into a `CoherentAllocation`,
- Several improvements to the `register!()` macro,
- Alignment operations to powers of two, and an equivalent to the C
  `fls`,
- Support for `xa_alloc` in the XAlloc bindings.

Some items have also become obsolete:

- The auxiliary bus abstractions have been implemented and are in use,
- The ELF utilities are not considered for being part of the core kernel
  bindings anymore.
- VBIOS, falcon and GPU timer have been completed.

We now have quite a few TODO entries in the code, so annotate them with
a 4 letter code representing the corresponding task in `todo.rst`. This
allows to easily find which part of the code corresponds to a given
entry (and conversely).

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst      | 107 ++++++++++++++++--------------
 drivers/gpu/nova-core/dma.rs              |   2 +-
 drivers/gpu/nova-core/driver.rs           |   2 +-
 drivers/gpu/nova-core/falcon.rs           |   8 ++-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  10 +--
 drivers/gpu/nova-core/fb.rs               |   2 +-
 drivers/gpu/nova-core/firmware/fwsec.rs   |   6 +-
 drivers/gpu/nova-core/gfw.rs              |   2 +-
 drivers/gpu/nova-core/gpu.rs              |   2 +-
 drivers/gpu/nova-core/regs.rs             |   8 +--
 drivers/gpu/nova-core/regs/macros.rs      |   2 +-
 drivers/gpu/nova-core/util.rs             |   2 +-
 drivers/gpu/nova-core/vbios.rs            |   2 +-
 13 files changed, 84 insertions(+), 71 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 8a459fc088121f770bfcda5dfb4ef51c712793ce..894a1e9c3741a43ad4eb76d24a9486862999874e 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -14,14 +14,17 @@ Tasks may have the following fields:
 - ``Contact``: The person that can be contacted for further information about
   the task.
 
+A task might have `[ABCD]` code after its name. This code can be used to grep
+into the code for `TODO` entries related to it.
+
 Enablement (Rust)
 =================
 
 Tasks that are not directly related to nova-core, but are preconditions in terms
 of required APIs.
 
-FromPrimitive API
------------------
+FromPrimitive API [FPRI]
+------------------------
 
 Sometimes the need arises to convert a number to a value of an enum or a
 structure.
@@ -41,8 +44,27 @@ automatically generates the corresponding mappings between a value and a number.
 | Complexity: Beginner
 | Link: https://docs.rs/num/latest/num/trait.FromPrimitive.html
 
-Generic register abstraction
-----------------------------
+Conversion from byte slices for types implementing FromBytes [TRSM]
+-------------------------------------------------------------------
+
+We retrieve several structures from byte streams coming from the BIOS or loaded
+firmware. At the moment converting the bytes slice into the proper type require
+an inelegant `unsafe` operation; this will go away once `FromBytes` implements
+a proper `from_bytes` method.
+
+| Complexity: Beginner
+
+CoherentAllocation improvements [COHA]
+--------------------------------------
+
+`CoherentAllocation` needs a safe way to write into the allocation, and to
+obtain slices within the allocation.
+
+| Complexity: Beginner
+| Contact: Abdiel Janulgue
+
+Generic register abstraction [REGA]
+-----------------------------------
 
 Work out how register constants and structures can be automatically generated
 through generalized macros.
@@ -102,16 +124,40 @@ Usage:
 	let boot0 = Boot0::read(&bar);
 	pr_info!("Revision: {}\n", boot0.revision());
 
-Note: a work-in-progress implementation currently resides in
+A work-in-progress implementation currently resides in
 `drivers/gpu/nova-core/regs/macros.rs` and is used in nova-core. It would be
 nice to improve it (possibly using proc macros) and move it to the `kernel`
 crate so it can be used by other components as well.
 
+Features desired before this happens:
+
+* Relative register with build-time base address validation,
+* Arrays of registers with build-time index validation,
+* Make I/O optional I/O (for field values that are not registers),
+* Support other sizes than `u32`,
+* Allow visibility control for registers and individual fields,
+* Use Rust slice syntax to express fields ranges.
+
 | Complexity: Advanced
 | Contact: Alexandre Courbot
 
-Delay / Sleep abstractions
---------------------------
+Numerical operations [NUMM]
+---------------------------
+
+Nova uses integer operations that are not part of the standard library (or not
+implemented in an optimized way for the kernel). These include:
+
+- Aligning up and down to a power of two,
+- The "Find Last Set Bit" (`fls` function of the C part of the kernel)
+  operation.
+
+A `num` core kernel module is being designed to provide these operations.
+
+| Complexity: Intermediate
+| Contact: Alexandre Courbot
+
+Delay / Sleep abstractions [DLAY]
+---------------------------------
 
 Rust abstractions for the kernel's delay() and sleep() functions.
 
@@ -159,18 +205,6 @@ mailing list yet.
 | Complexity: Intermediate
 | Contact: Abdiel Janulgue
 
-ELF utils
----------
-
-Rust implementation of ELF header representation to retrieve section header
-tables, names, and data from an ELF-formatted images.
-
-There is preceding work from Abdiel Janulgue, which hasn't made it to the
-mailing list yet.
-
-| Complexity: Beginner
-| Contact: Abdiel Janulgue
-
 PCI MISC APIs
 -------------
 
@@ -179,12 +213,11 @@ capability, MSI API abstractions.
 
 | Complexity: Beginner
 
-Auxiliary bus abstractions
---------------------------
+XArray bindings [XARR]
+----------------------
 
-Rust abstraction for the auxiliary bus APIs.
-
-This is needed to connect nova-core to the nova-drm driver.
+We need bindings for `xa_alloc`/`xa_alloc_cyclic` in order to generate the
+auxiliary device IDs.
 
 | Complexity: Intermediate
 
@@ -216,15 +249,6 @@ Build the radix3 page table to map the firmware.
 | Complexity: Intermediate
 | Contact: Abdiel Janulgue
 
-vBIOS support
--------------
-
-Parse the vBIOS and probe the structures required for driver initialization.
-
-| Contact: Dave Airlie
-| Reference: Vec extensions
-| Complexity: Intermediate
-
 Initial Devinit support
 -----------------------
 
@@ -234,23 +258,6 @@ configuration.
 | Contact: Dave Airlie
 | Complexity: Beginner
 
-Boot Falcon controller
-----------------------
-
-Infrastructure to load and execute falcon (sec2) firmware images; handle the
-GSP falcon processor and fwsec loading.
-
-| Complexity: Advanced
-| Contact: Dave Airlie
-
-GPU Timer support
------------------
-
-Support for the GPU's internal timer peripheral.
-
-| Complexity: Beginner
-| Contact: Dave Airlie
-
 MMU / PT management
 -------------------
 
diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 1f1f8c378d8e2cf51edc772e7afe392e9c9c8831..94f44bcfd748d18ea42c520e36a618bde9635e55 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -26,7 +26,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
 
     pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
         Self::new(dev, data.len()).map(|mut dma_obj| {
-            // TODO: replace with `CoherentAllocation::write()` once available.
+            // TODO[COHA]: replace with `CoherentAllocation::write()` once available.
             // SAFETY:
             // - `dma_obj`'s size is at least `data.len()`.
             // - We have just created this object and there is no other user at this stage.
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index ffe25c7a2fdad289549460f7fd87d6e09299a35c..518ef8739550fd0b63b5a4aa98cd1fd814770725 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -42,7 +42,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
                 _reg: auxiliary::Registration::new(
                     pdev.as_ref(),
                     c_str!("nova-drm"),
-                    0, // TODO: Once it lands, use XArray; for now we don't use the ID.
+                    0, // TODO[XARR]: Once it lands, use XArray; for now we don't use the ID.
                     crate::MODULE_NAME
                 )?,
             }),
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index fe4d3d458a6b105bfdd6257111d3eed8ed8aba7c..07be1c30668c4bef9e073fe6ad49234aceb7fb81 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -35,6 +35,7 @@ pub(crate) enum FalconCoreRev {
     Rev7 = 7,
 }
 
+// TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconCoreRev {
     type Error = Error;
 
@@ -68,6 +69,7 @@ pub(crate) enum FalconCoreRevSubversion {
     Subversion3 = 3,
 }
 
+// TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconCoreRevSubversion {
     type Error = Error;
 
@@ -101,6 +103,7 @@ pub(crate) enum FalconSecurityModel {
     Heavy = 3,
 }
 
+// TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconSecurityModel {
     type Error = Error;
 
@@ -128,6 +131,7 @@ pub(crate) enum FalconModSelAlgo {
     Rsa3k = 1,
 }
 
+// TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconModSelAlgo {
     type Error = Error;
 
@@ -148,6 +152,7 @@ pub(crate) enum DmaTrfCmdSize {
     Size256B = 0x6,
 }
 
+// TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for DmaTrfCmdSize {
     type Error = Error;
 
@@ -199,6 +204,7 @@ pub(crate) enum FalconFbifTarget {
     NoncoherentSysmem = 2,
 }
 
+// TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconFbifTarget {
     type Error = Error;
 
@@ -354,7 +360,7 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(true));
 
-        // TODO: replace with udelay() or equivalent once available.
+        // TODO[DLAY]: replace with udelay() or equivalent once available.
         // TIMEOUT: falcon engine should not take more than 10us to reset.
         let _: Result = util::wait_on(Duration::from_micros(10), || None);
 
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 0a4e5e7adf8cbcec9f67bb09ba758a9cb2887bae..664327f75cf4199cca37d22ca18b2b9abac781f8 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -42,10 +42,10 @@ fn signature_reg_fuse_version_ga102(
     engine_id_mask: u16,
     ucode_id: u8,
 ) -> Result<u32> {
-    // TODO: The ucode fuse versions are contained in the FUSE_OPT_FPF_<ENGINE>_UCODE<X>_VERSION
-    // registers, which are an array. Our register definition macros do not allow us to manage them
-    // properly, so we need to hardcode their addresses for now. Clean this up once we support
-    // register arrays.
+    // TODO[REGA]: The ucode fuse versions are contained in the
+    // FUSE_OPT_FPF_<ENGINE>_UCODE<X>_VERSION registers, which are an array. Our register
+    // definition macros do not allow us to manage them properly, so we need to hardcode their
+    // addresses for now. Clean this up once we support register arrays.
 
     // Each engine has 16 ucode version registers numbered from 1 to 16.
     if ucode_id == 0 || ucode_id > 16 {
@@ -69,7 +69,7 @@ fn signature_reg_fuse_version_ga102(
     let reg_fuse_version =
         bar.read32(reg_fuse_base + ((ucode_id - 1) as usize * core::mem::size_of::<u32>()));
 
-    // TODO: replace with `last_set_bit` once it lands.
+    // TODO[NUMM]: replace with `last_set_bit` once it lands.
     Ok(u32::BITS - reg_fuse_version.leading_zeros())
 }
 
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index dc009a3ed44c2de7ffeb8cc0be06a72cf2ca5309..48003527a2472a4a8b784af0d481a441c8d2426e 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -121,7 +121,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
         let frts = {
             const FRTS_DOWN_ALIGN: u64 = SZ_128K as u64;
             const FRTS_SIZE: u64 = SZ_1M as u64;
-            // TODO: replace with `align_down` once it lands.
+            // TODO[NUMM]: replace with `align_down` once it lands.
             let frts_base = (vga_workspace.start & !(FRTS_DOWN_ALIGN - 1)) - FRTS_SIZE;
 
             frts_base..frts_base + FRTS_SIZE
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 6058598ce76e25484cc4ebebd1be80b9dd1b469c..047aab76470ecb0a0486f6917f6fda69b5381391 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -150,8 +150,8 @@ impl FirmwareSignature<FwsecFirmware> for Bcrt30Rsa3kSignature {}
 /// Callers must ensure that the region of memory returned is not written for as long as the
 /// returned reference is alive.
 ///
-/// TODO: Remove this and `transmute_mut` once `CoherentAllocation::as_slice` is available and we
-/// have a way to transmute objects implementing FromBytes, e.g.:
+/// TODO[TRSM][COHA]: Remove this and `transmute_mut` once `CoherentAllocation::as_slice` is
+/// available and we have a way to transmute objects implementing FromBytes, e.g.:
 /// https://lore.kernel.org/lkml/20250330234039.29814-1-christiansantoslima21@gmail.com/
 unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
     fw: &'a DmaObject,
@@ -218,7 +218,7 @@ fn dmem_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
             src_start: self.desc.imem_load_size,
             dst_start: self.desc.dmem_phys_base,
-            // TODO: replace with `align_up` once it lands.
+            // TODO[NUMM]: replace with `align_up` once it lands.
             len: self
                 .desc
                 .dmem_load_size
diff --git a/drivers/gpu/nova-core/gfw.rs b/drivers/gpu/nova-core/gfw.rs
index fa3f642bc814c7eea1ce1f2c2e24e684d1ae5fda..97fdd311a1f842c1c4e5c28d10bb26066a7aa586 100644
--- a/drivers/gpu/nova-core/gfw.rs
+++ b/drivers/gpu/nova-core/gfw.rs
@@ -31,7 +31,7 @@ pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result {
         } else {
             // Avoid busy-looping.
             // SAFETY: msleep should be safe to call with any parameter.
-            // TODO: replace with [1] once it merges.
+            // TODO[DLAY]: replace with [1] once it merges.
             // [1] https://lore.kernel.org/rust-for-linux/20250423192857.199712-6-fujita.tomonori@gmail.com/
             unsafe { bindings::msleep(1) };
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index ae454c0e2fb4d485e99fbf9cd80c2ebb89884887..7a6ff6d89cb2a5e3176489e54552d04633861ad6 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -37,7 +37,7 @@ impl Chipset {
             ];
         }
 
-        // TODO replace with something like derive(FromPrimitive)
+        // TODO[FPRI]: replace with something like derive(FromPrimitive)
         impl TryFrom<u32> for Chipset {
             type Error = kernel::error::Error;
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index ccfaeed55cff90e66ac0acf37dcbd0eb344994c5..707f87d6828df54c959af87fd13bbdd3a25aa020 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -44,7 +44,7 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
 
 /* PBUS */
 
-// TODO: this is an array of registers.
+// TODO[REGA]: this is an array of registers.
 register!(NV_PBUS_SW_SCRATCH_0E@0x00001438  {
     31:16   frts_err_code as u16;
 });
@@ -110,7 +110,7 @@ pub(crate) fn higher_bound(self) -> u64 {
     0:0     read_protection_level0 as bool, "Set after FWSEC lowers its protection level";
 });
 
-// TODO: This is an array of registers.
+// TODO[REGA]: This is an array of registers.
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234 {
     31:0    value as u32;
 });
@@ -272,7 +272,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     0:0     reset as bool;
 });
 
-// TODO: this is an array of registers.
+// TODO[REGA]: this is an array of registers.
 register!(NV_PFALCON_FBIF_TRANSCFG @ +0x00000600 {
     1:0     target as u8 ?=> FalconFbifTarget;
     2:2     mem_type as bool => FalconFbifMemType;
@@ -294,7 +294,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     31:0    value as u32;
 });
 
-// TODO: this is an array of registers.
+// TODO[REGA]: this is an array of registers.
 register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ +0x00001210 {
     31:0    value as u32;
 });
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index e0e6fef3796f9dd2ce4e0223444a05bcc53075a6..cdf668073480ed703c89ffa8628f5c9de6494687 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -147,7 +147,7 @@ impl $name {
             pub(crate) const OFFSET: usize = $offset;
         }
 
-        // TODO: display the raw hex value, then the value of all the fields. This requires
+        // TODO[REGA]: display the raw hex value, then the value of all the fields. This requires
         // matching the fields, which will complexify the syntax considerably...
         impl ::core::fmt::Debug for $name {
             fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 69f29238b25ed949b00def1b748df3ff7567d83c..5cafe0797cd6f9567afb7e1e9af23b961a8a87f6 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -32,7 +32,7 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
 /// `Err(ETIMEDOUT)` is returned if `timeout` has been reached without `cond` evaluating to
 /// `Some`.
 ///
-/// TODO: replace with `read_poll_timeout` once it is available.
+/// TODO[DLAY]: replace with `read_poll_timeout` once it is available.
 /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
 pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
     let start_time = Instant::now();
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index c029c600b9b3081ad1e1dd4112acd4ed914e9d8d..a5889eb149a16beabc0ddbdc87666520114c8aec 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -175,7 +175,7 @@ fn next(&mut self) -> Option<Self::Item> {
 
         // Advance to next image (aligned to 512 bytes)
         self.current_offset += image_size;
-        // TODO: replace with `align_up` once it lands.
+        // TODO[NUMM]: replace with `align_up` once it lands.
         self.current_offset = self.current_offset.next_multiple_of(512);
 
         Some(Ok(full_image))

-- 
2.49.0

