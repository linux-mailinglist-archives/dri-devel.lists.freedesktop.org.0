Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D7B2B3A83
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 00:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631D389C3F;
	Sun, 15 Nov 2020 23:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3720F89C3F;
 Sun, 15 Nov 2020 23:04:44 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id w5so1611165ybj.11;
 Sun, 15 Nov 2020 15:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=olRFhuJ0eM55+9jgcs7ITDhZa1tsZvUbIVkz7Gwn4Wk=;
 b=TpIBJ2/0g5MyiSFcqEgJPCY/4flCzowPWSpkncdrcF+YIMFI7Sz4PkVCnS7kl5hlyI
 ICmK4ft4qMaTSCXFG+FPfZuLZb6baCo7LwRO4CXWhLzOLJeAMuRNAtPjuJwEegUyR5EO
 jDo2Zrrpuocs4i+P1NYDn2PdxYkK+wNMsqFuT3yGinHlRfYvNnBBEako9ONT1D8ms1q6
 aHoIk759khyRTQkbQmutevORL9WdWmjj1L9XkqQR14RbjycGoqVMrxbEldGN5Lu4fBtQ
 MOy/A1rN9IOfAAa+I5pd9w+eRkevS1IQr+Dsi7LEG+hkDexWx6UJwKlxgj6rLBzS2tOx
 PsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=olRFhuJ0eM55+9jgcs7ITDhZa1tsZvUbIVkz7Gwn4Wk=;
 b=bQrz8zsJq4KfAD+V1tLMy4cJ78S2dJF305hlV0ZLDicTjLVNQKd8P+Opz0NdZH9enD
 jHzXmPk5gvBaZSLb2FKnqvf5FuhJrsbAS6MnY1B4Ms0aA2VWN2exOY3mrwMPIw0GPxSu
 y/8SZRDBKJQAIZP5p1U1RJGTTn0JQXOAJrXHHNhyGkYkTSkvAU2Jxj05XvV6fvntvocw
 E8+YByV22a2gA0xGPsBFw4+k0tHNiEk0UQDRz0qZVeUj8vs0il+W/uK2N1qHGtligFjS
 qec//EznF49B8KVJChR0E20IAISyflBK5ErRzJmOsJ/0/GMlhsWbaeg2i5RIyGql9Tip
 eBMA==
X-Gm-Message-State: AOAM531890ghMrHSZgruCYAn/QHUUYTaDsXeegAN5GcyhThNu7vsdB33
 jiDy2do0fQEUP4NDlLpacJKvtZ307C/nWfqD8L8=
X-Google-Smtp-Source: ABdhPJw+ZaeNhpJRQ4jrP6tCumHwxMe5plAyGbgkW6IBfwsvtpUDls+5lTDyOsfQ1e/RZfIL5PyFxCcN2Tar+HCNoY0=
X-Received: by 2002:a25:d10f:: with SMTP id i15mr16258221ybg.60.1605481483343; 
 Sun, 15 Nov 2020 15:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20200828092846.GA11454@localhost.localdomain>
 <20201115091010.GA132466@eldamar.lan>
 <CACO55tvwtYj0QGFy3Bk5-13bm7cjHGko3WegY1fFbtf0WckQyQ@mail.gmail.com>
In-Reply-To: <CACO55tvwtYj0QGFy3Bk5-13bm7cjHGko3WegY1fFbtf0WckQyQ@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 16 Nov 2020 09:04:32 +1000
Message-ID: <CACAvsv701GiR6QetL6FGUCQLVn45+1EVGTuA-6Pmw5RtwrvyRQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: bail out of nouveau_channel_new if
 channel init fails
To: Karol Herbst <kherbst@redhat.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Frantisek Hrbata <frantisek@hrbata.com>,
 Salvatore Bonaccorso <carnil@debian.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Nov 2020 at 05:19, Karol Herbst <kherbst@redhat.com> wrote:
>
> On Sun, Nov 15, 2020 at 6:43 PM Salvatore Bonaccorso <carnil@debian.org> wrote:
> >
> > Hi,
> >
> > On Fri, Aug 28, 2020 at 11:28:46AM +0200, Frantisek Hrbata wrote:
> > > Unprivileged user can crash kernel by using DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC
> > > ioctl. This was reported by trinity[1] fuzzer.
> > >
> > > [   71.073906] nouveau 0000:01:00.0: crashme[1329]: channel failed to initialise, -17
> > > [   71.081730] BUG: kernel NULL pointer dereference, address: 00000000000000a0
> > > [   71.088928] #PF: supervisor read access in kernel mode
> > > [   71.094059] #PF: error_code(0x0000) - not-present page
> > > [   71.099189] PGD 119590067 P4D 119590067 PUD 1054f5067 PMD 0
> > > [   71.104842] Oops: 0000 [#1] SMP NOPTI
> > > [   71.108498] CPU: 2 PID: 1329 Comm: crashme Not tainted 5.8.0-rc6+ #2
> > > [   71.114993] Hardware name: AMD Pike/Pike, BIOS RPK1506A 09/03/2014
> > > [   71.121213] RIP: 0010:nouveau_abi16_ioctl_channel_alloc+0x108/0x380 [nouveau]
> > > [   71.128339] Code: 48 89 9d f0 00 00 00 41 8b 4c 24 04 41 8b 14 24 45 31 c0 4c 8d 4b 10 48 89 ee 4c 89 f7 e8 10 11 00 00 85 c0 75 78 48 8b 43 10 <8b> 90 a0 00 00 00 41 89 54 24 08 80 7d 3d 05 0f 86 bb 01 00 00 41
> > > [   71.147074] RSP: 0018:ffffb4a1809cfd38 EFLAGS: 00010246
> > > [   71.152526] RAX: 0000000000000000 RBX: ffff98cedbaa1d20 RCX: 00000000000003bf
> > > [   71.159651] RDX: 00000000000003be RSI: 0000000000000000 RDI: 0000000000030160
> > > [   71.166774] RBP: ffff98cee776de00 R08: ffffdc0144198a08 R09: ffff98ceeefd4000
> > > [   71.173901] R10: ffff98cee7e81780 R11: 0000000000000001 R12: ffffb4a1809cfe08
> > > [   71.181214] R13: ffff98cee776d000 R14: ffff98cec519e000 R15: ffff98cee776def0
> > > [   71.188339] FS:  00007fd926250500(0000) GS:ffff98ceeac80000(0000) knlGS:0000000000000000
> > > [   71.196418] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [   71.202155] CR2: 00000000000000a0 CR3: 0000000106622000 CR4: 00000000000406e0
> > > [   71.209297] Call Trace:
> > > [   71.211777]  ? nouveau_abi16_ioctl_getparam+0x1f0/0x1f0 [nouveau]
> > > [   71.218053]  drm_ioctl_kernel+0xac/0xf0 [drm]
> > > [   71.222421]  drm_ioctl+0x211/0x3c0 [drm]
> > > [   71.226379]  ? nouveau_abi16_ioctl_getparam+0x1f0/0x1f0 [nouveau]
> > > [   71.232500]  nouveau_drm_ioctl+0x57/0xb0 [nouveau]
> > > [   71.237285]  ksys_ioctl+0x86/0xc0
> > > [   71.240595]  __x64_sys_ioctl+0x16/0x20
> > > [   71.244340]  do_syscall_64+0x4c/0x90
> > > [   71.248110]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > > [   71.253162] RIP: 0033:0x7fd925d4b88b
> > > [   71.256731] Code: Bad RIP value.
> > > [   71.259955] RSP: 002b:00007ffc743592d8 EFLAGS: 00000206 ORIG_RAX: 0000000000000010
> > > [   71.267514] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fd925d4b88b
> > > [   71.274637] RDX: 0000000000601080 RSI: 00000000c0586442 RDI: 0000000000000003
> > > [   71.281986] RBP: 00007ffc74359340 R08: 00007fd926016ce0 R09: 00007fd926016ce0
> > > [   71.289111] R10: 0000000000000003 R11: 0000000000000206 R12: 0000000000400620
> > > [   71.296235] R13: 00007ffc74359420 R14: 0000000000000000 R15: 0000000000000000
> > > [   71.303361] Modules linked in: rfkill sunrpc snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core edac_mce_amd snd_hwdep kvm_amd snd_seq ccp snd_seq_device snd_pcm kvm snd_timer snd irqbypass soundcore sp5100_tco pcspkr crct10dif_pclmul crc32_pclmul ghash_clmulni_intel wmi_bmof joydev i2c_piix4 fam15h_power k10temp acpi_cpufreq ip_tables xfs libcrc32c sd_mod t10_pi sg nouveau video mxm_wmi i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm broadcom bcm_phy_lib ata_generic ahci drm e1000 crc32c_intel libahci serio_raw tg3 libata firewire_ohci firewire_core wmi crc_itu_t dm_mirror dm_region_hash dm_log dm_mod
> > > [   71.365269] CR2: 00000000000000a0
> > >
> > > simplified reproducer
> > > ---------------------------------8<----------------------------------------
> > > /*
> > >  * gcc -o crashme crashme.c
> > >  * ./crashme /dev/dri/renderD128
> > >  */
> > >
> > > struct drm_nouveau_channel_alloc {
> > >       uint32_t     fb_ctxdma_handle;
> > >       uint32_t     tt_ctxdma_handle;
> > >
> > >       int          channel;
> > >       uint32_t     pushbuf_domains;
> > >
> > >       /* Notifier memory */
> > >       uint32_t     notifier_handle;
> > >
> > >       /* DRM-enforced subchannel assignments */
> > >       struct {
> > >               uint32_t handle;
> > >               uint32_t grclass;
> > >       } subchan[8];
> > >       uint32_t nr_subchan;
> > > };
> > >
> > > static struct drm_nouveau_channel_alloc channel;
> > >
> > > int main(int argc, char *argv[]) {
> > >       int fd;
> > >       int rv;
> > >
> > >       if (argc != 2)
> > >               die("usage: %s <dev>", 0, argv[0]);
> > >
> > >       if ((fd = open(argv[1], O_RDONLY)) == -1)
> > >               die("open %s", errno, argv[1]);
> > >
> > >       if (ioctl(fd, DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC, &channel) == -1 &&
> > >                       errno == EACCES)
> > >               die("ioctl %s", errno, argv[1]);
> > >
> > >       close(fd);
> > >
> > >       printf("PASS\n");
> > >
> > >       return 0;
> > > }
> > > ---------------------------------8<----------------------------------------
> > >
> > > [1] https://github.com/kernelslacker/trinity
> > >
> > > Fixes: eeaf06ac1a55 ("drm/nouveau/svm: initial support for shared virtual memory")
> > > Signed-off-by: Frantisek Hrbata <frantisek at hrbata.com>
> > > ---
> > >  drivers/gpu/drm/nouveau/nouveau_chan.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > > index b80e4ebf1..a7a47b325 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > > @@ -533,6 +533,7 @@ nouveau_channel_new(struct nouveau_drm *drm, struct nvif_device *device,
> > >       if (ret) {
> > >               NV_PRINTK(err, cli, "channel failed to initialise, %d\n", ret);
> > >               nouveau_channel_del(pchan);
> > > +             goto done;
> > >       }
> > >
> > >       ret = nouveau_svmm_join((*pchan)->vmm->svmm, (*pchan)->inst);
> > > --
> > > Frantisek Hrbata
> >
> > Is this still planned to be applied? AFAICS this is the fix for
> > CVE-2020-25639.
> >
>
> If it's urgent to get it fixed, I suggest going through the Linux
> kernel or drm stable path. CCing dri-devel, Dave, Daniel and Ben.
Missed this.  I'll grab it today and send it with the next -fixes.

Ben.
>
> > Regards,
> > Salvatore
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
