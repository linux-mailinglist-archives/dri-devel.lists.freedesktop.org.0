Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK6qL4yXe2nOGAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 18:23:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F23B2CAD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 18:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95C510E2AC;
	Thu, 29 Jan 2026 17:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XksQtNYj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010036.outbound.protection.outlook.com [52.101.46.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7D410E2AC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 17:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t96+pgtpi5t6hzs7N3DYgPdvvC696XXvgwNj7pSCXN9CQ3CftnNSLKRHb0ZyeXxGFoMhNu+fyFNcsEIuUV7Q1Axf68+dypOJCkAKCrIfgqauOOXGZTKHPlSuonh+sCOK4AhWsSzdg0W5oBxnCv+9kt5uY/zI6LAcNPE/EC2EFRFY6P+4U+ENpVCH7Q5hJrQzSe3eeBzxneHetj6D1hqtL/PY2+vQl+iX699DlqfjZdFHxUfhdDmJSzOKgfkmYjGnPBIU5C1nw+XYViMsvSKP3qffhDE2u7bcRYE4RRejgxDCZkWMBAt4a3wBtW3XfXKDkXjONABcwA09ic8VdKEaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Wpt1rVjJwSPYZiX7VloqesBWKpQIINR3CogqbP6flg=;
 b=XEiDHkRJoTrlsWaMXlXDyMJwq+OmBWMqBMV12/jokBDYVauF/8c0pY8Bm+jnO+L+yeGJpdHxBt5GPeK30TeUG3Bmkk4NZHGqEAWjx+0cfkQ7XpkgEnvjYwA0KmBZJ8aOjIBPJEr+10BHoconSHoWW3TmYPtVfBMjDgPpvBSTzthOJfIj9k9BnQhdYQI63MPMnT0ixwAk/eEyHArMtNTvsU7tRO2zM58+SomIxiY5cY1zyfIzcEPbxkkXgDETYVdMArGNzQpsall6CdtCllL6f8ASFuYaQpViZ0kj8enWO8nomkvKsMKheLWddK2G8PcfjKknMRmCthGU57XkhYCMUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Wpt1rVjJwSPYZiX7VloqesBWKpQIINR3CogqbP6flg=;
 b=XksQtNYjcxEPFOZOej4vW2/ZOOBVh5rQYu5KO73QWkm5BgU0Wpcsb1wSdQgYqh27PK+hrhYMSWhOt97QYqj1Nn1XD9gOaC/66VaDaWvI+hJbltsZi49JdyFy+AuuFSKHHGBrF3FgoJMmAdw/nx1aYUYdjki8Ol5oMuoT/s5MR0I=
Received: from DSZP220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::11) by
 CH3PR12MB9393.namprd12.prod.outlook.com (2603:10b6:610:1c5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Thu, 29 Jan 2026 17:23:13 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:5:280:cafe::3e) by DSZP220CA0010.outlook.office365.com
 (2603:10b6:5:280::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Thu,
 29 Jan 2026 17:23:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 17:23:12 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 11:23:10 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 29 Jan 2026 11:23:10 -0600
Message-ID: <347444fa-6278-5ce1-ab6a-68fbe42b938a@amd.com>
Date: Thu, 29 Jan 2026 09:23:10 -0800
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|CH3PR12MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a5bac0-58e3-4143-0395-08de5f5b14d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFlraHg5cGYrVFM4eTVaYmtrYjhweGE3ck84dFh6TjQ1a2IveTVBMDU4blcv?=
 =?utf-8?B?eVY1eEFsMWo1TENBbzZpL0h2ck95MktuYzVxSjIrd3c2NjF4NnhUYzRzbm0x?=
 =?utf-8?B?UFpGSXpSKzBQU0hxZmJPNlZLdGFBK2I3TUh2b2ZPNmdnSFpBb0x2NzBjUHQ4?=
 =?utf-8?B?WWZTSXYvTlp0SEkxM2dXaFBUUm1HZUs1M21QdkZxVjZXQTZDdnJoZ0FGTmdq?=
 =?utf-8?B?ejJFNmpXU2dPUWk5UU5sYzhvREQyOU9peUxhN2dYdXM0ZXFINEpzcEQ4WlZr?=
 =?utf-8?B?VGJCMDQvcFpzczlRVjR3SWJPaTd1djBwNmVQQUhNOHNXcUdiNlJGWSt0Vytl?=
 =?utf-8?B?b1hOVmtQTHNjaXF4OTJ3bjAzRnJMSUJRT1VrK3FCUHpINzg1bDRiMnFqSUx4?=
 =?utf-8?B?YlUvellHOFBTZDArNnBQcXRGWnlrNDhJd2VLdVJ0RUttSFVqR2tyVTNXcU44?=
 =?utf-8?B?SHFRRENnOHZxcmJDNVNQKzNmVG0vMDJHTE92VWVqZzVuKzlIZzdhMUdOaDhF?=
 =?utf-8?B?MkdBbkpzVjhVS0laenIrVU1hbE5oelBUeFVJN3RVcnlBNkpNRkVPMGV0VVQw?=
 =?utf-8?B?RURZVGhwN3JDdThBZVlzWU5QbGVha2xtSlZPemJtM3FVUURYZFMyWFNrcWk5?=
 =?utf-8?B?K0ZiRHBMOUFudExHdmNZaUpScm1xZ1h0cldhdGczUXNRcnNiZ2NQRW5MZ2ll?=
 =?utf-8?B?L2UweGpPZUtJZFl5RjY2QVc4dWVMb1N3SE9KeFcrQzFBcVpsM3RiWWpZVmU5?=
 =?utf-8?B?b3NxM29VbTMvMXFwQ3JLRlIra3d0TUNDNDBSUkpkaEs3MHdjQk0zZ2MreEhF?=
 =?utf-8?B?SUFNZXRCZU5zQ2h4UHRsUm5yZEVnQkhQTlRnRVRiQzlvOUxyYmExSms5czlm?=
 =?utf-8?B?VDBDaXRIZzNCUGpJaS9JRVprc0tNWnF2WjFHOE10QjRkR3RWbEM0Rzcrc2ZD?=
 =?utf-8?B?NU16SzQ3VFFpNWo3OW16OVpnNjFGdGhSeHZ6dUNSTERiT1RobkxVc1RtMzR3?=
 =?utf-8?B?QTVmV09nczdwVU1odmY2cWk2U21JOGl0SW5XblJjZ0t6TFJmaHBzby95M1Bz?=
 =?utf-8?B?WGhSc2xBY3RVOGMya0ptRTFleUgxakxteExlelBmKzRpU2E2TWJrMXg5RkRT?=
 =?utf-8?B?a0xicmU4ckVPMHFTU0k4dFpPbXZkWkNWc0FuRkVkeUcwSWR3OFBZY0EwTWsy?=
 =?utf-8?B?NDEyMFZNUzlKMUdkQUV5ajBqR0JmUVBMZTNFOXhhLzFWWi9TVVJNQmtJVEhy?=
 =?utf-8?B?ZVk0U2h5TWEzNTZ2bE5TcUFqbFpGWElUQlEyZXYzRkpGSzIwREIwUXprejc1?=
 =?utf-8?B?blVUYTNGTUdZNmVNdEVzdmRHS2h0eUtCZDFlSU5mZFcxYlZiVUxVVW9rL3E4?=
 =?utf-8?B?UnF3d2VxaEdYdVdIWEk1KzBWNzNrTFA4d0duRTBUdC9QVlY0bWlucmZCOGZD?=
 =?utf-8?B?WE9mbVhWeEM1T3RCZ0cyUFpVcHNzNHpEejZLVEtFeStYWnF6WXBvVFJnSUdC?=
 =?utf-8?B?WjJMYUtJeTdpVTZSM1gvUWNvY2RRZ2JiZSszVDZuTktwbEhVYW03alM0UWZE?=
 =?utf-8?B?eUcyVXA0N29oQUphcFpVMTIwbDVWdGdpMlFkb1FSeWxpY3psakhqdStocTM4?=
 =?utf-8?B?eWh5eGsxZmxBS0srZEdJRFpIaW8wTlV3VXBOV3hwYlpOMldldlBkYy9Ka1Q5?=
 =?utf-8?B?dG8ydjJzWW9mODY0aUk4L0RCcHJzQk55d1dPTlZRQjJCaE5zanNMMmRidzA4?=
 =?utf-8?B?MjJ4SEdCNkJrbnFvQ0o0M1FsWEdTankySjhsWFE3RkY5OU5NMUNPVUNXQ3B5?=
 =?utf-8?B?NW5BVGtLUnpDaTNsaWM4NDN0QUo3djBuUnVSaEp5RldWUVNBdnhrdi9paEF5?=
 =?utf-8?B?VUNjb04yaXc0bTZLdHlhOFNOZFFvcEhVUDU3M09NSExVbS9HYzdDUXFpbHI3?=
 =?utf-8?B?cENFanp1cFpKYUVWcG5QTHNaM0dnUEYvZ0d5Zng5VTA2dUZnTHpuR2xDM3Zz?=
 =?utf-8?B?dzJFeWtlMndyTzNNaENUSzVTQ1V3QzJOU054aDlTMFNVTlBmQ1c1WVJ5QnI0?=
 =?utf-8?B?SWpWUXJkMXl1OEFiQlM0MUg3WWdTYkZ1Rld2dUFJMlR5UThFME5rUXZ4Lzkx?=
 =?utf-8?B?RTZpNm5OS20yZHpCVFZuVDBrMTJkcUM4OXBwWVJ0bE9qc2kzZG9CMDBuNDVB?=
 =?utf-8?B?c3MxcmNvUjlHcCtHeUpMenFEcGQxVnEwQ08vR3FJQzhmVVQ1SVZodFJrU253?=
 =?utf-8?B?Tm5FMzMvY1JzRTlqOHhBNEZjek1BPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ci4YnVbMWnrc8QkgC9df0j08yQHjU+6qI4q9ttvSew9ZKzno/QKxLQ+sOVKoM+sQCRkrdsYRyN/uKWtafX9777751PWOknFyZBavBYfu0sJrMKlrArxaeK/phlMHDOmTdv2hlXLK20kpMfBcCG80BiiuLb9UWJfvSyLGTFHEKgpv0TfqftoknHO9sNQRH9aimBHJpUCgmEGAlnNemMC/1Us7xx1rflCrddtiyZ1+0y6wdcXrOHgGymFNS/P2eSbox8N7w2aJtsz4gAOMkcTIaslM+nFrAEWv1UDkrWVZQYlLsM1UsOlRM17rCgVLSMtxKeX/qIcI8segtWzeMhSxtpc2lSMg5BwxliTe0tlwN6gbxKpBK4gUnNUXZW1fNEQ6LZetAGuVw/AvUCBcQjTdjUjSWMgAx7lZp7Hic/ChBXJ2c/vydzyJwR64Nzi5t+Jw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:23:12.8424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a5bac0-58e3-4143-0395-08de5f5b14d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9393
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34F23B2CAD
X-Rspamd-Action: no action

Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

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
