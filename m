Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F0B4C36E9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 21:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8836A10E6AA;
	Thu, 24 Feb 2022 20:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858FA10E6AA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 20:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645734726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U2ubHgPrmh8MR1n+1PbtlqSxV6eATITrLbT20lAtpdI=;
 b=FL1UmFLaDc7M55N+0/lHs1ERyngGbbaPFDCBwT/7HkDoRBj6m98YSdWLYnDOwDychNNj5w
 oULuM8RFwrO3ZkIiFYDXMZg2eqSGpe8HNtksUhjiX1UTBPDd2fl3oCC5r7bVJzRyMiIrO3
 b/Es9LuzJZP9Cd9HrQLh6UpCphuwMqI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-NKgCLEf1OKymbB-1ccgg4A-1; Thu, 24 Feb 2022 15:32:02 -0500
X-MC-Unique: NKgCLEf1OKymbB-1ccgg4A-1
Received: by mail-qt1-f199.google.com with SMTP id
 f13-20020ac8014d000000b002ddae786fb0so516244qtg.19
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 12:32:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=U2ubHgPrmh8MR1n+1PbtlqSxV6eATITrLbT20lAtpdI=;
 b=57wR9h4ZE9dJG+Qx3dYUijeq8gAFzQOhqyNbXvMmMILCCiKBxMNMqLKRtch3YN5uHl
 CqrT+jYQD47yzwivHPUKyUGrUpwhYk0kDVgqEr12NO+38XQYv+p9vc3SHup3w7h9KA/W
 d59Ofdh0uSx/8XIT+wvqmsOrOmiShO5HFihgjyzcIBjVLeOxlgN5YzR/OXymuWwPuL6F
 O8AUcRaTY4M/0eYXuTXzzwHlQbLqXRyNmCtWvogjGfbthluhwJHQBSszLyz/d30f4qFS
 vMePvq2hJ0PWcNWcI5rmQPQo4rqo1CEG/uFmly02WjDBMgn+cxHiDjXiBvK5iHXGH0kB
 1Uhw==
X-Gm-Message-State: AOAM530KrSbfUOBA0RRDHuhTOPFGlOcQwA/EQ4itxUTKthQx6JSfwQke
 1JYsBdpZ5bqsZl6pgJuORh16Fbwkr+YpxD9N8KIJEUkDGPD2ZniLgXakjzu+M/7+FQhfJrNxhsy
 qsScOmWtb5kAbxcDHQ3eeQ1lUZOle
X-Received: by 2002:a37:b8c4:0:b0:648:acd1:892a with SMTP id
 i187-20020a37b8c4000000b00648acd1892amr2863760qkf.743.1645734721723; 
 Thu, 24 Feb 2022 12:32:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBZAAiWwgM9xRBDJPR9c9MObQMOWmvfnas6Nn+RnXCCubFUHt2i1WczB05RyF7vM4SdkJcOg==
X-Received: by 2002:a37:b8c4:0:b0:648:acd1:892a with SMTP id
 i187-20020a37b8c4000000b00648acd1892amr2863709qkf.743.1645734721127; 
 Thu, 24 Feb 2022 12:32:01 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05622a024b00b002ddb43850fdsm242436qtx.15.2022.02.24.12.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 12:32:00 -0800 (PST)
Message-ID: <7243c037f5e74fda5060f7b96d46eca547745134.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Remove the unused header file nvif/list.h
From: Lyude Paul <lyude@redhat.com>
To: Cai Huoqing <cai.huoqing@linux.dev>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>,  linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  nouveau@lists.freedesktop.org
Date: Thu, 24 Feb 2022 15:31:59 -0500
In-Reply-To: <20220223021808.GA8457@chq-T47>
References: <20220209065322.43938-1-cai.huoqing@linux.dev>
 <20220223021808.GA8457@chq-T47>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Thanks for the ping!

Reviewed-by: Lyude Paul <lyude@redhat.com>

I will push this to drm-misc-next in a bit

On Wed, 2022-02-23 at 10:18 +0800, Cai Huoqing wrote:
> On 09 2月 22 14:53:19, Cai Huoqing wrote:
> > The nouveau driver depends on include/linux/list.h instead of
> > nvif/list.h, so remove the obstacle-nvif/list.h.
> > 
> > Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> > ---
> Ping :)
> >  drivers/gpu/drm/nouveau/include/nvif/list.h | 353 --------------------
> >  1 file changed, 353 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/list.h
> > 
> > diff --git a/drivers/gpu/drm/nouveau/include/nvif/list.h
> > b/drivers/gpu/drm/nouveau/include/nvif/list.h
> > deleted file mode 100644
> > index 8af5d144ecb0..000000000000
> > --- a/drivers/gpu/drm/nouveau/include/nvif/list.h
> > +++ /dev/null
> > @@ -1,353 +0,0 @@
> > -/*
> > - * Copyright © 2010 Intel Corporation
> > - * Copyright © 2010 Francisco Jerez <currojerez@riseup.net>
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaining
> > a
> > - * copy of this software and associated documentation files (the
> > "Software"),
> > - * to deal in the Software without restriction, including without
> > limitation
> > - * the rights to use, copy, modify, merge, publish, distribute,
> > sublicense,
> > - * and/or sell copies of the Software, and to permit persons to whom the
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including the
> > next
> > - * paragraph) shall be included in all copies or substantial portions of
> > the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > EXPRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > MERCHANTABILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
> > SHALL
> > - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > OTHER
> > - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > ARISING
> > - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> > DEALINGS
> > - * IN THE SOFTWARE.
> > - *
> > - */
> > -
> > -/* Modified by Ben Skeggs <bskeggs@redhat.com> to match kernel list APIs
> > */
> > -
> > -#ifndef _XORG_LIST_H_
> > -#define _XORG_LIST_H_
> > -
> > -/**
> > - * @file Classic doubly-link circular list implementation.
> > - * For real usage examples of the linked list, see the file test/list.c
> > - *
> > - * Example:
> > - * We need to keep a list of struct foo in the parent struct bar, i.e.
> > what
> > - * we want is something like this.
> > - *
> > - *     struct bar {
> > - *          ...
> > - *          struct foo *list_of_foos; -----> struct foo {}, struct foo
> > {}, struct foo{}
> > - *          ...
> > - *     }
> > - *
> > - * We need one list head in bar and a list element in all list_of_foos
> > (both are of
> > - * data type 'struct list_head').
> > - *
> > - *     struct bar {
> > - *          ...
> > - *          struct list_head list_of_foos;
> > - *          ...
> > - *     }
> > - *
> > - *     struct foo {
> > - *          ...
> > - *          struct list_head entry;
> > - *          ...
> > - *     }
> > - *
> > - * Now we initialize the list head:
> > - *
> > - *     struct bar bar;
> > - *     ...
> > - *     INIT_LIST_HEAD(&bar.list_of_foos);
> > - *
> > - * Then we create the first element and add it to this list:
> > - *
> > - *     struct foo *foo = malloc(...);
> > - *     ....
> > - *     list_add(&foo->entry, &bar.list_of_foos);
> > - *
> > - * Repeat the above for each element you want to add to the list.
> > Deleting
> > - * works with the element itself.
> > - *      list_del(&foo->entry);
> > - *      free(foo);
> > - *
> > - * Note: calling list_del(&bar.list_of_foos) will set bar.list_of_foos to
> > an empty
> > - * list again.
> > - *
> > - * Looping through the list requires a 'struct foo' as iterator and the
> > - * name of the field the subnodes use.
> > - *
> > - * struct foo *iterator;
> > - * list_for_each_entry(iterator, &bar.list_of_foos, entry) {
> > - *      if (iterator->something == ...)
> > - *             ...
> > - * }
> > - *
> > - * Note: You must not call list_del() on the iterator if you continue the
> > - * loop. You need to run the safe for-each loop instead:
> > - *
> > - * struct foo *iterator, *next;
> > - * list_for_each_entry_safe(iterator, next, &bar.list_of_foos, entry) {
> > - *      if (...)
> > - *              list_del(&iterator->entry);
> > - * }
> > - *
> > - */
> > -
> > -/**
> > - * The linkage struct for list nodes. This struct must be part of your
> > - * to-be-linked struct. struct list_head is required for both the head of
> > the
> > - * list and for each list node.
> > - *
> > - * Position and name of the struct list_head field is irrelevant.
> > - * There are no requirements that elements of a list are of the same
> > type.
> > - * There are no requirements for a list head, any struct list_head can be
> > a list
> > - * head.
> > - */
> > -struct list_head {
> > -    struct list_head *next, *prev;
> > -};
> > -
> > -/**
> > - * Initialize the list as an empty list.
> > - *
> > - * Example:
> > - * INIT_LIST_HEAD(&bar->list_of_foos);
> > - *
> > - * @param The list to initialized.
> > - */
> > -#define LIST_HEAD_INIT(name) { &(name), &(name) }
> > -
> > -#define LIST_HEAD(name) \
> > -       struct list_head name = LIST_HEAD_INIT(name)
> > -
> > -static inline void
> > -INIT_LIST_HEAD(struct list_head *list)
> > -{
> > -    list->next = list->prev = list;
> > -}
> > -
> > -static inline void
> > -__list_add(struct list_head *entry,
> > -                struct list_head *prev, struct list_head *next)
> > -{
> > -    next->prev = entry;
> > -    entry->next = next;
> > -    entry->prev = prev;
> > -    prev->next = entry;
> > -}
> > -
> > -/**
> > - * Insert a new element after the given list head. The new element does
> > not
> > - * need to be initialised as empty list.
> > - * The list changes from:
> > - *      head → some element → ...
> > - * to
> > - *      head → new element → older element → ...
> > - *
> > - * Example:
> > - * struct foo *newfoo = malloc(...);
> > - * list_add(&newfoo->entry, &bar->list_of_foos);
> > - *
> > - * @param entry The new element to prepend to the list.
> > - * @param head The existing list.
> > - */
> > -static inline void
> > -list_add(struct list_head *entry, struct list_head *head)
> > -{
> > -    __list_add(entry, head, head->next);
> > -}
> > -
> > -/**
> > - * Append a new element to the end of the list given with this list head.
> > - *
> > - * The list changes from:
> > - *      head → some element → ... → lastelement
> > - * to
> > - *      head → some element → ... → lastelement → new element
> > - *
> > - * Example:
> > - * struct foo *newfoo = malloc(...);
> > - * list_add_tail(&newfoo->entry, &bar->list_of_foos);
> > - *
> > - * @param entry The new element to prepend to the list.
> > - * @param head The existing list.
> > - */
> > -static inline void
> > -list_add_tail(struct list_head *entry, struct list_head *head)
> > -{
> > -    __list_add(entry, head->prev, head);
> > -}
> > -
> > -static inline void
> > -__list_del(struct list_head *prev, struct list_head *next)
> > -{
> > -    next->prev = prev;
> > -    prev->next = next;
> > -}
> > -
> > -/**
> > - * Remove the element from the list it is in. Using this function will
> > reset
> > - * the pointers to/from this element so it is removed from the list. It
> > does
> > - * NOT free the element itself or manipulate it otherwise.
> > - *
> > - * Using list_del on a pure list head (like in the example at the top of
> > - * this file) will NOT remove the first element from
> > - * the list but rather reset the list as empty list.
> > - *
> > - * Example:
> > - * list_del(&foo->entry);
> > - *
> > - * @param entry The element to remove.
> > - */
> > -static inline void
> > -list_del(struct list_head *entry)
> > -{
> > -    __list_del(entry->prev, entry->next);
> > -}
> > -
> > -static inline void
> > -list_del_init(struct list_head *entry)
> > -{
> > -    __list_del(entry->prev, entry->next);
> > -    INIT_LIST_HEAD(entry);
> > -}
> > -
> > -static inline void list_move_tail(struct list_head *list,
> > -                                 struct list_head *head)
> > -{
> > -       __list_del(list->prev, list->next);
> > -       list_add_tail(list, head);
> > -}
> > -
> > -/**
> > - * Check if the list is empty.
> > - *
> > - * Example:
> > - * list_empty(&bar->list_of_foos);
> > - *
> > - * @return True if the list contains one or more elements or False
> > otherwise.
> > - */
> > -static inline bool
> > -list_empty(struct list_head *head)
> > -{
> > -    return head->next == head;
> > -}
> > -
> > -/**
> > - * Returns a pointer to the container of this list element.
> > - *
> > - * Example:
> > - * struct foo* f;
> > - * f = container_of(&foo->entry, struct foo, entry);
> > - * assert(f == foo);
> > - *
> > - * @param ptr Pointer to the struct list_head.
> > - * @param type Data type of the list element.
> > - * @param member Member name of the struct list_head field in the list
> > element.
> > - * @return A pointer to the data struct containing the list head.
> > - */
> > -#ifndef container_of
> > -#define container_of(ptr, type, member) \
> > -    (type *)((char *)(ptr) - (char *) &((type *)0)->member)
> > -#endif
> > -
> > -/**
> > - * Alias of container_of
> > - */
> > -#define list_entry(ptr, type, member) \
> > -    container_of(ptr, type, member)
> > -
> > -/**
> > - * Retrieve the first list entry for the given list pointer.
> > - *
> > - * Example:
> > - * struct foo *first;
> > - * first = list_first_entry(&bar->list_of_foos, struct foo,
> > list_of_foos);
> > - *
> > - * @param ptr The list head
> > - * @param type Data type of the list element to retrieve
> > - * @param member Member name of the struct list_head field in the list
> > element.
> > - * @return A pointer to the first list element.
> > - */
> > -#define list_first_entry(ptr, type, member) \
> > -    list_entry((ptr)->next, type, member)
> > -
> > -/**
> > - * Retrieve the last list entry for the given listpointer.
> > - *
> > - * Example:
> > - * struct foo *first;
> > - * first = list_last_entry(&bar->list_of_foos, struct foo, list_of_foos);
> > - *
> > - * @param ptr The list head
> > - * @param type Data type of the list element to retrieve
> > - * @param member Member name of the struct list_head field in the list
> > element.
> > - * @return A pointer to the last list element.
> > - */
> > -#define list_last_entry(ptr, type, member) \
> > -    list_entry((ptr)->prev, type, member)
> > -
> > -#define __container_of(ptr, sample, member)                            \
> > -    (void *)container_of((ptr), typeof(*(sample)), member)
> > -
> > -/**
> > - * Loop through the list given by head and set pos to struct in the list.
> > - *
> > - * Example:
> > - * struct foo *iterator;
> > - * list_for_each_entry(iterator, &bar->list_of_foos, entry) {
> > - *      [modify iterator]
> > - * }
> > - *
> > - * This macro is not safe for node deletion. Use list_for_each_entry_safe
> > - * instead.
> > - *
> > - * @param pos Iterator variable of the type of the list elements.
> > - * @param head List head
> > - * @param member Member name of the struct list_head in the list
> > elements.
> > - *
> > - */
> > -#define list_for_each_entry(pos, head, member)                         \
> > -    for (pos = __container_of((head)->next, pos, member);              \
> > -        &pos->member != (head);                                        \
> > -        pos = __container_of(pos->member.next, pos, member))
> > -
> > -/**
> > - * Loop through the list, keeping a backup pointer to the element. This
> > - * macro allows for the deletion of a list element while looping through
> > the
> > - * list.
> > - *
> > - * See list_for_each_entry for more details.
> > - */
> > -#define list_for_each_entry_safe(pos, tmp, head, member)               \
> > -    for (pos = __container_of((head)->next, pos, member),              \
> > -        tmp = __container_of(pos->member.next, pos, member);           \
> > -        &pos->member != (head);                                        \
> > -        pos = tmp, tmp = __container_of(pos->member.next, tmp, member))
> > -
> > -
> > -#define list_for_each_entry_reverse(pos, head, member)                 \
> > -       for (pos = __container_of((head)->prev, pos, member);           \
> > -            &pos->member != (head);                                    \
> > -            pos = __container_of(pos->member.prev, pos, member))
> > -
> > -#define list_for_each_entry_continue(pos, head,
> > member)                        \
> > -       for (pos = __container_of(pos->member.next, pos, member);       \
> > -            &pos->member != (head);                                    \
> > -            pos = __container_of(pos->member.next, pos, member))
> > -
> > -#define list_for_each_entry_continue_reverse(pos, head,
> > member)                \
> > -       for (pos = __container_of(pos->member.prev, pos, member);       \
> > -            &pos->member != (head);                                    \
> > -            pos = __container_of(pos->member.prev, pos, member))
> > -
> > -#define list_for_each_entry_from(pos, head, member)                    \
> > -       for (;                                                          \
> > -            &pos->member != (head);                                    \
> > -            pos = __container_of(pos->member.next, pos, member))
> > -
> > -#endif
> > -- 
> > 2.25.1
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

