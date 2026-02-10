Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YClAE+hoi2k1UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 18:20:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A519911DD05
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 18:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0897A10E5E3;
	Tue, 10 Feb 2026 17:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L13bce8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010022.outbound.protection.outlook.com
 [52.101.193.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E4610E5E4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 17:20:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eq4mvQFRvvsV788Lhq0FAKPA9zAOP/Run1cqUvY7TuAZIBC+czMq3i8+EEdVa6k7zVxCZOe4x/RhTRXWXb3F8TUZ0VXMnsigUGN3HEK6Th+puvbuflYI4VuGezgeAbgZsqXXwXZ/ARZmWd2SZb/Ky4wodlvs9ZzKwsZp5bWalHAwoTgyJ+T4PBnnSMX4Sg3s5fc9JxUTYA+pNBPhWfA+ZS3iS7HrQ1zlmpzNiCfMRvkImy7fma+wqO2F7TiSokP/IlV+09BoynMgcP8rRiYlffqTG5+fgNTz2AP/FRly08AGUZ7hqjyhsROAbOPcf4cWv9ts/NL/1d+4Qw46VxmaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwoIiJapBZmWJ6U/84cl0pBVa/9KNuveCZvF2ksHtz8=;
 b=ar23NRfd2L3Jwk5wjGXLgSEsAZJQTY07HbbefeQT5mCwNb6AzoMEmWmMVud9sK2vj+mT9uu2knX6eAnsj3LlWpiyZZfliBSxwNs2R/saHH117Mtdv+0ndwOJ4h3I2ymSqpMV5ADXN4YxBjbtoLxg9RwWAzH/OlB9SeFRRJxIyXEOJaC7FKO14Tin83oYxr1q/vJTKHPuEtoMx2pmeH6yWsP9E6vbNUz0CMS2psvOqeYpVmoWvPPnPVXKdK9cZyLaJZN9nL6l60A07fj8+QHPEihCABf4Pz25a/GWeFDleAUd/ld2DBwhxl834ckteSUEv20rFnQ+zChgilFJxM2XDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwoIiJapBZmWJ6U/84cl0pBVa/9KNuveCZvF2ksHtz8=;
 b=L13bce8vh6akSIOeAx4R3Dp7hYtG/9K3cfwbnZEauAlNsEN01ly39O8EoCxlPVc7ag84zgg02YEXxmjuY5jIwBCtUioumnMXU7rAGT7xvzyabC/HwdevTm70BgNtxfT05Vwefucoyg3PloVoKAdlEkkGPbGq+IkWwVUOT2rmmlk=
Received: from MN2PR13CA0017.namprd13.prod.outlook.com (2603:10b6:208:160::30)
 by CH1PPF12253E83C.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::606) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 10 Feb
 2026 17:20:30 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:208:160:cafe::f0) by MN2PR13CA0017.outlook.office365.com
 (2603:10b6:208:160::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 17:20:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Tue, 10 Feb 2026 17:20:29 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 11:20:29 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 10 Feb 2026 11:20:28 -0600
Message-ID: <5eb75298-cf00-329b-a11b-5e689bf0fd86@amd.com>
Date: Tue, 10 Feb 2026 09:20:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] accel/amdxdna: Reduce log noise during process
 termination
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <mamin506@gmail.com>,
 <ogabbay@kernel.org>, <superm1@kernel.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20260210164521.1094274-1-mario.limonciello@amd.com>
 <20260210164521.1094274-3-mario.limonciello@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260210164521.1094274-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|CH1PPF12253E83C:EE_
X-MS-Office365-Filtering-Correlation-Id: 31cb2ab1-2ca2-481d-576f-08de68c8b046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnRDeWV4b2Y1OEJ0djFpanVPOVBvaDN1MFNKeXJCeWdKOUg5V2R5Q3ZGeWhx?=
 =?utf-8?B?R0FiNXBvQXJjdE5kUjJHaGlKUTd2YWVFT2tCTmRqNWZQei9CZ2RoMjdud01Q?=
 =?utf-8?B?WTdubXY1cDZDQnVRL2dYUW12VTRWeVU2NkZNVitRTElyKzEyNThOZTRGQlUz?=
 =?utf-8?B?V21jVUdnc3I2OHFDV0QzSjBQVjduNVNGcEhWRVlLSnA3STRjOWVFZG1tajYv?=
 =?utf-8?B?V01DQVpsSGFmaWZKU29pbExEOVl4bkdjYTBpVDc3cmEyYkZNbXZqNUlRRzZH?=
 =?utf-8?B?c1dQa1NZY2VGb3Yyb0M0WGNTUWJmbEFJeWhMUjNnMjZ6U1dMVEpLWWpOL2FD?=
 =?utf-8?B?TlFKMFlaVlFraTg0S0R4dFFlWjYwNCtMR1RtdEpORnNsbGNienJOdWh2MnRC?=
 =?utf-8?B?QWRvU3dPTlJ5OURERGQzbVZUeTRvRTZtY1JPazJaV3MrQlZvanpadVp4cG1O?=
 =?utf-8?B?d0RSK3VlMnZLSW1VTnpWSmdNTjJLVkxkY1ZoejFkS3RIZEVOOUxZZzdWNnJI?=
 =?utf-8?B?QWxJRjNmNjR3SGlVUFFRd0N6cVVVdTBtT3Y2ZE5ETFJDbTJ0MDVwN2QrcEN0?=
 =?utf-8?B?Vi9tN1Y2YVp3aXBVVkZmenAxOGx2ZmdvNkxpUlpWb1V2b1BNRnlNY1NHTmov?=
 =?utf-8?B?YnlpWTFia0l1U2I2YjZ0NERrWjlsOVlPU0tsclU0VmYycFNGbWIxaHN4TmpB?=
 =?utf-8?B?Z2JVUlkxaitWRlA2NmVEelRZRU85ZWtQdUJWYVE5TjBDV21xR1hlVFFBVm5O?=
 =?utf-8?B?ZTNzL3lrdm90WSsrdWZBUDJnaVJGbDdPTUplaSsrajBVdzBlYzNGalN2Q1Vl?=
 =?utf-8?B?ZjMwcVBTUkZRcjhsV0RDRnRrTWg1WjBTcXg4cVRwcnBVYTFwTEdWaDhnWFpT?=
 =?utf-8?B?T1pIZXNwMnE5UEw4ZXhtdEtJbDYzUy92dWZqd2hublhoVldFdWFPOXF3TUVl?=
 =?utf-8?B?dEZ4U3ErSzRWb3BYSUR6VW1BME04V2cySndJR3dDQVQrT0libVh2UDgvSzRh?=
 =?utf-8?B?RzdUVWtrUEpwYytMbXB0UFNTZHFYREozTllqYWNHVHZxRHJhV3NFbTBCZVJD?=
 =?utf-8?B?WUtwWHpTTWVrVklzOU4zMitkaHdmLy9vZkZoN1JmeGd4bXVpbXVweHlQUzZt?=
 =?utf-8?B?enlKUlIxV3JmRk95b2JKVjIzZGd4VmU0aUVneVdFK0loNkJaMjRTOXYxNnNj?=
 =?utf-8?B?STRPY1E3bEk5N3ZIdmsvaXJwb1hTdWpCOHBrVVVSNlpVK0U5emVlUEdmK0lX?=
 =?utf-8?B?YmcvSDJWNlc1b3ZHQ3NOOG5Xd2s2bENFcW9mTU5vVnRLazQ5WXFtUUdEM29z?=
 =?utf-8?B?WHcwUi9wd0dwQUdPZWNPUkM3dEZyUWQrMVowTExyN2Z0UmJQYjZvRkRveXo1?=
 =?utf-8?B?RlZiYkZGLzZ3cXJvN0VDUWRmaEhwL2IxZHJPVnhtVCtPdjltYW4xcUhSbEs4?=
 =?utf-8?B?bVNhK3I3T283VnJNYnZ3NGdodC9PUzdpQ1BOK3pDV09pMkdyS3dURnhyS2tD?=
 =?utf-8?B?Zm5GQlBBb1hCQzdkWDJvVnIreGhGWG1iZ29WUExFRHRJT3Y1SkxYc05DRUVX?=
 =?utf-8?B?OXdEVHhKTUN1bzhoNFprZ2FjMVJkQ2Y1UnE2TGVaNzBOK1pPWm5iOCtRRjcw?=
 =?utf-8?B?YnB0OUp4bmpvcEd6TXNSMVlnWEZneUc1TWc1NUdSWDRpSEFYQStITzVFRFRo?=
 =?utf-8?B?aG1BcUx2VWhJM2ZRVkZ0alJCeEFqSU1GcGtrSXNQMHhrTk0vT0t6SFJRdmR1?=
 =?utf-8?B?c2U5QmlWcm9XeG9SV2ZVaUdhTzRLemhEaVJFTVJtMCtGaTM2Y3lTbEdKSk41?=
 =?utf-8?B?TDdOdnRNd2k0OHFEemliVVc5MzJnSjhjY2h6OGdiN0lESHNLbGd0a0N1c3Fy?=
 =?utf-8?B?WE1VelpDS0NxQXNFaUdTUDdFRFBRejVBb1ZOdjJpQUJLbVcvNFFRUTZUSE9i?=
 =?utf-8?B?VG52ZVFaVnF5SDYzWkxCTTcrZTlyV3BoVDFwc1VRWWRzM3RQWmV5T0hRb09r?=
 =?utf-8?B?alFFalpIcnlPYTBwVDM0Q1RuWFM4dTI5UFlwZENlSldqL1Z4c255cWlRNHpW?=
 =?utf-8?B?K2ZDUmZWeUtmVk9LSWxKL05JL3JWcTBtVUw5S1g4RUthY25DRlFJS2lDQVFa?=
 =?utf-8?B?cTJRcy9SUG5RQmMxRmFnVlpObmdCMnpDVlFJbWRBV2grNE5QWlgySTl6WkFL?=
 =?utf-8?B?ZmpCRCswRjJGYnI0dTJhQTBHSXpkREQ5SjNJMnp3ZkQrSGJsS0haS2wxR1Jo?=
 =?utf-8?B?SHdWNmJwREZkM1NJVk5SMzluUWd3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LGc2mxnggQ4aLImpDXb+Yl5s+/dmDX/rW/bpSq1sJZ/+qI9kxHPd1dcHu426u5HryfYUAsJAzS+BhMmkcQ+GhW57hWGDbp9gUTLKZn9olWMj8bKaFI40VMY5Eu7qO1l+uwq42cNgxtxNPY7+YmCq6HWjjZmJhntLHEKfhOqVykgqruUyiRg7TChDs2VhdnPW6l1gnJNib/GO2B5SCCA1kLZ+G4C/7nz8SSqb3cdhw+2hzb4wl1dEDJp0QrJS9pUw82llyW9HchcVwxfhuBB6DH/e8A/A949u5cCOwrOlKZYTRXLGFfX2SgRiF2rfgy70g95gHB6xXtxN4TRnRrp+q/yQViFV3bW+O13kl41k1pNX9TDUa78To0D/sfNqQfkNNOJ1enX8xuObRixxy4+7dLP5CYvlWpEZDN0fPTLTAmXNMHjJ0M4EpVUegP54MFrD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:20:29.2919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cb2ab1-2ca2-481d-576f-08de68c8b046
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF12253E83C
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:mamin506@gmail.com,m:ogabbay@kernel.org,m:superm1@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,kernel.org];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A519911DD05
X-Rspamd-Action: no action


On 2/10/26 08:42, Mario Limonciello wrote:
> During process termination, several error messages are logged that are
> not actual errors but expected conditions when a process is killed or
> interrupted. This creates unnecessary noise in the kernel log.
>
> The specific scenarios are:
>
> 1. HMM invalidation returns -ERESTARTSYS when the wait is interrupted by
>     a signal during process cleanup. This is expected when a process is
>     being terminated and should not be logged as an error.
>
> 2. Context destruction returns -ENODEV when the firmware or device has
>     already stopped, which commonly occurs during cleanup if the device
>     was already torn down. This is also an expected condition during
>     orderly shutdown.
>
> Downgrade these expected error conditions from error level to debug level
> to reduce log noise while still keeping genuine errors visible.
>
> Fixes: 97f27573837e ("accel/amdxdna: Fix potential NULL pointer dereference in context cleanup")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c     | 6 ++++--
>   drivers/accel/amdxdna/aie2_message.c | 4 +++-
>   2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 37d05f2e986f9..79f6316655e73 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -497,7 +497,7 @@ static void aie2_release_resource(struct amdxdna_hwctx *hwctx)
>   
>   	if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY)) {
>   		ret = aie2_destroy_context(xdna->dev_handle, hwctx);
> -		if (ret)
> +		if (ret && ret != -ENODEV)
>   			XDNA_ERR(xdna, "Destroy temporal only context failed, ret %d", ret);
>   	} else {
>   		ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
> @@ -1070,6 +1070,8 @@ void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo,
>   
>   	ret = dma_resv_wait_timeout(gobj->resv, DMA_RESV_USAGE_BOOKKEEP,
>   				    true, MAX_SCHEDULE_TIMEOUT);
> -	if (!ret || ret == -ERESTARTSYS)
> +	if (!ret)
>   		XDNA_ERR(xdna, "Failed to wait for bo, ret %ld", ret);
> +	else if (ret == -ERESTARTSYS)
> +		XDNA_DBG(xdna, "Wait for bo interrupted by signal");
>   }
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 77e3cdf18658b..5697c0c2dd43f 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -216,8 +216,10 @@ static int aie2_destroy_context_req(struct amdxdna_dev_hdl *ndev, u32 id)
>   
>   	req.context_id = id;
>   	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
> -	if (ret)
> +	if (ret && ret != -ENODEV)
>   		XDNA_WARN(xdna, "Destroy context failed, ret %d", ret);Reviewed-by:
> +	else if (ret == -ENODEV)
> +		XDNA_DBG(xdna, "Destroy context: device already stopped");
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   
>   	return ret;
>   }
