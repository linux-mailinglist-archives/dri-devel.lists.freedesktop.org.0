Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ7iHcyUmGlaJwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:07:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD4916993A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094A910E819;
	Fri, 20 Feb 2026 17:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jTkimtKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010067.outbound.protection.outlook.com [52.101.46.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5879E10E819
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 17:07:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzWbMtiNCGgmhqtWXe59RBichdsKp4SQWQScbEiDuTBPE0LbTsQbWugF0WkXEt/1u82LuEDU3o5P7atd2nY4NJ8wAydcHM5GveH8WIW+9RtGYVp0LDNJZPcw4/UT1JgBzDeBwH6hHHm44fy4R5mqG+0sXABNZeSBC1KdWy9UqGiOJFOtL7OB7Qb8AN8rjkG4QN/1LjnW7q3fziSrp4i9Qnze7Y7BkBlgEPL+RPI/7zaGhHYYVDXX6A3jtlpC1ZOG0tNZytzRTJX0lC6lj+1wdv6io5upE7M+nHOJmEZUYQqi7cwbIN36BZ5GG67zkb13NauisDUJ73JaX3BHxhhNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yz0LjvUBRFwvJz8urzampjWvtTAcCO2GPArs9m4LzRA=;
 b=bWBMGF7FPcvcUsAMwTm/Hyu2AHZzLEzjYVvp7Jol/VdvV9vo5E70mRJdkbDF4Tk+WxOcJHAc3bT2D8rmrt+cyQMk+VptF6XPNDzuJPwC4QsayB3le/OJfBdT8zHKwtKK2lJFhUjY1dwxhtTVMrIq4KlBg8xRlc9VBV+BjS3iX6VQxGC4OzJn8e4tA9lOHFR2QuxmXFU8EMcOE3E2zhfGF1xkSr4oCkItSxBd07IWZ8GT9UtQQHWLX/ZOjZ8n6RF713dzZ8VVHdYbySVzDqhSE/ydPSK2ctkKy6x9HCbfL69pQ1gDsh+BTfPx5OT40RIVbhcDGcK9Uj+g1XmxHjBoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yz0LjvUBRFwvJz8urzampjWvtTAcCO2GPArs9m4LzRA=;
 b=jTkimtKYrzW3SqUdhuKgluShmtrorOUtythVpjmku2kRb9ogS1wA3nf/bB70neAjX+ANHUGfER5DoL20HiGlD9lsXneE/kayP8slK1XTbZR/Kd4IMFVeN9i1LrtPEcwBHVrrj6zrjmbsEWN26IaA7V19w533X7GkJn1aEIHVFNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN3PR12MB9570.namprd12.prod.outlook.com (2603:10b6:408:2ca::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 17:07:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 17:07:16 +0000
Message-ID: <c61bde06-51fe-4909-b9e6-5edb619ad031@amd.com>
Date: Fri, 20 Feb 2026 18:07:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/3] drm/syncobj: Add flag
 DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
To: Yicong Hui <yiconghui@gmail.com>, michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20260220022631.2205037-1-yiconghui@gmail.com>
 <20260220022631.2205037-2-yiconghui@gmail.com>
 <d27ae98b-b401-4110-b233-a8da2dd3de05@amd.com>
 <9b952d44-6fc6-4594-9e16-78d529290c9d@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9b952d44-6fc6-4594-9e16-78d529290c9d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN3PR12MB9570:EE_
X-MS-Office365-Filtering-Correlation-Id: 4195be1c-b4ac-4851-149f-08de70a27f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NG9aQU1HTVdndjFPS2FSKzBQSDNoazdQTzV6cGpvZmhHdGw0ODhWSkR1NjU1?=
 =?utf-8?B?Tk9FOHN6d2tMYW5hc05FVk55MElPYnVtZlhNNTJQT2liRjhGMHdITG9zSnpz?=
 =?utf-8?B?Z3Nuc0dHMEFPVm1xcTU0blJPaGdueGFad1RpUEhsUE8rTzluc3BocVJ3UE52?=
 =?utf-8?B?SmtNejNUNGVMUEEwVkFkTDc4VFVjbHl3a2ZncVRVbGU4K2xRcVRESmtlSnJi?=
 =?utf-8?B?ekU0cHliU1VSVnRYemRkWWVoUG1XeFh2U3NQYVBIRkYyY2NyTEZuT0NETWNm?=
 =?utf-8?B?VUxvdVBwYzRIU2pXdDBCLzFLMm9ZYTZheXM4WWRZRElVRFZhaVNiRW5rWEdz?=
 =?utf-8?B?Z1J4dDJkc3NTK1BXdUZERjVTcG95Q2tlYWUvanR4RktaakdycVg3QlF3WDQy?=
 =?utf-8?B?Z0R3OS9KTVlRK3Y5aDhOc0RUSHBuUVZ1bEwveE4yTHpoNFpiTkd2c0UxUXVD?=
 =?utf-8?B?bnFJQWZqdExYZzZlWU5JR0RCUGwyWitqSE1uZkJ6Nm1Qb0tBdXZnWVRxS3lv?=
 =?utf-8?B?ZnVCRGh3RUJkSy95cDRxZmpkTlZWNXcwa1hnMHJMc1NUWTFYaW5NVGc1Y01i?=
 =?utf-8?B?ZTJNSjlzMkZVWDlKV1pYb1V4Nk4rbi9Pc3lFSFUySUlDWGhOaE5KL1hlVmxr?=
 =?utf-8?B?NDJjQ1pyQ0YxalUrRFd2cS8ybFQ5MHp2OXF0L3BLc1lmWEN0KzNwc1Y2MnR4?=
 =?utf-8?B?STFleElOakdhT1BzT1NmcGlKbGhSKzZGNWE5NkxiTFhxWlA4K3BzcVRjZ3Jo?=
 =?utf-8?B?OWpObnpXcFdCQkc0ak84YjZEdm5IQTN6MExJOGJnU1kwUUxLSDBUVXY1UEcv?=
 =?utf-8?B?SkhnNDl6bU9JQjRoUTJ4NFdzdkQxQkJyakVodXhNcThkbnpUTVZJM2p6Z2pp?=
 =?utf-8?B?d0xjN0ZsQTFrUWpJOG45cVA3MFUzMFRFT3JiUmlRcEVKV2dmN0NEcTExV250?=
 =?utf-8?B?SW14MTA5LzhLbTBpNmJ0MTJyQkcxMDNCYlk0MmV6Z3plT3R1YVFrQjlmdHFJ?=
 =?utf-8?B?N21TYWJmL0JlSk8zUEhSbzkyMlk2OW83Si9nUVFaN0F1Y0dXZkRNZnQ1MWh1?=
 =?utf-8?B?TWs5QmJ3c05VSWNPUE1NK0xSbmJaOTlPYncveTVOa2FnYUd2dk4yMk5kTG1S?=
 =?utf-8?B?YmdhcW1OaFA5VG01QVY0dWE0Snd3cFJWSks0bzMyTVdEQUMxWjVYRGNRdWdN?=
 =?utf-8?B?aVlWcHRhR3J1RUI2ZDFSb01vRXNzNS84N0YrNllyVkJhU1BLNHVqcGZHRFFR?=
 =?utf-8?B?NXUvTkI0ZUdJSURnTHRjSmQ1L2NpSEtiWDlKY3ZsUFZoY2tnMmlIMk16K2Z0?=
 =?utf-8?B?NW13enNaeXg1TGEzSFNoVitsTzBWcnhNNElJM3J5ODV0R0VZMnY2NlovS2o4?=
 =?utf-8?B?dHVKUmFiQTBNUlk1QUdsaE1tcXE1ZXd2Vk5DN2JiQTNmZXIvL3Y4elJ4SUdo?=
 =?utf-8?B?SXRCeXV2VFVINlRSNWdRRGplREdoM1dabm0vUVpVSDVmdDk0dXdwS2JVTGRG?=
 =?utf-8?B?R3puU3ZHbXJaWlFFbE1wNWxYL1VrTWZramRZcmhGRlRKdHNWMEhkb3d0ZWp6?=
 =?utf-8?B?QXdSRnMwTytneFpqWTZTMXEzUjBQemhEc0tleTI5T0xibGU0cHpFM0IzdHdH?=
 =?utf-8?B?U3BVakxBMVJTRzFHTHJaVTF3bm4zbFpDSmpJTjA2aStJb1FaN2J3bStxbjFL?=
 =?utf-8?B?WnVRODRWSGZGM000WG9Nc3I2eWZUZzVOR0FSMitoSzVoWVhubGZqakNiQXFP?=
 =?utf-8?B?RVJqRHMzcUs5RDkySXB5RzVCbERkSWczYy84YlJHbGtDZFBVVlR0OFpwKzlj?=
 =?utf-8?B?K2J2blpleG4yOGFsUEFnOEc1TFNsUzZIZlF2WlNnU3NaQ0xLQkRCUUF0R3lY?=
 =?utf-8?B?b1pXYnlUV1RxRGY5Z1ZRRXlvVXJ4TnJnSnV4bjFsRERUVStvZ1kwVzZ1Q2JH?=
 =?utf-8?B?ZVo4UlBQWTRXamdLUEVzQ09idTJPSTBCVCtMc2Z6eml3b1ZNbDQ3UFY5Nng0?=
 =?utf-8?B?dmhIRFNCMGtIU1lGYWRFSW51RnVmbThUeUtWNVlJcGxGWHBBTjJJTkZJVzcr?=
 =?utf-8?B?dXFHdWRpRHJQaWpsNkJ4d2ZrQ25yeVEyQzY5bjlhaFdkWXU0clpLV2E0Ujg2?=
 =?utf-8?Q?YDsA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWwveXBNYk9kVTNhNXJTQWJMT0ZCei9mRTJKUGNOaFQ3ZFkyYTlzR29ZTnlt?=
 =?utf-8?B?S3hwVUJXQmtPbFBvRnFVM01BTmE2QjNMbUJtRk8wd0x0aml5R0FpZ28rWjdv?=
 =?utf-8?B?cW53QVdUditrSmpaVitZWnVaRytXemdJSitoalJ2YjFFR1hPaGJQMFN3MytN?=
 =?utf-8?B?MHVVcWd6dWZSM1Bka3g4dGRQaHYrTzZZV3hBdDM5L1Q5MURySjAyRklhN0tB?=
 =?utf-8?B?VDRzMGtEZUpYcWFMR2l5MzlqcVUweFhtaDdKNG56ZFNUZkExYytxU2NHTVF5?=
 =?utf-8?B?alZMQWdVY2NzWGJncFdVRTBXNmgrQU9MMGZ4d243MGdNQUxxVGxLcjQ4SGpL?=
 =?utf-8?B?RmZIVDlDOHFwWTJyTmlEbG0vRFg1a3lKZ3h0MGpDSVliazBRWEFUdXA4K3Fm?=
 =?utf-8?B?M1o2UUJKSmxRYWhFQ0V4M2VQYUIyZ2hnVmNjQnZVUTBodnltMHNPS1FkVFhJ?=
 =?utf-8?B?Y2x3T1hFa0lvREt1amxDS3dSM2xVQURubHVzbEFhYTE2bzdHS1VBeDU3Vktp?=
 =?utf-8?B?dW1zVi9sMVpwVlgvOTU1UTZqckl6T1VSSjB3emN3SngwQUpnei82TGZYT29H?=
 =?utf-8?B?QnJxeGkwQ0tnZ2xWQktXdFVLSml0UkphTEgyMXByR1pJNks4a3lCeXhJUFF3?=
 =?utf-8?B?cVBPaVFjNStPa3QzVkZaOVBjMGJVdmE0UVgraWgwNWNMeUN3T1orUm52SzRv?=
 =?utf-8?B?dSttNzlSYWJhWlNSYlB5L3lVNHJDcHpYK1BsMC80ZVBPL25SNTlVS1AzMGJa?=
 =?utf-8?B?eHorTUNWWDgzanhJbWE1ZVpBMW54N0RuV1dkS0hNR0RnMmFJQWkvWnFYY21m?=
 =?utf-8?B?VDFwRjBkeG5IZ1VhekxSbzRrZW9GOWhMTXdORjlvU2lNZklwSUlWL051Rk52?=
 =?utf-8?B?dUJtR2hrRDJOU085dE1hTXpvZkhVdTBPd2w4T0crME9ZUmNTdWZDNGZ3V1Q5?=
 =?utf-8?B?c1d2VlptL2JPWEtVUmhvZTErMlAxTzhpWkkwK1BHTmN1ZEVMSSszNGJvQ2R5?=
 =?utf-8?B?aGR4UVlYeWNTSjZhc1NDQituNkV2T0RKV0RoK1RZN1lQNWJ1Wm1kVW1kQWlC?=
 =?utf-8?B?cVNJQlErVFgzNFFjcDNFajg5SGpMZTNyL3RlQ1hnRzNpMXNrTHhUVjNIbXBM?=
 =?utf-8?B?ajJ5NVAxcHRhVndJOEswcG9Vbk5nakdpM1BaSWxyVDBSaVpQNlFPY040OUdl?=
 =?utf-8?B?QlFZaHMzaTFKQ3U1SmNRZ3pwYjUxMVpPallnU3dvVEhQWEs5b2o5Rkw2ZzJP?=
 =?utf-8?B?NGgybmVPZkUwZmRPZ0VTM0JBQWo2aUxxVWRiTjhxYTJCY1BzTXBZcmdTa0xo?=
 =?utf-8?B?NE9UMStUamw2aFdQRHVUL0NjelNWM0NLVndVMjU5amlIeXMxbVBHWnd6RlR6?=
 =?utf-8?B?RzhnOUxNU2FpREkrL3ozV0Q3aHp1b09EaXBEVWJ5alZrL2NkWGkrYUJSNjQr?=
 =?utf-8?B?dlNhUEVmbGpwVzUzT1hJM3hvdkNYNHhRMW5KVXloQU5mbFJiWWtCRWMyY0Vo?=
 =?utf-8?B?OXpVdGFERkg1Q2dScXhtR0cvb0dmMFhhRldWeFFmZ1JadmlBOVUwWlJyVU9n?=
 =?utf-8?B?ekxjaVNGOGlTS1I4K3lCdzhqTmplODkwQU5xL0o2NnJvdjlwazRXM2tkbk4v?=
 =?utf-8?B?ak5iTFY0aWlTV0ZBMmZKNmwyeGhpMFYwZVNwYi9pT1FCSWp6aW1vTHpPbkkx?=
 =?utf-8?B?ZHRNMStjQUo2UUl6R2ZHQ3ZGZm1XRVZwS3JhMGZ5M2pmQWpvNUt4a1RKeFpu?=
 =?utf-8?B?ODA3R3RnN3ljSS94cTVXeVhmZFp6blpPOVlHNUN1SFFkWEhmL1Z6WmJ6Tmdy?=
 =?utf-8?B?UWR5MUhNOGdkUWdJTVJxME9obWtUejdsYTBnTjlpcXdmNkdWZFBkcVNBN1NR?=
 =?utf-8?B?Y1hVVjI2cCs4RFlsQUJReGhTVlU3ZUR5d1MxQUhzR05PaXB4aktUNkNNdmhu?=
 =?utf-8?B?T2pCZlpBSU5Qbk52ZTlqWEoxWE9oS1d4amNBS05ZN3VJeXIrWnhORHBqNzJP?=
 =?utf-8?B?TW5CSXJ4TERDWDZtSGhMUzRmQWgyNWNxcGVqNjBmU0JnbndUWEVaK28rRUwz?=
 =?utf-8?B?Ykt6azFSMWdJeW4yVXp1L0x6Z3RDaC9NUEloK3g4ajNsYTlEVisvRGVBY0p6?=
 =?utf-8?B?VnlQc3pteEZBSWtqNlpIQWR4eVpSTUtrcXhDam9VQUhFSUx3ZUJ4aDRHSzVo?=
 =?utf-8?B?WWJ6US9DL242SzhwYWh1dGRSRTAvNzZJTlNUN3hhcTgxczRXQ0NDWkM0TU1u?=
 =?utf-8?B?a3pDdEZSOGs2enp4Y0kxUnlQUE44a0c5OVRMbXBFeWFOR1FDdmZrR3FXcW1y?=
 =?utf-8?Q?pO9K1CsNkp0JpjiL94?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4195be1c-b4ac-4851-149f-08de70a27f7f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 17:07:16.4409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYhzI7UWfI8krbdUVczoYiQ7cYSxqkJHqv5ReACTSN9xCviC3GUlcX85W2oJUhiz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9570
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:yiconghui@gmail.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CCD4916993A
X-Rspamd-Action: no action

On 2/20/26 18:05, Yicong Hui wrote:
>>> +
>>>   /**
>>>    * dma_fence_chain_find_seqno - find fence chain node by seqno
>>>    * @pfence: pointer to the chain node where to start
>>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>>> index 2d4ab745fdad..322f64b72775 100644
>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>> @@ -1654,14 +1654,17 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>   {
>>>       struct drm_syncobj_timeline_array *args = data;
>>>       struct drm_syncobj **syncobjs;
>>> +    unsigned int valid_flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED |
>>> +                   DRM_SYNCOBJ_QUERY_FLAGS_ERROR;
>>>       uint64_t __user *points = u64_to_user_ptr(args->points);
>>> +    uint64_t __user *handles = u64_to_user_ptr(args->handles);
>>>       uint32_t i;
>>>       int ret;
>>>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>>>           return -EOPNOTSUPP;
>>>   -    if (args->flags & ~DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED)
>>> +    if (args->flags & ~valid_flags)
>>>           return -EINVAL;
>>>         if (args->count_handles == 0)
>>> @@ -1680,6 +1683,22 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>           uint64_t point;
>>
>> Make a local variable "int error" here.
>>
>> ...
>>
>>> +            int64_t error = 0;
>>
>> The error code is an int and only 32bits.
> Understood, will change that!
> 
>>
>>> +
>>> +            if (fence)
>>> +                error = dma_fence_chain_find_error(fence);
>>> +
>>> +            ret = copy_to_user(&handles[i], &error, sizeof(int64_t));
>>
>> The handles are also only 32bits!
> Ah, that's my mistake. Was thrown off by the __u64 in the struct definition but it is obvious now that it is a u32. Fixed as well!
> 
>>
>>> +            ret = ret ? -EFAULT : 0;
>>> +            if (ret) {
>>> +                dma_fence_put(fence);
>>> +                break;
>>> +            }
>>> +
>>> +        }
>>> +
>>>           chain = to_dma_fence_chain(fence);
>>>           if (chain) {
>>
>> In this code path whenever point is assigned something do a "error = dma_fence_get_status(fence);" and then eventually copy the error to userspace after copying the point.
>>
> 
> Hi! Were you thinking something that looks a little bit like this?

Yeah that looks like what I had in mind to.

Thanks,
Christian.

> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 2d4ab745fdad..b74e491f9d8b 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1654,14 +1654,17 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  {
>      struct drm_syncobj_timeline_array *args = data;
>      struct drm_syncobj **syncobjs;
> +    unsigned int valid_flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED |
> +                  DRM_SYNCOBJ_QUERY_FLAGS_ERROR;
>      uint64_t __user *points = u64_to_user_ptr(args->points);
> +    uint32_t __user *handles = u64_to_user_ptr(args->handles);
>      uint32_t i;
> -    int ret;
> +    int ret, error;
>  
>      if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>          return -EOPNOTSUPP;
>  
> -    if (args->flags & ~DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED)
> +    if (args->flags & ~valid_flags)
>          return -EINVAL;
>  
>      if (args->count_handles == 0)
> @@ -1681,6 +1684,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  
>          fence = drm_syncobj_fence_get(syncobjs[i]);
>          chain = to_dma_fence_chain(fence);
> +
>          if (chain) {
>              struct dma_fence *iter, *last_signaled =
>                  dma_fence_get(fence);
> @@ -1688,6 +1692,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>              if (args->flags &
>                 DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED) {
>                  point = fence->seqno;
> +                error = dma_fence_get_status(fence);
> +
>              } else {
>                  dma_fence_chain_for_each(iter, fence) {
>                      if (iter->context != fence->context) {
> @@ -1702,16 +1708,28 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>                  point = dma_fence_is_signaled(last_signaled) ?
>                      last_signaled->seqno :
>                      to_dma_fence_chain(last_signaled)->prev_seqno;
> +
> +                error = dma_fence_get_status(last_signaled);
>              }
>              dma_fence_put(last_signaled);
>          } else {
>              point = 0;
> +            error = fence ? dma_fence_get_status(fence) : 0;
>          }
>          dma_fence_put(fence);
> +
>          ret = copy_to_user(&points[i], &point, sizeof(uint64_t));
>          ret = ret ? -EFAULT : 0;
>          if (ret)
>              break;
> +
> +        if (args->flags & DRM_SYNCOBJ_QUERY_FLAGS_ERROR) {
> +            ret = copy_to_user(&handles[i], &error, sizeof(*handles));
> +
> +            ret = ret ? -EFAULT : 0;
> +            if (ret)
> +                break;
> +        }
>      }
>      drm_syncobj_array_free(syncobjs, args->count_handles);
>  

