Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C7D40C484
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 13:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B76F6E91C;
	Wed, 15 Sep 2021 11:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F106E914;
 Wed, 15 Sep 2021 11:45:41 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u18so1671432wrg.5;
 Wed, 15 Sep 2021 04:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=Zh48JfzZnNO3eFLiUCBCArgXr8Y4evHfiZod73CAP08=;
 b=lb7XFxvvBz+WDuLsqyRTd+XLq/qJzIuYbQnfhIclZ4IRlLqys4Ms+yTCdfcrQft5d6
 q7EJ5GQfJEFJmba3Llu1Ibs7CIzXP4b0MIGUY+JZdR1aHy0eci3XvC0LGfFSdIiR9K8u
 1/8nGH/ROO/tE/6CR66XPb4QsFRxGPTvfX5cAy1edHr9/qTjQTPh0o9o/TaKntkLY8V8
 b4EXT4FbJbB5fSN6y4J9uPThqdmz+ffzjz4KMG/2HVt4umZAFgo/LYu4jaewOZYAqmyw
 SoJM7K8PnOj79GJ/lLMtEcZYeGeob9V5OlupiV+krkUwbfVRTzI54uky4Dmm+wWF+U93
 D85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=Zh48JfzZnNO3eFLiUCBCArgXr8Y4evHfiZod73CAP08=;
 b=icdkCPqxjwrg5XdHfqVzE+LMjoZZYW0Eg5mIJRQ87r6bXGPzldlYttT7N3xx7tT3zj
 z6oaxE12HGViiRpvNql/pf13/eqZp6H7+N7X0E8B60o4SzcGE4EOm9KJs549+M4sYoX2
 JiydKlDn/yL0s/2dGIw8BmP8Ju61jfmQCg0C8u7h6hcaVjZEJV8RD86kN0gFVo1nRk09
 Hn0rivaqLeAT0cd5ePAtzfmsRI4mB+Al5NRRAvCZGgmQXj70GCqWnnKxRt9EIWfL4AXG
 QQ3U3EZEOKhVenSoKN1U8DHs51vOW03Quir+kJZREA2on7EhcfHPldLraVQ5o7ZyYmC3
 g30w==
X-Gm-Message-State: AOAM531tMTRdsYDTmkEtUx0Gv2aac52coAgIz4s9BDQFF5hBG4NaNfM4
 Bkx3SfTJCCxoSq5tkefix6lNbVtY5GM=
X-Google-Smtp-Source: ABdhPJyQ0lh8msPS3rDvTKdm9hldBPrb7m5J5mO+VvjXwqod3GTxUaDqRdHSB8yza1aCL9dQmlXUeQ==
X-Received: by 2002:a05:6000:14d:: with SMTP id
 r13mr4639348wrx.420.1631706339795; 
 Wed, 15 Sep 2021 04:45:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:d03d:8939:3840:1f95?
 ([2a02:908:1252:fb60:d03d:8939:3840:1f95])
 by smtp.gmail.com with ESMTPSA id c23sm4048630wmb.37.2021.09.15.04.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 04:45:39 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: "Liu, Monk" <Monk.Liu@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <1630457207-13107-1-git-send-email-Monk.Liu@amd.com>
 <28709f7f-8a48-40ad-87bb-c2f0dd89da38@gmail.com>
 <CADnq5_PRE4WyftqO15c08qwQx2CRszsj4gJQtDeon9TvtV+qkA@mail.gmail.com>
 <CADnq5_POHuuQYm5ZULWeumCmsy+eWbsRe0MSKuJcQxb7R=962g@mail.gmail.com>
 <SN6PR12MB4623F8A1707C870938E08140EADA9@SN6PR12MB4623.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9fef7287-5d2c-1d25-afa8-1c621be8fe67@gmail.com>
Date: Wed, 15 Sep 2021 13:45:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <SN6PR12MB4623F8A1707C870938E08140EADA9@SN6PR12MB4623.namprd12.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------489A5B73750A51ACB45DB9F1"
Content-Language: en-US
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

This is a multi-part message in MIME format.
--------------489A5B73750A51ACB45DB9F1
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Yes, I think so as well. Andrey can you push this?

Christian.

Am 15.09.21 um 00:59 schrieb Grodzovsky, Andrey:
> AFAIK this one is independent.
>
> Christian, can you confirm ?
>
> Andrey
> ------------------------------------------------------------------------
> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of 
> Alex Deucher <alexdeucher@gmail.com>
> *Sent:* 14 September 2021 15:33
> *To:* Christian König <ckoenig.leichtzumerken@gmail.com>
> *Cc:* Liu, Monk <Monk.Liu@amd.com>; amd-gfx list 
> <amd-gfx@lists.freedesktop.org>; Maling list - DRI developers 
> <dri-devel@lists.freedesktop.org>
> *Subject:* Re: [PATCH 1/2] drm/sched: fix the bug of time out 
> calculation(v4)
> Was this fix independent of the other discussions?  Should this be
> applied to drm-misc?
>
> Alex
>
> On Wed, Sep 1, 2021 at 4:42 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Wed, Sep 1, 2021 at 2:50 AM Christian König
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > >
> > > Am 01.09.21 um 02:46 schrieb Monk Liu:
> > > > issue:
> > > > in cleanup_job the cancle_delayed_work will cancel a TO timer
> > > > even the its corresponding job is still running.
> > > >
> > > > fix:
> > > > do not cancel the timer in cleanup_job, instead do the cancelling
> > > > only when the heading job is signaled, and if there is a "next" job
> > > > we start_timeout again.
> > > >
> > > > v2:
> > > > further cleanup the logic, and do the TDR timer cancelling if 
> the signaled job
> > > > is the last one in its scheduler.
> > > >
> > > > v3:
> > > > change the issue description
> > > > remove the cancel_delayed_work in the begining of the cleanup_job
> > > > recover the implement of drm_sched_job_begin.
> > > >
> > > > v4:
> > > > remove the kthread_should_park() checking in cleanup_job routine,
> > > > we should cleanup the signaled job asap
> > > >
> > > > TODO:
> > > > 1)introduce pause/resume scheduler in job_timeout to serial the 
> handling
> > > > of scheduler and job_timeout.
> > > > 2)drop the bad job's del and insert in scheduler due to above 
> serialization
> > > > (no race issue anymore with the serialization)
> > > >
> > > > tested-by: jingwen <jingwen.chen@@amd.com>
> > > > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> > >
> > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > >
> >
> > Are you planning to push this to drm-misc?
> >
> > Alex
> >
> >
> > > > ---
> > > >   drivers/gpu/drm/scheduler/sched_main.c | 26 
> +++++++++-----------------
> > > >   1 file changed, 9 insertions(+), 17 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
> b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index a2a9536..3e0bbc7 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct 
> drm_gpu_scheduler *sched)
> > > >   {
> > > >       struct drm_sched_job *job, *next;
> > > >
> > > > -     /*
> > > > -      * Don't destroy jobs while the timeout worker is running  
> OR thread
> > > > -      * is being parked and hence assumed to not touch pending_list
> > > > -      */
> > > > -     if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> > > > - !cancel_delayed_work(&sched->work_tdr)) ||
> > > > -         kthread_should_park())
> > > > -             return NULL;
> > > > -
> > > > spin_lock(&sched->job_list_lock);
> > > >
> > > >       job = list_first_entry_or_null(&sched->pending_list,
> > > > @@ -693,17 +684,21 @@ drm_sched_get_cleanup_job(struct 
> drm_gpu_scheduler *sched)
> > > >       if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
> > > >               /* remove job from pending_list */
> > > > list_del_init(&job->list);
> > > > +
> > > > +             /* cancel this job's TO timer */
> > > > + cancel_delayed_work(&sched->work_tdr);
> > > >               /* make the scheduled timestamp more accurate */
> > > >               next = list_first_entry_or_null(&sched->pending_list,
> > > > typeof(*next), list);
> > > > -             if (next)
> > > > +
> > > > +             if (next) {
> > > > next->s_fence->scheduled.timestamp =
> > > > job->s_fence->finished.timestamp;
> > > > -
> > > > +                     /* start TO timer for next job */
> > > > + drm_sched_start_timeout(sched);
> > > > +             }
> > > >       } else {
> > > >               job = NULL;
> > > > -             /* queue timeout for next job */
> > > > - drm_sched_start_timeout(sched);
> > > >       }
> > > >
> > > > spin_unlock(&sched->job_list_lock);
> > > > @@ -791,11 +786,8 @@ static int drm_sched_main(void *param)
> > > > (entity = drm_sched_select_entity(sched))) ||
> > > > kthread_should_stop());
> > > >
> > > > -             if (cleanup_job) {
> > > > +             if (cleanup_job)
> > > > sched->ops->free_job(cleanup_job);
> > > > -                     /* queue timeout for next job */
> > > > - drm_sched_start_timeout(sched);
> > > > -             }
> > > >
> > > >               if (!entity)
> > > >                       continue;
> > >


--------------489A5B73750A51ACB45DB9F1
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    Yes, I think so as well. Andrey can you push this?<br>
    <br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 15.09.21 um 00:59 schrieb
      Grodzovsky, Andrey:<br>
    </div>
    <blockquote type="cite"
cite="mid:SN6PR12MB4623F8A1707C870938E08140EADA9@SN6PR12MB4623.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <div>AFAIK this one is independent.</div>
      <div><br>
      </div>
      <div>Christian, can you confirm ?</div>
      <div><br>
      </div>
      <div>Andrey</div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
          face="Calibri, sans-serif" color="#000000"><b>From:</b>
          amd-gfx <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on
          behalf of Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexdeucher@gmail.com">&lt;alexdeucher@gmail.com&gt;</a><br>
          <b>Sent:</b> 14 September 2021 15:33<br>
          <b>To:</b> Christian König
          <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
          <b>Cc:</b> Liu, Monk <a class="moz-txt-link-rfc2396E" href="mailto:Monk.Liu@amd.com">&lt;Monk.Liu@amd.com&gt;</a>; amd-gfx list
          <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a>; Maling list - DRI
          developers <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a><br>
          <b>Subject:</b> Re: [PATCH 1/2] drm/sched: fix the bug of time
          out calculation(v4)</font>
        <div> </div>
      </div>
      <div class="BodyFragment"><font size="2"><span
            style="font-size:11pt;">
            <div class="PlainText">Was this fix independent of the other
              discussions?  Should this be<br>
              applied to drm-misc?<br>
              <br>
              Alex<br>
              <br>
              On Wed, Sep 1, 2021 at 4:42 PM Alex Deucher
              <a class="moz-txt-link-rfc2396E" href="mailto:alexdeucher@gmail.com">&lt;alexdeucher@gmail.com&gt;</a> wrote:<br>
              &gt;<br>
              &gt; On Wed, Sep 1, 2021 at 2:50 AM Christian König<br>
              &gt; <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a> wrote:<br>
              &gt; &gt;<br>
              &gt; &gt; Am 01.09.21 um 02:46 schrieb Monk Liu:<br>
              &gt; &gt; &gt; issue:<br>
              &gt; &gt; &gt; in cleanup_job the cancle_delayed_work will
              cancel a TO timer<br>
              &gt; &gt; &gt; even the its corresponding job is still
              running.<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; fix:<br>
              &gt; &gt; &gt; do not cancel the timer in cleanup_job,
              instead do the cancelling<br>
              &gt; &gt; &gt; only when the heading job is signaled, and
              if there is a "next" job<br>
              &gt; &gt; &gt; we start_timeout again.<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; v2:<br>
              &gt; &gt; &gt; further cleanup the logic, and do the TDR
              timer cancelling if the signaled job<br>
              &gt; &gt; &gt; is the last one in its scheduler.<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; v3:<br>
              &gt; &gt; &gt; change the issue description<br>
              &gt; &gt; &gt; remove the cancel_delayed_work in the
              begining of the cleanup_job<br>
              &gt; &gt; &gt; recover the implement of
              drm_sched_job_begin.<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; v4:<br>
              &gt; &gt; &gt; remove the kthread_should_park() checking
              in cleanup_job routine,<br>
              &gt; &gt; &gt; we should cleanup the signaled job asap<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; TODO:<br>
              &gt; &gt; &gt; 1)introduce pause/resume scheduler in
              job_timeout to serial the handling<br>
              &gt; &gt; &gt; of scheduler and job_timeout.<br>
              &gt; &gt; &gt; 2)drop the bad job's del and insert in
              scheduler due to above serialization<br>
              &gt; &gt; &gt; (no race issue anymore with the
              serialization)<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; tested-by: jingwen
              <a class="moz-txt-link-rfc2396E" href="mailto:jingwen.chen@@amd.com">&lt;jingwen.chen@@amd.com&gt;</a><br>
              &gt; &gt; &gt; Signed-off-by: Monk Liu
              <a class="moz-txt-link-rfc2396E" href="mailto:Monk.Liu@amd.com">&lt;Monk.Liu@amd.com&gt;</a><br>
              &gt; &gt;<br>
              &gt; &gt; Reviewed-by: Christian König
              <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
              &gt; &gt;<br>
              &gt;<br>
              &gt; Are you planning to push this to drm-misc?<br>
              &gt;<br>
              &gt; Alex<br>
              &gt;<br>
              &gt;<br>
              &gt; &gt; &gt; ---<br>
              &gt; &gt; &gt;   drivers/gpu/drm/scheduler/sched_main.c |
              26 +++++++++-----------------<br>
              &gt; &gt; &gt;   1 file changed, 9 insertions(+), 17
              deletions(-)<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; diff --git
              a/drivers/gpu/drm/scheduler/sched_main.c
              b/drivers/gpu/drm/scheduler/sched_main.c<br>
              &gt; &gt; &gt; index a2a9536..3e0bbc7 100644<br>
              &gt; &gt; &gt; ---
              a/drivers/gpu/drm/scheduler/sched_main.c<br>
              &gt; &gt; &gt; +++
              b/drivers/gpu/drm/scheduler/sched_main.c<br>
              &gt; &gt; &gt; @@ -676,15 +676,6 @@
              drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)<br>
              &gt; &gt; &gt;   {<br>
              &gt; &gt; &gt;       struct drm_sched_job *job, *next;<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; -     /*<br>
              &gt; &gt; &gt; -      * Don't destroy jobs while the
              timeout worker is running  OR thread<br>
              &gt; &gt; &gt; -      * is being parked and hence assumed
              to not touch pending_list<br>
              &gt; &gt; &gt; -      */<br>
              &gt; &gt; &gt; -     if ((sched-&gt;timeout !=
              MAX_SCHEDULE_TIMEOUT &amp;&amp;<br>
              &gt; &gt; &gt; -        
              !cancel_delayed_work(&amp;sched-&gt;work_tdr)) ||<br>
              &gt; &gt; &gt; -         kthread_should_park())<br>
              &gt; &gt; &gt; -             return NULL;<br>
              &gt; &gt; &gt; -<br>
              &gt; &gt; &gt;      
              spin_lock(&amp;sched-&gt;job_list_lock);<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt;       job =
              list_first_entry_or_null(&amp;sched-&gt;pending_list,<br>
              &gt; &gt; &gt; @@ -693,17 +684,21 @@
              drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)<br>
              &gt; &gt; &gt;       if (job &amp;&amp;
              dma_fence_is_signaled(&amp;job-&gt;s_fence-&gt;finished))
              {<br>
              &gt; &gt; &gt;               /* remove job from
              pending_list */<br>
              &gt; &gt; &gt;              
              list_del_init(&amp;job-&gt;list);<br>
              &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; +             /* cancel this job's TO timer
              */<br>
              &gt; &gt; &gt; +            
              cancel_delayed_work(&amp;sched-&gt;work_tdr);<br>
              &gt; &gt; &gt;               /* make the scheduled
              timestamp more accurate */<br>
              &gt; &gt; &gt;               next =
              list_first_entry_or_null(&amp;sched-&gt;pending_list,<br>
              &gt; &gt;
              &gt;                                              
              typeof(*next), list);<br>
              &gt; &gt; &gt; -             if (next)<br>
              &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; +             if (next) {<br>
              &gt; &gt; &gt;                      
              next-&gt;s_fence-&gt;scheduled.timestamp =<br>
              &gt; &gt; &gt;                              
              job-&gt;s_fence-&gt;finished.timestamp;<br>
              &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; +                     /* start TO timer for
              next job */<br>
              &gt; &gt; &gt; +                    
              drm_sched_start_timeout(sched);<br>
              &gt; &gt; &gt; +             }<br>
              &gt; &gt; &gt;       } else {<br>
              &gt; &gt; &gt;               job = NULL;<br>
              &gt; &gt; &gt; -             /* queue timeout for next job
              */<br>
              &gt; &gt; &gt; -            
              drm_sched_start_timeout(sched);<br>
              &gt; &gt; &gt;       }<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt;      
              spin_unlock(&amp;sched-&gt;job_list_lock);<br>
              &gt; &gt; &gt; @@ -791,11 +786,8 @@ static int
              drm_sched_main(void *param)<br>
              &gt; &gt; &gt;                                        
              (entity = drm_sched_select_entity(sched))) ||<br>
              &gt; &gt; &gt;                                       
              kthread_should_stop());<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; -             if (cleanup_job) {<br>
              &gt; &gt; &gt; +             if (cleanup_job)<br>
              &gt; &gt; &gt;                      
              sched-&gt;ops-&gt;free_job(cleanup_job);<br>
              &gt; &gt; &gt; -                     /* queue timeout for
              next job */<br>
              &gt; &gt; &gt; -                    
              drm_sched_start_timeout(sched);<br>
              &gt; &gt; &gt; -             }<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt;               if (!entity)<br>
              &gt; &gt; &gt;                       continue;<br>
              &gt; &gt;<br>
            </div>
          </span></font></div>
    </blockquote>
    <br>
  </body>
</html>

--------------489A5B73750A51ACB45DB9F1--
