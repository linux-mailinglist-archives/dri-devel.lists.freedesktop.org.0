Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CE5D02E9C
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE6A10E718;
	Thu,  8 Jan 2026 13:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hyx28nCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5862E10E718;
 Thu,  8 Jan 2026 13:13:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=futE5BqRcUd74BWj/BOrEJ9i7zyXuqJIymQzoNWmiGtzxGQ+yCUzWVtiL/2pZPWVSB4guG099+11rchtH7Qny31WvJZZEnTi0cuEs+PnznV+MZ1UpFFeC2Rbd1aD7u5GEk61hegD2izr4JBcgh2H+O0FPooZmrTzGhdWTIHTSkfxtrkK5HUsTim6dN3qkNLKR8zsdUxyfkXou53gy0K6RvGBkiv/FSkbNVxbYdhVBJ0HcRt2AVQokIolHo1d5iQtD0NSUHxjKkHFYT8V/Hz08et3pYN15DlBuEb5hMDZnP70cu2s0ZSaIlmIufBKYow27wKN/zdWiit+JWjWDCnd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgQ5z1VlzMHAVJGBmwy/q3wGjB8W1GpX3vAjbTtPfPM=;
 b=H6wPp/9wNA5/YMuE+8rVxKnb7fIYirVXZv0omBIM5WWSmvHm/5MeuDowPIEmyzdBnSoI+4X23tXeMTmAauZy5HHM8JJjxmV0ccs/thEUMkDWX3dwUBpOmEJePh2QNtILkvS9i8L2GXmwTM3swk/t8dG31kAx4EdnFfMD94i8IDVSG2+vxpiWCZx12ZZU8DefepWc/Y8OPXhH2BOUFiry9cealdgkq+1jNh6EqLRng/KSkh8+HPHtfsq9l/31QPY+BKzvQjmnUZVQFKi36R0DrUMVxaolF8inJ2S+xVkqd+ovGmUWi7vFe55WwRNJp7Li0quHL3HWubJjDDiDUS/PyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgQ5z1VlzMHAVJGBmwy/q3wGjB8W1GpX3vAjbTtPfPM=;
 b=hyx28nCtzW4Bq9XTft5kfL5RP5R5a57zeWIl7LrlY8tucInV6Ch5zGDJOnZcu1lMnRWjv0H40ZxomLXy4+EB08fERAJu138mNgNWZLQKKukkA8oOwlmlxS9W+SxmzcVHA/XEYMO6gNbQZ39FEaoWZ/BmHnsxY77N/y/GNVvflPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6206.namprd12.prod.outlook.com (2603:10b6:8:a7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Thu, 8 Jan 2026 13:13:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 13:13:11 +0000
Message-ID: <cdd30c63-cc02-400c-a056-42da6a3bc37e@amd.com>
Date: Thu, 8 Jan 2026 14:13:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/3] drm/amdgpu: Reject impossible entities early
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20260107124351.94738-1-tvrtko.ursulin@igalia.com>
 <20260107124351.94738-2-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260107124351.94738-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR12CA0014.namprd12.prod.outlook.com
 (2603:10b6:408:e1::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: 473ba117-2db8-418a-01d8-08de4eb7ac5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anRKL0FCelEzWnBvWCs3ZjlPVHpOMDZqV0pRWVNSd3dnN3BVR0pXMVhQQk5j?=
 =?utf-8?B?MHlPYlU3NlNSWFkrcE1jZ0J2bmxTVUxuLzZQSHk0M3drdmczWGhQTjVkejNF?=
 =?utf-8?B?ZCt3Qk56WTJHdUJWVlUwODdkVzY5VFBCTEtGWk5XY2xQVi9vQzVrSkQ5eENR?=
 =?utf-8?B?clBIN0dpaVIvTWVZQlp2MEJrUzFxR25mRnRYSkk4dXlYYWI3akJhZjNzWDds?=
 =?utf-8?B?YUJOOXVjN3Z5bVFBdEpmRThyd25SQXgzeW4xM0FKaEJ5MkM4SmFGU2JQSity?=
 =?utf-8?B?MTFnWGNJVzBSZXNPaW1xNTB1MzF3bnlzUWdYSWR6Mzd6cTY2dkptQ01OM0t2?=
 =?utf-8?B?WlVaM3hhVkJXL2RyV3cyejdtTDdYRnZiQlpVSzhzWjVQWUFnV0dnYlRhMXRz?=
 =?utf-8?B?WVBLSFgrczZOeC9VVGxBSEgxdXZvdGlBUTA1QUlKUjVFSjZVc3BkOG14U0M2?=
 =?utf-8?B?Ny80amxvWUFVQXU2ajdGR1UweXY4Q2w5eGR4aWcvOWFpbXlXM2ZYMmtvS3dF?=
 =?utf-8?B?OHVzQWF3SEFoT0NrYytXOEJmMmtZakdIejI3d2xXM0M2aUU1VWJqOWpsM3d0?=
 =?utf-8?B?dUtBSjA1anJVL0pDR2s3aWpxMGlSNkd6YjVaYVRGSE1NVy83b0MxU0JPbzJZ?=
 =?utf-8?B?WWdLTVYrdWhuYXJ3Qm5YdkVaMTBlbWgwNE5TVlNvWXRiTW5DMGhuZ2I5Sk96?=
 =?utf-8?B?NHp0bTJ1UmN2RFczQlVUU0lnRitHeE55QnJ1QXJBTlQzMHJRZlJjeFJJeXpm?=
 =?utf-8?B?L0ExM0VMRXpCMndvSUV5T3RTOXdqMmh6SUZhdHRSeS9KNGtSY1VBS2o4Q3g5?=
 =?utf-8?B?b0ZWdGtnTDFndEN1MVdZVG93UkVCb1luU3BCRlRUaWo0ZjhjV1lUVW1hcVZu?=
 =?utf-8?B?SFZucFRic1B5SmN1SDNqZEsxL1pPekhYaXp3c2hRVUljcnFFd0ZPdThLUDI4?=
 =?utf-8?B?Zis0Y1J2YmE0OHRkQ2hrd2gvT0lnT1dJTWR0MThzaCsyMFYwbHVGWDRpQ3RN?=
 =?utf-8?B?eTJlMThsMFVaOS84NE9nR2lLVGV6RUx0NGxLZjBwZi9BKzdoVEEzdzdJUEla?=
 =?utf-8?B?T013RlF4cFRmSUpRaENadTd3Z3lUMjR1WXQ5L1pZU1V3OG5la013dkRGa1JO?=
 =?utf-8?B?d0k0eXhvN0llUXNKZzJ0dUFNUVR4UDYyVG0xTGVtN3M5cmRodjY4aEV2cEhQ?=
 =?utf-8?B?aGFqdjVHaGN3amVCN1BzbzBmNnJFS0JKbzNtUlpIWGVHcFMrYXRMZWlJbkds?=
 =?utf-8?B?eW1FVzFLNjBqQzZoRDFESHBReEV6MnBva2lSOGxCeEZaVzc3SmNYcXkrTW4z?=
 =?utf-8?B?cXhrSTk0cDVObVNnbXg0d1dJZTNaK3d5YitjMzFpKzNxRDFDQmlIMkI3blRh?=
 =?utf-8?B?Wm9LNUxERXhRenc4UjY1QmN6dHZQSXdFQmhUSFJScVBkZHJ0Z0tBSW44U3FB?=
 =?utf-8?B?cXkrTnVkYlhDUDhoQkZUdnlHV3JqLzBUbDhMYzlyejJrSG1wREtPVEMzSXpK?=
 =?utf-8?B?NWJqU0ZPT3ZsQVlIaFZ2dEt0UUNBZ1EwTG9DbnFOQXUvVThobWpXejRzU0tZ?=
 =?utf-8?B?K3dXWWxSdGlFQk90NUVVaFduZmtRUzhJdTNTQUhtZ29HeHFpMFhQT29MeGdJ?=
 =?utf-8?B?RmxrNXhPM21QZUZiNldwM0hZMmFiY2ZJbEx4Zm1WTU1EUUw2c3pTNkloTUF4?=
 =?utf-8?B?aWgyc0kvcitRWFVpN0diNnMrL04zd21Zc0dKcWp3VmF6b2pIWmVOczVwWENk?=
 =?utf-8?B?WWNGalIyOENFaXN1ZDlMazBWUlZEa3JaT1dMelpEd0ZFYXVZUm5TcmtvTUxy?=
 =?utf-8?B?c1l5dDl1SkZjcGFmL3hCc3pFTHhyenlMWS9SaURNRlZHUTZ1dWlJT0YrR1JV?=
 =?utf-8?B?eXd3YnRURkNvT0h4VFpPdm04eDBleEE2Z2lxV0dlYmRoclZ0bGM2NGhrWjFW?=
 =?utf-8?Q?G6PHWgcCCV8rc4E1ZYRXyv3vfe5zOMYr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUs3TkJaR0F3aFJYODJpUWF1OXMyTFRmSU1QOE40NVpCMVg5OEVnMThmVXdh?=
 =?utf-8?B?NTB3aWxmVHlxekFtd0plN2txaVYwenBGNU9yRWZHdFZ6NnBHWi9kc2VUM3hV?=
 =?utf-8?B?bkRGRDZDV0tZQzNnMzdydnc3TjJncXoyVyttOEErWlh1K3pRYmJzZElyWUha?=
 =?utf-8?B?RkNVV2hwL3psZ0NEZWFTWHVKMThPMzV2ZDNFRjhiSjFsSzNHNlFSaG41SWxM?=
 =?utf-8?B?QnRNc0M4MUJOYjNLa1N4ckpCam9OUXhMZzBXQVFOZDI0SVUwOE5MVmxFcC92?=
 =?utf-8?B?eHBSdk9PZE8waVJ6T3BPMHBnc3N6TXZVWDhyOUcxTTQyYXJHT1A3dW1CdGVN?=
 =?utf-8?B?OHJtL3lrQTNPRGM2RTdRVzloK1hyd1YvVzIyL2tXck5DMktMUjg1WmFEa0oy?=
 =?utf-8?B?N1VmTS9ENU5INjg4WmlScFhvbDl4cGtMalhjMUZpNWhuUG1PTE5FMjhQQWdt?=
 =?utf-8?B?OVVzSm1KSm9BeTlvRFNYaXl1OHdPTnlTdEVCQUhvdXdYVWk0eFZzYk00Mnpz?=
 =?utf-8?B?d2xMYmx5RkVHVExqTWpQQ0pjR29aMzBubmVGNDNRV3B5ZzMxU3pjNmlLVFN3?=
 =?utf-8?B?ZENxb1lvbFllUVhrRlpxa09Nb2dQdDFyaHp1cHRHSU1zWFAyUVI3K2xqbzNr?=
 =?utf-8?B?TGNHSHU2clVvZ1Fha1hTdG9odnByaEhhaWdZZHQyckRDMTFqcnVCYTQ3WVNh?=
 =?utf-8?B?WXlJVllFNGZxM0FKV2FYM1JHSjlNRHZtVDljMUUvWmE0NVFkblpoL2NTWDdH?=
 =?utf-8?B?aEdnQXRBWjl1a3JiR2g3eVVKYys5UG81Nzh1RWZvcXlzcDBoS1h5VEVLTWZH?=
 =?utf-8?B?SG9jbU5Fa1gvRFJndzlTN24zRk1GRmoxN0N3dERpZ0RsSXBtUFFIMit3TTBE?=
 =?utf-8?B?UmQxU0Z4ZWNFTmRkOXkrZjBscmFhb2hsRjlQVkpKNVozSzJaZnBZVWRidklu?=
 =?utf-8?B?dzJKTmx0cmYvN3Y3bTNzODBpdUp0enZrWXpQWTgxenhXbENCdXdidVdUR3B1?=
 =?utf-8?B?SEdGQTBzN0VJNVdRTlhCcXhGZWZacTc1QVVjeG1qd0VHOTdWN2k1bHJyNTE4?=
 =?utf-8?B?TFErc3I2WEV3RFBMLzJyeXpoNFllMlhBZ3I3bENlN3AxSjVuYmkwUFFsNm1U?=
 =?utf-8?B?SFdKMmVVbzA4RURqUWNtblpNVDBxRkhwUklqekJGQU1MRG9NVVRCbHFGd3F1?=
 =?utf-8?B?KzJIRDZTa3pubGRSckMraTYyTW9aRmw5NHRuTXFaTzU3RCtRbjZRMmxmNDJE?=
 =?utf-8?B?RUZLeXhCWjlnSEVoUUx6KzN6dWpneTEyQXRLeDJtLzhGVTNnMEVmeExvVC9a?=
 =?utf-8?B?Wm1lc3o2Z29Cc0hSaXJ5ekVWalVuUzY5UUI5QkJlREZKdjRabEdjZDZKTnAv?=
 =?utf-8?B?SmxjTGxvN2NBTmZLOXdvS1RDejA3VXFUNGd1cGJmTUxwZzc2TWZ0b0padXlX?=
 =?utf-8?B?d0M1S1FCL0lCZnBPSXpjbG1wR2lxTUtQZkhWbjltTE1NL3N3TXdkazl3bjZ0?=
 =?utf-8?B?dDBDQTFJSVBWclM0eXo5eFBNTGNmZTVKR1VVdkxmZ0ZmRWlFSXEzU21jK1B6?=
 =?utf-8?B?TDAzUURmOFZaRkl3UjZjaENmMzY4NVdnYkozNmpuTlY5MERwNXRaRDQ1UXFD?=
 =?utf-8?B?UjN5K2YydzJmZVJ0SkZPSVVQQ0NCZW1zOXp4cjcrME5iQjZKcTQveDB4T1pm?=
 =?utf-8?B?d3JUWFJvbWsrYndsMHZjK2dnS1ExRGFWcG9oVW1JU2dPQkd6bmRzaFgyQS9h?=
 =?utf-8?B?a29UU21jcUFMMEdxVlVROC92SjJheTJJNjVldHYreWZmb3ozV0psQkVVK3JQ?=
 =?utf-8?B?eG96dy9GTkZiWXFFNC91UmdyL05ibTZCbW9aQzZ6ajNkMmYyemozTkk3OEM2?=
 =?utf-8?B?QjduU2JBMXRjUmsrN3crQXJQa1JENVJrT1FyVzhwMG5oc3p4Y2dRSnpkTVdp?=
 =?utf-8?B?Y2NwbWFXR1Q5OFZxb0oxMlhuWWlhTTN5QkFKUk9QUTY0VFUxZ3VhRTRZVnFE?=
 =?utf-8?B?eGhKUDkvOXBlc3A2SGl5akdiVTBNK3F2S2h0Q2RudUdHcXVpbU13KzNaQnlW?=
 =?utf-8?B?U3BJWkt6U2UxdU0rMlJRaDRlSXdlTUxvaVZFdDlrNmNIekIyOG1rdHZZN0Rq?=
 =?utf-8?B?WUczM21keVpJQWc4d056NVVtMk1BTXNhT0lxNG9lVTMvTFYwakE3anZwVEk0?=
 =?utf-8?B?R3RoTzlFb2VqM3FLVlk4cWl1OUoxdGdDUStLV3BFRWZ4VkVlWkdxbkl1ODdT?=
 =?utf-8?B?ZXNvU3g4NGN0Ty9XK1lxbit4TWwwYkRKWnI3WENTRE02YW1WTnlBMmRZa0JI?=
 =?utf-8?Q?+xjQA3GycYtaVRFHGZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473ba117-2db8-418a-01d8-08de4eb7ac5e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 13:13:11.3014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTeOXLp5AqHQqR80muTL/jPH2J0x0/OZsAXwWdD7w3H2ApK+1QH8wYW9MjN+tgl6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6206
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

On 1/7/26 13:43, Tvrtko Ursulin wrote:
> Currently there are two different behaviour modes when userspace tries to
> operate on not present HW IP blocks. On a machine without UVD, VCE and VPE
> blocks, this can be observed for example like this:
> 
> $ sudo ./amd_fuzzing --r cs-wait-fuzzing
> ...
> amd_cs_wait_fuzzing DRM_IOCTL_AMDGPU_CTX r 0
> amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_GFX r 0
> amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_COMPUTE r 0
> amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_DMA r 0
> amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_UVD r -1
> amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_VCE r 0
> amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_UVD_ENC r -1
> amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_VCN_DEC r 0
> amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_VCN_ENC r 0
> amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_VCN_JPEG r 0
> amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_VPE r 0
> 
> We can see that UVD returns an errno (-EINVAL) from the CS_WAIT ioctl,
> while VCE and VPE return unexpected successes.
> 
> The difference stems from the fact the UVD is a load balancing engine
> which retains the context, so with a workaround implemented in
> amdgpu_ctx_init_entity(), but which does not account for the fact hardware
> block may not be present.
> 
> This causes a single NULL scheduler to be passed to
> drm_sched_entity_init(), which immediately rejects this with -EINVAL.
> 
> The not present VCE and VPE cases on the other hand pass zero schedulers
> to drm_sched_entity_init(), which is explicitly allowed and results in
> unusable entities.
> 
> As the UVD case however shows, call paths can handle the errors, so we can
> consolidate this into a single path which will always return -EINVAL if
> the HW IP block is not present.
> 
> We do this by rejecting it early and not calling drm_sched_entity_init()
> when there is no backing hardware.
> 
> This also removes the need for the drm_sched_entity_init() to handle the
> zero schedulers and NULL scheduler cases, which means that we can follow
> up by removing the special casing from the DRM scheduler.

Yeah I remember that Luben looked into that issue at some point as well.

IIRC the solution back then looked similar to this here, but we had to revert that at some point because it caused issues.

Could be that those issues are now solved, but even if not applying the patches and fixing the fallout is probably the more reasonable thing to do.

So Reviewed-by: Christian König <christian.koenig@amd.com> for the entire series.

Regards,
Christian.

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> References: f34e8bb7d6c6 ("drm/sched: fix null-ptr-deref in init entity")
> Cc: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index afedea02188d..a5f85ea9fbb6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -239,6 +239,11 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>  			goto error_free_entity;
>  	}
>  
> +	if (num_scheds == 0) {
> +		r = -EINVAL;
> +		goto error_free_entity;
> +	}
> +
>  	/* disable load balance if the hw engine retains context among dependent jobs */
>  	if (hw_ip == AMDGPU_HW_IP_VCN_ENC ||
>  	    hw_ip == AMDGPU_HW_IP_VCN_DEC ||

