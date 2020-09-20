Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B19271C17
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7CE6E21F;
	Mon, 21 Sep 2020 07:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn
 [202.108.3.167])
 by gabe.freedesktop.org (Postfix) with SMTP id 4A0406E090
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Sep 2020 02:19:47 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([222.131.67.153])
 by sina.com with ESMTP
 id 5F66B76C00011DE7; Sun, 20 Sep 2020 09:59:10 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 86849628751
From: Hillf Danton <hdanton@sina.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/3] drm/atomic: Use kthread worker for nonblocking commits
Date: Sun, 20 Sep 2020 09:58:58 +0800
Message-Id: <20200920015858.7756-1-hdanton@sina.com>
In-Reply-To: <20200919193727.2093945-3-robdclark@gmail.com>
References: <20200919193727.2093945-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Sep 2020 07:34:44 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, Hillf Danton <hdanton@sina.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-arm-msm@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, timmurray@google.com,
 David Airlie <airlied@linux.ie>, dri-dev <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Sat, 19 Sep 2020 12:37:25 -0700 Rob Clark wrote:
>  
> @@ -1797,6 +1797,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
>  			     struct drm_atomic_state *state,
>  			     bool nonblock)
>  {
> +	struct kthread_worker *worker = NULL;
>  	int ret;
>  
>  	if (state->async_update) {
> @@ -1814,7 +1815,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
>  	if (ret)
>  		return ret;
>  
> -	INIT_WORK(&state->commit_work, commit_work);
> +	kthread_init_work(&state->commit_kwork, commit_work);
>  
>  	ret = drm_atomic_helper_prepare_planes(dev, state);
>  	if (ret)
> @@ -1857,8 +1858,12 @@ int drm_atomic_helper_commit(struct drm_device *dev,
>  	 */
>  
>  	drm_atomic_state_get(state);
> +
>  	if (nonblock)
> -		queue_work(system_unbound_wq, &state->commit_work);
> +		worker = drm_atomic_pick_worker(state);
> +
> +	if (worker)
> +		kthread_queue_work(worker, &state->commit_kwork);
>  	else
>  		commit_tail(state);

A minor change in behavior: commit_tail() would have nothing to do with
either worker or work, rather than the fallback in case no worker is
available.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
