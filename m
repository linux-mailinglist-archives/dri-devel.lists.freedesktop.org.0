Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF7BA3C802
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 19:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34A710E875;
	Wed, 19 Feb 2025 18:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="rM6V8mIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D8B10E875;
 Wed, 19 Feb 2025 18:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=L5WGFmXWxv8pA5EOewvbdQPbbCGMk3EWAoJOp6XJsCg=; b=rM6V8mIhLRachUtQ
 g3uMPjIv/QIaj+i1PkN+eBmdhbBOOrfwgGLepdbjGekpQ3Q1XdVrACDr+hysrnHw7DlaEsURTM1aL
 6kAcCx5Ta79sL+AQ4XsYZKGRD81ZoiFlfgDS12mr6O2JL3Y9M7hzynq1WE9BUFXsDL2iRDXqqWRBF
 XmzKdJq7rQKPUciQQ3jmgB1wkQKhMo1I6nJSfi23tmILvAhY2iEIXM/OZARWIJX5q59y4MWisJV9j
 VXMbG9EKQojTz18WiE298l5jY1U8lck5FQhF0gheeypsjB+43jFAmt5n8NWFzmdbMWUGOXaX506Lq
 nk1I9eHwHNAi3xmvIg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1tkpC4-00GyQj-0S;
 Wed, 19 Feb 2025 18:53:12 +0000
Date: Wed, 19 Feb 2025 18:53:12 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: alexander.deucher@amd.com, Hawking.Zhang@amd.com, Likun.Gao@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: missing wire up of nbif_v6_3_1_sriov_funcs ?
Message-ID: <Z7YomFgEdOZzIyun@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 18:43:08 up 287 days,  5:57,  1 user,  load average: 0.00, 0.02, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

Hi All,
  I think you may be misisng some wiring of nbif_v6_3_1_sriov_funcs.

  My scripts noticed 'nbif_v6_3_1_sriov_funcs' was unused;
It was added in:
  Commit: 894c6d3522d1 ("drm/amdgpu: Add nbif v6_3_1 ip block support")


and is:
drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c:
  const struct amdgpu_nbio_funcs nbif_v6_3_1_sriov_funcs = {

but, it's not referenced, which makes me think it perhaps
should be in:
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c

I see for 4.3.x there is:
  case IP_VERSION(4, 3, 0):
  case IP_VERSION(4, 3, 1):
    if (amdgpu_sriov_vf(adev))
      adev->nbio.funcs = &nbio_v4_3_sriov_funcs;
    else
      adev->nbio.funcs = &nbio_v4_3_funcs;
    adev->nbio.hdp_flush_reg = &nbio_v4_3_hdp_flush_reg;
    break;

but for 6.3.1 we have:

  case IP_VERSION(6, 3, 1):
    adev->nbio.funcs = &nbif_v6_3_1_funcs;
    adev->nbio.hdp_flush_reg = &nbif_v6_3_1_hdp_flush_reg;
    break;


so is that supposed to have something similar?

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
