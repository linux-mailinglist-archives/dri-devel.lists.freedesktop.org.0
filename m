Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE3213D219
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 03:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36936EBB2;
	Thu, 16 Jan 2020 02:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1C76EBB2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 02:17:53 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C949D222C3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 02:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579141072;
 bh=hoIxnRsUwzxsmDarRBbyDjL6UhOhTEmbX9UnaM74Tl4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aYSyjnona74l0SEU5R4MCKml7ZmVWcI1myz9TbJ3O4dV6COP8GkEQFb9ORWWIZWU+
 l57wQgCSJZ+2VJEcPQP1Pj/l9iGFaKoUvaQNGij6m9p5AFRJ8xPeby7r2uNJm7xEz0
 CTfIM/IfMVyge/lzgg34soA9uRlfiYdoqvaVvRm4=
Received: by mail-qt1-f173.google.com with SMTP id c24so6868972qtp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 18:17:52 -0800 (PST)
X-Gm-Message-State: APjAAAWxTco1k4iyzH3kdtlvXVs5NLkBThXZ1rf5qMOTHfwjXxMzwSpS
 Xzzbo5Sf60d5JXfV/Mwzk+/zPceExFbtHueSWQ==
X-Google-Smtp-Source: APXvYqzbF1ZZQ2eDagIWtfd2TC0RXcxxs6M9zovGiyzCqCaz6D/URRn9dijYiiAZTENJi0hl7+oPnCZDHj946Iczqw0=
X-Received: by 2002:aed:2344:: with SMTP id i4mr305900qtc.136.1579141071920;
 Wed, 15 Jan 2020 18:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20200116021456.14262-1-robh@kernel.org>
In-Reply-To: <20200116021456.14262-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Jan 2020 20:17:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKFKAnW7z7C=MibDdem-x+x-C8F+OC3NjL3WOpuK+501w@mail.gmail.com>
Message-ID: <CAL_JsqKFKAnW7z7C=MibDdem-x+x-C8F+OC3NjL3WOpuK+501w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panfrost: Add the panfrost_gem_mapping concept
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 15, 2020 at 8:14 PM Rob Herring <robh@kernel.org> wrote:
>
> From: Boris Brezillon <boris.brezillon@collabora.com>
>
> With the introduction of per-FD address space, the same BO can be mapped
> in different address space if the BO is globally visible (GEM_FLINK)
> and opened in different context or if the dmabuf is self-imported. The
> current implementation does not take case into account, and attaches the
> mapping directly to the panfrost_gem_object.
>
> Let's create a panfrost_gem_mapping struct and allow multiple mappings
> per BO.
>
> The mappings are refcounted which helps solve another problem where
> mappings were torn down (GEM handle closed by userspace) while GPU
> jobs accessing those BOs were still in-flight. Jobs now keep a
> reference on the mappings they use.
>
> v2 (robh):
> - Minor review comment clean-ups from Steven
> - Use list_is_singular helper
> - Just WARN if we add a mapping when madvise state is not WILLNEED.
>   With that, drop the use of object_name_lock.
>
> v3 (robh):
> - Revert returning list iterator in panfrost_gem_mapping_get()

Ignore this one...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
