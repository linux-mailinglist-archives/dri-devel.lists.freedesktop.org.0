Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD196E7FA7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 18:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2442710E9E7;
	Wed, 19 Apr 2023 16:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4005610E1C1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 16:31:09 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-95227e5164dso50952666b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 09:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681921867; x=1684513867;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=p8zSPB6kivPPkSmizcEY0AFW4Ufsgr4QHcxc+lUnVCM=;
 b=lNVIveQrh1eKoZo9UOOXS0oDqwALMlW8lIWTQKKh5sk3kW2ZgAqGvrgbzX9gTYKKQo
 v3OhoERAsyVA/PffB2B9netEu622pLpm542TmVRpG5Q3wWgvQvu9ll+sGYkCid7MEh9i
 okXROGQItufvrWjCXLrg06LL04enGbbdzSfBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681921867; x=1684513867;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p8zSPB6kivPPkSmizcEY0AFW4Ufsgr4QHcxc+lUnVCM=;
 b=XNTPTRaeke/ofWHRxW36A7EMzvyL9UtFVa7UKNpAsBjKtHKMevX1UFxWxoszGYm1FF
 OoZHAckixOVRnsUoxTTsMrG1b92l81sAe2mEnzZqoHm9W4O2k9Qopfm8lTQFZx/8BcZt
 HYfvUUDjicfsHR5Kj28bMNI48ZrCaZXLzTIPOssJZUcL4ds4k1Cm4k37G/Hm1vRdkwWU
 gSMndGMGj2i/uhXontfk8R7yvpwOMurvGqA1hiZ4cuI4l3INZvMxcMVGPbj22NBfVg5q
 VysUMTfxUXG4BHvfnNAKz45IRqXWOAeTyrbTaa1UU7LvOphOZK0k91i2AcOeLmRzZbpe
 JNuA==
X-Gm-Message-State: AAQBX9fD5wWATcoe/XEW3Rn359kRB0pPKbfPE/dcu7PPF3ZFC4tYwqom
 W6V9WudUlBeYLxQ8AiYnhN+gVw==
X-Google-Smtp-Source: AKy350bNooqVxWZ43iLbEqH+/naMbKaVyeR4Pp0PEpEUcRkvGqmG58GnpbyP1thJNcI0ucqHp1GRqA==
X-Received: by 2002:a17:906:105e:b0:929:b101:937d with SMTP id
 j30-20020a170906105e00b00929b101937dmr17587520ejj.1.1681921867025; 
 Wed, 19 Apr 2023 09:31:07 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 b17-20020a1709063f9100b00953331b086csm1811444ejj.91.2023.04.19.09.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 09:31:06 -0700 (PDT)
Date: Wed, 19 Apr 2023 18:31:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v3] drm/fbdev-generic: prohibit potential out-of-bounds
 access
Message-ID: <ZEAXSM/a0IuFnhwn@phenom.ffwll.local>
Mail-Followup-To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn
References: <20230417113219.1354078-1-suijingfeng@loongson.cn>
 <ZD5Vgx9Txaiz7Bun@phenom.ffwll.local>
 <139c9398-488d-df19-9ae2-2b4b47ef64f4@189.cn>
 <86a8b262-cbf2-b75f-9972-491f557edf74@189.cn>
 <CAKMK7uE-azFT02Sp2FDfMGTc57eYJEn8iM8Wk1mt5ucPs1qM-w@mail.gmail.com>
 <ad44df29-3241-0d9e-e708-b0338bf3c623@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad44df29-3241-0d9e-e708-b0338bf3c623@189.cn>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-fbdev@vger.kernel.org,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 12:00:41AM +0800, Sui Jingfeng wrote:
> Hi,
> 
> Sorry about reply to you so late,
> 
> our  downstream (product kernel side) userspace GPU/DC driver
> 
> has been tested out a few bugs, I'm asking to fulfill my duty to that part
> all days.
> 
> I may slow to reply, but I really love to reply.
> 
> 
> On 2023/4/19 23:09, Daniel Vetter wrote:
> > On Tue, 18 Apr 2023 at 20:16, Sui Jingfeng <15330273260@189.cn> wrote:
> > > Hi,
> > > 
> > > On 2023/4/19 01:52, Sui Jingfeng wrote:
> > > > Hi,
> > > > 
> > > > On 2023/4/18 16:32, Daniel Vetter wrote:
> > > > > On Mon, Apr 17, 2023 at 07:32:19PM +0800, Sui Jingfeng wrote:
> > > > > > The fbdev test of IGT may write after EOF, which lead to out-of-bound
> > > > > > access for the drm drivers using fbdev-generic. For example, on a x86
> > > > > > + aspeed bmc card platform, with a 1680x1050 resolution display,
> > > > > > running
> > > > > > fbdev test if IGT will cause the linux kernel hang with the following
> > > > > > call trace:
> > > > > > 
> > > > > >     Oops: 0000 [#1] PREEMPT SMP PTI
> > > > > >     [IGT] fbdev: starting subtest eof
> > > > > >     Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
> > > > > >     [IGT] fbdev: starting subtest nullptr
> > > > > > 
> > > > > >     RIP: 0010:memcpy_erms+0xa/0x20
> > > > > >     RSP: 0018:ffffa17d40167d98 EFLAGS: 00010246
> > > > > >     RAX: ffffa17d4eb7fa80 RBX: ffffa17d40e0aa80 RCX: 00000000000014c0
> > > > > >     RDX: 0000000000001a40 RSI: ffffa17d40e0b000 RDI: ffffa17d4eb80000
> > > > > >     RBP: ffffa17d40167e20 R08: 0000000000000000 R09: ffff89522ecff8c0
> > > > > >     R10: ffffa17d4e4c5000 R11: 0000000000000000 R12: ffffa17d4eb7fa80
> > > > > >     R13: 0000000000001a40 R14: 000000000000041a R15: ffffa17d40167e30
> > > > > >     FS:  0000000000000000(0000) GS:ffff895257380000(0000)
> > > > > > knlGS:0000000000000000
> > > > > >     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > >     CR2: ffffa17d40e0b000 CR3: 00000001eaeca006 CR4: 00000000001706e0
> > > > > >     Call Trace:
> > > > > >      <TASK>
> > > > > >      ? drm_fbdev_generic_helper_fb_dirty+0x207/0x330 [drm_kms_helper]
> > > > > >      drm_fb_helper_damage_work+0x8f/0x170 [drm_kms_helper]
> > > > > >      process_one_work+0x21f/0x430
> > > > > >      worker_thread+0x4e/0x3c0
> > > > > >      ? __pfx_worker_thread+0x10/0x10
> > > > > >      kthread+0xf4/0x120
> > > > > >      ? __pfx_kthread+0x10/0x10
> > > > > >      ret_from_fork+0x2c/0x50
> > > > > >      </TASK>
> > > > > >     CR2: ffffa17d40e0b000
> > > > > >     ---[ end trace 0000000000000000 ]---
> > > > > > 
> > > > > > The direct reason is that damage rectange computed by
> > > > > > drm_fb_helper_memory_range_to_clip() does not guaranteed to be
> > > > > > in-bound.
> > > > > > It is already results in workaround code populate to elsewhere. Another
> > > > > > reason is that exposing a larger buffer size than the actual needed
> > > > > > help
> > > > > > to trigger this bug intrinsic in drm_fb_helper_memory_range_to_clip().
> > > > > > 
> > > > > > Others fbdev emulation solutions write to the GEM buffer directly, they
> > > > > > won't reproduce this bug because the .fb_dirty function callback do not
> > > > > > being hooked, so no chance is given to
> > > > > > drm_fb_helper_memory_range_to_clip()
> > > > > > to generate a out-of-bound when drm_fb_helper_sys_write() is called.
> > > > > > 
> > > > > > This patch break the trigger condition of this bug by shrinking the
> > > > > > shadow
> > > > > > buffer size to sizes->surface_height * buffer->fb->pitches[0].
> > > > > > 
> > > > > > Fixes: '8fbc9af55de0 ("drm/fbdev-generic: Set screen size to size of
> > > > > > GEM
> > > > > > buffer")'
> > > > > > 
> > > > > > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > > > > > ---
> > > > > >    drivers/gpu/drm/drm_fbdev_generic.c | 2 +-
> > > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/drm_fbdev_generic.c
> > > > > > b/drivers/gpu/drm/drm_fbdev_generic.c
> > > > > > index 8e5148bf40bb..b057cfbba938 100644
> > > > > > --- a/drivers/gpu/drm/drm_fbdev_generic.c
> > > > > > +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> > > > > > @@ -94,7 +94,7 @@ static int
> > > > > > drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
> > > > > >        fb_helper->buffer = buffer;
> > > > > >        fb_helper->fb = buffer->fb;
> > > > > >    -    screen_size = buffer->gem->size;
> > > > > > +    screen_size = sizes->surface_height * buffer->fb->pitches[0];
> > > > > So I read core some more and stumbled over drm_fb_helper_deferred_io().
> > > > > Which has all the code and comments about this, including limiting.
> > > > > 
> > > > > I think it would be clearer if we fix the issue there, instead of
> > > > > passing
> > > > > limits around in obscure places that then again get broken?
> > > > No, it is more obscure doing that way...
> > > > 
> > > > 
> > > > As the size of the shadow screen buffer will be exposed to userspace.
> > > > 
> > > > The size 'helper->fb->height * helper->fb->pitches[0]' is a
> > > > exactly(best) fit,
> > > > 
> > > > You are guaranteed to waste at lease one byte by increasing one byte,
> > > > 
> > > > and can not store all pixels by decreasing one byte (In the case where
> > > > `helper->fb->pitches[0] = helper->fb->width * 4`).
> > > > 
> > > > It implicitly tell the userspace do not go beyond that boundary.
> > > > 
> > > > although userspace program can still choose to write  after EOF,
> > > > 
> > > > But it is for test purpose, to test the kernel if it can return a
> > > > -EFBIG or not.
> > > > 
> > > > > The thing is,
> > > > > Thomas both authored the limit checks in drm_fb_helper_deferred_io() and
> > > > > the patch which broken them again, so clearly this isn't very
> > > > > obvious. I'm
> > > > > thinking of something like this:
> > > > > 
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/drm_fb_helper.c
> > > > > b/drivers/gpu/drm/drm_fb_helper.c
> > > > > index ef4eb8b12766..726dab67c359 100644
> > > > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > > > @@ -697,10 +697,7 @@ void drm_fb_helper_deferred_io(struct fb_info
> > > > > *info, struct list_head *pagerefli
> > > > >         * of the screen and account for non-existing scanlines. Hence,
> > > > >         * keep the covered memory area within the screen buffer.
> > > > >         */
> > > > > -    if (info->screen_size)
> > > > > -        total_size = info->screen_size;
> > > > > -    else
> > > > > -        total_size = info->fix.smem_len;
> > > > > +    total_size = helper->fb->height * helper->fb->pitches[0];
> > > > This is just to mitigate the mistakes already has been made,
> > > > 
> > > > because it  do not do a good splitting between the *clip* part and the
> > > > *damage update* part.
> > > > 
> > > > An ideal clipping do not obscure its updating backend with a
> > > > out-of-bound damage rectangle.
> > > > 
> > > > Why did the drm_fb_helper_memory_range_to_clip() can not do a good job
> > > > in all case
> > > > 
> > > > to pass its backend a always meaningful damage rect ?
> > > > 
> > > > >        max_off = min(max_off, total_size);
> > > > >          if (min_off < max_off) {
> > > > > 
> > > > > 
> > > > > I think that would make it utmost clear on what we're doing and why.
> > > > > Otherwise we're just going to re-create the same bug again, like we've
> > > > > done already :-)
> > > > No, we create no bugs, we fix one.
> > > > 
> > > > Thanks.
> > > > 
> > > But honestly I do not have strong feel toward this, I just type what I'm
> > > understand without seeing you resend a V3.
> > > 
> > > It's OK in overall,  I will help to test this tomorrow.  :-)
> > Apologies for making you jump around all the time and doing different
> > versions of the same bugfix :-/
> 
> No,  I do not mind.  I'm wondering if you are testing me.

Nah I'm really not any clearer on this than you :-/

> > I think this one here is ok to merge,
> 
> NO,  to be honest,  this version is not ok.
> 
> I have just tested it on LoongArch . It does not prevent out-of-bound on
> LoongArch.
> 
> bellow is the call trace when running the fbdev test of IGT.
> 
> 
> [  369.628841] Console: switching to colour dummy device 80x25
> [  369.634440] [IGT] fbdev: executing
> [  369.654684] [IGT] fbdev: starting subtest info
> [  369.659173] [IGT] fbdev: starting subtest pan
> [  369.722093] [IGT] fbdev: starting subtest read
> [  369.737795] [IGT] fbdev: starting subtest unaligned-read
> [  369.745695] [IGT] fbdev: starting subtest write
> [  369.753154] CPU 3 Unable to handle kernel paging request at virtual address ffff800034bd0000, era == 9000000000223d5c, ra == ffff8000020d75a8
> [  369.774570] [IGT] fbdev: starting subtest unaligned-write
> [  369.779960] Oops[#1]:
> [  369.782215] CPU: 3 PID: 504 Comm: kworker/3:3 Not tainted 6.3.0-rc5+ #377
> [  369.782219] Hardware name: Loongson Loongson-3A5000-HV-7A2000-1w-V0.1-EVB/Loongson-LS3A5000-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05383-beta10 1
> [  369.782223] Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
> [  369.802706] $ 0   : 0000000000000000 ffff8000020d75a8 90000001367fc000 90000001367ffcf0
> [  369.809368] $ 4   : ffff80003a3ec000 ffff800034bcee00 0000000000001e00 9000000001160000
> [  369.825275] $ 8   : ffff80003a3ebfff 0000000000000040 0000000000000000 ffff80000214f20c
> [  369.825280] $12   : ffff80003a3ecc00 ffff800034bd0000 0000000000000000 0000000000001e00
> [  369.841188] $16   : 9000000107490800 9000000001a24000 9000000001a28000 00000e00207ec000
> [  369.849152] $20   : fffffffffe000000 900000010684cec0 0000000000000439 90000001367ffd90
> [  369.849165] $24   : 9000000106bc5200 ffff8000020de000 ffff800034bcee00 0000000000001e00
> [  369.865072] $28   : 90000001076d4400 0000000000000001 900000010553c000 ffff80003a3eae00
> [  369.865078] era   : 9000000000223d5c __memcpy_toio+0x4c/0x90
> [  369.878651] ra    : ffff8000020d75a8 drm_fbdev_generic_helper_fb_dirty+0x1cc/0x300 [drm_kms_helper]
> [  369.878762] [IGT] fbdev: starting subtest eof
> [  369.887679] CSR crmd: 000000b0
> [  369.887680] CSR prmd: 00000004
> [  369.887682] CSR euen: 00000000
> [  369.887683] CSR ecfg: 00071c1c
> [  369.901340] CSR estat: 00010000
> [  369.901342] ExcCode : 1 (SubCode 0)
> [  369.901344] BadVA : ffff800034bd0000
> [  369.914659] PrId  : 0014c011 (Loongson-64bit)
> [  369.914660] Modules linked in: uas usb_storage snd_seq_dummy snd_seq snd_seq_device ip_set rfkill nf_tables nfnetlink vfat fat loongson ttm acpi_ipmi drm_kms_helper syscopyarea sysfillrect ipmi_si ipmi_devintf sysimgblt ipmi_msghandler fuse efivarfs
> [  369.919013] Process kworker/3:3 (pid: 504, threadinfo=00000000a1234af0, task=000000004e2cde6f)
> [  369.949519] Stack : 9000000106bc5318 900000010684cec0 9000000107afd470 ffff800039c00000
> [  369.949535] [IGT] fbdev: starting subtest nullptr
> [  369.957476]         0000000000000001 0000000000000000 0000000000000000 76e0ff420f8eaeab
> [  369.957481]         9000000001712000 fffffffffffffffb 9000000100161080 0000000000000003
> [  369.970105]         900000000980ba05 900000000980ba00 9000000106bc5200 9000000106bc52d4
> [  369.978062]         ffff8000020de000 9000000106bc52d8 9000000110664b40 ffff8000020d78e4
> [  369.986018]         043a078000000000 76e0ff420f8eaeab 900000000980be00 9000000009807400
> [  370.001926]         0000000000000000 9000000110664b40 9000000106bc52d8 9000000000256dbc
> [  370.001931]         900000000170e000 9000000107afce00 0000000000000001 900000000170e000
> [  370.009888]         9000000009807428 9000000110664b70 9000000009807400 900000000025737c
> [  370.025797]         9000000100161080 9000000001148080 9000000107afce00 0000000000000003
> [  370.026543] [IGT] fbdev: exiting, ret=0
> [  370.033753]         ...
> [  370.033756] Call Trace:
> [  370.033757] [<9000000000223d5c>] __memcpy_toio+0x4c/0x90
> [  370.047681] [<ffff8000020d75a8>] drm_fbdev_generic_helper_fb_dirty+0x1cc/0x300 [drm_kms_helper]
> [  370.056354] [<ffff8000020d78e4>] drm_fb_helper_damage_work+0xa4/0x1d0 [drm_kms_helper]
> [  370.056381] [<9000000000256dbc>] process_one_work+0x1ec/0x35c
> [  370.056385] [<900000000025737c>] worker_thread+0x88/0x428
> [  370.056387] [<900000000025f4bc>] kthread+0x114/0x120
> [  370.056392] [<90000000002215a8>] ret_from_kernel_thread+0xc/0xa4
> [  370.056395]
> [  370.056396] Code: 00410def  0010bc8c  001500ad <260001ae> 02c02084  02c021ad  29ffe08e  5ffff184  03401cc6
> [  370.056406]
> [  370.056421] fbcon_init: detected unhandled fb_set_par error, error code -16
> [  370.056482] ---[ end trace 0000000000000000 ]---
> [  370.066620] Console: switching to colour frame buffer device 240x67
> 
> 
> > I just thought when looking at
> > the history that we revert the exact patch without any other changes
> > or comments,
> Other part of that patch(except this line) may still useful, at least for
> cleanup purpose.
> > and usually that means someone will come up with the same
> > cleanup idea again, and then we'll have a bug again. So maybe a
> > comment or a WARN_ON or something else would be good.
> 
> A  WARN_ON is acceptable.
> 
> > I guess we could also do your patch, but put a WARN_ON that the
> > computed total_size is never bigger than the drm_fb size into
> > drm_fb_helper_deferred_io()? That would also make sure that this bug
> > doesn't get resurrected again.
> 
> Best to merge V2 [1] of this series, that is what I am really fixed.
> 
> Maybe somebody can help to refine it, to add a better description about this
> question and so on.
> 
> [1] https://patchwork.freedesktop.org/patch/532143/?series=116454&rev=1

Ok, I guess this really is the safest one. For that patch, do we need the
change to screen_size in drm_fbdev_generic_helper_fb_probe()? I'm still
not entirely clear. If it works without that change I think that's clearer
for a minimal bugfix, if so can you send that out as v4 please?

Also please Cc: Geert on whatever you're resubmitting, so he can test too
and we can make sure it's still fixing the shmob issue he's seeing.

And finally please include a link to this discussion here with a note that
just reverting the screen_size changes is not enough:

https://lore.kernel.org/dri-devel/ad44df29-3241-0d9e-e708-b0338bf3c623@189.cn/

Thanks a lot!
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
