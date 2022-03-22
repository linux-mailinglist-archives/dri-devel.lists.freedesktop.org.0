Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFA04E43E1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 17:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030B110E0C9;
	Tue, 22 Mar 2022 16:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD2C10E0C9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 16:07:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0A2E612CC;
 Tue, 22 Mar 2022 16:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD3BC340F2;
 Tue, 22 Mar 2022 16:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647965240;
 bh=uSOOq0K0AgKLPEeuKOwHFh4OYgLE2Hvt3voMGhHzT6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fQPHI71f0BUCbQYIhPaRBwike/7mbu7HfbqKAyTZyeXxvTFSZBW8OJHw75FyNjjct
 TkJ06nuufpzYFl30PfmHHBsdFoAVO/Rx0Py/EjuoAKDdpB/pe2RWuS3m6aOIijxKqc
 4QUbiO92sHlJvwFEXOPCHmImzlFcOAhg54Q+11qL1v3uqtjpAMaTzXM5VBvwNrUQaM
 0pDSwIOEuTE6bHlxoGYzBa9s329CV9bgmt8q09zcbRbyvOe2RQxTg2mokYrSjoByFw
 q9ZWxV41RiPsyAX4zQlvXxD0pIV62dPOK62WraDz62dbu/RjKCEGPO0AZga3dK4b2/
 RdPvbVQNl8fyQ==
Date: Tue, 22 Mar 2022 17:07:09 +0100
From: Christian Brauner <brauner@kernel.org>
To: Todd Kjos <tkjos@google.com>
Subject: Re: [RFC v3 8/8] selftests: Add binder cgroup gpu memory transfer test
Message-ID: <20220322160709.rcbjgqdoar7lvbox@wittgenstein>
References: <20220309165222.2843651-1-tjmercier@google.com>
 <20220309165222.2843651-9-tjmercier@google.com>
 <CAHRSSEwN4Xuo2vLt8d2QfJbNOK21VB7_NjjbO_XGDz6pYUaXZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHRSSEwN4Xuo2vLt8d2QfJbNOK21VB7_NjjbO_XGDz6pYUaXZg@mail.gmail.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kaleshsingh@google.com,
 Joel Fernandes <joel@joelfernandes.org>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kenny.Ho@amd.com,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 Laura Abbott <labbott@redhat.com>, linux-media@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linaro-mm-sig@lists.linaro.org, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-kselftest@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 14, 2022 at 05:43:40PM -0700, Todd Kjos wrote:
> On Wed, Mar 9, 2022 at 8:53 AM T.J. Mercier <tjmercier@google.com> wrote:
> >
> > This test verifies that the cgroup GPU memory charge is transferred
> > correctly when a dmabuf is passed between processes in two different
> > cgroups and the sender specifies BINDER_BUFFER_FLAG_SENDER_NO_NEED in the
> > binder transaction data containing the dmabuf file descriptor.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> 
> Reviewed-by: Todd Kjos <tkjos@google.com>
> for the binder driver interactions. Need Christian to take a look at
> the binderfs interactions.

Sorry, just saw this now. I'll take a look tomorrow!
