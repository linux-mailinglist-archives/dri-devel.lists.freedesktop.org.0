Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONbiDsTYjGn8twAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 20:30:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D721272AB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 20:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D98510E640;
	Wed, 11 Feb 2026 19:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="svbchRTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010033.outbound.protection.outlook.com
 [52.101.193.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532F110E0DC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 19:30:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtoD678kifG9w/6SQAhEAWxiYnbH1L0w+Gy9eqhL8MxgJs+zEl8XnWwiFdCvp1ZMFyh176Rr/dc44PIQx1d7iIC6Ec4QlZK1p7JrYiAcLKr9n0PbOHc7pavg+nLJOBCtYOqk+lm01w3XTVePQTxuzj++HeMoj05hwBp1Z2yxAcneufKjVW3tm9gare5OrHXABkgZ2lTU5zazWO6BWOcJkDPU4swkr78NrdRFH98oFd0tjX1ckwULOBhoTVc6VE64IXW2uS+76DlzMIXSBXcQAgOiBeSD57NoQmICsaakEC7wCrR37rSGpdCfYx24/dv1+zNqPb5SqjcobOn/IJxCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ts0vmb5u+j0smPa2uSIBPgvlfhqzmedQqJPUaKotU4w=;
 b=j6DSMDdMYFyZTwWEWv3nXsCbb6kf/e5Ho0mVpEA4cd3XShP6SJ+gmJcDbmbaTdsodn7vFIGrwHKFbm2vNK85fpc5UIblXUZk5u0+YuU6BPLUtC3oEOL629NzckdU0RsnReZq8s20/vCL8V0ZkoVAprWEgTJJuyBASBoxedb/zx4WyNGQrjOmFdxLuUcpM1Cr5Ib7NJOfUjn7dyXp0rpZi/qoxRLa5Ds0uu9KA57YaokBur5vuFkreh7NqeI51b9anri3kJUkvwka5hDGerurkk/MOswxvAI+T53Bh+D/EPI9uThtUJmalIKJsWqe0uSbUouock26a3XR6DALsvBhrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts0vmb5u+j0smPa2uSIBPgvlfhqzmedQqJPUaKotU4w=;
 b=svbchRTeOHpVR39ZWjjfIMuHHJfBbR+kh1r2zK5Zos+pw8C6TyDMbGqyHAqcR9pXIBWORINSYkP+RjxFQAQafJpmzqDLCiqk8bfaTXoNJodOIyAmkAdsT6Hr1pJIe84hLNdXyI3OvarhmxWshhmCYYNgXJb/yu5PTuez6qejspM=
Received: from SJ0PR03CA0249.namprd03.prod.outlook.com (2603:10b6:a03:3a0::14)
 by MW6PR12MB9020.namprd12.prod.outlook.com (2603:10b6:303:240::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 19:29:56 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::33) by SJ0PR03CA0249.outlook.office365.com
 (2603:10b6:a03:3a0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 19:29:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 19:29:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 13:29:55 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 11:29:55 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 11 Feb 2026 13:29:54 -0600
Message-ID: <34ab9aee-30b4-d4b2-c23f-cd97da35f133@amd.com>
Date: Wed, 11 Feb 2026 11:29:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix dead lock for suspend and resume
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260210191626.311976-1-lizhi.hou@amd.com>
 <86576aff-a280-4529-9976-da87f5b67d4a@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <86576aff-a280-4529-9976-da87f5b67d4a@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|MW6PR12MB9020:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f823041-b3e8-4684-c4fb-08de69a3f00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFFZQitlcVB5b3VLQlp2RUx4VGl6NmN4aS9WRnR0Y0ZVb1UwMzNtWXRMcGl0?=
 =?utf-8?B?NVhTQ3lUUVkwTGN5NzIwUmpSQzZrbzF0K1lKTGhzR2duSmdaeUNVWnB4WHBk?=
 =?utf-8?B?L0JscjN2NlRqUytnUlVKOWxHL2Y4QXJmZnhxT2N5Y3BWU0pwM0IzcVpWdVB5?=
 =?utf-8?B?dUtwQTVWZ0FQbzRjM21Lc3FXRDBWN1dNaXB4T0UwT1BkN2RzeXRpZlZsYk5o?=
 =?utf-8?B?NFV5bG1LaW91Y1V5TGdacG1KY2ZNOG1NWWJiWk5Vak1tL20wR1JCV2NQc3d2?=
 =?utf-8?B?eUY4OTFvai9PYk1sbDRSNXFpMEpaU09VMStCdTZnUHJKNjRyMTVUSmluRHlz?=
 =?utf-8?B?LzN4RnFvbHc0dTNyS3FGZ25qYkQzT09UdzZZbDQ2cXB3UXdsTi9BK3QyeXJZ?=
 =?utf-8?B?NmFDVzZOdUdySTEyaWsrT1dVUnczeUZpWUtiQ2RUV3pjYXRxckNIYUFkMVRr?=
 =?utf-8?B?WktlZ3ZpQlViWUpqOENUOW9TSUFDcnhYaHlEMnJKTTN4OXc5RU9XOGx0VVVi?=
 =?utf-8?B?emVkUmYweERmSE12dGhnQjVrbFE0RkhYeWtsQklpTnVHdVNLZzQ0ald3R3dM?=
 =?utf-8?B?MXNZRFlPUzlWTmVjVGR1MWhZbVEvd0FiRkxZRTVaMmQ4Ni9rK0o2dEVRNUlE?=
 =?utf-8?B?T1NBb2E1RUxSbHlDSGpxSWFZQXRkNkxOdmNPcWxTbER6SHNyWWhESHdzTFVU?=
 =?utf-8?B?dzVscWRycVJyd1dDZDVKam52eCtnOTAvOXA5V0lXS0RUUWtRSXlsNmhvV3ZS?=
 =?utf-8?B?dEhXQzIweFdXUVd5eUNIR1o1WG51WndRSndJeWlkRStvbWpwb2ZxU2s5bXZz?=
 =?utf-8?B?TXRtbmZLeEVvZUdFZFJ4NHp6MThHcWpHTFk5TjNmRDZMNVg5YmhhOHhEcjA3?=
 =?utf-8?B?RFFEQmQ5OVNDTWE0V3hiRlJMZUtoVXIwZlRNZytnemZUOTlnVkcyNEpYRnBQ?=
 =?utf-8?B?dGNrYjlsYXJDcjJwLzYvMWxnMlQrNjFLY3B5Wm9oT2xObVZPTTFYZzhPQTM3?=
 =?utf-8?B?L0EwN09wTG5EV055SWNtdmVCZzMxdTU5eHMvSFNQUTFtUU4zSFcwZnFzak5C?=
 =?utf-8?B?OXMrejlacHJxVmNvS3hRenkzb0s3RFdoeVZlRUVIcDgzR1NCd3V4SUtXYkhu?=
 =?utf-8?B?elA1dFQ0YXUxcHlrVXNmS0hxQmxtdDVsK0JkdEttaEI3eVI3eUVvRDR6aDM0?=
 =?utf-8?B?RW5LNWxRRFdkSi9SM0kyOTVOMkJWcE1jRGVjc1lZS25kTmVaM3dNOFd2Z0Fi?=
 =?utf-8?B?NXhLVmJKMmhxN2FxSnVpOVg4S0tFNGRORDUwcVVKRFp5YmVQRndybmNOemFm?=
 =?utf-8?B?dlkvYWdjY2VIWW1GSnZqNUk5SENvc0hRUnVKQWJFb1R4Tm1mTG4zTDRMSU1y?=
 =?utf-8?B?ZG5lWkx0VllhUnBMdEpaR0NrMFpONEo0TU9pbGpxT3dhaG1sS0JUU1krQlJt?=
 =?utf-8?B?Y3J5T1VvZ2dwUVJsVU1YUkhJWGFDTW5DaE9wdUh3eHZ5OGM5Z1Bsc0VtZ1dP?=
 =?utf-8?B?SjMwVlBBNTdkUldTbHN5bGtWME9KYjBQVEFhcGpZTDVRbGZUL29RVjdSaDdo?=
 =?utf-8?B?aGdaWlV2bVh4ZEdxWCs1MEwzOGM3d3JHUFhqTUkvMjNiTW1Sai9sQ2FNNm5J?=
 =?utf-8?B?K1lKajA4TXNxaGljcDI2Uk16Zk1XNFdUT1NIVCtwWm9uUlNzaDVTL2lIQ3NY?=
 =?utf-8?B?alRSQnZLbjZWNHA4bWh1RldGOFcvVlRYMFhNeGFsaUpzU1VtQkRuQlZuUDJu?=
 =?utf-8?B?TEo4ZkljT3ZTb3U1ZnFmUEV5NTA4cWFGSVZlaUlCd2ZVZ0doTklTMkF0UEJV?=
 =?utf-8?B?ZGlob1gzUDRxbXEvRHhJdmgrV2UrQXAvdHp5L2ZuUEVDR0FRdnMwK3hIcFRu?=
 =?utf-8?B?bUx6eDhlUVJZUjlqMDhsR2pSTUxzOHlqRDc5TjE4c3phL2llRVdmcVZWN0lw?=
 =?utf-8?B?TDB4a055bnV3Q3hjdGJIREI2aVVGTC92ZlpZbzNLODljVHd0L1RFU3Jscmor?=
 =?utf-8?B?Rkk4bENjN1B3RUNSMzViOFFONVRKOHh0ZGhjbXdMWmZrUHJiU256VWhpRUFM?=
 =?utf-8?B?TmJabHRFUFVFSHhkZzl0cnlpdm94V2RxY3J3NE9wK2d2Tjk3SVltWEJoT2V0?=
 =?utf-8?B?OFBMUEpKcTNkNVpHZkg2ZStvWUhpWGFTQy9pZHZTY3JmeE5vYVNWc1N5Ky8w?=
 =?utf-8?B?VVRwWTNTK2tHNzNWNUJzM0pBMTYyYm5sbWtJUnowTWc0SG9GV3l5bzMzaVNQ?=
 =?utf-8?B?Ukd3N2VWRy9tMEhRdXg4NlV0WWN3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V8iYZOAnElcMLiFtdDufX7dBLnCLK4YmrE3m9jMvVjZ/TdDsC9FuOW2c3JQxPrO8YTd+o1UGxZUe7QApcJUDqWXDn1cPzhoftAsF8CgaA4vNlchFmTlrf4iJgorLh5o70txISFH24/RWSn0+Bv/cja6+nke1R7+ZE7DMel8FM3QWotVJErgYC61m/uDsXQ3ZD0bwtKe/HM0tVB6eYbxM3SgGG5pTC/36sExm4ciNnZrAbgsjiVlfpHZfv2v7iZlQD2k8WMgwaNC/Bl2LrRiZ9zw2kLS1Z6MWvpUdBPMab45n5p6bjoQKXTx3p+GCmzujtnuBWSV6plR3YCgQbY7r+E0rzxQChVtqKHXJ/cPp2Vg0ofInYYiVNb1M5m+Z+v0dyZPPC/ItDlfNc3ESY1n93K28RShY8mZQkmri0QWNu9hqkuh8bmHrNHF02dAi4AWn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 19:29:55.9661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f823041-b3e8-4684-c4fb-08de69a3f00a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9020
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 76D721272AB
X-Rspamd-Action: no action


On 2/11/26 11:23, Mario Limonciello wrote:
> On 2/10/26 1:16 PM, Lizhi Hou wrote:
>> When an application issues a query IOCTL while auto suspend is running,
>> a deadlock can occur. The query path holds dev_lock and then calls
>> pm_runtime_resume_and_get(), which waits for the ongoing suspend to
>> complete. Meanwhile, the suspend callback attempts to acquire dev_lock
>> and blocks, resulting in a deadlock.
>>
>> Fix this by releasing dev_lock before calling 
>> pm_runtime_resume_and_get()
>> and reacquiring it after the call completes. Also acquire dev_lock in 
>> the
>> resume callback to keep the locking consistent.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> No Fixes tag?

Oh, forgot that. Will add and post V2 patch


Thanks,

Lizhi

>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c    |  4 ++--
>>   drivers/accel/amdxdna/aie2_pci.c    |  7 +++----
>>   drivers/accel/amdxdna/aie2_pm.c     |  2 +-
>>   drivers/accel/amdxdna/amdxdna_ctx.c | 19 +++++++------------
>>   drivers/accel/amdxdna/amdxdna_pm.c  |  2 ++
>>   drivers/accel/amdxdna/amdxdna_pm.h  | 11 +++++++++++
>>   6 files changed, 26 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> index 37d05f2e986f..58e146172b61 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -629,7 +629,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>>           goto free_entity;
>>       }
>>   -    ret = amdxdna_pm_resume_get(xdna);
>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>       if (ret)
>>           goto free_col_list;
>>   @@ -760,7 +760,7 @@ static int aie2_hwctx_cu_config(struct 
>> amdxdna_hwctx *hwctx, void *buf, u32 size
>>       if (!hwctx->cus)
>>           return -ENOMEM;
>>   -    ret = amdxdna_pm_resume_get(xdna);
>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>       if (ret)
>>           goto free_cus;
>>   diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index f70ccf0f3c01..5b326e4610e6 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -451,7 +451,6 @@ static int aie2_hw_suspend(struct amdxdna_dev *xdna)
>>   {
>>       struct amdxdna_client *client;
>>   -    guard(mutex)(&xdna->dev_lock);
>>       list_for_each_entry(client, &xdna->client_list, node)
>>           aie2_hwctx_suspend(client);
>>   @@ -951,7 +950,7 @@ static int aie2_get_info(struct amdxdna_client 
>> *client, struct amdxdna_drm_get_i
>>       if (!drm_dev_enter(&xdna->ddev, &idx))
>>           return -ENODEV;
>>   -    ret = amdxdna_pm_resume_get(xdna);
>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>       if (ret)
>>           goto dev_exit;
>>   @@ -1044,7 +1043,7 @@ static int aie2_get_array(struct 
>> amdxdna_client *client,
>>       if (!drm_dev_enter(&xdna->ddev, &idx))
>>           return -ENODEV;
>>   -    ret = amdxdna_pm_resume_get(xdna);
>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>       if (ret)
>>           goto dev_exit;
>>   @@ -1134,7 +1133,7 @@ static int aie2_set_state(struct 
>> amdxdna_client *client,
>>       if (!drm_dev_enter(&xdna->ddev, &idx))
>>           return -ENODEV;
>>   -    ret = amdxdna_pm_resume_get(xdna);
>> +    ret = amdxdna_pm_resume_get_locked(xdna);
>>       if (ret)
>>           goto dev_exit;
>>   diff --git a/drivers/accel/amdxdna/aie2_pm.c 
>> b/drivers/accel/amdxdna/aie2_pm.c
>> index 579b8be13b18..29bd4403a94d 100644
>> --- a/drivers/accel/amdxdna/aie2_pm.c
>> +++ b/drivers/accel/amdxdna/aie2_pm.c
>> @@ -31,7 +31,7 @@ int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, 
>> u32 dpm_level)
>>   {
>>       int ret;
>>   -    ret = amdxdna_pm_resume_get(ndev->xdna);
>> +    ret = amdxdna_pm_resume_get_locked(ndev->xdna);
>>       if (ret)
>>           return ret;
>>   diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c 
>> b/drivers/accel/amdxdna/amdxdna_ctx.c
>> index d17aef89a0ad..db3aa26fb55f 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>> @@ -266,9 +266,9 @@ int amdxdna_drm_config_hwctx_ioctl(struct 
>> drm_device *dev, void *data, struct dr
>>       struct amdxdna_drm_config_hwctx *args = data;
>>       struct amdxdna_dev *xdna = to_xdna_dev(dev);
>>       struct amdxdna_hwctx *hwctx;
>> -    int ret, idx;
>>       u32 buf_size;
>>       void *buf;
>> +    int ret;
>>       u64 val;
>>         if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
>> @@ -310,20 +310,17 @@ int amdxdna_drm_config_hwctx_ioctl(struct 
>> drm_device *dev, void *data, struct dr
>>           return -EINVAL;
>>       }
>>   -    mutex_lock(&xdna->dev_lock);
>> -    idx = srcu_read_lock(&client->hwctx_srcu);
>> +    guard(mutex)(&xdna->dev_lock);
>>       hwctx = xa_load(&client->hwctx_xa, args->handle);
>>       if (!hwctx) {
>>           XDNA_DBG(xdna, "PID %d failed to get hwctx %d", 
>> client->pid, args->handle);
>>           ret = -EINVAL;
>> -        goto unlock_srcu;
>> +        goto free_buf;
>>       }
>>         ret = xdna->dev_info->ops->hwctx_config(hwctx, 
>> args->param_type, val, buf, buf_size);
>>   -unlock_srcu:
>> -    srcu_read_unlock(&client->hwctx_srcu, idx);
>> -    mutex_unlock(&xdna->dev_lock);
>> +free_buf:
>>       kfree(buf);
>>       return ret;
>>   }
>> @@ -334,7 +331,7 @@ int amdxdna_hwctx_sync_debug_bo(struct 
>> amdxdna_client *client, u32 debug_bo_hdl)
>>       struct amdxdna_hwctx *hwctx;
>>       struct amdxdna_gem_obj *abo;
>>       struct drm_gem_object *gobj;
>> -    int ret, idx;
>> +    int ret;
>>         if (!xdna->dev_info->ops->hwctx_sync_debug_bo)
>>           return -EOPNOTSUPP;
>> @@ -345,17 +342,15 @@ int amdxdna_hwctx_sync_debug_bo(struct 
>> amdxdna_client *client, u32 debug_bo_hdl)
>>         abo = to_xdna_obj(gobj);
>>       guard(mutex)(&xdna->dev_lock);
>> -    idx = srcu_read_lock(&client->hwctx_srcu);
>>       hwctx = xa_load(&client->hwctx_xa, abo->assigned_hwctx);
>>       if (!hwctx) {
>>           ret = -EINVAL;
>> -        goto unlock_srcu;
>> +        goto put_obj;
>>       }
>>         ret = xdna->dev_info->ops->hwctx_sync_debug_bo(hwctx, 
>> debug_bo_hdl);
>>   -unlock_srcu:
>> -    srcu_read_unlock(&client->hwctx_srcu, idx);
>> +put_obj:
>>       drm_gem_object_put(gobj);
>>       return ret;
>>   }
>> diff --git a/drivers/accel/amdxdna/amdxdna_pm.c 
>> b/drivers/accel/amdxdna/amdxdna_pm.c
>> index d024d480521c..b1fafddd7ad5 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pm.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pm.c
>> @@ -16,6 +16,7 @@ int amdxdna_pm_suspend(struct device *dev)
>>       struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>>       int ret = -EOPNOTSUPP;
>>   +    guard(mutex)(&xdna->dev_lock);
>>       if (xdna->dev_info->ops->suspend)
>>           ret = xdna->dev_info->ops->suspend(xdna);
>>   @@ -28,6 +29,7 @@ int amdxdna_pm_resume(struct device *dev)
>>       struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>>       int ret = -EOPNOTSUPP;
>>   +    guard(mutex)(&xdna->dev_lock);
>>       if (xdna->dev_info->ops->resume)
>>           ret = xdna->dev_info->ops->resume(xdna);
>>   diff --git a/drivers/accel/amdxdna/amdxdna_pm.h 
>> b/drivers/accel/amdxdna/amdxdna_pm.h
>> index 77b2d6e45570..3d26b973e0e3 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pm.h
>> +++ b/drivers/accel/amdxdna/amdxdna_pm.h
>> @@ -15,4 +15,15 @@ void amdxdna_pm_suspend_put(struct amdxdna_dev 
>> *xdna);
>>   void amdxdna_pm_init(struct amdxdna_dev *xdna);
>>   void amdxdna_pm_fini(struct amdxdna_dev *xdna);
>>   +static inline int amdxdna_pm_resume_get_locked(struct amdxdna_dev 
>> *xdna)
>> +{
>> +    int ret;
>> +
>> +    mutex_unlock(&xdna->dev_lock);
>> +    ret = amdxdna_pm_resume_get(xdna);
>> +    mutex_lock(&xdna->dev_lock);
>> +
>> +    return ret;
>> +}
>> +
>>   #endif /* _AMDXDNA_PM_H_ */
>
