Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FF991DDD9
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 13:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2AB10E3C8;
	Mon,  1 Jul 2024 11:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pDSlB6YS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801BD10E3BC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 11:29:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIvyeT5jb0F38AtD7LMlrLEEHi4/3KoF9HKOJPkvfmT8g+sTkqeHgdNfqBbrMIp3GByyo/cZqb0ebm9TPM9eQu3dVxfvoEoYOsFSeMIz0nWcQWnnJfgjyOMiJ9d4mYlU7tZ1My2GTYr89p3HgeBUEyoql+PUmw2NAgiOLEQobykvuUpaEMeUdrhlLAk7YcvK573CfrjGg4lelAhTf0DA6ArE/dYh1D3Qzi5cM3eS6B3T21OFbQMgy8tUkN1lY3imduf4Ajci0gzhB+UU5l7iJpEyiB4PvJJ9gppcqOVUP6MwOKLhW/cE8312+D/UwcaA1QId++dxqjTTtrBQphjlzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WA++B+C6YvQ/gML+B3cD4hVv0Cu21rfsQI+gejK4tao=;
 b=SFK1A+aI6jktIsAGSV82c92Q0sdtthTOKzmUYxWxL9LvDeSdUSC+soieGBC/trypHfDj4DmbxLVPwHLOQnJf66jrTqUY5pKjCzJn2fRGbLF1UQjGIxaj4298JzXsPsvp2XBLJLxlS4YsW4UEfdpEGIwNjSdnatO2iJ4sCS3E/RMZemSletaj8JfPUIQdXrZMPrDcJSVnKZpdrj91ghp2YoVc759mWCTFPLco6qPtTNQuDdxsLYmQ6YHl4dhb/V9wbdijRegeUPVAUGjoUMecMsbmkwBE/uqEkhs56eubPzmkEXOjIcqj3rKJ9sdZomDQ5OItct5PJPKwV4j0HcSk3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WA++B+C6YvQ/gML+B3cD4hVv0Cu21rfsQI+gejK4tao=;
 b=pDSlB6YSFfzFROiX70u9Yi6Kf4GeC6lBmtZ2IjlErpdnwMLHCfaN4ndXk0AOAGAlJuuru5zFQhK/1iP9kDd4vo2kvjsmf1TkgmIY3wUbgnW5DnrOFQqHfgzvQVLnez2/pcfnI80HWVQ/Mx4npYZtQAHi96wFG2pW8LSid2xRtfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 11:29:55 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%6]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 11:29:54 +0000
Message-ID: <4899690e-e1a6-479d-aff5-7a68b5ed756c@amd.com>
Date: Mon, 1 Jul 2024 07:29:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] drm: panel-orientation-quirks: Add quirk for Steam
 Deck Galileo revision and re-label the Deck panel quirks to specify
 hardware revision
To: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>, Hans de Goede
 <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Schwartz <mattschwartz@gwu.edu>
References: <20240628205822.348402-1-mattschwartz@gwu.edu>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240628205822.348402-1-mattschwartz@gwu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::35) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|MN2PR12MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: 150e8a8c-a80d-449e-bebf-08dc99c12155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlJaVnlnU0FIOFZBL1pRMm0ra3MyS1NOQnpNV2MxYThHalZmUnhwbkp2RE00?=
 =?utf-8?B?c25CNXEzcDRBZ25JemdKanRYRmpGU1BBTnFwc1JscVdjMzBQQ01jM2VYMTFJ?=
 =?utf-8?B?dzU3VEtkSDY2Nkl1dHFheWVoOVY4SmxBejhlZkN2c3lXZ2JkaHozZ1FyMTBx?=
 =?utf-8?B?c1h4SklXY21IVFFNditxS1pqM25iVkIzYk43MktxY21wbmMzTEJhVWVURk5w?=
 =?utf-8?B?QWRjRnNPblJjTysxWDB4V25Pa2MrdmlpaGN6aDJNLzdSOTZRWUpMVWZWQVMx?=
 =?utf-8?B?UUdCeUNIY29oU3hpV25od3ZpSkdYR2JGd2tDbG1BMmZFTjRITTZhZVpGQkl4?=
 =?utf-8?B?Nml6L21GcDhQU05sS3JWUER0ZENkNzRjQ2dsSzFZYUlzbTNwZXRyTUhKYUtS?=
 =?utf-8?B?V2FCaXJySkVVM2Fud0RqdTE0MjFXZldaR1lGUE8zR1V4VTgrWjVrWDh6ZWFy?=
 =?utf-8?B?MjIxR2xxNklBaG0wbVlkc3BMbklsQUdmM2REMld6MWl0aHRuSCt2QjlDZE9I?=
 =?utf-8?B?RGpIaUx2ajZTdnFWbHRNRW9HVkM0Z2NhcTlwTStlUjllTEtRVXdJK3Rpa1ZN?=
 =?utf-8?B?UTYvU0hpNDNBdWtFQ0xwK2FoK2d5MEpuM3RPcFpxTkFhdHdzK2c2SzhscnBO?=
 =?utf-8?B?eU4zS2tGSUY0YXlmbGVwTWtDa05NYmVJV3JwQXlIMC9WQlpEMWZNTXhsWStw?=
 =?utf-8?B?ZW1mTGhXMngydlVZTjFJRFBzUmNmWG9PeVlhYXk5VXIyZ1pMTVFzUHRaRSty?=
 =?utf-8?B?d0V0bkpkVjQxRWpROXAyVjE3SmY0dUdtTnQxM0dsTmhJY2Q3VGtoc2VkRGhO?=
 =?utf-8?B?ZGcwUmNhZTQ4Wk5qWFhLb0RLZEdKc2RNMU9HZmpZS2RhUXZ5cXhrU0dpaXFX?=
 =?utf-8?B?ZGh4SFhZY1Qzb2pZK0Q0b2FaUHVjV2xwMmxCWW1Wc05xK2ZuVmEvWkwxalY3?=
 =?utf-8?B?WGpPU1M2SWhJbGNGeWxxbTU4UGVHTWlVWnlUVkdlWThNYnBsaU83dkQ1eFQ5?=
 =?utf-8?B?U3YycGhtWCtHQ0lldlBseTYxMCtiZmdRMTB0RjZPVFJLekZjT1R6cXRIUHg4?=
 =?utf-8?B?ZFFxNjJTNHRWMGt3eWEzbGRNNlowc0pqNEhxd2RsYTYwVHh4M28vV0ZEOU1Y?=
 =?utf-8?B?azE2d291REJoVm9VcVhaQmtiTjJxNlpobW9Sd1p6VDF2RVVFNUozSE9BYWg3?=
 =?utf-8?B?Z29TcGtOY05ISktKeGF0OFVzNVhEVWkrbWQ1bE9YUm9ab3Rkblg1eE9pUkJh?=
 =?utf-8?B?dk4vc2xuUTZhV2VQd3h6R2lIQVZ4QlR3MXpNRGNEUW5IUlBWcGpiWlFOZTZk?=
 =?utf-8?B?TTVUVE0zdjlMcHM2d05tU3BBRDUyUGtxa3VwenBRQTRoaWZYdGFkMDlGaDJY?=
 =?utf-8?B?WjlxYkdUaERuRmtjQmhSbjQyUGNicmVnZStxaW0vNno2QW91MGxvNmpIM2tk?=
 =?utf-8?B?ZmxrU2NWWC9qQk5ORncraGN5c0NKVGlzSzgxVDNHUnU1TUxnM0h3Mnh1eUc0?=
 =?utf-8?B?eXI3ZEFxbXRVa3RCUW1Mdm5mRzBERjlzU0RnemdjT0o2aDVyV0lEZm1neVd0?=
 =?utf-8?B?ZktoaDNUTEx6OWUrRzJIZ0tPcEluOVo3RkRFTEpWUWk5MkxVcC9FMkw0elBz?=
 =?utf-8?B?U1BRMUFrSU52aVRvV2tCNFdnMUY4bU13OTRrMlFXZnpEb3ZtSHgvSUVCR2Nq?=
 =?utf-8?B?dDhHcXVUaDhudlU3Wk5BVnh0ZnVWN1ZRVXRLVURnTVdjakN6NWNJUGRrN0pT?=
 =?utf-8?Q?aMNXmT8wgNO4MH/Xe60mRlAAYa2TKc/jaZ+k+aJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGZMMEhNeGNDQStVOExmUWlpaEkxemRJRWMwY3FuSmpvTmgvOENRL1lud1N6?=
 =?utf-8?B?dTJJNDI5U2NzKzlNNXJobVJnZm9JaWl1TkhxMS9veUpuaXhkQ0tIaStuWG1p?=
 =?utf-8?B?YzZjbisxVitReVdST00xNFVEajJxM0l3QkVQLzFlTUtVa0pkWUk1dzljVzdC?=
 =?utf-8?B?R2pmUUdBaGpwWEQ4S2pCQW4vemF2YWQwSnZtYWk1VkVWTWxGM2Jjb0J5NFRv?=
 =?utf-8?B?bGc2cjVmRUZQSkhqbFpVQTVZMThjOXh3bXFwdWJGUm1DcnNPdHFyL3FhRjlo?=
 =?utf-8?B?NTlQb29IU2MxNWtGRXhWcG9hYnBJTVVRUkJkaHcyMjhrOTNzOGdIejdmR1pP?=
 =?utf-8?B?Nnc2aG51OWtVamtLV0lHUVpyQ2l6aGtUVjB4WjZuZjk0SVpWaEREbDA3YkJL?=
 =?utf-8?B?Z2txQjB0TklsaTdCUnlyQkpYRG92YVpZN2tKbkRpNEVGOGVEVkJwU0pGOEE2?=
 =?utf-8?B?TnNUK3lmaEprQ2tpQ3JnMmkxUHNEeVNQTHc1a3JNbVVwcVJPK3hiY1BuM0pP?=
 =?utf-8?B?bDd0eUk5OGJqb2duZjQwcDUwZnRwNUtqOW8yVy9ROW9Ga1JubHh4d2Myczgw?=
 =?utf-8?B?S2VhN1kraWFpb21GSVRWY05FUFNrU1ZoUUJlMFVaYkNJUlJ6dFVQWmtkMFlZ?=
 =?utf-8?B?d01uY3E2UjZNOWVQbGsyWEQ4OHNLa2N2V01nVXhIRmVlVVJ6RjU3WE5mbmN6?=
 =?utf-8?B?aEl1LzA5c2hHaHp0eXA4ZVNjc2s2YmlsT1pDb3BLeWFMUENEbHNLNi80eTBk?=
 =?utf-8?B?Yk1hbUdtbytaTUVHVk1mWWJSZng4dTNWQ2NWYUluOWhqY3FJNFNpTlNxeUw4?=
 =?utf-8?B?YjRqV2pOT2huY1lZdG4xUWtuUzJ0eU0ybDAwdUUvbm5NMTVtOHVNQzl4TnE3?=
 =?utf-8?B?djB0Q0xZL2xuL3ZWWnlZWlZqYmZPR2V3UTJzMmQ4SmpCVVFxMHE5SE5wMjg5?=
 =?utf-8?B?L3BPbTlLVmwrWmxrRWJLMlo5ZzFnWkpEYjhSNU9BYmViNDlDTGJDM0ZPNitL?=
 =?utf-8?B?TmxLR0RUQ0JlUnYwcTJQaGMzV1JyZUVtUkxaL21kNEpwdlNvam1SRC9LVFBy?=
 =?utf-8?B?TlhhVXlZVCtwYlk4NnNKamRPY1JXNEF6aTA3R2VXR2Zxb2pwSllzS0hkd1Jr?=
 =?utf-8?B?bUNWZUYvVnFMaldrVFJ3WHNmN08rS3hjVlkraVllZUdIRTUvb3piVFZ6Tk9U?=
 =?utf-8?B?eG5wVGNjQjNaUkFKbTNJbVJrcVhKYW9NTVFyU3VtdnZocVFHbFJOUUVkdk5N?=
 =?utf-8?B?V2MydERGYUdldVF5bEpaeVYwcGVXeFFPeStocHRzbXhwQ2ZpYjFuM0E1YjEy?=
 =?utf-8?B?RXZ1VXJtUU9sRUtuSC83QlIzaDhpOCthZmV6Y0IwQjRyMEVLdU43cG9RRWox?=
 =?utf-8?B?WDV5bzZKaGlJWlRiVy9HTVU1V0xYRlZiRFhVK2x1MEtLWE01VERiZ01wWnVT?=
 =?utf-8?B?dGNiWW82MThXV3A5V3Y3L0h4Y2hlYUJ4ajlCSDhqL0xMZHE1MHduWnJCK1JS?=
 =?utf-8?B?ejJjL2g2NUhQNmlaRXhXRkNmb25YLzI2UlE2MnNzQmVKWTM2MzZFMC8vekR0?=
 =?utf-8?B?Zi9rdFl4RzJEZ0cxV25velZVMVVYSitjVDRseTBDcHJZRjQwTFAvOVNxelhE?=
 =?utf-8?B?RUs2MUtGbXNtMjI4WG5ESzZCZmowTzlZRDBWaldENzgzeDh2WlhDS0xVdzBS?=
 =?utf-8?B?eTQxOXRIZXErRXF4WHBBbEFCMWZMZE1pMlpoS2tpVFZzTDVIaExuT1R6RjRL?=
 =?utf-8?B?ODM1clNqWEIwd0phS3N5SU5SL1p6MU5XNThkUGNWK0dNSmRnRWpFWVdxbTIy?=
 =?utf-8?B?K3N0UFYwNmlJTlpsRVhaVW9EUjJnYldGYmJSc1ZITGxtc0ZQcUZSYnhGNTRB?=
 =?utf-8?B?SnNVTEZiWTBPRGliVkUvbWdPQXNISjk5TzdSR1pkU0hwZ1k0dkJLM05rT2lu?=
 =?utf-8?B?RjVHc1J3WlhmRFBnVkhkV0YvMGRrK0J1WkpLK2ZFcW9TTDBOZVpERGFCaHNH?=
 =?utf-8?B?Tm8yTTNQRzJPZUpLSklrVVpmbUFWMTNpc0dJeHg4RHNSbDRZNEdua2pvSEl0?=
 =?utf-8?B?UUdWZ1ptYTU2L2xHazAzQ1RmSDZ1WGl1N2RFRGpWaE1FMWhjS01EMzZNd3da?=
 =?utf-8?Q?/3AVXU+SyPSgAWbZRZSiOfoBC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 150e8a8c-a80d-449e-bebf-08dc99c12155
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 11:29:54.8189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ChpsQw6HvZBXmREnCdZEijKhxfcGGOqu/UokrGPJXRq1UFD/96BAabGdw0yWss2kecfdVMNs16tK9HBN0f7rig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470
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

On 6/28/24 16:58, Matthew Schwartz wrote:
> This is a series of 2 patches.
> 
> The first patch is from Valve's public kernel
> source tree. It adds a panel rotation quirk for Valve's Steam Deck Galileo
> revision, which has an 800x1280 OLED panel. The previous Steam Deck panel
> orientation quirk does not apply to the Galileo revision's DMI. I have
> added a short commit message and signed off below the original author.
> 
> The second patch is one that I authored to clarify which
> device version each panel quirk applies to now that there are
> multiple Steam Deck revisions.
> 
> ---
> v4: add missing S-o-b from original author of patch 1/2 and re-signed commit
> v3: fixup inconsistent patch versioning across patches in v2
> v2: fixup patch 1/2 commit message
> 
> Link to v3: https://lore.kernel.org/all/20240627203057.127034-1-mattschwartz@gwu.edu/
> Link to v1: https://lore.kernel.org/all/20240627175947.65513-1-mattschwartz@gwu.edu/

Applied, thanks!

> 
> ---
> John Schoenick (1):
>    drm: panel-orientation-quirks: Add quirk for Valve Galileo
> 
> Matthew Schwartz (1):
>    drm: panel-orientation-quirks: Add labels for both Valve Steam Deck
>      revisions
> 
>   drivers/gpu/drm/drm_panel_orientation_quirks.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
-- 
Hamza

