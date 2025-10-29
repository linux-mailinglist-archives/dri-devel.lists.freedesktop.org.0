Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12596C1CF94
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 20:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402A010E222;
	Wed, 29 Oct 2025 19:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x7nRolZ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A95B10E222
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 19:17:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdU7xHgAFK/YvzP74R6p58MGKrBpRzh9jEIrF7MdKsQWPEl8nGuOPDD5xKMiYv+SGcpFEYxszRWibYYrviy0IglcejaN22nPNcC6/3f/2Bki0Tm+0+bB0IkZLBFLDusMJytFJ7XVA5qmgWVvDtTpfg0ZopYSsvy3A7wg5+cwZmnCoAFps6YYqHBNSApbD08pUy++knxEtHTnXZv2DMV3t2LP4L9m67AqRHXQ4Fov1JDTsgUTVx7T7bWieALQ34B5TBCeEUKVOiTkAG5ATCXfNs8CJ3dk0mWVL0ohVhtSJ/BirnD/664P1F7L1/clvwhJx2LjJNs65oftgHci23e7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prnH9vUo2tzbyLklO1rwdijeVNb0xkm3YMvM973/QJE=;
 b=IIfIyX57BXUJQFjTsf2dszCsp9dbJbsvOjF4XEFx2+ylSfsLVVY6QEZtehuF9XgtQG7upvyJtIcZHgstSXysb1WD9wVXABS7uLCZ/XPLYCqtR0xsZTuknUkfOFQu4kB9pxA1HfU2IvUqshB+ru4WiykvBb+JATIcs/16bMP/uRICdqL6AtK0P9EbYm2t2gSKM9pNQgsaLzm1maXpTS0kphwjpbxiwVo9QcufHccPxQ411AH9eJYq6YUhs+TGSWWA4vxxA7ocEkB5ocs20O3rdliw1l/L5oU0Z/6Ct5GTfDdSjw50hOBwq2XaoeCb8iQ0cuqAYx+tpsb9R2IiNiGGNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=web.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prnH9vUo2tzbyLklO1rwdijeVNb0xkm3YMvM973/QJE=;
 b=x7nRolZ0HObhztw0P+M/ks+PNEQhJjU2+V843J7Cm+RzoKa8gBIiN4ssKRNwmLFQAiuYkPIt7PvTTY3XJUpWeCwjnTiIhX3s7IRsn/kCB9TqJRPC8MYrAawrV5jFTma2IIH01MI0bhM0bAj4DSdyBjHVN3NWCplTjlpJzML+Kys=
Received: from PH7PR13CA0004.namprd13.prod.outlook.com (2603:10b6:510:174::25)
 by BN7PPFB3F5C406F.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 19:17:40 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::f3) by PH7PR13CA0004.outlook.office365.com
 (2603:10b6:510:174::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.4 via Frontend Transport; Wed,
 29 Oct 2025 19:17:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 19:17:39 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 12:17:39 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 12:17:39 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Oct 2025 12:17:38 -0700
Message-ID: <260d8ab9-c986-9dab-a447-ebb55df302c9@amd.com>
Date: Wed, 29 Oct 2025 12:17:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: accel/amdxdna: Fix incorrect command state for timed out job
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, <dri-devel@lists.freedesktop.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Max Zhen <max.zhen@amd.com>, Sonal Santan
 <sonal.santan@amd.com>
References: <20251028175452.2329497-1-lizhi.hou@amd.com>
 <b7a2ac2a-53c3-49ce-862d-eaba86f0b298@web.de>
 <605e6f4f-8e96-dbe4-d43d-16bcac63f94e@amd.com>
 <3dd7e061-8e6f-4d3d-b56c-7005da8197f6@web.de>
 <b2cf67a4-6795-d743-e90b-db10f636db2e@amd.com>
 <6238912a-8733-4b2c-a155-82bb081e6063@web.de>
 <e4c8b7be-588d-b0b7-00ca-e60cbde034a6@amd.com>
 <80fe1dd3-7541-4629-a540-021603d1f150@web.de>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <80fe1dd3-7541-4629-a540-021603d1f150@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|BN7PPFB3F5C406F:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b1458f-dd21-47ff-4a6a-08de171fd3da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWh2VXhZQkYxSnJib0ZKeGVmTU5HUG5KbUYwRnhZUzJlV2pkL2R3RlpZVlpQ?=
 =?utf-8?B?NHlPWjFwWFRHZmpNVy9wNWRoSTgyeFhXSGx1YTlSYVJTWjRyYm1NTUpZOUhF?=
 =?utf-8?B?am1SSFEzVnRNL3N4L3IvWGp5M21nMVFjb0hrb0FWMmZ1T09CTlIzUHFDRVNY?=
 =?utf-8?B?R09PZjBSME53ZHhaK1Q0b2hSNnZhNzlCTmZOU3M4ODZCUjVwSzIrbFlqaWRl?=
 =?utf-8?B?SnB3WnBtS202MGxQWTRDamx0ekRIVUhPQWRsMHpXS3JqSEVRR0ZlS0MvQVUy?=
 =?utf-8?B?NUxkdUIxRXBhUmhucXFuaW16bk9Vb1dLb01QVkhESDVXVXBRbVpoNTFBVklj?=
 =?utf-8?B?K2NGZUNzcmhOTkZLNTArZGh1Qm5zZG15Yjh0eEtjaXMxdVhkajhLdmhXeCtZ?=
 =?utf-8?B?d1UvWXVCSnV2ZDM2NU5TdzFnRk03M0xnWUsxOTJLRkJoMUovVFhWNW1DL05m?=
 =?utf-8?B?SkJzMzQ4b0E1aUhrcTVHU205TVFpOXRPN0FsVEU1UUQweDNBQWJubVJ2Wm5n?=
 =?utf-8?B?NEJ5TnAzVGx4cG1IcXNBNSthMmNaZDJyaXh5K0xVWmxDQWpSV3JkMGREMGJn?=
 =?utf-8?B?YUdQVm50bVREUnBtZmpTK3A1RXYvWW1mUWxhSVBqYXhrd2dYVXZPZllzSlpN?=
 =?utf-8?B?MnFHM0ZkMjFZcFo1OVdVWFJWdVl1K1R6YTFZVHUrZE5OSEhxRk1MMnFLZldK?=
 =?utf-8?B?dDZVV0szM2xhWWFEQUltYWhuQndwQmRTZXUrTzZsaXhEU0JIc0lxQ0o3UWFS?=
 =?utf-8?B?dFpLS2pmWWVMSnBhekNkcHFSSlNVVmVqZ01PODVBaCs2NkFKcW0rSWZBR3l0?=
 =?utf-8?B?WlVIbi9YTTdHYmg5MG53KzdKTG94ZmFBeWoxYUIvdFVPWFhNYk0wTVBMQm9i?=
 =?utf-8?B?eU5oRjVoTEkrOVlrYVdjc0xOczV5eXRyZDJmNVVSeFdGVUdUdjIxREZ5S1ph?=
 =?utf-8?B?NVRTOGtkaVFacGJJWk1jVXFiTHMvWUJDN1NncmZGSXU4ampsa3pWdDlFY3ow?=
 =?utf-8?B?RnduZGJtd1ZPZXNZVmNMWWlEbGo3RWpwK2pYUW9iY1hFeCtGMENXZy9yM2Jm?=
 =?utf-8?B?MnJLNldTbjk1RTNvZUxoK0wxME44YmZ6TGt4aWJETkNYVDcxWW8raUJ4aDlY?=
 =?utf-8?B?aklWTy82cVorWE10NVEzeE1WNWQwNmp3eWJZR0xkMU15a2RXcFRHMXZoQ045?=
 =?utf-8?B?d05GQ09VbnNDTmhBWDFVMEIwclpRQUhwRWM4KzlsdkZJcGc0bi9zVlFSVjVM?=
 =?utf-8?B?TUp1K1o3dEtKMkxBaWF2d1RxeEl4V09zVGdXRkVRekYxSXREaFRpajMzdURO?=
 =?utf-8?B?Q3c2R1lRYnpaayt6U0JjNzA4S1ExN2xZUEc0ZEZkVklmVFowc0hja2t6cWh5?=
 =?utf-8?B?amx3RnBFVHlZMEx4Z0VTZ2VtNG84QWZRSUl3U3hZYjRkQVpqaWNJdnRNQkxV?=
 =?utf-8?B?V3VzVjBwU2Vxam1mMVpHWHZFZnhmb0NGVzBHbVhWNGgyZGxFa1A0cGFVdWND?=
 =?utf-8?B?Q3BJa3Y4cnhHVFdZSWZpa2V1ekNadGZUdXdqTjQzQmpnMmExNXUvZkowNzc4?=
 =?utf-8?B?dXN0YzdveVcvV1YvZWhBZTFnMnlEUU96REJaTzFsVGJlekUxOTdtYUYyT0lB?=
 =?utf-8?B?d1ZyRGhlcFU2Q3V4SG41cEJaKzJMalZnazhyaVMvc3hvTnhKQXFUeGNBbXdj?=
 =?utf-8?B?L3lSbkhBWm9vYmRwTTRJVkpMR1BBcmRTZE1qTFpSaVZjeVRYRTVXMHdDdXBr?=
 =?utf-8?B?ZEZ1MEFzVWFJZnJPMEJwMUdMazc2d0kvTFAyT2l4alkrREErc0hoa0xPK1ky?=
 =?utf-8?B?SGQ5ZzE5R096RUNUODhjZFVtbkFZb3hmSkdsSUo1RFN5ZFVZZ1MrMzl3UGJ1?=
 =?utf-8?B?VWFLL0xlWXBZem9EVkRsd2UrZXFEU1VWTkJqaUVodUFXMVgzZEtqUlp0d1Fp?=
 =?utf-8?B?dnRTT2tiVDlyRUxSZmhTZmFMbllJQllCN2YrMnN0TmtRWXQ1MFV4bWVtanQ2?=
 =?utf-8?B?c2srb2VYT2tRUENuKzdGTGd6ckpsNTVVWE5KTzZxQkZkUDEydlNjR1cybjIw?=
 =?utf-8?B?czBlUUxDVnBmSHhkaCtndTVGZXU3N1FBK1lRQVVUREpHSndmRk9BVzRZTmE2?=
 =?utf-8?Q?F0RA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:17:39.8036 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b1458f-dd21-47ff-4a6a-08de171fd3da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFB3F5C406F
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


On 10/29/25 11:54, Markus Elfring wrote:
>>> https://elixir.bootlin.com/linux/v6.18-rc3/C/ident/amdxdna_cmd_set_state
>> Sure. amdxdna_cmd_set_state() updates the return code to command buffer. So application which issues the command will be able to get the return code.
>>
>> The function return value "ret" is used by mailbox receiving kernel thread to deal with the error.
> I miss a clearer answer for the indicated function call incidence.
>
> Can it be helpful to determine the state value before it would be passed to a concrete call?

aie2_sched_resp_handler() is called either after get the firmware 
response through mailbox or the request is timed out/ canceled. So in 
this handler, it based on the response to set the state field in command 
buffer.

What do you mean here for "determine the state value before it would be 
passed to a concrete call?". What is your concern here? Maybe you can 
provide a simple patch if you think there is anything can be improved?


Thanks,

Lizhi

>
> Regards,
> Markus
