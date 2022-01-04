Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF9448497F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 21:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B60110E2F2;
	Tue,  4 Jan 2022 20:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE61D10E2F2;
 Tue,  4 Jan 2022 20:54:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVA5+ikU9vmd9s7RYth0PVMXFGHjdtHaZRgOp25LWJUzYXb64Pw5WWfxNbDZ+Vt/FfxpdNQ19Y3Ds/hLPPaZ5sDHaNDwgTx1GDbSpvHedHDv9pk8byg9SO2ePS6Q0NmOby9Ia0544kzYWbV1TJTJG30xGcdW4xMyBui1dWHvSihKkD+VFYMqL/CJmA9I3WpoGHEYq80SV8Q4pcEHD7sXK3G5aXVY0o5k4gNywDA2+2OU7ZlRpS3W1gfz9A64GB3LuTCOoVlRteigyebwJCHdY/+i3er9khICe1gcZnn80rnLCRQrgzTepoRB/agzaidzeAqQfmgMg5G3J4zSf+RoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViIFGJmt5nYx1SWWSVCmKtxEAwevOTC2tuNWBuWZFs8=;
 b=QxwL0bF6dLCtv1NP/lBw0ledtBvkDuONz+YueSQmmu6Y8jDaPwMnfdFex4w1CigR0a0VD0oy8Txpm9vDu7due7wwaY43s4km1yYzsQdkBqFT87l0gStGXZKyv8zTpg+LC59QbHUQy+FUpG21aXOGBIU3r+7nf8znXJVUYLAbKdPZo3yzotl7jLuZlhbpNXB3QbqIXeITWR/wMron7uilPzhlZyQvJCJIz9YeDJYlLGUR4dQTJqhl3iujX6pCt8zwOQTvDjyf8CFW8Z5eliYELS197J0oja+vfwPHv7hN3EtA1Z5su4g3t4Vx91nAQu7LRhmkVeiuVZGF+3dgwJeO8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViIFGJmt5nYx1SWWSVCmKtxEAwevOTC2tuNWBuWZFs8=;
 b=PgDs2qgbqZtFfHo1bIoGsJs4h9oK2w+aPWaQ5SAHJqOClkj2bCwgQcsgo0hEkXwrQHD0GwTkFpcnlRrf60dlMKanclNsPaZeigcL9zByFJUTa8ipyJfR4ahGdkEuSiybcXmydoZRfnDQ9ekL1Dl0a+G4YkHSstPYHrPtiP5lqbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3004.namprd12.prod.outlook.com (2603:10b6:5:11b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 20:54:38 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 20:54:38 +0000
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Deng, Emily" <Emily.Deng@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chen, Horace" <Horace.Chen@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
 <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
 <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
 <cc8e296d-360d-9a2f-85cd-f47d55581e99@amd.com>
 <f5ba0a69-1cae-7d8b-bfe7-4e4400e9c32a@amd.com>
 <2dee6f65-9ca9-a332-7206-f24021fb4c44@gmail.com>
 <b5a31f18-262d-951e-2530-bdb0738e5033@amd.com>
 <20363a4e-b282-232d-34d0-14867bad4931@amd.com>
 <BL1PR12MB5269922395096810CC79E66D844A9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <23bebf13-c622-7c61-af88-0e0970b90389@amd.com>
 <CH0PR12MB5372A0240BEAFB02406899E9F44A9@CH0PR12MB5372.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <e91e1c03-1329-aae7-5c9c-eb27adc0375e@amd.com>
Date: Tue, 4 Jan 2022 15:54:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CH0PR12MB5372A0240BEAFB02406899E9F44A9@CH0PR12MB5372.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: CH2PR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:610:20::39) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e451c742-efb8-48b7-f598-08d9cfc46ba1
X-MS-TrafficTypeDiagnostic: DM6PR12MB3004:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB300473E0C1411A63AF269AE9EA4A9@DM6PR12MB3004.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQ1oC0prIyGANj/veX22qXksX1Fs0ytnnial1WqgAY/P5wKH6bAhENzzshSJqV4uU/XQckI4sF9BM4KoHats6dqteMWWZOu1hOSGv5AKiFq4N6nljRF+HjKjYhCf7lQ19BDwf57qaRcuQkTqEwaVc8AwUz4J6D5jLk/bcN7RXkw28l7WbVKufQgLk4AMwWv+Hf9ABcn+wY/Xw3JWAGknfY/DLwmtGwQVP6YG/UKb+6WkEK76bBPzVl/7HvSNt9K5fH+yS3DCBBcDNcu0NpJqYXzZp0gP17tKPdVR3Zb2fTX7d1uxZVY60A7eled997672nA/xQAEZxK8irDB9uv1nP91zbnD7I47sMnb+FKr1pHYV6uQBNM9uKN4J4Kk6b6S0yWLP7vhr0NOsYujU7fJhK7L/m6jC8WP6gA67/CQ2rPlkfgrlKgG9ZPCAzHO4JJog3v2BUpwe5UenLu3FNFOW7M+h8zApAZ/wAQaj3Als0/lSsvCutSY+KV2O04bns0Gj2kr4NBOPVWLm+IA5rwC0t9zsJrP8ICY61i0faiuC+aIw0u1O79To9VglS7Cunx1yDtzxyrRrUQZlYhh+urDj1H3S7gAi8Iv3LuPBZgXHurmyQSO+rFgevgDsqUTOshOJzukhzQ0f7T9+45Vzjrm+jgu3StOe0nbqtSE+OEspzZ0OlZ7E5dMC7WR69eZL/jiOp2WIPmUxn6x5AD3tqgFa9iDj4bxKrXt2Z5BxuMwPDibUa4+ePtfcksb7SB5ZdsEtLQO90OKywZnRLFvlOQF/zWWx1cjfA6cpyc+iubsQ9/r5NJHGV6T7QJYa9MTe0KkgHlgniYlGma70mEgkKLp1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(316002)(6506007)(6636002)(83380400001)(53546011)(6512007)(8676002)(38100700002)(31696002)(36756003)(2906002)(66476007)(4001150100001)(186003)(8936002)(86362001)(5660300002)(31686004)(110136005)(44832011)(4326008)(66556008)(6666004)(921005)(2616005)(508600001)(30864003)(66946007)(966005)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmtYQkdPcG1QTXFqR2w3aG9La0hSdDhrTXhrYkl6Qk9weW1pZ09ZR0dyYzFQ?=
 =?utf-8?B?YnlPUndxS1ltNXNkRUVZaDRCUHQ0bUZHb0VURzA2SEFlYjU0OGRvK2VNSE1a?=
 =?utf-8?B?VFVKcGQxeHA1SVJSeHpLMy9SeHZrMmZqYzR2VXh0NUhUbHdzWmo3NHI4TFg3?=
 =?utf-8?B?eXRJQjVLNnBZSE9xMXYwcG42UEhRRitLbjdmYUVqeGh2NTZMQTdkN08wUHd6?=
 =?utf-8?B?Q0plL00yQzA1YnFKb2gzbXo4cWdqWElVUjVGbXM4RTZTdDV1RnhtK0o2a1ps?=
 =?utf-8?B?WndRWnBERkEyUjBJTlpyZHMwOG1hemJKNTdyblhFWWxYeUxoMDlFMU5zeGww?=
 =?utf-8?B?cTgvMmg4b2JrNXpPQ0tyQytOb1V2VGJwN1RoRStBZXBWSC9rUElTUnB0Y0VT?=
 =?utf-8?B?MU12YzlzN1J1aEIyZmFEZDR4MlEyS3BoYlZxRU5DMU9xV2NMQnVDZWZOVkNX?=
 =?utf-8?B?bGZtcGVPYjd3NHoybVpDL3kwV2pPdEgwT0ZZWHFxVUczNGdrZGhBTWZ6OFBU?=
 =?utf-8?B?dVlwRW9sb090ai9pS05FSkdMYnAxRFpjQ1B3UEU1bXdRNUlEZ3crUDZDd2NS?=
 =?utf-8?B?TXdCNHVtck1PTWJRZnVwTHRsM2xCUVBpNWpUam1lZFJCeDNaM0JrTkJOSjRo?=
 =?utf-8?B?bzNtT2gxS1R5dk4xUDZnOWlSSHZsS1MrN0V5REY1b29DMWFxNzhpN0Evc1Uw?=
 =?utf-8?B?VzV5QWpjZklJeDJ0d3YwRmdUV0lhbDZJV1F0Nm80R0tVazdSVUpBd1NUck4w?=
 =?utf-8?B?cnErOHI5ZWQwMlZ1c0xLL0JoWkNzenp2MjBpSmxzanFsQWdVKzFiSW10RWZR?=
 =?utf-8?B?ZHByaXJQNjZ2OGtzT2kxdmFTME9QYm5ZSDdxdjRnY0U3Sk5sZCtLSVFsdE9t?=
 =?utf-8?B?Ni8xdnh3cjhtanFmSGEzUmdkS3IxZWlWS3haRG0vUlVhVEZyWjN5YXNSY3ZQ?=
 =?utf-8?B?TFBla29VemZNY3hrbnZDQkhMZkRTamdKM1M5UXJMa29uekhsTHlzR3FubTdU?=
 =?utf-8?B?K055U3JaRGlKbnBYZ1c4NkNPZEIzcnNRMlNOUmNEZ2kxamFudXJ3SWhQOWVo?=
 =?utf-8?B?RURTY3FDTzNjZkxvOUh6eFBwOGRMWWljckxUUkpDaXIwemdsbm9CRGxoTTZF?=
 =?utf-8?B?RUw0VTcvQTBFVnhRR1k0ZnBLcThsQlJIRnRGcDBOa2poN0RoQVIxaS9tNGZV?=
 =?utf-8?B?ZjVUM2hYbFZZZGRBajUxYS9MaFhkY2xyWmlPWDNjTXFaMG1RMXF1NnlrNmdt?=
 =?utf-8?B?NDdySkZPL2ZOeTFtd2M5RUlTMWl4U1pPWFNENGhIU1pzanZaMWgxbVhFL2tQ?=
 =?utf-8?B?MnhPMFh2Rk1IZVVaUU1nQ0RxYUNBaGwrbG8rbVBrdkMwYVpSWVZQU2JZLy9z?=
 =?utf-8?B?Q2JhajVwUURibXQrQUp2aVJpOEYvZW01TXppSXpCVi96RWNWMlNGWlVTRk5B?=
 =?utf-8?B?cHA3Tjc0SEhONGJ1VHZ2WXFrNEJBa1RNaG95SEkvZXc5WTkxc1g4VmlSK2hz?=
 =?utf-8?B?WXhvb2ZqV3BjN0grQU0rOEpIeGtleC83eUxMay96Ym1hZ2NXbkxyNU5WK2hX?=
 =?utf-8?B?UWlqaTVycHRYL3ZHVWsvcHN0VVc1MUY4MjJ1a3U5MmdDTmdMVkFnWnFmeFZj?=
 =?utf-8?B?aGkzQ1gyMVVYUnNyTFFRc1lBM0VpWG9HekxoTlk1K3Jwa2RZK0tKUG9FRU9J?=
 =?utf-8?B?TjBnd3VWS0ZOSnRkcForaUFycjlvdWZwOC9kcWVOZHgyZ1plNGRJZTNGZnlq?=
 =?utf-8?B?V0NacDJDNEN6WXNuU01LSEVZai8ydy9PVnRBekZ5b1dOdVJLM0V0SVVocVB6?=
 =?utf-8?B?cnFQbTVhU2JjMHdZb3BUOVpzT1dYVkJPZVhRMVdvQzRQT3ltMUgzZlRYamJL?=
 =?utf-8?B?SFVzOURUUWExSnNpZE41OHVkNWlMZTJKTy9hWm5iT2QrdkRiZzU4dzBSdzMr?=
 =?utf-8?B?MGljdkxJWDQ1UFNBSlV1bGt3WEUyOCtEMTNtbnJ1a29JOXFFcnlFN2tUeHdZ?=
 =?utf-8?B?dDF4NWtxdmlKUmdoNWszNW5hTU93aHNFNWd4bm5oOS9QZ21yRzlmSmUxSUlV?=
 =?utf-8?B?dUFWSmUralo3RnZkTkp0MXducU51Ny9pZ01XcDEwT0dFYXdtSkxySXVJVVg4?=
 =?utf-8?B?VEVEampjWFRVZWN4WmdVS2ZWclM2OWtrM3BIREw2RXloZm9Tb2R1dnBDdEh3?=
 =?utf-8?B?VUF4ODVpUXVIcEVRT1drWGdaYVB5aUxaZG4xeU9UdDNkd1lNYWJoSHB3VGxF?=
 =?utf-8?Q?1AtydgrTy+hN5W30dLDR8J/QfFJmkESuU3/fI0CRDU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e451c742-efb8-48b7-f598-08d9cfc46ba1
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 20:54:37.9701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6mGeCXwherBHJvk5EXNxTZB8PYYzqBRmzqkJ9Xfgvo+E0lid1QtByoIhUPxIuyeZkYtEWQkiyOHnhKJMNr+Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3004
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

On 2022-01-04 12:13 p.m., Liu, Shaoyun wrote:

> [AMD Official Use Only]
>
> I mostly agree with the sequences Christian  described .  Just one  thing might need to  discuss here.  For FLR notified from host,  in new sequenceas described  , driver need to reply the  READY_TO_RESET in the  workitem  from a reset  work queue which means inside flr_work, driver can not directly reply to host but need to queue another workqueue .


Can you clarify why 'driver can not directly reply to host but need to 
queue another workqueue' ? To my understating all steps 3-6 in 
Christian's description happen from the same single wq thread serially.


>   For current  code ,  the flr_work for sriov itself is a work queue queued from ISR .  I think we should try to response to the host driver as soon as possible.  Queue another workqueue  inside  the workqueue  doesn't sounds efficient to me.


Check patch 5 please [1] - I just substituted 
schedule_work(&adev->virt.flr_work) for 
queue_work(adev->reset_domain.wq,&adev->virt.flr_work) so no extra 
requeue here, just instead of sending to system_wq it's sent
to dedicated reset wq

[1] - 
https://lore.kernel.org/all/20211222221400.790842-1-andrey.grodzovsky@amd.com/

Andrey


> Anyway, what we need is a working  solution for our project.  So if we need to change the sequence, we  need to make sure it's been tested first and won't break the functionality before the code is landed in the branch .
>
> Regards
> Shaoyun.liu
>
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Christian König
> Sent: Tuesday, January 4, 2022 6:36 AM
> To: Liu, Monk <Monk.Liu@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Deng, Emily <Emily.Deng@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>
> Cc: daniel@ffwll.ch
> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
>
> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>> [AMD Official Use Only]
>>
>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR
>> is about to start or was already executed, but host will do FLR anyway
>> without waiting for guest too long
>>
> Then we have a major design issue in the SRIOV protocol and really need to question this.
>
> How do you want to prevent a race between the hypervisor resetting the hardware and the client trying the same because of a timeout?
>
> As far as I can see the procedure should be:
> 1. We detect that a reset is necessary, either because of a fault a timeout or signal from hypervisor.
> 2. For each of those potential reset sources a work item is send to the single workqueue.
> 3. One of those work items execute first and prepares the reset.
> 4. We either do the reset our self or notify the hypervisor that we are ready for the reset.
> 5. Cleanup after the reset, eventually resubmit jobs etc..
> 6. Cancel work items which might have been scheduled from other reset sources.
>
> It does make sense that the hypervisor resets the hardware without waiting for the clients for too long, but if we don't follow this general steps we will always have a race between the different components.
>
> Regards,
> Christian.
>
> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>> [AMD Official Use Only]
>>
>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR
>> is about to start or was already executed, but host will do FLR anyway
>> without waiting for guest too long
>>
>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>> It makes the code to crash ... how could it be a fix ?
>>
>> I'm afraid the patch is NAK from me,  but it is welcome if the cleanup do not ruin the logic, Andry or jingwen can try it if needed.
>>
>> Thanks
>> -------------------------------------------------------------------
>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>> -------------------------------------------------------------------
>> we are hiring software manager for CVS core team
>> -------------------------------------------------------------------
>>
>> -----Original Message-----
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Tuesday, January 4, 2022 6:19 PM
>> To: Chen, JingWen <JingWen.Chen2@amd.com>; Christian König
>> <ckoenig.leichtzumerken@gmail.com>; Grodzovsky, Andrey
>> <Andrey.Grodzovsky@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Liu,
>> Monk <Monk.Liu@amd.com>; dri-devel@lists.freedesktop.org;
>> amd-gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>;
>> Chen, JingWen <JingWen.Chen2@amd.com>
>> Cc: daniel@ffwll.ch
>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>> protection for SRIOV
>>
>> Hi Jingwen,
>>
>> well what I mean is that we need to adjust the implementation in amdgpu to actually match the requirements.
>>
>> Could be that the reset sequence is questionable in general, but I doubt so at least for now.
>>
>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>
>> Properly setting in_gpu_reset is indeed mandatory, but should happen at a central place and not in the SRIOV specific code.
>>
>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>
>> Regards,
>> Christian.
>>
>> Am 04.01.22 um 10:07 schrieb JingWen Chen:
>>> Hi Christian,
>>> I'm not sure what do you mean by "we need to change SRIOV not the driver".
>>>
>>> Do you mean we should change the reset sequence in SRIOV? This will be a huge change for our SRIOV solution.
>>>
>>>    From my point of view, we can directly use amdgpu_device_lock_adev
>>> and amdgpu_device_unlock_adev in flr_work instead of try_lock since no one will conflict with this thread with reset_domain introduced.
>>> But we do need the reset_sem and adev->in_gpu_reset to keep device untouched via user space.
>>>
>>> Best Regards,
>>> Jingwen Chen
>>>
>>> On 2022/1/3 下午6:17, Christian König wrote:
>>>> Please don't. This patch is vital to the cleanup of the reset procedure.
>>>>
>>>> If SRIOV doesn't work with that we need to change SRIOV and not the driver.
>>>>
>>>> Christian.
>>>>
>>>> Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
>>>>> Sure, I guess i can drop this patch then.
>>>>>
>>>>> Andrey
>>>>>
>>>>> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>>>>>> I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.
>>>>>>
>>>>>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>>>>>> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>>>>>>>
>>>>>>> Best wishes
>>>>>>> Emily Deng
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>>>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky,
>>>>>>>> Andrey <Andrey.Grodzovsky@amd.com>;
>>>>>>>> dri-devel@lists.freedesktop.org; amd- gfx@lists.freedesktop.org;
>>>>>>>> Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen
>>>>>>>> <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU
>>>>>>>> reset protection for SRIOV
>>>>>>>>
>>>>>>>> [AMD Official Use Only]
>>>>>>>>
>>>>>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>>>>>
>>>>>>>> Please take a review on Andrey's patch
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>> ----------------------------------------------------------------
>>>>>>>> -
>>>>>>>> -- Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>> ----------------------------------------------------------------
>>>>>>>> -
>>>>>>>> -- we are hiring software manager for CVS core team
>>>>>>>> ----------------------------------------------------------------
>>>>>>>> -
>>>>>>>> --
>>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>>>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>>>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>>>>>> <Horace.Chen@amd.com>
>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU
>>>>>>>> reset protection for SRIOV
>>>>>>>>
>>>>>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>>>>>> Since now flr work is serialized against  GPU resets there is
>>>>>>>>> no need for this.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>>>
>>>>>>>>> ---
>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>>>>>       2 files changed, 22 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>> @@ -248,15 +248,7 @@ static void
>>>>>>>>> xgpu_ai_mailbox_flr_work(struct
>>>>>>>> work_struct *work)
>>>>>>>>>           struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>> amdgpu_device, virt);
>>>>>>>>>           int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>
>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE
>>>>>>>>> received,
>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>> -     * the VF FLR.
>>>>>>>>> -     */
>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>> -        return;
>>>>>>>>> -
>>>>>>>>>           amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>
>>>>>>>>>           xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>> 0, 0);
>>>>>>>>>
>>>>>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>> work_struct *work)
>>>>>>>>>           } while (timeout > 1);
>>>>>>>>>
>>>>>>>>>       flr_done:
>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>> -
>>>>>>>>>           /* Trigger recovery for world switch failure if no TDR
>>>>>>>>> */
>>>>>>>>>           if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>               && (!amdgpu_device_has_job_running(adev) || diff
>>>>>>>>> --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>> @@ -277,15 +277,7 @@ static void
>>>>>>>>> xgpu_nv_mailbox_flr_work(struct
>>>>>>>> work_struct *work)
>>>>>>>>>           struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>> amdgpu_device, virt);
>>>>>>>>>           int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>
>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE
>>>>>>>>> received,
>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>> -     * the VF FLR.
>>>>>>>>> -     */
>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>> -        return;
>>>>>>>>> -
>>>>>>>>>           amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>
>>>>>>>>>           xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>> 0, 0);
>>>>>>>>>
>>>>>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>> work_struct *work)
>>>>>>>>>           } while (timeout > 1);
>>>>>>>>>
>>>>>>>>>       flr_done:
>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>> -
>>>>>>>>>           /* Trigger recovery for world switch failure if no TDR
>>>>>>>>> */
>>>>>>>>>           if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>               && (!amdgpu_device_has_job_running(adev) ||
