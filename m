Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237439D2FFA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 22:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F34D10E36E;
	Tue, 19 Nov 2024 21:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RgjkArno";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2083.outbound.protection.outlook.com [40.107.95.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BB810E36E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 21:22:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6i2VlWjpJHjmisWUUgxy11JdRNBnI0sz1KtB/hxkUhE7uuuKepQ7e655E9rWS7+yjpR/ZATQqzGBCLPqfOiTcmDjiZPJjKCs4qPq3sFxGIgfXkUj3NSsOjyTqV8DI8LmPwCBd1K5DiObHkIJfPfG88oakj+s4tfEbMX+uEJ7cNjKO8D15d0mtU9OVFD6juL20Z0712PQLeQgZ9e3NbZzfYUqyQ7JLxvQOSqRKYRGzbkZiNas0rRppib6Bc2HZK1em9zykMWuJoHdwD0vxES2S4xY3Slq1nW1vzvqAEeFAHjoNImeSAUOCPjvQ42WDWdWhd5M1g1AnTTAPp+LVykpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRajCOYdkiJsAudjMCknnKrRCvhOHWKWu02DA++PGaY=;
 b=vQBG7aQnTfEDN5lBMoRTeevQuJPIpNS2tMz15hi2HwWuYsiZH2mRAJDHXP8XgSWxdoqd9aLLmCrjEwHrP2/H6ltUo68uudTw85afLSFJjZo4wlOymn/biSjJLMg71PX7WJEXkZ1txxt9iIAhVmkd45PAXF1vfapVQk4yC9NoXiQmQKZtqvVLkOVZzod+aww3RIKbzRYgNOBbvKXOftcN9UPvLPk6HwwvdTC+h/tnh9q0BNcSIRo6uEHtUt0PFr39ss+KsGa/CtFWfGe50/8quhBSPNF9X8W8Cn24vodkoitUTIbR2h55r7iXN4uyHQodv1idfd1d+Qem+MgrqqW+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRajCOYdkiJsAudjMCknnKrRCvhOHWKWu02DA++PGaY=;
 b=RgjkArno7K2VmE4xEQpCHPGWOsT898leJQ/qdKm7vFJVirkd0i1JrgryfgzVkLD5L+fdV7bAt6ZgKBz9zdn/u1TVwyPx71Q2tuIteut2wlAkCJ4f+fpV5OVhjZJigANbUJ4yAmsEUNeTQBeaFE6NAKszWGzzbOA9iX0/D+GOyqkXIv1G25jwn5V4Hyz4V9JbgUSvO0gEwninsbnpkiC5w6gjRS7ON8Ha9Kdo9kW3VWrSZJvAHWQO8IkBwABiHxQKCE98Qx9ibQbk8oYE4NsRug9C+BGQbX0UlI9noNZ/on1mhi6P+19HNwYM+gpzeUjZD9JfG1WjifDzbm1d9mAHrA==
Received: from SA9PR13CA0124.namprd13.prod.outlook.com (2603:10b6:806:27::9)
 by PH7PR12MB7453.namprd12.prod.outlook.com (2603:10b6:510:20a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 21:21:58 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:27:cafe::c8) by SA9PR13CA0124.outlook.office365.com
 (2603:10b6:806:27::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.12 via Frontend
 Transport; Tue, 19 Nov 2024 21:21:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 21:21:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 19 Nov
 2024 13:21:42 -0800
Received: from [172.20.206.173] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 19 Nov
 2024 13:21:41 -0800
Message-ID: <a0cc3359-bcc2-43f3-8798-80f0d22df9ab@nvidia.com>
Date: Wed, 20 Nov 2024 07:21:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] nouveau/dp: handle retries for AUX CH transfers with
 GSP.
To: <dri-devel@lists.freedesktop.org>
References: <20241111034126.2028401-1-airlied@gmail.com>
 <20241111034126.2028401-2-airlied@gmail.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20241111034126.2028401-2-airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|PH7PR12MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 70542937-feb1-43dd-3648-08dd08e03366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlZrczRuL1U0cnhBTHJrMWttM3VNMFRmckNUUWV0anFvOFlRMk5oZGFWNE02?=
 =?utf-8?B?RFEzU1pBZ0tTWmlLczE2UDFjc1Q4UTlVUlFKN1lvRGdZYjlhdjJWQUNieXI2?=
 =?utf-8?B?bkZiMDdkQkRUTVBodzcrQkFmRm9vSkZVK3BQQnUzYm9XdG9ENHIwbFhnUWtS?=
 =?utf-8?B?MTBidlhnUURTaXVQbm5PL00wLy9la1h6Z2N0eTJOcGNCYzJ1RGZLVFdWbEpi?=
 =?utf-8?B?d1UwQS9IdHdEcnFkU0hIK1ZSbkpzcUgzajRjSTZNdmJ3NHk0UlhESnM3SThQ?=
 =?utf-8?B?NFozbWZPSmVhVUFxcnpiN0lZaVVMM2NEUlBQdFhHTWJEMkJ1N3A5ajN2OUc3?=
 =?utf-8?B?SjJZcFNiWWxwRGlmZlNJTVJDU09TVnUrUzBRRlM4SEFjZHU1akF1Z1RLazRO?=
 =?utf-8?B?TzdObmlTaXNvLzdpYXU2NU1DbE1pK1NReUVOQnQreEdMaEdiUERCM3NhNVpt?=
 =?utf-8?B?VXJsZ1FLOHN1Z25XS29aekYzVjRFQTh1Q3FKR3VaeHJKSVZlQVV4RHZQRWFF?=
 =?utf-8?B?SVc5bGp0OGNObmdINVBnUzNsYXBSTnpXOHl5SDNJUncrL1J0LzJGWnV5ZFhy?=
 =?utf-8?B?YjQxUW5VR1dudnRGQlI5bWJLb29FY0wwNU1SaUtjcUZxNE1uRGUxYTUyOWw2?=
 =?utf-8?B?aHFiR2RMeHk3TXhaYnJFOGk2dlJrY05jQnhYY1U0MnZUbVg1ZmVjc2JYa2Zz?=
 =?utf-8?B?ZzloM1UzMmtzV3I0L01pVTN0blJZNlhoOFpTSkxwbU1ZY3RrWWlPeXpBZE5y?=
 =?utf-8?B?OSszUmo1cmF0TkU0RFlldjRYVnh1Wk43d2RseGZESHdEZ2xJa0xsSld3a1BK?=
 =?utf-8?B?MHlLMWRTTkx5Ym8rR0EzRWdXbHJvM21aNG9yYXR5elZGc1ZHcXA0QXRNZ2s2?=
 =?utf-8?B?dmJjTkZEWVliMGFpNkordVkwNjhXQnB2blpKelBkMW5jWno0L3J6b2Z4eGI5?=
 =?utf-8?B?VU5lZ2wzSG8vc2J6L291RkZsSXNDVlNEdE5XMk9FMzFmVnZKdWhnVjRlKzA0?=
 =?utf-8?B?THZVUjVmYVBtL3JGazZWaWtHTzZ3aUVieGtyWHZyRnNFQ0ZNRXNGekszK1l3?=
 =?utf-8?B?bmRXdVRQRHFTNFd3bDhyVXN4dXZVNHV0eG5ackJtQmRPV0RzTUt3OGpBdVl1?=
 =?utf-8?B?WEg5SDZiUXRXNThGbmNWc2UvWHkzQnYxK2M2MGNDVFk5cGFZcG9aa2JyQU9K?=
 =?utf-8?B?dUx2NDlxQVNTTlFQU3dlUHNBOXFSZzhkQmFSdWVFU0s0ajRLYi9TTnlZYXp4?=
 =?utf-8?B?dHUyT1NzUjBJRW9QRm12Vm96cmRCMkNQenZHZ1g4QnRIbytFQ1k3dFVBMWt5?=
 =?utf-8?B?QUlVY2lJekdLV0djeVF4a0ZYYlI1QW9NWmZmM1NmR0M0WDJtdVRTK0NldWho?=
 =?utf-8?B?WURUQTNvYWxjZDFVTkFIUjkxSk80a2RwdXpnZ042QmZWNjBpMFlwRy9qbXZQ?=
 =?utf-8?B?TmtnSC80dnNSdTRUU1IrRE8zUDA1Qm41Wm9VZUwzMGY0SkxDMVJCWVIydVVL?=
 =?utf-8?B?S2ZBRi8wdXBEbnVEQjdwVHBBeTE0MTBzVk5kSnR4UXV0WXNPOUxuRDQyaHB5?=
 =?utf-8?B?NEFOUkp2MXd5N3pxUVNnWUhKTXI2eCszM0ZOM1dzblVxcndqNDBUY3cvNno4?=
 =?utf-8?B?WVBRd2NucXFYdEtweS9SbmtSRkl2Q0VLNFlVeHdDcUNkOWh4RlNIeXo0OXBN?=
 =?utf-8?B?cm5GMTJFRHhmQ29vUitaa1hKd1JNWkNBaEJzdk9hSzFleWZFTzZ4QXJPUlNB?=
 =?utf-8?B?dUlUeUJCUVZsWUo1RUVlOHc0Y2x3b3RVWlZCRXJIaSs3Nzc3NUkwSUF3dEl6?=
 =?utf-8?B?Q2hJTm93WGNhQ0NDRFRVRWdNZUlKeDJScVdvYTJuNmg5dmx5bWVtS3FucjNO?=
 =?utf-8?B?d1ZOZE1GOEV4REJEak9FMytRNU02UnVYc0NyUlNSdVVzbkE9PQ==?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 21:21:58.3105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70542937-feb1-43dd-3648-08dd08e03366
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7453
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

On 11/11/24 13:41, Dave Airlie wrote:

> From: Dave Airlie <airlied@redhat.com>
>
> eb284f4b3781 drm/nouveau/dp: Honor GSP link training retry timeouts
>
> tried to fix a problem with panel retires, however it appears
> the auxch also needs the same treatment, so add the same retry
> wrapper around it.
>
> This fixes some eDP panels after a suspend/resume cycle.

This works fine on my laptop (though it doesn't fix the issues I see 
there unfortunately).

The handling of -EAGAIN can be removed here too, but aside from that:

Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>

>
> Fixes: eb284f4b3781 ("drm/nouveau/dp: Honor GSP link training retry timeouts")
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   .../gpu/drm/nouveau/nvkm/engine/disp/r535.c   | 57 +++++++++++--------
>   1 file changed, 34 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> index 8f9aa3463c3c..99110ab2f44d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> @@ -1060,33 +1060,44 @@ r535_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u32 addr, u8 *data, u8 *psize)
>   	NV0073_CTRL_DP_AUXCH_CTRL_PARAMS *ctrl;
>   	u8 size = *psize;
>   	int ret;
> +	int retries;
>   
> -	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom, NV0073_CTRL_CMD_DP_AUXCH_CTRL, sizeof(*ctrl));
> -	if (IS_ERR(ctrl))
> -		return PTR_ERR(ctrl);
> +	for (retries = 0; retries < 3; ++retries) {
> +		ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom, NV0073_CTRL_CMD_DP_AUXCH_CTRL, sizeof(*ctrl));
> +		if (IS_ERR(ctrl))
> +			return PTR_ERR(ctrl);
>   
> -	ctrl->subDeviceInstance = 0;
> -	ctrl->displayId = BIT(outp->index);
> -	ctrl->bAddrOnly = !size;
> -	ctrl->cmd = type;
> -	if (ctrl->bAddrOnly) {
> -		ctrl->cmd = NVDEF_SET(ctrl->cmd, NV0073_CTRL, DP_AUXCH_CMD, REQ_TYPE, WRITE);
> -		ctrl->cmd = NVDEF_SET(ctrl->cmd, NV0073_CTRL, DP_AUXCH_CMD,  I2C_MOT, FALSE);
> -	}
> -	ctrl->addr = addr;
> -	ctrl->size = !ctrl->bAddrOnly ? (size - 1) : 0;
> -	memcpy(ctrl->data, data, size);
> +		ctrl->subDeviceInstance = 0;
> +		ctrl->displayId = BIT(outp->index);
> +		ctrl->bAddrOnly = !size;
> +		ctrl->cmd = type;
> +		if (ctrl->bAddrOnly) {
> +			ctrl->cmd = NVDEF_SET(ctrl->cmd, NV0073_CTRL, DP_AUXCH_CMD, REQ_TYPE, WRITE);
> +			ctrl->cmd = NVDEF_SET(ctrl->cmd, NV0073_CTRL, DP_AUXCH_CMD,  I2C_MOT, FALSE);
> +		}
> +		ctrl->addr = addr;
> +		ctrl->size = !ctrl->bAddrOnly ? (size - 1) : 0;
> +		memcpy(ctrl->data, data, size);
>   
> -	ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
> -	if (ret) {
> -		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
> -		return ret;
> +		ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
> +		if ((ret == -EAGAIN || ret == -EBUSY) && ctrl->retryTimeMs) {
> +			/*
> +			 * Device (likely an eDP panel) isn't ready yet, wait for the time specified
> +			 * by GSP before retrying again
> +			 */
> +			nvkm_debug(&disp->engine.subdev,
> +				   "Waiting %dms for GSP LT panel delay before retrying in AUX\n",
> +				   ctrl->retryTimeMs);
> +			msleep(ctrl->retryTimeMs);
> +			nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
> +		} else {
> +			memcpy(data, ctrl->data, size);
> +			*psize = ctrl->size;
> +			ret = ctrl->replyType;
> +			nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
> +			break;
> +		}
>   	}
> -
> -	memcpy(data, ctrl->data, size);
> -	*psize = ctrl->size;
> -	ret = ctrl->replyType;
> -	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
>   	return ret;
>   }
>   
