Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04A1C55B60
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 05:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FA910E1F3;
	Thu, 13 Nov 2025 04:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q9dBhUEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3010D10E1F3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 04:53:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkCqIL4aV70FebxuPGAbmA6URdk5zy0WoCKexRRT4XKKusDJONqZPp6JHh6zOBsqQ2mAMX0YPOREdMAnwqYB9LzUIjkJgegSb1gcjkANori1cnlu6ve973HJBjRWuaElmwZatJiHlTTTAmS6NsEuPZDreBqjQDOuAnVDB5SbjSgd7vJk3vKJjpX5xCDKQFcaIKev3QfQ4WAvVM5uthOJcaOgZRFnsB3fteTEPWJxdvnPesnSoilRlf69sTHsMSaPs+lmlySZs117meSi4WVqBcU7gKrp8SoCnvuNGBMjtxM6fwyqhV8ioedYx04reBI020UA+DgohDp4YAGtCO/85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILypEfo7SgVKkOA3MEUiDZM6mQJ1xlCgZonqvzQWrTU=;
 b=mv5LzLx2j84jxYdwtV9WNoSimkhzYTvrW5gzfo4Ao9oV0Fn4bgW/+E94b+QtWsVVlpftscaY0T+fIMMgjBT/VmYr8MnkDrM989HGAWB0bT6vPqecgrMwRy7PP22sCmAwsvJpG1P9lhOAPcy93tqT+nemEAxxgwRihgXqPxPaWH/pHkrptAHFh3pm/3j2HrGfz2THzAeFi+JWVdeI5vTJ9l0oe5B6CSlukD6On19VElYKUiSkvsZJh/Dvzn1L6K7E0YlnmdU4O3i1bCcddP9GJzSdjQ9kV8qvnXYGJEcclKqrZCatx5Uin8osvAQKymyK/B6X7YmqukUKq3vnuJ8agw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=wanadoo.fr smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILypEfo7SgVKkOA3MEUiDZM6mQJ1xlCgZonqvzQWrTU=;
 b=Q9dBhUEC3lc9qVMYchmM0oJ6UAHmvWui0DV20wLdganFbAIii18p2s/vNgBI9cPOA505n/96ElJ6Z2e2DlzC6GDmQdhxa1bkuF6GEhdBd5Yjtf757qnVunGgCRJI5wqXmUwRzz/lyq/AyobNHhRtADiqg1L/1dDo8lTh0QsQOGo=
Received: from CH0P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::15)
 by MW4PR12MB7015.namprd12.prod.outlook.com (2603:10b6:303:218::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 04:53:20 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::9d) by CH0P220CA0007.outlook.office365.com
 (2603:10b6:610:ef::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 04:53:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 04:53:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 20:53:20 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 20:53:19 -0800
Received: from [172.19.74.139] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 12 Nov 2025 20:53:18 -0800
Message-ID: <05f478f4-b492-4f4a-8b87-a3224e604702@amd.com>
Date: Wed, 12 Nov 2025 20:53:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 5/5] accel/amd_vpci: Add communication channel service
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, <ogabbay@kernel.org>, 
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <lizhi.hou@amd.com>, Nishad Saraf
 <nishads@amd.com>
References: <20251111011550.439157-1-yidong.zhang@amd.com>
 <20251111011550.439157-6-yidong.zhang@amd.com>
 <2c0da6a9-e766-49be-a679-9d19e5d14992@wanadoo.fr>
Content-Language: en-US
From: Yidong Zhang <yidong.zhang@amd.com>
In-Reply-To: <2c0da6a9-e766-49be-a679-9d19e5d14992@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|MW4PR12MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a1c1d17-fa69-4761-b4c1-08de22709188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlZTMFo5UGwvL2tCRHVxOWM1UUJaLzBRa1R3cXFCbUlKRjN1MzN4Q0JETGlH?=
 =?utf-8?B?WldxbnNMK1MxNFB1RWVqWTV4ekthS0J3c0svYWg1UGhqZTI4MzRRZmV0b1Z6?=
 =?utf-8?B?TmsvdTdjYkZlYllGWnVZb1owZlZRaklOQXdoZ2hNTzJqOVNVRk9Gd3ZmdUpt?=
 =?utf-8?B?TkVGMWRrMXllcXdkS2pFOUdSS1pvY3gyUXE5Ly8xZTRZTTJDT3lYeXRYV0Vl?=
 =?utf-8?B?MEMyVFd6RmE4UkI2OXhrNG5KdnNjVU1zWUxsd2hFZTdrREViV1FDaTdJYy9O?=
 =?utf-8?B?S3dBcmhYNmNJOEswUU10dDdWemx4c21TcjZMOHdPUWxGMDkySzdlODgrbUth?=
 =?utf-8?B?a2VDdFFmcExJbGZyeURkWDJvOWFJMGVaK0hvV0E4Q0pZR29aVVVFL1dMWno3?=
 =?utf-8?B?cktQdWNuNDVkUEhVK1JxbGRNcW9oamwycHFFQ29NbWpUN1QvMTJkYnRtVGwx?=
 =?utf-8?B?K2hORjl5MkhtY2FNdWx6MW93TitMdVJyVDNmYUdCSWE1YUxHZ2xtQ0tKZzl1?=
 =?utf-8?B?Z09tSm1LSUpGVUkyakxRM2pTS0tKazZZR1FzUE9YMDFBRk4zSktBODJ5U0ZD?=
 =?utf-8?B?aWtIUEF1MEk5NmpSUnFERVAvUk91V09GSXFUcXJoSGIxSjJrSnp3MjFza3Bu?=
 =?utf-8?B?bDhNU1dGTTdaSW9HY2VrNUZmQXc5dnlqVWE3V3ljb1FENVdCNVMrazg0UEo3?=
 =?utf-8?B?S1YvdkZOWHBxbEg5WVRZWHpva0ZCbHhBVmRLSTBXMy9BVHhNUWMrY0tpUEJ0?=
 =?utf-8?B?a2hHcVp2Q1NxaXczUVcza2ttOTNrMW5CMFk3RncrN3FDMitjcWRxUlBDbFhr?=
 =?utf-8?B?cCtnZ0hIQzc1aTQ1Y2w0bGk0eER2MnR2bUtuVmdpejJRYVhBNmxVcGR3dFNn?=
 =?utf-8?B?STZzVktobDVqVzdYSnJtb2NDQzhQL1pldks4c3BrOFFrOU1XTTlCb3IxdThP?=
 =?utf-8?B?QU9xQTZzK0dZZU90c0dvS3ZjWHY3ajJSNjJ2ZFZwcW1VcmdMU25tMUI1S2Ur?=
 =?utf-8?B?c0R0SGY3bGtrOEhsY1Q3Q3lCVnpKc09RVCtEN2d1MUJ6ZVpuTUhLVEpEZDli?=
 =?utf-8?B?bWx6aGFJZEdzOGpidEhyd0xaWThGZGs0V0tMNWpqRGRqUThFaUFpSzJNU0pq?=
 =?utf-8?B?cVJ4a3FxdG11ajNsUEVMdGlRWDY2emYwbE5aNWpSS2wwWUZDWTZkMko2dy9O?=
 =?utf-8?B?Tlk5QlcrT1gyWXhLVWFBNzdoRkpMZW5OaGh2KzdwVDNFcGdac3JLVFZzallG?=
 =?utf-8?B?THliYWQwK2tWalpIRFJEZHdGR1lRWDRXM00wa2tPS0lwajVqZmRleFZlbjl4?=
 =?utf-8?B?emREc281VklmOWdDc05idE5SUVBtM2tQM3BTMDhIcFdjeWw2bHB0TmI5VHph?=
 =?utf-8?B?eXlLeVVZTG14RHR2TFBucEtyeStwK1pSai9IVDRoT0Y0azN3eVdsM1ZQUjdh?=
 =?utf-8?B?WnM4R1BOWXZMeFV6c0R3WUl0YnJRNzhwdFQrQWY5K0p1M0o3Y1NYZTJMVGlU?=
 =?utf-8?B?cUppWVBlelV2MWFCWlBJRnNWYTlxV3NJcjVXVHNvd00xTm5OZ3VsVXorVGxm?=
 =?utf-8?B?cFJoaXZBVEdkMkNhVnYyZWdXMlk3d2s4N3NiT1hmRjBmKzlZd2lOc0J6ZE9Q?=
 =?utf-8?B?UEZKcVJYcXh5NnU3WUFuVEhpOHNSMDBaY0ZwVkhjSzRGUjNlc3JXWk5qSVN0?=
 =?utf-8?B?Rk1jdWVNa2NNdElvWVBaREdyY3drcW1iY1I3TWh1ZE45a05kTDQ0bEdPaEJa?=
 =?utf-8?B?aVl3eTVVbDNnamdPRmZiMUt3dWhXQkRxeEFodXAraWxld0hxN0NENGpQVEtT?=
 =?utf-8?B?eEk0QUhJdDUreE0wakNMTjhpUUJzRURGL0F3cDVqeGpaeTVrc0c4TkZ5Q2RO?=
 =?utf-8?B?MHJBVlYvUUtqdEZZd3lrZmYyN3RlWGl6Vlc0M1F5RU1TNTVHRzUvKzAvN3dH?=
 =?utf-8?B?TU02MnpaVUMxM2pOcTM3NVBJWlBmUDJBNmNYcitzait1OGVPQnVsOXFrTkFO?=
 =?utf-8?B?SmxYT3hQb1ZqOXhvblhkandyWGFNSDRWaHF4OVdBUEsrTlNvVGluYVN6aUw3?=
 =?utf-8?B?QkRsa3VBKzUvMFN3OTlRb2dZYVVOeUJxVjZvQk82VVhjSmh0QWpNNmx0eUhL?=
 =?utf-8?Q?BnXs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 04:53:20.5983 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1c1d17-fa69-4761-b4c1-08de22709188
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7015
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



On 11/11/25 01:59, Christophe JAILLET wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Le 11/11/2025 à 02:15, David Zhang a écrit :
>> This patch introduces the communication channel (comm_chan) service, 
>> which
>> enables communication between the management PF driver and the user PF
>> driver.
>>
>> The comm_chan service provides a shared-memory-based command channel
>> located in a BAR-mapped region. The user PF driver issues requests by
>> writing command messages into this region. The management PF driver
>> periodically polls the region and process any pending requests.
>>
>> Supported operations include firmware (xclbin) reloads, where the
>> management PF invokes 'versal_pci_load_xclbin' to reprogram the embedded
>> firmware through the remote management queue service.
>>
>> This service provides the foundation for dynamic firmware updates and 
>> other
>> management requests from the user PFs.
>>
>> Co-developed-by: Nishad Saraf <nishads@amd.com>
>> Signed-off-by: Nishad Saraf <nishads@amd.com>
>> Signed-off-by: David Zhang <yidong.zhang@amd.com>
> 
> ...
> 
>> @@ -160,10 +222,13 @@ static const struct config_item_type 
>> versal_pci_cfs_table = {
>>   static int versal_pci_cfs_init(struct versal_pci_device *vdev)
>>   {
>>       struct configfs_subsystem *subsys = &vdev->cfs_subsys;
>> +     char dev_name[64] = "";
> 
> No need to init I think.
> 

Ok, I will fix this.

>> +
>> +     snprintf(dev_name, sizeof(dev_name), "%s%x", DRV_NAME, 
>> versal_pci_devid(vdev));
> 
> This hunk could already be in patch 1. This would make this patch smaller.
> 
>>
>>       snprintf(subsys->su_group.cg_item.ci_namebuf,
>>                sizeof(subsys->su_group.cg_item.ci_namebuf),
>> -              "%s%x", DRV_NAME, versal_pci_devid(vdev));
>> +              "%s", dev_name);
>>
>>       subsys->su_group.cg_item.ci_type = &versal_pci_cfs_table;
>>
> 
> ...
