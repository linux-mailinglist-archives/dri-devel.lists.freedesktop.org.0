Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229724D6739
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 18:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F10910E432;
	Fri, 11 Mar 2022 17:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EDF10E3C7;
 Fri, 11 Mar 2022 17:08:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Krjo1u93VsvB+R969qlXiaRudTEkA1azCe0wxme0R6hzMyiskam2Qyng4MD8uFDFdjzGjqZ/ovpckQnqiJXpqtaMAuzUdRkrfJlfgklHHwkCUiRmjThHyTfswv7/ChzyIf5/pr+JXOo8XxFwKW7QpMgc7FcJQgAzx6MnwKf0HsfU7by5HV78sCe1JuNcdKaoRI9qQMjnp7lzD+Tax9F9uIR/LYdnr1MHinBJxqesnk45BTN9Jx5r5uzRfU5dgykR/JmQq1nR4a7qLUU3LBrdHf527YzboRPR0rSkthDGYrl74ob/ObCEe5ogZNvQZy7Eyh7r33E4K277ghL4jPm2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Jwf/OurY7zGOlrczU0ZeK15V+DAOxMUaVacFs7fXGs=;
 b=Kqv6JRrWJPpkdTLOd3+FKqLV91AzdKdPl0UIBkGefWPllzcQ+zMaQtV57wfpj2lEdmRK8reguzafE8DzKus8pghix/HAEemNKwRyCPQThydzqWz5ukCVrP1uQG6F9d0JAeLvsYVA8sPnZWiAaXmQa0Pml5vslOEoyWugN/PNiUhUTKEohGo8NHuDd6C8fkhoV/v9PZ/pb24uescTPuF8GtRdDWvt4yzNFlPgRfzqzFb9V+t5xYFBYrO0jimZSciz7ZZZmvsyFY10L0dPjgC+fRYLFoceap3Oc0x1fRI7EbmoefZEpL1DGYjj82kN1EMjW0ZX2M8c49qajIDrUyhhaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Jwf/OurY7zGOlrczU0ZeK15V+DAOxMUaVacFs7fXGs=;
 b=HDY4LsmY/BEsM7rnG+Ok6LiYZ3xFKxDJD42CN7MV3CQH6H5b5NDa8JXsClVaNKEOABB2uRDO1Gq16n4yIRbU6hBy5bIXl2gHyoHxi7mhKFXWg1O+WQQDozKXHiCg0wv/gRXlaqR03eJfrKFYObeiwY2YhMn97nL9wCCzpfg5p9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5082.namprd12.prod.outlook.com (2603:10b6:408:133::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 11 Mar
 2022 17:08:08 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5%3]) with mapi id 15.20.5061.024; Fri, 11 Mar 2022
 17:08:08 +0000
Message-ID: <1747447c-202d-9195-9d44-57f299be48c4@amd.com>
Date: Fri, 11 Mar 2022 12:08:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/3] mm: split vm_normal_pages for LRU and non-LRU
 handling
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Alex Sierra <alex.sierra@amd.com>,
 jgg@nvidia.com
References: <20220310172633.9151-1-alex.sierra@amd.com>
 <20220310172633.9151-2-alex.sierra@amd.com>
 <07401a0a-6878-6af2-f663-9f0c3c1d88e5@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <07401a0a-6878-6af2-f663-9f0c3c1d88e5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:610:e7::21) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f18a97a-9e6b-4e2f-7f88-08da0381b6e9
X-MS-TrafficTypeDiagnostic: BN9PR12MB5082:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB508261B2D7F29E8AF6F87F4D920C9@BN9PR12MB5082.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Ec+5WBjXX0iO6eEZNpi4Khq9NBxarEoDTULYflwJQJAyXG98deWH7Xo0QjIqI8bCTMQssXreOg0t247bOJVGDI8UueTX4RC1FEGh5bFLsgrZ0XLDX7eZ2XvkTiFSkXnN4YdhQi+i5HLNVfqpX2eh7hu7SNKnqf8CZxzU0CPnzsA+KUEo27B848jUe2EurA3lLdHLDLcwsw9BBR4Z+yDOYYUyLeJoRwcZGbbWof96WUVGKBINWVkw1u4M1GqEJEZA2gGTquj+yRivWYhUW0k+w/sP2cFrYszrV3vkuNUQsfmpmgn3z7N0dKBrude1Wx7YljipNe/xIH4rLiG9FFtsFY346w+9wkc8oe+yv2nzMcSRyUApm5EnEXOdOCQBnLgv4OqcVhV2xOaN94NhtI4zAmmnPwj/s9Zin/7TwkVXnXDs9ZvZB5h1rTeXyHxpj4XnmOAW7rbm9qr+gsgapn6O2nY2yfIu4K0DS6gpQ7gHtgsgvASyQuHEkNW32/yAXexYWFajNpayJcpJCJREA7n0uaYKcdD/7/axfTQqY493gEVMAClmts4Nwmyf6eIMlI5RJck/VqRaMAlz3nlUQl1a8Hi0Pel9G2QiwecX4bWfLGXykubfFZWtzib9Shtx93nmJXjLapXrAjejWitKOjAfL0zDqDcXR9Rc1TqoTZaEBj2RvUWMTCD/GURoyG8w7MIvaCq85gm2tyFRbuSgEIWyx9I4yOSWl37JSiy+hcSjZCxvomiXgwysE0nFNYcPOij
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(8676002)(38100700002)(66476007)(2906002)(66556008)(53546011)(4326008)(110136005)(8936002)(7416002)(5660300002)(44832011)(86362001)(508600001)(316002)(31696002)(6486002)(6506007)(36916002)(186003)(26005)(36756003)(31686004)(6512007)(6666004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWsxMXRLeXZHQVAxbEZnRjlRNU5PWksxWVE5aUFiV1dHWnhFVUh0TnlYakUz?=
 =?utf-8?B?ekZka3VDYXFyaVBtYjJkb00vUEFwNUVFUjBuZzBwenNzM1hBNFRETVFkU28z?=
 =?utf-8?B?OVRCYWxZVmdQNkV3ZU1nMStsVERTbU40dTYvOVZSNjF6RkYyN3I1Tmo1dDhk?=
 =?utf-8?B?UkVZZzBVZ2FnV3ZmdW41aGZ1OFhjbW9SZFFSak9jOCtiZGkrY0lFTFo3Lzky?=
 =?utf-8?B?L0ZxNWo5c1lQUnZETCs0MjMrR3h4bm5VSHl5UmZhZUJvdWptVTRrTXEwKzRa?=
 =?utf-8?B?dmZENHlTVTA4Rk53ZW5LWDV0OFNFUVhpQkJxNTFOWmt1cXZWWXZ3dlNpZTVL?=
 =?utf-8?B?M3RJL1VyK1Jnd2RjZTJxeFY1SGVHSTJ1QnJUVmVEWmJvTU5qZWZPTlp5endi?=
 =?utf-8?B?N1lFUU1IYjAvUXVzSVhwV1VRTEE0dDJCaUVxbDhCQThKS3lFVkkwZWRTTEVl?=
 =?utf-8?B?L285NzVDWHRIRU9ZSStqU095dG1zL01KbE0vcDVjbE9NY0hnZzNXMVMyUlFt?=
 =?utf-8?B?K0N3dGIyUWNNSFJFalpyekpTN0JHVGNFNVhTQ2s1ZGk3bDFkK2F6MmpNalFY?=
 =?utf-8?B?UG96NkV2ZGtCOW11ZENqRzltNC9uTGF3aWFMZGtYZkR5WGFuZkJlN2prUzVY?=
 =?utf-8?B?cVZnMXZqaGljQXVETExZc3lzZ05IOEc5OUtjcVB2cUJpNUtqRWlFM3o5Y3Yz?=
 =?utf-8?B?VFNLeVdIYXlhRkw0ZHJETU9UN3lBa2xMMHJuOWZSdTlkRmdtV2ZsRG9wVGJI?=
 =?utf-8?B?bkR3NG10bXJQZTl2dHhTYnFRWVJXOVBJSFJFekljTzY3MlJENXlaUzZ6dVRD?=
 =?utf-8?B?SmtsaEtmR3NGdzJkcHBQcW9yV1VHWjZ3MVE5N0Qrc2pMY0k3MUMvTjAxVll3?=
 =?utf-8?B?VnRRMnV1WWJjTnFkVWN6RWlqa2MxSmxXSVZXMktYaW04eGJBckZqWGhyZnNT?=
 =?utf-8?B?RUJyaGkyeWRDaUFDbnkrNHRReXlWbUhUM0kzVjk4M1NBdGJIQkFQR3hZVkty?=
 =?utf-8?B?dWltTXZTakRVR1A3YlNGeWVseEl1L1JPaE14aGhvMEEwRWtKZmJiaURoeHha?=
 =?utf-8?B?WW5PaklYNnFwN0gwRVA4YWxZM1M3RzA5R0l2RVdQQ2R6VHBNTTJwalQ5R2Qz?=
 =?utf-8?B?OERUODdlSERZRFhNdzJaUEdZVy9xMUtKTUY4UHFSS2NJMWtEeGJZL3JST2F6?=
 =?utf-8?B?THJQOUVld0VNRjlkcGpueWRWMVdlazN4NXUrL1A2Tmp4YzNIYkhoR0dZM1Vk?=
 =?utf-8?B?RnhrS1VZTFBJandJdzVKbG9aWXU3YWdtblpBME9nZlNVSzF0R3NyMHBRSGQ0?=
 =?utf-8?B?YVdENmF2SUZObC9lZG93b3dreExjRndJOUorWGxoZEE0VlBmaEZ1SHMxYUtI?=
 =?utf-8?B?bDN2djFmNm5qSUpneXNqQVQwTHhLSi9YaTNLYU52aXBFOFE5RWlJWG5UdEhY?=
 =?utf-8?B?S3EzSmF3ZlNRTlBQSlZXT2l3UDAxS251V2ZzS3VxTXJiaDBxd2ZJK0daSE0w?=
 =?utf-8?B?eXkyeldmdzA0RlZIdjd4SHFvSG14Wi9JUkJmeWNXdmpHL0JGUHlBYkRhRDFz?=
 =?utf-8?B?eDVHOERVSHNDbjExUmE1bVlnSkVCTTRiSUhxd0Q0bCtJNTN3ZWVCVmNLRytL?=
 =?utf-8?B?RjY1ZGp4cDhjSEFyN0NjelA0dm5xK0tBVEFEMktjamw2WDlVRGQ4Skh6MW5P?=
 =?utf-8?B?SnY4QkhRRTFlejkxUkNtaFlFdUVzdVVsdGVTcU1qS0pYejFYWmhSTFJYaHZB?=
 =?utf-8?B?Y3oxdnpRTVk4bGkwWlZJU200ZSt4cllVZnRvUlhLZW1VNCszbjFwUjdZeXZ4?=
 =?utf-8?B?c25udUcvazhoeUtqVVYvcGlNZGl4QnJlcjFpckZTRFBLY290a2ZQYUhUV29Q?=
 =?utf-8?B?VWd3TVFHN0hTSTlEbUZ0TUZaMksyMTlsTnoyNm9QVTl4WVN4UklZcU5kZVdC?=
 =?utf-8?B?RXA2TDNRNjFubU1PUjdWaU9NOHE3M3FmYXlZY2JLTGlpeTJxRHdnZjdTeHcx?=
 =?utf-8?B?VkRHYzQ4OGpkanNaNGFPR2w5bzhZbEZGemRWQXZnd01jRVd4SnNxNm1Mek5R?=
 =?utf-8?B?cWFqeXlwSG1Xa2I4alJIYWFLcFpjbU9oaUpvTVhwSGNLUVZZZmFLVmQ4a0k3?=
 =?utf-8?B?QUJvTHJaTGZiRHNwSXlxOUVRMDJCTm13Y1RLeVF3djVSUDFlMS9ZcVYxRWJ3?=
 =?utf-8?Q?sJcHsxWcTKC4jsBeWNMcnzo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f18a97a-9e6b-4e2f-7f88-08da0381b6e9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 17:08:08.3422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I632W1stFcQAOzdfTAgrYz8frGjYHvaPp4PTPbqDCq2WRlgsPtrzXLW06cL0WUsWhr7mUKIEcucwdgyvtMcADw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5082
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
Cc: rcampbell@nvidia.com, willy@infradead.org, apopple@nvidia.com,
 dri-devel@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-11 04:16, David Hildenbrand wrote:
> On 10.03.22 18:26, Alex Sierra wrote:
>> DEVICE_COHERENT pages introduce a subtle distinction in the way
>> "normal" pages can be used by various callers throughout the kernel.
>> They behave like normal pages for purposes of mapping in CPU page
>> tables, and for COW. But they do not support LRU lists, NUMA
>> migration or THP. Therefore we split vm_normal_page into two
>> functions vm_normal_any_page and vm_normal_lru_page. The latter will
>> only return pages that can be put on an LRU list and that support
>> NUMA migration, KSM and THP.
>>
>> We also introduced a FOLL_LRU flag that adds the same behaviour to
>> follow_page and related APIs, to allow callers to specify that they
>> expect to put pages on an LRU list.
>>
> I still don't see the need for s/vm_normal_page/vm_normal_any_page/. And
> as this patch is dominated by that change, I'd suggest (again) to just
> drop it as I don't see any value of that renaming. No specifier implies any.

OK. If nobody objects, we can adopts that naming convention.


>
> The general idea of this change LGTM.
>
>
> I wonder how this interacts with the actual DEVICE_COHERENT coherent
> series. Is this a preparation? Should it be part of the DEVICE_COHERENT
> series?

Yes, it should be part of that series. Alex developed it on top of the 
series for now. But I think eventually it would need to be spliced into it.

Patch1 would need to go somewhere before the other DEVICE_COHERENT 
patches (with minor modifications). Patch 2 could be squashed into 
"tools: add hmm gup test for long term pinned device pages" or go next 
to it. Patch 3 doesn't have a direct dependency on device-coherent 
pages. It only mentions them in comments.


>
> IOW, should this patch start with
>
> "With DEVICE_COHERENT, we'll soon have vm_normal_pages() return
> device-managed anonymous pages that are not LRU pages. Although they
> behave like normal pages for purposes of mapping in CPU page, and for
> COW, they do not support LRU lists, NUMA migration or THP. [...]"

Yes, that makes sense.

Regards,
   Felix


>
> But then, I'm confused by patch 2 and 3, because it feels more like we'd
> already have DEVICE_COHERENT then ("hmm_is_coherent_type").
>
>
