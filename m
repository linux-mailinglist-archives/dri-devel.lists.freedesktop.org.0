Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBAD48C7DE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 17:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1BC10E496;
	Wed, 12 Jan 2022 16:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7883F10E436;
 Wed, 12 Jan 2022 16:09:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeFxpFkfwHjS1VmbXkpmtc+739sahv7GPF+QvAlEZmIbZve45/fx708sbLMuYCOK9TG2uvty8LqB1tKpOV9o4JOqTBw2r6+qRp4g9m4rmG+K+L0p6nS7H7dpc62WVSK8Se2m9Uat/VyDZ+nHGIGrsGgrquPHpk11aL62pWW6UmbmXzj+lOuHjkUTkC3lY6E59WkXY/WgYGu98ckIVsrCMmngOMURb3HueQ+zsRRAmRQdHdx1K8PDLKkmFNAmcQ8VrSxcQP8JcPUlACTaf4ecLS1jmjtxagYG966hnq4X3jQm+CWNkGhWxQg0hT8pZbv5SdKi0tXLykYiwhb1OgKm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/88KJ2mfWXteyAzOz5Q5YSrrX57/rhTxkf+DCQrxq48=;
 b=Eymgf3KZYXN4rFshAPwNRkhdP2MX2IOmRarC6/KaP+xpAysmpHBQXF0gJ5QlgdB81ZONuHGYvwbA+fxQWgYsTsFORyu6NVRy4Pc3Qd5VK4Lhvh5lDju/MftmqoA6L8K2CacK3WmDwUQDB5xnXgXdb39wtA19PHeJa1VrZ5P4g/gBM6foDRWiUtm0lcOCq8vI6SFl3Q6nIvqbYKXtbB8NuVlZcpn4hKMaJ5dMosAh2lwRh9haGB1Ztpdab4UozNPX5VYmvKBcgZP6OmAkWv/Vo3YbMQHL52k6/wA62FQPYKafERCd+BFy8r40RrtxWQgNQv35+nPzOA7Sx79Whh4ejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/88KJ2mfWXteyAzOz5Q5YSrrX57/rhTxkf+DCQrxq48=;
 b=4IRGpx0KlRgxi0CQQhP5sOZ4hBf8i6Jthi64zRoWPwRvY56iHl1TEG1Tfad1R7guE/s2DJpeNtoJTiCBdlwiaaSyuawOQ/bdoSRwab5fWVeMBR6kwpUQmHwkAqtUWEtnZRQzxBjkO/gdkN4SareYLaC2JRW48hatUQdx7+xRlKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MWHPR12MB1358.namprd12.prod.outlook.com (2603:10b6:300:d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 16:08:56 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4888.009; Wed, 12 Jan 2022
 16:08:56 +0000
Subject: Re: [PATCH v3 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
To: David Hildenbrand <david@redhat.com>, Alex Sierra <alex.sierra@amd.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
References: <20220110223201.31024-1-alex.sierra@amd.com>
 <8c4df8e4-ef99-c3fd-dcca-759e92739d4c@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <f0d6b6d6-806e-4c6f-cbb7-677ef32dfcad@amd.com>
Date: Wed, 12 Jan 2022 11:08:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <8c4df8e4-ef99-c3fd-dcca-759e92739d4c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::45) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94d7b8f0-6a33-4c37-1de2-08d9d5e5d59c
X-MS-TrafficTypeDiagnostic: MWHPR12MB1358:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1358A174A7ECB5132B247DF992529@MWHPR12MB1358.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hkgxh3MpLxTUyEpjAkrt6Besd1bmzQvP6NRPaWoNcKK8+jGO5xJNRSg5sxgfbmKZ0DD3skMbvsfwTZXsj11eHyN9H9iyvHGxFB60CCx9JDHTsASgS+yRP3j4w+qSqZ9WwOuW3fUrK9akIxba1WQOFDvtUfUu+tdGOapGBrXnea7kquqkQKB1cyNBtetEskHDK1XjD/4lJbnamH7gkjGhI1n2OoeFQiIbOANjMU8aZtgYdf4Y1Xwsgq3RrLMpdDJ71znsrzZ8g3VTD2gUYXk2HNs/WKqcN05ZA+aZFbDZ7BM5iY5qepUY5JtSvS5gHfe5G44hpjK7GsEk5YuM4H8hQ+leRiol9wb1jZK35Xd0D+j4XKMZhxrm1RBZtxAOd3yWgCe7vKrPrPPMZTfzugqjWUovnxr+XmrnFik3Yga/4Pl05CockrhnFwvRPETPWtPO1xq0ot7NVMfOEe8MRPfQuk7eKXxeRy8TxOTkCcqR1XhrnJwzvcdTJYh+WojEUmhs7Iv1iFf9BkL1egNctOg/MKVzUrn59tWHfZzPPCt7Y47VIOslBB0WsRKexbVCv+b1F2Y+RyceMwRlXSrXRO0tF7n9okpLEz4OaR1jkgJ326KoTaHQotf5qdj73YHtGwWHrYTm00REUbD+q7T33RfCLSUtFSI96XvClgyutCYFAns8P1Ic61MnMqpa8G72KJrMC4cB3FwGa/3G0ygJHmFtUGzXJCzhTHsBD+i08W+IX2vZQGJoCFhWXZp1TvWXJdtv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(53546011)(6506007)(2616005)(6512007)(36756003)(186003)(316002)(508600001)(2906002)(26005)(110136005)(7416002)(66556008)(66476007)(66946007)(4326008)(8676002)(8936002)(31696002)(6666004)(6486002)(44832011)(38100700002)(83380400001)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmtTZjRSQVF2T3lCeEh3UDUrSnZUZEtkV1R0Rk40YlRIRTAzcXMxb080NmV5?=
 =?utf-8?B?QXhmSndOd3F3eEpybVBCUXBqU250VXNPZ0RHcHNpNDJ5ZENOU1ZpWTEwcGdo?=
 =?utf-8?B?bWZoKzZOR3ZZOVU0eWdJRE43cEo5YVZWYmduUStKU2VIS250UDRyYWhySnNP?=
 =?utf-8?B?cm1RQyt4MkJjZkJDeUNnc1FuVHhJR2lvN281WHRwb0ZmT0QrMG5ybjRpL2Zs?=
 =?utf-8?B?SHZIN1RESllYQUxwRUlQclJGdlJpN0EwNmV2dEV3Q0h4ek1lRVVicG1XWVIv?=
 =?utf-8?B?MmY4NWJ0SnZPOW9vSVAyNlhsM25PeHRNLy9McXc2M3RDVWdGQVJlb2xrUTM5?=
 =?utf-8?B?bG9PMVNhZVFhTjRFdmVpVGNOajBBTGRmdFNqa1Q5blV5RGViaHQreUZwUkJN?=
 =?utf-8?B?d2ZVQ0Jlb1lsWlZYMjZDNytrcndLeEJzaGJQUFFTaTBDL3ZyS3BXZTlkdlRF?=
 =?utf-8?B?L0swOXpzSE5wbGVQaDFCWURnRGVkRzBVSXBVeDNsV2lCRXdnY2VPSXF3WW5y?=
 =?utf-8?B?Z3FyMm1hV2d4bnVuak14UHh3cVBnMXZmQjRvc2gxT0VRQmhGSVY1dm9JQTAy?=
 =?utf-8?B?THdpQmVGWUFDeFJ1aFR2SUwzcldpTElwU25SbytmYkhDcXRwSDBKR2JaRG1W?=
 =?utf-8?B?bWdlNGlxUENvT0dlZ0M3c1NTVDZVYXMyMy8zT2xBMWlXMTA5MlpkeDdKUHRR?=
 =?utf-8?B?Z1VNRTk2dEpPRG43TXJWQlUwWTRaUm5Tb0k0Rmg0N2FWTmZHYVFRYUhzRnNj?=
 =?utf-8?B?K0tjWkdMZ3pTR0RaYy80ck5LQ3NIaDlPUFVESC92RWV0UjEraVp1cGw4Q1p1?=
 =?utf-8?B?K3F2SE8vZzVobjZ5K2NGMUs3bndDVU55bXc5M252RU92eGR3OHpwOVRsand0?=
 =?utf-8?B?L1gxY0RBMExaeVpvb203Z1RDa1dDYVdmLzlzMkVJaUwvbjB5cGFWNmVqaDlV?=
 =?utf-8?B?Uy9CTjA2ZlhCYUZ0YXNzS0t2bXoxM1RpYzlydWF5dXRNc2FvaTRDZWN6dVc3?=
 =?utf-8?B?dTNodmFuQTFhM3BObFhwTitUbU5xejBCNU5iMG80YlVFYkIxSFRNVjNRUHAz?=
 =?utf-8?B?TVBGSnJaaW9IdFhteG5Cd3MvQlk3RVJPZTg2MUhtd24wa3RteWZyaTBKVVdv?=
 =?utf-8?B?RURwTHRVcGFMWkxDUjY3MWN2QjBEY1BJbjRDMnkvaWYxazR5L0JTbFM0U2lE?=
 =?utf-8?B?eXlESG1ad1dzMkZjV29UdzFrUWJrOXRPNlpndTN3Y3JzS2NzeXJTTWc2cUcx?=
 =?utf-8?B?bWd5cXJjekJTYUR2U0EzcG0vMXNPK08vUnphM3YwVW5lNGdlcVV6d0JRMEx6?=
 =?utf-8?B?dWlkZFpscE15cHpHUDl4Rzh3eDIwWk0xeEx6WEJCam1Ld090b2F4THpzeVRX?=
 =?utf-8?B?OU12VDlHelpnWGFDWGhQanNZVWp6ZEZNeWFkck1BL2t5VFkvbWp4QXlQbTJD?=
 =?utf-8?B?NTRwTEhUcGxGbjNhUFFGSTFVb0x4aDd1U0RiRkU3cWc4N2JYOUdxVnQxYjE0?=
 =?utf-8?B?VnpVNVRjREcwSklIM1FMSHRhSC9WN1N2TU9USkJBRWZnMjdJdUZlSEpOQmIv?=
 =?utf-8?B?R0xrWnJKUnYxL1FkbVUyMTBIeHFrb3NWU0lDTFE4OFYzOUI0c0NJaWU4b1F6?=
 =?utf-8?B?ZzFjc21vQmNNNmdzR203NGtWUnFTemk5WG1ocFBTVmJucG42TGl0alRVYVRO?=
 =?utf-8?B?K1ZRTjJ3Q0RIcWVpT21vUmZJeHc5YjQ5Tys5ZTlrR01rRTNLTDVIOVlxTVFm?=
 =?utf-8?B?Q2hUUlVxQUhCN2R0N2lSNStCem9NVDNBMHlBdUt1ckkzSHF5Mm1nZ1BMUW50?=
 =?utf-8?B?QmpYS0ZlcFM0cVpJS1MyZUF0VlhGYVNwUk4zd0FZM2FoT1FBdE95Q1kzdnl6?=
 =?utf-8?B?bnNsc3VpZVQ4VWZ5UVZ5OXcwUDRYb3BkYmgrQVN0ZUxWTXQ0SzdrT0FtazVS?=
 =?utf-8?B?UmVDaENjR21pMHBwNzk4MXk4N1d6RFA3U2VSMHkwcSt4WVhjcU16eTVlelpY?=
 =?utf-8?B?Mm1TRjlxajhyS1lYaUNaSHhPSTRIa0NGOG1iT0VUN2VjQzZ3c3VWMmszb05T?=
 =?utf-8?B?ZStkV1o0dXZJelRHSlRwbHRuTlBlVmNhSVgyMEJsV1BXNG9aQ2l3OEhON0I1?=
 =?utf-8?B?QXVxQVNPWGhVUmVuc3h2d0tFKzVFSGFvZFBtSThyQXNGQWgxbnBWMUVXZHYy?=
 =?utf-8?Q?fTjBUavFCJtApZCDmUyJKD8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d7b8f0-6a33-4c37-1de2-08d9d5e5d59c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 16:08:55.8903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ea05cqgcNjXQ9Y5v/u+o46a29O+fyz520roJmRUykvKvuwn/LdkI80RfGP3TI7mRakCanqcJeofNPwQk+mpWUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1358
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-01-12 um 6:16 a.m. schrieb David Hildenbrand:
> On 10.01.22 23:31, Alex Sierra wrote:
>> This patch series introduces MEMORY_DEVICE_COHERENT, a type of memory
>> owned by a device that can be mapped into CPU page tables like
>> MEMORY_DEVICE_GENERIC and can also be migrated like
>> MEMORY_DEVICE_PRIVATE.
>>
>> Christoph, the suggestion to incorporate Ralph Campbell’s refcount
>> cleanup patch into our hardware page migration patchset originally came
>> from you, but it proved impractical to do things in that order because
>> the refcount cleanup introduced a bug with wide ranging structural
>> implications. Instead, we amended Ralph’s patch so that it could be
>> applied after merging the migration work. As we saw from the recent
>> discussion, merging the refcount work is going to take some time and
>> cooperation between multiple development groups, while the migration
>> work is ready now and is needed now. So we propose to merge this
>> patchset first and continue to work with Ralph and others to merge the
>> refcount cleanup separately, when it is ready.
>>
>> This patch series is mostly self-contained except for a few places where
>> it needs to update other subsystems to handle the new memory type.
>> System stability and performance are not affected according to our
>> ongoing testing, including xfstests.
>>
>> How it works: The system BIOS advertises the GPU device memory
>> (aka VRAM) as SPM (special purpose memory) in the UEFI system address
>> map.
>>
>> The amdgpu driver registers the memory with devmap as
>> MEMORY_DEVICE_COHERENT using devm_memremap_pages. The initial user for
>> this hardware page migration capability is the Frontier supercomputer
>> project. This functionality is not AMD-specific. We expect other GPU
>> vendors to find this functionality useful, and possibly other hardware
>> types in the future.
>>
>> Our test nodes in the lab are similar to the Frontier configuration,
>> with .5 TB of system memory plus 256 GB of device memory split across
>> 4 GPUs, all in a single coherent address space. Page migration is
>> expected to improve application efficiency significantly. We will
>> report empirical results as they become available.
> Hi,
>
> might be a dumb question because I'm not too familiar with
> MEMORY_DEVICE_COHERENT, but who's in charge of migrating *to* that
> memory? Or how does a process ever get a grab on such pages?

Device memory management and migration to device memory work the same as
MEMORY_DEVICE_PRIVATE. The device driver is in charge of managing the
memory and migrating data to it in response to application requests
(e.g. hipMemPrefetchAsync) or device page faults.

The nice thing about MEMORY_DEVICE_COHERENT is, that the CPU, or a 3rd
party device (e.g. a NIC) can access the memory without migrations
disrupting execution of high performance application code on the GPU.


>
> And where does migration come into play? I assume migration is only
> required to migrate off of that device memory to ordinary system RAM
> when required because the device memory has to be freed up, correct?

That's one case. For example memory pressure can force the GPU driver to
evict some device-coherent memory back to system memory. Also,
applications can request a migration to system memory explicitly (again
with something like hipMemPrefetchAsync).

Regards,
  Felix


>
> (a high level description on how this is exploited from users space
> would be great)
>
