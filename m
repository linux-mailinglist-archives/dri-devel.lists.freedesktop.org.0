Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA36AFE23F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 10:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C8310E760;
	Wed,  9 Jul 2025 08:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bYGdoo8A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8970D10E13B;
 Wed,  9 Jul 2025 08:16:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIuVazfsg6AM4XmKI44MXxt+su350lXLed9NePGHCNtxXxroZnGxOwZNJm33k1saOMTHeuTuGuewHrG4CNiE2nvXgnIMcvQGTP/R2M9kE2Q2AggLaQne5zyY1SnQ5eUlL54/G7NiPckuIFHqqRAG3iHgIKQPCSxrw16LBemMir1Sni6muRftkWDQF0t66z6siX4v2AHUdEUhF+4PVGCxiFfiXbLrRaluC0cfCDheK9n/0utbXPP0SkGBkYdUo+uce5FziqJPKndXjrX/D7DGN911TOI+J25Tmt2tlUihuzsyTW3d+Fhj0K4NkiZNXx2OKDDaXGrxmBCw4tu7LVnljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8BfV6utA4zGzWDSq7l6bSCsanVI7cptu/BMe7WRNxY=;
 b=enYFnk9QBRTHDA9m9+ZdAOh5yS63ZlNIhJ1eo8PbSygsZL1keEKBIB2Hq2lnmIdDUMf/7OxO+U99nyq33C/FgHcv3qKQjX/tAPRhnNUfDoUzo2Zvg5veqF5gWAeds1VQx2A+NARRfhV4P6knQvF4n1wKTrkjWHcbCLBaDenmlzoOcFEGhPr6Cr9CVQZoBWw0iX27NS2ixypanqZuRHQVS9Mb2BZx0Ul92nyQ20IDuF209/49yg+4/DK+c2tdVTcW2tGTexMlY+Mem1BMECc+PTEzBdjZyVrzAjeOELJi6/QUBaHRoO1/qaSZ/v5sWnTF8bLAxfTNmvqmjMJHNv0EVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8BfV6utA4zGzWDSq7l6bSCsanVI7cptu/BMe7WRNxY=;
 b=bYGdoo8AmjWSaoXJTBmk9Fi6VnPQb0NlPTVtp8GTu13dTcsb+sZGxN3wLJb/SL9AWwBmAQH4eghnvaFBTGalARJEgHRUW8qAZrdV5KTDeXQHwvGktHJOHwt4chTrjrT8eIxz03X6RLB5FhiCU9Siwb4NGYbE+dH40sHfZsMxIsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8418.namprd12.prod.outlook.com (2603:10b6:8:e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 08:16:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 08:16:49 +0000
Message-ID: <3ba76974-1415-4a07-b953-aac90a4e0226@amd.com>
Date: Wed, 9 Jul 2025 10:16:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: fix the logic to validate fpriv and root bo
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, kernel test robot <lkp@intel.com>
References: <20250709071618.591866-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250709071618.591866-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0342.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 0378cf05-429a-4ce7-a19e-08ddbec0f3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TG52dmNHcDJucHJic2FHSEFIMitiZDhSamhyWmVzY3RkSGw0L1hxTTZQN2E3?=
 =?utf-8?B?VWJSWjd5T3kycklkL2NiVTluRGY5YjltRXptVEtMRUpJZklCczRUZWZYRGNp?=
 =?utf-8?B?SHFRek1wbHRyM1pjbld4bHNMaDJBTm9RMmdHREM5SkhoQ2FpZnNZRlc5WDIw?=
 =?utf-8?B?Y2s5TnlsZlhSZUNDRHAxSGc2Wm1Cek1UNVdVNXI1WnlGU2JleGVycWQrcGFo?=
 =?utf-8?B?c3ZnTVFCVHgyVkhQSklTeWdZTFRuSmtVOUJhWnhFSStHVFNrNUdRUlFVQ2hL?=
 =?utf-8?B?cGs3MWk4WDE0d2RLSXU2Nzczajc0Uitkb29ESUZ1R2tGTWp4aTB5NnUxbUxt?=
 =?utf-8?B?cnZmV3ZJdmNyeU1lZWN1MVlPeU1kcHp1ME9ZMXdCRHlUZ0pyWWh2N3pGVWl3?=
 =?utf-8?B?VW9YaG1Tb3A3QUlydnptdHc3NWc1QUJOQy9zeUd6SE1MRlRCSkw5REtjYTc5?=
 =?utf-8?B?NjhiTkd1dDVCSGJvZmNNQnNaaVFEWVBnZmF3QTFYRGYxNm9BVjk5RERWZmdY?=
 =?utf-8?B?TVNhODh0dVY3Z21qVkFlRy9leDhUTHl0TjZra0JyZmVCRGtxcEdKamlldGJ6?=
 =?utf-8?B?UDFaUFFqemZ0OXpwRU8wTkRkQVJCL3p5TUYzUkIzY0k1aEpuc0gzUE5WT2Z1?=
 =?utf-8?B?ZWhJaW8yVmttT3JKK2ptcXlSR0dIOWh6eXVzY3pxRlAyb3dPTFhGczU3Z0lY?=
 =?utf-8?B?Kzl2dnVvUXR2NE1DMHY4SG5BKzV5TUl5MUJ3STVCTlIvTTh2RTFlM1p5TnBI?=
 =?utf-8?B?UGNTR3ZobXhrd1lJNUtUcGZENEE0QzNTOUNFQWlXRFV1eGJiV2NScXZaR24w?=
 =?utf-8?B?NFBpQ3U2MkhjU3VSZGNQdU42Ri83VzNIRnNnclo2eWIreXJiWXlEQkhjUzlh?=
 =?utf-8?B?cVlyTTlWdFFWQmRQcGFMNkpCQkY0U0c3N0Jydmt6ZW91VzVka2hHZDJkL3pn?=
 =?utf-8?B?SlRlTzBjM2dwRXJHUXFLMXV5eDhtc2x4aGk5NE11VmRWZXN6by8zY1RjS24v?=
 =?utf-8?B?Q2U3V0xoR1EzbDhvYTR6RXI5R2lZOEU0OG1IMkxxUFBjdXZPS3BuVmpQYTVi?=
 =?utf-8?B?WlcwSTRsMWIvTCs1ekUvdVNHNDhZYlk4UmU4bXhGUTl0RUlJMnNkUDhOS0d4?=
 =?utf-8?B?clpRdVdXeW9CN3pMTG42MWs1b2l3VGdJY1hxbVRpa3pidXVIRDRnZGFxaGp1?=
 =?utf-8?B?K0V3djlJWlpUelpIblZWblliUFRhSWhkYmhLcUF2N3FOWWxiN0NBSmZ5VGd5?=
 =?utf-8?B?SERZT0ZpR0EyVzFrOVdiVHZLOUh4aWQ3TzBpL2VZYzk3bkRyRk5aT0NhOVhk?=
 =?utf-8?B?eGtLZVdxWGF2Tk5jWlM2VGtsMjVFa1JuVy9POWZJTFVCMlNuc2dnREdqUWFx?=
 =?utf-8?B?VnlWZUxOYSt3c0VjQ2kxblBzN211ZFFOSThqL3lvN2NzYkpJUHVHN0g4Zitk?=
 =?utf-8?B?Nmg1cUU0YVd3REQ5dzRZaXN4ODMyT3JXM3N5RXRtRkpMME1WVzBaVlI2QWFS?=
 =?utf-8?B?QU1WUi92Y3VTTmluMlZjUC9kZ3dnbVVGMUJ3YkduRXdnN25ob3RPVmROQkZY?=
 =?utf-8?B?NTBWMFIxUThDUE1LdFBjeVM1a0tqS2F5V29GczVOczZKaUtBK2RUQk82SDdY?=
 =?utf-8?B?S2ZMSjRXT3BDYXk5eFhEd0RjU2RIQzdHREgrYkVmMVF0ajl3SnFWU0t2NXJG?=
 =?utf-8?B?V29DNlMvZzlSRkJLVzB0cDZWSjVCY2hWQkQ1bkpDQmdyejduZ3FjTmxwMmI3?=
 =?utf-8?B?RkNONTJITlV6ZTlSTVVVRlo1Ly9GTjRuUjRoSFhSVmZaU0pXWXFLajQvWWk5?=
 =?utf-8?B?Mi9DRFozZHJuQ1JLWnBBbTl0c3ZEcithemZubXJSSkF1NnBhU3VlVHR6Wk9F?=
 =?utf-8?B?OFhhZldOdXE5ak44dzVEdllpdEYxc3JPSGRpRUUxQnlvTENyYkxoNFRVMHQ3?=
 =?utf-8?Q?e+BRPUS18pA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWI5d3phaStMb284R21WSG5XSHlTT3diRGt3SXVaSG1nZTAvaVJSbXhnZDhl?=
 =?utf-8?B?d2pLSnVUcHZ5STdsVTBVYmR5TUVMM1RvSkI2aTQwN1dOZldIQU4rMTROQnNL?=
 =?utf-8?B?LzV5eVNUc1NFN0NRTC9xMzJMcjI1alBkS25ZYXgyeFlmQmtWSE5nS2xrL1do?=
 =?utf-8?B?VXZUcHpEL21BL2FYaVVQZThCZzJBekZQYlFZUUp5SCtrdGxTQ0RicUZ2b0JK?=
 =?utf-8?B?cU9KbTVRRWFXZS9pZVp5c3pTQUdiemhJK01ISUFDankzYlJWMGhwZTdtdVp4?=
 =?utf-8?B?V296UERCOURkeVhaNnh3Zm1ObCsrRkp6Y09iQnRBWHRPMGNrdXpJbTR6NUM5?=
 =?utf-8?B?aWhVell2KzhjdkdvOCtjbUprYnVNelN6ZU5XVEt3Y1U4dVQyZE5meUFoamFQ?=
 =?utf-8?B?WHdYQ3l1UmI2SVhkMmc1WVdwYUFSdnR3MTZMMkZlYllpdHd2elhkNTVYRURj?=
 =?utf-8?B?WGpSMFJCeDBPY1crNm5CbkIwdjB4Sis1VW9zNmpVb2N5ZTl3bVpubFhhZVQx?=
 =?utf-8?B?N2wzYlZyWWx5ZEVDUjVZa0JFdGI4YnFURDdKNkZ5THI0TzFZMlpsbDRGbWV3?=
 =?utf-8?B?bS9CWFFKMzcrbkJ5WFhyUDB1eHM0aXF4enNjN0x0ckJXSHhYNWVkeFFxTnFE?=
 =?utf-8?B?NG1ud05oNHdEL3VPOEFndkk5NjlMVlNvRS9vMmRpMlBXb3cxMEdia2tydzE0?=
 =?utf-8?B?VS9ndHlkbjZ5YzVqelFQdTBmSFlvL0RMQVRWZWgrSVdEUzA0N2c2N0N4bGJn?=
 =?utf-8?B?amFvUW9pbWx0N29acS9SQlVQczhvbHV3dEp4UHZpcGp2N1dzUWNMQjEweURs?=
 =?utf-8?B?dWRVdjBMYm9xOC9XWDV5VG5iMVJDT1kzRTBvUjFEbzh3M3BJTi9qczlkU20r?=
 =?utf-8?B?OWNZbEI3eWFKQzhKTVF1QmlSU2hJcTA3Q01KWlAzYkR6MHFYVnplSmYzSWVO?=
 =?utf-8?B?b2EzaUs2N21SL2xZYnBXTDFBbEYzeVlGRDRPUWovN2Y3YkIxdkZTRkcwUWRI?=
 =?utf-8?B?QXRrWHVSQXd6S21yRlFDb1JxYk9PaDRKOFY5Z2RhY2ErSWJDVEpPWWVaRkto?=
 =?utf-8?B?REpVWXNtMWR3VUpLL3hOWUtsQlB4S2gyb1VOYmtadDdSMElDaFhkQ1FPM2RQ?=
 =?utf-8?B?Q3FFQWowNThjSVF6dHRMVk1ybTZhM3dNVW1qaExwNkNQYUdCNnB5RTBKbzEx?=
 =?utf-8?B?TXAyYjRvWEJaUWk4ZHVUZjREVWIvQVhyak5wU3BEbUhveitZYTdXTE9vRWRt?=
 =?utf-8?B?aXNYUXYyMkpaTk95eFY4cHdvT3EzdnVUaXh3UUtBblJWUjU1Y2tYQzhlN3lS?=
 =?utf-8?B?MzdsY051dnFNWlNtdStYQWJtNi8zNFRxOVhFNFlPWmlXRlNJM1NvcjFZSHV2?=
 =?utf-8?B?Uy9xTlZqd1ZqMnpRRkpFZEhmblBHdjBlWFgvVVJING1na1lxQjZ3blFYMGNS?=
 =?utf-8?B?Rlc2ejErZmRoaWtSNlhFU0lHUDI3ZlE1aWN6akgzdDcyU1pDRnhXM0xpWlE4?=
 =?utf-8?B?TC9mTkg0QUw0SVU1M29UaUNmRUJrNlBid3pBN0tjUE9SdHExTHM5OTNXYytr?=
 =?utf-8?B?ektKdlJCVkJ1S2dGVGJ6YTVERTdKcGE4aVhTUWR0KzBpZnE0OXBDZ21QYzJk?=
 =?utf-8?B?UWZCTk1YY1NJeTZ1RmwwaWphMVpEQzluV1BDSTdoN2FLM1NxRzFKWDRjRHJO?=
 =?utf-8?B?OXl5NVNUWnVsQmVncC9naXBNeFpYTDdBeEZleldmWVExY0VJYnNWN2svN1Rp?=
 =?utf-8?B?K1cwMVdOVlNtaEtHOUQvOGQ1Q2w4SkJEeEhnLzRhYkJ0VnJBYWtoRityb0lD?=
 =?utf-8?B?QVpIYTJvZE5FNytOTGlSM2lNbTZNVko3SUdkNExMYmpQVFkwZkI2NVFaZXZp?=
 =?utf-8?B?SitRTzhaZ0dMOGlmRHpoOC82Mkw0RWV5T2NNVk5CRFcweFhsN2kvTXhZS2RG?=
 =?utf-8?B?bjlmVFV0bGFYazFaS0xaRTlsRE9LWW45OFE2Z2c0NWt6b3ZYT2I1TC9JUnhr?=
 =?utf-8?B?dmRhTDJ1QXVKbE9FcjlUdDFOWmxEdFBvOENFYVgzNGJGZHBvVEhHdHcyMlM1?=
 =?utf-8?B?QTlHZERlRnFEamxOaGE2K20zd2JJRi9DOEJUMkN6aUVnMXVLdS9Qek1NcDNa?=
 =?utf-8?Q?LLaXpeX/EkF0PL+zM5ybanKFD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0378cf05-429a-4ce7-a19e-08ddbec0f3db
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 08:16:49.3508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5A2RrIHa69iPlNtDKvyrKq9ynKDqFu4tq0JqCTpw9MvEjMMdd3gtftn+m8sdM/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8418
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

On 09.07.25 09:16, Sunil Khatri wrote:
> Fix the smatch warning,
> smatch warnings:
> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:2146 amdgpu_pt_info_read()
> error: we previously assumed 'fpriv' could be null (see line 2146)
> 
> "if (!fpriv && !fpriv->vm.root.bo)", It has to be an OR condition
> rather than an AND which makes an NULL dereference in case fpriv is NULL.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507090525.9rDWGhz3-lkp@intel.com/
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

Reviewed and pushed to drm-misc-next.

Regards,
Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index e49890a23ef6..63cd790b1d7b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -2143,7 +2143,7 @@ static int amdgpu_pt_info_read(struct seq_file *m, void *unused)
>  		return -EINVAL;
>  
>  	fpriv = file->driver_priv;
> -	if (!fpriv && !fpriv->vm.root.bo)
> +	if (!fpriv || !fpriv->vm.root.bo)
>  		return -ENODEV;
>  
>  	root_bo = amdgpu_bo_ref(fpriv->vm.root.bo);

