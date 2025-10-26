Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D32CC0AAC0
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 15:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A01510E2DE;
	Sun, 26 Oct 2025 14:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="co/P/pGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012026.outbound.protection.outlook.com [52.101.43.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D911C10E2D9;
 Sun, 26 Oct 2025 14:40:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNURrNdHRgsRCogfCetshBGSToDZaoL1/mB0MvT3CPmOa63ICCcK4moQ90lsJYZUTuwa59WhP+PVMXq8cyj87DCznlAD4qV0LSojRg+nx4V3EuhNAkajRa9PVaV/GgiUM1T4JCQ7OBLiUlw/GtZ8UrvkmFJ0H0UubQmycHYel2ODocxqfNEv/CWTraN4e+6nWGKLv5yJSH3Xn7DuoxmYap4SESKOJTIOYv7WQsUdHqNFNXAeW7MZN4EgyEhTdMEYoirisKK+JAvpCoYp/KZieSqH4NLF4pwil7pcnzotSL/uJCvrsVCT4YAuZVkdxTtgHQproFKS2N1j73H7xurgXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1khKbouI16UTktIIKzNZf7MuZDwrsQb2QDv8M6cc/g=;
 b=Ic1HBljQ90W0gqR51cjFiIJGhcFOi5RyegHhZS7a0oXel0JH4exAESk4Xt45211KnbdokwH1k96JKajvhNA9PIzaFmD8FspNBIBJworM1slOjnYn52/+U/Hko6poSIXUDW5p1MI8wKT+ImApeCez0dhMdqWudmtBWQxmO4wWayEc0hO9pCZgNbyG3U+9XRZLbn0WYDCY+uqhy63MLFzbKc523dcvvljwo+CvXNFQt11lNhFHmfH8IhOs18AFbZa+OAYfQhDIAW5mJlu0L5eck31zw3YT6+mngu8php2QWx9Z00TKB7ixf4FilUnHo3MHsLvTCSRFlOhKon5aQFrejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1khKbouI16UTktIIKzNZf7MuZDwrsQb2QDv8M6cc/g=;
 b=co/P/pGle56V7L52SRTq9/fjbHXbDufS80Z/7CJIGlnljeEKpj8SVi6ygPkKz/7JEnC8ZJ7AT2ZPALeOx3pfG/MhwtOilblAgonVZow5NqjZyz2wbGhsQ54/lmeLTER+8TtBsrDuInZ7OJgArxEkqIrrrpjEwurhztHyNersGT3FXKmuwGdHG2nMAjp5FGOH7+gQW830tS7MOVfhJh1HPl/DozlxD1uBrxcO5l/t4P54P9k1ZCdvbAXXk9Y4k00VpCRQc+SPLvWmJYk9RcfyJGW1Qytr+RplzU9OIjY/1rL4zEmL0p3+zCj3yp2cx2WpcQVM44sgmzJvixH5cacgew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SN7PR12MB7833.namprd12.prod.outlook.com (2603:10b6:806:344::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Sun, 26 Oct
 2025 14:40:45 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9253.017; Sun, 26 Oct 2025
 14:40:45 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 26 Oct 2025 23:39:11 +0900
Subject: [PATCH 6/7] gpu: nova-core: replace use of `as` with functions
 from `num`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251026-nova-as-v1-6-60c78726462d@nvidia.com>
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
In-Reply-To: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0346.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::14) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SN7PR12MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: f238165f-fb5b-4d69-b1c8-08de149da442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UCt4YkNJMmk1ZTJFb0tUUDFPeU9vdnExUzBKOWhVUE5FK05kM1VGTkxEL08x?=
 =?utf-8?B?RnhLUjJPd3Z3RElQcVRVSUI3bTV1TGNSRlZVbGthL2ZlM1hINUVCblMzZStV?=
 =?utf-8?B?MVJ1Y3lQV3V1aXFqdVVObkRyVWFRMUxoNmlxaWVHZlI1SDRhWTJSN0JmRXls?=
 =?utf-8?B?QkEyWGs0eDdCNmROMC9wV2NuajNmcGluWHprczBMdm8rRVppYkFHb3BDajdE?=
 =?utf-8?B?dHJCQlkyT1p2TDV6MkVwVU9NZWpudFlVUmFlanRhK29qNC96a1p0aDdHMXdC?=
 =?utf-8?B?NWdvcEVGRzZsUHMrUGc1c1BwOFgvZW4yWVFYc3hvc3l3ZmV3THd0OVJ0K1Nz?=
 =?utf-8?B?aUVpQThYcytuY0lGSEJkV2tUY25ULzJsSkZlWDBVeGJ2b1N6N2FOL2xtNERT?=
 =?utf-8?B?MzhwL1ZpMENqTENHeGVXQ3hUb0dEOThpN3ltZlNUbXNaMWFVMzFpWUdJTGFz?=
 =?utf-8?B?djE4VXY4dVI3bi9mUE5kaXY3bW1UT1NHU1J4RW9qZlV5cjBjNk9RUEtFaUFP?=
 =?utf-8?B?Mktua3JqQmV2Z3FGT05GL3NvNGhWcXNzNVZLYTBDUnBXbkd3ZDBmSGZUL1ZH?=
 =?utf-8?B?dXlEakV5OVE5cGFVQTk2czZoczJZbmhEVjg0R3MvNjNnY1NNRnZxSU1McllG?=
 =?utf-8?B?Si9OUHEvYXBnOUlvak9wTkpFTkVvNVA5bkgya2xuYmwrd1FsRWt3QnMvNzNF?=
 =?utf-8?B?eVJ5QVZ3RTlvaE4zcmMramx2UnlZMWZ2VWxSbE1TRUlia2doMG80SzI1alNl?=
 =?utf-8?B?VmZZcVZ4LzJ6Z04zR1JKaVJNbFU4bFBjcUZHVVJFWFJEK0ZhK092U3o4a0ZR?=
 =?utf-8?B?NzJuSjZnalRETjgxN3dPVkxPa3ZDcmVCQ3RWNy85SDBtSTdpQzhqRFVSNmhG?=
 =?utf-8?B?UXFtaEY3Rkx3ZVZTUVExWHQvaDArcTlNOVRyeFloNXY1b1F2QlJOMVRCQi9k?=
 =?utf-8?B?Ujh4Wk5KSkpzMVNRK3hVNExyU3Fyd25NZmN4ZnVVeDdiczhCMi91MDh1T2FR?=
 =?utf-8?B?anJHM2VDTEtDMFJRZ1dVS0krb1EybEVFL1BldU44dXIrZ09JekllT3VMRHQw?=
 =?utf-8?B?TVNIVVV0YThWK2w5WU1oMjFUNHh4amlMVEV5VDE1WmQ5eXYycUJyTzgxdnN5?=
 =?utf-8?B?VkJwYllOUkVXR3VvMmx6MWNUa3BFc2YwRzZBNTZrZFhzbVZjQlZxUS9iTWZX?=
 =?utf-8?B?S29MRThxMy9RNGxQUHBGeGVqb1ozQkJ5OEFGYWpIdTJCUGVPR1JkSnNROExO?=
 =?utf-8?B?TzVpWWFCWHFUUU8ydXdIQUZBQVBiYnIrSktheEgyWlM5Smw1cTR2a1EvcTlL?=
 =?utf-8?B?TmJZZ0l5RHBWalBrVzEyQVlFS1BldkNhZG5KRjhVYVdvOXNNUlAwcEgvbkZk?=
 =?utf-8?B?S3lhN0htNHhqdjlTaTRiOS9RcHN5UnlkQW1ESnJId2d4amxOL0tMdkgxNk5Q?=
 =?utf-8?B?dk5tZVRkcEtLMFQ4bVVKUnZXVThpcDdSSmw2RVdtWkU3ZkVhVkFSQWt6ZzRB?=
 =?utf-8?B?REdmRGYySjlidHBJWlpPVWsvYXBnSHN4TTR5M3JFaVpiTlUxdUJvL2c0K2dq?=
 =?utf-8?B?VW5CV1RRN0xhUEp1RWJIRnJuenVPTVljQXgyYUVkRCtOZFU2bS9FTjVRbDd5?=
 =?utf-8?B?aXd3UnVoVFlPejBoUW5BK0QxVGV2cDYyUlAxMHlkU2pVUUEvWnRoMktFSlAw?=
 =?utf-8?B?WW9PQzR6dXRHSzNnQ1hXRUpDdXhVZWViN2dJY09RaVFoSUFTRVlycFdreVpN?=
 =?utf-8?B?OFRyVHh5clppWXRoTjVhRVNIVDRVUWpaVWtDeFpCVXRRMDJSN3M1TEpsc2tp?=
 =?utf-8?B?TnFYMG40dW1wUTlRL0tINWxLNG1SU1hTVVErZ1BIKzA1dVFIOUEzbzYrVUZu?=
 =?utf-8?B?YjVRMEhHVmVEL1Z5ZnloQVRuNVdJUDBzdEJxWlBRa1NLV3JiK0djeXdTWDIr?=
 =?utf-8?B?R21qNVNJVE9qcS95RHNMTUI0Y2h0YU9seGdoalQ0SUlIdmpOd2NGMDkrUnNT?=
 =?utf-8?Q?uJca1dYOvV7mVn9LqnsQboQO5fKjfQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2hjeFNqSW5yNmlXenlzUWMxY1RraWtiY1RtSEVMZU5XclZlVXFCUGxtbG45?=
 =?utf-8?B?bS9OOWdoTE1rWWs4cDJMaTQ4OWNZdjdNSE5HckN0Zm9VdURyTzZ3WEliN3dK?=
 =?utf-8?B?cmljTVZvUm9aZklXSG5lbWJCeG9lNFpXYjJiMXh5elNGbHBIeDBjMk9KRm5h?=
 =?utf-8?B?enFjZmh4QlJ3QXV6anlhV2lyZDJTVXdHakVQZlVQYXEvSDlQanNuQlNUaEFG?=
 =?utf-8?B?Rm1uZ1ZaeWpGNG96Z3lRZjhxSGo5bjhLSkZPY3JDZUg2WE5uNkU4TFg1S0Nj?=
 =?utf-8?B?bGlYN1p5UEVGdnM5QWZYb0E1dDF2UER4WDJVYXlBd0h4QzBsR0ZSWUQ3Tk1R?=
 =?utf-8?B?S2lqRE40WnlvY01McC90RDlyaWNlMUo3SWpMNkszcnNTSGFEdExpR0gyaUto?=
 =?utf-8?B?UTV3WGxMUk1OdkdFY1k4VStQeVYrYUloZ1dxeVU3Szg3RGZLSVpjbHkrMlpw?=
 =?utf-8?B?WjRFVlcvalMvbW9jcmcvZlhjSE53WjJnZEdsR2o3NEJQa3VLa0NKNkd3TklG?=
 =?utf-8?B?YjdlMng0NjcxMk9GOFJwTkpiVFlqbUlYM0x0SFIremxTdHE0ZmJqM1VkS0xX?=
 =?utf-8?B?SjlxNU1OVHlDL0J2VTFHdldQY3dvVXF4aDArSy9tUytONUduSnhIU0h2ckZt?=
 =?utf-8?B?Sjh2VVVzYzgwZ095eVhXRzJ4Y3orUm5hNGhjUkFadjh1QVlrazAzd2t6c1l6?=
 =?utf-8?B?dCtxdld3ZThpR0l1Nm5ab2tOdGlwdEpFK1VxWDEvcFF5MEhiTWZyOXJIazdy?=
 =?utf-8?B?TnV4YnRrcG9mSnZxTnRTVFlJbjlkQ0xiWllwY1J2cFJJZ3dvdVF6UFQreFhO?=
 =?utf-8?B?dG11QStabFBvd29iYnk0dGZzMjRUT09RM1FEeFFRN1VNL1BwWWNkWFYzMHZS?=
 =?utf-8?B?TFlLNXpLVVZFOFpKQUlBNG9FcVhqbWh5dXhIeVo5Q2h3N3dlWmhwcXkwRE5C?=
 =?utf-8?B?clVRc3V5RmNlaS9kSFRoNmdtcTg3emJaYWp4cFpIcXVLUThYSjZYYWlNZnJZ?=
 =?utf-8?B?cXRIWjUrbS8xTExwNHRDODY2Wk9EUmRiTmlmTmd0STluVVZoT0VPZzJnYmJU?=
 =?utf-8?B?cHMzRHRLZFVCeWtMR0RJRFNUdXlHKys0NHdvNThKdUY4RUZSWU9oSGMzZzBB?=
 =?utf-8?B?RjJCaVNCUm1oaWpYYSt2ZDFGbmNQM2xSZEFBemtkU2xiTlp2K1V0M0pGYVhQ?=
 =?utf-8?B?clNPa3h4V1UzRXJMeDdpWlYzbzN2bEdpbUwwaW1CYk5GVmxJY2VwNVQ4UHc2?=
 =?utf-8?B?cHZjV3lCVXplaWM2SFRHcklNRGNJWHFyMTR0ZDFGc1dzY1hwK29Ga0UwM0pM?=
 =?utf-8?B?MUpzR01QanovNjRrcWIvY3NnYUMrMnJlSWtvaEVudVVqYVRoTHF6SndBTGZJ?=
 =?utf-8?B?aFZmWXVrMGd2OVFaRjJiNEN0dHQrSWJUSkJSbnB6OXYvUU83QkF4d2hCaXJO?=
 =?utf-8?B?RkxMa25MR1o3OVExcFkzTWwwYVd3T3l1NHNoMnpIZWNIcVRiNDhUMVZuRDFp?=
 =?utf-8?B?V0Z5Qi9NQmZUS3M0MXN5TzV4elZmNklRYks3MktuNVFtN0hBQzA2WVhUNHIy?=
 =?utf-8?B?QW9QaW8zcHVUcitET0tacHNvTkZEbGQyOUFZR1czeEpSTFV0WmtjV1R5Unow?=
 =?utf-8?B?OUplZTVtZVlFM1RYZVkrdEEyRWpmV1RXVnM3eFlXWTMvcWdqUUVEcjRjOWpZ?=
 =?utf-8?B?QktHYXVaMlFRWEsybmRFWmFEMXVyMFRwS250WXBlcE9vU0NRTWZZZHA2WFNl?=
 =?utf-8?B?eFk1RkdoaHhyV0MyTmV0NzcvY1pRRkhoOWpPMlVUUFRNU0hkTlA2RXNrc1kr?=
 =?utf-8?B?YlZpd0RsbFEyOXpnTmwyR1QwNnFiYUd3YXNXY0gycDFtTkp4elZ4WlZqeXVF?=
 =?utf-8?B?Qm1RUEMwdHhURjkxamFqSmVBWUNvelY4VlpONG95M1hYMHo4bFBPbDhxTTVD?=
 =?utf-8?B?OE41UDZaRHY4UFk1YlJ4VExtQ29FZ0xoUmtxSU1WQmlGb29kaCtiL0lubERj?=
 =?utf-8?B?ODd5citSNW4wbGdkbStPM1J1ckZMTmZpTmd4NHV0L0RldXRyeXBIWTRUWjVu?=
 =?utf-8?B?WDRMY0Y0TjNpdU8yNk1idWtjMXBJVjhWQjVEVTVQVDZBZUFYRzUvc1Q3V1JN?=
 =?utf-8?B?eHIvUTh6eXFVcGZpTXk0a0RBMnBpU3g2Slo4WVZ4L3NKZVl6QWplekJocWti?=
 =?utf-8?Q?NUs29HweLcwIcedi61t+GIFwBjOB1trCDAj8xLHPBv5z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f238165f-fb5b-4d69-b1c8-08de149da442
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 14:40:45.2136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WM+CWmQelZaCgIVtfATz90VLZVh666W5KZmMYEma+Rx0c2NjfDmatMRqmc92bxWEka2RZD03uB16WqBkiUwPiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7833
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

Use the newly-introduced `num` module to replace the use of `as`
wherever it is safe to do. This ensures that a given conversion cannot
lose data if its source or destination type ever changes.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          |  5 +++--
 drivers/gpu/nova-core/fb.rs              |  7 ++++---
 drivers/gpu/nova-core/firmware.rs        |  7 ++++---
 drivers/gpu/nova-core/firmware/booter.rs | 31 +++++++++++++++++--------------
 drivers/gpu/nova-core/firmware/fwsec.rs  | 11 ++++++-----
 drivers/gpu/nova-core/firmware/gsp.rs    |  5 +++--
 drivers/gpu/nova-core/firmware/riscv.rs  |  7 ++++---
 drivers/gpu/nova-core/regs.rs            |  5 +++--
 drivers/gpu/nova-core/vbios.rs           |  9 +++++----
 9 files changed, 49 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index fb3561cc9746..a44df1ac8873 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -15,6 +15,7 @@
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
+use crate::num::{FromAs, IntoAs};
 use crate::regs;
 use crate::regs::macros::RegisterBase;
 
@@ -442,7 +443,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             FalconMem::Imem => (load_offsets.src_start, fw.dma_handle()),
             FalconMem::Dmem => (
                 0,
-                fw.dma_handle_with_offset(load_offsets.src_start as usize)?,
+                fw.dma_handle_with_offset(load_offsets.src_start.into_as())?,
             ),
         };
         if dma_start % DmaAddress::from(DMA_LEN) > 0 {
@@ -468,7 +469,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
                 dev_err!(self.dev, "DMA transfer length overflow");
                 return Err(EOVERFLOW);
             }
-            Some(upper_bound) if upper_bound as usize > fw.size() => {
+            Some(upper_bound) if usize::from_as(upper_bound) > fw.size() => {
                 dev_err!(self.dev, "DMA transfer goes beyond range of DMA object");
                 return Err(EINVAL);
             }
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 27d9edab8347..1461dd643cae 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -11,6 +11,7 @@
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
+use crate::num::usize_as_u64;
 use crate::regs;
 
 mod hal;
@@ -105,14 +106,14 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
 
         let vga_workspace = {
             let vga_base = {
-                const NV_PRAMIN_SIZE: u64 = SZ_1M as u64;
+                const NV_PRAMIN_SIZE: u64 = usize_as_u64(SZ_1M);
                 let base = fb.end - NV_PRAMIN_SIZE;
 
                 if hal.supports_display(bar) {
                     match regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar).vga_workspace_addr() {
                         Some(addr) => {
                             if addr < base {
-                                const VBIOS_WORKSPACE_SIZE: u64 = SZ_128K as u64;
+                                const VBIOS_WORKSPACE_SIZE: u64 = usize_as_u64(SZ_128K);
 
                                 // Point workspace address to end of framebuffer.
                                 fb.end - VBIOS_WORKSPACE_SIZE
@@ -132,7 +133,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
 
         let frts = {
             const FRTS_DOWN_ALIGN: Alignment = Alignment::new::<SZ_128K>();
-            const FRTS_SIZE: u64 = SZ_1M as u64;
+            const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
             frts_base..frts_base + FRTS_SIZE
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4179a74a2342..ae6dbefd9e5a 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -15,6 +15,7 @@
 use crate::dma::DmaObject;
 use crate::falcon::FalconFirmware;
 use crate::gpu;
+use crate::num::{FromAs, IntoAs};
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
@@ -75,7 +76,7 @@ pub(crate) fn size(&self) -> usize {
         const HDR_SIZE_SHIFT: u32 = 16;
         const HDR_SIZE_MASK: u32 = 0xffff0000;
 
-        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT) as usize
+        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_as()
     }
 }
 
@@ -190,8 +191,8 @@ fn new(fw: &'a firmware::Firmware) -> Result<Self> {
     /// Returns the data payload of the firmware, or `None` if the data range is out of bounds of
     /// the firmware image.
     fn data(&self) -> Option<&[u8]> {
-        let fw_start = self.hdr.data_offset as usize;
-        let fw_size = self.hdr.data_size as usize;
+        let fw_start = usize::from_as(self.hdr.data_offset);
+        let fw_size = usize::from_as(self.hdr.data_size);
 
         self.fw.get(fw_start..fw_start + fw_size)
     }
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index b4ff1b17e4a0..bab66ed85f10 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -18,6 +18,7 @@
 use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
 use crate::firmware::{BinFirmware, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
 use crate::gpu::Chipset;
+use crate::num::{FromAs, IntoAs};
 
 /// Local convenience function to return a copy of `S` by reinterpreting the bytes starting at
 /// `offset` in `slice`.
@@ -74,7 +75,7 @@ impl<'a> HsFirmwareV2<'a> {
     ///
     /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
     fn new(bin_fw: &BinFirmware<'a>) -> Result<Self> {
-        frombytes_at::<HsHeaderV2>(bin_fw.fw, bin_fw.hdr.header_offset as usize)
+        frombytes_at::<HsHeaderV2>(bin_fw.fw, bin_fw.hdr.header_offset.into_as())
             .map(|hdr| Self { hdr, fw: bin_fw.fw })
     }
 
@@ -83,7 +84,7 @@ fn new(bin_fw: &BinFirmware<'a>) -> Result<Self> {
     /// Fails if the offset of the patch location is outside the bounds of the firmware
     /// image.
     fn patch_location(&self) -> Result<u32> {
-        frombytes_at::<u32>(self.fw, self.hdr.patch_loc_offset as usize)
+        frombytes_at::<u32>(self.fw, self.hdr.patch_loc_offset.into_as())
     }
 
     /// Returns an iterator to the signatures of the firmware. The iterator can be empty if the
@@ -91,19 +92,21 @@ fn patch_location(&self) -> Result<u32> {
     ///
     /// Fails if the pointed signatures are outside the bounds of the firmware image.
     fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>> {
-        let num_sig = frombytes_at::<u32>(self.fw, self.hdr.num_sig_offset as usize)?;
+        let num_sig = frombytes_at::<u32>(self.fw, self.hdr.num_sig_offset.into_as())?;
         let iter = match self.hdr.sig_prod_size.checked_div(num_sig) {
             // If there are no signatures, return an iterator that will yield zero elements.
             None => (&[] as &[u8]).chunks_exact(1),
             Some(sig_size) => {
-                let patch_sig = frombytes_at::<u32>(self.fw, self.hdr.patch_sig_offset as usize)?;
-                let signatures_start = (self.hdr.sig_prod_offset + patch_sig) as usize;
+                let patch_sig = frombytes_at::<u32>(self.fw, self.hdr.patch_sig_offset.into_as())?;
+                let signatures_start = usize::from_as(self.hdr.sig_prod_offset + patch_sig);
 
                 self.fw
                     // Get signatures range.
-                    .get(signatures_start..signatures_start + self.hdr.sig_prod_size as usize)
+                    .get(
+                        signatures_start..signatures_start + usize::from_as(self.hdr.sig_prod_size),
+                    )
                     .ok_or(EINVAL)?
-                    .chunks_exact(sig_size as usize)
+                    .chunks_exact(sig_size.into_as())
             }
         };
 
@@ -132,9 +135,9 @@ impl HsSignatureParams {
     /// Fails if the meta data parameter of `hs_fw` is outside the bounds of the firmware image, or
     /// if its size doesn't match that of [`HsSignatureParams`].
     fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
-        let start = hs_fw.hdr.meta_data_offset as usize;
+        let start = usize::from_as(hs_fw.hdr.meta_data_offset);
         let end = start
-            .checked_add(hs_fw.hdr.meta_data_size as usize)
+            .checked_add(hs_fw.hdr.meta_data_size.into_as())
             .ok_or(EINVAL)?;
 
         hs_fw
@@ -169,7 +172,7 @@ impl HsLoadHeaderV2 {
     ///
     /// Fails if the header pointed at by `hs_fw` is not within the bounds of the firmware image.
     fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
-        frombytes_at::<Self>(hs_fw.fw, hs_fw.hdr.header_offset as usize)
+        frombytes_at::<Self>(hs_fw.fw, hs_fw.hdr.header_offset.into_as())
     }
 }
 
@@ -198,12 +201,12 @@ fn new(hs_fw: &HsFirmwareV2<'_>, idx: u32) -> Result<Self> {
         } else {
             frombytes_at::<Self>(
                 hs_fw.fw,
-                (hs_fw.hdr.header_offset as usize)
+                usize::from_as(hs_fw.hdr.header_offset)
                     // Skip the load header...
                     .checked_add(size_of::<HsLoadHeaderV2>())
                     // ... and jump to app header `idx`.
                     .and_then(|offset| {
-                        offset.checked_add((idx as usize).checked_mul(size_of::<Self>())?)
+                        offset.checked_add(usize::from_as(idx).checked_mul(size_of::<Self>())?)
                     })
                     .ok_or(EINVAL)?,
             )
@@ -318,12 +321,12 @@ pub(crate) fn new(
                             dev_err!(dev, "invalid fuse version for Booter firmware\n");
                             return Err(EINVAL);
                         };
-                        signatures.nth(idx as usize)
+                        signatures.nth(idx.into_as())
                     }
                 }
                 .ok_or(EINVAL)?;
 
-                ucode.patch_signature(&signature, patch_loc as usize)?
+                ucode.patch_signature(&signature, patch_loc.into_as())?
             }
         };
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index ce78c1563754..ed82e74ccdc9 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -23,6 +23,7 @@
 use crate::falcon::gsp::Gsp;
 use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
 use crate::firmware::{FalconUCodeDescV3, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
+use crate::num::{FromAs, IntoAs};
 use crate::vbios::Vbios;
 
 const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
@@ -250,7 +251,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
         let ucode = bios.fwsec_image().ucode(desc)?;
         let mut dma_object = DmaObject::from_data(dev, ucode)?;
 
-        let hdr_offset = (desc.imem_load_size + desc.interface_offset) as usize;
+        let hdr_offset = usize::from_as(desc.imem_load_size + desc.interface_offset);
         // SAFETY: we have exclusive access to `dma_object`.
         let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
 
@@ -277,7 +278,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + app.dmem_base) as usize,
+                    (desc.imem_load_size + app.dmem_base).into_as(),
                 )
             }?;
 
@@ -285,7 +286,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let frts_cmd: &mut FrtsCmd = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
+                    (desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset).into_as(),
                 )
             }?;
 
@@ -338,7 +339,7 @@ pub(crate) fn new(
         // Patch signature if needed.
         let desc = bios.fwsec_image().header()?;
         let ucode_signed = if desc.signature_count != 0 {
-            let sig_base_img = (desc.imem_load_size + desc.pkc_data_offset) as usize;
+            let sig_base_img = usize::from_as(desc.imem_load_size + desc.pkc_data_offset);
             let desc_sig_versions = u32::from(desc.signature_versions);
             let reg_fuse_version =
                 falcon.signature_reg_fuse_version(bar, desc.engine_id_mask, desc.ucode_id)?;
@@ -369,7 +370,7 @@ pub(crate) fn new(
                 // Mask of the bits of `desc_sig_versions` to preserve.
                 let reg_fuse_version_mask = reg_fuse_version_bit.wrapping_sub(1);
 
-                (desc_sig_versions & reg_fuse_version_mask).count_ones() as usize
+                usize::from_as((desc_sig_versions & reg_fuse_version_mask).count_ones())
             };
 
             dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 24c3ea698940..637adf989ee8 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -12,6 +12,7 @@
 use crate::firmware::riscv::RiscvFirmware;
 use crate::gpu::{Architecture, Chipset};
 use crate::gsp::GSP_PAGE_SIZE;
+use crate::num::FromAs;
 
 /// Ad-hoc and temporary module to extract sections from ELF images.
 ///
@@ -232,10 +233,10 @@ pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
 fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
     for sg_entry in sg_table.iter() {
         // Number of pages we need to map.
-        let num_pages = (sg_entry.dma_len() as usize).div_ceil(GSP_PAGE_SIZE);
+        let num_pages = usize::from_as(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE);
 
         for i in 0..num_pages {
-            let entry = sg_entry.dma_address() + (i as u64 * GSP_PAGE_SIZE as u64);
+            let entry = sg_entry.dma_address() + (u64::from_as(i) * u64::from_as(GSP_PAGE_SIZE));
             dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
         }
     }
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index afb08f5bc4ba..fabb38fa8c55 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -12,6 +12,7 @@
 
 use crate::dma::DmaObject;
 use crate::firmware::BinFirmware;
+use crate::num::FromAs;
 
 /// Descriptor for microcode running on a RISC-V core.
 #[repr(C)]
@@ -41,7 +42,7 @@ impl RmRiscvUCodeDesc {
     ///
     /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
     fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
-        let offset = bin_fw.hdr.header_offset as usize;
+        let offset = usize::from_as(bin_fw.hdr.header_offset);
 
         bin_fw
             .fw
@@ -74,8 +75,8 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<
         let riscv_desc = RmRiscvUCodeDesc::new(&bin_fw)?;
 
         let ucode = {
-            let start = bin_fw.hdr.data_offset as usize;
-            let len = bin_fw.hdr.data_size as usize;
+            let start = usize::from_as(bin_fw.hdr.data_offset);
+            let len = usize::from_as(bin_fw.hdr.data_size);
 
             DmaObject::from_data(dev, fw.data().get(start..start + len).ok_or(EINVAL)?)?
         };
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..b3ed164aa2ac 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -12,6 +12,7 @@
     FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
 };
 use crate::gpu::{Architecture, Chipset};
+use crate::num::FromAs;
 use kernel::prelude::*;
 
 // PMC
@@ -75,7 +76,7 @@ impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
         let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale()))
-            * kernel::sizes::SZ_1M as u64;
+            * u64::from_as(kernel::sizes::SZ_1M);
 
         if self.ecc_mode_enabled() {
             // Remove the amount of memory reserved for ECC (one per 16 units).
@@ -158,7 +159,7 @@ pub(crate) fn completed(self) -> bool {
 impl NV_USABLE_FB_SIZE_IN_MB {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-        u64::from(self.value()) * kernel::sizes::SZ_1M as u64
+        u64::from(self.value()) * u64::from_as(kernel::sizes::SZ_1M)
     }
 }
 
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index a521c0a4df0f..234a9f29787b 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -5,6 +5,7 @@
 use crate::driver::Bar0;
 use crate::firmware::fwsec::Bcrt30Rsa3kSignature;
 use crate::firmware::FalconUCodeDescV3;
+use crate::num::FromAs;
 use core::convert::TryFrom;
 use kernel::device;
 use kernel::error::Result;
@@ -825,7 +826,7 @@ fn falcon_data_ptr(&self) -> Result<u32> {
 
         let data_ptr = u32::from_le_bytes(bytes);
 
-        if (usize::from_u32(data_ptr)) < self.base.data.len() {
+        if (usize::from_as(data_ptr)) < self.base.data.len() {
             dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
             return Err(EINVAL);
         }
@@ -953,7 +954,7 @@ fn setup_falcon_data(
         pci_at_image: &PciAtBiosImage,
         first_fwsec: &FwSecBiosBuilder,
     ) -> Result {
-        let mut offset = pci_at_image.falcon_data_ptr()? as usize;
+        let mut offset = usize::from_as(pci_at_image.falcon_data_ptr()?);
         let mut pmu_in_first_fwsec = false;
 
         // The falcon data pointer assumes that the PciAt and FWSEC images
@@ -994,7 +995,7 @@ fn setup_falcon_data(
             .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
         {
             Ok(entry) => {
-                let mut ucode_offset = entry.data as usize;
+                let mut ucode_offset = usize::from_as(entry.data);
                 ucode_offset -= pci_at_image.base.data.len();
                 if ucode_offset < first_fwsec.base.data.len() {
                     dev_err!(self.base.dev, "Falcon Ucode offset not in second Fwsec.\n");
@@ -1080,7 +1081,7 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
 
         // The ucode data follows the descriptor.
         let ucode_data_offset = falcon_ucode_offset + desc.size();
-        let size = (desc.imem_load_size + desc.dmem_load_size) as usize;
+        let size = usize::from_as(desc.imem_load_size + desc.dmem_load_size);
 
         // Get the data slice, checking bounds in a single operation.
         self.base

-- 
2.51.0

