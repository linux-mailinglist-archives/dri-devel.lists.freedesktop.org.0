Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069F875FDCB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 19:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA8910E0DD;
	Mon, 24 Jul 2023 17:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1295 seconds by postgrey-1.36 at gabe;
 Mon, 24 Jul 2023 17:32:41 UTC
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DFB10E0DD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 17:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rhRIqnNbTSrJqaR+2OTxRF7GMRkQ37AO3tbuDH+kZ7E=; b=EGFWPV5gvvrM5DelTcJb/lEkBM
 P73OoYOTqAllDlORiN1RBC92Ffm2qrygk4k8rP6rILJ/HlQrJwaDhiZo7R89KnW67JBuiWwdwIf0M
 Ny9hS00Rlyvyn4dkVI/cIPmi/YcCCIhPjX5+E1RItoecBVwJH2UlSbrH/WBsSsrW561DpJgQOwzRL
 PGDRCd0d8P3e5mnU3lAsvoob/WtQr8EHEpk3KfmWxA8hqFXSs+tUvTM3Ki6Cyahzo8+Hl2/UEF8JJ
 JSQhtHW3ZYzWtCuzTvHtvgRpUkxgx213nFVrJS9eqAOEuFxca2zc0oLD27h1fdi81IxCKFafPI23M
 Q3ch3GUw==;
Received: from ip98-183-112-42.ok.ok.cox.net ([98.183.112.42]:57484
 helo=[192.168.0.142]) by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <david@lechnology.com>) id 1qNz5H-0008Cb-2D;
 Mon, 24 Jul 2023 13:11:02 -0400
Message-ID: <2dd61f70-21d8-609e-0de5-20452ccbe4f1@lechnology.com>
Date: Mon, 24 Jul 2023 12:11:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/2] drm/mipi-dbi: Lock SPI bus before setting D/C GPIO
Content-Language: en-US
To: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
 dri-devel@lists.freedesktop.org
References: <20230724065654.5269-1-otto.pflueger@abscue.de>
 <20230724065654.5269-2-otto.pflueger@abscue.de>
From: David Lechner <david@lechnology.com>
In-Reply-To: <20230724065654.5269-2-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/24/23 1:56 AM, Otto Pflüger wrote:
> Multiple displays may be connected to the same bus and share a D/C GPIO,
> so the display driver needs exclusive access to the bus to ensure that
> it can control the D/C GPIO safely.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
> ---

Acked-by: David Lechner <david@lechnology.com>


