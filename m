Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F805B21763
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 23:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F44510E54C;
	Mon, 11 Aug 2025 21:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b8AyX+co";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E5F10E54C;
 Mon, 11 Aug 2025 21:29:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYNw1hDbUsy+YXNDRZdgtF/LNgF9vU0Th5FPRS6BwQBkzEjPXvrENIHspnENdbxUYCYRAVmG2TistM2PMqICltfCVNMOJ2slVIu1O50OYk2z80OQemuqCS3OM5FcWASttka2oU2SXgJF0ubBmQwMnfP7+Gew4oLcE6DcisVyR+L+J5JqFxYRUQ3tQjxmqFdp3Z/iieTlL7d4mJWlIsX5nhYr3+kBexR8v8RrDWh+nbRDuwGwSjwD5IFJDB4Otz791ilZsSoL4OQD13176o2HweC5tth4VUlghzr69lwXkyAxIcnay6bb3COXtyEu5RgQyItUOQltNblQ+5VUouYC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/QyM8a0Wd7Zw3XW5XAw62kDNEbmyX2wVrtPMeTVjxA=;
 b=oG+OCrSw4s2bDBWG6JWg/puhwn+1bZdTS1G0fOKkI0SbSEzm6Eid7tu5qM1FIYISxG7Nq5B0On1vHoVtBNU13D+1i+AXOkjxtyFG/5rr5cckpbkZuowdo4tgPxHpta/AzRY+8innkty2psl30LNI8T6BH6IpazUcaSvTpKffXcdqvgOWeHHMu5aPFKViQ/E9HRcbPODL8jhGmB2opOb763nJ+PHRwImNEuX0pYmQbl7MIK16w01Kc/Va9HOOwHeVW8sHdLgJOo8hLJJL7bSdJz/TObldSOWksHv4+G/gv8Q0grHEk/hL2os/DB/HM1QeyKsOuJ+zZ0uaLxe68g3KAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/QyM8a0Wd7Zw3XW5XAw62kDNEbmyX2wVrtPMeTVjxA=;
 b=b8AyX+coMDMUK4FmlHGIA/8zhRBdFKXsnrsIGvH9jaRBxXiiLGb6ww49rpury3gKVEUDyjWjNlKWe4p8xCjxwL/BCYqrBYK5zUxLQ/shwFSbG45ZUWi5bj9QsrCLrANbRjdEZQf8PcIHkZ7Sh1leRPKA5cQf96JFVk0O/6h7mao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB8848.namprd12.prod.outlook.com (2603:10b6:a03:537::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 21:29:18 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.9009.021; Mon, 11 Aug 2025
 21:29:18 +0000
Message-ID: <c195fe1b-7a8a-4e8e-a67f-22dafaffb814@amd.com>
Date: Mon, 11 Aug 2025 17:29:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/14] drm/amd/display: move dc_sink from dc_edid to
 drm_edid
To: Melissa Wen <mwen@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Alex Hung
 <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250726003816.435227-1-mwen@igalia.com>
 <20250726003816.435227-15-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250726003816.435227-15-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3a64ee-6b57-4777-2ffb-08ddd91e211b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjlTL015UUZKTGt1emgzd2Y2bm9lT0o1Q1Y5YnJhRDUzd29RVjMvdzdRcWZz?=
 =?utf-8?B?a1NSQ1kyczVLUzV2cDI2ZmhvandaMDFURFRBMmpWelVRMlJjTXRDMzh2SlJt?=
 =?utf-8?B?UVZET21wUzVzcjZkZjhWdG0zTFlJQUZqN3FRZENTc0JvRlorUGZnWnBUNXhm?=
 =?utf-8?B?eDFYd2pOM1VPemdBbVlsbE9ERmp1VExRNTUyMHQ5RzR5QVZOdjF2NTgxK0lD?=
 =?utf-8?B?enExa3hqVDU4cUJyd1hvcmVsTStmWHV6S1lLM0ltaHFhUzZMdFY0Y3BVQ0pm?=
 =?utf-8?B?bHNpUUZLcFViZDdhdEdjamRwV25XcjA3eGdiZkJ2bHFvK2h2cEE0cXUxdUs1?=
 =?utf-8?B?MWlpMWN3VGN1cGpQejVEUW5mMlFrc2dJbUYzOGNSVzMxMllGOFpibUtIREFK?=
 =?utf-8?B?Z2Z1UEhmVTdxMlpZTWV1OU9YQ1BmMW9UZUQzcVBiOFpkUWJ3cTY4ODhXMFow?=
 =?utf-8?B?QzJ4c1h3YXlEYUNnNGcrZ3MrRjY4Zzc3eFVUUXZaTlJIZlJuR2V1S2hoSjhY?=
 =?utf-8?B?VFRXUTdKazZXUHlOQWNQSVJHalJHYnd2M3N1ZDQySzlvcEpvUXNaQnd3R1NY?=
 =?utf-8?B?bzU2TE1Rd0hPSmZiNVN3VDFjTm9mMzFXQ2dkcTJmSHJWNUQ3YXFyT0Q5WURP?=
 =?utf-8?B?MGZGbzFvUnRqdTV2d0tDZkVrOVZZL25tVlhYTXpQbzY1dTVITHFtU25mNWR3?=
 =?utf-8?B?UllNOFJtOUZVZTIxS2pTWllZVkx6V1QzT2RSWmsrd3phTGhMbmNTYmdaWXdJ?=
 =?utf-8?B?emJKbUZ0eDJ0eTA5L2VkWFQwZlI1NHdxeVBQcEh4SlZKeHJjWElsWDhxU2th?=
 =?utf-8?B?K3U0VC9FQW1leTUyQmVNM0xpMEJ3Z2RVRFhaQUxBbEl6aWhnTnlPZEViL2Y3?=
 =?utf-8?B?YVN0Z2ZkYUhqeUMxYTlGTmRycVNzdjQ2RzluL1NLRStJaFk1TFZJM3NaTWxn?=
 =?utf-8?B?TXhNb2kzdS9sUUJ3ZTFKSWpZSXZVOW9xTGxKSDljRjFRNDZEa3BuZkxuYVRn?=
 =?utf-8?B?YmM4OTNhNVVOejJpeUQ3S01HZGdsTFBYRU92a3ZwbkF4WW9SaUMwdVpjV0xY?=
 =?utf-8?B?aG1sUmdaM0krVXRKbk1hemNpUW5Md0N0NitVVGlrOHZnNytiVnR3cDdBVEZv?=
 =?utf-8?B?UUlvWXY4Z1owNHlIQzc0ZEVjMFU3OVhYcW5kZ2FqSCtmckVlbk9rY3JpbjFq?=
 =?utf-8?B?aml4Q2NkeEFsWlhVZk9SZzhJTDZvOXdPZmdqUVJGTFpXMnVKTmZ4VTY2SjFD?=
 =?utf-8?B?am16TlBXWHNHSGpabkxFZEVXdnY3amFSNVVqTVhnNTIzZWhvN3NjZHZWenNZ?=
 =?utf-8?B?ckVrS1ZFUW85N3FMVVYwbGlCU0dFR0tTa0pBRTBKU2xNTDNZQUJiNkV0K3g0?=
 =?utf-8?B?WU52SkhxZEozRm1FREQxaW80Q1BWbGFDenpnSWhvUUlDVkVkcUNSV2Zkc2dK?=
 =?utf-8?B?ZXRJeXgwQ2JwdkU4bTcveGpOaHVHaTVkdUxtaloySEhxSnhpbzV3cGtDSmdS?=
 =?utf-8?B?ZHJyUXNINlpCOWdaUjFsTkY5Q1J3Qkt0dVZaOUoxRktibmpnb01NQ2l4SEZS?=
 =?utf-8?B?eHVxTEdubzkxYUJrODdMQ0FPODF0aW5oVEVFSTB4SEVHczhBU1VOUzIybTFk?=
 =?utf-8?B?TmVSUm1VVXlSZzErRVZMTmkvRDRIVGxxaFZBNHlTU3NRTjdXV3JjSTR2cTFD?=
 =?utf-8?B?M0ZGb3ZXR24zZGpFdDkwSFZpNUpvSXNIMjFJVHdRSHEwV05BeFFqN1cvK0F1?=
 =?utf-8?B?Q0ptcnd5NXorV013MXQ4WnBJSUNoOVVkUUNKbE5FTUovaUVzdWRlYmVGMURK?=
 =?utf-8?B?REtkdC9CMG5CeGwvNk9WZnhhUlYyMktodEVOOHVpdW9uRHU0cEd3dnQxOFBT?=
 =?utf-8?B?dTh4azAzcWhtKzF1VW9jQkkyMFE1Y0tkc0g1blB3QnB2cVFLZ1hPWUtaK3pY?=
 =?utf-8?Q?7v9hUSXFlP0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlU5Y1NONXkwQWRNMkUyWU5VZDU1R1JvSnZXanVndjMxUlBtaXVRVEl1TGF5?=
 =?utf-8?B?VzFiSGFJNlB0OXZzellIZlE4dDhVS1I3R3kyZkxhM1VMazRVZlJqRzNzRll4?=
 =?utf-8?B?K1YzN2ZLcXNveE83ak5TMGgwUk5EcG50R0dod2V6RjZFNSthRUUvYU1TUmJu?=
 =?utf-8?B?V3JodTBIWWdKOGQ4b0xjZGFZVTA3V284K1ZJaCtmSHhrQTl3b2FWa0g4M1cv?=
 =?utf-8?B?ZjVWNXFGQ1lwVHF5V1FsU2ZnQWxxVWp6d3lDVXloanZLYWV1bnN2SVltRDF3?=
 =?utf-8?B?ZWtyMnZuWHF6VXBTTEZvWS82aGJrUiszRS84dDlNeUFBUHBTSElqTUd0YVpE?=
 =?utf-8?B?Zmt0blpzazNjbGpybjBhL3FRSzVkMElEQ0NiQlg2TlN4ZlV2bldGVDNlOGNP?=
 =?utf-8?B?eGd5emYyQ0wxQS9JalViazNvOEVzQW9FT2E5NEZEMFZXS0lDQWVnUU1MdjNy?=
 =?utf-8?B?S2FYdndwYjJtMzN6RjZFY3I4MldkT3lnUEhCaDRSY0tydHlxUHo4YzEwczl0?=
 =?utf-8?B?dXVzYVlvaElWOUtQQUdka1BjOXI3aWJuVTBybnI0K3hWVUV3U3B4WjBLRXVr?=
 =?utf-8?B?SVJBaWNESzRYTm1BdHErbFU2MXBQeTlaK3pMWkNvQ1NJVVpRbGNxcWxBNzhU?=
 =?utf-8?B?SVJKTWxzZUw0SWFXVkhObTByaTNOZ2dSVEdTSnlhOVgxY3ZmbXEzTDRGUmNp?=
 =?utf-8?B?bFF6OUxxVXJxRzVhT0NzajlFZHdXeFM0N2ZKV1dxcUJCR2ZwTnprYTFDdnpF?=
 =?utf-8?B?VVFMaVpTMkpLTHo1L2tnWWhKcmEzd09ZM1FsRFB3eE9xWi9YT0tFRjhxSTZQ?=
 =?utf-8?B?ZFJXcFdIYjNvM25UQTVYT1dtVjJuVlkrNWUydjZBekJBWEFCR2hKTHEyOS9S?=
 =?utf-8?B?dVI3d0VHNjBEdWdhcHZ5bEtIcFpFQ0R6bWFyNk54SmpJOC90a3l2ZjRtdnJt?=
 =?utf-8?B?aGlVY0F1TDQ0dXFQc1BHU1BNVVkxa0ZsSzB4QzlMTVFGckFKUjIyejRaRFN0?=
 =?utf-8?B?YUZ3TzlET1Q1eHRGTHBqQytHUVg3ZHlhS1ZQWVpmdVVJNk5hVjVxam1tNzMv?=
 =?utf-8?B?cXRtZVZWMTFnTWx6NlVIbDdnejUrdytRbnQyVllKc1cwaXBYaXY0NFNnM3A0?=
 =?utf-8?B?UTV3Q1RQakZBVUgwMXR2Y3JxU0tKUDhoYWgvbzVyQ2tMUEhzbEdUNytZMXIz?=
 =?utf-8?B?ZVByQzBiZ0pwTmpzYzlIc0liRmUyRjNlNnJJcjZFa3E0TGVhUTlLc1hoV2VJ?=
 =?utf-8?B?TSs1M1ppN1NBR0x6NmVrajFBRTdDeTREbUZ5Ly9ZK3VWM0xOQ3hiaU9NOHBQ?=
 =?utf-8?B?cjl6SEdtNXJmNjBzUWM1cms1bFJ4SEVBZm9vUkczbUpxUG9tUDlnclYwaWRW?=
 =?utf-8?B?VXRqeTc4N01SRG1sTWorcVFCVHh3MTNhWVJCOGVTYThhUnpLaDgzallsdlln?=
 =?utf-8?B?WXZpZzFDOHdOSzlnY2Y1T0tudTlBUDd6cU94aDA0R2tZck1tNEFDanNOSHB1?=
 =?utf-8?B?TWtWbW5WLzBLbk42SW5FVTNKVTE4U0pJcHRkQWlWMktETWtFL3lmcXptbkVs?=
 =?utf-8?B?TUx5MlA0MHEzN0FjRzhpcnRPKy9iTHhha2RQM2Ird0xWSE10d1I3TElQRUVG?=
 =?utf-8?B?bjBoeDB5YWJSbWlMdzI3bGlHbzRWMnVTSnZlWWR4elovMnQ5NEpqMUI5eGFh?=
 =?utf-8?B?bW52WVBvY2xQWU01d1ByMW1PSGxYanhGREppSHNoSDZ5MVIvcldaQ1hOWnRH?=
 =?utf-8?B?MFNQTCtrMUc2eGVRVmRISDU3ajdMNnUwcmE1R1dVamtpcng1UkJFcmZiNElT?=
 =?utf-8?B?ZWNHU1M4bTZFekoxZlpuSnE4N0JYQnVhZVl5ejB5c3Y0R0dHTytwdWt4UGVk?=
 =?utf-8?B?Mkcyb0NiMUF1STYrM0gyYzBWUyt4UlJDbE8xQ0NjbUpyUG5VVVhrLzNZeHdD?=
 =?utf-8?B?YWpyVklPUit4VkRwYU5VUnZHM2xDaE9rOVJrdFU1RjVSTUUzSkEybHNtREtt?=
 =?utf-8?B?VFFNbEJBeXlkTmJZNW52VWVPd3BJZFNUSCtpUkVJeEJNTUNXUkNpVFZCb0NB?=
 =?utf-8?B?QkNQYU9aNE51eDBkZURqdjh4TENuUEh6Q1M5YXh4VStSdHJqd2k5K2pFdE00?=
 =?utf-8?Q?AZgf4Br7KF5pawoUgP6hLL0Rw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3a64ee-6b57-4777-2ffb-08ddd91e211b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 21:29:18.5871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeDaYsgV3k84LCuji8IyIsMp1t/Oo3w54zXhFNR7SUN/Phs2JAQQGYakG6pZBxr8m7PCuwxspiyQ6wTPraf6/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8848
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



On 2025-07-25 20:33, Melissa Wen wrote:
> Reduce direct handling of edid data by resorting to drm helpers that
> deal with this info inside drm_edid infrastructure.
> 
> v3:
> - use dc_edid_sink_edid_free in link_detection
> 
> v5:
> - no need of drm_edid duplication (Mario)
> - fix mem leak on dc_sink->drm_edid
> 
> v6:
> - fix NULL pointer dereference (Alex H)
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 ++++++---------
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 31 ++++++------------
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 21 ++++--------
>  .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   | 32 +++++++++++--------
>  .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   |  1 +
>  .../drm/amd/display/dc/link/link_detection.c  |  3 +-
>  6 files changed, 48 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 878269c2092c..1aa0ccf74580 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -68,6 +68,7 @@
>  #endif
>  #include "amdgpu_dm_psr.h"
>  #include "amdgpu_dm_replay.h"
> +#include "dc_edid.h"
>  
>  #include "ivsrcid/ivsrcid_vislands30.h"
>  
> @@ -3743,6 +3744,8 @@ void amdgpu_dm_update_connector_after_detect(
>  	 * 2. Send an event and let userspace tell us what to do
>  	 */
>  	if (sink) {
> +		const struct drm_edid *drm_edid = sink->drm_edid;
> +
>  		/*
>  		 * TODO: check if we still need the S3 mode update workaround.
>  		 * If yes, put it here.
> @@ -3754,16 +3757,15 @@ void amdgpu_dm_update_connector_after_detect(
>  
>  		aconnector->dc_sink = sink;
>  		dc_sink_retain(aconnector->dc_sink);
> -		if (sink->dc_edid.length == 0) {
> +
> +		if (!drm_edid_valid(drm_edid)) {
>  			aconnector->drm_edid = NULL;
>  			hdmi_cec_unset_edid(aconnector);
>  			if (aconnector->dc_link->aux_mode) {
>  				drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
>  			}
>  		} else {
> -			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
> -
> -			aconnector->drm_edid = drm_edid_alloc(edid, sink->dc_edid.length);
> +			aconnector->drm_edid = drm_edid_dup(sink->drm_edid);
>  			drm_edid_connector_update(connector, aconnector->drm_edid);
>  
>  			hdmi_cec_set_edid(aconnector);
> @@ -7434,12 +7436,8 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>  	aconnector->drm_edid = drm_edid;
>  	/* Update emulated (virtual) sink's EDID */
>  	if (dc_em_sink && dc_link) {
> -		// FIXME: Get rid of drm_edid_raw()
> -		const struct edid *edid = drm_edid_raw(drm_edid);
> -
>  		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
> -		memmove(dc_em_sink->dc_edid.raw_edid, edid,
> -			(edid->extensions + 1) * EDID_LENGTH);
> +		dc_edid_copy_edid_to_dc(dc_em_sink, drm_edid, 0);
>  		dm_helpers_parse_edid_caps(dc_link, dc_em_sink);
>  	}
>  }
> @@ -7472,7 +7470,6 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>  			.sink_signal = SIGNAL_TYPE_VIRTUAL
>  	};
>  	const struct drm_edid *drm_edid;
> -	const struct edid *edid;
>  	struct i2c_adapter *ddc;
>  
>  	if (dc_link && dc_link->aux_mode)
> @@ -7492,12 +7489,9 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>  
>  	aconnector->drm_edid = drm_edid;
>  
> -	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> -	aconnector->dc_em_sink = dc_link_add_remote_sink(
> -		aconnector->dc_link,
> -		(uint8_t *)edid,
> -		(edid->extensions + 1) * EDID_LENGTH,
> -		&init_params);
> +	aconnector->dc_em_sink = dc_link_add_remote_sink(aconnector->dc_link,
> +							 drm_edid, 0,
> +							 &init_params);
>  
>  	if (aconnector->base.force == DRM_FORCE_ON) {
>  		aconnector->dc_sink = aconnector->dc_link->local_sink ?
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index d4d60d62964c..288e87f92f9e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -48,6 +48,7 @@
>  #include "dm_helpers.h"
>  #include "ddc_service_types.h"
>  #include "clk_mgr.h"
> +#include "dc_edid.h"
>  
>  static void apply_edid_quirks(struct drm_device *dev,
>  			      const struct drm_edid *drm_edid,
> @@ -100,20 +101,16 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
>  	struct amdgpu_dm_connector *aconnector = link->priv;
>  	struct drm_connector *connector = &aconnector->base;
>  	struct drm_device *dev = connector->dev;
> -	struct edid *edid_buf;
> -	const struct drm_edid *drm_edid;
> +	const struct drm_edid *drm_edid = sink->drm_edid;
>  	struct drm_edid_product_id product_id;
>  	struct dc_edid_caps *edid_caps = &sink->edid_caps;
>  	int sad_count;
>  	int i = 0;
>  	enum dc_edid_status result = EDID_OK;
>  
> -	edid_buf = (struct edid *) &sink->dc_edid.raw_edid;
> -	if (!edid_caps || !edid_buf)
> +	if (!edid_caps || !drm_edid)
>  		return EDID_BAD_INPUT;
>  
> -	drm_edid = drm_edid_alloc(edid_buf, EDID_LENGTH * (edid_buf->extensions + 1));
> -
>  	if (!drm_edid_valid(drm_edid))
>  		result = EDID_BAD_CHECKSUM;
>  
> @@ -135,10 +132,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
>  	apply_edid_quirks(dev, drm_edid, edid_caps);
>  
>  	sad_count = drm_eld_sad_count(connector->eld);
> -	if (sad_count <= 0) {
> -		drm_edid_free(drm_edid);
> +	if (sad_count <= 0)
>  		return result;
> -	}
>  
>  	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
>  	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
> @@ -158,8 +153,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
>  	else
>  		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
>  
> -	drm_edid_free(drm_edid);
> -
>  	return result;
>  }
>  
> @@ -991,7 +984,6 @@ enum dc_edid_status dm_helpers_read_local_edid(
>  	int retry = 3;
>  	enum dc_edid_status edid_status;
>  	const struct drm_edid *drm_edid;
> -	const struct edid *edid;
>  
>  	if (link->aux_mode)
>  		ddc = &aconnector->dm_dp_aux.aux.ddc;
> @@ -1002,6 +994,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
>  	 * do check sum and retry to make sure read correct edid.
>  	 */
>  	do {
> +		drm_edid_free(sink->drm_edid);
> +
>  		drm_edid = dm_helpers_read_acpi_edid(aconnector);
>  		if (drm_edid)
>  			drm_info(connector->dev, "Using ACPI provided EDID for %s\n", connector->name);
> @@ -1021,16 +1015,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
>  		if (!drm_edid)
>  			return EDID_NO_RESPONSE;
>  
> -		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> -		if (!edid ||
> -		    edid->extensions >= sizeof(sink->dc_edid.raw_edid) / EDID_LENGTH)
> -			return EDID_BAD_INPUT;
> -
> -		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
> -		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
> -
> -		/* We don't need the original edid anymore */
> -		drm_edid_free(drm_edid);
> +		sink->drm_edid = drm_edid;
>  
>  		edid_status = dm_helpers_parse_edid_caps(link, sink);
>  
> @@ -1055,6 +1040,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
>  
>  		test_response.bits.EDID_CHECKSUM_WRITE = 1;
>  
> +		// TODO: drm_edid doesn't have a helper for dp_write_dpcd yet
> +		dc_edid_copy_edid_to_sink(sink);
>  		dm_helpers_dp_write_dpcd(ctx,
>  					link,
>  					DP_TEST_EDID_CHECKSUM,
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 7187d5aedf0a..5ca3e668c8aa 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -359,12 +359,10 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>  					.link = aconnector->dc_link,
>  					.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
>  
> -				dc_sink = dc_link_add_remote_sink(
> -					aconnector->dc_link,
> -					NULL,
> -					0,
> -					&init_params);
> -
> +				dc_sink = dc_link_add_remote_sink(aconnector->dc_link,
> +								  NULL,
> +								  0,
> +								  &init_params);
>  				if (!dc_sink) {
>  					DRM_ERROR("Unable to add a remote sink\n");
>  					return 0;
> @@ -397,15 +395,10 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>  		struct dc_sink_init_data init_params = {
>  				.link = aconnector->dc_link,
>  				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
> -		const struct edid *edid;
> -
> -		edid = drm_edid_raw(aconnector->drm_edid); // FIXME: Get rid of drm_edid_raw()
> -		dc_sink = dc_link_add_remote_sink(
> -			aconnector->dc_link,
> -			(uint8_t *)edid,
> -			(edid->extensions + 1) * EDID_LENGTH,
> -			&init_params);
>  
> +		dc_sink = dc_link_add_remote_sink(aconnector->dc_link,
> +						  aconnector->drm_edid, 0,
> +						  &init_params);
>  		if (!dc_sink) {
>  			DRM_ERROR("Unable to add a remote sink\n");
>  			return 0;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> index 493815829aa5..d89a82c349fa 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> @@ -6,25 +6,31 @@
>  bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>  			  struct dc_sink *current_sink)
>  {
> -	struct dc_edid *old_edid = &prev_sink->dc_edid;
> -	struct dc_edid *new_edid = &current_sink->dc_edid;
> -
> -       if (old_edid->length != new_edid->length)
> -               return false;
> -
> -       if (new_edid->length == 0)
> -               return false;
> -
> -       return (memcmp(old_edid->raw_edid,
> -                      new_edid->raw_edid, new_edid->length) == 0);
> +	return drm_edid_eq(prev_sink->drm_edid, current_sink->drm_edid);

DC is OS agnostic. There is no drm_ on other OSes.

>  }
>  
>  void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>  			     const void *edid,
>  			     int len)
>  {
> -	memmove(dc_sink->dc_edid.raw_edid, edid, len);
> -	dc_sink->dc_edid.length = len;
> +	dc_sink->drm_edid = drm_edid_dup((const struct drm_edid *) edid);

Same here.

> +}
> +
> +void dc_edid_copy_edid_to_sink(struct dc_sink *sink)
> +{
> +	const struct edid *edid;
> +
> +	edid = drm_edid_raw(sink->drm_edid); // FIXME: Get rid of drm_edid_raw()

And here.

Harry

> +	if (!edid ||
> +	    edid->extensions >= sizeof(sink->dc_edid.raw_edid) / EDID_LENGTH) {
> +		memset(sink->dc_edid.raw_edid, 0, sizeof(sink->dc_edid.raw_edid));
> +		sink->dc_edid.length = 0;
> +		return;
> +	}
> +
> +	sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
> +	memcpy(sink->dc_edid.raw_edid, (uint8_t *) edid,
> +	       sink->dc_edid.length);
>  }
>  
>  void dc_edid_sink_edid_free(struct dc_sink *sink)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> index 2c76768be459..a95cc6ccc743 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> @@ -9,6 +9,7 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>  			  struct dc_sink *current_sink);
>  void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>  			     const void *edid, int len);
> +void dc_edid_copy_edid_to_sink(struct dc_sink *sink);
>  void dc_edid_sink_edid_free(struct dc_sink *sink);
>  
>  #endif /* __DC_EDID_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> index 0fcdf803b7a0..5df87d39903e 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -1134,6 +1134,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
>  			dp_trace_init(link);
>  
>  		/* Connectivity log: detection */
> +		dc_edid_copy_edid_to_sink(sink);
>  		for (i = 0; i < sink->dc_edid.length / DC_EDID_BLOCK_SIZE; i++) {
>  			CONN_DATA_DETECT(link,
>  					 &sink->dc_edid.raw_edid[i * DC_EDID_BLOCK_SIZE],
> @@ -1416,7 +1417,7 @@ struct dc_sink *link_add_remote_sink(
>  	 * parsing fails
>  	 */
>  	if (edid_status != EDID_OK && edid_status != EDID_PARTIAL_VALID) {
> -		dc_sink->dc_edid.length = 0;
> +		dc_edid_sink_edid_free(dc_sink);
>  		dm_error("Bad EDID, status%d!\n", edid_status);
>  	}
>  

