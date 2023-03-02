Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B85C86A83B8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 14:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B99B10E500;
	Thu,  2 Mar 2023 13:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9505C10E4F6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 13:45:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQcUBFtt1QqfHV8HR5QDaEWa+xI8m7pVVYsEsAE34vSS+Gcep5iCsi46AkNTANoNIWeAy/dr+balA9lsmU3cUXH0lo3K1udt1SXTkOaxv6QExh3gfMC4tNck9Ql9QsHIih0QIgiM3PbDj/Qvg1R72AjzLiz8RgndU+LMV1lyt+ZW+3wsKB9/SbGTsHOxhDJyE/YBb+X7nGhU4bl87Q+JYXuo8saAqfavqPJkV7jaAV/y0sAIQ2/tj3hq7WMSww21FYRozw7jHDqISdMZe41HFMyHCWh6ExBxkYRJNcN300vTbiSDv6JkPbjXVOVxULMswVnzqy91pZxkDrWm2M/k1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXwALjxIgpVzyYkzJjsRo4ixulY0y8UaOwxe6ZjURnU=;
 b=D3H6Zc1+NFlZQZIwGysbvcY1svhIXdx08h1tdwkRK1dbkWNoODI3OnuD4O7Fqn95PCdbhliNzoLlp10Zxzw9b8zayh5wOBMBFdyQ8OnJVAQUFSoyuKhdcKm7KTGVAI+oFVt1G23OMAenRqiSOQKyWrOUbDHAq1qv8869W3pY93u4wpwT6gpeHGccEvYEQGHlLhOBIS/oUSdtbbtcUzwKTR1zqiOBViN6AJ5O6Y5XrbrboDlKyVLWVhCByfEIeB9pq8fsO8aby7CD9m7J/9brR0Fjte0FyM14eNlX6zvyL8e/OokT/CbPxwhwPtHsQdlODw/xiXMBo/PWdEtELemUuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXwALjxIgpVzyYkzJjsRo4ixulY0y8UaOwxe6ZjURnU=;
 b=iuZspgN3kIIxp/1IvPO0KfAyhN0hik8yAK3qpoIRsgGA/Ae0eJ13qgp77LoGOu4O/0zEGKJYjQeJ0MxEW4G1I0PZnIwqqGhcbeJ+9pGNptsag9L7vgXoxGSOmt2UR5+1d2Qwf+eRMfQdhtMG4feK68FR2UyZsjFfTNrZMXcIr9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7284.namprd12.prod.outlook.com (2603:10b6:510:20b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Thu, 2 Mar
 2023 13:45:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6134.030; Thu, 2 Mar 2023
 13:45:27 +0000
Message-ID: <88d22a5b-a9b2-2c36-4f97-61a9457de5ff@amd.com>
Date: Thu, 2 Mar 2023 14:45:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/vram-helper: turn on PRIME import/export
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20230301222903.458692-1-contact@emersion.fr>
 <e3fa0ef2-b9a0-ef53-abb5-edaa14eb3f9b@amd.com>
 <R1BP91PubkIEl7OMjpEUBo5n8CdMZ4yW4KHtgZJZ3Ay0qJ9GREsN7oKCr5k2H6g_r03AEX0w0owgO6jBZXaKSDjzh4OH1S7LDHd1QXicvxE=@emersion.fr>
 <e5b9ee07-f74a-8d00-066e-92c9c23eb32b@amd.com>
 <IYfrkM6pX_UG4YmuGWHn_Svt3v41GcYgn5cUdbs1__7MI0VbE7-u_t4HR0w5TRsnp5UHgVm5EaXevgskKbiQ--cG9xF4FeWeObnC5Gto2Vk=@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <IYfrkM6pX_UG4YmuGWHn_Svt3v41GcYgn5cUdbs1__7MI0VbE7-u_t4HR0w5TRsnp5UHgVm5EaXevgskKbiQ--cG9xF4FeWeObnC5Gto2Vk=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: 2492158e-7127-48ca-0592-08db1b2461d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OjOjMWAaleaciUF6tCgPr+Xv0ue4nEkx50q97gHcCQcY3SgQdmf/bEMycilqVMvNfrFQTTZgMKgocTo1ZvrMGsUxc5QSWbK8E2AgkRz0tCUz73u28h2ODzRQKz/Zief1cJAvOXMic7DNW/bif2gK3j+c5hGLG1Wv9lKwTrL4MEsyXtKoRxeTeKNOiISySSdRLeyCBCLmyKUU3q7R7RbXsdbhsQpqZs+G/YR3eptLDyFcInEWX4pZ45IjNMTq15Ceb0V4zs2XxMqt6G+ug+7Jy8kyy2P4Y7cvBiZ0dtHwo/1CDea8EVFN+7NaUFPdLaWaFzpeYyhuuXGj5g7HCAd+SxXuV4noMIxuhCKf5P3rOy3AnBNkHURBWLLbuAB/GG7FPfmnceM8bDz08GvwQ8zkIWkAjfq7rC0JfvVa+/czjFrmAu9hYf2/CM3X0mBvvoGRSAmx8FNkb72vuMHhMLbh+0MCDoZEkD9qByqHVhbvDoA80StNDnBwD5hJtI2WGVk7VvIPIjFCndvi3L9kBdwybjaEMaeLGqhLuK+frt7UHYWJXQZJJk/pG5Ne3Ck2VlHarlO51cd7RF9TY30nICqYz0xx8Nrtz2oHCuAA/tGUbDuf48VPUAxWau4eNmBCrVkmhVchZeWC4U6Tm+bXogqmy6LqPZl0FYMO7ssQoN78CPQgLHbsOhRjT7al1vu44uVMPZd5dgTC4M5VmcU1isijcnS2EaKBxaDoAM9nnb4wj4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199018)(31686004)(6666004)(66574015)(36756003)(5660300002)(8936002)(478600001)(38100700002)(31696002)(86362001)(2616005)(26005)(186003)(6486002)(6512007)(6506007)(66946007)(66556008)(66476007)(2906002)(8676002)(6916009)(41300700001)(316002)(4326008)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjBFeVhXMnpEVk4rcDRlUUhwYlp3WWFWNTZpTHZsd00yMVFwU3Fmd0Z5OEpN?=
 =?utf-8?B?ZEhZc3RHT29BUktlTHZBT1ZWMm1ZckE3c0hwWGR4Y21ISE82bjVCN24rUzBy?=
 =?utf-8?B?TFJ4RWZEK0U1MWI1REFXMWtGUTNENHZwZlYzRFFodmQ1WkF6UDRTa3VaM3VM?=
 =?utf-8?B?YUE1OFFxUGg0ejV5QmxPQzIrRklBY0V2VkxqL0thd1FOWEM5TEljWXluNlNR?=
 =?utf-8?B?dTlhRkEvajEzbkVOVi8zaEQvekZxSDJvUzNQZFNFVjBNY0NJeWNkRkRRWWdD?=
 =?utf-8?B?UlpMQit3bE9pM3J4TGpySWMrLzJmZWNNV21OZDV6cUZpVVVGZXBZTHMvZS9U?=
 =?utf-8?B?bTl3NWdVamFHMXBqTE9Ta04xU2szRm9pZlJ3L0dxcUwvK2V4VEM1R0g0S1pX?=
 =?utf-8?B?ZVBlL3U5N2xCdUJaTk01ekNSRFFpS2ZIeEJJOXdjMXY2OTdsZjFPN2NtSzN6?=
 =?utf-8?B?ZkpORW9oc1lEaTFCb3F6SVp1YWpWQTVrQ1VuSzFzL2ZSQk04RFlDeXE2YmNs?=
 =?utf-8?B?dlJBZ1lXY29HNXF3NmMyZjV0VlRkK3FYZUdXbFdGOXNkVngvTVVKZlhSTzkw?=
 =?utf-8?B?MVExUzVvSXY0QTlFUjE2Tnp6NFBjQ3NMUEsweXBxcGJqN2I0ODVZV2ZiNlVm?=
 =?utf-8?B?b3dRQkFmSWZUMjlveG1BeE5iQnIzUnVYMkQ3dWhrQktqSkpNTTJoNUtwRkg4?=
 =?utf-8?B?KzJncFlwcmJTMkRURFJrOWFzb2YwM1lkV2FlV2JtLzQ1UzVtOGM5Y1BpMFBO?=
 =?utf-8?B?STlIMVQ3bUtlS2M0UHpDUS9IbjJmRVpjSmZWL2x1WEFoRlJjRmV0VlpZMmRk?=
 =?utf-8?B?Mm5pYjhRSmd0Tm05V0pXdmhPY2pmb2NSOHphWGdvNndXQkdnTEp0aUNpc2Fn?=
 =?utf-8?B?V3pmK0FNTlprU1krQjU5aWwxQXRUR3I0UTVjMVJyVlpSbFVFcVZjSEFyM052?=
 =?utf-8?B?SzlWc3gwb3g2VzA5WG5OWFRONnA3VlNUem1Rck40cUJmOWpjK2REUHFFVFNn?=
 =?utf-8?B?LzNpYjVlYU1lNlFKd1gydXVCM3M4TVkrOVI5TDVqY0RNYndtUXNmM2VVbjMr?=
 =?utf-8?B?bU9GSlpsc0FoMjlmcjJjSlhvUld3Mm9lbFFMRmpYeExzU1E1ZjlqRFg2UUZx?=
 =?utf-8?B?NWtyNnFyMzg1clY4TXpzS2dqcmExT1Ewb01INkpOMTM1dU0wSzlZVy9aRm9J?=
 =?utf-8?B?dWxla3dQK1pOMXBiWmlIb3pLTHNKcmFUNlE3L0ZRZkk5ck9iN0VsOUlva0dp?=
 =?utf-8?B?aWNjYmJFakFpK1YwWjg1ZkVuVXZNSXpmL0VIMm9EODU2SU9FSFBZYzh4RE1F?=
 =?utf-8?B?dEV2MmRSa080c0RwdGRyUjZLQW1NcUxVVDJFZ2F0RzhrQTAzTStUYittMnhm?=
 =?utf-8?B?akhjR1VPNTF3aFljNVY1YTZLU2U3cXJoOFA4QXFqeHNJMEJtalA3L2R4cXdv?=
 =?utf-8?B?OTN5QWF0ZFBPeDJPVXg5MEZjeklRTXdBSTNxUUVyN05iVEUxMzk3Qjd0V09m?=
 =?utf-8?B?NjdlR254R0huTnEySEF1eGVzWk1TcTFXSG14SXdHV21mbkFYRlk5TXNiVUww?=
 =?utf-8?B?SGk1RTdjQWZOWFhETXBMSE91WGppcDVqS2ZWTVc4Sm92cE9MWXp3OVRrZDRS?=
 =?utf-8?B?aTkvQkd0aHNkc1dSRUI3cjE2UWpUditRMUdmU0pUaUZtb0hZMS82MzM0MTVx?=
 =?utf-8?B?VytvY2k2QjBCL29POGRwTGhxRmZQZ2FQbTNyeEp6VWZTU2ZoZ3VwdnJWdExx?=
 =?utf-8?B?ZlY3S2JYTGREL2pZQzBjNW1OcWZKMUVOaDBTamtHTTM1N2piNEJVc25YNFBw?=
 =?utf-8?B?aUJ4S21NcWpOV3FHRFJ1MnIvU0NwM2lOMlp2TVRSRXZPTE5LckIvTGxhTzNp?=
 =?utf-8?B?ZDFXY3ZwY3lXdmZkUTlhWW9TSGVuWHdjSlQ0U0ZXQWRuamdabFVwVzRocy9o?=
 =?utf-8?B?QXQvRHNYM0Z4VWpzaWQ5N1Voalg5cEZsVFRYaVFPMjBmdWtYK0FLRWxLaTJG?=
 =?utf-8?B?NGJrdlQ0ZXkzNWwyMWJaU1dxbkRIV3NjSjJ3SnhCVXZlaTNTRHB6VmgxaDBz?=
 =?utf-8?B?SmNBWk5hbEpWZnV1VlN3TjJ6WVNzSzg3NXV1cEVnNTNkV3ZlU1liNjhROWRq?=
 =?utf-8?Q?JvlVxE3w2gqomvm6HeS9+bwBo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2492158e-7127-48ca-0592-08db1b2461d1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 13:45:27.7855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROzrI/0pVgjpCnbAm998VzHPTuFlX0LLFbbZk8zcB1LHtl3wsjCxaKpcrR6TqpUN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7284
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.03.23 um 14:37 schrieb Simon Ser:
> On Thursday, March 2nd, 2023 at 14:21, Christian König <christian.koenig@amd.com> wrote:
>
>> Am 02.03.23 um 11:14 schrieb Simon Ser:
>>
>>> On Thursday, March 2nd, 2023 at 08:11, Christian König christian.koenig@amd.com wrote:
>>>
>>>> Am 01.03.23 um 23:29 schrieb Simon Ser:
>>>>
>>>>> We don't populate gem_prime_import_sg_table so only DMA-BUFs
>>>>> exported from our own device can be imported. Still, this is useful
>>>>> to user-space.
>>>>> But what happens if one of your BOs is imported into another device?
>>>>> Is there a way to make this fail, always?
>> Well you could return an error from the attach callback if I'm not
>> completely mistaken.
> Hmm, but with GEM helpers this is handled by drm_gem_map_attach(). That
> function calls drm_gem_object_funcs.pin but doesn't pass along the
> dma_buf_attachment so there no way to reject the attach based on the
> other device there…
>
> Would it be unreasonable to add a drm_driver.gem_prime_attach hook? Or
> is there a better way to implement this?

That would be the mid layering we usually try hard to avoid.

Your obj doesn't implement the obj->funcs->get_sg_table() callback 
doesn't it? In this case drm_gem_map_dma_buf() would fail just a little 
bit later anyway.

What you could do is to add a check for the get_sg_table callback a bit 
earlier in drm_gem_map_attach() and if that's not implemented reject the 
attachment.

Regards,
Christian.
