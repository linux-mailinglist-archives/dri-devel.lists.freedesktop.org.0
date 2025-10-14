Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550B3BD8FEB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B857B10E209;
	Tue, 14 Oct 2025 11:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WtKkvUz2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC9510E218
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:25:56 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b90so3005964f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 04:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760441155; x=1761045955; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uiSHBqGlXIEAZvcjTP0Y/hDCrVSuK2ils+FnYn9ERgY=;
 b=WtKkvUz2W+AFK/FSzYZyWfQaq6d4IEonq61Rscu/+ienZBv1fl4bsfRcYZX7vI5J5o
 NxrOoU+CGw8JDV3mUKzv8mqX530tiOhDWVos2b1urDiyQdWBwyfZJTR63+fSicAftnYx
 ZCTJHgtm1eP7vNAxLJp1D2je0TePYRhmmtj2ksyr6FBRLBwlZeK3KtzIjHM4ENwN0v3n
 gdq15+dDx/ehnRlZH9FoHRwC1bC/Otv9pLDQb2R+iZxxESqBnn0DZduG+HdLXYmUVIuu
 rH1kHaoP5rqPHo8oo3dfFhkRNuOtbXTUIfmis+M802a6ZaXZft70U3yLegGiVbNQ2SPL
 fAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760441155; x=1761045955;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uiSHBqGlXIEAZvcjTP0Y/hDCrVSuK2ils+FnYn9ERgY=;
 b=idKOGv7cn6eayaK0kZ0TqsKGhwGvt4f2DCKKHfpjHp5DhzAOQYvTJr2MNQkquNB1Ac
 OatlJVPd00pL5rO0NPZZLpQjhiQJyFFz8Ugj7QiRFa4Moh6zXBtoSOToYaWLQihjlF/E
 MEOF/gFk3rECa1+bL43GGwmXuknxUevcFwOCGf60w9+eJaMj7PTNmJAKbUxNC2Ka1juF
 b/PoCSY453pjekH4APR9q//TlsddFbDLFLTPT3uM7h2aI+qe4L2I/5jiqlmLmEemCrod
 v2+bqIGqVZF2n7g4Xtv6t+1wpwqbnETE/6ptx22wOz7rRiwENCR3/7CEhKN715b7xlny
 E+PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1zFrN+4YF7EpU2de8mCTjA8kRIFP1ic4hGkyCMwXP80EujRsH7hqqqp68cmxR/gENdeay/O6CDyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpZtY/E1hB1UJszFcCZxk2Y/5AmY+TkpvysIF73aCAE+zWN8Bj
 ljrQtKnBvez1c/S2WInHK/jUWT5xmfxs1f45gmTjuxLqQHzUdkCalvHU
X-Gm-Gg: ASbGncuf5mEURNPbUCbN0If4m9P1iu3rq8cUf80ZoHIDzQtVuka4dBXgntZikhBY99p
 HFM0sWfAy/W3X3T5ifR5BXeDeLYTyEq9WjAVsrvQmOdtPd3s2yEP9hglvQlQijw6uU49b/q61CS
 X3gDUC46SAcR6yW8zC6z59C0KEgvPU9ir8dJG+FUPHYbCx8YdSuQloWrokvuh8jljYA++JIMEMP
 T9dEdHLGa4vhNMi0OifPgdGCs/OCoUBBWw0ZcW+CMezZvH6DmVYc5LJuj9bOmImhCaUCLqfYpeT
 Cd0a7YirnonxP9lY8Z9dmzvidX1QKZ4k5VkSsUWGz8aOsyeoc4s8Lw8QhPXW8HTODTVEcc8wwlj
 zE0rD5BMdPGTwFDz0yCaz8yuZPXoQLDDqaFHtBacU0fD8yL0ww0DW0Yj1pMRda5FB4j/Z9oL5z8
 R1oVDqeWuPuQ4JS3xE5iF3ezohmRGPIAjN8XUsYvwVCzvlF4hRqdI=
X-Google-Smtp-Source: AGHT+IEqaf50xViFqcGYgiRoMt4dwJ2xrUn7bmjBXs3Kk/pC18UdQvc3UcQNURWNwY1ZJ/f0754E/Q==
X-Received: by 2002:a05:6000:3111:b0:3ce:9872:fd3 with SMTP id
 ffacd0b85a97d-4266e7d92eemr13663773f8f.34.1760441154531; 
 Tue, 14 Oct 2025 04:25:54 -0700 (PDT)
Received: from ernest.hoecke-nb
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e1024sm23047515f8f.42.2025.10.14.04.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 04:25:54 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:25:53 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, regressions@lists.linux.dev
Subject: Re: [REGRESSION] drm/panel/panel-simple v6.17 WARNING regression
Message-ID: <kcunz2b2usmvadgrnnu65op5oi5ttblrc463twgxp5gqhnufav@eze53y23avel>
References: <hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh>
 <DDHZ5GO9MPF0.CGYTVBI74FOZ@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDHZ5GO9MPF0.CGYTVBI74FOZ@bootlin.com>
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

Hi Luca,

Thanks for your fast reply and all your work here.

On Tue, Oct 14, 2025 at 12:31:35PM +0200, Luca Ceresoli wrote:
> Let me have a look at the DRM_IMX driver, I'll try to send a series
> converting it to the new API within today.

I will gladly test, thanks!

> I recently sent a series proposing to make drm_bridge_add() mandatory
> before drm_bridge_attach() in the docs and warn if that is violated [1]. If
> you apply patch 4 of that series you should see the warning.

I gave it a quick try and did not see the warning. Some printk debugging
told me that `list_empty(&bridge->list)`, inside drm_bridge_attach, is
returning 0. 

> > However, later on, another regression seems to be introduced by
> > commit 8fa5909400f3 ("drm/bridge: get the bridge returned by drm_bridge_chain_get_first_bridge()")
> > so reverting 94d50c1a2ca3 on top of drm-misc-next does not solve
> > everything. This was tested by rebasing drm-misc-next onto (260f6f4fda93
> > plus the revert of 94d50c1a2ca3) and then bisecting.
> >
> > So in v6.18-rc1, both regressions are present.
> >
> > There, I get the following additional warnings:
> >
> > [    9.732278] ------------[ cut here ]------------
> > [    9.732336] WARNING: CPU: 0 PID: 38 at lib/refcount.c:22 drm_bridge_get+0x10/0x18
> > [    9.744608] refcount_t: saturated; leaking memory.
> 
> Not sure here, but it may well be another symptom of the same bug: the
> refcount was not initialized correctly, so it is found inconsistent later
> when trying to increase it. Let's fix the known issue and then we'll see.

Makes sense to me.

Kind regards,
Ernest
