Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8ADBFB6F4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 12:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6D910E73E;
	Wed, 22 Oct 2025 10:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fkDiJyH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012061.outbound.protection.outlook.com [52.101.48.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472C010E73C;
 Wed, 22 Oct 2025 10:41:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVaG4hf0AyceBZ0M+qzzV94yma27WUq5y/IP2Z0Wd/C54P3v+55RIV0k1mLhCr5wwK+LYQ/wbMfvdR6kB8biqnm1S1yEf+3qCawxUDfFnsGSHwT+thG2ChuVgLhVFaAQEoeUkbgyxNnOMcr4In+aeD/UYK8ubJ/31yLbh/W7xrIooh1nH0E2/inQEYzkCd1h9oj3cyfMiJhkePMI72xAoC/IxVXXbfRDae3ojHS93x5Hnm343GdHdlHqGXb6CnpIyiSKm8rjveThzd6wJTm78e+1MIl5SmP/XH6hZqXsB435pQnVuj3/Q2zH62ONOTX0RfISxe51NTNJrrR7i7vT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyzhyUh300Rb6hHa5QgLZgc0gxfCjFiaeE16juwALWI=;
 b=V7rdXBsXxSJsmujyGepx7ZMlaLjoItde3BkQy7Z2U251lZv89f/2N/8Es4Mlp/yI3RrIpnNW4ZXDe8zB6NFY4qEiWyK49Cn96ApNPnsCMeBUfDmKfFhLnKaHmVll98uWr5TYepDSbwXJwcAJYTJeQGYnAcfvwZUD81QB/QL6VU5ACsblaGRA9pdDREglWK9YyDsR3xhvT/LG1+QJS7qyQ83hV4meS9LZDk+zNx5DN2WtcaAze8b22UMR1QAqouFZLQ8RV3EzHXeQTN2kO4KNzwsIgqtOjHCe8VIM0yGjwN7xVhT60br3tilFtYRnMLkQmGhYFwnVQL5NwFcz7zGPQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyzhyUh300Rb6hHa5QgLZgc0gxfCjFiaeE16juwALWI=;
 b=fkDiJyH7r74bBGTxoZMopiSSw4hSoVQEQF9livFTX8GPK+oVIjmMsYM3uMlhi7Ne3/UsTXw5kOx+EtKT+mVIbMRoDggX6d7RSq7l7sFl9Hwtvr6l8iaqEoUgQy1K7hLv9uTfIjhJ3MOL6CLQ2QTdrkH0/qDgpgocRjXAj2UKuQ/Hnb6bTdyJ97S/bD88lCItqZNlTjfzippMeRJagECuFbBohmoj1tVlPqRymGmq5iB8c4yWNaTtMRZgs5wnkbhK8qBFXYGu7boU6GgcJ9W9sEy8vb6rB3r3yFDi0a5+dl/S0u/SuHax6FGthjXfC9QicJuxL0HytXsH/aIxqFULWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV3PR12MB9185.namprd12.prod.outlook.com (2603:10b6:408:199::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 10:41:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 10:41:17 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 19:41:13 +0900
Message-Id: <DDOSD746PCSR.CNAYZSTFR9XR@nvidia.com>
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
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] nova-core: mm: Add support to use PRAMIN windows to
 write to VRAM
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-7-joelagnelf@nvidia.com>
In-Reply-To: <20251020185539.49986-7-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV3PR12MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bba76ff-635b-4aff-03bd-08de115787a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?am1PaGFydEtPK2Zwd0xTQjFhSmN5bUlCeEhORld2OHMwTTREOEdjR1haZmg0?=
 =?utf-8?B?UFBUOUZ6aVFUVllodFJRN1YySzBtbHVOTm5saTQ1LzdRUFllR3BqaXNYOURw?=
 =?utf-8?B?UDZWSzdFVktjdHg4QmEzMnF6VXlwVnJhYUpsT3REbmIyNXdMZGJ4Zi9RMEZp?=
 =?utf-8?B?S2xpVDZZdnNJRU01N1RwTFkxc1cxMWdEZkpKckRYY1VYSkxreXRIYjFXcDUv?=
 =?utf-8?B?QUpYbUVONEhmMDRXTm9uVGRlTmhpMzVBejkvNjVxdzZDdWFLcVNPSk1MR1hG?=
 =?utf-8?B?MkkrRjdPV3MxcWVUSHFpNDczWjQ2bkkya1llVngyRkdrem1vN25xTngxZERP?=
 =?utf-8?B?bUN0UVFWTHZWNnpDMmkwcWU5clRnWEplVWVweUJ1L09raUxYNGVUVTRibDJw?=
 =?utf-8?B?cHhsWTE5VUFqb0w1dFd2QytlNU44MnNEWlIyY1NEeVdZblJmUEdXeWQ0SGUv?=
 =?utf-8?B?T2NKZDhYelhyc29acll3M1pwc2oweEl6RnV1V1kyMFY4Wmxyc1JjTlpQRWdU?=
 =?utf-8?B?Mk0veEE1Z0tieFQzUmNmTEtwTVdRRGFsQmFRelpmTFR6RVVFVUI5d0pqbkhq?=
 =?utf-8?B?aUFyTGlLcmxTeFNSMDFOeFJINFp1MTRqaEVJMzRsV21lc1NvSkFPVm9xbG9m?=
 =?utf-8?B?TVlzRHY0QU82Nld4V0F3MFAvUWorSitFdWY5NjhkVWVmWUtWNnBadDIyTVFB?=
 =?utf-8?B?eGZvaG5vZzZqeFk1eXplSVlKOC90N3lqTFdXMjR0TlZqa1o5bXRTTVBPRldS?=
 =?utf-8?B?RC9ORnBJVStreFpTK2dWMXJnVTdXY0RRZGV6Rm9oRnE3MWlzV29la2ZMSUw1?=
 =?utf-8?B?ekZQNFpiNTdqR3Foci9zOGR3aTgvRi8xZDRIVzNtYVNHdzV3VjY0UjRyZHgy?=
 =?utf-8?B?NFUwYjJ4aDB0c213bGRQRlJHalp5UCt2NjYyVzhvVDBuWVJ3RE54TXhKSUVU?=
 =?utf-8?B?K04yeGZTd1hOOWE5akFxYzVRbjk3OGVBZDlXd0tNeG96QmRLQXZERG4rblU4?=
 =?utf-8?B?Z1BHWEdUK054MXdzY3E5dDloTFFMN1JYWG1LZC82SHRSS1N1R0t3aDhWU3BM?=
 =?utf-8?B?OWt4enB5VlVZOGZtWXZ1OVJ5d2NWK0haOExkcFZSdHlVak02NHovR0d1Qk8x?=
 =?utf-8?B?V0RhMmYra21tRm4rQmVrR3EwRkRNTmlpM2QvUnVMV1pUbmRQTjFrNFV4ckg0?=
 =?utf-8?B?dG5YY3N3dTNxUGxhK1FZUzk3YmtSQ2lYWTVqRlhtYzloY0JYMW1yc2luY0x5?=
 =?utf-8?B?R3RZR3pjOU96Tm5WaVg2a09iSkhaczFJaFlrcmNrR001UTlibktsNXVsbFBz?=
 =?utf-8?B?ZUNEMVVENW1yK24rNzRCM3NiMXVVejFibmxGVHg3S1hWQS9vK1Jud0pXbmcz?=
 =?utf-8?B?S211bEJkRXh0OUhvSU1nVlN1NFdDWld2UDh5RlFMc3lUV1R4dGNKaWc0bFRS?=
 =?utf-8?B?UkxQMFFNc2RhWHV1eU05KzRwS0piSWp2blB6SFhZbWZEY29UQW9Fd3RzSnQ3?=
 =?utf-8?B?eUhvVXV4NlhYVVQ0b3V0RklLeE1VMjVDTmZiOTFDMUVaa0MvZmI3YmMwTTg1?=
 =?utf-8?B?L3FGcjNBczhXek0yU08xQ083VDVYaGVjbVo3TlNNVFFjc1BaQ3grbDVPS2VN?=
 =?utf-8?B?bG1DK3pvcXNjSXN1TTBuWlNXZmJGaS9GY1Q2RWpNeWJvcVRBa0NVNnpUMldL?=
 =?utf-8?B?UldzUTRnTTdpejF1Zys5U2tIK0pEcFY2a1U5WXZ2d0xabWRGcFlYVlltRXVo?=
 =?utf-8?B?NEdqRTgwWkFBQzJPNkhPeUhSeXRPVnJIRjhUY281QXVMNmdnNlh2Nmx3bUo3?=
 =?utf-8?B?azViblhNQkp6eWU5MncxZ1g1YzdnYU55cmRkcnB1cTByV0tZSk9ZYWF2M1Vn?=
 =?utf-8?B?cE0vWUdxL2c5dFpxS0Z0MWg5UkFOZ0poZzNDcVVLWmM1dFBxWDFzOHFydTdS?=
 =?utf-8?Q?gfFJOOALNIUl227n+nNlxgU+UAdyBXVQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFYvSUQxM2p6T09zL3VNTW1ndEpZbjVTMVB3L1kwdGgvQ0dVWVk4eDE0NEgz?=
 =?utf-8?B?K1RMZDBEQ0RqeWE0ZFRFd3Z0QzNJWEVEODlKSHBRMnhiQ3JtMDduZjIzOXBZ?=
 =?utf-8?B?NW9RbkFPZmNNRzRVcktVNHVzaGRzNmMvOC9yaXRPZ3MzOUMveHpseDlvbFpR?=
 =?utf-8?B?SVFnU0N3RjVOR0kzRDVlRjRZbmlGRGZhSDZZSStYSVVtVDMxYmVYWHZxaXJJ?=
 =?utf-8?B?UTkxUHB6NCtXWHg5eGh6NlZoaGg3eUJyVUt1TG9qL1RxTnhwYzZkbEF4eS9Q?=
 =?utf-8?B?Y3pRODM0THRuenhFdXRteGNDWkJVNThWNVA0VHRMQU8va05RdE5Xc2lHK21s?=
 =?utf-8?B?QWdWNDBoWHZLdmd4TFdDVkw4VFIrd2ljTmVtaWVVajVPTVVJQzZzSm1uMGpQ?=
 =?utf-8?B?bk5vbjJZK1RLQU1aZnl1aGQ4M3Z2a3gvZWxqVU1jMytzbnB2eitWV0E4R0c5?=
 =?utf-8?B?Nkx1c1k0L1g2c2t6TDVWaHVibVY0NkZtZVhlVElEVFBUMVlEMENXUXJIRiti?=
 =?utf-8?B?R2tKN05PRjRRT2F6U0FFdGhvWFN6MVZydzVDQlQ2K2lGK1o4R1FyUlF2TWtt?=
 =?utf-8?B?dkJzKzE2SlNpQVd1bXJ5M3FzdTd3UVMzQlVmeEdObThIZmpjNFNPbUhtWmMy?=
 =?utf-8?B?aG95TFRWTUpHSUt0NnNEWENiRkhjbGZUSjFNK0lBNmFKbEFoNnNGMW5HQXYv?=
 =?utf-8?B?RnFLM0N2QmdXZFFscVFTZWdaZU9zNndQM2NENjVPd081TTlCYW5VcVB3clgv?=
 =?utf-8?B?ZWhoenh1V0NtOWxKaDZWYWc3dG5WVkhZQXlmalc1K3cwMVQ0a01kdHR4cS8z?=
 =?utf-8?B?WnJVRGtjcHh3eXpKSUxlMXJySXYrVXJNa3dVNVNhZnNBcE01TU5qNm5wQkM4?=
 =?utf-8?B?SFB6TUNmTHJjRERtYytsMHk1OUxIUnFOcVUwMVVtTE5Qb0lSdWg1VjBiQjJj?=
 =?utf-8?B?d0c3Z0lsMmxWaC85Yys5Yk11djNUZStzV283aGpzanZJc2JtRG00Q29VUTBj?=
 =?utf-8?B?Zm0zTzFlVTBSd2hvOGlGNktCdHBxbkpNQ0pqOUpScFVEdlBkK04yc1Z1cGZY?=
 =?utf-8?B?MURpcEZsYU5oWkRBb1FFOGszaENrcmpVb3lYOGlOZk03R3dydTYrdnFvejFo?=
 =?utf-8?B?OG96VE1Eays3cmpFVC9lT2FsMjJEWnR2U28ydHZzVUR2Vi9zT2t1clJ2VnBj?=
 =?utf-8?B?ZVdaMytXOGhuUHlXdm5SbGRHbWxLVWpwNEpNSXN3Tlp6UXVLWDZjSUxRcWtD?=
 =?utf-8?B?ZkwxZ0xZQjBqTTBxRkNHYkNYYWs1NHNHVVJOOTY1cGdIZjV5WTV0WEQrNWdx?=
 =?utf-8?B?SWt5eDV0eXR1dTdtSEV2MlZtK0dhK1BGbjRFUXVZNWZpZW9BdklwMFBGM2lT?=
 =?utf-8?B?c1RPaktaT3QzYnhCc1poNW1YOC8yeEdQTlB3dStFUTQ5cWhaZmZLTkhVWnRk?=
 =?utf-8?B?TXZnQlVVTkY2QjluYU5WUzlpK054SlBHVGcrc0QyRWEyeUdEcWMrZlVROXEr?=
 =?utf-8?B?alpWUE9oVHBUTjh6MlRod3VBb0cwcW9EcjA2TTNld0l6ek43UjI2Q2xQSng0?=
 =?utf-8?B?Umc1S2IzbHVpR01LVlNnUWVuc1c5bGxvT1JxL2lTS0tXek44MXlLNWRaRnBL?=
 =?utf-8?B?V0E1ZnpZYWtvdTlRc3ord29tZkNkVTZZOXBDKzJ4NG95WkdURU9rMHJ5UjVQ?=
 =?utf-8?B?Wi9LSVBIM0wya08wS1d5YklqWHo3RmJodkF3b016bnhmNXMzMkMwNzQ0bTlF?=
 =?utf-8?B?Q1BKdmxwQzNTOXJieDRDTjBRclg3TjhBT2pwcndDVU1sSGtxaDhudjVKT2Qz?=
 =?utf-8?B?SFBwZGZMcGVvbDZUclV4L2pCNGZsN0xEUWtKZE4wbmNtRzUzWUluTHRQL0o2?=
 =?utf-8?B?OHV1MGRQS24zVzkzNzN6SEoxaWJsSkx0MlFnRUhZbmhjRWJKUG1nTXc2T2dV?=
 =?utf-8?B?SksxWUFlUFdXZUgzSkh0MmgxdmFTdmhHWFpDWVBPYmhvSWFnbWRiZXV5N1BL?=
 =?utf-8?B?SVRkeUgzVm9kdXRHT3pRRTBTMGUzb0pwWUxFVlp1MXFCd0ZjUW1XMnREVzY1?=
 =?utf-8?B?UFRRMzNzczZITjFmUk4vZFh3T2g3UjQ2eHZoaUVuTTRlZE1NenZRTEdSSjJW?=
 =?utf-8?B?N2VhQUxiRkl6R3FXbHczNkpOUnhRRkgxZkU4eDBtRzlpS1FiMy9oRDJ4Yzlt?=
 =?utf-8?Q?8TDOJy73JcykSWV2ECR2O+5SnOEHoN5l4d1TYheqb0Hi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bba76ff-635b-4aff-03bd-08de115787a7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 10:41:17.1683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBkwa+48ihHb1Ycveciu8mJG1wfD1v3YRrG7QHaIG89sZdJ3aZJRNEQYxqE34tBy6nkvQrzB8BsXkpnQYAbpuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9185
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

On Tue Oct 21, 2025 at 3:55 AM JST, Joel Fernandes wrote:
> Required for writing page tables directly to VRAM physical memory,
> before page tables and MMU are setup.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/mm/mod.rs    |   3 +
>  drivers/gpu/nova-core/mm/pramin.rs | 241 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |   1 +
>  drivers/gpu/nova-core/regs.rs      |  29 +++-
>  4 files changed, 273 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/nova-core/mm/mod.rs
>  create mode 100644 drivers/gpu/nova-core/mm/pramin.rs
>
> diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/m=
od.rs
> new file mode 100644
> index 000000000000..54c7cd9416a9
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mm/mod.rs
> @@ -0,0 +1,3 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +pub(crate) mod pramin;
> diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/m=
m/pramin.rs
> new file mode 100644
> index 000000000000..4f4e1b8c0b9b
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mm/pramin.rs
> @@ -0,0 +1,241 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Direct VRAM access through PRAMIN window before page tables are set =
up.
> +//! PRAMIN can also write to system memory, however for simplicty we onl=
y

s/simplicty/simplicity

> +//! support VRAM access.
> +//!
> +//! # Examples
> +//!
> +//! ## Writing u32 data to VRAM
> +//!
> +//! ```no_run
> +//! use crate::driver::Bar0;
> +//! use crate::mm::pramin::PraminVram;
> +//!
> +//! fn write_data_to_vram(bar: &Bar0) -> Result {
> +//!     let pramin =3D PraminVram::new(bar);
> +//!     // Write 4 32-bit words to VRAM at offset 0x10000
> +//!     let data: [u32; 4] =3D [0xDEADBEEF, 0xCAFEBABE, 0x12345678, 0x87=
654321];
> +//!     pramin.write::<u32>(0x10000, &data)?;
> +//!     Ok(())
> +//! }
> +//! ```
> +//!
> +//! ## Reading bytes from VRAM
> +//!
> +//! ```no_run
> +//! use crate::driver::Bar0;
> +//! use crate::mm::pramin::PraminVram;
> +//!
> +//! fn read_data_from_vram(bar: &Bar0, buffer: &mut KVec<u8>) -> Result =
{
> +//!     let pramin =3D PraminVram::new(bar);
> +//!     // Read a u8 from VRAM starting at offset 0x20000
> +//!     pramin.read::<u8>(0x20000, buffer)?;
> +//!     Ok(())
> +//! }
> +//! ```
> +
> +#![expect(dead_code)]
> +
> +use crate::driver::Bar0;
> +use crate::regs;
> +use core::mem;
> +use kernel::prelude::*;
> +
> +/// PRAMIN is a window into the VRAM (not a hardware block) that is used=
 to access
> +/// the VRAM directly. These addresses are consistent across all GPUs.
> +const PRAMIN_BASE: usize =3D 0x700000; // PRAMIN is always at BAR0 + 0x7=
00000

This definition looks like it could be an array of registers - that way
we could use its `BASE` associated constant and keep the hardware
offsets into the `regs` module.

Even if we don't use the array of registers for convenience, it is good
to have it defined in `regs` for consistency.

> +const PRAMIN_SIZE: usize =3D 0x100000; // 1MB aperture - max access per =
window position

You can use `kernel::sizes::SZ_1M` here.

> +
> +/// Trait for types that can be read/written through PRAMIN.
> +pub(crate) trait PraminNum: Copy + Default + Sized {
> +    fn read_from_bar(bar: &Bar0, offset: usize) -> Result<Self>;
> +
> +    fn write_to_bar(self, bar: &Bar0, offset: usize) -> Result;
> +
> +    fn size_bytes() -> usize {
> +        mem::size_of::<Self>()
> +    }
> +
> +    fn alignment() -> usize {
> +        Self::size_bytes()
> +    }
> +}

Since this trait requires `Sized`, you can use `size_of` and `align_of`
directly, making the `size_bytes` and `alignment` methods redundant.
Only `write_to_bar` should remain.

I also wonder whether we couldn't get rid of this trait entirely by
leveragin `FromBytes` and `AsBytes`. Since the size of the type is
known, we could have read/write methods in Pramin that write its content
by using Io accessors of decreasing size (first 64-bit, then 32, etc)
until all the data is written.

> +
> +/// Macro to implement PraminNum trait for unsigned integer types.
> +macro_rules! impl_pramin_unsigned_num {
> +    ($bits:literal) =3D> {
> +        ::kernel::macros::paste! {
> +            impl PraminNum for [<u $bits>] {
> +                fn read_from_bar(bar: &Bar0, offset: usize) -> Result<Se=
lf> {
> +                    bar.[<try_read $bits>](offset)
> +                }
> +
> +                fn write_to_bar(self, bar: &Bar0, offset: usize) -> Resu=
lt {
> +                    bar.[<try_write $bits>](self, offset)
> +                }
> +            }
> +        }
> +    };
> +}
> +
> +impl_pramin_unsigned_num!(8);
> +impl_pramin_unsigned_num!(16);
> +impl_pramin_unsigned_num!(32);
> +impl_pramin_unsigned_num!(64);
> +
> +/// Direct VRAM access through PRAMIN window before page tables are set =
up.
> +pub(crate) struct PraminVram<'a> {

Let's use the shorter name `Pramin` - the limitation to VRAM is a
reasonable one (since the CPU can access its own system memory), it is
not necessary to encode it into the name.

> +    bar: &'a Bar0,
> +    saved_window_addr: usize,
> +}
> +
> +impl<'a> PraminVram<'a> {
> +    /// Create a new PRAMIN VRAM accessor, saving current window state,
> +    /// the state is restored when the accessor is dropped.
> +    ///
> +    /// The BAR0 window base must be 64KB aligned but provides 1MB of VR=
AM access.
> +    /// Window is repositioned automatically when accessing data beyond =
1MB boundaries.
> +    pub(crate) fn new(bar: &'a Bar0) -> Self {
> +        let saved_window_addr =3D Self::get_window_addr(bar);
> +        Self {
> +            bar,
> +            saved_window_addr,
> +        }
> +    }
> +
> +    /// Set BAR0 window to point to specific FB region.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `fb_offset` - VRAM byte offset where the window should be posi=
tioned.
> +    ///                 Must be 64KB aligned (lower 16 bits zero).

Let's follow the rust doccomment guidelines for the arguments.

> +    fn set_window_addr(&self, fb_offset: usize) -> Result {
> +        // FB offset must be 64KB aligned (hardware requirement for wind=
ow_base field)
> +        // Once positioned, the window provides access to 1MB of VRAM th=
rough PRAMIN aperture
> +        if fb_offset & 0xFFFF !=3D 0 {
> +            return Err(EINVAL);
> +        }

Since this method is private and called from controlled contexts for
which `fb_offset` should always be valid, we can request callers to
give us a "window index" (e.g. the `window_base` of the
`NV_PBUS_BAR0_WINDOW` register) directly and remove this check. That
will also let us remove the impl block on `NV_PBUS_BAR0_WINDOW`.

> +
> +        let window_reg =3D regs::NV_PBUS_BAR0_WINDOW::default().set_wind=
ow_addr(fb_offset);
> +        window_reg.write(self.bar);
> +
> +        // Read back to ensure it took effect
> +        let readback =3D regs::NV_PBUS_BAR0_WINDOW::read(self.bar);
> +        if readback.window_base() !=3D window_reg.window_base() {
> +            return Err(EIO);
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Get current BAR0 window offset.
> +    ///
> +    /// # Returns
> +    ///
> +    /// The byte offset in VRAM where the PRAMIN window is currently pos=
itioned.
> +    /// This offset is always 64KB aligned.
> +    fn get_window_addr(bar: &Bar0) -> usize {
> +        let window_reg =3D regs::NV_PBUS_BAR0_WINDOW::read(bar);
> +        window_reg.get_window_addr()
> +    }
> +
> +    /// Common logic for accessing VRAM data through PRAMIN with windowi=
ng.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `fb_offset` - Starting byte offset in VRAM (framebuffer) where=
 access begins.
> +    ///                 Must be aligned to `T::alignment()`.
> +    /// * `num_items` - Number of items of type `T` to process.
> +    /// * `operation` - Closure called for each item to perform the actu=
al read/write.
> +    ///                 Takes two parameters:
> +    ///                 - `data_idx`: Index of the item in the data arra=
y (0..num_items)
> +    ///                 - `pramin_offset`: BAR0 offset in the PRAMIN ape=
rture to access

Formatting of arguments is strange here as well.

> +    ///
> +    /// The function automatically handles PRAMIN window repositioning w=
hen accessing
> +    /// data that spans multiple 1MB windows.

Inversely, this large method is under-documented. Understanding what
`operation` is supposed to do would be helpful.

> +    fn access_vram<T: PraminNum, F>(
> +        &self,
> +        fb_offset: usize,
> +        num_items: usize,
> +        mut operation: F,
> +    ) -> Result
> +    where
> +        F: FnMut(usize, usize) -> Result,
> +    {
> +        // FB offset must be aligned to the size of T
> +        if fb_offset & (T::alignment() - 1) !=3D 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        let mut offset_bytes =3D fb_offset;
> +        let mut remaining_items =3D num_items;
> +        let mut data_index =3D 0;
> +
> +        while remaining_items > 0 {
> +            // Align the window to 64KB boundary
> +            let target_window =3D offset_bytes & !0xFFFF;
> +            let window_offset =3D offset_bytes - target_window;
> +
> +            // Set window if needed
> +            if target_window !=3D Self::get_window_addr(self.bar) {
> +                self.set_window_addr(target_window)?;
> +            }
> +
> +            // Calculate how many items we can access from this window p=
osition
> +            // We can access up to 1MB total, minus the offset within th=
e window
> +            let remaining_in_window =3D PRAMIN_SIZE - window_offset;
> +            let max_items_in_window =3D remaining_in_window / T::size_by=
tes();
> +            let items_to_write =3D core::cmp::min(remaining_items, max_i=
tems_in_window);
> +
> +            // Process data through PRAMIN
> +            for i in 0..items_to_write {
> +                // Calculate the byte offset in the PRAMIN window to wri=
te to.
> +                let pramin_offset_bytes =3D PRAMIN_BASE + window_offset =
+ (i * T::size_bytes());
> +                operation(data_index + i, pramin_offset_bytes)?;
> +            }
> +
> +            // Move to next chunk.
> +            data_index +=3D items_to_write;
> +            offset_bytes +=3D items_to_write * T::size_bytes();
> +            remaining_items -=3D items_to_write;
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Generic write for data to VRAM through PRAMIN.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `fb_offset` - Starting byte offset in VRAM where data will be =
written.
> +    ///                 Must be aligned to `T::alignment()`.
> +    /// * `data` - Slice of items to write to VRAM. All items will be wr=
itten sequentially
> +    ///            starting at `fb_offset`.
> +    pub(crate) fn write<T: PraminNum>(&self, fb_offset: usize, data: &[T=
]) -> Result {
> +        self.access_vram::<T, _>(fb_offset, data.len(), |data_idx, prami=
n_offset| {
> +            data[data_idx].write_to_bar(self.bar, pramin_offset)
> +        })
> +    }
> +
> +    /// Generic read data from VRAM through PRAMIN.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `fb_offset` - Starting byte offset in VRAM where data will be =
read from.
> +    ///                 Must be aligned to `T::alignment()`.
> +    /// * `data` - Mutable slice that will be filled with data read from=
 VRAM.
> +    ///            The number of items read equals `data.len()`.
> +    pub(crate) fn read<T: PraminNum>(&self, fb_offset: usize, data: &mut=
 [T]) -> Result {
> +        self.access_vram::<T, _>(fb_offset, data.len(), |data_idx, prami=
n_offset| {
> +            data[data_idx] =3D T::read_from_bar(self.bar, pramin_offset)=
?;
> +            Ok(())
> +        })
> +    }
> +}
> +
> +impl<'a> Drop for PraminVram<'a> {
> +    fn drop(&mut self) {
> +        let _ =3D self.set_window_addr(self.saved_window_addr); // Resto=
re original window.
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index 112277c7921e..6bd9fc3372d6 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -13,6 +13,7 @@
>  mod gfw;
>  mod gpu;
>  mod gsp;
> +mod mm;
>  mod regs;
>  mod util;
>  mod vbios;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index a3836a01996b..ba09da7e1541 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -12,6 +12,7 @@
>      FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, Pe=
regrineCoreSelect,
>  };
>  use crate::gpu::{Architecture, Chipset};
> +use kernel::bits::genmask_u32;
>  use kernel::prelude::*;
> =20
>  // PMC
> @@ -43,7 +44,8 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
>      }
>  }
> =20
> -// PBUS
> +// PBUS - PBUS is a bus control unit, that helps the GPU communicate wit=
h the PCI bus.
> +// Handles the BAR windows, decoding of MMIO read/writes on the BARs, et=
c.
> =20
>  register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
> =20
> @@ -52,6 +54,31 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
>      31:16   frts_err_code as u16;
>  });
> =20
> +// BAR0 window control register to configure the BAR0 window for PRAMIN =
access
> +// (direct physical VRAM access).
> +register!(NV_PBUS_BAR0_WINDOW @ 0x00001700, "BAR0 window control registe=
r" {
> +    25:24   target as u8, "Target (0=3DVID_MEM, 1=3DSYS_MEM_COHERENT, 2=
=3DSYS_MEM_NONCOHERENT)";
> +    23:0    window_base as u32, "Window base address (bits 39:16 of FB a=
ddr)";
> +});
> +
> +impl NV_PBUS_BAR0_WINDOW {
> +    /// Returns the 64-bit aligned VRAM address of the window.
> +    pub(crate) fn get_window_addr(self) -> usize {
> +        (self.window_base() as usize) << 16
> +    }
> +
> +    /// Sets the window address from a framebuffer offset.
> +    /// The fb_offset must be 64KB aligned (lower bits discared).
> +    pub(crate) fn set_window_addr(self, fb_offset: usize) -> Self {
> +        // Calculate window base (bits 39:16 of FB address)
> +        // The total FB address is 40 bits, mask anything above. Since w=
e are
> +        // right shifting the offset by 16 bits, the mask is only 24 bit=
s.
> +        let mask =3D genmask_u32(0..=3D23) as usize;
> +        let window_base =3D ((fb_offset >> 16) & mask) as u32;
> +        self.set_window_base(window_base)
> +    }
> +}

If you work directly with `window_base` as suggested above, this impl
block can be dropped altogether.

