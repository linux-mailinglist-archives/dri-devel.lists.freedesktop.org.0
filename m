Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6729CC0766D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C26A10EB1E;
	Fri, 24 Oct 2025 16:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sotC2BHy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011063.outbound.protection.outlook.com [40.107.208.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40B910EB1D;
 Fri, 24 Oct 2025 16:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvDdOBJjvjgb2kNtMOm7OYMeBwpHKmumnT3e2cdDXVXV38T/eTO6cvMRCbL3Y3GPMmrI1toW2PDVKbTWmUNYEJAOK4bFRQ5uhcmKSA7xwYnsch9pnEQFX3oPq1rgwYMaMlr0LgUWFYx9mtttsVK4jw3gbDk73ufmfdHf/YVzs4xGg3dH9Bz2qilwuUdde4oAt2RQK1Ne6q0Arv/b8KG2LYiODrogrQt7OonQnqe50IPBJiExkssJte69UC1R4WsEWvsGS7z65l3MKdt5u3SB9yFy9CYDg+42Hnyu99A/mtDbpUPlaES5IyRA2m1SSIuUxibh+9Z+ax2Z3mptiEfTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLQ/kMrke0dfcMjUT/cIi5T0vTHoWuncqBhkRKVLyXA=;
 b=L9wSsyzWyJ3driX3XWVi5DAg72r7v0IwQmwUG7v601Y+4/n56SQZhDWslThSnxEVXkDqoWMB3f7lBN5ZdnRzE/TQZRdL0h0Zdnu8nLs3vU2Dri3BRqLr6FTcbdO9ddvOq2iFEFMKWsEPmAS+tzL5pF3nBjprJcluyp3USFFyRClh0CxmSMrYHAbmMu6YezrEaAs7De+5UjDGNfl+MAscbWfNB2guZkgT3cWxBJFjWQseihvQIbRm3P0p2LBfen0/1mp9+nJHL4VbH3Tke3AWTVNVkTI2n/bQbmLP73VDRQMDAFmeILjPlt82K10VAE0M+k3yITDF9c2pbawRb7bPSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLQ/kMrke0dfcMjUT/cIi5T0vTHoWuncqBhkRKVLyXA=;
 b=sotC2BHySXNQvI9TFhOrKum/PTMYZqS0ys0dvBpytjEcMFkg1pO6lWSU3U63dlWLL/JnMivdAYrLY8DwlOzqYpuLGo0mhRlfTyV45tXqya17XkQeNozO3yEV0zokNiWL9UpG+Ql8bzwPXOlS/Pg/9bmXzIM+Hllu4KsU5JA2dOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY1PR12MB9699.namprd12.prod.outlook.com (2603:10b6:930:108::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:52:23 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 16:52:22 +0000
Message-ID: <d6f72b8f-1961-406a-aed8-5f4570ce98d1@amd.com>
Date: Fri, 24 Oct 2025 11:52:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/amdgpu: only send the SMU RLC notification on
 S3
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Perry Yuan
 <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-4-lkml@antheas.dev>
 <61da9864-b7c8-43f1-b437-36756077b545@amd.com>
 <27439123-98aa-4096-a4e4-3c8eecb3aaca@amd.com>
 <CAGwozwHAJAvgZEgn1M0ioRP4dT2urMUtQQzNXKXydu0ueoOzsA@mail.gmail.com>
 <CAGwozwH+UneR7uB0h_yrEWTBM=-uHapmzL3JnmrJ8S2v5WQ2SQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwH+UneR7uB0h_yrEWTBM=-uHapmzL3JnmrJ8S2v5WQ2SQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:5:333::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY1PR12MB9699:EE_
X-MS-Office365-Filtering-Correlation-Id: f53bf574-eeec-4fa4-00e7-08de131db393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUhxZ1BKVWF1RGRFcTNhdkk0ZDNOT1kwUm5tNCs1cTZoQ0FQYXdXeURCWTZY?=
 =?utf-8?B?azh5SGZ2enplWXF0Q1FTMklnR0pWZjlFc2ZVTEp0T0lFb3IyKy9NUzNqL1Nq?=
 =?utf-8?B?Q1g0MHgvTzJ2eFJ3S0VtdWM0OTcxdWFCSDJ1Q2VoZXFIRHFiZEJOMlpxMU55?=
 =?utf-8?B?MU5KckR3eW5wZDJwT0wzL0dFVTlna2txL3htTEtBOFlhUmU3SjdCNFVxdDZw?=
 =?utf-8?B?aEhkYU56REJjVTdOMk1uRnhzMWJjWVJDdFFNbnFrLy9LY01rcXZKbUJaODNF?=
 =?utf-8?B?SHpUOWNJd3FHN3Z0YnJDS1c5M05HbDU4anRvMk41TnQvV0dXYkRqWUsxbEtS?=
 =?utf-8?B?UnVHUVc4VUFXVnJKdmJ5NmMxL1Z6OVI3WVUzL242TitDdlhpNFFHT245RWs0?=
 =?utf-8?B?RnlPa1BwazUxZ1BKenltaTdtblh4dzRhdnJUZVFiMnVaWVBQZ0YvYnpNSkQr?=
 =?utf-8?B?QXl4a1BTd1hwVzhqeklOaFlYK1p3TS92U1M1emM0ZTNEOTd1eVZseHlGbHRz?=
 =?utf-8?B?VndFeXY4QzltQzhKMUZ2bTNXdVQ4WHB3RnJwT2Y0R1ZLK0t6MWNDc2tnMDZz?=
 =?utf-8?B?Y0lJUEZVZ2U0TnlScE1qTGx5RWVzVld2Q3RETm80a3dPeVM3ZlFsZ1BVUkhx?=
 =?utf-8?B?YUxSclBzU1hpLzZrZUlyQW85SURLVHI2MFR5YlRNaHVkSnBWVE5FT2QrVkJv?=
 =?utf-8?B?MURXZHQ4RjFreDJhcUdyTnZ2SDJldDZBeHZlWWtIQnlPY3dsRGEwRm5uN0N1?=
 =?utf-8?B?ZnR1TGNpdWsycjJ5YUdQTCticytCMEJZVTZRTTE1bE1FcHhPWUlKNmYzd2t3?=
 =?utf-8?B?ejFFMzRXajBsaUxIRjI3Kzh5YXZOMzMvaFkzMElmVjE0UG1KOGcxbzg2SDcz?=
 =?utf-8?B?a05HVVBnaXFLZnp0QTlVVlNsdnZCR2tTb1FrOGloSTBqNWlMZ1krQ2Nrd0hX?=
 =?utf-8?B?d2tlMFpVdjc4NmRqNlpXTUEvVEhVWWJ6ZFI1R3V4MGVIOFV2OXhXcjRjVHMv?=
 =?utf-8?B?Vm5GVU5uRmE5ZGppZXlQREx4NzdBdjJ2RnU3cmNrTGVlNm9rZVROUkFFcHVW?=
 =?utf-8?B?b3JpYUkvbElIT0sxcnc5aks5dDJhY3JBYUF6di9EWVZLOElFTlNIdXZveDNB?=
 =?utf-8?B?SnV2Ym14ZGpmaGJiM1JEZUxuck45ejhBNmZIQ09TSGlEa2krSUprVDZDTW1k?=
 =?utf-8?B?YWgyUThrNTVtaFlPREFwUk1nSVdVT243b0RvTU0xU2VGWnY3RHJjMXVCMDdq?=
 =?utf-8?B?dlRRWi9OVEJydnJMaStkVjd6Yko1N3FISXpjbk0zZTcwcVFnaGYvdTRaTmtU?=
 =?utf-8?B?STgxUk5BR3VEZ3JRS2MyU3YxaURkYU1OV1pEcDEvVXA2Sk1wYWVmSDF3TjlD?=
 =?utf-8?B?c21objgvZUp6OHZpaERacGNzTEJwdTkwMnNXa29xSHMwTFZBeC9mQTRwYjFV?=
 =?utf-8?B?RDZZR3VhcjExektVZERWWTFLU0ErVEgyUy9yQzJaT21IelJnaWdZSHE3eUly?=
 =?utf-8?B?d0NtTTBhaWI4akZOcjQwU1dDZWd6cVN6b1MwT1ZXeWtKaEdhSjVvb2V2NXJO?=
 =?utf-8?B?UG9xN1hMWkV1Qk5WcndLM0o5aFkvQ214V1Erb2NxYmNOL3AvbVJOQk5xZXNK?=
 =?utf-8?B?eUdXRjNDWTdwb3JwOVp3YTlqazJPM0JvWmZPV1I5RGwwQ21jZnhuM1p2TURJ?=
 =?utf-8?B?SlZoTTk2bkFRdyt2ekt5aXJ1Vk9tMzZOeFE1SnRZTVlzTFo1Tlh4b1FlaHh2?=
 =?utf-8?B?WHVPVFdzWThJUTZRNjJuV0xrbGRrOCtsZS9vaERvelllMjZCWXBnbTYrTjdj?=
 =?utf-8?B?MUxoWFRJbDdWY2E5R3BjcDR2WnRYUllQb2RxemQ2RStnUFg1eW11bmlrdFNa?=
 =?utf-8?B?ZW9qaWZ6REI2UzlTZTNwWmJtWXlvRFNuN0hDRFBBK3JyZlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHhTcEJrZTVrOU1LSkM3YktyRUZvZ1lXK1JOMTU4Z29kTS9ONUNjVjZXc0NB?=
 =?utf-8?B?dWFqZWs2Z0ZJU2JqTzFzL0p5dTRnSlBkVGJkWTJtVmV5Ny92eTJhL2o3Q3Rj?=
 =?utf-8?B?c0t2OHdGbEtLNnhKQUFqZzc0V2MyMDJZWnJ0bHFxVDZQSUk3ZVMzeFlaR08r?=
 =?utf-8?B?Rjk1UzlBamRqK0NGYUZ3L0dnTTN0UE5kcmZNelFCOUpPU0IzakI4ekFxZVlM?=
 =?utf-8?B?VTI4WGp6d2wwTmtUWlN0WnR3VnI1QzRhSHQ3UXRDS0h2Tk5KMnNyblFDRjJM?=
 =?utf-8?B?aDFzVzR0c2dqUjUvTXFkVmIwWjJUUFNGc05kMjRDcWh4K2RRb3RrUHo1c2h1?=
 =?utf-8?B?UGFBcWJuQmNaQW1nUjQ3cEN5Q0JnL1JHOS9ncmd5dlhwZkdBMzhwRFpGQUpF?=
 =?utf-8?B?MXIwR1JHWkRyY3hvT1VoTWVOKzJkSmYzcTR2WEp2SnZvRzBJdmxEVmJZS3NX?=
 =?utf-8?B?RklrR3BtNWNwcFlUV3ZyenEwY21HRkdwcElqZ2d1R1RYdEZDbUNtdGd4VmRr?=
 =?utf-8?B?S0hFT2hZMmNuT1Zld1ozNzloKzNLbUFsWFFDemVBbkV2cENCa2NtZGV2NXNv?=
 =?utf-8?B?aHJWWXVEbVZKR0ZIb0FPVlFKa1JyblQrbnVGZGFFcHU4dTRBTFhsNVlvYmZN?=
 =?utf-8?B?VjdMWEdjTzlJS1NIdjl6Y0tiWEJ0ZkZsK1B6OUNTVm05MFZEVnBKajhPcDRN?=
 =?utf-8?B?ZkNIQXFucDlrN0NUY044eW16REU2MXRXcngwTDkzcnZkNlVheXRuMld0UWho?=
 =?utf-8?B?cFdCTWxsNnE5cUMramh2M3NndWwwd3paVWxIYW9wZktpeHJXTWRQT05hWkNx?=
 =?utf-8?B?bmlnRWh5ZVdGZDBIVkVrVWVWUEtkejd6aGFNYkxiUmpEMklDMU9JeUw3dkNZ?=
 =?utf-8?B?WXUxQWlVZWJnVHI0TVJLSHQyckVBVkkveThqRFdJaVNZcXJuajhxc0U4M1NF?=
 =?utf-8?B?VVpZZGh6cDUwZ1MyT1VYSzlramc2bDYzRXNSRW9yTUhSTlBrd3lZUXJ2LzA4?=
 =?utf-8?B?RVczNXdlZlVTMFBsQ1NMbWgzSUdTMjZnNGxwdnhYd3Q4bEpIcWo5L1g4anlo?=
 =?utf-8?B?OUZnamdsN2libjdBL0Y5dVFmRFJKdzNNNSt5bzFYMVhCdkRaSG5GMnY5dlZr?=
 =?utf-8?B?RXZaNlY2c3JzdnRka2JWSjUxS3FCS3FydjBWUnlwNTd0UnZaUUVqcTh5RHlG?=
 =?utf-8?B?SVpZcjZQRm5IUDRiejZKL0RkbHUyYXJIQXVNSkVtZDhtdHJVQXU3d0xIRisw?=
 =?utf-8?B?QUpadUVrYTB4UVlCR0VKNm1IMTR6NG44bVdjZ3YwdmlqdjAxaHNGbWY1VVk2?=
 =?utf-8?B?VnZPV1ZxbkozeVNBNHFFSmJvWlNLaGZxN3ZJSHd4dzk4YkttenpvaEFNWGF6?=
 =?utf-8?B?ZUZlU2JPMkhDeHFpa0hURXdOdDJOUW9yeGkyUUk0N2lqTTRYMG5Fdzc1YXJY?=
 =?utf-8?B?bEtpeEF4VndDWkJieVZodm80c2pNVnZlSnRqU3RzT2VoVkFZRW5haW1OWmJ0?=
 =?utf-8?B?aXZmVFR2WXpWenlNcVM5b1I3Vll2Y1NNNmM1NjI3aVV1K1FYRStyR2w2NDl1?=
 =?utf-8?B?VGc0S3ovL0tFMUdhRDRHcVYxdEdtY3lWdHJKVkdIMDRaVkpJdmoxMmdMQ0ZG?=
 =?utf-8?B?ZDFJNXYzejdjU003NjAyRmZYNS91cHhMVkJRaGY0YndUcU1hMXJwSkpJZjFQ?=
 =?utf-8?B?cGFuQnN4VHRYVEh4dXB2WnRBZHA3c3dDRERVeUxTZG94N3gvWG1tdC9DcDVr?=
 =?utf-8?B?RkdnWWRLeGFCOUlSaFRuOHBzRWdURk9TK3ZXY2VzSGd4N1pSOWFLU1ZtRnZC?=
 =?utf-8?B?U01RZEdqVDJOYlhvbHpMdzN1MU5UUklGSnJLTTF2bm42NkI1dXJnbjIyRVdK?=
 =?utf-8?B?MXhWN0RtOVY2WTVjcy8wNU5mdDR4WEN1YzI2bzZZY2NJanRPZ1NSZmxaMTM0?=
 =?utf-8?B?d3Z5c0ZFVi9uLzRGL3hIS3hxbCtUTXNGWjE2S2FqNVpSOWtacmtxV2NGV25h?=
 =?utf-8?B?TmdoMFFKMldnYTBwM1k5c3A5cnVhWE5PWGN3VXk0VjlST0VCbFI0ejRIZFFp?=
 =?utf-8?B?Wm8zODlOemlSZzJoY2ZMOXRvVlg5bnlZa2cza3dxSTE2TlhFdFNlNzF0Ryt6?=
 =?utf-8?Q?H5wkRYOY7vQ+duJC3QY9ALxIw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53bf574-eeec-4fa4-00e7-08de131db393
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:52:22.3354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRkWGu0of7N5ao9RUD64Zuqjl8otMI1PgExHGwHWn8SJ4FC1aWGiaBPRprjmQyTCCdoR/UCD85dVhR8I1RW4DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9699
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



On 10/24/2025 11:45 AM, Antheas Kapenekakis wrote:
> On Fri, 24 Oct 2025 at 18:24, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>
>> On Fri, 24 Oct 2025 at 18:20, Mario Limonciello
>> <mario.limonciello@amd.com> wrote:
>>>
>>>
>>>
>>> On 10/24/2025 10:54 AM, Mario Limonciello wrote:
>>>>
>>>>
>>>> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
>>>>> From: Alex Deucher <alexander.deucher@amd.com>
>>>>>
>>>>> For S0ix, the RLC is not powered down. Rework the Van Gogh logic to
>>>>> skip powering it down and skip part of post-init.
>>>>>
>>>>> Fixes: 8c4e9105b2a8 ("drm/amdgpu: optimize RLC powerdown notification
>>>>> on Vangogh")
>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
>>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>>> Tested-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 8 +++++---
>>>>>    drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c        | 6 ++++++
>>>>>    drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 3 +++
>>>>>    3 files changed, 14 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/
>>>>> drm/amd/amdgpu/amdgpu_device.c
>>>>> index 3d032c4e2dce..220b12d59795 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> @@ -5243,9 +5243,11 @@ int amdgpu_device_suspend(struct drm_device
>>>>> *dev, bool notify_clients)
>>>>>        if (amdgpu_sriov_vf(adev))
>>>>>            amdgpu_virt_release_full_gpu(adev, false);
>>>>> -    r = amdgpu_dpm_notify_rlc_state(adev, false);
>>>>> -    if (r)
>>>>> -        return r;
>>>>> +    if (!adev->in_s0ix) {
>>>>> +        r = amdgpu_dpm_notify_rlc_state(adev, false);
>>>>> +        if (r)
>>>>> +            return r;
>>>>> +    }
>>>>
>>>> Just FYI this is going to clash with my unwind failed suspend series [1].
>>>>
>>>> This is fine, just whichever "lands" first the other will need to rework
>>>> a little bit and I wanted to mention it.
>>>>
>>>> Link: https://lore.kernel.org/amd-gfx/20251023165243.317153-2-
>>>> mario.limonciello@amd.com/ [1]
>>>>
>>>> This does have me wondering though why amdgpu_dpm_notify_rlc_state() is
>>>> even in amdgpu_device_suspend()?  This is only used on Van Gogh.
>>>> Should we be pushing this deeper into amdgpu_device_ip_suspend_phase2()?
>>>>
>>>> Or should we maybe overhaul this to move the RLC notification into
>>>> a .set_mp1_state callback instead so it's more similar to all the other
>>>> ASICs?
>>>>
>>>
>>> My proposal as such is here:
>>>
>>> https://lore.kernel.org/amd-gfx/20251024161216.345691-1-mario.limonciello@amd.com/
>>>
>>> It would need some testing though to make sure it didn't break Steam
>>> Deck or Steam Deck OLED.
>>
>> I will give it a quick go on my OLED.
> 
> Horribly broken. Did not enter S3 and when waking up fan maxed out and
> it bootlooped. Journalctl stops on suspend entry. It works on the Xbox
> ally though
> 
> My series works on both

OK.

Can you try Alex's idea instead?  Just comment out the RLC notification 
code in amdgpu_device_suspend().

It's supposed to already be called in smu_disable_dpms() anyway.

> 
> 
>>
>>>>>        return 0;
>>>>>    }
>>>>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/
>>>>> drm/amd/pm/swsmu/amdgpu_smu.c
>>>>> index fb8086859857..244b8c364d45 100644
>>>>> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>>>>> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>>>>> @@ -2040,6 +2040,12 @@ static int smu_disable_dpms(struct smu_context
>>>>> *smu)
>>>>>            smu->is_apu && (amdgpu_in_reset(adev) || adev->in_s0ix))
>>>>>            return 0;
>>>>> +    /* vangogh s0ix */
>>>>> +    if ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 5, 0) ||
>>>>> +         amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 5,
>>>>> 2)) &&
>>>>> +        adev->in_s0ix)
>>>>> +        return 0;
>>>>> +
>>>>
>>>> How about for GPU reset, does PMFW handle this too?
>>>>
>>>>>        /*
>>>>>         * For gpu reset, runpm and hibernation through BACO,
>>>>>         * BACO feature has to be kept enabled.
>>>>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/
>>>>> drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
>>>>> index 2c9869feba61..0708d0f0938b 100644
>>>>> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
>>>>> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
>>>>> @@ -2217,6 +2217,9 @@ static int vangogh_post_smu_init(struct
>>>>> smu_context *smu)
>>>>>        uint32_t total_cu = adev->gfx.config.max_cu_per_sh *
>>>>>            adev->gfx.config.max_sh_per_se * adev-
>>>>>> gfx.config.max_shader_engines;
>>>>> +    if (adev->in_s0ix)
>>>>> +        return 0;
>>>>> +
>>>>>        /* allow message will be sent after enable message on Vangogh*/
>>>>>        if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT) &&
>>>>>                (adev->pg_flags & AMD_PG_SUPPORT_GFX_PG)) {
>>>>
>>>
>>>
> 

