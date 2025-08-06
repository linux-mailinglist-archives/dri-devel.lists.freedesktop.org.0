Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE14B1C6B1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 15:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EA610E776;
	Wed,  6 Aug 2025 13:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="adxJZ7m1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C9610E77F;
 Wed,  6 Aug 2025 13:17:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCpAEQaGTObpXMDVR8VRprljkcnzl9P/sC21yv6q6FmKkZCznOvCAmxIDdyw/DQG27rwvhVYljXlmRQm13IYdDEJlSXEaR7Ona10DseYT/fx3BupQf4Ohkz9QsR1xIMWld4nkmlW9O2R4Rokjri76j//B9CDj+EJq+Ki6dswI6pAYVFUqmzYHOnBMn9HkVS6NNJg+Q6TXB+zWp89IdP1iykcTDBF2fgikH+EPyyA/o8pL4206KdrM384uRwh6glNO2aLZSs/iwx7ujVsjTfiBQhwbx2tz9F3YvLLXlfe0ctgCrLZlDmWPh7tIMIRW1/ogcAEDGUorlvdutR7iaUeAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlY3MJpmStMAJBWMxjh8PRx/A6fiSbxuWSLcBmkK7d0=;
 b=QrxudxTg7KVqj7LUNSDnNC9fkgaPw8/x5slnTJO1gey1k67YB1+1nEUF6Pz+AMx8a8fjQikZavNrBE4VfJ10vWGuPPgHjDaupYrRF+fGrWlKVfbYPp7dw2pZErTlfX/MT2MiT1JuabVpsXClmEsmbRrg+WHqdnCpAreqsPIZs1lz3yhlROZ8M5n9cYtF+peJKzuc7y88MyL3748ez4cUyz/ObUbFG/wdjNYpH3oBtIPUj1FwhVozTCgOm7XdOKN836hhJVWlnX32QLLcFNEjXBIvpNBEjv95YrWdEsYE4nQjG1VMApvlxlkDT9SEVh54vSual/7z8BQv6xTz03Yi9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlY3MJpmStMAJBWMxjh8PRx/A6fiSbxuWSLcBmkK7d0=;
 b=adxJZ7m1Zo7Ju9lIY1LJ233GbmwuexXe0jtQC/w9aZv6IPsfZvC97kmtBZPi3l1m4vEtjWEQ2eQj6uL3Gu41m4Xbh7wOqC8d3qzb6n6xySNP1F5rq6VdxSzRzLjHjNZ9sqfqfZEeSV2Rnpp+dFlGNVD89R447TlJciG9OC8ukfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7609.namprd12.prod.outlook.com (2603:10b6:930:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 13:17:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 13:17:14 +0000
Message-ID: <ce732501-131d-420d-ad75-61ae987f51d0@amd.com>
Date: Wed, 6 Aug 2025 15:17:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/6] amdgpu: Avoid powering on the dGPU on
 vkEnumeratePhysicalDevices()
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Philipp Zabel <philipp.zabel@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
 <601a40fd-e508-4e9d-8dd3-14329f3a637b@amd.com>
 <41b37595c42e4f492704a31970936d52b96dae97.camel@pengutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <41b37595c42e4f492704a31970936d52b96dae97.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0234.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: fa35d472-736a-4306-6e2d-08ddd4eb8f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2dkSkt0TzJNRGVLRU43OTlqQkFLS1N0WmFHbkRGOFQ4SEZtUEVyQncxNUJH?=
 =?utf-8?B?Z0IwTGo1RWtTNDQrTmNNVzFvSmxXNHRJNTZ3U3JxQ1F2cm9RV2UxUGVwOHN0?=
 =?utf-8?B?aHpERjhRRGRzS0M4bXpuWU9wdVJFUTBycU8xbUZkOG01dTNxRlllV0duaW8y?=
 =?utf-8?B?MVphYzZPalU4UDUrb3FXdXRIdmtlV3J0Q1hzSzJzZXBXbDFMbHNUNjVNSUNS?=
 =?utf-8?B?cTBFRWM4cmovcXRIWWZVdjNVODBjZUt1U25mTTNpN3VmeWpMc3ZBOEQ4TElE?=
 =?utf-8?B?ZERzQUtoSjh6aytnS1RyQjBOZjRZNHMxS0xTZ1BDZXdhaElHcTExSXo2RFFK?=
 =?utf-8?B?WmNBYnFFbm55enZrN0ltK0JHakFLWFpGakd5d1p2R2hBbHV4RXRtYm56ZCtr?=
 =?utf-8?B?alhwYktKQXdvMzlyNGRURVZVNUdmS0V0VmYxRWN1VW9ZS3FxZDRubHpHQUFB?=
 =?utf-8?B?NUpLb3BEaHVtcEhjLzU0WVVIZnREV2lJcWdDN2hMTlFHaWU4a2lYcnVLQUFY?=
 =?utf-8?B?OGJ5Zml1Y3ZYNDcyZ3V0MkNYSGVoNDhxWHNmbnAxZ2E5VEtnQnkzd3QrNm1F?=
 =?utf-8?B?dGxZT1FYODlUZ0VQNStPaVR5L2NTcFdJZTFBSjFxQyt4aTdSTUMzaW1KWEpq?=
 =?utf-8?B?WnFwM2Rob0FzdEJLS1VkZSsrWStRdzdlc0Ezdk9NRGpYQ0NUd2NmT2tLT1hM?=
 =?utf-8?B?TDBwNEd6YjZnUFFvaTRBQkxtMitZUEpYaWJ2c2l1QzhtZkhQWFpzanZNRWhT?=
 =?utf-8?B?MFZhalJGc2RmM1BlMjZRcU9SUFhwRmVGay94L1JrVkwybjNrUVFFekJCMUNP?=
 =?utf-8?B?REFvcjNZSU43R0FrcS85MjB1Y0VhN2o1YWRzZFRoRWNmTFBNVEJNT1pqSzIx?=
 =?utf-8?B?RmFKdys1WkpubHljY1lBeXJCbDVpMzBtcnZzRGlNK29UUkdPUVFjc3A1ZzZm?=
 =?utf-8?B?L3VOeDhmWUFGaFExalU4MFNsbi93TTRnWG1PWmM1aUJxVlE3aGNhVHkrS3Vh?=
 =?utf-8?B?MnlJRXpXTEFmSTlFSzg4T2U2TnhJVnFCWjJ3VTQ2bi8ybkZLY1BwRlNsdDJh?=
 =?utf-8?B?N3VzcE4rU0ZTUXVsTFd4RU5XNWNNUDNlRSsrS0l2dXkwSlZBTjZRV3B6VE0x?=
 =?utf-8?B?amZZOFFiNEFyVXFpUERvVzZ4YXN5RWlRenV4bjhEek95ZnNUQW5zWVRhRklY?=
 =?utf-8?B?N1lQSTJabERYUTRvT2FvSEhFVldsSXhsS2ZxMi9hdExuYmpwVnlBV1FZMlJj?=
 =?utf-8?B?NEJtSTkyNTN6UFZxOUUrN0RJNmw0SDhFUGZablRWbStETlRtWjJMRE9wMnB0?=
 =?utf-8?B?VEFmZUlUSDd3OW9VazEzZitTbkJjZ255WU5CSk5jRXU5L1FoM25yZi84QzJ3?=
 =?utf-8?B?cGlCWWxlOHVEWUd1eWdSY1lGa2hCRnkydUM4RUJaNHVFdFpXMzgxRVVRS2c3?=
 =?utf-8?B?bkdjY3hjRGV3L2hxelFkWVBLMmlBOXNKTjg4R2R0V2V3YUpqZnVPQm1McGNq?=
 =?utf-8?B?dElueWhPb2FUZnRlZDBZbXlZeXFib29oNG0xZzNkbS9CVlZJVWpPVlplZmZq?=
 =?utf-8?B?dDhqK3M0N0FuUjR2UndWUkE4SzlKSjgyRWlvOW9XRkxaR0JBcElyTmN1WFVl?=
 =?utf-8?B?UzV5YjZmQTJMOE5CMEdFdGFVclpUY2I3UHdhSCtLMnJSNHBnY01sd29kaE1K?=
 =?utf-8?B?SU1EcGVBQXl5Ym9sd1l2bWY3bG52TUMvUFV1b3l1dld6bVFERVRvTXQyS2Ur?=
 =?utf-8?B?b0ZkV2JBYUp1OFNhMUxlSUxnL2hJWkxhYVhuSlRCMVJhMFRNWk9qTEJXRjdD?=
 =?utf-8?B?NTFRU3NzalNOUFNpOEZwQ3krWllZdDNIVmpwbjFoTWdCZmE5cGowMVFRakNr?=
 =?utf-8?Q?6CMtHL9HZr1pa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGtWQUs5alZJZkJaQjlKUTZOUjBrNWdvSWNHUUcyUUQ3VFBGS2hRRkNsWUJx?=
 =?utf-8?B?dmxWOHlRU0VJTGR3bW4yNlBnbzFCaktudXpLTWxRR0tndEhNKzZsM0RyZldv?=
 =?utf-8?B?WDNMSTN2M2xRRm40VlUvbGJLK0FXdkpCdTZ1NWF2SWxRYUxJdTJsSjJiRDVR?=
 =?utf-8?B?QzdBaHF5akR6elRDZ2RQeFQ4S1dVeXhOVDA5cE1KMUxLUTJBQUl3dmFBL3pm?=
 =?utf-8?B?cUZaT2pjYThtOEVuZ1FOQU1kUW52cTNQbENVT3ZTWEtCVHhiSmlqWUtOL1hN?=
 =?utf-8?B?bjd6NktLVkphUWJ6ZG1iVkNvMnR3TjVrcy92eXJWU0hUYlhFQWRVUW5iUzYz?=
 =?utf-8?B?eVFnaXZ2MlF2czU5TXd5bWZJRW53VDU5bHlMREpObEMzRVh4MytFelJFeFpw?=
 =?utf-8?B?YXZDM2FsUFdjby9tK0xDaG94cTJHbitBMU5FRDF5MEh4dW14NWpTT3pSSzcv?=
 =?utf-8?B?ek1NTmV2Vi9xUVRRdTd6OVlQeVhZZzQ1Y1B6SWJwVWtWY2xYdDFqYWpBWUhC?=
 =?utf-8?B?Vk5QQzRQRjdZK1g4NUMyK3J1Y29PNlZOZk9DSHdDcHdUSEI4MmxkaEpFdmtl?=
 =?utf-8?B?RzB6TFUxZUh5Uzl4TkhNV24wOGJnZzF4VVk0Y0Z4NVpCU3djZDJlYkVpWGRx?=
 =?utf-8?B?MTZ5d25GWGNDUndlTUlBVHlBMGVSWE5WdEt5bzNNRzYrOGJlM3pzR256bldj?=
 =?utf-8?B?L2NjUG1yWk9Lb0ZzQnNEclVPd2krckNiVzNHa1labDdpSERncFBVQXhGelN6?=
 =?utf-8?B?VDN3RWNSVGNqVGdjU04rZzdJdDZIT0RYSkJtSGhPU1RXV3NEZzlMcWRpaC85?=
 =?utf-8?B?WW5VM21KSVljQk5wY0w0YUlFc2EyWXgxN0JKQmVoc1l1L2trNmJBN0ZxVjBh?=
 =?utf-8?B?RVkyTGJYeE5HT3VtZlN3MHNNVjcwZ3JPQmhrVXdrbDhKT0ZaS0d2MFNuM2FD?=
 =?utf-8?B?RWV4NkNtMkp5U0ZtQkJwdEFab3JsckRrMFdkcGMydTE0akQzVWhucE5BazBM?=
 =?utf-8?B?ZG5ISURtWUdiZ1ROVVpsWWNJOFFESWozNVE0R0pZMzU1aHo0ZEh2WTBLb3NW?=
 =?utf-8?B?bXZRUnRlMnNQK2NKeHU2cVJNdktVaDBRVXdTM05IM2tyd21Sb1pLZU1SalVm?=
 =?utf-8?B?TFV5TDl3VFJSTStxWG1QVC9CWGRKRTkzOTYvS2V5RVZkbFhVRjcrdWQ1Uk1J?=
 =?utf-8?B?MTQ4U25tQmF5RzJXUGl1T0t4cXp0TzhlSGpBTHExQXRvSUpTSWc4eXdpak9H?=
 =?utf-8?B?dGJCUDZQQmhwTnBGTy84U1lZN2FWT2Rwa28yZjFCWVgvY0FOeTRTTldJRTVS?=
 =?utf-8?B?ZmtONHNrb1pXZTRLYVhabkkxNnR1Qm1NUWxSYXhicFlIQ3MwdUtPQnpwMzdI?=
 =?utf-8?B?WmNzZ3lkQUk3SGJpSTVLVjVSdDJVbktlQnl0cHFmUDZjSHBudFdKN3BNTU5B?=
 =?utf-8?B?NVNweVB1T1F5YUJ1RXBZQTlSMDgzVFNlbHRRNDhQKzY2Z0cxZzVIL0RKNTR0?=
 =?utf-8?B?OVNQa0FZSjdQNlh2bEVKUUU4SWhQcWtCZ3RtcGxRcnRleTRBaGVlbU0xTHVt?=
 =?utf-8?B?dmNBQi9BQlVybDVYdkhLZitGelV0Q3pTeHhhUTYzNHVxUVQzTlNzMHNtUUsw?=
 =?utf-8?B?MkVOeTUvYzNJY3hYck01djlSV3VWbHBqNVI4eVpTQkRzaUYzeGVmREdDeEhR?=
 =?utf-8?B?bFJOYmg0Z1UvMktIdjlvVi9JR1BjeVBvQmdCTnhsdnlBcWptdFlzT3NRVC9P?=
 =?utf-8?B?NFI4MWU0OWk5N2ViWk5nZjgxQjY1R21xMGdnZ09wSUFTTjE2MU9ZWmh3OVZp?=
 =?utf-8?B?Q3EvSFFJejl1WktDZTVKZXNPTmR1b0RwaEprWFFvalI5U0k5LzRpbU91bWFN?=
 =?utf-8?B?STh5amF2aWNOLzNSdXJSYnhyVTJ2K2lSWkd3OE5JeFVkbXZxc3h3K2JSbU9u?=
 =?utf-8?B?djNwbGtTV0FrYWNUdGcwb2FJS2xsQTJXem5GMXgxUzQ5SkRCR0tjRjhGYjlm?=
 =?utf-8?B?OWJBNHpqdHNuR2x0TUZYSWpMMUlaSE9CN3prTEt0SDlQUWhpK1hDWjFIS1hw?=
 =?utf-8?B?WE5yNHJyZGtjSGpnbVNuZ080Ry9DV2MzdExqUWZJcFE5YjZnRE96SmFhRFhv?=
 =?utf-8?Q?BC9dJ0PS7vjyCL6EG5p0YiS0t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa35d472-736a-4306-6e2d-08ddd4eb8f67
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 13:17:14.6912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 107MWuntGa4n7F3i3W3hOZ9dMLJIkiE5WzVZEiJEjd4kTN0h4kybO02uc2+uGFlp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7609
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

On 06.08.25 12:15, Philipp Zabel wrote:
> On Mi, 2025-08-06 at 10:58 +0200, Christian König wrote:
>> On 31.07.25 07:36, Philipp Zabel wrote:
>>> This is an attempt at fixing amd#2295 [1]:
>>>
>>>   On an AMD Rembrandt laptop with 680M iGPU and 6700S dGPU, calling
>>>   vkEnumeratePhysicalDevices() wakes up the sleeping dGPU, even if all
>>>   the application wants is to find and use the iGPU. This causes a delay
>>>   of about 2 seconds on this system, followed by a few seconds of
>>>   increased power draw until runtime PM turns the dGPU back off again.
>>>
>>> [1] https://gitlab.freedesktop.org/drm/amd/-/issues/2295
>>>
>>> Patch 1 avoids power up on some ioctls that don't need it.
>>> Patch 2 avoids power up on open() by postponing fpriv initialization to
>>> the first ioctl() that wakes up the dGPU.
>>> Patches 3 and 4 add AMDGPU_INFO to the list of non-waking ioctls,
>>> returning cached values for some queries.
>>> Patch 5 works around an explicit register access from libdrm.
>>> Patch 6 shorts out the syncobj ioctls while fpriv is still
>>> uninitialized. This avoids waking up the dGPU during Vulkan syncobj
>>> feature detection.
>>
>> This idea came up multiple times now but was never completed.
>>
>> IIRC Pierre-Eric last worked on it, it would probably be a good idea to dig up his patches from the mailing list.
> 
> Thank you, I wasn't aware of those patches [1]. Pierre-Eric did mention
> them in https://gitlab.freedesktop.org/mesa/mesa/-/issues/13001, but I
> didn't pick up on that back then.
> 
> [1] https://lore.kernel.org/all/20240618153003.146168-1-pierre-eric.pelloux-prayer@amd.com/
> 
> Is that the latest version?

I honestly don't know. @Pierre-Eric?

> It looks to me like the review stalled out
> on a disagreement whether the GB_ADDR_CONFIG query should be a separate
> ioctl or whether it should be added to drm_amdgpu_info_device. The
> discussion was later continued at
> https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/368,
> seemingly coming to the conclusion that keeping the register read (but
> cached) is the way to go? I didn't find a newer series with that
> implemented.

Could be that Pierre-Eric dropped the work after that.

But IIRC we already use a cached value for GB_ADDR_CONFIG because of GFXOFF.

Regards,
Christian.

> 
>>>
>>> regards
>>> Philipp
>>>
>>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> ---
>>> Alex Deucher (1):
>>>       drm/amdgpu: don't wake up the GPU for some IOCTLs
>>>
>>> Philipp Zabel (5):
>>>       drm/amdgpu: don't wake up the GPU when opening the device
>>>       drm/amdgpu: don't query xclk in AMDGPU_INFO_DEV_INFO
>>>       drm/amdgpu: don't wake up the GPU for some AMDGPU_INFO queries
>>>       drm/amdgpu: don't wake up the GPU for mmGB_ADDR_CONFIG register read
>>
>> That is both unnecessary an insufficient. Unnecessary because we already have a mechanism to cache register values and insufficient because IIRC you need to add a bunch of more registers to the cached list.
> 
> This series was (just barely) sufficient for my purpose, which was only
> to make vkEnumeratePhysicalDevices() not wake the dGPU on my Laptop.
> I didn't realize there already was a caching mechanism in the lower
> layers.
> 
>> See Pierre-Erics latest patch set, I think we already solved that but I'm not 100% sure.
> 
> If I found the correct version, it seems Sima's suggestion of pushing
> runtime pm handling down from amdgpu_drm_ioctl into the amdgpu ioctl
> callbacks [2] would be the best first next step?
> 
> [2] https://lore.kernel.org/amd-gfx/ZnvJHwnNAvDrRMVG@phenom.ffwll.local/
> 
> regards
> Philipp

