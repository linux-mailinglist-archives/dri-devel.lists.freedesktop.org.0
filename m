Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDCF8BDC7A
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 09:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09C0112463;
	Tue,  7 May 2024 07:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (3072-bit key; secure) header.d=samba.org header.i=@samba.org header.b="H+Au6r4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2347 seconds by postgrey-1.36 at gabe;
 Mon, 06 May 2024 18:25:23 UTC
Received: from hr2.samba.org (hr2.samba.org [144.76.82.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E0F1122EF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=xw3p/mu9rqf4LynApLZg3ICv4KBQ9pI/cT8ZAvWfrvU=; b=H+Au6r4F4x1Z85+DNGjlJceQt6
 VaCVEcT4DEiGQbGVDh4OFym0kKFZBd86s6uXoJpPJTol6iKXqn0LG0HyJx8lIh8EDuo+2i5hrqN2O
 vk8Qm3pQwBYOe4xDEpVSHAJ94SfEJi+QIlADWRgaZl2lxVH8SKQJpWHxqdqPKPehOFIM8Su38HTbz
 tZmG9bvQ+46+S74+Tc+2yjeIEhU2KGEf6hYY0sJQDTqbdzLZTPufeLvN5VPgkNTHPOYPIkOVO0+81
 syykN+b+56a1Khj1sPfDj2zaRMDolfZReWyrBPwwCMLHxuCZrQqarp8odXqr9D7+gq22C7zDhtgFs
 CDqB8Lqc9X0g5Di3lkjVsfjGTFg7PxYd9cX9RXsShaBKDeLBvJeTRzcKI1+KkmZWflxdWQiL7szBw
 xvayOxyIs7UU8VHV51kSkC6VEOl3cP9Ch3jcC1obaPYpZYp8zP/YEf1lCPpQ6pc093IgCA0JBFcfa
 tXQCy/UeOaoa1sQS6m4mY1a7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s42Pk-00A49V-1t; Mon, 06 May 2024 17:46:12 +0000
Message-ID: <501ead34-d79f-442e-9b9a-ecd694b3015c@samba.org>
Date: Mon, 6 May 2024 19:46:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: get_file() unsafe under epoll (was Re: [syzbot] [fs?] [io-uring?]
 general protection fault in __ep_remove)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Kees Cook <keescook@chromium.org>, Jens Axboe <axboe@kernel.dk>,
 Bui Quang Minh <minhquangbui99@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 syzbot <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Laura Abbott <laura@labbott.name>
References: <0000000000002d631f0615918f1e@google.com>
 <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook>
 <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
 <202405031207.9D62DA4973@keescook>
 <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
 <202405031237.B6B8379@keescook> <202405031325.B8979870B@keescook>
 <20240503211109.GX2118490@ZenIV>
 <CAHk-=wj0de-P2Q=Gz2uyrWBHagT25arLbN0Lyg=U6fT7psKnQA@mail.gmail.com>
Content-Language: en-US, de-DE
From: Stefan Metzmacher <metze@samba.org>
In-Reply-To: <CAHk-=wj0de-P2Q=Gz2uyrWBHagT25arLbN0Lyg=U6fT7psKnQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 07 May 2024 07:31:32 +0000
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

Am 03.05.24 um 23:24 schrieb Linus Torvalds:
> On Fri, 3 May 2024 at 14:11, Al Viro <viro@zeniv.linux.org.uk> wrote:
>>
>> What we need is
>>          * promise that ep_item_poll() won't happen after eventpoll_release_file().
>> AFAICS, we do have that.
>>          * ->poll() not playing silly buggers.
> 
> No. That is not enough at all.
> 
> Because even with perfectly normal "->poll()", and even with the
> ep_item_poll() happening *before* eventpoll_release_file(), you have
> this trivial race:
> 
>    ep_item_poll()
>       ->poll()
> 
> and *between* those two operations, another CPU does "close()", and
> that causes eventpoll_release_file() to be called, and now f_count
> goes down to zero while ->poll() is running.
> 
> So you do need to increment the file count around the ->poll() call, I feel.
> 
> Or, alternatively, you'd need to serialize with
> eventpoll_release_file(), but that would need to be some sleeping lock
> held over the ->poll() call.
> 
>> As it is, dma_buf ->poll() is very suspicious regardless of that
>> mess - it can grab reference to file for unspecified interval.
> 
> I think that's actually much preferable to what epoll does, which is
> to keep using files without having reference counts to them (and then
> relying on magically not racing with eventpoll_release_file().

I think it's a very important detail that epoll does not take
real references. Otherwise an application level 'close()' on a socket
would not trigger a tcp disconnect, when an fd is still registered with
epoll.

I noticed that some parts of Samba currently rely on this when I tried
to convert tevent from epoll to IORING_OP_POLL_ADD (which takes a longer term reference)

And I guess there will be other applications also relying on the current epoll
behavior. That a closed fs automatically removes itself from epoll.

A short term reference just around ->poll() might be fine,
but please no reference via EPOLL_CTL_ADD.

Changing that can cause security problems in user space.

I haven't followed all details of this thread,
please ignore me if that's all clear already :-)

Thanks!
metze


