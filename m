Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05C3135F00
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A1F6E920;
	Thu,  9 Jan 2020 17:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84196E462;
 Thu,  9 Jan 2020 17:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O3sWLg9hXmPWCaRpEux+8egZoPW0W6HONbIvuu6mIFE=; b=iZgh73mdaks3w6sVK2gpdKGd8E
 HEeg3ZiO/sVeOMs2VxQ2S8PqMBz2/oAX15QYPTXZoQu9eAsmxa4Wed0hcZGsRSZCZMpV49vtzqdtQ
 yyuoflGIhwqyPnL5VTozoaEgyKSi3H1x2NGYC7oIUgMae65s7Jb8THu6ec/CV1xxveDfhfhno3x3/
 eRoas/GgD4HaqdRSc0wxeus8ZGvDCkkmWNLIMqgZ7OlMOUDZogF1F+yCSBBum0Ab5KQlJfcj7WD0I
 W278M40RdkY5Ogg2iXGP1UnKiRFu9B1Vr5H7EJzdbTWOaIhpfT+n2gkGmu9xlObI7tSNnUlLGFoLn
 nsddFRSg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ipbNp-0002Un-F3; Thu, 09 Jan 2020 18:14:09 +0100
Received: from [24.134.37.229] (helo=192-168-0-109.rdsnet.ro)
 by sslproxy02.your-server.de with esmtpsa (TLSv1:ECDHE-RSA-AES256-SHA:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ipbNp-000Dxc-66; Thu, 09 Jan 2020 18:14:09 +0100
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [RFC PATCH 0/4] Support for out-of-tree hypervisor modules in i915/gvt
Date: Thu,  9 Jan 2020 19:13:53 +0200
Message-Id: <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25689/Thu Jan  9 10:59:33 2020)
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
Cc: Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 hang.yuan@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhiyuan.lv@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These patch series removes the dependency of i915/gvt hypervisor
backends on the driver internals of the i915 driver. Instead, we add a
small public API that hypervisor backends can use.

This enables out-of-tree hypervisor backends for the Intel graphics
virtualization and simplifies development. At the same time, it
creates at least a bit of a barrier to including more i915 internals
into kvmgt, which is nice in itself.

The first two patches are pretty much general cleanup and could be
merged without the rest.

Any feedback is welcome.

Julian Stecklina (4):
  drm/i915/gvt: make gvt oblivious of kvmgt data structures
  drm/i915/gvt: remove unused vblank_done completion
  drm/i915/gvt: define a public interface to gvt
  drm/i915/gvt: move public gvt headers out into global include

 drivers/gpu/drm/i915/gvt/Makefile             |   2 +-
 drivers/gpu/drm/i915/gvt/debug.h              |   2 +-
 drivers/gpu/drm/i915/gvt/display.c            |  26 ++
 drivers/gpu/drm/i915/gvt/display.h            |  27 --
 drivers/gpu/drm/i915/gvt/gtt.h                |   2 -
 drivers/gpu/drm/i915/gvt/gvt.h                |  65 +--
 drivers/gpu/drm/i915/gvt/gvt_public.c         | 154 +++++++
 drivers/gpu/drm/i915/gvt/kvmgt.c              | 413 ++++++++++--------
 drivers/gpu/drm/i915/gvt/mpt.h                |   3 -
 drivers/gpu/drm/i915/gvt/reg.h                |   2 -
 include/drm/i915_gvt.h                        | 104 +++++
 .../drm/i915_gvt_hypercall.h                  |  13 +-
 12 files changed, 537 insertions(+), 276 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gvt/gvt_public.c
 create mode 100644 include/drm/i915_gvt.h
 rename drivers/gpu/drm/i915/gvt/hypercall.h => include/drm/i915_gvt_hypercall.h (92%)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
