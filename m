Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3393311342
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 22:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6220E6F4D4;
	Fri,  5 Feb 2021 21:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4E66F4D2;
 Fri,  5 Feb 2021 21:17:13 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23802939-1500050 for multiple; Fri, 05 Feb 2021 21:16:02 +0000
MIME-Version: 1.0
In-Reply-To: <20210205210610.29837-1-chris@chris-wilson.co.uk>
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <20210205210610.29837-1-chris@chris-wilson.co.uk>
Subject: Re: [PATCH v2] kernel: Expose SYS_kcmp by default
From: Chris Wilson <chris@chris-wilson.co.uk>
To: linux-kernel@vger.kernel.org
Date: Fri, 05 Feb 2021 21:16:01 +0000
Message-ID: <161255976138.12021.9385501710085642237@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andy Lutomirski <luto@amacapital.net>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The subject should of course be changed, as it is no longer being
enabled by default.

Something like

kcmp: Support selection of SYS_kcmp without CHECKPOINT_RESTORE

Quoting Chris Wilson (2021-02-05 21:06:10)
> Userspace has discovered the functionality offered by SYS_kcmp and has
> started to depend upon it. In particular, Mesa uses SYS_kcmp for
> os_same_file_description() in order to identify when two fd (e.g. device
> or dmabuf) point to the same struct file. Since they depend on it for
> core functionality, lift SYS_kcmp out of the non-default
> CONFIG_CHECKPOINT_RESTORE into the selectable syscall category.
> 
> Note that some distributions such as Ubuntu are already enabling
> CHECKPOINT_RESTORE in their configs and so, by extension, SYS_kcmp.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/3046
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Andy Lutomirski <luto@amacapital.net>
> Cc: Will Drewry <wad@chromium.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> # DRM depends on SYS_kcmp
> 
> ---
> v2:
>   - Default n.
>   - Borrrow help message from man kcmp.
>   - Export get_epoll_tfile_raw_ptr() for CONFIG_KCMP
> ---
>  fs/eventpoll.c                                |  4 ++--
>  include/linux/eventpoll.h                     |  2 +-
>  init/Kconfig                                  | 12 ++++++++++++
>  kernel/Makefile                               |  2 +-
>  tools/testing/selftests/seccomp/seccomp_bpf.c |  2 +-
>  5 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> index a829af074eb5..3196474cbe24 100644
> --- a/fs/eventpoll.c
> +++ b/fs/eventpoll.c
> @@ -979,7 +979,7 @@ static struct epitem *ep_find(struct eventpoll *ep, struct file *file, int fd)
>         return epir;
>  }
>  
> -#ifdef CONFIG_CHECKPOINT_RESTORE
> +#ifdef CONFIG_KCMP
>  static struct epitem *ep_find_tfd(struct eventpoll *ep, int tfd, unsigned long toff)
>  {
>         struct rb_node *rbp;
> @@ -1021,7 +1021,7 @@ struct file *get_epoll_tfile_raw_ptr(struct file *file, int tfd,
>  
>         return file_raw;
>  }
> -#endif /* CONFIG_CHECKPOINT_RESTORE */
> +#endif /* CONFIG_KCMP */
>  
>  /**
>   * Adds a new entry to the tail of the list in a lockless way, i.e.
> diff --git a/include/linux/eventpoll.h b/include/linux/eventpoll.h
> index 0350393465d4..593322c946e6 100644
> --- a/include/linux/eventpoll.h
> +++ b/include/linux/eventpoll.h
> @@ -18,7 +18,7 @@ struct file;
>  
>  #ifdef CONFIG_EPOLL
>  
> -#ifdef CONFIG_CHECKPOINT_RESTORE
> +#ifdef CONFIG_KCMP
>  struct file *get_epoll_tfile_raw_ptr(struct file *file, int tfd, unsigned long toff);
>  #endif
>  
> diff --git a/init/Kconfig b/init/Kconfig
> index b77c60f8b963..1b75141bc18b 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1194,6 +1194,7 @@ endif # NAMESPACES
>  config CHECKPOINT_RESTORE
>         bool "Checkpoint/restore support"
>         select PROC_CHILDREN
> +       select KCMP
>         default n
>         help
>           Enables additional kernel features in a sake of checkpoint/restore.
> @@ -1737,6 +1738,17 @@ config ARCH_HAS_MEMBARRIER_CALLBACKS
>  config ARCH_HAS_MEMBARRIER_SYNC_CORE
>         bool
>  
> +config KCMP
> +       bool "Enable kcmp() system call" if EXPERT
> +       default n
> +       help
> +         Enable the kernel resource comparison system call. It provides
> +         user-space with the ability to compare two processes to see if they
> +         share a common resource, such as a file descriptor or even virtual
> +         memory space.
> +
> +         If unsure, say N.
> +
>  config RSEQ
>         bool "Enable rseq() system call" if EXPERT
>         default y
> diff --git a/kernel/Makefile b/kernel/Makefile
> index aa7368c7eabf..320f1f3941b7 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -51,7 +51,7 @@ obj-y += livepatch/
>  obj-y += dma/
>  obj-y += entry/
>  
> -obj-$(CONFIG_CHECKPOINT_RESTORE) += kcmp.o
> +obj-$(CONFIG_KCMP) += kcmp.o
>  obj-$(CONFIG_FREEZER) += freezer.o
>  obj-$(CONFIG_PROFILING) += profile.o
>  obj-$(CONFIG_STACKTRACE) += stacktrace.o
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 26c72f2b61b1..1b6c7d33c4ff 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -315,7 +315,7 @@ TEST(kcmp)
>         ret = __filecmp(getpid(), getpid(), 1, 1);
>         EXPECT_EQ(ret, 0);
>         if (ret != 0 && errno == ENOSYS)
> -               SKIP(return, "Kernel does not support kcmp() (missing CONFIG_CHECKPOINT_RESTORE?)");
> +               SKIP(return, "Kernel does not support kcmp() (missing CONFIG_KCMP?)");
>  }
>  
>  TEST(mode_strict_support)
> -- 
> 2.20.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
