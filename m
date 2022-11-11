Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C61826264BA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB2910E8EB;
	Fri, 11 Nov 2022 22:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD71610E8EA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 22:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668206758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfoD+yTsgDgyy3DKNtedBkMBeaq/mYuNaScJkhXJDcQ=;
 b=dSjLr7pCRXkqCyJRsCKOp9q9e/Aru896A4MFNnkAfJniay3sGNPBPZuAhWrCn1B6GKrR2r
 xqvUf15dzmR7Q3pBL9bRqYV8MRCCaZ8/QnT+zm8kd+JX3G6j7xeTgyBtN1+4anLyheAM2l
 c0RIwiXFTGf+HpUwLAZ0DPSvx8u5nDc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-493-hMPP0prYNxCBEBPBn4MRoA-1; Fri, 11 Nov 2022 17:45:56 -0500
X-MC-Unique: hMPP0prYNxCBEBPBn4MRoA-1
Received: by mail-qk1-f197.google.com with SMTP id
 bs7-20020a05620a470700b006fac7447b1cso5818780qkb.17
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 14:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HfoD+yTsgDgyy3DKNtedBkMBeaq/mYuNaScJkhXJDcQ=;
 b=u7wkmWytX7d4mnbIIAJ7QKrqVmxMnI5WMbz2wrgG7NThTUwq3lvfLOxOZ0uINvcWEl
 LvP94CCui+zYIw/JP4z+p5WcDou5rXhYYJ4bj5WIJuHQ0A2e4TOCQlxSWvI5AZD5fuW3
 p+GpAgjXCqCI+PR+syiCqv3fmaGJtXQBPutHbDiT//KBOXo8sFqQ2qRnjukDL0uG3d4O
 bc7CjmzOyUlj9lpzI7vuOquAtG9md4Zo9EG5IJkJk0UE4m9CpIyxqK6ghjCVVgRSKqMa
 NsCssROLqmpOkMIXN1tQ4zXBO9PANwaoqUM8sfbd074RfTW4+8E2cWTpdYXHmxXkj3un
 WxUw==
X-Gm-Message-State: ANoB5plLU9uzWMNsnYtkH++FOmL3StuIla9Aj1g4ERtciA0n9H2nuUax
 q1HQXsJ9lRIFj7IaNPl95V/SgI9IF4CgX3F7UbDxdt23RsOf/6NV0mNIG7rjM4umJxsQps2aUVi
 PsLuZL91bPGhLsF3wQUg2S9nDtY/x
X-Received: by 2002:a37:6887:0:b0:6cd:fd44:d83e with SMTP id
 d129-20020a376887000000b006cdfd44d83emr2973926qkc.594.1668206755002; 
 Fri, 11 Nov 2022 14:45:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6SZGZhkL4AowLZ87AFimr5T3hQE6XB4d5J7ZosU46Koto1vL4Amhb0XNjGBjAqUUHeUBXwrQ==
X-Received: by 2002:a37:6887:0:b0:6cd:fd44:d83e with SMTP id
 d129-20020a376887000000b006cdfd44d83emr2973910qkc.594.1668206754748; 
 Fri, 11 Nov 2022 14:45:54 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:9200::feb? ([2600:4040:5c6c:9200::feb])
 by smtp.gmail.com with ESMTPSA id
 f2-20020ac87f02000000b003a4c3c4d2d4sm1948861qtk.49.2022.11.11.14.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 14:45:53 -0800 (PST)
Message-ID: <023708836f1af8302c813e8308c7d406e6fd2310.camel@redhat.com>
Subject: Re: [PATCH 1/5] drm/nouveau/nvfw/acr: make
 wpr_generic_header_dump() static
From: Lyude Paul <lyude@redhat.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, bskeggs@redhat.com
Date: Fri, 11 Nov 2022 17:45:52 -0500
In-Reply-To: <20221111091130.57178-1-jiapeng.chong@linux.alibaba.com>
References: <20221111091130.57178-1-jiapeng.chong@linux.alibaba.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Actually hm, I think ben will need to consider pulling these into his branch
since these don't seem to apply to drm-misc-next - so presumably they're
related to some of the work that's been getting pushed recently for GSP prep

On Fri, 2022-11-11 at 17:11 +0800, Jiapeng Chong wrote:
> This symbol is not used outside of acr.c, so marks it static.
> 
> drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for ‘wpr_generic_header_dump’.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3023
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> index 83a9c48bc58c..7ac90c495737 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> @@ -45,7 +45,7 @@ wpr_header_v1_dump(struct nvkm_subdev *subdev, const struct wpr_header_v1 *hdr)
>  	nvkm_debug(subdev, "\tstatus        : %d\n", hdr->status);
>  }
>  
> -void
> +static void
>  wpr_generic_header_dump(struct nvkm_subdev *subdev, const struct wpr_generic_header *hdr)
>  {
>  	nvkm_debug(subdev, "wprGenericHeader\n");

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

