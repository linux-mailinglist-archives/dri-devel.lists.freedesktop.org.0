Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AFD7E2C3C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 19:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4E110E3B0;
	Mon,  6 Nov 2023 18:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8481D10E3BF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 18:44:38 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5afc00161daso55053127b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 10:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699296277; x=1699901077;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=unAu3rVdKljQQL2turiQBdlprjhTErZk5t5fH6+DkH4=;
 b=ArQT972c7sWclPD7HGWW/hYn2sxPDwaVHB2icexDyHj2sXhgi1m5YtdujEkkQb5NuT
 JmsiUw9SChPPOt7bzpQTjIT+oidnBJ5IHG+EZtNW0cYBmvWFq9DyqRgTgOtf6Aha5DEH
 iiaRs+vT47yW6kogeWZiUg1WlQxiyC6I/CJ0gNVNcTOxzx9yg2D1n6J0vP2FIRikn4qM
 CUBnJ9JHoPVI5pz2PXfB4WOB8HzuN9d9qgsPLG1BkW3w1PCwRBy/zaro5xLFQd+RJ09e
 E68tm8fKAyjnyDOOKMurlB5ET4g2Mv2mU3i7xlmfu8MiYYBbdnjv2Jg9Inw0KPHxkQXL
 rIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699296277; x=1699901077;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=unAu3rVdKljQQL2turiQBdlprjhTErZk5t5fH6+DkH4=;
 b=VocbQPkVjfXHhHjr2KnGMrWsrPqSnnXEld2Y3uiWXpFggIwiUH/Xd0qMJC+0c5VS93
 9en9cxtTifvYLx5ziEq4Gyhc5LI2npkmWUJSkfv+UxfPh5jooYmEFtrJol7PGqEWSgD0
 tSZrsifX30hvxChbHq0TWsbp8eWSySp+J3Tdnuu/ppStKUqw8N32djMyJgrElsZnRty/
 4XOb3wv1xAmM5rXIuQ2QNbPfI7I/fyNtUOIHLlrmZbG+Y2HxxF6IGOthgQkdsI/XLaHy
 SMP2/L8+WkuAFa+N8m93NLQ3yhOsZnTKzzs5b28lwheJTz3quMhG7vX5Cl6JaQ3Sd3Qa
 aWoQ==
X-Gm-Message-State: AOJu0YwXz0J04KWsJQlE7bH4SfH6C5CtN74v7q2G3/ysbuNjYsm397pv
 Za17+xlsbU23B2qrl5okRNyvn6A=
X-Google-Smtp-Source: AGHT+IEPymksCe+J/GlG9UX+jCVEkLe44ItRkLzMmMlfrHbtUb58+EI2rBGvjINzoBfcVB6u0nFDhYI=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a25:7702:0:b0:d9a:6007:223a with SMTP id
 s2-20020a257702000000b00d9a6007223amr558822ybc.8.1699296277518; Mon, 06 Nov
 2023 10:44:37 -0800 (PST)
Date: Mon, 6 Nov 2023 10:44:36 -0800
In-Reply-To: <20231106024413.2801438-11-almasrymina@google.com>
Mime-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
Message-ID: <ZUk0FGuJ28s1d9OX@google.com>
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
From: Stanislav Fomichev <sdf@google.com>
To: Mina Almasry <almasrymina@google.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05, Mina Almasry wrote:
> In tcp_recvmsg_locked(), detect if the skb being received by the user
> is a devmem skb. In this case - if the user provided the MSG_SOCK_DEVMEM
> flag - pass it to tcp_recvmsg_devmem() for custom handling.
> 
> tcp_recvmsg_devmem() copies any data in the skb header to the linear
> buffer, and returns a cmsg to the user indicating the number of bytes
> returned in the linear buffer.
> 
> tcp_recvmsg_devmem() then loops over the unaccessible devmem skb frags,
> and returns to the user a cmsg_devmem indicating the location of the
> data in the dmabuf device memory. cmsg_devmem contains this information:
> 
> 1. the offset into the dmabuf where the payload starts. 'frag_offset'.
> 2. the size of the frag. 'frag_size'.
> 3. an opaque token 'frag_token' to return to the kernel when the buffer
> is to be released.
> 
> The pages awaiting freeing are stored in the newly added
> sk->sk_user_pages, and each page passed to userspace is get_page()'d.
> This reference is dropped once the userspace indicates that it is
> done reading this page.  All pages are released when the socket is
> destroyed.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
> 
> RFC v3:
> - Fixed issue with put_cmsg() failing silently.
> 
> ---
>  include/linux/socket.h            |   1 +
>  include/net/page_pool/helpers.h   |   9 ++
>  include/net/sock.h                |   2 +
>  include/uapi/asm-generic/socket.h |   5 +
>  include/uapi/linux/uio.h          |   6 +
>  net/ipv4/tcp.c                    | 189 +++++++++++++++++++++++++++++-
>  net/ipv4/tcp_ipv4.c               |   7 ++
>  7 files changed, 214 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/socket.h b/include/linux/socket.h
> index cfcb7e2c3813..fe2b9e2081bb 100644
> --- a/include/linux/socket.h
> +++ b/include/linux/socket.h
> @@ -326,6 +326,7 @@ struct ucred {
>  					  * plain text and require encryption
>  					  */
>  
> +#define MSG_SOCK_DEVMEM 0x2000000	/* Receive devmem skbs as cmsg */

Sharing the feedback that I've been providing internally on the public list:

IMHO, we need a better UAPI to receive the tokens and give them back to
the kernel. CMSG + setsockopt(SO_DEVMEM_DONTNEED) get the job done,
but look dated and hacky :-(

We should either do some kind of user/kernel shared memory queue to
receive/return the tokens (similar to what Jonathan was doing in his
proposal?) or bite the bullet and switch to io_uring.

I was also suggesting to do it via netlink initially, but it's probably
a bit slow for these purpose, idk.
