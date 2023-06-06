Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC135724FB8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 00:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0145C10E3F9;
	Tue,  6 Jun 2023 22:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBBF10E3F9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 22:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686090747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+GODPjGDP/v7EDtsYhu3OhDhbf8tl4sgje/Azf5bvXY=;
 b=VSUOpjP5ghZm7BUDH7AA8pBQl7fgywwxiKyavOIqxxOzim13pO9i7cLOeclHwiPRyFYR0Q
 KM/bWEGKExlUqD9sY0PCfwHKngshxxjpHSaHqzXhYCpyIs5jlVow/IViJ2W7IvRmKQvDMC
 Hr/goej4/EXX49+3ZWrq6E9PR9ecXgc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-6mb22ceKOM27zA5YD-FAWA-1; Tue, 06 Jun 2023 18:32:26 -0400
X-MC-Unique: 6mb22ceKOM27zA5YD-FAWA-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5147e3dfccdso138393a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 15:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686090745; x=1688682745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GODPjGDP/v7EDtsYhu3OhDhbf8tl4sgje/Azf5bvXY=;
 b=gbiy34SVxv9xjc9Ig/3lcnkCLCan5m6fPZdlBOOYIye83sHRAhuupcX03YmYk5ni/Y
 519VxNFkAQuSIKMivGqLaYt8wS6LbLM0Vhu/A6kml5xt4pKQkmQvK+ySnoFnqB3SgUK4
 H6DOrDGs/BE8GOKzUmQV268zz77/z78vIxjbyPQIpVyY1Mg8VyLSfIFVBgAe4RxCcIZU
 dwL6hZqTO6t+i3aB2LmWZTcPvGi2diG0EPTU1AAuLfzFGiOWy+hqdb1cBYB034WN8B+L
 Ip7SOP7MglrpJSImG096FC8Hdyzdj35nXE2biouPlFXUSYO+MDa6jx7+nd4F6XmM0ihe
 PRgA==
X-Gm-Message-State: AC+VfDyOBMaGEA9rMvWpAVjvXdIxCFu/Lng/dQh6oaf9iYNmLRYkl3K/
 fH2SMzZ75D29VI8suRQtyTOp6od//QY1+n1Rz5zxzghDlcn8lp3x9K1wpVCdMdZb4gz3nXomhYw
 RUOMWCl7Ld6/f7rYvVw0TOpVHCxzL
X-Received: by 2002:a17:907:6d8c:b0:977:1dae:2500 with SMTP id
 sb12-20020a1709076d8c00b009771dae2500mr3525005ejc.1.1686090745182; 
 Tue, 06 Jun 2023 15:32:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5pXjStykgCRHkdCNjmAkm6vVNZZG6Y41YgQd0R/5sajw/EqO04vf8XvQY4ctgh++fIqqeaSg==
X-Received: by 2002:a17:907:6d8c:b0:977:1dae:2500 with SMTP id
 sb12-20020a1709076d8c00b009771dae2500mr3524986ejc.1.1686090745037; 
 Tue, 06 Jun 2023 15:32:25 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a17090607da00b00977d6723bd6sm3457973ejc.195.2023.06.06.15.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 15:32:24 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v4 11/14] drm/nouveau: chan: provide
 nouveau_channel_kill()
Date: Wed,  7 Jun 2023 00:31:27 +0200
Message-Id: <20230606223130.6132-12-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
References: <20230606223130.6132-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new VM_BIND UAPI implementation introduced in subsequent commits
will allow asynchronous jobs processing push buffers and emitting fences.

If a job times out, we need a way to recover from this situation. For
now, simply kill the channel to unblock all hung up jobs and signal
userspace that the device is dead on the next EXEC or VM_BIND ioctl.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 14 +++++++++++---
 drivers/gpu/drm/nouveau/nouveau_chan.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index f47c0363683c..a975f8b0e0e5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -40,6 +40,14 @@ MODULE_PARM_DESC(vram_pushbuf, "Create DMA push buffers in VRAM");
 int nouveau_vram_pushbuf;
 module_param_named(vram_pushbuf, nouveau_vram_pushbuf, int, 0400);
 
+void
+nouveau_channel_kill(struct nouveau_channel *chan)
+{
+	atomic_set(&chan->killed, 1);
+	if (chan->fence)
+		nouveau_fence_context_kill(chan->fence, -ENODEV);
+}
+
 static int
 nouveau_channel_killed(struct nvif_event *event, void *repv, u32 repc)
 {
@@ -47,9 +55,9 @@ nouveau_channel_killed(struct nvif_event *event, void *repv, u32 repc)
 	struct nouveau_cli *cli = (void *)chan->user.client;
 
 	NV_PRINTK(warn, cli, "channel %d killed!\n", chan->chid);
-	atomic_set(&chan->killed, 1);
-	if (chan->fence)
-		nouveau_fence_context_kill(chan->fence, -ENODEV);
+
+	if (unlikely(!atomic_read(&chan->killed)))
+		nouveau_channel_kill(chan);
 
 	return NVIF_EVENT_DROP;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index e06a8ffed31a..e483f4a254da 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -65,6 +65,7 @@ int  nouveau_channel_new(struct nouveau_drm *, struct nvif_device *, bool priv,
 			 u32 vram, u32 gart, struct nouveau_channel **);
 void nouveau_channel_del(struct nouveau_channel **);
 int  nouveau_channel_idle(struct nouveau_channel *);
+void nouveau_channel_kill(struct nouveau_channel *);
 
 extern int nouveau_vram_pushbuf;
 
-- 
2.40.1

