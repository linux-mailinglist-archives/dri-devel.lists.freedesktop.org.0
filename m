Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C0B97202E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 19:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6828D10E5F1;
	Mon,  9 Sep 2024 17:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dEOTddiw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D3110E5ED;
 Mon,  9 Sep 2024 17:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvx4sDum/FDylLV944NXOr7Zy5VmnDRQ/Kt1XBDpP130xtkZ2JQv6UEu8PL/dHNmuErUM/Bu8Id7JO0sF1TCYTC6WM0VwYB5KPjKYWxAFgUp21BBAVxMHpYdMJnlDqtNRgd8xPIW8N5eTh7hsS/fiv8x4hxF54w+wB8OyRaCoajFynqKydYApC/VdHOORz5BpVC81KdVsBihuKf2Cg4k4hNer/f3j5DqkWZSfO2/HtjIEM1LbBgLr0D1smLSGzEX8HLeUtU1BYxI9BgEKIHH8PqHBo8S1RRqFL94Qs4piLEaWq2Ia4KdL5+vD11ss58dEokkU+FsgmXPSxZ7duPmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLEbWQzpcC312DreG03UreMmMtnuWb8SzkdTD9vP/6s=;
 b=b1Ct8mJc5Porc7VomeXzAHn5HDKa9+8yHnHhOxyDXKY+7Wva3B8D3ILZTzw23ULyWRZvrfOWDaqPmC2yt2wJQXT8x48IWuUBB/qjTtb8KXxytF7f1nJoTHlF6wWr6QYT4vzoj+qSO+Y7Xah+pgP1OD5R82/9owHGM+y81lfoTYCgUidybmlgYXRZQTV/jgPecvhwkEIUFnyU44YDH5Q1GoOkwDbp7Zmf682W1EkcFohaxSpVUOKYMFxhjQ/cvv7ye7oTn/4f2loOpQ3G9nJBtce/USD3gm0X8oZAT2fSP3aOirE9kn8+oJxWAghUxzaoJtsJnKi8vFp2ZYCdzIOl+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLEbWQzpcC312DreG03UreMmMtnuWb8SzkdTD9vP/6s=;
 b=dEOTddiwO5EHtSVuK1VeQREhv4tSy/kJ+z84AUwMxq1CiUV7LIhGlGyAkpPd7AoOri0I1fxRday1f+3woF7mCSgKgUUCSF3Oe74hQDQI6ZtezBKwQHd+s5Jq7MHyOgJiq/yAg4DormFgj9PxOLJzyqs9g5NbXJSmCtLFXK5bf50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.32; Mon, 9 Sep
 2024 17:18:43 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 17:18:43 +0000
Message-ID: <c2653b61-eca8-4209-9d50-771cf1a9fe35@amd.com>
Date: Mon, 9 Sep 2024 13:18:40 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/amd: fix VRR race condition during IRQ handling
To: Alex Deucher <alexdeucher@gmail.com>,
 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Christopher Snowhill <chris@kode54.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1725269643.git.tjakobi@math.uni-bielefeld.de>
 <D40Q9ZLDQIZF.3OERFS0AYREN0@kode54.net>
 <deb6d962-f24e-4769-b313-be3b0efb873b@math.uni-bielefeld.de>
 <CADnq5_PMnCUYsUq_SPS8woi20KxaW2+teMzhmmOyFJRaq3YVQQ@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CADnq5_PMnCUYsUq_SPS8woi20KxaW2+teMzhmmOyFJRaq3YVQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 913cd6f5-0d4e-4e62-07cf-08dcd0f3749e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ampYYzFtVHVQWXNIaHJzTWNmNXl0eGVRUTRNWHNmcE1SallFYlcyT2dVTDJJ?=
 =?utf-8?B?WXFsdjFha3p6a0EzYS9abEVRZVpJeGQybkl0ZlIwWiszV2lnZVpiY3d3TG1i?=
 =?utf-8?B?QkpjSnE1N0lSdVFndTBlQWFkb25ZQmtMS3Y2ZEZ1MVpQYjV2YmFnVS92bzFu?=
 =?utf-8?B?K3lYNjFJY1RWblVla2FENW1qR0hmWHhnNi9XMW5USlgyZXBUN3FockJ5VURR?=
 =?utf-8?B?TThaWm9tWWdhN2d5alpyQktvSTBhNGhnMklkKzZleWRNNUg1NHlFTThsUGQ3?=
 =?utf-8?B?R1lxRXg2SEJrYlhNK1pNUmsxeEV1RFFiKzJUUXg1OGJsNmZkMTl0ZDM1S1NE?=
 =?utf-8?B?NUFZbUJOdFQ1UWs0ZDZXOW1vTFA3WDZSNndOeDNBY0FJdVNPVVZRM2hTMnZt?=
 =?utf-8?B?cjgvTTFML2g2ZHJLU2tLR2w4ejhoYWt4VG55bFNzNkVuK080UjBtTVdwZUds?=
 =?utf-8?B?akQ2Wk83OS9PZ2pCRnZMWEVsNlpMRk9LR3JFbG1PQS9CVjJXZVRRVDdpcCs3?=
 =?utf-8?B?NHYyRFJpYjJNZEtWYlRsSEprU29aalJVZnc4ZUt3dytFa3h2UTFUKzNTaWEr?=
 =?utf-8?B?NzhIR3VxS012VWlKRVp5TysyNWZSZ3hHMVl1YWZUMDNhUHJQWWNNYXVhR0pF?=
 =?utf-8?B?aGcxdWNqQUJKTm9wTmQxdlFaR1VXVTlLb0hEWS9rMzYzR1QrK1hieDZWMEth?=
 =?utf-8?B?dzBDK1FOVlhKb2RtVS9WMmljQU5RWEJ1Z0FWVmFEYm1kTUtSdWpuL0NLMElX?=
 =?utf-8?B?VUJMMHhwZGl0TDM5c1IxcnBwWi9tNlFuTkUwd2lLeTNueFpiT1RVSnpCcWdH?=
 =?utf-8?B?aXNDNWY0cGptc05sbGt2RUtkaU9DYlMxdm9xdjJHeHpjcHhEQ1pLTGE5eCtw?=
 =?utf-8?B?aTF6VWdMN2NDTSt6dlVQRXRLZ2MrQmJzZTYvdmFRRURCNDNYQVBweDkveFU3?=
 =?utf-8?B?MytPVkhhdVdveWJSN2wxQis4U2NPRkhqQzQvaVVqYjEvb2RyVDdiUHRJb1lQ?=
 =?utf-8?B?VzlxZW1CL1VGekdlaW1ndVlrVXkycUI5NmoxOVZhOEdDa2EvRnBzbmlhR1Vn?=
 =?utf-8?B?RHd3RUw2b21FT216NzhzMDJXRTdadkVNd1pCaWlHL2F3REdVcEFQazNaaFZi?=
 =?utf-8?B?UFFROFlCY3NLMHA2Q0srb0d4b0hBZFVCNG5XRElKNkNzYUsrTG0zeEJsS0Jh?=
 =?utf-8?B?ajBabUp1Ny9DbDduV1BiTVFBc1pzWFdTTjBZU1RNcjdXTEVuWTN5Ly9VbnlX?=
 =?utf-8?B?RnF1bEY4L01sQml4UWR4aEhSOFd0S21JeFUzbmI1V2YzekdhUUV3dVV3TnJP?=
 =?utf-8?B?RmNBU01IUWRPSklOcHRsY2pqQVkySnE2dU8yUjFBOVJLdFY5djk2eHMreEJ3?=
 =?utf-8?B?UHMwczE1ZTJqbVNJNGNFaGdSOFdJM0hXYXdGMkxEZnFsSEs2Zk9sZ3dieitv?=
 =?utf-8?B?RS8wR1ZoUnJucWZITFdTSGwrV3RlMWNrQWEzQzZCMDVPZ2duRlQwM2dmZXg2?=
 =?utf-8?B?aXAwbXJRcXRCWlZ1RUcyWWlqVWN0Tk1RS01QM3ZnNGlVWlpZazZIclh6aXo3?=
 =?utf-8?B?YmFyeEFpdjM2MEZBZ2g0RHlWd1RpblVWZVFZSHZ4T1VOSlphSUtvY1pKa3Rk?=
 =?utf-8?B?RTg2bnBXNytMTCtSRDN3Q3VCZ0JzVE1ZM2VoZHJXOWZjcnBjUERUbWRuZTJp?=
 =?utf-8?B?VlpsZ1Bob0krNVZpS0Z5ZlFLZGlVdEQ1MGJQeFhyaU1HU1NlOFIvRktneWlj?=
 =?utf-8?Q?rAFjUBsSwMPuxaqvA4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak1iUmtObGNjcmQ4MWJ6N2swSkRkdU42YW9ETXkzT2g2Qm13SHQvUEhNaERE?=
 =?utf-8?B?RkJKR1cyNTBXbkRWNGUvaWR4NXhvRkZTVE5EQzltSEZ1WGc4NXpJbExNbWVJ?=
 =?utf-8?B?NXdaSGkrRGEyZzNGY3dLWGNOb2VXTnFOOUdUYjFPeXRTZWdocDM0d3MvaTdz?=
 =?utf-8?B?bTdSWVRlR0hxUnppR0w1VitVbnJEb0svSHZlaWJTSHZ1eDN6ZVYxSVdxdUtS?=
 =?utf-8?B?bENPd0VkU3Vvak51Ym1uczA2dk1ISzZEc0VOYUdETUd3Zi9WM2tjOGIrM2g3?=
 =?utf-8?B?RzArSmRWRXBYTEVRUUV1WDFuNFpFQmVqMGJtL0NuQXVKdUJNVWtqZGJMK2Yw?=
 =?utf-8?B?NXhYaE9oWHNGMnBUTzZlUWg4clZnZysxMCtmYkdCN3NDN2V4WFg2SHF3ZVVu?=
 =?utf-8?B?NnF4V2lBOFhKUEM0dDkzSkoxZjNYU1BrNG5XVjRiUEJQMWI0cnppN1U4TGV2?=
 =?utf-8?B?UmlNbWI1eTNQMms3SUhhcjhEMDBQOUhreXJnWHlCWVUwc29SV3Btb0lRQ1dk?=
 =?utf-8?B?cVduUXBUSUN4K2lsMkFHSEErd21sYnlrTUVGTUdvUUM1SnhmbjF0MEdIMDd4?=
 =?utf-8?B?UzhDZHU4WjhHVFFlTmN3MTQ1eXR3bTkxVWZNcEg4VG4zT1FKdXR1ejBhSUQv?=
 =?utf-8?B?ZllPQVU5b3BzcFFRT2NrdDZRQVczRE1CU2Q4NjY5WGozWGI3RHlQaUxPeUg2?=
 =?utf-8?B?djBXMGtLZ1lXTDNRMUl1ZWRKb2RYNFQvNkdFZ1YxT0NUNHQyc3NXMTJQSWNI?=
 =?utf-8?B?RUJDR3pRYXU3Vi9xMHdDWlhKNzYvUjZpRWwxcEVUZTg4cmpTUjB2UVFOOHFR?=
 =?utf-8?B?cExIYXFXcC9SQ2t1K2VMWW1LTkFuSHh4ejdraG1ZSGg2Wk4vekNGdTJKWEs4?=
 =?utf-8?B?N2JldXhIRGRSYlN4d3JreHhrZHMzZ3AxNWdVbVhTRVJhOWo5aWhQd2JYWW9P?=
 =?utf-8?B?azRXMnRYcDFhNFFMcFllK2ZCbDlnelRDcGZlN01KelJlNHo2NDJYZmJhVGJB?=
 =?utf-8?B?OUFyZUR5c1VucGxVZ3dkVHdBL2lxVGdRVlZVOEpnZjZHMHowb2diR0dQQ3NJ?=
 =?utf-8?B?VlNoUjdoNUx3TmZBR2JsL2ZNVXpkQkptT0liY0VpbTduUUxjNlE3aVJVVDB1?=
 =?utf-8?B?UGNDMHRNcDBqVXdTOEVwVjZBL25ucDZmNG5qZUV2N3B2eVlkMG5xdk9uV0Ri?=
 =?utf-8?B?Z2wrYUN0WlQzWEZ4K3JCbWFaekJ5VWF6L1RYM3ZnNlNPQjhRa2JwQ1RqUXJy?=
 =?utf-8?B?Z2p4K3V2ZGFCQS9xQW1VS0FpdWRWdnV1UjdqWWlNRm13ajRHM2l0ZDFNOElw?=
 =?utf-8?B?R0xuSlBSbW1TYzRGOHFrMVlzd0Y0T1ZseWVFK0QzcmdVc3JSeC84b3VYdVZG?=
 =?utf-8?B?VUtzUndHZzgvaXljU2kwaXh1eEplUDRaVnpXSm9mSXN6VXJlUU16V0lxbWJF?=
 =?utf-8?B?Mk9JMTRIMWs3RkhLeTY2aDVHVXlZZk11Z2dDSjlFTXJjQ3JSdlpHb3NVcUVm?=
 =?utf-8?B?MUMvaFI3ejdvcVk5NEdpWFUzbnVURGpWWlRBQmJ5d0c0S1hhemNrYjlkajk3?=
 =?utf-8?B?WGZnZDJOMFJ0NTZrcUR5aEVaU1BxUXpSUWw3cCtXVlpLaWEzbVBuWUNreGVz?=
 =?utf-8?B?ZGVNRVZkRHFyTCtoZWxBMllVY290MVNlVjkxSVZuT3hSN3F5Um11SFdHdjZB?=
 =?utf-8?B?TUVjNVBuYTI5YUhzSDJidkgyK3ZFV1czUGhrbmlWMFpuL1BFOFdReUVCeXRN?=
 =?utf-8?B?cmtvcTJMQ2RrQkV3cjRpaFFUQTlWL0xlTDJrSTBHRGVxQzBYbW5PYmRXRlIw?=
 =?utf-8?B?Wm9BSnBQbExSVWhEaFBuaUhXSVp1RUxKNHVuRXNTL0FzaElUZEp6ejV3MUh5?=
 =?utf-8?B?UEVMSmFyb25aU0djM2xpZmZVRmlhUFZmTW41MnNoOW1NMzd1QStqQUY4V3ZU?=
 =?utf-8?B?U0I2U3lka3dqNFVwVmNDVzdEOG1tOHdDUDdtZDFFa3pDS0JoOWZsWGpLUjZX?=
 =?utf-8?B?bjExSndVdElDYmxTVE1XVlVzQnpTc0h3Q0EwZFBjR2dZRnZvc3V3a1hpOE0x?=
 =?utf-8?B?ZEltblZ0aityZTMyeS9EUUxVa2ZJc1FCWGp1OFNGaE5ZNnBxb2VxYUgwT2hZ?=
 =?utf-8?Q?favALk1TvGropODsyIwrNEa6r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913cd6f5-0d4e-4e62-07cf-08dcd0f3749e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 17:18:43.4130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mos3DMkzKqQLUvC7z9IVh8wYSxI91hCnEB3xt2XQ+QGkfSyBy8kesbKKylIp/FhtEKHZJSMLrQTF7XtQGZkcmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986
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



On 2024-09-09 13:11, Alex Deucher wrote:
> On Sun, Sep 8, 2024 at 7:23 AM Tobias Jakobi
> <tjakobi@math.uni-bielefeld.de> wrote:
>>
>> On 9/8/24 09:35, Christopher Snowhill wrote:
>>
>>> On Mon Sep 2, 2024 at 2:40 AM PDT, tjakobi wrote:
>>>> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>>>
>>>> Hello,
>>>>
>>>> this fixes a nasty race condition in the set_drr() callbacks for DCN10
>>>> and DCN35 that has existed now since quite some time, see this GitLab
>>>> issue for reference.
>>>>
>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/3142
>>>>
>>>> The report just focuses von DCN10, but the same problem also exists in
>>>> the DCN35 code.
>>> Does the problem not exist in the following references to funcs->set_drr?
>>>
>>> drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:      if (pipe_ctx->stream_res.tg->funcs->set_drr)
>>> drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:              pipe_ctx->stream_res.tg->funcs->set_drr(
>>> drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:              pipe_ctx[i]->stream_res.tg->funcs->set_drr(
>>> drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:        if (pipe_ctx->stream_res.tg->funcs->set_drr)
>>> drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:                pipe_ctx->stream_res.tg->funcs->set_drr(
>>> drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:                if (pipe_ctx->stream_res.tg->funcs->set_drr)
>>> drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:                        pipe_ctx->stream_res.tg->funcs->set_drr(
>>> drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c:        if (pipe_ctx->stream_res.tg->funcs->set_drr)
>>> drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c:                pipe_ctx->stream_res.tg->funcs->set_drr(
>>> drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c:      if (pipe_ctx->stream_res.tg->funcs->set_drr)
>>> drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c:              pipe_ctx->stream_res.tg->funcs->set_drr(
>>
>> Maybe. But the big difference I see here, is that in this code there
>> isn't even any kind of NULL check applied to tg. Or most of the members
>> of *pipe_ctx. If there really is the same kind of problem here, then one
>> would need to rewrite a bit more code to fix stuff.
>>
>> E.g. in the case of  dcn31_hwseq.c, the questionable code is in
>> dcn31_reset_back_end_for_pipe(), which is static and only called from
>> dcn31_reset_hw_ctx_wrap(). Which is assigned to the .reset_hw_ctx_wrap
>> callback. And this specific callback, from what I can see, is only
>> called from dce110_reset_hw_ctx_wrap(). Which is then assigned to the
>> .apply_ctx_to_hw callback. The callback is only called from
>> dc_commit_state_no_check(). That one is static again, and called from
>> dc_commit_streams().
>>
>> I could trace this even further. My point is: I don't think this is
>> called from any IRQ handler code. And given the depth and complexity of
>> the callgraph, I have to admit, that, at least at this point, this is a
>> bit over my head.
>>
>> Sure, I could now sprinkle a bunch of x != NULL in the code, but that
>> would be merely voodoo. And I usually try to have a theoretical basis
>> when I apply changes to code.
>>
>> Maybe if someone from the AMD display team could give some insight if
>> there still is potentially vulnerable code in some of the instances that
>> Christopher has posted, then I would gladly take a look.
> 
> @Wentland, Harry can you confirm this?
> 

As Tobias said, without extensive analysis and trace of the code in all
possible use-case it's hard to say there's no possible way the other
set_drr calls could potentially have a similar issue.

I think Tobias' analysis is sound and this fixes a number of issues, hence
my RB.

Harry

> Alex
> 
>>
>> With best wishes,
>> Tobias
>>
>>>
>>>> With best wishes,
>>>> Tobias
>>>>
>>>> Tobias Jakobi (2):
>>>>    drm/amd/display: Avoid race between dcn10_set_drr() and
>>>>      dc_state_destruct()
>>>>    drm/amd/display: Avoid race between dcn35_set_drr() and
>>>>      dc_state_destruct()
>>>>
>>>>   .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 20 +++++++++++--------
>>>>   .../amd/display/dc/hwss/dcn35/dcn35_hwseq.c   | 20 +++++++++++--------
>>>>   2 files changed, 24 insertions(+), 16 deletions(-)

