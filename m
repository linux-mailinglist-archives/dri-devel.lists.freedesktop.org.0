Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIVaGpkdgWm0EAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 22:56:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A854D1E2F
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 22:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6399810E3B5;
	Mon,  2 Feb 2026 21:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K73XBa0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011057.outbound.protection.outlook.com [52.101.62.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4F510E3B5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 21:56:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLZnh59uiwW3hcQcIc8e1V52dg/2mFXcsFk2aB2WmjTcN5vA3DxvD8zbOvpPGIsgJT73SuMUTFwYEkaW7KByzKw45lR/QjaW2WKQm67lRWO13zIPDewiQvQ9YMmiheHpCf+lx0usf7WcwQndic4HilBtIKjfxASs/brEvsFfutqAyHY/KkjirfBOIoMh8WBRjA8rTP234z94/aPrGQuRAJSvb25AQxOVSCGhtTMxZcyNnfGQBXjdynGtKJGRJGIPjPEdVEqC2BUDMIj1dnhmz2VeTq+Y7+f8PuHmfxBG+rOWLmiJXwKNIGsUDy0iCiUvKYLIdhQaEo7hUB1fEjviqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZiYn5+ESw6tMEcSfTBKvxf8uP0orIjGBdpAiol0Fs4=;
 b=WXmhaGpE0cPj/H9nXk7wpl0qk7EzM3i8W03ELPohVnnIwFEaHJe6KFjQefmsKlpBM7eGSho43t7VQNcMi+/dYCuVfWQ9VXVWaAVRwLWNqW2Q2hipBV0I2if4JrEX9Bi7r5kPLePmq49mzfPCOmK2BGqi3UBTqM/gtFw3jIowUf6ctw9cTbxCxUwaBRs8VDEU1yWSlQCcY/J4QYpb/CaEJcT1utcbB8UEIflm1O3jXlbjadI9v1ZcE6NEf7pj8202xlToDrfV7PyR0pp1C9ZP+9pIvftLNRcJecsLdkK+f+L0ByX70teBuHjjpUAkp+uAd/usGDgyIFvcGSw3TCNNAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZiYn5+ESw6tMEcSfTBKvxf8uP0orIjGBdpAiol0Fs4=;
 b=K73XBa0XNyYC0an/T2AHYnmJwAAL23ooApArbdR9UOQ2+aQKSG1cc3eQ4PCsmCw31i1/9x8eSMu++JGlLEXSEVpk0BDaDyvYLv0a4RX7J/P5lzzMbb0FGi5FgwRQFnsdSHH+L/cELPpXaBrb8z6BFjVBuSWPqiiTWdrLwi3b+Oo=
Received: from BL1PR13CA0180.namprd13.prod.outlook.com (2603:10b6:208:2bd::35)
 by DS2PR12MB9687.namprd12.prod.outlook.com (2603:10b6:8:27b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 21:56:31 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::4a) by BL1PR13CA0180.outlook.office365.com
 (2603:10b6:208:2bd::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Mon,
 2 Feb 2026 21:56:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 21:56:29 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Feb
 2026 15:56:29 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Feb
 2026 13:56:28 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 2 Feb 2026 15:56:28 -0600
Message-ID: <17479832-523a-54ab-a6d7-da3f0a28f71a@amd.com>
Date: Mon, 2 Feb 2026 13:56:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Replace platform name strings
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260202212529.2681307-1-lizhi.hou@amd.com>
 <fc6e4b08-27c7-42f4-bb3d-731aad19987f@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <fc6e4b08-27c7-42f4-bb3d-731aad19987f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|DS2PR12MB9687:EE_
X-MS-Office365-Filtering-Correlation-Id: 8910efd5-394d-469b-b76d-08de62a5ebd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFRmL1kxS2hkSHRuN2dneHVXOGdERThscHdVYjVrWVZ0SHBMQnpPY29wOEh6?=
 =?utf-8?B?cnQ2eFVhZEowbUVuWHpURTFnejRLQng1ZTdWeFlyOTliWlVWMmVpU0wxd3FK?=
 =?utf-8?B?RUhFa3R0Ny9sVXhreXNEQzlnSDZnNGptQnJwSGxsRE4vT3owSWxlQUl1b0xW?=
 =?utf-8?B?MTdEeEV1RFlqTHdYWlF6NS8vWGEzMnpBNkV6MlFWZmtQc00zUmVJY0FndkNw?=
 =?utf-8?B?cDhtVlBOSnlMN2ZrNjFhZjVLczhHdWxyVHhoU0lQTkQrc01GZk0ybUpXeGFo?=
 =?utf-8?B?Y204MmJFYXJ4a014d0lrUmN6dEpmRXlObGNUL2FXdFppNEFKZzRkZnhhN1M2?=
 =?utf-8?B?WTBRT3J5NngwNWx2SlE0SUt2S1Fjd2lxWXFaSmNWM0JyZnRyQXZGb2JwUDFl?=
 =?utf-8?B?V2t5eVQ3TkFwRTZVL2JvMlNpNVdkdXVxdGhBNVpTWWVEVkFHZHNTSnZ2OHdE?=
 =?utf-8?B?c29XYmtsZml5RXpQeDhXbEl0YkJQV3RjN0hVSnRsZUpKbkZrSUExd2dJTDF4?=
 =?utf-8?B?Syt1RXYrNWcvMlg1N2ZON2ZjVW53WUx0ZUNQdEJDNWdKalRTbjdpbVRvdEF2?=
 =?utf-8?B?bzVxbHdWK1cvanVjNGIya0hvenhwSWVJM1JlYW96UFNKcjViVXFVR2s3WVlK?=
 =?utf-8?B?VXF0MlZNMXA3SDFITmZEendoelhNQVkydHQ2bUl3WkZzc25xQnQrQ0Fyc1F2?=
 =?utf-8?B?cklDSWFaMVZSdG8xd2RMTnVFK0RDRWxsdXV0RUdzZjZJWU1TM3RaZWV3ODZm?=
 =?utf-8?B?SkxSUU9kQk9taEUrSG90RW9PNkk5V1hob2J6R0JsT2FmV2FWdHduZTlGeGp4?=
 =?utf-8?B?SEhPb0F6ZDUrQ2x2RWViVDhRUjdOaTJ3L3h4YzdMdXZKOTlaalZHRExkTEI3?=
 =?utf-8?B?cVB0aFZvTzcxd1UzZkZoUlJLakM5MzlqTEtXeTl0S2VXVDNrRjFpZGpnNUZR?=
 =?utf-8?B?MndMdkVMOU5mUWVtV1VvS05RdmpxSyswalhRcGhUZDFkVktlU0lNbzkwdEFy?=
 =?utf-8?B?Q0Vnem4xZWoxWFNEMFBGaGMxK3dxRHRvMm9LSUZvYnIrNGU1ZXdLV093UFRR?=
 =?utf-8?B?MTNidUx3dVdONE5KWGplcFJHaTQrb0NidWlnT0dPTDc4NDcvZloraU02bEpM?=
 =?utf-8?B?dEdINmpIc0g3RlRFN2JpREpZR1hoV1VHU051bmYxWjJpclIzQ3ZJL3A1NTAw?=
 =?utf-8?B?QUJOaE9xQ0cxRllRTkF4dWdUMHNVMWVtdk0yVkE3bWczY2NRMjhOS0o4VWJo?=
 =?utf-8?B?TkNYakFqSHZEdmw5SE0vVytuZDhjeGp6ZE0wY1FScjVuMnlid243UFVSYy9K?=
 =?utf-8?B?WHJvamRyNDlLSHRxZnBBcEJVK0tsUnhrVWdMclNHTDA4c1BUTjV5S3pqcW81?=
 =?utf-8?B?WkRYVyt6Uk51VUl2Qzl3TzU4L0U1V0t3RXdVeStRc25aY29RaXBCSUpvT3dM?=
 =?utf-8?B?bXNoa2NGTFRYY1BVRjVQSEcyMllFb2krQjRrYWpjcTEzQm5qcU9lM3cvRjBm?=
 =?utf-8?B?Uy94SlRlM3Vvblh1b1dyVGdsRktsdm84K2tEZytMbmxqSDBEVnJGK1NXdnpi?=
 =?utf-8?B?Y3BqUWhCWHhNU0tEL3BUOVJLb3ArUktPdUNJanBabVc4Tk0zT25xQ2ZnR0xC?=
 =?utf-8?B?UlJ5bWs3bWRubkxhajVxTGkwTFhQWWlQdUVqL09NbWdwZ0FSdmMrV0p0dDdK?=
 =?utf-8?B?Y0ZzQ0IvZEZ0Q2E2QUkxN0xxcnVIUGpTZjdwVEpqSDZiTnRxcS9sRkpaNnA0?=
 =?utf-8?B?N1hPSDFLT3lrVWFtbDJYRUhUU3JLKzhTTWNJNVI5Y2RXam9jV0F5Q001Y21O?=
 =?utf-8?B?NWI5eXdPN0JBaFZsRm0rMmpNaE1pU1d2WUNXNVJiNDVlNlZ5VGNmM2pOVjRU?=
 =?utf-8?B?Z1lNenpFdkZXNUlqNVhQV3gxazNRdE1yRG1meDhvdm04U3JJRDZvYysrOVNX?=
 =?utf-8?B?RGYwZmhqSlJhL1hBN29hSDQ2ZnY0bGFOR0RWUkg1c2dsdW5RWDFpN2p6Y0to?=
 =?utf-8?B?V3doTlRBQjZFakxiNGg5VjZ0RW5YdXh4ZStUTTBrekN6bERCbllKYU1sdS9H?=
 =?utf-8?B?YjlMVkVhMk5pL2ViYmFndlNEUXZub0lwdzc3Nk0ySFlXbFFVOWtBNTVsMTJR?=
 =?utf-8?B?eEhoZnVwbGJCSUZseDJzSFl0aDdyd0tQZHFKdjNXODIvUTBoRUxFV1VPUVpy?=
 =?utf-8?B?V3ZpbU5QTWRhekxTdzNxOUlvZngvdTh2dm9Pb3E5MUMyZVA0bU1JM2o5OEdM?=
 =?utf-8?B?V0Z6eitacmRIT1NEQUNIeTJjaWx3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mut72r4mQDmRTvLQuwHwia+wSmr7gikLgDKtzwE/V1tQI2+01U3TbFeBL8+hngRD12me0IU7v4gkav8gLdI8jo+9OsgZKLCfsZew9jA52qqPq4ThdDmTjSd0MiNoxk3ki79rhokHtu5gbKYmcaJuKUy7vcz25s8xm/4KN8cr47nR7hUghzCwedeE7cq2rHlkdiKFyVcNfJK5MZZ0aIPxu5znjLkELlXhcRI+Vn9EYgs+4AUZOyIPENb0SFPFiTZa/KmFOYjcqS07GJ2jkzDzlhbWoU+sWiRsNJZbiqbUaVjq9DQjTQqD3I9zZdAxTtPcd9JdKxjBmMLTdkSlwFen8OKIr5cIox4osw/nz9nuiKbvX9GZitrMinfI5xjLIzvMsJ/0w7LcCWozlvmLzeiqzopgEPyibDxnavZp8BTiMJMewV3vWg9RnFoyhU/X7OA7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 21:56:29.8233 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8910efd5-394d-469b-b76d-08de62a5ebd1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9687
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
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9A854D1E2F
X-Rspamd-Action: no action


On 2/2/26 13:40, Mario Limonciello wrote:
> On 2/2/26 3:25 PM, Lizhi Hou wrote:
>> Update platform name strings to be more accurate and user-friendly.
>>
>> Fixes: 8c9ff1b181ba ("accel/amdxdna: Add a new driver for AMD AI 
>> Engine")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> The same NPU is used in multiple products though isn't it?  So 
> wouldn't this be confusing for example to show "Strix" NPU on a Gorgon 
> product?

You are correct. To figuring out specific name, driver need to send out 
a firmware command. It is a little beyond a bug fix and I plan to have 
those implemented later.


Thanks,

Lizhi

>
>> ---
>>   drivers/accel/amdxdna/npu1_regs.c | 2 +-
>>   drivers/accel/amdxdna/npu4_regs.c | 2 +-
>>   drivers/accel/amdxdna/npu5_regs.c | 2 +-
>>   drivers/accel/amdxdna/npu6_regs.c | 2 +-
>>   4 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/npu1_regs.c 
>> b/drivers/accel/amdxdna/npu1_regs.c
>> index 6f36a27b5a02..cee42c49cbb6 100644
>> --- a/drivers/accel/amdxdna/npu1_regs.c
>> +++ b/drivers/accel/amdxdna/npu1_regs.c
>> @@ -117,7 +117,7 @@ const struct amdxdna_dev_info dev_npu1_info = {
>>       .dev_mem_buf_shift = 15, /* 32 KiB aligned */
>>       .dev_mem_base      = AIE2_DEVM_BASE,
>>       .dev_mem_size      = AIE2_DEVM_SIZE,
>> -    .vbnv              = "RyzenAI-npu1",
>> +    .vbnv              = "NPU Phoenix",
>>       .device_type       = AMDXDNA_DEV_TYPE_KMQ,
>>       .dev_priv          = &npu1_dev_priv,
>>       .ops               = &aie2_ops,
>> diff --git a/drivers/accel/amdxdna/npu4_regs.c 
>> b/drivers/accel/amdxdna/npu4_regs.c
>> index 3fc0420e8e3e..ed0382925b59 100644
>> --- a/drivers/accel/amdxdna/npu4_regs.c
>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>> @@ -144,7 +144,7 @@ const struct amdxdna_dev_info dev_npu4_info = {
>>       .dev_mem_buf_shift = 15, /* 32 KiB aligned */
>>       .dev_mem_base      = AIE2_DEVM_BASE,
>>       .dev_mem_size      = AIE2_DEVM_SIZE,
>> -    .vbnv              = "RyzenAI-npu4",
>> +    .vbnv              = "NPU Strix",
>>       .device_type       = AMDXDNA_DEV_TYPE_KMQ,
>>       .dev_priv          = &npu4_dev_priv,
>>       .ops               = &aie2_ops, /* NPU4 can share NPU1's 
>> callback */
>> diff --git a/drivers/accel/amdxdna/npu5_regs.c 
>> b/drivers/accel/amdxdna/npu5_regs.c
>> index c0a35cfd886c..8427e9f2b4ec 100644
>> --- a/drivers/accel/amdxdna/npu5_regs.c
>> +++ b/drivers/accel/amdxdna/npu5_regs.c
>> @@ -108,7 +108,7 @@ const struct amdxdna_dev_info dev_npu5_info = {
>>       .dev_mem_buf_shift = 15, /* 32 KiB aligned */
>>       .dev_mem_base      = AIE2_DEVM_BASE,
>>       .dev_mem_size      = AIE2_DEVM_SIZE,
>> -    .vbnv              = "RyzenAI-npu5",
>> +    .vbnv              = "NPU Strix Halo",
>>       .device_type       = AMDXDNA_DEV_TYPE_KMQ,
>>       .dev_priv          = &npu5_dev_priv,
>>       .ops               = &aie2_ops,
>> diff --git a/drivers/accel/amdxdna/npu6_regs.c 
>> b/drivers/accel/amdxdna/npu6_regs.c
>> index 1fb07df99186..a960149b5408 100644
>> --- a/drivers/accel/amdxdna/npu6_regs.c
>> +++ b/drivers/accel/amdxdna/npu6_regs.c
>> @@ -109,7 +109,7 @@ const struct amdxdna_dev_info dev_npu6_info = {
>>       .dev_mem_buf_shift = 15, /* 32 KiB aligned */
>>       .dev_mem_base      = AIE2_DEVM_BASE,
>>       .dev_mem_size      = AIE2_DEVM_SIZE,
>> -    .vbnv              = "RyzenAI-npu6",
>> +    .vbnv              = "NPU Krackan",
>>       .device_type       = AMDXDNA_DEV_TYPE_KMQ,
>>       .dev_priv          = &npu6_dev_priv,
>>       .ops               = &aie2_ops,
>
