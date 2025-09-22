Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF21B91881
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 15:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BAE10E4B0;
	Mon, 22 Sep 2025 13:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="niBdQoQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB9210E1CE;
 Mon, 22 Sep 2025 13:57:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ur682Wn2DomcRNGbYo8CcWdFkNAHW3MMvbkXoTrWGQnNjBgPYjkTY8U1QyDdpuIYXI7Zkg84dJrgHX/RiFtXA710RwpS6BVsausOAK1w1yTNfwlgD5LQTF++4wYpgngYXiykOySzM5ECFuSovDZ83s4tMYlr7HxGyciKyvPr9hLZkwcabqvCV67Ca6cZP4F+d+I6fW2b6M06aQU4qkCOe/NCJhRJZ6ZRIXU0m07sPnb3SstJqfaHXKvYzWP1kZHQM0DugVWO2gn1yOU/H3/pbRa8bm7sfHBEKSXqQxd9//h2Whabj8PDyc+FQM3yj+pvyYDcmMYPRi/ITQ95bZFTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS1Y7WrwZMKmaQ3pLvF2J6U1mr8unnbzz3y61nUrzFc=;
 b=Z4OIKsN+/A1t16+bk5GCJczqInx2rpLj4jgJ/Kw01G5Jti2s0EzDM5cXRZSa6/ntUTXkuq2SkKYWxWC1t21rkWCegz13pL5Cf6WPyqZX1OKIdSYwhcV3i/lhlDBhmjfp6hqhdY8R2evrmHHx13nWMQzNxOcieADXvkSSD/hF5rPKmS0urOOUiQ32C3wGZRqrp8A+G51k4S4qxRFrml/64a2WpiHc+Qu81tiKxCLPj3IzXNz11HnQKeWVvSNmGS6tLUxazaF/wdmhtLvsUfbNJTr29dzhD4S02tX9TG4a3KufNK3pGN+YqSt6Z4Um29lusoKIJqH/lkX7cJn0N6b02A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS1Y7WrwZMKmaQ3pLvF2J6U1mr8unnbzz3y61nUrzFc=;
 b=niBdQoQ0f+ZpcNoxZGkRgQs/VMHTfCaJy73Z5eLgY31JOSR2hccUNKiWW1tEKpDDyuTNAbr3EbG/FDacgqkFvF/EAKry0LCvD5KkO/v4lgZzEyYUV8mhZI+ozODuKrCQkg5YJTrHZjv1YhsGaXL4GPCT7sW5+rt1O3XBSH2Wgvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6279.namprd12.prod.outlook.com (2603:10b6:8:a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 13:57:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 13:57:08 +0000
Message-ID: <42f45fa2-6ea3-44c7-870a-dc1973894a87@amd.com>
Date: Mon, 22 Sep 2025 15:57:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <4e3919c3-3d1b-4f34-a1e4-5e9e7a5e6e14@amd.com>
 <20250922122900.GV1391379@nvidia.com>
 <fbb6bbe7-8141-4532-812e-2b93cc2fcb1b@amd.com>
 <20250922132720.GY1391379@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250922132720.GY1391379@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: ce4548a8-61c5-4ffd-b70f-08ddf9dfeb8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFZSWmdDRlU4YlZBN1pIWXFyV21ZUHRJM00veG5seS9hMW9MaHpVWU5sNkRI?=
 =?utf-8?B?SlJGa3B0VUE5dytqZUtLUjVYVjhKQ2Z5MU1tamhCRmVHZ1JicEpIVVQ5VTN2?=
 =?utf-8?B?K2pXQ1FaTzhJbjYwS3N5aUNGalg5NWN0ODByZ01MNXpkZ1lsRDJTakxvZ2tv?=
 =?utf-8?B?TVNoSmkwaEdQRVlqeUNoejJKdUlXZnlvWENaeThMcDVxKzlCMGNpUGtoMFVK?=
 =?utf-8?B?QkxwSGh2ZlF1TDhVYzBVRGRnNmsva2RCZE0zVHZwVm02ODNkcUs1a3Q0Lzhj?=
 =?utf-8?B?RjNVUU9kaUZWTU5pNU9oZnpjanNTL3NTclcyaStBRHIxOUdIaklVdWlaSGxN?=
 =?utf-8?B?QW56UmU4aDhxYmx5Y1VEM0pYb2ptdm9ZZjV1RTE2VjEyVkFGQzBNMlhjSFdo?=
 =?utf-8?B?Tm43SlJodXlQNlJETlRuOGIxd1lPUDNobXpTWVZ5VVFpRWh6V0VMNXlXdjFQ?=
 =?utf-8?B?YVpIY2l6M2NmQ29zVXRHZVljR05DSEhrRndVVWtkMGhTOGVjd29nWjN2THV3?=
 =?utf-8?B?MkJqYU1JZUhselRqK2o3MUMvc1RpVy81amc1RGtMT1lhVVJWVDZFVmxTOVZW?=
 =?utf-8?B?dXRlWS9vd2hJdC91MlRvRUp2NHJKV3JYWTNIaEs0eFdoTXIvYkxlZGVoci9R?=
 =?utf-8?B?a3Q5Mm1FSlU0bjJVdERmdVpiTHFLOWxNbXBGMlRvY1NuVHNLVFZkc1RVc3Rm?=
 =?utf-8?B?U3QwVEJEbk91TnNZc294bGs0d0daRDZNQjRycmNBUHNiZ1BESjQ1T3FBZ3Av?=
 =?utf-8?B?VnB2cDBWM2NlM3VpdnZwMVAwUm9FT2NYRWFCVXRlVjh4NURzSElrQllnWElE?=
 =?utf-8?B?TDNwWUxJQk5WOXFzUkJHcVFYRDJTZmM1KzhhTnoyNHlHQndZRWdmRWo4cmxV?=
 =?utf-8?B?SjBlL3VoS1M0Mm1mUlI3R2dqekdlT3phTFNkZjU5RVR3eDU4dXluTUZsRCtw?=
 =?utf-8?B?bWtaNTUwZzlTL1B5aTZWaWQ5dVZyT04rbGtOL0dRTkhKRVo5T3l6N1VDK2cz?=
 =?utf-8?B?UWpDWDRmRjJmaElnSFgzREZ5Z05YbDdhcTgvK241WExlajV3VklHUkxIc29p?=
 =?utf-8?B?ZmpDbjdScjBiWDg4a3REVTQzUkdUSkw2Y2E0Rk16ZkdmYzRYVUpyakkrWktJ?=
 =?utf-8?B?aXhPbkdzZEp2N1IrbVBRRnVkZmp6RE1hc1dDaHhXWHpMVE1wYlBIaFJUd0pw?=
 =?utf-8?B?TVpJMUkyWnhmbzdWaHR3ZnVEL2ltdysrZUE5eEZFcjV6dEpIV054M2sxRVVs?=
 =?utf-8?B?T1Q5Ym8zWS82ekpacHlWQU84a0EzbUFDeDRPK0hZVjQ3NU9kdEdrbTQ3SHVy?=
 =?utf-8?B?Y1VYd1hkRGZlcG5QOGxPb1ZIZy91MTlxd29CSGljNktmYk9tc0d2Q1FBTU04?=
 =?utf-8?B?b2ltaXZqTVg3Q0l4UUd5dU12RU4zTGlTNm1iWUl3dmFVenhiRUllZ1pxcFZI?=
 =?utf-8?B?ZVFuR2hqR2tCY25zazhsaEM5RVprK1BrVG1yenZ5ZDlRMHAveU0wM3FvNkM5?=
 =?utf-8?B?c1k3YVJ3NWZvN2daYyt1d3c0bXJuYitpcG1uK3RLTHNKbUJkZG45ek9QNFRT?=
 =?utf-8?B?OVIrN28yUjFvczBXNlcxaXpaa2ZrOUpOY3N0T2t6bDdmRVp4c2dzakJ2a2hN?=
 =?utf-8?B?Y2pFMmdreDdpWWtDTmFVMHBVaXBIbGdxTFY3bSttUkZwZ0MyQ2NDSkR5Sm8r?=
 =?utf-8?B?SzQzdW10TDFKTnRWQkl4SlRqcmplMEZPZllOMi9kNDNCeGp0c01sZjVnUGNx?=
 =?utf-8?B?UnowZklHK3U5OWc0RExBUFdHT2ZsNVZwb0dRWXl2VVYyTVJNZUdLVGJ5bGtY?=
 =?utf-8?B?aVl1U3hNaUJ1bjNFNlU5dldCVURuVGlrVktwT1k0bVZ0NmpIL3NZWHdZL1pO?=
 =?utf-8?B?MFpVSUtKOGV6RGlrNlZDb1pkVmhxY21FWUYvTGpxb3ViSnhhU2drS2lubzBG?=
 =?utf-8?Q?Ee8RgZBeuzY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXdOR1ZaSkl5L01mNTd5T2dCUWFGejI1TFBTaW9BSG1HYnMvM1dtMEgzNnBM?=
 =?utf-8?B?WlJGSGhjUVg3c1R6RCtiS3JzcCtUeXQyVnRBby9qcWZrRkdiUytzdnhQVmFS?=
 =?utf-8?B?K0FiekFVM0srakMxM1NiQUhVZVB5ZzVwWTluZml0cjFpNFdSaHNTcWwzZmkr?=
 =?utf-8?B?TjNMVjI5dU14OFNhZDhWdTUrM1FpdUJBNGxXSEpTbi93Ti9mbHVvaGM3bWds?=
 =?utf-8?B?Ly9iODZKTE9IaFgvai9xeFhrWTh1RXlNK0FjUDNEUkpPOGd5UktTZUwzVi85?=
 =?utf-8?B?dk5zcDlUZW9KVE1XTWI3bzJYSlJHbXNRTFdDektPRlYvbkJUeVAzWU16czdS?=
 =?utf-8?B?Wi90UStnd2V3bzVJT2grcktYekFyV3c4bVNtb1cxb2o5dityZ3NEOFZSMFA0?=
 =?utf-8?B?Qlh2eEZQZHUrOVFQSUY4aFFGRGd3ZW9jSndhWmZNVDRjdFFuMjZJb1JtVHIz?=
 =?utf-8?B?WUkyaFNobEh3aWE3Qkh0ekJzS3BvMjFqQ0Ntd1czbHFhd2l0TDNjdFY2cEdp?=
 =?utf-8?B?RGxvekx6TWxqaStwQ3p1NXVyZFFGdG9La0F6Q0FST3B6U1h4TEFTYkRIQ0Y4?=
 =?utf-8?B?UnEzQ2hKb0JvemZWYThCdzZQcHFJbWswa0ZpTXRISUdjWXNGeXpmTllKRTFw?=
 =?utf-8?B?WVdHOW5HMjk5S09wdlMvVXZ1cTM5cWErRUs4cjFmV2lGU1p2cHJmVlFQeFlh?=
 =?utf-8?B?c3NhbkQwbCtiU3R1YTZjOVNzZnEveEdNUHVKN1p0TDNCditxVEdPdHA1dUpx?=
 =?utf-8?B?MlNuaGNtNnhsMzVaK1l1MTdSNUdad1g4N2RZOTR3dXRLNmFna0hrR3RUU0RJ?=
 =?utf-8?B?UVBSanZUaTRlc3NHZkFnZGV2OFdwb3dKNUIwNnZESFdoa3oyZTMzRDRuRkJ3?=
 =?utf-8?B?M1E0YVlmR3REcjZ6WWxwakR1WGRodmxOYkx6RklpdC9OdDh4SW9HTUJGSFU1?=
 =?utf-8?B?eC9tNHhMTUpoeGh1Z0dDWDI2dFcxRUFHTWptMk5kY2RsR3YvNzBxZzN2ak5v?=
 =?utf-8?B?R3kyMWd6cVBNNE8zTEMwaXU4YnA0TGtqSXBjL2tVdnQzbTRsM3hGUkZQOXZT?=
 =?utf-8?B?dXo3YlBYajhvVXBBVWtkY3dFUWpjN3N4RWlLOTN6RWdXalZncDI2ak9iYnZt?=
 =?utf-8?B?OHBrRWNEbk9jWDFKYUJ3NGZFakdiYWgweklFNnhGRlNxb1VQNWdRdWhObUVR?=
 =?utf-8?B?MjNmTjh2U3ZHUWVJT1VjNlg5ZUpJTWcycTVNbnNyTzZKK0pZeHE0RXN5WG1v?=
 =?utf-8?B?ZkZWNGR2UjhkRS93ZGtkV1JlWk5VdVVwamZpdGxuU1daMCszVzIyRHRZZmJR?=
 =?utf-8?B?S0dlU3YwUzQzVjNBWlJqSGJlalQ3dVMxOEZ6YlZGR2xjT041UThYWUNWT2du?=
 =?utf-8?B?akliMEpiTmViZ2I5dVZoWVU5blk5VlNHdzY1THY4UEFLdkJlR3RENlQ5bWxw?=
 =?utf-8?B?a3hUOUMvSS95M0xiM3F4N1p6bjhvWlVvUEM2bjVmT0orM3Z2bkFncGhXcUpt?=
 =?utf-8?B?bjhUZlBySFRiK01XS09yVGxPK1Y1MlFwaGtlQzBVblVPSkF6Tkc0anZEaDJH?=
 =?utf-8?B?czQxZmM0bS9nRlFnV0RUbFc3ZFY3UnF0WXMzNzlCWVdURkkxL2VnT1c2cFE5?=
 =?utf-8?B?MXIzb2hPRTN0SEZvYmE4cThuZTdQTVNGajJIMW1OSkQ1aTk2eCtCUzFqU0Nv?=
 =?utf-8?B?Q0w0bHQ0SC9sL1g0NFJLb0M4VHNGd3ZYaVpuM1U2WjdwMEhQU2N5NnAwTXR3?=
 =?utf-8?B?Y0xGOUt2VmRVMnUwMFo1aWNDc0lZdTdnU0czcDBJaEdaSkNqR3lVNEZ0ZjA2?=
 =?utf-8?B?NU5yMENtTTVZaFd3ZCtyQTdsYllFYzRaUXIzV0k4MlRLenhXd2o2Z21QV2Mr?=
 =?utf-8?B?eXNnQUNTNVlWNklUNWZOa0drYWYvMG1RczlQdDc3c1pOVUxtTElJTjRVR2Fn?=
 =?utf-8?B?M2xUSG5XU2JVT3VRWElsL3lTWERlMno2VW5rZzdTWlRHN0t4dnA3b0UxOVZs?=
 =?utf-8?B?THNJL0FvMUZ0S001aE1IM1pEd0ExZENnL2pWQ1psdmtZVW1ybjJjWlhSZ2RP?=
 =?utf-8?B?RXRLZnVhUWkxNVpkZzZKK0ZPSVRhZ0RPczkwODNUYXdlVVdCKzlFdlMrU3lO?=
 =?utf-8?Q?Zc4gn8gghtn3CQGXco/JlXUd0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4548a8-61c5-4ffd-b70f-08ddf9dfeb8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 13:57:08.4148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OaXXStIe+S2Kfu0LNhckkHp0tkhuHaEV8eaBPYi87RQA90oybYCnkBNiloPkGi+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6279
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

On 22.09.25 15:27, Jason Gunthorpe wrote:
> On Mon, Sep 22, 2025 at 03:20:49PM +0200, Christian König wrote:
> 
>> At least on AMD GPUs when you want to have a DMA-buf for a specific
>> part of the VFs resources then you ask the hypervisor driver
>> managing the PF for that and not the VFIO driver.
> 
> Having a UAPI on the PF to give DMABUFs for arbitary VRAM seems
> security exciting. I'd probably want to insist the calling process
> prove to the PF driver that it also has access to the VF.

Good point. In our use case it's the userspace hypervisor component (running as root) talking to the kernel hypervisor driver and it is only used to collect very specific crash information.

> Having the VF create the DMABUF is one way to do that, but I imagine
> there are other options.

Well how does the guest communicate to the host which parts of the VRAM should be exposed as DMA-buf in the first place?

> 
> But sure, if you can solve, or ignore, the security proof it makes a
> lot more sense.

I mean what I'm still missing is the whole picture. E.g. what is the reason why you want a DMA-buf of portions of the VFs resource on the host in the first place?

Is that for postmortem crash analysis? Providing some kind of service to the guest? Something completely different?

Regards,
Christian.

> 
> Jason

