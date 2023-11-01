Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10417DEE3B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 09:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9045410E827;
	Thu,  2 Nov 2023 08:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 906 seconds by postgrey-1.36 at gabe;
 Wed, 01 Nov 2023 12:51:01 UTC
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu
 [31.186.226.237])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A5810E0A2
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 12:51:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1698842150; cv=none; d=zohomail.eu; s=zohoarc; 
 b=Un61c349E0VZVnT+x+fMzpqsGysU3B9HdRSMNiCGD2eVKGpARbfitSE5LPTTWJix0kdgQLYWTeutPNRuFU9vfu6z6r053saU05jR6SM8AJthw9Yf0Z/Wd5gPgg0wYx89O4jVk7EUicfcgvKqRtDdPS3kYgHvi5a6w2rDaIf2Vk0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1698842150;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Owj+mXdGILdMjrSzoqOSKr2JpK848tlEK4LY5T0/yoY=; 
 b=EIrhU6LOOHw2RPmrkWaN56lZkGt0NcqlS+4FBMnF4cZeD2NtFp9r2GpA4iKJ0PFXpJ9jUDOJ14vN2z1xHUKWIepGI0Bu0IBAuiPH5QAy2G2VZTAnwquCEwjr6IE1PZR57PjpPs85V6Nvj6Al47AQ43tXo0qR73kGYlTA6jsgKDo=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 spf=pass  smtp.mailfrom=carl@uvos.xyz;
 dmarc=pass header.from=<carl@uvos.xyz>
Received: from [10.0.0.2] (ip-037-201-241-037.um10.pools.vodafone-ip.de
 [37.201.241.37]) by mx.zoho.eu
 with SMTPS id 169884214814494.9572778770256;
 Wed, 1 Nov 2023 13:35:48 +0100 (CET)
Message-ID: <47e950989fe0fc297a2272139d69a5a7c4c98de5.camel@uvos.xyz>
Subject: [BUG] gpu: drm: amd: noretry=0 causes failure in
 amdgpu_device_ip_resume on vega10
From: Carl Klemm <carl@uvos.xyz>
To: christian.koenig@amd.com, alexander.deucher@amd.com
Date: Wed, 01 Nov 2023 13:35:47 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Approved-At: Thu, 02 Nov 2023 08:35:03 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

When migrateing from 5.15 to 6.5.9 i noticed that noretry no longer
function on vega10 (Instinct MI25). The device will fail to start:

[   40.080411] amdgpu: fw load failed
[   40.083816] amdgpu: smu firmware loading failed
[   40.088350] amdgpu 0000:83:00.0: amdgpu: amdgpu_device_ip_resume
failed (-22).

I have also repoduced the same issue on 6.1.55
It is also possible that the issue was caused by newer gpu firmware,
instead of the change in kernel. The issue was repduced with the
firmware from linux-firmware-20230804.

for full dmesg see: https://uvos.xyz/noretry.dmesg.log

The same system also contains 2 vega20 and 1 navi21 device that both
work fine with noretry=3D0. For more information on the system this
problem was encountered on see this rocminfo dump:
https://uvos.xyz/rocminfo.log

Regards,
Carl
