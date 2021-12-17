Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9003A478BDA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 13:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301CA10F279;
	Fri, 17 Dec 2021 12:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3190210EE79;
 Fri, 17 Dec 2021 12:56:10 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id a1so2399714qtx.11;
 Fri, 17 Dec 2021 04:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1mAS8EaoxQG8Ir2uPJ5ugilUa1XHg8/M6io3aAtHwlc=;
 b=WIP5VsRDkLvY42PliM570ikH+OYipXTFtDZWfPPreDMwfACRxXKYWmEUG8G29pPzxX
 7oI1JZVMlBZw31fOBVgiE39GxF16i6G29QGXUBrGQq8k3VWu7LG56IeEZmp6e/UcYvyk
 /qnwIosrSOcFmE23NGwPehlEDnByJvFSL7guhBLlF/M9x1iKGvK1+aHI7El+EDnRO1Ib
 PV2iCo2wza711uOcBvbprYf+kGZDG+4jrvTUg0tqL4wMSUZ9tuALrPKamYmTlHwF/lOM
 fgfu1kb0fLpnzZouLldARk/B94H8fz477/3vXd7p/vtkatTZk/jaGeO5kYNUM7v4MiDd
 jrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1mAS8EaoxQG8Ir2uPJ5ugilUa1XHg8/M6io3aAtHwlc=;
 b=wcRE2IQugtiAVcN2BlkKA8yEG8FNfo1eJOF8Ibr6pz6AenIMuK9tDSmfBEqUi7P/Yr
 C9sVK1LWj7BYjmjOcaxNlHIdmTTJiCn1LG+RtigNjuWSAZVXliARZFn1/5ThcePAqGtf
 aXlIWgC2RNMgrEITD9JL1PFdGyAVp4uu9eE6l17cUDklrm+maNFtCJ1fvyVJL+nI6APE
 aTLa4/H5KPOjBzooVQFlvZZW5sYWN8AYTU5QwJmWIG56lryt3I/4EHW8bDH70P3V1rgZ
 T8lk++nlyKyAKvZ660umpaerOuh7C8HIxVFLly5h58Tx7dSDRxtZZ++avgSU/ngLEp9b
 PPyQ==
X-Gm-Message-State: AOAM533l01MLwpBWx1Q2UX9b43UbyB+7ch2ra/yMWp6qvHrm2TPayfEX
 Bi+SuXba3HWoRiYAllwV6VVs/HFPye9KlqAun3Rc9k293FE=
X-Google-Smtp-Source: ABdhPJzlsU1QWheg0WxzDtCRG2FAZ5m7dwjXroDyueHzrDFhZAbBEizKVBf9PusTCp+pCJp5xcXOsTepnq8skRrBJt8=
X-Received: by 2002:ac8:4d87:: with SMTP id a7mr2109755qtw.410.1639745769403; 
 Fri, 17 Dec 2021 04:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
 <20211216142749.1966107-12-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211216142749.1966107-12-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 17 Dec 2021 12:55:42 +0000
Message-ID: <CAM0jSHNmJD4EY9f7dhEUnu+e-8+5xyK2LGuOJndXvpb9q3Jzrg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 11/17] drm/i915: Add ww ctx to
 i915_gem_object_trylock
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Dec 2021 at 14:28, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> This is required for i915_gem_evict_vm, to be able to evict the entire VM,
> including objects that are already locked to the current ww ctx.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
