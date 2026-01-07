Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352EFCFDB99
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4B610E5B1;
	Wed,  7 Jan 2026 12:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DWvC3Kpw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011025.outbound.protection.outlook.com
 [40.93.194.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D3610E5B1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 12:45:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iptgiUCKf4kNeiozhnOseULNJ6sZ1Zkq461gsra/RsIwIzaa++Ce088zKFbg7Nz6C8ST6jAwLcMNadkosJO+5CyOKuFTKRRUSMQyQGko+kc3IuJXefMzcPoMdHmFe31gRDIxvczdxMSH9mjMwUHYRA/CI8pqRhg09bQK8ouRYkxR4Azt5/VCC7NuITwTKQsrys6pMbnHmww3NJTN5jwPzi85aoctAMFaniRI8q1E7KA/VC8S7FyBeEMd5n0R5od4s8F3T3Swj2f/cuuaSH02gCMIij2rYMpePCkZubMguEw10C869Ca7I4UzOqhZ0JUShtXxa3FON99oVdD2bdFt6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDX9VmreKxttqr+4wDuphKIzm1QVLNQbRHIO/k/HtYU=;
 b=M6H44DnmV7xuKQrqc/JlvJuA0ohiYv6d06LNUdfzz4E3j4JgS52KaT+UOw2D9UFGOqp7Bi1U6KXJNKyYrktgajkC8dSQpl5K5hAX9LjX84YHx6G8S5oWZUDvdBFXIO/PvixX8c86E9EaF5p26n3yAhUB70Kp/UXS5Le9+Lo99Fv48n4gITlrARQbZt6wCbDcTc0NLw1dcinUx3QCzTKE6tRPuxeeoaN6hJxRo5p4YQrhviPfRE1czQJVefDAZ/lM7K/fACKRUCj6eT+Tacb+IYzbOUznZ7vQF1blJPJXJs71NSBi5qade0RdJj4RO807saCaqHaDW1OCVO7njCwFSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDX9VmreKxttqr+4wDuphKIzm1QVLNQbRHIO/k/HtYU=;
 b=DWvC3KpwsrOUjiRE6P0BFKJfy/FHf87ifb8zsdz7Z6gZFBK6tlGkAyneUfH6BxDh9W8mFXWVIfMLWufI13MCEJekmMNDwwBFAUT/sjYkwV8aA1G4vRnliq13eKFpB15yeLZmnV4//R7TvB+FjsNJYa+dAVB59wmYYBP2gfZkPHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5932.namprd12.prod.outlook.com (2603:10b6:208:37f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 12:45:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 12:45:31 +0000
Message-ID: <7e126504-1966-4c63-8db5-dfe57e206169@amd.com>
Date: Wed, 7 Jan 2026 13:45:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] dma-buf: add some tracepoints to debug.
To: Xiang Gao <gxxa03070307@gmail.com>, sumit.semwal@linaro.org,
 rostedt@goodmis.org, mhiramat@kernel.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 gaoxiang17 <gaoxiang17@xiaomi.com>
References: <20251223032749.1371913-1-gxxa03070307@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251223032749.1371913-1-gxxa03070307@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: ca969879-98e7-4760-b516-08de4deaa47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFBGdzdLdEJpS0o1a1ZIZmlneUg4cWdhdU8vcHFTamJxZkJibnU3L0V2KzhJ?=
 =?utf-8?B?Yko0QjNnQm1BdW1XQkNSZkRuempkQnhLbW9xQ3JuUmJtcW1OTWxNMHlmT3JR?=
 =?utf-8?B?WUlUZTFEOHpka2paUnJUVjNFRjVOb2Z0U0tLcVhMWnYwczN5a0toeTVybG4v?=
 =?utf-8?B?ZVQwdFJ0OVVaTGUrcnh4eWk3aS84Q2NoeGxyU0U2OHFWZVQwQ3pzTUdZeHgr?=
 =?utf-8?B?d3RrL3RUdDMvb2V2UXNPWUxiaFQrNjZJaFdTU1FNYVFOWVlLQVVqTzdiNXEw?=
 =?utf-8?B?S3dveDdYMGVhKzJRY0o0N1kydEZkc2RUSUZpNXhZeUxTVjROYmVLNkVySUtY?=
 =?utf-8?B?TWk1NTBHeDk4cmM4TGZYTnkyaUpWL3YzenN4VUtsTnh1RHp5aXNQWmU0MS9v?=
 =?utf-8?B?OTNNQzdWZEVvTmNRUndtSXJEWlZtYlFZS0pMdWJxRG1Fek5UeGY2eHhMYktD?=
 =?utf-8?B?MDJDZ09kRHcrdHh6Wm96MFU0bGg0Zlk1NDFhYXdxSjNhSlNhOXJSTjdhT1Nv?=
 =?utf-8?B?b0FSQkx3S2pGRHp2YXkzWlNNNzBLMEpYVzlrU281WWR5YWhaZ0FVMWlpY1NO?=
 =?utf-8?B?NzF2RGduaWNheTAycWovbG1NL1o5eGxVMVpCU0JuUXd3aXNrNEI5cGRXeVRa?=
 =?utf-8?B?NVBJdFVjM0hmRE1KTzdrRThiV04xVzBSQ1RQcEtDZ2tyeFRXaFowZStqQWsr?=
 =?utf-8?B?S00wZG5RM25OVVVqOVppckZXdHp5VEsrZWpQV1ZUeUtJTlZNUXc3WnMxMDdS?=
 =?utf-8?B?alRTM05zZEYvNGRMSzBoaHVPZlVkZWl5c1ZWdHRobituS3J2TWorUFdJQ2RF?=
 =?utf-8?B?QU12SytaL3FsclN0QWF2ZDhHbUpwYVVjak5IVkphcDhqV2ZOS1NTTW1SdXFu?=
 =?utf-8?B?MWVZMWdpY3g4emUrZjFvUUFWUGtpckU4MjQrQ3FNZlVHSmJaVDd2Z0RLUjVM?=
 =?utf-8?B?allrRkZzMkRLM3VOczNNdE4renBUVzh6NjRMYlNxZFg4dUllV0RXNWZKY0RW?=
 =?utf-8?B?ZHA2dWZ2eE9pdGQrYkpScHU0Zzg5a0hkZk5OTGI0TWNtOXVTdjlubE9tZXJm?=
 =?utf-8?B?ZkMvUDB6TVJGWWQzYWFFV1RCZm9qQm9ZYkw2cmtOTnJYemJUTnVRWlNpQkVK?=
 =?utf-8?B?WW13VGpLcEtCdXZDSWNBNFdIQVNSMi95Q0ErQzdhd1R2NlhGL0xzRUxZWFpj?=
 =?utf-8?B?ZFZCSHoxTXdsNW1ERVRNN0ljT3dRQXcrRXNrSkdPNFY2TldaM2xmdUt3S1Jj?=
 =?utf-8?B?N2FYeDdrQ3N2K2N4bXdQNWJwcXd5T0tGS2VqR2hMTkZVQmswKzBwMHZlN0Rq?=
 =?utf-8?B?c1VBSWlUdkM0a0VpS2ZPcGFNL0xKcjlOaUI1QXA1clFRTlE0RFRpbVVabDk1?=
 =?utf-8?B?b2xuVFpWQWNrU3pKMmhPRlkwcG9VSGt2ci82MllWeUZwcStRVVhVQlZteUYx?=
 =?utf-8?B?OWtDT1dGL0JmUHVrLzdpbHc2OWhQS1pra2xTNEF2SjhFOHRkQUVoVE5zOSth?=
 =?utf-8?B?ZXFqUEkyeUlMUldHY3hqT2xCWXdNb1hYcDk0Mktva2RMWFJGeWJ0bU16YU85?=
 =?utf-8?B?SkpmaXo3eEZiSUg0UGhiUzBSVUgvU1dkZWsyQnJuYlh5eXhIamFMTGpHUHZH?=
 =?utf-8?B?ZTlXWkxyaEhLNVFLT2libVpNRHBFOVVZRXFkMElTNm5lQ1RVNFFsOVpSV3NS?=
 =?utf-8?B?UVNTQTgzSnl0ZkV4UkRXbGtTMVFCVkhRVnh0dFFCYmhZYlNWMk8vNjZieTU2?=
 =?utf-8?B?ZDNyM1lsWHdnNWU5SGZsOUlhdUp3ZTRDZ2NTWHI4VjgyTkJNUnZNQWQ3S2VD?=
 =?utf-8?B?OWo3b1pTV3NsZ3d0L3JwMTYzaUZnbUZ5QVhaYjZwMWdwdmswa3ZBRkx1amp6?=
 =?utf-8?B?ZDNDd0VQcWJHKzgzZytiTFp3QWJUTVc1T1hFalNUdjNrdmFNNG9PRXlLa2RF?=
 =?utf-8?Q?OwOeGc/BVTvLqKn3wP8gmOC1C9i1UW6C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZURxNUkxWEcvOFZiS3pMUzBmZ29uakQyZlJpdUtoYkw2dFZCcnFFV3p1THRY?=
 =?utf-8?B?a3d5Q0FtWGgwZktnaEJBSnRBWkNJOFdWajhvaHFWMDRDaldHVWZPRVlGNjNH?=
 =?utf-8?B?a0tSS3IzOTAwb3ZVbW1ZNlRrL1YxU3pzTytzVk9sbFI5YVk2SVQwcklvWC9y?=
 =?utf-8?B?Q1N3bXozVlFOUkNMUUl5UWgvVFJQN1lHb2paNFRVNEtGN3NvTkZjV1o4NzJT?=
 =?utf-8?B?MXNQNC9GcnlRN3lhSG5penFLSFJuSTQ5SGtlSUt3eEhaK3hDRzVkRUtmeFlh?=
 =?utf-8?B?UnFoQ1hEd3hYWERNMHFicWZicDRyVHdDN0x6dkpwWWRNWVRtb0JyUWNWbDhT?=
 =?utf-8?B?V3ZXRmdUVFJaOXBqd3V5Tkg4QitkalhVVm96UzFPeitCTE9nMmNUN2RNR0Zl?=
 =?utf-8?B?OU4zUFdJTzI4LzVpLzlmaXo5UFNJSlFwTlJwVjhaUkxJSllma3UxcytaWElZ?=
 =?utf-8?B?Qm9iUzlIUFkyVTB3OWdRRDNtK0JuN1ZsWDAzZ3A3dWxQajc5Mksrdk82eWkv?=
 =?utf-8?B?WVRXOENtTGlhTytSSjVEMXo1V3JSa2pmWXNIUjNNTmdpbytSUVRoQTFRTm5x?=
 =?utf-8?B?ckN2VkV4bFpDb2hRdmM1bzIvMGlwQURPSVltNm9UaTFUZ2hmTEM2Y0pVK3pa?=
 =?utf-8?B?ZDk4QkJ3L3Z4bkRJMU9ueDJhb2MwMFZnRlpyWWVYYTg1MkliZ09GSUE3N1dZ?=
 =?utf-8?B?SzVyRUg0RFNqSVFvcVBPMzlNNTNDU1hDZDRJaGhDTWlzYVRESEJOd2NvcURY?=
 =?utf-8?B?SWUvV2tacEZVSlFhYWR3aUsvQUdVWWpnVTVhQkdMZXRzWGRFMERFdFBtNXlR?=
 =?utf-8?B?TkpCT3BoTnQ5WGk0MEhaVDlTUGRoVm54UnJaWE1QK1VvcllXTDBPQVVwVGlO?=
 =?utf-8?B?UURic3V5NzFleldoS1ZISklSdjFhLzZ5MmlMWUZvcnpMWEtneitudWxOSDRB?=
 =?utf-8?B?WlN3a0U3MGtSV3dsYkwvM3lkSlV6WnkzMjJIZlFnTzFhUWRzVFA0VFkxa1Bs?=
 =?utf-8?B?RjFReUZGZGMxaGhxYUx5TnFFT2xtVndRcW1HMExwQyt2VVp5NUlLSTJ1eEh6?=
 =?utf-8?B?YkwyWWR6WDBTdDVpclZaWkIyN21oTE10VjFMWFIzQ2RIQ3hWOVR5TjFDQXBV?=
 =?utf-8?B?TGlHT3lZTCtFZUVxR3RKb0U1M3N4VkNNelpLUkJvRkhua0RlMEtXcFNKWjVs?=
 =?utf-8?B?RzdHS3dmUmMvbWZCa1NkdU10SlZvU2JuYWVCNDdzYThhL2pDY1A2YTlqY0VO?=
 =?utf-8?B?bjZFamlZc1B3Nmw4T05KSUdGWTl4ZWVLZTV5dnV4eUhEMjRERnFoRHgremN3?=
 =?utf-8?B?eTJBb1QwQXl1ci82NFA1c1RWLzM5TGluRU9yWlFTZTVMblRzQ2w0dHU5aWZi?=
 =?utf-8?B?OGpXU2x6UzFuaVhxQ0RrTmNDM1ZRT1BGUmNLQjFqc3M5N2JMaDVERG9OSm5X?=
 =?utf-8?B?K2dBL1NWUEpSUi92cmFISzFURnNGUkFGMDA5YXdzcmFGSTdsZm9ieFg1TU1r?=
 =?utf-8?B?MnZETEEvaVVURHFKbEkwM29GMGZ6UlhjN1h6RlI3M0pxcUFRY3drTmFPZHNv?=
 =?utf-8?B?OG5sMktwcHk4NGZyQWh3R1JMMWdzZ1dhVVVxN3pPN2FoZDZPZHJKVkUzNWxO?=
 =?utf-8?B?K1JrdllxL0hOZTUwWkxHVFBzQTVTdFFWaTZ4U1RqTGdrNnZqWU94RGQyMHpr?=
 =?utf-8?B?OFZtTStGU0Y2WHRwdTNiRllUdEExT1JCbW5UdXZzQmk5ckFUN3BueVdNWnZv?=
 =?utf-8?B?QTJRb0FHbzdEenlMUU5IYjNhUGE3WEdXeXh6cWdFaGlQZUUyb2JCdGVrNG9J?=
 =?utf-8?B?TVJSeEt2VGplV2dIQXZNYW95cnpYeW9SKzhwRTRBbkhuUnAvSzNpYTNLbTV0?=
 =?utf-8?B?OEt0QWtHbk5MUXBBeFgrTVM0MDZSRWM3UzY5TUFuK2xTd2tUQlF3aE1OaDF1?=
 =?utf-8?B?TVNHN3FCRURUaUUrbkFrbithc0VpalA3T0hVVW1leWFzeDEwZXZ0aStlSE9i?=
 =?utf-8?B?eU1KVnd4d1lyaUN3bmpqTk84MW5MdkU4YVlROThrRFd3TjNONlhhRWhBTzdY?=
 =?utf-8?B?b1hlN1FaK2hJTGROSzFKY1BnZ3p5Y0xxRnM2bXNpQ3d0dDU5OTN4QUhmeXp2?=
 =?utf-8?B?RllFdXVDOWNBTCt6OVkwbHdGNGRzSERSMEE3eVh0MVlCem5GVXEydWVCNnJn?=
 =?utf-8?B?Y2RFY2FwdndxaVVjSSt1NHRwWVpObzNNcmh6WWtlVzRucHhWWXdsYU9xSGxW?=
 =?utf-8?B?TGNZeHNlK3RDS3NoYVljL0xjalNXWTI2MFMzQkJ6RjR3OVFBaTN5TlV1ZUF5?=
 =?utf-8?B?c2hSc2tYbS9ob1IvRW1qa3RvU3NhZ3ZKR2QxYVVnQnA3SzNXM3RZZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca969879-98e7-4760-b516-08de4deaa47c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 12:45:31.2127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D46NVsnOyTe1EyPo5ETrt57fblIEvm83KUwK3n4dEpm9QuKTYs4HKSxfiyXQ4OWq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5932
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

On 12/23/25 04:27, Xiang Gao wrote:
> From: gaoxiang17 <gaoxiang17@xiaomi.com>
> 
> Since we can only inspect dmabuf by iterating over process FDs or the
> dmabuf_list, we need to add our own tracepoints to track its status in
> real time in production.
> 
> For example:
>    binder:3016_1-3102    [006] ...1.   255.126521: dma_buf_export: exp_name=qcom,system size=12685312 ino=2738
>    binder:3016_1-3102    [006] ...1.   255.126528: dma_buf_fd: exp_name=qcom,system size=12685312 ino=2738 fd=8
>    binder:3016_1-3102    [006] ...1.   255.126642: dma_buf_mmap_internal: exp_name=qcom,system size=28672 ino=2739
>      kworker/6:1-86      [006] ...1.   255.127194: dma_buf_put: exp_name=qcom,system size=12685312 ino=2738
>     RenderThread-9293    [006] ...1.   316.618179: dma_buf_get: exp_name=qcom,system size=12771328 ino=2762 fd=176
>     RenderThread-9293    [006] ...1.   316.618195: dma_buf_dynamic_attach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0
>     RenderThread-9293    [006] ...1.   318.878220: dma_buf_detach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0
> 

I've already pushed this patch to drm-misc-next, if you still want to apply some style changes please rebase on what is currently upstream.

> Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
> ---
>  drivers/dma-buf/dma-buf.c      |  51 ++++++++++-
>  include/trace/events/dma_buf.h | 157 +++++++++++++++++++++++++++++++++
>  2 files changed, 206 insertions(+), 2 deletions(-)
>  create mode 100644 include/trace/events/dma_buf.h
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index edaa9e4ee4ae..59a5261cb26b 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -35,6 +35,28 @@
>  
>  #include "dma-buf-sysfs-stats.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/dma_buf.h>
> +
> +/*
> + * dmabuf->name must be accessed with holding dmabuf->name_lock.
> + * we need to take the lock around the tracepoint call itself where
> + * it is called in the code.
> + *
> + * Note: FUNC##_enabled() is a static branch that will only
> + *       be set when the trace event is enabled.
> + */
> +#define DMA_BUF_TRACE(FUNC, ...)					\
> +	do {											\
> +		if (FUNC##_enabled()) {						\
> +			guard(spinlock)(&dmabuf->name_lock);	\
> +			FUNC(__VA_ARGS__);						\
> +		} else if (IS_ENABLED(CONFIG_LOCKDEP)) {	\
> +			/* Expose this lock when lockdep is enabled */	\
> +			guard(spinlock)(&dmabuf->name_lock);	\
> +		}											\
> +	} while (0)
> +

The indentation of the \ on those lines seems to be completely of. Some editor setting is clearl not correct here.

Regards,
Christian.

>  static inline int is_dma_buf_file(struct file *);
>  
>  static DEFINE_MUTEX(dmabuf_list_mutex);
> @@ -220,6 +242,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>  	    dmabuf->size >> PAGE_SHIFT)
>  		return -EINVAL;
>  
> +	DMA_BUF_TRACE(trace_dma_buf_mmap_internal, dmabuf);
> +
>  	return dmabuf->ops->mmap(dmabuf, vma);
>  }
>  
> @@ -745,6 +769,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  
>  	__dma_buf_list_add(dmabuf);
>  
> +	DMA_BUF_TRACE(trace_dma_buf_export, dmabuf);
> +
>  	return dmabuf;
>  
>  err_dmabuf:
> @@ -768,10 +794,16 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_export, "DMA_BUF");
>   */
>  int dma_buf_fd(struct dma_buf *dmabuf, int flags)
>  {
> +	int fd;
> +
>  	if (!dmabuf || !dmabuf->file)
>  		return -EINVAL;
>  
> -	return FD_ADD(flags, dmabuf->file);
> +	fd = FD_ADD(flags, dmabuf->file);
> +	if (fd >= 0)
> +		DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
> +
> +	return fd;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
>  
> @@ -786,6 +818,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
>  struct dma_buf *dma_buf_get(int fd)
>  {
>  	struct file *file;
> +	struct dma_buf *dmabuf;
>  
>  	file = fget(fd);
>  
> @@ -797,7 +830,11 @@ struct dma_buf *dma_buf_get(int fd)
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	return file->private_data;
> +	dmabuf = file->private_data;
> +
> +	DMA_BUF_TRACE(trace_dma_buf_get, dmabuf, fd);
> +
> +	return dmabuf;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
>  
> @@ -817,6 +854,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
>  		return;
>  
>  	fput(dmabuf->file);
> +
> +	DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
>  
> @@ -971,6 +1010,9 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  	list_add(&attach->node, &dmabuf->attachments);
>  	dma_resv_unlock(dmabuf->resv);
>  
> +	DMA_BUF_TRACE(trace_dma_buf_dynamic_attach, dmabuf, attach,
> +		dma_buf_attachment_is_dynamic(attach), dev);
> +
>  	return attach;
>  
>  err_attach:
> @@ -1015,6 +1057,9 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>  	if (dmabuf->ops->detach)
>  		dmabuf->ops->detach(dmabuf, attach);
>  
> +	DMA_BUF_TRACE(trace_dma_buf_detach, dmabuf, attach,
> +		dma_buf_attachment_is_dynamic(attach), attach->dev);
> +
>  	kfree(attach);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
> @@ -1480,6 +1525,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>  	vma_set_file(vma, dmabuf->file);
>  	vma->vm_pgoff = pgoff;
>  
> +	DMA_BUF_TRACE(trace_dma_buf_mmap, dmabuf);
> +
>  	return dmabuf->ops->mmap(dmabuf, vma);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
> diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
> new file mode 100644
> index 000000000000..8c49341f60ef
> --- /dev/null
> +++ b/include/trace/events/dma_buf.h
> @@ -0,0 +1,157 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM dma_buf
> +
> +#if !defined(_TRACE_DMA_BUF_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_DMA_BUF_H
> +
> +#include <linux/dma-buf.h>
> +#include <linux/tracepoint.h>
> +
> +DECLARE_EVENT_CLASS(dma_buf,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(	exp_name,		dmabuf->exp_name)
> +		__field(	size_t,			size)
> +		__field(	ino_t,			ino)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__entry->size	= dmabuf->size;
> +		__entry->ino	= dmabuf->file->f_inode->i_ino;
> +	),
> +
> +	TP_printk("exp_name=%s size=%zu ino=%lu",
> +		  __get_str(exp_name),
> +		  __entry->size,
> +		  __entry->ino)
> +);
> +
> +DECLARE_EVENT_CLASS(dma_buf_attach_dev,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach,
> +		bool is_dynamic, struct device *dev),
> +
> +	TP_ARGS(dmabuf, attach, is_dynamic, dev),
> +
> +	TP_STRUCT__entry(
> +		__string(	dev_name,						dev_name(dev))
> +		__string(	exp_name,						dmabuf->exp_name)
> +		__field(	size_t,							size)
> +		__field(	ino_t,							ino)
> +		__field(	struct dma_buf_attachment *,	attach)
> +		__field(	bool,							is_dynamic)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(dev_name);
> +		__assign_str(exp_name);
> +		__entry->size		= dmabuf->size;
> +		__entry->ino		= dmabuf->file->f_inode->i_ino;
> +		__entry->is_dynamic	= is_dynamic;
> +		__entry->attach		= attach;
> +	),
> +
> +	TP_printk("exp_name=%s size=%zu ino=%lu attachment:%p is_dynamic=%d dev_name=%s",
> +		  __get_str(exp_name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->attach,
> +		  __entry->is_dynamic,
> +		  __get_str(dev_name))
> +);
> +
> +DECLARE_EVENT_CLASS(dma_buf_fd,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd),
> +
> +	TP_STRUCT__entry(
> +		__string(	exp_name,		dmabuf->exp_name)
> +		__field(	size_t,			size)
> +		__field(	ino_t,			ino)
> +		__field(	int,			fd)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__entry->size	= dmabuf->size;
> +		__entry->ino	= dmabuf->file->f_inode->i_ino;
> +		__entry->fd		= fd;
> +	),
> +
> +	TP_printk("exp_name=%s size=%zu ino=%lu fd=%d",
> +		  __get_str(exp_name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->fd)
> +);
> +
> +DEFINE_EVENT(dma_buf, dma_buf_export,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf)
> +);
> +
> +DEFINE_EVENT(dma_buf, dma_buf_mmap_internal,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf)
> +);
> +
> +DEFINE_EVENT(dma_buf, dma_buf_mmap,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf)
> +);
> +
> +DEFINE_EVENT(dma_buf, dma_buf_put,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf)
> +);
> +
> +DEFINE_EVENT(dma_buf_attach_dev, dma_buf_dynamic_attach,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach,
> +		bool is_dynamic, struct device *dev),
> +
> +	TP_ARGS(dmabuf, attach, is_dynamic, dev)
> +);
> +
> +DEFINE_EVENT(dma_buf_attach_dev, dma_buf_detach,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach,
> +		bool is_dynamic, struct device *dev),
> +
> +	TP_ARGS(dmabuf, attach, is_dynamic, dev)
> +);
> +
> +DEFINE_EVENT(dma_buf_fd, dma_buf_fd,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd)
> +);
> +
> +DEFINE_EVENT(dma_buf_fd, dma_buf_get,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd)
> +);
> +
> +#endif /* _TRACE_DMA_BUF_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>

