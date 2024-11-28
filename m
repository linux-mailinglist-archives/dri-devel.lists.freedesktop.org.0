Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135999DB039
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 01:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126D910E43E;
	Thu, 28 Nov 2024 00:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WojIdcAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F2F10E43E;
 Thu, 28 Nov 2024 00:19:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSSx+9f744Z/vAocEeQ+ls2W3hBBr9oa1BRFEhxO6/SVdKBDk2+NURfCwjYiO8TShSr7jAmZm0/kv8XrIEfqSOowKIqlju7ycFH1oui502LJxGDVhGQ0+TgYEAhoMTWjyMqBo7vbgQIxhjAbXjBbIkp3G6C20kosgCwzsccSZ8DLJANRebuJFSLNjZ0v6Ij9rZ5p1+OD9UImrtaM90TLt2MscsX8YZ2lItKo5IGw1Z4z2uquqLATLJEbrNekBVT0WaAa4IPEL6ZY0unzR980UKoEgk80Q9U89/cNC2LIlJzHTfikrQ62RvO6/WHOftTU+W7DO9d9GkZvoKGcZ7SjWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqZdirYXrYQNx+30J3JAz34QXJ7fm3tZlGR2krHdZYQ=;
 b=oyjV+3I5IHkZhJIWu+8d764XddFgGYHynVTzPNpCj9RzvmQ6TMraZJGbOOsaIh5UZir8fDqZEAjrty3YdCAa+hCbO2ELWOklRHNRpmKxfoJsKkvx35QQA2FlOYtANgjehtwfXOMy9sl0w/Lr+3Jo8wGQPhrydOrPYEu6IWou9pAsA2/2YEBdEFy5QGh2lcLZ5Ifk708j8r9lq6WHeW/aM7x1V9CbMkT3v6fWgze7uJD0bOE2/DXX6n0Q/mRMrJcFtbac1U329rvB2diqsd0RAOErPJVMr0UjULOTp73YuNNSINGGVFsxn6QFL7SeggEJPnaiC86dQ3KizWDnVkkKXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqZdirYXrYQNx+30J3JAz34QXJ7fm3tZlGR2krHdZYQ=;
 b=WojIdcAS1UfZT2pDkz+6S84GrA2DmjNVaySxkT+p1HSaLmGj02eoYCjyCoapoXkFykKBQyD/7r91tPzE8XrlgTfy5SdMr9NNRju5hNGNPP48MCyOwiCkAWukUn5qZ02lDvtGbe9UtVzBrC82aaPt5NQEtVzbxPehxz2QtM8HOp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY5PR12MB6036.namprd12.prod.outlook.com (2603:10b6:930:2c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Thu, 28 Nov
 2024 00:19:52 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 00:19:52 +0000
Message-ID: <1f4134b0-3330-4254-b7b7-d17bafe81d4a@amd.com>
Date: Wed, 27 Nov 2024 19:19:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6.1] drm/amdkfd: amdkfd_free_gtt_mem clear the correct
 pointer
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Vamsi Krishna Brahmajosyula <vamsi-krishna.brahmajosyula@broadcom.com>,
 stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: Philip.Yang@amd.com, alexander.deucher@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com,
 vasavi.sirnapalli@broadcom.com, Sasha Levin <sashal@kernel.org>
References: <20241113121030.2405520-1-vamsi-krishna.brahmajosyula@broadcom.com>
 <7615f2ae-2563-4939-934d-0b02e3f2d10e@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <7615f2ae-2563-4939-934d-0b02e3f2d10e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0097.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::29) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY5PR12MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b10322-c0a8-451a-93c7-08dd0f4260aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0FmY29ML0RUMmxwVHdXb1RTQnZUWkZDUDVkRUNkNTZvZTljMk9Pdmh0NGFU?=
 =?utf-8?B?dldMZUp5NHhyQUFRa2RGbTZMQlhQbG85blozbG1tZVZ0b2JGa0cxVEhWOWpO?=
 =?utf-8?B?NFFRbUFFcGI1R09QME1KN0ZwaUM3dDV0TU9SUnBxcHVSSW1qbHR1TlRsdGw3?=
 =?utf-8?B?Zy80WWlONDVzL01mN3ZxNzZzMUpSSFRZRldCNnQxanVkOEg2ci8rak51VU85?=
 =?utf-8?B?UndXNGZBWFBuZ2VDVUpCNGdHOXZhNTlNYTdmaUF4WXg0UnhONHR5aytuRyt5?=
 =?utf-8?B?ZldvLzZvY013cHpmKzhuN0R6QjlPMHFJVytRM3ZxWHlRWmNhektqVy94L2RT?=
 =?utf-8?B?Tzk2YkJhQkw5eVlxWGpRSEY2VDFNeXpuV1hNVzEwOWIzZG8welJvRklGZGxX?=
 =?utf-8?B?bGMvSGlPdElLa1hORmRmY21yU3hVbGpaYlJOOHliNzZleVJmeFdBRi9JZnh1?=
 =?utf-8?B?VGNuT1NyR0dVZlF6NzlBS3RGRmFnaXFtSkdHN2cxZTNDenB3ck5aNEw5ajBF?=
 =?utf-8?B?NlpLMTNrT1BkcWNqS1EwaXgxT1M1ZmVVR2s2NUpKU1hyNHlta2xoei9RK3dM?=
 =?utf-8?B?VzRJV1hwTk5MU2tvUDUwV01aNm12S1lDbkhlQVQ0T2JYaDlzN1pJZnUrckw3?=
 =?utf-8?B?K3FUd3BLd0ViYlpHWUJQTUhaNXY3QzcrZEFLT3d2YWEwMnR2NS9zdnY4OWNr?=
 =?utf-8?B?SGtrWHpoK2E0M3BpZDd6ZURCK0FNdmIzYlhML1BCWGw4Z3NBbzZLS0ZXTUw2?=
 =?utf-8?B?Ny92TU14MXhBblZuUWhwS0d4c0NSd0hHNzc3dVlzaDc1Vlk2TUJZa1VhQTJK?=
 =?utf-8?B?NHlRZFFFdTQwbjg2WUFlNWRhUzdWR2Jvei9xdjI2WmlYTHJkTUJUSHNOOVhZ?=
 =?utf-8?B?ajNDNWZZT0IvODdZTzNja0Ywa013ejRQMWxLd250WVRLeVZaYitHMUYvVHpu?=
 =?utf-8?B?Wk5aODdjR3VKekJ4bjRMVnFDQUNGY1YzWGZOSmpuMVk5NzZpYnFuY2pqVmxK?=
 =?utf-8?B?TGlsZW0rUXhQTEpNWEJNd251d1ZhcHUyREVuZGRUM2lHSU1md3lNVVlpVFRZ?=
 =?utf-8?B?VW5nSHRtcHhpNDVXSktTcWR1ampWZzBQNFdubHJMSWUraytmUmJnVFRKM1Ay?=
 =?utf-8?B?enF0TjQ0NWZDSUdTWFJ2My8vN1c3eWtZaXJHVmtsY1Z6VEx4WGdPVDlwL3Rw?=
 =?utf-8?B?QVp2UVhSbUkzMlJYdFFIMElNMnZ1M0o5cDVPTHRyVDZVRzdmR0NOeXZVcDJT?=
 =?utf-8?B?SUZxQXZQWjB1R3c5aCtQM09lbVFqR3lkQXJLSWZNNnJPckxFUUhyRCt1L21s?=
 =?utf-8?B?UktoRmUrcHh1MURNRG5YcFRiQUtkaFZmYjVUTndnaUhhKys4U0FJdUt6VDBC?=
 =?utf-8?B?R2Q5ZmhwOW1LdDUzUEh0YzQ1YmcwRjlrUXNoV2ZXclllR0JHem94TU1iODdi?=
 =?utf-8?B?K0hqRlcvRkV3RndabHJRYVdneWI3bU1HN3hCQnVXYk5XdFhxMTNvVWJ2VzNn?=
 =?utf-8?B?R0krRUhhZGVzc0RMaktVcEZ6UFl5RW5uSU9NczRDUDgybjdvenZkRkJYK1BO?=
 =?utf-8?B?Mno2eDhYMEdqLzhOV1hzbHJnRWV3akRhQ0JOVFAyUFlZbW1TR1N3STEzZWQ4?=
 =?utf-8?B?VTdTZ2g0N3RHcnVGN0Viak00Q1FTYUNaSmJCWG04YkdSQzlyeHVrR1Brb0JT?=
 =?utf-8?B?aTRSTjZ6cThBVmFZZVNZRVpIdWVBSmxFV0ZwUUY2NFR1YWlKQ0UyUkViczBI?=
 =?utf-8?B?V0Z1d01WT0p2aUtlamhNQ3IwZjZMclU5eVAvNzMzU05vdlBaWklxakJFd3lO?=
 =?utf-8?B?elcwdzlMN3NBK3NTY0N5QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3k1RUtwVTdCNzZMTlFxc053MlFzRDJuUHRYRWlxN2xoNmZ6NE11K1hac3Zk?=
 =?utf-8?B?NzV5ZWlVYXBvWDZIUEVmcTJEMXhUOEc0bVBpeCtpbXNlakVTV1pCZnNSRUZ4?=
 =?utf-8?B?eWZaUkhqWm5rVUgrOW5CVnEwaHBxeWJLSVA0TTl0a1g0MFQ1OXVBOFFPay92?=
 =?utf-8?B?WjlOZUh1Mkk5N1ozTlpLdEM0cEM5WDE3MG1ic1RwRDczcFE1TnRHL3psaFg0?=
 =?utf-8?B?ejRJbXEzcEdtcVZTQjFOMUgrUjZYTDlCTzA5VWJqckUva2hMOTMwempMSFVk?=
 =?utf-8?B?NlllcmtjNXg5VTBXNTFUSVhGSElDYzl3T0NnSkNwSTlac1U0aVZnMmY4Tk9T?=
 =?utf-8?B?VCtURU9TRW9WbG1ML1lkcytZRHNRVXRrMUx4eFFrOFNXSXplSElBZEFmQ0Rn?=
 =?utf-8?B?d3BHMUdiUThnSFBLSTRTS0Y5Y0dCVXBxNktPdnNla2tzcC83Szlsb2hIOUti?=
 =?utf-8?B?TWpHckptNGtwRE1wNTRpZ0ZhRGdqZVJPSk5nMys3Z1NwWlo2TnpZQktPd1I4?=
 =?utf-8?B?cEZUaWFNb2dBNVRUWlJaYmxza3h5YmRzb3ZuKzVRWVlwaXFJQXF2VytyZHpt?=
 =?utf-8?B?VmFid2N2eXordmVNVk8yNEE1TkF3b0g5SUZVeXBvZnpYOVpHL250RjU5Qnp0?=
 =?utf-8?B?WnhwTkNHTThKZG9FalNKR3UwR3VXajE2Q3hXcUlLd3MraDJQcWI5U3Q3YzRu?=
 =?utf-8?B?aDVST3BxeEpUeUJoalkrVmk3S2JsRkVaLzVUa096Z2RoOGtSVTBNMFpKV0di?=
 =?utf-8?B?Wm8vN0hDdklNa0d2RjhQOEEzdEpHbWV2eTJzVjVrdUZ4bW9mVE5JVnEwNW5S?=
 =?utf-8?B?T0Q5VnZTODhNYzRUanRPU0EyTjlFanlpRlhIclNQSmZ2M1drd05MekdJV2pT?=
 =?utf-8?B?WUhIeVl4WUptSWIrQjljYzFqZzd2b0c2dkdHL3drczY4bHVUcDRQMFFXZ2Jq?=
 =?utf-8?B?REQ2QmEzS2VZcVZtV2hwT2pqMWgzWU5RMjA1NGVlUkdFTUIvc0h6YlJOeFhw?=
 =?utf-8?B?NUZ5UmVGK3EwczRsVk8zK1FVNEwzK0pTbFFqQlgwZzdWWDdaOFZnSXg3OFhH?=
 =?utf-8?B?SWRZTGdsWlM0MVlFZldUTkNWdUR1NWlxczY4aFJ2WHVsdXQ4bzZaTGtUUUg3?=
 =?utf-8?B?QVpBWko0MFZwcmc3ZmJFdGxSQVBrN0I3VlI5MmZsaVFvditkTGZPNFc2dW1B?=
 =?utf-8?B?UHQxTUVPVHErTVR6clVCaysxT0JRSlBDUEhERXc3bUljbkdod3hsWUllVERY?=
 =?utf-8?B?QzdNeUlaL1pGOW52Nll0TVdNY0YvakloS3hyZDYxM2x3d3lkbS9iemNrcWlt?=
 =?utf-8?B?Y012SzJKbllmL2FZb3J1dGFsODcvbXhyU1pSc3ViamZINmNXTFhlT0ZoVDc5?=
 =?utf-8?B?a3ZmT2lpUFBNaDlhYXdJYVpzeTQrYWp5cCt0RHpnSEdUaG8yNHZPcWFucU1S?=
 =?utf-8?B?Q2pNNnUvd09hSTgwczhEdXdlcUZPNDc0dkdUVW5MUU9vOTNuSkp6RnAvZlU3?=
 =?utf-8?B?Y2lMVmMxa2JKR0ZKLzBGZkFWSmIvczkvWlB5VVFYSFJYeW8rZTIyUUw3a1Jt?=
 =?utf-8?B?Q3JjRXNGVXRBalhZakw3QjVPMG5oZlVvaE80dTMwVjJXeHpVYTVlbUhQN2NY?=
 =?utf-8?B?ajBPc2U4M1dEQllLTXhWdG91cnl2eURlVVl6cnZBSEtJQ1NJNjNYUlE1YmN6?=
 =?utf-8?B?a2dkdWRhVVdtSkMwUHkxL1ladnZMWWVIQmZkbEFqNmU3eHZTNElvRHFGSjhV?=
 =?utf-8?B?Yzc4N05lV0cwdEZOd2trbjBVcjdtbU9teXlybWJXQXM5UXJoT1lQUmExR1Vu?=
 =?utf-8?B?WU9TZk5ZNFBFTWFtYzRpUXNpTXJNY2lKejE5elo5dzJWeHBzaDdIb0IveDZ6?=
 =?utf-8?B?WW9TZ2FYK3gyVHU2SDBHK3AwRElLcE0wdjdBQzU5SGh4VERPMlBwS2FBNUJO?=
 =?utf-8?B?ZElUVnV4MTliaXFDRlBUQ29MbDFKSUxneVVXMllZVUpTakJxdmc4VWJUZFZN?=
 =?utf-8?B?bGNEVlNOU08yekI5MXcxcEk4b0M5K3ZETzQrdyt5MExyb01KakVidTI2anNX?=
 =?utf-8?B?eUpaSWNMK01ZRk1kbzA2RHgwSFJHc0QzSkQ1ekFiVDR5Vm0veE84dkFZS2NL?=
 =?utf-8?Q?YBMojcD0+HWE9C1EcXyQVjyBT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b10322-c0a8-451a-93c7-08dd0f4260aa
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 00:19:52.1811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+68zW3Basgdu4QBdakMDOelyQEUUAAv+jLitqtkT1Ij7HDPxtw0F5C94SAz2t7NbdDDU3jq/n/Nn/saEn/7ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6036
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


On 2024-11-13 07:13, Christian König wrote:
> Am 13.11.24 um 13:10 schrieb Vamsi Krishna Brahmajosyula:
>> From: Philip Yang <Philip.Yang@amd.com>
>>
>> [ Upstream commit c86ad39140bbcb9dc75a10046c2221f657e8083b ]
>>
>> Pass pointer reference to amdgpu_bo_unref to clear the correct pointer,
>> otherwise amdgpu_bo_unref clear the local variable, the original pointer
>> not set to NULL, this could cause use-after-free bug.
>>
>> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
>> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> Signed-off-by: Vamsi Krishna Brahmajosyula 
>> <vamsi-krishna.brahmajosyula@broadcom.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         | 14 +++++++-------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  2 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  2 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  4 ++--
>>   .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  2 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |  2 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  2 +-
>>   .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  4 ++--
>>   8 files changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> index 5d9a34601a1a..c31e5f9d63da 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> @@ -344,15 +344,15 @@ int amdgpu_amdkfd_alloc_gtt_mem(struct 
>> amdgpu_device *adev, size_t size,
>>       return r;
>>   }
>>   -void amdgpu_amdkfd_free_gtt_mem(struct amdgpu_device *adev, void 
>> *mem_obj)
>> +void amdgpu_amdkfd_free_gtt_mem(struct amdgpu_device *adev, void 
>> **mem_obj)
>>   {
>> -    struct amdgpu_bo *bo = (struct amdgpu_bo *) mem_obj;
>> +    struct amdgpu_bo **bo = (struct amdgpu_bo **) mem_obj;
>>   -    amdgpu_bo_reserve(bo, true);
>> -    amdgpu_bo_kunmap(bo);
>> -    amdgpu_bo_unpin(bo);
>> -    amdgpu_bo_unreserve(bo);
>> -    amdgpu_bo_unref(&(bo));
>> +    amdgpu_bo_reserve(*bo, true);
>> +    amdgpu_bo_kunmap(*bo);
>> +    amdgpu_bo_unpin(*bo);
>> +    amdgpu_bo_unreserve(*bo);
>> +    amdgpu_bo_unref(bo);
>>   }
>>     int amdgpu_amdkfd_alloc_gws(struct amdgpu_device *adev, size_t size,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> index 4b694886715c..c7672a1d1560 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> @@ -210,7 +210,7 @@ int amdgpu_amdkfd_evict_userptr(struct kgd_mem 
>> *mem, struct mm_struct *mm)
>>   int amdgpu_amdkfd_alloc_gtt_mem(struct amdgpu_device *adev, size_t 
>> size,
>>                   void **mem_obj, uint64_t *gpu_addr,
>>                   void **cpu_ptr, bool mqd_gfx9);
>> -void amdgpu_amdkfd_free_gtt_mem(struct amdgpu_device *adev, void 
>> *mem_obj);
>> +void amdgpu_amdkfd_free_gtt_mem(struct amdgpu_device *adev, void 
>> **mem_obj);
>
> Why is that a pointer to a void* in the first place? It looks like all 
> callers should work with an amdgpu_bo object as well.

Historical reasons. When KFD was a separate module, mem_obj was opaque 
to KFD, so the call from KFD to KGD used a void*.

Regards,
   Felix


>
> Regards,
> Christian.
>
>>   int amdgpu_amdkfd_alloc_gws(struct amdgpu_device *adev, size_t size,
>>                   void **mem_obj);
>>   void amdgpu_amdkfd_free_gws(struct amdgpu_device *adev, void 
>> *mem_obj);
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> index e3cd66c4d95d..f83574107eb8 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> @@ -408,7 +408,7 @@ static int kfd_ioctl_create_queue(struct file 
>> *filep, struct kfd_process *p,
>>     err_create_queue:
>>       if (wptr_bo)
>> -        amdgpu_amdkfd_free_gtt_mem(dev->adev, wptr_bo);
>> +        amdgpu_amdkfd_free_gtt_mem(dev->adev, (void **)&wptr_bo);
>>   err_wptr_map_gart:
>>   err_alloc_doorbells:
>>   err_bind_process:
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> index 27820f0a282d..e2c055abfea9 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> @@ -673,7 +673,7 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
>>   kfd_doorbell_error:
>>       kfd_gtt_sa_fini(kfd);
>>   kfd_gtt_sa_init_error:
>> -    amdgpu_amdkfd_free_gtt_mem(kfd->adev, kfd->gtt_mem);
>> +    amdgpu_amdkfd_free_gtt_mem(kfd->adev, &kfd->gtt_mem);
>>   alloc_gtt_mem_failure:
>>       if (kfd->gws)
>>           amdgpu_amdkfd_free_gws(kfd->adev, kfd->gws);
>> @@ -693,7 +693,7 @@ void kgd2kfd_device_exit(struct kfd_dev *kfd)
>>           kfd_doorbell_fini(kfd);
>>           ida_destroy(&kfd->doorbell_ida);
>>           kfd_gtt_sa_fini(kfd);
>> -        amdgpu_amdkfd_free_gtt_mem(kfd->adev, kfd->gtt_mem);
>> +        amdgpu_amdkfd_free_gtt_mem(kfd->adev, &kfd->gtt_mem);
>>           if (kfd->gws)
>>               amdgpu_amdkfd_free_gws(kfd->adev, kfd->gws);
>>       }
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> index 1b7b29426480..3ab0a796af06 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> @@ -2392,7 +2392,7 @@ static void deallocate_hiq_sdma_mqd(struct 
>> kfd_dev *dev,
>>   {
>>       WARN(!mqd, "No hiq sdma mqd trunk to free");
>>   -    amdgpu_amdkfd_free_gtt_mem(dev->adev, mqd->gtt_mem);
>> +    amdgpu_amdkfd_free_gtt_mem(dev->adev, &mqd->gtt_mem);
>>   }
>>     void device_queue_manager_uninit(struct device_queue_manager *dqm)
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
>> index 623ccd227b7d..c733d6888c30 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
>> @@ -204,7 +204,7 @@ void kfd_free_mqd_cp(struct mqd_manager *mm, void 
>> *mqd,
>>             struct kfd_mem_obj *mqd_mem_obj)
>>   {
>>       if (mqd_mem_obj->gtt_mem) {
>> -        amdgpu_amdkfd_free_gtt_mem(mm->dev->adev, 
>> mqd_mem_obj->gtt_mem);
>> +        amdgpu_amdkfd_free_gtt_mem(mm->dev->adev, 
>> &mqd_mem_obj->gtt_mem);
>>           kfree(mqd_mem_obj);
>>       } else {
>>           kfd_gtt_sa_free(mm->dev, mqd_mem_obj);
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>> index 5bca6abd55ae..9582c9449fff 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>> @@ -1052,7 +1052,7 @@ static void kfd_process_destroy_pdds(struct 
>> kfd_process *p)
>>             if (pdd->dev->shared_resources.enable_mes)
>>               amdgpu_amdkfd_free_gtt_mem(pdd->dev->adev,
>> -                           pdd->proc_ctx_bo);
>> +                           &pdd->proc_ctx_bo);
>>           /*
>>            * before destroying pdd, make sure to report availability
>>            * for auto suspend
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
>> index 99aa8a8399d6..1918a3c06ac8 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
>> @@ -441,9 +441,9 @@ int pqm_destroy_queue(struct 
>> process_queue_manager *pqm, unsigned int qid)
>>             if (dev->shared_resources.enable_mes) {
>>               amdgpu_amdkfd_free_gtt_mem(dev->adev,
>> -                           pqn->q->gang_ctx_bo);
>> +                           &pqn->q->gang_ctx_bo);
>>               if (pqn->q->wptr_bo)
>> -                amdgpu_amdkfd_free_gtt_mem(dev->adev, pqn->q->wptr_bo);
>> +                amdgpu_amdkfd_free_gtt_mem(dev->adev, (void 
>> **)&pqn->q->wptr_bo);
>>             }
>>           uninit_queue(pqn->q);
>
