Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BFB9E77E1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 19:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4435410E13A;
	Fri,  6 Dec 2024 18:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m+5XHZ7c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C799810E13A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 18:13:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K90VPjCl3w3OTLEQzfit5xN3QCYCJqI7xvcA/76ImSVcf/wkIKLXjY9+77yg06xybAJvMIBWnrNJQJDxdYOnFwWm017Gs8biPdbwLBJth4JehekDe1SP+GaVjO7/XDUGpzLyxkLLrS9fmvWEGqWcBIS6yY0cxfDF+i9wVSXhwmq4/0Hu/h/LxUPAyDYyu6Wo1t08ijwGdxuZsvunFeDCNHWTZBYAS7XMc1sjPFhADfCz7kpXscDCetwT3FoiwnPuuIaCkJn6ycBiQdKgA+QEYzbvoRNaeWWYYyle05l6S3hxzI/iLQRNV8uRsRDOgmRbZEKBm2EhypbqnsMYAXxKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/XxADOKxoUshNUU+950NSbLe9FlW2hYKL1mi8hUNgg=;
 b=t6+nhW/5IBbYxF3CSHHll2JaQWwZLdt+YTQLjm90Wnt1PoeqRmFUMXE2O8D5JH0OmvnMGgyVyVBmdLAQ2zXeWewFyXhV2Kob6+ZmG3VNPJF2MNlLxoWWwelB/Ybg1oxgAX2zysAo7bpI5MdIUmB3kx4S7BFXrc8VTFyiuYjEf+q+SK7KODc06TOpvFMYiarx2KIN3UYwMI0y9s1pqsRlc0Ntp8inLZdNsxCQWlvakcTzNVm7MFrJRjJ0H6eQ/1xP0pz5bN7/YWr+PJAI/KywmvAUJr9bWLzy1RoRW1keNgmuTrngr3J3MdCxXz5o0lL4GEaXKXcEvO13nmUdg6ODDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=fireburn.co.uk smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/XxADOKxoUshNUU+950NSbLe9FlW2hYKL1mi8hUNgg=;
 b=m+5XHZ7cwZ5qK4k0iBnWnRZAf1d50D5VmGBtqHAXfNDgdpRDdutt6dLRt8CB/JgW/TcHGceV5oGNNJ7ndLG4qX6Ucjz/m495hi5YFfhYnPIlWzOFX24H0/YE1eG48og7kcON6ulR+4ZkWk9OyfOZaLgbWeq0KkL5/dzAOdPa9pA=
Received: from BY3PR05CA0060.namprd05.prod.outlook.com (2603:10b6:a03:39b::35)
 by IA0PR12MB8839.namprd12.prod.outlook.com (2603:10b6:208:493::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 18:13:49 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::ba) by BY3PR05CA0060.outlook.office365.com
 (2603:10b6:a03:39b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.9 via Frontend Transport; Fri, 6
 Dec 2024 18:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 18:13:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 12:13:46 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Dec 2024 12:13:46 -0600
Message-ID: <7cf3e84d-002a-57cf-2412-f4aa2ed0b2ae@amd.com>
Date: Fri, 6 Dec 2024 10:13:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 03/10] accel/amdxdna: Support hardware mailbox
Content-Language: en-US
To: Mike Lothian <mike@fireburn.co.uk>
CC: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Zhen,
 Max" <Max.Zhen@amd.com>
References: <CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com>
 <c9e86bf2-1d97-87bc-e170-4525d304d89d@amd.com>
 <CAHbf0-Hb=y02=YX3O6Hb7yYH8922sPchWn1YYADNFSrzonoSzg@mail.gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <CAHbf0-Hb=y02=YX3O6Hb7yYH8922sPchWn1YYADNFSrzonoSzg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|IA0PR12MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: 01094b19-13f2-48b1-205a-08dd1621bb45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emV1MlhjcUd6NEwwUEY0L09CY1dLYjNzNGQzeXJPZ3pjQ29OOTV0c1BMNFJ6?=
 =?utf-8?B?TjVYbzBFblNFVDJna1dKVTRacDBXRmYxQWFCYktUT0dLcGM3OVBtOXZMeENq?=
 =?utf-8?B?MGJNSEFGWGJSaWxhS2tLbnRCSHZPdnZyWGc3QUVNLzluTC94QmpKTHpYVlFZ?=
 =?utf-8?B?MmtoYjRUWSs4VEhzSzR3NURNbW1OUmRJQVBXVElBY1JkT3hsM2VCbXd6Rngz?=
 =?utf-8?B?TmlrWStzUnFMTGIxM1J1cW1HMERobVR2U0RjK2JWTUszazhvOTRIMFdJZFdO?=
 =?utf-8?B?b2lZNDJ5QU00YnNRYnl1ckZXaWRtcmlwRjFWNGRQODNueFFhRjEwc1dRc1Ji?=
 =?utf-8?B?MWVnRllmUlpHeVNGaXF3eXBwemxwV2xuSTVxVmVLSHdSelpEREgrQkh2Rjh1?=
 =?utf-8?B?OVUzZ0NiMHF5ejFHcTVpOG1yeGJVN0Q4ZlhZcCtVdmMvYWltTzZnV2dYRjVG?=
 =?utf-8?B?NEZlL2ptY0NlRjROUzZwU2dGZSswSzJaQmdqZFR3ZSthM05DTlB0TkdYRzRG?=
 =?utf-8?B?bVA5Y3d6eC9ya3d6Qk8xSU1jNDQwN0E0WmRnUkdqQWxSUCtReHZDRmhIcFNE?=
 =?utf-8?B?UDFXajhoTHRURHg1aUNDa2tKNjdIZHZsMG9NZVNwYjBOYlFMQ21hbmdMVlha?=
 =?utf-8?B?OTl4SWZQUHB2aStRdzBsOWQzYkJKamFleUtvcWxBWUp2YVEvQmhKMlpuTzRl?=
 =?utf-8?B?MVlyYVp5Tk1KcnRwV0F4R1RCN1d3b25raDF5cENRMWN2MVFVQnM1RkEzbjJ1?=
 =?utf-8?B?MnFybkpkWXR5TnlQbmdSNVlvdVN1NnhjWitsN2wrbjdZK2IyRGtaOWpBVmFi?=
 =?utf-8?B?T1ZmNHNzenp0cGRpTGFCRS95WDJxbHZpUTlZR3djSDQ0eGFuM3NxS050R2hk?=
 =?utf-8?B?bGpweUJqRUxIWW5FYW5MSlBKQWJyL280Nks0M0RZWmVYR1o5dnc4WlZtWlJt?=
 =?utf-8?B?clRReWRYaXUxem80SEdOWE9Ka2Z3ZGNwQUdZbzhFY2dMT2ZPMG9DQzk5K0wy?=
 =?utf-8?B?eDFuNlFOak9FdkduSUJ5dVFCZ3hjblRrMVExd21OcGRHZDR0NkpSbXJ3K2M2?=
 =?utf-8?B?M1IyT0FQb203NTZOUEJiVnczMUxGbFNFcXhUMVBkR2VjeGR1emppUlluY1NX?=
 =?utf-8?B?RWQwSVExM21xVDlBVCtTdjUvbGRnVnZWSC9ONEJyc1JKZnBXOG9XSTZlU1VG?=
 =?utf-8?B?OUlTK3BoYndQMWhGdCtwSUY2MkloQWpBaGJjUkY3Zmhwc0tnUm9DWmNnYzFw?=
 =?utf-8?B?SG5GbmFvSnpOMlVmNnYyTzFHTG5PQjBHWEgzdy8zT0xrWTB1c0duMUVaYkFr?=
 =?utf-8?B?M0ZoZ3JnNGhlUU5jRFZ5ck9OR0RHUHRENnkrVlA1Qm42QkJIdE9kaTVYekUy?=
 =?utf-8?B?S2w4Z2NodzVzczMvdlA2RlRtMEFzM3U5aG9wbWxuZFNHK3hVcS9SVjFRYWI3?=
 =?utf-8?B?bFBBRXpRN3k0T3FXbGtieDUvZjgyUWF6RzFxdzFUem5sRk1rWmkzSjlJdmMy?=
 =?utf-8?B?WTE5U1FnOGhMa0o2MHVCMEd2aDlxR3BhaHlxV2wzUEgzUGJNSXY0YlJIOTAr?=
 =?utf-8?B?TFVRd1FvQmxabzJIWHFSWndGbzVOQmxQSDJMY1dKS1MrUTkwdVgySFlOR0sx?=
 =?utf-8?B?b3daaWxwa0cwTkxwd2xOcFJXRW9BRWdYdjhzODB6dk9QeEpveStIU0xlU1Ns?=
 =?utf-8?B?bXR5dTVlVzU5WThmNmx2VVdLcDdMS3VLQXBWeWlKa3RoZ1ByQnJhMWM2TEln?=
 =?utf-8?B?Qkp2WThLV2VqcHhoajZyNnRobzA2MUNPYmtrUC9OK1lOc3ViSzltMlRMWjNM?=
 =?utf-8?B?Mmp4WW1iV0dXSGt0TlBpK2R2bm9mOVk2QVdmRTZ3Zko5K1F6WXR4SzB6LzRC?=
 =?utf-8?B?QVpTU0hyNHF3Ym5vbGtYSUNRdll1Y1ZrTmxoSVpKK1pGUER6cE5qTG1lOUdX?=
 =?utf-8?B?c240NFFvbkFnclMwMFgwbUZjNVpLODgxQVUxTnU3ZmRkTlB0YzJHRndWcmpY?=
 =?utf-8?B?UXJDemVRRDl3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 18:13:48.6517 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01094b19-13f2-48b1-205a-08dd1621bb45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8839
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


On 12/6/24 09:52, Mike Lothian wrote:
> On Fri, 6 Dec 2024 at 17:10, Lizhi Hou <lizhi.hou@amd.com> wrote:
>> Hi Mike,
>>
>>
>> How did you install npu.sbin.1.5.2.380?  There should be a symlink
>> npu.sbin which points to npu.sbin.1.5.2.380.
>>
>> https://gitlab.com/kernel-firmware/linux-firmware/-/blob/main/WHENCE?ref_type=heads#L2719
>>
>>
>> Thanks,
>>
>> Lizhi
>>
>> On 12/5/24 07:44, Mike Lothian wrote:
>>> Hi
>>>
>>> I needed to add the following to get things compiling for me
>>>
>>>
>>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c
>>> b/drivers/accel/amdxdna/amdxdna_mailbox.c
>>> index fe684f463b945..79b9801935e71 100644
>>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>>> @@ -6,6 +6,7 @@
>>> #include <drm/drm_device.h>
>>> #include <drm/drm_managed.h>
>>> #include <linux/bitfield.h>
>>> +#include <linux/interrupt.h>
>>> #include <linux/iopoll.h>
>>>
>>> #define CREATE_TRACE_POINTS
>>>
>>>
>>> I also had to rename the firmware in /lib/firmware/amdnpu/1502_00/
>>> from npu.sbin.1.5.2.380 to npu.sbin
>>>
>>> Cheers
>>>
>>> Mike
>>>
>>>
> It's just a clone of
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
> in /lib/firmware, there's definately no symlink in
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/amdnpu/1502_00

Did you build a package (e.g. make deb) and install it? I saw the 
symlink with the generated package.

dpkg -c dist/linux-firmware-upstream_20241110-135-g06aea4d8_all.deb | 
grep amdnpu.1502
drwxr-xr-x root/root         0 2024-12-06 10:05 
./lib/firmware/updates/amdnpu/1502_00/
-rw-r--r-- root/root    246656 2024-12-06 10:05 
./lib/firmware/updates/amdnpu/1502_00/npu.sbin.1.5.2.380
lrwxrwxrwx root/root         0 2024-12-06 10:05 
./lib/firmware/updates/amdnpu/1502_00/npu.sbin -> npu.sbin.1.5.2.380


Thanks,

Lizhi

