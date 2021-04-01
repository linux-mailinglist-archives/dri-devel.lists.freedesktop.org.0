Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29559351573
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 15:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F070B6ECB5;
	Thu,  1 Apr 2021 13:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098976ECB5;
 Thu,  1 Apr 2021 13:59:22 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lRxqy-0001rx-9N; Thu, 01 Apr 2021 13:59:20 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
From: Colin Ian King <colin.king@canonical.com>
Subject: re: drm/i915/selftests: Prepare gtt tests for obj->mm.lock removal
Message-ID: <5fac4ebb-e0aa-d628-1457-3feffea3b891@canonical.com>
Date: Thu, 1 Apr 2021 14:59:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Static analysis with Coverity on Linux-next has detected a potential
issue with the following commit:

commit 480ae79537b28f30ef6e07b7de69a9ae2599daa7
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Mar 23 16:50:49 2021 +0100

    drm/i915/selftests: Prepare gtt tests for obj->mm.lock removal


The analysis by Coverity is as follows:

145 static int igt_ppgtt_alloc(void *arg)
146 {
147        struct drm_i915_private *dev_priv = arg;
148        struct i915_ppgtt *ppgtt;
   1. var_decl: Declaring variable ww without initializer.
149        struct i915_gem_ww_ctx ww;
150        u64 size, last, limit;
151        int err = 0;
152
153        /* Allocate a ppggt and try to fill the entire range */
154
   2. Condition !(dev_priv->__info.ppgtt_type != INTEL_PPGTT_NONE),
taking false branch.
155        if (!HAS_PPGTT(dev_priv))
156                return 0;
157
158        ppgtt = i915_ppgtt_create(&dev_priv->gt);
   3. Condition IS_ERR(ppgtt), taking false branch.
159        if (IS_ERR(ppgtt))
160                return PTR_ERR(ppgtt);
161
   4. Condition !ppgtt->vm.allocate_va_range, taking true branch.
162        if (!ppgtt->vm.allocate_va_range)
   5. Jumping to label err_ppgtt_cleanup.
163                goto err_ppgtt_cleanup;
164
165        /*
166         * While we only allocate the page tables here and so we could
167         * address a much larger GTT than we could actually fit into
168         * RAM, a practical limit is the amount of physical pages in
the system.
169         * This should ensure that we do not run into the oomkiller
during
170         * the test and take down the machine wilfully.
171         */
172        limit = totalram_pages() << PAGE_SHIFT;
173        limit = min(ppgtt->vm.total, limit);
174
175        i915_gem_ww_ctx_init(&ww, false);
176retry:
177        err = i915_vm_lock_objects(&ppgtt->vm, &ww);
178        if (err)
179                goto err_ppgtt_cleanup;
180
181        /* Check we can allocate the entire range */
182        for (size = 4096; size <= limit; size <<= 2) {
183                struct i915_vm_pt_stash stash = {};
184
185                err = i915_vm_alloc_pt_stash(&ppgtt->vm, &stash, size);
186                if (err)
187                        goto err_ppgtt_cleanup;
188
189                err = i915_vm_pin_pt_stash(&ppgtt->vm, &stash);
190                if (err) {
191                        i915_vm_free_pt_stash(&ppgtt->vm, &stash);
192                        goto err_ppgtt_cleanup;
193                }
194
195                ppgtt->vm.allocate_va_range(&ppgtt->vm, &stash, 0, size);
196                cond_resched();
197
198                ppgtt->vm.clear_range(&ppgtt->vm, 0, size);
199
200                i915_vm_free_pt_stash(&ppgtt->vm, &stash);
201        }
202
203        /* Check we can incrementally allocate the entire range */
204        for (last = 0, size = 4096; size <= limit; last = size, size
<<= 2) {
205                struct i915_vm_pt_stash stash = {};
206
207                err = i915_vm_alloc_pt_stash(&ppgtt->vm, &stash, size
- last);
208                if (err)
209                        goto err_ppgtt_cleanup;
210
211                err = i915_vm_pin_pt_stash(&ppgtt->vm, &stash);
212                if (err) {
213                        i915_vm_free_pt_stash(&ppgtt->vm, &stash);
214                        goto err_ppgtt_cleanup;
215                }
216
217                ppgtt->vm.allocate_va_range(&ppgtt->vm, &stash,
218                                            last, size - last);
219                cond_resched();
220
221                i915_vm_free_pt_stash(&ppgtt->vm, &stash);
222        }
223
224 err_ppgtt_cleanup:
   6. Condition err == -35, taking false branch.
225        if (err == -EDEADLK) {
226                err = i915_gem_ww_ctx_backoff(&ww);
227                if (!err)
228                        goto retry;
229        }
   7. uninit_use_in_call: Using uninitialized value ww.contended when
calling i915_gem_ww_ctx_fini.
   Uninitialized pointer read (UNINIT)
   8. uninit_use_in_call: Using uninitialized value ww.ctx.acquired when
calling i915_gem_ww_ctx_fini.
230        i915_gem_ww_ctx_fini(&ww);
231
232        i915_vm_put(&ppgtt->vm);
233        return err;
234 }

Coverity is reporting use of uninitialized values in (lines 230.  Not
sure what the best fix is for this, so I'm reporting this as a potential
issue.

Colin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
