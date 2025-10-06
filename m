Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B363BBBD17E
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 08:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9589D10E2F1;
	Mon,  6 Oct 2025 06:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="peSYnael";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010026.outbound.protection.outlook.com [52.101.46.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE4610E2F1;
 Mon,  6 Oct 2025 06:01:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7qWziSa2JIME4qQBmSkh4Yj9sBsDFaNzBrwwUHQFkD/Ixk/g5Za8xqStXY+XE1iZYquWVU5lciYYzBNL2ZWOqP7JTj/KD9MyB9o9ewTY8M6PSlaq0qA76lsdh+W1Y443XtxdnjgK23d394JscXi7G1fZGQgo9C8vmFQvEo++GgBvlkLgyQWc6wFlMSURo6AVq1mt/7YZPZB+li/J9RGfrFkEytf96IFFSahVlpSfoN2ZFGMWJxnqPGjdelkrhgoruVACw2D8ko5lg5nq/wALtrYjUv+DAtiRsg3S7KfAISU4Y5NWbgJrSkUDTuPH5zB11FaGVbCeMtj9gsaLgH5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzhUrgpbS1hCZnEXLMiw5MJWFPqofsYo/1Sji6kPURA=;
 b=fQ6aKhxLtdej53AVcYgKOEFvw5VsIGkgVLdtGpEpzmzrasdBnfotmkKnBstX14P9qnzXrIGbdierpamj0tnjwukNkuqmX/iSBxLWQ79TR+5EmUllkva3lS3FzqOQwVyv2iaVQ1B7UYI+7NLaCYBsqjE1yU7Z6dw8dyLNZ94Io4iihIGuVnm0Jg59hvB5EY6tNLHIz5Z3MMOwMDWKChHKVW1278J6eYNpdYACkX7dJ8FuC231zGPj5x30YzgfrPaMnYkbRFeCsrGbAvOXbj5QbSCY5Eup5AX04d+NhSbJoJgoLWsAHQRKbzfBlphFKt9JL2kJYzTYoyZ0Uh4Wc/ydfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzhUrgpbS1hCZnEXLMiw5MJWFPqofsYo/1Sji6kPURA=;
 b=peSYnael13Je93Ck8sAueCbjoAVPSeeuBXUnunh/lmU/Wd5RRbt6P5Z80nD8nNgiHh3z6kn3b1RQioUFSyuyhEzGLl8jo1yHDHFkiwO/fxY56D5bEhGDWGywaBAQzDEjSYxoFhv7VzWVymN+N7n4lkzBKH/Jc0iNzICYtK3s5SFB7R/8euPwdAJpeT/Q9/Ty9uvKrWWLj3uEIUtDwcvGgTQnvgmdvtLkPfAz4tY62rZxcuq65DNepVcTAPW/4KfrHHeiGTS3HI3ut65JL1vpnWrEl5lSlPG27CSm0QR/MPL5txydAoY2bBan4nPFM7zEUJM/yQwQdWge0jDtpsJ9hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4149.namprd12.prod.outlook.com (2603:10b6:610:7c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 06:01:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 06:01:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Oct 2025 15:01:42 +0900
Message-Id: <DDB0EGNAS7N8.X5GFDGYLHUPX@nvidia.com>
Subject: Re: [PATCH] nova-core: vbios: Rework BiosImage composition to use
 AsRef and traits
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
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
 <daniel.almeida@collabora.com>, "Andrea Righi" <arighi@nvidia.com>,
 <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251005220847.805405-1-joelagnelf@nvidia.com>
In-Reply-To: <20251005220847.805405-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4149:EE_
X-MS-Office365-Filtering-Correlation-Id: b97bc3ad-9841-49b0-1720-08de049dd48b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NktpMURoeFM3NXZQdHRNbld3RTRMS0FqTnI4VG5NU1VOR0FzZm1PMUFtNlY1?=
 =?utf-8?B?d1YvMkc5VEFDZEVKVUdxZkJFSkc5bE11MUtpVGlETExEaDdPZ3B5ajhLQUR4?=
 =?utf-8?B?em9oTHFUYUZkWTlsZXg4bVVrc2poek5qTTRTcEhVdk5XSzV4Qnc1dG8wdzlK?=
 =?utf-8?B?c1JxZzB4TUU3bWNBSnIzZUxiSHgrRytNNXZmeWFwaVFXc0pnSm1Gd2xGNGE3?=
 =?utf-8?B?Nkc1OTNNZDNWbHNDK0FXbldWbEhiajV2clNpZGcxNVVzMUlhYU4xOTZ3QXVh?=
 =?utf-8?B?c1VNUFd1Um5aYnBvNFF3SXd4TWRYaDREZWtvZnpwM0N0SzkxYUZBMDNqOVNX?=
 =?utf-8?B?UUZrVUl5MnZmK0hLRXNjdnF4RkhMTlNJU082aWVDUE54djdBUjd5MkZ0M0hG?=
 =?utf-8?B?QWpDUTlkVGhLa25JYjF1R0Nzb0tjZHl0aFZYR3kxVGtpZVFPaFhhbW1pckhR?=
 =?utf-8?B?UjFvT1NIVE5zL0Q2Vys0SlZKT3NGV2gvMkZ5ME1IaXFWTXVrYVJCbENZZ2Ni?=
 =?utf-8?B?aTJxZ3lkVVBKRm85OWhSenBmM1ZtWjRvNlhlYklLdlhUNk5weWV4a0lHdHYv?=
 =?utf-8?B?SVgrb2FIZU5NamxkODNqNTRiZFZKU1JwTEFlaUdJRGlHaE9YbFA1WERSalFk?=
 =?utf-8?B?MStlcUU1Z3FBSjU1ZDMwaS9MRnJ4bWI3ckRYTkNNNENZbHlKUE10VzFzS1Zp?=
 =?utf-8?B?Z3lWRjR1Sy9MMlY5MUJjNUxFbTdjVW4vaGxZSGJGVWJvNHhSU0hhNUN1OVFE?=
 =?utf-8?B?Z2N4MG1DdUpoRFA0dHJwd01zVXR6dXU3S0cxR3Z3UDYxZ0RDdWRRNXBGMU55?=
 =?utf-8?B?WDM4bU1aRjIrcHZmWGtoYm5VQXBPMzc3czE5UUw4bWJEVjU2TUNtcis0cHVh?=
 =?utf-8?B?RWNua0RvNlJSdVhKcmJrd0dYcjFYVjZadVl5T2lTdXNWSHlXaUc5WGg1VGp5?=
 =?utf-8?B?RW5jUVdOUjZPSm0wV0VGWWZEbk44eWt1WXRIVVBBTUltWWNwWEFuMk5zWEJ5?=
 =?utf-8?B?bXVFcU02RzhXOUxPMkNHRG1BRmVFcE5vMEtTK3pOMnVlMm9KVlRtRk5ZNXdS?=
 =?utf-8?B?d1R1N2xwMVFTOHh1SlI3U2tycE1USkJ5c0tLck1yMmlrV0Zoa1F4TFpyU3hB?=
 =?utf-8?B?MFJJdnoxMjFoT25iQW00Y3lDdkpaK05zQ0NXNGlaQnRkVFM0eHZBNWh4OHlW?=
 =?utf-8?B?eE5wa0dQSVI5RFd4YnBndFpPQi9tYk92aUZJVjZHL1hmOWdSRjlUNGJsZ0My?=
 =?utf-8?B?QkJWSzVsdlUzbytsNUlVR3dMTVl2RlNuNC9UOFhDMGs5NWhEVWlqSWpta056?=
 =?utf-8?B?TXpMWDlzSUx6OU41RFo1amJMN3MzRVBBRktkMlEvT1JQZ1Y4R1pRbVAwTWow?=
 =?utf-8?B?UG03RlhCbFpaVjNWemd0czgrMkx1cDNmbk55OHhmMUYvL2hNc1lhNEo2SCtF?=
 =?utf-8?B?RUZZbmlaODA5RFY5ODJSdENYcllnWncycllXbEdmZVV0YzVHSmJ0WENkL3E5?=
 =?utf-8?B?V0cvUmszUnowYXp2ZXg4TDByc2s0b3Rkc1FKdjFMMUVudWt1Uy9OMDBPY3FQ?=
 =?utf-8?B?b1cvelJueGN5NWtGbE5IWjdoaXkrSTBYeTlGa2ZWcitoMW80MHVWSnNLeGEx?=
 =?utf-8?B?NFd5SFhlcWJSTTUvOUtYNU0vUVYxVGp2YVpvWnlGOG1kbVJML3dKYVNScHVX?=
 =?utf-8?B?OW83N2xWeE92WS9wQlhrTlNhRmc2NitsODVsWFFLM01PQmZ4bnZocGVpa29j?=
 =?utf-8?B?a3dxcVNNd0xpWlFTenhxbXNQQWlhcVhjVjdmTGM2NlJkYjRJRUp1STZOb0pr?=
 =?utf-8?B?cWdZNE1WZmZoVjRlN25aZlA5UDdPMS9TSzVSRVBsRVRCcWl4dklaM0I5cE1J?=
 =?utf-8?B?YXlRTFhYWnQ3S0JPMCtEYmRUQnc3bGhiajEvM2RXTlBzRzNGejZZa3BPUWtP?=
 =?utf-8?Q?oC/mmy8/15Sc+xXgrDKTRXnV+v4z4gTU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d09DMjNzejNvSTlLNU0zbUk5WEJHK3hVR1ZlNWs1VXZzYWtrSW1QdFlEZzY5?=
 =?utf-8?B?djBDb0hONUREY213YXc5aU1yUisydTRVSUxkengyQzJmTWpxaFA1NXpkN2ZC?=
 =?utf-8?B?Sk1xVm1RSDBXK1JwWXo5V3JaSElnN0xleEF2VDNvd3MwODdhOUdaYzhvTlNk?=
 =?utf-8?B?NmV2aVZpSFJsRGtKb2ttUTAveDhPZWU3QkN0SFRxQXJRVDlFVkEzTXVqQ1E3?=
 =?utf-8?B?dDQrMGFid01HbEZKbVM3SnJmV1IrVWdlTHdOYm9DZkhmdDMvdHhld0lBOEtW?=
 =?utf-8?B?Y0sxVXJlSWZhYkhqenNhTUtKTkZ5dWtpL2EyS2JyVnFuS3ZTZEdDQ0pJbnBX?=
 =?utf-8?B?L2NGZys3UmpvbW9URHV2TWJFRnpVZytPSTVIbUpodnRtUlNUUWJML1ZkUk1S?=
 =?utf-8?B?cnVOT0wxUTl4VVQzc09IZXVralFGMFhjLzdzY0ppU0l4akRCNWxuWTlDTnFj?=
 =?utf-8?B?U01JQTliMWVZcEtLb2JqdkxaN1h0RG5xVk1uZEZldmN6QWxLWjVYVytIeVBS?=
 =?utf-8?B?dXBjb2xDKzVJcjV3aVVDK0dNVUdzVC9HanR6R0h2dkRrUnpQaXordk00eHNQ?=
 =?utf-8?B?emxOQ25CdE51R0h1eWw5WGFIL1pCZHQ0RHVUNTBnVndlcG1qYmVpK29EM29V?=
 =?utf-8?B?V0RleDVRNTJ3ckwxNDBVRk1DcW1tdk1ybzFjZUdXTmNpa3pRbW5RM2NyZnU4?=
 =?utf-8?B?cUdjckVFMDBFb01aaXRtTXlrTW40VEtMWjN2VFJ1TkJmN1NPdnZFNVlnRE5N?=
 =?utf-8?B?Z3djNXczSGQ1NHJqbmlJZHBnZzNFTWNBWVVrY0c1QXY0aUhMdGx4VkhlMFR6?=
 =?utf-8?B?V3RhZ0tNK0xXWU1PTU9SM1h1bjNxWDhhek0rY0c4UmtjZWZGSzZCM3ZyN1pH?=
 =?utf-8?B?ZE9pQ2JPdmtocjMrSXNWYWgvcEpycUZFMEI5YWxhMEpJclVvUnFkSWFmTU40?=
 =?utf-8?B?aFppZGJadG5FMmtacm5JMGJzWkcwMTlHWEl2M0M1Y3FKVFdzWDArSnNGOW0w?=
 =?utf-8?B?TDRCRElCUjVlUGFna3M0QTNPK0FSc2M0VGlRM3JqVU51UkNJVjZnUURPY0dE?=
 =?utf-8?B?ZUR6WHd1Tkcrd1BxY2EvWFJjclNwQlhKYkFBcFFIZ0dVckpXbzJWcnMxanZ6?=
 =?utf-8?B?eklGa0V0UUx5M2t5ODBXTzhlS1VIVkxQK0Nac0FRYkJxZnlwK3BteWFIYS9j?=
 =?utf-8?B?dFJvZjUrRXo5TXFZL0tzT0FRUU54ZEZJMTNDc3FzVEZqZjI3bWJPb0YyaGRZ?=
 =?utf-8?B?WHZGM3dFUnJERkc1QUJ0c21ibnN1TWpIWXp2TlcvVDFIdUZhNzk5WUdvU1BH?=
 =?utf-8?B?cmV2V29DREVWdlYwejU2dnRlQVUrNG50M2dySzBHODVNbUlHZENXMUxwVFJy?=
 =?utf-8?B?aXFqWFo4S2FycDZCQWxHRThGWHJZN2xJeHNkcUNPSlAyMS9wWW43ZFlsNExi?=
 =?utf-8?B?dVA0b2hrbGtIZElub3gvaDVzU1hOUnJaVkFPR1Z3d2p4MlZBWS85bFNDRUdu?=
 =?utf-8?B?N3M4UjVEb1dwbExFQ3ZES08vZjQ0VGY3OHVxem9Zc29ITUNha0JuK3M0SXdX?=
 =?utf-8?B?V2loVEpmaXVTMW9rQmcweHVQUkQ5RWx1TjBHUjV1OVdjMFQvZ0RJaytnbGhD?=
 =?utf-8?B?UHV2SXp5WnF6SW5NSDZnRE1kSkowSUxXOHF2SksvZFlFTHM1eTJyTFJqcFkz?=
 =?utf-8?B?OERjL1pSODBWNFgyenNOb1lHUmQydGJBUUk0NnBmSGc4eERNSUV6em91cnFG?=
 =?utf-8?B?QkozOUgrS0NUakNXUWE2SUd3WmVkeEJrQ0p0SkVzd1d3WWxxWmh6UWwxYXpr?=
 =?utf-8?B?bjA2OEcybmwzbkMxanVoY3p0bm1yTDRmUUR6M1haK05XQktMS0NnVTkwUlo0?=
 =?utf-8?B?K3FaQW4yamFqVUhLRi93Q1Z3cm5Cb2lmdnZzZnBjTWRGNkh0RVh4azA4TytW?=
 =?utf-8?B?SXUrOGtiaytwSDg3V1hicUUreEhaazh2eTlwcDZJZjVGMEtpRC9FSlVTV0JI?=
 =?utf-8?B?bk54aDEybytCeEFmZDl6Q0x6TzRXWGZoZTBOV2NRYTIrTkVRY1dCUGhGamk0?=
 =?utf-8?B?Zld1MXRwQ0VZK2RvaU5nNTl3dklmV3NEZ3NLRE1RNDBYUGJPZFk0OWZKN1Nz?=
 =?utf-8?B?b0JKZjkvNzQ2djBjbmVyc0EvNEhEai9SQy9NODdEVXZ3Qk5uVFNCMWVOVVZZ?=
 =?utf-8?Q?BCH8jvpGf7Q/HJvk53K0E302OSswjGOc+8CXoo05OzZM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97bc3ad-9841-49b0-1720-08de049dd48b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 06:01:45.8040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtFhi3xhsd9U35le6LVSaox8HhkiHiAKZ93FTvb/ODb1ZKn2nFLGjqnA6X0MQsMpulGlcBInBf3Ov0puon8iKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4149
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

Hi Joel,

On Mon Oct 6, 2025 at 7:08 AM JST, Joel Fernandes wrote:
<snip>
> +/// Trait for all BIOS image types
> +#[expect(dead_code)]
> +trait BiosImageTrait: AsRef<BiosImage> {

I see that this trait is implemented 4 times, but it has no user.
Actually I can remove the trait definition, its implementations, and the
`AsRef` implementations added by this patch, and the code builds just
fine - only with 50 less lines of code. Is this needed at all?

