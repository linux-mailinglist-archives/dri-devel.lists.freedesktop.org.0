Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E03E3207D7
	for <lists+dri-devel@lfdr.de>; Sun, 21 Feb 2021 01:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBA46E8EA;
	Sun, 21 Feb 2021 00:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603F66E8EA
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 00:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=xMyrY/Z5OgdQykMNU+hBMf1US/WYdbcx5lcCbeHnR3c=; b=S61JAnbBh0Lgk5qrDMEQGG2PMe
 ofUMMM3B3LJkqG/d1LriA16ne2H2NTmF/7nAcxfY1hpYlyIXeFHa1nkY/Qeb0holCm5vj/F4NKqI1
 Ux5YGkaoPCfes8QJ6aoHGN2SG2w863vODiAmOwuhvd9Z6yrfKpzM3AgeXXdvkNhn8I2QrRzNiMJyx
 LaD7/xlddyUNbSDwkhhAlYnQni0Dlg59T+l1R8E10sqH4kiK8560PSVYo3TpcbzndPZRfqcUeq8Id
 6o0ZN7SmmNxXBnoZaMCLtqyjHbwFzLK0M1X4L9ARe8oEy+6OOwsdhXz6QEYW59DwE8xwTrLjsrkio
 8lKVoXew==;
Received: from [2601:1c0:6280:3f0::d05b]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDcjA-0006WS-UT; Sun, 21 Feb 2021 00:36:01 +0000
Subject: Re: [PATCH v2] video: fbdev: pm2fb: avoid stall on fb_sync
To: Tong Zhang <ztong0001@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <ea1c5ff3-0b24-71c9-7a44-08b184c4854d@infradead.org>
 <20210221000024.358772-1-ztong0001@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6b35b3b2-a746-9524-3a19-82ee73427ead@infradead.org>
Date: Sat, 20 Feb 2021 16:35:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221000024.358772-1-ztong0001@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/20/21 4:00 PM, Tong Zhang wrote:
> pm2fb_sync is called when doing /dev/fb read or write.
> The original pm2fb_sync wait indefinitely on hardware flags which can
> possibly stall kernel and make everything unresponsive.
> Instead of waiting indefinitely, we can timeout to give user a chance to
> get back control.
> 
> [   39.503356] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-48-gd9c812dda5194
> [   39.503947] Call Trace:
> [   39.504081]  <IRQ>
> [   39.504193]  dump_stack+0x7d/0xa3
> [   39.504377]  nmi_cpu_backtrace.cold+0x32/0x7e
> [   39.504613]  ? lapic_can_unplug_cpu+0x70/0x70
> [   39.504850]  nmi_trigger_cpumask_backtrace+0xdf/0x100
> [   39.505121]  rcu_dump_cpu_stacks+0xed/0x130
> [   39.505349]  rcu_sched_clock_irq.cold+0x3b1/0x61d
> [   39.505602]  ? hrtimer_run_queues+0x2c/0x1b0
> [   39.505833]  ? __acct_update_integrals+0x136/0x160
> [   39.506091]  update_process_times+0xb9/0xf0
> [   39.506317]  tick_sched_handle.isra.0+0x5c/0x80
> [   39.506562]  tick_sched_timer+0x70/0x90
> [   39.506770]  __hrtimer_run_queues+0x1c6/0x3e0
> [   39.517095]  ? tick_sched_handle.isra.0+0x80/0x80
> [   39.517349]  ? enqueue_hrtimer+0xd0/0xd0
> [   39.517561]  ? _raw_write_lock_irqsave+0xd0/0xd0
> [   39.517812]  ? ktime_get+0x45/0xb0
> [   39.517997]  ? ktime_get_update_offsets_now+0x96/0x150
> [   39.518273]  hrtimer_interrupt+0x1a0/0x340
> [   39.518496]  __sysvec_apic_timer_interrupt+0x7f/0x160
> [   39.518768]  asm_call_irq_on_stack+0xf/0x20
> [   39.518997]  </IRQ>
> [   39.519114]  sysvec_apic_timer_interrupt+0x6f/0x80
> [   39.519372]  asm_sysvec_apic_timer_interrupt+0x12/0x20
> [   39.519647] RIP: 0010:pm2fb_sync+0x47/0x70 [pm2fb]
> [   39.519907] Code: 89 ef e8 0c 87 2c c1 48 8b 53 08 31 c0 89 82 40 8c 00 00 0f ae f0 48 8b 53 08 1
> [   39.520885] RSP: 0018:ffff88810a1f7df8 EFLAGS: 00000202
> [   39.521165] RAX: 0000000072d5d49f RBX: ffff88810a034418 RCX: ffffc900000b0020
> [   39.521542] RDX: ffffc900000b0000 RSI: 0000000000000246 RDI: ffff88810a034420
> [   39.521920] RBP: ffff88810a034420 R08: 0000000000000000 R09: ffffed102143ef64
> [   39.522297] R10: 0000000000000003 R11: ffffed102143ef63 R12: ffff88810a1f7ed0
> [   39.522673] R13: ffff88810a034000 R14: ffffc90002800000 R15: ffff888109e5e000
> [   39.523053]  ? pm2fb_sync+0x24/0x70 [pm2fb]
> [   39.523280]  fb_write+0x1c2/0x2d0
> [   39.523461]  vfs_write+0x108/0x380
> [   39.523647]  ksys_write+0xb4/0x150
> [   39.523832]  ? __ia32_sys_read+0x40/0x40
> [   39.524043]  ? fpregs_assert_state_consistent+0x4d/0x60
> [   39.524322]  do_syscall_64+0x33/0x40
> [   39.524517]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   39.524788] RIP: 0033:0x7f5e50097970
> [   39.524981] Code: 73 01 c3 48 8b 0d 28 d5 2b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 4
> [   39.525952] RSP: 002b:00007ffec6895b38 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> [   39.526352] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f5e50097970
> [   39.526726] RDX: 0000000000000200 RSI: 000056491a6ad000 RDI: 0000000000000001
> [   39.537261] RBP: 0000000000000200 R08: 0000000000000000 R09: 000056491a6ad030
> [   39.537633] R10: 0000000000000871 R11: 0000000000000246 R12: 0000000000000800
> [   39.538008] R13: 000056491a6ad000 R14: 0000000000000200 R15: 0000000000000000
> 
> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> ---
>  v2: fix typo and add console log according to Randy's <rdunlap@infradead.org> comment
> 
>  drivers/video/fbdev/pm2fb.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
> index 27893fa139b0..d6731e04252f 100644
> --- a/drivers/video/fbdev/pm2fb.c
> +++ b/drivers/video/fbdev/pm2fb.c
> @@ -183,12 +183,23 @@ static inline void pm2v_RDAC_WR(struct pm2fb_par *p, s32 idx, u32 v)
>  
>  #ifdef CONFIG_FB_PM2_FIFO_DISCONNECT
>  #define WAIT_FIFO(p, a)
> +#define WAIT_FIFO_TIMEOUT(p, a) (0)
>  #else
>  static inline void WAIT_FIFO(struct pm2fb_par *p, u32 a)
>  {
>  	while (pm2_RD(p, PM2R_IN_FIFO_SPACE) < a)
>  		cpu_relax();
>  }

/* return 1 for timeout, otherwise 0 */
> +static inline int WAIT_FIFO_TIMEOUT(struct pm2fb_par *p, u32 a)
> +{
> +	int timeout = 10000;
> +	while (pm2_RD(p, PM2R_IN_FIFO_SPACE) < a) {
> +		cpu_relax();
> +		if (--timeout == 0)
> +			return 1;
> +	}
> +	return 0;
> +}
>  #endif
>  
>  /*
> @@ -1031,15 +1042,27 @@ static int pm2fb_blank(int blank_mode, struct fb_info *info)
>  static int pm2fb_sync(struct fb_info *info)
>  {
>  	struct pm2fb_par *par = info->par;
> +	int timeout_sync = 10000;
> +	int timeout_fifo;
>  
> -	WAIT_FIFO(par, 1);
> +	if (WAIT_FIFO_TIMEOUT(par, 1))
> +		goto end;

if the above goto happens, timeout_fifo is used but not initialized
at label end:

>  	pm2_WR(par, PM2R_SYNC, 0);
>  	mb();
>  	do {
> -		while (pm2_RD(par, PM2R_OUT_FIFO_WORDS) == 0)
> +		timeout_fifo = 10000;
> +		while (pm2_RD(par, PM2R_OUT_FIFO_WORDS) == 0) {
>  			cpu_relax();
> -	} while (pm2_RD(par, PM2R_OUT_FIFO) != PM2TAG(PM2R_SYNC));
> +			if (--timeout_fifo == 0)
> +				goto end;
> +		}
> +		if (pm2_RD(par, PM2R_OUT_FIFO) == PM2TAG(PM2R_SYNC))
> +			break;
> +	} while (--timeout_sync > 0);
>  
> +end:
> +	if ((!timeout_sync) || (!timeout_fifo))
> +		printk_ratelimited(KERN_WARNING "pm2fb: sync timeout!\n");
>  	return 0;
>  }
>  
> 

I suppose the rest of the patch is OK since it works for you.

I don't know any of this code. It would be nice to know what some
of those pm2_RD(par, SOME_REG) mean so that I could sort of
understand what it is doing, but don't go spending time on it
just for me. It's not worth doing that IMO.


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
