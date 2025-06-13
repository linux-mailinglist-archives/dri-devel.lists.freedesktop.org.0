Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365ABAD8E2B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 15:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBA910E1EF;
	Fri, 13 Jun 2025 13:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EKwBcpWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C0610E1EF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 13:58:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GquoKEGKimVJ0lD2J5fhm2mOsSe9crVU9uIfTrEOSOIUTo9q5bEXkwydtMRGXZ3kI6kjvrOkCWBjGg4x2wk02sFt5cERlL941l7ytZAftGioHeEc4Uylc75C3QcNL6+1+k3BKvQz99d6xv12LedmJ7bQ0iA6yfZBy4nv8Zs9HkeiMcQcisqvip/wzrViUKR/BOk7bcWmVdpgkP3Png9+xaALrBSKa9ivQvYpjwLgYoP/2hfIzjvuX1QBBexIKvW9OhHwgrYBpwjccuaeawXOu24vf2Qb0u+y3sD6eXOWw22xG9s5cGkKubg1i2WoVPaIgCeud5tm+rbp3PIpNtRXMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6fMifV+TFnrqmwDLDzAz/cMudEZfahRnxgPpW2Aj3I=;
 b=YvzwNsDC1kkqXkWhTxxQaTjN9O6f5fSDVq8IpYpI/nPfMNeDn3iT35D8XRGRqRt0H4vXLr0977s+VofcPAGT5ayUgM+TWS67KKGHrbIMSvxhIxezlJgNE3d1uSjkgFkSFGy2LvWlRNyaCV6yb0VgHo0g+quepa3K1zh7jHl2HroTmFPAm/BabFwBjJwTJVX1YyHPGRQ3n42Navno/Wc6S1Y+KjKWDmDKDFINM37NICmUfXrFO22mbGYxwkTHwcAAiL7YUpWix93LvxjZ54Rj+veSGoaJ4gRCxW0FGLtGjGajkaSyrxDP8oezw4XJIZNgilpu4jldMaC7n+UJmuj4eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6fMifV+TFnrqmwDLDzAz/cMudEZfahRnxgPpW2Aj3I=;
 b=EKwBcpWpI5PEuAyhRlywhie3jNtbNxdVpAI1SlgDQlrIITePUVpQm5N0Ga8ohmNPnshJga82Rh1//38Rdp9KduXBV8ZaxcVUEA5q35E3d6LRUfCEbb9ljY3Oq0E1EfOv8JZHuBXYaaEiyStbTMnzEk8CEddwpikefvBYow70ZUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8251.namprd12.prod.outlook.com (2603:10b6:8:e3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.19; Fri, 13 Jun 2025 13:58:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Fri, 13 Jun 2025
 13:58:11 +0000
Message-ID: <cbb605bf-b9ce-4f9f-828e-c6aaed0b5da1@amd.com>
Date: Fri, 13 Jun 2025 15:58:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: "Saarinen, Jani" <jani.saarinen@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250604113234.2520-1-christian.koenig@amd.com>
 <aEBn9o-bARNut3ek@phenom.ffwll.local> <aEByd4gidRpxJkfp@phenom.ffwll.local>
 <7497bb60649f9459b9734514bd320033f45651e2@intel.com>
 <dca65c78-9af4-4266-b60e-ce13b5a61f06@ursulin.net>
 <39cf23f66c3f872dddbaf8948e42decc810263c6@intel.com>
 <DM8PR11MB5655FD4DC309FFFA44E87BD6E077A@DM8PR11MB5655.namprd11.prod.outlook.com>
 <362e5fc8-8cb9-4bfb-940c-555514e51912@amd.com>
 <cc1f8c8a-c01b-432d-a466-94ce532d0183@amd.com>
 <aEwls5hPP9p-DPtt@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aEwls5hPP9p-DPtt@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f8be1cd-8ab1-4309-d1eb-08ddaa825578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDNzYnNURzRVbzRIOHArUy9qMGJRcDRVamF1WHdNMjJDZnNGWGUvaGNEYnNv?=
 =?utf-8?B?ZGZHbFpKV0ZieUhIeUdqcDZTaGZOSW5PMzNwaHIyVnAzajZzL3NrOFBINGtG?=
 =?utf-8?B?YTRSa3FQYytXT29xZFloZk4vQzdhdmFJekhuUGZrVHd2K3ZZRkQ3UkQ2Znpr?=
 =?utf-8?B?SkNHVmFaV3ZWMlJFTy90VTVqOWlGcU1uSWFWbXBDQzYrSzhZRkJud1prei9P?=
 =?utf-8?B?YXR4aFFTbTRma3o0RjB1SVZFUkxrbm8zTWlWYm9pQnM3TzBUV0l0aG82eTV5?=
 =?utf-8?B?Ym5ubWtoSklScVI1WGZ4NjRKVkQ0VTFlaUROR3hrbWlOaXhQdTRydnNrZnF6?=
 =?utf-8?B?eXVydmp4NlFnVjU0QUNjK2pNRzVRM2Yrbk0rNEhacGhzN2RyZzNPSUl6U3pQ?=
 =?utf-8?B?RXVRNWZrK2pYTVNPL1diS3d4dHhBUlQvc05rSUdBeUVkU2NXQW9SKzZxMVk4?=
 =?utf-8?B?Rm96SEJjNnRXR1pzcS9Sc0R6cmJoeVBhTjNyd29MRnZhQTdtMWhlNHdDQldp?=
 =?utf-8?B?TGpBajIxK2FxVHBWUEYralRXdENWYVI3OEtDdzJXbEY0RUZ2ZXQ3cmdLeU1K?=
 =?utf-8?B?ZnpFaHVRbzFUbHhyM0ZqRnlzT3FJelo5d2R3alVLK0FySFZMQkhGemR6QTNV?=
 =?utf-8?B?eFhXekJUYjZLZ2RIU1REVDlRRnBWdHhBMHk0MVRXZ1JQR0lhUGxpSEVpY2t5?=
 =?utf-8?B?ZHhrbjB3QTlsUytIZEt3YzlKWTlBTzZrNVMvbFlTMmpXTi9qYll2eDloKzV4?=
 =?utf-8?B?Q2Y2THIzRXJjeHVjWitvZURaaWhEd0VGc29UZVdhMDRnQmVKZm4rT0E0UDRk?=
 =?utf-8?B?c1NDaGRqbURKbEtPTUVMY2xBeFNnc1p2VllzZE9zbURtSVdnL25FaU5sbUVw?=
 =?utf-8?B?eTEvMXBCVnBXcHVOUzNma2p1TWF3ekUyTm1Bck9DbWlVN3NpaFQ3SzhPbjlN?=
 =?utf-8?B?UWFySWVSVFNSYzFtTXQ0alhnWUp2S2IrK2NvZEtNWnc1VE9sUWxqdGRCeVBR?=
 =?utf-8?B?YWRMTElsYmFqQ2M2Wk4rRjFTZ1MrQUVsTWJGZFpPVG5VSmxra25GWGI0UlhO?=
 =?utf-8?B?UytTQlZZcmpNeXVvWHVKZGQ1NytEaDd4cFBzemJzdU5HVTRjOGhLaW9RaUU0?=
 =?utf-8?B?WjNiSUZ0NEM0TGlvMml0QWxQWEF0b0orbmZINDdhUlQrb2QrVXAwU1RCb2kx?=
 =?utf-8?B?ZUVpbHZNN0l5dVJtZUh4U1YrcVVFNEo3WStNcVVMb1NMeWpTWGtEQmpmdjZn?=
 =?utf-8?B?Ynh5RnZ2dVZTMXB2Um5talNIOGk3OEhuem15R2VGYXhVbFByUlVzSFdHQzB0?=
 =?utf-8?B?R1RDVG1YVGVad2pieU5rMmFQeTQxNlVBbzFJV1VFQ215MXNnZEVSeWhNMC91?=
 =?utf-8?B?cTd5QXd3bU5PYWFNcGdTVTJxdEg4SzArQklSaFpZTkhFKytWVWdoS0tDM0gx?=
 =?utf-8?B?N0krR1RhUnBqOW5qY1NpYkQxdzZScmpnMS9YdktLVW83V2NIOWRaOGtMaSsx?=
 =?utf-8?B?Q0lPRTRZZ2haZ2NUOTNISjYvNTJmbklSMDB5ZmFCQTBhUGZDRGsrMHY4NnFz?=
 =?utf-8?B?K1Q3UjJKV1BvTXc4MG9QcHc1Y3VpL3B3bGJaUGdBSklYNXZrdUNDc1BvQmxM?=
 =?utf-8?B?NytrVC9xbUtrTEh4dWI2NmxKZXRqdW0vNHpYT1FYNkxPWkNRWmlUWHlBZVlU?=
 =?utf-8?B?UTQyekhhSVRJdDhRSFdqdjFwdzRuSUhPOGtiaERaeGl4d0RqM0R4WU43djll?=
 =?utf-8?B?bythb1B3ZGNUZDlaWnNNR1phdVY2dnVnL0ZScjFETFVvSXFGNW9aTEVxNkMz?=
 =?utf-8?Q?3/mTNR+MoXdPYUttiiMPNZnF2sax/Bv/+KwHg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmxDd1JxcHlUOTdMQjBYd1U2azFodEZEOTk2WEROL3NTM2hKTlZGRmNTK1cx?=
 =?utf-8?B?OVVRNUIwSHlKSHQ3TVgwbUFRQzdVM3M3Uk02cFRyeUZLTGV4TnlMVVVoUXQy?=
 =?utf-8?B?Vnlxdk5ZNE50QjJMRnhGTlVQVHpKdjJYS0hQZjdxQTJEMnV2b2loWFRrVUNE?=
 =?utf-8?B?aExPYXhkWDFCc2FYTGFDUlVwSXpEclpvOUxQTXk4QUg0Tkc4Vi92ZEVNcHh1?=
 =?utf-8?B?ZHA4OUFIaUFxZm90OW4rSEg3L1RyamxTVmIyQ1c3cHlVMjBVSjVDSGR5VDFv?=
 =?utf-8?B?UER4eVovSTBoVHB3dlNSbDRqS0hlUGdBT3QwME1KVnFnYnAzWUh0dkRzZXFO?=
 =?utf-8?B?N2kveklGTzZkWHpQTGxtYTEvamNxUVl5N0JOalVwd0hOZmZWcTRZVUVFb2dN?=
 =?utf-8?B?V0lEM3pUZ21XdE1UeStXdjV5KzZYVStRNUYwNisrMWNYS2ZrcXRFMS9MQVpW?=
 =?utf-8?B?d0FaTkVvbUdzeFVwVHV1YzlRN1VqbHAzeTQ0WlR4ck9UTktubXZQSFVZaXVT?=
 =?utf-8?B?cGdrVGhsR0lKbXJvV1pZNkpjNjRGdGtWRkwvOWR4QjdmWWRPOHl6elpROWpS?=
 =?utf-8?B?SnZxN1ZjTS9uMUtobTJKbXNwNmxMeEZMVjQxMTRSZVhGQWJpWGdJdkFOdzFh?=
 =?utf-8?B?QlNXeWlvQ3NjbWJvalVxVE1BUnFLUDBvQjB0dDRxaHFOZDVWQkZqYTRTMFZz?=
 =?utf-8?B?MDZ5aDJXbk8yYVRIOHJmTW44Yy9rQnMvOHhYVnM3L3Rqc0hQWk9INFpFRzlZ?=
 =?utf-8?B?N1VEWFY3M3BPdXlnWUlaQ1hmajRSZjNYVmJhb1cxUjVpL2hScjFsU1RmTXNy?=
 =?utf-8?B?UlBOYTd3T2dicTJTazlLVDV5SXVCYm1ZWkFxcXNoZDBDTXoybTBibWdzSVFY?=
 =?utf-8?B?UFZOMDBtMmJXbkVkbitpYlFVc1gyaVNZbk5OanRwenZadUNlSG01cmtSNG8v?=
 =?utf-8?B?WkNmcVhvejh0SWR5TnN4bC8rWmJhTnhKTm1EOWJqaW1NNEV2OVpkV2tQc2xu?=
 =?utf-8?B?bjEwdW45YzA0MTlTTndNSFI4bDdlMkVybnQ4R2t3YTFDNGJka29waDMzZHhY?=
 =?utf-8?B?OFZIdjZQZUM3cnNrK3dKMmtldW9Gem9STTZXNWVURU90b0R2c0hEayt4UG9o?=
 =?utf-8?B?MUxrWng4ZDZkREs5TWtWSEhwYXRVTUp3WER2OFh1QVloakR0NWtGajE2UER6?=
 =?utf-8?B?N29uaGpaWGNPTnA5bEo0MVF6b3lvTmUwWjVEeFgwdkREVjJKNUxYMFl5K3Qz?=
 =?utf-8?B?UFBMT080WkNITnBnTUpYSHc2U3g5blUwVjZYdlk2Q3VTYXRBbnhNZFJjT1BL?=
 =?utf-8?B?RkN0T1h4ZHd3TE9rSE5SYWt6YkV0TGJHOVJpR3BFQ2hIWFRPZ3dPTityNm1N?=
 =?utf-8?B?SUVWSlFHNDhwSkFDeVVTTjBXdk5YL1J3aldMMEk1MmFvU2F0L0s5M0hhV0hJ?=
 =?utf-8?B?TDJ0M296NTlKSHZrUkI4VTFrTjg0d202Vi81K1JMdlJDQjRhSDFTL1lSOUkz?=
 =?utf-8?B?bmYyRE91QUxVRkhSWXFCWVhJOUZiN1Nib3kzNkxWWlJFVzZmY1IzeXBWTVc2?=
 =?utf-8?B?K2c0RnJOMituLzl0a2w5TVhCbGpxQVY1NUEvN05sNWtlTXVEY0xIdk5rRGs1?=
 =?utf-8?B?Z1FSNGY5SHRBVDRUY2xIMnZtR1VWWFBQcDZFRElmWHlmbVJSRWRFUVd0enFs?=
 =?utf-8?B?MHNpUjZHNkVQNWdCMjRwR1gzRFR2cE90SG5UTElyVzIyNVdvMm42dTduVklG?=
 =?utf-8?B?eGNFNC9Oc2N4R09HZ2VTRTkyNFdIR3dGMDZLaVF6ZlFUZjBHUFRrV0hQcDhB?=
 =?utf-8?B?SGREdDNZYjZycE1aeUxPSGkvcCtCQWtiV3FLRzZ5NzBoS2prR09ndDdESENw?=
 =?utf-8?B?YzBtc0U5aTJRa2lRK3kya2FPWXppenYrcUI1bzJxYjZOT1ExdExtdkNBOHZS?=
 =?utf-8?B?bkxHUW5NdE40YnFtdEdleldOZmR1bm10am1RR29rUExkdVpVck5MNDNrMEkz?=
 =?utf-8?B?aDdST3ltZEsxdi83L1NNN0ZSQnZKMVFUdVZwQStsRkVSaVV6aU5kTFN0d1pE?=
 =?utf-8?B?UGZYekc2STNGSFkwSWROMmlJWUFPTDV3SWFwS2lweW9Cc3ptZHJwbDJ0aGNn?=
 =?utf-8?Q?Gr3B/5AWkvN9F/EuM40GFXj4X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8be1cd-8ab1-4309-d1eb-08ddaa825578
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 13:58:11.6083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKo56IZnO76wEplywXq29yZi5wgCn1dfoyfyBCN2y7diW5GL//yphUx0ERhW/H5w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8251
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

On 6/13/25 15:20, Simona Vetter wrote:
> On Fri, Jun 13, 2025 at 02:24:41PM +0200, Christian König wrote:
>> On 6/13/25 14:15, Christian König wrote:
>>> On 6/13/25 14:11, Saarinen, Jani wrote:
>>>> Hi, 
>>>>
>>>>> -----Original Message-----
>>>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Jani
>>>>> Nikula
>>>>> Sent: Friday, 13 June 2025 14.02
>>>>> To: Tvrtko Ursulin <tursulin@ursulin.net>; Simona Vetter
>>>>> <simona.vetter@ffwll.ch>; Christian König
>>>>> <ckoenig.leichtzumerken@gmail.com>
>>>>> Cc: tzimmermann@suse.de; dri-devel@lists.freedesktop.org
>>>>> Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
>>>>>
>>>>> On Fri, 13 Jun 2025, Tvrtko Ursulin <tursulin@ursulin.net> wrote:
>>>>>> On 13/06/2025 11:09, Jani Nikula wrote:
>>>>>>> On Wed, 04 Jun 2025, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>>>>>>>> On Wed, Jun 04, 2025 at 05:36:22PM +0200, Simona Vetter wrote:
>>>>>>> This regressed one of our CI IGT tests [1].
>>>>>>>
>>>>>>> BR,
>>>>>>> Jani.
>>>>>>>
>>>>>>>
>>>>>>> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463
>>>>>>
>>>>>> It also explodes even more trivially when logging into a KDE Wayland
>>>>>> session:
>>>>>
>>>>> Smells like a revert, and back to the drawing board, perhaps?
>>>
>>> Potentially, but any idea what's going wrong? Sounds like I missed something, but I don't see what.
>>
>> Oh! I now see what's going on.
>>
>> Looks like the code previously had a race condition and by removing the extra check I made the race condition 100% likely.
>>
>> Ups, I think a simple revert won't do it here. Give me a second.
> 
> Please make sure you cc: xe-devel so intel-gfx-ci can pick it up and test.
> It's a bit embarrassing.
> 
> Also since this breaks things quite badly might be good to push the revert
> right away since I don't think we can land the proper fix before the w/e.
> For that
> 
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Done.

The basic problem is that the existing code which checked obj->dma_buf is basically broken.

Because of flink and/or GETFB2 for example it can be that you get two GEM handles for the same GEM object. But in prime we always want to return the same handle for each DMA-buf.

So if somebody would export one of those duplicated handles we would add all of them to the prime rb tree and so change the handle which would be returned. I strongly think that is not something intentional.

I've send out a patch to address this, but I'm not sure about what the preferred approach to fixing this is?

Regards,
Christian.


> 
> Cheers, Sima
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>> I would say so. Looks like this on our CI https://intel-gfx-ci.01.org/tree/drm-tip/igt@prime_self_import@basic-with_one_bo.html 
>>>> And systems stop testing anything after (see eg https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16692/bat-twl-1/igt_runner0.txt ) when aborts happens. 
>>>>
>>>>>
>>>>>
>>>>> BR,
>>>>> Jani.
>>>>
>>>> Br
>>>> Other Jani
>>>>>
>>>>>
>>>>> --
>>>>> Jani Nikula, Intel
>>>
>>
> 

