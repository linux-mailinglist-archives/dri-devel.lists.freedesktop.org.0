Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDE04EC9AB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 18:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316CA10E72A;
	Wed, 30 Mar 2022 16:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2044.outbound.protection.outlook.com [40.107.100.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD7C10E5B2;
 Wed, 30 Mar 2022 16:30:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yx+Au0ql+XhN+bG8mAmY2+QicQGzsVwJpPMZemd0AVMyusuI+QEBQ8fLGp1CIzUsWnj2dRUVIbshNvMRlmpBLkRIPkRVeQGZEydpZPPPArIaFD7w/xj7fzDwy26//MSzchiCH+ZeiIvZmJBF5nNncQLMaDq2+UInSSzEbLL34+fWKkRO2QQem6jIrlFHj0cchhgjH0t6bcVDdPhCyoFAVkG+PUlvInpAoAU1GlpXMhPN8GaoLsslQS7uQbYXnOlNIoFDD3e1AoR6NcboRnFiDFF0Yts9HymQKinIu6c9Ni0WIxRHyi8PDXlczVU83TdafhGmsmkFlQTzsfxRE8Dvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePByc0bDH3TqbgQO0pnvipQ4QACUTM8x+Qr4LC0W25s=;
 b=OK3fxwNQxuivznKQAc22yCVoKjAmJ5ZXMISK8/dMTDrLK2rpBxLmKO2IPxYQHBs8wwhQPeRWJZIN2hjKcUEaFquj2XcSO6vCqDhJMR85WWslsAYj5RbvsHKlCLnL+jMPamZ+iCAjm5nR+vGLE4Gf4A8v1aKmJe0gyp6+bdPxs97hSH8vcC+K8TzacXGKOu6veEwL/9mg4Gypm/7lCEd2qwMtr4IBjiLp4RF4awk1zyOzbz12OJh1az33ppMHTlwjcwuGAXgWCtQcXD14wSCipzhFU9BSYJjjUShAs6xStUI9r+aO0XRqEkOKShwHWwWwtXNkIzhMCpRWciZg/RBJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePByc0bDH3TqbgQO0pnvipQ4QACUTM8x+Qr4LC0W25s=;
 b=gG3CP7hAuTz/xnOVAl0kDhoQBaoLQ+bGoq6L6UG6YhjR+1aM5Pn1kHIjvmdCCtVHOBrmaijIlC0HYgDqr4PUUxpw4PcOg7LIAlaekGLr3L3Vwsclx5l9cJ8Ls6kGR+BYZd7JQCS06aaZYjXsmUWD0PpuG9Z03z6l+UGtWkOTKcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM5PR12MB1593.namprd12.prod.outlook.com (2603:10b6:4:10::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 16:29:58 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5%3]) with mapi id 15.20.5123.020; Wed, 30 Mar 2022
 16:29:57 +0000
Message-ID: <a85f7751-8e60-d8f4-a281-4fb50389ae7e@amd.com>
Date: Wed, 30 Mar 2022 12:29:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/1] drm/amdkfd: Create file descriptor after client is
 added to smi_clients list
Content-Language: en-US
To: Lee Jones <lee.jones@linaro.org>
References: <20220330075115.426035-1-lee.jones@linaro.org>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220330075115.426035-1-lee.jones@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::11) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d778f507-6592-4213-494e-08da126a8671
X-MS-TrafficTypeDiagnostic: DM5PR12MB1593:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB15935F560151244F129B1D87921F9@DM5PR12MB1593.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gt7UkPsFsnjxIeLaz192kqF2Y0CsMOmkBuz7T+JcePRF6yIcTmCMwqrrnu6pOMyyFgoX9xKR1MfDkU6dPBrEtZCvp2VT5WONRVLlQw8IFeUMeejiKfSMZUh4QILMvN8ethwOfNA0ezLMdk0pcc3/XRDWtiaMVCZC+P2XX5Hdjgeh3GDiujm4cxJZIqkwmZLprybyEBKmLQjt5ZjlwHMa3tyjGhOzF9a2uvmunhalCPe4r01AjFh5e9dUBofn090hAP7200A3NowdRfw2Pw9uaJAz5oeA/jgAWtNdt45z1QXIVPAorYxXVXFsSQd8/NtpXibzKFyeOnQzdNFT7mDH26S9lPbUQ5rLu3twbnsa7EmHhhMasUV+NR46DEVsDPnpbxJGLjbJG9hlYitq8L+6M41Eh5y7ZaqOeGZw6mrNZvwlix1b5OlLpCMl4ST7aRw9F+sGi+pKMEMdZWa1xqjnpHe03UH89jVmfj7448qDsoIy+O6l44xnn7kqCp6hFFag70rRdFuWPlJQSghPEaZ/UfSk4h2C4cRdOvpk4JmbqU5rp7f8CccV7XnnqW9wlQg8SNACSS7wo8YzHyQlBJdk/8LKe4K64hsR/mRF9z6y64fd+KB4zOOaVCsQbfgBaM0r9Wo8MQxI5mrOO9NvvetwjFD9hntZvHET82iZM0CjnOqnzWlmcM8qY8MlumHct3eBtbN8v9LM8dGPKDDoqyaw1hOq99tKHUlk05IqlTtGLypcpoq+lRf6tn2a6FILlQmd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6486002)(5660300002)(66946007)(66574015)(83380400001)(6666004)(4326008)(8676002)(2906002)(8936002)(6506007)(66476007)(66556008)(31686004)(6512007)(31696002)(38100700002)(54906003)(26005)(2616005)(86362001)(316002)(44832011)(36756003)(186003)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L083WW9xU2JEd0RoVEdpVytXWWNqak1hemthc1BVUitnUVJSWmZNaEwweTFm?=
 =?utf-8?B?L3FuNFdBSzIyZEVkRkxYVWhpRGxHTW0rb1piQWFRdllmTmhyZHdYL3kwY3R1?=
 =?utf-8?B?bVFGaGZjMVJqVVduUVh5RDEzWUJoS09BakwvNEVrVlpwZGNMZklmdHFhdWtM?=
 =?utf-8?B?VjZXMUNhYU93KzZjRGE3R0dyWUZtcGdvTEdQdktsdGhkZXplcUxuSGx0ajlP?=
 =?utf-8?B?dXlablJGSE9aU3lzelg0T24rQVJoM0NqenM5SDhGT0hMOHpuV1pWb2ZtNlBj?=
 =?utf-8?B?eXdUTVM2UHAzNHhRSTVhb2xob3ZYOWJRNWhLTWRRNTZlZHhVdVJESWNJYmox?=
 =?utf-8?B?eVZlVWJDajZoMnBxWkJsTjdyZ1ZOR1hNYmJBMW00aEQ2RjQ3SnVHS05EYXFT?=
 =?utf-8?B?eGJ1dUh6aGFYQ2VrMmlTL1llOVNLMVplZXowZjFWT2Vrc21GeWlJM2VXOENr?=
 =?utf-8?B?QnJrdDNjTnFFbkFyYmdCRnB0UE5BN2xDZkZ3U0dvM0dML3Ixd3E5aCtCSkxv?=
 =?utf-8?B?VUtSaXZqWFFSdjJGdWYzSmI0bEc4bFJ0eFhLK3FmREIvekxWaHc4Y0FJb0tt?=
 =?utf-8?B?UGtIV000QUF6L3AzMGhGRnBCRTBxRXBTa3E1RGIvbnp0TXlvb1RpME5SRkY5?=
 =?utf-8?B?Vk13S3doRm5VKzlyRjhXTWZuMDFhSDVnUWV2K3VVVXFEaUlsVm5QUk0yZUhC?=
 =?utf-8?B?RENMSDVKenoxQXZzTU9wT3B0Z3h2ZG52cWx4TjhIdWxkRjZEVnFZem5RSEw2?=
 =?utf-8?B?cS9qcW9odEVjQkk1SGE2YVlMWkVqZFNQN3pmSldyMVpIRGRKVW50SStPSSsy?=
 =?utf-8?B?NXFDTmNveElPZ0ZaQ2dWMmVQTTd2RU5FOHo0ckUvVXdJN3A4RnFxYW1LcFZq?=
 =?utf-8?B?WjdEQjcrc3ZhSmpHczd0WUs4YlBMbVpwVVNKMndEcWhlNUR1QzBldE1nM21n?=
 =?utf-8?B?Z0tvbVJDZnNqdi92Y3lUTnhSMjVGQ3lsSDlERys5S0hxbkM5Q0pZcTJhd3ly?=
 =?utf-8?B?UXZCWHlpTGcycUxPY0VnY0gyZTVxWFJEUE0rTFppc01MdWRsaVRSYjIvOTlU?=
 =?utf-8?B?dXgvMHRoMms0dVErWk1sSXB1UlBHQldLUUtON3lucUliUTFmSWFIcHowTVRj?=
 =?utf-8?B?ekhyWmRaY1E1NDFVZitDSGRjOEVjVjdTR3owY0dLZjZsVE82b2MxL1hNRWtu?=
 =?utf-8?B?dWQzbkdUaHluekt2VjVKZmxSVFV3aUFYelVMVld3Q3ZvTS9zcFhiRkhjeksw?=
 =?utf-8?B?OUdEQWdTRy9rM2E5MlE4NDZEZGI3QWo2azgraFZJcmlINTN3bFZiSU9ndTNu?=
 =?utf-8?B?bFVBVTA0dzlTUDBkWmhXUnJucW9oQi9CcW5yUEE4TXA4bUordXY0czV4enB4?=
 =?utf-8?B?VFJORFV6TEllbmwyUGhyN2ZsNGFlYjlyTnlsY05RM1hMZzYzMXVjMnNaaXNH?=
 =?utf-8?B?M0dtVjVCNGV5aGRoRllscHdWcXhFcXNKU3RtQU1GbGdyS3E0MDFEeE1VSk0w?=
 =?utf-8?B?REtxdWtvbTFmZ2Vpa3JKMGJ3T3ZVaExyODdKMExyWlhlNjZDZXJpaDk1a2Vw?=
 =?utf-8?B?WTBXUitWNzdBVjUxSmlodm9YaUo2c0EzeVFERDNJRTRxTUNSWTdjTHE4TXpZ?=
 =?utf-8?B?MWNKbk0yME9kSGZ0MURSa1lKWEZzUlRldFVxc1pWUCtnanRtZ2lQbDQ3RDFx?=
 =?utf-8?B?Z1UzVjgwWGJQRllGMWk2aXlpZnQyNElNZE5UZWJCU0h6eEhaUnZKVi80Zmpz?=
 =?utf-8?B?cGh3c0Y2NjJ5bXpMby9seE41cTltU1NIMGpleWdVYjhiTmtxQUkycUlpTzFi?=
 =?utf-8?B?VklPUmdMWEIxN3hyL0ZCbXNGL1o3c0lDOWFlZDgyand2TTdjcTJCNjM2ZnF3?=
 =?utf-8?B?M0J1dTNZbHlqdS9odTdPSmRHbE0vTEJXSDVCOWl5NGVhODJzazRPaEtELzkv?=
 =?utf-8?B?VEhBRUw5eHdzWWxaUWdlMkwxa0FxWFFXSmZDeGpWS2RlTTU5Sk4yUjJuU0w5?=
 =?utf-8?B?amFENGFmSUs1RE5HSUs5cDFZV2NvUnZ2Ymg4RHNiNW9QbmtJMExvU1FCQ1pi?=
 =?utf-8?B?aXI5eEdaelJUZlJNQThBYjlqb1lxSUpSR3lKY01OVXdHTkNTZnN0d3BqZ0Iv?=
 =?utf-8?B?emhxdkx0K3V1NUhpVzdvVXVaOVBVcG9BZTNFVk1WbHpzK1JZdWYyTkNQTHkr?=
 =?utf-8?B?U1Q5WWFUd1Z1eTBUd0tmaS8wU2xYcW9PVWhad2tGTEhMcjlrenNyQTAyYWxm?=
 =?utf-8?B?YVBmd1NXYi9YUWl6bHBwTWhFV2Y2dUxSS3FxK0M5VXphUkVrZnpNaG55WW5k?=
 =?utf-8?B?VVJoK2VUd0N5WndNYytERmtBTlJ6T045SHlZTnk5cGJjSTdzcE5XUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d778f507-6592-4213-494e-08da126a8671
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 16:29:57.7906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7ML60bU1mEZEATUgopxrR3oDblySMXIYxxJk+LHvQqTM68kTJsKDaqaW7NgTOh2OOi4DVu6Q3IiyFIzecrqrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1593
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-03-30 um 03:51 schrieb Lee Jones:
> This ensures userspace cannot prematurely clean-up the client before
> it is fully initialised which has been proven to cause issues in the
> past.
>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> index e4beebb1c80a2..c5d5398d45cbf 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> @@ -247,15 +247,6 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
>   		return ret;
>   	}
>   
> -	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
> -			       O_RDWR);
> -	if (ret < 0) {
> -		kfifo_free(&client->fifo);
> -		kfree(client);
> -		return ret;
> -	}
> -	*fd = ret;
> -
>   	init_waitqueue_head(&client->wait_queue);
>   	spin_lock_init(&client->lock);
>   	client->events = 0;
> @@ -265,5 +256,14 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
>   	list_add_rcu(&client->list, &dev->smi_clients);
>   	spin_unlock(&dev->smi_lock);
>   
> +	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
> +			       O_RDWR);
> +	if (ret < 0) {

Thank you for the patch. This looks like the correct solution. But you 
also need to remove the client from the dev->smi_clients list here 
before kfree(client). With that fixed, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> +		kfifo_free(&client->fifo);
> +		kfree(client);
> +		return ret;
> +	}
> +	*fd = ret;
> +
>   	return 0;
>   }
