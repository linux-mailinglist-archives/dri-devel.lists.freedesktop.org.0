Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1027EB01A3A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 13:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C65110EA1E;
	Fri, 11 Jul 2025 11:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MqMuuRGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709A710E276;
 Fri, 11 Jul 2025 11:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wn/SSn/wtSnJqd9oOmxoBzq2wryQd3aGwk5uNAV8p1W6mLK0Xl+K1qb5AJZBWS8Kjl0+Shru7k0Ttad17RHDmbsCqufZyxbHF1Ia+MjPDgAPRZ5fsv0Rml1iWbJFQzclRaP92/Ce4EoVLCxU6qjLV5Gg5dP+8IIMx5ejfF4tgaDDth2QgzLR/YaWKlKK+zNRiYo1VM00E4APCYvZ7E2Wv02WkPc/Pi26ZcfT2kFFzqVbxmK94944JQ51eOtYgqj0OwGL64NpF8MZeYn6Eo+yqRnWAPlU8XLVE4K6BTKLvhWyZYVnjFm6fL7Mj+FHC22stKYjE4MnqGDHyVNyF06WYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzygc3rHJXRUz1qWtgZ8lxlMJqr3cUl/nfkyN0Y+ems=;
 b=ePLG9KpATxS3IPHxx+0M54aktd4Ulq1oXkRcz9dwMXHtcgVbGgZU9oNbUBTpyy2xfURjj1207HTjDW08+5Ah1t4kMPaEt942tN8jVFdweDcqMoQi2AGux0FjdtP6BQIIRqLFUGnoDSuZNwfcOMf4QB0wz13AM3GBK06LZdoxVVm74IH7BXKqnMKks2duORSVFVt/Z/DZcY/oF/sNrFnWcZQbHifRXiE2JPxJikpCPsPvBAqGNh9nWgYjii4sZelZK97E1d/tBPG6dO5WhH8UBEIO+rJuOKplKQ9eymlik5KuHumB4DNDe76LtXDffr032VELxdoolkUJ7kT7oU+qHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzygc3rHJXRUz1qWtgZ8lxlMJqr3cUl/nfkyN0Y+ems=;
 b=MqMuuRGWLOu0h1Jr8MVc762sJ0B6HO3MwY43PBKwu0wrHiqQwUbsdsx+ri11r9CSdK+C4YgINChq8XJIVhWkVEo3BT/XIIxWa82h+IXDha90mfwNQ47xsD86hKH5s+yQW58ZKHzKHNquxdwJ4wz/dPRmo0YSTjBk4v081vR9kPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4360.namprd12.prod.outlook.com (2603:10b6:208:266::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 11:00:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 11:00:13 +0000
Message-ID: <f46837f2-bb04-4113-8d82-1701a4d45ac3@amd.com>
Date: Fri, 11 Jul 2025 13:00:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] Revert "drm/gem: Acquire references on GEM handles
 for framebuffers"
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, torvalds@linux-foundation.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk, kraxel@redhat.com,
 christian.gmeiner@gmail.com, dmitry.osipenko@collabora.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-gfx@lists.freedesktop.org
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <20250711093744.120962-3-tzimmermann@suse.de>
 <aHDimRgOz3VPMw0I@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aHDimRgOz3VPMw0I@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:91::27) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4360:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1fc295-1b69-419a-9ac3-08ddc06a1c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cW5ST3ZZZjBvMVdLWUtrSmZnV0FqTGxLaHdRaWNrQWY1VFU3TUJrMU1WZUhr?=
 =?utf-8?B?TG15NUcyV3RJK0sySHBTS2tyRWtVaVpuRjhkdlVMZTNGMEtBTWcrU2c2cWtv?=
 =?utf-8?B?ZE5jU25BUmxtcWpubk5ldjh3Y0ZCZWNxN05rZzMrL0h3WHpYeTV6M1J4VE5l?=
 =?utf-8?B?ZUFOdnR6M2tGVEIyc0E2bC93ckdrNTExcUJPaEkvWm9kYWdqT0VxcEZ2dTl0?=
 =?utf-8?B?Qk1UM3p0cXZzS0ZWdVRmUkdBWG54dGV0UHdiOWxlR1JtUmZQa2ZqRG5URjJv?=
 =?utf-8?B?MXRNYmRZNUMzRDJaeG1HcFp3M2lWemN2VHpPNFZpSlZpTGRuQ3gwS0VTTXlH?=
 =?utf-8?B?VmFHYnkvQVV5M04xdjRIWHFxeW5IRVZpbWYxNTFUbUlhRllFMWpFdzN6eklY?=
 =?utf-8?B?MEdBRlhnWmZEa0NVOER4N0hGRmVKYnVxMW9DR05kMitnbnZqMzNxNmlrMWd1?=
 =?utf-8?B?Y3BMUDc1YW9rbkQyK3o5djBLc2I2RHBNNWQ4MTBFQ1pOd3FqU2l0RS9rdUxm?=
 =?utf-8?B?VzJrUFhSa2F0eEkvbWFIQ2lHQ2w2QUtpMEhVNGJGSFdxc0laaVlRUVQzT2tR?=
 =?utf-8?B?R01zWXpyRlZnckg1aHNNOWVlZnRLQUdkZmJLRFlYaGVDeGR3VHE1dEI1STdk?=
 =?utf-8?B?RWRvbEw4UE90ajFqNXZaVkUzYTJsZ3dhR2dQZ3VMWCtGTVRpVmVhMW9iMUsr?=
 =?utf-8?B?QkJXY0l0MDJFY25VaFluS25lYUJwZEVWbW53MjgyTCtMSEFrSkY3SUdFUk1Q?=
 =?utf-8?B?ek5oSWgxN05LcnY2dTlML3hrbGY4cWljczA2S2dpQUFJRnc3U1ZHaHRxdENu?=
 =?utf-8?B?aHFyVFA5MlJiRTBPNGhHTnJMOGdhU1NXTjJjWTZmNU1Qbm4zL2FDZ1IwZTRH?=
 =?utf-8?B?UEFMTElqTWlhcDlUZnZwWVRyYzFaM2ZzdUlQSGFIcUtEMGVaemNlNXhxNGRk?=
 =?utf-8?B?TVAwY2dZLzh2S1NZVFMvbUV4amVLZm10UGtjL1ZpUkJ1UTRkdjVYZnRKUDN0?=
 =?utf-8?B?Q1EvdUkzaHNlcko4U1hicXBoOFhjcGZKVnhKZGJDZDFjOFBNUWxRekE5ODV2?=
 =?utf-8?B?SlBkTHJhZnV2R3psNXhNc0tPVlQyclArclhFaFVraTNha3ZZRUVGZmdyZ3dO?=
 =?utf-8?B?TURrM29laVBkdlBzeWhwZkVDd3RSZ1R1M004eWNSdkt6d2h4cmNsdy9uVG9L?=
 =?utf-8?B?MUtUQTNDVllwcVlRbmxLSXd2Q1BtbTNwcllHNUVFQkdsYno2UkFjUWlSTTlo?=
 =?utf-8?B?SFVCS3l6d2ZiT0RCSUU0cGJZaEIzV2M1UjcrbjNPbG04Y3J1U0JobTBJWjhu?=
 =?utf-8?B?UG9VTExVdVNPZFE2UTFKTWU2Vmd3eWhGYTRpZ3o0b1hVcWhtLytiNHQ3LzhK?=
 =?utf-8?B?aEs2dnlLcHk2LzFEd292cWp5WGdrSHF3eU1PVEFIK0RGZzNmeDh5YTBGNkVO?=
 =?utf-8?B?NG5KQ3dZTUdXdHFhSEFrc1RBeXJhbjVkL1FySjgrQ2J0U1hJMTJZVWplMWZS?=
 =?utf-8?B?S1o0ZXdmWTRuMkxuTUp2M3pCQUNNblRwM1JUcVRKektqQUpPSHF6ODBva2dx?=
 =?utf-8?B?cEE5Y2RaejZzY2Z4SXRmT1V2N051VGNOWXdpUEdBZzZ5UU9TZyszOTVBWXNo?=
 =?utf-8?B?cWRZUUs5OTVIOHJxT3E0RVRlS29Pdmx5eVl1ZjlDYTU5c2Ywc1BSb3NXczl0?=
 =?utf-8?B?WmxEUFZOWGh2REM3WXczdDh4MlNmejBUZ0lVRkdFek0zOVJEVWxITnlXSEpI?=
 =?utf-8?B?NjdiMkY4b0xlOExBaGE1TnhrWkV5L0hCZEQzVkh4WE9rQkd4Y1RIMmYwRW52?=
 =?utf-8?B?UGd1R3o2ejdXelp0K2kwSFpiUm9zVnllUFpHS0w1SCtDSVZhWlpIWkE3eXJa?=
 =?utf-8?B?U1NiMThpNDIzT3lXR0VNOWZkbUNHUTdWdUVZejROQmpQUTUxL0tWcGhQRnJV?=
 =?utf-8?Q?v3k9/IY4/TY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGFUSjNrcDBNeUNnVjZMNkhGTVNPakR6OVRuM1IyWWYxclNsa0dxR2VqYVla?=
 =?utf-8?B?OTVuZDZaNDQ0eFU2OSswTzdQRGpvYkZMZWVwTm5ZaEhEWVJ4NnR2Q2Jnb3Q5?=
 =?utf-8?B?K2hmVG9jZlE1TUh3QXlLUTBGam9PRkdMVWNoYnE2ZUNuTDFLS0RYOEtiT0lY?=
 =?utf-8?B?R1cyVVZ5aWhPZVRGY3J5aGlzNW85OGN6dVBvcGdGQ244d1pVa3MwSWVoZkRJ?=
 =?utf-8?B?Z0hsTWZEc0VvWWpHRGxuQmt2MGJsRGdUc3V1bTRSNndKMkh4K3hyZnVKdXVX?=
 =?utf-8?B?RUE1WU5jczhDdHNRTi9uWjBpTEMxQzcwbmllTngyckFyMnlmZTArT0pBMUtI?=
 =?utf-8?B?U1FENktrVkZwc2tKdU5JdTBKZlQwK1o0aEM3SE9OdFV4UytOUGdxQUFwWkdI?=
 =?utf-8?B?alB1SGVHQ3hEZUh3dWpTbElTeGNTd2RpRkJhM3V3OTB3ZzZ3ZFk5TWlrWWtz?=
 =?utf-8?B?N2hsNk83SjhnUG5hSGM1a3ZoV24zTVFETU5yRDNsVWI3a1VBNzNFWGN1eWE3?=
 =?utf-8?B?MHgydS9vUEVHbWJIa3ZEamtiKzRkT3M4QWlEWnNqNjk1cmpRa3pka0JQTytV?=
 =?utf-8?B?dlpnUGhMSWdyclBRc21tb0JwRVE1WUY2VkExUTRqVmxvWTNJenR6SUFTYWF6?=
 =?utf-8?B?cTRpdEtiZFBETmduT25RQ21nb09NblU1RUtyKy9meFd5c0k4TFZ3R1c5UEJ4?=
 =?utf-8?B?d2VVL3RrRlhjR1R5SWF2dDE0dSs2K2ZOWkFBWms2NE5MYko4dGVVYXE0NWtM?=
 =?utf-8?B?TlY0WmlLeG1FcFAycUJZS3RCMG41MVlXUGRlVzVlbk5RYmhUNXdORmtGTlNF?=
 =?utf-8?B?NjQrajNuRUZ0aWQ1NWxtOG5WQ3p5bUVoT01tYnNnRHFqVTRPdXZ0QzYvYU11?=
 =?utf-8?B?Snk1a1NJeHljRmNFNk55SzZPMDVlWmhOTEYwUXIzMWpkdlZRSmovSFN5NFJT?=
 =?utf-8?B?WVlHWmZrYk9MZUswblYyUW56RTIwR3hXc25MV2lHYXU3Kyt2N2srR3JQTW5i?=
 =?utf-8?B?ZVRZaG1DeDc2UThBYTUyalhoazlkTklsb3VUZnZydmZ4TlhvMm1MSnkzREJZ?=
 =?utf-8?B?cXF1eE4rUVNRT2x4Q1FHcDdmc1doY3c1VFc1dzhZNnBtd2Zva0hBOWloeHRC?=
 =?utf-8?B?a3d2T1YzN3lxS0loUmpKZElJZ2xVQTFCcHgyUzFpb2dHWHl1Nk9XZXRMaEFq?=
 =?utf-8?B?aDZZdzJFNVhMaEo5OHdTdW9pMkx1V2hURXNZam1WdkNvZjhhQ3RrZk90VWN6?=
 =?utf-8?B?dU1KVGFtWDh2TDR6aXBXZjk1OFlRczErNjdlaURZYlNDdXZJbDVteFdPUE1R?=
 =?utf-8?B?NExRZjBlTENjUk5PcFI2aDhKUkhFU0NsT3pTWlZrTnN1RHpwbnVhaEJqNk4z?=
 =?utf-8?B?YnlJc24wQ0ozVHFYaWxMS1MvNFNuTmp1a01KNVltSjcrakVKWjZOazQycU1s?=
 =?utf-8?B?MWFLQ1N6cmJncjZ0cmlMWXB1OWZYK25RdGJRZmFXTjJQb1pMVWxJTDFTSWxH?=
 =?utf-8?B?cnJUZjBTTEpidEQ2UnRRR2FqdTlmZmZ2MFJWb0F1ZWdJazd0ei9kNTJlOXVh?=
 =?utf-8?B?U3g5M0UydlF4SWJWQjJZZHZtQ05kaTUyYVJaWjB1S0ZsMFlXUUJHQzBPMkwy?=
 =?utf-8?B?NS9GTEorUk40bk13NkJzRk5Ubi9GTDhrSHhOcDJ6RkF2cGoyL0VXZWN5QW9C?=
 =?utf-8?B?ZmNraDY0REE4dHpzV21pZDEyMitUbVFxSlJFRDJ4S1NXZlZGVzNZUXBCbllp?=
 =?utf-8?B?YzBwR2M4Nys4RUkvOVM5dlNTVGVWZ3hPb0pIVFFNY1I5Z01ST3R0WXNIemxa?=
 =?utf-8?B?QXhhTEdvd1I0QW53NGpraUxDUEczWll3WE41bkw2NHNvNjhQMHdra28veExa?=
 =?utf-8?B?NDVGV2xoalQ0S25jR1hGT0lmYitKK2dSV3lTMGtiK2dPZ2FXOGRQSUNTTWI1?=
 =?utf-8?B?RVIyNVlaLzZzY1FTL2dMckhwdWNoUFMwUXBMV1dVeVQ0RUY3a0FrQkhJQmdT?=
 =?utf-8?B?NGRTSyt3c1ZnNkdDTU1rSklxcmU4amhwR3FQQys0dGtMQU5rWURWNENXcHB3?=
 =?utf-8?B?ODBwYUpzZlhaQ1JxNzVvQkcyS0k1U2ZBRWt0Ry9tYWJkYWpGMEdqWUdVNkNI?=
 =?utf-8?Q?1VdSSKzihQUs/tP/KA+EFs3I+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1fc295-1b69-419a-9ac3-08ddc06a1c47
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 11:00:13.2654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2DLzAUkeH4MmIokWzP6nGQixThVA8pdG8tCwGA8yYsb1j06j9vlmic7NQN0aUbM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4360
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

On 11.07.25 12:08, Simona Vetter wrote:
> On Fri, Jul 11, 2025 at 11:35:17AM +0200, Thomas Zimmermann wrote:
>> This reverts commit 5307dce878d4126e1b375587318955bd019c3741.
>>
>> We're going to revert the dma-buf handle back to separating dma_buf
>> and import_attach->dmabuf in struct drm_gem_object. Hence revert this
>> fix for it.
> 
> I think we should add my reasons from the private thread here why I think
> this is conceptually wrong:
> 
> handle_count is an uapi reference, and should have nothing to do with the
> lifetime and consistency of the underlying gem_bo.

The problem is that we tied the lifetime of the DMA-buf reference to the handle count and I think that is not 100% clean.

The reason why that was done is to break the circle dependency GEM obj -> DMA-buf -> GEM obj, but what potentially should actually happen is that we distinct between a structure reference and an use count.

E.g. similar to what is done with mm_struct and mmgrab()/mmdrop() vs mmget()/mmput().

> And for imported bo the
> link to the dma-buf really should be invariant, and hence
> drm_gem_object_get/put() enough. The fact that this patch seems to have
> helped at least in some cases indicates that our assumption that we can
> replace gem_bo->import_attach.dmabuf with gem_bo->dma_buf was wrong,
> because pretty obviously the latter can become NULL while the gem_bo is
> still alive. Which means this was conceptually wrong and at best helped
> hide a race condition somewhere.
> 
> This means that unlike the claim in the reverted commit that 1a148af06000
> ("drm/gem-shmem: Use dma_buf from GEM object instance") started triggering
> an existing condition the much more likely explanation is that it
> introduced the regression itself. And hence we need to revert this entire
> chain of commits.

The existing condition is still a problem I think. We ran into issues with that multiple times already.

Just imagine the following scenario:
1. GEM obj is exported, DMA-buf file descriptor created
2. GEM obj is used in a FB.
3. GEM obj is closed, handle_count goes from 1->0, DMA-buf reference is dropped, but file descriptor remains open, obj->dma_buf set to NULL
4. Userspace calls DRM_IOCTL_MODE_GETFB2, handle count goes 0->1 again, but obj->dma_buf is still NULL!
5. GEM obj is exported again, second DMA-buf is created.

The first time I stumbled over that it took me a week to figure out why we can have two DMA-bufs for the same GEM obj.  Especially you can trigger the "WARN_ON(obj->dma_buf != dma_buf);" in drm_gem_prime_fd_to_handle() with this.

For my particular use case it was just a broken unit test, but it allows userspace to mess up the kernel objects quite a bit and that is really not good.

Regards,
Christian.

> 
> I'll also add all the Fixes: lines as needed when merging these to
> drm-fixes, since some of the patches reverted in this series have landed
> in 6.15 already.
> 
> I plan to merge them all to drm-fixes once intel-gfx-ci has approved it
> all.
> 
> Thanks, Sima
> 
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_gem.c                    | 44 ++------------------
>>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++---
>>  drivers/gpu/drm/drm_internal.h               |  2 -
>>  3 files changed, 11 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 3a99e4a5d303..db44c40e307f 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -213,35 +213,6 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
>>  }
>>  EXPORT_SYMBOL(drm_gem_private_object_fini);
>>  
>> -static void drm_gem_object_handle_get(struct drm_gem_object *obj)
>> -{
>> -	struct drm_device *dev = obj->dev;
>> -
>> -	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
>> -
>> -	if (obj->handle_count++ == 0)
>> -		drm_gem_object_get(obj);
>> -}
>> -
>> -/**
>> - * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
>> - * @obj: GEM object
>> - *
>> - * Acquires a reference on the GEM buffer object's handle. Required
>> - * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
>> - * to release the reference.
>> - */
>> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
>> -{
>> -	struct drm_device *dev = obj->dev;
>> -
>> -	guard(mutex)(&dev->object_name_lock);
>> -
>> -	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
>> -	drm_gem_object_handle_get(obj);
>> -}
>> -EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
>> -
>>  /**
>>   * drm_gem_object_handle_free - release resources bound to userspace handles
>>   * @obj: GEM object to clean up.
>> @@ -272,14 +243,8 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
>>  	}
>>  }
>>  
>> -/**
>> - * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
>> - * @obj: GEM object
>> - *
>> - * Releases a reference on the GEM buffer object's handle. Possibly releases
>> - * the GEM buffer object and associated dma-buf objects.
>> - */
>> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>> +static void
>> +drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>  {
>>  	struct drm_device *dev = obj->dev;
>>  	bool final = false;
>> @@ -304,7 +269,6 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>  	if (final)
>>  		drm_gem_object_put(obj);
>>  }
>> -EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>>  
>>  /*
>>   * Called at device or object close to release the file's
>> @@ -429,8 +393,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>>  	int ret;
>>  
>>  	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
>> -
>> -	drm_gem_object_handle_get(obj);
>> +	if (obj->handle_count++ == 0)
>> +		drm_gem_object_get(obj);
>>  
>>  	/*
>>  	 * Get the user-visible handle using idr.  Preload and perform
>> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> index c60d0044d036..618ce725cd75 100644
>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> @@ -100,7 +100,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>>  	unsigned int i;
>>  
>>  	for (i = 0; i < fb->format->num_planes; i++)
>> -		drm_gem_object_handle_put_unlocked(fb->obj[i]);
>> +		drm_gem_object_put(fb->obj[i]);
>>  
>>  	drm_framebuffer_cleanup(fb);
>>  	kfree(fb);
>> @@ -183,10 +183,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>>  		if (!objs[i]) {
>>  			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>>  			ret = -ENOENT;
>> -			goto err_gem_object_handle_put_unlocked;
>> +			goto err_gem_object_put;
>>  		}
>> -		drm_gem_object_handle_get_unlocked(objs[i]);
>> -		drm_gem_object_put(objs[i]);
>>  
>>  		min_size = (height - 1) * mode_cmd->pitches[i]
>>  			 + drm_format_info_min_pitch(info, i, width)
>> @@ -196,22 +194,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>>  			drm_dbg_kms(dev,
>>  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>>  				    objs[i]->size, min_size, i);
>> -			drm_gem_object_handle_put_unlocked(objs[i]);
>> +			drm_gem_object_put(objs[i]);
>>  			ret = -EINVAL;
>> -			goto err_gem_object_handle_put_unlocked;
>> +			goto err_gem_object_put;
>>  		}
>>  	}
>>  
>>  	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
>>  	if (ret)
>> -		goto err_gem_object_handle_put_unlocked;
>> +		goto err_gem_object_put;
>>  
>>  	return 0;
>>  
>> -err_gem_object_handle_put_unlocked:
>> +err_gem_object_put:
>>  	while (i > 0) {
>>  		--i;
>> -		drm_gem_object_handle_put_unlocked(objs[i]);
>> +		drm_gem_object_put(objs[i]);
>>  	}
>>  	return ret;
>>  }
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index f921cc73f8b8..9078504e789c 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -161,8 +161,6 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>>  
>>  /* drm_gem.c */
>>  int drm_gem_init(struct drm_device *dev);
>> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
>> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>>  int drm_gem_handle_create_tail(struct drm_file *file_priv,
>>  			       struct drm_gem_object *obj,
>>  			       u32 *handlep);
>> -- 
>> 2.50.0
>>
> 

