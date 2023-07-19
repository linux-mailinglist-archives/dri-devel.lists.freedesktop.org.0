Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F2F75A22A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 00:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D415910E12A;
	Wed, 19 Jul 2023 22:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-3.mta1.migadu.com (out-3.mta1.migadu.com
 [IPv6:2001:41d0:203:375::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C16E10E12A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 22:44:52 +0000 (UTC)
Message-ID: <74994ce2-c060-f662-9210-14d09a15162f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689806688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjbO79xlLNloGHqzkmh/GrwE5dqq196RqzVZxz+HQuY=;
 b=tyL+5EjVO88fUgTXUzZJvKY+JfMezNTNqLlky4Key7ELBF1/bJEXZwIzwfXEU5giFkbOHo
 bs2sLXFvTbu5KRkClnah41uJLYUoPnho/GiocT6aPhwta72XhksZVZ/iUoXF/ZG9ZHo7Cc
 K41KgUorxkZsDqez3UfEW48aM4qvmjI=
Date: Thu, 20 Jul 2023 06:44:29 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v3 4/9] PCI/VGA: Improve the default VGA device selection
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>, Bjorn Helgaas <helgaas@kernel.org>
References: <20230719193233.GA511659@bhelgaas>
 <f87a48c6-909e-39ba-62b0-289e78798540@loongson.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <f87a48c6-909e-39ba-62b0-289e78798540@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-fbdev@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 intel-gfx@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/7/20 06:32, suijingfeng wrote:
> it will be works no matter CONFIG_DRM_AST=m or CONFIG_DRM_AST=y


It will be works regardless of CONFIG_DRM_AST=m or CONFIG_DRM_AST=y.

When vgaarb call to the device driver, device driver already loaded 
successfully.

and the PCI(e) device emulation already finished.


So the last change the vgaarb gave us to override is actually happen 
very late.

But it will be happen as long as the device driver get loaded successfully.


