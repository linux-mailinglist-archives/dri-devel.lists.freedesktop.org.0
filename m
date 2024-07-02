Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A20923E82
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 15:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DE110E20A;
	Tue,  2 Jul 2024 13:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vl/TACfD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D23110E20A;
 Tue,  2 Jul 2024 13:12:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQbOlgPxMBJnX3aA5pyovN8a8FEh5x1AeVPKSSRhORrYxMGBWAvukf915k3bTfzaG0R31fsHQXr+54uvWZRKy9vtL7UPW/HTe1GUjOGsj54z4zMx/VS5xt17MrvHX8+exBxuh1pW5sBU3gp8cZGHJFcPvRdlFTgP+yGOznDZWPyzUMRnEftPJZJukm2WqXjB0sPiNNlAVo0enyDLXb0fvowm8pkcRVig1ARbRifG/GsghN115K5ni340sDYsDBnwfwodg7zWDOL1HTRCuW1t9E2dJIiInAGRjQvOzgGrKgau8JWqwqqPoi3UPBCzOFn2xQbvSBm/4McTgMVaXuiRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkyRyPhyKXU5Sy2JgivUTdriLS3u182Bt1IV5tmAnIU=;
 b=K3rqGvGJ/1Jloi1n8gGBylKTfuwRzgrseJs0IsUhX84zdS/W9lu2YY/CGfmG08I7akmRd/0QUEC9sRWmTxzY+PKbzbHMmaklXdp79HPja74RXCrKbMUNsBIZkBNQXXCYElEa/fgMUuwZ9RxBq+9sCqUoLzddvkjlRIkgQciRQNPVOgGwNDJkPTHibeuhvhPyGM7/7TUC+nZwAB4jclWZAdl9hQMktR2HtUfoc4kr4qhBhHbuk0Y7QoDEO64jUScxi9zXHIgGFVarVGC0sAl1eccWioC67AC3Qo3Ej2S/1wgDl2zhzM7xFk3Tsg7BEz7NPX+ExDgKQ0rq3KZg5DavaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkyRyPhyKXU5Sy2JgivUTdriLS3u182Bt1IV5tmAnIU=;
 b=vl/TACfDixNTcg2Y2AdNqLr/AysX9N1eF+1uaUIY9Z8WCbfyRqJ0awgPfnTo8Eiyu+Tvl5R8NMAlX9v1vY3OfKxpqR8drEb3Hg52I0TMqtUF/ZDyK2A8+4JZ4VP+hCz52R+/iDsjQtPAsThW3mFZS0E/izkMy/C++3WHx7gZwtI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CYXPR12MB9385.namprd12.prod.outlook.com (2603:10b6:930:e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Tue, 2 Jul
 2024 13:12:43 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 13:12:43 +0000
Message-ID: <1ef71fcd-d1ae-4b95-a262-072b90867f6a@amd.com>
Date: Tue, 2 Jul 2024 08:12:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm: backlight quirk infrastructure and lower
 minimum for Framework AMD 13
To: Leo Li <sunpeng.li@amd.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 Hans de Goede <hdegoede@redhat.com>
References: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CYXPR12MB9385:EE_
X-MS-Office365-Filtering-Correlation-Id: 96023e0a-90e8-4b91-ae31-08dc9a98a84e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVk4SWN0QTlScmRDTDVtVzVyd3llVGsyM29JaXJuTWdZMG5xZzJMZk1TVlV5?=
 =?utf-8?B?dTZGdUZudFZaRzF1cFJwejF3b082bFhXVkVKd3ZuVisvZGxmOGVMWWg1c09l?=
 =?utf-8?B?cVJGM0RWMDdhSDZaRzlLWnl4ZkpQZTZIVXJUSHlFcmx0ZDFZa1BFby9JZ3hW?=
 =?utf-8?B?aHhIeUVUaHlwanBYc3ZPTzZOT1pyUW1OMEZvdS9rUnpLV1laVVdzTlBDMTdp?=
 =?utf-8?B?clhiWGJaTDExV2RlczhvS1JKUDRBV3c3WUJUazQ5NTNOWmo0ZENJdldGN3cy?=
 =?utf-8?B?VytoSGRrc0lOUVN1QW03WnRJWkdZc2pPYzBnTVBteHRTWjkwYmhlOWMvMzYx?=
 =?utf-8?B?SDg0YzczcUtEbFJKeHJ6Q3NZcEhCWnA2RmJJVW9DYmNjWjhzQXVEeXozQ1lC?=
 =?utf-8?B?R1BFeEFuVzNzaFh1TnFQNjFvbHZIUktsZkpHOUtVa00zWTRsTndUYkNUZWNL?=
 =?utf-8?B?NzlXOWh2VUFIZE03VU5iVnE0dFpVMlRCVjJQNThQeVNsT0ZQU3kyMWhGdXRW?=
 =?utf-8?B?UGFmcGxJL0R3N2owRlkrMjF0Nm9EYXRqYTFJUzlwclVDL3Y4SFZhRzAxVHJs?=
 =?utf-8?B?YTkvZHZ6SzFuZldDTmtNQkQzd2hZMGlic3R1Z0VQUjJWaW12Y1B3ZFloK1p2?=
 =?utf-8?B?RFp4ajYybnNsQXR6Q1NmSTVhUlV5cjVxWHFrY3RxMk00SjVxakFHeE9Ta2ln?=
 =?utf-8?B?clo1cGVFcUt5YWEzSzI0em03cDhiZXhwczl4NmlnMTZLamJ6M0gvaVpJTDIy?=
 =?utf-8?B?M05YcGt3SzUvcGJ0bGNBUGc2WFAyQkpoNVhIT1RsYUxNb2pteFNucGR4VGdn?=
 =?utf-8?B?SGZNWTBxWHpoaHp4ZXhtbk4rczZpajBMZ1YySzB6R1E1emdvTDdtajZTNVF5?=
 =?utf-8?B?NmVZcGxVTXNwWjB4eElpSXZnVENBVnd2aXlrczljb3N4Y2FLNTlLRFY5VVox?=
 =?utf-8?B?THZhOXpycWk2cGlSa1EvZjVaYTROSUJKcmNxdGFYekNYajBBVmdldEw5Ykcy?=
 =?utf-8?B?TWpkcmhLMHJwMWRwQWY3SWduRXk3YjVuT3cwWDZ6bWJvaHEwZGRXRUF3UjBC?=
 =?utf-8?B?MEttVjZXV3ljemlkV1NJNWQ1d2dpb2k3VGdEVnYzMkU1UzBMbTlYVUIzb0gz?=
 =?utf-8?B?M3c1SkhHcVNhaGx5ZVhERDRNSDhITncyOCtJVjhEZ3BHaFBuUmc3TVN5eUd6?=
 =?utf-8?B?Q2d5RXhtZ0JKZVYwNE5ka3N0MjVqeWhKbDFOVS9jZVZiSDlzUEt4b2lCaldV?=
 =?utf-8?B?WEtxSXBiTG53K29IU3c2L1kxU1A1ZFhwcG5sa0h3OGpFVVZieVEzTUsvSzBy?=
 =?utf-8?B?RDBuUVFUd202VWpWc3JGV0ZmRS9JZm9yV3dTRis4UFRsSnRSWTRSbWRTamlT?=
 =?utf-8?B?Uit1R3UxUlNVVTBHdFljMjl6eHd2QWk4ckszRHBUa0ZRQTN4amtpelR4aFlv?=
 =?utf-8?B?SnAvU0RWbkk0Q1Z5c3paZHloSU8xNFJUTENBdjJXemRHcXJCQUdxc1NPSVlv?=
 =?utf-8?B?MEJrdTZ5UE5neVRTNDZIZzBLL1lNenNoalpvdy9NeGpxNTlycUl3a1pFRDhx?=
 =?utf-8?B?TGtNQ2VzZzc3b3QvaGd6OUxrZzdJUGVCYklSK2JoVTBlQ3ZHUWxSRHRYUDdY?=
 =?utf-8?B?ekpmbVNVMVl6UzNRK0kwQlEvOVBBYXFsc0RqYjVvNFFmNXh0ZFVYaWpJQjFZ?=
 =?utf-8?B?V2JKOWQzcHFQcit0eHdJL2x3SnFQYk1yK1V6N0QycFNNV3BZVVphNGdGMkc4?=
 =?utf-8?Q?21vT6R3NaRV4NAUBRp7skn+FmlA+M6AzN1tT+FP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVhaQmxiMjJvR2NMNDEwOC9XWkw3eWVLVmJZbkppZzZMMFlaNzZ1LzVUWTlQ?=
 =?utf-8?B?U05mTzVaUTlHellBcXVLVTR6OVhZTThDNEdsLzBJc0RncHdzRk41elg1QXZN?=
 =?utf-8?B?K25QQ1RjWDRHRWl5V3VEZU1acEQyNll1ZjRYVENwR1drWFgxSTJjVlNHeHAx?=
 =?utf-8?B?dEt1M3prRXRpZnd1MThIWlBaNE5aU0ZybzVnZm1uR1pQMFBjUWh3YXZ0NzI4?=
 =?utf-8?B?NFRMdWgyczdJS2RCOUlQeW9yV09iWkFLSHZHcTg0b2wzdGpXc2JmTjZZVWg5?=
 =?utf-8?B?Tlg4Sy9wc3B5NGhYTXREanNNbTdZcHBkckd1V3NDV3EzNzMwN2h4RVFxOVJy?=
 =?utf-8?B?YnlLS1ROQlluT1RMNkN2RWlyMURrZ1JTSVlvcGwzMHdhVXU4SU9RMUFOS1ZI?=
 =?utf-8?B?dlQ1bXY2eTZ2Rno0MmlxdGJUV3o5ckc1cklWZGorUElzNDZnQURjTExJRzVv?=
 =?utf-8?B?RlpibEh3WmV0MmM5QmdNcWNNdFZVdDIyeHRCdlhmenNRUFZHN1MxS2dTRldH?=
 =?utf-8?B?eU5qRVpLWE9WbGt5RXZBUjV2eXJmalBlQkxEYWpNSjU4OGNUNGtQbkhTYStj?=
 =?utf-8?B?M1hYZzlOWkpmM1prY2NoU2kvT01jang0ZDRJYVZjV3lnWTdhSTQ2dUg1Vytn?=
 =?utf-8?B?QnFDTStoRERGd3MyNmI5YnJqWDRzbE9OS0dTazZ4K3AzQWUrbmFzRFU3QUNl?=
 =?utf-8?B?ODR2c2ZHOVZESUdsL3FhZ2QyTzdYd3JvelBMKzVPcHFCd3J0N2JqdWpOYkVP?=
 =?utf-8?B?cUkrNmtnS1JvdUVrRXN4RjMvdUt1RnF0Um91MzdkYVIwRnFCZ3diNTgvdEVI?=
 =?utf-8?B?bCtMRjRuekF2TDd6TjN0TkJON0I1Y1dRTmdvYitLVWdVRkpVamdpM3B3a1pn?=
 =?utf-8?B?c25jOXNvNHRjVjE0YUZHWXcyUHJnMlZaVEQrRG1Mb0FrNVoyeExmK2VENlBy?=
 =?utf-8?B?bFRkbjlkOThpbHZpUVFWZFByUGJYaDF4ZnZWY2tKYmxyKzNSZlQxR2oxMTha?=
 =?utf-8?B?UEE5WGVVZlBvNk4wbUNQdXp1N2pNSkJxcDc1OHZTQTUxQlhodnRJN3hXbDdp?=
 =?utf-8?B?Mjc2dW1Fd29kR2R2V2VWSzZNcTVSNm54RU80c3VwNDgvRS8wVHFHQTNMdEpN?=
 =?utf-8?B?eFFrMW1jL2k4a1Y2MldQMnUvU0J0NCtxWHgzWHlHQjBFN01uRHdyWGlscjRh?=
 =?utf-8?B?K3pqbHoxTXk0MjU4UWcxbzNyMjE1VktjOENXVHJsQkd6cGt6U1J0amtjc21T?=
 =?utf-8?B?NE9jazdGMFJrVGtOOHAweVF6c3Y3OFJCRndvb1F4cGlnZklaMDY4L0V3aGF6?=
 =?utf-8?B?V3R4bURqRDBwT095aWNEWTM1SnZzYkYrRmUvMENxZ2xnQjZVdGhtSnIyZDVP?=
 =?utf-8?B?bkc1OGJvcVgxZy9MOHJDRktJaklTUFluTVVGRHBNUFB2eSs4UmlNVlZacWtr?=
 =?utf-8?B?V2ZCdElRSTRKbG1uWFQwajZmd1R5TXVnaU1UOW5XTmRGQUJmYmJXZzJ2NXl2?=
 =?utf-8?B?QUNaS3FURGkzbmxuSnJ2ejJBcllFMnN0N3E5alFuUHVMYnJzNW9oK1NmeUZh?=
 =?utf-8?B?TXBqVmZhNTZwdFNtd2lLcTFXbHhRUERpVGhqWXU3SHZoNzhMekU5eUN1enVs?=
 =?utf-8?B?NlVTRW9ITXdMbVl2RjdURis0amozUS9ER0lMT3lGdytSek9rbG9XYUx6VW9D?=
 =?utf-8?B?RTlJaUhUZjRXVDFYdk50SDJxT2toVGFPdkR1RlBGWXFtancyTTRwRkR5bHdD?=
 =?utf-8?B?ZlFkZkNhMjB3ODFZZXFRRnNQTkJYcmtIV290R0YvUEZRVUVucXVQZVJmM0dC?=
 =?utf-8?B?cjFmNU85MU9BQ25hcmhJZWZ5VVRLYnp1S2l6dzRSa3Izc0UrRmtxdlZBSTBk?=
 =?utf-8?B?Mkw1MTk3QmgrWER0NDN6UmdpaGNudkRyR0RZejFrRlFNVWxzUGJZdXdBVGpK?=
 =?utf-8?B?S2R5TCszRG1aVytGcmpwcWhLanJMMjA5REVHWk1JL3A3b25FcU00Wm9ET1Vs?=
 =?utf-8?B?a1l1bVpXcm81WGIrdWs3L2RvTHBkMGRCT2dkMHhtVWRNaFA1OVZKUk9LQXg2?=
 =?utf-8?B?TTZyUU9TeVlDS3JiMlpubUhOZGloSTNBMmxjUWdUYXFmVXJMWk14QWE3cjRF?=
 =?utf-8?Q?VWowS01DVWWBnpXldmX1xuypu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96023e0a-90e8-4b91-ae31-08dc9a98a84e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 13:12:43.1127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xK5v28YHLK4SIfSPvDFSr/hZDZX0C/XVCI8W9LKz9Ai19DSeBnkZ4KNL0w3Blcy7QIpIXnShna5q46sAb9+bDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9385
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

On 6/23/2024 3:51, Thomas Weißschuh wrote:
> The value of "min_input_signal" returned from ATIF on a Framework AMD 13
> is "12". This leads to a fairly bright minimum display backlight.
> 
> Add a generic quirk infrastructure for backlight configuration to
> override the settings provided by the firmware.
> Also add amdgpu as a user of that infrastructure and a quirk for the
> Framework 13 matte panel.
> Most likely this will also work for the glossy panel, but I can't test
> that.
> 
> One solution would be a fixed firmware version, but given that the
> problem exists since the release of the hardware, it has been known for
> a month that the hardware can go lower and there was no acknowledgment
> from Framework in any way, I'd like to explore this alternative
> way forward.
> 
> Notes:
> 
> * Should the quirk infrastructure be part of drm_edid.c?
> * The current allocation of struct drm_edid in amdgpu is bad.
>    But it is done the same way in other parts of amdgpu.
>    I do have patches migrating amdgpu to proper usage of struct drm_edid [0]
> 
> Mario:
> 
> I intentionally left out the consideration of the firmware version.
> The quirk will stay correct even if the firmware starts reporting
> correct values.
> If there are strong opinions it would be easy to add, though.
> 
> Based on amdgpu/drm-next.
> 
> [0] https://lore.kernel.org/lkml/20240616-amdgpu-edid-bios-v1-1-2874f212b365@weissschuh.net/
> 

Thomas,

Are you doing any testing of this lower backlight value specifically 
with panel power savings enabled?  If not can you please check that?

Specifically write the maximum value of "4" to the sysfs file:

/sys/class/drm/card0-eDP-1/amdgpu/panel_power_savings

Thanks,

> ---
> Changes in v2:
> - Introduce proper drm backlight quirk infrastructure
> - Quirk by EDID and DMI instead of only DMI
> - Limit quirk to only single Framework 13 matte panel
> - Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net
> 
> ---
> Thomas Weißschuh (3):
>        drm: Add panel backlight quirks
>        drm: panel-backlight-quirks: Add Framework 13 matte panel
>        drm/amd/display: Add support backlight quirks
> 
>   Documentation/gpu/drm-kms-helpers.rst             |  3 +
>   drivers/gpu/drm/Kconfig                           |  4 ++
>   drivers/gpu/drm/Makefile                          |  1 +
>   drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++
>   drivers/gpu/drm/drm_panel_backlight_quirks.c      | 76 +++++++++++++++++++++++
>   include/drm/drm_utils.h                           | 11 ++++
>   7 files changed, 124 insertions(+)
> ---
> base-commit: 1ecef5589320fd56af599b624d59c355d162ac7b
> change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
> 
> Best regards,

