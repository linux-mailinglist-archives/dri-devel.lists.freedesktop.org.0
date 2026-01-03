Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF8CF03F9
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 19:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B052010E0BC;
	Sat,  3 Jan 2026 18:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="BLRw6m5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1720310E0BC
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 18:25:59 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dk8Bp2cvfz9t8q;
 Sat,  3 Jan 2026 19:25:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767464754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wYQfU7ag1B+K7R6N+c6V+o4Hnuw36zvgOzcE2v0bRc=;
 b=BLRw6m5IAM3wKBZ1QwauFrHDoyYYFs6+WHQxmUtEPSOrKRlkLsTVRiUwmnmi5/celJ7i45
 xsXCDY18cf8xqSqduib9CS22oEXBVoiu/tTTUNSWSpE7megUaN8fcU2I12YdNEXUHDJlLX
 Aa+7tv3CK5QbvkmXnMbVzB0ACB0VkGA5Ugg/uMMp4qQsjqy8jnrw/9IZdT0N6A9Mc3VbtD
 CS9EfUfcrXqLZqJNFdM2KVegqQKHfje+s49dU+pFb5mezbtK8ca01cLTCa1jnNli8/7RsG
 n5DoGIoo1bonuelJ7htO0jSRyDIJHFdAkUtgoKCMP5nIkog/qb4ty+x0Im+aAw==
Message-ID: <0e9f963b-00e0-43d1-b567-cb10b8f66df1@mailbox.org>
Date: Sat, 3 Jan 2026 19:25:52 +0100
MIME-Version: 1.0
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 4c3d46c5c68a2a2c5f0
X-MBO-RS-META: jpe11m8d1334xqotpmt8dtm7matuaomg
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

On 10/29/25 3:08 PM, Geert Uytterhoeven wrote:

Hello Geert,

>       default_suspend_ok+0xb4/0x20c (P)
>       genpd_runtime_suspend+0x11c/0x4e0
>       __rpm_callback+0x44/0x1cc
>       rpm_callback+0x6c/0x78
>       rpm_suspend+0x108/0x564
>       pm_runtime_work+0xb8/0xbc
>       process_one_work+0x144/0x280
>       worker_thread+0x2c8/0x3d0
>       kthread+0x128/0x1e0
>       ret_from_fork+0x10/0x20
>      Code: aa1303e0 52800863 b0005661 912dc021 (f9402095)
>      ---[ end trace 0000000000000000 ]---
> 
> This driver uses manual PM Domain handling for multiple PM Domains.  In
> my case, pvr_power_domains_fini() calls dev_pm_domain_detach() (twice),
> which calls dev_pm_put_subsys_data(), and sets dev->power.subsys_data to
> NULL when psd->refcount reaches zero.
> 
> Later/in parallel, default_suspend_ok() calls dev_gpd_data():
> 
>      static inline struct generic_pm_domain_data *dev_gpd_data(struct
> device *dev)
>      {
>              return to_gpd_data(dev->power.subsys_data->domain_data);
>      }
> 
> triggering the NULL pointer dereference.  Depending on timing, it may
> crash earlier or later in genpd_runtime_suspend(), or not crash at all
> (initially, I saw it only with extra debug prints in the genpd subsystem).

I came to the same conclusion when revisiting it yesterday and today.

The power 3dg-{a,b} domains are in RPM_SUSPENDING state, the 
__rpm_callback() is running and it unlocks dev->power.lock spinlock for 
just long enough, that the pvr_power_domains_fini() can issue 
dev_pm_domain_detach() and then dev_pm_put_subsys_data() , which unsets 
subsys_data, which are later still used by the __rpm_callback() (really 
the genpd_runtime_suspend() -> suspend_ok() it calls for this domain).

But, I wonder if the problem is actually in the CPG MSSR clock domain 
driver. The pvr_power_domains_fini() dev_pm_domain_detach() really calls 
cpg_mssr_detach_dev() which calls pm_clk_destroy() and that invokes the 
dev_pm_domain_detach() which unsets the subsys_data . The 
pm_clk_destroy() documentation is explicit about it unsetting the 
subsys_data .

I wonder if what we need to do instead, is patch the CPG MSSR clock 
domain driver such, that it would surely NOT call pm_clk_destroy() 
before the domain transitioned from RPM_SUSPENDING -> RPM_SUSPENDED 
state and surely is done with all its __rpm_callback() invocations ?

Can you please test this change and see if it fixes the problem ?

The barrier should guarantee that the domain is settled and no more 
callbacks are still running.

"
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c 
b/drivers/clk/renesas/renesas-cpg-mssr.c
index 7f9b7aa397906..14158cab1b129 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -24,6 +24,7 @@
  #include <linux/platform_device.h>
  #include <linux/pm_clock.h>
  #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
  #include <linux/psci.h>
  #include <linux/reset-controller.h>
  #include <linux/slab.h>
@@ -656,8 +657,10 @@ int cpg_mssr_attach_dev(struct generic_pm_domain 
*unused, struct device *dev)

  void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct 
device *dev)
  {
-	if (!pm_clk_no_clocks(dev))
+	if (!pm_clk_no_clocks(dev)) {
+		pm_runtime_barrier(dev);
  		pm_clk_destroy(dev);
+	}
  }

  static void cpg_mssr_genpd_remove(void *data)
"
