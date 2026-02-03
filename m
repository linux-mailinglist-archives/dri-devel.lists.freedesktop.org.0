Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC5WJU61gWkrJAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:43:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886DAD6560
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032B210E30C;
	Tue,  3 Feb 2026 08:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FcwPY7G7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010034.outbound.protection.outlook.com
 [52.101.193.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FFA10E30C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 08:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ts1mGXDhwYLo6+FjFTVIx3tAX2Ke4sfMdGPgRGOhJKb1C7pJTg4dibpZIJxHRSOpZyPjw1CTp4yCL1ywzX0tu9VxOqU1MyHPuaVg0+XGzRl/juAhQl1YZ2kJgNv1Al4ktjcAznb4xW3EBeaNJ1s2efu5kkZty1l24eHq2s2R2KSvB8cjOdodRqGc2sp0+W3AvfIfO6RdWojw5GCyEXJwHpWOjy9SfUkrqjnsCxgj8HLTkCn6cCeujqlEbM98IUWAJsjGdrRn3UFWtw8bSkCSnc57YK3CL83wYETghMLgJAXzBzJtsHS42dU2ebr0WP2lbDk1OWJZmFiEwuhg4YxSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BHBBaT4Z2v5Kq5k6RCQXNcp8cVkhCrH7+FBNJLA+WQ=;
 b=k/BXcOsXybF+dBXsv+0U3+zWFXXnuUI2prBsBpN750DxOApnUEIfc52m7jR3f1b4eILYGtTwgw63ZdpH2VfGysjtffgKttVTqRmScVXvg+5evwcRMHmbTHBh1MsvLQQY/FYg1bH3Hpt99ZysKnu4FdkhtbAJv8vb5ohdayJJTcdZGy9f+Xl1ksSK5bSM7V9EktRbYE/6lUxAy4isw5Q9WtY0STwkoVerakrpuH4KUe6dujlTy7J7j+z00l+ws1vhtn2HWU7RarOqZys9sjlcu+aRTy741vt102ANVDQurfxBaMX2sfi/eHSjLuMZoDC7j9g+W31j4lB4J3VHVGW7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BHBBaT4Z2v5Kq5k6RCQXNcp8cVkhCrH7+FBNJLA+WQ=;
 b=FcwPY7G7OaF9woifh1/F0GVQQQOgainOYPL8lvKBaMceq6sJPLy+YqebSBMlKOGR8jNy5m+K6BVGdr6C7zK7vzMaSWiVYgVp48pN4hGklelcBXAfpll2ewu7cmndHfMNPU1LtI5C/o3wBtNvP3+pHsflOSwlXz44lBePFqwSTWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by LV8PR12MB9207.namprd12.prod.outlook.com (2603:10b6:408:187::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Tue, 3 Feb
 2026 08:43:50 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:43:49 +0000
Message-ID: <2934b2ba-d903-418c-8e5b-0d3a8bebc1d4@amd.com>
Date: Tue, 3 Feb 2026 16:43:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: drm_gpusvm: questions on multi-GPU support
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.brost@intel.com
Cc: Ray.Huang@amd.com, dri-devel@lists.freedesktop.org
References: <a1dc7f3a-376f-4910-b6ae-8ee733bd598f@amd.com>
 <081c00e4b349ec6b81ef9659b8180c1b834909b7.camel@linux.intel.com>
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <081c00e4b349ec6b81ef9659b8180c1b834909b7.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|LV8PR12MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: ededae54-76e5-4c97-2103-08de630059c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0EvSDFWNUNXRVlBcmk2L2k1Vm92UEJzZ05zNWFIMVN5S2NTdFA4c2VneTgy?=
 =?utf-8?B?NnNieUJ0SXBUQUM5MTF1TnZaY3d5U2RwaGJpanE1TmxraFhQRDBaWHVQZkZl?=
 =?utf-8?B?cmF0VW9tZ3hBTm0vRmFFb0JDWFhrR250SHlZQlNMMVJ1cGhBbmxNcWdRdUVC?=
 =?utf-8?B?OTV4UEJrVE1nQjNKdFVxRXVsZW5pYmZycmUzTzNJczQ1b0NWb1JvNDFVbUZp?=
 =?utf-8?B?WGtNZ3d3VFFFdVNnb1RZbG92VjhGR0Rzb3g4dXg1K1RCS1NXeGJmdUZFVXls?=
 =?utf-8?B?OHVUT3Zsb1MwTGZXak1wc2plcGw0OVU5UXh5Nnc2SUdyN2NidURvUGwya2dp?=
 =?utf-8?B?d3dHRzN0TEE5dk13RkE2Zlh2emIzN2JXMGlCY293VDU3UXduWmozSEErQ25j?=
 =?utf-8?B?bmxuUG9qRjFmTHc3TXkyUkMvL2M5MDlMQ0UrazVQVEg2K0gwSSswVUVNdlJW?=
 =?utf-8?B?UU1icm5qM0YrWlJjZDZVeDM1TUdxV0l1aUdoWXROREZobER2RTYranR6Vjdv?=
 =?utf-8?B?a040d1lrc3pSNC9OQUQ3akIrWjVYWlBMd0E2WWovY291L1BOSGRmRjZabWRx?=
 =?utf-8?B?OUlyWjNmOG5ReU5FU04xTzFSMWtZcGZ4TXdMVFlBdUhBTkIydTFsZEI0V2FR?=
 =?utf-8?B?MzJvSUdJUUQ1OWg1NEtPM1ljckNpM2VoS291dDRQazJBcHdyc0NqbFVOREdq?=
 =?utf-8?B?SFRGZWxickdDRUdNWjRBNmdNL1dxdjlYYTZ0NC83MGwvTnFaRS9RN1l5VWxW?=
 =?utf-8?B?MUJ6NUpSbWxIMkdtSHcwbFJTY3BXbEdGR203UDNuZTNzSXVVa2laZDF2VkFO?=
 =?utf-8?B?TVpYWDhCQ3ZoRWJPeVd5NHhuUXdQZWNnRXVpTU9RcGpScWVHc2grZUEwWDAz?=
 =?utf-8?B?TjJGRjBtTng1K2dvN3JSL1FxN0hGNVVRbFBEQUwwRmZxc3JnOG9RV0tmUTRV?=
 =?utf-8?B?VmwwM2hIdEtTUU9OdUNVSEFIa1k3aXEzNmlJMkR1aUNWbFBvcytyZUs4aE90?=
 =?utf-8?B?OTZROEExL01mOU53VkpOa2V1VWVyM3JPbkRxMkdNN05WeVl3TFhOL2FFUW4x?=
 =?utf-8?B?cGdsNHVhVml6VUhTZ0ZRN29pdUREMmUvOHVnUURXVlI4aFhneXYvbzhXQ0Jz?=
 =?utf-8?B?Nm1JbWRPTjluNm41ZW9OT2xUWFBnc3JKTEpqL2RsOXhyTS9iVkU3b09rcVFU?=
 =?utf-8?B?MlpjazkwSCszVjlhOTM3aVNPaWNiRE9Ra1Z0clVjelcvL3BYNWhTQjhWWVFt?=
 =?utf-8?B?V0p5M0ZNWHBWVHhzT09nUEhaanBlQ2VXYXpEb3U4ME1OdUE1L09LOUFFWDJh?=
 =?utf-8?B?eGJLL0hEWS8wS1BGK2RGM05nT2kyYUtBQVJXdDNWM0hqNFhSN3AvNTgydFl2?=
 =?utf-8?B?dDZwTUpiYlNaQnI4cVpiVlJCckpNYStiTnI1UWVtQ2g5WTJNcTEyWU5TT0Q3?=
 =?utf-8?B?cWpMajIvbE5jVlI0eUtHMzBaenZaTDhjYlJnNGFjUDBqV3dNMkk4b01ya1NQ?=
 =?utf-8?B?RU9DdGtTM252VE5BWktGb1h6WVlEdjh1SFZTcGxOc21XdnNieHltdXdGeU5Z?=
 =?utf-8?B?VDlkRC9kdGxFWExTSS9tak5rUngvbUhoaWhWQkZNSjgrZ0M2ck1wTzJPZ05F?=
 =?utf-8?B?aWFFOVVGSlNqU2pTYnlHdjZuNTJ1bnl4Z2lIdjc5OE53U2NnNlJ4Y3pESU9q?=
 =?utf-8?B?SUFVN3NaMkZhL1c1QkxIbVVwZFB3UDZYeGFOOUdYbDVLUm5YMUFUS0ZpYzIy?=
 =?utf-8?B?dndGR2ErNVBiMjBJNEVzZ1lVeEo4eDMxMkYrL3pYaGJwOGNvdzZSdFNZQ0Ex?=
 =?utf-8?B?eUdmVmFEeHlWcXZzOUVkSXFHczVGQllSK2lOcndqSzI1Y0d1bjl4ZWlPcEdp?=
 =?utf-8?B?WXlOZkVqejFhK2hYZXdFS1pLZU42OXp5NjgvUkF5REd3VEc1MmVQSWw1TGlJ?=
 =?utf-8?B?dnZ3RERjTnQyd2prTHovT2ZVK05ocTg5c1dSNThtUlFRcTNSaTFNbmpwQmE0?=
 =?utf-8?B?YXpzbSt0YVNHT3NGMFVpdExFbzVEYVVNUmZWeHNpYjk1SHNBTDFqTXJxZkNq?=
 =?utf-8?B?UlVkdU1BVTRmK25pQVdwVEVIRlhmMXJ5SmQ5bFVXWG9lbkowZWI1QmVTdVFM?=
 =?utf-8?Q?IyGQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MURZWHlWZHZpYmlFVmJmbDU2MlNobk1uK1Y0MGplZkNiSzVYeHQyVkxmMjhK?=
 =?utf-8?B?ZHlPRERBWHdvWlZvOHNjQmtEcmNSZTVkd2dGcVRkanZWaVJONlFqUWNzRVRW?=
 =?utf-8?B?RmQwanpRRGtLUTBZWEFyUTZlQ3hiT3NnWkwyUFUza0VkcEtzZUwyLzdqeUZS?=
 =?utf-8?B?cmwwako1QVcwVWVJUmlDMlFheUJueE9NNkJhTVF3Qkh5SlhCVHVoaFlpUVVY?=
 =?utf-8?B?ZkRUWVZIZkZKMFVmMGVKVDBHSmtEN1RYZ2JmYXNTeS9rTXpGdWRkeUZoTTNW?=
 =?utf-8?B?QVlHdTRUeG5vYjg2WTREZEVRTk5RMW1WdEExNTQrZUJHZlJBUmdxQVk3Zmtx?=
 =?utf-8?B?enJBVTJEYVlDWUJ2ckE1blRJbkFiTWN3S01MQXVxL2JRWS9NRkJhbTRuc0lV?=
 =?utf-8?B?ZUNNVVhDSVU5dVhsVUNoRDBtRjRSTTFNUVEvVVlZeHRFYmJFR2tMUFY0VWtW?=
 =?utf-8?B?MUNQOVRqdDV6WnFYNnZnT1JJQWRQWFhBVGw4eFVPUURZdTRmUWlMNXN6Wmh6?=
 =?utf-8?B?U2ZISUIrbDNEcTJRNjQveFpIdlFLT1o0Y01wc0N2SXlwb2oxa3d1Z0ZUT3Rh?=
 =?utf-8?B?WG1DNXg2NXM2Vlh5V3hJQTloblRScXlmUkZvRnhqMVJEUnhyTnJLMml6bkp1?=
 =?utf-8?B?MTdndE9YYml5dWNub0IzbVMzWlpxMGN1OUVmV0hGVGQzZXl2NUFrTEMzNFZY?=
 =?utf-8?B?UnZtdUNFaDNDQktFaFQwanFQSW40QnNhbVRPOFhDNFNaOHZjNHV1aTZNZmFL?=
 =?utf-8?B?cC82TW12dml5Qy94ZDFFRTljRU9HYmxUTTArUjRIeUJpRy9FL1E0eXZVSnhs?=
 =?utf-8?B?VHZJWWduaW9HS2s2aCtFdU9hNFgrZ0VtNmpJQzVReTYwdlpYZ1habWpWdEts?=
 =?utf-8?B?d3cxUzg5WkxOV1FiUWNpOU5OT3VVYVNURklzQ3YvQnNIZ0FxRDlsQTZOY2ho?=
 =?utf-8?B?cHVuTno5ZzYvWUNKUDlPSXlBTGRQYWtJWko1S1FrbW44OEs0TlliUU9IYkZ2?=
 =?utf-8?B?N3NBOHdqYnRhd2JuMHdJYWJWQXpaOTVPMXRBZHROVVV2N0RteFV4eGx6VzUy?=
 =?utf-8?B?TTBKQTJaaUNNWk9SUWZVYzB6bUcvYXJCbFV0TU1heDZpbXZXM1k4T29Tdkcv?=
 =?utf-8?B?bFJPUjVKTUNGdGVMWUFtL3F5NmkwTGFTd3AxczBhNWxCMUIrRGRLMTAvSGZ1?=
 =?utf-8?B?MDRaMEtMTTI3WnpvUXAySUFIS2dLa2wvUmVEMDRpcWtWTWo1K2xlZ013Ymc5?=
 =?utf-8?B?WlIyVTE2bEVHTzBvZlMrZllSeVFUSk5DZ2FMczlwN0hXQVJ6cERrK1FidHFs?=
 =?utf-8?B?aGVPZWVaRUcrZHRKczhsTU5VMjJwNGxzcS9McHozL1RTYjdVMDhEbTkzT3ZU?=
 =?utf-8?B?d1k4VjV5ZWtZZVFKZFlIeEN1R2FxeGVvR1RBV0lab1ZVRGp2ZUVhNlBzL2E5?=
 =?utf-8?B?czQ2SDl2akREN0xzWHNGYzhTNncwbGpLMVZOTXRBWjhCNHFiZldNS2ZVeHRC?=
 =?utf-8?B?Szl5Q2YvQUNJSStnT01hSXcxU25LWHhFNnBsRUJiejdsdEc1QUFUM0RkdEN2?=
 =?utf-8?B?dUxqS2FKQ0FtT3Flc0srV0dPT0IyeC9BbFl4a1FyZFh3ZEw4UW4wYXhYRlND?=
 =?utf-8?B?SmtRZkhEbjlmUm1lRGdpazgzSVROM1hJZHJCSWtQa2NCU1k0eVBwWGJmSkFG?=
 =?utf-8?B?L2JkNUNiTnhqQmRTUFBHRXVuYUx1Ukd5NzVjUVZ3U2RoMzVsUnpOZERyeFFE?=
 =?utf-8?B?UFZJNzhnMlROeDNxVVowTHo4ekkxWXNOMkQ2L0d1ZU5jUUFhWnViTFQxblBJ?=
 =?utf-8?B?QnB1RnVQa05sZzNJbXRCbENjSUt5SnNjSmw2ekwyamxETGpKcWNGUFgxK09r?=
 =?utf-8?B?OFRMclp1b295MFJJV3laZzZmVFVjWXRCaWJSWmFpQ3NtUHJMcUhtSHJQQkEy?=
 =?utf-8?B?c1djeUtOUmNHWkZ1YnM4eUNJZElIYVRmN1ROYllFbzRoanVFd2hpcS9rYzJ3?=
 =?utf-8?B?ZVZwMHhJSU9FS1VLYnAzV0VTaGlQRlp0emtzM096aTZ4ZWFoZjl3Y1BibEJ5?=
 =?utf-8?B?KzdyZit1RW8ydjNtMjlVOU5idUlvVkdnd3paK01KRUJjUDBvcXdvY2JibzB2?=
 =?utf-8?B?MGt3TElZUWJrNlowM0MyNWxaVHpmNTRFZ0NiYWF0OVNZK01zL1ovRTZZUnR5?=
 =?utf-8?B?L2lmT0JlaHREVlczOGQ2KzFoZEJhVWROVFk1dnJMVDV1aGh5eFpQWW5vcXNi?=
 =?utf-8?B?ejZGLzErU1E1TXNsNWhGeVpMeHZMTm1vdDRVQy9rbVJYekcvdGNEZWpVU1E0?=
 =?utf-8?Q?lolJtEgCvVPbIG/JzQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ededae54-76e5-4c97-2103-08de630059c3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:43:49.4371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IR+yjmyq8849uJvUPHLEiAU8fdAyEZT3riOUU6lj+JDUEgfvkDrhmfxAE8nhTtPQJOSoi2KPBep4qOpPDDdSeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9207
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[honghuan@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:thomas.hellstrom@linux.intel.com,m:matthew.brost@intel.com,m:Ray.Huang@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[honghuan@amd.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 886DAD6560
X-Rspamd-Action: no action


Really thanks for your detailed reply, it really helps a lot!

Regards,
Honglei

On 2026/2/2 17:49, Thomas Hellström wrote:
> On Mon, 2026-02-02 at 15:56 +0800, Honglei Huang wrote:
>>
>> Hi Matthew and Thomas,
>>
>> I'm exploring the use of drm_gpusvm for multi-GPU shared virtual
>> memory
>> scenarios and have some questions about potential synchronization
>> issues.
>>
>> The drm_gpusvm design is per-device oriented, so for multi-GPU
>> setups,
>> each GPU would have its own drm_gpusvm instance with independent MMU
>> notifiers registered to the same mm_struct.
>>
>> When multiple drm_gpusvm instances share the same process address
>> space,
>> I'm concerned about the following synchronization issues:
>>
>> 1. MMU notifier ordering: When CPU modifies memory (e.g., munmap),
>>      multiple notifier callbacks are triggered independently. Is there
>> any
>>      guarantee on the ordering or atomicity across GPUs? Could this
>> lead
>>      to inconsistent states between GPUs?
> 
> The guarantee is that the invalidation may not proceed until all mmu
> notifiers have completed, and then gpusvm_range_get_pages() will never
> complete successfully until the invalidation is complete.
> 
>>
>> 2. Range state consistency: If GPU-A and GPU-B both have ranges
>>      covering the same virtual address, and an invalidation occurs,
>> how
>>      should we ensure both GPUs see a consistent view before allowing
>>      new GPU accesses?
> 
> Multiple gpus may maintain ranges of different size with different
> attributes pointing to the same memory, and that's really not a
> problem. It's up to user-space to ensure that we're not bouncing data
> around between gpus. In xe, we're using the gpu_madvise() ioctl to
> allow UMD to specify things like preferred region and access mode.
> 
> 
>>
>> 3. Concurrent fault handling: If GPU-A and GPU-B fault on the same
>>      address simultaneously, is there potential for races in
>>      drm_gpusvm_range_find_or_insert()?
> 
> each drm_gpusvm() instance is meant to be per-vm and per-device so each
> vm on each gpu only sees its own ranges. The drm_pagemap code is then
> the code that maintains the migration state, and that is per-cpu-vm so
> if it is fed conflicting migration requests from different gpus or even
> different vms, it will try its best to mitigate.
> 
> However, the invalidation scheme in 1. will always guarantee that all
> gpus either have invalid page-tables causing gpu-faults or point to
> common memory that holds the data.
> 
> 
>>
>> Is multi-GPU a considered use case for drm_gpusvm? If so, are there
>> recommended patterns for handling these coordination issues?
> 
> For us it's considered a valid use-case. In the end I guess that
> depends on the API you are exposing to the end-user. KMD ensures all
> GPUs always point to the correct data for a given cpu virtual address
> space, but leaves it to user-space to supply non-conflicting migration
> requests to avoid excessive migration. I'm under the impression that
> our L0 user-facing API is also forwarding this responsibility to the
> end-user.
> 
> Hope this information helps.
> 
> Thanks,
> Thomas
> 
> 
>>
>> Regards,
>> Honglei

