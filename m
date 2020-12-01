Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635B92CB6CC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E496EA27;
	Wed,  2 Dec 2020 08:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3491D89F2D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:24:40 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kk4hy-0001m8-EW; Tue, 01 Dec 2020 12:24:38 +0000
To: Sam Ravnborg <sam@ravnborg.org>
From: Colin Ian King <colin.king@canonical.com>
Subject: re: video: fbdev: sis: Fix set but not used warnings in init.c
Message-ID: <575ea853-5a18-0a7c-a84b-0136ecf2cc90@canonical.com>
Date: Tue, 1 Dec 2020 12:24:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Static analysis on linux-next with Coverity had detected a minor issue
in the following commit:

commit 2a74e8682a39d00e04ca278459ae7d7ecbdfb394
Author: Sam Ravnborg <sam@ravnborg.org>
Date:   Sat Nov 28 23:40:55 2020 +0100

    video: fbdev: sis: Fix set but not used warnings in init.c


The analysis is as follows:

2659   if(SiS_Pr->UseCustomMode) {
2660      infoflag = SiS_Pr->CInfoFlag;
2661   } else {

Useless call (USELESS_CALL) side_effect_free: Calling
 SiS_GetResInfo(SiS_Pr, ModeNo, ModeIdIndex) is only useful for its
return value, which is ignored.

2662      SiS_GetResInfo(SiS_Pr, ModeNo, ModeIdIndex);
2663      if(ModeNo > 0x13) {
2664         infoflag = SiS_Pr->SiS_RefIndex[RRTI].Ext_InfoFlag;
2665      }
2666   }

.. SiSGetResInfo() just returns an unsigned short and this returns a
values is not being used. The function does not side effect anything, so
it does look like a redundant call. Is this intentional?

3044 unsigned short
3045 SiS_GetResInfo(struct SiS_Private *SiS_Pr, unsigned short ModeNo,
unsigned short ModeIdIndex)
3046 {
3047   if(ModeNo <= 0x13)
3048      return ((unsigned
short)SiS_Pr->SiS_SModeIDTable[ModeIdIndex].St_ResInfo);
3049   else
3050      return ((unsigned
short)SiS_Pr->SiS_EModeIDTable[ModeIdIndex].Ext_RESINFO);
3051 }

Colin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
