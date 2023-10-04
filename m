Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E147B98B3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 01:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6680110E0EA;
	Wed,  4 Oct 2023 23:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA0E10E0EA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 23:31:41 +0000 (UTC)
Received: from [192.168.2.166] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 52A336606F57;
 Thu,  5 Oct 2023 00:31:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696462299;
 bh=26lnEx61EXGIIi0w1zBAZ3kN/iR0ZmWQF94/gAJLqV0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gmz9h2S1WdzQEjl0hJTDzHEvAV9be1AO/NSb/MJ63l6w0AZZeFgUXVEaDsa0GfrER
 F/aBIEELg383k0lYqGm1OFHKXbFmmva/2VnO6pEnszfV2yypdOzpfGa19ETLh6j+sE
 9Y8NJsPKTlbg5bQ8M6c+RF0BUoa8a/D4OcPDEbPnnWNciVR2X2pfe9DoTO6SuQe6QV
 bt3GZZeHhPdU+pvYeyerca6MnrZ8p2yfDEJAoE8G/SNjg41Cesq1Zf+4wQQkTmssSa
 Xnpa6J4kFkec58cAa5j0uS04lbWE4Zf58Wq5X0THRBiTy5sePxn26MRRP4rpeuYkz7
 H/AR0+TQHYXDA==
Message-ID: <abc2513b-98a0-3963-4be8-9f307051c7cb@collabora.com>
Date: Thu, 5 Oct 2023 02:31:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 3/3] drm/virtio: drm_gem_plane_helper_prepare_fb for
 obj synchronization
Content-Language: en-US
To: "Kim, Dongwon" <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-4-dongwon.kim@intel.com>
 <04181690-adc2-fc30-d1b4-b6ca5b02a142@collabora.com>
 <8689536c-4760-a32b-76f4-65c022b5eadc@intel.com>
 <535626da-0958-7c42-7bc1-6f7c0f805634@collabora.com>
 <a07fc333-3481-6ab3-f22c-f64054b49beb@intel.com>
 <2d93796d-c9b6-51ed-2a93-fa1e64f9e2ea@collabora.com>
 <d86d43a4-3bb4-e0fe-a944-94cd30a18800@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <d86d43a4-3bb4-e0fe-a944-94cd30a18800@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/6/23 00:08, Kim, Dongwon wrote:
> 
> I don't believe the guest will start rendering on the same FB while host is
> consuming it because the virtio-gpu driver on the guest won't release
> the FB for the next
> frame before it gets the virtio resp for the resource flush command and
> the host (QEMU)
> will hold the response until the rendering is finished.

The virgl_cmd_set_scanout() shouldn't hold the response if you're using
SDL because frame swapping won't be vsynced. It may hold the response
implicitly if you're using GTK for the Qemu's display. Are you using SDL?

-- 
Best regards,
Dmitry

