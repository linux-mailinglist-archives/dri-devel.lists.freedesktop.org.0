Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B558EAFD023
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 18:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D7D10E6AE;
	Tue,  8 Jul 2025 16:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Vh/4ThnA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outbound.mail.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51AF10E6A8;
 Tue,  8 Jul 2025 16:08:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvI6bkb36rVQyxKJ86fs2vkAIa8hoVqySxLV8yV7Bzrig8uc5nbZBUkKKxafgDFrzARbNL/CzrEca8/Is6Ld2ogDFJ/Q1cO16hJxxDPWmYr92YtTKQplNZfBInKiYj3NHym4uPWIjYy7sINKWlcGIBrVsznE7/tY97MSjoT0DLMZJnLYO8WqrPBguLcW9VjYAXE/DwHE7WCCr6CrJyC3gTkPVbEFNqBVgWbf4P0vZ/0ZYmo9uoinZ0kbk5dEstBem+sqMcKGJ4X963Rxdngjh1/3xQFQ3WpOzTvTvjjTdczQSwnbuN+UMBDAZs26lF9WWX7D/Hx+rfBaJIweE+xHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUv+fy2qxYjCK8Nuc9rtN67IMYT9vW1uDnf8dznPTaE=;
 b=wC/Rq8yVQ4QU5Hqn5TMK8u3m0igIesgDS5OT06YbNkARpdYhd7uO8RmeDjmgoNZsk8CI1sglqH4UxAR6/vhfMKi8x9p58693u0PiPX8wyowoMvz45EIStgfy7z5LIVY9Jb/eAHIEn5FaeS3bgvDvwwKjWWHTr/oR+YjQtci16BugjzA3lT7+DMcG+PLI9auRsN7ljMwsiNrR7Wsyu6fFl13O4lP7L+Jn3k1yS1ePAucZnMrlcMG+uaGn4DEpo42zkX2/40Q6xyRIOIBTjkOXz5cY+AdUwJ9msVSQixOcRBlFxuDtrq2h+T27j58caCM8W9/IbitgoHvuhZPlIC0qHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUv+fy2qxYjCK8Nuc9rtN67IMYT9vW1uDnf8dznPTaE=;
 b=Vh/4ThnAm8wkqrxm7ImAXGBWSlPujKF8q9nASuchDn8dhVRXX6uxleXPc0qwjxn7yNm9y1hz6kggiinTSnFloL4n+KSQzc8p4mYqS8uXn2MuwJg/g0ReSnfVUK0ZdHRsiZgw83Xe/Kx64MQN46G3iW5FBhh7RBsn1FIy6ytlK2Y=
Received: from SJ0PR13CA0006.namprd13.prod.outlook.com (2603:10b6:a03:2c0::11)
 by SA3PR12MB8810.namprd12.prod.outlook.com (2603:10b6:806:31f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 16:08:10 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::98) by SJ0PR13CA0006.outlook.office365.com
 (2603:10b6:a03:2c0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 16:08:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 16:08:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 11:08:03 -0500
Received: from [172.31.125.8] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 11:07:58 -0500
Message-ID: <41a78619-d9c6-4e2a-9684-056e91d09e64@amd.com>
Date: Wed, 9 Jul 2025 00:07:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] PM: hibernate: add new api pm_transition_event()
To: Mario Limonciello <mario.limonciello@amd.com>, Samuel Zhang
 <guoqing.zhang@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <rafael@kernel.org>, <len.brown@intel.com>,
 <pavel@kernel.org>, <gregkh@linuxfoundation.org>, <dakr@kernel.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <ray.huang@amd.com>,
 <matthew.auld@intel.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>
CC: <lijo.lazar@amd.com>, <victor.zhao@amd.com>, <haijun.chang@amd.com>,
 <Qing.Ma@amd.com>, <Owen.Zhang2@amd.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
 <20250708074248.1674924-5-guoqing.zhang@amd.com>
 <1fa50a8e-9942-45c4-bef0-f31c23ef9923@amd.com>
Content-Language: en-US
From: "Zhang, GuoQing (Sam)" <guoqzhan@amd.com>
In-Reply-To: <1fa50a8e-9942-45c4-bef0-f31c23ef9923@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: guoqzhan@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|SA3PR12MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: a66047fa-e720-47eb-bd21-08ddbe39a1fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVVNLy9iSW9hUmVNR1Z1ZVV0ZE5rVnVMNk5BNmpiSGxjMFdWM1diM201K0Fq?=
 =?utf-8?B?Y21XY1lvRHNubzdHS1FUQTlyYWREZDEvTzJDc1VLOERwYTFXQjRYazBFRG1B?=
 =?utf-8?B?bFZsZVFWcVAyNjRJR3F6UlZyV0JNTkFuMjNwUGVsZFVhSmZZVlVUSTJLVG41?=
 =?utf-8?B?NEQ2WC9POEdVUmtHWlQ4SFRCRi82aXpOcU10RHhDVTF0eU1jaEV1WUlHWG9j?=
 =?utf-8?B?MWRoWEJxY2VLYlNVYkhwQk4vc2dKcUhnTEswQWVhZWNDUHFhQjR6NVBYYkJn?=
 =?utf-8?B?TURXSHQ5MDZNZ0xxR0k0RXJKbVczR0MzZkUyVUhyZ2R6d0JscUlHWGJUWGxK?=
 =?utf-8?B?dHZ5b01MamE4c1krOS94d0E4V2lUMzFiUFpCRzMwVVd5b1VlL0VsWTVNOURD?=
 =?utf-8?B?Z1NKalRWTzBYQjJUd3JyYldLY2l6UjBjNE1xK2RaTFFzRkxyY3RmaXB6eVdV?=
 =?utf-8?B?TWJBU1pnYjBtYlRJMjh2Mm9jNUFlNEFnY3NIRE9QYVlEQkUvZjZEejZqZjB5?=
 =?utf-8?B?L256WlY1L3FKUktodDFKNXRoVEpuWlRvR1hYVEJvd090WkVkM2JGdEVoUzhn?=
 =?utf-8?B?T2QrTVFwY2h6NUtlL2IwcGVGbmJaeTFNU3pNVTlvOWlCOFQyR2txOERwVVFa?=
 =?utf-8?B?WlBLRUR2WGQ5OHFNQUpyNVZrMTRxUU50Yms1MERHUENKSEhuQVpMVGZGR3NT?=
 =?utf-8?B?NTRNMTI1d253c1BkNnVhUHY2OHd3MWxhSTl4NzNGQ1paTktOK2E1K3VkWkJZ?=
 =?utf-8?B?b0xta2R4T242K2N2SVhNaWFrSU45aVFRVEQxVXNLK1ltcElHWHlvQU42Vjlr?=
 =?utf-8?B?eHM4WERCS3ptbTVWbXdUZmhqc282UHdLN3J3cVB6S2lYaWZYdHhud1hkZFNI?=
 =?utf-8?B?WngwbXMzYmtkVGpHYXQvNCt5czhueDM0eFNDejBWVURpRW9BbWlDOFlYMXgx?=
 =?utf-8?B?bXhjMkd5VXI0R08ydjk1djRDckdqNGZxOFhMQUxvenFrNDZWdnh6REI2d3lx?=
 =?utf-8?B?OTVmOUVCaHRUcC9FRGdzYkJGc3VFc1ZqekdQLy9BcVFsNGNBRnB5RFRUdWFz?=
 =?utf-8?B?YXIrTE0zUk5BaUwzdTBSSVJ0ZlVwVUVvekd6cmp2cEVOcXhRMnpuQWpZa0ho?=
 =?utf-8?B?R1ZzZkpodlJQOCtlN2RPdFlBbUZES1VYZU1iRCtpeUJYNWY5K0IzeFNlQ1po?=
 =?utf-8?B?SUYrSDBydGdZalo0Wk5GVzkyMTJlNk9lbmFpczBHSkFSZm1MTkRrOGM4RVhL?=
 =?utf-8?B?YjdNNXlqOWRNUGVhdGJtUmtNWXBYR0p4WGh6aWhsZ1pGZHdBNzRSaXhzb3lD?=
 =?utf-8?B?Y3NWRWFCNUpDKzMraVg1NDdqaHZnK2xlWVZzamdnL2JkaGJZeW9jVUVzNjQ1?=
 =?utf-8?B?aDIxcE5lMUxTVzZvanRURStQcm5pT0RsVWhqV0xJVnJnZ2Q1U0lGUVBYb2p4?=
 =?utf-8?B?b0hRTk1PM2t0aUpSSjcvOVdrV1h3RWJrZWg4d2l0RTRPSXpRUzEwQS9HeTFR?=
 =?utf-8?B?YWNUODF6OWFrTE1URWFhRk5KY0c3N1ozSXJBVnYxdjhuMEdPajJ3amtJTHk5?=
 =?utf-8?B?eDJ0SGl4ZDRydk1LYU1nc1ZuQWxBbzlJS2JFK3pqUHlOdE5KQ25teDF3NFVy?=
 =?utf-8?B?a1k0Q3RnalR1ZXhCVHNqdlU0M3B0d1RiYVliUnZTZndYTzMrK0V4d2lsWW9o?=
 =?utf-8?B?NnZjY1NCSWNiYkJUWTFETzNRMi9pRXlPS0pENkJ5NnZ3Q2VWeVhERXVuMXdC?=
 =?utf-8?B?RzZSVmY1MHB4RHNwUXVHdmNSM08vMVA4Vy9vUXVqVUt3a1NCRU5JZUc1U05U?=
 =?utf-8?B?TmVnYmMrZytqVFlqMytlNnVycFlXR3ZadWl2d0VtanY0MWdFTnlqVEs5c0pE?=
 =?utf-8?B?WnBDaS9lS1RxK2JLNGxXQnlUY1NxbDVoUVh5WDNBaktPS1NUMTRKeE1DMkVC?=
 =?utf-8?B?RVRBYUdmTm9UNWNSU0xqS0Y4OUhZQ2J4ajdhd0pzQkhKbnBSWWlZTW1ZeGNI?=
 =?utf-8?B?a3pPcjhkbHhVSTJVU3ZTalJicWNRVXZubmkrdzNoYUU2U2Npa0pIbjlXYWRN?=
 =?utf-8?B?ZFhWbkJ3L2w4eHdwcEhMOWp2MllJd2tRTDdCdz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 16:08:09.5186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a66047fa-e720-47eb-bd21-08ddbe39a1fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8810
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


On 2025/7/8 22:36, Mario Limonciello wrote:
> On 7/8/2025 3:42 AM, Samuel Zhang wrote:
>> dev_pm_ops.thaw() is called in following cases:
>> * normal case: after hibernation image has been created.
>> * error case 1: creation of a hibernation image has failed.
>> * error case 2: restoration from a hibernation image has failed.
>>
>> For normal case, it is called mainly for resume storage devices for
>> saving the hibernation image. Other devices that are not involved
>> in the image saving do not need to resume the device. But since there's
>> no api to know which case thaw() is called, device drivers can't
>> conditionally resume device in thaw().
>>
>> The new pm_transition_event() is such a api to query if thaw() is called
>> in normal case. The returned value in thaw() is:
>> * PM_EVENT_THAW: normal case, no need to resume non-storage devices.
>> * PM_EVENT_RECOVER: error case, need to resume devices.
>>
>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>> ---
>>   drivers/base/power/main.c |  5 +++++
>>   include/linux/pm.h        | 16 ++++++++++++++++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
>> index 40e1d8d8a589..7e0982caa4d4 100644
>> --- a/drivers/base/power/main.c
>> +++ b/drivers/base/power/main.c
>> @@ -62,6 +62,11 @@ static LIST_HEAD(dpm_noirq_list);
>>     static DEFINE_MUTEX(dpm_list_mtx);
>>   static pm_message_t pm_transition;
>> +int pm_transition_event(void)
>> +{
>> +    return pm_transition.event;
>> +}
>> +EXPORT_SYMBOL_GPL(pm_transition_event);
>>     static int async_error;
>>   diff --git a/include/linux/pm.h b/include/linux/pm.h
>> index 78855d794342..d1cb77ede1a2 100644
>> --- a/include/linux/pm.h
>> +++ b/include/linux/pm.h
>> @@ -657,6 +657,22 @@ struct pm_subsys_data {
>>   #define DPM_FLAG_SMART_SUSPEND        BIT(2)
>>   #define DPM_FLAG_MAY_SKIP_RESUME    BIT(3)
>>   +/**
>> + * pm_transition_event() - Query the current pm transition event value.
>> + *
>> + * Used to query the reason why thaw() is called. It will be one of 
>> 2 values:
>> + *
>> + * PM_EVENT_THAW: normal case.
>> + *        hibernation image has been created.
>> + *
>> + * PM_EVENT_RECOVER: error case.
>> + *        creation of a hibernation image or restoration of the main 
>> memory
>> + *        contents from a hibernation image has failed.
>
> I don't believe this documentation is complete.  In the use in this 
> series those are two events used, but as this is now exported this 
> might be used by other callers later which could use it for other 
> PM_EVENT_*.
>
> So because of this I think it's best to convert the comment in 
> include/linux/pm.h to kdoc and then reference that from this kdoc.


Hi Mario, thank you for the feedback. I don't have experience on kdoc. 
do you mean generate new `Documentation/power/pm.rst` from 
`include/linux/pm.h` using the `scripts/kernel-doc` tool? Could you give 
some guidance on this? Thank you!

Regards
Sam


>
>> + *
>> + * Return: PM_EVENT_ messages
>> + */
>> +int pm_transition_event(void);
>> +
>>   struct dev_pm_info {
>>       pm_message_t        power_state;
>>       bool            can_wakeup:1;
>
