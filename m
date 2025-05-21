Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E464CABFD3D
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 21:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00FA10E7C4;
	Wed, 21 May 2025 19:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D7813NlK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42FC10E79F;
 Wed, 21 May 2025 19:18:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCghwVROmBpeHcX/lh/GZDsaCqp4cNV9/orFfWkeW+fdR5S6Ubgz1teKeEimQY5vlfX/7kolOqGIS6QMPgfEZzWsL/kIVODp3QYLC8m4Wwnx7ClXcKzIv0COrBexM/bqHcVQmTmC6XRmsEedz8c2eDBtWMtxOJI7bnBfMULDw1U0yeOazAsl5T3unr9hkLnfXYB0rSoK8Bu3+o1dXKn0UMmrVE5MuOguJJcTBdPVCKjtJYbTnZS5qHCm1DcaEs2Vk7Fqp1S1420Kagd0M6fliNrW7jAF3WRGjknEzmcZRcz1RoGq7UfSx/Mq+adcyUqBAH2z0xR9TiRX0biiJy0Q1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prB4qEc8Y8wgfpxShijy57l+YjcbSI+CCOxNCpW11vs=;
 b=ZY+mUoh6yB5CHIxKdRHR+CLiptVfhMXAeO6nibgM/kZn/+HOdr3Gitw2B1dYv/qoShdjP+qKvKrm0UslmkKnnhsjArQvk4SjYjc7vTpQUgGwIqapDV3iHbsCVO0JrrUYt2R6tA3Fp9Z/32D1q5vlUaON4gK2l9IwywuCJ/lEbiMA9uYXrmsx7cBqph1OokHApUFjQ5ciPlI541MoYjkuf5jJ5fD9E7mXGXYI/SFgvwiFdvw/8oHfT87GYGgcr0Q+mKedtTE8HUnZesAfIZDzkcObB4iDeGYp9AXcDW9AjfDDeGNsAk386d5Gu82ToKIKQbskM/qOG6dNJRB8FlJFcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prB4qEc8Y8wgfpxShijy57l+YjcbSI+CCOxNCpW11vs=;
 b=D7813NlKtWH7zFSQrFsGY+5SYJN3taxfN1aTwoZTjA1Rpd3w3NWtyl+IXDbFswjO8ZCcP6gPkiNXVCRsSfF9SuBSSobpQuXnVFf//Yz11tSqr0XATLO9OrL79RWPRnTwtchmHjLQ1QbcOjj9udnNUD09RYOWB/04Fl69Jlk/38w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by DM4PR12MB6469.namprd12.prod.outlook.com (2603:10b6:8:b6::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Wed, 21 May 2025 19:18:17 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44%6]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 19:18:17 +0000
Message-ID: <f92df258-653d-49ba-b8f6-a1b677744a1e@amd.com>
Date: Wed, 21 May 2025 15:18:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 40/43] drm/colorop: Add 3D LUT support to color pipeline
From: Harry Wentland <harry.wentland@amd.com>
To: Simon Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-41-alex.hung@amd.com>
 <CAFZQkGwrP39REsvZwQ_Uaq+cHR_pH2EPuv_POXRO7Hxj9u4Xsw@mail.gmail.com>
 <vyX7bdPppc_pDUQBeKeZNyy69WUl_XKExs-I7dfuDJJy6SKXWoBL7B-IRMZKxuktNMQCIg0lP56Xj0qLidKOlBJQJjUYHOQ5Id6yw5k8Q10=@emersion.fr>
 <CAFZQkGxXJe=FGdymMRevbtU+jKre6PdthAu33Qz+kVsR_OVpJg@mail.gmail.com>
 <BqFABawLqkjFjPvuKwfsFBKt2A6KcEIeJU289qnX9Try6dV0nhXeXF3vxJUK_xUP5a1gfARBt3wY0lpOV2Nbmcmj5WXCw6fsZjPNT39KAu4=@emersion.fr>
 <b3bf99cc-f6f4-46ce-aa00-fea74b3179b1@amd.com>
Content-Language: en-US
In-Reply-To: <b3bf99cc-f6f4-46ce-aa00-fea74b3179b1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0312.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::24) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:EE_|DM4PR12MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 94526576-04f6-41ef-9a20-08dd989c3d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3VvYzkxS0VQayt5UzBJZGNXNXpSUW1nbHY5c2xRbklQVWxldGthUVB2R2Z4?=
 =?utf-8?B?dGlNQy85c0tKS2lVTDNXMlJUdFAzNVhOZGNwV3V4d2FUVmNvNEpFMkYrb2hG?=
 =?utf-8?B?R0pQcmEybS9vbERMenJEYitWQ1BhRDFOZXdVTjJvMy9rbVFMN2pXd0NnOWFr?=
 =?utf-8?B?enlTYlNUbHpXOGhkWWNZVDVxYWRnZ3JmemtqQzdGa1ZwbmVndTVRNTY5SHdO?=
 =?utf-8?B?UXlVV0YxenpkVW1iRWIxa0J2Zm4yOUdpTUNiNzFVRktvOXFpM29oWVNOaWtT?=
 =?utf-8?B?VDdHUk5kcXVZZFkvOTNTdkpvem1JQ2U0K2ZtZTIvMnRLWUIvQXFZMzlMK0ZY?=
 =?utf-8?B?VDR4Y2lzVDRSbTFYL3k5aWVjTzloVm5IbGxhTDhvOUJoLzB3cm5rSXROcDdp?=
 =?utf-8?B?Wlh0c1p3dm1zUnI5Vzc0eUxGZnp6K2RRQ3o3OGJFSG01aFpLY3ZUQVNmREdN?=
 =?utf-8?B?QjMvMjhQeWQ3VG1kU2E0QVJia05Cd1lzYnlGOGxkRThOVkFSQm9RcW00NllX?=
 =?utf-8?B?RUl5UDV6RVBCQ3YvTHVWdXB0WFBISlhCcHVkNUs5QUoyV3prU1NaZG1DR0s4?=
 =?utf-8?B?dkUrSjVyajd2N0ZUNGdhU2kzUkQ0NzhtZkQ3MHFObGhvNjVUWHVwVlhHWS9N?=
 =?utf-8?B?ZmVreWxPbERTRzhqL3UyTVoyNEFPSDh2OFN3ZHVuSERpQlVaNG5mTWQ0LzAv?=
 =?utf-8?B?OWtZYmp6UzI5OFBPUVdRc3VxMXJvdjE1S1MwVzl5c3JxWHVkMmJLelY1b0x3?=
 =?utf-8?B?NEVrN0FoOGZ6Ymg1REFNTk5JQW84RzR1akswb2orUDhkektxQzdqMlFnV21S?=
 =?utf-8?B?OHFPWjJTTnJrajRub3NvbS9jWXc5dWxZRnEzdWEyOXFkY1RndU1ubFNnYVBF?=
 =?utf-8?B?eDdPNFRZQWxHekRNczNLdjZjSGdXOGNDMFpQeTIwZ21jRGQ2dzREQkVkRkJn?=
 =?utf-8?B?OHBLRUdjelB5bDN2c0N0RGh5T1JJbEFZcjFlYTU2anA0N1B6SDZoMXpPbi9W?=
 =?utf-8?B?WTdKZ1J2bnhzcGNEMFV6VUhuYXJvL2E4b1hpOUd6bFRsZWdOczlPV0lYdHNE?=
 =?utf-8?B?UlMxYlBsd3kwcUlpQTU3Zm10VGhQbVJBTkNSakJVMDlpdUYwMSt1cnJVTGVq?=
 =?utf-8?B?VUl2TUNmOGpiY0JqZDIxREMwREc0UGtOWGhsZUdwUDQwdGIraFk1TkVxWkkr?=
 =?utf-8?B?WWx6aStyVTdiT21sSHhUdHgvZkc3K0wrOHd1QWIrTnBPazNzSHhvVVFKRzZL?=
 =?utf-8?B?b1pZRXJXZmhtZExSSElQQ1lOZTVIYlVoWVJGcW95c0hURnVKb2hQN0pXRkpW?=
 =?utf-8?B?QkdDTUtnVFF6cVdyVFNiTFV3R3h4YVJpbC9PemZFa3Q0UXZiUEhKZC9XcVRT?=
 =?utf-8?B?MzlXdEdjUksxdzcyVVhDVzZETHV6Nmp3S1FvaFA2azF4QzI4SjFQZ3NrZ3U4?=
 =?utf-8?B?QzVlK1cxU3AyalF6MTZBZkJUQWpUQzlHOC9MSVFXSWZXS01MWnNDcmpCaXBI?=
 =?utf-8?B?R1VZY0NndlpwWG9ob2tCUS96cFpkM016bk55Z0hFSTRKclhySDVqOW55SGZv?=
 =?utf-8?B?YjhUNGxmcjJoMFNTL0NWUHdyK3A3N1NPQy9DRjg0N1pjZVd6ZDRSUGpiWjJ4?=
 =?utf-8?B?WUJLOVFnS3pjaW91ZGFub0pwSmVTV0kzV0tjTm02K2lETU9ubFVpRy8yZGlw?=
 =?utf-8?B?K0w0WDFKN1g2NFdzTDk2eHBXcVNHY0RCc3RyTUFlbmdVN2F3a0dCc0JaRjhj?=
 =?utf-8?B?UDRMUU9BNWdJV0ZaRUs3LzJvelRka0RjeFoxRVkwR0Q0RGNmMHJzcmtvUzVU?=
 =?utf-8?B?SjA1ZGczQnBqczl3NXgyaGs3eHk5SngvVzFER3hIbGlKVGI4TGo4bmVXZmxR?=
 =?utf-8?B?UG0rekdBTVZ0VDByemx3aHRGcWhOZHZJNjVrOTNKZDdMeU5qeDhIRTFaZG1F?=
 =?utf-8?Q?y9gYb5VGLnY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkRSbXhoWVladlMybmxNdmFFSHE0U1JXNUg1eU91elg0OGhOT25pNzdKVHhG?=
 =?utf-8?B?K3Q5NS9Ma21qSzRpbUw3MHlISkJTK2xSOEJkbWF0YW1kS3hhQld4VWdVM2JY?=
 =?utf-8?B?bEtKdFVrVjhFd3V0WVRwRmRhYmswZmh0WlNtTjF6QzZXZ1Nxd3ZES0VtNm5M?=
 =?utf-8?B?WWpnZm9qNnBoMkVnTUNNajNYNXd0UWllYWpFVjRkSWJQbWkwTVFuRUFMMkI0?=
 =?utf-8?B?TEVtRWllUHhqYWMvVUtoUUJ6UUh4YkhsTmF6Ry9LV1JGTXNQZmJBbUUxOHJp?=
 =?utf-8?B?ZWc0YXMxekpoQ1JtNS9xdU5EN2R6MUZqMnBjaHhNR253QmhXWmV6WHROSndW?=
 =?utf-8?B?V1F5MDNjTTRNZms5Z0RZUzN0c3dkb2hsQ3FqSXdLaFJGTnE2NDRNOTVPVEpt?=
 =?utf-8?B?RGYrZkpqOFVnZzRaVTJWYjNPcG9BTVBFYjAwSDlWRTdhcTFnNHZsaHA1anN2?=
 =?utf-8?B?b3BRUVBjVGpuMm12QVlpNG1pVUJoaG9mNllwa1IyUzBHdnFuRVJXbzE2WHhr?=
 =?utf-8?B?WTZUU2MwU2pWMUFyd2JVU1kwOFJseUNxN0ZMZEdHalV0Umo2S21PdnNmY2t4?=
 =?utf-8?B?VXFCbkVQN0dFZ3plZTZ1cUh4b0dRNk5iUnAxV0RueXc2S2ErWFZUbDVjc3cy?=
 =?utf-8?B?cFp3aDE2dEFwSVZTNjdMNHRyQTRUL0dMNnNaSklsV1hIVmZvV1FjYnZnMWxn?=
 =?utf-8?B?SndmRTFjRnEzRk5kcjZHREdKVEhycFpxYWsvSXBQZWErMVJMQTJ5QWNzRW9J?=
 =?utf-8?B?M29Qc2pNTVpyTWJ3QS9JUk1ZN0liK3B1cTVUZzZYVDhsVjhhdjdmL1l5VnVj?=
 =?utf-8?B?K0g4S0NLTElrVStpTUtMMFZFOXVSNTNxUkEwM2hxS2FNcm5yV09kbmNtaTZr?=
 =?utf-8?B?T0U5U2ZLMHYxY3VOdkhWcEJTZHN3V0lhVjQ0c3ZCUkpKVnlZOTA5WTAzQll6?=
 =?utf-8?B?dTRpVUlKeGg4M3VEb2ZqbUNEU2RyL0FkVEFUbWpLTkJpbTIvR2RzR05OKzV3?=
 =?utf-8?B?ZGg1c0ZQV0lvVFIyYlRDUVpqSUtMZ2thM0pGNmNKbTE1cUV2YXBKdzJ2OHNv?=
 =?utf-8?B?YTRDYyt3RGZ5VnJobithQlBtNUJId1NhOGFNZGZaRHIrYTdiY2l1bUNpNFcv?=
 =?utf-8?B?ZTUvOTJ1NHEwTExKN3YxZEM1ek1meHZXNlFkaS9MeU13cmZFOUhVL0ZBS3dM?=
 =?utf-8?B?Y3M1ajRrVHpseHcxNEdLU2dROEVNdEczRlRGY2RUQ3Z1MHdZbEQvVzd2TWww?=
 =?utf-8?B?bkJqSDV6NlRoZEs5c253dHFnNG9HRWdMcGZDZitobityeXNpbEphdFNTeXlK?=
 =?utf-8?B?NEl5VnlzdEthenpDQ2xxQ0lDT0pSVngvL1N4Vno5MGMyY2tDczhxc250N3d2?=
 =?utf-8?B?Qk50UjdEWGxrVERJc1hzb0RKL3huazJhRUYrMzdqSUtTbmlqZ3FEb2I2Y2l3?=
 =?utf-8?B?UXcxNm44WkVNUTJ1S0pycUJDaWxjY1JCdzNjbXpLcFdLKzZsdmVKN1YwRHky?=
 =?utf-8?B?c0tGL0NTL1NZSFEvRGY1QlRJS2RqYjJzSnZoRzJyUnFSbk92aVFJa3dvZ0o4?=
 =?utf-8?B?aThKbFlUblBNd0hQcGRkMENTL0FFMGtCc2xITWl6NGZ4UEpYVFRsZG9VMy9z?=
 =?utf-8?B?SVp5NnBNdmhWTmhNbndET09DeVIxM21yTWpRSkxkbXFGRlFpVlFhRTdCOTIv?=
 =?utf-8?B?YlNqbFhNdzg3RStTZCtnWGpTRnMxeWZEdytuQmNHSnpBRlRGcWg1ck5OQ2ZS?=
 =?utf-8?B?NjhXdkJIZE8xR09neEJXbDE0OVBkR3hXRG5hN3E2WkNHZXJYeG1VMlNuY1lT?=
 =?utf-8?B?MnJiZWkwWnhvZk1CRzJmUXU0VERHU1Qrc2pXRWJXSVh6YnAvU0tocWNKQVFy?=
 =?utf-8?B?cmNEdytPKy9CamJBQkdFYkUwSnpaeGkrTmN4WFZGSmZDN3BzL1kzajFIbVJE?=
 =?utf-8?B?K0NnbnlQYURFZi80bFJ6L0R6Y1ZzRUFnTHVGdWdtaWdSdm9NSVptbU5FL05G?=
 =?utf-8?B?dGhtZkx1OHhjK0NKa0xscTB5SW5FL2xRNGFvY216UzZ1TFNwbnZYNU5YSWNX?=
 =?utf-8?B?RitPTGRsVGlRQmZINm9CbEdsdWkzUnhBZTJCNzQrUkZQRTU3RkxvcUpLcVAx?=
 =?utf-8?Q?g5GXf4BfkHOHMJZ0baLHDwDJ1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94526576-04f6-41ef-9a20-08dd989c3d71
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 19:18:17.2308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrzrR94zGWzreOAfbd9w3ZeaFmriL2twddQrOBmShDZgcQSJAhDoSE7TPaCfBo9OlrpKp6LxMPRhWZ+Q6x5JuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6469
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



On 2025-05-20 16:13, Harry Wentland wrote:
> 
> 
> On 2025-05-19 19:43, Simon Ser wrote:
>> On Sunday, May 18th, 2025 at 00:32, Xaver Hugl <xaver.hugl@gmail.com> wrote:
>>
>>>> We can always make the property mutable on drivers that support it in
>>>
>>>> the future, much like the zpos property. I think we should keep it
>>>> immutable for now.
>>>
>>> Sure, but I don't see any reason for immutability with an enum
>>> property - it can just limit the possible values to what it supports,
>>> and that can be only one value. Either way, it's not a big issue.
>>
>> Immutability is a clear indication that a property has a fixed read-only
>> value which can't be switched by user-space. That's also the pattern
>> used everywhere in the KMS uAPI, so I think it's better to remain
>> consistent here.
> 
> I was envisioning this to be a driver-caps thing, but I agree
> if we make this mutable it can still serve that function but with
> different/future HW possibly support other interpolation schemes.
> 

Would changing this enum property from IMMUTABLE to MUTABLE
in the future (for drivers that support multiple types) break
any userspace that assumes IMMUTABLE?

If not, maybe it's best to leave it IMMUTABLE now and change
it only in the future if needed.

Harry

> Harry

