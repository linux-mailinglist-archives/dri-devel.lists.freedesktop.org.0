Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC342A11E33
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D24810E03D;
	Wed, 15 Jan 2025 09:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3ay0+BF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB6110E03D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:38:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+JFFPPOQvktmzuu/wNu+SN8K/LhKasUdUEdIW9OB2IU4GNqaXQ81udNIPO2vW94F8z/LJr7/aomIDXUQsbgxVoAiqh8WkF4Vxf7kkCUDrkHarxJnVyh2LCoWk6FErZA5twv0t7eutFRh8J/drcJ1NCZGqDgYuwqE973WNEOMNi74qbslnqgvInq1seIr5Oc1UN3hbSPXFkphQI1yA+aAY9Zv72k+yHCK8BEDIH0L3ni7IYyFug/x/NjTvCBN/DMenUeVi4+MiEzGYLn19wVUq9oCaNu+40SOaYfeohjdcnVPeN8XFNnJZNShNciNUnyeTkpxZ4y+Am8jAG2DhXvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRx9XQgDkDdG6zH/+FxrTPmMYUsWMZfPZhTySCFVk3A=;
 b=mJ1w194bu5dzff02tiueTnJZde06wQy0N0S+jlTEVaoprymZeU2efTt3lng7p8ipK/Ea1EM+pOAbH7lUfDeJytLiyAxgMR5ip9kPlUtJbAoPfHouSbGpTDo+k2k+XT6nMzAgxTozyPzFM2ZL5J2DU/efpGEt7OxL3pZIyekIgyaMy9AHf4XB+lpz9FBzbAnNfkeDldAlL/UdOWiKduiCmgHzkymGBBVYDQY3i+fmtS7tyxIKBNXkxbqCLepWjtmMSZOPtEHwJF02Mti0JflWOMx2dEg3cGhIJ1fqYuT+OmfY220ODgw03pVBF/jD9lZPIdAjoRtFEVAczfepOgDtXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRx9XQgDkDdG6zH/+FxrTPmMYUsWMZfPZhTySCFVk3A=;
 b=3ay0+BF1ZvRUenkMt/lQAwgsLWyIbtRxv5mb+FoMovpdoJLrBnhuUZqcWcnXzm+2hIcPyvAUlN6EgdlcWSop0RUBOv2DBLAj0qJ0KC/prKfHT076Nj4WXkdqdDnvwsLfPcqVYkpdx4y92YXzOF5/d0v9lL0Hl75B3HmCdJvGrCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6693.namprd12.prod.outlook.com (2603:10b6:510:1b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 09:38:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 09:38:08 +0000
Message-ID: <d213eee7-0501-4a63-9dfe-b431408c4c37@amd.com>
Date: Wed, 15 Jan 2025 10:38:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com> <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <c823f70c-9b70-441c-b046-71058c315857@amd.com>
 <20250110205454.GM5556@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250110205454.GM5556@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0259.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e24c3c-0665-40a8-dc7e-08dd354851e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0s5bmFobGZmQVRKUko0RjVSZkFKUFIya0pNN2JTam5ma2RHVkorakVIYzIz?=
 =?utf-8?B?eVpsbVRMVG9ra1MybDduODFpdHhaWHNSTVA0djZQTit3SEw2Si81U1RFMDhE?=
 =?utf-8?B?WmdYemxCQ1lGK3RRalM3VEFmSnNBOUhpcHVNbzdCcWNBZGRsTnBLNEVOQkJp?=
 =?utf-8?B?UGZPaVljOXFCSHJoaWNhWFd5WStpcnZFQmlKYjdNeGx5UnozNUNiSlpxZjFM?=
 =?utf-8?B?bEZhZ3FxZ2lXTFpVSU1sWEhHREJKWTI1cXVpOHRya2VJQXVwL2Q3dTdqRm9L?=
 =?utf-8?B?OGdOVm45b2NVN1ZzTGRzbE00OFlpS1hCQWx6clRVcGh1MWY4SU8xTDhzVFZa?=
 =?utf-8?B?eExiclU4VXJkUlg1bVp0cXVnQUF2VHRuelM1enkrQlQ5di9MRytNSkE3ZXNv?=
 =?utf-8?B?QTFQOTVHYWwycDlLVWMzKzAxMUk3cFhYMkVmZGhVQS9hY0FiNytldFB4UmIv?=
 =?utf-8?B?emgveFBadTlOTDRZU3NnZDVZUG1SNERHTEZSbnU0QlA5aXEzbURieG5pWXNY?=
 =?utf-8?B?SWpqRitRNDdLM3VWYld2Z2RseFBINDczdWhzZmlHQzNGaEV6K3dlaEhUU2Q2?=
 =?utf-8?B?V2RuSEx0UktjZDQxbitTemxXc1NzNUhNY0U1YmpsZWtaOGtzai9hQ1NXR04x?=
 =?utf-8?B?M0RHYXhEMHdXR1JPMVc0UGw1amZoVUhsSmxJTGl4Vmg4emMvNEw5ZFVweTVk?=
 =?utf-8?B?ZjFlTCtqTGE2ejFMeCtQWUFTYnJHWTRlei9IS1VoR3c4WUZwRVBLREpmQmFB?=
 =?utf-8?B?aVRBMy8vOG1tV2pzajliYnJvNWx1NmNoZk5yTG9iaERWWmhzUys5TTJIYWxu?=
 =?utf-8?B?YzQxUUlTMStMbFVUNU5VUS9qSkcyb0pad3Q1OTJHUXBEb3NzbVpHenZDb0lV?=
 =?utf-8?B?RUV3cmpnanNPa3QvLzlObVk0cm5VWTY2WWhBWkl2Uk4vL1owc0IveklBbkdQ?=
 =?utf-8?B?WC9VSjM0dzFUMHM4S0NRMTNVN3RuazUzdnNVQ0sxaEx4YWNDSnQ2aXlOOWpa?=
 =?utf-8?B?WnVRSWdVUE1ISTdzc2t0QUd4dWd5UGwwRDRqaENObU8zbllRLzRDUTdVU256?=
 =?utf-8?B?K0tPWlRaTVdGSFMvVHFkVkRwMENVNTNDT2pkS21LNmlYL3ZURys2YTAvUWNK?=
 =?utf-8?B?TVFQU3Y3bm1QY3hYK0svTmo3eEJLYjJVb0V3Qmk3dnNZVGF6QWw4NW9lVThD?=
 =?utf-8?B?N1dPUXVmUHVKT1VnZGt0cjZFbURTdFZEMVd4TEFXK3REaEswWlZXZEN5YVc2?=
 =?utf-8?B?QVJrSy84eVZrMmJFZ2N2UmZ0SGMvUzJiRjB1R2RkWjVVdEI4cVczbFYwUzB6?=
 =?utf-8?B?WXZ1ODlTdEtqbk1kSUFOYnRiREJvNzNCYWt2UlpOaW9Oclk3TDh1NVRvdDcv?=
 =?utf-8?B?KytsSVhBbFMxeUlzZ28rWGNpaVJ4ODAzR2pHTWpMdWhVUzBCZWhxRWd4SVVy?=
 =?utf-8?B?T0I1ZjQ4dHJjVkQ5eFpsL2xzYytmV1ZnYXE0N0V1dlBlY2FaNk4yUFYvaEpz?=
 =?utf-8?B?QlU3YVFodEhhblhwZVN1dFhzMUhvQzR1THBNT1pmcXpTYWpwQ3pIazBRcjky?=
 =?utf-8?B?YkozSzZYdjlVcVliY2lOY0xIUmJyR1JGdXk4enk4NjgyS29mZ1FhVHJMTzU3?=
 =?utf-8?B?S2hnTkFBV01ucHhRM0dFZG9jdHdJTEF1b2FqM2xRLy9LdVhybTA2SkMxdHNT?=
 =?utf-8?B?NWxkUUN5QUI5Y1JpVkc0UE1ackNUQTV2elhyMnZIUWhQb3plQmNkZ2JBdk9Y?=
 =?utf-8?B?V3RGb1FidGo2eUxkQmk4VHBsZlA3VnN4TVhhVnhvcjFYcUQ3d2ZpZXp6bWRk?=
 =?utf-8?B?SUlYN0cxZjI0SFI3OWlmMWJ2alQvbUlUWHJFaWhiVlRoMXhQbnJuWVVXV2JT?=
 =?utf-8?Q?sEKfDkFxRPOJK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEcrN1VGTG53RTE4VDdGeVlnNmxyQzVIUEZrb293ZE03bjR0S0x1Zll4YUhj?=
 =?utf-8?B?MS8vc05NYm5tem11ZjFuVmpSUU92VCtKNXVBb21ITDdqYnU4QjhUR05rK0hS?=
 =?utf-8?B?SFpIU1RGUWFuV3h4ZUVLRnFRckVRdy92OXhpY09MM3pLTnVqU0N6ajlJM0Mr?=
 =?utf-8?B?Z09ldGhxcmhIVFo5ZmxlUyt4OHV0bEJaVTgyeThySXl0YVFpZ2VqMTMyYzVr?=
 =?utf-8?B?THFFTGwrdXVFL3VWemlkclg4RHdZb1JLdkhPNXM3WXVGak43UXBPekdISGxZ?=
 =?utf-8?B?bWp1WExXZ3lMcTQ4bDYyNVZ4Z3plQjhyZDhlZzZ0UGZ5Q3BMbm9obWt4TGxJ?=
 =?utf-8?B?bmVTcGtSNG4zSkM0YjNVSFZubkxpUGFKcndRWGd1K2lkWDQ4MlBNSTJCVU91?=
 =?utf-8?B?MFAwNXFDcUVLME5YamNQbk1JbUlJSndaNHFOTE1Dc1AxVzBJekxBb0FwZzhu?=
 =?utf-8?B?ZksvdktheEw2NllnS2xLQVZwN2FBRDEyTHpXNWhqUjhJRzFHM1IrRnRud3hz?=
 =?utf-8?B?bTlwdVU3U0QyRGpWb1YwWGQ1aW1mcm1RS2h6cEJBM1I5T01CbjhPaFJvS3VF?=
 =?utf-8?B?bVJzOVo4YThLMkNMU2dHNHlaUE0vbVVGQTduNjFucmxVUzNVRnk3TTkyeEtT?=
 =?utf-8?B?bUJ4VGdJdEkxRUh0UWNlK2grRVhvUXMxUEU5em1pS1V1bWdVRnovRkJhOWd2?=
 =?utf-8?B?TU9aV25OeGUvSEhXMVV1L0ZWK3BObnBBL25HeFJKdXBJQUYrTTBhcDd4cmt4?=
 =?utf-8?B?dXpEQWtQVFRqUjZadjc2SFE4aEdwRVFGQVRtVGcrUHVMMmdrN0Q2cWgxKzVD?=
 =?utf-8?B?OFl6aU52TFIyb2JvV2U5MEFPUlhORFEzUlorbWdldm5QUmZKeFUwMlo2UGZS?=
 =?utf-8?B?c2RqZTRwODc4NFlXbWNqTkErUUJvN0VzUWlEQVRUdjVkRW9WcjNvcFNEWi9k?=
 =?utf-8?B?U0daZGJHZ1EyNW5xMmliTkk3RkdYKzA5VnhRU3h5UE9RNFRtTHNaSjU5SUht?=
 =?utf-8?B?MlUxaXpmaVhjNEc3TGYxNU0rOWh1MXIzNzlEdTJxNWswU293ell0ZWlNLzdH?=
 =?utf-8?B?M3hBR2NlN0pOaXJzZWN5V3NNMmhIaW00endkMFhYVy8xQmcrOTg4emxoQ1Yr?=
 =?utf-8?B?N05LRWdBNGQwWFFEVFVJVk1lbHFHRmlEeGJFcjQvV3JVaUppZEhic00wTEpJ?=
 =?utf-8?B?NkRtS0VaQ0ZYQ29hbVN5VlBUbHNVem5WV2I5bkhCTjJDZzNOUFBLSVcvZlZT?=
 =?utf-8?B?ZUs4MFdTbTVXMWdLZnFIbmZmbnFiekN6MkdPSTRKa0JPVVhPWjQ1NEpGeVZk?=
 =?utf-8?B?U2NIQUVySHNXRTV1ZTBiTnM0Vk8xdEk2K25JY1VIVjc0Ujg4d1IralpRS0Jp?=
 =?utf-8?B?TFk1NnJtbzVReFF6TDhJYTIzOUQwdUpXODlvK2lpTjhQN1lXVEtERUFJQ01z?=
 =?utf-8?B?eSs4STJkUmc3VVV0eUFMV1g2aloralExbE5rUUhCL2NXVnBmcEUxOGE5V2p0?=
 =?utf-8?B?d2krWXBkaDRRdXh2aVdFeEV5aDU4MkRacXNOYXE2ZU5VdU1yOCtkSlI2NnFh?=
 =?utf-8?B?OEh3QWZjVlhnWC9XRW1kanUwQlNjSTZla3hDTWc3RDJJVmc3NU13VUdJVGRP?=
 =?utf-8?B?cXZJTTI0S1FVMHE2ZDVkbVJVZllXVEVtb3cxc3YyZ2RhL3NHNFpVSzU2YmJr?=
 =?utf-8?B?R05iK0ZMbTBTQ2s1bXBBTWFuQUlNNmxyd1E3alBXSlJsNWpIMExxY1VVZHlJ?=
 =?utf-8?B?RTdjQlNZQk9CTG91RE84OEtpRk5UQktSY1p1OE9LaWpjallxVTZNZ1IzTDBi?=
 =?utf-8?B?SFF1T1J2cUpSeEo4bXd0VTlPZHlEMjYzbTBtOGpjWDB5dG9RSTVKRmpqdHds?=
 =?utf-8?B?WjAyZnh1US9ZQnRRU2M5NG4rYVR5RUc4SGQ3UzFueWZDUFNWbVd2UGxURHRk?=
 =?utf-8?B?T0xRNVlHbVNaYytmbmZmaU9BN3N4d2VUbzRIMGRGaTQ1a0MyZWZQWklZY3FX?=
 =?utf-8?B?RnArTWFma0FyTUQ3NW1qeUp1dS9TM0c4SjdHYk5GZkgwZWRxd2lpdy9lRHZD?=
 =?utf-8?B?VUxEcGVoN0NiRWVpTVdtSy9WcXBJbTg1RzQzeHpUNENGcXdMOGR1d09DdjBQ?=
 =?utf-8?Q?GfXSOf8/oCGrAOVJn6eccUt43?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e24c3c-0665-40a8-dc7e-08dd354851e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 09:38:08.6784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTkZbuPooJZB34kO5/8J2rC3Z528RRjZRo4IcloEHgNpGsFY25vxt9CRGCBUbznv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6693
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

Am 10.01.25 um 21:54 schrieb Jason Gunthorpe:
> [SNIP]
>>> I don't fully understand your use case, but I think it's quite likely
>>> that we already have that working.
> In Intel CC systems you cannot mmap secure memory or the system will
> take a machine check.
>
> You have to convey secure memory inside a FD entirely within the
> kernel so that only an importer that understands how to handle secure
> memory (such as KVM) is using it to avoid machine checking.
>
> The patch series here should be thought of as the first part of this,
> allowing PFNs to flow without VMAs. IMHO the second part of preventing
> machine checks is not complete.
>
> In the approach I have been talking about the secure memory would be
> represented by a p2p_provider structure that is incompatible with
> everything else. For instance importers that can only do DMA would
> simply cleanly fail when presented with this memory.

That's a rather interesting use case, but not something I consider 
fitting for the DMA-buf interface.

See DMA-buf in meant to be used between drivers to allow DMA access on 
shared buffers.

What you try to do here instead is to give memory in the form of a file 
descriptor to a client VM to do things like CPU mapping and giving it to 
drivers to do DMA etc...

As far as I can see this memory is secured by some kind of MMU which 
makes sure that even the host CPU can't access it without causing a 
machine check exception.

That sounds more something for the TEE driver instead of anything 
DMA-buf should be dealing with.

Regards,
Christian.

>
> Jason

