Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A61B4EC0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 15:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C27B6EC5E;
	Tue, 17 Sep 2019 13:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FBB6EC5E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 13:06:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 06:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,516,1559545200"; 
 d="scan'208,217";a="186141734"
Received: from dbecerri-mobl.ger.corp.intel.com (HELO [10.252.55.72])
 ([10.252.55.72])
 by fmsmga008.fm.intel.com with ESMTP; 17 Sep 2019 06:06:38 -0700
Subject: Re: [PATCH 1/1] drm/syncobj: add sideband payload
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190917110343.32371-1-lionel.g.landwerlin@intel.com>
 <20190917110343.32371-2-lionel.g.landwerlin@intel.com>
 <MWHPR12MB14060F7960E92E46B0CCC63BB48F0@MWHPR12MB1406.namprd12.prod.outlook.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <c7d310e4-7865-6cb3-5730-f896886c7ce5@intel.com>
Date: Tue, 17 Sep 2019 16:06:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <MWHPR12MB14060F7960E92E46B0CCC63BB48F0@MWHPR12MB1406.namprd12.prod.outlook.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: multipart/mixed; boundary="===============0008555214=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0008555214==
Content-Type: multipart/alternative;
 boundary="------------9B228F7AF8F6F6F4F054FF79"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9B228F7AF8F6F6F4F054FF79
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Thanks David,

I'll try to fix the test to match AMD's restrictions.

The v7 here was to fix another existing test : 
dEQP-VK.api.external.fence.sync_fd.transference_temporary

Cheers,

-Lionel

On 17/09/2019 15:36, Zhou, David(ChunMing) wrote:
> Hi Lionel,
> The update looks good to me.
> I tried your signal-order test, seems it isn't ready to run, not sure 
> if I can reproduce your this issue.
>
> -David
> ------------------------------------------------------------------------
> *From:* Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> *Sent:* Tuesday, September 17, 2019 7:03 PM
> *To:* dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
> *Cc:* Lionel Landwerlin <lionel.g.landwerlin@intel.com>; Zhou, 
> David(ChunMing) <David1.Zhou@amd.com>; Koenig, Christian 
> <Christian.Koenig@amd.com>; Jason Ekstrand <jason@jlekstrand.net>
> *Subject:* [PATCH 1/1] drm/syncobj: add sideband payload
> The Vulkan timeline semaphores allow signaling to happen on the point
> of the timeline without all of the its dependencies to be created.
>
> The current 2 implementations (AMD/Intel) of the Vulkan spec on top of
> the Linux kernel are using a thread to wait on the dependencies of a
> given point to materialize and delay actual submission to the kernel
> driver until the wait completes.
>
> If a binary semaphore is submitted for signaling along the side of a
> timeline semaphore waiting for completion that means that the drm
> syncobj associated with that binary semaphore will not have a DMA
> fence associated with it by the time vkQueueSubmit() returns. This and
> the fact that a binary semaphore can be signaled and unsignaled as
> before its DMA fences materialize mean that we cannot just rely on the
> fence within the syncobj but we also need a sideband payload verifying
> that the fence in the syncobj matches the last submission from the
> Vulkan API point of view.
>
> This change adds a sideband payload that is incremented with signaled
> syncobj when vkQueueSubmit() is called. The next vkQueueSubmit()
> waiting on a the syncobj will read the sideband payload and wait for a
> fence chain element with a seqno superior or equal to the sideband
> payload value to be added into the fence chain and use that fence to
> trigger the submission on the kernel driver.
>
> v2: Use a separate ioctl to get/set the sideband value (Christian)
>
> v3: Use 2 ioctls for get/set (Christian)
>
> v4: Use a single new ioctl
>
> v5: a bunch of blattant mistakes
>     Store payload atomically (Chris)
>
> v6: Only touch atomic value once (Jason)
>
> v7: Updated atomic value when importing sync file
>
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Reviewed-by: David Zhou <David1.Zhou@amd.com> (v6)
> Cc: Christian Koenig <Christian.Koenig@amd.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: David(ChunMing) Zhou <David1.Zhou@amd.com>
> ---
>  drivers/gpu/drm/drm_internal.h |  2 ++
>  drivers/gpu/drm/drm_ioctl.c    |  3 ++
>  drivers/gpu/drm/drm_syncobj.c  | 64 ++++++++++++++++++++++++++++++++--
>  include/drm/drm_syncobj.h      |  9 +++++
>  include/uapi/drm/drm.h         | 17 +++++++++
>  5 files changed, 93 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_internal.h 
> b/drivers/gpu/drm/drm_internal.h
> index 51a2055c8f18..e297dfd85019 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -208,6 +208,8 @@ int drm_syncobj_timeline_signal_ioctl(struct 
> drm_device *dev, void *data,
>                                        struct drm_file *file_private);
>  int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>                              struct drm_file *file_private);
> +int drm_syncobj_binary_ioctl(struct drm_device *dev, void *data,
> +                            struct drm_file *file_private);
>
>  /* drm_framebuffer.c */
>  void drm_framebuffer_print_info(struct drm_printer *p, unsigned int 
> indent,
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index f675a3bb2c88..644d0bc800a4 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -703,6 +703,9 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>                        DRM_RENDER_ALLOW),
>          DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY, drm_syncobj_query_ioctl,
>                        DRM_RENDER_ALLOW),
> +       DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_BINARY, drm_syncobj_binary_ioctl,
> +                     DRM_RENDER_ALLOW),
> +
>          DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE, 
> drm_crtc_get_sequence_ioctl, 0),
>          DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE, 
> drm_crtc_queue_sequence_ioctl, 0),
>          DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, 
> drm_mode_create_lease_ioctl, DRM_MASTER),
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 4b5c7b0ed714..2de8f1380890 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -418,8 +418,10 @@ int drm_syncobj_create(struct drm_syncobj 
> **out_syncobj, uint32_t flags,
>          if (flags & DRM_SYNCOBJ_CREATE_SIGNALED)
>                  drm_syncobj_assign_null_handle(syncobj);
>
> -       if (fence)
> +       if (fence) {
>                  drm_syncobj_replace_fence(syncobj, fence);
> + atomic64_set(&syncobj->binary_payload, fence->seqno);
> +       }
>
>          *out_syncobj = syncobj;
>          return 0;
> @@ -604,6 +606,7 @@ static int 
> drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>          }
>
>          drm_syncobj_replace_fence(syncobj, fence);
> +       atomic64_set(&syncobj->binary_payload, fence->seqno);
>          dma_fence_put(fence);
>          drm_syncobj_put(syncobj);
>          return 0;
> @@ -1224,8 +1227,10 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, 
> void *data,
>          if (ret < 0)
>                  return ret;
>
> -       for (i = 0; i < args->count_handles; i++)
> +       for (i = 0; i < args->count_handles; i++) {
>                  drm_syncobj_replace_fence(syncobjs[i], NULL);
> + atomic64_set(&syncobjs[i]->binary_payload, 0);
> +       }
>
>          drm_syncobj_array_free(syncobjs, args->count_handles);
>
> @@ -1395,6 +1400,61 @@ int drm_syncobj_query_ioctl(struct drm_device 
> *dev, void *data,
>                  if (ret)
>                          break;
>          }
> +
> +       drm_syncobj_array_free(syncobjs, args->count_handles);
> +
> +       return ret;
> +}
> +
> +int drm_syncobj_binary_ioctl(struct drm_device *dev, void *data,
> +                            struct drm_file *file_private)
> +{
> +       struct drm_syncobj_binary_array *args = data;
> +       struct drm_syncobj **syncobjs;
> +       u32 __user *access_flags = u64_to_user_ptr(args->access_flags);
> +       u64 __user *values = u64_to_user_ptr(args->values);
> +       u32 i;
> +       int ret;
> +
> +       if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
> +               return -EOPNOTSUPP;
> +
> +       if (args->pad != 0)
> +               return -EINVAL;
> +
> +       if (args->count_handles == 0)
> +               return -EINVAL;
> +
> +       ret = drm_syncobj_array_find(file_private,
> + u64_to_user_ptr(args->handles),
> + args->count_handles,
> +                                    &syncobjs);
> +       if (ret < 0)
> +               return ret;
> +
> +       for (i = 0; i < args->count_handles; i++) {
> +               u32 flags;
> +               u64 value;
> +
> +               if (get_user(flags, &access_flags[i])) {
> +                       ret = -EFAULT;
> +                       break;
> +               }
> +
> +               if (flags & DRM_SYNCOBJ_BINARY_VALUE_INC)
> +                       value = 
> atomic64_inc_return(&syncobjs[i]->binary_payload) - 1;
> +               else if (flags & DRM_SYNCOBJ_BINARY_VALUE_READ)
> +                       value = 
> atomic64_read(&syncobjs[i]->binary_payload);
> +
> +               if (flags & DRM_SYNCOBJ_BINARY_VALUE_READ) {
> +                       if (put_user(value, &values[i])) {
> +                               ret = -EFAULT;
> +                               break;
> +                       }
> +               }
> +
> +       }
> +
>          drm_syncobj_array_free(syncobjs, args->count_handles);
>
>          return ret;
> diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
> index 6cf7243a1dc5..aa76cb3f9107 100644
> --- a/include/drm/drm_syncobj.h
> +++ b/include/drm/drm_syncobj.h
> @@ -61,6 +61,15 @@ struct drm_syncobj {
>           * @file: A file backing for this syncobj.
>           */
>          struct file *file;
> +       /**
> +        * @binary_payload: A 64bit payload for binary syncobjs.
> +        *
> +        * We use the payload value to wait on binary syncobj fences to
> +        * materialize. It is a reservation mechanism for the signaler to
> +        * express that at some point in the future a dma fence with 
> the same
> +        * seqno will be put into the syncobj.
> +        */
> +       atomic64_t binary_payload;
>  };
>
>  void drm_syncobj_free(struct kref *kref);
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 8a5b2f8f8eb9..78a0a413b788 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -785,6 +785,22 @@ struct drm_syncobj_timeline_array {
>          __u32 pad;
>  };
>
> +struct drm_syncobj_binary_array {
> +       /* A pointer to an array of u32 syncobj handles. */
> +       __u64 handles;
> +       /* A pointer to an array of u32 access flags for each handle. */
> +       __u64 access_flags;
> +       /* The binary value of a syncobj is read before it is 
> incremented. */
> +#define DRM_SYNCOBJ_BINARY_VALUE_READ (1u << 0)
> +#define DRM_SYNCOBJ_BINARY_VALUE_INC  (1u << 1)
> +       /* A pointer to an array of u64 values written to by the 
> kernel if the
> +        * handle is flagged for reading.
> +        */
> +       __u64 values;
> +       /* The length of the 3 arrays above. */
> +       __u32 count_handles;
> +       __u32 pad;
> +};
>
>  /* Query current scanout sequence number */
>  struct drm_crtc_get_sequence {
> @@ -946,6 +962,7 @@ extern "C" {
>  #define DRM_IOCTL_SYNCOBJ_QUERY         DRM_IOWR(0xCB, struct 
> drm_syncobj_timeline_array)
>  #define DRM_IOCTL_SYNCOBJ_TRANSFER      DRM_IOWR(0xCC, struct 
> drm_syncobj_transfer)
>  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL DRM_IOWR(0xCD, struct 
> drm_syncobj_timeline_array)
> +#define DRM_IOCTL_SYNCOBJ_BINARY       DRM_IOWR(0xCE, struct 
> drm_syncobj_binary_array)
>
>  /**
>   * Device specific ioctls should only be in their respective headers
> -- 
> 2.23.0
>


--------------9B228F7AF8F6F6F4F054FF79
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Thanks David,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I'll try to fix the test to match AMD's
      restrictions.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">The v7 here was to fix another existing
      test : dEQP-VK.api.external.fence.sync_fd.transference_temporary</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Cheers,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">-Lionel<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 17/09/2019 15:36, Zhou,
      David(ChunMing) wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:MWHPR12MB14060F7960E92E46B0CCC63BB48F0@MWHPR12MB1406.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Hi Lionel,</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        The update looks good to me.</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        I tried your signal-order test, seems it isn't ready to run, not
        sure if I can reproduce your this issue.</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        -David</div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
          face="Calibri, sans-serif" color="#000000"><b>From:</b> Lionel
          Landwerlin <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com">&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
          <b>Sent:</b> Tuesday, September 17, 2019 7:03 PM<br>
          <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a><br>
          <b>Cc:</b> Lionel Landwerlin
          <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com">&lt;lionel.g.landwerlin@intel.com&gt;</a>; Zhou, David(ChunMing)
          <a class="moz-txt-link-rfc2396E" href="mailto:David1.Zhou@amd.com">&lt;David1.Zhou@amd.com&gt;</a>; Koenig, Christian
          <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; Jason Ekstrand
          <a class="moz-txt-link-rfc2396E" href="mailto:jason@jlekstrand.net">&lt;jason@jlekstrand.net&gt;</a><br>
          <b>Subject:</b> [PATCH 1/1] drm/syncobj: add sideband payload</font>
        <div> </div>
      </div>
      <div class="BodyFragment"><font size="2"><span
            style="font-size:11pt;">
            <div class="PlainText">The Vulkan timeline semaphores allow
              signaling to happen on the point<br>
              of the timeline without all of the its dependencies to be
              created.<br>
              <br>
              The current 2 implementations (AMD/Intel) of the Vulkan
              spec on top of<br>
              the Linux kernel are using a thread to wait on the
              dependencies of a<br>
              given point to materialize and delay actual submission to
              the kernel<br>
              driver until the wait completes.<br>
              <br>
              If a binary semaphore is submitted for signaling along the
              side of a<br>
              timeline semaphore waiting for completion that means that
              the drm<br>
              syncobj associated with that binary semaphore will not
              have a DMA<br>
              fence associated with it by the time vkQueueSubmit()
              returns. This and<br>
              the fact that a binary semaphore can be signaled and
              unsignaled as<br>
              before its DMA fences materialize mean that we cannot just
              rely on the<br>
              fence within the syncobj but we also need a sideband
              payload verifying<br>
              that the fence in the syncobj matches the last submission
              from the<br>
              Vulkan API point of view.<br>
              <br>
              This change adds a sideband payload that is incremented
              with signaled<br>
              syncobj when vkQueueSubmit() is called. The next
              vkQueueSubmit()<br>
              waiting on a the syncobj will read the sideband payload
              and wait for a<br>
              fence chain element with a seqno superior or equal to the
              sideband<br>
              payload value to be added into the fence chain and use
              that fence to<br>
              trigger the submission on the kernel driver.<br>
              <br>
              v2: Use a separate ioctl to get/set the sideband value
              (Christian)<br>
              <br>
              v3: Use 2 ioctls for get/set (Christian)<br>
              <br>
              v4: Use a single new ioctl<br>
              <br>
              v5: a bunch of blattant mistakes<br>
                  Store payload atomically (Chris)<br>
              <br>
              v6: Only touch atomic value once (Jason)<br>
              <br>
              v7: Updated atomic value when importing sync file<br>
              <br>
              Signed-off-by: Lionel Landwerlin
              <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com">&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
              Reviewed-by: David Zhou <a class="moz-txt-link-rfc2396E" href="mailto:David1.Zhou@amd.com">&lt;David1.Zhou@amd.com&gt;</a> (v6)<br>
              Cc: Christian Koenig <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a><br>
              Cc: Jason Ekstrand <a class="moz-txt-link-rfc2396E" href="mailto:jason@jlekstrand.net">&lt;jason@jlekstrand.net&gt;</a><br>
              Cc: David(ChunMing) Zhou <a class="moz-txt-link-rfc2396E" href="mailto:David1.Zhou@amd.com">&lt;David1.Zhou@amd.com&gt;</a><br>
              ---<br>
               drivers/gpu/drm/drm_internal.h |  2 ++<br>
               drivers/gpu/drm/drm_ioctl.c    |  3 ++<br>
               drivers/gpu/drm/drm_syncobj.c  | 64
              ++++++++++++++++++++++++++++++++--<br>
               include/drm/drm_syncobj.h      |  9 +++++<br>
               include/uapi/drm/drm.h         | 17 +++++++++<br>
               5 files changed, 93 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/drivers/gpu/drm/drm_internal.h
              b/drivers/gpu/drm/drm_internal.h<br>
              index 51a2055c8f18..e297dfd85019 100644<br>
              --- a/drivers/gpu/drm/drm_internal.h<br>
              +++ b/drivers/gpu/drm/drm_internal.h<br>
              @@ -208,6 +208,8 @@ int
              drm_syncobj_timeline_signal_ioctl(struct drm_device *dev,
              void *data,<br>
                                                     struct drm_file
              *file_private);<br>
               int drm_syncobj_query_ioctl(struct drm_device *dev, void
              *data,<br>
                                           struct drm_file
              *file_private);<br>
              +int drm_syncobj_binary_ioctl(struct drm_device *dev, void
              *data,<br>
              +                            struct drm_file
              *file_private);<br>
               <br>
               /* drm_framebuffer.c */<br>
               void drm_framebuffer_print_info(struct drm_printer *p,
              unsigned int indent,<br>
              diff --git a/drivers/gpu/drm/drm_ioctl.c
              b/drivers/gpu/drm/drm_ioctl.c<br>
              index f675a3bb2c88..644d0bc800a4 100644<br>
              --- a/drivers/gpu/drm/drm_ioctl.c<br>
              +++ b/drivers/gpu/drm/drm_ioctl.c<br>
              @@ -703,6 +703,9 @@ static const struct drm_ioctl_desc
              drm_ioctls[] = {<br>
                                     DRM_RENDER_ALLOW),<br>
                       DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY,
              drm_syncobj_query_ioctl,<br>
                                     DRM_RENDER_ALLOW),<br>
              +       DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_BINARY,
              drm_syncobj_binary_ioctl,<br>
              +                     DRM_RENDER_ALLOW),<br>
              +<br>
                       DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE,
              drm_crtc_get_sequence_ioctl, 0),<br>
                       DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE,
              drm_crtc_queue_sequence_ioctl, 0),<br>
                       DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE,
              drm_mode_create_lease_ioctl, DRM_MASTER),<br>
              diff --git a/drivers/gpu/drm/drm_syncobj.c
              b/drivers/gpu/drm/drm_syncobj.c<br>
              index 4b5c7b0ed714..2de8f1380890 100644<br>
              --- a/drivers/gpu/drm/drm_syncobj.c<br>
              +++ b/drivers/gpu/drm/drm_syncobj.c<br>
              @@ -418,8 +418,10 @@ int drm_syncobj_create(struct
              drm_syncobj **out_syncobj, uint32_t flags,<br>
                       if (flags &amp; DRM_SYNCOBJ_CREATE_SIGNALED)<br>
                               drm_syncobj_assign_null_handle(syncobj);<br>
               <br>
              -       if (fence)<br>
              +       if (fence) {<br>
                               drm_syncobj_replace_fence(syncobj,
              fence);<br>
              +              
              atomic64_set(&amp;syncobj-&gt;binary_payload,
              fence-&gt;seqno);<br>
              +       }<br>
               <br>
                       *out_syncobj = syncobj;<br>
                       return 0;<br>
              @@ -604,6 +606,7 @@ static int
              drm_syncobj_import_sync_file_fence(struct drm_file
              *file_private,<br>
                       }<br>
               <br>
                       drm_syncobj_replace_fence(syncobj, fence);<br>
              +       atomic64_set(&amp;syncobj-&gt;binary_payload,
              fence-&gt;seqno);<br>
                       dma_fence_put(fence);<br>
                       drm_syncobj_put(syncobj);<br>
                       return 0;<br>
              @@ -1224,8 +1227,10 @@ drm_syncobj_reset_ioctl(struct
              drm_device *dev, void *data,<br>
                       if (ret &lt; 0)<br>
                               return ret;<br>
               <br>
              -       for (i = 0; i &lt; args-&gt;count_handles; i++)<br>
              +       for (i = 0; i &lt; args-&gt;count_handles; i++) {<br>
                               drm_syncobj_replace_fence(syncobjs[i],
              NULL);<br>
              +              
              atomic64_set(&amp;syncobjs[i]-&gt;binary_payload, 0);<br>
              +       }<br>
               <br>
                       drm_syncobj_array_free(syncobjs,
              args-&gt;count_handles);<br>
               <br>
              @@ -1395,6 +1400,61 @@ int drm_syncobj_query_ioctl(struct
              drm_device *dev, void *data,<br>
                               if (ret)<br>
                                       break;<br>
                       }<br>
              +<br>
              +       drm_syncobj_array_free(syncobjs,
              args-&gt;count_handles);<br>
              +<br>
              +       return ret;<br>
              +}<br>
              +<br>
              +int drm_syncobj_binary_ioctl(struct drm_device *dev, void
              *data,<br>
              +                            struct drm_file
              *file_private)<br>
              +{<br>
              +       struct drm_syncobj_binary_array *args = data;<br>
              +       struct drm_syncobj **syncobjs;<br>
              +       u32 __user *access_flags =
              u64_to_user_ptr(args-&gt;access_flags);<br>
              +       u64 __user *values =
              u64_to_user_ptr(args-&gt;values);<br>
              +       u32 i;<br>
              +       int ret;<br>
              +<br>
              +       if (!drm_core_check_feature(dev,
              DRIVER_SYNCOBJ_TIMELINE))<br>
              +               return -EOPNOTSUPP;<br>
              +<br>
              +       if (args-&gt;pad != 0)<br>
              +               return -EINVAL;<br>
              +<br>
              +       if (args-&gt;count_handles == 0)<br>
              +               return -EINVAL;<br>
              +<br>
              +       ret = drm_syncobj_array_find(file_private,<br>
              +                                   
              u64_to_user_ptr(args-&gt;handles),<br>
              +                                   
              args-&gt;count_handles,<br>
              +                                    &amp;syncobjs);<br>
              +       if (ret &lt; 0)<br>
              +               return ret;<br>
              +<br>
              +       for (i = 0; i &lt; args-&gt;count_handles; i++) {<br>
              +               u32 flags;<br>
              +               u64 value;<br>
              +<br>
              +               if (get_user(flags, &amp;access_flags[i]))
              {<br>
              +                       ret = -EFAULT;<br>
              +                       break;<br>
              +               }<br>
              +<br>
              +               if (flags &amp;
              DRM_SYNCOBJ_BINARY_VALUE_INC)<br>
              +                       value =
              atomic64_inc_return(&amp;syncobjs[i]-&gt;binary_payload) -
              1;<br>
              +               else if (flags &amp;
              DRM_SYNCOBJ_BINARY_VALUE_READ)<br>
              +                       value =
              atomic64_read(&amp;syncobjs[i]-&gt;binary_payload);<br>
              +<br>
              +               if (flags &amp;
              DRM_SYNCOBJ_BINARY_VALUE_READ) {<br>
              +                       if (put_user(value,
              &amp;values[i])) {<br>
              +                               ret = -EFAULT;<br>
              +                               break;<br>
              +                       }<br>
              +               }<br>
              +<br>
              +       }<br>
              +<br>
                       drm_syncobj_array_free(syncobjs,
              args-&gt;count_handles);<br>
               <br>
                       return ret;<br>
              diff --git a/include/drm/drm_syncobj.h
              b/include/drm/drm_syncobj.h<br>
              index 6cf7243a1dc5..aa76cb3f9107 100644<br>
              --- a/include/drm/drm_syncobj.h<br>
              +++ b/include/drm/drm_syncobj.h<br>
              @@ -61,6 +61,15 @@ struct drm_syncobj {<br>
                        * @file: A file backing for this syncobj.<br>
                        */<br>
                       struct file *file;<br>
              +       /**<br>
              +        * @binary_payload: A 64bit payload for binary
              syncobjs.<br>
              +        *<br>
              +        * We use the payload value to wait on binary
              syncobj fences to<br>
              +        * materialize. It is a reservation mechanism for
              the signaler to<br>
              +        * express that at some point in the future a dma
              fence with the same<br>
              +        * seqno will be put into the syncobj.<br>
              +        */<br>
              +       atomic64_t binary_payload;<br>
               };<br>
               <br>
               void drm_syncobj_free(struct kref *kref);<br>
              diff --git a/include/uapi/drm/drm.h
              b/include/uapi/drm/drm.h<br>
              index 8a5b2f8f8eb9..78a0a413b788 100644<br>
              --- a/include/uapi/drm/drm.h<br>
              +++ b/include/uapi/drm/drm.h<br>
              @@ -785,6 +785,22 @@ struct drm_syncobj_timeline_array {<br>
                       __u32 pad;<br>
               };<br>
               <br>
              +struct drm_syncobj_binary_array {<br>
              +       /* A pointer to an array of u32 syncobj handles.
              */<br>
              +       __u64 handles;<br>
              +       /* A pointer to an array of u32 access flags for
              each handle. */<br>
              +       __u64 access_flags;<br>
              +       /* The binary value of a syncobj is read before it
              is incremented. */<br>
              +#define DRM_SYNCOBJ_BINARY_VALUE_READ (1u &lt;&lt; 0)<br>
              +#define DRM_SYNCOBJ_BINARY_VALUE_INC  (1u &lt;&lt; 1)<br>
              +       /* A pointer to an array of u64 values written to
              by the kernel if the<br>
              +        * handle is flagged for reading.<br>
              +        */<br>
              +       __u64 values;<br>
              +       /* The length of the 3 arrays above. */<br>
              +       __u32 count_handles;<br>
              +       __u32 pad;<br>
              +};<br>
               <br>
               /* Query current scanout sequence number */<br>
               struct drm_crtc_get_sequence {<br>
              @@ -946,6 +962,7 @@ extern "C" {<br>
               #define DRM_IOCTL_SYNCOBJ_QUERY         DRM_IOWR(0xCB,
              struct drm_syncobj_timeline_array)<br>
               #define DRM_IOCTL_SYNCOBJ_TRANSFER      DRM_IOWR(0xCC,
              struct drm_syncobj_transfer)<br>
               #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL      
              DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)<br>
              +#define DRM_IOCTL_SYNCOBJ_BINARY       DRM_IOWR(0xCE,
              struct drm_syncobj_binary_array)<br>
               <br>
               /**<br>
                * Device specific ioctls should only be in their
              respective headers<br>
              -- <br>
              2.23.0<br>
              <br>
            </div>
          </span></font></div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------9B228F7AF8F6F6F4F054FF79--

--===============0008555214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0008555214==--
