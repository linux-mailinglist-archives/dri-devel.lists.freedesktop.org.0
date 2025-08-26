Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21906B37057
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 18:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD9810E6AD;
	Tue, 26 Aug 2025 16:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fkFzE2zA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2054.outbound.protection.outlook.com [40.107.102.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8B310E392
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 16:31:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZuxKu9nbPKu8ULBt5Edwr9Gp+g/GOqlowYPTXYZxyg4iPopbSB2aA/8eENWuYjZDLh3l5J6Qhan/pOKvF9DlIOKwdryEtF5Bb0cErfuhcavPfNPi5DyHbJZ+rsbPWW+/tUMZbjTQ/ESUzujZkxmv6aspHH6SsNS3C2F5ltDNKbGae8SlyuwcbkuIz7T3b+UAZIoie6sKI2fnilfI+6zXj5irISDV06UZcmE5KXDct1a6CflcEsuWpk/wWspxYkWRlrvy23sBiHtkIsKVBj5XdW4aJHbEodNtu0WE54j0fewI0MZVQZXn7+sCkg4hzO5mSfNRfLjYw1y+OVEv3V4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoLcZ85CVgxC4WUCDdFn4w57/GiWc3k/JuCE9jdfCjs=;
 b=RL1xmcq8C2/9bhokGpFGC/CkUAJ/FnvRVu8LTBSs61lYmR1DH8aL4+T0o/6y4GTl3jqKTcXRYCPkcT5UJYvwA06t9LEJwkQQYPF7ohAMCyTVpzc9skfdSj2i6AT8yCGLXUTQam/QSfoCRJdxP0eXjJfojudpNh5eSmOO7AlbZ+mJuiXM7atdnP7tkHskBbOmtV63LTLRatCh8OVekNx+IO/h5CK2Y4Vm5mEzVWQxbcgzdF5xBsEwOQ7ARfOB2t1fCo5x+nw1ITSxUobyOnujuRXW9ke4I2MeHwOGhSLTRH7HfAlY6iYG+s1zHpLQfSsy6luUQEhnEA6JVhd0XX1Mzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vivo.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoLcZ85CVgxC4WUCDdFn4w57/GiWc3k/JuCE9jdfCjs=;
 b=fkFzE2zAXxvbETIAg5lBT/f5fliHayJAUGKUZjrxnGwVrDMP3qdzouOEbDPNhusOMJfBdr0RMc/ZLnm4oOhFLpXNxp6aI9iftQfGkOA3LA6DTr9DZCRIjw8I0uW7yH5XsiRc9/zGF31okb8oddFwtZzLIdWD9lrFcmlbcZEncns=
Received: from BN9PR03CA0671.namprd03.prod.outlook.com (2603:10b6:408:10e::16)
 by IA1PR12MB7519.namprd12.prod.outlook.com (2603:10b6:208:418::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 16:31:29 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::e7) by BN9PR03CA0671.outlook.office365.com
 (2603:10b6:408:10e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 16:31:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 16:31:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 11:31:28 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 11:31:28 -0500
Message-ID: <51440ea7-bbea-c890-057e-109685a72cb3@amd.com>
Date: Tue, 26 Aug 2025 09:31:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Use int instead of u32 to store error codes
Content-Language: en-US
To: Qianfeng Rong <rongqianfeng@vivo.com>, Min Ma <min.ma@amd.com>, Oded
 Gabbay <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20250826072917.186638-1-rongqianfeng@vivo.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250826072917.186638-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|IA1PR12MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b96ddc2-d7ca-4a7c-d809-08dde4be0262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cG1rRm1OSVJzZC9md3lHQ3ltN2tJOURCM1ZCQWp6aWZJcDJUMVIvcWhLN1VD?=
 =?utf-8?B?VzEyUEZjeHJnU3lEbDVVRWJCUTBHVVE1dHdJaUxoSWx1Y0ZBMGp0SStZQTRh?=
 =?utf-8?B?bVdUdEUrdUJYWlJPNG9BdDBTYUlFbkxDSCtmRDcxeVFpOXlzTFVkeHZFNE1j?=
 =?utf-8?B?VnUvMGFDOVZ1NTZaZ1U2TjllcWZRb1VxNlRaUGdqTHBaKy9FUnpHSWcvTHE0?=
 =?utf-8?B?R3ZUSDZhNWo3N1VLTE1OT01QZ0s3RU8vdy9BR0NYLzF3MXM0RE1yQktqNDJr?=
 =?utf-8?B?a0t3amJBSzNZeXpJVGh3QUh2dmtmVjVRT3piYm1LZ1VOMDU5L3RZa2VHVys0?=
 =?utf-8?B?djVyaW4yYUIweTJsYnFHbmNhSFZVVy9ncEtEcVdMbHkxK3UxQ0FzYWpEYmkr?=
 =?utf-8?B?UnNzWVRiVllUaDJ6dGZYeU1sSU5RYkNSaVJVOC9pTnp0ZW9RemkzTEdEdE1p?=
 =?utf-8?B?eWVpNUpjMkpoaEZwdFhReHlpVWRrKzUwRVJaQTVzamlWMmkwSnBpQ1phNitz?=
 =?utf-8?B?Um5zajk3MWlGZ3l0amNSSmNNVDRxZDBLeEZBR3UxTGRhdXR1L2JPVEdVQnNZ?=
 =?utf-8?B?N3JVUEVRQmE5MjNWTGYwQ2VjL2dPZGwrdDZVcTMvTXMwRmZnSkd6VzVBWXpw?=
 =?utf-8?B?UE5tSWtoVmdGUVdHNzAxTmpXTTYxR0gvYjNsbjFWWk5YT0pJQ1MrdSs3SFFT?=
 =?utf-8?B?OHAwYUtKRzNhMnkrOEFFQmN5bGhwanpyRHJxVDFSY0RKQ3docTRRbG1KWlVh?=
 =?utf-8?B?VE93K2g1aDZEczlyR3EzSFZXZ3hvQXFpdXcyMFpvc0ZObm1reXNxMUNtenhG?=
 =?utf-8?B?RjBwR0RUdVBGeUgxdmswWVhKdU1EM2RaRklMMlJLOXFOT2xvTS9DNTFVbEpu?=
 =?utf-8?B?Z3V6cGsrZHdkaGdEVWtNTDZzTlNMaXJWcFRTd1RHcTNIUVZmcTVzc1g1WW94?=
 =?utf-8?B?YStlWFBzSXhkdU5xTVV5aVBzVDU4Y25ZeVFJV2h3SW9jSFhGd2hhTXE5ZGZa?=
 =?utf-8?B?d3gxbnkvT3R6RjJRMzhuS3R2RzFEVUFPa1NDTVUyd0xoU0lIV2VEK2YvbEdo?=
 =?utf-8?B?Q094OUJHY1QxamoyeUFuQm9zOWM2YmJGUmVpWWR1SkNlOU1TdHltWnhSS1lx?=
 =?utf-8?B?aXBoWDI4RmxyeUQ2am1ObEZSeFAzNlpGOS9EUkh0M0k0S3YzbDE1TUZ1T0xD?=
 =?utf-8?B?b0ZNakIvQzhETkdpWVpWOVVRZEkzLzFwVzg3K3hoSmZhY2RYcVpYYU5UalF3?=
 =?utf-8?B?b1JwMUkzcFJENGpidGovTXZYSzlTRG5xTjBEcjFxZWNZOStsc2owSlZDSldk?=
 =?utf-8?B?bnZ4d0RCd3JQVDVDVWp2a2JGWUxvNGhhcVNyZFVzWnVUb1RvRy9JVUxKVHBa?=
 =?utf-8?B?OWRxekNWcmU2Z3lTenV3dWthbGE2ZjFabldENC9ZcmpBWmVoYVZWVzd6cFQx?=
 =?utf-8?B?cDh3ZnJYQUFVMGdKeG83SEh0VXBpYzNLbnhjTVM1dWF0bUhuNHo3VFJuRllD?=
 =?utf-8?B?dmdRaU5VMFZWaUlLVEkwME4vd1BPZVdMMUdwVGxGWmtxKzljekJHZXU0OGY5?=
 =?utf-8?B?c0ZBWVlJQzhLTzdiOGMvSTBCZXYvNlArdHFldW1RdVY2QUlpV1JnUlROVk10?=
 =?utf-8?B?VThkdzRhc3FqVjhOVk9hOCtTeXpEd1piWVBETVVDVUFDNWgzUG9QR0lEWTRB?=
 =?utf-8?B?WkdCY1NaTktndlZmcVhyamZpZ3hxLzMxZ0FGL3c2Z21LYzh2Wm5Hb3o3Z3Rl?=
 =?utf-8?B?Smh6Tk1DcTZzOElhazMwM1M2MDBMS1pJa0d3eHRkZHdzdzMwaElEOTU3dXlq?=
 =?utf-8?B?WmtOZzJUWU9od3dneGJnSjJXaVFaMzdURHdPS0FQWEUxeVk4aWxmWlpJUzNu?=
 =?utf-8?B?T0tXb1ljK3Y4enEvZ0drdStSNmVGWU4wWjlsd3pQc0lMYk1OWkl6dFNoc0dl?=
 =?utf-8?B?aEllYjh1UTJ2VFI3QjhtK1lhRnB4YVhGNkFYbU51b3VIZXdjeG0zcUI0WkVR?=
 =?utf-8?B?V09xcE1CTEdqbGlIdFE1UXZ1K2lkL002Z1YxRTRIQnJRM3F2Ylh1cllEV3NZ?=
 =?utf-8?Q?qQR/XY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 16:31:29.0987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b96ddc2-d7ca-4a7c-d809-08dde4be0262
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7519
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


On 8/26/25 00:29, Qianfeng Rong wrote:
> Change the 'ret' variable from u32 to int to store -EINVAL, reducing
> potential risks such as incorrect results when comparing 'ret' with
> error codes.

Sounds this fixes code issue. Could you add "Fixes" tag?

Thanks,

Lizhi

> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
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
