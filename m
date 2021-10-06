Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C05F42380F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 08:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36056F61E;
	Wed,  6 Oct 2021 06:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1031 seconds by postgrey-1.36 at gabe;
 Wed, 06 Oct 2021 04:27:35 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC72A6E4FB;
 Wed,  6 Oct 2021 04:27:35 +0000 (UTC)
Received: from dggeml754-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HPLTy1TsrzRZJ4;
 Wed,  6 Oct 2021 12:05:58 +0800 (CST)
Received: from [10.174.177.21] (10.174.177.21) by
 dggeml754-chm.china.huawei.com (10.1.199.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Wed, 6 Oct 2021 12:10:20 +0800
Subject: Re: [RFC 1/8] sched: Add nice value change notifier
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Tvrtko
 Ursulin <tvrtko.ursulin@intel.com>, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
 <20211004143650.699120-2-tvrtko.ursulin@linux.intel.com>
From: "Wanghui (John)" <john.wanghui@huawei.com>
Message-ID: <562d45e1-4a27-3252-f615-3ab1ef531f2b@huawei.com>
Date: Wed, 6 Oct 2021 12:10:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211004143650.699120-2-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.21]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeml754-chm.china.huawei.com (10.1.199.153)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 06 Oct 2021 06:34:10 +0000
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

HI Tvrtko

On 2021/10/4 22:36, Tvrtko Ursulin wrote:
>   void set_user_nice(struct task_struct *p, long nice)
>   {
>   	bool queued, running;
> -	int old_prio;
> +	int old_prio, ret;
>   	struct rq_flags rf;
>   	struct rq *rq;
>   
> @@ -6915,6 +6947,9 @@ void set_user_nice(struct task_struct *p, long nice)
>   
>   out_unlock:
>   	task_rq_unlock(rq, p, &rf);
> +
> +	ret = atomic_notifier_call_chain(&user_nice_notifier_list, nice, p);
> +	WARN_ON_ONCE(ret != NOTIFY_DONE);
>   }
How about adding a new "io_nice" to task_struct，and move the call chain to
sched_setattr/getattr, there are two benefits:

1. Decoupled with fair scheduelr. In our use case, high priority tasks often
    use rt scheduler.
2. The range of value don't need to be bound to -20~19 or 0~139




