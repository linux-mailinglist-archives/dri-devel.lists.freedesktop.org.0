Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD5A8D78C0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 00:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6212210E117;
	Sun,  2 Jun 2024 22:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rGfwHKrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3246110E0E3;
 Sun,  2 Jun 2024 22:08:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4MeC35jGPksHnMpTA+umJGD0hrm7gVmu6FeK1t4gwctKgjIDVjJV+C3BVB8oEumKAchP9JpQ8zRxcDoDI7XI8DTcCTnWVJBU3Ukcbo7yMlUwpmvQyHjZevi+A/kHBsYNLd0YY7YKEArNEYE8UUc3XEcikfPkyeXTpy0d4CLdOJb2qZLzIdPXFjhdH7mj4vb4uRgaPgCq5pDHezC+SrpbKPdOXmLoOkPfPFuwWKGunAlbCOJ31pP5dqY8KEdy8+A/+ed/obrWg4tTGeNW2LfCjOnudamNMNa5H6XFMRzXCUHtRTjN+W8qBx48b5vE5OQ1dP2go+5JQFiQOrpFrJKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdXQ6H1KUELRbJ4rtwwUm6VJQH7C/od968AHCrpdgBI=;
 b=Uh6K6bsNbDmPR4wPeVXRj8bqU9HkiTXLh+bjfRBNc/LBLIwmPq66xtITS9PcFHqwyI29Dcz19WVTp9TLiDgBL9cjNwc8aUssOFNsvX02s+XojjjqDD5231LM0CiKmjNwNxDBF+WGInHtXBTtMZrTGofz3mzC8+f/xYtedzWQhPXzDA6kO4JtEwCPFiI908eAGcATdCg0uBqp4QAdnIZTu0xSrBOl5WYiWhrwCgZcQFFBQotk04hd5DWm+F+PahQ95zl4rIa6lzt6c1RCJdwBMCIsCDVLwao/zTa09dOE5sAyXij4zTz4NTVdoPX+ox3Ilm3+SDSTBzNkzN8bF0ty+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=freemail.hu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdXQ6H1KUELRbJ4rtwwUm6VJQH7C/od968AHCrpdgBI=;
 b=rGfwHKrteijEIZvtMpYHMwnCasMkqai/bYJFINwmJ9uerZOMc2lKmo6Ci84l9dT9Mlh6Ohb7CHS+IV8gPjXfdCpjM7DswE1rAKvJUXVtgEHwv9Si9jZi1rqqQRtE2fK6ASxwNgsT2MWEZUoy479gWQ1DI309bsdvio3m3XCYZxRb2F0o45eicaiZ+Nj/YQi3eMa6POH7KOR00xovmw2ny8UvVq6WBhUiAjSgFQbCMMyVYzCsLoF8eboluevzcdztHwF7rftWIhiSdJI7UURQtPeeN4QkatEmdYP4kYFOvx+g88Q20L9firs5SWLnIH6LVzpOaIs7fef3XjmmEZuoww==
Received: from BN9PR03CA0944.namprd03.prod.outlook.com (2603:10b6:408:108::19)
 by SJ2PR12MB9115.namprd12.prod.outlook.com (2603:10b6:a03:55c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Sun, 2 Jun
 2024 22:08:24 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:108:cafe::7f) by BN9PR03CA0944.outlook.office365.com
 (2603:10b6:408:108::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25 via Frontend
 Transport; Sun, 2 Jun 2024 22:08:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Sun, 2 Jun 2024 22:08:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 2 Jun 2024
 15:08:18 -0700
Received: from [172.27.35.123] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 2 Jun 2024
 15:08:15 -0700
Message-ID: <233ba844-7964-42ad-8962-95c371e402be@nvidia.com>
Date: Mon, 3 Jun 2024 08:08:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/i2c: rename aux.c and aux.h to nvkm_i2c_aux.c
 and nvkm_i2c_aux.h
To: <egyszeregy@freemail.hu>, <bskeggs@redhat.com>, <kherbst@redhat.com>,
 <lyude@redhat.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240601212247.54786-1-egyszeregy@freemail.hu>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20240601212247.54786-1-egyszeregy@freemail.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|SJ2PR12MB9115:EE_
X-MS-Office365-Filtering-Correlation-Id: 94de431d-0273-444c-099d-08dc83508569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWZuUnpEcHdWRVF5TnV4N1U3VjJRSEw4anNORGxlNGtXQUJGS2xmVlpuQ2hy?=
 =?utf-8?B?OGI1NjU3SVBVVlZNVzB1akhtMkdnd1lQaG1HYmxhOUx3UzBodnpyb0J6YlNW?=
 =?utf-8?B?NWM2SjlxMmhNQkFObUdFQTFBZnloaXBzZkJNR3E5RFFqbGswdkc4Y1JzQWVW?=
 =?utf-8?B?amY2c3dCSnh3MXREbGg1MUhFRmFZQUN1Z1hGRVFsYWFUdmhQd1lGYjhVRjd5?=
 =?utf-8?B?UVYzbUdCcUVCRGp2S3o4RWxXQ3B2ckw1SUU3U2ZVRThlVjVDWTBLK0Jwblg0?=
 =?utf-8?B?TWFRUkJkYWkxL0FQN2xzWnkyNEdUK29UQThsVHFjSU9EaFRoMjFTYk50ODc2?=
 =?utf-8?B?QzRwNWdMS3hCTVNjUDNJT0xDdklLL0tuLzJPTGVSYzdmMDArdk1JWDFHRjVt?=
 =?utf-8?B?cVhPa3l5L05LN09ubGJld2ZjZDE4NlhGdDcxRW1UdmhvdlEyTEVpNVFkc3VQ?=
 =?utf-8?B?T2NnWWdjcE54aWVYSlB3eS8xcVRTUzNEcC92Qi8ydHByU09VWUFDMnNhQWpz?=
 =?utf-8?B?d0k1c3VLNkJvZmhiYTk1RUkwblpmZ3FMTnRNblpVNHR1eUxTTEZkbHBNV0dt?=
 =?utf-8?B?cDMvMUZrN2l4Y0c4N296Qjg3dkFReEJJdEZZRjhlK2FDWnlxOTJ1Um5vdThq?=
 =?utf-8?B?SDZGbFU2ZUdpN0JFRFQ4N1FFQlpjTng5VmhpaUU2OTA2aTJJS1g3Z0ZOZ1RQ?=
 =?utf-8?B?SWNTdUlmR24wY09HVFo4UGlFWENzRmNMQituTUtkQmJ5VDd0U3RBMDlzQ3Jt?=
 =?utf-8?B?K1Fyc2ZRcUVQK0kvNmRPQ0FlMVhCRUdmb2ZxOGZBd3BndXN5TFpsMC82cThV?=
 =?utf-8?B?WUdiS1Y0WFZoamFRMnIya21VSEs0OGNDNVBReU9YZGN2WXBhbDQwM2lPbHNC?=
 =?utf-8?B?d0xyNG56VEM2N3V0SlNOV1IwdGZxSzJFMDcrQUlEek5SNmdqVHNoa2ZRM0RL?=
 =?utf-8?B?dzRnUTFIN1gyWnJMR2d6UVJ2RkN0RS9lQXpaYVpBVkZEUlB4akwxeW0xL05L?=
 =?utf-8?B?Tm5BQ0EyZG5DV3FmR0M2bDBLZXBKZ3UwSlJheTU0VHFvdXZUMlVLYzJVZDRN?=
 =?utf-8?B?QmdyQ3gzTUxnSjgxeTF2TG9rT3VXQWxWSGoxeFMwN2IyVDFvaXM1dzlvZEln?=
 =?utf-8?B?MU5QRFZ2ZnhyYzNkR2EvWU04QTVuemFJSy9wRzg2MmRwcUVIVFRwUzdrbE1Z?=
 =?utf-8?B?V21JQUt6TTdYMjg3S2xoajFWTTRieUNwOG93bWRwZm8yZVNyU0t0TGx2bzh0?=
 =?utf-8?B?d1ZCQzlGRE9PVDN3Sm01bTJucHpKTjNZTkgwb05LUFI3ekpLR0RkNzQ5cFlK?=
 =?utf-8?B?Nll0cEo4NFBOWFJoQjhiR0xGYzBJZDQwMSt2a1k0MGRndlhUczFCNUc4a1pG?=
 =?utf-8?B?RWV2RXBVUUVLTkpJc05FaVRKbmdGdGhyRkc0L25EaXI2bTdVOWlhd0hpRG9u?=
 =?utf-8?B?eDFFb3FqK2hNWnA0SkJFSDAvMmRoQWlxalZ3Y2JnRjNMSXlGd0R2dTZkdFMw?=
 =?utf-8?B?TUpuQWp5dmZUTTFJSUlwdWVQVXJldkkxcXN5cXRpdjd0Q0RuSEdnTmE4RWN1?=
 =?utf-8?B?Wk9oZTVtR3JTSGZLRExOcFNISEVCK0VGeWtFUWZjOXd6c0RFYXlhREFhaW1U?=
 =?utf-8?B?WWJrSUdCM1pGcnczQnBpQWxGYWlLZGw2RVVoMlpLMHdmSXlqUEVEWTBrRE9k?=
 =?utf-8?B?YTdCZk9YMmpVSWlWcTNXWGwwd1BBWVhnb1AyLzNiYlNSRjhZaGcyclI4cVdo?=
 =?utf-8?B?c0hGUFV1OHpmaWRNUTJZQXJhUHA4eno2WmdOUWF5RXk0NXNGY0FwamtaR0dN?=
 =?utf-8?B?OWt3Y3B1VXRnQ3Nld1RqcnJDU2QzQnRnZDZmMUgwZWZCVklwcGFwOC9EaTMr?=
 =?utf-8?Q?aFanKThBFRGlr?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2024 22:08:23.6768 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94de431d-0273-444c-099d-08dc83508569
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9115
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

On 2/6/24 07:22, egyszeregy@freemail.hu wrote:

> From: Benjamin Szőke <egyszeregy@freemail.hu>
>
> The goal is to clean-up Linux repository from AUX file names, because
> the use of such file names is prohibited on other operating systems
> such as Windows, so the Linux repository cannot be cloned and
> edited on them.
>
> Signed-off-by: Benjamin Szőke <egyszeregy@freemail.hu>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild                  | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c               | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c                | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c              | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c              | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c                  | 2 +-
>   .../gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c => nvkm_i2c_aux.c}   | 2 +-
>   .../gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h => nvkm_i2c_aux.h}   | 0
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c                | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c              | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c              | 2 +-
>   11 files changed, 10 insertions(+), 10 deletions(-)
>   rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c => nvkm_i2c_aux.c} (99%)
>   rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h => nvkm_i2c_aux.h} (100%)

NACK on this rename.  No other part of NVKM uses filenames like this.  
If anything, auxch.[ch] would be a better choice.

Ben.

>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> index 819703913a00..c488dfce4392 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> @@ -25,7 +25,7 @@ nvkm-y += nvkm/subdev/i2c/busnv50.o
>   nvkm-y += nvkm/subdev/i2c/busgf119.o
>   nvkm-y += nvkm/subdev/i2c/bit.o
>   
> -nvkm-y += nvkm/subdev/i2c/aux.o
> +nvkm-y += nvkm/subdev/i2c/nvkm_i2c_aux.o
>   nvkm-y += nvkm/subdev/i2c/auxg94.o
>   nvkm-y += nvkm/subdev/i2c/auxgf119.o
>   nvkm-y += nvkm/subdev/i2c/auxgm200.o
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> index dd391809fef7..30bf84e77db9 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> @@ -24,7 +24,7 @@
>   #define anx9805_pad(p) container_of((p), struct anx9805_pad, base)
>   #define anx9805_bus(p) container_of((p), struct anx9805_bus, base)
>   #define anx9805_aux(p) container_of((p), struct anx9805_aux, base)
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>   #include "bus.h"
>   
>   struct anx9805_pad {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> index 47068f6f9c55..9e07ba444ca8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs <bskeggs@redhat.com>
>    */
>   #define g94_i2c_aux(p) container_of((p), struct g94_i2c_aux, base)
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>   
>   struct g94_i2c_aux {
>   	struct nvkm_i2c_aux base;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> index dab40cd8fe3a..8709b728c38b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> @@ -19,7 +19,7 @@
>    * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>    * OTHER DEALINGS IN THE SOFTWARE.
>    */
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>   
>   static const struct nvkm_i2c_aux_func
>   gf119_i2c_aux = {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> index 8bd1d442e465..f40c5709d217 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs <bskeggs@redhat.com>
>    */
>   #define gm200_i2c_aux(p) container_of((p), struct gm200_i2c_aux, base)
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>   
>   struct gm200_i2c_aux {
>   	struct nvkm_i2c_aux base;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> index 976539de4220..736275f0c774 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs
>    */
>   #include "priv.h"
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>   #include "bus.h"
>   #include "pad.h"
>   
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
> similarity index 99%
> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
> index d063d0dc13c5..6b76df02c63a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
> @@ -24,7 +24,7 @@
>   
>   #include <linux/string_helpers.h>
>   
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>   #include "pad.h"
>   
>   static int
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.h
> similarity index 100%
> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h
> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.h
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> index 5904bc5f2d2a..e9c55a57c878 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs
>    */
>   #include "pad.h"
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>   #include "bus.h"
>   
>   void
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> index 3bc4d0310076..1af64e25d838 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs
>    */
>   #include "pad.h"
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>   #include "bus.h"
>   
>   static const struct nvkm_i2c_pad_func
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> index 7d417f6a816e..997a5a2146c4 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs
>    */
>   #include "pad.h"
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>   #include "bus.h"
>   
>   static void
