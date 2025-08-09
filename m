Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8B8B20012
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 09:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D649210E379;
	Mon, 11 Aug 2025 07:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MTpRZ12p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E9A10E21C;
 Sat,  9 Aug 2025 19:56:50 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-61990d3392cso1744853eaf.1; 
 Sat, 09 Aug 2025 12:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754769409; x=1755374209; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8gll3lgXFy37DB8uR/XXnHpOl9ICmDLe8obySpyrfGU=;
 b=MTpRZ12pH4rDKRF2z0cLkF9gHZqd9py/mS0nGnRT4c0qm89ftcPtjRZq+wYMGSt1Cp
 0c2fjvWLzmptAHCRdORSwFR1ygmM4VD7A6hsQd1oB6q8j3gbkbiGAztLgpXE0RxuOMM3
 368LYycPNV8GbEr91uhRTg5eE0WdWjILfA4kIxBNDor8aHC/Qdv9Fo4g/Gb/h/W0brvr
 6ybEVB4YJkeE5vjec7kMZiOF+2zPRWc7mq7xwtpoFEZYX/8b5ZNca8QyUl8D+kbQR3DN
 jydjyhUOVC7wCh0S5DOck2RDzEWj3SZiGucqViZ6GuZaB/ymIOYPrLZocAY+0aWReYkL
 +p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754769409; x=1755374209;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8gll3lgXFy37DB8uR/XXnHpOl9ICmDLe8obySpyrfGU=;
 b=YWaHVjPqLEZrYEouxvK1KOtImBBGFeeeBNbtUVbWw6A25RTgS1Op7roX9Q50uwwKQi
 DXxGVm2n54smTdmM1ACon99IbTqhSX2aACNQUunTy4G6yaZrSUZ/6I70LVlweK9mKLrM
 FKFFWH8moIyZltfY8txe13YF3L37HfJ/N7UMt77zb0KP+ix1A7dY+XktK+WZRfjz795t
 CciN7kUHK8rVvysFg45M2evzfbCFlGIPVcTsDNNufXdmj7spsrftqfGcTzfyjrfCutP+
 L0krU3tIu251AcjrjBEYpWK5OWaGeJNJfuIWGGwZM0Flqg/hvCg0V1rrEMOExi3B4Us/
 fo+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwGjPmbq/zVn5EAM06xPY9eK3HL7yo/pd5Du7JLuAxX4PaCCxPR39P44Ai3DurJApikpne/opdjTobfVGwLA==@lists.freedesktop.org,
 AJvYcCUwzgiS2yPFYmSBmm7RAFRhkbqZi25G2MfXvpsN7XqcqmVvYzuJmnWq7Dgit48840oo2mkHt972@lists.freedesktop.org,
 AJvYcCVAKCr84xw01PYZc3tWfj+7KARuTNqU2GN0vxbjgvDcE3scU85w2dM2kJUfCEq0MmidH/p8LH0ukyy7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQgVRLTIyi3IelYQQes5Lnvh5s6nLHEd4n8dXHvNXrgvPqLrsZ
 2b4R9zIj3pOgXdou77DLgHDEnlQ81oM0P4RBr6W+a3mDXRdeewCAiCx7GVrnnHX7eeTE3ZCfAzd
 FCvsBZk+4aWufby1AVfgmVl9VFsXrtiI=
X-Gm-Gg: ASbGncu+cBJSedO/f58XbmFEBUTN8ccl/xkSTnjam4rv4ETjJg99mtQnkuLMJKBPoT9
 ZpkOqwKbQGgUYPs7OJs3NII67XQhtRq7OJrjdLF99KrhMsOcX85TNHlwB0X0zcsLkVucxgGB+Bk
 ZU9QvUUQTrKK18QQKPmZ4fP7OtfeXZmNxI4kKpcQDOTXiP7UiUvJkm13VpJS8iL4oy+AXW
X-Google-Smtp-Source: AGHT+IGVY/nUlst4dczdxWUyb60MlL8GfrDNQfC6tH99XlXNoHz8UN+ksLWmmhuc44mqv8IZY6PopwOqm0zGJk5/6mI=
X-Received: by 2002:a05:6871:6205:b0:2ff:8e9d:6b0e with SMTP id
 586e51a60fabf-30c21150b4amr3796518fac.36.1754769409142; Sat, 09 Aug 2025
 12:56:49 -0700 (PDT)
MIME-Version: 1.0
From: Lauren Conrad <conradlauren75@gmail.com>
Date: Sat, 9 Aug 2025 14:56:36 -0500
X-Gm-Features: Ac12FXzOfLqHlHkB3IFrClfrBjm1GZwVauQF79ZP0tie4xG8VsWlYONoV_jewQw
Message-ID: <CAO7k-1b0yq_XPfGUv6Vw1BcBkvu3cOVhw55yKTHaiwHk=z=W_A@mail.gmail.com>
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
To: alex.hung@amd.com
Cc: Liviu.Dudau@arm.com, agoins@nvidia.com, aleixpol@kde.org, 
 amd-gfx@lists.freedesktop.org, arthurgrillo@riseup.net, 
 chaitanya.kumar.borah@intel.com, contact@emersion.fr, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, jadahl@redhat.com, 
 joshua@froggi.es, leo.liu@amd.com, louis.chauvet@bootlin.com, 
 marcan@marcan.st, mdaenzer@redhat.com, mwen@igalia.com, 
 pekka.paalanen@collabora.com, quic_abhinavk@quicinc.com, 
 quic_cbraga@quicinc.com, quic_naseer@quicinc.com, sashamcintosh@google.com, 
 sebastian.wick@redhat.com, shashank.sharma@amd.com, uma.shankar@intel.com, 
 victoria@system76.com, ville.syrjala@linux.intel.com, 
 wayland-devel@lists.freedesktop.org, xaver.hugl@gmail.com
Content-Type: multipart/alternative; boundary="0000000000004b755d063bf41795"
X-Mailman-Approved-At: Mon, 11 Aug 2025 07:12:55 +0000
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

--0000000000004b755d063bf41795
Content-Type: text/plain; charset="UTF-8"



--0000000000004b755d063bf41795
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--0000000000004b755d063bf41795--
