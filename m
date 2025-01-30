Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3DCA227B9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 03:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C786510E221;
	Thu, 30 Jan 2025 02:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WxGNGrZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E9D10E221;
 Thu, 30 Jan 2025 02:48:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rl+U1WyxMAzAnMEQDEUHyLfo+Xuoi/FmkbEL/wqH9RLlNzk0tb/aLLIWavd8lTtjTFk+dBxEd7Q8bVMpUGLzaIbp6ptwlzUGro99hxeLaogYB4OkhWRy1IgRnLqfzr7rLNSP/lJTVkVOrWafOW9VrnhAOJHpOZQOcdVdxrEzmstPd5FCJv3R7sJwY1FVQc6bXGL8Coz7j8NcPzczFCnb4I+ftVSdSmahugaR8Eb5u6zyOj1E2p0hCrAfEJWGf192y01Bs/mBWg+GvOEAU8NlwnkceX4Huy9HU6zodswefnXR6O7qcplEJ9AkapoieWeHScD5Lj+66NXo7Zk6LF41mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpCu1Wn8ImLAGJ2pUdPJebiHsyYlttjo2tVMfyJKbzE=;
 b=sFEXd1igaruWEGHzSsvCj8+/xnHLkypek/FqAf7qr3TzDYCu9VpJMwwqFxpznZ04fDWhRQz517JMGsM5oqty0hoNMEmCDyfMLTXDhrn7kvS8DFiBMI4e3XueNEgAI4cmM6rbswuUmZfjbY6EnuGZ3a8Fbj20gC/QHWG1CWRRh7xt4wwxkqoL6LWTBRyYBdhzwbJnKKplalEjmd3pU9d/yHNO5zIs0lNrrl8Q0BCy4daUU1a16UeN7k20zRXotC1IJlLqyYQv5V4FpE7FCSEBmhNAVicM8Hh6ICDTWzzItKgGO8Dbzz0HbNBCRAmHl9S46RB4qTR/Kf407eSNsxBnLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpCu1Wn8ImLAGJ2pUdPJebiHsyYlttjo2tVMfyJKbzE=;
 b=WxGNGrZUdtVeOAdwePsZ2QpJf5lMnnoTSbaKPVf7kvGDGcdvDQvN2akDzPAU4Mrvly2u9Kj3ktSn0z+gRuhWvM13BoMvkHTWdld7EiXC03Zt6Wo1rztRYLtPxEYguYJwaALJPqMrjc1Tevy+69F9bqvowvPU0S3S5Q6h8CnG2qo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 by DS7PR12MB6333.namprd12.prod.outlook.com (2603:10b6:8:96::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Thu, 30 Jan
 2025 02:48:38 +0000
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::25c8:f399:b2e8:1947]) by SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::25c8:f399:b2e8:1947%2]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 02:48:38 +0000
Message-ID: <7430d74c-9786-4412-bac5-0ef5dac5b730@amd.com>
Date: Wed, 29 Jan 2025 21:48:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/ttm: test private resv obj on release/destroy
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 James.Zhu@amd.com, Felix.Kuehling@amd.com, Philip.Yang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250129152849.15777-1-christian.koenig@amd.com>
Content-Language: en-US
From: James Zhu <jamesz@amd.com>
Organization: AMD RTG
In-Reply-To: <20250129152849.15777-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0178.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::7) To SJ0PR12MB6760.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6760:EE_|DS7PR12MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 5587bc73-d62d-4c0a-80a0-08dd40d8991e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHk5Wk1oUkdyNG1uV3hxL0s2bXd0MitxbjRJYmVrK1lCS3VBU0pBdmtUczE3?=
 =?utf-8?B?L2xWRmFaTzkzc05tUWRPcklycmdreDMvQW9hMHNJaFdUQWU4djY0eEVVN3F5?=
 =?utf-8?B?dmZnelM2Q2dUdE1Vc1lhWWlLem9JbXNFTVNBWXhvYkR1bUJ0NGt3TjNKYTJG?=
 =?utf-8?B?TXF4eDBTbXUxbmNOOXVncXJXb0FrV3hIWWU4VTFtemJrWjJCTHEzNFdrYzFZ?=
 =?utf-8?B?WDV4S3QrWFVaZmZoNU9aTC9hWXdnTVgvUG13WHNYQ2h4UlJFTGdodjJ4RWVV?=
 =?utf-8?B?UjM2TnF1K0FZL0hnVDlDRDFGRktzMTQ4RXREYjFSajV5TlFsOXVIaDZuL0hv?=
 =?utf-8?B?UENYY2ZHcktjVmhVenNQTTdXM1ZGUEdMRVhSVUpXS09RejhKQ3ZTdnhTK052?=
 =?utf-8?B?UFpLWXIzZ085VVh4YnlYZEJMNVNoN1dTSVBaTjdLbTZCU1pTVjhic2pFbkJV?=
 =?utf-8?B?VnFzM2hjNDA4M0ZJMGNsY0xzOGN3dnZoUHlPZHNKdXN3ZVlISEZPVFBib1BX?=
 =?utf-8?B?SEpocE9WblUydUVGUTVYYjN3Z0F3RnJ4cHFxL0tDNXJUOFRYN2RzWEV6TlZQ?=
 =?utf-8?B?ZmxKeXBMQ2dkdzVkdXlhN0NEOGlRWkR3Q3FremlkcTNrbUh4WmFna0lRM1pR?=
 =?utf-8?B?RlNGaEpnUitTZXFsNVRHK214R0NGY1JYVFFOcFdReTU0TGU1RlFzTWJJcmNS?=
 =?utf-8?B?aXFXSU54VzViTWo3bXVPTk9SUFZlZE93U1M0Z1NrbGRDTlZtVDVYQXo4YjZk?=
 =?utf-8?B?TE1WRWMyWlBTWkl5bE5CM2JyUTFKMGsyMDZtaFVUb2crVmFOVzlYaXVhT21L?=
 =?utf-8?B?SGlOc3RBeWVhS0JNalBIWXo1Q3VpUW9PMFZtTVU5eXN3dzduZjZCNG93Tk9v?=
 =?utf-8?B?S2JvaUZ0ZHMvdVFKT1dkWmxZY09LTG9Mbnh1aVBJNjNnVEJod0FGTkpmblV0?=
 =?utf-8?B?amlzQk4vaU1XdW1rcDk5MllkVktMZm9IRzRMNDFKYnNQTmVXYW1PTGJHMUpQ?=
 =?utf-8?B?SGhJaXlCSW5TQTNsMjExSVI0RUxYajkzdjArSi94SFh5SUJCSFUwNDduZlFq?=
 =?utf-8?B?Wmw2cFZTdXdZMDRFcmtWMXBCSmFUM0pHQmo0NFhJWk5yV0J1ejRFMFRiZ2hB?=
 =?utf-8?B?RHRWWnVZK04vZG1OemxFaDhkR3BxS0tJajRScmVLcnNkRVVrcDdHdno2K3pM?=
 =?utf-8?B?RS9CWnBWV0FrV0hVbDZMRmRRWUZhcGltU25uNkdYVFlHUGY4d0Mrdm1oYVEw?=
 =?utf-8?B?TS96bGE5SVRhYll1RDBDQVZMQmF6ajNQM0tjRTl6TDd1Q1g1eFZQcHc0M2RJ?=
 =?utf-8?B?SDRwL04yZFpUbzh6ZldwNXdBVllTVWt5TXgzVjBOUitIa0RVc2NxVmV5UTVD?=
 =?utf-8?B?S2lrTW1iZmtrTFV2WmRFdzhVTUpuRzJZVEdvV3NFaHd4RWlwSldvcXpsM0w3?=
 =?utf-8?B?ait3ZWxwMGE3TEd2VUtERE9qMjU3c2pDUG1CaGdYUEg5dk50ZlErNTRRYVND?=
 =?utf-8?B?RGxKc1dvQVZqSzJFYkY0bGlCQm0xUDhjWkZQZFZGa2RDN3VCeFFxdDNITlQr?=
 =?utf-8?B?UkFhV1ZDYXAxV1BNQ3JiNUxZL0lOTVVYMytEQzBjTFAwajJ3NVFDV2dyODhl?=
 =?utf-8?B?aUM1emxZYkhhZXlSTFJtQ3dFeDliTG8wRTBjRjVPMzRSTjc4aDRobVdCbE4y?=
 =?utf-8?B?ZmlJajFobTZESU9wN2swZ1RSSVFwdlo3S3AwWUtwa05tYkRjcy9Pc3NhR2ho?=
 =?utf-8?B?Q1JyOExWTjNrWlBydTkrcEJkcFR5VEo3eDVhQ2VCbythM1R3RUdRVXF1KzhE?=
 =?utf-8?B?M0gzWmRNOC9Uc0xpdUhwbXFyd1ZPN1A3UFZKUGt1SExoK0RKNjIyTmFxSnVL?=
 =?utf-8?Q?5ue4RDkEiQ7Da?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OElkMWRYTXdSeDZpTE9mK0Y4YmtkTnI2OWo0aVlpa0ZQOWF0bGg2Q0ZNMWNP?=
 =?utf-8?B?OWZoZm1FNG53ZHEwSnJXbnJjVHhKKy9LSDRuNTVGeHV6V2MxSHZzc1A3dGdr?=
 =?utf-8?B?N2hHZ0xQWnNQZlRuL3p5OEtKc2UwNUxWbjEycXAzRlZMeTIrc1N2M21HVmZ1?=
 =?utf-8?B?My9MVmxGc2tHSWg3RU0vNWQ2VGtJUFl4a0VOenZmcVllUzU1Zk96S1daZ3hR?=
 =?utf-8?B?KzRqdjhwOStlc3FzUHlPTmdmMEp5YW5Hak1zeUVCQUVQMWNUaG1oeWlFWVBI?=
 =?utf-8?B?OGNFdEVOSktrM0t1WVpTM3ZQSCtCb2Y4eFlQZS9PQlM2U3ZVd1BvUytvanBx?=
 =?utf-8?B?T2M3U3Z1K1FwYnB5NzE4OVhDb2JZbUVERGN0cDF6eEtKTzY0aTRaZ0l3WTIv?=
 =?utf-8?B?amJvaUtWd3FOYzFBb2d5b0RPTmJyZXV3aVN6dU5vQVA0VVJaRVlsYU1EQ0J3?=
 =?utf-8?B?cHczaWN4c0lORm5jWnIvTlMyUVVsUTRBSU1WYnkrVFF0c01rd2dZdzF2Vk1R?=
 =?utf-8?B?Q2tpdG43Qm5LYmxSYlJ3eUk1WVpadlVHa0lwdnc2RjdRVmhEUUhsT2IrSVZR?=
 =?utf-8?B?ay9nZ1hLSlVvaklQZWgxSjQ2cjJrQ3FFT2dIdVpublBrU203TUIvaTBoaEpt?=
 =?utf-8?B?ZzArdVk2SnR2N293a3J1dGF6VkludlM5SmswMWtWVURIK2JrcHdiUVQrZnpp?=
 =?utf-8?B?MHkzNVVwNm5sSk42NzFlQ00xenRpdEVwbldCNGpJY1N5M3dnZGxpK1oxNERs?=
 =?utf-8?B?RUJIaER5UmZhMHBLNk9MNkxaV2w0SjYzRGh1aXQzUnFlb2hyN3B1RHVyQ09D?=
 =?utf-8?B?SG9jUUlFd3U1SGlicXUyUGFFVnlQK2ZQUkc2REhVSzhpUWxSdmxqZEphUklF?=
 =?utf-8?B?ZUFNdW9PN0lpa0tIY3UvczM5QlkvMlp6WEpzanpZdkxTeUtxL1QvTE1JMFNw?=
 =?utf-8?B?dFM3Y09aOGgzVFFna0hFaU92QzJhZ3YxM0tyK1hzcy83MWFnNFRQdGU0THYv?=
 =?utf-8?B?QTdCMUczdzBZL2NrWlZEUEFiVkluVy93b21zNlorOXJuUFI5YnhMWUpxQmc1?=
 =?utf-8?B?YTdWVW1VTEpuUTkrbFpYOWhSTjdvcyt1Rk4ySzVOZGpxT0ZLaHgxOEttY2RC?=
 =?utf-8?B?azN3TTB6VllLUnlxYzU4MXhNcW1Bc1dKVHpCUml1Rmk2cmFROXl5MGhobXYv?=
 =?utf-8?B?cmprbXM5QWJlOVpCV2JRaXdJaU5UQ0ZieFZCT1FmV3U5YVQ2UWxjTDl2WGQ0?=
 =?utf-8?B?dkJzSkNSUDZ4Z3FKVWk4MURwNlA1RVhkQWtpS0ZhR0hhLy96UEw3K0ZQZEVL?=
 =?utf-8?B?aXBmZ0did29YSHZ4dHB0RUZST0ZXQm52SGlib2o0WkliQnQwWUl6NngyK2FZ?=
 =?utf-8?B?cGhhWkswVi9TYkhTVGFFMk1xa2lSMzJ1MXNYZlVsbnlUenZJalkvdXBPQnV6?=
 =?utf-8?B?NkFUZjU3UXNxbnJVYU9aZE1aMGsybGNZMlZUcjJhL0htOXUxS1FsN1FmdFV4?=
 =?utf-8?B?QkVHN3dtZlk2RWxRNzVqTEVMSlYxMHcrSWpiNU1LWWxWb3YxclVnTkM4a1dU?=
 =?utf-8?B?Z2tncnpFWThxeDRxQ214QjkwNFM5ZkoycFNGbW0zY2hLRDVuS1RGUldmbktp?=
 =?utf-8?B?RWRNaEQ3Wk9qOGJKRDZvKytzckFDWUtDKzRXb3F1b1hZeS9FN3pESm1MM0Ey?=
 =?utf-8?B?dnlrNnJMdXZkeVVhOCtvSWpzazRTemhqWG5NcXhzSUpDSDJ2WTJuNmxPQTJ0?=
 =?utf-8?B?SWUxU0x1ZXc3MFgrRmlnTWk5dktKQjZYTGNCdHl0d3B1M2ZoL2hCN0szQkV0?=
 =?utf-8?B?M2FLU1hjRXRjc3ZsUlBQL2VRaWoxQk1qWkQ0d2VGN2VuTWkvR1ZBcjdYWnE2?=
 =?utf-8?B?Z3VRNFlwWEJ0K3FiWFYxL1JReUd1aUpmWTVHRm5yNDVDUS9SMWFXQStJclgr?=
 =?utf-8?B?UHh6cFVRakRNZlBOcHpETmw1ZmNXZEd3dWVBU2s0VlN6SnVRMFZpTzVscVZl?=
 =?utf-8?B?QnNtWGJtMHkwbnA4aWV2RDZPdU12SURqN1dscnVIdlZkSHk5NE5pU0dHYU5r?=
 =?utf-8?B?VDlPWUJ6TW1BVFVHRUNIQnhpR0JWZEM3WkMwU05hdXNiV2EzZnBOMWU5V3dz?=
 =?utf-8?Q?E+m06l9bs4+SbwKzz2qpcKglD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5587bc73-d62d-4c0a-80a0-08dd40d8991e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 02:48:38.4959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SORPtgoN/N3vEVEfqLXQIp42i6FI5+xbr+8Uvcl58Gkx+S/4btEaObZG++GzQ/d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6333
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

Reviewed-and-Tested-by: James Zhu <James.Zhu@amd.com> for the series

On 2025-01-29 10:28, Christian König wrote:
> Test the fences in the private dma_resv object instead of the pointer to
> a potentially shared dma_resv object.
>
> This only matters for imported BOs with an SG table since those don't
> get their dma_resv pointer replaced on release.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 06d6a452c4f4..4d6b2143db63 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -234,7 +234,7 @@ static void ttm_bo_delayed_delete(struct work_struct *work)
>   
>   	bo = container_of(work, typeof(*bo), delayed_delete);
>   
> -	dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
> +	dma_resv_wait_timeout(&bo->base._resv, DMA_RESV_USAGE_BOOKKEEP, false,
>   			      MAX_SCHEDULE_TIMEOUT);
>   	dma_resv_lock(bo->base.resv, NULL);
>   	ttm_bo_cleanup_memtype_use(bo);
> @@ -269,7 +269,7 @@ static void ttm_bo_release(struct kref *kref)
>   		drm_vma_offset_remove(bdev->vma_manager, &bo->base.vma_node);
>   		ttm_mem_io_free(bdev, bo->resource);
>   
> -		if (!dma_resv_test_signaled(bo->base.resv,
> +		if (!dma_resv_test_signaled(&bo->base._resv,
>   					    DMA_RESV_USAGE_BOOKKEEP) ||
>   		    (want_init_on_free() && (bo->ttm != NULL)) ||
>   		    bo->type == ttm_bo_type_sg ||
