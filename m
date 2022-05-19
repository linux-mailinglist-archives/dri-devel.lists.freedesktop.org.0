Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B450E52D26A
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 14:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAB111A2B4;
	Thu, 19 May 2022 12:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2892B11A2B3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 12:25:46 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id g16so6048685lja.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 05:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=+XDjcMQak510AbIZ8jLkJgCvsFB2A35/wbL1HOG/INE=;
 b=lAaJmEzLeV3vj8T8CSED/mJMzic3+74SHUYEpH6rpNmlXcIRQJ7C+b0Zjroo6JCc+p
 sw7SiTRSHqFvu27HOAEoJgN50mU6H6jGIvxIVz1Qqt8HH/9qlWDMWOGArR12oDwWgY9v
 tUkLQUV530OJQO6ckRfmQQo22zxot9pSkAQ0bTH/Lie/ogo4VmqDwOuoPM9L+h4GO5z0
 Rlci8TgIRLcw+UjP/r+RBA3z+fqz+x2oAM0bYelrxvbIts5DkBckYKYzc6CtCJZ8OKhB
 d3SkhkjfQ/zXDIQ+3mEc3PfvvPbDsPc4RqZ0IvxZewlrEeQx+Db4pN5PLMX6OStKVPvA
 hVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=+XDjcMQak510AbIZ8jLkJgCvsFB2A35/wbL1HOG/INE=;
 b=O1GldJDKtghH6Nm3IBqzRHt3uaw4M9S7CyPRwBajIeDADallBOvvcjtqK67zx7JB4k
 9dRilovACdsb00z6Ww1Y1w1YJNSwx8l1wfkxsGhc59NjCJSNyduP32V8WmC0VHDbU+G6
 Lz//D/BTxLT9Tz5Kj+P4WkqU3ff706OGYxB+Ghedyw74SH3Y/XYqibBn/Ef38OVj1VFp
 K4KClwiTXfGblACC2aYEgW655aQiYp9y4thRSTENvAPIpaIq07ii3D/uT4+iJykj9To7
 KLr6pWE2x7aa1APnVCbLO1Ax1Ut6NMSS5WSsrWlipl6prt1PNc88lkdvxXP3bzFyHLYF
 oT3g==
X-Gm-Message-State: AOAM533u5F+UlM++qSGe9hZZ/BvGYA/RQ593pqhWlJFL66mIdd3Pin4P
 mHSHzHcF2AbncObg7KGuXxvJVmcQcv0PUDZF2YB7Hw==
X-Google-Smtp-Source: ABdhPJxGyJtgWwbX8S0lH1j2ZFkcMo+rRVbGhMPhGE4a6v5ghusnKHQReSrKTmWTBYwAlslvk0NjT5bOE5aDGCFRwmA=
X-Received: by 2002:a05:651c:a11:b0:250:5da4:e7b1 with SMTP id
 k17-20020a05651c0a1100b002505da4e7b1mr2551149ljq.268.1652963144078; Thu, 19
 May 2022 05:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000f0196305d219b2fe@google.com>
 <000000000000b968f305d74b1195@google.com>
 <YgJhjdAbRHdnCZ4T@phenom.ffwll.local>
In-Reply-To: <YgJhjdAbRHdnCZ4T@phenom.ffwll.local>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 19 May 2022 14:25:32 +0200
Message-ID: <CACT4Y+ZiexzqBxeDQJAeQMR7Ef=JSh-2S8P73LN2BnibXhiC3Q@mail.gmail.com>
Subject: Re: [syzbot] WARNING in __dma_map_sg_attrs
To: syzbot <syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org, hch@lst.de, iommu@lists.linux-foundation.org, 
 linaro-mm-sig-owner@lists.linaro.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 m.szyprowski@samsung.com, robin.murphy@arm.com, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com
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

On Tue, 8 Feb 2022 at 13:26, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sat, Feb 05, 2022 at 12:18:23PM -0800, syzbot wrote:
> > syzbot has found a reproducer for the following issue on:
> >
> > HEAD commit:    0457e5153e0e Merge tag 'for-linus' of git://git.kernel.org..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=11b2637c700000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=6f043113811433a5
> > dashboard link: https://syzkaller.appspot.com/bug?extid=10e27961f4da37c443b2
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11c65542700000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1163f480700000
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com
>
> Adding Gerd, since this seems to blow up in udmabuf.
>
> I wonder why syzbot didn't figure this out, since it seems to have
> correctly added both dma-api and dma-buf people. Just not the maintainer
> for the begin_cpu_udmabuf function in the middle of the backtrace?

Hi Daniel,

syzbot selects only 1 file to get maintainers.
Do you suggest using all files in the stack trace? I think it may lead
to too many developers CCed since there can be something like 20 files
including something from scheduler, arch, fs, etc.



> > ------------[ cut here ]------------
> > WARNING: CPU: 1 PID: 3595 at kernel/dma/mapping.c:188 __dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
> > Modules linked in:
> > CPU: 0 PID: 3595 Comm: syz-executor249 Not tainted 5.17.0-rc2-syzkaller-00316-g0457e5153e0e #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > RIP: 0010:__dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
> > Code: 00 00 00 00 00 fc ff df 48 c1 e8 03 80 3c 10 00 75 71 4c 8b 3d c0 83 b5 0d e9 db fe ff ff e8 b6 0f 13 00 0f 0b e8 af 0f 13 00 <0f> 0b 45 31 e4 e9 54 ff ff ff e8 a0 0f 13 00 49 8d 7f 50 48 b8 00
> > RSP: 0018:ffffc90002a07d68 EFLAGS: 00010293
> > RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> > RDX: ffff88807e25e2c0 RSI: ffffffff81649e91 RDI: ffff88801b848408
> > RBP: ffff88801b848000 R08: 0000000000000002 R09: ffff88801d86c74f
> > R10: ffffffff81649d72 R11: 0000000000000001 R12: 0000000000000002
> > R13: ffff88801d86c680 R14: 0000000000000001 R15: 0000000000000000
> > FS:  0000555556e30300(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00000000200000cc CR3: 000000001d74a000 CR4: 00000000003506e0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  <TASK>
> >  dma_map_sgtable+0x70/0xf0 kernel/dma/mapping.c:264
> >  get_sg_table.isra.0+0xe0/0x160 drivers/dma-buf/udmabuf.c:72
> >  begin_cpu_udmabuf+0x130/0x1d0 drivers/dma-buf/udmabuf.c:126
> >  dma_buf_begin_cpu_access+0xfd/0x1d0 drivers/dma-buf/dma-buf.c:1164
> >  dma_buf_ioctl+0x259/0x2b0 drivers/dma-buf/dma-buf.c:363
> >  vfs_ioctl fs/ioctl.c:51 [inline]
> >  __do_sys_ioctl fs/ioctl.c:874 [inline]
> >  __se_sys_ioctl fs/ioctl.c:860 [inline]
> >  __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
> >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> >  do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > RIP: 0033:0x7f62fcf530f9
> > Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
> > RSP: 002b:00007ffe3edab9b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> > RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f62fcf530f9
> > RDX: 0000000020000200 RSI: 0000000040086200 RDI: 0000000000000006
> > RBP: 00007f62fcf170e0 R08: 0000000000000000 R09: 0000000000000000
> > R10: 0000000000000000 R11: 0000000000000246 R12: 00007f62fcf17170
> > R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> >  </TASK>
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/YgJhjdAbRHdnCZ4T%40phenom.ffwll.local.
