Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EC0C58C86
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A461710E8B9;
	Thu, 13 Nov 2025 16:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4mwiWk6d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CA610E8B9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 16:39:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5DNrGO0Jtmu5qUkiPD9d56zXTty39D4YHZR05MkVD7/apgaQt34Azt8CaAWUNyogIzvpouh4+QcqNmmJlclLX3K4pBf2+8+3DhyDYCxpud7cVSpUdqjb4aiCM9+sLZ0um8Biz1IEcl59SoIZbNovJ1Ugo3uNv9nWMumaEd0xb1o15Q5E7zalVE0XaWu1u+fcd7MvWKYyqispL1avrM5PbIzewWblKwkgU8YEGLbZ/4y5EH6eKANPD6nR/dS1kU6MUDijI0Td3Ss5RKPLlDa57bDL67LwL/09y4e9D0luB/LcfQ4QPREGBlexk++g9bM2nqlXHKk3ELjKGp0Tx7RfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8F2qmeanFiSgWu8BX/cW2bSVKmmrkVtAySF67ZRiAzQ=;
 b=kRXdpo+qB2Is9cBlQQAgIXKkvEGaB+wihwe4XfnVi/W/ouOkcuddYIffXuTjcQOXdX2yUHTdLIKHl7153tfd+8CJ7qU5trMuFV62KdglAs5fiW4NxA/pwCr2wZr276vodMZjFPfs0hYSoovUpMSXuADBMusT98xz/nPKd3MHEqwNhJVXy39NXUtqSYbmChnoU0Zgi+9VB2D7SBN0VQ0GmbAfkmDYTP1DMWKNbgnhlo9FFZD+Kod0JowAWntjtE68DjvFnnUMrFzpPVV61jH4sNDaj0+YX4Q1ypm+oMcXW1bSckYpLt2nh91uUhV8MKN3OjG3m6F6nCGapU+xf0M2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8F2qmeanFiSgWu8BX/cW2bSVKmmrkVtAySF67ZRiAzQ=;
 b=4mwiWk6dYOaxCg2fY1Ryje+AUt+LIOk7CaUlLszBRFxqD/Z2yCnCr1sietfWdhmu2vCDn+A1XPtlXD7wpqa72zRsr+jwUjQ22LgUFbT3itMH4RUsE63lPrBS26N1G9SgWMG+yHj3AmL0C/8ZOJ92M8YECuEJcQaGrtcQJaIgrQM=
Received: from PH7P220CA0177.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::25)
 by CH3PR12MB9250.namprd12.prod.outlook.com (2603:10b6:610:1ae::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 16:39:25 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::8) by PH7P220CA0177.outlook.office365.com
 (2603:10b6:510:33b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 16:39:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:39:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 08:39:21 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 08:39:21 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 13 Nov 2025 08:39:20 -0800
Message-ID: <ed406f30-6381-0a89-a266-c5d9c0da4d2e@amd.com>
Date: Thu, 13 Nov 2025 08:39:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Clear mailbox interrupt register during
 channel creation
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20251107181115.1293158-1-lizhi.hou@amd.com>
 <3ee3c7a6-65cc-4d67-9a4d-5b9b09e7908e@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <3ee3c7a6-65cc-4d67-9a4d-5b9b09e7908e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|CH3PR12MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc0f911-ee39-4a00-1de9-08de22d33441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFZhWmE1L3NHNjl2K01lZW1NdUZjVmIyRG1VVEZXNU1pTnVpNWF4RmVNY1px?=
 =?utf-8?B?SjdXZXZyRXFaS2pVMnB3UG9HVEcwSysydGZJays0NkxUaWxWNitxV2N3Viti?=
 =?utf-8?B?eEZHbDVlSll2MGlMS3JHM3ZBUGRtcmhxU295TmpZSVhIUkIxNmVPcG5henJS?=
 =?utf-8?B?L0g2anJGUjNrODk5Z2hZZEJ2TTlzeXBhUzZ2bHZtSnBGOU93Y3FLdVRZb29U?=
 =?utf-8?B?QU4yWmJpV25PZDJiYkx0T2hHNitQTFZKRTUzQU5uT2ZJT01KZElVMXR3TVBB?=
 =?utf-8?B?ek82Y2FmRDZWSmcycHV0alpmYW1IRDZNSGlaUjFhVEpNd09pR2VweHcwdWlu?=
 =?utf-8?B?ZFZBc0lvWXE5aEV5bjdHT0lHTVpIbkxhRERGRjNOWXFST3BxMyt6N0tLdFp1?=
 =?utf-8?B?WG1GaHNjZU9vUk5YRUdtdGY2bjU2Q3FPMDlOOTF3cmY4aXhYWEpWa3VNaENR?=
 =?utf-8?B?WXVVU1JRWThjMTByRU1hNENJVE5qZXFrV1dRRld3eG5ISUx5TkxWYjdVWTRr?=
 =?utf-8?B?ZWkvcGRiRHFod0pXUXJjdjdONUo5ZG9KUlZwSHo0NXFnVk5KbHlRd1JGNHhK?=
 =?utf-8?B?d0FwZmVYVmdDdFJLUG92ZFhNUTdMQ0RrR1FqWm16ZFZXeUs1M3UvMzRNTkov?=
 =?utf-8?B?TFdoZktRbHRzL0J2d0VKTU5ycXhjVFB6eGRqbTliNHB4eHlKNVZoQitsNGIz?=
 =?utf-8?B?WHFCdkdmbXorTVJjWjR5YjVEbGsydDQ5bk52NXRVSlNzYnFBMHNDM3JjSWIw?=
 =?utf-8?B?dlNFbVhvT3ExZWRNVmVRTDdVL09GMmxuWkhtNm5KdllHa3JQL0lYejZJSmlH?=
 =?utf-8?B?T2hCb2FOSENoNXNtMjExM1F3dHVEQ21meEZmQ3BTYnpxdEozekNkYktFZStq?=
 =?utf-8?B?SlNsQmowUW51V09XRU1OeWlLQjZ5N2pqeDhNQm1PQWtqNC91M3VKNXI3WGIx?=
 =?utf-8?B?WUU4S0pMYWdLQmR2Ukt3K2c5VjRvbFpOTmtlY1hnR0x1blVzTi80a2NvaG1u?=
 =?utf-8?B?MXJlalk1QVd6dXA2aC9XZVBLVzc3UU1yUjdiK2F3NGNmaTlYaFAwMlVwQm9G?=
 =?utf-8?B?UG5tQWM4bU1uM0xhWDl4RkpoMDB5RnZ1UlgxREFYVlVlR3phaGpJdnpXTk9H?=
 =?utf-8?B?ZVdKMFljajB1L3E3Mjl1ZUxBVnlJbmhIKy9HRk9tZk9tWHJORllrN2hkN3Nt?=
 =?utf-8?B?MTF4QlFLK3JwU21RNmxJdXRZUTFmSXdEOHpDZ25WSTRzWDNQNDc1KzUrTnFr?=
 =?utf-8?B?a0duVGdjUGpoL0tIaUtqVXNRVTFINXdQRnJuQ09WTVNRY3BxejIzR0M3OE50?=
 =?utf-8?B?a0NQUEJzY1RYL1JjTk4yVGJVWm83c3p2dDMrOFc1dHdnSWdTQUdtQUZmTXFa?=
 =?utf-8?B?OWM2VHVmaTNjZStiWHNTbk1xR1Y1RHJZZXVGYWw1UmJjTlNTTjdGNEtlZWxz?=
 =?utf-8?B?T2hiU1JsUFBOSURoc29KWktSQ2pScDlZZXJTYTZjejFxRmpWMlpiQ1FHTG5n?=
 =?utf-8?B?SlRMVTByR1Q4ZXhxQitHU3BkNk91dkJDeHd3dXFKRWpvcmJ4NVdsNThueGl1?=
 =?utf-8?B?MjB2VFhaMUVER2N3bTgxazFFTUZNTnNBTXpYYjMyRnp2REtxVWNxR2J3Ym9z?=
 =?utf-8?B?YzBwSzZtaGpQeEhCNTdJWDhRalV4ZE15Zzc5YjRhcEJmeVlhNndoSjFlRlU4?=
 =?utf-8?B?NmFrWkJsSXFUaG9GQkZwSVdnR1F6OHZ6R0c2NnIvQ1ZoSFVZdjZMNkJuTEJo?=
 =?utf-8?B?ZDJxNVBpZS94cWVwclVDcGFUUnJEUDhBYklqTFA5cDVsaTd3VTZJc3Q3SEE0?=
 =?utf-8?B?UkNVZTN2cDR5dXRDcTBEQnF0TjB6VEo1d1o2aWZLNEpVUVJCa0ZrOVJwWk5m?=
 =?utf-8?B?eVBjQ3ZGL0xDSEhsSzhkT0oyaGlGVy80bzExWFoyZGVaNjVZdkQ4VVkxdzFZ?=
 =?utf-8?B?a3gzOWZ2Rm5uakc4T0lhWXZwMFFYVG5mZkx4VW92THQwV2xLWS8yNU5NKzcx?=
 =?utf-8?B?VnhQS08vTHBwZTRud1BreVVOcGM4dXVUOG5kdG93MDNrRmVFL0ZnRzBObGNt?=
 =?utf-8?B?ekJ2ejkybGFodnRuUDExVVAzNmlmZGUyOTRzcmVZaFlaaFR4bUwrRFZLUVY4?=
 =?utf-8?Q?yu6M=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:39:24.2440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc0f911-ee39-4a00-1de9-08de22d33441
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9250
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

Applied to drm-misc-next

On 11/13/25 07:22, Falkowski, Maciej wrote:
> Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> On 11/7/2025 7:11 PM, Lizhi Hou wrote:
>> The mailbox interrupt register is not always cleared when a mailbox 
>> channel
>> is created. This can leave stale interrupt states from previous 
>> operations.
>>
>> Fix this by explicitly clearing the interrupt register in the mailbox
>> channel creation function.
>>
>> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c 
>> b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> index 24258dcc18eb..858df97cd3fb 100644
>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> @@ -516,6 +516,7 @@ xdna_mailbox_create_channel(struct mailbox *mb,
>>       }
>>         mb_chann->bad_state = false;
>> +    mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
>>         MB_DBG(mb_chann, "Mailbox channel created (irq: %d)", 
>> mb_chann->msix_irq);
>>       return mb_chann;
