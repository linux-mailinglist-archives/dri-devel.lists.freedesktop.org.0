Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DDE987506
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 16:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D1210EB23;
	Thu, 26 Sep 2024 14:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pTNyHu2K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2059.outbound.protection.outlook.com [40.107.95.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DAF10EB23
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 14:03:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NumZetP54zJxEXatUijV5SpvxmDvKbF5r60qWcnBXE6IY1XGdC59xGTwwp+eYluqtY1Ay6FuLpX7i887Ex+j77i3AfCosIzNrLhpm3a1cbfyTNZ+yvRWpWB3fEC3HzvUyjH+juj5upKIePznnp2qDTRUSI+aYoS89gzAYkgLTCN41eblD3rw/yZEkbQjSgz/Mix0AZ8XR20e1MEW+aC0umEi8gZ6nrcvJtTWcJmhN+hHLAh3q0T9GJUF3M6PLPDGaPuHpAH3lWqbGCFN5Tdhfb8SrVHjakRUzRqps0RBketMXq8eqPoq2AC803ulAjKQ8c4x6jrn0676EmIHZttnrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5Mfrckd316V4KsIdx/7169r/Hjdgl14NZcp2/IsiE0=;
 b=euHw+6yi42y65mdi6XtzjuGYH9ZquEau20ECIxqGydP1SvNVFf0NMENveVyhvDHf/L6uBK2Ssjr6pXFRGsRlz/c6Zey/9JeMARnToDdLJ6f8CEZwiEwcCJwV6PSmVTgvkAkEjXPSHmRO613uqrja2FMLQHobiGI45xzQ3ZJ/BTFUKh5tKePJ1gcGl3l+ENaIRtXtrlo98N9nq1yL8Xw6IuHLUOy4RSIUg02LbbWi/of4s/d0MuZ8dSw7EB1g6iBjDwzak8RuXKS0C7hgUu4fWAWY2ya3IGNtw5Sy3We+d2lKaMnZJzfNu16fIKo6kBPDKb8FOChNVCeEivOQGoKRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5Mfrckd316V4KsIdx/7169r/Hjdgl14NZcp2/IsiE0=;
 b=pTNyHu2KsB8OY1rx8x5lv358HXAr6oBAIie/vBbkmMnPxv9GLFVXCOZfY/QzyTyZ0taOf66noXGiy/nDF15de4S9ZLQc9WPfd+cS5fMRlxdvvgYctL6rtxLPqnYfOFsfij4q4TNyXYrxWq8KybYbnyugDI44+qkFcAEWIQA4bBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8699.namprd12.prod.outlook.com (2603:10b6:806:389::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Thu, 26 Sep
 2024 14:03:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8005.020; Thu, 26 Sep 2024
 14:03:03 +0000
Message-ID: <2ab11399-ffa0-4940-a965-fb95a5f3b20e@amd.com>
Date: Thu, 26 Sep 2024 16:02:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [RFC PATCH 0/4] Linaro restricted heap
To: Sumit Garg <sumit.garg@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Andrew Davis <afd@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
 <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
 <e967e382-6cca-4dee-8333-39892d532f71@gmail.com>
 <lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas>
 <04caa788-19a6-4336-985c-4eb191c24438@amd.com>
 <2f9a4abe-b2fc-4bc7-9926-1da2d38f5080@linaro.org>
 <CAFA6WYMd46quafJoGXjkCiPOKpYoDZdXwrNbG3QekyjB3_2FTA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAFA6WYMd46quafJoGXjkCiPOKpYoDZdXwrNbG3QekyjB3_2FTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::15) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ae5aae-454d-4c65-fcce-08dcde33ef95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3ltcWtWU1J2SGNXWHZXYWFFYUR2Lzk0V2xNYnUvOVZRL0lQR0dxVDlJY080?=
 =?utf-8?B?NjJZaVNxZW1hQjJrNzEwYkdNQUNtTUNoQUk4WGpPbWF3ZE11U0FqSGF3S1Ry?=
 =?utf-8?B?SHdHVlFYS3gyN2EvUWpxanVpQlRiQ0pyR1NZZytMODBuM1NXMEVKWndZNXQ0?=
 =?utf-8?B?QWJ0Z0N0TWU5cWtWeCtHenhMR3o1dGc5NXJEbXNUcXQzNkxYUjZHOHJ2dXFp?=
 =?utf-8?B?ZTMrOGJrN1BPMnlGaTlLNHNuUCs0dVBlM3FpeTNQaUhjK3BRei83WXNZQnNv?=
 =?utf-8?B?VVRJMWhZZ21vcWxBblFoYUx4QUVybzh0QWd6bVFWR05SOXhxZ1FRN2IrL24z?=
 =?utf-8?B?THRMTUJHb1hkM3RKT0d5VlUvaWNMc0NML1JUcWdDZnA3SlM4bHhBUFRGY3Ir?=
 =?utf-8?B?QkFSK1hWTkhIamRQMXlzcEFhR1lvTXZtb2RjR2RnWXRSbHdqcGs4dnFneTFl?=
 =?utf-8?B?ZmdKeTI5K1g5YkYwKzlsNFR1SXBpanVkRGFxRk9VUUFMZDhRVWwxbk5nbzVL?=
 =?utf-8?B?ZzZUT3hXeSttUmswRWpNdldheGFKTjNoQTRIOS82anNNT3luYVZrMzdiVnNl?=
 =?utf-8?B?S0pFM29oRHROR1pCT05XdjVaSFFtUXl1dGw3b3JGbU9kbS9Ddy9NQlVraUNK?=
 =?utf-8?B?dmR3dmlnZHVWSjZPQjVDMmQ1YTJkc21RNVJZaytRRjE1TEJJcDVvaGdWa2pQ?=
 =?utf-8?B?Z0FMTHhtTHBmVVVHeEdBdVdBN21LKzBnbjI4ZG15WDFPMUdSeXVYTm1CNkFi?=
 =?utf-8?B?ZmJabUFvNkZUV3JUdkJ2c2IzaXRSMG45NzZmWFltNVRLVXNmYmFYUHdITWN3?=
 =?utf-8?B?RUdVazZ5WldwcktYL280b3dlWmRZN2UraEFMaEY1M1BHZzJ1VDBBdjFOQnox?=
 =?utf-8?B?SVRQWVdFaDl0TmRjMWg3QXU5SmxCMDJiS0Zoai9XTGd6YXdGZWNuRzR5OGFC?=
 =?utf-8?B?MkZibytNQTJtU1NZYVlIMGpvREFoWC9PUllpZXF1Yy85THJja2s3Nk9sYVBV?=
 =?utf-8?B?K2NhV3NTVHhoNm1jSGx2ekUxdmpSVnE3YUZxbk1xM2ZMQjdwUTZFUldRV0Ux?=
 =?utf-8?B?WGZaYm9zd2p5MVM4Ri9TQTZqWHUwMXNrVERmRTJyQW1uZGhuVWZ4anljNUF3?=
 =?utf-8?B?OWZrM2M3WXNRMFJaRHZ2MmZ5Qm1hVWVBdjgxWlRXNWttYmFiN0NtSmJCNlRy?=
 =?utf-8?B?bHRHQ2l5ZkJXODZuWjAzdWtkZTdNWGhhTm9tS1pocUpxVkJSVGxBeWV2TG5t?=
 =?utf-8?B?SVdkRUdQVGo2c0E5Ymk5ZXZCM3NwdHFNeE1FVisramJRS2haZmEzZllWd05o?=
 =?utf-8?B?WVIyMkszMjF6V3loajJTYlRXTmR2NjV5TzRaSXRBalZaMGtZS0swUUhLUmdV?=
 =?utf-8?B?dGZqWDNYbytaTWllVVlyVWdkSHBTWnB6aEtZZVphYmlEcHpQT0FPWUc4MEZt?=
 =?utf-8?B?aDZpY282YXkrOFdWYzBXbWZxWThVTU1PeFBzTnhJNHN4cktwM0swcnVpbDBu?=
 =?utf-8?B?ZmVDVk45ZDZaMzNTNkxWZTRlRkxvZkMzQjNxNms2djc0U3VjSnE0T0FaSXVK?=
 =?utf-8?B?NVM0ZkkySnFaQzBDZjhXL0JjMTVuNXhYdmVHb1BrejByV2FrWEdTMk9RZTRa?=
 =?utf-8?B?bjA4WXNDekZmYTVENHFOcm8ycUI0UjJ6VUI0Mm5qaTlvTVJPczNPVVlCVVpu?=
 =?utf-8?B?TjQ5ZVFhUDA5cHR0Qng5b3FHNzFwVktMdStZbjhrOU9HMFVoa3laTE5RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V01kaGpEVVZFeDhIcUFlaGpacStUVjhpS1BqSTRsMVdVbnRROGZsMzc5TTgy?=
 =?utf-8?B?TW8xYU4ycmdYNXBqcU1ZU3VvR1BJeHVyVERKRGlCcW9tOEpZSDJ6cWM0NS95?=
 =?utf-8?B?eVpGVm5pR011dzZ2SzRObjJDUlB3QTJnU3F1OXI4UEoyeUVTRG5qRm5QcTU1?=
 =?utf-8?B?TW8yMGg3NkxQUGJCZWZBSUNXMDlmZmtLOVA3NnZYS3h1R3gvbWhqaHFXa2E2?=
 =?utf-8?B?emp4b3dQMktOQkUzV01ZSFRzT3hkWllIdVFURHNmcWFSdi90RE5pWnpnVmFm?=
 =?utf-8?B?dWlPSDNiVGRhNWpZSjhLUVkxakhXL1VxQkNnckczZCtXZmxsK0FwUG1hSGc4?=
 =?utf-8?B?TVZQSnZ4dXByTWRIekNHV002cUdxQkZFc3psUi9QL3hkaTNwQjBZcTZ0M2FE?=
 =?utf-8?B?OU5MSEFiVVUvQU5Pc3pGSHpuMXdEa0dqcE16SmFxUXZWdXNkMHc2ZWluL01u?=
 =?utf-8?B?MGNzenduREFtQmZRNVB4OUZLYm9odnJPb2N2a09IMDYzbnNKbGV6bXoyaWdJ?=
 =?utf-8?B?ajEzblZ6T2RsUjFVVUlIajN3ejhIOU9IbUExUmZPTDdkUUxITzM0UDJkMXZQ?=
 =?utf-8?B?Z3ZKOWd0NytNQ2dqZ1BxWE11QnpVMHhuUkxMUUpOK1ltQXFLbkUzWWhwUTJT?=
 =?utf-8?B?U1JKUk96TTVBYnRwOUsyaGhwQjlXTzN1c2ZWZzNWT0dDeXByL3NoaXlxb2Zv?=
 =?utf-8?B?djU2c2dIci9XM0YzZ0FTdkRDSHJmQUtLOVQyVzl0NTQvY0thTThDMjNDcnI1?=
 =?utf-8?B?a0VLVFNxbGZQQVJKNzZMa3c0dXBsR3pZREwwbnNvZFNuYWxyOWl1bkpFQWtH?=
 =?utf-8?B?UWRBeTNxYitxV2QyWmJYVTRQdlc0SFhGQStBZm1IeDdQM3dpTzlIZTI5MHkx?=
 =?utf-8?B?L3ordlA2cGwxUEJSbzJiUStTaW43L0V3QjJWWVVrYktEc1BPcVBPYUpqMFJB?=
 =?utf-8?B?ZFAzN0VQZjRJeEJrbHYzN1lFeTJsVjA1clc3NC9KaDhFT3V6cTBtSU12MHEx?=
 =?utf-8?B?UkFlTnJtMmhzSXUxMWtTekIycFNPUklBQWEvYmRKMTBvSk5UZmd0VTYrUnB4?=
 =?utf-8?B?a2pJK0FPSlNyMStycElqRXp4SnNRWVYyRXNTRDV6OTNCVzNoT1N6VDNiNnJH?=
 =?utf-8?B?TWphOWRrd1d1OUV0UGdwaXI0SlloS3M2MCtEK2IwUFNZK3pzWkZURVMxNHU3?=
 =?utf-8?B?dDZQbEY0d2ZpWGF2UUl1OFpqejZmc0tXbHdScU1VRzJMOE4vQ0RpZUVqMEw4?=
 =?utf-8?B?KzFLUVhTWFZ4WFNlYmZZaHhNWGhKQkJIdEJKQ2R4QVdhUVp2ckZXQjZKVGFa?=
 =?utf-8?B?NkdBZHJsaE5CVldjUGVRWG1rSG1QWDJ6V2NveVd5dEJCbFdubGI1VEVwWlBp?=
 =?utf-8?B?cUVGYnJieStFMmRsSnFaazVXVlhXRTh2VG9kK1VGWjhoNTBaK2xCMno0THRO?=
 =?utf-8?B?Q1FaUElEczlQVFVKa1kwSTBwUnhPZS9sMWNaSWI5b2FlWDVoWm9HSi9wdmMy?=
 =?utf-8?B?L1YxQm03QVhlWXFod3NkZThWSkNseHRSN3Q3WVVHV0UyOE1IdTlNRmpHTmpU?=
 =?utf-8?B?M3pvTXdUYTcyV0RleFhISDRJQzlJMWliRVpaUEZ5WitHODdtak9aUjlxZkZ4?=
 =?utf-8?B?UUJ6eUkyNEFpVTZBaTZMTWE2M1ArRTlJNnBOMU54ZURyUzIxVWJ1UkVQR0tp?=
 =?utf-8?B?K3UvanFRQ2ZZMHdGa2hmNUk0UkowaE0wN3NLaDF3ZHBORjVpN3J2NUw5YU9t?=
 =?utf-8?B?K1VDdzZ2QjUvQyszQ3NsdmMrQnUxdjJzeHRDdmJRcFYyelFZYnNZTDd6ZUdT?=
 =?utf-8?B?cVYrOWYycEZHb010QUtqeWFPTDNndlgzT0dzOUFnWXdlRzltQm1vSGhhMEZD?=
 =?utf-8?B?Ymo2V2VCbFVRMnJXUUJNNzIrQW1DcFdXSHBSV0FoQlc5dmo0blpQV1UrYnJW?=
 =?utf-8?B?OFA1UVNJTmM0L3VVODI5cFUwbUwyYTBFM3JQSHJDaWVyTTRNbFNqY01MdUlX?=
 =?utf-8?B?RDh4aFJtRmhHWFJtR0NWSllCa3dUT3VrQWoybWZvUnExTmd6Q1BOSE40UGVU?=
 =?utf-8?B?SG53MTB6ZXJhTGxhdCt3UWorV3BaMWI5VUdGbGtZY1BJUEg3MkZkbDdLY0Q2?=
 =?utf-8?Q?u8jA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ae5aae-454d-4c65-fcce-08dcde33ef95
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 14:03:03.4161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSpUjBUP2I84eC8+dvk/Lfn8GyVgbBtaBXjcoQng3JCV5y/JrQ/9uA3hCVL86cBw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699
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

Am 26.09.24 um 15:52 schrieb Sumit Garg:
> [Resend in plain text format as my earlier message was rejected by
> some mailing lists]
>
> On Thu, 26 Sept 2024 at 19:17, Sumit Garg <sumit.garg@linaro.org> wrote:
>> On 9/25/24 19:31, Christian König wrote:
>>
>> Am 25.09.24 um 14:51 schrieb Dmitry Baryshkov:
>>
>> On Wed, Sep 25, 2024 at 10:51:15AM GMT, Christian König wrote:
>>
>> Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
>>
>> On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
>>
>> On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
>>
>> Hi,
>>
>> On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
>>
>> Hi,
>>
>> This patch set is based on top of Yong Wu's restricted heap patch set [1].
>> It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
>>
>> The Linaro restricted heap uses genalloc in the kernel to manage the heap
>> carvout. This is a difference from the Mediatek restricted heap which
>> relies on the secure world to manage the carveout.
>>
>> I've tried to adress the comments on [2], but [1] introduces changes so I'm
>> afraid I've had to skip some comments.
>>
>> I know I have raised the same question during LPC (in connection to
>> Qualcomm's dma-heap implementation). Is there any reason why we are
>> using generic heaps instead of allocating the dma-bufs on the device
>> side?
>>
>> In your case you already have TEE device, you can use it to allocate and
>> export dma-bufs, which then get imported by the V4L and DRM drivers.
>>
>> This goes to the heart of why we have dma-heaps in the first place.
>> We don't want to burden userspace with having to figure out the right
>> place to get a dma-buf for a given use-case on a given hardware.
>> That would be very non-portable, and fail at the core purpose of
>> a kernel: to abstract hardware specifics away.
>>
>> Unfortunately all proposals to use dma-buf heaps were moving in the
>> described direction: let app select (somehow) from a platform- and
>> vendor- specific list of dma-buf heaps. In the kernel we at least know
>> the platform on which the system is running. Userspace generally doesn't
>> (and shouldn't). As such, it seems better to me to keep the knowledge in
>> the kernel and allow userspace do its job by calling into existing
>> device drivers.
>>
>> The idea of letting the kernel fully abstract away the complexity of inter
>> device data exchange is a completely failed design. There has been plenty of
>> evidence for that over the years.
>>
>> Because of this in DMA-buf it's an intentional design decision that
>> userspace and *not* the kernel decides where and what to allocate from.
>>
>> Hmm, ok.
>>
>> What the kernel should provide are the necessary information what type of
>> memory a device can work with and if certain memory is accessible or not.
>> This is the part which is unfortunately still not well defined nor
>> implemented at the moment.
>>
>> Apart from that there are a whole bunch of intentional design decision which
>> should prevent developers to move allocation decision inside the kernel. For
>> example DMA-buf doesn't know what the content of the buffer is (except for
>> it's total size) and which use cases a buffer will be used with.
>>
>> So the question if memory should be exposed through DMA-heaps or a driver
>> specific allocator is not a question of abstraction, but rather one of the
>> physical location and accessibility of the memory.
>>
>> If the memory is attached to any physical device, e.g. local memory on a
>> dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose the
>> memory as device specific allocator.
>>
>> So, for embedded systems with unified memory all buffers (maybe except
>> PCIe BARs) should come from DMA-BUF heaps, correct?
>>
>>
>>  From what I know that is correct, yes. Question is really if that will stay this way.
>>
>> Neural accelerators look a lot stripped down FPGAs these days and the benefit of local memory for GPUs is known for decades.
>>
>> Could be that designs with local specialized memory see a revival any time, who knows.
>>
>> If the memory is not physically attached to any device, but rather just
>> memory attached to the CPU or a system wide memory controller then expose
>> the memory as DMA-heap with specific requirements (e.g. certain sized pages,
>> contiguous, restricted, encrypted, ...).
>>
>> Is encrypted / protected a part of the allocation contract or should it
>> be enforced separately via a call to TEE / SCM / anything else?
>>
>>
>> Well that is a really good question I can't fully answer either. From what I know now I would say it depends on the design.
>>
> IMHO, I think Dmitry's proposal to rather allow the TEE device to be
> the allocator and exporter of DMA-bufs related to restricted memory
> makes sense to me. Since it's really the TEE implementation (OP-TEE,
> AMD-TEE, TS-TEE or future QTEE) which sets up the restrictions on a
> particular piece of allocated memory. AFAIK, that happens after the
> DMA-buf gets allocated and then user-space calls into TEE to set up
> which media pipeline is going to access that particular DMA-buf. It
> can also be a static contract depending on a particular platform
> design.
>
> As Jens noted in the other thread, we already manage shared memory
> allocations (from a static carve-out or dynamically mapped) for
> communications among Linux and TEE that were based on DMA-bufs earlier
> but since we didn't required them to be shared with other devices, so
> we rather switched to anonymous memory.
>
>  From user-space perspective, it's cleaner to use TEE device IOCTLs for
> DMA-buf allocations since it already knows which underlying TEE
> implementation it's communicating with rather than first figuring out
> which DMA heap to use for allocation and then communicating with TEE
> implementation.

+1

I'm not that deeply into the functionality the TEE device IOCTLs expose, 
so can't judge if what's said above is correct or not.

But in general building on top of existing infrastructure and 
information is a really strong argument for a design.

So from my 10 mile high point of view that sounds like the way to go.

Regards,
Christian.

>
> -Sumit

