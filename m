Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4948AC0C32
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACB610E0E0;
	Thu, 22 May 2025 13:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WjM8Ya6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41D010E0E0;
 Thu, 22 May 2025 13:05:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tje6bQB6ig1SWds4gwuK9Yn+McP7Dz9EZIWZsLfPLWI8TxzwoRb/4HkYgnX9B87rNyo/DD3FWYQ42PZo7l/lOIUrkkSYIbVetEsdEVdIBQ8XXeUr5FF8FqTx0xUMnfBoSNcifaEQtocmntVdLZb5k3gvf5H46OJKfOrxOK7LJ+sQ+5CPRl5ehnY9obq0AzxzTw6eKZAH/ivlkhcgWyX61uOqrLNF6ikoBWIMwt+z8jskehuRKaB6H7pD6XYIfXj2eI48Z40tWeJuf0k68oIydMIpsWRJuFBjBN9k/cIuUPORPBt0zeXy+R+gfV/YqJGAeI1UIA5X2UHm0ndZ6TBQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gzwa9008Jx6UJQWX7N3ve/G2JlUyMGk2w9YvtoUTY3E=;
 b=Bin3Knu8qPWr8MlHUWjFJol+CcA5VNx+uytjJ187TbguvIXmtzDFPTWDWSp9N3M59JFpeuznHV7EPiKvZG9I2YUSPHaL4w6iNBI22sf9IgI/5mR/JhrRsEVP6NIt5HSbhXC3tZGbCniV+jB6xhpJ8Qz04rq47G7LMbW6wQStsGEM7YJRfthz+Yly39DCLpBrbAcuXp/tYDI75i8kMy9UPyrBbrMIJnEM5FfJtKd8bnGo3IXf/U3NMP2L/9d/byN2+g9m2ilPaT9+ag0p9cAIW4dDaGm/0W6ZAy5Gm2EZt7PA7xKI/oW2beWzsUf3v0c9soTeqR5yujRRqTXtnqY33g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gzwa9008Jx6UJQWX7N3ve/G2JlUyMGk2w9YvtoUTY3E=;
 b=WjM8Ya6BBhrXDU//RBr/CwDBipznOXJbYv9doZP1ojJtu+Zaa12uM15aO2U/hsqzN9xD2A64pffg+2St0co/7G0z1zzmPligwc8yn0HO1NHjg2C+pDmwV1BRYAPye9F3HAd8pF85YNS3Fjl6CXJ5KifnIswhArvPeH4WAqLncfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 13:05:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 13:05:07 +0000
Message-ID: <aac87a7e-5a45-4b54-a43b-cb92c5df669c@amd.com>
Date: Thu, 22 May 2025 15:05:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
 <e5d74c0be68d641171271cdff2e71ec5eb312377.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e5d74c0be68d641171271cdff2e71ec5eb312377.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:208:530::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e1d1a5-d5ca-47a5-bd72-08dd993146d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3VnTWFWaVFhM3FJOGp0eHFHREpJdDF3UlRtbTZzV3NYT3EzNHhOR0puR05Y?=
 =?utf-8?B?Qi9RcGN5UEE1NlNJWTQwQ05mcTBQMkNGMVJHc2lYSWwxWjYzckduc1dYR1gr?=
 =?utf-8?B?alFFNWZMNnlUUkFnUTB1UTNoNk5CSVQ2WDlqeXBhZTNVN3dPbTdmbE9XNlgr?=
 =?utf-8?B?b3FsbW1OdkFnN3FuSWZ5Vi9RZ1AxUHp4NVdzWTRpeFo5SmF6WDhsR1VoWHpR?=
 =?utf-8?B?ekRBYWp2UGpoS0pETmlROHg3NmdzVzFmaXdudXRreWlFaTR3QmxVWU0zeEVn?=
 =?utf-8?B?d3krMFdxTWNhRlpUb2F4aVQ1TzdOcy9IL3R3Q3YrU2p6VmFCZnNwcmRxVm1Q?=
 =?utf-8?B?THpmWGlQMTZpK0hOM29UYkE1K3B2TnVUcjNoVUpFY09kcHZMb0FzMDJsU04x?=
 =?utf-8?B?RFR0eHVDS093YWs5aVNhWEpkd3BZT1FEelo3enByYk1LejFnQzFFS3VybjNi?=
 =?utf-8?B?U2VNZVRKaFNucTlSVjhkKzdxOXNzRSsyd2xOVStXcVNtKzdGSzlMcWFiYnVV?=
 =?utf-8?B?YlEvbW1ickhvRThWVFkvU251bXJnd3BIMCthK0Y5aTROK2FrbjlXVjBFN0pV?=
 =?utf-8?B?cEEzOUpwSS8wRlhsb1JrVUJRTElFWmhRR1p0QzNtTnhuWndkK3Q0bFNSS1g5?=
 =?utf-8?B?Skgxd2FaSFc4UG9ieWNPY21rRUNUb0l5MVNCbUFmT3F1bkZ1aW9rN0dKZTVO?=
 =?utf-8?B?NVZXY0VudFBRZW4remJQTGVBRGdXUTNaNUU1MEJJaC92dDZjbFVJZWV6bTFW?=
 =?utf-8?B?N2lETjgvUjZRV05rb3F5Tmt1RkFiWXV5L2R2aFBmMDJhYVVncGdIaWVYeVVw?=
 =?utf-8?B?T1VORjBFeVlCa2hIMFRZa2dNVER1aDFHM1VIWFo2Wmk0WktjYlJnWStjLzFH?=
 =?utf-8?B?bWlGc05RYkxwc3prZ1RLQ2ZHMVpna25jZm9ZeEFGKytZQWFDRmtBNld2RDA0?=
 =?utf-8?B?akNyaFBvOG0vZHVxY0xoZ1NJOUtDS0g4bldOYTdpSkNmNHhlMDZycUI0L1E2?=
 =?utf-8?B?TmZsMkYvcnNZd200T1VXMDBUVnN6M3dpcVdBWGtvcktRdzRJb2lFVjkyNVBx?=
 =?utf-8?B?RTlSTVJpRjhjblZOTmJzcGhnQWcyS3pVOFlwUE9qdUFSSnZLMjNGWGs3MlYz?=
 =?utf-8?B?RkJYMnI2Z1drWktJcExIdkJ5bVVrZlZsUU8vNDE0Sis3WHo0ZjB5Um5OenB2?=
 =?utf-8?B?TTBhWVBDNUR0NXFjWEIvMVE1bUNnRXh5cWpVcHFpa2FxV1JnSnN4T0tSSURt?=
 =?utf-8?B?c2JxL1ZUSVZlS2o5anIyVUdmakZkSFhoSzU3dHl5engvR2lqZHMwdmdnOGZ4?=
 =?utf-8?B?MWJBWjN0TjV5bEFwRkdDY21tdTVNMFAwa0dUMHJXU2hvVWtPaEVLU3VXOUx6?=
 =?utf-8?B?Njd0K01BYllDbUR3aU9nUHYrdGtBVjFmSkt4ZjhuTFBSeEY2QzdiQXlhanEv?=
 =?utf-8?B?R3VRbG1UZ09Jek1SOFg2amxNaHdtbnZ3cjFKbHJ6dDBNVjhDaSs5NWY5eGY2?=
 =?utf-8?B?UTY1V0RINk8rNjNkUzdUWVVLcFdMYTdzMjQwQlJOUXdCQVhLSDg0SGpISkd5?=
 =?utf-8?B?WlA2Q3ZNYjJLMkQ4S0RtVVE5YTJHbFZKd1NiTHk5SWR1eERtTElPODdsMzBJ?=
 =?utf-8?B?VEo0WDZZTUVVYzAxekh0akVrTlJPeFBWY2psU09pSnlpUndNVzVxbG9zQ0k1?=
 =?utf-8?B?bk1wVzVqeUdhWVd2V3FoM2t4R1dGZkNRaHRLQ09kTFFpR2psc2VNWkZJWVov?=
 =?utf-8?B?TU1SZ2MvZXVUWFJWK0RzVWUwc3Q2UG54ZXB2UG4rK1o4REcrUmU3YmlycGFa?=
 =?utf-8?B?OVBEOVpHQzUwVXhHcndMcFMxbnltak1ZbzFUaU5pWlRuei9JaVN0QXZLcjFs?=
 =?utf-8?B?cDVDc25neXdGTWNqMWpteFZhQXlPbTdFYVlPWnRxL2xER3RtbXFoblVKVVhJ?=
 =?utf-8?Q?vub/hDToa9M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cCtPSTU2RWxHNm9ReW5EbC8yaGNLL29YbHhWdkdxYmdSSk1adVZPTVRwTWxY?=
 =?utf-8?B?WTBsY3dHNkZ4UlJhWjNtRjJ6d0ZRKzBMWXpOaEl3L0dPTllDZ1RxWm1acjlD?=
 =?utf-8?B?TUpqQU5zalhhQ2xLYWRjVGlVOTRJUEN3VmhWcFdTb1NOcTJQOXczWStuSFZC?=
 =?utf-8?B?SVRDM0phb1llNkVKY2tnK2lQWVFFZ01raUR0ZTRjUVJ3cG5FeXR5cS9ZQ251?=
 =?utf-8?B?b3U1QjNTQXl1QytoQ25nY2IzUjJDSVJqTVNSelRBd0REMm1TR2ZBVTQ2M2Jp?=
 =?utf-8?B?ay9WSS9TTm9mVnU5L0QwOTlQblJEajNmOFpha3NNY09kRkNpQkExOW5YWEgy?=
 =?utf-8?B?bnkyVzZkdzVOaU8zTWxmWU9TcTRKTUoxOWtBZGdsSXFlQ25VSE5CZEMzNDVX?=
 =?utf-8?B?NitkbFoyQStvUzU1Zk5IUDdEdG13Mm1paFdNVzdJeEkyZGVKL2VtdjBaL2Jq?=
 =?utf-8?B?N1o0eXZ6Rm5qYURBblY2RGxCemF6SzFweS84bGloTklEVVhxUVQyK2ZvZlNP?=
 =?utf-8?B?MHo5bE1FQ2ZzQzRObWdVQTVBaDdLT01jZWt1NUI0eEpTS1c3TDRiZmhFems4?=
 =?utf-8?B?L29TNk9WMzQraDNrbTFJRTdFMkdUeTVDR2docWlwMXBkc0lvMmNOMUpwUlNZ?=
 =?utf-8?B?OGFLT2dGYlIvRmtjaE9icGcvbWI5TXdJRGxPUTlQd205OEIyM0JZNGE4TWpn?=
 =?utf-8?B?a0VIWGE0UW5VR2NCcEpMRXdMdi9FUVpjWnU4U2JraXJKUGxiT0UyTjlrOTVL?=
 =?utf-8?B?Znd6cERGZjR4UjdqMEtFUVJpYVErYnVuMFFGZThTUWZmakduZ3hieUZEN0JC?=
 =?utf-8?B?K0o1eWNwSWhNTWhZakpCVDA3NEp4THoyL2pVcXBLWmd3ejdqMUhsYW1kbUky?=
 =?utf-8?B?SDd6c1hqM2ZPNnFuR1F0d0kwZGRSNFFDNVVOcHZCQVJiMFFZZU03MDcyVUZ3?=
 =?utf-8?B?dG9vc1AyME9zajFOdk1OL3ZSdStYckhhV1FWME81RzA5NVV5aEhxTFVqaDZm?=
 =?utf-8?B?dlpveUZoRDNLZXBmc0FnOUdGQVE3dVdySkJ0Q1FCT1NwK0g2SnRtTWkrRDFq?=
 =?utf-8?B?bldYR0pFdmNKUEJGQ0dPTHRCNTZraEQ4cGFpaXJRVjJTRmFUY1Q5NWt3VlZ1?=
 =?utf-8?B?WnhjejA5eGxqb2tvYTdmbVZadEpTbEE3TTIzQVpDTm1zaEpqYWNJSGFRWVZN?=
 =?utf-8?B?RnFHc0NWTC8yRUhMQzRiOW5iOWxLeFg4Y0dCRTFoSWdNMnYrd2JPdVVXd1JF?=
 =?utf-8?B?M1JtTjkyU21KRjh1Qjgxd1RBU3ZoSnArVlZiUUdlZ2NWclpTVVh1c2hJSlNH?=
 =?utf-8?B?emEyb3dFRVNkSjdta2h2ckRaMHVkeEx5cVVCUHpYOTlObGZpZmVqUXVJQ3Jk?=
 =?utf-8?B?anZ4a1VvdkZTTjdkT3F5QTJKeG9GMW83K3dTUjdBWGo0Wk5VNVRmQjR4dTd0?=
 =?utf-8?B?ZUVpT2ZDRXVsbFRQKzNzZjVaY2tGQnpIWGExc1FjUmZTUXpSRG5LSkNIbklU?=
 =?utf-8?B?dlA1RGlaejFFdFU2dlBaTHE2WjBJeC9IMnV3THg1OGg4T05mMWJ0QWtLWm1F?=
 =?utf-8?B?cjBGLzk3aW8wT3dKTVJNeTlLcHVkdmg0aXlvMDZYRlhSaHpDNWE3VVpyQnla?=
 =?utf-8?B?Vk5ETEZCMGhMZ1lpOXpuRXRtNUFMeGRMM2Q0enhJQ0psQXNRUm5YZ3loZmZy?=
 =?utf-8?B?cUJiSitNM0lWYThFamFsbUo4YUppYXJ6aVVhRjVjd01qMktYdDBrSm1NanV3?=
 =?utf-8?B?TFl2U2p6TXJhRUt1SzhVRTNJenJ0TWNIR3ZXVVJXK1ZpbEp1b015Y0NXMERC?=
 =?utf-8?B?aWlUbGtCUEJTZFV2RUNYSDcxZ0JoYUlPY1E0V3BFZEtEaFNUUytITFpENjRv?=
 =?utf-8?B?ZmRlTXI1UXVlWXhEb0dRK1ZxcHNweDdMZGU0cWZON004REl4Y3ZxbHB6Z2NB?=
 =?utf-8?B?Z1FZL1lxdElnZG9XNCtDZE1XNzNubXR2eFI5WUhyUUllY2ZMOVVHUlB3SHFK?=
 =?utf-8?B?c2x5d1RMa0UxL24zZ1pvckhwbUVCMkdBNWl4UDh5Vm9LY1FJTnVYQU5rU0Zi?=
 =?utf-8?B?R3hUSHd2NjdqcGR3ZEw1bi9IcGtLT085N0kzVDZ5YmpIaWEzOXR6bXpEY1VF?=
 =?utf-8?Q?ZW5YlPG1u/L8NEtbaHiEZk77d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e1d1a5-d5ca-47a5-bd72-08dd993146d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:05:07.8929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yzgMR7ldaiA0zi3jgSGYMQ8+rgOQZ5oqEwVzXDpQdtyvSQVGhxb5fZi2d8XfdiY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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

On 5/22/25 14:42, Philipp Stanner wrote:
> On Thu, 2025-05-22 at 14:34 +0200, Christian König wrote:
>> On 5/22/25 14:20, Philipp Stanner wrote:
>>> On Thu, 2025-05-22 at 14:06 +0200, Christian König wrote:
>>>> On 5/22/25 13:25, Philipp Stanner wrote:
>>>>> dma_fence_is_signaled_locked(), which is used in
>>>>> nouveau_fence_context_kill(), can signal fences below the
>>>>> surface
>>>>> through a callback.
>>>>>
>>>>> There is neither need for nor use in doing that when killing a
>>>>> fence
>>>>> context.
>>>>>
>>>>> Replace dma_fence_is_signaled_locked() with
>>>>> __dma_fence_is_signaled(), a
>>>>> function which only checks, never signals.
>>>>
>>>> That is not a good approach.
>>>>
>>>> Having the __dma_fence_is_signaled() means that other would be
>>>> allowed to call it as well.
>>>>
>>>> But nouveau can do that here only because it knows that the fence
>>>> was
>>>> issued by nouveau.
>>>>
>>>> What nouveau can to is to test the signaled flag directly, but
>>>> that's
>>>> what you try to avoid as well.
>>>
>>> There's many parties who check the bit already.
>>>
>>> And if Nouveau is allowed to do that, one can just as well provide
>>> a
>>> wrapper for it.
>>
>> No, exactly that's what is usually avoided in cases like this here.
>>
>> See all the functions inside include/linux/dma-fence.h can be used by
>> everybody. It's basically the public interface of the dma_fence
>> object.
>>
>> So testing if a fence is signaled without calling the callback is
>> only allowed by whoever implemented the fence.
> 
> Why?
> 
> See, who owns the callback? -> the driver which emitted the fence. If
> the driver doesn't guarantee that all fences will be signaled, the
> callback (always returning false) doesn't help you in any way.
> 
> I think the issue you're seeing is more that a party that only ever
> checks a fence's state through callbacks (and doesn't signal them
> through interrupts for example) would run danger of fences never
> getting signaled.

Partially correct, yes.

> But that's already the case if someone doesn't implement the callback.

But than this implementation must always signal somehow else.

> The fundamental basis is always the same: The driver must guarantee
> that all fences get signaled. Independently from other users checking
> the fence this or that way, independently from the callback being
> implemented.

Yeah, but it is invalid for a caller to not ask the implementation if it's signaled or not. See the rational behind that is to avoid abuse of the interface.

E.g. when you don't know the implementation side use the defined API and don't mess with the internals. If you do know the implementation side then it's valid that you check the internals.

Regards,
Christian.

> 
>>
>> In other words nouveau can test nouveau fences, i915 can test i915
>> fences, amdgpu can test amdgpu fences etc... But if you have the
>> wrapper that makes it officially allowed that nouveau starts testing
>> i915 fences and that would be problematic.
> 
> I don't see the context here. That applies to the other functions as
> well.
> 
> 
> P.
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> That has the advantage of centralizing the responsibility and
>>> documenting it.
>>>
>>> P.
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>>> ---
>>>>>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>> index d5654e26d5bc..993b3dcb5db0 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>> @@ -88,7 +88,7 @@ nouveau_fence_context_kill(struct
>>>>> nouveau_fence_chan *fctx, int error)
>>>>>  
>>>>>  	spin_lock_irqsave(&fctx->lock, flags);
>>>>>  	list_for_each_entry_safe(fence, tmp, &fctx->pending,
>>>>> head)
>>>>> {
>>>>> -		if (error &&
>>>>> !dma_fence_is_signaled_locked(&fence-
>>>>>> base))
>>>>> +		if (error && !__dma_fence_is_signaled(&fence-
>>>>>> base))
>>>>>  			dma_fence_set_error(&fence->base,
>>>>> error);
>>>>>  
>>>>>  		if (nouveau_fence_signal(fence))
>>>>
>>>
>>
> 

