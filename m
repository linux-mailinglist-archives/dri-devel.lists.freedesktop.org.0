Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 372A57791E7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 16:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCF110E6A5;
	Fri, 11 Aug 2023 14:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E990410E6A2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 14:31:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJOJ377EbPI6vBes/OydUUT1ijlfh2ziosDKB6vB9MBtaAj+vuUDDJfVnrv+ABcKnXktXCg+4OpqoffVBvUuCiC4rQmJkDJWV5JoltY1kNtZDwyfOMJJFHQDqSaarK/tP4LAtwYdY5zo6BGOhsdttMhmXwq4h73jtlC5vYXy+vuocsreyjbay/4kw9flBxI2CR1GA/yMlPYkPlAwJepThlPS6fVKOXJmn9WYWLny0crO8OrlD/xGbntmxjSuXXVR0rPjKQ5meP4YIU9kT+jzZ4guGhcvQaY/e7nRjAqMyhp/R18TtaTD5JrELYhtsc+R10ezNY2aIebAuq9Ghs0FMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtLbGvRp1Oxee7sjL/QXYdJSFpb8EUs4GfGOdw3yvFU=;
 b=ZDx/Yvcc8NAolJrb4qX9JnTmjHuv8hKynemV+NqaDEZjMpywlHOF06DeZ+tzmdnsEUnJDu5tl4J8kG9TJq+BEVoID1V1Q1m+kVQMyArXmpxUfbwwcIR2Poih09qb04MmQGSU5YOqaO/zthBtuuEW7AuFn4cIU/xGq/O1P3sZlZ8LagjWmApa00EZvxGrXUnHqEeSf0ElgvasRsMk68kN/L3SoDgjKcaPhInIPhSF/gdprSOQELEIDSu+61ijk192BCBndqd3hVMyKC2bFS6c2ynRSTj9vxQ3IYo3T+j0hODJi/Tlqht3sOgCgBbbKwL5jxGVFESQ88e2P5gxxgIHoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtLbGvRp1Oxee7sjL/QXYdJSFpb8EUs4GfGOdw3yvFU=;
 b=Ox6qa0W94E+t/2zrysKx53dZ7gg4yf3AcOrzwETusqAitesdG2y8DwETCsAbCy/Xn06m+i5RbTp9ravKWtZEWgDtOFdUYg/Fx/XzIjkWqGCe8OuKJHHv/y2dTXXYwVwHWiBMaP8oIPN/zUN7RSkZHlxkx+Zo6gnoRNa4fmqxcjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5774.namprd12.prod.outlook.com (2603:10b6:408:17a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 14:31:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.028; Fri, 11 Aug 2023
 14:31:09 +0000
Message-ID: <54cf8068-0ad8-a5e0-a95e-ab5c527127d3@amd.com>
Date: Fri, 11 Aug 2023 16:31:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next] drm/ttm/tests: Require MMU when testing
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230811113649.697886-1-karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230811113649.697886-1-karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: deb0c0a0-9a01-40ca-413d-08db9a779ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hwgku6x2XK1MIYBG8G5tRiDUwQ+83/UgIxGhmG8+4jk6nMJswty3CQtLGmfbmw6jZ04A1V+RXcZXewWnfLXqw6GS6BUsIkM96yMxve8G3ctBf6Tn55lt2tmzWuJj/m46A8/ZzoExGxgD1c+l8L5LKh5LkhEwx8OBBtLmAE0s+C6cWVYBf1z5fF0brXMpJL3wVwk8T5b4U15G3e8w+XGbR7yapNQN+YLiqUhv6YjDxMNS5/6PqtIYVVdr2f+4iDNiNoCsLkEWrrj/eKIGdW0TICHPGrOHjYO553QLYZ+lcWad3lUCrmsXTDJJPjAvpFRP4uFLVWgz2kELpJCt8JOsuJhXRcrDEsaYCVydmQ53NKKnS0u4AGp69NYtVeipWMIibMW8K2vZGOBv1apjohZn4Hp1BBjp6t6swgxV4kGKp5gQMDSqxvVvZ6Pv/Zwjb4ftcGoLHY0D8rvFjLlcs8qZSJK9g8FpAIQKA0hYFEBNCJjejHJlFSNudPQH862SBK3H97jn7EkmQ8g77VX8KI6sYWr3RIYsy7D5vsEPyAXMkFb8m0yQKzHH4bX3VR1giX5tdsCbIiAVz5gHvU79yowV2nXS5pr1fk5l9WdnF55Gj9ldNDEq1tZ91kr97C3W8ppeyZ6n71UTFlDTLqKfqgV9vnCw6FhFtkJRc7ajojF27ZxoCfmmU8Ap+eufn49cOmAP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(39860400002)(396003)(346002)(366004)(1800799006)(186006)(451199021)(31696002)(36756003)(478600001)(6666004)(66946007)(66476007)(6506007)(66556008)(6486002)(6512007)(4326008)(316002)(41300700001)(2906002)(8936002)(8676002)(38100700002)(5660300002)(86362001)(83380400001)(2616005)(66574015)(966005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUI3eHhuejl4TkhiOFlDRXBzZVlTaFNoNTJvZTlPUmlNc3VRS2JLUm80WU9C?=
 =?utf-8?B?bmFUZzVvQkJvaEltOTM1VFZLWkNocHhxcXlCd0xaRjJBVWxqQ0pEWDY1MVFh?=
 =?utf-8?B?RlcybEpQejI0ZjlFczJ4eks1MTRWNDFzbVppTFczY00xQ1haaVl5Q1JkWERt?=
 =?utf-8?B?OGZjL2sveGp3YjdxK29GN2d0djgxT2hDVmhvZXFkT2ROVk90T01jNjBjR0xP?=
 =?utf-8?B?RW1sakdKUUY5L2czYnEyV2prQjNDNEdhVXlNcTdBYldQK0lJL2gwWGVwQXNN?=
 =?utf-8?B?dWt3a0ZLS2xQNmxrT1N6MHU1SlJQRHN2WDZ6ek5yYWJtdHVyekM2N0I1SHVj?=
 =?utf-8?B?YjZ3RzAxQ3JEemZSdCtYeU9nQTNiczZQb2JERWFXMVoyaFE1VkF6em5nRlFN?=
 =?utf-8?B?cVd5UTRzczlPTW5Ha05vRjZzS0lmNmlnVUo3VEh6OVc3UnhEWVB3NVlpTmRy?=
 =?utf-8?B?Wmg5ZDJyQytTbm55SlQvN2FNeEU3SXAvYU1HSWlEc1NkUXNMYlByNVp6bWts?=
 =?utf-8?B?UUZpeDV0ZWhzWGJkK3JzUGtrQjltVzdNbE45bVZMTllhZkdpcUozekZlQU9C?=
 =?utf-8?B?M2NaVHMrN0t5bVNDbnNYaFVnMFNmaHdSTnpXN2Ztc3BnMHArZ1lyamRTQUJh?=
 =?utf-8?B?TmdJNm9GUXVab1RzWitGbjJ2V3F2dFhkSWoxaUh5VmpMZEdCeWRoVkZQb28r?=
 =?utf-8?B?dE5HMEM2b0hZNEtTbEo0aTlETWJ0Y3B2RWtFL2s5OW9JT21rYm95Z1V0dEk5?=
 =?utf-8?B?Q3RHb1U1WENpcEZrQ2IxVTQ0OHBqRVQ4bzlXUVcwUktjZlg2TUZwUGRUdTBU?=
 =?utf-8?B?NXFERFdEYTM5UWRoTWlkZnFxdEZkSEhJTEF6Z25RRVNoVnZ1N1haWEpDaUxk?=
 =?utf-8?B?dHRMZmVZNG4xaVFLWFpSbVkvVVpjQ2pjTlE3b3Q4SEZFbys4U1RNWjQ3SEdx?=
 =?utf-8?B?Y3BRUE50cUNpb2RjYkZrSkcwYmZZYys1eitSVDZsYnZvOXB2Z3Ixc3FmS1FZ?=
 =?utf-8?B?YWx3enJ5RGtYTmdTTmlCdjRKb0E2N3VCa21URU1ySnhXRjM3UEQ4bTMrK0xo?=
 =?utf-8?B?aWErV29yRnhpbG5Tczd2YjU2OWlFaGtZdmdaUkRMUnlGQ0UzeFRudC9FTURL?=
 =?utf-8?B?a3FIcCtEL3dyRS9HeldFQW1JRFRJRGNXaDIxY2Y4eWErYW93WUNna1JxWlRZ?=
 =?utf-8?B?K2luYUdUVzhnT0tOR0paeGdSNHorbDBtM0ZSN3pvbjVBYllZUWE0S1NxTTM5?=
 =?utf-8?B?RGJ3b0p4VXV4Q2dxdTkxS1NiWkwwU1RsTlhiOENESzVVUzl6K1RrTCtZeW9p?=
 =?utf-8?B?Ujgvc05BNnNUN09pWFVJTHAxcTEzZDBDSk5iNjQyM1Zjb0dKUzN6bE9oVmh2?=
 =?utf-8?B?ZTd0YWgyU3R6Zm1xam1wVUJTdjVqUll2OTBkeE56K2p2TGw0UEt3R2F2ZzNw?=
 =?utf-8?B?UG9JQ3B0QUR1bG1POS9RZUVxV0JFdndTaUF3QnUyZWRJM1R5VGtxRFN6Mkpa?=
 =?utf-8?B?eGhvbzFFalR6OVIvOGVCZmZpbUJ4clNtKzRKVkwyalR1SnN5bkZxaCthK1dL?=
 =?utf-8?B?MWZRa3YzUmI2N1cwVDdCWnJyc0ZBWUxPWTdES3M0aXdDaytNam4rTmdwK1ZK?=
 =?utf-8?B?aEFKMkVaL0ZtSCtKdXJHL3FkSEJFRjFTSDVnSEVOaE90dERwUCt2UUVzcDZC?=
 =?utf-8?B?QWRpazF6bWpNVzdzK2d2Z1l1b0xieXlZU1ppNTljV3dMamFRME1HaVhybGI3?=
 =?utf-8?B?KzRGY0lYVmQ3alB3NnB0VllxRXM2cTg3bXcyc0VoUTZkUnJUL2dYN1hEVEVH?=
 =?utf-8?B?MnNJZEpnMFR2bmpBQW13c09PekVmOXJCMkIraUFMT1pTYzQvVmRYTlQ4M1FX?=
 =?utf-8?B?UHBibnc0UjNqMTFXTVZhaHNyRENDaDBkVFYrQnQ1Q0dibUZRZ3drVlRkOTF1?=
 =?utf-8?B?eDJLd2JNdzNwYVA2UWJGdjJGdXNKZk1NZzJ4Wjd1WnpDSWJFWld3cC9FbGMx?=
 =?utf-8?B?UXpVUGZZSk5nUFNtbEtBQ3VOMHltS3owK0Myb29LVHF3Sjk3Yi80YUtkT2lJ?=
 =?utf-8?B?cVBmY2NrVGtLTkJaVFByc1NFRTBic0h2endSdTlEeGJoemM1U3FPRlZqTExa?=
 =?utf-8?B?S01xZU43MHowRmN4R051YzJJVmRkS1JrWG9ad3B3Snp5VEVuQnV3WFNaYTVq?=
 =?utf-8?Q?FbI+iPx9CstGYuVRPQDGjFe2+WYmdJQNFpcgTvVzY+zM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb0c0a0-9a01-40ca-413d-08db9a779ab9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 14:31:09.2925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20b5Mn81bBsgvVCLWZCR3boZsMR/JuTBrXXah1Hdxo2nLM92l1NzzhACp4UJuKy6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5774
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.08.23 um 13:36 schrieb Karolina Stolarek:
> Satisfy MMU dependency when testing TTM with KUnit. This fixes
> compilation errors on platforms that don't select this option
> by default.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308110133.f0lhFwMV-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202308111032.enU8IisR-lkp@intel.com/

Reviewed and pushed to drm-misc-next.

> ---
>   drivers/gpu/drm/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 9d1f0e04fd56..ab9ef1c20349 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -198,7 +198,7 @@ config DRM_TTM
>   config DRM_TTM_KUNIT_TEST
>           tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
>           default n
> -        depends on DRM && KUNIT
> +        depends on DRM && KUNIT && MMU
>           select DRM_TTM
>           select DRM_EXPORT_FOR_TESTS if m
>           select DRM_KUNIT_TEST_HELPERS

