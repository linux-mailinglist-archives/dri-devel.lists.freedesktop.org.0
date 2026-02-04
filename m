Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENIWAty2g2kdtQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 22:15:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6FEECAE6
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 22:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9861610E779;
	Wed,  4 Feb 2026 21:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qU+zMina";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCC010E779
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 21:15:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ng6aRW9dwtZc7FVezkECorJnYACsNwhJGBD4Y6mL5wObmMx6JxQgiqjm2gAVNwTzS/gsiE0nmvjpdv4C8inrBjpSnAGLXcOwLO2JTBI1XspYsLv1+QB1RTnV2C7PAHmdxF0zm1zMh2t8/a9Q/QbhOD9u3s/MRInN1j3ebrTXt8sb1zVfvkKxQ/VM1vszSacKfkIvTEzoZTxhtWJ30Qy7lcN6jYugwp8flIg60kzYGWuywwqDxhTxj4+8ifPASqNY7BvDEQfyDMXrxVU7F5eTv2zKwV5k4XUMP1FpddfsNELVwi5dGjubpEbH516C2VVmweMolqUArtZaiIjutbnmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYTrbM3omIY9B10FSQ65d/a493SVkchvn5pVCLQibz0=;
 b=R7J8cR4V7XB6HniRLzpW0eX1h89tYxQT353uMiiz7cW7mCT7z0EGVr5FRh9xsn65Jy/G5vKShkc/rB9PUcFqRl2cDyPNHyDhOo7zQrm/guHiAZUoegPuzJrsYA0YCUiwwaJklZq1Qshp6RBI8H7XSF3WbPD1Wjs17rJS9RjtEytitUzQN+iEGS+Jvx6xBuQZrHl+KK253owbAL63Xuv+4Q7DhSl5I2y9b/Qm92y0ZA75pIYio5MfHxeJuewMRIIHkPsWxHJx4AlypEM1plx84CcqkiyOMhzCfyiJ0VyQmm5oSVUedzX2OEuH4gjbALBCC3QxGp2IGRaipiYZQ4Hvyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYTrbM3omIY9B10FSQ65d/a493SVkchvn5pVCLQibz0=;
 b=qU+zMinakDQgjIoFoBXtxF6l0DDoVIzyTmOkaFULwhOYDne+sHgXPmEL0SOcoVykY1mkUDbz/cLVDD/5uYlJzSjMZmIqux0ng2i+UwKZrEf9FfFSaMHOzkJ1iwqtVwWlmn4KygTVll9qpSh0DInlarLKHWkp+OiKyY4GEkOKJBk=
Received: from IA1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::9)
 by SA1PR12MB6894.namprd12.prod.outlook.com (2603:10b6:806:24d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 21:14:55 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:461:cafe::bc) by IA1P220CA0003.outlook.office365.com
 (2603:10b6:208:461::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Wed,
 4 Feb 2026 21:15:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 21:14:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Feb
 2026 15:14:53 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Feb 2026 15:14:52 -0600
Message-ID: <98cc450b-3f98-0bdb-e2a6-4325ee54a783@amd.com>
Date: Wed, 4 Feb 2026 13:14:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect DPM level after
 suspend/resume
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260204171048.3165580-1-lizhi.hou@amd.com>
 <ced38713-6bda-4fa5-b2d4-776e2d6bcd9d@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <ced38713-6bda-4fa5-b2d4-776e2d6bcd9d@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|SA1PR12MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: 989d612c-ead2-432d-ceb1-08de643270d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUF4cW9DWldGdFNEWE1QR1NDYzdsYVRoY1Y0akNJRU56aThYbTZpdEdMVlRs?=
 =?utf-8?B?NFppTFExNFByRzVrczFIb0xYV2pUVjhvYWRDUFV3ZWxjTEo4elFKMFlldG03?=
 =?utf-8?B?TjM4WTJiVG5MNnhEbEg2WDAyM2FDdGI5TDlZa1J5V2N3YnVnN1BxdG8rOE5U?=
 =?utf-8?B?SlNSWFoveTNWc2RtNk5LdjZTSlUrdjFIZms4K3Roc1EwQmJWc2dtaWpJSisz?=
 =?utf-8?B?WjVFY0hSMkEycktBbjFYc1dOcHpUZkpENWxIVVlERHJWOXFUVEkrSVJ3OTM0?=
 =?utf-8?B?cjM2MnBwb3ZjZkUydERGZy9JcmhIM3kxWXM3R3FvSmpvMDRFZDNNMFhSZTR3?=
 =?utf-8?B?R3pha3pjVjVoanRZb2RWN1AwOVhMM3RkUlhYQXFQNU9YcXdKTnZIbmVrTzNY?=
 =?utf-8?B?U1RBVHJoeW4vOCsxSUROTXlnbXRDQkRxYTFjV2QwZmwwTlNJYzNCa1UwOHBR?=
 =?utf-8?B?RXlFZjRzN2UyUk1GazJCaEYzN3c3cytCOGdyaXp2dlFQZ2x6TzhPekNhSzVw?=
 =?utf-8?B?bFcxdU5BWDlaR1lYSlJ1Y1dsbVBlaWZGdVcwS1JTQmRkWmwwT21kWnN3UGtN?=
 =?utf-8?B?bmVDWmY0emg5K0tteHo2cTU0bGpiMFdXSGFHL3ZsQjd4NE1DNlE4ck5ENmY1?=
 =?utf-8?B?clFpb1p3YlhGOFgxRnM5SDV5dXl5NjRnQkgvcWZZYWdTOWlSRXhWSWhCVVBl?=
 =?utf-8?B?VnRET2ZqUXB2L1NpSmxTQTMyT0E5cWYrNUp0SkI5em4wQVpOWUtyZzh5MG9F?=
 =?utf-8?B?VkUvMjQ2blZla3FLQTM4eDFMeSs5RStUbVFyc2hUL0pHeU1qa2Njd0wxZisw?=
 =?utf-8?B?M3ZxaElLbVY5Q2xoMUxHYThaOE5iWGhDczBUUVZIWE9wemZkR1A2N2ZXaVhv?=
 =?utf-8?B?aUppQXhtQkl1QU9SZ004Wm5YY09ZU0tmaHBHakRURE96YUlRNDMwcjl2cTBi?=
 =?utf-8?B?aVFVMmJqblJSTWk1eEN0RzQrUkZueVNiWlVWUFVsUFlmbnNkaWVVazFpT0w1?=
 =?utf-8?B?TWhaODQzQWxxdVFQZG0ya1BybHZmSk1rTGRwckFzd3hMdmtlS1EvVEhxVWUw?=
 =?utf-8?B?ZTN6cXg4aE1RZmo1SlJ5Vmo3VWV5SW5SYlRCdmpkeFRrTEYyT3JrM3NnMHNu?=
 =?utf-8?B?bWlDcjNuQTc1UUVwT3VSaWx2RjhIRmVqdis3VzF4OXJTS3FVcm1qVWJOc1RH?=
 =?utf-8?B?dXpoQ0hEb0JwZWxtNDU2RkE4TDNRYWlTNzJvbnpaVnh0eG5wajU4aXQ3ZkhF?=
 =?utf-8?B?WGRLUTNzNmdDYjQ2NDJoOWttKzNQSWcrUk51b3hUamJqN2N0NENRYzJ5Z2VV?=
 =?utf-8?B?c0N3SE5Mb25ZNzJ5eUhaREoyWWxwZjBLaURJWFdlRXUwSTNxdUlrMXBidEZv?=
 =?utf-8?B?dCs1WFpEdGwzZ3VwY1BrUmpRcWV1WFJDQjdtS0syaC9BeUljNmZncll5Lzgy?=
 =?utf-8?B?Y3d1c3N5d2xXL3ZkN1Y1d3BjVlNCR1MvWDRScnF1S3VLWkZDNlVxYlVicDRl?=
 =?utf-8?B?eEFyeVZzUjBWSTVWRkFTb3pRS3NqbkU4bHF5aVFpTENyN2V6enY1dGtRY0J0?=
 =?utf-8?B?U3N5UXF0L0xGRG9QWlc3d1Rzd3FnQmhjQXlIWDdPSHdKNEhmVjUzaklHa3dT?=
 =?utf-8?B?MHlwRENoUXp1K1lhNSt4R2RNN0ZRbWlCL0lGc2pMd3NMOEpBNGw1VnVsYjJ4?=
 =?utf-8?B?RmRGSG8yeUhTa1F0RXV0SzdvOVJmcWh4Sm5EaXVIRmhFNTZjZ1IzTjdHditU?=
 =?utf-8?B?dEpnSkFtd0JCbDlQT3ZXbzRTV3RxQUpMQkxzeTQwUkRNS3RRS1dnMVVmU0RF?=
 =?utf-8?B?L3FPNWpwUWpodmdtbGp2cEhYSmZCRzh6bjBUWjNEeWlqVm9EMTdMeVlqSzNK?=
 =?utf-8?B?Uy9GTkVlRkRUalFKWXpaMTJXdnJpZXRRNk9SbU0vYXdvT2Z2dS9Gd3g1c0JW?=
 =?utf-8?B?aEFnNzBEaUtESXdjaEtKeWhZa3A4dk01NXpSUklQN3BDY1QrallGU0xtM0Rs?=
 =?utf-8?B?T2NwY2l0ejgxR0ZXOXRNSEF4MERFUHRRd2h3SjFYVHVVN3F1Z0VQZStUeWFP?=
 =?utf-8?B?MzcxdHFPZExPQUhCb1Rzakc2UFZLcG1VVFdCNEtJcVVsOHlhc3Z2OUdZSHcz?=
 =?utf-8?B?aGJPNFp3bmZ3SDk2VUR6OFpwYTdYVmhOc29rUlM3VDdlaGFUQUczak5OV3A0?=
 =?utf-8?B?eG52YW1KY1RzYzBESmYzemkxZm4zSnJQQUk3TGVXc0Erc05icmxpamIrSTZ6?=
 =?utf-8?B?V1l0VFMxSkV2dDBybElIT2J1aU9RPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UhdKclCUL91GIrqT5BDgF99OzOE0eeLZyXD+2AacQdMVWWD4aaa6XAmKJdFDkhHMeujK4XT2wpV7QYn5mt9FTYHwo20lM+kYXIWx9d/mJ7G4HwBEVR61NolW0uBeQ9aUvkPni48L0xrw/F3yNOXkjgpEjgadfxDDcztOh0duVy8Gw5T0sovGRYpg0RkVI73VLl5Vrfc6HY8ged4J+jMS21HdVMkYWFSZZ4g8u6i4D2Ns8ijA7X+RPM50QcEVvHxEiNBZ+qKvfKF88+pojp1WXEClAAM4bbMwBgwALP8kK7U0E1h5AyyFbkRxzlVUhCfNlsMkCaEsm42LXaZbwfbHnDUvANaiWpta6JgBViLdO9QLw6KYRRQU1RI+N82uPec8VshMiGnCrlL4L49WrmU4qVzYl19jaP3oYcnIg9vpQSKK+Uy6vYVbhmICO2H10k4T
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 21:14:53.6815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 989d612c-ead2-432d-ceb1-08de643270d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6894
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A6FEECAE6
X-Rspamd-Action: no action

Applied to drm-misc-next-fixes

On 2/4/26 10:06, Mario Limonciello wrote:
> On 2/4/26 11:10 AM, Lizhi Hou wrote:
>> The suspend routine sets the DPM level to 0, which unintentionally
>> overwrites the previously saved DPM level. As a result, the device 
>> always
>> resumes with DPM level 0 instead of restoring the original value.
>>
>> Fix this by ensuring the suspend path does not overwrite the saved DPM
>> level, allowing the correct DPM level to be restored during resume.
>>
>> Fixes: f4d7b8a6bc8c ("accel/amdxdna: Enhance power management settings")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   drivers/accel/amdxdna/aie2_pm.c  | 3 +++
>>   drivers/accel/amdxdna/aie2_smu.c | 2 --
>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pm.c 
>> b/drivers/accel/amdxdna/aie2_pm.c
>> index afcd6d4683e5..579b8be13b18 100644
>> --- a/drivers/accel/amdxdna/aie2_pm.c
>> +++ b/drivers/accel/amdxdna/aie2_pm.c
>> @@ -36,6 +36,8 @@ int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, 
>> u32 dpm_level)
>>           return ret;
>>         ret = ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
>> +    if (!ret)
>> +        ndev->dpm_level = dpm_level;
>>       amdxdna_pm_suspend_put(ndev->xdna);
>>         return ret;
>> @@ -65,6 +67,7 @@ int aie2_pm_init(struct amdxdna_dev_hdl *ndev)
>>       ret = ndev->priv->hw_ops.set_dpm(ndev, ndev->max_dpm_level);
>>       if (ret)
>>           return ret;
>> +    ndev->dpm_level = ndev->max_dpm_level;
>>         ret = aie2_pm_set_clk_gating(ndev, AIE2_CLK_GATING_ENABLE);
>>       if (ret)
>> diff --git a/drivers/accel/amdxdna/aie2_smu.c 
>> b/drivers/accel/amdxdna/aie2_smu.c
>> index 2d195e41f83d..d8c31924e501 100644
>> --- a/drivers/accel/amdxdna/aie2_smu.c
>> +++ b/drivers/accel/amdxdna/aie2_smu.c
>> @@ -84,7 +84,6 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 
>> dpm_level)
>>       }
>>         ndev->hclk_freq = freq;
>> -    ndev->dpm_level = dpm_level;
>>       ndev->max_tops = 2 * ndev->total_col;
>>       ndev->curr_tops = ndev->max_tops * freq / 1028;
>>   @@ -114,7 +113,6 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, 
>> u32 dpm_level)
>>         ndev->npuclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].npuclk;
>>       ndev->hclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].hclk;
>> -    ndev->dpm_level = dpm_level;
>>       ndev->max_tops = NPU4_DPM_TOPS(ndev, ndev->max_dpm_level);
>>       ndev->curr_tops = NPU4_DPM_TOPS(ndev, dpm_level);
>
