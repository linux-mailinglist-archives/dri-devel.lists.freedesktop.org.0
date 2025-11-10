Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A36CC47727
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 16:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309E610E3EA;
	Mon, 10 Nov 2025 15:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SyaI/WiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012048.outbound.protection.outlook.com [40.107.209.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F327010E3EA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 15:14:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/xFHQZ8IKJUNWrSMJ3Kkk8LS14jS8fVMQG3t6M17gE4D676pd3GvZV6MKGUNhzoun07GQDo3ZZ+OwgzQ19Sbw4HZFHja8FUmijCVNZIyvJ4J5K+xFkpNpJJiofGZh/konhpU+5qVs6g8djwcEGRseiNPCkzuBnw0L65PbdpD/AEW433QCDprFxON5vRvesa3FvGRetj8D/0hOYkNZd7IybuBRuNl+PBxSjkprt5xH3daqBStGGQMVCPKDJsPZ1oURf79CHFy/w6U9LQSbR/0ip2LUZU7mw+SqaV89raKhO/4SMkvkpP7aOj8ueeA5lZ8H49GKHrjoflbppGh+Jkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEecxwXvDIa6KB3hy15esZIRlpcAWWkRpYJ4viarbNQ=;
 b=iTQfrUD5xJrRR6i2s3kjK1gMJ6STkE6HZSa9qs1qFCIqrU0InqMP9MVZX9jODZc3UjoGiDaq8Gdp+aOaHMBW3FLDMMihB5LLp9H/1FbLKF1AuGoSqGRmQvDGXxpO0g9JVuLS+2PLKTLCiusfxacN9JXcX3/j/T6vhxjJGT44x1rtPtS4OFJUwFFxd3q424FrflFoVlnQg4OCP0EKTPu1zNed24oOs2y8HEA/sc7cR9jFdkhQIPoDJbi3Ar6LoDAhSWTIC4eHLc+CYQw6txlGTwf9GfvXcXo9uWqB0EsglqmxSOjJO9+84t++Mkkf1OvWyrDU4Cmz/JeOeVfMLfSelQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEecxwXvDIa6KB3hy15esZIRlpcAWWkRpYJ4viarbNQ=;
 b=SyaI/WiPg0zYrr+OPwnt8X1tUQWcTZHTWPhD9Jllwbq1yq9Cky/7IQuWl8PktSr0O+22mI/3MTJOZXdkMaNMUX0X21RH/eWGW+O3XqwygHMsjzbyS5vqtwvJjVLUvOo/3kxZL0t8h7S7nTfmfrlsbisJ0utqpiBoMPwLmlWvZx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8854.namprd12.prod.outlook.com (2603:10b6:930:b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 15:14:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 15:14:10 +0000
Message-ID: <05603d39-0aeb-493e-a1ed-8051a99dfc41@amd.com>
Date: Mon, 10 Nov 2025 16:14:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix UB in spsc_queue
To: phasta@kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, dakr@kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251110081903.11539-2-phasta@kernel.org>
 <ee63ca7d-77d2-44d8-973b-7276f8c4d4a5@amd.com>
 <ee9fe54f3764bc0ee4ebafe5c10ad4afe748ef19.camel@mailbox.org>
 <2c72eb6e-7792-4212-b06f-5300bc9a42f9@amd.com>
 <987527ead1fe93877139a9ee8b6d2ee55eefa1ee.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <987527ead1fe93877139a9ee8b6d2ee55eefa1ee.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: e7bd7059-f61e-44a1-3989-08de206bcc95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?am5FUVVsdFdqN1IxeFpMV0dsdDV2cHEvcmlWOEZBS3JxLzdKVkpqcW9JQ1dv?=
 =?utf-8?B?Q1FKeDFDYlZLakszdmVlbUNtL3M2eGRUWVRMOXV6aFlIYVhWejR0TGRPWDh6?=
 =?utf-8?B?ZHNEM3hXeVhpd1Y4TVI5MUtNR1g4UThYS2owaW84eFJ2RUcyRFdCa1pEdTBR?=
 =?utf-8?B?Yk5zZEVHSFRxdG5Xc2NvaUhvUWJsTmNzT0M1dCtwTVZ0MWp0b3pVcjVCT2FC?=
 =?utf-8?B?UTkyVFhjeGdtcGgxRURzUzJzTE5ac3ZGYVIzWXN1TFl1TE11VG5RSzRCcWxO?=
 =?utf-8?B?YVNTZFRaTitWczhGTy9JVWxQSlFIdkhiT25aM3JZdTdxY1RWRU9rSnZMYkJi?=
 =?utf-8?B?cmhnd2dWOVBzR0wxWkE0RWZSZTEzeFI5T01EUElDM2JnWWt4OXRXcjBSdEp5?=
 =?utf-8?B?Q3p1WEg3OTE4K3NCdkdjOTN0WEdtcXlHbUtIOFdyZjErMm4rNTYzV2NIa2pV?=
 =?utf-8?B?SXVNakUzYTNnd2I4akhnM0lZUUJVSWZEb3c5WjAyQzJMbEVac2VpS1RZUFVn?=
 =?utf-8?B?aG5UZHA0NGVicWZJSGlIdWl4d3pTckJoV1YreVFPd2FSTFc4VnJvSEtqa0ZM?=
 =?utf-8?B?OVcwTkEraGs0bWdKZ3JmaW1GY002WTZPV0dEODJ1WXU0aS9RaUYwSVVSOUpB?=
 =?utf-8?B?bmUwcSsrWUpGRDNkVFZIRTFkcXkwbDQxWTB6SGVFdWM1MzEwZU1OM29NV1BQ?=
 =?utf-8?B?OWhIZmZpRitEREdXcDQza21QK0JDWWhhWGpKLzFsRnZBdCtTZWIxZmg5MnZt?=
 =?utf-8?B?UlFYSi9UWjhaTlgxQ2VVMnRhZklRbVZJcDl2cGdvdmRZVlZSQmpsREFyTENt?=
 =?utf-8?B?VVhJbVBuYnNrM1A2UkhYZlBNV0RPQ3RTM1lWN2s2bzNYWGNsZjRsNi9yaWR2?=
 =?utf-8?B?YVl6bDY0YTRhTmgySmhHaDZFK3l2ZS9HWnF3RFN3Q3NHenE2dG1CbEg2YmNo?=
 =?utf-8?B?T2oxSUh4dEFIVmdPbWFlS1dJQ2hValdkcktjSUNPdmdkVWtQbWUzNEk3akRN?=
 =?utf-8?B?ZENGSzBDRTdESUdXTHRZUkdsaGNSUllobWRqbytNdkMzNnl1N2xlb1ZOOGM4?=
 =?utf-8?B?VXVnMURSUVFPaThPdTh2N3pjc1hPOHo4c1dZbTBZMkE3aDFlWW1JRkNNUGFF?=
 =?utf-8?B?T2NNN0ZKWmJTakVCUnpTb0R3WkR1WTdCdFRsd2N5aUFibDk0STlOVU5DR2Vr?=
 =?utf-8?B?dEcreVlEMlJ0MWpKQUZhTExHbE8vbnI1ZGtvam83OUQ0bFJVbXFWMWJBSW92?=
 =?utf-8?B?L2Q4Y25ST00wUnVhUDRaZ04rK0wvY3BEL3R0WFhhUkM3eTd2dEZybnpLMkI4?=
 =?utf-8?B?b0dvVitrSFQyUzAzMmgybEdlSi8vK0FEczBpbFlGbjZvN08rSlBlOXRwdFV4?=
 =?utf-8?B?dHcrb1Y4TEwxcjVzVlpmVFJyNnl5SHQ5ZUdFMjNHU2RKcWRQOHFmRTlNQk5y?=
 =?utf-8?B?aU5UNVladzFFbXNiWDhmdm5aSnNpN1p1aHVSWEd6Uk5ia2VJZDZYTGorZmV2?=
 =?utf-8?B?T1RxK0NSWTRlTUJNeFV3V3hHblBMbGxQMGhDOTZnM0FIT29oWDBvbGZJZitC?=
 =?utf-8?B?aTJqK0wzVkc5ZmE1VkFBbmlHREk3ZWREMjFZSDhUWDJQQUpTMDZodThFazJI?=
 =?utf-8?B?RHY4ZTFWc1NvRENuSXliOGlId3AyMGFFOUJiNEhxTWtHUXZkeEhrcy96SHp0?=
 =?utf-8?B?ckxURTR6Wm5YMFZ6TkdtK0h2Q0x0NDIvL05TOEFLbjB5NEl0WFFJNTJvYUZE?=
 =?utf-8?B?TnVXNWN2ZWJNRXJlQ01UZlgrMGZ1T2xxRFNJcGw3MDlxVHlpWHNyV0pQYjJG?=
 =?utf-8?B?UFlEVkNCWU4wSkVVOWt6LzJUY3dIZlpFN2E2VWN5VDduYTRwbzFhbnBHdkVi?=
 =?utf-8?B?R21vbFRSbmE5YUxaNHhOTmxxdmNiNll6dWlkU1ZmMFMxMlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzJ1RHFESXRobFFTWUp4SUpwUkMrVGJERWVVOC9Mc0xQL2t6VXBUNjc5MWg2?=
 =?utf-8?B?cUczZTdnMVRTMGVKZFkvNTZDMGF0VGtObHlYVUJuR0NteURCbWNKcjRvWXVr?=
 =?utf-8?B?ZklvMXFRWWNKNjZ0WENRWjRYLzIvSHRNZWcrVWNBcUNkbXNjMEVvM1grSncy?=
 =?utf-8?B?eldzcDZnUWRiVjY5cTdLSG5vakFCMUtkTkIyRWR3ZVczU3NiaWtoWjQ3Nmhn?=
 =?utf-8?B?aEllM2NnUzU4T3pEV3owYlFxUnZ2MTdrdEsrMHRPRnhkQmlYWFBVd2pxS21o?=
 =?utf-8?B?cHNTT2ZPTk84ZWQ3WlpwZnpJZTVFVmlsaCtIa1JEZmFuc3M4UFBDVTdZSGtx?=
 =?utf-8?B?VXJSTHNuTDl3MjZVbTZ1ekhVSGhoNHpYUTd3eE1ITmIxZEhTQWZhVHVteTlw?=
 =?utf-8?B?dEx6UmlNa2o0U0dMcGhqRHg2NVR2T1Rzc2piTFE5OW5NOU51WWlsK2VsOU5M?=
 =?utf-8?B?aW01SHBvRHovOVpOYjRPRGRaSTlrUjNaSWU1a3NDczhUeUo2a3NCOHM3bnQ1?=
 =?utf-8?B?UkZJakFFRk1talhla0ppelA0WmZRclZRRGxkTnhVMXZFVlBLV3dRMW9ubDUr?=
 =?utf-8?B?NlQzeFpNM2NhVHQ0ZmhlUXpXTEI5LytqbHVzazBGUFlGVld6QVc0L2h5RG14?=
 =?utf-8?B?TUtPTElWR3I4Mlh3azJReFdGK3lQa0RaR01ncW90azdlbUZidW1kbktFSkt0?=
 =?utf-8?B?TG40NHdOV0lyejEwQTZRbTZ1UjlCN1hueWNTWnBHY1o0Tkcwb0tIMUpVSHNY?=
 =?utf-8?B?TktvN0w4V2hxUHBrVlBhUmsvclo5bWsyNXBUbVF2VmtyaUdqNkdaMzREaVdi?=
 =?utf-8?B?VjNtWXVpb0d0QVlKR0xTRTloVWlsUVVSR2ZUNk5aaWF1dFJJclR2QXZkaElY?=
 =?utf-8?B?ZFNwNmxqbC9rUGZzOWwzY1VNcFpFbXRFOWRlR3JsR3MzS0ZLSm1HclI3NmVX?=
 =?utf-8?B?em5QTjcwR09GNXJOUW1NNWdxcUpnZWhXODArOTZBeVp0d2N2ZktTM1NDV2Q5?=
 =?utf-8?B?SDh1Z3NGSmQ3RXVDUjU2YTdxWGZ5QkpJd1FKanVXVmRXOXJqN25wRGpIYWU4?=
 =?utf-8?B?ajhaSHlTWG5jOU44YkFyTlhGcnN1c2FEa1NHVjJzNEtMU3NwM1FqTUpiUDha?=
 =?utf-8?B?RmlQZUo3ZGZJcVFNVWdMKzRpUlBtdmY3TGV1c3QzaDhMM2h3eWFPUHY1T2pw?=
 =?utf-8?B?UjNXSDZkenBrQU1mNDE1b2EwTDgyTmtpSmtnbXN5VzZ6TlFGdDZSOXRnVGE1?=
 =?utf-8?B?bkl2N0FZeHI3QTBqK0Z1REZZbVZ5SUQ3bXpha3hSOG5oVkFGL1c0WXhxSnFu?=
 =?utf-8?B?MVZxQkpaMVNzRE1pV1Fjb2t2OHlUa2hsSkROejdLZkRuQjhmSnBSaFJBcU83?=
 =?utf-8?B?RWJDOVBoUm1FK1FDR0paVDV6RlRCTzdCdkxHU2lUbmJKK1dsUVNaMUNPeklM?=
 =?utf-8?B?VUZIdzJJSW15TDZnMjJDbnFVYU9SZERvSmxEbFRiMmFBNWdBc1I0MmxuZldG?=
 =?utf-8?B?MUFyK01HdStZcXRORmJLUXpjc3ozMkF5cmtSbWFaeTZ0NHFxNGFnY2VJaUgy?=
 =?utf-8?B?S2RjQ2RIcTdsNG5XNElFS3J3MERyV2FVeTd0TmNwSzFiR3FJNElXTFQzYjlu?=
 =?utf-8?B?YzhiZktHODN3a1pjQlptWnQ5bHJ0UG1VNkZlbEpNbndUN09pR3pTcWg5MVoz?=
 =?utf-8?B?SUM1Vmxzc3RBYUtsZUxWZ2VCSHdEaFhHZXlDV1lYcVVPZzYvdzJ6bHJ6M29D?=
 =?utf-8?B?ZWdQSTZ0VmdjcWlRNFNZTzZjU1NGMG1Ub3FlSXBHZlV2THdGWUNtYWdnZGN5?=
 =?utf-8?B?THpuZVVxWkZaTnVXVmt0Zzgxb0x0bWdYNDBXcVIxc3dKbEdGbWdWeG5HK2Zt?=
 =?utf-8?B?a3ZFUFdNUk5wL0h1UlA2dkZwdWc0eXBUclBuVS8yU3RFSTlaMVFsUml1UVlZ?=
 =?utf-8?B?akc5dkV4MnVPUlM1RWNrbDVFTExOYUk1RU5GMk9kaUhHeGp5blJ2b09BQVBj?=
 =?utf-8?B?SGZxVmxMei9KSVhPbm1oZ3JTWUs1SGtSNWhIeWs0SHNrWWFpck1nSGxZRUxD?=
 =?utf-8?B?VlZxZFhXMVJLNzhWU1Rnelc5aE1wdUpCRW5JbEVrWVBHMlRDUktrVU5Xb001?=
 =?utf-8?Q?3P2/Q0XpFNWF9vvqkiOc2jE+c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7bd7059-f61e-44a1-3989-08de206bcc95
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 15:14:10.3020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDuRRXoXIpFb+CtxvXOYF1FM4QKq84jgfsWPStsX+sw3/uGiXHMdvHwqJDMPZ/Rb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8854
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

On 11/10/25 15:20, Philipp Stanner wrote:
> On Mon, 2025-11-10 at 15:07 +0100, Christian König wrote:
>> On 11/10/25 13:27, Philipp Stanner wrote:
>>> Please don't top-post :(
>>> FDFY:
>>>
>>>
>>>> On 11/10/25 09:19, Philipp Stanner wrote:
>>>>> The spsc_queue is an unlocked, highly asynchronous piece of
>>>>> infrastructure. Its inline function spsc_queue_peek() obtains the head
>>>>> entry of the queue.
>>>>>
>>>>> This access is performed without READ_ONCE() and is, therefore,
>>>>> undefined behavior. In order to prevent the compiler from ever
>>>>> reordering that access, or even optimizing it away, a READ_ONCE() is
>>>>> strictly necessary. This is easily proven by the fact that
>>>>> spsc_queue_pop() uses this very pattern to access the head.
>>>>>
>>>>> Add READ_ONCE() to spsc_queue_peek().
>>>>>
>>>>> Cc: stable@vger.kernel.org # v4.16+
>>>>> Fixes: 27105db6c63a ("drm/amdgpu: Add SPSC queue to scheduler.")
>>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>>
>>>>
> 
> […]
> 
>>>> Are illegal since you don't have the correct memory barriers any more.
>>>
>>> I can't follow. Are you saying that spsc_queue_peek() is correct
>>> because you know for sure that when it's used no one else might be
>>> changing that pointer?
>>
>> Correct, yes. That's the whole idea. I mean SPSC stands for single producer single consumer.
>>
> 
> I know that it means that (although it's not documented and, funnily
> enough, I one day realized the meaning while standing under the shower
> after work).
> 
> Anyways, it's not documented that a user must not call
> drm_sched_entity_push_job() in parallel. It currently basically just
> works by the coincidence of no one doing that or rather no one running
> into the race.

Yeah, completely agree.

> 
>>>
>>> Even if that were true this design is highly fragile.
>>>
>>>>
>>>> Took me an eternity to understand that as well, so bear with me that I didn't previously explained that.
>>>
>>> s/explain/document :)
>>>
>>> As discussed few weeks ago with Sima and Tvrtko, what we really need to
>>> move to in all of DRM is this development pattern:
>>>
>>>    1. For parallel code, at first by default use a boring, horribly
>>>       slow (sarcasm) spinlock. BTW I'm not even convinced that a
>>>       spinlock is slower than lockless tricks. Paul's book states that
>>>       a CAS atomic instruction takes about 60 cycles, and taking a lock
>>>       takes 100.
>>
>> The problem isn't the burned CPU cycles, but rather the cache lines moved between CPUs.
> 
> Which cache lines? The spinlock's?
> 
> The queue data needs to move from one CPU to the other in either case.
> It's the same data that is being moved with spinlock protection.
> 
> A spinlock doesn't lead to more cache line moves as long as there's
> still just a single consumer / producer.

Looking at a couple of examples:

1. spinlock + double linked list (which is what the scheduler used initially).

   You have to touch 3-4 different cache lines, the lock, the previous, the current and the next element (next and prev are usually the same with the lock).

2. kfifo (attempt #2):

   3 cache lines, one for the array, one for the rptr/wptr and one for the element.
   Plus the problem that you need to come up with some upper bound for it.

3. spsc (attempt #3)

   2-3 cache lines, one for the queue (head/tail), one for the element and one for the previous element (but it is quite likely that this is pre-fetched).

Saying this I just realized we could potentially trivially replace the spsc with an single linked list+pointer to the end+spinlock and have the same efficiency. We don't need all the lockless stuff for that at all.

>>
>> Keep in mind that you can rather do a fused multiple add for a full 4x4 matrix before you take a single cache line miss.
>>
>>>    2. If you want to do parallelism without locks, you need to justify
>>>       it really well. "rmb() so list_empty() works without a lock"
>>>       doesn't qualify, but real use case speedups.
>>>    3. If you write lockless infrastructure, you need to document it
>>>       really well. In particular you need to state:
>>>          1. How it works
>>>          2. What the rules are
>>>
>>> See llist.h as an example. It clearly states when you need a lock and
>>> when you don't.
>>
>> The llist.h is actually pretty similar to the SPSC. I'm wondering why they don't have the same issues? E.g. is xchg() providing the memory barriers?
> 
> I think that some atomic instructions contain barriers. But I'd have to
> check.
> 
>>
>>
>>> Or RCU. No one could use it without such good
>>> documentation.
>>>
>>> I have no idea whether spsc_queue is correctly implemented (I doubt
>>> it), and if even a highly experienced dev like you takes "an eternity"
>>> (quote) to understand it, one is really tempted to dream of spinlock_t,
>>> which has very clear semantics and is easily understood even by
>>> beginners.
>>>
>>>>
>>>> Question is what should we do?
>>>
>>> Easy!
>>>
>>> Mid-term, we should replace spsc_queue with a boring, locked, super-
>>> slow linked list ^_^
>>
>> That's what the scheduler started with and the reason why that linked list was replaced with first a KFIFO and than the SPSC was because of lacking performance.
> 
> Such performance measurements must be included in the commit message,
> since they justify the entire commit.
> 
> Yet this is the entire justification given:
> 
> commit 27105db6c63a571b91d01e749d026105a1e63bcf
> Author: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
> Date:   Thu Oct 12 16:41:39 2017 -0400
> 
>     drm/amdgpu: Add SPSC queue to scheduler.
>     
>     It is intended to sabstitute the bounded fifo we are currently
>     using.
>     
>     Signed-off-by: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
>     Reviewed-by: Christian König <christian.koenig@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> 
> 
>>
>> We could go back to the KFIFO design again, but a (double?) linked list is clearly going to show the same performance problems which originally triggered moving away from it.
>>
>>>
>>> The spsc_queue was designed and – perhaps – perf-measured when RR was
>>> the only scheduling policy.
>>>
>>> Since the FIFO rework, where FIFO became the default policy, we now
>>> access our super efficient super fast lockless queue most of the time
>>> with the spinlock being taken immediately afterwards anyways. So we
>>> almost have a locked lockless queue now.
>>>
>>> https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/scheduler/sched_entity.c#L502
>>
>> That is not that relevant.
> 
> If the lock being there is not relevant, then why can't we just take it
> and get rid off all those barriers and READ_ONCE's once and for all?

I think so, yes.

>>
>>> Only push_job() often (?) still runs locklessly, but I'm not at all
>>> convinced that this is worth it. Not even performance-wise.
>>
>> That is what is relevant. And yes the difference was totally measurable, that's why this was originally implemented.
>>
>>>
>>> If you look at spsc_queue_push() you see that it
>>>    1. disables preemption,
>>>    2. uses atomic instructions and
>>>    3. has a ton of memory barries
>>>
>>> – in other words, this is almost literally a manual re-implementation
>>> of a spinlock, just without mutual exclusion…
>>
>> The problem is really to separate the push from the pop side so that as few cache lines as possible are transferred from one CPU to another. 
> 
> With a doubly linked list you can attach at the front and pull from the
> tail. How is that transferring many cache lines?

See above.

We have some tests for old and trivial use cases (e.g. GLmark2) which on todays standards pretty much only depend on how fast you can push things to the HW.

We could just extend the scheduler test cases to see how many submissions per second we can pump through a dummy implementation where both producer and consumer are nailed to separate CPUs.

Regards,
Christian.

> 
> 
> P.

