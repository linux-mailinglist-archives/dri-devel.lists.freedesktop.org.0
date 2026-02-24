Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFuoKJfznGk5MQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 01:40:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03555180493
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 01:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F1A10E05F;
	Tue, 24 Feb 2026 00:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e1qz72nr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013023.outbound.protection.outlook.com
 [40.107.201.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C8210E05F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 00:40:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfGZ+kDJZwDU3A5q6NtiTOacnE3wGbNo7n+Flbwtt7A90Ans5qLQHMfdvVxry+ablkqLiFVsWrenk5oGy4lGgLVt76qmlcW4IPvrJLsMGNjz85SK7odmmTJHiBkoru0MOSBF3YxJMzrsSAy7a1hwBuSPbo6GIxLEq1BK2/jiPndqa4HY5ZoZLsVSi40DEFM1DdxIpMxQbEwQsEzA23Ty9/KKBHJvVyHxitBqDztqqagKncOX+AAQEEHsNfNNyrZqxIlGmdZAFw/30cmJ+3xkowYumag1igl+soKf2bKZulpqboDcdLl0jTAnQopkSo7QkRT4BH3rUCOyROKq/9JgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JCc+LEhl9Inqofh7HAcghD54OPPky+2atXiD/Zm+ow=;
 b=cUJmDLQylTHCOtUQtPOtBL0KUACw1I6FRznTJCkkwUcET0GBENMiFjqsy9Lg8xA6NWpMs8ec6Oglx/45A4Im/9DA51YhU81Snf0QbWBW4UiEGZdCpIqPJvb3/55gb+ynka3nUIgfDIHn4JuFecy8dUGjmmj3u3JUF5sDWXjZMoZ/dmsfsbqCCzPYP3+jO/slK9OT+DTDPjUTbVBNuzfEn+uywqdEP2gnpmSXeCVgnQQ4/ZI1mAIeMNtJh1KMXqYblvQq/PEexRspc75EHcuyktvopq5ld2JM+Eqk0rHOhQZxTIRh+/AnS0Q5ksy7f8F/+ctyJwhZ+d84vOdrjga7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JCc+LEhl9Inqofh7HAcghD54OPPky+2atXiD/Zm+ow=;
 b=e1qz72nrWQadAwAAarrQoBu/LeL0HSoxC6WmhEP/FdXFhAu4PRMJ4h2VspMxDZA6bFmRME7j5A7f/Fjz7vZR+/3v7C77wOLzJbqVMB/ndl08fmlpmcRf9WFJgU/8JNJX/uYWtd0Qs4dxmoV0Df3KhaA8nfq+S/5rfEVZKjegwS8=
Received: from SJ0PR13CA0031.namprd13.prod.outlook.com (2603:10b6:a03:2c2::6)
 by BN5PR12MB9537.namprd12.prod.outlook.com (2603:10b6:408:2a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 00:40:45 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::7d) by SJ0PR13CA0031.outlook.office365.com
 (2603:10b6:a03:2c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Tue,
 24 Feb 2026 00:40:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 00:40:45 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 18:40:45 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 18:40:45 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 18:40:44 -0600
Message-ID: <7fcb1e24-4cbf-1ea9-06eb-e5c303386c02@amd.com>
Date: Mon, 23 Feb 2026 16:40:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Limit number of maximum contexts and
 doorbells per user
Content-Language: en-US
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jeff.hugo@oss.qualcomm.com>,
 <karol.wachowski@linux.intel.com>
References: <20260220160059.220328-1-maciej.falkowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260220160059.220328-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|BN5PR12MB9537:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9e9765-d407-4111-4bb0-08de733d58d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2ZhSng5S3g4a2NoVFJHWTVRSmxJR2d5UWMwMkNSeWw4TG5STHZ2VGh4cEFr?=
 =?utf-8?B?WkZnbkxnSGFZSGZsaFU5QUFLVUFWZmVKeHkyQ2xIbmFTMFg4S3A3czUreDBQ?=
 =?utf-8?B?UUt0c2F3SHJZVXV6dlYzUFoxSVpYWXF4dlpPODlaVjNtNXc4dk5XQzFNZmFz?=
 =?utf-8?B?ZXl1alVPN2NuZGxzSkdKU3AvVVhIWjVDWG14L21JZkdEMERscnFPVzY5M3JG?=
 =?utf-8?B?bm5hbW1GLzkrT3FpSHFrRFFhZElVQ1F3QlVWcTlGN0hwV0dka3dpYXFlTDNu?=
 =?utf-8?B?TDJtODJYUmhQTDJVZXdtQkRWQWJMc01PNXJoWndsa2lCWGNzK3JEVE9JMjJp?=
 =?utf-8?B?eENoVEFiUUd1aWtaSjMyMzVLNzVUTno1ZkpET05IY0NUQTRFNFlJNWV0L09q?=
 =?utf-8?B?MW9zT0VPNmJLYm5JNUp5MHFzUjlCZjdCUFh2K0FFOXRuU1l5eFZqTEg5cC9t?=
 =?utf-8?B?TG1mNnRtNzNJV053M01hSFRoaGJseTJ1N3pLNjJRL01XempVak5wL1BmRGlQ?=
 =?utf-8?B?VHQvaG9kaFF5a3YwTDNlaWEzWUFDWmhXellsU2hUaUphQTVZRnllVHJEMkZx?=
 =?utf-8?B?Um9BNUVoMEYyMmJTVDNhNkJHMXFjVWdKek5seGx4ZFFsUmhydDFhS3kzcWhu?=
 =?utf-8?B?c3ZQV3F3T1ZHdlRFbmJXTDhWVmdzRk5NTFMrYzAyell0aEdmcklRMGkvdzRt?=
 =?utf-8?B?NDQrWFdsYjlKUGdhWEx6Z0JBbmthdWdTTGtKbnN5akxqMzIyRGtUeDNBWFNG?=
 =?utf-8?B?WGR2VjVFMmJUMDUwcis2ejNDNUl2TldYOVdMQ3RZclVDcit3Y25nQ1EyUjlr?=
 =?utf-8?B?NWNMbkNlKys3V3RGN05VUTl5cUlIWkpxUHJKZVZXQW4wUW52YzBQTlBZWnIy?=
 =?utf-8?B?aGdSR0ZWdTVuMy84Q3NhVnBMbHJxdlVuSGlRTTlUY0NIUzBSNHVzeXJIY0Mz?=
 =?utf-8?B?cVVvMmpzN1hpR1BteXZudW4zOXlYM0VoZDZ6cmlTb09mWnkyTXhPQzQ4S3JS?=
 =?utf-8?B?aW1rMXIzUXpWbGpnSXBTbnFnUnhpT3pZZlY2alU0V0tBUktNY2FqY2s1S1FQ?=
 =?utf-8?B?UTVlUmhlb2F0RG4vb3hUMGVBaTlXVGkycG94TTNKTXNhaVNORUpZUGt6TEl6?=
 =?utf-8?B?NkwzQkRXTklDM3ladEFYU1BtK09kSWpwVm5mUTNzd1pjQVl5RnU1ZTNtR1Y1?=
 =?utf-8?B?YUdPTkVJNGhWeWtvQXJjZ095M0tKOXg0eFJEMXRtNVBKYTN1NHJwYXg3aU12?=
 =?utf-8?B?V080Vk5yYXRBbXViMjYrYWY0dUJ4NWRzMENQNnNGNVQydmxuZHp3Undvejg0?=
 =?utf-8?B?cXdHV1pDNU1tNDhoRGJtS1JIaUJ6RDB1NWN4Q1VWbU9Kd1dNMzdQcWIxdElh?=
 =?utf-8?B?enhZdFF1cmxsNTB3MWgwR1JVL0NZK2FxWUwzR1p6YVNvME5PZ1RxT1ZpeGxl?=
 =?utf-8?B?OExsdndjZlBScEZBTHNRTzhaLytMVDBlMFhNU1lLRElLdSs3OXlWeEczSk1y?=
 =?utf-8?B?bmNJYkJkYUJncGhXY3BFWHhSWUM0YlRuaytOdmtSZytxVExqcXJ5N3VqVlF6?=
 =?utf-8?B?L1pzK2xDbDFUREZqWFM5OEVySFBiYzA5RXdDSHFWVCsyWCtpeWpmOG5vUVpQ?=
 =?utf-8?B?TGorSjg1aTZmSGZ3NTFySThXZlFISjFGYWM4S0lwdVpKN3E5M043WmovaWhx?=
 =?utf-8?B?Yzl5ZXRpd3ZJUzk4cllSRW04KzBKcG5pYUhINEVYc0thck9UK01IcnAxN1hS?=
 =?utf-8?B?SXdGWVhLWk52RzNnSFIrWXVmaUsrajFvblhScXREZnJlR2lMLzU3Q1h6OGJT?=
 =?utf-8?B?UXMwaEYzRTkwdW1kNzhIT1lmaVlKd29kQXVUS1gxajFyVXR2TWdoTTY0V1lI?=
 =?utf-8?B?NWNaWURsRDl1cC8zdXpLb2gxVmFKTXVqdXZaQ0czTm1QOHp2dGZHRjlVL2ZF?=
 =?utf-8?B?SmIvT3JVQlkycGJRUk5ZSmxSQ1RGODhWaGhaQ2RKSkQ0bHlNWGg2enovNzB5?=
 =?utf-8?B?LzZRTmdMa0tRaHFOVFNKbU9vUXlyWHJlcTJTV3hPd0VBeSs2THdHSlZrMXph?=
 =?utf-8?B?VERPcnB0TzAzMUJNRWd0UEVPL1NEVEIxY0FWTFh3Q21idGlBZmNlVGk5dmNW?=
 =?utf-8?B?NVhQZlcvb05LRTlOZGV6NUNPREsyVm1rS3FWVnZaVC8yVGlNR2U4T1R2WFlS?=
 =?utf-8?B?djZDc21wa2VLU3VpK2hQSkVmb3dPUmt3SWpRM0tnMUptN0pGeUR3MnJKRWg2?=
 =?utf-8?B?SlVrMFdDVjRtOFdzMGI3amkvcXJ3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wYJRBLOmEPVBT19JPiT9ejJcU01I0raW1YdBDRS21hY4nZ8ndvH3zXUW6wGPxvd7TQIiqeZAcnVs7ewEcknmrQlIN/0KPSNQv2A2X5jfh5VQjQJUXS+WBQKnghTrFkSTVImHSLoTr6Kr/HDAt5aOuhUu9jiD5H5XeCo4gnS4jYyp6chFWWrbV3KCWihMPZHHhnTzAkTfOdr4zomIDmPgYQEPXIeDzNX1M/TEbNzsFLYBWW+CjMr9oMx7cS1UwMuGl+q/ZpIW21wQdSgF6aVj7ohcAbP6IOfL92GkduIo4wRubZaaPn0HvJSdDe5Ge93Vwz8lo/zJk9B5AjhP6h3Cljdg++IkkuGbPOw8FmP7P1Mzlcm87VI7o1/YYCL0rWy8gruaB0nY6E9TPJ8PLi/UZY46Jz8HyY2TkWvBpGLP7kRRFd3NT27u3WhHHJfS1mkl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 00:40:45.3215 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9e9765-d407-4111-4bb0-08de733d58d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9537
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maciej.falkowski@linux.intel.com,m:oded.gabbay@gmail.com,m:jeff.hugo@oss.qualcomm.com,m:karol.wachowski@linux.intel.com,m:odedgabbay@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 03555180493
X-Rspamd-Action: no action


On 2/20/26 08:00, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
>
> Implement per-user resource limits to prevent resource exhaustion.
>
> Root users can allocate all available contexts (128) and doorbells
> (255), while non-root users are limited to half of the available
> resources (64 contexts and 127 doorbells respectively).
>
> This prevents scenarios where a single user could monopolize NPU
> resources and starve other users on multi-user systems.
>
> Change doorbell ID and command queue ID allocation errors to debug
> messages as those are user triggered.
>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c | 94 ++++++++++++++++++++++++++++++++---
>   drivers/accel/ivpu/ivpu_drv.h | 26 ++++++++--
>   drivers/accel/ivpu/ivpu_job.c | 36 ++++++++++----
>   3 files changed, 136 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 3b6ec8eecf2f..1119e3fea29e 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -68,6 +68,73 @@ bool ivpu_force_snoop;
>   module_param_named(force_snoop, ivpu_force_snoop, bool, 0444);
>   MODULE_PARM_DESC(force_snoop, "Force snooping for NPU host memory access");
>   
> +static struct ivpu_user_limits *ivpu_user_limits_alloc(struct ivpu_device *vdev, uid_t uid)
> +{
> +	struct ivpu_user_limits *limits;
> +
> +	limits = kzalloc(sizeof(*limits), GFP_KERNEL);
> +	if (!limits)
> +		return ERR_PTR(-ENOMEM);
> +
> +	kref_init(&limits->ref);
> +	atomic_set(&limits->db_count, 0);
> +	limits->vdev = vdev;
> +	limits->uid = uid;
> +
> +	/* Allow root user to allocate all contexts */
> +	if (uid == 0) {
> +		limits->max_ctx_count = ivpu_get_context_count(vdev);
> +		limits->max_db_count = ivpu_get_doorbell_count(vdev);
> +	} else {
> +		limits->max_ctx_count = ivpu_get_context_count(vdev) / 2;
> +		limits->max_db_count = ivpu_get_doorbell_count(vdev) / 2;
> +	}
> +
> +	hash_add(vdev->user_limits, &limits->hash_node, uid);
> +
> +	return limits;
> +}
> +
> +static struct ivpu_user_limits *ivpu_user_limits_get(struct ivpu_device *vdev)
> +{
> +	struct ivpu_user_limits *limits;
> +	uid_t uid = current_uid().val;
> +
> +	guard(mutex)(&vdev->user_limits_lock);
> +
> +	hash_for_each_possible(vdev->user_limits, limits, hash_node, uid) {
> +		if (limits->uid == uid) {
> +			if (kref_read(&limits->ref) > limits->max_ctx_count) {

Should it be: kref_read() >= limits->max_ctx_count?

Lizhi

> +				ivpu_dbg(vdev, IOCTL, "User %u exceeded max ctx count %u\n", uid,
> +					 limits->max_ctx_count);
> +				return ERR_PTR(-EMFILE);
> +			}
> +
> +			kref_get(&limits->ref);
> +			return limits;
> +		}
> +	}
> +
> +	return ivpu_user_limits_alloc(vdev, uid);
> +}
> +
> +static void ivpu_user_limits_release(struct kref *ref)
> +{
> +	struct ivpu_user_limits *limits = container_of(ref, struct ivpu_user_limits, ref);
> +	struct ivpu_device *vdev = limits->vdev;
> +
> +	lockdep_assert_held(&vdev->user_limits_lock);
> +	drm_WARN_ON(&vdev->drm, atomic_read(&limits->db_count));
> +	hash_del(&limits->hash_node);
> +	kfree(limits);
> +}
> +
> +static void ivpu_user_limits_put(struct ivpu_device *vdev, struct ivpu_user_limits *limits)
> +{
> +	guard(mutex)(&vdev->user_limits_lock);
> +	kref_put(&limits->ref, ivpu_user_limits_release);
> +}
> +
>   struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv)
>   {
>   	struct ivpu_device *vdev = file_priv->vdev;
> @@ -111,6 +178,7 @@ static void file_priv_release(struct kref *ref)
>   	mutex_unlock(&vdev->context_list_lock);
>   	pm_runtime_put_autosuspend(vdev->drm.dev);
>   
> +	ivpu_user_limits_put(vdev, file_priv->user_limits);
>   	mutex_destroy(&file_priv->ms_lock);
>   	mutex_destroy(&file_priv->lock);
>   	kfree(file_priv);
> @@ -170,7 +238,7 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>   		args->value = ivpu_hw_dpu_max_freq_get(vdev);
>   		break;
>   	case DRM_IVPU_PARAM_NUM_CONTEXTS:
> -		args->value = ivpu_get_context_count(vdev);
> +		args->value = file_priv->user_limits->max_ctx_count;
>   		break;
>   	case DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
>   		args->value = vdev->hw->ranges.user.start;
> @@ -232,22 +300,30 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
>   {
>   	struct ivpu_device *vdev = to_ivpu_device(dev);
>   	struct ivpu_file_priv *file_priv;
> +	struct ivpu_user_limits *limits;
>   	u32 ctx_id;
>   	int idx, ret;
>   
>   	if (!drm_dev_enter(dev, &idx))
>   		return -ENODEV;
>   
> +	limits = ivpu_user_limits_get(vdev);
> +	if (IS_ERR(limits)) {
> +		ret = PTR_ERR(limits);
> +		goto err_dev_exit;
> +	}
> +
>   	file_priv = kzalloc(sizeof(*file_priv), GFP_KERNEL);
>   	if (!file_priv) {
>   		ret = -ENOMEM;
> -		goto err_dev_exit;
> +		goto err_user_limits_put;
>   	}
>   
>   	INIT_LIST_HEAD(&file_priv->ms_instance_list);
>   
>   	file_priv->vdev = vdev;
>   	file_priv->bound = true;
> +	file_priv->user_limits = limits;
>   	kref_init(&file_priv->ref);
>   	mutex_init(&file_priv->lock);
>   	mutex_init(&file_priv->ms_lock);
> @@ -285,6 +361,8 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
>   	mutex_destroy(&file_priv->ms_lock);
>   	mutex_destroy(&file_priv->lock);
>   	kfree(file_priv);
> +err_user_limits_put:
> +	ivpu_user_limits_put(vdev, limits);
>   err_dev_exit:
>   	drm_dev_exit(idx);
>   	return ret;
> @@ -344,8 +422,7 @@ static int ivpu_wait_for_ready(struct ivpu_device *vdev)
>   	ivpu_ipc_consumer_del(vdev, &cons);
>   
>   	if (!ret && ipc_hdr.data_addr != IVPU_IPC_BOOT_MSG_DATA_ADDR) {
> -		ivpu_err(vdev, "Invalid NPU ready message: 0x%x\n",
> -			 ipc_hdr.data_addr);
> +		ivpu_err(vdev, "Invalid NPU ready message: 0x%x\n", ipc_hdr.data_addr);
>   		return -EIO;
>   	}
>   
> @@ -454,7 +531,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
>   }
>   
>   static const struct file_operations ivpu_fops = {
> -	.owner		= THIS_MODULE,
> +	.owner = THIS_MODULE,
>   	DRM_ACCEL_FOPS,
>   #ifdef CONFIG_PROC_FS
>   	.show_fdinfo = drm_show_fdinfo,
> @@ -593,6 +670,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>   	xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
>   	xa_init_flags(&vdev->db_xa, XA_FLAGS_ALLOC1);
>   	INIT_LIST_HEAD(&vdev->bo_list);
> +	hash_init(vdev->user_limits);
>   
>   	vdev->db_limit.min = IVPU_MIN_DB;
>   	vdev->db_limit.max = IVPU_MAX_DB;
> @@ -601,6 +679,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>   	if (ret)
>   		goto err_xa_destroy;
>   
> +	ret = drmm_mutex_init(&vdev->drm, &vdev->user_limits_lock);
> +	if (ret)
> +		goto err_xa_destroy;
> +
>   	ret = drmm_mutex_init(&vdev->drm, &vdev->submitted_jobs_lock);
>   	if (ret)
>   		goto err_xa_destroy;
> @@ -718,7 +800,7 @@ static struct pci_device_id ivpu_pci_ids[] = {
>   	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PTL_P) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_WCL) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_NVL) },
> -	{ }
> +	{}
>   };
>   MODULE_DEVICE_TABLE(pci, ivpu_pci_ids);
>   
> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> index 78ecddf2831d..0b5aa41151c6 100644
> --- a/drivers/accel/ivpu/ivpu_drv.h
> +++ b/drivers/accel/ivpu/ivpu_drv.h
> @@ -12,6 +12,7 @@
>   #include <drm/drm_mm.h>
>   #include <drm/drm_print.h>
>   
> +#include <linux/hashtable.h>
>   #include <linux/pci.h>
>   #include <linux/xarray.h>
>   #include <uapi/drm/ivpu_accel.h>
> @@ -43,7 +44,7 @@
>   /* SSID 1 is used by the VPU to represent reserved context */
>   #define IVPU_RESERVED_CONTEXT_MMU_SSID 1
>   #define IVPU_USER_CONTEXT_MIN_SSID     2
> -#define IVPU_USER_CONTEXT_MAX_SSID     (IVPU_USER_CONTEXT_MIN_SSID + 63)
> +#define IVPU_USER_CONTEXT_MAX_SSID     (IVPU_USER_CONTEXT_MIN_SSID + 128)
>   
>   #define IVPU_MIN_DB 1
>   #define IVPU_MAX_DB 255
> @@ -51,9 +52,6 @@
>   #define IVPU_JOB_ID_JOB_MASK		GENMASK(7, 0)
>   #define IVPU_JOB_ID_CONTEXT_MASK	GENMASK(31, 8)
>   
> -#define IVPU_NUM_PRIORITIES    4
> -#define IVPU_NUM_CMDQS_PER_CTX (IVPU_NUM_PRIORITIES)
> -
>   #define IVPU_CMDQ_MIN_ID 1
>   #define IVPU_CMDQ_MAX_ID 255
>   
> @@ -124,6 +122,16 @@ struct ivpu_fw_info;
>   struct ivpu_ipc_info;
>   struct ivpu_pm_info;
>   
> +struct ivpu_user_limits {
> +	struct hlist_node hash_node;
> +	struct ivpu_device *vdev;
> +	struct kref ref;
> +	u32 max_ctx_count;
> +	u32 max_db_count;
> +	u32 uid;
> +	atomic_t db_count;
> +};
> +
>   struct ivpu_device {
>   	struct drm_device drm;
>   	void __iomem *regb;
> @@ -143,6 +151,8 @@ struct ivpu_device {
>   	struct mutex context_list_lock; /* Protects user context addition/removal */
>   	struct xarray context_xa;
>   	struct xa_limit context_xa_limit;
> +	DECLARE_HASHTABLE(user_limits, 8);
> +	struct mutex user_limits_lock; /* Protects user_limits */
>   
>   	struct xarray db_xa;
>   	struct xa_limit db_limit;
> @@ -190,6 +200,7 @@ struct ivpu_file_priv {
>   	struct list_head ms_instance_list;
>   	struct ivpu_bo *ms_info_bo;
>   	struct xa_limit job_limit;
> +	struct ivpu_user_limits *user_limits;
>   	u32 job_id_next;
>   	struct xa_limit cmdq_limit;
>   	u32 cmdq_id_next;
> @@ -287,6 +298,13 @@ static inline u32 ivpu_get_context_count(struct ivpu_device *vdev)
>   	return (ctx_limit.max - ctx_limit.min + 1);
>   }
>   
> +static inline u32 ivpu_get_doorbell_count(struct ivpu_device *vdev)
> +{
> +	struct xa_limit db_limit = vdev->db_limit;
> +
> +	return (db_limit.max - db_limit.min + 1);
> +}
> +
>   static inline u32 ivpu_get_platform(struct ivpu_device *vdev)
>   {
>   	WARN_ON_ONCE(vdev->platform == IVPU_PLATFORM_INVALID);
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 4f8564e2878a..337ed269fd3e 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -173,7 +173,7 @@ static struct ivpu_cmdq *ivpu_cmdq_create(struct ivpu_file_priv *file_priv, u8 p
>   	ret = xa_alloc_cyclic(&file_priv->cmdq_xa, &cmdq->id, cmdq, file_priv->cmdq_limit,
>   			      &file_priv->cmdq_id_next, GFP_KERNEL);
>   	if (ret < 0) {
> -		ivpu_err(vdev, "Failed to allocate command queue ID: %d\n", ret);
> +		ivpu_dbg(vdev, IOCTL, "Failed to allocate command queue ID: %d\n", ret);
>   		goto err_free_cmdq;
>   	}
>   
> @@ -215,14 +215,22 @@ static int ivpu_hws_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq
>   
>   static int ivpu_register_db(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
>   {
> +	struct ivpu_user_limits *limits = file_priv->user_limits;
>   	struct ivpu_device *vdev = file_priv->vdev;
>   	int ret;
>   
> +	if (atomic_inc_return(&limits->db_count) > limits->max_db_count) {
> +		ivpu_dbg(vdev, IOCTL, "Maximum number of %u doorbells for uid %u reached\n",
> +			 limits->max_db_count, limits->uid);
> +		ret = -EBUSY;
> +		goto err_dec_db_count;
> +	}
> +
>   	ret = xa_alloc_cyclic(&vdev->db_xa, &cmdq->db_id, NULL, vdev->db_limit, &vdev->db_next,
>   			      GFP_KERNEL);
>   	if (ret < 0) {
> -		ivpu_err(vdev, "Failed to allocate doorbell ID: %d\n", ret);
> -		return ret;
> +		ivpu_dbg(vdev, IOCTL, "Failed to allocate doorbell ID: %d\n", ret);
> +		goto err_dec_db_count;
>   	}
>   
>   	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
> @@ -231,15 +239,18 @@ static int ivpu_register_db(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *
>   	else
>   		ret = ivpu_jsm_register_db(vdev, file_priv->ctx.id, cmdq->db_id,
>   					   cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
> -
> -	if (!ret) {
> -		ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d priority %d\n",
> -			 cmdq->db_id, cmdq->id, file_priv->ctx.id, cmdq->priority);
> -	} else {
> +	if (ret) {
>   		xa_erase(&vdev->db_xa, cmdq->db_id);
>   		cmdq->db_id = 0;
> +		goto err_dec_db_count;
>   	}
>   
> +	ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d priority %d\n",
> +		 cmdq->db_id, cmdq->id, file_priv->ctx.id, cmdq->priority);
> +	return 0;
> +
> +err_dec_db_count:
> +	atomic_dec(&limits->db_count);
>   	return ret;
>   }
>   
> @@ -298,6 +309,7 @@ static int ivpu_cmdq_unregister(struct ivpu_file_priv *file_priv, struct ivpu_cm
>   	}
>   
>   	xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
> +	atomic_dec(&file_priv->user_limits->db_count);
>   	cmdq->db_id = 0;
>   
>   	return 0;
> @@ -313,6 +325,7 @@ static inline u8 ivpu_job_to_jsm_priority(u8 priority)
>   
>   static void ivpu_cmdq_destroy(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
>   {
> +	lockdep_assert_held(&file_priv->lock);
>   	ivpu_cmdq_unregister(file_priv, cmdq);
>   	xa_erase(&file_priv->cmdq_xa, cmdq->id);
>   	ivpu_cmdq_free(file_priv, cmdq);
> @@ -380,8 +393,11 @@ static void ivpu_cmdq_reset(struct ivpu_file_priv *file_priv)
>   	mutex_lock(&file_priv->lock);
>   
>   	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq) {
> -		xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
> -		cmdq->db_id = 0;
> +		if (cmdq->db_id) {
> +			xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
> +			atomic_dec(&file_priv->user_limits->db_count);
> +			cmdq->db_id = 0;
> +		}
>   	}
>   
>   	mutex_unlock(&file_priv->lock);
