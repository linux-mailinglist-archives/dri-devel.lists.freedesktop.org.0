Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B399A2B81F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 02:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FAA10E004;
	Fri,  7 Feb 2025 01:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a22klQwP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC4010E004;
 Fri,  7 Feb 2025 01:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkAs9oVIRsjSaFIBfa7xhgZHMs8sZ6D60edEtXVEg+E3DKk3YwYHT0v+qFYHTm3UgSPh0klMTE1lRWKPCUqW+rGkf6WkxOz6kXtQMLABQjHm0jRa1LFi0qcQe5aDD5wTlJVh+nVfksP7K/kA3h/W7yFDuGG4z7up3oLmXBvOSo0QuQgLvw7MRJuQ3YD6U0LGNI6igZ4Mfi8MiygQDtYg19JVrPilm+3yRfjTa6ebz/IUkeATYpWGRI83M1JcRpjNj6TMNs3ulja69OexJWDYmSo2PG12FfBdiBlEeM1TO3ya/2DVS+REI2tGeUnKm37zB1H2qa6TKBnfWqQjfwAjVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wq02bO8jmC+HI3ONoOuzPLrlHQ0gUCc02uzCqs2+lAs=;
 b=sIO7jeisBXbDKBARwHDvPGTSD1XMb7oSYURGSRBzyW9oHzC3/+OeNLC8Hf0kWEUiqs57ztXpisbW4IcPTaulCKAKGuqvaAQnjfc/uqA7wVqmIsM7sdDhyxiZwzaTnmkV6NCeBkW/VvvWJ0MEwo/Q12UgUWoIpVuFeynkdNeybxTXnlRWq1jiUGRah4Gl4mXn6KhUG5OO3vL1P5YijhFx+lrsKA6TRVxLoXMwloqb3iK7dg5UFEor+WTPao2qTDwkG1jOHisJM8P9QUyWrKOnU5LY58hExSFbytHvoNKJ8p/vcxgdxCWrKbnnZI40kIUsK/+ToKsS7t6mlQ5PoupNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wq02bO8jmC+HI3ONoOuzPLrlHQ0gUCc02uzCqs2+lAs=;
 b=a22klQwPWrPtfYfOzFX9kuHque5McdC996CfNuwafwJnBO53vyx16/Toa1Jcr4f7g3VpP2SUzaplBW0NYrYK/6YfuQRW0DytZzzQh9e1HfCrm4OSnsqNT+UyJglPL7g6+cYmn8oNCRdlCMh8XPFHMOF8THDNgchCU+Rf20JgNZyRlU5hI/pn7XGh5seGUsOAltJep4CEVeWzfomUqxgaVBqRGmcBvegSpNz3icG74V10Xjn1owrJIoREzKjcPAlhhBgCmZlEKdpkd74emiHMMxcfgTQj06HC+js+Po+yOSBHSqCj/yhHH2gY5abVRwGwhcinpcduFsudIODRmENTpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN6PR12MB8514.namprd12.prod.outlook.com (2603:10b6:208:474::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 01:41:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 01:41:48 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 10:41:37 +0900
Message-Id: <D7LTY1FIUOTR.3E6MZ8BD0HW7E@nvidia.com>
Cc: "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "corbet@lwn.net" <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "ajanulgu@redhat.com" <ajanulgu@redhat.com>,
 "lyude@redhat.com" <lyude@redhat.com>, "pstanner@redhat.com"
 <pstanner@redhat.com>, "Zhi Wang" <zhiw@nvidia.com>, "Neo Jia"
 <cjia@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Andy Currid" <ACurrid@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "benno.lossin@proton.me"
 <benno.lossin@proton.me>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] gpu: nova-core: add initial driver stub
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
Thread-Topic: [PATCH v2 1/2] gpu: nova-core: add initial driver stub
Thread-Index: AQHbeKA2ayaXKTc/F0i8CkcmmtmVjrM6W02AgAFD1gA=
References: <20250204190400.2550-1-dakr@kernel.org>
 <D7LF554L2J0N.JRPHDUCHVKP3@nvidia.com> <Z6TL5a5SCZoVq8Zt@cassiopeiae>
In-Reply-To: <Z6TL5a5SCZoVq8Zt@cassiopeiae>
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-imapappendstamp: CH2PR12MB3990.namprd12.prod.outlook.com
 (15.20.8422.008)
Content-ID: <2947EFEEE55F0C4186127BBC1C0D0604@NVIDIA.onmicrosoft.com>
X-ClientProxiedBy: TY2PR0101CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN6PR12MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: b3870b26-8c59-4fc8-2ed3-08dd471895f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qm5LUEhrQnNXL1lTVThoNFN6bVY2Rmg0TWxJeWNSTVRpL1cvTHRQelB2bkF1?=
 =?utf-8?B?SGdYWTlvYkI1K1VXWCt1TG5EQk92UjZkRzJoVVhIUUpzckp1Mmk3YjY4TWZj?=
 =?utf-8?B?UnlXVmpMVWdkemdZV0VEMkxiLzVHWU9QOGhONUp3Z2UvUlZ1VzhwNHhTK2o5?=
 =?utf-8?B?SU4vSkFlYlYyZDJYMHROY1pHUDhWQzV3VDF1UGxiRzF4WEJvK0JNaEt0UUpB?=
 =?utf-8?B?UUJRZ0dFQ0FBRjlsWWl5ZVU4bm8wYkYzOXVobDBpM2VDTkhrSVV3dHdOaXI5?=
 =?utf-8?B?aW5vWTBiMFVJNUE3dDFZK1A4MUNDZzAvclpLNzJud2tCOHFxNWJraFFQQ0Na?=
 =?utf-8?B?UEtrR2s3TlF1aVZBTE5Hd1VWbzdFald1aGhjdXlETElOQnU2TDZKMTExamps?=
 =?utf-8?B?cC9Tb1ZoSzMyK3JuUWNnT1FicWlkRjJMZ0d6clBXcU5pNTN3dHVpeGNLSnRl?=
 =?utf-8?B?eTdGc0tKQmpac1J0aGM3WUhZeDErcG0yZ09CUnBiV0R5U1lLR1ZiYkN1SmZy?=
 =?utf-8?B?bWpvRnFGZzdSTjVkcjVSU2EwSzhpd2NzSEQ4TXg4eGdwd2tZRnlZNXBKdHV6?=
 =?utf-8?B?dERpbU5Tc2xBU29aSlNMK2tPZDVLSDlqZFZubTBEUFJMWEMrR3NZQVVyY3Nv?=
 =?utf-8?B?WUF0aWRnWDlvUjV5eHpEajQ3cGRhT0FBVmVRTk50akppSEFjM29iWlNpZWhx?=
 =?utf-8?B?MVVyNk1TMG9YOTh0Z0xkUEQwcmgyVlBRL296NXdmR0JrVDh5Nkx5ZEsrRGZm?=
 =?utf-8?B?SmZEaHpPTVF5dDFYMXZsRk5RK2JKUXpjMGpTRUd5M3d4MXA1VEEvQ3huTGNB?=
 =?utf-8?B?M2wxa3BvUGQxY29HdFRnWUxwYkZ3b0ZpTzZqemxybFZTOHFBTHFlT2RGeWN3?=
 =?utf-8?B?dmNOMUlZN3lKdThwblZqMUxIMWpDMDF5N0huRGZuM3IralJsR0VpWFJHZTRS?=
 =?utf-8?B?ZzE2QjVXOHRIQXIyZmdkZ1hqUGN3d3paRjNhaSswOEROYktZRzNXSUt3QUo2?=
 =?utf-8?B?Ry9ycnRrS0dWdytqbWViK3g4NWJYN0J4bUVQUEd2U0N1SVU4NFNkNmVsK0hj?=
 =?utf-8?B?OU9pRkdQOUI3Qy9vMHF2SzFwbHgvdEphZ0trU0NEbFMwTUxrRENpR2diRjha?=
 =?utf-8?B?U290NjdNUnBGdGVvZWxUQTEyNWoxdVc4TlNDYXAxOWpiV04waUJjTlJLOTN5?=
 =?utf-8?B?R1pyTHhYMFVpWkc3QjkvaTVMMzg5MGI3bDBMOGtNeTdqL25rTW0wMFFsb1pX?=
 =?utf-8?B?MGp2RmVTdUJzSlUrVmhOcnpkcTk3NzlaWW5nQnN2MmdvdUhsaDZxQUw3UXdN?=
 =?utf-8?B?dlorcDVHSUVZWG0rbWxwT3BLKzRYcXc5dnAxYjdqdnhEY2h5TWNRVXp1S2xx?=
 =?utf-8?B?ZW1TNnNGcTVJRllvdlBMU2RJNVBtVWdGempEcWtkUERzeElFbGs3L1YraHdO?=
 =?utf-8?B?dzJTV0J3c1NGSXhoMVI0aVhTOEN4RFUwNmVybUJ6RTdKVncxaGxKek9DYmh1?=
 =?utf-8?B?eVlRZmpDR0FVTU5GcHNDUUlQbktGZ2lia3R0MmY2akpsUUlleENkeVBsV3V5?=
 =?utf-8?B?VlNUSjNLMEllZjVKWDlGeHduM0UzN2p2R3cvZ0tiRjBWbE5ObzM1bFh4NDMx?=
 =?utf-8?B?b1hjWUdDTXpIbVhuSE1KK3h4WnVSWGs2VWJsVHV0WGIzUjJLaXVUY2l5b0gr?=
 =?utf-8?B?cFpwNHovRnNQU1dqZEFMZG5VTHZzQVpnV0dGRldxUjhvS3A3VEJvUVpNUjVJ?=
 =?utf-8?B?UG84QndaMk9FOWpGMlRaVTd0THV2dlVwWUVXOG5tRVJlSVhLOW9NNnAvejZ2?=
 =?utf-8?B?THJrbFh5b0NIZXg2YklKWXdiUzdIcUVQUzVhUnBHUXMwK0V4NjBQZm9TbnR4?=
 =?utf-8?Q?X0nx5QGcZ7ZnK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3MxcWhBWlEwb3BudVUvSHJTazVPMU4vS2xBNGt4eEw2ZXZxV202djlpR2kw?=
 =?utf-8?B?M0NsWWdpU21yYit6emxySmFSaWY4V2x5c0tNR1drdVRFbWZQZVBiMnFyYTY5?=
 =?utf-8?B?VHNvVFVOTzJTcjc4S1JCaERlVHhWTlZCUnFjOGhDM2Uwb201VjYraittYm5X?=
 =?utf-8?B?UG8rdjRMSEI5S2g4QmEweDR1R2tIL2llY0NWZ1dQVit5YUUrNG9zS1JmY05r?=
 =?utf-8?B?dmwvTzZTeUFJK3A4ZWpWeVozQUJjMWJSek1TdkdQR0NBUkFWMStIOXQ3YWxk?=
 =?utf-8?B?emJQVjNiTjBRZlpHa3dXcXJobHVGVGh4KzhYRjNla2NsdjBRMGdnUUpRaHZQ?=
 =?utf-8?B?SER0TURxVjIxZ1cvaVJTRklFWlpKWFZFVFdoVDJVUE45VURqOXFLNllQdjQ0?=
 =?utf-8?B?dUVvN1hMNWVYOGVyVTJDbUVYa3BudktvVGtBWG4yK1ltN3FjUE5pYVl2d3gv?=
 =?utf-8?B?bDVDTy9aS21Ubkcxc0dRN1IybXFTZFhCUEtYME9aNGNSaTFBcDRxeThNLzRV?=
 =?utf-8?B?Z1hQTlBKb2RFckdvaTZvUWdLMXhhdTJEa0xydWZPTEphZHgzOFpOOUlNWGZ1?=
 =?utf-8?B?V1VBRXJHVXZLc0Y2RTFac0tTTlJDQ2hVck5kOUpZV001TExkbzVkbEFPQjly?=
 =?utf-8?B?NkREeGlzNERjbjBnMjJXZk9obmdUUnNTRjNmY3YwcTRvWUxpNDFKVFBjRXF6?=
 =?utf-8?B?OGlmaVNjUlNnMGhqVi9qY2IyZVlHbHpiTU5NTXJnS0V5S3ZWTEJNMTkzaW1h?=
 =?utf-8?B?WlZNbVFRYkpHR3NtNWwzdVUwL2dWNXJwVE9ZQXZORlVwd0lIaWJxQXlxd3Vo?=
 =?utf-8?B?MllGcCtRV2NKS3p5UE9IYTRoamtzQUZZWng2elQzbHpZOWFGOGpOcVl5S3BZ?=
 =?utf-8?B?clE3dVptK25xU3lvdWNxLzhoOHk1M0l0OVN6NTY3cXljUk9XT3dEUHN5b2Js?=
 =?utf-8?B?Tk9FalllUm42L3FwTE94aTlKMWZ5RlVWYjlJRFFSMFMvVlVFN3ZOYU1EeTYr?=
 =?utf-8?B?Z0tQUktYa1RVdlBxL01VUUJJb3pxR0lzZnFKeDlVMEJpYnE0dHcxL3Y2bGUz?=
 =?utf-8?B?NnpXK1l5eEVHVGtkNndhd095VWdqV2RubGNLdGkrUHBVdUtkYVVmOVd3b3VY?=
 =?utf-8?B?UHptZDNaQkNMZGNoeUpEaTU2enBiNk9vOFM0UTNjSXVBRXE3TTN3alBjU2ta?=
 =?utf-8?B?VzRFUFFnWTJQNjlLQ2dXcUFxSitxNlF1QVBXVVFrNHA1dXVDNG9XaGRUMzlV?=
 =?utf-8?B?c0VwZ1RDWXBJYXZ6NGNLRVM2Vy9LK09hVkNoc3lDcGlzcGtjV2MyK0xBL05G?=
 =?utf-8?B?Ri9nRlBNVkFYQXdVZm9QZ2ZVNTVJMGMweUFNbjg0NlhuOWlVQ1BzMjhoNlJD?=
 =?utf-8?B?SHp3S2lVMHN6QUtuNTM3b010M3h3OXV3bzBLMGMzenkwTzY4eFM0UUxFelN4?=
 =?utf-8?B?Q0NWZlFTUlloaDRPTEpyekF0TUxOa0l4cHQzRWhYa2k5Wk1hY0xsK1ZuZkV2?=
 =?utf-8?B?cWtNU0FrMzJOZ1lyaElYcXc2Nk93bE5xbUFXNUIrYTJJVnlnbm1QQ0FTdnJm?=
 =?utf-8?B?aElsTFJVNzNsUmFlbTAwaWtkbE9LZ3dWUmwva3RTc3FVZ2Ftd0ozbHpnWWJ6?=
 =?utf-8?B?dDJWd1FuRVAySWljTzAxNXR5ZTJWNXNFalhKTWlQMWFrcnhYVlZDc2p0SXUw?=
 =?utf-8?B?dHF4VXVOUmlNMzFKbXNTNmNGNEtiSm5RbGorYzljbHluL01vODhvSmh2NUJK?=
 =?utf-8?B?bnd3dFVtSUdaN1h5cld1cE9JZWpOM2J5dHRkZ3YvdVJmK2VyZ2FzVjc2OHp4?=
 =?utf-8?B?NEFRRUtmR1RRdzExdHluY2hKNmludnN1eWxxL0hEWHgxZmhLR1hpeCt6b1lI?=
 =?utf-8?B?TUtUNFB1UEcyd1ZyNDJVdDhFSmUrY2hWcUgvMXI0bjZPbE5uckhGRFlHOERq?=
 =?utf-8?B?UDlDRk1QeEFQWHA0L3N1K3hXMXlxZUx2R1FlKzJPVDEwZ3kxK3VXc1VlcGV2?=
 =?utf-8?B?NGdIUml6dG5iY0M4TGxCZHZTZDFLSEdmZkRmVHczb1BWYWVNSHplamtkdlVG?=
 =?utf-8?B?cXM5Qis5bkM4UFh3Tm5ueDNqM0hWRGlyNG82dFdEK1hyMDdONm1FYlUrZmNo?=
 =?utf-8?Q?fSjjqZTj0jlRKYUNiZsPdbA5D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3870b26-8c59-4fc8-2ed3-08dd471895f8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 01:41:48.0185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnE1Iwv4x4uViSYrze8s26EwWMrs6+bap7X/ZVnwa4+2/jRO9G8u7kVZ1I3FUbAFnlSNqfdKbhO1oFUcGT+CAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8514
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

Hi Danilo,

On Thu Feb 6, 2025 at 11:49 PM JST, Danilo Krummrich wrote:
>> > +impl Spec {
>> > +    fn new(bar: &Devres<Bar0>) -> Result<Spec> {
>> > +        let bar =3D bar.try_access().ok_or(ENXIO)?;
>> > +        let boot0 =3D regs::Boot0::read(&bar);
>> > +
>> > +        let Some(chipset) =3D Chipset::from_u32(boot0.chipset()) else=
 {
>> > +            return Err(ENODEV);
>> > +        };
>> > +
>> > +        let Some(arch) =3D Architecture::from_u32(boot0.arch()) else =
{
>> > +            return Err(ENODEV);
>> > +        };
>>
>> Technically the Architecture is already known if the Chipset has been
>> built successfully, so there should be no need to build it again (and
>> test for a failure that cannot happen at this point).
>>
>> Since the architecture information is already embedded in Chipset, maybe
>> we can have an arch() method there?
>>
>> Something like:
>>
>>     impl Chipset {
>>         pub(crate) fn arch(self) -> Architecture {
>>             match self as u32 & !0xf {
>>                 0x160 =3D> Architecture::Turing,
>>                 0x170 =3D> Architecture::Ampere,
>>                 0x190 =3D> Architecture::Ada,
>>                 _ =3D> unreachable!(),
>>             }
>>         }
>>     }
>
> I thought about this, which is also why the comment above says: "consider=
 to
> store within Chipset, if arbitrary_enum_discriminant becomes stable".
>
> I did not go with what you suggest because it leaves us with either
> Chipset::arch() returning a Result, which is annoying, or with Chipset::a=
rch()
> being able to panic the kernel, which I'd dislike even more.
>
> There's also a third option, which would be to have some kind of unknown
> architecture, which we could catch later on, but that's just a worse vari=
ation
> of returning a Result.
>
> Another reason was that I did not want to encode register specific masks =
into
> the Chipset type.

Agreed, none of these solutions are completely satisfying. From the
point that we have successfully built a Chipset, we should be able to
get its architecture without any runtime error or failure path. So I
guess this leaves matching all the variants. It's a bit verbose, but
hopefully later we can gather all the static information about chipsets
in a single place, and generate these implementations (including a
Display implementation - ideally the debug one would also print the hex
representation of the chipset to be more useful for troubleshooting)
using macros.

Cheers,
Alex.

