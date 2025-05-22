Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A5AAC0CBB
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9BE10E8C2;
	Thu, 22 May 2025 13:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3UWzb7RL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF21A10E8C2;
 Thu, 22 May 2025 13:28:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1TR+GZqN2Q58mDagFfOIs4Bq0WkjpLR6KW+bgOD0PSNh6zlHlzgXyx2D79Y+K7IaoZGjlCINQj2WVKB3jUSO9NLzXVBEfNoc2MYbVnOxzXq/2s748LGgN9zx6Qur6SpO84AfCig8e7OJYRWO3j1eF6ZXBO6YRxv81MLFqD926pqt8sf86uPw32kXjk7igF7UwoNTloRiplLDmXQeNKa1XD9Wl8VGWtpxV2ghyi+byA+KpqHjWa4qUo7oREojTZAz+9feasj3RPqN1MWxiOJQbTaMnw2hAAdsX+xxVwvFyAp0TDpWcNOUtr8sA3HUTjbZZcLDk7Xx8EFr8YR7VcQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kwpEZ6fHJQsP4qrlLei6miXZY3QAPTYEdpZfm0pkFo=;
 b=aaB4DoO2rLE3ecBYXKNZwa4vUh+G6V1fz26KAS2XYM9u83KY5qbFNLOB6xVDC75SpfZxrJ4dFnnL7OMS5KYKzO7l7qy6MY2YKgckaYNtHes0EMjca8qR1Nia/utPr4pGxIgX/u75mA1nduqf6jxHOfnpeDdPZrMmMIOswjq+qKeyzL+ndpnWuuPAWeSmdcddC02SBqYHPfRjcDdvFCNxYXT3+u2gY52sMnZXDJSz/7QF+Yqm4VtgJCgc+/6fQOvtjGewkbPII68hpusXENmIc8c7sqy8Zyp1PagMmK/8PBXW1XQ6v8v8APY2st5j38M09WVkOh11qQTE0EyAkmXBKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kwpEZ6fHJQsP4qrlLei6miXZY3QAPTYEdpZfm0pkFo=;
 b=3UWzb7RLp1S8/VHKqmNxK4vQNBfBibTbt98vDCMUwdJ4Jfx05yladV+s79QRTZjEnAYtSqc56yyFXKtbBvDD1UozhR2vWyzU6oVpWQWC4I3uCsgLowoMQfPzr5UNNsbySzVnZMK8MTF08oLBAnCSQISlYQZynuEAQFpaqY1X70w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BN7PPF02710D35B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 22 May
 2025 13:28:07 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 13:28:07 +0000
Message-ID: <d1f0e3ac-a030-4763-a112-adca30e9ab08@amd.com>
Date: Thu, 22 May 2025 09:28:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>, Simon Ser <contact@emersion.fr>,
 Alex Hung <alex.hung@amd.com>, Misyl Toad <misyl@froggi.es>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <o4MtjqyDUjuFR4Y9Q1IEZlvVQ7Nkggq0v-KtBcH0aM3pTvEq8UcSoUDxefSBVdTmLj_1_a6GmbjU_mRSFinOb44B4bu1u3mMIckuQhhZWCc=@emersion.fr>
 <3bbd4bd7-7217-4a14-b7bb-383226f44f55@amd.com>
 <CAPj87rNUDdDEopPH+iAF-a=Or6eXH4cMRU8eOj81g_40cq8gdA@mail.gmail.com>
 <f7e9cd32-3e2b-4f06-aa13-049c8b7ba29b@amd.com>
 <CAPj87rMbcZKy2ARe_tp_-+-tMu3FpS0C9R1BHVzjsUpOsU9M4g@mail.gmail.com>
 <5921076d-0150-4e0f-a3ef-1b8dec021630@collabora.com>
 <CAFZQkGymi1XY7m0Ghs8R2HaNRQptE_0NO-5J5Z2c61gDJRho3Q@mail.gmail.com>
 <63e934e6-3c27-4128-801b-f1189f12f8f0@amd.com>
 <20250522105741.6aafc955@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250522105741.6aafc955@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BN7PPF02710D35B:EE_
X-MS-Office365-Filtering-Correlation-Id: a9120692-0e10-4595-6b5a-08dd99347cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnpNb3BTUElHbnpDRlFKOUVjUm1pTENtdzUyWVE1K2hrOWZBVTgvZXRxL0xx?=
 =?utf-8?B?K3o0NWFOd3kzak83Q1ZIUnM5N25zT20xWnhYYlo2UDdRaGdxd3Z5QmZNTWdr?=
 =?utf-8?B?U2prQThnZm81L0dTaHh3YkR1QVhrUmZ3MW9kZHpvQ0crZEM0T2RqUkNoMExy?=
 =?utf-8?B?dnd5OGtpLzVyU1VrdnZBYXkvYTkvRmFHR1dpdDJGQ2FCM3hxa1UzekY5K0k5?=
 =?utf-8?B?OEk1UGJEQVNJeTNiOEQvRGxqNkJIQ3VsZGVJc1ZsN2lkakJvY1YzSDgrbis4?=
 =?utf-8?B?eDhXd0hQZXpNOTlVREhuMXA3RE5YKzgvL0tINnEzTjZCbGN4SDdaUC9XMFlK?=
 =?utf-8?B?eFBQVTNRbk92T1k5U0lweHBBbFlIUy9KWUdidjI3aWRZYklqSVQ0b0ZPaDdp?=
 =?utf-8?B?REFVWUFQR3NlbTJZWDVHWExzZEhtQ3dJQVdUakdHZXF3eHVlazJIUng3d3JC?=
 =?utf-8?B?dWVVVDJtRSszSVNpYWR1VDJXbE4zZit5MWpFZERmbkdITEE4NU11Ylo1VVUz?=
 =?utf-8?B?T1EyTnBuYlB0bzRXTnVmVGpQczUzb1RqTDJGa3ZPSVJYUjg1Tk1FS0JIS0pB?=
 =?utf-8?B?Y1gzVXFzdGFULzZ3MGphUitjWko2RzJYVDB1ZEtTMStxeEhqanF3TFJBb1ps?=
 =?utf-8?B?Yk1qRmpRUS9HTWZjZUE5N1dXWmRpNGJzc2NtZ0xyZVBJVHBXNFhjUURWeXRC?=
 =?utf-8?B?eU5EK2pMUVpPbUcrSWNWb1hQaFA5bU1helVQSFpLcEVJVWFmcjdGVUdQcUJl?=
 =?utf-8?B?QlA4aWxkbnRPVEFUUy8ySU9EMXJJbHJFbTg0Yzc4TFRwbTNpQkFzeWxUT1U1?=
 =?utf-8?B?YzQxSVRHSVNtYWVpRTIyd3puaWNQUHMyNVArcndKK09wemdDVFFqM0hUK3Bj?=
 =?utf-8?B?azVqOHVUWnhxcllkdU1Bc2JPSldXUlZ5N2pRZGpySmdwTjBkS3NrczVZSUM3?=
 =?utf-8?B?eUIxdHU0R1BhRGFTM0JhZXZKYzdZYWZqM3dBK1lOMGpabmZ0Vlg5c25DUDNB?=
 =?utf-8?B?MlMxQjNnRmVtV0J3Zml2WG5UWW5rWnFvY2VzTnNTRWNuSlJ3eTRxVjJzdmVo?=
 =?utf-8?B?UExZNGE4WjhkVnp5dmxJSmJMSEdEaldiUEhhN3ZIMzZ4TmNUazQ1VURZTWtO?=
 =?utf-8?B?aTNOSTM0dmhEVk5wVUd2WDhhaDNJZTY1eEdTYTBRQWFuMlBBV3RKalhlOUl2?=
 =?utf-8?B?a2kvOE5nVVBMVnNQT3dkMWtURzRxMVBzanp0bndyWk9aUWZ1emJ3bVN4Q1pa?=
 =?utf-8?B?OWVsSjRNMEFNSjl0MkE1TmdpdFRjeDRXOG5OWnNJbEJ1ZHJNMGJxd3FZVjBS?=
 =?utf-8?B?TkNqV2Q1Y3VuQkZTeUdMUXYzM1RwbHBidzVlbkR4WEV5cmxXWlppL1pSVUV4?=
 =?utf-8?B?NWpZMkI3TVVUTzI3Q0RWZXhuRnFMYzU1YzYvdEFaVHJTQktWWEhXOS8xTGdS?=
 =?utf-8?B?MXAyenNJMlpRb041YUxiZzBXNUFERm9Tc3ZJRkU5YXJERHR1ZkRRUm5TMDdF?=
 =?utf-8?B?VHNMWVhSTHNWWndzMEtOdHFPREVQc1ZlLzVOWG9FdmZBUmU2VmwrK0VyLzNW?=
 =?utf-8?B?QXBpQnFDQ0hZNVdlNTFJSTdYa0lBYmVBekFuOXpLSkRudjZhc1NmNWlpR0VF?=
 =?utf-8?B?L0NXZmhwVEJORzJWdjFYTnZPTU0zeXM4ZzhBYmtXYmR3TEczdzIzVGpldFZT?=
 =?utf-8?B?Vks5ZEgxMXZaWkU4QW5LZnJwWFhlYis1UUVQWW5memhRVW9HR1VUM2hkK2hx?=
 =?utf-8?B?Rm1nRDdSa2NkSldIYUhDeHJVUUYrV2UvYXI5Z0dicUgzQ3NmdGtweUF4OHpi?=
 =?utf-8?Q?OKVpYGpBsaXAWOfcrhw4mU9sNYLSuQNx838dY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2JpeTZhMEd4ZkpoRmRQeEFzekpUdWt6K0JMb01Pd2FUS0l3ZDRhUHQzL013?=
 =?utf-8?B?RmFXRGlmaERLRXJ5Z1hlUVNNay8wZDVHdk90R1RJbWd4bGpKanZkUTJrU2hC?=
 =?utf-8?B?cXZNQis0MmpaUUlNQ3Mwc3VLQmxlRFlvYVpVdmI3a013WCt4ZmtOa2RieEpC?=
 =?utf-8?B?SmhPYXNIOWp1QU9JTm41OWxuWjQvNVVIVHlUTzJpeU9YRGlVZHQxbnNIY1lo?=
 =?utf-8?B?bjd2dnM4S3NHQkVFeEtLRlNjN3FPN3B6NllmZjhTSFZZbDVlMUZzTnNIelp6?=
 =?utf-8?B?cFZ5V0xRWUdrMGNVYVV3bVA0UE0xc1ZvTDFORE5uemM0VVoyQjlBNDZjSXk2?=
 =?utf-8?B?QTN5NUhwTDg0c2hmdzJhZExJMHBSZmYwYXNxa1RlVmRCSmo5ZjJzK0lCdHhV?=
 =?utf-8?B?bVJ2RFNpeXZXaUMxOXdwWTJVbHBtL3FMQU1nRDRUNThXL2tHQUxEQ1ZUYmlL?=
 =?utf-8?B?QlphdGNpUHJBb2poQVZtVVFOSVlXWHIrdFE5Y0hSNk5sMWdGRVFRU3NqQTlX?=
 =?utf-8?B?TEl4V3h3cmVXYTF2ZzRDcmlMc2V6Mk52WURDWkdHeWdPK2x4dFRkaTgyRko0?=
 =?utf-8?B?RjcwUDN3K0JsMXZ6eWNmOTdLQ3duN1pkRHZUdzVpUm9iUnZsL202L2ZxcVQw?=
 =?utf-8?B?eW9iMWpDZDg1bkw4NEx6MGVGdXRrVVROTGk2K0JNalROSVZPUFhLSVRDYVlE?=
 =?utf-8?B?YlRNQTJMMW9kSGFaWUR5aVg0TlBjaWFKaUF1ZVNEZUU5SmZDakdNTlB4RUFO?=
 =?utf-8?B?Zlh2ZjFENGxBQlJ2T2pyaEJFRkFmMDI2cXN1WmxvWk16RlZVKzYzMGhOQU1m?=
 =?utf-8?B?bnViSG5iblR4RHl6RDVGK1Y0V3VmRGQzeTFxMXo3OUdPaDd6N3d1QnllWUdI?=
 =?utf-8?B?SmJnajNYdWFTYkVBdi90T3NwNVpjNDhMWHdwVG9ieUg2R0pwNkwzS2g3R2g2?=
 =?utf-8?B?elVvWmoyTFF3dkZXUWhiUFBZMjMxZlRnaExVdCtZMHN5QVZUQTNvcGtRVUQx?=
 =?utf-8?B?RkU4bzlHRHY0NDc3NWVubkg5cHJZU3RJcEFONkNyOS9YL1EzV1FUWGpJYWFh?=
 =?utf-8?B?NW5WTlBRUmlxV2Y2ZE9yUzRudjhMYVE0N29QVXBCZDhOckFlclo4cWpwQkp5?=
 =?utf-8?B?dTBjL2JLT3g0ZzZrbDVKY0RvZ3JmYTFNYkEyN1ZQR1lhWEs5cFhEd05JOGlq?=
 =?utf-8?B?V3F1UnJzREE1M2gyNG9pTWhyRHNsTEdBZUxiRjE2Z1k4dEZsQmVVZnRvTWx1?=
 =?utf-8?B?TmtBL0Rxb3M0OVFoRFUxZms3cG15aVppbHF3eGU0VkZTU0N6K21UbkptcnZ4?=
 =?utf-8?B?eTY3d2pwTEhibGh4TzZLU2I0dk9jVHpBTExRQWUrS01aTUpvMW0wUHdMbkxt?=
 =?utf-8?B?TUJRN0hZS2ZGQS95LzlaRUl6S3FtUXI4a0JKRlJMTWNGVU9TNjEreWtBMDUz?=
 =?utf-8?B?bWliVW5xRGhZMncxUnhEbGhEYU94NTlEMW1JTVUyRkM4SHV4WW5JU3V5YzNS?=
 =?utf-8?B?Q3B2dU9Hc3RRWnZkQ2R5TzN6bTJxTXNrQUxzNjZGRWFtelBNODV4d0dpSlNs?=
 =?utf-8?B?S3Q2T0lkVzg0aml2ZHJYUCtTNkdxL1QxcTFMUVAyQmpVOXc4b2FOMjhCL2cv?=
 =?utf-8?B?R2lyK0IxRjhhcHdRU3FGYms1YUlOczUvNkd1M3cwVkpZby9pMGlDTkxKREZp?=
 =?utf-8?B?VTNZLzFxdGtyeGpLOEJRaytOcXZEMnZwVkhvVjR5eGhhNk95ZkZheTZhQ0la?=
 =?utf-8?B?U0hSTnY1bXRoOEV2bDIzSkhRUHpobE5OQTQrMTBQbnFlTkE3ZFUwUmpxMG9Z?=
 =?utf-8?B?SXg5SHdXdUtUcUNSNHpURHBhVUxmS3NObXNMMFF6bEZRdG04OGVhU095Qytx?=
 =?utf-8?B?MUFQLzE1QittdHcveU9lbTdDRnhNbnVnMWZESkVWNENIVEtTQzRFRjkwUkVK?=
 =?utf-8?B?dlRlb1dCYTcxMUJlUjFPcVJPWFMzQWhFMGtWK0djUXhZemptVXVGMWRPdTRj?=
 =?utf-8?B?VjdDNTE0QmlMNUI4UlkvY0kzQmRUQk5EVGtMNERZU0FUUUc2blpxY2drVTgv?=
 =?utf-8?B?cHRucFNub3pRZUg4bXByY2E3V1VMbUVVUGJpM0FyK0hoWFdaOStaTVZMd0pE?=
 =?utf-8?Q?/hyxqlHmAbBpo5c/ig+PcUHzk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9120692-0e10-4595-6b5a-08dd99347cff
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:28:07.3425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZhLley2RE5rBaIWsH7HjXgLH3mPbd+i2q5xfMmPb8nB5egS/V3ktIrpwH9KsAJjSuQ57bBiCh3U1KXFFfbe8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF02710D35B
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



On 2025-05-22 03:57, Pekka Paalanen wrote:
> On Wed, 21 May 2025 15:48:00 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2025-05-17 07:51, Xaver Hugl wrote:
>>> Am Do., 15. Mai 2025 um 22:00 Uhr schrieb Leandro Ribeiro
>>> <leandro.ribeiro@collabora.com>:  
>>>>
>>>>
>>>>
>>>> On 5/15/25 15:39, Daniel Stone wrote:  
>>>>> Hi,
>>>>>
>>>>> On Thu, 15 May 2025 at 19:02, Harry Wentland <harry.wentland@amd.com> wrote:  
>>>>>> On 2025-05-15 13:19, Daniel Stone wrote:  
>>>>>>> Yeah, the Weston patches are marching on. We've still been doing a
>>>>>>> little bit of cleanup and prep work in the background to land them,
>>>>>>> but we also can't land them until the kernel lands. None of that work
>>>>>>> is material to the uAPI though: as said previously, the uAPI looks
>>>>>>> completely solid and it's something we can definitely beneficially use
>>>>>>> in Weston. (Even if we do need the obvious follow-ons for
>>>>>>> post-blending as well ...)  
>>>>>>
>>>>>> We can't merge kernel uAPI without canonical userspace that uses it.
>>>>>> To move forward we'll need a userspace to at least publish a branch
>>>>>> that shows the use of this new uAPI.
>>>>>>
>>>>>> Do you have a public branch for the Weston work for this?  
>>>>>
>>>>> Yeah, https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1702
>>>>> has been around for a little while now. There are some driver bugs
>>>>> that Leandro commented on, but they don't seem material to the uAPI as
>>>>> such?  
>>>>
>>>> Hello,
>>>>
>>>> Yes, there's nothing related to the API that is blocking us. It seemed
>>>> very flexible and easy to use. The bugs that I've spotted are probably
>>>> internal to AMD driver.
>>>>
>>>> I'd say that the Weston patches are converging nicely, we just need time
>>>> to get them fully reviewed. We had a few preparation MR's to land
>>>> before !1702, and now there's only one left (!1617).  
>>>
>>> I also updated the KWin MR
>>> (https://invent.kde.org/plasma/kwin/-/merge_requests/6600), it can now
>>> use all the available properties and I think it's ready. I found two
>>> issues with the kernel patches though:
>>> - while attempting to set COLOR_ENCODING and COLOR_RANGE results in
>>> the atomic commit being rejected, the existing values still get
>>> applied if you use YCbCr-type buffers. I would've expected the color
>>> pipeline to operate on the YUV values in that case - and leave
>>> conversion to RGB up to the compositor adding the relevant matrix to
>>> the pipeline  
>>
>> AMD HW always operates on RGB values, so there'll always be an
>> implicit conversion of YCbCr-type buffers to RGB.
> 
> Surely the transformation from YCbCr to RGB can be one that maps each
> of Y, Cb and Cr channels to G, B and R ranges [0.0, 1.0]?
> 

Probably, but that's not a HW config that's been explored, while the
one performing a color-space conversion has been used for years.

> Of course, that's not identity transformation (Cb and Cr have domain
> [-0.5, 0.5] or something like that) and R, B may not handle negative
> values.
> 
> But if R and B channels can be negative too, then identity mapping
> would be usable.
> 
> There will need to be a definition of how YCbCr enters the color
> pipeline: the order of the channels and their domains. The rest can be
> just more colorops.
> 
> We should be careful to allow limited range YUV formats to be
> interpreted as full range to avoid clipping the sub-black and
> super-white signal ranges. The color pipeline can be configured to deal
> with those ranges as necessary.
> 
>> What we should
>> do is reject YCbCr-type buffers with the color pipeline until we
>> implement support for COLOR_ENCODING and COLOR_RANGE as a new
>> CSC colorop.
> 
> Rejecting is fine, but is implementing COLOR_ENCODING and COLOR_RANGE
> really a good idea instead of making the color pipelines handle them?
> 
> Wasn't the original plan to hide all such legacy plane properties when
> userspace signals color pipeline support?
> 

It still is. But handling the color-space conversion via a new
colorop with two properties: COLOR_ENCODING and COLOR_RANGE
seemed to be the most straight-forward way of dealing with this.

I'm open to other suggestions and we can explore them.

Harry

> 
> Thanks,
> pq

