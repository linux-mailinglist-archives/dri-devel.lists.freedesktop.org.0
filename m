Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 145AB660297
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 15:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF7410E2BE;
	Fri,  6 Jan 2023 14:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6500F10E2B9
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 14:53:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgL6vAg+UZKCgvjYaggza172EKq77BZC19GN3OThk6zEJB1D+mZ59WZbW3mhHZZkCWnv8wcJeUPWhQ66yf9GzE5fphGI9kpOS1C0UK3ytQqyuU01SMn9xMOS8NIBMlvFljTRqYsqkPYBp1DJISw/EgEwiKPIdY6A8Ujjk77oUVjiKYvA5H0bWGS6oqMCiBbXVbZFQjnOpnUuNWfAHa8aML1JyYocP4hJPnzuqpfPXL6Ymq6hmEKizSAVzRDGz5P8WFFyX2weWPpt4Ri3+Bl754w4Fg9g986sSGaX1Tz1eTsa0IRRH3Cwk0Ju1JQKMm9behiESdEEBYaR/PHtVZIyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjLt2Nge9Gs9GkfjyuPNMmWCyWKdC9dk3RhzCeca5q0=;
 b=gJHW+wO5tjGLii933oCGvo7VXenjxVjyHY0Ynaw8c5vboDHW9nhlKV+ISdiC+PBgD8kQyD4K1ql9dP37VN+qxp0ApdL8TugFSmR3+/2F1Z2YYsdNa6sKgPdFdZ6CuDylVGz6dmfSSY34Odau5SYSHxod5bCpYfhtlgUqRiU7O8D9pSTeabtvnspDO2Sjb2dsIdUZJ368qqDq194YK0VoGGqfmLN/RXrDux/vpsZiQlIy7fRordfhITvFjqXGfOmtwPqyuYNjxkR4kLDNAj5a92JyYbEoVEQhNig25Z2d44bpsR339/npOUpZ0fB4aOIaNSUHURtsTTWGr6Dlc9AbYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjLt2Nge9Gs9GkfjyuPNMmWCyWKdC9dk3RhzCeca5q0=;
 b=sYatkReL3csJZ4lqDh+aGz+gGp2nFmqt6h0RflP6Yu04z77XYVHVzF/fFSnb7YVWV5Vqvw2T6TWY0/78rMeOHj76XzwY9rAhubAb1lHNAEG+A5OIj0Oe1fK/B/Ez174DQjEAupOQC9GC8uGhJUgRVpIYNX3J/sLmb2oAhpDD5ww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6311.namprd12.prod.outlook.com (2603:10b6:8:94::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 14:53:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 14:53:20 +0000
Message-ID: <414e4217-4ba2-3bf2-1c75-b01f679cde54@amd.com>
Date: Fri, 6 Jan 2023 15:53:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 3/3] drm: Update file owner during use
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20221130133407.2689864-1-tvrtko.ursulin@linux.intel.com>
 <20221130133407.2689864-4-tvrtko.ursulin@linux.intel.com>
 <Y4dmKgn8X4yPUnqk@phenom.ffwll.local>
 <157dcd11-ea4d-b22a-b10f-0934451d3c1d@linux.intel.com>
 <3eccd500-9e69-111d-54bd-90e6292b2b98@amd.com>
 <Y7bDdU0nZg+6GBZL@phenom.ffwll.local>
 <5a875e31-138e-7e11-3a47-b0b85fc1413f@amd.com>
 <Y7f9weWJc1c0XiG1@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y7f9weWJc1c0XiG1@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 3985daab-ee84-4f29-fdcc-08daeff5c07e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W1qNAPMaiCathIpAFEQH1nY8BSGScpe6i3UhOZdias2AhIvvE557/Ke9LMnaoXPKxyRjVDBlSA+6uN+ZVWqg4kb+wgUlHHLt0+Oo4FSGaY/M39m2+U1dFwofJBf+FZM0W7yJIwHvi4c25si3iT3uM5Yt6ZXQwQCisLk0RVINJIksGW/Jrl0/y2f3RIsZIalyTNXnJ7ifhmvJOUOLpVcQRbI6iMaa4KCjk12e5MD3fh/k3L8Q6Qd3KsiK1vFryNIGpQLxJxg75tZZDSTL+End929CuI2Cs9TWIK81OdMDUrue4ynJHr81KKF1ObalNkp8kXOcDXKyYEmGkQWwazK/PlAGfmogmfIG9xcxJ4miDCzDzf9Dx4xrAELZYJWsjmggHvyIJpC4MUNQP/b18K569SzRediB+cCr4+0VvoC4VhD+rc6GSwi1nLj6WDmwzoK6NxR168bccC461eQfmKH59nypyhXZ/M4MY3JP4AK/SeQHRFKD5J8PeDHUSDP928ISHosYXyd53PlMicer3Eqk/viPTdIVvbqjwg74poGqx8AecFO+pK8CUsfB+sJJ4Vyml6fA87V4nKL5KPsIDFEYp1ffDWVnaPovdWTEqNjVc2JXQn/UB8ATBKei3O77UWB4m9xjexnUM04cyTuqQlHv1WmJBrKoTJuM3arNQU7kIhtahXfHyNEM0I3Y3PqX2It0Dj2p0KpRmshiAOM7WFAoSAGMdR82HCzb7thmW8sQu0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199015)(6512007)(6666004)(31686004)(6486002)(478600001)(2906002)(15650500001)(6506007)(186003)(66556008)(8676002)(66476007)(2616005)(41300700001)(4326008)(316002)(66574015)(66946007)(83380400001)(5660300002)(38100700002)(54906003)(8936002)(6916009)(36756003)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlFsZDEzU1N3MGpSTXJzWkRYSUpMSUR1MGdYUTVJa3pGWnFIUTh4WFhnaG9h?=
 =?utf-8?B?Qld3ZWNIeVhiVDljeEJiYnNza0N5QWN3a1BBZ0IrNzZOYlRoNnhxU3lDY1o5?=
 =?utf-8?B?YXFOQ1Z5MDgxTlR0aE9SQWpjZktPSVNmR1JiZHp4akt6MjBWSDQ4cG5GK3FQ?=
 =?utf-8?B?Z3JvQ1d5dHRDbGNkbkNSN0I3MHBwSnVMLzQ2UndwU25OS1NCNjNDam9mLzVH?=
 =?utf-8?B?SzFGVkhhYWtDT2M4b1ZxREFaR0tkV3llaE5DZ1N4S2dldm1lYlE0NUdEVFZq?=
 =?utf-8?B?K1MyV3Z3ZmpLWk1DUkxHUVRxczZUSCtndFZNWGhjRTNoQ3R0VUVyallDbXlz?=
 =?utf-8?B?a1ZjRjZyYTdwbFZLMjlOZGVOQTRUL2ZBeHBVeUVEUGFyeVlGWlFSNTJyaTlR?=
 =?utf-8?B?VVFHenpVWUYrMWZSZ1BDQXBxTm1WbVUwcThMQVh3dUoxRE0zZ3U1cTJPUDg2?=
 =?utf-8?B?dEdENllMT0t3a2ZjZjlYTUt0Y0Q2ZG1aakFzL1VTaHdYeGh3ejNHc0s1bnZR?=
 =?utf-8?B?eXZSN1NtNXRGTjk3Y05YV0dXTDJWeFFvM1YrTmU5TS8yWHZpOVBuMVlUKzRF?=
 =?utf-8?B?dEtVQkxjTktjdE1qMUMycDQ2a2hZNUJOc3JkMEdrODBpUWdtYy9jSUFOYi9v?=
 =?utf-8?B?eFF1TytzRUJuSFFTYUdieG50bkdzSGVFRnVsMTBFc1NOR2hMYnBjdXZJZTNY?=
 =?utf-8?B?K2RTUUh1NnhPejZIaE9mWFpDN2NwZEtPTmwzV244S1BJQjV1NnpoM2ZrdXNP?=
 =?utf-8?B?TmlXc2tLMVBPR04wdGZNWnNuRC94OWhMVXpsRXR0NU1xRXlCU3hEQlFLZG1E?=
 =?utf-8?B?QTBZTCt1d0hhdnk2VFhRWFZhejBHcVEveGlibGVTcXNZTjBOZnB1SDB1TXR3?=
 =?utf-8?B?WVU4QTQ2ZnM0MFZMS1hUOHByTjFKeXZ5ZkJUQkVyYkFILzBtYVMzVGJ2b3B2?=
 =?utf-8?B?WERqQlY1VlZiUFRwVzdFZFJWenhsLyt4TzNocUY5MWIvd1FFN2EzVm1aSmwv?=
 =?utf-8?B?aXFPdDEyQjMvMEc2MEc3ZFNUY1RyMHIzY3I3VENxelJXZEFsNUVvdngrZU85?=
 =?utf-8?B?KzJKQ3Ntb243QXdjSUE1OG5JdExSL1k1ZFFLOUcxOGJYaUNOYXUvLzJieWdq?=
 =?utf-8?B?YXJSRGVuS2NMMm03UXV5cHYwREt0WDFTSTZYdEx4UGp4TlliTDA3SHJZc0RP?=
 =?utf-8?B?MGEwSlU5Y0dzWkRNMFV5ZjQ5RklmUTdJWGUwc2h5WWoybGdrZnpOQldEOENW?=
 =?utf-8?B?NVNXVEN2Sy8wLy9UK1lKVkRtYmIzL2YvY2laL0ljVDMvWUFRS2hkNGMzd05F?=
 =?utf-8?B?RU5vd3liSUF0WVpqV0xXWStybWRxMnkxTHVEazZVUXhlME5HdE1NM2ZFMGJw?=
 =?utf-8?B?MkJOTGpydEZqUXF1T1J3aFBqZWU0TDJWT3NXSlJMMWlrMTBVR1JoUHBNaERw?=
 =?utf-8?B?clE0MVhqcVJic3RPREpnN3BjQmxEQVFpV0hiYWl0VzlkZzhTYWlCZ3JKQS9U?=
 =?utf-8?B?UjFKU0g0bmV4SHJGdzRJTGUxNmRuU1ZtU0s4ZTRIZVM3U3hya2doNnZKWDl5?=
 =?utf-8?B?cWJJSCtvTTJJbXNrYm9samdJQllOc3pmRDhBd3JjVUtQVlcwamJUS05PdlNE?=
 =?utf-8?B?aXVmbkhyQkRTTUtzbHlLbHI3Q3lkNDdEcXRFT0cvL0hWaVZWQTR2VnV5MUUr?=
 =?utf-8?B?cFNwL0tGMGhxanRtU2d5YzVDM1ZGbFlLL25xQjhRVXZ5NVBwei9xSDlGTVo2?=
 =?utf-8?B?Y21JUVZCVGFVM3Fnb3pxekpKR2Vabll4SmJoWHpGMjBiRHREMlRQcXJtSi9r?=
 =?utf-8?B?amxwTnB6WVNwVnZneSttY0Y4RzNoU3VhYjBpMGJWTEJmQzlyQ3dGWDFodjVP?=
 =?utf-8?B?MG1jcnRoazdHbHZJbTJvVndZMWI4OTh2Q09XWjJwUEFCSzBCZnVZbkl5WDJs?=
 =?utf-8?B?Ykd0b0cvNWw2bDVLdUlVTWk2bjM3WUwvSFlROUdraWhJQ3lVQUNXejdjSU45?=
 =?utf-8?B?SEVYR3Z1T21uNzZsRjZjLzlzalNhQU0yeXZvNjRrNENYSUNMTHpSRG9aSUl0?=
 =?utf-8?B?K24rMlQ3Y29KaUtJTytEWkFwZlZjRGVoU1J1OE85eUtQSmNrdXd5WEkzT0li?=
 =?utf-8?B?TjBLazdjUGRhMmZ0YUpwbkxOOEVkK01ZeC9CS0VlV1hhQlowK2FVTFNBYXBO?=
 =?utf-8?Q?7BOL7n4ivd+7JcrZRcltvTvVqxOXECc3NCMmmuIWny38?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3985daab-ee84-4f29-fdcc-08daeff5c07e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 14:53:20.5201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmOTxfABzxc5k+I+d/dDkLJ4sW/RQs22MD5DPcoovv+3qYgP+GbRqERRlSFwL6xq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6311
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.01.23 um 11:53 schrieb Daniel Vetter:
> On Fri, Jan 06, 2023 at 11:32:17AM +0100, Christian König wrote:
>> Am 05.01.23 um 13:32 schrieb Daniel Vetter:
>>> [SNIP]
>>>> For the case of an master fd I actually don't see the reason why we should
>>>> limit that? And fd can become master if it either was master before or has
>>>> CAP_SYS_ADMIN. Why would we want an extra check for the pid/tgid here?
>>> This is just info/debug printing, I don't see the connection to
>>> drm_auth/master stuff? Aside from the patch mixes up the master opener and
>>> the current user due to fd passing or something like that.
>> That's exactly why my comment meant as well.
>>
>> The connect is that the drm_auth/master code currently the pid/tgid as
>> indicator if the "owner" of the fd has changed and so if an access should be
>> allowed or not. I find that approach a bit questionable.
>>
>>> Note that we cannot do that (I think at least, after pondering this some
>>> more) because it would break the logind master fd passing scheme - there
>>> the receiving compositor is explicitly _not_ allowed to acquire master
>>> rights on its own. So the master priviledges must not move with the fd or
>>> things can go wrong.
>> That could be the rational behind that, but why doesn't logind then just
>> pass on a normal render node to the compositor?
> Because the compositor wants the kms node. We have 3 access levels in drm
>
> - render stuff
> - modeset stuff (needs a card* node and master rights for changing things)
> - set/drop master (needs root)
>
> logind wants to give the compositor modeset access, but not master
> drop/set access (because vt switching is controlled by logind).
>
> The pid check in drm_auth is for the use-case where you start your
> compositor on a root vt (or setuid-root), and then want to make sure
> that after cred dropping, set/drop master keeps working. Because in that
> case the vt switch dance is done by the compositor.
>
> Maybe we should document this stuff a bit better :-)

Maybe add a friendly warning? E.g. like "Don't touch it, it works!" :)

So basically this is a valid use case where logind set/get the master 
status of a fd while the compositor uses the master functionality?

Christian.

> -Daniel
>
>> Christian.
>>
>>> -Daniel
>>>
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> -Daniel
>>>>>>
>>>>>>
>>>>>>>             return 0;
>>>>>>>           if (!capable(CAP_SYS_ADMIN))
>>>>>>> diff --git a/drivers/gpu/drm/drm_debugfs.c
>>>>>>> b/drivers/gpu/drm/drm_debugfs.c
>>>>>>> index 42f657772025..9d4e3146a2b8 100644
>>>>>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>>>>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>>>>>> @@ -90,15 +90,17 @@ static int drm_clients_info(struct seq_file
>>>>>>> *m, void *data)
>>>>>>>          */
>>>>>>>         mutex_lock(&dev->filelist_mutex);
>>>>>>>         list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
>>>>>>> -        struct task_struct *task;
>>>>>>>             bool is_current_master = drm_is_current_master(priv);
>>>>>>> +        struct task_struct *task;
>>>>>>> +        struct pid *pid;
>>>>>>>     -        rcu_read_lock(); /* locks pid_task()->comm */
>>>>>>> -        task = pid_task(priv->pid, PIDTYPE_TGID);
>>>>>>> +        rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
>>>>>>> +        pid = rcu_dereference(priv->pid);
>>>>>>> +        task = pid_task(pid, PIDTYPE_TGID);
>>>>>>>             uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
>>>>>>>             seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
>>>>>>>                    task ? task->comm : "<unknown>",
>>>>>>> -               pid_vnr(priv->pid),
>>>>>>> +               pid_vnr(pid),
>>>>>>>                    priv->minor->index,
>>>>>>>                    is_current_master ? 'y' : 'n',
>>>>>>>                    priv->authenticated ? 'y' : 'n',
>>>>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>>>>> index 20a9aef2b398..3433f9610dba 100644
>>>>>>> --- a/drivers/gpu/drm/drm_file.c
>>>>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>>>>> @@ -156,7 +156,7 @@ struct drm_file *drm_file_alloc(struct
>>>>>>> drm_minor *minor)
>>>>>>>         if (!file)
>>>>>>>             return ERR_PTR(-ENOMEM);
>>>>>>>     -    file->pid = get_pid(task_tgid(current));
>>>>>>> +    rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>>>>>>>         file->minor = minor;
>>>>>>>           /* for compatibility root is always authenticated */
>>>>>>> @@ -502,6 +502,36 @@ int drm_release(struct inode *inode, struct
>>>>>>> file *filp)
>>>>>>>     }
>>>>>>>     EXPORT_SYMBOL(drm_release);
>>>>>>>     +void drm_file_update_pid(struct drm_file *filp)
>>>>>>> +{
>>>>>>> +    struct drm_device *dev;
>>>>>>> +    struct pid *pid, *old;
>>>>>>> +
>>>>>>> +    /* Master nodes are not expected to be passed between
>>>>>>> processes. */
>>>>>>> +    if (filp->was_master)
>>>>>>> +        return;
>>>>>>> +
>>>>>>> +    pid = task_tgid(current);
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * Quick unlocked check since the model is a single
>>>>>>> handover followed by
>>>>>>> +     * exclusive repeated use.
>>>>>>> +     */
>>>>>>> +    if (pid == rcu_access_pointer(filp->pid))
>>>>>>> +        return;
>>>>>>> +
>>>>>>> +    dev = filp->minor->dev;
>>>>>>> +    mutex_lock(&dev->filelist_mutex);
>>>>>>> +    old = rcu_replace_pointer(filp->pid, pid, 1);
>>>>>>> +    mutex_unlock(&dev->filelist_mutex);
>>>>>>> +
>>>>>>> +    if (pid != old) {
>>>>>>> +        get_pid(pid);
>>>>>>> +        synchronize_rcu();
>>>>>>> +        put_pid(old);
>>>>>>> +    }
>>>>>>> +}
>>>>>>> +
>>>>>>>     /**
>>>>>>>      * drm_release_noglobal - release method for DRM file
>>>>>>>      * @inode: device inode
>>>>>>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>>>>>>> index 7c9d66ee917d..305b18d9d7b6 100644
>>>>>>> --- a/drivers/gpu/drm/drm_ioctl.c
>>>>>>> +++ b/drivers/gpu/drm/drm_ioctl.c
>>>>>>> @@ -775,6 +775,9 @@ long drm_ioctl_kernel(struct file *file,
>>>>>>> drm_ioctl_t *func, void *kdata,
>>>>>>>         struct drm_device *dev = file_priv->minor->dev;
>>>>>>>         int retcode;
>>>>>>>     +    /* Update drm_file owner if fd was passed along. */
>>>>>>> +    drm_file_update_pid(file_priv);
>>>>>>> +
>>>>>>>         if (drm_dev_is_unplugged(dev))
>>>>>>>             return -ENODEV;
>>>>>>>     diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>>>>> b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>>>>> index 80f154b6adab..a763d3ee61fb 100644
>>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>>>>> @@ -1097,7 +1097,10 @@ nouveau_drm_open(struct drm_device *dev,
>>>>>>> struct drm_file *fpriv)
>>>>>>>         }
>>>>>>>           get_task_comm(tmpname, current);
>>>>>>> -    snprintf(name, sizeof(name), "%s[%d]", tmpname,
>>>>>>> pid_nr(fpriv->pid));
>>>>>>> +    rcu_read_lock();
>>>>>>> +    snprintf(name, sizeof(name), "%s[%d]",
>>>>>>> +         tmpname, pid_nr(rcu_dereference(fpriv->pid)));
>>>>>>> +    rcu_read_unlock();
>>>>>>>           if (!(cli = kzalloc(sizeof(*cli), GFP_KERNEL))) {
>>>>>>>             ret = -ENOMEM;
>>>>>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>>>>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>>>>>> index f2985337aa53..3853d9bb9ab8 100644
>>>>>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>>>>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>>>>>> @@ -251,6 +251,7 @@ static int vmw_debugfs_gem_info_show(struct
>>>>>>> seq_file *m, void *unused)
>>>>>>>         list_for_each_entry(file, &dev->filelist, lhead) {
>>>>>>>             struct task_struct *task;
>>>>>>>             struct drm_gem_object *gobj;
>>>>>>> +        struct pid *pid;
>>>>>>>             int id;
>>>>>>>               /*
>>>>>>> @@ -260,8 +261,9 @@ static int vmw_debugfs_gem_info_show(struct
>>>>>>> seq_file *m, void *unused)
>>>>>>>              * Therefore, we need to protect this ->comm access
>>>>>>> using RCU.
>>>>>>>              */
>>>>>>>             rcu_read_lock();
>>>>>>> -        task = pid_task(file->pid, PIDTYPE_TGID);
>>>>>>> -        seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
>>>>>>> +        pid = rcu_dereference(file->pid);
>>>>>>> +        task = pid_task(pid, PIDTYPE_TGID);
>>>>>>> +        seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>>>>>>>                    task ? task->comm : "<unknown>");
>>>>>>>             rcu_read_unlock();
>>>>>>>     diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>>>>>> index 0d1f853092ab..27d545131d4a 100644
>>>>>>> --- a/include/drm/drm_file.h
>>>>>>> +++ b/include/drm/drm_file.h
>>>>>>> @@ -255,8 +255,15 @@ struct drm_file {
>>>>>>>         /** @master_lookup_lock: Serializes @master. */
>>>>>>>         spinlock_t master_lookup_lock;
>>>>>>>     -    /** @pid: Process that opened this file. */
>>>>>>> -    struct pid *pid;
>>>>>>> +    /**
>>>>>>> +     * @pid: Process that is using this file.
>>>>>>> +     *
>>>>>>> +     * Must only be dereferenced under a rcu_read_lock or equivalent.
>>>>>>> +     *
>>>>>>> +     * Updates are guarded with dev->filelist_mutex and
>>>>>>> reference must be
>>>>>>> +     * dropped after a RCU grace period to accommodate lockless
>>>>>>> readers.
>>>>>>> +     */
>>>>>>> +    struct pid __rcu *pid;
>>>>>>>           /** @magic: Authentication magic, see @authenticated. */
>>>>>>>         drm_magic_t magic;
>>>>>>> @@ -415,6 +422,8 @@ static inline bool drm_is_accel_client(const
>>>>>>> struct drm_file *file_priv)
>>>>>>>         return file_priv->minor->type == DRM_MINOR_ACCEL;
>>>>>>>     }
>>>>>>>     +void drm_file_update_pid(struct drm_file *);
>>>>>>> +
>>>>>>>     int drm_open(struct inode *inode, struct file *filp);
>>>>>>>     int drm_open_helper(struct file *filp, struct drm_minor *minor);
>>>>>>>     ssize_t drm_read(struct file *filp, char __user *buffer,
>>>>>>> -- 
>>>>>>> 2.34.1
>>>>>>>

