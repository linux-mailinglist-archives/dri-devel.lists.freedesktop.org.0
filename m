Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIwFBvMGi2kdPQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAC711995D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA3E10E132;
	Tue, 10 Feb 2026 10:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d/DHxXo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36F410E132
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:22:37 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso51822775e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770718956; x=1771323756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=os/k6iwlWF1gaj/KEHCUCqdNHK29HjiIL5zJuBYNngA=;
 b=d/DHxXo/S7sZsgYkUxxVD6Vzk7v0I23b8bWLQWQfUO+eVbIfXcIpUWod0Wgs/tmWwX
 3qRfaOJbVbIhpJNeGc+J7dnY9AZTvTu0dXgBb7SH9dy0g6qNcTaOIZp+Yz50+l/M5TzH
 vcos6jOoGgKbw9V6z3L8SNudu+sOgiEXo4jI0LA8giaPSNDiHdPIypJlNYVsB6llCYig
 x3hjaIioIE9scKaVXHj4sqOP6p6fgnzy9JteibKStK1H3blfUPq0wljqxjxr2L4nQ99R
 BL2TD88Wbb1+mrNQsIpSNTeCe/Cn4ZlD2DT3dFMn5leWz52a1S6ChWF3rRIasnNS1T4Z
 GJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770718956; x=1771323756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=os/k6iwlWF1gaj/KEHCUCqdNHK29HjiIL5zJuBYNngA=;
 b=Pvg9OJFB5vOGaI95KHSrJSPvu9ZyKxQl8DAkxRUQjlObSlukgucZKdcIlJWidDgnxi
 7HSvJIUscK3SHSImu/zX4LphGt4qLn82zTXAvoqoLT6gUVOJjpG+luZxq4xEFxSkZUIf
 GArZtIQIsTGRwFWoPEdVx0csd7zVVZmhisx1M/yvbZBJrWv/gGNzqPEHzXcsDcDvY0Z2
 awdqLMZ01ciz7T90XrowLkNZVs3vZqp2IRjWtYnkj/QSyTIzY9nXA/oyOvHmfnSQ5jTA
 HdghOMbX5i/NQPAFgbPjdB5lSSlgh77UfKwBL5U6K3/sbnb7uhZ9hFTawYNYTM7+VBja
 o6OA==
X-Gm-Message-State: AOJu0YxwKXGvh485xSzKG5KlV44tY0/H4hPiGtaTi9VRKbnYtQnizPAU
 pJ1NhlVy6/ouZbG8QH5m7vB6EnnggNq2r4QqJEZ1Zs3vJufTsUCw1GbZ
X-Gm-Gg: AZuq6aLKlS46CLJ+vtBLMK+3vm+vqlGkPRYjSTr59RXPOMi2HHm55S4mWNoxAItlNHQ
 /Zzd6mcLnr0iOuky6CbvL65djoEbD4va//XBjY3WQkuDFvjXZF6MoSGItkSlFpNgoqbT1hcyR7C
 9lvpwQq9T2XS/Y1sc/AZlcYeFkv4yROAEY6AFqHeqbtm0FBkc683lIjAhr07uVyOWiKG0HcEE1Q
 +MVYXW13pITDlEZBs4vctp66j9e4Bqdh6kQU3lKR0W+J4gYJaMxmPPFRvN9Q+vxLdqshKQyD6gq
 VRc5DZUOWuKhUMe481c3NgVtwzNSSh5C7whrngGzBAq57Vg8zvhUDmh2ZWkjTqxKMGDR5dN2Vzn
 okd6nMpAK4Ho9dhm3nLqC0Z8lcKOeysL5oBUWYCQ8GZPQGzYK+/iYMLgxioGieiBOalFiutrSbs
 zTE/54qnF6lLnL58ZajuuCOgNPNPI51vV3IULA
X-Received: by 2002:a05:600c:3547:b0:47e:e59c:67c5 with SMTP id
 5b1f17b1804b1-48350521bebmr24853315e9.8.1770718956038; 
 Tue, 10 Feb 2026 02:22:36 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:6000:83ca:11f0:7e35:a75d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d8ebfsm81549605e9.2.2026.02.10.02.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 02:22:35 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Independence for dma_fences! v7
Date: Tue, 10 Feb 2026 11:01:55 +0100
Message-ID: <20260210102232.1642-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [-0.10 / 15.00];
	R_MIXED_CHARSET(0.71)[subject];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid]
X-Rspamd-Queue-Id: 6EAC711995D
X-Rspamd-Action: no action

Hi everyone,

dma_fences have ever lived under the tyranny dictated by the module
lifetime of their issuer, leading to crashes should anybody still holding
a reference to a dma_fence when the module of the issuer was unloaded.

The basic problem is that when buffer are shared between drivers
dma_fence objects can leak into external drivers and stay there even
after they are signaled. The dma_resv object for example only lazy releases
dma_fences.

So what happens is that when the module who originally created the dma_fence
unloads the dma_fence_ops function table becomes unavailable as well and so
any attempt to release the fence crashes the system.

Previously various approaches have been discussed, including changing the
locking semantics of the dma_fence callbacks (by me) as well as using the
drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
from their actual users, but none of them are actually solving all problems.

Tvrtko did some really nice prerequisite work by protecting the returned
strings of the dma_fence_ops by RCU. This way dma_fence creators where
able to just wait for an RCU grace period after fence signaling before
they could be save to free those data structures.

Now this patch set here goes a step further and protects the whole
dma_fence_ops structure by RCU, so that after the fence signals the
pointer to the dma_fence_ops is set to NULL when there is no wait nor
release callback given. All functionality which use the dma_fence_ops
reference are put inside an RCU critical section, except for the
deprecated issuer specific wait and of course the optional release
callback.

Additional to the RCU changes the lock protecting the dma_fence state
previously had to be allocated external. This set here now changes the
functionality to make that external lock optional and allows dma_fences
to use an inline lock and be self contained.

v4:

Rebases the whole set on upstream changes, especially the cleanup
from Philip in patch "drm/amdgpu: independence for the amdkfd_fence!".

Adding two patches which brings the DMA-fence self tests up to date.
The first selftest changes removes the mock_wait and so actually starts
testing the default behavior instead of some hacky implementation in the
test. This one got upstreamed independent of this set.
The second drops the mock_fence as well and tests the new RCU and inline
spinlock functionality.

v5:

Rebase on top of drm-misc-next instead of drm-tip, leave out all driver
changes for now since those should go through the driver specific paths
anyway.

Address a few more review comments, especially some rebase mess and
typos. And finally fix one more bug found by AMDs CI system.

v6:

Minor style changes, re-ordered patch #1, dropped the scheduler fence
change for now

v7:

The patch adding the dma_fence_was_initialized() function was pushed
upstream individually since that is really an independent cleanup.

Fixed some missing i915 bits in patch "dma-buf: abstract fence locking".

Please review and comment,
Christian.

