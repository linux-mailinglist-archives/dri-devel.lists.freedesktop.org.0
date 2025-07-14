Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C0BB04973
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 23:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2022610E4EC;
	Mon, 14 Jul 2025 21:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D4B6z2ip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8040610E4E6;
 Mon, 14 Jul 2025 21:25:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pg4Ltk+bKSnF/gEM9jRtJb74guslMyfuKAoyZviUYRVafxNb7mkV1VCm3n54S631qk7emiGNrAQCOi8s5Tpeiq8s8YkFDCofXJ21spHtoZ4Hp6zJOhARGzL/sOYMCdCYG6TdPzYcAOKexVmtuzIboZeODUHhe7GqHm16eVwzv+I/8SE8c1HW9CzlAWlFUJb7D+Pu8qPsnkJNA2ximt+NZndO8c88R4n896E++tkwzUcGRYnJWg7/GKjcSvcZGDVGu5KkLhHEjlW8L4i9GI06RyHIdJJHJWqPW1/2dgbI5Fp7Ts5MhM29B/YFkkMtMkIAh6zsOehPZdpo7EOqrlK3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07+LlyG6D2wBmBxf5XYk4DQeOVpMSSc+9PKP3/Py6Mk=;
 b=RM9Dl2WA0bqOBUQ+Q4jwtj9P3nwFhGpE7ysf/SKJNaFbXDJ0gay8gTXyD1sNeUL0NKYBvyTcA9XgQGv4NKHO6NzXGcf41aBNtlxCfuNwn1J6KfBOsqkAFjBykru8UGoJNTLsj/5ntDfjsok0DfGk46l0hhPc7LmIQq6Sk+s6y0T+o8NP1zfaGCrXBvuOV6oXOtRQpWigNANr8IeiYreMR/XQ+oB8wooP6+cSTLpNXy675mY1MLSgGk56v74DW5ZGTrd2YiDo4/1ku7Bl/QttyTGMiqaoPXqi2w5IBogtCwZBrUtf2gHGn5+DL55USTLV5al7oqCRdmRIosuMdB6tCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=darkrefraction.com
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07+LlyG6D2wBmBxf5XYk4DQeOVpMSSc+9PKP3/Py6Mk=;
 b=D4B6z2ipKR/ZRbCwFptWgu0Hzbmp+eQ50k6FwIigPhHcbj2G2Yft4F0dQo06l+2wyn7Mj7oCjqM5LShPEAH2kbep/7i60ncU0GhX2rkqGm4BpOcm5cEFynKByjAm+erBFMaihpcm+KtMtzLI7NqFPkDU2vWy/C//XGYtrqqJhkue2pnK5iIpQ9U9Om+JV5A1+tXAlFIw75/juvc1R8uTU+zKaoHrfg+7Qhnusky05eaD80jdbLs1OzxHO5w1BYnZXs80lYGkcjagllipERJyz3eAWndgBPegwJvYnmL1Aq+RwSvoN+k+pv9b9zabXPQhcK1ItmciBlti0oGfqeZZSA==
Received: from MN0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:208:52f::34)
 by PH0PR12MB8173.namprd12.prod.outlook.com (2603:10b6:510:296::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 21:25:38 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::c1) by MN0PR03CA0029.outlook.office365.com
 (2603:10b6:208:52f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Mon,
 14 Jul 2025 21:25:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 21:25:37 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 14 Jul
 2025 14:25:23 -0700
Received: from [10.2.181.66] (10.126.231.35) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 14 Jul
 2025 14:25:20 -0700
Message-ID: <d82a8e9a-d111-4599-8979-58a2e38cb59e@nvidia.com>
Date: Tue, 15 Jul 2025 07:25:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Remove nvkm_gsp_fwif.enable
To: M Henning <mhenning@darkrefraction.com>
CC: Timur Tabi <ttabi@nvidia.com>, "kherbst@redhat.com" <kherbst@redhat.com>, 
 "martin.peres@free.fr" <martin.peres@free.fr>,
 "faith.ekstrand@collabora.com"
 <faith.ekstrand@collabora.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>
References: <20250623220909.7591-1-mhenning@darkrefraction.com>
 <20250623220909.7591-3-mhenning@darkrefraction.com>
 <c3902fcf8bc963cf315e9bfbb9ca4c66e28857cf.camel@nvidia.com>
 <CAAgWFh05pj_9rk7Wcx24tFWR2sgMZH4WtBsm3hYrqM3svwniOQ@mail.gmail.com>
 <127e866b4bb4fd3a77e1cbfc5b709bcb2533c744.camel@nvidia.com>
 <CAAgWFh2vZt7Oay0NGs4ttSTdJ5oP7qv+wWeRz0MRr=L5LeF8JA@mail.gmail.com>
 <3c368bab-8f66-45f8-8b07-b8e62d43c8a9@nvidia.com>
 <CAAgWFh1N1_j+jXpMm+fcC9tPTs99QKACb8Ox7mph=UWx28zVjQ@mail.gmail.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <CAAgWFh1N1_j+jXpMm+fcC9tPTs99QKACb8Ox7mph=UWx28zVjQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|PH0PR12MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 2229b394-3e9f-4c2b-f76a-08ddc31cfa33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nkg4cmxBNkdObWloelJRd1Zza1NTckJVUXE5a3M3SHZzc3IyRHQwbENvQ0or?=
 =?utf-8?B?eUhQS0lPWVJ5b3VCcjMxTzJGNDcrZTJKdmphQnF3Z3JYS0pvSGFIbWF6b1Fw?=
 =?utf-8?B?OThUMlI2V3doVWhxcnh6QldQU1ZhK1I0YWNFWFVkVXU1Y0JGUjcxdE1qRGFk?=
 =?utf-8?B?dmxINzJnZmwvRzlUcFBaYi9kTTV2d3ljSkY1V1JXR2FGaVZXTlNLUG5GRXBU?=
 =?utf-8?B?bVFKc0pMWjNaRkp0dmladUJ4RXVxSVdxVFhHVUNrOXgyeER4Wk44Ry9YbHh4?=
 =?utf-8?B?eUd0cysxSnpHV3VJL2x5WjcySE5udWtPWnJnRnpKMFo4ZHMvZDdYbUpXTFVY?=
 =?utf-8?B?TkUyK3NPMVIzQzlDaWQ5YjJ2T2lONU1mcFlLZFVyQnFHVmp1M0xnbm91RHhF?=
 =?utf-8?B?U0ZMQU9HYzQ2aVA2N2hiTmJDei90YVc5LzV2dWtBdjZDNFE4RS95N2c3RjNQ?=
 =?utf-8?B?dS9sRXNCQ0xVU2tWT1psdkNPMVMrSnQxTWlMajVXa3VnZFlWVVgrdURDb1hl?=
 =?utf-8?B?aWZ6RnB5dUxuQXZMYTVZeW85RUREUnE3Y050V20zbzJpSjZCeGtucVNjWHRD?=
 =?utf-8?B?Tld2eVdMbDB0djQrdGFldktWOXRVQ20xRzFlQ0ZLUFRzeXk4a2VwSGcxOEkw?=
 =?utf-8?B?ZGFKcEFYNExaaFM2dlpBMmcvOTVMc2Jya1dBd0hyeWg3U1dUT0RVdzlWaTRB?=
 =?utf-8?B?bUdxN0lxZFFaZEdCRytkcDZqcnF6QllSU09kdVNhLzJPUEt4bTJUanVDczFP?=
 =?utf-8?B?SzZpU0JMUGprTXRWaGVNUzZqNG81QlFyQVVWYllRcmdPbzJNKzkxdThaNG1x?=
 =?utf-8?B?L2xXeXliczROYWp4Y2g0eUxIRURJK2x3eTVmeThDVk9ZbzBaNFBtVHhvZnpj?=
 =?utf-8?B?UkJQY0I3dytMZEt6SDRlTTE5amVtanBKcndIUmZFK21Qbm42dHl4aFV1SmMz?=
 =?utf-8?B?eHJIR2VqeHpMa1BlclZld0ZYUXBtNzYwQ3dtNUpvRVkzaitybFRqclQwaTlS?=
 =?utf-8?B?OFIvK3hTUFhuUW1yNVVXYUVkMWNJR2hhN25GUGhSMTQ1VHVNR1VIdWhWRkVG?=
 =?utf-8?B?UmtZTEYrSy9KUG1sbEF5SnZPRG14U3pCZ0hwTVBaWitkNEtmditmdk92UHFz?=
 =?utf-8?B?WmsrWm9qU3Jickh4MmE1V2MvV1ovNnZ4Ty8yWDJJTzNVYy9EOExDMlI2M3Ir?=
 =?utf-8?B?VksvZnVUamEvVXRQQjlPby9CNFJkQmdYc2xJQnNxejlVWSsvZXJveExKeTR6?=
 =?utf-8?B?dE5sR0V0NHFtZjNQdlhMallKOGt0SGZGZ2xsdll6ZnRWTjdRTE5odDQ0NXVN?=
 =?utf-8?B?dXN2eHpiMUJ5L2RNOGIyNE5PNVpqNzhXQTVKTVY4YWdFd2dEMngrbG01WEtG?=
 =?utf-8?B?NGNKU25sczBiRER3QjJJM21UNCszOWpoeWdoOHkrTmlaV0xMeXIzK2ZpTzhD?=
 =?utf-8?B?TFplWmo0NHBzOGZvRzExVnZTc010NTVyN2x2WVhmcjNrVlN4VEtrNEJOTStN?=
 =?utf-8?B?VysxVm1pUGZEYUJiNVNuR21BVFBORXhTWDErekdwT2JhWWJweVRoaXQ4L3A0?=
 =?utf-8?B?M2hkTXhvcExjL1BzaDJGNjdsRklpbldpUXNGK1dyWEFuY3NaSUlLcGRXNmQ4?=
 =?utf-8?B?b1ZJczlTSlZYRFBPQXo5TGhnWnBJa2V2WW9OQXc2N0ppZWxWUDhDMUdhcDFD?=
 =?utf-8?B?Y3VGaTE5QmcwN0trQVB2cGxHNkh3YzhqV2pEbys0SDdETm5IYTFaQ041RFJF?=
 =?utf-8?B?UExFU214Q0FPTjlCd3U1NEdpQ09rYituT3hrWHN4SFRFL0lPeUxhdkNEMzFz?=
 =?utf-8?B?NU9hRFB6NENKVkg5VXMvYkgwVDNrWCtjMGZ2eWNPbG1XTnlsTENBYURtZ2xy?=
 =?utf-8?B?RmZ2L25iSDNKN1BzcmI4dDYzdTMwL09QOG1RcmVtdFdPaDNvOWczU3RQRndp?=
 =?utf-8?B?OWRsQTJqN0VNRk02bWNwT1dFZ1NGY2ltMzRYQzlKYnI5eWJuUFpXSGhBa29Y?=
 =?utf-8?B?V1VwQUV4VFNCV2RLMkN1cjhZTXBUd3g5UVJmNWVxVUVuMXVKWVNuU3hvalJ3?=
 =?utf-8?B?S1NJOWxFM3E2U3lJUXhlV0txU0gyWE9QRS90UzRWTGxtekpSMHo3T1F1T2Mz?=
 =?utf-8?Q?cpiA=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 21:25:37.8835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2229b394-3e9f-4c2b-f76a-08ddc31cfa33
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8173
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

On 7/15/25 02:04, M Henning wrote:

> On Sun, Jul 13, 2025 at 11:19 PM Ben Skeggs <bskeggs@nvidia.com> wrote:
>> Yeah, the GPUs that don't support GSP-RM can't hit the code that used
>> fwif.enable anyway, so the series should be fine as it is.
> We're actually talking about the reverse case. That is, on Ada what
> happens if you set nouveau.config=NvGspRm=0 on the kernel command
> line?

The last entry in fwif[] for GPUs prior to Ada is one that always 
succeeds, and sets up some minimal GSP stuff that's needed for booting 
the pre-GSP-RM firmwares.  Ada onwards lack this, and the driver will 
cleanly fail to load as if no firmware were present.

The error message could be better for sure, and you can just add an 
nvkm_error(&gsp->subdev, ...) after the attempt to call 
nvkm_firmware_load() in subdev/gsp/base.c.

This should work fine without needing to add any kind of "needs GSP-RM" 
field anywhere.

Ben.

