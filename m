Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58380A99360
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 17:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E6610E199;
	Wed, 23 Apr 2025 15:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cDbjLwGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEEE10E199
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745423858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sh+sYc0+MNHSUal421oTmCDMNe+GTwBu1Zv/uziK5zE=;
 b=cDbjLwGo5joWRNKQhGM20ASzex57ptwvPCVYqhR/q3g777s9S7wmEI0rPX+71F60oGvb8y
 Wih2hLE6duD+W46fb++rxqe5YbPCd8beDiAyiCTh6/RfYLvWOL4jmEghQTLGwahDHPlWtr
 Ltu7frdpycokk/4gYhzniJDO2eTo6q0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-ccMGT4nCM7i8aVwg2bR5iw-1; Wed, 23 Apr 2025 11:57:36 -0400
X-MC-Unique: ccMGT4nCM7i8aVwg2bR5iw-1
X-Mimecast-MFC-AGG-ID: ccMGT4nCM7i8aVwg2bR5iw_1745423856
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5f3b94827so1009258085a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 08:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745423856; x=1746028656;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sh+sYc0+MNHSUal421oTmCDMNe+GTwBu1Zv/uziK5zE=;
 b=fDYmYoF5sc3CXVb5sClEokC4/IWY7bCKPYZlvFsVfYm/RVl2Us+qqMxNLQzdsr79eW
 VyFtg055QTJSAhzG1++C++hZ4e3bD9FpSYotr2ifzVjnqcO9q+5SNxGm1z0XbFwRzIo2
 wd1Vj8MjHHd191/KHHRuAYO4sEusrbiefswriDf6qmkPTRHkt7tmujadBVHVi7/pDWLw
 iFAgwnFIrmzcGNNVfXzIXfT3s3h33AiSR358mK1o1lt+2MSJnBm+mYsOPT3F14na2A/9
 2LwSRCaIObiXJCfS7RmZQq01CkbcL5TKJwypsvjdjykgp1nea5P86n9C+CIePhbnspuB
 ia6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYCS7ehGJLCw5PE/ROecKNA+UqxurBlxgQRfFXdfMXR3Xfzgk9581A/GlIy9TtQVaSC6ExdRgNogg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1Rj3SJDfNwvPQ9nf1F+B5yTniJeF8lBZX8ZqoZjYOyU4tPj3B
 32g/LGKMqKMpVm7emGKw65BennYgGXF7FYmAlMdqctpJX+UM0RQ3xIhItKhezHXxPSkmGl+EK3G
 00NQMj2A2pZDCT8J2elIQ+Nzk67ylj0EDctBvTYnmERfC/HtmiWbfc/1Yu5TgKDnaig==
X-Gm-Gg: ASbGncs/Pdt733vWUNPMPSYVGpAix8ZKsK+ycBu/gQG37nByBomGVRi1jDZRR4APH5R
 aUclP87T23qIeoSmBAhqJx59CubjU8fAwrXua9kyZ4tOQRvQzRi6PGH0h8cVijFgpNvt83Aqco6
 2XLzfw9Ns5Y/eOKKD71f3Lc3RREP82RNsG0ikR34i4TDUcXROOmoFBBwIwI54rDfp5d106cFtGs
 IThBdvcPmkeGcFf3oKO1NkUKVo4gk4VEOXxlWOkUpS0CkwNYGblvEfeSGRdsL/aeY1t0XFLX6Zt
 AafJev/jmirTdD7dpQMh1sNLAOPPCLlqAFQKm7z1D7Q=
X-Received: by 2002:a05:620a:414e:b0:7c5:55c0:db9b with SMTP id
 af79cd13be357-7c955e14742mr15096285a.58.1745423855995; 
 Wed, 23 Apr 2025 08:57:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIWB7Ovf66R3odop/eHj81SRynR7IlhrgKznJ816AeoHzYOpFR49dK5BzR9wKwh5ZqiuAyNQ==
X-Received: by 2002:a05:620a:414e:b0:7c5:55c0:db9b with SMTP id
 af79cd13be357-7c955e14742mr15093785a.58.1745423855655; 
 Wed, 23 Apr 2025 08:57:35 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c925a6eb60sm698231385a.24.2025.04.23.08.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 08:57:35 -0700 (PDT)
Date: Wed, 23 Apr 2025 08:57:32 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
 mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] dma-buf: heaps: Use constant name for CMA heap
Message-ID: <aAkN7BXIT7RR85PR@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <20250422191939.555963-1-jkangas@redhat.com>
 <CAO_48GELW3ax5Q3h9=qpWBJJa0Uy3eJwFkEcbaz4ZT56Gq513A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAO_48GELW3ax5Q3h9=qpWBJJa0Uy3eJwFkEcbaz4ZT56Gq513A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rQ1eGhwXyZ_S-BXEVIqJxzFuFFS9KhajZPmEz50l3Sw_1745423856
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sumit,

On Wed, Apr 23, 2025 at 08:53:20PM +0530, Sumit Semwal wrote:
> Hello Jared,
> 
> On Wed, 23 Apr 2025 at 00:49, Jared Kangas <jkangas@redhat.com> wrote:
> >
> > Hi all,
> >
> > This patch series is based on a previous discussion around CMA heap
> > naming. [1] The heap's name depends on the device name, which is
> > generally "reserved", "linux,cma", or "default-pool", but could be any
> > arbitrary name given to the default CMA area in the devicetree. For a
> > consistent userspace interface, the series introduces a constant name
> > for the CMA heap, and for backwards compatibility, an additional Kconfig
> > that controls the creation of a legacy-named heap with the same CMA
> > backing.
> >
> > The ideas to handle backwards compatibility in [1] are to either use a
> > symlink or add a heap node with a duplicate minor. However, I assume
> > that we don't want to create symlinks in /dev from module initcalls, and
> > attempting to duplicate minors would cause device_create() to fail.
> > Because of these drawbacks, after brainstorming with Maxime Ripard, I
> > went with creating a new node in devtmpfs with its own minor. This
> > admittedly makes it a little unclear that the old and new nodes are
> > backed by the same heap when both are present. The only approach that I
> > think would provide total clarity on this in userspace is symlinking,
> > which seemed like a fairly involved solution for devtmpfs, but if I'm
> > wrong on this, please let me know.
> 
> Thanks indeed for this patch; just one minor nit: the link referred to
> as [1] here seems to be missing. Could you please add it? This would
> make it easier to follow the chain of discussion in posterity.

My bad, I must have dropped the link while revising the cover letter.
Here's the dropped reference:

[1]: https://lore.kernel.org/all/f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com/

Thanks to you and John for looking this over,
Jared

> >
> > Changelog:
> >     v2: Use tabs instead of spaces for large vertical alignment.
> >
> > Jared Kangas (2):
> >   dma-buf: heaps: Parameterize heap name in __add_cma_heap()
> >   dma-buf: heaps: Give default CMA heap a fixed name
> >
> >  Documentation/userspace-api/dma-buf-heaps.rst | 11 ++++---
> >  drivers/dma-buf/heaps/Kconfig                 | 10 +++++++
> >  drivers/dma-buf/heaps/cma_heap.c              | 30 ++++++++++++++-----
> >  3 files changed, 40 insertions(+), 11 deletions(-)
> >
> > --
> > 2.49.0
> >
> 
> Best,
> Sumit
> 

