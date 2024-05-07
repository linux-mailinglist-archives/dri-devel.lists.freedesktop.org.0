Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BE58BE3B5
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F4510F5A8;
	Tue,  7 May 2024 13:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qYX1tFCl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320EF10F59F;
 Tue,  7 May 2024 13:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iq00Hd3W615eovw/R+RSizrDPx5B+zFpCs1OycFNxX4cGkBfpZzOMfcUiVJmjZAkYB8jy+AWTP9oIZIya1/uAUdqjXy7tySe6spBTO9ek7e84VZqeQ0/DpYSqZ8cNpEQaNL9Wsuw2HpZDRE9ZQrgQq9lgol/fIoBej3J8CcgM55AYSAmESzIcS1DbI72hwbqJqqlFsr98iWRecF3CTf5LgEbMiogzcv2mx+XqnaCxJYrl1NYmBMXlnOTSdZgNs4vKlGKRbB4yOmkot8JpdZt7EtdRHnHusirRZS5eL/cUe3rgyph18nELb+opw8ARoto3JZjPLoGSMxcJ0XCNu1+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXS/nlFDAouVSjEKew9zhPSpZyzfy146y3dT8rSM+sE=;
 b=OusfklE+qNKYBxxfedOUiOfapxhd7Y96RDyRxXt/9S9Wc/niIARcgKobv1llYzJSFZfAbfEbzAtTDtaBc4Bz/RHh0CXlgr3banSZ1psq8m0uFCwdZiNXhubPIgPGnKLmlbonX9aMUiWfPsqMfYuOmkvE7raifdrRTLss7x97kvpLRV/segPK7xw2qswsCqmhIpLCKhsSK/vgGc+GyIhMfqyw3Ld2076pdZymklktOx8MC3jn6+SgA7zmdnSxMxb9Z/7uUSDZ8bWkxGxlcAHgo5CmDybOwAEihlxxv6/FirTv2IXLGvQn0W79M127d5YPj422a5CfkYZzKdW4SYvJNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXS/nlFDAouVSjEKew9zhPSpZyzfy146y3dT8rSM+sE=;
 b=qYX1tFClLyRxfd+gVtrjIbjY+A1CKLTUysafkdcth4veOyY6XLXJBxMycjqwS/l/DWo6peWap0eWPWZGzzyik03WR8MQ+WXrpggLiaLVmyl7ga+Kb/EZ3ZrXn6VyN0CVlv774YY+QFDBEKRGwlaJHspCbZd2yCxWQaJ7Tc58Ob0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8415.namprd12.prod.outlook.com (2603:10b6:8:fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Tue, 7 May
 2024 13:23:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 13:23:16 +0000
Message-ID: <24d4a9a9-c622-4f56-8672-21f4c6785476@amd.com>
Date: Tue, 7 May 2024 15:23:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@linux.intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20240507080456.613786-1-shuicheng.lin@intel.com>
 <2a9a7bb2-c74d-44fb-b9d2-cbb42e462d0f@linux.intel.com>
 <96b6a562-eeaf-49f9-9ade-d58fb061086d@linux.intel.com>
 <fs2aq6wgrsoilkk4spw7fbmvxnbovn555qbney6aqwetflvg75@q4zsc2l2v64s>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <fs2aq6wgrsoilkk4spw7fbmvxnbovn555qbney6aqwetflvg75@q4zsc2l2v64s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: 0777ab33-7cd6-47cc-4c19-08dc6e98daaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bW44NHdwZ0VoUC94amV6c3JZZVpQdnMxam84aFRSWWo5aks3RzRtSHE5Ly9E?=
 =?utf-8?B?eTFXQW1pblp6NGhnYy93c0x3UU1zZWUrTVFZUzR1ZXVsbGNta0l6TjJYd2RH?=
 =?utf-8?B?dm54ZUhLSVduTnd5cVJzNTNHb01ZemRoVWFSQnZwSDFIWjQ5WlAxTlE1ektP?=
 =?utf-8?B?ZDZ4bGF1bHE3MzZmQkhGbXprc2VydUxQcmFLRVliREdqL1ZmSHVpM3g4eWNG?=
 =?utf-8?B?QzIzeGJMeTN6aFRUbExTUXlkc1hHa2U4djdEaG83d1hMN0I5eHArQ2tvS2I2?=
 =?utf-8?B?R0lsUE1nUk9ZaXF2U0xVNGVGeHJWbGNDaDBST09SRVg5REJxcVRYaE9OVXpZ?=
 =?utf-8?B?bjJkTlN4eW4xWkdBc0cySFFXM21FYmt4QXlzRHpVU1BtblpqUEoxUVBZSnNm?=
 =?utf-8?B?SFpzMUNVZ0ZmSHBaNEMvTlljNWU2d2ZyRWZjRTNUaFVCcDRGUXYwOVhJQi83?=
 =?utf-8?B?NXBnV1hsOHdUeVVRVGM2QnN3dEIzMUptZURtRG9mZjFSaC91VGRBZllaMWUv?=
 =?utf-8?B?ZVBiQVFVMnFRNldiWkg0MFJXVkdtQTRjdUdaZ09rWmxndEVraXZSeURzSzV4?=
 =?utf-8?B?aGJ1c3RhemhxUzRoNGl5d3pWMng2SnI2YXZOdEFVclJ6V2Z6cThBUkNoU3Vh?=
 =?utf-8?B?U1ZSS2ZhWmUwYkJmUlB3V1hkWUEyUnRZcnFIWXFoSkwrNlFIYW5uSER2SU9V?=
 =?utf-8?B?V0VFVVJJRTdOb3lXcGRPQ1pMMXc5cGI0MjFsSWN1NDE3SnByQXZVQWx5ei9t?=
 =?utf-8?B?aEtEak9udVh2OS8wLytsRkNwbnE5Q3NVeGhtVzhab29HUUl6QXhNSmVmbnky?=
 =?utf-8?B?bzRPR1prOWwrbWd6YS9sMnZkeDFZcFExcWdmMkFyeGJScVRCajdsUXpIR2hk?=
 =?utf-8?B?NFROeVkvL3puTDZjenhONEtkZjVDc3pENGVZWUh1dEdjUDBrZEV0UWxNUWpU?=
 =?utf-8?B?NEFBTzM4eG1YT1FCdTZVcUhtWC9RK3JpaTQvWW1Nb0MzcENiT2g1TXlCbjJt?=
 =?utf-8?B?TFJjM0FydWpvdmtzMlFSeFNRVFA2T0thbEdCb0orejhMbWxnOUd6ejNaWjZr?=
 =?utf-8?B?VjZaS2xpdVM1bEc0RmNTUU1YUzZUUlVRc2gydm94N2U3anhETGozQTQ4Wmlv?=
 =?utf-8?B?a2ZEb3V5YjNaWnhBcWcyZWdzblc4N0lISjR5R3ZSTjlrT21yQm1uNVNESFhP?=
 =?utf-8?B?SmU3eVJTUko4UnArc1dmSCtPU3ZlczJRTThzb0oxb0k5WURKUkhWOVJYVnNL?=
 =?utf-8?B?TzFXNEpYN0VJcmI5eGNEUDBNbHVjWEYwL3BIMFcvOGdvenVwNFNkeUNaa2RG?=
 =?utf-8?B?WHVWMFBoRzJkdlp0RDc1cG1YWmVDSEp0VXdyUW1USnVRWFAzNjdCc3lyNVNM?=
 =?utf-8?B?SU1sTnFwaHI5N29nYXQrWnV1V2JJR01lVUs4ek1oZnp0SGRTV283NWtEM0xZ?=
 =?utf-8?B?VWFWTUthb295TXZHY3Z2M3FBQjlNakVqd3pEbzZjM3lRcnJwNHZMTkxNREtw?=
 =?utf-8?B?TWtPYTZEelhXR2V6Z1VmOWVUVTFoR3l4SGFJVHljcThxQm1zT25yMC9lUkUv?=
 =?utf-8?B?cDJLQURORm4vUE5rT0J0aHlDQjdVUEd4enNZTG5uQ2lhYW1UMkZsLzQ3bWpG?=
 =?utf-8?Q?7TOTIa6JDMzue4dNHWSZpkAmJBIWa87COmECnpmD0juw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Szd4cVJ0Q3g4TkR3dDhJbXRzK21CRkpKV2Z1YWZqdEsyUXVYdGkyK1E2T28x?=
 =?utf-8?B?MzZpVEc4Mm9CVTczcjAvbk5WU3lURy9jdHBDdFEzNU95Mnc5TWp3WUtrWExV?=
 =?utf-8?B?eUlsaEdESFhZTS9uUDAwM3JJZkUzSTBkSlpmbUorcyt3UzlnOWtvWTlRQ2NZ?=
 =?utf-8?B?ME1YeDVNVVoxY0lyckZUSmw0MTFRZjBTYWRHVjZ4MVhPbDREck5HOU1GK1RI?=
 =?utf-8?B?czZ6QnJlM1VjQnpwa0pHTk9FdUpMeitXbVQreVdtbWFWT3FCVUdWb3cyakdN?=
 =?utf-8?B?b1ExMVE1VTdpQzk1ak0xK2lVcWY3Wjd0VDJJVng2Z21IZUVyVVp0MlZsQWQ4?=
 =?utf-8?B?clFLK3M2bm5leUwzYU5Ya1dJKzRhQXJpUFlmbHNmRFQ3djY2OFJydXU1WEJ2?=
 =?utf-8?B?dnFpdDc5azFuRzJoL1JmY1dxL01jeWE1SUdTek92ZUd1WUhvb3RIa2pvNkxa?=
 =?utf-8?B?a01RRTgvUUtjNUtpYllTKzZ6M0lZQy83ZUdLSzd4YVpmdGphVVB0Y2wwTVNV?=
 =?utf-8?B?Z1pXNnpHOEJxQktNY2NDNllDZ3cwMDZ0Mmk0WWJCN1pTWTAzSm0vTWpTdThV?=
 =?utf-8?B?RHpCOUdpM0M2Vys2TU1RWDV6ZEN3UnFwaWZsU1ZnbVFranBGeFUvK2JQUFcr?=
 =?utf-8?B?RkVjV2FiS1loY3VYdXFjU0xHSnZpdkFNTHFCcklRajJuOHZ3QjJVWlZYWlRn?=
 =?utf-8?B?UGs3MmY1TGxWRVgxY29OV3doT1d5WEtxUTJYKytPdzAvRUphRU1USlB2Y2hG?=
 =?utf-8?B?TVhUNkN4eW9KcFY1bzBpaVFhTzNxQUFxWnVtZDRjZnhWNDJlc2NPdmRxWUM3?=
 =?utf-8?B?OWRMNHRIa1c0WTVodXkxMHFidXJrTStlcWVUcXJJTHpVVk50a01ibzN6ZTg1?=
 =?utf-8?B?TDZhbkE1ZzVCTTJqajFxaTBuUURJWFNXODRaTkJ6Z3VlOWxWMnhzSEhBUTlV?=
 =?utf-8?B?RHFjWEw5dHk1TU9aVGlWZERTRS9xdk9FYzdpNGRZQ0p0L204dWlLZ1NIV2hu?=
 =?utf-8?B?VDk4QzFMems3T3EwdkZHWUNyZVBqVXFqMGFZSzdnY3JieWowOHlIMU9zK3RN?=
 =?utf-8?B?VkN1a0ZEcEV5MHhPY1pHaEk5aE9vODllRFlLMGlpVUdoUG9TdzZDR3JCUEFH?=
 =?utf-8?B?dEdmeHBKb3g3cUFYMkc4L2hmRGVwTklYS0l4SGQ1OFZIa09QOFZ6a0FkSy9H?=
 =?utf-8?B?ODdZazdwc2xEeHZNdEpCUjBJbU5nVGNnRFdISHRNSUZBT3VBRDBsS2RCOU9s?=
 =?utf-8?B?WGtURS9La3c1ck5MWEI4Y1FQZVQ3aW5QbjNoV2NySVFFcG02ZFNkeGJMcXR5?=
 =?utf-8?B?RG5mazlPZWkrTCsySjVwd0loUDlNZUE2d3ZsUW4vejdvcjhWVWoxeHV4cE9o?=
 =?utf-8?B?d0xSa09xZ2h5VXZ3NXZrMmc4cThPZjloNkRKbTRzaE8vaGdST1hSZTVaSVlt?=
 =?utf-8?B?U0V2YlM0Vi9oNXlaNEk1V2VUaGNkeTZjZkQ4SGNmNk5mN0VYNnRVVWVaVGsx?=
 =?utf-8?B?L3hHZUpaZFdaVEpQZVdLRnk3YmFVcVN6WVQxaDg0QWxtL3N6UHdxSlBJMUYz?=
 =?utf-8?B?ci9aeDNwTHovakFpa2laOHVqZWM4cDdwd1M4cG55cHkxVmdzZW1sSkhtR2Rz?=
 =?utf-8?B?Sk0zaVMyd3pxdEFOMlZpbVo5L2draHhLU2Z2VUhFSW9GWjc4M1BSOFlpMkZN?=
 =?utf-8?B?RmRlUWFMLy9PL3N3cExtcm9xN0tGS0NuYW9KcVptbXVjbXNNUjJpUGZqWUxz?=
 =?utf-8?B?Rjd1dUw4VjI1bEM1RHFPa0Jwa0EzZkl6V2d2TkpXRjJJOG1RMTBLZVZROU91?=
 =?utf-8?B?T0FUOGs2RWt6dWM0b3FWRnJneHZkRzAxaVNYY0hLN1JvSmRhYUtGQTh4V1VD?=
 =?utf-8?B?cFdRNFg0TTNpNE0wSnBUZStHNDF0QWRkbHhvdzlHbmoyTnc3WHZPSURmeWpN?=
 =?utf-8?B?a0VvZkZ3SU5mU0RXd25Uc2NyRCtZNnMzaDhRaEp0QnhrMzIyM3psNWRLd1Y5?=
 =?utf-8?B?Q3g0eVN0cGJMNU9hQnBURTA2OFFLeGIvc0tVSUVWRjZTbVFrU3E3bFBpcVJp?=
 =?utf-8?B?S2g3d2tUMGx2bGNQanp6REV2cTZCWWRIUzlIMDNHRHBHTHhLNVF4RzhMY25w?=
 =?utf-8?Q?IppaQnhtlcX9CAqSnifoevWCN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0777ab33-7cd6-47cc-4c19-08dc6e98daaf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 13:23:16.3810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fiCAyj2xjX/zrue7Sf5I7d7YNBz8j7AJcduBbDDfwKPZHQQgNWxOWxJbWvePZXwD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8415
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

Am 07.05.24 um 15:18 schrieb Lucas De Marchi:
>
> +Thomas, +Christian, +dri-devel
>
> On Tue, May 07, 2024 at 11:42:46AM GMT, Nirmoy Das wrote:
>>
>> On 5/7/2024 11:39 AM, Nirmoy Das wrote:
>>>
>>>
>>> On 5/7/2024 10:04 AM, Shuicheng Lin wrote:
>>>> Here is the failure stack:
>>>> [   12.988209] ------------[ cut here ]------------
>>>> [   12.988216] UBSAN: shift-out-of-bounds in 
>>>> ./include/linux/log2.h:57:13
>>>> [   12.988232] shift exponent 64 is too large for 64-bit type 'long 
>>>> unsigned int'
>>>> [   12.988235] CPU: 4 PID: 1310 Comm: gnome-shell Tainted: G     
>>>> U             6.9.0-rc6+prerelease1158+ #19
>>>> [   12.988237] Hardware name: Intel Corporation Raptor Lake Client 
>>>> Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS 
>>>> RPLSFWI1.R00.3301.A02.2208050712 08/05/2022
>>>> [   12.988239] Call Trace:
>>>> [   12.988240]  <TASK>
>>>> [   12.988242]  dump_stack_lvl+0xd7/0xf0
>>>> [   12.988248]  dump_stack+0x10/0x20
>>>> [   12.988250]  ubsan_epilogue+0x9/0x40
>>>> [   12.988253] __ubsan_handle_shift_out_of_bounds+0x10e/0x170
>>>> [   12.988260]  dma_resv_reserve_fences.cold+0x2b/0x48
>>>> [   12.988262]  ? ww_mutex_lock_interruptible+0x3c/0x110
>>>> [   12.988267]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
>>>> [   12.988271]  ? vm_bind_ioctl_ops_execute+0x5b/0x740 [xe]
>>>> [   12.988345]  vm_bind_ioctl_ops_execute+0x78/0x740 [xe]
>>>>
>>>> It is caused by the value 0 of parameter num_fences in function 
>>>> drm_exec_prepare_obj.
>>>> And lead to in function __rounddown_pow_of_two, "0 - 1" causes the 
>>>> shift-out-of-bounds.
>>>> For the num_fences, it should be 1 at least.
>>>>
>>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>>> Signed-off-by: Shuicheng Lin<shuicheng.lin@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index d17192c8b7de..96cb4d9762a3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -2692,7 +2692,7 @@ static int vma_lock_and_validate(struct 
>>>> drm_exec *exec, struct xe_vma *vma,
>>>>      if (bo) {
>>>>          if (!bo->vm)
>>>> -            err = drm_exec_prepare_obj(exec, &bo->ttm.base, 0);
>>>> +            err = drm_exec_prepare_obj(exec, &bo->ttm.base, 1);
>>>
>>> This needs to be fixed in drm_exec_prepare_obj() by checking 
>>> num_fences and not calling dma_resv_reserve_fences()
>>>
>> or just call drm_exec_lock_obj() here. ref: 
>> https://patchwork.freedesktop.org/patch/577487/
>
> we are hit again by this. Couldn't we change drm_exec_prepare_obj() to
> check num_fences and if is 0 just fallback to just do
> drm_exec_lock_obj() as  "the least amount of work needed in this case"?

No, and that reminds me (again!) that I wanted to add a WARN_ON for this.

If you don't need a fence slot in the first place then you should only 
use drm_exec_lock_obj() instead of drm_exec_prepare_obj().

If you dynamically calculate the number of fence slots needed and end up 
with zero then there is most likely something wrong with your calculation.

That was intentionally made like this because we ended up with quite 
some bugs around that.

Regards,
Christian.

>
> Something like this:
>
> | diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> | index 2da094bdf8a4..68b5f6210b09 100644
> | --- a/drivers/gpu/drm/drm_exec.c
> | +++ b/drivers/gpu/drm/drm_exec.c
> | @@ -296,10 +296,12 @@ int drm_exec_prepare_obj(struct drm_exec 
> *exec, struct drm_gem_object *obj,
> |      if (ret)
> |          return ret;
> |  | -    ret = dma_resv_reserve_fences(obj->resv, num_fences);
> | -    if (ret) {
> | -        drm_exec_unlock_obj(exec, obj);
> | -        return ret;
> | +    if (num_fences) {
> | +        ret = dma_resv_reserve_fences(obj->resv, num_fences);
> | +        if (ret) {
> | +            drm_exec_unlock_obj(exec, obj);
> | +            return ret;
> | +        }
> |      }
> |  |      return 0;
>
> thanks
> Lucas De Marchi
>
>>
>> Nirmoy
>>
>>>
>>> Regards,
>>>
>>> Nirmoy
>>>
>>>>          if (!err && validate)
>>>>              err = xe_bo_validate(bo, xe_vma_vm(vma), true);
>>>>      }
>>>> @@ -2777,7 +2777,7 @@ static int 
>>>> vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>>>>      struct xe_vma_op *op;
>>>>      int err;
>>>> -    err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
>>>> +    err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 1);
>>>>      if (err)
>>>>          return err;

