Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E31C840CB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499C410E2E4;
	Tue, 25 Nov 2025 08:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HgSXdZfp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013030.outbound.protection.outlook.com
 [40.93.201.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2656E10E2E4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 08:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0/QkSmvaC/k1NPFOu7N96glws/ANiR3lv3gyrN2+F53NroUnJ4NuBh73cCpdkYC8U5eKhEinXWnKbMOfHaZEzBPeYqaaYDhvnlEqjbyXDGJyJm2LeUscamUD5blW4o11UnISXTULcs6D8/LkzNm52NvLaI+KWjGTJGbhDUtcBJ1/5bPWA7hUT24Zl/1Ix9vSwzp1n28tbMx1MyzGKixU9sxblFUTmE4NrprXfgMcaGtHV1lqq4idCrgXu/iSoD884ZX+mM6c0C7t1vCoAuAhJ5OUeV/M6J3gF7+fyI2RwJNiy9LaOs8EJBSK3x5T/2Ac/9fMielX5pF+e4YRdAMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YYjSquFC+baB3/zs7XyWYDbyUAP/grNrM/dylAF2wY=;
 b=m9LS3IqYkPRZeo7bxxhJl7N1wKr1X/6DRdD8LF+5Zx7guEQesdumVNuBDIL9Xjw4UvQdRRU6kOZsWodwgk7SH6TSL+Cl1iLhaNHIL/p83Y1ffD/wL7ElEe71V+9xz9/BD2BQepCQQTnMxrBxlIe7Vw7eW4Xn2TkRDtOJ2a80cCFQ3eqE4tc/x+QP/zs3R3NVHF7nxVZkSfIQmFgHy0kDBxrWmvXDNU1mrbY765/ZejE1c0uG6wxlYCpM0KyIUiQIwBKNKmSsWAYrbMVRoc22B/HLzRHWLIOZdJrnTHv+v5Lpf7EeNSvh6xUaCb/bor7Pr48NwYRTyL9Ix/7GFNwJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YYjSquFC+baB3/zs7XyWYDbyUAP/grNrM/dylAF2wY=;
 b=HgSXdZfpl/4NSosgbKjURYaGiZOMG+LQ7yStbJGHmRMkChLL14NQkAYH8wOt9H27poGiQDDOaay6MWr0Yd/znoMpu+GSlW46nyktskVQjDRl1OpURS0e1efjbKK2rGw899K45AgUymOLZ9B/wbodHQawLTQwTSBb8l/FlAP5MvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB9737.namprd12.prod.outlook.com (2603:10b6:208:465::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Tue, 25 Nov
 2025 08:48:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 08:48:39 +0000
Message-ID: <508ff709-0f05-4982-8e15-5fea3bbd12e7@amd.com>
Date: Tue, 25 Nov 2025 09:48:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dma-buf/fence: give some reasonable maximum signaling
 timeout
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
References: <20251120150018.27385-1-christian.koenig@amd.com>
 <20251120150018.27385-2-christian.koenig@amd.com>
 <380012b9d6f0e9ee3c2f125cfe2f37f65c1979e0.camel@mailbox.org>
 <b46913b6-fe61-48cd-a9ca-aa2fe3a12b63@amd.com>
 <1c1a14d42d0a4a25ebce26a2af0a61dc1b7813fc.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <1c1a14d42d0a4a25ebce26a2af0a61dc1b7813fc.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: 69654086-f6ae-4b47-0d2c-08de2bff6e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wm1qT3QwbGtHQTFUdkxEU09BVXJ1MW83cWkwdW5oTTdlaTBkQjhvVTJLSVI4?=
 =?utf-8?B?U0NSQkpTT295NGNFdVZ4QlFVQzNEZnovbVRzZ3NRSjFRQUpFTzhFU0RqMDVP?=
 =?utf-8?B?bHVCb1dzMWFUZWFtTEFRU3RQMGJyN2tydWRjbDIvOGR2ejF2MGIvOVlHdW9F?=
 =?utf-8?B?Vk56b1ZqRDJYOEZuZ2crNHFZNjR5K3dFVHR4ZFFQMjdObzhUckxMNG9jWWJR?=
 =?utf-8?B?Y2IyUUpOQitHTkN3MFRxV3ZXNWtNOFFTLzNUWldhRWY1ekkrMENGdHlFa2hB?=
 =?utf-8?B?Wml4eDR0b0R2K29JOWZ2bWNaYjFkakV6Rm11UFNRTWhHQjVNUWhDTnRCZGUr?=
 =?utf-8?B?aXpYMmNJbUFhcFhUdUJXdkpzS2NQWkZ5YnNXd2ovMmMxUTJZYW1valRGUFpQ?=
 =?utf-8?B?MjhaUm1iR013Tk1peDN3YkNVN1VkRktxMmI2bW5CQ01oZjl5Mk14ZVRRbHN4?=
 =?utf-8?B?ZVV4ZWlGYW5HVTUvMVo0UE1EeFpCUU5HczQyMUpsNWw4ZU9yVkQwWWFBeWZ2?=
 =?utf-8?B?MmJBSEthMjJ5cWxQajQzYnY4dXE3eExUSHI0Lyt5N3ZDUkNaOWp1MlVXcFRr?=
 =?utf-8?B?NDMvRFBCK2grUlQ1UEQrMHhWaWh3ZW1oYVN1K2dKR09QY1ppWjBlSndrOVBM?=
 =?utf-8?B?RVhEMGs1NDRNWGVTYXpYYm0yK0JpQ3ZDdW1PY1pQSnlVL3BvNDhPNmwrOW5O?=
 =?utf-8?B?SXI3cC9FUnMxNEVjNHY1QUE2RDJUY29hK3B6eEVoYlBnMUZqbmpPK2dKRkVU?=
 =?utf-8?B?TEtRb3Y4NEpYSWdjQkoxRDZia1l4OWltU0pJcXIxT2k1dFhuUzlmeWw0cjFV?=
 =?utf-8?B?alB5akdJOFRxaW1JckRhWVdoeDllZUlQcWVBdG92YkxzNG1RTUVTQVpnOUMy?=
 =?utf-8?B?cFRKZ0Q5aHNNelNZejlvQ1A4b3VMSFFxQ0dmc0ZZV2NCYTcxRVNTQnpiRWRF?=
 =?utf-8?B?UmhwallCUW5UWEJ1djN0OHNrRFA4SDFuQmxrUDEvcmFLZlovenI0OUI4M2Jx?=
 =?utf-8?B?dFgvRExCNzNFVFdmK0FmSmFaWWxrdjQ4V2RLc05DZ0IzOWV4ZFZRVjZDZkNw?=
 =?utf-8?B?eEpLZlF1cEgyMUd6ODNFN2F3NzlOSUlmYXpPQ2tnemFxMjZyUzlHSSsrVDZv?=
 =?utf-8?B?NHg4Zm9PdSt3cUJMeThGeEduVEd0TGJaS1dEdjJZdURDZFlOWGtNaldWdUc5?=
 =?utf-8?B?blRNME5ydUNUNmc3eU5XdS9pM0dURXU1WkVCSjVybkN1VzJoNTJzeEFUZGVr?=
 =?utf-8?B?TXNjSVpoc2luY3MzSnJvUHZSUWpveXRtVDhYS202V3dobkFENW41cmJwcjNn?=
 =?utf-8?B?RFUyQkRBaU9lTkdEVi96TWRLY2NtZ0hJTFp2U25OTkh6Rk91bXB2MnovQ0xw?=
 =?utf-8?B?UkFmcmxhYzBicmw3WDNuVzZKaTBWUy8rLytUS1psY2VaSWFnMFlHeXpwQk1i?=
 =?utf-8?B?UnRQODMwQjk2b0JrZnlsNFE5WmRUUWJadkl3MThZd2xPcm44NWp2blpvWEp2?=
 =?utf-8?B?MXBwYTJTUGNTRlEvUTdCcUZQOGkyUjljNDFjaTIyNjNUM2N1UzlCNkVmbjBE?=
 =?utf-8?B?QjdNOTdiQ1NhbUNJdTBrRkUxY0FLVEtYbm5xT3RabVprS3g1KzNIakdZYlBI?=
 =?utf-8?B?WE40SnlKdWw2cXREb1lCaDlnTDJCeWZiRUcweCtmZ1R6ZG02R2RCUnd2UlVZ?=
 =?utf-8?B?Z0tmYXE3d0p0OGFYUXdlVVphT29CbXVuZHUvQXdTU1lHZ0Y1U25KMTd3NUo4?=
 =?utf-8?B?Y2lTdlREd3BJWkUyVDBvUXg5TWRBZHR3VzNoWEVza0prRGdWcUZVYWt6TDRN?=
 =?utf-8?B?TldaUHdVcjJXNjhqWGNLNkY1L005Z3FsZ0xKd2F1NXlqdlJGSGVJK0NueGlE?=
 =?utf-8?B?emt0Zm5mTVV0Rnd0bWtOT1ljVUh5QnhTVm9PRThaLzZHU1dWNnREc3NHYnND?=
 =?utf-8?Q?b6x+duTZa785/j5OwSxBFjsdEJAAfAIs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWkwbVEveVQwaWpzM3ZrS1AvNnFkVlUvaFV6dlJFUkFrN1hIZXQ0OGthUEt6?=
 =?utf-8?B?NGY0YTZ1dUZ1Tm5wY3BHSjJwTkUxY0M0NzNiR1ZQZUZrdUtwazJiWUZOYjU3?=
 =?utf-8?B?dzNNUGZyWXUzZzgzZWdjajkrNndTSWQzWTdEMGRVUENKNWNia1g2Y3c4L0NY?=
 =?utf-8?B?SVFZNlRnbnljdFNCcFFma1drSFYvWEhjWjhZaW9qcG40U1M3YkFwM3Y1NzRJ?=
 =?utf-8?B?RXBQUWo3eUk1ZnM2YmtHMGt2K3F3QXhtenRaQU5JUlA1V0lOUVZ1MVc5bmxE?=
 =?utf-8?B?K1VreWFhSGZBT0F5N2hKWC9Hb3BiZHQ4eHQyV2cwVTlkTU5yT2lOMlJGZVNU?=
 =?utf-8?B?dkFSNVFDMDd2OUc1cXpjeHRIcTBhWi8yaXRoYnpBVVdYUGdSRk4xVU0wN09K?=
 =?utf-8?B?RUNvc0dJWVNVMEpQTnc5VGdTMVVMQWVKTXhEVlNaZy8xYnFHYlRITS90R2dJ?=
 =?utf-8?B?eWpMMmRpdkFwNVhKWlgrdWJEL0x2RjN5NW5BZXFQNXNkdWlzNHY3STd4bGdT?=
 =?utf-8?B?VEdqKzhLbFJJRTdnNWQ4MEtXK1NKamFPcFd5NnFiWHRoSStIKzdZWWNZREZw?=
 =?utf-8?B?SEg3S2l5ZDhBaU1iMGlSUlJJeGo0S0tzKzdBZzhQL1NIbHdiUnJXajFJbmxG?=
 =?utf-8?B?Kzh1OGtRdlR6NkxhZGx4UTVjeStEdUVvV0ZadnRrNkM4QWk2eVpNY3BwTjkv?=
 =?utf-8?B?TmE2MklTRmwvOUtUcnlwOEFhTDgvYTY0OElHOEt2RmZNVTk0ejQ4MVE0cUxk?=
 =?utf-8?B?OUhwNmUwQWs1OGJ1MFNlR0ZZMjdrRVBCb2ZkdzFSQmRmQVFBMEhXVDcxSlpJ?=
 =?utf-8?B?MVdDOHByZ1pmQXBydlZyeWVsTVgxbUdYbG96OHZ3TjRDK3lza0VpbUIvQkpN?=
 =?utf-8?B?OTBNS1JiOFJTMEVucFduS1Nad1c1em8xVUNla3B3c2dPd0YyTE5DQk9oZndx?=
 =?utf-8?B?YzBScmVZZnZ6Um1yOThJbzBTYzRIalhpYzVSVnYzMmp4WTYyc05uL0ovZzY5?=
 =?utf-8?B?Yno0b0Zja09tSnhzZ1F0TkUxZkdFZE13aEZWWlhBei9EajVDSFBiTDJ3S3Va?=
 =?utf-8?B?S0krNWEvU3h0Q2pXQVU1SCtCNGY1YzVXQ3dXVDRuRm1SQm5GamRYVmh1VGQw?=
 =?utf-8?B?YjR6YkgyWDNSa2tCMm1uMmdRR2hPT3NZazNuZ0Q2Wjk3UGZwSkxlOTlGMllu?=
 =?utf-8?B?V015VEdacnhsWmhKMmZzcXJBY0FpdE5RbFNRdTU3bmhpdmJnK1JOMHJ5OU1p?=
 =?utf-8?B?SkJUMFZXK1hnNjYyMUtGSllNcXhNUWgxSHIvL3MwVStIWG9xSmJGcTNvL3Ja?=
 =?utf-8?B?ZlFMNmtsdndIV0RJUXo1R21QTHRyUjZ3dldaakl2VmJ5Vy9YdlBSUHdZMExQ?=
 =?utf-8?B?c3QySTdDc3ZUSHhqd0NjOEt6Tlk4MndVM1hNblA3TWtBbCtzK1hJYm4rUGxw?=
 =?utf-8?B?L0dNdzBSUmsweVlSUDJ4Y05zdlBibFUzTVNjS0ZEWmZyRDVBM0ZMN3VNamJT?=
 =?utf-8?B?R2N2QjVVNFE4N2JscFdONUl1bEhHS1FaV2dscUZGeXRVM3F1T0ZuaVN5dE1i?=
 =?utf-8?B?aEVsMXhwMDZsRzkyd2JaNWE0UnhGTkVqZHM4dUdXcHBQM3BQRGJXZXRvN1or?=
 =?utf-8?B?SkVaUDNmaGcwK3NPYUptOCsxeE04Sk45S1ZpZlB6cDkxNFkrdVIwWjFxeDJh?=
 =?utf-8?B?WlpOZ29TVXhDSkNWZGpWWFliV3RvKzB3czVFc012K21BU3pTS0ExcExKY3NL?=
 =?utf-8?B?N1N6SGhSUlFnK2dnMzQ1NmRJcVZneXlCQUhqaWVsMm9nSTczeHRYc1VmYkZD?=
 =?utf-8?B?K2MwaXRZeE8waWxKc0ZRRVZuNVM0dEprRXh6V2VhU0VoakJ5ZkhUTEkxUDRa?=
 =?utf-8?B?MDJKSFNKazZZa1lTK0hZVE5VeXd5eGc2RXIzQTlOV1Z0SXlIK2RBOE40WEJm?=
 =?utf-8?B?VDA1RTFBOHVpSWd2MjNWSnRGRU5SQW9sUDRFeWhFZVc3Um9rZG4zWVZuNlBO?=
 =?utf-8?B?ZkJ4ajdkS1ZjWU5GMTdGSVlFYVRvQndGYXp5Y1pFUkpQQ0pITk8yM2ppRXl5?=
 =?utf-8?B?dHlXbHVwUGF1RmlsZzlKWlJMRlViZGhHVjFEN25DTTIzdjNRMHdFaGNOZXVh?=
 =?utf-8?Q?cpb3l4ZhQ9B6AVGVntCtemy81?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69654086-f6ae-4b47-0d2c-08de2bff6e1d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 08:48:39.8405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZt9LvPbI9FnwQTh5LPDqoHO3vaSm+5z0pbNBoVpGDgXGg43z+x2i+tXjGp9sUnv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9737
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

On 11/25/25 09:13, Philipp Stanner wrote:
> On Tue, 2025-11-25 at 09:03 +0100, Christian König wrote:
>> On 11/25/25 08:55, Philipp Stanner wrote:
>>>>  
>>>> +/**
>>>> + * define DMA_FENCE_MAX_REASONABLE_TIMEOUT - max reasonable signaling timeout
>>>> + *
>>>> + * The dma_fence object has a deep inter dependency with core memory
>>>> + * management, for a detailed explanation see section DMA Fences under
>>>> + * Documentation/driver-api/dma-buf.rst.
>>>> + *
>>>> + * Because of this all dma_fence implementations must guarantee that each fence
>>>> + * completes in a finite time. This define here now gives a reasonable value for
>>>> + * the timeout to use. It is possible to use a longer timeout in an
>>>> + * implementation but that should taint the kernel.
>>>> + */
>>>> +#define DMA_FENCE_MAX_REASONABLE_TIMEOUT (2*HZ)
>>>
>>> HZ can change depending on the config. Is that really a good choice? I
>>> could see racy situations arising in some configs vs others
>>
>> 2*HZ is always two seconds expressed in number of jiffies, I can use msecs_to_jiffies(2000) to make that more obvious.
> 
> On AMD64 maybe. What about the other architectures?

HZ is defined as jiffies per second, So even if it changes to 10,100 or 1000 depending on the architecture 2*HZ is always two seconds expressed in jiffies.

The HZ define is actually there to make it architecture independent.

>>
>> The GPU scheduler has a very similar define, MAX_WAIT_SCHED_ENTITY_Q_EMPTY which is currently just 1 second.
>>
>> The real question is what is the maximum amount of time we can wait for the HW before we should trigger a timeout?
> 
> That's a question only the drivers can answer, which is why I like to
> think that setting global constants constraining all parties is not the
> right thing to do.

Exactly that's the reason why I bring that up. I think that drivers should be in charge of timeouts is the wrong approach.

See the reason why we have the timeout (and documented that it is a must have) is because we have both core memory management as well a desktop responsiveness depend on it.

> What is even your motivation? What problem does this solve? Is the OOM
> killer currently hanging for anyone? Can you link a bug report?

I'm not sure if we have an external bug report (we have an internal one), but for amdgpu there were customer complains that 10 seconds is to long.

So we changed it to 2 seconds for amdgpu, and now there are complains from internal AMD teams that 2 seconds is to short.

While working on that I realized that the timeout is actually not driver dependent at all.

What can maybe argued is that a desktop system should have a shorter timeout than some server, but that one driver needs a different timeout than another driver doesn't really makes sense to me.

I mean what is actually HW dependent on the requirement that I need a responsive desktop system?

>>
>> Some AMD internal team is pushing for 10 seconds, but that also means that for example we wait 10 seconds for the OOM killer to do something. That sounds like way to long.
>>
> 
> Nouveau has timeout = 10 seconds. AFAIK we've never seen bugs because
> of that. Have you seen some?

Thanks for that info. And to answer the question, yes certainly.

Regards,
Christian.

> 
> 
> P.

