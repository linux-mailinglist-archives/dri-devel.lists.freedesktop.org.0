Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF8EB918BA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 15:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1798C10E4B4;
	Mon, 22 Sep 2025 13:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O4r5Oux9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACA910E1CE;
 Mon, 22 Sep 2025 13:59:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdQU4XNxvXHeKDiLFm+NFZTRfy8YsxHUkSjEX6Ue4nip7elsF3qn414l+xF8xUmwYHlMBVt1NxAvTk/x1ctbpLWyzSmy8GS0ZwTmGSf9/4cKdOVg60ebXLBW7OyHwVnMK+5yoCyxTvvipCkGeVDBCl+iIoRN0cWrIHmLL0a6vLuUNkzgfY7aQ9FuamZHIQT24DDIqeGZ1KJTGRn9MEfI4Z1VKsZGjgCSaXvkQKJN7QLXekYh/xor4niFZiBSo9Q+06QkB71CuzPvjGTsL339MztLsXzhE5qoC2rMieGHXjdlHD5I3uAQcz+kQ63/GvCh28YTZJwJf/0RJNjdatCT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9diyioxlQtPJt7ZXvnNydQCGsDgmLNuO1+HOrnPcxso=;
 b=Py2O6cckg2WQg8s0tTjZ3Vt6ekrLN+vE1kdGWdcvb85mfQq85LeXkjcZlpSCJDojUimi5ZWDnRJhnl/viPnr3CL7PyqHiSZ96xMduYJg68vQzIrHYpRS/WirU90RimZ+r4qWg56WsX8ZgLhl1oM76pSnHlkUcIyS+hR/JE9bIEB9YD8hGZOrU0khuYrhvgl0iEm/BA4k8h6uzZvdonqdZ+6kNG7B+t4X6gnD4FoJIM2vP1LkfcInqqDrc59sNErr1lji+mxBlF6V2h8tb+/NpYfQ1IoHGSM8HDotVJpQLZ7VE124mSpOL3g/UPef7Jc3VUhDsEc2UTjj1ZBjGWEy/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9diyioxlQtPJt7ZXvnNydQCGsDgmLNuO1+HOrnPcxso=;
 b=O4r5Oux9sgkVOdAz4DGIMA/odxKR/50R/kbmbiC/6QuaWo3y3SwpO5JASvduZAX7qHzmtR7qsHRWpSLxWBE71tIuW7hoGWzi6y2Sp4wRv6Jv4qsdBXZG6kQDIbfgWfx+nzXv9MvBQWJkKQ0uitqa2QC0zfRJGrblckX2jWcmf1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB6738.namprd12.prod.outlook.com (2603:10b6:510:1a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 13:59:17 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 13:59:17 +0000
Message-ID: <82fee878-929b-4373-a476-63f34122d780@amd.com>
Date: Mon, 22 Sep 2025 09:59:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: Use kmalloc_array() instead of kmalloc()
To: Rahul Kumar <rk0006818@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
References: <20250918071201.350162-1-rk0006818@gmail.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <20250918071201.350162-1-rk0006818@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0323.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 56fc3d32-8c6b-4c98-9aaf-08ddf9e03878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uy9JMHU5RlpIc0lXbHNCMnZhYVM4QW9LUHhLV3J3eFhPYkUxUzF4eVhRbnVD?=
 =?utf-8?B?M1ZrcU5qVkZYeUQreE5ocVpFSFNwUmNVTklqTVR6SW56d0piMVhMUEhHclBD?=
 =?utf-8?B?K2RJcFlwcUYzNE5LQXh0amdENGtRZ2FBOEd2Y2VwWDFPakJadktKVjZnVFFo?=
 =?utf-8?B?dG1INHFhRkluUTVlVEc0UjhXZVptUUJWaWcvaVlvSHk1clRLUlYxOEFVWElT?=
 =?utf-8?B?T0VReVNiWWtnK3dSZlpwWWJtYWFhREZBWUYvNGRiaytiY1Z5Ung0N2dNOEV0?=
 =?utf-8?B?NXhIZ3hMSFdFSC9peHdnWUV3bk9oazlBV244Sm5PL2gvQlJEYzEyV25Sa2Rh?=
 =?utf-8?B?L2FjK1ZmaFlwWVRCNHJJOFlLNkp2L2VmRDQ0WXNTMlJ2M1k0YmxnKzBsMmhl?=
 =?utf-8?B?SDVKdlcwdzQyZ1lRWUZ1eDFGMkJKWWFXYW1NSTRiQkZlZm55TkNacnBEU1JX?=
 =?utf-8?B?NXdHUlJTVWNHNlJ3a2w4R1NCRTVtd3ErMjlDMDhKa3NOcmdxNWo0UmhkTG9w?=
 =?utf-8?B?bDgzdUtHczRBdEdDUDVXMmlhZ3grcENWbVRKaW9McFR3V3puaHlaemNyM0po?=
 =?utf-8?B?cGVFRk4vYml6SmRIMExXK0hnOHAvVktvZ3R2WXVieG5ORWg1SUZsOWpUbHNP?=
 =?utf-8?B?djJ3S2dIayszQVFSSlJyL3BRMHFET0VnQkwxQ3FiVWZBajRtUEhCQmxQSEt3?=
 =?utf-8?B?SmtxdHAreUpsNzBBRlZkRk5lYjFiS3B5aDkxaGZrOUdaTzdLV29LaFBOdG80?=
 =?utf-8?B?UUY2c2xSSWNHYUhVZ0c5WjAzYUp3b2lqbnN5dnhIWEtkSldTc3JwMS9xbk1U?=
 =?utf-8?B?V21HS0xtY1dtYlB1MUEyRmpJazFsUDhFa05jQkFMM0dkL0ZKeVRFYVl0MU9O?=
 =?utf-8?B?aG1ScG8zVmhERnVlSHp1N1FYV3VoZEg5MTV5Y0ZIZXU1UjRpZlBWMUl1RW5F?=
 =?utf-8?B?RndQa05ZRU04dzJWSHUwRW9qMDNiRGY0VlJQWEZZbmlUUC96US9nUXR3YXd6?=
 =?utf-8?B?NFpCcWswM1VRenVkaHd3aGVrSk9LdGE1c1dwZXVYL1JCVTR6V2VXNzNqdzJG?=
 =?utf-8?B?NGZEU0NCVFZxSk4vTGhpbHpsNXZkNkpVS1cra2dhK1ovMG1WMGhlWXBsZjFN?=
 =?utf-8?B?U205eHpnalFkbTB1eHVMMVZ3a3gxU0VCYm00RUVrZ0hGODFiNXJnODBMeFhR?=
 =?utf-8?B?NjFUWUxFdCt6ZXpTRXc3eUlwOHNLbjZMbktzelNWWXBRL2krRjFpOElyd2d4?=
 =?utf-8?B?UUVwbGhYVm5sSkgwSmFMWG1PTE1hMS9PeERCRUU3aFFNOExKQ2NnaEk3S3E2?=
 =?utf-8?B?eEZGTXFJTUJPTWRVL2ZibGhEc3I5d3AzbitmU1dCUTRVVjNicmNxQXRxU0My?=
 =?utf-8?B?YWdNanZXTzZMQ2VBVXl6a3p1YXlUd2NNRTBjVVJ6WC90U0dXeXhXeWlHUVRV?=
 =?utf-8?B?TG0zalNpckRyM3g1U2RWVmxSMkUvVGtNU01vRVRNbzdRZVo5OCtCY3lzb2dm?=
 =?utf-8?B?a0ZFOWJKR3VSZE80bTNFOU1oQUVWWlV0ZW0vbmZTS1ZnM2tmZElLYm9uWC9z?=
 =?utf-8?B?OVBPYURGQk5qemxiQmQwRzJDU1p6MDZrSVlMdGtMTklhTW9tQVJxYU9Kdk9Y?=
 =?utf-8?B?L2lSNSs3QWJoR0QzWUx6VUxVcmVDM3c4RDJwMVJPTW54WktuRWdCZnlaZzdC?=
 =?utf-8?B?QWVKWThPL2lZNmpsVFNjSVBIb20rbENSQ090cnlTa2VuSzdoNm5RMk5GS2tN?=
 =?utf-8?B?Q2plQ1BMU1VSZzRzMFNvYm1EUHQ5Zmk3R0lJTzM1Rm9FWWNaaS9BaUMyTTNo?=
 =?utf-8?B?VFJ3Z3c0SEhqbWlkM2l0aER5dXpmRVhQSnFNQUZwU2ZkZjV0cFNqV1BHOVVT?=
 =?utf-8?B?aFpFYklZOEhTeWs0NXkxNDE0WWpFZWpGS1A3YUd0S292allSeURHNE1rbVVB?=
 =?utf-8?Q?r4FKm1Yeomw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXhIa0NvWnZvNjBtbzlhVkxpMEFobHVOakxzbld2Z1dkdmtMcXdyYVNPZStU?=
 =?utf-8?B?djBGMmZJbmIvczFtUGNGTVB3b1hCTzBNV0FBaFVlTUlqMC9QYW41KzYzRGRC?=
 =?utf-8?B?SmxvM2tnVTVpaFlManZjVk55K05zdklBOWRuUTFJUGFaQXJGSkpQb2d2RWpj?=
 =?utf-8?B?MGlhVFRML09YRDF5R2dSWFF3dWlydHB3cWpQWEVPcmhWVkNWZlBRc2hKa2M1?=
 =?utf-8?B?SXVsTDBYSTUwb1NEQWZjMTg5dklFekorVTdjZGFOWjZsSFdsZFpuWW1FaHFx?=
 =?utf-8?B?K2dQRjVFUFB4ODhFclRPSWlLZHJUZ3Q4L01EREVRU0lYWGJGTi9BeCtuSlZy?=
 =?utf-8?B?UHFpUTZxSUV1UG5TaTUzcXptQjQxWXMvbHUvSWNTNHFVaG4vQ2hBMXB6Y1dO?=
 =?utf-8?B?V0tzTVcyZzJCZndxZnpQY3Q0cWhaQWdSR2VCdzJMdUF4L1lIbmFjZlJFL3V5?=
 =?utf-8?B?SGZBTXd5WDBqc0wwck5sRXllTnpYOWxXZ1BLTVg1bUM5SjNXaWpoRC9IY0Vh?=
 =?utf-8?B?N0xDbHZZYWFMRDdINUhXQnZoUk9heGFkTzVESFZsSFgxZUxGb1dCVmFKcnRo?=
 =?utf-8?B?QzJDTTBzcXF2dDZjWGFvTGxQM3JIb1gxME5EbDdNaTJwZFVIQkxrWU8yejla?=
 =?utf-8?B?M3RMQjV5UjB4YmxFMnM3K2djQjFoMC8yTDBVTUJwMmlPY3RMaStwREZPVFhJ?=
 =?utf-8?B?VWNHYmVvWjlLbWZHYSs2NmU3dnNZTjFGK0ExSDNhalEyajAwNjNFbjJzVVNK?=
 =?utf-8?B?ZEluRE12WFFHcFVkV1NjSmpGZjgxdWZWeXBnRlluZTVEdWxhVHhvMG8zNC9C?=
 =?utf-8?B?YjVGZS9tbmFPaExvbzNHOUlxOG0zUm1ZRHVOdkNWOW9Uck1Tc2dKcFhYSUdi?=
 =?utf-8?B?V0RpTDAvRmVVaWU5TllQS0tLY3FCL05OOHJVMFNMYzBBVnJwanZQQUtuUERi?=
 =?utf-8?B?bHI1d2IwUmlJRjlmVm5kUFcvWXlyRktZUXBjTmc3TTV2Z0N2TXVkU3J1bFJz?=
 =?utf-8?B?ZUdKRGx6d1kvSDhraEhqT0ZOWTlhN25sSFdSYnViQm9RbE9jNE9ya2pDWkp6?=
 =?utf-8?B?KzdVTW9ieG9PSzhoaHU5STI5LzVhVnE3Z1BBay8xZDdkL2RkTWs3cjV6aHpU?=
 =?utf-8?B?VndNd1JuUi9uVGtmYzg0anlqRkVoUEt2akJ5Z2M5TXFYSi83UDdQSEtHdGMw?=
 =?utf-8?B?T3R5cHVNaVZnc2dFL1B4UkN1UFIrUWNwMk5NUUNDTmNCTEUzQm5QTWd4bFdC?=
 =?utf-8?B?OUpCZFNERnlTUmRoVHZsZ0RuTFdFUS9hUlpSU2xBNWtEUkNycjlud202WURm?=
 =?utf-8?B?QU1sVmRiZU82cGtvcnM1QWhpYjE2M2JwL2lhcWtSbHRNU1hjYWN3amRpZGVI?=
 =?utf-8?B?MHdlc1l3OTJYdlZpOXVsSENjLzF5ajlXYVBmYjl1ejJFaitGRUFVUnV2MURz?=
 =?utf-8?B?ZCt4dWRoU0s5N0pOOEZOdnA0cEUrVVczRVNpK1NUaGdSM2V2TjRIL1E0eUVV?=
 =?utf-8?B?ZHJrWG5kSmhNWkZ4VENUbFZUWGdRWnljR3E0bTlZWThFbndiL3NyRlZZU1VQ?=
 =?utf-8?B?R3dackt2K1lqTThnTkI2TjU3N3E0WHVybUMwSHFpS3RDdk82TlVOM0VSaWNn?=
 =?utf-8?B?Y0djN2dYMVVxVWE5ZzJWUnExT3JVdWlVRk51TElieVFyd3BXeW9MMGhiUTBo?=
 =?utf-8?B?WkNwbEFPc1I0dFFJRTBhbEl4VDNaZkw3N1IySUM5V3U2ekJEalpVS0dOOEY1?=
 =?utf-8?B?S2pUOXUwS3lyamR5S010ejFVS3I0aTAxSzJLVzJEVGp0N1JDVmtHbmpEN0Ji?=
 =?utf-8?B?K2VCRVNIeHVkZ0E5ZjJpc0R4RFRaakNCTnVkRHNSbjZWVytqZ255S1dWTk9J?=
 =?utf-8?B?YitCRW94ZmRkQUY2SEFrUUwxOFhvUXFMdEVmQVRDYU1peGYvUWxmSmpHd2kr?=
 =?utf-8?B?QnFMdFBpU2FxM2c5aHFkTUQweG9XOGRJV0VwMzFZcUxJV05lV1lvU1AxV1R5?=
 =?utf-8?B?djBPK2JVaE9DTmVkY2FXM21mRXdrTnA2Rk9QbUlkMHFKOXJzVkZDQk4xT1dW?=
 =?utf-8?B?QnpvemtPU1AwUUlLdHYxMVdPSnY3Tk51cWV4K01HSWUvWHA4R1hvMTZYTkU2?=
 =?utf-8?Q?67lHiN3WtAXRpwOVUgi5uF/89?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fc3d32-8c6b-4c98-9aaf-08ddf9e03878
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 13:59:17.4453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZaqZZz72y4oEnw8UCCyr+U3uW3K/VmYdLKqSUxh7cSHX0CR54iwcGsrYxAyf/CIoveOI9xVIldoEkU8HOcWEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6738
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

On 2025-09-18 03:12, Rahul Kumar wrote:
> Documentation/process/deprecated.rst recommends against the use of
> kmalloc with dynamic size calculations due to the risk of overflow and
> smaller allocation being made than the caller was expecting.
>
> Replace kmalloc() with kmalloc_array() in amdgpu_amdkfd_gfx_v10.c,
> amdgpu_amdkfd_gfx_v10_3.c, amdgpu_amdkfd_gfx_v11.c and
> amdgpu_amdkfd_gfx_v12.c to make the intended allocation size clearer
> and avoid potential overflow issues.
>
> Suggested-by: Felix Kuehling <felix.kuehling@amd.com>
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>

Thank you. I applied the patch to amd-staging-drm-next.

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
> Changes since v1:
> - Extend fix to amdgpu_amdkfd_gfx_v10_3.c, amdgpu_amdkfd_gfx_v11.c and
>    amdgpu_amdkfd_gfx_v12.c as suggested.
> - Added Suggested-by tag.
> Link to v1:
> https://lore.kernel.org/all/f782159b-ad3f-4d0c-8476-50a701bf29e6@amd.com/
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c   | 4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c | 4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c   | 4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c   | 4 ++--
>   4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> index 04ef0ca10541..0239114fb6c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> @@ -352,7 +352,7 @@ static int kgd_hqd_dump(struct amdgpu_device *adev,
>   		(*dump)[i++][1] = RREG32_SOC15_IP(GC, addr);		\
>   	} while (0)
>   
> -	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
> +	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>   	if (*dump == NULL)
>   		return -ENOMEM;
>   
> @@ -449,7 +449,7 @@ static int kgd_hqd_sdma_dump(struct amdgpu_device *adev,
>   #undef HQD_N_REGS
>   #define HQD_N_REGS (19+6+7+10)
>   
> -	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
> +	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>   	if (*dump == NULL)
>   		return -ENOMEM;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> index 6d08bc2781a3..f2278a0937ff 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> @@ -338,7 +338,7 @@ static int hqd_dump_v10_3(struct amdgpu_device *adev,
>   		(*dump)[i++][1] = RREG32_SOC15_IP(GC, addr);		\
>   	} while (0)
>   
> -	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
> +	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>   	if (*dump == NULL)
>   		return -ENOMEM;
>   
> @@ -435,7 +435,7 @@ static int hqd_sdma_dump_v10_3(struct amdgpu_device *adev,
>   #undef HQD_N_REGS
>   #define HQD_N_REGS (19+6+7+12)
>   
> -	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
> +	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>   	if (*dump == NULL)
>   		return -ENOMEM;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> index e0e6a6a49d90..aaccf0b9947d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> @@ -323,7 +323,7 @@ static int hqd_dump_v11(struct amdgpu_device *adev,
>   		(*dump)[i++][1] = RREG32(addr);		\
>   	} while (0)
>   
> -	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
> +	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>   	if (*dump == NULL)
>   		return -ENOMEM;
>   
> @@ -420,7 +420,7 @@ static int hqd_sdma_dump_v11(struct amdgpu_device *adev,
>   #undef HQD_N_REGS
>   #define HQD_N_REGS (7+11+1+12+12)
>   
> -	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
> +	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>   	if (*dump == NULL)
>   		return -ENOMEM;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
> index 6f0dc23c901b..e0ceab400b2d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
> @@ -115,7 +115,7 @@ static int hqd_dump_v12(struct amdgpu_device *adev,
>   		(*dump)[i++][1] = RREG32(addr);		\
>   	} while (0)
>   
> -	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
> +	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>   	if (*dump == NULL)
>   		return -ENOMEM;
>   
> @@ -146,7 +146,7 @@ static int hqd_sdma_dump_v12(struct amdgpu_device *adev,
>   #undef HQD_N_REGS
>   #define HQD_N_REGS (last_reg - first_reg + 1)
>   
> -	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
> +	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>   	if (*dump == NULL)
>   		return -ENOMEM;
>   
