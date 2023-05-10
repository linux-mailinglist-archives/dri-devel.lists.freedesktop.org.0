Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AC16FD8C9
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 09:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB4010E457;
	Wed, 10 May 2023 07:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5901510E457
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 07:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683705575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3/9nnngYYqam7MPTuM3Ht0cvsBkgeG4Vc0MoiGof8Vg=;
 b=C9ScDEIIiy62olZrbaYwA1BpaDPjQiUex0sLP1xtGB4d1wbVAz0UiFFW28Bn0DHFk4JVr6
 jFiaSJdtJXGZF60OD6YQdGWJzbz5bOsEGXx8xO1okwdHUyfrmB9KK2YNy9+4MWAez19rsO
 yLiEQbt13+t4FtYkk20zsp0UD2FchbM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-5-x33EdjNnC_lQBwABekCA-1; Wed, 10 May 2023 03:59:26 -0400
X-MC-Unique: 5-x33EdjNnC_lQBwABekCA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50a16ab50e6so6470448a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 00:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683705565; x=1686297565;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/9nnngYYqam7MPTuM3Ht0cvsBkgeG4Vc0MoiGof8Vg=;
 b=Ojj2odHf3svUoYSVeiypSu70+O5VfScKNStWwMJONzWg8BFkxMnLWIBUP8PvevxEOp
 3Prnxzk9m+A1o0/PJmEVsKcpnncY1+MVxELIwLzlPYkD+43t9W6bEgXZhmEX4QYHlwSH
 /BCTg9yGc/TtvGPvzVaguiZlm10SlO0EJDJDPmfCuaHZBVIVUlbqdW4wF8SU2opp+w3H
 nJHVnBJUtEgTkqQ147hAy+UBuSprNwYI40K1RUlPvS3aXgz0BuoleuMnubLY3OWUpOxh
 z3L4BQi0Nk+3po+DKB52zpRD8UUcFy4D/gLsQ2Ip/JHpx9bVXqkVQDZ3Y7F/i5qtvcJY
 bCuw==
X-Gm-Message-State: AC+VfDwcjd9TiriCsYSiZa3q9DdQbVXT34Cbzg7llk1fT53bpAM9cBC7
 1VbYiUCweZTdSIABn8BmHPrGdy3kVUlXxAF3q5x7rcj7bxH8k12nFe8hnN5kUvN+z9T7jGtSIwA
 7kDnOkT44lfJoJ2zrGqKEB6qGfNP0
X-Received: by 2002:a17:907:9347:b0:933:3814:e0f4 with SMTP id
 bv7-20020a170907934700b009333814e0f4mr15283675ejc.16.1683705565636; 
 Wed, 10 May 2023 00:59:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ45B9Gxo7aSbsTJDh1kGg2lct+suP4q8Trx1Zg5h1wxnn/44jAtAqXVpXsyJ/aRC0+bkIG8Uw==
X-Received: by 2002:a17:907:9347:b0:933:3814:e0f4 with SMTP id
 bv7-20020a170907934700b009333814e0f4mr15283648ejc.16.1683705565325; 
 Wed, 10 May 2023 00:59:25 -0700 (PDT)
Received: from redhat.com (host-95-193-100-112.mobileonline.telia.com.
 [95.193.100.112]) by smtp.gmail.com with ESMTPSA id
 y2-20020a056402134200b00504ecc4fa96sm1553224edw.95.2023.05.10.00.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 00:59:24 -0700 (PDT)
Date: Wed, 10 May 2023 09:59:21 +0200
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <ZFtO2bMQOWVhRkSG@redhat.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
 <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
 <e903d920-788f-7d70-c6f0-1faaac3c9843@amd.com>
 <CAPM=9tyOFhE0zC8540KBOkDaZE1c3zTtke_vX=DEkMTmo04A4Q@mail.gmail.com>
 <QL28tg_ZcXPQ1W5l8Hp3rDlvyKuMh09kjGHpj1GRKVrMqlB-hNI2F6FzRSP-NyfkMpk6tsO55t8UYF6Uk9b7IF1O1BHH1WKc88kNTgY2Ugk=@emersion.fr>
MIME-Version: 1.0
In-Reply-To: <QL28tg_ZcXPQ1W5l8Hp3rDlvyKuMh09kjGHpj1GRKVrMqlB-hNI2F6FzRSP-NyfkMpk6tsO55t8UYF6Uk9b7IF1O1BHH1WKc88kNTgY2Ugk=@emersion.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
 Pekka Paalanen <pekka.paalanen@collabora.com>, Aleix Pol <aleixpol@kde.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 08:22:30PM +0000, Simon Ser wrote:
> On Tuesday, May 9th, 2023 at 21:53, Dave Airlie <airlied@gmail.com> wrote:
> 
> > There are also other vendor side effects to having this in userspace.
> > 
> > Will the library have a loader?
> > Will it allow proprietary plugins?
> > Will it allow proprietary reimplementations?
> > What will happen when a vendor wants distros to ship their
> > proprietary fork of said library?
> > 
> > How would NVIDIA integrate this with their proprietary stack?
> 
> Since all color operations exposed by KMS are standard, the library
> would just be a simple one: no loader, no plugin, no proprietary pieces,
> etc.
> 

There might be pipelines/color-ops only exposed by proprietary out of
tree drivers; the operation types and semantics should ideally be
defined upstream, but the code paths would in practice be vendor
specific, potentially without any upstream driver using them. It should
be clear whether an implementation that makes such a pipeline work is in
scope for the upstream library.

The same applies to the kernel; it must be clear whether pipeline
elements that potentially will only be exposed by out of tree drivers
will be acceptable upstream, at least as documented operations.


Jonas

