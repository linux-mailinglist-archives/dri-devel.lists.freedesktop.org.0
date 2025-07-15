Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562C0B05D57
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4BE10E5CB;
	Tue, 15 Jul 2025 13:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rPNEkWiv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECFB10E5CB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:43:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXNTvXJjwqJuATBbCCojX/XhuUbCY2ECnXjd55ds4hdQKTmRfZbXgdPA3bP9Qxg28mCyRzF9iJGd0CPQFtmbAeNbKywFBFR3fIx7OVNoZszrf2jxGe016+KruO5VRO6ooAilj5I2ChjoM8Q+vltAo0ueqaFg/wrWo2IqkwPdthOGNuxhcV3RruehOoOP/x7lcdat0kc54XKN32wKc5rVzNZ+dO0k4VwYTXE6SEP+xQUPAW7Bn2QZi7roQYW/SXj2A2/Hgf66UTQZ0tMtXLJmxmL21P+pt0LbRui23/PyxyuelliJ0rOWvcxqtkrj011fU2pmbqFgI6fgHgWkjxhz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIl0Ipdjud87YzyIJAGQ51WL7CQ3haeXFO79ONSMRyY=;
 b=y4XCACi7RtEbXDMbRcBnrFlxGzWi9MY+8ktFr6oZKX/N6QxbzyH5FFdOU9X+UyDOBmwS5FtHvvWIRGFRt9Xg66co1JuuO9oUvgcu/+Zq1zmKB/U0FbgKK3MD/G0flJoo5Zrptt0L0mcyanQHyBPgtA0CGJGXTUPDRD/j4F2vjuxeQSROqkRWZfU3cbeC35AfQVpUY6VHimWNrykrgdDD2742BEKE8Kud7WKYx+phMdQ6mQx4pJjU6Q3r/Fmi6vzYNlslx9o8Ufl/juVGkZsR7hYkpCRFe1oDhOBedYb+uIZvzOrzgTm7yeWG7EqUOdqugm4LZgGL53iqCcEHEsyyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIl0Ipdjud87YzyIJAGQ51WL7CQ3haeXFO79ONSMRyY=;
 b=rPNEkWivrJus1TIEbleNo93i3sktIjPUaL/lCmLCDG8agy5NKuLq82b6iR5Ok8wREb0I/FgVgTVVnKW8gNMxvoARNRURZRaggaZOgTUXetQ5OcpLZOHMRGr/kMqgIafpaXnlrVEhraq8owcK8t8vEiDHN3VGRTQ/Vm0SmeBDIL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 13:43:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Tue, 15 Jul 2025
 13:43:13 +0000
Message-ID: <d52b4d04-cb02-48d2-9042-b135a30f8a8e@amd.com>
Date: Tue, 15 Jul 2025 15:43:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.15 085/192] drm/gem: Acquire references on GEM handles
 for framebuffers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250715130814.854109770@linuxfoundation.org>
 <20250715130818.327986464@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250715130818.327986464@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4320:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8f94f4-77b1-423c-88bf-08ddc3a58b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEtFVjJwWTFNT3puTHNwUVN1bmsrbVEraGJ1WnFkbFl3N3hNQnlaS2I5akNq?=
 =?utf-8?B?RUpBZzc3UEZxR3Y3WWI5NEVtZHdPNnllVG93UVp2cFZFT2duejA1VFA2aWg4?=
 =?utf-8?B?TXhNUWFJVGNCQzkyVExZTWpJYkQzd0gyaDBwYUVnRnc0QWVrakxIYytlWEF3?=
 =?utf-8?B?SUJ5Szc0b0crUENMY01xTEw0cE8rZzVqcmlFYkRYdzFnT1UwZ2xYLzBHNUxM?=
 =?utf-8?B?dk5FUDRxSnlLUmJ6T0xoMmQ2Tkk1SXBzcFV2SFlQaHBaU3c5OHF5cXNreXBC?=
 =?utf-8?B?NVJBKzd4T3JEZ0JWYzRzMjRrNCtXWmVlYVpCR01xTUR6RE4zZ25hWlkybXF4?=
 =?utf-8?B?YnR2bmhOd2QvamZEeWRNcGJOR0krV09mYUVDOWw2alpkWS9NQmpMVE9CVWZF?=
 =?utf-8?B?Q2ZtbFRzam9IMWJqdXh4Y2JYQzNnYU0yK0ZpazJ1NWxFV3BkZ0FrNUw3dndO?=
 =?utf-8?B?VzhEYXZCcXZQM2dVOWZrcjlZZmtIY29HT1JxeE1lbzA1RE5zeXZLdjB0di9Y?=
 =?utf-8?B?cTE3YnBySkUzakROWmNIRmFaNndLMUZKNTBWSWl5U042eUVLTlYvcXFSTHg0?=
 =?utf-8?B?aXlVTmlhajY4TGN5Qkk1T3ozSmc2R1NBYkxGRzRTd3M1RW1qUTZTdmJjbXBv?=
 =?utf-8?B?TktQRlF0ck83aWZYeTQ0NnhBOVlVWWNYYmZLeWFiWFhYMWQxVVkvNlhGSVln?=
 =?utf-8?B?dGZWUmlDcDhqMHVTUHhLTkNsNnc3RGJMbmswWDl2UE90RTUxQjFYYTdjQTlD?=
 =?utf-8?B?KzZYeXk2MmJ1OVdhRWp6SVovQlpXaHRJdWxLSlJnMG00em1yMWVsYVZpWFJw?=
 =?utf-8?B?WGhCYkNxbWJ5ZE01OG5IZXE0Qjl0ZVlRWlMvUmdGOFJOUGRJWGdtSnpCSzN5?=
 =?utf-8?B?NnB2YVV5TkhPdlhON2lTNUdyZmFONUQwL0krcmdoTm5PYVJIY3N6UndyUnlm?=
 =?utf-8?B?MVNFTGhHdHNONjIxb05QT3dHeE9INlhpb2RFaVVVNm5jWERONWJ1VVpUWEYz?=
 =?utf-8?B?dGQ0TmtwMWNNSVQrdU5nTUFsc252c0syTjVnOTVaMW9iUnhQT3RoZGU2MVRY?=
 =?utf-8?B?akJvOVJZL2krQVpONnRmZmJRVTVMRE5uU0h1eHFZc2ZtSkk1MTBVK0twbDBS?=
 =?utf-8?B?V3NWSytnTDd4QTBpN3drUGU3Zzc3ZnNEalc2bnpkcXBBR25udDZHL0duSU05?=
 =?utf-8?B?dFhBNkVTR1Fab09GNFo1WWlkZlFMbzVEUGszMHJ6MllnbW03N0daM2VqaE1J?=
 =?utf-8?B?S1BsTXk4a3dvM2pmdjV1Z3FrWHBoV1pJNmJ2RVhZOFB6ZnpTQUdMei9lZmdu?=
 =?utf-8?B?ZE1GTGFWSFpRNFdLUllMdS82UGpiK2J3R3VNVXRqNHFVZ1N4RFdxQ3lzZWpo?=
 =?utf-8?B?QXRhOXRoa1huWXFRUWRKTXkrTm93V212NFdzUWE4WEh6eDI2MWF0L2VBRVQx?=
 =?utf-8?B?R2wvcnJGY2R6NXN0WDU0M2duTmpQa0JwWXNSY3I0cEVINCtBVVBMbzlwQ1Bo?=
 =?utf-8?B?WENvcWh6bjNocmNnVE9QdFdqV0dmdk9xc09HVDc5Uyt1TndlNktGWC9OWmVp?=
 =?utf-8?B?ZWNiRGJHS080aFJNejBPRnBSb0k2bnBOaGFoNzRuU0YrUzREU2xNQ3FxTUhn?=
 =?utf-8?B?OEV0WkRLT0RQbjEvdCtwVFVuZnF2MUNGQ2Z4V3lBRXphRXp2RmVoZFVxeS92?=
 =?utf-8?B?OHovSXY2MlZsekhSaks5am0ySHNINHpVT28vLzhrYlNSY1h5SE1uT3NCMU1p?=
 =?utf-8?B?d1ZzdVpidmhobGw3N293NFlsWFR4V29kMytxd3JMdkx6cnJUN0k0aDF2eXhr?=
 =?utf-8?Q?ruOBG2mrilhRnUYG0/OyIMhUOjpJlzoM7gX/k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1Zidmo4a0ZObDNsQkdFWnBpQmpKSHBLeDlmdTJjcmtrbUs0TVB1Und3bnNT?=
 =?utf-8?B?dGpWYXNjMFgyTVVjWDh1TkRVWUUwZFhnQWxyamhKbnJQS21yZ0t5M1VaSldU?=
 =?utf-8?B?bktZL0VLN1o1VG5icGRhRC80WThvMjg0a0VkWkR5V1lmcSsybkZIYWxGMVFp?=
 =?utf-8?B?VlgxYnpReDAwNXhqSVY3YmsrRkU0Zk1teFMwQnZmRkQ2ai9pOTd2Yk1xUzhR?=
 =?utf-8?B?UWdzUGgxLzVJSjNYbHgybGlLZ3djbmxvL3Z4NjJwSndObmNrY25Dc21BL0ZR?=
 =?utf-8?B?cTR0a29EV095cUxINWs0WlhuZlVhUHFGelczV1NYYy9SUGpYelZMam9OZ01o?=
 =?utf-8?B?aGNsdzRZaHQ2ZTRmOWZkMDUxREhKOU9BNFZ2emhuTlNFNklHSjFLbkxNQita?=
 =?utf-8?B?elcxalMwZVVwQ0RLUGVTUXF1VS8yOTFCNDJVa3JCZHZrU3F3Q3RyVDZsdlRl?=
 =?utf-8?B?cFd4YXdFbTU2TWIrdzlqdmk0QksvVzBHQ1ZsQjloOEhsL1JIaU5GeTE0MnJq?=
 =?utf-8?B?SUljQk1RbCtreFgrTXgrY2dvaGh6NVdoRVg3WWR2aGlWNFhZVGlIVEZETjkr?=
 =?utf-8?B?TlNOV09xc3hlR0MvMFJtVWlZdTcxbG4yOVA1Y1dzMjRFQk9iMW9DS2VVa2R2?=
 =?utf-8?B?c2pSWTU1UnoySDByMU5MbTN2Y01TWnNhOTBIZkRtRnJkdExWTWNzVmF1S1NV?=
 =?utf-8?B?Wnpxdjh4NHcxRHJnZm9RUGJpS3BOWDNTM2tWMzIxUStQNlRpL3RJRUdoa0gv?=
 =?utf-8?B?YWM3VnRQeWE1cit5ZkJLVXNZQlVPNkVuTG5jUE9hNTd5MCtNa1RMYXdMKzhR?=
 =?utf-8?B?STVVdmVZcUV4TWNnRkxraVk2STN2dFEwRGVidVArRDZoRHNiRGZJYnZzMzcy?=
 =?utf-8?B?VzV0T08za2hFSDBkVGZaekJPL21mQkM5ekFGbjk1aVRZM1JxVHR4d09sR2VQ?=
 =?utf-8?B?Sm9qS3VTbStINTZYa3lsUzFKd3U0d2xzczhMU1BDTnVKTDBIOUJ6UGlMMHpB?=
 =?utf-8?B?WnV4UTlERFBwN1ZGVmgvcDJub01RN0hEQTdGcWlRa0krRytNc0QydGZwRFhz?=
 =?utf-8?B?UjgzTkd4UHBiZHpDaVppN0RPZTJTaFY3NWthV0RTUmZZVnZZbnJSMWZVSDZU?=
 =?utf-8?B?ME8vOStoL3RtR0l4SWdFVzQxY1ptY0ZKL29pWC93SVg2SGFMQWxZQ1FsYWt0?=
 =?utf-8?B?UHZPZnNNUXlNaEUra1FMN0tIN2ZGS3hIQzhLajUrTkNnVGhTeGVtbEFZSkVv?=
 =?utf-8?B?U2ZWd1BzYXY2OWx5Q1loMEsyUnY4NXQrQVJIakYxSm9jSU5GOC9XOStmaVly?=
 =?utf-8?B?R2RXaVFWWmpocjZ0OGZJVDFncWhzTWs5N0tEYWlUZEZIclJCR3lkc2FFd0N1?=
 =?utf-8?B?WkxmZ2xrZTBqSmhhNmkzbzA0MHBqRGo0UjJ1RldjdFdmMVhQK0hocC9JZ05u?=
 =?utf-8?B?VTUyVkhHVHdoc1pWSkdVajExcHFvOHVUMWJxRzYyalh4OTEzOWJsdWR1U3RY?=
 =?utf-8?B?WlJMckJaV2o2bjBMV1N2dE45NUFHR1RuZStvYzA4bmpMOFdQc3o4ci9DVGxT?=
 =?utf-8?B?bWRxWlhGWjc2aGNuUjJFbFc0dDIzelpCK3JWQ01wS2hGUGMxY1l6K1JaYWNH?=
 =?utf-8?B?OG5BdFphaVYzVFVYS3U5M25oUENOMDZ5MHJBdHBUcUNXbjF0TlE0VlplMlJt?=
 =?utf-8?B?MGY0T0hyVHd4bTNTeW9jZmY4cWUyRFN0a2FFVTJSNHlhWGsvQ1BJMitqTjRB?=
 =?utf-8?B?SHRGd1lTSUhTSmZTK3V2dGdITDNqUU15RENncnZTcFlXNDBhdTk2L3lLbVRM?=
 =?utf-8?B?c2hOUm5SVUdKZThySnpIeVAzb1pvVFI0VlhITTUxdjVXWitlUm42dzBzQlhZ?=
 =?utf-8?B?K01HTUdjSkRTYnBGTUhwNDlDM2dJK2ZkZlp5ZksxQUpqK2N2Z2Z5OHVuaVRC?=
 =?utf-8?B?VVF5RERNRlhvbzltRlBwVWh2dXFxZksxbThPWEJ5RGVEZW0rMjRWZGtaZTFD?=
 =?utf-8?B?SzZXQzJlMVNlR2cxck4zVjF0SllEei9DcytaNm41cDNoUXpqVEc0NHg0RUJM?=
 =?utf-8?B?RUI2aklvYkR4TkZBS3RpWjJWTURGaENONk1GQW1qK3JJWHJZMHMxcWs1VE15?=
 =?utf-8?Q?ipe6RoWqX6pJpmmhlFcGs4mzI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8f94f4-77b1-423c-88bf-08ddc3a58b68
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 13:43:13.3664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHwIKl0TOOmVhVP/Magzevx48G4gElPyRbKX4vLrqFgMa4dvheHlqNYretiMHshQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320
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

We are about to revert this patch. Not sure if backporting it makes sense at the moment.

Regards,
Christian.

On 15.07.25 15:13, Greg Kroah-Hartman wrote:
> 6.15-stable review patch.  If anyone has any objections, please let me know.
> 
> ------------------
> 
> From: Thomas Zimmermann <tzimmermann@suse.de>
> 
> commit 5307dce878d4126e1b375587318955bd019c3741 upstream.
> 
> A GEM handle can be released while the GEM buffer object is attached
> to a DRM framebuffer. This leads to the release of the dma-buf backing
> the buffer object, if any. [1] Trying to use the framebuffer in further
> mode-setting operations leads to a segmentation fault. Most easily
> happens with driver that use shadow planes for vmap-ing the dma-buf
> during a page flip. An example is shown below.
> 
> [  156.791968] ------------[ cut here ]------------
> [  156.796830] WARNING: CPU: 2 PID: 2255 at drivers/dma-buf/dma-buf.c:1527 dma_buf_vmap+0x224/0x430
> [...]
> [  156.942028] RIP: 0010:dma_buf_vmap+0x224/0x430
> [  157.043420] Call Trace:
> [  157.045898]  <TASK>
> [  157.048030]  ? show_trace_log_lvl+0x1af/0x2c0
> [  157.052436]  ? show_trace_log_lvl+0x1af/0x2c0
> [  157.056836]  ? show_trace_log_lvl+0x1af/0x2c0
> [  157.061253]  ? drm_gem_shmem_vmap+0x74/0x710
> [  157.065567]  ? dma_buf_vmap+0x224/0x430
> [  157.069446]  ? __warn.cold+0x58/0xe4
> [  157.073061]  ? dma_buf_vmap+0x224/0x430
> [  157.077111]  ? report_bug+0x1dd/0x390
> [  157.080842]  ? handle_bug+0x5e/0xa0
> [  157.084389]  ? exc_invalid_op+0x14/0x50
> [  157.088291]  ? asm_exc_invalid_op+0x16/0x20
> [  157.092548]  ? dma_buf_vmap+0x224/0x430
> [  157.096663]  ? dma_resv_get_singleton+0x6d/0x230
> [  157.101341]  ? __pfx_dma_buf_vmap+0x10/0x10
> [  157.105588]  ? __pfx_dma_resv_get_singleton+0x10/0x10
> [  157.110697]  drm_gem_shmem_vmap+0x74/0x710
> [  157.114866]  drm_gem_vmap+0xa9/0x1b0
> [  157.118763]  drm_gem_vmap_unlocked+0x46/0xa0
> [  157.123086]  drm_gem_fb_vmap+0xab/0x300
> [  157.126979]  drm_atomic_helper_prepare_planes.part.0+0x487/0xb10
> [  157.133032]  ? lockdep_init_map_type+0x19d/0x880
> [  157.137701]  drm_atomic_helper_commit+0x13d/0x2e0
> [  157.142671]  ? drm_atomic_nonblocking_commit+0xa0/0x180
> [  157.147988]  drm_mode_atomic_ioctl+0x766/0xe40
> [...]
> [  157.346424] ---[ end trace 0000000000000000 ]---
> 
> Acquiring GEM handles for the framebuffer's GEM buffer objects prevents
> this from happening. The framebuffer's cleanup later puts the handle
> references.
> 
> Commit 1a148af06000 ("drm/gem-shmem: Use dma_buf from GEM object
> instance") triggers the segmentation fault easily by using the dma-buf
> field more widely. The underlying issue with reference counting has
> been present before.
> 
> v2:
> - acquire the handle instead of the BO (Christian)
> - fix comment style (Christian)
> - drop the Fixes tag (Christian)
> - rename err_ gotos
> - add missing Link tag
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/drm_gem.c#L241 # [1]
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: <stable@vger.kernel.org>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Link: https://lore.kernel.org/r/20250630084001.293053-1-tzimmermann@suse.de
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/gpu/drm/drm_gem.c                    |   44 ++++++++++++++++++++++++---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c |   16 +++++----
>  drivers/gpu/drm/drm_internal.h               |    2 +
>  3 files changed, 51 insertions(+), 11 deletions(-)
> 
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -212,6 +212,35 @@ void drm_gem_private_object_fini(struct
>  }
>  EXPORT_SYMBOL(drm_gem_private_object_fini);
>  
> +static void drm_gem_object_handle_get(struct drm_gem_object *obj)
> +{
> +	struct drm_device *dev = obj->dev;
> +
> +	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
> +
> +	if (obj->handle_count++ == 0)
> +		drm_gem_object_get(obj);
> +}
> +
> +/**
> + * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
> + * @obj: GEM object
> + *
> + * Acquires a reference on the GEM buffer object's handle. Required
> + * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
> + * to release the reference.
> + */
> +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
> +{
> +	struct drm_device *dev = obj->dev;
> +
> +	guard(mutex)(&dev->object_name_lock);
> +
> +	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
> +	drm_gem_object_handle_get(obj);
> +}
> +EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
> +
>  /**
>   * drm_gem_object_handle_free - release resources bound to userspace handles
>   * @obj: GEM object to clean up.
> @@ -242,8 +271,14 @@ static void drm_gem_object_exported_dma_
>  	}
>  }
>  
> -static void
> -drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> +/**
> + * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
> + * @obj: GEM object
> + *
> + * Releases a reference on the GEM buffer object's handle. Possibly releases
> + * the GEM buffer object and associated dma-buf objects.
> + */
> +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  {
>  	struct drm_device *dev = obj->dev;
>  	bool final = false;
> @@ -268,6 +303,7 @@ drm_gem_object_handle_put_unlocked(struc
>  	if (final)
>  		drm_gem_object_put(obj);
>  }
> +EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>  
>  /*
>   * Called at device or object close to release the file's
> @@ -389,8 +425,8 @@ drm_gem_handle_create_tail(struct drm_fi
>  	int ret;
>  
>  	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
> -	if (obj->handle_count++ == 0)
> -		drm_gem_object_get(obj);
> +
> +	drm_gem_object_handle_get(obj);
>  
>  	/*
>  	 * Get the user-visible handle using idr.  Preload and perform
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -99,7 +99,7 @@ void drm_gem_fb_destroy(struct drm_frame
>  	unsigned int i;
>  
>  	for (i = 0; i < fb->format->num_planes; i++)
> -		drm_gem_object_put(fb->obj[i]);
> +		drm_gem_object_handle_put_unlocked(fb->obj[i]);
>  
>  	drm_framebuffer_cleanup(fb);
>  	kfree(fb);
> @@ -182,8 +182,10 @@ int drm_gem_fb_init_with_funcs(struct dr
>  		if (!objs[i]) {
>  			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>  			ret = -ENOENT;
> -			goto err_gem_object_put;
> +			goto err_gem_object_handle_put_unlocked;
>  		}
> +		drm_gem_object_handle_get_unlocked(objs[i]);
> +		drm_gem_object_put(objs[i]);
>  
>  		min_size = (height - 1) * mode_cmd->pitches[i]
>  			 + drm_format_info_min_pitch(info, i, width)
> @@ -193,22 +195,22 @@ int drm_gem_fb_init_with_funcs(struct dr
>  			drm_dbg_kms(dev,
>  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>  				    objs[i]->size, min_size, i);
> -			drm_gem_object_put(objs[i]);
> +			drm_gem_object_handle_put_unlocked(objs[i]);
>  			ret = -EINVAL;
> -			goto err_gem_object_put;
> +			goto err_gem_object_handle_put_unlocked;
>  		}
>  	}
>  
>  	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
>  	if (ret)
> -		goto err_gem_object_put;
> +		goto err_gem_object_handle_put_unlocked;
>  
>  	return 0;
>  
> -err_gem_object_put:
> +err_gem_object_handle_put_unlocked:
>  	while (i > 0) {
>  		--i;
> -		drm_gem_object_put(objs[i]);
> +		drm_gem_object_handle_put_unlocked(objs[i]);
>  	}
>  	return ret;
>  }
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -161,6 +161,8 @@ void drm_sysfs_lease_event(struct drm_de
>  
>  /* drm_gem.c */
>  int drm_gem_init(struct drm_device *dev);
> +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
> +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>  int drm_gem_handle_create_tail(struct drm_file *file_priv,
>  			       struct drm_gem_object *obj,
>  			       u32 *handlep);
> 
> 

