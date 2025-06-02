Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9216ACAD8E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 13:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCBA10E508;
	Mon,  2 Jun 2025 11:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KUxeQzvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED77C10E1E3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 11:51:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vfv9QDlqwP6yr0Cy+Y+oS7fWkmr7qrluy9okXQwV3IkGSG27MGalogWHqWRwooEXPqPALuxMAD76HsrB+yu0w55RTB5AHJk6hS8toQ9koQ/sFQCxd/O+Qye7JvFdNDclCAu02nE5cPfD8DYM0JPJURXUgDKNf4vC0H8HPGTCcUKQiRYut80QIrUxDCuc/Gr+ElFTazQ0p40UkjN/UxRrwMiW5Cw9h+UQkL612wLTUPTG8XEpXq3ZhLyqcwgN/k4HFwwgD4+pL8OoMhjj8zBLnDyN21AFTkCWLllmX1enzNIY8zDuMeSwz8h3IA7lyU1LCzYXc/48y9aILbglHilsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Njp84fIAP5z+O7wY+ogdn3De4dXUz7+2FWyGngYiYQQ=;
 b=fzs5yqXY1cBjr4vQmhwZsHRWhN6AGyyVdjlO3g3n5Fe4WjHCorwPJQJBfa420tQzwwxjdR19Yucb3861jlH8gpD+/d/PUyNve0suigm0FRRItuwpGUWtCpVV6UNZ7wM4q15Y8WV7F9Wf7wqvGSshel5VLxqHWuqbfnHK/IRbkWYADmw2jEuB9aXG6fNlYtbwuP5Di+WosCc+g5HtXzhYft6nY4EslnH3J/CcroG0p53XIuiUtqJZsru3jP0YILS4kVZljg7WRn+xd/hDyWgYCGCnYt31CKl5fgva0sk51Hp/2eUFTzg3TiolMH4SrgrQLmIEE6OdBulSuY091mBUPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njp84fIAP5z+O7wY+ogdn3De4dXUz7+2FWyGngYiYQQ=;
 b=KUxeQzvXNvz9maHJzVpiSn/EOAhVPy5MGs4G5NuJsTbHQfq6y7WSyLVrX/M6vqDbTtcQz+/nM/RzV13uV9uwRxU7qrnXTVphV6BVABxUYKJgHSoGHUI+mYi9uG+VTHkdIghyrDiTFY7SwvAhRG1nP5+tMCSvHgqs2/H7ZdE1kTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB9102.namprd12.prod.outlook.com (2603:10b6:510:2f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 11:51:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 2 Jun 2025
 11:51:24 +0000
Message-ID: <c2571f57-3be4-4f8a-b442-b8f01dc5979f@amd.com>
Date: Mon, 2 Jun 2025 13:51:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: ttm vs aarch64 mappings
To: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Will Deacon <will@kernel.org>
References: <CAPM=9tx++LWvKMfS556+CDcw-bWxf6vD6JtiwpAjspuc7Qeh_A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9tx++LWvKMfS556+CDcw-bWxf6vD6JtiwpAjspuc7Qeh_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0371.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c93e3f7-c322-43b2-81c0-08dda1cbccbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ti9hQ3kxT2V3eGtoeUxGLzZtejJKNW1tTUhqRVloQURUaGFoa1poZEtGbjBa?=
 =?utf-8?B?aGdReXVyczdhVlNKQ0x6cWNkWGJNOUFkd0w2WFN5emtZOFJGbnR1aFBFUWFz?=
 =?utf-8?B?aStWN0c5ME4yZVlLYnNwblRtc29jeUhmTWRmVS9EbmhwZ1RRcGdUVjhYUGVq?=
 =?utf-8?B?aWVrTDZUQzlyaDR3OGdpN2tOM1NVMnR2TGNyRnZwSXh6djlzZHlpZituSU9n?=
 =?utf-8?B?UE12bWgyeHlJQVI1NkxjazZ4cWlCbGZYRjVRYkxqWnVzU1k2dkRSYnFOME8z?=
 =?utf-8?B?Wm5BcGNDTkhERXVyK1hSRG9pZDY5Nlg0YzRLTGZST3YyZVBrS1pVUk1QVGpR?=
 =?utf-8?B?cFRoemU0OEorOE9JRExjNFg1TFYyT2FIYlVkVm5sUTA2d1B3VE5ST0dWSVY0?=
 =?utf-8?B?MmtBK0FGbDRINnRUWDZ1ZGVoTS92S2YzZnpPQjVta2hOQURTVUt3WTJBZFJu?=
 =?utf-8?B?elVmeU0reXN1YXM1RkdLUTYrb1YxTCtpR0E1dFptenFUd3ZoOHBkYWphMGVG?=
 =?utf-8?B?Tmc2aVlXbWpCSWRVTlUxUTBCeS95SE1TQ3NNdS9HSk5rcXR0VjJoWTdEd1Vi?=
 =?utf-8?B?KzFqZEU1UER5U1dLVnNaeVBCMHVOQlpSV1ErYXJvR3pXRDdaUGdFUGYyNFpR?=
 =?utf-8?B?SHdaOG9LTnpMZjB5ZXptOWRCd056L0FLRnYvNDZIS3V1YWFpcUdZNTcxcnpk?=
 =?utf-8?B?emFVUUdneFA5eUd1VW12TjhXNE1aNWk4bXNQdE5pWnBLOTI2TDZIMGhmdkxJ?=
 =?utf-8?B?d1RLdjdOdERDRmtCUW5mQXYrZTZFQStFa2hobG9pQTZ3OU5wVW9hUmlUdVFR?=
 =?utf-8?B?MStJQVlrMjhONUdrcTlLM3ptMVhTZ0RXL1VZVmJhWFRIUlRPdVJyT1U3L0FI?=
 =?utf-8?B?K0ZuUVJ4M1hQMWQrQTlxRjBCd292emZTWDBxTXErY0tmc3RZazFlVXVtTEVT?=
 =?utf-8?B?SXZmVHBHVkZKdHJOUjB4Nk93N3dRZ1UzY0pYaGVjbWYwTmpxQnZ2V3BQTkhq?=
 =?utf-8?B?SzF6bzRoZmo0TGtGUVFWTDlLU2lqcjVnZTJpWXR5Y2JuaU9rUEhaZ0RKS0tI?=
 =?utf-8?B?UVVHSGcwUWROQXJZMEhOMWppci9BZ3pMem5iclZwb2M5K0hxQzNPTlY5K21h?=
 =?utf-8?B?ZURzU0hwN0FmZWxwOG5LRmNuK3dUUW5ROHc3bmYzaHVmYXcrSzBlTDhsUkxS?=
 =?utf-8?B?Q2Zkd0V4c21Ub0lKc25MOTdudzZKSzhEQ2FZMzhGSUNrZjR4ZFlqdnFWZ0k3?=
 =?utf-8?B?VE50dmlkL0tObE1DdFVpRnNRVFEvQW9iblNiUFlacStkUkhmRHBTTFB0d0VN?=
 =?utf-8?B?TTJqa2V3YTdibW55Z1dxWWdJYjczSGxpb2NqOWx5RzdhaDcvSXE0MUlCaUNZ?=
 =?utf-8?B?cjVJZVZ4MUE0N1FjSExQQWxsOWZiMTAyZFoyQWZaTFpRRU1LQkVpM1FRRkRR?=
 =?utf-8?B?R3lJS1VNMXBnZkdKNkVia05vOHdlM0pXMnkrbStyenVZcnNHT1BBTjhaWEsv?=
 =?utf-8?B?aVV2UXNCMUhQVE5RVlFWUmdRL3dDaXZTRHRoUmNxUWY1NERTR0U1QVhnbSt5?=
 =?utf-8?B?YitOcjVQWm53T1VON285eDg4L3kvSGpzNkdwT0pRdll3UjEwTkRZdW1VNWdC?=
 =?utf-8?B?TG9mSVRaNk9KN01jbHZpemlpOVZCSXd5WURnUFJiV0lTeThnY1l1dk9qQ0VQ?=
 =?utf-8?B?dStLeTdGclBlM1FlTFZFUlBsK2VMaXRyaHNpVE5nVzFzZjV5WndVY2hxN1hz?=
 =?utf-8?B?UXBqRG1zTG9ZM3JJcTNaRnVXWm5oWmhLOVZhN3VmamkxT3BXYmFnVzdSQVNF?=
 =?utf-8?B?bllSTmZHUldnZGQvOFpJaFVUZWtLTXpTUE5TRDUyZjVvTEtWbE1GWWdaTitB?=
 =?utf-8?B?VXdjWTFTV0w2T1VibVVVeUROaW9OYW9LNFIvbWVUcUJUVGRMb2o3Q3ZJTHhI?=
 =?utf-8?Q?OWOGZu5pV+o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDdEZ1BvcGxoTk01UUVhTmdYaTB4cXpqbmhaUXFQNCttV2R5MVBva2szZGF6?=
 =?utf-8?B?MnBTQ1IyUDhCSkZWK2dBQ3VPS0pyYXFtU0hQa1ZTY2FTcG9WelZGendWWi9t?=
 =?utf-8?B?YnY2S1ZZS1RCUHJvNVNDZFVaV2t0Sm1sWUdTWTd4QU5DK3R0NjVFV3k2Z1hJ?=
 =?utf-8?B?R29vcE5FUFlWZTZIL1BER2pSUmhKdk1EZFFOQUc4MU5SdHBHN0cyYThtcWI0?=
 =?utf-8?B?Y29LTW14K244bDlqN3JDOTdOSk5UMVlmdlJjamxmbEhjblMyYkJQWmwybDNL?=
 =?utf-8?B?T1BpaXNWQnV6bG9YdUwxMjMvMWZMWkdLM2JleFB1c3RiRWkvM0l5bGhtam9x?=
 =?utf-8?B?T1lkV0VCS3pKK1ZHdFVOTkFBbWh0OUlOVG5QWXBXZHJTdGVkYkJmNExHY1Av?=
 =?utf-8?B?d2hqekhEbGlTMExjMXJrZEh4V2R4OHdFa2VmUzI1Y1ArOTVMai85dGtVcjNC?=
 =?utf-8?B?Um1HZEJxcHlzQVV3aWkxR2dQT0VEcThiMGxqOFhaQnlINzAxb3dRZEpKZklv?=
 =?utf-8?B?Si9NRTVtR1JxUlRISFB5RXpWeEhtK3VQdVBHY3JxdmdpUlFCai9GUzNuanBh?=
 =?utf-8?B?Y1QzaEZIcDdYcjdHYVlyYzNha3lyQjJGR0lRK1p6eDBONlZtWk42WTNROVV1?=
 =?utf-8?B?cTZtNUZFbWJaOW5WbVNVVGFYTGxFY3RoNHNIdnVDdDZYRmRBMmMwWTJVTVZ6?=
 =?utf-8?B?UFUzYjlRMFpYMUxKUGdQY21xWmxmZ0MzTGpadGRvbzlGd1JSaUZkbHpPdTZa?=
 =?utf-8?B?U1FpNGVleXh0dmxvek5VM0M0a3lZY0pFQ05BZ0h1bzFXZDI2cEpLaGw3WFky?=
 =?utf-8?B?T3RWUXFZYjdPc3orTGU3V1lBSFhOaGtTNDFIZ1crZlh6UVFYQVBXMjN5Qm5H?=
 =?utf-8?B?Y1dIVVdScVJKNmY0djRuTzE3aTRlMnoxVEJMaEd2WHJHQUM0blk0UklNUTI0?=
 =?utf-8?B?NTZ1NzNyeiswS0l1UWFjTkhwcUtvd1ZKZ29hVFBQWkJSSVl2MjNwd1dTVnpL?=
 =?utf-8?B?TTY5cE9qbjZ6Z1NoQlBUcHNQblorYWUxUnVSWXpnZUs1Wk15b2pRZ0p4L2pu?=
 =?utf-8?B?NFBwVmxHdXpIcWhhQ1BuSHhxZGdSMEFrSTZmZllJSS9wd2VOZnVwcXFCUUFS?=
 =?utf-8?B?SC9vNitjcVJERzN5TjBoWVF3NDZGOWNMV05BMUdDV04yS0U0TXE4bERWc3Fi?=
 =?utf-8?B?ZGp4RkNpcFY2T2JwVi9FaTQ2cUs4RVFiRnJKU1hmVjQxejFyczZocXd0c1Er?=
 =?utf-8?B?ZWpKd3J0YzFoT0wrblc5N1BIcjVKV0hEdjlQQ3U2c0dQMTI3OS94WHpIbTFF?=
 =?utf-8?B?d3drZVRYckV1STY3Si9LMGYvaGJCOEthUkNYM3B4cWNQQ2ZkUHJFUlAzdWRN?=
 =?utf-8?B?T3dOL2RvSEFibCtoR2x0ZkRWMmJrZjZYekRwcGRjeDdDSEQyQ1dqN2pkNU4r?=
 =?utf-8?B?NmhLYStNVzRlR0JlcVpYelB3TXNuY1NhN3U0bDRORUpvRkdDZFZwYXdMZGN2?=
 =?utf-8?B?cXBlUGVyY3hrK1FDRFRnaE81M3lqeFhZSFA1NWFEbkUxRkIzNDloZGk2QVZS?=
 =?utf-8?B?WEpYYm11Y055ZkIyVUNWQnc0V2dVbjg3QWl2WjBIYTlpNUhzTmZhR3ZlSmFG?=
 =?utf-8?B?em83TUxMR0p0VHVzdndYZ3gxRWxJMUUxenE3NUhWZ0VWL09HL1l2TE04YXNJ?=
 =?utf-8?B?ejRJSTJ0d1dDdDMyMmhDeVpUNHJtbGJJM3dxRUpxRXdMc2NVYTVOd3Q2cS9X?=
 =?utf-8?B?ZmZwRVE0WVZWOVViMEd3UnlYNk9qbjB6dW1aeEFxbWJBS0orUDV4eDBQeG5a?=
 =?utf-8?B?MytPZXBKSUx0d2RTdEEyS2lVUVhlTE13RjRXVUdWMVRzU0IrdC9nakNYNGNp?=
 =?utf-8?B?L1BSSUtEYU9QY29YM3FIRzhTL1RFRDUwazhwd215ZjJMTER3THE4clQ4L0I3?=
 =?utf-8?B?WDAvMzNkWjR2cHpIdlBXbkRZUU9NRDFFNmhpWGgvVHFidFVTYk52eU9zekxK?=
 =?utf-8?B?WHFybHF6NFNFU0JNeUFTSk9FZ3YxaDBQK3hsWU9oUkZzQkNURy83dmQxZWRi?=
 =?utf-8?B?Z2twZVJlNzN2bmQ2NFUycXdrSnovbmZnNTZVSnozZVpMMExhTWYvMllwSnpK?=
 =?utf-8?Q?nZ2N5JISI5/YovEozecRuufSk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c93e3f7-c322-43b2-81c0-08dda1cbccbe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 11:51:24.5089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rs2xrw9gxa6i59v4YNWEumA4eHuGeb3eV2GPTAasxurowwbPwkV2xDWWV44O7Juz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9102
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

On 6/1/25 22:50, Dave Airlie wrote:
> Hey,
> 
> I've been playing a bit with nouveau on aarch64, and I noticed ttm
> translates ttm_uncached into pgprot_noncached which uses
> MT_DEVICE_nGnRnE. This is of course a device mapping which isn't
> appropriate for memory.
> 
> For main memory we should be using pgprot_dmacoherent which translates
> to MT_NORMAL_NC,
> pgprot_writecombine also translates to MT_NORMAL_NC.
> 
> Now I'm not sure anything gets this wrong right now, (except maybe
> nouveau), but I'm wondering would adding a ttm_uncached_ram caching
> type and rename ttm_uncached to ttm_uncached_device, if that would be
> a good idea?

Let me ask the other way around: Why is nouveau still using ttm_uncached with system memory?

IIRC there are only two use cases for ttm_uncached: >15year old AGP systems which for some reason can't handle write combine and MMIO BARs.

E.g. for amdgpu the doorbells and HDP remapping are mapped with ttm_uncached these days but nothing else.

> Has anyone else come across this problem with TTM on aarch64? or
> understand if I'm missing something.

If I'm not completely mistaken both pgprot_dmacoherent and pgprot_writecombine map to MT_NORMAL_NC because there is no such thing as uncached system memory without write combining on aarch64.

I mean why would you want to do this except for getting the MMIO write ordering right? Avoiding write memory barriers?

Regards,
Christian. 

> 
> Dave.

