Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36697A7EF63
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 22:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207DE10E571;
	Mon,  7 Apr 2025 20:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mpc9xriB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A294F10E571;
 Mon,  7 Apr 2025 20:40:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 214E2A485BA;
 Mon,  7 Apr 2025 20:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76592C4CEDD;
 Mon,  7 Apr 2025 20:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744058399;
 bh=8HrL1EgPSyklT7FSW/bGqrEJaT6sICo4hJtgxDc0L7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mpc9xriBNIdKRA/FdQOVqQUjDpYiskXXHaB8SSN3PVPbEx0d7G72cuRTQV0mYbOkM
 LCECEwRHcHzj7qetGGF3Z+TfclcqxSbxYYj5YTR0Gv/ZPW4DyTUkOk/e1ojZ5UFsOD
 oCoqwEe9MmWorEXYlfOygne4KqgZhSU9CSOOJ/rTKm8/a31dXkLQcApADxdW7/1X9j
 0gqnwikX3XIEqgaoV/qLW0InHG1yeoXFuyzVjVz1pUyR0rZ4glt61wPEinEj7gn1Oa
 7v6LbNQw97DMWVdhyCe/+V9vOBNv2iHpheY2Ozh14XTZUfSx6F3XJ3wSSImcfkxEuz
 MIjjTi1sxf/OA==
Date: Mon, 7 Apr 2025 13:39:56 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] drm/nouveau: chan: Avoid
 -Wflex-array-member-not-at-end warnings
Message-ID: <202504071336.0C708FCAB8@keescook>
References: <Z-67Hm9uHEJs0RGw@kspp> <202504071227.E8484EB@keescook>
 <d8e63b8a-7a2c-46dc-a15c-9399044a23ee@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8e63b8a-7a2c-46dc-a15c-9399044a23ee@embeddedor.com>
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

On Mon, Apr 07, 2025 at 01:57:48PM -0600, Gustavo A. R. Silva wrote:
> 
> 
> On 07/04/25 13:50, Kees Cook wrote:
> > On Thu, Apr 03, 2025 at 10:45:18AM -0600, Gustavo A. R. Silva wrote:
> > > -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> > > getting ready to enable it, globally.
> > > 
> > > Use the `DEFINE_RAW_FLEX()` helper for a few on-stack definitions
> > > of a flexible structure where the size of the flexible-array member
> > > is known at compile-time, and refactor the rest of the code,
> > > accordingly.
> > > 
> > > So, with these changes, fix the following warnings:
> > > 
> > > drivers/gpu/drm/nouveau/nouveau_chan.c:274:37: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> > > drivers/gpu/drm/nouveau/nouveau_chan.c:371:46: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> > > drivers/gpu/drm/nouveau/nouveau_chan.c:524:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> > > 
> > > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > > ---
> > >   drivers/gpu/drm/nouveau/nouveau_chan.c | 115 ++++++++++++-------------
> > >   1 file changed, 56 insertions(+), 59 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > > index cd659b9fd1d9..a7e70517b7cd 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > > @@ -270,10 +270,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
> > >   		{    NV03_CHANNEL_DMA     , 0 },
> > >   		{}
> > >   	};
> > > -	struct {
> > > -		struct nvif_chan_v0 chan;
> > > -		char name[TASK_COMM_LEN+16];
> > > -	} args;
> > > +	DEFINE_RAW_FLEX(struct nvif_chan_v0, args, name, TASK_COMM_LEN + 16);
> > >   	struct nvif_device *device = &cli->device;
> > >   	struct nouveau_channel *chan;
> > >   	const u64 plength = 0x10000;
> > > @@ -298,28 +295,28 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
> > >   		return ret;
> > >   	/* create channel object */
> > > -	args.chan.version = 0;
> > > -	args.chan.namelen = sizeof(args.name);
> > > -	args.chan.runlist = __ffs64(runm);
> > > -	args.chan.runq = 0;
> > > -	args.chan.priv = priv;
> > > -	args.chan.devm = BIT(0);
> > > +	args->version = 0;
> > > +	args->namelen = __struct_size(args) - sizeof(*args);
> > 
> > Does __struct_size(args->name) work here (and later)?
> 
> Why not?

Uhm, I'm genuinely curious. I *think* it will work, but because it's
within the struct, not outside of it, I'm unclear if it'll DTRT for
finding the size (since __builtin_object_size() can be touchy).

> I mean, this should be equivalent to `TASK_COMM_LEN+16`, I could
> use the latter if people prefer it (see my comments below).

Right, it should be the same. I think __struct_size(args->name) would be
much more readable ... if it works. :)

> 
> > 
> > > +	args->runlist = __ffs64(runm);
> > > +	args->runq = 0;
> > > +	args->priv = priv;
> > > +	args->devm = BIT(0);
> > >   	if (hosts[cid].oclass < NV50_CHANNEL_GPFIFO) {
> > > -		args.chan.vmm = 0;
> > > -		args.chan.ctxdma = nvif_handle(&chan->push.ctxdma);
> > > -		args.chan.offset = chan->push.addr;
> > > -		args.chan.length = 0;
> > > +		args->vmm = 0;
> > > +		args->ctxdma = nvif_handle(&chan->push.ctxdma);
> > > +		args->offset = chan->push.addr;
> > > +		args->length = 0;
> > >   	} else {
> > > -		args.chan.vmm = nvif_handle(&chan->vmm->vmm.object);
> > > +		args->vmm = nvif_handle(&chan->vmm->vmm.object);
> > >   		if (hosts[cid].oclass < FERMI_CHANNEL_GPFIFO)
> > > -			args.chan.ctxdma = nvif_handle(&chan->push.ctxdma);
> > > +			args->ctxdma = nvif_handle(&chan->push.ctxdma);
> > >   		else
> > > -			args.chan.ctxdma = 0;
> > > -		args.chan.offset = ioffset + chan->push.addr;
> > > -		args.chan.length = ilength;
> > > +			args->ctxdma = 0;
> > > +		args->offset = ioffset + chan->push.addr;
> > > +		args->length = ilength;
> > >   	}
> > > -	args.chan.huserd = 0;
> > > -	args.chan.ouserd = 0;
> > > +	args->huserd = 0;
> > > +	args->ouserd = 0;
> > >   	/* allocate userd */
> > >   	if (hosts[cid].oclass >= VOLTA_CHANNEL_GPFIFO_A) {
> > > @@ -329,27 +326,28 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
> > >   		if (ret)
> > >   			return ret;
> > > -		args.chan.huserd = nvif_handle(&chan->mem_userd.object);
> > > -		args.chan.ouserd = 0;
> > > +		args->huserd = nvif_handle(&chan->mem_userd.object);
> > > +		args->ouserd = 0;
> > >   		chan->userd = &chan->mem_userd.object;
> > >   	} else {
> > >   		chan->userd = &chan->user;
> > >   	}
> > > -	snprintf(args.name, sizeof(args.name), "%s[%d]", current->comm, task_pid_nr(current));
> > > +	snprintf(args->name, __struct_size(args) - sizeof(*args), "%s[%d]",
> > > +		 current->comm, task_pid_nr(current));
> > >   	ret = nvif_object_ctor(&device->object, "abi16ChanUser", 0, hosts[cid].oclass,
> > > -			       &args, sizeof(args), &chan->user);
> > > +			       args, __struct_size(args), &chan->user);
> > >   	if (ret) {
> > >   		nouveau_channel_del(pchan);
> > >   		return ret;
> > >   	}
> > > -	chan->runlist = args.chan.runlist;
> > > -	chan->chid = args.chan.chid;
> > > -	chan->inst = args.chan.inst;
> > > -	chan->token = args.chan.token;
> > > +	chan->runlist = args->runlist;
> > > +	chan->chid = args->chid;
> > > +	chan->inst = args->inst;
> > > +	chan->token = args->token;
> > >   	return 0;
> > >   }
> > > @@ -367,17 +365,17 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
> > >   		return ret;
> > >   	if (chan->user.oclass >= FERMI_CHANNEL_GPFIFO) {
> > > -		struct {
> > > -			struct nvif_event_v0 base;
> > > -			struct nvif_chan_event_v0 host;
> > > -		} args;
> > > +		DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
> > > +				sizeof(struct nvif_chan_event_v0));
> > > +		struct nvif_chan_event_v0 *host =
> > > +				(struct nvif_chan_event_v0 *)args->data;
> > > -		args.host.version = 0;
> > > -		args.host.type = NVIF_CHAN_EVENT_V0_KILLED;
> > > +		host->version = 0;
> > > +		host->type = NVIF_CHAN_EVENT_V0_KILLED;
> > >   		ret = nvif_event_ctor(&chan->user, "abi16ChanKilled", chan->chid,
> > >   				      nouveau_channel_killed, false,
> > > -				      &args.base, sizeof(args), &chan->kill);
> > > +				      args, __struct_size(args), &chan->kill);
> > >   		if (ret == 0)
> > >   			ret = nvif_event_allow(&chan->kill);
> > >   		if (ret) {
> > > @@ -520,46 +518,45 @@ nouveau_channels_fini(struct nouveau_drm *drm)
> > >   int
> > >   nouveau_channels_init(struct nouveau_drm *drm)
> > >   {
> > > -	struct {
> > > -		struct nv_device_info_v1 m;
> > > -		struct {
> > > -			struct nv_device_info_v1_data channels;
> > > -			struct nv_device_info_v1_data runlists;
> > > -		} v;
> > > -	} args = {
> > > -		.m.version = 1,
> > > -		.m.count = sizeof(args.v) / sizeof(args.v.channels),
> > 
> > sizeof(args.v) == sizeof(struct nv_device_info_v1_data) * 2
> > 
> > and sizeof(args.v.channels) == sizeof(struct nv_device_info_v1_data).
> > 
> > Isn't this just "2"? i.e. isn't struct nv_device_info_v1::count the
> > counted_by for struct nv_device_info_v1::data?
> 
> Yes, it's just `2`. However, I didn't want to explicitly use the magic
> number, in case people don't like it, as in other similar patches (in
> other subsystems).
> 
> But, yeah, it's `2`. :)

Okay. So if "count" is set up as a counted_by, the assignment will
happen automatically (in DEFINE_FLEX -- no longer "RAW").

> 
> Thanks
> --
> Gustavo
> 
> > 
> > > -		.v.channels.mthd = NV_DEVICE_HOST_CHANNELS,
> > > -		.v.runlists.mthd = NV_DEVICE_HOST_RUNLISTS,
> > > -	};
> > > +	DEFINE_RAW_FLEX(struct nv_device_info_v1, args, data, 2);
> > > +	struct nv_device_info_v1_data *channels = &args->data[0];
> > > +	struct nv_device_info_v1_data *runlists = &args->data[1];
> > >   	struct nvif_object *device = &drm->client.device.object;
> > >   	int ret, i;
> > > -	ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, &args, sizeof(args));
> > > +	args->version = 1;
> > > +	args->count = (__struct_size(args) - sizeof(*args)) /
> > > +		      sizeof(*args->data);
> > > +	channels->mthd = NV_DEVICE_HOST_CHANNELS;
> > > +	runlists->mthd = NV_DEVICE_HOST_RUNLISTS;
> > > +
> > > +	ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, args,
> > > +			       __struct_size(args));
> > >   	if (ret ||
> > > -	    args.v.runlists.mthd == NV_DEVICE_INFO_INVALID || !args.v.runlists.data ||
> > > -	    args.v.channels.mthd == NV_DEVICE_INFO_INVALID)
> > > +	    runlists->mthd == NV_DEVICE_INFO_INVALID || !runlists->data ||
> > > +	    channels->mthd == NV_DEVICE_INFO_INVALID)
> > >   		return -ENODEV;
> > > -	drm->chan_nr = drm->chan_total = args.v.channels.data;
> > > -	drm->runl_nr = fls64(args.v.runlists.data);
> > > +	drm->chan_nr = drm->chan_total = channels->data;
> > > +	drm->runl_nr = fls64(runlists->data);
> > >   	drm->runl = kcalloc(drm->runl_nr, sizeof(*drm->runl), GFP_KERNEL);
> > >   	if (!drm->runl)
> > >   		return -ENOMEM;
> > >   	if (drm->chan_nr == 0) {
> > >   		for (i = 0; i < drm->runl_nr; i++) {
> > > -			if (!(args.v.runlists.data & BIT(i)))
> > > +			if (!(runlists->data & BIT(i)))
> > >   				continue;
> > > -			args.v.channels.mthd = NV_DEVICE_HOST_RUNLIST_CHANNELS;
> > > -			args.v.channels.data = i;
> > > +			channels->mthd = NV_DEVICE_HOST_RUNLIST_CHANNELS;
> > > +			channels->data = i;
> > > -			ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, &args, sizeof(args));
> > > -			if (ret || args.v.channels.mthd == NV_DEVICE_INFO_INVALID)
> > > +			ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, args,
> > > +					       __struct_size(args));
> > > +			if (ret || channels->mthd == NV_DEVICE_INFO_INVALID)
> > >   				return -ENODEV;
> > > -			drm->runl[i].chan_nr = args.v.channels.data;
> > > +			drm->runl[i].chan_nr = channels->data;
> > >   			drm->runl[i].chan_id_base = drm->chan_total;
> > >   			drm->runl[i].context_base = dma_fence_context_alloc(drm->runl[i].chan_nr);
> > 
> > Otherwise looks good.
> > 
> > -Kees
> > 
> 

-- 
Kees Cook
