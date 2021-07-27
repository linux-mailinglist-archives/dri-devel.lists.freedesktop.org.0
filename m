Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D0D3D835C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 00:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9BB6EB1A;
	Tue, 27 Jul 2021 22:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18DE6EB1A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 22:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627425877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DK7QOr93tpO6ZeVlMj41CdryUvlpzzBljDxRIdRpu00=;
 b=OayZwgQXmEtiKz725g+MmQ9ZMSr80vsuqj/ZwNYS8zf2E/h2akNdlyvqv7iH493nwOtsoj
 jes0rJGHtPQTztT+IeVIPGoBP0nHieKuMjfyih+oJVWoA6yCRkbtditQ3TntVbcesyaALE
 BQGS/bA+JCvIpiWPWd8aRUe40PzS34w=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-5kP7l9smMd2wD_Alv7vUyg-1; Tue, 27 Jul 2021 18:44:36 -0400
X-MC-Unique: 5kP7l9smMd2wD_Alv7vUyg-1
Received: by mail-qk1-f197.google.com with SMTP id
 h5-20020a05620a0525b02903b861bec838so404060qkh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 15:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=DK7QOr93tpO6ZeVlMj41CdryUvlpzzBljDxRIdRpu00=;
 b=HcWfWcaPA1vvhYsrLVfx2OwadECqrz71fpB0BmToVYeMhl3ls/lyyoLphiE59dHUle
 kQqT28fMcZFyBjFd+fqBxzVrH5ESV65HY6iBJ2GdKh3EgE8kvkgDMQS9NfWj+LL8+dIL
 NOmYVR1ns2EqbvORdE2dHGWfLfeuON496XzvtbEUsAVye+RqiMOBebzLgo5t1ScWrwbA
 184ooC8NpIQd7dT5B0vHXVJLaVz5OUrnEJTR0szBc6F0+XvnBhwT54rX8N+Csa72b+bj
 6/evqcLyEibgP+GPwNAYCqQtlmY7TtzNqvbbOkzQhZh/b4YWLNM+ABfoJZaTEeC03E66
 Nc2Q==
X-Gm-Message-State: AOAM531kbfV1E0o+sh6U3sKKdtuZ8JAkMzIHQUOSaCrdhYQXanVLp7Hq
 HOoUaoqWYJ/zk1Md56M1YNc09lO/pCfDZwxHo990U1ijmtwVjYiV73s2UMik0rqulKmfa2HD4mJ
 Cw9hF/DPC+yT9q7AatMA/ofNS/yL0
X-Received: by 2002:a37:a58f:: with SMTP id
 o137mr24235542qke.451.1627425876355; 
 Tue, 27 Jul 2021 15:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGj2G2MLvOCQdZF7LANv0fXdRF2QJsKwLJaBjD7XP2EqW1YquS1Ayo6QYNoe1V968s25GfaQ==
X-Received: by 2002:a37:a58f:: with SMTP id
 o137mr24235523qke.451.1627425876205; 
 Tue, 27 Jul 2021 15:44:36 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id s3sm2051101qtn.4.2021.07.27.15.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 15:44:35 -0700 (PDT)
Message-ID: <e725235a77935184cd20dab5af55da95b28d9e88.camel@redhat.com>
Subject: Re: [PATCH v3] drm/dp_mst: Fix return code on sideband message failure
From: Lyude Paul <lyude@redhat.com>
To: khsieh@codeaurora.org
Date: Tue, 27 Jul 2021 18:44:34 -0400
In-Reply-To: <696a009e2ab34747abd12bda03c103c7@codeaurora.org>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <87zguy7c5a.fsf@intel.com>
 <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
 <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
 <d9ec812b4be57e32246735ca2f5e9560@codeaurora.org>
 <79c5a60fc189261b7a9ef611acd126a41f921593.camel@redhat.com>
 <696a009e2ab34747abd12bda03c103c7@codeaurora.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
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
Cc: rnayak@codeaurora.org, tzimmermann@suse.de, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 aravindh@codeaurora.org, sean@poorly.run, rsubbia@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nice timing, you literally got me as I was 2 minutes away from leaving work
for the day :P. I will go ahead and push it now.

BTW - in the future I recommend using dim to add Fixes: tags as it'll add Cc:
to stable as appropriate (this patch in particular should be Cc:
stable@vger.kernel.org # v5.3+). will add these tags when I push it

On Tue, 2021-07-27 at 15:41 -0700, khsieh@codeaurora.org wrote:
> On 2021-07-27 12:21, Lyude Paul wrote:
> > On Thu, 2021-07-22 at 15:28 -0700, khsieh@codeaurora.org wrote:
> > > 
> > > It looks like this patch is good to go (mainlined).
> > > Anything needed from me to do?
> > > Thanks,
> > 
> > Do you have access for pushing this patch? If not let me know and I can 
> > go
> > ahead and push it to drm-misc-next for you.
> no, I do not have access to drm-misc-next.
> Please push it for me.
> Thanks a lots.
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

