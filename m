Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7736EACBD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 16:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5293B10EE45;
	Fri, 21 Apr 2023 14:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42ABD10EE2A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 14:22:05 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-329577952c5so693585ab.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 07:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682086924; x=1684678924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iRE0WrMWpFap+y3dmkLyk4ksWv38PiYMbGEKVJWOWPE=;
 b=AnE8soA78cRTw/z6Mdl8v01EinY7b2zJC51/fkhvnxo5uCo0UL/jUJ5eGG8GHlK3q9
 /jEMi5cgCHXZY96W4+enSewpX/ixcLd+iCK8H+KhRTShFuwJT3LuyCk0JPDeGtQ0Pmvv
 HLI/WEYqsS8jVqiZz2E49H83PQPUgyz0+flfFchksW2GqE0c8RYZXnKJtBWNfwLf1LnU
 aE91dPOB9Vg6lS5Y+qM7c8I8fkR7pIyxcKyOPDs/EKeMZonyVcq3hu/VOJVghmjH3PuO
 McGPKBxcpjzc8u3VaiQw3aQhPKqqVbE5FZQcONugpSeuIDR7c0orO03m5TP30Nxd6Gbj
 vySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682086924; x=1684678924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iRE0WrMWpFap+y3dmkLyk4ksWv38PiYMbGEKVJWOWPE=;
 b=lDH4664QriyShNfUkWglhm1zScgOGxTxnQ3Du/vnHd5KiCNH+XPlHNIs1RJHbyuzJS
 X1d5kmQrkUzDAh4rg+GF7S2pWzb0aeBJztiqciwon7Y1FrHLt55yoebFVOLAUE1ZAXnN
 7n2Ly8je1EJVQg7KE5gbXwLKUmuvI7NbV4oSx0ottBeg1oD7C5zTF617pCVk1jVW3BAs
 +USCvqDd3giyf5T63enCT+Pa8Zb8EbJvWj5YzXc0Eufs6B+3y/98dwB2tMr5GddEzEDg
 /qu8u6rZsmZbUQm+NAFP20ue33WgtsgiXreFg/4sMI8KHL7eXTH3x7h19JyiGaBgXweM
 fUzQ==
X-Gm-Message-State: AAQBX9dsknT5kCLO5K9Z9ZIlHAgcxbGxWguhOgEHAGHO6oHPH2f9GVZ5
 NYmIm4Qpo35JeMO+G2S8Rf4RRN+Z0ZsD7clQh3qpjg==
X-Google-Smtp-Source: AKy350Z5Y1EuWQtA/tAHv2ZVhpFhudRKTHIxZvAilofNgLnO6LpBNA7CYSqGbpfNSM/qyCZvw+VVotb7Zt5JQ8D2KA0=
X-Received: by 2002:a92:ca05:0:b0:32a:baa8:2253 with SMTP id
 j5-20020a92ca05000000b0032abaa82253mr322511ils.8.1682086924161; Fri, 21 Apr
 2023 07:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230224-track_gt-v7-0-11f08358c1ec@intel.com>
 <20230224-track_gt-v7-4-11f08358c1ec@intel.com>
In-Reply-To: <20230224-track_gt-v7-4-11f08358c1ec@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 21 Apr 2023 16:21:50 +0200
Message-ID: <CANn89i+1UML+p1N+bHFXG70V_AqOTQA7fh10_ASvThNK7gvUMw@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] lib/ref_tracker: remove warnings in case of
 allocation failure
To: Andrzej Hajda <andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 1:35=E2=80=AFPM Andrzej Hajda <andrzej.hajda@intel.=
com> wrote:
>
> Library can handle allocation failures. To avoid allocation warnings
> __GFP_NOWARN has been added everywhere. Moreover GFP_ATOMIC has been
> replaced with GFP_NOWAIT in case of stack allocation on tracker free
> call.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
Thanks.
