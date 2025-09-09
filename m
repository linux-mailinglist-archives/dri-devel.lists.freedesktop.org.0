Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64197B4A4BC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 10:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718DF10E64F;
	Tue,  9 Sep 2025 08:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H7dNc/iH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9978210E64A;
 Tue,  9 Sep 2025 08:13:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CI42TWMOAmNVR9w9LCe0G6Vum0dF5isukjI3AoxF3TWNS6Q2lIYuWCKOW98qKrdpvtJpiw6svzauBSMdWIfX2xK2EV3N7KroN0KqgpqR1EGSXYyMx7BveBA4TdCxZvNpXLUdT1c67MlXqSb2SC79ouMKCLaQguPbPbVd/UJSAVbCdjuaxP3P6A/EHaLOm/Kzl/U4W2rmKtSBw2tteAw5eS7wD6pBBeLUmWlSlZYT6Bytb1bIRd4eMhiizJmnsTVp2DVsFDcnf/PdBACmcgXDBNqaLWTy6dkyAE0WVFsTdQnRddmi6Id3k8E7G4ap754Qp2ljq6Q2ulrh95B9yv//PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2v27gwFMe82BiSVlqpEL51kc5zN6oy8UdDgnEJdMyI=;
 b=aF8ZlPkColH5PydReOYv1Ledm/dFmE4vs+ixvYa8hLSVMeAyiiA1Sqram9r3xtai849cbwpAoxyenfEXdTVPUidhbBp3ntt4nnYPSnZToMTUMb9yTm+gof7WXhyDgakpUG/tn2bGKqhjE4Xp1GJlmzAfWEktOTE3Le3DyXGLLdPv9CbyhnOob0kJbrQ5xrbaiY6R8wNaa17jr4hXh1l3rIcINjC5rVFNtTnyMDIJ5vGRHhmtFFhs59VwsQ9BC+FK8B9sh9vnAiNPGli8I01j7HwgmDzfXE1Lk7TFHwFx20cOI/ydRTPqX3tQnZC/MoWiQ+S+uY6i9mrLPaaBdRasCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2v27gwFMe82BiSVlqpEL51kc5zN6oy8UdDgnEJdMyI=;
 b=H7dNc/iHArtMuLqK1gUyPWWooOiQhXwMynjrgE+pBZ5cBSjwhIxS6Quwg2JX0Y301313NLLM9k/yOc9gbhXI1AtH86zROENys7XhBkvDOSndul8WHopA6hqj6o+Nr1TMfe+B6mgAYPDraIZHD1vI/koA62A+2eKQwCbYgGKd+LM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB5893.namprd12.prod.outlook.com (2603:10b6:408:175::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 08:13:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 08:13:13 +0000
Message-ID: <3913518c-af11-49a8-989a-4468493d075b@amd.com>
Date: Tue, 9 Sep 2025 10:13:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Switching over to GEM refcounts and a bunch of cleanups
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250716160555.20217-1-christian.koenig@amd.com>
 <c5830530bafa9806b9e1b0604d87f7907f651c82.camel@linux.intel.com>
 <5a9c2c36-d1b2-4871-b84a-7372aa547399@amd.com>
 <1f13c0b6-fdbb-4364-a32e-4344f8526464@amd.com>
 <fd34b897a3223346518d3fe009772996eb25c90b.camel@linux.intel.com>
 <d3f60146-39d3-458f-8271-cfcec1c92254@amd.com>
 <c14a919a352742d6344f34455de6aa1e535ecc70.camel@linux.intel.com>
 <c14bb417-276c-471b-9737-0f814af69d06@amd.com>
 <108ed59e07faaaa78167045670cea803d58f7127.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <108ed59e07faaaa78167045670cea803d58f7127.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f276376-872f-4a39-d1aa-08ddef78b8d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWZ2RHZKUkJMRUR0Z0RQZmVuZDB2VVhGQXIrRGdReUx5WVhuT2JjQ2lqZmY4?=
 =?utf-8?B?Mnk4c3crNE1sQkJMZjVXUTFMbENDU1ZqUU5McmY2dmxvbUU2WHFGMlNTaXZT?=
 =?utf-8?B?L2RFa0crc08wb1k2RVJySEdzcVlwbU5EaHFPWkU2REZ2WlFIaEJGYjF1YkVk?=
 =?utf-8?B?NXBYMTgydEFyNitHTEcvRkE4bkhkWjd2RFk4Z0taUDBLM3VQNHlVUnd5d255?=
 =?utf-8?B?elZ5bWRsL3NSZ29kQ0wweWl6SFdSays3L1pKMHRrQ090Snd2SUk1UXlzOXZW?=
 =?utf-8?B?S0NBMnk1RVdLd2RCYjFMd0p5eUlxOFdlU1FzTlJzMVMzbnVrZ2JnQk13ZHlS?=
 =?utf-8?B?V3p0L1d6ZmJ5SnNMSUMvc3NvcHYvMEYyZ3U1OFc1U05oTUpXUnFRNkloRFpw?=
 =?utf-8?B?NzN3OWdGSzd2UEZEUS9OOE4vc3NhOFIxdHhVMFFEYmpYVGtYREU3SmppeUl4?=
 =?utf-8?B?L25VTG1OaVQ3YnQxOW5GcGNZS3YrOW5SNlUzSXUvY3o4SGtrMzJWaER1Umpo?=
 =?utf-8?B?NjNHWlZwRTFIamZXSXJBV1h5emNxTXpERDNQWUhQK2JVZU53OExRc3RRRzRi?=
 =?utf-8?B?UTI3MUN4RkpSQ0gxTTRRZkZJWlRxczFOOFR5YWhycWt5aVhxL1dmRWFwc2tV?=
 =?utf-8?B?ZVJML0lSMS9YM1NtaE9YWi9LeXFpck9JQmhSYTYvOUF5OTdkeFRia25RREk5?=
 =?utf-8?B?MExHUXNFS2hLdy96TDNPYWZqK1Q3UHJIakJPaURsMWQyV1djOXRqNFRMeXl5?=
 =?utf-8?B?MnpTVlBwT1VDUGRYQlpDam42VXJVYXRBbitmUGFoTFVnS3V5NXVDK1RpbVJF?=
 =?utf-8?B?VTNKZnNCU0Q3T0Z0dVBJWW1lV0c0V010cXVuTmJWNmtvUTFjS20wK0pqQkxM?=
 =?utf-8?B?N1oyb2wzS1pwamlJUVBGVnVEaXlFV3UySWJUVWxFRHFXdWhMNHpsa1VrQnRS?=
 =?utf-8?B?RThoTlJjSVNIVDdVd1NZbTUwZE9MTVNJQWVuUmtpT1pCSnc3MHQ4NDVkU3RS?=
 =?utf-8?B?ZFF6Z3pjSzBhcjlsUUkvUzBjMzlhUm9MTUNDWmpvb01BUUlDMmFyN1dYemgw?=
 =?utf-8?B?dmJ2ZGp0bEFrWEF4d1ZzNitGKzg1WkdtUXhtdHR6SkkxUFFjRlRUMnZEVitj?=
 =?utf-8?B?QTQwaDdNY1RGTzlrYit0UzAwTGxxdkd1MFdTd2duYkVDRzN0Tkl0blBHeG9W?=
 =?utf-8?B?S1lsR2ZtVDRqMnY0Q0JBOGJYNXhVTmFsS3dyYnNzN094SXExcWhkc2dtR1VB?=
 =?utf-8?B?WUlXcW5tS2pEeUtVZEU3Y1VmYmVuSytiWTBaMGxrU3NQZCtjTFVheUhOUjBk?=
 =?utf-8?B?M0pONmNObmVTQk40ZFV2YUZCMTMydGRlYkhDQnhtb0llRlRSZUdwN05CQlcx?=
 =?utf-8?B?d1lSeHlLcU1pTHdoN1R0bG1EWE9zUHJDdG9tbjZNbEFGUGpIcUhyNFNhZm1X?=
 =?utf-8?B?ZmRDMFNYODZ1RUlNbHlwbjRzRU9uSEtGMDZRbjZoQmZqMjgxMEY0Ym1sbHJs?=
 =?utf-8?B?SEF4V2Uxa1VjVHVqaEQwaXFTYnZaQitIUWVNd3JJNEtSbW9UN1BTVllyRURs?=
 =?utf-8?B?dEY2V2dQT1pUemdZcXUwM1oremdNTkp4c3pXclFzdTFETm1wTHh2VmJ2c0JG?=
 =?utf-8?B?cktHcjd4ZjV0Y21RUU4vTC81YnBwa2JMcnpUaEo5M0xYWmV0c2tpbzlUaVlv?=
 =?utf-8?B?bVl5WllGd3Y1ZGxFUnUxN1RYYUVYMGpiZU1KbmhNWG9oWmROV2JhYWdZaytt?=
 =?utf-8?B?Y2ppb05xRDN4YndRUHpqTVZDQjZ3ejdMTzA1dXRvb25VeXllRktVV0lyZUlJ?=
 =?utf-8?B?TldtNjNCSE9hODI0TDcwYXhzd0dKb3ExQVRDY2JSRjQrQmZUaEo0QWhESDJD?=
 =?utf-8?B?enoyY0xuTGtpbHNzUkVCY0p2UkRmeVBWUC9XT1dZZlE1dG1uTjR1ejV5bldh?=
 =?utf-8?Q?E2jIpAdw3ug=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1lncDI1VEZIZlpxMzBFb2g3N1A3dHFWckZuS2JyeUlzekFiRDljZ2tMeG9a?=
 =?utf-8?B?dno2VFlvZzluWlUvSzB4d212Rys4UDZrQjZ4NGZQNGs2QXJ0dWdZZitpQTgw?=
 =?utf-8?B?U3VDcWV5TlE4SUZrWDJsMVIvWlRzT1ZqWWw1ZVlPTkhoc0Y4eDZFT01rb1FV?=
 =?utf-8?B?VjlTUHMvOEMvbG15bzYwSG5vdWxtRlhxelNnYUVIcGxJeUMvZ1l4eG92Vzls?=
 =?utf-8?B?cWlkRUdWcEpPT1ZYT2ZjOE5CTzBFNmJmOE5XUUNGSDBZRzlCaXdwYVcxRjN3?=
 =?utf-8?B?SHF3ZmhXckdPZ3NNZ1RGamVOa2RuK2pIcDN2Qkt1QkhMc2t0TVMrOEtkV0pq?=
 =?utf-8?B?cGhsaWRhb2FzdHNzTGF4NEU2SDZUdHRoakVPUnZxVHkrUzM3VExyZ0xFZkxr?=
 =?utf-8?B?dk1lTWxIMzYxOGVIMlJrV3lMSjdxQlZBSk9jeTY4R3Q5bloxU3VDbE92RVAr?=
 =?utf-8?B?bjBDUC92UlFDb1Q2REpZTlVTd1JmSW5iYUR5K29HdGNjRGpuYlcySU1Ec08x?=
 =?utf-8?B?cUtmUlVPQkRianRqNk9nYmErZHlqczNIakNVZUNwdTZrQi9uTVp1ajZNZW1p?=
 =?utf-8?B?cmd5MGI4NUgxYnp1MTdiTXkrRVlFQzFMaUNVV2EyWHBraElISUlBbjZvS2Jk?=
 =?utf-8?B?S1RGSzJlNXZqcnd3a252YUt6eHMxd1hROVlUaEpnMXZyM1pvcTZlNHJCMXdp?=
 =?utf-8?B?aytnVnp4Z1ovS24rRkR4Njg4dStiNFoybVUyc2l5eUhJaVczbitrK0tQT1B0?=
 =?utf-8?B?T2x4bGJ3bmkvQzNjblpDSjM2eHo4ejFGZlFlclVoSW0rOWVMZkp0Z25CMkph?=
 =?utf-8?B?K3BUODUrZUQvRlVOa2ZqSUVZSStKdkVKaGszZlVLcWJTMzREbUVRekI0K3Ur?=
 =?utf-8?B?QTl0dXAwVDQ5akZnRFVxazJmSXpKaTkyM3pseEdiRTZhWHVBanBJVUxsMjhx?=
 =?utf-8?B?ellCWEpOUzR2Y1JQQWowYWsxbHRaTXpKZlE1Wm1JS2ZQQStWT0xiWUdoWnEw?=
 =?utf-8?B?Z2IvakV4dkUzSmFkdWlJeDdLb1duZ1RXM1pNUitqS2haTlIvYmV4aEJRTEV1?=
 =?utf-8?B?T0lrdVFkN0JudVd6clNQUzM5ZUZGVVZHTUsvOWN0WnU3VWdtVTM2dk55VmVQ?=
 =?utf-8?B?WXN4bWxkTm44SkM1alM5RWdNN09ubDdMekFJcmtiNWxiZjNaZXl2OXRpTU43?=
 =?utf-8?B?b1pxdVJ3ZDJrd0JKUWxXODc2WmQvVEdZMHcwMzNsRFNHOHA2ZzhRdHAzYnBX?=
 =?utf-8?B?ajlKWlVYZStmU2crR3B4eGY1eUJrV1BMcVZTYTQ1aElaVko5SHJzOHhjUzZW?=
 =?utf-8?B?dWpoZE9mWUFhL1FzSGt5c1pvSEJ0WnRLL0tSekJDTDdwRS9vemIzc2NRdmJh?=
 =?utf-8?B?eHdEQk1SY3BBbC9FUitYYXJ5WjViQjZyYmYwOW5ibHorblM2SFBBZzdLRXd3?=
 =?utf-8?B?S050eERreGlOVmRZT3RiZzlQcTA2dll6bkJPcW5zSGwweUtWNjJMWU1aM1Y2?=
 =?utf-8?B?QklVSUR3VWp0dXFjZkR2bktzVFdxdG9wdnJuMmZ0VTU4RndMRjJ3cUthbkVr?=
 =?utf-8?B?N01FeUgzbmxZVjhyTGtObHZJNjN2dE1kcHFCMFJsd1JadmNCR09sMTk3MW4w?=
 =?utf-8?B?Qkc5SmM0VjVvOVMxS2lYV3ZLei9PQldFWXVTZStja2dkQ3lWeVRmdUJEVzdn?=
 =?utf-8?B?TnJ6SDk3TU9aWkNMcE9LRk5EMEx3cmsremRWV3ZxazFnNkV3NGZYZ3JiaVlB?=
 =?utf-8?B?eXU0R01PRGNMWVExUmN2QjlPVXJ4akllTXdGQ1B5NmxzTmJyQ1p3M1BHNGJ0?=
 =?utf-8?B?RW1udTNKYWExZm5yaDNkMnNLeGpWMW5JZGpTSjFkUVZlRTBuc0NsbFVxUklJ?=
 =?utf-8?B?cWhadmgrNzNTRWxoS01DdUZXRmp2UXhJWlV3cHdJQUxtUmxtQXh6bGFEYm96?=
 =?utf-8?B?S2pFZU95MmFXNU1mclRaWEhiNEpsTTNBc3FPVUNBSWFMRDZ4clRoN3VtUTZr?=
 =?utf-8?B?MFV1TTVmNUdHd1RBc2tzMXBDRlV3NVkrYnc2Z0p3WllTdGYyVUwrVUlQaGhB?=
 =?utf-8?B?RVVET1B1dmhxTFFCNllBVFoyK3pyVUcxN2VPTHZvbjIveGI3bXBSSTJhTFp3?=
 =?utf-8?Q?J+iKGAAA/BTPaZ41rrIxCz2Yk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f276376-872f-4a39-d1aa-08ddef78b8d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 08:13:13.4928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woz9+gG5Pel2Og1NuMe7B5/RGj9Zj0qxk2gSaCI47rmYCkksMFMIKPbmf25raYzG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5893
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

On 09.09.25 09:21, Thomas Hellström wrote:
>>> So what do you think about starting out with a fence, and if / when
>>> that appears not to be sufficient, we have a backup plan to move to
>>> a
>>> struct completion?
>>
>> Well we need to start somewhere, so grabbing an unsignaled dma_fence
>> reference sounds like the best plan for now.
> 
> True. A good starting point. Although I have a feeling it will turn out
> to be not fully sufficient.

Had another sleepiness night because of pain in my joints, but that got me another idea how to solve this.

What if the first thread who sees the BO with the zero refcount does the zombiefication?

In other words we grab the LRU lock and try to grab a reference to the BO, if that works we do our current handling.

If grabbing the BO reference doesn't work we individualize the dma_resv and turn the BO into a zombie by adjusting the object funcs, init the reference count to 1 again and eventually schedule the cleanup worker (e.g. mostly everything currently done in ttm_bo_release()).

As far as I can see that should work, only problem might be that we need to turn the LRU lock into a mutex to be able to alloc memory and sleep.

Regards,
Christian.


