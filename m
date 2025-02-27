Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98377A48242
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 16:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAC410EB1D;
	Thu, 27 Feb 2025 15:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hS6NPc/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C77210EB1D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 15:00:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygsIdFwnYVDvbjQRDsAqihoaj6khN6IWBAg1fK+CRthEfjTbzXjHgfcx12r58FAdxIvCDfwZPG1rMbmn9aUB7wdsNJHMg9JNK9ClJT6RrYIpdQD1BxY6fOyQhwJz5aKETBEeo8MWpa2R21wPBjvJs+mNgYz49mGzKjiES3Hd8UL1CQ0vb77PTOKW1IqOvdhPY4PGnJetUX7PIYaC8/a9e6AHhIoDwd5EGc/hbM56Dg7GtxpmpqCSohb1P+I1cKf35s3YC3f1KUbHPRc12cvp/jW9ovQjGmKrSnQtVfuGZN1NxT9QEfgpeeWYoSSipAC0E7/f/+/ULHJhok5vh/dk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTTcM4s6Ji0Utjr0dht4ziVtpMpxugj+18avtr5sMyE=;
 b=VvacmCvvT8406mB2vjJVLXE/iaYNTKF3QJCF7aC3WYLcm8tUszVb2YIDWmyzM9KF7DJpCfaOEoHN+KKXWFYamBLrUXiFkpQ2Ngjm7LFticnkKmq8l7fkIsMWapvoAQIfElc2rh01kc8zU0XfY9nE1UA4fNd4n1mbyypPi0kJiLTULjZI2o1mRuBbwG1upR1b9lJIZqOmcJwnVpCCxtweknXkuRum6iIvw1BXHOFcAi0T48HlsgrWzM5InktK5lwE9GyQwgL1d3NlqpWat8SSiPChFdWkWstB/JT4UqzIVP2nSGuetVpY9iNXfBOJg1MTk1pD4SZFyUP4zGSL9GwNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTTcM4s6Ji0Utjr0dht4ziVtpMpxugj+18avtr5sMyE=;
 b=hS6NPc/dRBVO18o0ZT4UHZ9BiPNARLkTUpZ93SoUdiQ/AOoNxUBX9dVS0PDgs3Xm+KiwopmcmDKbW80jsj61+WqZnhO/31eFEkZyZdWyjHGUfWyzecIXEkmudrIZ98hKpUS1fBvyJIHTohvQRp0KT1Ms3r/rW22zDatLqI1uipM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH0PR12MB8464.namprd12.prod.outlook.com (2603:10b6:610:184::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 15:00:34 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 15:00:34 +0000
Message-ID: <8ce9306a-fdee-4a6a-b4da-87e00e807a37@amd.com>
Date: Thu, 27 Feb 2025 09:00:32 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Check interrupt register before
 mailbox_rx_worker exits
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org, quic_jhugo@quicinc.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20250226161810.4188334-1-lizhi.hou@amd.com>
 <41667dcc-b57d-44ff-99cf-5a91dbec1e56@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <41667dcc-b57d-44ff-99cf-5a91dbec1e56@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0164.namprd04.prod.outlook.com
 (2603:10b6:806:125::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH0PR12MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9a52e6-a9fa-4b71-a077-08dd573f7c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0Q4UUMrRVU4OGVlNVRwZFh3SHA2VUg4WlJQSjE2ZlhWUGluTUtGdEdwbXAx?=
 =?utf-8?B?cVI2U2dZWm02VHdrK0hibURXZ0Z3VGhRSkViRFJkRnZhZ0hvYmhHcGo3dU5x?=
 =?utf-8?B?UnlxbC9pNUVKY3gwMmF6bnVXVWxRc1NFTTBHekE2dllnelhoTzlnYWZVdnZO?=
 =?utf-8?B?empaY1FnRlc1MHBmQ0JUem9nZ0QrT24yekpmOWs0WjJKaHMxTTZ3MGpWT3Vy?=
 =?utf-8?B?WURIcG5iN1VnTWZieVNpY21UWjRaWWRHd2tWOXdXL3dYODNzQ3hLTktrN0M1?=
 =?utf-8?B?UXE3dGZ1Y0x6L3JjSkM1M0RVWVl3WWszaFAySEc4UlFzSGFBWkNqM21IYVdw?=
 =?utf-8?B?czl5aElacElJYXRmQ0RNWDc2WEZvcGhpaU9rQ1YwdFEzRmY1T2x1SWl2c2lT?=
 =?utf-8?B?WWNBL2dhcWx6d2ZieDZkd3R4QlVTWmxyalQ2NGwxMmV1d2syL1VSdDEzQzRi?=
 =?utf-8?B?aGhDd0JqSHUxdW83TjExcDdZVU5LbzRzR2dRd09qNHFDVmVxNGtMQ0E5QTlO?=
 =?utf-8?B?UXhYQjBjK3NwZ0dXcU1UV3o3bkMveThyUDlVOVJLVlR6dmxhQS8xZVY4a3J3?=
 =?utf-8?B?VFZsQU5NR2w2emtZN3d0QWdWR2pLS2I4anhic3R6b1ZNSHR1TWl3d1dKRzMw?=
 =?utf-8?B?dWEyMHFCTndGaFU4bXJzRENucGFvRmt1UWV3Wkt3TWQxbnFsakRyK2k1eGJZ?=
 =?utf-8?B?SmwwT1RsWkM3cGtNNkxuMWZMM3lYNHB3aEY2a0pYbmgxZW5aM25ZMFV6aHZm?=
 =?utf-8?B?K1NsWG1oM3dXQ3ErUU1qaFNzVm5BNnFSQkc2Si85QzBCZzMrZ3hBZEVsdEx1?=
 =?utf-8?B?NGUwTWhFVGpiSUVZUnVHdmhKOFhqM2FsK3JiNWcyQ0pPZ0JaUWFsS3M1SUc5?=
 =?utf-8?B?d1Z5WjVPbGRzTlFCTnFiN2RLTGtiSFBQNFNtdm1vSHlhL1cwaTkrZDNOVGVK?=
 =?utf-8?B?QnVnUFUvQ09oMjdjRnBpblc5OEh6T2hEWkEvVktkZklyUzN3NWU4OC9PYVdM?=
 =?utf-8?B?MCtYZURUczJwVmh3WGxydjFxbUhJM1kyT3QyMmxQN3RWaSsrc2J2WnNaTmpB?=
 =?utf-8?B?NHF6Uy9jV1I2bzJSUHYrYlYybUVjOVFRaVFCbWZkQktlY0xQOEJ5aDZuR1Nt?=
 =?utf-8?B?cTdGdG9zU25EVDBpWndVQ0t3T3pSYjNTYU9FcE5XMUxKOVpjYXlRcklWVFZK?=
 =?utf-8?B?T0NJVGRSRnV2WURZT1N2Sk5mdTZIbkdLMkE5SzNxZTdRYkFkNjdKTUcycGU2?=
 =?utf-8?B?MHEwTUdsVjJFcnE2TVJ1WHkrSHVlOXJnRmJlTWc2Ri9aaENWSkFwYzZTTVJY?=
 =?utf-8?B?NWxRdTR0Z2tSMlcyMTFqUWZyRlp4SVMwOXNaaUx0dC9yTlFxdW1YSzJOM0o4?=
 =?utf-8?B?Z1NYN1V4TnhIdUllZWMxV1BaR01FU1JSV2pMZE1ueHpFbkJEZ3FxV3pBbHVU?=
 =?utf-8?B?N3Rqay84eTh4TlpHSXFKTUx2Skt5KzVObldiRDhzalJnTndjTlpuN3g3QU1i?=
 =?utf-8?B?S3drWXp3WjQxU0hiTHo3MU9MTHArQURDNWVCdk0vYzRLTW1hc3BJSXo5ZzB4?=
 =?utf-8?B?ZEp0NDNxUU11OG4xRUx5VWoraGg1cVRhanJRcnFLR0dxa1JHT1pmWU5LZlgz?=
 =?utf-8?B?b2xhUG9LZFY1ZlgxT2laR3BMM3pxOWlkUGhjc3ZxSDc0RDZTSHhFcEhGcU9V?=
 =?utf-8?B?Q2pnMlV2RkZ2OEx3enNVUjVDYkhrQy9McDBqSDRTNGlBMlNKOFVad2F2c0RU?=
 =?utf-8?B?ajNpQWpuOUpqclppYmhqajRuQVBTclE0ZHVzb3ZJdkxBcisrV25iaUYrUEZu?=
 =?utf-8?B?ZmZrejJvZDhWS3UxZkZlTlpXQTE2b3pac2hHTVhTTVlLZkxldW1kOW0yZ0hz?=
 =?utf-8?Q?bVLaognUmrCbd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEU3b0R6MFFFSXEwdFk2QzY3UEJJUTdHY1g3cFhjVFpzdndHK2FPcmpNbWdB?=
 =?utf-8?B?ZTlFNlpDOU1xb0pBWVllYjVndCtlYUU0ckUzenRraUFSNFdybHZqL3MyVE9x?=
 =?utf-8?B?WVFnaGxjWjJxaWdBdVowZVgzblpGSUlnZHNscnVuRjIvbkFwMWw0VUZDcThC?=
 =?utf-8?B?ektaZnNFL2pKcFQ1Sm5yNStwempWcXUrTjFpdDBKSVNlbm9YaFJIaVBMcFN4?=
 =?utf-8?B?enZmTXVmYk9UTGhnSkVHMFczTXRaUlFRdUczSDJFdUNFUG1UOTdVQnBlSGlR?=
 =?utf-8?B?akpZbTVlemR5a0tKNFk2VlI1UnNBcGdYc2ZVV29DZmpoTVA2SThCSDIrWVFw?=
 =?utf-8?B?WkJ0V09neC80QW94amorcE1rbEUxYkNrZGNhQ1NtdlYyOHU4UkJVbEpocW50?=
 =?utf-8?B?UnBjMWRnQ2lnVnMvR3JwRTB6R2dmakd2K1hvQnVqYzhUWDlWbUJuNkRpQTlw?=
 =?utf-8?B?c2hwT2xvcjJTVmwyclY1dUtsVklvRUNhdkxKdGZlWXBRTTdlQXpXVndyM2F1?=
 =?utf-8?B?cU5aZDlNT3FMbzZURXBBcTlNMzhhYjRwRW9UTGZSY1NuRkdEOVJLbG5oblNM?=
 =?utf-8?B?UTFSV0theXg1RG9DRnd4QmtvNnA4ejB0QmsrYUZPTEg5MEU4bEt5Q1FXRU5H?=
 =?utf-8?B?Ti9PcmNQdXhrUjJpL3dtUUdhYWdBOGwzdU12MXVLbFhIU3BHTVQvcTBscTBM?=
 =?utf-8?B?K3R5ODE5ekFpMzZXcUE2MlgzMkNLWml0YjVac3FXdGs5S3hkOVNRN3NpNWpr?=
 =?utf-8?B?dzRVVmpOZGp2TGRRUGNkQnZSTkp5MVJ2Wnl4S0VRZzFHTXdiNDRLeGFaTlEr?=
 =?utf-8?B?YWVIczlFaVZRUDB1K1pMRlVCZS9kWHVRWm5WdWswU1BkUkUwYmVOSW1ScGk4?=
 =?utf-8?B?N2E4R3JhZ2tLczYyM01jMFQ3b2d6Q1l4bnlDS2YzdHR1ZUVjMzNaZk9NNmdQ?=
 =?utf-8?B?d1VGNWxhYjYxandBeUpDbm4zZXUrMHB2dUU0ZHlxdnNvbTRMVE5id1FNREh1?=
 =?utf-8?B?Z1JIUUtzbSswdEkxMmFBTHFjbGYzNjZPTzVYejlhZ1hGTXBubVV0Y3N2cmNV?=
 =?utf-8?B?djczRTRoajFYV3pZSUEwUFZFWVcwVEhCMDVyUkZQUFJiaC95SW1CZXZCeDFx?=
 =?utf-8?B?cVFtMDNtRUxaTDcxU1dseExkSi9tMzNDLzJHbzFWbTZ2UnpLRERkWFJubWw3?=
 =?utf-8?B?OWJ6NGVtYnZWemZSWHhwKy9yc3h6VlQ2Tm94VFovcXNPOGVyNlRGaUx4Y2Ju?=
 =?utf-8?B?WkF5NWxlQ21yQ1BWUmM1Z3pRNHVua2xSSitaZHg2b1dMSXIwWTYwaUIyc1A2?=
 =?utf-8?B?TjJHQVBKL0FjY2xWTFVXT2doSUtqcjJHMWJjR1d2NHpRNU44SFVtME1za2Vm?=
 =?utf-8?B?ZUd3MzhGbkpMdkFLbTVjcDNRS1l6cDc2ZnZ4UW1JMERiSTBiYjZmejgxWmdo?=
 =?utf-8?B?YkhzR0paN1RoUjEvbCs5UTlmdDluV3VzWEk2UEdRdENyT08wV2RuOG9OZFJC?=
 =?utf-8?B?czFxSWxoQ3VIS3VvT3dJNDB6R1FVM21ENllsVmt0NG00Uy9pNTlIamxkV3g2?=
 =?utf-8?B?NDF4ZFI3S1VRUTc2UzRjdVAyUUFZMWIzc1NTSVJZbmVoWHlZV0VCUmpXMVk4?=
 =?utf-8?B?N2JjMndTMGthY3U0SkFJNVo0MWVVNkFVd0N5MlZnMzNzNlc5YzNxUytUVmxr?=
 =?utf-8?B?L2ltbjM0T1Z6L05tNkdOQXZ5YWg2eTBpQStrVTZnbFQ0SWpCalI2Tzh5azQ3?=
 =?utf-8?B?OGhad0NnRU81d1NDTWdHdXpNTFo4dWoxYkRkTmgreWl0REkxT090QlhoKytn?=
 =?utf-8?B?Nm80eERvZHZhWXNGS0tzcXZVa0hvbllkSm8zdU1QMVJSd0tHT3M1aVR5eVdB?=
 =?utf-8?B?QmVMREtOQkFGQlZuKzlwVnYyMjNoUlp0YkJ3QmZtaThwaEUxcmRtaUQvR25a?=
 =?utf-8?B?Z2wyMkVMSXFmUCtEa2ZWUUpVeDhEN21RNjRRZi9LTnM4bEhvaEh5OHgrZVor?=
 =?utf-8?B?bmc3d3RtbE5qRHNOTmxTQkJ2YXZNMHpLSVhtWXVHSnZLS3pZQVZ2MWtZdHJh?=
 =?utf-8?B?YVFZQVdVWk5VNDdiK0NQVTEweithQW1EcHpIK3ZEc2dGanFFRTdlaW1Ld0h4?=
 =?utf-8?Q?Tb49WVkjD1BJ2eh5a3d7FHlkc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9a52e6-a9fa-4b71-a077-08dd573f7c6c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:00:34.0109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zznF/rAMsts8UuH+mE0emNMz/sYl6td21FRFoBdvWQJ+PSvR495Yz25w7wa4w7mq9rmAhW8t5Knx/abs8HxM3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8464
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

On 2/27/2025 02:36, Jacek Lawrynowicz wrote:
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> On 2/26/2025 5:18 PM, Lizhi Hou wrote:
>> There is a timeout failure been found during stress tests. If the firmware
>> generates a mailbox response right after driver clears the mailbox channel
>> interrupt register, the hardware will not generate an interrupt for the
>> response. This causes the unexpected mailbox command timeout.
>>
>> To handle this failure, driver checks the interrupt register before
>> exiting mailbox_rx_worker(). If there is a new response, driver goes back
>> to process it.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---

Applied to drm-misc-next.

cd740b873f8f6 accel/amdxdna: Check interrupt register before 
mailbox_rx_worker exits
