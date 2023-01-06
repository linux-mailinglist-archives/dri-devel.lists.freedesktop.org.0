Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19665FEFD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 11:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EA210E85D;
	Fri,  6 Jan 2023 10:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5441210E85D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 10:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwGuAaxfl+8FPyEo5lgHRbKD1uKMXz6oaofAJ7zRnIg4+YUsdiwdL7YWJifN+BijyNkPJ9LM8kbMwNcyX4Bvz+U6pDsRMl+sFacM/dOyskx6PC6TqjHMaAHUpMjEdaGP2mOV2LoFclJjKzt3K8GcekIMpFNg4+broGkyc9PimV0KyiDMyx40VKpDEa/DDtrcPeLUsRQ7K2FfjZBnJC8m9XJ50zGxni3VFrMdpZZ+kl6k0YtcHTlX6P8p7BFaVY0oL40PI2TP9QJyrEgKMJqaL6QC1Z6POrkUogqCcf0EaNbfPHWHxXwu7gZteWdm40pdC1jcYwFSSY3I3e0XAzKEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TNg1pG6iohg4IFzIrSVDYk5Hpcd2BjLqL9TA71AoQY=;
 b=V7plXQxHxOAN43GD5KhxxJ/WcJKmadDhCnhmCPDRTPZCCJQlgGW8+76/RsWhdqGrCweGvuxFpJg3K8PzgAS8Ylfung16kAznYRW2UtwjDE0BKXuutXJVEvaBB4MXdAkZShMLCv2io6TxI6ATxKjclYSBFX71yibVKEYct4EuaKREL3em2FEyN9PFbxamoJzgGnEGrXzVM8lcrcDRVk6AWEsvTYciveZ78yNXT0jWV5EDmN4tFywxUrZwaNGBaP/NchBY9NaV47E5FksayvItyAE9/6ys9kfkB4m++US0AZFADjL44KD+jmQ4OATslsN2/JgIInbFE5hooBBmlbfgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TNg1pG6iohg4IFzIrSVDYk5Hpcd2BjLqL9TA71AoQY=;
 b=2/Mv5/gI0id5BjY/1Teir4V5G5VCwJ/+xikh4Oiwsw6xSDZ1WEADaqiPzmwHKOq3wFQEZzttULqiKzr8ShJNCSD1Owi+F00Lgr1zDreofinengScvRlfvZGBfzcWYHBy9WmEmxl9gwpvHRbYG4y1eBeMn5Gz2gwU9n4qhHo7FPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 10:32:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 10:32:22 +0000
Message-ID: <5a875e31-138e-7e11-3a47-b0b85fc1413f@amd.com>
Date: Fri, 6 Jan 2023 11:32:17 +0100
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y7bDdU0nZg+6GBZL@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb429d5-9411-4060-4c8e-08daefd14bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U1XgrDbhT2FOKK6bfRTXDP/sAY0eC80uhuSgeGxAt9PxCl2eA+1qeNZy4STDeWjQJlF019EHWrq5CGLDDQS11ItuRzL8jcTwV3LDFXDTK7xd27fJwyStnC1tqm6i90y1wIzeGmineI1haNKzzX/JoQMlAmq7g85VZzOmijIRTTDGkz3OkymuspLDRpnROV5QNngXbH9ETR0CbheXPNHQ7NjQCoyRro5F8gal0jqbcjZWmUAcdUroXuQMtWMmyw9ocbmrEB3bsvhOfR6OswTYOb+lKKMQVaccuqBjZTwTT/1CVbFAGtnnBk9qiZqFonhB5cZ5cRUAHbr0zivA333T3PVSmqUtiiymVs4bjTWu+D96EzPpXQh6+aqBbXQM3+AsLyTx5zHFXP2/bsU8ILl0ivEa/kAmT7ftPEcP0/cBRChn+1/8Ra3RecZXR2Xhj9Ds5apQnIijgV1Rgiys5fngah2QuqW17xpNLwuCHUxocF4H78gYxY97FS9o+1XYcqqiLrY6kWOUn4/8v5ke8ywVqbZUkFZyUW2bUHl4ElQCZuWWFeJ74t1QnQMC+BERJ4fVkLUN3ecrqd9qpfsP2YCv9mQ7C39cis+kRBwV3lceQYmAHsHXe4wOEJO4SqbZzZ8HW+ciDAcaoZi6FEKESN0jdVcVx9GE1NKgLcK28geBUr+UrQBz8qR7iBKdTpMRfYnDwaNFuV9l7AC4GanCaP5lAI/13D0BJSZnz7cDKEA6hTk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199015)(31686004)(36756003)(31696002)(6916009)(54906003)(4326008)(66556008)(66946007)(41300700001)(66476007)(38100700002)(8676002)(186003)(6486002)(478600001)(6666004)(6512007)(86362001)(15650500001)(2616005)(8936002)(2906002)(316002)(6506007)(83380400001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0JwcDg2L0lIbmRCMk5TVVFUQjZ6UUsrc1RiZmNhSlNPYkpBWGdPL3Rad1gx?=
 =?utf-8?B?Y0RNMWtjOU5CMDNRTVgySHFXb1NIbFdWWktITERFemFaYW9jZ2tyRUI1czFx?=
 =?utf-8?B?Y3VzTGMwclRWRWhkMjNwWDRpRU1Udy9ZNklzeHM0WGVyeFNYNHBaUkIveTdG?=
 =?utf-8?B?dFJUNndBZWtHZnh6d1BWMHFwMkhIYkhwNWpUMzAyWU9nTlFxTFBzL3paVTVO?=
 =?utf-8?B?RldnNEp2NnZUWTZpRGJWeS9GSWZiZDUzdU9yZWNZMHZXRzM1Um5VZnpaKyth?=
 =?utf-8?B?QlRUcHVIdWdzd3paWHQxOHhDbjJTeUN4OVpaTDRYNHZJbU1scFhwS3g0WGhr?=
 =?utf-8?B?anVBZEo5dGxnRjZKL0ZsVUZNemtveXJ4UE1hSS9JYkNWZk1aYW83dkh6anRP?=
 =?utf-8?B?U3hSeGUyckVjUEhHMXFCeHFxVEhoTkZuVk40R0F6anp1N05CSkxYZXVYb1Iy?=
 =?utf-8?B?UkJVbUpvdDVQc1B5cmZLeldzQ3JCQng3SGI4eUxsMnFjZGVBdVFnbjNDSDZO?=
 =?utf-8?B?d1N6bUF6S3J3NVp3UEcramJqSk41SnVVVlE5Tkdpem1PN1B6ZGlMbGl1WmRD?=
 =?utf-8?B?bkJyNTNQYjdld2RSaWJvVi9oMjdHdEJNYmxPbU9IeEpqaDloVGRjYmlUeEhO?=
 =?utf-8?B?bGpYZTdKYjNxaW56dnRTL1lGRDVqRDA3K2FzakdwaCtsVHdtNURyZHR5UC83?=
 =?utf-8?B?WFFQaGR2cVVzclhNSU1EZ0M3YWV5K3ZvN292TFdKSm5mdHdPc1Y3L21YZHAx?=
 =?utf-8?B?eEx3aDdlVFQzVXZKSzltNFZqbW5OdkhkeCt6d3RUZlNpTlhJdHRZL1kwZWdG?=
 =?utf-8?B?ZlRGY0sxUngxblZ4MmpvRlpCa0x4L0tiakNLdmR5WmNBcjJrTm9PcFVndmpC?=
 =?utf-8?B?RmM5UXk1SE5KS2ZOUktuUUQ2TFZtWkhLT2Y3TXpwbFRzMlBSVzBCYnkydmhC?=
 =?utf-8?B?WnNGR2pCWmZvZXhheXpYSTc1ZWllS1M3dFFtb29ibnZiQ1owNlhCSHNyaFhM?=
 =?utf-8?B?akdRZXJPQTc5WlkyTC9Wc0pyUFNLTkg3bEM4SDNiL0Y1QkN1VFZMRmNLVlZy?=
 =?utf-8?B?YVBEa3dCclA3MFpFWmw0MzNPZGU2MlFIdVdlMnVGSitnSHlzbk5kRGR3Vytk?=
 =?utf-8?B?VEZxTmdKZDBHMXhnYnYydXdnby9ITlE3aTBvVXJqU09oeGNDUmdERkxOem1R?=
 =?utf-8?B?bVc3eFB0YTRpVE9tMlF3aDZvdVN5NXNPaSt1YXpwQ1RRT1dVQlhiZjNlaTdl?=
 =?utf-8?B?OXFYcjlsSFR2elJmTVZ3MHlLWFpLUExsTmJsZThIUzhSWnpISDR2T0JwcG1w?=
 =?utf-8?B?ZWNZcTBMQ3JSaXdBVVJLeGpWSXVSbHZ1VzluS2JkMzNEK001Nm5idlJlY3dS?=
 =?utf-8?B?RjFoTGREVHA2T1IrYlJUNDRwMjJ5TUZ6eDl2dlhVWEhYQitWd3BUK1IxdmIv?=
 =?utf-8?B?bDJ4SHQvZVhuaG1keDBubU8rMEFacGJsbEIyWlhwWVJkL1VRb0o1QXU5MW50?=
 =?utf-8?B?SURMS0VWblhDRFZDZENzRlBBenpXRnpXNm9UTU15eEQ4TysrR1JqNHlZcXJN?=
 =?utf-8?B?eDF6Rm9kdUpJTGlQNDA5ZmJWM1hRRWZwMlQrcVgvQ29RaWRscHhDM3ZDWXBu?=
 =?utf-8?B?NXowWDRONDNuNUxWN1lFK3NVTTZqa3ROYlkyYVFQRks0VkVzb1QrYkJtMXRR?=
 =?utf-8?B?SE10VzdVbGlyaFNuOG0rdzcxcEJSeGtiMHZxK21vUC9JT0ZrcE40RE1UaUdn?=
 =?utf-8?B?bkNYQzFZcUdoZnJRTE5FNmFHTVlMZTgrUXpUbEo5VmgrSjdXanZTRHFUTFhh?=
 =?utf-8?B?VGM3V1ZhdWxaYU5hQVpqUEwrdkc2RXFHayt0OWxKUCtPaTgybTNWNER6M2U4?=
 =?utf-8?B?U2tpcDVOM3Uva3NDQm5ZNjZmYVNoUFY1SVQwdWlCZWJnZDdLcGN4cGduc0py?=
 =?utf-8?B?NGV0ZUdVUmg3ZGlVSWJUaW0rNWwwWDd5bnlKNGxubWE0aFVHWVpoc0dreW5j?=
 =?utf-8?B?cUEwdVhHSWNrZWh0b0J0Ukw0clFnZlhjL2gyU3FGTi9LVFlYVFhaWTFDd0to?=
 =?utf-8?B?eFluZHJUcE1OSW9aNng4R2dTc0IxVDFpaVZCdzB5SUxQaWwvRFJYZ2pobWdR?=
 =?utf-8?B?dE9VRGRnaXVDL29wT3hDeVByTFdTYkZ0ZWFuL1RoYzlqYjdHTnovRE1RMzFp?=
 =?utf-8?Q?1reWNudFnhmmWMm/KWFaHU+jplewEiL+iRzVl66rVUuk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb429d5-9411-4060-4c8e-08daefd14bdb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 10:32:22.8712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xl3iQVvZyI4j1k0FdEQCSPuDrj5NQ2VX3v+/iGPKK1uL/Zo7VgFg3BatcC5a/ZcM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246
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

Am 05.01.23 um 13:32 schrieb Daniel Vetter:
> [SNIP]
>> For the case of an master fd I actually don't see the reason why we should
>> limit that? And fd can become master if it either was master before or has
>> CAP_SYS_ADMIN. Why would we want an extra check for the pid/tgid here?
> This is just info/debug printing, I don't see the connection to
> drm_auth/master stuff? Aside from the patch mixes up the master opener and
> the current user due to fd passing or something like that.

That's exactly why my comment meant as well.

The connect is that the drm_auth/master code currently the pid/tgid as 
indicator if the "owner" of the fd has changed and so if an access 
should be allowed or not. I find that approach a bit questionable.

> Note that we cannot do that (I think at least, after pondering this some
> more) because it would break the logind master fd passing scheme - there
> the receiving compositor is explicitly _not_ allowed to acquire master
> rights on its own. So the master priviledges must not move with the fd or
> things can go wrong.

That could be the rational behind that, but why doesn't logind then just 
pass on a normal render node to the compositor?

Christian.

> -Daniel
>
>
>
>> Regards,
>> Christian.
>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> -Daniel
>>>>
>>>>
>>>>>            return 0;
>>>>>          if (!capable(CAP_SYS_ADMIN))
>>>>> diff --git a/drivers/gpu/drm/drm_debugfs.c
>>>>> b/drivers/gpu/drm/drm_debugfs.c
>>>>> index 42f657772025..9d4e3146a2b8 100644
>>>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>>>> @@ -90,15 +90,17 @@ static int drm_clients_info(struct seq_file
>>>>> *m, void *data)
>>>>>         */
>>>>>        mutex_lock(&dev->filelist_mutex);
>>>>>        list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
>>>>> -        struct task_struct *task;
>>>>>            bool is_current_master = drm_is_current_master(priv);
>>>>> +        struct task_struct *task;
>>>>> +        struct pid *pid;
>>>>>    -        rcu_read_lock(); /* locks pid_task()->comm */
>>>>> -        task = pid_task(priv->pid, PIDTYPE_TGID);
>>>>> +        rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
>>>>> +        pid = rcu_dereference(priv->pid);
>>>>> +        task = pid_task(pid, PIDTYPE_TGID);
>>>>>            uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
>>>>>            seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
>>>>>                   task ? task->comm : "<unknown>",
>>>>> -               pid_vnr(priv->pid),
>>>>> +               pid_vnr(pid),
>>>>>                   priv->minor->index,
>>>>>                   is_current_master ? 'y' : 'n',
>>>>>                   priv->authenticated ? 'y' : 'n',
>>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>>> index 20a9aef2b398..3433f9610dba 100644
>>>>> --- a/drivers/gpu/drm/drm_file.c
>>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>>> @@ -156,7 +156,7 @@ struct drm_file *drm_file_alloc(struct
>>>>> drm_minor *minor)
>>>>>        if (!file)
>>>>>            return ERR_PTR(-ENOMEM);
>>>>>    -    file->pid = get_pid(task_tgid(current));
>>>>> +    rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>>>>>        file->minor = minor;
>>>>>          /* for compatibility root is always authenticated */
>>>>> @@ -502,6 +502,36 @@ int drm_release(struct inode *inode, struct
>>>>> file *filp)
>>>>>    }
>>>>>    EXPORT_SYMBOL(drm_release);
>>>>>    +void drm_file_update_pid(struct drm_file *filp)
>>>>> +{
>>>>> +    struct drm_device *dev;
>>>>> +    struct pid *pid, *old;
>>>>> +
>>>>> +    /* Master nodes are not expected to be passed between
>>>>> processes. */
>>>>> +    if (filp->was_master)
>>>>> +        return;
>>>>> +
>>>>> +    pid = task_tgid(current);
>>>>> +
>>>>> +    /*
>>>>> +     * Quick unlocked check since the model is a single
>>>>> handover followed by
>>>>> +     * exclusive repeated use.
>>>>> +     */
>>>>> +    if (pid == rcu_access_pointer(filp->pid))
>>>>> +        return;
>>>>> +
>>>>> +    dev = filp->minor->dev;
>>>>> +    mutex_lock(&dev->filelist_mutex);
>>>>> +    old = rcu_replace_pointer(filp->pid, pid, 1);
>>>>> +    mutex_unlock(&dev->filelist_mutex);
>>>>> +
>>>>> +    if (pid != old) {
>>>>> +        get_pid(pid);
>>>>> +        synchronize_rcu();
>>>>> +        put_pid(old);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>>    /**
>>>>>     * drm_release_noglobal - release method for DRM file
>>>>>     * @inode: device inode
>>>>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>>>>> index 7c9d66ee917d..305b18d9d7b6 100644
>>>>> --- a/drivers/gpu/drm/drm_ioctl.c
>>>>> +++ b/drivers/gpu/drm/drm_ioctl.c
>>>>> @@ -775,6 +775,9 @@ long drm_ioctl_kernel(struct file *file,
>>>>> drm_ioctl_t *func, void *kdata,
>>>>>        struct drm_device *dev = file_priv->minor->dev;
>>>>>        int retcode;
>>>>>    +    /* Update drm_file owner if fd was passed along. */
>>>>> +    drm_file_update_pid(file_priv);
>>>>> +
>>>>>        if (drm_dev_is_unplugged(dev))
>>>>>            return -ENODEV;
>>>>>    diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>>> b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>>> index 80f154b6adab..a763d3ee61fb 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>>> @@ -1097,7 +1097,10 @@ nouveau_drm_open(struct drm_device *dev,
>>>>> struct drm_file *fpriv)
>>>>>        }
>>>>>          get_task_comm(tmpname, current);
>>>>> -    snprintf(name, sizeof(name), "%s[%d]", tmpname,
>>>>> pid_nr(fpriv->pid));
>>>>> +    rcu_read_lock();
>>>>> +    snprintf(name, sizeof(name), "%s[%d]",
>>>>> +         tmpname, pid_nr(rcu_dereference(fpriv->pid)));
>>>>> +    rcu_read_unlock();
>>>>>          if (!(cli = kzalloc(sizeof(*cli), GFP_KERNEL))) {
>>>>>            ret = -ENOMEM;
>>>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>>>> index f2985337aa53..3853d9bb9ab8 100644
>>>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>>>> @@ -251,6 +251,7 @@ static int vmw_debugfs_gem_info_show(struct
>>>>> seq_file *m, void *unused)
>>>>>        list_for_each_entry(file, &dev->filelist, lhead) {
>>>>>            struct task_struct *task;
>>>>>            struct drm_gem_object *gobj;
>>>>> +        struct pid *pid;
>>>>>            int id;
>>>>>              /*
>>>>> @@ -260,8 +261,9 @@ static int vmw_debugfs_gem_info_show(struct
>>>>> seq_file *m, void *unused)
>>>>>             * Therefore, we need to protect this ->comm access
>>>>> using RCU.
>>>>>             */
>>>>>            rcu_read_lock();
>>>>> -        task = pid_task(file->pid, PIDTYPE_TGID);
>>>>> -        seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
>>>>> +        pid = rcu_dereference(file->pid);
>>>>> +        task = pid_task(pid, PIDTYPE_TGID);
>>>>> +        seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>>>>>                   task ? task->comm : "<unknown>");
>>>>>            rcu_read_unlock();
>>>>>    diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>>>> index 0d1f853092ab..27d545131d4a 100644
>>>>> --- a/include/drm/drm_file.h
>>>>> +++ b/include/drm/drm_file.h
>>>>> @@ -255,8 +255,15 @@ struct drm_file {
>>>>>        /** @master_lookup_lock: Serializes @master. */
>>>>>        spinlock_t master_lookup_lock;
>>>>>    -    /** @pid: Process that opened this file. */
>>>>> -    struct pid *pid;
>>>>> +    /**
>>>>> +     * @pid: Process that is using this file.
>>>>> +     *
>>>>> +     * Must only be dereferenced under a rcu_read_lock or equivalent.
>>>>> +     *
>>>>> +     * Updates are guarded with dev->filelist_mutex and
>>>>> reference must be
>>>>> +     * dropped after a RCU grace period to accommodate lockless
>>>>> readers.
>>>>> +     */
>>>>> +    struct pid __rcu *pid;
>>>>>          /** @magic: Authentication magic, see @authenticated. */
>>>>>        drm_magic_t magic;
>>>>> @@ -415,6 +422,8 @@ static inline bool drm_is_accel_client(const
>>>>> struct drm_file *file_priv)
>>>>>        return file_priv->minor->type == DRM_MINOR_ACCEL;
>>>>>    }
>>>>>    +void drm_file_update_pid(struct drm_file *);
>>>>> +
>>>>>    int drm_open(struct inode *inode, struct file *filp);
>>>>>    int drm_open_helper(struct file *filp, struct drm_minor *minor);
>>>>>    ssize_t drm_read(struct file *filp, char __user *buffer,
>>>>> -- 
>>>>> 2.34.1
>>>>>

