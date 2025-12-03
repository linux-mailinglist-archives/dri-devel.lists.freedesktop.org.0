Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8591C9F14B
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17CC10E7CD;
	Wed,  3 Dec 2025 13:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3pPkRcNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013025.outbound.protection.outlook.com
 [40.107.201.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD14210E7B8;
 Wed,  3 Dec 2025 13:11:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9aMrRUz0m87O67/oV5FFlgzaaUa+SL/tAOXHu1nRaen/ZwlbyWrpGlyp0Jb+XSv+u1TJmOydx5pJXoPc3rj2dU2g3Wzx6/EzIK/RvqdVFOrP6lEyAgHc6ldza8wAziahYeOxNs7mtAXXFIyUEq61cTRzoUEAs5u+42wNCg97EvX5qWFqoeMGJwNuzzzbB9PHgBAYdLqGSKMuG4tE+DzKO/ochYdzPUjEa8+Oy9sAgteu4UTcy+aTZO+exCrq1SNwJ9H9CMc1Eb7/ceSRWCMzTFlG8ylW+oLkrJZ9oEvpslj61jVfyVbSLP7/DuzVGs2M7ar6cNc/c2lj8STY4mdKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ar3axpnz/laC7zL5+J1okibnIxmElb5r6anTWoqO9Ks=;
 b=ROvqVLKHi0TI0yxbgjrQu4gF5kWOukczT+KWhDevIbZM9T7mbt0fA7bMgi+udm20zYBSiCTzlWSQebo6PRTKznJNYqj7WWBqIEwVmiAS/j98lrGqQvV5OMX0ArMoEE4OlWEgZr1Mpzar9A7JMeeYU1xZv15NQWVZkFNzViD7qfp5rWcC8zJDgPsvLhedgV12GnHBfSz0B0Ewwpd4aXngYfUQK0IbcJizV2YiKU2zQ2Acl60vRuE1fw/ng9IB+Z3Jai4YzrBJKJJxCproK2O1f6AORfnTf7XV5OPSp79Rqx7JKFHxJwdRKoTcyEEWBG4goFH6ZFK4ig3RbOwRy4FYsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ar3axpnz/laC7zL5+J1okibnIxmElb5r6anTWoqO9Ks=;
 b=3pPkRcNqwCJbrddTC24bB6Cu37iB74ZPYaJDLnO2BZGa9J9ByjJbhYIBUmAVYaksmjhJtAJh+oQKRLundhZpRVfPBIlFZebcJB3Rlkqhcd1QT2/AjX90QWQHNgcLOrfKsoBKYKPpIC5Ayct5/kuKxJU4CzctA1L7s4OtIiGPRRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7824.namprd12.prod.outlook.com (2603:10b6:a03:4c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 13:11:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 13:11:47 +0000
Message-ID: <73172e77-d656-4f50-934a-de8f0d9cac40@amd.com>
Date: Wed, 3 Dec 2025 14:11:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] drm/ttm: Use dma_fence_check_and_signal()
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-8-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251201105011.19386-8-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce1c821-0a81-48cf-3f04-08de326d834c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTA5eUREOGFuNUZvc0QrWTVoM1BVMG5Cd0RCRUhGZlMxelJYU2lrR3c1dG1H?=
 =?utf-8?B?c1BZdy84U0oxL0lNUnNlcFdRRjBySDVQZkh6MkxCMFkxNktFV0g3VEpuMENE?=
 =?utf-8?B?aTgwMTlja3lBMlpPWmt4U1JJeVU5WTZlZnQxQ1JMakdqQWh3cC82YW9kYkha?=
 =?utf-8?B?L1hhcTV0eFNJMnRBUDY4TDdjQ3JzTkJxcXQraG9iRUxOb3pVVlYxdnQvcTVi?=
 =?utf-8?B?VUpmRFZQRmF3Y3VuVXNIU3RRYUNlNDZlMDBPbnlIWmxWSVhlQzMxV1YxL0x6?=
 =?utf-8?B?UVBjM0hFRVhwVklrLzZrcWJsWmxtRUIwN05OUU11SDVaemk3cXZFTi9FQXMw?=
 =?utf-8?B?RTR0bCtDNWI0WTNPbFFPQ3plRkNMTVFjU09UcnBURlk4V2VybzdWYlZ3OWxF?=
 =?utf-8?B?WGhLY3VmRHhnNkRUejZMdUpWWDViRytLRmZLVlE3YjdSTFp2RnVJR2NPblAx?=
 =?utf-8?B?Ry9iejVrRnhSQ1VFNktidFcwV0R0Zm1lS2dUbEdlaUx6Mm12dXozaHA0TVk0?=
 =?utf-8?B?eUtMUXppcG0zbnhkNnlqYU51TDNhbkxYVGhBK3kvdnVPUG1oU096ZW9KSXhK?=
 =?utf-8?B?bFExTzEyeTFlcVVLb1QvVnI2a1hSREN1TUdCYmhUckdKbjUyMWFHVTYydk5k?=
 =?utf-8?B?WjAydTVtS1poeWlwbHhFcnhOeDFKUnVEb0NVMUExbGFsMzRDajlWUkFLVmRE?=
 =?utf-8?B?NGlRaHN4VTlTWDdCZ2FmTjRHYW5NWFlwOUwxWmZLLzZMMEZLRDVvOG52R01S?=
 =?utf-8?B?YmtOV0FnNGd3T3o1RVlaaUc1Sm5QQzduQ05PWmFhaFdQQ1d0NUN1TStWWnVy?=
 =?utf-8?B?RXdPZUtLemxvYmg4TjUycDljdTdkTGlLc2Zjd0NPM0dyN3doNi92Nk1ZdFJq?=
 =?utf-8?B?M2xrWXFkeDF5Z2cxdkhLMklMS2NTZTV2VlhTTi82TGljL0ZIT1hEQ0JOTHN0?=
 =?utf-8?B?OXFsRDVJbTVBeC9NamJRRm5RVkdXWnZXaWVPRWpnQVVRQzhqK21PRndOaHJE?=
 =?utf-8?B?VjVUd3czNmR3M3NlRDZWeG1NUXh4eFlqZHpNNXVWR0VGZmsxOTExVVZtMlp0?=
 =?utf-8?B?NUFFblBvUDZLa0t3UTdodE1BUXVVR2kzR0hERjFTdTJmVGdFWjQwM3hmelJE?=
 =?utf-8?B?eWtqckFpMFlTM0tnNGhoMzNLcHoyTDE4RzJGekZMMU5velk0b2NkZWovT2Jx?=
 =?utf-8?B?aGJiVkY5RmZPY24vUWlobDdwMEEzK1o3SUdobXUzWXhCai9YV2VDTU40ckxn?=
 =?utf-8?B?Q1Q0MTA3QnZ2Y1VOeWtHZW9CKytzWjI2TVBHWGN6aFZNT0tsZnlLNWM3Q0JT?=
 =?utf-8?B?UncrZDBvS3NNSHljOVY2QXpxWXRjVWNlejhYc2hITmVkeUg5VVdscFJrQWwy?=
 =?utf-8?B?RC9hTzJKTHlkVUptQTZjNFVRMVQwdHNIMGJMc0JUcU83ME5tMm1nVWJKMzRY?=
 =?utf-8?B?OVZUT1dQNDZ0N0VIR1cyRk40QTd4R0VyRWM1bGJFZWVrbytrb2pPYmVzSVFI?=
 =?utf-8?B?M1BKSXovcTA0aXZjejRqOERiM29WaUM2bnprcDlVa0lKRWc1eCtjNEEyTVEz?=
 =?utf-8?B?REFYZG85QWprRVVXd3lsQ3J1TlROMkVtYmY2RWdWNkRYK0tMaGxOZGZMK09C?=
 =?utf-8?B?QmYxZytWOWwyNG1EVHA4alp5bUVQUlpNTVlXQlRxYmY2aFFYUEQ4N3ZoMkdW?=
 =?utf-8?B?QVZWMVBMcWtTdUJWb0RKbnNFRHJmZGZ4QWZuZnNxZi9HRGlFREEvMzZuaXVi?=
 =?utf-8?B?WTdEVzB4NkN1bytUMy9BUHVWUGU5ejdST1RUWGNHZjNhblFwVlNCRVFDb3FL?=
 =?utf-8?B?UVVYT242RTI0NXpaVExZYzByTU9rYzViZXdLVk9jRm01aThibVd0TVBIQW9R?=
 =?utf-8?B?VUNxZk52TXhNblVmU2R2VU5pMDBtS0RYTjBmVjBVSGdwTURNR0NUTGhWSHcz?=
 =?utf-8?B?MStlSCt1Q0xGRi9wS0djUjNaYXNCSGNRZFRiRUxhZ1ZPM1FDVHNiU1JsL1BR?=
 =?utf-8?Q?h7bCv0bwk0fgpiUKvPmgPYaOikLvuQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmxqZWFnbGdVZ1JmZTRUNVhxK1ArK201dmR2WGFFVjZ0KzV6a2x6bFI1OThT?=
 =?utf-8?B?aTlVemV3dGNoSmkvbUxqeWdYK3lXSWVRbHlEUDUyclN4SEtsak93N1FDK250?=
 =?utf-8?B?OEdyTU9rM2hNTldhU2hkQStCeHgyYVFjVXVkaCtNcFViZVh3TXpQcXJRSTY1?=
 =?utf-8?B?bDFOdENseXJHekY5K25aMFlNUndWQWJsVlhHV1ZJMjg5OWV2UlFCNFlBUTd6?=
 =?utf-8?B?Q1dVUkFKenZkVFA0cTFCWlVrdmJXUDQwY2RmVERma1BYaURhcGptYVJ4a0Fl?=
 =?utf-8?B?dW5EQkk5b3ZNcVIzT3RLZGV1NHZ0YkZyK0ZOTTVGTDArV1dva09CMUdVU05N?=
 =?utf-8?B?dWFFTVFUamExUENBd1Nta3VoVE5HOWpEQzRRSFZWQjl2SDhPNWVESEJMN0tB?=
 =?utf-8?B?RkRUbG4xU3E2U0ZVOVFKOFhXUkgzK2NoT1NKMC9mbzNYSmRweDBZYXR0WWRj?=
 =?utf-8?B?U3VuajNGbjF4eHFHN2FPTVpneGd4ektQdm9OSzN1UFB2MXdPOWJsVktud3hL?=
 =?utf-8?B?L3RSUUo0eHNIeUYyS3JkNDQ1UCtwNytDeW41VTJNSEZpUHVIbkNyMTRFQVZ1?=
 =?utf-8?B?aS9VNGJZSUdTc3B3RTFWV1pEUkJ4NWVBbjBETWdVM0ZDaVdiTUJmUlVTbzBS?=
 =?utf-8?B?TjBEMHRtS0JreE5DM0ZwSmVSS290cVZYelJJMmlYTUhnRk1tR3A3VmhXNG9B?=
 =?utf-8?B?YklBL3FXdmtyVGFSVFdCYlp2VVhTSGtxYk5pak5ZMkREU3B3Vmp3RWJCT0p6?=
 =?utf-8?B?TE1uYlNYbGdxMjZtcWgyLzdDaXFTZmVCTWlPV2pydC9qZUdlVkpCbUNJQWZQ?=
 =?utf-8?B?dWs4SVdlbzhMRUxoaXZvNmlMZytpMGI5RzlCSkxxSU1Wc1JqU2NsSTk2aUhY?=
 =?utf-8?B?SFhUVlp3ZW50ZjNFaUl6QjJOamMwTm5BVk13YXJUbmFVVXF6ejg2NzRuWUVx?=
 =?utf-8?B?b3Q3czBkTldjVDVrczlxZ3pKZ01oeTZXbjZkaUJFVmYyU1pkWW9RYnBkckNX?=
 =?utf-8?B?QWFqc1Juc2d6RWQzUmxTdDdjK3VQOWVkMjE3eVp0ZXZTcDlvL0NRcnlVTXM1?=
 =?utf-8?B?Nm5NVVRmVGVKSCthVmJRZ0V5OGMvTUFuMEJUb2d4cGdNbE9waDI3cXFpdUZ0?=
 =?utf-8?B?SnU1Mm1ZbE9JQWM0TlNxMm9HUTJSM1dwenBKaUEzS1pCWjBOY2pvV1k5NERk?=
 =?utf-8?B?OXZBU2VQa3I4d0hFZ0Q3WVlFdFNpa2RES2trVkhMajFTQU9tNTlFWmRITk1Z?=
 =?utf-8?B?MmJncFR4WUdmKzNXUHZTc252cHRJWXRDYlIwTGlQSENiK2Jqb2hIRzBiUjZl?=
 =?utf-8?B?QTNqZTNxV1E0VU94N3o0WVdpQ2FwYXRWQW14QThPMkY3c241ZWNUaFRDcFNI?=
 =?utf-8?B?V05lM0FJRG1XYXJPRVRFOTNxYkc0eTM4NlNMQ2txMTk0ZWxUZER1eWhORVpE?=
 =?utf-8?B?WDNQMjY3dlFxdHhhMUlLVk5Fc1RCRkMwcDhOTFVxNHdGUDd0eVpyOXY0RVJI?=
 =?utf-8?B?RUNsU3NHbkFyeE1yN0phWnpYS3ZVSStUcWxpT1l0U3JXeDRlYmZleEVtQXc0?=
 =?utf-8?B?Y0ZzQ3QwS3R4bGluVVYreTVrcTFCRk9qU0tyQjkwT3UvcXp0amNLckdPalgy?=
 =?utf-8?B?UEZLN3Q1dERITWI1UlFQWDV1SnVMNE5yS1NZVTQyK05CRWcwZzhMYklpYWRa?=
 =?utf-8?B?MFdyWHc2alQvVDJHcjlGcTNUaEx5ckYybkVjdDlvdm56b1hVMHdRWmJNNFpV?=
 =?utf-8?B?ZDc1OGw2ZnNlSktmRlRQWnQ4QXFNcm1CekhjWUFEcWhWZG9xNXFFclZOVnJq?=
 =?utf-8?B?TU9jdmRGby9WQ3pER0xLTXlqYzUyOXcwWnFPTFcyVVVGZTNxdXJ0QkZXcEZY?=
 =?utf-8?B?aXVKVGxCSjJQYzZRcDdrTXJVbWJqWUVNR2EyNndlcm1aeHRWRmVlUmMvK1pH?=
 =?utf-8?B?aDQxc052dlRzWWlaTGxEbm5YU3U1K080cXR6RWVDRHNOcldXcXZrK05nTm41?=
 =?utf-8?B?WjRvVVF2ckppd0hoeTVIQUdrWUNjMm5VRVFUV3lTeG53NE5nZ1RHT1U0SzZF?=
 =?utf-8?B?RUVrNmZFM3RkTlN0M3dSblY4ZWZWYjNDRnJ3WlRiU0s0OXdMZGdTdXNlaGpK?=
 =?utf-8?Q?FfV8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce1c821-0a81-48cf-3f04-08de326d834c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:11:47.1545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bloOnW7cjBsvx1mnsxVrYwspTonV5Gem1QyR5/PC01J/RkX7d/QOsW5gk3HCU3w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7824
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

On 12/1/25 11:50, Philipp Stanner wrote:
> The return code of dma_fence_signal() is not useful and shall be removed
> from the kernel. To do so, the few users who rely on the return code
> must be ported.
> 
> Use dma_fence_check_and_signal() and mapp its boolean return code to
> dma_fence_signal()'s former value for already-signaled fences.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 1bcc67977f48..eaf2e91f8e97 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -692,7 +692,7 @@ static int threaded_fence_signal(void *arg)
>  
>  	msleep(20);
>  
> -	return dma_fence_signal(fence);
> +	return dma_fence_check_and_signal(fence) ? -EINVAL : 0;
>  }
>  
>  static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)

