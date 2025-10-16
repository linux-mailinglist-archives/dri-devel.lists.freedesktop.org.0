Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D114BE1B4A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0565810E94F;
	Thu, 16 Oct 2025 06:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W8WEPlRM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013049.outbound.protection.outlook.com
 [40.93.201.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90FC10E94D;
 Thu, 16 Oct 2025 06:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYm82ICE6zbIxT6vCffCFpEY1Si5odZLjbqOWRQTo6UDqVGKdrFlqk4KrkDO4kmXs+k3nh3T7QtlcntfKCKh2Gf6eDV3ozSZ5D0ul165aaNnDlHo8gypz4BpPkIzYEAfoUr6d3fvN7y3xAI8tHOf6us3gLbRR8VuhRIg0M5wuaLB+csOkn/L3/rQbn6c/kkYBfC+We9mb7mpmarWKwa9jlEJNNqkv9bXs/V8sJcw1hgaMaSKFfkPiL92r1A0L3LbQtFpZdH8lAM3mVqBFOkiuLzPwFsaKUGvbJDBq+BYkNL44LtqSCpREELLkh1PIfDFM5Dspf3KMS97D5DdXDnLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uI2rmFXpoB8vl+Fx4qM5woEA8nWnhhSQdvewIiDCNY0=;
 b=aVBGWKYhUm49cowfySTkhAtzGtW8YK55jnrYxuy5C5hQpQqao7ICC62WxPirEPtbTjgZm0oHsITTZMHLwJ7DC+4LlkKZOEznIW74uBuWQk5ZrZJX1cFIrciwe36kBso+w6rxcIgvZDs+FP0/NCRrW9kcFm2xq5CTCQssphWxh/QtxgudERHrNEoprR34TqQI5AOuYwU+6HP7jN02TW4cWj4SNMOeaglkW0f3nnHCgHdWhDsTwKA4prpD/8OLORoGpFpXKjxMFIBB42cn1OQ52YNkAv4/9/hIfg/68fJwDOMuiLuRW+r4p8zhOj0hkmY9HRvd6ito/ZAZveHHIwpAYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uI2rmFXpoB8vl+Fx4qM5woEA8nWnhhSQdvewIiDCNY0=;
 b=W8WEPlRMsvyNPyFBbA9120csCgxcyiEpRsEqZ5wRrafW3YJVbpgFAu0JoqQkPtic4h74jlr+kNAG6hRHHuZwVfbaRctAG5pMUsrSWqajUXvp6uzXMxK76t5azgp0Gn6VieBlLRhRvYqlWGRKO18PrC4Wz0/5J7QGKYZ9gsNEd9jUHqtgd9tKDvDv1BSuUkx7JBO3PssOHuOlwUL5hBD66+B6Z5CaSscEvpnpUed8fvXUwvD1c1HJTNpIFjjWGYOL6qUbkx0Ml3IFceLDvniXJ/JB7gOg8DOwS/w9eOqs7U0lciatkiKkNBoipn5UyrFKDzIukD/nKxYVMYGuAyFBuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:24:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 06:24:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 15:24:30 +0900
Message-Id: <DDJJ5D7K8MC4.301XTWWSLD7YT@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 08/14] gpu: nova-core: gsp: Create rmargs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-9-apopple@nvidia.com>
In-Reply-To: <20251013062041.1639529-9-apopple@nvidia.com>
X-ClientProxiedBy: TYCP301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: e1677f50-7791-4a4c-4b30-08de0c7cac0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzRtQ0JFNXNQa1lxSTVsSDU1NTBTQmdzWTA0MWU2Ny8xMTJkRzY3dVdyd1ox?=
 =?utf-8?B?bEJ3N012bHBkVEVSNEZncWVXcW9PMGE2YjhicGFMMnkzNlRSbjcvNk9mZkJY?=
 =?utf-8?B?WU1mZ3dqdWgvWm0vNHpXNVRDQlFpT1k4UHJMeHIybkJINlNMaTQvQ1hEbTZr?=
 =?utf-8?B?QVYzMEgrTW1qMTNUbDBSQ3RsVWhNYzRwSWFEbG0vNE93a1lMb1NVZ2xwRjV3?=
 =?utf-8?B?TUlLVWxUcllERGdMaWpCT1liWFh2ekc1RlY3SHRyWm9mMUtFZGxNYnlvNnVo?=
 =?utf-8?B?N0VJTEsreEFwaXFicmJhdlM5cXlUaHNVeEQ2K0ZDSGZ3dit4Y2hYY1hJRXAr?=
 =?utf-8?B?K2dPWnp3QjFrazY2YVNLM004UGlVNW4zTko4MWMvV0V1V2IwYzRyWlVyYWxW?=
 =?utf-8?B?bjZMbjEyeEtuK0Rsd1FXWlZaTEZqQUpPWFROZHJYejZ0bnRKaEsxeWljaUNw?=
 =?utf-8?B?SHBJUlB5YitzNUVGV2J4djhxazBIUWFIa2w5SDB3ZHVISGZaV1hNY1VkR2JF?=
 =?utf-8?B?bkc0TUl6VmZ5OElmZTExRkJjUnVUcWVDamI4bUl4R0lQdENmZzUrSDRGMkJh?=
 =?utf-8?B?OXd4a21VcXFEOWtPdjdlWWYxTUp5M2Jkem56aVhoS29lb2doYUN2UlRkYzBm?=
 =?utf-8?B?Q2ZVTmFQUDhDUys3a0tLTUV6MlpyMHEzQzFVaTJ0Sm1PQmpZOHZoVjlsVjhq?=
 =?utf-8?B?TWpNNDZVVVI0WDJqeWFwZVVod3U2TU9nVHBHck11U3JtR0JWUlBWUEM5alpO?=
 =?utf-8?B?V1BpREF6Z0g0VGdhVzJGaXZWUXNMVVFsbXRBcXRtRFRydGJZWFNLK2hPUVpS?=
 =?utf-8?B?NFhKaWM5S2VoUVRIV0kyOWtFcVBJT29CS3pKMHMwcHpCeHVaVmRFaEpJWDdE?=
 =?utf-8?B?SnR4MUZFOFRCMCtNYXdwK0EwOWR3NXVBb2JiV3J5TlFET2FKUHhhK3FJTlBW?=
 =?utf-8?B?dU1CeFNUajFCOW1UOVEvV21jbW9DY09IdFlBRk40ZVJybkgyNlNkLzdYZUNN?=
 =?utf-8?B?MTZvNEFPVzYvblpVUnltK01ZOERWeEVIcEg3QVN5NzZ3NTE3SVpsd2dlbUV0?=
 =?utf-8?B?TGpQaHlEWENSRDdya2dKcUpXQkJ2elhNdU1KS0pUV05rcGxER250UEtMVXp3?=
 =?utf-8?B?ZFBlZHo1aXNHR3lWemt4K0FnYXQwVFFnSkIvUFJzaUdmUHFEZHp1VmprSnZm?=
 =?utf-8?B?alY0ejRZQWpYWFFXaFR6eUcrZlFMR2ozQ1FSVzZJT0t5c0ZYRCtFeC9rSGdZ?=
 =?utf-8?B?cVVRODhvalJCbzBoclRtbllSVDMyVnRFMTBEWGVzM1l6QXZEdlc1UXBQK3NT?=
 =?utf-8?B?bFJ0NitScENTK3dZQnJJRDV4M1R4MTkrTmpXUzFtbVVuSmRTYndMTWIrdHNW?=
 =?utf-8?B?V3lNVFJBSzA2SStTVENHODJYaStkVEYwbi9lZnRNRHl6VUhZUjkrWVNWaElr?=
 =?utf-8?B?aXN1ZnM2ZlkwSHFHcmtPcndoQmVpeG9FeVN0bFArZno4bm9Va0RsTFJWcnhw?=
 =?utf-8?B?Zkl5VzVhNTVHbHVwYzREV1RpY1NVK3ZWU0lNVDUzTmpodnN1cUMxcktsR2hR?=
 =?utf-8?B?RGN5cy92R2g0bFYvNUczTkdlR1VsN0dYRUVWY1hXT2xQd2Z2bFhHWEwzdjVU?=
 =?utf-8?B?aG9Rc0VMcGhoSDR0dUZRalVORWVkNE51eHJtMHlRWklkN3Z0b3A5NG5jNXRm?=
 =?utf-8?B?Wjg2cmc1SElxV3lBQXhlTGxsbHJTdUFpSmNyZDQxQTBPSFlIM2pHcXdibmFu?=
 =?utf-8?B?RlhNNjIvSnB5UUJVVTFTVDlwc1lHN3d0YkV0MzE5MHR0NWZzd3gzcTdPVUFN?=
 =?utf-8?B?bjk1Q0VWdmRGOFhnSHZpaGxBOFJyQlk2bk0rbGFZd2JGSTl0R2tJcno2SDlj?=
 =?utf-8?B?OEFlcjY1VThIN1IzamRodHFhTkx4ZkhFNmVWWjJheGlYSUt6SHF2ZVIrNnZR?=
 =?utf-8?Q?DY/Vaf0XSVjFS9lfwfu5i/J90/nHTuhk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnlBcHI5QitXWnhTa0pVQXJEZFZFQ0R3V01hVmtsUVR2dEtMRkdzK2xxeGNE?=
 =?utf-8?B?UFN0Y2Jvd29ZQVhFYTAzaGV4Q1NoQjRwbThabmE1bkcxb2JrOVg5alZhUG9F?=
 =?utf-8?B?c2JkelFacWF3VEJMMVJIWnNKWmZHSWJqUk1icy8wdkxxb3NLcVVyb3hFM0pi?=
 =?utf-8?B?VDRCT2xjRnpVR0pvcytRdGVVYkp5bzdFVFpaaStiSU03Mmtnc1QrNDZiTG5l?=
 =?utf-8?B?UGZWTUdBUWVaWnQ4aWl6WU11S21DSVpDQm5iU0JPblNhYWpMNWI4RW5kdVdP?=
 =?utf-8?B?R1RkUDZibGJCR0M5VGxkRHl1bkxCb0hxR1JaN2pxblI1aGYvbTc3UjV6YU94?=
 =?utf-8?B?dDJUbUM1OThrYjJqR2tYNnpUcU1tSHV6ZHFXcFF6cTNrRHA2b2I1dWJpc1VE?=
 =?utf-8?B?YUd6VE9CQ2hSTCtCOW9na0F4UlltOUdneGE3NEdnTGxPQzRscDdtVlozUXpw?=
 =?utf-8?B?Ny8zL2Z0WXUvM0xPdG55VTViZzdPMFFoZEZuWWMwOGFpNVFUeE91bU01eklE?=
 =?utf-8?B?YXFTaXdVK1g0Yk9CVkVoUVJwSjJ1VjZzc3RsN3E0MFdpM205cTVLL3ZVOGxN?=
 =?utf-8?B?dEh1dXdEY0tVcjhyWHB4Z21tRWcxeHBxZ3lSZmhVMW5TaWZKR2xUdjNnVGJB?=
 =?utf-8?B?SWIyVWZuYWpzRU4yQjc3ZnRYRDdwMnliVmFJQUtwK3RINjhMMUMrWFVEMWRP?=
 =?utf-8?B?K0tjT2tPbXBTRCtNcFN0bW9mYkI3bUkzWDMxOUVTZEJ6Qmp0NEt5SW1OYkFp?=
 =?utf-8?B?UGozMzFUZGRqcGVoN1B4WDVxcGdMaTlWc2R1NUFJNUhtUUdmMktSV0d5Z0x4?=
 =?utf-8?B?akdudzFmM0FsMUFjZUdMYUZVRk1ReXRGelRlN0NwS1VQeE1YQms1a0MzOXNQ?=
 =?utf-8?B?RFZxNnpvRjJ1RUN4UlN3anoyRG1RazZZTjJXcFhvdTZhL1BPNEYwNXpKdjM4?=
 =?utf-8?B?b3dLVXViZmZ3RTl2MktsWDFneTRUdm5UQ3YwdVBFbWRZcktwalBLeFZ4dXVR?=
 =?utf-8?B?SS9Ld1RnWGN4dkxpVVdpcDQvN09QelltWUZxK0lyMXE3eGNPUzNpMFlwak44?=
 =?utf-8?B?c1pEY09kS1FrclFuUlhXdUcxdUJGK1RHRjBBcERHWERpeU9ZeGVKaGlJdVZy?=
 =?utf-8?B?V05xMTZ6Tk1FOXVNMzM3cjlEbDlzQllVVHVjYUV4VWdRWHRObzhOS3hrZ1oz?=
 =?utf-8?B?SzYyVE5ic0RjalF3RS9rcXdVanpiS1VqMEg5S0Q0UUhDS290cWxOT2VCcDlo?=
 =?utf-8?B?M2cxQ0FRcXhtUVB3VU5PU3NvTUFtRDZ5S2tzdldCUGJJaFNmekpXZmtuZUt0?=
 =?utf-8?B?UEw5UEc3cHpTWTlQSGl5RTNlaHFFSHhEbFJpUFJpcTZLQk03eFR2YS9WVGxx?=
 =?utf-8?B?L2ZRY1MyaHJ4TWRaV0RZL2hHMmZhaFlYNnZPMExHeXBkM0xvaWR3TW5YOXkw?=
 =?utf-8?B?SnFTdWQzbkNMNXF2V3R3ZS9aeHE1Q3JXZnBBTmNYNFlCeWFRTjJDQm9tQnU4?=
 =?utf-8?B?eklnL2Y3Tzc3aUR0Qm50eHNQbVBtS0dZMUJvRngxbG5ORzNmdXk3NDVndXZj?=
 =?utf-8?B?dkExWENmdnRsbHlPL3VQR0JhaVUyZWNET0t5bmhSR3VRSzM0a0hHQWpaVXc2?=
 =?utf-8?B?TWFycXd2S2Y0bVZTa3g2OUZmTXl5bU5XaDFkK29iMnFzU3RXUzBZQzBVOW5x?=
 =?utf-8?B?R0pybS9zWFFuL1dlb0lHUEgwWlV4QjlvMjMyTVh1clgrczB2ZzM2WmliRXBV?=
 =?utf-8?B?WVpwQ2FMbURHSTB6a1lEeVcvcjBDbi9BK1dnYWxXaWczMjZieC9Ib0x6UHJi?=
 =?utf-8?B?b1dHR3NPVDVRQzk3WHUzK1BXTmE1bWhLdThpOE10eGQyQnhlS0NKbkg4M1BX?=
 =?utf-8?B?eHJkNW9KbmhScDdmK2xUOTNMK1JEQ21OL3c0aXRKaTQ0WFZ6bFl4SmhOM0JQ?=
 =?utf-8?B?MmVnb2NXRkgxajViOGFCanlhdmRCdHVlc2w0R2FRUkVKSmlDME1vM05qZzJM?=
 =?utf-8?B?VDdCVjQ1QWhYQmFTb29FRXpKdFUwZ0dUT2hqWHZsWE52ZW5PUTN0VWpvMHg5?=
 =?utf-8?B?ZkxkZVBaR2dhOHFXdlQxaW1BaUwzQzFpN2F1MHV3d2ZVelQvSUxvUmF4NTND?=
 =?utf-8?B?OGppVDl2Wm0xdC93c0tqSGpBTHZLeHYxTmRoSjRmdG9SYkppTUJLbnVCMXZY?=
 =?utf-8?Q?2NlgvKPv+3acdaFjptA/OCPY34ZIUSZy2jDXEsJuySDl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1677f50-7791-4a4c-4b30-08de0c7cac0c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:24:33.7965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibJWDgaPj31QyyK9gqL1+wnu9k8d22erkLkLbALU/uiGXlPUIKUo9Yy7mOvPfRzoh1ZnZREX2CF75zDwUcHyXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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

On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> Initialise the GSP resource manager arguments (rmargs) which provide
> initialisation parameters to the GSP firmware during boot. The rmargs
> structure contains arguments to configure the GSP message/command queue
> location.
>
> These are mapped for coherent DMA and added to the libos data structure
> for access when booting GSP.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
>
> Changes for v5:
>  - Derive Zeroable trait
>
> Changes for v2:
>  - Rebased on Alex's latest series
> ---
>  drivers/gpu/nova-core/gsp.rs                  |  16 +++
>  drivers/gpu/nova-core/gsp/cmdq.rs             |  24 +++-
>  drivers/gpu/nova-core/gsp/fw.rs               |  60 ++++++++
>  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 132 ------------------

Mmm, looks like we are removing bindings. Can we not add them in the
first place? :)

>  4 files changed, 97 insertions(+), 135 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 1d472c5fad7a..58b595b8badd 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -19,6 +19,7 @@
>  mod fw;
> =20
>  use fw::LibosMemoryRegionInitArgument;
> +use fw::GspArgumentsCached;
> =20
>  pub(crate) mod cmdq;
> =20
> @@ -36,6 +37,7 @@ pub(crate) struct Gsp {
>      logintr: LogBuffer,
>      logrm: LogBuffer,
>      pub(crate) cmdq: Cmdq,
> +    rmargs: CoherentAllocation<GspArgumentsCached>,
>  }
> =20
>  #[repr(C)]
> @@ -117,12 +119,26 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>=
) -> Result<impl PinInit<Self
> =20
>          // Creates its own PTE array.
>          let cmdq =3D Cmdq::new(dev)?;
> +        let rmargs =3D CoherentAllocation::<GspArgumentsCached>::alloc_c=
oherent(

Let's add a space between the declaration of `cmdq` and `rmargs`.

> +            dev,
> +            1,
> +            GFP_KERNEL | __GFP_ZERO,
> +        )?;
> +        dma_write!(libos[3] =3D LibosMemoryRegionInitArgument::new("RMAR=
GS", &rmargs)?)?;
> +
> +        dma_write!(
> +            rmargs[0] =3D fw::GspArgumentsCached::new(
> +                fw::MessageQueueInitArguments::new(&cmdq),
> +                fw::GspSrInitArguments::new()
> +            )
> +        )?;
> =20
>          Ok(try_pin_init!(Self {
>              libos,
>              loginit,
>              logintr,
>              logrm,
> +            rmargs,
>              cmdq,
>          }))
>      }
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 3f8cb7a35922..da074a2ed0d9 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -6,7 +6,7 @@
> =20
>  use kernel::alloc::flags::GFP_KERNEL;
>  use kernel::device;
> -use kernel::dma::CoherentAllocation;
> +use kernel::dma::{CoherentAllocation, DmaAddress};
>  use kernel::dma_write;
>  use kernel::io::poll::read_poll_timeout;
>  use kernel::prelude::*;
> @@ -247,10 +247,25 @@ pub(crate) struct Cmdq {
>      dev: ARef<device::Device>,
>      seq: u32,
>      gsp_mem: DmaGspMem,
> -    pub _nr_ptes: u32,

We probably shouldn't have introduced this unused member in the first place=
.

>  }
> =20
>  impl Cmdq {
> +    /// Offset of the data after the PTEs.
> +    const POST_PTE_OFFSET: usize =3D core::mem::offset_of!(GspMem, cpuq)=
;
> +
> +    /// Offset of command queue ring buffer.
> +    pub(crate) const CMDQ_OFFSET: usize =3D core::mem::offset_of!(GspMem=
, cpuq)
> +        + core::mem::offset_of!(Msgq, msgq)
> +        - Self::POST_PTE_OFFSET;
> +
> +    /// Offset of message queue ring buffer.
> +    pub(crate) const STATQ_OFFSET: usize =3D core::mem::offset_of!(GspMe=
m, gspq)
> +        + core::mem::offset_of!(Msgq, msgq)
> +        - Self::POST_PTE_OFFSET;
> +
> +    /// Number of page table entries for the GSP shared region.
> +    pub(crate) const NUM_PTES: usize =3D size_of::<GspMem>() >> GSP_PAGE=
_SHIFT;
> +
>      pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmd=
q> {
>          let gsp_mem =3D DmaGspMem::new(dev)?;
>          let nr_ptes =3D size_of::<GspMem>() >> GSP_PAGE_SHIFT;
> @@ -260,7 +275,6 @@ pub(crate) fn new(dev: &device::Device<device::Bound>=
) -> Result<Cmdq> {
>              dev: dev.into(),
>              seq: 0,
>              gsp_mem,
> -            _nr_ptes: nr_ptes as u32,
>          })
>      }
> =20
> @@ -490,4 +504,8 @@ pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp,=
 R>(
>              .advance_cpu_read_ptr(msg_header.length().div_ceil(GSP_PAGE_=
SIZE as u32));
>          result
>      }
> +
> +    pub(crate) fn dma_handle(&self) -> DmaAddress {
> +        self.gsp_mem.0.dma_handle()
> +    }
>  }
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index a2ce570ddfaf..70abda1c2af8 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -16,6 +16,7 @@
> =20
>  use crate::firmware::gsp::GspFirmware;
>  use crate::gpu::Chipset;
> +use crate::gsp::cmdq::Cmdq;
>  use crate::gsp::FbLayout;
>  use crate::gsp::GSP_PAGE_SIZE;
> =20
> @@ -483,3 +484,62 @@ unsafe impl AsBytes for GspMsgElement {}
>  // SAFETY: This struct only contains integer types for which all bit pat=
terns
>  // are valid.
>  unsafe impl FromBytes for GspMsgElement {}
> +
> +#[repr(transparent)]
> +pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
> +
> +impl GspArgumentsCached {
> +    pub(crate) fn new(
> +        queue_arguments: MessageQueueInitArguments,
> +        sr_arguments: GspSrInitArguments,
> +    ) -> Self {
> +        Self(bindings::GSP_ARGUMENTS_CACHED {
> +            messageQueueInitArguments: queue_arguments.0,
> +            srInitArguments: sr_arguments.0,
> +            bDmemStack: 1,
> +            ..Default::default()
> +        })
> +    }
> +}
> +
> +impl From<GspArgumentsCached> for bindings::GSP_ARGUMENTS_CACHED {
> +    fn from(value: GspArgumentsCached) -> Self {
> +        value.0
> +    }
> +}

This `From` impl seems unneeded?

