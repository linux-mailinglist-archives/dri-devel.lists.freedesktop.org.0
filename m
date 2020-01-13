Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE80139672
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 17:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C7A89F6D;
	Mon, 13 Jan 2020 16:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 359 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jan 2020 16:36:01 UTC
Received: from mail.digitalendoscopy.de (mail.digitalendoscopy.de
 [128.65.149.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B29489F6D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 16:36:01 +0000 (UTC)
Received: from [192.168.20.14] (port=41681 helo=srv-msx01.digitendos.de)
 by mail.digitalendoscopy.de with esmtps (TLSv1.2:AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX)
 (envelope-from <v.vogelhuber@digitalendoscopy.de>)
 id 1ir2bC-0006kr-0i
 for dri-devel@lists.freedesktop.org; Mon, 13 Jan 2020 17:29:54 +0100
Received: from [192.168.20.180] (192.168.20.180) by srv-msx01.digitendos.de
 (192.168.20.14) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 13 Jan
 2020 17:29:44 +0100
X-CTCH-RefID: str=0001.0A0C0204.5E1C9B02.0034, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
To: <dri-devel@lists.freedesktop.org>
From: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
Subject: DisplayLink UDL driver with Intel IOMMU enabled
Message-ID: <f4a05a68-6de6-1e62-7225-1e5047862b09@digitalendoscopy.de>
Date: Mon, 13 Jan 2020 17:29:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [192.168.20.180]
X-ClientProxiedBy: srv-msx01.digitendos.de (192.168.20.14) To
 srv-msx01.digitendos.de (192.168.20.14)
X-TM-AS-Product-Ver: SMEX-11.7.0.1065-8.500.1020-25164.004
X-TM-AS-Result: No--1.002900-0.000000-31
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I just came across a DMAR allocation issue when I wanted to use the UDL 
driver with a DL-165 chipset and had the Intel IOMMU enabled.

It seems like it could be solved with the same patch already applied to 
the EVDI driver: 
https://github.com/DisplayLink/evdi/commit/74e289906dba95c0ad3208cfa6a57ba3042b930f

So just add interface->dev.archdata.iommu = INTEL_IOMMU_DUMMY_DOMAIN;
before the drm_dev_alloc call in udl_drv.c seems to be enough to use
the UDL driver with IOMMU enabled.

Kind regards,
    Volker

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
