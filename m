Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D5C5C97B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 11:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA11410EA41;
	Fri, 14 Nov 2025 10:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0IeQHNPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010063.outbound.protection.outlook.com
 [52.101.193.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D53010EA41;
 Fri, 14 Nov 2025 10:32:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpG/XgmaclBOmWogUxjRCREFo+3kdX1hosqogZSSR9Px5vDlPw+sbZ9ybo4hGiqtGDYg+gc3eMqAfegtdw1zEDVvfE2TK0+SXIBFNca3R88lbnFj18Hx9uGLNEgiAFo0CV+EfU+alMhaWrfGjfUSJx4Okq/BixdZ9hWo5GzuMAntYqN+bz0jsHCr+k1RT/LruyLQmyoDrKq/AVKNofCued5ibg9qo9HgmnoUjfmINFfB38PUF9iFgY81glvYUsQHvvM+wPLsVzz/j56l8o/hF6QDK7u8BQDHSG11n7PUxLyyB3oEJDVj7Ja1ozS7Zp8/6jEj40G79zmqJWKzfxu0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vA/4q13ShoRKDPnAbwin72wNKr/UpL+KhdCZGDsqFiE=;
 b=KicvrguyafnTI+7Hn1JuJZ9UGFw9rkr9zU3yWXr5LMM229LABprieZdZbHRxUIeZbCMgy4AeaQdCEJFjqMm3nSjPNfkcRNXvvL4NJ30sSibkytKWi7qFaxqrWFMqrsuwUxSQIIFpeOpmdkTIwH/qfbFNb4uIHZARWr3rZRSSm8F8T0yTyJ5sIfFStikfw/cl2bRySupNsbfuOzws0pr+/Z7R5DJvP8VtqC4QtiAIbRQzXO6Czj/n/97mWVX4DQZ/uvPBNUINumbVXKUkI2xXjCaHU3sS7aOhfVZoIacXQFBLdqPS7zEbbpLcTB/NBKOb5Si/sTGQz+6TTIi7dRwxFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vA/4q13ShoRKDPnAbwin72wNKr/UpL+KhdCZGDsqFiE=;
 b=0IeQHNPpbezt3L+AmF8W8cwtZOzwEC33n+Z97ckJ5IlBuwiQFZlifLNNp5A+QoPrL8qeiCOqDk++zEQXVyICqV0tqrsu4msxg+XflIMhhInJKy9QWJYSAzJLhRVYjvwcd0ivIDRqPOYLjONY4vGYkeyo1Za/Fbp71b2Fi656g3I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 10:32:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 10:32:39 +0000
Message-ID: <278c43d6-08b1-4a24-816d-390c885d9216@amd.com>
Date: Fri, 14 Nov 2025 11:32:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] PCI (& drm/amdgpu): BAR to be excluded depends on HW
 generation
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251114103053.13778-1-ilpo.jarvinen@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251114103053.13778-1-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0446.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4344:EE_
X-MS-Office365-Filtering-Correlation-Id: 47dc3384-cd61-4ad3-a264-08de236922ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0dML282SDVlVVdSaDhFam4vZmtoNjVoQ0hjeFV3aU96TmY1WGdGUmNUR3F3?=
 =?utf-8?B?SGpXYkQ1V1V3a3NKb1VsVHhBdGZUZ1pCVmM3ZXVtWnhKakprK0VtbHZxM3lT?=
 =?utf-8?B?dFFQdHJrLzZoWDBaYURxck9XTURnRE96MEIvdHlxVUhrY3hJTS96bkV0QVo2?=
 =?utf-8?B?V1JDaGE0VnEzakY0UW9CZDhleUR6enQvYzlVVmo3YUdKa0NwVGZxQ0RiejRp?=
 =?utf-8?B?a2xuaE1ycFB5a0dvRVpLMXRMR211S2FrL3FzeTNCb2Y3RXJUOE0xNU1yeDV3?=
 =?utf-8?B?b3Z5TkwwcTRWWEVMaDUyVjJzc2l4SzlBSHBJYUFJa3orc3JUZG5hZ0xGL3Rn?=
 =?utf-8?B?bHhJTUtOcG5YSDQ1SU9mREtVVHIxbFAyL25TazJrNjBzSEdxR1BDbTExUGZP?=
 =?utf-8?B?RU9qUkJRZm9BcjdQUFNlQWFIOC9odm9UdzloQVpkUTdBbDJOZzFwdXk5d3Jt?=
 =?utf-8?B?allLRS9LS09NYlZ3MzJjYmY4QUpxYXpGRGw2R0U0V0UrUUxINEYrMVR2Y0Ju?=
 =?utf-8?B?NktzTlpIVDM1SXZScDcvc3Q2WlhDY1BYYVFPV2ZiczBoSnIyeFdNMmh3L0Q4?=
 =?utf-8?B?bVVDTFZyTjRjdk5GR2ZUR0pjYkwxTUorVkNldE5LL280QUdnbjI2cGlnRjRU?=
 =?utf-8?B?QnBnUURVanFZYnVEVFNJZjlrTVJvYTNYUkh5M2hZeEtHcUdDTXNaTEZTNUw4?=
 =?utf-8?B?RkVHeGkxMjROcGhYbUFPdnZPcXVDaHljOUtEbkZCOE10NVRqbTV2NWxiY3Mr?=
 =?utf-8?B?NVc4Nm1YS0tvM1NQMlRtZ0hoRE82R3MxSzducGhwMzJGMFNqK2ZXRW8yUzRK?=
 =?utf-8?B?OVhscElVZGppVVIrUjk1bFhKQ2pBU3lHMDN0YnhwOGlSVytTZitFclNwam8r?=
 =?utf-8?B?V0NOd21leitTZ3FBbmsvWkVWSlFhU1YwRGdlNFpmUTFUdWtFNHJlMXB3Wksy?=
 =?utf-8?B?dENuUFhHdEFhWiswM0hNbVBoZGZWSHhzL3hiejU0MElubi9NRmFUUDNCTFA1?=
 =?utf-8?B?TG1MSjJtTDZraE5GelY3clhPM0VsdEttdVRTYTkzdUVjYmI0cUV0aVJYZTBY?=
 =?utf-8?B?K05IOFNoUDRBcDVYNUdvanNTdVhqclRPeDlWTTNwd09kcUY2U2ZWcEwvejMv?=
 =?utf-8?B?NTI5SWN1ZlFXaG5ZNk8vak5heXBnZ2xObVYyMnYvUlAvU0JrMmRGY05Vbzll?=
 =?utf-8?B?RGt4NmR4WVdlVTVZWXJ3K3hsUDJ0THFwRzQ0eldoTmJHMjF5YUhNc3BxdDRC?=
 =?utf-8?B?NHZMdFRpQzI2T1RYYWlqbStHekxrdWRTVnpJdVdCekpyL2p3ckVHMjdYbEhB?=
 =?utf-8?B?ckY1WlZyWWd3OTMyZytyQ3hsMXFlTlEwT05XV1MzQU9OODZPUmlOWExPUDIy?=
 =?utf-8?B?SzloMVhOTHFJVExYejMxYmVKWXRreHdWbTUzUTM5ZDYxOVE5V0FYc0hyQkVG?=
 =?utf-8?B?YWJERzlvWHRwVkxFUjZNbFIwMmRtdFdQcFZSM1cvWTVtRndtTHZkcVVoU1Bs?=
 =?utf-8?B?eEpULzZJRWcrTHVJcXIwSWFnQ3luSGVhNUlyUGIxenY3RWJJdkZIMUZ6ZVdM?=
 =?utf-8?B?UGNRRDlheDFwMlNvTEx4aVB4dzBPQ2hsR2lzRnhyektNNXpLeVdsd0YwYng0?=
 =?utf-8?B?b1BKRzB3TGdxaEV1NEZVQ1BtcFJxWFhKYUVzTCtKempOekdtQkZPMVYxNklY?=
 =?utf-8?B?dUsybkYrc20yS2ZYZmR3R1hnaG40L2lGUzhsY0xVdzdpRldoTlUvWkJzazRk?=
 =?utf-8?B?U1BGeXB3ajQ2OGVsS2xtcUZ3S3JlUEVWcWJhQ1JUWCtTWFR6N3hsQ2tMVG5Z?=
 =?utf-8?B?MjJISG5lUE45WG1hSHEzUHlVNFg2b1JaNi9CUzNGbFJHQXBkREpSZEVZY0Zr?=
 =?utf-8?B?RnppeGFwbXZzN1FmMzZQTFA4SVROTGsvdkRXd29SdE4xdzdHZ2JEVThQckdY?=
 =?utf-8?Q?fd8uciS4IdTA07/sIDPF4bZrC0gh8I01?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTRyMGluYlhMNkZ0Z1E0SEhtb0UzZysydE80S3FUNjFaQjF2bTdPbjF2cndE?=
 =?utf-8?B?MkcyRVkzR0Z2RXNrL1dGcmdUR0JFOGVaVkRGbnlRQnorUy85YXN0eHpINjJL?=
 =?utf-8?B?ZW9JMmdXems0eHlBRDlXU2gzdE5vc1FLa0hXV05acGVSSmNzRlI3M0VWZ3A1?=
 =?utf-8?B?dDNPQTJPUmFsOW5jbmJMTVI4RWRMMHNPTmp4WmFLSlpWdzRlRkFveTNQajNp?=
 =?utf-8?B?M2JvN2hUczFLVkNXYlVTemNUOHNpSHNyS0FxcU9YcVZ3VHAwU0Rram42MEsx?=
 =?utf-8?B?V2pJeHg2UTZkQXBtb2ZQOGRRQkxQWVYrdm1Ed0FBSFJuWTREMHlheWFMaHVi?=
 =?utf-8?B?anF0VDg0Q1hacExVNDRNVDI4aFlJWUp1a2hXWDFZYisyVUFvNzg2ZVhLUTU5?=
 =?utf-8?B?ejc2M0RLcmtnVlJJaEgyTUg1TklRNWY2TjYvSlUxSWZRYVBmR0hwK1RBcjVa?=
 =?utf-8?B?a3dYbEFNMm1kOW41YTRBMGUwVlhQRWk0NS9nN0NPSE1sa25uM3VaUVhMM29r?=
 =?utf-8?B?eEJoVEptbGtOMmFYaXI1aStPRGpDTkIxRXJNZUs3cUtkdGdTampZUGdtc1Jx?=
 =?utf-8?B?Tk5FWFNNRTJiNUttcG9OM29NL2FaMEZVQ0NWMkdXUnhSOWMzSmJ6RmtYWk1I?=
 =?utf-8?B?dmZDeElWaWxPdTdueEZYWFA2cDVpWVkvV1BWTTYra1k0M2J1SU82T1hFVERo?=
 =?utf-8?B?OGxiOEVTS2xWMklVbHBsdURMTjVjRGh3bVFPT1ZyeGJld2NLdXNXLzliZmFS?=
 =?utf-8?B?eTB6OHBMNlNVa0ZnNndiREdGejR0dmh4Tm5ZRVV3S2dWdG1aUmx1SmlvUmE4?=
 =?utf-8?B?VDlOL0NBbTVNNWlFcnhHNEx1TUVrT0FBa09FdDRnQ3EyVUhGZTJ5ZUZ6dWNU?=
 =?utf-8?B?TEF1WHFSNUNJZ3JsRU93Mm9Zc1JsQWRkU09MZEg4RlpraDBydlFORFlEVmlG?=
 =?utf-8?B?bHhPS3hCODJPbTdJMkFIOWFNYzR3a2JBK2liL0V6TDhjSTJOZGJ6TUx6QWZF?=
 =?utf-8?B?SGs3TnlVdDI1cE85WDZLTzkvRkJSTUJ2UHNqNGdJVWh6UXVNeE45QW1GYm9r?=
 =?utf-8?B?RWpibE94bklEV21BdjFNSjlMQlRHcW05bmZxUit1ZXhVRHdUYjNRRnJwSWpR?=
 =?utf-8?B?YlVGek1MVDZyVGZkN0NBWTRmMEZ0R1FJNnl4bDNCK1VQbGJPYWo1UytNYmw3?=
 =?utf-8?B?NFRsMnc2ZEd5bUdHRHpFMCtKMmdUZi9xbjYydnRlaWo3V0NCdUxsV2srNzFv?=
 =?utf-8?B?YWt1Ry9SZE1yS09ISkVMNzduaDFMbjl0WDNSVktqcXVkTGIxVkEvZXVsT3Ux?=
 =?utf-8?B?cFFQY1h6enpNRklrNERCNk94dVZDT1RrM2d5V2hmMEZnQjB0VjJpLzVRLzhK?=
 =?utf-8?B?STJjYXBSc0JNRk50aU0zc1pTYkQwUXRRVUZabUw3eEQ0QTVHbG9ZcEtuWGhz?=
 =?utf-8?B?YThDV090eVg0cFU5KzFDYlcxSEswdkFoQWFZNXF4eHZycnA3RnRoMWVJaEZo?=
 =?utf-8?B?T1FOQUpTN2RnbkZDRTQ4NElDSW8xenF6cVpzWk1oRVZmRHBOOGtLUnZyUFFw?=
 =?utf-8?B?aCt0ZHVubW1mU1h3V0xPZ0ZRd0libzdzU0F0RkIxdWFTZyt5RDJSbS83b0RK?=
 =?utf-8?B?VTRHdk45VlB4emJQa2M1MXdtV3NLZWNMOGZKRHlvcU03Q1hJRzVSSEZZY1pu?=
 =?utf-8?B?bk5pYkxlZTNUOWJKM3h0MTB4ZDJHT0NlMjF4S29KUmtZbGxKK0NyVmZhSFpw?=
 =?utf-8?B?VDVMSU1hK092ZHRxb25iRWViRGxFbEJTRTd6SFJ0cVMreFFka0dhMVZGQngr?=
 =?utf-8?B?a0ZCQWVLdG5DMXEwYWNRVFpNaHc3aGljZ3hhdngwS1ZacjF5T25VNnlaTXUv?=
 =?utf-8?B?TDdzQmVjM0NQM3M5Nlh2OXFEQ3hYNzA2Zko1aWtWWEhJRysxZkVHTnBXdUto?=
 =?utf-8?B?SGkxRWxRVUhJRTRsWjZHS2JHcURHblk4aXdVUk5SUW02RGhicXkzQ2RuVDVH?=
 =?utf-8?B?MlFRMnRMakdQUk5RVFVsWnE4UHdZQ2ViQmZXaTBkZ2RwYzVOWi9MWWJsZWwz?=
 =?utf-8?B?SGxETXZzRG1LK1VHNjNRSkYzUVhCSi9ZR2JhbWZZQitJQStZUFRKV0k4UXJN?=
 =?utf-8?Q?fSsp9O11C/vFVjoLQUCcStXSM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47dc3384-cd61-4ad3-a264-08de236922ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 10:32:39.6289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dDJFoejpOOlZ2P0v3BowTcp7cMu/iLWNUrN4+vvaPMaYsuWf7KI6ep3tWSCbmDq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4344
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

On 11/14/25 11:30, Ilpo Järvinen wrote:
> Depending on HW generation, BAR that needs to be excluded from
> pci_resize_resource() is either 2 or 5.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

If necessary feel free to add Acked-by: Christian König <christian.koenig@amd.com> to the amdgpu patch in this set as well.

Regards,
Christian.

> ---
> 
> This change should be be folded into the commit 73cd7ee85e78 ("PCI: Fix
> restoring BARs on BAR resize rollback path") in the pci/resource branch.
> 
> Also the changelog should be changed: "(BAR 5)" -> "(BAR 2 or 5)".
> 
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 4e241836ae68..bf0bc38e1c47 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1736,7 +1736,9 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>  
>  	pci_release_resource(adev->pdev, 0);
>  
> -	r = pci_resize_resource(adev->pdev, 0, rbar_size, 1 << 5);
> +	r = pci_resize_resource(adev->pdev, 0, rbar_size,
> +				(adev->asic_type >= CHIP_BONAIRE) ? 1 << 5
> +								  : 1 << 2);
>  	if (r == -ENOSPC)
>  		dev_info(adev->dev,
>  			 "Not enough PCI address space for a large BAR.");
> 
> base-commit: 73cd7ee85e788bc2541bfce2500e3587cf79f081

