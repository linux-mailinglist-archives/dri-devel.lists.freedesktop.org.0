Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C713A3270
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 19:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9916E4CD;
	Thu, 10 Jun 2021 17:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808386E4CD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 17:49:21 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id 126so2370120vsi.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 10:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=MDcrEuTfbpypbWBozQCqe1ZKWSisJkXlaXl1ma/eVpk=;
 b=sIVhKJzSJcid/btpVwrgFWr6EZyqasxBCn5OPC4c80X1QeYjcTd3zYZQ1s/ecpOdV1
 JM8KMcokb2Pji4BKQ2UHgRUMJ748NZgKb76oEoYCtCTfLurhBj2bFq9LZOf95FYKXUSF
 PfkoaryH+rR+oOWw8Vsfp6ioSZ7JFIX/CVX2x1CAvjtXa3dmIOUnf/zj9fWwEY4NTV5k
 IBGrLdc7xiwvO6iAs7WItbLhbBcQ8DaPkMkZtX4ko/eW8uRuL4OE8NQOdf1gdr4mZ1gz
 rA55vaUBVLltZGfYAdjiDCcu16utzxTNytZ+irh72WXej1QjxAEGaxyKHjnuQiiocB+6
 q8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=MDcrEuTfbpypbWBozQCqe1ZKWSisJkXlaXl1ma/eVpk=;
 b=JrBwm/DHEsBsdLV3/yVC2JN+Cpi7YKvM16e96RHbjhMmLPA1m1iH7M1oxwBItnARtK
 YEvLXcZSNv12RDzKuKa1zGDUvcGQl8HGw2tkec1Koz4yNFDb47wD9KvEComk/jmZb1V3
 mynFeeIJ2p+uAISMrjbly1B0Wp/AuQcuRTfqvzdSqIheYtVnhsEiw4eO6avsINLszAMD
 H6aFmis87iDZPn7ZUoniLn1ZN1rtUfmA2H+nOAdUE9vHjJcewxaAvWC8WeJ4qqbUTkwS
 kDIB58AX2KaDivnTCjT6fxIawvC30piZIJ+7x2bCMQHxTPU4dNkwr8DKtFDBRgeeUO9l
 0cIw==
X-Gm-Message-State: AOAM531DVFsywWm4u9GI1RExYuZiJCy2tPm+JIXxnnPKZoLsYZqmWIsd
 YhTovOOzEtZAuzaL9wOjppDvvT0HCoXqeDwsXPs=
X-Google-Smtp-Source: ABdhPJwiJzZejt4ctNUz1DGv9m+IhPcLuILHjl39bvbb9N3Nj4g+TaMXH2XKjHw2qSrOhMBAJkZFWEuSLIiGI+vXZvo=
X-Received: by 2002:a67:878a:: with SMTP id j132mr6463110vsd.18.1623347360746; 
 Thu, 10 Jun 2021 10:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210609092119.173590-1-desmondcheongzx@gmail.com>
 <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
In-Reply-To: <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 10 Jun 2021 18:49:09 +0100
Message-ID: <CACvgo53xvUD-YgU_rhG3GDg18jygwAP78aj8OJd457SEFpAf7g@mail.gmail.com>
Subject: Re: [PATCH] drm: Lock pointer access in drm_master_release()
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@linux.ie>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 skhan@linuxfoundation.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 10 Jun 2021 at 11:10, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jun 09, 2021 at 05:21:19PM +0800, Desmond Cheong Zhi Xi wrote:
> > This patch eliminates the following smatch warning:
> > drivers/gpu/drm/drm_auth.c:320 drm_master_release() warn: unlocked access 'master' (line 318) expected lock '&dev->master_mutex'
> >
> > The 'file_priv->master' field should be protected by the mutex lock to
> > '&dev->master_mutex'. This is because other processes can concurrently
> > modify this field and free the current 'file_priv->master'
> > pointer. This could result in a use-after-free error when 'master' is
> > dereferenced in subsequent function calls to
> > 'drm_legacy_lock_master_cleanup()' or to 'drm_lease_revoke()'.
> >
> > An example of a scenario that would produce this error can be seen
> > from a similar bug in 'drm_getunique()' that was reported by Syzbot:
> > https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
> >
> > In the Syzbot report, another process concurrently acquired the
> > device's master mutex in 'drm_setmaster_ioctl()', then overwrote
> > 'fpriv->master' in 'drm_new_set_master()'. The old value of
> > 'fpriv->master' was subsequently freed before the mutex was unlocked.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>
> Thanks a lot. I've done an audit of this code, and I found another
> potential problem in drm_is_current_master. The callers from drm_auth.c
> hold the dev->master_mutex, but all the external ones dont. I think we
> need to split this into a _locked function for use within drm_auth.c, and
> the exported one needs to grab the dev->master_mutex while it's checking
> master status. Ofc there will still be races, those are ok, but right now
> we run the risk of use-after free problems in drm_lease_owner.
>
Note that some code does acquire the mutex via
drm_master_internal_acquire - so we should be careful.
As mentioned elsewhere - having a _locked version of
drm_is_current_master sounds good.

Might as well throw a lockdep_assert_held_once in there just in case :-P

Happy to help review the follow-up patches.
-Emil
