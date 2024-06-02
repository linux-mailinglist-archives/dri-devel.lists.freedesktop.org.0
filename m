Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76028D7925
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 01:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8C010E043;
	Sun,  2 Jun 2024 23:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AjzjguVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FAE10E043;
 Sun,  2 Jun 2024 23:32:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SV/rS3RRq2QUG3W5o+9LjTJf9/GcqL90rzQbcirPFCSGyX0GvoySRQCQJLFWKhOMlpXaX95kF1IPWvvD+0ia8utTmI4s2ya6Yg+3bw7+e7GY7CZYCyobGisIhTEPspEc1Vm1sDkB/JtExb2F9cQN8D/me+8r+T2m0s4CIqQRQDA1OJUWz/xy8oY/pjSRd1LaufytmJg1b/grXYvBBU8B4VlGjxbw9hJ71q/KHWRSwaNkpLg+No4ztKaCXmgkkxcjslaK2DZwmSVjPKn5Al20IoZW7q+5VtnIOkGQEcvs50CpDTYV0idbh2zfdtaNW2z48d1eHx5OH/kFi8/9oTM7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcmkX+/6FgGQrexWsfsFsqFoCaMjIeWwhBhrUnNiuiY=;
 b=YOhXF4ai3AAbFgcoU/rLyX+IIIRjDuCX8ZZUdva8NTDbSB7WfTBpPXy0/Y6rB0Wzc6MMJCbFgqJvdRZiiBQndEw6IaAdm5w3Je6MhIuzbYYAQ+3NXsBBzGPU0JHYaH+KlzHLOpr1bYPum9H65js/bs/d2Yhd4hLeuKA95BkQn2+zc4Zr/cWrsZ+jIiG9HsoNNR3THAZGRc0jQCdL0mGU1cj2twI4gpZpfyUknbuGmFz443sRNGAUaGhZ4HNEPtkuepjaHwF3Rn5aQyy7s3/fCVQGjNmCdR9CA+4pUEdgK9gLfrqw9I7vfn4H3nW0ALYOKHg+715SCtqWgtL2EAHCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=freemail.hu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcmkX+/6FgGQrexWsfsFsqFoCaMjIeWwhBhrUnNiuiY=;
 b=AjzjguVvXJBgVMc0AXLj/D4i5tUoFV1RIHkQDt897g9X8NPynvTbj4LMyr+OAQmQSkZ6lkpesWVolghPs5Z1/FQVrXLef5B0uS3PvFrRVXiJT/snHUV0w68fiQTarbIq4RVzrrQqKp6v+E8jIvRlqw8970m9hz8xyzHRjm/I5SVMQhR7qPBWn4s5qv2pH2Uh6ItNxmt4KpL6l8Tx29mD9fHoOFxGdH4o3DFVRI68hgSKgzAq6tG2I+wV9AWUU/phv+H7gF/I29uaV6DWUA8w9dHRCZqvo3DqYecmZKh8eiWKDvHsRH/d3V9nTrl7nGbNQmQZqGx3PhlPSXQGx5n2kg==
Received: from BN0PR04CA0085.namprd04.prod.outlook.com (2603:10b6:408:ea::30)
 by IA0PR12MB8981.namprd12.prod.outlook.com (2603:10b6:208:484::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Sun, 2 Jun
 2024 23:32:47 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::8a) by BN0PR04CA0085.outlook.office365.com
 (2603:10b6:408:ea::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.28 via Frontend
 Transport; Sun, 2 Jun 2024 23:32:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Sun, 2 Jun 2024 23:32:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 2 Jun 2024
 16:32:29 -0700
Received: from [172.27.35.123] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 2 Jun 2024
 16:32:27 -0700
Message-ID: <54f8d8ce-c6bf-442e-9c17-99ef28b3959d@nvidia.com>
Date: Mon, 3 Jun 2024 09:32:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/i2c: rename aux.c and aux.h to nvkm_i2c_aux.c
 and nvkm_i2c_aux.h
To: =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>,
 <kherbst@redhat.com>, <lyude@redhat.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240601212247.54786-1-egyszeregy@freemail.hu>
 <233ba844-7964-42ad-8962-95c371e402be@nvidia.com>
 <d8366db0-ceeb-44c5-bef3-8cffb9d74860@freemail.hu>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <d8366db0-ceeb-44c5-bef3-8cffb9d74860@freemail.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|IA0PR12MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: 87db9574-93e4-4e43-1406-08dc835c4f27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|1800799015|36860700004; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlNjTjZ0ZEd6MlZBKytHYy85bkxielZJdjBpeTZGQTVqN3NNSm85UURUeE5a?=
 =?utf-8?B?QU9mZDBYS0oycDFxQVJPaEtzbGoyMEJ6S3RxWlVCNjF2Q284VGRTZXptcjBU?=
 =?utf-8?B?N3htQzJlSnFZa3BjbDdhcnVWc2l2ZW80ZzNqejZ0SlZXV0c0elgxR2daUUJK?=
 =?utf-8?B?MXQ0bWFqbEI4emtWamM5NXZQeWtsUzVPaHZ3OTVvWmtmNEhMYU95M2hCQm05?=
 =?utf-8?B?eitXUEpxaE0zeEs1YWMzN1R1dklWN1ZSd3MyelNERXIzaFBQVDJYWlRkeUkz?=
 =?utf-8?B?WEZJcG5zTG9ucGNXRjFQTVlrNDJQNFN1REZ1WE8yb1U5dU5Ld0pqZGkvc2Vi?=
 =?utf-8?B?T2Z2VkNHNlJETHUyUGdRSUJKOTBXYThxWDlBdkhObGVyZkdUTVVkampHR01u?=
 =?utf-8?B?TUhZay9iMDlUWUNBa2tOYmlUcVpKY0Qwenc1ei96dkMyUWJ1SUFXeU02cEtP?=
 =?utf-8?B?ME1MSWpiazVlbmNKLy80UWhtU2RWRGZZVHlsbmxidStjRzJqWGhsZGdjbkpM?=
 =?utf-8?B?ZWNCM2wzVGROSndBZmxySWFDL016YzQ3SjRpM3dVNDBOMnhiZDFNMUswQzlN?=
 =?utf-8?B?ZG1iZWZPRVlQSWh0VFhUYllCZXhJMTFLNUJvVm9aalkzUnM4OHU3VmxIalYv?=
 =?utf-8?B?cXdpanAwU2pSRjdkWG1zR3AyM2Y4WC9ER094RHZqUmprQ1RRMkE0QjZQR2s2?=
 =?utf-8?B?djhtblZKYWo1RlNxclVVVS94Y1E2WnErZHpmTE1KYjJKbDhqT3N6UTV2d1FO?=
 =?utf-8?B?T0VSeS80RnU4SkF3MlRTajBoTkhYVjJGeElub1RTYVlISWtweE1uL2RQa2xG?=
 =?utf-8?B?YlJuZDdPOWM5S09OVHV5ZGNyZWdtTm4yc2l4RzlLMkdkY1dJenNGZ1JqRzhQ?=
 =?utf-8?B?N0k2Q1F4OXhqQWRqWndLcUt5UW9mbXRBam9EN0V6anJCakVoTExLbE9LY3Iy?=
 =?utf-8?B?SzdqelhUSWJHemxTZTY2ZFA3TmhzWCticTY5Q1MwTDVlckxQQlM3d0RvQ0x5?=
 =?utf-8?B?SVhDTjI2eEt3Tzd1cXNYaGNZVWd2VHRhVHJVVlFzSFZJd1E2MDFIS3pneUxa?=
 =?utf-8?B?YjBOUjVRYzRsTGZYL3RXUG1DOXZCU1ExcmZadFhzYVZQaXczU1VlRDNtUFNN?=
 =?utf-8?B?bnYyb1ZwelJ5V0NTMTBnRXF1Zk80cUt6TE1uVG5JOVRJdFpuZEFnU0ROZWtv?=
 =?utf-8?B?RjVRWXJwMnJpL1FKdTg4RU0wT3lPM1FDUmw5eEd4Rk13L29ueFBJZlFnZEVt?=
 =?utf-8?B?bDlOQ281YTZBVFFtbFFyZHFuVitjdFh1WGFJellLQVRNaHptSHZ2SW1rMTlv?=
 =?utf-8?B?ZkxhbENSL0QwblZYOHo2WjJHUEhBMk83aXNtM3lndjY5ZVQyUTJFMXdWbG9Y?=
 =?utf-8?B?cGxKS0pjWTJqbHUyUmplSFREVDZUejAxRnJndU5jZGE4a1hoMytUZDBtVVZX?=
 =?utf-8?B?cDd6MzJiQi9xQU1zY2JsSm5QRjN2RmFBUUMvMzRIODJURTNUem84MVA5dHZ5?=
 =?utf-8?B?dmptNXdCYm5SZUNZVnRtdzNKWWhlaGRlLzdDSnNiL3JVVGsyS2Y3ek5ZL0p3?=
 =?utf-8?B?aXZ5N2RFSFBITTU3bGVPdTFtakxQTUQrcmp5VENtdTVESjZwdVRCTnplNjk5?=
 =?utf-8?B?bVJObEZqcEF2cHBzQUd6dlV0bkFvVVFlVUVOYzlRWlBoS05uTWgweUVJSFoy?=
 =?utf-8?B?OGxIU1R1M1ZyakM3bEtCSE9nZGFDL05EcGlBSG5MS0tabncrSnlTU0NReXoz?=
 =?utf-8?B?aUlqbUpuRXRwaVVjbitaWVErcldRVm4xamlFWjZHci9FTDNERTFoRENQOVFo?=
 =?utf-8?B?Q2pZVHd3NG9XSWwvRHpCYVRHL2JpT0duWERzYXJtOFlMMDNRSUZiWVhkWEtS?=
 =?utf-8?Q?fO79Rbo6rxa+4?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2024 23:32:46.5927 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87db9574-93e4-4e43-1406-08dc835c4f27
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8981
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

On 3/6/24 09:27, Szőke Benjamin wrote:

> 2024. 06. 03. 0:08 keltezéssel, Ben Skeggs írta:
>> On 2/6/24 07:22, egyszeregy@freemail.hu wrote:
>>
>>> From: Benjamin Szőke <egyszeregy@freemail.hu>
>>>
>>> The goal is to clean-up Linux repository from AUX file names, because
>>> the use of such file names is prohibited on other operating systems
>>> such as Windows, so the Linux repository cannot be cloned and
>>> edited on them.
>>>
>>> Signed-off-by: Benjamin Szőke <egyszeregy@freemail.hu>
>>> ---
>>> drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild | 2 +-
>>> drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c | 2 +-
>>> drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c | 2 +-
>>> drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c | 2 +-
>>> drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c | 2 +-
>>> drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c | 2 +-
>>>   .../gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c => nvkm_i2c_aux.c}   | 
>>> 2 +-
>>>   .../gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h => nvkm_i2c_aux.h}   | 0
>>> drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c | 2 +-
>>> drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c | 2 +-
>>> drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c | 2 +-
>>>   11 files changed, 10 insertions(+), 10 deletions(-)
>>>   rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c => 
>>> nvkm_i2c_aux.c} (99%)
>>>   rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h => 
>>> nvkm_i2c_aux.h} (100%)
>>
>> NACK on this rename.  No other part of NVKM uses filenames like this. 
>> If anything, auxch.[ch] would be a better choice.
>>
>> Ben.
>
> Do you mean it would be better to rename them in the following way?
>
> rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c => auxc.c}
> rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h => auxh.h}

Not quite.  "aux" refers to DP "AUX CHannels", so, auxch.c and auxch.h 
are OK names.


>
>
>>
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild 
>>> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
>>> index 819703913a00..c488dfce4392 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
>>> @@ -25,7 +25,7 @@ nvkm-y += nvkm/subdev/i2c/busnv50.o
>>>   nvkm-y += nvkm/subdev/i2c/busgf119.o
>>>   nvkm-y += nvkm/subdev/i2c/bit.o
>>> -nvkm-y += nvkm/subdev/i2c/aux.o
>>> +nvkm-y += nvkm/subdev/i2c/nvkm_i2c_aux.o
>>>   nvkm-y += nvkm/subdev/i2c/auxg94.o
>>>   nvkm-y += nvkm/subdev/i2c/auxgf119.o
>>>   nvkm-y += nvkm/subdev/i2c/auxgm200.o
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c 
>>> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
>>> index dd391809fef7..30bf84e77db9 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
>>> @@ -24,7 +24,7 @@
>>>   #define anx9805_pad(p) container_of((p), struct anx9805_pad, base)
>>>   #define anx9805_bus(p) container_of((p), struct anx9805_bus, base)
>>>   #define anx9805_aux(p) container_of((p), struct anx9805_aux, base)
>>> -#include "aux.h"
>>> +#include "nvkm_i2c_aux.h"
>>>   #include "bus.h"
>>>   struct anx9805_pad {
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c 
>>> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
>>> index 47068f6f9c55..9e07ba444ca8 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
>>> @@ -22,7 +22,7 @@
>>>    * Authors: Ben Skeggs <bskeggs@redhat.com>
>>>    */
>>>   #define g94_i2c_aux(p) container_of((p), struct g94_i2c_aux, base)
>>> -#include "aux.h"
>>> +#include "nvkm_i2c_aux.h"
>>>   struct g94_i2c_aux {
>>>       struct nvkm_i2c_aux base;
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c 
>>> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
>>> index dab40cd8fe3a..8709b728c38b 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
>>> @@ -19,7 +19,7 @@
>>>    * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>>> USE OR
>>>    * OTHER DEALINGS IN THE SOFTWARE.
>>>    */
>>> -#include "aux.h"
>>> +#include "nvkm_i2c_aux.h"
>>>   static const struct nvkm_i2c_aux_func
>>>   gf119_i2c_aux = {
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c 
>>> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
>>> index 8bd1d442e465..f40c5709d217 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
>>> @@ -22,7 +22,7 @@
>>>    * Authors: Ben Skeggs <bskeggs@redhat.com>
>>>    */
>>>   #define gm200_i2c_aux(p) container_of((p), struct gm200_i2c_aux, 
>>> base)
>>> -#include "aux.h"
>>> +#include "nvkm_i2c_aux.h"
>>>   struct gm200_i2c_aux {
>>>       struct nvkm_i2c_aux base;
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c 
>>> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
>>> index 976539de4220..736275f0c774 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
>>> @@ -22,7 +22,7 @@
>>>    * Authors: Ben Skeggs
>>>    */
>>>   #include "priv.h"
>>> -#include "aux.h"
>>> +#include "nvkm_i2c_aux.h"
>>>   #include "bus.h"
>>>   #include "pad.h"
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c 
>>> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
>>> similarity index 99%
>>> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
>>> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
>>> index d063d0dc13c5..6b76df02c63a 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
>>> @@ -24,7 +24,7 @@
>>>   #include <linux/string_helpers.h>
>>> -#include "aux.h"
>>> +#include "nvkm_i2c_aux.h"
>>>   #include "pad.h"
>>>   static int
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h 
>>> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.h
>>> similarity index 100%
>>> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h
>>> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.h
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c 
>>> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
>>> index 5904bc5f2d2a..e9c55a57c878 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
>>> @@ -22,7 +22,7 @@
>>>    * Authors: Ben Skeggs
>>>    */
>>>   #include "pad.h"
>>> -#include "aux.h"
>>> +#include "nvkm_i2c_aux.h"
>>>   #include "bus.h"
>>>   void
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c 
>>> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
>>> index 3bc4d0310076..1af64e25d838 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
>>> @@ -22,7 +22,7 @@
>>>    * Authors: Ben Skeggs
>>>    */
>>>   #include "pad.h"
>>> -#include "aux.h"
>>> +#include "nvkm_i2c_aux.h"
>>>   #include "bus.h"
>>>   static const struct nvkm_i2c_pad_func
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c 
>>> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
>>> index 7d417f6a816e..997a5a2146c4 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
>>> @@ -22,7 +22,7 @@
>>>    * Authors: Ben Skeggs
>>>    */
>>>   #include "pad.h"
>>> -#include "aux.h"
>>> +#include "nvkm_i2c_aux.h"
>>>   #include "bus.h"
>>>   static void
>
