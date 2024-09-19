Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0436597CF41
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 00:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A8E10E779;
	Thu, 19 Sep 2024 22:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="heMFLgIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E18710E779;
 Thu, 19 Sep 2024 22:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726785513; x=1758321513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SkkbXRnm25tgMF0IgRVj3Ttc412D7UDre1mtD2GNklU=;
 b=heMFLgINP3NtORu8SbJ39oDhXZm9Awc9Tm7VM9vpaKEmxQzz3L2qyBoM
 d9QumfS+2XIT0c0divgOJPYsMesmTkHDA8AJq9EAfXuy9fv4ZGp9k6ZcY
 BXEmUhFEgKMIVUUhsdScrxGo8oFbntElpwxZZxunFSZk+BLX1362n05Gp
 +0dIK1Fvta40X35GKHscO+5DYia683F5KOBJgvv1wxuydxd6k9te9eBen
 V5eE1v1Nq8OhEjTa8Ek1H5gIU3UIOH7slNDjzLw0E5fdoc/zan3U7W1LD
 RNblDZx66SSqD8tehNXkLRhPDq3ulDTMduoQr2dMlwqqVxtXJNO5feRHN A==;
X-CSE-ConnectionGUID: K7piS6gLQseWIi7Xfl3Fjw==
X-CSE-MsgGUID: opVTMw/lQtiNofDnj1Zu2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="48309521"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="48309521"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 15:38:32 -0700
X-CSE-ConnectionGUID: ZnsHlbloRSaMJra4DysVTQ==
X-CSE-MsgGUID: UKmxLiyNT4eHnlS21sS9iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="70334039"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 15:38:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 15:38:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 15:38:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 15:38:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 15:38:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9z7AdkOajGTE1de+aWqASh7i9Zk4oHzqVzTq/V0S7iRvsNpUR6tR7Ub98yK1iEv1FL4TZrY7jerq89hPl971KQ1syWigzZJfMMUvbS0XgoQlATvbtjCT9j42uB2mCaISyKzGQZ0AQg+8eHsxOFmDQIwber9sypTklwIKxnMTb472TL3dk0df71lO4DB/AWINnCxHvALCc4f6rV4YnFxkDvbFCvkQdzLDpWSrNQZaMwGYIUplDqKydkCRXj2PRWBDqm1qOAv1FCKhM9hHbfuK9aCKeAhSLysFBqEPr/fOVr/kL4RFOkUN59uO1MxtbrLtnZ3l60dJzSAhm0UuxhuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2e8pnCVWF9f5NxGXVDREsXbrrXkrB+voyNQz3045ag=;
 b=WUIJvilPVKYbG+DeqbGtIOsTxLiwqLBxiMLHfgfIxRH2GqNUmR73UFc9nO0za66opAELBSHXWFKYZcG/XAKd6ZwO9/wYX2HEVWHjM2aIw8/g8ec8GgJehdoEwsTfZThIdGx3Gmvs46mU1b9WPPSO0dWY5Qb0de8FaBK2U7lXYDVvbNIecMSv4iMpeKfZp8De/PyEebt8hijyWuG41S+FCxU2Lx/SJ5Nmd2d29yugxI1QTZf8XKjFoLAedkRurRtsWzIHRqB8QaBH9KmYkGiJanJzO0Z5KVItDuCFei+/hdL7AoXWrz+gmHtdnpZRO21zftPD4/7JH+35YbEDsRtpHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.26; Thu, 19 Sep
 2024 22:38:27 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 22:38:27 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 1/3] PCI: Add support for VF Resizable Bar extended cap
Date: Fri, 20 Sep 2024 00:35:55 +0200
Message-ID: <20240919223557.1897608-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919223557.1897608-1-michal.winiarski@intel.com>
References: <20240919223557.1897608-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b8401a-a19d-45d2-61af-08dcd8fbc72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFV0S1BWQ1pxcEhnVzQyZ0xvZ3BLZTgwTEhpZTFvZTlQWlR5QXpqUWZOMGVy?=
 =?utf-8?B?a1E1d09LN1doZnpGK1dDazE5Q0pGZGU2YnpCOWRISS8vcm1oREdFMERiR0xF?=
 =?utf-8?B?NTRaMnEvN2xnc2I1czR0WmxnZG55eVFHeXNlbVNPMGdlei9TRWtCWksrRWJJ?=
 =?utf-8?B?VkFRNzdHSnZSdHQzS2pld3ZlSnJ5R0RqRmMvZDJqYlpjK1grRnJUclFzRGVO?=
 =?utf-8?B?bFBwSk8rWm5TYlVQNGZhWEQ3aDgzWC9EZzlLemYwU052ZGFLVkpydTAvZERw?=
 =?utf-8?B?ZFN0OEZTSVFOK1dhS3hBbnlVbFhwTnN6R0NrWDhmaWljSDJJSER4aS90Q1V1?=
 =?utf-8?B?K2paQ25RQnBMc01ROXpndzlBZTZYc3FjZEpJMmR4d0I0R05BOTVNV3RVRXVP?=
 =?utf-8?B?QXgzYmRtemY1aE1TTFJlSmtJWGVrZ0tPdExTVHQ5M2lJRVVZVTFtV05EN25i?=
 =?utf-8?B?NUpwb2Y2ajlPbmVybElQWWZkNHg2UHI1SHpkOEszSlJjamJ3Qy8zM2RtYmoz?=
 =?utf-8?B?YThtT2dCcE9yUWNObmViZjBud3p2WFRSTGFPUWkvSXc0OFo1Nmx4Tk9zdDN1?=
 =?utf-8?B?UU5xUm9EODZBV0JkUndjT1F6S1R3UHNVai9aYjE4bjE4N1BwQVBKNzQ0bmxk?=
 =?utf-8?B?K1ZoSjEyL1I2eVErcE9IVE1uejcwSStwb0ltVkYrdTJxMXQvU012QUxVcEd5?=
 =?utf-8?B?MCtOVW1WRnJMcmFlZXBNMk5iVDFzQjZrWjA1N3BVKy82OEtQTG1jTzh3czBX?=
 =?utf-8?B?MmtTZEVIVm41YWRWSTlTVW5rTDNQelVseWVLSUY4bVllY3B2bWVWTE52dTlV?=
 =?utf-8?B?L2JvK3FER1l0Z0lxVDhjZEg4d2NibEFjV0MxTkNEVjJYY3R6SEpuSms0Uitu?=
 =?utf-8?B?M2hqOXdheXFFUjJzcTErUUE5d3JHS2NXbGZEUG93SllOUWkvZFJtWmlMREFH?=
 =?utf-8?B?SVdIWCswc01MT01GRU85RXZWWXZTNTVIZmFGazQ0bDNLRThjTkVEZGJrRnpr?=
 =?utf-8?B?Qk9DbmsvNG1JdEo5QjhPOUxkMHBkWWgreUlSblNVWlAzTXRSdUJQRkprc2ll?=
 =?utf-8?B?OHNBM3BHdVNJMjhidE9CRmZXdWFpRjRhU2dnUnIyVEQ4alEvWjNoRmhsekNE?=
 =?utf-8?B?aWpNY2ZwOEw2VFlwUHlkRVJWdDE2RUp5NVNScTlKSVpweEE0eXdlRTgzaHhB?=
 =?utf-8?B?K2Z2Smc5V3hxWEwweUswUDkvWVVmc3EvQ3FvcmFDQ2hkZS9sRWJXeGRDWmhx?=
 =?utf-8?B?dkh5czRldWtEWjBINWtoL2F1OUp3bzdINkJRdE9UMDJQeGo1UmQxV2xlNWc3?=
 =?utf-8?B?dTRTdDdZRDhweVRNMEV4NUJaeHRoQ3pET01jeTR2Q0p4VlczY2paMHhXdEFy?=
 =?utf-8?B?dERjbHNmQy9OVHVPTlhHLzZON002YnptbGtWOXMvd21qNitUMGZKTmFYQ29B?=
 =?utf-8?B?c3VyU3orRHdRbHZ3QmJTL2E2N3p2VUJ1K3pneWNVYyt3cjNBMnhFR3FrU2wx?=
 =?utf-8?B?dWhUT2lzb3E0ajlCTHkxdHlFd21Jc1hwaHYwdmNjUEJsUHQrMkNndzFZZHpX?=
 =?utf-8?B?RE52cCtoRGUxVC90U29FS3oxRG5XL2tVeHczenRPakpxamVSSE80SVVIS1NK?=
 =?utf-8?B?L1JIbGFRUHkvcFplN1dITWtPdFUxQ281b1c5THdxZGJnSDVjTW5oNlJPVWVL?=
 =?utf-8?B?SGZZQVpmdVpqYkZaU1Rlb29BZE51ait5NU1QNE9YVFJxZWZTdnoyK3NoVmxi?=
 =?utf-8?B?ZVVXWFp6a2xTT3RMOW1YUW5Nd1piV1pudmRwRHQrNVZFRjh2U1FPSU90cVpR?=
 =?utf-8?B?aWRnNXhybzZMY3dRMTU0Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE9mU1d2dHR4ZzhjaEptcHdIYjU5RWZFaWlicW1ZemdKUHg0UjFEQW85MmVM?=
 =?utf-8?B?RnJlY3NHaU4zVEVsUTJvS01lRjdxVWh2OW4xSjN2bEU1WE1ucE1KTER1VFQz?=
 =?utf-8?B?MDZvekY5aXlNbXI1c3k2ajRIUDJPYlJoUHpzNk1iU0hBdGpGeTZiM1FXV3pC?=
 =?utf-8?B?V01Ib0pyeDJDclZOY0p4eGtVeGNFMEloV3IyR2xpTHBiM2drZEYwdWpDcGZD?=
 =?utf-8?B?WGVLR0ZSOVlGUngwUXV5TzRlUWVFS09rRlRwMCtrVUNiVnoveXdMQjBvYkht?=
 =?utf-8?B?K2NiQWpQbFEybGhnNnpUQkptWEVKRmFJZWtSQ1lzWElYMVBsTEtibC96Si9O?=
 =?utf-8?B?UnkwZjhVVDErU09RNUNraDRzN05oQUJoTGVNTEw4SGdicjVXaGpscnZ2Mlg2?=
 =?utf-8?B?ZytVbDd1bnhxdk1ZcThvMWRsRndySmxYQ3U3cXRJaVJFV2hIb2pXKzErVFBF?=
 =?utf-8?B?Q0RtNExJL01FUHVML24rdnBJeG5vYXdFTVR3WEVSWjhkWTUybmE0M3NOUCtG?=
 =?utf-8?B?Vmw1RWt1MUJDaVJmNEJSV21tZHd3ZDI3cGxLQkFWd3BJYTd2eUxHTUU5cTZM?=
 =?utf-8?B?L2FSSDRQZkZCNjIrcEFhcHIxY1ZQMldFckNnaXc0L0cyRk1kRitPdjVCRG1D?=
 =?utf-8?B?amdsSEJOK0cxdHRDMlVkbzhIVFltYUo5WnVLSDdKMXRISG5Vcis2bC93VHBJ?=
 =?utf-8?B?VzdiOGhPQmRvbVBwQk5ub3hLb3ZiZGVmcmljbG1yLy96SlVyS2U0aVZZSjZv?=
 =?utf-8?B?S3NWaElqZWp2Y3lQY1IrWEQrMGFRd1ZkQkFTTnRGbUZTa2tWTUxRa01hVVJ3?=
 =?utf-8?B?eXNpVEx2RUpwRk9yVkMrUms5WlBwMjIxL1FFSXBFa3F1T0pMQnkyazZVWFNZ?=
 =?utf-8?B?aWNhNTNZNnpsdVF0OEFuVDFoVysxN3FaY1BQS1RNdjJVd2MrN204TmVBaHNT?=
 =?utf-8?B?SitUVVMrOHBOdlFXQkViV0d5bVhwdlJGQXNGV1h1ZVZlSGRHVURLVzNJMjZk?=
 =?utf-8?B?ZjV5SWxYQkU2OTVSSSsxMTM0MlJDNDhwaEVrZTUzZDcxVjFvTW5yREhlbUI1?=
 =?utf-8?B?b0prMWcra0F5d0I4TUU0VjRkNmVJdytyTiswWDJZRm1XQTB5RTN2SHkxVGlM?=
 =?utf-8?B?VGVtY2ZLR3pzUlVqSE1UVmVvT2x4NndXRDZvVDdjMFphelltZUtDVWE4dzV1?=
 =?utf-8?B?aTUvWU1XSmg2RnV5K0MxaXBWK0JDaDE2eFNxK2M2bjZOYVN0Slc2Uk84TE1R?=
 =?utf-8?B?bjIzZEt0U3ZTSGx1dllBZzhmaUJrazlBV3RmWk8wSngvdU44V1dkUVN6MGd2?=
 =?utf-8?B?aFVoTUxuZzNLZGVydlFGSDNKN3Ixc0hlWUg5aXduYWV5VEYrNTB1eEo5bmIy?=
 =?utf-8?B?RjErdnRBT1J5U0RtNG9hYXJPMHRETmlFQ3o2aitnOHJJYWR6RTJnNGxEbWZY?=
 =?utf-8?B?dzRYWDZMRjRhYm1qVnhHQVI3NWZFSU5pWXJ0MzhRdXBsTG5aMnR1NXczUzQ3?=
 =?utf-8?B?UWloaW5PVStIaTNPWndSVlV4TEM2dmhyTW5xOWNyZmVUY2ZCTlJmdzBQam1q?=
 =?utf-8?B?RmJFOWwrZUw0elRTZGtqSE9TL2tlZ1NCRWpUT1RETlRpM2xUa1UwT0lUdGp5?=
 =?utf-8?B?bTNxeU8zQmV4VjU1ZGZjbmk1SXdUYjF0ZUd1SThpdVNCdGdmK1IvK050cWE3?=
 =?utf-8?B?V2Q2YmU3Vkh6RCttSjhrem1xdEhhU0JFZit3b0E0NHUzM1FiRmdWM0o0VXo4?=
 =?utf-8?B?YzdJZEhGWGhEVHA2K1VwK1E2ZGN2WXdpM0t5c1ZpYkVKZmRKaE9qMXlBV1Vp?=
 =?utf-8?B?c3pMUWFLQVdOVlpDUmwrZ0JtRGRxc2tsYWZIcVJCeElCVTRGUSt2cVVISHl2?=
 =?utf-8?B?ODRlbEl1eGk1QXJtZVpTNHNYUFBadUhoaGJ6b3VPWGR1dGNabGVqeHd0S3Zi?=
 =?utf-8?B?MzJET2RPN2JkRmNDQWZkc2w3NDEyWHJQQ21WT2NRSWQ0clNSdkxicnAvVFFM?=
 =?utf-8?B?dkdpaEMyWHdmNmxKMXhueThsUXVTcTd2VGd5UUVScEFmVFpvS3FlSDgzZ1J0?=
 =?utf-8?B?RXVsZFVBOFE3cHNYRlJJbkdwSTlRTFpzcURnY043eDNLYjFMaEdxQ2RVWkxM?=
 =?utf-8?B?R2VrOS9YQ2tOdFhGdGZNUTlEM2lnRVlzbDRmS3k5YTkvWFpiL3pDY2JEeEZS?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b8401a-a19d-45d2-61af-08dcd8fbc72e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 22:38:27.1217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nN6RGIhfIcjCHQUXm1MGlxK9aKqfeAMdCMsnWrP/ObMNU0HjKuzlZfCSkprk1EOLS1Z6ha/uoxgNmtTLrXCbkXg2FaqS19ORtpTY8iBPjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5824
X-OriginatorOrg: intel.com
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

Similar to regular resizable BAR, VF BAR can also be resized.
The structures are very similar, which means we can reuse most of the
implementation. See PCIe r4.0, sec 9.3.7.4.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c             | 28 ++++++++++++++++++++++
 drivers/pci/pci.c             | 40 ++++++++++++++++++++++++++++++-
 drivers/pci/pci.h             | 14 ++++++++++-
 drivers/pci/setup-res.c       | 44 ++++++++++++++++++++++++++++++-----
 include/uapi/linux/pci_regs.h |  1 +
 5 files changed, 119 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index aaa33e8dc4c97..e8ccd2ae0f024 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -153,6 +153,34 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
 }
 
+bool pci_resource_is_iov(struct pci_dev *dev, int resno)
+{
+	if (resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END)
+		return true;
+
+	return false;
+}
+
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno, resource_size_t size)
+{
+	if (!pci_resource_is_iov(dev, resno)) {
+		dev_WARN(&dev->dev, "%s is not an IOV resource\n",
+			 pci_resource_name(dev, resno));
+		return;
+	}
+
+	dev->sriov->barsz[resno - PCI_IOV_RESOURCES] = size;
+}
+
+bool pci_iov_memory_decoding_enabled(struct pci_dev *dev)
+{
+	u16 cmd;
+
+	pci_read_config_word(dev, dev->sriov->pos + PCI_SRIOV_CTRL, &cmd);
+
+	return cmd & PCI_SRIOV_CTRL_MSE;
+}
+
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
 {
 	struct pci_dev *physfn = virtfn->physfn;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index ffaaca0978cbc..d4522e365e7ba 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1901,6 +1901,35 @@ static void pci_restore_rebar_state(struct pci_dev *pdev)
 	}
 }
 
+static void pci_restore_vf_rebar_state(struct pci_dev *pdev)
+{
+	unsigned int pos, nbars, i;
+	u32 ctrl;
+
+	if (!pdev->is_physfn)
+		return;
+
+	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_VF_REBAR);
+	if (!pos)
+		return;
+
+	pci_read_config_dword(pdev, pos + PCI_REBAR_CTRL, &ctrl);
+	nbars = FIELD_GET(PCI_REBAR_CTRL_NBAR_MASK, ctrl);
+
+	for (i = 0; i < nbars; i++, pos += 8) {
+		struct resource *res;
+		int bar_idx, size;
+
+		pci_read_config_dword(pdev, pos + PCI_REBAR_CTRL, &ctrl);
+		bar_idx = ctrl & PCI_REBAR_CTRL_BAR_IDX;
+		res = pdev->resource + bar_idx;
+		size = pci_rebar_bytes_to_size(pdev->sriov->barsz[bar_idx]);
+		ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
+		ctrl |= FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
+		pci_write_config_dword(pdev, pos + PCI_REBAR_CTRL, ctrl);
+	}
+}
+
 /**
  * pci_restore_state - Restore the saved state of a PCI device
  * @dev: PCI device that we're dealing with
@@ -1916,6 +1945,7 @@ void pci_restore_state(struct pci_dev *dev)
 	pci_restore_ats_state(dev);
 	pci_restore_vc_state(dev);
 	pci_restore_rebar_state(dev);
+	pci_restore_vf_rebar_state(dev);
 	pci_restore_dpc_state(dev);
 	pci_restore_ptm_state(dev);
 
@@ -3703,10 +3733,18 @@ void pci_acs_init(struct pci_dev *dev)
  */
 static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
 {
+	int cap = PCI_EXT_CAP_ID_REBAR;
 	unsigned int pos, nbars, i;
 	u32 ctrl;
 
-	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_REBAR);
+#ifdef CONFIG_PCI_IOV
+	if (pci_resource_is_iov(pdev, bar)) {
+		cap = PCI_EXT_CAP_ID_VF_REBAR;
+		bar -= PCI_IOV_RESOURCES;
+	}
+#endif
+
+	pos = pci_find_ext_capability(pdev, cap);
 	if (!pos)
 		return -ENOTSUPP;
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 79c8398f39384..e763b3fd4c7a2 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -556,6 +556,9 @@ void pci_restore_iov_state(struct pci_dev *dev);
 int pci_iov_bus_range(struct pci_bus *bus);
 extern const struct attribute_group sriov_pf_dev_attr_group;
 extern const struct attribute_group sriov_vf_dev_attr_group;
+bool pci_resource_is_iov(struct pci_dev *dev, int resno);
+bool pci_iov_memory_decoding_enabled(struct pci_dev *dev);
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno, resource_size_t size);
 #else
 static inline int pci_iov_init(struct pci_dev *dev)
 {
@@ -568,7 +571,16 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
 {
 	return 0;
 }
-
+static inline bool pci_iov_memory_decoding_enabled(struct pci_dev *dev)
+{
+	return false;
+}
+static inline bool pci_resource_is_iov(struct pci_dev *dev, int resno)
+{
+	return false;
+}
+static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+					     resource_size_t size) { }
 #endif /* CONFIG_PCI_IOV */
 
 #ifdef CONFIG_PCIE_PTM
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index c6d933ddfd464..87a952a114f38 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -427,13 +427,44 @@ void pci_release_resource(struct pci_dev *dev, int resno)
 }
 EXPORT_SYMBOL(pci_release_resource);
 
+static bool pci_memory_decoding_enabled(struct pci_dev *dev)
+{
+	u16 cmd;
+
+	pci_read_config_word(dev, PCI_COMMAND, &cmd);
+
+	return cmd & PCI_COMMAND_MEMORY;
+}
+
+static int pci_resize_check_memory_decoding(struct pci_dev *dev, int resno)
+{
+	if (!pci_resource_is_iov(dev, resno) && pci_memory_decoding_enabled(dev))
+		return -EBUSY;
+	else if (pci_resource_is_iov(dev, resno) && pci_iov_memory_decoding_enabled(dev))
+		return -EBUSY;
+
+	return 0;
+}
+
+static void pci_resize_resource_set_size(struct pci_dev *dev, int resno, int size)
+{
+	resource_size_t res_size = pci_rebar_size_to_bytes(size);
+	struct resource *res = dev->resource + resno;
+
+	if (!pci_resource_is_iov(dev, resno)) {
+		res->end = res->start + res_size - 1;
+	} else {
+		res->end = res->start + res_size * pci_sriov_get_totalvfs(dev) - 1;
+		pci_iov_resource_set_size(dev, resno, res_size);
+	}
+}
+
 int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 {
 	struct resource *res = dev->resource + resno;
 	struct pci_host_bridge *host;
 	int old, ret;
 	u32 sizes;
-	u16 cmd;
 
 	/* Check if we must preserve the firmware's resource assignment */
 	host = pci_find_host_bridge(dev->bus);
@@ -444,9 +475,9 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (!(res->flags & IORESOURCE_UNSET))
 		return -EBUSY;
 
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	if (cmd & PCI_COMMAND_MEMORY)
-		return -EBUSY;
+	ret = pci_resize_check_memory_decoding(dev, resno);
+	if (ret)
+		return ret;
 
 	sizes = pci_rebar_get_possible_sizes(dev, resno);
 	if (!sizes)
@@ -463,7 +494,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (ret)
 		return ret;
 
-	res->end = res->start + pci_rebar_size_to_bytes(size) - 1;
+	pci_resize_resource_set_size(dev, resno, size);
 
 	/* Check if the new config works by trying to assign everything. */
 	if (dev->bus->self) {
@@ -475,7 +506,8 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 
 error_resize:
 	pci_rebar_set_size(dev, resno, old);
-	res->end = res->start + pci_rebar_size_to_bytes(old) - 1;
+	pci_resize_resource_set_size(dev, resno, old);
+
 	return ret;
 }
 EXPORT_SYMBOL(pci_resize_resource);
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index 94c00996e633e..cb010008c6bb3 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -738,6 +738,7 @@
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
 #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
+#define PCI_EXT_CAP_ID_VF_REBAR 0x24	/* VF Resizable BAR */
 #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
 #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
 #define PCI_EXT_CAP_ID_PL_32GT  0x2A    /* Physical Layer 32.0 GT/s */
-- 
2.46.0

