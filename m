Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389F8493FC1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 19:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BCA10EB89;
	Wed, 19 Jan 2022 18:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDE110EB7B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 18:22:33 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id o80so10090062yba.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 10:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ow/r3jR/x5GfOuGnuaEDOpHXZ2D5zk6XSR55QH2bw2k=;
 b=FLI8i7I5yY8vnry+xbaYi6fdQCzv/or9KmsXB8RqqToh1UZrTutJ8AvfQ35vIwRpaZ
 ZVIDvaMC9WrXJlmNwtpWjHaWlh2hOUrkwFG7C3i2Gjctt+KKhjxyftX7F345XteoowUn
 tmj3k+QHGMBCEsEd1hH7U0I28J5nEx8e5PpVhVuGXuhCte6lCImn19BiZqTDEqOw/Fdg
 fvcYZ8Aq05r+5q6HwLuIb9fePc6b1rxye0TZ4rjMY47us1/36Bhlc7LrAw524c1oJWJz
 AMiicIHHXoNcakeFhzP4hNVTgux4URUiw4uTdMc92CXEM0fnjkPofkv52VCekSlDs/yT
 fqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ow/r3jR/x5GfOuGnuaEDOpHXZ2D5zk6XSR55QH2bw2k=;
 b=Rz+7kA5UXD1F6kSoIVah7np2VPfNfTXzn4YtG5bPK2VMUuZXnNwkqEvgAZ8Lm8Q3BY
 aaugFRZtYUZt1tL5vYHMP9FKfHF5A6CDIbDbAhMxzWjsR7IMgt+4q19mgMzReZTTwBu9
 cRKSI0/isFAubVtsAloYF0rlcqIQ9eDs1ZU56mNrfXzf7G+whcsHzqboL5j7sfyKOahD
 b2X/zk11vBO1M+gRP6X6/6wdQRi9LJLNHRayauUR2rJkrW+KnNq5pFa5LL/Wrt82WfU/
 09BzG3z1ZT54LqdU8Yq6b80BJhuRJ0R0hBgwHUHjKU59r+gwYWuL4ZPY/3ioiSVP47ng
 hopA==
X-Gm-Message-State: AOAM532KpreJl+aUwPXWwNx7xNrj1D3ZpEwOQ7tuPiwtyA2X0tPKcjIL
 rCC5ulJ5QrRxKjlA77Gz5uK5ZWw9yRXOyNc030TJWg==
X-Google-Smtp-Source: ABdhPJyjjX5Kb9HEVQzIWK6/hD7hnVoGUHZFYjjUqWfesM5kj11GBi5GykhCeEhYDzwi5M4A2l0fMwN4mb/19ZPJHfM=
X-Received: by 2002:a5b:550:: with SMTP id r16mr38968597ybp.403.1642616552050; 
 Wed, 19 Jan 2022 10:22:32 -0800 (PST)
MIME-Version: 1.0
References: <20220115010622.3185921-1-hridya@google.com>
 <20220115010622.3185921-5-hridya@google.com>
 <f8c8b196-7d12-6242-97ac-38149f3a3ba3@amd.com>
 <CA+wgaPMjCfjQS4LA8hmVwAaGfXZhoJvvTUnOGt3duOhFb3orTw@mail.gmail.com>
 <Yeg0GGi0tdnnCLHg@phenom.ffwll.local>
 <5cc27a05-8131-ce9b-dea1-5c75e994216d@amd.com>
In-Reply-To: <5cc27a05-8131-ce9b-dea1-5c75e994216d@amd.com>
From: Hridya Valsaraju <hridya@google.com>
Date: Wed, 19 Jan 2022 10:21:56 -0800
Message-ID: <CA+wgaPMqN6HYfx4Abb=be0zN1BytyoP3jEWgaAW-x+POY0SgTQ@mail.gmail.com>
Subject: Re: [RFC 4/6] dma-buf: Add DMA-BUF exporter op to charge a DMA-BUF to
 a cgroup.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Joel Fernandes <joel@joelfernandes.org>, daniels@collabora.com,
 Matthew Brost <matthew.brost@intel.com>, Kenny.Ho@amd.com,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Matthew Auld <matthew.auld@intel.com>, Miguel Ojeda <ojeda@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Laura Abbott <labbott@redhat.com>,
 Marco Ballesio <balejs@google.com>, Jason Ekstrand <jason@jlekstrand.net>,
 linux-media@vger.kernel.org, Li Li <dualli@google.com>,
 Todd Kjos <tkjos@android.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@suse.cz>,
 Vipin Sharma <vipinsh@google.com>, Nathan Chancellor <nathan@kernel.org>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 tjmercier@google.com, Christian Brauner <christian@brauner.io>,
 linaro-mm-sig@lists.linaro.org, Hang Lu <hangl@codeaurora.org>,
 Chris Down <chris@chrisdown.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 7:58 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 19.01.22 um 16:54 schrieb Daniel Vetter:
> > On Tue, Jan 18, 2022 at 10:54:16AM -0800, Hridya Valsaraju wrote:
> >> On Sun, Jan 16, 2022 at 11:46 PM Christian K=C3=B6nig
> >> <christian.koenig@amd.com> wrote:
> >>> Am 15.01.22 um 02:06 schrieb Hridya Valsaraju:
> >>>> The optional exporter op provides a way for processes to transfer
> >>>> charge of a buffer to a different process. This is essential for the
> >>>> cases where a central allocator process does allocations for various
> >>>> subsystems, hands over the fd to the client who
> >>>> requested the memory and drops all references to the allocated memor=
y.
> >>>>
> >>>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> >>>> ---
> >>>>    include/linux/dma-buf.h | 18 ++++++++++++++++++
> >>>>    1 file changed, 18 insertions(+)
> >>>>
> >>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >>>> index 7ab50076e7a6..d5e52f81cc6f 100644
> >>>> --- a/include/linux/dma-buf.h
> >>>> +++ b/include/linux/dma-buf.h
> >>>> @@ -13,6 +13,7 @@
> >>>>    #ifndef __DMA_BUF_H__
> >>>>    #define __DMA_BUF_H__
> >>>>
> >>>> +#include <linux/cgroup_gpu.h>
> >>>>    #include <linux/dma-buf-map.h>
> >>>>    #include <linux/file.h>
> >>>>    #include <linux/err.h>
> >>>> @@ -285,6 +286,23 @@ struct dma_buf_ops {
> >>>>
> >>>>        int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> >>>>        void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *ma=
p);
> >>>> +
> >>>> +     /**
> >>>> +      * @charge_to_cgroup:
> >>>> +      *
> >>>> +      * This is called by an exporter to charge a buffer to the spe=
cified
> >>>> +      * cgroup.
> >>> Well that sentence makes absolutely no sense at all.
> >>>
> >>> The dma_buf_ops are supposed to be called by the DMA-buf subsystem on
> >>> behalves of the importer and never by the exporter itself.
> >>>
> >>> I hope that this is just a documentation mixup.
> >> Thank you for taking a look Christian!
> >>
> >> Yes, that was poor wording, sorry about that. It should instead say
> >> that the op would be called by the process the buffer is currently
> >> charged to in order to transfer the buffer's charge to a different
> >> cgroup. This is helpful in the case where a process acts as an
> >> allocator for multiple client processes and we would like the
> >> allocated buffers to be charged to the clients who requested their
> >> allocation(instead of the allocating process as is the default
> >> behavior). In Android, the graphics allocator HAL process[1] does
> >> most of the graphics allocations on behalf of various clients. After
> >> allocation, the HAL process passes the fd to the client over binder
> >> IPC and the binder driver invokes the charge_to_cgroup() DMA-BUF op to
> >> uncharge the buffer from the HAL process and charge it to the client
> >> process instead.
> >>
> >> [1]: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsource.android.com%2Fdevices%2Fgraphics%2Farch-bq-gralloc&amp;data=3D04%=
7C01%7Cchristian.koenig%40amd.com%7C838d25da974d4ea4257508d9db63eb70%7C3dd8=
961fe4884e608e11a82d994e183d%7C0%7C0%7C637782044488604857%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C3000&amp;sdata=3DQn7JeyF5Rq9tnrGw1KgNuQkpu5RbcrvPhDOa1OBJ6TU%3D&amp;reserv=
ed=3D0
> > For that use-case, do we really need to have the vfunc abstraction and
> > force all exporters to do something reasonable with it?
>
> I was about to write up a similar answer, but more from the technical sid=
e.
>
> Why in the world should that be done on the DMA-buf object as a
> communication function between importer and exporter?
>
> That design makes absolutely no sense at all to me.
>
> Regards,
> Christian.
>
> >
> > I think just storing the cgrpus gpu memory bucket this is charged again=
st
> > and doing this in a generic way would be a lot better.
> >
> > That way we can also easily add other neat features in the future, like
> > e.g. ttm could take care of charge-assignement automatically maybe, or =
we
> > could print the current cgroups charge relationship in the sysfs info
> > file. Or anything else really.

Thank you for the comments Daniel and Christian! I made the
charge/uncharge/transfer part of the exporter implementation since it
provided exporters a choice on whether they wanted to enable cgroup
memory accounting for the buffers they were exporting. I also see the
benefits of making the charge/uncharge/transfer generic by moving it
to the DMA-BUF framework like you are suggesting though. We will move
to a more generic design in the next version of the RFC.

Regards,
Hridya

> >
> > I do feel that in general for gpu memory cgroups to be useful, we shoul=
d
> > really have memory pools as a fairly strong concept. Otherwise every
> > driver/allocator/thing is going to come up with their own, and very lik=
ely
> > incompatible interpretation. And we end up with a supposed generic cgro=
ups
> > interface which cannot actually be used in a driver/vendor agnostic way=
 at
> > all.
> > -Daniel
> >
> >> Regards,
> >> Hridya
> >>
> >>
> >>> Regards,
> >>> Christian.
> >>>
> >>>>    The caller must hold a reference to @gpucg obtained via
> >>>> +      * gpucg_get(). The DMA-BUF will be uncharged from the cgroup =
it is
> >>>> +      * currently charged to before being charged to @gpucg. The ca=
ller must
> >>>> +      * belong to the cgroup the buffer is currently charged to.
> >>>> +      *
> >>>> +      * This callback is optional.
> >>>> +      *
> >>>> +      * Returns:
> >>>> +      *
> >>>> +      * 0 on success or negative error code on failure.
> >>>> +      */
> >>>> +     int (*charge_to_cgroup)(struct dma_buf *dmabuf, struct gpucg *=
gpucg);
> >>>>    };
> >>>>
> >>>>    /**
>
