Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F03E764816
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D95210E4EF;
	Thu, 27 Jul 2023 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327D710E0DC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 05:22:10 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso566431f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 22:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690435328; x=1691040128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zu+TPu8vc5z407cLLTcD0tM3SAh82DPnoPRhY7CjDH8=;
 b=BTJaFlWMXhbYZaQanG+xg4emhc+hhhvUk47ZrMZ0EiTYhk9s7YgWF3qPS07zTSRkne
 wI54D260XhItT6aZ+NgVdCFLFrj/v4mZwR237D27dclMwsLp/mRBsKsHVtHHMq6QWNHo
 xvJiMlY2tfsmswEeyr8Xm78xl5Ti5xcRpPV3YYf8pCYvs0gb0cdp20btX2xU+ZiY5aAn
 Gbk+gryvRkILcxZPiZxVXvuxUoV03e0caxrTw1jgrTYAI6HCjPOfW0X+SFE/gf3USUAZ
 5oExijmaJEIcrhcgl3PUATRtathZGlZMayplGCslIHRHEioTMID1bsxe6/8izyNIIz91
 5Srw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690435328; x=1691040128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zu+TPu8vc5z407cLLTcD0tM3SAh82DPnoPRhY7CjDH8=;
 b=aJl60GM7t/rFPCYaF/Gn7LmLJJtGjonyzBSxilgKOFXItE4jtLHOOVsaKArF9KA3ij
 i6oVHJg4Jvt0I1YUt7YiV/fu1htHQYbiJT/MrTkQ6ytRXxAAHWw8tXkrwmsCqeDtZk4E
 myfxhFNdqYfarqeCcJ4YD2BIE6U6CDfS4e4by8aIDynv82PeHmpdeWrJiuNfc2Ppo+n3
 WsNRY+G+Qgh3fVcvUSYOKZZpJtzYJKBJjRsaAlFTwEz76RIK1BZfScGRVo4tCwmR5GKJ
 oJVSMzc4Ymqw2ye/6Mo/0iX93YW7m9QYHnbdcioe09BjBQ604+8Vf+lMxplvOLkL4WU7
 QTEw==
X-Gm-Message-State: ABy/qLYbYlDZURWDZ2hd9VVTQHkHODjGEaowXIs1Nk0SHuhm51qGq/Gg
 h67oyBniALWDovK+XJHteDPGB3FBi3R8Hixg6k0=
X-Google-Smtp-Source: APBJJlHKb/e5eTfcqSQ09CINh7JgQDQGk6myc+uS3OwL7JKK7UjH9Y66gbVO3meh6qK4rCcDgrU39buz7Ga9b73gWWE=
X-Received: by 2002:a5d:6e42:0:b0:314:21b:1ea2 with SMTP id
 j2-20020a5d6e42000000b00314021b1ea2mr819278wrz.39.1690435328409; Wed, 26 Jul
 2023 22:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230726181322.26754-1-dg573847474@gmail.com>
In-Reply-To: <20230726181322.26754-1-dg573847474@gmail.com>
From: Chengfeng Ye <dg573847474@gmail.com>
Date: Thu, 27 Jul 2023 13:21:57 +0800
Message-ID: <CAAo+4rV1GKrzo77Sum89n6ysDyhVhzrM2OX-ADk9AOrFkZfQow@mail.gmail.com>
Subject: Re: [PATCH v2] scsi: lpfc: Fix potential deadlock on &ndlp->lock
To: james.smart@broadcom.com, dick.kennedy@broadcom.com, jejb@linux.ibm.com, 
 martin.petersen@oracle.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, justin.tee@broadcom.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 27 Jul 2023 07:11:21 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for the interruption, I just notice that the ndlp node
inside timer does not share with that of lpfc_cleanup_pending_mbox().

This is a false alarm and sorry again for this.

Best regards,
Chengfeng
