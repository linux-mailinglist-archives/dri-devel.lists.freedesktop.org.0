Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0461A3DBB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 03:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCCF6EC43;
	Fri, 10 Apr 2020 01:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6375F6EC40;
 Fri, 10 Apr 2020 01:24:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVHUzdhyeTCWQ6CJ2GyVDEKbT/1Oc/rqmks5/JGTbp+t1jp+sLPGI0m0lJQfO/rI7RiIBIetpDYwElsjdqcXylNwYkrNXLDLcpD1LJZxUKOYWDf5v27JTl0PVhiEyJrjaMoP6/E1of5fl3Wi6rTKwszmlahs5LeEeUMqZHyejhQRuCJuY/BFIZB8P86mRSvY3e7xU9ApUb8Z+5P3BM66s6mmJMoAy2kwi26V/CPH1SqIvB5LgR/QnTERugdNCImTmVQhdhyq6mzt4DJkxt8SU2AZ3vGdkzWnLV4KcdFm4uWFmIR0XztX12tFQlVcnT8j5lcJyRM5oGCf0SPBd3KbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vymykg0kV2LjspbpcCQeXJUuUl34zEaw/ziQVz1Fp2M=;
 b=oFKtJulBSF9/HEutmXMmoXt4BRiEzoTqyhT0Xz4fmHotunHNRn8O588WXI0qg6EI7iBaUckjSp077/rq/NvfkvDUAwpuwB4k7vJo0mMcJk9PgFJKXIWbQuRdFRwDUHm98mt9iEVXDHj8rySpcgLcldH4uLgJgQlboE8KCwR88qd8EW4Y3cg1XGQQny1clNuod4XTyJ/FzGAagz0oyKIBKZQ0Fzw+WHe4WKswiCVJ2SDXTqES9t4nk6hKxBsSCJ6oN0j3tvIzaDOZ+aHCrp9JATZ8N7KwBTGsHmyieFnf8Ef264lgOMp6Fza2hL9B4lCYRC53msMs1cOcYKNeeK8Vkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vymykg0kV2LjspbpcCQeXJUuUl34zEaw/ziQVz1Fp2M=;
 b=AkDT3xCUe2pcyYblD1SSH3AquIMfL4qcxqn8DMMHwQQjfE83yE8G/zI19EjWNqw/yKDc8lVeJMZmd9oveDexpV7RMebz8CQkfqwTg0NOG84K/wOxq6ni6GRBYGkjtrYPYYvWY8ePS8Lt0MYBKs3mvNWn90pCkciaaaWvuQaLrRo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
Received: from DM5PR12MB2440.namprd12.prod.outlook.com (2603:10b6:4:b6::39) by
 DM5PR12MB1226.namprd12.prod.outlook.com (2603:10b6:3:75::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.20; Fri, 10 Apr 2020 01:24:03 +0000
Received: from DM5PR12MB2440.namprd12.prod.outlook.com
 ([fe80::557:72a2:dfed:1c28]) by DM5PR12MB2440.namprd12.prod.outlook.com
 ([fe80::557:72a2:dfed:1c28%6]) with mapi id 15.20.2878.018; Fri, 10 Apr 2020
 01:24:03 +0000
Subject: Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed delete
 worker
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lucas Stach <l.stach@pengutronix.de>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20200409013148.4219-1-xinhui.pan@amd.com>
 <7ebd6025-a563-30d1-8c84-cb031bfef0c1@amd.com>
 <d80c89fe353a114df786e75563d434c496b8140d.camel@pengutronix.de>
 <8b634370-1771-4aa4-8725-74b5d807db4b@amd.com>
 <BL0PR12MB254767C8A1AFAE0D52685A1F87C10@BL0PR12MB2547.namprd12.prod.outlook.com>
 <BL0PR12MB254789981840471CD72EBFD487C10@BL0PR12MB2547.namprd12.prod.outlook.com>
 <BL0PR12MB2547BF609F21C48B17A402A087C10@BL0PR12MB2547.namprd12.prod.outlook.com>
 <64928371-a0e1-be53-f650-a9a365a6b2af@amd.com>
From: Chunming Zhou <zhoucm1@amd.com>
Message-ID: <244c3903-e927-f5fb-de98-9b7cd8e04fe5@amd.com>
Date: Fri, 10 Apr 2020 09:23:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <64928371-a0e1-be53-f650-a9a365a6b2af@amd.com>
X-ClientProxiedBy: HK2PR04CA0083.apcprd04.prod.outlook.com
 (2603:1096:202:15::27) To DM5PR12MB2440.namprd12.prod.outlook.com
 (2603:10b6:4:b6::39)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:240e:e0:8c6a:9800:d006:21bc:aaa6:e69d]
 (240e:e0:8c6a:9800:d006:21bc:aaa6:e69d) by
 HK2PR04CA0083.apcprd04.prod.outlook.com (2603:1096:202:15::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Fri, 10 Apr 2020 01:23:57 +0000
X-Originating-IP: [240e:e0:8c6a:9800:d006:21bc:aaa6:e69d]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2dd33b7b-8380-445c-c11f-08d7dcedda7f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1226:|DM5PR12MB1226:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB122623D8AF8649D9F67BDC9CB4DE0@DM5PR12MB1226.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0369E8196C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2440.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(31686004)(81156014)(2906002)(52116002)(33964004)(186003)(30864003)(66574012)(2616005)(16526019)(53546011)(316002)(5660300002)(81166007)(31696002)(6666004)(8676002)(966005)(36756003)(66556008)(6486002)(45080400002)(66946007)(8936002)(110136005)(4326008)(66476007)(478600001);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ymMUu1symZ1XdDOCUVedLATdlmSOqbARkPEPcetwx9edqq8jDcoVW3SErLnl96rTdfEKtdJAKsUrTC5VNBtcE9GbJde7HX7sPw8JX5e8m/W2FWbSBummhw8w9hUWV80BXEfTEN63iRagdg/houvtCB/ja4KNLxuUJ0TDPyvfLazduWIUxCfQsltU5nkBRVVo4nPN9v6BHHwDrXijodzILJN4VY5iz8x+b2xNaZ6n99GOl5RXwrw4elUa1RJzUwdzA/Qo3Dz+LAPeViyv7SPS8FHjrm4TcgHAYFJP8lT4jGbzSuZvjoFmgJp8pSkZhNxGcSlTVKgmVAANJCHfR5EcI3Lcg8zEt9um5fuOC5ozQSAP4tNP4KSla63tV2vNLG8h0rjjIA1vb7xg67AO7seEsGNSh8Ci6lonMaxKx+RWUHfJ7gwVBIy56Hud6Jba6vSR5Y6iaOQRFsmYRKTD2yEkmXvtoN15lOfhCttbPwZx9T7bGopzF7oF0LlCqCW7hzEmcT+xuqkzA5xvsO8JoJnng==
X-MS-Exchange-AntiSpam-MessageData: 1F/unjH4oIJPNpnU/j/kXBaYhDT6UsQByTXqL1wW+hJAZT4E8BNJYWHXXoAxbSyAwe769b3NZDATYxWOCOJbzMSPGmnUIky/142yjyfMpQs5Tn6UkcPgfDN6zwGu8+g5vPXiDbGn5bxNsy4JJuDLAuaJNBvKhm/ZKdhP1ynG40HQmOvI+Xg/CXVvEN1kVj2dY7fw5XWp/TPaCZzAevF0Cw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd33b7b-8380-445c-c11f-08d7dcedda7f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2020 01:24:03.3826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5npC8a3QxmqbSAX/DJEn7sO5LENn6ENX/MWA7wkwEDqBs+kKHVOfzlF3F5CPwA+p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1226
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2026964898=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2026964898==
Content-Type: multipart/alternative;
 boundary="------------38306113F9BE6D77BDE07FEF"

--------------38306113F9BE6D77BDE07FEF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

We can have both of yours, I think.

Even switch to use spin_trylock, I think we are ok to have 
cond_resched() Xinhui added in this patch. That can give more chance to 
urgent task to use cpu.


-David

在 2020/4/9 22:59, Christian König 写道:
>> Why we break out the loops when there are pending bos to be released?
>
> We do this anyway if we can't acquire the necessary locks. Freeing 
> already deleted BOs is just a very lazy background work.
>
>> So it did not break anything with this patch I think.
>
> Oh, the patch will certainly work. I'm just not sure if it's the ideal 
> behavior.
>
>> https://elixir.bootlin.com/linux/latest/source/mm/slab.c#L4026
>>
>> This is another example of the usage of  cond_sched.
>
> Yes, and that is also a good example of what I mean here:
>
>> 	if  (!mutex_trylock 
>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fident%2Fmutex_trylock&data=02%7C01%7CDavid1.Zhou%40amd.com%7Cfcae774489544a033c0608d7dc969f31%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637220411795246517&sdata=XACA%2BgpBkJEgPva9c7Wf6Ca1bAOrNaXARf%2B4ze1Mqyw%3D&reserved=0>(&slab_mutex 
>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fident%2Fslab_mutex&data=02%7C01%7CDavid1.Zhou%40amd.com%7Cfcae774489544a033c0608d7dc969f31%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637220411795256512&sdata=z9uAZriS46hBXuYeVaYkAWb%2BPLYwLcCrK%2BWa4DRO0zw%3D&reserved=0>))
>> 		/* Give up. Setup the next iteration. */
>> 		goto  out;
>
> If the function can't acquire the lock immediately it gives up and 
> waits for the next iteration.
>
> I think it would be better if we do this in TTM as well if we spend to 
> much time cleaning up old BOs.
>
> On the other hand you are right that cond_resched() has the advantage 
> that we could spend more time on cleaning up old BOs if there is 
> nothing else for the CPU TODO.
>
> Regards,
> Christian.
>
> Am 09.04.20 um 16:24 schrieb Pan, Xinhui:
>> https://elixir.bootlin.com/linux/latest/source/mm/slab.c#L4026
>>
>> This is another example of the usage of  cond_sched.
>> ------------------------------------------------------------------------
>> *From:* Pan, Xinhui <Xinhui.Pan@amd.com>
>> *Sent:* Thursday, April 9, 2020 10:11:08 PM
>> *To:* Lucas Stach <l.stach@pengutronix.de>; 
>> amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; 
>> Koenig, Christian <Christian.Koenig@amd.com>
>> *Cc:* dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
>> *Subject:* Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed 
>> delete worker
>> I think it doesn't matter if workitem schedule out. Even we did not 
>> schedule out, the workqueue itself will schedule out later.
>> So it did not break anything with this patch I think.
>> ------------------------------------------------------------------------
>> *From:* Pan, Xinhui <Xinhui.Pan@amd.com>
>> *Sent:* Thursday, April 9, 2020 10:07:09 PM
>> *To:* Lucas Stach <l.stach@pengutronix.de>; 
>> amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; 
>> Koenig, Christian <Christian.Koenig@amd.com>
>> *Cc:* dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
>> *Subject:* Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed 
>> delete worker
>> Why we break out the loops when there are pending bos to be released?
>>
>> And I just checked the process_one_work. Right after the work item 
>> callback is called,  the workqueue itself will call cond_resched. So 
>> I think
>> ------------------------------------------------------------------------
>> *From:* Koenig, Christian <Christian.Koenig@amd.com>
>> *Sent:* Thursday, April 9, 2020 9:38:24 PM
>> *To:* Lucas Stach <l.stach@pengutronix.de>; Pan, Xinhui 
>> <Xinhui.Pan@amd.com>; amd-gfx@lists.freedesktop.org 
>> <amd-gfx@lists.freedesktop.org>
>> *Cc:* dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
>> *Subject:* Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed 
>> delete worker
>> Am 09.04.20 um 15:25 schrieb Lucas Stach:
>> > Am Donnerstag, den 09.04.2020, 14:35 +0200 schrieb Christian König:
>> >> Am 09.04.20 um 03:31 schrieb xinhui pan:
>> >>> The delayed delete list is per device which might be very huge. 
>> And in
>> >>> a heavy workload test, the list might always not be empty. That will
>> >>> trigger any RCU stall warnings or softlockups in non-preemptible 
>> kernels
>> >>> Lets do schedule out if possible in that case.
>> >> Mhm, I'm not sure if that is actually allowed. This is called from a
>> >> work item and those are not really supposed to be scheduled away.
>> > Huh? Workitems can schedule out just fine, otherwise they would be
>> > horribly broken when it comes to sleeping locks.
>>
>> Let me refine the sentence: Work items are not really supposed to be
>> scheduled purposely. E.g. you shouldn't call schedule() or
>> cond_resched() like in the case here.
>>
>> Getting scheduled away because we wait for a lock is of course perfectly
>> fine.
>>
>> >   The workqueue code
>> > even has measures to keep the workqueues at the expected concurrency
>> > level by starting other workitems when one of them goes to sleep.
>>
>> Yeah, and exactly that's what I would say we should avoid here :)
>>
>> In other words work items can be scheduled away, but they should not if
>> not really necessary (e.g. waiting for a lock).
>>
>> Otherwise as you said new threads for work item processing are started
>> up and I don't think we want that.
>>
>> Just returning from the work item and waiting for the next cycle is most
>> likely the better option.
>>
>> Regards,
>> Christian.
>>
>> >
>> > Regards,
>> > Lucas
>> >
>> >> Maybe rather change the while into while (!list_empty(&bdev->ddestroy)
>> >> && !should_reschedule(0)).
>> >>
>> >> Christian.
>> >>
>> >>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>> >>> ---
>> >>>    drivers/gpu/drm/ttm/ttm_bo.c | 1 +
>> >>>    1 file changed, 1 insertion(+)
>> >>>
>> >>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
>> b/drivers/gpu/drm/ttm/ttm_bo.c
>> >>> index 9e07c3f75156..b8d853cab33b 100644
>> >>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> >>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> >>> @@ -541,6 +541,7 @@ static bool ttm_bo_delayed_delete(struct 
>> ttm_bo_device *bdev, bool remove_all)
>> >>>              }
>> >>>
>> >>>              ttm_bo_put(bo);
>> >>> +           cond_resched();
>> >>> spin_lock(&glob->lru_lock);
>> >>>      }
>> >>>      list_splice_tail(&removed, &bdev->ddestroy);
>> >> _______________________________________________
>> >> dri-devel mailing list
>> >> dri-devel@lists.freedesktop.org
>> >> 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C0a47486676a74702f05408d7dc89839c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637220355504145868&amp;sdata=wbRkYBPI6mYuZjKBtQN3AGLDOwqJlWY3XUtwwSiUQHg%3D&amp;reserved=0 
>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&data=02%7C01%7CDavid1.Zhou%40amd.com%7Cfcae774489544a033c0608d7dc969f31%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637220411795266500&sdata=UGbQTN7vjHhNPidodWhXx4sSqUQjtKp4dbCJcztf6ZM%3D&reserved=0>
>>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7CDavid1.Zhou%40amd.com%7Cfcae774489544a033c0608d7dc969f31%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637220411795286493&amp;sdata=SoE%2F8sg9vCb0OwxPF%2FPpKLLUKug%2FAhZDyyvDiQamWp4%3D&amp;reserved=0

--------------38306113F9BE6D77BDE07FEF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11dGYtOCI+DQogIDwvaGVhZD4NCiAgPGJvZHk+DQogICAgPHA+PGZv
bnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij5XZSBjYW4gaGF2ZSBib3Ro
IG9mDQogICAgICAgICAgeW91cnMsIEkgdGhpbmsuPGJyPg0KICAgICAgICA8L3NwYW4+PC9mb250
PjwvcD4NCiAgICA8cD48Zm9udCBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQi
Pjwvc3Bhbj48L2ZvbnQ+RXZlbg0KICAgICAgc3dpdGNoIHRvIHVzZSBzcGluX3RyeWxvY2ssIEkg
dGhpbmsgd2UgYXJlIG9rIHRvIGhhdmUgPGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMXB0Ij5jb25kX3Jlc2NoZWQoKSBYaW5odWkNCiAgICAgICAgICBhZGRlZCBpbiB0aGlz
IHBhdGNoLiBUaGF0IGNhbiBnaXZlIG1vcmUgY2hhbmNlIHRvIHVyZ2VudCB0YXNrDQogICAgICAg
ICAgdG8gdXNlIGNwdS48L3NwYW4+PC9mb250PjwvcD4NCiAgICA8cD48Zm9udCBzaXplPSIyIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQiPjxicj4NCiAgICAgICAgPC9zcGFuPjwvZm9udD48
L3A+DQogICAgPHA+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij4t
RGF2aWQ8YnI+DQogICAgICAgIDwvc3Bhbj48L2ZvbnQ+PC9wPg0KICAgIDxkaXYgY2xhc3M9Im1v
ei1jaXRlLXByZWZpeCI+5ZyoIDIwMjAvNC85IDIyOjU5LCBDaHJpc3RpYW4gS8O2bmlnIOWGmemB
kzo8YnI+DQogICAgPC9kaXY+DQogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlk
OjY0OTI4MzcxLWEwZTEtYmU1My1mNjUwLWE5YTM2NWE2YjJhZkBhbWQuY29tIj4NCiAgICAgIA0K
ICAgICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij4NCiAgICAgICAgPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSI+IFdoeSB3ZSBicmVhayBvdXQgdGhlIGxvb3BzIHdoZW4gdGhlcmUNCiAgICAg
ICAgICBhcmUgcGVuZGluZyBib3MgdG8gYmUgcmVsZWFzZWQ/PC9ibG9ja3F1b3RlPg0KICAgICAg
ICA8YnI+DQogICAgICAgIFdlIGRvIHRoaXMgYW55d2F5IGlmIHdlIGNhbid0IGFjcXVpcmUgdGhl
IG5lY2Vzc2FyeSBsb2Nrcy4NCiAgICAgICAgRnJlZWluZyBhbHJlYWR5IGRlbGV0ZWQgQk9zIGlz
IGp1c3QgYSB2ZXJ5IGxhenkgYmFja2dyb3VuZCB3b3JrLjxicj4NCiAgICAgICAgPGJyPg0KICAg
ICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4gU28gaXQgZGlkIG5vdCBicmVhayBhbnl0aGlu
ZyB3aXRoIHRoaXMNCiAgICAgICAgICBwYXRjaCBJIHRoaW5rLjwvYmxvY2txdW90ZT4NCiAgICAg
ICAgPGJyPg0KICAgICAgICBPaCwgdGhlIHBhdGNoIHdpbGwgY2VydGFpbmx5IHdvcmsuIEknbSBq
dXN0IG5vdCBzdXJlIGlmIGl0J3MgdGhlDQogICAgICAgIGlkZWFsIGJlaGF2aW9yLjxicj4NCiAg
ICAgICAgPGJyPg0KICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4NCiAgICAgICAgICA8
ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyBtYXJnaW46IDA7IHBhZGRpbmc6
IDA7DQogICAgICAgICAgICBmb250LWZhbWlseTogc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMXB0
OyBjb2xvcjogYmxhY2s7ICI+IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9
Imh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmVsaXhpci5ib290bGluLmNvbSUyRmxpbnV4JTJGbGF0ZXN0JTJGc291cmNlJTJG
bW0lMkZzbGFiLmMlMjNMNDAyNiZhbXA7ZGF0YT0wMiU3QzAxJTdDRGF2aWQxLlpob3UlNDBhbWQu
Y29tJTdDZmNhZTc3NDQ4OTU0NGEwMzNjMDYwOGQ3ZGM5NjlmMzElN0MzZGQ4OTYxZmU0ODg0ZTYw
OGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MjIwNDExNzk1MjQ2NTE3JmFtcDtzZGF0YT03
eGolMkZPTEV0YjdIemdTZ2pSJTJGd3hqUGRoaW1ZT1RIQVI4d0IwZCUyRktiSkRNJTNEJmFtcDty
ZXNlcnZlZD0wIiBvcmlnaW5hbHNyYz0iaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
bGF0ZXN0L3NvdXJjZS9tbS9zbGFiLmMjTDQwMjYiIHNoYXNoPSJKdDlkWHBZb09sSiYjNDM7NHBa
RDNTVS9jNW45MXNRaUM2d3JwMm9mcEFNVDVHS2thMkpGNmpHQTB5UFpVT1dCMmkvdDhoYW4mIzQz
O0FjMVcvUlFEako5cWcwZnJvRWFiUWpudWVVU2ZNR0Q2MEZkMDNSaDdNVDhiZWlQQzI2a1MwRkpq
Wnp5eTg3WWQ2OHd6ejhjJiM0MztOa0o4UFdPTUI5V1B5NURHNXJ1RU1oQWRrVDBaQTQ9IiBtb3ot
ZG8tbm90LXNlbmQ9InRydWUiPmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVz
dC9zb3VyY2UvbW0vc2xhYi5jI0w0MDI2PC9hPjxicj4NCiAgICAgICAgICAgIDxicj4NCiAgICAg
ICAgICA8L2Rpdj4NCiAgICAgICAgICA8ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImRpcmVjdGlvbjog
bHRyOyBtYXJnaW46IDA7IHBhZGRpbmc6IDA7DQogICAgICAgICAgICBmb250LWZhbWlseTogc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxMXB0OyBjb2xvcjogYmxhY2s7ICI+DQogICAgICAgICAgICBU
aGlzIGlzIGFub3RoZXIgZXhhbXBsZSBvZiB0aGUgdXNhZ2Ugb2YmbmJzcDsgY29uZF9zY2hlZC48
L2Rpdj4NCiAgICAgICAgPC9ibG9ja3F1b3RlPg0KICAgICAgICA8YnI+DQogICAgICAgIFllcywg
YW5kIHRoYXQgaXMgYWxzbyBhIGdvb2QgZXhhbXBsZSBvZiB3aGF0IEkgbWVhbiBoZXJlOjxicj4N
CiAgICAgICAgPGJyPg0KICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4NCiAgICAgICAg
ICA8cHJlPgk8c3BhbiBjbGFzcz0iayI+aWY8L3NwYW4+IDxzcGFuIGNsYXNzPSJwIj4oPC9zcGFu
PjxzcGFuIGNsYXNzPSJvIj4hPC9zcGFuPjxzcGFuIGNsYXNzPSJuIj48YSBocmVmPSJodHRwczov
L25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYl
MkZlbGl4aXIuYm9vdGxpbi5jb20lMkZsaW51eCUyRmxhdGVzdCUyRmlkZW50JTJGbXV0ZXhfdHJ5
bG9jayZhbXA7ZGF0YT0wMiU3QzAxJTdDRGF2aWQxLlpob3UlNDBhbWQuY29tJTdDZmNhZTc3NDQ4
OTU0NGEwMzNjMDYwOGQ3ZGM5NjlmMzElN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgz
ZCU3QzAlN0MwJTdDNjM3MjIwNDExNzk1MjQ2NTE3JmFtcDtzZGF0YT1YQUNBJTJCZ3BCa0pFZ1B2
YTljN1dmNkNhMWJBT3JOYVhBUmYlMkI0emUxTXF5dyUzRCZhbXA7cmVzZXJ2ZWQ9MCIgb3JpZ2lu
YWxzcmM9Imh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9pZGVudC9tdXRl
eF90cnlsb2NrIiBzaGFzaD0ibnFYRXpCT0smIzQzO3pKNldlMUNSbkcvU3JVYnRoOW1sRTZIR0N1
ODM5UmNpRWdQd3R5UWJIclNpSXhlNTZHOHRFRyYjNDM7cFFxb3RHRUFQR2dic0pFcTdPNjhOYTVv
bWN5SGpLanduaGx6VUNYT1ZoOFYmIzQzO0NUc3ZtdFdNOE53U0wvV1o0Y1FJSlUyMm1kU3RML1dw
dUhobXByNHZZZU1FZ2paa1pzUGx4VUpVejd5czhrPSIgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj5t
dXRleF90cnlsb2NrPC9hPjwvc3Bhbj48c3BhbiBjbGFzcz0icCI+KDwvc3Bhbj48c3BhbiBjbGFz
cz0ibyI+JmFtcDs8L3NwYW4+PHNwYW4gY2xhc3M9Im4iPjxhIGhyZWY9Imh0dHBzOi8vbmFtMTEu
c2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmVsaXhp
ci5ib290bGluLmNvbSUyRmxpbnV4JTJGbGF0ZXN0JTJGaWRlbnQlMkZzbGFiX211dGV4JmFtcDtk
YXRhPTAyJTdDMDElN0NEYXZpZDEuWmhvdSU0MGFtZC5jb20lN0NmY2FlNzc0NDg5NTQ0YTAzM2Mw
NjA4ZDdkYzk2OWYzMSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAl
N0M2MzcyMjA0MTE3OTUyNTY1MTImYW1wO3NkYXRhPXo5dUFacmlTNDZoQlh1WWVWYVlrQVdiJTJC
UExZd0xjQ3JLJTJCV2E0RFJPMHp3JTNEJmFtcDtyZXNlcnZlZD0wIiBvcmlnaW5hbHNyYz0iaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L2lkZW50L3NsYWJfbXV0ZXgiIHNo
YXNoPSJHUkJYaXA3Z0JwaTlla0hESjVvQlcmIzQzO3RxNzVxUlIwdk14MCYjNDM7bk42JiM0Mzt1
bGRUa0ZHSTQ4Zy95NmVsY0VPYzhKZFJKbWJWZ1kveXNWVE9lbVIvVlpiSnhxaThWemFZMjZqWXN2
SVFvMlp4OG5mbWM5azN5NVJ0VEZraFliTTRaRHVqL2M2b1hEVEsyWEE0cm16bzlKdHZDL0RSbHRN
NXBWWk50NUh4WUNFeWNNWW89IiBtb3otZG8tbm90LXNlbmQ9InRydWUiPnNsYWJfbXV0ZXg8L2E+
PC9zcGFuPjxzcGFuIGNsYXNzPSJwIj4pKTwvc3Bhbj4NCgkJPHNwYW4gY2xhc3M9ImNtIj4vKiBH
aXZlIHVwLiBTZXR1cCB0aGUgbmV4dCBpdGVyYXRpb24uICovPC9zcGFuPg0KCQk8c3BhbiBjbGFz
cz0iayI+Z290bzwvc3Bhbj4gPHNwYW4gY2xhc3M9Im4iPm91dDwvc3Bhbj48c3BhbiBjbGFzcz0i
cCI+Ozwvc3Bhbj48L3ByZT4NCiAgICAgICAgPC9ibG9ja3F1b3RlPg0KICAgICAgICA8YnI+DQog
ICAgICAgIElmIHRoZSBmdW5jdGlvbiBjYW4ndCBhY3F1aXJlIHRoZSBsb2NrIGltbWVkaWF0ZWx5
IGl0IGdpdmVzIHVwDQogICAgICAgIGFuZCB3YWl0cyBmb3IgdGhlIG5leHQgaXRlcmF0aW9uLjxi
cj4NCiAgICAgICAgPGJyPg0KICAgICAgICBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciBpZiB3
ZSBkbyB0aGlzIGluIFRUTSBhcyB3ZWxsIGlmIHdlDQogICAgICAgIHNwZW5kIHRvIG11Y2ggdGlt
ZSBjbGVhbmluZyB1cCBvbGQgQk9zLjxicj4NCiAgICAgICAgPGJyPg0KICAgICAgICBPbiB0aGUg
b3RoZXIgaGFuZCB5b3UgYXJlIHJpZ2h0IHRoYXQgY29uZF9yZXNjaGVkKCkgaGFzIHRoZQ0KICAg
ICAgICBhZHZhbnRhZ2UgdGhhdCB3ZSBjb3VsZCBzcGVuZCBtb3JlIHRpbWUgb24gY2xlYW5pbmcg
dXAgb2xkIEJPcw0KICAgICAgICBpZiB0aGVyZSBpcyBub3RoaW5nIGVsc2UgZm9yIHRoZSBDUFUg
VE9ETy48YnI+DQogICAgICAgIDxicj4NCiAgICAgICAgUmVnYXJkcyw8YnI+DQogICAgICAgIENo
cmlzdGlhbi48YnI+DQogICAgICAgIDxicj4NCiAgICAgICAgQW0gMDkuMDQuMjAgdW0gMTY6MjQg
c2NocmllYiBQYW4sIFhpbmh1aTo8YnI+DQogICAgICA8L2Rpdj4NCiAgICAgIDxibG9ja3F1b3Rl
IHR5cGU9ImNpdGUiIGNpdGU9Im1pZDpCTDBQUjEyTUIyNTQ3QkY2MDlGMjFDNDhCMTdBNDAyQTA4
N0MxMEBCTDBQUjEyTUIyNTQ3Lm5hbXByZDEyLnByb2Qub3V0bG9vay5jb20iPg0KICAgICAgICA8
ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyBtYXJnaW46IDA7IHBhZGRpbmc6
IDA7DQogICAgICAgICAgZm9udC1mYW1pbHk6IHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsg
Y29sb3I6IGJsYWNrOyAiPiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJo
dHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZlbGl4aXIuYm9vdGxpbi5jb20lMkZsaW51eCUyRmxhdGVzdCUyRnNvdXJjZSUyRm1t
JTJGc2xhYi5jJTIzTDQwMjYmYW1wO2RhdGE9MDIlN0MwMSU3Q0RhdmlkMS5aaG91JTQwYW1kLmNv
bSU3Q2ZjYWU3NzQ0ODk1NDRhMDMzYzA2MDhkN2RjOTY5ZjMxJTdDM2RkODk2MWZlNDg4NGU2MDhl
MTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzIyMDQxMTc5NTI1NjUxMiZhbXA7c2RhdGE9Mmw2
eW5oR25RNVZRejVjdk0xYWZhWnpUYmhUbVplZnZjdUdYbjVSaCUyRkw0JTNEJmFtcDtyZXNlcnZl
ZD0wIiBvcmlnaW5hbHNyYz0iaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0
L3NvdXJjZS9tbS9zbGFiLmMjTDQwMjYiIHNoYXNoPSJ4SGJhVEhMa2NPZklBaE50VVROVW41YTYy
amNXSm5uR2dEZHpwdFJiSFgzJiM0MztoR0xGeGxWQzRjL2dYYXRFTzYzSUtsZUZiZW9xSXJEdzZI
U0V1VTRHRXhkSFpGNldjcGJRcDJsVU5hSzFyNDVETW01YWRTQXV6Y0Z2aWdycnh3JiM0MzsyZjdI
NWhDeGNDZXpmcmMwUWxrSDMmIzQzOzZndTY0b3QwbEhCSUFFWWp5aXdoeGc9IiBtb3otZG8tbm90
LXNlbmQ9InRydWUiPmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3Vy
Y2UvbW0vc2xhYi5jI0w0MDI2PC9hPjxicj4NCiAgICAgICAgICA8YnI+DQogICAgICAgIDwvZGl2
Pg0KICAgICAgICA8ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyBtYXJnaW46
IDA7IHBhZGRpbmc6IDA7DQogICAgICAgICAgZm9udC1mYW1pbHk6IHNhbnMtc2VyaWY7IGZvbnQt
c2l6ZTogMTFwdDsgY29sb3I6IGJsYWNrOyAiPg0KICAgICAgICAgIFRoaXMgaXMgYW5vdGhlciBl
eGFtcGxlIG9mIHRoZSB1c2FnZSBvZiZuYnNwOyBjb25kX3NjaGVkLjwvZGl2Pg0KICAgICAgICA8
aHIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4N
CiAgICAgICAgPGRpdiBpZD0iZGl2UnBseUZ3ZE1zZyIgZGlyPSJsdHIiPjxmb250IHN0eWxlPSJm
b250LXNpemU6MTFwdCIgZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgY29sb3I9IiMwMDAwMDAi
PjxiPkZyb206PC9iPiBQYW4sDQogICAgICAgICAgICBYaW5odWkgPGEgY2xhc3M9Im1vei10eHQt
bGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOlhpbmh1aS5QYW5AYW1kLmNvbSIgbW96LWRvLW5v
dC1zZW5kPSJ0cnVlIj4mbHQ7WGluaHVpLlBhbkBhbWQuY29tJmd0OzwvYT48YnI+DQogICAgICAg
ICAgICA8Yj5TZW50OjwvYj4gVGh1cnNkYXksIEFwcmlsIDksIDIwMjAgMTA6MTE6MDggUE08YnI+
DQogICAgICAgICAgICA8Yj5Ubzo8L2I+IEx1Y2FzIFN0YWNoIDxhIGNsYXNzPSJtb3otdHh0LWxp
bmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpsLnN0YWNoQHBlbmd1dHJvbml4LmRlIiBtb3otZG8t
bm90LXNlbmQ9InRydWUiPiZsdDtsLnN0YWNoQHBlbmd1dHJvbml4LmRlJmd0OzwvYT47DQogICAg
ICAgICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmciIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+YW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc8L2E+IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZj
MjM5NkUiIGhyZWY9Im1haWx0bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyIgbW96LWRv
LW5vdC1zZW5kPSJ0cnVlIj4mbHQ7YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcmZ3Q7PC9h
PjsNCiAgICAgICAgICAgIEtvZW5pZywgQ2hyaXN0aWFuIDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9Im1haWx0bzpDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20iIG1vei1kby1u
b3Qtc2VuZD0idHJ1ZSI+Jmx0O0NocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbSZndDs8L2E+PGJyPg0K
ICAgICAgICAgICAgPGI+Q2M6PC9iPiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVk
IiBocmVmPSJtYWlsdG86ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyIgbW96LWRvLW5v
dC1zZW5kPSJ0cnVlIj5kcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPC9hPg0KICAgICAg
ICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmciIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+Jmx0O2Ry
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcmZ3Q7PC9hPjxicj4NCiAgICAgICAgICAgIDxi
PlN1YmplY3Q6PC9iPiBSZTogW1BBVENIXSBkcm0vdHRtOiBTY2hlZHVsZSBvdXQgaWYgcG9zc2li
ZQ0KICAgICAgICAgICAgaW4gYm8gZGVsYXllZCBkZWxldGUgd29ya2VyPC9mb250Pg0KICAgICAg
ICAgIDxkaXY+Jm5ic3A7PC9kaXY+DQogICAgICAgIDwvZGl2Pg0KICAgICAgICA8ZGl2Pg0KICAg
ICAgICAgIDxkaXYgZGlyPSJhdXRvIiBzdHlsZT0iZGlyZWN0aW9uOmx0cjsgbWFyZ2luOjA7IHBh
ZGRpbmc6MDsNCiAgICAgICAgICAgIGZvbnQtZmFtaWx5OnNhbnMtc2VyaWY7IGZvbnQtc2l6ZTox
MXB0OyBjb2xvcjpibGFjayI+IEkNCiAgICAgICAgICAgIHRoaW5rIGl0IGRvZXNuJ3QgbWF0dGVy
IGlmIHdvcmtpdGVtIHNjaGVkdWxlIG91dC4gRXZlbiB3ZQ0KICAgICAgICAgICAgZGlkIG5vdCBz
Y2hlZHVsZSBvdXQsIHRoZSB3b3JrcXVldWUgaXRzZWxmIHdpbGwgc2NoZWR1bGUgb3V0DQogICAg
ICAgICAgICBsYXRlci48YnI+DQogICAgICAgICAgPC9kaXY+DQogICAgICAgICAgPGRpdiBkaXI9
ImF1dG8iIHN0eWxlPSJkaXJlY3Rpb246bHRyOyBtYXJnaW46MDsgcGFkZGluZzowOw0KICAgICAg
ICAgICAgZm9udC1mYW1pbHk6c2Fucy1zZXJpZjsgZm9udC1zaXplOjExcHQ7IGNvbG9yOmJsYWNr
Ij4gU28gaXQNCiAgICAgICAgICAgIGRpZCBub3QgYnJlYWsgYW55dGhpbmcgd2l0aCB0aGlzIHBh
dGNoIEkgdGhpbmsuPC9kaXY+DQogICAgICAgICAgPGhyIHRhYmluZGV4PSItMSIgc3R5bGU9ImRp
c3BsYXk6aW5saW5lLWJsb2NrOyB3aWR0aDo5OCUiPg0KICAgICAgICAgIDxkaXYgaWQ9InhfZGl2
UnBseUZ3ZE1zZyIgZGlyPSJsdHIiPjxmb250IHN0eWxlPSJmb250LXNpemU6MTFwdCIgZmFjZT0i
Q2FsaWJyaSwgc2Fucy1zZXJpZiIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiBQYW4sIFhp
bmh1aSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86WGluaHVp
LlBhbkBhbWQuY29tIiBtb3otZG8tbm90LXNlbmQ9InRydWUiPiZsdDtYaW5odWkuUGFuQGFtZC5j
b20mZ3Q7PC9hPjxicj4NCiAgICAgICAgICAgICAgPGI+U2VudDo8L2I+IFRodXJzZGF5LCBBcHJp
bCA5LCAyMDIwIDEwOjA3OjA5IFBNPGJyPg0KICAgICAgICAgICAgICA8Yj5Ubzo8L2I+IEx1Y2Fz
IFN0YWNoIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpsLnN0
YWNoQHBlbmd1dHJvbml4LmRlIiBtb3otZG8tbm90LXNlbmQ9InRydWUiPiZsdDtsLnN0YWNoQHBl
bmd1dHJvbml4LmRlJmd0OzwvYT47DQogICAgICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxp
bmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZyIgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj5hbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzwv
YT4NCiAgICAgICAgICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0i
bWFpbHRvOmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiBtb3otZG8tbm90LXNlbmQ9InRy
dWUiPiZsdDthbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyZndDs8L2E+Ow0KICAgICAgICAg
ICAgICBLb2VuaWcsIENocmlzdGlhbiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBo
cmVmPSJtYWlsdG86Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tIiBtb3otZG8tbm90LXNlbmQ9InRy
dWUiPiZsdDtDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20mZ3Q7PC9hPjxicj4NCiAgICAgICAgICAg
ICAgPGI+Q2M6PC9iPiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJt
YWlsdG86ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyIgbW96LWRvLW5vdC1zZW5kPSJ0
cnVlIj5kcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPC9hPg0KICAgICAgICAgICAgICA8
YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86ZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZyIgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj4mbHQ7ZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyZndDs8L2E+PGJyPg0KICAgICAgICAgICAgICA8Yj5TdWJq
ZWN0OjwvYj4gUmU6IFtQQVRDSF0gZHJtL3R0bTogU2NoZWR1bGUgb3V0IGlmDQogICAgICAgICAg
ICAgIHBvc3NpYmUgaW4gYm8gZGVsYXllZCBkZWxldGUgd29ya2VyPC9mb250Pg0KICAgICAgICAg
ICAgPGRpdj4mbmJzcDs8L2Rpdj4NCiAgICAgICAgICA8L2Rpdj4NCiAgICAgICAgICA8ZGl2Pg0K
ICAgICAgICAgICAgPGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJkaXJlY3Rpb246bHRyOyBtYXJnaW46
MDsgcGFkZGluZzowOw0KICAgICAgICAgICAgICBmb250LWZhbWlseTpzYW5zLXNlcmlmOyBmb250
LXNpemU6MTFwdDsgY29sb3I6YmxhY2siPiBXaHkNCiAgICAgICAgICAgICAgd2UgYnJlYWsgb3V0
IHRoZSBsb29wcyB3aGVuIHRoZXJlIGFyZSBwZW5kaW5nIGJvcyB0byBiZQ0KICAgICAgICAgICAg
ICByZWxlYXNlZD88YnI+DQogICAgICAgICAgICAgIDxicj4NCiAgICAgICAgICAgIDwvZGl2Pg0K
ICAgICAgICAgICAgPGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJkaXJlY3Rpb246bHRyOyBtYXJnaW46
MDsgcGFkZGluZzowOw0KICAgICAgICAgICAgICBmb250LWZhbWlseTpzYW5zLXNlcmlmOyBmb250
LXNpemU6MTFwdDsgY29sb3I6YmxhY2siPiBBbmQNCiAgICAgICAgICAgICAgSSBqdXN0IGNoZWNr
ZWQgdGhlIHByb2Nlc3Nfb25lX3dvcmsuIFJpZ2h0IGFmdGVyIHRoZSB3b3JrDQogICAgICAgICAg
ICAgIGl0ZW0gY2FsbGJhY2sgaXMgY2FsbGVkLCZuYnNwOyB0aGUgd29ya3F1ZXVlIGl0c2VsZiB3
aWxsIGNhbGwNCiAgICAgICAgICAgICAgY29uZF9yZXNjaGVkLiBTbyBJIHRoaW5rIDwvZGl2Pg0K
ICAgICAgICAgICAgPGhyIHRhYmluZGV4PSItMSIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2Nr
OyB3aWR0aDo5OCUiPg0KICAgICAgICAgICAgPGRpdiBpZD0ieF94X2RpdlJwbHlGd2RNc2ciIGRp
cj0ibHRyIj48Zm9udCBzdHlsZT0iZm9udC1zaXplOjExcHQiIGZhY2U9IkNhbGlicmksIHNhbnMt
c2VyaWYiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gS29lbmlnLCBDaHJpc3RpYW4gPGEg
Y2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOkNocmlzdGlhbi5Lb2Vu
aWdAYW1kLmNvbSIgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj4mbHQ7Q2hyaXN0aWFuLktvZW5pZ0Bh
bWQuY29tJmd0OzwvYT48YnI+DQogICAgICAgICAgICAgICAgPGI+U2VudDo8L2I+IFRodXJzZGF5
LCBBcHJpbCA5LCAyMDIwIDk6Mzg6MjQgUE08YnI+DQogICAgICAgICAgICAgICAgPGI+VG86PC9i
PiBMdWNhcyBTdGFjaCA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWls
dG86bC5zdGFjaEBwZW5ndXRyb25peC5kZSIgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj4mbHQ7bC5z
dGFjaEBwZW5ndXRyb25peC5kZSZndDs8L2E+Ow0KICAgICAgICAgICAgICAgIFBhbiwgWGluaHVp
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpYaW5odWkuUGFu
QGFtZC5jb20iIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+Jmx0O1hpbmh1aS5QYW5AYW1kLmNvbSZn
dDs8L2E+Ow0KICAgICAgICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0
ZWQiIGhyZWY9Im1haWx0bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyIgbW96LWRvLW5v
dC1zZW5kPSJ0cnVlIj5hbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzwvYT4NCiAgICAgICAg
ICAgICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86YW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmciIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+Jmx0O2Ft
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnJmd0OzwvYT48YnI+DQogICAgICAgICAgICAgICAg
PGI+Q2M6PC9iPiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWls
dG86ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyIgbW96LWRvLW5vdC1zZW5kPSJ0cnVl
Ij5kcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPC9hPg0KICAgICAgICAgICAgICAgIDxh
IGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnIiBtb3otZG8tbm90LXNlbmQ9InRydWUiPiZsdDtkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnJmd0OzwvYT48YnI+DQogICAgICAgICAgICAgICAgPGI+U3Vi
amVjdDo8L2I+IFJlOiBbUEFUQ0hdIGRybS90dG06IFNjaGVkdWxlIG91dCBpZg0KICAgICAgICAg
ICAgICAgIHBvc3NpYmUgaW4gYm8gZGVsYXllZCBkZWxldGUgd29ya2VyPC9mb250Pg0KICAgICAg
ICAgICAgICA8ZGl2PiZuYnNwOzwvZGl2Pg0KICAgICAgICAgICAgPC9kaXY+DQogICAgICAgICAg
ICA8ZGl2IGNsYXNzPSJ4X3hfQm9keUZyYWdtZW50Ij48Zm9udCBzaXplPSIyIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExcHQiPg0KICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ieF94X1Bs
YWluVGV4dCI+QW0gMDkuMDQuMjAgdW0gMTU6MjUNCiAgICAgICAgICAgICAgICAgICAgc2Nocmll
YiBMdWNhcyBTdGFjaDo8YnI+DQogICAgICAgICAgICAgICAgICAgICZndDsgQW0gRG9ubmVyc3Rh
ZywgZGVuIDA5LjA0LjIwMjAsIDE0OjM1ICYjNDM7MDIwMA0KICAgICAgICAgICAgICAgICAgICBz
Y2hyaWViIENocmlzdGlhbiBLw7ZuaWc6PGJyPg0KICAgICAgICAgICAgICAgICAgICAmZ3Q7Jmd0
OyBBbSAwOS4wNC4yMCB1bSAwMzozMSBzY2hyaWViIHhpbmh1aSBwYW46PGJyPg0KICAgICAgICAg
ICAgICAgICAgICAmZ3Q7Jmd0OyZndDsgVGhlIGRlbGF5ZWQgZGVsZXRlIGxpc3QgaXMgcGVyIGRl
dmljZQ0KICAgICAgICAgICAgICAgICAgICB3aGljaCBtaWdodCBiZSB2ZXJ5IGh1Z2UuIEFuZCBp
bjxicj4NCiAgICAgICAgICAgICAgICAgICAgJmd0OyZndDsmZ3Q7IGEgaGVhdnkgd29ya2xvYWQg
dGVzdCwgdGhlIGxpc3QgbWlnaHQNCiAgICAgICAgICAgICAgICAgICAgYWx3YXlzIG5vdCBiZSBl
bXB0eS4gVGhhdCB3aWxsPGJyPg0KICAgICAgICAgICAgICAgICAgICAmZ3Q7Jmd0OyZndDsgdHJp
Z2dlciBhbnkgUkNVIHN0YWxsIHdhcm5pbmdzIG9yDQogICAgICAgICAgICAgICAgICAgIHNvZnRs
b2NrdXBzIGluIG5vbi1wcmVlbXB0aWJsZSBrZXJuZWxzPGJyPg0KICAgICAgICAgICAgICAgICAg
ICAmZ3Q7Jmd0OyZndDsgTGV0cyBkbyBzY2hlZHVsZSBvdXQgaWYgcG9zc2libGUgaW4NCiAgICAg
ICAgICAgICAgICAgICAgdGhhdCBjYXNlLjxicj4NCiAgICAgICAgICAgICAgICAgICAgJmd0OyZn
dDsgTWhtLCBJJ20gbm90IHN1cmUgaWYgdGhhdCBpcyBhY3R1YWxseQ0KICAgICAgICAgICAgICAg
ICAgICBhbGxvd2VkLiBUaGlzIGlzIGNhbGxlZCBmcm9tIGE8YnI+DQogICAgICAgICAgICAgICAg
ICAgICZndDsmZ3Q7IHdvcmsgaXRlbSBhbmQgdGhvc2UgYXJlIG5vdCByZWFsbHkgc3VwcG9zZWQN
CiAgICAgICAgICAgICAgICAgICAgdG8gYmUgc2NoZWR1bGVkIGF3YXkuPGJyPg0KICAgICAgICAg
ICAgICAgICAgICAmZ3Q7IEh1aD8gV29ya2l0ZW1zIGNhbiBzY2hlZHVsZSBvdXQganVzdCBmaW5l
LA0KICAgICAgICAgICAgICAgICAgICBvdGhlcndpc2UgdGhleSB3b3VsZCBiZTxicj4NCiAgICAg
ICAgICAgICAgICAgICAgJmd0OyBob3JyaWJseSBicm9rZW4gd2hlbiBpdCBjb21lcyB0byBzbGVl
cGluZw0KICAgICAgICAgICAgICAgICAgICBsb2Nrcy48YnI+DQogICAgICAgICAgICAgICAgICAg
IDxicj4NCiAgICAgICAgICAgICAgICAgICAgTGV0IG1lIHJlZmluZSB0aGUgc2VudGVuY2U6IFdv
cmsgaXRlbXMgYXJlIG5vdA0KICAgICAgICAgICAgICAgICAgICByZWFsbHkgc3VwcG9zZWQgdG8g
YmUgPGJyPg0KICAgICAgICAgICAgICAgICAgICBzY2hlZHVsZWQgcHVycG9zZWx5LiBFLmcuIHlv
dSBzaG91bGRuJ3QgY2FsbA0KICAgICAgICAgICAgICAgICAgICBzY2hlZHVsZSgpIG9yIDxicj4N
CiAgICAgICAgICAgICAgICAgICAgY29uZF9yZXNjaGVkKCkgbGlrZSBpbiB0aGUgY2FzZSBoZXJl
Ljxicj4NCiAgICAgICAgICAgICAgICAgICAgPGJyPg0KICAgICAgICAgICAgICAgICAgICBHZXR0
aW5nIHNjaGVkdWxlZCBhd2F5IGJlY2F1c2Ugd2Ugd2FpdCBmb3IgYSBsb2NrIGlzDQogICAgICAg
ICAgICAgICAgICAgIG9mIGNvdXJzZSBwZXJmZWN0bHkgPGJyPg0KICAgICAgICAgICAgICAgICAg
ICBmaW5lLjxicj4NCiAgICAgICAgICAgICAgICAgICAgPGJyPg0KICAgICAgICAgICAgICAgICAg
ICAmZ3Q7Jm5ic3A7Jm5ic3A7IFRoZSB3b3JrcXVldWUgY29kZTxicj4NCiAgICAgICAgICAgICAg
ICAgICAgJmd0OyBldmVuIGhhcyBtZWFzdXJlcyB0byBrZWVwIHRoZSB3b3JrcXVldWVzIGF0IHRo
ZQ0KICAgICAgICAgICAgICAgICAgICBleHBlY3RlZCBjb25jdXJyZW5jeTxicj4NCiAgICAgICAg
ICAgICAgICAgICAgJmd0OyBsZXZlbCBieSBzdGFydGluZyBvdGhlciB3b3JraXRlbXMgd2hlbiBv
bmUgb2YNCiAgICAgICAgICAgICAgICAgICAgdGhlbSBnb2VzIHRvIHNsZWVwLjxicj4NCiAgICAg
ICAgICAgICAgICAgICAgPGJyPg0KICAgICAgICAgICAgICAgICAgICBZZWFoLCBhbmQgZXhhY3Rs
eSB0aGF0J3Mgd2hhdCBJIHdvdWxkIHNheSB3ZSBzaG91bGQNCiAgICAgICAgICAgICAgICAgICAg
YXZvaWQgaGVyZSA6KTxicj4NCiAgICAgICAgICAgICAgICAgICAgPGJyPg0KICAgICAgICAgICAg
ICAgICAgICBJbiBvdGhlciB3b3JkcyB3b3JrIGl0ZW1zIGNhbiBiZSBzY2hlZHVsZWQgYXdheSwg
YnV0DQogICAgICAgICAgICAgICAgICAgIHRoZXkgc2hvdWxkIG5vdCBpZiA8YnI+DQogICAgICAg
ICAgICAgICAgICAgIG5vdCByZWFsbHkgbmVjZXNzYXJ5IChlLmcuIHdhaXRpbmcgZm9yIGEgbG9j
aykuPGJyPg0KICAgICAgICAgICAgICAgICAgICA8YnI+DQogICAgICAgICAgICAgICAgICAgIE90
aGVyd2lzZSBhcyB5b3Ugc2FpZCBuZXcgdGhyZWFkcyBmb3Igd29yayBpdGVtDQogICAgICAgICAg
ICAgICAgICAgIHByb2Nlc3NpbmcgYXJlIHN0YXJ0ZWQgPGJyPg0KICAgICAgICAgICAgICAgICAg
ICB1cCBhbmQgSSBkb24ndCB0aGluayB3ZSB3YW50IHRoYXQuPGJyPg0KICAgICAgICAgICAgICAg
ICAgICA8YnI+DQogICAgICAgICAgICAgICAgICAgIEp1c3QgcmV0dXJuaW5nIGZyb20gdGhlIHdv
cmsgaXRlbSBhbmQgd2FpdGluZyBmb3INCiAgICAgICAgICAgICAgICAgICAgdGhlIG5leHQgY3lj
bGUgaXMgbW9zdCA8YnI+DQogICAgICAgICAgICAgICAgICAgIGxpa2VseSB0aGUgYmV0dGVyIG9w
dGlvbi48YnI+DQogICAgICAgICAgICAgICAgICAgIDxicj4NCiAgICAgICAgICAgICAgICAgICAg
UmVnYXJkcyw8YnI+DQogICAgICAgICAgICAgICAgICAgIENocmlzdGlhbi48YnI+DQogICAgICAg
ICAgICAgICAgICAgIDxicj4NCiAgICAgICAgICAgICAgICAgICAgJmd0Ozxicj4NCiAgICAgICAg
ICAgICAgICAgICAgJmd0OyBSZWdhcmRzLDxicj4NCiAgICAgICAgICAgICAgICAgICAgJmd0OyBM
dWNhczxicj4NCiAgICAgICAgICAgICAgICAgICAgJmd0Ozxicj4NCiAgICAgICAgICAgICAgICAg
ICAgJmd0OyZndDsgTWF5YmUgcmF0aGVyIGNoYW5nZSB0aGUgd2hpbGUgaW50byB3aGlsZQ0KICAg
ICAgICAgICAgICAgICAgICAoIWxpc3RfZW1wdHkoJmFtcDtiZGV2LSZndDtkZGVzdHJveSk8YnI+
DQogICAgICAgICAgICAgICAgICAgICZndDsmZ3Q7ICZhbXA7JmFtcDsgIXNob3VsZF9yZXNjaGVk
dWxlKDApKS48YnI+DQogICAgICAgICAgICAgICAgICAgICZndDsmZ3Q7PGJyPg0KICAgICAgICAg
ICAgICAgICAgICAmZ3Q7Jmd0OyBDaHJpc3RpYW4uPGJyPg0KICAgICAgICAgICAgICAgICAgICAm
Z3Q7Jmd0Ozxicj4NCiAgICAgICAgICAgICAgICAgICAgJmd0OyZndDsmZ3Q7IFNpZ25lZC1vZmYt
Ynk6IHhpbmh1aSBwYW4gPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFp
bHRvOnhpbmh1aS5wYW5AYW1kLmNvbSIgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj4mbHQ7eGluaHVp
LnBhbkBhbWQuY29tJmd0OzwvYT48YnI+DQogICAgICAgICAgICAgICAgICAgICZndDsmZ3Q7Jmd0
OyAtLS08YnI+DQogICAgICAgICAgICAgICAgICAgICZndDsmZ3Q7Jmd0OyZuYnNwOyZuYnNwOyZu
YnNwOyBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgMSAmIzQzOzxicj4NCiAgICAgICAg
ICAgICAgICAgICAgJmd0OyZndDsmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigmIzQzOyk8YnI+DQogICAgICAgICAgICAgICAgICAgICZndDsmZ3Q7Jmd0
Ozxicj4NCiAgICAgICAgICAgICAgICAgICAgJmd0OyZndDsmZ3Q7IGRpZmYgLS1naXQNCiAgICAg
ICAgICAgICAgICAgICAgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQogICAgICAgICAg
ICAgICAgICAgIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYzxicj4NCiAgICAgICAgICAg
ICAgICAgICAgJmd0OyZndDsmZ3Q7IGluZGV4IDllMDdjM2Y3NTE1Ni4uYjhkODUzY2FiMzNiIDEw
MDY0NDxicj4NCiAgICAgICAgICAgICAgICAgICAgJmd0OyZndDsmZ3Q7IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmM8YnI+DQogICAgICAgICAgICAgICAgICAgICZndDsmZ3Q7Jmd0
OyAmIzQzOyYjNDM7JiM0MzsgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jPGJyPg0KICAg
ICAgICAgICAgICAgICAgICAmZ3Q7Jmd0OyZndDsgQEAgLTU0MSw2ICYjNDM7NTQxLDcgQEAgc3Rh
dGljIGJvb2wNCiAgICAgICAgICAgICAgICAgICAgdHRtX2JvX2RlbGF5ZWRfZGVsZXRlKHN0cnVj
dCB0dG1fYm9fZGV2aWNlICpiZGV2LA0KICAgICAgICAgICAgICAgICAgICBib29sIHJlbW92ZV9h
bGwpPGJyPg0KICAgICAgICAgICAgICAgICAgICAmZ3Q7Jmd0OyZndDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgfTxicj4NCiAgICAgICAgICAgICAgICAgICAgJmd0OyZndDsmZ3Q7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IDxicj4NCiAgICAgICAgICAgICAgICAgICAgJmd0OyZndDsmZ3Q7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IHR0bV9ib19wdXQoYm8pOzxicj4NCiAgICAgICAgICAgICAgICAgICAgJmd0OyZn
dDsmZ3Q7ICYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IGNvbmRfcmVzY2hlZCgpOzxicj4NCiAgICAgICAgICAgICAgICAgICAg
Jmd0OyZndDsmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7DQogICAgICAgICAgICAgICAgICAgIHNw
aW5fbG9jaygmYW1wO2dsb2ItJmd0O2xydV9sb2NrKTs8YnI+DQogICAgICAgICAgICAgICAgICAg
ICZndDsmZ3Q7Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB9PGJyPg0KICAgICAg
ICAgICAgICAgICAgICAmZ3Q7Jmd0OyZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
bGlzdF9zcGxpY2VfdGFpbCgmYW1wO3JlbW92ZWQsDQogICAgICAgICAgICAgICAgICAgICZhbXA7
YmRldi0mZ3Q7ZGRlc3Ryb3kpOzxicj4NCiAgICAgICAgICAgICAgICAgICAgJmd0OyZndDsNCiAg
ICAgICAgICAgICAgICAgICAgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX188YnI+DQogICAgICAgICAgICAgICAgICAgICZndDsmZ3Q7IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3Q8YnI+DQogICAgICAgICAgICAgICAgICAgICZndDsmZ3Q7IDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzpkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnIiBtb3otZG8tbm90LXNlbmQ9InRydWUiPmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc8L2E+PGJyPg0KICAgICAgICAgICAgICAgICAgICAmZ3Q7Jmd0OyA8YSBocmVmPSJo
dHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZkcmkt
ZGV2ZWwmYW1wO2RhdGE9MDIlN0MwMSU3Q0RhdmlkMS5aaG91JTQwYW1kLmNvbSU3Q2ZjYWU3NzQ0
ODk1NDRhMDMzYzA2MDhkN2RjOTY5ZjMxJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4
M2QlN0MwJTdDMCU3QzYzNzIyMDQxMTc5NTI2NjUwMCZhbXA7c2RhdGE9VUdiUVRON3ZqSGhOUGlk
b2RXaFh4NHNTcVVRanRLcDRkYkNKY3p0ZjZaTSUzRCZhbXA7cmVzZXJ2ZWQ9MCIgb3JpZ2luYWxz
cmM9Imh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsIiBzaGFzaD0iZkdBbklrQzZSa0tDY3FXR202MGRKUzMvRGh6RE5tMEhWeWlYL0ZtRi9PaW9N
N2FFR3N0bUF1dFZMY213UjVtakZLaFZwVm1IcUV6VWJheTY3d1FMaUdtR1RkbExXbDRYNUQ4ZTZW
N1JVVkxSRTMvbXl6ZS84d0lzQWp4ek1vTS9JJiM0MztLcGgmIzQzO2dHbmNoaFRHJiM0MztUYm1v
TXMzSWFsUzZkcW9zU3U5dFRXb0RodzV3PSIgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj4NCmh0dHBz
Oi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUy
RiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmRyaS1kZXZl
bCZhbXA7YW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDMGE0
NzQ4NjY3NmE3NDcwMmYwNTQwOGQ3ZGM4OTgzOWMlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5
OTRlMTgzZCU3QzAlN0MwJTdDNjM3MjIwMzU1NTA0MTQ1ODY4JmFtcDthbXA7c2RhdGE9d2JSa1lC
UEk2bVl1WmpLQnRRTjNBR0xET3dxSmxXWTNYVXR3d1NpVVFIZyUzRCZhbXA7YW1wO3Jlc2VydmVk
PTA8L2E+PGJyPg0KICAgICAgICAgICAgICAgICAgICA8YnI+DQogICAgICAgICAgICAgICAgICA8
L2Rpdj4NCiAgICAgICAgICAgICAgICA8L3NwYW4+PC9mb250PjwvZGl2Pg0KICAgICAgICAgIDwv
ZGl2Pg0KICAgICAgICA8L2Rpdj4NCiAgICAgIDwvYmxvY2txdW90ZT4NCiAgICAgIDxicj4NCiAg
ICAgIDxicj4NCiAgICAgIDxmaWVsZHNldCBjbGFzcz0ibWltZUF0dGFjaG1lbnRIZWFkZXIiPjwv
ZmllbGRzZXQ+DQogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0DQo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWls
dG86ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyI+ZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzwvYT4NCjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0
dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUz
QSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmRyaS1k
ZXZlbCZhbXA7YW1wO2RhdGE9MDIlN0MwMSU3Q0RhdmlkMS5aaG91JTQwYW1kLmNvbSU3Q2ZjYWU3
NzQ0ODk1NDRhMDMzYzA2MDhkN2RjOTY5ZjMxJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0
ZTE4M2QlN0MwJTdDMCU3QzYzNzIyMDQxMTc5NTI4NjQ5MyZhbXA7YW1wO3NkYXRhPVNvRSUyRjhz
Zzl2Q2IwT3d4UEYlMkZQcEtMTFVLdWclMkZBaFpEeXl2RGlRYW1XcDQlM0QmYW1wO2FtcDtyZXNl
cnZlZD0wIj5odHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGlu
Zm8lMkZkcmktZGV2ZWwmYW1wO2FtcDtkYXRhPTAyJTdDMDElN0NEYXZpZDEuWmhvdSU0MGFtZC5j
b20lN0NmY2FlNzc0NDg5NTQ0YTAzM2MwNjA4ZDdkYzk2OWYzMSU3QzNkZDg5NjFmZTQ4ODRlNjA4
ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcyMjA0MTE3OTUyODY0OTMmYW1wO2FtcDtzZGF0
YT1Tb0UlMkY4c2c5dkNiME93eFBGJTJGUHBLTExVS3VnJTJGQWhaRHl5dkRpUWFtV3A0JTNEJmFt
cDthbXA7cmVzZXJ2ZWQ9MDwvYT4NCjwvcHJlPg0KICAgIDwvYmxvY2txdW90ZT4NCiAgPC9ib2R5
Pg0KPC9odG1sPg0K

--------------38306113F9BE6D77BDE07FEF--

--===============2026964898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2026964898==--
