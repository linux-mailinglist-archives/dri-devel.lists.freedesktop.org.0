Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E500A50392
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DDD10E7D6;
	Wed,  5 Mar 2025 15:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fAEDTMJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFB110E7D6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 15:38:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXKi9UKYri7lEWmoln9oFiKFI6IT6V1wjht7HAZU2q0+a9vqwVuKQbLSSvh698SP5sEKJb3X4AHuwI+Y/ND4KJSrENHQ34AEdoI1LUPn6GHfxjcC854mrWsPAvQZ4oIi74Finf7iZMMTqiaCmu3Dk+O2uTVePJspmapbLEmE3GCjbu0Oti1zelx2rdEgKBJTSAPF47ODT9sBw8tSO/C7NWQuNy7kMq8bY2+f95c4pkGvwamadEMIw08YpSKCXWM9O8mixMdS18OhGZZLS4UWXl6+eoloKJlCyIQjIGABqcRHxD6mBiffrVAuGY2Rlrp6al8UzVM0sAwJH+OQ9CTPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33Fwp0t8M78q32Df9v1Q6yfWy2PYGF5j1Urqnt/qd5s=;
 b=vg/j7h+/eVLCw41gExj01rOlwRFXh1y+Q+kZOwmnGEuluEN8S+WqlPD1bq4eGnpCBDr8OiCRDNnBrcn/xnXKRJg8VPZJ0OKuCTkjNXrNttRToebvm5jUXYCbsCLadTEGzTIYRDaVWgsfPsSD+GtsuaiYKoejK+/DJO3dA+hJIu5NPe3Mald1F8Z9uacgAz696W8mq0iqGRZs4QPDb0y97AqxBK5qIcpLdzr9RlRWvG31ZXPrHrV7qehvY/fsr0nI4Jl2Up0TtvhtXTCmSj5V2sYzpWVX2x66eqgxE3Z2a0ABLyPjWS3bFp9RTk+orQWsBItQyXzQvZGZv0d+bS9f/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33Fwp0t8M78q32Df9v1Q6yfWy2PYGF5j1Urqnt/qd5s=;
 b=fAEDTMJqCnARFC+GFDTqRXIvBgUTmSm85Z25cEwfLZisXlMATnQ6qsRvs9MyF/0FfPfDu311uci4vupAebI+AQJ3mhZlPmMUt86tNWNOF/s9veldYan0ygCWqH37k0yZ/72b1soBIDa+ba4IkhbC4kAe8BRRDh2frf1KmfR5rUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8820.namprd12.prod.outlook.com (2603:10b6:806:341::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Wed, 5 Mar
 2025 15:38:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 15:38:53 +0000
Message-ID: <f150286f-1609-4175-a431-ba5cad80717c@amd.com>
Date: Wed, 5 Mar 2025 16:38:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] drm: Hide import_attach from GEM code and helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 javierm@redhat.com, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org
References: <20250226172457.217725-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250226172457.217725-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7becb3-ff19-4b79-64dd-08dd5bfbd533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3JDZWkzdjF5WTVuYjlNbHFscUVQQStRMDJPZkgyNVFsdmIvQXJ0Y2RjcUFl?=
 =?utf-8?B?NDRmS21hSTducEU0VTJIMXB3NEZkODluaGtkVUlVQy9DU3BCU09HVWNXYjdi?=
 =?utf-8?B?UWg3NFZSM0I0SUJIaWVZbG1ROVRVQ1d0ZzZTajVGRytxWWNqc1lVR1ZmdWF2?=
 =?utf-8?B?L09tLzIyeWw5RFpyWjVGWndzVlZNbmJGUFpUc1UweHM0V3VVQXZGMzZSVkQ5?=
 =?utf-8?B?RTVGUnU0ZWpWY0ZsaTY0VVhXK2lkS0tEK1hMQThaemUvTlJORWUzb081QWNB?=
 =?utf-8?B?Mk1xYXlNSHBIRGVOaTJGWVFMSzF6S1ZVSGUrd1pOYUpiUXovRFhNeGR1K0Mx?=
 =?utf-8?B?Tk9TYStiUmZPTFFpYnpRUEZTWkpINGpjaXdKK1JiUHB1UnlSNkJJOC9hNWQv?=
 =?utf-8?B?NGFmbnlKVmpFaFFrc3Ayd1l4U1VXL3VkNXoxaDErcHpJVTl3bDBVQkxvYXg3?=
 =?utf-8?B?ZFo0UmlTOVNhY0NXMUM0WXFZQ1lwN0R3dldOTlhaNGIrZ1JyaTh3MUd4Mi9v?=
 =?utf-8?B?S01vMmpPMitxTTF0RlNScWhWdTBPTzM2elI0S3UyVm5BVGJtaW1saVBVdnRp?=
 =?utf-8?B?MlVqdFhSQ1BjcURNRWJWNzVsbTAvWnpVMldLMFN3ZlF0d21pUDg0QVR6ZVZr?=
 =?utf-8?B?Tm5YVHBnUU1iclBIQWJpUGM2dDQ5RURRKzVVSzRvMGp2d2FvdzhCZkN2RXF0?=
 =?utf-8?B?ZkJseit1NVE3QWVSc043MUdBcDV2NStGTUtCekRxZk5wWWh4TWdwYitJakkw?=
 =?utf-8?B?a3JRWEQ4L0o0bCtWV3JROCtzSFBQMVo3MU1TMXM0dVFPOFo5WHQxOHJHZ2p0?=
 =?utf-8?B?aGd4SVpDN3FOdC94cm1SaUFUZzE3Ry9BVmhPeXNwYk1walA1M1I5WVcrTjg0?=
 =?utf-8?B?TzFhaEVyc1p6eHozajFuWnN1WGk1YjBqM0g2VUpTdUhtZ0M1Mzk4NjdpOC9M?=
 =?utf-8?B?cG03aGY0aEQyWklrYUF1dytZUU91OFM3MU1qU1M0QUVNWElobm00bFNST0pI?=
 =?utf-8?B?WjFFOXpYc0o2OHNpZmV6ZHVwL0IvZ0JhTTJYOWdaOC84MGxwNEFFQUVWVHJk?=
 =?utf-8?B?SmkvNGdiUVAxMDcvOGQ5V2xhckZsM25TbVF5WHJxZndyRSt6NmxOVlI3TlFS?=
 =?utf-8?B?aFdwZGt3RHVyeGRySmFmOVVFY3cvK04vM28yUHRhazAzMlVPaHQ0YWQ5Z0lC?=
 =?utf-8?B?d2ZYMDlET1IvaGVEZVZVbUoxWktDNjYwNXd6THRyR0hOcmlrNzk4TDVSQUNk?=
 =?utf-8?B?S2p2Q21rbTlmUzFNdUxwTVUrOTdNUGpWY0FrbkVoV3h4OVVPVlVlSUtzdHdU?=
 =?utf-8?B?UDlZWXZqVGN6R3RMZitrVGpzdnFYL0RCdDhmVHN3VWFmVEF5L3VIYWduRmZ1?=
 =?utf-8?B?SkJMSHZzcnora0hGVHFFbytqR0hwbUx0VWhqekk2Z2NkdFdPY3Zkd2JHclB3?=
 =?utf-8?B?Q2JTZi9PODczcVUwZ1haTzN4bnozakNtNTM5cmhScERpQUFwQ1VlR3V4eE9w?=
 =?utf-8?B?cmtXdWJxL2Z3NzhuZXFaK2h0UlJ0d3ZLMFZxVE1QanhCQUIycGFLOGlTeTdk?=
 =?utf-8?B?VGhQQ1FPUEJEalYwNUhaNWFwcGgwemlSbDJXR3NrYXNqOGo1TnRTeDcyMEJ5?=
 =?utf-8?B?YlVaV3RlSzNGbE5kMG45a3N1aWhQaTBVdUJjZ1JpbDFqcnJWcWZoaU5rUnBN?=
 =?utf-8?B?RS9iMExwQ09reE9jRCt2ZUdEUUdIQURtMytFM1F2MytMUStUd0JIUitWUDMw?=
 =?utf-8?B?Ri8yZXNpOE00UjM2ZFRBd3B1Zlc5OXg5VE0veFNMZFBVMUdpekhyZHUxa2V4?=
 =?utf-8?B?SFN3eENMOG9ZdkpCNGdJYSt0SjZMZEp3Q3VSWWdMdFBmYTYwd0I5cFVvc0Fo?=
 =?utf-8?Q?6p5h/eAG+3pw+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFltZWk2eEZrV2N3U1dsSERSaFRmazE3SjhValNDM3BGWUJHcHEzNGpmMTZU?=
 =?utf-8?B?TWJaZFM5RUpIc3pnMm9lV3ZmeFgrWWpCMzdBZS9mWk5iYkFVelV5WFhvTTZI?=
 =?utf-8?B?WUtENE5sSWZJdGhlMGZSNFNXQTQ0OVBOQ0hBaTVqQ29ra2tnckJ5UmM3QnVu?=
 =?utf-8?B?N1ZXNkVGbFhVYVdNQnYwdWtGd2FWWEl2UXFSSlZraXBkdEJleHZ2RStSTm9P?=
 =?utf-8?B?NGc0MWtGMG1sTEJsejlueHB6dUV1NWw3TkZSL1pTNi8wTGlqb25iOTdSMmd1?=
 =?utf-8?B?cXE3Mjg0cEhpcENMbHhTdlVXOXV6bGJ1WDVWNjVLNUxweHNsK216azNiY2hQ?=
 =?utf-8?B?Z1ZCZ3d3SVpsdnZxR3NQa25pQzVjbXJiNlRxQ2JDQVRPTzlmZktDd1EvRVY2?=
 =?utf-8?B?SldKMjRFN0xYRmJ4MEozd1c5UElFazkrRWpYUjBDUW1helM2UDAxNXgwdlA1?=
 =?utf-8?B?WHFaWDMyU2FZMURyODB2a3pXVDhmVFdleGdLOGUzTnl0VjlKKzdkdC85eC9L?=
 =?utf-8?B?eDR2dGQzbWMwQ294aXZLeHBBOEF3VHRkN012SjE3RTlRbnl4ZFBiL2VWdTdx?=
 =?utf-8?B?K1pxYVhDbndwanI1MmVqbEtCYytxYng1ZGNzdElaVGRQRWpOdklndnlIcDF3?=
 =?utf-8?B?QVpVRjYvekh6azNXTC81VXlTNytBaUtrS0pTVk1iVDZiSkxmRG5IMFByU1I5?=
 =?utf-8?B?aS95ckNmL25pb1JsRllXODRFZVFSQkk4NmhsMUt6d0M5RkhGUTdWMjI0eXUx?=
 =?utf-8?B?akFVRE5aRTNOMFV5bVR6NjNJSDdoSjZBNDRMcEJBc1piTThWRzhpMElqM1pl?=
 =?utf-8?B?Z1ZJSm1PRnEvNzJTWmlyNXJTSXBjQkJCSGNyZ3RiV2JJSFBUWnoyM1lHYnJq?=
 =?utf-8?B?QzFiWWJ0MWc0Rmd2MlVwNDZyRXBuWEFBMGdScm5jc216djRLS0s1K3BhRzds?=
 =?utf-8?B?a3VlYVBGM0tEbmFwWlVGM1RYam1ocnRkbkRsUlNST3RpdkdaUWhoUElaWXpP?=
 =?utf-8?B?a3l6YVRhQy9mSzZ1ekxIR1IrT0RmTE5zaFBkUFdoRUswSGllZE9IZDF2VFFL?=
 =?utf-8?B?NVRlU3U0TFBwUzdtbmhybFd5SUNhY1JQZUx5MW5sWXZhc0U1bHd0by8zZzZC?=
 =?utf-8?B?NDdjMno2clNranp5YnE0a29yNVJDNDUvRVR5UGhpbC9DM0ZCUXJMdFJ0YXRt?=
 =?utf-8?B?ZHRVWmtWVjc4RURCbllOQ0ZTcktUaU12RlZ3YVlHWEFjR1Z4QTRuYmI5NmM4?=
 =?utf-8?B?Z3hvdThHOC9DVjBvaGhBUTVVTkxTd1hERHdBdUt2MnBWd3NUdUtwSUlSODRY?=
 =?utf-8?B?UXZoa1BhNG9GYTd0NlRNVVhmZ1ZzVzRReTZpU2ZIbnJrN29TTVFVR2dvVEhO?=
 =?utf-8?B?Ny9naW9VdEorcFFsY0FXL3VFQ1Z1QzdvVTNKa2gybURSWEZUWmpIaXMrdnh6?=
 =?utf-8?B?MTdZbnBZczBJbnZaRWluclo4UWZ6WTFNdERob1A4ZEk2dVdDeUZNZWhwL0I5?=
 =?utf-8?B?Z2llWCtqSHF2YW5QU0hZRCtRL2UzWXVKTHdMcjQ1ejhObm9XZ3VaWjlqT1Js?=
 =?utf-8?B?SmVlbS9nZlpUbjk5MGMxb1luMVBmQ2lWd0FhQ3VPTkR2bGxqWlU5WFRBS3ow?=
 =?utf-8?B?QlhqcTU3RkQvbUlCZTZkdm9Lc1JGYWVNZTBvbmlTODc0K2ZMbklQQ21Za3BH?=
 =?utf-8?B?TFJ0eUlycU80c2J4Ry8yOGxHNGV0ak1tbnV3YXd3NEZFclB4THVVUGNuWnI2?=
 =?utf-8?B?a3BzMHI5bzZRS0VuSFhLakVSOU9MYmZtSGM2R3FsU200OE9aRXphZDI5bEpT?=
 =?utf-8?B?eU8xSUNDUFFzMHBzc0NDRGluUEswVmFISkx0dmNuNnlhaUlBNWpPUHprenV6?=
 =?utf-8?B?R0xMTXEyNjlybFZqc3A3bkpSdFdhQ2g5VnBEUWphZDRnVGFmeUZiSFIvYU5Y?=
 =?utf-8?B?bkpuOHFpcDg5a2w5cFZna2hha0piZmxpeFUxL3hBNktTVlZUeFZiS3Q5VDVB?=
 =?utf-8?B?RG9jZTF3SjBIWnU1YVc2WlpIVTlRci9QeEJiMnhKSk5qRzhwdDNDQ2FzUnZK?=
 =?utf-8?B?YXBqMWp1ajRXMmFrbGVMUzhLeitFamxONHZFVnlUUSt5NGZRdTBFR0xMQng3?=
 =?utf-8?Q?j3wO4rwRpoobMtN8kyvkw9nzO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7becb3-ff19-4b79-64dd-08dd5bfbd533
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 15:38:53.0976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ik82M07vF2DGHhDXJ0lpQrWOyQc3jbm+oXckKGJD+A5kRUhVE5PPXbPpBX/oomgn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8820
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

Reviewed-by: Christian König <christian.koenig@amd.com> for the entire series.

Regards,
Christian.

Am 26.02.25 um 18:03 schrieb Thomas Zimmermann:
> Do not use struct drm_gem_object.import_attach unnecessarily. The
> field is set by the PRIME import helpers. GEM and other helpers use
> it for testing for imported dma-bufs and retrieving the respective
> dma-buf instance.
>
> Replace all tests for import_attach with the new GEM helper function
> drm_gem_is_imported(). The helper avoids import_attach in favor of
> testing the imported dma-buf's object against the provided GEM object.
>
> Also replace references to import_attach.dmabuf. The imported dma-buf
> is also available in the GEM object's dma_buf field.
>
> This series cleans up the GEM core and helpers. Drivers also use
> import_attach and should later be updated as well.
>
> There's a TODO item for making import_attach entirely optional. This
> series is a first step towards this goal.
>
> Thomas Zimmermann (10):
>   drm/gem: Test for imported GEM buffers with helper
>   drm/gem-dma: Test for imported buffers with drm_gem_is_imported()
>   drm/gem-dma: Use dma_buf from GEM object instance
>   drm/gem-shmem: Test for imported buffers with drm_gem_is_imported()
>   drm/gem-shmem: Use dma_buf from GEM object instance
>   drm/gem-framebuffer: Test for imported buffers with
>     drm_gem_is_imported()
>   drm/gem-framebuffer: Use dma_buf from GEM object instance
>   drm/fb-dma-helper: Test for imported buffers with
>     drm_gem_is_imported()
>   drm/mipi-dbi: Test for imported buffers with drm_gem_is_imported()
>   drm/prime: Use dma_buf from GEM object instance
>
>  drivers/gpu/drm/drm_fb_dma_helper.c          |  2 +-
>  drivers/gpu/drm/drm_gem.c                    |  4 +--
>  drivers/gpu/drm/drm_gem_dma_helper.c         |  4 +--
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 12 +++-----
>  drivers/gpu/drm/drm_gem_shmem_helper.c       | 30 ++++++++++----------
>  drivers/gpu/drm/drm_mipi_dbi.c               |  2 +-
>  drivers/gpu/drm/drm_prime.c                  |  8 +-----
>  include/drm/drm_gem.h                        | 14 +++++++++
>  include/drm/drm_gem_shmem_helper.h           |  2 +-
>  9 files changed, 41 insertions(+), 37 deletions(-)
>

