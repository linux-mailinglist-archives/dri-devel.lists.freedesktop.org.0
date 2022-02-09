Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF24AECC0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2237D10E4FE;
	Wed,  9 Feb 2022 08:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9E710E515;
 Wed,  9 Feb 2022 08:41:03 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id cf2so3523269edb.9;
 Wed, 09 Feb 2022 00:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kz4gsy4ExAWAXAbsLx+ADGnSm0I5PGy7YIdtRxwDDQ8=;
 b=fFOiPb/gHVj4gyHvArjCkvKx+yvQ6jgFpnX/mM8WogcqgGWbgIyNTVNFUi8vSbXROu
 6AQya/J9s/V7kcBP0R3cCLMUHKeRrHoWkeOlrhoOeVsxFH6J+vVf8fSz0tUcTJ/NMKXL
 2VRXp2u29BcbD71M1Sfp99b5JGEU40JosCfEbLoM3MhFLZOp2hW2sbEv5dw6NfDwOwzc
 8llUdrvfuw2kx+Hfi+JZNaZl5WLOuNxZEZ57K0Nwk6mOAvM2cruyqj1tMMIc40ZAPB/6
 XdOt/2sui+basvQ6uURcvDfHs1DaJMJI15yq2+0gkXpIZnSK5UAS0xAqkban9GKaDWfR
 rHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kz4gsy4ExAWAXAbsLx+ADGnSm0I5PGy7YIdtRxwDDQ8=;
 b=pmpnngwoNK4zGiEmaUsh5Bs/qH2ect5ukJJUpVydFXd6bpTJiNYHvS7S2EOgV52HDN
 8Rv0ceExmpFLvcNsyxF+sA288I4js2Po80sDmwAiHfp6pDTMm/c/7Td+L/bvi64foPI7
 yYOCLod2GZzMCF71YkAPL5Ugv0L6INzy0FA1KAv+pKNIqikcIxjVF8Q0ZzXYw7Q6eQFn
 ydHeg2k9EG1ABRPvWF0t6c7IHDBppgzEpFyZqYYgJfW6FDwxQqVW8m2llXANqNNTpVPE
 YJ5aAY8QM+6wgJqM+5kvLmf7u08DedR0vI8tfxtrwyq7ClVnrks68mb1y2xLgxaVt4u3
 rcxg==
X-Gm-Message-State: AOAM5335n3VocMT97RFpqHIqDTQIS3gxZhDtcFaqmobMgp56nN3SC5mA
 VqtGha9ghMmSjjs5PRZwlFc=
X-Google-Smtp-Source: ABdhPJzhMwhw5IM4uScE9y8UeGUs0R0l0J6L5aSrmRKFhRWH6Q+R8CIBI4BdXzBaCYlfetnlnHAnww==
X-Received: by 2002:a05:6402:27d4:: with SMTP id
 c20mr1271850ede.182.1644396062284; 
 Wed, 09 Feb 2022 00:41:02 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id u6sm3807958eje.101.2022.02.09.00.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 00:41:01 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com,
	daniel@ffwll.ch,
	thomas.hellstrom@linux.intel.com
Subject: drm/ttm: moving the LRU into the resource
Date: Wed,  9 Feb 2022 09:40:50 +0100
Message-Id: <20220209084059.1042345-1-christian.koenig@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

so hopefully the last round for this set.

It fixes both a long outstanding problem with TTM and resource
allocation as well as Bas's new performance problem with RADV.

Please review and comment.

Thanks,
Christian.


