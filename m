Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2F072E059
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930D510E369;
	Tue, 13 Jun 2023 11:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2084.outbound.protection.outlook.com [40.107.95.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869C410E369
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:06:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUmri13yqE613vmFt0vUhNQuIiWTZM8WliuK+EEEN6W2d57rDBjRON8AQXO2bevKlOqFBXhbdykRLERzK8DihPuy/ytIfkQF2CRHk3n7usgO6raaEWLzOIfBop1t3tT2myUDR0YRt2FAAqA2chV19l1FFVYdCw33wOm2955s6aJnXDdlVggTy/OH+YEGoDBeqeNujKZPDkURbQy7GomVkouoRKIqMvDT/gVBcCyBDT/QffqdzQx9jxSH8F2ACJNCP+Dpq5sPVZI6oqTTJKmQSkkhW0P1YlVMx98KUY9yXZUA5tPRkQ5yAQhzWBMS0GfzOInanHNILvI0JTCIIHyZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUcQ8aGMUjfRR2tnw5y2wQTGPTq4W2Jucj5G2OVujuI=;
 b=SFvFmnhzpolkSp8mKV6Mn/GqKKLJFhHHajqOiM6OFqMBlYcYIzmStUmng9uVfDxgj5e013g0pcGzawsSkF40vK54tjj173ihdUGm1rnhWA3OhzhoSXv+U5/t6hbxPQDN7UnxtZk8QumKC0S7r+kLeMTLAVLXcCq5O4S0MTgxq09wR6AjuL1S+FFQWhcWEJZo4Cf+/cKLknWny7SN6Z+swbykYxovTcR0yCzEdWVJAfPFTtdjVtMGCNKCPzyEPN4lidWPzP/I9QO8xlXQJGa0IGtY1Xw6PoxTxxcHwHzQL/ndmFLyXhbvOXt3rFkjYVldnbgpc9Sey1x9ZaAzWgGqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUcQ8aGMUjfRR2tnw5y2wQTGPTq4W2Jucj5G2OVujuI=;
 b=S8zpoi1b82pSXsE7g6tqXhASE37/QHlJ3SOnfB6NXmwTiMJY/jA/rBzQKEzwJzAQaYHMQ+mZyiGn5W+4nGOX7ojepq4OuqJ6d2+wxJX8QM1sbUZT5hWvehL4vBlWkvsYEhjbwpEfYLyd/IcI5PSdFiSNMfiVXb9nhGAEjEM5PBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Tue, 13 Jun
 2023 11:06:14 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff%4]) with mapi id 15.20.6455.024; Tue, 13 Jun 2023
 11:06:13 +0000
Message-ID: <7333ddbd-6444-a6d5-73b2-4d1648ec4cec@amd.com>
Date: Tue, 13 Jun 2023 13:06:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/sched: Call drm_sched_fence_set_parent() from
 drm_sched_fence_scheduled()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230613094424.2176746-1-boris.brezillon@collabora.com>
 <20230613114611.11402411@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230613114611.11402411@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::11) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|DM4PR12MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b72230-842d-4a29-d94a-08db6bfe3333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rh6ORfklCMz9vPAZkDOhnOhxHLzMMhzvtE4c0rMK5qe3umgjAATxT5oou4Tuk2j2JtMfcpEvf4kH3MEAM1ON/n0WXZeX5qXs0q7Mxp5bZeCGPeH6RAAeice0J//+yJ9ld5cd7NI7QV+n7hqD1IntPlzy065NJqa+BVF51NyCGEmGLmNvCtCDjQ/tWAcKP82J7QPHWdFGkrAnGWNQRigsbT9dgs1MGoe94gP+go9boBE6HORO3CRO7ENMRYUumS/ue0+SL98iJr3jnjDgn6tWfV4G83MQEGUVoXp3rnnCwHiZ1lZq8MN+KF1soVz33a5rUgcNioUMos+256qES2iROplGFRXjzo7ayesFpNLIUWMc6vNIIYjj5id+rQqvs4F6K1NBYmJ/yRDyfvQmw3QIMn/ye8kpPBhm2k+quQNmGqWi20Nn72XIdWlzXT8xG9+GaVd/GPRJNMFqJPLALCxvVI/24pI19Klx+4Lt69eYiDxO7seH9C4HyjUEphkwYJIQmWxPCdoOL/gzrZsVKTHpCq2cvi3fljdrsgpMQEfdSykVwIcpTWYOp7t5DMA9aALFkwIHqkAMB9tSJtxcTf37ap4WmBbjoQ94V2rNxxxM2EBsQpCPDk516YhkiZi8qlU989sBUdUBSdpw7d7nUX6Jyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199021)(66476007)(6506007)(66556008)(38100700002)(66946007)(4326008)(478600001)(6486002)(2616005)(6666004)(2906002)(6512007)(316002)(41300700001)(54906003)(36756003)(186003)(31696002)(8676002)(8936002)(86362001)(31686004)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmNBRU9HWmhxbnhBaTFEZEdKcjYzNG13b1dpKysyRTdOenhraFJnZFUvbk5S?=
 =?utf-8?B?eEVXeFhkNXhZMTFVMWVPdTVNVFNrQm1sVXlhR1l4a094Z0Rabi9ZVEZCay9S?=
 =?utf-8?B?NjhkZXBCZ3RHMzYvczNBc3c3VHFxN3RFQld1dldwTFg0bHo3U0E5WENwb3Zt?=
 =?utf-8?B?QTlPNnczVlpnWmxxMjJVTllVWGRheFZER0ZiM3FtSDNpa0ZWNFJFTkRVazU5?=
 =?utf-8?B?SEJ3b3JKWVBUNWRybU1TZUFuM1JtYnZPc3MzZGVBYlBvNFUxN2x1bzJ6L1g1?=
 =?utf-8?B?YjNsNnhJenVybGdoTUh2YzJjZFdST3RkSUhzZzVZMys1ZUdPcWRqREtaS041?=
 =?utf-8?B?T0JJZ0hVd1dKQmg4RS8vejVJSVhuVEFJU2RKVklUT0dDNnN1a29nQ0NVOW5h?=
 =?utf-8?B?eUV4b0ZYNzErMEx1M1FLZFhwZlZrYWNLSjc3MlNnTUZHOEhVZlQzMnZPaGE0?=
 =?utf-8?B?NVNoTVdpaUQzQlpQQVZzQThPSGtaMGp0WnYzSFRQUUpIbStaNjhmMFY2SXVH?=
 =?utf-8?B?RE92Ylk2VlpBT3hMZ1RNTDhoZFpTYlpvQWtSaTZaaXp4Y2VodkFoeXdHY3Vt?=
 =?utf-8?B?UmMyZGQyNytVS09Ycys2ZW5iVSsyYXYvczNHWXAvQlhTTXdEY3lzMjVTVlhR?=
 =?utf-8?B?VzNrLzBUajJJT29LQ3ljd0ZLTHloZEh6RmNycFVJU2tLUVliYmN3MmJGNzZh?=
 =?utf-8?B?VTBkVEFHQjJkQzFKWStKQ1JPdVBMaXZ5NmlJTVA4WWN3OW5LeFI3Z0VQUnZM?=
 =?utf-8?B?empvQi8zMGhTRVk4WG5XdTFCSTR1NklUR200R3RQN0xXV0VGY0Y1NkxoVWVi?=
 =?utf-8?B?OWJkVU9leDB4Qk9nY29sbmJqbGJ4dVNZUS9JMXpNRTBrZVQ5MTMrMTB4STB5?=
 =?utf-8?B?OFNYbmhxc3EyNldoZG1WSVA1WDFIT3QwWlJlZ2VXZjRwY0FUYzlMQzFWY0ZU?=
 =?utf-8?B?dkpBR21uQ095MHc0Nm1KOW5uaUp1bm0zZ2xGUmcrT3ZKOThRS3VkM0VLaGsr?=
 =?utf-8?B?UDBjY0M2ajN3VnpEd0lXdm0wOStHQnZ3RGdPOUdNZWFSL1RGaGEyUnRzMjZH?=
 =?utf-8?B?MXBtN1Jlald2Y2J5R2Q0TkZKcTQvZ1BYSnNNTm45L21EMUVpbFlxUE1zSEtk?=
 =?utf-8?B?cnpaNUdKZzhsY3N0eDEvOVVkRGlpY0hUdFBzUUdvcGRDM3hGMENDZyt6bDIy?=
 =?utf-8?B?emtQbzU1bHBNTXZRb05zNUh4WjR0Q0FWMEMwWUNuSU96S0h1bHNqdGpRajZw?=
 =?utf-8?B?NlNFUnQ1emZvR1VqdGVoYTNJWXBzN0dnR0czM2dwQ1phTnczUVluZXVuY3dE?=
 =?utf-8?B?RHhUQWt6d25zQW44VUI4WTJpRVFEcVltY0NIWUMrRzREckZsOUlqcXdjM0Rp?=
 =?utf-8?B?cjcvMUNMc09vYm9aRC84ejhVVnFHT1pSalp3Z3ZGNFVTYU5lS2xVbzNydm9M?=
 =?utf-8?B?UWF1cWNOUG90TzdhK0NjUUtXdTEzaDNUR1pIbllFQlJDMFZjY0JGU2toNjBP?=
 =?utf-8?B?U2o0MGppRUlRazlVU1ZsUXQ1anFEb1M5Q01YUnovdDBWUjkvM2RZWkdXTTJP?=
 =?utf-8?B?Mk4vdlVoMU11VjNvSmlHbVQ2bFJGQjJFTEd2VWVvbFZLWERvSk1TdVJXWDdR?=
 =?utf-8?B?a29XRnpBR0tlQlpBMlJKMGxZb1ZDaVQ0RVdxdisyTFRITEJzZnpBNnJQQmtM?=
 =?utf-8?B?MEZLdUhnL2xrczdteTh0SEErb0NRMGJpdWJ1dFoyTnFVTkF4b3BUZllYTFgr?=
 =?utf-8?B?YmFKak82TmZTSmN2VkZ2NThzTngxaVFXVHJweW1TSUZ6cHFCVUhJZmxZRHlM?=
 =?utf-8?B?TTc2amkvTVExRjBsNGJiczFoWE94QWQzdjlOeEJwYXJxZDFmekFQUCt6ME5R?=
 =?utf-8?B?OTBmQ2Z3enV1TlN5QzNaZ3NmZndaWjJqYW5CUkdEYTdGam9rYTd2REtYR091?=
 =?utf-8?B?SWNMWC9iYlNKcEMvZ2NTNjMvL01oU0hMalIzbDZtK1c0UnZuRXg5TDU3WlF6?=
 =?utf-8?B?MEU1TzUvQU8rdzlTb25XMFNFT1o0eUl3MU9tTHIrTUc1WFM1NHBtQi8xL1Yw?=
 =?utf-8?B?V3JaNzk0cTNsV3dKM0hkckp4eDVMZG5SZnR2czJqcDc1S3hmK2l4UVFaeC9a?=
 =?utf-8?B?cEw3RW04ODRvd1Yzc3RTekp2bThDWVYwRjZFd1pndDlVNHBUbEgrY1lkenVL?=
 =?utf-8?Q?bTtJhej+Flm9eQ1WJUJJmdUo8N0xYk+TQtVF62rsqnzf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b72230-842d-4a29-d94a-08db6bfe3333
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 11:06:13.0857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pGRsel6xowUcUMe0LoQWUZ/u/92L1Rbf/DQHTt066YBtbek+uDj8vvwrvMFMLgH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.06.23 um 11:46 schrieb Boris Brezillon:
> On Tue, 13 Jun 2023 11:44:24 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>
>> Drivers that can delegate waits to the firmware/GPU pass the scheduled
>> fence to drm_sched_job_add_dependency(), and issue wait commands to
>> the firmware/GPU at job submission time. For this to be possible, they
>> need all their 'native' dependencies to have a valid parent since this
>> is where the actual HW fence information are encoded.
>>
>> In drm_sched_main(), we currently call drm_sched_fence_set_parent()
>> after drm_sched_fence_set_parent(), leaving a short period of time
> after drm_sched_fence_scheduled(), ...

I was just about to complain, but yeah sounds like the right idea to me.

Just let me review the patch in more detail.

Christian.

>
>> during which the job depending on this fence can be submitted.
>>
>> Since setting parent and signaling the fence are two things that are
>> kinda related (you can't have a parent if the job hasn't been scheduled),
>> it probably makes sense to pass the parent fence to
>> drm_sched_fence_scheduled() and let it call drm_sched_fence_set_parent()
>> before it signals the scheduled fence.

