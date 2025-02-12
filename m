Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FF8A3284E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E9510E170;
	Wed, 12 Feb 2025 14:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="PYLwVjGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAAC10E170
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:23:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739370222; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GaypVFgaOPH3t924XtEWvDqC0xfWSb7PNmDo7mDBRzfnttw9rQtXl+BRDd6DMWfQ9zMOpt1MRYFH+jxJrnKyvBido/1aCpHVfoFrZNngIehQsNRFcYTk/Gi1XXNZz8pkJXWK7GetebmGZvrRKe4PEzzoC6Hfsu1cMgk0ZlgJMGw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739370222;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fxdUEI9qV8xByx6gE5E+U8Qx8ei4ZofYMqf3WZkNtmg=; 
 b=lkfJTUv1w4R5oT+lrA/tUR/uFCtLQwFDZmJHTDpMxF8EBwasctkGWtFJaIzoKXSnM0rc1dXMdn3CXD2sQvhICSYmpjzjlCzlr/AgJB1biyt+cMxvTHfaQHaiRJ1Zq+WPKfGTwbKG/OX6D26E9cXxJdsd9ph4Hoe69k9TLJPIjjY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739370222; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=fxdUEI9qV8xByx6gE5E+U8Qx8ei4ZofYMqf3WZkNtmg=;
 b=PYLwVjGfxz9uGOXfF7EbuQw1GSGPBkaig3NYrAYEkJM9h1Pm40nUoodPOMBupe+W
 GnZRP2oFtP3m8CysFiT/SnMOtY3sEA7wVknDTJTwoicVjoy4qb/zJuVri0GSMoZyvHN
 ghARByUCkBnorc8P9v52Md+cdOxB0+o7k3dmw82I=
Received: by mx.zohomail.com with SMTPS id 1739370219270379.880099124141;
 Wed, 12 Feb 2025 06:23:39 -0800 (PST)
Date: Wed, 12 Feb 2025 14:23:35 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/panthor: Replace sleep locks with spinlocks in
 fdinfo path
Message-ID: <odudmfgsdnr56qvbkdgwz7sfys4xl53jixjy4zw2xlt6pgmpoy@tyrn6naovaaw>
References: <20250210124203.124191-1-adrian.larumbe@collabora.com>
 <2ec2a848-90f4-49bc-aaaf-8eb256f271db@ursulin.net>
 <ddnsckbpr2fcxby4i2o5xyrt3pdhornzbrvlbivuvzlyhgg66q@ejhkiz33sewn>
 <7ee0205a-6522-465b-8795-3d7b867e2d97@ursulin.net>
 <20250211134120.7e10b504@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211134120.7e10b504@collabora.com>
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

Hi Boris,

Here are the branch and kernel config I used for reproducing the bug:

https://gitlab.freedesktop.org/larumbe/drm-misc/-/tree/panthor-fdinfo-internalbosizes-10
https://gitlab.collabora.com/-/snippets/426

On 11.02.2025 13:41, Boris Brezillon wrote:
> On Tue, 11 Feb 2025 11:39:49 +0000
> Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> 
> > On 10/02/2025 16:08, Adrián Larumbe wrote:
> > > Hi Tvrtko,  
> > 
> > Thanks!
> > 
> > > [18153.770244] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:562
> > > [18153.771059] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 203412, name: cat
> > > [18153.771757] preempt_count: 1, expected: 0
> > > [18153.772164] RCU nest depth: 0, expected: 0
> > > [18153.772538] INFO: lockdep is turned off.
> > > [18153.772898] CPU: 4 UID: 0 PID: 203412 Comm: cat Tainted: G        W          6.14.0-rc1-panthor-next-rk3588-fdinfo+ #1
> > > [18153.772906] Tainted: [W]=WARN
> > > [18153.772908] Hardware name: Radxa ROCK 5B (DT)
> > > [18153.772911] Call trace:
> > > [18153.772913]  show_stack+0x24/0x38 (C)
> > > [18153.772927]  dump_stack_lvl+0x3c/0x98
> > > [18153.772935]  dump_stack+0x18/0x24
> > > [18153.772941]  __might_resched+0x298/0x2b0
> > > [18153.772948]  __might_sleep+0x6c/0xb0
> > > [18153.772953]  __mutex_lock_common+0x7c/0x1950
> > > [18153.772962]  mutex_lock_nested+0x38/0x50
> > > [18153.772969]  panthor_fdinfo_gather_group_samples+0x80/0x138 [panthor]
> > > [18153.773042]  panthor_show_fdinfo+0x80/0x228 [panthor]
> > > [18153.773109]  drm_show_fdinfo+0x1a4/0x1e0 [drm]
> > > [18153.773397]  seq_show+0x274/0x358
> > > [18153.773404]  seq_read_iter+0x1d4/0x630  
> > 
> > There is a mutex_lock literally in seq_read_iter.
> > 
> > So colour me confused. What created the atomic context between then and 
> > Panthor code?! I just don't see it.
> 
> Uh, looks like we've leaked an atomic context somewhere, indeed.
> Adrian, do you have a reliable reproducer for this bug?

Adrian Larumbe
