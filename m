Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8566C995E3
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 23:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE8D10E4A6;
	Mon,  1 Dec 2025 22:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N5Qez3dj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BBA10E4A3;
 Mon,  1 Dec 2025 22:18:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ln9ZsY4Mhdt2ATvtPIaYXuZCC5iHoanV/+MPOVp4a7sDDFi66wg0TnQB/hLtsso9jq/k8s0fSHIWJ2o44tJRUerk3XrneWLMKmTjCkoe6uIcEZiIkGo2G0a/wzuf5tdy8mHbrfIJS0bgQQb+SZDYJ/qltXBCaNSV9oisgY23vph+xMXkdxpm8jYyPBRsidOrwCrDfDXGMygRsBNJ3g7NdMyMTv2B3IZj1cCVsPPyjuLSO1dqFCpWjXiZmlGEuCZIXUJ0E3ZYhlELqQzhNPMDo3mPVlXo7z5M+0Zeg3e8JYDfbrcJFeC/Ryiqq5/j1AtXN2fAW9b/5OqztMWgOTkVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Std4ocSXHZey70lhGGnLhAalQkQkjT8zQdAmK455xHs=;
 b=wnRz1kETDqcgZ/91SnoXtHQiNLcRWkhYBCTUgNJ+CCRFIPyHBaDByWDXTeWBXSoZoMLHT2Y3Htmz7qR8fDLojk24ojic7VDo6ko11WyG6HyAUKM753PKb5Zg/GMra00tLllIMtAsH3pWXim0850uEgmTD76PcvalG7psq5K9sDuViUh1mSNECD8mdjq7IR8YBJQWaX5AuJMs6FCgPPQsk12RQitkte1ZaIOnJ3PZrwbjUQJ4598ztG36zEgF3IUsLGJ78R/4n6TsfDdh1LanuFhOFvK26OUe/wT1Y1yR6jg2gQ8/f98sO+1HEe18HleqQXn3rDEnIELMucwyqW6dxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Std4ocSXHZey70lhGGnLhAalQkQkjT8zQdAmK455xHs=;
 b=N5Qez3dj0rVOu2sV2lWWi/+izeGAzzs/obyfJQAl4ZQieEb6gykL36RNq4tneF+XNZWLFipgabDW2cpNjNJOcBhy5uRIg1yoSnQcaf+WM03wZUN68UuIGUkULlCHR//eDFIfLfu4TbE++p7UFv8Q0Pdu0T8NTn0B9P1tpx4spQk4Ga4zUkOJodx2LtEJqRbRzG1A9U4JLsLAJDSjPSLJOQAWuJF4skLY1wG1xHkbqly0zgS+34qbxnnbc20x2tMGvG2V4oh8OjtWhQGhud1BBGzrGTeGdYKD/cBuyJKrTZXkkbU1Ljo1NXd2lUfINYZqzc2/F6C2Mx+6J4lNTcOryA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PPFFEC453979.namprd12.prod.outlook.com (2603:10b6:20f:fc04::beb)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 22:18:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 22:18:13 +0000
Message-ID: <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
Date: Mon, 1 Dec 2025 14:17:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com>
 <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PPFFEC453979:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b6ee88-8a19-4a39-f92e-08de31278462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXVzeDYrTmZmQkVZQUJmTGk2SlRjMndwK053MTgvM3QxM0dmS0NHWHVPbUFw?=
 =?utf-8?B?MmJQQ3dndXhrYUFCTldCWVpSNnRwQXN3MUplS1FjMnJsc2hlNUt0YVZEYlg3?=
 =?utf-8?B?MlBHKzByRlBKcEVPcThyQXhveG54c0lBN2NFRlBDSGwvSEkyeWJjU0JoNTBK?=
 =?utf-8?B?YUpvVFNYTXNMK201RkZnbTNlOVN1Qmkwd2FNQ1pNdTFOOTAwMmJ4TXV6NU5S?=
 =?utf-8?B?bGcrRnhuSUFOa0U2V3lTUHZLN2xjTnI0TEFKYUc4NVRHTlMrYitLMDdCd29r?=
 =?utf-8?B?Y1VVOTlReW5Bc09TMkpTS05oN3R0SFQzdFYxNUNaNTJLdmNkUzVwR0U5TEo5?=
 =?utf-8?B?cHR6VEg1bTdjZmlISE5US1Y3Nk9vRG1iZWRBN1gwQ1B4SVpQWkZKdlVzN3Rq?=
 =?utf-8?B?bnRuR285TWJTdWFCQWlxUHZrUGdhRHNTaHRRN2FwR2lKREJXeXhlZ2JqMEg2?=
 =?utf-8?B?K0lvZGYvVlA3RU9BM0hTQTlzckQzVUhkbC9DQU9iZ2FPWVJxWVd0TTkxVXJP?=
 =?utf-8?B?ZFpvNXR3WE9ubXBYNHhnbmdCWVNIU0tGb3I2aCtxL05pNTNDUWVjRTVPTStn?=
 =?utf-8?B?VGpKc1JzT3RrOGxLa2tHOUZSdzh0N2VqS1VBVHZxNldPZzJrcWZoRFNmQmwz?=
 =?utf-8?B?bmJvV1piSkNTYWtTRUZHZG82dnNzM09NT3ZjNWJYeWhKUWNiT2NOUUMrTHNl?=
 =?utf-8?B?L2hUYzBBTUVYZnh3SnJZaW1KMHZUeGFzdFlYeXplTTc1UDkvVHVISm03NDJ4?=
 =?utf-8?B?dGJoZXZ4SG1uNVQvdXZCT2ZZN1REcXh0b0xsSUozY3NUQVhoZUk4WlgvU1RO?=
 =?utf-8?B?VTcrZkRFeHhRQTdRWTZnNi9sVU5VdG8xOUx5bWZFQllNa29iU2ZnQ0VNaWpC?=
 =?utf-8?B?a1ZNM2U5MHYwdXlnTlc1M0R5YzZEQlJ5T1R6T1Q5MU41cEk3Q3RDKzRjVWlI?=
 =?utf-8?B?aGFMRUpvbEVEZzFHQzJ5VndkYzlYZ0tOZnRvby9razgrMDZJS0xCUHk2QTEv?=
 =?utf-8?B?V2l0OVRUQStQdHV6YXg0WlRUOFBaS2I0dUdXSWY1V1I1cTR1Q3piQUNhdUxN?=
 =?utf-8?B?WndMTUpkYUNwaTRKTElSUCsxWERMa1ZHS0M4dFpXNnV0Mms1clFJRHpUbktp?=
 =?utf-8?B?YnJheVlhYU9lMzl3cnJMMmZlNjIvOWRaQ3YxcWRjL0tDMzhPdzhjdWV3ZnpM?=
 =?utf-8?B?QmlXaExYZE1oTG9YS1JETVR4ZlUwc3kvNEtLd0hsRUViRERDcHQzZlJlaWRk?=
 =?utf-8?B?a2RKbUZXMXZCQzBMMWtab2pXQ3FabGc4c09FcHdMK29WaFlTYUllbzNtb2R6?=
 =?utf-8?B?M3dVMTMvUFE2ZGNYOFA3SksyVm9BOXFHaVR1NmFrWldkZHJsMDJ5NWtrTFRj?=
 =?utf-8?B?QVQ2QmNuUlNFa0lHeGlVYmVTWlhwb0FmOXQvb1p0ZVd2K09iVW9uOU5YOVdH?=
 =?utf-8?B?eFNVRkk0c0dTenprMkIvOVA0WGVzSytuK3R5WnhOeGdlb2phYlRJeklXMk9x?=
 =?utf-8?B?dWlSd3NxK2JoeWtEdVd4QmlxTVpzemhXcnE5TW8zcDRkZTdRMGVSYnZkVkpN?=
 =?utf-8?B?YzFPY1lUcXllbk5ZeEQvK2FyVU1xc3ltN3BvWW1ONmU4T3gwOXFqalcyTUs4?=
 =?utf-8?B?dkpnU2NyYkY5UDhrMWlvTTdHWHQvOUhEdUZzOW4vVitZSURzMmNQSTVHcGRW?=
 =?utf-8?B?bDNoVzY3NXNkaUY4ZGR0OFMwSlg1c2JhMnFlaTNYTzJ3K0JkNmZCS2F0M1pS?=
 =?utf-8?B?Z3lkMFVDQnlYdGNEU3EreW5mWlphUS95SWJJODVXb3c3UDkyclNHV09rMVVk?=
 =?utf-8?B?ZzQ0NjhhL1EyREUwSk90RHVOOU5qekJoSEtHWmcrY2h5cTRhRTdzcUhRS1px?=
 =?utf-8?B?eFc3bXh6ai80YXR4MmRPN3VvRFdWTnFHNUdtdlZKWDRyNlBScWx5eFpFTCsw?=
 =?utf-8?Q?cXB1Y0/qrp0jAWP3wiinGHPxgXAiwTOl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0ZrUlRmWjRpTmRWaVAxVTdML2p1YnNnODl6RUZEZHlXUSs5M1NDUnI4RXg2?=
 =?utf-8?B?T2QwdnVicFY2OGRzYnRrYWRzY1hlWTVEUU52ekg4SVFjMjYwWGJiekNXRCs4?=
 =?utf-8?B?SlFWcEVacDIyZXhZWmw0Ulh6ZGYzcGhsNHZaSmxyd29xVXdrc240bW1Namc1?=
 =?utf-8?B?aVZKSnp3YlErMHgzd2FlQVI1QjZWcDBrbkxuUGovd0VyN1N4a2M1SThZQUs5?=
 =?utf-8?B?dFNyejl0aEN1NjNJcStYbnNabGVYUUtwYUFudVR5RmZJOVJxYUJwMi96b3Bn?=
 =?utf-8?B?K2dzeW1OalpralhzZHlVMEpGMUQrUnVuaE9JRWdKK250Y1BWQlRNL1ZSeVRL?=
 =?utf-8?B?Nll0TEhkbW9EaDMyTnJOT1ZUTmpXRTVEaW9nT3BCWEs5Zk1RWUYrV0VJSUZ5?=
 =?utf-8?B?ZjNQOW9XaVh2dmNOQ1JKSDlDU1NYQlc3K2VwQzRZeFc2THFWLzJKWVZzMjdL?=
 =?utf-8?B?cDBUVlRaaTVNTlk5S3ZWRE5LUDllYnFhbFVFNnlzVXh6VTNMZnRLL1d3eWZy?=
 =?utf-8?B?TjdPaVJiV1lBajg0NDlWUmtDVzVtWWhoU2pJUW9GaEM2UXdKYU5vZUxYY0dV?=
 =?utf-8?B?elpQQ09JMjlQdWQ2dUx3U3ZvaDIrZVorN21zZ2cwRFI1WUlpK09yZzNja25F?=
 =?utf-8?B?Ly9BdldPYjJST0VRU29QU1RmY3lSQXdweDAvTjNHeWdISFBTWU1DSFNGUkt6?=
 =?utf-8?B?aml1cHFCZnR1Y0kwalY4emtxVWk2RUh6bXNYdVV0elA2dG82cHF4alFoZnZn?=
 =?utf-8?B?TklUQW9BeTMwZzFLSVBKTmt4YTBQVHNhSHB0bUR5UVNqZ1dmUGpPYjNYVXo2?=
 =?utf-8?B?OFFKVjhPdlRUODFKdkxubFVESGZwTFBUYittaU0wejVYemlmVy8xT25WMDhR?=
 =?utf-8?B?eDdyRXp2djdqSDdLRzZQMXVYZlJqUzExR2gwTXBZMHhwL3VsdzlhN2JvVGwy?=
 =?utf-8?B?ZnJ0bDlEYnkvZ0ladjNFOG5LQUFhYTc5OUpHeXpOZFBXT3V6RDExWmc5UzZx?=
 =?utf-8?B?UWxXVW1HNzNCTm14WCs1ZTdPaFhtTktqc1pRY3pKc29IRjR6cml1bWozUzhr?=
 =?utf-8?B?eWd0K2cvQklSWEhUS0t6VDJEWmpuMUEyYlZRY1BSZjJIQXNTYm5zVVVzNFdM?=
 =?utf-8?B?N1dhczAzMDBucmhYbXdSQlBXS2Q1dENyNmRTQTR2a1BIaTBEZTMySjkySzhD?=
 =?utf-8?B?OTVFbmovYitGN3I0ZU9XSGk4YXFhUk9HVnY3U3c0MGJVQVRVMG5zK0dINzg2?=
 =?utf-8?B?SzZXK0lqQ0xZUlhGV25IeEZRYzFxbHMzbGk2Y2gzbHdiYnZMaEphUjUzeVBk?=
 =?utf-8?B?QWk1WkpJTjVSUjhBb1JCRXB3aEdhZEVad25yNWtSWG1Lb09Db1l3ZCtVNTQw?=
 =?utf-8?B?Tk9EYWtFdElsRCtLUUNPR2JXU0xSM1ZyejhtdHB2K25YOGdUUU1CdUFrbXdl?=
 =?utf-8?B?d2ptYXdHN3dGVC9HNzVCWVBPa0syN28rRXk5QzkzV3BYbkw1V0JaZFBkOGtt?=
 =?utf-8?B?aDVMWDAzbTZIaUk0WTduTU5RL013STd1aThVdnZjL3VhNzRzUENjS3RIRjdW?=
 =?utf-8?B?YnNQRmQvM1Q5QzFSelZCa1NERWt1SWNvM1FQd0Ivc1pSa3JIaVdWTnRjK3pV?=
 =?utf-8?B?NjZPV2liZWV5dGhqWnBhZFNabHlKTU9aREoyNStEZkg5TnJJTWpqTUNQRGxD?=
 =?utf-8?B?b21IcmlHS08wNjlRdk9qYUl2MlBQejg5c2FaSXJma09sSXVBNHNab1RtOGtr?=
 =?utf-8?B?OWEwWVNHdDdXTHR6UklsYXR3WVdvY1RXQm9kN0pTRjZGbnFoaVowNXNML20v?=
 =?utf-8?B?N2VKYWpVWmRDcGJGbFlweDRDcytGUlQrTjg1T2NXSndlNzNNWEpvanhMRk4r?=
 =?utf-8?B?bXVZQWRNU1c4RTFoV0hvYnNJdmd5b2owUm9rUC9FMmpseDRnNXJjUTFzcnVV?=
 =?utf-8?B?K0IwemkrSEYrNStkNUY1aytoL3gxTDZmQUR5TVhxYkFVUkFVQkdHNXVHejZM?=
 =?utf-8?B?ck9sSFprOVVjMjRaRjdqaXRuT0FHa1R2REptS2dvY0JFNXVJRlIzajl4cWVO?=
 =?utf-8?B?YUluY09JSTJLTTBiRlh0UkdOMC9Lb3lXaEpZSXh1MDdxTHdlb2UvSkUxa0di?=
 =?utf-8?Q?KRTbh5ujC2FobF1SfAoBAIYul?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b6ee88-8a19-4a39-f92e-08de31278462
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 22:18:12.9787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BS041oAn6/d9bmE8BX2WNLzZ6IDlHLJJUCu8N+fEu2rqqwHFzqQRLbV7WsNsQN8/Nn9uNE5abMQenwhnkdW6fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFFEC453979
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

On 12/1/25 12:32 PM, Joel Fernandes wrote:
> On 11/30/2025 7:34 PM, John Hubbard wrote:
>> On 11/29/25 1:30 PM, Joel Fernandes wrote:
...
>> This is sufficiently tricky that I think it needs some code to exercise it.
>>
>> Lately I'm not sure what to recommend, there are several choices, each with
>> trade-offs: kunit, samples/rust, or even new DRM Rust code. Maybe the last
>> one is especially nice, because it doesn't really have many downsides.
>>
>> Rather than wait for any of that, I wrote a quick samples/rust/rust_clist.rs
>> and used it to sanity check my review findings, which are below.
> 
> In v1, I had a samples/rust/ patch, but everyone's opinion almost unanimously
> was this does not belong in a sample, but rather in doctests. What in the sample
> is not supported by the current doctest? If something is missing, I think I can
> add it in. Plus yes, DRM_BUDDY is going to be a consumer shortly.

Well, I won't contest the choice of doctests, since wiser heads than mine
have already worked through the tradeoffs.

But for API developers, the problem with doctests is that no one has ever
actually *run* the code. It's just a build test. And so critical bugs, such
as the kernel crash/hang below, are missed.

I would humbly suggest that you build and *run* your own samples code, for
new code that has no users yet.

Because if you are skipping steps like this (posting the code before
there is an actual caller), then the documentation of how to use it
is not "just documentation" anymore--it really needs to run correctly.

And actually, after writing the above...I still think it would be better
to post this with its first caller (DRM_BUDDY, or BUDDY_DRM_ALUMNI, or
however it ends up), so that we can see how it looks and behaves in
practice.

What's the rush?

...
>> The fix requires two-step initialization, like this, for example:
> 
> It has nothing to do with 2-step initialization. The issue is only related to
> the HEAD (and not the items) right? The issue is `assume_init()` should not be
> used on self-referential structures, the fix just one line:
> 
> -//! # unsafe { init_list_head(head.as_mut_ptr()) };
> -//! # let mut head = unsafe { head.assume_init() };
> 
> +//! # let head = head.as_mut_ptr();
> +//! # unsafe { init_list_head(head) };
> 
> Does that fix the issue in your private sample test too?
> 
> Or did I miss what you're suggesting?
> 

Yes, you are correct: the main point is to avoid moving a struct
that contains self-referential fields. So your version is a more
accurate and better fix.

...
>>> +pub struct Clist<'a, T> {
>>> +    head: &'a ClistHead,
>>> +    offset: usize,
>>> +    _phantom: PhantomData<&'a T>,
>>> +}
>>
>> This discards build-time (const generic) information, and demotes it to 
>> runtime (.offset), without any real benefit. I believe it's better to keep
>> it as a const generic, like this:
>>
>> pub struct Clist<'a, T, const OFFSET: usize> {
>>     head: &'a ClistHead,
>>     _phantom: PhantomData<&'a T>,
>> }
>>
>>> +
>>> +impl<'a, T> Clist<'a, T> {
>>
>> And here, the above becomes:
>>
>> impl<'a, T, const OFFSET: usize> Clist<'a, T, OFFSET> {
>>
>> ...etc.
> 
> It is not ignored, the const-generic part only applies to the constructor method
> in my patch. I didn't want to add another argument to the diamond brackets, the
> type name looks really ugly then.
>

The macro hides it, though. Users never have to write the full type.

Increasing const-ness is worth something. The messy syntax is unfortunate,
but I don't really know what to say there. 

 
> The only advantage I think of doing this (inspite of the obvious aesthetic
> disadvantage) is that a mutable `Clist` cannot have its offset modified. Let me
> see if I can get Alice's suggestion to make it a const in the struct work to
> solve that.

Yes. I have it working locally, so I'm confident that you will prevail. :)


thanks,
-- 
John Hubbard

