Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA08BB7494
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 17:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74698930B;
	Fri,  3 Oct 2025 15:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="jSrkr1df";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A078930B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 15:07:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759504029; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cVJBf2iQcDs3fwzszR2MpCqkSr3syj75dywamJF0JjCDH1e1QfKGDYInXkJjclvnMNvbqL2OnazGhLLInr3ipXvRQh3sPAXVlufyUBnxRgdnUdfiMkAv4566WQ6OU/lNQE+JcOMHOprWwBuAVgjowYYWclG0dtpXBlIDmnhIims=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759504029;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jUBw3Cf3+Cpho9MvKW0n7yu+ypHp6ATAAIr37kiRcg4=; 
 b=L7dlv5+NJU1L6wtO8LbLskDzX8nvhkGzs8LpsVCj/C6SuYS1T3LBu5Ut4uBpsy1LE8UpLQaRQR2rG8LszwDZYXQJe7r0jmvsvPSCyxYqOHk/4Byycz1Sph/0FK9/AHRFwVGYxFqJb564ERwQgrzkardRpqb2v3b+PfmzIk2CSJA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759504029; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=jUBw3Cf3+Cpho9MvKW0n7yu+ypHp6ATAAIr37kiRcg4=;
 b=jSrkr1dfExMv3O1idm2OmcevBDBFPMaSU2Y0Ig/87XI5yZq6Cwe6nrf9BRM8uvPq
 T5uWKNbwQzyHzQDl6wAztGhv7XYiEU79h77kbwA+zdmvgA2oFCnlJIjkFRAeqRdNehf
 otx3mUkkJ0OAiERocacj6ZY1WChHrXFTU+lyryzw=
Received: by mx.zohomail.com with SMTPS id 1759504028112137.35822449876696;
 Fri, 3 Oct 2025 08:07:08 -0700 (PDT)
Message-ID: <4b784656-ebd2-48bc-8f7a-100595b5f5ba@collabora.com>
Date: Fri, 3 Oct 2025 18:07:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
Cc: nirmoyd@nvidia.com
References: <20251003053402.732218-1-dongwon.kim@intel.com>
 <20251003053402.732218-3-dongwon.kim@intel.com>
 <e1310d88-af63-4beb-9a82-6f04b00b6f3e@collabora.com>
Content-Language: en-US
In-Reply-To: <e1310d88-af63-4beb-9a82-6f04b00b6f3e@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 10/3/25 17:54, Dmitry Osipenko wrote:
> 2. Use mutex instead of spinlock, we don't want problems with mem
> reclaim situations

On the other hand, the virtio_gpu_object_restore_all() shouldn't race
with any obj create/free, hence no need to protect it with a lock and
then spinlock can be used to only add/remove objs from the restore_list.

-- 
Best regards,
Dmitry
