Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757DED12B52
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 14:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7045A10E3CA;
	Mon, 12 Jan 2026 13:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pOUbxfXL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012013.outbound.protection.outlook.com
 [40.93.195.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F4410E3C8;
 Mon, 12 Jan 2026 13:14:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcMTSMrBQAIc9s+OabvGrgVLvhFQfee20hCG3WxvRMVPNK9tgFIQbF8t03rLM/VhNoCB466ZLE/8BRW0Y1U/2sX9OqiAL2WQA4a3PzlhZL9+hcPh3ZIDwYpHWV2uMpmr7ez52aPKQMVBHtjN8o7YwmmKK+LTl47c0SdZVqJezdSJc9Nshs4HvREbl6RZB4e/ErqDqZ2hVzT5gk7SvfOr2wroeP43g38dvmj6YCzsTRnHCuqxNQ2jkw09pJz5kRizXDqep5+EX0BFEv7BJI0gpqLXjM3UBd2peyIfDqu/UKj1/C6goF9G0wLybkaL7QNp3z7mRMP3YgH7/S2nCi7fXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TJzd8tJwZk8I4YygRn6nAFCgyASGcrh7oC3f83mbso=;
 b=X0TTDXCz+lM9jkVCICOVrcEZZlcH6ikbvTGnYJQg8Ni8IUAtCsv6yCX48H2SL2ZbqSEab7A6JxjXvpuqZOFli3B66Zvv1PlLeEAZiUtpfTIHKB0i6yRnp4yrfFV4N/QzX6Q88yXM45PMtF34xfvKsbzOooHpkOgSUtNbVYsVgR1RjuA9u/+mmhmpnrP+QyK2l1UnfIkGMWJl3NQGqiQeNyE+MxGK7hNRa+0ysA51XNKzuZK1fnkF1T9HZ3YIwSy1YBPksaDvVtYi+BTGBHTiVw0AgticMXmAP9RpAfSvIyywBVyVwzH67yemE3gYIHG2bnDvOv9phb6yoVYaWKgSLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TJzd8tJwZk8I4YygRn6nAFCgyASGcrh7oC3f83mbso=;
 b=pOUbxfXLaycj/b1lQykenmvkRaa/hLOT1Hxh43+Nj3pmq0dIEjx3vnS7jp2ti3MfGGl/ZVqUpHTpuRwmgKvLGRPL0eRV21OpVrt5KmG5jfths/PdvWL8YVj989X54bhvINlxxq8Olg9ngU42ARGqKEOxd67Jx9zC9U2B/5BlUJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6546.namprd12.prod.outlook.com (2603:10b6:208:38d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Mon, 12 Jan
 2026 13:14:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 13:14:49 +0000
Message-ID: <57ce883c-532b-4596-97e0-cb811ecb0c8d@amd.com>
Date: Mon, 12 Jan 2026 14:14:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/amdkfd: Add batch userptr allocation support
To: Honglei Huang <honghuan@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>, dmitry.osipenko@collabora.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 Honglei Huang <honglei1.huang@amd.com>, alexander.deucher@amd.com,
 Ray.Huang@amd.com
References: <20260104072122.3045656-1-honglei1.huang@amd.com>
 <64f0d21c-1217-4f84-b1ce-b65c1f5c2ef1@amd.com>
 <b6004bee-ffef-48ea-ba0d-57b390cb771c@amd.com>
 <76c44385-bcf8-4820-a909-569bd2d36198@amd.com>
 <7ea29163-d6cf-4a4c-91c7-72802dd49018@amd.com>
 <d932d813-f1cf-482c-9697-80199b3b4771@amd.com>
 <3f9028ae-6f34-4fa9-aba6-fb2a6e223725@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3f9028ae-6f34-4fa9-aba6-fb2a6e223725@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:408:f9::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 114abe09-ceae-4686-3afd-08de51dc904c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjFKbEg3cmFQeFRPcm04WVZjMnh0cTdpbXVzT1VKMWhTdFhJNGQ3MTdFb01M?=
 =?utf-8?B?MDdyc2JHUCtsQVMxYUpEQStGYllCMXk0KzIzZGdYYUpzNGpJUG8yUTlBTFpG?=
 =?utf-8?B?RXR3cTRkN0NyaEFDTmpJK0VzRjk4NzhQeGJHUmVzK0NYRHZyQmN0a0toM0x3?=
 =?utf-8?B?NThhd3pkNk16WG5tbmlZQ2QxUlNIUzZGREZQRzdkSUZNbTJvQ2ROR2pSSDBL?=
 =?utf-8?B?dzM3WEZCSUFodUJtWmlmQW5YQWdsQXlURTgrQ1dVVThBbkgyLzFuMlhwMTJM?=
 =?utf-8?B?cnBIVUVnelVoY1pCZ0plb0MveGU2enVPbmJFLzN3QXZpSjNFTXhyV1J2MFZV?=
 =?utf-8?B?dFh5UXo5WkR1SWMwUkhxY2dkZ1J2d3liaFQ3eVdyN1NianVWMkdWNVJTU09C?=
 =?utf-8?B?VmtlVnpNQnhPbDRRNjB2WTNzUXA4bDhXMTVkOFBhZjlBQTZPSDhFYm1QZExO?=
 =?utf-8?B?WFpuNDloTUpJYVFyalhtSnhTVkdGWkw1Rm9PUFJRQ0FGRjJOYmlBZGNGWE9W?=
 =?utf-8?B?Q3BWbVB3ajhvbGU2ZDNOcFRHMm55TG44UTZQODF5UVhEbDJrWWVRTXlLRGNW?=
 =?utf-8?B?Z094Z1BuM0h2LytNKzVpNjl6THgwV21nd1MzZm0wU0hWekwwQnFHb25OdWFm?=
 =?utf-8?B?aEU2ZU1BNmVQYjU4cnZEMkVNK3pILy9BL0llZkVhbUZsblRvZ21TcFp5VUw0?=
 =?utf-8?B?ZHFUTlJ1cFhFTG5DaHJ3YXZHRlM3eE1LVFpmd0ZiN1NrNlhKUWFrNytGMTBF?=
 =?utf-8?B?ZEIxM1oxa25YTlp1Rk9oSU5kZHBqeURsUnpHWWo5aDBRbU1rT3RPZFVGRjJS?=
 =?utf-8?B?UktjRzV4dkF5V3lJb2FJaXVwNU90RTlOZi9lcmNUVlVDci9IUC8yMDFTZmtv?=
 =?utf-8?B?Q3BjK1VVWXNtbHk4VmlKR1c5b2J4S0pXT2x2R2YyRmpFUUIwSlJ0NEY5cXF4?=
 =?utf-8?B?SEsvSlQwYURnUlRwazFJV1FUT1lOUVBucjN0d0ZUZFI0S242c1pjY2hQbjRQ?=
 =?utf-8?B?cWNaT0M2R0hNWXpGQ1BFeTZaQmxNYVlwMnA0Nkl2akEyanp4SmdlNCs0ZUkz?=
 =?utf-8?B?VVk2WVB2M0RXN3hrZjNBMDdjVFRxWlQ0cEVma0xBRzlqdER3UDhiTU50MXhU?=
 =?utf-8?B?cisxWXhjZG9JamVYZEZFWGtvTC9ZdjhDSUNuczRERlE3MlVERDRGME1sSEZK?=
 =?utf-8?B?VmJFcFQ2Y29mNGl5cUZmM2FXVnlucXdTK3RBZTFlOUN1RHFyVmFJRXJWUUR2?=
 =?utf-8?B?ZmNZSjhyNHl0SEhhcHNZTnRqS0w5MnpTZVRENlBtNDNTdEdiWTdwMjIvOFdy?=
 =?utf-8?B?ZHFkL2h2SjNjSDRUS3B6QW9OSnF3WG5Xd1FzYXk1UUFvSXNnSER5STFLYUc3?=
 =?utf-8?B?ZWVhb1luZ3RRL0F5RGE3TFIwOFEweTl6UWRuUEZqUjl1aTZNcWpRUU9UMk1F?=
 =?utf-8?B?ZXduYUdsOVF5cXdqS0VBZmR0bzJ3MlBsSlQ4SDhUVnR2Q2s4dHZEY1RXRDJv?=
 =?utf-8?B?OGNURnZRMFZHMHU4NlN3QVFRVCt4WGVVUkl2THN2N1BidThoZU05L3pXMDcy?=
 =?utf-8?B?SWVSNmtObXN6TWxSdVJrMnNodGlvSlhLRG9hTTNNeDYwcFl1dUlycE1oL2tq?=
 =?utf-8?B?WDhybXgyWVIzc3h0VURNM3JUMkFkbkxhUVVROWk0ZDBDYVRrMWJwRWJia1Z0?=
 =?utf-8?B?SXJSS2daZ3lWZlpVMDYwVFV4QWlGbXVqeTM2VVN4cEtsTEhvOUhTSWVXYm14?=
 =?utf-8?B?cjMvK0hsZVBzTG10bThWZHFrWUxmQWR4bE5qWFJ5WGNFakpicU0xRzB3SUVU?=
 =?utf-8?B?bmYxWDIwZEZTRWhVbEQ2UDdrQUFkdEczQmZNOXJCQnN3ZWMraElQdE1RaXFa?=
 =?utf-8?B?ZXdmZXVibldXUTkwaDRJM3BTUmpFalRYb2lKWnYxMVp3enRzb2kxUCsvckQw?=
 =?utf-8?Q?AG98uNP3PcxbHUNr5rt2GaopKlHjfkx8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU9wMHQ1MEdNQlFuOTJHdHNZZDBoSHRCWUtsOTF6dFh0d0tsT1FGcFlZQzMr?=
 =?utf-8?B?QnV2YUtvalBtTGM2R2xiRFB5Vk80cTVna1YwTUlmR1dROC9acDNGdVc0Qllu?=
 =?utf-8?B?Y2VIdDBVekxWNVI2eXFsbHhqOVBmMkJ3SUhSQndGazJuUjBFK3YzSG9vbkRs?=
 =?utf-8?B?N0Vvc0pnaXFDeVZSOGRwbEl2cCtLaU5SdkI1TmdXenpDc2lXeUZvMjZMdUg1?=
 =?utf-8?B?WUpaL1VoTElGbnUyb2NJSEZWV3hGNUJTQk9wK1FuZmVCc3Q2L2dwNEd6OS8z?=
 =?utf-8?B?V215MUVsT3lTOVM0MHJKK1RORlFhd0h2aTFqL09iS0lYb3lpTzliekFwcHV2?=
 =?utf-8?B?Q1ozMndDMEhBL1FJdGpSdWZqYzNiKzkrK1dtNnpTazJBK0drZ1krZFFCNnZj?=
 =?utf-8?B?WkVJRk1OODFtdHZ5ckdJelNJZ0hoR3ZFeDBmM1kzLzRlRndFbGZkSEZsNG5Z?=
 =?utf-8?B?c3dEQTRVeFlPMHBrcitSUzduOFpzTG8rMjg3SWc4a2xOL3N0VDViUmdVODRv?=
 =?utf-8?B?YmY4blU3UkcrMVdBRjJub01GNysvWHpqTkMzRFJSOUd0TzZuOHQ3VkJIdHFL?=
 =?utf-8?B?bFFpMnB2cjhQeThObHJJOWIwdngyZnlXS3lpd3VoR2EwNVNjYVI3UE9PL1l1?=
 =?utf-8?B?STh5TUpOcS80ZWs0eExpQldlcHU0cXNaSUFGemhmNDcvU1FlOS96bWExSGNa?=
 =?utf-8?B?elZnUTJnUHQ5dDlpeEc3UkhmRy95ZXh0U0ZnL2VrTnVrakpWSXdkQlpYYU03?=
 =?utf-8?B?ZVZwQXhWUzBsK0I4Mnh6RnFlNU5MTnhSRWZ1c1lMd2VualE4Mmo0dklUWE1H?=
 =?utf-8?B?dmFBbWVpVHBFd05aL2NGZS9mNkE2YWM4bytsckp4VWJtbHphQ2lvQUpEZkd3?=
 =?utf-8?B?YjlqWnhsQ2xrcG5yclJlcjBKUy8xNS9Vc2d3L2syREM0TDJVRHhCc3pWU3Fv?=
 =?utf-8?B?YXh6VUpkWHBMVnpZVWZ1ck9Sdy85MVZVQ2pRSVoxQVYxalk3Z3haUjZ0cm1T?=
 =?utf-8?B?dGhXem5xM3NMclQ4ZndnN3Z4OFpNQ0g2WHpHelBOa2FuMHVjdW1xM0dpL1ZT?=
 =?utf-8?B?OG9ObWZ2eXJhd3hmSU1yM2dweTk0WGs4NnBKUFRlZkpsZForaWxqWXVlNzJC?=
 =?utf-8?B?Z1RFYnhMU0JWN2VnYnQxeHR6dnA2RVluZUpWTmMzdGw4YUJabkRUcDdxaTBp?=
 =?utf-8?B?S3dZaDdUUUY1bndzZHZUOXF3Wm9TZWVqT1EwdHN2SThLNlZaQi9neXlhVmNz?=
 =?utf-8?B?dnpGUW1YK2ZwRUJNL3dORDM1dTM1ZFk5WmVPRTVRNVAybmZKVG1pa2JHcFp0?=
 =?utf-8?B?TFpHNlpMTE0vWXM5eE1mbkk1ZGRzMEVzYXB5cmorM0RtcFBGclREZ054NGx1?=
 =?utf-8?B?eUVOUS9TOVNxSE1BcnIxZVpCUVFHbmVtYkp0TE5IS1ZuQUs5dXpLWmRHV1BV?=
 =?utf-8?B?ekRMZjRrQ25hY3hERzl0M2pGdnJVOWZhZzN4TWpKSTBOdHVlYUxGazNNR1VM?=
 =?utf-8?B?WTh6NkY5NGpNK3UyQlBxa0p0NERXOU96dXpuNS9FbWUxUHFPN2VnbmZzY1k5?=
 =?utf-8?B?N2JDYlFYNGlQaWZFVjgzb3Nzc3l1bzN5UXdGNmlhM1YwNTl1VjI4Z1pDZUNC?=
 =?utf-8?B?SHIvdFRPY3l5QW1HRkp1R1ozOUhWT0tRVU1YUlk4TVJ6QlkwMTRXVW5tanQ5?=
 =?utf-8?B?WVN0SEhuR0FPN3VKZ3U2bzZmTDN4bHc5YmlxUFh3b28yVU5VenJyS20zcTdX?=
 =?utf-8?B?TTZ1OFNRcm41Mjh3ZVNxbTcyV1NwRzVjVEZsL3hyOXBFaU01ZWdGYkEzYW1z?=
 =?utf-8?B?OUhsaE1IcmlnS0JwWWNtZWhUWHQxM254b2RDMEFGREdTblZ2Y1Uya0VCeUJF?=
 =?utf-8?B?YUFiSUg3TWx6aUY2NWVUOEJ2aHl4ZW93OFdpSnZyeEZ5RnpsM3dDek90WERK?=
 =?utf-8?B?a1BMekx5TEV3NDVFNmVMVlcxQ3c0dU8xUm1lN1BOblpvcVJTU2QxY0V2V0tx?=
 =?utf-8?B?YTkxd0svUFdSWHYxbWxxS3E0QllXY3E3UGRZMFRYR1A3RDZVS2JkcUJrQU02?=
 =?utf-8?B?SWtPVHJCRWFBZk1KVCs3OFF0NUlXcm1wNDBabXRjaEIxRCswSnB4SHI1RklM?=
 =?utf-8?B?K0NuS1k4b1ZOVTNsU2pIbUJkK2cxdEsrb0gva09xUUZmNlhtTmxiR2lkTEs3?=
 =?utf-8?B?bWJVblpLUUcxNmlXUklxUUI4YjRyd295Q2NONUlJRXg0YTBDRVVSK29EU285?=
 =?utf-8?B?b0hTNWdnSTdLakxQaUQ2OTY2VlZadHJiZ0lJb2VZTDNPcTA3VDJJak4xVHFp?=
 =?utf-8?Q?zsEQZ2f1BxeNplmgzW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114abe09-ceae-4686-3afd-08de51dc904c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:14:49.4299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJlJEj4tiHAPd3ZKQs8b3DcnvJpUGTtwUQfchRaojBuGJtQsapbYG1MXQRpgAilK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6546
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

Hi Honglei,

On 1/12/26 13:57, Honglei Huang wrote:
> 
> Yes, you are absolutely correct. The use case is exactly userptr handling in QEMU for KFD SVM support.

Well userptr and at least HMM based SVM are two completely different things, but I think your use case is just to import selected pages from the guest as userptr into the driver instance on the host side, correct?

>> "What we could potentially do is to create an userptr which is not backed by a range in the user space VA, but rather individual offsets."
> 
> I'm very interested in understanding how to implement this "single object with individual offsets" pattern properly.
> 
> Since standard `mmu_interval_notifier` is designed for contiguous VA ranges, my main question is how to handle invalidation for a set of scattered offsets

Yeah exactly that's the point: This is use case is not supported at all by MMU notifiers!

MMU notifiers are designed to have a handful of ranges to invalidate, and *not* individual pages. So even the core Linux components can't handle this use case efficiently.

We would need to modify the MMU notifiers to do this and that is extremely unlikely to happen.

What could maybe work is to avoid the problem from a complete different direction. mremap() can be used in userspace to make scattered VA addresses look linear.

See the MREMAP_DONTUNMAP flag to the mremap() system call here: https://www.man7.org/linux/man-pages/man2/mremap.2.html

So what could be done is to instead of giving the driver hundreds of different userptr VAs to map into a single buffer map them in userspace into a linear VA and then use that instead.

> with a single notifier:
> 
> 1. Notifier Registration: Would we register a single notifier covering the entire min-to-max VA span of all offsets? Or is there a way to make a notifier aware of a non-contiguous list?
> 
> 2. Structure: Should we introduce a new `kgd_mem` variants that holds a scatter-list of `(va, size)` pairs instead of `(start, size)`?

Please drop any plan to implement this in the KFD interface. I think both Felix and I agree that this isn't feasible any more.

Regards,
Christian.

> 
> 
> Regards,
> Honglei
> 
> On 2026/1/12 18:12, Christian König wrote:
>> Hi Honglei,
>>
>> as far as I can see this is only very very trickily doable.
>>
>> What exactly is the use case for this? Userptr handling in QEMU?
>>
>> What we could potentially do is to create an userptr which is not backed by a range in the user space VA, but rather individual offsets.
>>
>> And yes in general you need a single MMU notifier for this, but the notifier mechanism is actually not really made for this use case.
>>
>> Regards,
>> Christian.
>>
>> On 1/10/26 03:30, Honglei Huang wrote:
>>>
>>> Hi Christian,
>>>
>>> Thank you for reviewing the patch. You mentioned the MMU notifier range
>>> handling is incorrect - I'd really appreciate your guidance on what the
>>> proper approach should be.
>>>
>>> Specifically, could you help me understand what's wrong with the current
>>> implementation:
>>>
>>> 1. Is the per-range mmu_interval_notifier approach fundamentally flawed?
>>> 2. Should multiple ranges be handled with a single notifier instead?
>>> 3. Is there a different mechanism I should be using for scattered userptr ranges?
>>> 4. Are there locking or synchronization issues I'm missing?
>>>
>>> I want to understand if this is:
>>> - A fixable implementation issue where I can correct the approach and resubmit, or
>>> - A fundamentally wrong direction where I should pursue a different solution entirely
>>>
>>> Either way, I'd value your technical guidance on the correct approach for
>>> handling multiple non-contiguous userptr ranges, as the underlying performance
>>> problem in virtualized environments is something I need to solve.
>>>
>>> Thanks for your time,
>>>
>>> Regards,
>>> Honglei Huang
>>> On 2026/1/9 17:07, Christian König wrote:
>>>> Hi Honglei,
>>>>
>>>> I have to agree with Felix. Adding such complexity to the KFD API is a clear no-go from my side.
>>>>
>>>> Just skimming over the patch it's obvious that this isn't correctly implemented. You simply can't the MMU notifier ranges likes this.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>> On 1/9/26 08:55, Honglei Huang wrote:
>>>>>
>>>>> Hi Felix,
>>>>>
>>>>> Thank you for the feedback. I understand your concern about API maintenance.
>>>>>
>>>>>   From what I can see, KFD is still the core driver for all GPU compute workloads. The entire compute ecosystem is built on KFD's infrastructure and continues to rely on it. While the unification work is ongoing, any transition to DRM render node APIs would naturally take considerable time, and KFD is expected to remain the primary interface for compute for the foreseeable future. This batch allocation issue is affecting performance in some specific computing scenarios.
>>>>>
>>>>> You're absolutely right about the API proliferation concern. Based on your feedback, I'd like to revise the approach for v3 to minimize impact by reusing the existing ioctl instead of adding a new API:
>>>>>
>>>>> - Reuse existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl
>>>>> - Add one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>>>> - When flag is set, mmap_offset field points to range array
>>>>> - No new ioctl command, no new structure
>>>>>
>>>>> This changes the API surface from adding a new ioctl to adding just one flag.
>>>>>
>>>>> Actually the implementation modifies DRM's GPU memory management
>>>>> infrastructure in amdgpu_amdkfd_gpuvm.c. If DRM render node needs similar functionality later, these functions could be directly reused.
>>>>>
>>>>> Would you be willing to review v3 with this approach?
>>>>>
>>>>> Regards,
>>>>> Honglei Huang
>>>>>
>>>>> On 2026/1/9 03:46, Felix Kuehling wrote:
>>>>>> I don't have time to review this in detail right now. I am concerned about adding new KFD API, when the trend is moving towards DRM render node APIs. This creates additional burden for ongoing support of these APIs in addition to the inevitable DRM render node duplicates we'll have in the future. Would it be possible to implement this batch userptr allocation in a render node API from the start?
>>>>>>
>>>>>> Regards,
>>>>>>      Felix
>>>>>>
>>>>>>
>>>>>> On 2026-01-04 02:21, Honglei Huang wrote:
>>>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>>>
>>>>>>> Hi all,
>>>>>>>
>>>>>>> This is v2 of the patch series to support allocating multiple non- contiguous
>>>>>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>>>>>
>>>>>>> **Key improvements over v1:**
>>>>>>> - NO memory pinning: uses HMM for page tracking, pages can be swapped/ migrated
>>>>>>> - NO impact on SVM subsystem: avoids complexity during KFD/KGD unification
>>>>>>> - Better approach: userptr's VA remapping design is ideal for scattered VA registration
>>>>>>>
>>>>>>> Based on community feedback, v2 takes a completely different implementation
>>>>>>> approach by leveraging the existing userptr infrastructure rather than
>>>>>>> introducing new SVM-based mechanisms that required memory pinning.
>>>>>>>
>>>>>>> Changes from v1
>>>>>>> ===============
>>>>>>>
>>>>>>> v1 attempted to solve this problem through the SVM subsystem by:
>>>>>>> - Adding a new AMDKFD_IOC_SVM_RANGES ioctl for batch SVM range registration
>>>>>>> - Introducing KFD_IOCTL_SVM_ATTR_MAPPED attribute for special VMA handling
>>>>>>> - Using pin_user_pages_fast() to pin scattered memory ranges
>>>>>>> - Registering multiple SVM ranges with pinned pages
>>>>>>>
>>>>>>> This approach had significant drawbacks:
>>>>>>> 1. Memory pinning defeated the purpose of HMM-based SVM's on-demand paging
>>>>>>> 2. Added complexity to the SVM subsystem
>>>>>>> 3. Prevented memory oversubscription and dynamic migration
>>>>>>> 4. Could cause memory pressure due to locked pages
>>>>>>> 5. Interfered with NUMA optimization and page migration
>>>>>>>
>>>>>>> v2 Implementation Approach
>>>>>>> ==========================
>>>>>>>
>>>>>>> 1. **No memory pinning required**
>>>>>>>       - Uses HMM (Heterogeneous Memory Management) for page tracking
>>>>>>>       - Pages are NOT pinned, can be swapped/migrated when not in use
>>>>>>>       - Supports dynamic page eviction and on-demand restore like standard userptr
>>>>>>>
>>>>>>> 2. **Zero impact on KFD SVM subsystem**
>>>>>>>       - Extends ALLOC_MEMORY_OF_GPU path, not SVM
>>>>>>>       - New ioctl: AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH
>>>>>>>       - Zero changes to SVM code, limited scope of changes
>>>>>>>
>>>>>>> 3. **Perfect fit for non-contiguous VA registration**
>>>>>>>       - Userptr design naturally supports GPU VA != CPU VA mapping
>>>>>>>       - Multiple non-contiguous CPU VA ranges -> single contiguous GPU VA
>>>>>>>       - Unlike KFD SVM which maintains VA identity, userptr allows remapping,
>>>>>>>         This VA remapping capability makes userptr ideal for scattered allocations
>>>>>>>
>>>>>>> **Implementation Details:**
>>>>>>>       - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>>>>>       - All ranges validated together and mapped to contiguous GPU VA
>>>>>>>       - Single kgd_mem object with array of user_range_info structures
>>>>>>>       - Unified eviction/restore path for all ranges in a batch
>>>>>>>
>>>>>>> Patch Series Overview
>>>>>>> =====================
>>>>>>>
>>>>>>> Patch 1/4: Add AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH ioctl and data structures
>>>>>>>        - New ioctl command and kfd_ioctl_userptr_range structure
>>>>>>>        - UAPI for userspace to request batch userptr allocation
>>>>>>>
>>>>>>> Patch 2/4: Extend kgd_mem for batch userptr support
>>>>>>>        - Add user_range_info and associated fields to kgd_mem
>>>>>>>        - Data structures for tracking multiple ranges per allocation
>>>>>>>
>>>>>>> Patch 3/4: Implement batch userptr allocation and management
>>>>>>>        - Core functions: init_user_pages_batch(), get_user_pages_batch()
>>>>>>>        - Per-range eviction/restore handlers with unified management
>>>>>>>        - Integration with existing userptr eviction/validation flows
>>>>>>>
>>>>>>> Patch 4/4: Wire up batch userptr ioctl handler
>>>>>>>        - Ioctl handler with input validation
>>>>>>>        - SVM conflict checking for GPU VA and CPU VA ranges
>>>>>>>        - Integration with kfd_process and process_device infrastructure
>>>>>>>
>>>>>>> Performance Comparison
>>>>>>> ======================
>>>>>>>
>>>>>>> Before implementing this patch, we attempted a userspace solution that makes
>>>>>>> multiple calls to the existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl to
>>>>>>> register non-contiguous VA ranges individually. This approach resulted in
>>>>>>> severe performance degradation:
>>>>>>>
>>>>>>> **Userspace Multiple ioctl Approach:**
>>>>>>> - Benchmark score: ~80,000 (down from 200,000 on bare metal)
>>>>>>> - Performance loss: 60% degradation
>>>>>>>
>>>>>>> **This Kernel Batch ioctl Approach:**
>>>>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>>>> - Achieves near-native performance in virtualized environments
>>>>>>>
>>>>>>> The batch registration in kernel avoids the repeated syscall overhead and
>>>>>>> enables efficient unified management of scattered VA ranges, recovering most
>>>>>>> of the performance lost to virtualization.
>>>>>>>
>>>>>>> Testing Results
>>>>>>> ===============
>>>>>>>
>>>>>>> The series has been tested with:
>>>>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>>>>> - GPU compute workloads using the batch-allocated ranges
>>>>>>> - Memory pressure scenarios and eviction/restore cycles
>>>>>>> - OpenCL CTS in KVM guest environment
>>>>>>> - HIP catch tests in KVM guest environment
>>>>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>>>>> - Small LLM inference (3B-7B models) using HuggingFace transformers
>>>>>>>
>>>>>>> Corresponding userspace patche
>>>>>>> ================================
>>>>>>> Userspace ROCm changes for new ioctl:
>>>>>>> - libhsakmt: https://github.com/ROCm/rocm-systems/commit/ ac21716e5d6f68ec524e50eeef10d1d6ad7eae86
>>>>>>>
>>>>>>> Thank you for your review and waiting for the feedback.
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Honglei Huang
>>>>>>>
>>>>>>> Honglei Huang (4):
>>>>>>>      drm/amdkfd: Add batch userptr allocation UAPI
>>>>>>>      drm/amdkfd: Extend kgd_mem for batch userptr support
>>>>>>>      drm/amdkfd: Implement batch userptr allocation and management
>>>>>>>      drm/amdkfd: Wire up batch userptr ioctl handler
>>>>>>>
>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  21 +
>>>>>>>     .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 543 +++++++++++++++++-
>>>>>>>     drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 159 +++++
>>>>>>>     include/uapi/linux/kfd_ioctl.h                |  37 +-
>>>>>>>     4 files changed, 740 insertions(+), 20 deletions(-)
>>>>>>>
>>>>>
>>>>
>>>
>>
> 

