Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C7E387C78
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 17:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE426E8A6;
	Tue, 18 May 2021 15:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20226E8A6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 15:29:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrZlcviMOukKJQkSgVoulr/f0u7CyoTHvFr1nI+Mgx7iKMUJavSVEXr2OJYTEa0HLcdTriKf+evxHo04x26dR3xvJR+PL9H3La3YfE8Hfs/C6esG070uELUkLSd20Q30DUuDvx+7NC6AX0p+fuXiYYbhX1/O0W8Uci8vTaksK/FCvNGkBgSjFYgcis2Bqr52ii93gfF63jYTSfyKjOUGYk5xBjvO/LNnoHe16Fyg1Rce+G5YONUcTAAKV+4IO8Ngf1KwToYWv3TfiEUFodT4alZlZG1Lv/2XqkDgfmolfam4L9ZgHi8IuwWxlNbtPBcwofZbX4RVqW9hoB/hjFw57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMAGFQlAnQ3Lo7beDeJC3bAwagHo1ZWWVCnmeM/vkUQ=;
 b=SQkBAEHILfPkEJCBHE2KAXYeKnYX9X0j8cAFaS2g1+tJl6g7ELC1/f4/wobSGvpZRunZaLGTl+W9Hq8HL37a6/HbuN4ZbVJVbGNP2Xor0ZxECeBwKhfdYcnsiRB80zPgiC3BVMSPWHqkWHpGUDU4q/f3QMrw7DkLsJ/99RcrKj1oCDoBr3JI3sax+pIn1sQ0d+cPk1PVOn4g8oJW/cdCnOG/bJdtUke6LIr12/wUHwZwYoYir43FiWIAsdd1nnL870AjusYyZJm7/JcfwT/d7zJQ+G6KUiHD4w1MLg78IEQ760XGPTNkXH9N3MR35ikD0jmhPkCo2zxdc0W0oWxiRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMAGFQlAnQ3Lo7beDeJC3bAwagHo1ZWWVCnmeM/vkUQ=;
 b=zrqLSEBsaL5ExICZZEtp2z2bCBek0DrNy/PUNiKRZq4iyHlTDgA5QUP9pToVZ0FUIkaKuVITyC9rM3Gte793UEl/cLdioiR40+4IWaPXX+6yRKKVU6L/o5XeIatIhd6W/LgGrqa7lHyDUxqtXDPRnwBk6nxe7flT5w/82hQiUzM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4868.namprd12.prod.outlook.com (2603:10b6:208:1c4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 15:29:23 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 15:29:23 +0000
Subject: Re: [PATCH v2 13/15] drm/ttm: Add BO and offset arguments for
 vm_access and vm_fault ttm handlers.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210518145543.1042429-1-thomas.hellstrom@linux.intel.com>
 <9e465ab2-4272-4a41-2ebf-4b34d4724f77@amd.com>
 <0beb46d3-96c8-dcfd-6540-e23ff7207888@linux.intel.com>
 <151faa7d-c4c0-4f8b-f127-9e82a5432774@amd.com>
 <07c9239c-1d72-26d8-4fe3-378bf826bae2@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <01128dfc-fb5f-6247-9feb-9cd05586d790@amd.com>
Date: Tue, 18 May 2021 17:29:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <07c9239c-1d72-26d8-4fe3-378bf826bae2@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3b27:1830:9671:4cc9]
X-ClientProxiedBy: AM8P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3b27:1830:9671:4cc9]
 (2a02:908:1252:fb60:3b27:1830:9671:4cc9) by
 AM8P189CA0017.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.32 via Frontend Transport; Tue, 18 May 2021 15:29:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4f670c4-22a5-4f8b-57fa-08d91a11b679
X-MS-TrafficTypeDiagnostic: BL0PR12MB4868:
X-Microsoft-Antispam-PRVS: <BL0PR12MB486830EB7F3460F3E4F74E4D832C9@BL0PR12MB4868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Ah85yXaBvYwEnAyu7bdUeHYBQ6s22NSKlQXrIc2kdGHA4k4K43U+zu94ETKr2y9vbYhuq1DW6o5fSEzH7GaceaF0PWKA48euWY4YdyoR+axTkTyuDHG1P4pHL8uZ3mDY84Q3MbOTDmm/Jdz3oKL8n+94NTmSbrQEPJR6ZyaiaANx+uqydj9z11JY90Obm6wA4btLxjMgzRWKmYtK8CvU3OTgpaOK8lJGrd6onWETIkLxW+dXaWkc+RTvM04ymnthN4o05o46cTATbe/tLjcspvLmK16kxUCRZZzu7SCrxQZxt1kswXrhNoH0F4YN2cd4cLo1JdHl1aLg39noOtyREBHNHNcqEbjFotUSUuJIpEEgKsowndLbCh7pypmY915paTmrmcKLbXxWvgts0Ajwuf3BE6EWGhY2ElYYAfM4cgI63gz6cpK7h3ZFm42I2KKafpQI0r5adhcZ09C71Pj5XaJDCmFZDFVYrywUOcI5jZNGqrEhMy2PFm6OWDNjTrb4k+HCBRiuUdTku/PTd5RUcIOYc1lG9IWdI4NE20c2OfEo+2i3KrFSxioYC3qWULza4BeLTDS3uBQAunLJ3zl1Yz7goB1wxaAeLWpgLSXb+suLRSlD4Mg7W8/k12qm9/q9Urp9vZe37JFplNCprnZZTNPUbaYToFzhUbFSjp5jsaTF82kG1dpRZCKnmRVxH5S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(8676002)(52116002)(53546011)(83380400001)(6486002)(86362001)(6666004)(31696002)(66556008)(478600001)(38100700002)(5660300002)(54906003)(2616005)(2906002)(31686004)(16526019)(36756003)(316002)(8936002)(186003)(66476007)(6916009)(66946007)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WGs0Z3dKQ0w0Z1J3ekdqOE0ycVBXWUNGRk5UTlhaWHZjWTlTU0NuektScHpS?=
 =?utf-8?B?aUtSTVF5cjlUZWVUY2ZBcjdRbG5oQ3RhbjVIT0JpYXYybEFkUmpkQ1dPQm9k?=
 =?utf-8?B?emR2d3N0NENKU0Y2N2k4eVprYUZRSzVLU2RJczFxdVBBNFY2SjlQa2Ruam9y?=
 =?utf-8?B?V3EzbkJKNWMzL3k1cWJ6S1FvNFFrM0RwOG1zbnZ0cGVCRjZ6U3JJUVpRcU1n?=
 =?utf-8?B?WGpBNWpmTkxvODFpZmJsc05iUXhTYndSWHliNXVpQkxVVjZZaUs2M2R4c1NK?=
 =?utf-8?B?S3daZElFOTJQeThsenNySkZCVXB2UERlZEV1WVkyV1hxKy9ndVBkWDl4VFQ2?=
 =?utf-8?B?WDNsK0lHWDJYSFFtbUhuelBsS0cyV1ZNdGNGTC9aTDB5S2RTcldLRXNtSVZI?=
 =?utf-8?B?cnJDTnZINHl0Q1M1djdRVER4dG82SUxub2kzaEp6QzRwRFhId1VDTGZYTEdD?=
 =?utf-8?B?TFNqWXpVZDdNUFoxUFpMdXoxN2FWY0pHdWNTZDE5WGgxNHhUeHFkb1A3aWFN?=
 =?utf-8?B?eG5mUU1jN094NnZ0RUFhcUpZbW5BVkZMWGVhL2tCZVMrZHpBcEVCeVlTUGYz?=
 =?utf-8?B?cHpUbVh2SGQrRHhZTDFtdDdZTjhYVGtWaGlWazVyYlhsMEpFeFpObVJrY3FI?=
 =?utf-8?B?dWNjY0lKMXZzQUlIMGhNN2wvVlFxM0trS2JuNUNzcTJWQStVUlU0VUwrYWJs?=
 =?utf-8?B?MzEvVitKL0FtemgrL1VTYXQ5dXV3Y2ZrUzNwOXM5MkQ0ZUVEM1J0OWR6WXlm?=
 =?utf-8?B?dDVvWVh6MUJqRk5UMCtROXBha2wxYU9BVytnelhjZXlKcHZiaytZZTBJRWR3?=
 =?utf-8?B?alN6K2RZYkdsM2Ixdi9ENVBNRytNWWR1emVwV3l2dnVwczQxNEZmTGxiQnlD?=
 =?utf-8?B?azMxc0VrZE5qdTduN1JRMDN5SGdKRnNRZTlNS0V5UGczT0JCb2lmZmlKMlgw?=
 =?utf-8?B?cWhjR1MzSnVxVkdTTUFlbGh4TGNvUWpJVXdydXVhb09mbllpa0NoNmZJZ3hl?=
 =?utf-8?B?Q2ppcUwraE1TUzdJKzZGeXFyMy9SajR4TWhRNXZHQSt3SWhtNHBScjlQN0ZI?=
 =?utf-8?B?QzU4blVvTm00TW10d2RlQjFFUjRPclhnZWxJMW1xVG9qRnZHcTdZekNSN1lP?=
 =?utf-8?B?RjRJb2M5bWNwcE9EOUJ5OTY0dVhUUGJZV2sveGZVQ0NUZXhzcTljY2h1cnJS?=
 =?utf-8?B?RXVuMmRhTXNYZGpxTXFvM08xeWVKUkEzMTQvbklBUEwrdTZkUDYxdW1ucnJo?=
 =?utf-8?B?YVppMlJxcGhXRE50dDliSWs5MHk3M1NkTzRjWlVKWVkzMmpiejF4UkVlOGQv?=
 =?utf-8?B?aTZSZjNBSXJqdkJLbW1xc1Q3ZitzRUkxemVSQm1wc0VMNFFJUnBjb25Lc0Nv?=
 =?utf-8?B?MU8yUS9mcm02d3RpNVhBTWVRQmtMdDlucGJTcWN2d2Y0VCtYMWxodTlmUWJM?=
 =?utf-8?B?VTNIODhvYU9xZTNZRkc4bm1wTDk1djI0d2dqSFl1QXdmM3dsS2FvK1FiYk9a?=
 =?utf-8?B?WkZGUGhsaVZsK2NGYWczZk9aRVRtQWh5YnQvcStueEEycDFEMlF3UmdwQnJi?=
 =?utf-8?B?Q2hJdHk1Z28yQ1RyWkxUeWgxVnVUam0zZVBVRE5ObzVDQTNHeW14UGFBMzE3?=
 =?utf-8?B?MzV3aVNMRlAvaEtnTDVadVljVjJBTGdYd2pBeDloSnhmcEphNXh4ZFFFZy9D?=
 =?utf-8?B?T055TngxaTJkRFh1TFEvdTZDSndMb1JrRlR0bXhjaG5lYTlQS1hBWG92U2lM?=
 =?utf-8?B?Y3Q2M29sQTM5WjIzcHpoNnFXVFBlRkt2Y2hCellsTUhCNmkra004ZzJtOUc4?=
 =?utf-8?B?blFaMVZzTXIwYU1TelFDVmdjVUNhNzlMRlUxaDFOaUsyMzlUUmpzR1hBTzdQ?=
 =?utf-8?Q?j8KyOjImMkfO7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f670c4-22a5-4f8b-57fa-08d91a11b679
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 15:29:22.8947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DQ9ZyoTkqkt+9UwRdCFDyeLpfIV/I5HcsyFS09+Xpb3vKPMPmAkPUj5AwjXV3SC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4868
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 18.05.21 um 17:25 schrieb Thomas Hellström:
>
> On 5/18/21 5:17 PM, Christian König wrote:
>>
>>
>> Am 18.05.21 um 17:11 schrieb Thomas Hellström:
>>>
>>> On 5/18/21 5:07 PM, Christian König wrote:
>>>> Am 18.05.21 um 16:55 schrieb Thomas Hellström:
>>>>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>
>>>>> This allows other drivers that may not setup the vma in the same way
>>>>> to use the ttm bo helpers.
>>>>
>>>> Uff can you please explain why exactly you need that?
>>>>
>>>> Providing the BO is not much of a problem, but having the BO at 
>>>> different VMA offsets is really a no-go with TTM.
>>>>
>>>> Christian.
>>>
>>> The current i915 uapi is using different offsets for different 
>>> caching :/. We're currently working around that by using 
>>> ttm_bo_type_kernel (no TTM vma offset at all) and i915's offset.
>>
>> Can you instead adjust the offset in the mmap callback like we do for 
>> dma-buf?
> Will have to take a look.
>>
>> That's really a no-go what you describe here because it will mess up 
>> reverse mapping lockup for buffer movement.
>
> You mean the unmap_mapping_range() stuff? That's not a problem since 
> it's a NOP for kernel ttm buffers, and the i915 move() / swap_notify() 
> takes care of killing the ptes.

That design is a certain NAK from my side for upstreaming this.

PTE handling is the domain of TTM, drivers should never mess with that 
directly.

Christian.

>
> While we're in the process of killing that offset flexibility for 
> discrete, we can't do so for older hardware unfortunately.
>
> /Thomas
>
>
>>
>> Christian.
>
>
>
>>
>>>
>>> /Thomas
>>>
>>

