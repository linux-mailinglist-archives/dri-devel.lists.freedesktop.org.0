Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9A5CBDB45
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 13:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CC210E2CF;
	Mon, 15 Dec 2025 12:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UmGI58Z6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56F310E437
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 12:08:21 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7b7828bf7bcso3609256b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 04:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1765800501; x=1766405301;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+DGkbwvSveRrQtSlxFukYMul6SfDciYSPOsqEu5ZQPQ=;
 b=UmGI58Z60jlznwb/7wRDKWbbiOBb7cj9qgUOAh4Jg2BTSnLu2IotyTSm3Uxyz98Q39
 J6ZkcsHlZn9wTot+yQxq+VyJzd/j0er+q5VLOjJynjm3mw4WBSUK7I7D4SMtOdqBGisM
 lRvUqXxtj13wtjYDSG3CyqTJKz7zPIsNUpiU7Kstg+DDGjPaEhbD2KSqbfB9LJTq6DFT
 4UVo1UMChQUOB8fK+9eHBavy63t+fJWC2tQ1IqkYywr31pKHOgSRTC3hFhqfpCOaGLGQ
 D7ukIJne39hPWRL1gNjdXWOvHwfMro3KB/l86ZDJwXHaqqvQZ3WsO8EEIjhsh6qz3Qh+
 udkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765800501; x=1766405301;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+DGkbwvSveRrQtSlxFukYMul6SfDciYSPOsqEu5ZQPQ=;
 b=glkNcwv7H1yhyLaq4dcvYEBlJ2Z0vlS8umRPFU4OE3FjBwqF9MQ1Sdmu/amxXHhWWf
 Bg+bvUp7nL8zT6sEaMljsYn6DM/pCVhx3cHfPVsTazPBZ/cAfCzS6ceHsefkbmhyX4rY
 NQ8NPlVUpwSu61ISjVON0uJEuKIQ1MlfYrknBXewz13UNuLJ3boyyxvd+Dg68g2awkor
 sSyFYhnVR0hpM2e6OJUH+r5+UZbSyE2YblH9dRCcCb/W33/IvPXS47qlvyfL9Io2ApPx
 rOsWT2Rk3OFsYAZvCK4Jr4j9QLuridVp6E6s0y4wJK78qkTcqaQ/rUlY4unVBKyGCDJN
 eNNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW970mNUpXeMeIFEgRO6JURohaI/3RtFOTjLf7svveLq67vxoR+zEe2K2+gV0W8QE6F3u1pywGQKls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRn0oBFF847KDT2hWyQb+hlEJbxhB1HeTMGUnuvDCR+WEm19xY
 Ky5f9VSUhp3A18dg1vEPH+L3EQbEDni54TB8CD5AnAG8LzHB3TVDGIQBYIjZOmWm3B0JWYgfD3O
 +jdHCSCQvS/wiwrx2TCLX0mCCB7eAS8OC6uXsTEfe
X-Gm-Gg: AY/fxX7zOqmKn0Wr/GFxpa4nuRF7dJqlYxKK5TiKY7vFVG6lny6e70g+KKvqSiPMBHp
 YPVvdQL0Lhg7NzsWvewnUVI95kP5gDg5ZOmRhsWshvwPyKEcOlLbtq+5fHySJ2E+RwJmQiFFSMN
 7MSWpUkl49tew6X5iCAzBRYHNYXxCWTZsRIG5Mm/kdpxW3xrMbNZQNEFMCFOO/WLdrV2tyyz/PB
 Dk1sgTafBZOvioFVQZiMa+b2tvjTm5Nace+KfJiCTP7+aXM3AoufyxCQO9yA0M4tHiIeNbQf51G
 1wmx42QfFiwOYGwn8laKBgIpaTBBMxkedqbi
X-Google-Smtp-Source: AGHT+IEBC+acRqtjaBBJQBmhlbonF1wwGFrMO77Zlp8D2bmspUQHM2nItV5HpI3KRFKcy27LH5o2hYak0ysa4tYnvE8=
X-Received: by 2002:a05:701a:ca0d:b0:11b:8fc9:9f5d with SMTP id
 a92af1059eb24-11f34c4d15emr7306064c88.30.1765800500924; Mon, 15 Dec 2025
 04:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20251215113903.46555-1-bagasdotme@gmail.com>
 <20251215113903.46555-6-bagasdotme@gmail.com>
In-Reply-To: <20251215113903.46555-6-bagasdotme@gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 15 Dec 2025 13:07:43 +0100
X-Gm-Features: AQt7F2pEt11ob6m3jn_EvmNyiM9lcI5ir1gIqaEopvbMbWpYo3dEgZbn6PIAiFk
Message-ID: <CANpmjNNrHYCPp19A_FPeFY1kSTuyS0W_zjo21AUrmjqjqcYa0A@mail.gmail.com>
Subject: Re: [PATCH 05/14] mm,
 kfence: Describe @slab parameter in __kfence_obj_info()
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>, 
 Linux DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Filesystems Development <linux-fsdevel@vger.kernel.org>,
 Linux Media <linux-media@vger.kernel.org>, 
 linaro-mm-sig@lists.linaro.org, kasan-dev@googlegroups.com, 
 Linux Virtualization <virtualization@lists.linux.dev>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Network Bridge <bridge@lists.linux.dev>, 
 Linux Networking <netdev@vger.kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, 
 Taimur Hassan <Syed.Hassan@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Hung <alex.hung@amd.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <Dillon.Varone@amd.com>, 
 George Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>, 
 Cruise Hung <Cruise.Hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Sunil Khatri <sunil.khatri@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>, 
 David Hildenbrand <david@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Max Kellermann <max.kellermann@ionos.com>, 
 "Nysal Jan K.A." <nysal@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
 Alexey Skidanov <alexey.skidanov@intel.com>, Vlastimil Babka <vbabka@suse.cz>, 
 Kent Overstreet <kent.overstreet@linux.dev>,
 Vitaly Wool <vitaly.wool@konsulko.se>, 
 Harry Yoo <harry.yoo@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>,
 NeilBrown <neil@brown.name>, 
 Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>, 
 Ivan Lipski <ivan.lipski@amd.com>, Tao Zhou <tao.zhou1@amd.com>, 
 YiPeng Chai <YiPeng.Chai@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
 Lyude Paul <lyude@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Roopa Prabhu <roopa@cumulusnetworks.com>, Mao Zhu <zhumao001@208suo.com>, 
 Shaomin Deng <dengshaomin@cdjrlc.com>, Charles Han <hanchunchao@inspur.com>, 
 Jilin Yuan <yuanjilin@cdjrlc.com>, Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 George Anthony Vernon <contact@gvernon.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Dec 2025 at 12:39, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> Sphinx reports kernel-doc warning:
>
> WARNING: ./include/linux/kfence.h:220 function parameter 'slab' not described in '__kfence_obj_info'
>
> Fix it by describing @slab parameter.
>
> Fixes: 2dfe63e61cc31e ("mm, kfence: support kmem_dump_obj() for KFENCE objects")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Acked-by: Marco Elver <elver@google.com>

Thanks!

> ---
>  include/linux/kfence.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/kfence.h b/include/linux/kfence.h
> index 0ad1ddbb8b996a..e5822f6e7f2794 100644
> --- a/include/linux/kfence.h
> +++ b/include/linux/kfence.h
> @@ -211,6 +211,7 @@ struct kmem_obj_info;
>   * __kfence_obj_info() - fill kmem_obj_info struct
>   * @kpp: kmem_obj_info to be filled
>   * @object: the object
> + * @slab: the slab
>   *
>   * Return:
>   * * false - not a KFENCE object
> --
> An old man doll... just what I always wanted! - Clara
>
