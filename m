Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK60DeU3immhIQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 20:39:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E811142C7
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 20:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887E510E1E2;
	Mon,  9 Feb 2026 19:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="dhFucDFG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393A810E1E2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 19:39:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770665938; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PUo3NtOy0pxAjeURlUsWuo1EAzwqsw1QB85eLVS3vlzAlr7XDVaKmNhPT1heuKoo+YcuqEDd36w8oWIedqlPV6lPBR6gCsZMLrhU2/snxJ58eiDg8hBYdmAmSWzEhXk0F7Kgk8P1e8T6224VEN0wuWJanJLfzlm8JqVlHPHO9uU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770665938;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CIyH4y6swdakzfqF5GNfAEWE1iUdT0mefHf4wdhgC6A=; 
 b=foL32N5dpDGyv9QpGxc+ZzVsNwRL5IJ9AIEx2/JUCTyMKi9dzO1PKqMz3Hzi4kqPah85gdMF15tHPTMDsPHCEh13xQUL+8olbssuKBMf+nj6VV2mZO008aKAPbG3humu7VJ1NyXMPvaSZ8y1rRm27K+EOYwtiAAutFr2uykh6fI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770665938; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=CIyH4y6swdakzfqF5GNfAEWE1iUdT0mefHf4wdhgC6A=;
 b=dhFucDFGOofiVskP+Oc8j1KY5z6Ssc1B7hh/Caf6lHs5WijaL9SPZY54dTniTNI1
 xohsvnGZxG3cAekXUwRK1CJmEgA7u+ABGlmAS6vw0Det8gTP3MYHf31bHnxGFg+TLdJ
 +4bdWT+GrFglSvBz8ByDu8fpOb0Rf2daFkyPV2xk=
Received: by mx.zohomail.com with SMTPS id 177066593561783.95808177032916;
 Mon, 9 Feb 2026 11:38:55 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Daniel Stone <daniel.stone@collabora.com>,
 Ian Forbes <ian.forbes@broadcom.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v6 4/4] vkms: Pass the vkms connector as opposed to the
 device on hotplug
Date: Mon, 09 Feb 2026 20:38:48 +0100
Message-ID: <7909080.EvYhyI6sBW@workhorse>
In-Reply-To: <b331c39f-f38b-4ff8-94f0-563dab202561@bootlin.com>
References: <20260123-hot-plug-passup-v6-0-aaaf61d960bb@collabora.com>
 <20260123-hot-plug-passup-v6-4-aaaf61d960bb@collabora.com>
 <b331c39f-f38b-4ff8-94f0-563dab202561@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	CTE_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:ville.syrjala@linux.intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:daniel.stone@collabora.com,m:ian.forbes@broadcom.com,m:dmitry.baryshkov@oss.qualcomm.com,m:louis.chauvet@bootlin.com,m:linux-kernel@vger.kernel.org,m:kernel@collabora.com,m:marius.vlad@collabora.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,broadcom.com,oss.qualcomm.com,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	URIBL_MULTI_FAIL(0.00)[collabora.com:server fail,gabe.freedesktop.org:server fail];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 73E811142C7
X-Rspamd-Action: no action

Hi Louis,

On Saturday, 24 January 2026 02:06:27 Central European Standard Time Louis Chauvet wrote:
> Hello Nicolas,
> 
> On the principle I agree with this patch, I just need to take time to 
> properly think about lifetime of vkms_config vs connector and pointer 
> validity to avoid use-after-free / null pointer dereference. I will try 
> to review it next week or more probably just after the FOSDEM.

I should've offered we could've discussed it in person at FOSDEM since
I was there as well, but I forgot. :(

> 
> In the meantime, if you want to try / think about the possible issue: I 
> think there will be a use-after-free if you unbind the driver using the 
> sysfs interface and interract with configfs interface.

I can sort of see what I think you're seeing, but the specific concern
below looks to me like something that already is a potential problem
in vkms. That is, if I understood the scenario envisioned here.

> 
> Thanks a lot for this series,
> Louis Chauvet
> 
> 
> On 1/23/26 20:44, Nicolas Frattaroli wrote:
> > From: Marius Vlad <marius.vlad@collabora.com>
> > 
> > By passing the connector rather than the device to
> > vkms_trigger_connector_hotplug, vkms can trigger connector hotplugging
> > events that contain the connector ID.
> > 
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_configfs.c  | 2 +-
> >   drivers/gpu/drm/vkms/vkms_connector.c | 6 +++---
> >   drivers/gpu/drm/vkms/vkms_connector.h | 4 ++--
> >   3 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> > index d6e203d59b45..63a27f671e6a 100644
> > --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> > +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> > @@ -554,7 +554,7 @@ static ssize_t connector_status_store(struct config_item *item,
> >   		vkms_config_connector_set_status(connector->config, status);
> >   
> >   		if (connector->dev->enabled && old_status != status)
> > -			vkms_trigger_connector_hotplug(connector->dev->config->dev);
> > +			vkms_trigger_connector_hotplug(connector->config->connector);
> 
> Here connector->config is valid, but connector->config->connector is 
> probably invalid if the driver is unbind. We may need to add some 
> refcount to avoid this kind of issue.

I'm fairly sure whatever race condition you're worried about here
already exists in the old code anyway. connector->dev->config will
have its vkms_device first released, and then the config->dev member
set to NULL, without a lock, in vkms_destroy. That vkms_device is
allocated in vkms_create with devm_drm_dev_alloc using the fauxdev's
dev as a devres group, which is the one being freed in vkms_destroy
while momentarily leaving a dangling pointer in the config struct.

There's nothing fundamentally more broken here as this already is
if the configfs can somehow persist during vkms unbind, if I
understand you correctly by what you mean with driver unbind. The
vkms_configfs_unregister() call in vkms_exit before the vkms teardown
makes me think that this isn't supposed to happen anyway; on vkms
module exit, the configfs stuff is torn down before the vkms
resources are freed.

If it is a realistic scenario and I just disclosed a potential
use-after-free that's already in the kernel on a public mailing list,
then: oops, guess this one's a freebie for the red teams.

> The other way around, I think there could be issue if the configfs 
> folder is completly removed (that possible, there is no way to forbid 
> deletions in configfs), the config object is freed but maybe used in the 
> "DRM" part of VKMS (for connector status update maybe).

Is there ever a situation where a non-root user can delete configfs that
wouldn't also be a whole can of worms in other aspects?

A more general point:

The vkms part here was only ever there so the HPD stuff can be tested
without a hardware test setup or by poking the sysfs of real hardware.
I inherited it when I took the series over, but don't use it myself
beyond testing these two vkms patches.

If I need to add some refcounting scheme to vkms connectors then I
assume this will take a few more revisions to get right. I hope the
non-vkms parts can be reviewed by those who raised concerns on the
previous revision in the meantime, so I know whether I'm making
progress here.

I'll discuss with my colleagues whether the vkms parts are something
we absolutely need. If not, I'll just drop them in the next revision,
unless there's a fairly good case to be made from your side that
they'd find use and are worth the time investment.

Kind regards,
Nicolas Frattaroli

> 
> >   	}
> >   
> >   	return (ssize_t)count;
> > diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> > index b0a6b212d3f4..cad64eff72ea 100644
> > --- a/drivers/gpu/drm/vkms/vkms_connector.c
> > +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> > @@ -88,9 +88,9 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
> >   	return connector;
> >   }
> >   
> > -void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
> > +void vkms_trigger_connector_hotplug(struct vkms_connector *vkms_connector)
> >   {
> > -	struct drm_device *dev = &vkmsdev->drm;
> > +	struct drm_connector *connector = &vkms_connector->base;
> >   
> > -	drm_kms_helper_hotplug_event(dev);
> > +	drm_kms_helper_connector_hotplug_event(connector);
> >   }
> > diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
> > index ed312f4eff3a..7cd76d01b10b 100644
> > --- a/drivers/gpu/drm/vkms/vkms_connector.h
> > +++ b/drivers/gpu/drm/vkms/vkms_connector.h
> > @@ -28,8 +28,8 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
> >   
> >   /**
> >    * vkms_trigger_connector_hotplug() - Update the device's connectors status
> > - * @vkmsdev: VKMS device to update
> > + * @vkms_connector: VKMS connector to update
> >    */
> > -void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
> > +void vkms_trigger_connector_hotplug(struct vkms_connector *vkms_connector);
> >   
> >   #endif /* _VKMS_CONNECTOR_H_ */
> > 
> 
> 




