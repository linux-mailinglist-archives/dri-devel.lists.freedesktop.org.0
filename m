Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2C059B8CD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 07:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C5E99C04;
	Mon, 22 Aug 2022 05:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501D899BFB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 05:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661146900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X9WUNh56v3JX9TdQTYeDyZcVLzL5ai3+BnHBqasmFWg=;
 b=EORj2xKkWtKe0Nv3CmRdPM03cn5dOW8KZafuFQ4yfS1sz/6H72vzjQtUXla8TGz88bU45M
 5tJlXn4KXloN4y3Je9otId8U4tzkuGZOVPrPHyUp4aYuFCIhLvOyyxJGIALxakj8aUAk42
 3NwO697NJY/pibc8i8ovE+Pkji6NQV4=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-KnY2VmNnMTikWjetg5tpIg-1; Mon, 22 Aug 2022 01:41:38 -0400
X-MC-Unique: KnY2VmNnMTikWjetg5tpIg-1
Received: by mail-lf1-f71.google.com with SMTP id
 g23-20020ac25397000000b00492e52a1dadso484071lfh.21
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 22:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc;
 bh=X9WUNh56v3JX9TdQTYeDyZcVLzL5ai3+BnHBqasmFWg=;
 b=55ICjhEZEVo4QNYN1WdbryK7ClmbeCqDr+T7PYb+1d13yyGnDY2JLGdnFfTgSjiSlf
 MnPDNYDMVbMB9ASKhVqxR44Aw7zxJTEgZWG5+9xBp5gMoxOcPhrHJnTGPtKQenHExYTX
 PUMRiJO/B+Ggeo6bWvnmGQlk601wuqP/cEerM5lbiT3weOxkS8vu3nUnASoA+XizRJUE
 HDVslJvu70amKak4lgEFozmu8xcxTYcsE6uqzbx+/mgYJQbqaE3FAxg1sFcrdLelcSFc
 BTOcGCCKw9vPntAoEVe4rRKAxQtMMyS7RHDSXio9+KiL2KFi7EbG3cIBP+o06LdnA+dY
 qc0g==
X-Gm-Message-State: ACgBeo3fHgwE8kbq/leSRY/3tR80+0wXg57ozN2h3c5qgSxsXbiiO2vE
 dk8v3EhfG4CNzYT0tyvTz72ldZVSySOoLLucqg0CEAngu5Hr+kYN/TwFQh1Li5rjXbzqwfRRJvq
 lPj08HnNmtbXF3Y/DpPpxdeayPXhbWVLP+ltNcg3YPrkEZmgGvlshs9fb0rzMDLTh7NKgQrsD5l
 BnzWI=
X-Received: by 2002:a05:6512:1521:b0:48a:3c5d:5d17 with SMTP id
 bq33-20020a056512152100b0048a3c5d5d17mr6285400lfb.587.1661146896981; 
 Sun, 21 Aug 2022 22:41:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4j83cm3FR3z5xRBjyJSg92Dn3p8wRvC+LWrIXFmHmxLnneory+lN0e9I1pKMZbc8Q4IdeVCQ==
X-Received: by 2002:a05:6512:1521:b0:48a:3c5d:5d17 with SMTP id
 bq33-20020a056512152100b0048a3c5d5d17mr6285393lfb.587.1661146896648; 
 Sun, 21 Aug 2022 22:41:36 -0700 (PDT)
Received: from [192.168.1.121] (91-145-109-188.bb.dnainternet.fi.
 [91.145.109.188]) by smtp.gmail.com with ESMTPSA id
 y18-20020a05651c107200b0025e42f8e771sm118490ljm.34.2022.08.21.22.41.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Aug 2022 22:41:36 -0700 (PDT)
Message-ID: <b5ba847f-1e3c-6f8a-1400-b0085bb0811b@redhat.com>
Date: Mon, 22 Aug 2022 08:41:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Prevent CPU deadlock with fbdev based consoles while
 printing scheduler warnings
To: dri-devel@lists.freedesktop.org
References: <20220802033142.31655-1-mpenttil@redhat.com>
From: =?UTF-8?Q?Mika_Penttil=c3=a4?= <mpenttil@redhat.com>
In-Reply-To: <20220802033142.31655-1-mpenttil@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="------------XSLVPlJ6SU0vxuTkpP01a4Vu"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------XSLVPlJ6SU0vxuTkpP01a4Vu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Gentle ping, any concerns or suggestions on this topic or solution in general?

Thanks,
Mika


On 2.8.2022 6.31, mpenttil@redhat.com wrote:
> From: Mika Penttilä<mpenttil@redhat.com>
>
> With some fbdev based consoles, using the deferred_io mechanism and drm_fb_helper,
> there can be a call chain like:
>
> Backtrack:
>
> try_to_wake_up  <-- rq_lock taken
> __queue_work
> queue_work_on
> soft_cursor
> hide_cursor
> vt_console_print
> console_unlock
> vprintk_emit
> printk
> __warn_printk
> (cfs_rq_is_decayed -> SCHED_WARN_ON)
> __update_blocked_fair
> update_blocked_averages   <-- rq_lock taken
>
> Example producer is with qemu bochs virtio device (qemu stdvga),
> and drm bochs support in the guest.
>
> This can fixed be used using schedule_delayed_work() to get out of scheduler context,
> if needed, while queueing the damage_work.
>
> Signed-off-by: Mika Penttilä<mpenttil@redhat.com>
> Cc: David Airlie<airlied@linux.ie>
> ---
>   drivers/gpu/drm/drm_fb_helper.c | 8 ++++----
>   include/drm/drm_fb_helper.h     | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 5ad2b6a2778c..6449e8dc97f6 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -429,7 +429,7 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
>   static void drm_fb_helper_damage_work(struct work_struct *work)
>   {
>   	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper,
> -						    damage_work);
> +						    damage_work.work);
>   	struct drm_device *dev = helper->dev;
>   	struct drm_clip_rect *clip = &helper->damage_clip;
>   	struct drm_clip_rect clip_copy;
> @@ -488,7 +488,7 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
>   	INIT_LIST_HEAD(&helper->kernel_fb_list);
>   	spin_lock_init(&helper->damage_lock);
>   	INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
> -	INIT_WORK(&helper->damage_work, drm_fb_helper_damage_work);
> +	INIT_DELAYED_WORK(&helper->damage_work, drm_fb_helper_damage_work);
>   	helper->damage_clip.x1 = helper->damage_clip.y1 = ~0;
>   	mutex_init(&helper->lock);
>   	helper->funcs = funcs;
> @@ -625,7 +625,7 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>   		return;
>   
>   	cancel_work_sync(&fb_helper->resume_work);
> -	cancel_work_sync(&fb_helper->damage_work);
> +	cancel_delayed_work_sync(&fb_helper->damage_work);
>   
>   	info = fb_helper->fbdev;
>   	if (info) {
> @@ -677,7 +677,7 @@ static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
>   	clip->y2 = max_t(u32, clip->y2, y + height);
>   	spin_unlock_irqrestore(&helper->damage_lock, flags);
>   
> -	schedule_work(&helper->damage_work);
> +	schedule_delayed_work(&helper->damage_work, in_atomic() ? 1 : 0);
>   }
>   
>   /* Convert memory region into area of scanlines and pixels per scanline */
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 329607ca65c0..65a26d57d517 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -132,7 +132,7 @@ struct drm_fb_helper {
>   	u32 pseudo_palette[17];
>   	struct drm_clip_rect damage_clip;
>   	spinlock_t damage_lock;
> -	struct work_struct damage_work;
> +	struct delayed_work damage_work;
>   	struct work_struct resume_work;
>   
>   	/**

--------------XSLVPlJ6SU0vxuTkpP01a4Vu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Gentle ping, any concerns or suggestions on this topic or solution in general?

Thanks,
Mika

</pre>
    <br>
    <div class="moz-cite-prefix">On 2.8.2022 6.31, <a class="moz-txt-link-abbreviated" href="mailto:mpenttil@redhat.com">mpenttil@redhat.com</a>
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220802033142.31655-1-mpenttil@redhat.com">
      <pre class="moz-quote-pre" wrap="">From: Mika Penttilä <a class="moz-txt-link-rfc2396E" href="mailto:mpenttil@redhat.com">&lt;mpenttil@redhat.com&gt;</a>

With some fbdev based consoles, using the deferred_io mechanism and drm_fb_helper,
there can be a call chain like:

Backtrack:

try_to_wake_up  &lt;-- rq_lock taken
__queue_work
queue_work_on
soft_cursor
hide_cursor
vt_console_print
console_unlock
vprintk_emit
printk
__warn_printk
(cfs_rq_is_decayed -&gt; SCHED_WARN_ON)
__update_blocked_fair
update_blocked_averages   &lt;-- rq_lock taken

Example producer is with qemu bochs virtio device (qemu stdvga),
and drm bochs support in the guest.

This can fixed be used using schedule_delayed_work() to get out of scheduler context,
if needed, while queueing the damage_work.

Signed-off-by: Mika Penttilä <a class="moz-txt-link-rfc2396E" href="mailto:mpenttil@redhat.com">&lt;mpenttil@redhat.com&gt;</a>
Cc: David Airlie <a class="moz-txt-link-rfc2396E" href="mailto:airlied@linux.ie">&lt;airlied@linux.ie&gt;</a>
---
 drivers/gpu/drm/drm_fb_helper.c | 8 ++++----
 include/drm/drm_fb_helper.h     | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 5ad2b6a2778c..6449e8dc97f6 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -429,7 +429,7 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
 static void drm_fb_helper_damage_work(struct work_struct *work)
 {
 	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper,
-						    damage_work);
+						    damage_work.work);
 	struct drm_device *dev = helper-&gt;dev;
 	struct drm_clip_rect *clip = &amp;helper-&gt;damage_clip;
 	struct drm_clip_rect clip_copy;
@@ -488,7 +488,7 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 	INIT_LIST_HEAD(&amp;helper-&gt;kernel_fb_list);
 	spin_lock_init(&amp;helper-&gt;damage_lock);
 	INIT_WORK(&amp;helper-&gt;resume_work, drm_fb_helper_resume_worker);
-	INIT_WORK(&amp;helper-&gt;damage_work, drm_fb_helper_damage_work);
+	INIT_DELAYED_WORK(&amp;helper-&gt;damage_work, drm_fb_helper_damage_work);
 	helper-&gt;damage_clip.x1 = helper-&gt;damage_clip.y1 = ~0;
 	mutex_init(&amp;helper-&gt;lock);
 	helper-&gt;funcs = funcs;
@@ -625,7 +625,7 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 		return;
 
 	cancel_work_sync(&amp;fb_helper-&gt;resume_work);
-	cancel_work_sync(&amp;fb_helper-&gt;damage_work);
+	cancel_delayed_work_sync(&amp;fb_helper-&gt;damage_work);
 
 	info = fb_helper-&gt;fbdev;
 	if (info) {
@@ -677,7 +677,7 @@ static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
 	clip-&gt;y2 = max_t(u32, clip-&gt;y2, y + height);
 	spin_unlock_irqrestore(&amp;helper-&gt;damage_lock, flags);
 
-	schedule_work(&amp;helper-&gt;damage_work);
+	schedule_delayed_work(&amp;helper-&gt;damage_work, in_atomic() ? 1 : 0);
 }
 
 /* Convert memory region into area of scanlines and pixels per scanline */
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 329607ca65c0..65a26d57d517 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -132,7 +132,7 @@ struct drm_fb_helper {
 	u32 pseudo_palette[17];
 	struct drm_clip_rect damage_clip;
 	spinlock_t damage_lock;
-	struct work_struct damage_work;
+	struct delayed_work damage_work;
 	struct work_struct resume_work;
 
 	/**
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------XSLVPlJ6SU0vxuTkpP01a4Vu--

