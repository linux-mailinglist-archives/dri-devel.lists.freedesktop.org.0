Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52889CB3030
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 14:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA08010E256;
	Wed, 10 Dec 2025 13:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c6+3lmPw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010005.outbound.protection.outlook.com
 [40.93.198.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE10F10E0F0;
 Wed, 10 Dec 2025 13:25:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtrcCZT0Fe4D5Jr9Mym3B0PmPCz8t1P0OUUc8i4qE1KWlWvgTG3pnypU0l58fE4Jz+Afg3+Ewz4cumRGCm6B6Slu8WKQqkQff8+WzbJ0HonXzkiwmY7yFRubvx4gj7g8y30noGHkVhVOdaI96ATbLFojAsMy517RS3O+F5+qQ2YQlkZEaqU7zAdxyq+tC5itjZSBcJ6cJiSYxNbAR0vZif/CG6o58VyWUqVPeX4eS0+p6t0JocBawxETE+PVB/2BMkslYeFuV1m0URLYEKfflTPBQjFN0vcCPbudCMQXuC/bW7O6ugN+RN/PKrPomhwS9Mrkm/SGZoxEWIXOA2UEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYKuw6PrrHlLklOSuBp+fDyAzEvPWWehhDr7pg0Udns=;
 b=Cvy/wAZtMN4AtWSaQYJuM3w+f75RtS0kMWxXz9t0kOptSBkq8rtY8r2/UJy2EbCMwq2WFySqhB9+GV7NB1hSJcAtZRUwgbvEISnrDlK+uew5zlIVxgKGHPLi8iDb1oiP4vE7kN5WEOhopV+4Q4pO/7kNAvPpIVyU6PMxWKoNAn9cHRR8SFBklDgC95qcz6S+wXruhZjYuoCbQbKik34hun6aFTyvGW/H+oOAVDRXGALkBAMiFTaEEEtPa2h3FNeR6BilN2pcTTfG2oAgwhMpy6IbYrhq5x/CXa8MdV3oubvQSmeSNOkUTrV/t7e2KzmhyiuSmk4FXbXjDYsoGEY+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYKuw6PrrHlLklOSuBp+fDyAzEvPWWehhDr7pg0Udns=;
 b=c6+3lmPw+KLcJea4OdAjvL08h/Ha8Dgt1OqhPLmxc7ligbLSIpQEbSVhDbtVAxbucLhGny9XHUWRE+p8Wm4sdGf3TrlralI+/3StKsanH5TJ01VyQpZgbsh30PPT4FsnbM6KzboWfbJujY23hOIaNzPBhO5ogzL8N+k+I7vJ72E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8547.namprd12.prod.outlook.com (2603:10b6:610:164::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 13:25:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 13:25:31 +0000
Message-ID: <b8457c80-bf5e-4ff2-b727-34c52eea9d31@amd.com>
Date: Wed, 10 Dec 2025 14:25:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>
Cc: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 dakr@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Lucas Stach <l.stach@pengutronix.de>
References: <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
 <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
 <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
 <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
 <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
 <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
 <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
 <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
 <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
 <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
 <aTjTucrVHe8TR/gN@lstrano-desk.jf.intel.com>
 <0508680962030eb0f858890a3183a545126614c9.camel@mailbox.org>
 <8ceb06b4-5f56-471d-91f6-a6ea6733e9a8@amd.com>
 <b0e9af12b924e09c0006f0a3068aca3e4ea6fc30.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b0e9af12b924e09c0006f0a3068aca3e4ea6fc30.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0409.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fad9647-b945-44dc-7365-08de37ef9764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUtzeVpOVkxnOU9MNkpnNU1uRXdBNHVjVTQwMjZhdFdmNmtiTUx0bnIzOW9S?=
 =?utf-8?B?TUp2a2FHTjJQU3pDalExZFprcjNibkk5Rk4zdTdtUTdXbWkxQjd6aU5QMHZX?=
 =?utf-8?B?NG9jdzlLK2RaU0lQVG9TOStFU01qaE5FWlFWQ1grMmtBSjJxeEFZSGpDZzJU?=
 =?utf-8?B?R0xVeTlXcnFnZUpPd3ZsUWhqYTFackZwK1FtMzZseHNXV3RLOEl1OXA2NEJo?=
 =?utf-8?B?R3VLd3VnNHVXc0ppMWVCTXN0U0ZnM21FTzNPWnJIelZnbFVkY01PdTJlcWtE?=
 =?utf-8?B?RXZxOTlqM05abDhyQjREM2M2Z09lazFJbWNaZ2wxTGxyRXBIajNFN1d6WU5v?=
 =?utf-8?B?N1RPSC9rd283SEpNdE1XaVdvQlQrN0Zkc1IxQUNxZ3ZmS2JjZXZCMHQ0RTky?=
 =?utf-8?B?WktzaWorYUVQUVBYSWIzTGJXdi9SQll5ZmU5QWhoaytaeWp0eGJRaFFhcklq?=
 =?utf-8?B?OExKT21HczhXUmFLQ3J2aDM2WStubVBSaEljWnZ5THkyWGkwYXcrWW9qeEYw?=
 =?utf-8?B?T2c0ay8rSWUzOFN6YlcyVE9BY3FtOFRYVlF2YTYzSzZzd2ZrQ2trMm5LM3Nk?=
 =?utf-8?B?ZEUwcW1vTXhmclM5ZmRpa1Vza3ZPQ2hVL0pBWTY5Q1VpRjJTekVIWmRXL1NF?=
 =?utf-8?B?WCtFK1h4OGVRUjNEc2thTTNDUEtiNmtXaUd5RXhqWk1RZ0x0NTZtaEs3OHpy?=
 =?utf-8?B?aE5uOXNSZERyS2ZvMXd6WWhZNTliWis3clY5WW1MOU5nMmpYRG9FbzN5dDZ3?=
 =?utf-8?B?S1hkeitkOVBWL1o2SlNBRHJ0SVd1RlRvWlZGbTB3eE1NVnJKK0NKekMvcHNN?=
 =?utf-8?B?MmdVdWU2eFhQdXNodHR5YUZWTk8zWFFYUUNNd1B4Nm1UWVBVdm5KVjJkNW1D?=
 =?utf-8?B?ZWRQcndvODFXV2lNQW84V2pCQWRHWDlGeDFvbk1ucHJtY2xDMEtsdER2OUVT?=
 =?utf-8?B?TWkzc3F2U2RuT2s0d2dPLzh2UkhaTHhyWXVlNkpmaE9XMWw2UGVDRHp5Umsv?=
 =?utf-8?B?bUVLRkQ5V2VrWGx0SVVPSWxGcUFPY0lCc2pOUzU4ZENYODdtMUNYc0NPUTFp?=
 =?utf-8?B?em03ZWVMaTZlMW51ZUpRMk5DcEdpZnRqKzdhSHpHWUxFVjQybVFndmZ1SlRV?=
 =?utf-8?B?Ny9xV0kwbElVdHJua1R0QTJKU3FCbkpGNEkvY3NrSlhYZkp6bzJMUS9ScXRz?=
 =?utf-8?B?N0xhdVljU3FMeDN2bzUyVXhEcjVJZ2ppNllyV09sdUllei9pbTQxT0FXZGww?=
 =?utf-8?B?UmVaT0dVNm1sNVpsc2xqa2FJRElKdlZBSng2ZUhqVGdheFhQQldIUmtPaVFO?=
 =?utf-8?B?cDB4cXpMK0ZwcXFYT2QrSUtJeHlNQkVOMGlIUHVXWGdGMTduUGVDZUE3T1cw?=
 =?utf-8?B?L1l3VTQrc0dCTEtlVFVFRXJqVk9RQS9iYVBLYzFNUjZieHpJUUgxUUtxSHpk?=
 =?utf-8?B?bUhZSlRoTURldUp5VVlidm5kWlNNVEtKM25GYUt6Mk5GckNNODg0YVY5NFZr?=
 =?utf-8?B?RGFtODdNY0t6cjVPRG5SbUdOczIvTDlYNE44N2xPei9lbnVGL05kK2NzdTZ6?=
 =?utf-8?B?Z2NqVUNibFhNNVJZNWsyUzE2WFB6dkJLR3VtWURvQjU1SUhLZnl4aEpobmZP?=
 =?utf-8?B?K2YxcDJiaHI2Mm5HQjd3YWJYMG43ZSt0MHNGS1N6QjhjQUl2cXBSUHJZSUt6?=
 =?utf-8?B?dUp0VjZad0VjT2ZyRlJkUmltMlhyY1hqR1hrS1RwdVY4dmZJUGZ0VDVBVUty?=
 =?utf-8?B?MWU2elZTK3czNExuQkJwdlptYnlYSGtwaUR6dlZjSmxNdFMvQmFITzZLSTh4?=
 =?utf-8?B?QmhlR2dsUWVHNC9sL1A0bkpJZGNqVkN0SU9reXMrYWlnamlNV2dBcWNJbVVZ?=
 =?utf-8?B?UGtIZVl2U1F3VWs1TERTNVFlOFo0WVVwREVqVVcyWWhTaHMyNGNETUx5Y3cy?=
 =?utf-8?Q?Vwwrswk9nJ8lPzedJpho5p7/qsBn6UXG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWpPTXZqZnYyTk5tcTQxbk4zTkpGRDRBbUY0K1piMmNjTHF5NWpkRzZ0ZXcr?=
 =?utf-8?B?bFJ5ZG85L0dVazJOTUNSSk5zclAydkxZeGpZNURDeURORkVScldSbTJFSDlO?=
 =?utf-8?B?c2RMMSt2RjNIVmxzN3Z1QUFQeGN4bEdYQmxqelU4ejBUcC9INUZ3Vk1OYWNK?=
 =?utf-8?B?TEtrUDNJdmlHM0hiQzU1NVV6SlQ0aGlIWFBiZkRwYU1Eb0sxMCszVzJGMTZN?=
 =?utf-8?B?TWptdW02dmM5WVBDaVc1am5idmNkUEdvTE5UTnVIQzBsVS8xNFhFTkNhdzBt?=
 =?utf-8?B?T3NxWDIySFRsb2ZROVppZUJKT1dCNXJFa0FFYzZuY0pveUI4YnpDT3dsaGdF?=
 =?utf-8?B?S0ZzSm5XdGtEemkwM252eFhtZE9oUERYN1VOUjNuRTh0NnF4SWRnZUpJN041?=
 =?utf-8?B?Rm1xUEYyRE9pdERxR1M0NDFhb29jS0JNMjFNRWNMTEV1ZFExRkoyTWg2azBB?=
 =?utf-8?B?N0M5NDJRN1NUeHhzdWNMVURzSUR2SlpBU3ByU3Vjb2o5NEVyS3pVbWNDVWNN?=
 =?utf-8?B?RllxcklWaVdLYlhrYUJQSjhYbW1lQzVHQldZallQVDVVMTlyYU5qelBjS2tJ?=
 =?utf-8?B?aWpXeFBOczZyRVFzZFc3TWFtYmRRaGhzdlBTMTVzWWQ1dm5vMTNxUVFSMXlN?=
 =?utf-8?B?WkNWcXltdkhuTEUra0c3aVRkcEowSlBsLzhDV1FXc0V2ZHFiWG0xTnBXYU5F?=
 =?utf-8?B?ZkUrRnRpMGNVcFFENWxnanlpRFJWRDg0cFJpSG1tUmZaUDVFd0VXcUR5VHRB?=
 =?utf-8?B?M2RnYnZ4bEcxL2NkY0NOcDYxUXh5K011V1AxMVlOM2xpK0R0WFpzL3c1Yllx?=
 =?utf-8?B?VTI5ekZsTCtrN1pQZ0pDTjFaM3VUR1NPVlp4Y3hKR3ZtMGJxRnRsMUM5cUsr?=
 =?utf-8?B?ak9yTjVyeDY0WmNhZzN4K2RLaXphTm5SOGhGWFBYRitJU2MvYTdmZGRTZTk0?=
 =?utf-8?B?N2V0ZHpxajltWmN5ZUtkZnp6L0R1YkRnNEZhQ0gwa3lHWHBhZlcycWxIN3pj?=
 =?utf-8?B?dHVLT1RMdVNYMHM4T2d3QnZod1JrUEFzd3lLYll0OFAxRlpKYng5RFJLN0t4?=
 =?utf-8?B?SHZMeFdWcFBjQjZhZkttWHJSVllEU2dpZ0NVWDlCRlRqbVRWUEw2eUlyRG9M?=
 =?utf-8?B?SEpRMFY4TXVDdThha1NaOW5QMXZGV0xiSktwdHZjY2ltazBKM3JkSHgvOEFC?=
 =?utf-8?B?UC9uMlFjWGI4YVRXMzZVdURDbTNNbGFSTmJrZ2FiQ1M4ZzdRUjgwMWQrUnha?=
 =?utf-8?B?cytKb2VZK2JYUGdBL0hZOWFzT1RrdVRXN2RxejM3MGdKVUVoWS9jUytOcjly?=
 =?utf-8?B?QzJVN014YjFZOVZOSlc4am8wQVIrbHdpZnZjekQrR1hGNEFSdEV4M29yaWZY?=
 =?utf-8?B?RHhJcFBVeVVhdGJCYm9yZDkwZVlzeWE3WGl0TkREYUozU3FzTmJjQ1FWbVdv?=
 =?utf-8?B?ZGNOdlhBWnVqMW9CNnRGbkxwWjRoMTFaOEYxMDY2R2VsTW1PcVpsTWQ0b3Qv?=
 =?utf-8?B?MkdWYWN4aXRtS2xJWVNNWjJ0bEoyM0lvZWlmM3l2UnJBV09xVXozUzRpSFJD?=
 =?utf-8?B?Y05RaWp1aUxmMWtaZXY1cW1tOWtKTXFHNkwySHh0QU43b29NdmdlU0lxQW1B?=
 =?utf-8?B?cXBCR0ozSm83WFB1RUhaYWhQTkhBVTZDRWpkSUJsWDBPSVRHNkdPUktVUnJS?=
 =?utf-8?B?VEJZTTJEdVRxQW1NeENxUU4rRCtCQ0dHc2VpNXJoUFViUWNUaTFHcTIyMVhy?=
 =?utf-8?B?SlA4SUU1N3ZDTEh6c1NneE0vK2pmZmdLSmJTVForVU1VcWE2d3RSZ3hPNkxZ?=
 =?utf-8?B?THB5Qy9MOC9QOUtMdmVMeFdRY0Z2Mkg4SG5xNVIvWmFoMDFyRzUvNExxaC93?=
 =?utf-8?B?YzdBSUV4TStnaDI0ZU5LM3dkUkk0eFZOQytjRlVHRTc1RTNSVFY4N0hNWVUw?=
 =?utf-8?B?dDVCSnNjMDdFcEREYWFZYkwzNGkzclptVG9ZektjdWRkYTByYlZMZjNFT3Fl?=
 =?utf-8?B?b2hDTU5xOXJTREtUdklZL3VRV0FWZmtZalBZbTJvRFg0cmVPM0l0eWxwcDc0?=
 =?utf-8?B?c2NTWkJtWTdUZjhpK2V5Q09iNC9GU0ZIK1k2WmRkeU1nbENYTnBzSHNFaWZ6?=
 =?utf-8?Q?1/15UyCHvMYE+iZtXKpqbP9l6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fad9647-b945-44dc-7365-08de37ef9764
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 13:25:31.2658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5nO0Fkk2kk9+KdN1wk6x4v9SDdx5atnNPDcY2pKjw7ZiVRKmSEIMUhxo5Tpen24A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8547
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

On 12/10/25 14:06, Philipp Stanner wrote:
> On Wed, 2025-12-10 at 13:47 +0100, Christian König wrote:
>> On 12/10/25 10:58, Philipp Stanner wrote:
>>> On Tue, 2025-12-09 at 17:58 -0800, Matthew Brost wrote:
>>>> On Tue, Dec 09, 2025 at 03:19:40PM +0100, Christian König wrote:
>> ..
>>>>>>> My educated guess is that drm_sched_stop() inserted the job back into the pending list, but I still have no idea how it is possible that free_job is running after the scheduler is stopped.
>>>>
>>>> I believe I found your problem, referencing amdgpu/amdgpu_device.c here.
>>>>
>>>> 6718                 if (job)
>>>> 6719                         ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
>>
>> WTF! There it is! Thanks a lot for pointing that out!
> 
> scripts/decode_stacktrace.sh should be able to find the exact location
> of a UAF. Requires manual debugging with the kernel build tree at
> hands, though. So that's difficult in CIs.

The debugging info was actually pointing to the return of the function. My guess is that it just optimized away something.

>>> It also wasn't documented for a long time that drm_sched (through
>>> spsc_queue) will explode if you don't use entities with a single
>>> producer thread.
>>
>> That is actually documented, but not on the scheduler but rather the dma_fence.
>>
>> And that you can only have a single producer is a requirement inherited from the dma_fence and not scheduler specific at all.
> 
> What does dma_fence have to do with it? It's about the spsc_queue being
> racy like mad. You can access and modify dma_fence's in parallel
> however you want – they are refcounted and locked.

The problem is that the driver needs to guarantee that drm_sched_job_arm() and drm_sched_entity_push_job() can only be called by a single producer.

Otherwise you violate the ordering rules of the underlying dma_fence.

That is completely independent and comes even before the spsc queue comes into the picture.

Regards,
Christian.

> 
> 
> P.
