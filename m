Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C4054CC0B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 17:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B7D10E0A7;
	Wed, 15 Jun 2022 15:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1A910EF6D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 15:00:58 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id d14so16533339eda.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 08:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=wY3MY1JjwkRLcKpQY8rMPm6YMNF0CIsUZ7rbiw1eOdg=;
 b=XXbxhdgItP0zoIkGlEWS6CZjj1ft1Qvxup5XR35BLf8JsGJ3zfp+ni13XiO9jcfrMZ
 JIQCpSrz/b/U67zbJ64Cgcd7bxMUZMA+EI4RKM7YbGvFyhct89/yermrukBAEhqc/fTi
 N3qMt9YpaFN+mC4UueOR3J8295LUT+VietepmOZOuu41+cCcpNvP0aOfEndmiAtSH+We
 GYlSOJlSs0cU6F4P56222NftY27wSHjuco7fFC+mMLMMQxuHODqlXEeyo0MOAxOx8L5H
 uCmB0slTu3XHs6gjC5cDs9Lcqgzv56DphqZ9bJMjZgogaUM9vHwTB1/U1SusFoUj10qh
 AKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wY3MY1JjwkRLcKpQY8rMPm6YMNF0CIsUZ7rbiw1eOdg=;
 b=GCzhU1zlOGjqzBE7bSXQzXfet2VL7ZzTXh9T8DfWfudvZ3hvwh9/FXf0k5ziIfF+tN
 ArXuUfZbvEwWd4L875rVy+q/lUcn+KZ3XgEuZlQTSHQdZWvajU/2NT+XN7zGuFri/rlh
 S6h/F3BUsazjC0+SNmIRoQAx9B64PHwIP7NB1tIgolKrJc6PSLe/jXW3qH07d3czM3Fi
 PtDky6W3UBPTdJ7yfQ7f5Heie1Aa3bvclOuyuQVN9QzQGp7DlQ16Yv6VhFbfb0E5UwXO
 fKSj8vUl+EV93RbLupDm9AUqZo+q5efNOmQjY8DpVFBZbodDIEM/nG/4dEXCaiUvBNQ2
 ysAw==
X-Gm-Message-State: AJIora9qC+IVacWk1gLbpb/PSHS9rhhMBxBKbGf3+E8Z4qtrVRDGMFS+
 N1V4n3TfTwUfkIrpFSzedqLT+osuzwBhwjsG+Uuxm8ALmqGTjg==
X-Google-Smtp-Source: AGRyM1vhnx8Pvhkgd/BihrDDRTmX4NIajkrkaR2fp6YfjEvouNrnybTqh3w6W8+pVIBjVKmP8BSHdVDMeIhKYeshXOM=
X-Received: by 2002:a05:6402:2381:b0:42d:c8fe:d7fe with SMTP id
 j1-20020a056402238100b0042dc8fed7femr198596eda.248.1655305257187; Wed, 15 Jun
 2022 08:00:57 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Wed, 15 Jun 2022 16:00:46 +0100
Message-ID: <CAEXMXLS9jD_gvPzZ4xBJ9wOY9sbJLDdLLpYOFk0Wt2s1RStv5w@mail.gmail.com>
Subject: DRM FB interface does not sanitize len when mmap'ed
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

I am crashing the kernel by doing something I believe I am allowed to do.

Using mmap to write to /dev/fb0 as the compatibility layer for Tiny
DRM vot,v220hf01a-t (ili9225).

First it happens that because of the display resolution of 220*176 the
buffer is (16 bit) 77440 bytes, which is not a multiple of the page
size (4096), unlike most regular resolution displays.

When I touch the mmap'ed virtual address above base+73728 (4096*18) up to 77439:

auto file = open("/dev/fb0", O_RDWR);
if (!file) throw;
auto fbp = (char *)mmap(0, 220 * 176 * 2, PROT_READ | PROT_WRITE,
MAP_SHARED, file, 0);
if ((size_t)fbp <= 0) throw;
fbp[220 * 176 * 2 - 2] = 0;

I get a crash:

[   14.150463] Unable to handle kernel paging request at virtual
address ffffffc00827c000
[   14.158640] Mem abort info:
[   14.161626]   ESR = 0x96000007
[   14.164969]   EC = 0x25: DABT (current EL), IL = 32 bits
[   14.170470]   SET = 0, FnV = 0
[   14.173735]   EA = 0, S1PTW = 0
[   14.177047]   FSC = 0x07: level 3 translation fault
[   14.182095] Data abort info:
[   14.185083]   ISV = 0, ISS = 0x00000007
[   14.189035]   CM = 0, WnR = 0
[   14.192107] swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000000d54000
[   14.198997] [ffffffc00827c000] pgd=1000000001501003,
p4d=1000000001501003, pud=1000000001501003, pmd=1000000001d5c003,
pte=0000000000000000
[   14.211992] Internal error: Oops: 96000007 [#1] PREEMPT SMP
[   14.217659] CPU: 0 PID: 50 Comm: kworker/0:2 Not tainted 5.18.3 #18
[   14.224027] Hardware name: Raspberry Pi Compute Module 3 Plus Rev 1.0 (DT)
[   14.231005] Workqueue: events drm_fb_helper_damage_work
[   14.236333] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   14.243405] pc : __memcpy+0x15c/0x230
[   14.247131] lr : drm_fb_helper_damage_work+0x25c/0x310
[   14.252352] sp : ffffffc00822bd30
[   14.255712] x29: ffffffc00822bd30 x28: 00000000000001b8 x27: ffffff80017e1d10
[   14.262970] x26: ffffffc008267e80 x25: 00000000000000b0 x24: ffffff8002416800
[   14.270228] x23: ffffff8001fd8080 x22: ffffff80017e1c00 x21: ffffff80017e1ccc
[   14.277487] x20: ffffffc00827be80 x19: ffffff80017e1cd0 x18: ffffffe5d80bac08
[   14.284745] x17: 0000000000000013 x16: 000000fe72080e00 x15: 0000000000000000
[   14.292003] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[   14.299259] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[   14.306517] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
[   14.313772] x5 : ffffffc008268038 x4 : ffffffc00827c038 x3 : ffffffc008267fc0
[   14.321029] x2 : 0000000000000028 x1 : ffffffc00827bfc0 x0 : ffffffc008267e80
[   14.328288] Call trace:
[   14.330766]  __memcpy+0x15c/0x230
[   14.334135]  process_one_work+0x1dc/0x450
[   14.338214]  worker_thread+0x300/0x450
[   14.342025]  kthread+0x100/0x110
[   14.345305]  ret_from_fork+0x10/0x20
[   14.348947] Code: a9422428 a9032c6a a9432c2a a984346c (a9c4342c)
[   14.355132] ---[ end trace 0000000000000000 ]---

By constraining the input with this small patch it works fine:

--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -684,11 +684,13 @@ static void drm_fb_helper_damage(struct fb_info
*info, u32 x, u32 y,
 static void drm_fb_helper_memory_range_to_clip(struct fb_info *info,
off_t off, size_t len,
                                               struct drm_rect *clip)
 {
+       struct drm_fb_helper *fb_helper = info->par;
+
        off_t end = off + len;
        u32 x1 = 0;
        u32 y1 = off / info->fix.line_length;
        u32 x2 = info->var.xres;
-       u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
+       u32 y2 = min_t(u32, DIV_ROUND_UP(end, info->fix.line_length),
fb_helper->fb->height);

        if ((y2 - y1) == 1) {
                /*

I am sure this patch is not how it should be fixed, but I have no
knowledge of the subsystem to fix it "at the right place".

Thanks,
Nuno
