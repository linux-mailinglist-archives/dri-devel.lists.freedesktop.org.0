Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E0B3B324E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 17:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F4A6EB3E;
	Thu, 24 Jun 2021 15:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C7A6EB3E;
 Thu, 24 Jun 2021 15:08:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyktjPBT72lremxsNiqS3ExHr5VXQqaI7D/7f23gdAKetncgh06unOem80q5QlMHHzoPeSr5F8FTRlukjBOX8IzrtmwhYPiNltvHaRRRC07zCwSaKxSFDX/1xeZcf2vz+A0gXkUDzIpdMUGfPXuP3RMWKoG0K8+rPAw/AozIGv0XZsYYVEdtuvNcoKGzx9l7oryk76MdMbUQdgurvoRYPjfCNpKiYBP+dvEzfHrraU3Ytb5/F28GRyoMWMvsTk1HL3vZ8lQS6hz4iSI9SPVsrlcaJaUKS70nU4luA2JI82eO8S7eolwW5+3s/yEUIeVb9MrQx/UT8RDDD6emkkFbpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZt/nBQgcyQ5AgLh3X1PAOYsHrk0HEACDzNkFYLHaaM=;
 b=bNZrBR+xss6XwZkVja6nRLt9T62tB/vSuAKh5LU8EjZ/agTYIukLtWHJFbWK13q5h5wTJrGyOzvT+UAG/ge+MvedzlhbEEgNt5sGbu2nPEHrmc3beo+SNnD2Jvq98CeuipB3roqrvKUYhfNPmDvDAg/I82Gsj8TkMhnWYEcgKRVbr+R9LKbCKjqnJVa7pZBeLxWg9u+kvMQLESPyeXY/CaMvLwV83vd1sfRRgX0LdBCGtwOoit6P/CWx2dJFCTtS/aEX3yYqhsc4Ltebsz9WBtrsRpKg52XbNVEhSjbM2zyLbr8pPVa4WQmgeqeGvfYjuNgtsISoLgKxY/TYFOfqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZt/nBQgcyQ5AgLh3X1PAOYsHrk0HEACDzNkFYLHaaM=;
 b=ofvjeGlD4Xr8VBUm9OVmsq1AsW3qUViNXKBizgY0rnKUVtYZh3NE4tYHGw7EmEFiQM62Bj8daDdAVDwgeSKGk5nhMHVw3tClkXkUXiRlMG567XIwjBirRzvej9rs8ocrcQS8160EkV3w6jVvfJ32mbtUS4G+uKa2fBgZYg5iMHY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5100.namprd12.prod.outlook.com (2603:10b6:408:119::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 15:08:33 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 15:08:33 +0000
Subject: Re: [PATCH v3 0/8] Support DEVICE_GENERIC memory in migrate_vma_*
To: Christoph Hellwig <hch@lst.de>
References: <20210617151705.15367-1-alex.sierra@amd.com>
 <YM9NXrGlhdp0qb7S@mit.edu> <905418d1-9099-0ea8-a6e6-84cc8ef3d0b0@amd.com>
 <20210624053048.GB25004@lst.de>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <3fd9dea5-6166-a92a-f9cb-e53f5590b2f8@amd.com>
Date: Thu, 24 Jun 2021 11:08:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624053048.GB25004@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.186.84.51]
X-ClientProxiedBy: YTBPR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::18) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.84.51) by
 YTBPR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 15:08:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52605d4d-1e61-4f11-8d8d-08d93721eed9
X-MS-TrafficTypeDiagnostic: BN9PR12MB5100:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5100336A297AF6F320EEC0A092079@BN9PR12MB5100.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZwBejIiomeRfmoU7jitsnmTAQrc2GifNrVQdeL2TbWPFamluq+T0oH+Vg7LUBCxq4rXgMuhIhZJ5rmPAjP+SwEhGa4Czm5cWx+/Y1ECSCAhjZNPoXvgpZ1ip8dDTMLuz4ptPE1IlxL3DN2BiEwEd3q9gt8UzaXfKjTvuCnphIfejTe/Al3/AqApxAqsb4q/JMnpQ7l5CD6ElW9U9CcAkZYswQdbfEoXaYOMegTXQkVcusfVXo4wi1fQ63CSFy3v2MzxVx7GW+stL2aOvTbtdN/a6Gnivx/+8qLcDpQGUIWeAEehqh2v5QOoRIxZdgdiad4pF938GIKasbH1oxLzngGI1vK83o3iUs44L+Dqpg/x+ILa/+ZWo93u46OgUl16P9Q2JEjViYH5Ctol6gawnfX6ZG1sZUwuoZOfHuykK6MJT+y014DSmBe4x6XqOS2c0/A+tQRS5okJS1vqj2gnbzfaia9MtLoEkJItik0PETpChRZ/skvHElz+f/abpkPt402tNFkRE9Ts+T3y5FvX84Hq9Qw/tv1j5KLmTtSbh/gcUzQA2wztwmTw1Vouy9Z1f06qky54O8Wy8TP8ZgqHq0hy/u6TrhvYqb8xs2qw4AEre3oDMOQOyr7ZzqJyADrTaNUNrLX5I3pVF+/XZj3sUvVur8Oro9l+7wQA5TqkmpIfzAGNjv56jQjbKkub1kxEZ+OcwcTIJDR1kKNJOF2S3YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(498600001)(16526019)(83380400001)(186003)(6486002)(36756003)(38100700002)(26005)(6916009)(31686004)(4326008)(5660300002)(8676002)(31696002)(86362001)(2616005)(956004)(7416002)(44832011)(8936002)(66556008)(66476007)(66946007)(2906002)(54906003)(16576012)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUp4OTVOeHd4RFVSWHlSaUx2bm5KT1AxOWxhS0lha0JxT0I2dnRUalF2VmRN?=
 =?utf-8?B?YzN0RUpFdHdPVTZvT3M5YXhLVUJTOGJNTVdGY1Arb0V3dERDVStlcFFNMys5?=
 =?utf-8?B?S1dsaHhhd2h0OXJTNUVvSnlHTHUySEQvc2JwTzB3RThaQnh5ekNYeDlXaWVF?=
 =?utf-8?B?d1loY2QxZWtZSjdBVHV0ZE1sUlVONEdaQ09paG5PMVZpZ0dxS2hFK0oxOVBv?=
 =?utf-8?B?bHdvekJ6b0tjSzFMVDJ2U1A1Z214NGVUSmg0MU05ejJPMmhoUUNQaURhQm1Y?=
 =?utf-8?B?OXoyVy95eE9VekJtZlZ3RUx1S3V6WGhnWm1ZaVlySVpSWi92M1FvZHJrN0N0?=
 =?utf-8?B?MG5vcmxnRmxIa2pRdnphTGI0djk5OXRDSkUyNWV0Zm94Y2NKYVpCNHpja2JE?=
 =?utf-8?B?cXNFYUhxZnVEZlVKMjQ1a0t5SXR3TEZ4aXhZeUtpUFRydGsweHZzeVBvd1do?=
 =?utf-8?B?dWpBNXlaamw2SVdxNW9ERENYOHNtWExTWXluZ1JvQy9QT0gwQ0w3SDViQ29O?=
 =?utf-8?B?TU9vQ0o5bHc3V1B5dlZ2MytTMGhlTWt2YTBNV3ZJNGNFZGFtTFBDbnhKOWpz?=
 =?utf-8?B?YWdXVWVrZVdRL0lIUXFIYXk5ZGQ5Qkp1SUxrd0hvN2JadGxwVUJHT1FHSG8w?=
 =?utf-8?B?QkZEQktTQ09CYnBrZHNHckpGNFZXRDlUZEdGZ2ZIQ3Y2NUZpUlhuUTZncWtO?=
 =?utf-8?B?UXlWUnF0OFVaanZpeC9HL2tqR09pUndVT1IreTVPVHZOdEVad0tJN2MvNDdJ?=
 =?utf-8?B?ODU1YW5yWFJBREtIZk1FUTZiMk94OGdrT0hKVEgrS09MT1cxb1JYMEpHRHRv?=
 =?utf-8?B?bUZ6ZkZkZFVjOWg0UnE0WjNUSmVkYUg1cjRJYVAzNGZGNFcxek1Eb2JlcWdV?=
 =?utf-8?B?WFBhbmlDS242N0VnaVdSck55ZE1Cd1A0ckdjMXluQ0p5MDByUWdTOHBWU0Nh?=
 =?utf-8?B?aDFaaENwdHBoZFVUUTc0ZG5MWVM1RmNSRGlCWjZDMHBXMFZPcXN5OFFnZ09T?=
 =?utf-8?B?WllUQWp0bUxmaklSdHZLK0R0MDVUdnM5OWJEQUhlemtPa3RnRVdBSE1ieGc5?=
 =?utf-8?B?VitHbW9SNlNKYXRZb1hhMlZ1Ri9BVkRDeEhpTm9DeVFFNFNZQmlPdkhvOVds?=
 =?utf-8?B?Vjcrc1hmQytRZW85RzlmbnIwZC9jMGdCOWUxK3R1TVN4ZW9hbXFiN0I1MmRi?=
 =?utf-8?B?ZzZKN2l3eENLUjNoTnU5Wk5ha3d4ZkxLVUp4clRaZThYVWs2c3ZqaDZzM0RT?=
 =?utf-8?B?SEhZVVJDY3RqMWF2WGtFYlBvU2FWSW1qUGczTXNYZ2tYd1pMZW1aQWY3Z1dD?=
 =?utf-8?B?S1pNR1c3U2RGQmNlZkdwc2xzMHArbG9ZeHIwSnZSTWlram8xODFPTTVBRlpF?=
 =?utf-8?B?bGREak1UdzVDMnhqblQ4eVZNWG1hRHl4bGtzUzRnZk1OV1RiQ2x6alUvV1gr?=
 =?utf-8?B?ZHhKY080aHNWNlE2NFoyVk9aNStSMmVPbEZ5SzlSaTIrdFFoNm9aZVBIT1Mw?=
 =?utf-8?B?WHpPQ3NyeHN0ekxWRGl2dDY1QXlXQ3dPa1pUTkVNWmxHUG8rT3lDN1NkTFhR?=
 =?utf-8?B?aTBoRFA4TEdzdU1aSFVuZjk0VGxqanlxVDdiMncvWldaendTemVROHc4RXNo?=
 =?utf-8?B?RzJmRnFKUHFuNENhaXNlT2lPM0VxMUhxd3phb2FORGlKSHpmKzZWYkJwMllB?=
 =?utf-8?B?dExGR0VyaklURDV1SEZBQTR4NG50UEtNN2lkK3FFOFZ0UGpabk00eVpUSlpi?=
 =?utf-8?Q?0gJw8y4ZFMt/C7XtkoDRTBUUXCXtiDLfdaFhclE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52605d4d-1e61-4f11-8d8d-08d93721eed9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 15:08:33.2400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gNqkGPdI1jDTlMhInBI2c8pkSUZd3tyhDKE+nF7745+6LxCBrNrQzp2qsftylELKNetvoCH+70f8SOGWTCh0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5100
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 Theodore Ts'o <tytso@mit.edu>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-06-24 um 1:30 a.m. schrieb Christoph Hellwig:
> On Wed, Jun 23, 2021 at 05:49:55PM -0400, Felix Kuehling wrote:
>> For the reference counting changes we could use the dax driver with hmem 
>> and use efi_fake_mem on the kernel command line to create some 
>> DEVICE_GENERIC pages. I'm open to suggestions for good user mode tests to 
>> exercise dax functionality on this type of memory.
>>
>> For the migration helper changes we could modify or parametrize 
>> lib/hmm_test.c to create DEVICE_GENERIC pages instead of DEVICE_PRIVATE. 
>> Then run tools/testing/selftests/vm/hmm-tests.c.
> We'll also need a real in-tree user of the enhanced DEVICE_GENERIC memory.
> So while the refcounting cleanups early in the series are something I'd
> really like to see upstream as soon as everything is sorted out, the
> actual bits that can't only be used by your updated driver should wait
> for that.

The driver changes are pretty much ready to go.

But we have a bit of a chicken-egg problem because those changes likely
go through different trees. The GPU driver changes will go through
drm-next, but we can't merge them there until our dependencies have been
merged there from upstream. Unless we protect everything with some #ifdef.

Regards,
  Felix


