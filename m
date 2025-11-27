Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41745C8CC45
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 04:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C08310E043;
	Thu, 27 Nov 2025 03:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RayiMk79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EA410E01F;
 Thu, 27 Nov 2025 03:44:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wm8nQft/Qg1C4erQjpmHnuqRa3dUQobkDueudhqCM75QQohvNW/kVFQNO4IYf/pE84kNg5+vK5MDG2dw3F39OnR9tuvcLa8yM28EwfZPnSNX5srv0XN5kiXTV23/wmVMgUfpZJx6gmGQbRNyJ2Yhdd9rFEbPE9L55+vS/JdD9cpmwYDjpqabvPP54goM2/bE2z7vZFoVCSWkJgtri+HVYx0qmarQHtk7u4tkyCF1Dizlvn7O1B5Hga942pomiov7CQO714jzqGiqfJ3GLU6GFuCpd+TRh7KBH3bY81vwyZ3GjS6oYy3Enkt8f3Vk0KClFJroos1HjfWWQCafRU8RkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aiz5IqNgZrpDRE8eVc5iDDlXLaVdEIyAlZuXfQxGplc=;
 b=rToOLC42fH/0Xv48oc6WgU6GuIz3mcPXHyfYzTFm3efRMxvtpgg6eK3mKyhS/W8tu+ayE2fB1Ar7LSmIz1HbPvzP7HmRf566fQbeMXu5qexlsBDilYc/w5IQp0F6GMZqhCIxBYS1navZiu37On0mCAlYjiAXJWQFjs8Vo+fXtsFRTIp+WObcZ849FxI44yDNdd3Dy8zb3M4oqSFw4wCoRShlw0/psm53mEwgwxvpBzK/Lo5oNjuz982P6aObMGmePa4U2TK8B+vd49KXI+jO3j1b2FriZgFgsX5bwsanLCv8Q4nwE+hw8sF1MJgqXgm7Y6mBIUNUcC5uerkhJ4LBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aiz5IqNgZrpDRE8eVc5iDDlXLaVdEIyAlZuXfQxGplc=;
 b=RayiMk79PfoQhwr4skzqGevC62lGz/8slmNSGLy7gveYKSQEU5qh9ElwdYOj/+CsdRJvpj5nHqG9uIuSYweaklqordTkaAzlLk3UTYBNfcMznErlWK6gDBdYiGPoTJ3zdYn99bEv2POUN04dqvEZPh6iiHPZhXr5e6LyAIrASdct3O+b42VLUxd+4VKjkZVs44vptyB2zoKvSDQsP8ezGb15E7EAFABguHfOtGljZssFjN7ErIROqXKxmnG1rkSYvpRN2tZRk/h00UY/NrihyDXN1vP7RQdhI3pGyKMFtEDy49OSHEH1snfwz7RsGxknJoGccRj+79ywmtw6Pr9dIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 03:43:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 03:43:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Nov 2025 12:43:54 +0900
Message-Id: <DEJ61A0GHW1Z.3TXMGSHOQ6Y0X@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "Alistair Popple" <apopple@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>, "Andrea
 Righi" <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/3] rust: clist: Add typed iteration with
 FromListHead trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <20251111171315.2196103-3-joelagnelf@nvidia.com>
 <DEGQCMSX1SGZ.2NQDPG5KUNA9D@nvidia.com>
 <04b9f849-94fc-4bfd-94d7-7337a8cffdf3@nvidia.com>
 <DEI7ZVKG4JLA.FH1MEMUQLNUK@nvidia.com>
 <352A2D64-C98F-4457-908F-4BB7AF12D858@nvidia.com>
In-Reply-To: <352A2D64-C98F-4457-908F-4BB7AF12D858@nvidia.com>
X-ClientProxiedBy: TYCP301CA0013.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: c6aa3acd-d76c-4782-7ede-08de2d6731da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjdVTzdOZXpLcUNCeEhOeVVDQy93RFRBQTVoZ3hLdERidnd2RTIvV0xiNzlU?=
 =?utf-8?B?RFU3V1ZuSTM3cTh3Vy9kaytOODB1TkV6YURaZFZKQ0ovMzlsLzMraElrNWFu?=
 =?utf-8?B?Z2hEcFlJeDA1aFlERVpMU3JNZzlnMklWMXUzdDN5QzBFWWdtaW5JRUhGNS9W?=
 =?utf-8?B?d1Bwb1BhL3B0OGtlVnJhdnI0Q2t5aGxXV0R6RUV3aENLNGc4am9tcGFkUk4r?=
 =?utf-8?B?emlMMjBIWEdZRldRNW93L092UEduODhTTHVwdERncityemM3bjlPMTJhOFo3?=
 =?utf-8?B?N2JFeFRSMEx0QTBQaTBjRmtaQlh5MjhUWHUzaWhrQWpMSG1UQ0Y1TVd3TXpn?=
 =?utf-8?B?QjM4K0FNZTF2TlhSb2dXbDZPbnhZY2hEdkFRL2JZTXlNNHp5Ny9iMEwzblp6?=
 =?utf-8?B?dzNrdmsvK2NMTFJYSHFLRzUxK0FYQXNVL3FQZ2ZPZG1NSXNYbFZwakZMa2VV?=
 =?utf-8?B?d3h3TS9zY01lS2lXWkxoMWorNEkzL3FKdTQ1MFZ6VHdUMHBtTGkyYjY3K2Z5?=
 =?utf-8?B?eTFHTTVyU1RzNGhqMXRudUFyWlJBSm1kc2o3V3hWRUFvdnBhb3Z4cnk2Y0Qw?=
 =?utf-8?B?M0p2OWxNdDR4dXEwQXd0RFY1bDJMT2RZd3ZuMHIxbldocW9TdWlGM2FQeHlF?=
 =?utf-8?B?TWJ3TDdMcndWRXJ1d0xZSEY1b3VpQ2wrMXBRa1E5SDZjZUh1WVhpN2syMHJD?=
 =?utf-8?B?ejVIMmtMTDd6R0MvZDNpeVNFR2p0a21Ma1F3TDg3L3RrK0hlKzgyWXFqUWp0?=
 =?utf-8?B?ckxsMlJBZEQyZVhXNUxmSU1BdURkM1VVYkVZMWpYSDRFYWZ0dHZkVGVPNmFx?=
 =?utf-8?B?NXA3Nm44YjhOVmxJd0lVS2MvbFpYTGJORFlCT0lScFBrYU1USHdDMEVZSUZ1?=
 =?utf-8?B?V1R0aTRKdmtwRnV4NEJhdm9ZWVpWU0NKU3BYYXQrVnN0TjI3TS90ZUFYaUk4?=
 =?utf-8?B?QjBSd2U4YmhJZzBvUFZpYllQTG1HSVpUL1RMRDVHYTdYS2NzUURtSDFQZnQw?=
 =?utf-8?B?ak1aSjFmQnAxRlFQcnd2Tk1BVHhXU2xJeVgwRTRFdGd0L0dBN2l1TjdGcFIx?=
 =?utf-8?B?ZDFBMkxWUU9uMGpjNVpqZGIray9xY2hKWDFJRWs0TGlEMzhWUUMreUVSMG1N?=
 =?utf-8?B?N2RWKy9jRW1KUHVZQlhZOWYvRU9ZWkdLOVhwT3kzbmN0RnhBT0JYaDBaRWF4?=
 =?utf-8?B?ZVltTFoyYmk3bDZ6MnpsZXVWWEFaOEpoeDIyanBuOVRjaUptSWNUMmpHKzJk?=
 =?utf-8?B?Uno3QzlmOXlmMTQwbTBwbnFadldXLzZ1U1lERnlTNzQ5clFmRVh1Yk9OQTlF?=
 =?utf-8?B?S0N4NGRBYTZJZFNlVXJ5Zk1STHZrYmt4NnBrRWlUZlJ1YkhxK2pHUWNSUDVB?=
 =?utf-8?B?dEVFVExROHoyZG11QXVpZXJPNWlWbXhUS2F0c0YzVFJoUkFSL1ZNUXRlT1RK?=
 =?utf-8?B?V1hVTlR0c1ZWK1RWRjB6UnkrVWh2Vi8vRXVMU1VaS2hGNWdtTFpVL1czSzc3?=
 =?utf-8?B?Rit6YXJLam13YXUrYWlkNnhZc2pFS0xBRHorUkExcEFmTjhPdFN5OGFYRVo2?=
 =?utf-8?B?RDZyc3F1WkVwTXRxVzFTbW1HaEhRLzdlVFozaWFCVnhjVXJhdGFkdmd1QVBX?=
 =?utf-8?B?U0w3VU1KaDJaSytqSSszbmlKQmNoSlZ1SlVQSWUzOVgwUi8vc2R4dndVaU9t?=
 =?utf-8?B?cnlCK2R1L1JGR2QyZlV5ZHBWUUxaU0k5bW5ENm1ySVZmNUlGbFAzdGRpS1lE?=
 =?utf-8?B?TmVNQk1TZ0ZQSzFWN0FuVVVKdmI0T1lrSmRTK0h4YXl0ck1BbmVZaTlYNEwx?=
 =?utf-8?B?dEZhVm5pUlVLVHVrbTcvMnFJeW0vTW1nTVVBUUNuWVRYaFM0QmNxZFY0VkJZ?=
 =?utf-8?B?YWFKUVBlZXI3QnIrMTVVVVN5YnpCNmROSVF4RXI5NVZVd2plMDdkNTdUUkF3?=
 =?utf-8?Q?W2rpa2MCuOys0lDJ/K23vSbfSPs1SAh0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzFnMHBmRFVabXZtNkxJYzhLb1U4UkNTUzA2Q1NzZ3J2NUhNODVNSmJJWEhD?=
 =?utf-8?B?eWZQRkZYUDdpUTlSWWUzNEgyYzJJQXZOWjFESGlzTFVPbExQVGdkTEMxakVa?=
 =?utf-8?B?ME5tZTFNR3JkZjVpbDJOUi8xZmlSQzhUUklEeElkbTBuaDE4ak41UTZ2MWlh?=
 =?utf-8?B?djNuNnRMYjZ5dThCeEdCVytHRlQwQlRuQmJXSVRkSzVwa2J1TzJLcmJMQkhr?=
 =?utf-8?B?ZGJqN1pWWGx0OFB5QlFZRjVLTEVDRjAwZXlNT214a2VvbFdzR0l5Zk1JdUQ1?=
 =?utf-8?B?T2U2WTFMS21lL0ZZRDI0QXcwQ1h2QTY0RE5yUXRtby9sK0c1L0dGQ3lPdlRi?=
 =?utf-8?B?aVFCQnBOZ1pKaFV4SC9XQTI5VTBHdUR2NHp3RURjTzBQYzNlZXZaY2NRakVT?=
 =?utf-8?B?NjdHWHI3alRYODg3SE56Mm9vamlHTHptditTeDFnT1hpRXhXcW5EWWVSY09r?=
 =?utf-8?B?YmE5Ky94MzJtUWZnc053TGl4UUQ2cjJ0czNzMGUyTVlkdU1rV1VPbFJxS2tG?=
 =?utf-8?B?Uy9HNzBJc2ZiUUtUL2dJMUs0OE5FVjNNL2lDU1VhOHhGMDFhWWxKQ0dGaFFj?=
 =?utf-8?B?cUg2a0NPZ1U4N0JaUFBMb1BEemhmMmlYMlhEY3pKVTBMc3EraklIc0VoZWpZ?=
 =?utf-8?B?MWdGeFBnMERiTWZqUUR1YVpGNXROU09oOGtYRGcyaEdkS1NZMElCVXR2VmRN?=
 =?utf-8?B?MFUrVHNrc1JUZjBjcVhaZFU1RFJjZ01oWGdjMlp4OGVla0NadW4yYkRudjBv?=
 =?utf-8?B?NDJ2WCtXR0U3cDNzRTc5SHZ3dnFuTkIvRElhNy9KdStlc3NyYkRSblMxN0E3?=
 =?utf-8?B?azNrckFCemF4K0wyb1lsOHFOdEdCdy9iSWh3R1B1YncvbXprT2ZlZitXUXRI?=
 =?utf-8?B?MU53K3UrS0h0MVVldjR2TEd3eVYwbk12V2EvNnFsTVhMTXM0RFVSNzF2ZWNp?=
 =?utf-8?B?ejhqcURvRkVBVUZYUHVoWkFSWFBxSHVEYVUzbUh6L3RCNHRHaGtGaWJvaGt0?=
 =?utf-8?B?WjRQRVBMVCtHNnZvRW8rd0pqQ09iK3ZoaXdReFhUS2I2M1J3MXRhN1FnZXFM?=
 =?utf-8?B?aHp1R25hWmlsZndIR3ZyajE3dmQwcHVuRzdkaW81WHdrVkdqZXRMalRnaG9h?=
 =?utf-8?B?bTV0dWVPOU5iR3FoT0Erd0FTYnRvVFR3dmxKZXRiVHkzaXNUNi9EVXV5YzR6?=
 =?utf-8?B?cVV3VWhpbHpncUhGd1Fza0JIZ0lSanFuY010UStTYnNZMmoxVnc4eE0vTlBO?=
 =?utf-8?B?YUZ6dUJmS1hEZEFic1Rwc0Y0YXYwcTBHMEFlNmp0T01Fcks3bnFuN2pYZENO?=
 =?utf-8?B?K2szaGdCNTlRdTRDbUpsc29KUjdneGd2TXRWRUtPMzQ2d3FqdGNKQ0UwOUha?=
 =?utf-8?B?YlJkdklJUVhHQW9ZTUZYVE1qcFQydkpKb2RSZmxtZnVRNlNDTVlFeElrQisv?=
 =?utf-8?B?TmpVSXVYd2lKZjZPWWZGRCtpcTRPMGNjOG9xQ08rRDgxdk5PM1RtSFgyYzQ0?=
 =?utf-8?B?eHRTT3RhSmdmczE5akliaGFDalpvVWtXTGY1cVRJZVJTc0pocUxVamR0Yy9O?=
 =?utf-8?B?SlNtT2pENGlLM2x6VFJ6MVkxMXpZWXJuSm95QSsyZC9XZ1JYeU5hV2dPdm9n?=
 =?utf-8?B?RjFBVU9WTE51dkhVek53RzJQdFFWMHFHeHlkSTQrdGEySys0ei9QMXRUVUtj?=
 =?utf-8?B?b3hMc0g2aUgxemY2c1o1NnN2RnFEZXR5cHBLQUwvMElqcVRYU2FQT3BjQjdh?=
 =?utf-8?B?Rys0aGsyVFltaVF4WU5kY0JRWmtxZjExVENPMXdQSEx6SG1rSnZ2cUtUc0ZE?=
 =?utf-8?B?aDlpSjRDRUlSVHVIWkQ5SXZacEpJY3ZvdFhxdkcxeGFzbjczSW9YTFRmanRM?=
 =?utf-8?B?bnpjd1B1eXlMU05kdW9zcVZjZlV0cC9XT0ROdHdaRitvWHVPdHUxZU5KRDgv?=
 =?utf-8?B?bEIxS0U1aVNMbFFnNHZzbHh5dEFqbVVzZ25PN05FbVhMblF5SmE5enNWeCs3?=
 =?utf-8?B?ODJaVjRMUmlJelJqVjdZdGdEZWdKSWwyZGlsS3EyVTVvN0RIRTNjL0p3WEJQ?=
 =?utf-8?B?Z1JLenlURlJ4ZXl0WTZ0ejNmQUxWRXoyWEN4cmRZS1NBaUdxOXFxU1pOQkRi?=
 =?utf-8?B?bGRyYWZpQVNCTklsUFZjKzhqNGFqd082VDA0UnkvK0g3NUMxTVBpQzEzdkNU?=
 =?utf-8?Q?MIB9i13bTny8+x7b3PVqEZ8tjdZHLQYKfxFjRhDfsh6W?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6aa3acd-d76c-4782-7ede-08de2d6731da
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 03:43:57.6177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: milD5ozRkFMwhitRYKbkac9TclChwZYI5Vpb1W91nD1gXXE71LyroK12v2fgeLol0Y6ss1wAh5NCuzb6FcpnPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013
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

On Thu Nov 27, 2025 at 5:14 AM JST, Joel Fernandes wrote:
>
>
>> On Nov 25, 2025, at 8:03=E2=80=AFPM, Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>>=20
>> =EF=BB=BFOn Wed Nov 26, 2025 at 8:29 AM JST, Joel Fernandes wrote:
>>> Hi Alex,
>>>=20
>>> On 11/24/2025 2:01 AM, Alexandre Courbot wrote:
>>>>> ///
>>>>> /// # Invariants
>>>>> ///
>>>>> @@ -69,6 +156,15 @@ pub fn iter_heads(&self) -> ClistHeadIter<'_> {
>>>>>             head: &self.0,
>>>>>         }
>>>>>     }
>>>>> +
>>>>> +    /// Create a high-level iterator over typed items.
>>>>> +    #[inline]
>>>>> +    pub fn iter<L: ClistLink>(&self) -> ClistIter<'_, L> {
>>>>> +        ClistIter {
>>>>> +            head_iter: self.iter_heads(),
>>>>> +            _phantom: PhantomData,
>>>>> +        }
>>>>> +    }
>>>> This looks very dangerous, as it gives any caller the freedom to speci=
fy
>>>> the type they want to upcast the `Clist` to, without using unsafe code=
.
>>>> One could easily invoke this with the wrong type and get no build erro=
r
>>>> or warning whatsoever.
>>>>=20
>>>> A safer version would have the `Clist` generic over the kind of
>>>> conversion that needs to be performed, using e.g. a closure:
>>>>=20
>>>>  pub struct Clist<'a, T, C: Fn(*mut bindings::list_head) -> *mut T> {
>>>>      head: &'a ClistHead,
>>>>      conv: C,
>>>>  }
>>>>=20
>>>> `from_raw` would also take the closure as argument, which forces the
>>>> creator of the list to both specify what that list is for, and use an
>>>> `unsafe` statement for unsafe code. Here is a dummy example:
>>>>=20
>>>>    let head: bindings::list_head =3D ...;
>>>>=20
>>>>    // SAFETY: list_head always corresponds to the `list` member of
>>>>    // `type_embedding_list_head`.
>>>>    let conv =3D |head: *mut bindings::list_head| unsafe {
>>>>        crate::container_of!(head, type_embedding_list_head, list)
>>>>    };
>>>>=20
>>>>    // SAFETY: ...
>>>>    unsafe { Clist::from_raw(head, conv) }
>>>>=20
>>>> Then `conv` would be passed down to the `ClistIter` so it can return
>>>> references to the correct type.
>>>>=20
>>>> By doing so you can remove the `ClinkList` and `FromListHead` traits,
>>>> the `impl_from_list_head` and `clist_iterate` macros, as well as the
>>>> hidden ad-hoc types these create. And importantly, all unsafe code mus=
t
>>>> be explicitly specified in an `unsafe` block, nothing is hidden by
>>>> macros.
>>>>=20
>>>> This approach works better imho because each `list_head` is unique in
>>>> how it has to be iterated: there is no benefit in implementing things
>>>> using types and traits that will only ever be used in a single place
>>>> anyway. And if there was, we could always create a newtype for that.
>>>=20
>>> I agree with your safety concerns, indeed it is possible without any sa=
fety
>>> comments to build iterators yielding objects of random type. I think th=
e conv
>>> function is a good idea and with the addition of unsafe blocks within t=
he conv.
>>>=20
>>> One thing I am concerned is with the user interface. I would like to ke=
ep the
>>> user interface as simple as possible. I am hoping that with implementin=
g your
>>> idea here on this with the closure, we can still keep it simple, perhap=
s getting
>>> the assistance of macros. I will give it a try.
>>=20
>> We should be able to build more convenient interfaces on top of this
>> closure-based design (hopefully without the help of macros).
>>=20
>> But first, one needs to recognize that this Clist interface is not your
>> regular, easy-to-use Rust interface - it is designed for specific cases
>> where we need to interact with C code and do unsafe things anyway.
>>=20
>> Still, the most common (maybe even the only?) conversion pattern will be
>> "substract an offset from the address of this list_head and cast to this
>> type". Instead of expressing this through a closure using
>> `container_of`, maybe we can have a dedicated constructor for these
>> cases:
>>=20
>>  pub unsafe from_raw_and_offset<const LIST_OFFSET: usize>(ptr: *mut bind=
ings::list_head) ->  Clist<'a, T, ...>
>>=20
>> `LIST_OFFSET` could be specified by callers using the `offset_of` macro.
>> This method would then call the more generic `from_raw` constructor,
>> passing the right closure. And with that you have a more convenient
>> interface. :)
>
> Great! This makes it easy to use. I will do it this way then - I am assum=
ing everyone is ok baking in this kind of usecase assumed (subtraction of o=
ffset). If anyone is not, please raise your concern.=20
>
>>=20
>>>=20
>>>> Also as I suspected in v1 `Clist` appears to do very little apart from
>>>> providing an iterator, so I'm more convinced that the front type for
>>>> this should be `ClistHead`.
>>>=20
>>> This part I don't agree with. I prefer to keep it as `Clist` which wrap=
s a
>>> sentinel list head. A random `ClistHead` is not necessarily a sentinel.
>>=20
>> I expressed myself poorly - what I meant of that `ClistHead` should be
>> the only type you need for the low-level iteration (which should not be
>> public).
>
> For low level iteration it is already via that type. There are 2 iterator=
s. The higher level uses the lower level one. I could make it even simpler =
and collapse bother iterators into one - that yields the final type T.=20

I think the current 2 iterators design is elegant: the lower-level one
taking care of going through the list, and the higher-level one building
on top of that and adding upcasting. Maybe the lower-level one can be
made private, but I'd keep it in any case.

