Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8139D8CB012
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 16:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F66F10E107;
	Tue, 21 May 2024 14:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMIqdDfC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8F910E107;
 Tue, 21 May 2024 14:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716300557; x=1747836557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PbuHF+YF9FDJgyPapBo2fDzs313ThRJzfqec0ed9XTc=;
 b=kMIqdDfCXuJfhailLFwtTOZFQOB4JAhfoOPtEIC1bIs1ZbHWpEjf9Kzv
 u9OCZkaiqrOLp9KkPBQE0tVT2CWQS+wWFTUccIFFwfn1qSGS+ARqH7i2O
 a3d2nenNSqvAbb9LQRaUYhMN5hDS1C29JRiP2ufXz2TOJoSLUxRBhZ4km
 POXt3hWs+mSoay5vLeFVtRDY4X1XhU9LzNy7HUl126EKNnitt9aMKbF9W
 3eQpGf9GJJ632v7IT+ml/ynTcWNUolzeePx8Gxw4zh7k/lLtdD9D3Zgrw
 vITlseaU+lHmQru0sInlKtOvbMXELTEnBkiPkBwFNRrsKcqZwdvJXnksQ w==;
X-CSE-ConnectionGUID: mgUSF0h0Rhi4VBsBYqCcrQ==
X-CSE-MsgGUID: /xGMbPf6T2OPvYhe7xQr7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12336773"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12336773"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:09:15 -0700
X-CSE-ConnectionGUID: gbFKsSm5QSqVfsXS+TxnSw==
X-CSE-MsgGUID: o/Oyoh1RQHiShv1Myuqpqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="32793388"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:09:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Oak Zeng <oak.zeng@intel.com>
Subject: Re: [PATCH v5 0/8] drm/xe: Per client usage
Date: Tue, 21 May 2024 07:09:19 -0700
Message-ID: <171630031401.152025.4004602891560484893.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517204310.88854-1-lucas.demarchi@intel.com>
References: <20240517204310.88854-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 17 May 2024 13:43:02 -0700, Lucas De Marchi wrote:
> v5 of of https://lore.kernel.org/all/20240515214258.59209-1-lucas.demarchi@intel.com
> 
> Add per-client usage statistics to xe. This ports xe to use the common
> method in drm to export the usage to userspace per client (where 1
> client == 1 drm fd open).
> 
> However instead of using the current format measured in nsec, this
> creates a new one. The intention here is not to mix the GPU clock domain
> with the CPU clock. It allows to cover a few more use cases without
> extra complications.
> 
> [...]

Applied to drm-xe-next. Thanks everyone for the reviews and contributions.

[1/8] drm/xe: Promote xe_hw_engine_class_to_str()
      commit: ab689514b6ac518ef6e88afa245b834b0dae15a5
[2/8] drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
      commit: bd49e50d81b543e678965118a86958d87c045c73
[3/8] drm/xe/lrc: Add helper to capture context timestamp
      commit: 9b090d57746d965684f53a1aefcb363bab653ad3
[4/8] drm/xe: Add helper to capture engine timestamp
      commit: f2f6b667c67daee6fe2c51b5cec3bb0f1b4c1ce0
[5/8] drm/xe: Add helper to accumulate exec queue runtime
      commit: 6109f24f87d75122cf6de50901115cbee4285ce2
[6/8] drm/xe: Cache data about user-visible engines
      commit: baa14865529bf1f3c12dc6145bd9109ef289e038
[7/8] drm/xe: Add helper to return any available hw engine
      commit: 6aa18d7436b0c11f7e62fd6cdb707eaeab1dc473
[8/8] drm/xe/client: Print runtime to fdinfo
      commit: 188ced1e0ff892f0948f20480e2e0122380ae46d

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
