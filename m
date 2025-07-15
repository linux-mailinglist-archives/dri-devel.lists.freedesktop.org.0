Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BD2B06995
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 00:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C08710E70F;
	Tue, 15 Jul 2025 22:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k5V+qsm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB0610E70F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 22:59:55 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-73e4a448370so1302762a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752620394; x=1753225194; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JxD59q5j7TwPEyReo+0JHxJnc1xOUi+p5HrxPKMsgOA=;
 b=k5V+qsm1BV2M3BNHfyxXijHrWjoTSaLbTrfYv8sSwcyUNZGE7VMMpndLMeMaughn9t
 qO5YLMrNcOpcToJdADSF0Klhd5+FI7bFO1nnTm7zXuk0mOM+m2QDG/bLaepLLYfvsx7m
 PlELFyIzhTEiNCuJ/avySkLEVhdRXGOTizZXvicN/DVltd0+hoarDVQZKaOdEv6TNn/m
 DKkILavmleuDI4XVvBd5iOLwaK17mvGhXIXGJHj/IhQb5R1HB76gDWqvsna6mUTcaSeU
 iehlRS0MTI0bmwT0hE8VAvItL7ZiOY6EydNMEiZ0DLn5WmanNOX7//o6pQfGkWTQia1o
 zlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620394; x=1753225194;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JxD59q5j7TwPEyReo+0JHxJnc1xOUi+p5HrxPKMsgOA=;
 b=WETSOYks09QBbnfBrICaTQGTsWWL46CYkmj4XG8oHO3S0bNkS7eTcJS89IMrL6R0Qt
 V7+cKKyLWvHquzgDlES3IHxv5SMGTXQjn1VAkUeAle5EHqVKIdNAOCHCN7qDwh01CCaM
 P0GaJdnSHgCFNeTzhZeWcpqj+GDozg82AAv0x5ngjMDXMGgC28I1jujD2f4VtUUa7hvn
 m3IytULb2FYooob/VrTJJpyQFLb/sR6VY+DCs1hwZLoKD8Q7biLhFiPDRJShgxtemakU
 Z4JSkk0zBOdJ9ng5PiTdZgPDaG0GLrJ+q2u5E0btwAyecDzGo9Xb40hj3H2A93r4iYCB
 hGyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn0WaU67/EgVvh288pz4Sg/E+zXstY267V9DK+IpvCYAUZYdT815SydIQhxLb81WHHiR7dvnQWsXk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwW/n0EpXs+JHd/VOrcRH36qNlItUKgVEyxKLFwh+tOT7ejwU9f
 qYnRIZbEQ4te7dfSLvAZlfXIKbaxOiiOxHMVurZLyitEL6uYL+QlrxBKfpKJR1Ri/rY=
X-Gm-Gg: ASbGnctwC42o9kN7qJjJsVX7MGGygWBDAiKaYUsv81QWWR4Tjis2VVM9nm38QvJzO8h
 OzOx7vR6DAL0aXdk7TFnMGAMomZN+3COpq0BorwkrwvTYYadbtk5V8CEeEPDoIizYl9W8VipgX7
 B5EfX6U2f6fPM1iXwn8bFGaP+GWv4I4JDrIzUj0PNIeLQulc+svKvEiUOsHynjj+ODolFHVdfK1
 3ckxQWftYH4Ol49d03LKeVqoR9XY3B9sr8G8sWQYyvDUOeD7diDrJL0puWT480SeSEalgw+9Ey/
 OmFUt1Kkk3ywz0zEcKcCyyLQ/T29mI0ze/uNfwA/A7AM250aQA0EAPAwp6Jp86yhE5CePz78ztE
 FIQnsID6obiGqs0CAvxQPpwBnq2Ge
X-Google-Smtp-Source: AGHT+IGyVyUsX81Tau12YsnZbGFNUOEpzY/xhYIdOgE4GcPtaUqfNxDJDY3qrBhSFwF4MoA79xDaxQ==
X-Received: by 2002:a05:6830:7311:b0:72b:9bb3:67cd with SMTP id
 46e09a7af769-73e64a8bf13mr1155076a34.12.1752620394618; 
 Tue, 15 Jul 2025 15:59:54 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
 by smtp.gmail.com with UTF8SMTPSA id
 46e09a7af769-73cf10aa35esm2518632a34.27.2025.07.15.15.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:59:54 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:59:53 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [bug report] drm/xe/uc: Disable GuC communication on hardware
 initialization error
Message-ID: <23dd9160-df79-4827-a814-99e486c08ea4@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Zhanjun Dong,

Commit b2c4ac219fa4 ("drm/xe/uc: Disable GuC communication on
hardware initialization error") from Jul 7, 2025 (linux-next), leads
to the following Smatch static checker warning:

	drivers/gpu/drm/xe/xe_uc.c:167 vf_uc_load_hw()
	warn: missing unwind goto?

drivers/gpu/drm/xe/xe_uc.c
    147 static int vf_uc_load_hw(struct xe_uc *uc)
    148 {
    149         int err;
    150 
    151         err = xe_uc_sanitize_reset(uc);
    152         if (err)
    153                 return err;
    154 
    155         err = xe_guc_enable_communication(&uc->guc);
    156         if (err)
    157                 return err;
    158 
    159         err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
    160         if (err)
    161                 goto err_out;
    162 
    163         uc->guc.submission_state.enabled = true;
    164 
    165         err = xe_guc_opt_in_features_enable(&uc->guc);
    166         if (err)
--> 167                 return err;
                        ^^^^^^^^^^^
Should this be "goto err_out;" as well?

    168 
    169         err = xe_gt_record_default_lrcs(uc_to_gt(uc));
    170         if (err)
    171                 goto err_out;
    172 
    173         return 0;
    174 
    175 err_out:
    176         xe_guc_sanitize(&uc->guc);
    177         return err;
    178 }

regards,
dan carpenter
