Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF73456C175
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 23:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23BC10EC2B;
	Fri,  8 Jul 2022 21:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FACE10E48D;
 Fri,  8 Jul 2022 21:25:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhpsLRDbQPWXyP+H0kch0DGJtfehxLcXo9ibwei+8FV5jHN8BG8ojJjH5TeF14mqaAojrMJZ4jWRe8RV/73XVUksSLfz6Iek7E/YTlTCgsP0x+35T8vkVppGhF2Q4SjgKB10VSrz+MPv3QouXCcOJV7hRGk1AZukE4iqvSorT4Frlh6Exr+NWUZ6z42UC8sXBATJU8+ILx22xsiikB+zaPrdrogQDYBdWvtr3j24jOYPNE7Y6lIm5BWeGSkLOphogAnN//IbwgkatQVQbp63waQzq4t3SzOyluKJmphduANq7aH3LmSHjmXhKDlp7Qu4mAJse7/XQ57R2P/Hvp/M1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emaEfPZWEmiqAoUqnwHX3Stg0y213FrxPHVhw/7QHDE=;
 b=akeegfF+zwkpUoqXZ1yt5NIKNtRSb/YLogphmnWBjk1HR1mpZXZk9/uVX6u9gjXbkVNc1/RzhDWSWzGtk/FQSZ6vIJYZzbdv8Fk/ta9sZaWLLktnFXIR6/FOQOEG7UcTvYzuATNBUD3gCJHqtEoW64c7kE+B1ac4OdaxRdlUTT8EkUZq+jPp3WsYXNtCnuSwaRg3eddvahSDXGNBMuzlllu4173tu5Maq4OY7NNbeIELAsMGb/CbLg0ntdkgdYqv/adF7sN58ck8cejyQ+uY8x6rSNtNKg3LSLu1HyyEuv5oQ6Fkm/Tee7SUquFVp9GUw2Qsp+t26p/jarJEOdvGQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emaEfPZWEmiqAoUqnwHX3Stg0y213FrxPHVhw/7QHDE=;
 b=e2sdSFiTuNA2WRshK/LWvdegjRnr/fXhzVo7ONusZV7dtqXpsSK/eOtOZk9xcz6xPcdd/+U/sMKkVRAP/trAbyIPqvUyIsrcx1Rt/hoPdYBNlVtBqfXbAcV803Ga2eYF0/NrW5b5OtBMeguLwzU0PZ+uesFgJwqRR94MNs9/SSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS7PR12MB6118.namprd12.prod.outlook.com (2603:10b6:8:9a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.20; Fri, 8 Jul 2022 21:25:13 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b096:31c:bfb7:fa0a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b096:31c:bfb7:fa0a%3]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 21:25:13 +0000
Message-ID: <715fc1ae-7bd3-5b96-175c-e1cc74920739@amd.com>
Date: Fri, 8 Jul 2022 17:25:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 02/15] mm: move page zone helpers into new
 header-specific file
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Alex Sierra <alex.sierra@amd.com>,
 jgg@nvidia.com
References: <20220707190349.9778-1-alex.sierra@amd.com>
 <20220707190349.9778-3-alex.sierra@amd.com>
 <97816c26-d2dd-1102-4a13-fafb0b1a4bc3@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <97816c26-d2dd-1102-4a13-fafb0b1a4bc3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::22) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc5d75ea-947c-4fc0-454f-08da61285857
X-MS-TrafficTypeDiagnostic: DS7PR12MB6118:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xZP3SWWNFjivGXf09UPv3DY32x7u31JQFhfVPJLlyoG6amCUSzPQ8SZ42/3+MVwacoTeYk+7fhs+Jd3KuuVFD2SV3y0xWn01d4d8o6iAYwL+tBUnm2vtje7kY4sbaCBQSCcHvwL9yeiouhc8SJEGSZ51cRD9E5ECMTi8PY8dQq856TAIi9rP3ZrGCe8tJMhieRCI3R1TcYYGSW7DCj5iNiDR++Q8FXyakLesSD228VPB1fDyYU4iGDgSEZChrp/x+TWYPbM2sjY05QpzzZawEe56NkF4HOnwIRFV1gcRzMMBluMfB4DkjTDGglIeKluC2gVdLI1rPoq1TzeA/i8H9YQn9JGxbpfRxvp/q5bx2KNasq14IJawxLNkZjjU8NfCzNS1ScUpAAXZA7qK0Tz5u9ZSJKcdaBRqCQnX85WyIDPvLFIhEoSrvSfovUp2mDS6dyO58wOvB7piJXG6mfJElYU75rjScVRYOc039D4+C8V/embQ72s+YJXhxYjlvrO0VVblmMkc/iiD+ZP8hKkHx33Nb0bjWaSO5FfITV6kHbkCU3JbyD5OL7q8P918bXmULciDyP+KpV1rUoaNWvdWCMpLkTun8Fbv0TECdOrwjfzvuc89aP9QDvcPJPNKkEMiYial3yaPGJ4RclI/9ArK3QC8U1mSLqFvwu9xFVp7N84C0LtKSZ7ltt/uVDEJEAj2szRHJ28+K7GmKm95T8CxN8Fcn87X4AHeNDz/tfNg7WQdNYkAAIL/n0k5CCzZcnnAI2DrhS+Z1WxjZIw619ivXyBI3Mhs1vBMQK4gl6OQmZnoWw//300XeVAVVAIP7JjX1Dy4cAxUErnONu7oYSGyT3dkJa/Q5QCg2TOPA5Uc4Ro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(36916002)(8936002)(4326008)(2906002)(44832011)(316002)(110136005)(6506007)(4744005)(478600001)(66946007)(2616005)(66476007)(6486002)(26005)(5660300002)(86362001)(31696002)(7416002)(8676002)(53546011)(36756003)(6512007)(66556008)(38100700002)(41300700001)(31686004)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0VVeHZBRzRjTFh1TGxGZ0pENkl5WWp2ZSsvVndEd3VRbTRnNVRqNVZDenkv?=
 =?utf-8?B?dTM5WVJCM3VUYWlxVy83aU9UWW5sZGpBaE9qZGRnTVc3Q1pyWk5Fc2wydlRV?=
 =?utf-8?B?ZGoralZ3bmt4Znk3bjZIRk9BUmtRRHQvSWdDZ0s1Z3cvOGhOWlBmTU1JeG9G?=
 =?utf-8?B?Tm9ocmFGcVN1MXBqbHVyMlBLMTVBVlduQ3l1N2hUazBJWXhTVjFrWEpTejJV?=
 =?utf-8?B?V0xtWHlRTVlCMldFRWtEUDJEcm9zRXVBSDVrTlpsTTQrSUxMM0UxckZKZHhr?=
 =?utf-8?B?dTRBL2pjRkF2MStKNDBkODJsWUdjQ0tMVU9jem55NVZDbGk0NHBUL1hob243?=
 =?utf-8?B?T0QxenNQcWlnMXhoL1B4YkdYTmhOaU1wOXlWZjMvajdTdXh1Y05OOHFaSU5q?=
 =?utf-8?B?MWRKWnNlK3RBdXFpcWI2UU5PRmVZZ2pIdkduditSMW5CaWlhUkhoSkMwNEVK?=
 =?utf-8?B?SDhlRWhlSmRDbEoxQ2xxN0lvY3FtekdMN1ByWjdLUEJZQ25TRENZRm14dDNI?=
 =?utf-8?B?SllGSmZKWUlCWWZYYUpxTG5neEE2ajEwaUFTdmpyb3Bpc3pXR1U0WWIvVmVx?=
 =?utf-8?B?MmVkWlNvSVVHYk81by9FTDJOc0lMWnFlUjByTWZTc0hKSzRpM1U1ejJFTHNv?=
 =?utf-8?B?VzB0OHQ4Z0UreWN6NXdwNnpyaFlZTzRqT1B2OXFnQnUvNHBNVzBBT0llWkNJ?=
 =?utf-8?B?cHZITDJqenJCVldhOWE1aXh1bmtGa053UEpBVHhBNTVaMDR0T2ZtcUdJYnJY?=
 =?utf-8?B?Tm0zcmZTS1JGY3lCdDUxTzRiYTFyS0YxUEZESndra0NuS0M2bnRab3ZzdDVM?=
 =?utf-8?B?WTNmS2U0a0hpc04wdytRbzFBc3JTbGpyS2d3aUpTa3lSd0paMDVERFJtZFJn?=
 =?utf-8?B?dFdmNm52WDRyT3dVcGhoQUs1MG9HaGdZZXdkN2tvWi9iaktBSndOTHM0VjNX?=
 =?utf-8?B?ejJSekVQL0kxRitHdEROVWRjckJPOTdwd2pyZ3lNRlc5anV1eEJRMllVS2Jn?=
 =?utf-8?B?NlluRTQzdC9Pd1hzWFJaSGZZM3Ewai9SRm1CU3prSE0rU3A0aVI5NW8rcmxP?=
 =?utf-8?B?MkFRSXozdzFVd2p6dWVOWnkyQnNiQkROWktSWXFDOTU3eGdNMXlzZTd5VUZM?=
 =?utf-8?B?U01OTStVYW9SREJrUlI1N2VVZEV4aS9zSHhBSytOZXExWHVLZEU4VDc5NnBR?=
 =?utf-8?B?MUlMLzEybjJoNFN5bUVOdXpUblFaalVESHRsZGxtRzdpZkxhMUttaXFBbzN4?=
 =?utf-8?B?VEhqcjBhNHRTNHRLRGYweUx6QUR4aWlxT2c3aEdRZUlaRDN5RTR0R3dQQUpo?=
 =?utf-8?B?cm93a21tTktiRlBjemFpTWd1Qk9nZnNWQ3JTOENBeUoycWFjQjJWS3ZJK3VP?=
 =?utf-8?B?ajV0a3AxbXdqVnlWLzErR1orUW1UZkd2aFpUQzVQMWgxSk5Jc1lTTjFqUDRX?=
 =?utf-8?B?M2VWcC9kSFZSazZMdGM2ZWJnT3BUOXd4MFJONU5kU3huWTVoOUZXYzZwSHdZ?=
 =?utf-8?B?Y1dvNVJhQW9UTWFjWVNUejNQbVRwRnZKN09sRmkzTXBsb2l6MEtNc1NHdWFF?=
 =?utf-8?B?TFV2UDdja0tuZS9xcm5ldTlya2x2MVFzbDZCMVExRjlDMWlXTHBpTHltTHdX?=
 =?utf-8?B?eDJWd0IxSmsxS1duM2Y3TFJsZkc3eFRQWVRWL0FIclNXSEhsREsvaFp4eGhU?=
 =?utf-8?B?QVpOeFdqY2xBd2dFb21uWTNHY0JLdHRXNDdlL3o4RUdCdlFOZHhycDFWZk4x?=
 =?utf-8?B?TjNKUkd6N09KM1ZzaEJDOVpYaHpuUFVtZzVwUjZzYTd1WDVEcDZqQmNnNHQ1?=
 =?utf-8?B?eXpUQmRkOGZKeWVOUW54WFV1TkQzR0IyYXBVR3poSDR6SlNhdks1Q2ExNjlD?=
 =?utf-8?B?VXhGVm13SFZEL2sreEFGcWZ0a21NRDRBWDAzSEZkL0wvRFMzaHkzcStIdGVK?=
 =?utf-8?B?TCtadzcwa1JveldWQUxjVXloM21oZzBYalJ1WHpBZDNXMmgxZ3pjc2lHZDRC?=
 =?utf-8?B?RzBqTHp0c2llUXBrUkQzbEFNbTduL3JhNFNDYmxHeEdLSWNxSzVCR2pWTnZo?=
 =?utf-8?B?b3dzQzVLOXVScExOcldhb3FDYzBGSEFCNWpyMGJ3NkZLR2Y1bWswNURJd1A5?=
 =?utf-8?Q?yOsusd6KOY8rQm5HmrgAZTsay?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5d75ea-947c-4fc0-454f-08da61285857
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 21:25:13.6296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDKeUmnOdAj8+dQNYFsjmiarX0dVNBS3gHRe4eD1ReGjibc5l8A9Ea4YroggawfOxqjl5z7P9MAAWdJd0Gi//w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6118
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

On 2022-07-08 07:28, David Hildenbrand wrote:
> On 07.07.22 21:03, Alex Sierra wrote:
>> [WHY]
>> Have a cleaner way to expose all page zone helpers in one header
> What exactly is a "page zone"? Do you mean a buddy zone as in
> include/linux/mmzone.h ?
>
Zone as in ZONE_DEVICE. Maybe we could extend mmzone.h instead of 
creating page_zone.h? That should work as long as it's OK to include 
mmzone.h in memremap.h.

Regards,
   Felix


