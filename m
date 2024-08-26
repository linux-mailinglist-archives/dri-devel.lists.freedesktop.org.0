Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696B595EABA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 09:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C5E10E0E7;
	Mon, 26 Aug 2024 07:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NrL6idfP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCB710E079;
 Mon, 26 Aug 2024 07:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqE7/mHzjNaSSfIcm8wkTdV1aBIl3qoOZ5k8JV59LDjCyQfk3j9mi8hAKaLx+CjuC8gbgQiOZEVlDefbRFnqB60fsMW8v0lphTN9UpkR2nNq37V3W16M7rTHP90Nh6Wv83T43IMHzZnmgPGFuMu9eitrgBAIAK76iN2QgJPmV5NcOndjG6RzeGnGIFvSxaWU1GmfAI+zoATMwKk/8uygrHrWcHwrXT3vsCwS1G5JM5S1ePfzXgiq7Qnn5JkHEiusHo+WvIYLIb+qz6yUIza8S+/lm7BTqx2+s719jPp4hfi/pFMFLCiVXxw/ffEHRU9iZjsL5jeny306ZWHCNAd88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6x1j3PG2+H6ZWQYyIVl4rFOcbxLruLjDToi7CSmGvrg=;
 b=m6jh8RXr74UlS6nrVQoUTxivP05WwRWpNukHxK9madu68KBCqd5bTvGoPx49Kyhh6YhD9Rjin8BR859ELCnm7RzSPl7Y7mBNltR9Z371flAHK1ibSJCMBKS+P0EjyvDMa2k7Hwy0eSQKJ6K5jzJl1wkRtExd0Wq6KdY+pazYgZohXdmC5klmKSApk1kj4rQrJfCJ31cmANSktA8Ad3EGyuXCuisJmnOzk2Cw3xkq8AIDVwZjluxmC+ZVUpoCDTOt9R8/KwZP+Yx2FgvIPw6SV9z9JYzMANGx99pdCKzuFhoXt8F+hUuTIPJRDJrjWPvk4rEmpNYH7PH0ZXNkHhFq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6x1j3PG2+H6ZWQYyIVl4rFOcbxLruLjDToi7CSmGvrg=;
 b=NrL6idfP7KCBRtcmRPEUL8a3zdrVDxtpyiHT58CILu9GlptOHgDKj6r152pPwRJJpRIHO6PwoWLzktLnWsQQohm4Jwrfynv85ny6+fZofCoSiWEEsQfjySTm76FrX020240QtTlLtBeKzPNqHt5QdrnYae1IBEwCC+uuhRieEIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8080.namprd12.prod.outlook.com (2603:10b6:208:3fd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 26 Aug
 2024 07:43:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 07:43:45 +0000
Message-ID: <1fdc3b61-6694-4d8a-9921-7b323219801f@amd.com>
Date: Mon, 26 Aug 2024 09:43:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Use dma-fence array for media GT TLB
 invalidations in PT code
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 sumit.semwal@linaro.org, daniel@ffwll.ch
References: <20240823045443.2132118-1-matthew.brost@intel.com>
 <20240823045443.2132118-3-matthew.brost@intel.com>
 <2657940b-90b3-4abc-9f56-f6c6b70563ec@amd.com>
 <ZsitDqXwHtIBC5ul@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZsitDqXwHtIBC5ul@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0266.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8080:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5a95ff-803a-4108-a866-08dcc5a2d064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGlHWGEwZ2JBWmw0Z2FoeWtXakx5U2FSZEhUYy81UW05cktZWlZtaGJaRGFL?=
 =?utf-8?B?OHM4cmtBR0dRRWhVaGZpVDVIaHZKbHRTYzMzQko2b1VSZ053RGVmSldybGoy?=
 =?utf-8?B?VHpmZy8wWlFzRTJXTWRwRWVUSmN5UHkrTGtBbVE1Vi9UU1U3ZmZkZDNrQWVZ?=
 =?utf-8?B?b1hNc0ljL0xPK0J5TTduZkd1Z1pWRDgzTVhqczAyNnRZWFRxN0dXY1BtUHhH?=
 =?utf-8?B?MzkwK3BmbTUyNVBhVS9OL1pOb0xzaUNJaXFxODMrbW9pakFXQjdRVDAzMU5Q?=
 =?utf-8?B?Y3NISkU0MmxmQnBpS1o1R3lIMXEwUitVMXpteTVQdUFVbXVRbHBDTzNYTjRI?=
 =?utf-8?B?NE9qb2JWeCsvTnZBUFNzMGZRTkI3MnhjaG5Jd29zWThqTXBXT1dLeVlFSllI?=
 =?utf-8?B?NnhsQUNuS213MWduSzBHeGN4TmVqNDdyZDlTOVJZaWliR0VJZWE0Tk1vcS9E?=
 =?utf-8?B?bW5pdEVOME9KNkM3WVQzbnpkb0VtcnphaEVzOGovRmFWdzF3RzJ1ajcvS0ps?=
 =?utf-8?B?VFk5Q3pxVC9jcGhlQldxaWhDMDg5N0FVdDYxdjBJeWJVcTdKOEZlMXpiZXU1?=
 =?utf-8?B?c0tUbmI1Z1FYMGVrcXdJYmI3QURBaVVhOTZ6S3ZNTitzUG8xV25vYlJORlIv?=
 =?utf-8?B?TklBNnlSWTdCQjU5R1ZpZ1d4Vkl2RUUvUGJTK2syV1ZwbEpDSlVlUXdiTEIv?=
 =?utf-8?B?dUI2bmRLNlM3R0dSajNLS0lVc0NGTGUwL3BUMFB1M0VGVHdPV3I4RllvZTUv?=
 =?utf-8?B?alpWdXNsNzg3WDlWcDRCdjcvUjRqS1NjQXJGbG5VRFdMNml4RVZJNm1WQ1VF?=
 =?utf-8?B?R2laVEh3OEpDeEFtNjFJeEE1bysxam1ma0g0ckxHbHE4eFRNOTBnRnA1eGdC?=
 =?utf-8?B?ZHJ6TUtXejU1ZzIyMW5OY0Z3T0dQWEFyakwrNjRtV1B0VEFlbXNFbUJDclRT?=
 =?utf-8?B?UHd3RUVJcTVnRVA2NWNjQ0QvSDlBNVc2a2dpY2lTcUw4K1c0TmFGVDdrM0xX?=
 =?utf-8?B?ZFBaUW9nNW44dnhUNmt1WmZ2Y3p0Z1BKUzc4WFJpT3RSWExPdVpYRzQ3MWVt?=
 =?utf-8?B?OFBmdkFsOEg4UEpQNkVacFhCN0o3VUx5ektILzBaQlNQbzFsdVRmdHB0bmRJ?=
 =?utf-8?B?S2EwUWNIaFRzL00xVHdwdTFpYXlESGFySzRDUFZvUjRHa2crZTdWSlMzbUF1?=
 =?utf-8?B?b0pKR1B4NXV6WHpJdDIxN0JodFpDSEQ5MXpadWMvRWVZQzZHVHFBQjFzRjlX?=
 =?utf-8?B?VTlOcFBoRTdpUi84QUNnLzNXdWFGRnk2bzhwMVpKUDZGRm5jQzd3Z0IrY2ZZ?=
 =?utf-8?B?eWFhZU1nK0VscDE3WmcwSjIwSHR4RldFUnU2U3ZEVXptWTF4YWhmcXR2cEJp?=
 =?utf-8?B?YjQzQW56bmJnWWlxTTgzQVlITFE2UDlHcG8wcTRLR3dibHlnNnJxSmZIZXdW?=
 =?utf-8?B?bW9iVUFaZUluZnlhWjhZOGkwSktMVmw2dzQ5RnhxNnF1SStqbFM5NjE3ZS9q?=
 =?utf-8?B?MGpkVHVXdVlSTWU3QktPdnBVVnovV3AyYWU5Qi93K0NuRWJYMHlCN05XN0hl?=
 =?utf-8?B?UDgvbWtudXVQSjlOQUhDWm9maWNIMENEaDdVcm8rbExZWXl4S0xiNFdscHUz?=
 =?utf-8?B?RDBydDJNZW0xL1NmNmxjZXFndUtNYi9DeEQxTnZXRERibW93b2RnWmtjdEtM?=
 =?utf-8?B?cDFKa1FVbk5vcnZYN3crdEorUG9uWER5Y3lHbGFXRXMzM3VEc3NHZXlQNllr?=
 =?utf-8?Q?l6N5Bh1OYDyq37OydnZPDjW5p/bJYqszPUe8siz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3FGdHgreDhBVmNyaGhKVERpZXhEWExjODY1Rkw1KzErOVV3RHBWdWcyNnhX?=
 =?utf-8?B?Vmc2MGRQVG1KMTk0VFRHT29TUDIway8rSlZ2azdJODk5QURrVzhhUmxiQjFK?=
 =?utf-8?B?eEJhRzBSUGtMTG1uOG9xS0M5dXU5cXdNVUFmdUJNdStyWE5OdjlHQkh1aDdn?=
 =?utf-8?B?V1J2OVhxM0pyUmFjS0xyaTAzSkM4SnhocEtjRHpjU0NlVFNBN1VUVGwxa2Np?=
 =?utf-8?B?UEFTaVhHWlFlZ0hNRElrUWYwNVIyYk1waXJyREc3OUpmelJpcmJPZ1dzRExr?=
 =?utf-8?B?WVNibitJWEZybG1tMXNia2JLVHRvSDFaMlRBdlVuRW1ETkJlR09mcmFWWHNu?=
 =?utf-8?B?cmlFZ2p6SmUxeDFXQ25LdXJBZ0U0bldjbWhsQlRhMXpEWld2bzZLZzJQVFdT?=
 =?utf-8?B?Mk5mSEVwRmYzdktqcG1GRmJrcTgxY3BZd1Q2bFRHendDQW1VZk94NlIzcXVO?=
 =?utf-8?B?UURvUTRsVXNHTGFTaWdFTkdoZGszRnJjRFJZU0FDZnVwdkQ3a0Vmb2hxUjJC?=
 =?utf-8?B?ZEZsa0EwNVpmQWVEZDNTeGpQeVhvMTNKblFzRzl6Qjl4YXFRRXFUQmViQ2Ez?=
 =?utf-8?B?K00xcTRlTmphVkd5WWNGWnRHL1pveGM4ZXVjRUhWUnRXTkh0TlZJeHJ4TnZ5?=
 =?utf-8?B?Y1VBT0NJcERZRDQxVFNGL3J4d1ZGc1ptb1RqL0dFVlhPN2YyMWFMUjkzeDNI?=
 =?utf-8?B?aWNpRnBJV2Q3cFBUcERramFPLzdYcFhybXVsTS9RWVpLalliTWZ6cm1XMTU3?=
 =?utf-8?B?RWtkMVN1eVBWVTg5c0x2bDRIcUhkc0J4MEtzalhsaVk1V0VGNitSZ0xhbGkx?=
 =?utf-8?B?L210TnpORXU2cVlXZjJvV0txODJsT05PU2lWUkxLQ1gybjZJWG0rTkwrazY2?=
 =?utf-8?B?S2hJSXVNTUdyL2MwVWd6TWduU1dRRG5HUkc3NUZzYjhuY2NlM3MycGkwVU5V?=
 =?utf-8?B?T1pFVHNOMHBETW5VaEpsWkRIRnhkZllOT1pVSTFkejNCMitEUUp3R3RHbzVB?=
 =?utf-8?B?cHVDZ2ZkVHp6Y01EZFljV0tNa09UN2wzTnpiakZ5Yjc0VHBLalNPRUFJUjlE?=
 =?utf-8?B?Zi9HeiszakhGL2d1eHF4UERjUG1XYlRBZDJyZk9nQ3Y5QWhLWCtyR3VTTnJS?=
 =?utf-8?B?eWtYS0hOejFscWZTSk4waG5zUUtlVXVSTnFIcVhQbXlXdU05ZGtsbVBHczVv?=
 =?utf-8?B?R3pjdk1MSklmb3VSTVJIcUMzQkdTVjA1dnYrRnhBY05xWk9uTDdIVU8xT0VO?=
 =?utf-8?B?SlBFelJzRW9QT1lZd2NxdHc5TFEvajZ2MHNwVjB1TmJyRnpOdlJEZktOZjFH?=
 =?utf-8?B?UFk4ZVQxa0xJVHJWcG90UVpyNVRYeUpXRVpyOU1GZ3JBTHc3S0lxVVdiZnZJ?=
 =?utf-8?B?NFl1V0NlVVQ1RmY5MUp2VllMd0V0cTdrSUpCSDFSNm5IaWt4QlBpaG9EQkMz?=
 =?utf-8?B?SEZ2U1BydXhUdDU5dzY2eDRqMFVtclFKN3JtZ1ZPbzJPZUZCVm9oV2Y3RUtF?=
 =?utf-8?B?MWVIZDNlQndrNkpCWWVIZnRZSU5UL01sYzgxeFpqVFdKQnZzdkZNdWtGam5R?=
 =?utf-8?B?R1huTVBrMDErSjNmUnVlamVLUGFDU0VFRklmelpVVWpSTTFmRFVyeEtZcVJu?=
 =?utf-8?B?ZGhkOGY2aDEyUVZDQU5PVnhTeEllaWRHRC9IOVZtU3lCaW1FVHJTZEpZRnRh?=
 =?utf-8?B?MEw3OEZhOU1aYnFHZjhPUy95VzJhcEtrajVPUEMxUERlRjIwQlBIL0hvVzhk?=
 =?utf-8?B?ME9jalNmb2k4VkpLb0FPT1N1TzBLeStxbkJLNEhRN3o4WFhnSDhQSGNRVTlG?=
 =?utf-8?B?bmVSbjVMazJqQUNPVWp5ckphN0VadHpCeG9GS0hmQUc5RTBxaVNsMnpVbG5D?=
 =?utf-8?B?QlQvL2FadTIyUEZVbFN2UWM4SHFiVlcxdXNKSmpyYUZSNlBJZDgzQ2g3bjJD?=
 =?utf-8?B?aGUxMTlWZDgyWUlSSEpWeXM4K29OYjYwTGhNVzBNWEhCTVNIWWxCc0hhc1Zr?=
 =?utf-8?B?djk3aEw3MUFyMDRsdDJSQkFHSVc2bU5OelNzY25qc1lSZ1NDU1p3NWZKWDBY?=
 =?utf-8?B?bE5rZnVhb0dVOHBXejFDNkN3SDlFNjMzRm0zc1FaOFkzaFFLbnU0QnQvaDlH?=
 =?utf-8?Q?EyFw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5a95ff-803a-4108-a866-08dcc5a2d064
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 07:43:45.2896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13FHVY75gWL2x/PS1TDlzqp21V8DUpI3Aeg2m0zkOkWzrfJGUcSwB3/NlZPuCh9+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8080
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

Am 23.08.24 um 17:38 schrieb Matthew Brost:
> On Fri, Aug 23, 2024 at 08:40:40AM +0200, Christian König wrote:
>> Am 23.08.24 um 06:54 schrieb Matthew Brost:
>>> Using a chain fence is problematic as these cannot be installed in
>>> timeout drm sync objects. Use a dma-fence-array instead at the cost of
>>> an extra failure point.
>> Mhm, IIRC we converted chain objects into dma-fence-arrays while installing
>> them into a timeline.
>>
>> Doesn't that work any more?
>>
> Thanks for the quick feedback.
>
> As is, installing a dma-fence-chain into a timeline sync doesn't work.
>
> The 'fence' returned from 'xe_pt_update_ops_run' is installed here [1]
> as the 'fence' argument. This blows up here [2] [3]. It does suggest in
> [3] to use a dma-fence-array which is what I'm doing.

Ah, that makes it more clear. You are not using some IOCTL to install 
the fences into a timeline but rather want to do this at the end of your 
submission IOCTL, right?

> The issue with using a dma-fence array as is it adds another failure
> point if dma_fence_array_create is used as is after collecting multiple
> fences from TLB invalidations. Also we have lock in xe_pt_update_ops_run
> which is in the path reclaim so calling dma_fence_array_create isn't
> allowed under that lock.

Ok that is a rather good argument for this.

Just tow comments I've seen on the code:
1. Please rename dma_fence_array_arm() into dma_fence_array_init()
2. Please drop WARN_ON(!array, a NULL array will result in a NULL 
pointer de-reference and crash anyway.

> I suppose we could drop that lock and directly wait TLB invalidation
> fences if dma_fence_array_create fails but to me it makes more sense to
> prealloc the dma-fence-array and populate it later. Saw your response to
> my first patch about how this could be problematic, a little confused on
> that so responding there too.

Yeah people came up with the crazy idea to insert dma_fence_array 
objects into other dma_fence_array's resulting in overwriting the kernel 
stack when you free this construct finally.

Additional to that Sima pointed out during the initial review of this 
code that we should make sure that no circles can happen with a dma_fence.

But we now have a warning when somebody tries to add a container to a 
dma_fence_array object so that should probably be fine.

Regards,
Christian.

>
> Matt
>
> [1] https://elixir.bootlin.com/linux/v6.10.6/source/drivers/gpu/drm/xe/xe_sync.c#L233
> [2] https://elixir.bootlin.com/linux/v6.10.6/source/drivers/gpu/drm/drm_syncobj.c#L349
> [3] https://elixir.bootlin.com/linux/v6.10.6/source/drivers/dma-buf/dma-fence-chain.c#L275
>
>> Regards,
>> Christian.
>>
>>> Also fixup reserve fence count to include media GT invalidation fence.
>>>
>>> v2:
>>>    - Fix reserve fence count (Casey Bowman)
>>> v3:
>>>    - Prealloc dma fence array (CI)
>>>
>>> Fixes: 40520283e0fd ("drm/xe: Invalidate media_gt TLBs in PT code")
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pt.c | 34 ++++++++++++++++++++++++----------
>>>    1 file changed, 24 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>> index 6c6714af3d5d..2e35444a85b0 100644
>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>> @@ -3,7 +3,7 @@
>>>     * Copyright © 2022 Intel Corporation
>>>     */
>>> -#include <linux/dma-fence-chain.h>
>>> +#include <linux/dma-fence-array.h>
>>>    #include "xe_pt.h"
>>> @@ -1629,9 +1629,11 @@ xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
>>>    static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
>>>    {
>>> +	int shift = xe_device_get_root_tile(xe)->media_gt ? 1 : 0;
>>> +
>>>    	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
>>>    		return dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv,
>>> -					       xe->info.tile_count);
>>> +					       xe->info.tile_count << shift);
>>>    	return 0;
>>>    }
>>> @@ -1818,6 +1820,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
>>>    	struct xe_vm_pgtable_update_ops *pt_update_ops =
>>>    		&vops->pt_update_ops[tile->id];
>>>    	struct xe_vma_op *op;
>>> +	int shift = tile->media_gt ? 1 : 0;
>>>    	int err;
>>>    	lockdep_assert_held(&vops->vm->lock);
>>> @@ -1826,7 +1829,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
>>>    	xe_pt_update_ops_init(pt_update_ops);
>>>    	err = dma_resv_reserve_fences(xe_vm_resv(vops->vm),
>>> -				      tile_to_xe(tile)->info.tile_count);
>>> +				      tile_to_xe(tile)->info.tile_count << shift);
>>>    	if (err)
>>>    		return err;
>>> @@ -1983,7 +1986,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>>>    		&vops->pt_update_ops[tile->id];
>>>    	struct dma_fence *fence;
>>>    	struct invalidation_fence *ifence = NULL, *mfence = NULL;
>>> -	struct dma_fence_chain *chain_fence = NULL;
>>> +	struct dma_fence **fences = NULL;
>>> +	struct dma_fence_array *cf = NULL;
>>>    	struct xe_range_fence *rfence;
>>>    	struct xe_vma_op *op;
>>>    	int err = 0, i;
>>> @@ -2022,8 +2026,13 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>>>    				err = -ENOMEM;
>>>    				goto free_ifence;
>>>    			}
>>> -			chain_fence = dma_fence_chain_alloc();
>>> -			if (!chain_fence) {
>>> +			fences = kmalloc_array(2, sizeof(*fences), GFP_KERNEL);
>>> +			if (!fences) {
>>> +				err = -ENOMEM;
>>> +				goto free_ifence;
>>> +			}
>>> +			cf = dma_fence_array_alloc(2);
>>> +			if (!cf) {
>>>    				err = -ENOMEM;
>>>    				goto free_ifence;
>>>    			}
>>> @@ -2068,9 +2077,13 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>>>    			invalidation_fence_init(tile->media_gt, mfence, fence,
>>>    						pt_update_ops->start,
>>>    						pt_update_ops->last, vm->usm.asid);
>>> -			dma_fence_chain_init(chain_fence, &ifence->base.base,
>>> -					     &mfence->base.base, 0);
>>> -			fence = &chain_fence->base;
>>> +			fences[0] = &ifence->base.base;
>>> +			fences[1] = &mfence->base.base;
>>> +			dma_fence_array_arm(cf, 2, fences,
>>> +					    vm->composite_fence_ctx,
>>> +					    vm->composite_fence_seqno++,
>>> +					    false);
>>> +			fence = &cf->base;
>>>    		} else {
>>>    			fence = &ifence->base.base;
>>>    		}
>>> @@ -2108,7 +2121,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>>>    free_rfence:
>>>    	kfree(rfence);
>>>    free_ifence:
>>> -	dma_fence_chain_free(chain_fence);
>>> +	kfree(cf);
>>> +	kfree(fences);
>>>    	kfree(mfence);
>>>    	kfree(ifence);
>>>    kill_vm_tile1:

