Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F606664506
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 16:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B269E10E5F0;
	Tue, 10 Jan 2023 15:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by gabe.freedesktop.org (Postfix) with ESMTP id B7D3710E5EE;
 Tue, 10 Jan 2023 15:38:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.125])
 by APP-05 (Coremail) with SMTP id zQCowADH6M1chr1juvoNDA--.26915S2;
 Tue, 10 Jan 2023 23:38:04 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: daniel@ffwll.ch
Subject: Re: [PATCH] drm/i915: Add missing check and destroy for
 alloc_workqueue
Date: Tue, 10 Jan 2023 23:38:03 +0800
Message-Id: <20230110153803.5755-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADH6M1chr1juvoNDA--.26915S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw1xWF43WF1fArWfKr1xKrg_yoW8Ww1fpF
 43XFyjkrZ5GayUGa9Fyw48tFyfA3yUGa4rGrykWryqv3W5Arn3C3sYkFy5uFyxAFZxXF1j
 yFZ0939ruF1qy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCY02Avz4vE14v_XrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
 0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
 17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
 C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
 6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
 73UjIFyTuYvjfU8eOJUUUUU
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
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
Cc: tvrtko.ursulin@linux.intel.com, stanislav.lisovskiy@intel.com,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, intel-gfx@lists.freedesktop.org,
 lucas.demarchi@intel.com, linux-kernel@vger.kernel.org,
 manasi.d.navare@intel.com, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 07, 2023 at 02:29:22AM +0800, Daniel Vetter wrote:
>On Fri, Jan 06, 2023 at 05:09:34PM +0800, Jiasheng Jiang wrote:
>> Add checks for the return value of alloc_workqueue and
>> alloc_ordered_workqueue as they may return NULL pointer and cause NULL
>> pointer dereference.
>> Moreover, destroy them when fails later in order to avoid memory leak.
>> Because in `drivers/gpu/drm/i915/i915_driver.c`, if
>> intel_modeset_init_noirq fails, its workqueues will not be destroyed.
>> 
>> Fixes: c26a058680dc ("drm/i915: Use a high priority wq for nonblocking plane updates")
>> Fixes: 757fffcfdffb ("drm/i915: Put all non-blocking modesets onto an ordered wq")
>> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> 
> So you have an entire pile of these, and I think that's a really good
> excuse to
> - create a drmm_alloc_workqueue helper for these (and
>   drmm_alloc_ordered_workqueue) using the drmm_add_action_or_reset()
>   function for automatic drm_device cleanup
> - use that instead in all drivers, which means you do not have to make any
>   error handling mor complex
> 
> Up for that? In that case please also convert any existing alloc*workqueue
> callsites in drm, and make this all a patch series (since then there would
> be dependencies).

Fine, I have submitted two patches. The first one create the
drmm_alloc_workqueue and drmm_alloc_ordered_workqueue helpers. And the
second one replace the alloc*workqueue with DRM helpers in
`drivers/gpu/drm/i915/display/intel_display.c`.
If there is no problem in these two, I will submitted the other patches
that replace the alloc*workqueue in other DRM files.

Thanks,
Jiang

