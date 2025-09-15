Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA3EB58615
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 22:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA6710E0C6;
	Mon, 15 Sep 2025 20:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ws4d6noe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013038.outbound.protection.outlook.com
 [40.93.196.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FED10E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 20:36:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiXOPaqi8ecfyEN6D71gdWEsU+X3XVl+cPlWK8h1+vfppZ0FmlxYFse9ajpnGWK0U8eb5kuxv1aPQDFhink9B0lTLfcNNL54P1V6EFN9z22uDyaG0k/PqkRlyuhg1VnYn0IFU1dW+PNMLo4z0tD1VtyafpH7GOiFjhR9feGoI7ppKo2xnJcgtBz2H+Cl2fZrBVmGm+YYCdBoRbxv8g+2TnteFaRCZ6mXVQfjr5Rb/O3HRwhSCNDdFglqlNqL2KO2Wj5fcmIw7RzDEYIYTxvU+XmRVrJM5LCbid7gCIKOZp109Yg2+EB0/xyV/EIQ6d5LVwx9tlKvzoR4LXYS4Prtfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSSc/PUTmSUuTG1pRM3hD729GkUIO0IHF5aUe8KBlM8=;
 b=PmMDaSPtoLn/gX8teDHtMQDb/VRYiRajcObHhRWS40Vd3AHz3NlJqs7npXNzpD9eXgL7UauuJdIf2CmAgi7oQcH5ElWrDIdWppUVbAKobtKcjA6TnoNvFMdpsTguYq0jF/825AM2HKo2Zpc5WaZnjd2moW+e2LcQmrtRbXvMoMY1dbTx6h0wTGuT6JzkFsJaLLCzNYdUNsDhSB32QxXL/ShlKvfvLAW+QHX5bA4kXUrmHK5r+1zSDTyRtyca78Yx80Ob4A3pxnbJpbSrfgE0lGmixzJAkIcL83xa1nVMza3z20cw5LgGHbJhedf3v7KOqUpBvK9sylKDJHMhymgSzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSSc/PUTmSUuTG1pRM3hD729GkUIO0IHF5aUe8KBlM8=;
 b=Ws4d6noepak7x4m7yxMWEVeI63jqbEuB+qnBvYmRJHXGAHkrr4w9V2EckH/f0BRib5+lPN6h8hvICyqT39zEZbSX5xPkYciIepeZ9bcfyB+eMBbzhTnjG00eELF/owvaabe7QT7cJk4MzqQbrtuFcQvsGMX3BjHGLuhLBaHg7Y8=
Received: from CH0PR03CA0371.namprd03.prod.outlook.com (2603:10b6:610:119::19)
 by CH1PPF0316D269B.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::604) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 20:36:34 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::db) by CH0PR03CA0371.outlook.office365.com
 (2603:10b6:610:119::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Mon,
 15 Sep 2025 20:36:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 15 Sep 2025 20:36:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 15 Sep
 2025 13:36:20 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Sep
 2025 15:36:20 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Sep 2025 13:36:20 -0700
Message-ID: <4480b307-ea4a-edec-f2c6-e271c23cc05b@amd.com>
Date: Mon, 15 Sep 2025 13:36:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Reset cmdq->db_id on register failure
Content-Language: en-US
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jeff.hugo@oss.qualcomm.com>,
 <maciej.falkowski@linux.intel.com>
References: <20250915103421.830065-1-karol.wachowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250915103421.830065-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|CH1PPF0316D269B:EE_
X-MS-Office365-Filtering-Correlation-Id: c0441785-bc5c-4bfb-aa82-08ddf4978f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnk4OW1wd1NVR2E4ejdTaldMK3d1MFZ6VEJETzVnVUtDbWlOL1IxS0pCazYx?=
 =?utf-8?B?NnpGMzVBS1pEaEMwd0xCOWxjNkl1S3Rkb0lqQVIvOU9HUTZXV1VyYmtpUVZU?=
 =?utf-8?B?RlJjNUcvaW5TemV6eldBOWtZZmR4ZkRkdFNkaDVwd096WnJTUEF2VEtaNUY3?=
 =?utf-8?B?bVdpQ1JVd2ZmdVVhSE5IWVJ0L1p0WWJWeWsra290ZEFxSUtHd3hGNkt6SXJq?=
 =?utf-8?B?L2JMSGRCK1Y3M29TYzJoZjMrSnZxOEY0cGFwWHhOMUdIU0xERFZ5SjJ1WFNp?=
 =?utf-8?B?S2xoeFRSVDB2RXREdmRWVnhabTJoZU1lamlTWmtqMUx6S0NZYk5XdUoyWFlo?=
 =?utf-8?B?L0RBWmZhQU9rclMwK292ZGFJMlZaZDdEa3dubW5ucWxKcXN2K0Jqbkw5dUV1?=
 =?utf-8?B?ZGJadUhNWlNlR1pPS0RtQ2FOZS9LR2pWMTdjL3k2YTBLWDI0WE9HMkhGcURO?=
 =?utf-8?B?ck40SDluUHNFMEtnd1QyWWFmUTBRaGhLTE1FSVQ4YTk4RVBKWGdLbmRXWlpy?=
 =?utf-8?B?Wm1iMVV5VVdieUVXcUNodHpBQTdNL2w2bWV3Rm51dG1CR0ZQNlpRWlgreExK?=
 =?utf-8?B?WTJqOUttNEV4YmZJUms3NkluelBVZStBOG9FYkJhUDFLdUtqaVZVUXIwelg3?=
 =?utf-8?B?VDBaRHZOR0NrMXZ5bWd5ckh0SHdMc3IySSt4ZXZtM0poOGJVVWZ4bHlCSFpG?=
 =?utf-8?B?djZqZjFiN1JxdEVuc3paWDFJTmJkdVRla3BrYkxTVWR6aEtDUmlHcURiVjNo?=
 =?utf-8?B?UFg4Q3QxQ0lpNlA2UjU5ZzVVbm9KQVV5SnZQQWxBOWVZMlJoaC9FN3dJdG5B?=
 =?utf-8?B?MVc0NWI0eVhKeFdla2F1ekcxWlNSaUN5WVpyU2JTRmFnbElGUldlcm1vMkV2?=
 =?utf-8?B?YTdrY3NrbEc1Q2w3SFd6bVVsd0RVeEo3QklQeWwyaGFqNnNER2l0c0hySndZ?=
 =?utf-8?B?MDNSNjRWK0RseXhhQ3NRZG9kYW9RSzlwMHg4RC84NlhvOGYrQkJYSDFhQk9G?=
 =?utf-8?B?UmI0TmhRWVpYZ202TkdFSXgwYzBtVmJOOXoxY1lFb1NQcCtqaHp3bGtlZVVH?=
 =?utf-8?B?SGljYVNhMTJSZ0tHdXd2ZCtOaG1UQTk2MVR3K1p0aWo4NHJ2STRrS2JyL0I3?=
 =?utf-8?B?Vnd0T0lvaUgxYURiUzZyK0FxOXIyakh3aUV2S2pBZDIzamRqZExkbCtLbHY4?=
 =?utf-8?B?SEU4NzJxOHNTQUhMc2pkSklYclFJaHJWNHJjQTIyaWhIa0phVDFZMGloZlpB?=
 =?utf-8?B?N2xTNjJFUmVhTmRMWmZXaldHM0REanE2My9PVGl3R1UvY1hjMXE3Znp5ZHVP?=
 =?utf-8?B?bkI1aWJQM3B0NHJZSEY0L3hvSGFhK0MzT3ZMMjFkV0FpdGxPY3cyY2dmZVp0?=
 =?utf-8?B?Mk0zcktodDBadG1nSmNFbDNBdzIvRDZkL28vL042bFlRaGNNN1doZ0ZxU0dp?=
 =?utf-8?B?bUZoZE44Y0F1eWJwOTZzcTFnSlhzTFhOVXFwRFg3YW8zenZPRmN1QXRSSWNZ?=
 =?utf-8?B?VWJ6WjFtRUxTd2xHUUI3TGZYYW00aUpYMnMreEVUUnBqVFlVRUUraUVXRVFL?=
 =?utf-8?B?bEd5TzFIQ1FpUlBleDBWclhzcXgrVldYOEFhRFRmR1JCZlM5anZxbElaTnU0?=
 =?utf-8?B?cUlzOXFLczdKQmhxampGNXBMc0g2RnNVV09XOUNwb2ZueXM5a0twQUxqdEha?=
 =?utf-8?B?V1Y3VDk1MFJRWUxnQ3JnbC8yYmFQSjk0d29ac2VtTlhqYmVjeTA2Wk96Q3FL?=
 =?utf-8?B?SVZTVmVFQ2FjcFhGS0ZvWlFuajBJZlpGQ0FseitrSzVldW53ZjVwelpxOGZm?=
 =?utf-8?B?V3F2b2FEaUd4V293cFo1a1crVEFTS3pQNG9zbFp0SkMvclJQZUhsb2ZPMTh0?=
 =?utf-8?B?NXYxWTA0TEJTYTRDTkpvSXBDMm1DK252MEg0RklRcW02bXBvanF2TnRuNXAr?=
 =?utf-8?B?d0JDbHdWN1FkcjEySXllM08wT3BxUW00akV6UEQvVkJ2V0N4OEtGZms2bytE?=
 =?utf-8?B?Si9iSEZOQ0FJTGtCdVZrcUszVUJFU2xsRDI0ZFRHcmQ5dWQ1YXpyS0hrR0pI?=
 =?utf-8?Q?WJbPu5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 20:36:34.1999 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0441785-bc5c-4bfb-aa82-08ddf4978f97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0316D269B
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

Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

On 9/15/25 03:34, Karol Wachowski wrote:
> Ensure that cmdq->db_id is reset to 0 if ivpu_jsm_register_db fails,
> preventing potential reuse of invalid command queue with
> unregistered doorbell.
>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_job.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 060f1fc031d3..fa1720fa06a4 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -219,11 +219,13 @@ static int ivpu_register_db(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *
>   		ret = ivpu_jsm_register_db(vdev, file_priv->ctx.id, cmdq->db_id,
>   					   cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
>   
> -	if (!ret)
> +	if (!ret) {
>   		ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d priority %d\n",
>   			 cmdq->db_id, cmdq->id, file_priv->ctx.id, cmdq->priority);
> -	else
> +	} else {
>   		xa_erase(&vdev->db_xa, cmdq->db_id);
> +		cmdq->db_id = 0;
> +	}
>   
>   	return ret;
>   }
