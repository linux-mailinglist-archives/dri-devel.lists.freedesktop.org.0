Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C22F7DEBFD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB9310E802;
	Thu,  2 Nov 2023 04:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EE010E802;
 Thu,  2 Nov 2023 04:46:29 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9c603e235d1so68632166b.3; 
 Wed, 01 Nov 2023 21:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698900388; x=1699505188; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lly96fwYzj9dyrjYI20I++tfUGe2kjS+ATbpaoIUCkk=;
 b=ZMzKc+oIDNHQz+KxS3dF20ptSCZbK8AciQozCf4stsEJxYANHnjhWkqWcZ2t7NrbQu
 SetUPfYgjOCVpy06c4K/OlhtA3rFEPo9YOpR31F0R/2FdCbzX5aj5IiTBK1Nb1Xnycwa
 1i4p4s8WCOOvhxXHz5OJwlRKjwj+X9KZWWms2QrRxlZqb75iDhJdSyb93yS9xTOvxoVJ
 qEXoe7vorO6tpH3MHbN00SXh1dYr6qvt9Mpes6z5PJNeiMHNe4ymI6KyL/cqyKNOk8X2
 2w7gGPIQlJACHHmsDFsybTYcdpGEeG5T0tncAJF4Wp2sAEQqbqKLUF7BK7m1OOWtmgk4
 tAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698900388; x=1699505188;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lly96fwYzj9dyrjYI20I++tfUGe2kjS+ATbpaoIUCkk=;
 b=El8b4IhLONTPqItyZE2IUtPfS9xJ5E1htwqAfMa8CZdlTmL+WBu+hbvXXfDC1xO0OH
 3mzx+1KHcqnj7fjuiAn3nhyrU4Tpyd8FEM1lkiWTvRkHsFuJJHuw1aU7YmMCKLQ+voHb
 cf6Z32e1UGKePeItEjDkGMKpJRI/jTHzBJfw0EF64l3+xnHymIRVSyblcoQDN9wjakj3
 Gt32yK1dneC53BMDRExMn//1u79+WAd8DwKlCETZovNsjElSuXhiquikQ+BlsL2VBCPm
 8NXLsN/9y3WUB1RVcOZ8c7DbCyw0l86pJWY9U6dOg/g4YjgG0wLdLFOwQTZAThuz75Gu
 jvPA==
X-Gm-Message-State: AOJu0Yx+0iWU8sjsozms5xGM7Y6t7CNgwc26dYZRFTqyqW0oB/TPWhX9
 GPwrtSGTIzOJbQh5lz+GM799RnkXcb32aLArGBE=
X-Google-Smtp-Source: AGHT+IGkqWSf4mQmPFBoVK42WimmNA6rK9CryaOzWX4lpkZQZCXNKAihrrJ+s409aIvJ2HMwO4/hG56dmimdbmuyPs4=
X-Received: by 2002:a17:907:5c1:b0:9bf:b8f7:1fc4 with SMTP id
 wg1-20020a17090705c100b009bfb8f71fc4mr3467078ejb.43.1698900388120; Wed, 01
 Nov 2023 21:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-5-dakr@redhat.com>
In-Reply-To: <20231101233113.8059-5-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 2 Nov 2023 14:46:16 +1000
Message-ID: <CAPM=9tzRPMDMiJUpMS3Kw4VtXy_nfxEH5fa++fZD=fBm=Khp1Q@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v8 04/12] drm/nouveau: make use of
 drm_gpuvm_range_valid()
To: Danilo Krummrich <dakr@redhat.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 faith@gfxstrand.net, boris.brezillon@collabora.com, donald.robson@imgtec.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Nov 2023 at 09:31, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Use drm_gpuvm_range_valid() in order to validate userspace requests.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Dave Airlie <airlied@redhat.com>
