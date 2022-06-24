Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF48755A1C4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F068E10F0ED;
	Fri, 24 Jun 2022 19:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B2110F0ED
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=DfloOZNQZFbN9viaxAkDmHO+n3OD12kiNPo+G3nhURE=;
 b=Puzy1f/78NO8tkGx8kh+DHCL6smJx+NGWbC62BD2OcjqhO/i+Vczty6T0eizD9OvDpkO/9dW4LA99
 EGzpUGP5bRtJzREqjHkODrFrCniXDN/1AUOANVIHIt4fW6fmMeGjCGvhhY/BhNXjCfLiYrR9zkisIt
 EDBx8PZBeGExmSHu9Zm2SlHItqk7FLdkCD/C6h7872UI9AfpnbgIdab8S1ELfQYFe/BEy+mLJY0BdE
 xlK68FVIbZhlajlI8lwYUBDH9oM4lzRTJ1Euq84NRjSzc+bcuApDVFW3dYqNG+Zpi6ApF6FZEoUDzG
 T/hutGHIT+r4cySDfghYqP/XsMxI8aQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=DfloOZNQZFbN9viaxAkDmHO+n3OD12kiNPo+G3nhURE=;
 b=eRhkDMytM1aJjOJkWT9ctgMgi30ITGY7K1uNshQxf22JiEAPPrfISi+/OR34azpQm7zCHfn498R08
 OYBG8qfCQ==
X-HalOne-Cookie: 74ba9fe5b3561fc1ee16e03db5c4ae652fb3a58e
X-HalOne-ID: 6be4283b-f3f3-11ec-a916-d0431ea8a290
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 6be4283b-f3f3-11ec-a916-d0431ea8a290;
 Fri, 24 Jun 2022 19:25:35 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:25:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 06/68] drm/connector: Clarify when
 drm_connector_unregister is needed
Message-ID: <YrYPrq7sX3w5+Ux6@ravnborg.org>
References: <20220622143209.600298-1-maxime@cerno.tech>
 <20220622143209.600298-7-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622143209.600298-7-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 04:31:07PM +0200, Maxime Ripard wrote:
> The current documentation for drm_connector_unregister() mentions that
> it's needed for connectors that have been registered through
> drm_dev_register().
> 
> However, this was a typo and was meant to be drm_connector_register(),
> which only applies to connectors registered after drm_dev_register() has
> been called.
> 
> In addition, it was also mentioning that connectors are unregistered
> automatically when drm_dev_unregister() is called. This part is a bit
> misleading, since it might make it appear that
> drm_connector_unregister() applies either to all connectors, or none of
> them.
> 
> After discussing it with Daniel, it appears that we always need to call
> drm_connector_unregister() on connectors that have been registered with
> drm_connector_register(), but only those.
> 
> drm_connector_init() already mentions that it only needs
> drm_connector_cleanup(), so let's clarify the drm_connector_register()
> and drm_connector_unregister() documentation to point at each other, and
> remove the misleading part about drm_dev_unregister().
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
