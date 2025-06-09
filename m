Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC04AD20DD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 16:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284B010E3D7;
	Mon,  9 Jun 2025 14:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i/oK3Gw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2073.outbound.protection.outlook.com [40.107.96.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025AE10E3D7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 14:27:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IO1bdOIg8IELv7YMPLuamEXx8z1dqXIGnREo6tuhtCRwOr6MwnpvtaGfmt3bzTK9rYu8Hi/VWk9DgC8pzfcs4xzJ+lzSYrE0GzNDGlHlBNmlO0wyFtJ5lj7ksZJcriNOr8SP3vrkBtBOVgTKk8palW0GYAz1gur1O8cp07GThVPfznpRgbwoBES5FCunYu5Z2frdAuqe2LxpQaa6qqxtCKm5VEC56rqoL7axhKtXVn+TVStY2UtWRoX0uybAI+NitkLzyw6YLLejwek33Ea3gxQOjp0t1G2YcF5pLjZVVqfJGwIsRcucq81t9FNrZZJE5KMGreRWI2zwvxJlO0CY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akk7N0sZP0Nf8EazK2dC6Hc6AILJKNkUyuRvnDTK1yU=;
 b=XGSPyD6J2vyow6Km2HywG3MoVJb/WHWWeDOpcoSft+q/i8iWoOLm2/zNXQaUUqeCM8tYiAa4FLct4L4KncxZgMLkQ1oxl9hYud6rW6qlTFX5qN64SmjiEfLSJX4n2/5V7KUdlq+9rRcT8ha4M7u33pLM9snV3ztzH1vC28cP2DV7g19hSddq8U8yH4E2Hn/IftvGcKb2JIrJT563ha78ezuDZ4nF0OLUqvyTpsyKDupFof//VIdgOgZwkCJyT+CZIihh0RT3N2fJfrnn5Q/FfUCHIZNGTVRQMYHKoht9UwIqNvty516wMvV5Le0NP+3h+R7MoAi/N4VQkPABDsVsxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akk7N0sZP0Nf8EazK2dC6Hc6AILJKNkUyuRvnDTK1yU=;
 b=i/oK3Gw5XfcmOaphQgq7+5N2REEuyQ3r+jnMHggeN67J0CZyrR2DdGfYo/xgNV2IPR88KY4+FaVv+MHeUa5v05SHN09EOL+aMuDtjolha6RMCEhdPn/aTYbJ3GQM86X233Ky1RiOlrttZzUNCx7DGN2+WwHEeDkeInMcoGbgAwo=
Received: from BN9PR03CA0432.namprd03.prod.outlook.com (2603:10b6:408:113::17)
 by CYXPR12MB9278.namprd12.prod.outlook.com (2603:10b6:930:e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Mon, 9 Jun
 2025 14:27:25 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:408:113:cafe::2b) by BN9PR03CA0432.outlook.office365.com
 (2603:10b6:408:113::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 14:27:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 14:27:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 09:27:24 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Jun 2025 09:27:24 -0500
Message-ID: <a8489ed6-8f88-eef2-b487-61f84d3b0957@amd.com>
Date: Mon, 9 Jun 2025 07:27:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect PSP firmware size
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
CC: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <min.ma@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20250604143217.1386272-1-lizhi.hou@amd.com>
 <CADnq5_NMamTAd0whqwr+xcokFThCNX7T7qFBfX+u3vnS6oc=tA@mail.gmail.com>
 <e70bdb30-66cc-7e9e-b666-efff3203bf27@amd.com>
 <CADnq5_P8eFYdPJv5qV+N5JdLCDv4bhWDzpVZCiXTU3jNmgCy_Q@mail.gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <CADnq5_P8eFYdPJv5qV+N5JdLCDv4bhWDzpVZCiXTU3jNmgCy_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|CYXPR12MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: f900b737-e57c-4da3-2185-08dda761c149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFNpRWd6UXpYczFZci9GMmNrZE1WeFU3L2J0OGpjSlZOeWZ4Mno3eU8wK0Rv?=
 =?utf-8?B?TTFsd2N4akYwQU5yaUloTWMrclVuUml0YnlCSFZWd1pGenFGazRVSXc0SGs1?=
 =?utf-8?B?NjNoOFZiSHN0aDY4R3loYWFsN1ZnVWtBOHdRTTVaLzFPTnRYV09zdU1PN0JK?=
 =?utf-8?B?MWlxNG9MbXc4NHJsVDh3YU5RRlJCalRrWTE1NW56ZHpNK0llOS9FY3pMcDhs?=
 =?utf-8?B?Yy9mV1h3ckNZZVVpQjNrOUdKOHlmbWY2Z3NERXNtYjByN3JJcENCT1NTWlM2?=
 =?utf-8?B?Sk9rZUZ2elNXQVdXWFB5UXFOMWdCMEhQQy9FalF2Ni9OemJMdE5yajhOSFF2?=
 =?utf-8?B?N1IxNDJTQmFWZjhCOHRtaktXRlF3UnBwZllOOHhtRm5vVENaYk5KSCtjVTdj?=
 =?utf-8?B?Mjg5WGxMZndzQnNaVDEzMzJyOVNrV1pBNGN2ZmY0R0FIQVpmYlVnWVdTZ3BP?=
 =?utf-8?B?Z1Uxc2ZvMlJxMmVnTDJpWUpBbjQ3Y0FsaURzL0cyTUlRdmNyc0VuMFA1ZGxI?=
 =?utf-8?B?UUtZcXU5TXhyY2NYOENxaVVyNEd6cjJwZkpCMXZ5aEEvMWsrUzRoeFZnNnJk?=
 =?utf-8?B?Um9yRWFBRWR1UUR6RXBBVTA5WmVrVms3V3pKTWhlUUU0UFhDaFdzbm90TjRS?=
 =?utf-8?B?d3dLRDNBWE5CaCtLNXIvZ0lNOXBXVmR6cUQ2ajlyb2liYjBNOWhKSzFDbWh4?=
 =?utf-8?B?TzZXZUlKSWIxMmNXTFMzaVk3U25La3hLMVBmRnFWRTRyNTdtSW80TzNteUpX?=
 =?utf-8?B?WGtFWjA2WG5JZi9yOEZqSGlwcUs3bzNiZnNBTXdUTk5JSFRVa01aNXdONGh6?=
 =?utf-8?B?UUNmV2EyYURRdHVmcWgxZVNwRjJCZmRvWUFnOE05S0d1OGwvdjBCZ2FLcDRz?=
 =?utf-8?B?SmFFSEcvY28vVE5HRVNpaGFpaXVmY0xHSytSMGJlbW5UajFOVmNyVnJ0RkxG?=
 =?utf-8?B?d0ZNNCtXV0FCMU41OGtiMnMvckoyVFdiSHJieXdpa1E1YlM1WlhDZXgxdm5D?=
 =?utf-8?B?T0t5QTM1M3ZTQ3g4eXFHVThqQWs1S1REb3gvdGpXYm11RVJMdlo1SHVvdU4v?=
 =?utf-8?B?YjR2UWhoT2JxSTFDMlpLUXZyRGNqV1NPL2lndDc4eS83cUE0bTdGYmQ2bHFw?=
 =?utf-8?B?d0gyS001NGw2QWNBVG0ySnJNNlRMaEVpOERleWsxK2huTmZiNXVHRnJvL0o5?=
 =?utf-8?B?bmZFMWZpOWJjKyt4dlAza2RvbXRUQWpiSUczaHF6YlI5NDFHdWV5OWNNclk0?=
 =?utf-8?B?aFEvdUVSajB2WE9EYThFdHQvMXgxU1RvWkhlUUdhQkxtdWZuajlJdE9mcDU2?=
 =?utf-8?B?WUdwa3Ftb0QyeGg5NVFBZzJNbkdUbWZKTVZjUGhVSEhsdnMrVllXWDNkSm9V?=
 =?utf-8?B?bUQybldhd0xzTmpvZUJhQ1lCT1J1ajNGayt0UURnVXV3S2s2Q3JPelZqYldh?=
 =?utf-8?B?c2d4Y3N5MGcyOHBvNG05ZEgrdDhuUXFWV0YzcGZmV0RDbmJjOTNGSm5qdERu?=
 =?utf-8?B?SHByMEJSVzhwNERNblNRVzhIZHZmbTVKVHZnSXpMTCtrQ1RSQjYvYk55U1Vo?=
 =?utf-8?B?YzRubmp5T0ZiUGh0TEZpZFVoZU9tTmk0MEZNLzl5dWVNZWlOaitrVUZqRE1Z?=
 =?utf-8?B?SVh2UDdwU21BcmF1MHRNUnF0VmkyOTJwN0dwazg5UGl3Vk9pWk5UclZDUnNQ?=
 =?utf-8?B?cDBpZHpzRlR0Y1FIcDRVTTBCQ2JCUDVpVlNpNHF4ZE9QN05ZMlpNUzEyL1pn?=
 =?utf-8?B?SS9FTWs2allFazNXaDZKT00xWFNrWlBlazJCT3VQQndGL2tnVFRrdHZsQ1pC?=
 =?utf-8?B?UHUyWmpmc2ErUzhyYTNEVDNBQmxFYWtBZlFkWHpzeXUwVW5tT1R6M0w5NG8z?=
 =?utf-8?B?T09oMmVSZjJGQnhrT0pGTmxmTHhmdmV0TGtsN3JWdU41VWxJSmZjSVY5TkN2?=
 =?utf-8?B?RjZaVUxTYUN6M0VIZ2xuc2FuNCsxdWpCWEVxTXVDK1o2M1A2aDV2M3hLbEZX?=
 =?utf-8?B?d2l3ai9HZWs2U2NRdnJDQnQ1TmhjTktWd3F5Ukx1dzFiQUoreHNOOVA2NEVJ?=
 =?utf-8?Q?beyGTL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:27:25.2492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f900b737-e57c-4da3-2185-08dda761c149
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9278
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

Pushed to drm-misc-fixes

On 6/9/25 06:35, Alex Deucher wrote:
> On Wed, Jun 4, 2025 at 8:12 PM Lizhi Hou <lizhi.hou@amd.com> wrote:
>>
>> On 6/4/25 07:51, Alex Deucher wrote:
>>> On Wed, Jun 4, 2025 at 10:42 AM Lizhi Hou <lizhi.hou@amd.com> wrote:
>>>> The incorrect PSP firmware size is used for initializing. It may
>>>> cause error for newer version firmware.
>>>>
>>>> Fixes: 8c9ff1b181ba ("accel/amdxdna: Add a new driver for AMD AI Engine")
>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>> ---
>>>>    drivers/accel/amdxdna/aie2_psp.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
>>>> index dc3a072ce3b6..f28a060a8810 100644
>>>> --- a/drivers/accel/amdxdna/aie2_psp.c
>>>> +++ b/drivers/accel/amdxdna/aie2_psp.c
>>>> @@ -126,8 +126,8 @@ struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *
>>>>           psp->ddev = ddev;
>>>>           memcpy(psp->psp_regs, conf->psp_regs, sizeof(psp->psp_regs));
>>>>
>>>> -       psp->fw_buf_sz = ALIGN(conf->fw_size, PSP_FW_ALIGN) + PSP_FW_ALIGN;
>>>> -       psp->fw_buffer = drmm_kmalloc(ddev, psp->fw_buf_sz, GFP_KERNEL);
>>>> +       psp->fw_buf_sz = ALIGN(conf->fw_size, PSP_FW_ALIGN);
>>>> +       psp->fw_buffer = drmm_kmalloc(ddev, psp->fw_buf_sz + PSP_FW_ALIGN, GFP_KERNEL);
>>> Why do you need the extra PSP_FW_ALIGN in the allocation?
>> The start address of the firmware is also required to be PSP_FW_ALIGN
>> aligned.
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>
>>
>> Thanks,
>>
>> Lizhi
>>
>>> Alex
>>>
>>>>           if (!psp->fw_buffer) {
>>>>                   drm_err(ddev, "no memory for fw buffer");
>>>>                   return NULL;
>>>> --
>>>> 2.34.1
>>>>
