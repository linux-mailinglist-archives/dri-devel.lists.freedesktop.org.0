Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134997A8331
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 15:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4837910E17E;
	Wed, 20 Sep 2023 13:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A1610E17E;
 Wed, 20 Sep 2023 13:22:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZLsRKkQ3w8rzy154f1/syYVmNaxeswd1PhC9sx5h3dxhFTSIqbFlkSrC3jMD4LZsmani61QY32uZdo1hmbvq1VMVmvk7XUNH4Qujz4Hs0LMr0oXyTONbjMQoIFvN5zO74XSj8+xZYrtOLfNniNVByh9A0IMj6T6XjasreHbde2gCICnDXdSKfdTOWNBYWHKyt5w2XQMyis6pL65yJ6j5y8XMLtOKqYiFwgakfuj0jTkDa50SSdzHx+ushbO/DEf4lTCZh/xNyXHobGajCFZXbdrplhsgQkFGcK2xCJU/300V9qGcOxxboZeA7FMn133VEBdnoL6KlpO6JNXVYTHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vtlc3rx6HHwIMNx8xZXkm48wjZGW4Ry7IvWUdod0j0=;
 b=QpRZgMmobPik+UoheMmwcYJUXKqUB3mLY29VzfW6zZiEL2upw0WVK8N6pEH1lqtszAMp9rIQt2dEP8zRbIk4AbcqdFpTlzhxih5yDulTu4itF5F6xBsRLioEk7uwDUzHh35y/B8ytYux9obfOxAVP+QlPkZ+ThlK1opJgHam9dGdc4msfDGBE4nXBlkYXdMwIlG4wJ/sPvJXAetgsIddTudFjigrz8HoLcY/QUby3E6zNPsv0eUI8qcwwP5NVQmgfP8GwR8LWATK/qZVnI+vFkf9e/Z9xlrWsf8FFyzC2TL9Mi1z1AsJQ+xXYUFZcEWqeMGPbs5VcAudYz9reIaXzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vtlc3rx6HHwIMNx8xZXkm48wjZGW4Ry7IvWUdod0j0=;
 b=EnZfviTIK7D21/MQma8j9piasC36PmfpYXdC4ZU85kUkgom++oTGdEqcZNlG4FOQ7HACjG8nnqG539qISQjfUcOBBIrv5FPMnhMN+t/9+lWDD+Vv4P1xFLK0pWHjXAWG75WhfN3ciSBzkioCR3AU0YLVRaS3JEzEvHAtOLnm7JI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB8839.namprd12.prod.outlook.com (2603:10b6:208:493::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 13:22:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 13:22:31 +0000
Message-ID: <1a62d913-f864-f8f3-576c-93e44d0973c7@amd.com>
Date: Wed, 20 Sep 2023 15:22:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] drm: Update file owner during use
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>
References: <20230621094824.2348732-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGu+ztCSACr7WjJAcmwObszLNYmysGj_XdnkNiXAqoCiEw@mail.gmail.com>
 <299fe71c-01c1-b354-e131-644ab4d92b28@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <299fe71c-01c1-b354-e131-644ab4d92b28@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: ea7a9d2f-6feb-45f9-fb83-08dbb9dca503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oq/JRu4P5T19cCXr35fQ9Zrr65Ncgy/IQ9ZpFD329HDyzMy3Eb/Qte2yk5oapVuAlAIHxF83tqB9ZuHNi4e6z/PKunEQHvIjQ2bvgccyqatP1CuKIM/dPfrbIBMp6mkuyVUiIkWq2BQEJwYnnxREjx2gxyqm/cxyQUFl6P4LaOYd9MDlnW5v0cPa/ah6suGuW32jBwgNZRwKlybME0VCZvz53EHqJ9S3X+TwaPGiuGItIOTCBzEQcbaoZFwU7fC6bQp8TAK3WM12MJ5c/Jh9rWZmR2TuEuqVC4pzkSdFUmu5M0GO/vkoH7i/FLaWBctLNa4rIk0jcUP7ik/bUBz4OgjQFcb3hP7Tqpdekbi8rNlXbFLH98eiu5ntB1/8XCx9fD27EdxyAr4J9yKmdX9uDwJU5ewKW0C/EA2TjJegfkgoIEClzDH4HsgL/cib4sJlfadeVmZ4cTjCf5Ty9RmZJ7FWceZG7CLApKE+h6USALX48JARZ2AgD9mMjAZv84+IG9zKWz7l66oQVUATeVfO5f8NoeaDCFAuyBG+WBvCknAtrC5r+mHxlF6HbU6/KZlZwkieIIbfhW2U5qOIv1eC5CJdQ0htB9Dt5xJRf8dqJNiUaHWTvDKcj/iQu/loEWDKCsUDQCoc6ocaaIZ/LyLKDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(1800799009)(186009)(451199024)(31686004)(6666004)(6506007)(53546011)(6486002)(36756003)(38100700002)(31696002)(86362001)(15650500001)(26005)(2616005)(2906002)(66574015)(30864003)(6512007)(478600001)(83380400001)(5660300002)(41300700001)(8936002)(4326008)(8676002)(110136005)(54906003)(316002)(66946007)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2JOQ3pxczZCdzEyaGxHSjZLclVQKytaOGJ0T0ZPNU4xWEJ1SXNzZDdKeVZl?=
 =?utf-8?B?cVlJZkd4NThkNlhucDlCY2E2QWp3OUNTZjBseXZpS1FkNUQzTFFoS3ErV0hN?=
 =?utf-8?B?b2xQcXZweGxvdnVyRHVEcU14TlJmazc0NlpMTk9lTDZ6aUh6WW9rcjdZNU8v?=
 =?utf-8?B?SnQyVTFOTytIVVVLbXMwb0JtQjU5Y2Vac01MdEZ2ejVFWDhwOWtTN2NWRFRQ?=
 =?utf-8?B?cVd2ZjlyTWlHQ1ZhSGJVa3hKc0ROSGt1dmF3aEJmdk1MNjRZWU5lTVlKaWVv?=
 =?utf-8?B?M1FUeTI0WGsxSUMxMHlweHVlbER5MFRSTnM4YkU0WWR4dlR5d012ekhVdVph?=
 =?utf-8?B?M1BjeDdWaDFCcXNvbGFqUlpRZW1XZ1EwZnIydmdSNGUxcklHRGR5K21xV0tO?=
 =?utf-8?B?NUxIeklXT0FTNjVza0Z2ZzNmeEEweVBnOWp6WXNiN0NVRDZNUU1NUkZ0K0Ry?=
 =?utf-8?B?UVZHWjJUTEYxZTlNVFkrVEk5TEpFK3hXa2N4VytleHdva0lHcXBUSzVZVHhN?=
 =?utf-8?B?TFB5dUdYS0t3TWZEaHNQTzBxZUI5ZmZ6N0d4a2NKTVJORDZMd0ptYlBIVUQv?=
 =?utf-8?B?Uk5nVkVzZjBta09DcnlLWktzSjV0QklUazg5bUhiRFlFSWtHWWR5RkkydXB0?=
 =?utf-8?B?UXZ0NWpkZ0RVK0ZuZlFoMW51SmZqQ2pPK0Z3UnBDMjkzQ2JzUVphUmhGR3hw?=
 =?utf-8?B?QkJrNWtua0FTcm1VYWdpd0ZtUmlCMGt5dGZobEJxYTViMk4wdkxuRjdYZTcv?=
 =?utf-8?B?aUhxWGdyNTM3NmJMSmhPbkpyOUpXekxyUnkxd29UdE5ubGZwNnd5bGRCcERN?=
 =?utf-8?B?WVcrMisvWlRhM0JFSEt2VVBrakhHMmxITzlmY1JuSDZkZiswZWZmRE5rK0ZT?=
 =?utf-8?B?NGg2cHNOWXNFelJYZE1mZkYvaGUzR01jRVlHNWN2UmZqMVZGYmFRMHJUT1B0?=
 =?utf-8?B?S0ttdUlNbE84dDRMYjJuTDdoZnYxT1hqeG5UdG1aN1N5UHJWcHZ2VHBXOFR4?=
 =?utf-8?B?U01YckZCZXFNeEpGTVQzdWRXcWpmTVRkY0tmUGlQMXFIek13VkkzSCtuY2JR?=
 =?utf-8?B?V0E3UjJRbWlqMC9IOU5OaWE5MWl3SmVxcXJkSjlMZUhjcmVMOUxRVEx2QmY4?=
 =?utf-8?B?UUlWRGZFbDBNM3N1N2Uxc0FxRFB4Z0hVcklub2hnNEh1N1VIRVpLSEFQSXcx?=
 =?utf-8?B?anpsTXRMWG13VWpWVGtZM2llSWNEaXFWL2lTWWJJL2ZlK1NMMi91TkdzVFF3?=
 =?utf-8?B?MHZ1YVFneC9OSFpoTlZjVTQ0ZWlmN0VSM2MwQWZmQmRvM0lQdEVyaElzK3VY?=
 =?utf-8?B?NmsxSHNkaGkwSGRqVDMwNXVJWGhUWGF1L1VMRjBXTThPa2h4dWFqcVhKN3BS?=
 =?utf-8?B?d1gycFpNRTJuamZYT1lXVGU4eHpFWlFrbVMwQjdRNFhGWlJycVpXTkQ4SHJ1?=
 =?utf-8?B?YXRtZ2QxWm5NdkFUSytMVDlZZHNXbE5YaENONGtiVklTV2xad05JdW83NUZl?=
 =?utf-8?B?dzhuaEtxRkp1L0RqbTRvRUloMjd2SjBIZ3ZmVEFZaG9XaHR0TWtaUGdVUzJI?=
 =?utf-8?B?YVAwdFZDV2xRVTlORWp1MjF2bmVMNUw1eFJKSnNheTZvYjY1SDN0ZVdBZ3N3?=
 =?utf-8?B?REc4R1N5cmxCVk1zSURwQmhoYjlJaXZaaHRsWUlzK2VSM0l0dzdUVmlrQjBE?=
 =?utf-8?B?ZExtL2M3WjdpQVNTdHZQRXBURjhjU2hNbmFQM0RWZWtSTTVsNmFhZlZISE92?=
 =?utf-8?B?ZEs4cnJSaWZQRXRBNTNkT1ZqclduSWhFaURWWEh6b0lPUFZVTTdvY0hLV2Fu?=
 =?utf-8?B?cWlMaDJ4UVkzK1I2TjI0ZS9oRVhPOVQzRkFVaUh4eDA3MFdqQTBiZEhKUEly?=
 =?utf-8?B?eWtueVdQSGM2WFpMZHRnRWxuMWdxNyt6TmloVDRWZUw5Zjh5QSs0b1A2L09o?=
 =?utf-8?B?cTVkUytrVDBIVjNLT1Y0c2s4RGZFc2JvczVlZ1lSaHhyRXQ3NXBMWTlpSmpS?=
 =?utf-8?B?TEwwbkd3ZHRlYjUzVzVMUU9OYytVTlA1dDl4Nm80ZnVmQkVvY0hhejYrY0ZP?=
 =?utf-8?B?ZmozVWM0UnlmTVVhV3F6Tnd5Yk56THRPL3VCMGZyV3VRMTFWbmxOVDh5b1cw?=
 =?utf-8?Q?nY+wrv6lZI5fXcbKwo74b3ock?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7a9d2f-6feb-45f9-fb83-08dbb9dca503
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 13:22:31.7173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvd1/47iOU241Ni/Tqe5b/rlx5e47H2armzte5t90eZ0nMQfWEEOy/dfjO4186xW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8839
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
Cc: Intel-gfx@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.09.23 um 15:21 schrieb Tvrtko Ursulin:
>
> On 28/08/2023 20:58, Rob Clark wrote:
>> On Wed, Jun 21, 2023 at 2:48 AM Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> With the typical model where the display server opens the file 
>>> descriptor
>>> and then hands it over to the client(*), we were showing stale data in
>>> debugfs.
>>>
>>> Fix it by updating the drm_file->pid on ioctl access from a different
>>> process.
>>>
>>> The field is also made RCU protected to allow for lockless readers. 
>>> Update
>>> side is protected with dev->filelist_mutex.
>>>
>>> Before:
>>>
>>> $ cat /sys/kernel/debug/dri/0/clients
>>>               command   pid dev master a   uid      magic
>>>                  Xorg  2344   0   y    y     0          0
>>>                  Xorg  2344   0   n    y     0          2
>>>                  Xorg  2344   0   n    y     0          3
>>>                  Xorg  2344   0   n    y     0          4
>>>
>>> After:
>>>
>>> $ cat /sys/kernel/debug/dri/0/clients
>>>               command  tgid dev master a   uid      magic
>>>                  Xorg   830   0   y    y     0          0
>>>         xfce4-session   880   0   n    y     0          1
>>>                 xfwm4   943   0   n    y     0          2
>>>             neverball  1095   0   n    y     0          3
>>>
>>> *)
>>> More detailed and historically accurate description of various handover
>>> implementation kindly provided by Emil Velikov:
>>>
>>> """
>>> The traditional model, the server was the orchestrator managing the
>>> primary device node. From the fd, to the master status and
>>> authentication. But looking at the fd alone, this has varied across
>>> the years.
>>>
>>> IIRC in the DRI1 days, Xorg (libdrm really) would have a list of open
>>> fd(s) and reuse those whenever needed, DRI2 the client was responsible
>>> for open() themselves and with DRI3 the fd was passed to the client.
>>>
>>> Around the inception of DRI3 and systemd-logind, the latter became
>>> another possible orchestrator. Whereby Xorg and Wayland compositors
>>> could ask it for the fd. For various reasons (hysterical and genuine
>>> ones) Xorg has a fallback path going the open(), whereas Wayland
>>> compositors are moving to solely relying on logind... some never had
>>> fallback even.
>>>
>>> Over the past few years, more projects have emerged which provide
>>> functionality similar (be that on API level, Dbus, or otherwise) to
>>> systemd-logind.
>>> """
>>>
>>> v2:
>>>   * Fixed typo in commit text and added a fine historical explanation
>>>     from Emil.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Acked-by: Christian König <christian.koenig@amd.com>
>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>>
>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>> Tested-by: Rob Clark <robdclark@gmail.com>
>
> Thanks. If everyone else is happy with this approach I don't have the 
> commit rights for drm-misc.

Going to take care of pushing this.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |  6 ++--
>>>   drivers/gpu/drm/drm_auth.c              |  3 +-
>>>   drivers/gpu/drm/drm_debugfs.c           | 10 ++++---
>>>   drivers/gpu/drm/drm_file.c              | 40 
>>> +++++++++++++++++++++++--
>>>   drivers/gpu/drm/drm_ioctl.c             |  3 ++
>>>   drivers/gpu/drm/nouveau/nouveau_drm.c   |  5 +++-
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     |  6 ++--
>>>   include/drm/drm_file.h                  | 13 ++++++--
>>>   8 files changed, 71 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index 74055cba3dc9..849097dff02b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -963,6 +963,7 @@ static int amdgpu_debugfs_gem_info_show(struct 
>>> seq_file *m, void *unused)
>>>          list_for_each_entry(file, &dev->filelist, lhead) {
>>>                  struct task_struct *task;
>>>                  struct drm_gem_object *gobj;
>>> +               struct pid *pid;
>>>                  int id;
>>>
>>>                  /*
>>> @@ -972,8 +973,9 @@ static int amdgpu_debugfs_gem_info_show(struct 
>>> seq_file *m, void *unused)
>>>                   * Therefore, we need to protect this ->comm access 
>>> using RCU.
>>>                   */
>>>                  rcu_read_lock();
>>> -               task = pid_task(file->pid, PIDTYPE_TGID);
>>> -               seq_printf(m, "pid %8d command %s:\n", 
>>> pid_nr(file->pid),
>>> +               pid = rcu_dereference(file->pid);
>>> +               task = pid_task(pid, PIDTYPE_TGID);
>>> +               seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>>>                             task ? task->comm : "<unknown>");
>>>                  rcu_read_unlock();
>>>
>>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>>> index cf92a9ae8034..2ed2585ded37 100644
>>> --- a/drivers/gpu/drm/drm_auth.c
>>> +++ b/drivers/gpu/drm/drm_auth.c
>>> @@ -235,7 +235,8 @@ static int drm_new_set_master(struct drm_device 
>>> *dev, struct drm_file *fpriv)
>>>   static int
>>>   drm_master_check_perm(struct drm_device *dev, struct drm_file 
>>> *file_priv)
>>>   {
>>> -       if (file_priv->pid == task_pid(current) && 
>>> file_priv->was_master)
>>> +       if (file_priv->was_master &&
>>> +           rcu_access_pointer(file_priv->pid) == task_pid(current))
>>>                  return 0;
>>>
>>>          if (!capable(CAP_SYS_ADMIN))
>>> diff --git a/drivers/gpu/drm/drm_debugfs.c 
>>> b/drivers/gpu/drm/drm_debugfs.c
>>> index 4855230ba2c6..b46f5ceb24c6 100644
>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>> @@ -90,15 +90,17 @@ static int drm_clients_info(struct seq_file *m, 
>>> void *data)
>>>           */
>>>          mutex_lock(&dev->filelist_mutex);
>>>          list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
>>> -               struct task_struct *task;
>>>                  bool is_current_master = drm_is_current_master(priv);
>>> +               struct task_struct *task;
>>> +               struct pid *pid;
>>>
>>> -               rcu_read_lock(); /* locks pid_task()->comm */
>>> -               task = pid_task(priv->pid, PIDTYPE_TGID);
>>> +               rcu_read_lock(); /* Locks priv->pid and 
>>> pid_task()->comm! */
>>> +               pid = rcu_dereference(priv->pid);
>>> +               task = pid_task(pid, PIDTYPE_TGID);
>>>                  uid = task ? __task_cred(task)->euid : 
>>> GLOBAL_ROOT_UID;
>>>                  seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
>>>                             task ? task->comm : "<unknown>",
>>> -                          pid_vnr(priv->pid),
>>> +                          pid_vnr(pid),
>>>                             priv->minor->index,
>>>                             is_current_master ? 'y' : 'n',
>>>                             priv->authenticated ? 'y' : 'n',
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index 883d83bc0e3d..e692770ef6d3 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -160,7 +160,7 @@ struct drm_file *drm_file_alloc(struct drm_minor 
>>> *minor)
>>>
>>>          /* Get a unique identifier for fdinfo: */
>>>          file->client_id = atomic64_inc_return(&ident);
>>> -       file->pid = get_pid(task_tgid(current));
>>> +       rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>>>          file->minor = minor;
>>>
>>>          /* for compatibility root is always authenticated */
>>> @@ -200,7 +200,7 @@ struct drm_file *drm_file_alloc(struct drm_minor 
>>> *minor)
>>>                  drm_syncobj_release(file);
>>>          if (drm_core_check_feature(dev, DRIVER_GEM))
>>>                  drm_gem_release(dev, file);
>>> -       put_pid(file->pid);
>>> +       put_pid(rcu_access_pointer(file->pid));
>>>          kfree(file);
>>>
>>>          return ERR_PTR(ret);
>>> @@ -291,7 +291,7 @@ void drm_file_free(struct drm_file *file)
>>>
>>>          WARN_ON(!list_empty(&file->event_list));
>>>
>>> -       put_pid(file->pid);
>>> +       put_pid(rcu_access_pointer(file->pid));
>>>          kfree(file);
>>>   }
>>>
>>> @@ -505,6 +505,40 @@ int drm_release(struct inode *inode, struct 
>>> file *filp)
>>>   }
>>>   EXPORT_SYMBOL(drm_release);
>>>
>>> +void drm_file_update_pid(struct drm_file *filp)
>>> +{
>>> +       struct drm_device *dev;
>>> +       struct pid *pid, *old;
>>> +
>>> +       /*
>>> +        * Master nodes need to keep the original ownership in order 
>>> for
>>> +        * drm_master_check_perm to keep working correctly. (See 
>>> comment in
>>> +        * drm_auth.c.)
>>> +        */
>>> +       if (filp->was_master)
>>> +               return;
>>> +
>>> +       pid = task_tgid(current);
>>> +
>>> +       /*
>>> +        * Quick unlocked check since the model is a single handover 
>>> followed by
>>> +        * exclusive repeated use.
>>> +        */
>>> +       if (pid == rcu_access_pointer(filp->pid))
>>> +               return;
>>> +
>>> +       dev = filp->minor->dev;
>>> +       mutex_lock(&dev->filelist_mutex);
>>> +       old = rcu_replace_pointer(filp->pid, pid, 1);
>>> +       mutex_unlock(&dev->filelist_mutex);
>>> +
>>> +       if (pid != old) {
>>> +               get_pid(pid);
>>> +               synchronize_rcu();
>>> +               put_pid(old);
>>> +       }
>>> +}
>>> +
>>>   /**
>>>    * drm_release_noglobal - release method for DRM file
>>>    * @inode: device inode
>>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>>> index 7c9d66ee917d..305b18d9d7b6 100644
>>> --- a/drivers/gpu/drm/drm_ioctl.c
>>> +++ b/drivers/gpu/drm/drm_ioctl.c
>>> @@ -775,6 +775,9 @@ long drm_ioctl_kernel(struct file *file, 
>>> drm_ioctl_t *func, void *kdata,
>>>          struct drm_device *dev = file_priv->minor->dev;
>>>          int retcode;
>>>
>>> +       /* Update drm_file owner if fd was passed along. */
>>> +       drm_file_update_pid(file_priv);
>>> +
>>>          if (drm_dev_is_unplugged(dev))
>>>                  return -ENODEV;
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c 
>>> b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>> index 51f1918b44d3..e3cb60eb0bc8 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>> @@ -1101,7 +1101,10 @@ nouveau_drm_open(struct drm_device *dev, 
>>> struct drm_file *fpriv)
>>>          }
>>>
>>>          get_task_comm(tmpname, current);
>>> -       snprintf(name, sizeof(name), "%s[%d]", tmpname, 
>>> pid_nr(fpriv->pid));
>>> +       rcu_read_lock();
>>> +       snprintf(name, sizeof(name), "%s[%d]",
>>> +                tmpname, pid_nr(rcu_dereference(fpriv->pid)));
>>> +       rcu_read_unlock();
>>>
>>>          if (!(cli = kzalloc(sizeof(*cli), GFP_KERNEL))) {
>>>                  ret = -ENOMEM;
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c 
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>> index c0da89e16e6f..a07e5b7e2f2f 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>> @@ -232,6 +232,7 @@ static int vmw_debugfs_gem_info_show(struct 
>>> seq_file *m, void *unused)
>>>          list_for_each_entry(file, &dev->filelist, lhead) {
>>>                  struct task_struct *task;
>>>                  struct drm_gem_object *gobj;
>>> +               struct pid *pid;
>>>                  int id;
>>>
>>>                  /*
>>> @@ -241,8 +242,9 @@ static int vmw_debugfs_gem_info_show(struct 
>>> seq_file *m, void *unused)
>>>                   * Therefore, we need to protect this ->comm access 
>>> using RCU.
>>>                   */
>>>                  rcu_read_lock();
>>> -               task = pid_task(file->pid, PIDTYPE_TGID);
>>> -               seq_printf(m, "pid %8d command %s:\n", 
>>> pid_nr(file->pid),
>>> +               pid = rcu_dereference(file->pid);
>>> +               task = pid_task(pid, PIDTYPE_TGID);
>>> +               seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>>>                             task ? task->comm : "<unknown>");
>>>                  rcu_read_unlock();
>>>
>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index 966912053cb0..c76249d5467e 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -256,8 +256,15 @@ struct drm_file {
>>>          /** @master_lookup_lock: Serializes @master. */
>>>          spinlock_t master_lookup_lock;
>>>
>>> -       /** @pid: Process that opened this file. */
>>> -       struct pid *pid;
>>> +       /**
>>> +        * @pid: Process that is using this file.
>>> +        *
>>> +        * Must only be dereferenced under a rcu_read_lock or 
>>> equivalent.
>>> +        *
>>> +        * Updates are guarded with dev->filelist_mutex and 
>>> reference must be
>>> +        * dropped after a RCU grace period to accommodate lockless 
>>> readers.
>>> +        */
>>> +       struct pid __rcu *pid;
>>>
>>>          /** @client_id: A unique id for fdinfo */
>>>          u64 client_id;
>>> @@ -420,6 +427,8 @@ static inline bool drm_is_accel_client(const 
>>> struct drm_file *file_priv)
>>>          return file_priv->minor->type == DRM_MINOR_ACCEL;
>>>   }
>>>
>>> +void drm_file_update_pid(struct drm_file *);
>>> +
>>>   int drm_open(struct inode *inode, struct file *filp);
>>>   int drm_open_helper(struct file *filp, struct drm_minor *minor);
>>>   ssize_t drm_read(struct file *filp, char __user *buffer,
>>> -- 
>>> 2.39.2
>>>

