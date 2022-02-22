Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B60E14BF38F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF0710F4C4;
	Tue, 22 Feb 2022 08:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063AD10F4C4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:27:31 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1DA4C1F397;
 Tue, 22 Feb 2022 08:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645518449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dKa9YzG6WdPDW42WrXRDZOX/ZgG302zZsU6kzGjfuRk=;
 b=lVNqHC/SJXtfdUU1TvgLIEMqWyPvy2fp+HyHbXYbPfHfuZZMbbELQMO/hilxMxCbea4DxJ
 ugoy4UpC8tOrcLzxuNBmP5ZyZykkOuY+1PiwA4us8FNWR3k/lRPfP7OFBgxmPwowJFwI/K
 tx9BFWn1Go6d0U3AAkc8c0Ayhbp9HNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645518449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dKa9YzG6WdPDW42WrXRDZOX/ZgG302zZsU6kzGjfuRk=;
 b=OZiJ8XOK9jUItoV3AtwtQa1Drdy4scvKJ56k+qcYOdL1CygSJh+86zCmsqu2snN9Ldfuz4
 to3GnATifyxgYVAw==
Received: from quack3.suse.cz (unknown [10.100.200.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E227CA3B89;
 Tue, 22 Feb 2022 08:27:23 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 9F9B5A0606; Tue, 22 Feb 2022 09:27:23 +0100 (CET)
Date: Tue, 22 Feb 2022 09:27:23 +0100
From: Jan Kara <jack@suse.cz>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: Report 1 in ext4 and journal based on v5.17-rc1
Message-ID: <20220222082723.rddf4typah3wegrc@quack3.lan>
References: <1645095472-26530-1-git-send-email-byungchul.park@lge.com>
 <1645096204-31670-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645096204-31670-1-git-send-email-byungchul.park@lge.com>
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
 joel@joelfernandes.org, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 axboe@kernel.dk, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 17-02-22 20:10:03, Byungchul Park wrote:
> [    7.009608] ===================================================
> [    7.009613] DEPT: Circular dependency has been detected.
> [    7.009614] 5.17.0-rc1-00014-g8a599299c0cb-dirty #30 Tainted: G        W
> [    7.009616] ---------------------------------------------------
> [    7.009617] summary
> [    7.009618] ---------------------------------------------------
> [    7.009618] *** DEADLOCK ***
> [    7.009618]
> [    7.009619] context A
> [    7.009619]     [S] (unknown)(&(bit_wait_table + i)->dmap:0)
> [    7.009621]     [W] down_write(&ei->i_data_sem:0)
> [    7.009623]     [E] event(&(bit_wait_table + i)->dmap:0)
> [    7.009624]
> [    7.009625] context B
> [    7.009625]     [S] down_read(&ei->i_data_sem:0)
> [    7.009626]     [W] wait(&(bit_wait_table + i)->dmap:0)
> [    7.009627]     [E] up_read(&ei->i_data_sem:0)
> [    7.009628]

Looking into this I have noticed that Dept here tracks bitlocks (buffer
locks in particular) but it apparently treats locks on all buffers as one
locking class so it conflates lock on superblock buffer with a lock on
extent tree block buffer. These are wastly different locks with different
locking constraints. So to avoid false positives in filesystems we will
need to add annotations to differentiate locks on different buffers (based
on what the block is used for). Similarly how we e.g. annotate i_rwsem for
different inodes.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
