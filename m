Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CE6ACE763
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 02:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E305E10E04A;
	Thu,  5 Jun 2025 00:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ipBpNkrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3781E10E04A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 00:12:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNS6yEkAK8zBZ/rO/sMypomhBl9HNV93YTHajKKkdKX6heWC/qIfS3KwnsIorNv2Unh4/YYAt0RgqbryKA8Z8DLgVc8VNKEtwqmhVOMaplmZhTT58w3qUAyarMfRbSHj+f7h7FkN3rF4NeaCYm+NP8+eZaU2XNTqIwXhW3pz8uyDPgczSa05IrTK+RAzrqWB2JzjsRbZ8eUq+TMsCkTIWNWtTHaxZXl6jM+PcSrq3rxSfNONtugAm5R58vK2aoHbFCdfzYW60F3zU//U7jYtTvjOE1KKvMSnkEomeuLmk73GgnovXbUd3PMqV7EkyfZt9oA5K/Dv/3bKgtQrtoloLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg1PWmIZC6x12sWBCPnqJjEYm62vk8l89AuY+V4pOA4=;
 b=XlBBKkQaOnaOZVZ9qOSN95fCFdfha9+ou7Di/XggrTSowHYR3zld4jlNsfYWZ1FT+rW15RJ0mls1qM1kI2fJCJ+bJ5huwAXLGTIpYgS+jjBkfnKggq1S36sXL2HbeHn9JGwbaqV6gY8en7AFd53ozN8OtXrLqpUiiyr6RI6oCAjac/k/XvJpl3iIkvCGo4T9ozvSl14s3Y7tt+3E3ancz/KNnfRdfqyOhAj7ODHjE/HaMcpJ7OHGwxioip3L60GNK/D0AjVDsnJifcYNLvJPCkE+ZXHBkw6sPpuB32RItdFf/S0RRuub+d1WAIO3/FX44YuEEwe0jtsH895yZnwGvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dg1PWmIZC6x12sWBCPnqJjEYm62vk8l89AuY+V4pOA4=;
 b=ipBpNkrVrmi2tHf1vA5tkPeX3LpmUyS2s4ENhU8pApcOTZztWxdPTUtjgVqiQcGSvgjaL0K+Ev+TaaeamAqnwZJksPiwTmag+JdMVFJ1fKdLuwdHD3Q81FMrlmwNZFWbOB3ftZeUSyhz3j+dcffhpboFzBR0ppN7ccAGUmmc/qo=
Received: from BN9PR03CA0375.namprd03.prod.outlook.com (2603:10b6:408:f7::20)
 by DS0PR12MB9400.namprd12.prod.outlook.com (2603:10b6:8:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 00:12:54 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::d) by BN9PR03CA0375.outlook.office365.com
 (2603:10b6:408:f7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend Transport; Thu,
 5 Jun 2025 00:12:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 00:12:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 19:12:53 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Jun 2025 19:12:53 -0500
Message-ID: <e70bdb30-66cc-7e9e-b666-efff3203bf27@amd.com>
Date: Wed, 4 Jun 2025 17:12:47 -0700
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
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <CADnq5_NMamTAd0whqwr+xcokFThCNX7T7qFBfX+u3vnS6oc=tA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|DS0PR12MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: db79d339-835e-4d0c-4299-08dda3c5b7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0FtUlhtV3FGcDlvWnFoUDR5SW9kMDJMQUcwS0p3QTB1U011ZkJRdzNZSFBZ?=
 =?utf-8?B?d1dQSjNDbjB3eWNXRGU5amNOYnM2ZVpjL3U3TXplSFE3YzdvTEtOSnRnVlI1?=
 =?utf-8?B?MkNFUzlUSzJXUzE3WU8xK0tQcHRnTzNyMElrcmtJbEJSMVlGcldZU3dUYmxF?=
 =?utf-8?B?ekJpOE9HZkx3SzNtSklLaHRZS01Lb01rNXJqRzEySmJSWlplNnFDREl2OVZD?=
 =?utf-8?B?S1hicW8rQlZiZmZPT1lzSUs1UjVKT0pLYVFmb0R3T3daU3lkNTRkdXU4SXZx?=
 =?utf-8?B?ZFdIamcyd2tnSVI1TXBaWnkrd1NKeGFPNHMwM3JsWG9JM01wZTJ4UmlKVGZa?=
 =?utf-8?B?d3d4cnQwbHRGczBwSnVjOUJFT252eXBRN1RrNyt3N0dvYjRMaERkYnhaMVdB?=
 =?utf-8?B?bFFoM1RWRDREeGk5U1RCMzZHbksxOW9aQnF5OTBMcmh1dlk0ZXFBS3puazJS?=
 =?utf-8?B?ditkUDBVYmdDd25rUzlid2xnUjNPNnpYU1VNY3Y1b0x4VnM3L1p4V1RTTW5i?=
 =?utf-8?B?Tnh4c3drdkRRTmU3TXBzcmQzQjNVblhkcWxoYUEwUnc2NExOSmQ1cFdSamx0?=
 =?utf-8?B?bVdJR0RuZ3Y0QWNIUEtIc2ljaDBIRFZBLyswejF6QzR1cVJsZ1NWdnUxcG84?=
 =?utf-8?B?TGdMNHVrQmhPUjh0cUkwOTF1RUlLa04wb3RvMWdkS0gvR3Y5UVNSbk9YcC9D?=
 =?utf-8?B?UWZJdWpVOCt0S2tNK0RLTDkyTG5qLzRwcEZzNjA1UHd5ekIwK2dya2Y5U2xt?=
 =?utf-8?B?WjNwcHI1cjYvL1JpSTRnRERVUllKazlEVHVLWXZHQlgwQXVaQ1JLWUVOYWdU?=
 =?utf-8?B?NmNydnJVZnBTbkNwb2U1aVJ1dnAzay9SdlZDTm92czJzUFZIdnNvS1BQMXRz?=
 =?utf-8?B?TStobUxEREVMN3pNVzMwNWUzeUlvUFhGQ0VqYnh2ek50NldLQkNSdUJtVFh2?=
 =?utf-8?B?MXdSdFpYU2hsMjJTV09vbkxSeFBmQmRkNEJHVXhVN0tMa0trTUNkaVdSTzNx?=
 =?utf-8?B?dnUrcCtKcHE4a2U3c2hUQVV2L1pYUElQdkwzKzZxVVMvdTFOMG41YU5DNmV4?=
 =?utf-8?B?ZXJwTFl2TmplYllqZUFOSnBEY1VndXd1aHR3MUl5NHJoUnJrb2x1R3dBcksy?=
 =?utf-8?B?cjBhQUdJZ3FtUkc1UGJsaXZ2M2w2ay9CelgyTkFFUDJQYk1jeUp5SEZVVFZq?=
 =?utf-8?B?dHpFUVBkbUlLQXVxRnlQVnQ4UlpDcTRXQkdGLzJ2cnNyQ0w3SU5ieDZuMHVN?=
 =?utf-8?B?VDg4c1V0SXc0bFNtcEtkZXlPTjdNR3dXbStRL2NVMFV0T0JkKzZ3V05ET0NL?=
 =?utf-8?B?ZkZBaXFhWFFvQzZvSlhnVElDcXFESnZNUnc1Q1VMeTltWE5NUVJwMGM2ZUtJ?=
 =?utf-8?B?dDBIanovbjNocExSY3JJTTVkUkQ1eTFvQVVSVDZiUGlwWDJUQVJUaVV2OFBr?=
 =?utf-8?B?M20wNTBFd28rRStvRGVRSnVLOGZxaTVCQWVkd094cEFERzAvWmF2cFBLc0NP?=
 =?utf-8?B?SXV6eUVIREJaM0hyYnpMdUkwc0JlNFA4bHBQZmpiOVZ2eWpJRXk1Uzg5Qkhu?=
 =?utf-8?B?eUtYNWhVSE4wOE12QnV2VmZJVFE4YjZ4WWNoMGpuS0NwbXhpd2RYOEVPcktw?=
 =?utf-8?B?eEVKU2MwSFQ3Q05QRE9qSDFRNTZCMkk5QXRTbmVaWVpJZ0srNEpzdDhSUVZI?=
 =?utf-8?B?ZTNHYmVsS3VDclBDbG5MY1lzT0lBaFBta2pRVU5qR0RNMEtoODlYV1p5MFRT?=
 =?utf-8?B?NDZUeTJYaXJzWXVibzI5S2gvNXNzU1hKc0thVFNRWmUrNU8vRVY5YlBUQTFC?=
 =?utf-8?B?ODVFZnd6K2dweEVsT3h0clZoSllORmFPUm5aUTF6Ui93d2pFNk56OFB0bmJL?=
 =?utf-8?B?V3hHWVZPbFFNaFdENURGakkxbkJnNWdqUkF3dHBlRWZFRE1NZFVLdG1BSGhO?=
 =?utf-8?B?djY0bS9xcUpFZm1KWXM3aWdpMk4vd0todXhOckpsdTBEdDRIWDBMeWRlVVR2?=
 =?utf-8?B?VDl6SlNaZHhpcTBnVHFRSlZvMThnMGlRUU1CM3o4dWxMdTZ6MFdEU1pCUGsr?=
 =?utf-8?Q?+XFyyz?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 00:12:54.1989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db79d339-835e-4d0c-4299-08dda3c5b7b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9400
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


On 6/4/25 07:51, Alex Deucher wrote:
> On Wed, Jun 4, 2025 at 10:42 AM Lizhi Hou <lizhi.hou@amd.com> wrote:
>> The incorrect PSP firmware size is used for initializing. It may
>> cause error for newer version firmware.
>>
>> Fixes: 8c9ff1b181ba ("accel/amdxdna: Add a new driver for AMD AI Engine")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_psp.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
>> index dc3a072ce3b6..f28a060a8810 100644
>> --- a/drivers/accel/amdxdna/aie2_psp.c
>> +++ b/drivers/accel/amdxdna/aie2_psp.c
>> @@ -126,8 +126,8 @@ struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *
>>          psp->ddev = ddev;
>>          memcpy(psp->psp_regs, conf->psp_regs, sizeof(psp->psp_regs));
>>
>> -       psp->fw_buf_sz = ALIGN(conf->fw_size, PSP_FW_ALIGN) + PSP_FW_ALIGN;
>> -       psp->fw_buffer = drmm_kmalloc(ddev, psp->fw_buf_sz, GFP_KERNEL);
>> +       psp->fw_buf_sz = ALIGN(conf->fw_size, PSP_FW_ALIGN);
>> +       psp->fw_buffer = drmm_kmalloc(ddev, psp->fw_buf_sz + PSP_FW_ALIGN, GFP_KERNEL);
> Why do you need the extra PSP_FW_ALIGN in the allocation?

The start address of the firmware is also required to be PSP_FW_ALIGN 
aligned.


Thanks,

Lizhi

>
> Alex
>
>>          if (!psp->fw_buffer) {
>>                  drm_err(ddev, "no memory for fw buffer");
>>                  return NULL;
>> --
>> 2.34.1
>>
