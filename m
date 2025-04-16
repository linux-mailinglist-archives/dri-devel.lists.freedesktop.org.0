Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE29A90AAC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 20:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD4810E991;
	Wed, 16 Apr 2025 18:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cPUs/7SD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE1810E98A;
 Wed, 16 Apr 2025 18:00:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ED428A4A40C;
 Wed, 16 Apr 2025 17:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E7CC4CEE2;
 Wed, 16 Apr 2025 18:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744826446;
 bh=SJY0xG1DrlZDBeIQmUalS9GpwgIa3ejXcZ6rQbeRQtY=;
 h=Date:From:To:Cc:Subject:From;
 b=cPUs/7SDgeiM0HerpNhmtjeKguIPd24msJJ+OoUVpI5Lf0fu53ldSmmleu5CyF1b7
 x4EQX4drBvPa95+a7mnx6zF7ODs+HXvY35mqHNw4IhlHtCrML2g/+5cKCxtvWfYYF7
 8yT9fMJ6NKQjyqJAplFZRM12GeK0WX5GlEIX0wkaxnwlH8291ky9nWrIG5P/k42KBZ
 zTJMz1nexk4QIopQ9yFSLhghFwYJZkrc7LXL/cCcYVCz5lE470veypc3LfpoVJRMSE
 k/Yd7mfKb6MMsDS5NKVBfc+4k+h+4jrEE5p6L+Nja2/8Kok9ZmPxiYcCJp66Yu1Hr3
 PbbcKOUgU9GJA==
Date: Wed, 16 Apr 2025 12:00:42 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: [PATCH v2][next] drm/nouveau: chan: Avoid
 -Wflex-array-member-not-at-end warnings
Message-ID: <Z__wSgHK5_lHw8x9@kspp>
MIME-Version: 1.0
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the `DEFINE_RAW_FLEX()` helper for a few on-stack definitions
of a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with these changes, fix the following warnings:

drivers/gpu/drm/nouveau/nouveau_chan.c:274:37: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/gpu/drm/nouveau/nouveau_chan.c:371:46: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/gpu/drm/nouveau/nouveau_chan.c:524:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Use __member_size() instead of __struct_size() to get the
   compile-time size of the flexible array.

v1:
 - Link: https://lore.kernel.org/linux-hardening/Z-67Hm9uHEJs0RGw@kspp/

 drivers/gpu/drm/nouveau/nouveau_chan.c | 114 ++++++++++++-------------
 1 file changed, 55 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index cd659b9fd1d9..1286a664f688 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -270,10 +270,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		{    NV03_CHANNEL_DMA     , 0 },
 		{}
 	};
-	struct {
-		struct nvif_chan_v0 chan;
-		char name[TASK_COMM_LEN+16];
-	} args;
+	DEFINE_RAW_FLEX(struct nvif_chan_v0, args, name, TASK_COMM_LEN + 16);
 	struct nvif_device *device = &cli->device;
 	struct nouveau_channel *chan;
 	const u64 plength = 0x10000;
@@ -298,28 +295,28 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		return ret;
 
 	/* create channel object */
-	args.chan.version = 0;
-	args.chan.namelen = sizeof(args.name);
-	args.chan.runlist = __ffs64(runm);
-	args.chan.runq = 0;
-	args.chan.priv = priv;
-	args.chan.devm = BIT(0);
+	args->version = 0;
+	args->namelen = __member_size(args->name);
+	args->runlist = __ffs64(runm);
+	args->runq = 0;
+	args->priv = priv;
+	args->devm = BIT(0);
 	if (hosts[cid].oclass < NV50_CHANNEL_GPFIFO) {
-		args.chan.vmm = 0;
-		args.chan.ctxdma = nvif_handle(&chan->push.ctxdma);
-		args.chan.offset = chan->push.addr;
-		args.chan.length = 0;
+		args->vmm = 0;
+		args->ctxdma = nvif_handle(&chan->push.ctxdma);
+		args->offset = chan->push.addr;
+		args->length = 0;
 	} else {
-		args.chan.vmm = nvif_handle(&chan->vmm->vmm.object);
+		args->vmm = nvif_handle(&chan->vmm->vmm.object);
 		if (hosts[cid].oclass < FERMI_CHANNEL_GPFIFO)
-			args.chan.ctxdma = nvif_handle(&chan->push.ctxdma);
+			args->ctxdma = nvif_handle(&chan->push.ctxdma);
 		else
-			args.chan.ctxdma = 0;
-		args.chan.offset = ioffset + chan->push.addr;
-		args.chan.length = ilength;
+			args->ctxdma = 0;
+		args->offset = ioffset + chan->push.addr;
+		args->length = ilength;
 	}
-	args.chan.huserd = 0;
-	args.chan.ouserd = 0;
+	args->huserd = 0;
+	args->ouserd = 0;
 
 	/* allocate userd */
 	if (hosts[cid].oclass >= VOLTA_CHANNEL_GPFIFO_A) {
@@ -329,27 +326,28 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		if (ret)
 			return ret;
 
-		args.chan.huserd = nvif_handle(&chan->mem_userd.object);
-		args.chan.ouserd = 0;
+		args->huserd = nvif_handle(&chan->mem_userd.object);
+		args->ouserd = 0;
 
 		chan->userd = &chan->mem_userd.object;
 	} else {
 		chan->userd = &chan->user;
 	}
 
-	snprintf(args.name, sizeof(args.name), "%s[%d]", current->comm, task_pid_nr(current));
+	snprintf(args->name, __member_size(args->name), "%s[%d]",
+		 current->comm, task_pid_nr(current));
 
 	ret = nvif_object_ctor(&device->object, "abi16ChanUser", 0, hosts[cid].oclass,
-			       &args, sizeof(args), &chan->user);
+			       args, __struct_size(args), &chan->user);
 	if (ret) {
 		nouveau_channel_del(pchan);
 		return ret;
 	}
 
-	chan->runlist = args.chan.runlist;
-	chan->chid = args.chan.chid;
-	chan->inst = args.chan.inst;
-	chan->token = args.chan.token;
+	chan->runlist = args->runlist;
+	chan->chid = args->chid;
+	chan->inst = args->inst;
+	chan->token = args->token;
 	return 0;
 }
 
@@ -367,17 +365,17 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 		return ret;
 
 	if (chan->user.oclass >= FERMI_CHANNEL_GPFIFO) {
-		struct {
-			struct nvif_event_v0 base;
-			struct nvif_chan_event_v0 host;
-		} args;
+		DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
+				sizeof(struct nvif_chan_event_v0));
+		struct nvif_chan_event_v0 *host =
+				(struct nvif_chan_event_v0 *)args->data;
 
-		args.host.version = 0;
-		args.host.type = NVIF_CHAN_EVENT_V0_KILLED;
+		host->version = 0;
+		host->type = NVIF_CHAN_EVENT_V0_KILLED;
 
 		ret = nvif_event_ctor(&chan->user, "abi16ChanKilled", chan->chid,
 				      nouveau_channel_killed, false,
-				      &args.base, sizeof(args), &chan->kill);
+				      args, __struct_size(args), &chan->kill);
 		if (ret == 0)
 			ret = nvif_event_allow(&chan->kill);
 		if (ret) {
@@ -520,46 +518,44 @@ nouveau_channels_fini(struct nouveau_drm *drm)
 int
 nouveau_channels_init(struct nouveau_drm *drm)
 {
-	struct {
-		struct nv_device_info_v1 m;
-		struct {
-			struct nv_device_info_v1_data channels;
-			struct nv_device_info_v1_data runlists;
-		} v;
-	} args = {
-		.m.version = 1,
-		.m.count = sizeof(args.v) / sizeof(args.v.channels),
-		.v.channels.mthd = NV_DEVICE_HOST_CHANNELS,
-		.v.runlists.mthd = NV_DEVICE_HOST_RUNLISTS,
-	};
+	DEFINE_RAW_FLEX(struct nv_device_info_v1, args, data, 2);
+	struct nv_device_info_v1_data *channels = &args->data[0];
+	struct nv_device_info_v1_data *runlists = &args->data[1];
 	struct nvif_object *device = &drm->client.device.object;
 	int ret, i;
 
-	ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, &args, sizeof(args));
+	args->version = 1;
+	args->count = __member_size(args->data) / sizeof(*args->data);
+	channels->mthd = NV_DEVICE_HOST_CHANNELS;
+	runlists->mthd = NV_DEVICE_HOST_RUNLISTS;
+
+	ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, args,
+			       __struct_size(args));
 	if (ret ||
-	    args.v.runlists.mthd == NV_DEVICE_INFO_INVALID || !args.v.runlists.data ||
-	    args.v.channels.mthd == NV_DEVICE_INFO_INVALID)
+	    runlists->mthd == NV_DEVICE_INFO_INVALID || !runlists->data ||
+	    channels->mthd == NV_DEVICE_INFO_INVALID)
 		return -ENODEV;
 
-	drm->chan_nr = drm->chan_total = args.v.channels.data;
-	drm->runl_nr = fls64(args.v.runlists.data);
+	drm->chan_nr = drm->chan_total = channels->data;
+	drm->runl_nr = fls64(runlists->data);
 	drm->runl = kcalloc(drm->runl_nr, sizeof(*drm->runl), GFP_KERNEL);
 	if (!drm->runl)
 		return -ENOMEM;
 
 	if (drm->chan_nr == 0) {
 		for (i = 0; i < drm->runl_nr; i++) {
-			if (!(args.v.runlists.data & BIT(i)))
+			if (!(runlists->data & BIT(i)))
 				continue;
 
-			args.v.channels.mthd = NV_DEVICE_HOST_RUNLIST_CHANNELS;
-			args.v.channels.data = i;
+			channels->mthd = NV_DEVICE_HOST_RUNLIST_CHANNELS;
+			channels->data = i;
 
-			ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, &args, sizeof(args));
-			if (ret || args.v.channels.mthd == NV_DEVICE_INFO_INVALID)
+			ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, args,
+					       __struct_size(args));
+			if (ret || channels->mthd == NV_DEVICE_INFO_INVALID)
 				return -ENODEV;
 
-			drm->runl[i].chan_nr = args.v.channels.data;
+			drm->runl[i].chan_nr = channels->data;
 			drm->runl[i].chan_id_base = drm->chan_total;
 			drm->runl[i].context_base = dma_fence_context_alloc(drm->runl[i].chan_nr);
 
-- 
2.43.0

