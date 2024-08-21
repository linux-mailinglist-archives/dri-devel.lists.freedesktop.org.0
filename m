Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114CD95A608
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 22:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699F510E15F;
	Wed, 21 Aug 2024 20:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="00E5IX6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F9910E054;
 Wed, 21 Aug 2024 20:45:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPEpY4Fha6N7FztoANMZ60UAfxUwgKEonrw67Y+THK74S11/LtB1keX/u9PpIKC5z7g78FhvSF/i0Zt0bTjB0je4NKgfXVBMvkI8jTx0hkPEeJJOT0CtYAlszNFRDfskVaV83080HoE6ufLrYKiHRszB6PXEoGkrk3c1oTC272xc7m5XrBX/t/d/tEo3RMLR9IK3rWbt0sYLx5fFSC12vMm5uq7IuSVzaBgLJpKc4hPbqiLR1tByTzS3uXjifG0nUpiKRVKPJYeHf2skfAeZijHzUmd3YMDTx9foIhjXdLT1buHXC4U5X2dRGrf2SYQoJAt4lUmvo7p3rqPotP1Pow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlLcNiokpbPEaxlBiHuwLLER6DCrVQWXwK0LKrOUOjI=;
 b=BlQhwlronsU91iojib7RGZcv0M0iv/LGP4xDeiMY2ZdURAZrJetyEcXnVs9NAsl6x9Ps2CtJqeQ6lwGjnwSCNQadSTeD5lsboncXiTTWCaXNTULucW0/TUR5rd3+l8Xu3m4NfB1CIIxQtOFDbL8W497/PRyQwZpCSdm8zcCTMrE2CHy4Q0ZHQPBFHdtkLv0RPH39sMssg0kEokCR/OTW6xxKm7Gr0Kwlqbj4CTemC/3WCDMlBOdk61WT4tByG/2XCIseFj9XFcrSxpm3hNNvU9dAoC+Jqto7Uzgi9KmIvpmEO3BBumFT9sWO68kmCLliQ56/b2E0fPxKyAUWwOMKbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlLcNiokpbPEaxlBiHuwLLER6DCrVQWXwK0LKrOUOjI=;
 b=00E5IX6vQRAg2hBTnob4N+8xz0CdSZqg/820RtiG5kAUTyo8FqByg6xVdJycTxJeGHspzOtvSGTYL4pwzhQCc4guwpEEN3zj5wknRtvntgadabX5jhUdXmngS9JiP4tLFuOHfYfng5Bn+GuFRzjKgbZKnl+bSH5HXLWH1EicQB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB7188.namprd12.prod.outlook.com (2603:10b6:510:204::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 20:45:39 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 20:45:39 +0000
Message-ID: <4079b41e-9a5c-43be-9614-250b21d6e92d@amd.com>
Date: Wed, 21 Aug 2024 15:45:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] drm: Minimum backlight overrides and
 implementation for amdgpu
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 linux-doc@vger.kernel.org
References: <20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0163.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: fe922b05-53ba-43f7-fb11-08dcc2223757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEU4eHZDTHRwc3Y4dTJnY1czR1UxcFMxaEFYUmd6c2dzWGdSMUVNQk1qK3cr?=
 =?utf-8?B?ci8zK0V1N1l6QUpSYldFRGtpWDhQK1NjV1lsZHg1eFdmREJXUUZrTUJvaEtU?=
 =?utf-8?B?TGhad09ydm5GbGFHTjc5eklpQWhxN3JFY1VZZERkOFVpU2VKLzFVS3M5OEpW?=
 =?utf-8?B?akpiYnJ6MHZDNVJ5aXRmeU9qdGdDK2p6SmE3YUtLbEdwZ05Icm05ZFdXV245?=
 =?utf-8?B?OWNncW5Ca3E5MlMvZk0wUlJHZU9Za1Y4TGdnbml5T1ZxelZVMU5RTkszUkI0?=
 =?utf-8?B?VTR6OUJCUTh3cXJ6a1c4bklOb2dua1NNaWdmeVdVNE9nZlo4bnFuRHptMXhW?=
 =?utf-8?B?d01oN204V29rSkdOdVBuQW40NzlXbC9uMVlZZkdFV0I2cEpybW5XU2g4bElK?=
 =?utf-8?B?M1NJdzY2a1lpQmhaWkF1YUJuSFdlNzNBWDlZbDF2QTBVU2tLRFVnRzM3bUlo?=
 =?utf-8?B?KzJCQ1ZvQ1ZMT0NIMi95RG1sOVdpcmh0TlNQaG5DcDFrMXFCd2pVSC8xTi9v?=
 =?utf-8?B?aWRGZmN6UjRDeUc2QU9xK1B3eUd2YnpCMnA4NkYrQlZFYzdRMzVWMFBhVnNx?=
 =?utf-8?B?UGJFZks3dFdSTDJERmFVeUNITm5IcWdhRnRyRlVGT3VySFljTFZLT0JSdElZ?=
 =?utf-8?B?L2pyTTVGejU0bTM5N0ZFeHB1ZVFEamFEclY5dlQ1M2RtbzkwRkpKYUh5akZY?=
 =?utf-8?B?eHk1a3I5NHV5SUtPMGw4SHVvaXJYZzdqTkJQa1VwcUJBT2hLaEo0T3BERU45?=
 =?utf-8?B?YktyTnFWcUtudUs0WnlqV3V6bUJiekEzN2NacHRkOUg4VGVUazFVQVFCRlJR?=
 =?utf-8?B?Y3JlWXdQNXdic2RmOC9nRHFUWGNuTWJWdkJURlI5cFlUOEg4MXBRblRyd05B?=
 =?utf-8?B?K1VvSk9tS2c1U2JkOVlYSEF4WUptK2xTT01icERTNU1XUHZsVEM2UTBrOEFB?=
 =?utf-8?B?U0c1RFBjZzdzYzlEaCtZVURpRjRJN0JpN3pxUnp1OUsyQjVEelpUVHFISXdN?=
 =?utf-8?B?WS9UbkZKQk9LQ0NVY3dVMklxeldFYWJ0Wlkxc0JZL2JNblNPT3hoUUJuejlE?=
 =?utf-8?B?cDFQMFF4Yk9DazQ3Nk5sWFJwM1ovdzg2dnBCY0JJZzhTUEVBbWQzUzV3YW1q?=
 =?utf-8?B?SFYyZmpGS2hidnZCb0RjYTAwNGZodWttVFRsbmRaK2xCSVp3VXNkR3huL09a?=
 =?utf-8?B?dFIzK3BLUmhJWTJrS2tuU0lBYWV0Qy8yTXdoQlRYTlloRWNmZW94Q1BWaU85?=
 =?utf-8?B?WWZGR0xBbDFKNjk3OW5mdmJRbUsrbVZMblYxTFd1ZldrYTJKQVFYV0NVNnUx?=
 =?utf-8?B?YklWa29TbjVkM0s5SThTME9IWHlOZHllNEJNTFNLT0NseDQxOEJCZ0FSYzdB?=
 =?utf-8?B?bFgxSEpvbnFmendId2wyWkgrV0JnSGRqUWhLWFozdEJqVlRTUFBZdnB0SlA0?=
 =?utf-8?B?QjE0YWQxdElIdHp5aEJ4MzBqd0VlZEFqZWphdDNLdm5yR29tRnMwd1ZRV1Bj?=
 =?utf-8?B?NDZHSTJhbGJDeWhSUUU2MzFmNHVrL1FQdkRzeExIemd0NUNFTU1NNElyNmpI?=
 =?utf-8?B?YmdSUCtHM2RsUVhpTnFjSjNXYnRyMDVQVjd3d2xseWJZWFhPZThHc3pFNm1P?=
 =?utf-8?B?SkNSMmFDd0JlbjJuQ3VNQ0NzS0o4UHpTME5mVG9wTno0SStDYW00TlhiRk8z?=
 =?utf-8?B?VXZZZnlDcmJTckRQTWRJNXg3YjNYTEVPUndtd0tmRGJycldlSnA0MHhyU1B2?=
 =?utf-8?B?b1lSQjBWM1RuR05UTFZtZVJuR1pIVUE4L2FEbzAvcDVaU0R1ZzRSSk1uUTFW?=
 =?utf-8?B?RGhaaFIyd3lQeVVweXV1azFhaUxrbDFaenN6ZzBISmdLTTh0a3RLOGY1aW43?=
 =?utf-8?B?ZGNRVjJrUzZWUFoyc3VmT0FSVW0yQzJCTmtzM2pRT1pjaVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXlmVUNyd3llSm5MdmhGUDU1RE1vQThWZTV3aVJJUlJ2SG9acUl1ZFVqdTZY?=
 =?utf-8?B?a004RFRKWEtackpmMXlnNnR0d1dLRXRGSTVqMkw5MHg3US9rWTN4UVEzZExn?=
 =?utf-8?B?WFBWVk5NKzMwdDhWOWdtT21xYUNMQTloOTRpZXZxR3c1d0xBanhpRmtNQzJP?=
 =?utf-8?B?dFNXWjR6a3JBYlJaU0w0WEtxbVE1T0x5R3psblpQZnVsZkRnbFpiRm1iS1l0?=
 =?utf-8?B?UVp6MUZLZk1RdFc0bC9kL2JZMmFtMExjTFdOU0Y3VnUrVG9JQ2NsdjdCQ0ZC?=
 =?utf-8?B?dVUraWZCb25RSzhXWHE4bTRJYWlLYUlmanhoUEhkWGVObVdMRXpOSlFGeHAx?=
 =?utf-8?B?OHY3WjVoRHJ6cmNUOUNuZlJscHZvZU5keDNzLy9IOXUyNmU0d1RxdkxNd1Y2?=
 =?utf-8?B?S3lHdWdmMzQybDkveDZNdWVGTmJzQ0RvUkxtSjFLZDhJd21qNTJya3hwOFhX?=
 =?utf-8?B?WHhrbDdSWC9IcXEyV0c2N1FtZ0cvdmYyWWVRMVQwZkMzb2YveXVsSTlTSkNT?=
 =?utf-8?B?UGFNNzhuemN6RkJNWW9UQkY2UUpseEhOOVQzcFhvSVAyUWoySGFzQ0NRYWVC?=
 =?utf-8?B?VTZDSlVNMlNFdjVQNnhia1RoZWNpWjR4OWxLS2RJbm1yUkNlN2JxbWlJZVBo?=
 =?utf-8?B?d09lOG9JZjdYY0FFZHU1YWJDNkttMTdJa3ZCaVdabE4xUU11UUJCSXMvd01M?=
 =?utf-8?B?bUYyNWJaQ1k1dmo3U3ZLbFMrTUovVHZjQkYreUFhYk5jaVhPWHd2RVAxSStK?=
 =?utf-8?B?Zld3RmJZZXBmb3dVKzJ0OUcweDR2VkU4azUrbVYwSGlTR0QvVXRPemNPRnpR?=
 =?utf-8?B?RUZSbmJFWW1MQ2x6QUVsZEhydUVobGZrZ2pyajJibjdwK1lrOHoyMmNJdFow?=
 =?utf-8?B?eFlKRis4U3hmWmFLVlB2YUxRbzRWbTU1dnpQNzRpbVZldE40QkNNalBldG0r?=
 =?utf-8?B?RG5RaGNkOWxCV2plUXF0cjVFMUIzbVlVWVdibHc0QnBER0tydFQ1dkNHU3cr?=
 =?utf-8?B?b3h5NVhSOSsraUFjRTJYUHY4bDVFKzNXY0Z4b2kyODBTY1FQZjltQ0lPNEp3?=
 =?utf-8?B?Wm50RXkxazRRc3VKcDdCeG5lQyt2ODV5TkVURXpNblluTmkwUjFRMGp3UWdS?=
 =?utf-8?B?N29ZRFlldDVPRFRRbFRSVkNGRXFDZFQxcDQ4bXZlSXVFbUE3TENnRjNTMFU3?=
 =?utf-8?B?MEt1RWdVTWtlOFNUSHE5T3RScml3a1N3R0JoMisvZzNMN1Y1VURoMmloUEMz?=
 =?utf-8?B?czJ1WFFVMlZkbWJIRlJNZGlURUpoWGhkMGJ6dEl0ZklzUFlhYVhCcCtMS1NT?=
 =?utf-8?B?N0h2MFZtMnpnNDRFYlVTR0k1ZjBIRk10NTdNdnd6ZTdnb3dNMnpJUWpVSC9Y?=
 =?utf-8?B?TkZuM3ovekV2b2c1S0dNVW9iRWYyQnpRL3ZoUGtoajhEZzVxYnQ4dlhRd0xn?=
 =?utf-8?B?ZlcxR0VkRWJ0R2Y4NFlSTHJpVkFlakY2TC9JOVYzK1VMSU9vQkZ4anpSZ0g2?=
 =?utf-8?B?eXZFVEIxeHMxTTlqdTN2RWN6R2t3VWxQQk1vKy91eG11MnFtTzhOaElxZmVs?=
 =?utf-8?B?NFlyaXgwS3U3aGh2ODlYNVgrOUxKeVBkZVhTT1lqd1h4QjNGcDBrVUwrdHRw?=
 =?utf-8?B?c05YdVM2WnpkY3BRN2xBOFd3d1c5R1cwWmtzSjVqclBIZHJnVXMvYzNEUGh1?=
 =?utf-8?B?RFZ3emE4Y3M5dmJ1ODFkcHRGWDN4NnlPeHhpblpTZysxSG83OS9adkNhb0Qy?=
 =?utf-8?B?Smc4M01xamV0UXpSZEdpbGJhV0J6QjlqVTgwK3ZDMWE2UUo5Q3Fna2VWQmhD?=
 =?utf-8?B?RVhzZW85a1FyWktmVFl6TVR0aGRkTkZFdUlzdFVIM1JPL2Jld0N1WUU4dE1i?=
 =?utf-8?B?RDErTk1tOGc3aHZVY1g2VXJ4NVU2bjZ1bmZ5RUkzWUcxd29JdDNkeDB6ZC9N?=
 =?utf-8?B?N3hOVi9RcDNrWWhXMmFUc094T1gySGpoZGhZZUFYbGtlOWdQbjZleDRLNGph?=
 =?utf-8?B?cUw2eXJYQmk5WFFhdmtkb1ExWXN3SGxJNlZFUHRZc1dPOGlaTm5OeUtxaGlZ?=
 =?utf-8?B?STJScy9ZUExSeWplODJtVENydHFDRFNwUTFHK2FBaDNsUk5vcm5VRitxNXgx?=
 =?utf-8?Q?xnbIPmreAb1f14rpI3Tt5/tBW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe922b05-53ba-43f7-fb11-08dcc2223757
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 20:45:39.6418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1/CXcWGWy2ezPTu6MnX4z4/vmiVLXjHezV37RT4g5OID9SzwZltLvUqmr/Xd7gx+x1ahwy9kPHwqABaVyvYlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7188
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

On 8/18/2024 01:56, Thomas Weißschuh wrote:
> The value of "min_input_signal" returned from ATIF on a Framework AMD 13
> is "12". This leads to a fairly bright minimum display backlight.
> 
> Introduce a quirk to override "min_input_signal" to "0" which leads to a
> much lower minimum brightness, which is still readable even in daylight.
> 

Apologies for my delayed response, I've been OOO a while.

An earlier version of this series I had asked if this could be tested 
specifically with panel_power_savings enabled to ensure we're not 
causing a regression with such a low minimum and panel power savings 
turned up to the maximum.  If such a dependency does exist, I believe 
panel power savings will need to get an extra check introduced to 
disable it when the brightness falls below the previous threshold that 
was programmed by the firmware.

Did that ever get checked?

> Tested on a Framework AMD 13 BIOS 3.05 and Framework AMD 16.
> 

As far as I can tell this series doesn't apply any quirks to Framework 
16.  So by testing, do you mean that you tested that it didn't cause 
regressions (which it shouldn't; the panels don't match!).

> One solution would be a fixed firmware version, which was announced but
> has no timeline. >
> ---
> Changes in v5:
> - Forward-declare struct drm_edid
> - Reorder patches, quirk entries are last
> - Add patch from Dustin for additional quirk entries
> - Link to v4: https://lore.kernel.org/r/20240812-amdgpu-min-backlight-quirk-v4-0-56a63ff897b7@weissschuh.net
> 
> Changes in v4:
> - Switch back to v2 implementation
> - Add MODULE_DESCRIPTION()
> - Simplify quirk infrastructure to only handle min backlight quirks.
>    It can be extended if necessary.
> - Expand documentation.
> - Link to v3: https://lore.kernel.org/r/20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net
> 
> Changes in v3:
> - Switch to cmdline override parameter
> - Link to v2: https://lore.kernel.org/r/20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net
> 
> Changes in v2:
> - Introduce proper drm backlight quirk infrastructure
> - Quirk by EDID and DMI instead of only DMI
> - Limit quirk to only single Framework 13 matte panel
> - Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net
> 
> ---
> Dustin L. Howett (1):
>        drm: panel-backlight-quirks: Add Framework 13 glossy and 2.8k panels
> 
> Thomas Weißschuh (3):
>        drm: Add panel backlight quirks
>        drm/amd/display: Add support for minimum backlight quirk
>        drm: panel-backlight-quirks: Add Framework 13 matte panel
> 
>   Documentation/gpu/drm-kms-helpers.rst             |  3 +
>   drivers/gpu/drm/Kconfig                           |  4 +
>   drivers/gpu/drm/Makefile                          |  1 +
>   drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++
>   drivers/gpu/drm/drm_panel_backlight_quirks.c      | 94 +++++++++++++++++++++++
>   include/drm/drm_utils.h                           |  4 +
>   7 files changed, 117 insertions(+)
> ---
> base-commit: c3f2d783a459980eafd24c5af94ccd56a615961f
> change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
> 
> Best regards,

