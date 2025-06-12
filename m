Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F123AD68D2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 09:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B674710E72F;
	Thu, 12 Jun 2025 07:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qOWjFX0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8363210E72F;
 Thu, 12 Jun 2025 07:21:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwyyu8svmR+QH87CJDdeJSnjgkli3vqKzyMFGZSNc8wFWYrz4GgrXo+tZZ4QcHfuZVfRgUMTfg9tpB5e5lZ8Q3yxZVJha6R/qjSaUcHBIQ0a1XUjpeNAe2ze/UZ9OGzW/NSePuKIUNi3cxYXxYwFHalQwVJlHGCnIy6yOhkd8UoSKDil2bf3HXsV3fXB8/AsFGJBpzytuG4Ia11VmYV9VmiYYJl6Ux+zYN+l6CY6iOk4Gk4RSR37AJPT+d2im3R9LfgKpnrHwbuXrBItjLViKeoprXLGptz/69ppwTB5W5vXmGwgRVYjwamEZrCcYSfWtbL8SIsiUe2hT1KvK9Z/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+KH9nx36vT7kNs1wyEe7WRyyNcVatNYpNh28R3KFP8=;
 b=ubSUgnvp6T6GscWhs4QMnI5Wzge21qFfKUrr9+mMilefpwVlm/isxK36Ykhnws3TZasNMgBLvxUsC3N18N9/vPCH9mK7RBviYHoP4WjWFTXHKEtNre2dN/khuTxC6tHc0Au8yd7V+qlFl7dZNb/VlhhkurRpNuqlvczE2VwtxHf5V3gYM+GXwWe+2SIfI+5d56XCiAD1orZxhOtHyW1AhhIFj5/SE/Hxf9ECgEfAY8krKh5hUgVgOHcrhi0Aitrv9rO1s+r5kVliZp4Uf0UDikSAEqGasAq7+F4P+BOZdjH26f5Hmm5OBzzWFHN6jzhHko98E8US3E6t//ycbhvG+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+KH9nx36vT7kNs1wyEe7WRyyNcVatNYpNh28R3KFP8=;
 b=qOWjFX0pbBiUjhzI13iJDuEzeq+CeYs2soz+xqoKeSlC68K/fFGpb/0eSF3kGVxPk1WXXkP6DLtShYhP66pM3UB9hYyDVKOaYuFoevcO86qW3H2tX6Af6xDQ/xBYxBT0/GfJmc/oYv1zfOEIUshfrbn3IdcTDNQEnyfMmgYRM+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB9422.namprd12.prod.outlook.com (2603:10b6:8:1bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 07:21:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 12 Jun 2025
 07:21:47 +0000
Message-ID: <c17f25ef-390a-43e3-a467-45e64048ed6c@amd.com>
Date: Thu, 12 Jun 2025 09:21:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] drm/syncobj: Add a fast path to
 drm_syncobj_array_find
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
References: <20250611140057.27259-1-tvrtko.ursulin@igalia.com>
 <20250611140057.27259-7-tvrtko.ursulin@igalia.com>
 <b57b6549-7dbe-45fe-ab8e-4232041ec1a5@amd.com>
 <10e83252-e565-4cb4-9bc2-ae238528df92@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <10e83252-e565-4cb4-9bc2-ae238528df92@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8e34d6-9a05-4898-0a9e-08dda981ca9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDl1NElSR3FZYXZLelhqbFhlK0ZuY0VuaXB3TndEeVFYOFlGcVRWc3NPQzg3?=
 =?utf-8?B?SjJrbUwySForSWVaYWxKNHpEdG10c3BDOVZXdzUzakdIaE5wUUV4dHFwWGtZ?=
 =?utf-8?B?amNuclN0emZhZk1YeWd1Q3N5UHBscmQ0anBEY2JCRlBWK010REhYdmlZenF6?=
 =?utf-8?B?QWRiUTBTNXFHRVE3VU9qK1BRbldLZXlKNXd1TWNrcm9HS1lMb3hQd0N0djcx?=
 =?utf-8?B?TE53NmZoeVhIb3RCcnl5N1NFMkxYMkMySFU2cVlFeTAzVUxPWitycTRYNGdI?=
 =?utf-8?B?U0ZmdVhkamtBMEp6RmRVQnVEMDdMWWRweGVBN1hZQkQxU3pSY0syTkZqczB0?=
 =?utf-8?B?ZlNIRE0wVk5GRHlTNS9yUGFIOWl1aDB3K0Y0bTE4V291V1A0dFNIRXpPVW12?=
 =?utf-8?B?em5rNW45d0dLMmFqeFNXMWhZMEFVMHlVNEFWNGFRZFBtN01ISzhSNEFBSFpJ?=
 =?utf-8?B?Mm9Kb0hrNnFrUldZbVJBWTlvNjRrMUNMSEgwb3dlTUc4Sk42cENqRWpuU3ps?=
 =?utf-8?B?YVdaS2diYUEwUGJZTXpqVzBoUit1UERoRWtoVmtuZVphU3cxQTZKTytpazNK?=
 =?utf-8?B?bEdwTXlLRHluV1JySDFXa2JxNysrazk4eXRoWHlpek1LNDlaSjdPUUVsUDdY?=
 =?utf-8?B?MU9hTStuYUQwVTZOTU42elgyUmkrMG1KNFNLR0RSdlFHZVgxdWdCN0tvc1ZZ?=
 =?utf-8?B?VGlQWGQyNW5henhWWXYzcWNacTBSQjczeUpDSUdMNXdDSncwdjNMZE5VVS9o?=
 =?utf-8?B?UHZ3dFZwNlNYcHRjeVpiWGxzNEtianFSdGxUd2J5eWdnK1NGcDVLVXA0TllG?=
 =?utf-8?B?dXNVUWN4cXBER3RYYTZhTDVLMnpEcXFXWlhmWGZFOG9OS2tKWFg1eUlDWU1Q?=
 =?utf-8?B?OS8vZlh2SjcwUWlXZkRWdDUzNUJJdGlSdU9DQkEwZi9jeXluaXYxQ21BSkFa?=
 =?utf-8?B?cytMNGI2eGZITGxyTjBEOTRqdkkrOERLZVdkdWVwRldnbTlZZmlGQWVFd3Iz?=
 =?utf-8?B?TEswMWFBVmlwbTRwWDk2aGRlSDJKSnRwdy83Vjd1YWNxS2RNYXlXRzN3aXBP?=
 =?utf-8?B?dzVuS3JTc2M1eS9TT3NxSFVBcXo2NDZPbDlGVHk0Ylg1eHFjdURiQ2VycjRU?=
 =?utf-8?B?dW1CaFQ5ZWlPK2UxMGNFTzc4WlVpdGFrVW1uemdqYU5EdGF3RXMvam9pcjJM?=
 =?utf-8?B?VGZNSEU3MkNyNk9CSWRPS1hUem5YOXVmZXFlNWRWcUxLR083N2V0cXp3Ly9D?=
 =?utf-8?B?QUdXS0lKUnFscWxLTUY0NDMvT1JPZ0l0TXVhVXNKTHF4bGJmM09xbUJnTVhG?=
 =?utf-8?B?TEFRUURNQk1taDNIVmlzSTZkeEdqZnVOM0o1SExONGZZa1lBMFpkUnhqU2RG?=
 =?utf-8?B?c0lydzFUYzUxVU95M2lVMGR4TThzSTVDKzgrRXFHOVlWdEZSREU2ZlNmVW1O?=
 =?utf-8?B?RlNqSjhGK2NnQVJkU2ppR2E3Zjd2UjBGbThwaUFRaWRUeHdJd3k3YUsrSWJx?=
 =?utf-8?B?Q3lsWjl0amRuOEVNTjQyeXBjempoV1VzOXdWdHEzNXJkb0dDOXAyVTA2TXND?=
 =?utf-8?B?QStUemgyZjRUam5hZ2g4QWFLT2VYdjcwVjhoNVpQcytFWHpSdDVoY1ZDRmJH?=
 =?utf-8?B?Z1FVMHo4RnNEQkJlY0M0NTdXZXZHOEdMeU52U05qT1BxSG5ZMXdaQ3NNVFM3?=
 =?utf-8?B?dDZrV1F3Qm1LQjRML2tSbE1ZUmVzalFUY3h5RzBEUGNOQTJQQ1Z1a2xucWhX?=
 =?utf-8?B?dnNQMUpkb3d0eUxzdmUvQlpJUEdWNUtMMFZCQWkxMUZMRnJiYytkY0JnWGxH?=
 =?utf-8?B?c0ZweWlUR2Z4aVlHUnJnd3pKMEU4cDhNaU1JR2lENzMxOEtkY2tGdERMa3Ew?=
 =?utf-8?B?NmJRdksxWksrS2dRZWZRWnFXOFEzeDVNL1BaU0FBZE1DQ2FtSkU2SHNZKzd0?=
 =?utf-8?Q?F7zIIN5t73o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzU5bDQrcnh6MGd4VlBJdkdwTFk5eDdjMysxbG1td3NrMDIwVThhQ0l0M3pk?=
 =?utf-8?B?VmNpbHBsZ21iS3k3RFZwZGg4WDlCSFlqRllpdnlPZFZLc0lrNkZlVTlPem1h?=
 =?utf-8?B?MUJXYWV4QytJd0JFcFpGTmxoVkp2UXhJZ1lxMHQ1akM5bVVPcTU0OCtCa0Js?=
 =?utf-8?B?UGIyQjBHMzBpRkhISHlRYzBDSG11TWcvL0krUnZueTFQZnNMd3ArZjNnUXAr?=
 =?utf-8?B?ZnBwUlJmV3ZsOXhTVXFhQk9CZ09xdithbUNUU3RzOTRGVjlLQ0ZGMHJsN05x?=
 =?utf-8?B?Z0E4SGZlWi9taG95M1M3ZEo1YUlBcDRoWXZjc0o5L045REd3UDBwM0dZTTFz?=
 =?utf-8?B?UURvNk1UTFRTTjVwRXU4bkVvZlBKTno0Um8zdnR3QllNS3NiOHhRNTZNck1Y?=
 =?utf-8?B?Q1FLVkJkYzQyMXpjeWcwWXdpUVp5b1V6dmtmc0NtWHo1Snpuem80RkppbDNu?=
 =?utf-8?B?a3VRdWFpUmxMcXd5dklnSGRsMllJb05VRE9GWWpIQmVJQmZtajM0V01vVTNi?=
 =?utf-8?B?NzhKYitScTVjcHZYVWRCeVlVUlZicVRvTnk3WDVia0ZyeUJJTVlpb2VxaHpn?=
 =?utf-8?B?R3RETVNYd2pkQUJnTDUvbkNNTkNLekN4YUZkVTVIMkZJVlgzcDNiRjhpaEs3?=
 =?utf-8?B?YXZaWlpNVUo4VXQxbkJYcEtNRkJoSFZPeVlkcnBTblVvNlBtR3JRemNtWnR0?=
 =?utf-8?B?YlRHOEZmemVtNEFJN2FlNkM5ZUFBaDIxdXdnbWFDSit4d0NVcDc5di9ka0FX?=
 =?utf-8?B?TjNBU2doUmd5akNTL3VIS1QyNTQrMW9tMENLK0ZIUzR5eDBNWDdlNHZ3U3ds?=
 =?utf-8?B?S0dobEU5eGNiS0I4Wm1tRDFxRmUvVU5hNHp6WGdPM3hTWVZnREtyRjJpTTBW?=
 =?utf-8?B?NU4vRU82d2ZiTFVSQW1Sa3l3VCsxS0ZDTVVJTmtocUJKeVoyYk5NT0ZpclNU?=
 =?utf-8?B?VXNQR2U1QWx3dnA2bGRnc3E2ODBBalhOZ2dxTjBGaEVjS29ndGQvVkl2Q2xE?=
 =?utf-8?B?bGJqOEQyUXUvQVQyWksrNTl2OFdYVWxLWWlrZDZHVkY1SDQ0bXdYaWJqTDl1?=
 =?utf-8?B?amRUMFZLOWNHQkRzdDcyUkw0d0lJMTdlZEREcTBjZUI1QVRsYUhVWFB6T3Ju?=
 =?utf-8?B?dlEvYkFKS1c0WVdtY01lZ1c5Sll1aWIxS0sxV1UzUUFEOXZlZU93Z3g1a24z?=
 =?utf-8?B?ZXVpeUhMaGFUMk1meVMyZ2MraGtZdlpoeGU1eUVDbHV1RmF4eGJiemlGL0ow?=
 =?utf-8?B?V1c2Zlk1OXVqRWtCZVhLTXpobHdoWkgyS25ZTXlDLy9xUzJWQUY4cThlUE9q?=
 =?utf-8?B?aVEwSml3aU9aVzRhQ3dwYXBqN1pWQ21HaTVSVW5xdzdOTzlXU1BUTHhnMHhM?=
 =?utf-8?B?SXMrYzRjUlQ2ajZMM2xMeGt4T0RsUG4wRXBYWlpsaGZ3RDBFM1dzVGhNcTFW?=
 =?utf-8?B?ZUxKOXZSaUhPYW1jcDJza0taeGRkcDdMUEJxTEF4MGlUaXRQcCsyRXp5MVJp?=
 =?utf-8?B?YWcwMlFXNVJEUGhNWFF6V0FKMjFtRGFRQWk5RytkOGUwNkZQMU1QSDlPTVlt?=
 =?utf-8?B?aEd6SnVZeDVEckhRd1U4N1lOaWNiamZXTmxZZWs4QzVTd0tQUytNa0R4ZHJx?=
 =?utf-8?B?THU1OVlhVEVEWnFLQ0VKbGpmbVU4TU5MVjdmQ2JKTXdmeVErVWJCbWoxZ0o3?=
 =?utf-8?B?N01hbm9sNVNmb0ljRllsTGgwKzNjMnBmWDUzMUVxRXV0ZjhhMlpEZWJYcEpK?=
 =?utf-8?B?djl0UDVYY1BQcVhJdDR1bG54NDVXeDRTRFg2YUJsN0xTUmJHU1d3VjBVTno1?=
 =?utf-8?B?TFpTckhDbVMwSnk2QzdNdERGaTBXeGhPTWwxa2gybnhNVEN3dzlpVnoxTnc4?=
 =?utf-8?B?eUJjWTZpa1lhWTEyaFZMUS9yMnpXbGVXa3VmR0JZL2hNK2M5QkU0c2ZwempL?=
 =?utf-8?B?bXpaSmlraWkyWnZHN2RSOStPK3FqOEtHeEp0NkpxZjBiVm5sWE5NdFdScDhI?=
 =?utf-8?B?VmExVGZsajIwa3RCaWR5T0k3VTdFUUw1eGFlSTJLMkZkNzR4aWpGT09KSkt6?=
 =?utf-8?B?Q3BzdzVQY1ZKUUZqZkxCYkY5NUdJeUFZY2k0KzNOQi9DNEYxSHFLMmp6eFNQ?=
 =?utf-8?Q?gdCE6+KkjB52LTFL5avJT8vMU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8e34d6-9a05-4898-0a9e-08dda981ca9c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 07:21:47.4471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKsMJoQBoIolU7zw/dOTkVlQdPeyHxgMjIzcXJ3DEBPJT5D38qj1ziOurXJEEUkB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9422
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

On 6/11/25 17:29, Tvrtko Ursulin wrote:
> 
> On 11/06/2025 15:21, Christian König wrote:
>> On 6/11/25 16:00, Tvrtko Ursulin wrote:
>>> Running the Cyberpunk 2077 benchmark we can observe that the lookup helper
>>> is relatively hot, but the 97% of the calls are for a single object. (~3%
>>> for two points, and never more than three points. While a more trivial
>>> workload like vkmark under Plasma is even more skewed to single point
>>> lookups.)
>>>
>>> Therefore lets add a fast path to bypass the kmalloc_array/kfree and use a
>>> pre-allocated stack array for those cases.
>>
>> Have you considered using memdup_user()? That's using a separate bucket IIRC and might give similar performance.
> 
> I haven't but I can try it. I would be surprised if it made a (positive) difference though.

Yeah, it's mostly for extra security I think.

> 
> And I realised I need to repeat the benchmarks anyway, since in v4 I had to stop doing access_ok+__get_user, after kernel test robot let me know 64-bit get_user is a not a thing on all platforms. I thought the gains are from avoiding allocations but, as you say, now I need to see if copy_from_user doesn't nullify them..
> 
>> If that is still not sufficient I'm really wondering if we shouldn't have a macro for doing this. It's a really common use case as far as I can see.
> 
> Hmm macro for what exactly?

Like a macro which uses an array on the stack for small (<4) number of values and k(v)malloc() for large ones.

IIRC there is also a relatively new functionality which allows releasing the memory automatically when we leave the function.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Reviewed-by: Maíra Canal <mcanal@igalia.com>
>>> ---
>>> v2:
>>>   * Added comments describing how the fast path arrays were sized.
>>>   * Make container freeing criteria clearer by using a boolean.
>>> ---
>>>   drivers/gpu/drm/drm_syncobj.c | 56 +++++++++++++++++++++++++++--------
>>>   1 file changed, 44 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>>> index be5905dca87f..65c301852f0d 100644
>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>> @@ -1259,6 +1259,8 @@ EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
>>>   static int drm_syncobj_array_find(struct drm_file *file_private,
>>>                     u32 __user *handles,
>>>                     uint32_t count,
>>> +                  struct drm_syncobj **stack_syncobjs,
>>> +                  u32 stack_count,
>>>                     struct drm_syncobj ***syncobjs_out)
>>>   {
>>>       struct drm_syncobj **syncobjs;
>>> @@ -1268,9 +1270,13 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>>>       if (!access_ok(handles, count * sizeof(*handles)))
>>>           return -EFAULT;
>>>   -    syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
>>> -    if (!syncobjs)
>>> -        return -ENOMEM;
>>> +    if (count > stack_count) {
>>> +        syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
>>> +        if (!syncobjs)
>>> +            return -ENOMEM;
>>> +    } else {
>>> +        syncobjs = stack_syncobjs;
>>> +    }
>>>         for (i = 0; i < count; i++) {
>>>           u32 handle;
>>> @@ -1292,25 +1298,31 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>>>   err_put_syncobjs:
>>>       while (i-- > 0)
>>>           drm_syncobj_put(syncobjs[i]);
>>> -    kfree(syncobjs);
>>> +
>>> +    if (syncobjs != stack_syncobjs)
>>> +        kfree(syncobjs);
>>>         return ret;
>>>   }
>>>     static void drm_syncobj_array_free(struct drm_syncobj **syncobjs,
>>> -                   uint32_t count)
>>> +                   uint32_t count,
>>> +                   bool free_container)
>>>   {
>>>       uint32_t i;
>>>         for (i = 0; i < count; i++)
>>>           drm_syncobj_put(syncobjs[i]);
>>> -    kfree(syncobjs);
>>> +
>>> +    if (free_container)
>>> +        kfree(syncobjs);
>>>   }
>>>     int
>>>   drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>>>                  struct drm_file *file_private)
>>>   {
>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>       struct drm_syncobj_wait *args = data;
>>>       ktime_t deadline, *pdeadline = NULL;
>>>       u32 count = args->count_handles;
>>> @@ -1336,6 +1348,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>>>       ret = drm_syncobj_array_find(file_private,
>>>                        u64_to_user_ptr(args->handles),
>>>                        count,
>>> +                     stack_syncobjs,
>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>                        &syncobjs);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -1354,7 +1368,7 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>>>                            &first,
>>>                            pdeadline);
>>>   -    drm_syncobj_array_free(syncobjs, count);
>>> +    drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>>>         if (timeout < 0)
>>>           return timeout;
>>> @@ -1368,6 +1382,7 @@ int
>>>   drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>>>                   struct drm_file *file_private)
>>>   {
>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>       struct drm_syncobj_timeline_wait *args = data;
>>>       ktime_t deadline, *pdeadline = NULL;
>>>       u32 count = args->count_handles;
>>> @@ -1394,6 +1409,8 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>>>       ret = drm_syncobj_array_find(file_private,
>>>                        u64_to_user_ptr(args->handles),
>>>                        count,
>>> +                     stack_syncobjs,
>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>                        &syncobjs);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -1412,7 +1429,7 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>>>                            &first,
>>>                            pdeadline);
>>>   -    drm_syncobj_array_free(syncobjs, count);
>>> +    drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>>>         if (timeout < 0)
>>>           return timeout;
>>> @@ -1529,6 +1546,7 @@ int
>>>   drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>>>               struct drm_file *file_private)
>>>   {
>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>       struct drm_syncobj_array *args = data;
>>>       struct drm_syncobj **syncobjs;
>>>       uint32_t i;
>>> @@ -1546,6 +1564,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>>>       ret = drm_syncobj_array_find(file_private,
>>>                        u64_to_user_ptr(args->handles),
>>>                        args->count_handles,
>>> +                     stack_syncobjs,
>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>                        &syncobjs);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -1553,7 +1573,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>>>       for (i = 0; i < args->count_handles; i++)
>>>           drm_syncobj_replace_fence(syncobjs[i], NULL);
>>>   -    drm_syncobj_array_free(syncobjs, args->count_handles);
>>> +    drm_syncobj_array_free(syncobjs, args->count_handles,
>>> +                   syncobjs != stack_syncobjs);
>>>         return 0;
>>>   }
>>> @@ -1562,6 +1583,7 @@ int
>>>   drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>>>                struct drm_file *file_private)
>>>   {
>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>       struct drm_syncobj_array *args = data;
>>>       struct drm_syncobj **syncobjs;
>>>       uint32_t i;
>>> @@ -1579,6 +1601,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>>>       ret = drm_syncobj_array_find(file_private,
>>>                        u64_to_user_ptr(args->handles),
>>>                        args->count_handles,
>>> +                     stack_syncobjs,
>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>                        &syncobjs);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -1589,7 +1613,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>>>               break;
>>>       }
>>>   -    drm_syncobj_array_free(syncobjs, args->count_handles);
>>> +    drm_syncobj_array_free(syncobjs, args->count_handles,
>>> +                   syncobjs != stack_syncobjs);
>>>         return ret;
>>>   }
>>> @@ -1598,6 +1623,7 @@ int
>>>   drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>>                     struct drm_file *file_private)
>>>   {
>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>       struct drm_syncobj_timeline_array *args = data;
>>>       uint64_t __user *points = u64_to_user_ptr(args->points);
>>>       uint32_t i, j, count = args->count_handles;
>>> @@ -1617,6 +1643,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>>       ret = drm_syncobj_array_find(file_private,
>>>                        u64_to_user_ptr(args->handles),
>>>                        count,
>>> +                     stack_syncobjs,
>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>                        &syncobjs);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -1653,7 +1681,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>>   err_chains:
>>>       kfree(chains);
>>>   out:
>>> -    drm_syncobj_array_free(syncobjs, count);
>>> +    drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>>>         return ret;
>>>   }
>>> @@ -1661,6 +1689,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>>   int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>                   struct drm_file *file_private)
>>>   {
>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>       struct drm_syncobj_timeline_array *args = data;
>>>       struct drm_syncobj **syncobjs;
>>>       uint64_t __user *points = u64_to_user_ptr(args->points);
>>> @@ -1679,6 +1708,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>       ret = drm_syncobj_array_find(file_private,
>>>                        u64_to_user_ptr(args->handles),
>>>                        args->count_handles,
>>> +                     stack_syncobjs,
>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>                        &syncobjs);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -1722,7 +1753,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>           if (ret)
>>>               break;
>>>       }
>>> -    drm_syncobj_array_free(syncobjs, args->count_handles);
>>> +    drm_syncobj_array_free(syncobjs, args->count_handles,
>>> +                   syncobjs != stack_syncobjs);
>>>         return ret;
>>>   }
>>
> 

