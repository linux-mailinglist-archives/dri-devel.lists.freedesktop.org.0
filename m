Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674DF5150F0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 18:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6BE10EAFE;
	Fri, 29 Apr 2022 16:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2069.outbound.protection.outlook.com [40.107.101.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6C510ED35;
 Fri, 29 Apr 2022 16:34:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4bFo8mO3d6j/kBnsfB1Rm9iWJLKBFGlutr82ceavuNKrb9SwK2Gu7AkMvpWpzzLxVFcPU/sWq2dbE9ddcZDzMEUcc93eG5HsTWE8TPr25vObXkGpGgFJT/S7VticBMpEe1XjDxNrNijWTROqf9sO6koIf87e4uk3enc7ISytSPG2nCYU30JE8Lu3bPyNAfdFxaN1h7YSe9zPoxlBcPczBJm7z0L4U2FEKvGdYriAas+Lv6cGN9TMsc14c6N+uE9b4aml5AcTVLnnTD2M3O4dwqk+9bRQCYfSvxs1AphMr4ZbTfBYeaGL5+wnlQgujq7ebHRlJIHOa0iewxinPpkvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGIu3ogSPoDt76sjYAMlPHZnf8zBLSkwQxkKcY8oTwQ=;
 b=IZ4b1TO26KoRcgKJQv6y5oCx8Cv1UjOzIMIgM5k5gxu6J7DDX5NhbNAmdYdRd5ePiUPqeTiDCeK6XomDsmiMahnvPDMUs48anEQH1lxHxLQTBTRGaTD8g+fDL8ytirZt8CCj0TcZt8SmVC0bO40jEBtKM60QPwE/FAepqCahs51s3NFCxMl56/xXLpRHdEcUZNO5wsV+DcjISEUGGu3ds5NowHH2rgB2m4h7KXqk0Hi+ck6Ox+iAE05hmpmAPZc5Xt4uwhDvpX7k1eQMJ2HQodJ4m1GeXhesLsapLLt5Czy0WxOfbyuCyo2JTTAIyl44XRx3NT0CafebSYSwvpq6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGIu3ogSPoDt76sjYAMlPHZnf8zBLSkwQxkKcY8oTwQ=;
 b=z5Dsn2UUfNa1xPa+Ya1+89fHP//SVoMzpPmG47AdXZEH8m4J/tuHOPx2Ux0sD0WRE9eyxj2jim2T+NmMovdLz8D4ffqiW1eTUh4x98g5jo25J7zWcmdhVgKhEGhIm06F8eBvwLleUbgCd+ETv7+/nxvbfXTYRztIQ6ST5StWRzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BL1PR12MB5063.namprd12.prod.outlook.com (2603:10b6:208:31a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 16:34:22 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e%5]) with mapi id 15.20.5186.023; Fri, 29 Apr 2022
 16:34:21 +0000
Message-ID: <bcacc450-5e09-9ce7-e389-0a564da2bcb7@amd.com>
Date: Fri, 29 Apr 2022 12:34:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] gpu: drm: remove redundant dma_fence_put() when
 drm_sched_job_add_dependency() fails
Content-Language: en-US
To: Hangyu Hua <hbh25y@gmail.com>, yuq825@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220425083645.25922-1-hbh25y@gmail.com>
 <b7d8956e-5ac6-8200-d8b1-4ce828f04665@amd.com>
 <79b198d0-eff2-d658-4b5e-9084a834fc93@gmail.com>
 <e26e6ef8-6665-0b9d-804f-cf107f1788d4@amd.com>
 <88dd5d67-7dd5-2f58-5254-adaa941deb0f@gmail.com>
 <65b6cc23-1a77-7df0-5768-f81cd03b6514@amd.com>
 <d0790635-4b2e-cd58-0a51-36427800b39c@gmail.com>
 <9b91e06c-50fd-b567-7d2b-a2597d01c4dc@amd.com>
 <37a48008-0700-7c60-30d6-ac2f4152114c@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <37a48008-0700-7c60-30d6-ac2f4152114c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR12CA0016.namprd12.prod.outlook.com
 (2603:10b6:208:a8::29) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f72f448e-15a4-4cb9-77d5-08da29fe1d3c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5063:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5063884FD61E157647C07BA8EAFC9@BL1PR12MB5063.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HTk30GIPm8rPy5pF4zhe9MOGUwG318tZSNs7LnyCIWIVKi2P0nVQFfS9FpYG2IeIrti66J1OZ+iBE77dRJrFm2SD0G0Qsyq/UVkqNz+R+qqgvXv+omSiSTgdprfAZAI8Ct3VAN3G5ASgETihnhpWotgE8uV8nC6262zboa0MWqrmXI3PjX9YJ+PaUv7A02BJ9OBnspFAwHwU2/5x6HbcnMcnZ8pPVaaD3npyOdNj02Rx/+mjFt31x0DMYp8+wLrR+oDK23YnNJZ71QpOXUV4pBOJ55XC6VF+NSD12knpCEy0W2qN4fI/RRKI1NTqZ1iDlrkk0GAE2F2+lACZ/huby1ZJgJg/txSAmU8T8lJz09c375CLrfeG14ScJo364kyYaLZ33dYDRVi/6UA/dS8yKMLVoDAunxFNO/e4OP9ff8E7TWZ6O9NrSlt2nwKVhbGBU9md55GqwB5+NAzUOznfZvcYP5kkz4bMJK9amlUXvxaDT7zWaQ61zeQr3w9abqI3Fe47Uzql2gF0+Ly0h8mdiIWPIyRpcBiFEwksT8qb24p+t3dfbjkxTnz7h+3EkLEMB1P8qiGSfgBCf0TH+n4jKVE/iKOwmeqifhpMv3quGOLV+d5eMfd3S6xRLIsz2DKc14uWtCa2yexegezHqpbV/qXL29v3x1X2OAIUcs8ismfYJsCeTRMNQHoOQ/iv6oJ7oIhtLcZ1vjC8AFoSPoozVj4mw5f+MnkTOpzkBUsKD7E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(508600001)(6486002)(6506007)(31696002)(5660300002)(53546011)(8936002)(4744005)(186003)(2616005)(38100700002)(36756003)(44832011)(316002)(2906002)(4326008)(66556008)(8676002)(66946007)(31686004)(86362001)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW51YkNuQklUL0pNaVFlUXAxTXZkaDF0aXMwVzNOTDVkbmZRMWo2UGhXTUlM?=
 =?utf-8?B?ZlAydFFsQXY2WjUxOVIvVUd4Z29IK2hiQTNhN1FSQllYLzV6UUxyKzd5bzVB?=
 =?utf-8?B?eEhlSUZDMVZham4wVUw4eW45c3VxSlpuSDZrbU02Q0duR2ZoTGpMVDFhYUhI?=
 =?utf-8?B?TkYxbDRXVzVQS1RaSnFrbGt4WVNnZ0JacUNzcktjUWhmUXE3NnNXUzQrRUZ1?=
 =?utf-8?B?WGljaUppOEx6QVkrZTFGcngwK21TZVJuZldPSjNaeTZxRk8xZHZiV3R0d1dy?=
 =?utf-8?B?WHFiZHByajEvRFZ5TGE2MW56QjZPWXZwck51U08vR2pLMjNiMEYxc1BEZEVp?=
 =?utf-8?B?UXdYMkxsSFBaZXdoVVZla1J1eTg0VXI5WHRzTXNIbXNmZUhNeVZtY1MzcEFO?=
 =?utf-8?B?K2gyWElKcjdNVDBCdFBQZ1dManZVb2g4c3lDOE9HcXMxTTBwbHRzQVZ3TmUv?=
 =?utf-8?B?RitOR2l4UUkwQStlRThKZHByMnJkR041MmE2VlBCTHZCVnN4TU0yQis1S3Vv?=
 =?utf-8?B?RkJ2QkJqaHFJNkwyQUtXZGhwOFZ0US9OSUxzR2dxL0RuZ2ZyQnVtNE1DV3ZQ?=
 =?utf-8?B?WisyNU8xdVJUeFpkczg4Y2ZlTnRxUURNYWhMdjVEWUFlR04vOU5UY1JINUww?=
 =?utf-8?B?KzdweHh5WmhGRmFSaVJMVjNrU0diMFJDamwwbFh5OFN5V3hIODJua1Q1SlZn?=
 =?utf-8?B?UnUvaFNnUnNvb2syK1Z5QWhHUEVScnRuWFB3RWplaDg2Nk0yZXFLT2djNmpm?=
 =?utf-8?B?OVRXNmVlTzg4MGpDdnBEZ0NYaWNFWGJxNVN6WGY0YWhSSWM3Um5tZGk2dm1h?=
 =?utf-8?B?OFAxNmFCMHc4YTlGa3BDamQvYnY5Y2QwZzJXbW1KbElYKzMwbVcvckVFUzAy?=
 =?utf-8?B?RlRZdGpXaVB1Uzgzbm1QSHFBMFBwUVMvSTI1b2Q0anE0ajFrYVBrbUVDSDgw?=
 =?utf-8?B?ZzhkdXRJVWR1ajMvZURBSCtTeUZTNUJpKzRua0Q0bk13WjV2N1hxSWwxVHR3?=
 =?utf-8?B?YWpBVUVpT3pobGZmK09NdC96VEtmcWV5VC9ZS05adzdON1VJQnR0ditTcExK?=
 =?utf-8?B?cUdFN29OUCtNZTA5a3QzZm82TWo1bHU0QXNGYWxiWjVsWkpmNHBKTzlrRVBv?=
 =?utf-8?B?ekFjbTFJazlRbmN4ekY5b3FJZTdQYk40bmdnSjAvWW9neUU3ZEpHUlVpTVpE?=
 =?utf-8?B?OUVnWVFUalFjR0tmYkFCMUF5Z2NlektaMWdndG96a0pBcVNYS1FCK1ZBZ3R1?=
 =?utf-8?B?WkgrK2xtV1VDL2NpK0RyOHg2ZkFhcFRXR2JBeWZ2NHN6cDJtSHI4L3hYbEFJ?=
 =?utf-8?B?RFhXZzdIbWNQL2pPbS93azc1Vno5VW1pSGJqSnZrUlNPbFVQWnArU015Z1lB?=
 =?utf-8?B?QVJnZHY5OUVqWFZQbm1USzg1bE5GeFhRQmRPMHRSbGprV0E3TDBMbXVwbnNU?=
 =?utf-8?B?QmtYZWlpS3A0VC9xWFIyeElma3o4Ym9hOUUwN0JFQWlhdUV2bzFNQ2NaVGt1?=
 =?utf-8?B?eGlKSWhaYm54T1ozN3pjRlM1Szl4d1JCV2JUcEQzeGE1OGRDZ1d6UWt6MTg2?=
 =?utf-8?B?SDVzeC9LbithWWx1QXh1b2FnUkEwYVdrZGJ2VFh5OVlLWFBoa0hPMW9JbDNI?=
 =?utf-8?B?TzFBdmJiVlk4bU5LWlFPd0ZsOWhYTTBDbWhCQ0QwQkVxcWo0YWVBc3dCZ3E1?=
 =?utf-8?B?SXVpYUFFdGg0TXJUNGN2aXVoaXBqY014cVVYd1o3dU8wSVNkOGRRRnQxR0Mw?=
 =?utf-8?B?cVRZbjBJNlN4N2hxYndLKzk4RkhXYU1wOHBqSXJtTXRWL3lhdHNmK0htMlRN?=
 =?utf-8?B?S1ZvTWlnYVprS0JoeVdMenJ0ekZnTEI1OVJuZHRCTkd4d2hMZHFoYTlqT25M?=
 =?utf-8?B?bXdUSXNhbE9EU2drd1JXVi93amlnbVVwYlh1dWY5azRpdDZLaHc1QTFtNGlm?=
 =?utf-8?B?Z3dmazlFNS9ZbWJCU0JMQXEyMGluZWtyRzBBcFVGUmJBdjlnWnRhdWFxVVpK?=
 =?utf-8?B?SEtmWFlZQzM1N1VRdElJRkRuSmpFa3AwZXgxRjh1UG9xT1hhZ3JBWXdjRDNo?=
 =?utf-8?B?c0V1endUMkZyVEhlWnBZR0VmcXpYekxCUGJtSlNTdlBCZDJ4OE1ZN1Rjblls?=
 =?utf-8?B?NnVwMU5Ka1VEeEFvZVZaZWJNc1pKbG1IbXhtM1dtaGs0NTlSSUViQ21naXRq?=
 =?utf-8?B?UkhrZENlZHEzR3ZBWDVjUHNBL0tkVjR2cXh6VWN6K0FvMWljbXluMHczZGh0?=
 =?utf-8?B?T3lQaHJnbDYvWHg5YktJVXZXc2gxV3hUVTQ0K2krVi9xMHNNTkp1b2RHbFRw?=
 =?utf-8?B?STJWYXM4bjFTVWxMZnlYSnhtR3ZSWWJHaEMyNHdnYWlWTWovenJZUlVUdk5P?=
 =?utf-8?Q?65hH4zlVymtsdfL8Hl+0wjkW3TbULXxWRO1ofmp+1Oiad?=
X-MS-Exchange-AntiSpam-MessageData-1: LrMhmjbojx9z5A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72f448e-15a4-4cb9-77d5-08da29fe1d3c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 16:34:21.7311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uZNxbwXJNcKICs1oLiQmitewIdVn+KgwuA98+UFLIaX8O7Ln9IRhW8AX1oUm658UB6U7MwARAyE8w6IS18WHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5063
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
Cc: lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now it's easy to see it's redundant, it's a problematic design where the 
fence 'get' part is happening outside the job->dependencies array logic 
but the fence 'put' part is happening inside, leads to confusions such 
as adding this 'put'
in the first place. I will look into improving this if possible.

Patch is Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Andrey

On 2022-04-28 23:03, Hangyu Hua wrote:
> If fence is released in drm_sched_job_add_implicit_dependencies(), a 
> dangling pointer will be in obj->resv.
>
> specific scenario:
> recount = 1 init, obj->resv->fence_excl = fence
> recount = 1 before drm_sched_job_add_implicit_dependencies
> recount = 2 in [2]
> recount = 1 in [1]
> recount = 0 in [3] <--- fence release. But fence still in obj->resv
>
> Thanks,
> Hangyu 
