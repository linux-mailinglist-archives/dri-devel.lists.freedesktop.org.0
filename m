Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C06284F14ED
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 14:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B582110E8BD;
	Mon,  4 Apr 2022 12:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ECD10E8BD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 12:33:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C44NoCQNjl7gFV7OkFDWJvnxjYDGdMiSza78l5ZExOpevQhPXR7L500FmTkirB4Ou54dOsSflCsRh3aD0LAZ6ukq9/iiss6cfyeB4Ip8ZP8/rHxLT1iBKSKHBc3KvQETB3e0s5L8NmJI0cX6zzHJYZU1MaG4bPkxhbBOANb9pvlOAAwrup3v2aiSBqsANHhnHANHTjf895HMJ4tZ6yNpys5xlI/lE8FpKaaeKRlaXRNfrZNUC3JNDXwfYCr0Nxjpq/XozNpNwOeyAzlusS5U5ZW+4awS5XBGbEvfvHad5CIQjFz4QmrAfwUsbFEPapp4oYXaWVz3kKinr3YaCYORLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCTKbJiEurIi9X3FKKn+rKWjGiI8VcMNseJtVKWN5Xk=;
 b=jkVI8Z8Iggl6RtVv3N7M2WxIWMi4BqgXKklj6szURWrO7dfHNKQNB9wNYgRox/Tx6Xr7/en9eiJai7m0x0AMJs3TZcyNFNxOJISv6v7dM4cD4OHzZAgdkP36Y6HEd6Ag9Ch77m2vBv77I1cAg5k8BygzDq6IBINV1nBFqf4uhi/jpeChTpCd3DpoC3HjdwDu4qI782WSc05I3TaZqazZovYKxOxr+Tb8We4HpvqZtv46/phFU03rCbPqPtBeTNXuzaIckFNX4sxSEg4Yk+yo1TfS3BNj18Vv0jlaFdrKkpwgoTXwnCutJJpZtnuySMmpK541Z1TCL0lcw5t8wamg5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCTKbJiEurIi9X3FKKn+rKWjGiI8VcMNseJtVKWN5Xk=;
 b=NJnIklQFdgS0s3JlfaKI4+2mOCMu9IaEOQm+hJTtsRewFfpVT+Mr/SbdUge7dAdADAkloZC15L7QNdOr730EeqtAAU0sksWEy0iBxh2MHNYbj8MNY0VMBjw20MDLwO5Yv0WBQciRppcvIgIUwUCnrKYrrKVAis1wWhYqFNwYfcTLfAkglCxE3ACyVJm1MAfrBQFxQDuSv6+KXVScOKiUzOeNs/MyfAJhnS+eelGyUwJWYV+QklDzbI9JIcjPA9p67DoyzvlN1PA+iGqS5rYtlgEH6v1vsQ6nvhT71rg0ms6U260bvj764spuquDBMzEV2YzabCUhff7kfCcyBZpInQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BN8PR12MB3235.namprd12.prod.outlook.com (2603:10b6:408:6e::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Mon, 4 Apr 2022 12:33:50 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::10ef:dc56:bb21:76f6]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::10ef:dc56:bb21:76f6%4]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 12:33:50 +0000
Message-ID: <3781875f-dfb0-a00c-0ee3-6ae70c3220e5@nvidia.com>
Date: Mon, 4 Apr 2022 13:33:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] gpu: host1x: Do not use mapping cache for job submissions
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <20220324103025.2660775-1-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20220324103025.2660775-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0396.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::9) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e410955-84c1-43a6-13b8-08da16375efe
X-MS-TrafficTypeDiagnostic: BN8PR12MB3235:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB323522E69C2802E4184E903BD9E59@BN8PR12MB3235.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DkCypCgzh+EUReRLzOS0bW3oStXK7CWqhkjZcgMM8tgpIHJhC4RUehlQJGnMpJhfDqXZPc9m+OCc0ja6JF1HGrEVWB4l37KGf+qV1loXt9YBYN9E7GzD2mvehF+NDql8GaiRC5p6GV20x322xWvXtDlNF0IH3mtYX+9jeaAo69pepUlxeG2chRj6OWp9gmKdEFuxlLAejrdFXdHjpBqDMYisG1/Bg9pvTr81uSvF3dHo/nQkVu/wmfkhc6/utzS4PPQ5ylCytnt2oMUXDcUJsBq9bLzj6dd2MOp//qTeQpekAkgb/OF8xmUUvph5NUy3R/1m7YCxAnnIaWd1P30c4UylidCyqVEig6eMXNnLKvcEHAoX5GmmtGAgChuLOZNqlSsQymnO5UWwBqy3l5bZXEAP8H43fQiipTrAz5FD4ceNRHIueODn4xB/k/xX1la/aB+j3B8iQSzw0gSwRh0aExbakfDX/dlwdSFo727SFnQkJBw5H+rZB3MDDWK9NIHJR5OKIASbAaMJyqxREDhKUxqczqrUC4H8lC2kcUbS+x6RkFmKq8H7J8zRWXvC/4M7W+hYae3bWHh9pShmVT5qhoEtGgItU3D+hZle5CIg93f4u5cNlbpulp0bF5btO/ArYoavS1205V+cFv8gS3vugJ742aGktAsLeUl1rBi6JOhUyQVYqwR+LkOMASOKopUt9dL5aI/vZt4Fm/vz1SJ+DTPBIK2f0UvQNEnIIgnCRz3T4eJYDA3WqJhFew2MQyG0sfRYFuYfy7BldCe12obQPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(4744005)(2616005)(5660300002)(508600001)(6486002)(53546011)(6506007)(6666004)(6916009)(2906002)(6512007)(31696002)(316002)(55236004)(83380400001)(66556008)(8676002)(86362001)(66946007)(4326008)(31686004)(186003)(36756003)(8936002)(26005)(66476007)(32563001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEc5YUswL1JYMjVmOVdCY3JScTZVMjk2TFc0U0J4am1ETDNYOUR3SnF5blUx?=
 =?utf-8?B?L3NxZlpvUjllNW8zTjlhZUNScTRucjhXQ0NkS0I2VmlDd1RPZjMxemwzKzd0?=
 =?utf-8?B?d05pbWIzTDBtbCtCeXBRS243T1hEcjh3ZTB3WG4rdytyOHQrQitneXZmcDNa?=
 =?utf-8?B?ckdBblVQT2oxS3dNMmZGUk85R0hPQi9GcTM4d1VML2xuY1Q5YzdFbU1ucDlo?=
 =?utf-8?B?YjF0T0RpbTlsS2JKWVdGN2JRM0pCUmRtcVVvZXFWR3h0Y01ucHVSMURUNkNB?=
 =?utf-8?B?ZVJDNitoblFmdEpQVXV3K3ZKbnU5b3k1SzE3ejg3WUFndWQ1TXVqVGRIMlI0?=
 =?utf-8?B?OUF2TzJ6Mk1RVUJMZk02bW53VkZOMnVRcnhaMW92Z2NJUTVUVm5HT3liYW9V?=
 =?utf-8?B?M1BBVGtFOWhZRzNPNjVlZ1JFTUk2YW81emdyVGsyeHNyczhIYnRoWlFYaWEv?=
 =?utf-8?B?b3VBT25JM0xLeXdqTnVIenpRTWxteEYyYnVraElYUkRSRlRpS01WTDFBdy9W?=
 =?utf-8?B?Qlk0K0JKZG5MV1JDeFVRanNTcWZ2S1FHUGt2WTQ1SjhVcEJCMWR2b3Q1R1NU?=
 =?utf-8?B?dlpPUXRJTWdiRXFmMENPdStOb1BJQ04xQSthdElSTFhBbS9TNDcyNm92MStS?=
 =?utf-8?B?SGYyV3QwdUladTN6eTdSYWUwVkUxY0kyaFBydU9zUUpjYlBmUVJlSjdFNXZw?=
 =?utf-8?B?MkNkVnNCQmFTMjVtTTNTOW9pVWtrZENMMERyUEhOT1FldDEzN0F3anZ6ejRU?=
 =?utf-8?B?ZnErVXJ5eUx5RmZrUkpQRGZUQXVPV001dzJUZlFqc2xHb2dsYmgydllPQ1E2?=
 =?utf-8?B?cmdHckZxeFo3R2Z4b05yU29zZmw2NHJSQ1VXeWdzeUFwU1NUUC9nOVNlbTln?=
 =?utf-8?B?TzJWTlFCYXI3TDVhdi8zamczNEJQRVdhakZncDBiMC9aLzBBQWdzU1VnTW1Z?=
 =?utf-8?B?Yk1aUFM3SVhmY25tOG5kWGhBMitKSEN3eHllYWN5M1FiVlJZK2dHVkRmR0xQ?=
 =?utf-8?B?aUJkRFgvcEUwZDlpRENDd2UxS1BnV3dmZmMvbThnU2NneUdUZ2hYdEFtenV2?=
 =?utf-8?B?SVBQR1QyOXdKeUE1S3dmMG5pa20rZzJ0THRwUGtUbnhlaU1NNnZZMDh3dnVr?=
 =?utf-8?B?cWtTU01vcTRCaHVZUzJnb0xSN3dyZTVlRUQvV0pCbS9lTk5JS3MzZEpsTTNu?=
 =?utf-8?B?UzVGR1Rtd3ducnY2cWcrZWN0ZmlUeVpTZERPUDZQMUlkU0IvRHVJcWxTaWZO?=
 =?utf-8?B?N01HZ3ZwNWtOOGhvS3k3dGNsU1Jyam51eHM0V1ZaK0VwWWxaTnRXVEhTWURi?=
 =?utf-8?B?VnFjR0VtSm1uamZZdWJyQ1V5ODFaakRPU2JOZWtqclRqSHRETWdwclNaN0lB?=
 =?utf-8?B?SVFEMkZvZUhhQVg1cktiNUlsUHZ3RDJOa0xFb2pVL1FaZlIyY1hEaGh4S0dO?=
 =?utf-8?B?OEtDZTNlbk9Fd1NkTFduUjVpVjdGSTd4cUdBSWc2ZmpQdGpENGxWdGFod2Ri?=
 =?utf-8?B?ektPcmIyU3RNakxTMDBsWlQwWUdyWGU0THppSlErMS9qbmREK2FMQzlFRmlz?=
 =?utf-8?B?dmxsL2ZtVEZOSHVwak94TFVHb2RCMkxvRVNnQmdtbXEwdFNlaGxpOTBOUWVy?=
 =?utf-8?B?cmdtQmFZek1tcHR5MWgwWlVNUE9KRWhSYStpNzFReFJ6cndRY0ZjUENQdFlF?=
 =?utf-8?B?MElDOUhGa09MQXcxL3cranhCYWtTZG02dDhjMkRZSVlwdEFVZHlKcHZ2Rlp1?=
 =?utf-8?B?RXljM3NYWVEyOUJScTJGaitKTmRXYjd2WTI1UUhJNjZGZmlHTE41UWUzM1lZ?=
 =?utf-8?B?TGdWb0FkSzM5a2xwbktMR1VRbUt6UTE4YTI2Q0VXaXlRUVBiN0xnNGJQLzlZ?=
 =?utf-8?B?Yk1rZUhtNlpPLzRHVVRhUE85YUczamxYY3RQMmhGZGxiaUU4NnBoUWNMSW1V?=
 =?utf-8?B?OUFib1h2VllhcFAra2M1MUM0ZG94bEptZEphbkN1NXNmTjVjelJZYm9OU1JV?=
 =?utf-8?B?TFdtMk1SZnZjQy9QV1ovK3dqbk5CYnorKzZjMDY4cFJYZmw3Q1pBVHQ4Tmhh?=
 =?utf-8?B?eE1nZkpzdGxUcENuWHlOMDk3K0tYY0xIUVpnc2ZXRlAxc0FLc1B1MkFyektQ?=
 =?utf-8?B?a1lrdldTV1pmTG0rV3Z6Y3h5RHNFNEIyRmNqVVZLVmlwSmcyY0VidWk2cTV5?=
 =?utf-8?B?SHNTZEV3TmJKc0c5eWFVbFdtMWYybWw0c1RpM3hYRWJ3eGVxOFZVR3dHNDAy?=
 =?utf-8?B?Si8xOTFwSGFSaW8vcy9IQzZmVkw5VGpFalF5bG5YQ050clByT0ROcFBxcWww?=
 =?utf-8?B?a2czQjFORWJqMUFJbWttRE9TYkhiRDFjNDZDUHhTMGN2YVVrczRFRHpWRFpt?=
 =?utf-8?Q?kxl2EyWXYRjbM8bA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e410955-84c1-43a6-13b8-08da16375efe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 12:33:50.1568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4yAmYwrxvb5yJnF0x4JkKRxAkSIkPtX5HC5AxF0HslN8EjjMYu1kFGM6vwVdyv0xPUMQXmAOFkdsamXfoJ6yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3235
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/03/2022 10:30, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Buffer mappings used in job submissions are usually small and not
> rapidly reused as opposed to framebuffers (which are usually large and
> rapidly reused, for example when page-flipping between double-buffered
> framebuffers). Avoid going through the mapping cache for these buffers
> since the cache would also lead to leaks if nobody is ever releasing
> the cache's last reference. For DRM/KMS these last references are
> dropped when the framebuffers are removed and therefore no longer
> needed.
> 
> While at it, also add a note about the need to explicitly remove the
> final reference to the mapping in the cache.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>


I have tested this and verified that it is working well.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
