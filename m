Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9DAD143B2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 18:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04E810E425;
	Mon, 12 Jan 2026 17:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="d3e0nWqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE5C10E424
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 17:04:37 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8b220ddc189so901091685a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 09:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768237477; x=1768842277; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OcyVQ16xm+GiG5uZamh0DYF4z7rm9kbmhFMirpeUsGo=;
 b=d3e0nWqmoYb1mfAacjwOTxbuRvipjpxrk59fO+TH1Xzi9KuaVFxdqqCTAh6TieL+td
 Zx5s5SKNCrtmC0Y3TAhgtFkW0mIqHbIs8TF2DdY2prtuOfaAullPG10vpD6ZP3SpJFJa
 2mzDhTGSp++V8sbHZ2+D/E9KaPbkymAd2Mi3R7YTEBLweFEEnyFgu5fVV44OKnn6klKp
 EBfHzhZV6iVGAO9YQZ6tvU7/gzGIiPk8zBg6hWWrOkZxHaX7dFUut5Dr5Za7gkQBdPP4
 xBXiJIL/Tr8S4t6GGjxkS2Ur8A8FGh3ZknzQUBE6AmRf6LptB/+goVneepm6rjnJnRQI
 wvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768237477; x=1768842277;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OcyVQ16xm+GiG5uZamh0DYF4z7rm9kbmhFMirpeUsGo=;
 b=RRD6yTBIUXJQvH1WCDAFHwE6+0L5qVgCwWAhgiFDPOFmbPlhtTe5z7p8nHbVMTqqkP
 93JEs+vpWfAaWcQvT6w/CjWte7dd3rcJJXSPpK59qYyQMS5eZLtlvmYta/VNZG4HA7Xx
 qnQbCy/xqVZL+I1j5YZpAdzlAJe59bo05fsqMHn1oy+UVk6s2pYFt0ZpsoXMhSel5BIW
 ED9EYOL76KGRbSrmTiFWhd+TFfPagKTg+2cGW405wRQ90hZTiLwzgt7emud/k0YLAWyn
 3sXHSMWJujbz6o40CAARGb7jGQZiFR1Wr89Tce3b91zdg9tMuhnxvG0BsEh4wx4NAHv+
 6yww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdTmjaDe3Oer/Dfc1PScFLRr9weyN86SqjijS24ty2fs+uEddeUE0pxd0J7ipZYGrS8dGiu4Ow0P4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyP9LfdnCVK9svEIMMSUbWmwRXETwxmuaI0wMFzwGomZY/Zl/ga
 kvRb+SEwpL7wvb+w/v/tSu653tYq1be3jJtdghElFM1n7uHIYjjkNqmIZRqivwhA3n0=
X-Gm-Gg: AY/fxX5vKW295NpwxgcGHAbzJpBiliUTJcDeAiSc2Fo9jRgsmHFsXYzHcPCjGOW2izU
 uzNKjXo4GIKy7KQZLHlROUU/m+S4mIRlIrQB/XPsx4QJUREJH7j23e8RP85diivrJjZzZ8dZJP0
 iH2aTxLRG0LDl+1huXBZiAKk7taq+y/stwKItiRWcMI1ZDN5L0HdiIXbG6T5+tFoOTdq5qZ0Vl+
 C/Q7f1NKcwZ851K5LXRNyEn5nL+xbtaVBUFenl1S4CDpF+CX9v8ji4o+dmccqL9xAV5cO8s0p3j
 nsnDiB57c56C0M1BH4KPcn3v1bxf6w0CO/tU5bVeQqajjUjd2/mUA09b08d+tr8OEyAx2E9pGUn
 NOnIjmuqiZYVjSmJttx7ZXVaZ0Lq4mnj6KDbxVEDEebtYxnQRkuh5jIg2u5dno6KrhG3k2XCirf
 2iOaBNlaH+HNfhIBpniqOCWFBdegRFyRcfxWydj+oMF6eppnDL0MfTLFcn7wdUi0Ux4Y1cM5GZS
 qIZCA==
X-Google-Smtp-Source: AGHT+IFNLsjliAScqbFFhKVSqiGiRJW+dH1w6MdFsmu8SpI9IHI7Dx7AHxGoF9vGvT6LPNemfh4Zsw==
X-Received: by 2002:a05:620a:2807:b0:8b5:5a03:36e3 with SMTP id
 af79cd13be357-8c38936c4e7mr2741533585a.16.1768237475821; 
 Mon, 12 Jan 2026 09:04:35 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f51cdcesm1544825185a.26.2026.01.12.09.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 09:04:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vfLLG-00000003RoH-2rL8;
 Mon, 12 Jan 2026 13:04:34 -0400
Date: Mon, 12 Jan 2026 13:04:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Leon Romanovsky <leon@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Alex Williamson <alex@shazbot.org>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 0/4] dma-buf: add revoke mechanism to invalidate shared
 buffers
Message-ID: <20260112170434.GH745888@ziepe.ca>
References: <20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com>
 <eed9fd4c-ca36-4f6a-af10-56d6e0997d8c@amd.com>
 <20260112121956.GE14378@unreal>
 <2db90323-9ddc-4408-9074-b44d9178bc68@amd.com>
 <20260112141440.GE745888@ziepe.ca>
 <f7f1856a-44fa-44af-b496-eb1267a05d11@amd.com>
 <20260112153503.GF745888@ziepe.ca>
 <f2f82341-3799-4379-a0e7-6e9d56a7eda1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2f82341-3799-4379-a0e7-6e9d56a7eda1@amd.com>
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

On Mon, Jan 12, 2026 at 05:12:36PM +0100, Christian König wrote:
> > static struct dma_buf_attach_ops ib_umem_dmabuf_attach_pinned_ops = {
> > 	.allow_peer2peer = true,
> > 	.move_notify = ib_umem_dmabuf_unsupported_move_notify,
> > };
> > 
> > So we can't just allow it to attach to exporters that are going to
> > start calling move_notify while pinned.
> 
> The point is exporters are already doing this.

:( So obviously this doesn't work fully correctly..

> > Which is why we are coming to negotiation because at least the above
> > isn't going to work if move_notify is called for revoke reasons, and
> > we'd like to block attaching exporters that need revoke for the above.
> 
> Ah, yes that makes sense. This is clearly a new requirement.
> 
> So basically for PCIe hotplug was a rare event were we said we have
> some problems with non-ODP but we can live with that, but for this
> use case here it's more like a perfectly normal condition that
> userspace can trigger.

Yes that seems to be exactly the case. I didn't know about the PCI RAS
case until now :(

> So the exporter wants to reject importers which can't handle a
> mapping invalidation while the BO is pinned, correct?

Yes. I think at a minimum exporters where it is a normal use case
should block it so unpriv user space cannot trigger incorrect behavior
/ ignored invalidation. ie VFIO will trigger this based on unpriv user
system calls.

I supposed we have to retain the PCI RAS misbehavior for now at least.
It would probably be uAPI regression to start blocking some of the
existing ones.

It also seems we should invest in the RDMA side to minimize where this
is used.

> > So, would you be happier with this if we documented that move_notify
> > can be called for pinned importers for revoke purposes and figure out
> > something to mark the above as special so exporters can fail pin if
> > they are going to call move_notify?
> 
> That would work for me. I mean it is already current practice, we
> just never fully documented it.

OK
 
> > Then this series would transform into documentation, making VFIO
> > accept pin and continue to call move_notify as it does right now, and
> > some logic to reject the RDMA non-ODP importer.
> 
> I think we just need to expose this with flags or similar from the
> importer side. As far as I know RDMA without ODP is currently the
> only one really needing this (except for cross device scanout, but
> that is special anyway).

I did not see any other importers with an obvious broken move_notify,
so I hope this is right. Even iommufd has a working move_notify
(disruptive, but working).

How do you feel about an enum in the ops:

+enum dma_buf_move_notify_level {
+	/*
+	 * The importer can pause HW access while move_notify is running
+	 * and cleanly handle dynamic changes to the DMA mapping without
+	 * any disruption.
+	 */
+	DMA_BUF_MOVE_NOTIFY_FAULTING = 0,
+	/*
+	 * The importer can stop HW access and disruptively fail any
+	 * of its DMA activity. move_notify should only be called if the
+	 * exporter is experiencing an unusual error and can accept
+	 * that the importer will be disrupted.
+	 */
+	DMA_BUF_MOVE_NOTIFY_REVOKING,
+	/*
+	 * move_notify is not supported at all and must not be called. Do not
+	 * introduce new drivers using this, it has significant draw backs
+	 * around PCI error handling and other cases. It has the most limited
+	 * set of compatible importers.
+	 */
+	DMA_BUF_MOVE_NOTIFY_UNSUPPORTED,
+};
+
 /**
  * struct dma_buf_attach_ops - importer operations for an attachment
  *
@@ -457,6 +480,8 @@ struct dma_buf_attach_ops {
 	 */
 	bool allow_peer2peer;
 
+	enum dma_buf_move_notify_level move_notify_level;
+
 	/**
 	 * @move_notify: [optional] notification that the DMA-buf is moving
 	 *

Jason
