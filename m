Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8013495B6E5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 15:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894B810EAAF;
	Thu, 22 Aug 2024 13:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="prYG2opo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1F110EAB2;
 Thu, 22 Aug 2024 13:34:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/S9KGbKV4bp87FFVOlEde9cJ3UQ5dXLFd9S+0n0v7dupv/pNI0TRedFFdMD5ta1qwMpZgeBw0+Jhp/JPnYeG033ScOWNjqsh/Z2hQhEY9awDHFmL94NGQTUnhs4pdEo1s2NLxCD+5DlflSncSS0e5BLCbUm0Iw+84z0NDwt50bl1VipqIu+MPdo3aYldx49WxiCcUtqofnthXnsoBHnnxv6Ij/BpPGJyHdRYm2evl9r6tIzNlmBeALgk91gf7zA4gwBkfl03nxJeMif0Gm4R0fn8QpE5xuj8A5nFdqA7WwRhitGsAkpbstJ80GcTugPVSwI98dqLA9hXDxWdMezeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkVPjy8qmOUc4wBoYzFpbZB9ZAdOMCODq0ALwbbovUA=;
 b=oMU3lwgmZ7/oAOuu7k2Na46w81t/rS7Uynj9AQ0iqsf9wENlqK7fEsg8vkA+CntXGVn24SEVcPilhTZebw+0nzXYDa2mDACLpgnGx1SQ9wUeI2SMchd+KixHYkSeixtTVZAe+uRMK3OD6+d7lbSdDZr/bl27ylXIfm+cdWMdNS0wKpxx+SgQgEYzD60p/zyyE9vad+ZWf5TKip16c9/e8SAeYaCSs6k9tU0WSqS4LLcbY+JB2LvHOuwJT+hJZvf9xs96kQxCL/8Fh/BcRXa+hwnJTdrWzaCPsqmtYnzLOXI/pDII/qVSeDISc8/SeVUOR4i8M0ojforp/lxd/Z96xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkVPjy8qmOUc4wBoYzFpbZB9ZAdOMCODq0ALwbbovUA=;
 b=prYG2opowCwzawzvEfyT+Sjgp26qcfETw61aPxA385CQOtb82wRCSdJgN7a4upJN39ViHnd2yZ/TyPkmMqKee45EDQQd5LqGLa+dBlJMCEB8cE13QxCRE0mwWRSHZubkBH23hDhvV6PUxyLaTzJAAcKysV9V9tCieqVbU5cFz1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB9220.namprd12.prod.outlook.com (2603:10b6:610:198::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Thu, 22 Aug
 2024 13:34:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7875.016; Thu, 22 Aug 2024
 13:33:58 +0000
Message-ID: <dc4c50db-280f-49dc-8eec-600b57e741a8@amd.com>
Date: Thu, 22 Aug 2024 08:34:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm: Add panel backlight quirks
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dustin Howett <dustin@howett.net>, linux-doc@vger.kernel.org
References: <20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net>
 <20240818-amdgpu-min-backlight-quirk-v5-1-b6c0ead0c73d@weissschuh.net>
 <5363536d-0f96-4e96-8f1f-c8e1799b6421@amd.com>
 <f3dac7f6-22ee-483e-b2f3-3a1c900c3f06@t-8ch.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <f3dac7f6-22ee-483e-b2f3-3a1c900c3f06@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB9220:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de188f5-9605-4f08-3e2e-08dcc2af13cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzBMUk9Ic0JiME1CN2dmaS9IcUJIeGV3RDF2YWthZ1dMTzQxbHhrY1VZTk1D?=
 =?utf-8?B?V2R4ZGhqY2N0RHdMMjhPUTZMQzhoK0JreHlNVGNER3hreDZOalhWZHVUdmxh?=
 =?utf-8?B?Vi94Y1pGNkpTR0dyZTFhWkFvTWgyb1JEekRXczZzd1ZwcmdNekwzUEh2a1VD?=
 =?utf-8?B?OFZwbkFqQk4rbUF1UTRpUVFRYU1mNjNMSW5lY2IxS0xQWk5vQzNJTnp2MHlv?=
 =?utf-8?B?QTNOaGFicXpEdVFaWUI3U1pReDlLNjhaUnBQUDgwdm9jS2ZITHFiNmxMUkRZ?=
 =?utf-8?B?Y2duMEVJRG5rdlVCdXVxcml1MlVsYW5taFYvRVhHZElBL2hGd25UOFVqYWlv?=
 =?utf-8?B?UGp3ZzltYjZlY3NZU1dpcGw1cTdKdVpFZDcrdy9Ma2g1SURCQ1U5VVZmWHJ6?=
 =?utf-8?B?d094d0JseHNaL1ZITEtSV3RNUnJDN0U4VGx2Zi8xQlZUYzRCV1FOaGkvWWFo?=
 =?utf-8?B?T1J6T29XR254V3ROL2pBZHZlWms2ZTRxZzJ4cG1VTnVydm9BVnRaSy9YUStE?=
 =?utf-8?B?TzRoSVJKVUUvNzdGb1NBMHl5cUlVSVBsZUxJNDdXVEdXNzJjUkN1cVFUQlJQ?=
 =?utf-8?B?by9nVWg5QWtrNG9OQXUvUmtuUHhNUko1UWEyYkxQdVAwZ0xXelhOaERoOENp?=
 =?utf-8?B?WnFhVCs0N3IxN2lRVU1zbGliMzRRYWplbHl0dTY5aTJnRHdvZVBFWnpBVlFs?=
 =?utf-8?B?bnEwbEZjQ3IvSjExajlMUFNqclhlQTRVM0hHRDBzNEp2eXB0TWpsNG14Q3V2?=
 =?utf-8?B?SzA1SWo4L0IvWFRKbEducnorQ01Bd1NVYm9GbFZncUhjUmplYU5rNzMxRnlv?=
 =?utf-8?B?WWNxTmNCWVNNQ1JNbGhsdFpvRUJoZFA5Si9XTjltRE9sQXdYYWJEWnU3YnUv?=
 =?utf-8?B?RWVWNElFZStuaGxFaWtLRnpOd1hDZE5xcC9oOG9hVC9jR2FoYThMRUh5SEJN?=
 =?utf-8?B?NUsxbnRZL1FRYXV6cDFpdWk5YnBuQzVvWDduWnVMQkxXalFQcjZDZzc5SzFX?=
 =?utf-8?B?RklKazlXZS9kWUpLWUIwQ082Q2xzOUI4Y2RWOTJQaU5tSjdCTmZVQmhPN01Q?=
 =?utf-8?B?czdMUXRINmQ2eFh0U3czMjQyclMraDZ1ZjNzS1BVRnNob2RiOUhFM2gxQU1a?=
 =?utf-8?B?U1ZHdHJ3dGJmalZiWkxndHBuY0tNeXNFcmxKRFRsVExndE5pVzRUaHkyVzIz?=
 =?utf-8?B?UVZjRVBSSEFkVTZkUlRaOE8xNGpWbEpia1l4M1ArVmR1WGxXMm9TY1F0eWhz?=
 =?utf-8?B?Tm1XSlNxbmp3RmZ1S0wwNGZrYjNnbDZ4cXhsSERQRHphSnJhMHNKem1GcXNq?=
 =?utf-8?B?SSsxczR0NGdsclVLL0xrSzBQR3BvR3AzSHlQcExWbjRqY0dDdFY0cnJiR3FV?=
 =?utf-8?B?T0ZEUjZ2WnBhcmJtU3AvMUw4V1FrMWVHK3ZQRE5Pd0pCbXFleHpXZXZRZWts?=
 =?utf-8?B?Vmx3OHVxbXppeHpDcXNISjhSVnNVZlFQd2ZHYVBIeGxNbzZabkUyUFhEQm9q?=
 =?utf-8?B?djRCbVRwREZwc0RRbXEyRkM5aEZTMllCWWs5ZDhrcWluWStIK3VaNW9YRW1L?=
 =?utf-8?B?cnJwNWdqQWJvdWcxeVBGaHRHT1ZkdHNRWkkxdHA0TWQwNHBQT28rT25LdHBo?=
 =?utf-8?B?SlhnZWIzOVFWNTdJUm1ySGNSb3lJQlBpU2s3MlZST2JiTmI4RVE1ZExpZjZq?=
 =?utf-8?B?bVpuM0JtR3lINnZKVGpWUVZQY0gyZTRLUkM2a2I0QnZVVnJVTTc5Z0NkZEJL?=
 =?utf-8?B?L2hxZnpuZi9kRXRSVjl4Mld1Q0JvSDl5NXBvb1paOEJDZDVyUzVibEdIOFo5?=
 =?utf-8?B?VURoYVY5NkJmZU1ubVN1QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkZiYUZLaVYvMVBBekNOOWdlSmNnYW91Q1lUaTdLSlVDdG9URFZhdGtFeTIx?=
 =?utf-8?B?V3RkclZuTnUwVnBnYlhEQWJJTUQ2R3VIM0xtdEZNSFBySkx1TTRYK2lsbkdC?=
 =?utf-8?B?T25xNUR1RU9sSytRTTlLbWN2cG5EaWZsNmw3MjdlKzBKa1REcXYvc09HbGZv?=
 =?utf-8?B?bENoZnBPbm02eFUwSkFHU2JDSHFKNVgwRzZkQTR0czFjR0lpZ0ZIM3dEYzk0?=
 =?utf-8?B?WU9xUVluZHF0VGZIM1MrV2JwZWNRbDY5eDdidWl6eGs1RGxCYmZQN2lIZkh5?=
 =?utf-8?B?bG1CcDZRbWxOVHA0bE5TME5uTnZ0aUpuQnFoZWM5RnpSbU9ZSis0N3dJNTlk?=
 =?utf-8?B?ZzRhLzUyRXkza0RCdFMvOCtxTFRoU1R4b0Z1ZXVYSGZub3ZLL011ZHlJUTlp?=
 =?utf-8?B?dm11dlBsWmZFU3NOVFdCOHpPdW55WFIrcEZWTU51eVE4NzhlRHI0LzBNMTRj?=
 =?utf-8?B?cXF6a0J1TXUydWpXZ2lXeHlxOXpGNWIwSVpRWXRGaWJFMGF1ZkJFQzkyaUhO?=
 =?utf-8?B?eDc5SDIvZnY2d3U4NGhnZ3FSbUJaWlFlT1FIQkd4QWQxWGRSWUI5UENvb2Ft?=
 =?utf-8?B?SUdXbW03SlJ6UHBIU2xxS2cvK3M1MVJ0cTIxT1lXQlQ3N3NvYzhyekRRRVVj?=
 =?utf-8?B?alNCVUduREFaaVI3WjJ5TjJGZVJMZTNIaW50K3JQaEszdHNVLzNFaGtndHVN?=
 =?utf-8?B?dWV4dG54NllDS3lWN0lvNW8vQ2JVQ2JZYTBpS1VyWlBDT0EybXpDNERMQW13?=
 =?utf-8?B?WStvUExqdmlJekRTZytrTmtwa2VCbVVwTXdzcUZqbHNMWWh4MUFPUGcrcEF2?=
 =?utf-8?B?V0xsd1ZNUnNhWllMYkxrU2FINXZvTzhEMzRTcEdWT1M4ajhaeXZQYTJpZVRv?=
 =?utf-8?B?VUttZGhOOTU4ZDcyVFpoOVdmeHlZR0VuK2lra21vc3JNQzFQYXFzN0Yrb0lY?=
 =?utf-8?B?bGpLRVJIQjErdjBrZjVkK013Q2NoaDlZSytyanpjaUdzMG12WDI2V09jY1k2?=
 =?utf-8?B?bWNKTHRrVkY3bW83bVYwMXMrVExzalgvUjZ2OUtlODc2MllVV2dnTGp2YStj?=
 =?utf-8?B?M2EzSUlORVgvS1hpUjR0emtUNjVuRHFxcldFQ01MVGlHR0lXbVI3ZWFncjZC?=
 =?utf-8?B?UmZndkw5NCtLd1ZqV3ByNkc5QjBaRnZRUUNpNCtwVVlFYUcxT28ycnM2bVYw?=
 =?utf-8?B?ckNOTjNGMHpucTN4Zlp4SHNPQ3QySGRGZ2VhOEJRTGZtU2k2N2V6WkpHS3l1?=
 =?utf-8?B?bFFUT2MwRmlMNHc3YU1lOE80SGtHbzNaeVJnYWN6YkRHa3RjdEtCZFVFbmhF?=
 =?utf-8?B?dEFna2J6dCtRMGNYMHVNUVgzK200dVRDT29Xekk4V09qSEZHQVVIZlRYKzZ3?=
 =?utf-8?B?a1J2ZU01R0ttM2o2b1lBbTA0UWg2NE9tOVh4Q1g5K1l3bHZ3MlpNd3MwaFZx?=
 =?utf-8?B?VitMbllDTGJ4Um9RZ2V5NHlPQXR1aStCd2MwcmVEdHFxSFNNU0J1bENMZEZw?=
 =?utf-8?B?YWkyS2t0TDBBaThBaEdRa0wxUVVCQUl3T3FDV2RjZFJDZ2VQOGkrbFBYbE1Y?=
 =?utf-8?B?TVJhY1RzaTRzVk1KYnZGNHl3Q2s1OHVvOWRJNUtCa0JWbTZEc2xRWDYzQ3Y1?=
 =?utf-8?B?SHlNcGpRUVluR0RRQVVROWJEVWFTQi9RVE1SWWNOSk1kalhWUEFGUzJCVldD?=
 =?utf-8?B?Ym5nMHBoU1I0THpIUVpFRUNxejFLSVhTRm1RZUJOMGhURk9GNlQzMjZEVmRj?=
 =?utf-8?B?UVdPM0tXQmFiN1lOWGNRZFhJRDhEby83MGdzL09PaWZlUkxrV09GRlRqZUVQ?=
 =?utf-8?B?dFZVTCtObGt2RGVTcFlLMWlkRFpobzMzK3FqNHRwMitMUlZPV0ZCcTl6SVJm?=
 =?utf-8?B?Skc4MzFyZ1A3RnV2WW5QY1VCWENUbUFXZytIT0NFZWkvM1R6eHpIVjJXV1cz?=
 =?utf-8?B?RTlFMXNJd0V1aHd3UjVMN1dHOW9DQlMzOTJEVzJMa0w0a2hmSlJpdmhCWWVi?=
 =?utf-8?B?bnlOdWVnaDZzZXEySzA3a0FXRllrK2xVSjhDOFh0ZmFWeEN3eGRBc2Zva0R5?=
 =?utf-8?B?ai9vMXZMRzBNVlh4WmR6eE1mb1MyN0JUU0Nlb0xvQzI3bHpyNTYvZGJ1UUxi?=
 =?utf-8?Q?LX1HLwpDUBMnKKr9XmzTx43ZA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de188f5-9605-4f08-3e2e-08dcc2af13cb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 13:33:58.8748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+BSm5oDxSYgjRPh6Dzjy0KDAhshAy4fcub4zxbK9++eeo8H10SqLUhFID32M+BdXhVJzgtwezkSdNQ5ZUgdaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9220
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

On 8/22/2024 01:12, Thomas Weißschuh wrote:
> On 2024-08-21 15:51:17+0000, Mario Limonciello wrote:
>> On 8/18/2024 01:56, Thomas Weißschuh wrote:
>>> Panels using a PWM-controlled backlight source do not have a standard
>>> way to communicate their valid PWM ranges.
>>> On x86 the ranges are read from ACPI through driver-specific tables.
>>> The built-in ranges are not necessarily correct, or may grow stale if an
>>> older device can be retrofitted with newer panels.
>>>
>>> Add a quirk infrastructure with which the minimum valid backlight value
>>> can be maintained as part of the kernel.
>>>
>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>> Tested-by: Dustin L. Howett <dustin@howett.net>
>>
>> One small nit below but otherwise this patch is fine to me.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>
>>> ---
>>>    Documentation/gpu/drm-kms-helpers.rst        |  3 ++
>>>    drivers/gpu/drm/Kconfig                      |  4 ++
>>>    drivers/gpu/drm/Makefile                     |  1 +
>>>    drivers/gpu/drm/drm_panel_backlight_quirks.c | 70 ++++++++++++++++++++++++++++
>>>    include/drm/drm_utils.h                      |  4 ++
>>>    5 files changed, 82 insertions(+)
>>>
>>> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
>>> index 8435e8621cc0..a26989500129 100644
>>> --- a/Documentation/gpu/drm-kms-helpers.rst
>>> +++ b/Documentation/gpu/drm-kms-helpers.rst
>>> @@ -230,6 +230,9 @@ Panel Helper Reference
>>>    .. kernel-doc:: drivers/gpu/drm/drm_panel_orientation_quirks.c
>>>       :export:
>>> +.. kernel-doc:: drivers/gpu/drm/drm_panel_backlight_quirks.c
>>> +   :export:
>>> +
>>>    Panel Self Refresh Helper Reference
>>>    ===================================
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 6b2c6b91f962..9ebb8cdb535e 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -454,6 +454,10 @@ config DRM_HYPERV
>>>    config DRM_EXPORT_FOR_TESTS
>>>    	bool
>>> +# Separate option as not all DRM drivers use it
>>> +config DRM_PANEL_BACKLIGHT_QUIRKS
>>> +	tristate
>>> +
>>>    config DRM_LIB_RANDOM
>>>    	bool
>>>    	default n
>>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>>> index 68cc9258ffc4..adf85999aee2 100644
>>> --- a/drivers/gpu/drm/Makefile
>>> +++ b/drivers/gpu/drm/Makefile
>>> @@ -92,6 +92,7 @@ drm-$(CONFIG_DRM_PANIC) += drm_panic.o
>>>    obj-$(CONFIG_DRM)	+= drm.o
>>>    obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
>>> +obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
>>>    #
>>>    # Memory-management helpers
>>> diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
>>> new file mode 100644
>>> index 000000000000..6b8bbed77c7f
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
>>> @@ -0,0 +1,70 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include <linux/array_size.h>
>>> +#include <linux/dmi.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/module.h>
>>> +#include <drm/drm_edid.h>
>>> +#include <drm/drm_utils.h>
>>> +
>>> +struct drm_panel_min_backlight_quirk {
>>> +	struct {
>>> +		enum dmi_field field;
>>> +		const char * const value;
>>> +	} dmi_match;
>>> +	struct drm_edid_ident ident;
>>> +	u8 min_brightness;
>>> +};
>>> +
>>> +static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks[] = {
>>> +};
>>> +
>>> +static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,
>>> +						  const struct drm_edid *edid)
>>> +{
>>> +	if (!dmi_match(quirk->dmi_match.field, quirk->dmi_match.value))
>>> +		return false;
>>> +
>>> +	if (!drm_edid_match(edid, &quirk->ident))
>>> +		return false;
>>> +
>>> +	return true;
>>> +}
>>> +
>>> +/**
>>> + * drm_get_panel_min_brightness_quirk - Get minimum supported brightness level for a panel.
>>> + * @edid: EDID of the panel to check
>>> + *
>>> + * This function checks for platform specific (e.g. DMI based) quirks
>>> + * providing info on the minimum backlight brightness for systems where this
>>> + * cannot be probed correctly from the hard-/firm-ware.
>>> + *
>>> + * Returns:
>>> + * A negative error value or
>>> + * an override value in the range [0, 255] representing 0-100% to be scaled to
>>> + * the drivers target range.
>>> + */
>>> +int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid)
>>> +{
>>> +	const struct drm_panel_min_backlight_quirk *quirk;
>>> +	size_t i;
>>
>> Nit: this doesn't really seem like it needs to be size_t.  Shouldn't it just
>> be an unsigned int?
> 
> ARRAY_SIZE() works with sizeof() which returns size_t.
> It doesn't really matter, but I slightly prefer to keep the size_t.

Ah thanks, I didn't realize that.  Feel free to leave as is then.

> 
>>> +
>>> +	if (!IS_ENABLED(CONFIG_DMI))
>>> +		return -ENODATA;
>>> +
>>> +	if (!edid)
>>> +		return -EINVAL;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(drm_panel_min_backlight_quirks); i++) {
>>> +		quirk = &drm_panel_min_backlight_quirks[i];
>>> +
>>> +		if (drm_panel_min_backlight_quirk_matches(quirk, edid))
>>> +			return quirk->min_brightness;
>>> +	}
>>> +
>>> +	return -ENODATA;
>>> +}
>>> +EXPORT_SYMBOL(drm_get_panel_min_brightness_quirk);
>>> +
>>> +MODULE_DESCRIPTION("Quirks for panel backlight overrides");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
>>> index 70775748d243..15fa9b6865f4 100644
>>> --- a/include/drm/drm_utils.h
>>> +++ b/include/drm/drm_utils.h
>>> @@ -12,8 +12,12 @@
>>>    #include <linux/types.h>
>>> +struct drm_edid;
>>> +
>>>    int drm_get_panel_orientation_quirk(int width, int height);
>>> +int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid);
>>> +
>>>    signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec);
>>>    #endif
>>>
>>

