Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3429E23B5A8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8886E43F;
	Tue,  4 Aug 2020 07:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C616E170
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 01:09:28 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k2lS5-008ndS-Kd; Tue, 04 Aug 2020 01:09:13 +0000
Date: Tue, 4 Aug 2020 02:09:13 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
Message-ID: <20200804010913.GA2096725@ZenIV.linux.org.uk>
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com>
 <20200803154125.GA23808@casper.infradead.org>
 <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com>
 <20200803161230.GB23808@casper.infradead.org>
 <CAJuCfpGot1Lr+eS_AU30gqrrjc0aFWikxySe0667_GTJNsGTMw@mail.gmail.com>
 <20200803222831.GI1236603@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200803222831.GI1236603@ZenIV.linux.org.uk>
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:27:04 +0000
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, linux-doc@vger.kernel.org,
 Ioannis Ilkos <ilkos@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, Ingo Molnar <mingo@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Kalesh Singh <kaleshsingh@google.com>,
 linux-fsdevel@vger.kernel.org, kernel-team <kernel-team@android.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 03, 2020 at 11:28:31PM +0100, Al Viro wrote:

> IOW, what the hell is that horror for?  You do realize, for example, that there's
> such thing as dup(), right?  And dup2() as well.  And while we are at it, how
> do you keep track of removals, considering the fact that you can stick a file
> reference into SCM_RIGHTS datagram sent to yourself, close descriptors and an hour
> later pick that datagram, suddenly getting descriptor back?
> 
> Besides, "I have no descriptors left" != "I can't be currently sitting in the middle
> of syscall on that sucker"; close() does *NOT* terminate ongoing operations.
> 
> You are looking at the drastically wrong abstraction level.  Please, describe what
> it is that you are trying to achieve.

_IF_ it's "who keeps a particularly long-lived sucker pinned", I would suggest
fuser(1) run when you detect that kind of long-lived dmabuf.  With events generated
by their constructors and destructors, and detection of longevity done based on
that.

But that's only a semi-blind guess at the things you are trying to achieve; please,
describe what it really is.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
