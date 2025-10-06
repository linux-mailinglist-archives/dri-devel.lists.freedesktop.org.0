Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87646BBFB19
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 00:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA4D10E0C4;
	Mon,  6 Oct 2025 22:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hbNEKZQf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A3710E27C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 22:29:26 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4db0b56f6e7so58788601cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759789765; x=1760394565; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NVmyDp3clLGLS8kIW7yJXXQisPoyp+nIoQv6rloL8GA=;
 b=hbNEKZQfvA+2vxNaLnQTqynoyWqUT5deE3mZ2pC3Ug8lGSATExKxWOIfMH0JgNW5Ze
 JQQyx0RQW25E0yggkSfQGfM0csra7fS6r4yhDdpg8NGbFwRb7PbUXoAXgm7msPEyPFDm
 JAn0pO18ct5jf/JvrcVP5ZQ8+orN9L5aUi4qO9A7ROMKxV7N2z6htcS2u7rcoLE/otbx
 J/PxthuzngZhcI8XC/TQnfF9IsdnFtTAbb2+fswZwz8Zk6WETzEjhYitM/4adS3aX5v0
 24jk6CFfEpBivXEQL1ziBSJCoIN/J8kFT8eTcc/KbF719FtAKbYs3GLW7FZvMuo/5BQs
 WMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759789765; x=1760394565;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NVmyDp3clLGLS8kIW7yJXXQisPoyp+nIoQv6rloL8GA=;
 b=D/XLtY4wgj0shZF5InqlJqYCZ6iAd1+cSEJzCFSbxMHJWZufnmdlLrTcHt0w3qiUbe
 O5nAgSQfUl+3yOdY+v5YYyYKDVKsnmlsqcklDnLlrjuyT4dU6VqYIIvbkXNBOnMNfkJk
 Nc3eD99ibGPpUFgjMCmaf0oJGatWIOHp/TZ3yhbIQ9ywABDU+XmbG9Hjx2vVqReM2me4
 oLdvWN94Td7MB0290Wim8OCJSYuEXTb9se66ZWPppiZXOLNzMMmLh16qhyY4wGA1rTka
 nr192kOi7rU4tGpjNKQa6H3Cso0wkuNRh3Ot4rZcMmD5phswcq5JtNd7D7thQeK6y7ZY
 ac0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqP2e/7Tzdglix/GasGAbDVzQfFVotq++vwvmflolyOo+7oYLpQ+9x32UKB3M5Bq/qRGsX1ivg/mQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLWpPUi6RLvNFZiJz/KutMQft5fj/u8lJJ9HippaqKyz5BV7mb
 zD7ZSFBrSTzKB9Ec0ks4OCrFV4ri+mCea0jPg0W94e1LOnUCbkU4hLV6
X-Gm-Gg: ASbGncuhSu+RiL1d+IercmwuTA7v+TyQIlJ7HshdxZfKSfEWMqTt9mrVx1iHIljmBlr
 4OHw4JXejUJF9L6iurZ81HYBGiJtAgpnRJqtAcHvPPjLelrwaYRcGrO3Yl7bXfbkUvXthL2ZeAM
 aAPzE+FGcJquSnHlqQovX2AT8CNdCF8CDDPrsk6v3m7yinV8oVALnSuKNqG0Zt85UCgvIWkm343
 /oAe/dfSG/gzzr3FmVlG5Ct1D8O57fZMxmMu5icdfjoMa7ne1JgReePwWoWU7ll/kF22AR+7iU5
 FkQHbULh2AkMpVwXZJ3Wjz6ZtUckMxHBEww/sbUOJbhglLxE6JDo/cMx5sH7X6PPpxe5D9Iupy/
 cvELc+RIVjJVjFiDUecTOVDb3K+6irOZkCXk4+zTgGJM=
X-Google-Smtp-Source: AGHT+IHPqikPMwG5q0hEpff7no1z9szaNg+f/yIWTC45aDjchAEueYobJpT+cU5Ru6SV8Xq4v0V8Ug==
X-Received: by 2002:a05:622a:1807:b0:4ab:6e3d:49b4 with SMTP id
 d75a77b69052e-4e6de794646mr17493561cf.7.1759789765354; 
 Mon, 06 Oct 2025 15:29:25 -0700 (PDT)
Received: from localhost ([12.22.141.131]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e55c9e77bcsm131484451cf.24.2025.10.06.15.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 15:29:23 -0700 (PDT)
Date: Mon, 6 Oct 2025 18:29:21 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Message-ID: <aORCwckUwZspBMfv@yury>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003154748.1687160-1-joelagnelf@nvidia.com>
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

On Fri, Oct 03, 2025 at 11:47:43AM -0400, Joel Fernandes wrote:
> Hello!
> 
> These patches extract and enhance the bitfield support in the register macro in
> nova to define Rust structures with bitfields. It then moves out the bitfield
> support into the kenrel crate.
> 
> Since v5, I dropped several patches and only kept the simple ones that do code
> movement, added a few features and added a KUNIT test. After Alex's bounded
> integer [1] support is in, we can rewrite the dropped patches.
> 
> I also dropped the MAINTAINER entry for now, pending more clarity around that.
> I am happy to maintain it, but I need more input on who all will co-maintain,
> now that the last 4 patches were dropped. Perhaps we can maintain it was a part
> of the core rust-for-linux? I suggest let us create the maintainer entry once
> Alex's bounded integer support is integrated but I am open to suggestions.
> 
> Here are the v5 patches [2].
> 
> [1] https://lore.kernel.org/all/20251002-bounded_ints-v1-0-dd60f5804ea4@nvidia.com/
> [2] https://lore.kernel.org/all/20250930144537.3559207-1-joelagnelf@nvidia.com/

Hi Joel,

I returned back to v5 today to just find that you have posted a v6.

There's just 3 days between the versions, and I'm pretty sure most
people were not able to even read the material. Moreover, there's
an -rc1 window ongoing, which means that people may be busy.

You're still receiving feedback to v5, and this makes even more mess
because now I'm completely lost about what I should review and what
should ignore.

Please allow a usual 2 weeks between versions to let people have
a chance to give you a valuable feedback.

It seems that you decided to drop some material, comparing to v5, but
don't even notice what exactly has been removed, except that vague
"code movement and few features" notice.

Regardless, I don't think that this is the right path to move the
bitfields into the core. The natural path for a feature that has
been originally developed on driver side is to mature in there and
get merged to core libraries after a while. Resctrl from Intel is one
recent example.

With that said, I'm OK if you move the bitfields as a whole, like you
do in v5, and I'm also OK if you split out the part essential for nova
and take it into the driver. In that case the bitfields will stay in 
drivers and you'll be able to focus on the features that _you_ need,
not on generic considerations.

I'm not OK to move bitfields in their current (v6) incomplete form in
rust/kernel. We still have no solid understanding on the API and
implementation that we've been all agreed on.

On maintenance: no core functionality can be merged unmaintained - it's
a strict rule. While in drivers, bitfields are maintained by the nova
maintainers as part of the driver. If you make it a generic library,
you need to define a responsible person(s) in advance. It's also a good
practice to add a core maintainer as a reviewer or co-maintainer. Alice
and Burak added me for bitmap/rust because I already look after bitmaps
in C. You can do the same for bitfields, for the same reason.

It looks like you have some offline discussions on the bitfields.
(Particularly with me.) Before we move forward, can you please wrap
up all the input you've got, so we'll all be sure that we are on the
same page. Right now the process look really messy.

Thanks,
Yury
