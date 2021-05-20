Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5B738B570
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 19:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087366F4C3;
	Thu, 20 May 2021 17:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7B46E426
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 17:47:44 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id v22so17193661oic.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZK4C1ZMjA5KMUn9fV16l158Em1297An8k5K5kzPQ0+8=;
 b=bmdDOvXrNsV/G8wepvFct/wt2MCTFHJ6w+egGRgK7qvlvVD2mseMBW+YvPoyaVG6gW
 Z3LrG88NA7+R03gWpSyMRX6UR6tDAyE+ZNeSrmN3GHX95c4P/idFVKEYIPhXaxil48i8
 kRgbA8FaqetC1S6Yx+GqLW7JRwqs6C2W4P7u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZK4C1ZMjA5KMUn9fV16l158Em1297An8k5K5kzPQ0+8=;
 b=gw+0cDoK+CIVMBzSnThwn7/BUV9/j7ERwqB73mCYsv4nS8yYH9gwKzarlNzBU9i/8Z
 +oucX7Ldl+vcqM0b9NfkXDlLtivB2lPEEwxcnub68h1d8L75d2K0uukoB7iCjjNQjdeH
 +o1KK30A3uSSXzaJ9lO8BjboaVdW79hVlD3Xs9UL1KLrao8/WBQSZimPC+CExj/UPVLk
 DIru4H3xrCRdkEnuc9RYtb8h5o0Wljc8peao88aPkwTcW86yTk0NwG4O3T+zEA3iQETu
 2iSxjmLEhKFARSvGk9CeRDgDaKgUEmD7xV+xHu0TtLjez3z+5v5tH1Q4+CnW9d6lJYUx
 juYA==
X-Gm-Message-State: AOAM530zBoCaH6XbQ3amRApHV/mVHiqjk8Kq5RjP8N07LW+hzAxNznft
 tf7Eznel1VVylHOWKB42ub+/Zpwi8cw4t91jGcre1w==
X-Google-Smtp-Source: ABdhPJyqct35jkUxZkKBcvnaFDKBSNvfsCP7nDv6Jf9Sojv55TTu5SDFJdEbiy6Mb1IccOnTSasaGqN9xldb8/RvZ+A=
X-Received: by 2002:aca:f4c5:: with SMTP id s188mr1869236oih.128.1621532864171; 
 Thu, 20 May 2021 10:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210520151254.959958-1-tvrtko.ursulin@linux.intel.com>
 <20210520151254.959958-8-tvrtko.ursulin@linux.intel.com>
 <BYAPR12MB28401B22CACDC249926C0A19F42A9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <38a6d339-bca5-13f0-1cc8-db96f1b587bb@amd.com>
In-Reply-To: <38a6d339-bca5-13f0-1cc8-db96f1b587bb@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 20 May 2021 19:47:32 +0200
Message-ID: <CAKMK7uEKwWhfMDrBUh394U99bXipHrAb+YUCOryOV-FU4k07Eg@mail.gmail.com>
Subject: Re: [RFC 7/7] drm/i915: Expose client engine utilisation via fdinfo
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Nieto,
 David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 6:31 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Yeah, having the timestamp is a good idea as well.
>
>   drm-driver: i915
>
> I think we should rather add something like printing file_operations->own=
er->name to the common fdinfo code.
>
> This way we would have something common for all drivers in the system. I'=
m just not sure if that also works if they are compiled into the kernel.

Yeah common code could print driver name, busid and all that stuff. I
think the common code should also provide some helpers for the key:
value pair formatting (and maybe check for all lower-case and stuff
like that) because if we don't then this is going to be a complete
mess that's not parseable.

And value should be real semantic stuff, not "here's a string". So
accumulated time as a struct ktime as the example.
-Daniel

> Regards,
> Christian.
>
> Am 20.05.21 um 18:26 schrieb Nieto, David M:
>
> [AMD Official Use Only]
>
>
> i would like to add a unit marker for the stats that we monitor in the fd=
, as we discussed currently we are displaying the usage percentage, because=
 we wanted to to provide single query percentages, but this may evolve with=
 time.
>
> May I suggest to add two new fields
>
> drm-stat-interval: <64 bit> ns
> drm-stat-timestamp: <64 bit> ns
>
> If interval is set, engine utilization is calculated by doing <perc rende=
r> =3D 100*<drm_engine_render>/<drm_stat_interval>
> if interval is not set, two reads are needed : <perc render> =3D 100*<drm=
_engine_render1 - drm_engine_render0> / <drm-stat-timestamp1 - drm-stat-tim=
estamp0>
>
>
> Regards,
>
> David
>
>
> ________________________________
> From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Sent: Thursday, May 20, 2021 8:12 AM
> To: Intel-gfx@lists.freedesktop.org <Intel-gfx@lists.freedesktop.org>
> Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; Tv=
rtko Ursulin <tvrtko.ursulin@intel.com>; Nieto, David M <David.Nieto@amd.co=
m>; Koenig, Christian <Christian.Koenig@amd.com>; Daniel Vetter <daniel@ffw=
ll.ch>
> Subject: [RFC 7/7] drm/i915: Expose client engine utilisation via fdinfo
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Similar to AMD commit
> 874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
> infrastructure added in previous patches, we add basic client info
> and GPU engine utilisation for i915.
>
> Example of the output:
>
>   pos:    0
>   flags:  0100002
>   mnt_id: 21
>   drm-driver: i915
>   drm-pdev:   0000:00:02.0
>   drm-client-id:      7
>   drm-engine-render:  9288864723 ns
>   drm-engine-copy:    2035071108 ns
>   drm-engine-video:   0 ns
>   drm-engine-video-enhance:   0 ns
>
> DRM related fields are appropriately prefixed for easy parsing and
> separation from generic fdinfo fields.
>
> Idea is for some fields to become either fully or partially standardised
> in order to enable writting of generic top-like tools.
>
> Initial proposal for fully standardised common fields:
>
>  drm-driver: <str>
>  drm-pdev: <aaaa:bb.cc.d>
>
> Optional fully standardised:
>
>  drm-client-id: <uint>
>
> Optional partially standardised:
>
>  engine-<str>: <u64> ns
>  memory-<str>: <u64> KiB
>
> Once agreed the format would need to go to some README or kerneldoc in
> DRM core.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: David M Nieto <David.Nieto@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/i915/i915_drm_client.c | 68 ++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_drm_client.h |  4 ++
>  drivers/gpu/drm/i915/i915_drv.c        |  3 ++
>  3 files changed, 75 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i91=
5/i915_drm_client.c
> index 1e5db7753276..5e9cfba1116b 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -9,6 +9,11 @@
>
>  #include <drm/drm_print.h>
>
> +#include <uapi/drm/i915_drm.h>
> +
> +#include "gem/i915_gem_context.h"
> +#include "gt/intel_engine_user.h"
> +
>  #include "i915_drm_client.h"
>  #include "i915_drv.h"
>  #include "i915_gem.h"
> @@ -168,3 +173,66 @@ void i915_drm_clients_fini(struct i915_drm_clients *=
clients)
>
>          xa_destroy(&clients->xarray);
>  }
> +
> +#ifdef CONFIG_PROC_FS
> +static const char * const uabi_class_names[] =3D {
> +       [I915_ENGINE_CLASS_RENDER] =3D "render",
> +       [I915_ENGINE_CLASS_COPY] =3D "copy",
> +       [I915_ENGINE_CLASS_VIDEO] =3D "video",
> +       [I915_ENGINE_CLASS_VIDEO_ENHANCE] =3D "video-enhance",
> +};
> +
> +static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
> +{
> +       struct i915_gem_engines_iter it;
> +       struct intel_context *ce;
> +       u64 total =3D 0;
> +
> +       for_each_gem_engine(ce, rcu_dereference(ctx->engines), it) {
> +               if (ce->engine->uabi_class !=3D class)
> +                       continue;
> +
> +               total +=3D intel_context_get_total_runtime_ns(ce);
> +       }
> +
> +       return total;
> +}
> +
> +static void
> +show_client_class(struct seq_file *m,
> +                 struct i915_drm_client *client,
> +                 unsigned int class)
> +{
> +       const struct list_head *list =3D &client->ctx_list;
> +       u64 total =3D atomic64_read(&client->past_runtime[class]);
> +       struct i915_gem_context *ctx;
> +
> +       rcu_read_lock();
> +       list_for_each_entry_rcu(ctx, list, client_link)
> +               total +=3D busy_add(ctx, class);
> +       rcu_read_unlock();
> +
> +       return seq_printf(m, "drm-engine-%s:\t%llu ns\n",
> +                         uabi_class_names[class], total);
> +}
> +
> +void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
> +{
> +       struct drm_file *file =3D f->private_data;
> +       struct drm_i915_file_private *file_priv =3D file->driver_priv;
> +       struct drm_i915_private *i915 =3D file_priv->dev_priv;
> +       struct i915_drm_client *client =3D file_priv->client;
> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
> +       unsigned int i;
> +
> +       seq_printf(m, "drm-driver:\ti915\n");
> +       seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n",
> +                  pci_domain_nr(pdev->bus), pdev->bus->number,
> +                  PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> +
> +       seq_printf(m, "drm-client-id:\t%u\n", client->id);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(uabi_class_names); i++)
> +               show_client_class(m, client, i);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i91=
5/i915_drm_client.h
> index b2b69d6985e4..9885002433a0 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.h
> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> @@ -98,6 +98,10 @@ i915_drm_client_pid(const struct i915_drm_client *clie=
nt)
>          return __i915_drm_client_name(client)->pid;
>  }
>
> +#ifdef CONFIG_PROC_FS
> +void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);
> +#endif
> +
>  void i915_drm_clients_fini(struct i915_drm_clients *clients);
>
>  #endif /* !__I915_DRM_CLIENT_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_=
drv.c
> index 33eb7b52b58b..6b63fe4b3c26 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1694,6 +1694,9 @@ static const struct file_operations i915_driver_fop=
s =3D {
>          .read =3D drm_read,
>          .compat_ioctl =3D i915_ioc32_compat_ioctl,
>          .llseek =3D noop_llseek,
> +#ifdef CONFIG_PROC_FS
> +       .show_fdinfo =3D i915_drm_client_fdinfo,
> +#endif
>  };
>
>  static int
> --
> 2.30.2
>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
