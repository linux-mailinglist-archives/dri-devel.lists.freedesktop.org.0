Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C0A519E15
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8832910F635;
	Wed,  4 May 2022 11:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 547 seconds by postgrey-1.36 at gabe;
 Wed, 04 May 2022 11:32:52 UTC
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D5010F635
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:32:52 +0000 (UTC)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 2D48820DE95C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH RFC v6 16/21] dept: Distinguish each work from another
To: Byungchul Park <byungchul.park@lge.com>, <torvalds@linux-foundation.org>
References: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
 <1651652269-15342-17-git-send-email-byungchul.park@lge.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <24e4d6db-9dc9-f113-f655-9af3a51723d4@omp.ru>
Date: Wed, 4 May 2022 14:23:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1651652269-15342-17-git-send-email-byungchul.park@lge.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 airlied@linux.ie, mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 linux-mm@kvack.org, ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

On 5/4/22 11:17 AM, Byungchul Park wrote:

> Workqueue already provides concurrency control. By that, any wait in a
> work doesn't prevents events in other works with the control enabled.
> Thus, each work would better be considered a different context.
> 
> So let Dept assign a different context id to each work.
> 
> Signed-off-by: Byungchul Park <byungchul.park@lge.com>
[...]
> diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
> index 18e5951..6707313 100644
> --- a/kernel/dependency/dept.c
> +++ b/kernel/dependency/dept.c
> @@ -1844,6 +1844,16 @@ void dept_enirq_transition(unsigned long ip)
>  	dept_exit(flags);
>  }
>  
> +/*
> + * Assign a different context id to each work.
> + */
> +void dept_work_enter(void)
> +{
> +	struct dept_task *dt = dept_task();
> +
> +	dt->cxt_id[DEPT_CXT_PROCESS] += (1UL << DEPT_CXTS_NR);

   Parens around << unnecessary...

[...]

MBR, Sergey
