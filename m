Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADACE9B11E7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 23:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BC410EB92;
	Fri, 25 Oct 2024 21:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWkNmDOv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EAA10EB8E;
 Fri, 25 Oct 2024 21:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729893093; x=1761429093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Cb21LiisF8elRGSHW71OF80D2cdzyNx82WHuMbx7zMQ=;
 b=jWkNmDOvk/4mkferVg+jO7GS/V2jy9ba041FRta3mPQPJdqTBnkAuktS
 BgGLZJsApdWhop3256ofTSjaGu0Odj+TlZQPEqtwVrFhAXTlbcXI/MFnS
 n+czBlUIo1/nUHsQVXM338yFGPTJEy58qFSzVi4VTLsUh4Hpta1uN8AMr
 MMiwaJ17q80AX2hTFTrPNoAkUn/oAuAjURtQ8nFSlb7z61rMGdCUXcjI1
 VVnAuxUdMOUYKlUKgWlp8xy/VoAmDgRUzPDYiDH0a1sGgZ34zR8/8HVPk
 TdXIeDPF81tFttPLlb0ZgykRY9AGTSrPJJmyZIupt3XlWBxH+zvK/vHjd g==;
X-CSE-ConnectionGUID: Mz9BaDIgTcWPLntqwMlghQ==
X-CSE-MsgGUID: 5uaYoh2YSfaF+YUVBA73fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40192815"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="40192815"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 14:51:33 -0700
X-CSE-ConnectionGUID: 0tKz9vp2T/6CtIaXQkIZeQ==
X-CSE-MsgGUID: SRzMFBBBT+OWfwNpzaBQKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="104358193"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 14:51:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 14:51:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tysue0GKSs8qWZ2J2pWbeGohRU3gzhCmexqocbxjhj/osK6VdZh104lLBnLiny1ITmXry7e0ij1GOOC9m2asb5ZOx+VLN5PyGvNePHA2/E5Dot86OroRQSFwUwwR8yFuxKtVSbKMzAqbhApDh2Si9Bi6ktoXmA44gyqkF1f+EJdERmccFJ0rOxLg7r7blG82Z8cenbGWDl+lRYSozTC14LSw2uH+2YMeG+OvuR6I9VgOHSW2iqnN7QI1XIOUIsxp60IlODyAalxr/mcUmKr4nWVPSw3VyJxe/3pV1t4ftml6WD6f1HNGRojs/d1UMs9ecrV1LXNFZKHjLbeFBSDfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prUTcacmshz3WO2AIjl4k3nUwsfAHpTcDq5xf2IXaoM=;
 b=oSoSEWKNhJU6L9JExtrcc3IWMYKw8x4w3JVdNAvxOU9t0BkDp9LYrxqfA9L4cnF/3nhnXZxJnOu95hSrrssrK4jePZHhdyKQdcXCdQrbf6gAFjmKsrfodHIZ5pKnuFNUBFZLyT2NCfRnN2Uj1V4hAhRljYUkQjEkL+oTcyVydEC8paaiDXZL9icWetl9NYBUIsqOfS1hus/p6a894IGCgGigGQspO5QIvQUJxtwraQLQof/OLz290EQReBCiPnWuQ367Z558wt9oIvjgK1LNtyLRthuGr10tGNoIDx+IIiJTEZDT1hLfraqU1auPb9fYk+/QGeyvoGSCBGPgiNrzSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB7745.namprd11.prod.outlook.com (2603:10b6:930:90::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.16; Fri, 25 Oct 2024 21:51:25 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 21:51:25 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v4 6/7] PCI: Allow drivers to control VF BAR size
Date: Fri, 25 Oct 2024 23:50:37 +0200
Message-ID: <20241025215038.3125626-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025215038.3125626-1-michal.winiarski@intel.com>
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: f46ff9bf-6247-4a52-050f-08dcf53f2c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHN2NzltMkRaM0I2OS9XbEpBdEdzZWllc1JPUXNNcWdpcW0xYW8yZFl4NWIw?=
 =?utf-8?B?amFXalEwYXhIVWJKMHNtWFMxYlJaUEcxQW80N01zQmdOdzQzcC9oMElkTkRV?=
 =?utf-8?B?RkJtd00zWU41aDJCeGpzRjZuZWUvSWpkcGFyb09NUE9DSndkUTRkTFFqYSs2?=
 =?utf-8?B?aGlKR251VXN0RXovYW95a2RMcTV2ckc2YjNLNUZ6bzlMSzViL3JyR1FJWU9S?=
 =?utf-8?B?S3VVSTdoN1ZodVFvTnp6Rmp6NVNmRWczcEZ0TlpXVGFpZFZVaTRMTVRLVkVK?=
 =?utf-8?B?YVlJa3Y4Z1QxNGgxTUUwckYyWGFyQVlaM2w4UkRjaEVDRVNKazFjRmZqT2xF?=
 =?utf-8?B?a05venphRFBJcUJ0dGtuTENraDhlZVAxY1FOY1dGZlBTd3FSMFFYcUhHa2pZ?=
 =?utf-8?B?MGVKclYzaUY2dDhoTWpSbEo5V1ZxbjgyUU92cWNTYytkQWxGVm1CbVhsSGJ0?=
 =?utf-8?B?ZnRGN21Xd09MZ3laR3BWZHhZNjV4Q0hnVCtLQTlLTmpKRDNiaktYeWVlS2J4?=
 =?utf-8?B?eEk2Y2JXR2ZKS3o3ek5VNWtDVHpQVStPNjFOUVQwb1E0RGFuM0VZbDR1U3dT?=
 =?utf-8?B?WkRyemJKTkp0QnVLNGhBb1FubGczQkVWVkg3WjFhZVV1c2kyeTVIUHRWSUEx?=
 =?utf-8?B?c2U0WWZKbVZHWnU1ZmZQV1dMVncvakhQUGRkbVM5Y3A3dmVOQ3RqQXhEdHBa?=
 =?utf-8?B?cFIwNS9BWG1CbFRjT1NMamxIZy9yR3ZmdmRIYlNORlBWSVBJSDIxOVpTVWxJ?=
 =?utf-8?B?eUh5UGh4Q0krSkJ2cGJsSnNaaUZzSTRDbWV4TVRXTEZUQnFIVmR4M2RldWlm?=
 =?utf-8?B?RlNPakg3d1I2clgyaEpYUzJNd3lPUFBLQ2MrVTN0L292VEtFTHNLeXNuNHp2?=
 =?utf-8?B?eDc0MmVjR3E0NXdkMm9td2IyajZ5YzIwbjA5b3dnSXZsMklFRWdNUExvWEhY?=
 =?utf-8?B?cVZBaEJpc3c2YW1UbGovdFJjRThSVndkNThLNFdHRHRJbU4yRUR4SUJSeFFk?=
 =?utf-8?B?THVySm9VS2ZIWlkwd3BPVnZ0d0pmdHRaV21lbCtJYzJPa1FqcVkra3grdTFw?=
 =?utf-8?B?RDMwc0hvaktBV0V5QnFGNGZCRWVyeWFXdFF2eEYyRUdUdnpzdW1EMHA3R1VJ?=
 =?utf-8?B?c3BYRDJma0x1M3VWZnZJTDM1QkZGUGRtUXMxb1lpci8xQmhhUGFRL2c4RVI1?=
 =?utf-8?B?aVl1T3Z4NndKL1hobkRCUUEwL2dVVnVNSDh3ZmpMbCtsMEZaeHNxMEJlb2Zm?=
 =?utf-8?B?VFliZ3JDMTBadCtqdjcraFZ4ZlFuQjVMdWUrMFIrUjRtRXdpemh3cjZiOHhT?=
 =?utf-8?B?RUNKZEM2eGlYV0hMT2RRdHB3OHhDWjJLYzJtS0tIeW5EaHdyMlJKeU9PM3Bx?=
 =?utf-8?B?Y2JuNkx4ZnYxNHhQRy8rOUIvODM0eEM5R2VJMlZmdmVjaGdnc3FGc3lqTTZL?=
 =?utf-8?B?Sno0VXlmYThuUnlQbW5RT2NMOTcyL01tRmR6WGlKTlhJSjIzU2tjT25DSzRU?=
 =?utf-8?B?YXVEZEJVMCtXVFhpWVRnaC9mQlE4ZmpwM25Sbm10Y0pHTXdTWmc3OGNsRUVE?=
 =?utf-8?B?V3laK0RLeWVjYjZmTVJjTW1ZaThmVFlaQTlSUy8wS2ZHUjZQRmg3TjQ0SC9W?=
 =?utf-8?B?dGdad3JJQzV2WHE5bFo4bVB1cC9UN216NWZQQXpLVno3VVZSQllBYUdOWjVh?=
 =?utf-8?B?SkZKYVFISDFRNHBZc29KKzhJVWxvZThiWkVtS2JHRVQ4OWdpVzFHdVRsTUpO?=
 =?utf-8?Q?kmWdH0dGYMvg2hMAEHPXDPx9U+fX9xHtmyZ7lr3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1V2THJ3S1VzUStsdEJMS2VmSlpyR21uZDdwcXMrdXI0M2t2TTlucG10T0VZ?=
 =?utf-8?B?ZEpIeFBoekVZU2lRUzRFbXNxN083RElOT21HS1R0QlR4TnZYR1lRSnRxVDhQ?=
 =?utf-8?B?TWxleHRuTmJkY09Nd1U1bTRnaGVPK3pLMW52WGFNbWJGOC9pK0lQeEJnL2dM?=
 =?utf-8?B?OGk2M2hXckVyNjM5KzZNK0l0NHVDelRtRjFDdW1jZlptNzZobG1QTlRLYU5o?=
 =?utf-8?B?eDFuSkZacGVNZ3ZwdXpDWGtYTUlPSVY1RThRRVRRTFZsM2lHMmM0V3VVcHow?=
 =?utf-8?B?Z2xLWFhxNEVwdSttYm03R1BwL09lNWxEOCtyYlRRMzdrVEJqUTVtSWczOGh2?=
 =?utf-8?B?b3RKLy9acGdoTjRSZWoxREdJQTBrRnBtU1RmZW9xVUUyNmwzZDd4d0pLRTVT?=
 =?utf-8?B?RmlOUUFkMTRXRUU4SnRQSFlyeVA2VWVkam9GMjh6ZURoWmZSTE5IV0h5bXJI?=
 =?utf-8?B?Uk5jSEJTcFRsclZMK2s3VXM0elRLekJmRjNTd2taQUN3QklDN3d1d0Irbkpx?=
 =?utf-8?B?U3d5aUhMblRyMHJhd2RlNFkxdDZhY3IxODUrY2lPUkhMVytBSk9MaTk5Tkl6?=
 =?utf-8?B?M0d0OXJCNnFPZWxGN0ZOd2RGK3NRNlVQTjFkOXRiY3RTLzVBR1B1SHI4NFFC?=
 =?utf-8?B?ZGhidkVkeGV1OTZScVhRUGdhNjhtSWlBSjhSZUJHc0hwcXRJUHVRbXBOMSts?=
 =?utf-8?B?WnRRc0M3ZWxJakV1TzNYSHNKMkNFZjJqQ2d1YTI5VTZ4eG9sUUh5QTJ3MG1r?=
 =?utf-8?B?VUdlKzdtLy9CeHZuNW9jUlVLSXoyaXU2aU4xL0RWbEdPTDBMMEhSZ3FkeVFq?=
 =?utf-8?B?Y3ZkS05hY3g5eDNadDR3Z0Urd3UwczdQblRSZlJtUjNFTHRCWWNFNng4WnRm?=
 =?utf-8?B?WEkwbCt1WGRJZFIvRG9McHZTemhnb1NITVlNNFpPOXp0SndzeWYwcU50U2J0?=
 =?utf-8?B?clhBRG9PZHU2cldBZFJHMHdKTVVibVBETkRva1FWRVpFOEtXQlo1RVQwcWpN?=
 =?utf-8?B?cWFpSFhhVEJMa1JNK1NYY1B6ZktEZ3o0TUxlaHRIR0l3bllHN1RjcDVjWTdi?=
 =?utf-8?B?VXYxSFl2SlVXNFdjTFlWYTBoTjN3L3B6aWFJd3kwc1BKRDBUN21mMHFjRGVr?=
 =?utf-8?B?ZUUzK255MEVHclIvbjljYzk4cmhOTFdrWGR0QWV5WHpka0tsVDlQVUdqamRt?=
 =?utf-8?B?SEkwWVMyNTk4TkdmNklKWlRUcUZacDZpajhFUzVHdm9sTU0zVmhqZ3BiOTdz?=
 =?utf-8?B?WEQxblBmY2tKNTYwbVUyY3JtY1VVVkg1djIrWmNtcWtJcFRpaXF0bEcyQ0hG?=
 =?utf-8?B?bytRRDI4RzF1cGFVSnNGSGlBOGg3NCt6VzMwVU9GM05EYXgzUlNKNmI4N3I2?=
 =?utf-8?B?Mm9ZSTh6UHQrbU80ZzVBc2phcFkxL0w1Wjh5VnZkcmVBbVFzS3dReGljK0JD?=
 =?utf-8?B?YU11V291ZjJRbUZtdWw0eGZuMVZNQkQrMC9PV0k4M2dTUE56MmhYdTU3c0FZ?=
 =?utf-8?B?eWo1Szc5QzNDZ3Z3NU9mVjIvVUVVSnNYNkllYXhweTMwQzRFWXgwZnZIMGM0?=
 =?utf-8?B?dWhaVDY3Q1VwY1JRTzZySXpEdElGSng0NGFudkc4QzBZOERNUXJEUUo0L003?=
 =?utf-8?B?M3lYSlhkRTdMYUR2LzlacUdMTW1EeUVzK05MZWxwcUYvQjRMMWVaVWVRdmJv?=
 =?utf-8?B?eTkrTkcxY2xQMWtvNk9ZZ25mMndEU056QUpmazhWVXdrRXlQSVlQRFcvdk84?=
 =?utf-8?B?QUI2angyZXN1b3UwZ3dEUkRTcWFFN29wUzlCSWswSnJiL0xhcGhjaTU5Ty9G?=
 =?utf-8?B?WkYyNGlidWpvb244VTZHRndnK1daQmpvY3BsYlg2V1loVWZ1YnNybHRxdkFy?=
 =?utf-8?B?Nm9wVUJGVWxJOEU2V3MzRGd2RjN3Z25OcXFYWlhpUTFRaklSbWN5UVNuVE8w?=
 =?utf-8?B?dGtTcTN1TzhqSGQ2Y05oNjltRXJ3NDFtT0tsVkY0SnFFQTV6RFNCM3ZTNk13?=
 =?utf-8?B?SUdra3RzRjd3K0RscnBUYzVFckFJTmhZU0xQMTArcWd6cnk3aFJIQSs2aU55?=
 =?utf-8?B?SDY2c0lwTkRiMTFwYXpobWxvQjRpb1dsYlZxWGlyYkpuV3lzelVxdnBNMG8w?=
 =?utf-8?B?UllsRU9JcmpUTkt5TVdpM2hWQ2EyUTNlemFoNE1SQk1JeG5YUkZzTXlnbnpm?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f46ff9bf-6247-4a52-050f-08dcf53f2c21
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 21:51:25.4462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lpjpm+PrdnrSLgXcW4jGDb0w+DsQi3EgAsRb5u1vRJuEndwQGxDvdcDYaVjWSkRjNvPcctCIxHPjzPBcklHxE8iTTcqRY2+O9FG4uubvCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7745
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

Drivers could leverage the fact that the VF BAR MMIO reservation is
created for total number of VFs supported by the device by resizing the
BAR to larger size when smaller number of VFs is enabled.

Add a pci_iov_vf_bar_set_size() function to control the size and a
pci_iov_vf_bar_get_sizes() helper to get the VF BAR sizes that will
allow up to num_vfs to be successfully enabled with the current
underlying reservation size.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c   | 80 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h |  6 ++++
 2 files changed, 86 insertions(+)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 5de828e5a26ea..de8d473459440 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -1281,3 +1281,83 @@ int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn)
 	return nr_virtfn;
 }
 EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
+
+/**
+ * pci_iov_vf_bar_set_size - set a new size for a VF BAR
+ * @dev: the PCI device
+ * @resno: the resource number
+ * @size: new size as defined in the spec (0=1MB, 19=512GB)
+ *
+ * Set the new size of a VF BAR that supports VF resizable BAR capability.
+ * Unlike pci_resize_resource(), this does not cause the resource that
+ * reserves the MMIO space (originally up to total_VFs) to be resized, which
+ * means that following calls to pci_enable_sriov() can fail if the resources
+ * no longer fit.
+ *
+ * Returns 0 on success, or negative on failure.
+ *
+ */
+int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
+{
+	int ret;
+	u32 sizes;
+
+	if (!pci_resource_is_iov(resno))
+		return -EINVAL;
+
+	if (pci_iov_is_memory_decoding_enabled(dev))
+		return -EBUSY;
+
+	sizes = pci_rebar_get_possible_sizes(dev, resno);
+	if (!sizes)
+		return -ENOTSUPP;
+
+	if (!(sizes & BIT(size)))
+		return -EINVAL;
+
+	ret = pci_rebar_set_size(dev, resno, size);
+	if (ret)
+		return ret;
+
+	pci_iov_resource_set_size(dev, resno, pci_rebar_size_to_bytes(size));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
+
+/**
+ * pci_iov_vf_bar_get_sizes - get VF BAR sizes that allow to create up to num_vfs
+ * @dev: the PCI device
+ * @resno: the resource number
+ * @num_vfs: number of VFs
+ *
+ * Get the sizes of a VF resizable BAR that can fit up to num_vfs within the
+ * resource that reserves the MMIO space (originally up to total_VFs) the as
+ * bitmask defined in the spec (bit 0=1MB, bit 19=512GB).
+ *
+ * Returns 0 if BAR isn't resizable.
+ *
+ */
+u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
+{
+	resource_size_t size;
+	u32 sizes;
+	int i;
+
+	sizes = pci_rebar_get_possible_sizes(dev, resno);
+	if (!sizes)
+		return 0;
+
+	while (sizes > 0) {
+		i = __fls(sizes);
+		size = pci_rebar_size_to_bytes(i);
+
+		if (size * num_vfs <= pci_resource_len(dev, resno))
+			break;
+
+		sizes &= ~BIT(i);
+	}
+
+	return sizes;
+}
+EXPORT_SYMBOL_GPL(pci_iov_vf_bar_get_sizes);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 573b4c4c2be61..1b9e7e3cab0ce 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2371,6 +2371,8 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
 int pci_sriov_get_totalvfs(struct pci_dev *dev);
 int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
 resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
+int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size);
+u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs);
 void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
 
 /* Arch may override these (weak) */
@@ -2423,6 +2425,10 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
 #define pci_sriov_configure_simple	NULL
 static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 { return 0; }
+static inline int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
+{ return -ENODEV; }
+static inline u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
+{ return 0; }
 static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
 #endif
 
-- 
2.47.0

