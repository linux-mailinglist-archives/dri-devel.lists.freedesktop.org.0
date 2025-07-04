Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363BBAF8951
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DF010E958;
	Fri,  4 Jul 2025 07:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cmw2t3wp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADBA10E958;
 Fri,  4 Jul 2025 07:25:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZLvrcPw50/ieXHYY6Gq7bAgXkhoUE1Ml8EidDoDKxwD04Icl3xuREXvalAeFBoazvH3Sl1Qg4ktwyEKQ1tkbFp6s+z4A+DH5MoVnh34yWrUYgdMUW4x/giUsvdg/1V8k6Nro1JkQb32n+uAJ3Q2SssbyqGUjsjVX3Ktj5e38vIvlvGuyAOlXDSbUTALslmY0KTPt1D7rNAWQsDQVBxTUGC273STB/q9nuq9hqrogmLnXeWF9mzqGJqZclMHFOg5kJ9jb6X3IOKSaV9YyFVx99z+ZL6PsxgzF1ni5whfh1fUUZ7UCveRm9YniuK+1vx2e91eOeE0K7KZScIaYzw3kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xlXSAGH5wcZFDNNhl5nr9QU4ZkcQCxst11iIsA77kE=;
 b=M8OW7Hc78F0WhQHqUWfwirlkq6ybqc9d0H1ifiuxnbaODmMNg+ut32msc3qIalQwPUO1LOoT3vzzcMk+TtyP4MzF6rZAhxXHgbFMogHAmb3v+4xYejjjL2GaXlt9tWYpxZHNrFLhAMcJTvnCEl66gcZ1HU3Jk54xqAOnAVLo5H0iYjnFVvsPVoQw531Ah7l+QvE73N8Fmx8jb9TgqZsCt2BGgNyYOkqrkmwpfS/DrZ9tpxDQAwcx9buFmIUHompuYLYZJrrtyN5vrjdoRZ2jT9YgkVd4FkQmRa1iUKrzPbhuMUnkyBS7H1LXPItga4Gearhz74V2u2dtRouIqEjgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xlXSAGH5wcZFDNNhl5nr9QU4ZkcQCxst11iIsA77kE=;
 b=cmw2t3wpMKwk8MY9LkRfBRl1160erXBDnULmUIr2EWY6KuvBSU02Ot6vw4YFxuo5iT85cfiJr38Zu/JtmnGeeICs9XoHOj7O3hTF0+QK344iSQoJKcgtxbtCuXYdFbNSMO53gr0El/VSG8nuI2YEWu8Lfp/KbJ2+edTf8C9f7wnbQZ2bUJWlI80m1WngD4VfoYGFpQIbxii4gedkWP9EXERWt4I9dGXbS7L7G3uAOD6Y00tyvuq391X5TpHv00NSDwhvaQm92hpT/95tl4CCrJw/AcHUaLfftLa1Ls5rb67l+iDVA/hwPWqsC2M2BinqRyXhy6VIOOb5bJOS+ttDvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:25:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:25:56 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:11 +0900
Subject: [PATCH 10/18] gpu: nova-core: register: improve `Debug` implementation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-10-f88d028781a4@nvidia.com>
References: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
In-Reply-To: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR03CA0016.apcprd03.prod.outlook.com
 (2603:1096:404:14::28) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eff4b6f-8268-4c6e-ccb2-08ddbacc0412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlJmeHpPSXlNQ3hrQW5HblV1VFFVdXZzT3RRbHpORlh2WnBOK0xZT2pIN2pX?=
 =?utf-8?B?V0JVUFkyclloK3hvODBMUks5T09aL1FESlVKcEhlQllwTzVVUjBlN28ySjhq?=
 =?utf-8?B?WE40VDN0SGlGbm1uOWFiY3hiT2ZtNXhpbnVYcTA1UTN3Nk54OVVFY2lDNWlI?=
 =?utf-8?B?N0QvaEFYY0UvZUd5ODJDSzdieTNZY0hkMUFGdmJFazR2MWF4djB4SFhUSlZh?=
 =?utf-8?B?Z2JMVG5xWDZQOGxZNXdhVGJTTnM3U2JzVExUUERxZEt0Mm5qUExIWE44QjNq?=
 =?utf-8?B?S3IzcGxOT3M2R0l0OFJCdFpiRmNBR0FVMXBVTHJabDlrVjZXZFM0Y0NIVk1B?=
 =?utf-8?B?Q0tzTDRIUUp5Q21sQVZWR1JMRi8wK2FmNWVwaUFIMHNiWktOVFFyS3RNUDJO?=
 =?utf-8?B?VzRIaVdJRlhFVHR1MXVTRTh4Z0FINHJLRVZiVmpVbkxGdmVERklFNzJVTVRs?=
 =?utf-8?B?Q1dSdU1xdDhkZXlzYzd0M25raFJOenBZNjMvQURpU0RoUjZnQVY1bzI1d2xF?=
 =?utf-8?B?eDlYdGtzU1dnNXR0OEZOcmhFaHJxVEFwSDVxYjdEbFhzYW05algxL3YvcktN?=
 =?utf-8?B?ekRScTVmcThVd0FWck8wMXlEUnRzZ1NXdTR1OGRqVTdubEF6YmJ6TU5KaHo5?=
 =?utf-8?B?bTlGTEJkQlhGSkNtRmM4R1ozKzdqczlkeGNxWWlyM3RnTzgzSkdLdEc5OG9T?=
 =?utf-8?B?UUhnajRtS2RvUWprc0k2bWR5LzFGSktJVS9Rd0V5OTFwQ0Y2VXo0R05OU2I2?=
 =?utf-8?B?blFXQzltSW5KSjI1ZnVrUExUWTFqYUlFWENKR1FKaUNHSjhQeTVaUGg3YjNz?=
 =?utf-8?B?YWdaQkFnUDFWczlRaWt5YW4zVjJUM09oc0RoUC9oS0kyM1RoeDZSbGlITXBK?=
 =?utf-8?B?c0YwT0hvTWF3bWg0aDQvZkpMVXhBMlNOeDZSWkUxNThJSk1QN0xBY1V0YXpK?=
 =?utf-8?B?ckp6MVVIeCs3V0dqemcwbk5UNTQvdWUvdkdvZFVhWWVBakFBVVZlTWVjdnlM?=
 =?utf-8?B?dVhGK2dyYXBucFFWd1dLeWgrNlhWbzZDNGhuWlZjOHJVenMybzJ2MnI1QnJO?=
 =?utf-8?B?NWs5cGJrVkY3dU91QXhsUzlaZUp3N3B0bFY4N2g0ZGtXZW5qTnVCMlZNWUY2?=
 =?utf-8?B?OGpHT25HeVNVVjVhTElBSlZoNjl5YmxOVG0xcFhwTGd0R3duSlVtS2NESkZk?=
 =?utf-8?B?R2NpeSs3Zm9UekdOenpreVRXdDYxN3NtR05qRmVKaHMwQytOaXFzbjgxS1FC?=
 =?utf-8?B?VXFqeFhtMFRDTTVWOW1Tc285Y0hjd3I1bG9CTkxraHBMUFY2RDNsZkRYRDgw?=
 =?utf-8?B?VWpvcFBkL2I2RVZSYllyRC9jRUx5a1RvS2RSNDRvU21CVVZxR2tHRVhFdldO?=
 =?utf-8?B?aFlXNzlvbVJvVE9MUW11bmxYaUpGSTE3b2x5WGY4Q2Z2TE54aTNVVWkrSThP?=
 =?utf-8?B?NjNrNUhFN253a29wZ1V2aDFVRmNQOVZ0cnZWeDhnSVRTYnVpaWhnRmFPdGhI?=
 =?utf-8?B?SVJtR1RKcU1wWW0yb3dsanRhYmsvNWRDbFRMSU1XN3JSRmFXeSs5VjdsZVh6?=
 =?utf-8?B?cGxHaytoUHNNeVVoaXE3Q3BkOWdwNUErbVpTeWFOWlk2R2ZTTXFVT3RkVnht?=
 =?utf-8?B?dDBUZjk4Ly95OW56MzkwamFrNzYrL3MxNE1lcC80eTBoM2JoNCtmWHRKUHVm?=
 =?utf-8?B?YjJHN0M5amd6UkVoM0tkbUNaUDBpdEE5T1gyZGxqUVpDMkc3LzU3eXY1UjBt?=
 =?utf-8?B?ME5rZ2lyWkU4Z0YzUUtIbERVQzZ4dUM1ME1TSXV2dktSZFpDYWtsTnRJWGJP?=
 =?utf-8?B?U2pzT1RqbUl1UWM5elpZYkZnUFJJWVRFajBRbFgxWHpxSW1ncUIraGI4MzM2?=
 =?utf-8?B?VXc0dzhXTEF6Nmp3b1Y5NnM2WXdKQXdHQjZTcm5yYXBVSmhrUXlscXRSQ09a?=
 =?utf-8?Q?eASKEqQ74ks=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUF5dENUL1d1RVIxcS9WdGRKMHhVbGoxVzRaZHcyM3k4UFVCOW9HWVVqZkU5?=
 =?utf-8?B?dkZxNG9iV0tKKzdnNzJJM1NhblZNM29HSGxJaWVoV1JCUGZVanBCcHNpWm52?=
 =?utf-8?B?dTFHTjNUYWpkRnJ2dTEvREkrdG8wZnAvWUV2WFE4cC9vWVkrd1hWWnJuTW5I?=
 =?utf-8?B?b1hXMXRzQUpMY1ZWamlNR3AyMTBjSHdlbWU0dDRTOGVJdnBGUU5tcXZpVHcz?=
 =?utf-8?B?dlBIRjQyblpXQ20yeXBBU0RHUTFGWHNUSzhRVE5JT01vQjdnVGk1WStuaTBD?=
 =?utf-8?B?S25MU0JtV3lDQmZ1ZStwbXNBenNUazBzUS81cHRleFU2S0NtWGVDYXJ3UHZV?=
 =?utf-8?B?bmpES0xOazdVQmFXSzhzRmdkZ0pXY3dCRHFzOGpGT3ErRXc3Q2JNRE82Q1dL?=
 =?utf-8?B?Wm5VbnRpWU04S2VuMkR2Y3BQS05ZejJ1TE5EalA1Z2pZalBjYlNTeFl3bVZX?=
 =?utf-8?B?aE0zR0xrWWYrNkdrME9MOTZOUlFUUGtLTFdiVExEUERwNE9EcXlxSHhLS2hq?=
 =?utf-8?B?ZXE5Q0tiNTlpS0VmVTlJLzZQdW9uSUJUeHRQbTNuMmxZWFFIci9wSGM4RmlP?=
 =?utf-8?B?YzJyWVQ1eVhBMXpuNGdvK0tpRUxvbDdhckVWalpYSUoya3h0R0JtZ3o0dDhu?=
 =?utf-8?B?N0ZBNkRzSFRDSjkwM3Bvb3pNUFZWZktCeEpYS255QmtrOUhMOVdLVWszRE8x?=
 =?utf-8?B?TkJpM2tERXVZYnVFTkc1aDJwNEpNblVZdTUzSlNYWmErL2Nhb0F6dW5XWi9B?=
 =?utf-8?B?dXVHVXVqbyswanNWUGFyM1AzY2svbVpzMDBDcUZERXhQTDhiY2lydDVDZjlK?=
 =?utf-8?B?TVErRXNuZ09zNVl2d1l1R0ZJVDdPaFNhZkpYeEtYaTNvOU1tV2JCelRFay9H?=
 =?utf-8?B?b3loN21jTU9pLzdQSXRXc0wxS0NOQ240WWlHRThvTG5xbk9HNnA5S2FuUWpE?=
 =?utf-8?B?d1JiYndZbnhmdExqa3pReG5lQTJpT3V2M0w3alZQRTdseXBIVVRwdmxHT3Zj?=
 =?utf-8?B?SkNjcUlHNEZyNGZYODh1dXZoMjlZWmNCZzZVTjBBODhRaHhRSXdYN2ZhOENs?=
 =?utf-8?B?YUJqY2JCcXlCOHFqSkVseWZnYTczUHNzeGlzdC9IVGNZb2hqRjNoRk45UHZJ?=
 =?utf-8?B?blQwenpQc01GSmhCT2hNZkZRaHZXZU94VGVFWitDaUY0LzNlcUsva2pzVGh4?=
 =?utf-8?B?MDd6RmlNSkhSWnZkaEhuK0xiRmJwNGV4NkdWRWNjcXRrZkMzcno5bmhScEhJ?=
 =?utf-8?B?cmtjdWlrSkJpakFLKzVxaHBoQXdlVzJwdjk1K0VvMjk4ZE5tN2JlekdaM1JP?=
 =?utf-8?B?ZWhwYnpVYTJYNlJGMTdQc1VlZHNzUFJoYU5obXhmTE5RT1NueDVyaHVDTUpn?=
 =?utf-8?B?RXZ0QkFISFVZMDdnT05oemNVS05RS2FQYURGZU9rOEFwNTZFWWptdjRWYjRz?=
 =?utf-8?B?ZHlCVnN1VHhRa0N3Y2thV3ozd0JwSEFzOGlsdlNMVS8rSE1zT013Mm1yWlZ4?=
 =?utf-8?B?elpvU29xM1V2YU5vV0FhWjhXU0tWM0lEV2RnWnBoRjM3WGR3VWZpU2sxc1Uz?=
 =?utf-8?B?WmhBczZHY0RzazMvT1ZXU05tZ2NXUEVzUkdQWjlkaTNhN0NjYmUxK2prQ2tQ?=
 =?utf-8?B?RmE4blBKdDdUdUJTdk42QjBFblhBWThJTTcwekFVMHAzM3RLSEo0NVpwSVY4?=
 =?utf-8?B?OTRRR3pLY0VjUEJDT0pPT1JvRlpwK3Y4TDI1WkVDWUIrMThZdjQ0ZzU3cUJ3?=
 =?utf-8?B?WU5RZ1VhSEhkZ1Fmc2NqZmVJdWQrb1RkejJHdlFRMWFSUnc5NFliTmlqZ0Zh?=
 =?utf-8?B?Z1Uzb1pOZGo1d2JPYkk5SnlpVUE0WUEvWnJGWDRDbmE0TWNyc3pTWWNKZUNO?=
 =?utf-8?B?NU1PNm5uMURwbmZXN1M3amE5QlpPamJGRkIwWWZnWnpnVUxzT0dUV29KYjJK?=
 =?utf-8?B?L3MrSTQ1T1B4ZndIenhBTUN0TFNNNk9WOWw1RlM4bjQwQ0VRYStPeHF0bGdp?=
 =?utf-8?B?UFpTWHBVVG9MRHhhWGxQV3kvSFgwLzBxbU9UQ2dEUGQ4V0pGa1UxZlJLWlpZ?=
 =?utf-8?B?UDFjZ2lBbGZhNm5HTWFJYzl5VzFoWTVzQjF3V0MvUnJTdDR1bk10YjJtbUpW?=
 =?utf-8?B?WXRjOWd5eTJYbjkreG1ja3dXdmpQWURUS0RsVTBLV3pvWlo0a3M4c2xYQzds?=
 =?utf-8?Q?ykPT5XBs6QUHT9I02rFimQRimRU0LgCZXkyNbaxrhcji?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eff4b6f-8268-4c6e-ccb2-08ddbacc0412
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:25:56.1876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdK2JS4/ZJfbKp4mVnYVkIWZjq1sH07f4k+IVUTCijkf/CgCpY9D8ANsrQtLwAPb0hoqC6Fwfw6S0Hzqx4z2ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
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

Now that we have an internal rule to dispatch field information where
needed, use it to generate a better `Debug` implementation where the raw
hexadecimal value of the register is displayed, as well as the `Debug`
values of its individual fields.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 1d473ceb7b97e18e36246569abf0bb04e7b02060..75b7b742b117240543ad292fc69e5e1341728174 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -122,16 +122,6 @@ macro_rules! register {
         #[derive(Clone, Copy, Default)]
         pub(crate) struct $name(u32);
 
-        // TODO[REGA]: display the raw hex value, then the value of all the fields. This requires
-        // matching the fields, which will complexify the syntax considerably...
-        impl ::core::fmt::Debug for $name {
-            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
-                f.debug_tuple(stringify!($name))
-                    .field(&format_args!("0x{0:x}", &self.0))
-                    .finish()
-            }
-        }
-
         impl ::core::ops::BitOr for $name {
             type Output = Self;
 
@@ -171,6 +161,7 @@ fn from(reg: $name) -> u32 {
             ;
             )*
         });
+        register!(@debug $name { $($field;)* });
     };
 
     // Defines all the field getter/methods methods for `$name`.
@@ -316,6 +307,20 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
         );
     };
 
+    // Generates the `Debug` implementation for `$name`.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::core::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &format_args!("{:#x}", &self.0))
+                $(
+                    .field(stringify!($field), &self.$field())
+                )*
+                    .finish()
+            }
+        }
+    };
+
     // Generates the IO accessors for a fixed offset register.
     (@io $name:ident @ $offset:expr) => {
         #[allow(dead_code)]

-- 
2.50.0

