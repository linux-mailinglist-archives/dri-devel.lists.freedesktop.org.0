Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLkxNOX2gGmxDQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 20:11:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBA9D066F
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 20:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284EA10E2C9;
	Mon,  2 Feb 2026 19:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rVqFcaQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E3310E1C9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 19:11:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vedDDwfu76vPL/7W/MgqiSMTba25V73GsPCBeJsyheHAwB7ojQ7/WoK+P7Bc0xHbiLR7HNjMy9locqHdqX+E6zOdCOiI/YECWMJV56eHsiVbn6aCOQAiNqyQgKBlLpUdC8XOrsIx877bWgXrYIVu88Y4n5HquQm8OAB0fDbzlyVTd8TPPLnesC1D02JxliBvye9PRAa+fXL/NfKW/Wk+eEyZzXXyH8Rs85aH72PQPRWWYVVSK6JqTRVtWOlRZvzK/6aNTDE9RzwsF3tPWIolcXzM7dm8W5SC/Y2V0W5qoifxXeIIlz+4rtBP5Km9E2oSA5l2J9xbO6cXYy5jbduNuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QszJHHc9iBZyq1+GqZHsEuOpEY/M9c66XIWOeaiNCsU=;
 b=h0dnHG8o3BIKIlKjZwJtf8S1hEPRUKH/9G3TIFW1tJyIQruWadU1Eq81CDNxfaSKWqzRyMXC+dHi8FqhjaImQrQQw75dGpoJFYdFSI1OL19o65sPIU2UssrceI/Yzp/VcYCw1nD1AVIl+J9da6YYYzDyaCE6eXdNcDVAjJh1KJcqEtrg0Zo0rU2OyC2J5y9y0eFY6ItQ7sEcg48Uy/MFMmeJTAKZk/j3OBZLSbRtykJX+iq9uBopsObt/rMW/8n+mdgb64zn5uLzadz9l7l94/TL99iUbUG55CIIBISMfKzx0awyZ1ZxsBEKIhFYaAlSKmkKJyxtBapIVNz3ERyHug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QszJHHc9iBZyq1+GqZHsEuOpEY/M9c66XIWOeaiNCsU=;
 b=rVqFcaQsmaFqwL4xieyqiXUzWzzG8sUYwmh6aMg7+3XGT9zBOTYJ5jrhmQDTUrYs31Os5qMNIEezd+zJoTt1A90NkdEz5eTUp8GJTb4audFhqVmOdAdiK6s0JwQ+EYIbRQ34dh+B5+zbD/cpgUTJ14SbEcO9bkPfOtrtffeVnd8=
Received: from SA9PR13CA0093.namprd13.prod.outlook.com (2603:10b6:806:24::8)
 by DS7PR12MB6117.namprd12.prod.outlook.com (2603:10b6:8:9b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 19:11:18 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:24:cafe::be) by SA9PR13CA0093.outlook.office365.com
 (2603:10b6:806:24::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Mon,
 2 Feb 2026 19:11:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 19:11:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Feb
 2026 13:11:17 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Feb
 2026 13:11:17 -0600
Received: from [172.19.74.139] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 2 Feb 2026 11:11:16 -0800
Message-ID: <aada0fc7-aa2c-4395-97c2-d31fab529d67@amd.com>
Date: Mon, 2 Feb 2026 11:11:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/5] accel/amd_vpci: Add new driver for AMD Versal PCI
 accelerator
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>,
 <lizhi.hou@amd.com>, DMG Karthik <Karthik.DMG@amd.com>, Nishad Saraf
 <nishads@amd.com>
References: <yidong.zhang@amd.com>
 <20260126192732.1507084-1-yidong.zhang@amd.com>
 <20260126192732.1507084-3-yidong.zhang@amd.com>
 <3981d528-140c-42c7-94b7-007a84c1476f@amd.com>
Content-Language: en-US
From: Yidong Zhang <yidong.zhang@amd.com>
In-Reply-To: <3981d528-140c-42c7-94b7-007a84c1476f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|DS7PR12MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9fa684-f94a-4df5-d126-08de628ed7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnFoOUtyUWlFVGkwRFVxOG5uYnZPRFZ1RmpxODJraXlJSVJ4ODFBR2Fid2F3?=
 =?utf-8?B?VkxqbEN2ZFBTMHF2aWxuVk1aY2JuREtKNjhtVTkyZVRPSmNML1FiVWRlTGpZ?=
 =?utf-8?B?OUpHeFRRV2U3V1JQTGNEb2hmY0dsUkpLVDdsSW8ycmRhSFhmb2RJQXJ4MTZE?=
 =?utf-8?B?RlJjbHN5Mm5qR2NSYkU2cFRBUTBJOTE4ZW80N3NNTlgzcU83aU1zV3o0aU1D?=
 =?utf-8?B?QVBQTzhYcVhkM2RTT0UxTEY3QnlZYVVwdnBFbkhhTjJkUlJYcTF2Y1owWG9G?=
 =?utf-8?B?VnhPNGpmRVBaa3Bac1d6a1pjUFJjNUxuVUhjaG91ckJncm5VOXFqUEYwektS?=
 =?utf-8?B?Mm1RU3RyZWgvNS90SEFqOU9qS2tTK2p6dWZiMGgrem1Vajd6cEVib3c1bldC?=
 =?utf-8?B?U3A2YSt3TmpRUSs4d0RwVVYrTHFyVG5lNmZkTVJLWFpKdWQxd2Y3Tk51Ni9a?=
 =?utf-8?B?YkZ2azZhS0pIL2lJNVF6Y2ZKRHhJWW91WVpUbkp4dTlHeWpjWjh4ckxNNVVk?=
 =?utf-8?B?Rk5OYWduUzQxcXhSMXp3R3hSUGc5L1F3SHpKbHhEd3ZvNkYxR3RkQmlaVjVS?=
 =?utf-8?B?dmpranRJTjMzVzRIMWFLUWJ1UGVyL254SExURndKT2dnYmdSbFZjYVk3eXhv?=
 =?utf-8?B?Rm9pTnBPaytZWkFia1hWYTVpZ3c5c2NOa3RMWmNCc0pjb0tXdStIRUdiYVRr?=
 =?utf-8?B?bStQRHpHYTVzaFBqdTBldURCNmdkUmZpR1pDbjhQU1l2TVlqMnR3TlY1UnJR?=
 =?utf-8?B?QlR4S1l2VXBDcGlrd2xYWjQydStWRkdtN2N0K2hQOTFsMEZKMFl6UXVoQzdC?=
 =?utf-8?B?QU9qRlpaSVBkbnJYY1lody8wTEk3QkNJWklOZThsSWJ1YlYxVklHUkMxS3V6?=
 =?utf-8?B?bVY1SGxWdzZLV0plR1dLTmRXUU5xaTFpcTBsYWhVVXNSNE9XRmNSV0lxdlFj?=
 =?utf-8?B?SUlNMXQ0UE5kNEIxK2NRczg5ZWoxSXNlemcwUklkM2trSy90TkIveG8vbktx?=
 =?utf-8?B?Q2p6eW9VRlMrUWZXQ2VDNXVQUjhjaHBPNU0vd1dtbVJTRlc5MGk3a2xNTm5F?=
 =?utf-8?B?OGdJV01PaTVRSStmWUNJSE50R1E4NGpHaTNFUnppbzBiY2FoRnRzcnQ0RmxT?=
 =?utf-8?B?cThkbjQyMzQ1KzBZazBMUGtxajE4WjZibkhkNDJLL1NOWE4yT3BNcmZMMmpv?=
 =?utf-8?B?S2I2Y3d6NWl5b21IeS80cGRkVEZEMFh3dnZZS3F2SEpDb3FETms0QWZrYUJN?=
 =?utf-8?B?YUZ6Zmw0NStCaVV2MWFWZ29sTnVsSkdqMnJFOHZsdWdpZ1BwRUFZaW5PNzkw?=
 =?utf-8?B?ejlWbHVjOEtLaFQ4ZUZrekliUFBJV2NjckVNd1ZrZGw1ZitRdUkzdWMya1Q3?=
 =?utf-8?B?RkFBUnk0STdqcjlZakNaKzUyaGpZcHpkakRUTklpbGE5NXp5Q3p1MkpkaURW?=
 =?utf-8?B?Z3QvWWNJbU9UQ0tRRVBPV2Q3K2VBWWFTN1liZU9kNFZ5T1Zqa1pjZVdOTG9I?=
 =?utf-8?B?N1NFUEtSbUhwcjZPMURVYUZNTTBZd1NaRmtDZWNNR1dsYjlJRlNPRDMzQmdu?=
 =?utf-8?B?d3lTWXVjV1VWTzhDTVZJby9xYWpWc3ZTa04xUG5zS1dLTk1wUDRySzZncjRL?=
 =?utf-8?B?SzZzejhVdTRpb1pseFlCa0xxQ3B0aEJBdDFodUVhV0dEUklrVG9OczZHY3VN?=
 =?utf-8?B?V1N1dzVDRVZFUWpzWU5hd3VyNkFsTjVmZXdLSmVUeWRVWE1WSTNwY2Ivd21X?=
 =?utf-8?B?cGNQc01qL0FBaU1TZ3VueUI4ODV2VlhkdjNxKzN5N0V5SFNrS1hPNlBJbjQ0?=
 =?utf-8?B?UWJVL0pydDhOeXJ0RWZVNDMxRFJURWxSRGRWdkFnM3RZQ3NBa2pOTlpkUDlC?=
 =?utf-8?B?bHdZTFF1N3RaQmdSdVVvaGk5M0ludEZtSzBYc0xIM0hMVXZ2a3lLQnNEd244?=
 =?utf-8?B?ME9tbEg2V25CUHBkWUhETlhFZWpsSnpIa25hVjErYUE2VW5iZkRsSU5aUnZo?=
 =?utf-8?B?bDdpN3pRb1Z0MDNmejRBS2R3akluSFUrS0d3R205b0JKT0V0VnJ4YzdEd0Nj?=
 =?utf-8?B?ZVBtM21DTGxlQVZXZ0FMcWJodndTK1ExT2pFZVFLcEN0K0hjSXBtcEVMOWty?=
 =?utf-8?B?a1p0by95ZWEvL2ViRWtHUXNqTjNDTXNpcUozSldweWMzQXF1QzNpMnRFZGQ1?=
 =?utf-8?B?aE1LZVZkMWJZWVo5ZFc3bjduVkFOYTBhUmZxOE4xVldwbDc3SDFuVHRCSmVM?=
 =?utf-8?B?cW5yUlpycGxSUWVjQVFoVkNiekZRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ySV2SD1UHVIwQd9IgclgU4YOdEwnYRQ1rFxYAhzPlpou50D3iMYPnk+2Zl5BZB2jz+5KR9CRK3kPsYSRYNSXaEg/Z5llQu2xX60eAUWHVB8EzMjg51koB4Zn7YeDK/VBBQh1GX3sbadUwaJYRNsWBvnbLwssgg67yDnA15FhLEtkbjY6BwaYftje6ssMmaAYdu7r9rw1sg+3LMJKEd5Vo0pE0cab6uuCiYSrYZCrdVOzGJE4NjsIt78F+fVSkBEWgqbRqskOZjO+DjvOMuBqiPDWbRavRVOeLMe3wn3ipU7W9hzhws4o0Lm1iBHi6d4gIXvhjTwQgKg1N8l7ajwoFX4c/unKI4lgjS/OcFE4FZPq8OOHbiFwsbPiViTeXf30q3bn/iDZslF2RGSGWhtD862G8d4ESGgCINP/LEwmxwlIOAtQeSEYg/1SGoTU8Yap
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:11:18.1322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9fa684-f94a-4df5-d126-08de628ed7ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6117
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[yidong.zhang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:sonal.santan@amd.com,m:lizhi.hou@amd.com,m:Karthik.DMG@amd.com,m:nishads@amd.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[yidong.zhang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2FBA9D066F
X-Rspamd-Action: no action

Hi Mario,

On 1/26/26 11:30, Mario Limonciello wrote:
> 
> 
> On 1/26/2026 1:27 PM, David Zhang wrote:
>> This patch introduces a new PCI driver for AMD Versal-based accelerator
>> cards.
>>
>> The driver provides basic module and PCI device initialization, based on
>> BAR resources used to establish a hardware queue-based ring buffer 
>> between
>> the PCIe host and the Versal Management Runtime (VMR) service running on
>> the embedded SoC. This interface enables firmware management and board
>> health monitoring.
>>
>> Key features:
>>     - PCI probe and BAR resource initialization.
>>     - Integration with configfs for firmware management
>>     - Compatibility check using firmware-reported UUIDs
>>
>> The base firmware image is expected under /lib/firmware/xilinx/<fw_name>
>> and can be programmed to the device through the configfs interface.
>> Firmware transfer is handled via a remote queue service (added in a later
>> patch).
>>
>> Co-developed-by: DMG Karthik <Karthik.DMG@amd.com>
>> Signed-off-by: DMG Karthik <Karthik.DMG@amd.com>
>> Co-developed-by: Nishad Saraf <nishads@amd.com>
>> Signed-off-by: Nishad Saraf <nishads@amd.com>
>> Signed-off-by: David Zhang <yidong.zhang@amd.com>
>> ---
>>   MAINTAINERS                              |   5 +
>>   drivers/accel/Kconfig                    |   1 +
>>   drivers/accel/Makefile                   |   3 +-
>>   drivers/accel/amd_vpci/Kconfig           |  15 ++
>>   drivers/accel/amd_vpci/Makefile          |   6 +
>>   drivers/accel/amd_vpci/versal-pci-main.c | 280 +++++++++++++++++++++++
>>   drivers/accel/amd_vpci/versal-pci.h      |  62 +++++
>>   7 files changed, 371 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/accel/amd_vpci/Kconfig
>>   create mode 100644 drivers/accel/amd_vpci/Makefile
>>   create mode 100644 drivers/accel/amd_vpci/versal-pci-main.c
>>   create mode 100644 drivers/accel/amd_vpci/versal-pci.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6863d5fa07a1..8fb7276eb7c1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1271,6 +1271,11 @@ F:    drivers/spi/spi-amd-pci.c
>>   F:    drivers/spi/spi-amd.c
>>   F:    drivers/spi/spi-amd.h
>> +AMD VERSAL PCI DRIVER
>> +M:    Yidong Zhang <yidong.zhang@amd.com>
>> +S:    Supported
>> +F:    drivers/accel/amd_vpci/
>> +
>>   AMD XDNA DRIVER
>>   M:    Min Ma <mamin506@gmail.com>
>>   M:    Lizhi Hou <lizhi.hou@amd.com>
>> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
>> index bdf48ccafcf2..f80998fdb3fc 100644
>> --- a/drivers/accel/Kconfig
>> +++ b/drivers/accel/Kconfig
>> @@ -25,6 +25,7 @@ menuconfig DRM_ACCEL
>>         and debugfs).
>>   source "drivers/accel/amdxdna/Kconfig"
>> +source "drivers/accel/amd_vpci/Kconfig"
>>   source "drivers/accel/ethosu/Kconfig"
>>   source "drivers/accel/habanalabs/Kconfig"
>>   source "drivers/accel/ivpu/Kconfig"
>> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
>> index 1d3a7251b950..be62e08bbef1 100644
>> --- a/drivers/accel/Makefile
>> +++ b/drivers/accel/Makefile
>> @@ -1,8 +1,9 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   obj-$(CONFIG_DRM_ACCEL_AMDXDNA)        += amdxdna/
>> +obj-$(CONFIG_DRM_ACCEL_AMD_VPCI)    += amd_vpci/
>>   obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)    += ethosu/
>>   obj-$(CONFIG_DRM_ACCEL_HABANALABS)    += habanalabs/
>>   obj-$(CONFIG_DRM_ACCEL_IVPU)        += ivpu/
>>   obj-$(CONFIG_DRM_ACCEL_QAIC)        += qaic/
>> -obj-$(CONFIG_DRM_ACCEL_ROCKET)        += rocket/
>> \ No newline at end of file
>> +obj-$(CONFIG_DRM_ACCEL_ROCKET)        += rocket/
>> diff --git a/drivers/accel/amd_vpci/Kconfig 
>> b/drivers/accel/amd_vpci/Kconfig
>> new file mode 100644
>> index 000000000000..dcf83bf3d8e6
>> --- /dev/null
>> +++ b/drivers/accel/amd_vpci/Kconfig
>> @@ -0,0 +1,15 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config DRM_ACCEL_AMD_VPCI
>> +    tristate "AMD Versal PCIe Management Driver"
>> +    depends on DRM_ACCEL
>> +    depends on PCI && HAS_IOMEM
>> +    select FW_LOADER
>> +    select CONFIGFS_FS
>> +    default m
>> +    help
>> +      AMD Versal PCIe Management Driver provides management services,
>> +      including download firmware, program bitstream, and communicate 
>> with
>> +      the User function.
>> +
>> +      If "M" is selected, the driver module will be versal-pci
>> diff --git a/drivers/accel/amd_vpci/Makefile 
>> b/drivers/accel/amd_vpci/Makefile
>> new file mode 100644
>> index 000000000000..03849875ad0b
>> --- /dev/null
>> +++ b/drivers/accel/amd_vpci/Makefile
>> @@ -0,0 +1,6 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +
>> +obj-$(CONFIG_DRM_ACCEL_AMD_VPCI) := versal-pci.o
>> +
>> +versal-pci-y := \
>> +    versal-pci-main.o
>> diff --git a/drivers/accel/amd_vpci/versal-pci-main.c 
>> b/drivers/accel/amd_vpci/versal-pci-main.c
>> new file mode 100644
>> index 000000000000..36f88d5aee95
>> --- /dev/null
>> +++ b/drivers/accel/amd_vpci/versal-pci-main.c
>> @@ -0,0 +1,280 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Driver for Versal PCIe device
>> + *
>> + * Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/pci.h>
>> +
>> +#include "versal-pci.h"
>> +
>> +#define DRV_NAME            "amd-versal-pci"
>> +
>> +#define PCI_DEVICE_ID_V70PQ2        0x50B0
>> +#define PCI_DEVICE_ID_RAVE        0x5700
>> +#define VERSAL_XCLBIN_MAGIC_ID        "xclbin2"
>> +
>> +static inline u32 versal_pci_devid(struct versal_pci_device *vdev)
>> +{
>> +    return ((pci_domain_nr(vdev->pdev->bus) << 16) |
>> +        PCI_DEVID(vdev->pdev->bus->number, vdev->pdev->devfn));
>> +}
>> +
>> +static int versal_pci_load_shell(struct versal_pci_device *vdev, char 
>> *fw_name)
>> +{
>> +    const struct firmware *fw;
>> +    struct axlf *xsabin;
>> +    int ret;
>> +
>> +    strim(fw_name);
>> +
>> +    ret = request_firmware(&fw, fw_name, &vdev->pdev->dev);
>> +    if (ret) {
>> +        vdev_warn(vdev, "request xsabin fw %s failed %d", fw_name, ret);
>> +        return ret;
>> +    }
>> +
>> +    xsabin = (struct axlf *)fw->data;
>> +    if (memcmp(xsabin->magic, VERSAL_XCLBIN_MAGIC_ID, 
>> strlen(VERSAL_XCLBIN_MAGIC_ID))) {
>> +        vdev_err(vdev, "Invalid device firmware");
>> +        ret = -EINVAL;
>> +        goto release_firmware;
>> +    }
>> +
>> +    if (!fw->size ||
>> +        fw->size != xsabin->header.length ||
>> +        fw->size < sizeof(*xsabin) ||
>> +        fw->size > SZ_1G) {
>> +        vdev_err(vdev, "Invalid device firmware size %zu", fw->size);
>> +        ret = -EINVAL;
>> +        goto release_firmware;
>> +    }
>> +
>> +    if (!uuid_equal(&vdev->intf_uuid, &xsabin->header.rom_uuid)) {
>> +        vdev_err(vdev, "base shell doesn't match uuid %pUb", 
>> &xsabin->header.rom_uuid);
>> +        ret = -EINVAL;
>> +        goto release_firmware;
>> +    }
>> +
>> +    /* TODO upload fw to card */
>> +    if (ret) {
>> +        vdev_err(vdev, "failed to load xsabin %s : %d", fw_name, ret);
>> +        goto release_firmware;
>> +    }
>> +
>> +    vdev_info(vdev, "Downloaded xsabin %pUb of size %lld Bytes",
>> +          &xsabin->header.uuid, xsabin->header.length);
>> +
>> +release_firmware:
>> +    release_firmware(fw);
>> +
>> +    return ret;
>> +}
>> +
>> +static inline struct versal_pci_device *item_to_vdev(struct 
>> config_item *item)
>> +{
>> +    return container_of(to_configfs_subsystem(to_config_group(item)),
>> +                struct versal_pci_device, cfs_subsys);
>> +}
>> +
>> +static ssize_t versal_pci_cfs_config_store(struct config_item *item,
>> +                       const char *page, size_t count)
>> +{
>> +    struct versal_pci_device *vdev = item_to_vdev(item);
>> +    u32 config;
>> +    int ret;
>> +
>> +    ret = kstrtou32(page, 0, &config);
>> +    if (ret)
>> +        return -EINVAL;
>> +
>> +    if (config)
>> +        ret = versal_pci_load_shell(vdev, vdev->fw.name);
>> +
>> +    if (ret)
>> +        return -EFAULT;
>> +
>> +    return count;
>> +}
>> +CONFIGFS_ATTR_WO(versal_pci_cfs_, config);
>> +
>> +static ssize_t versal_pci_cfs_image_show(struct config_item *item, 
>> char *page)
>> +{
>> +    struct versal_pci_device *vdev = item_to_vdev(item);
>> +
>> +    vdev_info(vdev, "fw name: %s", vdev->fw.name);
>> +
>> +    return 0;
>> +}
>> +
>> +static ssize_t versal_pci_cfs_image_store(struct config_item *item,
>> +                      const char *page, size_t count)
>> +{
>> +    struct versal_pci_device *vdev = item_to_vdev(item);
>> +
>> +    count = snprintf(vdev->fw.name, sizeof(vdev->fw.name), "%s", page);
>> +
>> +    vdev_info(vdev, "fw name: %s", vdev->fw.name);
>> +    return count;
>> +}
>> +CONFIGFS_ATTR(versal_pci_cfs_, image);
>> +
>> +static struct configfs_attribute *versal_pci_cfs_attrs[] = {
>> +    &versal_pci_cfs_attr_config,
>> +    &versal_pci_cfs_attr_image,
>> +    NULL,
>> +};
>> +
>> +static const struct config_item_type versal_pci_cfs_table = {
>> +    .ct_owner = THIS_MODULE,
>> +    .ct_attrs = versal_pci_cfs_attrs,
>> +};
>> +
>> +static int versal_pci_cfs_init(struct versal_pci_device *vdev)
>> +{
>> +    struct configfs_subsystem *subsys = &vdev->cfs_subsys;
>> +
>> +    snprintf(subsys->su_group.cg_item.ci_namebuf,
>> +         sizeof(subsys->su_group.cg_item.ci_namebuf),
>> +         "%s%x", DRV_NAME, versal_pci_devid(vdev));
>> +
>> +    subsys->su_group.cg_item.ci_type = &versal_pci_cfs_table;
>> +
>> +    config_group_init(&subsys->su_group);
>> +    return configfs_register_subsystem(subsys);
>> +}
>> +
>> +static void versal_pci_fw_fini(struct versal_pci_device *vdev)
>> +{
>> +    uuid_copy(&vdev->intf_uuid, &uuid_null);
>> +}
>> +
>> +static void versal_pci_cfs_fini(struct configfs_subsystem *subsys)
>> +{
>> +    configfs_unregister_subsystem(subsys);
>> +}
>> +
>> +static void versal_pci_device_teardown(struct versal_pci_device *vdev)
>> +{
>> +    versal_pci_cfs_fini(&vdev->cfs_subsys);
>> +    versal_pci_fw_fini(vdev);
>> +}
>> +
>> +static int versal_pci_uuid_parse(struct versal_pci_device *vdev, 
>> uuid_t *uuid)
>> +{
>> +    char str[UUID_STRING_LEN];
>> +    u8 i, j;
>> +    int len = strlen(vdev->fw_id);
>> +
>> +    /* parse uuid into a valid uuid string format */
>> +    for (i = 0, j = 0; i < len && i < sizeof(str); i++) {
>> +        str[j++] = vdev->fw_id[i];
>> +        if (j == 8 || j == 13 || j == 18 || j == 23)
>> +            str[j++] = '-';
>> +    }
>> +
>> +    if (uuid_parse(str, uuid)) {
>> +        vdev_warn(vdev, "Invalid fw_id format");
>> +        return -EINVAL;
>> +    }
>> +
>> +    vdev_info(vdev, "Interface uuid %pU", uuid);
> 
> Is the UUID from the ROM not considered sensitive?  The system UUID is.
> 
> ❮ cat /sys/class/dmi/id/product_uuid
> cat: /sys/class/dmi/id/product_uuid: Permission denied
> 
> Besides this comment some errors are showing it too AFAICT.

Thanks for catching this out. I will remove all UUID messages from the 
debug message.

Thanks,
David

> 
>> +    return 0;
>> +}
>> +
>> +static int versal_pci_fw_init(struct versal_pci_device *vdev)
>> +{
>> +    int ret;
>> +
>> +    /* TODO request compatible fw_id from card */
>> +
>> +    ret = versal_pci_uuid_parse(vdev, &vdev->intf_uuid);
>> +
>> +    return ret;
>> +}
>> +
>> +static int versal_pci_device_setup(struct versal_pci_device *vdev)
>> +{
>> +    int ret;
>> +
>> +    ret = versal_pci_fw_init(vdev);
>> +    if (ret) {
>> +        vdev_err(vdev, "Failed to init fw, err %d", ret);
>> +        goto comm_chan_fini;
>> +    }
>> +
>> +    ret = versal_pci_cfs_init(vdev);
>> +    if (ret) {
>> +        vdev_err(vdev, "Failed to init configfs subsys, err %d", ret);
>> +        goto comm_chan_fini;
>> +    }
>> +
>> +    return 0;
>> +
>> +comm_chan_fini:
>> +    versal_pci_fw_fini(vdev);
>> +
>> +    return ret;
>> +}
>> +
>> +static void versal_pci_remove(struct pci_dev *pdev)
>> +{
>> +    struct versal_pci_device *vdev = pci_get_drvdata(pdev);
>> +
>> +    versal_pci_device_teardown(vdev);
>> +}
>> +
>> +static int versal_pci_probe(struct pci_dev *pdev, const struct 
>> pci_device_id *pdev_id)
>> +{
>> +    struct versal_pci_device *vdev;
>> +    int ret;
>> +
>> +    vdev = devm_kzalloc(&pdev->dev, sizeof(*vdev), GFP_KERNEL);
>> +    if (!vdev)
>> +        return -ENOMEM;
>> +
>> +    pci_set_drvdata(pdev, vdev);
>> +    vdev->pdev = pdev;
>> +
>> +    ret = pcim_enable_device(pdev);
>> +    if (ret) {
>> +        vdev_err(vdev, "Failed to enable device %d", ret);
>> +        return ret;
>> +    }
>> +
>> +    vdev->io_regs = pcim_iomap_region(vdev->pdev, MGMT_BAR, DRV_NAME);
>> +    if (IS_ERR(vdev->io_regs)) {
>> +        vdev_err(vdev, "Failed to map RM shared memory BAR%d", 
>> MGMT_BAR);
>> +        return PTR_ERR(vdev->io_regs);
>> +    }
>> +
>> +    ret = versal_pci_device_setup(vdev);
>> +    if (ret) {
>> +        vdev_err(vdev, "Failed to setup Versal device %d", ret);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct pci_device_id versal_pci_ids[] = {
>> +    { PCI_DEVICE(PCI_VENDOR_ID_XILINX, PCI_DEVICE_ID_V70PQ2), },
>> +    { PCI_DEVICE(PCI_VENDOR_ID_XILINX, PCI_DEVICE_ID_RAVE), },
>> +    { 0 }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(pci, versal_pci_ids);
>> +
>> +static struct pci_driver versal_pci_driver = {
>> +    .name = DRV_NAME,
>> +    .id_table = versal_pci_ids,
>> +    .probe = versal_pci_probe,
>> +    .remove = versal_pci_remove,
>> +};
>> +
>> +module_pci_driver(versal_pci_driver);
>> +
>> +MODULE_DESCRIPTION("AMD Versal PCIe Management Driver");
>> +MODULE_AUTHOR("XRT Team <runtimeca39d@amd.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/accel/amd_vpci/versal-pci.h 
>> b/drivers/accel/amd_vpci/versal-pci.h
>> new file mode 100644
>> index 000000000000..890da1d6bcc9
>> --- /dev/null
>> +++ b/drivers/accel/amd_vpci/versal-pci.h
>> @@ -0,0 +1,62 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Driver for Versal PCIe device
>> + *
>> + * Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __VERSAL_PCI_H
>> +#define __VERSAL_PCI_H
>> +
>> +#include <linux/configfs.h>
>> +#include <linux/firmware.h>
>> +
>> +#define MGMT_BAR        0
>> +
>> +#define vdev_info(vdev, fmt, args...)                    \
>> +    dev_info(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
>> +
>> +#define vdev_warn(vdev, fmt, args...)                    \
>> +    dev_warn(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
>> +
>> +#define vdev_err(vdev, fmt, args...)                    \
>> +    dev_err(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
>> +
>> +#define vdev_dbg(vdev, fmt, args...)                    \
>> +    dev_dbg(&(vdev)->pdev->dev, fmt, ##args)
>> +
>> +struct versal_pci_device;
>> +
>> +struct axlf_header {
>> +    __u64                length;
>> +    __u8                reserved1[24];
>> +    uuid_t                rom_uuid;
>> +    __u8                reserved2[64];
>> +    uuid_t                uuid;
>> +    __u8                reserved3[24];
>> +} __packed;
>> +
>> +struct axlf {
>> +    __u8                magic[8];
>> +    __u8                reserved[296];
>> +    struct axlf_header        header;
>> +} __packed;
>> +
>> +struct fw_info {
>> +    __u32                opcode;
>> +    char                name[128];
>> +};
>> +
>> +struct versal_pci_device {
>> +    struct pci_dev            *pdev;
>> +
>> +    struct fw_info            fw;
>> +
>> +    void __iomem            *io_regs;
>> +    uuid_t                intf_uuid;
>> +    __u8                fw_id[UUID_STRING_LEN + 1];
>> +
>> +    struct configfs_subsystem    cfs_subsys;
>> +};
>> +
>> +#endif    /* __VERSAL_PCI_H */
> 
