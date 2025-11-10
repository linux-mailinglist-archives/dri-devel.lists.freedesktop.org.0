Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEDCC47062
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D1710E3CF;
	Mon, 10 Nov 2025 13:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iRuGysZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5EF10E3C2;
 Mon, 10 Nov 2025 13:51:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2d2+DmDalAGDsxhwAzMEv0oSRdk2kQSz1FYNH7GwvyoI3eQq65iyQ0cunAsz5jHSEJ3JMFuTRhv/POl7csnbu2385rknq4YQlldqgLUAK9d9XLqucfKq9b8XYENgxalYYDD+ygg3zSWU/yUf61XZYzkGeXxpanSjKvTlg81FvQL4/x4ySzrQC6ywuNM7c/dEHLl+dacYf0v2pNZdY+ThCpXMlz/n24pPgJeXZXXOqlDfwL7bxbq1TTDw92JTrP15f1aIIfYXHW/GoGPaX1RnCv+U55U0iXXhxgS5kSYw5Kf/fFXCQKdfI1iPSxNACNM85D5aaMDzsXMMdzZb0eT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAI7wFDENxYeXTnvLZpJmYtgu6e55Pk+dosDjVZSaOg=;
 b=yeamTCg6LaFCKwfn69Ot4g2d1DlkaSwXTWJStuH2BlFOKfdI0AglwSRSIk6+5nlJziGP8yPg8M/dEt69YLsZMZ14dD0T2BMXBZRw2Gm+x/7G9xib5pvj7H+lpxCMr2AprOqEBFigIWdPBGsjItF2pM/x5znLvFd+ZOlu1polpkCKV1UJh0jbe+2c9LI9GsuGmnkBlJ+ZZBV/zOTMZFco3NnBbynu/0qPClXgKDZkeAJxjfBMRprIL1E+/kEo3D9hv59C2Jppu7sYC6nWNtNMWFUi3SLnx/vuEVyJs4h3XKCsHHP4NcpxTeJp21ToX1Bss2N5JnSU64XcEJ81jFfN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAI7wFDENxYeXTnvLZpJmYtgu6e55Pk+dosDjVZSaOg=;
 b=iRuGysZArIxV4Rjj2vE7ROcnP77Cwy+cANkmX7RW2gD6F5iVWg8egkwtVibDDxrNjpYCashr4YsCUxIBA2hbyXumBKPddVVwaZi1qXW4Da8ssvEe6fXQ8a1wK/PuCEDFqnxQ1wTRX3+1CYFzbm30pgEdeamoVVxZ0IXYCbdo1OJ7VU13fXro26R+rB1ftf4QcwIJLo6GfeCrwg47n9oBSmOl1fnkzze14mrZCDqgkMkiwneDDDWU8HWZp4Vp+GNaynUMT7PThnQ9n3aWUGOmqMTIZoJcHadnKssWB+18Z2F7MgxZPGz3ZOjsPXYDNnJi1kL134BzVWMerrW+PIvM5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYXPR12MB9340.namprd12.prod.outlook.com (2603:10b6:930:e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:51:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:51:10 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Nov 2025 22:51:07 +0900
Message-Id: <DE52AXOTV4GL.3F3OLHNCHY0TO@nvidia.com>
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
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 09/12] nova-core: sequencer: Add delay opcode support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-10-joelagnelf@nvidia.com>
In-Reply-To: <20251102235920.3784592-10-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4P301CA0050.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYXPR12MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 43afd751-5201-4cfe-2e6c-08de2060347d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QW1Pa2k3T1VwUThVYUpMSWVMM2EweG9RMkM0OTJjTytkRVc2WXVUR1E4TjdC?=
 =?utf-8?B?WjR2bE51YW43bzZPTm53ZlYwMExwcGtXRlJBUnV3Y1M3VTF6ajcyK3VwTDdl?=
 =?utf-8?B?Zk5La1NVVDFEeHI4US9VK0syMnNwSFhUSFNQbDFLY2dvYTRYNnBHTWR5L3E3?=
 =?utf-8?B?VC84MlJETk9xRVlCRyt6eHZlRGFJZmdaRWJ0QmV4VDYvNlNVN09sRjN4SHNo?=
 =?utf-8?B?TDFsRTVvTnZzUkF3OXN3QUJNbE4rckZKT1FXV2VFVzNaOE96M3JCUWhzYi8x?=
 =?utf-8?B?M3VtellrYkNYQ09pRmpOTjNONmNOemlHQ3RqS042OFBBQm02R0RVTTJjdkdy?=
 =?utf-8?B?YjQrNHJUazJ1WlY2VXZBUVRYV25mOVhzUWdxS242R1ptRG1qRFYrdWVJRUdT?=
 =?utf-8?B?ajBjNnI4VmhDTnJ0dDlwYnBBQzY2RlZBK3dTZmFuMVNiOWhXLy9LMFI0RHdL?=
 =?utf-8?B?QnRGd25vU0xIZ0FQeld2dzJuM0Y4VWlYelpLZ3ZCRWZmUmt0VGxjZy9jN0wr?=
 =?utf-8?B?cjZJZDN4WUdQYjV6ZUhFQ0dlQklJY1NpZjhUN3VDbTNPakR4NDhxa25XQVR3?=
 =?utf-8?B?cXp5OVJMejlhT3FlejJSK3pLaXAxSFV3bHIvRGFPYVdIRE9Db09nUy9sVjFU?=
 =?utf-8?B?VEJxSnNVcWY4MEYyU1Izak5ZcnpmQ25xQmlkSC96dEJmY1lUcDVmMldwVnEw?=
 =?utf-8?B?N1JSRitERm9IZUcwN0NNWmxtV3ZjbUxMdjdBeXlvYUpaRkUzWUN6aTdRbmFP?=
 =?utf-8?B?QW9pVVFTR2FrQU9ieDBuZ3M5RjNkcUNkdmpCaHQ2STg1c0ZMVjZHeW9vY29Y?=
 =?utf-8?B?dUZaUHdnQ0pCc2c0TGtSSEcwdnlNbHlMZHZrbnhjSUlKTzYwMFFSNFFDOG1N?=
 =?utf-8?B?eXRkbU1FSnc4VG9PZGh6SVFhNTFpR0gwSnluYmd3ZHlWL2o1cXRaK05DZllT?=
 =?utf-8?B?SEN5NjluU0JmbC9QNktOYWF3RERnY1lRVzc1dXNHUFA2RUJxRGxER0dOdWw1?=
 =?utf-8?B?cDFlM1VCSmozK1gya3lIUVlJTGxWcTQ2NDdTd2oxY28wT0JmcDIzcVhWbGkx?=
 =?utf-8?B?Zi9aNWs4VjFpM3I0T1QvdHRBa25hSHJJM0U4WDdycm95a0FrMXVIMk1mWkFU?=
 =?utf-8?B?UmVkandhNzdyUHlNV21CYm9hUnEzT0h2L011cWh1Unh6N1ZUcHVhT2h3R01z?=
 =?utf-8?B?bFpuOHdYVXdtcXJDYWw2QTBpbUJZNkFpcFoxenc2TWpKa2sxNHo4c3ZBYU10?=
 =?utf-8?B?VE1RQ2ljOFU3Tjc5dHBnVXA1Qk4vSzFyYWdTc0xJbk92SkxVQ3UzbHlTU0dl?=
 =?utf-8?B?OEhUT1p6SDBKT2lzTDh3RDJ0STlDZkJYalI4N2UyTUEyL3kwaC9ybWI5d1dk?=
 =?utf-8?B?QU81c2JtS09ld3Nqb0lVMnhzUTJra0phcE92dzN5ZVJUWE1XWjZLWmZBK3VF?=
 =?utf-8?B?dXk0aWI5TFdHR3UzWGJpYVNmanZnUGNTWWYrN0FMYmFzaHRlQ2FmbFpzRWtu?=
 =?utf-8?B?TmhqWU44T1IyN1VyZ2xQbkZzWEtzNHlxU2QwZFJKQjYzTjFSOURSeUN3RGR0?=
 =?utf-8?B?ajFnY1pDbkxjanBzc3RmeFI2Vk1hRENUcXE3YWNUejIxTlZDWXB6bkViM0Zn?=
 =?utf-8?B?UG5MN3MveVAyRkI0Q1QyVWpwT28rd0VBbUQwU25YYWZOLzQ5bFI3bVZlZk00?=
 =?utf-8?B?M2cvU3ZOV3NpT0o5ejRSemdCUUFtOUpBcWxzcjQxZncrM01tOWROVCsrak9B?=
 =?utf-8?B?eUROSVlla255a0JQTVZMR28yTmRNanpjQVF0Y0l1cVhXZWhIdGVXc3VpeHNa?=
 =?utf-8?B?MnF6K3ZCakFUdGM0dGIyWk12RVUvZFphWE5YWEZieTk2ZU5kMG42dXFENmZ1?=
 =?utf-8?B?R0tjSlNCTWhJSTJjK2dkYVVYWkVZN2ZrTVppZWtPdmhYZzZLWVBLYi8xUE5M?=
 =?utf-8?Q?cfvRRt6OnAaQBuash2tE+v+TZlzJ//GK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bitBYzk5dlp1cHlDWG1EL011NWlJZUxpMHVzUnQzbkFIVkRVZTFXdmYwUmpP?=
 =?utf-8?B?aFZkNHdzNHNEUDVweHNYdWtwbmZPNDBEbWtaVlcwdW5FZDg2engyWmF3V3B1?=
 =?utf-8?B?ZGllZHZWTklOUllDT2lpQnJmZUhUUlJ1cTd4SmxBM2tZMUVuR0w2cmRlNVh5?=
 =?utf-8?B?VlZVQ3V6MStjZWJwY1F2MDI1c1pGUmg2NVBZelViemgyRHd1c2xaRlNrcWlQ?=
 =?utf-8?B?bHFnWFRYcmREWlIzUGsyeUJSYUtiVU5JSGtGT2VqM0Q4QnBTQWpEWmJ5dmdQ?=
 =?utf-8?B?eVNWOTllQ2JVT1AxT2FoS2dBTUZsZGV2ZFhGTTdvL3pjc3Brbm0xa3lySlky?=
 =?utf-8?B?cEFyUGNVcElJNHFtVnVDOEc5dVZIbWxCUk9vYk0vbGZtbTRlNHRPVDdpS0ww?=
 =?utf-8?B?eGpLT3E1NytJZk9zYnI4d0xvMnBGeHY1cHlOdm55YURVd0ZpWWhUckZIc2dI?=
 =?utf-8?B?MEtvS1hraVNENzdKZEY0d0JEdE1zcUpIaDMxSHJwUWRnaktWTEszcVZOZjQz?=
 =?utf-8?B?aHFzZllJWXMxd3VISVVXMUZOUkFsMTlLTkdVMFBVTTY1RzBpWFpVMUluZ1hZ?=
 =?utf-8?B?eEtwa09QMkc3dHc5TS9OT0Nyd3dCay9HeEI1endMVEFGbWpqS0l1RStoM2xM?=
 =?utf-8?B?S0ZpaTNtRjczVTk0YkJzcXJldGovNk1xMzc4aEJxOHpIY0EzSHhkSGpESmFL?=
 =?utf-8?B?WGtZSTluRHhjL3QxY0U3YkNtc1BtNkpiVVV0bDhOYUVmamN2Qy83ejZWdlo2?=
 =?utf-8?B?N3Fzb3lVUmhsTkJIUzhEQXdXZ1BjbVpoTnFKSXZaeWZaVSthLyt5QWljVkp2?=
 =?utf-8?B?YkJmTW50cVcvZm9VNGVFazBXQ2xkOXVFMGxFZUxpeDcwbnE2c0xaRTBLK09X?=
 =?utf-8?B?dW5MVGdwTmNtRWdQRElyTWs3anlFbnJybnZ1UlBnY0NadUNvSkZlaHF2WmNw?=
 =?utf-8?B?dnlib0M1ckROL1VBbFdwSE9Nd2hBdW5NUURUY0FIN0svK2NyQnlRRWdPdXFh?=
 =?utf-8?B?WXhtTmpSWk1TOHY4RjN6c2R6VUVTRDJQbm1WQ0dLOGFPQ282b3hvUGhZTitZ?=
 =?utf-8?B?a3RLM2p3cXMxMHZzeG9VMWtiM1ZYL25ROFpCWitrMEhOTzY1d0ZDdUZYMEpY?=
 =?utf-8?B?MzR5YjE5TUhsVTJxNHVLdHh4WHBocEZKaTFXU3R2MWRpTkFTZFlWdFBWdlVU?=
 =?utf-8?B?aStSUFFUU0tqZ1RZaGpnZ255WThJemU2NXRGYjRTQWJUSkpsTUdRNTJ4elZX?=
 =?utf-8?B?Y25FTUc5ZkxHOGEwRUNac0lqRU5OUXRjQnBTa0psMThERldTVnZlQXZySzdz?=
 =?utf-8?B?OUtoNXNHb1ZHYS9IZnRLWjZRd2RRcjF3b0NYK3V6ekczVUhHSENTRjJvOTQ1?=
 =?utf-8?B?dG5ybDMwQXpKTVRwRm5xT2hJSTRQUzFsOVF4eU5lK3lLZ01RS3kwOGFHRkgw?=
 =?utf-8?B?SkdXZ3JBYUhQai8vRUdXbHcrSVAvQm1tSTIxWUZEYVF2aElzbjR6ZkptYURX?=
 =?utf-8?B?SStTNlFENGhzbHJScTI2cEZuVGFMQUVYVlIyRE9LQnphekZyZ2dLNzZnak9Q?=
 =?utf-8?B?ak1TTkp5ZUFEZEM5ZzVqT0VZdXF4S1dLejZZVm1XNFdJbkpXQXY2dDFzWUk2?=
 =?utf-8?B?NEF3ZzhOa2RKU0hTQXlBRTJrcStYWnNOWEZ3eWJWbDhJclZyNDY3c3BLeko4?=
 =?utf-8?B?aXZ6UXhoZUYvWTVuRldpWm5JREFiN1dDV25CUm8vaGlmWS9GVXV5OUhtYkZR?=
 =?utf-8?B?RjhmNm5WWkF2SVllZnMwdW1RSDlwNlFkbmJtVmZ4NTRwUVkzaVVKTXhxTUta?=
 =?utf-8?B?blAyZ01Ra0tML3J0SkV4MThaK1RJYi9aQ2JYNWE5dWZIM2QvWWpURUlwZXV2?=
 =?utf-8?B?QndZTWFyUndYUzZJL2lpNEZCb0NiWFBYYWExa2UvMkJZTzN5WGtEdE53NlB4?=
 =?utf-8?B?dVJoVnd4MTBBWVlhYmw2enJ1SzRZTW96ZHIveTlndXVUMytla0pmTmVqNHdl?=
 =?utf-8?B?cnNwVS8xSUxNSGRYS25vWFhJbkhyL251N3V0Y0g1dzZHUW83MlIySVJwSVF6?=
 =?utf-8?B?anl4MHlJY2c3Z0xNdHE5eGJKL2Q0SGQyaWF5dnFxYTNGNk93N0cvRndaemNI?=
 =?utf-8?B?R3dnS3VKSXl2SCtFREFmM3Q3N0I1MTRseHZDbVdaeWl3VVh1dnNwcXFhMU9W?=
 =?utf-8?Q?VgQxBBVcv5FKy+eYC+Iw19lhZQe1a7vyYaseg/2oogP2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43afd751-5201-4cfe-2e6c-08de2060347d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:51:10.3957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQIRpJ21gA+eaiWIw7JlTLUC0vlEGAkn1q5Tjh5qwvqMBpqHcDO0JwsGp/yfpGTRAKkA40otZoqvKjK6NVd1FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9340
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

On Mon Nov 3, 2025 at 8:59 AM JST, Joel Fernandes wrote:
<snip>
> +        // SAFETY: `usleep_range_state` is safe to call with any paramet=
er.
> +        unsafe {
> +            bindings::usleep_range_state(
> +                self.val as usize,
> +                self.val as usize,
> +                bindings::TASK_UNINTERRUPTIBLE,
> +            )
> +        };

`fsleep` is now available, using it would remove the `unsafe` statement.
