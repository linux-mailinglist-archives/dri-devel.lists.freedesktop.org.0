Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC5A4F7CA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 08:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B2D10E1B2;
	Wed,  5 Mar 2025 07:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jpTUXt+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F3110E1B2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 07:19:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7VkYAcngifAkprKCAuuAfS6iaLhPMXWDrC3kALbxWvyTS8ORRJUdPW9GdkXJda4jmO0wbNaeCRYDvljqR4Xx/atsr/MkMHNmaqPDj/eYQ9ZMc/5PupRYvtgS6+n3kmx85CfkdrzV/3iUenme+w1wRrPyVt/OsiKpoluH30tbnjr1mK3ZF6RMdBm46bbPMvrtV8OJFAGaRzqTwiL+pq5o9KmacbZ5gqAtqVzWOtwtfXho3lag9ZmkNS0avsBximuNtzzWW+cVKaAh6vuRhwakcDvRqMLQrJmV85qFQ9feuIZOYhfnz071V3xhUXgqyra1fEl5lQCzka+MctxQTjElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHO96djdnnMIuhuqWx2wJVegvwwl5avMA9vCFhexqJ4=;
 b=Fyuj8PWrOFXYNfaMGdJQ2Ntadbbs4ReFyF+u42IwhvrGDTjsNxiQ6B4sELVHcdNa7gFBNanvzP49tF9YucmOljtr2mtp0CM/rFXFlsUST60mLbxH3gMkMISRQ/SHr/AuKd9eRdNqAedQTL7jWWKYVPZW5Wn6elLXHRzirfbX7dPqjHYYOnwztqDDGtWDBuoQQc0APqsMpND+MKQHMt1M1tEnHWGTB6PcT2MJLiSceyoDYlTuCuim47nv0Zxrto21ktKAaLcM95YnU2f8dIv/FnQnkSmFZ1Cn/qlfXQlAemrPhPKKLWd69cHKtLzMqyfoI7nrWdqRuN71zckZXtp7YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHO96djdnnMIuhuqWx2wJVegvwwl5avMA9vCFhexqJ4=;
 b=jpTUXt+LI7fryU7th1nIY1FE+XXzWma3LphYwi5C4QNkKe8M4UjyawCowOIWG9KLN4WpJqjNLMbnzZbCF3+1yuuXZm/enivFr5/AeeeiXSzV4irVTEIAsabhqcrGdUvdN8+WA9bVDf0xn1/CGzdL3bAOi6oM9mu2byqwhlSFYKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB7494.namprd12.prod.outlook.com (2603:10b6:208:41a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 07:18:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 07:18:57 +0000
Message-ID: <d34725de-efc7-4c89-8505-fb68d093d02e@amd.com>
Date: Wed, 5 Mar 2025 08:18:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/1] drm/mm: Introduce address space shifting
To: "Lis, Tomasz" <tomasz.lis@intel.com>, dri-devel@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250204224136.3183710-1-tomasz.lis@intel.com>
 <9db7851b-d860-47ea-8226-f5b5a1111c21@amd.com>
 <4493a2ec-3d88-4036-bf45-237e192cbe2d@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4493a2ec-3d88-4036-bf45-237e192cbe2d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 22cd7e33-02dd-47a7-15d5-08dd5bb5fe99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3RKWlQ5SzdDR1dyaHdFZ0xRbEZhQVJNTHRNdUQyQi9KUXpkWHAxUEFKMjF3?=
 =?utf-8?B?emFPSEdPcFRxRGdWNFRuVXJYKytnVlZkby95bGdwK0dtcDJFNzBJaGdYYnBE?=
 =?utf-8?B?OHpYTWhmeUhGa2FGbnVPdHRzLzdoT0FHZ09aRE9MK0djSk9hcjZES2ltMUtY?=
 =?utf-8?B?QzBRcnV0T0VRb3AySU9ibC9NbUlCd3NuRWx5NW1XZUN6b2Nhb2hTTzFlenQy?=
 =?utf-8?B?NWV3VTR4UlRRMHB0Z240NVVVYm9pbjBnVFIzWWZtNU56Z0hPN0wwVXhuYVJv?=
 =?utf-8?B?MWo2QjgyZzNmNTBJejZNY1BrUnBJUU1FRFl4NWRuQWJ2TG5DbnJvbmJObFFV?=
 =?utf-8?B?WU52UVdmMi9UbFVrTS9mcU5ZcDNucDhnejJialNFTHFOdnR4MXZ1bXZYdlpt?=
 =?utf-8?B?V2lFMG0vRzB5S2FCWTlYWUdScFdSKzRJellaTWhybU9ENVZjNXo5SWRDejVB?=
 =?utf-8?B?M1JRb2FNTy91QWg2RFV6UTVtTkt4MlNlVlY5Tk5la0RqaXFhSmdZWWxnSFla?=
 =?utf-8?B?MWgvS0tEMUlZRVlSM3NTNFdMczdUVXNwQVZRREtUZHFRS0YrS000UC82dlBE?=
 =?utf-8?B?VEZaWDkwUEg4Z2JuNXU1T0lqWUkwblZwSXlSc05PemtVSGIxcUVYdUY1U09T?=
 =?utf-8?B?cDc0V09WaGZhQkVxbVVYaDlNVUE0Yk1SNkttQXBRYTkwUVZkTExGd1BHaHZH?=
 =?utf-8?B?VnY1ajhHQWdHRC9HakdWYnFjNGNqY05aYVRHcWEvZlF6dFZERWJjcXFhenUx?=
 =?utf-8?B?bjFJbHpLdVgrY0J6SzBlWUFoZUhYMmRadlJ0SFJXQTNabzF0MjUvdWdIUCtk?=
 =?utf-8?B?Tm9McVdaMFNWQW81Rlp3ZnFZSWFlVFRVMlRxN3duTzhwaUsyMzg5dGVlN3pJ?=
 =?utf-8?B?RVVTUUdta3NhU1hOY3NtRnVGZ0RsdmJuZFdhNkFsazZMVWlESi9iU1ljTWZD?=
 =?utf-8?B?T1RsQUtseTFGcnFyZ0ZHcFNpVXN2TEpEdGMzamdKNEFkalB0SXJMWXpSWG9t?=
 =?utf-8?B?UVBKL2sxNndMbkNiaE0zdjVjL3NHUFFwVHlTS1ZyOTBkVGNhY0M5S21HQU56?=
 =?utf-8?B?a3pQbTA3UTF6QmxPTXZGc2NiNC95YUJtd2p4V2hkMFk4cUxSbHY1ZlFzK1Rr?=
 =?utf-8?B?ODVUWVBwTFJsU2FYRVdUM2t2akNQYllrbHFxT0VQdnNFb0ZqQXFvNzY0SGh5?=
 =?utf-8?B?aWFwelNXSHczUmVBNjh3THgrekppSERMcVpHV2lMcXBqYjU0UWRxTGc3SXdK?=
 =?utf-8?B?cDBGbW56NlQrcG5vMHErcHltcFdxRVZtUWhzSGwzYUF5aXpYMGgrbzF6dG9U?=
 =?utf-8?B?Z2lJMnE0RnlLOG00TDVFcTB1ZnNMZFN1UmxLS0RFaUFIRXdLRmRua2FEY1pi?=
 =?utf-8?B?aWFzWHBnamllSDRpZ2RrNDNiQWJra1NSbWhKZllWOStJa2RZcldLbUNFK24z?=
 =?utf-8?B?YUhxOWdhamlncTVOUyt6RVJ4YU1pSVEwVGZVd05RdkRINzgybHpnV0FDUzJW?=
 =?utf-8?B?T0djWXZyVU9iRmRtNEV6Qkd4cC91aDE0UXpOYVM5RGpkdkpOMFFPdGxNOVF4?=
 =?utf-8?B?YXhYNG9HZGpkZHVhcW9jYXlGbGx1THRpRWxPMTg0Rmk2TEVib3Y4Z3pqRmdH?=
 =?utf-8?B?aVo3ZXp3U3dXV3ptbWZyQ2lkeGpxNGdXcmpFVTAxZnltRzk2TzY2NUNHam5L?=
 =?utf-8?B?YVd6YjMzVk5sUHhFdmFFelVldVByYmdOaitNYTVqY2hVVW9vbzBBYStSd0wx?=
 =?utf-8?B?dU9KVzFWSFdLUFU1cFZWT0pHM3owNTlhWU85K2tEdmxIOEwzVEhodENnando?=
 =?utf-8?B?RUR0NHJwa1NGWmRGbW56YXZvc0p6aTJNODhJMEliMk5FdzRDdGJZRmwyVlF1?=
 =?utf-8?Q?vyrDo4LKvvuOr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3R5K2k0U2VEQzNlKzZqV1pVaytzblRSSnJmVWRWMll4cSsvNEpJcmpsb2I5?=
 =?utf-8?B?OGNLTWl3Y1Fsa3NteWE3TWxQeURQVUZxbDdwNHlSSmZDTG9wZTlZaHc4dU85?=
 =?utf-8?B?WkJYRnZwckZpMzJZdUhhN1E2dWIvTEtoRkpteEZLVDJEc3VGSGZXZ2ROUk5K?=
 =?utf-8?B?WnI5TEdJSzNzL3llZ0NzTG9kMHFJSGpRS2Q5Snh4RFpzb2p6R3BHK3Z3bHM0?=
 =?utf-8?B?SHo1VEZ5bzY5dXVyVVdidC9Ya1dKNEg1b1ZlOFUyRnBISnFDUHZxbmVJeVlt?=
 =?utf-8?B?WDZnSVFvVjZSSFZIK3Y0cGtmU2c4NFZNa3FKaW5WQkFSM0JBaFBPU09ZR0gr?=
 =?utf-8?B?V1pyeWpUbzh2UE9YcXFPa0RCaGU2SnVmanoxTi9yd2lha1pVSW1jYXllbldW?=
 =?utf-8?B?UzFYcnQ3MXhCbW9YQU1EeXpBVVgxaDcxWHU2Y1hmNnl0NW41RW41TERSVGNq?=
 =?utf-8?B?R2l1Ri9tdnNtN1l6ODNXZk4xWk05N1FJdUNCTjVhdDdPQlZLOWFualBRY2xM?=
 =?utf-8?B?SVpDclg3dmZoUEhwWDQ2MjQ0ZndYTGZFVVExc1I2aGo5NXdNekJGUzhuUXJX?=
 =?utf-8?B?ZXMrdFpnNkViZS84MzJ4bVNhU2Z6UHJVUEJPUFJrM3NldWZSbGdKMEFQZ2dH?=
 =?utf-8?B?Z3BNb1U5ajFDRXNQeFNUcmFzWmw0Q1ZMMGJ5c2ROUW4zV0FmL1J4TGtoaS9U?=
 =?utf-8?B?SE44TTJKdGVMYmZyaG00Y29WRlMzOWo1b0J4alZ4Y3R3WTkrdkpkVnV5UlRy?=
 =?utf-8?B?NTZqaVVpRWVqTnFwTW9IUFo5MGlpd2J6ekpkbmhHYm1mcTltSWdRRGhmdmds?=
 =?utf-8?B?TnQwTEhTWTJPUXplbmFqbjFnS0hxY1cvY1FKUVdISCtSVXRYSmt6Uk9JUGJi?=
 =?utf-8?B?UDNJQ1VVNHc4djVTK2xhZFdhUFFLamhPZ0k5a1ZROHdRUStJKzcwZTJZeFZn?=
 =?utf-8?B?ZXFUemt6Qld5aktKQU5vV1QrcXpvb0dQdDVjWEtxSHNJWkNpVWZiTjZ5ZzhJ?=
 =?utf-8?B?blFUamt0VDhWSDNyUTVoUkpSSERoVjNYSGN6L3pBM0pqa2VEd0NWNXVrbktN?=
 =?utf-8?B?N05uSThualp0cE5XTjE1Z1RVN00yYUUwaklZMFc1S09OS0Rnd3BGZTdTaFpz?=
 =?utf-8?B?SGJmUFZ6a2QzTmZHT0xvT2F3NTAxR2dtQ1NSRitYVStacUZHZU1MaHhjaExG?=
 =?utf-8?B?L3dxaXV6aHUzazVhZlMvb2lqUG9BZi9uZVI4SmdpZTVFbDNoWVVrK0FhbmE0?=
 =?utf-8?B?U0o3aWJIeGtsQWlvSHY1MHMyTXZIUFc3MFNPT1NsZ3VXYzIrSlFXZDZEL0dV?=
 =?utf-8?B?UnZYYVhoWkdpaVZTWDh6SFpsOXFNNXVMd1NFRVpKY3ozVGJ6V25YSmlNQUov?=
 =?utf-8?B?TXdnaHZ3TnpzVmhvYU43YnFBZEJ5SmJvaG02aVlJYVFaeWoyU3dZRHVzbGdz?=
 =?utf-8?B?N1JBazZtbnA4KzAzYVRSUEozN3Bzb3Vnb015MWh2Y1hrUmpJUFdLQXNjeDQ1?=
 =?utf-8?B?aVVvUHBoWDdOdTlqT0pCYVJZd29md29TSGVTak1VWE9UdW1HdFN6M3dmUkJD?=
 =?utf-8?B?TEU2d2YxSGZTZ1Qxd1pua2xZOEI5WlV3M3ZCWGNuWUtWd3FGcm55T2VSdWZi?=
 =?utf-8?B?NnJTb05ZbmdJMW9Db0lRdzF1MkdKdzZpbVlRK0x3dmZ5blFxYlBaSDFFZE5P?=
 =?utf-8?B?U0dWbllIdVZ2Z1N6T2l1YTNJNStXSEt2NTlFRGE4RDEwd0paMTduSG5EaGdk?=
 =?utf-8?B?bDdNdTZURzlZY2FBVFk4UjlPSmhiOUExRFpJeDBxUTY3WXRvT0xEQnBsSHUx?=
 =?utf-8?B?YzRTQVIxUWVNaG9iVEJ4aFR5bjlYNlNDV3JuK2F2Mk9sdC91OWhCRzBmeXZo?=
 =?utf-8?B?QktWaWZOUkM2VHVCdDFDVTUyeWI4YjNKcVphUWRxOXVwNlV6eUQydEVpVnI5?=
 =?utf-8?B?ejc3dDZVdG92ejVkS2QvMDBmRTVqTkNiVk1mbDJJTjR1YmdQSkxibjRWZ3FW?=
 =?utf-8?B?VFZ2MUlTUlJ0UnFpS1JZMHdpK29JTnVnaXY5bHlpb1VYcm9Xa0dVUEFuSDVz?=
 =?utf-8?B?QXY0bFRHa0lJSGlPZEN6T3dZdDNINGRmZFZiQVhhYWprSUpiOE50SGlwT0hp?=
 =?utf-8?Q?JyysU0ZZZWcIDqWxi1BZD/LO8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22cd7e33-02dd-47a7-15d5-08dd5bb5fe99
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 07:18:57.6740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7d/5In85LcsM2tdOKxD0maF4htpdx9AuZUbOZtBKUT6HiKTaBjb2aLPbcQjPHlo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7494
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

Am 05.02.25 um 17:02 schrieb Lis, Tomasz:
>
> On 05.02.2025 09:32, Christian König wrote:
>> Am 04.02.25 um 23:41 schrieb Tomasz Lis:
>>> This RFC asks for introduction of an interface which allows to shift
>>> a range managed by drm_mm instance without repeating the node list
>>> creation.
>>
>> What do you mean with "shift" here? As far as I can see from the code you just modify the start address of each node, e.g. you manipulate the offset.
>
> Yes, that's the idea - move the address space to a different base.
>
> Should I use different terminology?

Yes, absolutely. A shift is usually something different than an offset.

>
>>> The long explanation:
>>>
>>> Single Root I/O Virtualization is becoming a standard GFX feature
>>> in server environments. Virtual Machines provided with direct access
>>> to virtualized GFX hardware, in form of VFs, need to support the
>>> standard set of features expected by Virtual Machine Managers.
>>> These standard features include ability to save the VM state, and
>>> later restore the VM, possibly on another machine with different
>>> setup. For the restore to succeed, the GFX hardware model must match;
>>> but for its configuration, some differences are often allowed. Such
>>> alterations may include a different range of non-virtualized
>>> resources assigned to the VF, including global address spaces.
>>>
>>> If any non-virtualized address space is saved, as part of VM state,
>>> on one machine and restored on another, it may happen that the target
>>> range differs from source range. To shift the address space,
>>> currently creating a new drm_mm object is required, and moving all
>>> nodes to the new object while adding the shift.
>>>
>>> GFX hardware handled by Xe driver contains Global Graphics
>>> Translation Table, which is an example of such non-virtualized
>>> resource. Should this interface change be accepted, a series which
>>> utilizes this interface in Xe driver will be prepared.
>>
>> Well that sounds exactly like what AMD is doing, but we just add the VRAM base to the MM node when calculating the final address in the MC address space.
>>
>> On the other hand AMD hardware has different address spaces, e.g. VRAM in page table always starts at address 0 while in the MC address space it has a certain offset which differs from device to device.
>
> We use the drm_mm in a similar manner - some address spaces start at 0, other use a narrower range. But we do not add any base after creation - we have the nodes at final offsets.
>
> There is one more technique we use in few places to restrict range of valid addresses - we create "balloon" nodes which fill up the inaccessible areas. When the accessible range shifts, we then remove all notes, and add them back with balloons resized and the rest of nodes just moved by an offset.
>
> Using the function proposed in this RFC will actually force us to abandon the ballooning approach for VF Global Gfx Translation Table address space and refactor the code to give only the accessible range to drm_mm. That is why I'm sending the RFC without use example - we will have to refactor the Xe code to use it.

Well that approach looks overly complex to me.

Just maintain the VF offsets separately to the drm_mm nodes and apply it in your address calculation whenever necessary. That's basically how all other drivers do it as far as I can see.

This way you don't need to update all nodes whenever your base offsets changes.

Regards,
Christian.

>
> -Tomasz
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>>
>>> Tomasz Lis (1):
>>>    drm_mm: Introduce address space shifting
>>>
>>>   drivers/gpu/drm/drm_mm.c | 24 ++++++++++++++++++++++++
>>>   include/drm/drm_mm.h     |  1 +
>>>   2 files changed, 25 insertions(+)
>>>
>>

