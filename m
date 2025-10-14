Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D0CBD984B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 15:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C2210E5FA;
	Tue, 14 Oct 2025 13:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mf3WPeKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010011.outbound.protection.outlook.com [52.101.61.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D19710E5FA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 13:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxbEXUQbPxFcu0T+bTxwAenCAFR1d50tbniG6zoZj3CI2IvzRlXuFgpETZTYJ1UdUS5HmXkBhheGjUefQHbezQyuHR8iYzm3EwK0lE3a9wCFFCBk3o6Aw4uTMI4Pgd0Y0sTAuaUA9xJwyxvhzh0E1z9claAP/8kT1FkCHmP4STNOlScmiSvkqiJT4GFLwTBb+yTlzN3i1J0O1ylS2X2dgkr+UOiqx016rxH1ipP5X+NRB5G1e+hnAi3UHr2zpImPrXvDWQ6jMX6xPYqIwucRqxXoST2gOxuLWS5giM5f+w5adEcfM/HGEZKSfPsrTz9kq88/z38RhNYEtdsYiOipfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8G/nOydD9+WHaZ0PVMW4MPIf/EbVosDLP5NEj9lFhXk=;
 b=kYZVudvAX6hQ1ROEVSb+8GCy9SiFAQNEGe7Hvd+dTdWD7MTD6JQ2flIfO2G2bWCx6a9lMQGma548MeAwlxDdtW9f6gvyC9E8rYdk8lYivJHZVHS4yOT40os458o8rNysqkJ5Ha0fMnBPVQuyIgzIkxBpB1C/8j1GEUpAe+hR8zc3GdZFKAuNJLDM1WFi7pq+k08PpwJbTSq5HO0DgSbu5MbM6qfyR/A4SrufdlInGeIw9UteFHAOIRRVnhKhw6wX7ZlFem0g6OiS7KAMbcq4ewvIQ+Q7BNr+jxv93yH2TrjWx0Y0SOhM3qFlyhLWh4dg3nbSn2RwWtR9YwdshiXVfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8G/nOydD9+WHaZ0PVMW4MPIf/EbVosDLP5NEj9lFhXk=;
 b=mf3WPeKP8S+MmyTvdjwrKjfMa29JlPYFJ+li2qbcYzNSKsendTIaIDlwwPcFpZKpcsprCyK+Rv+8oMVErzvtBC3n0Z0D88tClwhGYZy3TW9DeWzQMFtQozXq9utm4oRGYHoTd9SkssaeHA2hG3vhGA1MFvvNj4XhiPaf35vuDJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7796.namprd12.prod.outlook.com (2603:10b6:510:275::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 13:04:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 13:04:24 +0000
Message-ID: <ecba7133-699c-4f3e-927c-bad5bd4c36a3@amd.com>
Date: Tue, 14 Oct 2025 15:04:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
To: Zhaoyang Huang <huangzhaoyang@gmail.com>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, steve.kang@unisoc.com
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
 <87953097-a105-4775-88a5-9b3a676ff139@amd.com>
 <CAGWkznGN7W-txq_G+xpZ6DtH_1DNorYc=CxqUjebo7qfB4Sxsw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAGWkznGN7W-txq_G+xpZ6DtH_1DNorYc=CxqUjebo7qfB4Sxsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b80f179-a64e-4049-e964-08de0b223313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWltQ2ozdjRIYjNFdG1reUNCZWxBUFpKdS8zMFY2WnpuWi80TEpnMGttVDRC?=
 =?utf-8?B?WTlyckhrbVhyUnFDN011ck1uUGM2NWtCby9uR3hNcUoyY1RKKzEwdkFyK3Vt?=
 =?utf-8?B?Mm12L2R3SUhMaVZyKzJEMytMVjZUbkxmakFLMXFkVm85WS9rTHVVdGs1RjNG?=
 =?utf-8?B?NTNiTTdwU3duZGxiblovZTUxSkFYUjZCWDFBeHovOHR3cEd0M1huSXM0WkRz?=
 =?utf-8?B?bkRQR05oenZRM0hidkJEU2lOVnd4anFmc1h5bGI3OUlrS05rWWRkVzZZbHJW?=
 =?utf-8?B?eERaNTc5RElIdXE5NWgwN2Q2eW5NbXhWdWtXeCt3ME9xYWs2NG02WDQzQVZC?=
 =?utf-8?B?YUVHZjFzOFRYcXFIQkVCVnRBZCtLRXBRVGV4a2RqZ1I3SktGMi9JL2ZVRVgy?=
 =?utf-8?B?dkdXaGIyOHhOR3A3OEFsWnUwK0ZzQmxZZXc2THdtZTZnQ3NUbFdJNHV5M2x0?=
 =?utf-8?B?Z3BxK1d1bmZHdkNBTVdsZ0JFYzdpOThKVzlYMWhZbDh3Q3hqTDA0M21PSDda?=
 =?utf-8?B?bmdjeWl0azJjdEdRUmhjZ1plUk5SRHhnTGtmbzMxWG16cHJLbmlzamx4YlZK?=
 =?utf-8?B?bFd2NTJJZjVDUGN0L2VJeEwzd1I2b2UrSTM1R2NIT0VlKzZDMi9QcGFLcVZF?=
 =?utf-8?B?YUpkcXMyTjc5TVZHT0lIT3hIYW9KUGRHRHk1Q2pCZFYwOUtCbXNiMm5Xa3Np?=
 =?utf-8?B?Sm1aTmlDRG9UUFZMVUZsT21mUlhCVTlqSmpGOXFqUU5RaXZnNXBINEdGUno1?=
 =?utf-8?B?S1JpcXJRM1ZZVFVHbE8ydHJoL042Y1NhYjhXQS8yWWtVeWxwTzZabW1XL211?=
 =?utf-8?B?V0RlWmdzd0N3WFcya2lvNjBSQ1VKalNVVWh5RG1DWUhSNnVKQmZoNElrVXNV?=
 =?utf-8?B?NWdNMllxSmtRd2VLWkZ6QzE0RXBKWHp2bGl5SmlsQmdEVmRUQ0xkT0dyUU1l?=
 =?utf-8?B?a0xqemYrL0hyLy9nSThrenZPWm02Wk5mR1U2YUNzZWEvSys3WmFVdVJGeC8r?=
 =?utf-8?B?elJwcEN5Z0YyTTM1N3JRS3hPeGJhQnFrWXJaLzYyb0NhT3U5QitCTmhyeGla?=
 =?utf-8?B?dkczck9lTmJDY0pQUTFpUjR4VGJTV2lNU2RuNVpoWXEvcFFiWEZTU1ZhNXlX?=
 =?utf-8?B?R2plbDRKVWJXa2ZtV3BlM1FGYURUcnpLU0h3VmhkQm9RbDR5T2pVT0JuaS92?=
 =?utf-8?B?T1poMzlQRlM1b1pkZW9KRC9lWnZPcUxXTUdWL1k2TTI3eTN4VlZ2TGt1UndS?=
 =?utf-8?B?R3dWd3p3bGJXNXE1aHBhTlJSZTJCN2kybjhpN2FDcHQ5YWIwdHNFTEVUZnZC?=
 =?utf-8?B?WVB1bDBnU0lTbld5VEJ0VVhIQUFJRnIxdlRVMkxUWm1hM2QwdHJSVWhPc3JW?=
 =?utf-8?B?MHJuSlkrM2l1emswaXR0TWNhUlEva2Z2UzJ6QkloNlcvdS9Vcy9FVXpZYWtR?=
 =?utf-8?B?Y3dhTXMzZzBVdDZQSmZCY0MweFkzMUo0MDhoQWhrM0dvb0F5RFc1aDBhcml4?=
 =?utf-8?B?S05lZUxuNXFnalJzOUFXWEFIR1MwbkQrS2pzcDBlUTNqUG5FbEpmMUUvOW5q?=
 =?utf-8?B?UStwNnZ3Zlc0WllSRUhiNFgwekE2RHhPQ1p2d2NYa0Nuek16M1NuVWQvMXNV?=
 =?utf-8?B?c2hnRSs2aFdFdnh0ZG0ya0w3Y0o4NkNlK2c1SjlDa20ySzlrUkxYUU5rNWp4?=
 =?utf-8?B?THFNOUZ0aVdTV25weXN1Q2VuWVZac0MwOFVXTU1KSmlBVElJT2Vxeml2TmE5?=
 =?utf-8?B?ci9jTHVGc0xQUE9tYU5oVmhkVSt4Zm00NTJaYUJSeWtqenB3c3VBamlTUHBV?=
 =?utf-8?B?bVRPK0czS2lZSStCOXJHNWU0aHlvbnZQUDN0Ly8vUC85VlRaZ2oxZnUxbFJy?=
 =?utf-8?B?YjN4ZkNRV3U4bmZNQmhnWHdXb24vODZZTmgzcHg5bSthT1hTbzQxamJNR2Vp?=
 =?utf-8?Q?MwQNwqG6POHPGvVKq6exryH2ngzaU2sD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTdRL3lQNnc5bEd6dVQ5bEdwMEdwWEpvTXNCWDROZWtkKzhsOEE3SVc5ZCsw?=
 =?utf-8?B?V1VqY2tqaUxHc3gxNURvVW5iNWdrdnpqNnhjSzhBUzJYZitFa0RybGRrVUtn?=
 =?utf-8?B?enJrbFVvOFR0bnUzd25ESGE1cldKWFpwekpRczRxYzgxbVR1OFM3NHB4dEJj?=
 =?utf-8?B?N01HNDlXSWlDcHQrOTU1a3d0Y2MyTG5vN1FuUTV3OVgvR2R4TkhZVHBlemFO?=
 =?utf-8?B?em8wbDY3MkwyQXVSMFFOaDZNZEdlQnhmMWg3NTBSeXJ2c1J2bVJnR1N4SVRD?=
 =?utf-8?B?eXZxelV4S2xlbEt5RnZFSVZLYWc0U1NtZzNPN2l5YTZZY3dmc2xtbk1uMGJJ?=
 =?utf-8?B?NDNiR2psbTcvSTJqSFhOT1IzZC9ZZ1ZjV3k2SFZnUWdoZy8vOEhITkFZejJ6?=
 =?utf-8?B?NWdqeURhY2N5RWZOKy9Uc005NFVuS1BZZVBjYUxIc084dlM2bGRwcG1TUEdW?=
 =?utf-8?B?VzFuOHoxcldQTnozV2J2NGJZdmlldkM2THdMV1dXY0MxNUpYTE9xRVlQNkxH?=
 =?utf-8?B?SHlIcWpuWXJIRlhwM1FjVTIvdE0zNWt0dFAra2JxVGc2cEdVc0RIdDU0Wm53?=
 =?utf-8?B?dTAvTm9ZWjdtOFlQRXpXMFdxMC9GekxGc0xjdzhrdHB4Zkk3aG84MHZmZ1ls?=
 =?utf-8?B?SGNIaGlEUm50U2hidFpzZFczNE9tN1JiUS8xOXBxbWgvU250NFFJcnl3UjJH?=
 =?utf-8?B?Mm5WWFpkTVpIQTcySVdtTU9JTXBFekh3RndOeHdsV1J5KzBoRUE4dzgyckJv?=
 =?utf-8?B?cG1CemRVQ0RFZ09Eck5NQVBOdGMyZWpCekZXYkhqV2pXMUJ3R1o5U3I5MVNQ?=
 =?utf-8?B?WWZ0MFB3VEVDVUZweitBMWVJekl1Z1NYRzNIMGI5RWZJMk9yTjhNeDNzS1ly?=
 =?utf-8?B?UCszWFJoM2RKWDZPOU54a2JERm5XNnpRcGlkODNaeGdBZHlvUmVEWmlvODJE?=
 =?utf-8?B?aUw3UHFUWlJxNHd2RHQ0V0FPaEhlcFVqN25OdGVPamwzTk9NOUhGcDRkSmJZ?=
 =?utf-8?B?emMrWFZFZUlPc2tQYXJQY1ZINjJIWTkvS29sZXU0SUZQdlRwb2JXUEtEY2tK?=
 =?utf-8?B?d3NabFNDZFVqaWExYTE1K093clVCN3BxelBuUU1EZ09wczRJYytyWDZuQSt5?=
 =?utf-8?B?dTFkSC9QdWxiY0d0TmZvZG9JY3dXdjBRMm91eVdpQ0VtdzlydEdmMzV2blJu?=
 =?utf-8?B?Q2VyQ3ozeS84Q0crbnNBM3h2QSs3UVFGTkFGSGhXWlkyd3hvYVR5WkdiMXJo?=
 =?utf-8?B?WHA0Wit0aDg3WEhTM1ZVWSt2cVVVMG1EQmphM1NWdnBkYzJ4ZE4yVlFkcjJV?=
 =?utf-8?B?MVVwYURtdnRUby9yMjJKejBXQk1zMGl2anJqbUtoU0hNTXQ3S2JoU1pkMGx2?=
 =?utf-8?B?aHZOd0VwVkFkNE01VWRoUzNnUkN6dTZmT0JrUHdneHgySVhKWmorQ3o0N0Vu?=
 =?utf-8?B?YTZ4RlZObVRQTWdnNmpjeWtDUFMxZlBYem5mSjhjL0s3YjVTQWhsVERxcVds?=
 =?utf-8?B?Y3RIQVVLY29rUVRGYWQydW1va0E5SHhSNjF6NHNVNnZoV3J4K21IVXFVdWV2?=
 =?utf-8?B?cVBCaHI5UUVLNnFaWmZ5NDVTRXYrSURONXhDZWFjTjNIcCsyZ2lBNjNHNUFH?=
 =?utf-8?B?dGE4VWx2Y2g2OFlGUFg0MnFDZy9VWjFTdFNmUlFzK0dIY29qWEhFMHJrYlY4?=
 =?utf-8?B?YXV1OVdPd0dMYjlUTDdhNVk5aHZQMHJKbDJNV3liWVVDaDN1UDhCRm1lUDM0?=
 =?utf-8?B?b01YanVwU0FaY2ZhN2hlWmhBQ3dLVkxlWjNsd3FNUC9VRVFxNjAzRzArV29s?=
 =?utf-8?B?alVPRTk5RTFUVmR2WG1NdHo4a0pjb1Zta25DM2MxZmxFeVZ5QUpmWlBwUytD?=
 =?utf-8?B?UnQ3Wm5sVHUzb3RId2ZxSndicHNzbkg0ajJIbW9ic3orY1RYamk0bjhEZzBU?=
 =?utf-8?B?RzFjSDVlTXNhUHdERzc4ZzhVdVdZUnhvc0Y2bWVZbGtIRDZiRFV2aGphdDMz?=
 =?utf-8?B?UkRRNWF2Znk1RGl1OWhGdUpSNFNhdjhCSk9ieTVUaGoyV2RTYnBlUE1zdFpy?=
 =?utf-8?B?LzdkY0dTZ0RMR0xzYmhBRlJOdHZYNnE0Q0dEZXRGMHpHbXRsSC8vWGhZLzRM?=
 =?utf-8?Q?18i8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b80f179-a64e-4049-e964-08de0b223313
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 13:04:24.8735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBqhmDMnk3efOj7KhWx6JGRLjoAw8NHDBnLAIQax/qtGyfHZc1BvbZXQ7JMXKwY5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7796
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

On 14.10.25 14:44, Zhaoyang Huang wrote:
> On Tue, Oct 14, 2025 at 7:59 PM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> On 14.10.25 10:32, zhaoyang.huang wrote:
>>> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>>>
>>> The size of once dma-buf allocation could be dozens MB or much more
>>> which introduce a loop of allocating several thousands of order-0 pages.
>>> Furthermore, the concurrent allocation could have dma-buf allocation enter
>>> direct-reclaim during the loop. This commit would like to eliminate the
>>> above two affections by introducing alloc_pages_bulk_list in dma-buf's
>>> order-0 allocation. This patch is proved to be conditionally helpful
>>> in 18MB allocation as decreasing the time from 24604us to 6555us and no
>>> harm when bulk allocation can't be done(fallback to single page
>>> allocation)
>>
>> Well that sounds like an absolutely horrible idea.
>>
>> See the handling of allocating only from specific order is *exactly* there to avoid the behavior of bulk allocation.
>>
>> What you seem to do with this patch here is to add on top of the behavior to avoid allocating large chunks from the buddy the behavior to allocate large chunks from the buddy because that is faster.
> emm, this patch doesn't change order-8 and order-4's allocation
> behaviour but just to replace the loop of order-0 allocations into
> once bulk allocation in the fallback way. What is your concern about
> this?

As far as I know the bulk allocation favors splitting large pages into smaller ones instead of allocating smaller pages first. That's where the performance benefit comes from.

But that is exactly what we try to avoid here by allocating only certain order of pages.

Regards,
Christian.

>>
>> So this change here doesn't looks like it will fly very high. Please explain what you're actually trying to do, just optimize allocation time?
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>>> ---
>>>  drivers/dma-buf/heaps/system_heap.c | 36 +++++++++++++++++++----------
>>>  1 file changed, 24 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
>>> index bbe7881f1360..71b028c63bd8 100644
>>> --- a/drivers/dma-buf/heaps/system_heap.c
>>> +++ b/drivers/dma-buf/heaps/system_heap.c
>>> @@ -300,8 +300,8 @@ static const struct dma_buf_ops system_heap_buf_ops = {
>>>       .release = system_heap_dma_buf_release,
>>>  };
>>>
>>> -static struct page *alloc_largest_available(unsigned long size,
>>> -                                         unsigned int max_order)
>>> +static void alloc_largest_available(unsigned long size,
>>> +                 unsigned int max_order, unsigned int *num_pages, struct list_head *list)
>>>  {
>>>       struct page *page;
>>>       int i;
>>> @@ -312,12 +312,19 @@ static struct page *alloc_largest_available(unsigned long size,
>>>               if (max_order < orders[i])
>>>                       continue;
>>>
>>> -             page = alloc_pages(order_flags[i], orders[i]);
>>> -             if (!page)
>>> +             if (orders[i]) {
>>> +                     page = alloc_pages(order_flags[i], orders[i]);
>>> +                     if (page) {
>>> +                             list_add(&page->lru, list);
>>> +                             *num_pages = 1;
>>> +                     }
>>> +             } else
>>> +                     *num_pages = alloc_pages_bulk_list(LOW_ORDER_GFP, size / PAGE_SIZE, list);
>>> +
>>> +             if (list_empty(list))
>>>                       continue;
>>> -             return page;
>>> +             return;
>>>       }
>>> -     return NULL;
>>>  }
>>>
>>>  static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>>> @@ -335,6 +342,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>>>       struct list_head pages;
>>>       struct page *page, *tmp_page;
>>>       int i, ret = -ENOMEM;
>>> +     unsigned int num_pages;
>>> +     LIST_HEAD(head);
>>>
>>>       buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
>>>       if (!buffer)
>>> @@ -348,6 +357,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>>>       INIT_LIST_HEAD(&pages);
>>>       i = 0;
>>>       while (size_remaining > 0) {
>>> +             num_pages = 0;
>>> +             INIT_LIST_HEAD(&head);
>>>               /*
>>>                * Avoid trying to allocate memory if the process
>>>                * has been killed by SIGKILL
>>> @@ -357,14 +368,15 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>>>                       goto free_buffer;
>>>               }
>>>
>>> -             page = alloc_largest_available(size_remaining, max_order);
>>> -             if (!page)
>>> +             alloc_largest_available(size_remaining, max_order, &num_pages, &head);
>>> +             if (!num_pages)
>>>                       goto free_buffer;
>>>
>>> -             list_add_tail(&page->lru, &pages);
>>> -             size_remaining -= page_size(page);
>>> -             max_order = compound_order(page);
>>> -             i++;
>>> +             list_splice_tail(&head, &pages);
>>> +             max_order = folio_order(lru_to_folio(&head));
>>> +             size_remaining -= PAGE_SIZE * (num_pages << max_order);
>>> +             i += num_pages;
>>> +
>>>       }
>>>
>>>       table = &buffer->sg_table;
>>

