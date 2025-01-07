Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A1FA037FD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 07:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91D910E2DD;
	Tue,  7 Jan 2025 06:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kTtQ0O99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E327A10E2DD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 06:33:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VA3TZGvaAL7xINjG7CBsIw14agxCzAAihfu2fC6eKgSjRaOOunNFobo0gD2wBVsuy0rjxSWPfB2IFnLrM+nP2JIMberTAjFVwZsYgXrxEgbuJSqIZHIu49Tho+tuyVjhMsZXqIJL+OlImuEsOHC58+U/cwAClpSvEXcIxzHu2yPAYxozQwSrZEjY+hviPnT1r4YTRBCHaAd9a6g8C8XkwnajWaCsLANnNIWCsiWnk37SYOOozdDdrpkBRQ0qIY7oMPDC8nRPRLt2js0k9idXWosLDXzShUtXQMT7xqKAeJkOlcbP2Qupas7ZHA6QoD2wDkgyE+C0LUJ6mEt6+L7kVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWo36jrrLtQJgYLRXu5fkxeEuo6Ba18SM8JSt8qy+lQ=;
 b=mULxix6JG6Tmq59L8dgReT3r+3zzuk600l6JbaFbRapYheacmS+0Xhz+xpvGRDPi4k1sblT0lP0IADFcX4QQSHJLEjWPl1j/3P0X/Mu80j8vGJk/e3F7K0nei0Yjiazv3mv/rKyRmeDJ9h04PjA/bujmrx+YgYe387qqN5Zc8NkZJvVRSLXdYBSJ6ge/TfFipN2Ov/drD0ysyrixLlLvjYby9+hVdIu44G8rQvkSLklkS+BovY80NkXNdcn/mEBQVl9T6n+XHqLr1mU0TU1BoF6WtEsbHuAeTg2mOVfEsL3yNWB0sFNxzTJLUzW8RLlNyKAWEizUdnJ/BF9QkeXPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWo36jrrLtQJgYLRXu5fkxeEuo6Ba18SM8JSt8qy+lQ=;
 b=kTtQ0O99a1Jkq4QSWl2dkuszvvwZh62GG1Om6MiZ4ARRGhX7QFiUoYf7OezZUsqV1ETYYAd/CgKTR1NvY4OW7I42uZYDKV7uXjBWPKlFwSzS7WR53S9JuqmO6TR28QHgnEXWTGcnbILNqSMoSQsS5MYVkAeKSwFzL1cOoUiDhtm6yJoaOvZ6+z/e0gBeqqV38satJVVLHHZL8H4zX/5X1nmrIzzDRcDdUl45l9+o72bRYTj/73z5b/YwjdT+S7GWZFon9SRBUOrx5pTR1yqg+7WhTCuIMx1TWS1EkXxyhXb/uEaY5gU3ru1Hkd9xurkf5V272147TZFZ9KVyyE5Wpg==
Received: from BL1PR13CA0368.namprd13.prod.outlook.com (2603:10b6:208:2c0::13)
 by SJ0PR12MB6736.namprd12.prod.outlook.com (2603:10b6:a03:47a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 06:16:59 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::40) by BL1PR13CA0368.outlook.office365.com
 (2603:10b6:208:2c0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.11 via Frontend Transport; Tue,
 7 Jan 2025 06:16:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 06:16:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 Jan 2025
 22:16:45 -0800
Received: from [172.23.93.240] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 Jan 2025
 22:16:44 -0800
Message-ID: <dcc9d9d0-a5df-4252-ab6c-885e957f8bac@nvidia.com>
Date: Tue, 7 Jan 2025 16:16:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/fence: handle cross device fences properly.
To: <dri-devel@lists.freedesktop.org>
References: <20250107055846.536589-1-airlied@gmail.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20250107055846.536589-1-airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|SJ0PR12MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 0077aae9-e6b9-4a2a-ab1a-08dd2ee2e46c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWRaSjlZTmhmUkxwOVdzbzNCYUtoT1NBSGhBNmpuSzBZTzcvYm0zdXFPR2N3?=
 =?utf-8?B?WUo5RXk4NGREVEtmQTJ2RnM3RkVHa1Vwck11UDhaZ2tRKzhJUzIzT2tpelZj?=
 =?utf-8?B?emtRbkUzNTBTeFNCWHRBNkd0eks2dXU5c3R3SHFRRVF0ZTBaR2x3THpKRytV?=
 =?utf-8?B?S3diSTdtemFxeG9GeGhkSmUrQzBUazZpSnVaZkFTeW1Xem9MNlhYVmZRTjd0?=
 =?utf-8?B?c2xJZnowS0pRTG8wbVZaQ0cwTGpVZ1oxajJCU2wySThNalBEbnhLR3JUOHly?=
 =?utf-8?B?a1BrN3FLTXNNNWZBVlJ4VWtOOGFJSGR4V1lvL0d0blduSERBeEJZRUNYMU82?=
 =?utf-8?B?VVRzaDZTUzFSeEpEMUNsa3VGZS90VGdTRVVnWWJjVmFFOVpOT1JRZDRnVkZn?=
 =?utf-8?B?aTBkeXR4a3VsM3ZMM3oraTc4ZEczWnoySUVYZWV4UENZamJsckNKekF5TDBZ?=
 =?utf-8?B?YzJZRzF0b0RpTVJnYkp0cnFJSkw0ZWFJNmtoVzl6aktjTCt5YUxsMU5BRHJl?=
 =?utf-8?B?RVpLdWhHOGI4Z095KzJnTEdQbmdIQzJqNG5hTkZVOW9kalk5UkQ5djRNdmlY?=
 =?utf-8?B?TTk5cEZxYnljVFU3T0tsdk1JY0EwQVYwU3QvRWVGRHZ4RW5LbkcrbzdFSVgv?=
 =?utf-8?B?VWhxY3JyQmpjSGRkNjVuWTVxY09YL1Jya0l6clhSS1lwb3ZRQ2NuYjJNYWZC?=
 =?utf-8?B?WHBLRmxHRnl4ZVd1U3JiaVBpSm14bnFyYXhUQS9vMW5aNDZTVjdVVDkvdEdz?=
 =?utf-8?B?MlZidlV1SVJmRktXM0ErVGZwREdxVFk5aGpMVXlEU1h1Z2ZUVGd5Y0xMVVFw?=
 =?utf-8?B?SHZ6Q2JLTSsydmNXa0IvSXFHeHgyVEQwN0RQdlhiaVovVDVXVkRIR2REVXJq?=
 =?utf-8?B?MmtoMGIwQUE1MkN0WFZ1U2ZZVExyMTBMRE5kSk0zM3ZpL1NtbTJoMWtOKzZR?=
 =?utf-8?B?Y3RVWEo2RnVueW9hcEtKOEZaT3RTZjNoZWpCY2dRN2JPWm1qMUJPQUJsSE8r?=
 =?utf-8?B?aS9qeHlNc1VubEtxYXhTSVI1Q2dNdHozYzlFcFRzLytUeXFJLzRHSVVHaGh6?=
 =?utf-8?B?STY2SWFLcVA0bVQ0WWpNNDN1WHV0QkRLT21yTUQ4aG54Z3hJQzBsOUJPVnhM?=
 =?utf-8?B?Y01NcWsyZmNXb05uNk1Zc21CM3NXSjZPMERicjhXWkp4Vk10VHE1bndXNGI1?=
 =?utf-8?B?MmVLeU02aUNJaEN4VVIwSkJMN0Rjem94dXlXQ2RMUzJ4NGFsOGtHVXp3VkNn?=
 =?utf-8?B?dFZjK0ZKSmloa1NIL0FrL2dSaHFvOEx1KzlrSzFQZ25NaWI5MTFxejhUeDVz?=
 =?utf-8?B?WGw0SW94TDU4QWNvZkl1RURIS2tSdlo0T3R6ZW0zM1EyNFluQnVsMXdxMy9D?=
 =?utf-8?B?T0F1YzRPeVdqWmR3aVcrdUhqcEVKMWlac1V3djZkdktKemZqRURyRlBGSUJr?=
 =?utf-8?B?UzcyNC9BYnRHYno4NjhQdGl1TTRNNGdPLzBFMy94ckQwL3pqZXdjT0RqRUFT?=
 =?utf-8?B?R21jOElncldxZ2F0N3R1NHhhNmd3SERZSkU2KzJFMTZtbTVpbzFwVUkySmdZ?=
 =?utf-8?B?bk4rNC95QUhMNDJ0TFdwMVFiYTJZbHg2dDloQWl2eXBUV015RTFmeitTWkwx?=
 =?utf-8?B?VjJ6S3dNenk2aWV5YVRsSnk5N2k4MWUrbnNCV0x1MEdpQlZId0VxWWF2aUlQ?=
 =?utf-8?B?b2JRdFpNd1lGUzAwbGRSUnNNRGJyaDdXaFpmaUFuY1NHQUl3R0F0VlpoT0Nr?=
 =?utf-8?B?UDBQRlBLL3dLYm9YeTZEem92d09rWFliU1g3T0ptNmwvekRpTW8xZkd0bkZH?=
 =?utf-8?B?ZjhCOUtNVnVGOWJvSVpMNVN3eVVRYVZVRzlDYUpOalpFQ3cxbWI2NTlVOHBC?=
 =?utf-8?B?OUYyNDZYMlBMMDYwTE45ZjdhV3hvY2I4U1RxbXFGUms1QmxIQmZmcmY1UGNB?=
 =?utf-8?B?NExnN1YxaUthY0Z6VElacFZMZUxrR1pGdlhtbkdmOGtKU2l1V1hCU1pYcE1L?=
 =?utf-8?Q?jxp61EO/hs6UBwM/Yqt3XzzzRhY/qY=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 06:16:58.4104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0077aae9-e6b9-4a2a-ab1a-08dd2ee2e46c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6736
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

On 7/1/25 15:58, Dave Airlie wrote:

> From: Dave Airlie <airlied@redhat.com>
>
> If we have two nouveau controlled devices and one passes a dma-fence
> to the other, when we hit the sync path it can cause the second device
> to try and put a sync wait in it's pushbuf for the seqno of the context
> on the first device.
>
> Since fence contexts are vmm bound, check the if vmm's match between
> both users, this should ensure that fence seqnos don't get used wrongly
> on incorrect channels.
>
> This seems to happen fairly spuriously and I found it tracking down
> a multi-card regression report, that seems to work by luck before this.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>


> ---
>   drivers/gpu/drm/nouveau/nouveau_fence.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index ee5e9d40c166f..5743c82f4094b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -370,7 +370,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
>   
>   				rcu_read_lock();
>   				prev = rcu_dereference(f->channel);
> -				if (prev && (prev == chan ||
> +				if (prev && (prev->vmm == chan->vmm) &&
> +				    (prev == chan ||
>   					     fctx->sync(f, prev, chan) == 0))
>   					must_wait = false;
>   				rcu_read_unlock();
