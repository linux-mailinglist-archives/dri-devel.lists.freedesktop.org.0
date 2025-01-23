Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99CBA1AAFD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 21:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB2010E8B4;
	Thu, 23 Jan 2025 20:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NJzwpRCe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2072.outbound.protection.outlook.com [40.107.212.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BEE10E8AE;
 Thu, 23 Jan 2025 20:13:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5hxpS7TqOG+S6pjBzG3y2OmI9aMzpVVSW9M6EVei1zZj8OCu+NqlhSyYvUMTcdCs7zAwCjzbju7K15ENiM6rHExY1VWpjoLksdTnWjUUkaW7lXYNmTIOJuKvg2ZA2/dKNnxD8TsGFsNt3TBo6/EqCYBPOYsEujLK3eZlKwBu7AwhAoLopH/W+5dEV7rNhBtg7rGhp/Fsr74oxKvqlKL5Jrt8/p9olp9b0dDkIRB1eMRhmVtd2Y5v+lk7qAna8EUllhbDoeMwDO6rLtiIhn41Sfs3i8U3htBhOiyoEYMvwgrfz4U2UkGroZdYbabJDLlMgJBraaX6ztEfM9mGXJlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQPP8tV8nb1Yn9aXD1BlIucnfQeaDmybjYmWbmekQpM=;
 b=nDTQskrGZ/aTG2osocjq4BTJuh0UhTYK3bUum6yP+f3gJ6DLWjM5+TTqJv7L92YS/MR0+lYAitTmg49pKicPfQPMOpCe0E6ywJ3a+g9WC8uqNgD1HA+l7WjU8ktHd6p4dwPBrkIf+A8VD2hl7siUziSq0RSM5BJDwBer7i8PYTeamHxKILtBxpzpad+OVESlQw29JSc/mmWvVP0aWIc8CO2A6AB/4RhxJK0wIOEHIJVzfW7p8EMT+Wn1J4nfrQnZteVBA+dLVztfAZqMEhW7ZN3pyvy/uXIxxo+MaQAsGSPYA/YFLeEbRvANvYa555S3SQaQFdsVuCoGmoJguihayg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQPP8tV8nb1Yn9aXD1BlIucnfQeaDmybjYmWbmekQpM=;
 b=NJzwpRCejoSs7BWUJnASMUnaSqj1QxkCw79TE4UjJJOIqtj4oorMrsfS58k/WkVnswAbWJljDyusD8fd3+FaunaeCGR2YryD2UlZRv8SFKjf2GzLD1YZfQ96rtbZwojizHgv5BaXp5G1Ml6hOfxknWYZVsJhfd0PkahkKxVTVN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB6355.namprd12.prod.outlook.com (2603:10b6:208:3e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Thu, 23 Jan
 2025 20:13:31 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 20:13:31 +0000
Message-ID: <935f943b-8464-41a9-ad16-5367b6abe8f0@amd.com>
Date: Thu, 23 Jan 2025 15:13:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 31/45] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
To: Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-32-alex.hung@amd.com>
 <VuB1bzC8-OmJkpsruFPIliNJDtjPACOabarfYceRZtyBwlToiOYx1ury1sjz3qa0FtHLUKR6z0m5tFVo-rkX_vL9g5XfIK7TiT-yMhKV8nQ=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <VuB1bzC8-OmJkpsruFPIliNJDtjPACOabarfYceRZtyBwlToiOYx1ury1sjz3qa0FtHLUKR6z0m5tFVo-rkX_vL9g5XfIK7TiT-yMhKV8nQ=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0d261c-7a87-4449-da84-08dd3bea67eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qmo4TXpjaGw2NGpiY1BXaHUwdHc2TWh4Uk5FVXdsWWxrSVJDdndLVUNRWmla?=
 =?utf-8?B?T1ByZWRxT0EzWFJYV3ZkcWN2RzZyeUJJZldMVVJ0MHNVTXR5UVhrTXZzTGZt?=
 =?utf-8?B?eGVWdVBYeFhYc0lZUmEwUmY4Zi95OEhtVTE2L3NxK1NEaHNWd09Qa2JyaU1K?=
 =?utf-8?B?MGYvR2gyVjdLdFNZakNMdHErODRZcVZRWWQwQWJacHp5RGtBeW9GbmRPK0xv?=
 =?utf-8?B?ODBJZDBHZ01uVEdWNXBhdHZrRGR6cUtxa0lxS2s4Z2k2eUVJWUoyTnA2UTJJ?=
 =?utf-8?B?R3hScDROeGt3Y0Vka3dnamNGSVphRkhVNm1WVmZ4WlR6UHhKcVZCSFpNaEN2?=
 =?utf-8?B?N05LbEQ3NUVLMmx0TTVqUUNvWDZLUjZFTUx0YXVDd1I4ejlvcWowMmZTWldt?=
 =?utf-8?B?SGxkOTM0b3Q4REx2TTFWQnVaV25hLzl2YW9JTUNmZVR2b0I5Tkd4Z21OSzB5?=
 =?utf-8?B?WEJrR3gvRDhRWUhHTXhjam1pbTFGSU11Y2RoZEN0bDdDQTFQT2NOaWpwQjRF?=
 =?utf-8?B?MXJGYVZycDhYV010cDVYcnlsZkYzT0xzY00yOHkwVHFEUVZ5aC8rUWREVGEz?=
 =?utf-8?B?d3ltTXJ1bzdqWDlUamI3a1owb0llR3hoVktqY3R1WEtpb1JoMVVWcmduZ1hm?=
 =?utf-8?B?L0R6SEtFeWhXOUZTRHRxYmRHZUVsZlhIb21uWGlDcFpyc3ZZTGIzWkJyQ2w1?=
 =?utf-8?B?eVMxVlgrZWZZUmJGeHpTclV1Q3ZucW5LQzlqZ3lldXBjWVByK0NmQS9FMmcw?=
 =?utf-8?B?RFVmd2xjaERxTmhvT04rK0t0RXBLcFQ5elZ2UHdnVTN3bWpmTXhYZ0lGMHdR?=
 =?utf-8?B?OXVTL3JQWkMzZjZEb3dYZnp0SnZJNTg4Y1YvNFZXYjF0d054cDN3MHp2aHd2?=
 =?utf-8?B?c1RraC9zdHFUcnpWdmxmNTdCZFllbmZhVjF4Q0Z2NkJMWGhiMVRBY3FRQXI5?=
 =?utf-8?B?QXhDNkJEU0EySngzcHRXRlE0cElrZXZhVnJYZnhxVFdyTzZVYk5OT21QenlO?=
 =?utf-8?B?UmtIc253U0VoZzF4ejQrdXBsRHJHS2pmcHVvTU1NRU15b05KT0Q0aGdPSTZ3?=
 =?utf-8?B?TE1SbjVzQ3pCVmhoc3JHVEZyOEo2TUFIZDVYNHc1VUNzRVhHbXM2b1Y4WEVC?=
 =?utf-8?B?N083S2lFVXlLaC9zOEJ5VXlGRGRtcWFTWTNvOXJNUDZ4MUluOTVJWnhtWFh2?=
 =?utf-8?B?eDFxZE9hV1hUWGhVTkprYlROL0hoNjlkOHVsSmtKdTJaMTFvWitlVDFxMEVJ?=
 =?utf-8?B?bmMzZlFiOEpwSzlXUG1qUGdNdDJ6Y1d5dyttR1VyREFkYjJ5ZVpaMWt6aDRJ?=
 =?utf-8?B?eDc3THBTOVJydlFLN010ejkzRWJPSWdDSFJKWWE3b21NYlBxcjFlRU5kWE5Q?=
 =?utf-8?B?OUk1VENnTlZJblBtazRJdlNQcVMxZTBpdmdoc1NESkt4Mk1tc3doSi9rdmxX?=
 =?utf-8?B?U2pIU2tzcHdGTkFUN3FxSkc2T2tzdVMrM2hXc2dzUmxPa0Y5dlM2amFXQS9F?=
 =?utf-8?B?V0ZoRGZ4UFFjTFlkN0NWMFVyZmVCS2l2djJONStjZHdNcDZrd2tmdndqZUUx?=
 =?utf-8?B?ZE5oV3hyeGErd1Y2WGxsRGpQRHhkTU8xLy9Bb080a28xNlhUNThVL1hZdzh4?=
 =?utf-8?B?dk1lVUVKclU4TFVSSkxOT1FvaDhnS0F2ZFVpbEJvTHdGcWp2cTJuczlOdG5F?=
 =?utf-8?B?Mm16MWF3VzJ0ZEVnZEtBbnpCbUxycDZVSEhxbi9FWmlMMEtpcHUyeU0vYzYw?=
 =?utf-8?B?YlA5Rzl4WmV0clR4UDVtMmpXajN6bjNVWkZiQ0psb3lPVHkwR0l0UnNVNVNH?=
 =?utf-8?B?OWtWZzdscm1HQmNqaUxCQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkxwTFhwaXBzRS80RDNKVkE3VUZQVDM1bXdWN1lMN2dSbFNmeVlQOWpTWGha?=
 =?utf-8?B?cU1xSi9uTExzYmlhdXlYQ0txaXJDU3kxa2w1b0U4ZGtBZHc3Y1RIaFYvMG9k?=
 =?utf-8?B?UXRueHIvOUNjNmlWbWtiN0tzY0tlWkptSU53eFlERHd3bXlzaWZieWpJbE9y?=
 =?utf-8?B?eVlKck1mSmRQVWhPeW84UWl5K1o2VGttQVVjM1JvWnpSVSs2YUlOeTZWaXJx?=
 =?utf-8?B?OEsyWnN1blJnbS9TcWJQb2RUZlBzek5jRWRzVFRzWkpLWHRzRm1KMHlBVnkx?=
 =?utf-8?B?N1FnSTJzelFLb1NKVzF4VHNYUUc2YUUwTGd4bDd3T0pUZ0RvV1c1UVVzNjdo?=
 =?utf-8?B?dk5wZnJrQUJFcTRDRTA0UWpGUTVFSnk4NVNMaEY1Q0J6UEtQNHY4eS9HL1Rk?=
 =?utf-8?B?TG9JNkRNN1hZTEltT2xnaVlOcU1mQUNheGxtSndMaWNzTHJmODV6MjRSNURZ?=
 =?utf-8?B?b0RxWHlHZlRpVHhxQU1jeG9iNlVwYjQ4dWJDUWJ2TGltQWU2cVVEdjZBTEF4?=
 =?utf-8?B?ZzZnQWJzZTVtcDEwTWU1K3Z1YXNTYThndWhUaWIxT3dwZDBXOTBrMUZKNWdl?=
 =?utf-8?B?U1VrbDZPbWNic1U1QUNJZTA4aEpDOVUwM1Q1VFdUR0pTdEJMczhBRmJnQlBq?=
 =?utf-8?B?S0NVMGVxclZQUURDaEdxSXF0K2FESkNGTVd3YTFCT2ZWa04yY0VPcnpqNFVP?=
 =?utf-8?B?UTlWQWNaSWZVS3A5bkJwL3BFR0YvNmVvUFdZblF3UDkvOGszSnYyY05ibHIy?=
 =?utf-8?B?aHVmMGVYc2c4RDhHUW9leUh4OTUrbXgrMWo0eTdsQlk2Uks2czZmSGh3TENy?=
 =?utf-8?B?OE1ObEcyZGlpeW1lM0NKNzlHM0NHTTlKdFF2Ym5jcnlSRW5xNEljVVFYVThn?=
 =?utf-8?B?WHJtS2d2ZFpqZnE2bzdqTjY5R1dPMkZ1dzRQby92YnNkNlgwbnlIQjZzMzVq?=
 =?utf-8?B?TkdlejNKbVFDZFZIa1RuWGt3RjlYTzBNeE4zU2N0QlVraTVRWmJxbjNTNVF2?=
 =?utf-8?B?eFEwaUEzaHlQWDl6eHlqMkR0c3IyVjJoNjBubnhVYXlsZHNxV2syOXM2YU9J?=
 =?utf-8?B?dnIwclVnY05DU3d2cG9sMDM4Mk0zK3U1RkE0Nyt3K0V1QTFKNTFqbW1JUnIz?=
 =?utf-8?B?RDBRdGM0dllFck80czI0eWxUcjNTSGY4R0E1VlQvT1ZRMkZ2MlhXTkdwUUhV?=
 =?utf-8?B?ckRSWUMyK1U0VjU3Y25PWkJoaUtuR0FyMncyRW1jOERCVUdSbGM4UGRFR2hG?=
 =?utf-8?B?MUJQSDRnd2NiSldKeVVqNnpSOVUrVTdIQUZXRmdzYnJ0cFNZd1k4NlU5M3Zh?=
 =?utf-8?B?VUtQeXNVdldBVlE1eHhENERWQXk3NFpyQkU5OU12MmFMZjNPSGN2NGM3UjlE?=
 =?utf-8?B?c0VuMkUrUVdjZG1qVlFyMlpzdnBNR3A0TVVhenFJMVRCbVNJT3k4b2FHdjJy?=
 =?utf-8?B?NXBhazBJUVBnZDEvWXJEMm0zSDhnUFlJWXhUdHpCK1k3U1daVS83RloxVTBP?=
 =?utf-8?B?RGtOajVQcmRrS1I1Q1VzZE9XdXZMMHNqdlBWdlh3bHBsQVpwK0Z4V3BEQ3Na?=
 =?utf-8?B?L0NmZXJWQ2k2cnMvTWVnbXAzVGpieHcvcVlSVTRMOW5NdDlPVzlYbjRPNWxr?=
 =?utf-8?B?Z0c3VVBCbVVFdnFSUDRHemhIUWtGbUQySXdCNlJhSDVwY1BUajFsZVYrcC9Q?=
 =?utf-8?B?L0pTWURVS2t6UHJLTHBlclFLbklpRXBuYWtJNGhNZURNMUVYNGlFSnZCY3Zu?=
 =?utf-8?B?R1VUS2FIdTBCa2poYU9kQlRjbjZOcUorbnhlektBVnZSTXlKTXo4OWNKbnNL?=
 =?utf-8?B?bXZOQVFXYmRBRHQzb0tvMXFsUlI3ZVBBZXp4a2dYcjFRTkhodHJpL2ZDdDJh?=
 =?utf-8?B?cEg4WWc0enpldVRURWlqekdPSGsyVTBEbXVnbEdIRDVYNTFwV0g0MkVZYVBh?=
 =?utf-8?B?ZVhiSW1WN25oZzhNSDl2MUorY0MzNG8wQWNMaGc3YUxpMFRMQXRPcHhIbmVI?=
 =?utf-8?B?N216dHA4bXF2aHc4S2dvemoveDZpR1hsWDNkdnBQMi9pWmE0eVJzeVBFdHB5?=
 =?utf-8?B?aFN3TlZnL2NsVGlKNUpnTjc2NFhlUlZFamkvcVNTYjllS1EwbmNvVStmMWlx?=
 =?utf-8?Q?6J+tLgIfEQ3ivKHoqs9E3Oine?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0d261c-7a87-4449-da84-08dd3bea67eb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 20:13:30.9875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fmeW4m+SukZ8S6bfi5q/7ucWcTdRJBROKuEZdc9SiLUD1BfS/rcw8em+NuCMG1CAP5eT5ccClHLC5sR35MHWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6355
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



On 2025-01-15 03:04, Simon Ser wrote:
>> The BT.709 and BT.2020 OETFs are the same, the only difference
>> being that the BT.2020 variant is defined with more precision
>> for 10 and 12-bit per color encodings.
> 
> Just to make sure, the spec defines this precision, correct? It's
> not an AMD-specific thing?
> 

Yes, see [1]

>> Both are used as encoding functions for video content, and are
>> therefore defined as OETF (opto-electronic transfer function)
>> instead of as EOTF (electro-optical transfer function).
> 
> Ah, and IIRC the OETF is not the mathematical inverse of the EOTF,
> right? So it makes sense to have separate entries for EOTF and OETF
> and their mathematical inverses.
> 

Correct. EOTF and OETF are used for reciprocal purposes but they're
not necessarily inverses of each other. Some curves are defined as
EOTF and others as OETF.

> Again, I am no HDR expert.

No worries. One would think this isn't rocket science but when
looking at it closely it doesn't seem too far off. Granted, I'm
neither a rocket scientist nor an HDR expert, so what do I know. :D

[1] https://en.wikipedia.org/wiki/Rec._2020#Transfer_characteristics

Harry
