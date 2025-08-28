Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F65EB3AB94
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7554210EAD4;
	Thu, 28 Aug 2025 20:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EcvQK6Vf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D98C10EAD0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 20:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTr5JDtU/foYilXT+y/f5fPVJJJQBoWM6pvsJaI2pwFTToiZOSVraN4X7wra4k9kcmMwowg+CRboHfnQP9HVPgcH9rUAhZLw1o8fix7KvoLWFSwSVfBz795mt+HyUxpSsJh2I/sBouhqSs9/dAXO4gO8vr0WIceMqxYUy69YNA6R1f336k8+Mqudk+T+qSxEyuLjseKEiZ41uMDFxzomvECshAToW1VUOYbPiyTEWuaBuigkm9PXDeLWOdPolTMVZT6LXmjZNzCen3/GSxZl++g9jQQa40aqmbfjov4MxSbnpe4xApsySpW8CATxUsvG1zfB2xNajGkvZ1EVsH8nrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyO/+dxyKLqkfIlSNOLPRsa5hBckbsD2pxGeH7wxZLs=;
 b=wM2o2k4/5V1QVewnCSXbiHx+XEkez3uvyfRhAVYS8jrWBbLMES/ylo8Io2g/tMhlakOPvqak6p4IjqXiI/HJwEBLywuO4BaPDAXohokxWHXTnkGSxKNcg3ElXxUiyFo36WIXHNwA/0XmEwunCB04KV4PuFOMWdU5zrSLixpG0/f/KVadelBMV62bWDRHS+m5NhiHG8IAsaF0fgoEuV2Ji0Ha5ZJJ1JQoftHQPbA5OgBtpLvfNyhalCVRr1V0D7elTRtAEArLK/n8Z3EhoEoOgZ3EGjgFJ2ZZteMb60Zb99G30gp3YwpVcElS6K0rWFm6YWZ24glQIBpSclpSqfIIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vivo.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyO/+dxyKLqkfIlSNOLPRsa5hBckbsD2pxGeH7wxZLs=;
 b=EcvQK6VfnI5qqDgnzLekXSivF2vVCTRK+fL5nN46n0qnEvPZpymcH3uS0401VlA4Err1Dr1e8a+RXsFpZfIMJ39wnn8xiRE9XIqCtB9sWIbPyOxK6UyXm1gwqf/cJ8EfOfEugVLUyiqC+9lJ0bJUMUEsIj7hXkxrFCTrkAg+JSk=
Received: from DS7PR06CA0010.namprd06.prod.outlook.com (2603:10b6:8:2a::17) by
 DS7PR12MB5717.namprd12.prod.outlook.com (2603:10b6:8:70::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Thu, 28 Aug 2025 20:23:47 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::49) by DS7PR06CA0010.outlook.office365.com
 (2603:10b6:8:2a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.19 via Frontend Transport; Thu,
 28 Aug 2025 20:23:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 20:23:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 15:23:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 15:23:46 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Aug 2025 15:23:45 -0500
Message-ID: <9c722376-da4f-c09e-3aac-1a06091791c0@amd.com>
Date: Thu, 28 Aug 2025 13:23:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] accel/amdxdna: Use int instead of u32 to store error
 codes
Content-Language: en-US
To: Qianfeng Rong <rongqianfeng@vivo.com>, Min Ma <min.ma@amd.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250828033917.113364-1-rongqianfeng@vivo.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250828033917.113364-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|DS7PR12MB5717:EE_
X-MS-Office365-Filtering-Correlation-Id: 20032841-763a-4cf1-0142-08dde670cac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0NOTmpHVWRPRlJzeWFpdHVUUUwreUw1QlFkazNVS2JocGNCMHl2VER4bU9w?=
 =?utf-8?B?ZGFZdlcrdFBzL3R4S3IyR2QySFNjZm9vdDNlQjA3S0dReGp2dVpZZktTaFZv?=
 =?utf-8?B?WDcyNmZCR1pSMkpHUm9MSGR5clpGRm5kcXhLeEc5RE5FOTN0c3NlMFQrM2FJ?=
 =?utf-8?B?Um1nUk43Zjkrc2ljZzNRMVp5VkhXUWM3QXQzbnNBOVlMQkJEelNwTEE0dU5C?=
 =?utf-8?B?dk1GMXdWQStBei9rZFJqL0xaR1NjeGxMVGo4RlNub3VSTEM4M2FudmprejFt?=
 =?utf-8?B?WEtrTlgyNEFmbEx3Tlo4TXFKOHNRU2lxVldvMm1DclVJUUZ6V0RsZkhxT3lP?=
 =?utf-8?B?YUhaSzRpUGxqTlFYN0kwTy9ueUVrTEJYeTVhWXpzZk5XaHN1OWFreTNrWldx?=
 =?utf-8?B?YVVDTGF3VU9weE5xMDlWNVdWWENGZ1VORlEwWU9rRDBuM29jdExST0FkaElt?=
 =?utf-8?B?RXY2L21uYTdzMFg2TnZjalkrbGhvcncvaXV6K2taNVMyT0pPZVdFb3ltRXlj?=
 =?utf-8?B?TzNLbTQ1eTd3WW5ZMVBIK0NUbk1zOVJreXlGUDZCUWtMRWYwZjltb1BkSHBM?=
 =?utf-8?B?RlRneFY3N3dacUMwZldNQ2VTOW54VHc1enFiOEhwWUhGWXE3MEt4a2x5enVF?=
 =?utf-8?B?Y20vUDg5WjY5M0VjRkUyQW9SWFovUVR4ekpoSVBzYkRHR3VqS21JdWNXMzdN?=
 =?utf-8?B?bGZNWmp0ZUlNZGxJS3prUk1VZTdkTkN3RVlzYjNKMFM5dHFKZTQ2SVBnd1lO?=
 =?utf-8?B?OUdIZHNVZHlOOUwydnhJYXNzOEdsNU9rMVVpQTJ6ZEJmSVFDN2JiMkJMNVkv?=
 =?utf-8?B?dHhUTUZ2d2pDZVVKSFZET1V2QVhwU3l4NENVaW1xcFdIVERvQ3pybjNhbEVy?=
 =?utf-8?B?dWJvWmVIYUtyakN5Q3R1bjZGR3QwRUpRSTBZKzNpbHoxMkhUZWd0ZlNDajBk?=
 =?utf-8?B?bEoxRGRLdGt0RTRUVTZIY2dEdUVSNmhmbVFId3lMb3JULytjK1FETWZBV2J6?=
 =?utf-8?B?ZGEyQ2g5OUZvbUpOandiYlFXV0Fza0txSGZLV1BrVkFCTmk1bWV0elQ4YXdB?=
 =?utf-8?B?NXM3aUFEV1VLTWZ5bEVZa3NjWWx3VlV0WGM2ZUxMNVBjemw0Q2N5b3ZMeVE1?=
 =?utf-8?B?cnEwU0F3NFJtd2V5WHRBZC9rajRZdm5XeGJQRkNTdTZFR1E1cVNscCt6Q0hB?=
 =?utf-8?B?NnZZM25lcldNZS9vR29HN1hkVWh5TXFnYjF5UklJemZkZkpOcGxHazlhWE1C?=
 =?utf-8?B?YWNQZ3ZSb0FnTXRtNEZ3RkF4Q3I4UVBWZWFSdVBET0pDSEdrb0VFWEs3bzY3?=
 =?utf-8?B?VCt1QlF2aUtJUmVCNktMak5WRnAya3MvQ2FwYXJ3NHhDWE12cDBSQzEvWExS?=
 =?utf-8?B?amdjLy9QVjVzZGhOUlllZmpxek9TTTU1am5KbVRsMGdXdzBJMFU3dGhUVWRI?=
 =?utf-8?B?cmNpVmxKVVBJTXVvYlNlQWhyMHNJTG56U011N1R1WjJMZThzb0MvaFlqZWhU?=
 =?utf-8?B?eUxmd0M3RDg0TUYyem4yTEFjeUJhZWlrMzlBaFhVV1hsb3lnRTFFbFUxY2V2?=
 =?utf-8?B?Q1lSNFpUSXZRSlFlS00wVmppT0JENExJSElUU1FKUlhhSUFOVVI3aFBjNFZr?=
 =?utf-8?B?ZnNwbnhwTUtLLzh0T2lkeWJHOHdoSlZ4NDZiaGh4V0VFai9jM2RLd2xpU2dN?=
 =?utf-8?B?bkd2ckJQL052bVhGRVJLKzNTQ2t5OHFaUGk3TWJ0clRIRVBoUWRlQnRsc0Z6?=
 =?utf-8?B?TVZIcjJFRFkvLzNKR1M4Q3FWYW9QblBRY0V0YllEVHUwT1NBRFVzcVhSdzJo?=
 =?utf-8?B?M1h0a3lGdHJNMFdLeHB1Z3FXT2hKWnlveXBPV0U4QUtaL1BLa0tMdm4zcys0?=
 =?utf-8?B?RmJWQnNJN1h4MGhhTyt4bHAvRStjV09KTDZCdlZCRDhHSklRcXBJcHkyZmFE?=
 =?utf-8?B?WFpDZ1JId2ZaeVlXR3RjWUx0QzFIVG1wNytiVSs1YzlBT2ltOGZaYW5LMDJt?=
 =?utf-8?B?L0x5ZHdHdVJLMmxOR2ZEcWlQSExXWGREUElwanlzanA2eGhvUit0dG5pSDNW?=
 =?utf-8?Q?OqVfLw?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 20:23:46.8357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20032841-763a-4cf1-0142-08dde670cac7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5717
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

On 8/27/25 20:39, Qianfeng Rong wrote:
> Change the 'ret' variable from u32 to int to store -EINVAL.  Storing the
> negative error codes in unsigned type, doesn't cause an issue at runtime
> but it's ugly as pants.
>
> Additionally, assigning -EINVAL to u32 ret (i.e., u32 ret = -EINVAL) may
> trigger a GCC warning when the -Wsign-conversion flag is enabled.
>
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
> v2: Modified commit message and add a fixes tag as suggested by Lizhi.
> ---
>   drivers/accel/amdxdna/aie2_ctx.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 420467a5325c..e9f9b1fa5dc1 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -199,7 +199,7 @@ aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
>   {
>   	struct amdxdna_sched_job *job = handle;
>   	struct amdxdna_gem_obj *cmd_abo;
> -	u32 ret = 0;
> +	int ret = 0;
>   	u32 status;
>   
>   	cmd_abo = job->cmd_bo;
> @@ -229,7 +229,7 @@ static int
>   aie2_sched_nocmd_resp_handler(void *handle, void __iomem *data, size_t size)
>   {
>   	struct amdxdna_sched_job *job = handle;
> -	u32 ret = 0;
> +	int ret = 0;
>   	u32 status;
>   
>   	if (unlikely(!data))
> @@ -257,7 +257,7 @@ aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
>   	u32 fail_cmd_status;
>   	u32 fail_cmd_idx;
>   	u32 cmd_status;
> -	u32 ret = 0;
> +	int ret = 0;
>   
>   	cmd_abo = job->cmd_bo;
>   	if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
