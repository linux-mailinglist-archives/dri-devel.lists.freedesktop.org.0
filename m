Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285AA1A366B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 16:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020566EBD3;
	Thu,  9 Apr 2020 14:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31D16EBCF;
 Thu,  9 Apr 2020 14:59:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mimO9DXFlLqMHVRVWdLX3XkqOF394RV4MB+/zKVPfD9fbLMW1FQdTwelML0XtkHOBZZ2+qH6ZLgBS8lFBV8hBKlf1RXo5uIKPDODf+zdFcVOe5UOj7+ihFfAfyCDUFDGMGalQdodBTMQIZfYdB+B/ugZz0QX7yNCH/N4igXx5Wh/YxiK6gnaZTV/bPmJPQPz5nWIK16Z/oGRfyaajNZconQr7kbIje576d9OjW5z/CoQMLTG1/nLkPm2dKQlEC2MRRtPw/JExEkGT8OEwsdjQsYBCwT1mlopWeAF37wlv8ecS0nsMNZFNJSyGf/Aefqy+/Fd2zlUMPXwO37FTm/mjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZD7PGjivl3xtawGnHm7pfKNsRPjKtfFg61vOpse1dUc=;
 b=cWEcbnBV9pE7zbl+bUGhaqEoY/HgTLFq+z6nxuRZgPN1nuF1ur1EnVuFfEUPoF1t5n5tTfnURubgkz37UJFj1/MRhqsTc50vr/tHsl6zM8EMIvWxh31W1gqev+gpVN3gT8YVYmdPt9Rzo9osjfGANhjCoyYRpsDcI7rw71ESP7YpdgwSsJmcF+kn24rJ3ViQdXGRiI9Va98UR2aLQZhPP3Eeuly1GK68Nveze7qUZdzqSMIzTn2libtJtaFmzJWVPO32QU+ReuoHGT+47fbTQUffwn6j3kttibLsI5ojtfYAVDo+6LuWPvloRGwLgDTGx7RvBTekIO7gnZVK2DN9LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZD7PGjivl3xtawGnHm7pfKNsRPjKtfFg61vOpse1dUc=;
 b=kPAnbvjbpBp5AZTRY1l7tHzSHbuw73KYLcJtuUBwPvBFg+CF0LBAF1PlGurepXJvU0PGe3xwyLxNQeNRc8iSI7YYCjiXPMWQaMIoGyoraXvyvhoyKW8tqgKtOxPAtQ/LYn2vN4C0MwAAP7MeJM4NMdcMUIXYulxHASVRSuxdayA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3051.namprd12.prod.outlook.com (2603:10b6:5:119::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19; Thu, 9 Apr
 2020 14:59:30 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2%4]) with mapi id 15.20.2878.022; Thu, 9 Apr 2020
 14:59:30 +0000
Subject: Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed delete
 worker
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lucas Stach <l.stach@pengutronix.de>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20200409013148.4219-1-xinhui.pan@amd.com>
 <7ebd6025-a563-30d1-8c84-cb031bfef0c1@amd.com>
 <d80c89fe353a114df786e75563d434c496b8140d.camel@pengutronix.de>
 <8b634370-1771-4aa4-8725-74b5d807db4b@amd.com>
 <BL0PR12MB254767C8A1AFAE0D52685A1F87C10@BL0PR12MB2547.namprd12.prod.outlook.com>
 <BL0PR12MB254789981840471CD72EBFD487C10@BL0PR12MB2547.namprd12.prod.outlook.com>
 <BL0PR12MB2547BF609F21C48B17A402A087C10@BL0PR12MB2547.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <64928371-a0e1-be53-f650-a9a365a6b2af@amd.com>
Date: Thu, 9 Apr 2020 16:59:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <BL0PR12MB2547BF609F21C48B17A402A087C10@BL0PR12MB2547.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: AM5PR0201CA0007.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::17) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM5PR0201CA0007.eurprd02.prod.outlook.com (2603:10a6:203:3d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17 via Frontend
 Transport; Thu, 9 Apr 2020 14:59:28 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ecf9229-b287-4f02-d11e-08d7dc969ac1
X-MS-TrafficTypeDiagnostic: DM6PR12MB3051:|DM6PR12MB3051:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3051B8A2650C080002DDE7B283C10@DM6PR12MB3051.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(52116002)(53546011)(8936002)(2906002)(16526019)(30864003)(31686004)(316002)(4326008)(33964004)(2616005)(110136005)(81156014)(186003)(6486002)(45080400002)(66574012)(5660300002)(6666004)(966005)(86362001)(66476007)(478600001)(36756003)(81166007)(31696002)(66946007)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /jCssFRQsHTKRFlFVbDJPMiaI8+UKS9Fb6mbe/uS6J5QoKxv9gZOd2labjmJ/hSvrFlDJ6XTWtkq/NzUxfnAViab8qgmaNpQT8HR6okPfEuYHDnakFriY/ZQl4TfED6pLJdUeBlWTTmGkQsCvaqd7YdWD13MSu1DTyCJ6vB9cdj3h5wNPdujGH/xdsiILk/8Zmqc24tzzZjdC0j7tOfFOTYzbpVvUJn09GqbQEuemnodvhsyQJiR6peCH9uKKItTvGEGlFhXAOMlvSyZZVQMF6lV0fWVnM7kUV5kWbzPb+4EACNqq1uNowvLqpvTIJaPPGgjZbXhFBGrhATRnMCX01xpwQImxSthgy2Y7KyGr80BY8dM2HqOKcRR5Ny5Mvxh2BXH2yyajRmuxWqKXNFCutasdo4KSDEPQ6z+lyjam33UKNOW1LP+zNc+HlYSXBVA3XB5mVczJi5thp7luTIyr9wfRcdFxKH6RNLGE0RdgHvU5uqYpIGSgZBG9VWGtU+hddOd0SHFUBivgfg12WSPIA==
X-MS-Exchange-AntiSpam-MessageData: C0+Mk3LwJvtNEsIkccbW5dp25HZPVdf0WKPeqR+qEhLE8/eNabo/tTojCzHuQOUNzM/dDuhZ74Lmd0Jiw1ci81NYGlI0wurUcXmoskQtM5UtkwiaEbGb/sjBv6DbD+4Lcm3vuAOTmKcCw2azFH+3mU2Q3d9Wde3cYzdTDT9aOaB9I1aRcqNc1ZG+UCHDkvIXkU3n6wIMzyARmb3h9PdCOg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecf9229-b287-4f02-d11e-08d7dc969ac1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 14:59:29.9725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjBoGTEDwym9T6f6wx+Yf4m1TgOnb06tLQPLkKd21T5N1KztX4Bw24uRkf943wb4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3051
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
Content-Type: multipart/mixed; boundary="===============1065654694=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1065654694==
Content-Type: multipart/alternative;
 boundary="------------31E295AB4B94C1AD5E9E81EE"
Content-Language: en-US

--------------31E295AB4B94C1AD5E9E81EE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

> Why we break out the loops when there are pending bos to be released?

We do this anyway if we can't acquire the necessary locks. Freeing 
already deleted BOs is just a very lazy background work.

> So it did not break anything with this patch I think.

Oh, the patch will certainly work. I'm just not sure if it's the ideal 
behavior.

> https://elixir.bootlin.com/linux/latest/source/mm/slab.c#L4026
>
> This is another example of the usage of  cond_sched.

Yes, and that is also a good example of what I mean here:

> 	if  (!mutex_trylock 
> <https://elixir.bootlin.com/linux/latest/ident/mutex_trylock>(&slab_mutex 
> <https://elixir.bootlin.com/linux/latest/ident/slab_mutex>))
> 		/* Give up. Setup the next iteration. */
> 		goto  out;

If the function can't acquire the lock immediately it gives up and waits 
for the next iteration.

I think it would be better if we do this in TTM as well if we spend to 
much time cleaning up old BOs.

On the other hand you are right that cond_resched() has the advantage 
that we could spend more time on cleaning up old BOs if there is nothing 
else for the CPU TODO.

Regards,
Christian.

Am 09.04.20 um 16:24 schrieb Pan, Xinhui:
> https://elixir.bootlin.com/linux/latest/source/mm/slab.c#L4026
>
> This is another example of the usage of  cond_sched.
> ------------------------------------------------------------------------
> *From:* Pan, Xinhui <Xinhui.Pan@amd.com>
> *Sent:* Thursday, April 9, 2020 10:11:08 PM
> *To:* Lucas Stach <l.stach@pengutronix.de>; 
> amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Koenig, 
> Christian <Christian.Koenig@amd.com>
> *Cc:* dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
> *Subject:* Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed 
> delete worker
> I think it doesn't matter if workitem schedule out. Even we did not 
> schedule out, the workqueue itself will schedule out later.
> So it did not break anything with this patch I think.
> ------------------------------------------------------------------------
> *From:* Pan, Xinhui <Xinhui.Pan@amd.com>
> *Sent:* Thursday, April 9, 2020 10:07:09 PM
> *To:* Lucas Stach <l.stach@pengutronix.de>; 
> amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Koenig, 
> Christian <Christian.Koenig@amd.com>
> *Cc:* dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
> *Subject:* Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed 
> delete worker
> Why we break out the loops when there are pending bos to be released?
>
> And I just checked the process_one_work. Right after the work item 
> callback is called,  the workqueue itself will call cond_resched. So I 
> think
> ------------------------------------------------------------------------
> *From:* Koenig, Christian <Christian.Koenig@amd.com>
> *Sent:* Thursday, April 9, 2020 9:38:24 PM
> *To:* Lucas Stach <l.stach@pengutronix.de>; Pan, Xinhui 
> <Xinhui.Pan@amd.com>; amd-gfx@lists.freedesktop.org 
> <amd-gfx@lists.freedesktop.org>
> *Cc:* dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
> *Subject:* Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed 
> delete worker
> Am 09.04.20 um 15:25 schrieb Lucas Stach:
> > Am Donnerstag, den 09.04.2020, 14:35 +0200 schrieb Christian König:
> >> Am 09.04.20 um 03:31 schrieb xinhui pan:
> >>> The delayed delete list is per device which might be very huge. And in
> >>> a heavy workload test, the list might always not be empty. That will
> >>> trigger any RCU stall warnings or softlockups in non-preemptible 
> kernels
> >>> Lets do schedule out if possible in that case.
> >> Mhm, I'm not sure if that is actually allowed. This is called from a
> >> work item and those are not really supposed to be scheduled away.
> > Huh? Workitems can schedule out just fine, otherwise they would be
> > horribly broken when it comes to sleeping locks.
>
> Let me refine the sentence: Work items are not really supposed to be
> scheduled purposely. E.g. you shouldn't call schedule() or
> cond_resched() like in the case here.
>
> Getting scheduled away because we wait for a lock is of course perfectly
> fine.
>
> >   The workqueue code
> > even has measures to keep the workqueues at the expected concurrency
> > level by starting other workitems when one of them goes to sleep.
>
> Yeah, and exactly that's what I would say we should avoid here :)
>
> In other words work items can be scheduled away, but they should not if
> not really necessary (e.g. waiting for a lock).
>
> Otherwise as you said new threads for work item processing are started
> up and I don't think we want that.
>
> Just returning from the work item and waiting for the next cycle is most
> likely the better option.
>
> Regards,
> Christian.
>
> >
> > Regards,
> > Lucas
> >
> >> Maybe rather change the while into while (!list_empty(&bdev->ddestroy)
> >> && !should_reschedule(0)).
> >>
> >> Christian.
> >>
> >>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> >>> ---
> >>>    drivers/gpu/drm/ttm/ttm_bo.c | 1 +
> >>>    1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
> b/drivers/gpu/drm/ttm/ttm_bo.c
> >>> index 9e07c3f75156..b8d853cab33b 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> >>> @@ -541,6 +541,7 @@ static bool ttm_bo_delayed_delete(struct 
> ttm_bo_device *bdev, bool remove_all)
> >>>              }
> >>>
> >>>              ttm_bo_put(bo);
> >>> +           cond_resched();
> >>> spin_lock(&glob->lru_lock);
> >>>      }
> >>>      list_splice_tail(&removed, &bdev->ddestroy);
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C0a47486676a74702f05408d7dc89839c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637220355504145868&amp;sdata=wbRkYBPI6mYuZjKBtQN3AGLDOwqJlWY3XUtwwSiUQHg%3D&amp;reserved=0
>


--------------31E295AB4B94C1AD5E9E81EE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">
      <blockquote type="cite">
        Why we break out the loops when there are pending bos to be
        released?</blockquote>
      <br>
      We do this anyway if we can't acquire the necessary locks. Freeing
      already deleted BOs is just a very lazy background work.<br>
      <br>
      <blockquote type="cite">
        So it did not break anything with this patch I think.</blockquote>
      <br>
      Oh, the patch will certainly work. I'm just not sure if it's the
      ideal behavior.<br>
      <br>
      <blockquote type="cite">
        <div dir="auto" style="direction: ltr; margin: 0; padding: 0;
          font-family: sans-serif; font-size: 11pt; color: black; ">
          <a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/latest/source/mm/slab.c#L4026">https://elixir.bootlin.com/linux/latest/source/mm/slab.c#L4026</a><br>
          <br>
        </div>
        <div dir="auto" style="direction: ltr; margin: 0; padding: 0;
          font-family: sans-serif; font-size: 11pt; color: black; ">
          This is another example of the usage of&nbsp; cond_sched.</div>
      </blockquote>
      <br>
      Yes, and that is also a good example of what I mean here:<br>
      <br>
      <blockquote type="cite">
        <pre>	<span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="n"><a href="https://elixir.bootlin.com/linux/latest/ident/mutex_trylock">mutex_trylock</a></span><span class="p">(</span><span class="o">&amp;</span><span class="n"><a href="https://elixir.bootlin.com/linux/latest/ident/slab_mutex">slab_mutex</a></span><span class="p">))</span>
		<span class="cm">/* Give up. Setup the next iteration. */</span>
		<span class="k">goto</span> <span class="n">out</span><span class="p">;</span></pre>
      </blockquote>
      <br>
      If the function can't acquire the lock immediately it gives up and
      waits for the next iteration.<br>
      <br>
      I think it would be better if we do this in TTM as well if we
      spend to much time cleaning up old BOs.<br>
      <br>
      On the other hand you are right that cond_resched() has the
      advantage that we could spend more time on cleaning up old BOs if
      there is nothing else for the CPU TODO.<br>
      <br>
      Regards,<br>
      Christian.<br>
      <br>
      Am 09.04.20 um 16:24 schrieb Pan, Xinhui:<br>
    </div>
    <blockquote type="cite" cite="mid:BL0PR12MB2547BF609F21C48B17A402A087C10@BL0PR12MB2547.namprd12.prod.outlook.com">
      
      <div dir="auto" style="direction: ltr; margin: 0; padding: 0;
        font-family: sans-serif; font-size: 11pt; color: black; ">
        <a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/latest/source/mm/slab.c#L4026">https://elixir.bootlin.com/linux/latest/source/mm/slab.c#L4026</a><br>
        <br>
      </div>
      <div dir="auto" style="direction: ltr; margin: 0; padding: 0;
        font-family: sans-serif; font-size: 11pt; color: black; ">
        This is another example of the usage of&nbsp; cond_sched.</div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b> Pan,
          Xinhui <a class="moz-txt-link-rfc2396E" href="mailto:Xinhui.Pan@amd.com">&lt;Xinhui.Pan@amd.com&gt;</a><br>
          <b>Sent:</b> Thursday, April 9, 2020 10:11:08 PM<br>
          <b>To:</b> Lucas Stach <a class="moz-txt-link-rfc2396E" href="mailto:l.stach@pengutronix.de">&lt;l.stach@pengutronix.de&gt;</a>;
          <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a>; Koenig, Christian
          <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a><br>
          <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a><br>
          <b>Subject:</b> Re: [PATCH] drm/ttm: Schedule out if possibe
          in bo delayed delete worker</font>
        <div>&nbsp;</div>
      </div>
      <div>
        <div dir="auto" style="direction:ltr; margin:0; padding:0;
          font-family:sans-serif; font-size:11pt; color:black">
          I think it doesn't matter if workitem schedule out. Even we
          did not schedule out, the workqueue itself will schedule out
          later.<br>
        </div>
        <div dir="auto" style="direction:ltr; margin:0; padding:0;
          font-family:sans-serif; font-size:11pt; color:black">
          So it did not break anything with this patch I think.</div>
        <hr tabindex="-1" style="display:inline-block; width:98%">
        <div id="x_divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b> Pan,
            Xinhui <a class="moz-txt-link-rfc2396E" href="mailto:Xinhui.Pan@amd.com">&lt;Xinhui.Pan@amd.com&gt;</a><br>
            <b>Sent:</b> Thursday, April 9, 2020 10:07:09 PM<br>
            <b>To:</b> Lucas Stach <a class="moz-txt-link-rfc2396E" href="mailto:l.stach@pengutronix.de">&lt;l.stach@pengutronix.de&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a>; Koenig, Christian
            <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a><br>
            <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a><br>
            <b>Subject:</b> Re: [PATCH] drm/ttm: Schedule out if possibe
            in bo delayed delete worker</font>
          <div>&nbsp;</div>
        </div>
        <div>
          <div dir="auto" style="direction:ltr; margin:0; padding:0;
            font-family:sans-serif; font-size:11pt; color:black">
            Why we break out the loops when there are pending bos to be
            released?<br>
            <br>
          </div>
          <div dir="auto" style="direction:ltr; margin:0; padding:0;
            font-family:sans-serif; font-size:11pt; color:black">
            And I just checked the process_one_work. Right after the
            work item callback is called,&nbsp; the workqueue itself will
            call cond_resched. So I think
          </div>
          <hr tabindex="-1" style="display:inline-block; width:98%">
          <div id="x_x_divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b> Koenig, Christian
              <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a><br>
              <b>Sent:</b> Thursday, April 9, 2020 9:38:24 PM<br>
              <b>To:</b> Lucas Stach <a class="moz-txt-link-rfc2396E" href="mailto:l.stach@pengutronix.de">&lt;l.stach@pengutronix.de&gt;</a>;
              Pan, Xinhui <a class="moz-txt-link-rfc2396E" href="mailto:Xinhui.Pan@amd.com">&lt;Xinhui.Pan@amd.com&gt;</a>;
              <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
              <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
              <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
              <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a><br>
              <b>Subject:</b> Re: [PATCH] drm/ttm: Schedule out if
              possibe in bo delayed delete worker</font>
            <div>&nbsp;</div>
          </div>
          <div class="x_x_BodyFragment"><font size="2"><span style="font-size:11pt">
                <div class="x_x_PlainText">Am 09.04.20 um 15:25 schrieb
                  Lucas Stach:<br>
                  &gt; Am Donnerstag, den 09.04.2020, 14:35 &#43;0200
                  schrieb Christian König:<br>
                  &gt;&gt; Am 09.04.20 um 03:31 schrieb xinhui pan:<br>
                  &gt;&gt;&gt; The delayed delete list is per device
                  which might be very huge. And in<br>
                  &gt;&gt;&gt; a heavy workload test, the list might
                  always not be empty. That will<br>
                  &gt;&gt;&gt; trigger any RCU stall warnings or
                  softlockups in non-preemptible kernels<br>
                  &gt;&gt;&gt; Lets do schedule out if possible in that
                  case.<br>
                  &gt;&gt; Mhm, I'm not sure if that is actually
                  allowed. This is called from a<br>
                  &gt;&gt; work item and those are not really supposed
                  to be scheduled away.<br>
                  &gt; Huh? Workitems can schedule out just fine,
                  otherwise they would be<br>
                  &gt; horribly broken when it comes to sleeping locks.<br>
                  <br>
                  Let me refine the sentence: Work items are not really
                  supposed to be <br>
                  scheduled purposely. E.g. you shouldn't call
                  schedule() or <br>
                  cond_resched() like in the case here.<br>
                  <br>
                  Getting scheduled away because we wait for a lock is
                  of course perfectly <br>
                  fine.<br>
                  <br>
                  &gt;&nbsp;&nbsp; The workqueue code<br>
                  &gt; even has measures to keep the workqueues at the
                  expected concurrency<br>
                  &gt; level by starting other workitems when one of
                  them goes to sleep.<br>
                  <br>
                  Yeah, and exactly that's what I would say we should
                  avoid here :)<br>
                  <br>
                  In other words work items can be scheduled away, but
                  they should not if <br>
                  not really necessary (e.g. waiting for a lock).<br>
                  <br>
                  Otherwise as you said new threads for work item
                  processing are started <br>
                  up and I don't think we want that.<br>
                  <br>
                  Just returning from the work item and waiting for the
                  next cycle is most <br>
                  likely the better option.<br>
                  <br>
                  Regards,<br>
                  Christian.<br>
                  <br>
                  &gt;<br>
                  &gt; Regards,<br>
                  &gt; Lucas<br>
                  &gt;<br>
                  &gt;&gt; Maybe rather change the while into while
                  (!list_empty(&amp;bdev-&gt;ddestroy)<br>
                  &gt;&gt; &amp;&amp; !should_reschedule(0)).<br>
                  &gt;&gt;<br>
                  &gt;&gt; Christian.<br>
                  &gt;&gt;<br>
                  &gt;&gt;&gt; Signed-off-by: xinhui pan
                  <a class="moz-txt-link-rfc2396E" href="mailto:xinhui.pan@amd.com">&lt;xinhui.pan@amd.com&gt;</a><br>
                  &gt;&gt;&gt; ---<br>
                  &gt;&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_bo.c | 1 &#43;<br>
                  &gt;&gt;&gt;&nbsp;&nbsp;&nbsp; 1 file changed, 1 insertion(&#43;)<br>
                  &gt;&gt;&gt;<br>
                  &gt;&gt;&gt; diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
                  b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                  &gt;&gt;&gt; index 9e07c3f75156..b8d853cab33b 100644<br>
                  &gt;&gt;&gt; --- a/drivers/gpu/drm/ttm/ttm_bo.c<br>
                  &gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                  &gt;&gt;&gt; @@ -541,6 &#43;541,7 @@ static bool
                  ttm_bo_delayed_delete(struct ttm_bo_device *bdev, bool
                  remove_all)<br>
                  &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                  &gt;&gt;&gt;&nbsp;&nbsp;&nbsp; <br>
                  &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_bo_put(bo);<br>
                  &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cond_resched();<br>
                  &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  spin_lock(&amp;glob-&gt;lru_lock);<br>
                  &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                  &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_splice_tail(&amp;removed,
                  &amp;bdev-&gt;ddestroy);<br>
                  &gt;&gt;
                  _______________________________________________<br>
                  &gt;&gt; dri-devel mailing list<br>
                  &gt;&gt; <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a><br>
                  &gt;&gt; <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C0a47486676a74702f05408d7dc89839c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637220355504145868&amp;amp;sdata=wbRkYBPI6mYuZjKBtQN3AGLDOwqJlWY3XUtwwSiUQHg%3D&amp;amp;reserved=0" moz-do-not-send="true">
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C0a47486676a74702f05408d7dc89839c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637220355504145868&amp;amp;sdata=wbRkYBPI6mYuZjKBtQN3AGLDOwqJlWY3XUtwwSiUQHg%3D&amp;amp;reserved=0</a><br>
                  <br>
                </div>
              </span></font></div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------31E295AB4B94C1AD5E9E81EE--

--===============1065654694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1065654694==--
