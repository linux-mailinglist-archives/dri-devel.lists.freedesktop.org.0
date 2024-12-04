Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E2F9E3656
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0343810EC64;
	Wed,  4 Dec 2024 09:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oJj4dAB7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD10010E2C6;
 Wed,  4 Dec 2024 09:16:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDRUpcoczAxHA0Yl4YJv+Rade6Z8bcY95GUEOZ3HXwPZKJYfTKVGm6o2UCIK26y4f0J+CMv0cQ57PFHQCkXeYBytU8xWP4l/qMyaQkoehHFFlquiS0tse77VsiKxhmFxCdL6TCA7AhB1+rR+lIO5vOKf+erYMZYz95ruLGvVH2X4hdVkSevqaiaX0Uin9GuF0VSIWvdpRNWrIykaQl437Qf9WllRqjUoG9mxO9QNb5XyRHkExIlIKt+nVRDL3ONRViZ2luQr6I8GQWhFCAPlEDo+xzHPFmhYki+eSEClZlFMCfkfSvVIqj+NHzgzYUbWCtiqjHR8YqLtXuhfIWfHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWG8HFCw2Hxp9fI9jiYSvcK8Tr5DfaYmh8FRT0EsvXE=;
 b=VrnCuRuVOqTyOdG6XEk2VoJSyWngpK+seWXtneUR7Rgf6PIA0UyhFoA8ns7Gc9gI/prs4mGSfBuUBp7X7CXEg1tLhjIRjEKk6+bB/q5GqnP+6Ve7lNbLv3NjFKgjgZ59woc8y+udl2dVzaE6YgLKJDrYHQapKb2gHDFdqOJ9RgF/z4dYLCArKzj7mA/o2aolI3sO8Wwn3cG5nKqow0Xy+nad/fkQKUNKeycfeLlPO2wvN/XpSYXMuPffiWdbWQa7YhNjyO+4tafgXx9m/YlaHtko0O+lxoXWSAY8t5SYIZbPNM6JdzT4VPyyYXnSHpO1ojbohkWEhDZcCwt6O7SDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWG8HFCw2Hxp9fI9jiYSvcK8Tr5DfaYmh8FRT0EsvXE=;
 b=oJj4dAB718ae/oe7NNwF1YQCtvMn+Rmi60A8dYmFYAEkToNg9El8JBWPr9MVxP5KbCrdMS5Ym7480Za5rqwqycxy96bCH8Q76vQG6vYMuCN0dorbbmSEaP+VxHahvbKObe286YpAEg7b7V4Hp/IJRErsq4rGFqD3CPOeThoFTVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6735.namprd12.prod.outlook.com (2603:10b6:a03:479::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 09:16:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 09:16:06 +0000
Message-ID: <26747cae-d66a-4bc4-9efb-4fdda4ac766b@amd.com>
Date: Wed, 4 Dec 2024 10:16:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/8] drm/ttm/pool: Provide a helper to shrink pages
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-4-thomas.hellstrom@linux.intel.com>
 <800ee040-7c2e-47d0-81e6-a352f5f689fb@amd.com>
 <a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com>
 <d1e33436-9c1c-43d4-a86a-956926a7096c@amd.com>
 <73588525571a68f5638300ef171591de10ba5e5d.camel@linux.intel.com>
 <0595e4df-86d4-4082-86ab-b77902d3020b@amd.com>
 <cf722b696676b7383a94c2b846f8230e180ee527.camel@linux.intel.com>
 <bc762b0c-4fe3-48ff-b8df-14f741c91939@amd.com>
 <f74a7b678b5013dbcbe090bbff885827d3675247.camel@linux.intel.com>
 <c74e9f5c-3201-4083-8b79-80fdbbd903f2@amd.com>
 <5f3c04297fd6f008cad0415d6b6c04ba8c3b5a8c.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5f3c04297fd6f008cad0415d6b6c04ba8c3b5a8c.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0336.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bcad81-9e3e-4008-f1b8-08dd144448b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGtVMlBxcmxJWTFFcEwvcUwrZGZ2aDJuQXJuSnVVWDJTN0RQcEhxWFkweHg3?=
 =?utf-8?B?ZzlaWTNYRmVyRmJ0QzFCTGxkelpjMGxEZzdjaUR1SzI2aGY4VnFIZ2lGTDJj?=
 =?utf-8?B?SnVpSkxha2cxUGVBZks4OXgzalViK0RLYm5wNXJmMk94RkhUTUc5dUwvRmxO?=
 =?utf-8?B?dEZpY2xEbHcxZ01uTUdnZy9nR3JQT2FLeUZLZUJrQTZrRmhmSUxSbUhDcVNr?=
 =?utf-8?B?VjJ4TVQ3RTFpNXpNdHgwbEFMYnBOeVMzaXRZdTFzNWw5ZTdJTnJqRWc2ZzhY?=
 =?utf-8?B?NUxLUGVqV1c2L0h5MzcyeVFJZkNlQTlDdTdaWWRDUkd1cTRURmhWbkpIdHhV?=
 =?utf-8?B?UW93V0h2QWR0dSs3QTRhZEpWaWZHNXlVUHVxdWc3WlRNaDhnUHRGU1l4V1VC?=
 =?utf-8?B?RkNDbUxPbmw1VEh4c2svdUN2czFKNTZZempuQUtmS3gvWVJtM0xONFAxK0NR?=
 =?utf-8?B?aGFBTHl1YjRTYlBHU0FvN0hHaWlvcTIvaUdVR3IxSVdUaTFoMURLTldnU1ZE?=
 =?utf-8?B?WEVIVlVSM0RCYisvWmRCOWpSZE10N0wwZE8xaUw2bWVxWFlxV2hQSjVkeUwy?=
 =?utf-8?B?L0JqdzJ2QzRlQnVMVEM3N2tTNEhNcTl5ZUxVTmYxaVpLWXRPcmRjQThSYTQ1?=
 =?utf-8?B?RnI0ZGxzUDdCcU5LQVdDSzBxUG1TTlR1Mi9ZWEIySnNCSzVUc01TamJKU2FT?=
 =?utf-8?B?RWF1MXhhY1pyaGZEK0phNHVibGpZeDExdFVYc3VZZ2Z4YkxPUVNUdEk3R2sx?=
 =?utf-8?B?L1Z6Q2FuZnIrWnhIOC9Gcy95M2VRZHdVZnZ6c2owN0kvT0svZkRQbmxtT05w?=
 =?utf-8?B?OXQzdzdrR0ovMjA4TlpRWEc1YzVOMGZWQjNVOFdWWDBHdllGdjJTaWtySGww?=
 =?utf-8?B?SHV0Z0RDYkpuQ1VvOWhrZXdKbnR6NXg0bHAxK01oaWx2SlhtNjJ4LzlMeVNh?=
 =?utf-8?B?YU5SY2hXblhRN0hWTCt0cDlaVHgvVmFybncvYmdZd3hrdDhLVzVpSk5sYlJG?=
 =?utf-8?B?U0pRMzcrZjlRM1dKVTZBeitQajNRcTJlVXF5M1daMEVheDkwUmV2OWQzU0gz?=
 =?utf-8?B?RUdsQUFrM2FNM2R2Vk43Ty9kWVJhKzkrVWZEOVVlYTJnaE5jbVQzQ1FFajl5?=
 =?utf-8?B?QkRrZFh0RHV3K1lyN2JycjdNWndqbDcxRWM0WjZoNVFOWFl3dzBKM1dDTlQv?=
 =?utf-8?B?Y2lGdU41L1VPdU9GSWJYTVV2NDZWRnNWSkVBTXRYa00zYi8vUFNyZ2FBSFl4?=
 =?utf-8?B?TkRseGIrc1cyNzh2cWVvdjNKa2RnbUdiVTlMNW9zc1pHb0dUU3NLUHNHYjBw?=
 =?utf-8?B?UUFKSnA4Nk9WUFZheGpuNmdsb29KY3NPYVNQS1FxVDFzWE1nU3hYNmR5K3hN?=
 =?utf-8?B?MHc1YXFnVU1qVy9hRnFqeG0yVkZhVVQxcDN2MXNGbGg5UGZMcVhOYnpEUEVt?=
 =?utf-8?B?MndObVE3WlV0SVRRdDR3MERrQXF5SVJDTXBwaFpkdlRwcklWN2dicE5lTVdF?=
 =?utf-8?B?ZGg5QXZZaWVWU1VlU281dmc3SDFyQkZsZ1p1L3V3RloxYVpHSktCZ2hickdr?=
 =?utf-8?B?dmpqamo1T1cwZVZNRGFQRVJBdUttdXkwQitjTkI5Y2hZODR0aTYycWZUZTBO?=
 =?utf-8?B?UkY0RDZOUTd0ZERzaFhiTDZBWDFVM2pMaTAzeTlTelc2Zis5RU1ZV1psSjI0?=
 =?utf-8?B?Y2lVMDdzTnlYMHlsR3pJL28ybitlR1Nmc2x6RUZnTlRwSlI1L2dxbkFkZVNI?=
 =?utf-8?B?NlRFU3U5U0s2NnBST0JkTS9OeTY2eVdhL3VCdXZKUnd1SDFMbHB6bEo3eGZs?=
 =?utf-8?B?djhlejZJZHlLZmoxMTUwdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ti9tY1pwa0hsR2hWMmpTdndRNTZ2U0pYWVpRZnRQamwwNEhqTURlM0tJRkky?=
 =?utf-8?B?L3FCN2dJSk5IaDJxOUVnT1Jvb29FWVBmTVpUakZyMFpNeTV0SEpWNUZKT3J5?=
 =?utf-8?B?ZExDSmR1bXpHUFkrQVhtelNuRkNZeHZxOW13NGpiSm01TDFEakQ4TGV6SFdP?=
 =?utf-8?B?cWltRjNaUzlkTHhjUExpSjMzTlRSVU5NVGtmM0h2ZjR0UlBWSHRTUjV0ZGtM?=
 =?utf-8?B?a0pYMmtFUFRJbmt5UllkdVlrWVU2MEwvaFZ0bzdxbzJ0SkFRQzJVNDJYKzZt?=
 =?utf-8?B?MEdPUFlwemVVdWhNWFcwM1U0a2NtVFowNUFvUTIxK0E0c3BxWm9OV0x5SUIv?=
 =?utf-8?B?NlgrNXl4eFArZzdUVUViZTB0N2xFUTV6YTgxWHp1WHF4M2FuNWY0Z1RkdE1L?=
 =?utf-8?B?MjNrK0hwQWhiU25tcDZGOWFGOFd3Mm84b3VxdXJRODNweDVtdTZyTm5ILy9B?=
 =?utf-8?B?RS9YL0paTDI4ME5JVzVqOHZuQmo1ckc2KytITS9YRmg2bS9MSmlSbnFIN1N0?=
 =?utf-8?B?dERieCtSNWkrcnpOV1llWDJNeVdncCt4aXc1bGtVMnJEK0ZvVWFPbEE0VFo0?=
 =?utf-8?B?c3p3MVdMNGhweUI3Wk1hMURKanZmWW5mYldzUjBXSVJpSkpiZFhwM1lKRHZM?=
 =?utf-8?B?QTU2TlQwTm1aOFBpcm5YMmxRenU1MldIS1FXck5tazF4TzdMUTkrUzEyQVJw?=
 =?utf-8?B?TTN0bmZ4bmpPY3gxbEZyaWh4S3ZxWDdhWC9mbXgybGZQL3ZPbVcxNVlIUDhN?=
 =?utf-8?B?RStpTlorQ1lBaGEwOHdyS2tOVVdOZklxamRaSWJoRGp2WjZrdDN3Yzl0blVq?=
 =?utf-8?B?TFJ3VlF4V01kQjVLd1dRSFpqMXAyaHNRMFBZSnU3SmoyOVlTblAyZlF0eWlW?=
 =?utf-8?B?QTZnRkd5TzgyWmw3WFVwUHc1ZEJIb2RNS01aMkNoZFo1bU5SNjdWSlNXOWRB?=
 =?utf-8?B?MUZ1SEVGTCtMY1pQUVM3MitFdGxwSm10emlkSCtkWmUyQmdGS0hXUHI4bTJa?=
 =?utf-8?B?d3lBVzBNQ3NLcnEwWlFuY001UDRzYnVKdmhqczdTT25EbUN3dUc2cDZ4TWp4?=
 =?utf-8?B?Q1pqd3YyRm5NMXl4bmRZMWpvSDFtc3VNQkZJeWdPR2VBOG0xNno0MnlyT0lt?=
 =?utf-8?B?NHN0L1FCNnFQR2pkOUFxSjhRT0VZaHNYS0xkN0Q4ZjhCaW9GZXlwd3FoZ2tQ?=
 =?utf-8?B?L1lvcURFL3Q3WUVxemVHSEtHWEcvRk05b0hOZ2RlMlVRNkNIL2lFU0VMODhs?=
 =?utf-8?B?b1QwYnltNFd2bWYzdFB5UTh5Q1loNzc0OFJJU0p0bzRYTWVhTlBoUlJBZ2dU?=
 =?utf-8?B?SFRMaUNWZHc1MmNjcmErOHBpeEV2NkdVam1Eb1pLOVBhcERtOXlqT0NwM2NO?=
 =?utf-8?B?cVhTQ0ZGeFhxL0VzSmlXUnVaaWFIVEZRSFVTRTdrV2dJb2ZXeHU1YVQ3OE1D?=
 =?utf-8?B?aGpqUkE4N2JOUDJXRVNqcnZOWkRtRUtHK2VSTDJoMGhTRzdkVlhnVldZKzl3?=
 =?utf-8?B?K1JJTFlpT2FwOE9PYmg1TWdhVHRNaEVwcEZGUi90L0VmRUc5Z1A0TXE5TFFx?=
 =?utf-8?B?WXNSSFpHVTN3RFR5WjdGWGxNdVZVU3IwR1pDZ1VVRlRrZzRhZGtNTFEvK0FV?=
 =?utf-8?B?V1FHWlB4SVFsZnVBOUUvSFVTbjc3N2xybFkrTHNrbjIxREtVdTkxRGdjMUJm?=
 =?utf-8?B?WTFRRmJHd2hNZmRFV09kV2tsK3Z5aXZnM2EvdTg0aDQ3cTVuSDdFNlE2c0tQ?=
 =?utf-8?B?dHlCY3FRUGYxUkJjZHR0RE80cTI2bm4yZ2JwMVpUbkxIMUNmbHQ1azZ2ellp?=
 =?utf-8?B?d08vdEFTQmFlcGtVU3ZnOVZjbklUc2pudW1zM3M1RlNvMzhUeWF1ZTdlWTRk?=
 =?utf-8?B?MkQ5N1U1TCtuNkJLaVFLUndVTGJJcG1FSm1NV0d4V2NEdDJxNVdVcHlucWVr?=
 =?utf-8?B?cVhUQVBpUk55ci95Q2RONXJnQ09Uc2RzYlJqeTc3R0crZ3VqcHJaY00vcXVG?=
 =?utf-8?B?TDkzWDg3bExwVmdPUkNZVFhrYzZ3aGhrK2JLeVFjQVgxNmpzSUg5RmZtZXk4?=
 =?utf-8?B?dVoreDZNMzY1NUE0UXVxWGlhTjFIVmVTMG0xTEVYS1Y5NmhSNThNbldhd0Jx?=
 =?utf-8?Q?MF7e3aE+NLX54/fLIvbBtAYC8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bcad81-9e3e-4008-f1b8-08dd144448b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 09:16:06.8029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6b7qmV71m7KxEebKFWuIKEEH+4A5FGmBeOFuhwy+X3v9SrkgQs9h7KlOwR69qZ7a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6735
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

Am 03.12.24 um 18:44 schrieb Thomas Hellström:
> On Tue, 2024-12-03 at 17:46 +0100, Christian König wrote:
>> Am 03.12.24 um 17:43 schrieb Thomas Hellström:
>>> On Tue, 2024-12-03 at 17:39 +0100, Christian König wrote:
>>>> Am 03.12.24 um 17:31 schrieb Thomas Hellström:
>>>>> On Tue, 2024-12-03 at 17:20 +0100, Christian König wrote:
>>>>>> [SNIP]
>>>>>>>>>>> @@ -453,9 +601,36 @@ int ttm_pool_alloc(struct
>>>>>>>>>>> ttm_pool
>>>>>>>>>>> *pool,
>>>>>>>>>>> struct ttm_tt *tt,
>>>>>>>>>>>        	else
>>>>>>>>>>>        		gfp_flags |= GFP_HIGHUSER;
>>>>>>>>>>>        
>>>>>>>>>>> -	for (order = min_t(unsigned int,
>>>>>>>>>>> MAX_PAGE_ORDER,
>>>>>>>>>>> __fls(num_pages));
>>>>>>>>>>> -	     num_pages;
>>>>>>>>>>> -	     order = min_t(unsigned int, order,
>>>>>>>>>>> __fls(num_pages)))
>>>>>>>>>>> {
>>>>>>>>>>> +	order = min_t(unsigned int,
>>>>>>>>>>> MAX_PAGE_ORDER,
>>>>>>>>>>> __fls(num_pages));
>>>>>>>>>>> +
>>>>>>>>>>> +	if (tt->page_flags &
>>>>>>>>>>> TTM_TT_FLAG_PRIV_BACKED_UP) {
>>>>>>>>>>> +		if (!tt->restore) {
>>>>>>>>>>> +			gfp_t gfp = GFP_KERNEL |
>>>>>>>>>>> __GFP_NOWARN;
>>>>>>>>>>> +
>>>>>>>>>>> +			if (ctx-
>>>>>>>>>>>> gfp_retry_mayfail)
>>>>>>>>>>> +				gfp |=
>>>>>>>>>>> __GFP_RETRY_MAYFAIL;
>>>>>>>>>>> +
>>>>>>>>>>> +			tt->restore =
>>>>>>>>>>> +				kvzalloc(struct_si
>>>>>>>>>>> ze(t
>>>>>>>>>>> t-
>>>>>>>>>>>> restore,
>>>>>>>>>>> old_pages,
>>>>>>>>>>> +						
>>>>>>>>>>> (size_t)1
>>>>>>>>>>> <<
>>>>>>>>>>> order), gfp);
>>>>>>>>>>> +			if (!tt->restore)
>>>>>>>>>>> +				return -ENOMEM;
>>>>>>>>>>> +		} else if
>>>>>>>>>>> (ttm_pool_restore_valid(tt-
>>>>>>>>>>>> restore)) {
>>>>>>>>>>> +			struct ttm_pool_tt_restore
>>>>>>>>>>> *restore =
>>>>>>>>>>> tt-
>>>>>>>>>>>> restore;
>>>>>>>>>>> +
>>>>>>>>>>> +			num_pages -= restore-
>>>>>>>>>>>> alloced_pages;
>>>>>>>>>>> +			order = min_t(unsigned
>>>>>>>>>>> int,
>>>>>>>>>>> order,
>>>>>>>>>>> __fls(num_pages));
>>>>>>>>>>> +			pages += restore-
>>>>>>>>>>>> alloced_pages;
>>>>>>>>>>> +			r =
>>>>>>>>>>> ttm_pool_restore_tt(restore,
>>>>>>>>>>> tt-
>>>>>>>>>>>> backup, ctx);
>>>>>>>>>>> +			if (r)
>>>>>>>>>>> +				return r;
>>>>>>>>>>> +			caching = restore-
>>>>>>>>>>>> caching_divide;
>>>>>>>>>>> +		}
>>>>>>>>>>> +
>>>>>>>>>>> +		tt->restore->pool = pool;
>>>>>>>>>>> +	}
>>>>>>>>>> Hui? Why is that part of the allocation function now?
>>>>>>>>>>
>>>>>>>>>> At bare minimum I would expect that this is a new
>>>>>>>>>> function.
>>>>>>>>> It's because we now have partially backed up tts, so
>>>>>>>>> the
>>>>>>>>> restore is
>>>>>>>>> interleaved on a per-page basis, replacing the backup
>>>>>>>>> handles
>>>>>>>>> with
>>>>>>>>> page-pointers. I'll see if I can separate out at least
>>>>>>>>> the
>>>>>>>>> initialization here.
>>>>>>>> Yeah, that kind of makes sense.
>>>>>>>>
>>>>>>>> My expectation was just that we now have explicit
>>>>>>>> ttm_pool_swapout()
>>>>>>>> and
>>>>>>>> ttm_pool_swapin() functions.
>>>>>>> I fully understand, although in the allocation step, that
>>>>>>> would
>>>>>>> also
>>>>>>> increase the memory pressure since we might momentarily
>>>>>>> have
>>>>>>> twice
>>>>>>> the
>>>>>>> bo-size allocated, if the shmem object was never swapped
>>>>>>> out,
>>>>>>> and
>>>>>>> we
>>>>>>> don't want to unnecessarily risc OOM at recover time,
>>>>>>> although
>>>>>>> that
>>>>>>> should be a recoverable situation now. If the OOM receiver
>>>>>>> can
>>>>>>> free
>>>>>>> up
>>>>>>> system memory resources they can could potentially restart
>>>>>>> the
>>>>>>> recover.
>>>>>> What I meant was more that we have ttm_pool_swapout() which
>>>>>> does
>>>>>> a
>>>>>> mix
>>>>>> of moving each page to a swap backend and freeing one by one.
>>>>>>
>>>>>> And ttm_pool_swapin() which allocates a bit of memory
>>>>>> (usually
>>>>>> one
>>>>>> huge
>>>>>> page) and then copies the content back in from the swap
>>>>>> backend.
>>>>>>
>>>>>> Alternatively we could rename ttm_pool_alloc() into something
>>>>>> like
>>>>>> ttm_pool_populate() and ttm_pool_free() into
>>>>>> ttm_pool_unpopulate(),
>>>>>> but
>>>>>> those names are not very descriptive either.
>>>>>>
>>>>>> It's just that we now do a bit more than just alloc and free
>>>>>> in
>>>>>> those
>>>>>> functions, so the naming doesn't really match that well any
>>>>>> more.
>>>>> So what about ttm_pool_alloc() and ttm_pool_recover/swapin(),
>>>>> both
>>>>> pointing to the same code, but _alloc() asserts that the tt
>>>>> isn't
>>>>> backed up?
>>>>>
>>>>> That would give a clean interface at least.
>>>> More or less ok. I would just put figuring out the gfp flags and
>>>> the
>>>> stuff inside the for (order... loop into separate functions. And
>>>> then
>>>> remove the if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) from
>>>> the
>>>> pool.
>>>>
>>>> In other words you trigger the back restore by calling a
>>>> different
>>>> function than the allocation one.
>>> I'll take a look at this as well.
>> Ah, and BTW: It's perfectly possible that ttm_tt_free() is called
>> because a halve swapped TT is about to be destroyed!
>>
>> If I'm not completely mistaken that is not handled gracefully when we
>> try to always backup from in the ttm_tt_free() function.
>>
>> So we clearly need the separation of move this TT to a backup (and
>> eventually only partially) and freeing it.
> Hm. I'm not sure I follow completely.
>
> The ttm_pool interface is currently:
>
> ttm_pool_alloc() -> allocs and may recover from backup. May leave
> partially backed up. Called from ttm_tt_populate() or its driver
> callbacks.

Yeah that this is done by a single function looks really strange to me.

> ttm_pool_backup_tt() -> Attempts to back up (the not already backed up
> part of a tt. Called from ttm_tt_backup(), which is just a tt layer
> wrapper. If called with purge==true, then frees memory bypassing the
> pool to return it to the system directly.
>
> ttm_pool_free() -> Frees a (potentially backed up or partially backed
> up) tt. Called from ttm_tt_unpopulate() or its driver callbacks.

Ah! I missed that you have separated that functionality from the free path.

I've only saw the allocation path and though I need to clear that up first.

> So the backup functionality is implemented with a minimal change to
> upper layers, and I don't think there is a correctness problem on
> free().
>
> So could you clarify a bit if it is this interface you think needs
> changing or that the implementation is better at separating out the
> backup functionality from the pool functionality?

I think we should just make the ttm pool object take charge of 
allocation, backup, restore and free operation on the TT objects.

And all of those are separate operations, they just internally share 
steps to archive what they should do.

BTW I really dislike that tt->restore is allocated dynamically. That is 
just another allocation which can cause problems.

We should probably have all the state necessary for the operation in the 
TT object.

Regards,
Christian.

>
> Thanks,
> Thomas
>
>
>
>
>> Christian.
>>
>>> /Thomas
>>>
>>>
>>>>> For a renaming change that touch all TTM drivers, I'd rather
>>>>> put
>>>>> that
>>>>> as a last patch since getting acks for that from all TTM driver
>>>>> maintainers seems like a hopeless undertaking.
>>>> Yeah the acks are not the problem, merging it through the xe tree
>>>> would be.
>>>>
>>>> Christian.
>>>>
>>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>> /Thomas

