Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA756D0AA32
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 15:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE0F10E8DD;
	Fri,  9 Jan 2026 14:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5gjthZ1W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2899710E338;
 Fri,  9 Jan 2026 14:31:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNZuOuUgB5LFDs2smO/5efBRTathef8WWr+jMZup/2TFdRBi+gCdIyhTnREna6lsB9ZrzF/qVEoGddvW/1CmAH6bu3480/rDTp1YiYkvThvGISlhTctevo+DRT+yqJGXGmMkCG52CDY9+OasMGZ2jenZKI6wZIDUnZd+De5mLsRr8sqIuGdM9bqCWTDsZ9GzOw9ysOGMvsjnsXfC2OzQQhm+8AXg5IswCZwKYizNx8laPEfi/dPhLgmiYKsMGop6ksjGdLelh/FKGMmL5BMKGZRZu5zhCkOwRCCtmicQdERaE7fUxaAw3MdSk70bkLUcc3DKSx6OK31K39IWYgstOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oq+sRiUC9vQxSO277Cw74WGWnCK6TzpHgWtjjkyG9wI=;
 b=RDdZGl4a1CS9JQm20Fbt9xJ7mnj1sD73gYhrsvt6wdhOvpeqz2sfid+aPJuXNGDWorHC189vzn5FEFkCr4G+5v3re31ZNfu/aW8ke9ph+u7VyDayx2O1tRe55Kcq2/IAgtQloAzd3ASobTtvWRsOAe3kqEQLw90YkucIfgFJmNJgGC09NwDvzOwXST4x/38JOWegqY8vIBiTN8r8LqCCOxq9+2i3Zd62C2a4u7w2BLJFpnP/sRKs8NZOnTx0V+I6CUDsxk1Qm1qW/0bXjUtOJIGUnRGDmEG6VunCOh1bzTf4dXrIbSgsKSKET0oXZDstnSuiAnkPWqyDwA8AozKbJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oq+sRiUC9vQxSO277Cw74WGWnCK6TzpHgWtjjkyG9wI=;
 b=5gjthZ1WCQsLXrgj0JmuPUir7qbuyPUWoHGhsSU2IN/1jhXMrvJnyHLKITgCpypk5579Hk8K4PevPUvywURvGqnjZ7ro5i+LNoAErldZxbdxk5C1AtgFU4fWOEJsmfmYtwLe99xz6aKuiLlJ1wg1EgJ7BO2KuCmkK04rRd/NIHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4165.namprd12.prod.outlook.com (2603:10b6:610:a4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 14:31:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 14:31:51 +0000
Message-ID: <4d6ed6a7-89d6-4fa5-b754-2ecdbd42344c@amd.com>
Date: Fri, 9 Jan 2026 15:31:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Simplify idle entity check
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
References: <20260107134405.96603-1-tvrtko.ursulin@igalia.com>
 <1e7ae073820d0cbb7f6f615b40e0cf4c6133a062.camel@mailbox.org>
 <607847da-4f8a-4c19-9ebe-c07f79ce1362@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <607847da-4f8a-4c19-9ebe-c07f79ce1362@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0171.namprd04.prod.outlook.com
 (2603:10b6:408:eb::26) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4165:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ffec90f-1c1d-4c39-c175-08de4f8bd47e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cE12eW91bkxLL1FITHFHMyt6OWQyUmsvRnlmc1JtVmppb3FIMHM1c1d3VnVa?=
 =?utf-8?B?eXNUSkl0QU9LNGM4ZTF5RVJGM0tYaVZEYU5vMUZXMFZTWlYvZU1Ec0t3U0Jn?=
 =?utf-8?B?SWt1KzQ4V1l5SWQyb0FuRVNScjZVUEc2dWdEVDNObmdVcHB3aUVETDJnc0NM?=
 =?utf-8?B?UVJMY0ZpdStQeUVzMlF0VVAxZ2UrWk5wVzVWZnVsalRkSHRNNkR0enJHSFVT?=
 =?utf-8?B?SjAvTHJ0MTlEckdXa1FGWXlHelFWZTR4b2xqUkRUZjhWWUw3eVhUcnF3aVNC?=
 =?utf-8?B?RER3Z3d6K0k4SHRxbDAxZGFVMFp2cFBCNG1vVm0wMmZCazV1VmN0MTZrMTBz?=
 =?utf-8?B?YThLbXRodGcxdDVuSDhZbll0K3hMU3BzVGM2NVJWZHVLOFAyQjFlNXhxbE5p?=
 =?utf-8?B?MHR0blpmQUdteWJleFU5RlEvVXlMWjg0Y0c4Wi93Yk9FL3RROURKaGt0M29X?=
 =?utf-8?B?Q3Q5elc4MGFrL3g4Z3htK2NDTnVJbUttNDlxR0d5Wk9pSlBsNW15dGoyVVoz?=
 =?utf-8?B?QVZMSXg0VkNPRXZTTk5VdzlqOGNEN1N0QWVuV2dWWmtPY1VoellVUnBYWXM5?=
 =?utf-8?B?eWovV2ZrUEU4YWpaZ2ZoVHBQaHdvejh1bUYxM2s1eE5kRVV5RXZ5My9uNU90?=
 =?utf-8?B?Yy91Ui95aUIyK0d4VXJCcXJUb3NTcFpLZFdxYmZseTFpT1U3c2dKNDQyNnhQ?=
 =?utf-8?B?TDd6VlZsU3lNdmY3SlRSTjdPMW9VM1JTT0lQaUR5K2FjZ2tpSUthWFdiNGNl?=
 =?utf-8?B?RHltSmV4cGVKTWJRRDBQcHQ4cGlPWENtUVUrVDJwZzFEK2F2cDdJcXplT01r?=
 =?utf-8?B?N2ZZWXMxTy9wd0gwYjN1b2xaMEpEVEx1OWUxWFJEVEFzblVoS1hpbnlHdFg2?=
 =?utf-8?B?a0lWVlNhMjhOZC92TTlaZ0dHWXIyTUVjTzQ1V3VFT2hqRWhuNUVKODJSeUZJ?=
 =?utf-8?B?VmxobC9ZaWFraHQ3QmV3WmFPcXF0WWhhOUZGYzJRY0FzNUNiUUw3ZTF0OExq?=
 =?utf-8?B?ZHQzSnNtN2s3L0pvRmhzMWNnallia3phVWY5bW43NXgzbER0bFhlUHBoVENN?=
 =?utf-8?B?bmJDY01mNDdqZkI1MS9nTVJXQ0gwM2MzTjhMVjU2YWF2NEYvWjZYVjIzN2xq?=
 =?utf-8?B?enAvNUtsUUlkWnd2dFM0MmJoWi83WjFsajNMQ0JFc3hsd3RZZ01FS2wxbm1u?=
 =?utf-8?B?R0EyR2dwVEh6cndzSUxmR1MzSEFsaFplZzBEVHRlejFRbzRsdXNPQnVoRGw0?=
 =?utf-8?B?TTZKbGdsVmpwYVBEUzhOQ0YxY2htaFFJZDBnNDJoUEFweEVEWEVwaHdxMStm?=
 =?utf-8?B?bnJGYU1ESDRiSHE0azNUQkNzQWlUU0swQUw4ajdEbGMyd0dxc3VTU3d5V3g0?=
 =?utf-8?B?eWRIZnZmWjJrVVFrM1ZQUExLSllqY2tNaFlJZW15YXdTSmYwWXUwQzhYL2Ex?=
 =?utf-8?B?RGRDQm1OSFpOdE9GeGtCMyt0S0FrVHE1RWo2cFpQL2VPRnZyL09CTFRDa0dX?=
 =?utf-8?B?SFFvNnVTRjVSbm9YZ0Fsb3NsUjVoY21GV24xNmdEemdMV0pUb1RuWTVuZmRH?=
 =?utf-8?B?dE1nbDEvZ2Z0MGs1ZDhYUUlheXMzcmV6QnV4YlFsT0kzaHhhYkNOalZ3bkV5?=
 =?utf-8?B?am5tWEpHenY1b092MzY2ZUJLbStXZW5lcTl4RUtJNnBnUmpHRXpJK25XTk5N?=
 =?utf-8?B?QzZXU2JoNnp4aHhqMGdWb21WRWJvNHpjNFhnempTeDU4Y1R0bCtkS1BrVjVD?=
 =?utf-8?B?TUZSNDl0RHVEZmdvYjNoNFFaSU9pOE5zUVk3SU1oSElxSHhjdUQ4aXJvK3Fk?=
 =?utf-8?B?VlZvSWozcDFWTnBlNDdjazFsSnVPNng0UkFFQ2tWTlQxUDg2WkNpMEJldVE5?=
 =?utf-8?B?bTVYUXVsME16WmtncEtPT0ZGcmFOUlFiUlZJY0RHcWNpT2N3NUdscnFxM2FT?=
 =?utf-8?Q?R7/stritJWNfWLOilfAp8WXbXi6z72np?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUFJeXRJVFM3cDAxeXFoSTV1TCtsdjdhWHpZemY0NTg1d1EvWTNrWkNUZEx6?=
 =?utf-8?B?bTBVTUpqcnlMK240dDVIVjM3dzgxb2NYWVhYak5DMHg1a2hqMDdNNVFWZ1VM?=
 =?utf-8?B?bzNXdjVzd1h6eWN4ZFVySytMS2RVWFc4a1k3MjZobmdmR29RVi9XM24vZWs5?=
 =?utf-8?B?c0I5WW1XNEl5NzBGT1lrU0lFTTlXd2JhblMyS0F5OCtmd1NodjlPSHFpbnpo?=
 =?utf-8?B?RURBTXhFSlRTOS9oR29MaXI0WTJpcENOWUtuQmIwSC9WclNYSkQ0Y1ByV2ha?=
 =?utf-8?B?RitTa1NiUWFkcUxzK2Q2TVJKeGNRaG9iY2JtWk1HZ3BNWVVkc0tSSlRaUWs4?=
 =?utf-8?B?WGd5Yjhsc2RRR1dZY0hYNFhXVFdWM3A3ZFNLZ1E0M1hhYWZ6Z2ZsZlNzdWIy?=
 =?utf-8?B?T1ozamNpVWZqeVd0QzR1S2hxc1pPUTNjY3l4STIvQkVNelNYem81Y0pWOTNU?=
 =?utf-8?B?bTFrT0F1SzNNM1FzbmxWekxIdVVjeElmV0NBZExGUmZkbGtHSmV0NHJSRXFZ?=
 =?utf-8?B?aXVCRFdiVnhZWXVwUUoxSmZMNklpUC94QmlwaVZiSjF3b2IrdE9xT3F0UHh3?=
 =?utf-8?B?ZXZOd1piaFQ2KzRJSTVLMEdLR2JjckRTM1JCOGlGWUpQaDA2UERxQ2RtRlhh?=
 =?utf-8?B?R1NablY5amVJdmdMaGhHWitrVE9vaDM2eG5iL3VKZGpFelp6YUYyL1BwUk1k?=
 =?utf-8?B?SGZNOVo1MmpRNXl0NEYvTjYxcG1zaU1BNytaZlYrWUhsdldCRm0xZ3hJUGl6?=
 =?utf-8?B?KzErUm4xSVo4dG1PVERsWk1Obm02bGtxUlB0N0tpSDBUWHZPYzBYalVUSDRI?=
 =?utf-8?B?ckF4QVUxbmpYUGd4Q0tVbi9UZUNqOFk4TWprQnE2SnpnUUhjSkJoT2ZBZEZD?=
 =?utf-8?B?ZTdVTXZTUnY2RWhLdy9xQkNmMjR2QkhIbDAzK3JFb0R4TllmZ1hwRlZkK0lj?=
 =?utf-8?B?YkFXSjZTZ0llbXJqdHVtcDUwRURCWFFPQkw0ai9ZUC9FWTdSWE1YdU5NUnVs?=
 =?utf-8?B?bC9lZUJnRUVSeC80QUF1cWRwUGJZY1hpRm5YYmpobmwwd2RBMFBGZ045YkVx?=
 =?utf-8?B?YVRxeGxoQzlkcEF1dVpFRk1aWUlZUFZxeVZxeTNSK0ZETHRsZXI2RStlcTlo?=
 =?utf-8?B?WitXcUNiZUtETFlHai9sdlRrWWJpQWFDaldrZm5Ua0RxcTNQeWdNNHh3VVhD?=
 =?utf-8?B?Nm16ZEwrdnRtdlZXaGtOanJMS0FzdUc4QVFoZ2tVeGR6eHBYdUE0bGhMQkY3?=
 =?utf-8?B?VzB3T3cxT2E5L0xzRy9lWkR6UEpwaWZ5VFhQYWRIVGhUNEtHU0V2bXNncWg4?=
 =?utf-8?B?K24vQUJ2U3c2UUdtOEsvTmdRV1RYNTJPbHVQSGgrSk8zV0dBbDhzdHNZLzdO?=
 =?utf-8?B?ZlNBWlFWOURSM1pubjM2V2F5YmUxbGo2KzcwS2hxMktyVkNzWHpzK2JWWEsw?=
 =?utf-8?B?em1QQ3IwTjFGNld1aEJKeDZKSkFnVUVTNWpFNkdyV09uYlRTT1MxNHdQNmR6?=
 =?utf-8?B?eHV0QXhuOStTVldXL1RnRHdKT1M4T1JETXo1b3NpOGZUMTh2ZHBQejN6dk5q?=
 =?utf-8?B?R1hQTy9zV3MvZEFQVDlWeW01amZJa0p5N3hFOVhQVElyZFZPcnQvdTgzOUda?=
 =?utf-8?B?bDZqYVc4Z3NZMmU4dlJEVk04ZGF2Z3dqT1l4V3lNckN1RU96K2VIYkFsZFdG?=
 =?utf-8?B?VFJrV3lERDBUV2huVFp5VWFxdkZPT2ZBQXkzRUVPbm9kRXkvdWRZaWRSU1Bi?=
 =?utf-8?B?OHYrNXlqUCtjY2RESmZ4SWZqcnpCSTYyZktxMkllbWlGYTN4VmkzWlV0bGJN?=
 =?utf-8?B?RUljeUdKd0Q4WW14UFh5N2ZLL0h4ZGZOQ1RRRGVOcUZJY3k5V09EMDF0ZXFE?=
 =?utf-8?B?czVuTzk5THNzYWdRTkt5MGF4WEd0NXMvQmVMVEhGaVQ4VExPNzB5SWI0c3B1?=
 =?utf-8?B?OWUrS28wMU5nMytrUDBpeDdaZHk2bC9seUwzWDNZekozVHRGbWhPa0FwMktS?=
 =?utf-8?B?STRKOUJhYVJiVDMzMVA1Z3labFhlUzlnYlhqTWV0UitiN0loVVFDUjhjcTBq?=
 =?utf-8?B?eDFSUW50M3R5VS96TUxjbEVacDQ0ajdCanRsT1NxNnpabytOM0x4Rk5oOHNG?=
 =?utf-8?B?bGFZdXI1azdkYjFJK1Jja0FMTE1MSXgxeURBNDRSdEY4VlEvQmZtMlA4ZmhV?=
 =?utf-8?B?Q1BjZFoyc3V5elBlSkhMeDNXOEsya3hSREh5QWdJRjNLMWluRDNWdkYvWU9U?=
 =?utf-8?B?MUU3UTk2NmhoanJZaEIybFlBQ0tXVFdYclM3NERCQmdBaWZTaEx3b2cybFIw?=
 =?utf-8?Q?sp99Ct3onbhuQcJIf6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffec90f-1c1d-4c39-c175-08de4f8bd47e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 14:31:51.8901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+/ujolwwehj3nZn4MeeT85oOUZfjiywUjKxltsPVeHII4yVUVCHgL8LgpT/H+Yv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4165
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

On 1/9/26 15:06, Tvrtko Ursulin wrote:
> \
> On 07/01/2026 14:11, Philipp Stanner wrote:
>> Happy 2026, Tvrtko!
>>
>>
>> On Wed, 2026-01-07 at 13:44 +0000, Tvrtko Ursulin wrote:
>>> drm_sched_entity_is_idle() is called when flushing the entity before
>>> destroying it and currently decides on the idle status based either on
>>> number of jobs in its queue being zero, or whether the entity is not part
>>> of any run-queue.
>>>
>>> If entity is not part of a run-queue it is implied it can have no jobs in
>>> its queue, from which it follows it is redundant to look at the both and
>>> we can simplify to only look at the queue.
>>>
>>> The list_empty() check was added in
>>> a875f58e237a ("drm/scheduler: stop setting rq to NULL")
>>> where it replaced the entity->rq check which was added in
>>> 741f01e636b7 ("drm/scheduler: Avoid using wait_event_killable for dying process (V4)").
>>>
>>> Since for the submit race involving exiting entities, explicit handling
>>> via entity->stopped was added soon after in
>>> 62347a33001c ("drm/scheduler: Add stopped flag to drm_sched_entity")
>>> it indeed looks we are safe to remove the list_empty() check.
>>>
>>> This mean we can remove the memory barrier as well and fewer memory
>>> barriers the better.
>>
>> I am not convinced that this change is worth it.
>>
>> Not to long ago we discussed that the spsc_queue should be removed and
>> replaced by some sort of list, with proper locks. Christian has agreed
>> that this should fly.
>>
>> The spsc queue has only 1 user in the kernel and it's super hard to
>> understand how it's supposed to work and when any why barriers and
>> READ_ONCE's are necessary (that's, of course, also not documented in
>> the queue).
>>
>> Until that is done I don't really want to touch any of those memory
>> barriers..
> 
> (I had a branch with spsc gone more than a year ago but I abandoned it for now since it contained some other too ambitious changes. So no complaints from me. Who is doing it BTW?)
> 
> Back to the point - this patch can wait, no problem. To explain the context though.
> 
> I wanted to get rid of looking at the list_empty here because I have a branch which improves the flow for the 1:1 sched:entity drivers.
> 
> Why are the two related? If you remember in the fair scheduler series all the run-queue stuff is nicely grouped in sched_rq.c and encapsulated in the rq API, which made it possible to follow up with virtualizing the rq operations.
> 
> The yet another relevant thing is the patch I sent this week which removes the special case where entity can be initialized with no schedulers.

If my memory not completely fails me the patch to reject initializing entities with no scheduler is actually a pre requisite of this patch here.

The list_empty() is most likely only there because we had entities initialized without a scheduler.

> 
> If we combined all these three pre-requisites, my branch allows the fully invariant sched:entity and 1:1:1 sched:rq:entity. Run-queue vfuncs for the 1:1 drivers become mostly no-ops (remove and pop entity are not needed at all, while add just checks for entity->stopped). So all the list and tree management needed by M:N drivers simply does not happen.

That sounds sane to me, but I would do one step at a time.

Regards,
Christian.

> 
> In that branch 1:1 entities do not take part in the rq->entities_list so, going back to this patch, the list_empty check will be in the way.
> 
> Anyway, just for context, I will park this cleanup for now but you can mull it over whether the bigger picture sounds interesting to you.
> 
> Regards,
> 
> Tvrtko
> 
>>>
>>> While at it, we add READ_ONCE annotation on the entity->stopped check to
>>> mark the unlocked read.
>>
>> This would effectively legalize the lockless access. But it is illegal
>> and undefined behavior. See drm_sched_fini().
>>
>> P.
>>
>>
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c | 10 ++--------
>>>   1 file changed, 2 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index bb7e5fc47f99..2ed84504cfd6 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -137,14 +137,8 @@ EXPORT_SYMBOL(drm_sched_entity_modify_sched);
>>>     static bool drm_sched_entity_is_idle(struct drm_sched_entity *entity)
>>>   {
>>> -    rmb(); /* for list_empty to work without lock */
>>> -
>>> -    if (list_empty(&entity->list) ||
>>> -        spsc_queue_count(&entity->job_queue) == 0 ||
>>> -        entity->stopped)
>>> -        return true;
>>> -
>>> -    return false;
>>> +    return spsc_queue_count(&entity->job_queue) == 0 ||
>>> +           READ_ONCE(entity->stopped);
>>>   }
>>>     /**
>>
> 

