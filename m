Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705DA6090B5
	for <lists+dri-devel@lfdr.de>; Sun, 23 Oct 2022 03:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE94A10E008;
	Sun, 23 Oct 2022 01:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D078710E008;
 Sun, 23 Oct 2022 01:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgFzfr2uUqWmxy7eQCDGXv+63u1nwWjSLpmLI9BN6gXh4TxB/WcHj51jKaTtJM8fZiS807khQFF/BAXDZibjWEvtcKaX/7ol/Qvod5d6MYedWuswSmdG847ehG/2Z99UQFa5fz9PYq4brm5H8p8I/fxLs2hIt7PMWBT+/vEjy92oPGbdPqYFofZpktswrGp/cr1GfcO8pi2pWBJkq5lUUZXkG86J3LjrWWv+jFR8yrH/Nmxj1BVp9GmF7NN5J/73SdJIqIxRZaYFjTVhP/YHQKyWPXG2R/a1wSAa0BWj0JIcgbTUoE+sJgMoxk5Bnedh5OmmD0jeESX8ahVBf0z0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ru7/XtouLe3AMnxDgLzLiOs6qqEXc23RPrw6T1SuHvM=;
 b=VZUYJDExwRz4iyA1J6vvsVUvgtEmiK3IbJwL4mus/7flXhzAGd8DxYz6cdEWPm8NmVJ8a/O39nD4nz7fg+YOeB3y0NT41wiKg8MfvutO67YeyyJSMdEOimY/H7yXM3GXwVciYlxe4PwHdbFu7oyCaV4NrGMkPrDG8AYuwmj9f675+Z9gOQaSbYVPs0ZNvc1ItrLOXnAnvWxBFHDCbUBknuwXrbC+Wut0Fj/p0wAUOEdATlf/RY8MYrStkqMtX5BxABPR4aZQa3+a6am0U9iufmYPKTfSPv9yCT8pRRIFMhbk0vgYlQblfRWASO2CIQu1+KOOhnk4hhEJmPvmJd1c4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ru7/XtouLe3AMnxDgLzLiOs6qqEXc23RPrw6T1SuHvM=;
 b=BN2hkRXz4hzB127/IrzSQpHll1VecQ4qoCRW1Wsf+13H/XTkeiv0lR+XTG5ZSQN8Slb85jE6+zRRCKXbaEzdJbR3+XbpD2PwT2sSjCXnxzbS3rK0BbpNYbnyQjjRjHPf7rACIPLFzjVLSxr2aLU6DvpuQfhziwCmsiYx2W82ZAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CY8PR12MB7193.namprd12.prod.outlook.com (2603:10b6:930:5b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32; Sun, 23 Oct 2022 01:35:36 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.021; Sun, 23 Oct 2022
 01:35:36 +0000
Message-ID: <e5cfd002-f1fd-94db-64e6-0391327b024b@amd.com>
Date: Sat, 22 Oct 2022 21:35:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Fixes for scheduler hang when killing a process
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20221014084641.128280-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1P288CA0010.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::23)
 To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CY8PR12MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ffa8f5-0117-4f19-5ed9-08dab496e243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: swtYwqv0py14CiLd3qn4XJWZAbKOTI1mjhiU1gXbL8YCC70x9WYguFkdQmRUq0ITXXlsQjaH8U4HbgZQ/taVeJ5nQwE678pgqnJBMdEeCrkvWUQzgtJ8t4XaPWwLG54NKZL9k8XI3ke0HMjFtujKPlMz52iHmYoqh2KncwWeCR6yFikBujTaD2mlHQLVjTRu/GjD767v4Qh4xwt5oivD3MrnS5fsXGWfDF/hxr8nlBgsW6u3lPchtwRjLRT14wj3RXS8lwzxyntUB0qsjU7vDx9Lu1abPRiicq3wiF9WvqswR1qLjko+lej1A11iG+33bfjAyLWWsgIxzkBXIJM9I/BcoxwKiKZzE/NYAnxUn/86nlmFpg9aFuAwi9vL4S/tFzt+J5zk/82TSnrWk1s6al2iwAJQr86KJVlrf60yhTlx4oKQ0JbfUbI904DL8hBeDO4VFvv+R84rgV9SLyxmMJbBhm0alG7CnrnONzpefyRUZTFqCMEj4OJZniv4aoZedvMDD3YLmifBx3JFdAVH3McHACxB1lIiPBuOX237dQ/C9JHehpDW6D6yMhgvAz8nR0diMlqazmKxmu7Wx/iyE9Ka+NtBHTMyfyn3NBu8QHXwevd+RQ9i7NG/BE95SZqygdC2mSbHfYZcevhlrDmvXfQhl7sjiLT8qoaKiLjnnG9Qh4CktptmMZ9vUQmZcCG/ey48r56xeDYjqG6plWL5gmJ3ON3eYmP07tT053z35ZDEJcvzuQtgG/oRIm4gzToYeHOVn15zOXFJIjnqRtzHu2qOJ8I+PUCQ/gxWHoRNReI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199015)(66946007)(5660300002)(8676002)(31686004)(316002)(2906002)(44832011)(66476007)(6506007)(41300700001)(53546011)(66556008)(6512007)(6486002)(186003)(4001150100001)(26005)(8936002)(478600001)(2616005)(36756003)(66574015)(4744005)(86362001)(6666004)(83380400001)(31696002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1gwc2psanc5ZG83d2NldVdIekRkcWtFUUhXMjFnZE5zM1d1Ri9hRTVySmVn?=
 =?utf-8?B?clpiUC9ESHFzaGZsWDhNckFJYVRHNko1QzRxS2RWRGM1dm5Sd09TVDVCMjFl?=
 =?utf-8?B?NllhQnlLaG81UUFoUVRlZGU5eHg5NGd4eXRpT3pCSkU3bnArZmhKTGJGbzkr?=
 =?utf-8?B?akRwSGNsRk5tRUo4QTcxS09BMVBWZTlUN2FLcnM2SzdZdTdoclJrb3VRZmd5?=
 =?utf-8?B?U0Y4SjBqeStvSnlMQ3hIMzB6aGdXUkxhaUhWY0ZtU0dOWk9nRVhBbEZyYm13?=
 =?utf-8?B?aEN3KzlySngrb25DWG14SkFDeU90Y0dIYWxXTUNERnhoNnhCV3ZDeXdzVUVM?=
 =?utf-8?B?VVYvNVNFR2ZpdFl6VmswVlpBYWdiTzh6M2tsRzhFbCtzOGk2SzZuWkJjTDc4?=
 =?utf-8?B?c0hpd2liTU5GVVMyT0lRUnhOM2s1bjNjaC9ncWoxSW90THR6eElac0hVUU1h?=
 =?utf-8?B?NkRGazNEeGRFY2ZmdUk0ZnV4VThwZlQ5dC9mSHZYQnVLQnAyeUVyZGFlWkZw?=
 =?utf-8?B?UmlXRjVHWVJocFJ5Sm9uVUhNaGJId2lHTklsMkZIT2hDOTVyNDQrRS9xS0U4?=
 =?utf-8?B?K05kVDNoenpJR3ducVgrQzRxT0FvbTlwZnc5Ti9JYzFjR1pObFUxcnVRM2px?=
 =?utf-8?B?ZTlBUFhzWUpBT2RjZmhjcGRzZ3Y3aE1ieHl1R25VTEFyMGtlNzZlUElBWFFt?=
 =?utf-8?B?WTY3MUJ2NE4rakdYYjg0NGc0SXY3anlBYk1uS0ZUY1BmcXZrSlZqeHIyMm1n?=
 =?utf-8?B?VzNyN3owWVJqYWVtZklzUjJQMEtzd2l2T1Ewa0Vicyt6UktVeEgvY0dHb2NC?=
 =?utf-8?B?L3FjRGhPNkw1TTFNUS9TQTdndjdVN3ZiYUV5STVZZzBQRG9Cb0tiTGRycHdL?=
 =?utf-8?B?VkE2M3cyZWwwZHdDMkVXSERGbHhNMlB1RUN5bkxuVGcvWS9GYlJaV3A5Vk1C?=
 =?utf-8?B?a21HZlNLa2h0WmExSmY1T3kwU2xuRTc5dHhlK3hENXpDdnY3NkdmdTVBbGI4?=
 =?utf-8?B?MXptdDZxWFcrNXZYSkxQa3NlNEpNQzlVdU8zZUVkTFE0TC9oQjFCSlo2ZzVR?=
 =?utf-8?B?aERjTzhEblV3SGxNL1NEUmtQRzNJZjVhaFBYaXF2UU96Z2FOQS9MSWEybHhL?=
 =?utf-8?B?Zngzd0p2MHordFR1bmYwQ2JpcElnaXd5TEVHZ0FZY1NqOUE4VG1rQmJ5MXRG?=
 =?utf-8?B?NG1sWnBpbms5OUVDUmNqT2VvSDRDV1BxU2hnRWx3Mys4MFczeVJBdnE3b3F5?=
 =?utf-8?B?cnVoUnlpTUc2WENzb1REaHF4UjZkd0NsYXBIb2pLMzZ1QjdBckU5cnNSTG9B?=
 =?utf-8?B?b1FOYlZTYTBOL3JSYjJBYVF1THU1RHhZYlZoOStNUzBVTkhMRjF0TjY2R1hT?=
 =?utf-8?B?M1F2U3ZJWDNsUE1zZ0c2WXZMdDQyeUk1Vzc3S3NHc0hPbHZQdWQwSEc0UGFY?=
 =?utf-8?B?eE1yUXQ2UDhJdzM4LzVYVmE4RXJsMlc5UVYwTnFIZ3BVWVZJaVlqK0JNNUpS?=
 =?utf-8?B?M2cxV1R3RTBidFc4SWRPRjJxS2VLMnNhZ3p6bFdoRUhXN1cvd0pTNllnMGdT?=
 =?utf-8?B?Sy9RVEl6alFmUzhXSHJub0FQQXVCbFdvWWlxTXhJT3JzMG1xdzQzTVlWQkxl?=
 =?utf-8?B?dkRKOU9zSW9ESWR5THRpQzlTQjJDYkRnSFp6YjVSU0J3eTFKM0hOMCttM0Yv?=
 =?utf-8?B?eXJzbVB1UEZaMzExblhzbUxIeUtUMlU2YllLVFFXWUM0UkpTWVVUa2ZiU0s1?=
 =?utf-8?B?anRPeWhkc2c4Y2t0ZUxJMDRxNWVyOFBUajIvSjkwSHJaT3pkZW1OZTR1RTZo?=
 =?utf-8?B?a0J3WERXWjVDbDNnNTdtWXNXTGJPbWNNYXQvNjdhL1QxUUVRbEw4VXRmWDc2?=
 =?utf-8?B?Sko0Y2dpN0FmWmNuRXRSM1NYdFU4WkFPMjUzT2tBclFpZDJBV1RUZXEyTUpN?=
 =?utf-8?B?N3d0Y0JHNDBNZmlxZldrZExmVkFpMGpnbUYyTkIvajlEZFdtS2kwdWNhRDRx?=
 =?utf-8?B?ZXR3WjM2V1lyWTRyeHB3ZzExc2JYKzhaMEY2aHhxTy9RNkVKb3BNSUVQR3Q2?=
 =?utf-8?B?TFM5ZTJIb05HN01renpzNk9LR0h4MXhKL2pYVnorUFBpQkl3SDk3RCtUenVs?=
 =?utf-8?Q?WhbwAgqz+MEC6isTwgPohK/hQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ffa8f5-0117-4f19-5ed9-08dab496e243
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2022 01:35:36.1912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7Um1P4vVhpKF6kzLmK+BZrKsjDXtJUktfzA9RlXMcSIJjBMH7Dx7C2sglooTdKG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7193
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

On 2022-10-14 04:46, Christian König wrote:
> Hi guys,
> 
> rebased those patches on top of amd-staging-drm-next since the
> amdgpu changes are quite substencial.
> 
> Please review and comment,
> Christian.

The amd-staging-drm-next branch on which this is rebased, includes your 2-patch series
titled "drm_sched: add DRM_SCHED_FENCE_DONT_PIPELINE flag" and "drm_amdgpu: use DRM_SCHED_FENCE_DONT_PIPELINE for VM updates".

Without those two earlier patches present in the branch, this series doesn't apply.

Regards,
Luben

