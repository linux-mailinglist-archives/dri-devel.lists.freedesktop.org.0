Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECtFJdyNe2kKGAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 17:42:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01672B257D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 17:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C01410E8A5;
	Thu, 29 Jan 2026 16:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n3y/a6pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010024.outbound.protection.outlook.com [52.101.201.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5938210E8A5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 16:42:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJt8Q58j3jGCgvVm1eAM5B1bCoTM2mr0MV6AH+MYRmuISB+kFboq2YUWDFjrxT8RWB5Hz0I4nE/cHnlaWPXVOvnSYZyIjWra7JX60AS8fxqeEwU61h7vLC1gu0R3HUj0kYZjzyN0yqziK9FAlSD6S6b8Nb8S8Z6lP1Epy/0rH62iixJPYlMkPZiPcKdGvWf4P0GRX28xjAqaMCxpqWtAntgPQIJHd62hIR4YPVC8liceZsVdHhxgQFvTEGvjWhhA1EwLD93U6uKZUpzj33YoH0fgvnD8KtX7XzlZC8bkvPpRJV9F4SpLHttl3CWUU4oAcZp/W5zFWOPKEgzxoNwgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDinoTnz55p4gW67GkuW55iiaywJDX90qXUYL/m+Zqo=;
 b=E5mK/B70+9sKMump5d/n02g1UWlsTN/M51rz7x3H/LQpaYRzIz4ci2yfZMJvFytPb0pNNhpnLsCuwplvkEg+TY4gDe6Jz0qBlyGj06y9UTsHRHgdmLrLVLOK0Hl5t/SA9BkVm3QkDdA+2swZPIML85EGxGQ3FRbqEK2uKwOmpeCVnIq/VgpEg9LPiNN13+n1dom/FNaDmjtVBH7YuYjrLdsPPnRMecNIasNh7oNypqjV/pf3OvvlJ733NZBVcDoOLPhuA8ZsPs1IY5YmI3eDMwMhaYzbKqahjoNnedw7C8I8tlHolCZ/agjn6HcDoRpe56SSOtEAY2B2e+c1/gK7zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDinoTnz55p4gW67GkuW55iiaywJDX90qXUYL/m+Zqo=;
 b=n3y/a6pvCdAh5sZwHolGUfIdwQHg9VXHPRWroEId0wXxfJwrenF60ysQs5MaEom0lmXYtB1DAhBVFiJarTRt+OzBqFNEsAEuVcW4+mjbFlyk6bm8wLwNNzgW4diQ5wHiOJ0dVJdtt0KG3wbII/gV9pAJVCDWaOtVrurqRoWrYaM=
Received: from CH2PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:52::28)
 by MW6PR12MB8758.namprd12.prod.outlook.com (2603:10b6:303:23d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 16:41:56 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::63) by CH2PR04CA0018.outlook.office365.com
 (2603:10b6:610:52::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Thu,
 29 Jan 2026 16:41:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 16:41:56 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 10:41:55 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 29 Jan 2026 08:41:55 -0800
Message-ID: <a6e64fe8-8b27-2ffa-fde4-3e3d26ea4049@amd.com>
Date: Thu, 29 Jan 2026 08:41:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Fix memory leak in amdxdna_ubuf_map
Content-Language: en-US
To: zishun yi <zishun.yi.dev@gmail.com>, Min Ma <mamin506@gmail.com>, Oded
 Gabbay <ogabbay@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20260129100731.56116-1-zishun.yi.dev@gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260129100731.56116-1-zishun.yi.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|MW6PR12MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9ef74c-537c-4d66-3205-08de5f5550b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWo1MDBJcXRuSW4wTytNMEpwU2pWMTZSbzZjOFh4NkRxYVR0bGdHbUFwTldh?=
 =?utf-8?B?T1NxMDVtYTZqMHNaYnBQWjVrWFgxb09VZC9MZEFCeldOcFdCL0xGc2RkblRs?=
 =?utf-8?B?SHMxYTFXMUtEeXMrRkFic2hwRnNlcmJkb2RHaEFmcWJuZzQrT1QvVzREbzlR?=
 =?utf-8?B?UnQ3UmNvSGw5M0dNZHkyYk9YNzFPTHpTTTlQYzlrckhIYk1Sa1JpSlFuOTZs?=
 =?utf-8?B?Yjg2RDlIQmZkR0dZVDROQm9vV0RYY0NWWUg5TTJtdEdCN0ZLQVFlLzhOTy9t?=
 =?utf-8?B?WjU1OTN6YktubjAzMmhsbGV1MjBoa21HN2xLcm9IRjZ1SjZ2L2xWOE1UYWlU?=
 =?utf-8?B?QVVNWW0yMUswTGRKR1dHdklmdEs0Q2lkdjE5UUJPdzNMYzhBTzUrV0J1YWd3?=
 =?utf-8?B?RXhSVG93NGEzNGR3VUlWQUFHZzlESUNtbUhrckFsMjdya3hUVy9haFVvS2pX?=
 =?utf-8?B?SElyb2l6T3gyR2hRM1JhZXUrQUkveG9pcmwxQVpTdDg0cGs2MzgvNHYrTUhn?=
 =?utf-8?B?ZHNkWC83RHhmUjdhOXdjaGtJS0dicWtGYXZHNVkrRGp0TXlHOGVlTzcxUXk3?=
 =?utf-8?B?TVJHQWNJNk5zV2t5UVIyTmVKSERJSnZJTldoSjVWMTgva2FiWlhxUFZ2ZW5u?=
 =?utf-8?B?OFpybmliZncrQjBSYkpaS0dOSm8xV3cyU05Hb3pkZUEzK2haejd6Y3gxR3N2?=
 =?utf-8?B?aVdUN3d0eHgrRHdoT0NYck1LcmFsYmh6bGJCZ2VTeDY2SDh2aHlhbUQ5MG5S?=
 =?utf-8?B?WkNlNFFNUVVZMVMrcnFrMExMNmpPajZrbUMrSzdUTkl4Tm1wRXNDZXFxcHpF?=
 =?utf-8?B?aHIxNDY4d0k3R3dzdXNYbEVkc2pIV1JDMkV5WUtDMFpBZk5sNzJjWnUySDAy?=
 =?utf-8?B?ZTRpaTJVS29obW1MbHZwaVhzV2NQdFJ2NEdtTkNYb2hhN0RiemlvdkFwY2lD?=
 =?utf-8?B?a0NYM1ZrRWRVaXJDcFRsUk10RUYvSmNLTGhrMWRReS9QMUVLRUhWako5MElV?=
 =?utf-8?B?YW81OXh6VWdZRWRWa0JoS2k2WmdpVEFUanVmK3lmRG9VM1k2Qy9xZjY2UEEy?=
 =?utf-8?B?TGwrZWdIb1RjRldSZVRqQlo1cjk5N295eFhYeUY0aWVYNW12MXBxWk5iMHJu?=
 =?utf-8?B?QkpKY2dyZWkrU1RrTExTeWFLa3Y4TlIrM0E4ZmsrVGdnMWtYL1EzUDlvbFlK?=
 =?utf-8?B?VzZDNk9nTDVoUXpUMEJ1MHhFRThvODNqUXVNNmVvQUMvQXZuOFhsRXpzeGRU?=
 =?utf-8?B?NXZ6ME52NGtIVG1aUElYNWs3VlM0aFRYemFENk8vRUtITGhEbnVNVUIzSDlC?=
 =?utf-8?B?b3JmMHluYUhZOFl5Ny81emtCUlpteGRLSHJmOE9FQ1NNSEJvSkUvS0o4eGF3?=
 =?utf-8?B?OExWY0htU1NBaWJxOWt6eEc0WERhWnlIdmFQaGJQYThRUWJoNGh4Z0NnT1l4?=
 =?utf-8?B?dERScTllV1FTZjQ3NE5YTXQyekFJLzJBZzlua1NzZHdvdjhCcjFUUkhzbktJ?=
 =?utf-8?B?anY0cGdrV2JicGVsd0R2YSt6a1JyN3lheW1pZE1pQ1RncTZUTjRJK3Zrbmxh?=
 =?utf-8?B?VHIrMDdBQ0tYamRLa1UxYUNOdXJPRjVrQWNIM29SL2NQSUFMUHR5UGJQSDJz?=
 =?utf-8?B?bitmUm1mNDFJdGpmdzdVSGFUcko0YkY0WmxvUC85SDZ5ZDFLU1liTzFjT0Jj?=
 =?utf-8?B?NU5wRFBuSmNHYnlFa2JrQUtubmJHR3VoNGlGSGlCOXU4SEhCOHhCMnQxVG11?=
 =?utf-8?B?YkE5U0FWbXl1aGk2ZEJYYjR4a2Z5YkhIcFdHb3JRQ3NuNzRlMUwwem9HeG5U?=
 =?utf-8?B?NGdqTWtFYUpFWC9IUmV1NWdwWXMrYzNINkxGdlp5bjJPQU5udW1NSXA2aGdO?=
 =?utf-8?B?dkZXSCs5b3h0OTVVaFM5Ujh2UW5ETDNrbkxreWVRaFpLaGR4alhJamJqN05j?=
 =?utf-8?B?RHIyL05DYUFmbnA4ZFFKZFo2RkU4ZHBYNjhZdU9HVS9xb3R5cVFqUHJROEJz?=
 =?utf-8?B?NTNMTHozQjBZZTNCUUdmeGFrRVBpVDgwVWFoYkNFT0FqN3J2NWdwWGI5UGJu?=
 =?utf-8?B?UFdqRmZSczlQZldHQXFOcmRIR1JWUDBpcnZhTldnVzl2eCtOblliR2pRaVpH?=
 =?utf-8?B?MFpkWkRtd1IvZ1hCaTJFMzVDaGxnd3k4K3Z4Ny9FSTFITjNJZmdaZ3F4RGVl?=
 =?utf-8?B?N3BYM21icjFIb0MwRUEvdHpyenFqMWhTQm1EcWgvT0laRkwyL1RuWjFZc0FX?=
 =?utf-8?B?QThhWU93MkgySUkrMlFuekpiZ1F3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pHRAeiYHMDmYauBPAYdD6NRURHnb4pPdh2HgycgbhuN+USbtHvCJwf9MFdtZtwil8qbvnFcBmvb4tYxijt7GvBoRbjSZwlJovETp7QcXD+1r34l/hZ6LggGdQZknWVhH4fenmnTBF38Osk62aOCWFY5x2FRqFDh2aX93XfUoKdHDjXjbEaXrTAOXsvRQIcWp2Uix1wpRehYXhs2AZ+ihn9PvRwZ+4unUd6ZYa0GLmkGCjXcdrNIDgte2KeGYOXQDj8/Y9pTBQ8vzFEQc1ujdKU9TM82j2NOtQ4z4zI7SSGnPp85vhcrvICNxXi8Kg/HYlONafpnX+BNCS5Nyb6ekRvqro2omUaQgTk++gpOu8Gd99rLaAAXsIqMEBjr2wVTcLX4jlR7ZALPcCod17w//ABbboSPrYaMNo8uTiehC8LAmPcDPFPyXOMqQ9kaSltl+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:41:56.3477 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9ef74c-537c-4d66-3205-08de5f5550b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8758
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zishun.yi.dev@gmail.com,m:mamin506@gmail.com,m:ogabbay@kernel.org,m:linux-kernel@vger.kernel.org,m:zishunyidev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01672B257D
X-Rspamd-Action: no action

Thanks for fixing this. Could you add 'Fixes' tag?

Lizhi

On 1/29/26 02:07, zishun yi wrote:
> From: Zishun Yi <zishun.yi.dev@gmail.com>
>
> The amdxdna_ubuf_map() function allocates memory for sg and
> internal sg table structures, but it fails to free them if subsequent
> operations (sg_alloc_table_from_pages or dma_map_sgtable) fail.
>
> Signed-off-by: Zishun Yi <zishun.yi.dev@gmail.com>
> ---
>   drivers/accel/amdxdna/amdxdna_ubuf.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_ubuf.c b/drivers/accel/amdxdna/amdxdna_ubuf.c
> index 077b2261cf2a..9e3b3b055caa 100644
> --- a/drivers/accel/amdxdna/amdxdna_ubuf.c
> +++ b/drivers/accel/amdxdna/amdxdna_ubuf.c
> @@ -34,15 +34,21 @@ static struct sg_table *amdxdna_ubuf_map(struct dma_buf_attachment *attach,
>   	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->nr_pages, 0,
>   					ubuf->nr_pages << PAGE_SHIFT, GFP_KERNEL);
>   	if (ret)
> -		return ERR_PTR(ret);
> +		goto err_free_sg;
>   
>   	if (ubuf->flags & AMDXDNA_UBUF_FLAG_MAP_DMA) {
>   		ret = dma_map_sgtable(attach->dev, sg, direction, 0);
>   		if (ret)
> -			return ERR_PTR(ret);
> +			goto err_free_table;
>   	}
>   
>   	return sg;
> +
> +err_free_table:
> +	sg_free_table(sg);
> +err_free_sg:
> +	kfree(sg);
> +	return ERR_PTR(ret);
>   }
>   
>   static void amdxdna_ubuf_unmap(struct dma_buf_attachment *attach,
