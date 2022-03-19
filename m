Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CC64E18E4
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 23:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1FD10E1B6;
	Sat, 19 Mar 2022 22:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0008C10E1B6
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 22:50:28 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 22JMn9Ad026583
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Mar 2022 18:49:10 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 6AFEB15C0038; Sat, 19 Mar 2022 18:49:09 -0400 (EDT)
Date: Sat, 19 Mar 2022 18:49:09 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH RFC v5 00/21] DEPT(Dependency Tracker)
Message-ID: <YjZd5ff1DiKQnsrv@mit.edu>
References: <1647397593-16747-1-git-send-email-byungchul.park@lge.com>
 <YjKtZxjIKDJqsSrP@mit.edu> <20220318074945.GA17484@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318074945.GA17484@X58A-UD3R>
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
 melissa.srw@gmail.com, sj@kernel.org, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 18, 2022 at 04:49:45PM +0900, Byungchul Park wrote:
> 
> I guess it was becasue of the commit b1fca27d384e8("kernel debug:
> support resetting WARN*_ONCE"). Your script seems to reset WARN*_ONCE
> repeatedly.

I wasn't aware this was being done, but your guess was correct.  The
WARN_ONCE state is getting cleared between each test in xfstests, with
the rationale (which IMO is quite reasonable) why this done in the
xfstests commit descrition:

commit c67ea2347454aebbe8eb6e825e9314d099b683da
Author: Lukas Czerner <lczerner@redhat.com>
Date:   Wed Jul 15 13:42:19 2020 +0200

    check: clear WARN_ONCE state before each test
    
    clear WARN_ONCE state before each test to allow a potential problem
    to be reported for each test
    
    [Eryu: replace "/sys/kernel/debug" with $DEBUGFS_MNT ]
    
    Signed-off-by: Lukas Czerner <lczerner@redhat.com>
    Reviewed-by: Zorro Lang <zlang@redhat.com>
    Signed-off-by: Eryu Guan <guaneryu@gmail.com>

Cheers,

						- Ted
