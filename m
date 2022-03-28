Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F41E4E8CC3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 06:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C81110E575;
	Mon, 28 Mar 2022 04:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46D710E578
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 04:00:00 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 z15-20020a25bb0f000000b00613388c7d99so10010463ybg.8
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 21:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=TV7dC/RL2aupiGsowhgEuGSFsVAvRLKXDPjX21KQ4Cw=;
 b=UgcEU3LOymQA1ax+LEqomqZGXkE6nx9biHGYjDFBKhithuNhPdwu9dIPJlnXdVvtw0
 AKFHBwuomvQSOTo2Yc+WBXLKSuf9F/zQKIFLAwJ/0rGE95ElgU+Iqnf/LY3Piay99iZd
 mfj7w5up1/vGRcVurYmu2OZjDtXbYeXEvs1PXduHSK89x06eAx397Ro9ZCEhaxV+jBvY
 LMf1YEX00yH+znUXNWoA2v/s2KGby6XKa/qsQVCzGJuDK+tNDucuLsICqm/k+sd6M8Ca
 XMqKDygi3mjN6VM0pYU0oD9SzU0amVcCBwxFF/RMSFRH+sX/jbfCLlxLKhmKslPIcAcp
 VY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=TV7dC/RL2aupiGsowhgEuGSFsVAvRLKXDPjX21KQ4Cw=;
 b=e94e3VP6RFA4/TgS7z/uz3dGlXyz2IdKqgaLjki0PQimcnDm0IiqFsSecGoy32LLVg
 5zCH5tSSv2LbhX/N43uhrT+0C52UyPgSkLq5kDFa19tdF23cs4D5S0SPos0IyXS1mr4m
 5qfS5GGZcTbAFspz8Pg7Ia3Nw4GavRD0W+lYTBoVAJi1tnSfQSaKUFN9ZMv/+xC6Z09A
 G/Z531One+p5wkHybE2gACuis09IQpQo5z8bjBdiqS8TE0PqEVsOj3sXLTln3HDSY8Oq
 TAVdumY/3RCxktLi9VaKUPN/0J9Tu2b5fTs8N34osi1/08I5usNOEW7MJzXUNmmcGUlc
 EdtQ==
X-Gm-Message-State: AOAM531J98FJVowE6UKOuW4y1WgsIZ/g3zWSlgTGhgF+xtaMsbuw9oto
 GEXk1zu0HxYhqB0umP6bgWbRjZ2rf6V5k3Q=
X-Google-Smtp-Source: ABdhPJxob/8mE6iEcPhEmRWMSXJ33mGhhVdcJFjym0vsk/bvSNDfZ7OqaCWH/pQ7RU7kI2giaBIw5lDNDvoHfI8=
X-Received: from tj2.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:187])
 (user=tjmercier job=sendgmr) by 2002:a81:f611:0:b0:2cf:aa3c:ab17 with SMTP id
 w17-20020a81f611000000b002cfaa3cab17mr23428897ywm.410.1648440000031; Sun, 27
 Mar 2022 21:00:00 -0700 (PDT)
Date: Mon, 28 Mar 2022 03:59:40 +0000
In-Reply-To: <20220328035951.1817417-1-tjmercier@google.com>
Message-Id: <20220328035951.1817417-2-tjmercier@google.com>
Mime-Version: 1.0
References: <20220328035951.1817417-1-tjmercier@google.com>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Subject: [RFC v4 1/8] gpu: rfc: Proposal for a GPU cgroup controller
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, 
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>, 
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-doc@vger.kernel.org, Kenny.Ho@amd.com, kaleshsingh@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, mkoutny@suse.com,
 linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org,
 cgroups@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hridya Valsaraju <hridya@google.com>

This patch adds a proposal for a new GPU cgroup controller for
accounting/limiting GPU and GPU-related memory allocations.
The proposed controller is based on the DRM cgroup controller[1] and
follows the design of the RDMA cgroup controller.

The new cgroup controller would:
* Allow setting per-cgroup limits on the total size of buffers charged
  to it.
* Allow setting per-device limits on the total size of buffers
  allocated by device within a cgroup.
* Expose a per-device/allocator breakdown of the buffers charged to a
  cgroup.

The prototype in the following patches is only for memory accounting
using the GPU cgroup controller and does not implement limit setting.

[1]: https://lore.kernel.org/amd-gfx/20210126214626.16260-1-brian.welty@int=
el.com/

Signed-off-by: Hridya Valsaraju <hridya@google.com>
Signed-off-by: T.J. Mercier <tjmercier@google.com>

---
v3 changes
Remove Upstreaming Plan from gpu-cgroup.rst per John Stultz.

Use more common dual author commit message format per John Stultz.
---
 Documentation/gpu/rfc/gpu-cgroup.rst | 183 +++++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst      |   4 +
 2 files changed, 187 insertions(+)
 create mode 100644 Documentation/gpu/rfc/gpu-cgroup.rst

diff --git a/Documentation/gpu/rfc/gpu-cgroup.rst b/Documentation/gpu/rfc/g=
pu-cgroup.rst
new file mode 100644
index 000000000000..5b40d5518a5e
--- /dev/null
+++ b/Documentation/gpu/rfc/gpu-cgroup.rst
@@ -0,0 +1,183 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+GPU cgroup controller
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Goals
+=3D=3D=3D=3D=3D
+This document intends to outline a plan to create a cgroup v2 controller s=
ubsystem
+for the per-cgroup accounting of device and system memory allocated by the=
 GPU
+and related subsystems.
+
+The new cgroup controller would:
+
+* Allow setting per-cgroup limits on the total size of buffers charged to =
it.
+
+* Allow setting per-device limits on the total size of buffers allocated b=
y a
+  device/allocator within a cgroup.
+
+* Expose a per-device/allocator breakdown of the buffers charged to a cgro=
up.
+
+Alternatives Considered
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The following alternatives were considered:
+
+The memory cgroup controller
+____________________________
+
+1. As was noted in [1], memory accounting provided by the GPU cgroup
+controller is not a good fit for integration into memcg due to the
+differences in how accounting is performed. It implements a mechanism
+for the allocator attribution of GPU and GPU-related memory by
+charging each buffer to the cgroup of the process on behalf of which
+the memory was allocated. The buffer stays charged to the cgroup until
+it is freed regardless of whether the process retains any references
+to it. On the other hand, the memory cgroup controller offers a more
+fine-grained charging and uncharging behavior depending on the kind of
+page being accounted.
+
+2. Memcg performs accounting in units of pages. In the DMA-BUF buffer shar=
ing model,
+a process takes a reference to the entire buffer(hence keeping it alive) e=
ven if
+it is only accessing parts of it. Therefore, per-page memory tracking for =
DMA-BUF
+memory accounting would only introduce additional overhead without any ben=
efits.
+
+[1]: https://patchwork.kernel.org/project/dri-devel/cover/20190501140438.9=
506-1-brian.welty@intel.com/#22624705
+
+Userspace service to keep track of buffer allocations and releases
+__________________________________________________________________
+
+1. There is no way for a userspace service to intercept all allocations an=
d releases.
+2. In case the process gets killed or restarted, we lose all accounting so=
 far.
+
+UAPI
+=3D=3D=3D=3D
+When enabled, the new cgroup controller would create the following files i=
n every cgroup.
+
+::
+
+        gpu.memory.current (R)
+        gpu.memory.max (R/W)
+
+gpu.memory.current is a read-only file and would contain per-device memory=
 allocations
+in a key-value format where key is a string representing the device name
+and the value is the size of memory charged to the device in the cgroup in=
 bytes.
+
+For example:
+
+::
+
+        cat /sys/kernel/fs/cgroup1/gpu.memory.current
+        dev1 4194304
+        dev2 4194304
+
+The string key for each device is set by the device driver when the device=
 registers
+with the GPU cgroup controller to participate in resource accounting(see s=
ection
+'Design and Implementation' for more details).
+
+gpu.memory.max is a read/write file. It would show the current total
+size limits on memory usage for the cgroup and the limits on total memory =
usage
+for each allocator/device.
+
+Setting a total limit for a cgroup can be done as follows:
+
+::
+
+        echo =E2=80=9Ctotal 41943040=E2=80=9D > /sys/kernel/fs/cgroup1/gpu=
.memory.max
+
+Setting a total limit for a particular device/allocator can be done as fol=
lows:
+
+::
+
+        echo =E2=80=9Cdev1 4194304=E2=80=9D >  /sys/kernel/fs/cgroup1/gpu.=
memory.max
+
+In this example, 'dev1' is the string key set by the device driver during
+registration.
+
+Design and Implementation
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+The cgroup controller would closely follow the design of the RDMA cgroup c=
ontroller
+subsystem where each cgroup maintains a list of resource pools.
+Each resource pool contains a struct device and the counter to track curre=
nt total,
+and the maximum limit set for the device.
+
+The below code block is a preliminary estimation on how the core kernel da=
ta structures
+and APIs would look like.
+
+.. code-block:: c
+
+        /**
+         * The GPU cgroup controller data structure.
+         */
+        struct gpucg {
+                struct cgroup_subsys_state css;
+
+                /* list of all resource pools that belong to this cgroup *=
/
+                struct list_head rpools;
+        };
+
+        struct gpucg_device {
+                /*
+                 * list  of various resource pools in various cgroups that=
 the device is
+                 * part of.
+                 */
+                struct list_head rpools;
+
+                /* list of all devices registered for GPU cgroup accountin=
g */
+                struct list_head dev_node;
+
+                /* name to be used as identifier for accounting and limit =
setting */
+                const char *name;
+        };
+
+        struct gpucg_resource_pool {
+                /* The device whose resource usage is tracked by this reso=
urce pool */
+                struct gpucg_device *device;
+
+                /* list of all resource pools for the cgroup */
+                struct list_head cg_node;
+
+                /*
+                 * list maintained by the gpucg_device to keep track of it=
s
+                 * resource pools
+                 */
+                struct list_head dev_node;
+
+                /* tracks memory usage of the resource pool */
+                struct page_counter total;
+        };
+
+        /**
+         * gpucg_register_device - Registers a device for memory accountin=
g using the
+         * GPU cgroup controller.
+         *
+         * @device: The device to register for memory accounting. Must rem=
ain valid
+         * after registration.
+         * @name: Pointer to a string literal to denote the name of the de=
vice.
+         */
+        void gpucg_register_device(struct gpucg_device *gpucg_dev, const c=
har *name);
+
+        /**
+         * gpucg_try_charge - charge memory to the specified gpucg and gpu=
cg_device.
+         *
+         * @gpucg: The gpu cgroup to charge the memory to.
+         * @device: The device to charge the memory to.
+         * @usage: size of memory to charge in bytes.
+         *
+         * Return: returns 0 if the charging is successful and otherwise r=
eturns an
+         * error code.
+         */
+        int gpucg_try_charge(struct gpucg *gpucg, struct gpucg_device *dev=
ice, u64 usage);
+
+        /**
+         * gpucg_uncharge - uncharge memory from the specified gpucg and g=
pucg_device.
+         *
+         * @gpucg: The gpu cgroup to uncharge the memory from.
+         * @device: The device to charge the memory from.
+         * @usage: size of memory to uncharge in bytes.
+         */
+        void gpucg_uncharge(struct gpucg *gpucg, struct gpucg_device *devi=
ce, u64 usage);
+
+Future Work
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Additional GPU resources can be supported by adding new controller files.
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.=
rst
index 91e93a705230..0a9bcd94e95d 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -23,3 +23,7 @@ host such documentation:
 .. toctree::
=20
     i915_scheduler.rst
+
+.. toctree::
+
+    gpu-cgroup.rst
--=20
2.35.1.1021.g381101b075-goog

