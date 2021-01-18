Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA46F2FA83B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 19:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEBA6E454;
	Mon, 18 Jan 2021 18:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02BD6E454
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 18:03:40 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id b2so18576463edm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 10:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bPc1DkcUWa0STJdzdfkKlnki1jjWfZoqqpAJuAAzpTQ=;
 b=mLys9pdbnZOJkTj20tbb8YYtBhXa8EY6E4XZgyzcssp5+NtH4GX1OmPAxI/27v0Izy
 bOgS1g2Gk8+H9+F1TqEjD8i9KGUspkJNmKwt8JEBLsO1jg73tIiMiApDI/yWvtLVh9iq
 84tcLazvRvwBINPr/DzQ/4z+gNRfLaoJpnPh+uHp5Z2WwvkEfE7jJtieb+YqLrF9+ONr
 VyBVAd80Eq805e/TCsb91lcRQpBOIOO6Y/TI72K23BSi5xDgbDOjy3FiREcrNkWUdCr3
 Nwpm1EWKvs2PYFBl62uK+bBTovIbgY4m+PUp/VkC/11s/s9dcgLGPrKtocoWkZFtZqeU
 vSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bPc1DkcUWa0STJdzdfkKlnki1jjWfZoqqpAJuAAzpTQ=;
 b=FtRt8jVnvu5kXpsW5E8gzCxZeW2dW8ppH2pvrhX+AsAq9bVQZrkfuEqGTkjoR6kRu0
 n2ABxLfk1/+OYx4wGXMGW5R8IvL9AMUUxPJkqHIs5yyM5oosqbh2U1HYfZKjpkhCgCGe
 DitjzWdoniBNysvQNl3foABWbVkoGrVB6pNOrjDx8m7Qez089e3POUFtu7kdNlMOeQk6
 Zz8jtR1f9807NqTUmkT8vSTryrJGuTDOH023reCeDvW2JMLsEB+Elq48wqn3xgKt+0G+
 J6pJSMwwD82uVhWz2LvGvQLBCsmyEh4CWSDNYTALOtoLLS7DpEChxpFtdaYb4qwjOM3v
 739w==
X-Gm-Message-State: AOAM532stnzMJULrC8deuMoXvNtgOrjgU+7DOoDhcMrU/5iTjskZwgaD
 wAjo8UiGATUyXvB+MY990a0=
X-Google-Smtp-Source: ABdhPJwdCBuD+ZY2ffKZvnCN9M6Bz1MCEjARnDUhp36fMFtPpyKbQDiXT5ijHZP74g8KIp5GS+ngEg==
X-Received: by 2002:a05:6402:34c3:: with SMTP id w3mr521093edc.3.1610993019441; 
 Mon, 18 Jan 2021 10:03:39 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4449:7b65:bfa0:95f5])
 by smtp.gmail.com with ESMTPSA id x5sm10651160edi.35.2021.01.18.10.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 10:03:38 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Let lockdep complain when locks are taken while waiting for userspace.
Date: Mon, 18 Jan 2021 19:03:33 +0100
Message-Id: <20210118180334.43714-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

because of the Vulkan graphics API we have a specialized synchronization object to handle both inter process as well as process to hardware synchronization.

The problem is now that when drivers call this interface with some lock help it is trivial to create a deadlock when those locks are also needed in a page fault for example.

The idea of this patch is now to let lockdep complain when any locks are called when the interface is used.

Please review and/or comment.

Thanks,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
