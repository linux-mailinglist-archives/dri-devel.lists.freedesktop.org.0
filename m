Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668D2C6BBE9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 22:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54E510E1AB;
	Tue, 18 Nov 2025 21:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tzLpUrYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012021.outbound.protection.outlook.com
 [40.93.195.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161F410E1AB;
 Tue, 18 Nov 2025 21:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxjjJMoyhJI83U79M9UaQMStjbmpXKDkSXVIrEO4HGbSn3TbGZTNnJbLMOIlnr8A261aViQHFD32xN81XSI88TBBZLr+XfqhP8cQv8XiNwPAJjCNbE7C3HX69Pl0zDr8w7B4515BTiWcmj30KxU1qn4htxmgt/aEV+S0u3EcNHacwq/BCtmE7SpnfnAwnwO6dN9CIFHIadse44LBxOtaSeHzIIUzlzsQOoRpaN5iJdc+HHu/1tX8XCKR8Vxyk1sQIEo3OnvIMA8OOSBNK7jfTurBiaqodchHqPw7pIuuw3nHmS+UZZui2QQWPPcwFLJuS9mz+WEseRY0B1JvGCPo4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhrh6C9kFkcXX/6hWLDQAId2f49E0OgE9tXALtfZE7g=;
 b=OHyxbQXihO2PPqzRWPyszr8pMIbPlneU7AD5vQYBDjlkuup4/7fmePloZKAIz70nxfCpDItxn5WJ0ZF5Ka2hiEaSOW8+wEJk+wrBD7bA2wOHr8r+sGh8CN6q4R6Vlz60G1BOAHg/RO8omATwbD2zpTtcePEdUI3RN8tlZT2SqE2mfjO8HbgRNH83emqPG/YCFg7yghISnDMD4q/DlncJzJg7fGunX00GSAZuS27ANrUSKY+V1Wl5jho44kRfmmsTtuTVOBABUxMWBzIrsVkcomSUOS4DniT2xNlb1MpcwjsxvwN+8zPwZzxARjVjbWiss4ZCHJ7glv2tcoBVK8PKkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhrh6C9kFkcXX/6hWLDQAId2f49E0OgE9tXALtfZE7g=;
 b=tzLpUrYCd6teBirlZcxFCUBejYQ8/n6Tjycq529h+gwhrRbVSV722KNFn+jUCtEe4xzvMPoxT7uk4Vy1XIO8DXwAE2KjEzJEkM/HqR05a01pAIYMTusrrNHmKWgqUOEWGCuiSdrHKJSjC83/UjTTwrnmVpFzOJAqPgsgkJbLQcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH1PPFD8936FA16.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::624) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 21:43:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 21:43:46 +0000
Message-ID: <442fc004-43ba-4f51-b240-ea24668c4cea@amd.com>
Date: Tue, 18 Nov 2025 15:43:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Move adaptive backlight modulation property to
 drm core
To: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Simona Vetter <simona@ffwll.ch>, xaver.hugl@kde.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Harry Wentland <Harry.Wentland@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20251112222646.495189-1-mario.limonciello@amd.com>
 <83aa8a816cf301085a3e3638238f8fba11053dc2@intel.com>
 <449ee5ba065e1ceee8f7a04038442cff24772df9@intel.com>
 <e934ece8-d70d-44fd-abe6-fcecae8abc85@amd.com>
 <81da4bd8bcf6110145964f0c314dae1ea3046d10@intel.com>
 <o737pxpoq5t62xlvgflhypn67o6d7qohl5zm5ufgtojxlkw4cv@ao6d4gscekny>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <o737pxpoq5t62xlvgflhypn67o6d7qohl5zm5ufgtojxlkw4cv@ao6d4gscekny>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:5:334::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH1PPFD8936FA16:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3993f8-614a-41a8-4854-08de26eb8d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KytHdm44eWUzaHRCWEJjNjNSR2tuMDh6dGM3YVY0MVJVenpwY283OGtXYnJz?=
 =?utf-8?B?TVBmWjNISFF3RnBza09IZU4rUDI2K3R2emtSeXE0VkdYQlBlZkVJajhRVXZS?=
 =?utf-8?B?aG9NOHVrbExTalh3ejhzMjBYZXl4RE5RMDZuRzdRazJ1UHpCNmlEaFBDUEsw?=
 =?utf-8?B?SFNEL1ZweENNQXM1Rm96WEdlSnBuUyt0M1ZocXZ2QWFMZG5USkRVQ0VQa2d2?=
 =?utf-8?B?c0NRTjAwZEdlZFhxbDFWNXFRTFh6WEVkL1VBU1BpVDE0Q2hodmhzbDVrYzNv?=
 =?utf-8?B?VHJsa1VFVklVKytUWFRHWndPNUxQMjI1UUROWmtvUjhKUnoxRFgyc3B2UEJw?=
 =?utf-8?B?TkpJZ0JLeHdiUlNXVnZ0Tmt5QXByVzhXL2l0S0kyQ3hWRXpuSFpLL3dnRHBl?=
 =?utf-8?B?WngvYjFUSHpkTlk2VjBzSHh5Qnk5YWdML1NsTldMTjBkZ3plR05BRHZ6dnhO?=
 =?utf-8?B?eHdpV3dSQXQzcTBMeHZHRmw1WVlCSTZXV0FNR0VTdmdqMzRxWWxzTnYyUm1G?=
 =?utf-8?B?RExQVWZLNGpXblNrK3VIQkQzZmxad216TUc2YjI4ZVZ2SFlRc1FzZFp4MDla?=
 =?utf-8?B?SjVvQndTOUo2SEwvSnFON0xqMWNwRWh0TmRJczlVNnorN2d4cjc4SHZlYzgw?=
 =?utf-8?B?Z01sQXVoemxTTEo0TlEwSXMrSUFYZUtxamM1MDF3cjZnNEpPMS9OKzh3bWJs?=
 =?utf-8?B?MUIvNUtjSzNyRU44YmVBdEtsYkcyUW9IbTBwdG5QeHp0L3N6eUdsajJmc2pF?=
 =?utf-8?B?ZzBteTFDSUZQQnFLSDNMMDNzbmg5MDVyb0QrS1J4NUQ0MDZpWTJJODRaWDFC?=
 =?utf-8?B?T0ozWkNEKzFFSWpLMXJqbzJJYlFMY1ZqbWYvKzVoajlaLy9GeHBsSHVmRHIw?=
 =?utf-8?B?ajZ2MkV6c1I1UVgvYXhJNmxWSGwyMndmS2xPVGhlSlA1U1FzUVRoamNCUmZV?=
 =?utf-8?B?dG8raWVxM0IydGN3ejA1Qnh2aVpaQWVFK2JXdEpKaVFvSnB3VDZDeFVpUHBL?=
 =?utf-8?B?TmNpZmJUOGIvM3l3WGdlVXpNTU5lMUtRVk9TOEhwblpPWjVES3RrdlNBaEN3?=
 =?utf-8?B?eERuS1F1c0M1Ti9sSEltSVRxekdsdytUQUM1Zi8xdjhCcDIxWVBRdHlTejJl?=
 =?utf-8?B?SVo2WnZ5ZkRzSE1tVmVQWG9UcDNjeFRnenFuOFZENWhocUE4SkZ0bUM5bjdN?=
 =?utf-8?B?Nks0dXFqRXBjUG8vZWdVblg3YXl4RHE2OXhtQzZOMHpnWHQ0SjkydTFFZ3lT?=
 =?utf-8?B?TXdDWkN6M0g3NEVwU3ZlU2NnekNqRHZKT3d5OWlZc2ZQekN3TS9UZm9NaFlX?=
 =?utf-8?B?RE95aDFuZnpyQVpYY0YrMlRiSEhqT0FNS2tWL2xCTUo2czNETmJpVkJiTzFy?=
 =?utf-8?B?cEJhU0pXTTR6UjV4aERMWElGRlpZM0xycVB6MmlJODFLdnpBejFkS2dOUi9n?=
 =?utf-8?B?UHRNejl5dVBKMG1NNFN0NDJzTWUxRzdudjBtRUQ3MjZqdUVucHozLzlTM2NU?=
 =?utf-8?B?RDVrUzVlZ1ZMSlV2M1MvTWhXcVVTZUNUY2llZGtwZFRYVE9UQ1R0d0VFd01E?=
 =?utf-8?B?VUVuOGQrM0gwMFlxWGkyTjVaTHQzRmNYbDd0ZHRiTWJGVjk4dEpIejN4UjNt?=
 =?utf-8?B?RlVtQW5kQWxmYXgxRUFJbEowalE0akFLL1RVNk1ibW44akxIVUtWcjBXeTVR?=
 =?utf-8?B?U29xWCtNcXFMRmtaMm81TkxLczZBazBBNDVQei9BUWVXcWdiNjN0WjRJczFQ?=
 =?utf-8?B?WDN5WVJHeHB2c2FPSHNrajdVejBGcnZiVDhxTzV1Z08vcjQwMnVYQzNwaEhN?=
 =?utf-8?B?QTY3MFlWMnNjNC9Gb0RwQ01kVG5mbFljSHZFOXdVZWpmZFZ4QVZSVWVlWS9w?=
 =?utf-8?B?b0pQKzUwVU1VYWZVYXl6em9vVEVwVlZtRUw0RnhFMGhSdWI5c0F6OExLOFYr?=
 =?utf-8?B?MStHcnZzcDhDR2RwUzZTZmpEdkdIQWdXUnBCVEc0NjhIM3g2VlhBblZqeER1?=
 =?utf-8?B?aWhoZFMwWkdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjJMcGQyeGJKYm1qSG9Id1k2QVdNWjBYeTRTbVAyTnNjc0I2aldxTE8rVEtH?=
 =?utf-8?B?a2xJVnMvUFB6OVg5R1RaS1FrM3FZSjNGZzZqNE9oNFRkNjM0cis1OW5sWFB2?=
 =?utf-8?B?ZEhhS1VsSzdVL1VrWk1zblZiNGFDUFFjQ3JJSmlobWw5VWNvVjBBenpJZGRM?=
 =?utf-8?B?SnYxSjFJM3NidnNZNDRFTUJZRU01OURMeWtmU2RwZGVyWk5QQnI0WlUxT3A0?=
 =?utf-8?B?VEs3STBvWE4wTTd4T1MzSkhGcC9aTVVINGdRWUdzTzA3WW51L3ZMN1ZKenJw?=
 =?utf-8?B?blZsaENsdUJjYnR6Nm1tcWVRRkVCNGRKaEFPUWZEdUpweS9tdkNIaFpzM2Rt?=
 =?utf-8?B?YlpGVnVPWnVnV1BTc3ZoT2IxRUhsR1JJT3k5R1BGNUxaMVRpVlE5Z25uUmhw?=
 =?utf-8?B?bTZMWTNUcWdreXp1eE1qMTF0cERNcXlUNlg2Tm9qWmlkNDZvbTRSZzZCTjF0?=
 =?utf-8?B?TG9GbEdYWWpJU3B0d1ZiMFNqcWNOY056elkrWjRZUWNzckdPZkFiWnlSMTRy?=
 =?utf-8?B?YndaZjNkMkRSdmE3YlZSQ1FmMmZoeW9xcFJNOHRmRDZvMGJ2WHVYaWJQVWwz?=
 =?utf-8?B?VnVPeThJbWNJc3cvQ3dQWXp0dDVSY2d6ZVpIZDV0OGkxSnc0QWI0WHY1bGhz?=
 =?utf-8?B?SURnbGtUOVl1SzlJdkxOdW9qSTdkZmEwdWNKQmhFRjlNQksrcmZRbjhtZ3ox?=
 =?utf-8?B?aFFGb3c4V01kTGF2d2VnM3VDVzgrdTFkVHIxTURqMGZ6MitObHV6amRETkhQ?=
 =?utf-8?B?T25lM0MvTTJFRmswd2E0NldIdmJUVmRVUnJiQTRmcGFhQ3RBWVNDZWpOajk5?=
 =?utf-8?B?YSszcU5VMnd2WWNXZndWL28xUGZ6K3RtV3JxS00vRHd4aytuZU5sZjBRZ21G?=
 =?utf-8?B?MVlZL0NOcGwyeHBSOForRitmL1R5ZnVOaStJK2I1eXBFcTdlc1lRMFJBaFVa?=
 =?utf-8?B?NG1ZQ0dZY2djeDdXcngwenQrcHlUTFRDalhFQXFLT00vU1lldVB6bkh5TVk2?=
 =?utf-8?B?ZG1velZrZzBNNjJ4UlpQcGtORk5aOGxybk1KRG9mT1dPU1pKT2lvcmVQM3Fk?=
 =?utf-8?B?K0RoTGEvbWt2NUZVOTdjNFZScXRZcEtaUlo4L2pCbThZTXRKaW9oWmhZdUhv?=
 =?utf-8?B?em82MnEzRTR1VDRYaWhOL1U5RGFyYXFFNms3WkhJUnVmUXFidWh0ZHRuM1pP?=
 =?utf-8?B?ZENNYVFkUWVLV1dmSVU5d0t5OUszWmNTVVN5dTdlK3FBKzl5UWdDdWVxTW5H?=
 =?utf-8?B?cnRmTVRSZSt6M2NNenNrTExza0tHMURpUEJVZU9WQ00rYWdjTXlVbjZVWG54?=
 =?utf-8?B?N1ZoTlhac1VIeXI2K1RGZ01zUWhmU0UrOXhpNktOemI5RDMwL3VkQkNZeStS?=
 =?utf-8?B?M1M3bWh4dSszZENCOVR0Uk42T3RwYURwbExCRlllMWtlTkJPMllMREpHWDV0?=
 =?utf-8?B?dXNvR045SFJ0cTB0YlZYeWkzbkc4M0FYZlhQUzlJT1dFMlNoNUxvcmFqelR5?=
 =?utf-8?B?UEtIWG10TW1rUUVIbmh0bFlsL3dxODVoMmM3ekNUNi9UZkgrMnhmNHFqZE9s?=
 =?utf-8?B?ajNYbXM2MlVxOWlBeFlNTXB5QnBVeHEzcGdIeTdNMStuc3ZtUmgrTXFBd2Qz?=
 =?utf-8?B?UEd2Z2NPQW1HK3pncHk3Nk95MjdNOFhudkcvbmwzOGs5OUpxY2lKcDliejQr?=
 =?utf-8?B?b1E1dzR1OHNTak96Mm1yTG1heURpTC9iZFJWcEswU1lYOE1XVzdxU3JXcXJt?=
 =?utf-8?B?K0thcENlVE9TTHNlbHB4OXlDdWRkd2p4ZE1qZGI5aGVZNHA5MFR0Q0NtQTcr?=
 =?utf-8?B?ayt6L0xCQ25venJlYTNKclhOOWxmSzNOWmpUV3JqZDNTV3V1MUlDZmwvY2d0?=
 =?utf-8?B?Ky9rTmV3TDVTN3VRZk9EaGZlck1JODJ0SHRtWmR5am95bWIwdEtVQ3owV3ZF?=
 =?utf-8?B?NThXWEtnbUV6NnQ2NDZhcGtRbnc1Z1NkcjJEV21PbWlKQlBVeTNrRVBMcTUw?=
 =?utf-8?B?N1pEcVptbUoxYm8vWW1KcnNPdWxGZ3Ywd1RRTmM3WXlJSzVpVTFRQlNzRDBa?=
 =?utf-8?B?VDgzVyt5ZFhkY0JnakwyS29tWFZCcUp4REpyTUZOZFlXL2VqaDlGN2tGdEx6?=
 =?utf-8?Q?YIW/1HnbViDVIKunATA8KWcc4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3993f8-614a-41a8-4854-08de26eb8d0a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 21:43:45.9873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LwlaZV5lCy19IPNwm+HHpc8zhjnDJqgb1gSfxWFTQrX2ZsKO0hEK16F5PmfkN4fKDuiwblgNYe2rqF3zBhBrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFD8936FA16
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



On 11/18/2025 2:47 AM, Maxime Ripard wrote:
> On Mon, Nov 17, 2025 at 11:05:10AM +0200, Jani Nikula wrote:
>> On Fri, 14 Nov 2025, Mario Limonciello <mario.limonciello@amd.com> wrote:
>>> +Xaver
>>>
>>> On 11/14/2025 2:39 AM, Jani Nikula wrote:
>>> <snip>
>>>
>>>>>
>>>>> So this is basically Content Adaptive Brightness Control, but with the
>>>>> technology ("backlight" and "modulation") unnecessarily encoded in the
>>>>> ABI.
>>>>>
>>>>> You could have the same knob for adjusting CABC implemented in an OLED
>>>>> panel, controlled via DPCD.
>>>>>
>>>>>> + *
>>>>>> + *	sysfs
>>>>>> + *		The ABM property is exposed to userspace via sysfs interface
>>>>>> + *		located at 'amdgpu/panel_power_savings' under the DRM device.
>>>>>
>>>>> Err what? Seriously suggesting that to the common ABI? We shouldn't have
>>>>> sysfs involved at all, let alone vendor specific sysfs.
>>>>>
>>>>>> + *	off
>>>>>> + *		Adaptive backlight modulation is disabled.
>>>>>> + *	min
>>>>>> + *		Adaptive backlight modulation is enabled at minimum intensity.
>>>>>> + *	bias min
>>>>>> + *		Adaptive backlight modulation is enabled at a more intense
>>>>>> + *		level than 'min'.
>>>>>> + *	bias max
>>>>>> + *		Adaptive backlight modulation is enabled at a more intense
>>>>>> + *		level than 'bias min'.
>>>>>> + *	max
>>>>>> + *		Adaptive backlight modulation is enabled at maximum intensity.
>>>>>
>>>>> So values 0-4 but with names. I don't know what "bias" means here, and I
>>>>> probably shouldn't even have to know. It's an implementation detail
>>>>> leaking to the ABI.
>>>>>
>>>>> In the past I've encountered CABC with different modes based on the use
>>>>> case, e.g. "video" or "game", but I don't know how those would map to
>>>>> the intensities.
>>>>>
>>>>> I'm concerned the ABI serves AMD hardware, no one else, and everyone
>>>>> else coming after this is forced to shoehorn their implementation into
>>>>> this.
>>>>
>>>> Apparently Harry had the same concerns [1].
>>>>
>>> So let me explain how we got here.  At the display next hackfest last
>>> year (2024) we talked about how to get compositors to indicate they want
>>> technologies like this to get out the way.  A patch series was made that
>>> would allow compositor to say "Require color accuracy" or "Require low
>>> latency" are required.
>>>
>>> https://lore.kernel.org/amd-gfx/20240703051722.328-1-mario.limonciello@amd.com/
>>>
>>> This got reverted because userspace didn't have an implementation ready
>>> to go at the time.  One was created and so I rebased/resent the series
>>> earlier this year.
>>>
>>> https://lore.kernel.org/amd-gfx/20250621152657.1048807-1-superm1@kernel.org/
>>>
>>> Xaver had some change of heart and wanted to talk about it at the next
>>> hackfest.
>>>
>>> https://lore.kernel.org/amd-gfx/CAFZQkGxUwodf5bW0qQkXoPoz0CFFA1asJfUxFftMGgs5-VK2Hw@mail.gmail.com/
>>>
>>> So we talked about it again at the hackfest this year and the decision
>>> was not everyone can an octagon into a peg hole, so we're better off
>>> re-introducing vendor properties for this.  So series was respun per
>>> that discussion.
>>>
>>> https://lore.kernel.org/amd-gfx/20250718192045.2091650-1-superm1@kernel.org/
>>>
>>> Userspace implementation was done and so we merged this for 6.19.
>>>
>>> https://lore.kernel.org/amd-gfx/CAFZQkGwLWcyS0SqCHoiGsJd5J_u4aBJ0HMV5Bx3NknLdLkr8Uw@mail.gmail.com/
>>>
>>> Then Simona suggested we need to make some changes where the propertye
>>> should be in generic documentation etc:
>>>
>>> https://lore.kernel.org/amd-gfx/aQUz-mbM_WlXn_uZ@phenom.ffwll.local/
>>>
>>> So that's where we are now with this patch.  I can clean it up per the
>>> feedback so far - but I think we need to be in agreement that this
>>> property is actually the way forward or we should revert the property in
>>> amdgpu instead of this moving approach and keep discussing.
>>
>> IMO we should either
>>
>> - admit we can't do a generic property for this *and* keep the vendor
>>    specific property details hidden in drivers, or
>>
>> - figure out a generic property and add that in drm core
>>
>> But I'm pretty much against adding an AMD vendor specific property in
>> drm core.
> 
> Agreed
> 
> Maxime

OK - I will discard this patch.

Simona, please any comments if you still want to see anything change 
from the vendor property.
