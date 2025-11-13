Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A1C5940A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 18:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5775810E8EA;
	Thu, 13 Nov 2025 17:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qenmK3Ph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012034.outbound.protection.outlook.com
 [40.93.195.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D18910E1E9;
 Thu, 13 Nov 2025 17:46:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5uub2OMwSMeD5VKTgSBsrJuOWMdhmTRmIyf0QF4AlI45G4uiHlNyrRHQOVlDm4Jv8c2LInpgBaAaiFefKRDJSGyYQuPoeZn/Nx4Xv3i0zgDZVenvE5Jn25eXgSuDv+xvjCoIhrnruzCXFrD2LR99oNX+uHZSKh/4IFqkdgIVO+fP5JmZ5WSSOHBX6/8RlzTeOQd9l7xPHmsg71WeF203lx4tHq18PgyG3T/G7eteUn+QzUM38w60tLL0hO4JL7eoycyLDWbUTh+R1mITp42wiGJTZ/EX83VP4fZAvw9HPQed0IlYB2PhzcciFQr3Z8dn+blHI28vbHmOJX3bs+liQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJHGZArIrPMhgDP4mR23Q00qFUrLvZ3qYZMmV5F5454=;
 b=cmAO6Xa6HDwZVvuCnMrwqLMCA7m8whv2xDTe+G8MQZVfrCzK0zamodaNUxv/r0rZXlW9f7zG3/UXP5+pcvrDWk4wRTWvm/EWnUnZt41vkyDNRavRXXdG0YT9Uvnx8v0y25ZohIwoKR7uZxN4Lm+HNXXbMOiXo+GI8mVEBwiN3evGSruhWAqMMSZJZMAsj9mBviE5hYug5AIouSJuNQKyNNprl2kpEN0Ki8qnrJCcHyXxT5Qp5AEPn422EEYmAZrGFHquEluqiCKzankQecA02WMUQSA3/u4wp3q8czq4XthjkorkhLXp/Pq06J4Zb7uU9KEX6pPhDAOEDmpvnvlUdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJHGZArIrPMhgDP4mR23Q00qFUrLvZ3qYZMmV5F5454=;
 b=qenmK3Phv38sumvxdUoAmKP0RJRHDjC39wZymf6YvdWEZ5H+mjysRWELtKC2gfPQzHnp79uUjWrvgB3MgB7j76Z469pP+wfj5vn2UzLfq2QbYPKOinAyUH9iXuNLqUJTcZ4RV6pIsN1XElso4Z7gVDujChJMgvGufaclzz5Ucf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CH1PR12MB9671.namprd12.prod.outlook.com (2603:10b6:610:2b0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 17:46:15 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 17:46:14 +0000
Message-ID: <c9df27e3-db16-4540-8c80-2769e8d9202a@amd.com>
Date: Thu, 13 Nov 2025 12:46:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/20] drm/amdgpu: fix KFD eviction fence enable_signaling
 path
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-12-christian.koenig@amd.com>
 <febe733b667c1700333044bce8649c6520d69148.camel@mailbox.org>
 <5a770cba-9fbb-4645-a987-afe25e446942@amd.com>
 <887de3dc-f6a8-46c7-baef-862fe1acaf02@amd.com>
 <9484fec0-ca36-4968-9edc-ca517825fe68@amd.com>
 <5ddb1da4-84e6-48f6-a9d4-10560f58ab90@amd.com>
 <a01fa221-401f-4548-80d8-5d687e93dbee@amd.com>
 <2715246b-42a5-443a-b4e8-9a67920f5fec@amd.com>
 <6404ddfd-6bf0-4496-af0d-f5168e0c98d8@amd.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <6404ddfd-6bf0-4496-af0d-f5168e0c98d8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::9) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CH1PR12MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e9d62d-b6a2-46e9-ac0b-08de22dc8a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q21xaDJaOXVUWmYvaGdCZmFQRUtRUFlDR0NTUnlZWEpxMFJWT0hzdmJ4NmlR?=
 =?utf-8?B?WEppUTliZkl3bzFxYmdJVE5EZ2s5dHRHVGlNc0pVc2NsdmtaRDVZbUF3c1BT?=
 =?utf-8?B?V2tvWEZxMTJYRjErV1JuOUtLdGhHbkJCVnZjSzhsSGhDQ1RaVVV0RDlLRVZr?=
 =?utf-8?B?UUw0OHFMUURBV3NDZzUyeGpaNmgxVlF2SUFZK2xvb0c0Z0tQeW9hWHExbzVN?=
 =?utf-8?B?SnR1eU0yNWpGQ2FoWmY1K0tuNFhDZ3VwTEJlUDYxN05LOEFMaWVWNnZRZWxp?=
 =?utf-8?B?NFB0Ylg3ZjViaWRxWlRRQ3NHdEliVTdNb25nSlNjTGk5MHAwdDJsSE5VQ0Ix?=
 =?utf-8?B?NjBaazZWVitmbGc0VkJSRDIyR3Y2VHgyVUVDbFdPcDVxVnhHd3RwRkdvNTdn?=
 =?utf-8?B?WWwvV3MyaGZKcFJMc0dqY2pmTjBuQ2hEL2NyZ2Z0aDRVRGs5N3NKRS9HSUVF?=
 =?utf-8?B?STl2NkNLSTcxeUpuTUt2ZWk0eXp0L2c0YWZPNGhlZm1KY2crRDRxRHJCUm94?=
 =?utf-8?B?SFZ2N3I3cEhTTjgxNzUvTVZXQjhVRWtIUGpQVFc5YlZ1Wlgwc3JlMWZudTY2?=
 =?utf-8?B?bVA5RHhQbmx5VnBqcGtGaFovNjkwcUpIS0JiMXM4c0lmYjhmTFhBd2x1SVI3?=
 =?utf-8?B?OHVvbVE4Y1VDWExiQWp0dVdrR0kydmNFZ1BaMFIvbnFCMjNZMFNvWEF6UEJV?=
 =?utf-8?B?MFhYRXQ0Rkl0RmVNY0Q1b3RxNjhSWXkzYW40N091UmRBcTd3Z29MOG04VGNB?=
 =?utf-8?B?Z2Y5WWlVY2FZaCs0NzFvVGc0RGQxQUZMbFpsdlJkNnFTVUFNcE9IbWtYRE9y?=
 =?utf-8?B?RDJsWW1wSXhQLzl0ajZLNWtCNTZ3cWlaSGQxZ3laenI2R3o4cmVXY0wvMVZN?=
 =?utf-8?B?cDM0QVZVbkphc0xKbHNoNWF1aFZCMG9meHVoS21Edml6OG5XcG5ES1BGenlx?=
 =?utf-8?B?dmliRGtpbzRaNmY0cU5oa0NYb25UNnBWZzNSdFc4N2JwYXEvR0ZzWForanQy?=
 =?utf-8?B?emVKbnpuM25QcnJPalVHS2c2VzJNN1BMUlFXZmxPZUl2TlVINlN3MUNRQWNw?=
 =?utf-8?B?WFIzZkNuSjFmV3RuSGNnbktSeEtDSnhQZ2xncE9oVnNydUhrY0xWMkdLd0g2?=
 =?utf-8?B?Z0ZPVlJRQTlnalpMSU1vSGpyc0VuNU1sanN1cTQ3Yi9nV3ZxT0Vnb2lUUGtj?=
 =?utf-8?B?eEQ1Z2JNTG1WY3NuMGZGRnVWOVBnN3Ntd2JmMnovOElmTGRNam5CWUNSWmxp?=
 =?utf-8?B?OGFUT29xTmtJa2NmSkhkZWhiSE5GeGpsUjBCU0hkQ0p2cmp0UTBCOTlST1hL?=
 =?utf-8?B?NkFldHNiUURPcFdiK2lVOFhpTWk4eDNhZEdjVG5Bdjg2K2pBQ0lnUUFHK0dX?=
 =?utf-8?B?YWl5NVhaL0RkU0VGdjNWYXlNQ1dYVlBNUnQvSTd3NktKSWxNUUNnTGJ5Y0d5?=
 =?utf-8?B?M1FjM1l4MFU1M0xsT2FhUHYwVFExSXRscXZzWkIvNlZNcGFickZERStTcG1q?=
 =?utf-8?B?MmR3dzJMV1BtZno5V3FKbFJkT1J3SUJnZ3Y1KzBicUJTZERNcFp6c0llelBZ?=
 =?utf-8?B?ckZYeDVTL3d5THEzZmhBR2xMdjRCdlFtUlY5MjNRYjk4dWVYWHpXSG1FVHRx?=
 =?utf-8?B?NWt4aDJJNS9NelpXUXl1QUVrZS84SjlxZUh5ZkNWZlFMeXRzcmEwU25WMFFI?=
 =?utf-8?B?ZDlXODQ2bURsUXRMM1BTWnpFbTNBOFBVVzdGZFpKK200MTZpQ0Z1MFB1N0lr?=
 =?utf-8?B?aTVrcVM0SkV3UlFMem02Z0UvWGxuRm1yNU93bDhtNzA1NG0zN0tyQUZ1dVY0?=
 =?utf-8?B?T2hrU1pQRUpGanJEM1FDZ0ZyUGZUelVlL2NtekZjRUs5N01jU3lzbU9IZXl3?=
 =?utf-8?B?ZlhRcVBZR1E0WXZTZkM4ekF1UjBrdzhIWldVeHNNT0UxVE5BK0pzZkRHUmhZ?=
 =?utf-8?Q?fugh9a0/mtg01ehKZ8IvyBuAoCOf3sRD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHcyb0RWV2RzckhaSmNTTG92cmlXb0ZmSVRjMVZ5VVk4a245SGtvazZmb2Ri?=
 =?utf-8?B?OUpZTkZacEt6cUN3NWFqMVljeEovT0tucG9OK0NteG5KajFrbTBQNmRhVDZm?=
 =?utf-8?B?dU1MQTk4b3FsTkZuNWhGK0JxZFBKaEIwQ1NmbG9lSTVYRXJZd3JKU3hDNEJC?=
 =?utf-8?B?ZmFpRVZ4MWhYQVl4WEUwN01uZ2lkVGErd0lzYnJyaDhVd1Z6T1piYjNpRmJT?=
 =?utf-8?B?NVJxbStzR3N4Y0VFdXFUbklvWGdISEpLWlJDRnRzcG0vR1pScGtBbytWNU5R?=
 =?utf-8?B?c1ltU3BvK0VqUUN0cFRDM0s3bk9uNlh3aUd4ZGRBWEIva216bThiOFdiME9U?=
 =?utf-8?B?NTNiRXU4YWJEemp5SFhSbDNRb2NsV1Q2cGYvZ1hXS0owenJXK0JuR0hQYndt?=
 =?utf-8?B?QUI5bDM4dklZSDNTOTYzQ2MycVR5MlhMY2xPZzZNTTR4OTg3d1RZb1pnanM1?=
 =?utf-8?B?UE1QekxCQ3B2MEtPWVBxeUJkNGR4SnNLenlEbGJiU0pBT1dtTm1qUEpzeDRM?=
 =?utf-8?B?Z0xWVEUwbW1TazZBZWw0TUx5NE9wZEp4K1puNklHdy9wL2U5NmlSTmdaaEtC?=
 =?utf-8?B?VVhUWjVvODhkb2VXMmdiaFNudDlnaDRMVzdpYmRZSEVaSVVzV2NiN1plbnQ0?=
 =?utf-8?B?ZUlwa1Y0OGw2Vm9pYkZiaFZrK0xWTHdWNnhqVG1kbjVyS01TSVN5V3ZsS2Iy?=
 =?utf-8?B?OGR1RnF4N2ZscXErRktIOXpCbHdQT3hsRmpIRTZyWkM2UWdlTHNNK0F4MmMz?=
 =?utf-8?B?cWltWncwU3p5ZkV6ZkhrbGM3aG1UZUE3RWc1VXNzdmd0Vm5EdE5BQmFBRklU?=
 =?utf-8?B?eDZIVUV1d1JZbEViVVVwcytmdis4Z2N3aTFmYTdub08zaGtUZ1ZKSFNHTTlO?=
 =?utf-8?B?Sy9taEIxcWhHWHFLSkFUaGlrWmQybTJEaUwwb1l4elg4b2tpUEtPSkRWTENB?=
 =?utf-8?B?WjV0bE1XZ1B6ZmhwSlpIT1Z6b0Vqb1ZXU2RzcCt4Y2F2S1pHNFVQT0xiUjZO?=
 =?utf-8?B?a0JiVDNSazMva3B0S2Yra0NBTFkrTkFEUWlpYWwrRjNucHhDQ3VTVElpM3R6?=
 =?utf-8?B?c01nTVpIVHlEaFRWRlBMVHVrV2p2NjRrMkRXcUUxMmdIZHNBN1BCTU1YL21W?=
 =?utf-8?B?OTc1a2xaeElLNzVGSW1xUVZmOUVjZGdGdElKb3o3ZndOeVVkbW5WZkdUTHVL?=
 =?utf-8?B?OE9iZ2ZaaG5nWTRhcHVpRjg1WlpIK09QQi9iTTJsM2FrR2NFdUVqeVdSUXlP?=
 =?utf-8?B?cWsrQzNYQ1dOenA5VUsyby9UUFJoOXpZakhWekJUSlV6cytaeEVUNGN5clRL?=
 =?utf-8?B?dlEwYmlSNzNid2dUZmF6NVI4QU9uZjVLMUxpeTNXVk9tK2tjZUtlN3NJMlRL?=
 =?utf-8?B?Rk1sdU0wMHcyakszZGdEU0h4eVdUeGxscTFnTHMxNWJRY01mRjlESjBPNXdZ?=
 =?utf-8?B?SVpnQ2hYYWlrTXhLMjY3NTBJZldLdHJBVHFRUytXQTVobFZqUmFSQlhTWDc3?=
 =?utf-8?B?ajJlbktiUWlnMFZMSjN0SHFZbCtMVG9WRm9GTkxSZ1RXSGllbmJ3U2c5QXBm?=
 =?utf-8?B?QmRkWkVxVFNWNHFDTHZkQVQ2QjB0eGlDWVg4YkdrRTZ3RHZ2L25YMkNkd1Qx?=
 =?utf-8?B?YllXT2xoaWE0QTFEYnR6enBodTE5ZWdWZXhPdStYOGNHNHJmc0VOdzJGaC9P?=
 =?utf-8?B?YkFQdmx2S1BSamNYZWVENFhJbFFmUXZwelo5OVR4M2tBOGdKc0R5R0tzdmxO?=
 =?utf-8?B?S0NWMDErTk9NNS9qSUtCNkoyUEV1cnlaZFBHdkJ1b1Z2NmgvdEtwOEMrdnFz?=
 =?utf-8?B?NHJ4UWhHSGtMU2IzMmJoSVV3cVJQT3gweFUvYkVxWmNxZ3loMjU5emxjYWtw?=
 =?utf-8?B?Z0VMUkU1VnI1MEFkeGpwcERXcjhDd0VaNk1xaHo2UGtuY1czQ2RuaVUxSFlF?=
 =?utf-8?B?Uit3NjgvS1JzNk9sVSs2YlZWSXZHcHEzbTljTHZMTUxFWjdHKzl5ODBDQUFZ?=
 =?utf-8?B?WkRkdWx5c212VzgxRVFub1R5YXBYcXJ1UnNFUmw3TXQzS3dzbTlqTzFzendV?=
 =?utf-8?B?UUY4MXdJb2tFa1J3Y3ZiWGpUcFhTVWx2T0dWNHh5M0c5MkF1S29yK2NrUHlR?=
 =?utf-8?Q?ix0Du/4UjVETq2g1AZS1+nttE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e9d62d-b6a2-46e9-ac0b-08de22dc8a8d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:46:14.7994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oj4EU4iRdGouNJNwLuH3P8vMwWSSQdm7UJz4yHEkC0jGAec6Gq1XBDYfD0SF39aGB4xS3jCua4tDL804Hb5DTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9671
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

On 2025-11-13 09:37, Christian König wrote:
>>>> There is no need to enable-signaling (and trigger a preemption), if the eviction fence has already signaled.
>>> But when the evicted fence has already been signaled then enable_signaling is not called in the first place:
>>>
>>>           if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>                   return false;
>>>
>>>           if (!was_set && fence->ops->enable_signaling) {
>>>                   trace_dma_fence_enable_signal(fence);
>>>
>>>                   if (!fence->ops->enable_signaling(fence)) {
>>> ...
>>>
>>> So the extra check is actually completely superfluous as far as I can see.
>> Thanks. I agree.
> Can I take that as reviewed-by you for this patch?

Yes.

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


>
> Thanks,
> Christian.
>
>> Regards,
>>    Felix
>>
>>
>>> Regards,
>>> Christian.
>>>
>>>> Regards,
>>>>     Felix
>>>>
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Regards,
>>>>>>      Felix
>>>>>>
>>>>>>
>>>>>>> Thanks,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> P.
>>>>>>>>
>>>>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>>>> ---
>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
>>>>>>>>>      1 file changed, 6 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>>>>> index 1ef758ac5076..09c919f72b6c 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>>>>> @@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct
>>>>>>>>> dma_fence *f)
>>>>>>>>>      {
>>>>>>>>>          struct amdgpu_amdkfd_fence *fence =
>>>>>>>>> to_amdgpu_amdkfd_fence(f);
>>>>>>>>>      -    if (!fence)
>>>>>>>>> -        return false;
>>>>>>>>> -
>>>>>>>>> -    if (dma_fence_is_signaled(f))
>>>>>>>>> -        return true;
>>>>>>>>> -
>>>>>>>>>          if (!fence->svm_bo) {
>>>>>>>>>              if
>>>>>>>>> (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
>>>>>>>>>                  return true;
