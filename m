Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEgBFygefWlQQQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:10:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC75DBEB78
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2104510E106;
	Fri, 30 Jan 2026 21:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Wmnioeyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011068.outbound.protection.outlook.com [52.101.62.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AA010E106
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 21:09:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brbcO3T+tDJCOk4rghR9aMXvbLmbgFHh4A+7tUVok1zV+Q8yqWuVAjQa5LmgrWEKYw5bwfYz/jhHhGxQ4jNB3+12KH8HcmnOv7qDdHzHuhAc/WGfT7Y6nFAxGzZZMqht+lX9Sl5UNhTBLiO31Xxf/Uw97rRqDZgwEHG68cWdxtCg4CdPkDEerhY9dd5oPVH+PfTOYXs9ppwS+OGo3CIWhrjXGxXwtxXmAMdKIjsKwry5CpFWaIVh3NXwdr46jxrXcOkG7dwN9vxxAGLj/j/f4KvUE5Ot6vSbPrebsYsfZCHeVz2PYhOOBYX3xjkfK4XHNgz54FYDjtAOYDpc5mCoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewdbBej4LnvrG91TbIcx5wwrFzuur41j5djSRYyFuaQ=;
 b=S1Xr1vo6Ta5Lff0Q5xhT/hmQWtb0w/jKefDwHhVWp+2It85WFeC/6v1CGSidwIKFqwQnt88YskE8W9CJmngT8qqJwZDVxmBPICffdOfYgj+SbwD9hnE3M8OdpRMwAQHAIA/3ZdaBvwexE+O/EmfWix2nEQ+MTd0bwg4Ct/ZPGY0Kkc+yKVwc/STZKUn0cfniBDsDYBIxzOXZ8YhEn8PYeY9/+7thvi84spWszMP4BkjnU5NPTodNDi/AyAmpfXfGlIBUcwMTNhf70AgaHiuEnq4qPtv4LKZJtBEcUl8oyDTmevyRSW5lZdRbk35ox9DlhvyyteooKcxv61/dpsO0Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewdbBej4LnvrG91TbIcx5wwrFzuur41j5djSRYyFuaQ=;
 b=WmnioeydmpTYxI3AWODf6dJByb7FECtAgGUmd/PvaAib26aKEsuxdxopcOXAdq8u1ApReS/gRQudELQDYAmK63ErfzexdR31IUhutbzsVwupfiTJSUA9RL6vB7qWQE33IqQcseTNrxTOCukmP5urXFfvzDuc9uc+oFSbsJVBta8=
Received: from SJ0PR05CA0098.namprd05.prod.outlook.com (2603:10b6:a03:334::13)
 by CY3PR12MB9701.namprd12.prod.outlook.com (2603:10b6:930:103::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Fri, 30 Jan
 2026 21:09:51 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::62) by SJ0PR05CA0098.outlook.office365.com
 (2603:10b6:a03:334::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.6 via Frontend Transport; Fri,
 30 Jan 2026 21:09:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 21:09:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 30 Jan
 2026 15:09:51 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 30 Jan 2026 15:09:50 -0600
Message-ID: <1dd71e0f-50f5-ea30-e8f7-0f94ba90f361@amd.com>
Date: Fri, 30 Jan 2026 13:09:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] accel/amdxdna: Fix memory leak in amdxdna_ubuf_map
Content-Language: en-US
To: zishun yi <zishun.yi.dev@gmail.com>, Min Ma <mamin506@gmail.com>, Oded
 Gabbay <ogabbay@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20260129171022.68578-1-zishun.yi.dev@gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260129171022.68578-1-zishun.yi.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CY3PR12MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8538d1-1367-4a5e-54f6-08de6043e8af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MC9QNGFuUzRWUFdNNzNVTDUvSXhDb1ZabkFRNFc4NmR4d244S1loTTBQMktx?=
 =?utf-8?B?YTlQMGZXbDI3SS9HM3c0eXEzS3hmK1pOQVdyeUFMb2E2S1VvMmFNbjk5czVz?=
 =?utf-8?B?T1FLUUtCcmFiemNHdlM3VUoyZzVDVklOZlp2V3RsQjY5eVc3VTMzSS9LQ2F1?=
 =?utf-8?B?aWxzR01NOTdhZjFwcDBrdGtzMHJLaThaN2JZQ01Days0Zm1xMkY1YUR1Y3lj?=
 =?utf-8?B?WityOEdVcTIxSWFpSkN5Z21SM0J0c25JN211endZdGNLQUVOVW5wbEl3amxm?=
 =?utf-8?B?OFRjR1NYU2tsd0JMaU5KYm1KRTdLRjhzNWJpS1JnSkJYSGlKYXlPeTVRVGpr?=
 =?utf-8?B?VzdjaHR1SGhFQ0hYdGc0NHpKUXR5NDBWY0FNenVTWTRhaGFob2pwbmlxOHRF?=
 =?utf-8?B?UUtHb2g2WjRPcDdVNjVOa0J3dGxId1RLMG1Va0dsMnpGRkJHdTZXbDE4TkJi?=
 =?utf-8?B?WDVmcFdOdGtlK0lXQ0dCeTFqYXZnb1k2STFORU9pUHpnQXVOdmU4NGViVnVG?=
 =?utf-8?B?SzdQdGZnQTdOUjBSVkk5a1RBTHFGa2d4MFd0WGZBUHNyenUwUTFDL0xWcHRz?=
 =?utf-8?B?SStqUXAzOWRqRE15NXpQTUZRWm5XNmlDZUljYTMzQ0lHdGRnSFdtVXRJeTFz?=
 =?utf-8?B?NXVBT0FzWHVZa0VSbnlEUEd5K2R5VHdpZ212K0lQNEJrcE9MK3dTUWdmRjVF?=
 =?utf-8?B?cDBWMDhzb05iM2tjdUEzWWh5YVF2eUVBSWxJdXlNQUxERzIrVjlmamtkcDQ3?=
 =?utf-8?B?eHFVcHEwa2E2d3FmVjM2SXBsODdQSnBycEYwWVlDN3FwSUdhUlpuRzNDQXBI?=
 =?utf-8?B?MVVKSVNmN2hTY0grWjVpQWhicHRDbFIxZktGNnQ5MmJNbUpBVFAvWEszeDVR?=
 =?utf-8?B?c01Hb1Q5RTlxWHp0TkswT01OWlh3NEV6RGo1TGx4ZkpuVHBzMnM4dzRNVDVs?=
 =?utf-8?B?UXg1UVlEWmE2T2wvR2pVYUMzNnMrejlhZE9GR2RvaUFjNDljRzM2bDU3cmZi?=
 =?utf-8?B?cjRqNG12OTRKSzRYUldKTU1yaU0wY1dqYUxLVlQ2OHdkclF3UlRkczlRdkJh?=
 =?utf-8?B?WDgwL1dCUVgwV09aNDM1UmZUeTRVT21lSkRCMVZJWGoxNGw4VFZtamlXTDB5?=
 =?utf-8?B?eHZoY1h2Tks2VFNiTzJNZTMrbnh6WkVXTkd2dEV6VTZhWVc5RWs0VzNrNHgv?=
 =?utf-8?B?MVcwUDMyTGppdkJqalFhMnU4ZEUwSmlGbk5neHUrcUM4eVVvNEJHYlRPdnRB?=
 =?utf-8?B?eldEMHBtQUlpUGdPZWtqOHN4N0pQaWxEanlKc2R0dW8zOHhYWVFyOXB3eGUy?=
 =?utf-8?B?YkdrZGhFcjFlZUdIYk1haUlBR3dBa0JWanF1dUhWQ3hPUUFXeXVZMTgrVUd5?=
 =?utf-8?B?YVVyTHBoL1BnSlBmdHdoTExoZXhtL28rUk9xdC9uNG5WcjRFTFZNVVBnT3JC?=
 =?utf-8?B?YUhwamFjNGJsUmpJMk9yNVNXMXhLbGZkQVRJZXV0RzJOa1BWUTdHb3BFM3R2?=
 =?utf-8?B?ZkhiVmhZY2tqQXhJMmpYZUR3bkVPTExsUU5GQ2dkYnFBdGVZUlhQcXhvOE15?=
 =?utf-8?B?WDZPUGFFNHZybWhEWkVGUmxJdFJWTVYxM0JsVzZDSFlQV2VMRjY3VzFWOUFo?=
 =?utf-8?B?bC9wMnZNQTkvQmF3ck5jQnMwZHhGVmNmc3dDN1J5T3RIMVVUWGtaUW5MWjZQ?=
 =?utf-8?B?RVhoS0VQblB1c09vR09DeVIvbmVUclZKSkswZGNYQnhGd2c2NjJEVll3VS8z?=
 =?utf-8?B?VldIekl2bUhsUEdoMWhROHZvQ0E1RTFVb2VvVjF3cnhrT0ZtemJkZC95STkw?=
 =?utf-8?B?Y0MrK01MUGtyL1RvcjFQaFBWKzFIQ3BXeUdrU1lKc1lzUzdCeGRjOHpmVGdj?=
 =?utf-8?B?eUlmb1M1dXpVS05hYXJHbjFPeHlLbHJxRkM1M25NV0lLYXdqTGU4ZnZDUWxJ?=
 =?utf-8?B?TFZ6RHhiNHVuRjV4TnI0bnRuZFRMOWNxUHJjTk9WRUVCdFkwSXRhMG4xMXd6?=
 =?utf-8?B?clV1QmVyeHZTait0NVR2emc1QjdRaytjU2dSemI5ZEpqUW10Rzh5eUNpY2Vx?=
 =?utf-8?B?aERmbll2S0JTTlR6UU1aMXFZVHMvVDRRalkwaWd3UjlXS2dhSzJ3RWt0aENn?=
 =?utf-8?B?dmR6OWVUQktab3RhQkNYUzJrQkRBZ21adFFqY1hOQUc5TjhVZ2gxKysyVURl?=
 =?utf-8?B?bDF6dUkyVXdBNENHVlJCS2VtME5EYlBWUjlkZ0JoSndST3dHeUJVS2xKWmhE?=
 =?utf-8?B?MnJjeXd3SllBcmFta0dDK3B4UGJRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZaiG9sM0AHjB3r+ufyJZAmybbb9GUg2j57hWO+Lg0yHusmYxXEQmhCLl+VWGANF6KsUnBMUZtjlxuU5R49FyQLSRH7zRlPVvRSKD2CGbv0OWuaxLDhid2BaOe9g9S6oOeqExkHdJEbTSzqs/0FulG10eTj9Rpcg8/vC0NTjsUWQUt/b5fYB5KZ1USUpaEq42F2MrPPQZPvAi0yT+WX3ABfbQJbM1eCWvWsh3X6S12hXAeAKoZBgAsvRIfiQCPLo4lvzrScYOYNcyLyk+wyG9JQCV37uot4N09DXCq6upsc4hQ6BMCipNmWLQ/yyg5ezNqSZZ1D2FPcEMnoR/ZjZkc64eRK1qGjP+Hgi89kGP5xel/+pdJ9MeLJEoR9d9ljo1ns+0qGATbT9ykLxOVh0qd5ddBiUc3y218ojG0VEmNbDFvIGuo0qzI4tqb99KsP7F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 21:09:51.4981 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8538d1-1367-4a5e-54f6-08de6043e8af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9701
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC75DBEB78
X-Rspamd-Action: no action

Applied to drm-misc-next-fixes.

On 1/29/26 09:10, zishun yi wrote:
> From: Zishun Yi <zishun.yi.dev@gmail.com>
>
> The amdxdna_ubuf_map() function allocates memory for sg and
> internal sg table structures, but it fails to free them if subsequent
> operations (sg_alloc_table_from_pages or dma_map_sgtable) fail.
>
> Fixes: bd72d4acda10 ("accel/amdxdna: Support user space allocated buffer")
> Signed-off-by: Zishun Yi <zishun.yi.dev@gmail.com>
> ---
> v2: Add 'Fixes' tag
>
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
