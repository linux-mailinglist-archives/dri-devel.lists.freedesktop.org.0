Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBB0CC54D5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 23:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959DE10E793;
	Tue, 16 Dec 2025 22:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oqiadpWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4635510E302;
 Tue, 16 Dec 2025 22:09:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B934240661;
 Tue, 16 Dec 2025 22:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4509EC4CEF1;
 Tue, 16 Dec 2025 22:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765922941;
 bh=B0kVLZK7YMAGW4+NymplABFlILpQoztpjaegZ/yGPWg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oqiadpWDrn1VtQBdfyFy7VbAAFT/N+0QKxoy/la9xGx5fG3NMm5680qrqPz22qZtD
 730Nc00631mF5M860GXrud+DirVS8MK0VRJURSahC1gOVM6BuWECPyT/JBCL+vTTHR
 ANySaFterNV+lUXLbgI+r8YXLCTsj+4BuyJNK3LGYSvphQs/L5oShSzo5DruIKbDsw
 M2Ec01YwtnmYPJ7y2JWbxiXJ1J5ndwfCfLR9yd6hMhGqoKzsqZ/GRP5mtCOsLCzOlN
 J4KQTLdsHQL34okSpaVlrE+jMhJ41hJeBTw53maElT/xvlUJlwMFrwPOAejsH/MToP
 PLc1BPivYW6UA==
Date: Tue, 16 Dec 2025 14:08:57 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux AMDGPU
 <amd-gfx@lists.freedesktop.org>, Linux DRI Development
 <dri-devel@lists.freedesktop.org>, Linux Filesystems Development
 <linux-fsdevel@vger.kernel.org>, Linux Media <linux-media@vger.kernel.org>,
 linaro-mm-sig@lists.linaro.org, kasan-dev@googlegroups.com, Linux
 Virtualization <virtualization@lists.linux.dev>, Linux Memory Management
 List <linux-mm@kvack.org>, Linux Network Bridge <bridge@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner <phasta@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Sumit
 Semwal <sumit.semwal@linaro.org>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Taimur Hassan
 <Syed.Hassan@amd.com>, Wayne Lin <Wayne.Lin@amd.com>, Alex Hung
 <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, Dillon
 Varone <Dillon.Varone@amd.com>, George Shen <george.shen@amd.com>, Aric Cyr
 <aric.cyr@amd.com>, Cruise Hung <Cruise.Hung@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Dominik
 Kaszewski <dominik.kaszewski@amd.com>, David Hildenbrand
 <david@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Max Kellermann <max.kellermann@ionos.com>,
 "Nysal Jan K.A." <nysal@linux.ibm.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Alexey Skidanov <alexey.skidanov@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, Kent Overstreet
 <kent.overstreet@linux.dev>, Vitaly Wool <vitaly.wool@konsulko.se>, Harry
 Yoo <harry.yoo@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>, NeilBrown
 <neil@brown.name>, Amir Goldstein <amir73il@gmail.com>, Jeff Layton
 <jlayton@kernel.org>, Ivan Lipski <ivan.lipski@amd.com>, Tao Zhou
 <tao.zhou1@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>, Lyude Paul <lyude@redhat.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, Roopa Prabhu
 <roopa@cumulusnetworks.com>, Mao Zhu <zhumao001@208suo.com>, Shaomin Deng
 <dengshaomin@cdjrlc.com>, Charles Han <hanchunchao@inspur.com>, Jilin Yuan
 <yuanjilin@cdjrlc.com>, Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 George Anthony Vernon <contact@gvernon.com>
Subject: Re: [PATCH 00/14] Assorted kernel-doc fixes
Message-ID: <20251216140857.77cf0fb3@kernel.org>
In-Reply-To: <20251215113903.46555-1-bagasdotme@gmail.com>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 15 Dec 2025 18:38:48 +0700 Bagas Sanjaya wrote:
> Here are assorted kernel-doc fixes for 6.19 cycle. As the name
> implies, for the merging strategy, the patches can be taken by
> respective maintainers to appropriate fixes branches (targetting
> 6.19 of course) (e.g. for mm it will be mm-hotfixes).

Please submit just the relevant changes directly to respective
subsystems. Maintainers don't have time to sort patches for you.
You should know better.
