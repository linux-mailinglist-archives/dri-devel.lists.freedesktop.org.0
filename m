Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1E44F9810
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 16:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0E110E47F;
	Fri,  8 Apr 2022 14:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5558410E470;
 Fri,  8 Apr 2022 14:30:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdoEg8PhHXlpcVFro39V1SlmqEu3UUnfjrAiJR2xJXaVnTQ1H0j0r2j10ccxc5HGi3hsk/3dYomWmqBpokUlfT5KssrdHc43/xZuJGr9/nEcpsbg4IbtrayoU0o1o0NiGiCs4X0dKd3B+7vL56QorScskDqmHK/2Ptpg/D7EGfuWetHahNbklzm9XztikhzVbuCrPP62xtP3gnZRpdL5U5YKXwCP19mLIG4cqtS0+e3LAgOmomw1OVMMxKUc3kdlYYwlwrirJwdVgrrBGHx7wU5bHFDThS+gik73iEixjEkQOqYpo6cMAlsa57RewnCSEHGjH7OzL40mRmZ0x0MS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4X3S+O/SWKNsO8beCBQvl8/BcMXWFTW9Xh9SdnJGn6c=;
 b=IyZSJJsi0XVYwRDSY7iUYEALZI1vDJ/JIPTF7ELWs4YIL/i4prm5NuC3/hYVYnsAEC0X49rc7LlFVJ4+innEP4bhPL89fEWVxM/4Ev89O0pLm9St4TRfACigJjERjzKOMhLtdZ0J9ytp1woQRQSwqVGZrpfWgKJrw75BvdPjXD59P8yP6VTdScjlBa+dsi/SRjKW1Q0AhxhoWRimdtkPlY1yiHXEySC9KHPahz7xXLn/aAhoblMzme1gEqvmlx+eSOT43ouDbSfc/b6KCvg/oRoFLrPp4AgLXjXglSqVfyyGSxIq5PaAQMhZcjRLFcWJh3zN3WIzrhP4foTlUIA4Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4X3S+O/SWKNsO8beCBQvl8/BcMXWFTW9Xh9SdnJGn6c=;
 b=HdUgc3glKraj2btahPRKAwdIE8DyoP9SmNsRFQLAmgXIyUAQWTqgZKWQr470g12skMxqMpjshHTBQkl/9hRYRi986OuiCMxLVcy8m0PltCYFQQ0LZIklSbQRFToxeb0BVBn0mz42BTJbH5KDoJBqKT0ysBK6BE16GuyDfuvUvgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3169.namprd12.prod.outlook.com (2603:10b6:408:69::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 14:30:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 14:30:14 +0000
Message-ID: <436116c9-6ce4-87cc-b1cd-f44b72fcfb35@amd.com>
Date: Fri, 8 Apr 2022 16:30:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amdgpu: Fix NULL pointer dereference
Content-Language: en-US
To: Grigory Vasilyev <h0tc0d3@gmail.com>, Simon Ser <contact@emersion.fr>
References: <20220408092803.3188-1-h0tc0d3@gmail.com>
 <4o2YD5id7zhK5g__CUK3Yf-6Dj459XQ0qsydW6wKHdco3YYtl78BqGUfXvQ9UO0AZoAsMPfhFB0jw1BFldiFDcbZXmGgsobuAoTMWmoDqmE=@emersion.fr>
 <CAP+8YyED70CSqVRaB7JgrAtK-yvBx5EsvrrdR7EpvOG2AVhskQ@mail.gmail.com>
 <QfKpxmkE_cy9wt5VJruw_TSdnl5KceKM8BxJGmZSBs-KiaRwIYfgc8h_-5h7Wmj6G-NtUJ3A88V5pzPvZuLlpkK-oRO5pSjeTxwHcZWlogs=@emersion.fr>
 <CAD5ugGD6QzCUqk7_EVwH9Cc6PQtx_VfjVRWzzP9uKR5tkGh1RQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAD5ugGD6QzCUqk7_EVwH9Cc6PQtx_VfjVRWzzP9uKR5tkGh1RQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5P194CA0011.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f024e86e-6595-4e5d-416c-08da196c4b41
X-MS-TrafficTypeDiagnostic: BN8PR12MB3169:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3169FD19DB74FC6DA62D346883E99@BN8PR12MB3169.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TFQvQdrs8Y8Pju0mhESBqDmNv29iHio2SkzuOVXjgLseN+2vBhf764S2+5nY0KLy+hiTWKwr+iU6S2id7aoqQF7ejPI73mQXBeJP1lYwQe9vjuSRYEfh10/NYYGlkiamS95Itk7eaLm9SrzBm0dOb6T6wjLfHNvwRzc+UHFK4fmPSXV5lQOLgXdRrATf0zBZ4I5mHgiNQh5oSwSY4tb85ig3FQBHAYWDIgNz/7Ra+bHoInpqT8rauTTIg5L2yJbniOGzJHYGoNDOXMG9L6ribiGUlj0UaBq3wc2es3z0sjbyxgOXqXkNzRkNCu5bl91/CE5jg/0UElIJpUqlJO/DsZh4TNe+e9XNvIM8nlY4LIWQ7qMGWyj4eRun89AOeonhtPomZ9ZS3eTsxSxrF1xY9VIPbQYahv5K7aiMDYqSFhc1PTrnL6Ssi3uh2aygiT+b2wqN3oTOHxTeIW1st+vQV3LcKLJlscI1o2/WqMMHsMe/VBhtfv2J5BCnKQiR7L3IZxOF+ojIUyQuKStnlTeiHlnTjez7/LbDCpraqNB8CqnCJQ/zVdqJxhJJYTbhMCbM6K0VQEJxZk/JLnuMxtoC8GmOWcASVOcj6F8XU50656FfUTRocb3UVq3ikVPg2JeMeVnVFuWcOWVAbYzNw4a0X7wyZbQIsrrSgneI0ig6vEuumhVv7BpUOkTsjO/AkoMSJLI3qtgjrHgfsUilIsxcDKHggr7qGFDBSuRAOQUbDIoKgblwqB5umHCFTur8TwOX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(2616005)(186003)(31696002)(86362001)(508600001)(6486002)(54906003)(53546011)(110136005)(6512007)(6506007)(6666004)(38100700002)(5660300002)(7416002)(31686004)(8936002)(66946007)(36756003)(66556008)(4326008)(8676002)(66476007)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2VxWWFkL3VlYm5ncGlnRk9nbHBKSGFtR044OGYxY3ZIRExHUjFpUWpsT3Jn?=
 =?utf-8?B?dzNNdnd2dFNQVzREYmtmeHVkZURJMVRDOFI3SWZ3K2toeGhodXFMUmMvdi9O?=
 =?utf-8?B?VVRrdHU0RU1LQ3ZjNkl4MkdHcjVIYVZXQW8yRFlvQWVrNkNUdWphRXNDZmt5?=
 =?utf-8?B?eFkxdDhlTWJPMjJDRnZPc05XMHMyWldldkdvemJ5OGM5ZCthalRRYTE4RUlU?=
 =?utf-8?B?OFN5aEcySUZFSDg1eVpCL1IzRzNnMXJpWDFlVUJWc3NVNXl3akhBMnU2VUdq?=
 =?utf-8?B?OHE0N3lqWTVIbU5WckhEYTFialNKQUpLU3VsMC8wT0FGblVURDlSd2F6UjF0?=
 =?utf-8?B?Ky9sYS9aSmRRTU1vcGU3WFE0UGF5aVB5dXF5YlIvSHF4RnNaVEJtOFZFeEZK?=
 =?utf-8?B?blc1RDdhbG9oWkhaSTZESm03d1lkaWpYYVM3b2IvR052b0RkMisyTURBZzln?=
 =?utf-8?B?bkh3MnA0eG1YZmF1cmEwRENoSWJ1di9FdUU2SDE2UnlqcGpuVFl6ZDhrSTRB?=
 =?utf-8?B?NFBnUmgzeXV2NUtVSkIrWWRwTXh0eFZQWjdKMUZjNWZWeWtCVVVHNHpYUllN?=
 =?utf-8?B?NnNWZ1V2bnpRYXZ5ckpnc25Ncmc3aVNXOTZYcjZibnpxL0V0WTQyYlNlVER2?=
 =?utf-8?B?bnNiRGhxdFFzbGp0bklFNnVJcUFoS0tMN2VjdmFPRjFnZnFxcWhnWCtUV0xq?=
 =?utf-8?B?T3J3a25VUU9BVEdxUSs0ZHdqQU5wUGdPRm1QTEtPOVZCUmRGMzZqaVBNcmtY?=
 =?utf-8?B?ekpKWWd0VEppTjl6d0MvM243bXdLeHowb1pMaWIzelNwaGRhNzArUFowZkY5?=
 =?utf-8?B?VzM2Q2p3R2d3UkIvV1pHekRPU2dhaHZUdmJ0UnB6MXJ6QUExdWFJb2tUK0Na?=
 =?utf-8?B?bXBWM2dOTHRVcEtXY1F2YVJmd0kzaGNWdEFCTlZUVGdvRlJrM0ljWVBKZkZU?=
 =?utf-8?B?bWhWTkpNVWl2REptU1FRMUQ5VXpBZDA3MklOc291UFFyRVM1aXAwOFpXRzRY?=
 =?utf-8?B?MVFzYU15Um5SckEzR3Y5RHB4aW1wVzdnZWsrcVZxQWlxeUtFekRHUWw5d0J6?=
 =?utf-8?B?YStQZXVWUnBkWFFibHdnQmpKUDFNSzBsZE9CWTJzdWJCZzZZQk1zUUhlSnZQ?=
 =?utf-8?B?cHhwWlFGakZjc2RUbzFZd1BQSlJIaTFBNFc4OGR4WkwrNllPclVnT0gzbXor?=
 =?utf-8?B?cmpIRlhxM1dhOFp4dVlmZkVuSmVLZC9QbzhoOVQxbzJ2YkszUCs5eVpDbDZM?=
 =?utf-8?B?Rk5oWlYrVG9ZZTFMVTBSNEEwem8vRGZMMC9BMmFrcElXaXd0NWhrMmM4V2lt?=
 =?utf-8?B?WHd1cUp6RncwaEY0cWNCZ2syUG9WT3BWMlJaVEdkREN4ZnVFQzVqRWc4MElN?=
 =?utf-8?B?RkgxZlpCald6UXZQUnZ1aEpjM0I5VCtPU3hnNHhFTml5M2JhZUZTeklRK3ZL?=
 =?utf-8?B?ZUJzL0p3OG4zOTZCd2w3MDUzMStxbTZkT3BoZFhVdnl6dmZsOFJKNXVGRUkw?=
 =?utf-8?B?Q3o2VktkYmJjcUdDekFkT0I2b09xRjJ6Nlh5a1pQL3JvM1ZWa1Q0MGIzaC95?=
 =?utf-8?B?aks3K3lPVnltNzdYUDNuaGNvdTdDVmVNblV3Ujh4ZnpvWjVuaXUxNTdkWEd6?=
 =?utf-8?B?Uzlpc2hWSmNEVXpmZEpYTHBTVDVwR0lGd2hZcGRUUUtMdlR4R2VlejRQVVlM?=
 =?utf-8?B?aENiZ25rTTdzSzI3UnhobURVNTkrMFFVNksxc1hJaXZMQXJiSjhrWlVBODBi?=
 =?utf-8?B?bXZoV3Q4RCthTUlkQkowTTFUVjNhdCtVTG0vM1hLS2NWL0pjSUdOZkZEbDF3?=
 =?utf-8?B?anFmYWd1WlArcXF4cG43eHZ1MnpQM2U5cjFCc3hER25yb1BRUzB4RjdxY2d1?=
 =?utf-8?B?S0pzWFA3WGFicC82ckl1elR6ZG16OGd5eEQzVWRucnlEck5hcGZZNjFmNy9Z?=
 =?utf-8?B?eitwYWpiQkVpcDlFOThuMjFSSnFZcFN1YjZpdTJEQVhKRkpuSGNKc3g5eE9K?=
 =?utf-8?B?V2d2bzVVblhXd3UrK0s4YnFJLzNVVW96ZDl3anRGRW5ZUG5lUjBIMzRDeVB4?=
 =?utf-8?B?ZjhUK213RWU2dTZtNTFJQlVHSEZzWFNNOUtESUxWT09IbUxpTlUzVzZkN3RZ?=
 =?utf-8?B?cWQvWitQWjB6MGJjSitPNmE5V3NyT2NyTVdxc2lzSXB3Tm1penN5T0wwQkpl?=
 =?utf-8?B?RlJYMWEwRFFSdjFSU1VicjgxSUpSdHRZTHU4b0dBa2o4bkJLZi9Qb3dTcEVa?=
 =?utf-8?B?dThFMTJEY0hIdjBFcmNZMzR0Ti9Ka0ZaOFVnMzE4ZWlvVWVBQVZVbmZrdlhj?=
 =?utf-8?B?TjBZQU9WUmJkWnF4Uzh2cE5MT0MwSmY1Ni9KSTBST1N1TC90SXZGNnNuZlVz?=
 =?utf-8?Q?rl9YiISwhOmGiSxPuJuND8C+fwWdi6JaF7pZY4a1XhlrG?=
X-MS-Exchange-AntiSpam-MessageData-1: 6drJXzZHNMynRw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f024e86e-6595-4e5d-416c-08da196c4b41
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 14:30:13.8888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xR2nkRruxeqS+kKNuC68z/mQhDdYCy1V4MryY9rWz6ZuO7DpzIiAopYRVGT2XZOh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3169
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
Cc: David Airlie <airlied@linux.ie>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 Sean Paul <seanpaul@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.04.22 um 15:21 schrieb Grigory Vasilyev:
> Simon Ser and Bas Nieuwenhuizen, do you understand that you are
> proposing to make the code less safe in the future? In the future,
> someone might rewrite the code and we'll get an error.

Which is perfectly fine.

See error handling is to handle userspace or hardware errors and *not* 
coding errors.

Testing all pointers for NULL without any reason is not defensive, but 
rather the exactly opposite since it helps hiding real bugs.

Regards,
Christian.

>
> пт, 8 апр. 2022 г. в 14:48, Simon Ser <contact@emersion.fr>:
>> On Friday, April 8th, 2022 at 13:28, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl> wrote:
>>
>>> On Fri, Apr 8, 2022 at 12:01 PM Simon Ser contact@emersion.fr wrote:
>>>
>>>> Is amdgpu_display_get_fb_info ever called with NULL tiling_flags/tmz_surface?
>>>> If not, there's no point in adding NULL checks.
>>> It isn't called with NULL anywhere, the NULL checks that already exist
>>> seem redundant.
>> Grigory, would be be willing to submit a v2 which removes the unnecessary
>> NULL checks?

