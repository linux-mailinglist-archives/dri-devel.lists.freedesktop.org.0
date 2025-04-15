Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A662DA8A0AB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 16:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF00510E7B6;
	Tue, 15 Apr 2025 14:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ma31VUEp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1193110E7AD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 14:07:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjfLtvMH/qp/Qwz9v1YXlr5a08GSRBB8NbFF9fVwEHVaxPbhhbXZTxY6RJ83QVBqrz8Ekh3Xtz3P53AhuiMkiD9vUbtB3gO6vRSn2wIswTue9FE4ZyVz6AeU0uaRUpuRQ/B9yp85csaq3oOEOYb+kbDD0ONg0YhLXC8Qoz0C4JUioQln99tHx0blZpwDbRr7KzgjKY2Px36PaeWH34AqBcrsMtRQawsOBJFO87r6ObA5mYtChExh3SVYDFs1jgBrzWo3BIN35WmMZ1tK5vDu/Wk/SJ4w0uAdAKUKkdHxAsbo4IYyR7hCuxKRp8h9DNVL9dljPwOVKh2MufnKgDjRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKjGhYojZ/EYDWbKsWuj/Ch+HlOAVFv99ecmpuGHkmM=;
 b=l8R6jDj/sFUHfU+svuzv8FI2JwbBZ08yerRDNUUdOPv0ESi2ITTO4xc51won3fhtkyfb7f0XusUcDQwmGW8lmfz11ZWMvQxbh9E/uNjFwHXdOny8FCuw2J0/9PZ4J176O1Ue8CeZv+x+7jLjRML6ZNgkPqyYFd3rw7hmL3/iaYMxHX9AqXPZ/s/fPt3xYUaRN/cr3CcAn6hRVkPUD3fvakyGoDY9HFKo4S/p+hgBCUfYna7xCVC830Y38m/etqWGRmAZnLQyb8WaLDivC8BpqGXgajxLI9vR2NEz0akWRFwctOKnqCEPrEWHEcnkK2RwZrtzV52WFxD646nE4NC9lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKjGhYojZ/EYDWbKsWuj/Ch+HlOAVFv99ecmpuGHkmM=;
 b=Ma31VUEpIR9EfDDduphGOXAWT9W5A1icChOgZYg/6PnzvdRAfENZRLA7Z1ee0YuODOkph5BKDvLE1xAQlEQWp3fD5ud5Nb1cyBvIUpnO7KZZSsqxIb1ur6yCRG7RWpiF575yQGjMFSDcGyw9TaavJcRaC5QvXjTV7cHp4jMITaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8071.namprd12.prod.outlook.com (2603:10b6:8:df::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.33; Tue, 15 Apr 2025 14:07:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Tue, 15 Apr 2025
 14:07:48 +0000
Message-ID: <7970c449-b355-42b8-bca6-500c1d5a7095@amd.com>
Date: Tue, 15 Apr 2025 16:07:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Internally test import_attach for imported
 objects
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250415092057.63172-1-tzimmermann@suse.de>
 <e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
 <48ab9b82-0d26-4d7c-88b0-feab9762b128@suse.de>
 <b924ffa7-99c0-42f1-9170-069e92299021@amd.com>
 <ddb93e8d-7716-47b3-b06c-0bf862d9c32b@suse.de>
 <ac0aba3d-ec77-4f6b-9ac1-f6077519f30d@amd.com>
 <704bd885-c3ae-4d14-99c3-9fce797a29cb@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <704bd885-c3ae-4d14-99c3-9fce797a29cb@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb0840f-4030-4edd-5f62-08dd7c26e6c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjlRSXh0RTdlckFXSUplVWYyWDdlLzkxQjdwVzUxSTlxcVplVWhvSmhwamc5?=
 =?utf-8?B?c1l6VVdFSnhBblJZcmE0WFhiY085Y3hwcVZlWFZEYmt2SitrV3lyQkJVWTlr?=
 =?utf-8?B?dXZDcVc1VW5vcFA2SS9KNUFrOVpNd2ppSm8wdDhLemExRktleThTSHZYd0c3?=
 =?utf-8?B?L3RJcW1lMGt5d3hLUElPTHJyTWw4cGxlanRTRDJKM09BNzA2Y2txV3RLNWcy?=
 =?utf-8?B?VjM0WGZScktZUkRIS2FqRXJKTWVadVprbjN2UDUzcUxoZnNuT3BDTVlNT2pB?=
 =?utf-8?B?eEV1elJaS0pFa2hQUTlWUURnR05YNzJLMWtoNVNjalZSTjhtR1g3YWVoZTRS?=
 =?utf-8?B?U3ZFTUo1Z2FtTEZJNm83NjJLZUcvcDByVnZoWm94c1g4MGFrM1JJcDZYTXdI?=
 =?utf-8?B?NG9yY29HVWdxVXhhMGFRU2Z4aUxxNXlZYmhxQ2cyUmxlWW1ZU0FiRzk0Z095?=
 =?utf-8?B?SW5UaTNYQkpNTThiNkZpeVNLVTRZODRwRVhLOVFaNnNnUEZsNFBoRkpyaEtW?=
 =?utf-8?B?NkRNRXR0T0ZBK2pKTGwzdnA3RzZEZnU2dEVYYjJsUER2YVNmRTZzZ084QVVE?=
 =?utf-8?B?S3FVTWhoZWhZVUFJckpIL0o2MmtUUnFlWSswZzFGMHl0Ri9RZnRRQXY1RGFR?=
 =?utf-8?B?TGE3ejYzb1pHU0pwOGIxZER2eUVvN2ZUUGRZR3BOU0NjUEN3WWhRbUtaTS8z?=
 =?utf-8?B?eVpha0w3SUZWalJSdlc2Yk85bkJPOVRpNGE0dzVTTFhYNzU0V0N2RDNZRGZS?=
 =?utf-8?B?elRBS0l2NGxDQmQrREJvNDdpeUdXRHY0cFNTaEdFVUNLV3Q2YmRvV2VoK0Np?=
 =?utf-8?B?TzM5L2tEbXVDMUxkekVPeFBOQVh2TDdxTy9iUXNHOGRDTHBGTGNGejFncnBL?=
 =?utf-8?B?cDkrcVlwUGVHUU5nOTNGc1lsTWhYcG5TMlpQT29lTGdXYlFJK3pkdEd6TWhK?=
 =?utf-8?B?dDYzT2NUQlVBTjhwTmNXL20wQjJ0N0NBUlVXRHhaUzNIM3FhQ0w4WjU2Vjh3?=
 =?utf-8?B?UkVLdjZxbXBFRWNJNC9JazNHaW45dEJJcnFQa1Z0M09LVXdLbmpnM3VySy9C?=
 =?utf-8?B?RXlvdWNLUUJNZ05YQkhjRWdOQzI0SERIZCswd2g0L3huaWlFRGV6STFCNXdX?=
 =?utf-8?B?eDBWTVMyTXlwSDh3Ukc0dXJ3QzdabFpwWEdhcVQzeDBVMS91bmhMcndTSFRB?=
 =?utf-8?B?OTBOb0pVSThEY0lKN3pBVWFDMk9UNFU3b2UveWkxTWdHaG1MN1JObVBHQ05z?=
 =?utf-8?B?NU12T25JZVZPV2o2SlBkS3lVQnVjM2pWcDNGQXhLMEJKc0tPc0RKNWQxZWE3?=
 =?utf-8?B?RkZWMjZWb0Q3Y2svWTdRYngrM2JONFY5NDFEQlBLN3BzWnh2MHYwVEdud0Fj?=
 =?utf-8?B?WE1EY24xQ3FKUEVpZndEOTZ1UDdDMnNQenpQY3pyNDhSdGpqMTUvUFc3TnIv?=
 =?utf-8?B?MWxCTzJOWDUwTmFaS2tRSjltWTVYY0xta0oyUGlScEZPS0ZnWHhHUUtualov?=
 =?utf-8?B?U1hacFpWWTBGcmNIcno0WDlSVFJGTDhDRk1FNFA0cVh5ZlRZNmRKV285WUow?=
 =?utf-8?B?TmEyQzRscW1UODJMQWdLUFk3dnlCVTJmUEFKNjdPS2ZIZWNZdG51Mk8wZTZu?=
 =?utf-8?B?NEJBcEI4R3B2V0twM2NTK1NUK3pGM0hsaDdjZ0xSOWVybzc5L1U1Y2pOb3BD?=
 =?utf-8?B?NTVXdzhZS21FaG9JMlZHZ0d3UHdDeHZVWE5GV2xMcG9oZEFmbkhMR1FlY1NP?=
 =?utf-8?B?WWlMN1VFRml3cXJ4UytNMmhZUWhSUVp5d3V2QkZoK25RaGtmRzNIN3l4TFZS?=
 =?utf-8?Q?bVieTTk/lQ/HdaB/+G9eK6fqbmT3TwAeJtEIQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlZEQSsxL1gyUnZLd2tUbEx1V2hXdFFERXprc0RzUmZnMU1HNUNUSi92TGRm?=
 =?utf-8?B?Z0NSZVRyOFhIS3d6cnIvWVdjVHhRc1pQUHFUcGxxVzZBQVZCaXpJRStlSFZt?=
 =?utf-8?B?bE1lVmdxeVU5VFZhL0M0azVGeVFLRUJsUFQ4WkxSb0x2ZmpWa0xkUEIvb3dD?=
 =?utf-8?B?Ym12bkRieHJ0bGpaaWlrM0YxTy9UcDdRZUM4YWUwYmhNRHlKZXgyMkszTGVX?=
 =?utf-8?B?alFZMCtYMit3SGhzQWJRL3hEaHBwbUdnOUkzb01yUDdCaFJwVmdaRWdIMVEv?=
 =?utf-8?B?RXFrTHdDMlJwZE5aY3BNUnZmUE16OExLY3diMkxkd3R6NnJGaGhSRXpobnRZ?=
 =?utf-8?B?SU9VMDRDWks5T01yWk1tMk16OEFKdDdIMjFBcEZqQkpINGJOdGhvdmxYR2tG?=
 =?utf-8?B?alk2cVBkd0lCVWpUdGhuOUdOa1l0aXhDYnYxYUZOMlFSR2s4c2s0cUplSWlB?=
 =?utf-8?B?M0pWNUtuajhaS01KaHdPalp5WGZvQ2dDa1htenNVZUNqZ1BuTmNVb013bzlp?=
 =?utf-8?B?LzNPWGRKMTVtK0R3UG9wNG5qSFROUi9RcVpId25HbG80ckxrV05BbnhWZ0xw?=
 =?utf-8?B?bU5jenoydEJPMklzZk9nMVRqQkNQQ1ZnVXp6Um5LcnFicnQxUmNTb0czbUpp?=
 =?utf-8?B?dktrU0FRYThiK2JsODZ0cmFtVVo3eVVpMHQyZVNaYzVxbVMwNjVuaFEweXdL?=
 =?utf-8?B?Nm5EeVl3dERmUWxSQ2ZYaXUrODFHaXR1bmlPTWc5N0RENGRnLy8yUkRtT3pO?=
 =?utf-8?B?NUxlNWk0L1RKdTUxQlFVSmNTajRCRjdqNVhQV0haMDNZeUw1N0tUU2IrMnBa?=
 =?utf-8?B?RTNEMUNMcFUzbWpmcmQrWEgrVTZnc0lSR0pwM2w3RmJOb1Z0RXhtTkFGZGZp?=
 =?utf-8?B?TGJVdmJERTVORU03UHFqVElzMDZIYS9QbWhDWTFKQU5pWmVnWXBhM2puWUIz?=
 =?utf-8?B?UnpsZHRIQzdyc0ZLb2NQQXVlaWNSN3NxYkpZRnpiQTRIQm5mdUQ2dHFBcmM3?=
 =?utf-8?B?SlVEN0VqRHFCRzFURUZVRmFIV3M4aE9IMG8wRTEzMko3ZVN3UFlTelh4dlpC?=
 =?utf-8?B?ckt1bUFUd2wzUWNqQXdqRFRjcnVhUkw4UFVnU0ZkR0FnZExkdWNORWN1QTgr?=
 =?utf-8?B?QzI3Y1FIV0YrVFNrQWs4ZTNkTjhBa1EzTzlFeGo5YVJjdUsyc09QMnlxNXBF?=
 =?utf-8?B?NUI5SGE5S3kzM09SR1k4dldNQ2lad3JuS0I5Qi8zeHlIYkc0bklBMytXNklH?=
 =?utf-8?B?Vnl2d0NKMXdGbm56NXpaYjhpYUFEVnVuQXREQXBPTW01TnAzTFFzeUx6aU40?=
 =?utf-8?B?NzhnQktDUks1OW1ncGVYMkkxTk8wOFVVQ29nUGpHcUFvS3E4MjhlemQyVTIy?=
 =?utf-8?B?NmNNRTR6QlZTc0pNcDZoRkszTTVTMXlpUTk4Y28vQld3Q3NJQWhDaFVKeW9p?=
 =?utf-8?B?QTNMeHNqVG53TDErdm02VzNIZWlwN1BoQ0Q3QXNLL045RzUzOUdWNzB0cy9a?=
 =?utf-8?B?dVFPRHl1c0tPWGpFRFl1QkVBaGhhSUpGVnFTNmpJQW9YTEhiYlI5MEF1SlBk?=
 =?utf-8?B?TFROYXJDUmRRT1B5MWlScmVPb2grL003OHhEQmpFNEM3YmFURnNGTElqR2xP?=
 =?utf-8?B?SmVVL1dMNUhYQ3YyQnhwTHBTdWhiNWcyZ0Q2aVZ1emNZeGtnNlIzOEhxZEZO?=
 =?utf-8?B?NERRL0tZVDBzRjJYNTlxdEZ4ZEpkZnB0L0R3UVJ3Z043ZkVNb0FEWENDNEV6?=
 =?utf-8?B?K2pMenF1d05waERUcElzUmZtakxsd2w0R1BRbkFRUnpsRzFqOUEzRkFCSHFI?=
 =?utf-8?B?b3BsVFBJY2pmUFlqaHBpc2U2R2F4akJSZFRkSFJxZi9VdmErMEVqdHg1a3VY?=
 =?utf-8?B?a2IvSUlydDhSM1FXUCtwK3dUTW4zSzRjVTRPelBqSGN0THh6UUdvVXh6Q2cv?=
 =?utf-8?B?cVA3ZVg2T1Fla0pQODNna1ZCYmFqb2VLWmdmTDFja0kxU3Fhd2x1S3RZTldO?=
 =?utf-8?B?Y0taeEQrNTNXcXVYVy9nd2NpNEhTY2V6eWFWVWR5VnZSUGloSHJoaUxPYTda?=
 =?utf-8?B?SnhpVkhvQWJkY24rdDNpcW9DR0VsWEFNd2dSOVRzVXRsdWFlaC9LRm43MndW?=
 =?utf-8?Q?zPaG9/9xtgJOLyRDf23zbEkaL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb0840f-4030-4edd-5f62-08dd7c26e6c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 14:07:48.1184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtPLYBfU83aqB7Mb2am0jlt/PkjUOvZkwf6+T7BO55EPmHhl3mQxAZjQUG0x7Br1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8071
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

Am 15.04.25 um 15:14 schrieb Thomas Zimmermann:
>>
>>> The long-term goal is to make import_attach optional because its setup requires a DMA-capable device.
>> HUI WHAT?
>>
>> Dmitry and I put quite some effort into being able to create an import_attach without the requirement to have a DMA-capable device.
>>
>> The last puzzle piece of that landed a month ago in the form of this patch here:
>>
>> commit b72f66f22c0e39ae6684c43fead774c13db24e73
>> Author: Christian König <christian.koenig@amd.com>
>> Date:   Tue Feb 11 17:20:53 2025 +0100
>>
>>      dma-buf: drop caching of sg_tables
>>           That was purely for the transition from static to dynamic dma-buf
>>      handling and can be removed again now.
>>           Signed-off-by: Christian König <christian.koenig@amd.com>
>>      Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>>      Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>      Link: https://patchwork.freedesktop.org/patch/msgid/20250211163109.12200-5-christian.koenig@amd.com
>>
>> When you don't create an import attachment the exporter wouldn't know that his buffer is actually used which is usually a quite bad idea.
>>
>> This is for devices who only want to do a vmap of the buffer, isn't it?
>
> Yeah, the vmap needs the sgtable, which needs import_attach IIRC. Somewhere in there a DMA device is required. But it's not of high priority as we have workarounds.

I've removed the need to create an sgtable just to create an import_attach.

The crux is that exporters sometimes need to distinct between the case when DMA-buf is just used for inter process passing of buffers and inter device passing of buffers. Usually we use the list of attachments for that.

Because of this I though of changing the dma_buf_vmap functions to take an attachment instead of an dma_buf as parameter. That would also resolve the problem is making sure to signal buffer movement through the move notifier.

BTW: Where do we currently pin the buffers to make sure that the pointers returned by dma_buf_vmap() stays valid after dropping the reservation lock?

Regards,
Christian.

>
> Best regards
> Thomas
>
>>
>> Regards,
>> Christian.
>>
>>> Best regards
>>> Thomas
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
>>>>>>> Reported-by: Andy Yan <andyshrk@163.com>
>>>>>>> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
>>>>>>> Tested-by: Andy Yan <andyshrk@163.com>
>>>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>> Cc: Anusha Srivatsa <asrivats@redhat.com>
>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>>>> Cc: linux-media@vger.kernel.org
>>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>>> ---
>>>>>>>     include/drm/drm_gem.h | 8 +++++++-
>>>>>>>     1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>>>> index 9b71f7a9f3f8..f09b8afcf86d 100644
>>>>>>> --- a/include/drm/drm_gem.h
>>>>>>> +++ b/include/drm/drm_gem.h
>>>>>>> @@ -589,7 +589,13 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
>>>>>>>     static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>>>>>>>     {
>>>>>>>         /* The dma-buf's priv field points to the original GEM object. */
>>>>>>> -    return obj->dma_buf && (obj->dma_buf->priv != obj);
>>>>>>> +    return (obj->dma_buf && (obj->dma_buf->priv != obj)) ||
>>>>>>> +           /*
>>>>>>> +        * TODO: During object release, the dma-buf might already
>>>>>>> +        *       be gone. For now keep testing import_attach, but
>>>>>>> +        *       this should be removed at some point.
>>>>>>> +        */
>>>>>>> +           obj->import_attach;
>>>>>>>     }
>>>>>>>       #ifdef CONFIG_LOCKDEP
>

