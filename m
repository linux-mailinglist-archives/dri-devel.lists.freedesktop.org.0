Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9BACBDC62
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 13:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C82B10E485;
	Mon, 15 Dec 2025 12:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="MFNtC9o7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E3A10E485;
 Mon, 15 Dec 2025 12:25:18 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dVK5Q3lJFz9scD;
 Mon, 15 Dec 2025 13:25:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1765801514; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJOFMp1/K+qQ0MSqjWn/CbbRaLJJuaP23xTo6CU3FMU=;
 b=MFNtC9o7GDr77G4gP5pdlWOgQeeiKPzkDClg8L2DPLsenZjXbBPFNYiW+f7Yt3dIHPmQyP
 OJMvPnvOPIvbcMj8jkup2nPMtdqY9haLsfcz/IxOV2J03K4sDF356sDyQ23TsGQ07TViaD
 FhWOVrJMTFcJ9CeKh2BEanhmBKLu/puWhJkeqyz5IF7MKc0wDX6+LpZo37kPzrx07UbVHu
 /SrGIEw9Yb9k6R4DHidfnQwttDmp8t0gODXRNwKwn1DjYqW3hsQZd1gJ97ZgepaPr9lGGF
 Kb4b3/HsX4GoqvHqXz/IOEsaMsqC0j4WmS+EX3sDV8DayQFJEqKPzO/PssjTDQ==
Message-ID: <1f0fd860bf3466b9967d5a99ecd49eb93e0f7a19.camel@mailbox.org>
Subject: Re: [PATCH 12/14] drm/scheduler: Describe @result in
 drm_sched_job_done()
From: Philipp Stanner <phasta@mailbox.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux AMDGPU
 <amd-gfx@lists.freedesktop.org>,  Linux DRI Development
 <dri-devel@lists.freedesktop.org>, Linux Filesystems Development
 <linux-fsdevel@vger.kernel.org>,  Linux Media
 <linux-media@vger.kernel.org>, linaro-mm-sig@lists.linaro.org,
 kasan-dev@googlegroups.com,  Linux Virtualization
 <virtualization@lists.linux.dev>, Linux Memory Management List
 <linux-mm@kvack.org>, Linux Network Bridge <bridge@lists.linux.dev>, Linux
 Networking <netdev@vger.kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Sumit Semwal <sumit.semwal@linaro.org>,  Alexander
 Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry
 Vyukov <dvyukov@google.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio
 =?ISO-8859-1?Q?P=E9rez?= <eperezma@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, Nikolay
 Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Taimur Hassan <Syed.Hassan@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>, Alex Hung <alex.hung@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Dillon Varone <Dillon.Varone@amd.com>, George
 Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>, Cruise Hung
 <Cruise.Hung@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, Sunil
 Khatri <sunil.khatri@amd.com>, Dominik Kaszewski
 <dominik.kaszewski@amd.com>, David Hildenbrand <david@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Lorenzo Stoakes
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
Date: Mon, 15 Dec 2025 13:24:46 +0100
In-Reply-To: <20251215113903.46555-13-bagasdotme@gmail.com>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
 <20251215113903.46555-13-bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: q9aiurnjorghwoz79fww7b6wqkkf5zeq
X-MBO-RS-ID: ca016de3dd37ac937be
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nit about commit title:
We use "drm/sched:" as prefix nowadays

On Mon, 2025-12-15 at 18:39 +0700, Bagas Sanjaya wrote:
> Sphinx reports kernel-doc warning:
>=20
> WARNING: ./drivers/gpu/drm/scheduler/sched_main.c:367 function parameter =
'result' not described in 'drm_sched_job_done'
>=20
> Describe @result parameter to fix it
>=20

Thx for fixing this!

> .
>=20
> Fixes: 539f9ee4b52a8b ("drm/scheduler: properly forward fence errors")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 1d4f1b822e7b76..4f844087fd48eb 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -361,6 +361,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_s=
cheduler *sched)
> =C2=A0/**
> =C2=A0 * drm_sched_job_done - complete a job
> =C2=A0 * @s_job: pointer to the job which is done
> + * @result: job result

"error code for the job's finished-fence" would be a bit better and
more verbose.

With that:

Reviewed-by: Philipp Stanner <phasta@kernel.org>

> =C2=A0 *
> =C2=A0 * Finish the job's fence and resubmit the work items.
> =C2=A0 */

