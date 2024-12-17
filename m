Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8129F4875
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F7210E8D3;
	Tue, 17 Dec 2024 10:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eLcjvTlQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82BC10E8D3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 10:08:19 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30033e07ef3so57227321fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 02:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734430098; x=1735034898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AYCRMSX++86+KnqMpmtjVu7Tiu/JgIj/lkT3HzDUCoc=;
 b=eLcjvTlQqJRBRRX4A26KX5iwwqLrs63k7YaSA6ISS9wlpiwQDs2QiNn2sE1YcRkiMm
 b62m5zEgYX6RPxbsm8DthGzns2PVS/OgPiK/3uhwBzI63sI9ydnQ5XB0BGCdoitpjVoM
 ih+aKYjc0mMmHUYt19yuT0/hARaqw6h6ez2RKkYVz/xPOc18EUg7zF0B5okr4Fpu325K
 h7OCUizE081bFfMUMEo5Hn3jAHuwgYFwc0pZgzkHyKzJ9sQMW8Si4x/EzNw9+uBB5yDu
 kD4iJ4+BHcbccHdRQMgnUIbI9CXp+BEIuhc3Pf9iE233loHhkiIB0BfdyACJq/fUnXUC
 D9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734430098; x=1735034898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AYCRMSX++86+KnqMpmtjVu7Tiu/JgIj/lkT3HzDUCoc=;
 b=JRBcpwOyKVO2WsAPyD71E66fmpwwz/3l+uZOrj+doMiS03/EofTnjh7IPShUc/qZ6U
 Xc8wV69Q/MMpn91QJBpT1PwWxE4jjhl8A2NRPJ9OQi3yJ25TCu08q6zCeh8Fem7Ispau
 xVXETuANmLGo+vQeaH2LjjghXuO7UJdlKhrPDjrfGgRG6X2/yzSu1uNRLxzlPB0WEBeu
 sAOy1qmHKBZHFAR4/b5IjN1boYt22wkuJYjMOpKm+PVtbTDRLslKtnlQwMvpAn80JotA
 Hcg2oY5LeOW3GUj++5KGEzTtSxru9014o/w538v3zHnXMh+koWhXGjcyH0/9nxS8D9ji
 /64w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVYBQzp87nGFQumTmVfcba+NB2yO9t7NL44FwDnErr5eHLAoncAaR9AHPdWsBQI70XCzRfWk55NF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwplVng75WGF7iRGdWhLaAmM9Ovo4s4Bv25lxF5qTGD+TXTb3sa
 GgIvMgV7BcLbqZWcw9lBC89goArkau2S1Pay1fKc1xhFfptt1GtC8fxJt1PhQeU=
X-Gm-Gg: ASbGncuS3o7548MDFsiTlISylfKO+sb1Ku5rXNWfbe6oqAX5ePVfn+pDaXZUmzBxciE
 wJp0wX79Iv9D5msjxwkTtGykaKZAI7OidSai1LpGat+uW9RpMICBEE9FzTguG5OgS9Tzf0jtmto
 FbXPHvfVnKIJ5Vua7MdqWD9eeE2qxAXcA1ZykGb22XDpK4TEJokWC+WGqlpbH0wjL2hQUi0OJ+b
 94cPHCfAqE6kFmFGjgPC0ck0UmUcxgVWUUV2IgTyyLZP8bY/9ZsVsk9/+KeKr368M/Z/PcM6cjj
 YkdbM7eVKLtnU8ZemTEpDHUqNxwWEFGkiw==
X-Google-Smtp-Source: AGHT+IHZU/IgRazPzMt1BTv+XPB01kJYHZQYFJnvwgpeo9BxmS7vAECnkhvSmQ/NjPskK0oQHygtHA==
X-Received: by 2002:a2e:a546:0:b0:300:3307:389f with SMTP id
 38308e7fff4ca-304441a4d58mr7622151fa.0.1734430097840; 
 Tue, 17 Dec 2024 02:08:17 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a69ecsm12122681fa.111.2024.12.17.02.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 02:08:17 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Date: Tue, 17 Dec 2024 11:07:36 +0100
Message-ID: <20241217100809.3962439-1-jens.wiklander@linaro.org>
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

Hi,

This patch set allocates the restricted DMA-bufs via the TEE subsystem.

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
restrictions for the memory used for the DMA-bufs.

I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
how to allocate the restricted physical memory.

TEE_IOC_RSTMEM_ALLOC takes in addition to a size and flags parameters also
a use-case parameter. This is used by the backend TEE driver to decide on
allocation policy and which devices should be able to access the memory.

Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
Recording) has been identified so far to serve as examples of what can be
expected. More use-cases can be added in userspace ABI, but it's up to the
backend TEE drivers to provide the implementation.

Each use-case has it's own restricted memory pool since different use-cases
requires isolation from different parts of the system. A restricted memory
pool can be based on a static carveout instantiated while probing the TEE
backend driver, or dynamically allocated from CMA and made restricted as
needed by the TEE.

This can be tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v4
repo sync -j8
cd build
make toolchains -j$(nproc)
make SPMC_AT_EL=1 all -j$(nproc)
make SPMC_AT_EL=1 run-only
# login and at the prompt:
xtest --sdp-basic

The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=n to test
without FF-A using the original SMC ABI instead. Please remember to do
%rm -rf ../trusted-firmware-a/build/qemu
for TF-A to be rebuilt properly using the new configuration.

https://optee.readthedocs.io/en/latest/building/prerequisites.html
list dependencies needed to build the above.

The tests are pretty basic, mostly checking that a Trusted Application in
the secure world can access and manipulate the memory. There are also some
negative tests for out of bounds buffers etc.

Thanks,
Jens

Changes since V3:
* Make the use_case and flags field in struct tee_shm u32's instead of
  u16's
* Add more description for TEE_IOC_RSTMEM_ALLOC in the header file
* Import namespace DMA_BUF in module tee, reported by lkp@intel.com
* Added a note in the commit message for "optee: account for direction
  while converting parameters" why it's needed
* Factor out dynamic restricted memory allocation from
  "optee: support restricted memory allocation" into two new commits
  "optee: FF-A: dynamic restricted memory allocation" and
  "optee: smc abi: dynamic restricted memory allocation"
* Guard CMA usage with #ifdef CONFIG_CMA, effectively disabling dynamic
  restricted memory allocate if CMA isn't configured

Changes since the V2 RFC:
* Based on v6.12
* Replaced the flags for SVP and Trusted UID memory with a u32 field with
  unique id for each use case
* Added dynamic allocation of restricted memory pools
* Added OP-TEE ABI both with and without FF-A for dynamic restricted memory
* Added support for FF-A with FFA_LEND

Changes since the V1 RFC:
* Based on v6.11
* Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_ALLOC

Changes since Olivier's post [2]:
* Based on Yong Wu's post [1] where much of dma-buf handling is done in
  the generic restricted heap
* Simplifications and cleanup
* New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
  support"
* Replaced the word "secure" with "restricted" where applicable

Jens Wiklander (6):
  tee: add restricted memory allocation
  optee: account for direction while converting parameters
  optee: sync secure world ABI headers
  optee: support restricted memory allocation
  optee: FF-A: dynamic restricted memory allocation
  optee: smc abi: dynamic restricted memory allocation

 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/call.c          |  10 +-
 drivers/tee/optee/core.c          |   1 +
 drivers/tee/optee/ffa_abi.c       | 178 +++++++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 ++-
 drivers/tee/optee/optee_msg.h     |  65 ++++-
 drivers/tee/optee/optee_private.h |  75 ++++--
 drivers/tee/optee/optee_smc.h     |  71 +++++-
 drivers/tee/optee/rpc.c           |  31 ++-
 drivers/tee/optee/rstmem.c        | 388 ++++++++++++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 213 ++++++++++++++--
 drivers/tee/tee_core.c            |  38 ++-
 drivers/tee/tee_private.h         |   2 +
 drivers/tee/tee_rstmem.c          | 201 ++++++++++++++++
 drivers/tee/tee_shm.c             |   2 +
 drivers/tee/tee_shm_pool.c        |  69 +++++-
 include/linux/tee_core.h          |  15 ++
 include/linux/tee_drv.h           |   2 +
 include/uapi/linux/tee.h          |  44 +++-
 20 files changed, 1358 insertions(+), 76 deletions(-)
 create mode 100644 drivers/tee/optee/rstmem.c
 create mode 100644 drivers/tee/tee_rstmem.c


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.43.0

