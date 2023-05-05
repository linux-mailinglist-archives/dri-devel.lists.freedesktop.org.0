Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B826F89E1
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 21:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA9410E665;
	Fri,  5 May 2023 19:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F4310E665
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 19:54:01 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5068638856dso526568a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 12:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1683316439; x=1685908439;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FO+OpIt5vjN5h9Zkn7NXwdU1u7IZzTnzRrar/P6yDW4=;
 b=f6sk0x2lVF1nq3EJ5b5K+BN8/8vCl3cRf8e5n9kWcvKWz1wS/nFIvj3y7IR7WZRgPi
 GhuMhJHRrqqqkLmXV437VpkAz1UfzoBztlx1+YB5h4Fz3NEYVtjGi4gaY6ogfun+cms7
 q6Gin9pBpAW1n8IS8wlhA3B1ce1ObPySDNUKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683316439; x=1685908439;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FO+OpIt5vjN5h9Zkn7NXwdU1u7IZzTnzRrar/P6yDW4=;
 b=Y3RlCFkOCrKGQ2jCJPw77KJfdEWj6yJcKj1qwSwnD61qR1YcLP+/CQ6sxL2OsklMv6
 cFvupBhHw46SPuHI8oQxEQfFu0A2vcrhsxVbpyFARSvcI2SwASEJTaps5DCxjBbLZmjA
 QEorB4H0jdf4sJfu1t9YHIRmi9zoUCzQOUuZ2PkjR/LZIg7qmiVTWo5R4Lm48SLkWwR3
 DcvinhLAB3X6keKZRIT0xtnfUWetzN77GmRQBM2V4mhZNKi2pW1q7UPB40uP9TmvdFbv
 G4HaAQz7/9y23ftlAsRaMA3ZbIUQQAygDESoWtDbe3ejbMY5+ltAGmIERa0YJNgp+qHl
 i4Pg==
X-Gm-Message-State: AC+VfDwNZW7TBZF420hJBqfrruI8S89KhiOxiqxjijHAvbT9Fvhg96UJ
 41u5ykXrK5QL5pqUTcQp5Hl7RA==
X-Google-Smtp-Source: ACHHUZ78IqlwCXHIp5BMrovQm1CzXf398xW7VQs5WXtdT7qw3K0ZSAlk5sGHNrWnJCHizT0eTWNxPA==
X-Received: by 2002:a05:6402:5242:b0:504:853a:85c0 with SMTP id
 t2-20020a056402524200b00504853a85c0mr2706834edd.0.1683316439037; 
 Fri, 05 May 2023 12:53:59 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 f12-20020a05640214cc00b005068fe6f3d8sm3221520edx.87.2023.05.05.12.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 12:53:58 -0700 (PDT)
Date: Fri, 5 May 2023 21:53:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <ZFVe1EPIV65ZpaQv@phenom.ffwll.local>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <ZFUgnMI4IIbv78By@phenom.ffwll.local>
 <-srJIIP1y4EoWtJAfk4_EaRpo7i2x1lXu0HKX4wLHcsmMfnrCdMb0EpPHOdedfZitFpdxIl3rDjBceq_UtYhQSIyJmNMVase-Oa9iP-RQ2o=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <-srJIIP1y4EoWtJAfk4_EaRpo7i2x1lXu0HKX4wLHcsmMfnrCdMb0EpPHOdedfZitFpdxIl3rDjBceq_UtYhQSIyJmNMVase-Oa9iP-RQ2o=@emersion.fr>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 04:06:26PM +0000, Simon Ser wrote:
> On Friday, May 5th, 2023 at 17:28, Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > Ok no comments from me on the actual color operations and semantics of all
> > that, because I have simply nothing to bring to that except confusion :-)
> > 
> > Some higher level thoughts instead:
> > 
> > - I really like that we just go with graph nodes here. I think that was
> >   bound to happen sooner or later with kms (we almost got there with
> >   writeback, and with hindsight maybe should have).
> 
> I'd really rather not do graphs here. We only need linked lists as Sebastian
> said. Graphs would significantly add more complexity to this proposal, and
> I don't think that's a good idea unless there is a strong use-case.

You have a graph, because a graph is just nodes + links. I did _not_
propose a full generic graph structure, the link pointer would be in the
class/type specific structure only. Like how we have the plane->crtc or
connector->crtc links already like that (which already _is_ is full blown
graph).

Maybe explain what exactly you're thinking under "do graphs here" so I
understand what you mean differently than me?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
