Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0C1B2F7B1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7F910E2FE;
	Thu, 21 Aug 2025 12:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fkb7eDh4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172CC10E2FE;
 Thu, 21 Aug 2025 12:18:36 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-afcb78da8a7so141357366b.1; 
 Thu, 21 Aug 2025 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755778714; x=1756383514; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8gvnVtPuDeVRwkHWJ+lsQaKYEu509p2WMuBoS0uoPnw=;
 b=Fkb7eDh4i7Tr2jWGn+hUq8eW+nhJwwNAwOyfA4n24pNRZ2WcxWP/+BMN2fm/+7n1Vv
 AbjbTD9qEusvfTGwJ9pceLB/yfOmWPk2Tah+Zj8e7DsNyY8/lK1egzLgd56cBMlK7lT2
 fVbdR0rVb3CKc/4cYTy/FHf3O7I+tF6AHCTV6AxC0iE1rkQDQLfhp95OfXpsGCFVahVS
 JtHTAQN43kGSjWcZuoE6xRm7jmuhGPEj193OVg+BAVTTVVPqa7nWyEuMxh88BUNCq02j
 QUXDfW6x/6hquAH+cRscfkqok/OCxavxknhXswP+KOe2nefNHEADWFg4jGbp8OSQrMNC
 lNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755778714; x=1756383514;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8gvnVtPuDeVRwkHWJ+lsQaKYEu509p2WMuBoS0uoPnw=;
 b=l3pyuouYQQl+F2F6z5LARjqqkhusJmPMHGX0L6Nj9Wd8/zOnYRMDt1zKww4F7KnEYY
 ZJup5UngT/czLE28JtCkco5vD5cmXf+kaNID1DgqetjXz1q179TxZgCAZdB4yZwJ0cm5
 9JdNRtotMjrSQgTPBQPX8g1+xIN3aekQNj4M6KJfUrMENjhkcdin36AqWkHdDAN77yZ8
 2sJWGBROJnppkGY2Cn4/E+ObJtOQCZ0xgZa+TwnclqCy17fBqPjh77Pmh9E8rLYws83c
 NiUBqRibXR26G+C/nSpvIck+AXr1ZGARaeLmm/SrVxkXd15vg2z/REDCHDs72gbs1kp8
 yuHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUycAe+FV+1t4E76j50Y7b/y0UpM9C6xTu5+QlfFehw0icZAT9Vgx39U0ZUS33JNzzpINTmX0FU@lists.freedesktop.org,
 AJvYcCW5xEnhYlazbHvoIHCeqcXackCiXBU1Fp6d/+/dLmWr4KKSKkJLnBgWO30BhDCb214cyCc+iuBNARSh@lists.freedesktop.org,
 AJvYcCWEYsvibKFfVy7ZGud2oYotFWLnVfirKicd0DXGfk71RVSK7q+c5y43ywRn+5S4kQ4NZaAtHOnn7lUsbSd34g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC6bwkcy0vzQVDcrCovXPGmzCJ8KXJzhpO4xHWIvnN06idfxK0
 wAZA9wHQns8tAEGV51fwanTV0ak64qIsKwbSOSZsw3XVnXmPkLaI5dQWfTc5F9dbZ8c2ZjrSE6q
 ElG0VYB91KiGJWNLEYo/zHTo06AAYC/8=
X-Gm-Gg: ASbGncvJ3I7/MAVOjsLpmIyjJsJOhZb6NfFvLxlEK0uRXiHl8slqPqeXYIPkQhF8QLw
 T4HY5JtVXoBOf4Kt1+Va1UmBM3io6PfCZrVJjB1IcpyV51GCubc7uzZONU1ChCnenY39qTk0v+M
 fIXWjW+bH4z2tflU/aqCHkSBvVWzQoyrY161+07nG9ACyLBYAaV5xjVMeJuHl+7zjVL95HCEEvm
 VrDSjuThJKEIis1KwDhvPv6Gfb7zCYJrbFtY9oQPAluzKdLEFxi
X-Google-Smtp-Source: AGHT+IFvy+yYv52L7K1uoUHRrZkGMeN0/je1OaNi3qH+IRYdlFgxHqgh/BwnDh9DP2pLFnXQmvGhLOp0ihdwBA49/5Y=
X-Received: by 2002:a17:907:6ea5:b0:af9:479b:8caf with SMTP id
 a640c23a62f3a-afe07c2cb96mr207477366b.51.1755778714321; Thu, 21 Aug 2025
 05:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-36-alex.hung@amd.com>
 <DC6IG8LQAIF4.6KM7AM5JD3J3@redhat.com>
 <f3061c6f-5a73-4890-92b0-90f153e8dcc0@amd.com>
 <DC7IDWLAGEOW.HQVRVJNBTLXI@redhat.com>
In-Reply-To: <DC7IDWLAGEOW.HQVRVJNBTLXI@redhat.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Thu, 21 Aug 2025 14:18:22 +0200
X-Gm-Features: Ac12FXwW9OQ335wgyGuumLyW6QXyY_7nwDU0vHlhJ7ra3fV3Sp6_aN9HkujANJ4
Message-ID: <CAFZQkGxxf2w+x4xZ-aY5YDnuS14Ys-gi=zro0Z4BE2RJESLoYQ@mail.gmail.com>
Subject: Re: [PATCH V11 35/47] drm/colorop: Add 1D Curve Custom LUT type
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
 nfraprado@collabora.com, Daniel Stone <daniels@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

> Yes! I would prefer "SIZE" as I can see other color op types which use
> the "DATA" prop to require this as well.
+1, no need to make it specific to luts.
