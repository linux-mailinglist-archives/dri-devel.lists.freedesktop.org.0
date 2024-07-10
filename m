Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A962292C983
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 06:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A5110E5B9;
	Wed, 10 Jul 2024 04:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574CC10E5B9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 04:08:52 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-70b03ffbb3aso4597994b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 21:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720584532; x=1721189332;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PTrvYsLDk9v5IzbDuWsLNN1KAHqZ8dYz0D0OzWAGnT0=;
 b=vLodMeJiiX34D8kC01LqmzNf7fQ9Y2FANWnxXow5vO8aDrsXln6Pr7SRsG3/XyFi38
 zCPCnGu9VlTYl497z1bS4Dr/gd/KvsMaxzJILTOZKN1bdsc+9t+ZvNYTnugt1HCWtKCr
 qFZhSzsC6B8joGOre5SZ75EoqdfGPKjhgnunYVXOAlZjWyqkYboV1hDbi+S5ySq1e/ip
 ifB5XAS07/zh05ujtZZsNKFMLTduxVtyp+dfdGQFZji7BfpDlaq+fsY+g0LdlNrbvhx9
 al0aD2QZniiayy//rGRxGyuVyrez+XSJVVcDbMXURpMjycH64L4LX6+0uGTuZdqALipb
 y+ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFKRt95n96NFHJtOhTGIbmyyOPsplRTyTXr6WOgPyNpJ2JltbRm6aibemV5vbND2DHv04rIUh2zeTc9MaMU+NvEi8UA0h2ub8uDteWtXHd
X-Gm-Message-State: AOJu0YzRwtP0Wh3iE+Br++I2bylNbmYIcekt9kT00rTKW5X7hqHdnZC9
 cR/uDQfOJNLEjZ2QxsWEY59ekrDDuYv18hsGoKdA6igq8uTdDFgJ
X-Google-Smtp-Source: AGHT+IEIALYwl8BZTk+7LRVdCMC7liY8odUXaxzuBtNBTCvGDH+Iy0eQzYzSZAU88Vt8TRGuYJF7ow==
X-Received: by 2002:a05:6a00:1748:b0:705:b81b:6ee2 with SMTP id
 d2e1a72fcca58-70b4356a698mr5917442b3a.19.1720584531799; 
 Tue, 09 Jul 2024 21:08:51 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b4397ed2esm2741866b3a.149.2024.07.09.21.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 21:08:51 -0700 (PDT)
Date: Wed, 10 Jul 2024 13:08:49 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: "Kalra, Ashish" <ashish.kalra@amd.com>
Cc: Philipp Stanner <pstanner@redhat.com>, airlied@gmail.com,
 bhelgaas@google.com, dakr@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sam@ravnborg.org, tzimmermann@suse.de, thomas.lendacky@amd.com,
 mario.limonciello@amd.com
Subject: Re: [PATCH v9 10/13] PCI: Give pci_intx() its own devres callback
Message-ID: <20240710040849.GA3748595@rocinante>
References: <20240613115032.29098-11-pstanner@redhat.com>
 <20240708214656.4721-1-Ashish.Kalra@amd.com>
 <426645d40776198e0fcc942f4a6cac4433c7a9aa.camel@redhat.com>
 <8c4634e9-4f02-4c54-9c89-d75e2f4bf026@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c4634e9-4f02-4c54-9c89-d75e2f4bf026@amd.com>
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

Hello Ashish and Philipp,

> I have reviewed and tested this patch, looks to be working fine and fixes the issue.

Great news!

Ashish, thank you for taking the time to report the problem and then also
testing the fix.  Much appreciated.

Philipp, I will take this patch and squash into the series you have sent
earlier, since the changes are not yet part of the mainline.

	Krzysztof
