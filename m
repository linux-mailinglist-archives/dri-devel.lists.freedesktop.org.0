Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3860C6A1B60
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 12:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC5C10E5CF;
	Fri, 24 Feb 2023 11:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADF510E8B2;
 Fri, 24 Feb 2023 11:24:58 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id y14so6707319ljq.4;
 Fri, 24 Feb 2023 03:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sj8+res0hlMLAha2Od6VzO8IHzQal7RF12YPvzFFXJU=;
 b=OnDelbJjjAWuz026a2MnXCbbnVJuqEOgODWspOiBbFkR7EEkzc1/Gm7gIOyWQ345a7
 I9smoaMOtDs8GxrbY36lLlHZglGCF3LSMOYV1GWCaHWRDj2TZfIGgiuCcuOAu3m6SUck
 /4xV4qbfeIBFyetUiZKl4UV0oHYtjdvOnHVt9Fc4BI5Hksqag7MtVZcvjPtgKQiCoKjh
 7kT6csYXgyAK3Mekj2nCriuoltFNexvD5zBm7Pw42v60mVwTvCMOMS60seaSsEZraaJU
 Dn2p0RJoAq5BGql0R0TQ1fSBOBoPFDFET3irsti20ZMYP9szK2a3jeIKnceaPXetFW+E
 pCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sj8+res0hlMLAha2Od6VzO8IHzQal7RF12YPvzFFXJU=;
 b=IPYQKz5Mwzem+k/HA4JdAb2dxyxKDjMUlLdYUOwwKm/Lymq4PIk0SlCv4kVBRl+XQJ
 NHxj5JvNWptqsg3k06GlPBEvyS4FpWacmGb6hdGX5MflBy51Nkpbc+MSnVMclXn3e2zi
 LB063WaC6UNEMEhm0rCwbCeB7EkMdXzIc5UIt0/WnpkIDD+gyWzmOXfa5Ft7/iEavMWN
 LM3R5Kdf26nEHTT83Jwm1jP4o6jSaSzeFBvhS62Agj5ffjrhQ29KgV/Ql6s0EA8oUGk1
 2I3IqpHHfKdBrYE0BQvruFRvXaf+tO7B+l5cOJoARXk8LkZ1tDQUTvJTz9PTqwFaYMx3
 QmTQ==
X-Gm-Message-State: AO0yUKUCFwggewEuoWe3I6RubY7kTw+XHaCVBEPhkzFz/fozFk5WTBLZ
 h5rgW46gN5BviggtYJKjZaU91OcNyCwF6Fe+x0M=
X-Google-Smtp-Source: AK7set+4ZXYVHGC43r8l2UCVKtXmPAinJrXm2w6VrvdquwHygkEnAjRH4byt/FMqkASSCJdAGb9G7jrYGPPJytMykUE=
X-Received: by 2002:a2e:aa1c:0:b0:293:4ed3:a404 with SMTP id
 bf28-20020a2eaa1c000000b002934ed3a404mr4705147ljb.2.1677237896065; Fri, 24
 Feb 2023 03:24:56 -0800 (PST)
MIME-Version: 1.0
References: <20230210140609.988022-1-andi.shyti@linux.intel.com>
In-Reply-To: <20230210140609.988022-1-andi.shyti@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 24 Feb 2023 11:24:29 +0000
Message-ID: <CAM0jSHPxwy5Vct80tuF2VqXS=pLDVvQoANaMLPTQOnQa49tS7w@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Make sure that errors are
 propagated through request chains
To: Andi Shyti <andi.shyti@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Feb 2023 at 14:06, Andi Shyti <andi.shyti@linux.intel.com> wrote:
>
> Currently, for operations like memory clear or copy for big
> chunks of memory, we generate multiple requests executed in a
> chain.
>
> But if one of the requests generated fails we would not know it
> to unless it happens to the last request, because errors are not
> properly propagated.
>
> For this we need to keep propagating the chain of fence
> notification in order to always reach the final fence associated
> to the final request.
>
> This way we would know that the memory operation has failed and
> whether the memory is still invalid.
>
> On copy and clear migration signal fences upon completion.
>
> Fixes: cf586021642d80 ("drm/i915/gt: Pipelined page migration")
> Reported-by: Matthew Auld <matthew.auld@intel.com>
> Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: stable@vger.kernel.org
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
