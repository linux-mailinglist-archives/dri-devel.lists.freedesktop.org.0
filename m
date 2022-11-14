Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF098628DD3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 00:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE7B10E346;
	Mon, 14 Nov 2022 23:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A012710E346
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 23:58:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHF9Eni0owOxtwrGRB4uR4UkKyt/vMnXzihBG1SWP6kB0zNpLAxBnmLKJF8QmwMlZjR8XkRkTB1mg5PfvYebdnG7EE/W+cTZBgojnLMfgRC2xcZ6JJ1lMe4qQHJfs4YgOnZPPmqi32xV/6AcR9roggE+jjxSj1dvJr/kxJTW7IWRJAV2pPkw7c+byqpZd5oE7cR0iJAt3PTOWyL7lfE96dzd/VVUUUSs1eKfrE2f5L6FVf+dj8s6Lytg6g9dq8hWe9OwlZmX39VLhMy6Dat9SUniaT3N+7SEa3SVasjXUPFLiBoVJOO/otZtz3PbTqvz26ekMB7CgrKYXrgQ1ALzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsjYBsd6nWGpoLs1n5OZmMZmwF9zx2BEhOFf8kUGxOw=;
 b=WT4z83v6deUjm4+C/QjDwD6PmIwt9ktpFWNeZOdr5FbZGCx/2RdQVV5fz0Q0qlSsDnPkpnaHMaKNVtUMvTeBcqO38Ujemdb5Pt6OmZOiX1n8ezvOp03HK4caik2+AadyNUQYS4KLiScRWrp+ZtM1f0ZAGAZtXTAm00Lrk/XP6RyJGDT3XWkSfTVtPpfVsjRV9czQ2lBcCMllYxAbG9rN9XtbEWtLTrn7IRf9WVOmQVUqL1o4COMuy1mTVp/B4glj95oVU65PrCwHWh4PX6rnjlfFv9Zgb6e5WNZ78asCkEYQxyo0DaU8ZqseX19OmK7r4NDh0zeHdOGYYr8NLmhJBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsjYBsd6nWGpoLs1n5OZmMZmwF9zx2BEhOFf8kUGxOw=;
 b=WvdBIUH+MwrbtahFxSdZmFhvTHSEcr/oA9dil+F6GS0g/ig6/iW9tZq3r7GSpKuuUHZZ75vJwlMcYv/5fATVkI7RN53SlMhecZP8AtFQEjzyun1kxA57s8oJehOW1orMNUij3NI6pc8gykD06jC2GWLQwXPrgoAJQ13f4glTn9WLm1mn4WOmBTJa0zNWhGvhaO7H71LSIg6eek/3wxFeo/P1Cy/w3kS6SkEbWohLT/PVzt++xjeET4UfZyvB4HSMeIknJqTdgm/t9E+HbPGk4LPPoRy+vAqve2IVBO9/2fAzrw0YsjD07LDv401uiFuTo+R3ffctMIJq9dq4RQ1i8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB6150.namprd12.prod.outlook.com (2603:10b6:208:3c6::11)
 by MN0PR12MB5954.namprd12.prod.outlook.com (2603:10b6:208:37d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 23:58:45 +0000
Received: from MN0PR12MB6150.namprd12.prod.outlook.com
 ([fe80::f9b0:2870:2f13:35e5]) by MN0PR12MB6150.namprd12.prod.outlook.com
 ([fe80::f9b0:2870:2f13:35e5%7]) with mapi id 15.20.5791.026; Mon, 14 Nov 2022
 23:58:45 +0000
Message-ID: <1284e397-6d33-af04-ced6-7cc5f8628847@nvidia.com>
Date: Mon, 14 Nov 2022 15:58:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] mm/migrate_device: Return number of migrating pages in
 args->cpages
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20221111005135.1344004-1-apopple@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
In-Reply-To: <20221111005135.1344004-1-apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::17) To MN0PR12MB6150.namprd12.prod.outlook.com
 (2603:10b6:208:3c6::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6150:EE_|MN0PR12MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: 050d2a56-6ef2-4e33-bea7-08dac69c29f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zEA02tm3k9h4teMQMMh6g6dS5pNi8vFwTn2+N7F0Dfl4GJWZ0eGqoasftsQtm3noxjtZJgz+8YMshynXRP0kaXQfgRK687ftA2cNb5ffOelr/V76+HwlWNe6VPifgvPT21i3MyihC2dD/IDt38nJLdixoXJyY06adsBVGbCdkooMo+JeSwoK80j5JONI3ZyunlUVRLobiuqec33B89U4RURI/oVpF9Rkz+Va4sZ+CIRT0yOi2yxsdkMjsAZnHfkT1cTWetdHo1XUSXsN9i9LbWpSTgTJSYHNfTJIM5p6wQfZS+M6MyptQxW766qk0h8mCfW3orLeIa5/VtW3oo2/MJqHJLk7Ite09Xjv81/mXUpW9/OTbWKe5iobVZSQCXVa39PE1ENaObc2usRb03qeQgyCrRcz+bl32ZqwKVB1GXO1srC68su5DBbJq/IuLnuE8bxzDOuat0YeOInE9olf9CnfIOEU9MPp/h74f7o9iBo6MIBCq71IO91rrTdEunaVKpsYY1xm+1/0fMRB4t0AkYNVf1lh6XuNV7kgJeYkfIvJfmR48cwdh0nL2Ha5SCEHx0NmBfoC9dgu88bGjKe/qjAtJbzCW06kR1ZRtaBdjJa4H7qNb/vz6ys2fbJu05xMYSWI4dopWCePgK0+Biie5h9sv0fo3ldyMwXG4HTf1+hvLvZi1k0eN4mGhpWrQ0jTgnnFtxZMLKeGa+wZcu5gKihaf/zKNwhYQ3xvBcQPaX/dnwGftCL2fLagWeTbYfUHebk1vAXIPhjXQjAkZaJNHtxoEaLkzOED4K3ksskccmA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6150.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199015)(66946007)(2906002)(38100700002)(54906003)(66556008)(66476007)(36756003)(4326008)(110136005)(8676002)(6666004)(186003)(53546011)(316002)(6512007)(26005)(2616005)(83380400001)(31696002)(6506007)(86362001)(478600001)(6486002)(31686004)(8936002)(5660300002)(41300700001)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a28raFlQbTZjaURxcytYby85Y3lQai85b0xtU2hZWDFzQ3FGNk1jWGYvUzBw?=
 =?utf-8?B?VWR5dVJLc1lEVnoyS09ZUjR5SlNXTy80OWMvMFFydjBIaFBpV3dtVFovNXl2?=
 =?utf-8?B?ekwzTWw5MzA4Z2RIc3EzNTNNY21PVzI2WDBmV2lYNUp3N0tvanZXNnViSGtR?=
 =?utf-8?B?MTZ6djJtRlphb2JYVWNGOWVKMHhzR0Z0ZVgzUXh1V0Fpd0VFSmlNVUVDTE9r?=
 =?utf-8?B?UkFFSm82OWZ6WTBvOFRybWJPVXBvNnhMOVpiVjNQQzJtR0ZKdUdMTFJmNlVT?=
 =?utf-8?B?Yk1mNm0wUFhQQ1pVcWVqMXVpUXpKd3B1UlljdFNqWTZuWE9mMVlBQ3BGK0pC?=
 =?utf-8?B?YTFmT2pvZ0pUVWlEdEQrL2ZYcVdyVkNFQ0NXVDdCTHRvSnh3YUdjSmhFTnhI?=
 =?utf-8?B?RCtkSnhWS280ak5LTTNUTG1oVk9TZGs0N0ZPcitsWThlM3M1Qlk3Wkd1TE1s?=
 =?utf-8?B?ZVlMZkUxd1IzMkRIT3ZnYVhKc0grSnRDdk9ZaG9xUGFxOE90Qm9jU2RPYlla?=
 =?utf-8?B?Tzdoak5YNHFEZ2FRU25CZGJSM3VTRnBIWjVocFZEY0pOblZJNnFiY0pKcWt4?=
 =?utf-8?B?M293V2xzT2hqdzliOVpORnZYNGhMTUhBS0ovQ0RUUlBDd2RxdXFXYzR5cjFE?=
 =?utf-8?B?VGMxdWVsbDlLV2hLd2lwT2lia2xnTlNNN2tkc0gyb3hmZXcrNjkxd3JKTzV1?=
 =?utf-8?B?SXNxYnViTGhIYTk5TVZ5TWdvOXh3a1JwdE8xUEw4MTVrNmx3aU9BV1hjbWI1?=
 =?utf-8?B?Vzh3TzNqSis0YUdJVTRENE9WQ3lHdHduVTFjaTM4QUF6dlIxSmREWVNXNG9X?=
 =?utf-8?B?bXVPNUpCUTJWaUlyVGs5QVprVHp6THp2YVZUcnVMWUJLeHM5dWNHRjBHWmVB?=
 =?utf-8?B?Tktaai81ZjBieHVrN09rU0w2aE11ejI5OGl2aXUreTdnd1VLVkJrYjJzaDFD?=
 =?utf-8?B?cFBtZTNUdFNCTDlteWdkMXBaMThLWW1YNFBWaUx5NjZCaDFPWUJzOU5qdFlY?=
 =?utf-8?B?d25DVGNWOVd4L2RVc0JRRzk1VWQ1RXhwbEVXVzY4ZWp5bHh2bFVmRTdrZXNh?=
 =?utf-8?B?TWR4bDRJRVRNZS9IQ0RTTVVGZkdYZnZwWnlORk5GZDMzSXhySm1ZSkhwalRR?=
 =?utf-8?B?ZUo5d2xQYnhSNjlUWXhLZjlvR1NLa0M5MVhtNU1MajcwQ2ZEdTJ6TEFpWnRX?=
 =?utf-8?B?RnpZcW5GVmFsdXFUdXU1THNWdUd4Y3ZLL2pmZnlpbUtrMG5GdFdzdFBlcmQz?=
 =?utf-8?B?VnRMY2QvMGlvaytCTVUwWEVYU2JmaDgvNDgvV3dqQnkxcTJOR3V3akxWRzlx?=
 =?utf-8?B?OU5oeHZCUUF4QmtjUHNIV0MydTczNUtxbmlycUFYQWs0TnJXN2xTbXpBQ2Y3?=
 =?utf-8?B?TzJWdVNEeDk0NzJoblhvak8wM1pNNDc3Nm1iT0pDVWtnTm03ckUxNW52Ri84?=
 =?utf-8?B?c29uNGQrbDByVFFEVlJEVVpGajEzTHYvSUtscEVWbjBHeFRvcVlKdlFyOHZZ?=
 =?utf-8?B?SE4ybGowbXFkdWt5WVNVQUcwQnhRR2pvUGswTXdJVzl4cEJaaHhrVk81TnZQ?=
 =?utf-8?B?VVFlc0lCT3hBN0hQODI4UWQwaFZJTytHS3gyVEJYNm5VMU03aHhKNXNCN0RD?=
 =?utf-8?B?d1JPM3FLd05LdVV4SlM0aUFQVTlJQXlGZUNnUTRzSmFZK0EzV2RIbkVQV0Vv?=
 =?utf-8?B?L3N1Q3h6anJRMmJzTmR5bGlONFBIV3FsamduMUF1SE53bndsZGE0eXlpMUtp?=
 =?utf-8?B?dFQwODRZanN5WnNaNXVsV1lKTkJJNGFUV2N5VnpqVGxVbmMxeXFSVlBHMG5C?=
 =?utf-8?B?OHZJb1VML0FXaGV3S1VDUzdXcVo2b21zRWF4MVBxK2krZEJDM0ZvZlRZZEIy?=
 =?utf-8?B?ZUpEMVZBZVVSQ3FyZThzWXYwcDI3WGcxM2orbmxFR0xmSE5sVnlFaHEzMVJX?=
 =?utf-8?B?MkE2THpEVnhuT25lcUZuNlFkSGNkRUprcHpKNkM1a2x5YmxTeHdBNnJCMjMy?=
 =?utf-8?B?aVppS2FIQ0tsR1FvYmhuSWJyRWo3WWFiK0Y5azc0ZG1IOXhnUHowMSs3MFN0?=
 =?utf-8?B?Z1VFSWd2ZzBQeVFObmlZV1VjL1FieGRBTGxZcnA2NjA3RjlMOHcvUUF2cVlz?=
 =?utf-8?Q?SyK9hlW6EFVidRQbn5sfTQ6zF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050d2a56-6ef2-4e33-bea7-08dac69c29f7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6150.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 23:58:45.0302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYtJhCkYUqnEJLVgWnC5HhZUhRCj4Apk6iEXBLU1LV34QLJut3lyekNS8ZyC7JrNY0NXOZXs3/N+hJ0p64E9uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5954
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
Cc: Alex Sierra <alex.sierra@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/10/22 16:51, Alistair Popple wrote:
> migrate_vma->cpages originally contained a count of the number of
> pages migrating including non-present pages which can be poluated

"populated"

> directly on the target.
>
> Commit 241f68859656 ("mm/migrate_device.c: refactor migrate_vma and
> migrate_deivce_coherent_page()") inadvertantly changed this to contain
> just the number of pages that were unmapped. Usage of
> migrate_vma->cpages isn't documented, but most drivers use it to see
> if all the requested addresses can be migrated so restore the original
> behaviour.
>
> Fixes: 241f68859656 ("mm/migrate_device.c: refactor migrate_vma and migrate_deivce_coherent_page()")
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reported-by: Ralph Campbell <rcampbell@nvidia.com>

You can add
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

Thanks!


