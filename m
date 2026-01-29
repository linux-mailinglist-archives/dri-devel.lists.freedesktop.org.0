Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG9pDxtpe2lEEgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 15:05:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD4B0AD1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 15:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F2D10E1AA;
	Thu, 29 Jan 2026 14:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com
 [162.0.218.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680FE10E1AA;
 Thu, 29 Jan 2026 14:05:09 +0000 (UTC)
Received: from MTA-05-3.privateemail.com (mta-05.privateemail.com
 [198.54.127.60])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4f219v04nZz2y4L;
 Thu, 29 Jan 2026 14:05:07 +0000 (UTC)
Received: from hal-station (unknown [23.129.64.159])
 by mta-05.privateemail.com (Postfix) with ESMTPA id 4f21986cmPz3hhT6;
 Thu, 29 Jan 2026 09:04:28 -0500 (EST)
Date: Thu, 29 Jan 2026 09:04:23 -0500
From: Hamza Mahfooz <someguy@effective-light.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
Message-ID: <aXto53g2mSNsNmFM@hal-station>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2719069.vYhyI6sBWr@timur-hyperion>
 <30f2480d-016f-417e-9ddf-7805e4943e7b@amd.com>
 <2285353.hkbZ0PkbqX@timur-hyperion>
 <2f9bc706-02d6-4dec-a56c-53abc5d43f46@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f9bc706-02d6-4dec-a56c-53abc5d43f46@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[effective-light.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,mailbox.org,amd.com,lists.freedesktop.org,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	NEURAL_HAM(-0.00)[-0.866];
	FROM_NEQ_ENVFROM(0.00)[someguy@effective-light.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 72CD4B0AD1
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 01:59:00PM +0100, Christian König wrote:
> > How do you propose to do that?
> 
> I need to dig a bit into the DAL/DC code and see how the signaling path actually goes.
> 
> Going to give that a try tomorrow.
> 

For recent ASICs, something along the lines of the following should do
the trick:

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index dc8d2f52c7d6..fac668c2fcfb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -510,6 +510,7 @@ struct amdgpu_crtc {
 	bool wb_pending;
 	bool wb_enabled;
 	struct drm_writeback_connector *wb_conn;
+	int pflip_cnt;
 };
 
 struct amdgpu_encoder_atom_dig {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 740711ac1037..1c3b7fbab1c6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -427,6 +427,18 @@ static inline bool update_planes_and_stream_adapter(struct dc *dc,
 					   stream_update);
 }
 
+static inline bool update_pflip_cnt(struct amdgpu_crtc *acrtc)
+{
+	int cnt = acrtc->pflip_cnt++;
+
+	if (cnt == 300) {
+		acrtc->pflip_cnt = 0;
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * dm_pflip_high_irq() - Handle pageflip interrupt
  * @interrupt_params: ignored
@@ -454,6 +466,9 @@ static void dm_pflip_high_irq(void *interrupt_params)
 		return;
 	}
 
+	if (update_pflip_cnt(amdgpu_crtc))
+		return;
+
 	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 
 	if (amdgpu_crtc->pflip_status != AMDGPU_FLIP_SUBMITTED) {
@@ -589,6 +604,9 @@ static void dm_vupdate_high_irq(void *interrupt_params)
 	acrtc = get_crtc_by_otg_inst(adev, irq_params->irq_src - IRQ_TYPE_VUPDATE);
 
 	if (acrtc) {
+		if (update_pflip_cnt(acrtc))
+			return;
+
 		vrr_active = amdgpu_dm_crtc_vrr_active_irq(acrtc);
 		drm_dev = acrtc->base.dev;
 		vblank = drm_crtc_vblank_crtc(&acrtc->base);
@@ -659,6 +677,9 @@ static void dm_crtc_high_irq(void *interrupt_params)
 	if (!acrtc)
 		return;
 
+	if (update_pflip_cnt(acrtc))
+		return;
+
 	if (acrtc->wb_conn) {
 		spin_lock_irqsave(&acrtc->wb_conn->job_lock, flags);
