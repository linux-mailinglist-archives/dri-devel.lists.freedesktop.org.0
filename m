Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3C1B09C6C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0010710E905;
	Fri, 18 Jul 2025 07:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JKtKugOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2082.outbound.protection.outlook.com [40.107.100.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49D510E8FF;
 Fri, 18 Jul 2025 07:26:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Je15ZVqS3pU1hRagG/WNtdYVqafZBmMjvPBtM2sBmhhsCbMozR76jyAHrwDRGLpZtiOPVrblLRQdLZVCIhSqJjsPmvgIyeGgd/O0DONR3gELA1AF6NgFOerbhgPYdbAt+Vnt5XyQ4sMyVmSeZSAG83rrf2ombmaXPomUqxj2VXvhqN8BfCIeI8Q77AzCLX0IagiuB7LFfAiYUr8QE3whY9NJijMfcoI37S9ul9UxqOHZ5d7J7wtc/gCaZglwJt+vYlOZcj8k9xPOHiwNie1L7T7FcNQsDZtf0buSosM4KEkJndFbLJcGTHS3GGI+dZQDXTrnVoE+oGfLsQGDViOsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rE2XJ/lCaXjknymBSwNxoCFN7Xf2qICqDBy2qezfco=;
 b=Q2rgXsL69IrwN6K+uuCTbIyDjSMtoeBUrR4NwC14YP9Ek2aozzDb9XCqJhnf/3Gc88BR5HBMlXsFUBRXN38ppIR/Ao/n+vi7lskVblsB8IArbEX94UKlDKrWlE3+maX0KJzVrDvnF+eU8jGd/qLpmp+EaP2K5s+7FjAtuNDj0cu8bQk9VBFgzS/2UpVZKleHqTylYTSln+hLEwKdSUs0nSw/r01250RgZVDc7L5sBJ+wRxAy35CCvXRHaluvtOxD/fpH0TQe1hWCL/rRVQU3tGEYtXYHQjoBXmEAwymsM6zD+AyQgNxoxVvlbn5X8WznEWF1aklGgZt/PXh0UMj9Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rE2XJ/lCaXjknymBSwNxoCFN7Xf2qICqDBy2qezfco=;
 b=JKtKugOGmOZatn9DgpqmWgvzOJbpCrCaV7suA1joFjHZIBaEw7PP5n+WkrFRghIs/VxUPJRL6SEDr1ial5p0Gx/XzQLNlw3JVHVJLA43+jZL2SglxzG/3TCLZVFJPSHvd0WgaLjhVP7v1UAW22LkCyMdBBVzaFgUoMLatL3IQHBl4FqUGL1oE8p9kH+92NO0b2GMgSB1XvbwG2VwSKpCRt9MugOkzxIOc2TEk8YgKBQOYZIcYip8hfmWZY+SE/4HSgUqIBVO+MMm3zKSUVNYVQN6bxSFkHvW6wTnMRl1I9PVMRiX9rIAuWjWjLrBgQQnGOOBXJ5QrrTVpDqeFfDkVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:26:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:26:50 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:14 +0900
Subject: [PATCH v2 09/19] gpu: nova-core: register: add missing doccomments
 for fixed registers I/O accessors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-9-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0151.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3dced2-e338-4d89-e85c-08ddc5cc7635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0xYYVJqRHhhbkVFL0ZqclN3ZU8zTXJsMWI4azY3OEpJVUZPeGI4eE1MZnRx?=
 =?utf-8?B?TWxzZVlVaThRNTdaQ0lkNU5PSFpqWW1oUGRQdnhPdXl0Y2NOcXVWODRESm1G?=
 =?utf-8?B?ckMwbEdmeVB4akFPQ21yQTZMUk5EcjZhNExNc2dkWVA5NWYzOURLU25ZZW5G?=
 =?utf-8?B?dy8zNGRxUFlOWjE3TWl2T2RuR1Y5cHRYSUI2ZWJ6R1FIV1VXV01yWWUvNzE0?=
 =?utf-8?B?azRZamJCWWU2QXJ0b3ByY3BVLzZoT09aN2dIN3NoZFowT2ZUbkxTMHdRZ1Q3?=
 =?utf-8?B?QWpaYTIwcXZTdGV0eVdvbzhIcTNoZU1BRWtTZUZreHhsVFJmZ1BicW9Xd2lG?=
 =?utf-8?B?QzY0ZjA0WkZmcjdNdlRZeFhFNDA5Z3lUdC82RFVOdEpYaUhsQXpBV0FCZHVF?=
 =?utf-8?B?U2RTOGhDeVVQWHhwV0tUcGovL0thUW9XeWlvWnZ1aE10dVoyUUhnOXhUemo2?=
 =?utf-8?B?dVhkdUR1NndXSnFLTmJSZlBjU2hCNnhTUjhvTlc3WDdacnVzSC84QTF6ODFo?=
 =?utf-8?B?bHRDYnBUN3lKSUQzQkgzNXdnUXdBaUhmN016dTQvcFlOMGRNS3dCS2c2eE1h?=
 =?utf-8?B?WklZeGwwenprUWhxVXVUOVovUExTKzlvREdwMG1TaC9mNzlMR0pMdVNWekIr?=
 =?utf-8?B?RGhVT0JYQVBXMytidENMdnB6WmRSWXlycUxvNGk0eWNJcHdKbitUQ2dQZngw?=
 =?utf-8?B?LzNtdHpOaytUN2ZOelQySjJNR1IzNlpFcFkrRWdvTWFvVTNIa0JkRkQ4b0tZ?=
 =?utf-8?B?T0VpdkNTcmc0S3RoRDVpYnNaTElKQmtudlZqVUVhaG5IaWFJTzR5eUVZbzFm?=
 =?utf-8?B?blBBUWRGTnVOSzhBLzFteVNsWGpkc0MyUE0yL1FyOXpYeFJmYWFOOFV3T003?=
 =?utf-8?B?T1AxV2FBZkxhYkJ5RFdOd0w0NXpucXJoQmxhQWlvdElEaWdpRFNLQ2MrUnhi?=
 =?utf-8?B?YXR2WDkzcGd5TkhMV3MyYW9LVkFNc3pqaUQvSXZwR0dRd2ZmY0lqTm00VUZk?=
 =?utf-8?B?cnByYlBKRFhRcVR3YkJMWkg4eDdneDg2TUtqc0xXL3dYUHk5YVk2YzhwVTBx?=
 =?utf-8?B?UHlmYjh2OXpDdW5EdytOcUw3V0I2VzdYRUs5Snc2Q2QwaUE4WjU0V1RXMktV?=
 =?utf-8?B?M3FmYWdPeGx6MnU4ZE5tTWRncDJxaWVmMWdQWFRnaVc5YTJhSS9VMVQ3Mm1K?=
 =?utf-8?B?eDlucmY5TVNIelRlYnlkNER2aDFNQnNqbHdDK3RxQkk3RUt4RUxaeXAzWlE5?=
 =?utf-8?B?UjNucWoxcG9LK3h3NnlrZGJURTRSVVJqdk5YM3pKUlY2bnpVbHNaVklLNFVH?=
 =?utf-8?B?bDMwOTRZSjE0SUJKZUFXd1d6SXpwdUY1MzJBdDJUcTlvYnBzaUdCSDJCZVA3?=
 =?utf-8?B?TTJESlNLUVk0OTRiWldEOWZ6UUtWU3d0ZUtOajF5OURJUXBVUS9ieFgyYk1H?=
 =?utf-8?B?MjhWMlo2dmdDRTVZemEwWW9XNkpxQUJvb1BrQ0tQYXJINGJDajJzREl5ek1a?=
 =?utf-8?B?YzZLUW15c0tFUnZCTE93WjZBeUk2LzdwQmxqam93Z3o2ZmRhdm1DN1RCK3Vh?=
 =?utf-8?B?SnRjMnlrUUI4bWZvRDEvWU55bTdyZDJUZXFPWjYvSDV1UHc2elpLN2dDWGov?=
 =?utf-8?B?ZllBTTZzcVBwL3NFdlo1Vmx3enJ4Qzc3akllbGpsMnU4OGxydE5LRWprQm53?=
 =?utf-8?B?Rmx0TlB4Z2RJNkptSmo1c3oxMGZNdjJoOGpTOW0yTmo2UmhOR0lGZlA3eFhB?=
 =?utf-8?B?TEFNSlFqYy9MOWhDR1ZXZitINTRjMDVzSDhSM1dDby9PazQyZlJRSC9ia0Nz?=
 =?utf-8?B?ckEyaG9iSzFWRCsvK3YrVFNyS1NDTjg4L2VhT3JmdHpET0g0ek1wdm9uaGZU?=
 =?utf-8?B?T0FnZTYxeGJaMjhyeHR2N2pWMzNSdEg2M3QyOFhsZ3JDT2xkdVRlV3RDUEwz?=
 =?utf-8?Q?6Hhabg1Sm8U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3FrWVc1c0plckw2TlRwNnJyOWVDalpNeE5Nem1JbkNuWVVWS3Q5dHppak5X?=
 =?utf-8?B?Uk9FQ29oMkF5NFVIak1SNmMzSndNbTR5WUFmRGwxNW56T0c2ZVNaS2wzWE5B?=
 =?utf-8?B?Y1IyTlRFK25jK09wNEJjZWN3WWJ3SWp3ZVFBVFFYek5OSTlRVUhmMDJrb2RX?=
 =?utf-8?B?QVJkbzMzWXNTT1d3MloyZVlKRUVrdlNhNldPMld3VUFBVkZPbFNvODhDUUdl?=
 =?utf-8?B?cWdUK3lNTUJIRzB5K0h5d2RNWlFpaE0yTGltRkdUT3BBa3kvUjY3ODZPNVhI?=
 =?utf-8?B?M1luVGY1ZVp2UHJKaFVVb2FFd2tkZnRybWUvSGZzME4xYjc5dVJvS0VkK00r?=
 =?utf-8?B?VXdoTzhuR2ZkRHVhT0RvTWtkTUJONFVaQ2NLMi9xcFBHZXgvVXhHL1g2cVcx?=
 =?utf-8?B?V2hMeWNDSTVod3A4a0JRc1ppTks0ZUxETml1NnJoQk9PSTJMc2dkeWszbEpk?=
 =?utf-8?B?YURINHNIRTErZWw5UXlpZWFmd0d1UURYT3R5cm5VeDRDWlRCUDY3OWlTYlVn?=
 =?utf-8?B?T1FPRGxaNVFUa3JhRHMyK2lYUEhlUDRnTDBDT2xSdm04RnpkYTVJTXhLQjls?=
 =?utf-8?B?cUpRVUtSd25kejkzWHRkdVhNNzlZZFhuc0JpT054Y0xDUWdtSkNwbldlRk80?=
 =?utf-8?B?STNiVXU1MTRvcTlKZnhnVWZJbS9tUDYyejhCcmxNeit6eXA4WWV3RUlxYlFw?=
 =?utf-8?B?RHJuL2p3alRjSVdCQ3pvbmNSQSt2dWNJWjg5SWdYMlFxRytkNGloam9vTWFB?=
 =?utf-8?B?bVdoZ2x2MGN5ZHpKRnE3WVU1VmxHa1dKaVVIL1VNQ2ZUdyt6TzVlR0FFYlRI?=
 =?utf-8?B?N3NqdVJxTS9BUEIzYVJ6RzdSZDJ2TzdEWmZweURidnRRYk13MDNBZ1Z3dzNN?=
 =?utf-8?B?WlJhVFoxUVdVNDNJSFFUUmdBVE4vbHJMYWlQZjdIMURoTEhzQy9lZS9IWk92?=
 =?utf-8?B?OGNPYTFHMnlGY0NyaEFETy83STd2VVpLcVZGZzNKbzEraWFNeVNoRlBnRzNx?=
 =?utf-8?B?cnVBZG11VXdtbWZ2dlJHRnAyZkV5c1Z5c3ppMndPL1RIVUdCZ3VGNkpQOERL?=
 =?utf-8?B?aW1UdVRtcDBKVUNkVmlWTC85cWhrUFMzNit2dHMyWVE5SG5venh4T3U0QU9t?=
 =?utf-8?B?V2NnZ0xwanpOQW43bkRuT1RnM3FvbjVhOFBaeW5ocmJoek1TbFYrRXdFK3FO?=
 =?utf-8?B?T0hOYkNrVnMzK1FZYlRoN0pXU2ZGaEVKRElFV3hGWHJSdzBuOFZkV0hGdzg4?=
 =?utf-8?B?eHdpWkdYclliNy9ZSU5XUVZ4enBsNitTdlZPVVpWaHhNeHptb0Nvb0ZyTCsv?=
 =?utf-8?B?Uk9JMjZjRW5KcnA0SFFlV0lXdkt2SUZlWkZpSHNaZWtucVc2MjVQWmtWZTFI?=
 =?utf-8?B?V1ViRStveTNKQ2NtYUJaeTBvODJDMHd3VUJIWjNSeVBoM3hSWitaelZmZGdM?=
 =?utf-8?B?NzFoa2RHNVVCeWhKbjVRU0s4a0FMYkczZ1pidDBLMitVSU1TYjE4bWkydUov?=
 =?utf-8?B?SFMzUUd3NWdpb3FRMGNLMm1RbzdRQUhyaWVYVzdPbUIxc2F2dzNGWU9zSzNX?=
 =?utf-8?B?ejNwYlZIb2pXcHZMa1MyeVIxcExuOStjNE8rQ2dIc3RFdzcwcDlhenAxY0cz?=
 =?utf-8?B?ODV3V3VoaUhhbXg0S0trV0NWZno1NjNjNUdOQnhKRkpGQTZYZTIwSG1aQUw5?=
 =?utf-8?B?MzEraENXdjdwZGN3dWJDdFVtM05UYmNpVThuQmZGcFVlZFNVd0ZjNWhsY1Nr?=
 =?utf-8?B?cWdtait6QlBDeWlyWm14T1daRlZhcXFtZyt1NHRLUW5Ddlh3dU9RdDZIV1RZ?=
 =?utf-8?B?dFFLTXBpdlhwa2RTSktSeGhyNnFGYVFwZlBDdkkrY3k0U2VhL0lhR0hoZlZq?=
 =?utf-8?B?cXdvSS9WcGp4b3FhUEFGSjdUWTFzd05NMllzUHZYRGIrQVVTU1VEUUhQK0pv?=
 =?utf-8?B?ME1vZHNOQUpMNUJzek1LcmtHSFdVT2FPTDhrd1dkUWhwQzJ6cExFaHNzaHJj?=
 =?utf-8?B?cG1INlViMFZHdWM3MzU1dVMycGF4d2VoVTRROUxNQUgzMzkxYzNVOVRtRDRp?=
 =?utf-8?B?V0VQQzFrN2d6Y1VIbFVxWEt0NTY0OE0xU21jalRXVk9DY3hmNnZxd0M2M0Er?=
 =?utf-8?B?Q1NIVFhnc0tIMmhva3JnRENqamlVSTlZZzUxK2tsTzRnS0NOYzdRYWpqd3RR?=
 =?utf-8?Q?L82JMzrcwgAp7bQAEKc7CxGJCYcQhA6y0IdaVoLWB9sF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3dced2-e338-4d89-e85c-08ddc5cc7635
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:26:50.6397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7Pfen6HctTf64yrT9lJyMm09r8V5tRd36XVIHbazfYD4uqx2cHbu7HbKHfXKYxkbLoWKVBnSG3qaPnWvMquQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
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

Add the missing doccomments for these accessors, as having a bit of
inline documentation is always helpful.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 32fbd7e7deb9edeed91972a373a5a6ac7ce9db53..0a18a0d76b2265d3138f93ffc7c561b94bca3187 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -300,6 +300,7 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
         impl $name {
             pub(crate) const OFFSET: usize = $offset;
 
+            /// Read the register from its address in `io`.
             #[inline]
             pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
@@ -307,6 +308,7 @@ pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
                 Self(io.read32($offset))
             }
 
+            /// Write the value contained in `self` to the register address in `io`.
             #[inline]
             pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
@@ -314,6 +316,8 @@ pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
                 io.write32(self.0, $offset)
             }
 
+            /// Read the register from its address in `io` and run `f` on its value to obtain a new
+            /// value to write back.
             #[inline]
             pub(crate) fn alter<const SIZE: usize, T, F>(
                 io: &T,

-- 
2.50.1

