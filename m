Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBECE48F3C4
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jan 2022 02:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E616110E328;
	Sat, 15 Jan 2022 01:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF7E10E328
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jan 2022 01:07:23 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 g6-20020a25db06000000b00611ca09ecd0so11416845ybf.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 17:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=VVL93OjDpl50EsTf01Y02AFzpDgsoiwDg8IFEaHEx7o=;
 b=SeDudgjZy+YJyTXR9JLoFhR5vDMcIwZaaa8yQTqwNo0eCjpi1e+Z6fuk5CVH0j8T6Q
 yftZP1F1lLghLhdqxp/d2Hi9b3XVn1g1t87rKY7jFrOaC36QUheGeR1xOTUz/2bLyPhV
 62QLjtSW0fnKArrUMAigsH+EedrTR+GBYAk7odkg7PsOu9hJD19pSdQygjNHP69Oxkqd
 AAUXclJGnEsBrXj622qDr25tJi+BZW4ce4s3tyPfO7BAn5XNcrCyZAECVNeP7XHBD3HS
 ZHn3F7wLmnaUtrfd6x1VO2YBDfTcTt+rETEo/hAE820ttJA+H9Wi63ki5ATMsl4pmovf
 PDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=VVL93OjDpl50EsTf01Y02AFzpDgsoiwDg8IFEaHEx7o=;
 b=asIFKlpa24qt4CD2UZ2zBGcbvhODhw012fLFlyDzho/KbHfBDP6vkjezb9IFb13Ge7
 06OhopdAo/5Ng1sxiHePLjuSYnUewbrPMCuqSbd8Xe8x9J9KKn0KsG9L1CeyNa7oCXIH
 yr41Bif05HuRUL1F6s8gYe0Ndd209IzevuQquWKSSEJmwWuxzcSG5G+NlCpDA/IBbnH8
 PIrSUmWYvmI+qo+hGpn22hd3yIHgvhw9bzagKZ2ZsR2g2v01HR6uW0ZXz06Ok4Hth95H
 hc+SV7gTmlFUL7ORlIZmEVBJ+vdHobS0Q8tSW51qn2Ts3hg9NefVbcbhohQ20iP8sGUl
 2wXg==
X-Gm-Message-State: AOAM533GGpftcheSoMmKMQfNrcZEt1+nZGnpIbdsJlohP/sAJIVb2UIu
 tJ+hKT1qE+xK+nj4PBrK/Ezm2Wk+XOQ=
X-Google-Smtp-Source: ABdhPJzyM7cNAy3s+OktTpih4qEUrIx/QPHtlR7VJWxQbBa5BvlJwh/TEx9gX5GKJVVbkPqjsVs2iQfq0sE=
X-Received: from hridya.mtv.corp.google.com
 ([2620:15c:211:200:5860:362a:3112:9d85])
 (user=hridya job=sendgmr) by 2002:a25:bf82:: with SMTP id
 l2mr16594693ybk.356.1642208842425; 
 Fri, 14 Jan 2022 17:07:22 -0800 (PST)
Date: Fri, 14 Jan 2022 17:05:59 -0800
In-Reply-To: <20220115010622.3185921-1-hridya@google.com>
Message-Id: <20220115010622.3185921-2-hridya@google.com>
Mime-Version: 1.0
References: <20220115010622.3185921-1-hridya@google.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
Subject: [RFC 1/6] gpu: rfc: Proposal for a GPU cgroup controller
From: Hridya Valsaraju <hridya@google.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>, 
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, 
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Tejun Heo <tj@kernel.org>, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Dave Airlie <airlied@redhat.com>, Kenneth Graunke <kenneth@whitecape.org>, 
 Simon Ser <contact@emersion.fr>, Jason Ekstrand <jason@jlekstrand.net>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Li Li <dualli@google.com>, Marco Ballesio <balejs@google.com>,
 Finn Behrens <me@kloenk.de>, 
 Hang Lu <hangl@codeaurora.org>, Wedson Almeida Filho <wedsonaf@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Vipin Sharma <vipinsh@google.com>, Chris Down <chris@chrisdown.name>, 
 Daniel Borkmann <daniel@iogearbox.net>, Vlastimil Babka <vbabka@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org
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
Cc: Kenny.Ho@amd.com, daniels@collabora.com, tjmercier@google.com,
 kaleshsingh@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

The prototype in the following patches are only for memory accounting
using the GPU cgroup controller and does not implement limit setting.

[1]: https://lore.kernel.org/amd-gfx/20210126214626.16260-1-brian.welty@int=
el.com/

Signed-off-by: Hridya Valsaraju <hridya@google.com>
---

Hi all,

Here is the RFC documentation for the GPU cgroup controller that we
talked about at LPC 2021 along with a prototype. I reached out to Tejun
with the idea recently and he mentioned that cgroup-aware BPF(by Kenny
Ho) or the new misc cgroup controller can also be considered as
alternatives to track GPU resources. I am sending the RFC to the list to
give everyone else a chance to chime in with their thoughts as well so
that we can reach an agreement on how to proceed. Thanks in advance!

Regards,
Hridya


 Documentation/gpu/rfc/gpu-cgroup.rst | 192 +++++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst      |   4 +
 2 files changed, 196 insertions(+)
 create mode 100644 Documentation/gpu/rfc/gpu-cgroup.rst

diff --git a/Documentation/gpu/rfc/gpu-cgroup.rst b/Documentation/gpu/rfc/g=
pu-cgroup.rst
new file mode 100644
index 000000000000..9bff23007b22
--- /dev/null
+++ b/Documentation/gpu/rfc/gpu-cgroup.rst
@@ -0,0 +1,192 @@
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
+                /* list of all devices registered for GPU cgroup accountin=
g */
+                struct list_head dev_node;
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
+
+Upstreaming Plan
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+* Decide on a UAPI that accommodates all use-cases for the upstream GPU ec=
osystem
+  as well as for Android.
+
+* Prototype the GPU cgroup controller and integrate its usage into the DMA=
-BUF
+  system heap.
+
+* Demonstrate its usage from userspace in the Android Open Space Project.
+
+* Send out RFCs to LKML for the GPU cgroup controller and iterate.
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
2.34.1.703.g22d0c6ccf7-goog

