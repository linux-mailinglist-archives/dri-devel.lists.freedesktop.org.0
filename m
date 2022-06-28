Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DF655F1AB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 00:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04CA11A271;
	Tue, 28 Jun 2022 22:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8171F11A271
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 22:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656457090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mk+Xp685pb+8wj1J+aRICQE6iudgejxXblH+0Ia6Clo=;
 b=iUTS+K8cpB4d2UNAuBq40bHMfqGS1ea7ysffmw29NvxwLNY7hZUcoQGdXcGvKiC9ot1n4J
 bl1RFcGSQhMNt4BamGNfNQT+b/vcVQeXGauM3J5sON30f//0NtrJRm2ilTOo+hv2ujMrkm
 wWC2/lU2mjDw9zS09QZLSdirRD0ctSk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-CXnKgQjlPO-jniKuRyhZfQ-1; Tue, 28 Jun 2022 18:58:09 -0400
X-MC-Unique: CXnKgQjlPO-jniKuRyhZfQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 a68-20020a376647000000b006af6c4be635so2039863qkc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 15:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Mk+Xp685pb+8wj1J+aRICQE6iudgejxXblH+0Ia6Clo=;
 b=jZRE3jXElQ5/KmdaM8Vib46ZYFcyTVA96dlEAvMYnYRzY4COFF/QGNttJq0dDiDS5a
 rN/67hJKoMohitIUsx0pPXjoSn+8P5hAmciNYYUwyn4Tmh2Vr1drRmWFl5Bxa1txT1Jv
 HuoqF2XDOvmBlDmARo8nnBD5/y+QPiZSb/OaWvE1Mggs3jqMoVEg4e/F7z6mMfexbjLQ
 ifH67hZ5W5BeX4D8kifiRWsL6P5arKAfZobIk+WdeTnWRzcKAKm72L205O/UdygSlPbm
 0XOkVhQB4y9odyD4NlldCHAQ2KXa0nkfD6Z2jIZVecl3f75fqjmSIPhy7PTrr0S1HEsP
 YKTQ==
X-Gm-Message-State: AJIora9UVepAbwRMKx+Ff9Fjwd0xhBBZ1sr6MrUNKwhdkxs66gaUG3qo
 xDqdPsOBFlPORti5LQhIdUHfU9quzH4oFROj6MnjQmiQwe9OvLoH9K3+Q2Cea/Z3SEemUQT3UOH
 CHPKkoP7v4Pj85AKuer0hD+rjf0GF
X-Received: by 2002:a0c:fa8c:0:b0:470:3ec6:5ca3 with SMTP id
 o12-20020a0cfa8c000000b004703ec65ca3mr5569301qvn.8.1656457088693; 
 Tue, 28 Jun 2022 15:58:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1skOCkhgAQmhe6pa0m0HvrhedXdhpGjYu863mW2kX+qeNH7RR6JpwYJKUCJjZCjgo0Vv5YXzw==
X-Received: by 2002:a0c:fa8c:0:b0:470:3ec6:5ca3 with SMTP id
 o12-20020a0cfa8c000000b004703ec65ca3mr5569288qvn.8.1656457088495; 
 Tue, 28 Jun 2022 15:58:08 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a05622a01d300b00304f3e320f2sm10590118qtw.4.2022.06.28.15.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 15:58:07 -0700 (PDT)
Message-ID: <fb44d2a7c69ebcddcf25858b6540a4bfa1ecd09d.camel@redhat.com>
Subject: Re: [PATCH RESEND] drm: i915: fix a possible refcount leak in
 intel_dp_add_mst_connector()
From: Lyude Paul <lyude@redhat.com>
To: Hangyu Hua <hbh25y@gmail.com>, jani.nikula@linux.intel.com, 
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, 
 tvrtko.ursulin@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch, 
 ville.syrjala@linux.intel.com, jose.souza@intel.com,
 matthew.d.roper@intel.com,  anshuman.gupta@intel.com, heying24@huawei.com,
 james.ausmus@intel.com
Date: Tue, 28 Jun 2022 18:58:06 -0400
In-Reply-To: <4119ed8c7ace96e1fa46b34fd9e8404828c3e57d.camel@redhat.com>
References: <20220624022813.10796-1-hbh25y@gmail.com>
 <4119ed8c7ace96e1fa46b34fd9e8404828c3e57d.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ah-nevermind! Seems like someone already pushed this for you :)

On Tue, 2022-06-28 at 18:55 -0400, Lyude Paul wrote:
> Nice catch!
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Will push to drm-intel-next
> 
> On Fri, 2022-06-24 at 10:28 +0800, Hangyu Hua wrote:
> > If drm_connector_init fails, intel_connector_free will be called to take
> > care of proper free. So it is necessary to drop the refcount of port
> > before intel_connector_free.
> > 
> > Fixes: 091a4f91942a ("drm/i915: Handle drm-layer errors in
> > intel_dp_add_mst_connector")
> > Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> > Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index 061b277e5ce7..14d2a64193b2 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -839,6 +839,7 @@ static struct drm_connector
> > *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> >         ret = drm_connector_init(dev, connector,
> > &intel_dp_mst_connector_funcs,
> >                                  DRM_MODE_CONNECTOR_DisplayPort);
> >         if (ret) {
> > +               drm_dp_mst_put_port_malloc(port);
> >                 intel_connector_free(intel_connector);
> >                 return NULL;
> >         }
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

