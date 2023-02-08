Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0732368FA33
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 23:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E768010E08F;
	Wed,  8 Feb 2023 22:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C3210E08F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 22:20:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUqtIa8h6bWY0CEAZFV/mEUnXCP8swdk4T8cRgLGJCsIa5Qtix1LTgTzRQrimgkPGoPBQwnwXlA5hO8uYvQpnHXxZ7UTXwNb3a68RYHDPOpcS/M1FjtG3W4Y3n+YE4DFpPD9egWDbuxC/plOBmb0lGt59y9ZAsboumXGNq5/8SG2o3Rho/yYzdnJ84Y9BPXGtTmubPmtt48Df3F7Vw94FAuPRNa0496l57cJLzVh5IXmR0SWg+yVclqXieKTo+2NUay1S86sByWlvh5wAOBSMDhrUGyMBVkWSFBL3rpamPt3jHuxtmsvzMyWIw2weQ40wI652N9sQsWTu0K3x/KXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WczAkpeOko+/HY7HtViiasQw2EXzjuaVBxCczQQj7AY=;
 b=K14Et9hZN5qsM283L61Lm7VdxLAOP/gtUkRBYgsjLYLCBMEok6K3WMJvYefHM0tla2T+Xdwp9G3DgNpgiGkaARhgS8E0UcXek3jvf0C5C+sRt96QSDMUTIENrfoAy7iklvZJd/ZasiyAEt3d8/Y+qrZYsYNo62BvSqMVOmEg02TD7Q2RJna4uI9tfr8mrIY7/7v+qJSgvmkHi9/hoHmiFTBu22gcXdGCnh+KIWXZCVg9E2OEMQ0IQLrAxkx8ehbF/V6XTlomo/UxJ4cmVq3Zh7QZNITBQXbebjV2c2gCPqLe2Hh7IytDNUBwbTa2NqwtwQLMKIN3zk5LxPR8IT7v+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WczAkpeOko+/HY7HtViiasQw2EXzjuaVBxCczQQj7AY=;
 b=0O5AtRM0B1qut+tVzOceweCfoxfOAFfN6E3xH7c4GIFizuSx5cJ4Fj3bxrdEeNipt5FfS3Ii+GJG7lmo7TjAgcM9+9P/y1Lbli2r+IlhXk04q/On7Nq6sOn5taYH+GqcnSoyv/aIaxoxriA606BknYPZezW0LyaaitAOPNlg1eI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SN7PR12MB8001.namprd12.prod.outlook.com (2603:10b6:806:340::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34; Wed, 8 Feb 2023 22:20:45 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 22:20:45 +0000
Message-ID: <efe36086-fa78-b7af-bfb2-1d2cad618905@amd.com>
Date: Wed, 8 Feb 2023 17:20:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/5] drm/sched: Create wrapper to add a syncobj dependency
 to job
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Qiang Yu <yuq825@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230208194817.199932-1-mcanal@igalia.com>
 <20230208194817.199932-2-mcanal@igalia.com>
 <49d580fa-60db-5d55-00de-20dd3eefe737@amd.com>
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <49d580fa-60db-5d55-00de-20dd3eefe737@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0266.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::14) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SN7PR12MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b200709-7f7c-4bfe-1262-08db0a22b922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2EgbweyFDyEhhCh+rqvMi3kKS0dHq9dnrh9cvA4ym+P+Ic++Rz45vbl7YhnsApnjliTvm/nPWI5QdMte4xWOSWBLp5uJSxiO3002Lxx4Fc58uH72DHTBu/AXxd1fXuqyCTlDOFUbceTEAJC42ILdSNFY2rPDxcrcrYelH1DhaGTLLR9jBgiV7HpH1h1Z2fdc/WWRMijHOWJXGnMbXg9NHSxmrqTPwaXSSGSo5264H/iw61+OH3wScT/zP8YM7L/V7Ni1KwLtHd02MRv29fr2uiBfRW+QDVqFqdC7VyVXryFOjUDGA4lbSumS9FXDXNPF1F2DxTyGG77htS+FV7UVumgvMUOaa+PyDwy25wnC5Fln3irVp5F92GahLDQfELof9kQAOU82z+DByw2JzIMZgkLAy3fWZmUk6EH/Xe6YGWRN+lpT7O0xvimkyxuycSqoUYo+ukaUH4vOcX+QOR8010eBUetRHSeurNd4uo2xysuATDOaouE+EGdbwz2u2E/tir96Y0ExryTNJbIBhnLDHmmgYe3madkKyB4kXdefNZgbPCv3vWGRjN+GFr7GuuEHQ2FLjdUlUjy7iN0bZmRw/skmbH+fL/9CqC2H5UTkaVlUctkOi0AaxlgaD4SQyzhh9i8s/v51fRn77ub58JRSOqA3K9bsZeJF7UQtzBz2M8ddEB0WKnF4bhMaR+luKfAo8iUgz+RMbdL3Rs2h3MCnaZ+DRXh7xfZRQ5v9zc1oJQT4f4+T1RbEh4XPYqVNKOGd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199018)(6486002)(8936002)(921005)(6512007)(186003)(7416002)(5660300002)(26005)(31696002)(53546011)(66946007)(66556008)(8676002)(4326008)(316002)(41300700001)(6506007)(55236004)(110136005)(2906002)(83380400001)(86362001)(478600001)(66476007)(36756003)(44832011)(4744005)(66574015)(2616005)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEVLY083UGFISkNqZ2Jyam94QjlMWHp3czVvLzFVWGVQOFFjMVN5YTVnZ1FQ?=
 =?utf-8?B?R2lFTjdCMTg4YWp3YjM4a0ZTYXJJbFZCMDJYY0xXWVY1R2ROcEdDKzlhUC8z?=
 =?utf-8?B?ZkxIcUU0bVRjRWhvTm1TUFVvaktNUTZ0cTZSM0xldzJQRXdlZ000UGlSeFN0?=
 =?utf-8?B?Y3hKcW1wc3RoZVM5ZTgyTWNkMkl6Y3grT003RTlCYk90dUNlbEVhNmlxZFVX?=
 =?utf-8?B?QjVIRW9rVkZyczJsQ1lzbXllWm1PT0t2UUJ0QlBDbkdhTC95ZjR0U3pzQVNO?=
 =?utf-8?B?bFVKNlVWN283VjZPaU4rdmxLR1FRVld0dUMzTVJwalJnTFBmamRXUms1Z1I1?=
 =?utf-8?B?VXM4ZnBneWdUcUNZL0N4OCt6c0RLMzhFdHI1VHp3VHpLdHZJdE9ZUXVIdTBk?=
 =?utf-8?B?VURzNWRFOVZUWTZKbHJEWlU4U2JPOHFzU2hGVjJZME1nNjEydXdTaytrV1Vk?=
 =?utf-8?B?akZYdDRScllVblAwR01MVzlnNFFBMUx2M3ZPU21IbHpQcENkd0U0Q1JJbG9n?=
 =?utf-8?B?ejhmb0s0NGQxKzg0RDhhVENsWlVvZVhoWExLZjhQSEN2WVhscmxHU3I5VFR2?=
 =?utf-8?B?Nmd2cFRXUlhBNmZaelR6S0xvdExNQUVIYU94NzNCQS9ZZ2VFVXl1ZXNCRmQ4?=
 =?utf-8?B?MFdFYk41SGM4VFZ1a0JCNTVFdVhTcjV0QWYzbnpyN3pSRUZZWnpGcnVYTzBU?=
 =?utf-8?B?N3lxdGltbWdMa283N2hDVWpCUWczSlJLVlRCUFRNZGZzaEhLQ0hqdnZlU3dK?=
 =?utf-8?B?bTB4ZGtoWW5udU1TM3RkYmE1NlJyVFVoSjQvZndDZ0lXN2MwSHk5anZSRlF4?=
 =?utf-8?B?OW9lOFo0ZE12Vks2ZGtqeUNSVnJLVDFGaUc5dHhRc1Z5MGpXMVZXRTBlWmFm?=
 =?utf-8?B?TGFQZy9tRWNjQkFKRmloRHd1ZzhPVnFxcFlSN1Y3MU1WQzhNdDF4UHYyaGlE?=
 =?utf-8?B?aXUwWU9Fa2ZERzQ0ZzVTZnIrU0JFdXR2ZWVEU1UwNloxOHBnL1IwdXJUNGZr?=
 =?utf-8?B?UC9DNlkyaVR3VFBxazh0M0RMaGQzaCtsZC9EbXhNVnI0eGNJTEVLZ3FaekFs?=
 =?utf-8?B?Vk9rQWhVU0ErWktYR3VpOVY2cytYM0lQRC9KNHptbFYrT05TQW1yRWpaSmhP?=
 =?utf-8?B?T0Z0aXBpS1FrdG0yeFl0U2JCTHBJYTBlTnpnTUY1akM2T2dmd0hUU0xwemp6?=
 =?utf-8?B?MlVlU3ZUckQya25RMTNCK3BHczJBRUZpYjZOaWlEQmh4NUZ6R0RFOXRObG9B?=
 =?utf-8?B?U1VqVUd5WllFVUFUZm5iMVIrRjhkUnZOOWxjQWlkQitURThVbkJyTXFGb0ZM?=
 =?utf-8?B?OWtKbzNZUHl2TUZCWC9XTmJ2c3YyT0xDeC9HR0dUUXlEZStHdEoyMnpYWjZX?=
 =?utf-8?B?RE1aOGo2eDNSQUgxamptcmVjM3F1QUZHVmhNOURJNWtZWksrank3WVRvYnFk?=
 =?utf-8?B?MDlTZkVHeTZVb1RMWkREWmZkVG1Ea3NTWFVQdGdBd1JiOFhvc2tRdTRrSldr?=
 =?utf-8?B?Y08raHVtYXVmNUVZdkttbWhmemlzMUdQMlpZVjVzbVpEVk1wbnp1S0dFM2Y0?=
 =?utf-8?B?NFdPMmJ6THQwdmZjblA4SFErckIrQVhhKzhZcnV2VVJRRGE1OUFEWXkzYVZI?=
 =?utf-8?B?U2NEU2FpWlRocGhiYS9ncG5wdVppdjF4RXVxa0hIRTBlQVBWMGwxOVlLSWpD?=
 =?utf-8?B?S0N3b3RsUy8zajZ0Q3Bzb21LQjhUaXRmWURrK2tobUwvdlY0WHJhV2sxY3BY?=
 =?utf-8?B?WU1qSTZvQi8wZ3hRWU5WWFpXQXpMZU5teHVQOE1pcGJCRGUzKzNJbWI2WFZV?=
 =?utf-8?B?MGdiVDdjM3ZLWWlUWk9hYzFlaEV4VklyaUI0MjFVWVo5U2ZjeERzRkRISXhh?=
 =?utf-8?B?cHVOUm5zMmxuY0tLY2lkM2RaVUhqK2dzVnR5Nkd5eXJ2eGZYY21JV3JzQmNk?=
 =?utf-8?B?cG1LTjkxSWZjWmNVRVoramVTN0VrTWZrdDY5b1dqb3I1QmgrME1keVMzRFJB?=
 =?utf-8?B?cDdjdXd0SUhLWldRdmJISEd5WEMvd1FYUTlUN2VNd3lHV2I5a3pZZWxJM1F6?=
 =?utf-8?B?Z09SdEQvbFI5OU5oS05EU1JtOXZjYVE1S2Y5RHZXRTlhY041UFhNS2ROL2I4?=
 =?utf-8?Q?RwT6yr0YyUEYwn3KFsHsMm7nr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b200709-7f7c-4bfe-1262-08db0a22b922
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 22:20:45.6271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IiWEmJvsvRE1VYsuOOFhK5e2dHqp+h+wVOVQhy2R0RvEYYJWZeJN2Y1hTHTi1BRm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8001
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-08 14:54, Christian König wrote:
> Am 08.02.23 um 20:48 schrieb Maíra Canal:
>> In order to add a syncobj's fence as a dependency to a job, it is
>> necessary to call drm_syncobj_find_fence() to find the fence and then
>> add the dependency with drm_sched_job_add_dependency(). So, wrap these
>> steps in one single function, drm_sched_job_add_syncobj_dependency().
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> Just one nit pick below, with that fixed Reviewed-by: Christian König 
> <christian.koenig@amd.com>
>
> I'm pretty sure we have the exact same function now in amdgpu cause I 
> cleaned that up just a few weeks ago to look the same as the other drivers.
>
> Would be nice to have that new function applied there as well.

Hi Christian,

Is that R-B for the series or just this patch?
-- 
Regards,
Luben
