Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE5092FCEF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 16:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D89E10E03B;
	Fri, 12 Jul 2024 14:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="e3knj9zw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A1310E03B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720796030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H03nXr4hza2PKemh9fjDZhk1nYAQUKJ0uHQmzsJryOY=;
 b=e3knj9zweYzkyqag16b+dtMkfb4CeQzdiIV9W5sQ01q4TgPTodcT/PeMh1T29hwTnxhwEK
 zt3/Qdd4n2GPh2r6DAc3MFvRtfZU3UM3u8xYUN/P9+KXc3auNPbeke1l8E8j710ek+vGYu
 +yVlQgTu+I2OKevlRYDZ9OPqJ81ALCw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-9vkNW9IeN_KcoiL92H6A-Q-1; Fri, 12 Jul 2024 10:53:49 -0400
X-MC-Unique: 9vkNW9IeN_KcoiL92H6A-Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-367991a0a64so1144579f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 07:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720796028; x=1721400828;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H03nXr4hza2PKemh9fjDZhk1nYAQUKJ0uHQmzsJryOY=;
 b=dH8T4ObJVFfn09eW02xCDgDxVxLeXQdfwnBEyID4z54/e2ZnfAHqpBAOjSwnEu27vN
 xtMDVWqT0T3bkSp91q2bYazTPDoFo/O93tj/koeDEk9ecbTnx6D5ffWcX4Cno1LBVpC3
 YJDqnlNAvLchh2FmOp9qI2KUCiT8hmZBWnvIhv233/XW2e5HMYG6C47LEHnaoT+uYqy3
 pl6awj8/qTTza3xy4I+4dCWbgUut7oD2txpLrGpn4iYOR3oK6d0idk8g3hswQ1BKgWcG
 xsK8BydkQaEYEhluIlWuxmZUKK9SS77WAvrD2RBZXtdbgPgLg6phWq3FsW+/RPu7Hc6j
 prQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9QAhy3lqo7UkE5XO1Ip3C5tk1q6vTcdJqFk6V0gZdP6yiV2XroVuzra/ifZGxBBJe9rS1MZU9IJcNn6NKwk/bX/H+0I2lJ3Cu63M1Ab56
X-Gm-Message-State: AOJu0YweiJUFFRtqOaCGtjP2haXz4tqmQ/gYDXP/3MzPtO0iYvpN7XTF
 +aEpASJxEFZVL8E2F9Nodkv7YzHsQdyZHRDVw51FBWEQhGZ43XF2I4VVV8jRgyuoXke7xxK/0eI
 CHAzKNFCGbkYE3mNYBoPAz1BygNg8/TniBr7cREhXiOm1hX+sWglo4Arlp5bCIHivrfruEdOWRw
 ==
X-Received: by 2002:a05:6000:d82:b0:367:96c5:ae70 with SMTP id
 ffacd0b85a97d-367cea91ff7mr7290425f8f.31.1720796028050; 
 Fri, 12 Jul 2024 07:53:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiO0uAs6JxUgrGSU2IZ4WL5eybEQVI96YsUpsBbrQEUNfgqnCbo/oj/8KRpKxRv5+wT8B4bQ==
X-Received: by 2002:a05:6000:d82:b0:367:96c5:ae70 with SMTP id
 ffacd0b85a97d-367cea91ff7mr7290404f8f.31.1720796027710; 
 Fri, 12 Jul 2024 07:53:47 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:a4d3:4896:56d4:f050])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7df48sm10448458f8f.1.2024.07.12.07.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 07:53:47 -0700 (PDT)
Date: Fri, 12 Jul 2024 16:53:45 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org,
 lyude@redhat.com, robh@kernel.org, lina@asahilina.net,
 mcanal@igalia.com, airlied@gmail.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
Message-ID: <ZpFDeajsuVONbSYJ@cassiopeiae>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
MIME-Version: 1.0
In-Reply-To: <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 12, 2024 at 11:35:25AM -0300, Daniel Almeida wrote:
> Hi Steven, thanks for the review!
> 
> > 
> > This is defining the ABI to userspace and as such we'd need a way of
> > exporting this for userspace tools to use. The C approach is a header in
> > include/uabi. I'd also suggest making it obvious this enum can't be
> > rearranged (e.g. a comment, or assigning specific numbers). There's also
> > some ABI below which needs exporting in some way, along with some
> > documentation (comments may be sufficient) explaining how e.g.
> > header_size works.
> > 
> 
> I will defer this topic to others in the Rust for Linux community. I think this is the first time this scenario comes up in Rust code?
> 
> FYI I am working on a tool in Mesa to decode the dump [0]. Since the tool is also written in Rust, and given the RFC nature of this patch, I just copied and pasted things for now, including panthor_regs.rs.
> 
> IMHO, the solution here is to use cbindgen to automatically generate a C header to place in include/uapi. This will ensure that the header is in sync with the Rust code. I will do that in v2.

You could also just define those structures in a C header directly and use it
from Rust, can't you?

