Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924EF997955
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 01:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00AA10E0A5;
	Wed,  9 Oct 2024 23:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hDs6+y+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389E310E0A5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 23:51:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mb5yWOoIxWpxkAGr9XgiEU+EERFdShzc+nmCf57fd7qowUHUhzIrznMjbCErqzMUWPhYBJeEmv2eMXplRoVteByO1jgUq+0h68bAQS2scP3t257upqlP0pj2j2RICQEGkAQ1kvg00MfvqES8cBP+dJBL9smX7uyfnede6ov+N/WFP1IBU+m/Grr5YwKTchm9+8LZ8thj0qq3cxemLIaTHy0cv8+wQfRi922BeAK3OAXvU957o/wpzPoGKLaktvlHaPeOq9XEwM/0LT26TZpFEzXtBSNaHoP2trwmvkOzcqgkJcaYskhcL4nvXa7x+6LbUhD03GkrhFdTLH4LT2TEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eX2OAhCGpcFZh7VQw47FwA6hEQBvjr6MRTa+rb55kAk=;
 b=mWKN67DAg8aC59sGb2NnUvjEcPui+EAFN1lcainLymus7Lp4djGq9JJHr5o5VAklaPtinZhOa1/JmQ8s1Nl9l3cOF/SMuURoRwiUFEnv5zjDRwfNTpHYIcqWKeZDhoJqTGiQiHieU4DUClK6GRlHfZMVgU8vy8Kujm4p+W9YBHW/MZyes9z4rG+5oAss61xvsQARbnsotpc0qIXMGVh9YZuevzdx3megvFk2HdvaobrwMNcM2drj0+rMFN6ykfxNUoW0ExVmhdDopGUwd+q5/OmY4dawAhS7ec6Jzl545GIgYqfcogAycVcpMJMqGZzn2xi2SLUP7iEKctXYKcu8Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eX2OAhCGpcFZh7VQw47FwA6hEQBvjr6MRTa+rb55kAk=;
 b=hDs6+y+/cS6YR2e9rNF8alcRUWAPQBQt5Ws/ti0N43pxYY5zXBc0DMPKvSaJOAHHYOhPjKDJp2dHWcJQjOs7qyVJP2mEgaCmpfMyK+tjYIGbx/wdByGG3ICkF+HxFsm0CFX76PsAa/97V9ONDlTmiAyJoV7Jq0LSVJP2SdXFg3U=
Received: from MN2PR05CA0021.namprd05.prod.outlook.com (2603:10b6:208:c0::34)
 by SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 23:51:21 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:c0:cafe::7e) by MN2PR05CA0021.outlook.office365.com
 (2603:10b6:208:c0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16 via Frontend
 Transport; Wed, 9 Oct 2024 23:51:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Wed, 9 Oct 2024 23:51:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Oct
 2024 18:51:20 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Oct
 2024 18:51:20 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Oct 2024 18:51:19 -0500
Message-ID: <7cd0ba15-2c60-3b0f-a388-46e7b46a09d7@amd.com>
Date: Wed, 9 Oct 2024 16:51:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 11/11] accel/amdxdna: Add firmware debug buffer support
Content-Language: en-US
From: Lizhi Hou <lizhi.hou@amd.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-12-lizhi.hou@amd.com>
 <1a2bb8fc-0242-d86b-1de0-cc9eec1c61c0@quicinc.com>
 <08835e82-f9e4-52e5-5d03-fa31ecf63314@amd.com>
In-Reply-To: <08835e82-f9e4-52e5-5d03-fa31ecf63314@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|SJ0PR12MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: bf87d6ad-5b38-4e48-8484-08dce8bd46b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTJ3RWRrUEQwQnRtRngxOEx3ejh5YnlKa2pGMlVuQlUzQ2RTUlZmZ1hid1JP?=
 =?utf-8?B?WWczcnhSNStFdEIzR0RNS1dPODd3Nk1zdWhhTHBycjFzRm5qRkZTNUVLdWkr?=
 =?utf-8?B?eTBtTDZqWkdJeDNZdDZneEVaR0NiWFllMnNUaUdDZkhyZ2dUa25aazJZK1Z0?=
 =?utf-8?B?UGdHOVowb3p6ek5DZTJuR3FvTW5iTXEvV3hBT2JrdDNnOUY1TDFpZkxvdVRm?=
 =?utf-8?B?c3l1amc0OXpmb1JJQ0dFNUd0MTRMRW43OUxTZ3BMSWs2MFNVQnhKR2ppODgy?=
 =?utf-8?B?aWttMEZ5NEVHc2JVRk9LNEkxQjB2TVE2NFlkZERwNkFpYkxGUVcyQnZPZkh1?=
 =?utf-8?B?U3BZZ2tSQ0tJd1I5M1QxZEtrVDJyekxvdUFRaitjOHl5cCs0N2RxS3hFWGs4?=
 =?utf-8?B?ZnRHb1Qxc3pGbk1BVWNyU05kNDVQRDJtdkMyTi83VHJWUDJINzF5YjcxMTFi?=
 =?utf-8?B?dWpHbjBiYVdodnJVOVgrVjNxK3FVSjU0ekZXR2xwa2JwRjFydWlYZCt3Q2hC?=
 =?utf-8?B?YTl6T2VIa21CM3FucHZ2b0VPeitSUlYwRXdSc255UVVwb0NSdDkyM2Y0Qlds?=
 =?utf-8?B?YldRRnM1RG1MZUMvSVZucmFON3k3RmZ0aFMzeHJzbFdkdUZsOHpNUFpBQVhK?=
 =?utf-8?B?ODFSenUxd0tZN2orUVprVVMvRkMrVE5SMEw3NGZSN3lsK3N5d0JlNFRLWnBW?=
 =?utf-8?B?ZDQyemEwL2lFQi9YUnBKUUJaTXUvTWF3dGZETUNPcEhrTENnalBROWhUSkJr?=
 =?utf-8?B?cDhISUNqOHNkNldmZWpZRXR1M0x5UmUyaUNIclVwWWVpRTFJWW5Fb2FxY1l1?=
 =?utf-8?B?MHdFcnBCT2h4SDBnMnVlckN0dXlaTndqSUJackxXd1IydlVuN25EZzFBdWRy?=
 =?utf-8?B?ZUo4WTNnak9nVW8zeWdpMWhKbnBVMTRtYjQ1bGx4OUVnNWF5aGNQMzQvaHB6?=
 =?utf-8?B?dlpKWHJnc21adFVHbmRhNk5Ybm84b2tac1lpVkFxQnJsQUNVbGpNTGZYMnI2?=
 =?utf-8?B?a3VFODRFQzl6YmV6ekdKSHhsZmtON2FlTlUzNFdWODcxSGE2QkF6eU5vSjFu?=
 =?utf-8?B?SXVyNWVFa3p4UFFMT3pzOFc0Ymo3ZXdkV2VKZTJOQ0tEUDBIeE9YSXJwRXdD?=
 =?utf-8?B?cnpNTDRsYmpPOFRrZjVLd3pxYUY2TFRaWFN4cWFqeXZ2TTFLYms2ckw5WXFo?=
 =?utf-8?B?TlE5anpUNjZrYXRLYnlMZlVpMC9hY0ViRTNDOHpINW9ENE91N09SQkI1VXhC?=
 =?utf-8?B?bUJJWUE5b2h4RDNMNDkyUS85eFZxMTZnQ25hUEhTYm1NSmZBSG4yMWF3dTRm?=
 =?utf-8?B?eGVLcnlBU0Rjck8vZUFuMDFId2dpMEdoUnBlVGtuVjVIeHVoendUY1YwT2tm?=
 =?utf-8?B?SXMvMXBnUFFZSlVQd0Z6QWZPdGl5ejE5cDZCZnhXM0RtVmljRkpPQ0daay9H?=
 =?utf-8?B?clVZN3g5alp1aFNkdWl3NENzdDY5eS9uNGtSMEZGQWoxYVp3QWVXcS94a2tV?=
 =?utf-8?B?Vk1wZUZIQmpjaWN6R3RkODNkYTJrM0h4UE1CcFU5SjRseTJQZmowSkVvcEla?=
 =?utf-8?B?MEIwRkVQWGZzWWJLOW9kU2JIclV4d2k4TEJ6MXVaN1RlbmM1RlJSMlhjVnR3?=
 =?utf-8?B?MEU0eXNDU0NpOHdzMVlUWnl0cjRQZXRiUnh2U0RZNE5aNis5dUNtN2FZZUQw?=
 =?utf-8?B?SEdXTjErT0x5V3lVZ3JiVU40VFlKY1FoUU80ejlOQWFDcUhFaWdkMGYzTzVK?=
 =?utf-8?B?aGJ5ZC9PdE10alZsU1dycGF2MVlqT1VqSlFOMVR6TnNieDVjVW5HU2s0VDlv?=
 =?utf-8?B?Z1ZMbnVHdWM1S0Q0bW1pSUVZSXE4TFFiS1dDZzlVd2VIbGJ3TXJ4Rk5Td0M3?=
 =?utf-8?Q?LFhosDO0zdVa3?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 23:51:21.1684 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf87d6ad-5b38-4e48-8484-08dce8bd46b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7007
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


On 10/9/24 09:22, Lizhi Hou wrote:
>
> On 10/4/24 11:33, Jeffrey Hugo wrote:
>> On 9/11/2024 12:06 PM, Lizhi Hou wrote:
>>> User application may allocate a debug buffer and attach it to an NPU
>>> context through the driver. Then the NPU firmware prints its debug
>>> information to this buffer for debugging.
>>
>> I feel like I must be missing something. It looks like this patch 
>> accepts a buffer from the user, and stores it. However I don't see 
>> how the NPU firmware ever learns that this special buffer exists to 
>> then use it.
>
> The debug function is incomplete while I was creating the patch. Thus, 
> I put a line in TODO "Improve debug bo support".
>
> We made progress on this feature. Should I add the code to V4 patch? 
> Or I can add it within future patches.

Discussed this more internally. And we would postpone debug_bo feature. 
Thus, I will  drop this patch for now.


Thanks,

Lizhi

>
>
> Thanks,
>
> Lizhi
>
