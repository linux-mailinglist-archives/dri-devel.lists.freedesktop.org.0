Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DfkHprzlWlTWwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 18:15:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAB315828A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 18:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1667710E606;
	Wed, 18 Feb 2026 17:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YSMjRkq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7386D10E606
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 17:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771434900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xm1Nmfmv6nKrRksdRVhDRN/vEcg8hHt9kLWtxxaZhMo=;
 b=YSMjRkq7hUm60KdJ5Pu5kIGYhCT/81QFixY/3Xc8W7niG/KiP6wMDEy0mr6HOODgsDp7Q+
 fuFJg0YY7jU1HZUjJvyLhsFtXSmZz5rC/R8tX74w0StopzH/BO0I4rRJp3GojUYFpoDTx9
 GlT157no/AISC/zJm9Pu5lFa0wXWA+g=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-IecguacVOrycAJ1HOIK5ig-1; Wed, 18 Feb 2026 12:14:59 -0500
X-MC-Unique: IecguacVOrycAJ1HOIK5ig-1
X-Mimecast-MFC-AGG-ID: IecguacVOrycAJ1HOIK5ig_1771434899
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-897021ebe91so2809346d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 09:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771434898; x=1772039698;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xm1Nmfmv6nKrRksdRVhDRN/vEcg8hHt9kLWtxxaZhMo=;
 b=ulw633aHGBgPpb1c7lt5udASVbRbs60F2541kX3tm5mRcTx459ENjYcZjmtkslVpYu
 t6Z3Q/vVQfDYK3zBqMS+ShRKUfj5KOxhMyn0D85KNpz+1K12jt9mh79AfkmIbYCEgc8L
 EjDmJnp9H0LJ1PYKEykU5TeA7sBRSz2zQpnDFvCFWGaVPORNRhlO/pIgrk8IRI22x0Da
 WMgkyyAhk0XoeDXjTwgPGeaK1yHB2hhXnH0UBWp5fhon+W1YROYpHQsssdWHCQRgzZ8l
 yRCF5qonZjtTLMlYULUH8tFxqgsGf2B1UP718aDxXoNwah2kpgK06lsyTHHih9vd3EZZ
 85CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnUSYqbVZfkcgeWsFo85EW/QulTuSIbvDbxzYrMeMBcOVOMHzrfQxa+E3iNFJ0VwaSgavtJYOXQ34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz050fPWNCCTve3qngM0E+mBqsgDn2SLw9kRl6V4ROAhS6W2ntV
 mu9bsKOD8w6m2yqg9z563V43sfd57Va2bKdfRWGv0X/lWaheTZ5JQFr0WrI9CjosDnTS3Ooxxz6
 5v1m9MlV5wJ3JGS/j6HMelJYSuMVUeJ6/tQhifFHGCYu1Z4pHv2IGMuocxE8LOht275ZeFA==
X-Gm-Gg: AZuq6aJHY7SUycLYf2kWwnOq425BhCIKiJLY1pTYllEWuG3FmfVI41hlbUnRL/qFGtt
 vdvlel9LOGpfK9N5humGpRCP4O/xYpxdRRURMajjny6VnJBsYQQNVgg/AS/2Z/9TGfM6joos6sV
 1qGS+ZgT9DweiW9UVDbLbkYHJcWVS3pj1ZUrZxItkviuFB39PVYWDZ8EX/QRk2oRmkWox+jGR/H
 44MoOM2su7ASU7KJxm/GOwcFzhBWWD8du6NipTImaqBS5U99gWWAUDj/1hnOA6YcpKobE6S1dW6
 hpcGkgv4On9cWPv5slPtvqXCH/5IOYDsXEUiFSbaKKOA30MIkSujRSmabclSyhiOS1j+G/ufzWe
 9dtmm0eqHU0UdSeZEidVmOUyW5Cuxuedm3P0afpRmnw3ag+dNsqYJXK5hbD4RwA4=
X-Received: by 2002:a05:6214:c21:b0:894:73b9:d31c with SMTP id
 6a1803df08f44-8974047b86cmr215133066d6.33.1771434898359; 
 Wed, 18 Feb 2026 09:14:58 -0800 (PST)
X-Received: by 2002:a05:6214:c21:b0:894:73b9:d31c with SMTP id
 6a1803df08f44-8974047b86cmr215132386d6.33.1771434897854; 
 Wed, 18 Feb 2026 09:14:57 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net.
 [100.17.19.56]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8971cca6fddsm186357896d6.19.2026.02.18.09.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 09:14:57 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Subject: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
Date: Wed, 18 Feb 2026 12:14:09 -0500
Message-Id: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NQQ6CMBCF4auQWTumLQSpK+5hWIx0arsokBYbD
 eHuVuLS5feS+WeDxNFzgmu1QeTsk5+nAnWqYHQ0PRi9KQYlVCuk6tAEuj8tOqYFx0DFHNA2Ugl
 SxjbUQTldIlv/OrK3odj5tM7xfXzJ8rv+grX4H8wSJdZtc2HSumat+8jG0Xoe5wDDvu8fvz0pl
 7kAAAA=
X-Change-ID: 20260128-dmabuf-heap-cma-dmem-f4120a2df4a8
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
 linux-mm@kvack.org, Eric Chanudet <echanude@redhat.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uxD9B9Jr_Rc6exbL2zFNik8sdUyLhAJwqOstCxqRnLU_1771434899
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:mripard@redhat.com,m:aesteve@redhat.com,m:linux-mm@kvack.org,m:echanude@redhat.com,m:mripard@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[echanude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[echanude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CCAB315828A
X-Rspamd-Action: no action

An earlier series[1] from Maxime introduced dmem to the cma allocator in
an attempt to use it generally for dma-buf. Restart from there and apply
the charge in the narrower context of the CMA dma-buf heap instead.

In line with introducing cgroup to the system heap[2], this behavior is
enabled based on dma_heap.mem_accounting, disabled by default.

dmem is chosen for CMA heaps as it allows limits to be set for each
region backing each heap. The charge is only put in the dma-buf heap for
now as it guaranties it can be accounted against a userspace process
that requested the allocation.

[1] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org/
[2] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com/

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
Changes in v2:
- Rebase on Maxime's introduction of dmem to the cma allocator:
  https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org/
- Remove the dmem region registration from the cma dma-buf heap
- Remove the misplaced logic for the default region.
- Link to v1: https://lore.kernel.org/r/20260130-dmabuf-heap-cma-dmem-v1-1-3647ea993e99@redhat.com

---
Eric Chanudet (1):
      dma-buf: heaps: cma: charge each cma heap's dmem

Maxime Ripard (2):
      cma: Register dmem region for each cma region
      cma: Provide accessor to cma dmem region

 drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
 include/linux/cma.h              |  9 +++++++++
 mm/cma.c                         | 20 +++++++++++++++++++-
 mm/cma.h                         |  3 +++
 4 files changed, 45 insertions(+), 2 deletions(-)
---
base-commit: 948e195dfaa56e48eabda591f97630502ff7e27e
change-id: 20260128-dmabuf-heap-cma-dmem-f4120a2df4a8

Best regards,
-- 
Eric Chanudet <echanude@redhat.com>

