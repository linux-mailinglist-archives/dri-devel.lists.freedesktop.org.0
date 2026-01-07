Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1E8CFF567
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B455E10E063;
	Wed,  7 Jan 2026 18:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F6HM8Qjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012012.outbound.protection.outlook.com [52.101.48.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853EC10E063
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 18:14:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUYsvPs3K/0sIkraSVMppLkcdDATVttv3fk+csbmOvMs9rmbzToFCKtf+KqyYmIG70HntEeA8b+/Lu+iHU/BjshUa/8fLYX7RnUh3Tr9vbo3iNrrSC7TzCJeALVXtQC20fWK8kGOSQlAvxuqK7gFWwVZCha9U4ejepY5N2yXmQIMU611DkarOgxqP/Eqr7VNy9R3yPnyhb8yIkwq3le+kYZiC57wB8M1itZiG7GeHuQxm9tpFMjU9vuydTr5OKW95uYHhSRsayEHv2x3BKzONAaDTTlL1nJnUpGUlNenzUOXsO3GP0epsWea5JQezo9/UdzQPfWIL2TLKWNDVh3Law==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdKtjsX9DkPuM6PZ9X6EPxLF+GperuCI/OXazTocsT0=;
 b=E6du4B/W+vefI9H8qnGE/rvAA1HGKvQ01GQotnAdzRagjMkRNB6h4nnXQOar0sqtiGGN5m/qma1M8kL+BOxpwLh5sHB8TgP7t0ETcvHFDASZKczj7TjTAlpXIXGeuo4vghXTdRd391m/pA829kFhkAwecA3btEupVJrcEcoAkaD4Iqec5yEbyj5HIbAHMjmmRNbzYE5VytPWMEvQ4hfxWjEhUoubkD75h0VQgVQ9zkDjc0C9HzOEjEZSOGxXaoy1B+R8IW5kKzmfURB7OEHiUy6iABUJ1/6hJ+rF26k5FsIvSCAycV+J1olKCDX49EQF5ZTjtDtPYxafxeZVO26vag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdKtjsX9DkPuM6PZ9X6EPxLF+GperuCI/OXazTocsT0=;
 b=F6HM8QjtqALphjUDbZxru7Mdb7QKgiufulZ/CfVMkfeC3dlas1A80jkFKS5NLt7Naf0fqXUD7D3Vr4Yv+rISWqT2c1Xi6mrxw1Eb7S7mqQC02X4BrFUNBfL2hMnW+y8q5mL49OF5ADflcLWadJdoe/ORzUtOPbCZMAUHjZGN8Zg=
Received: from SA1PR04CA0008.namprd04.prod.outlook.com (2603:10b6:806:2ce::13)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 18:14:33 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::89) by SA1PR04CA0008.outlook.office365.com
 (2603:10b6:806:2ce::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 18:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 18:14:32 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 12:14:31 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 10:14:31 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 7 Jan 2026 10:14:30 -0800
Message-ID: <c0d07081-cb27-6c2f-604c-00f6f526a0dd@amd.com>
Date: Wed, 7 Jan 2026 10:14:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] accel/qaic: Handle DBC deactivation if the owner went
 away
Content-Language: en-US
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 <jeff.hugo@oss.qualcomm.com>, <carl.vanderlip@oss.qualcomm.com>,
 <troy.hanson@oss.qualcomm.com>, <zachary.mckevitt@oss.qualcomm.com>
CC: <ogabbay@kernel.org>, <karol.wachowski@linux.intel.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20251224143009.2769836-1-youssef.abdulrahman@oss.qualcomm.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20251224143009.2769836-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f791886-3e23-46c3-4d11-08de4e189b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U25uamQwaWZuSURWb05VSUJ3RFJkRFdseWkva0Y0WC9uZXJTcnd6bm82RVIw?=
 =?utf-8?B?V0FzTGw5R0lvL1U0MFhRajBoN0xUZnNNdkNibTgrWEpXeklCNUpQc2t3eFk0?=
 =?utf-8?B?cDc5R2xmd3NKQnJUYlNDOUljZVVnUWFNT042THZjZWYzd0NLZE01SEpUN2F5?=
 =?utf-8?B?R3NJNkFJV2p1OS9UZTJUTXZnVEJCN2tWVW50UEt2d3dKenZUNldnSHpmRUdS?=
 =?utf-8?B?M1ppOWpqcUtkWWs4MjZERlJ0SjNHSnR3VDY0VW9vR0lmYS9neUpMb1dsU0gy?=
 =?utf-8?B?bis1elJRNGNseVZwR1hDUHRzWk92YkVLZjBza0N5bG9MamIyeDZqSkhDbEZn?=
 =?utf-8?B?S3djNGJVRHptVURRaXh6MjNJWEE1TmorZnhiNWg0bkxUek42R0VYWS8ycjZj?=
 =?utf-8?B?bFpqVGZZb0dPd1lmaExTTWp5Y1phRFlRdmJZK1NUQUJRWUFTQ2c2MDJ5d2Na?=
 =?utf-8?B?Z2JnelhpRlphQzFBM3R2QzBENTJjRjNQaDN3ek5jM0xuQlpaVEg1MEJqNG5M?=
 =?utf-8?B?SkY3dTkySmNzcUpySVNKYVVEd1dMTDRDaDZLUlhNSldkaHRxODczSGx0TUR3?=
 =?utf-8?B?UkNIRjJUOHJ1aTJlV2NkZzJ2QXpTM0l4RTU4aW01S2VYY3NiazVoY3ZvTHp0?=
 =?utf-8?B?Vll4TXlzMC93RStOS2oySy8wUTJ4T0JPZ2xuZFdDOStPWk9jNUFxVGJWWjVo?=
 =?utf-8?B?b0w2N3VCYmlXMDNXWndMY2IwckR1a3JJVVFnTzFDZ3hwVnA1VmlpenMwVXBz?=
 =?utf-8?B?T1NjcFVzaC9hTElwVjN1VEtSM1I5eW1FOHZPdU5yUmZ6STRMYWYrMnlRK2pX?=
 =?utf-8?B?cWJXRVBmRkJSWGY5WHJmcHN4aWwwc3VxNUU1SFNML3h2ZVozWVBSZEZkOUNj?=
 =?utf-8?B?Mi9GNWlJSTR1UkdHSGFxck54SHBxa1dmbFlMQk1TamMwVWEvYmhPd2V2UkdN?=
 =?utf-8?B?dlZtbkVCOUJGUlU1dTl3NDhWVndNam1USTArTmd2TVpObUw0dXFjSmwwVEta?=
 =?utf-8?B?Skw2R1ZZMXVDZU9uYVo5M2pjTkxTK25kaHZCeEVIdzRhYnRHRG1xTkdPWVFE?=
 =?utf-8?B?UTk4aDJVd0FxdFlNa3JNczdmTXY4UXgyTzg3a042L0hweUllVTZRald1NXFt?=
 =?utf-8?B?bWNSR3dUK1NaZVA3eFZPdlVSZ212c3dHUkM1QWRsM2xLOGViSE11Z0taN3Np?=
 =?utf-8?B?ZWhyWnpsbk5pVTdNSnY1ZXNIQS9WNjFRelhxamt4M1pVMDc3NTd2RXEySVQ3?=
 =?utf-8?B?MS84dDkwcUw1bHFzS2JDUlJvRFNPWkgyRk52alBmV3lTTGlSZnJySXpqOWI4?=
 =?utf-8?B?SlNFQW8vQ0FMSlI4T2V2NERLS0tGWlduaC8wUThTWm9ROVZqWlc0aWdiNkcw?=
 =?utf-8?B?eWhJQzI4eFE1L00ybTNKMmlDam42UkNJd1FjNWhJc21ZbTVIM0pPbGk1djYx?=
 =?utf-8?B?c2lWQTNsd01Zck5oZVZUeWFSaE9uZHNqN1FVbTRwZnd2cm1XUW8ycDd5NmZz?=
 =?utf-8?B?L2RWT1VoNWFBOG5abE5vRUQyTjkramdtY2dTRWJGNDA0VHFjemJTRDB4b0h1?=
 =?utf-8?B?Q0w4OCtmbWN6MzhnbjZmSXcrdUV0R2xGNEdoTWJKb0RhT2Y2cWxFUzNROXEz?=
 =?utf-8?B?enlGMGlNNHM4RVdwSUlIRG1PTDJRYWJVVFVUdFF6Nm4wNXR4bWJiY2t6MGJD?=
 =?utf-8?B?M1gxV09uUDUzRThBdUhTcUt5RVZtcXFqcWtOdWw4WWdkYXNmVzJVMmhER2Vr?=
 =?utf-8?B?bDcrZng1Y0ErV2JYZkVZa3RWT1lQQ2kzVmtlVXBybVpJN2NUMWNCVjhBV1BS?=
 =?utf-8?B?YlpVR3BsSHZwKzNSRmZrOGhiZTNoS0k2N2R3S1cvbjlCcERzNmpxeFVKd25R?=
 =?utf-8?B?UUJ6Z2RxTjNEVVRpMWNJbWZRYnhTYndyOEhoTDJmZXVFL1pRWmFLYUZ4YTha?=
 =?utf-8?B?TDZ1VzZzMmJaTTUxblJ6NnMydXhJQ2RCcE81NG9DREpMTHF1QlpZRWlmTEdt?=
 =?utf-8?B?L3R6U3VaSUFzRjlxZnFJUlhiWjlaaUFFT1VjVjRLWGRrMkxUbEp5T081SW5G?=
 =?utf-8?B?c2NnYjl6ZUhyaFMvVHFXanJER1lLNC9xM3RDdHh4UC96bzh0a1hqbkYvc3gv?=
 =?utf-8?Q?zdoI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 18:14:32.9097 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f791886-3e23-46c3-4d11-08de4e189b97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313
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


On 12/24/25 06:30, Youssef Samir wrote:
> When a DBC is released, the device sends a QAIC_TRANS_DEACTIVATE_FROM_DEV
> transaction to the host over the QAIC_CONTROL MHI channel. QAIC handles
> this by calling decode_deactivate() to release the resources allocated for
> that DBC. Since that handling is done in the qaic_manage_ioctl() context,
> if the user goes away before receiving and handling the deactivation, the
> host will be out-of-sync with the DBCs available for use, and the DBC
> resources will not be freed unless the device is removed. If another user
> loads and requests to activate a network, then the device assigns the same
> DBC to that network, QAIC will "indefinitely" wait for dbc->in_use = false,
> leading the user process to hang.
>
> As a solution to this, handle QAIC_TRANS_DEACTIVATE_FROM_DEV transactions
> that are received after the user has gone away.
>
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
> Changes in V2:
> - Add missing closing bracket in resp_worker()
> - Link to V1: https://lore.kernel.org/all/20251223153151.2232297-1-youssef.abdulrahman@oss.qualcomm.com
> ---
>   drivers/accel/qaic/qaic_control.c | 47 +++++++++++++++++++++++++++++--
>   1 file changed, 45 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index 428d8f65bff3..53afb647ecc4 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -913,7 +913,7 @@ static int decode_deactivate(struct qaic_device *qdev, void *trans, u32 *msg_len
>   		 */
>   		return -ENODEV;
>   
> -	if (status) {
> +	if (usr && status) {
>   		/*
>   		 * Releasing resources failed on the device side, which puts
>   		 * us in a bind since they may still be in use, so enable the
> @@ -1108,6 +1108,9 @@ static void *msg_xfer(struct qaic_device *qdev, struct wrapper_list *wrappers, u
>   	mutex_lock(&qdev->cntl_mutex);
>   	if (!list_empty(&elem.list))
>   		list_del(&elem.list);
> +	/* resp_worker() processed the response but the wait was interrupted */
> +	else if (list_empty(&elem.list) && ret == -ERESTARTSYS)

Rechecking list_empty(&elem.list) can be removed.

And if ret == -ERESTARTSYS, elem.buf is not NULL?

Lizhi

> +		ret = 0;
>   	if (!ret && !elem.buf)
>   		ret = -ETIMEDOUT;
>   	else if (ret > 0 && !elem.buf)
> @@ -1418,9 +1421,49 @@ static void resp_worker(struct work_struct *work)
>   	}
>   	mutex_unlock(&qdev->cntl_mutex);
>   
> -	if (!found)
> +	if (!found) {
> +		/*
> +		 * The user might have gone away at this point without waiting
> +		 * for QAIC_TRANS_DEACTIVATE_FROM_DEV transaction coming from
> +		 * the device. If this is not handled correctly, the host will
> +		 * not know that the DBC[n] has been freed on the device.
> +		 * Due to this failure in synchronization between the device and
> +		 * the host, if another user requests to activate a network, and
> +		 * the device assigns DBC[n] again, save_dbc_buf() will hang,
> +		 * waiting for dbc[n]->in_use to be set to false, which will not
> +		 * happen unless the qaic_dev_reset_clean_local_state() gets
> +		 * called by resetting the device (or re-inserting the module).
> +		 *
> +		 * As a solution, we look for QAIC_TRANS_DEACTIVATE_FROM_DEV
> +		 * transactions in the message before disposing of it, then
> +		 * handle releasing the DBC resources.
> +		 *
> +		 * Since the user has gone away, if the device could not
> +		 * deactivate the network (status != 0), there is no way to
> +		 * enable and reassign the DBC to the user. We can put trust in
> +		 * the device that it will release all the active DBCs in
> +		 * response to the QAIC_TRANS_TERMINATE_TO_DEV transaction,
> +		 * otherwise, the user can issue an soc_reset to the device.
> +		 */
> +		u32 msg_count = le32_to_cpu(msg->hdr.count);
> +		u32 msg_len = le32_to_cpu(msg->hdr.len);
> +		u32 len = 0;
> +		int j;
> +
> +		for (j = 0; j < msg_count && len < msg_len; ++j) {
> +			struct wire_trans_hdr *trans_hdr;
> +
> +			trans_hdr = (struct wire_trans_hdr *)(msg->data + len);
> +			if (le32_to_cpu(trans_hdr->type) == QAIC_TRANS_DEACTIVATE_FROM_DEV) {
> +				if (decode_deactivate(qdev, trans_hdr, &len, NULL))
> +					len += le32_to_cpu(trans_hdr->len);
> +			} else {
> +				len += le32_to_cpu(trans_hdr->len);
> +			}
> +		}
>   		/* request must have timed out, drop packet */
>   		kfree(msg);
> +	}
>   
>   	kfree(resp);
>   }
