Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7324C605FD
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 14:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEB189906;
	Sat, 15 Nov 2025 13:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G9T5/Gmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012024.outbound.protection.outlook.com
 [40.107.200.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B2810E270;
 Sat, 15 Nov 2025 13:32:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUL0jjghVb2SkJDl1I0S9ydaMwMVkqIXnVDGmRDYocEt163u7Tk490v3/c7Ms4ZO9IRl3csCHJn6ojYKqfDktdL6fGkjfmRwK4xKcgZk2EUBiuVue/ZiiLEvrfv1PIkjnLziTTUnZbBuk5r/9pVyD7o8QaXT/23imjBro1fNdgZg2tSJtlErh6vIZALcEA/ZynrnNhXJ2lgMyfXixNgtOTVbsCWRvdpFHYFc8RguqVMv7EehouiFDhNG5ylXTbwrUOFaqaevGyIIGT5ji9+do65jU9xuCI26bJIV4wD4pROFamS7vKyVi/bp2H7C9/5pGIV0Hs5gEVTQ68jlcJ0VQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXCZaVsPFVOZGzP0IrbAgtNgT+/WArCHGhyG5bX2oBc=;
 b=CMcWitEVELeWOkfurK9zSimMjCvoqXeRkK3c9G5w85RUzT45y11aS5WR0C+eTjmItGl8uIhDSyOIL86WxxcegpwA5LH0dzflVt5DUi3sHTxVENLxAYlQTpZ2Ly6sKEbXgsaCtXUUI7yG8J/oZroTlFXQ+s7xQW3+7Tx2V2jValaoTvGcy3HfLLy7rMIViCYNFJo4W2vD+fwKAk19T65X+ofhOpjGU9z4x4JSX+IR60ui8d11JW7V1yWHbbwfGoDh5h7xPjywtkjaRPOio45ZvEFfx/ee0jhDZpH4QBan8pMbvJLhMVeSEE2hNXEajlSD70KNeE5Z1duGqP5+UBT9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXCZaVsPFVOZGzP0IrbAgtNgT+/WArCHGhyG5bX2oBc=;
 b=G9T5/Gmzsqz/oxz9+V6zUxECQisyPhpRkQn9sbzE9oAu4PX/aVuKJ0IW6Y0Lg0jKLYEU/R95gUKyewMwAOOJD/27islXyBolDtei7mcrYt5PA8VtwuqEDsJSPhcEX/znN7tvdrcKqQmygTCe9PGngdK8S33RCGgeUiNQQdsB0jsGUUQ4i40nQInbbzwcPLagEGjkgWAg5I5kg4Y2Z3a3tQ4A4TUzxgfTcnUGX0KDpTQwTp+rEtHQDKsdROIGs3EXqUIOjz90GL5PLU3aSo9wAe2PP0TbrfL8Jh/IPOK6HtCwGD3LzNCbz+goqJGOKV/fbUuyAen28w4Ualt2mydwCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB9089.namprd12.prod.outlook.com (2603:10b6:806:39f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Sat, 15 Nov
 2025 13:31:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 13:31:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Nov 2025 22:31:53 +0900
Message-Id: <DE9B0XPTIUC0.NKSRERTX9YI3@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
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
 <joel@joelfernandes.org>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v5 00/13] nova-core: Complete GSP boot and begin RPC
 communication
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0090.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 98336a28-b9ce-4d28-c7e5-08de244b5913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzlUbTY1R3Y0K2dNRWovKzE0ZC9tUmlsblFpSTNTTWcrQkdNbW8rODdwM2ox?=
 =?utf-8?B?c1NXNlkrUEJ4c1ZPWVNCVXBuS2wrM0JSb3dlNVhWb1U1N3pGNk42a0xldnl5?=
 =?utf-8?B?UTFuZThsTFdSTitaY28zZTFGMjV6amQ3bWNQdnBqdVNtaFZkR3F4N2ZaajF3?=
 =?utf-8?B?N1Nhei9BVUZwSko0SzYwV2ZCWkErSU8rc2o4OFA1RjFSOUtOdGJKaTJBSXNw?=
 =?utf-8?B?QzBFOVA3Umh6R2syUmtqbnlkdS9GTmhnL2FETE9ZN0xWQTZIRFpkL1RBM1lr?=
 =?utf-8?B?cGU5UGwzQ1pxUG4zcDNlS25uYzh0M2lvK2pkeUdPZjlhT0lKelVFcERNZUlR?=
 =?utf-8?B?NXBYQWljTTFsK3lyR1I0d1RmRjF4ZzNOZHVudGtYeExiakhUSGloVC8vZmdD?=
 =?utf-8?B?V1lEMTBlQ3k1cXFrVHkxaEZSd1F2Z1ZwSW5DL29qdzhpU2VLTjFrdS9uT08x?=
 =?utf-8?B?RUlXUVpGYkRKclg0emtuVVNzV095SjFaWXB4eFpLdGVUcmZ3eUg5ZTRDWEVO?=
 =?utf-8?B?enhwYXVpVUMxUTdaMDRqT1doRzVKaDIwWHVWNmJKRitmWTBQZjVad2dMNEFY?=
 =?utf-8?B?S25Ib1FnbjJUWHdvS3pYNlM0TFNnd2lnVHhaY202L0VRdVI3aHNncVBGcmVH?=
 =?utf-8?B?aTRhc05OQ2hub3hWaU9aOEoyY1ZzQkpqL1hlcWNsVWVwRkw4QVV3b3YwZ2VQ?=
 =?utf-8?B?bUFyYnlGR0RpMER6RHFIOFJNV3YvMWNBT0Rha3p0T1B5R2o2SGd2UTFqQUhs?=
 =?utf-8?B?a2hRZk4rRHk4bUdLeTFmdkIydjQvbmZYS214ZDcvR1BPc09xRVVoRml1ajl4?=
 =?utf-8?B?TFp0MDdLTHhyYVpsQStoM1FjMXVJcU4wWVQ5cEd4NDVQNXMrV0dCdnhXaXov?=
 =?utf-8?B?d2pGVXhkOVRidFlZVWVLYmhsNzBJZ3pNT1JOWXE4VXlLYkE2SVRqSW5XTTha?=
 =?utf-8?B?R212RjFsMnYrbFVKVEIzRzRxUDZNc1hXZXZuMWpnRjlXQWhkL085WlovaUZj?=
 =?utf-8?B?UXJvTndLZFBrbGhkRHZ3WjMzL25xYVhVWTJrTWdmdENpR3BzK0JxbEdtTXlT?=
 =?utf-8?B?Rmp2TFNGVlNnYU9TZFdkNnFHckhmTE1nRU9CY1Rja05jb1ptSnJpV21tRXZt?=
 =?utf-8?B?VmtETS81T2FIM0lBd2pEckdMRzFNa1hDbGZJV1FyV25mOG5nV0prQXIxUmgx?=
 =?utf-8?B?UkkxWmJGdjBTQWNOUDdzNkI3c0h1YjhlaWdNelZvSWdiT1VqdXAzdzR2Q1NN?=
 =?utf-8?B?YzlCbEJKZzJQdVVIdytqM3RtNmIrcHBjOFgvdUI2cnBlTy96Mi8rZjViS3RM?=
 =?utf-8?B?SGFTRmkxYTdPTHltQkxVQnFPKy82dFh2S0VzOHBuS1MvNjhtOWZrdk82R3J6?=
 =?utf-8?B?cCt3cTNLeHMyOFk0WWo1ekRSenFKVTNibWxNNmF4RmtZdGZtVjBxOVVPZzRS?=
 =?utf-8?B?L0U5M0JzUkU1aWlhbW95QXBLWW53ZnRtbGJocWxvVnRHb3I1WTYvT1JteDl3?=
 =?utf-8?B?OXBnTnNxY09uSnppb2w4KytvazlNdGpmWHdOWk0xRlhBTlpjSnY2MXE3UzlK?=
 =?utf-8?B?eVB6TlFuQVpkQ3lrems1QUgvbzEzRjltemk4dzJrbVZVcHBkaDQ4WVF5czI2?=
 =?utf-8?B?Z1plNWRvOTB4TDhQbS9WazBFQkxiR1ZzKy8xaWJEeUtxYy9CTUVnU0VkYm9k?=
 =?utf-8?B?SGN2Y1pqaU9pK3lvcnFnUkprSU5wMVJSUmxCVjJjZ3VsU1VqWGF5VzZmRGM1?=
 =?utf-8?B?MkZ4MjI2ZHpQd1ptWDJFTU84WDUxRlAvUGQwb2N6enJkS1JSQWpZYkxUaS9Q?=
 =?utf-8?B?YWhLeU43ejl3V3VZQTN4RE9QalQ1YzNLMEZrQ0oxNzRrZldFLzBsMHZsWld1?=
 =?utf-8?B?Wm5ONEFFOUFEaVIwV0x3MFBmM0IwME5xY1dLb0hrRmgzNmdtZzJDUW4vUklI?=
 =?utf-8?Q?aiz0IuIxDTg1IsHuRhJUqkC+8+WgChBI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3hOZ0pqTEdZcHFKQU5tM0djQ2JiNkYvSW1RNlUrMG5aVVp1UWhvY0ZPSG43?=
 =?utf-8?B?T1pINmxQZTB4NnJKUGF3Y2RiSlNoQTJqQzNwckVueXRHS1cyZjMrQ01ESW9u?=
 =?utf-8?B?bEt0YVhlbTZUZGJZdmVrOVRXeUJvVm9lNFZOMW51N2l0NFZacTBwd21JVlJT?=
 =?utf-8?B?dE5GTHdpUWQ1YVkvUmczOHMwaHJTSnZYWWxmS3JUQW5DbEZmaTdrM0tneFFk?=
 =?utf-8?B?Ri9rTG5YZDhvV2puVjhvcjViTVZ4VHhkQTA2WDZvMnBFQ3NudUdmREkxMGZs?=
 =?utf-8?B?SUp4Q0pKOTdWQTBDUmlTM1FGTXN3Ujg1Zm1IT2QrV3E1clZDUVVnMm5tVDUx?=
 =?utf-8?B?emFLdWErdnE1STNQM3AwdGZvdmxmb2tQeWs2MTl0T3Nwa3NYcnRxbk1vT0Nx?=
 =?utf-8?B?ZXdzNkhBTkFCWmlhS1BxMVVzaFB2aUJGalJxUjQvZ2RBbDJ3aDB1Z3didGh6?=
 =?utf-8?B?Z2xqWVdTQVBYU0xGUFZpV0h2a1AybGFMY2ZMSDlkZVVOeWpJVFI4R0ZwNncy?=
 =?utf-8?B?M0xqcUtVUzVmME84WUczWlpYNENySWRHWDAwSTVuMmwrUldsSDlBMFhJVUFi?=
 =?utf-8?B?N1BtVEdYT1pQR25LMFA0b0hIRU50RUVNRFRCVHhjSjVOWG5VTEs1ODR5aVpn?=
 =?utf-8?B?QkIzNDRQaE9vWGlQblJSdHZ0eGpDT3lhQnhrVldjY0RyQ3p5ZG5UbkhFN0I1?=
 =?utf-8?B?NHAxU2RpaC8yc0RHaURZOWxQVDR2bVBaNHBqNStaQ2FDeG16ZkZVUUNid3BR?=
 =?utf-8?B?YTVtM2JabysxbDY3YXg3R1hHMGpxUlBQdUF6QldSdXdCZlA2dWg1TnZ5YTZ1?=
 =?utf-8?B?ejlFTVFKY0pZVUo3b1VSREJFWkk1a3JYamZ6UmY1TVFleDVJeWF1V2EvT1pN?=
 =?utf-8?B?UXF5WlRocGNPdElKZmdHM01pbWNwcnJ6RnR6UlNEeEZnUkJiMVBidUw0ejMx?=
 =?utf-8?B?eGtlOWZVRkxKcGxCZFFkRk9HbG9wWFBPMU84elA2RmhOT2tNR25ZeDUyTVJp?=
 =?utf-8?B?QUJHWk1kd1FaUDFWeUdDR2xRUW5CNCsxYWQzR1gxUm43Z1JKcGtBeEZyVGdI?=
 =?utf-8?B?bTE1Wk12ZUxWeUdMNktJL1AwdTNTVEM2US9wTjJnNGZOQUR4b1lkNGFnSzcv?=
 =?utf-8?B?RWovZThVVkVXTCsxUHY3eG1jSUZSUGFtSlpYYWxCV1R4d2tTYlFZWlhUNFJD?=
 =?utf-8?B?T1JaMDR5VXJVRVE3ZTc4UDM2c1o3ZzNwZnB6M3VoUU5Vc242U1FjbVVwSjVy?=
 =?utf-8?B?UzR3WUZvdGtYSzhjdU5oVFVVL2hyUDJ0VStOellDMHhDYm43Z0FOU1d4ZUJU?=
 =?utf-8?B?WTJXUlFSeklhTXk5b0VpaDZPZmNHZkZ3R1I5bklPRGlob0h5OTUycEdncldy?=
 =?utf-8?B?WnJhZmdGc1UyTFZscEgzK1BBMUtva3h5ZVJvaTZlMjJrZDVFZGFFdXZXT0JE?=
 =?utf-8?B?czB3MkhRN1ZwWkdNOXVyeVY5NHdZdlpseFhrbDdYOWlHaXZVL0UvZTk5emZK?=
 =?utf-8?B?d1c3NmVvMnRFMEV5UTJMK2Q1L0lxL2lxS1dvTTQ4amNBK1JEODJkZUdaRFUv?=
 =?utf-8?B?MkdVdGtXM28yTFlwMmwzVjVuWmxiQmlVNnlYbVFpVWlMeG56RVJoWFlQQ0Nz?=
 =?utf-8?B?MXJ2SGZROTNFM1EydGtGeWdJbldCdnNIcUVJMHhYcDRYVUhtUVM5UndzQndE?=
 =?utf-8?B?QXoya0FzVzZEUUEvV2YrbEdveXowM29QYm8zaXhtZ1Nka0s3NEN0N1ViWGt4?=
 =?utf-8?B?cFZJOXN2cjlOOW9KYVFLUTNHOXBBRVQreUVFRXdKUml5QmN0OGtlSHN1SGRP?=
 =?utf-8?B?Y3NaTG15dHQrZGNMSFJ2SElUY3cwYVdvYlp3LzlENnhaT1BRMDB4ODNHWGNj?=
 =?utf-8?B?c0laOHJQeGRpRW9JeGFOT3RPUU5pSnlJV2Nub1NnMENBNUh3L1N6ekpUSHZx?=
 =?utf-8?B?L0pEQTNpWjNVbmdvMUxjWG5mNncyNVh3czl2NXBPTFlKTnEwbEM5OHE4RTJO?=
 =?utf-8?B?NWNoWEtVVks2STZJek9MWVJGeUJQU1dFdUp4dEplb3V5eXR3VW5mbHlYQ0Vo?=
 =?utf-8?B?NHBkZGxZYVkyM0VrLzNFTmQ2ZUhjTHA1dlRwVHhNQXdPTDQ1R0V0MG5rZWFz?=
 =?utf-8?B?cXpNMnZLanNvZ0NFQXhHRURYTk5qblJwclVhYUptNEk0VzNGVnk0SFFpLzlP?=
 =?utf-8?Q?pdaooG0bll4e3zyWQkK5ki8c2UPUgfFhiONs4mrTae4g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98336a28-b9ce-4d28-c7e5-08de244b5913
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 13:31:57.1123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NaUElBIRiJYHKvSzcU1QC94Z30q6Kg1wQC+RTDp5vv7LsOiMXY89VwYwvb3zxZw6FXZ42R1bE0gFtu1sxjAU2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9089
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

On Sat Nov 15, 2025 at 4:55 AM JST, Joel Fernandes wrote:
> Changes from v4 to v5:
> - Fixed 2 import nits.
> - Squashed a fixup to adjust GspStaticConfig (13th patch) to use wrapper =
instead of directly using firmware bindings.
> - Rebased on drm-rust-next.
>
> These patches a refresh of the series adding support for final stages of =
the
> GSP boot process where a sequencer which inteprets firmware instructions =
needs
> to run to boot the GSP processor, followed by waiting for an INIT_DONE me=
ssage
> from the GSP and finally retrieving GPU information from the GSP.
>
> The entire tree can be found at the git repository:
> git: git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
> tag: seq-v5-4
>
> Tested on my Ampere GA102 and I see in dmesg:
> NovaCore 0000:00:07.0: GPU name: NVIDIA GeForce RTX 3090 Ti

Pushed to drm-rust-next with the changes I mentioned inline, thanks!

We will definitely want to make our interfaces evolves some more
(notably the command queue), and there are still a few nits to address,
but we have been kicking the can down the road for quite some time with
this one and in its current shape it provides a good foundation for the
next stuff to build upon.

The GSP is now initialized - not that it does anything beyond telling us
its name, but it's a milestone nonetheless! :)
