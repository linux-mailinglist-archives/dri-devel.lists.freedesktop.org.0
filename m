Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA2D74FD1C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 04:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0FD10E47F;
	Wed, 12 Jul 2023 02:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1976210E47F;
 Wed, 12 Jul 2023 02:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1ikivZ36R/uE4X28CUyULfRVxQJ2/mOsUaWRxJg8zPg=; b=BujmYURi3OAbwaG7VDTW1FPXFZ
 Wcfmx8Wmt7XP+Dtt4zu95ZMEskptXJflbFKX+REjkGnlw0Bpa3ON8Zv2yOQMfTL8L+M9TG7cYcqj1
 X1AMmyk67xkOGZfAkpA9ZN276NgiKrvIBZZoP882HdJGN/RioK7B6Hc4/ILWkTMqjgWAPxWsfcPOC
 TZYzwQLsTAAJM1f92PN7qwKyjf2JMPSde+oy7i0dwx+6rexI+lhHV0IgqeVsQm4Shf1MI9poutBT7
 mNAUpVx2EG4G19r3/akm3UySDKbU5vwq9FuYLjY8iBVb5PwEc72eocIXm8JLFsvxOqOOAXfRB9nSX
 SyzRYWTg==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qJPiz-00GH5s-2o; Wed, 12 Jul 2023 02:37:05 +0000
Message-ID: <b5ebc891-ee63-1638-0377-7b512d34b823@infradead.org>
Date: Tue, 11 Jul 2023 19:37:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: scripts/kernel-doc does not handle duplicate struct & function names
 (e.g., in amdgpu)
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[just documenting this for posterity or in case someone wants to fix it.]

In drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c, one can find both

struct amdgpu_vm_tlb_seq_cb {...};

and
static void amdgpu_vm_tlb_seq_cb(...)

Of course C has no problem with this, but kernel-doc reports:

drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:833: WARNING: Duplicate C declaration, also defined at gpu/amdgpu/driver-core:115.

And of course, if the name of one of them is changed, kernel-doc is all happy...
not that I am suggesting that one of them should be changed.

I just want to make people aware of this. (or maybe people are already aware of this?)

-- 
~Randy
