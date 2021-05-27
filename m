Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BB53936D0
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 22:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FE16F4A0;
	Thu, 27 May 2021 20:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35B06F4A0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 20:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622146144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gven4DNzXDHZWwEIHAw8XKW/dTw74KvOaaQgqHIIG+0=;
 b=OSihas/5L9MnaU/CH9PY8fH+y2t4h7qad8lggX7Zp/6yCgH6c6m+yE80QXacCjGFnbfy1m
 ZqKWSPkayT3j3+bZ6GtUbZUpSJXzdYKA0ajutjGUqvJAnFKwcvsHALj5TjUuZA++JCIipY
 yYXB+9/u3SBKOjCsp/d6zDVE8NdroqY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-m5KIf7U8PJ-aYn_kxnxjcA-1; Thu, 27 May 2021 16:09:01 -0400
X-MC-Unique: m5KIf7U8PJ-aYn_kxnxjcA-1
Received: by mail-qk1-f197.google.com with SMTP id
 a24-20020a05620a1038b02902fa6ba180ffso1361389qkk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 13:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Gven4DNzXDHZWwEIHAw8XKW/dTw74KvOaaQgqHIIG+0=;
 b=MJqGJPe0Hp1YwWpoHoKaiq/b45G+YlX9QPUCk2BCmlvbWM2A0RQ2CWucVr864KzMYO
 KyvSndrlqs1cU7DgAI479OUG4N3/xE1vwi0/Mig/r8KxB5XNVRyareTan7Rckjl85FDz
 qYg0ePYqMKBm4L4XCei8MEV1dvUd1iF53MjIoNpaiUUPohnAWkc5ZJWoOOdkooWYIuWe
 LE/3i1sUyr1PCiaTV83OVSVL8IJHbOqWFRiH+0QqkVsKPlJRwPTTqfQHMGG566hBUzMH
 gAMXDA2t7S1qQ2JqvdvMmzgeeHouB8ykrGPkEIPO6DgclY1qz99TXn/ccgGRGYYvbmdG
 4bIw==
X-Gm-Message-State: AOAM5324AaUieA+5pDVemUsvcz5YZNRICJgnqkjXrSD0nzLEtsIL3G3V
 0zSToAFoAHlTjv8la0YtEpcH5tlYkYr4L6DpM/eT/V4nkoRM7w66xvtIekoGD+GD3+lWR2bZAlT
 c9J6uuX3huD6tkjSUHq9fybbEoH5F
X-Received: by 2002:ac8:1342:: with SMTP id f2mr309265qtj.148.1622146141099;
 Thu, 27 May 2021 13:09:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp3Eb7A8C428VW1501ChqGyNC9OZRRGWaFj6UEskhSgcaM7Ol+ynrOt44Wcwjsv9JED/AOcg==
X-Received: by 2002:ac8:1342:: with SMTP id f2mr309235qtj.148.1622146140772;
 Thu, 27 May 2021 13:09:00 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 2sm2211639qtr.64.2021.05.27.13.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 13:09:00 -0700 (PDT)
Message-ID: <0a5fc2cdf531af56cc59b905bb4b107b1c2840f4.camel@redhat.com>
Subject: Re: [PATCH v5 1/3] drm/dp_mst: Add self-tests for up requests
From: Lyude Paul <lyude@redhat.com>
To: Sam McNally <sammc@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Date: Thu, 27 May 2021 16:08:58 -0400
In-Reply-To: <20210525105913.v5.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
References: <20210525105913.v5.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Anshuman Gupta <anshuman.gupta@intel.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-05-25 at 10:59 +1000, Sam McNally wrote:
> Up requests are decoded by drm_dp_sideband_parse_req(), which operates
> on a drm_dp_sideband_msg_rx, unlike down requests. Expand the existing
> self-test helper sideband_msg_req_encode_decode() to copy the message
> contents and length from a drm_dp_sideband_msg_tx to
> drm_dp_sideband_msg_rx and use the parse function under test in place of
> decode. Add an additional helper for testing clearly-invalid up
> messages, verifying that parse rejects them.
> 
> Add support for currently-supported up requests to
> drm_dp_dump_sideband_msg_req_body(); add support to
> drm_dp_encode_sideband_req() to allow encoding for the self-tests.
> 
> Add self-tests for CONNECTION_STATUS_NOTIFY and RESOURCE_STATUS_NOTIFY.
> 
> Signed-off-by: Sam McNally <sammc@chromium.org>
> ---
> 
> Changes in v5:
> - Set mock device name to more clearly attribute error/debug logging to
>   the self-test, in particular for cases where failures are expected
> 
> Changes in v4:
> - New in v4
> 
>  drivers/gpu/drm/drm_dp_mst_topology.c         |  54 ++++++-
>  .../gpu/drm/drm_dp_mst_topology_internal.h    |   4 +
>  .../drm/selftests/test-drm_dp_mst_helper.c    | 149 ++++++++++++++++--
>  3 files changed, 192 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 54604633e65c..573f39a3dc16 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -442,6 +442,37 @@ drm_dp_encode_sideband_req(const struct
> drm_dp_sideband_msg_req_body *req,
>                 idx++;
>                 }
>                 break;
> +       case DP_CONNECTION_STATUS_NOTIFY: {
> +               const struct drm_dp_connection_status_notify *msg;
> +
> +               msg = &req->u.conn_stat;
> +               buf[idx] = (msg->port_number & 0xf) << 4;
> +               idx++;
> +               memcpy(&raw->msg[idx], msg->guid, 16);
> +               idx += 16;
> +               raw->msg[idx] = 0;
> +               raw->msg[idx] |= msg->legacy_device_plug_status ? BIT(6) :
> 0;
> +               raw->msg[idx] |= msg->displayport_device_plug_status ?
> BIT(5) : 0;
> +               raw->msg[idx] |= msg->message_capability_status ? BIT(4) :
> 0;
> +               raw->msg[idx] |= msg->input_port ? BIT(3) : 0;
> +               raw->msg[idx] |= FIELD_PREP(GENMASK(2, 0), msg-
> >peer_device_type);
> +               idx++;
> +               break;
> +       }
> +       case DP_RESOURCE_STATUS_NOTIFY: {
> +               const struct drm_dp_resource_status_notify *msg;
> +
> +               msg = &req->u.resource_stat;
> +               buf[idx] = (msg->port_number & 0xf) << 4;
> +               idx++;
> +               memcpy(&raw->msg[idx], msg->guid, 16);
> +               idx += 16;
> +               buf[idx] = (msg->available_pbn & 0xff00) >> 8;
> +               idx++;
> +               buf[idx] = (msg->available_pbn & 0xff);
> +               idx++;
> +               break;
> +       }
>         }
>         raw->cur_len = idx;
>  }
> @@ -672,6 +703,22 @@ drm_dp_dump_sideband_msg_req_body(const struct
> drm_dp_sideband_msg_req_body *req
>                   req->u.enc_status.stream_behavior,
>                   req->u.enc_status.valid_stream_behavior);
>                 break;
> +       case DP_CONNECTION_STATUS_NOTIFY:
> +               P("port=%d guid=%*ph legacy=%d displayport=%d messaging=%d
> input=%d peer_type=%d",
> +                 req->u.conn_stat.port_number,
> +                 (int)ARRAY_SIZE(req->u.conn_stat.guid), req-
> >u.conn_stat.guid,
> +                 req->u.conn_stat.legacy_device_plug_status,
> +                 req->u.conn_stat.displayport_device_plug_status,
> +                 req->u.conn_stat.message_capability_status,
> +                 req->u.conn_stat.input_port,
> +                 req->u.conn_stat.peer_device_type);
> +               break;
> +       case DP_RESOURCE_STATUS_NOTIFY:
> +               P("port=%d guid=%*ph pbn=%d",
> +                 req->u.resource_stat.port_number,
> +                 (int)ARRAY_SIZE(req->u.resource_stat.guid), req-
> >u.resource_stat.guid,
> +                 req->u.resource_stat.available_pbn);
> +               break;
>         default:
>                 P("???\n");
>                 break;
> @@ -1116,9 +1163,9 @@ static bool
> drm_dp_sideband_parse_resource_status_notify(const struct drm_dp_mst
>         return false;
>  }
>  
> -static bool drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr
> *mgr,
> -                                     struct drm_dp_sideband_msg_rx *raw,
> -                                     struct drm_dp_sideband_msg_req_body
> *msg)
> +bool drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
> +                              struct drm_dp_sideband_msg_rx *raw,
> +                              struct drm_dp_sideband_msg_req_body *msg)
>  {
>         memset(msg, 0, sizeof(*msg));
>         msg->req_type = (raw->msg[0] & 0x7f);
> @@ -1134,6 +1181,7 @@ static bool drm_dp_sideband_parse_req(const struct
> drm_dp_mst_topology_mgr *mgr,
>                 return false;
>         }
>  }
> +EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_dp_sideband_parse_req);
>  
>  static void build_dpcd_write(struct drm_dp_sideband_msg_tx *msg,
>                              u8 port_num, u32 offset, u8 num_bytes, u8
> *bytes)
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology_internal.h
> b/drivers/gpu/drm/drm_dp_mst_topology_internal.h
> index eeda9a61c657..0356a2e0dba1 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology_internal.h
> +++ b/drivers/gpu/drm/drm_dp_mst_topology_internal.h
> @@ -21,4 +21,8 @@ void
>  drm_dp_dump_sideband_msg_req_body(const struct drm_dp_sideband_msg_req_body
> *req,
>                                   int indent, struct drm_printer *printer);
>  
> +bool
> +drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
> +                         struct drm_dp_sideband_msg_rx *raw,
> +                         struct drm_dp_sideband_msg_req_body *msg);
>  #endif /* !_DRM_DP_MST_HELPER_INTERNAL_H_ */
> diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> index 6b4759ed6bfd..7bbeb1e5bc97 100644
> --- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> @@ -13,6 +13,10 @@
>  #include "../drm_dp_mst_topology_internal.h"
>  #include "test-drm_modeset_common.h"
>  
> +static void mock_release(struct device *dev)
> +{
> +}
> +
>  int igt_dp_mst_calc_pbn_mode(void *ignored)
>  {
>         int pbn, i;
> @@ -120,27 +124,60 @@ sideband_msg_req_equal(const struct
> drm_dp_sideband_msg_req_body *in,
>  static bool
>  sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
>  {
> -       struct drm_dp_sideband_msg_req_body *out;
> +       struct drm_dp_sideband_msg_req_body *out = NULL;
>         struct drm_printer p = drm_err_printer(PREFIX_STR);
> -       struct drm_dp_sideband_msg_tx *txmsg;
> +       struct drm_dp_sideband_msg_tx *txmsg = NULL;
> +       struct drm_dp_sideband_msg_rx *rxmsg = NULL;
> +       struct drm_dp_mst_topology_mgr *mgr = NULL;
>         int i, ret;
> -       bool result = true;
> +       bool result = false;
>  
>         out = kzalloc(sizeof(*out), GFP_KERNEL);
>         if (!out)
> -               return false;
> +               goto out;
>  
>         txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
>         if (!txmsg)
> -               return false;
> +               goto out;
>  
> -       drm_dp_encode_sideband_req(in, txmsg);
> -       ret = drm_dp_decode_sideband_req(txmsg, out);
> -       if (ret < 0) {
> -               drm_printf(&p, "Failed to decode sideband request: %d\n",
> -                          ret);
> -               result = false;
> +       rxmsg = kzalloc(sizeof(*rxmsg), GFP_KERNEL);
> +       if (!rxmsg)
>                 goto out;
> +
> +       mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
> +       if (!mgr)
> +               goto out;
> +
> +       mgr->dev = kzalloc(sizeof(*mgr->dev), GFP_KERNEL);
> +       if (!mgr->dev)
> +               goto out;
> +
> +       mgr->dev->dev = kzalloc(sizeof(*mgr->dev->dev), GFP_KERNEL);
> +       if (!mgr->dev->dev)
> +               goto out;
> +
> +       mgr->dev->dev->release = mock_release;
> +       mgr->dev->dev->init_name = PREFIX_STR;
> +       device_initialize(mgr->dev->dev);
> +
> +       drm_dp_encode_sideband_req(in, txmsg);
> +       switch (in->req_type) {
> +       case DP_CONNECTION_STATUS_NOTIFY:
> +       case DP_RESOURCE_STATUS_NOTIFY:
> +               memcpy(&rxmsg->msg, txmsg->msg, ARRAY_SIZE(rxmsg->msg));
> +               rxmsg->curlen = txmsg->cur_len;
> +               if (!drm_dp_sideband_parse_req(mgr, rxmsg, out)) {
> +                       drm_printf(&p, "Failed to decode sideband
> request\n");
> +                       goto out;
> +               }
> +               break;
> +       default:
> +               ret = drm_dp_decode_sideband_req(txmsg, out);
> +               if (ret < 0) {
> +                       drm_printf(&p, "Failed to decode sideband request:
> %d\n", ret);
> +                       goto out;
> +               }
> +               break;
>         }
>  
>         if (!sideband_msg_req_equal(in, out)) {
> @@ -148,9 +185,9 @@ sideband_msg_req_encode_decode(struct
> drm_dp_sideband_msg_req_body *in)
>                 drm_dp_dump_sideband_msg_req_body(in, 1, &p);
>                 drm_printf(&p, "Got:\n");
>                 drm_dp_dump_sideband_msg_req_body(out, 1, &p);
> -               result = false;
>                 goto out;
>         }
> +       result = true;
>  
>         switch (in->req_type) {
>         case DP_REMOTE_DPCD_WRITE:
> @@ -171,6 +208,66 @@ sideband_msg_req_encode_decode(struct
> drm_dp_sideband_msg_req_body *in)
>  out:
>         kfree(out);
>         kfree(txmsg);
> +       kfree(rxmsg);
> +       if (mgr) {
> +               if (mgr->dev) {
> +                       put_device(mgr->dev->dev);
> +                       kfree(mgr->dev);
> +               }
> +               kfree(mgr);
> +       }
> +       return result;
> +}
> +
> +static bool
> +sideband_msg_req_parse(int req_type)
> +{
> +       struct drm_dp_sideband_msg_req_body *out = NULL;
> +       struct drm_printer p = drm_err_printer(PREFIX_STR);
> +       struct drm_dp_sideband_msg_rx *rxmsg = NULL;
> +       struct drm_dp_mst_topology_mgr *mgr = NULL;
> +       bool result = false;
> +
> +       out = kzalloc(sizeof(*out), GFP_KERNEL);
> +       if (!out)
> +               goto out;
> +
> +       rxmsg = kzalloc(sizeof(*rxmsg), GFP_KERNEL);
> +       if (!rxmsg)
> +               goto out;
> +
> +       mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
> +       if (!mgr)
> +               goto out;
> +
> +       mgr->dev = kzalloc(sizeof(*mgr->dev), GFP_KERNEL);
> +       if (!mgr->dev)
> +               goto out;
> +
> +       mgr->dev->dev = kzalloc(sizeof(*mgr->dev->dev), GFP_KERNEL);
> +       if (!mgr->dev->dev)
> +               goto out;
> +
> +       mgr->dev->dev->release = mock_release;
> +       mgr->dev->dev->init_name = PREFIX_STR " expected parse failure";
> +       device_initialize(mgr->dev->dev);
> +
> +       rxmsg->curlen = 1;
> +       rxmsg->msg[0] = req_type & 0x7f;
> +       if (drm_dp_sideband_parse_req(mgr, rxmsg, out))
> +               drm_printf(&p, "Unexpectedly decoded invalid sideband
> request\n");
> +       else
> +               result = true;
> +out:
> +       kfree(out);
> +       kfree(rxmsg);
> +       if (mgr) {
> +               if (mgr->dev) {
> +                       put_device(mgr->dev->dev);
> +                       kfree(mgr->dev);
> +               }
> +               kfree(mgr);
> +       }
>         return result;
>  }
>  
> @@ -268,6 +365,34 @@ int igt_dp_mst_sideband_msg_req_decode(void *unused)
>         in.u.enc_status.valid_stream_behavior = 1;
>         DO_TEST();
>  
> +       in.req_type = DP_CONNECTION_STATUS_NOTIFY;
> +       in.u.conn_stat.port_number = 0xf;
> +       get_random_bytes(in.u.conn_stat.guid, sizeof(in.u.conn_stat.guid));
> +       in.u.conn_stat.legacy_device_plug_status = 1;
> +       in.u.conn_stat.displayport_device_plug_status = 0;
> +       in.u.conn_stat.message_capability_status = 0;
> +       in.u.conn_stat.input_port = 0;
> +       in.u.conn_stat.peer_device_type = 7;
> +       DO_TEST();
> +       in.u.conn_stat.displayport_device_plug_status = 1;
> +       DO_TEST();
> +       in.u.conn_stat.message_capability_status = 1;
> +       DO_TEST();
> +       in.u.conn_stat.input_port = 1;
> +       DO_TEST();
> +
> +       in.req_type = DP_RESOURCE_STATUS_NOTIFY;
> +       in.u.resource_stat.port_number = 0xf;
> +       get_random_bytes(in.u.resource_stat.guid,
> sizeof(in.u.resource_stat.guid));

Do you think you might be up to moving some of the random functions i915 uses
for selftests out of drivers/gpu/drm/i915/selftests/i915_random.h so that we
could use them here and be able to print out the actual seeds being used for
randomness so that failures can be reproduced reliably?

Either way, patches 1-2 are:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will have the third reviewed in just a moment, there's some tiny nitpicks w/
it

> +       in.u.resource_stat.available_pbn = 0xcdef;
> +       DO_TEST();
> +
> +#undef DO_TEST
> +#define DO_TEST(req_type) FAIL_ON(!sideband_msg_req_parse(req_type))
> +       DO_TEST(DP_CONNECTION_STATUS_NOTIFY);
> +       DO_TEST(DP_RESOURCE_STATUS_NOTIFY);
> +
> +       DO_TEST(DP_REMOTE_I2C_WRITE);
>  #undef DO_TEST
>         return 0;
>  }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

