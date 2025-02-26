Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC3CA4663E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 17:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7B910E94D;
	Wed, 26 Feb 2025 16:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T8zaMfCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22F010E94D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 16:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8TK9TSoKTxoRQcA+qXK0sV8dsOOINtlK0fH9AOVhNQ1Q/4p9qC7yY0pIf2uHmILFi/4mmcxUo3XVJNHjKVdCOHq/sHwQax1JPpmCe16+u9qgXEpd/UaTz6+gX9a1vuejiCqufawKnpdcjI9VLyDJ2LfwmK6rnBXJ2YX+cMdqtTF9QL6dfxw+3oqO5NjBstbiVfjP+LS9ko5P8EDH+1NvSTLBUeyEM7aysG5f7t9VP071huglKBlbn+a3UzAlCV77XpnGHJozO+NIEX97KXxFyHQ9rXqB/kq3cjCrm3wEX5lXlwNauH5IFVgnD+LvCSB27PF1yXlQ0yl2OndFLxm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upqZuk3NtX3V1VNdruHomEHkbGSZ/EyhxFdJ2+dVk24=;
 b=GAQkr56yTG3tG4gObtT2lw+ZruuOC9ibL8Nm2+4idVm1N3V/jC/HKs4HKF1dpVKDZYzbEYnzEdpFFEZrwPrqgXfz/9TTZhyVuJcbUQkP000+lgLE+6eM2l5SZzrxjUmXDxXnFrbaUY6zUsGpBWKUWiTI4HJLgi+PxWOYuZkWGS58nOeLAsvQPdnVVxrP1qohNMPA+/z622BjVmCfG3lgjJ62/WmqgzA3FsOGO+cumjdzkHrBe6pp9H8aAQ1a9v2TYzTbBni2eaVgsiaC3L9dTzMSl1QgYlfP5tB7ome+Acw9W6mp6MjR+ITISi0hQ6mL5PQoIpp7aA6sqg4dgpg34w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upqZuk3NtX3V1VNdruHomEHkbGSZ/EyhxFdJ2+dVk24=;
 b=T8zaMfCFCAxVkTX9s+QZQxZAY4o8aHyaEm5nW6pz4/xzuqhbM3yMLYyxW68p8SjmAGOTWtUPo8uhr2mEhAPkVKIVEkKnF1BW8tT4/TZdR4gfkjUlwDvkZywM3qElO2DBFJlsaBfMGkMxpBYIIO2iFWztwFllUP52OQHYc43pjik=
Received: from SJ0PR05CA0025.namprd05.prod.outlook.com (2603:10b6:a03:33b::30)
 by LV8PR12MB9232.namprd12.prod.outlook.com (2603:10b6:408:182::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 16:12:34 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::26) by SJ0PR05CA0025.outlook.office365.com
 (2603:10b6:a03:33b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.15 via Frontend Transport; Wed,
 26 Feb 2025 16:12:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 16:12:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 10:12:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 10:12:32 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 10:12:32 -0600
Message-ID: <7b6c905e-9015-08c7-0b56-9cb43dfdb122@amd.com>
Date: Wed, 26 Feb 2025 08:12:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Check interrupt register before
 mailbox_rx_worker exits
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>, <Mario.Limonciello@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20250225172616.3804796-1-lizhi.hou@amd.com>
 <8c8fbd0a-7c5f-49e7-b02d-031e8b712883@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <8c8fbd0a-7c5f-49e7-b02d-031e8b712883@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|LV8PR12MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eea61c3-457f-427c-d0ca-08dd56806129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkErS2lWRU5JZ08rZDhhTDd2K25BUDR6N0lwdVZuRTI4MmZYODNKa0daZ0U4?=
 =?utf-8?B?VlRqSnFTeFN1VFVOOU4zK0JKdWI5aFhxVWIzN1JGODA2ejFTYnQrZnFMdFZH?=
 =?utf-8?B?Z01iN0VtSlV6dUdvdmliMVRGdDJwbGsvOXhZTzM1ZTZlZWRjQTlDaExqVEYw?=
 =?utf-8?B?cis3QzJHWjJmZkp0SUkvOG9iWEpzb0xZSjZzenM5aVRVZTlHUnpkSXloRUU4?=
 =?utf-8?B?NnllbXRSc0RJMnVWdEVkVTVtN0NnWEtKcmw1SkRLS3FGclE0QlpxYXp4ell6?=
 =?utf-8?B?WG1QRi9KQXNWZWJ2alJ2WGJ3aE1Jd3g0RmRleUNaM2lYNmhiTmhBSldrUklv?=
 =?utf-8?B?WEw4V2FaY0pVYjNWcjA5MkExT1ZBZ040OFE2QUo4SzJvRHQ4YTd6MTZKaXpt?=
 =?utf-8?B?c01xUnVIRFpyRVVNZmFSUENHdUlKcEE0ckMxamFPUDRZb1R1dkdHTVcvVEdJ?=
 =?utf-8?B?QVlBckh3a3FMektrWHc3VlV5bzlzc0pIK211TzdlTTRxU090RTN6WWZrNlEz?=
 =?utf-8?B?dnBEZGNieC8yMzZYVXRWQWlpazhiMXJ6cm1EaVRVYThGcUNrL3BEQWhZVlZR?=
 =?utf-8?B?eHpxd3NsK0VWYjBzd3RGKzFHTlBMUDZqUEVpbTBENFRzdDNJRDVmYUt0TGI2?=
 =?utf-8?B?ZjNSNmpQQ2xUZ1VNdnMwUjdSdDI1cFZMSVZpR1FKdWVScmM0MGh5bTlDc1Ix?=
 =?utf-8?B?R1JWRlhTM1FKYmI2UVpGc1ZWQXRmWTZPNm9VQ3VwY241UGp6VlMzclZqVnBB?=
 =?utf-8?B?QmR0UHYvdUZhS09ySmFWQTRud2tCbnlLcjVLT1VpUEF4Rk9iRVZYeGhLYU9k?=
 =?utf-8?B?MUNwVTd6aDF6enVYbllRMEx5TnhzbTRhdDBFVkwzT3NBQWFwcmhqTmJSYkF4?=
 =?utf-8?B?QTYyZ3Iwa3F1dm9DNjdiQkRxcXBJdUQ1VTAyR1M1WDBqVG51dllvczgraEV4?=
 =?utf-8?B?R3UxdmhXUzNmVWZWc3dvRHJTV0J2cUhDVzd3UmNLUUszZGhvTXhVNURNdDRm?=
 =?utf-8?B?MzBlTFVUR1VzVVozeklkUlZ3bmFNdjNGU2tzKzhwSEVLU1Y0TkFnOHdPdy93?=
 =?utf-8?B?RUZwVVlKN2JUQktndSsvczMwcTFMWFF0MjE5QThIZ1VLRm1YR3h0MXlwak5J?=
 =?utf-8?B?QVlhL3BhZ25XM0ZSWE5HZzdUSDc2OS9qdVZTRU1GdUpVNWNwSnJPRXF0T0RU?=
 =?utf-8?B?SkZnMXVvdHpPNmxKdVliMkEyRW0zdnovVkdBNW14anVJVU5IQk9KUTZaRXpD?=
 =?utf-8?B?VThMSHBQcm9ka293OW10cEhTS29yQkxhTHlLMXJ5Rk1Pb2xoTVhsWFdWYWRW?=
 =?utf-8?B?MEpubEg1NEpuem9PSWtKbG5aeWVsMGdUcFFmdXI4U3FiVUFQTFBFVXFRMVVn?=
 =?utf-8?B?MmNQQ0VRU1R0NGZHR1BLeFpOY2xPYWFnbk9hblNaWkY3SUpGaWdOaHFMMmlD?=
 =?utf-8?B?K21GeGlHZ1B4VlFDZzlSenRncDhjYVE5Y25sbFJRQ2k1aDd6dGE0SDVXaTlV?=
 =?utf-8?B?T0JQYUpnbGRJY1RoTFNaU0t0dzNOc3ZMRmxxbzloamVCeEROLzBrcnUvMGY2?=
 =?utf-8?B?U3pxcW1YcnNlWEI4OS9QTVRwekUzc21NTEN1VXhQVjgwM0Qyc08wVmF0R25s?=
 =?utf-8?B?RHZ1SEJDSEliMWFicTIzejJrQXBFZlg1aXZXamJ5cC96QXZ5bmM3d1duUjRa?=
 =?utf-8?B?UTFTMXloUjRkWmZ6T1dnQzB4NncxNEY4U094Wndmek9JaXAyU05FekpWREtC?=
 =?utf-8?B?WkRHbnVhcklHUER1dktYN0lQUk5USmJHQmQ3QWp4ZFNkd216clNZVElRcUZy?=
 =?utf-8?B?NlZ1TUpoanJwVmoyL0ZjMzNDRG9MTkRJeW9zNDhocVU4NmttTzJMaU53SER4?=
 =?utf-8?B?UWljVE1EbmF5YTJRT2oydmszbS8xVUdjNDIyV3VES203QmY3d0QyVnMyeCtv?=
 =?utf-8?B?SE9jQnJXcGppaXo5SlRtclI0Z1ZXUEZlaEdjYk53NUppd3djRzZhNlBFZnla?=
 =?utf-8?B?MmlKYko0dDFnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 16:12:34.0848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eea61c3-457f-427c-d0ca-08dd56806129
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9232
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


On 2/26/25 01:30, Jacek Lawrynowicz wrote:
> Hi,
>
> On 2/25/2025 6:26 PM, Lizhi Hou wrote:
>> There is a timeout failure been found during stress tests. If the firmware
>> generates a mailbox response right after driver clears the mailbox channel
>> interrupt register, the hardware will not generate an interrupt for the
>> response. This causes the unexpected mailbox command timeout.
>>
>> To handle this failure, driver checks the interrupt register before
>> exiting mailbox_rx_worker(). If there is a new response, driver goes back
>> to process it.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/amdxdna_mailbox.c | 18 +++++++++++++++---
>>   1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> index de7bf0fb4594..efe6cbc44d14 100644
>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> @@ -348,8 +348,6 @@ static irqreturn_t mailbox_irq_handler(int irq, void *p)
>>   	trace_mbox_irq_handle(MAILBOX_NAME, irq);
>>   	/* Schedule a rx_work to call the callback functions */
>>   	queue_work(mb_chann->work_q, &mb_chann->rx_work);
>> -	/* Clear IOHUB register */
>> -	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
>>   
>>   	return IRQ_HANDLED;
>>   }
>> @@ -357,6 +355,7 @@ static irqreturn_t mailbox_irq_handler(int irq, void *p)
>>   static void mailbox_rx_worker(struct work_struct *rx_work)
>>   {
>>   	struct mailbox_channel *mb_chann;
>> +	u32 iohub;
> There is no need for this variable. Just use if (mailbox_reg_read()).
Sure. Will fix this.
>
>>   	int ret;
>>   
>>   	mb_chann = container_of(rx_work, struct mailbox_channel, rx_work);
>> @@ -366,6 +365,9 @@ static void mailbox_rx_worker(struct work_struct *rx_work)
>>   		return;
>>   	}
>>   
>> +again:
>> +	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
>> +
>>   	while (1) {
>>   		/*
>>   		 * If return is 0, keep consuming next message, until there is
>> @@ -380,9 +382,19 @@ static void mailbox_rx_worker(struct work_struct *rx_work)
>>   			MB_ERR(mb_chann, "Unexpected ret %d, disable irq", ret);
>>   			WRITE_ONCE(mb_chann->bad_state, true);
>>   			disable_irq(mb_chann->msix_irq);
>> -			break;
>> +			return;
> disable_irq() should not be called here. It will be called for the second time in xdna_mailbox_stop_channel() and enable/disable calls should be balanced.

Agree. I will remove disable_irg().

Thanks,

Lizhi

>
>>   		}
>>   	}
>> +
>> +	/*
>> +	 * The hardware will not generate interrupt if firmware creates a new
>> +	 * response right after driver clears interrupt register. Check
>> +	 * the interrupt register to make sure there is not any new response
>> +	 * before exiting.
>> +	 */
>> +	iohub = mailbox_reg_read(mb_chann, mb_chann->iohub_int_addr);
>> +	if (iohub)
>> +		goto again;
>>   }
>>   
>>   int xdna_mailbox_send_msg(struct mailbox_channel *mb_chann,
> Regards,
> Jacek
