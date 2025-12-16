Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F3DCC3A5B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 15:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DE510E818;
	Tue, 16 Dec 2025 14:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oX1VNEjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FB610E801;
 Tue, 16 Dec 2025 14:38:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTKhEHK30wzYT+e/t99CeHXev1YTTNrupWhcnLM26l21kTCBSZLUr+7HjonCewgWmma7O7UTU5UrJPkCHwE4kQmcv1BL2tXoDgYbR17yx3QLafuj5zKSTtML7EB8pYQKzV2bfDd7XhSNPFR3wTTw7d4Qbl02pjaJxYB+mfh0tmyHAIciaagzdAl3zYWdIiYK9rv0LEIxBe4rxNWAqxNgd13AO24xT/fPugTJuP2s+/yEsOL0qR489l53QkcoQsq939sDhxQsZDoWufi6zAGVV7fpsdTe90ZpJyONdbqvxdv7P5d9CCvBzlc/Wwe2+pNaqLLNAG5VoY/hHXMqdMyHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ue5HDrhR4/t4xPpFj8PlR1zh5VoDujNMAVIslkYDzY=;
 b=DDNBv6KKV3o23H46xy6bU3ib7CvskhXzKkjQzMqcsZs7WYfmzUkFEj2aApcBER3MLp4sx+HOeOLs4T3IHn3u/nReb4PtGoeYWzN17yHykJuJc6LwjmyyohvIKoPpqKdLhdqSiK1Bhwv3j60tBRNyxU80g4+ptyi9TZ0egm1lq+iT/rUo9lxm7MwaLUSbmJsUVAYRymfjPAdqeDTORxcLOtG7ms0N38lQhob+FsMOjor9NIVIgXI48S5GFZVJsGh7XLlpJ/sMx9PnI3DHHpJMgoP51U+85YpbS3pgZFu/Jnqi4fgx4FIpwTFMBiNEeZ6321eQL86u8eNUC1CSVt9yhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ue5HDrhR4/t4xPpFj8PlR1zh5VoDujNMAVIslkYDzY=;
 b=oX1VNEjVonGNpzgwzYpeas8EIjUoQxHgI1Nu6ognJ2UF7mbWDmqE+9Dt1tYQ0Q3kYoSGo3NOhUDI7hlc7FB3kL5XfeQLzMHgMmd0cXnNGXU5lIhjyU8KVkHGgd9x+UzMc3f9h5b+zl4evNLf20GXQrzqJjK0C4L8sU2PIccaHh52IDaIPv05i3aULi1lEb9/2WfhCgVdXT9eXGfWCF0QvHnxidsyLGQ0Xxx1oglql6VA7kOuyTEbQKxEgvhOboY5GEDni9MyfUcOH6rcS/vv5WO+7Ygj2BvGwrcOhUkXpA6CXCll9jIUaScTyQxleKgsKpKrmg0/HEUCJt9efNee6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB6772.namprd12.prod.outlook.com (2603:10b6:510:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 14:38:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 14:38:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 23:38:52 +0900
Message-Id: <DEZPV445WAYI.13J8N3Y8TLSZI@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/7] rust: pci: pass driver data by value to `unbind`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-1-6a5d823be19d@nvidia.com>
 <DEZMS6Y4A7XE.XE7EUBT5SJFJ@kernel.org>
In-Reply-To: <DEZMS6Y4A7XE.XE7EUBT5SJFJ@kernel.org>
X-ClientProxiedBy: TY4PR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 536096b6-3fd4-4d21-4a4e-08de3cb0d76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW1LSlJaMW0yZ0hYMW10UFVqeThRQ3ZwUk1BNExMS3dSV3BHU0xyZ3pPdlp6?=
 =?utf-8?B?NDFVaHZCR0tRcWdTbHBVcFpUZUYyVkFoNHZkYlhDRThOaWxBSkFMaGJZbTBH?=
 =?utf-8?B?Q2ExS3MvMXNaUHVpRnl3Y0V6OU5CTWVHYURRc0hIalRoOU5IOHZESmNTeFpR?=
 =?utf-8?B?L242SmpQdGs1c3lnelpMZ2tNcWEzbGJFcjVxaDdielZENlMvQnVQdXZQTnlJ?=
 =?utf-8?B?ZVA3cXI1TUdXdzNSU2xyUVJBcG1ISzVxRlFZdzI4QldNaWthN1FRUnFWQmln?=
 =?utf-8?B?aDd5c1ZmSkp2Wkljc01xeVdkOTBLOWt2eDdHZklieEJOVjRKaU5rd2dzbSt0?=
 =?utf-8?B?NjJmTjZzZkVQQUNkc1E2VTFaSm1vaVNLOTBPQkNKZEZMSVpWRWdsYUxrZFRy?=
 =?utf-8?B?Rmt6WmxFMEQrWmdWWnF0bzREVFFoUWhrQTlLdmV2UGRkREVBemNKYnJ0NGEr?=
 =?utf-8?B?ZEM5ZTVvaG5pS01vZUxrdDAwWkdaT3RKNE1yQmhFNEoxeXpablJ3UlFmQ3ZI?=
 =?utf-8?B?b3dlbUQxcFpjcDdlV3FUNE1uajJINFFoRWQvejBBbWxQYlpuRzFPZFFFK0pz?=
 =?utf-8?B?cGdRd2RibnVWTnpoMHpldkxtR2ZHejUyVXMzaGxUcHhvMUdsSkI1Z1VWVStL?=
 =?utf-8?B?RmZpVXFPNG9zdkIwUXUyajJyQVJJZFMzemdFVjBkV3JGa2E3cCtRd1YxdGhL?=
 =?utf-8?B?WkFEdDNRT3d6QzAyYUpDZkV3QkZFdG1ybkVxclgwMnoyRE9vRUlYaFRhQy9W?=
 =?utf-8?B?WEsxZ2pWSWdZR2EwQ0J3ZW4zSDEzcUJleDNxQXVzajJJdmtMTXpRRlRoK0Rs?=
 =?utf-8?B?eVg0STB4YzNFL3hGZnQ5L1hPTURjUGI2NU5Ed1l1TGlud3plTkY5Nm85UXZP?=
 =?utf-8?B?RE85RmViU0kxR3RCNHg3MXpzRFFpZU9vam5nZVFNek1pdVYyNnFpLzRFRFJo?=
 =?utf-8?B?elFibk5Db0dRRkplUGppQUVodERRYW8yOG0vWE5kT2dwMURobnljaTZZTVFI?=
 =?utf-8?B?eXdSR1VhYndmL255TEEzTmR3SmF2bXV1TE5PVXhUWUt5YXB0OWFCZGZIa0Q5?=
 =?utf-8?B?V1M1aWdnVUwzdnQ0WDUzUkl5MFBscEwyZGlrVEUrdDZrN0lPQklzVnNQRVNk?=
 =?utf-8?B?MGExWWNFTWdWbSs1RzhKQ0RYM1paYytic3BHd0FqbGJCVVpUU0NCUGNOOVFL?=
 =?utf-8?B?WlZOQW5VMWN1UzJYcFl0UUNaQ0tZSmlOcmRuZFg2UGlmN0ZiaHUwcCs3NHdH?=
 =?utf-8?B?eXArMlBiSVNtRmRoMGhFTExJNEhMVVRNSTJVMm1oS0JpdzI3TENvYlltWWJp?=
 =?utf-8?B?MlpPL050K2orZ0JvYWZxNjVvYlVGYldNUlVpWS9RZEI0TVFWUWtXNlM4NUVZ?=
 =?utf-8?B?MVNvT1oxTlhEb0lQaHBLM09ZdS9LQmEvMkZ3bDRqNm9aLzR1amRWck9lNlVS?=
 =?utf-8?B?SUMwb0hlNGdNTFRsV1Mya2h5eWZWRnU4Mjcwa0VmZjQ5aEIza0ZrVmtpUy93?=
 =?utf-8?B?NWc3VlhCNktKdzlDd3JoZWR3YW9pcnFLeEU5UG56dUY3S3pHZ2JJNldmbGtw?=
 =?utf-8?B?amNrQWdRb2VDV1I3cUx1ZHJ6NjZqTlVEVUpNSGtpZ0ZsMnMwL2gyaWo0dGxO?=
 =?utf-8?B?OTdWV2tVWGpEREt5NWlvcFNFUkdHNG5FQXE4RDV0czdNeDZTajR6VjVCN2g2?=
 =?utf-8?B?NythbUxieGl6LzhCS05BYytDdE5wL3dYTVVERWdRMDVQR0R0NTRZMTM0VXFE?=
 =?utf-8?B?bHpNbC9QemN1WmpFVlAwZkY2NVVnTnVvRUtqbTJjUjF0c1RKQmx3M0dyNzh3?=
 =?utf-8?B?aUdOMnovTCtONUpXaFhDdi9HMWg3ZWRBYWx3R2VyNWZwcFFvcU1ySTBHaWFU?=
 =?utf-8?B?UUVLZkRFRzJ3aVBLajVDYlFZQjBCVkVvcnNUVzROYTlZL01VM3hkaDlQVXdr?=
 =?utf-8?Q?plc8bSCUIaZ+z4qsKh9TEfzEpigwCRG/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGswZWhFQnprYy9RanMxZGVuWUk4Vm11cWl0QXRhY3lpcW52RGlSR243WVcz?=
 =?utf-8?B?VTgyVFQvaDJjWkN2ZnlLTnIyNys4YWlKNnpMRHhDTSsrYVNyWlI4dThubzdQ?=
 =?utf-8?B?MlM4am1xV2U2VDRpaE50WjZFOUVqSnM1RGwrLzZFaXpYdU5ZaDFjQ3JXK2hG?=
 =?utf-8?B?Qi9XZW92NHAva2JOVDB1TFJDSktzVE0wZUZyVWZTTFUzWkJWWDNoZkFHYmJj?=
 =?utf-8?B?VFpFUE9Pc3o2ZzJNRjBUN0RKVGs5SGxSWndISkNYQTNOSHBjRTBYZlhBMUpK?=
 =?utf-8?B?d2pTM3lkZmV2cldDVENHV2lUdjNUd2R1c3RqRHA1bFBtVEZQSHY1OWVpdkMx?=
 =?utf-8?B?bXFWeW5TVlNPR1lSM3FkZHFKbk82R3UwTlZYM1RxcmgrZE5SZ2lIWll5eHdH?=
 =?utf-8?B?L1hzMys5V24xYm1VQk1sK1hRb3FVOU53aElTT3BOUlNYKzBUUm15cVg4dTky?=
 =?utf-8?B?SklFbVcvZk12cDAxSytXQVRMZlpOaXVRVWY5WkczakhRakhYdldvd0FXcjR6?=
 =?utf-8?B?dFYrRnN1eDd5OThEeXp3T3ZRRGJyRy93bTJVclI4THFEOGQ1dDZqQUxDOFI5?=
 =?utf-8?B?cm1jVm5NZ0xVZ0twWU1uOXZqQTJ4K0Z5TE5pWGxHcFZsa1dMODBheEppSExF?=
 =?utf-8?B?WFlqM1BVbG5XVFFPMlZVWXZ5V2pxbDNvTjJHZlh5eTF6Tit2VS9IMDY4MTd5?=
 =?utf-8?B?Z25DMlNEMXBTdVpDRU4rQnVXem9HNXduTkk5VXBVeW5yWWtheGlIaEU4VE9k?=
 =?utf-8?B?NmtmdzArWFpETk41c2dnYWc1ZG9JVFZlTHZFdTZhanZCSzJRODVOZHkyUzNy?=
 =?utf-8?B?TG5zRTNxcHd0Y2I4WjI5dklwNkFmaWxvQ3lDcERVWkRBNXh2TTdMRUM3THZI?=
 =?utf-8?B?VU0zNFVyMzhIMUo2VnpKZ3haSUM1TzU0VWVtbG1SVm96UmtOd0FwMERyR05r?=
 =?utf-8?B?MWpCaGxZZzBvalk1Y3VYNHF3SXdMS0pXYU96c2FHQTRKY0YyVVUvUklDOXU2?=
 =?utf-8?B?VU9yd1F6dExsTE8rMVJFR2R6N2FhUTZZVTRqaXNuNzhsRm5sa3c1VkZCYVJk?=
 =?utf-8?B?SVZZNVhDZk5YYXRkTlMyUmdhMkxPWjk5czJsb1J4R1BuN1poWHRWQ2YyZHFR?=
 =?utf-8?B?T09YdWxOYXk1aFJ2bSsxUmFOSG8yTTc2cVpYWTNBRkRmcGZxR1BvTzVvWXhn?=
 =?utf-8?B?R25JOHVsbUQ0U1Eyd0pCSFJwVWQyRG9DR0E1TzZCODBMR2I2RmgzSkwyTmdK?=
 =?utf-8?B?NnFUY0owbDlRU3YyeHRwVzVoRGY1ZVZXYUNtWkxsaFhrR2dMckVQbk96WVJC?=
 =?utf-8?B?NEd5NUJaaHpjT3FtUTRpb2FmZHlkNGdVYUFkV05oYWpsREQrOWFhak04Ny96?=
 =?utf-8?B?M0hKNzBWVDArTy9FSkpEcHRLeGgvcnFtaFlOOUpnM1U3TzIwT1M1Skt6WW4x?=
 =?utf-8?B?aXc4QWpRQ3dPWERIMU8vL1Q4SENmeUNNckRXdlV5czNFVDRvR245UjdTRHdK?=
 =?utf-8?B?UUc0a2NYSTkxMjBQZjFTNU1pZzRpcU9sWFNxSVdLODJCenh3MGNFa1RHZXJZ?=
 =?utf-8?B?Q0JsSk1NYjlISVNMYWdkRnI2MXg3VUR0K2tka1QrWVJxYy84NWhSUXZtSCtv?=
 =?utf-8?B?NzFxa1JPMDRSWEpVOGhUQnZtOUpFM1ByRGRHd29vVmhnSUV2bjByWGxJdzVm?=
 =?utf-8?B?NlhpMHMyakpScytYK21NaFBNNXN5VThzMTVmLzJ1R3B0MGg0QVZYb3V2cEJG?=
 =?utf-8?B?UHdhcFl5ZkhqM3VrQndJTkRqY2c4bVAzNGxuY3ZLVlVVSTVYaUhwN0I5MENw?=
 =?utf-8?B?Y1JPZjJPMkRyUGtudzBHZHVjakFXeFdJd1dONlNWdzMvR1dDZytkOGovZUpa?=
 =?utf-8?B?SS85WlEydUNnclNCRERmUkw0N1hzanY4VXd1d3hHT3VST1JaejY3b2ZMVGdh?=
 =?utf-8?B?Vkl6M1NraGhUQ1VjWnhZZ3JNcmgrU0RpMUtuWlRYTjROT3dKbnBIS2tKNXNr?=
 =?utf-8?B?cTdlT3B2RjY5TGNUK3pYSDFxRDhoUENSL212WXJ5akZ1cTh5NWMzd1pCRW5s?=
 =?utf-8?B?T0sySVFsNnRTaUdYTFVEdTV6RnY2R3hJVlovMjhVeWJ4Yk4xVXdtZUJTQ3J0?=
 =?utf-8?B?UDJOMWtjS0hoWnROT0t4LzdVbms0blkzYXliTUpXK0Q5MEw0V3R6QnhIb3I4?=
 =?utf-8?Q?Pw0YQ7mb9/xTuqdY8xZ+MVqXj4MkcWIBLqUEpMpFQVuL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536096b6-3fd4-4d21-4a4e-08de3cb0d76d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 14:38:56.0558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x60I3oRhoLYcwisiqU7VhZMak23BMdZO2nXeljvdk1s0xK/E9nfBQj4ZKockHKnE+mJ4Hcx2fgBDkFWhULChQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6772
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

On Tue Dec 16, 2025 at 9:14 PM JST, Danilo Krummrich wrote:
> On Tue Dec 16, 2025 at 6:13 AM CET, Alexandre Courbot wrote:
>> When unbinding a PCI driver, the `T::unbind` callback is invoked by the
>> driver framework, passing the driver data as a `Pin<&T>`.
>>
>> This artificially restricts what the driver can do, as it cannot mutate
>> any state on the data. This becomes a problem in e.g. Nova, which needs
>> to invoke mutable methods when unbinding.
>>
>> `remove_callback` retrieves the driver data by value, and drops it right
>> after the call to `T::unbind`, meaning it is the only reference to the
>> driver data by the time `T::unbind` is called.
>>
>> There is thus no reason for not granting full ownership of the data to
>> `T::unbind`, so do it.
>
> There are multiple reasons I did avoid this for:
>
> (1) Race conditions
>
> A driver can call Device::drvdata() and obtain a reference to the driver'=
s
> device private data as long as it has a &Device<Bound> and asserts the co=
rrect
> type of the driver's device private data [1].
>
> Assume you have an IRQ registration, for instance, that lives within this=
 device
> private data.  Within the IRQ handler, nothing prevents us from calling
> Device::drvdata() given that the IRQ handler has a Device<Bound> referenc=
e.
>
> Consequently, with passing the device private data by value to unbind() i=
t can
> happen that we have both a mutable and immutable reference at of the devi=
ce
> private data at the same time.
>
> The same is true for a lot of other cases, such as work items or workqueu=
es that
> are scoped to the Device being bound living within the device private dat=
a.
>
> More generally, you can't take full ownership of the device private data =
as long
> as the device is not yet fully unbound (which is not yet the case in unbi=
nd()).

Ah, I completely ignored the fact that we can indeed have other
references to the private data! The fact that `unbind` works with
`Device<Bounded>` should have given me a hint, but somehow I blissfully
ignored that. ^_^;

I will implement some basic locking on the command queue so we can work
with a non-mutable reference.
