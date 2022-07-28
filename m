Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB4D584633
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 21:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDA710EBBD;
	Thu, 28 Jul 2022 19:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815BE10F191;
 Thu, 28 Jul 2022 19:27:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmD2EG5vmWAU6o0H6ntJQidaWPGa/oSHBfXkj7JdRie+LtN+i+R5bqQgRhFupmxivujpfDowobNTGC6V9Jc+cz6/0/ogjB12tj/CCBjlPrmws4ecv/YkmU2ahG2yW8uJclKfVhJ83wht23snmjK4L3UAt8PB9vq/5PmIvKeEPmX1Rsul4lEM7qGSGvSSeXgWaP98/FkCHTD2SlJmJa+xs55YdTlIoWz+0AkVgcDM3TR50XcW2lxWTaiubZIHPVX+XMd7myg494qvGhGe++MOidbqg5h8oGsWw0Q3qf3Vj/k9xZjp4Te6UjAHi8843JGUeZhS0LysiADsiUVZT6N2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DbCus2YGHJ2qkQsfhKA+NOKscO5ZDR3eblmwZ8EuxQ=;
 b=TkkvaBjoROW0KtCF0sJdIZsXQJ37WH2arJg06zprvXWAVRF1uB7JIadPbxke5wZ4qOJGxvPNsafCleISuBls2YY6KQWe8FVphc1ZwMQ0yqUF/eLClbmC4FzbpvFZuP2LKgq2YvdhECPKehHiAHCG0C9Ti3wTztsRuu86e3TjsA0IDXMj0GwAJqz7hBym0H7q2YK+vHpTugkqewI+IlludYNGLvP77nAV/PVNRl0bN0klzTQXqiSt6S4weQRQuXcEnI2WDHRWg/4LPkbsWMTsWVTnjN7YEQg/iCNQ33u1DRMwbcDsxUUDgazrB2KYvXI8hzBVhSA0ngxDTVgBVHhTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DbCus2YGHJ2qkQsfhKA+NOKscO5ZDR3eblmwZ8EuxQ=;
 b=dfH/XTTLvrDBsmvyHopp/Rb+BHreEiDV2Vqu1MXOG8s1+5lW19H0XFfSUvb8A332Iij7UC2fxrYS9+XyRMuMivDkkhIVhr1mS+Zon0+bCg7DA2PZhyH2FIhNkYS6z/k3IXkrEVVx0zW71f+sAWrMZ1wAzQY2g1DZe059ADkNOnyO9Bs7H6mUjUCfI0c0gzZbkrKzXCf1iu+6saMukk22UGjSk7UlrhSzVpnHrzmlG6B6+lUlLHRGL7fn2X4mvgXw/tjFpl2xRf5MIQFNjjZTCcrthrq5B00A/AvLWZEMhPqxc2+bHh47qQ4ODCcs1ftnI9EicyZ5wvxfmjE2nU0cGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB6150.namprd12.prod.outlook.com (2603:10b6:208:3c6::11)
 by BN6PR12MB1764.namprd12.prod.outlook.com (2603:10b6:404:105::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 19:27:48 +0000
Received: from MN0PR12MB6150.namprd12.prod.outlook.com
 ([fe80::30b4:54b4:c046:2e14]) by MN0PR12MB6150.namprd12.prod.outlook.com
 ([fe80::30b4:54b4:c046:2e14%3]) with mapi id 15.20.5482.006; Thu, 28 Jul 2022
 19:27:48 +0000
Message-ID: <84ec4ad5-a580-1a43-27ed-d47dbdf7d1bc@nvidia.com>
Date: Thu, 28 Jul 2022 12:27:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] nouveau/svm: Fix to migrate all requested pages
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, bskeggs@redhat.com
References: <20220720062745.960701-1-apopple@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
In-Reply-To: <20220720062745.960701-1-apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To MN0PR12MB6150.namprd12.prod.outlook.com
 (2603:10b6:208:3c6::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d281fe8d-bf19-4256-e4fb-08da70cf4165
X-MS-TrafficTypeDiagnostic: BN6PR12MB1764:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yN9pQ+OPGzYZ8T1JrsiyNZi7gTiUDI7OYl5Vc5AMnosSjODh7TPTWnWzcRjSimnJ3Ik6AtLE7barBcafrnOLJUh0RT2n6qC/EgZ+SJ4e8LNgyY+lalyATJV98JLiFMxz5TJgGcLq+95u8KtHYDvqltOZg4oYF3GUpDkkwO6mYVr0mn2hXNxcvCvjZ1TKiMjl9vtRZM2Fa1figqzIBor3wKTcO+Sz6gWoQmx7eZUV9hMZ73CqTBhbM2iEo8GVEpaxvRbKtxZFJQdVCIHHTyDFYWmSpehceVfHuG9gCs/n84pz+zI7iGiKWcFLea5mCmIfOqLdkRaLahewnN/kmYV3GN91LyFQPeSXd19aiedDYgx3qswiOf9C44Rh4kJDh52QqWOqF1Sle2RR5bccq7Z89p1hfR+MJhlZoEhjf+ayUC6Dj40fvTRgd5CW8Mcyan5IsFBc64ixBazmsR3vC4Eo+PkfvkFpwLqoBAXHB6brQLiCxAYEulqMkpbd2/Qc1UWgiMqqh3LblpWn9jfjhAlslW4EwyBTNcC6xlf0p0z2hkrwammBEqUVMJuL1t2i6H2gl+3AQL/OMKUD5H+3B3BqfVrVrhAIKdWdgerfjibpECMcfqU+Ry11JgMlAMHKajolShyxnS0ur0F6Sqv80FXYVpB4IIgY3VZ1zNe4KDh/jMbA29j0u57e3k0kihqXviovUEaqrjINGeWJAwyW50hEIIyUrg9bD8Ba29jDCUIw3/tdd42b0my39MZdeyaX9sZfLug8YmQdhJ18UpvMVDOWb4tqyReMk8kLwTpy8XXU/a8czFSof8NwkV4SDBpEpcwI8KYOjsg/Ehl2QmlQIuSsUOnnthjC7P7MlhNU+xDVV3ulQPX3Ct2tSv1NXENb8HTQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6150.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(4326008)(66556008)(66946007)(8676002)(53546011)(478600001)(2906002)(83380400001)(6506007)(66476007)(86362001)(6666004)(41300700001)(4744005)(6486002)(5660300002)(6512007)(107886003)(31696002)(2616005)(8936002)(316002)(31686004)(186003)(36756003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFRvVUlSZ1J0MzgwVFhQTjk4ZHEzemhxSDlFOGxuZWp0cmhLUlVUR3lqYWcr?=
 =?utf-8?B?UXVNTlNqMFdRbVNCZ0VTTVF2WmVFdGZNcHNvK0JJRTRvempVYS9abG9qVm1k?=
 =?utf-8?B?NDVTdW53dXFCVHRlaWMzMEtxREhZaFBua1M0bGExeUhNTWw1VjNBUktrUkZM?=
 =?utf-8?B?NFBNd1JpaFJOUlQxUUpobFFtTSs5a1JnQnZBdFhTL0ZGUytmdzlkakZvWXhF?=
 =?utf-8?B?cUtDMjZUVUJQZnZvaHhHRitpV0t4Q1RJV2xXVS9UYkNJNkdESVVpQXlpWVBj?=
 =?utf-8?B?b0w4T0NMNmlPamt4SDZDTzVyL1VlbUNjRlNnYnkrZ0oxOE8ydm9lREZHTFpY?=
 =?utf-8?B?ZGtJajJ6allSRGJ5R3N1RjZuOUdvQ2h4SGtVcG0rSDMweTViREw2RjA5OE1y?=
 =?utf-8?B?ejZVOE5adnRwKzdFMEovZ2hrVjF0Y3pUSWlaVGN4blFZNERvMzIxNlM5c0FY?=
 =?utf-8?B?czE2QUtoYkhpNyt6OFBLdThnbkEyMFBHZGtuUWYvUy9QbXYyclNuZjZOdzNQ?=
 =?utf-8?B?cnZHbW9BaGx4bzNMdDAvdkgzSnhuT0MwYW1xN2JsZzFTRHFjVTc2VEN2c1My?=
 =?utf-8?B?Z2JDRmRyV3VxM05hU0t2QTdQVFV2aUVrWUZOUjl6U3E3ei9wVWtFZXdhSk9o?=
 =?utf-8?B?bU55U3JnWEdraFBCY2ROeFZsVE1oTWh6NUV4M0pqdzhMU0xFOWZNTks5amFx?=
 =?utf-8?B?a2F4aVVYWWhPNTlUSlUwQk9CVk4vZGU4N2EwUm5VUlRZMXpQbEl6MkpFeU5T?=
 =?utf-8?B?L1dKNzZUZjVTTmNKVStqQ3RBOFpDNHBheXo4T3F5WUd3bDlxYTE1M05zSkFZ?=
 =?utf-8?B?RzA2NWhXYk9QSHdBN0pBaGY3azFTY1hENGo1L3VsMG4vNXIxK2tFeWhlMTk0?=
 =?utf-8?B?S2N6eFJnZUZqejFrazdaOVU4Z3MySGd0V1haanlTdjFQMVlIWnd1NE52cXBo?=
 =?utf-8?B?dVVrZHAwWXJVb2Z1NDg5LzA1UGlRWFZUQVlIdHFJMElEQzRsYnBka0FaYWQ3?=
 =?utf-8?B?WVRMVTA2TUpOeW40ZnBWMW1QME9ZWjl4eHZsa2FXaUZaYkxJQzN6aktLR3lU?=
 =?utf-8?B?Z3FQenV1ZFoxbjdrdmdEVmxwTklRVjJBSkNiU3B1NU1YbzRhOG01NGpRWjBh?=
 =?utf-8?B?K0Z4LzhFakFLVmFic1IrcWdhRW9wbmdjd05jYkVLb2xRQjliWTJSRnQzOW5v?=
 =?utf-8?B?em1lRC9KOWhQNUpDRVNQbVRkT2pJbTUrMzJJbG96MmZ1TWc3eUIwOTdoQXZv?=
 =?utf-8?B?eVVNeDVwUGpidy9YelZYWkF6QmczOXBMUnhFVEpTOE94NStySmN2RGozSUw4?=
 =?utf-8?B?ZlZXVkhZZi8xV1hLVndhWG51TzNKRkJ5VTNtdjhtaXAvTDhQdEpsSW4zZUIz?=
 =?utf-8?B?VWlOa3c0WWJqNHRWVThPaGU5VThUekY3QURBTGRIa2cwV0ZaalRQeDBBSFNz?=
 =?utf-8?B?RVEwcTFGNDc1djhZQXZzejVPNGRQY1lwWUZmdlNvSktEOTRZYTcvL0pIbUxo?=
 =?utf-8?B?dlpWblI1dWhXMjhLVko2RTVFMTVEWmxOSDlqZVVGV0t3NURSbkhXYUZpRTBv?=
 =?utf-8?B?T1hTd1ZId21LRkJkSDdZMzYyYmhjSFA5ZXd1dTk2WlFvOHdkOVpLNExXMzMw?=
 =?utf-8?B?Mlp4OHlXY3VNdzEyNE1FbEI5KzVTVW1VaUp5ZU5iK2FkaTM2SFBpazdPS04r?=
 =?utf-8?B?UFl0R1BLUzIyQUVpNGx4RlJzU0FrNDFTM0Q1SUxnVUpPeEdQTVpEZ3ovNFNT?=
 =?utf-8?B?SWZVS2ZYRWRtOWUvdUlGT21WOHVqRFJyTlk3Q3pmNmxzU0Jad0o4WGJVaEk5?=
 =?utf-8?B?eWE0RXNMeFZuSmdKS01LWkV5bmsyemo5OVpLdGFLcWk0VVRBQ3pKNzByU0hF?=
 =?utf-8?B?M1hXQzVxUnMwQnZTVVJGbHhoTnhHT0I4OU1VTnp3WXgvT2JndjN5aS9EaTVL?=
 =?utf-8?B?dFZnK3RqQXE3MzVlczArbkFJOEVCcDNNZ2Y5Q2FMSGo0K2txUW9xRlB0S3d6?=
 =?utf-8?B?UTBMSTdXTmhZaW5aWlVPK045WUw1Sm90Uy96cE1ER2JuaXB5YzcxRkxsNU9z?=
 =?utf-8?B?OFpwV2Y0a1dUdmxnZFBIRWpZUnkrNHRIY2drbVVBVDJxdzkzcXZNZVU4UUhH?=
 =?utf-8?B?QzlQYmYzN2t5NXRVRzZrUkpMb2svVDRMV2pwYldIdjU3SmV4MEFjUEgzMkZL?=
 =?utf-8?Q?he+vMQaHG91soJF5Z2LDhmM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d281fe8d-bf19-4256-e4fb-08da70cf4165
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6150.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 19:27:48.6116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crNsEkYIQ3RNY0/LxMHSEkgC5zr2wL4W54/MTIzb2vcgRkAQW8VC3D10D55WrqPkMQod1NtAFfKJOHGF0GuYuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1764
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
Cc: kherbst@redhat.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jhubbard@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/19/22 23:27, Alistair Popple wrote:

> Users may request that pages from an OpenCL SVM allocation be migrated
> to the GPU with clEnqueueSVMMigrateMem(). In Nouveau this will call into
> nouveau_dmem_migrate_vma() to do the migration. If the total range to be
> migrated exceeds SG_MAX_SINGLE_ALLOC the pages will be migrated in
> chunks of size SG_MAX_SINGLE_ALLOC. However a typo in updating the
> starting address means that only the first chunk will get migrated.
>
> Fix the calculation so that the entire range will get migrated if
> possible.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Fixes: e3d8b0890469 ("drm/nouveau/svm: map pages after migration")

Thanks for fixing this!
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

