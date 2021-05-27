Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F33928C8
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 09:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7B06EE2E;
	Thu, 27 May 2021 07:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFC46EE33
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 07:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 88C4A3F720
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:42:25 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="TzI+rsiF";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qf0TplyuJ6BS for <dri-devel@lists.freedesktop.org>;
 Thu, 27 May 2021 09:42:24 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 93C8F3F4F4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:42:24 +0200 (CEST)
Received: from [192.168.0.209] (irdmzpr01-ext.ir.intel.com [192.198.151.36])
 by mail1.shipmail.org (Postfix) with ESMTPSA id DBE14360128
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:42:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622101344; bh=PnelOquBucJgIzvq+mqobrohxKsWYnT0JEW6CfEd4I8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=TzI+rsiFQdjYKwkdfbnOTiyIM2ct7mfuHUe+IZ8JVDfk7afr23VDRzCXsCJoAbmAs
 CdSQu3gYaZO5xbAvbmvTmiREvht+UEEMqG4D+C3SlUp8l9KpsDZcvYXh5PkF3wHTLS
 tTOEZj12mYl6/I2kECuZ/XayasG9lSKfa8NN189s=
Subject: Re: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
To: dri-devel@lists.freedesktop.org
References: <20210527013051.4302-1-Lang.Yu@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <3d9b91dd-fba6-1c35-7bb4-90aaea0176ee@shipmail.org>
Date: Thu, 27 May 2021 09:42:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210527013051.4302-1-Lang.Yu@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Hi,

On 5/27/21 3:30 AM, Lang Yu wrote:
> Make TTM_PL_FLAG_* start from zero and add
> TTM_PL_FLAG_TEMPORARY flag for temporary
> GTT allocation use.

GTT is a driver private acronym, right? And it doesn't look like 
TTM_PL_FLAG_TEMPORARY will be used in core TTM, so should we instead set 
aside a mask in the PL flag for driver-private use?

Thomas


