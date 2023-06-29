Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2717429F7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 17:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A6810E3E9;
	Thu, 29 Jun 2023 15:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70A310E3E2;
 Thu, 29 Jun 2023 15:54:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 54A82614DC;
 Thu, 29 Jun 2023 15:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28680C433C8;
 Thu, 29 Jun 2023 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688054078;
 bh=L6FQS4d7vn+9QEms0SfAm1VLkLjV+bIazDI0tjMBu5g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=k8QvCfS9YYp1B+ART94SdyS5GCq+kzg+y0GcPPcxH+Mz9b1I4fFjWlHyii0LCx/Zb
 6oqHcWtiuE3GTIm5ZtGtpI5GJoj+Uki8akhd/tLN8XIvFLJ4vCNRMSzWFjh3vcU96P
 F6nnnWDIE4ZC6jcq+iQOB7KR1kmI5HAuZgfRETPIGLrJefP/K7dQk2FX6jv6Do9o62
 6dFS9sWsPtWknyZX4osw36zBl8rdJv7ce0BtqwOjDubXmJlfxwaLWPMCaZA0PiKewB
 /QBRqLcnYPOwgUGemUscA0GTUkIR0SFl9qk65pBR8RcIQJ0ANd+rxatzb7VXpj8G2x
 dcnTEBewzlWmg==
Date: Thu, 29 Jun 2023 10:54:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v7 6/8] PCI/VGA: Introduce is_boot_device function
 callback to vga_client_register
Message-ID: <20230629155436.GA397963@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dd961ae-78a7-0b67-af51-008ecbcdbbef@loongson.cn>
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
Cc: linux-fbdev@vger.kernel.org, Pan Xinhui <Xinhui.Pan@amd.com>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 Lijo Lazar <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Yi Liu <yi.l.liu@intel.com>, Karol Herbst <kherbst@redhat.com>,
 amd-gfx@lists.freedesktop.org, Sui Jingfeng <15330273260@189.cn>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, intel-gfx@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 22, 2023 at 01:08:15PM +0800, Sui Jingfeng wrote:
> Hi,
> 
> 
> A nouveau developer(Lyude) from redhat send me a R-B,
> 
> Thanks for the developers of nouveau project.
> 
> 
> Please allow me add a link[1] here.
> 
> 
> [1] https://lore.kernel.org/all/0afadc69f99a36bc9d03ecf54ff25859dbc10e28.camel@redhat.com/

1) Thanks for this.  If you post another version of this series,
   please pick up Lyude's Reviewed-by and include it in the relevant
   patches (as long as you haven't made significant changes to the
   code Lyude reviewed).  Whoever applies this should automatically
   pick up Reviewed-by/Ack/etc that are replies to the version being
   applied, but they won't go through previous revisions to find them.

2) Please mention the commit to which the series applies.  I tried to
   apply this on v6.4-rc1, but it doesn't apply cleanly.

3) Thanks for including cover letters in your postings.  Please
   include a little changelog in the cover letter so we know what
   changed between v6 and v7, etc.

4) Right now we're in the middle of the v6.5 merge window, so new
   content, e.g., this series, is too late for v6.5.  Most
   maintainers, including me, wait to merge new content until the
   merge window closes and a new -rc1 is tagged.  This merge window
   should close on July 9, and people will start merging content for
   v6.6, typically based on v6.5-rc1.

Bjorn
