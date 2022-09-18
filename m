Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDD15BC378
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 09:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DFD10E554;
	Mon, 19 Sep 2022 07:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com
 [162.62.57.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4ED10E194;
 Sun, 18 Sep 2022 19:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1663529078; bh=IEVNEjmNL0yQFLfNGmENMI8xItb7ytEnmiYjjux8USs=;
 h=Date:To:Cc:From:Subject;
 b=dMPRRNFQ2WrLs5+yMgvW2ean4INOCGFxSTetYdf+xsguH/5QqOa12U+d3DFa+QJR1
 prBVR+E7G7mYeiSNq/1PigXUwGsqPaaKeVJcib3Roh33l14FjmBWUZArhsTuGKMez6
 7d8IaHCWgqRC0pjJFOBQtt5mNt9z2jzU9UjeDQzs=
Received: from [192.168.221.128] ([111.206.145.21])
 by newxmesmtplogicsvrsza35.qq.com (NewEsmtp) with SMTP
 id 6233E4CF; Mon, 19 Sep 2022 03:24:35 +0800
X-QQ-mid: xmsmtpt1663529075tp9izz2p0
Message-ID: <tencent_ED24158E83CB9885E8BDD173EB5896B51906@qq.com>
X-QQ-XMAILINFO: MyIXMys/8kCtzchVYlT2S4MXJ4miJNoucTaA+rntbKRXfnxhsujcUfhHBLW/u4
 X3edj7iAELSlpTzbLOTEsQyg2/w7Ka8LZ0PVXnb7klZoWlikrPJ+JF4SXv8WEk04JVHk98c7ALOS
 fdWjuAqZhlnnjC5m4jIy2RfhqTgdE9CX7mc2IWCtMrjkfdVfQtT1yJhZfXdIymnHXKb+0mMSSfpi
 w+iY7agKnL22FbFi6oh2UXmX9i91cE/cc9juoGxbf7jjH78xN7aoJYKyZj+8kPIzvfiIL+rIgUGP
 dL+pZJKhLniqpeBRWZxaNQnBy/5MePIf/4d6f++Qxw2WTx9l+oi/tbSzTPDOi+7kVFdOpoHTUhJU
 0nxHxYSXEIDPwcTf6lNN3FzGMh8YN7yoF6SY9+zCp+2/mmZoKK0DDUSEFyziMKJaRrmaoSH13T8m
 +EtIAPI+V/T6Zp4o+ILo2G7m/hUkO3+5GDZtz2iEgnXo0mXWkJjr0OvQaGCCKhgKP3O/0bu5JFnV
 jf7Oj8ovTrBPAFTC2VAPzf4K5tBiWfdgk2xq3ld7du6HP/EirG/3V1DN7fhhY9AmO5530DsUU7x5
 QAsg86naeFihGq0ewdrGhg4M3htSuQ7JguEMSEo4i8Ha0IIf+lfbaQpQQTfr1c5vg+/IpV7cEzFd
 NjdY9HTuvahUr4a94O0t3ErywEQPDxuB1aN5IUpVtrPOZ1ZLPdQOp2CcsU5ZsaMobGdwoVQlsUti
 NivctlYrVnJB2OQD6Ee2znVJhnXYpPffd+tf8ZpbPA9/Odm4G7Q+lB2jUOXqrligdK7zzJUZFwiZ
 XMbTHJOq2hYixUYsJGSaQ2fCzDGcUD3D47GOonB44Kc3jGKaoIX3qwg05o+M51KlBJ/C4GpApWPI
 ykNcY+7PnocUkTzYpshJx9RAkKIBN17qvX10FcrwzJZF7LoNeqZnhODsT/irU8Y/b3WRvNonMAlv
 yU6NkrzhWy18r+Tf+rg6XcmS3gExVb9f6laghiuAHDsTXyhsg+BkGKRXF/qYyJXUseselx/wlHPa
 g3Sq5zJMrZX9ZsJR9c+v3VXMQTXAUOGGm3bG7sIg==
X-OQ-MSGID: <34a72fa4-33f5-6ebc-2c78-f4e756aeb591@qq.com>
Date: Mon, 19 Sep 2022 03:24:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: gregkh@linuxfoundation.org
From: Zheng Wang <1002992920@qq.com>
Subject: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Sep 2022 07:18:40 +0000
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
Cc: alex000young@gmail.com, security@kernel.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org, hackerzheng666@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 From afe79848cb74cc8e45ab426d13fa2394c87e0422 Mon Sep 17 00:00:00 2001
From: xmzyshypnc <1002992920@qq.com>
Date: Fri, 16 Sep 2022 23:48:23 +0800
Subject: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry

There is a double-free security bug in split_2MB_gtt_entry.

Here is a calling chain :
ppgtt_populate_spt->ppgtt_populate_shadow_entry->split_2MB_gtt_entry.

If intel_gvt_dma_map_guest_page failed, it will call
ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and
kfree(spt). But the caller does not notice that, and it will call
ppgtt_free_spt again in error path.

Fix this by only freeing spt in ppgtt_invalidate_spt in good case.

Signed-off-by: xmzyshypnc <1002992920@qq.com>
---
  drivers/gpu/drm/i915/gvt/gtt.c | 16 +++++++++-------
  1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index ce0eb03709c3..550519f0acca 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -959,7 +959,7 @@ static inline int ppgtt_put_spt(struct 
intel_vgpu_ppgtt_spt *spt)
      return atomic_dec_return(&spt->refcount);
  }

-static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
+static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int 
is_error);

  static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
          struct intel_gvt_gtt_entry *e)
@@ -995,7 +995,7 @@ static int 
ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
                  ops->get_pfn(e));
          return -ENXIO;
      }
-    return ppgtt_invalidate_spt(s);
+    return ppgtt_invalidate_spt(s, 0);
  }

  static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *spt,
@@ -1016,7 +1016,7 @@ static inline void ppgtt_invalidate_pte(struct 
intel_vgpu_ppgtt_spt *spt,
      intel_gvt_dma_unmap_guest_page(vgpu, pfn << PAGE_SHIFT);
  }

-static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
+static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int 
is_error)
  {
      struct intel_vgpu *vgpu = spt->vgpu;
      struct intel_gvt_gtt_entry e;
@@ -1059,9 +1059,11 @@ static int ppgtt_invalidate_spt(struct 
intel_vgpu_ppgtt_spt *spt)
          }
      }

-    trace_spt_change(spt->vgpu->id, "release", spt,
+    if (!is_error) {
+        trace_spt_change(spt->vgpu->id, "release", spt,
               spt->guest_page.gfn, spt->shadow_page.type);
-    ppgtt_free_spt(spt);
+        ppgtt_free_spt(spt);
+    }
      return 0;
  fail:
      gvt_vgpu_err("fail: shadow page %p shadow entry 0x%llx type %d\n",
@@ -1215,7 +1217,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu 
*vgpu,
          ret = intel_gvt_dma_map_guest_page(vgpu, start_gfn + sub_index,
                             PAGE_SIZE, &dma_addr);
          if (ret) {
-            ppgtt_invalidate_spt(spt);
+            ppgtt_invalidate_spt(spt, 1);
              return ret;
          }
          sub_se.val64 = se->val64;
@@ -1393,7 +1395,7 @@ static int ppgtt_handle_guest_entry_removal(struct 
intel_vgpu_ppgtt_spt *spt,
              ret = -ENXIO;
              goto fail;
          }
-        ret = ppgtt_invalidate_spt(s);
+        ret = ppgtt_invalidate_spt(s, 0);
          if (ret)
              goto fail;
      } else {
-- 
2.25.1


