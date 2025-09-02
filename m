Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9470B40E11
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 21:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143AB10E025;
	Tue,  2 Sep 2025 19:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JnYAuxj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B072810E025
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 19:47:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4G2dfbB5aX+aFxP8jhbuINg+nm8bCNwk/0Evh2Rf+wMm+Tzm6qasw9oztzp65cDgnKrVbzezAeJZOeBF9CZysNNsYks4G+pjZMvMzp+KXaV/sUkF6RgewztAsWvZdM6Xl4+yhAO5xzHX73XUssvJIYIvU1QzbZodAY8nWlrcC3+xTsWkwzlB3bfcS829wmtkObOyLzPB0LYI89+pIgWOrSIea+LPOqHOStt7G5rC1JfSmjRDoK/UoWeaDwyOXwwg2A05JSStDOAdlxivufQD8Tnuv59R2Z577/amvSOB/IHT7F6XzwODu/M91jdeMAb70o31bcheoFHlycpCErsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bhcod4VEYRjg0FKdTz2WxN3NKkGDq+Q8tpQ2l1Et41o=;
 b=nFpojOJVlZlkweE23w2bKc0bBVxC+d+FEWh3t/iCP0mM9NCT+ZGgomaYQLTb5kbju8c1vVBTV+JPc6fGL5ZwWAz7KHGgxkFlMGOQoHC690MiDr+cWXFw6pf6CGOg10LkD7SeaKB6lp84YeOKK2orhtz4KVslSr05oGBBdaQAFSi8ImTLSfwF4lQBYW7UIyM38f1YHr8sK4xllK1EHdk4VhIOyqJqEkiEHAAFt00PySupPb6mPz/Mwjj2cqsJJuUR9LWJqCqz40PAPb7ZJgHGNRwVM6e5hfDt1hfv/kCXbSHtOePhAi2k/sMrLBTHfL9ATdtB9mG7ZxXgg9U3z1mf2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bhcod4VEYRjg0FKdTz2WxN3NKkGDq+Q8tpQ2l1Et41o=;
 b=JnYAuxj5/4XYAfDgfOe6EF6szvU25kpR/vAQt1onHJUpEepSPqlymzs6MBPwqyZY/UGR/YP86JytpYItYclDMCzusY8QOO3fS0OyJLZQC6RsfoGVislxnsnu6OjXjPq0DQXW0zu9snxLSwqdl2wv6TQA2mhkaMzVaj+oueXojpg=
Received: from BY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:1d0::35)
 by DM4PR12MB7598.namprd12.prod.outlook.com (2603:10b6:8:10a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 19:47:50 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::7d) by BY5PR04CA0025.outlook.office365.com
 (2603:10b6:a03:1d0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Tue,
 2 Sep 2025 19:47:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 19:47:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 14:47:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 2 Sep
 2025 12:47:48 -0700
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 14:47:48 -0500
Message-ID: <67138df3-115d-94cb-005f-84f6f56f5986@amd.com>
Date: Tue, 2 Sep 2025 12:47:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] MAINTAINERS: Update Min Ma's email for AMD XDNA driver
Content-Language: en-US
To: Min Ma <mamin506@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-kernel@vger.kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>
References: <dc0227cb-7e02-10c6-9790-2e2331ddfd6e@amd.com>
 <20250831001228.592-1-mamin506@gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250831001228.592-1-mamin506@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|DM4PR12MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff18969-aa20-4fdf-6b1e-08ddea5998fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmxPOTZPaTduemVDQ091TFFIcTdERUloUGFZQnZWS2tnOUVwTnF5N1ZiWDBu?=
 =?utf-8?B?V3hVTWRYSW9adkNJVzFKQTAzUU9pVGtUWDBPSE8yMG1GVWxCN25nZ2xISTdV?=
 =?utf-8?B?eHcwL01JajFOM2hoYUd2WGNxRE9JRHFyYVdLSUdCRDBjbXpESGVhMklMcHhO?=
 =?utf-8?B?Q0F0ZmtqV0JGN1BwU2FHanVGVUxUUnpPS2wxWjE3VUV3U1VVSU9XWExBRExG?=
 =?utf-8?B?M0hQNENITnBjUTRCN0V6OVdCc0hOcHFmbG03b3pSMGIxMTNMSytrNEFTTkUy?=
 =?utf-8?B?WGY4ZkdRMGxpS01qM2N4MDZJQkdlZlpQUlg0OHc3Z2o5NjR2QUtEUGJkU2l3?=
 =?utf-8?B?Z3l1cFBSZmhyQTMwZ1RxLzhBL0ZXSUdnRjNiUThZb1NPR3BRVWluZWhXeFZl?=
 =?utf-8?B?UFo4eVNtbUU3elRYYTlKc05hSm0rQmpNcUhYdXpuRmZ0MXUweGRUVGNqY3Y5?=
 =?utf-8?B?ZEp1cmRhUURLSnlXZXVhWGdvOEJLODRkdzMyZzZkVU9rYmJjV3NrbkYyclVr?=
 =?utf-8?B?SkZKR2IveEE3eUpmOWNXUWlGTVVydldPaHRSbkxoQkN0Zk9iN3gyWjJLL2g3?=
 =?utf-8?B?Tmo4NExUZldyYm5wT3FaYU0xb0dwZmNCL1pQakJDZGYySGxrNnd2eHJGWHdw?=
 =?utf-8?B?SXRkWUdra1A0TlduZlFkUERqSDV2L05JRmhhalR6amdRclhaQkM3L3ZkRDNw?=
 =?utf-8?B?clVoVTlXdi9YbGFiVG43cEkwZDFFYlQ5SkxhclpUeHphMnZLK3pPUzRFb2Y0?=
 =?utf-8?B?dDVKQ3p4Z01PVWVBR3BZOU5abDd5eGVFcDNrbVI4TXY0bEZPdTZtcktJOS8x?=
 =?utf-8?B?Q2l0KzMvUzZqWTFHWTR0aGhJdWZmZmFRU2M3NnlVd293RzJVbThGT1VvYVhK?=
 =?utf-8?B?SGpNeTl2enh0a3hidnRkUmgyM2hPSjNFK1JDYklxWFdjREY5ME9qWnBNV2Nm?=
 =?utf-8?B?c1hUZUsxWHlHTzdWME1UOEtuYXNJNmxBbys3UTc2bmYvbkVvNzNiS1NSNlQz?=
 =?utf-8?B?a01FRHBYV1JQajRZT3JITDNheGZlYkJQM0tkZUdYUHcrTDVoZXZ3MEhua3RH?=
 =?utf-8?B?ZW1yQ3FIeWlzVm9VNVVMbTB0Ly9ZRHFzNE5ZM1N1SXpZSWNGbVlzWnhYWGhr?=
 =?utf-8?B?R0JBY0ZPWStwS2VmY25LelE4ZnJVTm5hY3Z0Tkxya3VXODVRdCtpNUsva3gv?=
 =?utf-8?B?Ykl0Q3paQWw5TGR2K3FDSFNiZFdlSkFCSEM2bjRiSVY0dmRZckVYQ0xOR2Qv?=
 =?utf-8?B?RVBobDhhcnVOYWxBdlJXdHllaUpKRVMrR1hRWlpSNEkwOVFrR1hBUmlnbnVJ?=
 =?utf-8?B?V1VXbFpmcm0zUzN1ckJFcThOZEFRejFuZFRLcGxNbGtkcnROUHc3aXJFYnFF?=
 =?utf-8?B?ZGlCRnhpN1A0KzI2UnJ6czlXcWttQlA4ajIrWWlkMm5ISm1QWW5vaGpEcGRj?=
 =?utf-8?B?MUFJNDlmSmNxUk5ZU1psVG0vNkZacVNGaWlYU0FJU2tVVlJNMjlxM2paL2VI?=
 =?utf-8?B?WHlpWVFVcEpjem9yMkNaTUd2OGgvODU2ajBZOUpUSlhHTU1VUTVMRXMyMHE0?=
 =?utf-8?B?aEhmWmEzZnhvc0paVHRyYzhNMnZXOUJKejgvQTllZy93b2FkU1F4U0EvRExv?=
 =?utf-8?B?bHdiVncwTGF1OUJoOU5pcTVNTVJNblhxMm1HQyt5cml5emZpZ2ZmTlRTVlcy?=
 =?utf-8?B?NjV6alBpZU9iZzlGYUUwdlB3UGtybGJkSGpmZmxyUko5Nm5Zb0dTMndTV3FP?=
 =?utf-8?B?a3ZSSEl3S2ZtcXdNaW9BWG82TE1LTHNFcGtiYm5JTHZmdUtiS0o4SERaZkp5?=
 =?utf-8?B?cUlmOUFOV1M5U0NQRzlNc3F6VVp2dE1TNWZMUVhEYmhrR0xKRHE1aDFIYm5Y?=
 =?utf-8?B?Q2xteitMeDU1SG1CV3lHTkw1cnFmMGNxNTczN0tjT3VKK3VlZmkraHVnWWlY?=
 =?utf-8?B?ak04eGl2cnY3bkxTK0Q4cUlqOExUc3Q2bk9mdFM0cS9lbHRSRGd2RkZiUlFs?=
 =?utf-8?B?VmdLTVY2d3J1RTIwMVdhSnB4ZHdWVUVLVVJQak1VSWxUMVRuWFdxM3ZpRGZZ?=
 =?utf-8?Q?qrHf/5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 19:47:49.5341 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff18969-aa20-4fdf-6b1e-08ddea5998fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7598
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

Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

On 8/30/25 17:12, Min Ma wrote:
> I recently left AMD and would like to continue participating in
> the review and maintenance of the XDNA driver using my personal
> email address.
>
> Signed-off-by: Min Ma <mamin506@gmail.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10850512c118..6eefa494000c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1231,7 +1231,7 @@ F:	drivers/spi/spi-amd.c
>   F:	drivers/spi/spi-amd.h
>   
>   AMD XDNA DRIVER
> -M:	Min Ma <min.ma@amd.com>
> +M:	Min Ma <mamin506@gmail.com>
>   M:	Lizhi Hou <lizhi.hou@amd.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Supported
