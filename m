Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E66A26284
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 19:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0399110E14B;
	Mon,  3 Feb 2025 18:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="smnCGuOB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="BC98GYkI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="ajmjCBND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1040 seconds by postgrey-1.36 at gabe;
 Mon, 03 Feb 2025 18:32:28 UTC
Received: from fallback1.i.mail.ru (fallback1.i.mail.ru [79.137.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8165C10E14B;
 Mon,  3 Feb 2025 18:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=D7JRFzFEare/oFNaQJiakwJpq4E0pQkd2/w9tDmKTqw=; 
 t=1738607548;x=1738697548; 
 b=smnCGuOBjGZjt4HkkWlP9Yb/VQ4lbjUYF2AZ051PcwYeVxnVnsTfRQcbBkstFYTn4NvA0kNTvc0ryxFN7KQeB0Cjejs8tBRcLrqld+lig6mrjxnJ8oS642C1A6VMPPLYEXdV9qGXO723lSzn0jj+qvy/6mHE2JGT9xbKBxabM+c=;
Received: from [10.113.26.107] (port=52868 helo=send262.i.mail.ru)
 by fallback1.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1tf0yU-000zpC-CA; Mon, 03 Feb 2025 21:15:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=D7JRFzFEare/oFNaQJiakwJpq4E0pQkd2/w9tDmKTqw=; t=1738606510; x=1738696510; 
 b=BC98GYkIhf7SHAed8xAJquTrfQJUoaDxnqsC94m0fZu7esO3T4eRUmKRCEKFdX8+g5EKnCy/aNS
 mQZtO4VYTUzHLKdW4eD3ixU9xUcxr5iB39YAB4RqyWTYNKCNvlEwbQheu72PJCQ7kPMoLvEZgdO1p
 TGIlUsYIrBLbDbsi3RI=;
Received: from [10.113.188.174] (port=48258 helo=send264.i.mail.ru)
 by exim-fallback-5fbdbdcb77-7lmmm with esmtp (envelope-from
 <danila@jiaxyga.com>)
 id 1tf0yL-00000000FA4-3QGz; Mon, 03 Feb 2025 21:15:02 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=D7JRFzFEare/oFNaQJiakwJpq4E0pQkd2/w9tDmKTqw=; t=1738606501; x=1738696501; 
 b=ajmjCBNDH9Og/zmCjKzP+Pl//2SDrwqtFJc1aaPH6tJK4VD9GJCnyUkWOUGfmErl2qEjVtY/Be5
 RuZJhT5zY0mbJPqhtj3l+i6aImyEhP+UZt7gQU/yT/2jpADXv8VpzqIJK2Dyye3cype4NOstSFVOj
 zMZO1rcEpPg+dqWAgEQ=;
Received: by exim-smtp-6d97ff8cf4-crh4d with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1tf0y4-00000000H1P-2H7S; Mon, 03 Feb 2025 21:14:45 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, jonathan@marek.ca, jun.nie@linaro.org,
 fekz115@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 0/4] sm7325-nothing-spacewar: Add and enable the panel
Date: Mon,  3 Feb 2025 21:14:23 +0300
Message-ID: <20250203181436.87785-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD985D89FF3B425BBEFB48FEBABD90F3B7401DE346ACC8939A6CD62213F67905E7A3696776F0B98519CBDA1AADECFE04B855B746C49C5A93FB624BDAFD5E9761C67FEDCCBD3DDE7F493
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B7733D0215A2F71AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378F586D843116CFB2EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BC08E230531AC9C90D48C84F60DA7BD9C119A65102D8A25FFE0C136DC086F5BCDA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE77FFCE1C639F4728C9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3A367EA73E0D98AAD117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF05E80F4396618BB276E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8B406C66621D3021AFD81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F890A246B268E114E5E1C53F199C2BB95B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5D4AF5AD9AAC5B2B25002B1117B3ED696750175D3FA3F03671E49B01306B5E3AD823CB91A9FED034534781492E4B8EEAD14747542773C033FC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF123DA26E3BF0E2AAF0A13BBC0A68F25BA3F27AC1796CF9F1BBB2732F3F50E1D614625291CC5E48B9C56FE0738BD31C043FCBB3ED5EEAA176139AD299E36D9692B5D06203C12B99C4354DA1E504E663BD02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojks+hT+CyYL1/eAliXkWy9g==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FF5005910AAC186731356DD24693B53BC3C74BFA4BD2A0242BE2B9809F5EE1A3E2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C1F01E828FDC9BC856049FFFDB7839CE9E725523CC1EE150EB27A37986E63DEF09B751DBE7BA36A3DC8D4C3B0D36B3506639594C5AF30C0DD2
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSpaVNpzbQKl5AyxHfUpwjuv
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C1BDB3A1FA17F234B6049FFFDB7839CE9E725523CC1EE150EB483549C658F0D40FE1F6A45164BAA1708DC51D434ABBA9C3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqf+jS9K0O6j7JdENjvzQK2
X-Mailru-MI: 20000000000000800
X-Mras: Ok
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

This patch series adds support for the Visionox RM692E5 panel, which is
used on the Nothing Phone (1) and then adds it to the DTS.

But before adding to DTS we need to allow all bpc values ​​in DSC code,
because Visionox RM692E5 has a bpc value of 10. Also we need to make sure
that the DSC patch for 1.1.1 topology was applied.

To: Neil Armstrong <neil.armstrong@linaro.org> 
To: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Jonathan Marek <jonathan@marek.ca>
To: Jun Nie <jun.nie@linaro.org>
To: Eugene Lepshy <fekz115@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: linux@mainlining.org
Cc: ~postmarketos/upstreaming@lists.sr.ht
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Danila Tikhonov (1):
  dt-bindings: display: panel: Add Visionox RM692E5

Eugene Lepshy (3):
  drm/panel: Add Visionox RM692E5 panel driver
  drm/msm/dsi: Allow all bpc values
  arm64: dts: qcom: sm7325-nothing-spacewar: Enable panel and GPU

 .../display/panel/visionox,rm692e5.yaml       |  77 ++++
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  53 ++-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |   7 +-
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-rm692e5.c    | 433 ++++++++++++++++++
 6 files changed, 573 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm692e5.c

-- 
2.48.1

