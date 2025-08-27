Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844C5B389AC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 20:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C6610E886;
	Wed, 27 Aug 2025 18:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vPmH6Hff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961C710E882;
 Wed, 27 Aug 2025 18:38:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdW8EKuxakz1Dx54q63JcEqBFxHob+2hNWDQsLg+H6rI9rE42G6UO6wochIu2u6BYoVdsBB95WU/CzcqfaXtD5EM1btB1ESmPN0Y735n0NQn38EUxEwEtbyYzB+C9cKHKc0HyfaoxeSYJkV2F5pFHCYJLw0mEoziu22qe3oTiERhQMNC1DFwhPw3/dWCzUercqwLCj1ImmAdZN0SbNmeThdsXir8x2jHbcT1dMmWRebo4I3l1WZQCr8qC5MZRF4e0owvN/WqOHZCFzOPD97nB0jrlw77t6d7kkQVH5a0hiueyOL7Hpz2ClPXxH7c56+jIfM2h1z6m30QKdsa38Urug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1k/N4dFBAQGK/cbqGsY9nEwOYtwTyPF7mo0miU+YEQY=;
 b=l6ZGuHtNQWj7Tv8oS2P2lFG9rTELLLOiFN61QLvlxAFfc9br0WYY4S2M1kBJRO/1zu6CYX3IZL9e2BboWbK4kdyxgIkkSwEi3b34SrKsP2Y3rBYx2aisH0TL62h4PWUyMBCKbWGvGIH/hZf8UwrvuRlXdsK5ZgcEGcFGeSPY2c23aXZRiG7tMSML4wCh5J4CrGMA1d+lssYrwep7PzyvoUnQ2iDhETmMQMZe/fTVbjrPkkv8IeOpbHw99gHAkR4Cws5velTjPd5uQoyjVAR7s9H1R4m2TlrX7BevTONOcFeRppHCPp4cRZ6i4AB/nd9ILY2jhe91fi6ePgl7Y8NOLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1k/N4dFBAQGK/cbqGsY9nEwOYtwTyPF7mo0miU+YEQY=;
 b=vPmH6HffVgO2b7DEUZ6SL65DmNXXhDrY6qCls0UPvkYmSKEzRw8X0Ne2CuhkWFmOQKG007dhhJ6qJvQ/g7cLTDRg/QjFY5YWapPSXk/oqnXTrnV1wC8a/I/QQgNsBgI4lxw6u+jm830a1aHM9gwAVCR+9p7q1MjT0ndCg1pvZjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB7543.namprd12.prod.outlook.com (2603:10b6:208:42d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 18:38:23 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9052.017; Wed, 27 Aug 2025
 18:38:23 +0000
Message-ID: <607d5062-1734-46c4-b851-782bd7ad3ec7@amd.com>
Date: Wed, 27 Aug 2025 13:38:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm: panel-backlight-quirks: Do partial refactor
 and apply OLED fix
To: Antheas Kapenekakis <lkml@antheas.dev>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 philm@manjaro.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Robert Beckett <bob.beckett@collabora.com>
References: <20250827174400.3692549-1-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250827174400.3692549-1-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:5:100::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b33e36-68f1-44e8-0c03-08dde598e722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1FJejcxN082QjUxR2FnWjVGcEoxTEZvTWN2YS83T1d4cWRwL05OdFdjM0x1?=
 =?utf-8?B?bTFGQmQyWXFhOURiejZMNXdJeHBXaEtSdjFBRXgvMWV1aWk5MTNSaGdkZUZk?=
 =?utf-8?B?a3RaN1dGUjc5RTdCcWRUMUVoSks3WGJrbWd5UzdyelFEUnhsM2I0TWJjWDI3?=
 =?utf-8?B?RXhwWmREb3Q2ZXpNTHNkQ1ZSSGFBaUc0SDczSUpGUmFkMUUvMk85OU01YWQ5?=
 =?utf-8?B?MDZxbFVOamdBWE5uN1czUVVsR3Vib1pDRUR6b1hjVGJ0WURGcDArdHJCU0Nz?=
 =?utf-8?B?QzdmMVlSLzlTazBXaS82MTRpcHlyR2lQMG44c1JGQ1I2NDlMUFhYU2QyUXFJ?=
 =?utf-8?B?SzhjZWFvWDNESlZCS0g2WHJJZVRvenZOV2Q3M3BjQi9jUkI4MlQvMEttRnE2?=
 =?utf-8?B?VHpUVnU4TTRiOTlrUGI5TmJTTDl2ZWlzVGw2OGlMYThUK0FaZTlOaUg2ZUpi?=
 =?utf-8?B?MEFqSW44dm85amtOdmJXakpUdWxGdjdhQmVhTkVOSUFFM1phdTU0bytWMW1B?=
 =?utf-8?B?WGt1WlJ5ZHcrbEptN3cwZm1taXlMRFJkYzBsUjFqalQyeGFiWlRHZUo2aWgx?=
 =?utf-8?B?UmtPY1BXV0JjL3VhS2d5OGpaR0dka1cwNEllanNDRWlsb1Y4dkFsY0lNakp4?=
 =?utf-8?B?SFVuSW1oZ2VQMVg3MGtPRVFNWldieU9zS0VDSkQ3UkVIbW5DSm92UE5Ma3dD?=
 =?utf-8?B?NUpPUFl4d2tvNFhoMHZxcHB4MFpYQzdJUm5pWGl6QXBLSDhwcjRIMURUbVFI?=
 =?utf-8?B?eUkxU3YzcDN4TGtUcGpMU2Roa1gzNU5Yc1JjWk5iQ2pOM0dFeVFmYU1laEk5?=
 =?utf-8?B?cDNHU2d0bnZpVkVqMUNSeUNqY2d1LzViS2NTcEJaOU1pVnRrV2NTT3FqMmJu?=
 =?utf-8?B?alZQLzdvbzdKS0hRNW5GanFUekdpQys5RUhKTW1SRmxCT1l3cjFJcjIvUHNm?=
 =?utf-8?B?SUluYUpXN1RVQ3owalo3NUNEVnhidFpsRURjNG9kT1dtelZueWdPK0VOVC8y?=
 =?utf-8?B?SStTODNad0ZCMXczV0pNSG1QQWNUUHVvRFZSbU9oR0dKcTBFcm1oYjJYbi9P?=
 =?utf-8?B?aHFmZkMxV1kvVmtIRkFXUWh5STFpRFVORDBVbW9TTUNRTHhSdHZkMy9jYm4z?=
 =?utf-8?B?M3RseDBwRjRRLzZSRHBmK0NBZHU0Yy9heXdudkcvdXJaNWdQRnZpYUgxKy80?=
 =?utf-8?B?amlRekhGT2daY1JwNmRBeVNFdmVoL1lwWUtsUGc3aXlQTXhKWXBSTlBXRTJu?=
 =?utf-8?B?OHN3eXVielFJdVpWL212RlN2Uzg2b25PRkljMGR5QzF0OVRkUzJxb0tFL0FT?=
 =?utf-8?B?aHFDQUNvL1c3K2xTWVI5MmtTL3c3eFJpMzRuVmZ3OGtGbUhoREZ6anNrU3RL?=
 =?utf-8?B?VjdnaEJUbnRZV095RFhTVExsbHM2SHpJV1RTeEZFNitBVGhwLzJnMVJndHJ1?=
 =?utf-8?B?d0hLU3hCWDR5RmV2SFFvRTVFN0VvZk5RKzhXSldJQ3ZEaVBBaDg3RFU0L0lK?=
 =?utf-8?B?WURiWHBCU0F2anFWOGlXWFNCZzdUbXVmc2lrWlNnYlVWSmxmR0J2NGdUUjc0?=
 =?utf-8?B?UW5TaDdtNW9Fb0dpdDcwRFlQVGZmcWRmY3I2dHNnanQxNHVjUnVXQ01jRDVL?=
 =?utf-8?B?UU9RRU1hRHdvNEpzMkQvUmpOZ0ZpbFlTTWZJbGhjWWNlNXUzcEJTVi9ONVVP?=
 =?utf-8?B?Yi9FaGdscmkwVFlpNkZpSmxRaVV0RFNRSkluZHZPZmpCZmVCU1lRbEovK3pv?=
 =?utf-8?B?L1ZtTDV3RjhWMlhSNDBGUkFIOFV0Ti8zMkhlSWxGWmhScXR0aDFpM29raFpW?=
 =?utf-8?B?OEJabnUxVVVmMFNza2ZnQyt2dE1DdGZWMlhzQyttTllON2JmNzl2d0pUSDQv?=
 =?utf-8?B?MzN4UjJxengwNVNxRUlSNFZQdHkvaFN1R2RySFUxWDdGZHFpR2JlYXVXU1J3?=
 =?utf-8?Q?VM06gWIIf6w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk0yMEZoSU44NlJPU2ltRmljMUNmaGVWNUN5ZWVrWm9ESklBWC81WWltRFJs?=
 =?utf-8?B?b2ZFQ1VqTHl5eng2R0NyclJNN2dYd1EyZUI3djlrcU94QUx6cks5blVsbkRY?=
 =?utf-8?B?RmhzQ2ZycHFLSFZjU2xQRG81YzRNMTFKdDdiUDB5b0d5dmh3aUluOEgvdGhI?=
 =?utf-8?B?aWF3MSs2WnVlVEszYW5QSEtDUVVNZmZGWGEwNklpMzlaanYycEw5NTRHT0Ny?=
 =?utf-8?B?NDd6QVhNUUVLSkZGanM3bkVZNjdjT2crdm91cEV0TndlSDkrTjVxTDdaMG1w?=
 =?utf-8?B?RE8yYUtmSE5rWlo0OHV3d2U1MUlDN1F6VGpraUsybDgzRWMwaWh4WnozelVE?=
 =?utf-8?B?SDdwUTJJOU8xTjhXeDRYb3A3Nk42dnhRRUp6dHlNOGdkYno4RHN0OEdxb1p6?=
 =?utf-8?B?OUZ2ZUgzYnVKWFNHUVNzTDZvMW4xSEplcTU0aEpIWkc1KytmSGJpaHBFU0Ru?=
 =?utf-8?B?M1BOSGJHaW5Sb0I4NnFVOUZtdnREK2U2YWhxRWl1Q0w4UStLdGI2ZWs0VjhW?=
 =?utf-8?B?eVZXVWdybXZ5UVpkcDZFaXhpOFl6a2NSNUpkVGxTRDUxRCtsU1BGQWdNS3BS?=
 =?utf-8?B?dGgyY1FNM21JUU1lRmN4RjkxaUhXTnVDcXFnVnZJWHdNMlFCZUMyL1g1UVZU?=
 =?utf-8?B?NzBhT0dUek1QN3g2V2RHQ3pOdmkzeGJhQzZjRmV6YXk3bWlZcHAyVUxFVjRI?=
 =?utf-8?B?RU1jSG4rYnV0TkNielZyd1Vzd2kzalBkQ2FiWlovcmVaaG91OGNyNE1tTS90?=
 =?utf-8?B?M2MvUkFjQ2w4b2p3QUpEZWlhWjJUUytLekpieVAxV2dCZFc3aHFhOUZoSllz?=
 =?utf-8?B?SHFyK3JmQ1VEOTNFOEI2NjFSSHJOWE91ZmhaQndhZytnNDRuMk9pUXRzRUVP?=
 =?utf-8?B?S2NjeXczR2YrMlU0eFVtVTJCQVplRDQ1SzAwUlFDNmhaOTdtRXdDSXp4TG9r?=
 =?utf-8?B?bHlLKyszcTdXVG50L1Nab1VtOC9KZ1QwSVZQWGthRWlxNzNzMXBwTWhIWHdr?=
 =?utf-8?B?LzM2NkN1TjQwNXJ2cThxNlBxTzJweEdOSElVWmFmNUc5czdlS04ySWoxYzV0?=
 =?utf-8?B?MDBObGZGdDRhYTh4UVNQbDUxVU5GRktIRnUzazZBYW50SXpCeFUvYjRiQ0ZF?=
 =?utf-8?B?ZXJDSGxmVFJFWGt2Uld6OGZBbFA1UEFuZC9UNWtKWnVQS1d1UnlXdVNGczRy?=
 =?utf-8?B?OVVzU2dXZ1BvOFNHNmRHK1Q5blo4Nk1QMTB1NmdnZTdWWWgyNU9lUmFKU3Zz?=
 =?utf-8?B?UjFXZ3Voc2ZGRDVhUUpCZlJrUFRtVUxhWG1hRDJoMXJ1RUl5ckw5OEFHa1k2?=
 =?utf-8?B?eGxNZ3U1SUc1c25WVm90NDRManNEOWZMUytQQTVwSVBFRzV2M3lhcW9rMXlx?=
 =?utf-8?B?dHpHeDZsNmxmdjBvRkgxS0dObFVFbGxXK3k1VEdKaTRiMGNORlo1ZWpZaHRY?=
 =?utf-8?B?MXFOV2VRS2d3aGVqcWJ4MWJFS2xJc0gxbmxXb2EybnVoMHByZnVVeDVQYnJK?=
 =?utf-8?B?ZHJ2dXRCb1JpVXVzTWo2VmpXWWR4Y0FLcUoyQTNnbVdQYUxBN09ja3k1ei93?=
 =?utf-8?B?SHZOUExQNnRZNGxIM1RIbWlCL01XbzNuc1pSVVhlN29TK01HMFM0YVBlOXNO?=
 =?utf-8?B?M1lieTJSRGpwNjY4Skl6QnFUaXFYRG5FUGxrRGs2SmR4T2lHU2psYTVjOWZI?=
 =?utf-8?B?Rkpicm9rUXlkOWtuWW5NWTN3VjY1QzhEelBTMDU4SWNxejF0dzUxc3lFc09v?=
 =?utf-8?B?c0JrRmVXM01XT2ZhQkEzTmpScDZ2TTAvUGVBWTlhN0NFSmZGNzMxYlAxZk1N?=
 =?utf-8?B?UE8zSDhhSG1kYzNCalRVRkxWOXRoNlgvdUVhM3ErWGRVVktIZGJNUlN4V3RT?=
 =?utf-8?B?MTRNT2J3Sy95T3VNc1gvOWJYZDZMNFNuZ21kekRKd2NLdWdsSVF2MEFhWWFr?=
 =?utf-8?B?RjYvS1dxOTY1dGlVQ2tLMDMrbFk2Rkh3UEhwZTF2RHBUN2NlSWFjWktQWGk2?=
 =?utf-8?B?L1dpK0hSOEF4ZzR3dHRRdy9oTmg3WlpqbUFUajFqbzdZdWNuR2xxRW54MWFM?=
 =?utf-8?B?djV0dUp2MVVwa0YwNmJ2ME9yQlJlWElzVUM4cXFrVjVZbC9kRXJ1VEYzMGNY?=
 =?utf-8?Q?NjyOBF1DJeXTzx5Mown+wmpC0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b33e36-68f1-44e8-0c03-08dde598e722
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 18:38:23.3493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6uL5TSqkLfESz3kqgajjnxHEo03vaX9Tmq6WXrRRrQgd/A03JkXh2G0ssxTPNnBBMz/qnXSqoQQRohGrLswBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7543
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

On 8/27/2025 12:43 PM, Antheas Kapenekakis wrote:
> This is an alternative to [1], since Phil found out there are still invalid
> values. We need to reconsider the other patch in that series anyway because
> the latest AMD firmware update might have fixed the Z13.
> 
> This series refactors the panel-backlight-quirks code to make it easier to
> add new quirks. Specifically, it adds the ability to bind to a secondary
> DMI match so that the make of a device can be specified. Then, it makes
> EDID optional, for devices we know the value should be applied universally.
> 
> This is then used to add a quirk for OLED panels that have an issue
> when their backlight is set with a value that contains a 0/1 value in their
> minor byte. This issue affects four handhelds from three different vendors,
> three of which are in the field. This quirk applies a |3 mask to the
> backlight value, which avoids this issue. In addition, the value change
> is minor enough so that it is essentially a NOOP. There is no need for
> ensuring it runs only on panels with faulty firmwares.
> 
> Finally, since allowed by this refactor, a quirk for Steam Decks is added
> that lowers their minimum brightness to 0, matching SteamOS. This is
> a nicety commit, which allows for mildly lower minimum brightness, so
> there is no time sensitivity for having it merged. Mario noted that if
> that quirk was refactored to use an EDID match via the current interface,
> it could go through the fixes tree and land sooner, but perhaps it is not
> worth the effort.
> 
> [1] https://lore.kernel.org/all/20250824085351.454619-2-lkml@antheas.dev/
> 
> ---
> V1: https://lore.kernel.org/all/20250824200202.1744335-1-lkml@antheas.dev/
> 
> Changes since v1:
> - Remove leftover quirk from patch 3 (refactor)
> - Add dangling comma in patch 4 (oled quirk)
> - Add the next generation Zotac Zone in patch 4 (currently unreleased)

Can you double check with Phil?  I thought there are two affected Zotac 
devices, but I could be wrong.  If we can get both in a single go let's 
do it.

> - Reword patch 1 and 5 subjects
> 
> Antheas Kapenekakis (5):
>    drm: panel-backlight-quirks: Make EDID match optional
>    drm: panel-backlight-quirks: Convert brightness quirk to generic
>      structure
>    drm: panel-backlight-quirks: Add secondary DMI match
>    drm: panel-backlight-quirks: Add brightness mask quirk
>    drm: panel-backlight-quirks: Add Steam Deck brightness quirk
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  19 ++-
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   6 +
>   drivers/gpu/drm/drm_panel_backlight_quirks.c  | 113 ++++++++++++++----
>   include/drm/drm_utils.h                       |   8 +-
>   4 files changed, 115 insertions(+), 31 deletions(-)
> 
> 
> base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00

The series looks fine to me.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

I have two small nits though:

1) Because this is "effectively" going to limit the amount of brightness 
values available I think there should be a message when a the brightness 
mask quirk is in use that we can get in the logs so that the changed 
behavior isn't totally surprising.  We have some similar messages for 
DMI detected quirks in amdgpu already.

		drm_info(dev, "support_edp0_on_dp1 attached\n");
		drm_info(dev, "aux_hpd_discon_quirk attached\n");

Can you add one for this new quirk?

2) The comment for 'brightness_mask' in patch 4 should have 'or' as 'OR' 
so it's obvious that it's logical OR to the casual reader and not a 
typographical error.

IE "After deriving brightness, OR it with this mask."
