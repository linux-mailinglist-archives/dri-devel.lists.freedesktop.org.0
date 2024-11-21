Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08369D537F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 20:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DE410EA55;
	Thu, 21 Nov 2024 19:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ggVsVzJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBFB10EA54
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 19:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJaqSSUzkD5u82WhDFFP6iGgHDBoY/Mq2Mgc1V3b4tR0RdBVL/BlDic1hlex2PwynkGjPTasfL6pmwrIGF0bDdcy8e4AWvhOlC8XytpgtH13rHGu4sUkVHzcuTOVxRWL8Lq58uY3IPmqQAgLObZmJl9bavncWnDWxcjJO6NGvREPHkpcbW/mgdC742dXvdG7HuFpUr15hrtp6BR4pAMwMXZKSRyribJXXa8b/lkZVHCl/csKXsNzVKlrmH4JZDyraS7Rb+huuB/lFbga349Dxxp8LifaxB7+6WeR147Pi2J2dvqK6tacRTSoQ89DlgnePSXkm/k4ahnSuO84FRAe4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bb10Shwae8ibNsuBBxEqBRdquLpnMDoxPjDwg2bW+sw=;
 b=Jo0Jot18bVAln7lG/Rzez4SIzzJODHWq+H4gL+OcFEGbUx9zHpE+JGf3csCw3SomuMtXO8f5dwTYi0hJp9eeCLKQmRq8WZNgBr1HcU+FQua6SPkHB/DQ5uBklRIB3Hs+Re0xU+Jire6H2keHhrE2FnruCw2TbUG6F2PevrEgU0VlFG4MxLhdYptHtgyTvpvDCCU83yh7xatKREjQg3pvmq3HCQHksAWRGbpQCIlwJFu6NQBvAgz/y7GyX1IvvUjpgOiZDEW5UXegpVTSepqZ4wvi9n1LsQ6FPTP1zZlN15Na/WynyoclHfn60P/wd1vTqr4WbXP9wuHx0sAeFlfMDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bb10Shwae8ibNsuBBxEqBRdquLpnMDoxPjDwg2bW+sw=;
 b=ggVsVzJnSNzKjxynAUR5+2rFvjDSrUuusn6lYSXkyzyDobYILvHA+VIL8+sLhNpFdfSqKtpvvcALnnqIVBMbvZFLIv3Fs+Gmc4JK/blJ/hrGXCLpcIyDrNSBu3orA2PylV2g3y6JWu+k+0oMmdsLo3hrmQxBqcbSEKgOi8Vngng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB6913.namprd12.prod.outlook.com (2603:10b6:510:1ca::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 19:40:24 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8158.019; Thu, 21 Nov 2024
 19:40:22 +0000
Message-ID: <80653958-2f34-4ed8-b77e-8f82d80ebbea@amd.com>
Date: Thu, 21 Nov 2024 13:40:20 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/13] Documentation: PM: Add documentation for S0ix Standby
 States
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>
References: <20241121172239.119590-1-lkml@antheas.dev>
 <20241121172239.119590-2-lkml@antheas.dev>
 <1e7057cc-c74e-48ff-8585-8b0db58e08bf@amd.com>
 <CAGwozwF9qzinGmyJQQ+KK02troC-u6+vULpExvYE8taYaBHCXw@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwF9qzinGmyJQQ+KK02troC-u6+vULpExvYE8taYaBHCXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN1PR12CA0049.namprd12.prod.outlook.com
 (2603:10b6:802:20::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f2cf6e-4520-4d1f-21ac-08dd0a64567b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVRoZC9uMlBWVVBaenVBeitHRkJKbmxNZndMbWs5Rmg3WTR6Rk1UdE1oV2NY?=
 =?utf-8?B?aC90THoybzhxMkRycitqWDlHdU5kbTg2cVpmaWRhVUZVNjJaWEVjdGc0OWtt?=
 =?utf-8?B?UzErNnVKZ2dPRkYvL1lpTDhoQXprakFTaTRCVU1VTDRGQUx5NE91akpFOHBQ?=
 =?utf-8?B?QkZ5Wm13WGJmMmZHRkRLVElyM09RdVpEaGZab0FjVEJsbzd4SHZJajIrek90?=
 =?utf-8?B?Vm9TRVprUVpQSXNYV21DTkR5NEFVcTNpbnoycHUyeUdpemdZazN2WTdSR0hu?=
 =?utf-8?B?d1VBd0YzV3ZkTzE2WWRxbDkrTnhUMTU4a0M1TFp0ZDE1ak9YZjh0Tm5OZ3Er?=
 =?utf-8?B?cEpqUTFjRHR4N2x4aks0djJiWnY1dUc3a3BDMUc5K0J0a2hvMHJnTklsQzZl?=
 =?utf-8?B?ay9EcWdyVE5mTXFDalFYQlRTaHJkWmZuL3JzTWNzOEV1VUVuN1p4QWlpU0Nt?=
 =?utf-8?B?SEl4a0xoaWtyeFF3ZmZFYXd0djFNYjJYYUhvWVZ5LzV2N3kyUnIyZ2lhbEx3?=
 =?utf-8?B?Z0ZicnFkRnhvck9WMVRHVklacTJDT1A4NVo5MWd3SUVBRW11cm1uMk1GT2sy?=
 =?utf-8?B?d2RDdHVzQ3RHS0s2clA5T0tIQzVqaHVhbFZtSmFBL3hVQmlLbnJHLzZZZG8z?=
 =?utf-8?B?YjdDK1hiTXkvRjFYMUhzNllEVnE1UjZGc2NFcDhYZm9YdllGRWhhNk41bUYv?=
 =?utf-8?B?L2thcUpsQ3MzWnNmT0pKMHNkdFpVTUNVa3ZKbTB5eTV1N2FZUXl0TGF5aTNL?=
 =?utf-8?B?RlhPdXJHc1hUUWhING8rYW80OUtTdzBHOXJYKzduNldjU2hGYnY2bVBqS1lz?=
 =?utf-8?B?N0UyREpJcjMxZWZOSzhTV0xFakQ1dkpWVkpWWlZEVVVkdUpzaWxOVEFNWHlO?=
 =?utf-8?B?L1RjL25DZ0hoOHhiN3VaQTU0cHZydm1iVitLZEpsQ0FPR2NjcFNiQlVRcjVU?=
 =?utf-8?B?aHBoVzlYWGpuVFlGT1lKci9jYVNINDJWcXVtVzVLeHhwNHdKRUNhcENtbHVN?=
 =?utf-8?B?WjFlcFVSZk1SSllSOVZJRFB2K0VtbnlMcC83N2hNRUFXOFJBaXFaYXZiQitS?=
 =?utf-8?B?N21ZSy9nMVlkUk92MnIrYm1ZN0F6cFJ5ZkpVVGU1UzVibGNObnhDZ0NYUWVM?=
 =?utf-8?B?b2dmb2FjeWEyajlQWXBRNk5KODlFV2FudW9DZHhxYnVwQWFJMEZmaWp4Vm9S?=
 =?utf-8?B?ME5nNzhCc0k4Ukw5UkZiNklEemRjK2dtVW5wZlBNK2o5VWRIcWhrOStCMVlt?=
 =?utf-8?B?SkRyWS9hL2NGam9mdmtZdmc3UkVKRmVqWXVsQVN1a3gzT3ZuWng3MklrUklz?=
 =?utf-8?B?MnpaR0dlaUZKVTFaVTRnaXU0T1pDcmpkVGl3UEVoSk5TUEZFNWJDclpVc1or?=
 =?utf-8?B?eEx0MTd0WERvaTIxeElKTjdSWWdZMDlOcVZ0RFJmaHduTy9Xa3RZOUFLQVl2?=
 =?utf-8?B?T0hHRmFLN2hqNTI0a2RBN3JWa29tZmtOOGI2Wk1hQWRHbCtDZE8vdkxXM0xX?=
 =?utf-8?B?dW9EYnEwTzZsL1h4RG1ZVmVkWmJJVFovblV5NGFoUEZiQ1Bic0E2a2wxNm15?=
 =?utf-8?B?TFZXTmZzZ1lVbjRnQjZzUWd1aEEvTTA0Yi9HdGdYUThaNFdrSzB3YzJ0RjAw?=
 =?utf-8?B?RXZDR3VtTjc1RXlPWWtZMFNJYTUrZDZKZGJ3OXQ5eUJ5VnFZeWptMk1sV2Ja?=
 =?utf-8?B?SXVBN0tFWVNUd2NzZnh4alVSaEF2b01sSW5HMkQrNWQzOWJFSWN2aXpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVZPK0N6MnFyS0I1MHhjZjA3aHNUVVNUYU9DeW9zUGIvdFFpY3dFOUpsMDlu?=
 =?utf-8?B?b3JXa3ZPS0R3YldtTkNvMGZ1OEpDUER1ZEFTUXJXOTVZTGd3OWlHMnZLMGxm?=
 =?utf-8?B?Q2J6b1lsSkZBSUhhRWZDMTRZY1RYd2pKUGE3YWpHdDJhTFVHcTFnajJGWitB?=
 =?utf-8?B?ZUxjbG55bzZLOWM1UCtaOFdzWFdua3BkSkxzZ3hnaGdzV0JxOSttam0wdmJ4?=
 =?utf-8?B?WEtBTFNhMGd1dlVUdVZWdy93YWU0RnFUbWJVS01RSitKZjZGTkhXY2JpMzFx?=
 =?utf-8?B?MGVFTzZxZEwvSEM3V1ZETG01ZHdVOVRzZ0NDOG9sZUJxQWRtcVhQQWp6WFcz?=
 =?utf-8?B?aE0wd1dHSmMxNkw5TG85M3Y3T3BWWlZqT0szRkFDeXY0bU5LNmpOSlRubjR2?=
 =?utf-8?B?Zy9DbWVPVHIzRWJqSTdFSUFNaDJmbFBPeUgzVCtiSm82MGFnOTEwRTRsL1h2?=
 =?utf-8?B?Z201T01RVnBKSzlFK29CWS83eEszbUFYeUs5K2dlS0ZsRzhPSjY5UFZNSXFM?=
 =?utf-8?B?RWZJU0crOUlHWE1uQVdkSWN1Rm9GbmxvbWhGMmplR05xalpiRS91TjVPcE1I?=
 =?utf-8?B?UERiMjh2MnZYQ1RMcUthNHVNdkF1bzJsa0dBWCtwQTRQNU1zNkkrZEtqeFpp?=
 =?utf-8?B?Mk5hQWpqUmI4eUxTdHBQT2JxcmRIQS9Yc0QrTFI5VmFadEdhN1Bid2htcXJp?=
 =?utf-8?B?UXJPeDdyd1BVbVdZaUxFOTRCZWJpa21QMVhJQ21Hdnk3dUVEeWkzcStmTlcx?=
 =?utf-8?B?SloyMkZWR3U3ZlJnODJLdUN2S09VNDJ3S0FRU3lFM2Y5ZkxtTHNaZWFESnpl?=
 =?utf-8?B?Yk42VUFqRXRLNzRiWk14cnRjdHNxb21FRHE3TTRQeGVKYmduSHB1UGlVTTNP?=
 =?utf-8?B?R1lNNncwMkxXY0tMbDZhbnQrSGNocmFmKzNsRlNrUk1LL0dqbm1qc1k2V1Bs?=
 =?utf-8?B?cXF0UmZKSlBtYm5jZk1Iemh5c3FRNGd3aFV6MGlGZTk1MVFoQTROZ2ZvWDBI?=
 =?utf-8?B?Y3B3eWcrcnJxNW5uQUFEY2w1RGtSYVNNaDE2WnJ5bnlWU0ROajVIbWJWVXlO?=
 =?utf-8?B?NVh1M3FQUGpkbmszRHJzVEJsckNmTHYyb1VGL1FRLzk0b0NTYm8zSEV5M0Jq?=
 =?utf-8?B?dFJlTXJxVzVabkpCS0l0d2hiVUpNcHVReDVOeWpHVlhjblJENDk2TUlWZGs0?=
 =?utf-8?B?WWdMMzkvc3lhRTVabGtXUFA3UXhXLzJZNFpBakNjL1VNYmR1b2Z3Q3VWK0RU?=
 =?utf-8?B?Q1NhV3JZakNuWDMyTHhTWXVGK1ZPdE54cEVjYnV5L1FRWFVmVTFhd2xCMmZ2?=
 =?utf-8?B?ODhpSzl6dUdiY0ovRldqZXZqZ2FzWWdRMHdXUGRqVDZDYUZCdmRHUjByUWla?=
 =?utf-8?B?clZpNWZxVVVVczBlelRlTEQ3cGVTZUxCN1Z2L21KSldWdlBobzcvMXc2cHN1?=
 =?utf-8?B?Njl3UWkzcFNmdXJZOVJmcjd5bGFXS0pNVVdMd2dOZzNFWnFQb1dxc2RoZWpS?=
 =?utf-8?B?bFRCMGQwbkZib25LejVhQUhZUGJzdFlkZnJCTzJhTktRZXZsaHQwY0hEWWJH?=
 =?utf-8?B?ZEdNbDJhSUJSY1cwd2ZZaVRQUGhWWUdnUERGZWJCU0w5SWxMZERDY2xVS2Vt?=
 =?utf-8?B?c0xsMDQ2V0xWZ01uQk91WWNMdEJyR1pXdkNwZk5ReEhRR2hBVUFWTDRIcW4w?=
 =?utf-8?B?YW1PWFN4NFFNTUY3R3daQk92MEtpRDRYRXByeDdoeVQrWjIrV0NrV3pYRmI0?=
 =?utf-8?B?UUZqUGozc0ZrZFZHYmFycFhoWmVGak1LRTZqUitGVkxSbi9VY1ZuTWV5cTUr?=
 =?utf-8?B?S3JwSk81Ti91VmhBdTlrdm03YjZrMDg4cVlWTXp6dmlNY0RiZzBBbFM3Nkl5?=
 =?utf-8?B?UE1mN3Y4Tm83cldEbXc4RVlrZ3U0d3ZSUFUyMjAwRkRWcG5lbVRTdXJjZ3Nx?=
 =?utf-8?B?ODg4OCtiSUUvK2JNN1VWTFNhZ3JTNVhuVGh1amVqWkJoVml5V28raGxBbmgw?=
 =?utf-8?B?UXBndEh0T2VwUEFRS1FQNU5OTFJxWTVPOU1zNVhBQWh6Wk5Cd1cxQndxWXRV?=
 =?utf-8?B?UlZ1NlNXQlhtSi93aDlaOUdKYXZvN3E1L3pYQWdURk56Z3pSYldXdkRKYmtn?=
 =?utf-8?Q?upY9ijVxR2YIV2XlKcto8kUxN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f2cf6e-4520-4d1f-21ac-08dd0a64567b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 19:40:22.2316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ki2/DTZ23kiAwSg26v7dOhGQ9+DVFlqsdryB/uWn0+sHeB4HY+f+28p4V/fbQlh5aaVx5v3zRiQu7/piRJNAFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6913
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

On 11/21/2024 13:11, Antheas Kapenekakis wrote:
> On Thu, 21 Nov 2024 at 19:58, Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> On 11/21/2024 11:22, Antheas Kapenekakis wrote:
>>> Add documentation about the S0ix Standby States that will be exposed
>>> to userspace as part of this series.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>    .../admin-guide/pm/standby-states.rst         | 133 ++++++++++++++++++
>>>    Documentation/admin-guide/pm/system-wide.rst  |   1 +
>>>    2 files changed, 134 insertions(+)
>>>    create mode 100644 Documentation/admin-guide/pm/standby-states.rst
>>>
>>> diff --git a/Documentation/admin-guide/pm/standby-states.rst b/Documentation/admin-guide/pm/standby-states.rst
>>> new file mode 100644
>>> index 000000000000..96727574312d
>>> --- /dev/null
>>> +++ b/Documentation/admin-guide/pm/standby-states.rst
>>> @@ -0,0 +1,133 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +.. include:: <isonum.txt>
>>> +
>>> +=====================
>>> +S0ix Standby States
>>> +=====================
>>> +
>>> +:Copyright: |copy| 2024 Antheas Kapenekakis
>>> +
>>> +:Author: Antheas Kapenekakis <lkml@antheas.dev>
>>> +
>>> +With the advent of modern mobile devices, users have become accustomed to instant
>>> +wake-up times and always-on connectivity. To meet these expectations, modern
>>> +standby was created, which is a standard that allows the platform to seamlessly
>>> +transition between an S3-like low-power idle state and a set of low power active
>>> +states, where connectivity is maintained, and the system is responsive to user
>>> +input. Current x86 hardware supports 5 different standby states, which are:
>>> +"Deepest run-time idle platform state" or "DRIPS" (S3-like), "Sleep", "Resume",
>>> +"Screen Off", and "Active".
>>> +
>>> +The system begins in the "Active" state. Either due to user inactivity or
>>> +user action (e.g., pressing the power button), it transitions to the "Screen Off"
>>> +state.
>>
>> So are you implicitly suggesting that userspace should be responsible
>> for *telling* the kernel that the screen is off?  I feel some DRM
>> helpers are missing to make it easy, but after such helpers are made the
>> kernel "should" be able to easily tell this on it's own.
> 
> There are two issues with this
>    1) Windows implements a 5 second grace period on idle before firing
> that firmware notification [1]. This is also a partial debounce, the
> kernel cannot do that reliably or with the finesse required for such a
> notification

Why can't the kernel do this?  I'm thinking something like this pseudo 
code that is triggered when number of enabled CRTCs changes:

if (in_suspend_sequence)
	return;
switch (old_num_displays) {
case 0:
	display_on_cb();
default:
	schedule_delayed_work(&drm_s2idle_wq);
}

Then if the "normal" suspend sequence is started the delayed work is 
cancelled.

If the "normal" suspend sequence doesn't start when it fires then it 
would call the display off callback.

>    2) Windows clearly states virtual or real and virtual can really
> mean anything here.

In the context of the kernel, to me this is a DRM driver that has made 
outputs that are not tied to a physical display.  Does it mean anything 
else?  They should still be DRM connectors, and they should still have a 
CRTC AFAICT.

> 
> In the end, only systemd and the compositor know if both conditions 1
> and 2 are met and as such can be responsible for the notification.
> 
> However, if that notification firing before certain CRTCs are
> deactivated causes issues, such DRM helpers could be used to block the
> transition
> 
> Link: https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/display--sleep--and-hibernate-idle-timers
> [1]
> 
>>> Afterwards, it is free to transition between the "Sleep", "DRIPS", and
>>> +"Screen Off" states until user action is received. Once that happens, the system
>>> +begins to transition to the "Active" state. From "DRIPS" or "Sleep", it
>>> +transitions to "Resume", where the Power Limit (PLx) is restored to its normal
>>> +level, to speed up finishing "Sleep". Then, it transitions to "Screen Off".
>>> +If on "Screen Off" or after the transition, the display is prepared to turn on
>>> +and the system transitions to "Active" alongside turning it on.
>>> +
>>> +To maintain battery life, in the Windows implementation, the system is allocated
>>> +a maximum percentage of battery and time it can use while staying in idle states.
>>> +By default, this is 5% of battery or up to 2 days, where the system designer/OEM
>>> +is able to tweak these values. If the system exceeds either the battery
>>> +percentage or time limit, it enters Hibernation (S4), through a concept
>>> +called "Adaptive Hibernate".
>>> +
>>> +
>>> +S0ix Standby States
>>> +==================================
>>> +The following idle states are supported::
>>> +
>>> +                 ↓→  <Hibernate (S4)>
>>
>> I think S4 distracts in this context.
> 
> Sure, can be removed.
> 
>>> +    <DRIPS> ↔ <Sleep> ↔ <Screen Off> ↔ <Active>
>>> +        →       →  <Resume>  ↑
>>> +
>>> +.. _s2idle_drips:
>>> +
>>> +DRIPS
>>> +-----
>>> +
>>> +The "Deepest run-time idle platform state" or "DRIPS" is the lowest power idle
>>> +state that the system can enter. It is similar to the S3 state, with the
>>> +difference that the system may wake up faster than S3 and due to a larger number
>>> +of interrupts (e.g., fingerprint sensor, touchpad, touchscreen). This state
>>> +is entered when the system is told to suspend to idle, through conventional
>>> +means (see :doc:`sleep states <sleep-states>`). The system can only transition
>>> +to "DRIPS" while it is in the "Sleep" state. If it is not, the kernel will
>>> +automatically transition to the "Sleep" state before beginning the suspend
>>> +sequence and restore the previous state afterwards. After the kernel has
>>> +suspended, the notifications LSP0 Entry and Exit are used.
>>> +
>>> +.. _s2idle_sleep:
>>> +
>>> +Sleep
>>> +-----
>>> +
>>> +The "Sleep" state is a low power idle state where the kernel is fully active.
>>> +However, userspace has been partially frozen, particularly desktop applications,
>>> +and only essential "value adding" activities are allowed to run. This is not
>>> +enforced by the kernel and is the responsibility of userspace (e.g., systemd).
>>> +Hardware wise, the Sleep Entry and Exit firmware notifications are fired, which
>>> +may lower the Power Limit (PLx), pulse the suspend light, turn off the keyboard
>>> +lighting or disable a handheld device's gamepad. This state is associated with
>>> +the firmware notifications "Sleep Entry" and "Sleep Exit".
>>> +
>>> +.. _s2idle_resume:
>>> +
>>> +Resume
>>> +------
>>> +
>>> +The "Resume" state is a faux "Sleep" state that is used to fire the Turn On
>>> +Display firmware notification when the system is in the "Sleep" state but
>>> +intends to turn on the display. It solves the problem of system designers
>>> +limiting the Power Limit (PLx) while the system is in the "Sleep" state causing
>>
>> AFAIK, PLx is an Intel specific acronym, it's probably better to be more
>> generic in documentation.  You mentioned PLx in a commit too.
> 
> Microsoft used this term in their documentation [2]. Can update to
> generic terms.
> 
> Link: https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/modern-standby-firmware-notifications#turn-on-display-notification-function-9
> [2]
> 
>>> +the system to wake up slower than desired. This firmware notification is used
>>> +to restore the normal Power Limit of the system, while having it stay in the
>>> +"Sleep" state.  As such, the system can only transition to the "Resume" state
>>> +while in the "Sleep" state and cannot re-transition to the "Sleep" state
>>> +afterwards.
>>> +
>>> +.. _s2idle_screen_off:
>>> +
>>> +Screen Off
>>> +----------
>>> +
>>> +The "Screen Off" state is the state the system enters when all its displays
>>> +(virtual or real) turn off. It is used to signify the user is not actively
>>> +using the system. The associated firmware notifications of "Display On" and
>>> +"Display Off" are used by manufacturers to turn off certain hardware
>>> +components that are associated with the display being on, e.g., a handheld
>>> +device's controller and RGB. Windows implements a 5-second grace period
>>> +before firing this callback when the screen turns off due to inactivity.
>>> +
>>> +.. _s2idle_active:
>>> +
>>> +Active
>>> +------
>>> +
>>> +Finally, the "Active" state is the default state of the system and the one it
>>> +has when it is turned on. It is the state where the system is fully operational,
>>> +the displays of the device are on, and the user is actively interacting with
>>> +the system.
>>> +
>>> +Basic ``sysfs`` Interface for S0ix Standby transitions
>>> +=============================================================
>>> +
>>> +The file :file:`/sys/power/standby` can be used to transition the system between
>>> +the different standby states. The file accepts the following values: ``active``,
>>> +``screen_off``, ``sleep``, and ``resume``. File writes will block until the
>>> +transition completes. It will return ``-EINVAL`` when asking for an unsupported
>>> +state or, e.g., requesting ``resume`` when not in the ``sleep`` state. If there
>>> +is an error during the transition, the transition will pause on the last
>>> +error-free state and return an error. The file can be read to retrieve the
>>> +current state (and potential ones) using the following format:
>>> +``[active] screen_off sleep resume``. The state "DRIPS" is omitted, as it is
>>> +entered through the conventional suspend to idle path and userspace will never
>>> +be able to see its value due to being suspended.
>>
>> If you follow my above suggestion, I think this file is totally
>> unnecessary and then there is no compatibility issue.
>>
>> It would mean that userspace if it wants to see this "screen off" state
>> and associated performance needs to do literally just that - turn the
>> screens off.
> 
> Please see the reasoning above for Display On/Off. Also, you omitted
> sleep and resume, which have no hardware analogues you can hook into
> and are just as important if not more than Display On/Off.

I suppose I'm not seeing the argument yet for why "sleep" and HW DRIPS 
need to be different.  What kind of things would be allowed to run in 
this state?  Who draws that line?

As it stands today the kernel freezes all tasks when suspending, so in 
this "half" suspend state I feel like there would need to be some sort 
of allow list, no?

> 
>>> +
>>> +Before entering the "Screen Off" state or suspending, it is recommended that
>>> +userspace marks all CRTCs as inactive (DPMS). Otherwise, there will be a split
>>> +second where the display of the device is on, but the presentation of the system
>>> +is inactive (e.g., the power button pulses), which is undesirable.
>>> \ No newline at end of file
>>> diff --git a/Documentation/admin-guide/pm/system-wide.rst b/Documentation/admin-guide/pm/system-wide.rst
>>> index 1a1924d71006..411775fae4ac 100644
>>> --- a/Documentation/admin-guide/pm/system-wide.rst
>>> +++ b/Documentation/admin-guide/pm/system-wide.rst
>>> @@ -8,4 +8,5 @@ System-Wide Power Management
>>>       :maxdepth: 2
>>>
>>>       sleep-states
>>> +   standby-states
>>>       suspend-flows
>>

