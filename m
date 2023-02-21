Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D5B69E519
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 17:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A51310E8A6;
	Tue, 21 Feb 2023 16:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3580A10E884;
 Tue, 21 Feb 2023 16:48:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuClGxJ0ESJBHYMhb3Lk28AUn8H29k6ztdCS/GkVboq9tjSZgHcZcHOzi1/JW/dCHhD1XFuvWHoaj5OvOG148+WOq9ml7OHykZVNUjcPIZEafI5GIGVmJ7NieNgcOyLUf5mEyaGl9mtYdi9pJa/n9dFn3mwdoFyB6V9DwPCvdWVS7eyTi7qsJI2hpSYgEoIkI2+JexMyQ/z6ijepYefegyMu0qlrGYsYXdJYvNih5MTsQ8lYS1v7H/SlqrZWqRpQb+VE7UXF55QpVdhL236CJQYrGiyslauC7kEl2uDG55IGG36to6eDFKEcIXDTLdkw2vZkUPJHqgahU7yXX97T5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJZHDkctBifI3hhpp9wotdwYZQaCyl+N2Ft0yK0J29o=;
 b=de6VjBL+g/XFtKikUQtd++ZZrwh1cwuycksC4gO0/dlg+++2y/bOF5CNEQPJ6phyDMlSyT47M0eGQnH8mlUsEGHGaoh+d07VnUy0WQ+1wq/LMGr5+cO9DwCcKhATgf4rh/QGDwstyoCoKTOQYPH2DQaF3hEH8kRcjmWVF8otu7Zrjou+WTa67p9EoSs8ClZhwMZmDbBzMnhc1gk9VBxZzgX7WQQ8bQpB9eFxq4N3GU5xMjrbBnCZp2CWxczVEnMyKAccGJa5tT6zdqFEgVsxAIlPEDShFouP7MGEw3Fk5tApFTdf6rP205biVG7SM9Io1FSgUO3qcnmwhdVoBnuuFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJZHDkctBifI3hhpp9wotdwYZQaCyl+N2Ft0yK0J29o=;
 b=QACBvZ0PdzmpbbozXQXIW8eV9pHWCFIXOCQl2126Urdnv1P/VlJ+GvBF1VD+5XbS/f25rZvdTwasIso++fKM7vNQvDfHkSr6myh+8+z6dASXN2EaCrMIt53KSE7sEGa8D+K+QeqzPsKz+kolcKn6vn4rYyKDvA0MOjFYXyKLdHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Tue, 21 Feb
 2023 16:48:38 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 16:48:38 +0000
Message-ID: <cdd5f892-49b9-1e22-4dc1-95a8a733c453@amd.com>
Date: Tue, 21 Feb 2023 11:48:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-CA
To: Rob Clark <robdclark@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
In-Reply-To: <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::17) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB6588:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f2e10b-1160-409b-e4ee-08db142b7afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yFQNF+rv4rOPDu6B024wjoayrum8XLyq97vPc0HNATPwpKJ32dfIHc3mkDZ5brZfZF4ObsfdCg1I9IiLfYDquzgi0ZLO+arENpfkoGzERby0EQzF5BlnAMj4Xe4yirmYlMd2cwq0kV22RmkHduaY9U084Egkyqm6ZJ/jo0sF+oYWh4IFXHTGV7r+Qg3TRAJtTm/VkEWwc6olOe6EGNCECUD0JcmdoIKRc0MFpdEGHVV4oOh/gnATXM6y3CR3ilOcrPdLkB6MT9Ni3iR6Rr0CKQ7nsgNWsdqe9a1O3kwkjJJjrBFqWgeLrSdJiXdOfSEzNhQSN2ucjuXfMawL5ZphKL2Jt10lYe/t4B5TMHJtPw46w2f7S8neiJbnZ0wvtW9ABVKTq4GwYK31EMjFn9DwRWDizj7EdnZnw+3mj6Cxdr9UN1+Jbi/dGZjIPQiOk4BNaxJkGZdjmvrAWiHZArNH+ZCCZ4l3oTKnxMkq+W5f7uwlNRoUJbpczxRce11JnJWkAXpRS9ea4hYUMggGADlK9P4VAYbhWm5ZJyHwSslo0p/iEluZ5zRu5X2xcGvlsoQnYPIAPFEcd6dm+YztE80tzUPTUd74lqBQPloz4MazAbvSF8uZtpAIMHIdZYJW/EtaG9yD4/xmPXhySnwpli7QK2oLUSDtZbLFINuFNEbmF9jW8tAx8LTWbjJD8NgMhjbvNgMxbJlY2PZh4p/pHO5shdV8vXAqlLkgaOWePK2W83Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199018)(6486002)(36756003)(316002)(54906003)(110136005)(186003)(478600001)(8936002)(2616005)(26005)(7416002)(2906002)(5660300002)(44832011)(41300700001)(86362001)(6506007)(66946007)(53546011)(6666004)(4326008)(83380400001)(31696002)(8676002)(66476007)(55236004)(66556008)(38100700002)(6512007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a09JSE5XRGMrUFNySDlFeHRVTkhoYVdiaUJqeGxndUpLOTU5YVM0eXM4TDlz?=
 =?utf-8?B?MEpxTlRFdndNSnJ3ZmZFM3RSWVo4WXVpMGFJcUMzOEdTMmNwZVF4U0pWa2VX?=
 =?utf-8?B?ZVdyS25vb2Q3RW14VkIweHlLVnJEWVRGV0hpcHVESWV3Wlh1ZUZ3WVZTd1JJ?=
 =?utf-8?B?RndGcGY3dmdKUG5NUDJzRmtlQmxtMGVVczUwZUQ3SVJJNmhqQWRlK3hhOERx?=
 =?utf-8?B?VnZ0dDRubGhoaDQwSXpvT3N1THlTVk1jMGhOcnpEeks5cmprdVlUYks0UE9X?=
 =?utf-8?B?bjMwQWtENFZrYlFGRnY1eHhHU05yaWNKa2NpZDQrWGU2a2w0Z0ppK3N4RWhk?=
 =?utf-8?B?QkNFWkNnSVN3K21IRE42bndpeXU2U0I5SCtLMXRmTm4wc0RreS9ZbkZxYTI3?=
 =?utf-8?B?eEw0TjRWamhsVXl0MktmTVhWbVRaN3VlM2FaRHZ3UnlWT2IzUjhFYjFSOFow?=
 =?utf-8?B?V2tyMUlMMWU4WktESlJVbGNJeVVPdHYwQW5yMUxDYjg5NGZ1S25iTGZnTzlX?=
 =?utf-8?B?MmZvMFVQY3lpamliNkMwd09WU24vSXFEOXlwdHp1OXRTWmRZUmFqR0hjNzBC?=
 =?utf-8?B?K2hBVEw0ajRveko5ckpyeS9ld1JnVlp2YUQ0R0wydzlvRVFxVTdkY1NrY2xa?=
 =?utf-8?B?RVFSQnpZVVllZmM3R3Q5MFd1QU9LSnVvZlR0aXlLaWlxN2o1NzZOUnVZMmdo?=
 =?utf-8?B?Y0lWVkM4MkhkWUk0anRETXAwNmhoYTVSM1hQa3NwQmp6TkhsdW5oc2Y4cE9s?=
 =?utf-8?B?aTRiRkVyUlRPY1VLc3VlSjFhSy9GUkx1eHM2RzUzL1JxMks2ZVZOYmpRdlE4?=
 =?utf-8?B?ODJ1VDc3enhTRy9HZnp1eGlmVlIwSHYyN1hRUnViOUh3OXJ1dGM2OXlaeXd2?=
 =?utf-8?B?eFdFSWd1aWNxS3M1Qmc5dGtKMGRJTHFxcXhGaUtRUm5POExqZFhVanZUY0hz?=
 =?utf-8?B?RnJjMlNyVVV1T0JRWW1COUpxL0ljU2ZBeWZSanBxTTBEMi95RWJEOHR0OWYx?=
 =?utf-8?B?bkdjQmhiVDhyNnRaTmx6YlYwNTY1V0JPdmRvNzRHUVRveW80Q3UzSnlLWGNu?=
 =?utf-8?B?YTVoTW9TVU0yaUtKaWFBdW1uck5zbVBJN2M5ZUtaRjdtcFNGYWN4Q0VTMCtQ?=
 =?utf-8?B?aW52ZSs3WkRuamV3UzRaNldHZyttdGNiaEZJbWVQbFByblhjWW40bFM3TE9H?=
 =?utf-8?B?Q2pmblRDeU1qblZqdVhFemdrby95T1I0TTF4YnVJUlFXSmtza0doNE9hYjdX?=
 =?utf-8?B?VW5QU09TQTlNakRqaUpVNjdZell1SU9uN1NQQ2NaZW5OTndEK01xeFlTdC9t?=
 =?utf-8?B?V2k3OU9XWjdxNlFGRERyK3pjRzhjeDNHc2ZpRzZFbm1GTVpMRXBwY2VCY3FK?=
 =?utf-8?B?NkoxMmk5aU9tVDZEcTQvR1VKM0ZGSDJsTTJQVXc3MTBFQU9qUTBObWczSHdO?=
 =?utf-8?B?Z1RQd2tSUzRsUnlaQ1NTVUQraTM1TEhDc1dtamxYY2FVekpadjJwaUZrRFJ3?=
 =?utf-8?B?WG52b0c0Nmd0aGRVUnBHTDN6U05oazIxMjd4RWo0R2l2R1U0RXNDU3hpQjdQ?=
 =?utf-8?B?dnZwVzRuR0JSZXFZLzEwUjlGK2NxTnBLc0ZaVXpKRGtPaFhqSmZtNWEwNDlM?=
 =?utf-8?B?dms5dGtmOWpFeGRwWjZJVHBHdTZFRFM3VVFyeGsxSkh1QVFZZTI3THphMDZO?=
 =?utf-8?B?UGtMeTVuUzlvR21NYUV2bHFOUU04WG8vb1d1bDdiZHRwTlFaK2MxQ1JaUXlF?=
 =?utf-8?B?SDI3d2ZJcmFzNTRHVmVhcDB3OUtqVVBubm5NTEt0Q0JBK3hhWTVCekhMSjRm?=
 =?utf-8?B?N1pKV0lVUjJJVy9KeC9UeXRicnFmZXhGYlZxNHFGU25xYUd0dHpBazFZNmhm?=
 =?utf-8?B?WDRSSEh1Q3ZYbDQ2TEt3NUNWS2dybTljb0w0ZjhnMUsvRENMYmF2dnNXMnJy?=
 =?utf-8?B?Y1ZxYXlpWUJxbTN3NS92YjdDLzBKb0w4MlI4bWJubTNaS2I3NDg1cXcxNUxF?=
 =?utf-8?B?NlhUYVBBenlPa3kyQ2dBR0VURS9TVndOTVBGaTBZS2llQnpRdmdoLy9iN3V2?=
 =?utf-8?B?NUNtWHlJbnJkTjEvTlpDM3J6WnRBTHZ6a29lZlBPMFA0aGpUdlBWTGRCN21l?=
 =?utf-8?Q?vTG0E68I6Xlabs/t1i4PUtOf3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f2e10b-1160-409b-e4ee-08db142b7afc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 16:48:38.4475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmR+XZqpMTaH2HfQJs0XGtHIDK2e8/0jDJNHjCwiQcYNU9EtwM44lbfglsB0pDpT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6588
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-20 11:14, Rob Clark wrote:
> On Mon, Feb 20, 2023 at 12:53 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>> On Sat, 18 Feb 2023 13:15:49 -0800
>> Rob Clark <robdclark@gmail.com> wrote:
>>
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urgent
>>> wait (as opposed to a "housekeeping" wait to know when to cleanup after
>>> some work has completed).  Usermode components of GPU driver stacks
>>> often poll() on fence fd's to know when it is safe to do things like
>>> free or reuse a buffer, but they can also poll() on a fence fd when
>>> waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI flag
>>> lets the kernel differentiate these two cases.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>
>> Hi,
>>
>> where would the UAPI documentation of this go?
>> It seems to be missing.
> 
> Good question, I am not sure.  The poll() man page has a description,
> but my usage doesn't fit that _exactly_ (but OTOH the description is a
> bit vague).
> 
>> If a Wayland compositor is polling application fences to know which
>> client buffer to use in its rendering, should the compositor poll with
>> PRI or not? If a compositor polls with PRI, then all fences from all
>> applications would always be PRI. Would that be harmful somehow or
>> would it be beneficial?
> 
> I think a compositor would rather use the deadline ioctl and then poll
> without PRI.  Otherwise you are giving an urgency signal to the fence
> signaller which might not necessarily be needed.
> 
> The places where I expect PRI to be useful is more in mesa (things
> like glFinish(), readpix, and other similar sorts of blocking APIs)
Hi,

Hmm, but then user-space could do the opposite, namely, submit work as usual--never 
using the SET_DEADLINE ioctl, and then at the end, poll using (E)POLLPRI. That seems
like a possible usage pattern, unintended--maybe, but possible. Do we want to discourage
this? Wouldn't SET_DEADLINE be enough? I mean, one can call SET_DEADLINE with the current
time, and then wouldn't that be equivalent to (E)POLLPRI?
-- 
Regards,
Luben

