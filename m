Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C29B24A97
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 15:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80ED610E1E3;
	Wed, 13 Aug 2025 13:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DSZiWdDN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB2210E1E3;
 Wed, 13 Aug 2025 13:29:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijVlWNHrbCinkQ6Q53bmY8Pc/Ggis7zSeq4OhfMJlNpvd4Lm7SlyEpmB0LO9Q6gae24zgyCuR76/KVLN4xn+6n0tPav004aa7xD9KksN86AZfYNSu99Yx6hONbz6fyQ8hEIxv7/z9MZMPL7F2aild/Ck1szQ4bpfRK8eLr5CVjBMlxxi/hX73x6sSbJfvis9qgFlor9CN6PMK+9Mr1Viu91tQl/XBziPoWnvE27MExe+JTBgK25Zb6GK0trpB1OMqdE3Qp1Qu9eTXQcvZ9AFVmJgNLwy2c1OVxgOSo6iaBk2k/HSANo5qChQ1N2jLkkHtCN2xENJfqse62vxgayKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udBotuc3mPjVA2Qqgr3sJdT02BCd66weOaAJ3l2dKM4=;
 b=NMxdQcHUhyF5G9h1IkC6KBzjkMAUodb01k3yWwI9ikOYc22fYTCp+g2WiPdNZEet9ap7G+VjhxpkRsJkCNyv6yCzx6uVyDHyBnx8tD/cabQ+kjef93eV3xXdgqChFAmoTPYw212lZEWrnl+5qWibkkX6hy0RQdtMlHxIPvitSxxRgVqWSzklFcWIkStixe84rseggFBJ79qAx391EgNiK3knS/l67js7Qtqzqey/yDbu5jTFq0+CWoO5wl4XJDfF5GfaWlfAvpleU++a3KUEuVGUnKvm+lukW620h30TtS7SgaB263cAe9GCdbhS8/y1a8HChgtD9RcpIByGoxoGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udBotuc3mPjVA2Qqgr3sJdT02BCd66weOaAJ3l2dKM4=;
 b=DSZiWdDNmKGm3hjTnytfhu6oGoTZggHi7kQDMtYkGYI/Cn4NptffNVHt/keUgLOFTa4ARr7GigMfdNrTkXDRo1soK/y+6/nFo6tTp3R79uQYSQSssMbHsx/kxK6hMj+cIta1IF64hajkQimJDHdebqRfev9ahlYf+jptHEBWlp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8132.namprd12.prod.outlook.com (2603:10b6:806:321::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Wed, 13 Aug
 2025 13:29:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 13:29:46 +0000
Message-ID: <cf5d530e-6952-4e76-93e2-5c72b31b5c62@amd.com>
Date: Wed, 13 Aug 2025 15:29:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, intel-gfx@lists.freedesktop.org,
 chris.p.wilson@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250226155534.1099538-1-nitin.r.gote@intel.com>
 <2153999.KlZ2vcFHjT@jkrzyszt-mobl2.ger.corp.intel.com>
 <7a96d06d-54a9-42b4-84c7-0c262104ea5b@amd.com>
 <7836906.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7836906.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:208:329::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: 58375a55-2645-4217-f80d-08ddda6d7860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXRZdUZqeEVLR1BORGxwVGhEQ3JWcVBHeWZ6NDRjY0NTbnhvNXNRMmVQK2hZ?=
 =?utf-8?B?cVdGQTRXTzFMVnJsSHhsUGhRLzM5cUU0cXBrMWFQNHE5UllWeGRlZXZHSUEr?=
 =?utf-8?B?c3V6U2VMdVBvS0crTEwyWjNVNkdtL2Fmd1hBRnk4V3p4dXQxTXVkS0hWck1w?=
 =?utf-8?B?R0N2ZTVNbEN1ZGF1RWpxdSsyL200ZTdDN29tZ1NTbnF6NmdsT2hjaGJBQ3ZZ?=
 =?utf-8?B?amRtRDdZRjE3a044bjBHd2dmdDYwbDN2TW1jNzV2K3ZNZFJxNmo1a2lpdWZa?=
 =?utf-8?B?bFE2WDV3UU83UFd4RE5DejZINllEOTlhVVhDUG50MEpNeTRoNGh4blNlcmFK?=
 =?utf-8?B?WERTS1IxY1RVU0Q4ajhuSTlsWitzR2d3MTdLdkdaelE2YlFtaTFiYys4NHFz?=
 =?utf-8?B?MWwwMWMyQWpNY1pHZzFMWUNxbkUwa29VSjhuN1pNR3N0YWZHcVVadmozTXds?=
 =?utf-8?B?ZERlWk5LaGo5alNVUHhqT2lqbkZIM1o0c1VWaWVRbmZYK0hZdVVjOW8wRHV2?=
 =?utf-8?B?Nmg5OVNHY2FpNDdnUGNnVzFRVzhpQlg4aVlmbFJBY1JTcWdTbHA5RWIwN25u?=
 =?utf-8?B?QjZ0elViY3IyQjVwWHZNT0xCQXk0ZHI5S2JpbTBsc1ZlRkl2TExUeUp4d041?=
 =?utf-8?B?N0ZSYk9vUG9maUZYZFV1MURidlpGMVhrOGsrZ3MxT01XMjA5N1owWnJoSkxj?=
 =?utf-8?B?NWJZU1AwM0lTcHpQcHh2QXlHZEFSeFdqMExDUzZNdm1iMTFOTW0vSlI5ZVB0?=
 =?utf-8?B?eGhSVExRb1crMTBnTG9FcnJBTDNvVzhPdWtwVVl4Z1lESVlUbHhXU3R4N0J2?=
 =?utf-8?B?bmhHNGxDcTlyUFFzTjRGejh3bFZUTUY1eWx3eklTMktzcEQ4eW02My9GbDB3?=
 =?utf-8?B?cjBEbDNnUHBXWWhLQXpYeFc1bHB4YSsrbUVrYm54blBUSUgwTm8vV2gxeDM2?=
 =?utf-8?B?bVhrNnZOUkhkcDJ6Y01yL1F6L3BNZnB4cHd6TEJ5WUtDKzRHSmhmZWpOb0pt?=
 =?utf-8?B?WHFpOExiYVFxMkxUb3BlakVnallsbGFrZmd1RnFWdmpYZ2NBVVJJaHdHZ0JN?=
 =?utf-8?B?blhucWFxWk14N0EwSHI0TVNPdmpBN1RzTlVHN1diUUxxeU41YVFzM3VSYmk5?=
 =?utf-8?B?NXVaNkxlZGM5VFhQSkhsZHRGMkt2d0h5V0lYenJHcTZacElXWHVlUjRXNktZ?=
 =?utf-8?B?TDM3aXBPQmxPM3JESnlHanRSbjdxUE50WGsreFQrVFBwblVQaHJQd1NDdGFv?=
 =?utf-8?B?SktBVnI1Z3NMaXlDN3hMWndzeU9WUFZqNXo0N3FlZWRjSGppY3JlVmxxdGJS?=
 =?utf-8?B?SHFHYVJSKzd2dU5nNXppcGRtblZIRHNwbVBMU1RMVSt5QmJGMTBpQ215Qm9a?=
 =?utf-8?B?L0dzR0FhTm9tR3FMK3k5dmZyOGVXRHIwU1lnUFMvZ3kyL3VKdXpxTTlBcmpp?=
 =?utf-8?B?VkZoOVVvTVhDaHR4ME03RkZMNjY0bU1Xb3lhSjV5d3pRRGlSUlJyUHc5STI2?=
 =?utf-8?B?aXpHYWhBRmpSSWxpVGtQR2FOSThOL2hLMktXYW52VDVuR1ErMW04NzZ0d2FV?=
 =?utf-8?B?SDNkRkFQV2VHZWs5MU1nRGVrQnR1ejJxWW5NUDJNdGxDZGw2UjR4SFo5UmJl?=
 =?utf-8?B?V1lpOXZxZ2VSRzhlVGhIL3FqUk9HRitxSGUzcVErOWFaVk9hZkVOR3VwOWYr?=
 =?utf-8?B?bmRvMDZGWDEzVVdEU3dSSi9pei9Pdk5rSnBpTms4N3pEVTUvR1g1M3ZLRTVD?=
 =?utf-8?B?VDg3eHk0b2dGc3JnNVdqc0VSN0lFajA5SUJpYkZFajI1SVZOV3RWZThza2FY?=
 =?utf-8?B?UXB2ZVZ5eVN0QTZPZE9FNnE0TnY4cGdqbHh0OWl5aTVPc1hQS0JialJXYWpJ?=
 =?utf-8?B?SzE1NlhaNXRjTVN6Y0hwU3FWSm90YmF3Tjh2Wk5td04xaFVIUzZveVlua2FI?=
 =?utf-8?Q?tEf4I4kMBgw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTNkL2FLdmY3cC9CQUQ5cXFlbXdjVjZNNC9lK1RkZElZWGZIYnRFWFJUZ21G?=
 =?utf-8?B?Qjc2bHNOZDVFMlBOZ0UxVWtFbThHdGhUOFlVQ2tMMHp1SVBGekVpemFkdVFo?=
 =?utf-8?B?QUJJUHRmaUJlM2o2RGRnVmlSL3MrMGl4bjhxZ2NmVHpxSmVmeU5pZDd0V040?=
 =?utf-8?B?ellnQXgzMTcxaUQ4eFptaXNmR2VMUDQ0SzV6cFc3MS9FWGpSejAwaG9qckNI?=
 =?utf-8?B?OUdBZkpiYnR6QWVZd3VabUJXZytxWHFTMEFmQWtKdzhSeko4dkZUTm9GM3h1?=
 =?utf-8?B?NDI3ajViS3J1V3NmVGhaSjc0dFBQTXoydjVKb3k4MG9MK2tOMi9Dc0ZYQTJo?=
 =?utf-8?B?bnNhcUVIM0lOdGZEa2xrcURkODQ1OEs0N0Z5THJzN1p1elhkekFESXZ3RHph?=
 =?utf-8?B?ZDhrZU45bVljN05SSGFFNHlXckRaK1ZYaEZJbHQ2R3BMZU9pREZydkg1ZnU0?=
 =?utf-8?B?bzV0bklRWWZQWDRrcXcvU3Nqd3lYa2JpTjRjSlh1cHNYS2ZiWHdlS0Z6M2E1?=
 =?utf-8?B?bkY4d3hRKytTeCtPRnFCZks5NnI3SVRkVzZKa1d1UytKaVA3dElrQTIrdU1S?=
 =?utf-8?B?T0VIelVNLzVsUkpHUGxZcVlWMUZZMDg5UEthMTVXUVVSK3dHSlJrVVpMUENB?=
 =?utf-8?B?WjgzR1JvaFI1M0FlR1ozY2MzaGJxZE5taS9uTVFvazRUYmd4ZWRkamZoVGNS?=
 =?utf-8?B?ckRweUZmZjRnNVRFam9kQWlha2RmdXIzTDQzVnozV3dZRitwbFRLRWtXaVpp?=
 =?utf-8?B?MTkrZ2hNTjh2Q1Z4bEJDSVFyaU9PTXZBdFVPbk5CTkMya2FWZFVXdkVwNmV6?=
 =?utf-8?B?dENJQXJFakMvTVY1RURCTzV6R3NRYUIxZUlKOGU5b1I2aFdlakVqbzMvamRq?=
 =?utf-8?B?dEJZTlg2S3hYMlRUK0lrMjVFNG5iY2pWZ1FERnpOdnJFL2lldDB6MVZFT2NB?=
 =?utf-8?B?cUtoNmxoaEpLYUM1VnJKRURWUm1HaC92UWZqdkQ2MWVyUys5RVArU1FodkFS?=
 =?utf-8?B?NUFWN21iRVhWeFhMYXp3UHZGZGdNZUpMVU54d3FsS1FlREs2YzliZ3lFVUcw?=
 =?utf-8?B?dE11dlQ1ZitrU1pMWTV0WXVaVGFiUERxaDM3ZEdNeU5MRUdnWjBIV1E0ZW5L?=
 =?utf-8?B?RnZxVG1TU0gxR0ZraEQxRzRRZFhkSTBVeGNHcGZXeUU3UDJlVUQvaXY4RUU4?=
 =?utf-8?B?d0lHZmNOREwySk4yc29pcHcveG1taEdndi9IYktFYmdtQlVIU2U3THE5Rko4?=
 =?utf-8?B?czg2QUlkY0kyRnFQZU8vTzh1Rno4Q3NCMnZ6SWFKek84NW1HckJLelg2em5Q?=
 =?utf-8?B?cEVveE9BT3RzZ2R0Y1JHS05ETVZnYkFkOW4yb3Y3SDhFU3o2VG5yNVY3cFUw?=
 =?utf-8?B?Wm5qakFLNXlVazNHem4zaDRjWkZlcUlCZEFtbFNMaWVHYWRDc2swMSt0bHdK?=
 =?utf-8?B?OEcvSm1YckU4ZDJQNFRrWlMrVW15MWw4dE95NVg2Uk9TYkZtVHdxYmRCTUVq?=
 =?utf-8?B?Z3dSQVpZbkNzbTVOZTQwbDhaaDBhWk56cDJ6b1hvanpndHVhdTkzcVlXRFov?=
 =?utf-8?B?TDgrbGlCeHVGYnBXRVpXeGE5THRDamZpYWRheStzOEdlNXRCczVhRTZRdVhS?=
 =?utf-8?B?Z3N2M05VNzV0Wk8zRTk5WStWZWZ0WTVGNGVJZXFJRWxxSnIyK2NmdGtqSW1p?=
 =?utf-8?B?V3ViMXpURks0WS9Sd09mT1pnV040aW5ydllzVmlGYUpUNlJOdytuWVpNVEpY?=
 =?utf-8?B?SjNMaUZCaUQyTmhwTEdGQ2RseVJ4d2Fqc1RReUxYQVdOVlNseVJxYVNGRjgz?=
 =?utf-8?B?L25KQm1VbmpzZ2FFK0VVWjVIWXBpNjQ5RXlWK2tWK3psV1VWUmE1K29OMWRv?=
 =?utf-8?B?UWJpVm9ibnBJWmhpNkw0Q2Yxd1R6MlRlcnJKaG9HTm9WeFV3bmltczNUQmJI?=
 =?utf-8?B?cURMOWlQTStNeU5SRnZpWDZDSDJLVWdDUmNyemFrY0ZKdXVlZVJ6YVJOMjRJ?=
 =?utf-8?B?WG1BaEY3SGk0Rm51cWFOb2V1ZXh1Um44a3BEaUV3dFRJZkxGTDlmUFE2NkNW?=
 =?utf-8?B?UGtwNTZ3K085NmdtL2NUM0Rib0xvSDZGeHVKOEI5R01QbGc0WUpYNkZaVk9C?=
 =?utf-8?Q?4TxP7Vbpg5SF96TGHP7mqpWRW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58375a55-2645-4217-f80d-08ddda6d7860
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 13:29:46.3895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRhuoJ6m8oJoqd2vBKi76NPQsahRbwm9PuKZRMXX98nAwbXF3anrZl+y848ZcSyk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8132
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

On 13.08.25 14:43, Janusz Krzysztofik wrote:
> Hi Christian,
> 
> On Tuesday, 8 July 2025 12:09:58 CEST Christian König wrote:
>> On 08.07.25 10:56, Janusz Krzysztofik wrote:
>>>>
>>>> There is no reason to test enabling signaling each of the element in a loop. So there should be something like 4096 calls to the dma_fence_chain_cb function each jumping to the next unsignaled fence and re-installing the callback.
>>>
>>> So how building a chain should look like in real use cases?  When a user 
>>> builds a chained link of her fence with another fence then may she enable 
>>> signaling on the new chain link?  If that other fence occurs a chain link then 
>>> who should take care of disabling signaling on it so signaling is enabled only 
>>> on the last link of the chain, not leading to a situation similar to what we 
>>> have now in the test case?  IOW, what's a correct use pattern of 
>>> dma_fence_chain?  I can't find that documented anywhere, neither in inline 
>>> docs nor in commit descriptions.
>>
>> The dma_fence_chain container is basically a single linked list which allows to "chain" together multiple dma_fence objects.
>>
>> The use cases is to keep only a single fence even when multiple asynchronous operations have been started.
>>
>> So you usually keep only the most recently created dma_fence_chain and eventually ask that one to signal when you need to wait for all fences inside the container.
>>
>> The tricky part is that since the chain can get very long the implementation can't use recursion or otherwise we would potentially overflow the kernel stack. And that needs to be tested and made sure we don't accidentally break the implementation somehow.
>>
>> Keeping all elements of a dma_fence_chain in an array and asking all of them to signal individually makes no sense, for this use case we have the dma_fence_array in the first place.
> 
> I'm going to submit a patch that drops enabling of signaling on each link of 
> the tested chain, as you suggested.  Don't you mind if I add your Suggested-
> by:?

Sure.

Thanks for looking into that,
Christian.

> 
> Thanks,
> Janusz
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>> Janusz
>>
> 
> 
> 
> 

