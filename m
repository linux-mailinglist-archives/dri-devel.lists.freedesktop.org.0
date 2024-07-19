Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AD9937D27
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 22:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F0A10E109;
	Fri, 19 Jul 2024 20:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QBO3lOrm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FF210E109
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 20:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3TIlpBGsXRLWM/JNa7Np957kEF9rggqnryvvRxItqNz+XxohxGUe4RGKy+/DGSP95P4bl22xrQPlKg6G2VOgU9zk6seWuvGuZCYaQmqgMq9AVDaelipUy1gU7I4La9Y+k05QoUOnc5Ey5MDTmaMaPRPGWbtB6vAWyZ3rt2+slQvXsW1JWUubsLox34E54C41x3DtrDzUI4TspFFpnVR3UzhY2JKPhmMSzEYmNoaf0fWH3JgL4HSq5QLzHV3Cbs7aga5VCvG3EnRFjz4C3+pAzIfOaEiNdGcmP8vGED6pzMq4WNnjagwAlYb8noUO9qopIlXq/IsxaVK+Ijs37y8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3Dsnj8b+U54f3ogAC682H/LvLKfwVpRHEFuzyEjI10=;
 b=ENsoQulAZWip3lmSz7LDNHQ3fO7doxXd36nelBs7H1O1BkfqqN0AMb2VMh/TrYDwapzLZAxVSfjHZ3+bapxJrqd6ZJKtKlzbv/m5Ih7hCPg5VYrLTuGzNiG38vUp1DoUXXi0dn0sPdDYu3gdXOBvd8JT1kzK7NGlceS5cE1yOgIyfTH3NS0QgE56s7euJ6CYbRg3sdiNa2sqHQvwA61CHhkumGJUk0BWVgJ+W3GaQIWUyH9uyc20yLjW7gySHlnGiZ3+inzDViquwyRoTqWFXnGlVp+xnX5LyBuRni2yUjPHmVp1z8codd+awTo2Zb9lv+Bo+QC6/63tVOU9wxGUQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=web.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3Dsnj8b+U54f3ogAC682H/LvLKfwVpRHEFuzyEjI10=;
 b=QBO3lOrmIbFoVLHogSeW75jpxdFXFcHGfAAJnVDSHhUJTvgXgOSlX6C6GLUwnyMzvrkRzGTygnIcAa3N4300xEGAC4wMly0dZ6QnAKc2tq/g1OloskZWo6/KEI+Pes1W/hSi66My+fIQpjs1R18SIh4oj6CRvjI6lcfzuRDRJ/Y=
Received: from SJ0PR13CA0240.namprd13.prod.outlook.com (2603:10b6:a03:2c1::35)
 by SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 19 Jul
 2024 20:07:56 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::d2) by SJ0PR13CA0240.outlook.office365.com
 (2603:10b6:a03:2c1::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Fri, 19 Jul 2024 20:07:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 20:07:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 19 Jul
 2024 15:07:54 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 19 Jul 2024 15:07:54 -0500
Message-ID: <010a46ba-9dc4-e3e3-7894-b28b312c6ab1@amd.com>
Date: Fri, 19 Jul 2024 13:07:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/10] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, George Yang <George.Yang@amd.com>, 
 Min Ma <min.ma@amd.com>,
 Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>, 
 <dri-devel@lists.freedesktop.org>, Oded Gabbay <ogabbay@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Max Zhen <max.zhen@amd.com>, "Sonal
 Santan" <sonal.santan@amd.com>
References: <20240719175128.2257677-2-lizhi.hou@amd.com>
 <7a419902-f45e-45bc-bd9c-3b3e434f9e7a@web.de>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <7a419902-f45e-45bc-bd9c-3b3e434f9e7a@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|SJ1PR12MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: b3941160-7d2c-43d3-2c29-08dca82e7adb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0Uxb0dVUWxDQUpRbVBBbFA4Vnc5ZVV2QlBnVHMrMmU3OUNJNnRQM3BnWmZz?=
 =?utf-8?B?T2I4OTZoYWJ1VTgzNWVaSlhnMnA1dzBGWVBmTzRFNHdKTzkwUFhZZVJ4WlNE?=
 =?utf-8?B?bVRNeTdPbzcyeVBzbXlVUDlNQXZUWDc5cU9xWUUzQ0VJWlZYMlVjT1Z4cm9I?=
 =?utf-8?B?ekRmMVNBQVZVd1BjNXJrRkhvdWdMbjBXSXdpbUN5ZFArcTUzWGltbHFLaVA0?=
 =?utf-8?B?UkhIVzJwY3o4eUJ2Q0FrRm9zTVBHV25LWFFqQXFtVTBDSkNjOWZBYUJScW5Q?=
 =?utf-8?B?M1BhVzRzY3lrOE9xeTJkWURHQ3JFSnJaRUJTblpUbmZPd2NhQnZEY0UvRnBt?=
 =?utf-8?B?OUZac0dMZDUxVDd6MmdiOWx1UDF1ckFCTGNsMVByeVRvWGxJRjhBV2dLNFh3?=
 =?utf-8?B?ZWJsMStUTzRJWkEwbWNrWnRjUGlnc2t3bE9wRC9wSEk2MmZBTnU0KzFaQWNJ?=
 =?utf-8?B?Q0xDTEJzTktNNS9XWHlUdCtjeGpNRUttaE1JVGkwc2tUMUltanVtV1M1WDhD?=
 =?utf-8?B?WnRHbVd1aGY2amZ5RVVxN01BajVYcERZU0VXdFNINERRTnQ2Z0tubHNYUlIy?=
 =?utf-8?B?Sk9PTU9xYnMxKy82c2lueVRmNVV6MDZ4UHg0dDNkNGNxMDJ0alZTRzdNWWsw?=
 =?utf-8?B?MEkycWc0cm5uYjczOVJ2eEhoakkrWEUxcFR1T3VEejVqc0hYNHFZc1R1YjMv?=
 =?utf-8?B?b3E1UmZuV3lxSlhHOHh5Z3lxMnVYcXRsek54SlgxUW44bnY3Y21WRC9rUjV4?=
 =?utf-8?B?SFZPK0VHa08wUUczZTV2SkxuR0tISExOc2FtS2x6RVdDRmgya3FFWFlYRDly?=
 =?utf-8?B?M2NWd2ZUaUdwc284RmdhUmF0aDR2Z1ByNzFUMlZvU2NCaENGUExxWE9YNkho?=
 =?utf-8?B?anJScDNJR0VLMit0RzFnWmV1Ri9vMk9uQ3Fvc2VWRTNpOTA1REFYOGNqT2I3?=
 =?utf-8?B?L05qQWYvZTdKY0IxRktXdVRWZmw5cnoweEdsMk5hZEtjMnkyOE4rRlJSM1hF?=
 =?utf-8?B?eDIvMDZDRFkyMmxDQWxNVjhrakFLamdVQkxZQVFabnhVRUp3aXVWVHRFUXI1?=
 =?utf-8?B?SFN1eU1PMWV5MGlINWpUcnpZQ3VtZTA1azl5Z2lMMGVlUTdFeTBOVUNoSi9E?=
 =?utf-8?B?RXliL3Q0UCtFaG1Ld1prUVhrZW14ZXl1ejVOOXBTM05pTmNGRWFDRHUzVFRO?=
 =?utf-8?B?UXNzOVFZK3dhak9IbEtOa2RjWi9HZVpEOE1waDJnMFJtWTkydURLWFg0WDVS?=
 =?utf-8?B?YWlvS3h2UlNTa3JNMTFXMzZvTVV0MCtkaHhHOFpTNWZtVGNabmtyQllOc1VZ?=
 =?utf-8?B?RmxTOUZ3MDVqekk3TmkvVDg0Y1ptenA0U25rZmUrRURFM3l0OElqTTY5Snl6?=
 =?utf-8?B?OTZHZ0FvMStNM0libjlZdFAwblUvbUtrM2xrSmE4SXhWNTdTZ1VsVUR3V0dB?=
 =?utf-8?B?ZnF1M0JydWtIS0pCTVZpV0lTVzV1c3lEaGxkWU82YnpYWU5McGw4S0FraVQz?=
 =?utf-8?B?K1dZUnp1WktJbTJLOUlzL2xYeTBjQUdYNGdLVnp3MnFKZFJnRGZPbVh4OTRj?=
 =?utf-8?B?bGU1Y3NPUGxvWHd4aHppNkhzdjVCZ1pROG5xbCtKUlV4c3NLREY2QU5RUjVu?=
 =?utf-8?B?SjhlSHJudG0zaDRjNEJsMkE5OE5USTJhdzN0bTZuRzVyL0lDRVN6Ni95QUVW?=
 =?utf-8?B?TEl4eG9pemhiOEJnZlN3TmdIWHB4YnBITmdBU2FaWnlld1REUGR6S2ZQQUkw?=
 =?utf-8?B?V0pWLzIwN1BjcWRYT3U1WEVkK1JoNlFXMThDRTZteFVPVWRXWHNXRGFFd3dJ?=
 =?utf-8?B?YzJYUHIwYlNiSU4zcW9pZVZRc3VCbmlPdkJlWEh0WkJkU0VxNzduYzdNc21t?=
 =?utf-8?Q?ZXmVOTNlmOQXg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 20:07:56.1193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3941160-7d2c-43d3-2c29-08dca82e7adb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6194
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


On 7/19/24 12:42, Markus Elfring wrote:
> …
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -0,0 +1,118 @@
> …
>> +static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>> +{
> …
>> +	mutex_lock(&xdna->dev_lock);
>> +	ret = xdna->dev_info->ops->init(xdna);
>> +	mutex_unlock(&xdna->dev_lock);
> …
>
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&xdna->dev_lock);”?
> https://elixir.bootlin.com/linux/v6.10-rc5/source/include/linux/mutex.h#L196

guard looks cleaner. We will use it. Thanks.


Lizhi

>
> Regards,
> Markus
