Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BEC50644E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 08:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DEA10E7CF;
	Tue, 19 Apr 2022 06:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE6E10E7CF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 06:16:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqWDjRAPwjJV2EE454+4FrER+B/Ac0o+Mss1pq+ZpcInY8+9O5rQDMo/Ewg10AYDiy3SsRJ4eGkX/pcqNs9TQaNiqQFoquk1iV3oinOMo43/I3uNLZI1JqIxyj+mlDEJmDHS/ure0oX/CY3yGre0vIdo3nz9i99q2+sdSY1zRMt+03TTBxEuYanfBX7XUzCvtUetbM3X3PwXOV7MwKsTscNrLuYrlaV82eFYFbm53epbZtpfyBzMLOE6KGklZvI467lR2X/3EMZevIn7U+VUWTCGBmCVWj6ovLEB4HOZHkjx6FGdOb32TqsvB8MK4rtab0wd3kiPy4123+/6Vv8ywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nLJ6PJwK5kCEjH6fVNgENFbCvtirzXV/4DQQIQ5KWg=;
 b=N/mtDAx4X/uCNdplqUxtpYkWVsF118lDdwbKVf6dxp+UDoWJUDEoiVN/WcfRoact/QdGyhGSW/5jnsNnyPOQXCiaav9vejE3qq5ndv2cvPhKWnBbnwoHBrcQyEqDQGwXaG15bpuBCYMhgU3hao8IqKurm7AOjJ2uu9optnVvbuoXqTyz6qPzGW/oAFDsTHcY1cGEuXkL0FRbByHeHrOE59l15iGZZoi3KfGfsogA2YXRjRXyPvXYt/Xj96TFQTjRGkpqq84YcuqICvei55W9BwFc6G++7PbO7uIc8w7MCGA9blbydwi42ll8dsSI5kXKNyffcllGUBCbDB9ydVsNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nLJ6PJwK5kCEjH6fVNgENFbCvtirzXV/4DQQIQ5KWg=;
 b=qAL8Bo6eLBAwgz2fhIqIha16gMihoOmrqglZFvl+3mJUyutusPDjVtcPXv0zkaec3C3xnByM/Rd9qQoIe4jMA+6wEUvEuFn4c0SAOaTR+tC4Qd/YSa0mfgMrDyXUYVwuQKsOlDCN/wcijuWX6r5WFMFNhjNRl1zNinMFMsdfTNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB1482.namprd12.prod.outlook.com (2603:10b6:4:a::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.20; Tue, 19 Apr 2022 06:16:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 06:16:31 +0000
Message-ID: <e3f87068-42ec-c240-db34-15afdde31b0f@amd.com>
Date: Tue, 19 Apr 2022 08:16:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/5] drm/ttm: Introduce TTM res manager debugfs helpers
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20220412033526.369115-1-zack@kde.org>
 <ce6b5402-c7ac-b382-f7bf-1581afa59322@amd.com>
 <7a371fee4378221e0a68bfcf928b0c0ffc3cded0.camel@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <7a371fee4378221e0a68bfcf928b0c0ffc3cded0.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0128.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e4e1f7d-3333-4675-7e9b-08da21cc256f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1482:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB14825F6DD24789DB2CDB76BC83F29@DM5PR12MB1482.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RihLy5eE4DEOZ9jrHZkqK/bj/bam4p+O9ztlFz1lGJV5uXdHfW4TGSbHRIE78UVPqzK83Y+t52sBz9GIK73fQB1PDwjtJtijnXka6NfN8Morjp4zT9AI5hOLHpNS2UI4mDwqL2Wf1+KU+ISyykkdIvPo6feYIH1qvVVO5oja+gsTjepqHW9Z8q6MvX+xB8bvuXT9GOuALJaecr+xVE36f8KM0fs5eLZoIfzl6YYDmWg3Z8sxxIq+KCyTNuBMBRm3tZxK04rnYf3wipB94QS23ZNifxU9xr0YlF4+kqNEqERHvhY7p9ZHO9raZuEce5DlJkphvp8cm6XwdyqKV3avmYZbERTGe0G0HQcHeMIzsVqLp5nBNUQiWy0CX3rPZlYgFziZ2Ivn8pjFUichxQ4Xy3h0W4HnbmkMrX3lwqu4FmEx3g12yKAl8zoVrRAss1R2MoyhEiCaKO6G6Lq8Tlpt9LTySUPG5y06Syq7kasLVfB1+KdmzJy86KrySQxObfrWKWATIXjMceeqau1ivYBPxxewY8nPZUN5ygCNXA8LHSNEJQGSY1Jp/F0rlnue+KNSNGrMktR8v1KjiMY5UM5WaCesuwlgiAqUl4VJzyQS71aehZx9y6sMcPzFquQH0UW8ubuh978JgcPkAjhorWtHbPZhManQHoXRMP/vffazY9ymn8P75GRv+4Nqtbi4TmjWzrhEN0jnThhUZG5PZc3dUPSUne1PgRG3vjldv7m0NggUfs3XyFCBkQzy4O4gbYCZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(86362001)(6486002)(66574015)(6666004)(186003)(6512007)(8676002)(66476007)(66556008)(508600001)(66946007)(8936002)(4326008)(54906003)(316002)(2616005)(110136005)(5660300002)(31696002)(36756003)(2906002)(4744005)(6506007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHpLMnZWSTV1akx6aHBGbEl6TGcvajRVTnlERlhRRDdqaEFXSGdrQ1owRmhW?=
 =?utf-8?B?cHJXTC96QXhxWkV1ZUVDZEZ4NGYzU2wwQ0lXWG11WVYvbUhNc0NuTkxRRVZv?=
 =?utf-8?B?SkRHb21vaTl0SjFzdjFXeDJJa2x1RFd4SldmSld4SU9jQkN3UGJaNytmcUFp?=
 =?utf-8?B?L05QM3d2TjNZbEtDcDlCQU5adzhxMHd3aGU0OVp4K0RXSFhtVWRveGd6SEth?=
 =?utf-8?B?U0llcVpLSGtCNTY5eHF0WmlyQW0rTU1KMzUySWdxWVJuaWdWNlhUTEtKSDlD?=
 =?utf-8?B?TGUvenVYKzE4WmxGK3ErcUZ4QVRvWFdKbzQ3Q3B0U3Blamx1QUFCRU5oSFpO?=
 =?utf-8?B?a00ydXI0dmZUdGh0MHR1Y2dQZUNzaVJ4TmQyMFF6T3cycUJZQmNka0pQSjIy?=
 =?utf-8?B?VUFuSVd2S24veThqQ1VHbGZkcXJLbDZTTVRPdDExQVl1bTdpenVncnR0SzV6?=
 =?utf-8?B?bitXd3NVUjJLNG56b0VOWmVySUh4RVRNUTBMcTlKeC9tU3ZtSFZlWnhHSjY3?=
 =?utf-8?B?WDBTU1dHS2xET3lrM0ZFU0JGZEdQMXp6Sm94b1ZXTHV1S3d1MmkrVTVYSFVy?=
 =?utf-8?B?N2taLzhmQ0lFTkl5NnJlc2pjMEpBZHMvNmF3Mi9tQXMyc2JjZ2RXZWpnQ3dG?=
 =?utf-8?B?V0VVWi9aMlhQZ2g1UXlGaFlLWE5SVnJIcHBqVEF6dEZCbEtBNG1Ec0pIMDY1?=
 =?utf-8?B?R29xbzNuenQ5M20xOEpNVmxzS0RhVCtDSjE1WU9kWGNLeVR6QW8wWkNCeGhG?=
 =?utf-8?B?TWh5eVVQNHVKdnpHTWtUYkd0eDRuQlY2Vld5ZC9kUktiazA4RGY0cE1rZmND?=
 =?utf-8?B?dlFqM3MzODZKMDJBTnBkYVZ5dGJIdGF1djR2bW85QW56dDFxUkk4ZHF6NmR2?=
 =?utf-8?B?L0lRbmRzTVRvRXNRVzZUNXdla1F3OGFHWkVHN2JsbWs1bVdaem1udDRpSnlB?=
 =?utf-8?B?STVnTFBwUFhqY1YvOXM4TjJob2pvNDZ6d3oxRi9mOEwyNGxybElMNU54K3FG?=
 =?utf-8?B?U2R2ZHFnakZXajY0RmhSSFR3akI1YXEyeFVxSHF5TmkyTVNESDJOcWVTbVdn?=
 =?utf-8?B?Nlp6SHhCM1pXbGV0YzFVWHBzeVExY0JsVThZTGtnaWF6VFUyVkROOVd5SHZz?=
 =?utf-8?B?ZEJMVUJraFI1dG16Nmw5WGtYWTltRlJkeiticU5KaWwrR2NxbTN0REZ3dnFj?=
 =?utf-8?B?SVBkbmZSWUJnNFZXM0hVS1VkM08xOGNCczBZVDgyTWhPcmpZNEc0QmpPZnp2?=
 =?utf-8?B?V1pYbGVUZ2lyNjg3bWtqaGpEVGs0eDRKVGZxa050MHJFcW4yQkpVeDFsNXd4?=
 =?utf-8?B?Y085YjJ2THhqMnhGTmZSQVkvVkJTOHJYR2NZcjJQTmJjL0ZldS9pRmlkM01L?=
 =?utf-8?B?ZTFmaU8xNVJGczJPNXl6QkhReWpkbGVMWjBrTkFJelpZeEhYa0pkaldxRkRF?=
 =?utf-8?B?WlM0WU5BWGd2ZG9veTFWRGQ2NU1tYVNWeHovdjNzREZkV3ZDNTluTUR0R1U4?=
 =?utf-8?B?b3NYZHR0ckVVL290TXUrMWxydVRDTlRmRFZ0OXdkZFVCNW0vdXpIM1dqTG55?=
 =?utf-8?B?aHIwYUxsejlUeTE4anIxRTdQQU1OQmFISTB4NWxGUk1DSVZhOFZRR0h1Q3pu?=
 =?utf-8?B?NWVEYVBvTXJ5aER0REFnNGxJT3JyUUdNSUlZWVR5eDhpQitLcHJpMzMrQUNx?=
 =?utf-8?B?bXhhUEFldmRBV3lGeXVLUTRIMUEyRHI4dEVXMDgwVGI4R3h2ZHlwS1RPc3NK?=
 =?utf-8?B?blNFUGFuRlRKaHJhT2JhcTlqanBjajlSUVpsb1p2ckRDWnFJTk9mV01WeWlM?=
 =?utf-8?B?Wi9UV1IwTEdkU1dWYWEvV0FJcERGVTlVTElFY05CMkdBZmJVR1kxdWc3Y0Nt?=
 =?utf-8?B?cFhzR1NrdTlvOXQzaWZTeTl0M0E0TjRwNXJXSmkyei9VcldpYlFqUnFoMlgx?=
 =?utf-8?B?RWl6R21NcDJZUkFYbDg4cU1xRXd6ZTQ2NS9tMzJlcE5aTlFaU21EK2VpMFpu?=
 =?utf-8?B?Y29SeDBvWE5GVkt5TlZzSVExUGpibEZBVFl2TExlbmNPanVTckJVdHcxMk5C?=
 =?utf-8?B?MmVCbU4zSklUV0NUbGhLOEt2RUlkOHFMVUFRV2M4ZGp3eUhjMHhJUVdHMTNw?=
 =?utf-8?B?d1ZYWGhLbTRpaGNTZUorUU9pdEFnWHFkYWJIQlVQVkk3dVNMZ3UxQlZTaE1a?=
 =?utf-8?B?VkcwU0NBMjZlU2ZkdXNiMnR5RzJzMmdkQVd6dHRhMExNQ2ZSM1pXM25jbWNV?=
 =?utf-8?B?L0p1aVVlZmIxUDhUQ0Q2SVZOZ0FPRFZOSkhYOFdJQTIyc3ExTHpucFB2RFN0?=
 =?utf-8?B?WXZUbVhsM0M0NGNTMW03clR5amRpbGhOQmtXYjdFL1JBSDRjT3RrTCtHSmxF?=
 =?utf-8?Q?q9k7OrHePxMOFyfWSCRVlSLx6EVtBH1+h1OhFvjnZJbNB?=
X-MS-Exchange-AntiSpam-MessageData-1: 59sroFJ/23QH+A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4e1f7d-3333-4675-7e9b-08da21cc256f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 06:16:31.3486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bqwz6K6XUYznzkNiRyaj2Esc3ZUiAMuCLX66UoenbGc0zdE0GBNOfp1uIQ9FwwaO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1482
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Martin Krastev <krastevm@vmware.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.04.22 um 22:09 schrieb Zack Rusin:
> On Tue, 2022-04-12 at 11:15 +0200, Christian König wrote:
>> Hi Zack,
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com> for the
>> entire
>> series.
>>
>> One nit pick is that I want to get rid of using ttm_manager_type() in
>> drivers and use pointers to the members directly. But that's
>> something
>> for a later cleanup anyway.
> That sounds good to me. Let me know if you'd like me to hold off on
> pushing this until the ttm_manager_type changes are ready, otherwise
> I'll push it to drm-misc-next tomorrow.

Please go ahead with pushing. That's cleanup work which I will throw in 
when I have time (which rarely happens these days).

Christian.

>
> z
>

