Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4324448DC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 20:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9B76E860;
	Wed,  3 Nov 2021 19:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1FC6E886
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 19:18:41 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id w4so872685qtn.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 12:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JfmhsLBhYibdTrlIazkq02xXrGY2EEQCUruPV8AdPB8=;
 b=YuXaf9hSXkLOe04dhZel0ZES9Ok1wgOiBadoGan0Rw0Otm3pGrTgqCmUGQ7QvUh0is
 24Py8KvtFRc61e/uKbuZksk0QsOU2JuKlSSmkTDzTVHUvFgerlnHuPBzH9n+zcHfrY9h
 PiTlPiwPbW/1qOeRxbkJ9eb48J7S1syK/+kBhclc4gkM+oWkp+zNqiNxMlwTLytuCeR2
 buUaqo+A6LnrUool9btgn9RBlgCTcAkO/X4POm2Q+JofQxjq+HtG6rIYo7fCk8gb92F7
 vzSTqxP33QIZEoCcJ4CQa00imkVg7ISuE2Y3FYVXQ/G2oQAdkRk+Be85mBRgl5rvSVEY
 y47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JfmhsLBhYibdTrlIazkq02xXrGY2EEQCUruPV8AdPB8=;
 b=ljBrp34K1jG4k2WuK3aNfzmu3NSsytiJn2oZuoGMkujS35PvvIKBDrMfR0no9laDMr
 pRPLtpyI6EKJXtJyBlRBQEtghpC2er18WJxP+NUfX3kKieC+/5E73mMO2vzFlQTj52EC
 zjDaK6DiBRhgNQWBsbg6okdp0XPfGenuQyr49mZ2pN1kRQTXogku9zsUw2VRZ2x5ZDGR
 ow29tlU8b8UCdVMRoAgytdx4psy1gjdCvdxy76jKW9zWPqIKkKay1HD79l6H3rTrcmef
 cfsUrkdxjkEoSbs8EJu96epqHdb63DW1P3Sm/xiXE3TTnlbV/tAZYLh0hQsi/RnPGdMY
 7BzQ==
X-Gm-Message-State: AOAM530Imi9CzupJNOQ8Lh6zY+TO2Kk9buoqiZ+eNVPW9umSyO2Ptm0m
 ApWI8KAo7gPB8qUuJP7qF6j8rKtct6M=
X-Google-Smtp-Source: ABdhPJzXYistbUZO/6WTMsk6RDLC89Qk+34Bj3Tvcu+SbpNXSQqbfGfdW9Cg3uYyYGlYRCtKywKXsA==
X-Received: by 2002:a05:622a:118c:: with SMTP id
 m12mr31509920qtk.381.1635967119850; 
 Wed, 03 Nov 2021 12:18:39 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f5:66c6:188e:4e49:90d2:b722?
 ([2804:431:c7f5:66c6:188e:4e49:90d2:b722])
 by smtp.gmail.com with ESMTPSA id z6sm2253362qta.31.2021.11.03.12.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 12:18:39 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] drm: vkms: Add fb information to
 `vkms_writeback_job`
To: Thomas Zimmermann <tzimmermann@suse.de>, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, ppaalanen@gmail.com
References: <20211026113409.7242-1-igormtorrente@gmail.com>
 <20211026113409.7242-5-igormtorrente@gmail.com>
 <710caf29-400d-a7e4-9c1f-66e2a85c3222@suse.de>
From: Igor Torrente <igormtorrente@gmail.com>
Message-ID: <ebf6e8d1-3877-8e71-d066-84974790df17@gmail.com>
Date: Wed, 3 Nov 2021 16:18:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <710caf29-400d-a7e4-9c1f-66e2a85c3222@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 leandro.ribeiro@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 11/3/21 12:45 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 26.10.21 um 13:34 schrieb Igor Torrente:
>> This commit is the groundwork to introduce new formats to the planes and
>> writeback buffer. As part of it, a new buffer metadata field is added to
>> `vkms_writeback_job`, this metadata is represented by the `vkms_composer`
>> struct.
>>
>> This will allow us, in the future, to have different compositing and wb
>> format types.
>>
>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>> ---
>> V2: Change the code to get the drm_framebuffer reference and not copy its
>>       contents(Thomas Zimmermann).
>> ---
>>    drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++--
>>    drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++++------
>>    drivers/gpu/drm/vkms/vkms_plane.c     | 10 +++++-----
>>    drivers/gpu/drm/vkms/vkms_writeback.c | 21 ++++++++++++++++++---
>>    4 files changed, 31 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index 82f79e508f81..383ca657ddf7 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -153,7 +153,7 @@ static void compose_plane(struct vkms_composer *primary_composer,
>>    			  struct vkms_composer *plane_composer,
>>    			  void *vaddr_out)
>>    {
>> -	struct drm_framebuffer *fb = &plane_composer->fb;
>> +	struct drm_framebuffer *fb = plane_composer->fb;
>>    	void *vaddr;
>>    	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
>>    
>> @@ -174,7 +174,7 @@ static int compose_active_planes(void **vaddr_out,
>>    				 struct vkms_composer *primary_composer,
>>    				 struct vkms_crtc_state *crtc_state)
>>    {
>> -	struct drm_framebuffer *fb = &primary_composer->fb;
>> +	struct drm_framebuffer *fb = primary_composer->fb;
>>    	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
>>    	const void *vaddr;
>>    	int i;
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>> index 64e62993b06f..9e4c1e95bbb1 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -20,13 +20,8 @@
>>    #define XRES_MAX  8192
>>    #define YRES_MAX  8192
>>    
>> -struct vkms_writeback_job {
>> -	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>> -	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
>> -};
>> -
>>    struct vkms_composer {
>> -	struct drm_framebuffer fb;
>> +	struct drm_framebuffer *fb;
>>    	struct drm_rect src, dst;
>>    	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>>    	unsigned int offset;
>> @@ -34,6 +29,11 @@ struct vkms_composer {
>>    	unsigned int cpp;
>>    };
>>    
>> +struct vkms_writeback_job {
>> +	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
>> +	struct vkms_composer composer;
>> +};
>> +
>>    /**
>>     * vkms_plane_state - Driver specific plane state
>>     * @base: base plane state
>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>> index 32409e15244b..0a28cb7a85e2 100644
>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>> @@ -50,12 +50,12 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
>>    	struct vkms_plane_state *vkms_state = to_vkms_plane_state(old_state);
>>    	struct drm_crtc *crtc = vkms_state->base.base.crtc;
>>    
>> -	if (crtc) {
>> +	if (crtc && vkms_state->composer->fb) {
>>    		/* dropping the reference we acquired in
>>    		 * vkms_primary_plane_update()
>>    		 */
>> -		if (drm_framebuffer_read_refcount(&vkms_state->composer->fb))
>> -			drm_framebuffer_put(&vkms_state->composer->fb);
>> +		if (drm_framebuffer_read_refcount(vkms_state->composer->fb))
>> +			drm_framebuffer_put(vkms_state->composer->fb);
>>    	}
>>    
>>    	kfree(vkms_state->composer);
>> @@ -110,9 +110,9 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>>    	composer = vkms_plane_state->composer;
>>    	memcpy(&composer->src, &new_state->src, sizeof(struct drm_rect));
>>    	memcpy(&composer->dst, &new_state->dst, sizeof(struct drm_rect));
>> -	memcpy(&composer->fb, fb, sizeof(struct drm_framebuffer));
>> +	composer->fb = fb;
>>    	memcpy(&composer->map, &shadow_plane_state->data, sizeof(composer->map));
>> -	drm_framebuffer_get(&composer->fb);
>> +	drm_framebuffer_get(composer->fb);
>>    	composer->offset = fb->offsets[0];
>>    	composer->pitch = fb->pitches[0];
>>    	composer->cpp = fb->format->cpp[0];
>> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
>> index 8694227f555f..32734cdbf6c2 100644
>> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
>> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
>> @@ -75,12 +75,15 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
>>    	if (!vkmsjob)
>>    		return -ENOMEM;
>>    
>> -	ret = drm_gem_fb_vmap(job->fb, vkmsjob->map, vkmsjob->data);
>> +	ret = drm_gem_fb_vmap(job->fb, vkmsjob->composer.map, vkmsjob->data);
>>    	if (ret) {
>>    		DRM_ERROR("vmap failed: %d\n", ret);
>>    		goto err_kfree;
>>    	}
>>    
>> +	vkmsjob->composer.fb = job->fb;
>> +	drm_framebuffer_get(vkmsjob->composer.fb);
>> +
>>    	job->priv = vkmsjob;
>>    
>>    	return 0;
>> @@ -99,7 +102,10 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>>    	if (!job->fb)
>>    		return;
>>    
>> -	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
>> +	drm_gem_fb_vunmap(job->fb, vkmsjob->composer.map);
>> +
>> +	if (drm_framebuffer_read_refcount(vkmsjob->composer.fb))
>> +		drm_framebuffer_put(vkmsjob->composer.fb);
> 
> Why is this protected by an if conditional?

Here, I followed what was done in the vkms_plane code, just adapting it
to the writeback callbacks.

I put this if because I wasn't 100% sure that for each
`vkms_wb_prepare_job` I would have exactly one `vkms_wb_cleanup_job`
after it.

It happened in my testings, but I can't guarantee that it will always
happen.

> 
> Best regards
> Thomas
> 
>>    
>>    	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
>>    	vkms_set_composer(&vkmsdev->output, false);
>> @@ -116,14 +122,23 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>>    	struct drm_writeback_connector *wb_conn = &output->wb_connector;
>>    	struct drm_connector_state *conn_state = wb_conn->base.state;
>>    	struct vkms_crtc_state *crtc_state = output->composer_state;
>> +	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
>> +	struct vkms_writeback_job *active_wb;
>> +	struct vkms_composer *wb_composer;
>>    
>>    	if (!conn_state)
>>    		return;
>>    
>>    	vkms_set_composer(&vkmsdev->output, true);
>>    
>> +	active_wb = conn_state->writeback_job->priv;
>> +	wb_composer = &active_wb->composer;
>> +
>>    	spin_lock_irq(&output->composer_lock);
>> -	crtc_state->active_writeback = conn_state->writeback_job->priv;
>> +	crtc_state->active_writeback = active_wb;
>> +	wb_composer->offset = fb->offsets[0];
>> +	wb_composer->pitch = fb->pitches[0];
>> +	wb_composer->cpp = fb->format->cpp[0];
>>    	crtc_state->wb_pending = true;
>>    	spin_unlock_irq(&output->composer_lock);
>>    	drm_writeback_queue_job(wb_conn, connector_state);
>>
> 

Thanks,
---
Igor M. A. Torrente
