Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C65ABA3B76
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 14:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B4310EA58;
	Fri, 26 Sep 2025 12:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jGTWt1DZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012028.outbound.protection.outlook.com
 [40.93.195.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2294E10EA55;
 Fri, 26 Sep 2025 12:56:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x00A6W+r7Eyk+yTJoU7AUOG+WLYKhmOZ2H/hqtm+KRb6gwCEg31/U653QLocOzQbiy+h+HstnookImxlO6mVTZxWmJQm1BS/J+wFFHx3fK6ZFRO8bd0WifbeksOW2db9/ssiz/BUd8U6pXXS8WfulgMXilGCbEo/AsbDWpc0gfIgrq8g/wNKVgts+Bk5ZrLaCSQePvZ8R8rsXUVDY7MZohE76rnGiipqWqWbIgmqa+ZAYvoXiUMcKQ+RxusYeBok1kEp6ltvhfCrUV9jY3Rn44wOfc+p3OlSExyz2exinCsDS212dfP4QmScbYASmyx04R1zMJaPjO30Z1A1FVUp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/7VZvyKqAtuPBi3as9LBeqhRAvL5ZogWViEjC/sQKM=;
 b=G2s9/pFE/jsosmZ1WuOrcftPCDavBKEOw6P9WDmsSSDOOVu4mvHMonTO8L+Io4koPvzVGLcWboGrdIl/KQl4plYkRENYS0o5sZ7Bmh6oFcuwuTKDLH41xDFHcMhHaZZRHjTicV0gFQ5KThuJBmLQBHbB3dixbkzKLcxVPrjIFYvR7uSr3UaJlcx8/edTrTMO0J9RQsETZpNMYD+/5w+YsoMHzc1ShtBjyf6Wog/Aij5YP3KJCvJRugERNq5uln4XJvdWeSyb5NR7wI758eEpjSVkkpaUk+S93P6YfoPttYofU8sgqs+rI7aNY6bvxxW6xU1MTerzHFxfCs+PCtFK4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/7VZvyKqAtuPBi3as9LBeqhRAvL5ZogWViEjC/sQKM=;
 b=jGTWt1DZ8nOiNkQjOcHl8k/BT1s5/Dfcb42rkEwuUikcsXebpHW9NOE4+zsEuiFTpiIIyvze9Pjy8S7r/XbxJo6UNmN8DoTIbrijcZhm2iR1vl383klbjAoQWdvAtNmaRlGLNiH3vgS2kIMGvYLzc+v6jNt8HEjQiLmGUVX+71g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7928.namprd12.prod.outlook.com (2603:10b6:8:14c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 26 Sep
 2025 12:56:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 12:56:22 +0000
Message-ID: <472f27f0-2f54-45dd-b0a6-3a26b5eec301@amd.com>
Date: Fri, 26 Sep 2025 14:56:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] dma-buf: Add support for private interconnects
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Jason Gunthorpe <jgg@nvidia.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
 <20250926084624.2288-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250926084624.2288-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:c0::30) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0b918d-3e6e-4e36-3b43-08ddfcfc1838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXVrU3NhKzlwYmtnRnpUdElQbFJ1TXJxeGlvZDZTWG4vTStTVGVaaFN0VE9S?=
 =?utf-8?B?UVpTVFVxOWoxK0QzMW5HZ1FjQ3RLU0RwVk90OHpLZkovNnBFdjJmUzRKcGty?=
 =?utf-8?B?dnpzeUdPQUxaWTlPcHdlNzNQR1NQSlllTVFHVHp5OWVLbG4ycTE5TnNoRktE?=
 =?utf-8?B?bTJkZkp0T2lHVmJkNFJvWEE1azMxZGFOdlN4TjBuR0x5UHBVa0lUaXN4bHdu?=
 =?utf-8?B?L2MwVHZJSlNld3ArWXMvWlE0c3hQQWZkY000WVk2Tmd3WFhmZ3JVRE15Qk9t?=
 =?utf-8?B?cElMeWdobHZjOE00S0gwaWtyUGVtdHI2dmxXZkxTRXFTRnRUK3dzR1NnLzVO?=
 =?utf-8?B?WjJzOG52TGRrZ0MvUkJVY29GaWNSTW5qOE15SlJ0U2R6dERneW54VG5mYzRq?=
 =?utf-8?B?QlB0TTZ0bFZsL3g3dFJLS0FjVG1ETHZmZ2FDQTRFYUdXbkdzZjAzN2RERVVM?=
 =?utf-8?B?UUVVbFlLMlpBUEFaSUllWGluNWcrQmZ1RTJNQmNTa3NCQXUvOXhnOVUwQmZG?=
 =?utf-8?B?K0dFOENCREZkTDRsczJmWXRXeW1nVGpUM015RjM5OUozTmNQUStqNEhqd2RZ?=
 =?utf-8?B?RnpsS2lqc3FEb0h0TDMxa1hrNzVBeFRGUmQ1ODkwdVFxZ2dkd2xidkdUdGhL?=
 =?utf-8?B?T3U5L25QVHV6Z0ZhWkhlakI3MkJ4TVBEUjJzQ3c4MEthS1J4UVlFY3FsakpR?=
 =?utf-8?B?U0M5dk9FR0MvVmdEeWk0YloyU1lrSGpZN0lENHVyblA2YjhYRnViQmR1S21S?=
 =?utf-8?B?TmtFRXJvMHMyQ3VLT3QxcC9qQVRkc2ZtTk90Z0hDaGJoQ29oSlZVSUZHUlJm?=
 =?utf-8?B?MnkyNUJuYnhnY3pJZXhidUxCVVQwV3FqQjl2SE9TbitpSDJkKytqTityMzdx?=
 =?utf-8?B?b1ZPY01kUDB4WTBkbEtuN0R6SHVtYjIxanVPZWhodG1xOVpmNTBQMFNBL045?=
 =?utf-8?B?Y3hscHRlL1g4SlF5S1VmM00ra2ZPZXhVc1RVVWdZcHFBMDRqSjRXY3pHSFZj?=
 =?utf-8?B?MnBBa1p4azRra09kanMwWGhEaE1WMlJSU1JvY3dNMTN1YlNLQzJwVktVZjlr?=
 =?utf-8?B?OFA1bncxS1h5cmUveElBK0VGVmpNOGF5NEdzVlkzQ3pUZWovakoyeUlud2NC?=
 =?utf-8?B?OVlxK2p1VisxK3NxTUVoYnp3MzN2eVRBalR4Z0xlTnNld0h5NmpsQ1M2Nm41?=
 =?utf-8?B?YmpwMmFybkIwQVlrOEJoamF4WllsREpuc1E0Z245WGVyUzlVaWRTbWxTTWtj?=
 =?utf-8?B?WWhHUkN6czNIeFgrTGswak0xWjA5M2gyeDFVeDJQd1lTTTZhcDI1SE1GdmVy?=
 =?utf-8?B?N2N0VmZkajhDd0FHeDZNQVFKMnZKOXFIZXVmeTE2YUo1NjdTMjBKLzhJVis2?=
 =?utf-8?B?dWg0VjYyTGZwZU5ud1ZIcWR1cDZTTFRuVjBuN2pJTFlja01qNFZYODltUXJT?=
 =?utf-8?B?dU5LTWZETkVjZzl0eWxaUjlHNG9EdUtmU1doUks3VnpDQmU3NTRmK2RPekRr?=
 =?utf-8?B?ZW9GSUZsbzVmSFBQTzQ5VlFTSTZobVVSUXc3a20xY0FVdnF3TEhLSUZ2SEFu?=
 =?utf-8?B?eFV5c0pkTDRkb3ZtRUtEZXBZL0djMjF0ejMvZzU3Zlg0d3lLeXVIdlBaZVBR?=
 =?utf-8?B?dHhhVXVsaFc3ekpMeHA5eXVuSVlTdkNqL29NMnJDcXZ3bjVzQlZjaUpidndp?=
 =?utf-8?B?NXUxVXZhcFVRL01DYzAyMDJ1Y29Cd3ZlK3BobGU4d2dVVm4wSFZVK1F1VEsy?=
 =?utf-8?B?cVFrL20yMUJlSTVvMUE0QjZxbWFTNFFPZGJOaHdVTHJNNmIxckFjT2NXaEww?=
 =?utf-8?B?aXFmYnBGQmFDQS9uOFFja1lZb3ZxLytTZmJRY3pDRDdvWUQwZVBncGl5VzRC?=
 =?utf-8?B?aDZOdTk1bmp2VlJONlFuRGU0S3kzRlNPMGp4U1dYbnRtUFNPc0RRM2txcjd1?=
 =?utf-8?Q?ooP+5iI0JuNbX8IC9X6UFUmhznvQi5Y5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWg0Z1oxR3FkNnRLRC9oMVRLaWRUelVuVGZhdTk4Y0xpWjhnM2xnb0ZLa0hJ?=
 =?utf-8?B?SXdEQ29rMGh2bW5YOWIzT251M1M1ODRVdFRaWWNwei9tcHhUUGlkaXRSU2RS?=
 =?utf-8?B?bXdkMWNydWh0NVhzNGtCZU51QUVGSGhaUUYxdG82ODFOSVpOcFlaRmNiK3hl?=
 =?utf-8?B?cG1aWmhabFBlTUpyaXpZbHN3OTlaSmZJOW0zczcxLzJFdlQxR2FMTm9hNWpZ?=
 =?utf-8?B?NzUwYllIdzZOSGUvK21BWGUwRElJaUlqTVh4VEYyNUZmaXFyUnFrVzZRelRo?=
 =?utf-8?B?Ym5XZzZhTFladEdKQnVGL0JRSytmYjV5VXVUYlJ1QmVlL0VlamREczRQRzcy?=
 =?utf-8?B?VldHU2ZKeGtTaXZmVDIwTGhoN002eDBDUklnWk1pSEJVdjEyMlFaOElvcFQw?=
 =?utf-8?B?Skx1QlZaV0x4UVg0SjlodGV2NmxubjFTOUNoaDBuemhJbS9uZDNrdGVWOXBo?=
 =?utf-8?B?a2NMS0doNlZuY0NEL2ptdnF6RTBYODRVU3R5c1lDWW1YajV1QzNscnprMTFM?=
 =?utf-8?B?cm5Tb0pQMmt4cHdSN0tGdTl2ditUZW1yaFl3MFJGLzByTWJVdzhiZHVBR3Fw?=
 =?utf-8?B?elVQdGFxaWltSjlHTk5mN05XNG9UVi9KWnBBZWZFVWFxVjZpbkZCTUZpZ0dn?=
 =?utf-8?B?c3cvOGpmOXFNUHdBbjRmYy9tM2NGbGhtRmxUUXBEOU9zSlZuMmoycmx0Tlht?=
 =?utf-8?B?VHdod3NWSEhGdjR0eG9JenhBS1kyTlhGSHpzQzJXM1FVUVExdHFiRkRxRkQ2?=
 =?utf-8?B?RVMybzA1bEdZNkNGU0JIbmJNQ1JBam1JaVhSaTJNZ1lZdlNvQ3pRU0xLRjJY?=
 =?utf-8?B?SVdvUEU1RzRudTRTS3A4TXljMjRGT0wreXFud0pUelc5N0RiREtvbCtickox?=
 =?utf-8?B?YVBjaEtMVnN3MVRLam4vNHAvUDJxWXM4alNFai95NnUwc2xkeGU2NDk5ZGk0?=
 =?utf-8?B?c3Fhb3BXOFBZRU9seXVTck5QbFM0bHlhRkJaUDF3dm12SE42MFo2ck1XOUpI?=
 =?utf-8?B?SXpGbHFIcTl6b1RkQyszcUJIc2djd0ZYR3NRak5pWnFJMFFDdG8yRFMwcHY1?=
 =?utf-8?B?VFBqVzVxcG02ait6WS85Wkx2K0xjQXZqeU5NeVlyaGxnMWJBN1dpN3lhdGRn?=
 =?utf-8?B?VmpRL0trVnBWOFI5T0lLTWNRZ05vYm0ra3NDWElOV3ZKbXJiTThReE8vbldF?=
 =?utf-8?B?SlhFb2l3c2VHT3VTL0gwSlJzSDBQUUl4SEJEQ2h6dko2Mmo0Q0JIMmxnZjR5?=
 =?utf-8?B?Q1FqcGN6Ym1wUEZaZEFCWElSeG40SjVvRlNHdmRBTFFqeWFYV1R1dXQ2MDFj?=
 =?utf-8?B?OHFHZ0FVVGlCc0JjZXNRbGhLVVc3WVFITWJkT3d2M21CeTdEWk5SU3FRM00v?=
 =?utf-8?B?R2R0TEFrYW0raWxBaUdMMXdReWRrYzI0MnlNNTQ0dWhORW04dVpTSVNLM21T?=
 =?utf-8?B?LzJ0bEZrbVlWMzFhQ3lzNlpCV2Q0M3l1dG5ZWTZZMmIyNk5zWFBXRzI5elpQ?=
 =?utf-8?B?SkkyRnZoT1BydTViZEVUQTBMZXhjcDA2azhuREQyaE1YUld0T3o0WmlzRjkr?=
 =?utf-8?B?Qy9Tc0MyUG1Kb2lPTmlub2k3UGRRcDZ2Um5LdHY0UXNXQTl4alFSUG1YWWlM?=
 =?utf-8?B?V3QxWWZnWFBjY1BjS0xtNTRXTkFpc2o2Z3htbGlrWDh2MWx2aEFqQUdpRDVV?=
 =?utf-8?B?VFpRQU5JSkpxWlJiWE5BaHE0NmVKY2NhVkUxdXpreXVnZU5XY3RrRXR2TTRq?=
 =?utf-8?B?Q25nbm5nZ1Uzdmd4b2FKOXVlSS9UOS81azJKQWRyeDlmK2k5RHZCYklZbGg3?=
 =?utf-8?B?eFg4K3JFNERSZDZlQklOUDA3cnQzNm44Z3l4ck5NZ3hNSHA2OEExNHI5U0lI?=
 =?utf-8?B?Mzhka3BYYjRRWi82YmZrRWJldU5INGRZSk02UGRNa0RwTUpPcXVETi9kcE9D?=
 =?utf-8?B?b2pPTG5zeVBsaURjK3BhUm15Z0w4NUVsVWZlZHNrd2drM0lKOUxkTE5XTTFD?=
 =?utf-8?B?eTZRakYxWW9VV1dGc1g4ZkdpYWpEcDFNVlZkSEdOYnJhbVVwMUdzc3FndXJU?=
 =?utf-8?B?NjYxZlo0MVdGVkFFZk5iQnRxQVJKWnYxOTJZMUoyNlcxZ2FyWWFPWW45RE5D?=
 =?utf-8?Q?YFVa5KnBQfV1X63rLKVckIFLA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0b918d-3e6e-4e36-3b43-08ddfcfc1838
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 12:56:22.6586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZXuMmqxpXQGKFmRqH7JDVYXEQv0i6YHQpHvV14tJutHeih5t7ILABfahLtM0ZvS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7928
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



On 26.09.25 10:46, Thomas Hellström wrote:
> Add a function to the dma_buf_attach_ops to indicate whether the
> connection is a private interconnect. If so the function returns
> the address to an interconnect-defined structure that can be
> used for further negotiating.
> 
> Also add a field to the dma_buf_attachment that indicates whether
> a private interconnect is used by the attachment.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  include/linux/dma-buf.h | 51 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index d58e329ac0e7..25dbf1fea09a 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -442,6 +442,39 @@ struct dma_buf {
>  #endif
>  };
>  
> +/* RFC: Separate header for the interconnect defines? */
> +
> +/**
> + * struct dma_buf_interconnect - Private interconnect
> + * @name: The name of the interconnect
> + */
> +struct dma_buf_interconnect {
> +	const char *name;
> +};
> +
> +/**
> + * struct dma_buf_interconnect_attach_ops - Interconnect attach ops base-class
> + *
> + * Declared for type-safety. Interconnect implementations should subclass to
> + * implement negotiation-specific ops.
> + */
> +struct dma_buf_interconnect_attach_ops {
> +};
> +
> +/**
> + * struct dma_buf_interconnect_attach - Interconnect state
> + * @interconnect: The struct dma_buf_interconnect identifying the interconnect
> + *
> + * Interconnect implementations subclass as needed for attachment state
> + * that can't be stored elsewhere. It could, for example, hold a pointer
> + * to a replacement of the sg-list after the attachment has been mapped.
> + * If no additional state is needed, an exporter could define a single
> + * static instance of this struct.
> + */
> +struct dma_buf_interconnect_attach {
> +	const struct dma_buf_interconnect *interconnect;
> +};
> +
>  /**
>   * struct dma_buf_attach_ops - importer operations for an attachment
>   *
> @@ -475,6 +508,21 @@ struct dma_buf_attach_ops {
>  	 * point to the new location of the DMA-buf.
>  	 */
>  	void (*move_notify)(struct dma_buf_attachment *attach);
> +
> +	/**
> +	 * @supports_interconnect: [optional] - Does the driver support a local interconnect?
> +	 *
> +	 * Does the importer support a private interconnect? The interconnect is
> +	 * identified using a unique address defined instantiated either by the driver
> +	 * if the interconnect is driver-private or globally
> +	 * (RFC added to the dma-buf-interconnect.c file) if cross-driver.
> +	 *
> +	 * Return: A pointer to the interconnect-private attach_ops structure if supported,
> +	 * %NULL otherwise.
> +	 */
> +	const struct dma_buf_interconnect_attach_ops *
> +	(*supports_interconnect)(struct dma_buf_attachment *attach,
> +				 const struct dma_buf_interconnect *interconnect);

This looks like it sits in the wrong structure. The dma_buf_attach_ops are the operations provided by the importer, e.g. move notification.

When we want to check if using an interconnect is possible we need to do that on the exporter, e.g. dma_buf_ops().

I think we should have an map_interconnect(connector type descriptor) that the importer can use to establish a mapping for itself.

Additional to that we need an unmap_interconnect() to let the exporter know that an importer doesn't need a specific mapping any more.

>  };
>  
>  /**
> @@ -484,6 +532,8 @@ struct dma_buf_attach_ops {
>   * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
>   * @peer2peer: true if the importer can handle peer resources without pages.
>   * @priv: exporter specific attachment data.
> + * @interconnect_attach: Private interconnect state for the connection if used,
> + * NULL otherwise.
>   * @importer_ops: importer operations for this attachment, if provided
>   * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
>   * @importer_priv: importer specific attachment data.
> @@ -503,6 +553,7 @@ struct dma_buf_attachment {
>  	struct list_head node;
>  	bool peer2peer;
>  	const struct dma_buf_attach_ops *importer_ops;
> +	struct dma_buf_interconnect_attach *interconnect_attach;

We already have an importer and an exporter private void *. Do we really need that?

Regards,
Christian.

>  	void *importer_priv;
>  	void *priv;
>  };

