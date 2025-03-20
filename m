Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CE7A6AD2C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700BE10E67F;
	Thu, 20 Mar 2025 18:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AGyOQIKd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77B410E292;
 Thu, 20 Mar 2025 18:37:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 72A84A495E8;
 Thu, 20 Mar 2025 18:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC19C4CEDD;
 Thu, 20 Mar 2025 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742495829;
 bh=BBzom5KPeccTnXsdpkiEBIRudxkrgxYEmwoQ3aepKSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AGyOQIKdAc1rFpcOy9Gpww4dvvQnWsmLMPTT1w9XupOY9pm9nl+WCZxTH1TrwX5/N
 kIAw+19jDWPzJPSdb1pVemHP0LSuVHomkSuQ2s4dlzf/XFAjo6jOafI3iXOx4u8bGU
 CLL+iuCb5lhy8FAJMnkBOYb/Vwod7YRKHrn9ftE6fBLwm31rzJCYQE6++ctMjOcOZO
 Q56+wQf00HnXTK48Lz38A8HBLhSEc2uqUmnWGYZFbfRd7bXtwFBAmBMt8nAsaMUTCq
 ALBlmhNeKaTmJ5iMar2smi2pfR/rinX/y15t74xY+pPPdMOV7Ezzk0GATAr82UZMvi
 ovUsDu8xtMetA==
Date: Thu, 20 Mar 2025 19:37:05 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Mel Henning <mhenning@darkrefraction.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
Message-ID: <Z9xgUY8YBTRuVHdm@pollux>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9xb5SABWcwYnV-x@pollux>
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

On Thu, Mar 20, 2025 at 07:18:13PM +0100, Danilo Krummrich wrote:
> Hi Mel,
> 
> On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
> > +int
> > +nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
> > +{
> > +	struct nouveau_drm *drm = nouveau_drm(dev);
> > +	struct nvkm_device *device = drm->nvkm;
> > +	struct drm_nouveau_get_zcull_info *out = data;
> > +
> > +	if (device->has_zcull_info) {
> > +		*out = device->zcull_info;
> 
> This needs copy_to_user().

Sorry, had the wrong context, drm_ioctl() should already take care of that.
