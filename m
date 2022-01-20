Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CC2494EE7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 14:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEE010E7F8;
	Thu, 20 Jan 2022 13:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2053C10E7FC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 13:27:51 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so13748729wmq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fg716y4MiLyyXQDO8h3nFRM6quSlb9x3KrUEMDa+vBM=;
 b=URoTrhHmLIknwGRjipG8fwVJNbcTRTJNZg0brPQae0b5AtGytfOdXDEGKXYKgw6YJb
 dpZdDFU0B0st4j0tKxMPpGMUddD3NXT1XopDR00DVxAAcesy+NmjQ7604W1EcW4Uv4oD
 wJEQoEZAoXBeLsfuR18c/BRvQpHfi/+kHpjT3dgHucVA6JD+eE3Tbjl0hGweI0luVeWC
 YcntrN8PyqFzxeg2Mb1/pWUfLWtPx+LBIC7aPXH3eJWuJ9WIWS04EixAJnR4Av5eCs3W
 J9PM+sAUlcnunzmpN8bqbCrUfcETh/8AC9MvmkP4PWV3S3TJqPpS5C8qszIjFkELGm7q
 /W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fg716y4MiLyyXQDO8h3nFRM6quSlb9x3KrUEMDa+vBM=;
 b=NKK/D4IFIaNMa/LJ9z1GvrxzfNQFWIQaq3+IpGPPtJQp0eNlst39taJM2Abys5L9PE
 Z4kBq65Q+xek+WoDjojjXgDiOM6bBJMfgKUQRQDHeeEa3hl/2egh8bf0cu4cmYL6gziu
 ZkX8bYegIds/D/mvN9tmlE+1vn51sEWhrZSM+FeYhnfDxaKpnAQ1zqIySmQV1g2uinA5
 RB9uKbZuww9822AG9i92C5Uh+OpH4TVoJNdDg/7QfUc3M1fnl+9hwySi25xPExNRvVuv
 Azd0jF8fQcv/tqPSltTIbRIoXzhqepmevw2z2V8PfY4VosBz8gTRKJV9bVMhmAxi/HY9
 VJDw==
X-Gm-Message-State: AOAM532L2/xGAugU1wZKlCUEZUf7tQ/NLmrllG4VbDBVgS7GSUBqoZPi
 uF0K2vVYO/7EPoSZd5p0DY0=
X-Google-Smtp-Source: ABdhPJyq3Wxk9a8Apw4i45euPrV9j5Rjus1JSRDx4JlL4eNcqp1z4o77N/YkC8RnngJeEmZhvwXtNg==
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr33769326wrp.36.1642685269640; 
 Thu, 20 Jan 2022 05:27:49 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 05:27:49 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Enforce dma_fence container rules
Date: Thu, 20 Jan 2022 14:27:38 +0100
Message-Id: <20220120132747.2348-1-christian.koenig@amd.com>
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

Hi Daniel,

second version of this set.

I've kept the fence ops exported for now since there are indeed valid uses in the drm_syncobj implementation which needs a more wider rework.

But quite a bunch of cases in i915, one in amdgpu and another one in vmwgfx are cleaned up at the end of this series now.

Please review and comment,
Christian.


