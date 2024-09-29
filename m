Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F11989860
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 01:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAEE10E24D;
	Sun, 29 Sep 2024 23:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h0kS/1z7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E66510E24D;
 Sun, 29 Sep 2024 23:13:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCvLrXwUZXsX/UCU55paFTMXS5lmwDX6qqhthXZCJDHAniPn+OPnOQ2YDLPf/6ZzGBUJUx19/D4JSF+OsT4ul1nJ3jQd0BZ0lKk9MP9oca8BojWJimcszEeTKwZpvdGXKPFxDdi2EWoXIdgb9pMzY74qVexIr/o+Bam9pRnkYv86YpNVAjyoG9MVyfvMe7xAj1dNj+uxER/XOmpMRcjMKUPVyMR9Weezan98jNoIwQDU5sSO2jXfseVsAXcp0i0rLLAzevkaP/LyrgUQZvGX+7ZZF5OxOCs8DzM+PokjpuTlzf2/1bFTechcjwiGsQL74zjiJIoVgKS3PAOqOLa83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27bT8nA7Xj5Rom/qpODaoXuC9OLdOYEZrFjg2J9p0Ls=;
 b=EjlnleV9dX9xAzJb7UwZ8gpiItFsZG+PYmK80r8GGaTDOiwNZvG+CvA8oeKRerpV2xRPV4DsjdnYJsUkTRPMtbzTtqqEkurpnaTmcc75N7hCkt/WndhVx5TVaf3YnYEp9YTNq972atzFrwrwvDfEsqfbmq+6hC8hd8wHS3hEeco91zOKyz+RjNAhxVv7tHpGWYQzmpcJaxP6JqRG07db4+vCgcEL7atLOHuNehT04KbIDxoOhG/AOi5A8RIHnbem4Z9DFAPA1U+INfFWdKV64w3O9lRpcqhEGBu+Gc76uonIJB8SfvVtuP5QN+87vDyaYhlMN7cpQ8PVqeRkNRdwuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=freemail.hu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27bT8nA7Xj5Rom/qpODaoXuC9OLdOYEZrFjg2J9p0Ls=;
 b=h0kS/1z7ErlemxrKspKAFsnFEJkaIlXleH5slgzpw3jG6ttcgxiBBIsSL3mAbhpCXDPaAtNtksZB8IMx/iCZ6srvaJfEAM4JfBGjTFwxSy29B4aPYYYdMiJ6vQMxLXl/3bxI1i/MGOx8CMoDIpC7ZnOY6sAB8F2NQicRlJ+G7eMleJAUJvBarELvJtaJozvAQjvp9YgqZ8wLNI+i0zQMpY0FKctUJ7ti3w8oQGrW60ShKUlDS/fRJoGgRJUCkYdZ0tQ+7Xe6S1qDaFEWmAGnqYz8EE/10mDYkzYJUmpZ7cScVjym05PPgkGRMul0lgQX3vMr2x0PtwNKf9xCI3pvpw==
Received: from DS7PR05CA0088.namprd05.prod.outlook.com (2603:10b6:8:56::14) by
 LV3PR12MB9330.namprd12.prod.outlook.com (2603:10b6:408:217::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Sun, 29 Sep
 2024 23:13:24 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:8:56:cafe::70) by DS7PR05CA0088.outlook.office365.com
 (2603:10b6:8:56::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.13 via Frontend
 Transport; Sun, 29 Sep 2024 23:13:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 23:13:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 16:13:23 -0700
Received: from [172.22.80.131] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 16:13:20 -0700
Message-ID: <4fbfe84b-c092-4648-819f-4368add9ec4a@nvidia.com>
Date: Mon, 30 Sep 2024 09:13:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/i2c: rename aux.c and aux.h to auxch.c and
 auxch.h
To: <egyszeregy@freemail.hu>, <kherbst@redhat.com>, <lyude@redhat.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240603091558.35672-1-egyszeregy@freemail.hu>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20240603091558.35672-1-egyszeregy@freemail.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|LV3PR12MB9330:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b28591a-fad0-44a1-584e-08dce0dc517c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?My91UGVXOGJKSDRCR21MSlNLWHA2YkNOdHJtNzlacWs1UzdBNU9kM0VwTDAv?=
 =?utf-8?B?NzV2ZVlybExwSERDcmVMa0RMSFQ2eS8yRDAyQ25SRys1a21WYTJjd01HQTgw?=
 =?utf-8?B?OVRpek9wcUtIR251NklObWVTaVlCWTRMV01sUlNlZU5yQ1lYN01wZk13aEY5?=
 =?utf-8?B?RS83MW03Z0N0VU1raTRjcVB2dDhYUklBdE1BSVNMclNVV2tEa01HRHhLMnU3?=
 =?utf-8?B?ZGVnY0drTTZjMVV1aFd3NEg2eGFIMXlNVWREQmRYcEI3WkZvYXA2VDgxS3lh?=
 =?utf-8?B?cG5MY2UxRzZsdDQ3YktiOWFSeFBiMWZRNURaMm5CMW1CUjJNMTBOakkza0My?=
 =?utf-8?B?YTFaaTZtQ081MEg3WXdwRlNzK2xRc2ZDdDZiZkhObUNrTC9QS05jajlPSU12?=
 =?utf-8?B?M1oxMmZUWG85U1pLZHg3QjBrd25NSXNBek5XN2RrOEx3SDBxcUVIc2J2ZEFa?=
 =?utf-8?B?ZHZFbVJXVW5VMU55Q1BaOG5jZ2pLM292dWZxSExNR3ZpRm5YSS94RTZwRXN2?=
 =?utf-8?B?U2ttY1hyTEdsWGxPTU5oRWVZaVd3MXFSd0ZGYzlUd1hJTlQzR0IrZG1zZHFQ?=
 =?utf-8?B?SGh2Zm00MTBFM0YxVnU4Mm9uVUhvcmFNb2hwY2Urc2lBZFUrQ0FQcFJRcDAw?=
 =?utf-8?B?WGxHSFloVGxoV0xSUllaVkdWK3hqM0VaYmJMZVBvZVp2d2hJTzdSS3JhWEY5?=
 =?utf-8?B?ZDFjTnYyNG9DTnV4Uk15T0w3c1E3d2E1cG14ZjdrSHlIT3BXSU5IK05lSkhm?=
 =?utf-8?B?WlVLcjRXL0FkQ2ZURGpQS0RzdnY0ODJwN0daVUZLMzZhVm5iVmR0N0NleFBa?=
 =?utf-8?B?ZThTOUF0b05uTXNJYUlPdk5IdjVCYXpYMVcvc3o3RXBUSVR5dmhNdmJaT1lW?=
 =?utf-8?B?QjBxMWp6UmFvRVY0dGFlRGthTUhPZnZkMThJdTk2RGNOWk5nTzhnay9oV0lP?=
 =?utf-8?B?bGdJcmp3L3QyNDFwV0V4dXJsZk1xY2tKTXFXMWgxQzBoUHE4ZjV0U0ZXaGRr?=
 =?utf-8?B?ZlJaek50NnkzWGVYUEZVWHhVenV3cUl0dytlNHpvUlpnWWJIazlrazZxWVRM?=
 =?utf-8?B?RzRia3lsYzNreUFHOUVMclVReXhZdzdlcmwxZDZQcXJCNXl0U0x1dFMyd1Ni?=
 =?utf-8?B?aTlaUzRSZDI0MCt2djhvVGwyRW1DWjloLzh5ekgyK2VQbGtpb1ludjNVelFV?=
 =?utf-8?B?ZlBBVnFYRkVORWd1VE43L3BRNlhWdzR5enZybXVNNnNXV1EzTlFEVTZTYXVF?=
 =?utf-8?B?bDhPQVdGRW5wVzgxM01JaG1oYUtFZ1lYV0tzYk95dzJxVWRsem5JK0xyOVBj?=
 =?utf-8?B?bmZWeEdWTWY0WjdYcGx6YndZV2NpdjFCam5PTUtOVVNtdjYrVHhlK2I5M2N4?=
 =?utf-8?B?TFExVkRVcTM0VGZYU09GQ3h5Zk5iazZaV0hUNWtTUytseUgxWGJJSFhFWklF?=
 =?utf-8?B?YUEzdFBiV3UvbExpNDVvckpWbXRSR25DZEI4c21wVjJsRFUvcDErSTluRmdy?=
 =?utf-8?B?SzJ2NW5ZZGtUVjZyVHVpcXpwclFieVIwOWMxcEQ4dy9zamtMdWl5Qmk3NDVB?=
 =?utf-8?B?YUhEVWFOcE1zdFlodXROaDE4QjRqZ2lJZGxGUm5BMFY0OTdnUERCVCttR0tk?=
 =?utf-8?B?YjJ2elBUZ250akZITkRDQzV4U1Q5emJRb1dlTmlwd1psVHA4NDNhUnpLN29n?=
 =?utf-8?B?eGNkQm9ZRWU4TmZ0dG1adUpIQkVRa0oybkw3dG5Ob2F4NllhODJZdStRbHd3?=
 =?utf-8?B?RUhIWTFCa3JkVWpQdnUrV3hocE5xaW5NVkpHWWthOEZPNVJmMjNpeGg3QnVF?=
 =?utf-8?B?OUM2UFZlR3hCNlQzSnN3bDQyZTJ2WS9BOE11RmpuK2ZjL3kwRnFOeXJLcWw5?=
 =?utf-8?B?Yzd4RXpPdkdmOTdNcmJBWExEQityN05wTlAwQ095UHZHd3VFK2I5T1JYc3hL?=
 =?utf-8?Q?NcvFVVo2akuCyfTdEtmY+RDfYPPL26YB?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 23:13:24.2735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b28591a-fad0-44a1-584e-08dce0dc517c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9330
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

On 3/6/24 19:15, egyszeregy@freemail.hu wrote:

> From: Benjamin Szőke <egyszeregy@freemail.hu>
>
> The goal is to clean-up Linux repository from AUX file names, because
> the use of such file names is prohibited on other operating systems
> such as Windows, so the Linux repository cannot be cloned and
> edited on them.
>
> Signed-off-by: Benjamin Szőke <egyszeregy@freemail.hu>

Reviewed-by: Ben Skeggs <bskeggs@redhat.com>


> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild             | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c          | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c => auxch.c} | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h => auxch.h} | 0
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c           | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c         | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c         | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c             | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c           | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c         | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c         | 2 +-
>   11 files changed, 10 insertions(+), 10 deletions(-)
>   rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c => auxch.c} (99%)
>   rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h => auxch.h} (100%)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> index 819703913a00..2c551bdc9bc9 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> @@ -25,7 +25,7 @@ nvkm-y += nvkm/subdev/i2c/busnv50.o
>   nvkm-y += nvkm/subdev/i2c/busgf119.o
>   nvkm-y += nvkm/subdev/i2c/bit.o
>   
> -nvkm-y += nvkm/subdev/i2c/aux.o
> +nvkm-y += nvkm/subdev/i2c/auxch.o
>   nvkm-y += nvkm/subdev/i2c/auxg94.o
>   nvkm-y += nvkm/subdev/i2c/auxgf119.o
>   nvkm-y += nvkm/subdev/i2c/auxgm200.o
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> index dd391809fef7..6c76e5e14b75 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> @@ -24,7 +24,7 @@
>   #define anx9805_pad(p) container_of((p), struct anx9805_pad, base)
>   #define anx9805_bus(p) container_of((p), struct anx9805_bus, base)
>   #define anx9805_aux(p) container_of((p), struct anx9805_aux, base)
> -#include "aux.h"
> +#include "auxch.h"
>   #include "bus.h"
>   
>   struct anx9805_pad {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.c
> similarity index 99%
> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.c
> index d063d0dc13c5..fafc634acbf6 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.c
> @@ -24,7 +24,7 @@
>   
>   #include <linux/string_helpers.h>
>   
> -#include "aux.h"
> +#include "auxch.h"
>   #include "pad.h"
>   
>   static int
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.h
> similarity index 100%
> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h
> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.h
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> index 47068f6f9c55..854bb4b5fdb4 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs <bskeggs@redhat.com>
>    */
>   #define g94_i2c_aux(p) container_of((p), struct g94_i2c_aux, base)
> -#include "aux.h"
> +#include "auxch.h"
>   
>   struct g94_i2c_aux {
>   	struct nvkm_i2c_aux base;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> index dab40cd8fe3a..c17d5647cb99 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> @@ -19,7 +19,7 @@
>    * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>    * OTHER DEALINGS IN THE SOFTWARE.
>    */
> -#include "aux.h"
> +#include "auxch.h"
>   
>   static const struct nvkm_i2c_aux_func
>   gf119_i2c_aux = {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> index 8bd1d442e465..3c5005e3b330 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs <bskeggs@redhat.com>
>    */
>   #define gm200_i2c_aux(p) container_of((p), struct gm200_i2c_aux, base)
> -#include "aux.h"
> +#include "auxch.h"
>   
>   struct gm200_i2c_aux {
>   	struct nvkm_i2c_aux base;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> index 976539de4220..ab86e11e7780 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs
>    */
>   #include "priv.h"
> -#include "aux.h"
> +#include "auxch.h"
>   #include "bus.h"
>   #include "pad.h"
>   
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> index 5904bc5f2d2a..cc26cd677917 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs
>    */
>   #include "pad.h"
> -#include "aux.h"
> +#include "auxch.h"
>   #include "bus.h"
>   
>   void
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> index 3bc4d0310076..1797c6c65979 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs
>    */
>   #include "pad.h"
> -#include "aux.h"
> +#include "auxch.h"
>   #include "bus.h"
>   
>   static const struct nvkm_i2c_pad_func
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> index 7d417f6a816e..5afc1bf8e798 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs
>    */
>   #include "pad.h"
> -#include "aux.h"
> +#include "auxch.h"
>   #include "bus.h"
>   
>   static void
