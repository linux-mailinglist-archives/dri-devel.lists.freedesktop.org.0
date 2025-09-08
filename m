Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A76DB4830B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 05:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE0910E443;
	Mon,  8 Sep 2025 03:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uDmbm0hb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1CF10E0B6;
 Mon,  8 Sep 2025 03:53:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNPfk6Z99Sg9ZOwd1BbljtquIhKqTw5HxqMzhQ8+H+XkUCmbffGVZ4RpF0mcyv/rg0OE64WFCsjx7Ydu+reGfIjNe73LV8y2Kjx+ZRjzvbcDUIun4vrAj9oNy1tWTkcsydaiNM7aW5e0XHloRpqP9e+/mmgo1H/F4E4ly0i1gnYZmC984K3JIsSW1TSDMENSqahDIIjIMjLKrLOp3UnjT03cAZVVn5/cT+qWtFiqtLZjfdCxDlTvtHYb9roIZA6x2oA3NODn9JxuZM0h1aW3G8PhZc58cPerlNxSadbgtewZ4f2HUBMNWAw8yw84rZtA7RzpSAvTGhrxG303uhQt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dW5eWUZ9Sw9dUAsagU/kGNSuHNLwLTgtBiXONDxY3w0=;
 b=dblBqAPLjzvB7qSTK0lL5cc5o/UBc6cuHEUTfzu13LU00eDEBr52hLF0BKE6vVpsEr6AlWwpequ0+Hd/pZRW+XyHRyZ49Mtz0ork7VMIBeTdqXdQvcXOGOGodYBBmByMbosftrdhcykel5g0zjQEj5D57rKkxp5gKfGsmBaktTaFzg7HypGDwqBmY9RzxleKZsafxUQJvppFmB9NR3urxSIJBp0/IwX/87jvdb4xOuITo2GhEwd+PAoj4bXDXakc/Ok0ZXNI+oUodLIOTuUYdkG+YN9A1hD3yHoVppdt9hlWIZV+7OlWjcTn1qcEnPxCGxJ/Ssv5prV/i1FaV2bc4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dW5eWUZ9Sw9dUAsagU/kGNSuHNLwLTgtBiXONDxY3w0=;
 b=uDmbm0hb3ouqPNevqdtwdpZ1gYe0+ta2C26vkO8frtmFjABed2BuUjje9ZylIPpxd5vav6tEpYdGzyqtqzVEmbP0TxdTl73uDRFBwLYf5sDjSGxnFv5v17SJEKYYptyZtgvHQUcqvtXAk3/ieC6/vRKcjFj+VYTCtC401oaTMfC1pAm1uNruvixa71dTAEutvgedZyIkVJbw2AJIFCfZRZ+JhE+t1b1+VMSBYBaEBqWADPfXh+BVUHJxJztTJirZ4BKUZM0kZDg5DrX8f4PeMtJ49Z8F/lYkhdyCCXijBfO86Opina6YkyQgQl3ZYbmt6mqbpsvLnxgxJiD3gNEhGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8751.namprd12.prod.outlook.com (2603:10b6:930:ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Mon, 8 Sep
 2025 03:53:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 03:53:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 12:52:57 +0900
Message-Id: <DCN44MKQ8IMO.2PGDTZ0HC1M6O@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] rust: Move register and bitstruct macros out of
 Nova
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-5-joelagnelf@nvidia.com>
In-Reply-To: <20250903215428.1296517-5-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP301CA0065.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: f2531256-1a8e-405c-2f27-08ddee8b3470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWN6Q01uSHpXRWV5TUdrZXZqbzVUekZ3RURzQnN1dXN3WnJBcFowLzNTQ2JB?=
 =?utf-8?B?d1BYalZYWFJKbjN0Tzl2S3NXKzBaNWRWNUpnNUNtWmR3YnFQM3JBY01yVndQ?=
 =?utf-8?B?L01GQ0hEd0FraDY5bk44ek8yRzRaOFVqcFkxTDFBejJOcnFla291NzBsaXEr?=
 =?utf-8?B?aU9SZGZ5WFd2VytwbGJaYnAxQU9zWXc2Q3RoMDJyNHllS2pma20yYnVYdGUw?=
 =?utf-8?B?ZzIraksraERZSWp0WXNNckl0WlprUzdDUWx3ejRoNS9HOWd1MkVhQjVYWEVM?=
 =?utf-8?B?MTdTUmt1djRmRG5tYkRJZ3hONWpKM296MnBiMDlwSWMrOHVRRWw0aUd2UllH?=
 =?utf-8?B?dFQ5cytHelU4dldFcWpxdVlLZU1ycVlPc1k5RnpqK1NuSzh3Z1BIcnJRd1Rk?=
 =?utf-8?B?eFVPQlFkZWdQTmNFYmRsRFV2T2drZ0hpS0pLeThWWG5aazFUNURUOGJyNGVr?=
 =?utf-8?B?Q2pFMTk1d3lGVmlCbjlZUkNuVURNdnZpWmcwOHBZemJyNllCWWY3Umh0VmtD?=
 =?utf-8?B?MEZEU1NFRHkzQTJ3RVlFR2JNY2hsMDJ3QmVKVEkyVWtVM0tCUElJM3daZ1R1?=
 =?utf-8?B?UVROTm5tcytsVVd5V29yTEdWM1NncFFZUzNodUxmWCtyKzFjeUo5bkEwd203?=
 =?utf-8?B?ZHZZeVg4V1pSUzB1aUQzMDdxR1VRUjdUZ0FNTlpBWHFKeEF1RHkweXBBL2dJ?=
 =?utf-8?B?REhqeFM4N3BDSksvWm9VbGQrL0V6dUUrWk1xY293VDZHTElpenptVWxCcUpu?=
 =?utf-8?B?WnNsNHBIRXN6aUJuazdJeXMyWXVTUnJmRkxIU1pEUzgwN3U1NUxvSEt2bDJu?=
 =?utf-8?B?MHBHZW5LbGRpMjRRUEcyNU1iRzlkSlJOR1dsT2lla2psN0hWSjRKdFF6eEZ5?=
 =?utf-8?B?T1VaMmdJZUVGU2dYakJNN1RNdnBMWE9hMlRvWVlzZUJXZlNOUGtLckgwVmNp?=
 =?utf-8?B?aGlkYUo2eE95RXBxQTB0R0lpL3Nlbi9jSEt6YTFLMm1PWVlqbEVaME9nZXZQ?=
 =?utf-8?B?U3NXUmZjcDNiQ2ZTcnJvdW9lS3VBRlJNdHRvWmJPd0JMd3NXU1hhcUZRaCtl?=
 =?utf-8?B?VGF5WUdOdnlLTzMvWUJxYXpEZnNZZFpMbFBYYWRYMk1vOE9SUWdMNjlBM0Rx?=
 =?utf-8?B?aEh3aVZLc0FuMUNkZ3ZlWkpJRGJEZytwMVlmYTVCODlWUHNBNHhrSS9waDN1?=
 =?utf-8?B?ODZDSVVtckVvUWxNY0QzVlBqOVpHNTZ1Z25UbDJHam5kMFdhbkxkWnJUeEJQ?=
 =?utf-8?B?ZUVyMTA5K29FOGMyc0YvV2U3WWZtd0RKOHVNWm9EanU3SEJMcEJ2SmtFZzMx?=
 =?utf-8?B?bFBZTXBtYkEvVmhJRWlLMlVpdElwaUZ4RFFhdHh4dGY2MlorMy83KzRkUzg1?=
 =?utf-8?B?MnB5RlhMZGNUL2J5WlE1VFJOc0xRY2taejdaakk0bkZnQkxJWS95MmJBeFRF?=
 =?utf-8?B?aE1pOVUxek1BUDJaTzlzUzJQUGhlRnZ0T3JlZjNzWVJDeXlIaWNidlhlZVU5?=
 =?utf-8?B?WjBmTUlJdmRwTHN3YTNTQXBaeHZPandwbCt4OGFJYkxFTFUydW5UQ0V1UFBG?=
 =?utf-8?B?S0QxcUdIckZ1blBlTU9LeXlRdityd3ltV0dXamhOMklNMVY2cW1xOW5QT05p?=
 =?utf-8?B?UXp3V0FIb3hBalROM3F6algrc25OOHFnVFdtTEVodktQTnY0RlQrZmhOaEJi?=
 =?utf-8?B?YmZTSDU2MVdIOTN5NS9ZVjZHYVluWTlicUUrTllJWVpzODdhTVYvVXB3QWJh?=
 =?utf-8?B?c3lZamJEc0dmK2JnRVRmc1NLbGE4aWt3c1lCSU15ZE55VWpOZmxJNXBNYnR2?=
 =?utf-8?B?bGl6bCtlbEN3U1d4RXI2RG0rbjV1d2VMSFhESXpRMEhGS0xOVE5leE01Rk9t?=
 =?utf-8?B?ZVc5dmZNNnVpeDQ0NFZjQWV6QS9EMW15STBhM1FsRmVwQWpYMXFCN0hsMjFK?=
 =?utf-8?Q?k/QDTQbr76o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGhpelJmQkIrUEg5YmtjV0dNWnZwclVjQ0RlQnJMODZlRHhRSTE1V0kxUW41?=
 =?utf-8?B?bUhHb0JLeUpIdlFxaFdtT1VjMVhBekVTcmhCVm5tUnlycTh5dnV4WXpKZTVG?=
 =?utf-8?B?eWhIMzZzbUN2NTRNeXpTYnRtdHlaa0tqUjRtRkRQbW5NZFp1cWI5d2ZjZVZS?=
 =?utf-8?B?SjRKL2Q3UVBKUFhReVRsdWZya2lUYXQ3SG1RcWNSMmhlUnUzT0ZhTzNhSVA3?=
 =?utf-8?B?b2kzaGdMS2RrVjl4NytHamhLaWxiRG9VRmFvYnp3MjJrcGw5WFFVNDhzb000?=
 =?utf-8?B?MzRYN0YzUzZkVUd3VDVHZHQ0N3ZOUDYvQ0FZL09PTnoya2FwczdPSHlmL1BW?=
 =?utf-8?B?Y1NPY3YyR2g5TndDQ1l0OTZ1RDhSdkEyZE1BUTIrRDlaeVBSQ1VrUGVkck1m?=
 =?utf-8?B?YnhkUkZVSlVDakZTTkNsQ0Y5OG1FZlJZUlYwT1lFMTF5N29WdUtvL05CZ25n?=
 =?utf-8?B?VCtXcHRWdGtjc1RSZkovdnoyd0E3WUUwOG5lTnFmWVVldGFqeUo4b3dDUFdN?=
 =?utf-8?B?SEhmdUpZckhqMkt0dkZSbHV6ZXhaSEY0RlREQmZHQzd3REQrNkk5bmc2c0dL?=
 =?utf-8?B?WXZieE1IQUZBYXBNYjIyK292VTExK0Vock1Sa2FBNjkzUXBjR29yU3hIdEFK?=
 =?utf-8?B?alh5MzlaRXNDZXY5UU1KenlkK1QvV1J0VVhSRzRGTHhORU9MTjBrNXFvREFo?=
 =?utf-8?B?YzFEYVlMczVqQmtYbzRVZGY1UU1YOG02bjhpNGRGOGZrZXk1SEFHeFVQbUJz?=
 =?utf-8?B?OUU5WWtNalhGRUFVVG9SMUg3WVhYN09UVXZVQ0k1TUhmNmZsaHVNTXV5WE5X?=
 =?utf-8?B?c1Z0ZVBtUHRoWnIvblJXQXAzZ1NqTytJRk03bk5uSzVwSFloYW5taVV4ZVl1?=
 =?utf-8?B?WFdyWlBnbHFid2FtcDZqZ01WNi95MXljdm1xR1o4bWpTQXMwRGlsZW4wWjdU?=
 =?utf-8?B?dG5aRlpiR3dzb1FnUFpJSXZNdDdsM2pOaUZhcE1YeThrUzBiaFZYR1FxTTJv?=
 =?utf-8?B?dWE2aUZ1K1NxSTJTOHYwQnl1RFZ3cEhPYWxkL1Q1ZjZZbVpYMElvajZlTXNG?=
 =?utf-8?B?Uks1REpYYmw2aTdOVThsL3haSTJJQktYdFVPVzIvbXVsY3hCMERvRUg4Tlo4?=
 =?utf-8?B?Y0tOa3kzMkQ4c0lWenZlZlVLZTQ4SnZYY1l1L1pWZ3lsbXhHNnRUWlVWQWZz?=
 =?utf-8?B?YTU3KzQwdkxFdjl4eklINUlscGNsaVRUSk4xNDlndWRsbnVRZVp2Q3hXYnFO?=
 =?utf-8?B?MmdTeWVNZUoxZzY0N2dsajlGMFZ5d3JOa3p3eC9yR1JuOUFCYmt5VVpoRkFn?=
 =?utf-8?B?QXo1TFM5MVpZdnNhZ3ZiUjA2WFh5NlZrS2RlVG5NZm01cXQ1ckVLb2JlajBN?=
 =?utf-8?B?U0N5OTl6RHIxdG5zZDhRSTFlM2NPWkNhYzF6Tm1BNTNoaVlaWks1QTlTd1M5?=
 =?utf-8?B?L2FRSzR6aUppbC9iakFuRW5Za0h4SndVVVc0V1dYSVhqRmRmN0pRUitEZkc3?=
 =?utf-8?B?KzNPRjFqZ2tTTDBhZXNCS05tMWpyRG9SZ3EyMzQ2YjE2Nk5tWGZyQUV1SnNE?=
 =?utf-8?B?SHlNM0tLeXYzQkNIZS9vUEZ4STAyWTNUcy8rZXVaVlRES3FORWpVZjJIMEpY?=
 =?utf-8?B?NWpYN3lod2hiUmt6Q2czSEhMc0tnK1o2UmZ1OWpjbUpaSmNzbU1iQVlNZ3pZ?=
 =?utf-8?B?M1IrYkhQM0F4TFBPNjdiQWNrb2dDdkFoRWdVNjRzZmNpWEJyQ3dmQm1ibUMv?=
 =?utf-8?B?SzhLN2IxdmpMSS9wN0wwRUdXMEJiZ3JQU0UyK29FcXhsKzJKVVllTTBnc1M2?=
 =?utf-8?B?QXp6K01vY3hnRmttTmtoWmN0QVYvSzlpUE80ZHFscTBrZWV3ZTdDZXMyTmRU?=
 =?utf-8?B?VGdJSTJFU0tDMW9Ld1dSTzRNbFJzRGlETzI1QllpU0ZNZ2hoNGJKMlZjWkoz?=
 =?utf-8?B?ZHM0ajh6eGxKcU1udFRzYzZ1UlpzeW1IVjU3OUN3aWowL1NsQ04rSTZqT3Bx?=
 =?utf-8?B?dVRad0xBV3Y4b2VwNFFBY3k1V3haY0t4QlVjYVp2amtxaHYzVXlGU0o3cVdv?=
 =?utf-8?B?aEduVzFHdkdscE0xYjZ6Ukk3aU9YWnJDbnZvZWlkUHNtbGN4dFFyRG9yL0Qr?=
 =?utf-8?B?UXJsZTgwa1RVaHBTdFRzSWpjTDJndG54dUxwd2ZMM3kwUE12cEEweC9KZmZ4?=
 =?utf-8?Q?0YQv5u8B5L+yRiMkRAtJ7hxeGkXc4NembAbIJBqrIIPT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2531256-1a8e-405c-2f27-08ddee8b3470
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 03:53:00.5486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ol40hPBBQbMWSmEzfx3nXAwS4dAD/3gVnNAgAnIT9+g+FHFbo64MKmQvUTBN7R+VUqC+FXNq5W/iG4AAy1B8dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8751
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

On Thu Sep 4, 2025 at 6:54 AM JST, Joel Fernandes wrote:
> Out of broad need for these macros in Rust, move them out. Several folks
> have shown interest (Nova, Tyr GPU drivers).
>
> bitstruct - defines bitfields in Rust structs similar to C.
> register - support for defining hardware registers and accessors.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
<snip>

> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index c859a8984bae..9c492fa10967 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -64,6 +64,7 @@
>  #[cfg(CONFIG_AUXILIARY_BUS)]
>  pub mod auxiliary;
>  pub mod bits;
> +pub mod bitstruct;
>  #[cfg(CONFIG_BLOCK)]
>  pub mod block;
>  pub mod bug;
> @@ -112,6 +113,7 @@
>  pub mod prelude;
>  pub mod print;
>  pub mod rbtree;
> +pub mod register;

I remember a discussion with Danilo where he mentioned the register
macro should end up being in `kernel::io::register`.

Also wondering whether `bitstruct` should not be in the
appropriately-named `bits` module standing right above it. :)
