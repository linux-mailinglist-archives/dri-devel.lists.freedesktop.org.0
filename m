Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41368BA815E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 08:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C0F10E21A;
	Mon, 29 Sep 2025 06:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XJZDHG5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010061.outbound.protection.outlook.com
 [52.101.193.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD4F10E21A;
 Mon, 29 Sep 2025 06:17:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTDJiZMs60Vu9lY0dla2NPwDBbNdL19vWYrNDQ6SdeC7Ng0t8yJUIfVpauKQ3HgBPshMkS/x/mOsbp1/Fq2MpQHFbQsT6EdeC0pxfXm9BZbyVyvrYuay/0tW9NhF7YjSom7vo/lChR4iMPG3HsVUUE0RzjGHrs9OusUpjOS/sNoTyW/6JcXGnLHYp7ixlXNSzUgnQdrzymgoX7IgJrsk14oE0W180cJVI+wKX/+7iWGGU0vM7hdorjvx7GSYCmNp0VM7xKlgJZJGPbKNLIZJG++WlqNVn1hz5ocZO9Qi2WFQ+nkaH8M6hNkD+Gk5PWioABZ7Sg6wnRbtlqBkZjVdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYo6yFZ993EhWL0UCEK+mgUCTiO9ewinNVPowpUm6dA=;
 b=G3JXXhajqeBOP/yB5bJ9tn6ImjswyCcFP1/UpzyJBDA19W86KmEE4kK6GmRoz9JN3aDpJRgWByy5i7/HVygo86BneP66SJnAWxMG2NzM8vfP2UNMvB9RmMOlgi5Pi5FJiS1TYpFVU6o64gpnqHCekdtctLg4Y/2Exeh1VqB5JqqxAUxwsRjaqpmyoxcPYBMeD5GGaO58C4x99RXuRIprJ0k56u11ZIARVVvQIUKx+fX36milzziqMnT2aMwxxz/r6IqophwI31ZhCrCRMugVHcnwMT6PBhs3J3j/R/CwaUzmkndAhsVe9Ws0T73tSEk/MOJIVtcWVZeXLSPVYy94GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYo6yFZ993EhWL0UCEK+mgUCTiO9ewinNVPowpUm6dA=;
 b=XJZDHG5LrO40pL70syeWrJS3v55o1cLrFjmR3+9KF+qaJ2iONSrac3BY58QppPgqA0LB4JhP6+osnULNG4FnUcPnvfvqcMW58xBWebB58gT0DodmoEbSShQLBHOBRykIj8eH1IvFEBOl3MBdnb71B3RmAlcuQSQNdo2thX/IEbNnf3PKl3GBMYmNofxEjC15CzhJArnpCwtLLLMtzigYv41Ymm7ry1sos8/FB/3tmJ59Mx0W89RC8fS134q4yJ21wV8sscDfQyd10pM9Iv3EJadJbdz42BUrotICEgDnRyMGCruUA/Wto71QERC3vrmt13jBSBpEUubxd4WgNyFpIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 06:16:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 06:16:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 15:16:55 +0900
Message-Id: <DD52CATR8C30.1SXPZH285XBPN@nvidia.com>
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
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
In-Reply-To: <20250920182232.2095101-2-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4P286CA0085.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: f1bd5aba-4e6d-436c-e8f7-08ddff1fcbe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVYzR0lyYlFzYjBpMkZtcHNGTG9rVm05UkZQREVVVjVRYlk4bzNsQmRYaktO?=
 =?utf-8?B?d2dUZWt5Q0FWYklBYmxuU3ozK2h6bWNubEVwTFdIbjhqK01UWW1FZnZxeHlT?=
 =?utf-8?B?d0luY0NjUklnZXdaTE9MMzVSUmswK0pTWm81UDg5bzBSc0dvbEZiamxVZUlX?=
 =?utf-8?B?VFg2bjlRQk8wMjNpOVNiUnA0cVNaT1YyMVR1R1ZYVTZjQTE5czRqd1hmdStC?=
 =?utf-8?B?RzluNHQwUFFjNzNMUUl4ajBwY3laeUZqa0wvVEl6ekE4Z1dlTHpjUWpKenh0?=
 =?utf-8?B?K1hHQUVabnFkWlFTRFQ5TmxxSXJBMEYvazRNbnNsRFA2ajAyQWZXamF4ZWRa?=
 =?utf-8?B?UWYxaHpOaHVsWlEyb1ZFNlJMc085d05yUGpZMGJBU2lMenFVTWVZUldBYkhi?=
 =?utf-8?B?SEJiYUN6S1ZuaTVwQlVxMzJNeXpUZ2VpcHowWXgyc1ArT3J2S1F2NEdpVHh1?=
 =?utf-8?B?UWRnZUNFZ0Q4cEdTbXhDQjc4NFZXNXhMNUtVeHpRWFlEK2tSa0RZN3F4SUk2?=
 =?utf-8?B?bnlJTzUxMmtSR1Uremc1Zy9mRldCTG1yUDJWbUt4ajlSaDBTMVNHc2lUZTVV?=
 =?utf-8?B?bWxYWS9VVnB2c3VlUEkxeEcrb3cySUJBYW1EMnVpbVJUelNralh1NmZQVHBH?=
 =?utf-8?B?Z0orRUEyREc0VCtiWTRpaFdkVE5pT0x0azQzOU5ORFMvRm4rUWpGL2Y1TWJ6?=
 =?utf-8?B?bUFsU3pzZ2pPV3RCQXZjcThCLzhPOHlmOGFNTjM5akt1cFI0ZVk0Snh4cDlH?=
 =?utf-8?B?ajRIT1dtd01IZTQ3dFpMcHk5MnJYYlJoSzRndlMwektLZXdCUENwQUQ4b2VV?=
 =?utf-8?B?MW9WaWFoNU1Gd3RFbmFxdVYrb3YwYzdZamRCL3hQODY1NVN4Z0VpZThIWDBP?=
 =?utf-8?B?SFUzdndHU2xEek5sODhZeGY0QzNLWnJWa3lnczhnbmZLQWtPRlZrMzQybzZ0?=
 =?utf-8?B?QkVsSGxXRG9IODBlUktvZ2F5WjdrSGdTdzEwWVR1dmxYcVF0SmJVUWxUR1Bl?=
 =?utf-8?B?VlZ4aUhydzd2YW5Mb0ltS0U1OWNSTmpXanRjTXBOVHJuVis2YjB1UVJFd0l3?=
 =?utf-8?B?b1czbGswcTREZElIZUtpamcrZEFvUWoxWUhHSG1PRVVVWnUyUXpkN1RlSHAr?=
 =?utf-8?B?U3k1THdWZlFWaG9ZOVlrWVVxb2ZaM2Y2RUxxQ3FPYTVzdjBzeGNJbUwvbm96?=
 =?utf-8?B?aDB1MGRTR3Zpa1JzQkZmeUpMYVEvMVRhcVQ4VVlnRHRrK2NQZGZjNGlKclVP?=
 =?utf-8?B?T0JTNWt4Y0tuYTRQdkhadFNDeUlpeDRWNlVIY01vTHZCUjNMdXIyMDVGck02?=
 =?utf-8?B?TTdDaGxSeG1QL2sxemgrdm9Sek9vWlZLYTcvVDNucmFKbjdpVzVneUlqd1pV?=
 =?utf-8?B?TVhCYTdVZ2lGTHBadldUcGtEdkZqSHV1Qmw2UkJoVnpLNnB3UkVBOStVWnYy?=
 =?utf-8?B?N050Q3diRnFVYi8vQTJMYlhEYThyZ0VnbUxLZVQrYjZYOWNHY1pwQUJLYWEv?=
 =?utf-8?B?c25Kbm9ZVUJSYmZMVTcvaDhZcGJnN3ZuUGV0aHJJcmMyd0U5d0xoUUMyRzlT?=
 =?utf-8?B?Rm0xeVJBekdLdUtCM1I4NnNzWFc3U25STk95VjAyTytTREVvV0dacGgybUpa?=
 =?utf-8?B?NnQ0cFZKblhGUUNGRjZuM0RheHl2NnBKOVczUW9PaWpwQ0tUZWZLdUhISTRp?=
 =?utf-8?B?NG9mSFh4cklTY2RibVVHUWN0U2tldVQzM1JhYXYwRTZ2eXdZTGNkZU1XeUxZ?=
 =?utf-8?B?YUZnclFicDBBejR4aGw4aTUwMjF1V2p0WUhRbWNXRDh3N0JNOGw2a0lNby9K?=
 =?utf-8?B?aUVPY3VNd2htM0FnaU9QU0t2Q2ZXS1B6UWJrcjZhY3k1NTU3bUdES0xRTGps?=
 =?utf-8?B?dWR1NmxCYXZ0R1c3WktJaTNXZzZvSGdwTGdxSGNYcVF1YmNjbU1teXFJRnd2?=
 =?utf-8?B?dVBOcFhrTUpTVVJ6d3drNHF5TENVcmRPbDEva3N3WUI4cjRSczg0amY3QVpX?=
 =?utf-8?B?d2pZQUdtOG9BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUhZU2Y3L055aFZndk5MdlFtTnNaOENhN0JXSEQwaWhldUFBVVNRK1E5c0Ni?=
 =?utf-8?B?ZTJ3M1RUSE1vRDQ1UGVveWhzc0ZvaDFVN2pBUXo1ZG1GWnlzL1dMcjE4Uno1?=
 =?utf-8?B?eE1Tb2J1K1Q1OTAwSWx5T2srYXd3eGIzajJZMjJNWlBvNC84ZWRpbzE5M094?=
 =?utf-8?B?NFo5d0lVNkcvRDFCNnZiWmpPRGszL29WMVJYN3Y3TVhXRWExT3JlZkhVcUtN?=
 =?utf-8?B?YlQybG1pZE5LUHB5amFEZ1FHc1RVYUduMWt1czJxQTBHN0VBRUphNlFOeG1j?=
 =?utf-8?B?MysweFpUOExlcytaY0NQWS81RzUxdThObUx5OG9nYmovMVlGcmI3NHpPdEhN?=
 =?utf-8?B?UDJ2WnNWaEVsOEZWemJoSkNSempLeEZ3SVdETExwdEkzSExqaEhuZnZveUFD?=
 =?utf-8?B?MmRYKzQ3T3JSTGYyZm95UGUrOHlRUUNsZHZrYlRYOUwvS2tXTGVOaDhEaDJt?=
 =?utf-8?B?THF1UXA4LzhPQWNMb0xWVTVNSEdod1padDZWTjFtR29uWEpuS2hsSVlnaTNy?=
 =?utf-8?B?bUpJOGF6Qmgyd2diVzJ0MThRRXRkUnBiTnkxR1M0dEkrV05BcWUvdGtUNmwz?=
 =?utf-8?B?L29KOGx6TWoyNlpFbHVxMlBmemxHZGhGRCthLzYwUlAvUnZyN1I4dWdSRGZE?=
 =?utf-8?B?TmlKcTl5alRrYnRmRXYrVlorTkNERERhU3E5SnVCQ1FWcWUydURnUlpUUG1k?=
 =?utf-8?B?b24zU29CWEdSdDROYk1PakJibEE1NElJdlJ3YldQdFQyaElYTVRCeEJDcFlZ?=
 =?utf-8?B?enJaUm95bEVBdGszYjNOMFpFK1U3dGxxSlhLR3lHeGpKYjlZMDlIZmRuK2hR?=
 =?utf-8?B?V1ZNSmRET1V3SThoYWNRY3liL081cGh6RGFXVnVkdE4wQWJocmhhOG9UTEF4?=
 =?utf-8?B?TE16SjdIUExBVzRHTWZTMG1YdU9oRXc4Y2d4ZE9WMThsMTI3YVMrMGMyVnRB?=
 =?utf-8?B?ZnZKRDd3RkRPOERpTlhsNFhYNk1XVHJhVXNSSkxzL2p1K0hMay9RZDYyOEhV?=
 =?utf-8?B?RTMzL3pmdUhUMFNVUUVOY3NOOVZHZlJZcUhKaThyUS9ib3ZkV2YxcHhFMGg4?=
 =?utf-8?B?N2wydDFmS1k0WkwxbkxVenpha2srNmdCcGZJVW9IVkV1b1JJbTdDTEp4NkVw?=
 =?utf-8?B?VlVieVVrS1laZFZHam9rVUNhNzBzNnJ4RlNYcHVIYkFVcW1CSlhCUzJMYWh6?=
 =?utf-8?B?REMyd09lNG9JblY1MzZHOXFZaTRIMk5SbW9kSEVDQUdiVldRaEZYL3Zucit6?=
 =?utf-8?B?d3V5QldxTGxNbE8xSlJJVmxicnVvaWdZS1luTjJZdi9oclJ1OUFpNVkza0VD?=
 =?utf-8?B?K1B3NllLajVKQkd6TFU0czg2ZWtwWFpTZ21ULzdXVTJFczg0MEkwalIybFJV?=
 =?utf-8?B?dlpXTEVickt0aFNFSUFhenlSRnV3a1JpbFlWQlFMMzZseW1oSFlGQmtnczVM?=
 =?utf-8?B?d0JzdTNEcnNHa3g5T0xheGtOVU5ScC83QmF1MkhFanB6MzZCT3dRdWN4eWJO?=
 =?utf-8?B?WFFOcG4xYS83ZEE1OG5pazlrcDg5cktUWmJSTHdoMVM0aHdGaXgzbDJtY1NE?=
 =?utf-8?B?VE1OUiszR0tKM0JkcGljSTJNeTN2UzhZMi9rQTNlRnlOQmRxTmx1S3dhRnA1?=
 =?utf-8?B?Q0NZRnNUYktkaVVGOVVmczIyeWZYN0x5dFRIYTJwbjdqYm9JcG5FRis4VXZM?=
 =?utf-8?B?QWt6UEZMSFJaSEJwZTZDM0k1NEdoTnIwQVBrZ3NyTnhnM0M3Z1VtZnRKbWNk?=
 =?utf-8?B?RGZHaC9VdDFjTjhVeHJLU2ZMSXBzSU0rUmIxREd1WlNRSXhZTnR5UGZDT3p0?=
 =?utf-8?B?R294YVZpc3RqSTNYeXRIa3o3YlV4TGl5SE9EL05TdmlCb0gvakRJSWt2dFcy?=
 =?utf-8?B?K1hERyt2WldGcTNneUNMeUdCSnU2cCtCamVydDRWMU83U0VDa0kreFJXbUpp?=
 =?utf-8?B?TGVnUzJHb1hMeUVLazZzVjZYOXNqOXV2SmJ6ZHhmdmpLeDViUTkrR1dQQ2lT?=
 =?utf-8?B?U3V5ZWhVRVIyaVZpN25JUktkaFpNSG1taEs0b09LRFhOY1B2Mys2Y3JqNWNF?=
 =?utf-8?B?ZmdnT284ZFVEUUl5V25CL1VNcWZUby9LRlJUYys0d3haWmZBWThwWmp0UVpT?=
 =?utf-8?B?QmdOTzF2UGtpZ3M4Q3g0UHBHTERGRjZwYmJBRlYwRlpLU0x1VkhBc0pQU1Ix?=
 =?utf-8?Q?dpPnZjqNiqLnyu0m+r3HTT6ptRhwXetvUCqJkTfMCtos?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bd5aba-4e6d-436c-e8f7-08ddff1fcbe0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 06:16:58.9321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4xeRyw62YXhqQsz+hCsq0BKuuNddPnV1ga2kMA7r/W2JierxUONkOp7cTUuoK8PZbknB+EI9Gfhz9o/BE7BVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6434
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

On Sun Sep 21, 2025 at 3:22 AM JST, Joel Fernandes wrote:
> The bitfield-specific into new macro. This will be used to define
> structs with bitfields, similar to C language.
>
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Very clean. One nit remains below, in any case:

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

> ---
>  drivers/gpu/nova-core/bitfield.rs    | 314 +++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs   |   3 +
>  drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
>  3 files changed, 327 insertions(+), 249 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/bitfield.rs
>
> diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bi=
tfield.rs
> new file mode 100644
> index 000000000000..ba6b7caa05d9
> --- /dev/null
> +++ b/drivers/gpu/nova-core/bitfield.rs
> @@ -0,0 +1,314 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Bitfield library for Rust structures
> +//!
> +//! Support for defining bitfields in Rust structures. Also used by the =
[`register!`] macro.
> +//!
> +//! # Syntax
> +//!
> +//! ```rust
> +//! #[derive(Debug, Clone, Copy)]
> +//! enum Mode {
> +//!     Low =3D 0,
> +//!     High =3D 1,
> +//!     Auto =3D 2,
> +//! }
> +//!
> +//! impl TryFrom<u8> for Mode {
> +//!     type Error =3D u8;
> +//!     fn try_from(value: u8) -> Result<Self, Self::Error> {
> +//!         match value {
> +//!             0 =3D> Ok(Mode::Low),
> +//!             1 =3D> Ok(Mode::High),
> +//!             2 =3D> Ok(Mode::Auto),
> +//!             _ =3D> Err(value),
> +//!         }
> +//!     }
> +//! }
> +//!
> +//! impl From<Mode> for u32 {
> +//!     fn from(mode: Mode) -> u32 {
> +//!         mode as u32
> +//!     }
> +//! }

Jesung's `TryFrom` and `Into` derive macros [1] would be greatly useful
here, I hope we can merge them soon.

[1] https://lore.kernel.org/all/cover.1755235180.git.y.j3ms.n@gmail.com/

> +//!
> +//! #[derive(Debug, Clone, Copy)]
> +//! enum State {
> +//!     Inactive =3D 0,
> +//!     Active =3D 1,
> +//! }
> +//!
> +//! impl From<bool> for State {
> +//!     fn from(value: bool) -> Self {
> +//!         if value { State::Active } else { State::Inactive }
> +//!     }
> +//! }
> +//!
> +//! impl From<State> for u32 {
> +//!     fn from(state: State) -> u32 {
> +//!         state as u32
> +//!     }
> +//! }
> +//!
> +//! bitfield! {
> +//!     struct ControlReg {
> +//!         3:0       mode        as u8 ?=3D> Mode;
> +//!         7         state       as bool =3D> State;
> +//!     }
> +//! }
> +//! ```
> +//!
> +//! This generates a struct with:
> +//! - Field accessors: `mode()`, `state()`, etc.
> +//! - Field setters: `set_mode()`, `set_state()`, etc. (supports chainin=
g with builder pattern).
> +//! - Debug and Default implementations
> +//!
> +//! The field setters can be used with the builder pattern, example:
> +//! ControlReg::default().set_mode(mode).set_state(state);

Missing code block for the example?

