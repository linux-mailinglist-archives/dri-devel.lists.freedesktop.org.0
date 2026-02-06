Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNBjGhvvhWlvIQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:39:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6547FE469
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68BC10E742;
	Fri,  6 Feb 2026 13:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pfmVPQYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DA010E742
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:39:35 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id
 ffacd0b85a97d-43626796202so1371560f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 05:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770385174; x=1770989974; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f2Y5EKTAj1q05PpGAjFSHOf5Y6g6+lSOxl9Mg+wxTgo=;
 b=pfmVPQYkVBRXX1ryasMbGwWZqRvKKz3odRf/WfVjmyEKZ8cvwYeImv+dGN81atFlq9
 UGZSD2qOGzwooM8oLjdXueRzKrme1eFRnxSplKnbbVMSq2vnBQe6oB8ro+NcUZNbPi+0
 OJBrLcPg0bO3/o6/82+YTdQGf/Tl482IXex0EpinX/zwQbEKLc9gzjDl3YetZo8vSNVn
 2uyESt0MQdqEZN+4aYESsqsm7cfD2WKaN5vtk1znQKa6jkWOsMkRw7Xw4LF+LBZ92k7M
 OobvWuLWTiN9lGqvTk8YVXWpFeMmlCmXX5L3JtRoMhmcOb+O3Lgg39ncG42c4jglPh+2
 UHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770385174; x=1770989974;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2Y5EKTAj1q05PpGAjFSHOf5Y6g6+lSOxl9Mg+wxTgo=;
 b=ELoxnhfzUq3CfG5bcG852SptssePnsQ31KfHcufWm5tc7k0cMprb+qb5Sh7U4qzrYt
 MWQPgl6Lll9Zyu7Ya5wybdZ1OrjgmEtSpKPubrSJQvmPqhZQKr8f6Wmj9cjsESNMund5
 QV9r+W6lHO3qVh1YWPgbwy/lhjGcRtIrYOrqRBXSYI/7S1+aJEPUprWXFiMOgJB6hjfE
 z6MFNKmOAcoFEFnBCjU2eA5AoktHzBSImzouylitsjlyYNawW0vhPXuxt1TVOXOEn6YI
 GildvSq+oGoziXt41EZ2NKfExBtsyqcROa9mYz76qP/nfoHPK0A4cI/5GRZIkIwIrVII
 x4GA==
X-Gm-Message-State: AOJu0YwFxdZdzW7ZkLey/2EepoTTEn1v/2nmekVrH7CCcRBCkNtx5zk/
 TCy+7rlZwbGF03WVl7x1a7qvDvp3ZJFxgJLvzsIl1nlWrAFZ5o3Kd3D2p9htucnHwC0=
X-Gm-Gg: AZuq6aKV/yd3WaSe4osBcHthQdnOaezcDTtZR6APJFVyCDG2gB/eckdiCIjXfIfwRz1
 n+xnuB1zAF8UEpG5hY769nzM8gNJ1so+eq3O/6awAHF1UT3llKqmfVx3tLILW3QE7rqqfwkLbL4
 P8BoT4t11FwyhJSwsxbXWJ7YDx34Hb82MndaRdCExuWZNAIT9OaunQcny/6C09R03mGMfzbPuQH
 vvbyKY0tUnEfLCJ+HOudYEjRkXGap3Cw1dmk5dK+aJ2+9hMHRR3CE6hGYvmtoFwYgiDzEZRDtR6
 7qkzek8LvucdcPSVYaBsgN2YqH8dYcco628QlLnok8Ywsd4WlnoaEgvOQfXwXF7YNyiGbcudvjF
 tuA2kEvazbLCWNnwUSi8yqC7CqzP2brK3k1trSWtVxpsvxyocd9RYM4aQVBXh38r7WAonc73RCz
 v6psfmrjAXXbymBUuv
X-Received: by 2002:a05:6000:22c3:b0:436:1a2e:2c50 with SMTP id
 ffacd0b85a97d-436290463f5mr4978309f8f.12.1770385173659; 
 Fri, 06 Feb 2026 05:39:33 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b2110sm5804912f8f.3.2026.02.06.05.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 05:39:33 -0800 (PST)
Date: Fri, 6 Feb 2026 16:39:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandru Dadu <alexandru.dadu@imgtec.com>
Cc: dri-devel@lists.freedesktop.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] drm/imagination: Add gpuid module parameter
Message-ID: <aYXvElClUKW_DY_I@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:dkim]
X-Rspamd-Queue-Id: B6547FE469
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Alexandru Dadu,

Commit 3bf74137340a ("drm/imagination: Add gpuid module parameter")
from Jan 13, 2026 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/imagination/pvr_device.c:485 pvr_gpuid_decode_string()
	warn: error code type promoted to positive: 'ret'

drivers/gpu/drm/imagination/pvr_device.c
    475         int ret, idx = 0;
    476         u16 user_bvnc_u16[4];
    477         u8 dot_cnt = 0;
    478 
    479         ret = strscpy(str_cpy, param_bvnc);
    480 
    481         /*
    482          * strscpy() should return at least a size 7 for the input to be valid.
    483          * Returns -E2BIG for the case when the string is empty or too long.
    484          */
--> 485         if (ret < PVR_GPUID_STRING_MIN_LENGTH) {

PVR_GPUID_STRING_MIN_LENGTH is unsigned so -E2BIG is type promoted to
positive and treated as success.

    486                 drm_info(drm_dev,
    487                          "Invalid size of the input GPU ID (BVNC): %s",
    488                          str_cpy);
    489                 return -EINVAL;
    490         }
    491 
    492         while (*param_bvnc) {
    493                 if (*param_bvnc == '.')
    494                         dot_cnt++;
    495                 param_bvnc++;
    496         }

regards,
dan carpenter
