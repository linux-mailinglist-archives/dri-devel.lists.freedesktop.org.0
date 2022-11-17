Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B5762D77E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29B010E5CA;
	Thu, 17 Nov 2022 09:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD1C10E59F;
 Thu, 17 Nov 2022 09:53:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFzgG7xo/Y2ZNg3gVxGuwCZqfOJdR2SGkw7gri2rqUOYcSZgca5536ACtRQfEAXXw6sA67wcHtjmARnwqIHNtk0wnuK0q1nGlin/AKOPooZ3d2aB80TN2jTyN/0V21tWHG5q/Y3WMM+khfkIxSvXWST2o5JZl2J5Fjvf76Ax2Mdn8HZZAkGeuze0M6MMqRw+58zm4EUZgjn214j4a4O4Rd6f7v41M559JMwfCDSzQD0sGjaMS9ETXFrIFGyfSO+5GN3Rno1ZddK7w7tQTEk6IqZxMhnu2agyyRmp4fWws5v5qz2zF1mk5aX7aqarrOL5Eq67bGFeDOHHAyfJ2ae1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BY8Di1cSZQ8VGIXlGgMpHa4TnHN65kzQOQfHtknFhQ0=;
 b=mjw5WKJ6Lle0lHap6nMXg6CGA36L5wQP7xSwChzkYk3Z4NgD2EZRPQQsl4duYYBe25SOWIX7ylggvYMjy9VYuIDbOf8RkDZvQE+Ov1/5NZGOV6MQNlaCUMfJKB+6o/IWTsbIWthVMbeXwiLpuPekKfsGKyOtyffZPGeAWROIIw16HVHIrNyBqRdIosOrgbWuyj+TInc0NWa5twxKmeVfIcO3CsKvCm9SeCckfeZ93aEagDtDwuWYK6SpzTQwg1pv0yNHBqTz39QnwTZdyVxwrD316vVWcJEi5vp55ZcW9Id+a/jWOW6iJkxDdWyjuMjUGzZgz7KSh/iGWlwyC9xZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BY8Di1cSZQ8VGIXlGgMpHa4TnHN65kzQOQfHtknFhQ0=;
 b=iwGItMCBGHT6PqQbNFEb1YKib6p4OYGghvN+1gyZ5Pg5MdcjIUzpyq8Z9Yv9oOEnoMg9Rd7srucGhwlbai8rgI5slxucOW8eDzNQMRdUBu77klNLGxV3FEUHLGaU1t7PMhWY0npDjVeLwmd7all10wsCrP0BLgGM74iBGcjhB4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6227.namprd12.prod.outlook.com (2603:10b6:930:21::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Thu, 17 Nov
 2022 09:53:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Thu, 17 Nov 2022
 09:53:28 +0000
Message-ID: <da420e53-cafd-b46f-90df-ed54e6de09a3@amd.com>
Date: Thu, 17 Nov 2022 10:53:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-13-christian.koenig@amd.com>
 <1b1fae07-a5c3-e982-94a2-c35ab26f0e91@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <1b1fae07-a5c3-e982-94a2-c35ab26f0e91@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: aab601f7-6db4-4380-a9e8-08dac8819405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vLsjZDGrwa7P80SmQXeGgo4PoREciyqY5yxI1TUn+LIlmfuTmwvyoyJnUA5oshMByz/XqSjKKKdnSFc53sICiMJwHgzYo0wnWUCvROT/f300WOZgpIozKTtmefi5noqEt9Xd/mu44/tEPb11wGMxK/kjPVK2fTx5m8eT2jf4c6oGm0b4X8RmhpcKfxX7MIQniKByHjzhT5GibzcBO/C+p64tbqgvg2CjksUby4qSZGDmTtCFUvfV5h1SIPGy4uCQbleHnbnsJCqQGP5dOecTHyamBYxX52ylzcD8L8KNPVWpRh/6qWuR2cw5tUDubiZzxtLcbelgk/M0d9RynpGGUe/eXkbTyY0/6lQr0lCc3lwRT73TFex13qs4kSFHQRv8SpNrYJlQymOy7fmjCaniyA0umraMOofUcoRUtw9OsUNKqIMe4X91GvP+wajzSAMejifJhKAO1rIWL7Q52Tqx9HWSSTRNEbPCk5G61HfdFlsjPdZ4795/dozqk7cY1cB8P7rK/1GoicdP0NpwX9KBZmn6y/bO0OzQNaW8wyh/5azaMRccjh7aD0QK59Kj5xkTufSYD0oaybYNNeen1KB5MOIODNp3+7jW1KUqSJy7bK4wZeTNGtKkeM/ELAJdH3dJipHK+QuM2BB+DX1VsG8ZZeG0qVjyPmQwK+4wUwnvhQ8R4M3zd7j4zd1bzG6cZF6KQx/oC9ygNrwQmNCzvPJnxkuJB0k0JoQ71DlYNfNcwXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(83380400001)(31696002)(86362001)(66574015)(4744005)(38100700002)(2906002)(41300700001)(5660300002)(8936002)(6666004)(478600001)(6506007)(186003)(26005)(6512007)(6486002)(8676002)(66556008)(66946007)(66476007)(316002)(2616005)(110136005)(53546011)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cC9IT2t1YitZNzNjdm14WDBaS3ZCSGlFaGEycVErK0gwMXNFc0NRL0JtZWtk?=
 =?utf-8?B?K3FVWmRRcjNtckcwOVdZbVdybzZxYUpudW1UTGQ5d2MxR2g1NGdKWWlPdjJk?=
 =?utf-8?B?aXpXaUcza0lYaU1SZXJuaFVHMkNzeFhaZDVnZFMwYkZnUjdleGNYMDhjQVFm?=
 =?utf-8?B?ZGZTMDMwMTFHVEM2eUUwSUsraHlVUW9peUVNRkp3Y3RlYUJYSXNpdWdMa0g2?=
 =?utf-8?B?aGg0cHhlOWltZXVsQTlVbkYrZG94K0N0L3hHSXlyZWRRZmtETVA3aEd4OGUv?=
 =?utf-8?B?N205Nm00TWdVSW1pOWdaQ1JjbWQ0VzdVWXJJVTJEbTlHZUtkUVM4R0ZmM0Mw?=
 =?utf-8?B?cktMVVpuZ2FsNkdLSkcxR0g4N0NQSUVCU05lTnNrTEowRWNkN0pjanpuM3NB?=
 =?utf-8?B?N1dBREVXbGxiN2lNQXd6OStRYkE2a2oxcXBjaVErTHN3aTVPRndGSTFhVm9q?=
 =?utf-8?B?eGhMYWlHZi93Q3VnZkFESTBqeGFHbFVmUzBDd1VWTUNLZVlPZlVaS3h6V2kz?=
 =?utf-8?B?aGFOdzFnRXlMZnZ3Yzd2STQ5d0haanZoSnpLK2VFNWo1MlRjK3ppeGhFZEdK?=
 =?utf-8?B?S04zRGx1NURLNy9ZdlNTOTB5TUo0em1XRDdVbG5OYW9CVHV2bEk1OCtidjJQ?=
 =?utf-8?B?b1B4RmE0enR6a1NFeEt2blllOWJrVE9ydGUwRk1JdkF0RXN3SnZxOGtFYVlB?=
 =?utf-8?B?eW1lSU9jdDdicHFxNTNGc1hpQ2s2bmRWNDc2Q2NIWThMYVNSSTRRY1pNZFBi?=
 =?utf-8?B?c2MydWJCY0o3ZjN2Yk13R1FNODlPMWhpQ2NEa3p5WHpUcURGYkErN1I3c0Vi?=
 =?utf-8?B?bHQxbndETnYvNjYwaldJdlhtWUNkWXFRQnlzUE9LVm9KY3FvZXFjbGVEQm0v?=
 =?utf-8?B?MlZTODh5NUhESHVDd0J2bmZDSnNnSjlxRFRmMzFwY2lQVUQzWWlRWkpjdkJU?=
 =?utf-8?B?eGN1SFZxc1AxOWxWMFYvT1lCdDYxOVRoL0pxbWtNSGdFZ21IQTJ2Y0RmL25Z?=
 =?utf-8?B?bmlFM3JyNGpHd2dpVDR4OENhMlNUR3dlUlJFUU12ZEtvU2duVlVtU0pKeWVi?=
 =?utf-8?B?YXNncmhIUXFCd1BpdlowTllUeEd6WmViOGJKUGM1ZUdoZVVuWVFxV2lMaWZs?=
 =?utf-8?B?dk9SaVduRnhwQkxSQzV3ZmZJcGZ2dWJFYkNtVzhNQ1E2VnQ2b0hSZnYxbm50?=
 =?utf-8?B?ZDR3RmxTQmllb2U3MlZGM0c2dlpMMDIvcldtdklDUkFCamRuR3N4VWIxWklU?=
 =?utf-8?B?R3hvYXNsb0ptaE1zcUxxY2NRUFFScnFHNGh5Y3pmcnlvMVllQXVQdnRUbEtC?=
 =?utf-8?B?UFpJSXUySllPZ2Y1UlBxTjJESEJaQ2I3QkV1Nk9WWHA4RjNtNXU4by9sZlhI?=
 =?utf-8?B?Yk9yQkNVVm9CZlRBT0pJUm8wSlMzeFdnUDZFYjJ2cFVRSWlEQnJwcnh5cGoz?=
 =?utf-8?B?dHY1QWE3SXdha09qcERiWEpINXJGNUFVUkhBL2VmYk96UGVGbGs0MFpCVjhS?=
 =?utf-8?B?VS84eElXRDUyRVE5eHB0TVpoaVBMM1JXWE1VZXRGLzdHbVBTdG5MK0ZnT1Vz?=
 =?utf-8?B?blVaUnB2SXk5SFRjcVVjVE1yTjkra1hIaS9nVXVQSFV1cWt1bEhnV0UwUzVB?=
 =?utf-8?B?cXliSlNRcm11U00yb2JqZGpIZ0xXaW5hbEFPSlZCYU9abGo1VlVmQ1RNMnNW?=
 =?utf-8?B?dldhdHFjSHdQUUdYR1BzUzZlNGV0Njh5TEswa2V2UXFVckdQR0w3eGxTTkFj?=
 =?utf-8?B?OFZaSXNqU2M4UzM5Rk51ZFQxck9VT3RYZVZNYmY0UXE2dnJqQ3JrRWJlQ0Ja?=
 =?utf-8?B?VkY1NmhNR1pzUTFhR1JEODZIZEZ4VVp6alhwWXpPRm9hTWR2cXJudVZoKzBP?=
 =?utf-8?B?WjZZUjRJMGZ6RFRJazR6UVdwU0RQUTBkZ1JmVVpxMnNRUGxJZlJCZ2JOZnJ4?=
 =?utf-8?B?eG8xYVpxelBTZ3l3dEpsSWQ0Mmg5YVI3TFMxRm9zbDBZVFNOdjZRUEZIUWdT?=
 =?utf-8?B?amNVczBkdHd2OVlLcTZQMmNXKzFnVEpLWHljSnB2NUowSEFkWFE1bjhHQmJQ?=
 =?utf-8?B?VFpqQWNKWmF6RTEycG8ybjRuaW1pR3FCeWhRNkZKMjROa3BSSDhON3JZTUxw?=
 =?utf-8?Q?AdnhLKdRdjkIxKkvGQnYYrdp8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab601f7-6db4-4380-a9e8-08dac8819405
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 09:53:28.8269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXqH5UkpQCcParZkI+KKXpKfw6g5eNBTDPsuesJIGhMAQyyihf/dAov/MIT5YR6V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6227
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

Am 17.11.22 um 03:36 schrieb Dmitry Osipenko:
> Hi,
>
> On 10/14/22 11:46, Christian König wrote:
>> +/* Remove the entity from the scheduler and kill all pending jobs */
>> +static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>> +{
>> +	struct drm_sched_job *job;
>> +	struct dma_fence *prev;
>> +
>> +	if (!entity->rq)
>> +		return;
>> +
>> +	spin_lock(&entity->rq_lock);
>> +	entity->stopped = true;
>> +	drm_sched_rq_remove_entity(entity->rq, entity);
>> +	spin_unlock(&entity->rq_lock);
>> +
>> +	/* Make sure this entity is not used by the scheduler at the moment */
>> +	wait_for_completion(&entity->entity_idle);
> I'm always hitting lockup here using Panfrost driver on terminating
> Xorg. Revering this patch helps. Any ideas how to fix it?
>

Well is the entity idle or are there some unsubmitted jobs left?

Regards,
Christian.
