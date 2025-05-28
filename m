Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA65AC67B6
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 12:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6771E10E5D4;
	Wed, 28 May 2025 10:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sVSEVco7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5C110E5D4;
 Wed, 28 May 2025 10:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asn2KtVfG0oTly87+4HB5ksgzTYlATxsJ8GdBDP1v1MO0d9gt73ZxDJAfSzRGf5NV1Abvg94AUY8lnsYHrRoKB78ep0TEKzLOGZcs8YTisMHKf3Yf5h2JrZ6vaX820cppnp33DK7Wcr7XjqNL4WWCS1mAEGflJXX8D8SfvRQ6MND+9r7yKBvdF/soGXhaxo1jST23Ja+ZCm7k2TbQ0GQb7kYmPk38xW+JZtsQpSnZSuxNKBfPCLCnF4Dg42X1ayjuebks6xarstsb3Al5fxt1ACwOp8YPpzYvyIfYu4ikOJU4vSr3zazS/2UIH61d/bUwsbt1vkVRZg7+v7mEL+iyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jp3UPIMguUyCsghaFeGBWB3VgW5y0BH8uHI70ueTnp0=;
 b=qtGN6+7S7PMdcQJrQZ77Go7i+alVtQD1L0LVn649nHgTU1E00yQhb1k1tKCFzKokZdv/CNARFBmz6oWeUs+nr6SAagsQg6wm4hhAaSZ6SNd7viTMMu833kOX3YH0K2BSWqMZl68hozpXwE7LTb11OImMLWKidm9CLEJ+LRVrLG5wNAkTcPUlDbmogAd0h6CAt1SV2VNsNihuBJYRi7D+Fi70v9/Lu6/CwKsh0gEu1bcsOsIQlbcxsTEG08ElAsaQAnQPei13STR8GCqCVH3J1GiiwPwuWYcw8JuAVkb8WPBszG6x6/57av1XfPkjgxv81em3RXMYeli8F/Pj2c4bIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jp3UPIMguUyCsghaFeGBWB3VgW5y0BH8uHI70ueTnp0=;
 b=sVSEVco7loZ65Z/tKesevu8CLhPJ0AGB8WI/B3YaWKNWj5+i8rGQJBGtAxrm9/czwhQFQCdLAwJlVRVu+gLXxSclOoQ0VyhV23t9dOt/tUNY2gkSkSJU8oa2EhPxjwplxih/2HOG6CLGfXe2i5CthylEuoaKh8fsaWDwhYVZFvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7429.namprd12.prod.outlook.com (2603:10b6:303:21b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 10:52:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 10:52:51 +0000
Message-ID: <32b8d6e5-0b7d-423e-a466-7c47f9196b55@amd.com>
Date: Wed, 28 May 2025 12:52:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Dirty cleared blocks on allocation
To: Natalie Vock <natalie.vock@gmx.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 stable@vger.kernel.org
References: <20250527194353.8023-1-natalie.vock@gmx.de>
 <20250527194353.8023-3-natalie.vock@gmx.de>
 <89652580-5763-4f1e-abf5-d340119543f3@amd.com>
 <dbbdcada-32ae-4457-af87-1f98362461f1@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <dbbdcada-32ae-4457-af87-1f98362461f1@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR18CA0029.namprd18.prod.outlook.com
 (2603:10b6:208:23c::34) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: be00d889-33f1-4861-2e66-08dd9dd5ca9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ams1NU5CZE1EbTJEYW9LdmUwNGNRR01XVXhtMlAwMSttL3FOaFJ0SEcrL3Z1?=
 =?utf-8?B?WHhGNVZaZDlEcEJweGNUcC90THlwMXRoZjBXYlp1MEcyWVFKemU3WHdVdDI4?=
 =?utf-8?B?NGhRVWpFWUJIZENyaHF3R215ZDNyb3E4RjVyY1c5eFk5SDNtZzJBaTFSRi83?=
 =?utf-8?B?LzV2OTY3eUVTNWxSZUllTGtIZGZZRkh1TGZSNU5JNlJJNDFzYlhRWXdYTG5X?=
 =?utf-8?B?UGRZeWhQVlpPR2QvQkE1M3psVjAyLzk5S0FnVUp5RVU4dXo4bzRBbzVadGsx?=
 =?utf-8?B?UGx1MklKdVprVkN6dWw0bW9qSW5lam4yVHBmUmpZUTd1UlpTT2FKK1JLSVFh?=
 =?utf-8?B?bnlRemFLaEhQVnFkQXU4blhFbTd5cWh0Q0xuRjcwaDVpMG1RWWt3VHVQTXVE?=
 =?utf-8?B?UGt0NnMyWHY2VThIUGU0N3NIN0lROGxtYlFsR3dFVWFnQkFHV294RHpENncw?=
 =?utf-8?B?ajhrTlFsajMrdFRyVnRMUU9sTXlwRWZ0TzIzQm5URUJ2WDZEOW9rR09CZ3Vu?=
 =?utf-8?B?YWFNSEd0cDcvdEhnUGsyWmRNb0lYR0s1WU0xRWJNSUM1MEkwODdmckxmK0Z5?=
 =?utf-8?B?Zk9Qd3kwRDB2M0tiY1NNL3ZlZ0hrZEhlYWplbXBUZUl2U1k4dHdHaWpDUlpP?=
 =?utf-8?B?Tk5oTzhxWVNuaVJ3VDhERjZDcGhUVi9zREtCa0IvL255b1VrV1ZrTW9jOTlk?=
 =?utf-8?B?WklsTXhWLzk2K25icFBvaTVmT3l1Z3NJMGVFa3FBSkQxMVVkRDB2VkVKUlhC?=
 =?utf-8?B?QWdhNktFVzlycFgyN2VOV2pwUHg4VlZiRXFDSW1Yc0VUc2owZ1dadEdIckxy?=
 =?utf-8?B?TlRBUWpIblc1Vmx0eEhBcVhGSjJCWTY5SkxvNnZxVlVNcU1CaWlRRDRqNFVz?=
 =?utf-8?B?Y25qblFDS3JpcUdDcGxPUmNaMlg4QWlnSGZ0aXYyY2xMNm1EU2tTYjRmZWdn?=
 =?utf-8?B?R0x2VW9iaUlncHBuckJGd3Q1SnhYZVo3cGNRNVdyWjlCVnkzRGsrSEhzUWR5?=
 =?utf-8?B?UE1GMEhjcVpnc0pLVzN1TkJvdXdTSjlaSEFzemVCWHdTU2JUc01zMjhMQkVq?=
 =?utf-8?B?dDZkcC9VYTRCaFFGcnBhekdDSEdabjA5OGRXRWg2emNKVUUvUXppcUh0b3g2?=
 =?utf-8?B?bnU3UXRzVFN1SkVIQVdUUkhzWXVzUlJmaUdWS1VFa3BlbUJxVE1zY1cxOTR6?=
 =?utf-8?B?aHZUdjJTTThNL09ocmVIN3MvZlVWNCtDaFBQaEZ3b2RKenVEYUwyVWprbjFn?=
 =?utf-8?B?dTlJaHhuSTlLWU1SWU1iL0ppTVJoR1gxQ1hHQ2FSMTU2TzBqM0dKbkpBQVlJ?=
 =?utf-8?B?NVRsbmtDdDUvaWdXcUtPMHpSd2NuYndPOEJVMTYrY2ZCbTNYaVVqb3lyUHVI?=
 =?utf-8?B?R2FxTGR6VncvWlNYSjFzWTVzaUxTaU16TzR5NmFJQ1hsbzlreTdHcU5RUzA4?=
 =?utf-8?B?TVBTWG55czFmSkZ1R2FXSG1OMmtjeTNGTmlLbWhjTGVkM3d0dGtmeVVYeUx2?=
 =?utf-8?B?Wk5WYmNOZWpvTk1HVXB2d2krbUlIZUp4a1BhOXJaZDNlYUJITW5hSnJ1MG1z?=
 =?utf-8?B?YWJBMTNkYkZvRktXeDQxbVRZYVdLRGNuMFVmakk0R1Q1bEdRclpvSzR3YWth?=
 =?utf-8?B?TEs4UExxTGF4RjhaaFRlTDhCMG94WWNxSFg2QURuUlBrbGw0VWllL29OZzhi?=
 =?utf-8?B?Z1Rvd2pIdXVISGVlZ0tnQVBCZSs4MytWUFRRQTg1RW1JNEExd3BXemZuOFhr?=
 =?utf-8?B?TWJteEQrSG0vR2RNbmJCbTlaU2ozZ1lEWnV5TmdtUks0NW5qUkMzQThHcFY2?=
 =?utf-8?Q?IrEEIcpqyvKq847sB3ww2CqmZt7+P/WvK8FaM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blN1U25jd0JrUU55WWZIMlJxNGp5bXdrcHo0aFZJUWIrdS9RSHFtOGpZOFVy?=
 =?utf-8?B?clU4NklodlRTSzUvR3BpakJEZW1PK3Q1U2tZN3l6ejlIZ3E4OEpNRHljNXJ2?=
 =?utf-8?B?MC82L1dSY253ZVJRaG5kWFc4TlVWQm5jNUN6K2pEWXRjVDV5blRYbFNrQSt0?=
 =?utf-8?B?R1NYazd1ZHdUNk5CTDNpc1cxcG50MVFEMmJhNVdOVWllYVVOYzYxTHlBcUNP?=
 =?utf-8?B?NDdoVzRRMzBtVnV0QTcvbStSMEs2cGEyeFYrRmxXMDA5aVJlT2IvM05zeG8v?=
 =?utf-8?B?alhDZ3E0MU5JWklieC9jQjdQNHE2cWdKNHYvMktBTzdNcTU2L3RWQU9RZUJi?=
 =?utf-8?B?OXJnSk5BWldZVytlTVFSWUIzQWtaUWp1aUhKNFVialgwNnkrK2kzQkp5amk3?=
 =?utf-8?B?RlFsMi9vV3RLdWxJM2U2VFE1QlczanZMMmZYc0hWNHNWMlpwYnNkdjl6aGxX?=
 =?utf-8?B?bC9veUZrVkNPQ3l5bURyOEwxZml1RkEwVVZCM01lek5INmFhTktYSUp0SGl5?=
 =?utf-8?B?eEF0RkFKTTIyOGhKdEROMTd0ZzVRN1k2SlpXb3lKVXNaMThVSysxTENHVXVm?=
 =?utf-8?B?S0JwL0JmcjdTdG9QaVhtSjVGRmVCQ3o5ckVwdEN6MVAzVzdLR0FQbXJ6Nzd5?=
 =?utf-8?B?RmVZZVhuWnExSnNQU2FHaVBDbW45RkkxV2dEQkVBbGk2WDJNbzU2OE93SjRE?=
 =?utf-8?B?QW1mbzcrVk9IM0V0cjVJY1BRUXVqZXVsVUJvYURtcE5FcVdwc1RLRWNKRVpX?=
 =?utf-8?B?ZnVRRVAyMG9QamlRWE1XNURzMWc2YnhObUhicFlybElmZmNsQ0NITmVDUHB3?=
 =?utf-8?B?QitKZmRPV05EMmVwOXRlMEZidkNHRm1ibTVuRXAvSkQ4TFRXckdnY1JZdmt6?=
 =?utf-8?B?YTVFSVduU1FMZGlCdHFLckF6MHlkTkRITDBIVmJHOEl2S21zeXlpbXlSTzJl?=
 =?utf-8?B?YWVYRVBRdnpWUEVaWHIyYm43UnluYXRNMDA3Ynh0VmRuQUZvNk9qSTF0U0w5?=
 =?utf-8?B?R1ppd00yelp6clREeDhud3JuSGZTZW50T29xb0l5ZXRMZ3M1Q0dEOHB0TlQr?=
 =?utf-8?B?VUY0a0hXaC8vQTZBZ0ErMHRkem5wRWJUVi9DaVVKSnhueUpTbVNqZUt6U3Jp?=
 =?utf-8?B?ckRyM3UrZlZXeEc3cDFjckZNL2MwMnpSWUE2Tmt3SlZDcHZJL1RkKzJkNm1o?=
 =?utf-8?B?NzU5cVR3SDc0WnFqU3VxcjhVc1ZmZGgzTWN5b2JCUVVnKzBWS3ZDS3dKRFgv?=
 =?utf-8?B?MUVRWVVlQnc5Sm1nWkFiV2xaamkrNThvbjZWN3NrZWNwbmFBM2RkaDc3UkJz?=
 =?utf-8?B?ZklGNS92aGZlVHI2cnM2NHdnbE9nSlBSWWJSRDNHbUtZcjQzQnhkWGpocmFv?=
 =?utf-8?B?STZMckxKREFkUmdVV0p3VUt0RFpBUDcrTkNFV09xZ2VqN3R4T3VaYW5tWVVG?=
 =?utf-8?B?YS9PK3A5UWUvajlFN3lQVWE1ZlF2aDBuU2Z6azliNVNaeWQrUDBZL2tuc3l6?=
 =?utf-8?B?bkk4dGdIYWYxYnBhaVU5SXRiRElkZStoRkZiSm5vdStvck9JWGowUUQ3UXo3?=
 =?utf-8?B?Rms1bkplbzE1M05VVFlvU0tlL1FJWnVYd3NyRGdJa0Z1akZEOTRTMEJZQnlW?=
 =?utf-8?B?WnVrZmVOcHBNOVZvU2U3SDhna1dSUzVuTjAxb01XcHRrdXFJT0VRd1B3VnND?=
 =?utf-8?B?U2I0dVRtY3hmc2hXOXkrblVwM29ReGNmR0U0aUtZSGpaZVlMQVBXclg5NklK?=
 =?utf-8?B?WXpiOXRGcmhxalBJQVQvTWFJTlo2RmlrWkRXV2o5NFJZY0YydmdUK0p0NGU4?=
 =?utf-8?B?Rk5NL3gwdlNjbTdRek1POHZXVkdJWE1nc1BTd2xzd3N2RUtUa0VGSDBzNENO?=
 =?utf-8?B?RmJiRDFXak9OOWwzMXFuMlVEbWlYNFRBMzRZYWsrcTNrZUtwMkMxRFhyRHZS?=
 =?utf-8?B?b29nVEowbk5KYkhMNVduZkQ5ZHI2VzZTZGJTRFprZ21tTkZhRFNLUk1VemRh?=
 =?utf-8?B?SWwya05SU2pLOUtMd3BXdzYvZGRHeFk5Q0dmSWpXc3RkOEFwajRteVpqM1px?=
 =?utf-8?B?VDJRMC93cnlaSWFwMXBjY3N2dXlKdnc5OXdDSUNuYWpqSzJxMVRXV2d3eWpY?=
 =?utf-8?Q?Oszk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be00d889-33f1-4861-2e66-08dd9dd5ca9b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 10:52:51.1687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkXcnvIjAtkOJHSEOHcjTPvcMh+7si453J8IbH3mBpIv0NCAln10KvsagUE3Wbu/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7429
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

On 5/28/25 11:29, Natalie Vock wrote:
> Hi,
> 
> On 5/28/25 09:07, Christian König wrote:
>> On 5/27/25 21:43, Natalie Vock wrote:
>>> If we hand out cleared blocks to users, they are expected to write
>>> at least some non-zero values somewhere. If we keep the CLEAR bit set on
>>> the block, amdgpu_fill_buffer will assume there is nothing to do and
>>> incorrectly skip clearing the block. Ultimately, the (still dirty) block
>>> will be reused as if it were cleared, without any wiping of the memory
>>> contents.
>>>
>>> Most severely, this means that any buffer allocated with
>>> AMDGPU_GEM_CREATE_VRAM_CLEARED | AMDGPU_GEM_CREATE_WIPE_ON_RELEASE
>>> (which is the case for **all userspace buffers**) are neither
>>> guaranteed to contain cleared VRAM, nor are they being wiped on
>>> release, potentially leaking application memory to arbitrary other
>>> applications.
>>>
>>> Fixes: a68c7eaa7a8ff ("drm/amdgpu: Enable clear page functionality")
>>> Cc: stable@vger.kernel.org
>>>
>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
>>>
>>> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> index 2d7f82e98df9..cecc67d0f0b8 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> @@ -591,6 +591,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>       list_for_each_entry(block, &vres->blocks, link) {
>>>           unsigned long start;
>>>   +        /*
>>> +         * Allocated blocks may be dirtied as soon as we return.
>>> +         * Mark all blocks as dirty here, otherwise we might
>>> +         * incorrectly assume the memory is still zeroed.
>>> +         */
>>> +        drm_buddy_block_set_dirty(block);
>>
>> Exactly that makes no sense.
>>
>> We need the information if it's dirty or not later while clearing the blocks. Otherwise we will clear all blocks and completely loose the advantage of the clear tracking.
> 
> Right, I missed that separate clear on allocation. I was put a bit off-track by assuming DRM_BUDDY_ALLOCATE_CLEARED would guarantee cleared pages, when in reality it's more like a preference.
> 
>>
>> So we should set them dirty as soon as we are done with the clearing.
>>
>> But the problem rather seems to be that we sometimes don't clear the buffers on release for some reason, but still set it as cleared.
> 
> Yes precisely - "some reason" being the aforementioned clear flags. We do always call amdgpu_clear_buffer on release, but that function will perform the same checks as the clear on allocation does - that means, if a block is marked clear then it will skip emitting any actual clears.
> 
> If we don't mark the blocks as dirty after allocating, then the amdgpu_clear_buffer call on release will skip actually performing the clear like it did during allocation - this is obviously really broken.
> 
> After calling amdgpu_clear_buffer, we call amdgpu_vram_mgr_set_cleared which causes the drm_buddy blocks to be marked as "cleared" when freed. This part is correct in itself, but obviously breaks if amdgpu_clear_buffer didn't actually clear the buffer. That's how the dirty blocks end up in the buddy allocator as cleared ones.

IIRC I've pointed out exactly that during internal discussions as well and suggested that amdgpu_vram_mgr_set_cleared() is renamed to amdgpu_vram_mgr_set_state() and given a boolean flag to indicate the state.

So that the clear on allocation will clear the dirty and set the state dirty and the clear on release will clear everything and set the clean state.

Sounds like this was never implemented like it was originally planned.


> I'm testing a v2 that sets the dirty flags after the initial clear, I'll send it once I confirmed it works

Thanks a lot for looking into that!

Regards,
Christian.

.
> 
> Thanks,
> Natalie
> 
>>
>> Regards,
>> Christian.
>>
>>
>>> +
>>>           start = amdgpu_vram_mgr_block_start(block) +
>>>               amdgpu_vram_mgr_block_size(block);
>>>           start >>= PAGE_SHIFT;
>>
> 

