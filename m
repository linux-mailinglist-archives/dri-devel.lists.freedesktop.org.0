Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E53A51746B
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2588510F05C;
	Mon,  2 May 2022 16:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38E610F05C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:37:28 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w4so20211391wrg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=COh3IJfwy846oumlMkgPJInjAr/nsMBwOyb23bgz0lI=;
 b=XqfYsPd37YQ0wPyDb2tewxVQmfVGsSpl3TJ3jxn7XMS3031B4AvpkhldJiATqEFuOl
 TiL/UASlUflsQVKkaZ5JcEOycN2iZILkWbzJvds8Bvoo6FnEIvAcoF8wK5qTKHUP7ohW
 HPmYbqxBiCr754RRQT1XCk2+ErHpzTipBUeqBphruGIAdx8IEAqz0RpaRec2gc9rpQ1c
 rHuFgf0Fiacjgqqq2nVDX4y5RIbToTZmnGdTA8pXgksyy7MiAjFRsSICfPpETHXf86yQ
 RlBzQnjGQaGM0HjW6eTtp+S6FSNDXtGTo3ZdmXXFRJWciJ9eWPINuCvyFrx814MrpC48
 3YTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=COh3IJfwy846oumlMkgPJInjAr/nsMBwOyb23bgz0lI=;
 b=25PyADRgKWcdWt42NPiI7h9bRoVcGldQmkT6nGQE18ho3Z9IInCtPCuEIiUSWvbt9/
 VmQsCzWGlRnDowU06vRp7YSdSgJOBVxuKzWuu1LHW091CbBavWGF77O9Cmh/yqWAC41c
 Cm6pKNORtHCZ4vyE/FTEJGIcwLMXQYRB/3GgD7ySrEzEh2WQsMl2FJv8F+nl9eMO22Xx
 wCEuNH4Qe6cCjCHeLHDXPZ2Bm5NZ9fyZZw88pTHlhydD7ddyVLCP3BXHf5MnqBs5TBZZ
 Iz+6RbxmovIA3KKiKViBp2a0HqhV4JJWIXhC6UeW8ZsG3+3IxGikofFSjHTnNPngWPt9
 UxLQ==
X-Gm-Message-State: AOAM531f7o2jaU4WReD+eLXCr9+2j637S7P551VRbo6aOeNhdjTOl+h+
 s87ACeCwSFOzsHzLfRDOxjypnVAfItU=
X-Google-Smtp-Source: ABdhPJy03s4PE7OwMq1frxy6huyo77/V1s5NOyyLjSguDd34niphgTgma7qdmcKzn+dduypfAbButA==
X-Received: by 2002:a5d:47c5:0:b0:20c:5a48:7162 with SMTP id
 o5-20020a5d47c5000000b0020c5a487162mr7162226wrc.32.1651509447326; 
 Mon, 02 May 2022 09:37:27 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:37:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
 skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, tzimmermann@suse.de,
 tvrtko.ursulin@linux.intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Tackling the indefinite/user DMA fence problem
Date: Mon,  2 May 2022 18:37:07 +0200
Message-Id: <20220502163722.3957-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hello everyone,

it's a well known problem that the DMA-buf subsystem mixed synchronization and memory management requirements into the same dma_fence and dma_resv objects. Because of this dma_fence objects need to guarantee that they complete within a finite amount of time or otherwise the system can easily deadlock.

One of the few good things about this problem is that it is really good understood by now.

Daniel and others came up with some documentation: https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#indefinite-dma-fences

And Jason did an excellent presentation about that problem on last years LPC: https://lpc.events/event/11/contributions/1115/

Based on that we had been able to reject new implementations of infinite/user DMA fences and mitigate the effect of the few existing ones.

The still remaining down side is that we don't have a way of using user fences as dependency in both the explicit (sync_file, drm_syncobj) as well as the implicit (dma_resv) synchronization objects, resulting in numerous problems and limitations for things like HMM, user queues etc....

This patch set here now tries to tackle this problem by untangling the synchronization from the memory management. What it does *not* try to do is to fix the existing kernel fences, because I think we now can all agree on that this isn't really possible.

To archive this goal what I do in this patch set is to add some parallel infrastructure to cleanly separate normal kernel dma_fence objects from indefinite/user fences:

1. It introduce a DMA_FENCE_FLAG_USER define (after renaming some existing driver defines). To note that a certain dma_fence is an user fence and *must* be ignore by memory management and never used as dependency for normal none user dma_fence objects.

2. The dma_fence_array and dma_fence_chain containers are modified so that they are marked as user fences whenever any of their contained fences are an user fence.

3. The dma_resv object gets a new DMA_RESV_USAGE_USER flag which must be used with indefinite/user fences and separates those into it's own synchronization domain.

4. The existing dma_buf_poll_add_cb() function is modified so that indefinite/user fences are included in the polling.

5. The sync_file synchronization object is modified so that we essentially have two fence streams instead of just one.

6. The drm_syncobj is modified in a similar way. User fences are just ignored unless the driver explicitly states support to wait for them.

7. The DRM subsystem gains a new DRIVER_USER_FENCE flag which drivers can use to indicate the need for user fences. If user fences are used the atomic mode setting starts to support user fences as IN/OUT fences.

8. Lockdep is used at various critical locations to ensure that nobody ever tries to mix user fences with non user fences.

The general approach is to just ignore user fences unless a driver stated explicitely support for them.

On top of all of this I've hacked amdgpu so that we add the resulting CS fence only as kernel dependency to the dma_resv object and an additional wrapped up with a dma_fence_array and a stub user fence.

The result is that the newly added atomic modeset functions now correctly wait for the user fence to complete before doing the flip. And dependent CS don't pipeline any more, but rather block on the CPU before submitting work.

After tons of debugging and testing everything now seems to not go up in flames immediately and even lockdep is happy with the annotations.

I'm perfectly aware that this is probably by far the most controversial patch set I've ever created and I really wish we wouldn't need it. But we certainly have the requirement for this and I don't see much other chance to get that working in an UAPI compatible way.

Thoughts/comments?

Regards,
Christian.


