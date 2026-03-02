Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCEzCmTQpWm1GwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 19:01:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EB31DE2AC
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 19:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6894910E2BD;
	Mon,  2 Mar 2026 18:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pBie9p+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010060.outbound.protection.outlook.com
 [52.101.193.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCEB10E2BD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 18:01:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgGukCIIT1roTyW6A5hvW6/DK/rcghfabRMf5C86tzb4jWIgdAPPZdApTsxN5oKyOwdEw4RoRkONDV88vogyE04oGm1EIn2uvTu+q47j1IRONe+5c+C4a26DYg3ryebWH5FIMxkpIdwsxYnHE6s90TCH0IAd9sg8KJkXM6dICyALzNTzqxnNfsZFeesTmQTc0Rzu00qJQS9KX+NT/uhqIZEml1bC3bo2cuxUPxtdxZuSZzbxeDxSKUPzoW1zFVZkQ5PXnSPXPIUY8v3sGzHfxyaAL9xMCvGg+0CEJCkxjDpGtJbvs6xAgUXysEFZj5Anit3JKD4gmgdHKQ1f2TNqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7vtAW76nUXeo2mc50MVnhMjempGASAxTS9iWwScyqM=;
 b=PoDfQgNsNlml6YeYxWpp7E7C30Qi3wMCheGTjBi7zTK9o9x1va8VeAxzvYPSY9tsQsGZUPjj8F6JCzT/NzwtaN35NLQqJJbI6YNPnrh5NWUUVf3PLrNd53kavc/zPjc9AQpoJsTC6EDy6U/2l4rKZdAmPk+dV60e7JWhQitOgiODI+Z6P1sAy4M12+vxNVqFk4QTZffx7jIuWW9rJEHu9a6XWuJ3FHq5HjN2vembE+pHXeeg0+0vSukDsds91kVjRCoaspV94KXradlyVsfJfBho6D1GhyH7VD0JagUt0032fViJ13stSE+A56k/QF5vVQWs3heCy/8dTDelnvOxwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7vtAW76nUXeo2mc50MVnhMjempGASAxTS9iWwScyqM=;
 b=pBie9p+Gsqcjkyu4aDLnSKsLMRQsXarNhdIWNjmZV8BN8aKmm1gBPdte0MkgyTxNnEHykoVcVfXQTbsdAHDlbdXYv22u2PrAayBkYWGTeB0KAOvw9TONFTAQUdplGHlXCpQA1eWx7yHbGm+QL/UvqfUa/WuiSU1hF+YPU8UAMWI=
Received: from MW3PR06CA0003.namprd06.prod.outlook.com (2603:10b6:303:2a::8)
 by LV2PR12MB5872.namprd12.prod.outlook.com (2603:10b6:408:173::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 18:01:00 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:303:2a:cafe::2e) by MW3PR06CA0003.outlook.office365.com
 (2603:10b6:303:2a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 18:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 18:00:59 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Mar
 2026 12:00:59 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 2 Mar 2026 12:00:58 -0600
Message-ID: <55df5050-524f-5dfd-f41d-daac769ce8ea@amd.com>
Date: Mon, 2 Mar 2026 10:00:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Import AMD_PMF namespace
Content-Language: en-US
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 <mario.limonciello@amd.com>, <mamin506@gmail.com>, <ogabbay@kernel.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20260301005028.367618-1-superm1@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260301005028.367618-1-superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|LV2PR12MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: d541f31d-4e7f-462a-93de-08de7885a913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: /rlQIKQ8FsS08h34nmIPUunzaGMs00n5pSCZmJTXudV9AwkcsZe34cVBtLv/Z11rOi12onHwZBC4rKZ0Lsu9B8ikZCJ2ZVq9Z1TRhZ0SwKseBGfKXHC7ea0Vvddb+pvo/l4GiSmZJrkHy3wdQFKZOYTCIAggUaF5Vu4xZkyDSiWfhetWuEYjhTcSA6wPCPP18iNe5BW2B+ehSzKad7/PN9osFiWqMOtKixUTykkzzDamQlUI5G7iLYOGHYw41YEpTW3/Vl3bj5rDlbnMsV0w0oRECQroAKn36+e1q4T07jDvO1eNWffINp60JvuD5YgD815CDmu6sEs3WlSCbXkAUFL1ILGEiRLEkOQ5fJCqo5d2X7U0vZjq07X7Ha1voBcMpT55mkhrTDVL8Q4TXkb6B7ei3Jzd0RMIyfbCFe/hlxU4DCrBNDBFtGdvo1jRAx9SyGiPEfziq6lIcmKvJ9Bv8/Ue1HNwS8lKMoamIG7aEG0E/UIb4jU/HmxkQTL5rtGiY1mrD9os7jOCltJ3YcDSTl3VArTCJrTRI/8nFTzmILrqQ9dgDqWqRxB8YZf3nX6aOUuYG/+fo9WcYxXK9JNFk4N7GcEC/joApHp+EKor67WyWq9x0R4fBg2fmtSU+7OOhT1oxgCgrb2o3rRRiZhcEJH3WIo4zd/SabjOkn2DpzqJITxM/M10wsvt6wnGAArxIW/0q1kYQ+aWIpVX1sTDq2StJB3gsPqeOdag+EDe8wt2vupk2UmNXoF2wz4CooFILDbfiw/Mo0XmUAdG1ouDxFdWtI1T4eksNxqMGIeFCGSkB9wLj7O87AszwuFOcNPbVPed6G1q4jFRn6smUAMMIA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Hu4/3dZjGM7Vn5fq4qEC6VeSQop5Q0IRRLVgKaWqZMDhjIsXyzK+eYwPH4ol7KAdVVE5yq1vTaootFgRcMNVU53KQKiXEI6OKfPFfeiUhsyfLQehhhymqmhGzkh71Q4uEDEb0yrXvJZ3PG4Jh9T99nCOb07vEcmlCO2RQrOLPgwVpgNV36pRUPLGjC0BFwP+XHs9hWxmGAUeupQbD+nZmCW93+4hHxbgxDC9yLoaRJMtT5wfVdyMH393a6/tv6aamIYCbVrkSNQwyq4tJjj9JJ7zWpnaTWloitHPFaNuSMrSFLEySM6m1Nhsdlea9XsXINFw0yY4o2Rxmok5OhQPjwkC+jTaTQMZsdC6p69Lo8qcFBUmM9EtV4exj34onywtHmJuAoTI7dn5ysfhwsyLnK2NCC7G122B3a/o3HS72bFAYNj/poU0/uaacrZKFUFg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 18:00:59.4979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d541f31d-4e7f-462a-93de-08de7885a913
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5872
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
X-Rspamd-Queue-Id: 63EB31DE2AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:superm1@kernel.org,m:mario.limonciello@amd.com,m:mamin506@gmail.com,m:ogabbay@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,amd.com,gmail.com];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 2/28/26 16:50, Mario Limonciello (AMD) wrote:
> The amdxdna driver uses amd_pmf_get_npu_data() which is exported in the
> AMD_PMF namespace. Import the AMD_PMF namespace.
>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 98720ddc9818e..d6d12355bd2b7 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -359,5 +359,6 @@ static struct pci_driver amdxdna_pci_driver = {
>   module_pci_driver(amdxdna_pci_driver);
>   
>   MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("AMD_PMF");
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   MODULE_AUTHOR("XRT Team <runtimeca39d@amd.com>");
>   MODULE_DESCRIPTION("amdxdna driver");
