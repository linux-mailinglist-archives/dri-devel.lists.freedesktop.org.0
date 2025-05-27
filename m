Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19132AC56B1
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 19:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC6F10E0EF;
	Tue, 27 May 2025 17:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CbuRwfHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8673010E061;
 Tue, 27 May 2025 17:24:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 64A5DA4F1D7;
 Tue, 27 May 2025 17:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46626C4CEEA;
 Tue, 27 May 2025 17:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748366657;
 bh=LPpmYGHaeuXbmsjn+skQ/1ouICPGUsFjyAV7RQufhw4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=CbuRwfHQ65UqdoUTnRUqLPuPGKZEKFEA/4cGSXnuH85yvKmVQcs/9UOUYFB6Ft84C
 VwST7OgiXd3MDEUT0UHgoXZzqZdczEKLcCqxHhXTipjcJzL1jBP+U4ztp9bEe1t3Hx
 gi2gQV934nNNh08zAPuaqPpE6bguTGnHFAZxHsmRsbvzfRD2751xDImVWLRymePRCX
 PkBdVBIKgCCMRDGAPU7MpQQvP7jYOSAhhAfeo8tCST52Vk0vs/TZEgqP5Xw2EXQE+v
 BCXsPlULmCEy4tpAPoHCdDnBcWcEbR1UnNLCN9ORzBHF9haBZdfVyivsfUVmhUsoo7
 Zk0DsYzr8f+Gw==
Message-ID: <40891c67a9243d673fa2143006dcfa60c20dac2f.camel@kernel.org>
Subject: Re: [PATCH v10 9/9] ref_tracker: eliminate the ref_tracker_dir name
 field
From: Jeff Layton <jlayton@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"	
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski	
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman	
 <horms@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Simona Vetter
 <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen	 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor	 <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, 	netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	intel-gfx@lists.freedesktop.org
Date: Tue, 27 May 2025 13:24:14 -0400
In-Reply-To: <20250527-reftrack-dbgfs-v10-9-dc55f7705691@kernel.org>
References: <20250527-reftrack-dbgfs-v10-0-dc55f7705691@kernel.org>
 <20250527-reftrack-dbgfs-v10-9-dc55f7705691@kernel.org>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
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

On Tue, 2025-05-27 at 07:33 -0400, Jeff Layton wrote:
> Now that we have dentries and the ability to create meaningful symlinks
> to them, don't keep a name string in each tracker. Switch the output
> format to print "class@address", and drop the name field.
>=20
> Also, add a kerneldoc header for ref_tracker_dir_init().
>=20
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_dp_tunnel.c |  2 +-
>  drivers/gpu/drm/i915/intel_runtime_pm.c |  2 +-
>  drivers/gpu/drm/i915/intel_wakeref.c    |  2 +-
>  include/linux/ref_tracker.h             | 20 ++++++++++++++------
>  lib/ref_tracker.c                       |  6 +++---
>  lib/test_ref_tracker.c                  |  2 +-
>  net/core/dev.c                          |  2 +-
>  net/core/net_namespace.c                |  4 ++--
>  8 files changed, 24 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/di=
splay/drm_dp_tunnel.c
> index b9c12b8bf2a3e400b6d8e9d184145834c603b9e1..1205a4432eb4142344fb6eed1=
cb5ba5b21ec6953 100644
> --- a/drivers/gpu/drm/display/drm_dp_tunnel.c
> +++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
> @@ -1920,7 +1920,7 @@ drm_dp_tunnel_mgr_create(struct drm_device *dev, in=
t max_group_count)
>  	}
> =20
>  #ifdef CONFIG_DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
> -	ref_tracker_dir_init(&mgr->ref_tracker, 16, "drm_dptun", "dptun");
> +	ref_tracker_dir_init(&mgr->ref_tracker, 16, "drm_dptun");
>  #endif
> =20
>  	for (i =3D 0; i < max_group_count; i++) {
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i9=
15/intel_runtime_pm.c
> index 3fdab3b44c08cea16ac2f73aafc2bea2ffbb19e7..c12b5d0e16fa363f3caede372=
e7a2031676aa7b5 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -60,7 +60,7 @@ static struct drm_i915_private *rpm_to_i915(struct inte=
l_runtime_pm *rpm)
>  static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
>  {
>  	ref_tracker_dir_init(&rpm->debug, INTEL_REFTRACK_DEAD_COUNT,
> -			     "intel_runtime_pm", dev_name(rpm->kdev));
> +			     "intel_runtime_pm");
>  }
> =20

I got a warning from the intel graphics CI that this was causing these
warnings:

<3> [513.235988] debugfs: File 'intel_runtime_pm@ff110001461f98a8' in direc=
tory 'ref_tracker' already present!
<4> [513.236073] ref_tracker: ref_tracker: unable to create debugfs file fo=
r intel_runtime_pm@ff110001461f98a8: -EEXIST
<3> [513.242646] debugfs: File 'intel_wakeref@ff1100016ee7d790' in director=
y 'ref_tracker' already present!
<4> [513.242724] ref_tracker: ref_tracker: unable to create debugfs file fo=
r intel_wakeref@ff1100016ee7d790: -EEXIST

I suspect these are existing bugs which are causing these ref_trackers
to be initialized more than once. If there were references taken
between these two initializations, then that could leak memory (or
worse). I think we need to ensure that these ref_trackers are only
initialized once.

I'll see if I can make a patch that does that, but if the i915 devs
want to do fix this up instead, I won't complain.


>  static intel_wakeref_t
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/=
intel_wakeref.c
> index 5269e64c58a49884f5d712557546272bfdeb8417..615fb77809291be34d94600fd=
d4d919461a22720 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.c
> +++ b/drivers/gpu/drm/i915/intel_wakeref.c
> @@ -114,7 +114,7 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
>  			 "wakeref.work", &key->work, 0);
> =20
>  #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_WAKEREF)
> -	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wake=
ref", name);
> +	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wake=
ref");
>  #endif
>  }
> =20
> diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
> index ddc5a7b2bd84692bbc1e1ae67674ec2c6857e1ec..5878e7fce712930700054033f=
f5f21547e75224f 100644
> --- a/include/linux/ref_tracker.h
> +++ b/include/linux/ref_tracker.h
> @@ -24,7 +24,6 @@ struct ref_tracker_dir {
>  	struct dentry		*dentry;
>  	struct dentry		*symlink;
>  #endif
> -	char			name[32];
>  #endif
>  };
> =20
> @@ -48,10 +47,21 @@ void ref_tracker_dir_symlink(struct ref_tracker_dir *=
dir, const char *fmt, ...)
> =20
>  #endif /* CONFIG_DEBUG_FS */
> =20
> +/**
> + * ref_tracker_dir_init - initialize a ref_tracker dir
> + * @dir: ref_tracker_dir to be initialized
> + * @quarantine_count: max number of entries to be tracked
> + * @class: pointer to static string that describes object type
> + *
> + * Initialize a ref_tracker_dir. If debugfs is configured, then a file
> + * will also be created for it under the top-level ref_tracker debugfs
> + * directory.
> + *
> + * Note that @class must point to a static string.
> + */
>  static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
>  					unsigned int quarantine_count,
> -					const char *class,
> -					const char *name)
> +					const char *class)
>  {
>  	INIT_LIST_HEAD(&dir->list);
>  	INIT_LIST_HEAD(&dir->quarantine);
> @@ -65,7 +75,6 @@ static inline void ref_tracker_dir_init(struct ref_trac=
ker_dir *dir,
>  	dir->dentry =3D NULL;
>  	dir->symlink =3D NULL;
>  #endif
> -	strscpy(dir->name, name, sizeof(dir->name));
>  	ref_tracker_dir_debugfs(dir);
>  	stack_depot_init();
>  }
> @@ -90,8 +99,7 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
> =20
>  static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
>  					unsigned int quarantine_count,
> -					const char *class,
> -					const char *name)
> +					const char *class)
>  {
>  }
> =20
> diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
> index 5e84e5fd78e147a036d4adb511e657da07866a55..5fb384dd919e1f1ad632eaf59=
5b954118bcfddab 100644
> --- a/lib/ref_tracker.c
> +++ b/lib/ref_tracker.c
> @@ -123,7 +123,7 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *=
dir,
>  	stats =3D ref_tracker_get_stats(dir, display_limit);
>  	if (IS_ERR(stats)) {
>  		pr_ostream(s, "%s%s@%p: couldn't get stats, error %pe\n",
> -			   s->prefix, dir->name, dir, stats);
> +			   s->prefix, dir->class, dir, stats);
>  		return;
>  	}
> =20
> @@ -134,14 +134,14 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir=
 *dir,
>  		if (sbuf && !stack_depot_snprint(stack, sbuf, STACK_BUF_SIZE, 4))
>  			sbuf[0] =3D 0;
>  		pr_ostream(s, "%s%s@%p has %d/%d users at\n%s\n", s->prefix,
> -			   dir->name, dir, stats->stacks[i].count,
> +			   dir->class, dir, stats->stacks[i].count,
>  			   stats->total, sbuf);
>  		skipped -=3D stats->stacks[i].count;
>  	}
> =20
>  	if (skipped)
>  		pr_ostream(s, "%s%s@%p skipped reports about %d/%d users.\n",
> -			   s->prefix, dir->name, dir, skipped, stats->total);
> +			   s->prefix, dir->class, dir, skipped, stats->total);
> =20
>  	kfree(sbuf);
> =20
> diff --git a/lib/test_ref_tracker.c b/lib/test_ref_tracker.c
> index d263502a4c1db248f64a66a468e96c8e4cffab25..b983ceb12afcb84ad60360a1e=
6fec0072e78ef79 100644
> --- a/lib/test_ref_tracker.c
> +++ b/lib/test_ref_tracker.c
> @@ -64,7 +64,7 @@ static int __init test_ref_tracker_init(void)
>  {
>  	int i;
> =20
> -	ref_tracker_dir_init(&ref_dir, 100, "selftest", "selftest");
> +	ref_tracker_dir_init(&ref_dir, 100, "selftest");
> =20
>  	timer_setup(&test_ref_tracker_timer, test_ref_tracker_timer_func, 0);
>  	mod_timer(&test_ref_tracker_timer, jiffies + 1);
> diff --git a/net/core/dev.c b/net/core/dev.c
> index bac9d29486556023cd99f5101b96b052acb9ba70..a062912525ee573504a9cc252=
f71aed22693d24f 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -11713,7 +11713,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_pr=
iv, const char *name,
> =20
>  	dev->priv_len =3D sizeof_priv;
> =20
> -	ref_tracker_dir_init(&dev->refcnt_tracker, 128, "netdev", name);
> +	ref_tracker_dir_init(&dev->refcnt_tracker, 128, "netdev");
>  #ifdef CONFIG_PCPU_DEV_REFCNT
>  	dev->pcpu_refcnt =3D alloc_percpu(int);
>  	if (!dev->pcpu_refcnt)
> diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
> index 39b01af90d240df48827e5c3159c3e2253e0a44d..c03757e39c8a334d307fa1b5c=
c8f03ad3a8df0e0 100644
> --- a/net/core/net_namespace.c
> +++ b/net/core/net_namespace.c
> @@ -403,8 +403,8 @@ static __net_init void preinit_net(struct net *net, s=
truct user_namespace *user_
>  {
>  	refcount_set(&net->passive, 1);
>  	refcount_set(&net->ns.count, 1);
> -	ref_tracker_dir_init(&net->refcnt_tracker, 128, "net_refcnt", "net_refc=
nt");
> -	ref_tracker_dir_init(&net->notrefcnt_tracker, 128, "net_notrefcnt", "ne=
t_notrefcnt");
> +	ref_tracker_dir_init(&net->refcnt_tracker, 128, "net_refcnt");
> +	ref_tracker_dir_init(&net->notrefcnt_tracker, 128, "net_notrefcnt");
> =20
>  	get_random_bytes(&net->hash_mix, sizeof(u32));
>  	net->dev_base_seq =3D 1;

--=20
Jeff Layton <jlayton@kernel.org>
