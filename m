Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803129D7957
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 01:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077C610E0A4;
	Mon, 25 Nov 2024 00:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mJsK0oGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5146C10E0A4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 00:35:15 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso50066325e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 16:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732494913; x=1733099713; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w42A29b+XcFII3HA5dynXRABPrSSK75R4qT/dcM9LX8=;
 b=mJsK0oGfsGeIPUYnHDepxNmn0I3iNj14PVLhbiXF5SXQ9Ibo2SnwpeW8RMCo5c2tel
 YQBQsEOUbKbB/73abqE4bpnvPMGkAeiLy6f/wcFpOCg6FgqgTzUkuUlUBlcD2rwifUlE
 aLiEtLKHUV7XZesvi8/61/t3Hkv7XcBOeOSIHmm+qvLoHZP/jqbQOH/xgLPzXiBMMgib
 ns/vVv0bBuwTGmlan68xEl14CCUe8cxzHWfgEvqWOGXKYV0RlZ0wo/GbfN2E33Atk/vQ
 1+jrd2gsefneYyLJU0uvkkcG+27ShsO2Mwm6lB22MMbBl/F5Nmu8x3cFZsd6/53GB8Q9
 6G4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732494913; x=1733099713;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w42A29b+XcFII3HA5dynXRABPrSSK75R4qT/dcM9LX8=;
 b=cSdIcgKKD7CbsJNrFNHRZ6DmkLEROmtcnXeAGp9e/5NPF33r3EzaBs/awctpuXf52Z
 YTYCgd0Se3IHub0DNZsvR9LmGvs01F/Xx2eiMsqMjZDPkbOfdW1uiM80v6d9PXQ+TwzG
 kwuO/OlFmxwinrgCY3aMxPeO6HdZuudx+Fyw4x5ig6OIZMUFa8JkmRibiMOUHqBcc0Vi
 C/KourIH1XYQEZBXL+aev85ia365DxJzabEA0gxbtrJB1PFOsBEI80iEp5wT98DNLpHU
 Vf9rpobXl4j5YQNCwIVNyW/nA1J5IXFN8Ay/bmBopXApC0Ko/fB5CvrCU1XBzS+FYwgE
 0/Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUijhOik5JJVTc4lUM7/LcRHk0OS0ysIGBC79bbx/N0UFx8Dtopi+DnUaZ6ofZbsFcuTrHCIcLnE9w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9h9WtJhFBblCKMLkxpySsOhBcECDFC95YKE312QTW+9JtS5f1
 icuJCRtXGZ3f0MWCt/jrt5VaZ5VLecx9cZcYBt9SC4HLdWZZ0tO0
X-Gm-Gg: ASbGncs7yCs3eOOoUF0ChmjC1rj+lxC0ORQqWtKFX2XIGQ5aqP2ZJDrCcuye5f/jjRf
 IWnirqrO1+KRjMDNNLea+/BonGtubx35qF12FMio0Nn10dKevEs3yL9C60aGZ0bcfNi/jWb5Qcu
 +E8xVxqGEwQmZOw14WCQRVrmJoZcq9H3Ra98b4ie7TuqZ4Wg1Qj0mfCtZ4AWNI6cLeRmwmgqAlA
 w/3R1l9wji8T9X73qA97mNKZfxa+06sJ02TkA3OG+2joB7GjYReEqPAZB6zsvUfEm2aaXOs/UpO
 /2o3twluNiqmvgjhcLheBiYUvp7bAy8j2IC+3d6/7QLTUnaS5OI/XY/PwzlxBwkodMXUlr4gHbq
 2fxn0lhQQGo6fxHsTYCOUhEjzOXsr8WSfPD8hwgXcyt8=
X-Google-Smtp-Source: AGHT+IHmZb2ovoIujKXapX+UcdnRu8UmluaJHRHVolf48ZGcu3nrvKTQp3rQeUKIqOPeiBN/K034hw==
X-Received: by 2002:a05:600c:4686:b0:431:59b2:f0c4 with SMTP id
 5b1f17b1804b1-433ce41ce37mr109056585e9.8.1732494913223; 
 Sun, 24 Nov 2024 16:35:13 -0800 (PST)
Received: from ?IPV6:2a02:8389:41cf:e200:c9da:d8c1:1564:6a36?
 (2a02-8389-41cf-e200-c9da-d8c1-1564-6a36.cable.dynamic.v6.surfer.at.
 [2a02:8389:41cf:e200:c9da:d8c1:1564:6a36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb2683bsm8994516f8f.48.2024.11.24.16.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Nov 2024 16:35:11 -0800 (PST)
Message-ID: <95f01caa-0f32-4c5c-b262-435f839c81aa@gmail.com>
Date: Mon, 25 Nov 2024 01:35:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] drm for 6.13-rc1
To: Dave Airlie <airlied@gmail.com>, Sasha Levin <sashal@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, wenst@chromium.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CAPM=9txbfH8vf-YjwTXEYL729a6r2eeLBxCJc3MSD-t5jXVA-w@mail.gmail.com>
 <Z0NXQ6iRK43x6WbG@sashalap>
 <CAPM=9tw5eTBCDn93GyrMjF3r_kDbr2-v1GgKdZECFNupqakDFw@mail.gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <CAPM=9tw5eTBCDn93GyrMjF3r_kDbr2-v1GgKdZECFNupqakDFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 24/11/2024 23:58, Dave Airlie wrote:
> On Mon, 25 Nov 2024 at 02:41, Sasha Levin <sashal@kernel.org> wrote:
>>
>> On Thu, Nov 21, 2024 at 10:25:45AM +1000, Dave Airlie wrote:
>>> Hi Linus,
>>>
>>> This is the main drm pull request for 6.13.
>>>
>>> I've done a test merge into your tree, there were two conflicts both
>>> of which seem easy enough to resolve for you.
>>>
>>> There's a lot of rework, the panic helper support is being added to
>>> more drivers, v3d gets support for HW superpages, scheduler
>>> documentation, drm client and video aperture reworks, some new
>>> MAINTAINERS added, amdgpu has the usual lots of IP refactors, Intel
>>> has some Pantherlake enablement and xe is getting some SRIOV bits, but
>>> just lots of stuff everywhere.
>>>
>>> Let me know if there are any issues,
>>
>> Hey Dave,
>>
>> After the PR was merged, I've started seeing boot failures reported by
>> KernelCI:
> 
> I'll add the mediatek names I see who touched anything in the area recently.
> 
> Dave.
>>
>> [    4.395400] mediatek-drm mediatek-drm.5.auto: bound 1c014000.merge (ops 0xffffd35fd12975f8)
>> [    4.396155] mediatek-drm mediatek-drm.5.auto: bound 1c000000.ovl (ops 0xffffd35fd12977b8)
>> [    4.411951] mediatek-drm mediatek-drm.5.auto: bound 1c002000.rdma (ops 0xffffd35fd12989c0)
>> [    4.536837] mediatek-drm mediatek-drm.5.auto: bound 1c004000.ccorr (ops 0xffffd35fd1296cf0)
>> [    4.545181] mediatek-drm mediatek-drm.5.auto: bound 1c005000.aal (ops 0xffffd35fd1296a80)
>> [    4.553344] mediatek-drm mediatek-drm.5.auto: bound 1c006000.gamma (ops 0xffffd35fd12972b0)
>> [    4.561680] mediatek-drm mediatek-drm.5.auto: bound 1c014000.merge (ops 0xffffd35fd12975f8)
>> [    4.570025] ------------[ cut here ]------------
>> [    4.574630] refcount_t: underflow; use-after-free.
>> [    4.579416] WARNING: CPU: 6 PID: 81 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x148
>> [    4.587670] Modules linked in:
>> [    4.590714] CPU: 6 UID: 0 PID: 81 Comm: kworker/u32:3 Tainted: G        W          6.12.0 #1 cab58e2e59020ebd4be8ada89a65f465a316c742
>> [    4.602695] Tainted: [W]=WARN
>> [    4.605649] Hardware name: Acer Tomato (rev2) board (DT)
>> [    4.610947] Workqueue: events_unbound deferred_probe_work_func
>> [    4.616768] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [    4.623715] pc : refcount_warn_saturate+0xf4/0x148
>> [    4.628493] lr : refcount_warn_saturate+0xf4/0x148
>> [    4.633270] sp : ffff8000807639c0
>> [    4.636571] x29: ffff8000807639c0 x28: ffff34ff4116c640 x27: ffff34ff4368e080
>> [    4.643693] x26: ffffd35fd1299ac8 x25: ffff34ff46c8c410 x24: 0000000000000000
>> [    4.650814] x23: ffff34ff4368e080 x22: 00000000fffffdfb x21: 0000000000000002
>> [    4.657934] x20: ffff34ff470c6000 x19: ffff34ff410c7c10 x18: 0000000000000006
>> [    4.665055] x17: 666678302073706f x16: 2820656772656d2e x15: ffff800080763440
>> [    4.672176] x14: 0000000000000000 x13: 2e656572662d7265 x12: ffffd35fd2ed14f0
>> [    4.679297] x11: 0000000000000001 x10: 0000000000000001 x9 : ffffd35fd0342150
>> [    4.686418] x8 : c0000000ffffdfff x7 : ffffd35fd2e21450 x6 : 00000000000affa8
>> [    4.693539] x5 : ffffd35fd2ed1498 x4 : 0000000000000000 x3 : 0000000000000000
>> [    4.700660] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff34ff40932580
>> [    4.707781] Call trace:
>> [    4.710216]  refcount_warn_saturate+0xf4/0x148 (P)
>> [    4.714993]  refcount_warn_saturate+0xf4/0x148 (L)
>> [    4.719772]  kobject_put+0x110/0x118
>> [    4.723335]  put_device+0x1c/0x38
>> [    4.726638]  mtk_drm_bind+0x294/0x5c0
>> [    4.730289]  try_to_bring_up_aggregate_device+0x16c/0x1e0
>> [    4.735673]  __component_add+0xbc/0x1c0
>> [    4.739495]  component_add+0x1c/0x30
>> [    4.743058]  mtk_disp_rdma_probe+0x140/0x210
>> [    4.747314]  platform_probe+0x70/0xd0
>> [    4.750964]  really_probe+0xc4/0x2a8
>> [    4.754527]  __driver_probe_device+0x80/0x140
>> [    4.758870]  driver_probe_device+0x44/0x120
>> [    4.763040]  __device_attach_driver+0xc0/0x108
>> [    4.767470]  bus_for_each_drv+0x8c/0xf0
>> [    4.771294]  __device_attach+0xa4/0x198
>> [    4.775117]  device_initial_probe+0x1c/0x30
>> [    4.779286]  bus_probe_device+0xb4/0xc0
>> [    4.783109]  deferred_probe_work_func+0xb0/0x100
>> [    4.787714]  process_one_work+0x18c/0x420
>> [    4.791712]  worker_thread+0x30c/0x418
>> [    4.795449]  kthread+0x128/0x138
>> [    4.798665]  ret_from_fork+0x10/0x20
>> [    4.802229] ---[ end trace 0000000000000000 ]---
>>
>> I don't think that I'll be able to bisect further as I don't have the
>> relevant hardware available.
>>
>> --
>> Thanks,
>> Sasha


Hello, I am one of those who touched something in the area.

To check if my changes are the cause of the boot failures, please apply
this patch:

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9a8ef8558da9..85be035a209a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -373,11 +373,12 @@ static bool mtk_drm_get_all_drm_priv(struct device
*dev)
 	struct mtk_drm_private *temp_drm_priv;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
+	struct device_node *node;
 	struct device *drm_dev;
 	unsigned int cnt = 0;
 	int i, j;

-	for_each_child_of_node_scoped(phandle->parent, node) {
+	for_each_child_of_node(phandle->parent, node) {
 		struct platform_device *pdev;

 		of_id = of_match_node(mtk_drm_of_ids, node);


---


This chunk can be found in mtk_drm_get_all_drm_priv(), which is not
listed in the trace, but it is called from mtk_drm_bind().

The loop did not release the child_node if cnt == MAX_CRTC (by means of
a break), which goes against how for_each_child_of_node() should be
handled. If the child_node is indeed required afterwards (it is not
referenced anywhere after the loop), it should be acquired via
of_node_get() and stored somewhere to be able to put it later.

Then another issue would lie underneath as the reference to the
child_node is not stored in any way. But if this patch fixes the issue,
then I suppose it should be applied immediately, and the rest should be
discussed later on.

By the way, are there any logs with debug/error messages to analyze
further is the issue is something different?

Thanks and best regards,
Javier Carrasco
