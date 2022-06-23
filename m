Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6670557E43
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 16:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C481910E795;
	Thu, 23 Jun 2022 14:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95AA10E660;
 Thu, 23 Jun 2022 14:52:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEKUZTfh5dhzQ18NXlbsS3oDlpHfEzhGwdFqtEkzOQiC/4pQg74JIqyWJJ2OQFTgqbiQu2i4pBZUXZ7fvDJdjBhGucVaOSCDWCJEaxP15XY+YztWF9mt3sWZSToH7Dc54Cn5Q+lkt+FDuVToZNMuHwPylSdxGhx8qsov6MPV3cFIiT7RYsTrcG/uBKs0E3o6ThlUdtf83/793o+DfLcW6sFJ8Vq+o7PP/5hLa2O0N2UcZHyAeIuW2tF3RJMaP69Pt0i+lCzFhVDxeXmDPndrNyoS3Wo1jqLgPLQoutwEyV+V00yyGqzhrb2ZMW3wrEtyt9LeVFkfPfogrnfdU+Xtsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llACLzCNa+nFLaQw3lQ5YcAt1ld9VBfrvAX4CnLdVXs=;
 b=m31wwQHTuVsws/kKhUBSyV2u7gEcR5pP8/f9O/OxnWXVvFZYHmz/49LUgR8QYOHJ0zZ4vvD65CsXrn+ru4UdUvp5ONZL1/zXraeHSSIcZmIJrzXVL1W0SDYWsBjBmCxlPAalaT0cTHu5JgFlfXvFTuo9XeGf7BrVVd+xXxomO6DBEzJZmZuokNahFaXZ+yFUXgUuBl6RLfrGohb5vVS3f02L7n5gr91YHi84wrZ1iigzUq0YBg0Hjinct61y2NDxGpKsIu7ONgZ2WL+bWcrXZDtE/b+qPdCMNmOmP1swYZ1HzwfIrkkNIEMq6uZm/1BvgmxJfBah/panaIf0yZsoNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llACLzCNa+nFLaQw3lQ5YcAt1ld9VBfrvAX4CnLdVXs=;
 b=LZlpmhsVD1rRmjvTnD0+WPKVR2E57SdwhxSms+kl7/umoa9/utq02emCRUuQtGNMpl65LXza3Z4aZPgrayaEQbLaRSKJMHVTzuh33qbcKFAYQEexHwEltqcxHDrt5qn5tdzO+7Sh5QQvL4VFb7QzcCvK4csnO7caxw2Aao9jplA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1888.namprd12.prod.outlook.com (2603:10b6:300:112::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 14:52:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 14:52:15 +0000
Message-ID: <5c5eec72-1dfd-4f66-c162-1556aa51ec9e@amd.com>
Date: Thu, 23 Jun 2022 16:52:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 10/12] drm/i915/ttm: handle blitter failure on DG2
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220621104434.190962-1-matthew.auld@intel.com>
 <20220621104434.190962-11-matthew.auld@intel.com>
 <142c82a44dc1ea6ec1d501d783679c3a513282b5.camel@linux.intel.com>
 <27334c5e-6ee0-361a-cc93-9785f6c7136f@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <27334c5e-6ee0-361a-cc93-9785f6c7136f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0089.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f83bd56-baec-4c71-0ef2-08da5527f61e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1888:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB188843BB65FB7098842F5DE383B59@MWHPR12MB1888.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RdbSQfhnP3wr3+jEuys22RUX4XBN+aYzqjxrwlq9zhCXuUeIVGVoAu1tSLIpE6b51NKlRx0Yu58BNjr+F3DhqWO6JvqH5q693+k2MyKJKvZJ7AKkgXzcDYIu5ULpb1+P88BnVwM9s33PeUkTkX3YTeUtHR/qci1JOih8Ttgun6f331aMPc9Lr/wH+VnLKWNRrlgtbvTK21dVXTLinfyqFCc53xm7qCZejA65w07rzoy6N/XI2rsn+aesl+OAmKFdyvrMLPfqBS0poj3EM2klFLZF6iQUpLOveBUFCMLi5D4gCI9sFFLM2+wPizw968Q3v1k5PzIWdmgFoOm+h+pjNb9nGRmkTgejK+EWc7Tv3WLPLe2MrTK3sdefmB9iFBe/jQa0ss7XWnCjIagQh9tKzpbgSDOF/OnCJThENfYwZwDS7aVWGhNRz5xxzm1JQOl6ZsMJEewmbiD1PzlKMYIG8arhBen+hLcseYStQYv3rzRWKGq0Y54j3urfS9JAq488funcSDJEgo/AAd2fMiPOmepr69Scsm065m+qJnCoj4Y8U8+TKj/erffiGyF6N1sIanNzRBrutESq5eW3LHvahToLREMG7UA1S+JJR7X8+mADggHJhl4vajZvOKR3d8EXpzIxo0nx9l5Kw7xJpcaYLjw+bh2uAWPGBq4FE0UCFDOFu1oIynYBAbSnqBDH25vucUiiwUG/h1VRSyrEpUf5XC0Ig9HO43CqB/ExtHOtmTf4+uHcEKOuVGs6pAJOlcvMOC7U6yPQve6kJqxl7DRZ/Y4mRMm1WcoNoDqLTPWwcoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(186003)(6506007)(6512007)(2616005)(316002)(8676002)(6666004)(41300700001)(66476007)(83380400001)(66556008)(38100700002)(31686004)(36756003)(7416002)(4326008)(5660300002)(4744005)(66946007)(86362001)(478600001)(8936002)(2906002)(54906003)(110136005)(31696002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXJvcURQckVmYnpsMTUzcHcwRFNRako0WVRXQmswc3RvbDgzc1ByN3premsx?=
 =?utf-8?B?VHMyOHhEOUgzODhuM0NOeVRtS0ZGTGQrNitEVjZIU3R1bjA4QmRhZGNSV0FD?=
 =?utf-8?B?d2Fnc1RIQ0FTeW5pcUM3N1dYTFNCUjVpRjJzYlprL2pNVG4yRTRwaFFDWXh4?=
 =?utf-8?B?Z0FFNFN6MHNTc3ZZQ0pENTI3c2xBSlFxUU1KOWhmZTB6Q1RkY3ZIL3ptZ0hh?=
 =?utf-8?B?TEtXVExRakFrQ1h1RVVPaGZkVDUvbDZxb25yRE9SdjY2b3I0Nm4rMXlqaUFB?=
 =?utf-8?B?UGNvWEFVcTh2elhLays5amNMOUkzTWc3UVk5dEdsWGFGTXlRR3QxSE1zNUVw?=
 =?utf-8?B?NG9SSE82YUJKTGVBZkt0TmVvZ21VZ09VTkVMYXAyaTNWYThYbDNqY1RFZVBW?=
 =?utf-8?B?MGlnNnNTM3U5aW1CUmJxNGJ6WmN0T243YTZWVGJERFRMaUV1TFp5empEMUph?=
 =?utf-8?B?NVgxdllDVUJOK3AxbnlQRWpXOERhbGNzdlRjY1ZBMFdnaVhXck1vUktGcmFv?=
 =?utf-8?B?Yk9yMXo3dktGVjJ5ajBZakVFZ2UrWlFlclhic1NxcE01STR5d3hQb2pZTjBs?=
 =?utf-8?B?VlRicmQ1UGFZYW1qdWdXN3NkUlJxSjZVZUlFSkVOSDlrNi9iaDdLK1VkckFq?=
 =?utf-8?B?OHM4TmRtK1dYc3I5Qkx3N3BtaGFKN3psS1dmelZwNzFHWnQvMDU1VnlHVkdT?=
 =?utf-8?B?QktLZWFIRCt0NGZ0VGdxb25sYlk2VEZjT21VQ3RPS0hrckF4YmtZNDhWSEor?=
 =?utf-8?B?TDQ4NGJsV2g0dXJTWTFPdGhXRituQWk3dkZ3UzBjU3R6TlZSeklpbERZZ2Ju?=
 =?utf-8?B?ZzFFWlI0dU9IQi95VXpZd2piSW1DMHQ0Uld3R2NnVHB4Q2cvbklOV1BFZko4?=
 =?utf-8?B?b0xIdG9zNmc3MzAxT1ZRT2ttVUcvdFEvb2lrRmY4SFR4bmlMV3lyLzhKUFFi?=
 =?utf-8?B?VE5uV0t5cE4vaG9ocUhydlkyNnZ1R1VqdGtNWHg1blVPeTYwcG03b1FQQ2sz?=
 =?utf-8?B?MmJ5UTBDRFk3RWtUSnBnTUZmejJkTGZQYldZSHBabUZWUGliZkU1d3poSGdS?=
 =?utf-8?B?ZGdyQm9SUWdOUzBlZDAvQVB2STZkSVE0Y3o5U1R0WUNCUWc3T1BZaVAwaGY3?=
 =?utf-8?B?R0U1UEJ6V2pLUStVT3doa285Uit6WmZQWnNKWlhSUzhkSitjV2ptODRlRC94?=
 =?utf-8?B?K0JFMFV6UTdPcVVpMzBRUVcxV1FDR254Q29jQ01YR1hCZUlSSjBaYVlMV3Ez?=
 =?utf-8?B?blBnTjI5RDNxSEpsZkZXU3dRWkd3NEQyUW5paGwyQ2w2OGRWM1VOZlIyUTRl?=
 =?utf-8?B?c3o3ZGVUcExraGxmQkNGekQ0K3FUWmRXeWUzWkFGYzk0OEtjMmQwMUowSTFO?=
 =?utf-8?B?WlpCMHllN3BwcVhnU0xCKzJsVkpFVlk4dnlGSlliTmhVbkdJamMxK014Njh0?=
 =?utf-8?B?VDdKQlJ5emFxU1JUMXVEQ241NEpobjFTOTk4OHFFd3VvNG04U3FFUnZMUzE3?=
 =?utf-8?B?YXFQUTgvSE91R3M4NG9sNVV2bStMeFBXbXNVcGJYc3R1RTYyaW5xY1VEdU5N?=
 =?utf-8?B?V253SGhpbE5rejlRLy9ZM1FoNFJKTDBOY2hhK21tSnc4a0Ezekc2eWoybjNu?=
 =?utf-8?B?OGR4UmFvbzhWVTR4anlIZGpvdEkwRTFqUG8ybjkxVTZyRDZ5NDR1d0EydXlZ?=
 =?utf-8?B?aDNMRzVVL0NDSldJU0pWT2ErUklubldtcHJnNmFqbURFNm5VOFVzRm9sQUly?=
 =?utf-8?B?MzNDSUhGWDhpUk04WGFUNm96RTRkdk1zTVpqbytWVC9LLzhHQ3hLMDkxak9u?=
 =?utf-8?B?UHRLL2xLOTdhaUhWczFyVWtWbkVOVFo0eHlJU3BKWXFITW5lTThBMUNidFJI?=
 =?utf-8?B?dTVOKzVmbHFtVlA0cWNhVGk2QitKZkFVUkJJREEzUmlWRlRyZGJ4TDFtU0tU?=
 =?utf-8?B?dEw5UFAxNEJJWHhTRlZkVkswcC8zVzEzSjJYQzdpRVpLMFZnSlNES2U4YTJW?=
 =?utf-8?B?VHB1NGpLZWhzNmxYSi9lRzZndGM5NTRXekYzTm9uQmxnb05kS0YvSmlIUTRu?=
 =?utf-8?B?OXNkK1pKQVNMbWJzdFVUSHBEcEtndkcxb3VINjFyVTB1UEFtZzcvMVRlMVFp?=
 =?utf-8?B?Y1VMZ2w0K0VkNVBNZzJPam9OSmFLTVZkV2Q2ZFVBVy9qU1ZkaHcyY25YcjUw?=
 =?utf-8?Q?KUjSQMoP7OxRy9NW1oG+IgQ3KcFWqkh0rA0NZjwJknpk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f83bd56-baec-4c71-0ef2-08da5527f61e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:52:14.9784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afI8kD8+06DgJnkRkSXCMokmxJD3A/tPEc5AcvutUiftnLg+OEPPyhuWNBJNjR4E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1888
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.22 um 16:13 schrieb Matthew Auld:
> [SNIP]
>>> TTM_BO_VM_NUM_PREFAULT);
>>> +               /*
>>> +                * Ensure we check for any fatal errors if we had to
>>> move/clear
>>> +                * the object. The device should already be wedged if
>>> we hit
>>> +                * such an error.
>>> +                */
>>> +               if (i915_gem_object_wait_moving_fence(obj, true))
>>> +                       ret = VM_FAULT_SIGBUS;
>>
>> We should check with Christian here whether it's ok to export
>> ttm_bo_vm_fault_idle() as a helper, so that we release the proper locks
>> while waiting. The above is not a bug, but causes us to wait for the
>> moving fence under the mmap_lock, which is considered bad.
>
> Christian, any chance we can export ttm_bo_vm_fault_idle() for use 
> here? Or is that NACK?

Well question is why you want to do this? E.g. what's the background?

Regards,
Christian.
