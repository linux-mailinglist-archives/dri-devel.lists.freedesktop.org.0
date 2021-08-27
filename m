Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 411453F9AF9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 16:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5A36E98B;
	Fri, 27 Aug 2021 14:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2079.outbound.protection.outlook.com [40.107.100.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4276E98A;
 Fri, 27 Aug 2021 14:40:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILkixL3XdsUTA/ORAYbmfB6PrSOcRqfiRnWZx3hZvJMhGQGWJJqd9M0fXXHAGIL+i0NMcQcUUSv7ole/jEO51N2YcPZRemUZf9yWrc2+dovSEsG+MaEQQZeITXQFhZI/0GtNWziOdeBcLtIWTd59QQm7eQGbuRYUEk4WqJVBjO1RlvpppYnwdaJGFEME2WmMpemJRZ1ECHQ/VpusIiE9BiMcaUV5ZC67ZhW7aKczCEf0Z6jjNtwzNliQw3/yJlj57lHIfhVOM/moSGGY/7mO2hysrpYzKRskUe+JQWnE2Waei6xLcZCbfMYn+dfl+bt2Coob+jCJUYGowkWVD6mrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZI3I6sJIewHeDTWGREoOLyNRtrL4LLfUt4R9TY0LPc=;
 b=MRpL+CCIu25bJx0qQS8gjEjgI+jhCG/OFRCnbrpLmdYYo39Y02Q80DFU+bsRw2vZgm+M0rQB7hyo2stji/xyGC50SNsksAecYyoF3q5+N6GXelp+vsI3yzRDNbjEgBt4tAaUI7ZgcQzYAfX3Tr20nhlKIEgmCJ7vKSmsqblfdUWqdyeHtzG4Ik7y80OvDtVFpf9CtU/HDHgwh1jYpxTxigkady0qEL8U4QuvL1+ODKo4RYURz+dDJwifUiFfRswX4ZkKYWKjys9demvRdIhaSVFEqGwdJM6VhFEi5CPLsCvpVhwMKK5McCrbWx1SfNtCbicRZU827c4ElOYRv3pxYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZI3I6sJIewHeDTWGREoOLyNRtrL4LLfUt4R9TY0LPc=;
 b=zSdhkjyDiaeHGn+U+JtFgwI/4MuCZDL1KD/VoQrxqqb1Ny72SqnILftPhEAqwopA907gMfl3ryJk6ghwLWqdCcyPeL4hO0cCzVl7CUP1n0wJbb/7IASXkJKIdlNRjgmsj0zDZg0Y5jXzd2u8B6fN6PrksyAZpNLBHFeVhQo/E/Q=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3885.namprd12.prod.outlook.com (2603:10b6:208:16c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Fri, 27 Aug
 2021 14:24:38 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 14:24:38 +0000
Subject: Re: TTM tt size larger than buffer object?
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
References: <04145fb7-522e-b6da-09ad-a90bb91e5dde@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <49254583-1b74-6aa9-299e-4a74779ced00@amd.com>
Date: Fri, 27 Aug 2021 16:24:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <04145fb7-522e-b6da-09ad-a90bb91e5dde@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0902CA0008.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1ea5:a2d5:a05c:1ebb]
 (2a02:908:1252:fb60:1ea5:a2d5:a05c:1ebb) by
 AM4PR0902CA0008.eurprd09.prod.outlook.com (2603:10a6:200:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 14:24:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1fa021f-b4e3-49ca-3a95-08d9696666ca
X-MS-TrafficTypeDiagnostic: MN2PR12MB3885:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3885EE39456677F896DCA34883C89@MN2PR12MB3885.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TxuTTagFiw6bpCbS/wlUmQQc9ZPmHKSN4oHo8qmZAjsgXKilezhRY3JCwiuAexziz5DZ59WcLIr6cCCSoLoNnTGNVYbJrdP3GlzUbFgv0UrPzQvAcJ4+hO8D1c/CNOQkw+MNXngHSL9+pSS+7kIQBnmsJbxK9BLddFT5vz3Nya82Fs4LmT6MBdyOnd/aDuvFAvnV+6zMgIxX83ZSI31ApKpk7t4MbVvytZWAmYsrMlJwUa5AfIKLYR4kf4CE3c3Aw8oY8cEzYgfLyDd2bqhnUj5/VmwrQJ81Q0e6z6iw0o2diczcO1hPHJQriZ06iNJRLZE1z4X6quWbYlOw7QJpgF1fzxgdC5cMVb82I2XVDsLhQcoOAGGoh0k6QcT0sbYHkXiXEM+576rasT1NGrCUv76ICT5CDda4u0z7eUA+srUaABAcnNcQXadR9OMfFLuSpi8bzzrGloa3EDl5rY2Gc7zJVl+COAYymQzrmmfJIz+0z/jdNk/zT7zplixJrDNUBL5jXEmxr0Rqawo4/7k5vVGrCkZXsim+3ga+1ek/+kNJo6kKtgG37xfoZ6a8cKrLNLR2kYuKmLILWFlLkPegbuhKSs+NGph78H+HthLfKlUzXKQ4nsUSW8/g4HUuFOdHRHbswa/Irr9er/iztyyGYlMUdZ6h1b1Ut2e6xjuCKjV+dhB4JxS5+VyPBF+OudQ0XFq/NfrCarZoKeWUT2bDQqFZ8f0T/vRSjqzD6TqFrlQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(83380400001)(8936002)(66946007)(508600001)(4326008)(66476007)(86362001)(6666004)(66556008)(66574015)(31686004)(36756003)(38100700002)(54906003)(186003)(2906002)(6916009)(31696002)(8676002)(6486002)(316002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHQ2R3U1SzBYRVkrTFVkeVlIUko1VjJhZWxUc0NNTHRHYXF5UStZWmMwQzlY?=
 =?utf-8?B?U0ZQSTZGWVQzamJBdmVaY1VTS3dzeVU5SlYvZVhEZjJXYlBKN2t4UnBKTHc4?=
 =?utf-8?B?MUxvcklieTJOMTlPV2VQU2ltWUxwbTVwSmMrTEs5VlAzMW9pd2hkeEZVVW1w?=
 =?utf-8?B?bW9BcVBsZis5d3YwVCtmdlNIaGhCeHN5eHB1azRZVWxqT3l5dUhaV3FvQWo5?=
 =?utf-8?B?Z2djbUI0QkoxK2p6NC9yTDZPem5oSWhuaVprWUNFR2dLMEFUaW1RQTNnQnB5?=
 =?utf-8?B?MUhkMjRoSTFjRGVJWWpKVythYWxTWk11dWExRVlJcUpHQkJlT1lhc3FQbGtX?=
 =?utf-8?B?ekJzSEVtbmtXM3lRNkYxellMLzRYam5QMi9ZRVQ1YUNiRXpxTFJkNG9vUk9R?=
 =?utf-8?B?Qk4rbEVOMkpRODhBZVhwOUlyTEcvemloR1JuVzlpYU4xOXpBM0Z3WUJOb2dm?=
 =?utf-8?B?SGlnbHorcEdUbmovbE1ORWU3QmlLblN6UXdQQ3QrckxWd0ZST3ZHNXV1bUc3?=
 =?utf-8?B?WW5aU2lvcit4Nno4RExIQ1JTYng3Zlo1MWpVRktXaDV0VzRKMnM5b3dDaytu?=
 =?utf-8?B?Q1JCVlRFQ212SVNNak1PbjRORFRmd2pPdUlHVHkwTTNWM3pSbDM5ZFNkbmxq?=
 =?utf-8?B?bjRLQnA1cUZMY0hsOFo2a3I1UTBjR1pSNXBJd2V1ZDBYQkRKNUx4V2MrMXVm?=
 =?utf-8?B?WmNoM0Rsdks4K3RnU2dBT09SSnhkWDRFS3llczY0VFk1amNXUEk3a3ZlZkp0?=
 =?utf-8?B?Ym5qaG02Rzd3S1lkdUVlVGd2ZkJvajRucWtLSFNHei83NjhTT1NxWm9xUzhM?=
 =?utf-8?B?RWJCSlVUK1JBUTc2NUJLTVNwNVdjQU5PUktuV1ZuTkJnQzZadUxHcXpwTlZL?=
 =?utf-8?B?TFhySW11Wnl6TVZKRnpVeXE3QVR1OEtMRnF4RVJmV2lJZlBuYUkzVE1saE1o?=
 =?utf-8?B?ZVUrdUVPM2pRMHhHcHhhNm8vZ1NEdGZhOTFtZ1NXTGxCMUlYWG9ZamdTMnZF?=
 =?utf-8?B?akRmZVoxbENod1RPOTdzaURlemY5Vm9VbVJZL3RHYXlrNTg4Z0xDZFQ0bWsy?=
 =?utf-8?B?b3dUUmpFU1psdXp1cmdsQTV1TWVTUS93SlBMYk4yUDI2YVRxcXl5NTdubUZC?=
 =?utf-8?B?YVJlTnZtNXkyczFqSmp1Sm5uOUU4R2dIS3pjK2VXU0lrOFlkMU5XVW1hNjFY?=
 =?utf-8?B?N0U5QXphdDNsMUM2NDFqVGR2djBLSWZkMXN3eWExUUw2aitwekxXS2hSU0hC?=
 =?utf-8?B?SW1adml1cHFYc0E5MGhabHoramFPSHBnZkI5RmtxTWlKV0JiNUZJZVJUYlFE?=
 =?utf-8?B?Wit5SjduUDdyRUFQOVJrMDRzVytoTW96Mi9FU1BERlhmaEFJTEUzZVlyTGJj?=
 =?utf-8?B?SmN6ZXJ5U3JJNFVEbEdIWTNpZFU3SWVmVDZWc0VycXVQcU1NWlRYS3d6U0p6?=
 =?utf-8?B?RVFYWnI5RW80K2ZQSnRHdHNiUi9LOVAvaENia0VaYklUNVJUK3lEK2N3NTMv?=
 =?utf-8?B?SUI1VVdiQVNuZ0NlalpCdnluSXA4M1ZENkJMNUdBSi8zZzVha2JEREhoT0lK?=
 =?utf-8?B?c3huaUJwaGV2L2JxUHFlSTAya2hzYzUwdnkwcGY2SGZVT1lQWTQvUE92b25F?=
 =?utf-8?B?eTY3bCtMYzhSWXBvQms2aExrS1NhUmR2OG1iS2p5eGk1TC9GZVpLOVIxZGlC?=
 =?utf-8?B?dEFyYjNycW9jaEppck5WQnhZelRwNEJyNE1kNXNKS0FOb3dsZ3F1QlN6UUd6?=
 =?utf-8?B?YmliemhEWWpJRm9uaG8rWU1RdjdzU2RWYVBnN1ViZ28xblJwRUQxYjRtbE4w?=
 =?utf-8?B?b1E5WE5WdGs0SWJ0TXZmcC91VVFTMk9VZkc1V0NXSVh1WUpzUU1jc2UwNGUw?=
 =?utf-8?Q?8RX7flQ64Vah0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fa021f-b4e3-49ca-3a95-08d9696666ca
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 14:24:38.3964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Br2nAt2HoICmOIl+krthYHucrEidQcoLTsV4yhgz8cvbQpaxzKbV7oevGf/+EVzw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3885
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.08.21 um 15:55 schrieb Thomas Hellström:
> Hi, Christian.
>
> We have a use-case with i915 where the data representation of a buffer 
> object is larger in system memory than in LMEM/VRAM. Hence we'd like 
> to create a ttm_tt that is larger than the buffer object itself. 
> Quickly auditing the TTM code it looks like that should be pretty 
> safe, as ttm->num_pages is not really much accessed outside the tt 
> code and the pool code where we're doing the right thing.
>
> The additional data will really only be accessed by the blitter so 
> when cpu-mapping, mapping just the original buffer object size is 
> correct. However with swapping the additional data needs to be swapped 
> out and the code is doing that correctly as well.
>
> Do you think this is an acceptable solution?

Yes, I think that should work. Just haven't tested it yet.

I've been working on getting the core TTM code to use byte or rather an 
arbitrary size while the tt code should use the num_pages from it's own 
object.

The background is that we have a very similar use case on amdgpu which 
we might need to support.

Christian.

>
> /Thomas
>
>

